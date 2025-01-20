@interface NSMutableString(RegularExpressions)
- (id)applyRegex:()RegularExpressions withReplacementTemplate:;
@end

@implementation NSMutableString(RegularExpressions)

- (id)applyRegex:()RegularExpressions withReplacementTemplate:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  v31 = a4;
  v27 = a1;
  v6 = [MEMORY[0x1E4F28E78] stringWithString:a1];
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "length"));
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 length])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [NSNumber numberWithInt:v7];
      [v39 addObject:v8];

      ++v7;
    }
    while ([v6 length] > v7);
  }
  objc_msgSend(v29, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v32)
  {
    uint64_t v9 = 0;
    uint64_t v30 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v12 = v31[2](v31, v11);
        if (v12)
        {
          uint64_t v34 = i;
          uint64_t v13 = [v11 range];
          unint64_t v15 = v14;
          v38 = v11;
          v33 = v12;
          v16 = [v29 replacementStringForResult:v11 inString:v6 offset:v9 template:v12];
          uint64_t v35 = v9;
          uint64_t v17 = v13 + v9;
          if (v15 != [v16 length] && objc_msgSend(v16, "length") | v15)
          {
            uint64_t v18 = 0;
            unint64_t v19 = 0;
            int v20 = 0;
            int v21 = 0;
            int v22 = 0;
            unint64_t v36 = v15;
            while (1)
            {
              if ([v16 length] > v19 && v18 + v17 < (unint64_t)objc_msgSend(v6, "length"))
              {
                int v37 = v20;
                int v23 = [v16 characterAtIndex:v19];
                BOOL v24 = v23 == [v6 characterAtIndex:v18 + v17];
                unint64_t v15 = v36;
                int v20 = v37;
                if (v24) {
                  goto LABEL_20;
                }
              }
              if ([v16 length] - v19 <= v15 - v18) {
                break;
              }
              v25 = objc_msgSend(v39, "objectAtIndexedSubscript:", objc_msgSend(v38, "range") + v18);
              [v39 insertObject:v25 atIndex:v18 + v17 + v20];

LABEL_21:
              ++v21;
LABEL_22:
              unint64_t v19 = v21;
              uint64_t v18 = v22;
              if ([v16 length] <= (unint64_t)v21 && v15 <= v22) {
                goto LABEL_24;
              }
            }
            if ([v16 length] - v19 < v15 - v18)
            {
              [v39 removeObjectAtIndex:v18 + v17 + v20--];
              ++v22;
              goto LABEL_22;
            }
LABEL_20:
            ++v22;
            goto LABEL_21;
          }
LABEL_24:
          objc_msgSend(v6, "replaceCharactersInRange:withString:", v17, v15, v16);
          uint64_t v9 = v35 - v15 + [v16 length];

          v12 = v33;
          uint64_t i = v34;
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v32);
  }
  objc_msgSend(v27, "replaceCharactersInRange:withString:", 0, objc_msgSend(v27, "length"), v6);

  return v39;
}

@end