@interface NTKFaceBackgroundStyleEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)backgroundStyle;
@end

@implementation NTKFaceBackgroundStyleEditOption

- (unint64_t)backgroundStyle
{
  v3 = [MEMORY[0x1E4F19A98] sharedMonitor];
  char v4 = [v3 shouldHideForSensitivity:NTKGossamerUISensitivity()];

  if (v4) {
    return 0;
  }

  return [(NTKValueEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return _EnumValueRange(0, 1uLL);
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  char v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3, a4);
  v5 = [v4 description];

  return v5;
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  char v4 = @"EDIT_OPTION_LABEL_FACE_BACKGROUND_STYLE_TINTED";
  if (a3 != 1) {
    char v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"EDIT_OPTION_LABEL_FACE_BACKGROUND_STYLE_BLACK";
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString;

  return v2;
}

void __64__NTKFaceBackgroundStyleEditOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E0408;
  v2[1] = &unk_1F16E0420;
  v3[0] = @"style 1";
  v3[1] = @"style 2";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString;
  _valueToFaceBundleStringDict_valueToFaceBundleString = v0;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end