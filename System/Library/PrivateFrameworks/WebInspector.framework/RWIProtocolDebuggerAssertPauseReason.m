@interface RWIProtocolDebuggerAssertPauseReason
- (NSString)message;
- (void)setMessage:(id)a3;
@end

@implementation RWIProtocolDebuggerAssertPauseReason

- (void)setMessage:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerAssertPauseReason;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"message"];
}

- (NSString)message
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDebuggerAssertPauseReason;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"message"];
  return (NSString *)v2;
}

@end