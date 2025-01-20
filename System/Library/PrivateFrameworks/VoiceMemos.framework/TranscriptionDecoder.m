@interface TranscriptionDecoder
+ (id)decodeAttributedStringRuns:(id)a3 error:(id *)a4;
+ (id)decodeDictionary:(id)a3 error:(id *)a4;
+ (id)decodeString:(id)a3 error:(id *)a4;
+ (id)decodeTransciptionData:(id)a3 error:(id *)a4;
@end

@implementation TranscriptionDecoder

+ (id)decodeTransciptionData:(id)a3 error:(id *)a4
{
  v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:a4];
  if (v6)
  {
    v7 = [a1 decodeDictionary:v6 error:a4];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 objectForKeyedSubscript:@"attributedString"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
      }
      else
      {
        v11 = [a1 decodeAttributedStringRuns:v9 error:a4];
        if (v11)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          if ((unint64_t)[v11 count] < 2)
          {
LABEL_12:
            id v10 = v12;
          }
          else
          {
            uint64_t v13 = 0;
            while (1)
            {
              v14 = [v11 objectAtIndexedSubscript:v13];
              v15 = [a1 decodeString:v14 error:a4];

              if (!v15) {
                break;
              }
              [v12 appendString:v15];

              unint64_t v16 = [v11 count];
              unint64_t v17 = v13 + 3;
              v13 += 2;
              if (v16 <= v17) {
                goto LABEL_12;
              }
            }
            id v10 = 0;
          }
        }
        else
        {
          id v10 = 0;
        }
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)decodeDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    RCDecodeFail(1, a4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)decodeAttributedStringRuns:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = 2;
LABEL_8:
    id v6 = RCDecodeFail(v9, a4);
    goto LABEL_9;
  }
  id v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 objectForKeyedSubscript:@"runs"];

    id v6 = (void *)v7;
    if (!v7)
    {
      uint64_t v9 = 5;
      goto LABEL_8;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = RCDecodeFail(3, a4);

    id v6 = (void *)v8;
  }
LABEL_9:
  return v6;
}

+ (id)decodeString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    RCDecodeFail(4, a4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = v6;

  return v7;
}

@end