@interface RWIProtocolPageUserPreference
- (RWIProtocolPageUserPreference)initWithName:(int64_t)a3 value:(int64_t)a4;
- (int64_t)name;
- (int64_t)value;
- (void)setName:(int64_t)a3;
- (void)setValue:(int64_t)a3;
@end

@implementation RWIProtocolPageUserPreference

- (RWIProtocolPageUserPreference)initWithName:(int64_t)a3 value:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolPageUserPreference;
  v6 = [(RWIProtocolJSONObject *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(RWIProtocolPageUserPreference *)v6 setName:a3];
    [(RWIProtocolPageUserPreference *)v7 setValue:a4];
    v8 = v7;
  }

  return v7;
}

- (void)setName:(int64_t)a3
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
  v6.super_class = (Class)RWIProtocolPageUserPreference;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"name"];

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

- (int64_t)name
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolPageUserPreference;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"name"];
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
  for (uint64_t i = 0; i != 9; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceName>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceName>(WTF::String const&)::mappings)[i + 1]))
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
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceName>(WTF::String const&)::mappings)[i + 2];
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

- (void)setValue:(int64_t)a3
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  unint64_t v4 = v7;
  if (v7) {
    v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    v5 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolPageUserPreference;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"value"];

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

- (int64_t)value
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolPageUserPreference;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"value"];
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
  for (uint64_t i = 0; i != 15; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceValue>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceValue>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 15);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceValue>(WTF::String const&)::mappings)[i + 2];
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

@end