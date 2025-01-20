@interface CNVCardPHOTOParser
+ (id)clipRectInfoFromString:(id)a3;
+ (id)parseClipRectsWithParser:(id)a3;
+ (void)parseBase64:(BOOL)a3 parser:(id)a4 callback:(id)a5;
@end

@implementation CNVCardPHOTOParser

+ (void)parseBase64:(BOOL)a3 parser:(id)a4 callback:(id)a5
{
  BOOL v6 = a3;
  id v22 = a4;
  v8 = (void (**)(id, id, __CFString *, void *, void *))a5;
  v9 = [a1 parseClipRectsWithParser:v22];
  v10 = [v22 parameterValuesForName:@"VALUE"];
  unsigned int v11 = v6 & ~objc_msgSend(v10, "_cn_any:", &__block_literal_global_1);
  v12 = [v22 parameterValuesForName:@"VND-63-MEMOJI-DETAILS"];
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    v13 = 0;
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v15 = [v12 firstObject];
    v13 = (void *)[v14 initWithBase64EncodedString:v15 options:0];
  }
  v16 = v22;
  if (v11 && ([v22 parseBase64Data], v17 = objc_claimAutoreleasedReturnValue(), v16 = v22, v17))
  {
    objc_msgSend(v17, "_cn_decodeBase64IgnoringWhitespace");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v18, &stru_1F362EAE0, v9, v13);
  }
  else
  {
    uint64_t v19 = [v16 parseRemainingLine];
    v20 = (void *)v19;
    v21 = &stru_1F362EAE0;
    if (v19) {
      v21 = (__CFString *)v19;
    }
    v18 = v21;

    v17 = [MEMORY[0x1E4F1C9B8] data];
    v8[2](v8, v17, v18, v9, v13);
  }
}

+ (id)parseClipRectsWithParser:(id)a3
{
  v4 = [a3 parameterValuesForName:@"X-ABCROP-RECTANGLE"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CNVCardPHOTOParser_parseClipRectsWithParser___block_invoke;
  v7[3] = &__block_descriptor_40_e32___NSDictionary_16__0__NSString_8l;
  v7[4] = a1;
  v5 = objc_msgSend(v4, "_cn_compactMap:", v7);

  return v5;
}

uint64_t __47__CNVCardPHOTOParser_parseClipRectsWithParser___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) clipRectInfoFromString:a2];
}

+ (id)clipRectInfoFromString:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v3 = [a3 componentsSeparatedByString:@"&"];
  if ((unint64_t)[v3 count] >= 6)
  {
    v5 = [v3 objectAtIndex:0];
    BOOL v6 = [v3 objectAtIndex:1];
    uint64_t v7 = [v6 integerValue];

    v8 = [v3 objectAtIndex:2];
    uint64_t v9 = [v8 integerValue];

    v10 = [v3 objectAtIndex:3];
    uint64_t v11 = [v10 integerValue];

    v12 = [v3 objectAtIndex:4];
    uint64_t v13 = [v12 integerValue];

    id v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", (double)v7, (double)v9, (double)v11, (double)v13);
    v15 = [v3 objectAtIndex:5];
    v16 = [v15 dataUsingEncoding:1];
    v17 = objc_msgSend(v16, "_cn_decodeBase64");

    v4 = 0;
    if (v5)
    {
      if (v14 && v17 != 0)
      {
        v20[0] = @"kABImageInfoImageTypeKey";
        v20[1] = @"kABImageInfoClipRectKey";
        v21[0] = v5;
        v21[1] = v14;
        v20[2] = @"kABImageInfoHashKey";
        v21[2] = v17;
        v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end