@interface RWIProtocolConsoleCallFrame
- (NSString)functionName;
- (NSString)scriptId;
- (NSString)url;
- (RWIProtocolConsoleCallFrame)initWithFunctionName:(id)a3 url:(id)a4 scriptId:(id)a5 lineNumber:(int)a6 columnNumber:(int)a7;
- (int)columnNumber;
- (int)lineNumber;
- (void)setColumnNumber:(int)a3;
- (void)setFunctionName:(id)a3;
- (void)setLineNumber:(int)a3;
- (void)setScriptId:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation RWIProtocolConsoleCallFrame

- (RWIProtocolConsoleCallFrame)initWithFunctionName:(id)a3 url:(id)a4 scriptId:(id)a5 lineNumber:(int)a6 columnNumber:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)RWIProtocolConsoleCallFrame;
  v15 = [(RWIProtocolJSONObject *)&v18 init];
  if (v15)
  {
    if (!v12) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"functionName" format];
    }
    if (!v13) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"url" format];
    }
    if (!v14) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"scriptId" format];
    }
    [(RWIProtocolConsoleCallFrame *)v15 setFunctionName:v12];
    [(RWIProtocolConsoleCallFrame *)v15 setUrl:v13];
    [(RWIProtocolConsoleCallFrame *)v15 setScriptId:v14];
    [(RWIProtocolConsoleCallFrame *)v15 setLineNumber:v8];
    [(RWIProtocolConsoleCallFrame *)v15 setColumnNumber:v7];
    v16 = v15;
  }

  return v15;
}

- (void)setFunctionName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"functionName"];
}

- (NSString)functionName
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolConsoleCallFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"functionName"];
  return (NSString *)v2;
}

- (void)setUrl:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"url"];
}

- (NSString)url
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolConsoleCallFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"url"];
  return (NSString *)v2;
}

- (void)setScriptId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"scriptId"];
}

- (NSString)scriptId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolConsoleCallFrame;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"scriptId"];
  return (NSString *)v2;
}

- (void)setLineNumber:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"lineNumber"];
}

- (int)lineNumber
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"lineNumber"];
}

- (void)setColumnNumber:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"columnNumber"];
}

- (int)columnNumber
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolConsoleCallFrame;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"columnNumber"];
}

@end