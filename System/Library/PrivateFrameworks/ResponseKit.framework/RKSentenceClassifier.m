@interface RKSentenceClassifier
+ (BOOL)canClassifyLanguageIdentifier:(id)a3;
+ (Class)subclassForLanguageIdentifier:(id)a3;
+ (Class)subclassForLocale:(id)a3;
+ (id)alternativeInversionsForLanguage:(id)a3;
+ (id)appreciationKeywordsForLanguage:(id)a3;
+ (id)categoryKeywordMapForLanguage:(id)a3;
+ (id)languageIdentifierFromClassName;
+ (id)polarTagRegularExpressionForLanguage:(id)a3;
+ (id)preProcessTextMessageForLinguisticTagger:(id)a3 withLocale:(id)a4;
+ (id)sensitiveSubjectRegularExpressionForLanguage:(id)a3;
+ (id)sentenceClassification:(id)a3 withLanguageIdentifier:(id)a4 options:(unint64_t)a5;
+ (id)stringFromLexicalEntities:(id)a3;
- (BOOL)sentenceHasAlternativeConjunction;
- (BOOL)sentenceHasQuestionTerminator;
- (BOOL)sentenceIsAllSymbols;
- (BOOL)sentenceIsTerminated;
- (NSArray)alternativeConjunctions;
- (NSArray)alternatives;
- (NSArray)appreciations;
- (NSArray)choiceDelimiters;
- (NSArray)dataDetected;
- (NSArray)interrogatives;
- (NSArray)inversions;
- (NSArray)matchedRanges;
- (NSArray)sentenceEntities;
- (NSMutableDictionary)lemmaAvailabilityByLanguage;
- (NSMutableDictionary)partofSpeechAvailabilityByLanguage;
- (NSString)RKLinguisticTagDataDetected;
- (NSString)languageIdentifier;
- (NSString)sentenceString;
- (NSString)sentenceStringOriginal;
- (NSValue)sentenceTag;
- (RKSentenceClassifier)init;
- (id)addSentenceTerminatorQuestion:(id)a3;
- (id)classifySentence;
- (id)lexicalEntitiesFromString:(id)a3;
- (id)sentenceClassification:(id)a3 options:(unint64_t)a4;
- (void)analyzeSentence;
- (void)setAlternatives:(id)a3;
- (void)setAppreciations:(id)a3;
- (void)setChoiceDelimiters:(id)a3;
- (void)setDataDetected:(id)a3;
- (void)setInterrogatives:(id)a3;
- (void)setInversions:(id)a3;
- (void)setLemmaAvailabilityByLanguage:(id)a3;
- (void)setMatchedRanges:(id)a3;
- (void)setPartofSpeechAvailabilityByLanguage:(id)a3;
- (void)setRKLinguisticTagDataDetected:(id)a3;
- (void)setSentenceEntities:(id)a3;
- (void)setSentenceHasAlternativeConjunction:(BOOL)a3;
- (void)setSentenceHasQuestionTerminator:(BOOL)a3;
- (void)setSentenceIsAllSymbols:(BOOL)a3;
- (void)setSentenceIsTerminated:(BOOL)a3;
- (void)setSentenceString:(id)a3;
- (void)setSentenceStringOriginal:(id)a3;
- (void)setSentenceTag:(id)a3;
@end

@implementation RKSentenceClassifier

void __46__RKSentenceClassifier_ko_KO_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __45__RKSentenceClassifier_fr_FR_analyzeSentence__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v35[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  v7 = [v5 partOfSpeech];
  LODWORD(v6) = [v6 containsObject:v7];

  if (!v6) {
    goto LABEL_22;
  }
  uint64_t v33 = a3;
  uint64_t v8 = a3 - 1;
  if (a3 < 1)
  {
    v10 = 0;
  }
  else
  {
    v9 = [*(id *)(a1 + 40) sentenceEntities];
    v10 = [v9 objectAtIndexedSubscript:a3 - 1];
  }
  uint64_t v11 = *MEMORY[0x263F081F8];
  uint64_t v12 = *MEMORY[0x263F08228];
  uint64_t v13 = *MEMORY[0x263F08220];
  while (1)
  {
    v35[0] = v11;
    v35[1] = v12;
    v35[2] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
    v15 = [v10 partOfSpeech];
    if (![v14 containsObject:v15]) {
      break;
    }

    if (v8-- < 1) {
      goto LABEL_11;
    }
    v17 = [*(id *)(a1 + 40) sentenceEntities];
    uint64_t v18 = [v17 objectAtIndexedSubscript:v8];

    v10 = (void *)v18;
  }

  if (v8 >= 1)
  {
    v19 = [*(id *)(a1 + 40) sentenceEntities];
    v20 = [v19 objectAtIndexedSubscript:v8 - 1];

    goto LABEL_12;
  }
LABEL_11:
  v20 = 0;
LABEL_12:
  v34[0] = v11;
  v34[1] = v13;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  v22 = [v10 partOfSpeech];
  if ([v21 containsObject:v22])
  {

    if (v8 < 2) {
      goto LABEL_16;
    }
    v21 = [*(id *)(a1 + 40) sentenceEntities];
    [v21 objectAtIndexedSubscript:v8 - 2];
    v20 = v22 = v20;
  }

LABEL_16:
  v23 = [v10 partOfSpeech];
  uint64_t v24 = *MEMORY[0x263F082E8];
  int v25 = [v23 isEqualToString:*MEMORY[0x263F082E8]];

  if (v25)
  {
    if (!v20
      || (v26 = *(void **)(a1 + 32),
          [v20 partOfSpeech],
          v27 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v26) = [v26 containsObject:v27],
          v27,
          (v26 & 1) == 0))
    {
      v28 = [v20 partOfSpeech];
      char v29 = [v28 isEqualToString:v24];

      if ((v29 & 1) == 0)
      {
        v30 = [*(id *)(a1 + 40) inversions];
        v31 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v8, v33 - v8 + 1);
        v32 = [v30 arrayByAddingObject:v31];
        [*(id *)(a1 + 40) setInversions:v32];
      }
    }
  }

LABEL_22:
}

void __46__RKSentenceClassifier_fr_FR_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  id v6 = [v16 objectForKeyedSubscript:@"range"];
  unint64_t v7 = [v6 rangeValue];

  uint64_t v8 = [*(id *)(a1 + 32) inversions];
  if ([v8 count])
  {
    v9 = [*(id *)(a1 + 32) inversions];
    v10 = [v9 objectAtIndexedSubscript:0];
    uint64_t v11 = [v10 rangeValue];
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v7 < v11 + v13)
  {
    v14 = [v16 objectForKeyedSubscript:@"category"];
    objc_msgSend(*(id *)(a1 + 40), "setSentenceType:", objc_msgSend(v14, "unsignedIntegerValue"));

    v15 = [v16 objectForKeyedSubscript:@"gender"];
    objc_msgSend(*(id *)(a1 + 40), "setGender:", objc_msgSend(v15, "unsignedIntegerValue"));
  }
  *a4 = 1;
}

uint64_t __46__RKSentenceClassifier_fr_FR_classifySentence__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) setSentenceType:2];
  *a4 = 1;
  return result;
}

void __46__RKSentenceClassifier_tr_TR_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  unint64_t v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_el_GR_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  unint64_t v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_ar_AE_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  unint64_t v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_th_TH_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  unint64_t v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

- (NSArray)alternativeConjunctions
{
  return 0;
}

+ (id)languageIdentifierFromClassName
{
  v3 = NSStringFromClass((Class)a1);
  v4 = NSStringFromClass((Class)[a1 superclass]);
  id v5 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v4, "length") + 1);
  id v6 = [v5 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  return v6;
}

- (RKSentenceClassifier)init
{
  v11.receiver = self;
  v11.super_class = (Class)RKSentenceClassifier;
  v2 = [(RKSentenceClassifier *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() languageIdentifierFromClassName];
    languageIdentifier = v2->_languageIdentifier;
    v2->_languageIdentifier = (NSString *)v3;

    id v5 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v2->_languageIdentifier];
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_2);
    }
    id v6 = [(id)partofSpeechAvailabilityByLanguage objectForKeyedSubscript:v5];
    if (!v6)
    {
      unint64_t v7 = [(id)lemmaAvailabilityByLanguage objectForKeyedSubscript:v5];

      if (v7) {
        goto LABEL_7;
      }
      id v6 = [MEMORY[0x263F08948] availableTagSchemesForLanguage:v5];
      v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "containsObject:", *MEMORY[0x263F082B8]));
      [(id)partofSpeechAvailabilityByLanguage setObject:v9 forKeyedSubscript:v5];

      v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "containsObject:", *MEMORY[0x263F082B0]));
      [(id)lemmaAvailabilityByLanguage setObject:v10 forKeyedSubscript:v5];
    }
LABEL_7:
  }
  return v2;
}

uint64_t __28__RKSentenceClassifier_init__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)partofSpeechAvailabilityByLanguage;
  partofSpeechAvailabilityByLanguage = v0;

  lemmaAvailabilityByLanguage = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

+ (Class)subclassForLanguageIdentifier:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && ([v3 isEqualToString:@"und"] & 1) == 0)
  {
    id v5 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    id v6 = [@"RKSentenceClassifier_" stringByAppendingString:v5];
    unint64_t v7 = NSClassFromString(v6);

    if (objc_opt_class()) {
      goto LABEL_10;
    }
  }
  if (subclassForLanguageIdentifier__onceToken == -1)
  {
    if (!v4)
    {
LABEL_8:
      uint64_t v8 = (void *)MEMORY[0x263EFF960];
      v9 = [MEMORY[0x263EFF960] currentLocale];
      v10 = [v9 localeIdentifier];
      uint64_t v11 = [v8 canonicalLanguageIdentifierFromString:v10];

      v4 = (void *)v11;
      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&subclassForLanguageIdentifier__onceToken, &__block_literal_global_120);
    if (!v4) {
      goto LABEL_8;
    }
  }
  if ([v4 isEqualToString:@"und"]) {
    goto LABEL_8;
  }
LABEL_9:
  id v5 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v4];
  unint64_t v7 = [(id)sSubclasses objectForKeyedSubscript:v5];
LABEL_10:

  return (Class)v7;
}

void __54__RKSentenceClassifier_subclassForLanguageIdentifier___block_invoke()
{
  v3[33] = *MEMORY[0x263EF8340];
  v2[0] = @"ar";
  v3[0] = NSClassFromString(&cfstr_Rksentenceclas_0.isa);
  v2[1] = @"ca";
  v3[1] = NSClassFromString(&cfstr_Rksentenceclas_1.isa);
  v2[2] = @"cs";
  v3[2] = NSClassFromString(&cfstr_Rksentenceclas_2.isa);
  v2[3] = @"da";
  v3[3] = NSClassFromString(&cfstr_Rksentenceclas_3.isa);
  v2[4] = @"de";
  v3[4] = NSClassFromString(&cfstr_Rksentenceclas_4.isa);
  v2[5] = @"el";
  v3[5] = NSClassFromString(&cfstr_Rksentenceclas_5.isa);
  v2[6] = @"en";
  v3[6] = NSClassFromString(&cfstr_Rksentenceclas_6.isa);
  v2[7] = @"es";
  v3[7] = NSClassFromString(&cfstr_Rksentenceclas_7.isa);
  v2[8] = @"fr";
  v3[8] = NSClassFromString(&cfstr_Rksentenceclas_8.isa);
  v2[9] = @"fi";
  v3[9] = NSClassFromString(&cfstr_Rksentenceclas_9.isa);
  v2[10] = @"he";
  v3[10] = NSClassFromString(&cfstr_Rksentenceclas_10.isa);
  v2[11] = @"hi";
  v3[11] = NSClassFromString(&cfstr_Rksentenceclas_11.isa);
  v2[12] = @"hr";
  v3[12] = NSClassFromString(&cfstr_Rksentenceclas_12.isa);
  v2[13] = @"hu";
  v3[13] = NSClassFromString(&cfstr_Rksentenceclas_13.isa);
  v2[14] = @"id";
  v3[14] = NSClassFromString(&cfstr_Rksentenceclas_14.isa);
  v2[15] = @"it";
  v3[15] = NSClassFromString(&cfstr_Rksentenceclas_15.isa);
  v2[16] = @"ja";
  v3[16] = NSClassFromString(&cfstr_Rksentenceclas_16.isa);
  v2[17] = @"ko-Kore";
  v3[17] = NSClassFromString(&cfstr_Rksentenceclas_17.isa);
  v2[18] = @"ms";
  v3[18] = NSClassFromString(&cfstr_Rksentenceclas_18.isa);
  v2[19] = @"nl";
  v3[19] = NSClassFromString(&cfstr_Rksentenceclas_19.isa);
  v2[20] = @"nb";
  v3[20] = NSClassFromString(&cfstr_Rksentenceclas_20.isa);
  v2[21] = @"pl";
  v3[21] = NSClassFromString(&cfstr_Rksentenceclas_21.isa);
  v2[22] = @"pt";
  v3[22] = NSClassFromString(&cfstr_Rksentenceclas_22.isa);
  v2[23] = @"ro";
  v3[23] = NSClassFromString(&cfstr_Rksentenceclas_23.isa);
  v2[24] = @"ru";
  v3[24] = NSClassFromString(&cfstr_Rksentenceclas_24.isa);
  v2[25] = @"sk";
  v3[25] = NSClassFromString(&cfstr_Rksentenceclas_25.isa);
  v2[26] = @"sv";
  v3[26] = NSClassFromString(&cfstr_Rksentenceclas_26.isa);
  v2[27] = @"th";
  v3[27] = NSClassFromString(&cfstr_Rksentenceclas_27.isa);
  v2[28] = @"tr";
  v3[28] = NSClassFromString(&cfstr_Rksentenceclas_28.isa);
  v2[29] = @"vi";
  v3[29] = NSClassFromString(&cfstr_Rksentenceclas_29.isa);
  v2[30] = @"uk";
  v3[30] = NSClassFromString(&cfstr_Rksentenceclas_30.isa);
  v2[31] = @"zh-Hans";
  v3[31] = NSClassFromString(&cfstr_Rksentenceclas_31.isa);
  v2[32] = @"zh-Hant";
  v3[32] = NSClassFromString(&cfstr_Rksentenceclas_32.isa);
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:33];
  v1 = (void *)sSubclasses;
  sSubclasses = v0;
}

+ (Class)subclassForLocale:(id)a3
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x263EFF960];
    id v5 = [a3 localeIdentifier];
    id v6 = [v4 canonicalLanguageIdentifierFromString:v5];
  }
  else
  {
    id v6 = 0;
  }
  unint64_t v7 = [a1 subclassForLanguageIdentifier:v6];

  return (Class)v7;
}

+ (BOOL)canClassifyLanguageIdentifier:(id)a3
{
  return [a1 subclassForLanguageIdentifier:a3] != 0;
}

+ (id)categoryKeywordMapForLanguage:(id)a3
{
  id v3 = a3;
  if (categoryKeywordMapForLanguage__onceToken != -1) {
    dispatch_once(&categoryKeywordMapForLanguage__onceToken, &__block_literal_global_322);
  }
  v4 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v3];
  id v5 = [(id)categoryKeywordMapForLanguage__categoryKeywordMap objectForKeyedSubscript:v4];

  if (!v5)
  {
    if ((unint64_t)[(id)categoryKeywordMapForLanguage__categoryKeywordMap count] >= 2) {
      [(id)categoryKeywordMapForLanguage__categoryKeywordMap removeAllObjects];
    }
    id v6 = +[RKAssets categoryKeywordMap];
    unint64_t v7 = [v6 objectForKeyedSubscript:v4];

    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__RKSentenceClassifier_categoryKeywordMapForLanguage___block_invoke_2;
    v13[3] = &unk_2642D20C0;
    id v14 = v8;
    id v9 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:v13];
    v10 = (void *)[v9 copy];
    [(id)categoryKeywordMapForLanguage__categoryKeywordMap setObject:v10 forKeyedSubscript:v4];
  }
  uint64_t v11 = [(id)categoryKeywordMapForLanguage__categoryKeywordMap objectForKeyedSubscript:v4];

  return v11;
}

uint64_t __54__RKSentenceClassifier_categoryKeywordMapForLanguage___block_invoke()
{
  categoryKeywordMapForLanguage__categoryKeywordMap = [MEMORY[0x263EFF9A0] dictionary];

  return MEMORY[0x270F9A758]();
}

void __54__RKSentenceClassifier_categoryKeywordMapForLanguage___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = 0;
  id v6 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:a2 options:19 error:&v8];
  id v7 = v8;
  if (!v7) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

+ (id)sensitiveSubjectRegularExpressionForLanguage:(id)a3
{
  id v3 = a3;
  if (sensitiveSubjectRegularExpressionForLanguage__onceToken != -1) {
    dispatch_once(&sensitiveSubjectRegularExpressionForLanguage__onceToken, &__block_literal_global_327);
  }
  v4 = _languageCodeForIdentifier((uint64_t)v3);
  id v5 = [(id)sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions objectForKeyedSubscript:v4];

  if (!v5)
  {
    if ((unint64_t)[(id)sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions count] >= 2)objc_msgSend((id)sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions, "removeAllObjects"); {
    id v6 = +[RKAssets sensitiveSubjectRegularExpressionPatterns];
    }
    id v7 = [v6 objectForKeyedSubscript:v4];

    if (v7)
    {
      id v12 = 0;
      id v8 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v7 options:19 error:&v12];
      id v9 = v12;
      if (!v9) {
        [(id)sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions setObject:v8 forKeyedSubscript:v4];
      }
    }
  }
  v10 = [(id)sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions objectForKeyedSubscript:v4];

  return v10;
}

uint64_t __69__RKSentenceClassifier_sensitiveSubjectRegularExpressionForLanguage___block_invoke()
{
  sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions = [MEMORY[0x263EFF9A0] dictionary];

  return MEMORY[0x270F9A758]();
}

+ (id)polarTagRegularExpressionForLanguage:(id)a3
{
  id v3 = a3;
  if (polarTagRegularExpressionForLanguage__onceToken != -1) {
    dispatch_once(&polarTagRegularExpressionForLanguage__onceToken, &__block_literal_global_329);
  }
  v4 = _languageCodeForIdentifier((uint64_t)v3);
  id v5 = [(id)polarTagRegularExpressionForLanguage__polarTagRegularExpressions objectForKeyedSubscript:v4];

  if (!v5)
  {
    id v6 = +[RKAssets polarTagKeywords];
    id v7 = [v6 objectForKeyedSubscript:v4];

    if (v7)
    {
      if ((unint64_t)[(id)polarTagRegularExpressionForLanguage__polarTagRegularExpressions count] >= 2) {
        [(id)polarTagRegularExpressionForLanguage__polarTagRegularExpressions removeAllObjects];
      }
      id v8 = [MEMORY[0x263EFF980] array];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __61__RKSentenceClassifier_polarTagRegularExpressionForLanguage___block_invoke_2;
      v18[3] = &unk_2642D20E8;
      id v9 = v8;
      id v19 = v9;
      [v7 enumerateObjectsUsingBlock:v18];
      if ([v9 count])
      {
        v10 = NSString;
        uint64_t v11 = [v9 componentsJoinedByString:@" | "];
        id v12 = [v10 stringWithFormat:@"\\S+ \\s* \\b(%@) \\s* $", v11];

        id v17 = 0;
        uint64_t v13 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v12 options:19 error:&v17];
        id v14 = v17;
        if (!v14) {
          [(id)polarTagRegularExpressionForLanguage__polarTagRegularExpressions setObject:v13 forKeyedSubscript:v4];
        }
      }
    }
  }
  v15 = [(id)polarTagRegularExpressionForLanguage__polarTagRegularExpressions objectForKeyedSubscript:v4];

  return v15;
}

uint64_t __61__RKSentenceClassifier_polarTagRegularExpressionForLanguage___block_invoke()
{
  polarTagRegularExpressionForLanguage__polarTagRegularExpressions = [MEMORY[0x263EFF9A0] dictionary];

  return MEMORY[0x270F9A758]();
}

void __61__RKSentenceClassifier_polarTagRegularExpressionForLanguage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = _regExPatternFromKeywords(a2);
  v4 = [v3 stringByReplacingOccurrencesOfString:@" \\s+ \\?" withString:@"\\?"];

  id v7 = [v4 stringByReplacingOccurrencesOfString:@"\\?" withString:@" \\s* \\?+"];

  if ([v7 rangeOfString:@"\\?"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@ \\s* \\?*", v7];

    id v6 = (id)v5;
  }
  else
  {
    id v6 = v7;
  }
  id v8 = v6;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

+ (id)alternativeInversionsForLanguage:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (alternativeInversionsForLanguage__onceToken != -1) {
    dispatch_once(&alternativeInversionsForLanguage__onceToken, &__block_literal_global_351);
  }
  v4 = [(id)alternativeInversionsForLanguage__alternativeInversions objectForKeyedSubscript:v3];

  if (!v4)
  {
    uint64_t v5 = +[RKAssets alternativeInversions];
    id v6 = [v5 objectForKeyedSubscript:v3];

    if (v6)
    {
      id v23 = v3;
      if ((unint64_t)[(id)alternativeInversionsForLanguage__alternativeInversions count] >= 2) {
        [(id)alternativeInversionsForLanguage__alternativeInversions removeAllObjects];
      }
      id v7 = [v6 allKeys];
      id v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_354];

      id v9 = [MEMORY[0x263EFF980] array];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id obj = v8;
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(obj);
            }
            id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            v15 = _regExPatternFromKeywords(v14);
            id v16 = [NSString stringWithFormat:@"\\b %@ \\b", v15];

            id v25 = 0;
            id v17 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v16 options:19 error:&v25];
            id v18 = v25;
            v30[0] = @"regex";
            v30[1] = @"original";
            v31[0] = v17;
            v31[1] = v14;
            v30[2] = @"replacement";
            id v19 = [v6 objectForKeyedSubscript:v14];
            v31[2] = v19;
            v20 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
            [v9 addObject:v20];
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v11);
      }

      id v3 = v23;
      [(id)alternativeInversionsForLanguage__alternativeInversions setObject:v9 forKeyedSubscript:v23];
    }
  }
  v21 = [(id)alternativeInversionsForLanguage__alternativeInversions objectForKeyedSubscript:v3];

  return v21;
}

uint64_t __57__RKSentenceClassifier_alternativeInversionsForLanguage___block_invoke()
{
  alternativeInversionsForLanguage__alternativeInversions = [MEMORY[0x263EFF9A0] dictionary];

  return MEMORY[0x270F9A758]();
}

uint64_t __57__RKSentenceClassifier_alternativeInversionsForLanguage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 componentsSeparatedByString:@" "];
  unint64_t v6 = [v5 count];

  id v7 = [v4 componentsSeparatedByString:@" "];

  unint64_t v8 = [v7 count];
  if (v6 > v8) {
    return -1;
  }
  else {
    return v6 < v8;
  }
}

+ (id)appreciationKeywordsForLanguage:(id)a3
{
  uint64_t v3 = appreciationKeywordsForLanguage__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&appreciationKeywordsForLanguage__onceToken, &__block_literal_global_371);
  }
  uint64_t v5 = [(id)appreciationKeywordsForLanguage__appreciationKeywords objectForKeyedSubscript:v4];

  return v5;
}

uint64_t __56__RKSentenceClassifier_appreciationKeywordsForLanguage___block_invoke()
{
  appreciationKeywordsForLanguage__appreciationKeywords = +[RKAssets appreciationKeywords];

  return MEMORY[0x270F9A758]();
}

+ (id)preProcessTextMessageForLinguisticTagger:(id)a3 withLocale:(id)a4
{
  id v6 = a3;
  id v7 = (void *)[a1 subclassForLocale:a4];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 preProcessTextMessageForLinguisticTagger:v6];
  }
  else
  {
    id v8 = v6;
  }
  id v9 = v8;

  return v9;
}

- (id)lexicalEntitiesFromString:(id)a3
{
  v35[3] = *MEMORY[0x263EF8340];
  id v4 = [a3 stringByReplacingOccurrencesOfString:@"？" withString:@"?"];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"。" withString:@"."];

  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = [v5 lowercaseFirstWordString];

  id v8 = (void *)MEMORY[0x263EFF960];
  id v9 = [(RKSentenceClassifier *)self languageIdentifier];
  uint64_t v10 = [v8 localeWithLocaleIdentifier:v9];
  uint64_t v11 = [v10 objectForKey:*MEMORY[0x263EFF508]];

  uint64_t v12 = *MEMORY[0x263F082B8];
  v35[0] = *MEMORY[0x263F082D8];
  v35[1] = v12;
  v35[2] = *MEMORY[0x263F082A8];
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
  id v14 = [(id)lemmaAvailabilityByLanguage objectForKeyedSubscript:v11];
  int v15 = [v14 BOOLValue];

  if (v15)
  {
    uint64_t v16 = [v13 arrayByAddingObject:*MEMORY[0x263F082B0]];

    uint64_t v13 = (void *)v16;
  }
  if (([v11 isEqualToString:@"zh"] & 1) != 0
    || [v11 isEqualToString:@"zh-Hans"])
  {
    uint64_t v17 = [v13 arrayByAddingObject:*MEMORY[0x263F082C0]];

    uint64_t v13 = (void *)v17;
  }
  id v18 = (void *)[objc_alloc(MEMORY[0x263F08948]) initWithTagSchemes:v13 options:4];
  [v18 setString:v7];
  id v19 = (void *)MEMORY[0x263F08A58];
  v20 = [(RKSentenceClassifier *)self languageIdentifier];
  v21 = [v19 defaultOrthographyForLanguage:v20];

  v22 = [v18 string];
  objc_msgSend(v18, "setOrthography:range:", v21, 0, objc_msgSend(v22, "length"));

  id v23 = [v18 string];
  uint64_t v24 = [v23 length];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __50__RKSentenceClassifier_lexicalEntitiesFromString___block_invoke;
  void v31[3] = &unk_2642D2130;
  id v32 = v18;
  id v33 = v11;
  id v25 = v6;
  id v34 = v25;
  id v26 = v11;
  id v27 = v18;
  objc_msgSend(v27, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v24, v12, 4, v31);

  long long v28 = v34;
  id v29 = v25;

  return v29;
}

void __50__RKSentenceClassifier_lexicalEntitiesFromString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v14 = (id)objc_opt_new();
  id v8 = [*(id *)(a1 + 32) string];
  id v9 = objc_msgSend(v8, "substringWithRange:", a3, a4);
  [v14 setString:v9];

  [v14 setPartOfSpeech:v7];
  uint64_t v10 = [*(id *)(a1 + 32) tagAtIndex:a3 scheme:*MEMORY[0x263F082D8] tokenRange:0 sentenceRange:0];
  [v14 setTokenType:v10];

  uint64_t v11 = [*(id *)(a1 + 32) tagAtIndex:a3 scheme:*MEMORY[0x263F082A8] tokenRange:0 sentenceRange:0];
  [v14 setLanguage:v11];

  objc_msgSend(v14, "setTokenRange:", a3, a4);
  uint64_t v12 = [(id)lemmaAvailabilityByLanguage objectForKeyedSubscript:*(void *)(a1 + 40)];
  LODWORD(v11) = [v12 BOOLValue];

  if (v11)
  {
    uint64_t v13 = [*(id *)(a1 + 32) tagAtIndex:a3 scheme:*MEMORY[0x263F082B0] tokenRange:0 sentenceRange:0];
    [v14 setLemma:v13];
  }
  [*(id *)(a1 + 48) addObject:v14];
}

+ (id)stringFromLexicalEntities:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "string", (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [v4 componentsJoinedByString:@" "];

  return v11;
}

+ (id)sentenceClassification:(id)a3 withLanguageIdentifier:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_new();
  [a1 subclassForLanguageIdentifier:v9];

  uint64_t v11 = objc_opt_new();
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 sentenceClassification:v8 options:a5];

    uint64_t v10 = (void *)v13;
  }
  else
  {
    [v10 setLanguage:@"und"];
  }

  return v10;
}

- (id)sentenceClassification:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  [(RKSentenceClassifier *)self setSentenceString:v6];
  [(RKSentenceClassifier *)self setSentenceStringOriginal:v6];

  uint64_t v7 = [(RKSentenceClassifier *)self sentenceString];
  id v8 = [(RKSentenceClassifier *)self lexicalEntitiesFromString:v7];
  [(RKSentenceClassifier *)self setSentenceEntities:v8];

  id v9 = [(RKSentenceClassifier *)self sentenceEntities];
  uint64_t v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"partOfSpeech == %@", *MEMORY[0x263F082E0]];
  uint64_t v11 = [v9 filteredArrayUsingPredicate:v10];

  -[RKSentenceClassifier setSentenceIsTerminated:](self, "setSentenceIsTerminated:", [v11 count] != 0);
  [(RKSentenceClassifier *)self setSentenceHasQuestionTerminator:0];
  uint64_t v12 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"¿?"];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __55__RKSentenceClassifier_sentenceClassification_options___block_invoke;
  v41[3] = &unk_2642D1E08;
  id v38 = v12;
  id v42 = v38;
  v43 = self;
  [v11 enumerateObjectsUsingBlock:v41];
  BOOL v13 = [(RKSentenceClassifier *)self sentenceIsTerminated];
  if ((v4 & 1) != 0 && !v13)
  {
    long long v14 = [(RKSentenceClassifier *)self sentenceString];
    long long v15 = [(RKSentenceClassifier *)self addSentenceTerminatorQuestion:v14];
    [(RKSentenceClassifier *)self setSentenceString:v15];

    long long v16 = [(RKSentenceClassifier *)self sentenceString];
    uint64_t v17 = [(RKSentenceClassifier *)self lexicalEntitiesFromString:v16];
    [(RKSentenceClassifier *)self setSentenceEntities:v17];
  }
  [(RKSentenceClassifier *)self analyzeSentence];
  uint64_t v18 = [(RKSentenceClassifier *)self classifySentence];
  id v19 = [(RKSentenceClassifier *)self languageIdentifier];
  v20 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v19];

  v21 = [(RKSentenceClassifier *)self sentenceString];
  v22 = +[RKResponseCollection responsesForFixedPhrase:v21 withLanguage:v20];

  if (v22)
  {
    [v18 setSentenceType:36];
    [v18 setCustomResponses:v22];
  }
  id v23 = objc_opt_class();
  uint64_t v24 = [(RKSentenceClassifier *)self languageIdentifier];
  id v25 = [v23 sensitiveSubjectRegularExpressionForLanguage:v24];

  id v26 = [(RKSentenceClassifier *)self sentenceString];
  id v27 = [(RKSentenceClassifier *)self sentenceString];
  long long v28 = objc_msgSend(v25, "matchesInString:options:range:", v26, 0, 0, objc_msgSend(v27, "length"));

  objc_msgSend(v18, "setSensitive:", objc_msgSend(v28, "count") != 0);
  id v29 = [(RKSentenceClassifier *)self languageIdentifier];
  v30 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v29];
  [v18 setLanguage:v30];

  v31 = [MEMORY[0x263EFF980] array];
  id v32 = [(RKSentenceClassifier *)self sentenceEntities];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __55__RKSentenceClassifier_sentenceClassification_options___block_invoke_2;
  v39[3] = &unk_2642D2158;
  id v40 = v31;
  id v33 = v31;
  [v32 enumerateObjectsUsingBlock:v39];

  id v34 = [v33 componentsJoinedByString:@" "];
  [v18 setTaggedText:v34];

  v35 = [(RKSentenceClassifier *)self sentenceEntities];
  [v18 setSentenceEntities:v35];

  v36 = [(RKSentenceClassifier *)self matchedRanges];
  [v18 setMatchedRanges:v36];

  return v18;
}

void __55__RKSentenceClassifier_sentenceClassification_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 string];
  uint64_t v7 = [v6 rangeOfCharacterFromSet:*(void *)(a1 + 32) options:128];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 40) setSentenceHasQuestionTerminator:1];
    *a4 = 1;
  }
}

void __55__RKSentenceClassifier_sentenceClassification_options___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = NSString;
  id v4 = a2;
  id v7 = [v4 word];
  id v5 = [v4 partOfSpeech];

  id v6 = [v3 stringWithFormat:@"%@{%@}", v7, v5];
  [v2 addObject:v6];
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  id v5 = [v3 whitespaceCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

- (void)analyzeSentence
{
  uint64_t v249 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF960];
  id v3 = [(RKSentenceClassifier *)self languageIdentifier];
  id v4 = [v2 localeWithLocaleIdentifier:v3];
  v179 = [v4 objectForKey:*MEMORY[0x263EFF508]];

  if (analyzeSentence_onceToken != -1) {
    dispatch_once(&analyzeSentence_onceToken, &__block_literal_global_408);
  }
  id v5 = [(RKSentenceClassifier *)self sentenceStringOriginal];
  -[RKSentenceClassifier setSentenceIsAllSymbols:](self, "setSentenceIsAllSymbols:", [v5 rangeOfCharacterFromSet:analyzeSentence_notSymbols] == 0x7FFFFFFFFFFFFFFFLL);

  id v6 = objc_opt_class();
  id v7 = [(RKSentenceClassifier *)self languageIdentifier];
  v182 = [v6 polarTagRegularExpressionForLanguage:v7];

  id v8 = [(RKSentenceClassifier *)self sentenceStringOriginal];
  id v9 = [(RKSentenceClassifier *)self sentenceStringOriginal];
  v183 = objc_msgSend(v182, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v9, "length"));

  if ([v183 count] == 1)
  {
    uint64_t v10 = [v183 objectAtIndexedSubscript:0];
    uint64_t v11 = [v10 rangeAtIndex:1];
    uint64_t v13 = v12;

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v11, v13);
      [(RKSentenceClassifier *)self setSentenceTag:v14];
    }
  }
  long long v15 = [MEMORY[0x263EFF980] array];
  long long v16 = [(RKSentenceClassifier *)self sentenceEntities];
  uint64_t v17 = [v16 valueForKey:@"word"];
  uint64_t v18 = [v17 componentsJoinedByString:@" "];

  id v19 = +[RKUtilities stripDiacritics:v18];

  v20 = objc_opt_class();
  v21 = [(RKSentenceClassifier *)self languageIdentifier];
  v181 = [v20 categoryKeywordMapForLanguage:v21];

  uint64_t v220 = 0;
  v221 = &v220;
  uint64_t v222 = 0x3032000000;
  v223 = __Block_byref_object_copy_;
  v224 = __Block_byref_object_dispose_;
  id v225 = objc_alloc_init(MEMORY[0x263EFF980]);
  v216[0] = MEMORY[0x263EF8330];
  v216[1] = 3221225472;
  v216[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_414;
  v216[3] = &unk_2642D21A8;
  id v178 = v19;
  id v217 = v178;
  id v22 = v15;
  id v218 = v22;
  v219 = &v220;
  [v181 enumerateKeysAndObjectsUsingBlock:v216];
  [(RKSentenceClassifier *)self setMatchedRanges:v221[5]];
  v214[0] = MEMORY[0x263EF8330];
  v214[1] = 3221225472;
  v214[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_3;
  v214[3] = &unk_2642D1DD8;
  id v215 = v22;
  id v184 = v215;
  [v215 enumerateObjectsWithOptions:2 usingBlock:v214];
  [v184 sortUsingComparator:&__block_literal_global_426];
  id v23 = (void *)[v184 copy];
  [(RKSentenceClassifier *)self setInterrogatives:v23];

  uint64_t v24 = [MEMORY[0x263EFF980] array];
  v212[0] = 0;
  v212[1] = v212;
  v212[2] = 0x3032000000;
  v212[3] = __Block_byref_object_copy_;
  v212[4] = __Block_byref_object_dispose_;
  id v213 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_5;
  block[3] = &unk_2642D2068;
  block[4] = v212;
  if (analyzeSentence_onceDataDetectorToken != -1) {
    dispatch_once(&analyzeSentence_onceDataDetectorToken, block);
  }
  id v25 = (void *)analyzeSentence_dataDetector;
  id v26 = [(RKSentenceClassifier *)self sentenceString];
  id v27 = [(RKSentenceClassifier *)self sentenceString];
  uint64_t v28 = [v27 length];
  v209[0] = MEMORY[0x263EF8330];
  v209[1] = 3221225472;
  v209[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_6;
  v209[3] = &unk_2642D2218;
  v209[4] = self;
  id v180 = v24;
  id v210 = v180;
  objc_msgSend(v25, "enumerateMatchesInString:options:range:usingBlock:", v26, 0, 0, v28, v209);

  [(RKSentenceClassifier *)self setDataDetected:v180];
  [(RKSentenceClassifier *)self setChoiceDelimiters:MEMORY[0x263EFFA68]];
  [(RKSentenceClassifier *)self setSentenceHasAlternativeConjunction:0];
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  v187 = (void *)*MEMORY[0x263F082A0];
  uint64_t v185 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v31 = [(RKSentenceClassifier *)self sentenceEntities];
    BOOL v32 = v30 < (unint64_t)[v31 count];

    if (!v32) {
      break;
    }
    id v33 = [(RKSentenceClassifier *)self sentenceEntities];
    v194 = [v33 objectAtIndexedSubscript:v30];

    if (v30 < 1)
    {
      v192 = 0;
    }
    else
    {
      id v34 = [(RKSentenceClassifier *)self sentenceEntities];
      v192 = [v34 objectAtIndexedSubscript:v30 - 1];
    }
    v35 = [(RKSentenceClassifier *)self sentenceEntities];
    uint64_t v36 = v30 + 1;
    BOOL v37 = v30 + 1 < (unint64_t)[v35 count];

    if (v37)
    {
      id v38 = [(RKSentenceClassifier *)self sentenceEntities];
      v190 = [v38 objectAtIndexedSubscript:v30 + 1];
    }
    else
    {
      v190 = 0;
    }
    v39 = [v194 word];
    if (![v39 isEqualToString:@","])
    {

LABEL_20:
      v43 = [(RKSentenceClassifier *)self alternativeConjunctions];
      v44 = [v194 word];
      if ([v43 containsObject:v44])
      {
        v45 = [v192 partOfSpeech];
        BOOL v46 = v45 == v187;

        if (!v46)
        {
          unint64_t v42 = 1;
LABEL_28:
          int v41 = 1;
          uint64_t v185 = v30;
          goto LABEL_31;
        }
      }
      else
      {
      }
      v47 = [(RKSentenceClassifier *)self sentenceEntities];
      unint64_t v48 = v29 + [v47 count];
      if (v48 < multiWordOrLength)
      {

        unint64_t v42 = 0;
        int v41 = 0;
LABEL_30:
        uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_31;
      }
      v49 = [(RKSentenceClassifier *)self alternativeConjunctions];
      v50 = [v194 word];
      v51 = [v50 stringByAppendingString:@" "];
      v52 = [v190 word];
      v53 = [v51 stringByAppendingString:v52];
      int v41 = [v49 containsObject:v53];

      if (!v41)
      {
        unint64_t v42 = 0;
        goto LABEL_30;
      }
      unint64_t v42 = multiWordOrLength;
      goto LABEL_28;
    }
    BOOL v40 = [(RKSentenceClassifier *)self sentenceHasAlternativeConjunction];

    if (v40) {
      goto LABEL_20;
    }
    int v41 = 0;
    unint64_t v42 = 1;
LABEL_31:
    uint64_t v205 = 0;
    v206 = &v205;
    uint64_t v207 = 0x2020000000;
    char v208 = 0;
    v54 = [(RKSentenceClassifier *)self dataDetected];
    v204[0] = MEMORY[0x263EF8330];
    v204[1] = 3221225472;
    v204[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_8;
    v204[3] = &unk_2642D2240;
    v204[5] = v30;
    v204[6] = v42;
    v204[4] = &v205;
    [v54 enumerateObjectsUsingBlock:v204];

    if (v42 && v42 < RK_QUERY_ALTERNATIVE_MAX_PHRASAL_LENGTH && !*((unsigned char *)v206 + 24))
    {
      v55 = [(RKSentenceClassifier *)self choiceDelimiters];
      v56 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v30, v42);
      v57 = [v55 arrayByAddingObject:v56];
      [(RKSentenceClassifier *)self setChoiceDelimiters:v57];

      [(RKSentenceClassifier *)self setSentenceHasAlternativeConjunction:v41 | [(RKSentenceClassifier *)self sentenceHasAlternativeConjunction]];
    }
    _Block_object_dispose(&v205, 8);

    --v29;
    uint64_t v30 = v36;
  }
  if ([(RKSentenceClassifier *)self sentenceHasAlternativeConjunction])
  {
    v58 = [(RKSentenceClassifier *)self choiceDelimiters];
    BOOL v59 = [v58 count] == 0;

    if (!v59)
    {
      v195 = [MEMORY[0x263EFF980] array];
      unint64_t v60 = 0;
      uint64_t v61 = *MEMORY[0x263F082E0];
      while (1)
      {
        v62 = [(RKSentenceClassifier *)self choiceDelimiters];
        BOOL v63 = v60 > [v62 count];

        if (v63) {
          break;
        }
        if (v60)
        {
          v64 = [(RKSentenceClassifier *)self choiceDelimiters];
          BOOL v65 = v60 < [v64 count];

          if (v65)
          {
            v66 = [(RKSentenceClassifier *)self choiceDelimiters];
            v67 = [v66 objectAtIndexedSubscript:v60 - 1];
            uint64_t v68 = [v67 rangeValue];
            uint64_t v70 = v69;

            v71 = [(RKSentenceClassifier *)self choiceDelimiters];
            v72 = [v71 objectAtIndexedSubscript:v60];
            uint64_t v73 = [v72 rangeValue];

            v74 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v68 + v70, v73 - (v68 + v70));
            [v195 addObject:v74];
          }
          else
          {
            v84 = [(RKSentenceClassifier *)self choiceDelimiters];
            v85 = [v84 objectAtIndexedSubscript:v60 - 1];
            uint64_t v86 = [v85 rangeValue];
            uint64_t v88 = v87;

            v89 = [(RKSentenceClassifier *)self sentenceEntities];
            uint64_t v90 = [v89 count];

            uint64_t v91 = v86 + v88;
            if (v90 == v91)
            {
LABEL_57:
              uint64_t v102 = 0;
            }
            else
            {
              while (1)
              {
                v92 = [(RKSentenceClassifier *)self sentenceEntities];
                uint64_t v93 = v90 - 1;
                v94 = [v92 objectAtIndexedSubscript:v90 - 1];
                v95 = [v94 partOfSpeech];
                char v96 = [v95 isEqualToString:v61];

                if ((v96 & 1) == 0) {
                  break;
                }
                --v90;
                if (v93 == v91) {
                  goto LABEL_57;
                }
              }
              while (1)
              {
                v97 = [(RKSentenceClassifier *)self sentenceEntities];
                uint64_t v98 = v90 - 1;
                v99 = [v97 objectAtIndexedSubscript:v90 - 1];
                v100 = [v99 partOfSpeech];
                int v101 = [v100 isEqualToString:v187];

                if (!v101) {
                  break;
                }
                --v90;
                if (v98 == v91) {
                  goto LABEL_57;
                }
              }
              uint64_t v102 = v90 - v91;
            }
            v74 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v91, v102);
            [v195 addObject:v74];
          }
        }
        else
        {
          v75 = [(RKSentenceClassifier *)self choiceDelimiters];
          v76 = [v75 objectAtIndexedSubscript:0];
          uint64_t v77 = [v76 rangeValue];

          if (v77)
          {
            uint64_t v78 = 0;
            uint64_t v79 = v77;
            while (1)
            {
              v80 = [(RKSentenceClassifier *)self sentenceEntities];
              v81 = [v80 objectAtIndexedSubscript:v78];
              v82 = [v81 partOfSpeech];
              int v83 = [v82 isEqualToString:v61];

              if (!v83) {
                break;
              }
              ++v78;
              if (!--v79) {
                goto LABEL_54;
              }
            }
            uint64_t v77 = v78;
          }
          else
          {
            uint64_t v79 = 0;
          }
LABEL_54:
          v74 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v77, v79);
          [v195 addObject:v74];
        }

        ++v60;
      }
      long long v202 = 0u;
      long long v203 = 0u;
      long long v200 = 0u;
      long long v201 = 0u;
      id v103 = v195;
      uint64_t v104 = 0;
      uint64_t v105 = [v103 countByEnumeratingWithState:&v200 objects:v248 count:16];
      if (v105)
      {
        uint64_t v106 = *(void *)v201;
        do
        {
          for (uint64_t i = 0; i != v105; ++i)
          {
            if (*(void *)v201 != v106) {
              objc_enumerationMutation(v103);
            }
            [*(id *)(*((void *)&v200 + 1) + 8 * i) rangeValue];
            if (v108 == 1) {
              ++v104;
            }
          }
          uint64_t v105 = [v103 countByEnumeratingWithState:&v200 objects:v248 count:16];
        }
        while (v105);
      }

      if (v104 == [v103 count])
      {
        [(RKSentenceClassifier *)self setAlternatives:v103];
        goto LABEL_76;
      }
      v109 = [(id)partofSpeechAvailabilityByLanguage objectForKeyedSubscript:v179];
      int v110 = [v109 BOOLValue];

      if (v110)
      {
        v111 = (void *)MEMORY[0x263EFFA08];
        uint64_t v246 = *MEMORY[0x263F08230];
        uint64_t v196 = v246;
        v191 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v246 count:1];
        v189 = [v111 setWithArray:v191];
        v247[0] = v189;
        v112 = (void *)MEMORY[0x263EFFA08];
        uint64_t v245 = *MEMORY[0x263F08290];
        uint64_t v169 = v245;
        v188 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v245 count:1];
        v186 = [v112 setWithArray:v188];
        v247[1] = v186;
        v113 = (void *)MEMORY[0x263EFFA08];
        uint64_t v244 = *MEMORY[0x263F081F0];
        uint64_t v193 = v244;
        v177 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v244 count:1];
        v176 = [v113 setWithArray:v177];
        v247[2] = v176;
        v114 = (void *)MEMORY[0x263EFFA08];
        uint64_t v115 = *MEMORY[0x263F081F8];
        v243[0] = *MEMORY[0x263F082E8];
        uint64_t v168 = v115;
        v243[1] = v115;
        v175 = [MEMORY[0x263EFF8C0] arrayWithObjects:v243 count:2];
        v174 = [v114 setWithArray:v175];
        v247[3] = v174;
        v116 = (void *)MEMORY[0x263EFFA08];
        v242 = @"RKLinguisticTagDataDetected";
        v173 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v242 count:1];
        v172 = [v116 setWithArray:v173];
        v247[4] = v172;
        v117 = (void *)MEMORY[0x263EFFA08];
        v227[0] = *MEMORY[0x263F08238];
        uint64_t v167 = v227[0];
        v227[1] = v193;
        uint64_t v165 = *MEMORY[0x263F08228];
        uint64_t v228 = *MEMORY[0x263F08298];
        uint64_t v166 = v228;
        uint64_t v229 = v165;
        uint64_t v163 = *MEMORY[0x263F08240];
        uint64_t v230 = *MEMORY[0x263F08278];
        uint64_t v164 = v230;
        uint64_t v231 = v163;
        uint64_t v118 = *MEMORY[0x263F08200];
        uint64_t v232 = v196;
        uint64_t v233 = v118;
        uint64_t v120 = *MEMORY[0x263F08250];
        uint64_t v234 = *MEMORY[0x263F08270];
        uint64_t v119 = v234;
        uint64_t v235 = v120;
        uint64_t v122 = *MEMORY[0x263F08280];
        uint64_t v236 = *MEMORY[0x263F08210];
        uint64_t v121 = v236;
        uint64_t v237 = v122;
        uint64_t v124 = *MEMORY[0x263F08258];
        uint64_t v238 = *MEMORY[0x263F08288];
        uint64_t v123 = v238;
        uint64_t v239 = v124;
        uint64_t v240 = *MEMORY[0x263F08220];
        uint64_t v125 = v240;
        v241 = @"RKLinguisticTagDataDetected";
        v171 = [MEMORY[0x263EFF8C0] arrayWithObjects:v227 count:16];
        v170 = [v117 setWithArray:v171];
        v247[5] = v170;
        v126 = (void *)MEMORY[0x263EFFA08];
        v226[0] = v167;
        v226[1] = v193;
        v226[2] = v166;
        v226[3] = v165;
        v226[4] = v164;
        v226[5] = v169;
        v226[6] = v163;
        v226[7] = v196;
        v226[8] = v118;
        v226[9] = v119;
        v226[10] = v120;
        v226[11] = v121;
        v226[12] = v122;
        v226[13] = v123;
        v226[14] = v124;
        v226[15] = v168;
        v226[16] = v125;
        v226[17] = @"RKLinguisticTagDataDetected";
        v127 = [MEMORY[0x263EFF8C0] arrayWithObjects:v226 count:18];
        v128 = [v126 setWithArray:v127];
        v247[6] = v128;
        v129 = [MEMORY[0x263EFF8C0] arrayWithObjects:v247 count:7];

        v198[0] = MEMORY[0x263EF8330];
        v198[1] = 3221225472;
        v198[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_9;
        v198[3] = &unk_2642D2290;
        v198[4] = self;
        id v199 = v103;
        [v129 enumerateObjectsUsingBlock:v198];

        goto LABEL_75;
      }
      v129 = [(id)partofSpeechAvailabilityByLanguage objectForKeyedSubscript:v179];
      if ([v129 BOOLValue])
      {
LABEL_75:
      }
      else
      {
        uint64_t v156 = [v179 isEqualToString:@"nl"];

        if ((v156 & 1) == 0)
        {
          BOOL v157 = 0;
          if (v185 && v185 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v156 = [(RKSentenceClassifier *)self sentenceEntities];
            BOOL v157 = v185 + 1 < (unint64_t)[(id)v156 count];
          }
          if (v185 && v185 != 0x7FFFFFFFFFFFFFFFLL) {

          }
          if (v157)
          {
            v158 = [(RKSentenceClassifier *)self sentenceEntities];
            v159 = [v158 objectAtIndexedSubscript:v185 + 1];
            v129 = [v159 partOfSpeech];

            if (([v129 isEqualToString:@"SentenceTerminator"] & 1) == 0
              && ([v129 isEqualToString:@"Punctuation"] & 1) == 0)
            {
              id v160 = objc_alloc_init(MEMORY[0x263EFF980]);
              v161 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v185 - 1, 1);
              [v160 addObject:v161];

              v162 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v185 + 1, 1);
              [v160 addObject:v162];

              [(RKSentenceClassifier *)self setAlternatives:v160];
            }
            goto LABEL_75;
          }
        }
      }
LABEL_76:
    }
  }
  v130 = [MEMORY[0x263EFF8C0] array];
  [(RKSentenceClassifier *)self setAppreciations:v130];

  v131 = (void *)MEMORY[0x263EFFA08];
  v132 = objc_opt_class();
  v133 = [(RKSentenceClassifier *)self languageIdentifier];
  v134 = _languageCodeForIdentifier((uint64_t)v133);
  v135 = [v132 appreciationKeywordsForLanguage:v134];
  v136 = [v131 setWithArray:v135];

  for (unint64_t j = 0; ; ++j)
  {
    v138 = [(RKSentenceClassifier *)self sentenceEntities];
    BOOL v139 = j < [v138 count];

    if (!v139) {
      break;
    }
    v140 = [(RKSentenceClassifier *)self sentenceEntities];
    uint64_t v141 = [v140 count];

    uint64_t v142 = v141 - j;
    if (v141 - j >= 3) {
      uint64_t v142 = 3;
    }
    if (v142)
    {
      uint64_t v143 = v142 - 1;
      do
      {
        v144 = [(RKSentenceClassifier *)self sentenceEntities];
        v145 = objc_msgSend(v144, "subarrayWithRange:", j, v143 + 1);
        v146 = [v145 valueForKeyPath:@"@unionOfObjects.string"];
        v147 = [v146 componentsJoinedByString:@"+"];

        v148 = +[RKUtilities stripDiacritics:v147];

        v149 = (void *)MEMORY[0x21D45BF80]();
        v150 = [v148 lowercaseString];
        int v151 = [v136 containsObject:v150];

        if (v151)
        {
          v152 = [(RKSentenceClassifier *)self appreciations];
          v153 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", j, v143 + 1);
          v154 = [v152 arrayByAddingObject:v153];
          [(RKSentenceClassifier *)self setAppreciations:v154];

          j += v143;
        }

        if (v143) {
          int v155 = v151;
        }
        else {
          int v155 = 1;
        }
        --v143;
      }
      while (v155 != 1);
    }
  }

  _Block_object_dispose(v212, 8);
  _Block_object_dispose(&v220, 8);
}

uint64_t __39__RKSentenceClassifier_analyzeSentence__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)analyzeSentence_notSymbols;
  analyzeSentence_notSymbols = v0;

  v2 = (void *)analyzeSentence_notSymbols;
  id v3 = [MEMORY[0x263F08708] punctuationCharacterSet];
  [v2 formUnionWithCharacterSet:v3];

  id v4 = (void *)analyzeSentence_notSymbols;
  id v5 = [MEMORY[0x263F08708] symbolCharacterSet];
  [v4 formUnionWithCharacterSet:v5];

  id v6 = (void *)analyzeSentence_notSymbols;
  id v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  [v6 formUnionWithCharacterSet:v7];

  id v8 = (void *)analyzeSentence_notSymbols;
  id v9 = objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 65024, 16);
  [v8 formUnionWithCharacterSet:v9];

  uint64_t v10 = (void *)analyzeSentence_notSymbols;

  return [v10 invert];
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_414(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = objc_msgSend(v7, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_2;
  v12[3] = &unk_2642D2180;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v15 = v9;
  uint64_t v16 = v10;
  id v11 = v5;
  [v8 enumerateObjectsUsingBlock:v12];
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v4, "range"));
  id v6 = [v5 componentsSeparatedByString:@" "];
  uint64_t v7 = [v6 count] - 1;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v4 range];
  id v11 = objc_msgSend(v8, "substringWithRange:", v9, v10);
  uint64_t v12 = [v11 componentsSeparatedByString:@" "];
  uint64_t v13 = [v12 count];

  id v19 = (id)[*(id *)(a1 + 40) mutableCopy];
  id v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v7, v13);
  [v19 setObject:v14 forKeyedSubscript:@"range"];

  id v15 = *(void **)(a1 + 32);
  uint64_t v16 = [v4 range];
  uint64_t v18 = objc_msgSend(v15, "substringWithRange:", v16, v17);
  [v19 setObject:v18 forKeyedSubscript:@"string"];

  [*(id *)(a1 + 48) addObject:v19];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v4];
}

unint64_t __39__RKSentenceClassifier_analyzeSentence__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 objectForKeyedSubscript:@"range"];
  NSUInteger v6 = [v5 rangeValue];
  NSUInteger v8 = v7;

  unint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    unint64_t v10 = 0;
    while (1)
    {
      if (a3 != v10)
      {
        id v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v10];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"range"];
        NSUInteger v13 = [v12 rangeValue];
        NSUInteger v15 = v14;

        v20.location = v6;
        v20.length = v8;
        v21.location = v13;
        v21.length = v15;
        NSRange v16 = NSIntersectionRange(v20, v21);
        if (v16.location == v6 && v16.length == v8) {
          break;
        }
      }
      ++v10;
      unint64_t result = [*(id *)(a1 + 32) count];
      if (v10 >= result) {
        return result;
      }
    }
    uint64_t v18 = *(void **)(a1 + 32);
    return [v18 removeObjectAtIndex:a3];
  }
  return result;
}

uint64_t __39__RKSentenceClassifier_analyzeSentence__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"range"];
  unint64_t v6 = [v5 rangeValue];

  NSUInteger v7 = [v4 objectForKeyedSubscript:@"range"];

  unint64_t v8 = [v7 rangeValue];
  if (v6 < v8) {
    return -1;
  }
  else {
    return v6 > v8;
  }
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  uint64_t v2 = [MEMORY[0x263F08770] dataDetectorWithTypes:6200 error:&obj];
  objc_storeStrong((id *)(v1 + 40), obj);
  id v3 = (void *)analyzeSentence_dataDetector;
  analyzeSentence_dataDetector = v2;
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v13 = 0;
  NSUInteger v14 = &v13;
  uint64_t v15 = 0x3010000000;
  NSRange v16 = "";
  long long v17 = xmmword_217E530C0;
  id v4 = [*(id *)(a1 + 32) sentenceEntities];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __39__RKSentenceClassifier_analyzeSentence__block_invoke_7;
  unint64_t v10 = &unk_2642D21F0;
  id v5 = v3;
  id v11 = v5;
  uint64_t v12 = &v13;
  [v4 enumerateObjectsUsingBlock:&v7];

  unint64_t v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v14[4], v14[5], v7, v8, v9, v10);
  [*(id *)(a1 + 40) addObject:v6];

  _Block_object_dispose(&v13, 8);
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_7(uint64_t a1, void *a2, NSUInteger location)
{
  id v11 = a2;
  NSUInteger v5 = [*(id *)(a1 + 32) range];
  NSUInteger v7 = v6;
  v14.location = [v11 tokenRange];
  v14.length = v8;
  v13.location = v5;
  v13.length = v7;
  if (NSIntersectionRange(v13, v14).length)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10.location = *(void *)(v9 + 32);
    v10.length = 1;
    if (v10.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10.length = *(void *)(v9 + 40);
      v15.location = location;
      v15.length = 1;
      NSRange v10 = NSUnionRange(v10, v15);
      location = v10.location;
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    *(void *)(v9 + 32) = location;
    *(void *)(v9 + 40) = v10.length;
    [v11 setPartOfSpeech:@"RKLinguisticTagDataDetected"];
  }
}

NSUInteger __39__RKSentenceClassifier_analyzeSentence__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v9.location = [a2 rangeValue];
  v9.length = v6;
  NSRange v8 = NSIntersectionRange(*(NSRange *)(a1 + 40), v9);
  NSUInteger result = v8.location;
  if (v8.length)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v54 = a2;
  v53 = [MEMORY[0x263EFF980] array];
  NSUInteger v5 = [*(id *)(a1 + 32) choiceDelimiters];
  [v5 count];

  unint64_t v6 = 0;
  do
  {
    NSUInteger v7 = [*(id *)(a1 + 32) choiceDelimiters];
    NSRange v8 = v7;
    if (!v6)
    {
      id v25 = [v7 objectAtIndexedSubscript:0];
      uint64_t v20 = [v25 rangeValue];

      if (!v20) {
        goto LABEL_24;
      }
      uint64_t v26 = 0;
      unint64_t v14 = v20;
      while (1)
      {
        id v27 = [*(id *)(a1 + 32) sentenceEntities];
        unint64_t v28 = v14 - 1;
        uint64_t v29 = [v27 objectAtIndexedSubscript:v14 - 1];
        uint64_t v30 = [v29 partOfSpeech];
        int v31 = [v54 containsObject:v30];

        if (!v31) {
          break;
        }
        ++v26;
        --v14;
        if (!v28) {
          goto LABEL_22;
        }
      }
      uint64_t v20 = v26;
LABEL_22:
      if (!v20) {
        goto LABEL_24;
      }
LABEL_23:
      BOOL v37 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v14, v20);
      [v53 addObject:v37];

      goto LABEL_24;
    }
    unint64_t v9 = [v7 count];

    NSRange v10 = [*(id *)(a1 + 32) choiceDelimiters];
    id v11 = [v10 objectAtIndexedSubscript:v6 - 1];
    uint64_t v12 = [v11 rangeValue];
    unint64_t v14 = v12 + v13;

    NSRange v15 = *(void **)(a1 + 32);
    if (v6 >= v9)
    {
      BOOL v32 = [v15 sentenceEntities];
      if (v14 >= [v32 count])
      {
        uint64_t v20 = 0;
LABEL_20:
      }
      else
      {
        uint64_t v20 = 0;
        while (1)
        {
          id v33 = [*(id *)(a1 + 32) sentenceEntities];
          id v34 = [v33 objectAtIndexedSubscript:v14 + v20];
          v35 = [v34 partOfSpeech];
          int v36 = [v54 containsObject:v35];

          if (!v36) {
            break;
          }
          ++v20;
          BOOL v32 = [*(id *)(a1 + 32) sentenceEntities];
          if (v14 + v20 >= [v32 count]) {
            goto LABEL_20;
          }
        }
      }
      goto LABEL_22;
    }
    NSRange v16 = [v15 choiceDelimiters];
    long long v17 = [v16 objectAtIndexedSubscript:v6];
    unint64_t v18 = [v17 rangeValue];

    unint64_t v19 = v14;
    uint64_t v20 = v18 - v14;
    if (v18 <= v14)
    {
LABEL_7:
      if (v18 != v14) {
        goto LABEL_23;
      }
    }
    else
    {
      while (1)
      {
        NSRange v21 = [*(id *)(a1 + 32) sentenceEntities];
        id v22 = [v21 objectAtIndexedSubscript:v19];
        id v23 = [v22 partOfSpeech];
        char v24 = [v54 containsObject:v23];

        if ((v24 & 1) == 0) {
          break;
        }
        if (++v19 >= v18) {
          goto LABEL_7;
        }
      }
    }
LABEL_24:
    ++v6;
    id v38 = [*(id *)(a1 + 32) choiceDelimiters];
    unint64_t v39 = [v38 count];
  }
  while (v6 <= v39);
  BOOL v40 = v53;
  uint64_t v41 = [v53 count];
  if (v41 == [*(id *)(a1 + 40) count])
  {
    unint64_t v42 = (void *)analyzeSentence_dataDetector;
    v43 = [*(id *)(a1 + 32) sentenceString];
    v44 = [*(id *)(a1 + 32) sentenceString];
    uint64_t v45 = [v44 length];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_10;
    v55[3] = &unk_2642D2218;
    v55[4] = *(void *)(a1 + 32);
    id v46 = v53;
    id v56 = v46;
    objc_msgSend(v42, "enumerateMatchesInString:options:range:usingBlock:", v43, 0, 0, v45, v55);

    if ([v46 count])
    {
      uint64_t v47 = 0;
      while (1)
      {
        unint64_t v48 = [v46 objectAtIndexedSubscript:v47];
        [v48 rangeValue];
        unint64_t v50 = v49;
        unint64_t v51 = RK_QUERY_ALTERNATIVE_MAX_PHRASAL_LENGTH;

        if (v50 > v51) {
          break;
        }
        if ([v46 count] <= (unint64_t)++v47) {
          goto LABEL_30;
        }
      }
    }
    else
    {
LABEL_30:
      [*(id *)(a1 + 32) setAlternatives:v46];
    }
    *a4 = 1;

    BOOL v40 = v53;
  }
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3010000000;
  v13[3] = "";
  long long v14 = xmmword_217E530C0;
  id v4 = [*(id *)(a1 + 32) sentenceEntities];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_11;
  v10[3] = &unk_2642D21F0;
  id v5 = v3;
  id v11 = v5;
  uint64_t v12 = v13;
  [v4 enumerateObjectsUsingBlock:v10];

  unint64_t v6 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_12;
  v7[3] = &unk_2642D2268;
  unint64_t v9 = v13;
  id v8 = v6;
  [v8 enumerateObjectsUsingBlock:v7];

  _Block_object_dispose(v13, 8);
}

NSUInteger __39__RKSentenceClassifier_analyzeSentence__block_invoke_11(uint64_t a1, void *a2, NSUInteger location)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  NSUInteger v7 = [v5 range];
  NSUInteger v9 = v8;
  NSUInteger v10 = [v6 tokenRange];
  NSUInteger v12 = v11;

  v16.location = v7;
  v16.length = v9;
  v17.location = v10;
  v17.length = v12;
  NSRange v13 = NSIntersectionRange(v16, v17);
  if (v13.length)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    v13.location = *(void *)(v14 + 32);
    v13.length = 1;
    if (v13.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13.length = *(void *)(v14 + 40);
      v18.location = location;
      v18.length = 1;
      NSRange v13 = NSUnionRange(v13, v18);
      location = v13.location;
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    *(void *)(v14 + 32) = location;
    *(void *)(v14 + 40) = v13.length;
  }
  return v13.location;
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_12(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  NSUInteger v8 = *(NSRange **)(*(void *)(a1 + 40) + 8);
  id v14 = v7;
  v16.location = [v7 rangeValue];
  v16.length = v9;
  if (NSIntersectionRange(v8[32], v16).length)
  {
    NSUInteger v10 = *(NSRange **)(*(void *)(a1 + 40) + 8);
    v17.location = [v14 rangeValue];
    v17.length = v11;
    NSRange v12 = NSUnionRange(v10[2], v17);
    NSRange v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v12.location, v12.length);
    [*(id *)(a1 + 32) setObject:v13 atIndexedSubscript:a3];

    *a4 = 1;
  }
}

- (id)classifySentence
{
  v22[9] = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  if (![v3 sentenceType]
    && [(RKSentenceClassifier *)self sentenceIsAllSymbols]
    && ![(RKSentenceClassifier *)self sentenceHasQuestionTerminator])
  {
    [v3 setSentenceType:36];
  }
  if (![v3 sentenceType])
  {
    id v4 = [(RKSentenceClassifier *)self sentenceTag];

    if (v4) {
      [v3 setSentenceType:5];
    }
  }
  if (![v3 sentenceType]
    && [(RKSentenceClassifier *)self sentenceIsTerminated]
    && ![(RKSentenceClassifier *)self sentenceHasQuestionTerminator])
  {
    [v3 setSentenceType:31];
  }
  if (![v3 sentenceType]
    && [(RKSentenceClassifier *)self sentenceHasAlternativeConjunction])
  {
    [v3 setSentenceType:6];
  }
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *MEMORY[0x263F08250];
  v22[0] = *MEMORY[0x263F082E0];
  v22[1] = v6;
  uint64_t v7 = *MEMORY[0x263F08248];
  v22[2] = *MEMORY[0x263F08210];
  v22[3] = v7;
  uint64_t v8 = *MEMORY[0x263F08300];
  v22[4] = *MEMORY[0x263F08208];
  v22[5] = v8;
  uint64_t v9 = *MEMORY[0x263F08268];
  v22[6] = *MEMORY[0x263F08220];
  v22[7] = v9;
  v22[8] = *MEMORY[0x263F08230];
  NSUInteger v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:9];
  NSUInteger v11 = [v5 setWithArray:v10];

  if (![v3 sentenceType] || objc_msgSend(v3, "sentenceType") == 31)
  {
    NSRange v12 = [(RKSentenceClassifier *)self appreciations];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      id v14 = [(RKSentenceClassifier *)self appreciations];
      NSRange v15 = [v14 objectAtIndexedSubscript:0];
      uint64_t v16 = [v15 rangeValue];

      if (!v16) {
        goto LABEL_20;
      }
      NSRange v17 = [(RKSentenceClassifier *)self sentenceEntities];
      NSRange v18 = [v17 objectAtIndexedSubscript:v16 - 1];
      unint64_t v19 = [v18 partOfSpeech];
      int v20 = [v11 containsObject:v19];

      if (v20) {
LABEL_20:
      }
        [v3 setSentenceType:34];
    }
  }

  return v3;
}

- (NSArray)sentenceEntities
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSentenceEntities:(id)a3
{
}

- (NSArray)matchedRanges
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMatchedRanges:(id)a3
{
}

- (NSString)languageIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)partofSpeechAvailabilityByLanguage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPartofSpeechAvailabilityByLanguage:(id)a3
{
}

- (NSMutableDictionary)lemmaAvailabilityByLanguage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLemmaAvailabilityByLanguage:(id)a3
{
}

- (NSString)sentenceStringOriginal
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSentenceStringOriginal:(id)a3
{
}

- (NSString)sentenceString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSentenceString:(id)a3
{
}

- (BOOL)sentenceIsTerminated
{
  return self->_sentenceIsTerminated;
}

- (void)setSentenceIsTerminated:(BOOL)a3
{
  self->_sentenceIsTerminated = a3;
}

- (BOOL)sentenceIsAllSymbols
{
  return self->_sentenceIsAllSymbols;
}

- (void)setSentenceIsAllSymbols:(BOOL)a3
{
  self->_sentenceIsAllSymbols = a3;
}

- (BOOL)sentenceHasQuestionTerminator
{
  return self->_sentenceHasQuestionTerminator;
}

- (void)setSentenceHasQuestionTerminator:(BOOL)a3
{
  self->_sentenceHasQuestionTerminator = a3;
}

- (BOOL)sentenceHasAlternativeConjunction
{
  return self->_sentenceHasAlternativeConjunction;
}

- (void)setSentenceHasAlternativeConjunction:(BOOL)a3
{
  self->_sentenceHasAlternativeConjunction = a3;
}

- (NSValue)sentenceTag
{
  return (NSValue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSentenceTag:(id)a3
{
}

- (NSArray)inversions
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInversions:(id)a3
{
}

- (NSArray)interrogatives
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInterrogatives:(id)a3
{
}

- (NSArray)choiceDelimiters
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setChoiceDelimiters:(id)a3
{
}

- (NSArray)alternatives
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAlternatives:(id)a3
{
}

- (NSArray)appreciations
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAppreciations:(id)a3
{
}

- (NSArray)dataDetected
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDataDetected:(id)a3
{
}

- (NSString)RKLinguisticTagDataDetected
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRKLinguisticTagDataDetected:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_RKLinguisticTagDataDetected, 0);
  objc_storeStrong((id *)&self->_dataDetected, 0);
  objc_storeStrong((id *)&self->_appreciations, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_choiceDelimiters, 0);
  objc_storeStrong((id *)&self->_interrogatives, 0);
  objc_storeStrong((id *)&self->_inversions, 0);
  objc_storeStrong((id *)&self->_sentenceTag, 0);
  objc_storeStrong((id *)&self->_sentenceString, 0);
  objc_storeStrong((id *)&self->_sentenceStringOriginal, 0);
  objc_storeStrong((id *)&self->_lemmaAvailabilityByLanguage, 0);
  objc_storeStrong((id *)&self->_partofSpeechAvailabilityByLanguage, 0);
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
  objc_storeStrong((id *)&self->_matchedRanges, 0);

  objc_storeStrong((id *)&self->_sentenceEntities, 0);
}

void __46__RKSentenceClassifier_nb_NO_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_uk_UA_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_es_ES_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_hi_IN_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_fi_FI_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_he_IL_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __71__RKSentenceClassifier_en_US_preProcessTextMessageForLinguisticTagger___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = [*(id *)(a1 + 32) tagAtIndex:a3 scheme:*MEMORY[0x263F082B0] tokenRange:0 sentenceRange:0];
  uint64_t v7 = objc_msgSend(&unk_26C8EFB38, "objectForKey:");
  if (v7) {
    objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", a3, a4, v7);
  }
}

void __45__RKSentenceClassifier_en_US_analyzeSentence__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v2 = [v7 lemma];
  if ([v2 isEqualToString:@"oregon"])
  {
    id v3 = [v7 string];
    id v4 = [v3 lowercaseString];
    int v5 = [v4 isEqualToString:@"or"];

    id v6 = v7;
    if (!v5) {
      goto LABEL_6;
    }
    [v7 setLemma:@"or"];
  }
  else
  {
  }
  id v6 = v7;
LABEL_6:
}

void __45__RKSentenceClassifier_en_US_analyzeSentence__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v36 = v5;
  id v7 = [v5 partOfSpeech];
  LODWORD(v6) = [v6 containsObject:v7];

  if (!v6) {
    goto LABEL_33;
  }
  uint64_t v8 = a3 - 1;
  if (a3 < 1)
  {
    NSUInteger v10 = 0;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 40) sentenceEntities];
    NSUInteger v10 = [v9 objectAtIndexedSubscript:a3 - 1];
  }
  uint64_t v11 = *MEMORY[0x263F081F8];
  uint64_t v12 = *MEMORY[0x263F08228];
  while (1)
  {
    uint64_t v13 = [v10 partOfSpeech];
    if ([v13 isEqualToString:v11])
    {

      uint64_t v14 = v8 - 1;
      if (v8 < 1) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    NSRange v15 = [v10 partOfSpeech];
    if (![v15 isEqualToString:v12]) {
      break;
    }
    uint64_t v14 = v8 - 1;

    if (v8 <= 0)
    {
LABEL_12:
      NSRange v18 = 0;
      goto LABEL_17;
    }
LABEL_11:
    uint64_t v16 = [*(id *)(a1 + 40) sentenceEntities];
    uint64_t v17 = [v16 objectAtIndexedSubscript:v14];

    uint64_t v8 = v14;
    NSUInteger v10 = (void *)v17;
  }

  if (v8 < 1)
  {
    NSRange v18 = 0;
  }
  else
  {
    unint64_t v19 = [*(id *)(a1 + 40) sentenceEntities];
    NSRange v18 = [v19 objectAtIndexedSubscript:v8 - 1];
  }
  uint64_t v14 = v8;
LABEL_17:
  int v20 = [v18 partOfSpeech];
  if ([v20 isEqualToString:v11])
  {

    if (v14 >= 2)
    {
      int v20 = [*(id *)(a1 + 40) sentenceEntities];
      uint64_t v21 = [v20 objectAtIndexedSubscript:v14 - 2];

      NSRange v18 = (void *)v21;
      goto LABEL_20;
    }
  }
  else
  {
LABEL_20:
  }
  id v22 = [v10 partOfSpeech];
  uint64_t v23 = *MEMORY[0x263F082E8];
  if (![v22 isEqualToString:*MEMORY[0x263F082E8]]) {
    goto LABEL_31;
  }
  char v24 = *(void **)(a1 + 48);
  id v25 = [v10 lemma];
  LODWORD(v24) = [v24 containsObject:v25];

  if (v24)
  {
    if (!v18
      || (uint64_t v26 = *(void **)(a1 + 32),
          [v18 partOfSpeech],
          id v27 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v26) = [v26 containsObject:v27],
          v27,
          (v26 & 1) == 0))
    {
      unint64_t v28 = [v18 partOfSpeech];
      char v29 = [v28 isEqualToString:v23];

      if ((v29 & 1) == 0)
      {
        uint64_t v30 = [v10 string];
        int v31 = [v30 lowercaseString];
        if ([v31 isEqualToString:@"do"])
        {
          BOOL v32 = [v36 lemma];
          char v33 = [v32 isEqualToString:@"it"];

          if (v33) {
            goto LABEL_32;
          }
        }
        else
        {
        }
        id v22 = [*(id *)(a1 + 40) inversions];
        id v34 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v14, a3 - v14 + 1);
        v35 = [v22 arrayByAddingObject:v34];
        [*(id *)(a1 + 40) setInversions:v35];

LABEL_31:
      }
    }
  }
LABEL_32:

LABEL_33:
}

void __46__RKSentenceClassifier_en_US_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v71 = a2;
  id v5 = [v71 partOfSpeech];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F08218]];

  if (v6)
  {
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x2020000000;
    char v76 = 0;
    id v7 = [*(id *)(a1 + 32) choiceDelimiters];
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __46__RKSentenceClassifier_en_US_classifySentence__block_invoke_2;
    v72[3] = &unk_2642D2368;
    v72[4] = &v73;
    v72[5] = a3;
    [v7 enumerateObjectsUsingBlock:v72];

    if (!*((unsigned char *)v74 + 24)) {
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      goto LABEL_43;
    }
    v67 = [*(id *)(a1 + 32) dataDetected];
    if (![v67 count])
    {
      uint64_t v8 = [*(id *)(a1 + 40) customResponses];
      unint64_t v9 = [v8 count];

      if (v9 < 2)
      {
LABEL_43:
        _Block_object_dispose(&v73, 8);
        goto LABEL_44;
      }
      NSUInteger v10 = *(void **)(a1 + 32);
      uint64_t v11 = [*(id *)(a1 + 40) customResponses];
      uint64_t v12 = [v11 objectAtIndexedSubscript:0];
      v67 = [v10 lexicalEntitiesFromString:v12];

      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = [*(id *)(a1 + 40) customResponses];
      NSRange v15 = [v14 objectAtIndexedSubscript:1];
      v55 = [v13 lexicalEntitiesFromString:v15];

      unint64_t v16 = [v67 count];
      if (v16 <= [v55 count]) {
        uint64_t v17 = v67;
      }
      else {
        uint64_t v17 = v55;
      }
      unint64_t v54 = [v17 count];
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      uint64_t v19 = [v67 count];
      if (v54)
      {
        uint64_t v52 = 0;
        uint64_t v53 = 0;
        unint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        unint64_t v69 = v18 - v19;
        uint64_t v60 = *MEMORY[0x263F08278];
        uint64_t v58 = *MEMORY[0x263F08228];
        uint64_t v59 = *MEMORY[0x263F08290];
        uint64_t v57 = *MEMORY[0x263F08220];
        BOOL v56 = 1;
        uint64_t v70 = a1;
LABEL_12:
        unint64_t v21 = v20 + 1;
        while (1)
        {
          if (v69 >= *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
            goto LABEL_38;
          }
          unint64_t v68 = v21;
          id v22 = [*(id *)(a1 + 32) sentenceEntities];
          unint64_t v23 = [v22 count];

          if (v21 >= v23)
          {
            a1 = v70;
            goto LABEL_38;
          }
          BOOL v65 = [*(id *)(v70 + 32) sentenceEntities];
          BOOL v63 = [v65 objectAtIndexedSubscript:v69];
          uint64_t v61 = [v63 partOfSpeech];
          a1 = v70;
          if ([v61 isEqualToString:v60]) {
            goto LABEL_32;
          }
          char v24 = [*(id *)(v70 + 32) sentenceEntities];
          id v25 = [v24 objectAtIndexedSubscript:v69];
          uint64_t v26 = [v25 partOfSpeech];
          a1 = v70;
          if ([v26 isEqualToString:v59]) {
            goto LABEL_31;
          }
          id v27 = [*(id *)(v70 + 32) sentenceEntities];
          unint64_t v28 = [v27 objectAtIndexedSubscript:v69];
          char v29 = [v28 partOfSpeech];
          if ([v29 isEqualToString:v58])
          {

            a1 = v70;
LABEL_31:

LABEL_32:
LABEL_33:
            unint64_t v21 = v68;
            ++v69;
            goto LABEL_26;
          }
          uint64_t v30 = [*(id *)(v70 + 32) sentenceEntities];
          int v31 = [v30 objectAtIndexedSubscript:v69];
          BOOL v32 = [v31 partOfSpeech];
          char v33 = [v32 isEqualToString:v57];

          a1 = v70;
          if (v33) {
            goto LABEL_33;
          }
          id v34 = [*(id *)(v70 + 32) sentenceEntities];
          v35 = [v34 objectAtIndexedSubscript:v68];
          id v36 = [v35 partOfSpeech];
          if (([v36 isEqualToString:v60] & 1) == 0)
          {
            BOOL v37 = [*(id *)(v70 + 32) sentenceEntities];
            id v38 = [v37 objectAtIndexedSubscript:v68];
            unint64_t v39 = [v38 partOfSpeech];
            if (([v39 isEqualToString:v59] & 1) == 0)
            {
              v66 = [*(id *)(v70 + 32) sentenceEntities];
              BOOL v40 = [v66 objectAtIndexedSubscript:v68];
              uint64_t v41 = [v40 partOfSpeech];
              if (([v41 isEqualToString:v58] & 1) == 0)
              {
                v64 = [*(id *)(v70 + 32) sentenceEntities];
                unint64_t v42 = [v64 objectAtIndexedSubscript:v68];
                v43 = [v42 partOfSpeech];
                char v62 = [v43 isEqualToString:v57];

                if ((v62 & 1) == 0)
                {
                  a1 = v70;
                  [*(id *)(v70 + 32) sentenceEntities];
                  v44 = unint64_t v20 = v68;
                  uint64_t v45 = [v44 objectAtIndexedSubscript:v69];
                  id v46 = [v45 partOfSpeech];
                  uint64_t v47 = [*(id *)(v70 + 32) sentenceEntities];
                  unint64_t v48 = [v47 objectAtIndexedSubscript:v68];
                  unint64_t v49 = [v48 partOfSpeech];
                  int v50 = [v46 isEqualToString:v49];

                  v53 += v50 ^ 1u;
                  ++v69;
                  BOOL v56 = ++v52 < v54;
                  if (v52 != v54) {
                    goto LABEL_12;
                  }
                  goto LABEL_38;
                }
                goto LABEL_25;
              }
            }
          }

LABEL_25:
          unint64_t v21 = v68 + 1;
          a1 = v70;
LABEL_26:
          if (!v56) {
            goto LABEL_38;
          }
        }
      }
      uint64_t v53 = 0;
LABEL_38:
      int v51 = objc_msgSend(v67, "count", v52);
      if (v51 != [v55 count] && v53)
      {
        [*(id *)(a1 + 40) setCustomResponses:0];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      }
    }
    goto LABEL_43;
  }
LABEL_44:
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

unint64_t __46__RKSentenceClassifier_en_US_classifySentence__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v6 = *(void *)(a1 + 40);
  unint64_t result = [a2 rangeValue];
  if (v6 >= result && v6 - result < v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __46__RKSentenceClassifier_en_US_classifySentence__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v28 = a2;
  unint64_t v6 = [v28 objectForKeyedSubscript:@"range"];
  unint64_t v7 = [v6 rangeValue];

  unint64_t v8 = [*(id *)(a1 + 32) inversions];
  if (![v8 count])
  {

LABEL_9:
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  unint64_t v9 = [*(id *)(a1 + 32) inversions];
  NSUInteger v10 = [v9 objectAtIndexedSubscript:0];
  uint64_t v11 = [v10 rangeValue];
  uint64_t v13 = v12;

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  uint64_t v14 = [*(id *)(a1 + 32) sentenceEntities];
  if (v11 + 3 <= (unint64_t)[v14 count])
  {
    NSRange v15 = [*(id *)(a1 + 32) sentenceEntities];
    unint64_t v16 = [v15 objectAtIndexedSubscript:v11];
    uint64_t v17 = [v16 lemma];
    if ([v17 isEqualToString:@"do"])
    {
      id v27 = [*(id *)(a1 + 32) sentenceEntities];
      uint64_t v26 = [v27 objectAtIndexedSubscript:v11 + 1];
      uint64_t v18 = [v26 lemma];
      if ([v18 isEqualToString:@"you"])
      {
        unint64_t v23 = [*(id *)(a1 + 32) sentenceEntities];
        id v22 = [v23 objectAtIndexedSubscript:v11 + 2];
        [v22 lemma];
        v19 = char v24 = v15;
        int v25 = [v19 isEqualToString:@"know"];

        if (!v25) {
          goto LABEL_14;
        }
        [*(id *)(a1 + 40) setCustomResponses:&unk_26C8EC2A8];
        goto LABEL_9;
      }
    }
  }

LABEL_14:
  if (v7 < v13 + v11)
  {
    unint64_t v20 = [v28 objectForKeyedSubscript:@"category"];
    objc_msgSend(*(id *)(a1 + 40), "setSentenceType:", objc_msgSend(v20, "unsignedIntegerValue"));

    unint64_t v21 = [v28 objectForKeyedSubscript:@"gender"];
    objc_msgSend(*(id *)(a1 + 40), "setGender:", objc_msgSend(v21, "unsignedIntegerValue"));
  }
  *a4 = 1;
}

void __46__RKSentenceClassifier_en_US_classifySentence__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a2;
  id v23 = [v6 setWithArray:&unk_26C8EC2D8];
  unint64_t v8 = [*(id *)(a1 + 32) sentenceEntities];
  uint64_t v9 = [v7 rangeValue];
  uint64_t v11 = v10;

  uint64_t v12 = objc_msgSend(v8, "subarrayWithRange:", v9, v11);

  uint64_t v13 = [v12 objectAtIndexedSubscript:0];
  uint64_t v14 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
  NSRange v15 = [v13 lemma];
  char v16 = [v15 isEqualToString:@"can"];

  if (v16)
  {
    uint64_t v17 = 4;
    goto LABEL_8;
  }
  uint64_t v18 = [v14 string];
  uint64_t v19 = [v18 lowercaseString];
  if ([v19 isEqualToString:@"you"])
  {
    unint64_t v20 = [v13 string];
    unint64_t v21 = [v20 lowercaseString];
    char v22 = [v23 containsObject:v21];

    if (v22)
    {
      uint64_t v17 = 3;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v17 = 2;
LABEL_8:
  [*(id *)(a1 + 40) setSentenceType:v17];
  *a4 = 1;
}

void __46__RKSentenceClassifier_vi_VN_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_nl_NL_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __51__RKSentenceClassifier_zh_Hans_CN_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __51__RKSentenceClassifier_zh_Hant_CN_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_pt_BR_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_ms_MY_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_pl_PL_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_nl_BE_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_ru_RU_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_cs_CZ_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_sk_SK_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_fr_BE_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_ro_RO_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_da_DK_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_ca_ES_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_ja_JP_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_hr_HR_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_it_IT_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_sv_SE_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  unint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __45__RKSentenceClassifier_de_DE_analyzeSentence__block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263EFF9C0] set];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v1 = [&unk_26C8EC518 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v9;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(&unk_26C8EC518);
        }
        id v5 = [*(id *)(*((void *)&v8 + 1) + 8 * v4) componentsSeparatedByString:@"/"];
        [v0 addObjectsFromArray:v5];

        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [&unk_26C8EC518 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v2);
  }
  uint64_t v6 = [v0 copy];
  id v7 = (void *)analyzeSentence_kModalVerbs;
  analyzeSentence_kModalVerbs = v6;
}

void __45__RKSentenceClassifier_de_DE_analyzeSentence__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v34 = v5;
  id v7 = [v5 partOfSpeech];
  LODWORD(v6) = [v6 containsObject:v7];

  if (!v6) {
    goto LABEL_31;
  }
  uint64_t v8 = a3 - 1;
  if (a3 < 1)
  {
    long long v10 = 0;
  }
  else
  {
    long long v9 = [*(id *)(a1 + 40) sentenceEntities];
    long long v10 = [v9 objectAtIndexedSubscript:a3 - 1];
  }
  uint64_t v11 = *MEMORY[0x263F081F8];
  uint64_t v12 = *MEMORY[0x263F08228];
  while (1)
  {
    uint64_t v13 = [v10 partOfSpeech];
    if ([v13 isEqualToString:v11])
    {

      uint64_t v14 = v8 - 1;
      if (v8 < 1) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    NSRange v15 = [v10 partOfSpeech];
    if (![v15 isEqualToString:v12]) {
      break;
    }
    uint64_t v14 = v8 - 1;

    if (v8 <= 0)
    {
LABEL_12:
      uint64_t v18 = 0;
      goto LABEL_17;
    }
LABEL_11:
    char v16 = [*(id *)(a1 + 40) sentenceEntities];
    uint64_t v17 = [v16 objectAtIndexedSubscript:v14];

    uint64_t v8 = v14;
    long long v10 = (void *)v17;
  }

  if (v8 < 1)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v19 = [*(id *)(a1 + 40) sentenceEntities];
    uint64_t v18 = [v19 objectAtIndexedSubscript:v8 - 1];
  }
  uint64_t v14 = v8;
LABEL_17:
  unint64_t v20 = [v18 partOfSpeech];
  if ([v20 isEqualToString:v11])
  {

    if (v14 >= 2)
    {
      unint64_t v20 = [*(id *)(a1 + 40) sentenceEntities];
      uint64_t v21 = [v20 objectAtIndexedSubscript:v14 - 2];

      uint64_t v18 = (void *)v21;
      goto LABEL_20;
    }
  }
  else
  {
LABEL_20:
  }
  char v22 = [v10 partOfSpeech];
  uint64_t v23 = *MEMORY[0x263F082E8];
  if ([v22 isEqualToString:*MEMORY[0x263F082E8]])
  {
    char v24 = (void *)analyzeSentence_kModalVerbs;
    int v25 = [v10 lemma];
    if ([v24 containsObject:v25])
    {

      goto LABEL_25;
    }
    uint64_t v26 = (void *)analyzeSentence_kModalVerbs;
    id v27 = [v10 word];
    LODWORD(v26) = [v26 containsObject:v27];

    if (v26)
    {
LABEL_25:
      if (!v18
        || (id v28 = *(void **)(a1 + 32),
            [v18 partOfSpeech],
            char v29 = objc_claimAutoreleasedReturnValue(),
            LOBYTE(v28) = [v28 containsObject:v29],
            v29,
            (v28 & 1) == 0))
      {
        uint64_t v30 = [v18 partOfSpeech];
        char v31 = [v30 isEqualToString:v23];

        if ((v31 & 1) == 0)
        {
          char v22 = [*(id *)(a1 + 40) inversions];
          BOOL v32 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v14, a3 - v14 + 1);
          char v33 = [v22 arrayByAddingObject:v32];
          [*(id *)(a1 + 40) setInversions:v33];

          goto LABEL_29;
        }
      }
    }
  }
  else
  {
LABEL_29:
  }
LABEL_31:
}

void __46__RKSentenceClassifier_de_DE_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  uint64_t v6 = [v16 objectForKeyedSubscript:@"range"];
  unint64_t v7 = [v6 rangeValue];

  uint64_t v8 = [*(id *)(a1 + 32) inversions];
  if ([v8 count])
  {
    long long v9 = [*(id *)(a1 + 32) inversions];
    long long v10 = [v9 objectAtIndexedSubscript:0];
    uint64_t v11 = [v10 rangeValue];
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v7 < v11 + v13)
  {
    uint64_t v14 = [v16 objectForKeyedSubscript:@"category"];
    objc_msgSend(*(id *)(a1 + 40), "setSentenceType:", objc_msgSend(v14, "unsignedIntegerValue"));

    NSRange v15 = [v16 objectForKeyedSubscript:@"gender"];
    objc_msgSend(*(id *)(a1 + 40), "setGender:", objc_msgSend(v15, "unsignedIntegerValue"));
  }
  *a4 = 1;
}

void __46__RKSentenceClassifier_de_DE_classifySentence__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a2;
  id v27 = [v6 setWithArray:MEMORY[0x263EFFA68]];
  uint64_t v8 = [*(id *)(a1 + 32) sentenceEntities];
  uint64_t v9 = [v7 rangeValue];
  uint64_t v11 = v10;

  uint64_t v12 = objc_msgSend(v8, "subarrayWithRange:", v9, v11);

  uint64_t v13 = [v12 objectAtIndexedSubscript:0];
  uint64_t v14 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
  NSRange v15 = [@"kann/kannst/kann/können/könnt" componentsSeparatedByString:@"/"];
  id v16 = (void *)MEMORY[0x263F08A98];
  uint64_t v17 = [v13 string];
  uint64_t v18 = [v16 predicateWithFormat:@"%@ LIKE[cd] SELF", v17];
  uint64_t v19 = [v15 filteredArrayUsingPredicate:v18];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    uint64_t v21 = 4;
    goto LABEL_8;
  }
  char v22 = [v14 string];
  uint64_t v23 = [v22 lowercaseString];
  if ([v23 isEqualToString:@"you"])
  {
    char v24 = [v13 string];
    int v25 = [v24 lowercaseString];
    char v26 = [v27 containsObject:v25];

    if (v26)
    {
      uint64_t v21 = 3;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v21 = 2;
LABEL_8:
  [*(id *)(a1 + 40) setSentenceType:v21];
  *a4 = 1;
}

void __46__RKSentenceClassifier_id_ID_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_hu_HU_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"category"];
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [v6 objectForKeyedSubscript:@"gender"];

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

@end