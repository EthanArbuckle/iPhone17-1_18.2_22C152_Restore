@interface PDUtils
+ (const)getPresets;
+ (id)getPresetName:(int)a3;
+ (int)getPresetFromName:(id)a3;
+ (int)getPresetFromOperationModeNumber:(unsigned __int16)a3;
@end

@implementation PDUtils

+ (id)getPresetName:(int)a3
{
  if (a3 <= 3)
  {
    id v4 = (id)(+[PDUtils getPresets] + 16 * a3)[8];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (const)getPresets
{
  return (const PresetName *)&+[PDUtils getPresets]::PRESETS;
}

+ (int)getPresetFromName:(id)a3
{
  id v3 = a3;
  id v4 = +[PDUtils getPresets];
  if (![v3 caseInsensitiveCompare:v4->var1])
  {
    uint64_t v6 = 0;
LABEL_10:
    int var0 = v4[v6].var0;
    goto LABEL_11;
  }
  if (![v3 caseInsensitiveCompare:v4[1].var1])
  {
    uint64_t v6 = 1;
    goto LABEL_10;
  }
  if (![v3 caseInsensitiveCompare:v4[2].var1])
  {
    uint64_t v6 = 2;
    goto LABEL_10;
  }
  if (![v3 caseInsensitiveCompare:v4[3].var1])
  {
    uint64_t v6 = 3;
    goto LABEL_10;
  }
  int var0 = -1;
LABEL_11:

  return var0;
}

+ (int)getPresetFromOperationModeNumber:(unsigned __int16)a3
{
  return 0;
}

@end