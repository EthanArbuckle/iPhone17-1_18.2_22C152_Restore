@interface SAUserState
+ (id)userState;
- (BOOL)ageVerificationRequired;
- (BOOL)isPromotionRelatedStatus;
- (NSArray)eligibleOffers;
- (NSNumber)userHistoryUnmodifiable;
- (NSString)defaultMediaPlaybackAppBundleIdentifier;
- (NSString)iTunesMatchSubscriptionStatus;
- (NSString)sharedUserId;
- (NSString)status;
- (NSString)syncSharedUserId;
- (NSString)userToken;
- (NSString)xpAbCookie;
- (SAUserTokenStatus)userTokenStatus;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAgeVerificationRequired:(BOOL)a3;
- (void)setDefaultMediaPlaybackAppBundleIdentifier:(id)a3;
- (void)setEligibleOffers:(id)a3;
- (void)setITunesMatchSubscriptionStatus:(id)a3;
- (void)setIsPromotionRelatedStatus:(BOOL)a3;
- (void)setSharedUserId:(id)a3;
- (void)setStatus:(id)a3;
- (void)setSyncSharedUserId:(id)a3;
- (void)setUserHistoryUnmodifiable:(id)a3;
- (void)setUserToken:(id)a3;
- (void)setUserTokenStatus:(id)a3;
- (void)setXpAbCookie:(id)a3;
@end

@implementation SAUserState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"UserState";
}

+ (id)userState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)ageVerificationRequired
{
  return AceObjectBoolForProperty(self, @"ageVerificationRequired");
}

- (void)setAgeVerificationRequired:(BOOL)a3
{
}

- (NSString)defaultMediaPlaybackAppBundleIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"defaultMediaPlaybackAppBundleIdentifier"];
}

- (void)setDefaultMediaPlaybackAppBundleIdentifier:(id)a3
{
}

- (NSArray)eligibleOffers
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"eligibleOffers"];
}

- (void)setEligibleOffers:(id)a3
{
}

- (NSString)iTunesMatchSubscriptionStatus
{
  return (NSString *)[(AceObject *)self propertyForKey:@"iTunesMatchSubscriptionStatus"];
}

- (void)setITunesMatchSubscriptionStatus:(id)a3
{
}

- (BOOL)isPromotionRelatedStatus
{
  return AceObjectBoolForProperty(self, @"isPromotionRelatedStatus");
}

- (void)setIsPromotionRelatedStatus:(BOOL)a3
{
}

- (NSString)sharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sharedUserId"];
}

- (void)setSharedUserId:(id)a3
{
}

- (NSString)status
{
  return (NSString *)[(AceObject *)self propertyForKey:@"status"];
}

- (void)setStatus:(id)a3
{
}

- (NSString)syncSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"syncSharedUserId"];
}

- (void)setSyncSharedUserId:(id)a3
{
}

- (NSNumber)userHistoryUnmodifiable
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"userHistoryUnmodifiable"];
}

- (void)setUserHistoryUnmodifiable:(id)a3
{
}

- (NSString)userToken
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userToken"];
}

- (void)setUserToken:(id)a3
{
}

- (SAUserTokenStatus)userTokenStatus
{
  return (SAUserTokenStatus *)AceObjectAceObjectForProperty(self, @"userTokenStatus");
}

- (void)setUserTokenStatus:(id)a3
{
}

- (NSString)xpAbCookie
{
  return (NSString *)[(AceObject *)self propertyForKey:@"xpAbCookie"];
}

- (void)setXpAbCookie:(id)a3
{
}

@end