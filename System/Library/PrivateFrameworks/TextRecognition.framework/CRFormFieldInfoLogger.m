@interface CRFormFieldInfoLogger
+ (id)parseLog:(id)a3;
+ (void)logFieldInfo:(id)a3;
@end

@implementation CRFormFieldInfoLogger

+ (id)parseLog:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [NSString alloc];
  v37 = v3;
  v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3];
  v6 = (void *)[v4 initWithData:v5 encoding:4];

  v36 = v6;
  v7 = [v6 componentsSeparatedByString:@"\n"];
  v8 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v42;
    uint64_t v39 = *(void *)v42;
    do
    {
      uint64_t v12 = 0;
      uint64_t v38 = v10;
      do
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
        if ([v13 hasPrefix:@"CTCDataField: "])
        {
          v14 = [v13 substringFromIndex:objc_msgSend(@"CTCDataField: ", "length")];
          v15 = [v14 dataUsingEncoding:4];

          v16 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v15 options:0 error:0];
          v17 = [v16 objectForKeyedSubscript:@"imagePath"];
          v18 = [v8 objectForKeyedSubscript:v17];

          if (!v18)
          {
            v47[0] = @"fields";
            v19 = (void *)MEMORY[0x1E4F1CBF0];
            v20 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
            v47[1] = @"textRegions";
            v48[0] = v20;
            v21 = (void *)[v19 mutableCopy];
            v48[1] = v21;
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
            v23 = (void *)[v22 mutableCopy];
            [v8 setObject:v23 forKeyedSubscript:v17];

            uint64_t v11 = v39;
          }
          v24 = [v16 objectForKeyedSubscript:@"imagePath"];
          v25 = [v8 objectForKeyedSubscript:v24];
          v26 = [v25 objectForKeyedSubscript:@"fields"];

          [v26 addObject:v16];
        }
        else
        {
          if (![v13 hasPrefix:@"CTCDataLabel: "]) {
            goto LABEL_15;
          }
          v27 = [v13 substringFromIndex:objc_msgSend(@"CTCDataLabel: ", "length")];
          v15 = [v27 dataUsingEncoding:4];

          v16 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v15 options:0 error:0];
          v17 = [v16 objectForKeyedSubscript:@"imagePath"];
          v28 = [v8 objectForKeyedSubscript:v17];

          if (!v28)
          {
            v45[0] = @"fields";
            v29 = (void *)MEMORY[0x1E4F1CBF0];
            v30 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
            v45[1] = @"textRegions";
            v46[0] = v30;
            v31 = (void *)[v29 mutableCopy];
            v46[1] = v31;
            v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
            v33 = (void *)[v32 mutableCopy];
            [v8 setObject:v33 forKeyedSubscript:v17];

            uint64_t v11 = v39;
          }
          v26 = [v16 objectForKeyedSubscript:@"textRegions"];
          v34 = [v8 objectForKeyedSubscript:v17];
          [v34 setObject:v26 forKeyedSubscript:@"textRegions"];

          uint64_t v10 = v38;
        }

LABEL_15:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v10);
  }

  return v8;
}

+ (void)logFieldInfo:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_MergedGlobals_32 != -1) {
    dispatch_once(&_MergedGlobals_32, &__block_literal_global_33);
  }
  uint64_t v4 = [v3 objectForKeyedSubscript:@"imagePath"];
  v5 = (void *)v4;
  v6 = &stru_1F38EED68;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v7 = v6;

  v8 = [v3 objectForKeyedSubscript:@"index"];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [v9 setValue:v7 forKey:@"imagePath"];
    uint64_t v10 = [v3 objectForKeyedSubscript:@"textContentType"];
    [v9 setValue:v10 forKey:@"reference"];

    uint64_t v11 = [v3 objectForKeyedSubscript:@"textContentType"];
    [v9 setValue:v11 forKey:@"predicted"];

    uint64_t v12 = [v3 objectForKeyedSubscript:@"text"];
    [v9 setValue:v12 forKey:@"text"];

    [v9 setValue:&stru_1F38EED68 forKey:@"keyword"];
    v13 = [v3 objectForKeyedSubscript:@"locale"];
    [v9 setValue:v13 forKey:@"locale"];

    [v9 setValue:&stru_1F38EED68 forKey:@"correctLabelText"];
    v14 = [v3 objectForKeyedSubscript:@"index"];
    [v9 setValue:v14 forKey:@"index"];

    v15 = [v3 objectForKeyedSubscript:@"matchedResult"];
    [v9 setValue:v15 forKey:@"matchedResult"];

    v16 = [v3 objectForKeyedSubscript:@"x"];
    [v9 setValue:v16 forKey:@"x"];

    v17 = [v3 objectForKeyedSubscript:@"y"];
    [v9 setValue:v17 forKey:@"y"];

    v18 = [v3 objectForKeyedSubscript:@"width"];
    [v9 setValue:v18 forKey:@"width"];

    v19 = [v3 objectForKeyedSubscript:@"height"];
    [v9 setValue:v19 forKey:@"height"];

    v20 = [v3 objectForKeyedSubscript:@"widthBounded"];
    [v9 setValue:v20 forKey:@"widthBounded"];

    v21 = [v3 objectForKeyedSubscript:@"heightBounded"];
    [v9 setValue:v21 forKey:@"heightBounded"];

    v22 = (const char *)[@"CTCDataField: " UTF8String];
    id v23 = [NSString alloc];
    v24 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:0];
    id v25 = (id) [v23 initWithData:v24 encoding:4];
    printf("%s%s\n", v22, (const char *)[v25 UTF8String]);
  }
  if (([(id)qword_1EB58CDE8 containsObject:v7] & 1) == 0)
  {
    [(id)qword_1EB58CDE8 addObject:v7];
    v32[0] = @"imagePath";
    v32[1] = @"textRegions";
    v33[0] = v7;
    v26 = objc_msgSend(v3, "objectForKeyedSubscript:");
    v33[1] = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

    v28 = (const char *)[@"CTCDataLabel: " UTF8String];
    id v29 = [NSString alloc];
    v30 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v27 options:0 error:0];
    id v31 = (id) [v29 initWithData:v30 encoding:4];
    printf("%s%s\n", v28, (const char *)[v31 UTF8String]);
  }
}

void __38__CRFormFieldInfoLogger_logFieldInfo___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EB58CDE8;
  qword_1EB58CDE8 = v0;
}

@end