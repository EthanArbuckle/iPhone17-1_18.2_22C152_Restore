@interface PGGraphMomentFeaturesEdge
+ (id)filter;
+ (id)relevantAssetUUIDsFromAllAssetUUIDs:(id)a3;
- (BOOL)hasProperties:(id)a3;
- (PGGraphMomentFeaturesEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromMomentNode:(id)a3 toFeatureNode:(id)a4 numberOfRelevantAssets:(unint64_t)a5 allAssetUUIDs:(id)a6;
- (id)initFromMomentNode:(id)a3 toFeatureNode:(id)a4 numberOfRelevantAssets:(unint64_t)a5 relevantAssetUUIDs:(id)a6;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
@end

@implementation PGGraphMomentFeaturesEdge

- (void).cxx_destruct
{
}

- (unsigned)domain
{
  return 1200;
}

- (id)label
{
  v2 = @"MOMENT_FEATURES";
  return @"MOMENT_FEATURES";
}

- (id)propertyDictionary
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"rlvacnt";
  v3 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 12)];
  v6[1] = @"rlvaids";
  v7[0] = v3;
  v7[1] = self->_allAssetUUIDs;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"rlvacnt"];
    v7 = v6;
    BOOL v9 = 0;
    if (!v6 || [v6 unsignedIntegerValue] == *((_DWORD *)self + 12))
    {

      v8 = [v5 objectForKeyedSubscript:@"rlvaids"];
      v7 = v8;
      if (!v8 || [v8 isEqual:self->_allAssetUUIDs]) {
        BOOL v9 = 1;
      }
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (PGGraphMomentFeaturesEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a7;
  id v11 = a5;
  id v12 = a4;
  v13 = [v10 objectForKeyedSubscript:@"rlvacnt"];
  uint64_t v14 = [v13 unsignedIntegerValue];

  v15 = [v10 objectForKeyedSubscript:@"rlvaids"];

  v16 = [(PGGraphMomentFeaturesEdge *)self initFromMomentNode:v12 toFeatureNode:v11 numberOfRelevantAssets:v14 allAssetUUIDs:v15];
  return v16;
}

- (id)initFromMomentNode:(id)a3 toFeatureNode:(id)a4 numberOfRelevantAssets:(unint64_t)a5 relevantAssetUUIDs:(id)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = [a6 componentsJoinedByString:@","];
  id v13 = [(PGGraphMomentFeaturesEdge *)self initFromMomentNode:v11 toFeatureNode:v10 numberOfRelevantAssets:a5 allAssetUUIDs:v12];

  return v13;
}

- (id)initFromMomentNode:(id)a3 toFeatureNode:(id)a4 numberOfRelevantAssets:(unint64_t)a5 allAssetUUIDs:(id)a6
{
  int v7 = a5;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PGGraphMomentFeaturesEdge;
  id v12 = [(PGGraphEdge *)&v15 initWithSourceNode:a3 targetNode:a4];
  id v13 = v12;
  if (v12)
  {
    *((_DWORD *)v12 + 12) = v7;
    objc_storeStrong((id *)&v12->_allAssetUUIDs, a6);
  }

  return v13;
}

+ (id)relevantAssetUUIDsFromAllAssetUUIDs:(id)a3
{
  return (id)[a3 componentsSeparatedByString:@","];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"MOMENT_FEATURES" domain:1200];
  return v2;
}

@end