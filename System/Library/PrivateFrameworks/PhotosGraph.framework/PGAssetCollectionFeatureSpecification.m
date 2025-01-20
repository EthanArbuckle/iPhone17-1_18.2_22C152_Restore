@interface PGAssetCollectionFeatureSpecification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldCreateFeatureNodeIfNeeded;
- (BOOL)shouldRunAtMomentIngest;
- (CLSFeederPrefetchOptions)assetFeederPrefetchOptions;
- (NSArray)featureDefinitions;
- (NSSet)featureNodes;
- (NSString)featureLabel;
- (PGAssetCollectionFeatureSpecification)initWithCoder:(id)a3;
- (PGAssetCollectionFeatureSpecification)initWithFeatureType:(unint64_t)a3 featureLabel:(id)a4 featureDefinitions:(id)a5 shouldRunAtMomentIngest:(BOOL)a6 shouldCreateFeatureNodeIfNeeded:(BOOL)a7;
- (id)_assetUUIDsFromAssets:(id)a3;
- (id)addFeatureNodeIfNeededWithGraphBuilder:(id)a3;
- (id)description;
- (id)featureNodesForMomentNodeCollection:(id)a3;
- (id)instanceWithMomentNode:(id)a3;
- (unint64_t)featureType;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateFeatureNodesWithInstance:(id)a3 assets:(id)a4 curationContext:(id)a5 usingBlock:(id)a6;
- (void)setFeatureNodes:(id)a3;
@end

@implementation PGAssetCollectionFeatureSpecification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetFeederPrefetchOptions, 0);
  objc_storeStrong((id *)&self->_featureNodes, 0);
  objc_storeStrong((id *)&self->_featureDefinitions, 0);
  objc_storeStrong((id *)&self->_featureLabel, 0);
}

- (void)setFeatureNodes:(id)a3
{
}

- (NSSet)featureNodes
{
  return self->_featureNodes;
}

- (NSArray)featureDefinitions
{
  return self->_featureDefinitions;
}

- (NSString)featureLabel
{
  return self->_featureLabel;
}

- (unint64_t)featureType
{
  return self->_featureType;
}

- (BOOL)shouldRunAtMomentIngest
{
  return self->_shouldRunAtMomentIngest;
}

- (BOOL)shouldCreateFeatureNodeIfNeeded
{
  return self->_shouldCreateFeatureNodeIfNeeded;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (PGAssetCollectionFeatureSpecification *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      BOOL shouldRunAtMomentIngest = self->_shouldRunAtMomentIngest;
      if (shouldRunAtMomentIngest != [(PGAssetCollectionFeatureSpecification *)v6 shouldRunAtMomentIngest]|| (BOOL shouldCreateFeatureNodeIfNeeded = self->_shouldCreateFeatureNodeIfNeeded, shouldCreateFeatureNodeIfNeeded != [(PGAssetCollectionFeatureSpecification *)v6 shouldCreateFeatureNodeIfNeeded])|| (featureType = self->_featureType, featureType != [(PGAssetCollectionFeatureSpecification *)v6 featureType]))
      {
        char v13 = 0;
LABEL_12:

        goto LABEL_13;
      }
      featureLabel = self->_featureLabel;
      v11 = [(PGAssetCollectionFeatureSpecification *)v6 featureLabel];
      if (featureLabel == v11
        || (v12 = self->_featureLabel,
            [(PGAssetCollectionFeatureSpecification *)v6 featureLabel],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(NSString *)v12 isEqualToString:v3]))
      {
        featureDefinitions = self->_featureDefinitions;
        v16 = [(PGAssetCollectionFeatureSpecification *)v6 featureDefinitions];
        char v13 = [(NSArray *)featureDefinitions isEqualToArray:v16];

        if (featureLabel == v11)
        {
LABEL_16:

          goto LABEL_12;
        }
      }
      else
      {
        char v13 = 0;
      }

      goto LABEL_16;
    }
    char v13 = 0;
  }
LABEL_13:

  return v13;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v12.receiver = self;
  v12.super_class = (Class)PGAssetCollectionFeatureSpecification;
  v4 = [(PGAssetCollectionFeatureSpecification *)&v12 description];
  v5 = [v3 stringWithFormat:@"%@", v4];

  unint64_t featureType = self->_featureType;
  if (featureType > 0xD) {
    v7 = &stru_1F283BC78;
  }
  else {
    v7 = off_1E68E74F8[featureType];
  }
  [v5 appendFormat:@" %@: %@", @"featureType", v7];
  [v5 appendFormat:@" %@: %@", @"featureLabel", self->_featureLabel];
  v8 = [(NSArray *)self->_featureDefinitions description];
  [v5 appendFormat:@" %@: %@", @"featureDefinitions", v8];

  if (self->_shouldRunAtMomentIngest) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v5 appendFormat:@" %@: %@", @"shouldRunAtMomentIngest", v9];
  if (self->_shouldCreateFeatureNodeIfNeeded) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v5 appendFormat:@" %@: %@", @"shouldCreateFeatureNodeIfNeeded", v10];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_featureType forKey:@"featureType"];
  featureLabel = self->_featureLabel;
  if (featureLabel) {
    [v5 encodeObject:featureLabel forKey:@"featureLabel"];
  }
  [v5 encodeObject:self->_featureDefinitions forKey:@"featureDefinitions"];
  [v5 encodeBool:self->_shouldRunAtMomentIngest forKey:@"shouldRunAtMomentIngest"];
  [v5 encodeBool:self->_shouldCreateFeatureNodeIfNeeded forKey:@"shouldCreateFeatureNodeIfNeeded"];
}

- (PGAssetCollectionFeatureSpecification)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"featureType"];
  v6 = [v4 decodeObjectForKey:@"featureLabel"];
  v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"featureDefinitions"];
  uint64_t v8 = [v4 decodeBoolForKey:@"shouldRunAtMomentIngest"];
  uint64_t v9 = [v4 decodeBoolForKey:@"shouldCreateFeatureNodeIfNeeded"];

  v10 = [(PGAssetCollectionFeatureSpecification *)self initWithFeatureType:v5 featureLabel:v6 featureDefinitions:v7 shouldRunAtMomentIngest:v8 shouldCreateFeatureNodeIfNeeded:v9];
  return v10;
}

- (id)_assetUUIDsFromAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "uuid", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)instanceWithMomentNode:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_shouldCreateFeatureNodeIfNeeded)
  {
    uint64_t v6 = [[PGAssetCollectionFeatureInstance alloc] initWithSpecification:self momentNode:v4];
  }
  else
  {
    uint64_t v7 = [v4 collection];
    uint64_t v8 = [(PGAssetCollectionFeatureSpecification *)self featureNodesForMomentNodeCollection:v7];

    if ([v8 count]) {
      uint64_t v6 = [[PGAssetCollectionFeatureInstance alloc] initWithSpecification:self momentNode:v5 featureNodes:v8];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (id)addFeatureNodeIfNeededWithGraphBuilder:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_shouldCreateFeatureNodeIfNeeded)
  {
    uint64_t v6 = [v4 graph];
    uint64_t v7 = 0;
    switch(self->_featureType)
    {
      case 3uLL:
        long long v13 = +[PGGraphROINode beachFilter];
        uint64_t v14 = [v6 numberOfNodesMatchingFilter:v13];

        if (v14) {
          goto LABEL_20;
        }
        long long v15 = v5;
        uint64_t v16 = 2;
        goto LABEL_17;
      case 4uLL:
        uint64_t v17 = +[PGGraphROINode mountainFilter];
        uint64_t v18 = [v6 numberOfNodesMatchingFilter:v17];

        if (v18) {
          goto LABEL_20;
        }
        long long v15 = v5;
        uint64_t v16 = 3;
        goto LABEL_17;
      case 5uLL:
        v19 = +[PGGraphROINode natureFilter];
        uint64_t v20 = [v6 numberOfNodesMatchingFilter:v19];

        if (v20) {
          goto LABEL_20;
        }
        long long v15 = v5;
        uint64_t v16 = 4;
        goto LABEL_17;
      case 6uLL:
        v21 = +[PGGraphROINode urbanFilter];
        uint64_t v22 = [v6 numberOfNodesMatchingFilter:v21];

        if (v22) {
          goto LABEL_20;
        }
        long long v15 = v5;
        uint64_t v16 = 1;
        goto LABEL_17;
      case 7uLL:
        v23 = +[PGGraphROINode waterFilter];
        uint64_t v24 = [v6 numberOfNodesMatchingFilter:v23];

        if (v24) {
          goto LABEL_20;
        }
        long long v15 = v5;
        uint64_t v16 = 5;
LABEL_17:
        uint64_t v25 = [v15 insertROINodeWithType:v16];
        goto LABEL_23;
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xDuLL:
        if (!self->_featureLabel) {
          goto LABEL_20;
        }
        uint64_t v8 = +[PGGraphSceneFeatureNode filterForSceneName:](PGGraphSceneFeatureNode, "filterForSceneName:");
        uint64_t v9 = [v6 numberOfNodesMatchingFilter:v8];

        if (v9) {
          goto LABEL_20;
        }
        featureLabel = self->_featureLabel;
        v11 = v6;
        uint64_t v12 = 601;
        goto LABEL_22;
      case 0xCuLL:
        if (self->_featureLabel
          && (+[PGGraphAudioFeatureNode filterForAudioFeatureLabel:](PGGraphAudioFeatureNode, "filterForAudioFeatureLabel:"), v26 = objc_claimAutoreleasedReturnValue(), uint64_t v27 = [v6 numberOfNodesMatchingFilter:v26], v26, !v27))
        {
          featureLabel = self->_featureLabel;
          v11 = v6;
          uint64_t v12 = 1201;
LABEL_22:
          uint64_t v25 = [v11 addUniqueNodeWithLabel:featureLabel domain:v12 properties:0 didCreate:0];
LABEL_23:
          uint64_t v7 = (void *)v25;
        }
        else
        {
LABEL_20:
          uint64_t v7 = 0;
        }
LABEL_24:

        break;
      default:
        goto LABEL_24;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)featureNodesForMomentNodeCollection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 graph];
  uint64_t v6 = [(MAElementCollection *)[PGGraphFeatureNodeCollection alloc] initWithGraph:v5];
  switch(self->_featureType)
  {
    case 1uLL:
      uint64_t v8 = [v4 consolidatedPersonNodes];
      break;
    case 2uLL:
      uint64_t v8 = [v4 socialGroupNodes];
      break;
    case 3uLL:
      uint64_t v8 = [v4 beachRoiNodes];
      break;
    case 4uLL:
      uint64_t v8 = [v4 mountainRoiNodes];
      break;
    case 5uLL:
      uint64_t v8 = [v4 natureRoiNodes];
      break;
    case 6uLL:
      uint64_t v8 = [v4 urbanRoiNodes];
      break;
    case 7uLL:
      uint64_t v8 = [v4 waterRoiNodes];
      break;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xDuLL:
      featureLabel = self->_featureLabel;
      if (!featureLabel) {
        goto LABEL_15;
      }
      uint64_t v8 = +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:featureLabel inGraph:v5];
      break;
    case 0xBuLL:
      uint64_t v8 = [v4 petNodes];
      break;
    case 0xCuLL:
      uint64_t v9 = self->_featureLabel;
      if (!v9) {
        goto LABEL_15;
      }
      uint64_t v8 = +[PGGraphAudioFeatureNodeCollection audioFeatureNodesForLabel:v9 inGraph:v5];
      break;
    default:
      goto LABEL_15;
  }
  v10 = v8;
  uint64_t v11 = [v8 featureNodeCollection];

  uint64_t v6 = (PGGraphFeatureNodeCollection *)v11;
LABEL_15:

  return v6;
}

- (void)enumerateFeatureNodesWithInstance:(id)a3 assets:(id)a4 curationContext:(id)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 featureNodes];
  long long v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    uint64_t v17 = [v10 momentNode];
    uint64_t v18 = [v17 collection];
    id v16 = [(PGAssetCollectionFeatureSpecification *)self featureNodesForMomentNodeCollection:v18];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __109__PGAssetCollectionFeatureSpecification_enumerateFeatureNodesWithInstance_assets_curationContext_usingBlock___block_invoke;
  v22[3] = &unk_1E68E74D8;
  v22[4] = self;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  [v16 enumerateIdentifiersAsCollectionsWithBlock:v22];
}

void __109__PGAssetCollectionFeatureSpecification_enumerateFeatureNodesWithInstance_assets_curationContext_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v48 = a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v51 = [MEMORY[0x1E4F1CA80] set];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v53 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v53)
  {
    uint64_t v50 = *(void *)v56;
    id v52 = v5;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v56 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v55 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "_assetUUIDsFromAssets:", *(void *)(a1 + 40), v48);
        uint64_t v9 = (void *)[v8 mutableCopy];

        id v10 = *(id *)(a1 + 40);
        id v11 = [v7 sceneAssetFilter];

        if (v11)
        {
          id v12 = [v7 sceneAssetFilter];
          uint64_t v13 = [v12 filteredAssetsFromAssets:v10];

          uint64_t v14 = [*(id *)(a1 + 32) _assetUUIDsFromAssets:v13];
          [v9 intersectSet:v14];

          id v10 = (id)v13;
        }
        long long v15 = [v7 CLIPQueryAssetFilter];

        if (v15)
        {
          id v16 = [v7 CLIPQueryAssetFilter];
          uint64_t v17 = [v16 filteredAssetsFromAssets:v10];

          uint64_t v18 = [*(id *)(a1 + 32) _assetUUIDsFromAssets:v17];
          [v9 intersectSet:v18];

          id v10 = (id)v17;
        }
        id v19 = [v7 audioAssetFilter];

        if (v19)
        {
          id v20 = [v7 audioAssetFilter];
          uint64_t v21 = [v20 filteredAssetsFromAssets:v10];

          uint64_t v22 = [*(id *)(a1 + 32) _assetUUIDsFromAssets:v21];
          [v9 intersectSet:v22];

          id v10 = (id)v21;
        }
        id v23 = [v7 peopleAssetFilter];

        if (v23)
        {
          id v24 = +[PGGraphNodeCollection subsetInCollection:v5];
          if ([v24 count])
          {
            id v25 = [v24 localIdentifiers];
            v26 = [v25 anyObject];
          }
          else
          {
            id v25 = +[PGGraphNodeCollection subsetInCollection:v5];
            uint64_t v27 = [v25 localIdentifiers];
            v26 = [v27 anyObject];
          }
          if (v26)
          {
            v28 = [v7 peopleAssetFilter];
            uint64_t v29 = [v28 filteredAssetsFromAssets:v10 withPersonOrPetLocalIdentifier:v26];

            v30 = [*(id *)(a1 + 32) _assetUUIDsFromAssets:v29];
            id v10 = (id)v29;
            id v5 = v52;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PGAssetCollectionFeatureSpecification] expected a nonnull person or pet person local identifier for peopleAssetFilter", buf, 2u);
            }
            v30 = [MEMORY[0x1E4F1CAD0] set];
          }
          [v9 intersectSet:v30];
        }
        v31 = [v7 socialGroupAssetFilter];

        if (v31)
        {
          v32 = +[PGGraphNodeCollection subsetInCollection:v5];
          v33 = [v32 personNodes];
          if ([v33 count] == 1)
          {
            v34 = [v33 graph];
            v35 = +[PGGraphNodeCollection nodesInGraph:v34];

            uint64_t v36 = [v33 collectionByFormingUnionWith:v35];

            v33 = (void *)v36;
          }
          v37 = [v7 socialGroupAssetFilter];
          v38 = [v33 localIdentifiers];
          uint64_t v39 = [v37 filteredAssetsFromAssets:v10 withPersonLocalIdentifiersInSocialGroup:v38];

          v40 = [*(id *)(a1 + 32) _assetUUIDsFromAssets:v39];
          [v9 intersectSet:v40];

          id v10 = (id)v39;
          id v5 = v52;
        }
        v41 = [v7 customAssetFilter];

        if (v41)
        {
          v42 = [v7 customAssetFilter];
          uint64_t v43 = [v42 filteredAssetsFromAssets:v10 curationContext:*(void *)(a1 + 48)];

          v44 = [*(id *)(a1 + 32) _assetUUIDsFromAssets:v43];
          [v9 intersectSet:v44];

          id v10 = (id)v43;
        }
        [v51 unionSet:v9];

        ++v6;
      }
      while (v53 != v6);
      uint64_t v53 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v53);
  }

  if ([v51 count])
  {
    uint64_t v45 = *(void *)(a1 + 56);
    v46 = [v5 anyNode];
    v47 = [v51 allObjects];
    (*(void (**)(uint64_t, void *, void *, uint64_t))(v45 + 16))(v45, v46, v47, v48);
  }
}

- (CLSFeederPrefetchOptions)assetFeederPrefetchOptions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F76C98]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_featureDefinitions;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "sceneAssetFilter", (void)v15);

        if (v10) {
          [v3 setScenesPrefetchMode:2];
        }
        id v11 = [v9 CLIPQueryAssetFilter];

        if (v11) {
          [v3 setScenesPrefetchMode:2];
        }
        id v12 = [v9 peopleAssetFilter];
        if (v12)
        {
        }
        else
        {
          uint64_t v13 = [v9 socialGroupAssetFilter];

          if (!v13) {
            continue;
          }
        }
        [v3 setPersonsPrefetchMode:2];
        [v3 setFaceInformationPrefetchMode:2];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return (CLSFeederPrefetchOptions *)v3;
}

- (PGAssetCollectionFeatureSpecification)initWithFeatureType:(unint64_t)a3 featureLabel:(id)a4 featureDefinitions:(id)a5 shouldRunAtMomentIngest:(BOOL)a6 shouldCreateFeatureNodeIfNeeded:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PGAssetCollectionFeatureSpecification;
  long long v15 = [(PGAssetCollectionFeatureSpecification *)&v18 init];
  long long v16 = v15;
  if (v15)
  {
    v15->_unint64_t featureType = a3;
    objc_storeStrong((id *)&v15->_featureLabel, a4);
    objc_storeStrong((id *)&v16->_featureDefinitions, a5);
    v16->_BOOL shouldRunAtMomentIngest = a6;
    v16->_BOOL shouldCreateFeatureNodeIfNeeded = a7;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end