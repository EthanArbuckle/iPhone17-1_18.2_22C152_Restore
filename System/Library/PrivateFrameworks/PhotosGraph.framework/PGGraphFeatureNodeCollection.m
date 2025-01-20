@interface PGGraphFeatureNodeCollection
+ (MARelation)memoryOfFeature;
+ (MARelation)momentOfFeature;
+ (PGGraphFeatureNodeCollection)featureNodeCollectionWithCollection:(id)a3;
+ (PGGraphFeatureNodeCollection)featureNodeCollectionWithFeatures:(id)a3 inGraph:(id)a4;
- (NSSet)featureIdentifiers;
- (PGGraphMemoryNodeCollection)memoryNodes;
- (PGGraphMomentNodeCollection)momentNodes;
- (id)allFeatures;
@end

@implementation PGGraphFeatureNodeCollection

- (NSSet)featureIdentifiers
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PGGraphFeatureNodeCollection_featureIdentifiers__block_invoke;
  v6[3] = &unk_1E68EFFA0;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateNodesUsingBlock:v6];

  return (NSSet *)v4;
}

void __50__PGGraphFeatureNodeCollection_featureIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 featureIdentifier];
  [*(id *)(a1 + 32) addObject:v3];
}

- (id)allFeatures
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PGGraphFeatureNodeCollection_allFeatures__block_invoke;
  v6[3] = &unk_1E68EFF78;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateNodesUsingBlock:v6];

  return v4;
}

void __43__PGGraphFeatureNodeCollection_allFeatures__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F28DE280])
  {
    uint64_t v4 = +[PGFeature featureWithType:node:](PGFeature, "featureWithType:node:", [v3 featureType], v3);
    if (v4)
    {
      v5 = v4;
      [*(id *)(a1 + 32) addObject:v4];
    }
    else
    {
      v10 = +[PGLogging sharedLogging];
      v11 = [v10 loggingConnection];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = [v3 label];
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        int v15 = 138412546;
        v16 = v12;
        __int16 v17 = 2112;
        v18 = v14;
        _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "No feature found for feature node with label %@ of class %@", (uint8_t *)&v15, 0x16u);
      }
      v5 = 0;
    }
  }
  else
  {
    v6 = +[PGLogging sharedLogging];
    v5 = [v6 loggingConnection];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v3 label];
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int v15 = 138412546;
      v16 = v7;
      __int16 v17 = 2112;
      v18 = v9;
      _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "Node with label %@ of class %@ in PGGraphFeatureNodeCollection does not conform to PGAssetCollectionFeature protocol", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (PGGraphMomentNodeCollection)momentNodes
{
  id v3 = +[PGGraphFeatureNodeCollection momentOfFeature];
  uint64_t v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMemoryNodeCollection)memoryNodes
{
  id v3 = +[PGGraphMemoryFeaturesEdge filter];
  uint64_t v4 = [v3 inRelation];
  v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphMemoryNodeCollection *)v5;
}

+ (PGGraphFeatureNodeCollection)featureNodeCollectionWithFeatures:(id)a3 inGraph:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v22 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v24;
    *(void *)&long long v9 = 138412290;
    long long v21 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "nodeInGraph:", v6, v21);
        int v15 = v14;
        if (v14)
        {
          if ([v14 conformsToProtocol:&unk_1F28DE280])
          {
            objc_msgSend(v22, "addIdentifier:", objc_msgSend(v15, "identifier"));
            goto LABEL_14;
          }
          v18 = +[PGLogging sharedLogging];
          __int16 v17 = [v18 loggingConnection];

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v28 = v13;
            _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Feature node found for feature (%@) does not conform PGAssetCollectionFeature protocol", buf, 0xCu);
          }
        }
        else
        {
          v16 = +[PGLogging sharedLogging];
          __int16 v17 = [v16 loggingConnection];

          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v21;
            v28 = v13;
            _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Feature node for feature (%@) not found in graph", buf, 0xCu);
          }
        }

LABEL_14:
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v10);
  }

  uint64_t v19 = [(MAElementCollection *)[PGGraphFeatureNodeCollection alloc] initWithGraph:v6 elementIdentifiers:v22];
  return v19;
}

+ (PGGraphFeatureNodeCollection)featureNodeCollectionWithCollection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [PGGraphFeatureNodeCollection alloc];
  id v5 = [v3 graph];
  id v6 = [v3 elementIdentifiers];

  id v7 = [(MAElementCollection *)v4 initWithGraph:v5 elementIdentifiers:v6];
  return v7;
}

+ (MARelation)memoryOfFeature
{
  v2 = +[PGGraphMemoryFeaturesEdge filter];
  id v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)momentOfFeature
{
  v2 = +[PGGraphMomentFeaturesEdge filter];
  id v3 = [v2 inRelation];

  return (MARelation *)v3;
}

@end