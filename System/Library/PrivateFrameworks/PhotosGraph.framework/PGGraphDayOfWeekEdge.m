@interface PGGraphDayOfWeekEdge
+ (id)filter;
- (PGGraphDayOfWeekEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromDateNode:(id)a3 toDayOfWeekNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphDayOfWeekEdge

- (unsigned)domain
{
  return 400;
}

- (id)label
{
  v2 = @"DAYOFWEEK";
  return @"DAYOFWEEK";
}

- (PGGraphDayOfWeekEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphDayOfWeekEdge *)[(PGGraphDayOfWeekEdge *)self initFromDateNode:a4 toDayOfWeekNode:a5];
}

- (id)initFromDateNode:(id)a3 toDayOfWeekNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphDayOfWeekEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"DAYOFWEEK" domain:400];
  return v2;
}

@end