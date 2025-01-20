@interface PGGraphPOIEdge
+ (MAEdgeFilter)filterImproved;
+ (MAEdgeFilter)filterSpecial;
+ (id)filter;
+ (id)filterAboveConfidence:(double)a3;
+ (id)filterAboveConfidence:(double)a3 hasLegacyWeights:(BOOL)a4;
+ (void)setConfidence:(double)a3 onEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
+ (void)setPOIIsImproved:(BOOL)a3 onEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
- (BOOL)hasProperties:(id)a3;
- (BOOL)poiIsImproved;
- (BOOL)poiIsSpecial;
- (PGGraphPOIEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (PGGraphPOIEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (double)confidence;
- (id)edgeDescription;
- (id)initFromMomentNode:(id)a3 toPOINode:(id)a4 confidence:(double)a5 poiIsImproved:(BOOL)a6 poiIsSpecial:(BOOL)a7;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
@end

@implementation PGGraphPOIEdge

- (BOOL)poiIsSpecial
{
  return (*((unsigned __int8 *)self + 40) >> 1) & 1;
}

- (BOOL)poiIsImproved
{
  return *((unsigned char *)self + 40) & 1;
}

- (double)confidence
{
  return self->_confidence;
}

- (unsigned)domain
{
  return 501;
}

- (id)label
{
  v2 = @"POI";
  return @"POI";
}

- (id)edgeDescription
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphPOIEdge;
  uint64_t v4 = [(PGGraphOptimizedEdge *)&v12 edgeDescription];
  v5 = (void *)v4;
  v6 = @"Improved";
  if ((*((unsigned char *)self + 40) & 1) == 0) {
    v6 = &stru_1F283BC78;
  }
  v7 = @"Special";
  if ((*((unsigned char *)self + 40) & 2) != 0)
  {
    BOOL v8 = (*((unsigned char *)self + 40) & 1) == 0;
  }
  else
  {
    v7 = &stru_1F283BC78;
    BOOL v8 = 1;
  }
  v9 = @", ";
  if (v8) {
    v9 = &stru_1F283BC78;
  }
  v10 = [v3 stringWithFormat:@"%@ (%.2f, %@%@%@)", v4, *(void *)&self->_confidence, v6, v9, v7];

  return v10;
}

- (id)propertyDictionary
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"confidence";
  v3 = [NSNumber numberWithDouble:self->_confidence];
  v9[0] = v3;
  v8[1] = @"isImproved";
  uint64_t v4 = [NSNumber numberWithBool:*((unsigned char *)self + 40) & 1];
  v9[1] = v4;
  v8[2] = @"isSpecial";
  v5 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 40) >> 1) & 1];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"confidence"];
    v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      if (v8 != self->_confidence) {
        goto LABEL_11;
      }
    }

    v9 = [v5 objectForKeyedSubscript:@"isImproved"];
    v7 = v9;
    if (v9)
    {
      if ([v9 BOOLValue] == ((*((unsigned char *)self + 40) & 1) == 0)) {
        goto LABEL_11;
      }
    }

    v10 = [v5 objectForKeyedSubscript:@"isSpecial"];
    v7 = v10;
    if (v10 && [v10 BOOLValue] == ((*((unsigned char *)self + 40) & 2) == 0)) {
LABEL_11:
    }
      BOOL v11 = 0;
    else {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (PGGraphPOIEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = [v17 objectForKeyedSubscript:@"confidence"];

  if (v18)
  {
    v19 = v17;
  }
  else
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
    *(float *)&double v20 = a7;
    v21 = [NSNumber numberWithFloat:v20];
    [v19 setObject:v21 forKeyedSubscript:@"confidence"];

    v22 = [v17 objectForKeyedSubscript:@"impr"];

    if (v22)
    {
      v23 = [v17 objectForKeyedSubscript:@"impr"];
      [v19 setObject:v23 forKeyedSubscript:@"isImproved"];

      [v19 setObject:0 forKeyedSubscript:@"impr"];
    }
    v24 = [v17 objectForKeyedSubscript:@"spcl"];

    if (v24)
    {
      v25 = [v17 objectForKeyedSubscript:@"spcl"];
      [v19 setObject:v25 forKeyedSubscript:@"isSpecial"];

      [v19 setObject:0 forKeyedSubscript:@"spcl"];
    }
  }
  v26 = [(PGGraphPOIEdge *)self initWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 properties:v19];

  return v26;
}

- (PGGraphPOIEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a7;
  id v11 = a5;
  id v12 = a4;
  v13 = [v10 objectForKeyedSubscript:@"confidence"];
  [v13 doubleValue];
  double v15 = v14;

  id v16 = [v10 objectForKeyedSubscript:@"isImproved"];
  uint64_t v17 = [v16 BOOLValue];

  v18 = [v10 objectForKeyedSubscript:@"isSpecial"];

  uint64_t v19 = [v18 BOOLValue];
  double v20 = [(PGGraphPOIEdge *)self initFromMomentNode:v12 toPOINode:v11 confidence:v17 poiIsImproved:v19 poiIsSpecial:v15];

  return v20;
}

- (id)initFromMomentNode:(id)a3 toPOINode:(id)a4 confidence:(double)a5 poiIsImproved:(BOOL)a6 poiIsSpecial:(BOOL)a7
{
  BOOL v7 = a7;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphPOIEdge;
  id result = [(PGGraphEdge *)&v12 initWithSourceNode:a3 targetNode:a4];
  if (result)
  {
    *((double *)result + 6) = a5;
    *((unsigned char *)result + 40) = *((unsigned char *)result + 40) & 0xFE | a6;
    if (v7) {
      char v11 = 2;
    }
    else {
      char v11 = 0;
    }
    *((unsigned char *)result + 40) = *((unsigned char *)result + 40) & 0xFD | v11;
  }
  return result;
}

+ (void)setPOIIsImproved:(BOOL)a3 onEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  BOOL v6 = a3;
  BOOL v7 = NSNumber;
  id v8 = a5;
  id v9 = [v7 numberWithBool:v6];
  [v8 persistModelProperty:v9 forKey:@"isImproved" forEdgeWithIdentifier:a4];
}

+ (void)setConfidence:(double)a3 onEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  BOOL v7 = NSNumber;
  id v8 = a5;
  id v9 = [v7 numberWithDouble:a3];
  [v8 persistModelProperty:v9 forKey:@"confidence" forEdgeWithIdentifier:a4];
}

+ (id)filterAboveConfidence:(double)a3 hasLegacyWeights:(BOOL)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v5 = [a1 filter];
    objc_super v12 = @"__weight";
    id v6 = objc_alloc(MEMORY[0x1E4F71E28]);
    BOOL v7 = [NSNumber numberWithDouble:a3];
    id v8 = (void *)[v6 initWithComparator:5 value:v7];
    v13[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v10 = [v5 filterBySettingProperties:v9];
  }
  else
  {
    id v10 = [a1 filterAboveConfidence:a3];
  }
  return v10;
}

+ (id)filterAboveConfidence:(double)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a1 filter];
  char v11 = @"confidence";
  id v5 = objc_alloc(MEMORY[0x1E4F71E28]);
  id v6 = [NSNumber numberWithDouble:a3];
  BOOL v7 = (void *)[v5 initWithComparator:5 value:v6];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v4 filterBySettingProperties:v8];

  return v9;
}

+ (MAEdgeFilter)filterSpecial
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 filter];
  id v6 = @"isSpecial";
  v7[0] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 filterBySettingProperties:v3];

  return (MAEdgeFilter *)v4;
}

+ (MAEdgeFilter)filterImproved
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 filter];
  id v6 = @"isImproved";
  v7[0] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 filterBySettingProperties:v3];

  return (MAEdgeFilter *)v4;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"POI" domain:501];
  return v2;
}

@end