@interface SALCMTvSubscriptionsClientState
+ (id)deliveryDeadline;
+ (id)persistencePolicy;
+ (id)syncKey;
+ (id)tvSubscriptionsClientState;
+ (id)uniqueObjectIdentifier;
- (NSArray)subscriptions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSubscriptions:(id)a3;
@end

@implementation SALCMTvSubscriptionsClientState

+ (id)deliveryDeadline
{
  return @"SYNC";
}

+ (id)persistencePolicy
{
  return @"LIFE_OF_USER_DATA";
}

+ (id)syncKey
{
  return @"com.apple.siri.client.state.TvSubscriptionsClientState";
}

+ (id)uniqueObjectIdentifier
{
  return @"ClientState://TvSubscriptionsClientState";
}

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"TvSubscriptionsClientState";
}

+ (id)tvSubscriptionsClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)subscriptions
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"subscriptions"];
}

- (void)setSubscriptions:(id)a3
{
}

@end