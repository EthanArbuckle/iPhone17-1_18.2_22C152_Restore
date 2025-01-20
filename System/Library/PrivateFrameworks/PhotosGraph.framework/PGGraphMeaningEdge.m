@interface PGGraphMeaningEdge
+ (MAEdgeFilter)highPrecisionFilter;
+ (id)filter;
+ (id)label;
+ (id)propertyDictionaryWithConfidence:(double)a3 isHighPrecision:(BOOL)a4;
+ (unsigned)domain;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isHighPrecision;
- (BOOL)isReliable;
- (NSString)meaningLabel;
- (PGGraphMeaningEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (PGGraphMeaningEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (double)confidence;
- (id)edgeDescription;
- (id)initFromMomentNode:(id)a3 toMeaningNode:(id)a4 confidence:(double)a5 isHighPrecision:(BOOL)a6;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
@end

@implementation PGGraphMeaningEdge

- (BOOL)isHighPrecision
{
  return *((unsigned char *)self + 40) & 1;
}

- (double)confidence
{
  return self->_confidence;
}

- (id)propertyDictionary
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"confidence";
  v3 = [NSNumber numberWithDouble:self->_confidence];
  v7[1] = @"isHighPrecision";
  v8[0] = v3;
  v4 = [NSNumber numberWithBool:*((unsigned char *)self + 40) & 1];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"confidence"];
    v7 = v6;
    BOOL v10 = 0;
    if (!v6 || ([v6 doubleValue], v8 == self->_confidence))
    {

      v9 = [v5 objectForKeyedSubscript:@"isHighPrecision"];
      v7 = v9;
      if (!v9 || [v9 BOOLValue] != ((*((unsigned char *)self + 40) & 1) == 0)) {
        BOOL v10 = 1;
      }
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (NSString)meaningLabel
{
  v2 = [(MAEdge *)self targetNode];
  v3 = [v2 label];

  return (NSString *)v3;
}

- (BOOL)isReliable
{
  return *((unsigned char *)self + 40) & 1;
}

- (unsigned)domain
{
  v2 = objc_opt_class();
  return [v2 domain];
}

- (id)label
{
  v2 = objc_opt_class();
  return (id)[v2 label];
}

- (id)edgeDescription
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphMeaningEdge;
  id v4 = [(PGGraphOptimizedEdge *)&v11 edgeDescription];
  v5 = [(PGGraphMeaningEdge *)self meaningLabel];
  if ([(PGGraphMeaningEdge *)self isReliable]) {
    v6 = @"Reliable";
  }
  else {
    v6 = @"Unreliable";
  }
  if ([(PGGraphMeaningEdge *)self isHighPrecision]) {
    v7 = @"High Precision";
  }
  else {
    v7 = @"Not High Precision";
  }
  [(PGGraphMeaningEdge *)self confidence];
  v9 = [v3 stringWithFormat:@"%@ (%@, %@, %@, %f)", v4, v5, v6, v7, v8];

  return v9;
}

- (PGGraphMeaningEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
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
  v22 = [(PGGraphMeaningEdge *)self initWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 properties:v17];

  return v22;
}

- (PGGraphMeaningEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a7;
  id v11 = a5;
  id v12 = a4;
  v13 = [v10 objectForKeyedSubscript:@"confidence"];
  [v13 doubleValue];
  double v15 = v14;

  id v16 = [v10 objectForKeyedSubscript:@"isHighPrecision"];

  uint64_t v17 = [v16 BOOLValue];
  v18 = [(PGGraphMeaningEdge *)self initFromMomentNode:v12 toMeaningNode:v11 confidence:v17 isHighPrecision:v15];

  return v18;
}

- (id)initFromMomentNode:(id)a3 toMeaningNode:(id)a4 confidence:(double)a5 isHighPrecision:(BOOL)a6
{
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMeaningEdge;
  id result = [(PGGraphEdge *)&v9 initWithSourceNode:a3 targetNode:a4];
  if (result)
  {
    *((double *)result + 6) = a5;
    *((unsigned char *)result + 40) = *((unsigned char *)result + 40) & 0xFE | a6;
  }
  return result;
}

+ (id)propertyDictionaryWithConfidence:(double)a3 isHighPrecision:(BOOL)a4
{
  BOOL v4 = a4;
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"confidence";
  v5 = [NSNumber numberWithDouble:a3];
  v9[1] = @"isHighPrecision";
  v10[0] = v5;
  v6 = [NSNumber numberWithBool:v4];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

+ (unsigned)domain
{
  return 700;
}

+ (id)label
{
  v2 = @"MEANING";
  return @"MEANING";
}

+ (MAEdgeFilter)highPrecisionFilter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 filter];
  v6 = @"isHighPrecision";
  v7[0] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  BOOL v4 = [v2 filterBySettingProperties:v3];

  return (MAEdgeFilter *)v4;
}

+ (id)filter
{
  v2 = [(id)objc_opt_class() label];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F71EB0]), "initWithLabel:domain:", v2, objc_msgSend((id)objc_opt_class(), "domain"));

  return v3;
}

@end