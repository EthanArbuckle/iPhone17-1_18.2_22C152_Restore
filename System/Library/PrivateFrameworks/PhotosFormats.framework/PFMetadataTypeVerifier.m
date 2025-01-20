@interface PFMetadataTypeVerifier
- (PFMetadataTypeVerifier)init;
- (id)_coerceValue:(id)a3 toClass:(Class)a4 forKey:(id)a5;
- (id)_expectedAVMetadataIdentifierTypes;
- (id)_expectedAVMetadataKeyKeySpaceTypes;
- (id)_expectedImageArrayPropertyTypes;
- (id)_expectedImageDictionaryPropertyTypes;
- (id)_verifiedValue:(id)a3 forKey:(id)a4 expectedTypes:(id)a5;
- (id)valueAtIndex:(unint64_t)a3 forKey:(id)a4 fromArray:(id)a5;
- (id)valueForAVMetadataIdentifier:(id)a3 fromAVMetadataItems:(id)a4;
- (id)valueForKey:(id)a3 fromProperties:(id)a4;
- (id)valueForKey:(id)a3 keySpace:(id)a4 fromAVMetadataItems:(id)a5;
- (id)valueForKeyPath:(id)a3 fromProperties:(id)a4;
- (id)valueForKeyPath:(id)a3 index:(unint64_t)a4 fromProperties:(id)a5;
- (id)verifiedImageValue:(id)a3 forKey:(id)a4;
@end

@implementation PFMetadataTypeVerifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedAVMetadataKeyKeySpaceTypes, 0);
  objc_storeStrong((id *)&self->_expectedAVMetadataIdentifierTypes, 0);
  objc_storeStrong((id *)&self->_expectedImageArrayPropertyTypes, 0);

  objc_storeStrong((id *)&self->_expectedImageDictionaryPropertyTypes, 0);
}

- (id)_coerceValue:(id)a3 toClass:(Class)a4 forKey:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (!v7)
  {
LABEL_20:
    v11 = 0;
    goto LABEL_21;
  }
  v9 = objc_opt_class();
  if ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    v24[0] = v7;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    goto LABEL_4;
  }
  int v13 = [v9 isSubclassOfClass:objc_opt_class()];
  uint64_t v14 = objc_opt_class();
  if (v13)
  {
    if ([(objc_class *)a4 isSubclassOfClass:v14])
    {
      uint64_t v10 = PFStringFromDate(v7);
      goto LABEL_4;
    }
LABEL_18:
    v16 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543874;
      v19 = v9;
      __int16 v20 = 2114;
      Class v21 = a4;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_error_impl(&dword_1A41FE000, v16, OS_LOG_TYPE_ERROR, "Cannot coerce from %{public}@ expected type %{public}@ for key %{public}@.", (uint8_t *)&v18, 0x20u);
    }
    goto LABEL_20;
  }
  if (![v9 isSubclassOfClass:v14])
  {
    if (![v9 isSubclassOfClass:objc_opt_class()]
      || ![(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
    {
      goto LABEL_18;
    }
    uint64_t v10 = [v7 stringValue];
LABEL_4:
    v11 = (void *)v10;
    if (v10) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v10 = PFDateFromString(v7);
    goto LABEL_4;
  }
  if (![(objc_class *)a4 isSubclassOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v15 setNumberStyle:1];
  v11 = [v15 numberFromString:v7];

  if (!v11) {
    goto LABEL_18;
  }
LABEL_5:
  v12 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138543874;
    v19 = v9;
    __int16 v20 = 2114;
    Class v21 = a4;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_debug_impl(&dword_1A41FE000, v12, OS_LOG_TYPE_DEBUG, "Coerced from %{public}@ to expected type %{public}@ for key %{public}@", (uint8_t *)&v18, 0x20u);
  }
LABEL_21:

  return v11;
}

- (id)_verifiedValue:(id)a3 forKey:(id)a4 expectedTypes:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  id v12 = 0;
  if (v8 && v9)
  {
    int v13 = [v10 objectForKeyedSubscript:v9];
    if (![v13 count])
    {
      uint64_t v14 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v39 = v9;
        _os_log_fault_impl(&dword_1A41FE000, v14, OS_LOG_TYPE_FAULT, "PFMETADATA VALIDATION: key (%{public}@) with no expected types", buf, 0xCu);
      }
    }
    id v15 = (id)[v13 firstObject];
    char isKindOfClass = objc_opt_isKindOfClass();
    id v17 = v8;
    id v8 = v17;
    int v18 = v17;
    if (isKindOfClass) {
      goto LABEL_25;
    }
    id v8 = v17;
    if ((unint64_t)[v13 count] >= 2)
    {
      v19 = objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v13, "count") - 1);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        v33 = v11;
        BOOL v22 = 0;
        uint64_t v23 = *(void *)v35;
        id v32 = v17;
        id v8 = v17;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v35 != v23) {
              objc_enumerationMutation(v19);
            }
            if (objc_opt_isKindOfClass())
            {
              if (v15 != (id)objc_opt_class())
              {
                uint64_t v25 = [(PFMetadataTypeVerifier *)self _coerceValue:v8 toClass:v15 forKey:v9];

                id v8 = (id)v25;
              }
              BOOL v22 = v8 != 0;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v21);

        int v18 = v8;
        v11 = v33;
        id v17 = v32;
        if (v22) {
          goto LABEL_25;
        }
      }
      else
      {

        id v8 = v17;
      }
    }
    v26 = (void *)metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      v28 = v26;
      v29 = objc_opt_class();
      id v30 = v29;
      v31 = [v13 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543874;
      id v39 = v9;
      __int16 v40 = 2114;
      v41 = v29;
      __int16 v42 = 2114;
      v43 = v31;
      _os_log_error_impl(&dword_1A41FE000, v28, OS_LOG_TYPE_ERROR, "Unexpected type for %{public}@: %{public}@. Expected type to be one of %{public}@", buf, 0x20u);
    }
    int v18 = 0;
LABEL_25:
    id v12 = v18;
  }

  return v12;
}

- (id)valueAtIndex:(unint64_t)a3 forKey:(id)a4 fromArray:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v9 count] - 1 >= a3)
  {
    id v12 = [v9 objectAtIndexedSubscript:a3];
    id v10 = [(PFMetadataTypeVerifier *)self _verifiedValue:v12 forKey:v8 expectedTypes:self->_expectedImageArrayPropertyTypes];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)valueForKey:(id)a3 keySpace:(id)a4 fromAVMetadataItems:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F16558] metadataItemsFromArray:a5 withKey:v8 keySpace:v9];
    if ((unint64_t)[v10 count] >= 2)
    {
      v11 = (void *)metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_INFO))
      {
        id v12 = v11;
        int v13 = [v10 componentsJoinedByString:@", "];
        int v19 = 138543874;
        id v20 = v9;
        __int16 v21 = 2114;
        id v22 = v8;
        __int16 v23 = 2114;
        v24 = v13;
        _os_log_impl(&dword_1A41FE000, v12, OS_LOG_TYPE_INFO, "Found multiple metadata items for %{public}@/%{public}@. Using the first one out of: %{public}@", (uint8_t *)&v19, 0x20u);
      }
    }
    uint64_t v14 = [v10 firstObject];
    id v15 = [v14 value];

    v16 = [(NSDictionary *)self->_expectedAVMetadataKeyKeySpaceTypes objectForKeyedSubscript:v9];
    id v17 = [(PFMetadataTypeVerifier *)self _verifiedValue:v15 forKey:v8 expectedTypes:v16];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)valueForAVMetadataIdentifier:(id)a3 fromAVMetadataItems:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = 0;
  if (v6 && a4)
  {
    id v8 = [MEMORY[0x1E4F16558] metadataItemsFromArray:a4 filteredByIdentifier:v6];
    if ((unint64_t)[v8 count] >= 2)
    {
      id v9 = (void *)metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_INFO))
      {
        id v10 = v9;
        int v14 = 134349570;
        uint64_t v15 = [v8 count];
        __int16 v16 = 2114;
        id v17 = v6;
        __int16 v18 = 2112;
        int v19 = v8;
        _os_log_impl(&dword_1A41FE000, v10, OS_LOG_TYPE_INFO, "Found multiple metadata items (%{public}lu) for %{public}@. Using the first one out of: %@", (uint8_t *)&v14, 0x20u);
      }
    }
    v11 = [v8 firstObject];
    id v12 = [v11 value];

    id v7 = [(PFMetadataTypeVerifier *)self _verifiedValue:v12 forKey:v6 expectedTypes:self->_expectedAVMetadataIdentifierTypes];
  }

  return v7;
}

- (id)valueForKeyPath:(id)a3 index:(unint64_t)a4 fromProperties:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = [(PFMetadataTypeVerifier *)self valueForKeyPath:v8 fromProperties:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    int v13 = [v8 componentsSeparatedByString:@"."];
    int v14 = [v13 lastObject];

    uint64_t v15 = [v12 objectAtIndexedSubscript:a4];

    __int16 v16 = [(PFMetadataTypeVerifier *)self _verifiedValue:v15 forKey:v14 expectedTypes:self->_expectedImageArrayPropertyTypes];
  }
  else
  {
    __int16 v16 = 0;
  }

  return v16;
}

- (id)verifiedImageValue:(id)a3 forKey:(id)a4
{
  return [(PFMetadataTypeVerifier *)self _verifiedValue:a3 forKey:a4 expectedTypes:self->_expectedImageDictionaryPropertyTypes];
}

- (id)valueForKeyPath:(id)a3 fromProperties:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = [v6 componentsSeparatedByString:@"."];
    id v9 = v7;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        int v14 = v9;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
          __int16 v16 = [v14 objectForKeyedSubscript:v15];
          id v9 = [(PFMetadataTypeVerifier *)self _verifiedValue:v16 forKey:v15 expectedTypes:self->_expectedImageDictionaryPropertyTypes];

          ++v13;
          int v14 = v9;
        }
        while (v11 != v13);
        uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)valueForKey:(id)a3 fromProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = [v7 objectForKeyedSubscript:v6];
    id v9 = [(PFMetadataTypeVerifier *)self _verifiedValue:v8 forKey:v6 expectedTypes:self->_expectedImageDictionaryPropertyTypes];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_expectedAVMetadataKeyKeySpaceTypes
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)_expectedAVMetadataIdentifierTypes
{
  if (_expectedAVMetadataIdentifierTypes_onceToken != -1) {
    dispatch_once(&_expectedAVMetadataIdentifierTypes_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)_expectedAVMetadataIdentifierTypes_expectedAVMetadataIdentifierTypes;

  return v2;
}

void __60__PFMetadataTypeVerifier__expectedAVMetadataIdentifierTypes__block_invoke()
{
  v98[37] = *MEMORY[0x1E4F143B8];
  v59 = +[PFMetadataIdentifier quickTimeMetadataOriginatingSignature];
  v97[0] = v59;
  uint64_t v96 = objc_opt_class();
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
  v98[0] = v58;
  v57 = +[PFMetadataIdentifier quickTimeMetadataRenderOriginatingSignature];
  v97[1] = v57;
  uint64_t v95 = objc_opt_class();
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
  v98[1] = v56;
  v55 = +[PFMetadataIdentifier quickTimeMetadataContentIdentifier];
  v97[2] = v55;
  uint64_t v94 = objc_opt_class();
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
  v98[2] = v54;
  v53 = +[PFMetadataIdentifier quickTimeMetadataSpatialOverCaptureGroupIdentifier];
  v97[3] = v53;
  uint64_t v93 = objc_opt_class();
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
  v98[3] = v52;
  v51 = +[PFMetadataIdentifier quickTimeMetadataContainsSpatialOverCaptureContent];
  v97[4] = v51;
  uint64_t v92 = objc_opt_class();
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
  v98[4] = v50;
  v49 = +[PFMetadataIdentifier quickTimeMetadataVariationIdentifier];
  v97[5] = v49;
  uint64_t v91 = objc_opt_class();
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
  v98[5] = v48;
  v47 = +[PFMetadataIdentifier quickTimeMetadataLivePhotoMinimumClientVersion];
  v97[6] = v47;
  uint64_t v90 = objc_opt_class();
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
  v98[6] = v46;
  uint64_t v45 = +[PFMetadataIdentifier quickTimeMetadataCaptureMode];
  v97[7] = v45;
  uint64_t v89 = objc_opt_class();
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
  v98[7] = v44;
  v43 = +[PFMetadataIdentifier quickTimeUserDataVideoLoopingType];
  v97[8] = v43;
  uint64_t v88 = objc_opt_class();
  __int16 v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
  v98[8] = v42;
  v41 = +[PFMetadataIdentifier quickTimeMetadataStillImageTime];
  v97[9] = v41;
  uint64_t v87 = objc_opt_class();
  __int16 v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
  v98[9] = v40;
  id v39 = +[PFMetadataIdentifier quickTimeMetadataKeyLocationISO6709];
  v97[10] = v39;
  uint64_t v86 = objc_opt_class();
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
  v98[10] = v38;
  long long v37 = +[PFMetadataIdentifier quickTimeMetadataKeyActionVideoStabilizationStrength];
  v97[11] = v37;
  uint64_t v85 = objc_opt_class();
  long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
  v98[11] = v36;
  long long v35 = +[PFMetadataIdentifier quickTimeMetadataVitalityTransitionScore];
  v97[12] = v35;
  uint64_t v84 = objc_opt_class();
  long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
  v98[12] = v34;
  v33 = +[PFMetadataIdentifier quickTimeMetadataLivePhotoVitalityDisabled];
  v97[13] = v33;
  uint64_t v83 = objc_opt_class();
  id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
  v98[13] = v32;
  v31 = +[PFMetadataIdentifier quickTimeMetadataLivePhotoVitalityLimitingAllowed];
  v97[14] = v31;
  uint64_t v82 = objc_opt_class();
  id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
  v98[14] = v30;
  v97[15] = *MEMORY[0x1E4F15D58];
  uint64_t v81 = objc_opt_class();
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
  v98[15] = v29;
  v97[16] = *MEMORY[0x1E4F15C68];
  uint64_t v80 = objc_opt_class();
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
  v98[16] = v28;
  v97[17] = *MEMORY[0x1E4F15C70];
  uint64_t v79 = objc_opt_class();
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
  v98[17] = v27;
  v97[18] = *MEMORY[0x1E4F15C78];
  uint64_t v78 = objc_opt_class();
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
  v98[18] = v26;
  v97[19] = *MEMORY[0x1E4F15C58];
  uint64_t v77 = objc_opt_class();
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
  v98[19] = v25;
  v97[20] = *MEMORY[0x1E4F15C38];
  uint64_t v76 = objc_opt_class();
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  v98[20] = v24;
  v97[21] = *MEMORY[0x1E4F15C80];
  uint64_t v75 = objc_opt_class();
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  v98[21] = v23;
  v97[22] = *MEMORY[0x1E4F15D90];
  uint64_t v74 = objc_opt_class();
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
  v98[22] = v22;
  v97[23] = *MEMORY[0x1E4F15D70];
  uint64_t v73 = objc_opt_class();
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
  v98[23] = v21;
  v97[24] = *MEMORY[0x1E4F15D50];
  uint64_t v72 = objc_opt_class();
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
  v98[24] = v20;
  v97[25] = *MEMORY[0x1E4F15D88];
  uint64_t v71 = objc_opt_class();
  long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
  v98[25] = v19;
  v97[26] = *MEMORY[0x1E4F15D78];
  uint64_t v70 = objc_opt_class();
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
  v98[26] = v18;
  v97[27] = *MEMORY[0x1E4F15C48];
  uint64_t v69 = objc_opt_class();
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  v98[27] = v17;
  v97[28] = *MEMORY[0x1E4F15C60];
  uint64_t v68 = objc_opt_class();
  __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  v98[28] = v16;
  v97[29] = *MEMORY[0x1E4F15D80];
  uint64_t v67 = objc_opt_class();
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
  v98[29] = v15;
  v97[30] = *MEMORY[0x1E4F15C50];
  uint64_t v66 = objc_opt_class();
  int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  v98[30] = v14;
  uint64_t v13 = +[PFMetadataIdentifier quicktimeMetadataCameraLensModel];
  v97[31] = v13;
  uint64_t v65 = objc_opt_class();
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
  v98[31] = v12;
  uint64_t v11 = +[PFMetadataIdentifier quicktimeMetadataCameraFocalLength35mmEquivalent];
  v97[32] = v11;
  uint64_t v64 = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
  v98[32] = v0;
  v1 = +[PFMetadataIdentifier quicktimeMetadataSpatialVideoRecommendedForImmersiveMode];
  v97[33] = v1;
  uint64_t v63 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  v98[33] = v2;
  v3 = +[PFMetadataIdentifier quicktimeMetadataFullFrameRatePlaybackIntent];
  v97[34] = v3;
  uint64_t v62 = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  v98[34] = v4;
  v5 = +[PFMetadataIdentifier quicktimeMetadataSpatialAggressorsSeen];
  v97[35] = v5;
  uint64_t v61 = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  v98[35] = v6;
  id v7 = +[PFMetadataIdentifier quicktimeMetadataSmartStyleCast];
  v97[36] = v7;
  uint64_t v60 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
  v98[36] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:37];
  uint64_t v10 = (void *)_expectedAVMetadataIdentifierTypes_expectedAVMetadataIdentifierTypes;
  _expectedAVMetadataIdentifierTypes_expectedAVMetadataIdentifierTypes = v9;
}

- (id)_expectedImageDictionaryPropertyTypes
{
  if (_expectedImageDictionaryPropertyTypes_onceToken != -1) {
    dispatch_once(&_expectedImageDictionaryPropertyTypes_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)_expectedImageDictionaryPropertyTypes_expectedImageDictionaryPropertyTypes;

  return v2;
}

void __63__PFMetadataTypeVerifier__expectedImageDictionaryPropertyTypes__block_invoke()
{
  v475[208] = *MEMORY[0x1E4F143B8];
  v417[0] = *MEMORY[0x1E4F2F978];
  uint64_t v416 = objc_opt_class();
  v209 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v416 count:1];
  v475[0] = v209;
  v417[1] = *MEMORY[0x1E4F2FBD8];
  uint64_t v415 = objc_opt_class();
  v208 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v415 count:1];
  v475[1] = v208;
  v417[2] = *MEMORY[0x1E4F2F510];
  uint64_t v414 = objc_opt_class();
  v207 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v414 count:1];
  v475[2] = v207;
  v417[3] = *MEMORY[0x1E4F2F578];
  uint64_t v413 = objc_opt_class();
  v206 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v413 count:1];
  v475[3] = v206;
  v417[4] = *MEMORY[0x1E4F2F6A8];
  uint64_t v412 = objc_opt_class();
  v205 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v412 count:1];
  v475[4] = v205;
  v417[5] = *MEMORY[0x1E4F2F6B0];
  uint64_t v411 = objc_opt_class();
  v204 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v411 count:1];
  v475[5] = v204;
  v417[6] = *MEMORY[0x1E4F2F6B8];
  uint64_t v410 = objc_opt_class();
  v203 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v410 count:1];
  v475[6] = v203;
  v417[7] = *MEMORY[0x1E4F2FCA0];
  uint64_t v409 = objc_opt_class();
  v202 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v409 count:1];
  v475[7] = v202;
  v417[8] = *MEMORY[0x1E4F2FCE8];
  uint64_t v408 = objc_opt_class();
  v201 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v408 count:1];
  v475[8] = v201;
  v417[9] = *MEMORY[0x1E4F2FD00];
  uint64_t v407 = objc_opt_class();
  v200 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v407 count:1];
  v475[9] = v200;
  v417[10] = *MEMORY[0x1E4F2FD08];
  uint64_t v406 = objc_opt_class();
  v199 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v406 count:1];
  v475[10] = v199;
  v417[11] = *MEMORY[0x1E4F2FD10];
  uint64_t v405 = objc_opt_class();
  v198 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v405 count:1];
  v475[11] = v198;
  v417[12] = *MEMORY[0x1E4F2FBE0];
  uint64_t v404 = objc_opt_class();
  v197 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v404 count:1];
  v475[12] = v197;
  v417[13] = *MEMORY[0x1E4F2F6D8];
  uint64_t v403 = objc_opt_class();
  v196 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v403 count:1];
  v475[13] = v196;
  v417[14] = *MEMORY[0x1E4F2F700];
  uint64_t v402 = objc_opt_class();
  v195 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v402 count:1];
  v475[14] = v195;
  v417[15] = *MEMORY[0x1E4F2F7A0];
  uint64_t v401 = objc_opt_class();
  v194 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v401 count:1];
  v475[15] = v194;
  v417[16] = *MEMORY[0x1E4F2F718];
  uint64_t v400 = objc_opt_class();
  v193 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v400 count:1];
  v475[16] = v193;
  v417[17] = *MEMORY[0x1E4F2F6E0];
  uint64_t v399 = objc_opt_class();
  v192 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v399 count:1];
  v475[17] = v192;
  v417[18] = *MEMORY[0x1E4F2F6E8];
  uint64_t v398 = objc_opt_class();
  v191 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v398 count:1];
  v475[18] = v191;
  v417[19] = @"FocusDistance";
  uint64_t v397 = objc_opt_class();
  v190 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v397 count:1];
  v475[19] = v190;
  v417[20] = @"FocusMode";
  uint64_t v396 = objc_opt_class();
  v189 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v396 count:1];
  v475[20] = v189;
  v417[21] = @"AFInfo";
  uint64_t v395 = objc_opt_class();
  v188 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v395 count:1];
  v475[21] = v188;
  v417[22] = *MEMORY[0x1E4F2F800];
  uint64_t v394 = objc_opt_class();
  v187 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v394 count:1];
  v475[22] = v187;
  v417[23] = *MEMORY[0x1E4F2F6D0];
  uint64_t v393 = objc_opt_class();
  v186 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v393 count:1];
  v475[23] = v186;
  v417[24] = *MEMORY[0x1E4F2F7B0];
  uint64_t v392 = objc_opt_class();
  v185 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v392 count:1];
  v475[24] = v185;
  v417[25] = *MEMORY[0x1E4F2F7C0];
  uint64_t v391 = objc_opt_class();
  v184 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v391 count:1];
  v475[25] = v184;
  v417[26] = *MEMORY[0x1E4F2F7C8];
  uint64_t v390 = objc_opt_class();
  v183 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v390 count:1];
  v475[26] = v183;
  v417[27] = *MEMORY[0x1E4F2F7D0];
  uint64_t v389 = objc_opt_class();
  v182 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v389 count:1];
  v475[27] = v182;
  v417[28] = @"CameraSerialNumber";
  uint64_t v388 = objc_opt_class();
  v181 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v388 count:1];
  v475[28] = v181;
  v417[29] = *MEMORY[0x1E4F2F8C0];
  uint64_t v387 = objc_opt_class();
  v180 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v387 count:1];
  v475[29] = v180;
  v417[30] = *MEMORY[0x1E4F2F7E0];
  uint64_t v386 = objc_opt_class();
  v179 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v386 count:1];
  v475[30] = v179;
  v417[31] = *MEMORY[0x1E4F2F7F0];
  v385[0] = objc_opt_class();
  v385[1] = objc_opt_class();
  v178 = [MEMORY[0x1E4F1C978] arrayWithObjects:v385 count:2];
  v475[31] = v178;
  v417[32] = *MEMORY[0x1E4F2F950];
  uint64_t v384 = objc_opt_class();
  v177 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v384 count:1];
  v475[32] = v177;
  v417[33] = *MEMORY[0x1E4F2F8D0];
  uint64_t v383 = objc_opt_class();
  v176 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v383 count:1];
  v475[33] = v176;
  v417[34] = *MEMORY[0x1E4F2F7E8];
  v382[0] = objc_opt_class();
  v382[1] = objc_opt_class();
  v175 = [MEMORY[0x1E4F1C978] arrayWithObjects:v382 count:2];
  v475[34] = v175;
  v417[35] = *MEMORY[0x1E4F2F948];
  uint64_t v381 = objc_opt_class();
  v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v381 count:1];
  v475[35] = v174;
  v417[36] = *MEMORY[0x1E4F2F8C8];
  uint64_t v380 = objc_opt_class();
  v173 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v380 count:1];
  v475[36] = v173;
  v417[37] = *MEMORY[0x1E4F2F968];
  uint64_t v379 = objc_opt_class();
  v172 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v379 count:1];
  v475[37] = v172;
  v417[38] = *MEMORY[0x1E4F2F810];
  uint64_t v378 = objc_opt_class();
  v171 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v378 count:1];
  v475[38] = v171;
  v417[39] = *MEMORY[0x1E4F2F818];
  uint64_t v377 = objc_opt_class();
  v170 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v377 count:1];
  v475[39] = v170;
  v417[40] = *MEMORY[0x1E4F2F820];
  uint64_t v376 = objc_opt_class();
  v169 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v376 count:1];
  v475[40] = v169;
  v417[41] = *MEMORY[0x1E4F2F828];
  uint64_t v375 = objc_opt_class();
  v168 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v375 count:1];
  v475[41] = v168;
  v417[42] = *MEMORY[0x1E4F2F830];
  uint64_t v374 = objc_opt_class();
  v167 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v374 count:1];
  v475[42] = v167;
  v417[43] = *MEMORY[0x1E4F2F838];
  uint64_t v373 = objc_opt_class();
  v166 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v373 count:1];
  v475[43] = v166;
  v417[44] = *MEMORY[0x1E4F2F840];
  uint64_t v372 = objc_opt_class();
  v165 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v372 count:1];
  v475[44] = v165;
  v417[45] = *MEMORY[0x1E4F2F848];
  uint64_t v371 = objc_opt_class();
  v164 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v371 count:1];
  v475[45] = v164;
  v417[46] = *MEMORY[0x1E4F2F850];
  uint64_t v370 = objc_opt_class();
  v163 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v370 count:1];
  v475[46] = v163;
  v417[47] = *MEMORY[0x1E4F2F878];
  v369[0] = objc_opt_class();
  v369[1] = objc_opt_class();
  v162 = [MEMORY[0x1E4F1C978] arrayWithObjects:v369 count:2];
  v475[47] = v162;
  v417[48] = *MEMORY[0x1E4F2F8E8];
  uint64_t v368 = objc_opt_class();
  v161 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v368 count:1];
  v475[48] = v161;
  v417[49] = *MEMORY[0x1E4F2F870];
  uint64_t v367 = objc_opt_class();
  v160 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v367 count:1];
  v475[49] = v160;
  v417[50] = *MEMORY[0x1E4F2F888];
  uint64_t v366 = objc_opt_class();
  v159 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v366 count:1];
  v475[50] = v159;
  v417[51] = *MEMORY[0x1E4F2F890];
  uint64_t v365 = objc_opt_class();
  v158 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v365 count:1];
  v475[51] = v158;
  v417[52] = *MEMORY[0x1E4F2F8A0];
  uint64_t v364 = objc_opt_class();
  v157 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v364 count:1];
  v475[52] = v157;
  v417[53] = *MEMORY[0x1E4F2F8A8];
  uint64_t v363 = objc_opt_class();
  v156 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v363 count:1];
  v475[53] = v156;
  v417[54] = *MEMORY[0x1E4F2F8B8];
  uint64_t v362 = objc_opt_class();
  v155 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v362 count:1];
  v475[54] = v155;
  v417[55] = *MEMORY[0x1E4F2F8D8];
  uint64_t v361 = objc_opt_class();
  v154 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v361 count:1];
  v475[55] = v154;
  v417[56] = *MEMORY[0x1E4F2F8E0];
  uint64_t v360 = objc_opt_class();
  v153 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v360 count:1];
  v475[56] = v153;
  v417[57] = *MEMORY[0x1E4F2F8F8];
  uint64_t v359 = objc_opt_class();
  v152 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v359 count:1];
  v475[57] = v152;
  v417[58] = *MEMORY[0x1E4F2F900];
  uint64_t v358 = objc_opt_class();
  v151 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v358 count:1];
  v475[58] = v151;
  v417[59] = *MEMORY[0x1E4F2F908];
  uint64_t v357 = objc_opt_class();
  v150 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v357 count:1];
  v475[59] = v150;
  v417[60] = *MEMORY[0x1E4F2F920];
  uint64_t v356 = objc_opt_class();
  v149 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v356 count:1];
  v475[60] = v149;
  v417[61] = *MEMORY[0x1E4F2F938];
  uint64_t v355 = objc_opt_class();
  v148 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v355 count:1];
  v475[61] = v148;
  v417[62] = *MEMORY[0x1E4F2F970];
  uint64_t v354 = objc_opt_class();
  v147 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v354 count:1];
  v475[62] = v147;
  v417[63] = *MEMORY[0x1E4F2F808];
  uint64_t v353 = objc_opt_class();
  v146 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v353 count:1];
  v475[63] = v146;
  v417[64] = *MEMORY[0x1E4F2F958];
  uint64_t v352 = objc_opt_class();
  v145 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v352 count:1];
  v475[64] = v145;
  v417[65] = *MEMORY[0x1E4F2F928];
  uint64_t v351 = objc_opt_class();
  v144 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v351 count:1];
  v475[65] = v144;
  v417[66] = *MEMORY[0x1E4F2FB80];
  uint64_t v350 = objc_opt_class();
  v143 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v350 count:1];
  v475[66] = v143;
  v417[67] = *MEMORY[0x1E4F2FB58];
  uint64_t v349 = objc_opt_class();
  v142 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v349 count:1];
  v475[67] = v142;
  v417[68] = *MEMORY[0x1E4F2FB68];
  uint64_t v348 = objc_opt_class();
  v141 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v348 count:1];
  v475[68] = v141;
  v417[69] = *MEMORY[0x1E4F2FB98];
  uint64_t v347 = objc_opt_class();
  v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v347 count:1];
  v475[69] = v140;
  v417[70] = *MEMORY[0x1E4F2FBA8];
  uint64_t v346 = objc_opt_class();
  v139 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v346 count:1];
  v475[70] = v139;
  v417[71] = *MEMORY[0x1E4F2FBC0];
  uint64_t v345 = objc_opt_class();
  v138 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v345 count:1];
  v475[71] = v138;
  v417[72] = *MEMORY[0x1E4F2FB60];
  uint64_t v344 = objc_opt_class();
  v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v344 count:1];
  v475[72] = v137;
  v417[73] = *MEMORY[0x1E4F2FBC8];
  uint64_t v343 = objc_opt_class();
  v136 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v343 count:1];
  v475[73] = v136;
  v417[74] = *MEMORY[0x1E4F2FA18];
  uint64_t v342 = objc_opt_class();
  v135 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v342 count:1];
  v475[74] = v135;
  v417[75] = *MEMORY[0x1E4F2F9B0];
  uint64_t v341 = objc_opt_class();
  v134 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v341 count:1];
  v475[75] = v134;
  v417[76] = *MEMORY[0x1E4F2F9B8];
  uint64_t v340 = objc_opt_class();
  v133 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v340 count:1];
  v475[76] = v133;
  v417[77] = *MEMORY[0x1E4F2FA98];
  uint64_t v339 = objc_opt_class();
  v132 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v339 count:1];
  v475[77] = v132;
  v417[78] = *MEMORY[0x1E4F2F9D0];
  uint64_t v338 = objc_opt_class();
  v131 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v338 count:1];
  v475[78] = v131;
  v417[79] = *MEMORY[0x1E4F2F9D8];
  uint64_t v337 = objc_opt_class();
  v130 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v337 count:1];
  v475[79] = v130;
  v417[80] = *MEMORY[0x1E4F2F9E0];
  uint64_t v336 = objc_opt_class();
  v129 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v336 count:1];
  v475[80] = v129;
  v417[81] = *MEMORY[0x1E4F2FA28];
  uint64_t v335 = objc_opt_class();
  v128 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v335 count:1];
  v475[81] = v128;
  v417[82] = *MEMORY[0x1E4F2FA30];
  uint64_t v334 = objc_opt_class();
  v127 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v334 count:1];
  v475[82] = v127;
  v417[83] = *MEMORY[0x1E4F2FA38];
  uint64_t v333 = objc_opt_class();
  v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v333 count:1];
  v475[83] = v126;
  v417[84] = *MEMORY[0x1E4F2FA40];
  uint64_t v332 = objc_opt_class();
  v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v332 count:1];
  v475[84] = v125;
  v417[85] = *MEMORY[0x1E4F2FA48];
  uint64_t v331 = objc_opt_class();
  v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v331 count:1];
  v475[85] = v124;
  v417[86] = *MEMORY[0x1E4F2FA50];
  uint64_t v330 = objc_opt_class();
  v123 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v330 count:1];
  v475[86] = v123;
  v417[87] = *MEMORY[0x1E4F2FA58];
  uint64_t v329 = objc_opt_class();
  v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v329 count:1];
  v475[87] = v122;
  v417[88] = *MEMORY[0x1E4F2FA80];
  uint64_t v328 = objc_opt_class();
  v121 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v328 count:1];
  v475[88] = v121;
  v417[89] = *MEMORY[0x1E4F2FA88];
  uint64_t v327 = objc_opt_class();
  v120 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v327 count:1];
  v475[89] = v120;
  v417[90] = *MEMORY[0x1E4F2FB38];
  uint64_t v326 = objc_opt_class();
  v119 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v326 count:1];
  v475[90] = v119;
  v417[91] = *MEMORY[0x1E4F2FFF0];
  uint64_t v325 = objc_opt_class();
  v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v325 count:1];
  v475[91] = v118;
  v417[92] = *MEMORY[0x1E4F2FFB8];
  uint64_t v324 = objc_opt_class();
  v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v324 count:1];
  v475[92] = v117;
  v417[93] = *MEMORY[0x1E4F2FFC0];
  uint64_t v323 = objc_opt_class();
  v116 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v323 count:1];
  v475[93] = v116;
  v417[94] = *MEMORY[0x1E4F2FFC8];
  uint64_t v322 = objc_opt_class();
  v115 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v322 count:1];
  v475[94] = v115;
  v417[95] = *MEMORY[0x1E4F2FFF8];
  uint64_t v321 = objc_opt_class();
  v114 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v321 count:1];
  v475[95] = v114;
  v417[96] = *MEMORY[0x1E4F2FFE0];
  uint64_t v320 = objc_opt_class();
  v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v320 count:1];
  v475[96] = v113;
  v417[97] = *MEMORY[0x1E4F2FFE8];
  uint64_t v319 = objc_opt_class();
  v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v319 count:1];
  v475[97] = v112;
  v417[98] = *MEMORY[0x1E4F2FC20];
  uint64_t v318 = objc_opt_class();
  v111 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v318 count:1];
  v475[98] = v111;
  v417[99] = *MEMORY[0x1E4F51138];
  uint64_t v317 = objc_opt_class();
  v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v317 count:1];
  v475[99] = v110;
  v417[100] = *MEMORY[0x1E4F15538];
  uint64_t v316 = objc_opt_class();
  v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v316 count:1];
  v475[100] = v109;
  v417[101] = *MEMORY[0x1E4F510F0];
  uint64_t v315 = objc_opt_class();
  v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v315 count:1];
  v475[101] = v108;
  v417[102] = *MEMORY[0x1E4F510E8];
  uint64_t v314 = objc_opt_class();
  v107 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v314 count:1];
  v475[102] = v107;
  v417[103] = *MEMORY[0x1E4F510F8];
  v475[103] = MEMORY[0x1E4F1CBF0];
  v417[104] = *MEMORY[0x1E4F510C8];
  uint64_t v313 = objc_opt_class();
  v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v313 count:1];
  v475[104] = v106;
  v417[105] = *MEMORY[0x1E4F51100];
  uint64_t v312 = objc_opt_class();
  v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v312 count:1];
  v475[105] = v105;
  v417[106] = *MEMORY[0x1E4F15530];
  uint64_t v311 = objc_opt_class();
  v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v311 count:1];
  v475[106] = v104;
  v417[107] = *MEMORY[0x1E4F51110];
  uint64_t v310 = objc_opt_class();
  v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v310 count:1];
  v475[107] = v103;
  v417[108] = *MEMORY[0x1E4F15550];
  uint64_t v309 = objc_opt_class();
  v102 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v309 count:1];
  v475[108] = v102;
  v417[109] = *MEMORY[0x1E4F15588];
  uint64_t v308 = objc_opt_class();
  v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v308 count:1];
  v475[109] = v101;
  v417[110] = *MEMORY[0x1E4F15598];
  uint64_t v307 = objc_opt_class();
  v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v307 count:1];
  v475[110] = v100;
  v417[111] = *MEMORY[0x1E4F15578];
  uint64_t v306 = objc_opt_class();
  v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v306 count:1];
  v475[111] = v99;
  v417[112] = *MEMORY[0x1E4F510D8];
  uint64_t v305 = objc_opt_class();
  v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v305 count:1];
  v475[112] = v98;
  v417[113] = *MEMORY[0x1E4F15590];
  uint64_t v304 = objc_opt_class();
  v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v304 count:1];
  v475[113] = v97;
  v417[114] = *MEMORY[0x1E4F15558];
  uint64_t v303 = objc_opt_class();
  uint64_t v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v303 count:1];
  v475[114] = v96;
  v417[115] = *MEMORY[0x1E4F15580];
  uint64_t v302 = objc_opt_class();
  uint64_t v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v302 count:1];
  v475[115] = v95;
  v417[116] = *MEMORY[0x1E4F15548];
  uint64_t v301 = objc_opt_class();
  uint64_t v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v301 count:1];
  v475[116] = v94;
  v417[117] = *MEMORY[0x1E4F51098];
  v300[0] = objc_opt_class();
  v300[1] = objc_opt_class();
  uint64_t v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v300 count:2];
  v475[117] = v93;
  v417[118] = *MEMORY[0x1E4F51028];
  uint64_t v299 = objc_opt_class();
  uint64_t v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v299 count:1];
  v475[118] = v92;
  v417[119] = *MEMORY[0x1E4F155A0];
  uint64_t v298 = objc_opt_class();
  uint64_t v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v298 count:1];
  v475[119] = v91;
  v417[120] = *MEMORY[0x1E4F51108];
  uint64_t v297 = objc_opt_class();
  uint64_t v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v297 count:1];
  v475[120] = v90;
  v417[121] = *MEMORY[0x1E4F51120];
  uint64_t v296 = objc_opt_class();
  uint64_t v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v296 count:1];
  v475[121] = v89;
  v417[122] = *MEMORY[0x1E4F51118];
  uint64_t v295 = objc_opt_class();
  uint64_t v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v295 count:1];
  v475[122] = v88;
  v417[123] = *MEMORY[0x1E4F51018];
  uint64_t v294 = objc_opt_class();
  uint64_t v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v294 count:1];
  v475[123] = v87;
  v417[124] = *MEMORY[0x1E4F15608];
  uint64_t v293 = objc_opt_class();
  uint64_t v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v293 count:1];
  v475[124] = v86;
  v417[125] = *MEMORY[0x1E4F15570];
  uint64_t v292 = objc_opt_class();
  uint64_t v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v292 count:1];
  v475[125] = v85;
  v417[126] = *MEMORY[0x1E4F15610];
  uint64_t v291 = objc_opt_class();
  uint64_t v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v291 count:1];
  v475[126] = v84;
  v417[127] = *MEMORY[0x1E4F51048];
  uint64_t v290 = objc_opt_class();
  uint64_t v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v290 count:1];
  v475[127] = v83;
  v417[128] = *MEMORY[0x1E4F51038];
  uint64_t v289 = objc_opt_class();
  uint64_t v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v289 count:1];
  v475[128] = v82;
  v417[129] = *MEMORY[0x1E4F51070];
  uint64_t v288 = objc_opt_class();
  uint64_t v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v288 count:1];
  v475[129] = v81;
  v417[130] = *MEMORY[0x1E4F15568];
  uint64_t v287 = objc_opt_class();
  uint64_t v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v287 count:1];
  v475[130] = v80;
  v417[131] = *MEMORY[0x1E4F51020];
  uint64_t v286 = objc_opt_class();
  uint64_t v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v286 count:1];
  v475[131] = v79;
  v417[132] = *MEMORY[0x1E4F51080];
  uint64_t v285 = objc_opt_class();
  uint64_t v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v285 count:1];
  v475[132] = v78;
  v417[133] = *MEMORY[0x1E4F510C0];
  uint64_t v284 = objc_opt_class();
  uint64_t v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v284 count:1];
  v475[133] = v77;
  v417[134] = *MEMORY[0x1E4F510A8];
  uint64_t v283 = objc_opt_class();
  uint64_t v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v283 count:1];
  v475[134] = v76;
  v417[135] = *MEMORY[0x1E4F510B0];
  uint64_t v282 = objc_opt_class();
  uint64_t v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v282 count:1];
  v475[135] = v75;
  v417[136] = *MEMORY[0x1E4F51090];
  uint64_t v281 = objc_opt_class();
  uint64_t v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v281 count:1];
  v475[136] = v74;
  v417[137] = *MEMORY[0x1E4F51088];
  uint64_t v280 = objc_opt_class();
  uint64_t v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v280 count:1];
  v475[137] = v73;
  v417[138] = *MEMORY[0x1E4F510B8];
  uint64_t v279 = objc_opt_class();
  uint64_t v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v279 count:1];
  v475[138] = v72;
  v417[139] = *MEMORY[0x1E4F51128];
  uint64_t v278 = objc_opt_class();
  uint64_t v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v278 count:1];
  v475[139] = v71;
  v417[140] = *MEMORY[0x1E4F51010];
  uint64_t v277 = objc_opt_class();
  uint64_t v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v277 count:1];
  v475[140] = v70;
  v417[141] = *MEMORY[0x1E4F51058];
  uint64_t v276 = objc_opt_class();
  uint64_t v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v276 count:1];
  v475[141] = v69;
  v417[142] = *MEMORY[0x1E4F51030];
  uint64_t v275 = objc_opt_class();
  uint64_t v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v275 count:1];
  v475[142] = v68;
  v417[143] = *MEMORY[0x1E4F51060];
  uint64_t v274 = objc_opt_class();
  uint64_t v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v274 count:1];
  v475[143] = v67;
  v417[144] = *MEMORY[0x1E4F510E0];
  uint64_t v273 = objc_opt_class();
  uint64_t v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v273 count:1];
  v475[144] = v66;
  v417[145] = *MEMORY[0x1E4F155A8];
  uint64_t v272 = objc_opt_class();
  uint64_t v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v272 count:1];
  v475[145] = v65;
  v417[146] = *MEMORY[0x1E4F155C0];
  uint64_t v271 = objc_opt_class();
  uint64_t v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v271 count:1];
  v475[146] = v64;
  v417[147] = *MEMORY[0x1E4F155B0];
  uint64_t v270 = objc_opt_class();
  uint64_t v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v270 count:1];
  v475[147] = v63;
  v417[148] = *MEMORY[0x1E4F155C8];
  uint64_t v269 = objc_opt_class();
  uint64_t v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v269 count:1];
  v475[148] = v62;
  v417[149] = *MEMORY[0x1E4F155B8];
  uint64_t v268 = objc_opt_class();
  uint64_t v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v268 count:1];
  v475[149] = v61;
  v417[150] = *MEMORY[0x1E4F15540];
  uint64_t v267 = objc_opt_class();
  uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v267 count:1];
  v475[150] = v60;
  uint64_t v418 = *MEMORY[0x1E4F51078];
  uint64_t v0 = v418;
  uint64_t v266 = objc_opt_class();
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v266 count:1];
  v475[151] = v59;
  uint64_t v419 = v0;
  uint64_t v265 = objc_opt_class();
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v265 count:1];
  v475[152] = v58;
  uint64_t v420 = *MEMORY[0x1E4F510A0];
  uint64_t v264 = objc_opt_class();
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v264 count:1];
  v475[153] = v57;
  uint64_t v421 = *MEMORY[0x1E4F2F3C0];
  uint64_t v263 = objc_opt_class();
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v263 count:1];
  v475[154] = v56;
  uint64_t v422 = *MEMORY[0x1E4F2F370];
  uint64_t v262 = objc_opt_class();
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v262 count:1];
  v475[155] = v55;
  uint64_t v423 = *MEMORY[0x1E4F2F380];
  uint64_t v261 = objc_opt_class();
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v261 count:1];
  v475[156] = v54;
  uint64_t v424 = *MEMORY[0x1E4F2F378];
  uint64_t v260 = objc_opt_class();
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v260 count:1];
  v475[157] = v53;
  v425 = @"BytesPerRow";
  uint64_t v259 = objc_opt_class();
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v259 count:1];
  v475[158] = v52;
  v426 = @"Height";
  uint64_t v258 = objc_opt_class();
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v258 count:1];
  v475[159] = v51;
  v427 = @"Orientation";
  uint64_t v257 = objc_opt_class();
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v257 count:1];
  v475[160] = v50;
  v428 = @"PixelFormat";
  uint64_t v256 = objc_opt_class();
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v256 count:1];
  v475[161] = v49;
  v429 = @"Width";
  uint64_t v255 = objc_opt_class();
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v255 count:1];
  v475[162] = v48;
  uint64_t v430 = *MEMORY[0x1E4F51130];
  uint64_t v254 = objc_opt_class();
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v254 count:1];
  v475[163] = v47;
  v431 = @"epoch";
  uint64_t v253 = objc_opt_class();
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v253 count:1];
  v475[164] = v46;
  v432 = @"flags";
  uint64_t v252 = objc_opt_class();
  uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v252 count:1];
  v475[165] = v45;
  v433 = @"timescale";
  uint64_t v251 = objc_opt_class();
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v251 count:1];
  v475[166] = v44;
  v434 = @"value";
  uint64_t v250 = objc_opt_class();
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v250 count:1];
  v475[167] = v43;
  uint64_t v435 = *MEMORY[0x1E4F2FC28];
  uint64_t v249 = objc_opt_class();
  __int16 v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v249 count:1];
  v475[168] = v42;
  uint64_t v436 = *MEMORY[0x1E4F2FC48];
  uint64_t v248 = objc_opt_class();
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v248 count:1];
  v475[169] = v41;
  uint64_t v437 = *MEMORY[0x1E4F2FC60];
  uint64_t v247 = objc_opt_class();
  __int16 v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v247 count:1];
  v475[170] = v40;
  uint64_t v438 = *MEMORY[0x1E4F2FD40];
  uint64_t v246 = objc_opt_class();
  id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v246 count:1];
  v475[171] = v39;
  uint64_t v439 = *MEMORY[0x1E4F2FD38];
  v245[0] = objc_opt_class();
  v245[1] = objc_opt_class();
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v245 count:2];
  v475[172] = v38;
  uint64_t v440 = *MEMORY[0x1E4F2FD50];
  uint64_t v244 = objc_opt_class();
  long long v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v244 count:1];
  v475[173] = v37;
  uint64_t v441 = *MEMORY[0x1E4F2FD60];
  uint64_t v243 = objc_opt_class();
  long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v243 count:1];
  v475[174] = v36;
  uint64_t v442 = *MEMORY[0x1E4F2FD68];
  uint64_t v242 = objc_opt_class();
  long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v242 count:1];
  v475[175] = v35;
  uint64_t v443 = *MEMORY[0x1E4F2FD70];
  uint64_t v241 = objc_opt_class();
  long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v241 count:1];
  v475[176] = v34;
  uint64_t v444 = *MEMORY[0x1E4F2FD80];
  uint64_t v240 = objc_opt_class();
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v240 count:1];
  v475[177] = v33;
  uint64_t v445 = *MEMORY[0x1E4F2FD88];
  uint64_t v239 = objc_opt_class();
  id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v239 count:1];
  v475[178] = v32;
  uint64_t v446 = *MEMORY[0x1E4F2FD90];
  uint64_t v238 = objc_opt_class();
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v238 count:1];
  v475[179] = v31;
  uint64_t v447 = *MEMORY[0x1E4F2FD98];
  uint64_t v237 = objc_opt_class();
  id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v237 count:1];
  v475[180] = v30;
  uint64_t v448 = *MEMORY[0x1E4F2FDA8];
  uint64_t v236 = objc_opt_class();
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v236 count:1];
  v475[181] = v29;
  uint64_t v449 = *MEMORY[0x1E4F2FDB8];
  uint64_t v235 = objc_opt_class();
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v235 count:1];
  v475[182] = v28;
  uint64_t v450 = *MEMORY[0x1E4F2F548];
  uint64_t v234 = objc_opt_class();
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v234 count:1];
  v475[183] = v27;
  uint64_t v451 = *MEMORY[0x1E4F2F570];
  uint64_t v233 = objc_opt_class();
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v233 count:1];
  v475[184] = v26;
  uint64_t v452 = *MEMORY[0x1E4F2F990];
  uint64_t v232 = objc_opt_class();
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v232 count:1];
  v475[185] = v25;
  uint64_t v453 = *MEMORY[0x1E4F2F988];
  uint64_t v231 = objc_opt_class();
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v231 count:1];
  v475[186] = v24;
  v454 = @"{raw}";
  uint64_t v230 = objc_opt_class();
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v230 count:1];
  v475[187] = v23;
  v455 = @"Thumbnails";
  uint64_t v229 = objc_opt_class();
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v229 count:1];
  v475[188] = v22;
  uint64_t v456 = *MEMORY[0x1E4F2FDD8];
  uint64_t v228 = objc_opt_class();
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v228 count:1];
  v475[189] = v21;
  uint64_t v457 = *MEMORY[0x1E4F2FB48];
  uint64_t v227 = objc_opt_class();
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v227 count:1];
  v475[190] = v20;
  v458 = @"JPEGOffset";
  uint64_t v226 = objc_opt_class();
  long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v226 count:1];
  v475[191] = v19;
  v459 = @"JPEGLength";
  uint64_t v225 = objc_opt_class();
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v225 count:1];
  v475[192] = v18;
  v460 = @"Orientation";
  uint64_t v224 = objc_opt_class();
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v224 count:1];
  v475[193] = v17;
  uint64_t v461 = *MEMORY[0x1E4F2FB18];
  uint64_t v223 = objc_opt_class();
  __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v223 count:1];
  v475[194] = v16;
  uint64_t v462 = *MEMORY[0x1E4F2FB10];
  uint64_t v222 = objc_opt_class();
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v222 count:1];
  v475[195] = v15;
  uint64_t v463 = *MEMORY[0x1E4F2FAF8];
  uint64_t v221 = objc_opt_class();
  int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v221 count:1];
  v475[196] = v14;
  uint64_t v464 = *MEMORY[0x1E4F2FAD8];
  uint64_t v220 = objc_opt_class();
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v220 count:1];
  v475[197] = v13;
  uint64_t v465 = *MEMORY[0x1E4F2FAC0];
  uint64_t v219 = objc_opt_class();
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v219 count:1];
  v475[198] = v12;
  uint64_t v466 = *MEMORY[0x1E4F2FAC8];
  uint64_t v218 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v218 count:1];
  v475[199] = v1;
  uint64_t v467 = *MEMORY[0x1E4F2FAB8];
  uint64_t v217 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v217 count:1];
  v475[200] = v2;
  uint64_t v468 = kPFImagePropertyMakerAppleSmartStyles;
  uint64_t v216 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v216 count:1];
  v475[201] = v3;
  uint64_t v469 = kPFImagePropertyMakerAppleSmartStylesRenderingVersion;
  uint64_t v215 = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v215 count:1];
  v475[202] = v4;
  uint64_t v470 = kPFImagePropertyMakerAppleSmartStylesColorBias;
  uint64_t v214 = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v214 count:1];
  v475[203] = v5;
  uint64_t v471 = kPFImagePropertyMakerAppleSmartStylesIntensity;
  uint64_t v213 = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v213 count:1];
  v475[204] = v6;
  uint64_t v472 = kPFImagePropertyMakerAppleSmartStylesCast;
  uint64_t v212 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v212 count:1];
  v475[205] = v7;
  uint64_t v473 = kPFImagePropertyMakerAppleSmartStylesIsReversible;
  uint64_t v211 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v211 count:1];
  v475[206] = v8;
  uint64_t v474 = kPFImagePropertyMakerAppleSmartStylesIsExpectingReversibility;
  uint64_t v210 = objc_opt_class();
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v210 count:1];
  v475[207] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v475 forKeys:v417 count:208];
  uint64_t v11 = (void *)_expectedImageDictionaryPropertyTypes_expectedImageDictionaryPropertyTypes;
  _expectedImageDictionaryPropertyTypes_expectedImageDictionaryPropertyTypes = v10;
}

- (id)_expectedImageArrayPropertyTypes
{
  if (_expectedImageArrayPropertyTypes_onceToken[0] != -1) {
    dispatch_once(_expectedImageArrayPropertyTypes_onceToken, &__block_literal_global_4108);
  }
  v2 = (void *)_expectedImageArrayPropertyTypes_expectedImageArrayPropertyTypes;

  return v2;
}

void __58__PFMetadataTypeVerifier__expectedImageArrayPropertyTypes__block_invoke()
{
  v27[12] = *MEMORY[0x1E4F143B8];
  v26[0] = @"AFInfo";
  uint64_t v25 = objc_opt_class();
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v27[0] = v13;
  v26[1] = *MEMORY[0x1E4F2F7C8];
  uint64_t v24 = objc_opt_class();
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v27[1] = v12;
  v26[2] = *MEMORY[0x1E4F2F968];
  uint64_t v23 = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v27[2] = v11;
  v26[3] = *MEMORY[0x1E4F2F840];
  uint64_t v22 = objc_opt_class();
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v27[3] = v10;
  v26[4] = *MEMORY[0x1E4F2F878];
  uint64_t v21 = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v27[4] = v0;
  v26[5] = *MEMORY[0x1E4F2F8A0];
  uint64_t v20 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v27[5] = v1;
  v26[6] = *MEMORY[0x1E4F2F700];
  uint64_t v19 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v27[6] = v2;
  v26[7] = *MEMORY[0x1E4F2F938];
  uint64_t v18 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v27[7] = v3;
  v26[8] = *MEMORY[0x1E4F2FBC0];
  uint64_t v17 = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v27[8] = v4;
  v26[9] = *MEMORY[0x1E4F510F0];
  uint64_t v16 = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v27[9] = v5;
  v26[10] = *MEMORY[0x1E4F51028];
  uint64_t v15 = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v27[10] = v6;
  v26[11] = *MEMORY[0x1E4F2FC60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v27[11] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:12];
  uint64_t v9 = (void *)_expectedImageArrayPropertyTypes_expectedImageArrayPropertyTypes;
  _expectedImageArrayPropertyTypes_expectedImageArrayPropertyTypes = v8;
}

- (PFMetadataTypeVerifier)init
{
  v13.receiver = self;
  v13.super_class = (Class)PFMetadataTypeVerifier;
  v2 = [(PFMetadataTypeVerifier *)&v13 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(PFMetadataTypeVerifier *)v2 _expectedImageDictionaryPropertyTypes];
    expectedImageDictionaryPropertyTypes = v3->_expectedImageDictionaryPropertyTypes;
    v3->_expectedImageDictionaryPropertyTypes = (NSDictionary *)v4;

    uint64_t v6 = [(PFMetadataTypeVerifier *)v3 _expectedImageArrayPropertyTypes];
    expectedImageArrayPropertyTypes = v3->_expectedImageArrayPropertyTypes;
    v3->_expectedImageArrayPropertyTypes = (NSDictionary *)v6;

    uint64_t v8 = [(PFMetadataTypeVerifier *)v3 _expectedAVMetadataIdentifierTypes];
    expectedAVMetadataIdentifierTypes = v3->_expectedAVMetadataIdentifierTypes;
    v3->_expectedAVMetadataIdentifierTypes = (NSDictionary *)v8;

    uint64_t v10 = [(PFMetadataTypeVerifier *)v3 _expectedAVMetadataKeyKeySpaceTypes];
    expectedAVMetadataKeyKeySpaceTypes = v3->_expectedAVMetadataKeyKeySpaceTypes;
    v3->_expectedAVMetadataKeyKeySpaceTypes = (NSDictionary *)v10;
  }
  return v3;
}

@end