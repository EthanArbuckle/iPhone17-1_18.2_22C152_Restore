@interface SKGProcessor
+ (BOOL)docContentExceedsMaxAllowedSize:(id)a3;
+ (BOOL)docIsTrashOrJunkMail:(id)a3;
+ (BOOL)recordHasHTMLContent:(id)a3;
+ (BOOL)recordHasTextContent:(id)a3;
+ (id)copyMailboxesFromRecord:(id)a3;
+ (id)embeddingVersionDataWithVersion:(id)a3;
+ (id)normalizeForEmbeddingGeneration:(id)a3 bundleID:(id)a4;
+ (id)sharedProcessor;
+ (unint64_t)getHTMLContentByteSizeForRecord:(id)a3;
+ (unint64_t)getTextContentByteSizeForRecord:(id)a3;
+ (unint64_t)textContentLengthForRecord:(id)a3;
- (BOOL)canGenerateEmbeddingsForFPRecord:(id)a3 bundleID:(id)a4;
- (BOOL)canGenerateEmbeddingsForMailRecord:(id)a3 bundleID:(id)a4;
- (BOOL)docUnderstandingRecordNeedsProcessing:(id)a3 bundleID:(id)a4 isUpdate:(BOOL)a5 hasTextContent:(BOOL)a6 shouldClear:(BOOL *)a7 shouldMarkComplete:(BOOL *)a8;
- (BOOL)embeddingRecordNeedsProcessing:(id)a3 bundleID:(id)a4 isUpdate:(BOOL)a5 hasTextContent:(BOOL)a6 shouldClear:(BOOL *)a7 shouldMarkComplete:(BOOL *)a8;
- (BOOL)extractContentFromRecord:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForCalendar:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForEvents:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForMail:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForMessages:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForReminders:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForSafari:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)extractContentFromRecordForWallet:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7;
- (BOOL)isStringOnlyNumbersOrPunctuationSpaces:(id)a3;
- (BOOL)itemForRecordHasTextContent:(id)a3;
- (BOOL)keyphraseRecordNeedsProcessing:(id)a3 bundleID:(id)a4 isUpdate:(BOOL)a5 hasTextContent:(BOOL)a6 shouldClear:(BOOL *)a7 shouldMarkComplete:(BOOL *)a8;
- (BOOL)needsDocumentUnderstandingForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)needsEmbeddingsForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)needsKeyphrasesForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)needsPriorityForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)needsSuggestedEventsForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)recordContainsValue:(id)a3 key:(id)a4;
- (BOOL)recordForItemHasTextContent:(id)a3;
- (BOOL)recordForItemWillHaveTextContent:(id)a3;
- (BOOL)recordIsCurrent:(id)a3 toCalendarUnit:(unint64_t)a4 maxOffset:(unint64_t)a5 checkFuture:(BOOL)a6 dateKeys:(id)a7;
- (BOOL)recordIsRecent:(id)a3 toCalendarUnit:(unint64_t)a4 maxOffset:(unint64_t)a5 dateKeys:(id)a6;
- (BOOL)recordIsValid:(id)a3;
- (BOOL)shouldGenerateDocumentUnderstandingForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)shouldGenerateEmbeddingsForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)shouldGenerateKeyphrasesForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)shouldGenerateSuggestedEventsForRecord:(id)a3 bundleID:(id)a4;
- (BOOL)updateSKGProcessorAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 isUpdate:(BOOL)a7 processorFlags:(unint64_t)a8;
- (BOOL)updateSKGProcessorDocUnderstandingAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 recordHasText:(BOOL)a7 itemHasText:(BOOL)a8 isUpdate:(BOOL)a9;
- (BOOL)updateSKGProcessorKeyphrasesAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 recordHasText:(BOOL)a7 itemHasText:(BOOL)a8 isUpdate:(BOOL)a9;
- (BOOL)updateSKGReindexerAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 processorFlags:(unint64_t)a6;
- (BOOL)updateSKGReindexerDocUnderstandingAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 itemHasText:(BOOL)a6;
- (BOOL)updateSKGReindexerKeyphrasesAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 itemHasText:(BOOL)a6;
- (SKGProcessor)initWithOptions:(id)a3;
- (id)copyBundleIdentifierFromRecord:(id)a3;
- (id)copyContentTypeFromRecord:(id)a3;
- (id)copyContentURLFromRecord:(id)a3;
- (id)copyDateStringFromRecordWithFormat:(id)a3 key:(id)a4 formatString:(id)a5;
- (id)copyDescriptionContentFromRecord:(id)a3;
- (id)copyDocumentTypesFromRecord:(id)a3;
- (id)copyDocumentUnderstandingVersionFromRecord:(id)a3;
- (id)copyDomainIdentifierFromRecord:(id)a3;
- (id)copyEmbeddingModelVersionFromRecord:(id)a3;
- (id)copyEmbeddingVersionFromRecord:(id)a3;
- (id)copyExtraDataFromWalletRecord:(id)a3;
- (id)copyFilePathFromRecord:(id)a3;
- (id)copyFileProviderIDFromRecord:(id)a3;
- (id)copyKeyphraseVersionFromRecord:(id)a3;
- (id)copyLanguageFromRecord:(id)a3;
- (id)copyNumberValueFromRecord:(id)a3 key:(id)a4;
- (id)copyPeopleVersionFromRecord:(id)a3;
- (id)copyPersonaFromRecord:(id)a3;
- (id)copyProtectionClassFromRecord:(id)a3;
- (id)copyReferenceIdentifierFromRecord:(id)a3;
- (id)copySnippetFromRecord:(id)a3;
- (id)copyStringArrayFromRecordAndConcatnate:(id)a3 key:(id)a4;
- (id)copyStringValueFromRecord:(id)a3 key:(id)a4;
- (id)copySuggestedEventsVersionFromRecord:(id)a3;
- (id)copyTextContentFromRecord:(id)a3;
- (id)copyTitleFromRecord:(id)a3;
- (id)dateFromRecord:(id)a3 key:(id)a4;
- (id)queue;
- (id)referenceDateForRecord:(id)a3;
- (void)clearDocUnderstandingAttributes:(id)a3;
- (void)clearKeyphrasesAttributes:(id)a3;
- (void)completeDocUnderstandingAttributes:(id)a3;
- (void)completeKeyphrasesAttributes:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SKGProcessor

uint64_t __31__SKGProcessor_sharedProcessor__block_invoke()
{
  v0 = [SKGProcessor alloc];
  sharedProcessor_gProcessor = [(SKGProcessor *)v0 initWithOptions:MEMORY[0x263EFFA78]];
  return MEMORY[0x270F9A758]();
}

- (SKGProcessor)initWithOptions:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKGProcessor;
  v3 = [(SKGProcessor *)&v7 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SpotlightKnowledge.processor", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

+ (id)sharedProcessor
{
  if (sharedProcessor_onceToken != -1) {
    dispatch_once(&sharedProcessor_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedProcessor_gProcessor;
  return v2;
}

- (BOOL)shouldGenerateKeyphrasesForRecord:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = [(SKGProcessor *)self copyFileProviderIDFromRecord:v5];

  if (v6)
  {
    id v7 = [(SKGProcessor *)self copyNumberValueFromRecord:v5 key:@"_kMDItemRequiresImport"];
    id v8 = [(SKGProcessor *)self copyContentTypeFromRecord:v5];
    v9 = v8;
    BOOL v10 = v7
       && v8
       && [v7 BOOLValue]
       && ![v9 isEqualToString:@"public.folder"];
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)needsKeyphrasesForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = +[SKGProcessor sharedProcessor];
    int v9 = [v8 recordIsValid:v6];

    if (v9)
    {
      id v10 = [(SKGProcessor *)self copyKeyphraseVersionFromRecord:v6];
      v11 = v10;
      if (v10)
      {
        int v12 = [v10 intValue];
        v13 = +[SKGProcessorContext sharedContext];
        uint64_t v14 = [v13 keyphraseVersion];

        if (v14 == v12)
        {
          BOOL v15 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      if (v7)
      {
        id v16 = v7;
      }
      else
      {
        id v16 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
        if (!v16) {
          goto LABEL_12;
        }
      }
      v17 = +[SKGProcessorContext sharedContext];
      v18 = [v17 keyphraseExcludeBundles];
      char v19 = [v18 containsObject:v16];

      if (v19)
      {
        BOOL v15 = 0;
LABEL_15:

        goto LABEL_16;
      }
LABEL_12:
      BOOL v15 = [(SKGProcessor *)self recordContainsValue:v6 key:@"kMDItemTextContent"]
         || [(SKGProcessor *)self recordContainsValue:v6 key:@"_kMDItemSnippet"];
      goto LABEL_15;
    }
  }
  BOOL v15 = 0;
LABEL_17:

  return v15;
}

- (BOOL)recordContainsValue:(id)a3 key:(id)a4
{
  return a3 && getValueForKey((CFDictionaryRef)a3, a4) != 0;
}

- (BOOL)recordIsValid:(id)a3
{
  return getValueForKey((CFDictionaryRef)a3, @"_kMDItemUserActivityType") == 0;
}

- (id)copyStringValueFromRecord:(id)a3 key:(id)a4
{
  CFDictionaryRef v5 = (const __CFDictionary *)a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_7;
  }
  ValueForKey = getValueForKey(v5, v6);
  id v8 = ValueForKey;
  if (ValueForKey)
  {
    CFTypeID v9 = CFGetTypeID(ValueForKey);
    if (v9 == CFStringGetTypeID())
    {
      id v8 = (void *)[[NSString alloc] initWithString:v8];
      goto LABEL_8;
    }
    if (v9 == CFURLGetTypeID())
    {
      id v10 = [NSString alloc];
      v11 = [v8 absoluteString];
      id v8 = (void *)[v10 initWithString:v11];

      goto LABEL_8;
    }
LABEL_7:
    id v8 = 0;
  }
LABEL_8:

  return v8;
}

- (id)copyFileProviderIDFromRecord:(id)a3
{
  return [(SKGProcessor *)self copyStringValueFromRecord:a3 key:@"kMDItemFileProviderID"];
}

- (id)copyKeyphraseVersionFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemKeyphraseVersion", (const void **)&value)) {
    goto LABEL_7;
  }
  CFDictionaryRef v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      CFDictionaryRef v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    CFDictionaryRef v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyBundleIdentifierFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"_kMDItemBundleID", (const void **)&value)) {
    goto LABEL_7;
  }
  CFDictionaryRef v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      CFDictionaryRef v5 = (void *)[[NSString alloc] initWithString:v5];
      goto LABEL_8;
    }
LABEL_7:
    CFDictionaryRef v5 = 0;
  }
LABEL_8:

  return v5;
}

- (void)clearDocUnderstandingAttributes:(id)a3
{
  uint64_t v3 = *MEMORY[0x263EFFD08];
  id v4 = a3;
  [v4 setObject:v3 forKey:@"_kMDItemNeedsDocumentUnderstanding"];
  [v4 setObject:v3 forKey:@"kMDItemDocumentUnderstandingVersion"];
}

- (void)completeDocUnderstandingAttributes:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = a3;
  id v6 = +[SKGProcessorContext sharedContext];
  CFDictionaryRef v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v6, "documentUnderstandingVersion"));
  [v4 setObject:v5 forKey:@"kMDItemDocumentUnderstandingVersion"];
}

- (BOOL)docUnderstandingRecordNeedsProcessing:(id)a3 bundleID:(id)a4 isUpdate:(BOOL)a5 hasTextContent:(BOOL)a6 shouldClear:(BOOL *)a7 shouldMarkComplete:(BOOL *)a8
{
  BOOL v10 = a5;
  id v12 = a3;
  BOOL v13 = [(SKGProcessor *)self recordContainsValue:v12 key:@"_kMDItemOCRContentLevel1"];
  if (v13)
  {
    if (a8)
    {
      id v14 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"_kMDItemOCRContentLevel1"];
      BOOL v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      id v16 = [v14 stringByTrimmingCharactersInSet:v15];

      if ((unint64_t)([v16 length] - 1501) <= 0xFFFFFFFFFFFFFA2CLL) {
        *a8 = 1;
      }
    }
    if (a7 && v10) {
      *a7 = 1;
    }
  }

  return v13;
}

- (BOOL)updateSKGProcessorDocUnderstandingAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 recordHasText:(BOOL)a7 itemHasText:(BOOL)a8 isUpdate:(BOOL)a9
{
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = [v14 objectForKeyedSubscript:@"_kMDItemNeedsDocumentUnderstanding"];
  if (v16)
  {

LABEL_17:
    LOBYTE(v22) = 0;
    goto LABEL_18;
  }
  v17 = [v14 objectForKeyedSubscript:@"kMDItemDocumentUnderstandingVersion"];

  if (v17) {
    goto LABEL_17;
  }
  if (v15)
  {
    id v18 = v15;
  }
  else
  {
    id v18 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v14];
    if (!v18)
    {
      id v18 = [(SKGProcessor *)self copyDomainIdentifierFromRecord:v14];
      if (v18)
      {
        v23 = +[SKGProcessorContext sharedContext];
        v24 = [v23 docUnderstandingItemDomainIds];
        char v25 = [v24 containsObject:v18];

        if (v25)
        {

          id v18 = 0;
          goto LABEL_8;
        }
      }
LABEL_16:
      [(SKGProcessor *)self clearDocUnderstandingAttributes:v13];

      goto LABEL_17;
    }
  }
  char v19 = +[SKGProcessorContext sharedContext];
  v20 = [v19 docUnderstandingIncludeBundles];
  char v21 = [v20 containsObject:v18];

  if ((v21 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  __int16 v27 = 0;
  BOOL v22 = [(SKGProcessor *)self docUnderstandingRecordNeedsProcessing:v14 bundleID:v18 isUpdate:a9 hasTextContent:v9 shouldClear:(char *)&v27 + 1 shouldMarkComplete:&v27];
  if (v22)
  {
    if (HIBYTE(v27)) {
      [(SKGProcessor *)self clearDocUnderstandingAttributes:v13];
    }
    if ((_BYTE)v27) {
      [(SKGProcessor *)self completeDocUnderstandingAttributes:v13];
    }
    else {
      [v13 setObject:&unk_270B14D40 forKey:@"_kMDItemNeedsDocumentUnderstanding"];
    }
  }

LABEL_18:
  return v22;
}

- (BOOL)updateSKGReindexerDocUnderstandingAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 itemHasText:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(SKGProcessor *)self recordContainsValue:v11 key:@"_kMDItemNeedsDocumentUnderstanding"])
  {
    goto LABEL_23;
  }
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v11];
    if (!v13)
    {
      id v13 = [(SKGProcessor *)self copyDomainIdentifierFromRecord:v11];
      if (v13)
      {
        v28 = +[SKGProcessorContext sharedContext];
        v29 = [v28 docUnderstandingItemDomainIds];
        char v30 = [v29 containsObject:v13];

        if (v30)
        {

          id v13 = 0;
          goto LABEL_6;
        }
      }
      goto LABEL_22;
    }
  }
  id v14 = +[SKGProcessorContext sharedContext];
  id v15 = [v14 docUnderstandingIncludeBundles];
  char v16 = [v15 containsObject:v13];

  if ((v16 & 1) == 0)
  {
LABEL_22:
    [(SKGProcessor *)self clearDocUnderstandingAttributes:v10];

LABEL_23:
    LOBYTE(v26) = 0;
    goto LABEL_24;
  }
LABEL_6:
  id v17 = [(SKGProcessor *)self copyDocumentUnderstandingVersionFromRecord:v11];
  id v32 = v17;
  if (v17)
  {
    int v18 = objc_msgSend(v17, "intValue", v17);
    char v19 = +[SKGProcessorContext sharedContext];
    BOOL v20 = [v19 documentUnderstandingVersion] == v18;
  }
  else
  {
    BOOL v20 = 0;
  }
  id v21 = [(SKGProcessor *)self copyNumberValueFromRecord:v11, @"_kMDItemUpdaterVersion", v32 key];
  BOOL v22 = v21;
  if (v21)
  {
    int v23 = [v21 intValue];
    v24 = +[SKGProcessorContext sharedContext];
    BOOL v25 = [v24 textVersion] != v23;
  }
  else
  {
    BOOL v25 = 0;
  }
  __int16 v34 = 0;
  BOOL v26 = [(SKGProcessor *)self docUnderstandingRecordNeedsProcessing:v11 bundleID:v13 isUpdate:0 hasTextContent:v6 shouldClear:(char *)&v34 + 1 shouldMarkComplete:&v34]&& (!v20 || v25);
  if (HIBYTE(v34)) {
    [(SKGProcessor *)self clearDocUnderstandingAttributes:v10];
  }
  int v27 = !v26;
  if (!(_BYTE)v34) {
    int v27 = 1;
  }
  if (((v27 | v20) & 1) == 0)
  {
    [(SKGProcessor *)self clearDocUnderstandingAttributes:v10];
    LOBYTE(v26) = 0;
  }

LABEL_24:
  return v26;
}

- (BOOL)needsDocumentUnderstandingForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = +[SKGProcessor sharedProcessor];
    int v9 = [v8 recordIsValid:v6];

    if (v9)
    {
      id v10 = [(SKGProcessor *)self copyDocumentUnderstandingVersionFromRecord:v6];
      id v11 = v10;
      if (v10)
      {
        int v12 = [v10 intValue];
        id v13 = +[SKGProcessorContext sharedContext];
        uint64_t v14 = [v13 documentUnderstandingVersion];

        if (v14 == v12)
        {
          LOBYTE(v15) = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      if (v7)
      {
        id v16 = v7;
      }
      else
      {
        id v16 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
        if (!v16)
        {
          id v15 = [(SKGProcessor *)self copyDomainIdentifierFromRecord:v6];
          if (!v15)
          {
            id v16 = 0;
            goto LABEL_15;
          }
          BOOL v20 = +[SKGProcessorContext sharedContext];
          id v21 = [v20 docUnderstandingItemDomainIds];
          int v22 = [v21 containsObject:v15];

          id v16 = 0;
          if (v22) {
            goto LABEL_11;
          }
          goto LABEL_14;
        }
      }
      id v17 = +[SKGProcessorContext sharedContext];
      int v18 = [v17 docUnderstandingIncludeBundles];
      char v19 = [v18 containsObject:v16];

      if (v19)
      {
LABEL_11:
        LOBYTE(v15) = 1;
LABEL_15:

        goto LABEL_16;
      }
LABEL_14:
      LOBYTE(v15) = 0;
      goto LABEL_15;
    }
  }
  LOBYTE(v15) = 0;
LABEL_17:

  return (char)v15;
}

- (BOOL)shouldGenerateDocumentUnderstandingForRecord:(id)a3 bundleID:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(SKGProcessor *)self copyStringValueFromRecord:v5 key:@"_kMDItemOCRContentLevel1"];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(SKGProcessor *)self copyDocumentTypesFromRecord:v5];
    int v9 = v8;
    if (v8)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (v15)
            {
              int v16 = objc_msgSend(v15, "intValue", (void)v19);
              if (v16 > 11245)
              {
                if (v16 == 11246 || v16 == 12539)
                {
LABEL_21:
                  BOOL v7 = 1;
                  goto LABEL_24;
                }
              }
              else if (v16 == 492 || v16 == 960)
              {
                goto LABEL_21;
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          BOOL v7 = 0;
          if (v12) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v7 = 0;
      }
LABEL_24:
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (void)setQueue:(id)a3
{
}

- (id)queue
{
  return self->_queue;
}

- (id)copyReferenceIdentifierFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_10;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"_kMDItemExternalID", (const void **)&value)) {
    goto LABEL_10;
  }
  id v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_10;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      uint64_t v7 = [[NSString alloc] initWithString:v5];
LABEL_9:
      id v5 = (void *)v7;
      goto LABEL_11;
    }
    if (v6 == CFNumberGetTypeID())
    {
      uint64_t v7 = [[NSString alloc] initWithFormat:@"%@", v5];
      goto LABEL_9;
    }
LABEL_10:
    id v5 = 0;
  }
LABEL_11:

  return v5;
}

- (id)copyDomainIdentifierFromRecord:(id)a3
{
  return [(SKGProcessor *)self copyStringValueFromRecord:a3 key:@"_kMDItemDomainIdentifier"];
}

- (id)copyPersonaFromRecord:(id)a3
{
  return @"1";
}

- (id)copyEmbeddingVersionFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemEmbeddingVersion", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      id v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyEmbeddingModelVersionFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"_kMDItemMediaEmbeddingVersion", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      id v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copySuggestedEventsVersionFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemSuggestedEventsVersion", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      id v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyDocumentUnderstandingVersionFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemDocumentUnderstandingVersion", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      id v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyDocumentTypesFromRecord:(id)a3
{
  if (a3) {
    return copyArrayValueForKey((const __CFDictionary *)a3, @"kMDItemPhotosSceneClassificationIdentifiers");
  }
  else {
    return 0;
  }
}

- (id)copyPeopleVersionFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"_kMDItemKnowledgeIndexVersion", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      id v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v5, "intValue"));
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyProtectionClassFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"_kMDItemProtectionClass", (const void **)&value)
    || (id v5 = value, value == (void *)*MEMORY[0x263EFFD08])
    || !value)
  {
    uint64_t v7 = @"Default";
    goto LABEL_9;
  }
  CFTypeID v6 = CFGetTypeID(value);
  if (v6 != CFStringGetTypeID())
  {
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = (__CFString *)[[NSString alloc] initWithString:v5];
LABEL_9:

  return v7;
}

- (id)copyLanguageFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemTextContentLanguage", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      uint64_t v7 = (void *)[[NSString alloc] initWithString:v5];
      id v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      id v5 = [v7 stringByTrimmingCharactersInSet:v8];

      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyTextContentFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemTextContent", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      uint64_t v7 = (void *)[[NSString alloc] initWithString:v5];
      id v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      id v5 = [v7 stringByTrimmingCharactersInSet:v8];

      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyDescriptionContentFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemDescription", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      uint64_t v7 = (void *)[[NSString alloc] initWithString:v5];
      id v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      id v5 = [v7 stringByTrimmingCharactersInSet:v8];

      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyContentURLFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemContentURL", (const void **)&value)) {
    goto LABEL_9;
  }
  id v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_9;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      uint64_t v7 = [NSString stringWithString:v5];
      id v5 = (void *)[objc_alloc(NSURL) initWithString:v7];

      goto LABEL_10;
    }
    if (v6 == CFURLGetTypeID())
    {
      id v5 = (void *)[v5 copy];
      goto LABEL_10;
    }
LABEL_9:
    id v5 = 0;
  }
LABEL_10:

  return v5;
}

- (id)copyContentTypeFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemContentType", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      id v5 = (void *)[[NSString alloc] initWithString:v5];
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copySnippetFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"_kMDItemSnippet", (const void **)&value)) {
    goto LABEL_7;
  }
  id v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      id v5 = (void *)[[NSString alloc] initWithString:v5];
      goto LABEL_8;
    }
LABEL_7:
    id v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)copyNumberValueFromRecord:(id)a3 key:(id)a4
{
  CFDictionaryRef v5 = (const __CFDictionary *)a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_8;
  }
  ValueForKey = getValueForKey(v5, v6);
  id v8 = ValueForKey;
  if (ValueForKey)
  {
    CFTypeID v9 = CFGetTypeID(ValueForKey);
    if (v9 == CFNumberGetTypeID())
    {
      uint64_t v10 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v8, "intValue"));
LABEL_7:
      id v8 = (void *)v10;
      goto LABEL_9;
    }
    if (v9 == CFBooleanGetTypeID())
    {
      uint64_t v10 = [objc_alloc(NSNumber) initWithBool:CFBooleanGetValue((CFBooleanRef)v8) != 0];
      goto LABEL_7;
    }
LABEL_8:
    id v8 = 0;
  }
LABEL_9:

  return v8;
}

- (id)copyTitleFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_13;
  }
  value = 0;
  int ValueIfPresent = CFDictionaryGetValueIfPresent(v3, @"kMDItemSubject", (const void **)&value);
  id v6 = (void **)MEMORY[0x263EFFD08];
  if (ValueIfPresent)
  {
    uint64_t v7 = value;
    if (value != (void *)*MEMORY[0x263EFFD08])
    {
      if (value) {
        goto LABEL_11;
      }
    }
  }
  value = 0;
  if (CFDictionaryGetValueIfPresent(v4, @"kMDItemTitle", (const void **)&value))
  {
    uint64_t v7 = value;
    if (value != *v6)
    {
      if (value) {
        goto LABEL_11;
      }
    }
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v4, @"kMDItemDisplayName", (const void **)&value)) {
    goto LABEL_13;
  }
  uint64_t v7 = value;
  if (value == *v6) {
    goto LABEL_13;
  }
  if (value)
  {
LABEL_11:
    CFTypeID v8 = CFGetTypeID(v7);
    if (v8 == CFStringGetTypeID())
    {
      CFTypeID v9 = (void *)[[NSString alloc] initWithString:v7];
      uint64_t v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      uint64_t v7 = [v9 stringByTrimmingCharactersInSet:v10];

      goto LABEL_14;
    }
LABEL_13:
    uint64_t v7 = 0;
  }
LABEL_14:

  return (id)v7;
}

- (id)copyStringArrayFromRecordAndConcatnate:(id)a3 key:(id)a4
{
  if (!a3) {
    return 0;
  }
  CFDictionaryRef v4 = copyArrayValueForKey((const __CFDictionary *)a3, a4);
  if ([(__CFArray *)v4 count])
  {
    id v5 = [NSString alloc];
    id v6 = [(__CFArray *)v4 componentsJoinedByString:@", "];
    uint64_t v7 = (void *)[v5 initWithString:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)copyExtraDataFromWalletRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemExtraData", (const void **)&value)) {
    goto LABEL_9;
  }
  CFArrayRef v5 = (const __CFArray *)value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_9;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFArrayGetTypeID() && CFArrayGetCount(v5) >= 2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, 1);
      CFTypeID v8 = CFGetTypeID(ValueAtIndex);
      if (v8 == CFDataGetTypeID())
      {
        CFArrayRef v5 = (const __CFArray *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithData:ValueAtIndex];
        goto LABEL_10;
      }
    }
LABEL_9:
    CFArrayRef v5 = 0;
  }
LABEL_10:

  return v5;
}

- (id)dateFromRecord:(id)a3 key:(id)a4
{
  CFDictionaryRef v5 = (const __CFDictionary *)a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_5;
  }
  ValueForKey = getValueForKey(v5, v6);
  id v8 = ValueForKey;
  if (!ValueForKey) {
    goto LABEL_6;
  }
  CFTypeID v9 = CFGetTypeID(ValueForKey);
  if (v9 == CFDateGetTypeID()) {
    id v8 = v8;
  }
  else {
LABEL_5:
  }
    id v8 = 0;
LABEL_6:

  return v8;
}

- (id)referenceDateForRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    CFDictionaryRef v5 = [(SKGProcessor *)self dateFromRecord:v4 key:@"com_apple_mail_dateReceived"];
    if (v5) {
      goto LABEL_6;
    }
    uint64_t v6 = [(SKGProcessor *)self dateFromRecord:v4 key:@"kMDItemContentCreationDate"];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263EFF910] now];
  }
  CFDictionaryRef v5 = (void *)v6;
LABEL_6:

  return v5;
}

- (id)copyDateStringFromRecordWithFormat:(id)a3 key:(id)a4 formatString:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    CFTypeID v9 = [(SKGProcessor *)self dateFromRecord:a3 key:a4];
    if (v9)
    {
      uint64_t v10 = +[SKGSystemListener sharedProcessorListener];
      uint64_t v11 = [v10 currentTimezone];

      id v12 = objc_alloc_init(MEMORY[0x263F08790]);
      [v12 setDateFormat:v8];
      [v12 setTimeZone:v11];
      a3 = [v12 stringFromDate:v9];
    }
    else
    {
      a3 = 0;
    }
  }
  return a3;
}

- (id)copyFilePathFromRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemPath", (const void **)&value)) {
    goto LABEL_7;
  }
  CFDictionaryRef v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      uint64_t v7 = (void *)[[NSString alloc] initWithString:v5];
      id v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      CFDictionaryRef v5 = [v7 stringByTrimmingCharactersInSet:v8];

      goto LABEL_8;
    }
LABEL_7:
    CFDictionaryRef v5 = 0;
  }
LABEL_8:

  return v5;
}

+ (id)copyMailboxesFromRecord:(id)a3
{
  if (a3) {
    return copyArrayValueForKey((const __CFDictionary *)a3, @"kMDItemMailboxes");
  }
  else {
    return 0;
  }
}

- (BOOL)recordIsRecent:(id)a3 toCalendarUnit:(unint64_t)a4 maxOffset:(unint64_t)a5 dateKeys:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v12) {
    goto LABEL_16;
  }
  uint64_t v13 = v12;
  unint64_t v26 = a5;
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v28 != v15) {
        objc_enumerationMutation(v11);
      }
      id v17 = [(SKGProcessor *)self dateFromRecord:v10 key:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      if (!v14 || [v14 compare:v17] == -1)
      {
        id v18 = v17;

        uint64_t v14 = v18;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v13);
  if (v14)
  {
    long long v19 = [MEMORY[0x263EFF8F0] currentCalendar];
    long long v20 = [MEMORY[0x263EFF910] now];
    long long v21 = [v19 components:a4 fromDate:v14 toDate:v20 options:0];

    if (v21)
    {
      if (a4 == 4)
      {
        unint64_t v23 = [v21 year];
        unint64_t v22 = v26;
      }
      else
      {
        unint64_t v22 = v26;
        if (a4 == 16) {
          unint64_t v23 = [v21 day];
        }
        else {
          unint64_t v23 = [v21 month];
        }
      }
      BOOL v24 = v23 <= v22;
    }
    else
    {
      BOOL v24 = 1;
    }
  }
  else
  {
LABEL_16:
    BOOL v24 = 1;
  }

  return v24;
}

- (BOOL)recordIsCurrent:(id)a3 toCalendarUnit:(unint64_t)a4 maxOffset:(unint64_t)a5 checkFuture:(BOOL)a6 dateKeys:(id)a7
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v12 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = a7;
  uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v13)
  {
    int v16 = 0;
    goto LABEL_21;
  }
  uint64_t v14 = v13;
  BOOL v38 = a6;
  unint64_t v39 = a4;
  unint64_t v37 = a5;
  uint64_t v15 = 0;
  int v16 = 0;
  uint64_t v17 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v42 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * i);
      long long v20 = -[SKGProcessor dateFromRecord:key:](self, "dateFromRecord:key:", v12, v19, v37);
      if ([&unk_270B14E60 containsObject:v19])
      {
        id v21 = v20;

        uint64_t v15 = v21;
      }
      if (!v16 || [v16 compare:v20] == -1)
      {
        id v22 = v20;

        int v16 = v22;
      }
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  }
  while (v14);
  if (!v15)
  {
    unint64_t v26 = v39;
    if (v16)
    {
      long long v27 = [MEMORY[0x263EFF8F0] currentCalendar];
      long long v28 = [MEMORY[0x263EFF910] now];
      long long v29 = v27;
      unint64_t v30 = v39;
      v31 = v16;
      uint64_t v32 = v28;
LABEL_24:
      v33 = [v29 components:v30 fromDate:v31 toDate:v32 options:0];

      if (v33)
      {
        if (v26 == 4)
        {
          unint64_t v35 = [v33 year];
          unint64_t v34 = v37;
        }
        else
        {
          unint64_t v34 = v37;
          if (v26 == 0x2000)
          {
            unint64_t v35 = [v33 weekOfYear];
          }
          else if (v26 == 16)
          {
            unint64_t v35 = [v33 day];
          }
          else
          {
            unint64_t v35 = [v33 month];
          }
        }
        BOOL v25 = v35 <= v34;

        goto LABEL_34;
      }
LABEL_29:
      BOOL v25 = 0;
      goto LABEL_34;
    }
LABEL_21:
    uint64_t v15 = 0;
    goto LABEL_29;
  }
  double v23 = MEMORY[0x2611D3A60](v15);
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL v25 = v23 < Current && !v38;
  unint64_t v26 = v39;
  if (v38 && v23 >= Current)
  {
    long long v27 = [MEMORY[0x263EFF8F0] currentCalendar];
    long long v28 = [MEMORY[0x263EFF910] now];
    long long v29 = v27;
    unint64_t v30 = v39;
    v31 = v28;
    uint64_t v32 = v15;
    goto LABEL_24;
  }
LABEL_34:

  return v25;
}

+ (BOOL)recordHasTextContent:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (v3
    && (value = 0, CFDictionaryGetValueIfPresent(v3, @"kMDItemTextContent", (const void **)&value))
    && value != (void *)*MEMORY[0x263EFFD08]
    && value)
  {
    CFTypeID v5 = CFGetTypeID(value);
    BOOL v6 = v5 == CFStringGetTypeID();
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)recordHasHTMLContent:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (v3
    && (value = 0, CFDictionaryGetValueIfPresent(v3, @"kMDItemHTMLContentData", (const void **)&value))
    && value != (void *)*MEMORY[0x263EFFD08]
    && value)
  {
    CFTypeID v5 = CFGetTypeID(value);
    BOOL v6 = v5 == CFDataGetTypeID();
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (unint64_t)getHTMLContentByteSizeForRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemHTMLContentData", (const void **)&value)) {
    goto LABEL_7;
  }
  CFDataRef Length = (const __CFData *)value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFDataGetTypeID())
    {
      CFDataRef Length = (const __CFData *)CFDataGetLength(Length);
      goto LABEL_8;
    }
LABEL_7:
    CFDataRef Length = 0;
  }
LABEL_8:

  return (unint64_t)Length;
}

+ (unint64_t)getTextContentByteSizeForRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(v3, @"kMDItemTextContent", (const void **)&value)) {
    goto LABEL_7;
  }
  CFTypeID v5 = value;
  if (value == (void *)*MEMORY[0x263EFFD08]) {
    goto LABEL_7;
  }
  if (value)
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFStringGetTypeID())
    {
      CFTypeID v5 = (void *)[v5 lengthOfBytesUsingEncoding:4];
      goto LABEL_8;
    }
LABEL_7:
    CFTypeID v5 = 0;
  }
LABEL_8:

  return (unint64_t)v5;
}

+ (unint64_t)textContentLengthForRecord:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  CFDictionaryRef v4 = v3;
  if (v3
    && (value = 0, CFDictionaryGetValueIfPresent(v3, @"_kMDItemTextContentLength", (const void **)&value))
    && (CFTypeID v5 = value, value != (void *)*MEMORY[0x263EFFD08])
    && value
    && (CFTypeID v6 = CFGetTypeID(value), v6 == CFNumberGetTypeID()))
  {
    unint64_t v7 = [v5 unsignedIntValue];
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (BOOL)recordForItemHasTextContent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SKGProcessor *)self recordContainsValue:v4 key:@"kMDItemTextContent"]
    || [(SKGProcessor *)self recordContainsValue:v4 key:@"_kMDItemSnippet"];

  return v5;
}

- (BOOL)recordForItemWillHaveTextContent:(id)a3
{
  id v4 = a3;
  char v5 = [(SKGProcessor *)self recordContainsValue:v4 key:@"kMDItemTextContent"];
  id v6 = [(SKGProcessor *)self copyFileProviderIDFromRecord:v4];
  unint64_t v7 = v6;
  if ((v5 & 1) == 0 && v6)
  {
    id v8 = [(SKGProcessor *)self copyNumberValueFromRecord:v4 key:@"_kMDItemRequiresImport"];
    id v9 = [(SKGProcessor *)self copyContentTypeFromRecord:v4];
    id v10 = v9;
    char v5 = 0;
    if (v8 && v9)
    {
      if ([v8 BOOLValue]
        && ([v10 isEqualToString:@"public.folder"] & 1) == 0)
      {
        char v5 = [v8 BOOLValue];
      }
      else
      {
        char v5 = 0;
      }
    }
  }
  return v5;
}

- (BOOL)itemForRecordHasTextContent:(id)a3
{
  id v3 = [(SKGProcessor *)self copyNumberValueFromRecord:a3 key:@"_kMDItemTextContentIndexExists"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)updateSKGProcessorAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 isUpdate:(BOOL)a7 processorFlags:(unint64_t)a8
{
  char v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (![v15 count]) {
    goto LABEL_7;
  }
  id v18 = +[SKGProcessor sharedProcessor];
  int v19 = [v18 recordIsValid:v15];

  if (!v19) {
    goto LABEL_7;
  }
  long long v20 = [v15 objectForKeyedSubscript:@"_kMDItemEmbeddingsSN"];
  if (v20
    || ([v15 objectForKeyedSubscript:@"_kMDItemKeyphrasesSN"],
        (long long v20 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v15 objectForKeyedSubscript:@"_kMDItemSuggestedEventsSN"],
        (long long v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_7:
    LOBYTE(v21) = 0;
    goto LABEL_8;
  }
  double v23 = [v15 objectForKeyedSubscript:@"_kMDItemDocumentUnderstandingSN"];

  if (v23) {
    goto LABEL_7;
  }
  if ([(SKGProcessor *)self recordForItemHasTextContent:v15]
    || [(SKGProcessor *)self recordForItemWillHaveTextContent:v15])
  {
    uint64_t v24 = 1;
    BOOL v25 = 1;
  }
  else
  {
    BOOL v25 = [(SKGProcessor *)self itemForRecordHasTextContent:v15];
    uint64_t v24 = 0;
  }
  if ((v8 & 4) != 0)
  {
    LOBYTE(v26) = a7;
    int v21 = [(SKGProcessor *)self updateSKGProcessorKeyphrasesAttributes:v14 record:v15 bundleID:v16 protectionClass:v17 recordHasText:v24 itemHasText:v25 isUpdate:v26];
  }
  else
  {
    int v21 = 0;
  }
  if ((v8 & 0x20) != 0)
  {
    LOBYTE(v26) = a7;
    v21 |= [(SKGProcessor *)self updateSKGProcessorDocUnderstandingAttributes:v14 record:v15 bundleID:v16 protectionClass:v17 recordHasText:v24 itemHasText:v25 isUpdate:v26];
  }
LABEL_8:

  return v21;
}

- (BOOL)updateSKGReindexerAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 processorFlags:(unint64_t)a6
{
  char v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 count]
    && (+[SKGProcessor sharedProcessor],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 recordIsValid:v11],
        v13,
        v14))
  {
    BOOL v15 = [(SKGProcessor *)self itemForRecordHasTextContent:v11];
    if ((v6 & 4) != 0)
    {
      int v16 = [(SKGProcessor *)self updateSKGReindexerKeyphrasesAttributes:v10 record:v11 bundleID:v12 itemHasText:v15];
      if ((v6 & 0x20) != 0) {
LABEL_9:
      }
        v16 |= [(SKGProcessor *)self updateSKGReindexerDocUnderstandingAttributes:v10 record:v11 bundleID:v12 itemHasText:v15];
    }
    else
    {
      int v16 = 0;
      if ((v6 & 0x20) != 0) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)needsPriorityForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
  }
  id v10 = v9;
  if (SKGBundleIsMail(v9)) {
    id v11 = &unk_270B14E78;
  }
  else {
    id v11 = &unk_270B14E90;
  }
  BOOL v12 = [(SKGProcessor *)self recordIsCurrent:v6 toCalendarUnit:16 maxOffset:3 checkFuture:0 dateKeys:v11];
  BOOL v13 = v12 | [(SKGProcessor *)self recordIsCurrent:v6 toCalendarUnit:8 maxOffset:3 checkFuture:1 dateKeys:&unk_270B14EA8];

  return v13;
}

+ (BOOL)docContentExceedsMaxAllowedSize:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[SKGProcessor getHTMLContentByteSizeForRecord:v3];
  unint64_t v5 = +[SKGProcessor getTextContentByteSizeForRecord:v3];

  return v5 + v4 > 0x100000;
}

+ (BOOL)docIsTrashOrJunkMail:(id)a3
{
  id v3 = +[SKGProcessor copyMailboxesFromRecord:a3];
  if ([v3 containsObject:*MEMORY[0x263F01CA0]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 containsObject:*MEMORY[0x263F01C90]];
  }

  return v4;
}

- (BOOL)needsSuggestedEventsForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    char v8 = +[SKGProcessor sharedProcessor];
    int v9 = [v8 recordIsValid:v6];

    if (v9)
    {
      id v10 = [(SKGProcessor *)self copySuggestedEventsVersionFromRecord:v6];
      id v11 = v10;
      if (v10
        && (int v12 = [v10 intValue],
            +[SKGProcessorContext sharedContext],
            BOOL v13 = objc_claimAutoreleasedReturnValue(),
            uint64_t v14 = [v13 suggestedEventsVersion],
            v13,
            v14 == v12))
      {
        char v15 = 0;
      }
      else
      {
        if (v7)
        {
          id v16 = v7;
        }
        else
        {
          id v16 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
          if (!v16)
          {
            char v15 = 1;
            goto LABEL_11;
          }
        }
        id v17 = +[SKGProcessorContext sharedContext];
        id v18 = [v17 suggestedEventsIncludeBundles];
        char v15 = [v18 containsObject:v16];
      }
LABEL_11:

      goto LABEL_12;
    }
  }
  char v15 = 0;
LABEL_12:

  return v15;
}

- (BOOL)shouldGenerateSuggestedEventsForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
    if (!v9) {
      goto LABEL_5;
    }
  }
  id v10 = +[SKGProcessorContext sharedContext];
  id v11 = [v10 suggestedEventsIncludeBundles];
  int v12 = [v11 containsObject:v9];

  if (!v12) {
    goto LABEL_14;
  }
LABEL_5:
  if (!+[SKGProcessor recordHasTextContent:v6]
    && !+[SKGProcessor recordHasHTMLContent:v6])
  {
    goto LABEL_14;
  }
  if (+[SKGProcessor docContentExceedsMaxAllowedSize:v6])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = 0;
      BOOL v13 = &_os_log_internal;
      uint64_t v14 = "**** shouldGenerateSuggestedEventsForRecord: ignoring doc as content exceeds max allowed size";
      char v15 = (uint8_t *)&v27;
LABEL_13:
      _os_log_impl(&dword_25E348000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (+[SKGProcessor docIsTrashOrJunkMail:v6])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = 0;
      BOOL v13 = &_os_log_internal;
      uint64_t v14 = "**** shouldGenerateSuggestedEventsForRecord: ignoring doc as trash or spam email";
      char v15 = (uint8_t *)&v26;
      goto LABEL_13;
    }
LABEL_14:
    BOOL v16 = 0;
    goto LABEL_15;
  }
  id v18 = [(SKGProcessor *)self copyFileProviderIDFromRecord:v6];

  if (v18)
  {
    id v19 = [(SKGProcessor *)self copyNumberValueFromRecord:v6 key:@"_kMDItemRequiresImport"];
    id v20 = [(SKGProcessor *)self copyContentTypeFromRecord:v6];
    int v21 = v20;
    BOOL v16 = v19
       && v20
       && [v19 BOOLValue]
       && ![v21 isEqualToString:@"public.folder"];
  }
  else
  {
    id v22 = [(SKGProcessor *)self copyNumberValueFromRecord:v6 key:@"_kMDItemTextContentIndexExists"];
    id v19 = v22;
    if (v22 && [v22 intValue])
    {
      BOOL v23 = 0;
    }
    else
    {
      id v24 = [(SKGProcessor *)self copySnippetFromRecord:v6];
      if (v24)
      {
        BOOL v23 = 0;
      }
      else
      {
        id v25 = [(SKGProcessor *)self copyTextContentFromRecord:v6];
        BOOL v23 = v25 == 0;
      }
    }
    BOOL v16 = !v23;
  }

LABEL_15:
  return v16;
}

+ (id)embeddingVersionDataWithVersion:(id)a3
{
  v10[3] = *MEMORY[0x263EF8340];
  v9[0] = @"SPOTLIGHT_CURRENT_MODEL_EMBEDDING_VERSION";
  v9[1] = @"SPOTLIGHT_CURRENT_EMBEDDING_VERSION";
  v10[0] = a3;
  v10[1] = &unk_270B14DA0;
  v9[2] = @"SPOTLIGHT_CURRENT_RELEASE_VERSION";
  v10[2] = &unk_270B14DA0;
  id v3 = NSDictionary;
  id v4 = a3;
  unint64_t v5 = [v3 dictionaryWithObjects:v10 forKeys:v9 count:3];
  uint64_t v8 = 0;
  id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v8];

  return v6;
}

+ (id)normalizeForEmbeddingGeneration:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    if (normalizeForEmbeddingGeneration_bundleID__onceToken != -1) {
      dispatch_once(&normalizeForEmbeddingGeneration_bundleID__onceToken, &__block_literal_global_4);
    }
    int IsCalendar = SKGBundleIsCalendar(v6, v7);
    id v9 = &normalizeForEmbeddingGeneration_bundleID__cRegex;
    if (!IsCalendar) {
      id v9 = &normalizeForEmbeddingGeneration_bundleID__sRegex;
    }
    id v10 = objc_msgSend((id)*v9, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), @" ");
    id v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    int v12 = [v10 stringByTrimmingCharactersInSet:v11];
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

uint64_t __74__SKGProcessor_EmbeddingsUtils__normalizeForEmbeddingGeneration_bundleID___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\s+" options:0 error:0];
  v1 = (void *)normalizeForEmbeddingGeneration_bundleID__sRegex;
  normalizeForEmbeddingGeneration_bundleID__sRegex = v0;

  normalizeForEmbeddingGeneration_bundleID__cRegex = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[\\t\\f\\r  ]+" options:0 error:0];
  return MEMORY[0x270F9A758]();
}

- (BOOL)embeddingRecordNeedsProcessing:(id)a3 bundleID:(id)a4 isUpdate:(BOOL)a5 hasTextContent:(BOOL)a6 shouldClear:(BOOL *)a7 shouldMarkComplete:(BOOL *)a8
{
  int v9 = a6;
  LODWORD(v10) = a5;
  id v13 = a3;
  id v14 = a4;
  char v15 = v14;
  BOOL v16 = a8;
  if (v14) {
    id v17 = v14;
  }
  else {
    id v17 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v13];
  }
  id v18 = v17;
  unint64_t v19 = [(SKGProcessor *)self copyTitleFromRecord:v13];

  if ((SKGBundleIsMail(v18) & 1) != 0 || SKGBundleIsPommesCtl(v18, v20))
  {
    int v22 = v10;
    BOOL v23 = self;
    BOOL v24 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemAuthors"];
    id v25 = +[SKGProcessor copyMailboxesFromRecord:v13];
    __int16 v26 = v25;
    if (v19) {
      int v27 = 1;
    }
    else {
      int v27 = v24;
    }
    v9 |= v27;
    LOBYTE(v10) = v22;
    long long v28 = v16;
    if (v9 == 1 && v22) {
      int v9 = [v25 count] != 0;
    }
    if (v16 && v9)
    {
      if ([v26 count])
      {
        int v74 = [v26 containsObject:@"mailbox.junk"];
        uint64_t v10 = [v13 objectForKeyedSubscript:@"kMDItemIsLikelyJunk"];
        if (v10)
        {
          [v13 objectForKeyedSubscript:@"kMDItemIsLikelyJunk"];
          v72 = v16;
          long long v29 = v18;
          v31 = unint64_t v30 = v15;
          int v32 = [v31 isEqualToNumber:&unk_270B14DB8] ^ 1;

          char v15 = v30;
          id v18 = v29;
          long long v28 = v72;
        }
        else
        {
          int v32 = 0;
        }

        LOBYTE(v10) = v22;
        if ((v74 | v32) == 1) {
          BOOL *v28 = 1;
        }
      }
      if (![(SKGProcessor *)v23 extractContentFromRecordForMail:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0])BOOL *v28 = 1; {
    }
      }
    goto LABEL_33;
  }
  if (!SKGBundleIsMessages(v18, v21))
  {
    if (SKGBundleIsSafari(v18, v33))
    {
      char v75 = v10;
      v36 = self;
      unint64_t v37 = v15;
      int v38 = [(SKGProcessor *)v36 recordContainsValue:v13 key:@"redirectSourceTitle"];
      BOOL v39 = [(SKGProcessor *)v36 recordContainsValue:v13 key:@"kMDItemContentURL"];
      BOOL v40 = [(SKGProcessor *)v36 recordContainsValue:v13 key:@"redirectSourceURL"];
      BOOL v41 = [(SKGProcessor *)v36 recordContainsValue:v13 key:@"kMDItemDescription"];
      if (v19) {
        int v42 = 1;
      }
      else {
        int v42 = v38;
      }
      int v9 = v42 | (v39 || v40) | v41;
      char v15 = v37;
      if (!v16)
      {
        LOBYTE(v10) = v75;
        goto LABEL_34;
      }
      LOBYTE(v10) = v75;
      if (!v9) {
        goto LABEL_34;
      }
      BOOL v34 = [(SKGProcessor *)v36 extractContentFromRecordForSafari:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0];
LABEL_51:
      LOBYTE(v9) = 1;
      if (v34) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    if (SKGBundleIsCalendar(v18, v35))
    {
      char v45 = v10;
      BOOL v76 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemAuthors"];
      BOOL v46 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemNamedLocation"];
      BOOL v47 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemComment"];
      v48 = self;
      id v49 = [(SKGProcessor *)self copyStringValueFromRecord:v13 key:@"kMDItemCalendarHolidayIdentifier"];
      __int16 v26 = v49;
      if (v49 && ([v49 isEqualToString:@"Y"] & 1) != 0)
      {
        LOBYTE(v9) = 0;
      }
      else
      {
        if (v19) {
          int v55 = 1;
        }
        else {
          int v55 = v76;
        }
        int v9 = v55 | (v46 || v47);
        if (v16)
        {
          LOBYTE(v10) = v45;
          if (v9)
          {
            LOBYTE(v9) = 1;
            if (![(SKGProcessor *)v48 extractContentFromRecordForCalendar:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0])*BOOL v16 = 1; {
          }
            }
          goto LABEL_33;
        }
      }
      LOBYTE(v10) = v45;
LABEL_33:

      goto LABEL_34;
    }
    if (SKGBundleIsReminders(v18, v44))
    {
      LOBYTE(v51) = v10;
      BOOL v52 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemNamedLocation"];
      BOOL v53 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemComment"];
      if (v19) {
        int v54 = 1;
      }
      else {
        int v54 = v52;
      }
      int v9 = v54 | v53;
      if (a8)
      {
        LOBYTE(v10) = v51;
        if (!v9) {
          goto LABEL_34;
        }
        BOOL v34 = [(SKGProcessor *)self extractContentFromRecordForReminders:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0];
        goto LABEL_51;
      }
LABEL_105:
      LOBYTE(v10) = v51;
      goto LABEL_34;
    }
    int v51 = v10;
    if (SKGBundleIsWallet(v18, v50))
    {
      unint64_t v57 = [(SKGProcessor *)self copyExtraDataFromWalletRecord:v13];
      if (v19 | v57) {
        int v9 = 1;
      }
      if (a8
        && v9
        && ![(SKGProcessor *)self extractContentFromRecordForWallet:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0])
      {
        *a8 = 1;
      }

      goto LABEL_105;
    }
    if (SKGBundleIsEvent(v18, v56))
    {
      unint64_t v58 = [(SKGProcessor *)self copyStringValueFromRecord:v13 key:@"kMDItemEventType"];
      unint64_t v59 = [(SKGProcessor *)self copyStringValueFromRecord:v13 key:@"kMDItemTitle"];
      LOBYTE(v9) = (v58 | v59) != 0;
      if (a8
        && v58 | v59
        && ![(SKGProcessor *)self extractContentFromRecordForEvents:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0])
      {
        *a8 = 1;
      }

      goto LABEL_105;
    }
    v60 = self;
    BOOL v61 = [(SKGProcessor *)self recordContainsValue:v13 key:@"kMDItemDescription"];
    int v62 = [v18 hasPrefix:@"com.apple."];
    int v63 = v62;
    if (v19) {
      int v64 = v9;
    }
    else {
      int v64 = 0;
    }
    int v65 = v62 ^ 1;
    if (v19) {
      int v65 = 1;
    }
    int v66 = v62 | v64;
    BOOL v77 = v61;
    if (v65) {
      int v67 = v66;
    }
    else {
      int v67 = v9 | v61;
    }
    if (v67 == 1)
    {
      if (v9)
      {
        unint64_t v68 = +[SKGProcessor textContentLengthForRecord:v13];
        if (v68 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (![(SKGProcessor *)v60 recordContainsValue:v13 key:@"_kMDItemTextContentIndexExists"]&& ![(SKGProcessor *)v60 recordContainsValue:v13 key:@"_kMDItemSnippet"])
          {
            id v73 = [(SKGProcessor *)v60 copyFileProviderIDFromRecord:v13];
            if (v73)
            {
              v71 = v15;
              id v69 = [(SKGProcessor *)v60 copyContentURLFromRecord:v13];
              char v70 = [v69 isFileURL];

              char v15 = v71;
              if (v70) {
                goto LABEL_95;
              }
            }
          }
          if ([(SKGProcessor *)v60 extractContentFromRecord:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0])
          {
            goto LABEL_95;
          }
        }
        else if (v68 >= 0x14)
        {
          goto LABEL_95;
        }
      }
      *BOOL v16 = 1;
    }
LABEL_95:
    if (!a7)
    {
      LOBYTE(v9) = v67;
      goto LABEL_39;
    }
    if (v19 || (v9 & 1) != 0)
    {
      if (!v51)
      {
LABEL_104:
        LOBYTE(v9) = v67;
        goto LABEL_105;
      }
    }
    else if ((v63 & v77) != 1 || (v51 & 1) == 0)
    {
      goto LABEL_104;
    }
    *a7 = 1;
    goto LABEL_104;
  }
  if (a8 && v9)
  {
    BOOL v34 = [(SKGProcessor *)self extractContentFromRecordForMessages:v13 bundleID:v18 content:0 maxChunkCountPtr:0 textLength:0];
    goto LABEL_51;
  }
LABEL_34:
  if (a7 && (v10 & 1) == 0 && (v9 & 1) == 0)
  {
    LOBYTE(v9) = 0;
    BOOL v16 = a7;
LABEL_38:
    *BOOL v16 = 1;
  }
LABEL_39:

  return v9;
}

- (BOOL)extractContentFromRecordForMail:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  BOOL v16 = v15;
  if ((SKGBundleIsMail(v15) & 1) != 0 || SKGBundleIsPommesCtl(v16, v17))
  {
    id v18 = [(SKGProcessor *)self copyNumberValueFromRecord:v12 key:@"_kMDItemTextContentLength"];
    unint64_t v19 = [v18 unsignedIntegerValue];

    if (a7) {
      *a7 = v19;
    }
    if (a5 || v19 <= 0x13)
    {
      if (a5 || !v19)
      {
        int v21 = [(SKGProcessor *)self copyTextContentFromRecord:v12];
        if (!v21) {
          int v21 = [(SKGProcessor *)self copySnippetFromRecord:v12];
        }
        unint64_t v19 = stringComposedLengthForEmbeddingCheck(v21);
      }
      else
      {
        int v21 = 0;
      }
      int v22 = [(SKGProcessor *)self copyTitleFromRecord:v12];
      unint64_t v23 = stringComposedLengthForEmbeddingCheck(v22) + v19;
      if (a7) {
        *a7 = v23;
      }
      BOOL v20 = v23 > 0x13;
      if (v23 >= 0x14)
      {
        if (a5)
        {
          BOOL v24 = [(SKGProcessor *)self copyStringArrayFromRecordAndConcatnate:v12 key:@"kMDItemAuthors"];
          id v25 = &stru_270B13D80;
          if (v22) {
            __int16 v26 = v22;
          }
          else {
            __int16 v26 = &stru_270B13D80;
          }
          if (v24) {
            int v27 = v24;
          }
          else {
            int v27 = &stru_270B13D80;
          }
          if (v21) {
            id v25 = v21;
          }
          *a5 = [NSString stringWithFormat:@"%@ %@ %@", v26, v27, v25];
        }
        if (a6) {
          *a6 = 2;
        }
      }
    }
    else
    {
      BOOL v20 = 1;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)extractContentFromRecordForSafari:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v17 = v15;
  if (SKGBundleIsSafari(v15, v16))
  {
    id v18 = [(SKGProcessor *)self copyTitleFromRecord:v12];
    id v19 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"redirectSourceTitle"];
    id v20 = v19;
    BOOL v52 = a6;
    if (v19 && v18 && ([v19 isEqualToString:v18] & 1) == 0)
    {
      uint64_t v21 = [NSString stringWithFormat:@"%@ %@", v20, v18];

      id v18 = (__CFString *)v21;
    }
    id v49 = a5;
    int v51 = v20;
    id v22 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemContentURL"];
    v50 = v22;
    if ([v22 length])
    {
      unint64_t v23 = [MEMORY[0x263F08BA0] componentsWithString:v22];
      BOOL v24 = [v23 percentEncodedPath];
      id v25 = [v24 stringByReplacingOccurrencesOfString:@"/" withString:@" "];

      __int16 v26 = NSString;
      [v23 host];
      v28 = int v27 = a7;
      long long v29 = [v26 stringWithFormat:@"%@%@", v28, v25];

      a7 = v27;
    }
    else
    {
      long long v29 = 0;
    }
    id v31 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"redirectSourceURL"];
    if ([v31 length])
    {
      BOOL v47 = a7;
      v48 = v17;
      int v32 = [MEMORY[0x263F08BA0] componentsWithString:v31];
      v33 = [v32 percentEncodedPath];
      BOOL v34 = [v33 stringByReplacingOccurrencesOfString:@"/" withString:@" "];

      unint64_t v35 = NSString;
      v36 = [v32 host];
      unint64_t v37 = [v35 stringWithFormat:@"%@ %@", v36, v34];

      if (v37 && v29 && ([v37 isEqualToString:v29] & 1) == 0)
      {
        uint64_t v38 = [NSString stringWithFormat:@"%@%@", v37, v29];

        long long v29 = (__CFString *)v38;
      }

      a7 = v47;
      id v17 = v48;
    }
    BOOL v39 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemDescription"];
    uint64_t v40 = stringComposedLengthForEmbeddingCheck(v18);
    uint64_t v41 = stringComposedLengthForEmbeddingCheck(v29) + v40;
    unint64_t v42 = v41 + stringComposedLengthForEmbeddingCheck(v39);
    if (a7) {
      *a7 = v42;
    }
    BOOL v30 = v42 > 0x13;
    if (v42 >= 0x14)
    {
      if (v49)
      {
        long long v43 = &stru_270B13D80;
        if (v18) {
          long long v44 = v18;
        }
        else {
          long long v44 = &stru_270B13D80;
        }
        if (v29) {
          char v45 = v29;
        }
        else {
          char v45 = &stru_270B13D80;
        }
        if (v39) {
          long long v43 = v39;
        }
        *id v49 = [NSString stringWithFormat:@"%@ %@ %@", v44, v45, v43];
      }
      if (v52) {
        *BOOL v52 = 1;
      }
    }
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (BOOL)extractContentFromRecordForCalendar:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v17 = v15;
  if (SKGBundleIsCalendar(v15, v16))
  {
    BOOL v34 = a5;
    id v18 = [(SKGProcessor *)self copyTitleFromRecord:v12];
    unint64_t v35 = [(SKGProcessor *)self copyStringArrayFromRecordAndConcatnate:v12 key:@"kMDItemAuthors"];
    id v19 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemNamedLocation"];
    id v20 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemComment"];
    uint64_t v21 = [v20 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

    id v22 = +[SKGProcessor sharedProcessor];
    unint64_t v23 = (__CFString *)[v22 copyDateStringFromRecordWithFormat:v12, @"kMDItemStartDate", @"MMMM d, Y" key formatString];

    uint64_t v24 = stringComposedLengthForEmbeddingCheck(v18);
    uint64_t v25 = stringComposedLengthForEmbeddingCheck(v19) + v24;
    unint64_t v26 = v25 + stringComposedLengthForEmbeddingCheck(v21);
    if (a7) {
      *a7 = v26;
    }
    BOOL v27 = v26 > 0x13;
    if (v26 >= 0x14)
    {
      if (v34)
      {
        long long v28 = &stru_270B13D80;
        if (v18) {
          long long v29 = v18;
        }
        else {
          long long v29 = &stru_270B13D80;
        }
        if (v23) {
          BOOL v30 = v23;
        }
        else {
          BOOL v30 = &stru_270B13D80;
        }
        id v31 = v35;
        if (!v35) {
          id v31 = &stru_270B13D80;
        }
        if (v19) {
          int v32 = v19;
        }
        else {
          int v32 = &stru_270B13D80;
        }
        if (v21) {
          long long v28 = v21;
        }
        *BOOL v34 = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@", v29, v30, v31, v32, v28];
      }
      if (a6) {
        *a6 = 1;
      }
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (BOOL)extractContentFromRecordForReminders:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v17 = v15;
  if (SKGBundleIsReminders(v15, v16))
  {
    id v18 = [(SKGProcessor *)self copyTitleFromRecord:v12];
    id v19 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemNamedLocation"];
    id v20 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemComment"];
    uint64_t v21 = stringComposedLengthForEmbeddingCheck(v18);
    uint64_t v22 = stringComposedLengthForEmbeddingCheck(v19) + v21;
    unint64_t v23 = v22 + stringComposedLengthForEmbeddingCheck(v20);
    if (a7) {
      *a7 = v23;
    }
    BOOL v24 = v23 > 0x13;
    if (v23 >= 0x14)
    {
      if (a5)
      {
        uint64_t v25 = &stru_270B13D80;
        if (v18) {
          unint64_t v26 = v18;
        }
        else {
          unint64_t v26 = &stru_270B13D80;
        }
        if (v19) {
          BOOL v27 = v19;
        }
        else {
          BOOL v27 = &stru_270B13D80;
        }
        if (v20) {
          uint64_t v25 = v20;
        }
        *a5 = [NSString stringWithFormat:@"%@ %@ %@", v26, v27, v25];
      }
      if (a6) {
        *a6 = 1;
      }
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)extractContentFromRecordForWallet:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v17 = v15;
  if (SKGBundleIsWallet(v15, v16))
  {
    id v31 = a6;
    id v18 = [(SKGProcessor *)self copyTitleFromRecord:v12];
    id v19 = [(SKGProcessor *)self copyExtraDataFromWalletRecord:v12];
    uint64_t v34 = 0;
    unint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000;
    unint64_t v37 = __Block_byref_object_copy__2;
    uint64_t v38 = __Block_byref_object_dispose__2;
    id v39 = 0;
    id v39 = objc_alloc_init(MEMORY[0x263F089D8]);
    if (v19)
    {
      id v33 = 0;
      id v20 = [MEMORY[0x263F08900] JSONObjectWithData:v19 options:1 error:&v33];
      id v21 = v33;
      uint64_t v22 = v21;
      if (v20 && !v21)
      {
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __112__SKGProcessor_EmbeddingsUtils__extractContentFromRecordForWallet_bundleID_content_maxChunkCountPtr_textLength___block_invoke;
        v32[3] = &unk_265521928;
        v32[4] = &v34;
        [v20 enumerateKeysAndObjectsUsingBlock:v32];
      }
    }
    unint64_t v23 = +[SKGProcessor normalizeForEmbeddingGeneration:v35[5] bundleID:v14];
    if (![v23 length])
    {
      id v24 = [(SKGProcessor *)self copyTextContentFromRecord:v12];
      if (!v24) {
        id v24 = [(SKGProcessor *)self copySnippetFromRecord:v12];
      }

      unint64_t v23 = v24;
    }
    uint64_t v25 = stringComposedLengthForEmbeddingCheck(v18);
    unint64_t v26 = stringComposedLengthForEmbeddingCheck(v23) + v25;
    if (a7) {
      *a7 = v26;
    }
    BOOL v27 = v26 > 0x13;
    if (v26 >= 0x14)
    {
      if (a5)
      {
        long long v28 = &stru_270B13D80;
        if (v18) {
          long long v29 = v18;
        }
        else {
          long long v29 = &stru_270B13D80;
        }
        if (v35[5]) {
          long long v28 = (__CFString *)v35[5];
        }
        *a5 = [NSString stringWithFormat:@"%@ %@", v29, v28];
      }
      if (v31) {
        unint64_t *v31 = 1;
      }
    }

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

uint64_t __112__SKGProcessor_EmbeddingsUtils__extractContentFromRecordForWallet_bundleID_content_maxChunkCountPtr_textLength___block_invoke(uint64_t a1, __CFString *a2, __CFString *a3)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = &stru_270B13D80;
  if (a2) {
    id v5 = a2;
  }
  else {
    id v5 = &stru_270B13D80;
  }
  if (a3) {
    id v4 = a3;
  }
  return [v3 appendFormat:@" %@ %@", v5, v4];
}

- (BOOL)extractContentFromRecordForEvents:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v17 = v15;
  if (!SKGBundleIsEvent(v15, v16))
  {
    BOOL v20 = 0;
    goto LABEL_78;
  }
  id v18 = [(SKGProcessor *)self copyNumberValueFromRecord:v12 key:@"_kMDItemTextContentLength"];
  unint64_t v19 = [v18 unsignedIntegerValue];

  if (a7) {
    *a7 = v19;
  }
  if (!a5 && v19 > 0x13)
  {
    BOOL v20 = 1;
    goto LABEL_78;
  }
  id v21 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventType"];
  uint64_t v22 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemTitle"];
  unint64_t v59 = a6;
  v60 = v22;
  if ([(__CFString *)v21 isEqualToString:@"hotel"])
  {
    unint64_t v23 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventHotelUnderName"];
    id v24 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventHotelReservationForAddress"];
    uint64_t v25 = &stru_270B13D80;
    if (v21) {
      unint64_t v26 = v21;
    }
    else {
      unint64_t v26 = &stru_270B13D80;
    }
    if (v22) {
      BOOL v27 = v22;
    }
    else {
      BOOL v27 = &stru_270B13D80;
    }
    if (v23) {
      long long v28 = v23;
    }
    else {
      long long v28 = &stru_270B13D80;
    }
    if (v24) {
      uint64_t v25 = v24;
    }
    long long v29 = [NSString stringWithFormat:@"This is %@ event document. Document title: %@. Customer name: %@. Event location: %@.", v26, v27, v28, v25];
  }
  else
  {
    if ([(__CFString *)v21 isEqualToString:@"flight"])
    {
      unint64_t v58 = [(SKGProcessor *)self copyStringArrayFromRecordAndConcatnate:v12 key:@"kMDItemEventCustomerNames"];
      unint64_t v57 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventProvider"];
      v56 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventFlightDepartureAirportCode"];
      int v55 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventFlightDepartureAirportLocality"];
      BOOL v30 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventFlightArrivalAirportCode"];
      id v31 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventFlightArrivalAirportLocality"];
      int v32 = &stru_270B13D80;
      if (v21) {
        id v33 = v21;
      }
      else {
        id v33 = &stru_270B13D80;
      }
      if (v22) {
        uint64_t v34 = v22;
      }
      else {
        uint64_t v34 = &stru_270B13D80;
      }
      uint64_t v36 = v57;
      unint64_t v35 = v58;
      if (!v58) {
        unint64_t v35 = &stru_270B13D80;
      }
      if (!v57) {
        uint64_t v36 = &stru_270B13D80;
      }
      uint64_t v38 = v55;
      unint64_t v37 = v56;
      if (!v56) {
        unint64_t v37 = &stru_270B13D80;
      }
      if (!v55) {
        uint64_t v38 = &stru_270B13D80;
      }
      if (v30) {
        id v39 = v30;
      }
      else {
        id v39 = &stru_270B13D80;
      }
      if (v31) {
        int v32 = v31;
      }
      long long v29 = [NSString stringWithFormat:@"This is %@ event document. Document title: %@. Customer name: %@. Airline: %@. Departure airport: %@. Departure location: %@. Arrival airport: %@. Arrival location: %@.", v33, v34, v35, v36, v37, v38, v39, v32];
    }
    else
    {
      if (![(__CFString *)v21 isEqualToString:@"restaurant"])
      {
        BOOL v47 = &stru_270B13D80;
        if (v21) {
          v48 = v21;
        }
        else {
          v48 = &stru_270B13D80;
        }
        if (v22) {
          BOOL v47 = v22;
        }
        long long v29 = [NSString stringWithFormat:@"This is %@ event document. Document title: %@.", v48, v47];
        goto LABEL_67;
      }
      unint64_t v58 = [(SKGProcessor *)self copyStringArrayFromRecordAndConcatnate:v12 key:@"kMDItemEventCustomerNames"];
      uint64_t v40 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventProvider"];
      uint64_t v41 = [(SKGProcessor *)self copyStringValueFromRecord:v12 key:@"kMDItemEventStartLocationAddress"];
      unint64_t v42 = &stru_270B13D80;
      if (v21) {
        long long v43 = v21;
      }
      else {
        long long v43 = &stru_270B13D80;
      }
      if (v22) {
        long long v44 = v22;
      }
      else {
        long long v44 = &stru_270B13D80;
      }
      char v45 = v58;
      if (!v58) {
        char v45 = &stru_270B13D80;
      }
      if (v40) {
        BOOL v46 = v40;
      }
      else {
        BOOL v46 = &stru_270B13D80;
      }
      if (v41) {
        unint64_t v42 = v41;
      }
      long long v29 = [NSString stringWithFormat:@"This is %@ event document. Document title: %@. Customer name: %@. Event provider: %@. Event location: %@.", v43, v44, v45, v46, v42];
    }
  }
LABEL_67:
  id v49 = [(SKGProcessor *)self copyDateStringFromRecordWithFormat:v12 key:@"kMDItemStartDate" formatString:@"MMMM d, Y HH:mm"];
  id v50 = [(SKGProcessor *)self copyDateStringFromRecordWithFormat:v12 key:@"kMDItemEndDate" formatString:@"MMMM d, Y HH:mm"];
  int v51 = v50;
  if (v49 && v50)
  {
    uint64_t v52 = [NSString stringWithFormat:@"%@ Event time range: %@ to %@.", v29, v49, v50];

    long long v29 = (void *)v52;
  }
  unint64_t v53 = stringComposedLengthForEmbeddingCheck(v29);
  if (a7) {
    *a7 = v53;
  }
  BOOL v20 = v53 > 0x13;
  if (v53 >= 0x14)
  {
    if (a5) {
      *a5 = (id)[v29 copy];
    }
    if (v59) {
      *unint64_t v59 = 1;
    }
  }

LABEL_78:
  return v20;
}

- (BOOL)extractContentFromRecordForMessages:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  id v17 = v15;
  if (SKGBundleIsMessages(v15, v16))
  {
    id v18 = [(SKGProcessor *)self copyNumberValueFromRecord:v12 key:@"_kMDItemTextContentLength"];
    unint64_t v19 = [v18 unsignedIntegerValue];

    if (a7) {
      *a7 = v19;
    }
    if (a5 || v19 <= 0x13)
    {
      if (a5 || !v19)
      {
        id v21 = [(SKGProcessor *)self copyTextContentFromRecord:v12];
        if (!v21) {
          id v21 = [(SKGProcessor *)self copySnippetFromRecord:v12];
        }
      }
      else
      {
        id v21 = 0;
      }
      uint64_t v22 = [(SKGProcessor *)self copyStringArrayFromRecordAndConcatnate:v12 key:@"kMDItemAuthors"];
      if ([(SKGProcessor *)self isStringOnlyNumbersOrPunctuationSpaces:v22])
      {

        uint64_t v22 = 0;
      }
      unint64_t v23 = stringComposedLengthForEmbeddingCheck(v21);
      if (a7) {
        *a7 = v23;
      }
      BOOL v20 = v23 > 0x13;
      if (v23 >= 0x14)
      {
        if (a5)
        {
          id v24 = &stru_270B13D80;
          if (v22) {
            uint64_t v25 = v22;
          }
          else {
            uint64_t v25 = &stru_270B13D80;
          }
          if (v21) {
            id v24 = v21;
          }
          *a5 = [NSString stringWithFormat:@"%@ %@", v25, v24];
        }
        if (a6) {
          *a6 = 1;
        }
      }
    }
    else
    {
      BOOL v20 = 1;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)extractContentFromRecord:(id)a3 bundleID:(id)a4 content:(id *)a5 maxChunkCountPtr:(unint64_t *)a6 textLength:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v12];
  }
  BOOL v16 = v15;
  if ((SKGBundleIsMail(v15) & 1) != 0 || SKGBundleIsPommesCtl(v16, v17))
  {
    BOOL v19 = [(SKGProcessor *)self extractContentFromRecordForMail:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
LABEL_7:
    BOOL v20 = v19;
    goto LABEL_8;
  }
  if (SKGBundleIsSafari(v16, v18))
  {
    BOOL v19 = [(SKGProcessor *)self extractContentFromRecordForSafari:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
    goto LABEL_7;
  }
  if (SKGBundleIsCalendar(v16, v22))
  {
    BOOL v19 = [(SKGProcessor *)self extractContentFromRecordForCalendar:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
    goto LABEL_7;
  }
  if (SKGBundleIsReminders(v16, v23))
  {
    BOOL v19 = [(SKGProcessor *)self extractContentFromRecordForReminders:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
    goto LABEL_7;
  }
  if (SKGBundleIsWallet(v16, v24))
  {
    BOOL v19 = [(SKGProcessor *)self extractContentFromRecordForWallet:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
    goto LABEL_7;
  }
  if (SKGBundleIsMessages(v16, v25))
  {
    BOOL v19 = [(SKGProcessor *)self extractContentFromRecordForMessages:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
    goto LABEL_7;
  }
  if (SKGBundleIsEvent(v16, v26))
  {
    BOOL v19 = [(SKGProcessor *)self extractContentFromRecordForEvents:v12 bundleID:v16 content:a5 maxChunkCountPtr:a6 textLength:a7];
    goto LABEL_7;
  }
  id v27 = [(SKGProcessor *)self copyNumberValueFromRecord:v12 key:@"_kMDItemTextContentLength"];
  unint64_t v28 = [v27 unsignedIntegerValue];

  if (a7) {
    *a7 = v28;
  }
  if (a5 || v28 <= 0x13)
  {
    if (a5 || !v28)
    {
      BOOL v30 = [(SKGProcessor *)self copyTextContentFromRecord:v12];
      if (v30)
      {
        long long v29 = v30;
        [v16 containsString:@"com.apple"];
      }
      else
      {
        long long v29 = [(SKGProcessor *)self copySnippetFromRecord:v12];
        int v31 = [v16 containsString:@"com.apple"];
        if (!v29 && v31) {
          long long v29 = [(SKGProcessor *)self copyDescriptionContentFromRecord:v12];
        }
      }
      unint64_t v28 = stringComposedLengthForEmbeddingCheck(v29);
    }
    else
    {
      long long v29 = 0;
    }
    int v32 = [(SKGProcessor *)self copyTitleFromRecord:v12];
    unint64_t v33 = stringComposedLengthForEmbeddingCheck(v32) + v28;
    if (a7) {
      *a7 = v33;
    }
    BOOL v20 = v33 > 0x13;
    if (v33 >= 0x14)
    {
      if (a5)
      {
        uint64_t v34 = &stru_270B13D80;
        if (v32) {
          unint64_t v35 = v32;
        }
        else {
          unint64_t v35 = &stru_270B13D80;
        }
        if (v29) {
          uint64_t v34 = v29;
        }
        *a5 = [NSString stringWithFormat:@"%@ %@", v35, v34];
      }
      if (a6) {
        *a6 = 2;
      }
    }
  }
  else
  {
    BOOL v20 = 1;
  }
LABEL_8:

  return v20;
}

- (BOOL)needsEmbeddingsForRecord:(id)a3 bundleID:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F78CD0] sharedInstance];
  int v9 = [v8 deviceCanGenerateEmbeddings];

  if (v9)
  {
    if ([v6 count])
    {
      uint64_t v10 = +[SKGProcessor sharedProcessor];
      int v11 = [v10 recordIsValid:v6];

      if (v11)
      {
        id v12 = [(SKGProcessor *)self copyEmbeddingVersionFromRecord:v6];
        id v13 = [(SKGProcessor *)self copyEmbeddingModelVersionFromRecord:v6];
        if (v12)
        {
          int v14 = [v12 intValue];
          id v15 = +[SKGProcessorContext sharedContext];
          if ([v15 embeddingVersion] == v14 && v13)
          {
            int v16 = [v13 intValue];
            id v17 = +[SKGProcessorContext sharedContext];
            uint64_t v18 = [v17 embeddingModelVersion];

            if (v18 == v16)
            {
              BOOL v19 = 0;
LABEL_42:

              goto LABEL_10;
            }
          }
          else
          {
          }
        }
        if (v7)
        {
          id v21 = v7;
        }
        else
        {
          id v21 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
          if (!v21) {
            goto LABEL_17;
          }
        }
        uint64_t v22 = +[SKGProcessorContext sharedContext];
        unint64_t v23 = [v22 embeddingExcludeBundles];
        char v24 = [v23 containsObject:v21];

        if (v24)
        {
          BOOL v19 = 0;
LABEL_41:

          goto LABEL_42;
        }
LABEL_17:
        id v25 = [(SKGProcessor *)self copyContentTypeFromRecord:v6];
        unint64_t v26 = v25;
        if (!v25)
        {
          BOOL v19 = 0;
LABEL_40:

          goto LABEL_41;
        }
        id v39 = v25;
        id v40 = v13;
        id v27 = [MEMORY[0x263F1D920] typeWithIdentifier:v25];
        if (v27)
        {
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          unint64_t v28 = +[SKGProcessorContext sharedContext];
          long long v29 = [v28 embeddingExcludeContentTypes];

          uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v50 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v46;
LABEL_21:
            uint64_t v33 = 0;
            while (1)
            {
              if (*(void *)v46 != v32) {
                objc_enumerationMutation(v29);
              }
              if ([v27 conformsToType:*(void *)(*((void *)&v45 + 1) + 8 * v33)]) {
                goto LABEL_36;
              }
              if (v31 == ++v33)
              {
                uint64_t v31 = [v29 countByEnumeratingWithState:&v45 objects:v50 count:16];
                if (v31) {
                  goto LABEL_21;
                }
                break;
              }
            }
          }
        }
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v34 = +[SKGProcessorContext sharedContext];
        long long v29 = [v34 embeddingExtractionAttributes];

        uint64_t v35 = [v29 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v42;
          while (2)
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v42 != v37) {
                objc_enumerationMutation(v29);
              }
              if ([(SKGProcessor *)self recordContainsValue:v6 key:*(void *)(*((void *)&v41 + 1) + 8 * i)])
              {
                BOOL v19 = 1;
                goto LABEL_39;
              }
            }
            uint64_t v36 = [v29 countByEnumeratingWithState:&v41 objects:v49 count:16];
            if (v36) {
              continue;
            }
            break;
          }
        }
LABEL_36:
        BOOL v19 = 0;
LABEL_39:

        unint64_t v26 = v39;
        id v13 = v40;
        goto LABEL_40;
      }
    }
  }
  BOOL v19 = 0;
LABEL_10:

  return v19;
}

- (BOOL)canGenerateEmbeddingsForMailRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
  }
  uint64_t v10 = v9;
  if ((SKGBundleIsMail(v9) & 1) != 0 || SKGBundleIsPommesCtl(v10, v11))
  {
    id v12 = +[SKGProcessor copyMailboxesFromRecord:v6];
    char v13 = [v12 containsObject:@"mailbox.junk"];
    int v14 = [v6 objectForKeyedSubscript:@"kMDItemIsLikelyJunk"];
    if (v14)
    {
      id v15 = [v6 objectForKeyedSubscript:@"kMDItemIsLikelyJunk"];
      char v16 = [v15 isEqualToNumber:&unk_270B14DB8];
    }
    else
    {
      char v16 = 1;
    }

    char v17 = v16 & ~v13;
  }
  else
  {
    char v17 = 1;
  }

  return v17;
}

- (BOOL)canGenerateEmbeddingsForFPRecord:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = [(SKGProcessor *)self copyFileProviderIDFromRecord:v5];
  if (v6)
  {
    id v7 = [(SKGProcessor *)self copyNumberValueFromRecord:v5 key:@"_kMDItemRequiresImport"];
    uint64_t v8 = v7;
    if (v7) {
      char v9 = [v7 BOOLValue];
    }
    else {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)shouldGenerateEmbeddingsForRecord:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v6];
  }
  uint64_t v10 = v9;
  int v11 = +[SKGProcessorContext sharedContext];
  id v12 = [v11 embeddingExcludeBundles];
  char v13 = [v12 containsObject:v10];

  if ((v13 & 1) == 0)
  {
    id v15 = [(SKGProcessor *)self copyDomainIdentifierFromRecord:v6];
    char v16 = +[SKGProcessorContext sharedContext];
    char v17 = [v16 embeddingExcludeDomainIdentifier];
    char v18 = [v17 containsObject:v15];

    if ((v18 & 1) != 0
      || ![(SKGProcessor *)self canGenerateEmbeddingsForFPRecord:v6 bundleID:v10]|| ![(SKGProcessor *)self canGenerateEmbeddingsForMailRecord:v6 bundleID:v10])
    {
      goto LABEL_13;
    }
    if (SKGBundleIsCalendar(v10, v19))
    {
      id v20 = [(SKGProcessor *)self copyStringValueFromRecord:v6 key:@"kMDItemCalendarHolidayIdentifier"];
      id v21 = v20;
      if (v20 && ([v20 isEqualToString:@"Y"] & 1) != 0)
      {

LABEL_13:
        BOOL v14 = 0;
        goto LABEL_14;
      }
    }
    uint64_t v28 = 0;
    id v23 = [(SKGProcessor *)self copyNumberValueFromRecord:v6 key:@"_kMDItemTextContentIndexExists"];
    if (v23
      || (id v23 = [(SKGProcessor *)self copySnippetFromRecord:v6]) != 0
      || (id v23 = [(SKGProcessor *)self copyTextContentFromRecord:v6]) != 0)
    {
    }
    else
    {
      id v24 = [(SKGProcessor *)self copyFileProviderIDFromRecord:v6];
      if (v24)
      {
        id v25 = v24;
        id v26 = [(SKGProcessor *)self copyContentURLFromRecord:v6];
        char v27 = [v26 isFileURL];

        if (v27)
        {
          BOOL v14 = 1;
          goto LABEL_14;
        }
      }
    }
    BOOL v14 = [(SKGProcessor *)self extractContentFromRecord:v6 bundleID:v10 content:0 maxChunkCountPtr:0 textLength:&v28];
LABEL_14:

    goto LABEL_15;
  }
  BOOL v14 = 0;
LABEL_15:

  return v14;
}

- (BOOL)isStringOnlyNumbersOrPunctuationSpaces:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  id v5 = [v3 predicateWithFormat:@"SELF MATCHES %@", @"^[0-9[:punct:]\\s]+$"];
  char v6 = [v5 evaluateWithObject:v4];

  return v6;
}

- (void)clearKeyphrasesAttributes:(id)a3
{
  uint64_t v3 = *MEMORY[0x263EFFD08];
  id v4 = a3;
  [v4 setObject:v3 forKey:@"_kMDItemNeedsKeyphrases"];
  [v4 setObject:v3 forKey:@"kMDItemKeyphraseLabels"];
  [v4 setObject:v3 forKey:@"kMDItemKeyphraseConfidences"];
  [v4 setObject:v3 forKey:@"kMDItemKeyphraseVersion"];
}

- (void)completeKeyphrasesAttributes:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = a3;
  id v6 = +[SKGProcessorContext sharedContext];
  id v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v6, "keyphraseVersion"));
  [v4 setObject:v5 forKey:@"kMDItemKeyphraseVersion"];
}

- (BOOL)keyphraseRecordNeedsProcessing:(id)a3 bundleID:(id)a4 isUpdate:(BOOL)a5 hasTextContent:(BOOL)a6 shouldClear:(BOOL *)a7 shouldMarkComplete:(BOOL *)a8
{
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a4;
  if (!v10)
  {
    if (a5) {
      goto LABEL_8;
    }
LABEL_7:
    *a7 = 1;
    goto LABEL_8;
  }
  if (+[SKGProcessor textContentLengthForRecord:v13] <= 0x13) {
    *a8 = 1;
  }
  if (a5) {
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

- (BOOL)updateSKGProcessorKeyphrasesAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 recordHasText:(BOOL)a7 itemHasText:(BOOL)a8 isUpdate:(BOOL)a9
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  char v18 = [v15 objectForKeyedSubscript:@"_kMDItemNeedsKeyphrases"];
  if (!v18)
  {
    BOOL v19 = [v15 objectForKeyedSubscript:@"kMDItemKeyphraseVersion"];

    if (v19) {
      goto LABEL_4;
    }
    uint64_t v22 = +[SKGProcessorContext sharedContext];
    uint64_t v23 = [v22 enableExtractions];

    if (v17
      && (v23 & 1) == 0
      && (([v17 isEqualToString:*MEMORY[0x263F08080]] & 1) != 0
       || [v17 isEqualToString:*MEMORY[0x263F08088]]))
    {
      [(SKGProcessor *)self clearKeyphrasesAttributes:v14];
      goto LABEL_4;
    }
    if (v16)
    {
      id v24 = v16;
    }
    else
    {
      id v24 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v15];
      if (!v24) {
        goto LABEL_16;
      }
    }
    id v25 = +[SKGProcessorContext sharedContext];
    id v26 = [v25 keyphraseExcludeBundles];
    int v27 = [v26 containsObject:v24];

    if (v27)
    {
      [(SKGProcessor *)self clearKeyphrasesAttributes:v14];
      LOBYTE(v20) = 0;
LABEL_22:

      goto LABEL_5;
    }
LABEL_16:
    __int16 v28 = 0;
    BOOL v20 = [(SKGProcessor *)self keyphraseRecordNeedsProcessing:v15 bundleID:v24 isUpdate:a9 hasTextContent:v9 shouldClear:(char *)&v28 + 1 shouldMarkComplete:&v28];
    if (v20)
    {
      if (HIBYTE(v28)) {
        [(SKGProcessor *)self clearKeyphrasesAttributes:v14];
      }
      if ((_BYTE)v28) {
        [(SKGProcessor *)self completeKeyphrasesAttributes:v14];
      }
      else {
        [v14 setObject:&unk_270B14DD0 forKey:@"_kMDItemNeedsKeyphrases"];
      }
    }
    goto LABEL_22;
  }

LABEL_4:
  LOBYTE(v20) = 0;
LABEL_5:

  return v20;
}

- (BOOL)updateSKGReindexerKeyphrasesAttributes:(id)a3 record:(id)a4 bundleID:(id)a5 itemHasText:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![(SKGProcessor *)self recordContainsValue:v11 key:@"_kMDItemNeedsKeyphrases"])
  {
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(SKGProcessor *)self copyBundleIdentifierFromRecord:v11];
      if (!v14) {
        goto LABEL_8;
      }
    }
    id v15 = +[SKGProcessorContext sharedContext];
    id v16 = [v15 keyphraseExcludeBundles];
    int v17 = [v16 containsObject:v14];

    if (v17)
    {
      [(SKGProcessor *)self clearKeyphrasesAttributes:v10];
      LOBYTE(v13) = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_8:
    id v18 = [(SKGProcessor *)self copyKeyphraseVersionFromRecord:v11];
    id v29 = v18;
    if (v18)
    {
      int v19 = objc_msgSend(v18, "intValue", v18);
      BOOL v20 = +[SKGProcessorContext sharedContext];
      BOOL v21 = [v20 keyphraseVersion] == v19;
    }
    else
    {
      BOOL v21 = 0;
    }
    id v22 = [(SKGProcessor *)self copyNumberValueFromRecord:v11, @"_kMDItemUpdaterVersion", v29 key];
    uint64_t v23 = v22;
    if (v22)
    {
      int v24 = [v22 intValue];
      id v25 = +[SKGProcessorContext sharedContext];
      BOOL v26 = [v25 textVersion] != v24;
    }
    else
    {
      BOOL v26 = 0;
    }
    __int16 v31 = 0;
    BOOL v13 = [(SKGProcessor *)self keyphraseRecordNeedsProcessing:v11 bundleID:v14 isUpdate:0 hasTextContent:v6 shouldClear:(char *)&v31 + 1 shouldMarkComplete:&v31]&& (!v21 || v26);
    if (HIBYTE(v31)) {
      [(SKGProcessor *)self clearKeyphrasesAttributes:v10];
    }
    int v27 = !v13;
    if (!(_BYTE)v31) {
      int v27 = 1;
    }
    if (((v27 | v21) & 1) == 0)
    {
      [(SKGProcessor *)self completeKeyphrasesAttributes:v10];
      LOBYTE(v13) = 0;
    }

    goto LABEL_21;
  }
  LOBYTE(v13) = 0;
LABEL_22:

  return v13;
}

@end