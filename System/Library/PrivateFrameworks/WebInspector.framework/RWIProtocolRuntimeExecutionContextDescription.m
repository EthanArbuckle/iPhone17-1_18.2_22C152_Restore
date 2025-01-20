@interface RWIProtocolRuntimeExecutionContextDescription
- (NSString)frameId;
- (NSString)name;
- (RWIProtocolRuntimeExecutionContextDescription)initWithIdentifier:(int)a3 type:(int64_t)a4 name:(id)a5 frameId:(id)a6;
- (int)identifier;
- (int64_t)type;
- (void)setFrameId:(id)a3;
- (void)setIdentifier:(int)a3;
- (void)setName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation RWIProtocolRuntimeExecutionContextDescription

- (RWIProtocolRuntimeExecutionContextDescription)initWithIdentifier:(int)a3 type:(int64_t)a4 name:(id)a5 frameId:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  v12 = [(RWIProtocolJSONObject *)&v15 init];
  if (v12)
  {
    if (!v10) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"name" format];
    }
    if (!v11) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"frameId" format];
    }
    [(RWIProtocolRuntimeExecutionContextDescription *)v12 setIdentifier:v8];
    [(RWIProtocolRuntimeExecutionContextDescription *)v12 setType:a4];
    [(RWIProtocolRuntimeExecutionContextDescription *)v12 setName:v10];
    [(RWIProtocolRuntimeExecutionContextDescription *)v12 setFrameId:v11];
    v13 = v12;
  }

  return v12;
}

- (void)setIdentifier:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"id"];
}

- (int)identifier
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"id"];
}

- (void)setType:(int64_t)a3
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v4 = v7;
  if (v7) {
    v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    v5 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"type"];

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

- (int64_t)type
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
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
  for (uint64_t i = 0; i != 9; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolRuntimeExecutionContextType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolRuntimeExecutionContextType>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 9);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolRuntimeExecutionContextType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"name"];
}

- (NSString)name
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"name"];
  return (NSString *)v2;
}

- (void)setFrameId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"frameId"];
}

- (NSString)frameId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolRuntimeExecutionContextDescription;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"frameId"];
  return (NSString *)v2;
}

@end