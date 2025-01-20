@interface PGGraphHolidayEdge
+ (id)filter;
- (PGGraphHolidayEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromDateNode:(id)a3 toHolidayNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphHolidayEdge

- (unsigned)domain
{
  return 401;
}

- (id)label
{
  v2 = @"HOLIDAY";
  return @"HOLIDAY";
}

- (PGGraphHolidayEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphHolidayEdge *)[(PGGraphHolidayEdge *)self initFromDateNode:a4 toHolidayNode:a5];
}

- (id)initFromDateNode:(id)a3 toHolidayNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphHolidayEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"HOLIDAY" domain:401];
  return v2;
}

@end