@interface RWIProtocolDebuggerBreakpointAction
- (BOOL)emulateUserGesture;
- (NSString)data;
- (RWIProtocolDebuggerBreakpointAction)initWithType:(int64_t)a3;
- (int)identifier;
- (int64_t)type;
- (void)setData:(id)a3;
- (void)setEmulateUserGesture:(BOOL)a3;
- (void)setIdentifier:(int)a3;
- (void)setType:(int64_t)a3;
@end

@implementation RWIProtocolDebuggerBreakpointAction

- (RWIProtocolDebuggerBreakpointAction)initWithType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  v4 = [(RWIProtocolJSONObject *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(RWIProtocolDebuggerBreakpointAction *)v4 setType:a3];
    v6 = v5;
  }

  return v5;
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
  v6.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
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
  v9.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
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
  for (uint64_t i = 0; i != 12; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDebuggerBreakpointActionType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDebuggerBreakpointActionType>(WTF::String const&)::mappings)[i + 1]))
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
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolDebuggerBreakpointActionType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setData:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"data"];
}

- (NSString)data
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"data"];
  return (NSString *)v2;
}

- (void)setIdentifier:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"id"];
}

- (int)identifier
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"id"];
}

- (void)setEmulateUserGesture:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"emulateUserGesture"];
}

- (BOOL)emulateUserGesture
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"emulateUserGesture"];
}

@end