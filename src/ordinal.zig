pub fn ordinal(comptime t: type) type {
    return struct {
        const ordinalThis = @This();
        is_zero_based: bool = true,
        zero_based_value: t,

        pub fn zero_based(this: ordinalThis) t {
            return this.zero_based_value;
        }

        pub fn one_based(this: ordinalThis) t {
            return this.zero_based_value + 1;
        }

        pub fn to_zero_based(this: ordinalThis) ordinalThis {
            return ordinalThis{
                .is_zero_based = true,
                .zero_based_value = this.zero_based_value,
            };
        }

        pub fn to_one_based(this: ordinalThis) ordinalThis {
            return ordinalThis{
                .is_zero_based = false,
                .zero_based_value = this.zero_based_value,
            };
        }

        pub fn from_zero_based(value: t) ordinalThis {
            return ordinalThis{ .zero_based_value = value };
        }

        pub fn from_sum(a: ordinalThis, b: ordinalThis) ordinalThis {
            return ordinalThis{ .zero_based_value = a.zero_based_value + b.zero_based_value };
        }

        pub fn shift(a: ordinalThis, count: t) ordinalThis {
            return ordinalThis{ .zero_based_value = a.zero_based_value + count };
        }

        pub fn delta(a: ordinalThis, b: ordinalThis) t {
            return a.zero_based_value -| b.zero_based_value;
        }
    };
}

pub const o32: type = ordinal(i32);
