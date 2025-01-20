@interface PLPersistedPersonFaceMetadata
+ (BOOL)supportsSecureCoding;
+ (id)_detectedFacePropertiesToFetch;
+ (id)_detectedFaceRelationshipKeyPathsToPrefetch;
+ (id)_migrateDetectedFaces:(id)a3 forPersonMetadata:(id)a4 fromVersion:(unint64_t)a5;
+ (id)_persistedFaceMetadataWithDetectedFace:(id)a3 isKeyFace:(BOOL)a4 isClusterRejected:(BOOL)a5;
+ (id)_persistedFacesWithUnarchiver:(id)a3 key:(id)a4;
+ (void)enumerateMatchedAssetsWithMetadata:(id)a3 inContext:(id)a4 withBlock:(id)a5;
- (BOOL)isClusterRejected;
- (BOOL)isDeferrable;
- (BOOL)isHidden;
- (BOOL)isManual;
- (BOOL)isRepresentative;
- (BOOL)matchesEntityInLibraryBackedByManagedObjectContext:(id)a3 forConfirmedPersonUUID:(id)a4 diff:(id *)a5;
- (BOOL)matchesEntityInLibraryBackedByManagedObjectContext:(id)a3 forRejectedPersonUUID:(id)a4 diff:(id *)a5;
- (NSNumber)detectionType;
- (NSString)assetCloudGUID;
- (NSString)assetUUID;
- (NSString)description;
- (PLPersistedPersonFaceMetadata)initWithCoder:(id)a3;
- (double)bodyCenterX;
- (double)bodyCenterY;
- (double)bodyHeight;
- (double)bodyWidth;
- (double)centerX;
- (double)centerY;
- (double)size;
- (id)_identifier;
- (id)_insertDeferredRebuildFaceFromDataInManagedObjectContext:(id)a3 personUUID:(id)a4 isRejected:(BOOL)a5;
- (id)jsonDictionary;
- (id)matchingFaceInManagedObejctContext:(id)a3;
- (int)cloudNameSource;
- (int)faceAlgorithmVersion;
- (int)nameSource;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetCloudGUID:(id)a3;
- (void)setAssetUUID:(id)a3;
- (void)setBodyCenterX:(double)a3;
- (void)setBodyCenterY:(double)a3;
- (void)setBodyHeight:(double)a3;
- (void)setBodyWidth:(double)a3;
- (void)setCenterX:(double)a3;
- (void)setCenterY:(double)a3;
- (void)setCloudNameSource:(int)a3;
- (void)setClusterRejected:(BOOL)a3;
- (void)setDetectionType:(id)a3;
- (void)setFaceAlgorithmVersion:(int)a3;
- (void)setHidden:(BOOL)a3;
- (void)setManual:(BOOL)a3;
- (void)setNameSource:(int)a3;
- (void)setRepresentative:(BOOL)a3;
- (void)setSize:(double)a3;
@end

@implementation PLPersistedPersonFaceMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCloudGUID, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

- (void)setFaceAlgorithmVersion:(int)a3
{
  self->_faceAlgorithmVersion = a3;
}

- (int)faceAlgorithmVersion
{
  return self->_faceAlgorithmVersion;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setCloudNameSource:(int)a3
{
  self->_cloudNameSource = a3;
}

- (int)cloudNameSource
{
  return self->_cloudNameSource;
}

- (void)setNameSource:(int)a3
{
  self->_nameSource = a3;
}

- (int)nameSource
{
  return self->_nameSource;
}

- (void)setClusterRejected:(BOOL)a3
{
  self->_clusterRejected = a3;
}

- (BOOL)isClusterRejected
{
  return self->_clusterRejected;
}

- (void)setRepresentative:(BOOL)a3
{
  self->_representative = a3;
}

- (BOOL)isRepresentative
{
  return self->_representative;
}

- (void)setManual:(BOOL)a3
{
  self->_manual = a3;
}

- (BOOL)isManual
{
  return self->_manual;
}

- (void)setDetectionType:(id)a3
{
  self->_detectionType = (NSNumber *)a3;
}

- (NSNumber)detectionType
{
  return self->_detectionType;
}

- (void)setBodyHeight:(double)a3
{
  self->_bodyHeight = a3;
}

- (double)bodyHeight
{
  return self->_bodyHeight;
}

- (void)setBodyWidth:(double)a3
{
  self->_bodyWidth = a3;
}

- (double)bodyWidth
{
  return self->_bodyWidth;
}

- (void)setBodyCenterY:(double)a3
{
  self->_bodyCenterY = a3;
}

- (double)bodyCenterY
{
  return self->_bodyCenterY;
}

- (void)setBodyCenterX:(double)a3
{
  self->_bodyCenterX = a3;
}

- (double)bodyCenterX
{
  return self->_bodyCenterX;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (double)size
{
  return self->_size;
}

- (void)setCenterY:(double)a3
{
  self->_centerY = a3;
}

- (double)centerY
{
  return self->_centerY;
}

- (void)setCenterX:(double)a3
{
  self->_centerX = a3;
}

- (double)centerX
{
  return self->_centerX;
}

- (void)setAssetCloudGUID:(id)a3
{
}

- (NSString)assetCloudGUID
{
  return self->_assetCloudGUID;
}

- (void)setAssetUUID:(id)a3
{
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (BOOL)isDeferrable
{
  [(PLPersistedPersonFaceMetadata *)self centerX];
  if (v3 == 0.0) {
    return 0;
  }
  [(PLPersistedPersonFaceMetadata *)self bodyCenterX];
  if (v4 != 0.0) {
    return 0;
  }
  v5 = [(PLPersistedPersonFaceMetadata *)self detectionType];
  if (v5)
  {
    v6 = [(PLPersistedPersonFaceMetadata *)self detectionType];
    BOOL v7 = [v6 integerValue] == 1;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)jsonDictionary
{
  v34[15] = *MEMORY[0x1E4F143B8];
  v33[0] = @"assetUUID";
  uint64_t v3 = [(PLPersistedPersonFaceMetadata *)self assetUUID];
  v32 = (void *)v3;
  if (v3) {
    double v4 = (__CFString *)v3;
  }
  else {
    double v4 = &stru_1EEB2EB80;
  }
  v34[0] = v4;
  v33[1] = @"assetCloudGUID";
  uint64_t v5 = [(PLPersistedPersonFaceMetadata *)self assetCloudGUID];
  v31 = (void *)v5;
  if (v5) {
    v6 = (__CFString *)v5;
  }
  else {
    v6 = &stru_1EEB2EB80;
  }
  v34[1] = v6;
  v33[2] = @"centerX";
  BOOL v7 = NSNumber;
  [(PLPersistedPersonFaceMetadata *)self centerX];
  v30 = objc_msgSend(v7, "numberWithDouble:");
  v34[2] = v30;
  v33[3] = @"centerY";
  v8 = NSNumber;
  [(PLPersistedPersonFaceMetadata *)self centerY];
  v29 = objc_msgSend(v8, "numberWithDouble:");
  v34[3] = v29;
  v33[4] = @"size";
  v9 = NSNumber;
  [(PLPersistedPersonFaceMetadata *)self size];
  v28 = objc_msgSend(v9, "numberWithDouble:");
  v34[4] = v28;
  v33[5] = @"bodyCenterX";
  v10 = NSNumber;
  [(PLPersistedPersonFaceMetadata *)self bodyCenterX];
  v27 = objc_msgSend(v10, "numberWithDouble:");
  v34[5] = v27;
  v33[6] = @"bodyCenterY";
  v11 = NSNumber;
  [(PLPersistedPersonFaceMetadata *)self bodyCenterY];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  v34[6] = v12;
  v33[7] = @"bodyWidth";
  v13 = NSNumber;
  [(PLPersistedPersonFaceMetadata *)self bodyWidth];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v34[7] = v14;
  v33[8] = @"bodyHeight";
  v15 = NSNumber;
  [(PLPersistedPersonFaceMetadata *)self bodyHeight];
  v16 = objc_msgSend(v15, "numberWithDouble:");
  v34[8] = v16;
  v33[9] = @"detectionType";
  uint64_t v17 = [(PLPersistedPersonFaceMetadata *)self detectionType];
  v18 = (void *)v17;
  v19 = &unk_1EEBEF8D0;
  if (v17) {
    v19 = (void *)v17;
  }
  v34[9] = v19;
  v33[10] = @"nameSource";
  v20 = objc_msgSend(NSNumber, "numberWithInt:", -[PLPersistedPersonFaceMetadata nameSource](self, "nameSource"));
  v34[10] = v20;
  v33[11] = @"cloudNameSource";
  v21 = objc_msgSend(NSNumber, "numberWithInt:", -[PLPersistedPersonFaceMetadata cloudNameSource](self, "cloudNameSource"));
  v34[11] = v21;
  v33[12] = @"manual";
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[PLPersistedPersonFaceMetadata isManual](self, "isManual"));
  v34[12] = v22;
  v33[13] = @"isKeyFace";
  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[PLPersistedPersonFaceMetadata isRepresentative](self, "isRepresentative"));
  v34[13] = v23;
  v33[14] = @"isClusterRejected";
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[PLPersistedPersonFaceMetadata isClusterRejected](self, "isClusterRejected"));
  v34[14] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:15];

  return v25;
}

- (BOOL)matchesEntityInLibraryBackedByManagedObjectContext:(id)a3 forRejectedPersonUUID:(id)a4 diff:(id *)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [(PLPersistedPersonFaceMetadata *)self matchingFaceInManagedObejctContext:a3];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 rejectedPersons];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __111__PLPersistedPersonFaceMetadata_matchesEntityInLibraryBackedByManagedObjectContext_forRejectedPersonUUID_diff___block_invoke;
    v26[3] = &unk_1E586F348;
    id v12 = v8;
    id v27 = v12;
    v13 = [v11 objectsPassingTest:v26];
    v14 = [v13 anyObject];

    if (v14)
    {
      v15 = [MEMORY[0x1E4F1CA60] dictionary];
      v16 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v17 = [v10 clusterRejectedPersons];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __111__PLPersistedPersonFaceMetadata_matchesEntityInLibraryBackedByManagedObjectContext_forRejectedPersonUUID_diff___block_invoke_2;
      v24[3] = &unk_1E586F348;
      id v25 = v12;
      v18 = [v17 objectsPassingTest:v24];
      v19 = [v18 anyObject];

      if ((v19 != 0) != [(PLPersistedPersonFaceMetadata *)self isClusterRejected])
      {
        v20 = objc_msgSend(NSNumber, "numberWithBool:", -[PLPersistedPersonFaceMetadata isClusterRejected](self, "isClusterRejected"));
        [v15 setObject:v20 forKey:@"isClusterRejected"];

        v21 = [NSNumber numberWithBool:v19 != 0];
        [v16 setObject:v21 forKey:@"isClusterRejected"];
      }
      if (a5)
      {
        v28[0] = @"metadata";
        v28[1] = @"library";
        v29[0] = v15;
        v29[1] = v16;
        *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      }
      if ([v15 count]) {
        BOOL v22 = 0;
      }
      else {
        BOOL v22 = [v16 count] == 0;
      }
    }
    else
    {
      BOOL v22 = 0;
      if (a5) {
        *a5 = 0;
      }
    }
  }
  else
  {
    BOOL v22 = 0;
    if (a5) {
      *a5 = 0;
    }
  }

  return v22;
}

uint64_t __111__PLPersistedPersonFaceMetadata_matchesEntityInLibraryBackedByManagedObjectContext_forRejectedPersonUUID_diff___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 personUUID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __111__PLPersistedPersonFaceMetadata_matchesEntityInLibraryBackedByManagedObjectContext_forRejectedPersonUUID_diff___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 personUUID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)matchesEntityInLibraryBackedByManagedObjectContext:(id)a3 forConfirmedPersonUUID:(id)a4 diff:(id *)a5
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [(PLPersistedPersonFaceMetadata *)self matchingFaceInManagedObejctContext:a3];
  if (v9)
  {
    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    id v12 = [v9 personForFace];
    v13 = [v12 personUUID];
    char IsEqual = PLObjectIsEqual();

    if ((IsEqual & 1) == 0)
    {
      objc_msgSend(v10, "_pl_setNonNilObject:forKey:", v8, @"personUUID");
      v15 = [v9 personForFace];
      v16 = [v15 personUUID];
      objc_msgSend(v11, "_pl_setNonNilObject:forKey:", v16, @"personUUID");
    }
    int v17 = [(PLPersistedPersonFaceMetadata *)self nameSource];
    if (v17 != [v9 nameSource])
    {
      v18 = objc_msgSend(NSNumber, "numberWithInt:", -[PLPersistedPersonFaceMetadata nameSource](self, "nameSource"));
      [v10 setObject:v18 forKey:@"nameSource"];

      v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "nameSource"));
      [v11 setObject:v19 forKey:@"nameSource"];
    }
    int v20 = [(PLPersistedPersonFaceMetadata *)self cloudNameSource];
    if (v20 != [v9 cloudNameSource])
    {
      v21 = objc_msgSend(NSNumber, "numberWithInt:", -[PLPersistedPersonFaceMetadata cloudNameSource](self, "cloudNameSource"));
      [v10 setObject:v21 forKey:@"cloudNameSource"];

      BOOL v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "cloudNameSource"));
      [v11 setObject:v22 forKey:@"cloudNameSource"];
    }
    int v23 = [(PLPersistedPersonFaceMetadata *)self isManual];
    if (v23 != [v9 manual])
    {
      v24 = objc_msgSend(NSNumber, "numberWithBool:", -[PLPersistedPersonFaceMetadata isManual](self, "isManual"));
      [v10 setObject:v24 forKey:@"manual"];

      id v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "manual"));
      [v11 setObject:v25 forKey:@"manual"];
    }
    v26 = [v9 personBeingKeyFace];

    if ((v26 != 0) != [(PLPersistedPersonFaceMetadata *)self isRepresentative])
    {
      id v27 = objc_msgSend(NSNumber, "numberWithBool:", -[PLPersistedPersonFaceMetadata isRepresentative](self, "isRepresentative"));
      [v10 setObject:v27 forKey:@"isKeyFace"];

      v28 = [NSNumber numberWithBool:v26 != 0];
      [v11 setObject:v28 forKey:@"isKeyFace"];
    }
    if (a5)
    {
      v31[0] = @"metadata";
      v31[1] = @"library";
      v32[0] = v10;
      v32[1] = v11;
      *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    }
    if ([v10 count]) {
      BOOL v29 = 0;
    }
    else {
      BOOL v29 = [v11 count] == 0;
    }
  }
  else
  {
    BOOL v29 = 0;
    if (a5) {
      *a5 = 0;
    }
  }

  return v29;
}

- (id)matchingFaceInManagedObejctContext:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[PLDetectedFace fetchRequest];
  v6 = (void *)MEMORY[0x1E4F28F60];
  BOOL v7 = [(PLPersistedPersonFaceMetadata *)self assetUUID];
  id v8 = [v6 predicateWithFormat:@"%K = %@", @"assetForFace.uuid", v7];
  [v5 setPredicate:v8];

  [v4 executeFetchRequest:v5 error:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v14 centerX];
        double v16 = v15;
        [(PLPersistedPersonFaceMetadata *)self centerX];
        if (vabdd_f64(v16, v17) < 0.001)
        {
          [v14 centerY];
          double v19 = v18;
          [(PLPersistedPersonFaceMetadata *)self centerY];
          if (vabdd_f64(v19, v20) < 0.001)
          {
            [v14 size];
            double v22 = v21;
            [(PLPersistedPersonFaceMetadata *)self size];
            if (vabdd_f64(v22, v23) < 0.001)
            {
              id v24 = v14;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v24 = 0;
LABEL_13:

  return v24;
}

- (id)_identifier
{
  uint64_t v3 = NSString;
  id v4 = [(PLPersistedPersonFaceMetadata *)self assetCloudGUID];
  if (v4) {
    [(PLPersistedPersonFaceMetadata *)self assetCloudGUID];
  }
  else {
  uint64_t v5 = [(PLPersistedPersonFaceMetadata *)self assetUUID];
  }
  [(PLPersistedPersonFaceMetadata *)self size];
  uint64_t v7 = v6;
  [(PLPersistedPersonFaceMetadata *)self centerX];
  uint64_t v9 = v8;
  [(PLPersistedPersonFaceMetadata *)self centerY];
  uint64_t v11 = [v3 stringWithFormat:@"%@%f%f%f", v5, v7, v9, v10];

  return v11;
}

- (id)_insertDeferredRebuildFaceFromDataInManagedObjectContext:(id)a3 personUUID:(id)a4 isRejected:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([(PLPersistedPersonFaceMetadata *)self isDeferrable])
  {
    uint64_t v10 = +[PLManagedObject insertInManagedObjectContext:v8];
    [(PLPersistedPersonFaceMetadata *)self centerX];
    objc_msgSend(v10, "setCenterX:");
    [(PLPersistedPersonFaceMetadata *)self centerY];
    objc_msgSend(v10, "setCenterY:");
    [(PLPersistedPersonFaceMetadata *)self size];
    objc_msgSend(v10, "setSize:");
    objc_msgSend(v10, "setManual:", -[PLPersistedPersonFaceMetadata isManual](self, "isManual"));
    objc_msgSend(v10, "setHidden:", -[PLPersistedPersonFaceMetadata isHidden](self, "isHidden"));
    objc_msgSend(v10, "setNameSource:", -[PLPersistedPersonFaceMetadata nameSource](self, "nameSource"));
    objc_msgSend(v10, "setCloudNameSource:", -[PLPersistedPersonFaceMetadata cloudNameSource](self, "cloudNameSource"));
    uint64_t v11 = [(PLPersistedPersonFaceMetadata *)self assetUUID];
    [v10 setAssetUUID:v11];

    uint64_t v12 = [(PLPersistedPersonFaceMetadata *)self assetCloudGUID];
    [v10 setAssetCloudGUID:v12];

    [v10 setRejected:v5];
    objc_msgSend(v10, "setClusterRejected:", -[PLPersistedPersonFaceMetadata isClusterRejected](self, "isClusterRejected"));
    [v10 setPersonUUID:v9];
    v13 = [MEMORY[0x1E4F8BA08] UUIDString];
    [v10 setUuid:v13];

    if ([(PLPersistedPersonFaceMetadata *)self faceAlgorithmVersion]) {
      uint64_t v14 = [(PLPersistedPersonFaceMetadata *)self faceAlgorithmVersion];
    }
    else {
      uint64_t v14 = 1;
    }
    [v10 setFaceAlgorithmVersion:v14];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  v23.receiver = self;
  v23.super_class = (Class)PLPersistedPersonFaceMetadata;
  uint64_t v3 = [(PLPersistedPersonFaceMetadata *)&v23 description];
  id v4 = [(PLPersistedPersonFaceMetadata *)self assetUUID];
  BOOL v5 = [(PLPersistedPersonFaceMetadata *)self assetCloudGUID];
  [(PLPersistedPersonFaceMetadata *)self size];
  uint64_t v7 = v6;
  [(PLPersistedPersonFaceMetadata *)self centerX];
  uint64_t v9 = v8;
  [(PLPersistedPersonFaceMetadata *)self centerY];
  uint64_t v11 = v10;
  [(PLPersistedPersonFaceMetadata *)self bodyCenterX];
  uint64_t v13 = v12;
  [(PLPersistedPersonFaceMetadata *)self bodyCenterY];
  uint64_t v15 = v14;
  [(PLPersistedPersonFaceMetadata *)self bodyWidth];
  uint64_t v17 = v16;
  [(PLPersistedPersonFaceMetadata *)self bodyHeight];
  uint64_t v19 = v18;
  double v20 = [(PLPersistedPersonFaceMetadata *)self detectionType];
  double v21 = [v3 stringByAppendingFormat:@" face on %@ [%@] (face: %6.6f @ %6.6f,%6.6f) (body: %6.6fx%6.6f @ %6.6f,%6.6f) type:%d isKey:%d [manual:%d hidden:%d nameSource:%d]", v4, v5, v7, v9, v11, v13, v15, v17, v19, objc_msgSend(v20, "intValue"), -[PLPersistedPersonFaceMetadata isRepresentative](self, "isRepresentative"), -[PLPersistedPersonFaceMetadata isManual](self, "isManual"), -[PLPersistedPersonFaceMetadata isHidden](self, "isHidden"), -[PLPersistedPersonFaceMetadata nameSource](self, "nameSource")];

  return (NSString *)v21;
}

- (PLPersistedPersonFaceMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLPersistedPersonFaceMetadata;
  BOOL v5 = [(PLPersistedPersonFaceMetadata *)&v12 init];
  [v4 decodeDoubleForKey:@"centerX"];
  -[PLPersistedPersonFaceMetadata setCenterX:](v5, "setCenterX:");
  [v4 decodeDoubleForKey:@"centerY"];
  -[PLPersistedPersonFaceMetadata setCenterY:](v5, "setCenterY:");
  [v4 decodeDoubleForKey:@"size"];
  -[PLPersistedPersonFaceMetadata setSize:](v5, "setSize:");
  [v4 decodeDoubleForKey:@"bodyCenterX"];
  -[PLPersistedPersonFaceMetadata setBodyCenterX:](v5, "setBodyCenterX:");
  [v4 decodeDoubleForKey:@"bodyCenterY"];
  -[PLPersistedPersonFaceMetadata setBodyCenterY:](v5, "setBodyCenterY:");
  [v4 decodeDoubleForKey:@"bodyWidth"];
  -[PLPersistedPersonFaceMetadata setBodyWidth:](v5, "setBodyWidth:");
  [v4 decodeDoubleForKey:@"bodyHeight"];
  -[PLPersistedPersonFaceMetadata setBodyHeight:](v5, "setBodyHeight:");
  if ([v4 containsValueForKey:@"detectionType"])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "decodeIntForKey:", @"detectionType"));
    [(PLPersistedPersonFaceMetadata *)v5 setDetectionType:v6];
  }
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetUUID"];
  [(PLPersistedPersonFaceMetadata *)v5 setAssetUUID:v7];

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetCloudGUID"];
  [(PLPersistedPersonFaceMetadata *)v5 setAssetCloudGUID:v8];

  -[PLPersistedPersonFaceMetadata setHidden:](v5, "setHidden:", [v4 decodeBoolForKey:@"isHidden"]);
  -[PLPersistedPersonFaceMetadata setManual:](v5, "setManual:", [v4 decodeBoolForKey:@"isManual"]);
  -[PLPersistedPersonFaceMetadata setRepresentative:](v5, "setRepresentative:", [v4 decodeBoolForKey:@"isRepresentative"]);
  -[PLPersistedPersonFaceMetadata setFaceAlgorithmVersion:](v5, "setFaceAlgorithmVersion:", [v4 decodeInt32ForKey:@"faceAlgorithmVersion"]);
  if ([v4 containsValueForKey:@"isNameSourceAuto"]) {
    uint64_t v9 = [v4 decodeBoolForKey:@"isNameSourceAuto"] ^ 1;
  }
  else {
    uint64_t v9 = [v4 decodeIntegerForKey:@"nameSource"];
  }
  [(PLPersistedPersonFaceMetadata *)v5 setNameSource:v9];
  if ([v4 containsValueForKey:@"cloudNameSource"]) {
    uint64_t v10 = [v4 decodeIntForKey:@"cloudNameSource"];
  }
  else {
    uint64_t v10 = [(PLPersistedPersonFaceMetadata *)v5 nameSource];
  }
  [(PLPersistedPersonFaceMetadata *)v5 setCloudNameSource:v10];
  if ([v4 containsValueForKey:@"isClusterRejected"]) {
    -[PLPersistedPersonFaceMetadata setClusterRejected:](v5, "setClusterRejected:", [v4 decodeBoolForKey:@"isClusterRejected"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [(PLPersistedPersonFaceMetadata *)self centerX];
  objc_msgSend(v8, "encodeDouble:forKey:", @"centerX");
  [(PLPersistedPersonFaceMetadata *)self centerY];
  objc_msgSend(v8, "encodeDouble:forKey:", @"centerY");
  [(PLPersistedPersonFaceMetadata *)self size];
  objc_msgSend(v8, "encodeDouble:forKey:", @"size");
  [(PLPersistedPersonFaceMetadata *)self bodyCenterX];
  objc_msgSend(v8, "encodeDouble:forKey:", @"bodyCenterX");
  [(PLPersistedPersonFaceMetadata *)self bodyCenterY];
  objc_msgSend(v8, "encodeDouble:forKey:", @"bodyCenterY");
  [(PLPersistedPersonFaceMetadata *)self bodyWidth];
  objc_msgSend(v8, "encodeDouble:forKey:", @"bodyWidth");
  [(PLPersistedPersonFaceMetadata *)self bodyHeight];
  objc_msgSend(v8, "encodeDouble:forKey:", @"bodyHeight");
  id v4 = [(PLPersistedPersonFaceMetadata *)self detectionType];

  if (v4)
  {
    BOOL v5 = [(PLPersistedPersonFaceMetadata *)self detectionType];
    objc_msgSend(v8, "encodeInt:forKey:", objc_msgSend(v5, "intValue"), @"detectionType");
  }
  uint64_t v6 = [(PLPersistedPersonFaceMetadata *)self assetUUID];
  [v8 encodeObject:v6 forKey:@"assetUUID"];

  uint64_t v7 = [(PLPersistedPersonFaceMetadata *)self assetCloudGUID];
  [v8 encodeObject:v7 forKey:@"assetCloudGUID"];

  objc_msgSend(v8, "encodeBool:forKey:", -[PLPersistedPersonFaceMetadata isHidden](self, "isHidden"), @"isHidden");
  objc_msgSend(v8, "encodeBool:forKey:", -[PLPersistedPersonFaceMetadata isManual](self, "isManual"), @"isManual");
  objc_msgSend(v8, "encodeBool:forKey:", -[PLPersistedPersonFaceMetadata isRepresentative](self, "isRepresentative"), @"isRepresentative");
  objc_msgSend(v8, "encodeInteger:forKey:", -[PLPersistedPersonFaceMetadata nameSource](self, "nameSource"), @"nameSource");
  objc_msgSend(v8, "encodeInteger:forKey:", -[PLPersistedPersonFaceMetadata cloudNameSource](self, "cloudNameSource"), @"cloudNameSource");
  objc_msgSend(v8, "encodeBool:forKey:", -[PLPersistedPersonFaceMetadata isClusterRejected](self, "isClusterRejected"), @"isClusterRejected");
  objc_msgSend(v8, "encodeInt32:forKey:", -[PLPersistedPersonFaceMetadata faceAlgorithmVersion](self, "faceAlgorithmVersion"), @"faceAlgorithmVersion");
}

+ (void)enumerateMatchedAssetsWithMetadata:(id)a3 inContext:(id)a4 withBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, void *))a5;
  double v20 = objc_msgSend(v7, "_pl_map:", &__block_literal_global_118_76514);
  double v21 = v8;
  uint64_t v19 = +[PLManagedAsset assetsWithUUIDs:options:inManagedObjectContext:](PLManagedAsset, "assetsWithUUIDs:options:inManagedObjectContext:");
  uint64_t v10 = objc_msgSend(v19, "_pl_indexBy:", &__block_literal_global_122_76516);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v17 = [v16 assetUUID];
        uint64_t v18 = [v10 objectForKeyedSubscript:v17];

        if (v9) {
          v9[2](v9, v16, v18);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
}

uint64_t __88__PLPersistedPersonFaceMetadata_enumerateMatchedAssetsWithMetadata_inContext_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __88__PLPersistedPersonFaceMetadata_enumerateMatchedAssetsWithMetadata_inContext_withBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetUUID];
}

+ (id)_persistedFacesWithUnarchiver:(id)a3 key:(id)a4
{
  BOOL v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v5, "setWithObjects:", v8, objc_opt_class(), 0);
  uint64_t v10 = [v7 decodeObjectOfClasses:v9 forKey:v6];

  return v10;
}

+ (id)_migrateDetectedFaces:(id)a3 forPersonMetadata:(id)a4 fromVersion:(unint64_t)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    uint64_t v9 = [v8 personUUID];
    uint64_t v10 = PLMigrationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v78 = [v7 count];
      __int16 v79 = 2112;
      uint64_t v80 = (uint64_t)v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Migrating %lu faces metadata for person %@", buf, 0x16u);
    }

    if (a5 <= 2)
    {
      id v11 = PLMigrationGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v78 = (uint64_t)v9;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Resetting name source on persisted faces during rebuild for person %@", buf, 0xCu);
      }

      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v69 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * i), "setNameSource:", objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * i), "isRepresentative"));
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v68 objects:v76 count:16];
        }
        while (v14);
      }
    }
    if (a5 <= 7)
    {
      uint64_t v17 = PLMigrationGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v78 = (uint64_t)v9;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Fixing name source on manual faces during rebuild for person %@", buf, 0xCu);
      }

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      uint64_t v18 = v7;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v64 objects:v75 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = 0;
        uint64_t v22 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v65 != v22) {
              objc_enumerationMutation(v18);
            }
            long long v24 = *(void **)(*((void *)&v64 + 1) + 8 * j);
            if ([v24 isManual])
            {
              ++v21;
              [v24 setNameSource:3];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v64 objects:v75 count:16];
        }
        while (v20);
      }
      else
      {
        uint64_t v21 = 0;
      }

      long long v25 = PLMigrationGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v78 = v21;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Fixed %lu manual face name source", buf, 0xCu);
      }

      long long v60 = 0u;
      long long v61 = 0u;
      if ([v8 verifiedType] == 2) {
        uint64_t v26 = 5;
      }
      else {
        uint64_t v26 = 1;
      }
      long long v62 = 0uLL;
      long long v63 = 0uLL;
      uint64_t v27 = v18;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v60 objects:v74 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v61;
        while (2)
        {
          for (uint64_t k = 0; k != v29; ++k)
          {
            if (*(void *)v61 != v30) {
              objc_enumerationMutation(v27);
            }
            if ([*(id *)(*((void *)&v60 + 1) + 8 * k) nameSource] == v26)
            {
              v33 = v27;
              goto LABEL_56;
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v60 objects:v74 count:16];
          if (v29) {
            continue;
          }
          break;
        }
      }

      v32 = PLMigrationGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v78 = (uint64_t)v9;
        __int16 v79 = 2048;
        uint64_t v80 = v26;
        _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "Person %@ is missing named face during rebuild, will set representative face nameSource to %ld", buf, 0x16u);
      }

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v33 = v27;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v73 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v57;
        while (2)
        {
          for (uint64_t m = 0; m != v35; ++m)
          {
            if (*(void *)v57 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v56 + 1) + 8 * m);
            if ([v38 isRepresentative])
            {
              [v38 setNameSource:v26];
              goto LABEL_56;
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v56 objects:v73 count:16];
          if (v35) {
            continue;
          }
          break;
        }
      }

      v33 = PLMigrationGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v78 = (uint64_t)v8;
        _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Persisted person %@ has zero named faces, no representative face. Unable to choose a face for face crop generation", buf, 0xCu);
      }
LABEL_56:

      v39 = [MEMORY[0x1E4F1CA48] array];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v7 = v27;
      uint64_t v40 = [v7 countByEnumeratingWithState:&v52 objects:v72 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v53;
        do
        {
          for (uint64_t n = 0; n != v41; ++n)
          {
            if (*(void *)v53 != v42) {
              objc_enumerationMutation(v7);
            }
            v44 = *(void **)(*((void *)&v52 + 1) + 8 * n);
            if (objc_msgSend(v44, "nameSource", (void)v52) == 5
              || [v44 nameSource] == 1
              || [v44 nameSource] == 3
              || [v44 isManual])
            {
              [v39 addObject:v44];
            }
          }
          uint64_t v41 = [v7 countByEnumeratingWithState:&v52 objects:v72 count:16];
        }
        while (v41);
      }

      uint64_t v45 = [v7 count];
      uint64_t v46 = [v39 count];
      uint64_t v47 = v45 - v46;
      if (v45 != v46)
      {
        uint64_t v48 = v46;
        v49 = PLMigrationGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v78 = v47;
          __int16 v79 = 2048;
          uint64_t v80 = v48;
          _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_DEFAULT, "Removing %ld non-user named faces from facesMetadata, %ld user named faces remaining", buf, 0x16u);
        }

        v50 = v39;
        id v7 = v50;
      }
    }
  }

  return v7;
}

+ (id)_persistedFaceMetadataWithDetectedFace:(id)a3 isKeyFace:(BOOL)a4 isClusterRejected:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLPersistedPersonMetadata.m", 137, @"Invalid parameter not satisfying: %@", @"face" object file lineNumber description];
  }
  uint64_t v10 = [v9 associatedAssetForFaceOrTorso:1 orTemporal:0];
  id v11 = [v10 uuid];
  if (v11)
  {
    id v12 = objc_alloc_init((Class)a1);
    [v12 setAssetUUID:v11];
    uint64_t v13 = [v10 cloudAssetGUID];
    [v12 setAssetCloudGUID:v13];

    [v9 centerX];
    objc_msgSend(v12, "setCenterX:");
    [v9 centerY];
    objc_msgSend(v12, "setCenterY:");
    [v9 size];
    objc_msgSend(v12, "setSize:");
    [v9 bodyCenterX];
    objc_msgSend(v12, "setBodyCenterX:");
    [v9 bodyCenterY];
    objc_msgSend(v12, "setBodyCenterY:");
    [v9 bodyWidth];
    objc_msgSend(v12, "setBodyWidth:");
    [v9 bodyHeight];
    objc_msgSend(v12, "setBodyHeight:");
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v9, "detectionType"));
    [v12 setDetectionType:v14];

    objc_msgSend(v12, "setHidden:", objc_msgSend(v9, "hidden"));
    objc_msgSend(v12, "setManual:", objc_msgSend(v9, "manual"));
    [v12 setRepresentative:v6];
    objc_msgSend(v12, "setNameSource:", objc_msgSend(v9, "nameSource"));
    objc_msgSend(v12, "setCloudNameSource:", objc_msgSend(v9, "cloudNameSource"));
    [v12 setClusterRejected:v5];
    objc_msgSend(v12, "setFaceAlgorithmVersion:", objc_msgSend(v9, "faceAlgorithmVersion"));
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)_detectedFaceRelationshipKeyPathsToPrefetch
{
  pl_dispatch_once();
  v2 = (void *)_detectedFaceRelationshipKeyPathsToPrefetch_pl_once_object_16;
  return v2;
}

void __76__PLPersistedPersonFaceMetadata__detectedFaceRelationshipKeyPathsToPrefetch__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"assetForFace";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [v0 copy];
  v2 = (void *)_detectedFaceRelationshipKeyPathsToPrefetch_pl_once_object_16;
  _detectedFaceRelationshipKeyPathsToPrefetch_pl_once_object_16 = v1;
}

+ (id)_detectedFacePropertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)_detectedFacePropertiesToFetch_pl_once_object_15;
  return v2;
}

void __63__PLPersistedPersonFaceMetadata__detectedFacePropertiesToFetch__block_invoke()
{
  v3[13] = *MEMORY[0x1E4F143B8];
  v3[0] = @"centerX";
  v3[1] = @"centerY";
  void v3[2] = @"size";
  v3[3] = @"bodyCenterX";
  v3[4] = @"bodyCenterY";
  v3[5] = @"bodyWidth";
  v3[6] = @"bodyHeight";
  v3[7] = @"detectionType";
  v3[8] = @"manual";
  v3[9] = @"hidden";
  v3[10] = @"nameSource";
  v3[11] = @"cloudNameSource";
  v3[12] = @"faceAlgorithmVersion";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:13];
  uint64_t v1 = [v0 copy];
  v2 = (void *)_detectedFacePropertiesToFetch_pl_once_object_15;
  _detectedFacePropertiesToFetch_pl_once_object_15 = v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end