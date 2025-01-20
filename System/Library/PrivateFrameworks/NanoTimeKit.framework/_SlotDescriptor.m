@interface _SlotDescriptor
+ (id)descriptorWithComplicationFamilies:(id)a3 complicationTypesRankedList:(id)a4 allowedComplicationTypes:(id)a5;
- (BOOL)allowsFamily:(int64_t)a3 inFace:(id)a4;
- (BOOL)allowsType:(unint64_t)a3 inFace:(id)a4;
- (BOOL)supportsFamiliesOfComplications:(id)a3 inFace:(id)a4;
- (BOOL)supportsType:(unint64_t)a3;
- (NSArray)familiesRankedList;
- (NSArray)typesRankedList;
- (NSIndexSet)possibleTypes;
- (void)enumerateAllowedFamiliesForFace:(id)a3 withBlock:(id)a4;
@end

@implementation _SlotDescriptor

+ (id)descriptorWithComplicationFamilies:(id)a3 complicationTypesRankedList:(id)a4 allowedComplicationTypes:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init((Class)a1);
  v12 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v26 = [*(id *)(*((void *)&v27 + 1) + 8 * i) integerValue];
        do
        {
          v18 = [NSNumber numberWithInteger:v26];
          [v12 addObject:v18];
        }
        while ((NTKFallbackComplicationFamilyForFamily(v26, &v26) & 1) != 0);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [v12 copy];
  v20 = (void *)v11[1];
  v11[1] = v19;

  uint64_t v21 = [v9 copy];
  v22 = (void *)v11[2];
  v11[2] = v21;

  uint64_t v23 = [v10 copy];
  v24 = (void *)v11[3];
  v11[3] = v23;

  return v11;
}

- (void)enumerateAllowedFamiliesForFace:(id)a3 withBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, unsigned char *))a4;
  char v18 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_familiesRankedList;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "integerValue", (void)v14);
      if ([(_SlotDescriptor *)self allowsFamily:v13 inFace:v6])
      {
        v7[2](v7, v13, &v18);
        if (v18) {
          break;
        }
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)allowsFamily:(int64_t)a3 inFace:(id)a4
{
  id v6 = [a4 device];
  uint64_t v7 = [v6 deviceCategory];

  familiesRankedList = self->_familiesRankedList;
  uint64_t v9 = [NSNumber numberWithInteger:a3];
  BOOL v10 = [(NSArray *)familiesRankedList containsObject:v9];

  if ((unint64_t)a3 > 0xC) {
    goto LABEL_7;
  }
  if (((1 << a3) & 0xDF) != 0) {
    return v10;
  }
  if (((1 << a3) & 0x1F00) != 0)
  {
    if (v7 == 1) {
      return 0;
    }
  }
  else
  {
LABEL_7:
    if (a3 != 100 && a3 != 101 && a3 != 102 && a3 != 103 && *MEMORY[0x1E4F19648] != a3 && *MEMORY[0x1E4F19650] != a3) {
      return 0;
    }
  }
  return v10;
}

- (BOOL)supportsFamiliesOfComplications:(id)a3 inFace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 complicationType])
  {
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58___SlotDescriptor_supportsFamiliesOfComplications_inFace___block_invoke;
    v10[3] = &unk_1E62C5A10;
    id v11 = v6;
    id v12 = v7;
    uint64_t v13 = &v14;
    [(_SlotDescriptor *)self enumerateAllowedFamiliesForFace:v12 withBlock:v10];
    BOOL v8 = *((unsigned char *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)allowsType:(unint64_t)a3 inFace:(id)a4
{
  possibleTypes = self->_possibleTypes;
  id v6 = a4;
  id v7 = (void *)[(NSIndexSet *)possibleTypes mutableCopy];
  BOOL v8 = [v6 device];

  uint64_t v9 = +[NTKComplicationProvider providerForDevice:v8];
  BOOL v10 = [v9 disabledComplicationTypes];

  [v7 removeIndexes:v10];
  char v11 = 1;
  if (a3 && a3 != 55) {
    char v11 = [v7 containsIndex:a3];
  }

  return v11;
}

- (BOOL)supportsType:(unint64_t)a3
{
  return [(NSIndexSet *)self->_possibleTypes containsIndex:a3];
}

- (NSArray)familiesRankedList
{
  return self->_familiesRankedList;
}

- (NSArray)typesRankedList
{
  return self->_typesRankedList;
}

- (NSIndexSet)possibleTypes
{
  return self->_possibleTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleTypes, 0);
  objc_storeStrong((id *)&self->_typesRankedList, 0);

  objc_storeStrong((id *)&self->_familiesRankedList, 0);
}

@end