@interface RWIProtocolConsoleStackTrace
- (BOOL)topCallFrameIsBoundary;
- (BOOL)truncated;
- (NSArray)callFrames;
- (RWIProtocolConsoleStackTrace)initWithCallFrames:(id)a3;
- (RWIProtocolConsoleStackTrace)parentStackTrace;
- (void)setCallFrames:(id)a3;
- (void)setParentStackTrace:(id)a3;
- (void)setTopCallFrameIsBoundary:(BOOL)a3;
- (void)setTruncated:(BOOL)a3;
@end

@implementation RWIProtocolConsoleStackTrace

- (RWIProtocolConsoleStackTrace)initWithCallFrames:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v16 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RWIProtocolConsoleStackTrace;
  v4 = [(RWIProtocolJSONObject *)&v21 init];
  if (v4)
  {
    if (!v16) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"callFrames" format];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v16;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      uint64_t v8 = *MEMORY[0x263EFF4A0];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v11 = (void *)MEMORY[0x263EFF940];
            v12 = (objc_class *)objc_opt_class();
            v13 = NSStringFromClass(v12);
            [v11 raise:v8, @"array should contain objects of type '%@', found bad value: %@", v13, v10 format];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v6);
    }

    [(RWIProtocolConsoleStackTrace *)v4 setCallFrames:v5];
    v14 = v4;
  }

  return v4;
}

- (void)setCallFrames:(id)a3
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
          uint64_t v10 = (objc_class *)objc_opt_class();
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
  v14.super_class = (Class)RWIProtocolConsoleStackTrace;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"callFrames"];
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

- (NSArray)callFrames
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolConsoleStackTrace;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"callFrames"];
  v2 = Inspector::toObjCArray<RWIProtocolConsoleCallFrame>(&v6);
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

- (void)setTopCallFrameIsBoundary:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleStackTrace;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"topCallFrameIsBoundary"];
}

- (BOOL)topCallFrameIsBoundary
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleStackTrace;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"topCallFrameIsBoundary"];
}

- (void)setTruncated:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleStackTrace;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"truncated"];
}

- (BOOL)truncated
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleStackTrace;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"truncated"];
}

- (void)setParentStackTrace:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleStackTrace;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"parentStackTrace"];
}

- (RWIProtocolConsoleStackTrace)parentStackTrace
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolConsoleStackTrace;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"parentStackTrace"];
  if (v3)
  {
    uint64_t v4 = [RWIProtocolConsoleStackTrace alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolConsoleStackTrace;
    objc_super v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"parentStackTrace"];
    [v5 toJSONObject];
    uint64_t v6 = v12;
    ++*v12;
    v13 = v6;
    uint64_t v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    uint64_t v8 = v13;
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
    uint64_t v7 = 0;
  }

  return v7;
}

@end