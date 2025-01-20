@interface STLocationStatusDomain
+ (unint64_t)statusDomainName;
- (void)observeData:(id)a3;
@end

@implementation STLocationStatusDomain

+ (unint64_t)statusDomainName
{
  return 5;
}

- (void)observeData:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)STLocationStatusDomain;
  [(STStatusDomain *)&v3 observeData:a3];
}

@end