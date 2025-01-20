@interface EBString
+ (id)edStringFromXlString:(const void *)a3 edResources:(id)a4;
+ (void)xlStringFromEDString:(id)a3 state:(id)a4;
+ (void)xlStringWithIndex:(unsigned int)a3;
@end

@implementation EBString

+ (id)edStringFromXlString:(const void *)a3 edResources:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = objc_alloc_init(EDString);
    v7 = [NSString stringWithOcText:(char *)a3 + 8];
    [(EDString *)v6 setString:v7];

    if (((*((void *)a3 + 8) - *((void *)a3 + 7)) & 0x7FFFFFFF8) != 0)
    {
      v18 = v6;
      v8 = +[EDCollection collection];
      uint64_t v10 = *((void *)a3 + 7);
      uint64_t v9 = *((void *)a3 + 8);
      v11 = [(EDString *)v6 string];
      __int16 v12 = [v11 length];
      unint64_t v13 = v9 - v10;

      if (((v9 - v10) & 0x7FFFFFFF8) != 0)
      {
        uint64_t v14 = 0;
        do
        {
          v15 = *(__int16 **)(*((void *)a3 + 7) + 8 * v14);
          if (v15 && v12 > *v15)
          {
            v16 = +[EDRun runWithCharIndex:fontIndex:resources:](EDRun, "runWithCharIndex:fontIndex:resources:", *v15, +[EBFontTable edFontIndexFromXlFontIndex:v15[1]], v5);
            [v8 addObject:v16];
          }
          ++v14;
        }
        while ((v13 >> 3) != v14);
      }
      v6 = v18;
      [(EDString *)v18 setRuns:v8];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)xlStringFromEDString:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  if (v5)
  {
    uint64_t v9 = [v5 string];
    if ((unint64_t)[v9 length] >= 0xFFFF)
    {
      uint64_t v6 = [v9 substringToIndex:65534];

      uint64_t v9 = (void *)v6;
      +[TCMessageContext reportWarning:ECStringTooLong];
    }
    OcText::OcText(&v10);
    [v9 copyToOcText:&v10];
    operator new();
  }

  return 0;
}

+ (void)xlStringWithIndex:(unsigned int)a3
{
}

@end