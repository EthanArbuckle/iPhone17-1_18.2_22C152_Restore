@interface RTRuntime
+ (double)footprint;
+ (id)classesFromImages:(id)a3;
+ (id)directSubclassesOfClass:(Class)a3 images:(id)a4 includeParentClass:(BOOL)a5;
+ (id)objToDictionary:(id)a3 filterProperties:(id)a4;
+ (id)objToString:(id)a3 filterProperties:(id)a4;
+ (id)routineClassStrings;
+ (id)routineClasses;
+ (id)routineImageNames;
+ (id)routineSubclassesOfClass:(Class)a3;
+ (id)subclassesOfClass:(Class)a3 images:(id)a4 includeParentClass:(BOOL)a5;
@end

@implementation RTRuntime

+ (id)subclassesOfClass:(Class)a3 images:(id)a4 includeParentClass:(BOOL)a5
{
  v6 = (void *)MEMORY[0x1E4F28F60];
  if (a5)
  {
    v7 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v8 = __57__RTRuntime_subclassesOfClass_images_includeParentClass___block_invoke;
  }
  else
  {
    v7 = v14;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v8 = __57__RTRuntime_subclassesOfClass_images_includeParentClass___block_invoke_2;
  }
  v7[2] = v8;
  v7[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16lu32l8;
  v7[4] = a3;
  id v9 = a4;
  v10 = [v6 predicateWithBlock:v7];
  v11 = [a1 classesFromImages:v9];

  v12 = [v11 filteredArrayUsingPredicate:v10];

  return v12;
}

uint64_t __57__RTRuntime_subclassesOfClass_images_includeParentClass___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSubclassOfClass:*(void *)(a1 + 32)];
}

BOOL __57__RTRuntime_subclassesOfClass_images_includeParentClass___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSubclassOfClass:*(void *)(a1 + 32)]) {
    BOOL v4 = *(void *)(a1 + 32) != (void)v3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)directSubclassesOfClass:(Class)a3 images:(id)a4 includeParentClass:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v6 = [a1 subclassesOfClass:a3 images:a4 includeParentClass:a5];
  v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(objc_class **)(*((void *)&v15 + 1) + 8 * i);
        if (class_getSuperclass(v13) == a3) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)classesFromImages:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  unsigned int outCount = 0;
  v5 = objc_copyImageNames(&outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      v7 = [NSString stringWithUTF8String:v5[i]];
      id v8 = [v7 lastPathComponent];

      if ([v3 containsObject:v8])
      {
        unsigned int v16 = 0;
        uint64_t v9 = objc_copyClassNamesForImage(v5[i], &v16);
        if (v16)
        {
          for (unint64_t j = 0; j < v16; ++j)
          {
            uint64_t v11 = [NSString stringWithUTF8String:v9[j]];
            v12 = v11;
            if (v11)
            {
              Class v13 = NSClassFromString(v11);
              if (v13) {
                [v4 addObject:v13];
              }
            }
          }
        }
        free(v9);
      }
    }
  }
  free(v5);
  v14 = [v4 allObjects];

  return v14;
}

+ (id)objToString:(id)a3 filterProperties:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  unsigned int outCount = 0;
  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = class_copyPropertyList(v8, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Name = property_getName(v9[i]);
      if (Name)
      {
        v12 = [NSString stringWithUTF8String:Name];
        Class v13 = [v5 valueForKey:v12];
        [v7 setObject:v13 forKeyedSubscript:v12];
      }
    }
  }
  free(v9);
  v14 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v15 = [v7 allKeys];
  unsigned int v16 = [v15 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        if (([v6 containsObject:v21] & 1) == 0)
        {
          [v14 addObject:v21];
          v22 = [v7 objectForKeyedSubscript:v21];
          [v14 addObject:v22];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v18);
  }

  v23 = [v14 componentsJoinedByString:@", "];

  return v23;
}

+ (id)objToDictionary:(id)a3 filterProperties:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  unsigned int outCount = 0;
  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = class_copyPropertyList(v8, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Name = property_getName(v9[i]);
      if (Name)
      {
        v12 = [NSString stringWithUTF8String:Name];
        Class v13 = [v5 valueForKey:v12];
        [v7 setObject:v13 forKeyedSubscript:v12];
      }
    }
  }
  free(v9);
  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v15 = [v7 allKeys];
  unsigned int v16 = [v15 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        if (([v6 containsObject:v21] & 1) == 0)
        {
          v22 = [v7 objectForKeyedSubscript:v21];
          [v14 setObject:v22 forKeyedSubscript:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v18);
  }

  return v14;
}

+ (id)routineImageNames
{
  return &unk_1F3452D30;
}

+ (id)routineClassStrings
{
  unsigned int outCount = 0;
  id v3 = objc_copyImageNames(&outCount);
  BOOL v4 = objc_opt_new();
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      id v6 = [NSString stringWithUTF8String:v3[i]];
      v7 = [v6 lastPathComponent];

      id v8 = [a1 routineImageNames];
      int v9 = [v8 containsObject:v7];

      if (v9)
      {
        unsigned int v15 = 0;
        uint64_t v10 = objc_copyClassNamesForImage(v3[i], &v15);
        if (v15)
        {
          for (unint64_t j = 0; j < v15; ++j)
          {
            v12 = [NSString stringWithUTF8String:v10[j]];
            if (v12) {
              [v4 addObject:v12];
            }
          }
        }
        free(v10);
      }
    }
  }
  free(v3);
  Class v13 = [v4 allObjects];

  return v13;
}

+ (id)routineSubclassesOfClass:(Class)a3
{
  BOOL v4 = [a1 routineImageNames];
  id v5 = +[RTRuntime subclassesOfClass:a3 images:v4 includeParentClass:1];

  return v5;
}

+ (id)routineClasses
{
  v2 = [a1 routineImageNames];
  id v3 = +[RTRuntime classesFromImages:v2];

  return v3;
}

+ (double)footprint
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  memset(v5, 0, sizeof(v5));
  pid_t v2 = getpid();
  int v3 = proc_pid_rusage(v2, 4, (rusage_info_t *)v5);
  double result = (double)*((unint64_t *)&v6 + 1) * 0.0009765625 * 0.0009765625;
  if (v3) {
    return 0.0;
  }
  return result;
}

@end