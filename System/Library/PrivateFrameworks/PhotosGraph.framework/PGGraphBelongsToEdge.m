@interface PGGraphBelongsToEdge
+ (id)filter;
+ (void)setImportance:(double)a3 onBelongsToEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
- (BOOL)hasProperties:(id)a3;
- (PGGraphBelongsToEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (PGGraphBelongsToEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (double)importance;
- (id)edgeDescription;
- (id)initFromMemberNode:(id)a3 toSocialGroupNode:(id)a4 importance:(double)a5;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
@end

@implementation PGGraphBelongsToEdge

- (double)importance
{
  return self->_importance;
}

- (unsigned)domain
{
  return 302;
}

- (id)label
{
  v2 = @"BELONGSTO";
  return @"BELONGSTO";
}

- (id)edgeDescription
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphBelongsToEdge;
  v4 = [(PGGraphOptimizedEdge *)&v7 edgeDescription];
  v5 = [v3 stringWithFormat:@"%@ (%.2f)", v4, *(void *)&self->_importance];

  return v5;
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"importance";
  v2 = [NSNumber numberWithDouble:self->_importance];
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
    v6 = [v5 objectForKeyedSubscript:@"importance"];
    objc_super v7 = v6;
    BOOL v9 = 1;
    if (v6)
    {
      [v6 doubleValue];
      if (v8 != self->_importance) {
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

- (PGGraphBelongsToEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = [v17 objectForKeyedSubscript:@"importance"];

  if (!v18)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
    *(float *)&double v20 = a7;
    v21 = [NSNumber numberWithFloat:v20];
    [v19 setObject:v21 forKeyedSubscript:@"importance"];

    id v17 = v19;
  }
  v22 = [(PGGraphBelongsToEdge *)self initWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 properties:v17];

  return v22;
}

- (PGGraphBelongsToEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a5;
  id v11 = a4;
  v12 = [a7 objectForKeyedSubscript:@"importance"];
  [v12 doubleValue];
  double v14 = v13;

  id v15 = [(PGGraphBelongsToEdge *)self initFromMemberNode:v11 toSocialGroupNode:v10 importance:v14];
  return v15;
}

- (id)initFromMemberNode:(id)a3 toSocialGroupNode:(id)a4 importance:(double)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGGraphBelongsToEdge;
  id result = [(PGGraphEdge *)&v7 initWithSourceNode:a3 targetNode:a4];
  if (result) {
    *((double *)result + 5) = a5;
  }
  return result;
}

+ (void)setImportance:(double)a3 onBelongsToEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  objc_super v7 = NSNumber;
  id v8 = a5;
  id v9 = [v7 numberWithDouble:a3];
  [v8 persistModelProperty:v9 forKey:@"importance" forEdgeWithIdentifier:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"BELONGSTO" domain:302];
  return v2;
}

@end