@interface RWIProtocolCSSSelectorList
- (NSArray)selectors;
- (NSString)text;
- (RWIProtocolCSSSelectorList)initWithSelectors:(id)a3 text:(id)a4;
- (RWIProtocolCSSSourceRange)range;
- (void)setRange:(id)a3;
- (void)setSelectors:(id)a3;
- (void)setText:(id)a3;
@end

@implementation RWIProtocolCSSSelectorList

- (RWIProtocolCSSSelectorList)initWithSelectors:(id)a3 text:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v17 = a4;
  v24.receiver = self;
  v24.super_class = (Class)RWIProtocolCSSSelectorList;
  v19 = [(RWIProtocolJSONObject *)&v24 init];
  if (v19)
  {
    if (!v18) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"selectors" format];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v18;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      uint64_t v9 = *MEMORY[0x263EFF4A0];
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v12 = (void *)MEMORY[0x263EFF940];
            v13 = (objc_class *)objc_opt_class();
            v14 = NSStringFromClass(v13);
            [v12 raise:v9, @"array should contain objects of type '%@', found bad value: %@", v14, v11 format];
          }
          ++v10;
        }
        while (v7 != v10);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    if (!v17) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"text" format];
    }
    [(RWIProtocolCSSSelectorList *)v19 setSelectors:v6];
    [(RWIProtocolCSSSelectorList *)v19 setText:v17];
    v15 = v19;
  }

  return v19;
}

- (void)setSelectors:(id)a3
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
          uint64_t v9 = (void *)MEMORY[0x263EFF940];
          uint64_t v10 = (objc_class *)objc_opt_class();
          uint64_t v11 = NSStringFromClass(v10);
          [v9 raise:v6, @"array should contain objects of type '%@', found bad value: %@", v11, v8 format];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  Inspector::toJSONObjectArray((Inspector *)v3, (uint64_t *)&v15);
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSSelectorList;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"selectors"];
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

- (NSArray)selectors
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSSelectorList;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"selectors"];
  v2 = Inspector::toObjCArray<RWIProtocolCSSSelector>(&v6);
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

- (void)setText:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSelectorList;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"text"];
}

- (NSString)text
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSSelectorList;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"text"];
  return (NSString *)v2;
}

- (void)setRange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSelectorList;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"range"];
}

- (RWIProtocolCSSSourceRange)range
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSSelectorList;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"range"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolCSSSourceRange alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSSelectorList;
    objc_super v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"range"];
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
    uint64_t v9 = v12;
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