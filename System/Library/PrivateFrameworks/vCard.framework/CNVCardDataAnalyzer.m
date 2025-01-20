@interface CNVCardDataAnalyzer
+ (BOOL)data:(id)a3 containsParam:(id)a4 value:(id)a5 encoding:(unint64_t)a6;
+ (BOOL)data:(id)a3 containsString:(id)a4 encoding:(unint64_t)a5;
+ (BOOL)data:(id)a3 containsSubdata:(id)a4;
+ (BOOL)data:(id)a3 hasPrefix:(id)a4;
+ (BOOL)data:(id)a3 isVersion30WithPrefix:(id)a4 encoding:(unint64_t)a5;
+ (BOOL)tryUTF16BEBOMVCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4;
+ (BOOL)tryUTF16BEVCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4;
+ (BOOL)tryUTF16ByInferrence:(id)a3 analysis:(CNVCardDataAnalysis *)a4;
+ (BOOL)tryUTF16LEBOMVCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4;
+ (BOOL)tryUTF16LEVCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4;
+ (BOOL)tryUTF16WithByteOrderMarker:(id)a3 analysis:(CNVCardDataAnalysis *)a4;
+ (BOOL)tryUTF8VCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4;
+ (BOOL)tryVCardEncoding:(unint64_t)a3 data:(id)a4 analysis:(CNVCardDataAnalysis *)a5;
+ (CNVCardDataAnalysis)analyzeData:(id)a3;
+ (id)data:(id)a3 byPrependingData:(id)a4;
+ (unsigned)data:(id)a3 byteAtIndex:(unint64_t)a4;
@end

@implementation CNVCardDataAnalyzer

+ (CNVCardDataAnalysis)analyzeData:(id)a3
{
  id v4 = a3;
  unint64_t v7 = 0;
  BOOL v8 = 0;
  if ([v4 length]
    && ([a1 tryUTF8VCard:v4 analysis:&v7] & 1) == 0
    && ([a1 tryUTF16LEVCard:v4 analysis:&v7] & 1) == 0
    && ([a1 tryUTF16BEVCard:v4 analysis:&v7] & 1) == 0
    && ([a1 tryUTF16LEBOMVCard:v4 analysis:&v7] & 1) == 0
    && ([a1 tryUTF16BEBOMVCard:v4 analysis:&v7] & 1) == 0
    && ([a1 tryUTF16WithByteOrderMarker:v4 analysis:&v7] & 1) == 0)
  {
    [a1 tryUTF16ByInferrence:v4 analysis:&v7];
  }

  unint64_t v5 = v7;
  BOOL v6 = v8;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

+ (BOOL)tryUTF8VCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  return [a1 tryVCardEncoding:4 data:a3 analysis:a4];
}

+ (BOOL)tryUTF16LEVCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  return [a1 tryVCardEncoding:2483028224 data:a3 analysis:a4];
}

+ (BOOL)tryUTF16BEVCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  return [a1 tryVCardEncoding:2415919360 data:a3 analysis:a4];
}

+ (BOOL)tryUTF16LEBOMVCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  id v6 = a3;
  unint64_t v7 = [@"BEGIN:VCARD" dataUsingEncoding:2483028224];
  BOOL v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"\xFF\xFE" length:2];
  v9 = [a1 data:v7 byPrependingData:v8];

  int v10 = [a1 data:v6 isVersion30WithPrefix:v9 encoding:2483028224];
  if (v10)
  {
    a4->var0 = 2483028224;
    a4->var1 = 1;
  }

  return v10;
}

+ (BOOL)tryUTF16BEBOMVCard:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  id v6 = a3;
  unint64_t v7 = [@"BEGIN:VCARD" dataUsingEncoding:2415919360];
  BOOL v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"\xFE\xFF" length:2];
  v9 = [a1 data:v7 byPrependingData:v8];

  int v10 = [a1 data:v6 isVersion30WithPrefix:v9 encoding:2415919360];
  if (v10)
  {
    a4->var0 = 2415919360;
    a4->var1 = 1;
  }

  return v10;
}

+ (BOOL)tryVCardEncoding:(unint64_t)a3 data:(id)a4 analysis:(CNVCardDataAnalysis *)a5
{
  id v8 = a4;
  v9 = [@"BEGIN:VCARD" dataUsingEncoding:a3];
  int v10 = [a1 data:v8 isVersion30WithPrefix:v9 encoding:a3];

  if (v10) {
    a5->var0 = a3;
  }

  return v10;
}

+ (BOOL)data:(id)a3 isVersion30WithPrefix:(id)a4 encoding:(unint64_t)a5
{
  id v8 = a3;
  if ([a1 data:v8 hasPrefix:a4])
  {
    if ([a1 data:v8 containsString:@"VERSION:3.0" encoding:a5]) {
      char v9 = 1;
    }
    else {
      char v9 = [a1 data:v8 containsParam:@"VERSION" value:@"3.0" encoding:a5];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)data:(id)a3 containsString:(id)a4 encoding:(unint64_t)a5
{
  id v8 = a3;
  char v9 = [a4 dataUsingEncoding:a5];
  LOBYTE(a4) = [a1 data:v8 containsSubdata:v9];

  return (char)a4;
}

+ (BOOL)data:(id)a3 containsParam:(id)a4 value:(id)a5 encoding:(unint64_t)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = [a4 dataUsingEncoding:a6];
  uint64_t v12 = objc_msgSend(v9, "rangeOfData:options:range:", v11, 0, 0, objc_msgSend(v9, "length"));
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v14 = 0;
  }
  else
  {
    uint64_t v15 = v12 + v13;
    [v9 length];
    id v28 = v10;
    v27 = [v10 dataUsingEncoding:a6];
    uint64_t v16 = objc_msgSend(v9, "rangeOfData:options:range:");
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v14 = 0;
    }
    else
    {
      uint64_t v17 = v16;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v18 = [&unk_1F3638DD8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = v17 - v15;
        uint64_t v21 = *(void *)v30;
        v26 = v11;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(&unk_1F3638DD8);
            }
            v23 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dataUsingEncoding:a6];
            uint64_t v24 = objc_msgSend(v9, "rangeOfData:options:range:", v23, 0, v15, v20);

            if (v24 != 0x7FFFFFFFFFFFFFFFLL)
            {
              BOOL v14 = 0;
              v11 = v26;
              goto LABEL_16;
            }
          }
          uint64_t v19 = [&unk_1F3638DD8 countByEnumeratingWithState:&v29 objects:v33 count:16];
          BOOL v14 = 1;
          v11 = v26;
          if (v19) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v14 = 1;
      }
    }
LABEL_16:

    id v10 = v28;
  }

  return v14;
}

+ (BOOL)tryUTF16WithByteOrderMarker:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  id v6 = a3;
  int v7 = [a1 data:v6 byteAtIndex:0];
  int v8 = [a1 data:v6 byteAtIndex:1];

  if (v7 == 254 && v8 == 255)
  {
    unint64_t v9 = 2415919360;
LABEL_7:
    a4->var0 = v9;
    BOOL result = 1;
    a4->var1 = 1;
    return result;
  }
  BOOL result = 0;
  if (v7 == 255 && v8 == 254)
  {
    unint64_t v9 = 2483028224;
    goto LABEL_7;
  }
  return result;
}

+ (BOOL)tryUTF16ByInferrence:(id)a3 analysis:(CNVCardDataAnalysis *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 length];
  if (v7 >= 0x16) {
    uint64_t v8 = 22;
  }
  else {
    uint64_t v8 = v7;
  }
  if (v7 < 0x16) {
    goto LABEL_16;
  }
  unint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  do
  {
    if (![a1 data:v6 byteAtIndex:v9]) {
      ++v11;
    }
    if (![a1 data:v6 byteAtIndex:v9 + 1]) {
      ++v10;
    }
    v9 += 2;
  }
  while (v9 < v8);
  double v12 = (double)v8 * 0.5;
  if ((double)v11 / v12 <= 0.8)
  {
    if ((double)v10 / v12 > 0.8)
    {
      unint64_t v13 = 2483028224;
      goto LABEL_15;
    }
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  unint64_t v13 = 2415919360;
LABEL_15:
  a4->var0 = v13;
  BOOL v14 = 1;
LABEL_17:

  return v14;
}

+ (unsigned)data:(id)a3 byteAtIndex:(unint64_t)a4
{
  unsigned __int8 v5 = 0;
  objc_msgSend(a3, "getBytes:range:", &v5, a4, 1);
  return v5;
}

+ (BOOL)data:(id)a3 hasPrefix:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "rangeOfData:options:range:", v5, 0, 0, objc_msgSend(v6, "length"));

  return v7 == 0;
}

+ (BOOL)data:(id)a3 containsSubdata:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "rangeOfData:options:range:", v5, 0, 0, objc_msgSend(v6, "length"));

  return v7 != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)data:(id)a3 byPrependingData:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA58];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 data];
  [v8 appendData:v6];

  [v8 appendData:v7];
  return v8;
}

@end