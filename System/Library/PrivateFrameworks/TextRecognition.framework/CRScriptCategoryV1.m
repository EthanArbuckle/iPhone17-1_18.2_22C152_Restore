@interface CRScriptCategoryV1
+ (float)confidenceThreshold;
+ (id)arabic;
+ (id)chinese;
+ (id)common;
+ (id)japanese;
+ (id)korean;
+ (id)latinCyrillic;
+ (id)sequenceScriptForCategory:(id)a3;
+ (id)supportedCategories;
+ (id)thai;
+ (id)unknown;
+ (id)verticalLayoutSupportedCategories;
+ (unint64_t)categoryRevision;
- (BOOL)isEqual:(id)a3;
- (NSArray)scriptLocales;
- (NSString)categoryName;
- (id)description;
- (unint64_t)categoryRevision;
- (unint64_t)hash;
@end

@implementation CRScriptCategoryV1

- (NSArray)scriptLocales
{
  v2 = self;
  uint64_t v3 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CRScriptCategoryV1_localesForScriptCategory___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  if (qword_1EB58CB68 != -1) {
    dispatch_once(&qword_1EB58CB68, block);
  }
  v4 = [(id)qword_1EB58CB60 objectForKeyedSubscript:v2];

  return (NSArray *)v4;
}

- (NSString)categoryName
{
  uint64_t v3 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CRScriptCategoryV1_categoryNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  if (qword_1EB58CB50 != -1) {
    dispatch_once(&qword_1EB58CB50, block);
  }
  id v4 = (id)qword_1EB58CB58;
  if (self) {
    unint64_t categoryValue = self->_categoryValue;
  }
  else {
    unint64_t categoryValue = 0;
  }
  v6 = [NSNumber numberWithUnsignedInteger:categoryValue];
  v7 = [v4 objectForKey:v6];

  return (NSString *)v7;
}

- (unint64_t)categoryRevision
{
  return +[CRScriptCategoryV1 categoryRevision];
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CRScriptCategoryV1;
  id v4 = [(CRScriptCategoryV1 *)&v8 description];
  v5 = [(CRScriptCategoryV1 *)self categoryName];
  v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

+ (unint64_t)categoryRevision
{
  return 1;
}

+ (id)sequenceScriptForCategory:(id)a3
{
  uint64_t v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
  {
    unint64_t v6 = v3[1] - 1;
    if (v6 > 6) {
      v5 = 0;
    }
    else {
      v5 = off_1E6CDB7E0[v6];
    }
  }

  return v5;
}

+ (id)supportedCategories
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CRScriptCategoryV1_supportedCategories__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_20 != -1) {
    dispatch_once(&_MergedGlobals_20, block);
  }
  v2 = (void *)qword_1EB58CB38;
  return v2;
}

void __41__CRScriptCategoryV1_supportedCategories__block_invoke()
{
  v10[8] = *MEMORY[0x1E4F143B8];
  v0 = +[CRScriptCategoryV1 unknown]();
  v10[0] = v0;
  v1 = +[CRScriptCategoryV1 common]();
  v10[1] = v1;
  v2 = +[CRScriptCategoryV1 latinCyrillic]();
  v10[2] = v2;
  uint64_t v3 = +[CRScriptCategoryV1 chinese]();
  v10[3] = v3;
  id v4 = +[CRScriptCategoryV1 japanese]();
  v10[4] = v4;
  v5 = +[CRScriptCategoryV1 korean]();
  v10[5] = v5;
  unint64_t v6 = +[CRScriptCategoryV1 thai]();
  v10[6] = v6;
  v7 = +[CRScriptCategoryV1 arabic]();
  v10[7] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:8];
  v9 = (void *)qword_1EB58CB38;
  qword_1EB58CB38 = v8;
}

+ (id)unknown
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CRScriptCategoryV1_unknown__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1EB58CB70 != -1) {
    dispatch_once(&qword_1EB58CB70, block);
  }
  v1 = (void *)qword_1EB58CB78;
  return v1;
}

+ (id)common
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CRScriptCategoryV1_common__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1EB58CB80 != -1) {
    dispatch_once(&qword_1EB58CB80, block);
  }
  v1 = (void *)qword_1EB58CB88;
  return v1;
}

+ (id)latinCyrillic
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CRScriptCategoryV1_latinCyrillic__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1EB58CB90 != -1) {
    dispatch_once(&qword_1EB58CB90, block);
  }
  v1 = (void *)qword_1EB58CB98;
  return v1;
}

+ (id)chinese
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CRScriptCategoryV1_chinese__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1EB58CBA0 != -1) {
    dispatch_once(&qword_1EB58CBA0, block);
  }
  v1 = (void *)qword_1EB58CBA8;
  return v1;
}

+ (id)japanese
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CRScriptCategoryV1_japanese__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1EB58CBC0 != -1) {
    dispatch_once(&qword_1EB58CBC0, block);
  }
  v1 = (void *)qword_1EB58CBC8;
  return v1;
}

+ (id)korean
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CRScriptCategoryV1_korean__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1EB58CBB0 != -1) {
    dispatch_once(&qword_1EB58CBB0, block);
  }
  v1 = (void *)qword_1EB58CBB8;
  return v1;
}

+ (id)thai
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CRScriptCategoryV1_thai__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1EB58CBD0 != -1) {
    dispatch_once(&qword_1EB58CBD0, block);
  }
  v1 = (void *)qword_1EB58CBD8;
  return v1;
}

+ (id)arabic
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CRScriptCategoryV1_arabic__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1EB58CBE0 != -1) {
    dispatch_once(&qword_1EB58CBE0, block);
  }
  v1 = (void *)qword_1EB58CBE8;
  return v1;
}

+ (id)verticalLayoutSupportedCategories
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CRScriptCategoryV1_verticalLayoutSupportedCategories__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB58CB40 != -1) {
    dispatch_once(&qword_1EB58CB40, block);
  }
  v2 = (void *)qword_1EB58CB48;
  return v2;
}

void __55__CRScriptCategoryV1_verticalLayoutSupportedCategories__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[CRScriptCategoryV1 japanese]();
  v5[0] = v0;
  v1 = +[CRScriptCategoryV1 chinese]();
  v5[1] = v1;
  v2 = +[CRScriptCategoryV1 korean]();
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  id v4 = (void *)qword_1EB58CB48;
  qword_1EB58CB48 = v3;
}

void __35__CRScriptCategoryV1_categoryNames__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "supportedCategories", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        if (v8)
        {
          switch(*(void *)(v8 + 8))
          {
            case 0:
              goto LABEL_8;
            case 1:
              v9 = [NSNumber numberWithUnsignedInteger:1];
              v10 = v2;
              v11 = @"CommonV1";
              goto LABEL_16;
            case 2:
              v9 = [NSNumber numberWithUnsignedInteger:2];
              v10 = v2;
              v11 = @"LatinCyrillicV1";
              goto LABEL_16;
            case 3:
              v9 = [NSNumber numberWithUnsignedInteger:3];
              v10 = v2;
              v11 = @"ChineseV1";
              goto LABEL_16;
            case 4:
              v9 = [NSNumber numberWithUnsignedInteger:4];
              v10 = v2;
              v11 = @"KoreanV1";
              goto LABEL_16;
            case 5:
              v9 = [NSNumber numberWithUnsignedInteger:5];
              v10 = v2;
              v11 = @"JapaneseV1";
              goto LABEL_16;
            case 6:
              v9 = [NSNumber numberWithUnsignedInteger:6];
              v10 = v2;
              v11 = @"ThaiV1";
              goto LABEL_16;
            case 7:
              v9 = [NSNumber numberWithUnsignedInteger:7];
              v10 = v2;
              v11 = @"ArabicV1";
              goto LABEL_16;
            default:
              break;
          }
        }
        else
        {
LABEL_8:
          v9 = [NSNumber numberWithUnsignedInteger:0];
          v10 = v2;
          v11 = @"UnknownV1";
LABEL_16:
          [v10 setObject:v11 forKeyedSubscript:v9];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v12 = [v2 copy];
  v13 = (void *)qword_1EB58CB58;
  qword_1EB58CB58 = v12;
}

void __47__CRScriptCategoryV1_localesForScriptCategory___block_invoke()
{
  v24[8] = *MEMORY[0x1E4F143B8];
  long long v16 = +[CRScriptCategoryV1 common]();
  v23[0] = v16;
  uint64_t v0 = MEMORY[0x1E4F1CBF0];
  v24[0] = MEMORY[0x1E4F1CBF0];
  long long v15 = +[CRScriptCategoryV1 unknown]();
  v23[1] = v15;
  v24[1] = v0;
  long long v14 = +[CRScriptCategoryV1 latinCyrillic]();
  v23[2] = v14;
  v22[0] = @"en-US";
  v22[1] = @"pt-BR";
  v22[2] = @"fr-FR";
  v22[3] = @"it-IT";
  v22[4] = @"de-DE";
  v22[5] = @"es-ES";
  v22[6] = @"ru-RU";
  v22[7] = @"uk-UA";
  v22[8] = @"vi-VT";
  v22[9] = @"tr-TR";
  v22[10] = @"id-ID";
  v22[11] = @"cs-CZ";
  v22[12] = @"da-DK";
  v22[13] = @"nl-NL";
  v22[14] = @"no-NO";
  v22[15] = @"nn-NO";
  v22[16] = @"nb-NO";
  v22[17] = @"ms-MY";
  v22[18] = @"pl-PL";
  v22[19] = @"ro-RO";
  v22[20] = @"sv-SE";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:21];
  v24[2] = v13;
  v1 = +[CRScriptCategoryV1 chinese]();
  v23[3] = v1;
  v21[0] = @"zh-Hans";
  v21[1] = @"zh-Hant";
  v21[2] = @"yue-Hans";
  v21[3] = @"yue-Hant";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  v24[3] = v2;
  uint64_t v3 = +[CRScriptCategoryV1 korean]();
  v23[4] = v3;
  v20 = @"ko-KR";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v24[4] = v4;
  uint64_t v5 = +[CRScriptCategoryV1 japanese]();
  v23[5] = v5;
  uint64_t v19 = @"ja-JP";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v24[5] = v6;
  uint64_t v7 = +[CRScriptCategoryV1 thai]();
  v23[6] = v7;
  v18 = @"th-TH";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v24[6] = v8;
  v9 = +[CRScriptCategoryV1 arabic]();
  v23[7] = v9;
  v17[0] = @"ar-SA";
  v17[1] = @"ars-SA";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v24[7] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
  uint64_t v12 = (void *)qword_1EB58CB60;
  qword_1EB58CB60 = v11;
}

+ (float)confidenceThreshold
{
  return 0.1;
}

void __29__CRScriptCategoryV1_unknown__block_invoke(uint64_t a1)
{
  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1) {
      v1[1] = 0;
    }
  }
  v2 = (void *)qword_1EB58CB78;
  qword_1EB58CB78 = (uint64_t)v1;
}

void __28__CRScriptCategoryV1_common__block_invoke(uint64_t a1)
{
  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1) {
      v1[1] = 1;
    }
  }
  v2 = (void *)qword_1EB58CB88;
  qword_1EB58CB88 = (uint64_t)v1;
}

void __35__CRScriptCategoryV1_latinCyrillic__block_invoke(uint64_t a1)
{
  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1) {
      v1[1] = 2;
    }
  }
  v2 = (void *)qword_1EB58CB98;
  qword_1EB58CB98 = (uint64_t)v1;
}

void __29__CRScriptCategoryV1_chinese__block_invoke(uint64_t a1)
{
  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1) {
      v1[1] = 3;
    }
  }
  v2 = (void *)qword_1EB58CBA8;
  qword_1EB58CBA8 = (uint64_t)v1;
}

void __28__CRScriptCategoryV1_korean__block_invoke(uint64_t a1)
{
  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1) {
      v1[1] = 4;
    }
  }
  v2 = (void *)qword_1EB58CBB8;
  qword_1EB58CBB8 = (uint64_t)v1;
}

void __30__CRScriptCategoryV1_japanese__block_invoke(uint64_t a1)
{
  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1) {
      v1[1] = 5;
    }
  }
  v2 = (void *)qword_1EB58CBC8;
  qword_1EB58CBC8 = (uint64_t)v1;
}

void __26__CRScriptCategoryV1_thai__block_invoke(uint64_t a1)
{
  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1) {
      v1[1] = 6;
    }
  }
  v2 = (void *)qword_1EB58CBD8;
  qword_1EB58CBD8 = (uint64_t)v1;
}

void __28__CRScriptCategoryV1_arabic__block_invoke(uint64_t a1)
{
  v1 = objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)CRScriptCategoryV1;
    v1 = objc_msgSendSuper2(&v3, sel_init);
    if (v1) {
      v1[1] = 7;
    }
  }
  v2 = (void *)qword_1EB58CBE8;
  qword_1EB58CBE8 = (uint64_t)v1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v7 = 0;
    goto LABEL_7;
  }
  if (!self)
  {
    unint64_t categoryValue = 0;
    if (v4) {
      goto LABEL_4;
    }
LABEL_9:
    uint64_t v6 = 0;
    goto LABEL_5;
  }
  unint64_t categoryValue = self->_categoryValue;
  if (!v4) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v6 = v4[1];
LABEL_5:
  BOOL v7 = categoryValue == v6;
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  if (self) {
    return *(void *)(self + 8);
  }
  return self;
}

@end