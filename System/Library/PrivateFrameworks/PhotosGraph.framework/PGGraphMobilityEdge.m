@interface PGGraphMobilityEdge
+ (id)filter;
- (BOOL)hasProperties:(id)a3;
- (MAEdgeFilter)uniquelyIdentifyingFilter;
- (PGGraphMobilityEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (PGGraphMobilityEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (double)confidence;
- (id)edgeDescription;
- (id)initFromMomentNode:(id)a3 toMobilityNode:(id)a4 confidence:(double)a5;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
@end

@implementation PGGraphMobilityEdge

- (double)confidence
{
  return self->_confidence;
}

- (unsigned)domain
{
  return 203;
}

- (id)label
{
  v2 = @"MOBILITY";
  return @"MOBILITY";
}

- (MAEdgeFilter)uniquelyIdentifyingFilter
{
  v2 = objc_opt_class();
  return (MAEdgeFilter *)[v2 filter];
}

- (id)edgeDescription
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphMobilityEdge;
  v4 = [(PGGraphOptimizedEdge *)&v7 edgeDescription];
  v5 = [v3 stringWithFormat:@"%@ (weight = %.2f)", v4, *(void *)&self->_confidence];

  return v5;
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"confidence";
  v2 = [NSNumber numberWithDouble:self->_confidence];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"confidence"];
    objc_super v7 = v6;
    BOOL v9 = 1;
    if (v6)
    {
      [v6 doubleValue];
      if (v8 != self->_confidence) {
        BOOL v9 = 0;
      }
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (PGGraphMobilityEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = [v17 objectForKeyedSubscript:@"confidence"];

  if (!v18)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
    *(float *)&double v20 = a7;
    v21 = [NSNumber numberWithFloat:v20];
    [v19 setObject:v21 forKeyedSubscript:@"confidence"];

    id v17 = v19;
  }
  v22 = [(PGGraphMobilityEdge *)self initWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 properties:v17];

  return v22;
}

- (PGGraphMobilityEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a5;
  id v11 = a4;
  v12 = [a7 objectForKeyedSubscript:@"confidence"];
  [v12 doubleValue];
  double v14 = v13;

  id v15 = [(PGGraphMobilityEdge *)self initFromMomentNode:v11 toMobilityNode:v10 confidence:v14];
  return v15;
}

- (id)initFromMomentNode:(id)a3 toMobilityNode:(id)a4 confidence:(double)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGGraphMobilityEdge;
  id result = [(PGGraphEdge *)&v7 initWithSourceNode:a3 targetNode:a4];
  if (result) {
    *((double *)result + 5) = a5;
  }
  return result;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"MOBILITY" domain:203];
  return v2;
}

@end