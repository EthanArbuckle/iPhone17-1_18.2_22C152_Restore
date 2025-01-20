@interface RWIProtocolConsoleChannel
- (RWIProtocolConsoleChannel)initWithSource:(int64_t)a3 level:(int64_t)a4;
- (int64_t)level;
- (int64_t)source;
- (void)setLevel:(int64_t)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation RWIProtocolConsoleChannel

- (RWIProtocolConsoleChannel)initWithSource:(int64_t)a3 level:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolConsoleChannel;
  v6 = [(RWIProtocolJSONObject *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(RWIProtocolConsoleChannel *)v6 setSource:a3];
    [(RWIProtocolConsoleChannel *)v7 setLevel:a4];
    v8 = v7;
  }

  return v7;
}

- (void)setSource:(int64_t)a3
{
  Inspector::toProtocolString(&v7);
  if (v7) {
    v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolConsoleChannel;
  [(RWIProtocolJSONObject *)&v6 setString:v4 forKey:@"source"];

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

- (int64_t)source
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolConsoleChannel;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"source"];
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
  for (uint64_t i = 0; i != 51; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolConsoleChannelSource>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolConsoleChannelSource>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 51);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolConsoleChannelSource>(WTF::String const&)::mappings)[i + 2];
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

- (void)setLevel:(int64_t)a3
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
  v6.super_class = (Class)RWIProtocolConsoleChannel;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"level"];

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

- (int64_t)level
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolConsoleChannel;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"level"];
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
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolConsoleChannelLevel>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolConsoleChannelLevel>(WTF::String const&)::mappings)[i + 1]))
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
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolConsoleChannelLevel>(WTF::String const&)::mappings)[i + 2];
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