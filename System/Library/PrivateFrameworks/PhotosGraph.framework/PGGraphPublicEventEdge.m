@interface PGGraphPublicEventEdge
+ (id)filter;
- (PGGraphPublicEventEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromMomentNode:(id)a3 toPublicEventNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphPublicEventEdge

- (unsigned)domain
{
  return 900;
}

- (id)label
{
  v2 = @"PUBLIC_EVENT";
  return @"PUBLIC_EVENT";
}

- (PGGraphPublicEventEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPublicEventEdge *)[(PGGraphPublicEventEdge *)self initFromMomentNode:a4 toPublicEventNode:a5];
}

- (id)initFromMomentNode:(id)a3 toPublicEventNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphPublicEventEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"PUBLIC_EVENT" domain:900];
  return v2;
}

@end