@interface VUIDebugMetricsEventValidator
+ (id)removeGladiatorPrefix:(id)a3;
+ (id)validationResults:(id)a3 fromIndex:(unint64_t)a4;
+ (void)validateEvents:(id)a3 forRuleset:(id)a4 withCompletion:(id)a5;
@end

@implementation VUIDebugMetricsEventValidator

+ (void)validateEvents:(id)a3 forRuleset:(id)a4 withCompletion:(id)a5
{
  v66[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v53 = a5;
  int v9 = [v8 hasPrefix:@"com.apple.amp.ae.validator.manifest"];
  id v10 = objc_alloc(MEMORY[0x1E4F1CB10]);
  v11 = [@"https://ae-validator-service.amp.apple.com" stringByAppendingString:@"/v1/validate"];
  v12 = (void *)[v10 initWithString:v11];

  id v13 = objc_alloc_init(MEMORY[0x1E4F28E88]);
  [v13 setHTTPMethod:@"POST"];
  [v13 addValue:@"application/json" forHTTPHeaderField:@"accept"];
  objc_msgSend(NSString, "stringWithFormat:", @"multipart/form-data; boundary=%@",
  v51 = @"----------V2ymHFg03ehbqgZCaKO6jy");
  objc_msgSend(v13, "setValue:forHTTPHeaderField:");
  v52 = v13;
  [v13 setURL:v12];
  v14 = (void *)MEMORY[0x1E4F28D90];
  v65[0] = @"events";
  v65[1] = @"postTime";
  v66[0] = v7;
  v15 = (void *)MEMORY[0x1E4F28ED0];
  v16 = [MEMORY[0x1E4F1C9C8] date];
  [v16 timeIntervalSince1970];
  v18 = [v15 numberWithLong:(uint64_t)v17];
  v66[1] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
  id v63 = 0;
  v20 = [v14 dataWithJSONObject:v19 options:1 error:&v63];
  id v21 = v63;

  if (v20)
  {
    id v48 = v21;
    v49 = v12;
    v22 = (void *)[[NSString alloc] initWithData:v20 encoding:4];
    NSLog(&cfstr_JsonStringForG.isa, v22);

    v23 = [MEMORY[0x1E4F1CA58] data];
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v25 = @"ruleset";
    if (v9) {
      v25 = @"manifest";
    }
    id v50 = v8;
    v47 = v25;
    objc_msgSend(v24, "setObject:forKey:", v8);
    v55 = v20;
    [v24 setObject:v20 forKey:@"figarojson"];
    [v24 setObject:@"false" forKey:@"singleResult"];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v54 = v24;
    id obj = [v24 allKeys];
    uint64_t v26 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v60 != v28) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          v31 = [NSString stringWithFormat:@"--%@\r\n", @"----------V2ymHFg03ehbqgZCaKO6jy"];
          v32 = [v31 dataUsingEncoding:4];
          [v23 appendData:v32];

          objc_msgSend(NSString, "stringWithFormat:", @"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",
          v33 = v30);
          v34 = [v33 dataUsingEncoding:4];
          [v23 appendData:v34];

          if ([v30 isEqualToString:@"figarojson"])
          {
            [v23 appendData:v55];
          }
          else
          {
            v35 = NSString;
            v36 = [v54 objectForKey:v30];
            v37 = [v35 stringWithFormat:@"%@\r\n", v36];
            v38 = [v37 dataUsingEncoding:4];
            [v23 appendData:v38];
          }
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v27);
    }

    v39 = [NSString stringWithFormat:@"\r\n--%@--\r\n", @"----------V2ymHFg03ehbqgZCaKO6jy"];
    v40 = [v39 dataUsingEncoding:4];
    [v23 appendData:v40];

    v41 = v52;
    [v52 setHTTPBody:v23];
    v42 = (void *)MEMORY[0x1E4F290E0];
    v43 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    v44 = [v42 sessionWithConfiguration:v43];

    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __74__VUIDebugMetricsEventValidator_validateEvents_forRuleset_withCompletion___block_invoke;
    v57[3] = &unk_1E6DF4830;
    v45 = v53;
    id v58 = v53;
    v46 = [v44 dataTaskWithRequest:v52 completionHandler:v57];
    [v46 resume];

    id v8 = v50;
    id v21 = v48;
    v12 = v49;
    v20 = v55;
  }
  else
  {
    NSLog(&cfstr_Nsjsonserializ.isa, v21);
    v41 = v52;
    v45 = v53;
  }
}

void __74__VUIDebugMetricsEventValidator_validateEvents_forRuleset_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    id v9 = [a4 userInfo];
    v4 = [v9 description];
    NSLog(&cfstr_ErrorInGladiat.isa, v4);
  }
  else
  {
    id v10 = 0;
    v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a2 options:0 error:&v10];
    id v7 = v10;
    id v8 = v7;
    if (v7) {
      NSLog(&cfstr_ErrorParsingGl.isa, v7);
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

+ (id)validationResults:(id)a3 fromIndex:(unint64_t)a4
{
  v80[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1CA60];
  v79[0] = @"failedRulesets";
  id v7 = [MEMORY[0x1E4F1CA48] array];
  v80[0] = v7;
  v79[1] = @"passedRulesets";
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v80[1] = v8;
  v79[2] = @"filteredRulesets";
  id v9 = [MEMORY[0x1E4F1CA48] array];
  v80[2] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];
  v46 = [v6 dictionaryWithDictionary:v10];

  unint64_t v11 = 0x1E4F1C000uLL;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v12 = v5;
  uint64_t v47 = [v12 countByEnumeratingWithState:&v61 objects:v78 count:16];
  if (v47)
  {
    id v13 = @"ruleResults";
    uint64_t v44 = *(void *)v62;
    v45 = v12;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v62 != v44) {
          objc_enumerationMutation(v12);
        }
        uint64_t v49 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        v15 = objc_msgSend(v12, "valueForKey:");
        v16 = [v15 valueForKey:v13];

        double v17 = [MEMORY[0x1E4F1CA48] array];
        v51 = [MEMORY[0x1E4F1CA48] array];
        id v50 = [MEMORY[0x1E4F1CA48] array];
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v18 = v16;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:v77 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          id v53 = v17;
          id obj = v18;
          uint64_t v48 = i;
          uint64_t v52 = 0;
          uint64_t v55 = *(void *)v58;
          uint64_t v56 = 0;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v58 != v55) {
                objc_enumerationMutation(obj);
              }
              v22 = *(void **)(*((void *)&v57 + 1) + 8 * j);
              v23 = [v22 valueForKey:@"ruleLabel"];
              id v24 = [v22 valueForKey:v13];
              v25 = [v24 objectAtIndexedSubscript:a4];
              if ([v25 isEqualToString:@"OK"])
              {
                v75 = @"ruleLabel";
                v76 = v23;
                uint64_t v26 = [*(id *)(v11 + 2536) dictionaryWithObjects:&v76 forKeys:&v75 count:1];
                [v53 addObject:v26];

                ++v56;
              }
              else if ([v25 isEqualToString:@"FILTERED"])
              {
                v73 = @"ruleLabel";
                v74 = v23;
                uint64_t v27 = [*(id *)(v11 + 2536) dictionaryWithObjects:&v74 forKeys:&v73 count:1];
                [v51 addObject:v27];
              }
              else
              {
                v71[0] = @"ruleLabel";
                v71[1] = @"ruleResult";
                v72[0] = v23;
                v72[1] = v25;
                v71[2] = @"onFailMapList";
                uint64_t v28 = objc_msgSend(v22, "valueForKey:");
                v72[2] = v28;
                [*(id *)(v11 + 2536) dictionaryWithObjects:v72 forKeys:v71 count:3];
                v29 = v13;
                unint64_t v30 = v11;
                v32 = unint64_t v31 = a4;
                [v50 addObject:v32];

                a4 = v31;
                unint64_t v11 = v30;
                id v13 = v29;

                ++v52;
              }
            }
            uint64_t v20 = [obj countByEnumeratingWithState:&v57 objects:v77 count:16];
          }
          while (v20);
          v33 = obj;

          if (v52)
          {
            v34 = [v46 valueForKey:@"failedRulesets"];
            v69[0] = @"ruleset";
            v69[1] = @"failedRules";
            v35 = v50;
            v70[0] = v49;
            v70[1] = v50;
            v69[2] = @"passedRules";
            v69[3] = @"filteredRules";
            double v17 = v53;
            v36 = v51;
            v70[2] = v53;
            v70[3] = v51;
            v37 = [*(id *)(v11 + 2536) dictionaryWithObjects:v70 forKeys:v69 count:4];
            [v34 addObject:v37];
            uint64_t i = v48;
            goto LABEL_25;
          }
          uint64_t i = v48;
          double v17 = v53;
          v35 = v50;
          v36 = v51;
          if (v56)
          {
            v34 = [v46 valueForKey:@"passedRulesets"];
            v65[0] = @"ruleset";
            v65[1] = @"failedRules";
            v66[0] = v49;
            v66[1] = v50;
            void v65[2] = @"passedRules";
            v65[3] = @"filteredRules";
            v66[2] = v53;
            v66[3] = v51;
            v38 = *(void **)(v11 + 2536);
            v39 = v66;
            v40 = v65;
            uint64_t v41 = 4;
            goto LABEL_24;
          }
        }
        else
        {

          v35 = v50;
          v36 = v51;
          v33 = v18;
        }
        v34 = [v46 valueForKey:@"filteredRulesets"];
        v67[0] = @"ruleset";
        v67[1] = @"failedRules";
        v68[0] = v49;
        v68[1] = v35;
        v67[2] = @"filteredRules";
        v68[2] = v36;
        v38 = *(void **)(v11 + 2536);
        v39 = v68;
        v40 = v67;
        uint64_t v41 = 3;
LABEL_24:
        v37 = [v38 dictionaryWithObjects:v39 forKeys:v40 count:v41];
        [v34 addObject:v37];
LABEL_25:

        id v12 = v45;
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v61 objects:v78 count:16];
    }
    while (v47);
  }

  v42 = (void *)[v46 copy];
  return v42;
}

+ (id)removeGladiatorPrefix:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"com.apple.amp.metrics.validator."];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v3;
  }
  else
  {
    objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v4, v5, &stru_1F3E921E0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;

  return v7;
}

@end