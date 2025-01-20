@interface RWIProtocolCSSGrouping
- (NSString)sourceURL;
- (NSString)text;
- (RWIProtocolCSSGrouping)initWithType:(int64_t)a3;
- (RWIProtocolCSSRuleId)ruleId;
- (RWIProtocolCSSSourceRange)range;
- (int64_t)type;
- (void)setRange:(id)a3;
- (void)setRuleId:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setText:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation RWIProtocolCSSGrouping

- (RWIProtocolCSSGrouping)initWithType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolCSSGrouping;
  v4 = [(RWIProtocolJSONObject *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(RWIProtocolCSSGrouping *)v4 setType:a3];
    v6 = v5;
  }

  return v5;
}

- (void)setType:(int64_t)a3
{
  Inspector::toProtocolString(&v7);
  if (v7) {
    v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolCSSGrouping;
  [(RWIProtocolJSONObject *)&v6 setString:v4 forKey:@"type"];

  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
}

- (int64_t)type
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolCSSGrouping;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"type"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 27; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolCSSGroupingType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolCSSGroupingType>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 27);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolCSSGroupingType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setRuleId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSGrouping;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"ruleId"];
}

- (RWIProtocolCSSRuleId)ruleId
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSGrouping;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"ruleId"];
  if (v3)
  {
    unint64_t v4 = [RWIProtocolCSSRuleId alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSGrouping;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"ruleId"];
    [v5 toJSONObject];
    objc_super v6 = v12;
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

- (void)setText:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSGrouping;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"text"];
}

- (NSString)text
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSGrouping;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"text"];
  return (NSString *)v2;
}

- (void)setSourceURL:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSGrouping;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"sourceURL"];
}

- (NSString)sourceURL
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSGrouping;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"sourceURL"];
  return (NSString *)v2;
}

- (void)setRange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSGrouping;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"range"];
}

- (RWIProtocolCSSSourceRange)range
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSGrouping;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"range"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolCSSSourceRange alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSGrouping;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"range"];
    [v5 toJSONObject];
    objc_super v6 = v12;
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

@end