@interface PGGraphSubmeaningOfEdge
+ (id)filter;
- (PGGraphSubmeaningOfEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromSubmeaningNode:(id)a3 toParentMeaningNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphSubmeaningOfEdge

- (unsigned)domain
{
  return 700;
}

- (id)label
{
  v2 = @"SUBMEANING_OF";
  return @"SUBMEANING_OF";
}

- (PGGraphSubmeaningOfEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphSubmeaningOfEdge *)[(PGGraphSubmeaningOfEdge *)self initFromSubmeaningNode:a4 toParentMeaningNode:a5];
}

- (id)initFromSubmeaningNode:(id)a3 toParentMeaningNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphSubmeaningOfEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"SUBMEANING_OF" domain:700];
  return v2;
}

@end