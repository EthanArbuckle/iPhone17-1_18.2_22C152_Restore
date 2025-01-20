@interface PGGraphSceneEdge
+ (MAEdgeFilter)dominantSceneAssetsFilter;
+ (MAEdgeFilter)highConfidenceAssetsFilter;
+ (MAEdgeFilter)isReliableFilter;
+ (MAEdgeFilter)searchConfidenceAssetsFilter;
+ (id)filter;
+ (id)filterWithMinimumConfidence:(double)a3;
+ (id)filterWithMinimumNumberOfHighConfidenceAssets:(unint64_t)a3;
+ (unsigned)domain;
+ (void)setConfidence:(double)a3 onEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isReliable;
- (BOOL)isSearchableForEvent;
- (PGGraphSceneEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (PGGraphSceneEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (double)confidence;
- (id)debugDescription;
- (id)edgeDescription;
- (id)initFromMomentNode:(id)a3 toSceneNode:(id)a4 confidence:(double)a5 isReliable:(BOOL)a6 numberOfAssets:(unint64_t)a7 numberOfHighConfidenceAssets:(unint64_t)a8 numberOfSearchConfidenceAssets:(unint64_t)a9 numberOfDominantSceneAssets:(unint64_t)a10;
- (id)label;
- (id)propertyDictionary;
- (unint64_t)numberOfAssets;
- (unint64_t)numberOfDominantSceneAssets;
- (unint64_t)numberOfHighConfidenceAssets;
- (unint64_t)numberOfSearchConfidenceAssets;
- (unsigned)domain;
@end

@implementation PGGraphSceneEdge

- (unint64_t)numberOfDominantSceneAssets
{
  return *((unsigned int *)self + 13);
}

- (unint64_t)numberOfSearchConfidenceAssets
{
  return *((unsigned int *)self + 12);
}

- (unint64_t)numberOfHighConfidenceAssets
{
  return *((unsigned int *)self + 11);
}

- (unint64_t)numberOfAssets
{
  return *((unsigned int *)self + 10);
}

- (BOOL)isReliable
{
  return *((unsigned char *)self + 56) & 1;
}

- (double)confidence
{
  return self->_confidence;
}

- (unsigned)domain
{
  v2 = objc_opt_class();
  return [v2 domain];
}

- (id)label
{
  v2 = @"SCENE";
  return @"SCENE";
}

- (id)debugDescription
{
  v3 = [(MAEdge *)self targetNode];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v3 label];
  [(PGGraphSceneEdge *)self confidence];
  uint64_t v9 = v8;
  if ([(PGGraphSceneEdge *)self isReliable]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v11 = [v4 stringWithFormat:@"<%p:%@> %@ %.2f isReliable: %@, numberOfAssets %lu, numberOfHighConfidenceAssets %lu, numberOfSearchConfidenceAssets %lu, numberOfDominantSceneAssets %lu", self, v6, v7, v9, v10, -[PGGraphSceneEdge numberOfAssets](self, "numberOfAssets"), -[PGGraphSceneEdge numberOfHighConfidenceAssets](self, "numberOfHighConfidenceAssets"), -[PGGraphSceneEdge numberOfSearchConfidenceAssets](self, "numberOfSearchConfidenceAssets"), -[PGGraphSceneEdge numberOfDominantSceneAssets](self, "numberOfDominantSceneAssets")];

  return v11;
}

- (BOOL)isSearchableForEvent
{
  BOOL v3 = [(PGGraphSceneEdge *)self isReliable];
  if (v3)
  {
    unint64_t v4 = [(PGGraphSceneEdge *)self numberOfSearchConfidenceAssets];
    unint64_t v5 = [(PGGraphSceneEdge *)self numberOfAssets];
    unint64_t v6 = 2;
    if (v5 < 2) {
      unint64_t v6 = v5;
    }
    LOBYTE(v3) = v4 >= v6;
  }
  return v3;
}

- (id)edgeDescription
{
  BOOL v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphSceneEdge;
  uint64_t v4 = [(PGGraphOptimizedEdge *)&v9 edgeDescription];
  unint64_t v5 = (void *)v4;
  if (*((unsigned char *)self + 56)) {
    unint64_t v6 = @"Reliable";
  }
  else {
    unint64_t v6 = @"Unreliable";
  }
  v7 = [v3 stringWithFormat:@"%@ (confidence = %f, %@)", v4, *(void *)&self->_confidence, v6];

  return v7;
}

- (id)propertyDictionary
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"confidence";
  BOOL v3 = [NSNumber numberWithDouble:self->_confidence];
  v12[0] = v3;
  v11[1] = @"isReliable";
  uint64_t v4 = [NSNumber numberWithBool:*((unsigned char *)self + 56) & 1];
  v12[1] = v4;
  v11[2] = @"numberOfAssets";
  unint64_t v5 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 10)];
  v12[2] = v5;
  v11[3] = @"numberOfHighConfidenceAssets";
  unint64_t v6 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 11)];
  v12[3] = v6;
  v11[4] = @"numberOfSearchConfidenceAssets";
  v7 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 12)];
  v12[4] = v7;
  v11[5] = @"numberOfDominantSceneAssets";
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 13)];
  v12[5] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    unint64_t v6 = [v5 objectForKeyedSubscript:@"confidence"];
    v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      if (v8 != self->_confidence) {
        goto LABEL_17;
      }
    }

    objc_super v9 = [v5 objectForKeyedSubscript:@"isReliable"];
    v7 = v9;
    if (v9)
    {
      if ([v9 BOOLValue] == ((*((unsigned char *)self + 56) & 1) == 0)) {
        goto LABEL_17;
      }
    }

    v10 = [v5 objectForKeyedSubscript:@"numberOfAssets"];
    v7 = v10;
    if (v10)
    {
      if ([v10 unsignedIntegerValue] != *((_DWORD *)self + 10)) {
        goto LABEL_17;
      }
    }

    v11 = [v5 objectForKeyedSubscript:@"numberOfHighConfidenceAssets"];
    v7 = v11;
    if (v11)
    {
      if ([v11 unsignedIntegerValue] != *((_DWORD *)self + 11)) {
        goto LABEL_17;
      }
    }

    v12 = [v5 objectForKeyedSubscript:@"numberOfSearchConfidenceAssets"];
    v7 = v12;
    if (v12)
    {
      if ([v12 unsignedIntegerValue] != *((_DWORD *)self + 12)) {
        goto LABEL_17;
      }
    }

    v13 = [v5 objectForKeyedSubscript:@"numberOfDominantSceneAssets"];
    v7 = v13;
    if (v13 && [v13 unsignedIntegerValue] != *((_DWORD *)self + 13)) {
LABEL_17:
    }
      BOOL v14 = 0;
    else {
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (PGGraphSceneEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
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

    v22 = [v17 objectForKeyedSubscript:@"hconfc"];

    if (v22)
    {
      v23 = [v17 objectForKeyedSubscript:@"hconfc"];
      [v19 setObject:v23 forKeyedSubscript:@"numberOfHighConfidenceAssets"];

      [v19 setObject:0 forKeyedSubscript:@"hconfc"];
    }
    v24 = [v17 objectForKeyedSubscript:@"rlbl"];

    if (v24)
    {
      v25 = [v17 objectForKeyedSubscript:@"rlbl"];
      [v19 setObject:v25 forKeyedSubscript:@"isReliable"];

      [v19 setObject:0 forKeyedSubscript:@"rlbl"];
    }
    v26 = [v17 objectForKeyedSubscript:@"sconfc"];

    if (v26)
    {
      v27 = [v17 objectForKeyedSubscript:@"sconfc"];
      [v19 setObject:v27 forKeyedSubscript:@"numberOfSearchConfidenceAssets"];

      [v19 setObject:0 forKeyedSubscript:@"sconfc"];
    }
    v28 = [v17 objectForKeyedSubscript:@"cnt"];

    if (v28)
    {
      v29 = [v17 objectForKeyedSubscript:@"cnt"];
      [v19 setObject:v29 forKeyedSubscript:@"numberOfAssets"];

      [v19 setObject:0 forKeyedSubscript:@"cnt"];
    }
    v30 = [v17 objectForKeyedSubscript:@"domc"];

    if (v30)
    {
      v31 = [v17 objectForKeyedSubscript:@"domc"];
      [v19 setObject:v31 forKeyedSubscript:@"numberOfDominantSceneAssets"];

      [v19 setObject:0 forKeyedSubscript:@"domc"];
    }
  }
  v32 = [(PGGraphSceneEdge *)self initWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 properties:v19];

  return v32;
}

- (PGGraphSceneEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a7;
  id v11 = a5;
  id v12 = a4;
  v13 = [v10 objectForKeyedSubscript:@"confidence"];
  [v13 doubleValue];
  double v15 = v14;

  id v16 = [v10 objectForKeyedSubscript:@"isReliable"];
  uint64_t v17 = [v16 BOOLValue];

  v18 = [v10 objectForKeyedSubscript:@"numberOfAssets"];
  uint64_t v19 = [v18 unsignedIntegerValue];

  double v20 = [v10 objectForKeyedSubscript:@"numberOfHighConfidenceAssets"];
  uint64_t v21 = [v20 unsignedIntegerValue];

  v22 = [v10 objectForKeyedSubscript:@"numberOfSearchConfidenceAssets"];
  uint64_t v23 = [v22 unsignedIntegerValue];

  v24 = [v10 objectForKeyedSubscript:@"numberOfDominantSceneAssets"];

  uint64_t v25 = [v24 unsignedIntegerValue];
  v26 = [(PGGraphSceneEdge *)self initFromMomentNode:v12 toSceneNode:v11 confidence:v17 isReliable:v19 numberOfAssets:v21 numberOfHighConfidenceAssets:v23 numberOfSearchConfidenceAssets:v15 numberOfDominantSceneAssets:v25];

  return v26;
}

- (id)initFromMomentNode:(id)a3 toSceneNode:(id)a4 confidence:(double)a5 isReliable:(BOOL)a6 numberOfAssets:(unint64_t)a7 numberOfHighConfidenceAssets:(unint64_t)a8 numberOfSearchConfidenceAssets:(unint64_t)a9 numberOfDominantSceneAssets:(unint64_t)a10
{
  int v10 = a9;
  int v11 = a8;
  int v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)PGGraphSceneEdge;
  id result = [(PGGraphEdge *)&v16 initWithSourceNode:a3 targetNode:a4];
  if (result)
  {
    *((double *)result + 8) = a5;
    *((unsigned char *)result + 56) = *((unsigned char *)result + 56) & 0xFE | a6;
    *((_DWORD *)result + 10) = v12;
    *((_DWORD *)result + 11) = v11;
    *((_DWORD *)result + 12) = v10;
    *((_DWORD *)result + 13) = a10;
  }
  return result;
}

+ (void)setConfidence:(double)a3 onEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  v7 = NSNumber;
  id v8 = a5;
  id v9 = [v7 numberWithDouble:a3];
  [v8 persistModelProperty:v9 forKey:@"confidence" forEdgeWithIdentifier:a4];
}

+ (unsigned)domain
{
  return 600;
}

+ (id)filterWithMinimumConfidence:(double)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a1 filter];
  int v11 = @"confidence";
  id v5 = objc_alloc(MEMORY[0x1E4F71E28]);
  unint64_t v6 = [NSNumber numberWithDouble:a3];
  v7 = (void *)[v5 initWithComparator:6 value:v6];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v4 filterBySettingProperties:v8];

  return v9;
}

+ (id)filterWithMinimumNumberOfHighConfidenceAssets:(unint64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a1 filter];
  int v11 = @"numberOfHighConfidenceAssets";
  id v5 = objc_alloc(MEMORY[0x1E4F71E28]);
  unint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  v7 = (void *)[v5 initWithComparator:6 value:v6];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [v4 filterBySettingProperties:v8];

  return v9;
}

+ (MAEdgeFilter)dominantSceneAssetsFilter
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 filter];
  v7 = @"numberOfDominantSceneAssets";
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:5 value:&unk_1F28D0E58];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v2 filterBySettingProperties:v4];

  return (MAEdgeFilter *)v5;
}

+ (MAEdgeFilter)searchConfidenceAssetsFilter
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 filter];
  v7 = @"numberOfSearchConfidenceAssets";
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:5 value:&unk_1F28D0E58];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v2 filterBySettingProperties:v4];

  return (MAEdgeFilter *)v5;
}

+ (MAEdgeFilter)highConfidenceAssetsFilter
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 filter];
  v7 = @"numberOfHighConfidenceAssets";
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:5 value:&unk_1F28D0E58];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v2 filterBySettingProperties:v4];

  return (MAEdgeFilter *)v5;
}

+ (MAEdgeFilter)isReliableFilter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 filter];
  unint64_t v6 = @"isReliable";
  v7[0] = MEMORY[0x1E4F1CC38];
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 filterBySettingProperties:v3];

  return (MAEdgeFilter *)v4;
}

+ (id)filter
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F71EB0]), "initWithLabel:domain:", @"SCENE", objc_msgSend(a1, "domain"));
  return v2;
}

@end