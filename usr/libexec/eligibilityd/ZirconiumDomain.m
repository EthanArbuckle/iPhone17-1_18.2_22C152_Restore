@interface ZirconiumDomain
+ (BOOL)supportsSecureCoding;
- (id)domainChangeNotificationName;
- (unint64_t)defaultAnswer;
- (unint64_t)domain;
@end

@implementation ZirconiumDomain

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
  return @"com.apple.os-eligibility-domain.change.zirconium";
}

- (unint64_t)domain
{
  return 41;
}

@end