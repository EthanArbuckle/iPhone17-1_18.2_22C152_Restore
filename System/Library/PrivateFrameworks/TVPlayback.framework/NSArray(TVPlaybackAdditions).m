@interface NSArray(TVPlaybackAdditions)
- (id)tvp_arrayByMappingObjectsUsingBlock:()TVPlaybackAdditions;
- (id)tvp_objectsPassingTest:()TVPlaybackAdditions;
- (id)tvp_randomizedArray;
- (uint64_t)tvp_shallowIsEqualToArray:()TVPlaybackAdditions;
@end

@implementation NSArray(TVPlaybackAdditions)

- (id)tvp_randomizedArray
{
  uint64_t v2 = [a1 count];
  if (v2)
  {
    unsigned int v3 = v2;
    v4 = [MEMORY[0x263EFF980] arrayWithArray:a1];
    if (v4)
    {
      uint64_t v5 = v3 - 1;
      if (v3 != 1)
      {
        do
        {
          if (ATVGetUpTimeMicros_onceToken != -1) {
            dispatch_once(&ATVGetUpTimeMicros_onceToken, &__block_literal_global_15);
          }
          unint64_t v6 = (unint64_t)(*(double *)&ATVGetUpTimeMicros_sTimerToMicrosMultiplier * (double)mach_absolute_time());
          uint64_t v7 = (arc4random() + v6) % v3;
          v8 = [v4 objectAtIndex:v7];
          v9 = [v4 objectAtIndex:v5];
          [v4 replaceObjectAtIndex:v7 withObject:v9];
          [v4 replaceObjectAtIndex:v5 withObject:v8];

          --v3;
          --v5;
        }
        while (v5);
      }
      v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = [MEMORY[0x263EFF8C0] array];
  }
  return v10;
}

- (id)tvp_arrayByMappingObjectsUsingBlock:()TVPlaybackAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __68__NSArray_TVPlaybackAdditions__tvp_arrayByMappingObjectsUsingBlock___block_invoke;
  v13 = &unk_264CC66D8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v4;
  id v7 = v5;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v7, v10, v11, v12, v13);

  return v8;
}

- (id)tvp_objectsPassingTest:()TVPlaybackAdditions
{
  uint64_t v2 = objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  unsigned int v3 = [a1 objectsAtIndexes:v2];

  return v3;
}

- (uint64_t)tvp_shallowIsEqualToArray:()TVPlaybackAdditions
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 == a1)
  {
    uint64_t v17 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_14;
    }
    id v6 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"*** %s: array argument is not an NSArray", "-[NSArray(TVPlaybackAdditions) tvp_shallowIsEqualToArray:]");
      id v19 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v19);
    }
    uint64_t v8 = [v5 count];
    if (v8 == [a1 count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = a1;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = 0;
        uint64_t v13 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v9);
            }
            id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            v16 = [v5 objectAtIndex:v12 + i];

            if (v15 != v16)
            {
              uint64_t v17 = 0;
              goto LABEL_17;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
          v12 += i;
          if (v11) {
            continue;
          }
          break;
        }
      }
      uint64_t v17 = 1;
LABEL_17:
    }
    else
    {
LABEL_14:
      uint64_t v17 = 0;
    }
  }

  return v17;
}

@end