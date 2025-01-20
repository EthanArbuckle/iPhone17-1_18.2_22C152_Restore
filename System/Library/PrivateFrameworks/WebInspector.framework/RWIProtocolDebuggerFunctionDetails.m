@interface RWIProtocolDebuggerFunctionDetails
- (NSArray)scopeChain;
- (NSString)displayName;
- (NSString)name;
- (RWIProtocolDebuggerFunctionDetails)initWithLocation:(id)a3;
- (RWIProtocolDebuggerLocation)location;
- (void)setDisplayName:(id)a3;
- (void)setLocation:(id)a3;
- (void)setName:(id)a3;
- (void)setScopeChain:(id)a3;
@end

@implementation RWIProtocolDebuggerFunctionDetails

- (RWIProtocolDebuggerFunctionDetails)initWithLocation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolDebuggerFunctionDetails;
  v5 = [(RWIProtocolJSONObject *)&v8 init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"location" format];
    }
    [(RWIProtocolDebuggerFunctionDetails *)v5 setLocation:v4];
    v6 = v5;
  }

  return v5;
}

- (void)setLocation:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerFunctionDetails;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"location"];
}

- (RWIProtocolDebuggerLocation)location
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDebuggerFunctionDetails;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"location"];
  if (v3)
  {
    id v4 = [RWIProtocolDebuggerLocation alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDebuggerFunctionDetails;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"location"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    objc_super v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v8;
      }
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v9;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerFunctionDetails;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"name"];
}

- (NSString)name
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDebuggerFunctionDetails;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"name"];
  return (NSString *)v2;
}

- (void)setDisplayName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerFunctionDetails;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"displayName"];
}

- (NSString)displayName
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDebuggerFunctionDetails;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"displayName"];
  return (NSString *)v2;
}

- (void)setScopeChain:(id)a3
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
          objc_super v11 = NSStringFromClass(v10);
          [v9 raise:v6, @"array should contain objects of type '%@', found bad value: %@", v11, v8 format];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  Inspector::toJSONObjectArray((Inspector *)v3, (uint64_t *)&v15);
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDebuggerFunctionDetails;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"scopeChain"];
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

- (NSArray)scopeChain
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDebuggerFunctionDetails;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"scopeChain"];
  v2 = Inspector::toObjCArray<RWIProtocolDebuggerScope>(&v6);
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

@end