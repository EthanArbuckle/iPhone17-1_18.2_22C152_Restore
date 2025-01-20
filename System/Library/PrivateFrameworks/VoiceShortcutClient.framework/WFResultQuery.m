@interface WFResultQuery
+ (BOOL)supportsSecureCoding;
- (WFResultQuery)initWithCoder:(id)a3;
@end

@implementation WFResultQuery

- (WFResultQuery)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFResultQuery;
  return [(WFResultQuery *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end