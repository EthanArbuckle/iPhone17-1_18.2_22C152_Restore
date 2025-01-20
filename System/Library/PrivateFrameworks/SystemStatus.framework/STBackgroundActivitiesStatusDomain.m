@interface STBackgroundActivitiesStatusDomain
+ (unint64_t)statusDomainName;
- (void)observeData:(id)a3;
@end

@implementation STBackgroundActivitiesStatusDomain

- (void)observeData:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)STBackgroundActivitiesStatusDomain;
  [(STStatusDomain *)&v3 observeData:a3];
}

+ (unint64_t)statusDomainName
{
  return 1;
}

@end