@interface SocialConversationIntentResponse
- (SocialConversationIntentResponse)init;
- (SocialConversationIntentResponse)initWithBackingStore:(id)a3;
- (SocialConversationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SocialConversationIntentResponse)initWithCoder:(id)a3;
- (SocialConversationIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SocialConversationIntentResponse

- (int64_t)code
{
  return sub_24013A490();
}

- (void)setCode:(int64_t)a3
{
}

- (SocialConversationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SocialConversationIntentResponse *)SocialConversationIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SocialConversationIntentResponse)init
{
  return (SocialConversationIntentResponse *)SocialConversationIntentResponse.init()();
}

- (SocialConversationIntentResponse)initWithCoder:(id)a3
{
  return (SocialConversationIntentResponse *)SocialConversationIntentResponse.init(coder:)(a3);
}

- (SocialConversationIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SocialConversationIntentResponse *)SocialConversationIntentResponse.init(backingStore:)(a3);
}

- (SocialConversationIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_24013AC50();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SocialConversationIntentResponse *)SocialConversationIntentResponse.init(propertiesByName:)(v3);
}

@end