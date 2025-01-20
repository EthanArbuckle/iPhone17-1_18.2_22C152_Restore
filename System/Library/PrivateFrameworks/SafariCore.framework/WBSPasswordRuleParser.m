@interface WBSPasswordRuleParser
+ (id)_passwordRuleSetFromPasswordRules:(id)a3;
+ (id)mergePasswordRuleSet:(id)a3 withPasswordRuleSet:(id)a4;
+ (id)parsePasswordRules:(id)a3 error:(id *)a4;
@end

@implementation WBSPasswordRuleParser

+ (id)parsePasswordRules:(id)a3 error:(id *)a4
{
  v6 = (__CFString *)a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = 2;
LABEL_10:
      [v13 errorWithDomain:@"WBSPasswordRuleParserErrorDomain" code:v14 userInfo:0];
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_17;
  }
  CFIndex v8 = [(__CFString *)v6 length];
  v9 = (UniChar *)malloc_type_calloc(v8 + 1, 2uLL, 0x1000040BDFB0063uLL);
  if (!v9)
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = 0;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v10 = v9;
  v18.location = 0;
  v18.length = v8;
  CFStringGetCharacters(v7, v18, v9);
  v10[v8] = 0;
  uint64_t v16 = 0;
  v11 = parsePasswordRules(v10, &v16);
  free(v10);
  if (v16 == -1)
  {
    if (a4) {
      *a4 = 0;
    }
    v12 = [a1 _passwordRuleSetFromPasswordRules:v11];
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"WBSPasswordRuleParserErrorDomain");
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

LABEL_17:
  return v12;
}

+ (id)_passwordRuleSetFromPasswordRules:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v39 = [MEMORY[0x1E4F1CA48] array];
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
  v38 = v4;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v37 = 0;
    char v36 = 0;
    uint64_t v8 = *(void *)v41;
    uint64_t v9 = -2147483647;
    uint64_t v10 = 0x7FFFFFFFLL;
    uint64_t v11 = 0x7FFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        switch([v13 type])
        {
          case 0:
            uint64_t v14 = [v13 value];
            if (v14) {
              [v4 addObjectsFromArray:v14];
            }
            goto LABEL_23;
          case 1:
            v17 = [v13 value];
            uint64_t v14 = v17;
            if (v17)
            {
              CFRange v18 = canonicalizedCharacterClasses(v17);
              v19 = +[WBSRequiredPasswordRule requiredRuleWithCharacterClasses:v18];
              [v39 addObject:v19];

              v4 = v38;
              [v38 addObjectsFromArray:v18];
            }
            goto LABEL_23;
          case 2:
            v20 = [v13 value];
            uint64_t v14 = v20;
            if (v20)
            {
              uint64_t v21 = [v20 integerValue];
              if (v11 >= v21) {
                uint64_t v11 = v21;
              }
              char v36 = 1;
            }
            goto LABEL_23;
          case 3:
            v22 = [v13 value];
            uint64_t v14 = v22;
            if (v22)
            {
              uint64_t v23 = [v22 integerValue];
              if (v9 <= v23) {
                uint64_t v9 = v23;
              }
              BYTE4(v37) = 1;
            }
            goto LABEL_23;
          case 4:
            v15 = [v13 value];
            uint64_t v14 = v15;
            if (v15)
            {
              uint64_t v16 = [v15 integerValue];
              if (v10 >= v16) {
                uint64_t v10 = v16;
              }
              LOBYTE(v37) = 1;
            }
LABEL_23:

            break;
          default:
            continue;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v37 = 0;
    char v36 = 0;
    uint64_t v9 = -2147483647;
    uint64_t v10 = 0x7FFFFFFFLL;
    uint64_t v11 = 0x7FFFFFFFLL;
  }

  v24 = canonicalizedCharacterClasses(v4);
  if (![v24 count])
  {
    v25 = +[WBSPasswordCharacterClass asciiPrintableCharacterClass];
    v44 = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];

    v24 = (void *)v26;
  }
  v27 = +[WBSAllowedPasswordRule allowedRuleWithCharacterClasses:v24];
  if (v36)
  {
    v28 = [NSNumber numberWithInteger:v11];
    v29 = +[WBSMaxConsecutivePasswordRule maxConsecutiveRuleWithValue:v28];
  }
  else
  {
    v29 = 0;
  }
  if (v37)
  {
    v30 = [NSNumber numberWithInteger:v10];
    v31 = +[WBSMaxLengthPasswordRule maxLengthRuleWithValue:v30];
  }
  else
  {
    v31 = 0;
  }
  if ((v37 & 0x100000000) != 0)
  {
    v32 = [NSNumber numberWithInteger:v9];
    v33 = +[WBSMinLengthPasswordRule minLengthRuleWithValue:v32];
  }
  else
  {
    v33 = 0;
  }
  v34 = +[WBSPasswordRuleSet ruleSetWithAllowedRule:v27 requiredRules:v39 maxConsecutiveRule:v29 minLengthRule:v33 maxLengthRule:v31];

  return v34;
}

+ (id)mergePasswordRuleSet:(id)a3 withPasswordRuleSet:(id)a4
{
  v65[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  if (!v6 || !v7) {
    goto LABEL_45;
  }
  id v51 = a1;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [v6 allowedRule];
  v12 = [v11 value];
  v13 = [v8 allowedRule];
  uint64_t v14 = [v13 value];
  id v15 = v12;
  id v16 = v14;
  v54 = v8;
  if ([v15 count] && objc_msgSend(v16, "count"))
  {
    v48 = v13;
    v49 = v11;
    uint64_t v17 = [MEMORY[0x1E4F28E78] string];
    CFRange v18 = [MEMORY[0x1E4F28E78] string];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __intersectCharacterClasses_block_invoke;
    aBlock[3] = &unk_1E615C6B8;
    id v60 = v15;
    id v61 = v16;
    id v52 = (id)v17;
    id v62 = v52;
    id v50 = v18;
    id v63 = v50;
    v19 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
    LOBYTE(v17) = v19[2](v19, 1);
    v47 = v19;
    char v20 = v19[2](v19, 0) & v17;
    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    if ((v20 & 0x10) != 0)
    {
      long long v42 = +[WBSPasswordCharacterClass unicodeCharacterClass];
      [v21 addObject:v42];

      if ((v20 & 0x20) == 0)
      {
LABEL_7:
        if ((v20 & 2) == 0) {
          goto LABEL_8;
        }
        goto LABEL_50;
      }
    }
    else if ((v20 & 0x20) == 0)
    {
      goto LABEL_7;
    }
    long long v43 = +[WBSPasswordCharacterClass asciiPrintableCharacterClass];
    [v21 addObject:v43];

    if ((v20 & 2) == 0)
    {
LABEL_8:
      if ((v20 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_51;
    }
LABEL_50:
    v44 = +[WBSPasswordCharacterClass lowercaseCharacterClass];
    [v21 addObject:v44];

    if ((v20 & 1) == 0)
    {
LABEL_9:
      if ((v20 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_52;
    }
LABEL_51:
    v45 = +[WBSPasswordCharacterClass uppercaseCharacterClass];
    [v21 addObject:v45];

    if ((v20 & 4) == 0)
    {
LABEL_10:
      if ((v20 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_52:
    uint64_t v46 = +[WBSPasswordCharacterClass digitCharacterClass];
    [v21 addObject:v46];

    if ((v20 & 8) == 0)
    {
LABEL_12:
      if ([v52 length] && objc_msgSend(v50, "length"))
      {
        uint64_t v23 = v21;
        CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        Mutable = CFBitVectorCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 95);
        CFBitVectorSetCount(Mutable, 95);
        markBitsForCustomCharacterClassPropertyValue(Mutable, v52);
        uint64_t v26 = CFBitVectorCreateMutable(v24, 95);
        CFBitVectorSetCount(v26, 95);
        markBitsForCustomCharacterClassPropertyValue(v26, v50);
        v27 = [MEMORY[0x1E4F28E78] string];
        for (CFIndex i = 0; i != 95; ++i)
        {
          if (CFBitVectorGetBitAtIndex(Mutable, i) && CFBitVectorGetBitAtIndex(v26, i)) {
            objc_msgSend(v27, "appendFormat:", @"%C", i + 32);
          }
        }
        CFRelease(Mutable);
        CFRelease(v26);
        uint64_t v21 = v23;
        if ([v27 length])
        {
          v29 = +[WBSPasswordCharacterClass customCharacterClassWithValue:v27];
          [v23 addObject:v29];
        }
        uint64_t v8 = v54;
      }

      v13 = v48;
      uint64_t v11 = v49;
      goto LABEL_24;
    }
LABEL_11:
    v22 = +[WBSPasswordCharacterClass specialCharacterClass];
    [v21 addObject:v22];

    goto LABEL_12;
  }
  uint64_t v21 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_24:

  if ([v21 count])
  {
    v30 = +[WBSAllowedPasswordRule allowedRuleWithCharacterClasses:v21];
    [v10 addObject:v30];
  }
  v53 = v21;
  v65[0] = v6;
  v65[1] = v8;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = [v31 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v56 != v34) {
          objc_enumerationMutation(v31);
        }
        char v36 = *(void **)(*((void *)&v55 + 1) + 8 * j);
        uint64_t v37 = [v36 requiredRules];
        if (v37) {
          [v10 addObjectsFromArray:v37];
        }
        v38 = [v36 maxConsecutiveRule];
        if (v38) {
          [v10 addObject:v38];
        }
        v39 = [v36 minLengthRule];
        if (v39) {
          [v10 addObject:v39];
        }
        long long v40 = [v36 maxLengthRule];
        if (v40) {
          [v10 addObject:v40];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v33);
  }

  if ([v10 count])
  {
    uint64_t v9 = [v51 _passwordRuleSetFromPasswordRules:v10];
  }
  else
  {
    uint64_t v9 = 0;
  }

  uint64_t v8 = v54;
LABEL_45:

  return v9;
}

@end