@interface NSCompoundPredicate(Conversion)
- (id)FCCKPQueryFiltersWithTranslator:()Conversion error:;
@end

@implementation NSCompoundPredicate(Conversion)

- (id)FCCKPQueryFiltersWithTranslator:()Conversion error:
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a1 compoundPredicateType] != 1)
  {
    if ([a1 compoundPredicateType])
    {
      if (a4)
      {
        [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Unexpected expression: %@", a1 format];
        id v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v17 = 0;
      }
      goto LABEL_41;
    }
    v18 = [a1 subpredicates];
    v19 = [v18 objectAtIndexedSubscript:0];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ![v19 compoundPredicateType])
    {
      id v17 = [v19 FCCKPQueryFiltersWithTranslator:v6 error:a4];
      goto LABEL_40;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Expected comparison subpredicate: %@", a1 format];
LABEL_37:
        id v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
LABEL_38:
      id v17 = 0;
      goto LABEL_40;
    }
    id v20 = [v19 FCCKPQueryFiltersWithTranslator:v6 error:0];
    v21 = v20;
    if (!v20 || [v20 count] != 1)
    {
      id v17 = 0;
LABEL_34:

      if (v17)
      {
LABEL_40:

        goto LABEL_41;
      }
      if (a4)
      {
        [MEMORY[0x1E4F1A130] errorWithCode:1009, @"Invalid NOT predicate: %@", a1 format];
        goto LABEL_37;
      }
      goto LABEL_38;
    }
    uint64_t v22 = [v21 objectAtIndexedSubscript:0];
    v23 = (void *)v22;
    if (v22)
    {
      if (*(unsigned char *)(v22 + 28))
      {
        id v17 = 0;
        switch(*(_DWORD *)(v22 + 24))
        {
          case 2:
            int v24 = 1;
            goto LABEL_27;
          case 3:
            int v24 = 4;
            goto LABEL_27;
          case 4:
            int v24 = 3;
            goto LABEL_27;
          case 5:
            int v24 = 8;
            goto LABEL_27;
          case 6:
            int v24 = 7;
            goto LABEL_27;
          case 7:
            int v24 = 6;
            goto LABEL_27;
          case 8:
            int v24 = 5;
            goto LABEL_27;
          case 9:
          case 0xA:
          case 0xB:
            goto LABEL_29;
          case 0xC:
            int v24 = 13;
            goto LABEL_27;
          case 0xD:
            int v24 = 12;
            goto LABEL_27;
          case 0xE:
            int v24 = 15;
            goto LABEL_27;
          case 0xF:
            int v24 = 14;
            goto LABEL_27;
          case 0x10:
            int v24 = 17;
            goto LABEL_27;
          case 0x11:
            int v24 = 16;
            goto LABEL_27;
          case 0x12:
            int v24 = 19;
            goto LABEL_27;
          case 0x13:
            int v24 = 18;
            goto LABEL_27;
          case 0x14:
            int v24 = 21;
            goto LABEL_27;
          case 0x15:
            int v24 = 20;
            goto LABEL_27;
          default:
            goto LABEL_26;
        }
        goto LABEL_29;
      }
LABEL_26:
      int v24 = 2;
LABEL_27:
      *(unsigned char *)(v22 + 28) |= 1u;
      *(_DWORD *)(v22 + 24) = v24;
    }
    v32[0] = v22;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
LABEL_29:

    goto LABEL_34;
  }
  v7 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v8 = [a1 subpredicates];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v28;
    while (2)
    {
      uint64_t v13 = 0;
      v14 = v11;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
        id v26 = v14;
        v16 = [v15 FCCKPQueryFiltersWithTranslator:v6 error:&v26];
        id v11 = v26;

        [v7 addObjectsFromArray:v16];
        if (a4 && v11)
        {
          id v11 = v11;
          *a4 = v11;

          id v17 = 0;
          goto LABEL_18;
        }
        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }

  id v17 = v7;
LABEL_18:

LABEL_41:
  return v17;
}

@end