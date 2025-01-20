@interface NCNotificationSectionMuteAssertion
+ (id)sectionMuteAssertion;
- (BOOL)isEqual:(id)a3;
- (id)_init;
- (unint64_t)activeMuteAssertionLevelForThreadIdentifier:(id)a3;
- (unint64_t)hash;
@end

@implementation NCNotificationSectionMuteAssertion

+ (id)sectionMuteAssertion
{
  id v2 = [[NCNotificationSectionMuteAssertion alloc] _init];

  return v2;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSectionMuteAssertion;
  return [(NCNotificationSectionMuteAssertion *)&v3 init];
}

- (unint64_t)activeMuteAssertionLevelForThreadIdentifier:(id)a3
{
  return 2;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 31;
}

@end