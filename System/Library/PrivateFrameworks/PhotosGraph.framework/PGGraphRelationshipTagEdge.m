@interface PGGraphRelationshipTagEdge
+ (id)filter;
+ (id)filterWithConfidence:(double)a3;
- (BOOL)hasProperties:(id)a3;
- (PGGraphRelationshipTagEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (double)confidence;
- (id)edgeDescription;
- (id)initFromPersonNode:(id)a3 toRelationshipTagNode:(id)a4 withConfidence:(double)a5;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
@end

@implementation PGGraphRelationshipTagEdge

- (double)confidence
{
  return self->_confidence;
}

- (id)edgeDescription
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphRelationshipTagEdge;
  v4 = [(PGGraphOptimizedEdge *)&v7 edgeDescription];
  v5 = [v3 stringWithFormat:@"%@ (%.2f)", v4, *(void *)&self->_confidence];

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

- (unsigned)domain
{
  return 305;
}

- (id)label
{
  v2 = @"RELATIONSHIP_TAG";
  return @"RELATIONSHIP_TAG";
}

- (PGGraphRelationshipTagEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  v12 = [a7 objectForKeyedSubscript:@"confidence"];
  v13 = v12;
  if (v12) {
    [v12 doubleValue];
  }
  else {
    double v14 = 0.1;
  }
  v15 = [(PGGraphRelationshipTagEdge *)self initFromPersonNode:v10 toRelationshipTagNode:v11 withConfidence:v14];

  return v15;
}

- (id)initFromPersonNode:(id)a3 toRelationshipTagNode:(id)a4 withConfidence:(double)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PGGraphRelationshipTagEdge;
  id result = [(PGGraphEdge *)&v7 initWithSourceNode:a3 targetNode:a4];
  if (result) {
    *((double *)result + 5) = a5;
  }
  return result;
}

+ (id)filterWithConfidence:(double)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a1 filter];
  id v11 = @"confidence";
  id v5 = objc_alloc(MEMORY[0x1E4F71E28]);
  v6 = [NSNumber numberWithDouble:a3];
  objc_super v7 = (void *)[v5 initWithComparator:6 value:v6];
  v12[0] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  BOOL v9 = [v4 filterBySettingProperties:v8];

  return v9;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"RELATIONSHIP_TAG" domain:305];
  return v2;
}

@end