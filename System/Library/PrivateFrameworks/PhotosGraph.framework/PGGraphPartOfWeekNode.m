@interface PGGraphPartOfWeekNode
+ (id)filter;
- (unsigned)domain;
@end

@implementation PGGraphPartOfWeekNode

+ (id)filter
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"Weekend", @"Weekday", 0);
  id v3 = objc_alloc(MEMORY[0x1E4F71F00]);
  v4 = (void *)[v3 initWithLabels:v2 domain:400 properties:MEMORY[0x1E4F1CC08]];

  return v4;
}

- (unsigned)domain
{
  return 400;
}

@end