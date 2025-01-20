@interface NSString
- (NSUUID)vm_UUIDv5;
- (id)pstnAddress;
@end

@implementation NSString

- (NSUUID)vm_UUIDv5
{
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:self];
  if (!v3)
  {
    id v3 = +[NSUUID vm_UUIDv5ForString:self];
  }
  return (NSUUID *)v3;
}

- (id)pstnAddress
{
  v2 = [(NSString *)self mf_uncommentedAddress];
  id v3 = (char *)[(__CFString *)v2 rangeOfString:@"@"];
  v4 = (char *)[(__CFString *)v2 length];
  if (v3 == (char *)0x7FFFFFFFFFFFFFFFLL) {
    v5 = v4;
  }
  else {
    v5 = v3;
  }
  if (!v5) {
    goto LABEL_15;
  }
  if ([(__CFString *)v2 compare:@"blocked", 1, 0, v5 options range]
    && [(__CFString *)v2 compare:@"unknown", 1, 0, v5 options range])
  {
    v6 = (char *)[(__CFString *)v2 rangeOfString:@"/", 8, 0, v5 options range];
    v8 = 0;
    if (v6 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v5 -= v7;
      if (!v5) {
        goto LABEL_15;
      }
      v8 = &v6[v7];
    }
    v9 = (char *)[(__CFString *)v2 rangeOfString:@"/", 0, v8, v5 options range];
    if (v9 == (char *)0x7FFFFFFFFFFFFFFFLL || (v5 = (char *)(v9 - v8), v9 != v8))
    {
      v10 = (char *)[(__CFString *)v2 rangeOfString:@"=", 0, v8, v5 options range];
      v12 = 0;
      if (v10 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = &v10[v11];
        v14 = &v5[v8 - &v10[v11]];
        v12 = -[__CFString substringWithRange:](v2, "substringWithRange:", &v10[v11], v14);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        CFStringRef theString = v2;
        v44 = v13;
        int64_t v45 = (int64_t)v14;
        CharactersPtr = CFStringGetCharactersPtr(v2);
        v15 = CharactersPtr ? 0 : CFStringGetCStringPtr(v2, 0x600u);
        int64_t v46 = 0;
        int64_t v47 = 0;
        v43 = v15;
        if (v14)
        {
          uint64_t v18 = 0;
          int64_t v19 = 0;
          id v20 = 0;
          int v21 = 0;
          uint64_t v22 = 64;
          do
          {
            if ((unint64_t)v19 >= 4) {
              uint64_t v23 = 4;
            }
            else {
              uint64_t v23 = v19;
            }
            int64_t v24 = v45;
            if (v45 > v19)
            {
              if (CharactersPtr)
              {
                UniChar v25 = CharactersPtr[(void)&v44[v19]];
              }
              else if (v43)
              {
                UniChar v25 = v44[(void)v43 + v19];
              }
              else
              {
                int64_t v26 = v46;
                if (v47 <= v19 || v46 > v19)
                {
                  int64_t v28 = v19 - v23;
                  uint64_t v29 = v23 + v18;
                  uint64_t v30 = v22 - v23;
                  int64_t v31 = v28 + 64;
                  if (v28 + 64 >= v45) {
                    int64_t v31 = v45;
                  }
                  int64_t v46 = v28;
                  int64_t v47 = v31;
                  if (v45 >= v30) {
                    int64_t v24 = v30;
                  }
                  v49.length = v24 + v29;
                  v49.location = (CFIndex)&v44[v28];
                  CFStringGetCharacters(theString, v49, (UniChar *)&v33);
                  int64_t v26 = v46;
                }
                UniChar v25 = *((_WORD *)&v33 + v19 - v26);
              }
              if ((unsigned __int16)(v25 - 45) <= 1u)
              {
                if (!v20) {
                  id v20 = objc_msgSend(v12, "mutableCopy", v33, v34, v35, v36, v37, v38, v39, v40);
                }
                objc_msgSend(v20, "deleteCharactersInRange:", (int)v19 - v21++, 1, v33, v34, v35, v36, v37, v38, v39, v40);
              }
            }
            ++v19;
            --v18;
            ++v22;
          }
          while (v14 != (char *)v19);
          if (v20)
          {
            id v32 = v20;

            v12 = v32;
          }
        }
      }
      goto LABEL_16;
    }
LABEL_15:
    v12 = 0;
LABEL_16:
    id v16 = v12;
    goto LABEL_18;
  }
  id v16 = 0;
LABEL_18:

  return v16;
}

@end