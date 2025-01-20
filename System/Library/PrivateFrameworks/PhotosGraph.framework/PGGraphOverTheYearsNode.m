@interface PGGraphOverTheYearsNode
+ (id)filter;
- (NSString)featureIdentifier;
- (PGGraphOverTheYearsNode)init;
- (id)collection;
- (id)label;
- (unint64_t)featureType;
- (unsigned)domain;
@end

@implementation PGGraphOverTheYearsNode

- (id)collection
{
  v2 = [(MANodeCollection *)[PGGraphOverTheYearsNodeCollection alloc] initWithNode:self];
  return v2;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphOverTheYearsNode *)self label];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 34;
}

- (unsigned)domain
{
  return 402;
}

- (id)label
{
  v2 = @"OverTheYears";
  return @"OverTheYears";
}

- (PGGraphOverTheYearsNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGGraphOverTheYearsNode;
  return [(PGGraphNode *)&v3 init];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"OverTheYears" domain:402];
  return v2;
}

@end