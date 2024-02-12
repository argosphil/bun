console.log(Bun.inspect);
console.log(Bun.inspect.setCustomMap);
console.log(Bun.inspect.customMap);
let map = new WeakMap();
console.log(Bun.inspect.setCustomMap(map));
console.log(Bun.inspect.customMap);
map.set(Bun, () => { return "BUN!" });
console.log(map.get(Bun));
console.log(Bun.inspect(Bun));
let proxy = new Proxy({}, {
    get() { return "here" },
    set() { return },
});
map.set(proxy, () => { return "What's up, I'm a proxy!" });
console.log(Bun.inspect(proxy));
