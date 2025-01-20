@interface PGFingerprint
+ (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6;
+ (id)_assetFingerprintWithFeatureExtractor:(id)a3 forAsset:(id)a4 withTransformers:(id)a5 error:(id *)a6;
+ (id)assetCollectionFingerprintWithVersion:(int64_t)a3 forAssetCollection:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 error:(id *)a7;
+ (id)assetCollectionFingerprintsDataframeWithVersion:(int64_t)a3 forAssetCollections:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 progressReporter:(id)a7 error:(id *)a8;
+ (id)assetCollectionFingerprintsWithVersion:(int64_t)a3 forAssetCollections:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 error:(id *)a7;
+ (id)assetFingerprintWithVersion:(int64_t)a3 forAsset:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 error:(id *)a7;
+ (id)assetFingerprintsDataframeWithVersion:(int64_t)a3 forAssets:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 progressReporter:(id)a7 error:(id *)a8;
+ (id)assetFingerprintsWithVersion:(int64_t)a3 forAssets:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 error:(id *)a7;
+ (id)memoryFeatureNodesFingerprintsDataFrameWithVersion:(int64_t)a3 forFeatureNodes:(id)a4 uniqueMemoryIdentifiers:(id)a5 withGraph:(id)a6 progressReporter:(id)a7 error:(id *)a8;
+ (id)momentNodeFingerprintsDataFrameWithVersion:(int64_t)a3 forMomentNodes:(id)a4 withGraph:(id)a5 progressReporter:(id)a6 error:(id *)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFingerprint:(id)a3;
- (MAFloatVector)floatArray;
- (NSArray)featureNames;
- (PGFingerprint)initWithFloatArray:(id)a3 withFeatureNames:(id)a4;
- (void)setFeatureNames:(id)a3;
- (void)setFloatArray:(id)a3;
@end

@implementation PGFingerprint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->featureNames, 0);
  objc_storeStrong((id *)&self->floatArray, 0);
}

- (void)setFeatureNames:(id)a3
{
}

- (NSArray)featureNames
{
  return self->featureNames;
}

- (void)setFloatArray:(id)a3
{
}

- (MAFloatVector)floatArray
{
  return self->floatArray;
}

- (BOOL)isEqualToFingerprint:(id)a3
{
  id v4 = a3;
  v5 = [(PGFingerprint *)self floatArray];
  v6 = [v4 floatArray];

  LOBYTE(v4) = [v5 isApproximatelyEqualTo:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PGFingerprint *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PGFingerprint *)self isEqualToFingerprint:v4];
  }

  return v5;
}

- (PGFingerprint)initWithFloatArray:(id)a3 withFeatureNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGFingerprint;
  v8 = [(PGFingerprint *)&v11 init];
  if (v8)
  {
    v9 = (void *)[v6 copy];
    [(PGFingerprint *)v8 setFloatArray:v9];

    [(PGFingerprint *)v8 setFeatureNames:v7];
  }

  return v8;
}

+ (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v11 = a5;
    id v12 = objc_alloc_init(v10);
    [v12 setObject:v11 forKey:*MEMORY[0x1E4F28568]];

    if (v9) {
      [v12 setObject:v9 forKey:*MEMORY[0x1E4F28A50]];
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotosGraph.PGFingerprint" code:a4 userInfo:v12];
  }
  return 0;
}

+ (id)memoryFeatureNodesFingerprintsDataFrameWithVersion:(int64_t)a3 forFeatureNodes:(id)a4 uniqueMemoryIdentifiers:(id)a5 withGraph:(id)a6 progressReporter:(id)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!+[PGFingerprintVersionHelper isMemoryNodeFingerprintVersion:a3])
  {
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"Fingerprint version not supported for memory node collection: %ld", a3);
    [a1 _generateError:a8 errorCode:1 errorMessage:v19 underlyingError:0];
    goto LABEL_6;
  }
  v18 = +[PGFingerprintVersionHelper featureExtractorForFingerprintVersion:a3 withGraph:v16 withTransformers:0 error:a8];
  v19 = v18;
  if (!v18)
  {
    if (!a8)
    {
      v19 = 0;
      goto LABEL_19;
    }
    if (!*a8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Failed to build feature extractor for fingerprint version: %ld", a3);
      v21 = (id *)objc_claimAutoreleasedReturnValue();
      [a1 _generateError:a8 errorCode:2 errorMessage:v21 underlyingError:0];
LABEL_16:
      a8 = 0;
      goto LABEL_18;
    }
    v19 = 0;
LABEL_6:
    a8 = 0;
    goto LABEL_19;
  }
  v20 = [v18 featureVectorsWithEntities:v14 entityLabels:v15 progressReporter:v17 error:a8];
  if (!v20)
  {
    if (!a8)
    {
      v21 = 0;
      goto LABEL_18;
    }
    if (!*a8)
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to extract feature vectors for (%ld) memories.", objc_msgSend(v14, "count"));
      [a1 _generateError:a8 errorCode:3 errorMessage:v22 underlyingError:0];
    }
    v21 = 0;
    goto LABEL_16;
  }
  v21 = v20;
  a8 = v21;
LABEL_18:

LABEL_19:
  return a8;
}

+ (id)momentNodeFingerprintsDataFrameWithVersion:(int64_t)a3 forMomentNodes:(id)a4 withGraph:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (+[PGFingerprintVersionHelper isMomentNodeFingerprintVersion:a3])
  {
    id v15 = +[PGFingerprintVersionHelper featureExtractorForFingerprintVersion:a3 withGraph:v13 withTransformers:0 error:a7];
    if (v15)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      v31 = __108__PGFingerprint_momentNodeFingerprintsDataFrameWithVersion_forMomentNodes_withGraph_progressReporter_error___block_invoke;
      v32 = &unk_1E68ED488;
      id v33 = v13;
      id v18 = v16;
      id v34 = v18;
      id v19 = v17;
      id v35 = v19;
      [v12 enumerateUUIDsUsingBlock:&v29];
      v20 = [v15 featureVectorsWithEntities:v19 entityLabels:v18 progressReporter:v14 error:a7];
      v21 = v20;
      if (v20)
      {
        id v22 = v20;
      }
      else if (a7 && !*a7)
      {
        v26 = NSString;
        uint64_t v27 = [v19 count];
        v28 = objc_msgSend(v26, "stringWithFormat:", @"Failed to extract feature vectors for (%ld) moment nodes.", v27, v29, v30, v31, v32, v33, v34);
        [a1 _generateError:a7 errorCode:3 errorMessage:v28 underlyingError:0];
      }
    }
    else
    {
      if (a7 && !*a7)
      {
        v24 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to build feature extractor for fingerprint version: %ld", a3);
        [a1 _generateError:a7 errorCode:2 errorMessage:v24 underlyingError:0];
      }
      v21 = 0;
    }
  }
  else
  {
    v23 = objc_msgSend(NSString, "stringWithFormat:", @"Fingerprint version not supported for moment node collection: %ld", a3);
    [a1 _generateError:a7 errorCode:1 errorMessage:v23 underlyingError:0];

    v21 = 0;
  }

  return v21;
}

void __108__PGFingerprint_momentNodeFingerprintsDataFrameWithVersion_forMomentNodes_withGraph_progressReporter_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v5 = (objc_class *)MEMORY[0x1E4F71E40];
  id v6 = a3;
  id v8 = (id)[[v5 alloc] initWithElementIdentifier:a2];
  id v7 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithGraph:*(void *)(a1 + 32) elementIdentifiers:v8];
  [*(id *)(a1 + 40) addObject:v6];

  [*(id *)(a1 + 48) addObject:v7];
}

+ (id)assetCollectionFingerprintsDataframeWithVersion:(int64_t)a3 forAssetCollections:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 progressReporter:(id)a7 error:(id *)a8
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (+[PGFingerprintVersionHelper isMomentFingerprintVersion:](PGFingerprintVersionHelper, "isMomentFingerprintVersion:", a3)|| +[PGFingerprintVersionHelper isMemoryFingerprintVersion:a3])
  {
    id v18 = +[PGFingerprintVersionHelper featureExtractorForFingerprintVersion:a3 withGraph:v15 withTransformers:v16 error:a8];
    if (v18)
    {
      id v29 = v17;
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v30 = v14;
      id v20 = v14;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v32 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = [*(id *)(*((void *)&v31 + 1) + 8 * i) localIdentifier];
            [v19 addObject:v25];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v22);
      }

      id v17 = v29;
      v26 = [v18 featureVectorsWithEntities:v20 entityLabels:v19 progressReporter:v29 error:a8];

      id v14 = v30;
    }
    else
    {
      v26 = 0;
    }
  }
  else
  {
    uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"Fingerprint version not supported for asset collections: %ld", a3);
    [a1 _generateError:a8 errorCode:1 errorMessage:v27 underlyingError:0];

    v26 = 0;
  }

  return v26;
}

+ (id)assetCollectionFingerprintsWithVersion:(int64_t)a3 forAssetCollections:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 error:(id *)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v32 = a5;
  id v31 = a6;
  if (+[PGFingerprintVersionHelper isMomentFingerprintVersion:](PGFingerprintVersionHelper, "isMomentFingerprintVersion:", a3)|| +[PGFingerprintVersionHelper isMemoryFingerprintVersion:a3])
  {
    v26 = a7;
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v27 = v11;
    id obj = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = 0;
      id v15 = 0;
      uint64_t v16 = *(void *)v35;
      do
      {
        uint64_t v17 = 0;
        id v18 = v14;
        id v19 = v15;
        do
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v34 + 1) + 8 * v17);
          uint64_t v21 = (void *)MEMORY[0x1D25FED50]();
          id v33 = v19;
          id v14 = [a1 assetCollectionFingerprintWithVersion:a3 forAssetCollection:v20 withGraph:v32 withTransformers:v31 error:&v33];
          id v15 = v33;

          if (v14)
          {
            uint64_t v22 = [v20 localIdentifier];
            [v29 setObject:v14 forKeyedSubscript:v22];
          }
          ++v17;
          id v18 = v14;
          id v19 = v15;
        }
        while (v13 != v17);
        uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v13);
    }
    else
    {
      id v14 = 0;
      id v15 = 0;
    }

    if ([v29 count] || !v15)
    {
      id v23 = v29;
    }
    else
    {
      id v23 = 0;
      if (v26) {
        id *v26 = v15;
      }
    }
    id v11 = v27;
  }
  else
  {
    v24 = objc_msgSend(NSString, "stringWithFormat:", @"Fingerprint version not supported for asset collections: %ld", a3);
    [a1 _generateError:a7 errorCode:1 errorMessage:v24 underlyingError:0];

    id v23 = 0;
  }

  return v23;
}

+ (id)assetCollectionFingerprintWithVersion:(int64_t)a3 forAssetCollection:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!+[PGFingerprintVersionHelper isMomentFingerprintVersion:](PGFingerprintVersionHelper, "isMomentFingerprintVersion:", a3)&& !+[PGFingerprintVersionHelper isMemoryFingerprintVersion:a3])
  {
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"Fingerprint version not supported for asset collections: %ld", a3);
    [a1 _generateError:a7 errorCode:1 errorMessage:v16 underlyingError:0];
    goto LABEL_9;
  }
  id v15 = +[PGFingerprintVersionHelper featureExtractorForFingerprintVersion:a3 withGraph:v13 withTransformers:v14 error:a7];
  uint64_t v16 = v15;
  if (!v15)
  {
LABEL_9:
    id v20 = 0;
    goto LABEL_10;
  }
  uint64_t v17 = [v15 floatVectorWithEntity:v12 error:a7];
  uint64_t v18 = [v16 featureNames];
  id v19 = (void *)v18;
  id v20 = 0;
  if (v17 && v18) {
    id v20 = [[PGFingerprint alloc] initWithFloatArray:v17 withFeatureNames:v18];
  }

LABEL_10:
  return v20;
}

+ (id)_assetFingerprintWithFeatureExtractor:(id)a3 forAsset:(id)a4 withTransformers:(id)a5 error:(id *)a6
{
  if (a3)
  {
    id v8 = a3;
    id v9 = [v8 floatVectorWithEntity:a4 error:a6];
    v10 = [v8 featureNames];

    id v11 = 0;
    if (v9 && v10) {
      id v11 = [[PGFingerprint alloc] initWithFloatArray:v9 withFeatureNames:v10];
    }
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

+ (id)assetFingerprintsDataframeWithVersion:(int64_t)a3 forAssets:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 progressReporter:(id)a7 error:(id *)a8
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (+[PGFingerprintVersionHelper isAssetFingerprintVersion:a3])
  {
    uint64_t v18 = +[PGFingerprintVersionHelper featureExtractorForFingerprintVersion:a3 withGraph:v15 withTransformers:v16 error:a8];
    if (v18)
    {
      id v29 = v15;
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v30 = v14;
      id v20 = v14;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v32 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = [*(id *)(*((void *)&v31 + 1) + 8 * i) localIdentifier];
            [v19 addObject:v25];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v22);
      }

      v26 = [v18 featureVectorsWithEntities:v20 entityLabels:v19 progressReporter:v17 error:a8];

      id v15 = v29;
      id v14 = v30;
    }
    else
    {
      v26 = 0;
    }
  }
  else
  {
    id v27 = objc_msgSend(NSString, "stringWithFormat:", @"Fingerprint version not supported for assets: %ld", a3);
    [a1 _generateError:a8 errorCode:1 errorMessage:v27 underlyingError:0];

    v26 = 0;
  }

  return v26;
}

+ (id)assetFingerprintsWithVersion:(int64_t)a3 forAssets:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 error:(id *)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v31 = a5;
  id v30 = a6;
  if (+[PGFingerprintVersionHelper isAssetFingerprintVersion:a3])
  {
    v26 = a7;
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v27 = v12;
    id obj = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = 0;
      uint64_t v16 = *(void *)v34;
      do
      {
        uint64_t v17 = 0;
        uint64_t v18 = v15;
        do
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v33 + 1) + 8 * v17);
          id v20 = (void *)MEMORY[0x1D25FED50]();
          id v32 = v18;
          uint64_t v21 = [a1 assetFingerprintWithVersion:a3 forAsset:v19 withGraph:v31 withTransformers:v30 error:&v32];
          id v15 = v32;

          if (v21)
          {
            uint64_t v22 = [v19 localIdentifier];
            [v29 setObject:v21 forKeyedSubscript:v22];
          }
          ++v17;
          uint64_t v18 = v15;
        }
        while (v14 != v17);
        uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v14);
    }
    else
    {
      id v15 = 0;
    }

    if ([v29 count] || !v15)
    {
      id v24 = v29;
    }
    else
    {
      id v24 = 0;
      if (v26) {
        id *v26 = v15;
      }
    }
    id v12 = v27;
  }
  else
  {
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Fingerprint version not supported for assets: %ld", a3);
    [a1 _generateError:a7 errorCode:1 errorMessage:v23 underlyingError:0];

    id v24 = 0;
  }

  return v24;
}

+ (id)assetFingerprintWithVersion:(int64_t)a3 forAsset:(id)a4 withGraph:(id)a5 withTransformers:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (+[PGFingerprintVersionHelper isAssetFingerprintVersion:a3])
  {
    id v15 = +[PGFingerprintVersionHelper featureExtractorForFingerprintVersion:a3 withGraph:v13 withTransformers:v14 error:a7];
    uint64_t v16 = [a1 _assetFingerprintWithFeatureExtractor:v15 forAsset:v12 withTransformers:v14 error:a7];
  }
  else
  {
    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"Fingerprint version not supported for assets: %ld", a3);
    [a1 _generateError:a7 errorCode:1 errorMessage:v15 underlyingError:0];
    uint64_t v16 = 0;
  }

  return v16;
}

@end