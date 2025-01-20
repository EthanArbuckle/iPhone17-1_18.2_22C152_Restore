@interface RWIProtocolCSSProperty
- (BOOL)implicit;
- (BOOL)parsedOk;
- (NSString)name;
- (NSString)priority;
- (NSString)text;
- (NSString)value;
- (RWIProtocolCSSProperty)initWithName:(id)a3 value:(id)a4;
- (RWIProtocolCSSSourceRange)range;
- (int64_t)status;
- (void)setImplicit:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setParsedOk:(BOOL)a3;
- (void)setPriority:(id)a3;
- (void)setRange:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation RWIProtocolCSSProperty

- (RWIProtocolCSSProperty)initWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RWIProtocolCSSProperty;
  v8 = [(RWIProtocolJSONObject *)&v11 init];
  if (v8)
  {
    if (!v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"name" format];
    }
    if (!v7) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"value" format];
    }
    [(RWIProtocolCSSProperty *)v8 setName:v6];
    [(RWIProtocolCSSProperty *)v8 setValue:v7];
    v9 = v8;
  }

  return v8;
}

- (void)setName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSProperty;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"name"];
}

- (NSString)name
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSProperty;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"name"];
  return (NSString *)v2;
}

- (void)setValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSProperty;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"value"];
}

- (NSString)value
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSProperty;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"value"];
  return (NSString *)v2;
}

- (void)setPriority:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSProperty;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"priority"];
}

- (NSString)priority
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSProperty;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"priority"];
  return (NSString *)v2;
}

- (void)setImplicit:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSProperty;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"implicit"];
}

- (BOOL)implicit
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSProperty;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"implicit"];
}

- (void)setText:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSProperty;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"text"];
}

- (NSString)text
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSProperty;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"text"];
  return (NSString *)v2;
}

- (void)setParsedOk:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSProperty;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"parsedOk"];
}

- (BOOL)parsedOk
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSProperty;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"parsedOk"];
}

- (void)setStatus:(int64_t)a3
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
  v6.super_class = (Class)RWIProtocolCSSProperty;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"status"];

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

- (int64_t)status
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolCSSProperty;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"status"];
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
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolCSSPropertyStatus>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolCSSPropertyStatus>(WTF::String const&)::mappings)[i + 1]))
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
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolCSSPropertyStatus>(WTF::String const&)::mappings)[i + 2];
  id v7 = (_DWORD *)v10;
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

- (void)setRange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSProperty;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"range"];
}

- (RWIProtocolCSSSourceRange)range
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSProperty;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"range"];
  if (v3)
  {
    unint64_t v4 = [RWIProtocolCSSSourceRange alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSProperty;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"range"];
    [v5 toJSONObject];
    objc_super v6 = v12;
    ++*v12;
    v13 = v6;
    id v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    v8 = v13;
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
    id v7 = 0;
  }

  return v7;
}

@end