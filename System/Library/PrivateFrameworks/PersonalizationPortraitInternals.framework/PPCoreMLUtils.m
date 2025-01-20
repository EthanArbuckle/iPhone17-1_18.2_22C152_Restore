@interface PPCoreMLUtils
+ (id)_multiArrayForNumberArray:(uint64_t)a1;
+ (id)flattenFeatureProviderArray:(id)a3;
+ (id)flattenMultiArray:(id)a3;
+ (id)multiArrayFeatureValueForNumber:(id)a3;
+ (id)multiArrayForArray:(id)a3;
+ (id)scoringContextWithError:(id *)a3;
@end

@implementation PPCoreMLUtils

+ (id)scoringContextWithError:(id *)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1CB79D060](a1, a2);
  v5 = NSNumber;
  v6 = objc_opt_new();
  [v6 timeIntervalSince1970];
  v7 = objc_msgSend(v5, "numberWithDouble:");
  v15[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v9 = +[PPCoreMLUtils multiArrayForArray:v8];

  v10 = (void *)MEMORY[0x1CB79D060]();
  v11 = objc_opt_new();
  if (v9)
  {
    v12 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v9];
    [v11 setObject:v12 forKeyedSubscript:@"scoringDate"];
  }
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1E930]) initWithDictionary:v11 error:a3];

  return v13;
}

+ (id)multiArrayFeatureValueForNumber:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1CB79D060]();
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = [a1 multiArrayForArray:v6];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)multiArrayForArray:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v17[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v14 = 0;
  v7 = (void *)[v4 initWithShape:v6 dataType:65600 error:&v14];
  id v8 = v14;

  if (v7)
  {
    if ([v3 count])
    {
      unint64_t v9 = 0;
      do
      {
        v10 = [v3 objectAtIndexedSubscript:v9];
        [v7 setObject:v10 atIndexedSubscript:v9];

        ++v9;
      }
      while ([v3 count] > v9);
    }
    id v11 = v7;
  }
  else
  {
    v12 = pp_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPCoreMLUtils: Unable to load array to MLMultiArray: %@", buf, 0xCu);
    }
  }
  return v7;
}

+ (id)flattenMultiArray:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    if ([v3 count])
    {
      unint64_t v5 = 0;
      do
      {
        v6 = NSNumber;
        v7 = [v3 objectAtIndexedSubscript:v5];
        [v7 floatValue];
        id v8 = objc_msgSend(v6, "numberWithFloat:");
        [v4 addObject:v8];

        ++v5;
      }
      while (v5 < [v3 count]);
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

+ (id)flattenFeatureProviderArray:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    SEL v58 = a2;
    unint64_t v5 = [v4 firstObject];
    v6 = [v5 featureNames];

    v7 = objc_opt_new();
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    obuint64_t j = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v75 objects:v86 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v76;
      uint64_t v60 = *(void *)v76;
      v61 = v7;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v76 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v75 + 1) + 8 * v11);
          v13 = [v4 firstObject];
          id v14 = [v13 featureValueForName:v12];
          uint64_t v15 = [v14 type];

          switch(v15)
          {
            case 1:
              v74[0] = MEMORY[0x1E4F143A8];
              v74[1] = 3221225472;
              v74[2] = __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke;
              v74[3] = &unk_1E65DC0D8;
              v74[4] = v12;
              id v16 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v74);
              v17 = (void *)MEMORY[0x1E4F1E950];
              v18 = +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)a1, v16);
              uint64_t v19 = [v17 featureValueWithMultiArray:v18];
              goto LABEL_10;
            case 2:
              id v22 = objc_alloc(MEMORY[0x1E4F1E9A8]);
              v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
              v85 = v23;
              v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
              v25 = (void *)[v22 initWithShape:v24 dataType:65568 error:0];

              if ([v4 count])
              {
                unint64_t v26 = 0;
                do
                {
                  v27 = NSNumber;
                  v28 = [v4 objectAtIndexedSubscript:v26];
                  v29 = [v28 featureValueForName:v12];
                  [v29 doubleValue];
                  v30 = objc_msgSend(v27, "numberWithDouble:");
                  [v25 setObject:v30 atIndexedSubscript:v26];

                  ++v26;
                }
                while (v26 < [v4 count]);
              }
              v7 = v61;
              if (!v25)
              {
                v55 = [MEMORY[0x1E4F28B00] currentHandler];
                [v55 handleFailureInMethod:v58 object:a1 file:@"PPCoreMLUtils.m" lineNumber:85 description:@"PPCoreMLUtils: was unable to allocate feature array"];
              }
              v31 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v25];
              [v61 setObject:v31 forKeyedSubscript:v12];

              goto LABEL_38;
            case 3:
              v73[0] = MEMORY[0x1E4F143A8];
              v73[1] = 3221225472;
              v73[2] = __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke_2;
              v73[3] = &unk_1E65DC0D8;
              v73[4] = v12;
              id v16 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v73);
              v20 = (void *)MEMORY[0x1E4F1E950];
              v18 = [MEMORY[0x1E4F1E9F0] sequenceWithStringArray:v16];
              uint64_t v19 = [v20 featureValueWithSequence:v18];
LABEL_10:
              v21 = (void *)v19;
              [v7 setObject:v19 forKeyedSubscript:v12];

              break;
            case 7:
              v32 = [v4 firstObject];
              v33 = [v32 featureValueForName:v12];
              v34 = [v33 sequenceValue];
              v35 = [v34 int64Values];
              uint64_t v36 = [v35 count];

              if (v36)
              {
                v72[0] = MEMORY[0x1E4F143A8];
                v72[1] = 3221225472;
                v72[2] = __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke_3;
                v72[3] = &unk_1E65DC0D8;
                v72[4] = v12;
                v37 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v72);
                v38 = objc_opt_new();
                long long v68 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                long long v71 = 0u;
                id v39 = v37;
                uint64_t v40 = [v39 countByEnumeratingWithState:&v68 objects:v84 count:16];
                if (v40)
                {
                  uint64_t v41 = v40;
                  uint64_t v42 = *(void *)v69;
                  do
                  {
                    for (uint64_t i = 0; i != v41; ++i)
                    {
                      if (*(void *)v69 != v42) {
                        objc_enumerationMutation(v39);
                      }
                      [v38 addObjectsFromArray:*(void *)(*((void *)&v68 + 1) + 8 * i)];
                    }
                    uint64_t v41 = [v39 countByEnumeratingWithState:&v68 objects:v84 count:16];
                  }
                  while (v41);
                }

                v44 = (void *)MEMORY[0x1E4F1E950];
                v45 = +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)PPCoreMLUtils, v38);
                uint64_t v46 = [v44 featureValueWithMultiArray:v45];
              }
              else
              {
                v67[0] = MEMORY[0x1E4F143A8];
                v67[1] = 3221225472;
                v67[2] = __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke_4;
                v67[3] = &unk_1E65DC0D8;
                v67[4] = v12;
                v48 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v67);
                v38 = objc_opt_new();
                long long v63 = 0u;
                long long v64 = 0u;
                long long v65 = 0u;
                long long v66 = 0u;
                id v39 = v48;
                uint64_t v49 = [v39 countByEnumeratingWithState:&v63 objects:v83 count:16];
                if (v49)
                {
                  uint64_t v50 = v49;
                  uint64_t v51 = *(void *)v64;
                  do
                  {
                    for (uint64_t j = 0; j != v50; ++j)
                    {
                      if (*(void *)v64 != v51) {
                        objc_enumerationMutation(v39);
                      }
                      [v38 addObjectsFromArray:*(void *)(*((void *)&v63 + 1) + 8 * j)];
                    }
                    uint64_t v50 = [v39 countByEnumeratingWithState:&v63 objects:v83 count:16];
                  }
                  while (v50);
                }

                v53 = (void *)MEMORY[0x1E4F1E950];
                v45 = [MEMORY[0x1E4F1E9F0] sequenceWithStringArray:v38];
                uint64_t v46 = [v53 featureValueWithSequence:v45];
              }
              v54 = (void *)v46;
              v7 = v61;
              [v61 setObject:v46 forKeyedSubscript:v12];

LABEL_38:
              uint64_t v10 = v60;
              break;
            default:
              v47 = pp_default_log_handle();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 134218242;
                uint64_t v80 = v15;
                __int16 v81 = 2112;
                uint64_t v82 = v12;
                _os_log_fault_impl(&dword_1CA9A8000, v47, OS_LOG_TYPE_FAULT, "PPCoreMLUtilities: Tried to flatten a feature of type %ld, which is not supported. Feature: %@", buf, 0x16u);
              }

              break;
          }
          ++v11;
        }
        while (v11 != v9);
        uint64_t v9 = [obj countByEnumeratingWithState:&v75 objects:v86 count:16];
      }
      while (v9);
    }

    v56 = (void *)[objc_alloc(MEMORY[0x1E4F1E930]) initWithDictionary:v7 error:0];
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

id __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  id v3 = [a2 featureValueForName:*(void *)(a1 + 32)];
  id v4 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "int64Value"));

  return v4;
}

+ (id)_multiArrayForNumberArray:(uint64_t)a1
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v7 = (void *)[v4 initWithShape:v6 dataType:65568 error:0];

  if ([v2 count])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [v2 objectAtIndexedSubscript:v8];
      [v7 setObject:v9 atIndexedSubscript:v8];

      ++v8;
    }
    while (v8 < [v2 count]);
  }
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel__multiArrayForNumberArray_ object:v3 file:@"PPCoreMLUtils.m" lineNumber:53 description:@"PPCoreMLUtils: Unable to construct multiarray"];
  }
  return v7;
}

id __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 featureValueForName:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 stringValue];

  return v3;
}

id __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 featureValueForName:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 sequenceValue];
  id v4 = [v3 int64Values];

  return v4;
}

id __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 featureValueForName:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 sequenceValue];
  id v4 = [v3 stringValues];

  return v4;
}

@end