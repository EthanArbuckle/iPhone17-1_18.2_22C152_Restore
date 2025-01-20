@interface LargeModularLayoutConstants
@end

@implementation LargeModularLayoutConstants

void ___LargeModularLayoutConstants_block_invoke(uint64_t a1, uint64_t a2)
{
  id v11 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F1C438]];
  char v4 = [@"ar" isEqualToString:v3];

  int IsTallScript = CLKLanguageIsTallScript();
  if (v4)
  {
    [v11 valueCompact:15.0 regular:18.0 luxoCompact:15.0 luxoRegular:18.0 aloeCompact:18.0 aloeRegular:20.0 agave:20.0 avoniaCompact:18.0 avoniaRegular:0x4034000000000000];
    uint64_t v7 = v6;
    if (!IsTallScript) {
      goto LABEL_8;
    }
LABEL_6:
    [v11 valueCompact:18.0 regular:20.0 luxoCompact:18.0 luxoRegular:20.0 aloeCompact:20.0 aloeRegular:22.0 agave:22.0 avoniaCompact:20.0 avoniaRegular:0x4036000000000000];
    goto LABEL_9;
  }
  if (IsTallScript)
  {
    [v11 valueCompact:18.0 regular:20.0 luxoCompact:18.0 luxoRegular:20.0 aloeCompact:20.0 aloeRegular:22.0 agave:22.0 avoniaCompact:20.0 avoniaRegular:0x4036000000000000];
    uint64_t v7 = v8;
    goto LABEL_6;
  }
  [v11 valueCompact:18.0 regular:20.5 luxoCompact:18.0 luxoRegular:20.5 aloeCompact:20.5 aloeRegular:23.0 agave:23.0 avoniaCompact:20.5 avoniaRegular:0x4037000000000000];
  uint64_t v7 = v10;
LABEL_8:
  [v11 valueCompact:17.0 regular:19.0 luxoCompact:17.0 luxoRegular:19.0 aloeCompact:19.0 aloeRegular:22.0 agave:22.0 avoniaCompact:20.0 avoniaRegular:0x4036000000000000];
LABEL_9:
  _LargeModularLayoutConstants___constants_0 = v7;
  _LargeModularLayoutConstants___constants_1 = v9;
  _LargeModularLayoutConstants___constants_2 = v9;
}

@end