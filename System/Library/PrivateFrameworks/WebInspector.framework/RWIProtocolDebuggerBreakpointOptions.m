@interface RWIProtocolDebuggerBreakpointOptions
- (BOOL)autoContinue;
- (NSArray)actions;
- (NSString)condition;
- (int)ignoreCount;
- (void)setActions:(id)a3;
- (void)setAutoContinue:(BOOL)a3;
- (void)setCondition:(id)a3;
- (void)setIgnoreCount:(int)a3;
@end

@implementation RWIProtocolDebuggerBreakpointOptions

- (void)setCondition:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointOptions;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"condition"];
}

- (NSString)condition
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDebuggerBreakpointOptions;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"condition"];
  return (NSString *)v2;
}

- (void)setActions:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    uint64_t v6 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = (void *)MEMORY[0x263EFF940];
          v10 = (objc_class *)objc_opt_class();
          v11 = NSStringFromClass(v10);
          [v9 raise:v6, @"array should contain objects of type '%@', found bad value: %@", v11, v8 format];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  Inspector::toJSONObjectArray((Inspector *)v3, (uint64_t *)&v15);
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDebuggerBreakpointOptions;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"actions"];
  v12 = v15;
  v15 = 0;
  if (v12)
  {
    if (*v12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v12;
    }
  }
}

- (NSArray)actions
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDebuggerBreakpointOptions;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"actions"];
  v2 = Inspector::toObjCArray<RWIProtocolDebuggerBreakpointAction>(&v6);
  id v3 = v6;
  uint64_t v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v3;
    }
  }
  return (NSArray *)v2;
}

- (void)setAutoContinue:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointOptions;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"autoContinue"];
}

- (BOOL)autoContinue
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointOptions;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"autoContinue"];
}

- (void)setIgnoreCount:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointOptions;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"ignoreCount"];
}

- (int)ignoreCount
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointOptions;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"ignoreCount"];
}

@end