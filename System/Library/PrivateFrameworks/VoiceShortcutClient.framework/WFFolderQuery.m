@interface WFFolderQuery
+ (BOOL)supportsSecureCoding;
- (WFFolderQuery)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFolderQuery

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WFFolderQuery;
  [(WFResultQuery *)&v3 encodeWithCoder:a3];
}

- (WFFolderQuery)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFFolderQuery;
  return [(WFResultQuery *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end