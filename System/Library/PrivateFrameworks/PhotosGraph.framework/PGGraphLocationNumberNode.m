@interface PGGraphLocationNumberNode
+ (id)filter;
- (PGGraphLocationNumberNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphLocationNumberNodeCollection)collection;
- (id)label;
@end

@implementation PGGraphLocationNumberNode

- (PGGraphLocationNumberNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphLocationNumberNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)label
{
  v2 = @"Number";
  return @"Number";
}

- (PGGraphLocationNumberNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PGGraphLocationNumberNode;
  return [(PGGraphNamedLocationNode *)&v6 initWithLabel:a3 domain:a4 properties:a5];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Number" domain:200];
  return v2;
}

@end