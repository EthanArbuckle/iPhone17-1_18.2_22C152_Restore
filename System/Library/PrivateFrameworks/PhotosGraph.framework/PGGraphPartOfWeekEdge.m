@interface PGGraphPartOfWeekEdge
+ (id)filter;
- (PGGraphPartOfWeekEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromMomentNode:(id)a3 toPartOfWeekNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphPartOfWeekEdge

- (unsigned)domain
{
  return 400;
}

- (id)label
{
  v2 = @"PARTOFWEEK";
  return @"PARTOFWEEK";
}

- (PGGraphPartOfWeekEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPartOfWeekEdge *)[(PGGraphPartOfWeekEdge *)self initFromMomentNode:a4 toPartOfWeekNode:a5];
}

- (id)initFromMomentNode:(id)a3 toPartOfWeekNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphPartOfWeekEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"PARTOFWEEK" domain:400];
  return v2;
}

@end