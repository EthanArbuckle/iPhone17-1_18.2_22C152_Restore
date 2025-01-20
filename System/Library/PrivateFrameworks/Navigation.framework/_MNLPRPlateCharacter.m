@interface _MNLPRPlateCharacter
- (id)_validReplacements:(uint64_t)a1;
- (id)description;
- (id)valueMappings;
- (uint64_t)isOfType:(void *)a3 alphabetics:(void *)a4 numerics:;
- (uint64_t)validReplacementCount:(uint64_t)result;
@end

@implementation _MNLPRPlateCharacter

- (id)valueMappings
{
  if (a1)
  {
    a1 = [a1[1] array];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)isOfType:(void *)a3 alphabetics:(void *)a4 numerics:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if (a2 == 1)
    {
      a1 = 1;
    }
    else
    {
      if (a2 == 2)
      {
        v9 = *(void **)(a1 + 32);
        id v10 = v7;
      }
      else
      {
        if (a2 != 3)
        {
          a1 = 0;
          goto LABEL_10;
        }
        v9 = *(void **)(a1 + 32);
        id v10 = v8;
      }
      a1 = [v9 rangeOfCharacterFromSet:v10] == 0;
    }
  }
LABEL_10:

  return a1;
}

- (id)_validReplacements:(uint64_t)a1
{
  v57[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    goto LABEL_41;
  }
  v4 = (id *)(a1 + 16);
  v3 = *(void **)(a1 + 16);
  if (v3)
  {
    id v5 = v3;
LABEL_4:
    id v6 = v5;
    goto LABEL_42;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    if (![*(id *)(a1 + 8) count])
    {
      v57[0] = *(void *)(a1 + 32);
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
      goto LABEL_4;
    }
    id v8 = [*(id *)(a1 + 8) array];
    goto LABEL_17;
  }
  uint64_t v9 = [*(id *)(a1 + 40) count];
  id v10 = *(void **)(a1 + 40);
  if (v9 != 1)
  {
    if ((unint64_t)[v10 count] < 2)
    {
      _mnLPRWrappedError(a2, -104, 0, @"For character \"%@\"", v18, v19, v20, v21, *(void *)(a1 + 32));
      [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"NoRulesApplyToCharacter"];
      id v8 = 0;
      goto LABEL_17;
    }
    v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:&unk_1F0E34F20];

    v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:&unk_1F0E34F38];

    v24 = [*(id *)(a1 + 40) objectForKeyedSubscript:&unk_1F0E34F50];

    if (v23 && v24)
    {
      _mnLPRWrappedError(a2, -102, 0, @"Invalid fill for character \"%@\"", v25, v26, v27, v28, *(void *)(a1 + 32));
      v29 = (void *)MEMORY[0x1E4F63E30];
      v30 = @"InvalidFillRules";
    }
    else
    {
      if (v24) {
        unsigned int v36 = 3;
      }
      else {
        unsigned int v36 = 1;
      }
      if (v23) {
        uint64_t v37 = 2;
      }
      else {
        uint64_t v37 = v36;
      }
      v38 = *(void **)(a1 + 40);
      if (v23 || v24 || v22)
      {
        v43 = [NSNumber numberWithInt:v37];
        v12 = [v38 objectForKeyedSubscript:v43];

        uint64_t v13 = objc_msgSend(v12, "mnlpr_componentsSeparatedByGlyph");
        if (v13) {
          goto LABEL_10;
        }
        v48 = off_1E60F7718[v37 - 1];
        _mnLPRWrappedError(a2, -101, 0, @"Unsplittable fill %@ \"%@\"", v44, v45, v46, v47, (uint64_t)v48);

LABEL_24:
        [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"UnableSplitString"];

        goto LABEL_41;
      }
      v39 = [*(id *)(a1 + 40) allKeys];
      v40 = [v39 firstObject];
      uint64_t v41 = [v40 intValue];

      if ((v41 - 1) >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v41);
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42 = off_1E60F7718[(int)v41 - 1];
      }
      v49 = *(void **)(a1 + 40);
      v50 = [NSNumber numberWithInt:v41];
      v56 = [v49 objectForKeyedSubscript:v50];
      _mnLPRWrappedError(a2, -103, 0, @"Unknown fill %@ \"%@\"", v51, v52, v53, v54, (uint64_t)v42);

      v29 = (void *)MEMORY[0x1E4F63E30];
      v30 = @"UnknownFillType";
    }
    [v29 captureUserAction:2191 target:0 value:v30];
    goto LABEL_41;
  }
  v11 = [v10 allValues];
  v12 = [v11 firstObject];

  uint64_t v13 = objc_msgSend(v12, "mnlpr_componentsSeparatedByGlyph");
  if (!v13)
  {
    _mnLPRWrappedError(a2, -101, 0, @"Unsplittable fill \"%@\"", v14, v15, v16, v17, (uint64_t)v12);
    goto LABEL_24;
  }
LABEL_10:
  id v8 = (void *)v13;

LABEL_17:
  if (![v8 count])
  {
LABEL_21:
    id v6 = *v4;

    goto LABEL_42;
  }
  if (([v8 containsObject:*(void *)(a1 + 32)] & 1) != 0
    || (unint64_t)[v8 count] >= 0xA)
  {
    objc_storeStrong(v4, v8);
    goto LABEL_21;
  }
  uint64_t v31 = *(void *)(a1 + 32);
  [v8 count];
  _mnLPRWrappedError(a2, -107, 0, @"Self missing in fill for character \"%@\" with only %d valid replacements", v32, v33, v34, v35, v31);
  [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"MappingDoesNotIncludeSelf"];

LABEL_41:
  id v6 = 0;
LABEL_42:
  return v6;
}

- (uint64_t)validReplacementCount:(uint64_t)result
{
  if (result)
  {
    v2 = -[_MNLPRPlateCharacter _validReplacements:](result, a2);
    uint64_t v3 = [v2 count];

    return v3;
  }
  return result;
}

- (id)description
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = (void *)v5;
  if (self->_isPickupChar) {
    id v7 = "YES";
  }
  else {
    id v7 = "NO";
  }
  id v8 = [v3 stringWithFormat:@"<%@ %p> \"%@\" { pickup: %s", v5, self, self->_glyph, v7];

  if ([(NSMutableDictionary *)self->_fillTypes count])
  {
    uint64_t v21 = v8;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_fillTypes, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = self->_fillTypes;
    uint64_t v11 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v22 + 1) + 8 * i) intValue];
          if ((v15 - 1) >= 3)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
            uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v16 = off_1E60F7718[(int)v15 - 1];
          }
          [v9 addObject:v16];
        }
        uint64_t v12 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    uint64_t v17 = [v9 componentsJoinedByString:@", "];
    id v8 = v21;
    [v21 appendFormat:@" fills: [%@]", v17];
  }
  if ([(NSMutableOrderedSet *)self->_valueMappings count])
  {
    uint64_t v18 = [(NSMutableOrderedSet *)self->_valueMappings array];
    uint64_t v19 = [v18 componentsJoinedByString:@", "];
    [v8 appendFormat:@" mappings: [%@]", v19];
  }
  [v8 appendString:@"}"];
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillTypes, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_validReplacementChars, 0);
  objc_storeStrong((id *)&self->_valueMappings, 0);
}

@end