@interface TCVegaLogProxy
+ (id)tryUnwrap:(id)a3;
+ (id)unwrap:(id)a3;
+ (id)wrap:(id)a3;
+ (id)wrap:(id)a3 withHandler:(id)a4;
+ (id)wrapObject:(id)a3;
@end

@implementation TCVegaLogProxy

+ (id)wrap:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(TCVegaLogProxyHandler);
  v5 = +[TCVegaLogProxy wrap:v3 withHandler:v4];

  return v5;
}

+ (id)wrapObject:(id)a3
{
  id v3 = (void *)MEMORY[0x263F10390];
  v4 = (void *)MEMORY[0x263F10378];
  id v5 = a3;
  v6 = [v4 currentContext];
  v7 = [v3 valueWithObject:v5 inContext:v6];

  v8 = +[TCVegaLogProxy wrap:v7];

  return v8;
}

+ (id)wrap:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 context];
  [v7 setObject:v6 forKeyedSubscript:@"__tmp_instance"];

  v8 = [v6 context];
  [v8 setObject:v5 forKeyedSubscript:@"__tmp_handler"];

  v9 = [v6 context];
  v10 = [v9 evaluateScript:@"new Proxy(__tmp_instance, __tmp_handler);"];
  v11 = [v6 context];
  [v11 setObject:v10 forKeyedSubscript:@"__tmp_proxy"];

  v12 = [v6 context];
  id v13 = (id)[v12 evaluateScript:@"Object.defineProperty(__tmp_proxy, '__LogProxy_wrapped', {  enumerable: true, value: __tmp_instance,});"];

  v14 = [v6 context];

  v15 = [v14 objectForKeyedSubscript:@"__tmp_proxy"];

  return v15;
}

+ (id)tryUnwrap:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v3 hasProperty:@"__LogProxy_wrapped"])
  {
    id v4 = [v3 objectForKeyedSubscript:@"__LogProxy_wrapped"];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

+ (id)unwrap:(id)a3
{
  id v3 = a3;
  if ([v3 hasProperty:@"__LogProxy_wrapped"])
  {
    id v4 = [v3 objectForKeyedSubscript:@"__LogProxy_wrapped"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end