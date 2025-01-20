@interface NSArray(NPK)
- (id)npkComprehension:()NPK;
- (id)npkFindFirstObjectMatchingCondition:()NPK;
- (id)npkSafeObjectAtIndex:()NPK;
@end

@implementation NSArray(NPK)

- (id)npkFindFirstObjectMatchingCondition:()NPK
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__27;
  v15 = __Block_byref_object_dispose__27;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__NSArray_NPK__npkFindFirstObjectMatchingCondition___block_invoke;
  v8[3] = &unk_2644D9048;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)npkSafeObjectAtIndex:()NPK
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([a1 count] <= a3)
  {
    id v6 = pk_General_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      v8 = pk_General_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 134218498;
        unint64_t v11 = a3;
        __int16 v12 = 2112;
        uint64_t v13 = a1;
        __int16 v14 = 2048;
        uint64_t v15 = [a1 count];
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_ERROR, "Error: Tried to access invalid object at index %lu in array %@ with %lu elements", (uint8_t *)&v10, 0x20u);
      }
    }
    id v5 = 0;
  }
  else
  {
    id v5 = [a1 objectAtIndex:a3];
  }
  return v5;
}

- (id)npkComprehension:()NPK
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  __int16 v12 = __33__NSArray_NPK__npkComprehension___block_invoke;
  uint64_t v13 = &unk_2644D9070;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v6, v10, v11, v12, v13);

  return v8;
}

@end