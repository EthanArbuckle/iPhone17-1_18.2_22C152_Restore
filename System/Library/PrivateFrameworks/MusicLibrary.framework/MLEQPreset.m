@interface MLEQPreset
+ (id)eqPresetForBuiltInPresetType:(int)a3;
+ (id)eqPresetForName:(id)a3;
- (MLEQPreset)initWithBuiltInPresetType:(int)a3;
- (id)localizedName;
- (id)name;
- (int)builtInPresetType;
- (int)typeForAVController;
@end

@implementation MLEQPreset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (int)typeForAVController
{
  int builtInPresetType = self->_builtInPresetType;
  if (builtInPresetType == 122) {
    return 0;
  }
  else {
    return builtInPresetType - 99;
  }
}

- (int)builtInPresetType
{
  return self->_builtInPresetType;
}

- (id)localizedName
{
  return self->_localizedName;
}

- (id)name
{
  return self->_name;
}

- (MLEQPreset)initWithBuiltInPresetType:(int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MLEQPreset;
  v4 = [(MLEQPreset *)&v10 init];
  if (v4)
  {
    uint64_t v5 = MLNSStringForBuiltInPreset(a3, 0);
    name = v4->_name;
    v4->_name = (NSString *)v5;

    uint64_t v7 = MLNSStringForBuiltInPreset(a3, 1);
    localizedName = v4->_localizedName;
    v4->_localizedName = (NSString *)v7;

    v4->_int builtInPresetType = a3;
  }
  return v4;
}

+ (id)eqPresetForBuiltInPresetType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!sPresetsByBuiltInType
    || (CFDictionaryGetValue((CFDictionaryRef)sPresetsByBuiltInType, (const void *)a3),
        (v4 = (MLEQPreset *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v5 = [[MLEQPreset alloc] initWithBuiltInPresetType:v3];
    Mutable = (__CFDictionary *)sPresetsByBuiltInType;
    if (!sPresetsByBuiltInType)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
      sPresetsByBuiltInType = (uint64_t)Mutable;
    }
    CFDictionarySetValue(Mutable, (const void *)[(MLEQPreset *)v5 builtInPresetType], v5);
    v4 = v5;
    uint64_t v7 = (__CFDictionary *)sPresetsByPresetName;
    if (!sPresetsByPresetName)
    {
      uint64_t v7 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      sPresetsByPresetName = (uint64_t)v7;
    }
    CFDictionarySetValue(v7, [(MLEQPreset *)v4 name], v4);
  }

  return v4;
}

+ (id)eqPresetForName:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
LABEL_11:
    v4 = 0;
    goto LABEL_12;
  }
  if (!sPresetsByPresetName
    || (CFDictionaryGetValue((CFDictionaryRef)sPresetsByPresetName, v3),
        (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v5 = 100;
    while (1)
    {
      v6 = MLNSStringForBuiltInPreset(v5, 0);
      char v7 = [v6 isEqualToString:v3];

      if (v7) {
        break;
      }
      uint64_t v5 = (v5 + 1);
      if (v5 == 123) {
        goto LABEL_9;
      }
    }
    v4 = +[MLEQPreset eqPresetForBuiltInPresetType:v5];
    if (v4) {
      goto LABEL_12;
    }
LABEL_9:
    v8 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    v9 = [v3 stringByTrimmingCharactersInSet:v8];
    uint64_t v10 = [v9 intValue];

    if ((v10 - 100) <= 0x15)
    {
      v4 = +[MLEQPreset eqPresetForBuiltInPresetType:v10];
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:

  return v4;
}

@end