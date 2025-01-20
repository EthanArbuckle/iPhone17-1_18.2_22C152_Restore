@interface CRLineWrappingClassifier
+ (BOOL)_lineWrappingShouldFallBackForLocale:(id)a3;
+ (BOOL)localeIsSupported:(id)a3;
+ (id)localeToModelMap;
+ (id)modelLocaleForLocale:(id)a3;
+ (id)urlOfModelForLocale:(id)a3;
- (CRLineWrappingClassifier)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (CRLineWrappingClassifier)initWithLocale:(id)a3;
- (MLModel)model;
- (NSString)locale;
- (NSString)modelLocale;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (unint64_t)featureCount;
@end

@implementation CRLineWrappingClassifier

+ (id)localeToModelMap
{
  if (qword_1EB58CB28 != -1) {
    dispatch_once(&qword_1EB58CB28, &__block_literal_global_15);
  }
  v2 = (void *)_MergedGlobals_19;
  return v2;
}

void __44__CRLineWrappingClassifier_localeToModelMap__block_invoke()
{
  v3[30] = *MEMORY[0x1E4F143B8];
  v2[0] = @"ar-SA";
  v2[1] = @"ars-SA";
  v3[0] = @"cr_lw_ar-SA.mlmodelc";
  v3[1] = @"cr_lw_ar-SA.mlmodelc";
  v2[2] = @"de-DE";
  v2[3] = @"en-US";
  v3[2] = @"cr_lw_de-DE.mlmodelc";
  v3[3] = @"cr_lw_en-US.mlmodelc";
  v2[4] = @"es-ES";
  v2[5] = @"fr-FR";
  v3[4] = @"cr_lw_es-ES.mlmodelc";
  v3[5] = @"cr_lw_fr-FR.mlmodelc";
  v2[6] = @"it-IT";
  v2[7] = @"ja-JP";
  v3[6] = @"cr_lw_it-IT.mlmodelc";
  v3[7] = @"cr_lw_ja-JP.mlmodelc";
  v2[8] = @"ko-KR";
  v2[9] = @"pt-BR";
  v3[8] = @"cr_lw_ko-KR.mlmodelc";
  v3[9] = @"cr_lw_pt-BR.mlmodelc";
  v2[10] = @"ru-RU";
  v2[11] = @"uk-UA";
  v3[10] = @"cr_lw_ru-RU.mlmodelc";
  v3[11] = @"cr_lw_uk-UA.mlmodelc";
  v2[12] = @"th-TH";
  v2[13] = @"vi-VT";
  v3[12] = @"cr_lw_th-TH.mlmodelc";
  v3[13] = @"cr_lw_vi-VT.mlmodelc";
  v2[14] = @"tr-TR";
  v2[15] = @"id-ID";
  v3[14] = @"cr_lw_en-US.mlmodelc";
  v3[15] = @"cr_lw_en-US.mlmodelc";
  v2[16] = @"cs-CZ";
  v2[17] = @"da-DK";
  v3[16] = @"cr_lw_en-US.mlmodelc";
  v3[17] = @"cr_lw_en-US.mlmodelc";
  v2[18] = @"nl-NL";
  v2[19] = @"no-NO";
  v3[18] = @"cr_lw_en-US.mlmodelc";
  v3[19] = @"cr_lw_en-US.mlmodelc";
  v2[20] = @"nn-NO";
  v2[21] = @"nb-NO";
  v3[20] = @"cr_lw_en-US.mlmodelc";
  v3[21] = @"cr_lw_en-US.mlmodelc";
  v2[22] = @"ms-MY";
  v2[23] = @"pl-PL";
  v3[22] = @"cr_lw_en-US.mlmodelc";
  v3[23] = @"cr_lw_en-US.mlmodelc";
  v2[24] = @"ro-RO";
  v2[25] = @"sv-SE";
  v3[24] = @"cr_lw_en-US.mlmodelc";
  v3[25] = @"cr_lw_en-US.mlmodelc";
  v2[26] = @"yue-Hans";
  v2[27] = @"yue-Hant";
  v3[26] = @"cr_lw_zh-Hans.mlmodelc";
  v3[27] = @"cr_lw_zh-Hans.mlmodelc";
  v2[28] = @"zh-Hans";
  v2[29] = @"zh-Hant";
  v3[28] = @"cr_lw_zh-Hans.mlmodelc";
  v3[29] = @"cr_lw_zh-Hans.mlmodelc";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:30];
  v1 = (void *)_MergedGlobals_19;
  _MergedGlobals_19 = v0;
}

+ (BOOL)localeIsSupported:(id)a3
{
  id v4 = a3;
  v5 = [a1 localeToModelMap];
  v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

+ (id)urlOfModelForLocale:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 localeToModelMap];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    v7 = [v6 stringByDeletingPathExtension];
    v8 = [v6 pathExtension];
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = [v9 pathForResource:v7 ofType:v8];
    if (v10)
    {
      v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
    }
    else
    {
      v12 = CROSLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v14 = 138412290;
        v15 = v7;
        _os_log_impl(&dword_1DD733000, v12, OS_LOG_TYPE_FAULT, "Failed to load resource: %@", (uint8_t *)&v14, 0xCu);
      }

      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)modelLocaleForLocale:(id)a3
{
  id v4 = (__CFString *)a3;
  if ([a1 _lineWrappingShouldFallBackForLocale:v4])
  {
    v5 = CRImageReaderLanguageEn_US;
LABEL_7:
    v6 = *v5;
    goto LABEL_8;
  }
  if (+[CRImageReader languageIsChinese:v4])
  {
    v5 = CRImageReaderLanguageZh_Hans;
    goto LABEL_7;
  }
  if (+[CRImageReader languageIsNorwegian:v4])
  {
    v5 = CRImageReaderLanguageNo_NO;
    goto LABEL_7;
  }
  if (+[CRImageReader languageIsArabic:v4]) {
    v6 = @"ar-SA";
  }
  else {
    v6 = v4;
  }
LABEL_8:
  v7 = v6;

  return v7;
}

- (CRLineWrappingClassifier)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLineWrappingClassifier;
  v7 = [(CRLineWrappingClassifier *)&v14 init];
  if (!v7)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v6 error:a4];
  model = v7->_model;
  v7->_model = (MLModel *)v8;

  if (!v7->_model)
  {
    v11 = CROSLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v12 = [v6 path];
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1DD733000, v11, OS_LOG_TYPE_FAULT, "Failed to load model: %@", buf, 0xCu);
    }
    goto LABEL_7;
  }
  v10 = v7;
LABEL_8:

  return v10;
}

- (CRLineWrappingClassifier)initWithLocale:(id)a3
{
  id v5 = a3;
  id v6 = +[CRLineWrappingClassifier urlOfModelForLocale:v5];
  if (v6)
  {
    objc_storeStrong((id *)&self->_locale, a3);
    self = [(CRLineWrappingClassifier *)self initWithContentsOfURL:v6 error:0];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)modelLocale
{
  v3 = objc_opt_class();
  id v4 = [(CRLineWrappingClassifier *)self locale];
  id v5 = [v3 modelLocaleForLocale:v4];

  return (NSString *)v5;
}

- (unint64_t)featureCount
{
  v2 = [(MLModel *)self->_model modelDescription];
  v3 = [v2 inputDescriptionsByName];
  id v4 = [v3 objectForKeyedSubscript:@"input"];
  id v5 = [v4 multiArrayConstraint];
  id v6 = [v5 shape];
  v7 = [v6 objectAtIndexedSubscript:0];
  unint64_t v8 = [v7 unsignedLongValue];

  return v8;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  model = self->_model;
  id v7 = a3;
  unint64_t v8 = [(MLModel *)model modelDescription];
  v9 = [v8 inputDescriptionsByName];
  v10 = [v9 objectForKeyedSubscript:@"input"];
  v11 = [v10 multiArrayConstraint];
  v12 = [v11 shape];
  v13 = [v12 objectAtIndexedSubscript:0];
  [v13 longValue];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1E9E0]);
  v15 = [(MLModel *)self->_model predictionFromFeatures:v7 options:v14 error:a4];

  uint64_t v16 = [v15 featureValueForName:@"classProbability"];
  uint64_t v17 = [v16 dictionaryValue];
  v18 = [v17 objectForKeyedSubscript:&unk_1F39330D0];

  if (v18)
  {
    v19 = [CRLineWrappingClassifierOutput alloc];
    [v18 doubleValue];
    v20 = -[CRLineWrappingClassifierOutput initWithWrappingProbability:](v19, "initWithWrappingProbability:");
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)_lineWrappingShouldFallBackForLocale:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"tr-TR"] & 1) != 0
    || ([v3 isEqualToString:@"id-ID"] & 1) != 0
    || ([v3 isEqualToString:@"cs-CZ"] & 1) != 0
    || ([v3 isEqualToString:@"da-DK"] & 1) != 0
    || ([v3 isEqualToString:@"nl-NL"] & 1) != 0
    || ([v3 isEqualToString:@"no-NO"] & 1) != 0
    || ([v3 isEqualToString:@"nn-NO"] & 1) != 0
    || ([v3 isEqualToString:@"nb-NO"] & 1) != 0
    || ([v3 isEqualToString:@"ms-MY"] & 1) != 0
    || ([v3 isEqualToString:@"pl-PL"] & 1) != 0
    || ([v3 isEqualToString:@"ro-RO"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"sv-SE"];
  }

  return v4;
}

- (MLModel)model
{
  return self->_model;
}

- (NSString)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end