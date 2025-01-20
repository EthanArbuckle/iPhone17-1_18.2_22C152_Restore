@interface NSString(RTExtensions)
- (id)base64DecodedString;
- (id)base64EncodedString;
- (id)hmacSha1WithKey:()RTExtensions;
- (uint64_t)levenshteinDistanceFromString:()RTExtensions withMaxCutOffDistance:;
- (uint64_t)stringByRemovingAllWhitespace;
- (uint64_t)stringByRemovingAllWhitespaceAndPunctuation;
@end

@implementation NSString(RTExtensions)

- (uint64_t)stringByRemovingAllWhitespaceAndPunctuation
{
  uint64_t v2 = [a1 length];

  return [a1 stringByReplacingOccurrencesOfString:@"[:space:]|[:punct:]" withString:&stru_1F33EAD88 options:1024 range:v2];
}

- (uint64_t)stringByRemovingAllWhitespace
{
  uint64_t v2 = [a1 length];

  return [a1 stringByReplacingOccurrencesOfString:@"[:space:]" withString:&stru_1F33EAD88 options:1024 range:v2];
}

- (uint64_t)levenshteinDistanceFromString:()RTExtensions withMaxCutOffDistance:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a1;
  unint64_t v8 = [v7 length];
  if (v8 <= [v6 length] + a4 && (unint64_t v9 = objc_msgSend(v6, "length"), v9 <= objc_msgSend(v7, "length") + a4))
  {
    uint64_t v12 = [v7 length];
    uint64_t v10 = [v6 length];
    if (v12)
    {
      if (v10)
      {
        if ([v7 isEqualToString:v6])
        {
          uint64_t v10 = 0;
        }
        else
        {
          v34[1] = v34;
          v13 = (void *)((char *)v34 - ((8 * [v7 length] + 23) & 0xFFFFFFFFFFFFFFF0));
          v39 = (char *)v34 - ((8 * [v7 length] + 23) & 0xFFFFFFFFFFFFFFF0);
          uint64_t v14 = [v7 length];
          unint64_t v15 = v14 + 1;
          if (v14 != -1)
          {
            bzero(v39, 8 * v14 + 8);
            unint64_t v16 = 0;
            do
            {
              v13[v16] = v16;
              ++v16;
            }
            while (v15 != v16);
          }
          if ((unint64_t)([v6 length] - 1) > 0xFFFFFFFFFFFFFFFDLL)
          {
            v33 = v13;
LABEL_39:
            if (v33[[v7 length]] <= a4)
            {
              uint64_t v10 = v33[[v7 length]];
              goto LABEL_4;
            }
          }
          else
          {
            unint64_t v17 = a4 + 1;
            unint64_t v18 = 1;
            unint64_t v35 = a4;
            unint64_t v36 = a4 + 1;
            while (1)
            {
              v19 = (unint64_t *)v39;
              v39 = (char *)v13;
              unint64_t v20 = v18 - a4;
              if (v18 <= a4)
              {
                unint64_t *v19 = v18;
                unint64_t v20 = 1;
              }
              else
              {
                v19[v20 - 1] = v17;
              }
              unint64_t v21 = v18 + a4;
              unint64_t v22 = [v7 length];
              unint64_t v37 = v18;
              v38 = v19;
              if (v18 + a4 >= v22) {
                unint64_t v21 = [v7 length];
              }
              else {
                v19[v21 + 1] = v17;
              }
              if (v20 < v15)
              {
                unint64_t v17 = v36;
                if (v20 <= v21)
                {
                  unint64_t v17 = v36;
                  unint64_t v23 = v37 - 1;
                  v24 = &v39[8 * v20];
                  v25 = &v38[v20];
                  do
                  {
                    int v26 = [v7 characterAtIndex:v20 - 1];
                    int v27 = [v6 characterAtIndex:v23];
                    unint64_t v28 = *((void *)v24 - 1);
                    if (v26 != v27) {
                      ++v28;
                    }
                    unint64_t v29 = *(void *)v24 + 1;
                    uint64_t v30 = *(v25 - 1);
                    if (v29 >= v30 + 1) {
                      unint64_t v29 = v30 + 1;
                    }
                    if (v28 >= v29) {
                      unint64_t v28 = v29;
                    }
                    unint64_t *v25 = v28;
                    if (v17 >= v28) {
                      unint64_t v17 = v28;
                    }
                    if (v20 + 1 >= v15) {
                      break;
                    }
                    v24 += 8;
                    ++v25;
                  }
                  while (v20++ < v21);
                }
              }
              a4 = v35;
              if (v17 > v35) {
                break;
              }
              unint64_t v18 = v37 + 1;
              unint64_t v32 = [v6 length] + 1;
              v33 = v38;
              v13 = v38;
              unint64_t v17 = v36;
              if (v18 >= v32) {
                goto LABEL_39;
              }
            }
          }
          uint64_t v10 = -1;
        }
      }
      else
      {
        uint64_t v10 = [v7 length];
      }
    }
  }
  else
  {
    uint64_t v10 = -1;
  }
LABEL_4:

  return v10;
}

- (id)base64EncodedString
{
  v1 = [a1 dataUsingEncoding:4];
  uint64_t v2 = [v1 base64EncodedStringWithOptions:0];

  return v2;
}

- (id)base64DecodedString
{
  id v2 = [NSString alloc];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:a1 options:0];
  v4 = (void *)[v2 initWithData:v3 encoding:4];

  return v4;
}

- (id)hmacSha1WithKey:()RTExtensions
{
  if (a3)
  {
    id v4 = a3;
    v5 = [a1 dataUsingEncoding:4];
    id v6 = [v5 hmacSha1WithKey:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end