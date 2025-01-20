@interface RWIProtocolRuntimePropertyPreview
- (BOOL)internal;
- (BOOL)isPrivate;
- (NSString)name;
- (NSString)value;
- (RWIProtocolRuntimeObjectPreview)valuePreview;
- (RWIProtocolRuntimePropertyPreview)initWithName:(id)a3 type:(int64_t)a4;
- (int64_t)subtype;
- (int64_t)type;
- (void)setInternal:(BOOL)a3;
- (void)setIsPrivate:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSubtype:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3;
- (void)setValuePreview:(id)a3;
@end

@implementation RWIProtocolRuntimePropertyPreview

- (RWIProtocolRuntimePropertyPreview)initWithName:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  v7 = [(RWIProtocolJSONObject *)&v10 init];
  if (v7)
  {
    if (!v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"name" format];
    }
    [(RWIProtocolRuntimePropertyPreview *)v7 setName:v6];
    [(RWIProtocolRuntimePropertyPreview *)v7 setType:a4];
    v8 = v7;
  }

  return v7;
}

- (void)setName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"name"];
}

- (NSString)name
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"name"];
  return (NSString *)v2;
}

- (void)setType:(int64_t)a3
{
  Inspector::toProtocolString(&v7);
  if (v7) {
    objc_super v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    objc_super v4 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolRuntimePropertyPreview;
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
  v9.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"type"];
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
  for (uint64_t i = 0; i != 27; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolRuntimePropertyPreviewType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolRuntimePropertyPreviewType>(WTF::String const&)::mappings)[i + 1]))
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
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolRuntimePropertyPreviewType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setSubtype:(int64_t)a3
{
  Inspector::toProtocolString(&v7);
  if (v7) {
    unint64_t v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    unint64_t v4 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  [(RWIProtocolJSONObject *)&v6 setString:v4 forKey:@"subtype"];

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

- (int64_t)subtype
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"subtype"];
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
  for (uint64_t i = 0; i != 42; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolRuntimePropertyPreviewSubtype>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolRuntimePropertyPreviewSubtype>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 42);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolRuntimePropertyPreviewSubtype>(WTF::String const&)::mappings)[i + 2];
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

- (void)setValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"value"];
}

- (NSString)value
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"value"];
  return (NSString *)v2;
}

- (void)setValuePreview:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"valuePreview"];
}

- (RWIProtocolRuntimeObjectPreview)valuePreview
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"valuePreview"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolRuntimeObjectPreview alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimePropertyPreview;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"valuePreview"];
    [v5 toJSONObject];
    objc_super v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
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
    v7 = 0;
  }

  return v7;
}

- (void)setIsPrivate:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isPrivate"];
}

- (BOOL)isPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isPrivate"];
}

- (void)setInternal:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"internal"];
}

- (BOOL)internal
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyPreview;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"internal"];
}

@end