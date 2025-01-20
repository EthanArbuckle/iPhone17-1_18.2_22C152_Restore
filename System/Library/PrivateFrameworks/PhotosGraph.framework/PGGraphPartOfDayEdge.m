@interface PGGraphPartOfDayEdge
+ (MAEdgeFilter)significantFilter;
+ (id)filter;
+ (id)significantFilterWithLegacyWeights:(BOOL)a3;
- (BOOL)hasProperties:(id)a3;
- (PGGraphPartOfDayEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (PGGraphPartOfDayEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (double)ratio;
- (id)edgeDescription;
- (id)initFromMomentNode:(id)a3 toPartOfDayNode:(id)a4 ratio:(double)a5;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
@end

@implementation PGGraphPartOfDayEdge

- (double)ratio
{
  return self->_ratio;
}

- (unsigned)domain
{
  return 400;
}

- (id)label
{
  v2 = @"PARTOFDAY";
  return @"PARTOFDAY";
}

- (id)edgeDescription
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphPartOfDayEdge;
  v4 = [(PGGraphOptimizedEdge *)&v7 edgeDescription];
  v5 = [v3 stringWithFormat:@"%@ (%.2f)", v4, *(void *)&self->_ratio];

  return v5;
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"ratio";
  v2 = [NSNumber numberWithDouble:self->_ratio];
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
    v6 = [v5 objectForKeyedSubscript:@"ratio"];
    objc_super v7 = v6;
    BOOL v9 = 1;
    if (v6)
    {
      [v6 doubleValue];
      if (v8 != self->_ratio) {
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

- (PGGraphPartOfDayEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = [v17 objectForKeyedSubscript:@"ratio"];

  if (!v18)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
    *(float *)&double v20 = a7;
    v21 = [NSNumber numberWithFloat:v20];
    [v19 setObject:v21 forKeyedSubscript:@"ratio"];

    id v17 = v19;
  }
  v22 = [(PGGraphPartOfDayEdge *)self initWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 properties:v17];

  return v22;
}

- (PGGraphPartOfDayEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a5;
  id v11 = a4;
  v12 = [a7 objectForKeyedSubscript:@"ratio"];
  [v12 doubleValue];
  double v14 = v13;

  id v15 = [(PGGraphPartOfDayEdge *)self initFromMomentNode:v11 toPartOfDayNode:v10 ratio:v14];
  return v15;
}

- (id)initFromMomentNode:(id)a3 toPartOfDayNode:(id)a4 ratio:(double)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGGraphPartOfDayEdge;
  id result = [(PGGraphEdge *)&v7 initWithSourceNode:a3 targetNode:a4];
  if (result) {
    *((double *)result + 5) = a5;
  }
  return result;
}

+ (id)significantFilterWithLegacyWeights:(BOOL)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F71EB0]);
    double v8 = @"__weight";
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:6 value:&unk_1F28D55F8];
    v9[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    v6 = (void *)[v3 initWithLabel:@"PARTOFDAY" domain:400 properties:v5];
  }
  else
  {
    v6 = [a1 significantFilter];
  }
  return v6;
}

+ (MAEdgeFilter)significantFilter
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F71EB0]);
  objc_super v7 = @"ratio";
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:6 value:&unk_1F28D55F8];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = (void *)[v2 initWithLabel:@"PARTOFDAY" domain:400 properties:v4];

  return (MAEdgeFilter *)v5;
}

+ (id)filter
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"PARTOFDAY" domain:400];
  return v2;
}

@end