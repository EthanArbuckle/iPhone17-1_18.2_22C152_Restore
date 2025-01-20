@interface RWIProtocolCSSRule
- (BOOL)isImplicitlyNested;
- (NSArray)groupings;
- (NSString)sourceURL;
- (RWIProtocolCSSRule)initWithSelectorList:(id)a3 sourceLine:(int)a4 origin:(int64_t)a5 style:(id)a6;
- (RWIProtocolCSSRuleId)ruleId;
- (RWIProtocolCSSSelectorList)selectorList;
- (RWIProtocolCSSStyle)style;
- (int)sourceLine;
- (int64_t)origin;
- (void)setGroupings:(id)a3;
- (void)setIsImplicitlyNested:(BOOL)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setRuleId:(id)a3;
- (void)setSelectorList:(id)a3;
- (void)setSourceLine:(int)a3;
- (void)setSourceURL:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation RWIProtocolCSSRule

- (RWIProtocolCSSRule)initWithSelectorList:(id)a3 sourceLine:(int)a4 origin:(int64_t)a5 style:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)RWIProtocolCSSRule;
  v12 = [(RWIProtocolJSONObject *)&v15 init];
  if (v12)
  {
    if (!v10) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"selectorList" format];
    }
    if (!v11) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"style" format];
    }
    [(RWIProtocolCSSRule *)v12 setSelectorList:v10];
    [(RWIProtocolCSSRule *)v12 setSourceLine:v8];
    [(RWIProtocolCSSRule *)v12 setOrigin:a5];
    [(RWIProtocolCSSRule *)v12 setStyle:v11];
    v13 = v12;
  }

  return v12;
}

- (void)setRuleId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRule;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"ruleId"];
}

- (RWIProtocolCSSRuleId)ruleId
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSRule;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"ruleId"];
  if (v3)
  {
    v4 = [RWIProtocolCSSRuleId alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSRule;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"ruleId"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
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
    v7 = 0;
  }

  return v7;
}

- (void)setSelectorList:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRule;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"selectorList"];
}

- (RWIProtocolCSSSelectorList)selectorList
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSRule;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"selectorList"];
  if (v3)
  {
    v4 = [RWIProtocolCSSSelectorList alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSRule;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"selectorList"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
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
    v7 = 0;
  }

  return v7;
}

- (void)setSourceURL:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRule;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"sourceURL"];
}

- (NSString)sourceURL
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSRule;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"sourceURL"];
  return (NSString *)v2;
}

- (void)setSourceLine:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRule;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"sourceLine"];
}

- (int)sourceLine
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRule;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"sourceLine"];
}

- (void)setOrigin:(int64_t)a3
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  objc_super v4 = v7;
  if (v7) {
    v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    v5 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolCSSRule;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"origin"];

  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
}

- (int64_t)origin
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolCSSRule;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"origin"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    objc_super v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    objc_super v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 12; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 12);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v7)
  {
    if (*v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v7 -= 2;
    }
  }
  return (int64_t)v6;
}

- (void)setStyle:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRule;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"style"];
}

- (RWIProtocolCSSStyle)style
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSRule;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"style"];
  if (v3)
  {
    unint64_t v4 = [RWIProtocolCSSStyle alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSRule;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"style"];
    [v5 toJSONObject];
    objc_super v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
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
    objc_super v9 = v12;
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

- (void)setGroupings:(id)a3
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
          objc_super v9 = (void *)MEMORY[0x263EFF940];
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
  v14.super_class = (Class)RWIProtocolCSSRule;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"groupings"];
  v12 = v15;
  objc_super v15 = 0;
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

- (NSArray)groupings
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSRule;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"groupings"];
  id v2 = Inspector::toObjCArray<RWIProtocolCSSGrouping>(&v6);
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

- (void)setIsImplicitlyNested:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRule;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isImplicitlyNested"];
}

- (BOOL)isImplicitlyNested
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRule;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isImplicitlyNested"];
}

@end