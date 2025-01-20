@interface STStatusItemsStatusDomain
+ (unint64_t)statusDomainName;
- (void)observeData:(id)a3;
@end

@implementation STStatusItemsStatusDomain

- (void)observeData:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)STStatusItemsStatusDomain;
  [(STStatusDomain *)&v3 observeData:a3];
}

+ (unint64_t)statusDomainName
{
  return 14;
}

@end