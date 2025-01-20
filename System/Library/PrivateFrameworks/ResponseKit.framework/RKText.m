@interface RKText
+ (id)annotationNameFromType:(unint64_t)a3;
+ (id)defaultDataProvider;
+ (id)polarityNameFromType:(unint64_t)a3;
+ (unint64_t)annotationTypeFromName:(id)a3;
+ (unint64_t)polarityTypeFromName:(id)a3;
+ (void)initialize;
- (BOOL)cleanupData;
- (BOOL)trainVerbatim;
- (NSMutableArray)annotations;
- (NSString)languageID;
- (NSString)processedText;
- (NSString)string;
- (RKText)init;
- (RKText)initWithString:(id)a3 andLanguageIdentifier:(id)a4;
- (RKText)initWithString:(id)a3 andLanguageIdentifier:(id)a4 trainingWeight:(double)a5 trainVerbatim:(BOOL)a6;
- (double)trainingWeight;
- (id)lsmText;
- (id)subTextWithRange:(_NSRange)a3;
- (id)subTextsByPolarity;
- (id)taggedText;
- (unint64_t)annotatedPolarity;
- (void)annotateRange:(_NSRange)a3 type:(unint64_t)a4;
- (void)annotateRange:(_NSRange)a3 type:(unint64_t)a4 machineGenerated:(BOOL)a5;
- (void)enumerateAnnotationsInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)setAnnotations:(id)a3;
- (void)setLanguageID:(id)a3;
- (void)setProcessedText:(id)a3;
- (void)setString:(id)a3;
- (void)setTrainVerbatim:(BOOL)a3;
- (void)setTrainingWeight:(double)a3;
@end

@implementation RKText

+ (id)defaultDataProvider
{
  if (defaultDataProvider_onceToken != -1) {
    dispatch_once(&defaultDataProvider_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)defaultDataProvider_sDataProvider;

  return v2;
}

uint64_t __29__RKText_defaultDataProvider__block_invoke()
{
  defaultDataProvider_sDataProvider = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

+ (void)initialize
{
  v31[15] = *MEMORY[0x263EF8340];
  v30[0] = @"None";
  v27 = [NSNumber numberWithUnsignedInteger:0];
  v31[0] = v27;
  v30[1] = @"DateTimeBegin";
  v26 = [NSNumber numberWithUnsignedInteger:1];
  v31[1] = v26;
  v30[2] = @"DateTimeEnd";
  v25 = [NSNumber numberWithUnsignedInteger:2];
  v31[2] = v25;
  v30[3] = @"DateTimeDuration";
  v24 = [NSNumber numberWithUnsignedInteger:3];
  v31[3] = v24;
  v30[4] = @"LocationGeneral";
  v23 = [NSNumber numberWithUnsignedInteger:4];
  v31[4] = v23;
  v30[5] = @"LocationAddress";
  v22 = [NSNumber numberWithUnsignedInteger:5];
  v31[5] = v22;
  v30[6] = @"LocationPointOfInterest";
  v2 = [NSNumber numberWithUnsignedInteger:6];
  v31[6] = v2;
  v30[7] = @"LocationMeetingRoom";
  v3 = [NSNumber numberWithUnsignedInteger:7];
  v31[7] = v3;
  v30[8] = @"LocationSender";
  v4 = [NSNumber numberWithUnsignedInteger:8];
  v31[8] = v4;
  v30[9] = @"LocationRecipient";
  v5 = [NSNumber numberWithUnsignedInteger:9];
  v31[9] = v5;
  v30[10] = @"PolarityNone";
  v6 = [NSNumber numberWithUnsignedInteger:10];
  v31[10] = v6;
  v30[11] = @"PolarityProposal";
  v7 = [NSNumber numberWithUnsignedInteger:11];
  v31[11] = v7;
  v30[12] = @"PolarityConfirmation";
  v8 = [NSNumber numberWithUnsignedInteger:12];
  v31[12] = v8;
  v30[13] = @"PolarityRejection";
  v9 = [NSNumber numberWithUnsignedInteger:13];
  v31[13] = v9;
  v30[14] = @"PolarityProposalSupplement";
  v10 = [NSNumber numberWithUnsignedInteger:14];
  v31[14] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:15];
  v12 = (void *)sAnnotationNames;
  sAnnotationNames = v11;

  v28[0] = @"None";
  v13 = [NSNumber numberWithUnsignedInteger:0];
  v29[0] = v13;
  v28[1] = @"Proposal";
  v14 = [NSNumber numberWithUnsignedInteger:1];
  v29[1] = v14;
  v28[2] = @"Confirmation";
  v15 = [NSNumber numberWithUnsignedInteger:2];
  v29[2] = v15;
  v28[3] = @"Rejection";
  v16 = [NSNumber numberWithUnsignedInteger:3];
  v29[3] = v16;
  v28[4] = @"Ambiguous";
  v17 = [NSNumber numberWithUnsignedInteger:4];
  v29[4] = v17;
  v28[5] = @"ProposalSupplement";
  v18 = [NSNumber numberWithUnsignedInteger:5];
  v29[5] = v18;
  v28[6] = @"Undefined";
  v19 = [NSNumber numberWithUnsignedInteger:-1];
  v29[6] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:7];
  v21 = (void *)sPolarityNames;
  sPolarityNames = v20;
}

+ (id)annotationNameFromType:(unint64_t)a3
{
  v3 = (void *)sAnnotationNames;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [v3 allKeysForObject:v4];

  v6 = [v5 objectAtIndexedSubscript:0];

  return v6;
}

+ (unint64_t)annotationTypeFromName:(id)a3
{
  v3 = [(id)sAnnotationNames objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

+ (id)polarityNameFromType:(unint64_t)a3
{
  v3 = (void *)sPolarityNames;
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [v3 allKeysForObject:v4];

  v6 = [v5 objectAtIndexedSubscript:0];

  return v6;
}

+ (unint64_t)polarityTypeFromName:(id)a3
{
  v3 = [(id)sPolarityNames objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (RKText)init
{
  return self;
}

- (RKText)initWithString:(id)a3 andLanguageIdentifier:(id)a4
{
  return [(RKText *)self initWithString:a3 andLanguageIdentifier:a4 trainingWeight:0 trainVerbatim:1.0];
}

- (RKText)initWithString:(id)a3 andLanguageIdentifier:(id)a4 trainingWeight:(double)a5 trainVerbatim:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)RKText;
  v13 = [(RKText *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_string, a3);
    uint64_t v15 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v12];
    languageID = v14->_languageID;
    v14->_languageID = (NSString *)v15;

    uint64_t v17 = [MEMORY[0x263EFF980] array];
    annotations = v14->_annotations;
    v14->_annotations = (NSMutableArray *)v17;

    v14->_trainingWeight = a5;
    v14->_trainVerbatim = a6;
  }

  return v14;
}

- (void)annotateRange:(_NSRange)a3 type:(unint64_t)a4
{
}

- (void)annotateRange:(_NSRange)a3 type:(unint64_t)a4 machineGenerated:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v10 = [(RKText *)self string];
  NSUInteger v11 = [v10 length];

  v26.NSUInteger location = 0;
  v26.NSUInteger length = v11;
  v33.NSUInteger location = location;
  v33.NSUInteger length = length;
  if (!NSIntersectionRange(v26, v33).length)
  {
    v16 = (void *)MEMORY[0x263EFF940];
    uint64_t v17 = *MEMORY[0x263EFF578];
    v29.NSUInteger location = location;
    v29.NSUInteger length = length;
    uint64_t v15 = NSStringFromRange(v29);
    v30.NSUInteger location = 0;
    v30.NSUInteger length = v11;
    v18 = NSStringFromRange(v30);
    [v16 raise:v17, @"Annotation range %@ does not intersect text range %@", v15, v18 format];
LABEL_8:

    goto LABEL_9;
  }
  v27.NSUInteger location = 0;
  v27.NSUInteger length = v11;
  v34.NSUInteger location = location;
  v34.NSUInteger length = length;
  NSRange v12 = NSUnionRange(v27, v34);
  if (v12.location || v12.length != v11)
  {
    v19 = (void *)MEMORY[0x263EFF940];
    uint64_t v20 = *MEMORY[0x263EFF578];
    v31.NSUInteger location = location;
    v31.NSUInteger length = length;
    uint64_t v15 = NSStringFromRange(v31);
    v32.NSUInteger location = 0;
    v32.NSUInteger length = v11;
    v18 = NSStringFromRange(v32);
    [v19 raise:v20, @"Annotation range %@ is not fully contained by text range %@", v15, v18 format];
    goto LABEL_8;
  }
  if (length) {
    goto LABEL_10;
  }
  v13 = (void *)MEMORY[0x263EFF940];
  uint64_t v14 = *MEMORY[0x263EFF578];
  v28.NSUInteger location = location;
  v28.NSUInteger length = 0;
  uint64_t v15 = NSStringFromRange(v28);
  [v13 raise:v14, @"Annotation range %@ is empty", v15 format];
LABEL_9:

LABEL_10:
  v24 = -[RKTextAnnotation initWithRange:andType:machineGenerated:]([RKTextAnnotation alloc], "initWithRange:andType:machineGenerated:", location, length, a4, v5);
  v21 = [(RKText *)self annotations];
  char v22 = [v21 containsObject:v24];

  if ((v22 & 1) == 0)
  {
    v23 = [(RKText *)self annotations];
    [v23 addObject:v24];

    [(RKText *)self setProcessedText:0];
  }
}

- (void)enumerateAnnotationsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v23 = *MEMORY[0x263EF8340];
  v7 = (void (**)(id, uint64_t, uint64_t, uint64_t, char *))a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = [(RKText *)self annotations];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
      v24.NSUInteger location = [v13 range];
      v25.NSUInteger location = location;
      v25.NSUInteger length = length;
      if (NSIntersectionRange(v24, v25).length)
      {
        char v17 = 0;
        uint64_t v14 = [v13 type];
        uint64_t v15 = [v13 range];
        v7[2](v7, v14, v15, v16, &v17);
        if (v17) {
          break;
        }
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)cleanupData
{
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 1;
  v3 = [(RKText *)self annotations];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __21__RKText_cleanupData__block_invoke;
  v44[3] = &unk_2642D24B0;
  v44[4] = self;
  [v3 enumerateObjectsUsingBlock:v44];

  unint64_t v4 = (void *)MEMORY[0x263EFF960];
  BOOL v5 = [(RKText *)self languageID];
  CFLocaleRef v6 = [v4 localeWithLocaleIdentifier:v5];

  v7 = [(RKText *)self string];
  v8 = [(RKText *)self string];
  v49.NSUInteger length = [v8 length];
  v49.NSUInteger location = 0;
  uint64_t v9 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, v49, 4uLL, v6);

  while (*((unsigned char *)v46 + 24))
  {
    if (!CFStringTokenizerAdvanceToNextToken(v9)) {
      break;
    }
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v9);
    uint64_t v11 = [(RKText *)self annotations];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __21__RKText_cleanupData__block_invoke_2;
    v42[3] = &unk_2642D24D8;
    CFRange v43 = CurrentTokenRange;
    v42[4] = self;
    v42[5] = &v45;
    [v11 enumerateObjectsUsingBlock:v42];
  }
  if (v9) {
    CFRelease(v9);
  }
  if (cleanupData_onceToken2 != -1) {
    dispatch_once(&cleanupData_onceToken2, &__block_literal_global_149);
  }
  uint64_t v12 = [(RKText *)self languageID];

  if (v12)
  {
    v13 = (void *)cleanupData_sDateTimeRegEx;
    uint64_t v14 = [(RKText *)self languageID];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    if (!v15)
    {
      if ((unint64_t)[(id)cleanupData_sDateTimeRegEx count] >= 2) {
        [(id)cleanupData_sDateTimeRegEx removeAllObjects];
      }
      id v16 = objc_alloc_init(MEMORY[0x263F08790]);
      char v17 = (void *)MEMORY[0x263EFF960];
      long long v18 = [(RKText *)self languageID];
      long long v19 = [v17 localeWithLocaleIdentifier:v18];
      [v16 setLocale:v19];

      long long v20 = [v16 standaloneWeekdaySymbols];
      long long v21 = NSString;
      char v22 = [v20 componentsJoinedByString:@"|"];
      uint64_t v23 = [v21 stringWithFormat:@"\\b(%@)\\b", v22];

      NSRange v24 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v23 options:1 error:0];
      NSRange v25 = (void *)cleanupData_sDateTimeRegEx;
      NSRange v26 = [(RKText *)self languageID];
      [v25 setObject:v24 forKeyedSubscript:v26];
    }
    NSRange v27 = (void *)cleanupData_sDateTimeRegEx;
    NSRange v28 = [(RKText *)self languageID];
    NSRange v29 = [v27 objectForKeyedSubscript:v28];
    NSRange v30 = [(RKText *)self string];
    NSRange v31 = [(RKText *)self string];
    uint64_t v32 = [v31 length];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __21__RKText_cleanupData__block_invoke_4;
    v41[3] = &unk_2642D2500;
    v41[4] = self;
    objc_msgSend(v29, "enumerateMatchesInString:options:range:usingBlock:", v30, 0, 0, v32, v41);
  }
  NSRange v33 = [(RKText *)self annotations];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __21__RKText_cleanupData__block_invoke_5;
  v40[3] = &unk_2642D24B0;
  v40[4] = self;
  [v33 enumerateObjectsWithOptions:2 usingBlock:v40];

  NSRange v34 = [(RKText *)self annotations];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __21__RKText_cleanupData__block_invoke_7;
  v39[3] = &unk_2642D24B0;
  v39[4] = self;
  [v34 enumerateObjectsWithOptions:2 usingBlock:v39];

  v35 = [(RKText *)self annotations];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __21__RKText_cleanupData__block_invoke_9;
  v38[3] = &unk_2642D2578;
  v38[4] = self;
  v38[5] = &v45;
  [v35 enumerateObjectsUsingBlock:v38];

  char v36 = *((unsigned char *)v46 + 24);
  _Block_object_dispose(&v45, 8);
  return v36;
}

void __21__RKText_cleanupData__block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  v3 = [*(id *)(a1 + 32) string];
  unint64_t v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  BOOL v5 = [v4 invertedSet];
  uint64_t v6 = [v19 range];
  unint64_t v8 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v5, 0, v6, v7);

  uint64_t v9 = [*(id *)(a1 + 32) string];
  uint64_t v10 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v11 = [v10 invertedSet];
  uint64_t v12 = [v19 range];
  unint64_t v14 = objc_msgSend(v9, "rangeOfCharacterFromSet:options:range:", v11, 4, v12, v13);
  uint64_t v16 = v15;

  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 > v14)
  {
    id v18 = [*(id *)(a1 + 32) taggedText];
    printf("Error: Empty annotation range '%s'\n", (const char *)[v18 UTF8String]);
  }
  else if ([v19 range] != v8 || v17 != v16 - v8 + v14)
  {
    objc_msgSend(v19, "setRange:", v8, v16 - v8 + v14);
  }
}

void __21__RKText_cleanupData__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  if ((unint64_t)[v11 range] > *(void *)(a1 + 48)
    && (unint64_t)[v11 range] < *(void *)(a1 + 56) + *(void *)(a1 + 48)
    || (uint64_t v6 = [v11 range], (unint64_t)(v6 + v7) > *(void *)(a1 + 48))
    && (uint64_t v8 = [v11 range], (unint64_t)(v8 + v9) < *(void *)(a1 + 56) + *(void *)(a1 + 48)))
  {
    id v10 = [*(id *)(a1 + 32) taggedText];
    printf("Error: Invalid annotation range splits word '%s'\n", (const char *)[v10 UTF8String]);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t __21__RKText_cleanupData__block_invoke_3()
{
  cleanupData_sDateTimeRegEx = [MEMORY[0x263EFF9A0] dictionary];

  return MEMORY[0x270F9A758]();
}

uint64_t __21__RKText_cleanupData__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 range];

  return objc_msgSend(v2, "annotateRange:type:machineGenerated:", v4, v3, 1, 1);
}

void __21__RKText_cleanupData__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if ([v6 type] == 11)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    uint64_t v7 = [*(id *)(a1 + 32) annotations];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __21__RKText_cleanupData__block_invoke_6;
    v10[3] = &unk_2642D2528;
    id v8 = v6;
    id v11 = v8;
    uint64_t v12 = &v14;
    uint64_t v13 = a4;
    [v7 enumerateObjectsUsingBlock:v10];

    if (!*((unsigned char *)v15 + 24))
    {
      id v9 = [*(id *)(a1 + 32) taggedText];
      printf("Warning: Proposal annotation does not contain any date information '%s'\n", (const char *)[v9 UTF8String]);

      [v8 setType:14];
    }

    _Block_object_dispose(&v14, 8);
  }
}

void __21__RKText_cleanupData__block_invoke_6(uint64_t a1, void *a2)
{
  id v8 = a2;
  NSUInteger v3 = [*(id *)(a1 + 32) range];
  NSUInteger v5 = v4;
  v11.NSUInteger location = [v8 range];
  v11.NSUInteger length = v6;
  v10.NSUInteger location = v3;
  v10.NSUInteger length = v5;
  if (NSIntersectionRange(v10, v11).length
    && ([v8 type] == 1 || objc_msgSend(v8, "type") == 2 || objc_msgSend(v8, "type") == 3))
  {
    uint64_t v7 = *(unsigned char **)(a1 + 48);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    unsigned char *v7 = 1;
  }
}

void __21__RKText_cleanupData__block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  NSUInteger v6 = [*(id *)(a1 + 32) annotations];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __21__RKText_cleanupData__block_invoke_8;
  v9[3] = &unk_2642D2550;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v7;
  uint64_t v12 = a3;
  id v8 = v5;
  [v6 enumerateObjectsUsingBlock:v9];
}

void __21__RKText_cleanupData__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 48) != a3)
  {
    id v18 = v7;
    uint64_t v8 = [*(id *)(a1 + 32) type];
    BOOL v9 = v8 == [v18 type];
    id v7 = v18;
    if (v9)
    {
      NSUInteger v10 = [*(id *)(a1 + 32) range];
      NSUInteger v12 = v11;
      v21.NSUInteger location = [v18 range];
      v21.NSUInteger length = v13;
      v20.NSUInteger location = v10;
      v20.NSUInteger length = v12;
      NSRange v14 = NSUnionRange(v20, v21);
      BOOL v9 = v14.location == [v18 range];
      id v7 = v18;
      if (v9 && v14.length == v15)
      {
        if (([*(id *)(a1 + 32) machineGenerated] & 1) == 0
          && ([v18 machineGenerated] & 1) == 0)
        {
          id v16 = [*(id *)(a1 + 40) taggedText];
          printf("Warning: Redundant nested annotation ranges '%s'\n", (const char *)[v16 UTF8String]);
        }
        char v17 = [*(id *)(a1 + 40) annotations];
        [v17 removeObjectAtIndex:*(void *)(a1 + 48)];

        *a4 = 1;
        id v7 = v18;
      }
    }
  }
}

void __21__RKText_cleanupData__block_invoke_9(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v22 = a2;
  while (1)
  {
    ++a3;
    id v7 = [*(id *)(a1 + 32) annotations];
    unint64_t v8 = [v7 count];

    if (a3 >= v8) {
      break;
    }
    NSUInteger v9 = [v22 range];
    NSUInteger v11 = v10;
    NSUInteger v12 = [*(id *)(a1 + 32) annotations];
    NSUInteger v13 = [v12 objectAtIndexedSubscript:a3];
    NSUInteger v14 = [v13 range];
    NSUInteger v16 = v15;

    v24.NSUInteger location = v9;
    v24.NSUInteger length = v11;
    v25.NSUInteger location = v14;
    v25.NSUInteger length = v16;
    if (NSIntersectionRange(v24, v25).length)
    {
      NSUInteger v17 = v9 + v11;
      NSUInteger v18 = v14 + v16;
      BOOL v19 = v9 >= v14 || v17 >= v18;
      if (!v19 || (v14 < v9 ? (BOOL v20 = v18 >= v17) : (BOOL v20 = 1), !v20))
      {
        id v21 = [*(id *)(a1 + 32) taggedText];
        printf("Error: Invalid staggered annotation ranges '%s'\n", (const char *)[v21 UTF8String]);

        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        *a4 = 1;
        break;
      }
    }
  }
}

- (id)subTextWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v25 = *MEMORY[0x263EF8340];
  NSUInteger v6 = [RKText alloc];
  id v7 = [(RKText *)self string];
  unint64_t v8 = objc_msgSend(v7, "substringWithRange:", location, length);
  NSUInteger v9 = [(RKText *)self languageID];
  [(RKText *)self trainingWeight];
  NSUInteger v11 = [(RKText *)v6 initWithString:v8 andLanguageIdentifier:v9 trainingWeight:[(RKText *)self trainVerbatim] trainVerbatim:v10];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  NSUInteger v12 = [(RKText *)self annotations];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        NSUInteger v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v27.NSUInteger location = [v17 range];
        v28.NSUInteger location = location;
        v28.NSUInteger length = length;
        NSRange v18 = NSIntersectionRange(v27, v28);
        if (v18.length) {
          -[RKText annotateRange:type:](v11, "annotateRange:type:", v18.location - location, v18.length, [v17 type]);
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  return v11;
}

- (id)subTextsByPolarity
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  NSUInteger v3 = [MEMORY[0x263EFF980] array];
  NSUInteger v4 = [MEMORY[0x263EFF980] array];
  id v5 = [(RKText *)self annotations];
  NSUInteger v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"type >= %lu", 10);
  id v7 = [v5 filteredArrayUsingPredicate:v6];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)MEMORY[0x263F08D40];
        uint64_t v14 = [*(id *)(*((void *)&v33 + 1) + 8 * i) range];
        NSUInteger v16 = objc_msgSend(v13, "valueWithRange:", v14, v15);
        [v4 addObject:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);
  }

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __28__RKText_subTextsByPolarity__block_invoke;
  v31[3] = &unk_2642D1E58;
  id v17 = v4;
  id v32 = v17;
  [v17 enumerateObjectsWithOptions:2 usingBlock:v31];
  [v17 sortUsingComparator:&__block_literal_global_173];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = [*(id *)(*((void *)&v27 + 1) + 8 * j) rangeValue];
        uint64_t v25 = -[RKText subTextWithRange:](self, "subTextWithRange:", v23, v24);
        [v3 addObject:v25];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v20);
  }

  return v3;
}

void __28__RKText_subTextsByPolarity__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  if (a3)
  {
    uint64_t v5 = 0;
    while (1)
    {
      NSUInteger v6 = [v15 rangeValue];
      NSUInteger v8 = v7;
      uint64_t v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
      NSUInteger v10 = [v9 rangeValue];
      NSUInteger v12 = v11;

      v17.NSUInteger location = v6;
      v17.NSUInteger length = v8;
      v19.NSUInteger location = v10;
      v19.NSUInteger length = v12;
      if (NSIntersectionRange(v17, v19).length) {
        break;
      }
      if (a3 == ++v5) {
        goto LABEL_7;
      }
    }
    v18.NSUInteger location = v6;
    v18.NSUInteger length = v8;
    v20.NSUInteger location = v10;
    v20.NSUInteger length = v12;
    NSRange v13 = NSUnionRange(v18, v20);
    uint64_t v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v13.location, v13.length);
    [*(id *)(a1 + 32) setObject:v14 atIndexedSubscript:v5];

    [*(id *)(a1 + 32) removeObjectAtIndex:a3];
  }
LABEL_7:
}

uint64_t __28__RKText_subTextsByPolarity__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 rangeValue];
  if (v6 >= [v5 rangeValue])
  {
    unint64_t v8 = [v4 rangeValue];
    uint64_t v7 = v8 > [v5 rangeValue];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (unint64_t)annotatedPolarity
{
  v2 = [(RKText *)self annotations];
  NSUInteger v3 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"type >= %lu", 10);
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  id v5 = [v4 valueForKeyPath:@"@distinctUnionOfObjects.type"];
  if ([v5 count])
  {
    if ([v5 count] == 1
      && ([v5 objectAtIndexedSubscript:0],
          unint64_t v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 unsignedIntegerValue],
          v6,
          (unint64_t)(v7 - 10) <= 4))
    {
      unint64_t v8 = qword_217E53100[v7 - 10];
    }
    else
    {
      unint64_t v8 = 4;
    }
  }
  else
  {
    unint64_t v8 = -1;
  }

  return v8;
}

- (id)taggedText
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  NSUInteger v3 = [MEMORY[0x263F089D8] string];
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v45 = self;
  id v5 = [(RKText *)self annotations];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __20__RKText_taggedText__block_invoke;
  v50[3] = &unk_2642D24B0;
  id v6 = v4;
  id v51 = v6;
  [v5 enumerateObjectsUsingBlock:v50];

  [v6 sortUsingComparator:&__block_literal_global_204];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (!v7)
  {
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v47;
  do
  {
    uint64_t v11 = 0;
    uint64_t v12 = v9;
    do
    {
      if (*(void *)v47 != v10) {
        objc_enumerationMutation(obj);
      }
      NSRange v13 = *(void **)(*((void *)&v46 + 1) + 8 * v11);
      uint64_t v14 = [v13 objectForKeyedSubscript:@"location"];
      uint64_t v9 = [v14 unsignedIntegerValue];

      id v15 = [(RKText *)v45 string];
      NSUInteger v16 = objc_msgSend(v15, "substringWithRange:", v12, v9 - v12);

      NSRange v17 = [v16 stringByEscapingXMLEntities];

      [v3 appendString:v17];
      NSRange v18 = [v13 objectForKeyedSubscript:@"type"];
      LODWORD(v15) = [v18 isEqualToString:@"open"];

      if (v15)
      {
        NSRange v19 = NSString;
        NSRange v20 = [v13 objectForKeyedSubscript:@"name"];
        [v19 stringWithFormat:@"<%@>", v20];
      }
      else
      {
        uint64_t v21 = [v13 objectForKeyedSubscript:@"type"];
        int v22 = [v21 isEqualToString:@"close"];

        if (!v22) {
          goto LABEL_11;
        }
        uint64_t v23 = NSString;
        NSRange v20 = [v13 objectForKeyedSubscript:@"name"];
        [v23 stringWithFormat:@"</%@>", v20];
      uint64_t v24 = };
      [v3 appendString:v24];

LABEL_11:
      ++v11;
      uint64_t v12 = v9;
    }
    while (v8 != v11);
    uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  }
  while (v8);
LABEL_15:

  uint64_t v25 = [(RKText *)v45 string];
  NSRange v26 = [v25 substringFromIndex:v9];

  long long v27 = [v26 stringByEscapingXMLEntities];

  [v3 appendString:v27];
  long long v28 = [MEMORY[0x263F08708] newlineCharacterSet];
  long long v29 = [v3 componentsSeparatedByCharactersInSet:v28];
  long long v30 = [v29 componentsJoinedByString:@"<br/>"];
  NSRange v31 = (void *)[v30 mutableCopy];

  id v32 = NSString;
  long long v33 = [(RKText *)v45 languageID];
  if (v33)
  {
    long long v34 = NSString;
    long long v29 = [(RKText *)v45 languageID];
    [v34 stringWithFormat:@" lang=\"%@\"", v29];
    long long v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v35 = &stru_26C8AEFC8;
  }
  [(RKText *)v45 trainingWeight];
  double v37 = v36;
  if (v36 == 1.0)
  {
    v40 = &stru_26C8AEFC8;
  }
  else
  {
    v38 = NSString;
    [(RKText *)v45 trainingWeight];
    objc_msgSend(v38, "stringWithFormat:", @" weight=\"%d\"", (int)v39);
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v41 = [v32 stringWithFormat:@"<T%@%@>%@</T>", v35, v40, v31];
  v42 = (void *)[v41 mutableCopy];

  if (v37 != 1.0) {
  if (v33)
  }
  {
  }

  return v42;
}

void __20__RKText_taggedText__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v22[6] = *MEMORY[0x263EF8340];
  id v5 = NSNumber;
  id v6 = a2;
  uint64_t v7 = [v5 numberWithUnsignedInteger:a3];
  uint64_t v8 = +[RKText annotationNameFromType:](RKText, "annotationNameFromType:", [v6 type]);
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "range"));
  uint64_t v10 = NSNumber;
  uint64_t v11 = [v6 range];
  uint64_t v13 = v12;

  uint64_t v14 = [v10 numberWithUnsignedInteger:v11 + v13];
  id v15 = *(void **)(a1 + 32);
  v21[0] = @"index";
  v21[1] = @"name";
  v22[0] = v7;
  v22[1] = v8;
  v21[2] = @"type";
  v21[3] = @"location";
  v22[2] = @"open";
  v22[3] = v9;
  v21[4] = @"openLocation";
  v21[5] = @"closeLocation";
  v22[4] = v9;
  v22[5] = v14;
  NSUInteger v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:6];
  [v15 addObject:v16];

  NSRange v17 = *(void **)(a1 + 32);
  v19[0] = @"index";
  v19[1] = @"name";
  v20[0] = v7;
  v20[1] = v8;
  v19[2] = @"type";
  v19[3] = @"location";
  v20[2] = @"close";
  v20[3] = v14;
  v19[4] = @"openLocation";
  v19[5] = @"closeLocation";
  v20[4] = v9;
  v20[5] = v14;
  NSRange v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:6];
  [v17 addObject:v18];
}

uint64_t __20__RKText_taggedText__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 objectForKeyedSubscript:@"location"];
  unint64_t v7 = [v6 unsignedIntegerValue];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"location"];
  unint64_t v9 = [v8 unsignedIntegerValue];

  if (v7 < v9) {
    goto LABEL_2;
  }
  uint64_t v11 = [v4 objectForKeyedSubscript:@"location"];
  unint64_t v12 = [v11 unsignedIntegerValue];
  uint64_t v13 = [v5 objectForKeyedSubscript:@"location"];
  unint64_t v14 = [v13 unsignedIntegerValue];

  if (v12 > v14)
  {
LABEL_4:
    uint64_t v10 = 1;
    goto LABEL_5;
  }
  NSUInteger v16 = [v4 objectForKeyedSubscript:@"type"];
  if ([v16 isEqualToString:@"close"])
  {
    NSRange v17 = [v5 objectForKeyedSubscript:@"type"];
    char v18 = [v17 isEqualToString:@"open"];

    if (v18) {
      goto LABEL_2;
    }
  }
  else
  {
  }
  NSRange v19 = [v4 objectForKeyedSubscript:@"type"];
  if ([v19 isEqualToString:@"open"])
  {
    NSRange v20 = [v5 objectForKeyedSubscript:@"type"];
    char v21 = [v20 isEqualToString:@"close"];

    if (v21) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  int v22 = [v4 objectForKeyedSubscript:@"type"];
  int v23 = [v22 isEqualToString:@"open"];

  if (v23)
  {
    uint64_t v24 = [v4 objectForKeyedSubscript:@"closeLocation"];
    unint64_t v25 = [v24 unsignedIntegerValue];
    NSRange v26 = [v5 objectForKeyedSubscript:@"closeLocation"];
    unint64_t v27 = [v26 unsignedIntegerValue];

    if (v25 <= v27)
    {
      long long v28 = [v4 objectForKeyedSubscript:@"closeLocation"];
      unint64_t v29 = [v28 unsignedIntegerValue];
      long long v30 = [v5 objectForKeyedSubscript:@"closeLocation"];
      unint64_t v31 = [v30 unsignedIntegerValue];

      if (v29 < v31) {
        goto LABEL_4;
      }
      id v32 = [v4 objectForKeyedSubscript:@"index"];
      unint64_t v33 = [v32 unsignedIntegerValue];
      long long v34 = [v5 objectForKeyedSubscript:@"index"];
      unint64_t v35 = [v34 unsignedIntegerValue];

      if (v33 >= v35)
      {
        double v36 = [v4 objectForKeyedSubscript:@"index"];
        unint64_t v37 = [v36 unsignedIntegerValue];
        v38 = [v5 objectForKeyedSubscript:@"index"];
        BOOL v39 = v37 > [v38 unsignedIntegerValue];
LABEL_23:

        uint64_t v10 = v39;
        goto LABEL_5;
      }
    }
  }
  else
  {
    v40 = [v4 objectForKeyedSubscript:@"openLocation"];
    unint64_t v41 = [v40 unsignedIntegerValue];
    v42 = [v5 objectForKeyedSubscript:@"openLocation"];
    unint64_t v43 = [v42 unsignedIntegerValue];

    if (v41 <= v43)
    {
      v44 = [v4 objectForKeyedSubscript:@"openLocation"];
      unint64_t v45 = [v44 unsignedIntegerValue];
      long long v46 = [v5 objectForKeyedSubscript:@"openLocation"];
      unint64_t v47 = [v46 unsignedIntegerValue];

      if (v45 < v47) {
        goto LABEL_4;
      }
      long long v48 = [v4 objectForKeyedSubscript:@"index"];
      unint64_t v49 = [v48 unsignedIntegerValue];
      v50 = [v5 objectForKeyedSubscript:@"index"];
      unint64_t v51 = [v50 unsignedIntegerValue];

      if (v49 <= v51)
      {
        double v36 = [v4 objectForKeyedSubscript:@"index"];
        unint64_t v52 = [v36 unsignedIntegerValue];
        v38 = [v5 objectForKeyedSubscript:@"index"];
        BOOL v39 = v52 < [v38 unsignedIntegerValue];
        goto LABEL_23;
      }
    }
  }
LABEL_2:
  uint64_t v10 = -1;
LABEL_5:

  return v10;
}

- (id)lsmText
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  NSUInteger v3 = [(RKText *)self processedText];

  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v40 = 0u;
    long long v39 = 0u;
    id v5 = [(RKText *)self annotations];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v40 != v7) {
            objc_enumerationMutation(v5);
          }
          unint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          unint64_t v10 = [v9 type];
          if (v10 <= 9 && ((1 << v10) & 0x3EE) != 0) {
            [v4 addObject:v9];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v6);
    }

    [v4 sortUsingComparator:&__block_literal_global_228];
    unint64_t v12 = [MEMORY[0x263EFF980] array];
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__1;
    v37[4] = __Block_byref_object_dispose__1;
    id v38 = 0;
    id v13 = objc_alloc(MEMORY[0x263F08948]);
    uint64_t v15 = *MEMORY[0x263F082C8];
    v43[0] = *MEMORY[0x263F082D8];
    uint64_t v14 = v43[0];
    v43[1] = v15;
    v43[2] = *MEMORY[0x263F082B0];
    NSUInteger v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
    NSRange v17 = (void *)[v13 initWithTagSchemes:v16 options:16];

    char v18 = [(RKText *)self string];
    [v17 setString:v18];

    NSRange v19 = [v17 string];
    uint64_t v20 = [v19 length];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __17__RKText_lsmText__block_invoke_231;
    v31[3] = &unk_2642D2608;
    id v21 = v17;
    id v32 = v21;
    id v22 = v4;
    id v33 = v22;
    double v36 = v37;
    id v23 = v12;
    id v34 = v23;
    unint64_t v35 = self;
    objc_msgSend(v21, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v20, v14, 16, v31);

    uint64_t v24 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF != ''"];
    unint64_t v25 = [v23 componentsJoinedByString:&stru_26C8AEFC8];
    NSRange v26 = [v25 componentsSeparatedByString:@" "];
    unint64_t v27 = [v26 filteredArrayUsingPredicate:v24];
    long long v28 = [v27 componentsJoinedByString:@" "];
    [(RKText *)self setProcessedText:v28];

    _Block_object_dispose(v37, 8);
  }
  unint64_t v29 = [(RKText *)self processedText];

  return v29;
}

uint64_t __17__RKText_lsmText__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 range];
  if (v6 >= [v5 range])
  {
    unint64_t v8 = [v4 range];
    uint64_t v7 = v8 > [v5 range];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __17__RKText_lsmText__block_invoke_231(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v52[3] = *MEMORY[0x263EF8340];
  id v7 = a2;
  unint64_t v8 = [*(id *)(a1 + 32) string];
  unint64_t v9 = objc_msgSend(v8, "substringWithRange:", a3, a4);

  id v10 = [*(id *)(a1 + 32) tagAtIndex:a3 scheme:*MEMORY[0x263F082C8] tokenRange:0 sentenceRange:0];
  uint64_t v11 = [*(id *)(a1 + 32) tagAtIndex:a3 scheme:*MEMORY[0x263F082B0] tokenRange:0 sentenceRange:0];
  if ([v9 length])
  {
    unint64_t v12 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    id v13 = [v12 invertedSet];
    if ([v9 rangeOfCharacterFromSet:v13] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v44 = v9;
      id v14 = v7;
      uint64_t v15 = v11;
      NSUInteger v16 = (void *)*MEMORY[0x263F08240];
      char v17 = [v10 isEqualToString:*MEMORY[0x263F08240]];

      if (v17)
      {
        uint64_t v11 = v15;
        id v7 = v14;
        unint64_t v9 = v44;
        goto LABEL_8;
      }
      unint64_t v12 = v10;
      id v10 = v16;
      uint64_t v11 = v15;
      id v7 = v14;
      unint64_t v9 = v44;
    }
    else
    {
    }
  }
LABEL_8:
  uint64_t v46 = 0;
  unint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  unint64_t v49 = __Block_byref_object_copy__1;
  v50 = __Block_byref_object_dispose__1;
  id v51 = 0;
  char v18 = *(void **)(a1 + 40);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __17__RKText_lsmText__block_invoke_2;
  v45[3] = &unk_2642D25E0;
  v45[5] = a3;
  v45[6] = a4;
  v45[4] = &v46;
  [v18 enumerateObjectsUsingBlock:v45];
  NSRange v19 = (void *)v47[5];
  if (v19)
  {
    uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
    id v22 = *(void **)(v20 + 40);
    id v21 = (id *)(v20 + 40);
    if (v22 != v19)
    {
      objc_storeStrong(v21, v19);
      uint64_t v23 = [(id)v47[5] type];
      if ((unint64_t)(v23 - 1) >= 9) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = off_2642D2628[v23 - 1];
      }
      NSRange v26 = *(void **)(a1 + 48);
      unint64_t v27 = NSString;
      long long v28 = [(__CFString *)v24 uppercaseString];
      unint64_t v29 = [v27 stringWithFormat:@" %@ ", v28];
      [v26 addObject:v29];
      goto LABEL_17;
    }
  }
  else
  {
    if ([v10 isEqualToString:*MEMORY[0x263F08220]])
    {
      unint64_t v25 = @"-";
    }
    else if ([v7 isEqualToString:*MEMORY[0x263F082A0]])
    {
      long long v30 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"?"];
      unint64_t v31 = [v30 invertedSet];
      BOOL v32 = [v9 rangeOfCharacterFromSet:v31] == 0x7FFFFFFFFFFFFFFFLL;

      if (v32)
      {
        unint64_t v25 = @" QM ";
      }
      else
      {
        unint64_t v35 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"¿"];
        double v36 = [v35 invertedSet];
        BOOL v37 = [v9 rangeOfCharacterFromSet:v36] == 0x7FFFFFFFFFFFFFFFLL;

        if (v37) {
          unint64_t v25 = @" IQM ";
        }
        else {
          unint64_t v25 = @" ";
        }
      }
    }
    else
    {
      if (![v7 isEqualToString:*MEMORY[0x263F082F0]])
      {
        if (([*(id *)(a1 + 56) trainVerbatim] & 1) != 0
          || ![v10 isEqualToString:*MEMORY[0x263F08240]])
        {
          if ([*(id *)(a1 + 56) trainVerbatim]) {
            goto LABEL_33;
          }
          uint64_t v38 = *MEMORY[0x263F08288];
          v52[0] = *MEMORY[0x263F08280];
          v52[1] = v38;
          v52[2] = *MEMORY[0x263F08258];
          long long v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:3];
          int v40 = [v39 containsObject:v10];

          if (!v40)
          {
LABEL_33:
            char v41 = [*(id *)(a1 + 56) trainVerbatim];
            if (v11) {
              char v42 = v41;
            }
            else {
              char v42 = 1;
            }
            unint64_t v43 = *(void **)(a1 + 48);
            if (v42) {
              [v9 lowercaseString];
            }
            else {
            long long v28 = [NSString stringWithFormat:@" %@", v11];
            }
            [v43 addObject:v28];
            goto LABEL_18;
          }
        }
        id v33 = *(void **)(a1 + 48);
        id v34 = NSString;
        long long v28 = [v10 uppercaseString];
        unint64_t v29 = [v34 stringWithFormat:@" %@ ", v28];
        [v33 addObject:v29];
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      unint64_t v25 = @" ";
    }
    [*(id *)(a1 + 48) addObject:v25];
  }
LABEL_19:
  _Block_object_dispose(&v46, 8);
}

void __17__RKText_lsmText__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  v10.NSUInteger location = [v8 range];
  v10.NSUInteger length = v7;
  if (NSIntersectionRange(*(NSRange *)(a1 + 40), v10).length)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setString:(id)a3
{
}

- (NSString)languageID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLanguageID:(id)a3
{
}

- (double)trainingWeight
{
  return self->_trainingWeight;
}

- (void)setTrainingWeight:(double)a3
{
  self->_trainingWeight = a3;
}

- (BOOL)trainVerbatim
{
  return self->_trainVerbatim;
}

- (void)setTrainVerbatim:(BOOL)a3
{
  self->_trainVerbatim = a3;
}

- (NSMutableArray)annotations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAnnotations:(id)a3
{
}

- (NSString)processedText
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProcessedText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedText, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_languageID, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end