@interface RWIProtocolDebuggerCallFrame
- (BOOL)isTailDeleted;
- (NSArray)scopeChain;
- (NSString)callFrameId;
- (NSString)functionName;
- (RWIProtocolDebuggerCallFrame)initWithCallFrameId:(id)a3 functionName:(id)a4 location:(id)a5 scopeChain:(id)a6 thisObject:(id)a7 isTailDeleted:(BOOL)a8;
- (RWIProtocolDebuggerLocation)location;
- (RWIProtocolRuntimeRemoteObject)thisObject;
- (void)setCallFrameId:(id)a3;
- (void)setFunctionName:(id)a3;
- (void)setIsTailDeleted:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setScopeChain:(id)a3;
- (void)setThisObject:(id)a3;
@end

@implementation RWIProtocolDebuggerCallFrame

- (RWIProtocolDebuggerCallFrame)initWithCallFrameId:(id)a3 functionName:(id)a4 location:(id)a5 scopeChain:(id)a6 thisObject:(id)a7 isTailDeleted:(BOOL)a8
{
  BOOL v24 = a8;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v27 = a4;
  id v28 = a5;
  id v29 = a6;
  id v25 = a7;
  v35.receiver = self;
  v35.super_class = (Class)RWIProtocolDebuggerCallFrame;
  v30 = [(RWIProtocolJSONObject *)&v35 init];
  if (v30)
  {
    if (!v26) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"callFrameId" format];
    }
    if (!v27) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"functionName" format];
    }
    if (!v28) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"location" format];
    }
    if (!v29) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"scopeChain" format];
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v29;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v32;
      uint64_t v16 = *MEMORY[0x263EFF4A0];
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v19 = (void *)MEMORY[0x263EFF940];
            v20 = (objc_class *)objc_opt_class();
            v21 = NSStringFromClass(v20);
            [v19 raise:v16, @"array should contain objects of type '%@', found bad value: %@", v21, v18 format];
          }
          ++v17;
        }
        while (v14 != v17);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v14);
    }

    if (!v25) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"thisObject" format];
    }
    [(RWIProtocolDebuggerCallFrame *)v30 setCallFrameId:v26];
    [(RWIProtocolDebuggerCallFrame *)v30 setFunctionName:v27];
    [(RWIProtocolDebuggerCallFrame *)v30 setLocation:v28];
    [(RWIProtocolDebuggerCallFrame *)v30 setScopeChain:v13];
    [(RWIProtocolDebuggerCallFrame *)v30 setThisObject:v25];
    [(RWIProtocolDebuggerCallFrame *)v30 setIsTailDeleted:v24];
    v22 = v30;
  }

  return v30;
}

- (void)setCallFrameId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"callFrameId"];
}

- (NSString)callFrameId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDebuggerCallFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"callFrameId"];
  return (NSString *)v2;
}

- (void)setFunctionName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"functionName"];
}

- (NSString)functionName
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDebuggerCallFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"functionName"];
  return (NSString *)v2;
}

- (void)setLocation:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"location"];
}

- (RWIProtocolDebuggerLocation)location
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDebuggerCallFrame;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"location"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolDebuggerLocation alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDebuggerCallFrame;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"location"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    id v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    v8 = v13;
    id v13 = 0;
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
  v14.super_class = (Class)RWIProtocolDebuggerCallFrame;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"scopeChain"];
  v12 = v15;
  uint64_t v15 = 0;
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
  v5.super_class = (Class)RWIProtocolDebuggerCallFrame;
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

- (void)setThisObject:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"this"];
}

- (RWIProtocolRuntimeRemoteObject)thisObject
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDebuggerCallFrame;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"this"];
  if (v3)
  {
    uint64_t v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDebuggerCallFrame;
    objc_super v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"this"];
    [v5 toJSONObject];
    uint64_t v6 = v12;
    ++*v12;
    id v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    uint64_t v8 = v13;
    id v13 = 0;
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

- (void)setIsTailDeleted:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isTailDeleted"];
}

- (BOOL)isTailDeleted
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isTailDeleted"];
}

@end