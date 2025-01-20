@interface RWIProtocolDebuggerLocation
- (NSString)scriptId;
- (RWIProtocolDebuggerLocation)initWithScriptId:(id)a3 lineNumber:(int)a4;
- (int)columnNumber;
- (int)lineNumber;
- (void)setColumnNumber:(int)a3;
- (void)setLineNumber:(int)a3;
- (void)setScriptId:(id)a3;
@end

@implementation RWIProtocolDebuggerLocation

- (RWIProtocolDebuggerLocation)initWithScriptId:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolDebuggerLocation;
  v7 = [(RWIProtocolJSONObject *)&v10 init];
  if (v7)
  {
    if (!v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"scriptId" format];
    }
    [(RWIProtocolDebuggerLocation *)v7 setScriptId:v6];
    [(RWIProtocolDebuggerLocation *)v7 setLineNumber:v4];
    v8 = v7;
  }

  return v7;
}

- (void)setScriptId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerLocation;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"scriptId"];
}

- (NSString)scriptId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDebuggerLocation;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"scriptId"];
  return (NSString *)v2;
}

- (void)setLineNumber:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerLocation;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"lineNumber"];
}

- (int)lineNumber
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerLocation;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"lineNumber"];
}

- (void)setColumnNumber:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerLocation;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"columnNumber"];
}

- (int)columnNumber
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerLocation;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"columnNumber"];
}

@end