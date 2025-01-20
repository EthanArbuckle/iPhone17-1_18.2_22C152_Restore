@interface UIImage(SystemNumberAware)
+ (BOOL)needsLocaleAwareNumbersWorkaroundForSymbol:()SystemNumberAware;
+ (id)systemImageNamedNumberAware:()SystemNumberAware config:;
+ (uint64_t)systemImageNamedNumberAware:()SystemNumberAware;
@end

@implementation UIImage(SystemNumberAware)

+ (BOOL)needsLocaleAwareNumbersWorkaroundForSymbol:()SystemNumberAware
{
  v3 = MapImageNameNumberAware(a3);
  BOOL v4 = v3 != 0;

  return v4;
}

+ (uint64_t)systemImageNamedNumberAware:()SystemNumberAware
{
  return [a1 systemImageNamedNumberAware:a3 config:0];
}

+ (id)systemImageNamedNumberAware:()SystemNumberAware config:
{
  id v5 = a3;
  id v6 = a4;
  v7 = MapImageNameNumberAware(v5);
  if (!v7) {
    goto LABEL_5;
  }
  v8 = [MEMORY[0x1E4FB1818] imageNamed:v7];
  v9 = v8;
  if (v6)
  {
    uint64_t v10 = [v8 imageByApplyingSymbolConfiguration:v6];

    v9 = (void *)v10;
  }
  if (!v9)
  {
LABEL_5:
    v9 = [MEMORY[0x1E4FB1818] systemImageNamed:v5];
  }

  return v9;
}

@end