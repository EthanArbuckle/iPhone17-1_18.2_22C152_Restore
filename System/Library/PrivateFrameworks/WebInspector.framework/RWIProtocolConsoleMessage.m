@interface RWIProtocolConsoleMessage
- (NSArray)parameters;
- (NSString)networkRequestId;
- (NSString)text;
- (NSString)url;
- (RWIProtocolConsoleMessage)initWithSource:(int64_t)a3 level:(int64_t)a4 text:(id)a5;
- (RWIProtocolConsoleStackTrace)stackTrace;
- (double)timestamp;
- (int)column;
- (int)line;
- (int)repeatCount;
- (int64_t)level;
- (int64_t)source;
- (int64_t)type;
- (void)setColumn:(int)a3;
- (void)setLevel:(int64_t)a3;
- (void)setLine:(int)a3;
- (void)setNetworkRequestId:(id)a3;
- (void)setParameters:(id)a3;
- (void)setRepeatCount:(int)a3;
- (void)setSource:(int64_t)a3;
- (void)setStackTrace:(id)a3;
- (void)setText:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation RWIProtocolConsoleMessage

- (RWIProtocolConsoleMessage)initWithSource:(int64_t)a3 level:(int64_t)a4 text:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)RWIProtocolConsoleMessage;
  v9 = [(RWIProtocolJSONObject *)&v12 init];
  if (v9)
  {
    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"text" format];
    }
    [(RWIProtocolConsoleMessage *)v9 setSource:a3];
    [(RWIProtocolConsoleMessage *)v9 setLevel:a4];
    [(RWIProtocolConsoleMessage *)v9 setText:v8];
    v10 = v9;
  }

  return v9;
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
  v6.super_class = (Class)RWIProtocolConsoleMessage;
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
  v9.super_class = (Class)RWIProtocolConsoleMessage;
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
  v6.super_class = (Class)RWIProtocolConsoleMessage;
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
  v9.super_class = (Class)RWIProtocolConsoleMessage;
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
  for (uint64_t i = 0; i != 15; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolConsoleMessageLevel>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolConsoleMessageLevel>(WTF::String const&)::mappings)[i + 1]))
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
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolConsoleMessageLevel>(WTF::String const&)::mappings)[i + 2];
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

- (void)setText:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleMessage;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"text"];
}

- (NSString)text
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolConsoleMessage;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"text"];
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
  v6.super_class = (Class)RWIProtocolConsoleMessage;
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
  v9.super_class = (Class)RWIProtocolConsoleMessage;
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
  for (uint64_t i = 0; i != 42; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolConsoleMessageType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolConsoleMessageType>(WTF::String const&)::mappings)[i + 1]))
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
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolConsoleMessageType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setUrl:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleMessage;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"url"];
}

- (NSString)url
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolConsoleMessage;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"url"];
  return (NSString *)v2;
}

- (void)setLine:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleMessage;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"line"];
}

- (int)line
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleMessage;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"line"];
}

- (void)setColumn:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleMessage;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"column"];
}

- (int)column
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleMessage;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"column"];
}

- (void)setRepeatCount:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleMessage;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"repeatCount"];
}

- (int)repeatCount
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleMessage;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"repeatCount"];
}

- (void)setParameters:(id)a3
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
          v11 = NSStringFromClass(v10);
          [v9 raise:v6, @"array should contain objects of type '%@', found bad value: %@", v11, v8 format];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  Inspector::toJSONObjectArray((Inspector *)v3, (uint64_t *)&v15);
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolConsoleMessage;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"parameters"];
  objc_super v12 = v15;
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

- (NSArray)parameters
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolConsoleMessage;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"parameters"];
  id v2 = Inspector::toObjCArray<RWIProtocolRuntimeRemoteObject>(&v6);
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

- (void)setStackTrace:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleMessage;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"stackTrace"];
}

- (RWIProtocolConsoleStackTrace)stackTrace
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolConsoleMessage;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"stackTrace"];
  if (v3)
  {
    uint64_t v4 = [RWIProtocolConsoleStackTrace alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolConsoleMessage;
    objc_super v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"stackTrace"];
    [v5 toJSONObject];
    uint64_t v6 = v12;
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
    objc_super v12 = 0;
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

- (void)setNetworkRequestId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleMessage;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"networkRequestId"];
}

- (NSString)networkRequestId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolConsoleMessage;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"networkRequestId"];
  return (NSString *)v2;
}

- (void)setTimestamp:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleMessage;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"timestamp" forKey:a3];
}

- (double)timestamp
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleMessage;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"timestamp"];
  return result;
}

@end