@interface RWIProtocolCSSStyle
- (NSArray)cssProperties;
- (NSArray)shorthandEntries;
- (NSString)cssText;
- (NSString)height;
- (NSString)width;
- (RWIProtocolCSSSourceRange)range;
- (RWIProtocolCSSStyle)initWithCssProperties:(id)a3 shorthandEntries:(id)a4;
- (RWIProtocolCSSStyleId)styleId;
- (void)setCssProperties:(id)a3;
- (void)setCssText:(id)a3;
- (void)setHeight:(id)a3;
- (void)setRange:(id)a3;
- (void)setShorthandEntries:(id)a3;
- (void)setStyleId:(id)a3;
- (void)setWidth:(id)a3;
@end

@implementation RWIProtocolCSSStyle

- (RWIProtocolCSSStyle)initWithCssProperties:(id)a3 shorthandEntries:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v26 = a4;
  v38.receiver = self;
  v38.super_class = (Class)RWIProtocolCSSStyle;
  v28 = [(RWIProtocolJSONObject *)&v38 init];
  if (v28)
  {
    v6 = (uint64_t *)MEMORY[0x263EFF4A0];
    if (!v27) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"cssProperties" format];
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v27;
    uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v35;
      uint64_t v9 = *v6;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v34 + 1) + 8 * v10);
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
        uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v7);
    }

    if (!v26) {
      [MEMORY[0x263EFF940] raise:*v6, @"required property '%@' cannot be nil", @"shorthandEntries" format];
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v15 = v26;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v31;
      uint64_t v18 = *v6;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * v19);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v21 = (void *)MEMORY[0x263EFF940];
            v22 = (objc_class *)objc_opt_class();
            v23 = NSStringFromClass(v22);
            [v21 raise:v18, @"array should contain objects of type '%@', found bad value: %@", v23, v20 format];
          }
          ++v19;
        }
        while (v16 != v19);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v16);
    }

    [(RWIProtocolCSSStyle *)v28 setCssProperties:obj];
    [(RWIProtocolCSSStyle *)v28 setShorthandEntries:v15];
    v24 = v28;
  }

  return v28;
}

- (void)setStyleId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"styleId"];
}

- (RWIProtocolCSSStyleId)styleId
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSStyle;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"styleId"];
  if (v3)
  {
    v4 = [RWIProtocolCSSStyleId alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSStyle;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"styleId"];
    [v5 toJSONObject];
    v6 = v12;
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

- (void)setCssProperties:(id)a3
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
  v14.super_class = (Class)RWIProtocolCSSStyle;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"cssProperties"];
  v12 = v15;
  id v15 = 0;
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

- (NSArray)cssProperties
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSStyle;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"cssProperties"];
  v2 = Inspector::toObjCArray<RWIProtocolCSSProperty>(&v6);
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

- (void)setShorthandEntries:(id)a3
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
  v14.super_class = (Class)RWIProtocolCSSStyle;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"shorthandEntries"];
  v12 = v15;
  id v15 = 0;
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

- (NSArray)shorthandEntries
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSStyle;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"shorthandEntries"];
  v2 = Inspector::toObjCArray<RWIProtocolCSSShorthandEntry>(&v6);
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

- (void)setCssText:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"cssText"];
}

- (NSString)cssText
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSStyle;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"cssText"];
  return (NSString *)v2;
}

- (void)setRange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"range"];
}

- (RWIProtocolCSSSourceRange)range
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSStyle;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"range"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolCSSSourceRange alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSStyle;
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

- (void)setWidth:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"width"];
}

- (NSString)width
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSStyle;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"width"];
  return (NSString *)v2;
}

- (void)setHeight:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyle;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"height"];
}

- (NSString)height
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSStyle;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"height"];
  return (NSString *)v2;
}

@end