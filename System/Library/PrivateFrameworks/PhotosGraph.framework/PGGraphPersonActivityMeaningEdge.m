@interface PGGraphPersonActivityMeaningEdge
+ (id)filter;
- (PGGraphPersonActivityMeaningEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)edgeDescription;
- (id)initFromMomentNode:(id)a3 toPersonActivityMeaningNode:(id)a4;
- (id)label;
- (id)meaningLabel;
- (unsigned)domain;
@end

@implementation PGGraphPersonActivityMeaningEdge

- (id)meaningLabel
{
  v2 = [(MAEdge *)self targetNode];
  v3 = [v2 label];

  return v3;
}

- (id)edgeDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PGGraphPersonActivityMeaningEdge;
  v4 = [(PGGraphOptimizedEdge *)&v8 edgeDescription];
  v5 = [(PGGraphPersonActivityMeaningEdge *)self meaningLabel];
  v6 = [v3 stringWithFormat:@"%@ (%@)", v4, v5];

  return v6;
}

- (id)label
{
  v2 = @"PERSON_ACTIVITY_MEANING";
  return @"PERSON_ACTIVITY_MEANING";
}

- (unsigned)domain
{
  return 701;
}

- (PGGraphPersonActivityMeaningEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPersonActivityMeaningEdge *)[(PGGraphPersonActivityMeaningEdge *)self initFromMomentNode:a4 toPersonActivityMeaningNode:a5];
}

- (id)initFromMomentNode:(id)a3 toPersonActivityMeaningNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphPersonActivityMeaningEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"PERSON_ACTIVITY_MEANING" domain:701];
  return v2;
}

@end