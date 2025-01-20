@interface SocialConversationIntent
+ (BOOL)supportsSecureCoding;
- (SocialConversationIntent)init;
- (SocialConversationIntent)initWithCoder:(id)a3;
- (SocialConversationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SocialConversationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SocialConversationIntent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SocialConversationIntent)init
{
  return (SocialConversationIntent *)SocialConversationIntent.init()();
}

- (SocialConversationIntent)initWithCoder:(id)a3
{
  return (SocialConversationIntent *)SocialConversationIntent.init(coder:)(a3);
}

- (SocialConversationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_24013AC90();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (SocialConversationIntent *)SocialConversationIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SocialConversationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_24013AC50();
  }
  return (SocialConversationIntent *)SocialConversationIntent.init(domain:verb:parametersByName:)();
}

@end