@interface PGGraphVisualLookupSceneEdge
+ (id)filter;
- (BOOL)hasProperties:(id)a3;
- (PGGraphVisualLookupSceneEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (double)confidence;
- (id)initFromMomentNode:(id)a3 toVisualLookupSceneNode:(id)a4 confidence:(double)a5 numberOfAssets:(unint64_t)a6;
- (id)label;
- (id)propertyDictionary;
- (unint64_t)numberOfAssets;
- (unsigned)domain;
@end

@implementation PGGraphVisualLookupSceneEdge

- (unint64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (double)confidence
{
  return self->_confidence;
}

- (unsigned)domain
{
  return 602;
}

- (id)label
{
  v2 = @"VISUAL_LOOKUP_SCENE";
  return @"VISUAL_LOOKUP_SCENE";
}

- (id)propertyDictionary
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"confidence";
  v3 = [NSNumber numberWithDouble:self->_confidence];
  v7[1] = @"numberOfAssets";
  v8[0] = v3;
  v4 = [NSNumber numberWithUnsignedInteger:self->_numberOfAssets];
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

      v9 = [v5 objectForKeyedSubscript:@"numberOfAssets"];
      v7 = v9;
      if (!v9 || [v9 unsignedIntegerValue] == self->_numberOfAssets) {
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

- (PGGraphVisualLookupSceneEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a7;
  id v11 = a5;
  id v12 = a4;
  v13 = [v10 objectForKeyedSubscript:@"confidence"];
  [v13 doubleValue];
  double v15 = v14;

  v16 = [v10 objectForKeyedSubscript:@"numberOfAssets"];

  uint64_t v17 = [v16 unsignedIntegerValue];
  v18 = [(PGGraphVisualLookupSceneEdge *)self initFromMomentNode:v12 toVisualLookupSceneNode:v11 confidence:v17 numberOfAssets:v15];

  return v18;
}

- (id)initFromMomentNode:(id)a3 toVisualLookupSceneNode:(id)a4 confidence:(double)a5 numberOfAssets:(unint64_t)a6
{
  v9.receiver = self;
  v9.super_class = (Class)PGGraphVisualLookupSceneEdge;
  id result = [(PGGraphEdge *)&v9 initWithSourceNode:a3 targetNode:a4];
  if (result)
  {
    *((double *)result + 6) = a5;
    *((void *)result + 5) = a6;
  }
  return result;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"VISUAL_LOOKUP_SCENE" domain:602];
  return v2;
}

@end