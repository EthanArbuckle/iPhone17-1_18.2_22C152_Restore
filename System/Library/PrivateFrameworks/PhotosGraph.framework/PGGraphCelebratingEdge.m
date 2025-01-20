@interface PGGraphCelebratingEdge
+ (id)filter;
- (PGGraphCelebratingEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromMomentNode:(id)a3 toHolidayNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphCelebratingEdge

- (unsigned)domain
{
  return 401;
}

- (id)label
{
  v2 = @"CELEBRATING";
  return @"CELEBRATING";
}

- (PGGraphCelebratingEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphCelebratingEdge *)[(PGGraphCelebratingEdge *)self initFromMomentNode:a4 toHolidayNode:a5];
}

- (id)initFromMomentNode:(id)a3 toHolidayNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphCelebratingEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"CELEBRATING" domain:401];
  return v2;
}

@end