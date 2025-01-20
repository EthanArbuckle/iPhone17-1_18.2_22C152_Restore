@interface SBWindowingLayoutFormatParser
+ (id)parse:(id)a3 bundleIdentifiersToLaunch:(id)a4 error:(id *)a5;
- (_NSRange)_findValidSubStringRangeForComponent:(id)a3 startIndex:(unint64_t)a4 currentIndex:(unint64_t)a5 error:(id *)a6;
- (id)_parse:(id)a3 error:(id *)a4;
- (int64_t)_applyLayoutRole:(int64_t)a3;
- (void)_createMapForLabelToBundleIdentifierAndLayoutRole:(id)a3;
@end

@implementation SBWindowingLayoutFormatParser

+ (id)parse:(id)a3 bundleIdentifiersToLaunch:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    unint64_t v9 = 2;
    goto LABEL_20;
  }
  if ((unint64_t)[v8 count] >= 5)
  {
    unint64_t v9 = 3;
LABEL_20:
    _SBWindowingLayoutFormatErrorWithCode(v9);
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (![v8 count])
  {
    unint64_t v9 = 5;
    goto LABEL_20;
  }
  v10 = objc_opt_new();
  v11 = objc_alloc_init(SBWindowingLayoutFormatParser);
  id v22 = v8;
  [(SBWindowingLayoutFormatParser *)v11 _createMapForLabelToBundleIdentifierAndLayoutRole:v8];
  id v23 = v7;
  v12 = [v7 componentsSeparatedByString:@"["];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v17 length])
        {
          v18 = objc_msgSend(v17, "substringToIndex:", objc_msgSend(v17, "length"));
          id v24 = 0;
          v19 = [(SBWindowingLayoutFormatParser *)v11 _parse:v18 error:&v24];
          id v20 = v24;

          if (v20) {
            *a5 = v20;
          }
          else {
            [v10 addObject:v19];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  id v8 = v22;
  id v7 = v23;
LABEL_21:

  return v10;
}

- (id)_parse:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 length])
  {
    v38 = a4;
    id v7 = objc_opt_new();
    id v8 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = [v6 componentsSeparatedByString:@"|"];
    uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v41;
      v35 = v7;
      id v32 = v6;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v41 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = v9;
          v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
          v11 = objc_alloc_init(SBWindowingLayoutItemRequest);
          if ([v10 length])
          {
            unint64_t v12 = 0;
            while (1)
            {
              id v39 = 0;
              uint64_t v13 = [(SBWindowingLayoutFormatParser *)self _findValidSubStringRangeForComponent:v10 startIndex:v12 currentIndex:v12 error:&v39];
              uint64_t v15 = v14;
              id v16 = v39;
              id *v38 = v16;
              if (v16)
              {
                v17 = v16;
                goto LABEL_57;
              }
              v17 = objc_msgSend(v10, "substringWithRange:", v13, v15);
              if ([v8 containsObject:v17]) {
                break;
              }
              if (![(SBWindowingLayoutItemRequest *)v11 layoutRole])
              {
                v18 = [(NSDictionary *)self->_labelToBundleIdentifierAndLayoutRole objectForKey:v17];
                v19 = v18;
                if (v18)
                {
                  id v20 = objc_msgSend(v18, "bs_safeNumberForKey:", @"layoutRole");
                  uint64_t v21 = [v20 unsignedIntegerValue];

                  id v22 = objc_msgSend(v19, "bs_safeStringForKey:", @"bundleIdentifier");
                  [(SBWindowingLayoutItemRequest *)v11 setLayoutRole:v21];
                  [(SBWindowingLayoutItemRequest *)v11 setBundleID:v22];
                  [v8 addObject:v17];
                }
              }
              if ([(SBWindowingLayoutItemRequest *)v11 size] == 7)
              {
                id v23 = [v17 lowercaseString];
                if ([v23 isEqualToString:@"maximized"])
                {
                  uint64_t v24 = 1;
                }
                else if ([v23 isEqualToString:@"fullscreen"])
                {
                  uint64_t v24 = 2;
                }
                else if ([v23 isEqualToString:@"smallest"])
                {
                  uint64_t v24 = 3;
                }
                else if ([v23 isEqualToString:@"inset"])
                {
                  uint64_t v24 = 4;
                }
                else if ([v23 isEqualToString:@"quarter"])
                {
                  uint64_t v24 = 5;
                }
                else if ([v23 isEqualToString:@"half"])
                {
                  uint64_t v24 = 6;
                }
                else
                {
                  uint64_t v24 = 7;
                }

                [(SBWindowingLayoutItemRequest *)v11 setSize:v24];
              }
              if ([(SBWindowingLayoutItemRequest *)v11 position] == 6)
              {
                long long v25 = [v17 lowercaseString];
                if ([v25 isEqualToString:@"topright"])
                {
                  uint64_t v26 = 2;
                }
                else if ([v25 isEqualToString:@"topleft"])
                {
                  uint64_t v26 = 3;
                }
                else if ([v25 isEqualToString:@"bottomleft"])
                {
                  uint64_t v26 = 4;
                }
                else if ([v25 isEqualToString:@"bottomright"])
                {
                  uint64_t v26 = 5;
                }
                else if ([v25 isEqualToString:@"center"])
                {
                  uint64_t v26 = 1;
                }
                else
                {
                  uint64_t v26 = 6;
                }

                [(SBWindowingLayoutItemRequest *)v11 setPosition:v26];
              }
              long long v27 = [v17 lowercaseString];
              int v28 = [v27 isEqualToString:@"keyfocus"];

              if (v28) {
                [(SBWindowingLayoutItemRequest *)v11 setWantsFocus:1];
              }
              unint64_t v12 = v13 + v15 + 1;

              if (v12 >= [v10 length]) {
                goto LABEL_46;
              }
            }
            _SBWindowingLayoutFormatErrorWithCode(6uLL);
            id *v38 = (id)objc_claimAutoreleasedReturnValue();
LABEL_57:

            id v30 = 0;
            id v6 = v32;
            id v7 = v35;
            goto LABEL_59;
          }
LABEL_46:
          if ([(SBWindowingLayoutItemRequest *)v11 size] == 7) {
            [(SBWindowingLayoutItemRequest *)v11 setSize:0];
          }
          id v7 = v35;
          if ([(SBWindowingLayoutItemRequest *)v11 position] == 6) {
            [(SBWindowingLayoutItemRequest *)v11 setPosition:0];
          }
          [v35 addObject:v11];

          uint64_t v9 = v36 + 1;
        }
        while (v36 + 1 != v33);
        id v6 = v32;
        uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }

    NSUInteger v29 = [(NSDictionary *)self->_labelToBundleIdentifierAndLayoutRole count];
    if (v29 == [v7 count])
    {
      id v30 = v7;
    }
    else
    {
      _SBWindowingLayoutFormatErrorWithCode(4uLL);
      id v30 = 0;
      id *v38 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_59:
  }
  else
  {
    _SBWindowingLayoutFormatErrorWithCode(2uLL);
    id v30 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v30;
}

- (_NSRange)_findValidSubStringRangeForComponent:(id)a3 startIndex:(unint64_t)a4 currentIndex:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  if ([v10 length] <= a5
    || (char v11 = [v10 characterAtIndex:a5], v11 == 93)
    || v11 == 124
    || (v12 = v11, int v13 = v11, isValidSymbol(v11)))
  {
    unint64_t v14 = a5 - a4;
  }
  else
  {
    char valid = isValidSymbol(v13);
    if ((v12 & 0xDF) - 65) < 0x1Au || (valid)
    {
      a4 = [(SBWindowingLayoutFormatParser *)self _findValidSubStringRangeForComponent:v10 startIndex:a4 currentIndex:a5 + 1 error:a6];
      unint64_t v14 = v18;
    }
    else
    {
      _SBWindowingLayoutFormatErrorWithCode(1uLL);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      a4 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  NSUInteger v15 = a4;
  NSUInteger v16 = v14;
  result.length = v16;
  result.location = v15;
  return result;
}

- (void)_createMapForLabelToBundleIdentifierAndLayoutRole:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (NSDictionary *)objc_opt_new();
  if ([v4 count])
  {
    unint64_t v6 = 0;
    uint64_t v7 = 1;
    do
    {
      id v8 = [v4 objectAtIndex:v6];
      uint64_t v9 = [&unk_1F3347B38 objectAtIndex:v6];
      int64_t v10 = [(SBWindowingLayoutFormatParser *)self _applyLayoutRole:v7];
      v14[0] = @"bundleIdentifier";
      v14[1] = @"layoutRole";
      v15[0] = v8;
      char v11 = [NSNumber numberWithInteger:v10];
      v15[1] = v11;
      char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
      [(NSDictionary *)v5 setObject:v12 forKey:v9];

      uint64_t v7 = v10 + 1;
      ++v6;
    }
    while (v6 < [v4 count]);
  }
  labelToBundleIdentifierAndLayoutRole = self->_labelToBundleIdentifierAndLayoutRole;
  self->_labelToBundleIdentifierAndLayoutRole = v5;
}

- (int64_t)_applyLayoutRole:(int64_t)a3
{
  if (SBLayoutRoleIsValidForSplitView(a3) && SBLayoutRoleAdditionalSideRangeMax() >= a3) {
    return a3;
  }
  return [(SBWindowingLayoutFormatParser *)self _applyLayoutRole:a3 + 1];
}

- (void).cxx_destruct
{
}

@end