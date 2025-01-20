@interface NSString(CREditDistance)
+ (uint64_t)editDistance:()CREditDistance string:;
+ (uint64_t)editDistance:()CREditDistance string:threshold:;
- (uint64_t)editDistanceFromString:()CREditDistance;
- (uint64_t)editDistanceFromString:()CREditDistance threshold:;
- (uint64_t)editDistanceFromStringIgnoringSpaces:()CREditDistance threshold:;
@end

@implementation NSString(CREditDistance)

- (uint64_t)editDistanceFromString:()CREditDistance
{
  return [NSString editDistance:a1 string:a3 threshold:0x7FFFFFFFLL];
}

+ (uint64_t)editDistance:()CREditDistance string:
{
  return [NSString editDistance:a3 string:a4 threshold:0x7FFFFFFFLL];
}

- (uint64_t)editDistanceFromString:()CREditDistance threshold:
{
  return [NSString editDistance:a1 string:a3 threshold:a4];
}

- (uint64_t)editDistanceFromStringIgnoringSpaces:()CREditDistance threshold:
{
  v6 = NSString;
  id v7 = a3;
  v8 = [a1 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F38EED68];
  v9 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F38EED68];

  uint64_t v10 = [v6 editDistance:v8 string:v9 threshold:a4];
  return v10;
}

+ (uint64_t)editDistance:()CREditDistance string:threshold:
{
  uint64_t v37 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v38 = v6;
  uint64_t v8 = [v6 length];
  uint64_t v9 = [v7 length];
  uint64_t v10 = v9;
  if (v8)
  {
    if (v9)
    {
      if ([v38 isEqualToString:v7])
      {
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v11 = [v7 length];
        uint64_t v36 = (uint64_t)&v36;
        MEMORY[0x1F4188790](v11);
        v13 = (char *)&v36 - v12;
        uint64_t v14 = [v7 length];
        MEMORY[0x1F4188790](v14);
        v16 = (uint64_t *)((char *)&v36 - v15);
        bzero(v13, (8 * [v7 length]) | 1);
        bzero(v16, (8 * [v7 length]) | 1);
        if ([v7 length] != -1)
        {
          unint64_t v17 = 0;
          do
          {
            *(void *)&v13[8 * v17] = v17;
            ++v17;
          }
          while (v17 < [v7 length] + 1);
        }
        id v18 = v38;
        uint64_t v19 = [v38 length];
        MEMORY[0x1F4188790](v19);
        v21 = (char *)&v36 - v20;
        uint64_t v22 = [v7 length];
        MEMORY[0x1F4188790](v22);
        v24 = (char *)&v36 - v23;
        objc_msgSend(v18, "getCharacters:range:", v21, 0, objc_msgSend(v18, "length"));
        objc_msgSend(v7, "getCharacters:range:", v24, 0, objc_msgSend(v7, "length"));
        unint64_t v25 = 0;
        uint64_t v10 = 0x7FFFFFFFLL;
        while (1)
        {
          v26 = (char *)v16;
          if (v25 >= [v38 length]) {
            break;
          }
          void *v16 = v25 + 1;
          if ([v7 length])
          {
            unint64_t v27 = 0;
            uint64_t v28 = 0x7FFFFFFFLL;
            do
            {
              int v29 = *(unsigned __int16 *)&v24[2 * v27];
              v30 = &v16[v27];
              uint64_t v31 = *v30 + 1;
              uint64_t v32 = *(void *)&v13[8 * v27];
              uint64_t v33 = *(void *)&v13[8 * v27 + 8];
              if (v31 >= v33 + 1) {
                uint64_t v31 = v33 + 1;
              }
              ++v27;
              if (*(unsigned __int16 *)&v21[2 * v25] == v29) {
                uint64_t v34 = v32;
              }
              else {
                uint64_t v34 = v32 + 1;
              }
              if (v31 < v34) {
                uint64_t v34 = v31;
              }
              if (v28 >= v34) {
                uint64_t v28 = v34;
              }
              v30[1] = v34;
            }
            while (v27 < [v7 length]);
          }
          else
          {
            uint64_t v28 = 0x7FFFFFFFLL;
          }
          ++v25;
          v16 = v13;
          v13 = v26;
          if (v28 > v37) {
            goto LABEL_28;
          }
        }
        uint64_t v10 = *(void *)&v13[8 * [v7 length]];
      }
    }
    else
    {
      uint64_t v10 = [v38 length];
    }
  }
LABEL_28:

  return v10;
}

@end