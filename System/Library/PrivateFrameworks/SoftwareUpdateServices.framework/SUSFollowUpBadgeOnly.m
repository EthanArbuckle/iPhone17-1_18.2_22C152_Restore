@interface SUSFollowUpBadgeOnly
+ (id)identifier;
+ (unint64_t)displayStyle;
@end

@implementation SUSFollowUpBadgeOnly

+ (id)identifier
{
  return (id)SUSFollowUpUniqueIdentifierBadgeOnly;
}

+ (unint64_t)displayStyle
{
  return 8;
}

@end