@interface PGGraphPerformerEdge
+ (id)filter;
- (PGGraphPerformerEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromPublicEventNode:(id)a3 toPerformerNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphPerformerEdge

- (unsigned)domain
{
  return 900;
}

- (id)label
{
  v2 = @"PERFORMER";
  return @"PERFORMER";
}

- (PGGraphPerformerEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPerformerEdge *)[(PGGraphPerformerEdge *)self initFromPublicEventNode:a4 toPerformerNode:a5];
}

- (id)initFromPublicEventNode:(id)a3 toPerformerNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphPerformerEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"PERFORMER" domain:900];
  return v2;
}

@end