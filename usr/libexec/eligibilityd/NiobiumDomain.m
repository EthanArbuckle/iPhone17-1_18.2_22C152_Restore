@interface NiobiumDomain
+ (BOOL)supportsSecureCoding;
- (id)domainChangeNotificationName;
- (unint64_t)defaultAnswer;
- (unint64_t)domain;
@end

@implementation NiobiumDomain

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)defaultAnswer
{
  return 4;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.niobium";
}

- (unint64_t)domain
{
  return 42;
}

@end