@interface PGGraphWeekendNode
+ (id)filter;
- (PGGraphWeekendNode)init;
- (PGGraphWeekendNodeCollection)collection;
- (id)label;
@end

@implementation PGGraphWeekendNode

- (PGGraphWeekendNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphWeekendNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)label
{
  v2 = @"Weekend";
  return @"Weekend";
}

- (PGGraphWeekendNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGGraphWeekendNode;
  return [(PGGraphNode *)&v3 init];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Weekend" domain:400];
  return v2;
}

@end