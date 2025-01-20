@interface SRUIFConversationError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 localizedFailureReason:(id)a4;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
- (SRUIFConversationError)initWithCode:(int64_t)a3;
- (SRUIFConversationError)initWithCode:(int64_t)a3 localizedFailureReason:(id)a4;
- (SRUIFConversationError)initWithCode:(int64_t)a3 userInfo:(id)a4;
@end

@implementation SRUIFConversationError

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithCode:a3 userInfo:v6];

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithCode:a3 localizedFailureReason:v6];

  return v7;
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)[a1 errorWithCode:a3 userInfo:0];
}

- (SRUIFConversationError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  return [(SRUIFConversationError *)self initWithDomain:@"com.apple.siri.conversation.ErrorDomain" code:a3 userInfo:a4];
}

- (SRUIFConversationError)initWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F08338];
  v12[0] = a4;
  id v6 = NSDictionary;
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v9 = [(SRUIFConversationError *)self initWithCode:a3 userInfo:v8];
  return v9;
}

- (SRUIFConversationError)initWithCode:(int64_t)a3
{
  return [(SRUIFConversationError *)self initWithCode:a3 userInfo:0];
}

@end