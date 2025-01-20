@interface PGGraphInferredPersonEdge
+ (id)filter;
- (PGGraphInferredPersonEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromPersonNode:(id)a3 toInferredPersonNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphInferredPersonEdge

- (unsigned)domain
{
  return 300;
}

- (id)label
{
  v2 = @"INFERRED_TO";
  return @"INFERRED_TO";
}

- (PGGraphInferredPersonEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphInferredPersonEdge *)[(PGGraphInferredPersonEdge *)self initFromPersonNode:a4 toInferredPersonNode:a5];
}

- (id)initFromPersonNode:(id)a3 toInferredPersonNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphInferredPersonEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"INFERRED_TO" domain:300];
  return v2;
}

@end