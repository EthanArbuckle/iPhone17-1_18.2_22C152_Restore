@interface PGGraphSeasonEdge
+ (id)filter;
- (PGGraphSeasonEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromDateNode:(id)a3 toSeasonNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphSeasonEdge

- (unsigned)domain
{
  return 400;
}

- (id)label
{
  v2 = @"SEASON";
  return @"SEASON";
}

- (PGGraphSeasonEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphSeasonEdge *)[(PGGraphSeasonEdge *)self initFromDateNode:a4 toSeasonNode:a5];
}

- (id)initFromDateNode:(id)a3 toSeasonNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphSeasonEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"SEASON" domain:400];
  return v2;
}

@end