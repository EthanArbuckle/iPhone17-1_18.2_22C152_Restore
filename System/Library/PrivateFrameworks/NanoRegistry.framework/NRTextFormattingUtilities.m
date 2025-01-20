@interface NRTextFormattingUtilities
+ (id)dateFormatter:(id)a3;
+ (id)nameCounter:(id)a3;
+ (id)prefixLinesWithString:(id)a3 withText:(id)a4;
@end

@implementation NRTextFormattingUtilities

+ (id)prefixLinesWithString:(id)a3 withText:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  context = (void *)MEMORY[0x1A624A5B0]();
  v27 = v5;
  v8 = [v5 componentsSeparatedByString:@"\n"];
  v9 = [v6 stringByAppendingString:@" "];

  unint64_t v10 = (unint64_t)[v9 length] >> 3;
  v28 = v9;
  if (([v9 length] & 7) != 0) {
    uint64_t v11 = v10 + 1;
  }
  else {
    uint64_t v11 = 1;
  }
  v12 = [&stru_1EF6CAD80 stringByPaddingToLength:v11 withString:@"\t" startingAtIndex:0];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    char v17 = 1;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x1A624A5B0]();
        if ([v19 length])
        {
          if (v17) {
            v21 = v28;
          }
          else {
            v21 = v12;
          }
          v22 = [v21 stringByAppendingString:v19];
          v23 = [v22 stringByAppendingString:@"\n"];

          [v7 appendString:v23];
          char v17 = 0;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  if ([v7 length])
  {
    v24 = objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v7, "length") - 1);
    if (([v24 isEqualToString:@"\n"] & 1) == 0) {
      [v7 appendString:@"\n"];
    }
  }
  else
  {
    [v7 appendString:@"\n"];
  }

  return v7;
}

+ (id)dateFormatter:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__9;
  char v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  if (qword_1EB30BB28 != -1) {
    dispatch_once(&qword_1EB30BB28, &__block_literal_global_12);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v9 = __43__NRTextFormattingUtilities_dateFormatter___block_invoke_2;
  unint64_t v10 = &unk_1E5B00C68;
  v12 = &v13;
  id v4 = v3;
  id v11 = v4;
  id v5 = v8;
  os_unfair_lock_lock_with_options();
  v9((uint64_t)v5);

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_14);
  id v6 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v6;
}

uint64_t __43__NRTextFormattingUtilities_dateFormatter___block_invoke()
{
  _MergedGlobals_14 = 0;
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB30BB20;
  qword_1EB30BB20 = (uint64_t)v0;

  v2 = (void *)qword_1EB30BB20;

  return [v2 setDateFormat:@"MM-dd-yyyy HH:mm:ss.SSS"];
}

uint64_t __43__NRTextFormattingUtilities_dateFormatter___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)qword_1EB30BB20 stringFromDate:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

+ (id)nameCounter:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v20 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(id *)(*((void *)&v19 + 1) + 8 * v7);
      v9 = [v8 componentsSeparatedByString:@" "];
      unint64_t v10 = (void *)[v9 mutableCopy];

      id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 1);
      uint64_t v12 = [v11 integerValue];

      if (v12 < 1)
      {
        uint64_t v16 = [NSString stringWithFormat:@"%@ 1", v8];
      }
      else
      {
        uint64_t v13 = v12 + 1;
        uint64_t v14 = [v10 lastObject];
        [v10 removeObject:v14];

        uint64_t v15 = [v10 componentsJoinedByString:@" "];

        uint64_t v16 = [NSString stringWithFormat:@"%@ %ld", v15, v13, (void)v19];
        id v8 = (id)v15;
      }

      int v17 = [v3 containsObject:v16];
      if (!v17) {
        break;
      }

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    uint64_t v16 = @"unknown";
  }

  return v16;
}

@end