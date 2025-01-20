@interface NSMutableDictionary(SCRCMutableDictionaryExtras)
- (uint64_t)scrc_mergeEntriesFromDictionary:()SCRCMutableDictionaryExtras;
- (void)scrc_mergeEntriesFromDictionary:()SCRCMutableDictionaryExtras factory:;
@end

@implementation NSMutableDictionary(SCRCMutableDictionaryExtras)

- (void)scrc_mergeEntriesFromDictionary:()SCRCMutableDictionaryExtras factory:
{
  id v24 = a3;
  id v6 = a4;
  v7 = [v24 keyEnumerator];
  objc_opt_class();
  objc_opt_class();
  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      v10 = [v24 objectForKey:v9];
      v11 = [a1 objectForKey:v9];
      if (objc_opt_isKindOfClass())
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];

          v11 = (void *)v12;
        }
        objc_msgSend(v11, "scrc_mergeEntriesFromDictionary:factory:", v10, v6);
        v13 = a1;
        v14 = v11;
      }
      else
      {
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v10 isEqualToString:@"@undefine"])
        {

LABEL_21:
          [a1 removeObjectForKey:v9];
          goto LABEL_22;
        }
        if (v6)
        {
          if (objc_opt_isKindOfClass())
          {
            if ([v10 hasPrefix:@"@"])
            {
              if ([v10 hasSuffix:@""]))
              {
                uint64_t v15 = objc_msgSend(v10, "rangeOfString:", @"(");
                if (v15 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v16 = v15;
                  uint64_t v17 = objc_msgSend(v10, "substringWithRange:", 1, v15 - 1);
                  v18 = objc_msgSend(v10, "substringWithRange:", v16 + 1, objc_msgSend(v10, "length") - v16 - 2);
                  v23 = (void *)v17;
                  v19 = objc_msgSend(v6, "scrc_dictionaryValueForClassKey:withSpecifier:", v17, v18);
                  v20 = v19;
                  if (v19)
                  {
                    id v22 = v19;

                    v10 = v22;
                  }
                }
              }
            }
          }
        }
        if (!v10) {
          goto LABEL_21;
        }
        v13 = a1;
        v14 = v10;
      }
      [v13 setObject:v14 forKey:v9];

LABEL_22:
      uint64_t v21 = [v7 nextObject];

      v9 = (void *)v21;
    }
    while (v21);
  }
}

- (uint64_t)scrc_mergeEntriesFromDictionary:()SCRCMutableDictionaryExtras
{
  return objc_msgSend(a1, "scrc_mergeEntriesFromDictionary:factory:", a3, 0);
}

@end