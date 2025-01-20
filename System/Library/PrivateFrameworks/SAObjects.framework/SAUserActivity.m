@interface SAUserActivity
+ (id)userActivity;
- (BOOL)isEligibleForAppPunchout;
- (BOOL)isEligibleForDirections;
- (BOOL)isEligibleForHandoff;
- (BOOL)isEligibleForPublicIndexing;
- (BOOL)isEligibleForReminders;
- (BOOL)isEligibleForSearch;
- (NSArray)eligibileFunctions;
- (NSString)internalGUID;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEligibileFunctions:(id)a3;
- (void)setInternalGUID:(id)a3;
- (void)setIsEligibleForAppPunchout:(BOOL)a3;
- (void)setIsEligibleForDirections:(BOOL)a3;
- (void)setIsEligibleForHandoff:(BOOL)a3;
- (void)setIsEligibleForPublicIndexing:(BOOL)a3;
- (void)setIsEligibleForReminders:(BOOL)a3;
- (void)setIsEligibleForSearch:(BOOL)a3;
@end

@implementation SAUserActivity

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"UserActivity";
}

+ (id)userActivity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)eligibileFunctions
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"eligibileFunctions"];
}

- (void)setEligibileFunctions:(id)a3
{
}

- (NSString)internalGUID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"internalGUID"];
}

- (void)setInternalGUID:(id)a3
{
}

- (BOOL)isEligibleForAppPunchout
{
  return AceObjectBoolForProperty(self, @"isEligibleForAppPunchout");
}

- (void)setIsEligibleForAppPunchout:(BOOL)a3
{
}

- (BOOL)isEligibleForDirections
{
  return AceObjectBoolForProperty(self, @"isEligibleForDirections");
}

- (void)setIsEligibleForDirections:(BOOL)a3
{
}

- (BOOL)isEligibleForHandoff
{
  return AceObjectBoolForProperty(self, @"isEligibleForHandoff");
}

- (void)setIsEligibleForHandoff:(BOOL)a3
{
}

- (BOOL)isEligibleForPublicIndexing
{
  return AceObjectBoolForProperty(self, @"isEligibleForPublicIndexing");
}

- (void)setIsEligibleForPublicIndexing:(BOOL)a3
{
}

- (BOOL)isEligibleForReminders
{
  return AceObjectBoolForProperty(self, @"isEligibleForReminders");
}

- (void)setIsEligibleForReminders:(BOOL)a3
{
}

- (BOOL)isEligibleForSearch
{
  return AceObjectBoolForProperty(self, @"isEligibleForSearch");
}

- (void)setIsEligibleForSearch:(BOOL)a3
{
}

@end