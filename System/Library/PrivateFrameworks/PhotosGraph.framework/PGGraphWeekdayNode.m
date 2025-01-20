@interface PGGraphWeekdayNode
+ (id)filter;
- (PGGraphWeekdayNode)init;
- (PGGraphWeekdayNodeCollection)collection;
- (id)label;
@end

@implementation PGGraphWeekdayNode

- (PGGraphWeekdayNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphWeekdayNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)label
{
  v2 = @"Weekday";
  return @"Weekday";
}

- (PGGraphWeekdayNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGGraphWeekdayNode;
  return [(PGGraphNode *)&v3 init];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Weekday" domain:400];
  return v2;
}

@end