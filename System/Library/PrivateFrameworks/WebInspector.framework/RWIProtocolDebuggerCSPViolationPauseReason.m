@interface RWIProtocolDebuggerCSPViolationPauseReason
- (NSString)directive;
- (RWIProtocolDebuggerCSPViolationPauseReason)initWithDirective:(id)a3;
- (void)setDirective:(id)a3;
@end

@implementation RWIProtocolDebuggerCSPViolationPauseReason

- (RWIProtocolDebuggerCSPViolationPauseReason)initWithDirective:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolDebuggerCSPViolationPauseReason;
  v5 = [(RWIProtocolJSONObject *)&v8 init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"directive" format];
    }
    [(RWIProtocolDebuggerCSPViolationPauseReason *)v5 setDirective:v4];
    v6 = v5;
  }

  return v5;
}

- (void)setDirective:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCSPViolationPauseReason;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"directive"];
}

- (NSString)directive
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDebuggerCSPViolationPauseReason;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"directive"];
  return (NSString *)v2;
}

@end