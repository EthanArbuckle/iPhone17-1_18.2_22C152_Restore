@interface PGGraphSocialGroupEdge
+ (id)filter;
- (PGGraphSocialGroupEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromMomentNode:(id)a3 toSocialGroupNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphSocialGroupEdge

- (unsigned)domain
{
  return 302;
}

- (id)label
{
  v2 = @"SOCIALGROUP";
  return @"SOCIALGROUP";
}

- (PGGraphSocialGroupEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphSocialGroupEdge *)[(PGGraphSocialGroupEdge *)self initFromMomentNode:a4 toSocialGroupNode:a5];
}

- (id)initFromMomentNode:(id)a3 toSocialGroupNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphSocialGroupEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"SOCIALGROUP" domain:302];
  return v2;
}

@end