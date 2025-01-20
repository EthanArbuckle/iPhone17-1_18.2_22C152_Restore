@interface TCVegaLogProxyHandler
- (BOOL)setPropertyOnObject:(id)a3 named:(id)a4 toValue:(id)a5;
- (id)getPropertyOnObject:(id)a3 named:(id)a4;
@end

@implementation TCVegaLogProxyHandler

- (id)getPropertyOnObject:(id)a3 named:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = +[TCVegaLogger instance];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v6 UTF8String];
    id v9 = [v5 debugDescription];
    *(_DWORD *)buf = 136315394;
    uint64_t v26 = v8;
    __int16 v27 = 2080;
    uint64_t v28 = [v9 UTF8String];
    _os_log_impl(&dword_223D44000, v7, OS_LOG_TYPE_INFO, "Getting property \"%s\" on LogProxy wrapped object %s", buf, 0x16u);
  }
  v10 = [v5 objectForKeyedSubscript:v6];
  v11 = v10;
  if (v10 && ([v10 isUndefined] & 1) == 0)
  {
    v14 = [v5 context];
    [v14 setObject:v11 forKeyedSubscript:@"__tmp_propertyAccess"];
    v16 = [v14 evaluateScript:@"typeof __tmp_propertyAccess"];
    v17 = [v16 toString];
    int v18 = [v17 isEqualToString:@"function"];

    if (v18)
    {
      id v24 = v5;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
      uint64_t v20 = [v11 invokeMethod:@"bind" withArguments:v19];

      v11 = (void *)v20;
    }
    if ([v11 isObject]
      && ([v6 isEqualToString:@"__LogProxy_wrapped"] & 1) == 0)
    {
      uint64_t v21 = +[TCVegaLogProxy wrap:v11];

      v11 = (void *)v21;
    }
    id v15 = v11;
    v11 = v15;
  }
  else
  {
    v12 = +[TCVegaLogger instance];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[TCVegaLogProxyHandler getPropertyOnObject:named:](v6, v5, v12);
    }

    v13 = (void *)MEMORY[0x263F10390];
    v14 = [v5 context];
    id v15 = [v13 valueWithUndefinedInContext:v14];
  }
  v22 = v15;

  return v22;
}

- (BOOL)setPropertyOnObject:(id)a3 named:(id)a4 toValue:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[TCVegaLogger instance];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [v8 UTF8String];
    id v12 = [v7 debugDescription];
    uint64_t v13 = [v12 UTF8String];
    id v14 = [v9 debugDescription];
    int v23 = 136315650;
    uint64_t v24 = v11;
    __int16 v25 = 2080;
    uint64_t v26 = v13;
    __int16 v27 = 2080;
    uint64_t v28 = [v14 UTF8String];
    _os_log_impl(&dword_223D44000, v10, OS_LOG_TYPE_INFO, "Setting property \"%s\" on LogProxy wrapped object %s to value \"%s\"", (uint8_t *)&v23, 0x20u);
  }
  int v15 = [v7 hasProperty:v8];
  if (v15)
  {
    [v7 setObject:v9 forKeyedSubscript:v8];
  }
  else
  {
    v16 = +[TCVegaLogger instance];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [v8 UTF8String];
      id v19 = [v7 debugDescription];
      uint64_t v20 = [v19 UTF8String];
      id v21 = [v9 debugDescription];
      uint64_t v22 = [v21 UTF8String];
      int v23 = 136315650;
      uint64_t v24 = v18;
      __int16 v25 = 2080;
      uint64_t v26 = v20;
      __int16 v27 = 2080;
      uint64_t v28 = v22;
      _os_log_error_impl(&dword_223D44000, v16, OS_LOG_TYPE_ERROR, "Set for missing property \"%s\" on LogProxy wrapped object %s to value %s", (uint8_t *)&v23, 0x20u);
    }
  }

  return v15;
}

- (void)getPropertyOnObject:(NSObject *)a3 named:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 UTF8String];
  id v6 = [a2 debugDescription];
  int v7 = 136315394;
  uint64_t v8 = v5;
  __int16 v9 = 2080;
  uint64_t v10 = [v6 UTF8String];
  _os_log_error_impl(&dword_223D44000, a3, OS_LOG_TYPE_ERROR, "Get for missing property \"%s\" on LogProxy wrapped object %s", (uint8_t *)&v7, 0x16u);
}

@end