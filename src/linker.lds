BUN_1.0 {
    global:
	napi*;
	node_api_*;
	extern "C++" {
		v8::*;
		node::*;
	};
    local:
	*;
};
