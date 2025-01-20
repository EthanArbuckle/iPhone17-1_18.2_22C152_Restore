@interface RWIProtocolCSSStyleSheetBody
- (NSArray)rules;
- (NSString)styleSheetId;
- (NSString)text;
- (RWIProtocolCSSStyleSheetBody)initWithStyleSheetId:(id)a3 rules:(id)a4;
- (void)setRules:(id)a3;
- (void)setStyleSheetId:(id)a3;
- (void)setText:(id)a3;
@end

@implementation RWIProtocolCSSStyleSheetBody

- (RWIProtocolCSSStyleSheetBody)initWithStyleSheetId:(id)a3 rules:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v20 = a4;
  v25.receiver = self;
  v25.super_class = (Class)RWIProtocolCSSStyleSheetBody;
  v6 = [(RWIProtocolJSONObject *)&v25 init];
  if (v6)
  {
    if (!v19) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"styleSheetId" format];
    }
    if (!v20) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"rules" format];
    }
    v18 = v6;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v20;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      uint64_t v10 = *MEMORY[0x263EFF4A0];
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v13 = (void *)MEMORY[0x263EFF940];
            v14 = (objc_class *)objc_opt_class();
            v15 = NSStringFromClass(v14);
            [v13 raise:v10, @"array should contain objects of type '%@', found bad value: %@", v15, v12 format];
          }
          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    v6 = v18;
    [(RWIProtocolCSSStyleSheetBody *)v18 setStyleSheetId:v19];
    [(RWIProtocolCSSStyleSheetBody *)v18 setRules:v7];
    v16 = v18;
  }

  return v6;
}

- (void)setStyleSheetId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetBody;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"styleSheetId"];
}

- (NSString)styleSheetId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSStyleSheetBody;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"styleSheetId"];
  return (NSString *)v2;
}

- (void)setRules:(id)a3
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
  v14.super_class = (Class)RWIProtocolCSSStyleSheetBody;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"rules"];
  uint64_t v12 = v15;
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

- (NSArray)rules
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSStyleSheetBody;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"rules"];
  v2 = Inspector::toObjCArray<RWIProtocolCSSRule>(&v6);
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
  v3.super_class = (Class)RWIProtocolCSSStyleSheetBody;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"text"];
}

- (NSString)text
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSStyleSheetBody;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"text"];
  return (NSString *)v2;
}

@end