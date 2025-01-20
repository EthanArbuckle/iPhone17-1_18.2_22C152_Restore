@interface OCPattern
+ (id)blackAndWhiteImageDataWithPatternName:(id)a3;
+ (id)colorizedImageDataWithBlackAndWhiteImageData:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5;
+ (id)presetPatternHeader;
@end

@implementation OCPattern

+ (id)blackAndWhiteImageDataWithPatternName:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[TCBundleResourceManager instance];
    v5 = [v4 dataForResource:v3 ofType:@"bmp" inPackage:@"OAPatterns" cacheResult:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)colorizedImageDataWithBlackAndWhiteImageData:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  uint64_t v11 = [v10 bytes];
  if ((unint64_t)[v10 length] >= 0x3F
    && *(unsigned char *)v11 == 66
    && *(unsigned char *)(v11 + 1) == 77
    && *(_DWORD *)(v11 + 14) == 40
    && *(_WORD *)(v11 + 26) == 1
    && *(_WORD *)(v11 + 28) == 1
    && !*(_DWORD *)(v11 + 30))
  {
    int v14 = [v8 ttColor];
    int v15 = [v9 ttColor];
    id v12 = (id) [v10 mutableCopy];
    v16 = (unsigned char *)[v12 mutableBytes];
    v16[54] = BYTE2(v14);
    v16[55] = BYTE1(v14);
    v16[56] = v14;
    v16[57] = 0;
    v16[58] = BYTE2(v15);
    v16[59] = BYTE1(v15);
    v16[60] = v15;
    v16[61] = 0;
  }
  else
  {
    id v12 = v10;
  }

  return v12;
}

+ (id)presetPatternHeader
{
  v2 = (void *)+[OCPattern presetPatternHeader]::thePresetPatternHeader;
  if (!+[OCPattern presetPatternHeader]::thePresetPatternHeader)
  {
    id v3 = +[TCBundleResourceManager instance];
    uint64_t v4 = [v3 dataForResource:@"patternHeader" ofType:@"bmp" inPackage:@"OAPatterns" cacheResult:1];
    v5 = (void *)+[OCPattern presetPatternHeader]::thePresetPatternHeader;
    +[OCPattern presetPatternHeader]::thePresetPatternHeader = v4;

    v2 = (void *)+[OCPattern presetPatternHeader]::thePresetPatternHeader;
  }
  return v2;
}

@end