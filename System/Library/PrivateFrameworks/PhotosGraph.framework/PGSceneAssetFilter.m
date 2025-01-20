@interface PGSceneAssetFilter
+ (BOOL)supportsSecureCoding;
+ (NSString)name;
- (BOOL)_allSceneNamesAreValid:(id)a3;
- (BOOL)_validateSceneNames:(id)a3 withSceneTaxonomy:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)label:(id)a3 isSemDevClassificationWithIdentifier:(unsigned int *)a4;
- (BOOL)passesWithAsset:(id)a3;
- (NSSet)negativeScenes;
- (NSSet)positiveDominantScenes;
- (NSSet)positiveScenes;
- (NSSet)positiveSemDevSceneIdentifiers;
- (NSSet)positiveSemDevScenes;
- (NSSet)secondaryPositiveScenes;
- (NSString)description;
- (PGSceneAssetFilter)initWithCoder:(id)a3;
- (PGSceneAssetFilter)initWithPositiveScenes:(id)a3 negativeScenes:(id)a4 sceneTaxonomy:(id)a5;
- (PGSceneAssetFilter)initWithPositiveScenes:(id)a3 positiveSceneCustomSignalModelBlock:(id)a4 secondaryPositiveScenes:(id)a5 positiveDominantScenes:(id)a6 positiveDominantSceneCustomSignalModelBlock:(id)a7 positiveSemDevScenes:(id)a8 negativeScenes:(id)a9 sceneTaxonomy:(id)a10;
- (id)_consolidatedConfidenceThresholdBySceneIdentifiers:(id)a3 customSignalModel:(id)a4;
- (id)confidenceThresholdByNegativeSceneIdentifierWithCurationModel:(id)a3;
- (id)confidenceThresholdByPositiveDominantSceneIdentifierWithCurationModel:(id)a3;
- (id)confidenceThresholdByPositiveSceneIdentifierWithCurationModel:(id)a3;
- (id)confidenceThresholdBySecondaryPositiveSceneIdentifierWithCurationModel:(id)a3;
- (id)filteredAssetsFromAssets:(id)a3;
- (id)initForEntityNetWithSceneNames:(id)a3 negativeScenes:(id)a4 sceneTaxonomy:(id)a5;
- (id)initForEntityNetWithSceneNames:(id)a3 positiveSceneCustomSignalModelBlock:(id)a4 secondaryPositiveScenes:(id)a5 positiveDominantScenes:(id)a6 positiveDominantSceneCustomSignalModelBlock:(id)a7 positiveSemDevScenes:(id)a8 negativeScenes:(id)a9 sceneTaxonomy:(id)a10;
- (void)_buildIndexWithConfidenceThresholds:(id)a3 sceneClassificationType:(char)a4 curationModel:(id)a5;
- (void)_commonInitWithPositiveScenes:(id)a3 positiveSceneCustomSignalModelBlock:(id)a4 secondaryPositiveScenes:(id)a5 positiveDominantScenes:(id)a6 positiveDominantSceneCustomSignalModelBlock:(id)a7 positiveSemDevScenes:(id)a8 negativeScenes:(id)a9 sceneTaxonomy:(id)a10 useEntityNet:(BOOL)a11;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPositiveSemDevSceneIdentifiers:(id)a3;
@end

@implementation PGSceneAssetFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positiveSemDevSceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_negativeScenes, 0);
  objc_storeStrong((id *)&self->_positiveSemDevScenes, 0);
  objc_storeStrong((id *)&self->_positiveDominantScenes, 0);
  objc_storeStrong((id *)&self->_secondaryPositiveScenes, 0);
  objc_storeStrong((id *)&self->_positiveScenes, 0);
  objc_storeStrong(&self->_positiveDominantSceneCustomSignalModelBlock, 0);
  objc_storeStrong(&self->_positiveSceneCustomSignalModelBlock, 0);
  objc_storeStrong((id *)&self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_positiveDominantScenesHelper, 0);
  objc_storeStrong((id *)&self->_negativeScenesHelper, 0);
  objc_storeStrong((id *)&self->_secondaryPositiveScenesHelper, 0);
  objc_storeStrong((id *)&self->_positiveScenesHelper, 0);
}

- (void)setPositiveSemDevSceneIdentifiers:(id)a3
{
}

- (NSSet)negativeScenes
{
  return self->_negativeScenes;
}

- (NSSet)positiveSemDevScenes
{
  return self->_positiveSemDevScenes;
}

- (NSSet)positiveDominantScenes
{
  return self->_positiveDominantScenes;
}

- (NSSet)secondaryPositiveScenes
{
  return self->_secondaryPositiveScenes;
}

- (NSSet)positiveScenes
{
  return self->_positiveScenes;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGSceneAssetFilter *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PGSceneAssetFilter *)self positiveScenes];
      v7 = [(PGSceneAssetFilter *)v5 positiveScenes];
      if ([v6 isEqualToSet:v7])
      {
        v8 = [(PGSceneAssetFilter *)self secondaryPositiveScenes];
        v9 = [(PGSceneAssetFilter *)v5 secondaryPositiveScenes];
        if ([v8 isEqualToSet:v9])
        {
          v10 = [(PGSceneAssetFilter *)self positiveDominantScenes];
          v11 = [(PGSceneAssetFilter *)v5 positiveDominantScenes];
          if ([v10 isEqualToSet:v11])
          {
            v12 = [(PGSceneAssetFilter *)self positiveSemDevScenes];
            v18 = [(PGSceneAssetFilter *)v5 positiveSemDevScenes];
            if (objc_msgSend(v12, "isEqualToSet:"))
            {
              v16 = [(PGSceneAssetFilter *)self negativeScenes];
              [(PGSceneAssetFilter *)v5 negativeScenes];
              v13 = v17 = v12;
              char v14 = [v16 isEqualToSet:v13];

              v12 = v17;
            }
            else
            {
              char v14 = 0;
            }
          }
          else
          {
            char v14 = 0;
          }
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)PGSceneAssetFilter;
  v4 = [(PGSceneAssetFilter *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@", v4];

  [v5 appendFormat:@" %@: %@", @"positiveScenes", self->_positiveScenes];
  [v5 appendFormat:@" %@: %@", @"secondaryPositiveScenes", self->_secondaryPositiveScenes];
  [v5 appendFormat:@" %@: %@", @"positiveDominantScenes", self->_positiveDominantScenes];
  [v5 appendFormat:@" %@: %@", @"positiveSemDevScenes", self->_positiveSemDevScenes];
  [v5 appendFormat:@" %@: %@", @"negativeScenes", self->_negativeScenes];
  return (NSString *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  positiveScenes = self->_positiveScenes;
  id v5 = a3;
  [v5 encodeObject:positiveScenes forKey:@"positiveScenes"];
  [v5 encodeObject:self->_secondaryPositiveScenes forKey:@"secondaryPositiveScenes"];
  [v5 encodeObject:self->_positiveDominantScenes forKey:@"positiveDominantScenes"];
  [v5 encodeObject:self->_positiveSemDevScenes forKey:@"positiveSemDevScenes"];
  [v5 encodeObject:self->_negativeScenes forKey:@"negativeScenes"];
}

- (PGSceneAssetFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"positiveScenes"];
  v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"secondaryPositiveScenes"];
  objc_super v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"positiveDominantScenes"];
  v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"positiveSemDevScenes"];
  v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"negativeScenes"];

  v10 = [(PGSceneAssetFilter *)self initWithPositiveScenes:v5 positiveSceneCustomSignalModelBlock:0 secondaryPositiveScenes:v6 positiveDominantScenes:v7 positiveDominantSceneCustomSignalModelBlock:0 positiveSemDevScenes:v8 negativeScenes:v9 sceneTaxonomy:0];
  return v10;
}

- (BOOL)passesWithAsset:(id)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 clsSceneClassifications];
  if (![v5 count])
  {
    char v16 = 0;
    goto LABEL_81;
  }
  id v76 = v4;
  v77 = v5;
  uint64_t v6 = [v4 curationModel];
  v85 = [(PGSceneAssetFilter *)self confidenceThresholdByNegativeSceneIdentifierWithCurationModel:v6];
  uint64_t v7 = [v85 count];
  v82 = [(PGSceneAssetFilter *)self confidenceThresholdByPositiveSceneIdentifierWithCurationModel:v6];
  uint64_t v8 = [v82 count];
  LODWORD(v9) = v8 == 0;
  v81 = [(PGSceneAssetFilter *)self confidenceThresholdBySecondaryPositiveSceneIdentifierWithCurationModel:v6];
  uint64_t v10 = [v81 count];
  BOOL v11 = v10 == 0;
  v83 = (void *)v6;
  v80 = [(PGSceneAssetFilter *)self confidenceThresholdByPositiveDominantSceneIdentifierWithCurationModel:v6];
  uint64_t v12 = [v80 count];
  BOOL v13 = v12 == 0;
  NSUInteger v14 = [(NSSet *)self->_positiveSemDevScenes count];
  BOOL v15 = v14 == 0;
  if (!v7 && !v12 && !v8 && !v14 && !v10)
  {
    char v16 = 1;
    id v4 = v76;
    id v5 = v77;
    v17 = v83;
    goto LABEL_80;
  }
  v17 = v83;
  if (self->_useEntityNet) {
    [v83 entityNetModel];
  }
  else {
  v18 = [v83 sceneModel];
  }
  v75 = [v83 sceneModel];
  v84 = [v83 entityNetModel];
  uint64_t v19 = [v18 identifier];
  v20 = (void *)v19;
  if (!v19)
  {
    char v16 = 0;
    goto LABEL_79;
  }
  v70 = (void *)v19;
  v71 = v18;
  v21 = [(NSMutableDictionary *)self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier objectForKeyedSubscript:v19];
  uint64_t v79 = [v21 pointerValue];

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  obuint64_t j = v77;
  uint64_t v88 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
  if (!v88)
  {
LABEL_77:
    char v16 = 0;
    goto LABEL_78;
  }
  uint64_t v87 = *(void *)v90;
  uint64_t v78 = v7;
  v72 = self;
  do
  {
    for (uint64_t i = 0; i != v88; ++i)
    {
      if (*(void *)v90 != v87) {
        objc_enumerationMutation(obj);
      }
      v23 = *(void **)(*((void *)&v89 + 1) + 8 * i);
      unint64_t v24 = [v23 extendedSceneIdentifier];
      [v23 confidence];
      double v26 = v25;
      if (v24 <= 0x7CF)
      {
        double v27 = *(double *)(v79 + 8 * v24);
        switch(self->_typeOfSceneClassification[v24])
        {
          case 1:
            if (v26 >= v27) {
              LODWORD(v9) = 1;
            }
            goto LABEL_71;
          case 2:
            if (v26 >= v27) {
              BOOL v11 = 1;
            }
            goto LABEL_71;
          case 3:
            if (v26 >= v27) {
              goto LABEL_77;
            }
            goto LABEL_71;
          case 4:
            if (!v13 && v26 >= v27)
            {
              [v23 boundingBox];
              BOOL v13 = v53 > 0.0 && v52 > 0.0;
            }
            goto LABEL_71;
          default:
            goto LABEL_71;
        }
      }
      if (!self->_useEntityNet)
      {
        if (([v75 isResponsibleForSignalIdentifier:v24] & 1) == 0)
        {
          if (!self->_useEntityNet) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
LABEL_27:
        if (v7)
        {
          BOOL v28 = v13;
          BOOL v29 = v15;
          BOOL v30 = v11;
          char v31 = v9;
          v32 = NSNumber;
          id v33 = v85;
          v34 = [v32 numberWithUnsignedLongLong:v24];
          uint64_t v9 = [v33 objectForKeyedSubscript:v34];

          if (v9)
          {
            [(id)v9 doubleValue];
            double v36 = v35;

            uint64_t v7 = v78;
            LOBYTE(v9) = v31;
            BOOL v11 = v30;
            BOOL v15 = v29;
            BOOL v13 = v28;
            self = v72;
            if (v36 <= v26) {
              goto LABEL_77;
            }
            goto LABEL_30;
          }
          uint64_t v7 = v78;
          char v54 = v31;
          BOOL v11 = v30;
          BOOL v15 = v29;
          BOOL v13 = v28;
          self = v72;
          if ((v54 & 1) == 0)
          {
LABEL_56:
            v55 = NSNumber;
            id v56 = v82;
            v57 = [v55 numberWithUnsignedLongLong:v24];
            uint64_t v9 = [v56 objectForKeyedSubscript:v57];

            if (v9)
            {
              [(id)v9 doubleValue];
              BOOL v59 = v58 <= v26;
            }
            else
            {
              BOOL v59 = 0;
            }

            uint64_t v7 = v78;
            LODWORD(v9) = v59;
            if (v11) {
              goto LABEL_66;
            }
LABEL_32:
            BOOL v37 = v13;
            BOOL v38 = v15;
            int v39 = v9;
            v40 = NSNumber;
            id v41 = v81;
            v42 = [v40 numberWithUnsignedLongLong:v24];
            v43 = [v41 objectForKeyedSubscript:v42];

            if (v43)
            {
              [v43 doubleValue];
              BOOL v45 = v44 <= v26;
            }
            else
            {
              BOOL v45 = 0;
            }

            LODWORD(v9) = v39;
            BOOL v11 = v45;
            BOOL v15 = v38;
            BOOL v60 = v37;
            self = v72;
            if (v60)
            {
LABEL_67:
              BOOL v13 = 1;
              goto LABEL_71;
            }
            goto LABEL_60;
          }
        }
        else
        {
LABEL_30:
          if ((v9 & 1) == 0) {
            goto LABEL_56;
          }
        }
        LODWORD(v9) = 1;
        if (!v11) {
          goto LABEL_32;
        }
LABEL_66:
        BOOL v11 = 1;
        if (v13) {
          goto LABEL_67;
        }
LABEL_60:
        id v61 = v80;
        id v62 = v23;
        [v62 boundingBox];
        BOOL v13 = 0;
        if (v64 > 0.0 && v63 > 0.0)
        {
          int v74 = v9;
          v65 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v62, "extendedSceneIdentifier"));
          uint64_t v9 = [v61 objectForKeyedSubscript:v65];

          if (v9)
          {
            [v62 confidence];
            double v67 = v66;
            [(id)v9 doubleValue];
            BOOL v13 = v67 >= v68;
          }
          else
          {
            BOOL v13 = 0;
          }

          LODWORD(v9) = v74;
        }

        goto LABEL_71;
      }
LABEL_23:
      if ([v84 isResponsibleForSignalIdentifier:v24]) {
        goto LABEL_27;
      }
LABEL_24:
      if (v15)
      {
        BOOL v15 = 1;
      }
      else
      {
        int v73 = v9;
        id v46 = v23;
        id v47 = v83;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        uint64_t v9 = [(PGSceneAssetFilter *)self positiveSemDevSceneIdentifiers];
        uint64_t v48 = [(id)v9 countByEnumeratingWithState:&v93 objects:v98 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v94;
          while (2)
          {
            for (uint64_t j = 0; j != v49; ++j)
            {
              if (*(void *)v94 != v50) {
                objc_enumerationMutation((id)v9);
              }
              if (objc_msgSend(v47, "isSemDevSceneDetectedForIdentifier:withSceneClassification:", objc_msgSend(*(id *)(*((void *)&v93 + 1) + 8 * j), "unsignedIntegerValue"), v46))
              {
                BOOL v15 = 1;
                goto LABEL_54;
              }
            }
            uint64_t v49 = [(id)v9 countByEnumeratingWithState:&v93 objects:v98 count:16];
            if (v49) {
              continue;
            }
            break;
          }
        }
        BOOL v15 = 0;
LABEL_54:

        uint64_t v7 = v78;
        LODWORD(v9) = v73;
      }
LABEL_71:
      char v16 = v9 & v11 & (v13 && v15);
      if (!v7 && v9 & v11 & (v13 && v15)) {
        goto LABEL_78;
      }
    }
    uint64_t v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16, v27);
  }
  while (v88);
LABEL_78:

  v17 = v83;
  v20 = v70;
  v18 = v71;
LABEL_79:

  id v4 = v76;
  id v5 = v77;
LABEL_80:

LABEL_81:
  return v16 & 1;
}

- (id)filteredAssetsFromAssets:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[PGSceneAssetFilter passesWithAsset:](self, "passesWithAsset:", v11, (void)v13)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_validateSceneNames:(id)a3 withSceneTaxonomy:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "lowercaseString", (void)v20);
        if (self->_useEntityNet) {
          long long v15 = v13;
        }
        else {
          long long v15 = v14;
        }
        if (([v7 nodeExistsForName:v15] & 1) == 0)
        {
          v17 = +[PGLogging sharedLogging];
          uint64_t v18 = [v17 loggingConnection];

          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            double v25 = v13;
            _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "[PGSceneAssetFilter] Invalid scene name \"%@\"", buf, 0xCu);
          }

          BOOL v16 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  typeOfSceneClassification = self->_typeOfSceneClassification;
  if (typeOfSceneClassification)
  {
    free(typeOfSceneClassification);
    self->_typeOfSceneClassification = 0;
  }
  indexedConfidenceThresholdOfScenesBySceneModelIdentifier = self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier;
  if (indexedConfidenceThresholdOfScenesBySceneModelIdentifier)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(NSMutableDictionary *)indexedConfidenceThresholdOfScenesBySceneModelIdentifier allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          free((void *)[*(id *)(*((void *)&v12 + 1) + 8 * v9++) pointerValue]);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    uint64_t v10 = self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier;
    self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)PGSceneAssetFilter;
  [(PGSceneAssetFilter *)&v11 dealloc];
}

- (BOOL)_allSceneNamesAreValid:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PGSceneAssetFilter *)self _validateSceneNames:self->_positiveScenes withSceneTaxonomy:v4]&& [(PGSceneAssetFilter *)self _validateSceneNames:self->_secondaryPositiveScenes withSceneTaxonomy:v4]&& [(PGSceneAssetFilter *)self _validateSceneNames:self->_positiveDominantScenes withSceneTaxonomy:v4]&& [(PGSceneAssetFilter *)self _validateSceneNames:self->_negativeScenes withSceneTaxonomy:v4];

  return v5;
}

- (void)_commonInitWithPositiveScenes:(id)a3 positiveSceneCustomSignalModelBlock:(id)a4 secondaryPositiveScenes:(id)a5 positiveDominantScenes:(id)a6 positiveDominantSceneCustomSignalModelBlock:(id)a7 positiveSemDevScenes:(id)a8 negativeScenes:(id)a9 sceneTaxonomy:(id)a10 useEntityNet:(BOOL)a11
{
  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  id v73 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  unint64_t v24 = [v18 setWithArray:a3];
  positiveScenes = self->_positiveScenes;
  self->_positiveScenes = v24;

  double v26 = [MEMORY[0x1E4F1CAD0] setWithArray:v22];

  secondaryPositiveScenes = self->_secondaryPositiveScenes;
  self->_secondaryPositiveScenes = v26;

  BOOL v28 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];

  positiveDominantScenes = self->_positiveDominantScenes;
  self->_positiveDominantScenes = v28;

  BOOL v30 = [MEMORY[0x1E4F1CAD0] setWithArray:v19];

  positiveSemDevScenes = self->_positiveSemDevScenes;
  self->_positiveSemDevScenes = v30;

  v32 = [MEMORY[0x1E4F1CAD0] setWithArray:v73];

  negativeScenes = self->_negativeScenes;
  self->_negativeScenes = v32;

  v34 = _Block_copy(v23);
  id positiveSceneCustomSignalModelBlock = self->_positiveSceneCustomSignalModelBlock;
  self->_id positiveSceneCustomSignalModelBlock = v34;

  double v36 = _Block_copy(v20);
  id positiveDominantSceneCustomSignalModelBlock = self->_positiveDominantSceneCustomSignalModelBlock;
  self->_id positiveDominantSceneCustomSignalModelBlock = v36;

  id v38 = objc_alloc(MEMORY[0x1E4F8E788]);
  int v39 = [(NSSet *)self->_positiveScenes allObjects];
  if (a11)
  {
    v40 = (CLSSceneConfidenceThresholdHelper *)[v38 initForEntityNetWithSceneNames:v39 thresholdType:1];
    positiveScenesHelper = self->_positiveScenesHelper;
    self->_positiveScenesHelper = v40;

    id v42 = objc_alloc(MEMORY[0x1E4F8E788]);
    v43 = [(NSSet *)self->_secondaryPositiveScenes allObjects];
    double v44 = (CLSSceneConfidenceThresholdHelper *)[v42 initForEntityNetWithSceneNames:v43 thresholdType:1];
    secondaryPositiveScenesHelper = self->_secondaryPositiveScenesHelper;
    self->_secondaryPositiveScenesHelper = v44;

    id v46 = objc_alloc(MEMORY[0x1E4F8E788]);
    id v47 = [(NSSet *)self->_negativeScenes allObjects];
    uint64_t v48 = (CLSSceneConfidenceThresholdHelper *)[v46 initForEntityNetWithSceneNames:v47 thresholdType:5];
    negativeScenesHelper = self->_negativeScenesHelper;
    self->_negativeScenesHelper = v48;

    id v50 = objc_alloc(MEMORY[0x1E4F8E788]);
    v51 = [(NSSet *)self->_positiveDominantScenes allObjects];
    double v52 = (CLSSceneConfidenceThresholdHelper *)[v50 initForEntityNetWithSceneNames:v51 thresholdType:1];
  }
  else
  {
    double v53 = (CLSSceneConfidenceThresholdHelper *)[v38 initWithSceneNames:v39 thresholdType:1];
    char v54 = self->_positiveScenesHelper;
    self->_positiveScenesHelper = v53;

    id v55 = objc_alloc(MEMORY[0x1E4F8E788]);
    id v56 = [(NSSet *)self->_secondaryPositiveScenes allObjects];
    v57 = (CLSSceneConfidenceThresholdHelper *)[v55 initWithSceneNames:v56 thresholdType:1];
    double v58 = self->_secondaryPositiveScenesHelper;
    self->_secondaryPositiveScenesHelper = v57;

    id v59 = objc_alloc(MEMORY[0x1E4F8E788]);
    BOOL v60 = [(NSSet *)self->_negativeScenes allObjects];
    id v61 = (CLSSceneConfidenceThresholdHelper *)[v59 initWithSceneNames:v60 thresholdType:5];
    id v62 = self->_negativeScenesHelper;
    self->_negativeScenesHelper = v61;

    id v63 = objc_alloc(MEMORY[0x1E4F8E788]);
    v51 = [(NSSet *)self->_positiveDominantScenes allObjects];
    double v52 = (CLSSceneConfidenceThresholdHelper *)[v63 initWithSceneNames:v51 thresholdType:1];
  }
  positiveDominantScenesHelper = self->_positiveDominantScenesHelper;
  self->_positiveDominantScenesHelper = v52;

  v65 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier = self->_confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier;
  self->_confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier = v65;

  double v67 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier = self->_confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier;
  self->_confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier = v67;

  v69 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier = self->_confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier;
  self->_confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier = v69;

  v71 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier = self->_confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier;
  self->_confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier = v71;
}

- (PGSceneAssetFilter)initWithPositiveScenes:(id)a3 negativeScenes:(id)a4 sceneTaxonomy:(id)a5
{
  return [(PGSceneAssetFilter *)self initWithPositiveScenes:a3 positiveSceneCustomSignalModelBlock:0 secondaryPositiveScenes:MEMORY[0x1E4F1CBF0] positiveDominantScenes:MEMORY[0x1E4F1CBF0] positiveDominantSceneCustomSignalModelBlock:0 positiveSemDevScenes:MEMORY[0x1E4F1CBF0] negativeScenes:a4 sceneTaxonomy:a5];
}

- (id)initForEntityNetWithSceneNames:(id)a3 negativeScenes:(id)a4 sceneTaxonomy:(id)a5
{
  return [(PGSceneAssetFilter *)self initForEntityNetWithSceneNames:a3 positiveSceneCustomSignalModelBlock:0 secondaryPositiveScenes:MEMORY[0x1E4F1CBF0] positiveDominantScenes:MEMORY[0x1E4F1CBF0] positiveDominantSceneCustomSignalModelBlock:0 positiveSemDevScenes:MEMORY[0x1E4F1CBF0] negativeScenes:a4 sceneTaxonomy:a5];
}

- (id)initForEntityNetWithSceneNames:(id)a3 positiveSceneCustomSignalModelBlock:(id)a4 secondaryPositiveScenes:(id)a5 positiveDominantScenes:(id)a6 positiveDominantSceneCustomSignalModelBlock:(id)a7 positiveSemDevScenes:(id)a8 negativeScenes:(id)a9 sceneTaxonomy:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v28.receiver = self;
  v28.super_class = (Class)PGSceneAssetFilter;
  unint64_t v24 = [(PGSceneAssetFilter *)&v28 init];
  double v25 = v24;
  if (v24)
  {
    v24->_useEntityNet = 1;
    LOBYTE(v27) = 1;
    [(PGSceneAssetFilter *)v24 _commonInitWithPositiveScenes:v16 positiveSceneCustomSignalModelBlock:v17 secondaryPositiveScenes:v18 positiveDominantScenes:v19 positiveDominantSceneCustomSignalModelBlock:v20 positiveSemDevScenes:v21 negativeScenes:v22 sceneTaxonomy:v23 useEntityNet:v27];
    if (![(PGSceneAssetFilter *)v25 _allSceneNamesAreValid:v23])
    {

      double v25 = 0;
    }
  }

  return v25;
}

- (PGSceneAssetFilter)initWithPositiveScenes:(id)a3 positiveSceneCustomSignalModelBlock:(id)a4 secondaryPositiveScenes:(id)a5 positiveDominantScenes:(id)a6 positiveDominantSceneCustomSignalModelBlock:(id)a7 positiveSemDevScenes:(id)a8 negativeScenes:(id)a9 sceneTaxonomy:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v28.receiver = self;
  v28.super_class = (Class)PGSceneAssetFilter;
  unint64_t v24 = [(PGSceneAssetFilter *)&v28 init];
  double v25 = v24;
  if (v24)
  {
    v24->_useEntityNet = 0;
    LOBYTE(v27) = 0;
    [(PGSceneAssetFilter *)v24 _commonInitWithPositiveScenes:v16 positiveSceneCustomSignalModelBlock:v17 secondaryPositiveScenes:v18 positiveDominantScenes:v19 positiveDominantSceneCustomSignalModelBlock:v20 positiveSemDevScenes:v21 negativeScenes:v22 sceneTaxonomy:v23 useEntityNet:v27];
    if (![(PGSceneAssetFilter *)v25 _allSceneNamesAreValid:v23])
    {

      double v25 = 0;
    }
  }

  return v25;
}

- (BOOL)label:(id)a3 isSemDevClassificationWithIdentifier:(unsigned int *)a4
{
  unsigned int v5 = 2147482622;
  id v6 = a3;
  if (([v6 isEqualToString:@"FoodDrink"] & 1) == 0)
  {
    if (![v6 isEqualToString:@"LandscapeCityscape"])
    {
      BOOL v7 = 0;
      goto LABEL_6;
    }
    unsigned int v5 = 2147482623;
  }
  *a4 = v5;
  BOOL v7 = 1;
LABEL_6:

  return v7;
}

- (NSSet)positiveSemDevSceneIdentifiers
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  positiveSemDevSceneIdentifiers = self->_positiveSemDevSceneIdentifiers;
  if (!positiveSemDevSceneIdentifiers)
  {
    id v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unsigned int v5 = self->_positiveSemDevScenes;
    uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v19;
      *(void *)&long long v7 = 138412290;
      long long v16 = v7;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
          unsigned int v17 = 0;
          if (-[PGSceneAssetFilter label:isSemDevClassificationWithIdentifier:](self, "label:isSemDevClassificationWithIdentifier:", v11, &v17, v16))
          {
            long long v12 = [NSNumber numberWithUnsignedInt:v17];
            [(NSSet *)v4 addObject:v12];
          }
          else
          {
            long long v13 = +[PGLogging sharedLogging];
            long long v12 = [v13 loggingConnection];

            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v16;
              uint64_t v23 = v11;
              _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "[PGSceneAssetFilter] Invalid sem dev name \"%@\"", buf, 0xCu);
            }
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSSet *)v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v8);
    }

    long long v14 = self->_positiveSemDevSceneIdentifiers;
    self->_positiveSemDevSceneIdentifiers = v4;

    positiveSemDevSceneIdentifiers = self->_positiveSemDevSceneIdentifiers;
  }
  return positiveSemDevSceneIdentifiers;
}

- (id)confidenceThresholdByPositiveDominantSceneIdentifierWithCurationModel:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (self->_useEntityNet) {
    [v4 entityNetModel];
  }
  else {
  uint64_t v6 = [v4 sceneModel];
  }
  long long v7 = [v6 identifier];

  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier objectForKeyedSubscript:v7];
    if (!v8)
    {
      uint64_t v8 = [(CLSSceneConfidenceThresholdHelper *)self->_positiveDominantScenesHelper confidenceThresholdBySceneIdentifierWithCurationModel:v5];
      id positiveDominantSceneCustomSignalModelBlock = (void (**)(id, void *))self->_positiveDominantSceneCustomSignalModelBlock;
      if (positiveDominantSceneCustomSignalModelBlock)
      {
        uint64_t v10 = positiveDominantSceneCustomSignalModelBlock[2](positiveDominantSceneCustomSignalModelBlock, v5);
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          uint64_t v12 = [(PGSceneAssetFilter *)self _consolidatedConfidenceThresholdBySceneIdentifiers:v8 customSignalModel:v10];

          uint64_t v8 = (void *)v12;
        }
      }
      [(NSMutableDictionary *)self->_confidenceThresholdByPositiveDominantSceneIdentifierBySceneModelIdentifier setObject:v8 forKeyedSubscript:v7];
      [(PGSceneAssetFilter *)self _buildIndexWithConfidenceThresholds:v8 sceneClassificationType:4 curationModel:v5];
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

- (id)confidenceThresholdByNegativeSceneIdentifierWithCurationModel:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (self->_useEntityNet) {
    [v4 entityNetModel];
  }
  else {
  uint64_t v6 = [v4 sceneModel];
  }
  long long v7 = [v6 identifier];

  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier objectForKeyedSubscript:v7];
    if (!v8)
    {
      uint64_t v8 = [(CLSSceneConfidenceThresholdHelper *)self->_negativeScenesHelper confidenceThresholdBySceneIdentifierWithCurationModel:v5];
      [(NSMutableDictionary *)self->_confidenceThresholdByNegativeSceneIdentifierBySceneModelIdentifier setObject:v8 forKeyedSubscript:v7];
      [(PGSceneAssetFilter *)self _buildIndexWithConfidenceThresholds:v8 sceneClassificationType:3 curationModel:v5];
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

- (id)confidenceThresholdBySecondaryPositiveSceneIdentifierWithCurationModel:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (self->_useEntityNet) {
    [v4 entityNetModel];
  }
  else {
  uint64_t v6 = [v4 sceneModel];
  }
  long long v7 = [v6 identifier];

  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier objectForKeyedSubscript:v7];
    if (!v8)
    {
      uint64_t v8 = [(CLSSceneConfidenceThresholdHelper *)self->_secondaryPositiveScenesHelper confidenceThresholdBySceneIdentifierWithCurationModel:v5];
      [(NSMutableDictionary *)self->_confidenceThresholdBySecondaryPositiveSceneIdentifierBySceneModelIdentifier setObject:v8 forKeyedSubscript:v7];
      [(PGSceneAssetFilter *)self _buildIndexWithConfidenceThresholds:v8 sceneClassificationType:2 curationModel:v5];
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

- (id)confidenceThresholdByPositiveSceneIdentifierWithCurationModel:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (self->_useEntityNet) {
    [v4 entityNetModel];
  }
  else {
  uint64_t v6 = [v4 sceneModel];
  }
  long long v7 = [v6 identifier];

  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier objectForKeyedSubscript:v7];
    if (!v8)
    {
      uint64_t v8 = [(CLSSceneConfidenceThresholdHelper *)self->_positiveScenesHelper confidenceThresholdBySceneIdentifierWithCurationModel:v5];
      id positiveSceneCustomSignalModelBlock = (void (**)(id, void *))self->_positiveSceneCustomSignalModelBlock;
      if (positiveSceneCustomSignalModelBlock)
      {
        uint64_t v10 = positiveSceneCustomSignalModelBlock[2](positiveSceneCustomSignalModelBlock, v5);
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          uint64_t v12 = [(PGSceneAssetFilter *)self _consolidatedConfidenceThresholdBySceneIdentifiers:v8 customSignalModel:v10];

          uint64_t v8 = (void *)v12;
        }
      }
      [(NSMutableDictionary *)self->_confidenceThresholdByPositiveSceneIdentifierBySceneModelIdentifier setObject:v8 forKeyedSubscript:v7];
      [(PGSceneAssetFilter *)self _buildIndexWithConfidenceThresholds:v8 sceneClassificationType:1 curationModel:v5];
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

- (void)_buildIndexWithConfidenceThresholds:(id)a3 sceneClassificationType:(char)a4 curationModel:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!self->_typeOfSceneClassification)
  {
    self->_typeOfSceneClassification = (char *)malloc_type_calloc(0x7D0uLL, 1uLL, 0x100004077774924uLL);
    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    indexedConfidenceThresholdOfScenesBySceneModelIdentifier = self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier;
    self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier = v10;
  }
  if (self->_useEntityNet) {
    [v9 entityNetModel];
  }
  else {
  uint64_t v12 = [v9 sceneModel];
  }
  long long v13 = [v12 identifier];

  if (v13)
  {
    long long v14 = [(NSMutableDictionary *)self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier objectForKeyedSubscript:v13];
    long long v15 = (void *)[v14 pointerValue];

    if (!v15)
    {
      long long v15 = malloc_type_calloc(0x7D0uLL, 8uLL, 0x100004000313F17uLL);
      long long v16 = [MEMORY[0x1E4F29238] valueWithPointer:v15];
      [(NSMutableDictionary *)self->_indexedConfidenceThresholdOfScenesBySceneModelIdentifier setObject:v16 forKeyedSubscript:v13];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __96__PGSceneAssetFilter__buildIndexWithConfidenceThresholds_sceneClassificationType_curationModel___block_invoke;
    v17[3] = &unk_1E68EE160;
    char v18 = a4;
    v17[4] = self;
    v17[5] = v15;
    [v8 enumerateKeysAndObjectsUsingBlock:v17];
  }
}

void __96__PGSceneAssetFilter__buildIndexWithConfidenceThresholds_sceneClassificationType_curationModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  unint64_t v5 = [a2 integerValue];
  if (v5 <= 0x7CF)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 72) + v5) = *(unsigned char *)(a1 + 48);
    [v7 doubleValue];
    *(void *)(*(void *)(a1 + 40) + 8 * v5) = v6;
  }
}

- (id)_consolidatedConfidenceThresholdBySceneIdentifiers:(id)a3 customSignalModel:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[v5 mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v19 = v5;
  id v8 = [v5 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v14 = objc_msgSend(v6, "nodeForSignalIdentifier:", objc_msgSend(v13, "unsignedIntegerValue"));
        long long v15 = v14;
        if (v14)
        {
          long long v16 = NSNumber;
          [v14 operatingPoint];
          unsigned int v17 = objc_msgSend(v16, "numberWithDouble:");
          [v7 setObject:v17 forKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"Scene";
}

@end