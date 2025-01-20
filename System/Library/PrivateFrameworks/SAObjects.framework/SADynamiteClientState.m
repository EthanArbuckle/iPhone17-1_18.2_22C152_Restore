@interface SADynamiteClientState
+ (id)deliveryDeadline;
+ (id)dynamiteClientState;
+ (id)persistencePolicy;
+ (id)syncKey;
+ (id)uniqueObjectIdentifier;
- (BOOL)activeTvUser;
- (BOOL)ageVerificationRequired;
- (BOOL)isPromotionRelatedStatus;
- (NSArray)eligibleOffers;
- (NSArray)inContextUsersStates;
- (NSNumber)iCloudMusicLibraryToggle;
- (NSNumber)userHistoryUnmodifiable;
- (NSString)iTunesMatchSubscriptionStatus;
- (NSString)status;
- (NSString)userToken;
- (NSString)xpAbCookie;
- (SACalendar)expirationDate;
- (SAUserState)defaultUserState;
- (SAUserTokenStatus)userTokenStatus;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActiveTvUser:(BOOL)a3;
- (void)setAgeVerificationRequired:(BOOL)a3;
- (void)setDefaultUserState:(id)a3;
- (void)setEligibleOffers:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setICloudMusicLibraryToggle:(id)a3;
- (void)setITunesMatchSubscriptionStatus:(id)a3;
- (void)setInContextUsersStates:(id)a3;
- (void)setIsPromotionRelatedStatus:(BOOL)a3;
- (void)setStatus:(id)a3;
- (void)setUserHistoryUnmodifiable:(id)a3;
- (void)setUserToken:(id)a3;
- (void)setUserTokenStatus:(id)a3;
- (void)setXpAbCookie:(id)a3;
@end

@implementation SADynamiteClientState

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
  return @"com.apple.siri.client.state.DynamiteClientState";
}

+ (id)uniqueObjectIdentifier
{
  return @"ClientState://DynamiteClientState";
}

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DynamiteClientState";
}

+ (id)dynamiteClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)activeTvUser
{
  return AceObjectBoolForProperty(self, @"activeTvUser");
}

- (void)setActiveTvUser:(BOOL)a3
{
}

- (BOOL)ageVerificationRequired
{
  return AceObjectBoolForProperty(self, @"ageVerificationRequired");
}

- (void)setAgeVerificationRequired:(BOOL)a3
{
}

- (SAUserState)defaultUserState
{
  return (SAUserState *)AceObjectAceObjectForProperty(self, @"defaultUserState");
}

- (void)setDefaultUserState:(id)a3
{
}

- (NSArray)eligibleOffers
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"eligibleOffers"];
}

- (void)setEligibleOffers:(id)a3
{
}

- (SACalendar)expirationDate
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, @"expirationDate");
}

- (void)setExpirationDate:(id)a3
{
}

- (NSNumber)iCloudMusicLibraryToggle
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"iCloudMusicLibraryToggle"];
}

- (void)setICloudMusicLibraryToggle:(id)a3
{
}

- (NSString)iTunesMatchSubscriptionStatus
{
  return (NSString *)[(AceObject *)self propertyForKey:@"iTunesMatchSubscriptionStatus"];
}

- (void)setITunesMatchSubscriptionStatus:(id)a3
{
}

- (NSArray)inContextUsersStates
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"inContextUsersStates", v3);
}

- (void)setInContextUsersStates:(id)a3
{
}

- (BOOL)isPromotionRelatedStatus
{
  return AceObjectBoolForProperty(self, @"isPromotionRelatedStatus");
}

- (void)setIsPromotionRelatedStatus:(BOOL)a3
{
}

- (NSString)status
{
  return (NSString *)[(AceObject *)self propertyForKey:@"status"];
}

- (void)setStatus:(id)a3
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