@interface PICompositionSerializer
+ (BOOL)_validateValueTypesForKeys:(id)a3 requiredKeys:(id)a4 inDictionary:(id)a5 error:(id *)a6;
+ (BOOL)canInterpretDataWithFormatIdentifier:(id)a3 formatVersion:(id)a4;
+ (BOOL)validateAdjustmentsEnvelope:(id)a3 error:(id *)a4;
+ (BOOL)validateCompositionWithMissingSource:(id)a3 error:(id *)a4;
+ (id)_serializeComposition:(id)a3 versionInfo:(id)a4 skipMetadata:(BOOL)a5 error:(id *)a6;
+ (id)adjustmentInformationForComposition:(id)a3 error:(id *)a4;
+ (id)adjustmentInformationForComposition:(id)a3 skipMetadata:(BOOL)a4 error:(id *)a5;
+ (id)deserializeCompositionFromAdjustments:(id)a3 metadata:(id)a4 formatIdentifier:(id)a5 formatVersion:(id)a6 error:(id *)a7;
+ (id)deserializeCompositionFromAdjustments:(id)a3 metadata:(id)a4 formatIdentifier:(id)a5 formatVersion:(id)a6 sidecarData:(id)a7 error:(id *)a8;
+ (id)deserializeCompositionFromData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 error:(id *)a6;
+ (id)deserializeCompositionFromData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 sidecarData:(id)a6 error:(id *)a7;
+ (id)deserializeDictionaryFromData:(id)a3 error:(id *)a4;
+ (id)serializeComposition:(id)a3 versionInfo:(id)a4 error:(id *)a5;
+ (id)serializeComposition:(id)a3 versionInfo:(id)a4 serializerMetadata:(id)a5 error:(id *)a6;
+ (id)serializeDictionary:(id)a3 error:(id *)a4;
+ (void)_sanitizeComposition:(id)a3;
+ (void)disableApertureEffects:(BOOL)a3;
+ (void)initialize;
@end

@implementation PICompositionSerializer

+ (id)adjustmentInformationForComposition:(id)a3 skipMetadata:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v32[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (void *)_CFCopySystemVersionDictionary();
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
  if (!v9)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PICompositionSerializer.m", 624, @"Invalid parameter not satisfying: %@", @"composition" object file lineNumber description];
  }
  v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v13 = [v12 infoDictionary];
  uint64_t v14 = [v13 objectForKey:@"CFBundleVersion"];
  v15 = (void *)v14;
  v16 = &stru_1EFFD8610;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  v17 = v16;

  v31[0] = @"platform";
  v31[1] = @"buildNumber";
  v32[0] = @"iOS";
  v32[1] = v11;
  v31[2] = @"appVersion";
  v31[3] = @"schemaRevision";
  v32[2] = v17;
  v32[3] = &unk_1F00097A0;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
  id v28 = 0;
  v19 = +[PICompositionSerializer _serializeComposition:v9 versionInfo:v18 skipMetadata:v6 error:&v28];

  id v20 = v28;
  v21 = v20;
  if (v19)
  {
    v22 = [MEMORY[0x1E4F1CA60] dictionary];
    v23 = [v19 data];
    [v22 setObject:v23 forKeyedSubscript:@"adjustmentData"];

    v24 = [v19 formatIdentifier];
    [v22 setObject:v24 forKeyedSubscript:@"adjustmentFormatIdentifier"];

    v25 = [v19 formatVersion];
    [v22 setObject:v25 forKeyedSubscript:@"adjustmentFormatVersion"];
  }
  else
  {
    if (a5) {
      *a5 = v20;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v21;
      _os_log_error_impl(&dword_1A9680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to serialize finalized composition: %{public}@", buf, 0xCu);
    }
    v22 = 0;
  }

  return v22;
}

+ (id)adjustmentInformationForComposition:(id)a3 error:(id *)a4
{
  return (id)[a1 adjustmentInformationForComposition:a3 skipMetadata:0 error:a4];
}

+ (void)_sanitizeComposition:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  v3 = [[PICompositionController alloc] initWithComposition:v32];
  v4 = [(PICompositionController *)v3 compositionKeys];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    v31 = v3;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
        if ((objc_msgSend(v9, "isEqualToString:", @"orientation", v24, v25) & 1) == 0
          && ([v9 isEqualToString:@"mute"] & 1) == 0)
        {
          v10 = [(PICompositionController *)v3 adjustmentControllerForKey:v9];
          if ([v10 _isDefault])
          {
            v11 = [v32 debugDescription];
            [v32 setObject:0 forKeyedSubscript:v9];
            if (*MEMORY[0x1E4F7A750] != -1) {
              dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_293);
            }
            v12 = (void *)*MEMORY[0x1E4F7A748];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_DEFAULT))
            {
              v13 = NSString;
              uint64_t v14 = v12;
              v15 = [v13 stringWithFormat:@"Adjustment for %@ is identity\n%@", v9, v11];
              *(_DWORD *)buf = 138543362;
              v38 = v15;
              _os_log_impl(&dword_1A9680000, v14, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

              uint64_t v16 = *MEMORY[0x1E4F7A750];
            }
            else
            {
              uint64_t v16 = -1;
            }
            if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
            {
              if (v16 != -1) {
                dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_293);
              }
              v17 = (void *)*MEMORY[0x1E4F7A748];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
              {
                specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
                v18 = (void *)MEMORY[0x1E4F29060];
                os_log_t log = specific;
                v19 = v17;
                v27 = [v18 callStackSymbols];
                id v20 = [v27 componentsJoinedByString:@"\n"];
                *(_DWORD *)buf = 138543618;
                v38 = specific;
                __int16 v39 = 2114;
                v40 = v20;
                _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
              }
            }
            else
            {
              if (v16 != -1) {
                dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_293);
              }
              v21 = (void *)*MEMORY[0x1E4F7A748];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
              {
                v22 = (void *)MEMORY[0x1E4F29060];
                loga = v21;
                id v28 = [v22 callStackSymbols];
                v23 = [v28 componentsJoinedByString:@"\n"];
                *(_DWORD *)buf = 138543362;
                v38 = v23;
                _os_log_error_impl(&dword_1A9680000, loga, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
              }
            }
            v24 = v9;
            v25 = v11;
            _NUAssertContinueHandler();

            v3 = v31;
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v6);
  }
}

+ (id)deserializeDictionaryFromData:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v9 = NUAssertLogger_1604();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "data != nil");
      *(_DWORD *)buf = 138543362;
      long long v34 = v10;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v11 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v13 = NUAssertLogger_1604();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (!v14) {
        goto LABEL_22;
      }
      goto LABEL_16;
    }
    if (v14)
    {
      v22 = dispatch_get_specific(*v11);
      v23 = (void *)MEMORY[0x1E4F29060];
      id v24 = v22;
      v25 = [v23 callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      long long v34 = v22;
      __int16 v35 = 2114;
      long long v36 = v26;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_22:

    _NUAssertFailHandler();
    __break(1u);
    JUMPOUT(0x1A969E9C4);
  }
  if (!a4)
  {
    v15 = NUAssertLogger_1604();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      long long v34 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    v18 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v13 = NUAssertLogger_1604();
    BOOL v19 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v19)
      {
        v27 = dispatch_get_specific(*v17);
        id v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v34 = v27;
        __int16 v35 = 2114;
        long long v36 = v31;
        _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
LABEL_16:
      id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v34 = v21;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  uint64_t v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [MEMORY[0x1E4F8CE58] decompressData:v6 options:0 error:a4];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:a4];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    [MEMORY[0x1E4F7A438] mismatchError:@"Data object is not of the correct type" object:v6];
    uint64_t v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)serializeDictionary:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v11 = NUAssertLogger_1604();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dictionary != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v15 = NUAssertLogger_1604();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (!v16) {
        goto LABEL_23;
      }
      goto LABEL_17;
    }
    if (v16)
    {
      id v24 = dispatch_get_specific(*v13);
      v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = v24;
      v27 = [v25 callStackSymbols];
      id v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v24;
      __int16 v38 = 2114;
      __int16 v39 = v28;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_23:

    _NUAssertFailHandler();
    __break(1u);
    JUMPOUT(0x1A969EF64);
  }
  if (!a4)
  {
    v17 = NUAssertLogger_1604();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v19 = (const void **)MEMORY[0x1E4F7A308];
    id v20 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v15 = NUAssertLogger_1604();
    BOOL v21 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v21)
      {
        id v29 = dispatch_get_specific(*v19);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        id v32 = [v30 callStackSymbols];
        long long v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v29;
        __int16 v38 = 2114;
        __int16 v39 = v33;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
LABEL_17:
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v23;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:a4];
  if (v7)
  {
    id v35 = 0;
    uint64_t v8 = [MEMORY[0x1E4F8CE58] compressData:v7 options:0 error:&v35];
    id v9 = v35;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      *a4 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to compress composition data" object:v6 underlyingError:v9];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (BOOL)_validateValueTypesForKeys:(id)a3 requiredKeys:(id)a4 inDictionary:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__PICompositionSerializer__validateValueTypesForKeys_requiredKeys_inDictionary_error___block_invoke;
  v16[3] = &unk_1E5D7EEF0;
  id v12 = v11;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  BOOL v19 = &v21;
  id v20 = &v27;
  [v9 enumerateKeysAndObjectsUsingBlock:v16];
  if (a6) {
    *a6 = (id) v22[5];
  }
  char v14 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __86__PICompositionSerializer__validateValueTypesForKeys_requiredKeys_inDictionary_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v21 = a2;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v7)
  {
    int isKindOfClass = objc_opt_isKindOfClass();
    int v9 = 0;
  }
  else
  {
    int v9 = [*(id *)(a1 + 40) containsObject:v21];
    int isKindOfClass = 1;
  }
  BOOL v10 = objc_opt_class() != a3 && objc_opt_class() != a3;
  if (v9)
  {
    uint64_t v11 = [MEMORY[0x1E4F7A438] missingError:@"Missing required key" object:v21];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
  }
  else if (((isKindOfClass | v10) & 1) == 0)
  {
    char v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    BOOL v16 = NSStringFromClass(v15);
    id v17 = [v14 stringWithFormat:@"Value for key %@ has type %@; expected type %@", v21, v16, a3];

    uint64_t v18 = [MEMORY[0x1E4F7A438] mismatchError:v17 object:0];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (BOOL)validateAdjustmentsEnvelope:(id)a3 error:(id *)a4
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v24[0] = @"metadata";
  v25[0] = objc_opt_class();
  v24[1] = @"formatVersion";
  v25[1] = objc_opt_class();
  v24[2] = @"adjustments";
  v25[2] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F000AA18];
  id v21 = 0;
  char v9 = [a1 _validateValueTypesForKeys:v7 requiredKeys:v8 inDictionary:v6 error:&v21];
  id v10 = v21;
  uint64_t v11 = v10;
  if (v9)
  {
    v22[0] = @"masterHeight";
    v23[0] = objc_opt_class();
    v22[1] = @"masterWidth";
    v23[1] = objc_opt_class();
    v22[2] = @"orientation";
    v23[2] = objc_opt_class();
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    char v14 = [v12 allKeys];
    v15 = [v13 setWithArray:v14];

    BOOL v16 = [v6 objectForKeyedSubscript:@"metadata"];
    id v20 = 0;
    char v17 = [a1 _validateValueTypesForKeys:v12 requiredKeys:v15 inDictionary:v16 error:&v20];
    id v18 = v20;

    if (a4 && (v17 & 1) == 0) {
      *a4 = v18;
    }
  }
  else if (a4)
  {
    id v18 = v10;
    char v17 = 0;
    *a4 = v18;
  }
  else
  {
    char v17 = 0;
    id v18 = v10;
  }

  return v17;
}

+ (id)serializeComposition:(id)a3 versionInfo:(id)a4 serializerMetadata:(id)a5 error:(id *)a6
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v93 = a6;
  if (!a6)
  {
    v90 = [MEMORY[0x1E4F28B00] currentHandler];
    [v90 handleFailureInMethod:a2, a1, @"PICompositionSerializer.m", 321, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  id v95 = v12;
  char v14 = objc_opt_new();
  v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "width"));
  [v14 setObject:v15 forKeyedSubscript:@"masterWidth"];

  BOOL v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "height"));
  [v14 setObject:v16 forKeyedSubscript:@"masterHeight"];

  char v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "orientation"));
  [v14 setObject:v17 forKeyedSubscript:@"orientation"];

  v101 = [MEMORY[0x1E4F1CA48] array];
  id v18 = +[PICompositionNoOpRemoval copyOfCompositionRemovingNoOps:v11];

  v100 = v18;
  v99 = [[PICompositionController alloc] initWithComposition:v18];
  uint64_t v19 = [(PICompositionController *)v99 adjustmentControllerForKey:@"orientation"];
  id v20 = v19;
  if (v19)
  {
    id v21 = [v19 objectForKeyedSubscript:@"orientation"];
    if (v21) {
      [v14 setObject:v21 forKeyedSubscript:@"orientation"];
    }
  }
  id v91 = a1;
  id v92 = v13;
  v96 = v20;
  v94 = v14;
  v102 = +[PICompositionSerializerConstants mapForSerialization];
  v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"source", @"orientation", @"sourceSpatialOvercapture", 0);
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id obj = [(PICompositionController *)v99 compositionKeys];
  uint64_t v23 = [obj countByEnumeratingWithState:&v121 objects:v139 count:16];
  v97 = v22;
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v122;
    uint64_t v103 = *(void *)v122;
LABEL_9:
    uint64_t v26 = 0;
    uint64_t v98 = v24;
    while (1)
    {
      if (*(void *)v122 != v25) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void **)(*((void *)&v121 + 1) + 8 * v26);
      if ([v22 containsObject:v27]) {
        goto LABEL_45;
      }
      uint64_t v28 = [v102 objectForKeyedSubscript:v27];
      if (!v28)
      {
        v70 = (uint64_t *)MEMORY[0x1E4F7A750];
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_293);
        }
        v66 = v94;
        v65 = v95;
        v71 = v92;
        v72 = (os_log_t *)MEMORY[0x1E4F7A748];
        v73 = (void *)*MEMORY[0x1E4F7A748];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_DEFAULT))
        {
          v74 = NSString;
          v75 = v73;
          v76 = [v74 stringWithFormat:@"Serialization map has no entry for %@", v27];
          *(_DWORD *)buf = 138543362;
          v136 = v76;
          _os_log_impl(&dword_1A9680000, v75, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          uint64_t v77 = *v70;
          if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
          {
            v22 = v97;
            if (v77 != -1) {
              dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_293);
            }
LABEL_57:
            os_log_t v78 = *v72;
            if (os_log_type_enabled(*v72, OS_LOG_TYPE_ERROR))
            {
              specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
              v80 = (void *)MEMORY[0x1E4F29060];
              id v81 = specific;
              v82 = v78;
              v83 = [v80 callStackSymbols];
              v84 = [v83 componentsJoinedByString:@"\n"];
              *(_DWORD *)buf = 138543618;
              v136 = specific;
              v22 = v97;
              __int16 v137 = 2114;
              v138 = v84;
              _os_log_error_impl(&dword_1A9680000, v82, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

              goto LABEL_69;
            }
            goto LABEL_64;
          }
          v22 = v97;
          if (v77 != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_293);
          }
        }
        else if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
        {
          goto LABEL_57;
        }
        os_log_t v85 = *v72;
        if (os_log_type_enabled(*v72, OS_LOG_TYPE_ERROR))
        {
          v87 = (void *)MEMORY[0x1E4F29060];
          v82 = v85;
          v88 = [v87 callStackSymbols];
          v89 = [v88 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v136 = v89;
          _os_log_error_impl(&dword_1A9680000, v82, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          v22 = v97;
LABEL_69:
        }
LABEL_64:
        _NUAssertContinueHandler();
        objc_msgSend(MEMORY[0x1E4F7A438], "missingError:object:", @"Serialization map missing adjustment key", v27, v27);
        v68 = 0;
        id *v93 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_65;
      }
      uint64_t v29 = (void *)v28;
      char v30 = v22;
      if (![v27 isEqualToString:@"inpaintMasks"]) {
        break;
      }
      id v31 = [v100 objectForKeyedSubscript:@"inpaintMasks"];

      if (!v31) {
        break;
      }
      id v32 = [v100 objectForKeyedSubscript:@"inpaintMasks"];
      long long v33 = PFMap();
      v133[0] = @"identifier";
      long long v34 = [v29 objectForKeyedSubscript:@"identifierName"];
      v134[0] = v34;
      v133[1] = @"settings";
      v131 = @"maskIdentifiers";
      v132 = v33;
      id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
      v134[1] = v35;
      v134[2] = @"com.apple.photo";
      v133[2] = @"formatIdentifier";
      v133[3] = @"formatVersion";
      v134[3] = &unk_1F0009770;
      uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:v133 count:4];

      v108 = (void *)v36;
      [v101 addObject:v36];
      v22 = v30;
      uint64_t v25 = v103;
LABEL_44:

LABEL_45:
      if (++v26 == v24)
      {
        uint64_t v24 = [obj countByEnumeratingWithState:&v121 objects:v139 count:16];
        if (v24) {
          goto LABEL_9;
        }
        goto LABEL_47;
      }
    }
    uint64_t v37 = [(PICompositionController *)v99 adjustmentControllerForKey:v27];
    if (!v37)
    {
      id *v93 = [MEMORY[0x1E4F7A438] missingError:@"Missing adjustment" object:v27];

      v68 = 0;
      v66 = v94;
      v65 = v95;
      v71 = v92;
      goto LABEL_65;
    }
    __int16 v38 = (void *)v37;
    long long v33 = objc_opt_new();
    __int16 v39 = objc_opt_new();
    [v33 setObject:v39 forKeyedSubscript:@"settings"];
    uint64_t v40 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"identifierName", @"compositionName", @"custom", @"customSerialization", @"customIdentifierName", @"customCompositionName", @"omitIfDisabled", @"inputKeys", @"requiresEnabled", 0);
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __85__PICompositionSerializer_serializeComposition_versionInfo_serializerMetadata_error___block_invoke_139;
    v117[3] = &unk_1E5D7EEC8;
    id v41 = v40;
    id v118 = v41;
    id v32 = v38;
    id v119 = v32;
    id v42 = v39;
    id v120 = v42;
    [v29 enumerateKeysAndObjectsUsingBlock:v117];
    v43 = [v29 objectForKeyedSubscript:@"inputKeys"];
    if (v43)
    {
      id v44 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v42 setObject:v44 forKeyedSubscript:@"inputKeys"];
      v113[0] = MEMORY[0x1E4F143A8];
      v113[1] = 3221225472;
      v113[2] = __85__PICompositionSerializer_serializeComposition_versionInfo_serializerMetadata_error___block_invoke_2;
      v113[3] = &unk_1E5D7EEC8;
      id v114 = v41;
      id v115 = v32;
      id v116 = v44;
      id v45 = v44;
      [v43 enumerateKeysAndObjectsUsingBlock:v113];
    }
    v107 = v43;
    v105 = v41;
    uint64_t v46 = [v29 objectForKeyedSubscript:@"customSerialization"];
    if (v46)
    {
      v47 = [v32 adjustment];
      (*(void (**)(uint64_t, id, void *))(v46 + 16))(v46, v42, v47);
    }
    v104 = (void *)v46;
    v108 = v42;
    v130 = @"enabled";
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1];
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v49 = v48;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v109 objects:v129 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v110;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v110 != v52) {
            objc_enumerationMutation(v49);
          }
          uint64_t v54 = *(void *)(*((void *)&v109 + 1) + 8 * i);
          if ([v32 hasInputKey:v54])
          {
            v55 = [v32 objectForKeyedSubscript:v54];

            if (v55)
            {
              v56 = [v32 objectForKeyedSubscript:v54];
              [v33 setObject:v56 forKeyedSubscript:v54];
            }
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v109 objects:v129 count:16];
      }
      while (v51);
    }

    uint64_t v57 = [v29 objectForKeyedSubscript:@"requiresEnabled"];
    if (v57)
    {
      v58 = (void *)v57;
      v59 = [v33 objectForKeyedSubscript:@"enabled"];

      if (!v59) {
        [v33 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"enabled"];
      }
    }
    uint64_t v24 = v98;
    uint64_t v25 = v103;
    v60 = v107;
    if (![v32 hasInputKey:@"auto"]
      || ([v32 objectForKeyedSubscript:@"auto"],
          v61 = objc_claimAutoreleasedReturnValue(),
          v61,
          !v61))
    {
LABEL_43:
      v64 = [v29 objectForKeyedSubscript:@"identifierName"];
      [v33 setObject:v64 forKeyedSubscript:@"identifier"];

      [v33 setObject:@"com.apple.photo" forKeyedSubscript:@"formatIdentifier"];
      [v33 setObject:&unk_1F0009770 forKeyedSubscript:@"formatVersion"];
      [v101 addObject:v33];

      v22 = v97;
      goto LABEL_44;
    }
    v62 = [v29 objectForKeyedSubscript:@"autoValue"];
    if (v62)
    {
      v63 = [v32 adjustment];
      ((void (**)(void, void *, void *))v62)[2](v62, v33, v63);
    }
    else
    {
      if (![v32 isAuto])
      {
LABEL_42:

        uint64_t v25 = v103;
        goto LABEL_43;
      }
      v127[0] = @"auto";
      v127[1] = @"current";
      v128[0] = MEMORY[0x1E4F1CC08];
      v128[1] = @"auto";
      v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:v127 count:2];
      v60 = v107;
      [v33 setObject:v63 forKeyedSubscript:@"auto"];
    }

    uint64_t v24 = v98;
    goto LABEL_42;
  }
LABEL_47:

  v125[0] = @"metadata";
  v125[1] = @"adjustments";
  v66 = v94;
  v65 = v95;
  v126[0] = v94;
  v126[1] = v101;
  v125[2] = @"formatVersion";
  v125[3] = @"versionInfo";
  v126[2] = &unk_1F0009788;
  v126[3] = v95;
  id obj = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:v125 count:4];
  v67 = objc_msgSend(v91, "serializeDictionary:error:");
  if (v67)
  {
    v68 = objc_opt_new();
    [v68 setFormatIdentifier:@"com.apple.photo"];
    v69 = +[PICompositionSerializerFormatVersion adjustmentDataFormatVersionForComposition:v100];
    [v68 setFormatVersion:v69];

    v22 = v97;
    [v68 setData:v67];
  }
  else
  {
    v68 = 0;
  }
  v71 = v92;

LABEL_65:
  return v68;
}

void __85__PICompositionSerializer_serializeComposition_versionInfo_serializerMetadata_error___block_invoke_139(id *a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([a1[4] containsObject:v8] & 1) == 0)
  {
    id v6 = [a1[5] objectForKeyedSubscript:v8];

    if (v6)
    {
      uint64_t v7 = [a1[5] objectForKeyedSubscript:v8];
      [a1[6] setObject:v7 forKeyedSubscript:v5];
    }
  }
}

void __85__PICompositionSerializer_serializeComposition_versionInfo_serializerMetadata_error___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([a1[4] containsObject:v8] & 1) == 0)
  {
    id v6 = [a1[5] objectForKeyedSubscript:v8];

    if (v6)
    {
      uint64_t v7 = [a1[5] objectForKeyedSubscript:v8];
      [a1[6] setObject:v7 forKeyedSubscript:v5];
    }
  }
}

uint64_t __85__PICompositionSerializer_serializeComposition_versionInfo_serializerMetadata_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 maskIdentifier];
}

+ (id)_serializeComposition:(id)a3 versionInfo:(id)a4 skipMetadata:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc_init(PICompositionSerializerMetadata);
  if (a5) {
    goto LABEL_4;
  }
  id v13 = +[PIPhotoEditHelper geometryRequestWithComposition:v10];
  [v13 setName:@"PICompositionSerializer-geometry"];
  char v14 = [v13 submitSynchronous:a6];
  if (v14)
  {
    v15 = v14;
    BOOL v16 = [v14 geometry];
    -[PICompositionSerializerMetadata setWidth:](v12, "setWidth:", [v16 size]);

    char v17 = [v15 geometry];
    [v17 size];
    [(PICompositionSerializerMetadata *)v12 setHeight:v18];

    uint64_t v19 = [v15 geometry];
    -[PICompositionSerializerMetadata setOrientation:](v12, "setOrientation:", [v19 orientation]);

LABEL_4:
    id v20 = [a1 serializeComposition:v10 versionInfo:v11 serializerMetadata:v12 error:a6];
    goto LABEL_6;
  }

  id v20 = 0;
LABEL_6:

  return v20;
}

+ (id)serializeComposition:(id)a3 versionInfo:(id)a4 error:(id *)a5
{
  return (id)[a1 _serializeComposition:a3 versionInfo:a4 skipMetadata:0 error:a5];
}

+ (id)deserializeCompositionFromAdjustments:(id)a3 metadata:(id)a4 formatIdentifier:(id)a5 formatVersion:(id)a6 sidecarData:(id)a7 error:(id *)a8
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v70 = a5;
  id v71 = a6;
  id v76 = a7;
  if (!a8)
  {
    v66 = [MEMORY[0x1E4F28B00] currentHandler];
    [v66 handleFailureInMethod:a2, a1, @"PICompositionSerializer.m", 151, @"Invalid parameter not satisfying: %@", @"error != NULL" object file lineNumber description];
  }
  BOOL v16 = +[PICompositionSerializerConstants conversionMap];
  id v17 = +[PIPhotoEditHelper newComposition];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v89 objects:v93 count:16];
  id v78 = v18;
  v79 = v16;
  if (!v19) {
    goto LABEL_42;
  }
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)v90;
  v68 = a8;
  id v69 = v15;
  uint64_t v77 = v17;
  uint64_t v80 = *(void *)v90;
  while (2)
  {
    uint64_t v22 = 0;
    uint64_t v75 = v20;
    do
    {
      if (*(void *)v90 != v21) {
        objc_enumerationMutation(v18);
      }
      uint64_t v23 = *(void **)(*((void *)&v89 + 1) + 8 * v22);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = [v23 objectForKeyedSubscript:@"identifier"];
        if (!v24)
        {
          id *v68 = [MEMORY[0x1E4F7A438] missingError:@"Adjustment missing identifier" object:v23];
          goto LABEL_55;
        }
        uint64_t v25 = (void *)v24;
        uint64_t v26 = [v16 objectForKeyedSubscript:v24];
        if (!v26)
        {
          v64 = [NSString stringWithFormat:@"Conversion map is missing adjustment identifier '%@'", v25];
          id *v68 = [MEMORY[0x1E4F7A438] missingError:v64 object:v16];

          goto LABEL_55;
        }
        uint64_t v27 = (void *)v26;
        uint64_t v28 = [v23 objectForKeyedSubscript:@"settings"];
        uint64_t v29 = [v27 objectForKeyedSubscript:@"customIdentifierName"];
        uint64_t v30 = [v27 objectForKeyedSubscript:@"supported"];
        id v31 = (void *)v30;
        if (v30 && ((*(uint64_t (**)(uint64_t, void *))(v30 + 16))(v30, v28) & 1) == 0)
        {
          id *v68 = [MEMORY[0x1E4F7A438] unsupportedError:@"Unsupported adjustment" object:v25];

          goto LABEL_54;
        }
        v83 = v31;
        if (sDisableApertureEffects
          && (([v25 isEqualToString:@"DepthEffect"] & 1) != 0
           || [v25 isEqualToString:@"PortraitEffect"]))
        {
          id *v68 = [MEMORY[0x1E4F7A438] unsupportedError:@"Configuration does not support Aperture adjustments" object:0];

          goto LABEL_52;
        }
        if (v29) {
          ((void (**)(void, void *))v29)[2](v29, v28);
        }
        else {
        id v32 = [v27 objectForKeyedSubscript:@"identifierName"];
        }

        if (!v32)
        {
          id *v68 = [MEMORY[0x1E4F7A438] failureError:@"Failed to generate or read identifier from composition definition" object:v27];
LABEL_52:
          id v31 = v83;
LABEL_54:

LABEL_55:
          id v15 = v69;
          id v17 = v77;
LABEL_56:

          goto LABEL_57;
        }
        v82 = v28;
        if ([v32 isEqualToString:@"InpaintMasks"])
        {
          id v33 = [v28 objectForKeyedSubscript:@"maskIdentifiers"];
          long long v34 = [v76 maskSources];
          if (!v34)
          {
            id v41 = v83;
LABEL_39:

            uint64_t v21 = v80;
            goto LABEL_40;
          }
          id v35 = [MEMORY[0x1E4F1CAD0] setWithArray:v33];
          uint64_t v36 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v37 = PFMap();
          __int16 v38 = [v36 setWithArray:v37];

          id v81 = v35;
          int v39 = [v35 isEqualToSet:v38];
          id v17 = v77;
          if (!v39)
          {
            id *v68 = [MEMORY[0x1E4F7A438] mismatchError:@"Sidecar mask sources do not match serialized mask identifiers" object:v81];

            id v15 = v69;
            id v18 = v78;
            BOOL v16 = v79;
            goto LABEL_56;
          }
          uint64_t v40 = [v27 objectForKeyedSubscript:@"compositionName"];
          [v77 setObject:v34 forKeyedSubscript:v40];

          id v18 = v78;
          uint64_t v20 = v75;
          id v41 = v83;
LABEL_38:

          BOOL v16 = v79;
          goto LABEL_39;
        }
        v72 = v29;
        id v42 = +[PIPhotoEditHelper newAdjustmentWithName:v32];
        v43 = [v23 objectForKeyedSubscript:@"enabled"];
        [v42 setObject:v43 forKeyedSubscript:@"enabled"];

        id v44 = [v23 objectForKeyedSubscript:@"auto"];
        if (v44) {
          uint64_t v45 = MEMORY[0x1E4F1CC38];
        }
        else {
          uint64_t v45 = 0;
        }
        [v42 setObject:v45 forKeyedSubscript:@"auto"];

        uint64_t v46 = [v28 objectForKeyedSubscript:@"inputKeys"];
        v47 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"identifierName", @"compositionName", @"custom", @"customSerialization", @"customIdentifierName", @"customCompositionName", @"omitIfDisabled", @"auto", 0);
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __123__PICompositionSerializer_deserializeCompositionFromAdjustments_metadata_formatIdentifier_formatVersion_sidecarData_error___block_invoke_2;
        v84[3] = &unk_1E5D7EEA0;
        id v81 = v47;
        id v85 = v81;
        id v48 = v42;
        id v49 = v28;
        id v33 = v48;
        id v86 = v48;
        id v50 = v49;
        id v87 = v50;
        id v73 = v46;
        id v88 = v73;
        [v27 enumerateKeysAndObjectsUsingBlock:v84];
        uint64_t v51 = [v27 objectForKeyedSubscript:@"custom"];
        uint64_t v52 = (void *)v51;
        if (v51) {
          (*(void (**)(uint64_t, void *, id))(v51 + 16))(v51, v23, v33);
        }
        uint64_t v53 = [v27 objectForKeyedSubscript:@"customCompositionName"];
        uint64_t v54 = (void *)v53;
        if (v53) {
          (*(void (**)(uint64_t, id, id))(v53 + 16))(v53, v50, v33);
        }
        else {
        v55 = [v27 objectForKeyedSubscript:@"compositionName"];
        }
        v74 = v32;
        v56 = [v33 objectForKeyedSubscript:@"enabled"];
        if ([v56 BOOLValue])
        {

          id v41 = v83;
        }
        else
        {
          uint64_t v57 = [v27 objectForKeyedSubscript:@"omitIfDisabled"];
          char v58 = [v57 BOOLValue];

          uint64_t v29 = v72;
          id v41 = v83;
          if (v58)
          {
LABEL_37:

            __int16 v38 = v85;
            id v18 = v78;
            id v32 = v74;
            uint64_t v20 = v75;
            long long v34 = v73;
            goto LABEL_38;
          }
        }
        [v77 setObject:v33 forKeyedSubscript:v55];
        goto LABEL_37;
      }
LABEL_40:
      ++v22;
    }
    while (v20 != v22);
    uint64_t v20 = [v18 countByEnumeratingWithState:&v89 objects:v93 count:16];
    a8 = v68;
    id v15 = v69;
    id v17 = v77;
    if (v20) {
      continue;
    }
    break;
  }
LABEL_42:

  v59 = [v17 objectForKeyedSubscript:@"orientation"];

  if (!v59)
  {
    v60 = [v15 objectForKeyedSubscript:@"orientation"];
    if ([v60 integerValue])
    {
      v61 = (void *)[objc_alloc(MEMORY[0x1E4F7A4C0]) initWithName:@"Orientation"];
      v62 = (void *)[objc_alloc(MEMORY[0x1E4F7A488]) initWithIdentifier:v61];
      [v62 setObject:v60 forKeyedSubscript:@"value"];
      [v17 setObject:v62 forKeyedSubscript:@"orientation"];

      id v18 = v78;
      BOOL v16 = v79;
    }
  }
  [a1 _sanitizeComposition:v17];
  if ([a1 validateCompositionWithMissingSource:v17 error:a8]) {
    id v63 = v17;
  }
  else {
LABEL_57:
  }
    id v63 = 0;

  return v63;
}

void __123__PICompositionSerializer_deserializeCompositionFromAdjustments_metadata_formatIdentifier_formatVersion_sidecarData_error___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([a1[4] containsObject:v8] & 1) == 0)
  {
    id v6 = [a1[5] objectForKeyedSubscript:v5];

    if (!v6)
    {
      uint64_t v7 = [a1[6] objectForKeyedSubscript:v8];
      if (v7
        || ([a1[7] objectForKeyedSubscript:v8],
            (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [a1[5] setObject:v7 forKeyedSubscript:v5];
      }
    }
  }
}

uint64_t __123__PICompositionSerializer_deserializeCompositionFromAdjustments_metadata_formatIdentifier_formatVersion_sidecarData_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 maskIdentifier];
}

+ (id)deserializeCompositionFromAdjustments:(id)a3 metadata:(id)a4 formatIdentifier:(id)a5 formatVersion:(id)a6 error:(id *)a7
{
  return (id)[a1 deserializeCompositionFromAdjustments:a3 metadata:a4 formatIdentifier:a5 formatVersion:a6 sidecarData:0 error:a7];
}

+ (BOOL)validateCompositionWithMissingSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"source"];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F7A6A0]);
    [v7 setAssetIdentifier:@"dummy"];
    [v5 setObject:v7 forKeyedSubscript:@"source"];
  }
  id v8 = [v5 schema];
  char v9 = [v8 validateComposition:v5 error:a4];

  if (!v6) {
    [v5 setObject:0 forKeyedSubscript:@"source"];
  }

  return v9;
}

+ (id)deserializeCompositionFromData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 sidecarData:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!a7)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PICompositionSerializer.m", 82, @"Invalid parameter not satisfying: %@", @"error != NULL" object file lineNumber description];
  }
  id v17 = [a1 deserializeDictionaryFromData:v13 error:a7];
  if (v17 && [a1 validateAdjustmentsEnvelope:v17 error:a7])
  {
    id v18 = [v17 objectForKeyedSubscript:@"adjustments"];
    uint64_t v19 = [v17 objectForKeyedSubscript:@"metadata"];
    uint64_t v20 = [a1 deserializeCompositionFromAdjustments:v18 metadata:v19 formatIdentifier:v14 formatVersion:v15 sidecarData:v16 error:a7];
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

+ (id)deserializeCompositionFromData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 error:(id *)a6
{
  return (id)[a1 deserializeCompositionFromData:a3 formatIdentifier:a4 formatVersion:a5 sidecarData:0 error:a6];
}

+ (BOOL)canInterpretDataWithFormatIdentifier:(id)a3 formatVersion:(id)a4
{
  id v5 = a4;
  if ([(id)__s_allowedIdentifiers containsObject:a3]) {
    char v6 = [(id)__s_allowedVersions containsObject:v5];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (void)disableApertureEffects:(BOOL)a3
{
  sDisableApertureEffects = a3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.photo", 0);
    v3 = (void *)__s_allowedIdentifiers;
    __s_allowedIdentifiers = v2;

    v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v7 = +[PICompositionSerializerFormatVersion locallySupportedFormatVersions];
    uint64_t v5 = [v4 setWithArray:v7];
    char v6 = (void *)__s_allowedVersions;
    __s_allowedVersions = v5;
  }
}

@end