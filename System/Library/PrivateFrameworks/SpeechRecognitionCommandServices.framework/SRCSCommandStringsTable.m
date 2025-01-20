@interface SRCSCommandStringsTable
+ (BOOL)isLocaleIdentifier:(id)a3 containedInLocaleIdentifiers:(id)a4;
+ (BOOL)isSameLocaleIdentifier:(id)a3 secondLocaleIdentifier:(id)a4;
+ (NSArray)activeTargetTypes;
+ (NSArray)supportedTargetTypes;
+ (NSString)deviceName;
+ (id)commandStringsLoader;
+ (id)componentsFromLocaleIdentifier:(id)a3;
+ (id)formattedBuiltInCommandString:(id)a3;
+ (id)languageModelDictionaryFromCommandText:(id)a3 parsingErrorString:(id *)a4;
+ (void)setCommandStringsLoader:(id)a3;
- (BOOL)isSupportedCommandIdentifier:(id)a3 forLocaleIdentifier:(id)a4;
- (BOOL)isSupportedCommandIdentifier:(id)a3 forTargetTypes:(id)a4;
- (SRCSCommandStringsTable)initWithLocaleIdentifier:(id)a3;
- (id)_commandDescriptionsTable;
- (id)_commandStringsDictionaryForLocaleIdentifier:(id)a3;
- (id)_commandStringsTable;
- (id)_descriptionTypeForParameterIdentifier:(id)a3 commandIdentifier:(id)a4;
- (id)_exampleStringPermutationsFromCommandIdentifier:(id)a3;
- (id)_keyboardKeyNamesTable;
- (id)_modifierKeyNamesTable;
- (id)_phoneticKeyNamesTable;
- (id)_rootCommandIdentifierFrom:(id)a3 foundTargetType:(id *)a4;
- (id)_spokenStringPermutationOfLanguageModelDictionary:(id)a3 givenPermutation:(unsigned __int16 *)a4 stringsTable:(id)a5 segmentOffsets:(id)a6;
- (id)_warningsOfIncorrectTokenizationAcrossSegmentBoundariesInLanguageModelDictionary:(id)a3 stringsTable:(id)a4;
- (id)descriptionStringForCommandIdentifier:(id)a3 descriptionType:(id)a4 targetTypes:(id)a5;
- (id)exampleParameterStringsTable;
- (id)languageModelDictionaryForCommandIdentifier:(id)a3 targetType:(id)a4 parsingErrorString:(id *)a5;
- (id)languageModelDictionaryForCommandIdentifier:(id)a3 targetTypes:(id)a4 parsingErrorString:(id *)a5;
- (id)mutableAttributedStringByReplacingPlaceholderAttribute:(id)a3 withAttributeName:(id)a4 inAttributedString:(id)a5 withValueTable:(id)a6;
- (id)mutableAttributedStringCommandDescriptionForCommandIdentifier:(id)a3 calculateDisplayedAttributedStringWidthBlock:(id)a4;
- (id)parameterIdentifiersFromCommandIdentifier:(id)a3;
- (id)phrasesForCommandIdentifier:(id)a3 targetTypes:(id)a4 parameterStrings:(id)a5;
- (id)rowDataForTargetTypes:(id)a3;
- (id)setOfBuiltInIdentifiersFromLanguageModelDictionary:(id)a3;
- (id)spokenStringPermutationOfLanguageModelDictionary:(id)a3 givenPermutation:(unsigned __int16 *)a4 stringsTable:(id)a5;
- (id)spokenStringPermutationsOfLanguageModelDictionary:(id)a3 stringsTable:(id)a4;
- (id)spokenStringPermutationsOfLanguageModelDictionary:(id)a3 stringsTable:(id)a4 restrictPermutationsToShortestAndLongest:(BOOL)a5;
- (id)supportedCommandIdentifiersForTargetTypes:(id)a3;
- (id)unparsedCommandTextForCommandIdentifier:(id)a3 targetTypes:(id)a4;
- (id)warningStringForText:(id)a3 identifier:(id)a4 textTable:(id)a5;
- (unint64_t)countOptionalNodesOfLanguageModelDictionary:(id)a3;
- (void)_flushCommandStringsTable;
- (void)_removeDuplicateSpacesFromMutableString:(id)a3;
- (void)dealloc;
- (void)resolveReferencesInMutableAttributedString:(id)a3 stringsTable:(id)a4;
@end

@implementation SRCSCommandStringsTable

+ (NSArray)supportedTargetTypes
{
  if (supportedTargetTypes_onceToken != -1) {
    dispatch_once(&supportedTargetTypes_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sSupportedTargetTypes;
  return (NSArray *)v2;
}

void __47__SRCSCommandStringsTable_supportedTargetTypes__block_invoke()
{
  v2[6] = *MEMORY[0x263EF8340];
  v2[0] = kSRCSCommandTargetTypeNone;
  v2[1] = kSRCSCommandTargetTypeOSX;
  v2[2] = kSRCSCommandTargetTypeiOS;
  v2[3] = kSRCSCommandTargetTypeiPad;
  v2[4] = kSRCSCommandTargetTypeiPhone;
  v2[5] = kSRCSCommandTargetTypeRealityDevice;
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:6];
  v1 = (void *)sSupportedTargetTypes;
  sSupportedTargetTypes = v0;
}

+ (NSArray)activeTargetTypes
{
  if (activeTargetTypes_onceToken != -1) {
    dispatch_once(&activeTargetTypes_onceToken, &__block_literal_global_127);
  }
  v2 = (void *)sActiveTargetTypes;
  return (NSArray *)v2;
}

void __44__SRCSCommandStringsTable_activeTargetTypes__block_invoke()
{
  v12[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MGCopyAnswer();
  int v1 = [v0 intValue];
  if (v0) {
    CFRelease(v0);
  }
  switch(v1)
  {
    case 1:
    case 2:
    case 7:
      v10[0] = kSRCSCommandTargetTypeiPhone;
      v10[1] = kSRCSCommandTargetTypeiOS;
      v10[2] = kSRCSCommandTargetTypeNone;
      v2 = (void *)MEMORY[0x263EFF8C0];
      v3 = v10;
      goto LABEL_11;
    case 3:
      v12[0] = kSRCSCommandTargetTypeiPad;
      v12[1] = kSRCSCommandTargetTypeiOS;
      v12[2] = kSRCSCommandTargetTypeNone;
      v2 = (void *)MEMORY[0x263EFF8C0];
      v3 = v12;
      goto LABEL_11;
    case 4:
      v11[0] = kSRCSCommandTargetTypeiPhone;
      v11[1] = kSRCSCommandTargetTypeiOS;
      v11[2] = kSRCSCommandTargetTypeNone;
      v2 = (void *)MEMORY[0x263EFF8C0];
      v3 = v11;
      goto LABEL_11;
    case 6:
      v9[0] = kSRCSCommandTargetTypewatchOS;
      v9[1] = kSRCSCommandTargetTypeNone;
      v2 = (void *)MEMORY[0x263EFF8C0];
      v3 = v9;
      goto LABEL_7;
    case 11:
      v8[0] = kSRCSCommandTargetTypeRealityDevice;
      v8[1] = kSRCSCommandTargetTypeiOS;
      v8[2] = kSRCSCommandTargetTypeNone;
      v2 = (void *)MEMORY[0x263EFF8C0];
      v3 = v8;
LABEL_11:
      uint64_t v4 = 3;
      break;
    default:
      v7[0] = kSRCSCommandTargetTypeiOS;
      v7[1] = kSRCSCommandTargetTypeNone;
      v2 = (void *)MEMORY[0x263EFF8C0];
      v3 = v7;
LABEL_7:
      uint64_t v4 = 2;
      break;
  }
  uint64_t v5 = [v2 arrayWithObjects:v3 count:v4];
  v6 = (void *)sActiveTargetTypes;
  sActiveTargetTypes = v5;
}

+ (id)componentsFromLocaleIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (componentsFromLocaleIdentifier__staticLocaleComponentsCacheSetup != -1) {
      dispatch_once(&componentsFromLocaleIdentifier__staticLocaleComponentsCacheSetup, &__block_literal_global_132);
    }
    id v4 = (id)sLocaleComponentsCache;
    objc_sync_enter(v4);
    uint64_t v5 = [(id)sLocaleComponentsCache objectForKey:v3];
    if (!v5)
    {
      uint64_t v5 = [MEMORY[0x263EFF960] componentsFromLocaleIdentifier:v3];
      if (v5) {
        [(id)sLocaleComponentsCache setObject:v5 forKey:v3];
      }
    }
    objc_sync_exit(v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __58__SRCSCommandStringsTable_componentsFromLocaleIdentifier___block_invoke()
{
  sLocaleComponentsCache = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (BOOL)isSameLocaleIdentifier:(id)a3 secondLocaleIdentifier:(id)a4
{
  id v5 = a4;
  v6 = +[SRCSCommandStringsTable componentsFromLocaleIdentifier:a3];
  v7 = +[SRCSCommandStringsTable componentsFromLocaleIdentifier:v5];

  uint64_t v8 = *MEMORY[0x263EFF508];
  uint64_t v9 = [v6 objectForKey:*MEMORY[0x263EFF508]];
  if (!v9) {
    goto LABEL_4;
  }
  v10 = (void *)v9;
  uint64_t v11 = [v7 objectForKey:v8];
  if (!v11)
  {
    BOOL v16 = 0;
    goto LABEL_17;
  }
  v12 = (void *)v11;
  v13 = [v6 objectForKey:v8];
  v14 = [v7 objectForKey:v8];
  uint64_t v15 = [v13 caseInsensitiveCompare:v14];

  if (!v15)
  {
    uint64_t v17 = *MEMORY[0x263EFF4D0];
    v10 = [v6 objectForKey:*MEMORY[0x263EFF4D0]];
    if (!v10)
    {
      v12 = [v7 objectForKey:v17];
      if (!v12)
      {
        BOOL v16 = 1;
LABEL_16:

        goto LABEL_17;
      }
    }
    uint64_t v18 = [v6 objectForKey:v17];
    if (v18)
    {
      v19 = (void *)v18;
      uint64_t v20 = [v7 objectForKey:v17];
      if (v20)
      {
        v21 = (void *)v20;
        v22 = [v6 objectForKey:v17];
        v23 = [v7 objectForKey:v17];
        BOOL v16 = [v22 caseInsensitiveCompare:v23] == 0;

        if (!v10) {
          goto LABEL_16;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    BOOL v16 = 0;
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_4:
  BOOL v16 = 0;
LABEL_18:

  return v16;
}

+ (BOOL)isLocaleIdentifier:(id)a3 containedInLocaleIdentifiers:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (+[SRCSCommandStringsTable isSameLocaleIdentifier:secondLocaleIdentifier:](SRCSCommandStringsTable, "isSameLocaleIdentifier:secondLocaleIdentifier:", v5, *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)languageModelDictionaryFromCommandText:(id)a3 parsingErrorString:(id *)a4
{
  id v5 = (__CFString *)a3;
  id v6 = objc_opt_class();
  objc_sync_enter(v6);
  if (a4) {
    *a4 = 0;
  }
  id v9 = 0;
  uint64_t v7 = (void *)CreateMutableDictionaryFromSpokenCommandString(v5, &v9);
  if (a4 && v9) {
    *a4 = v9;
  }
  objc_sync_exit(v6);

  return v7;
}

- (SRCSCommandStringsTable)initWithLocaleIdentifier:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRCSCommandStringsTable;
  id v6 = [(SRCSCommandStringsTable *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localeIdentifier, a3);
    CFLocaleRef v8 = CFLocaleCreate(0, (CFLocaleIdentifier)v7->_localeIdentifier);
    if (v8)
    {
      CFLocaleRef v9 = v8;
      v13.location = 0;
      v13.length = 0;
      v7->_wordUnitStringTokenizer = CFStringTokenizerCreate(0, &stru_26EE2ED18, v13, 0, v8);
      CFRelease(v9);
    }
    v10 = [(SRCSCommandStringsTable *)v7 _commandStringsTable];

    if (!v10)
    {

      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  wordUnitStringTokenizer = self->_wordUnitStringTokenizer;
  if (wordUnitStringTokenizer) {
    CFRelease(wordUnitStringTokenizer);
  }
  v4.receiver = self;
  v4.super_class = (Class)SRCSCommandStringsTable;
  [(SRCSCommandStringsTable *)&v4 dealloc];
}

- (id)_commandStringsTable
{
  v2 = self;
  objc_sync_enter(v2);
  commandStringsCache = v2->_commandStringsCache;
  if (!commandStringsCache)
  {
    uint64_t v4 = [(SRCSCommandStringsTable *)v2 _commandStringsDictionaryForLocaleIdentifier:v2->_localeIdentifier];
    id v5 = v2->_commandStringsCache;
    v2->_commandStringsCache = (NSDictionary *)v4;

    commandStringsCache = v2->_commandStringsCache;
  }
  id v6 = commandStringsCache;
  objc_sync_exit(v2);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SRCSCommandStringsTable__commandStringsTable__block_invoke;
  block[3] = &unk_264DC9888;
  block[4] = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
  return v6;
}

uint64_t __47__SRCSCommandStringsTable__commandStringsTable__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__flushCommandStringsTable object:0];
  v2 = *(void **)(a1 + 32);
  return [v2 performSelector:sel__flushCommandStringsTable withObject:0 afterDelay:20.0];
}

- (void)_flushCommandStringsTable
{
  obj = self;
  objc_sync_enter(obj);
  commandStringsCache = obj->_commandStringsCache;
  obj->_commandStringsCache = 0;

  objc_sync_exit(obj);
}

- (id)_commandDescriptionsTable
{
  v2 = self;
  objc_sync_enter(v2);
  commandDescriptionsCache = v2->_commandDescriptionsCache;
  if (!commandDescriptionsCache)
  {
    uint64_t v4 = +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities];
    uint64_t v5 = [v4 dictionaryForLocaleIdentifier:v2->_localeIdentifier resourceFileName:@"CommandDescriptions" resourceFileExtension:@"strings"];
    id v6 = v2->_commandDescriptionsCache;
    v2->_commandDescriptionsCache = (NSDictionary *)v5;

    commandDescriptionsCache = v2->_commandDescriptionsCache;
  }
  uint64_t v7 = commandDescriptionsCache;
  objc_sync_exit(v2);

  return v7;
}

- (id)_keyboardKeyNamesTable
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  keyboardKeyNamesCache = v2->_keyboardKeyNamesCache;
  if (!keyboardKeyNamesCache)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = v2->_keyboardKeyNamesCache;
    v2->_keyboardKeyNamesCache = (NSMutableDictionary *)v4;

    id v6 = +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities];
    uint64_t v7 = [v6 dictionaryForLocaleIdentifier:v2->_localeIdentifier resourceFileName:@"KeyboardKeyNames" resourceFileExtension:@"strings"];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    CFLocaleRef v8 = [v7 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    p_isa = (id *)&v2->super.isa;
    if (v9)
    {
      uint64_t v11 = *(void *)v23;
      id obj = v8;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          long long v14 = objc_msgSend(v7, "objectForKey:", v13, obj);
          if (v14)
          {
            id v21 = 0;
            uint64_t v15 = +[SRCSCommandStringsTable languageModelDictionaryFromCommandText:v14 parsingErrorString:&v21];
            id v16 = v21;
            if (![v16 length])
            {
              uint64_t v17 = [p_isa spokenStringPermutationsOfLanguageModelDictionary:v15 stringsTable:0];
              if (v17) {
                [p_isa[5] setObject:v17 forKey:v13];
              }
            }
          }
        }
        CFLocaleRef v8 = obj;
        uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    v2 = (SRCSCommandStringsTable *)p_isa;
    keyboardKeyNamesCache = (NSMutableDictionary *)p_isa[5];
  }
  uint64_t v18 = keyboardKeyNamesCache;
  objc_sync_exit(v2);

  return v18;
}

- (id)_phoneticKeyNamesTable
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  phoneticKeyNamesCache = v2->_phoneticKeyNamesCache;
  if (!phoneticKeyNamesCache)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = v2->_phoneticKeyNamesCache;
    v2->_phoneticKeyNamesCache = (NSMutableDictionary *)v4;

    id v6 = +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities];
    localeIdentifier = v2->_localeIdentifier;
    CFLocaleRef v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v6 dictionaryForLocaleIdentifier:localeIdentifier bundle:v8 subDirectory:@"LocalizedPhoneticAlphabet" rootFileName:@"PhoneticAlphabet" rootFileExtension:@"plist"];
    v10 = [v9 objectForKey:@"PhoneticPronunciationMapping"];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v11 = [v10 allKeys];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    p_isa = (id *)&v2->super.isa;
    if (v12)
    {
      uint64_t v14 = *(void *)v26;
      id obj = v11;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend(v10, "objectForKey:", v16, obj);
          if (v17)
          {
            id v24 = 0;
            uint64_t v18 = +[SRCSCommandStringsTable languageModelDictionaryFromCommandText:v17 parsingErrorString:&v24];
            id v19 = v24;
            if (![v19 length])
            {
              uint64_t v20 = [p_isa spokenStringPermutationsOfLanguageModelDictionary:v18 stringsTable:0];
              if (v20) {
                [p_isa[7] setObject:v20 forKey:v16];
              }
            }
          }
        }
        uint64_t v11 = obj;
        uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }

    v2 = (SRCSCommandStringsTable *)p_isa;
    phoneticKeyNamesCache = (NSMutableDictionary *)p_isa[7];
  }
  id v21 = phoneticKeyNamesCache;
  objc_sync_exit(v2);

  return v21;
}

- (id)_modifierKeyNamesTable
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  modifierKeyNamesCache = v2->_modifierKeyNamesCache;
  if (!modifierKeyNamesCache)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = v2->_modifierKeyNamesCache;
    v2->_modifierKeyNamesCache = (NSMutableDictionary *)v4;

    id v6 = +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities];
    uint64_t v7 = [v6 dictionaryForLocaleIdentifier:v2->_localeIdentifier resourceFileName:@"ModifierKeyNames" resourceFileExtension:@"strings"];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    CFLocaleRef v8 = [v7 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    p_isa = (id *)&v2->super.isa;
    if (v9)
    {
      uint64_t v11 = *(void *)v23;
      id obj = v8;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v7, "objectForKey:", v13, obj);
          if (v14)
          {
            id v21 = 0;
            uint64_t v15 = +[SRCSCommandStringsTable languageModelDictionaryFromCommandText:v14 parsingErrorString:&v21];
            id v16 = v21;
            if (![v16 length])
            {
              uint64_t v17 = [p_isa spokenStringPermutationsOfLanguageModelDictionary:v15 stringsTable:0];
              if (v17) {
                [p_isa[6] setObject:v17 forKey:v13];
              }
            }
          }
        }
        CFLocaleRef v8 = obj;
        uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    v2 = (SRCSCommandStringsTable *)p_isa;
    modifierKeyNamesCache = (NSMutableDictionary *)p_isa[6];
  }
  uint64_t v18 = modifierKeyNamesCache;
  objc_sync_exit(v2);

  return v18;
}

- (id)exampleParameterStringsTable
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  parameterIdentifiersToExamplesTable = self->_parameterIdentifiersToExamplesTable;
  if (!parameterIdentifiersToExamplesTable)
  {
    int v50 = RXEngineTypeForLocaleIdentifier();
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    v43 = self;
    [(SRCSCommandStringsTable *)self _commandDescriptionsTable];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v67 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          if ([v9 hasPrefix:@"ExampleParameter."])
          {
            uint64_t v10 = [v9 rangeOfString:@".", 0, objc_msgSend(@"ExampleParameter.", "length"), objc_msgSend(v9, "length") - objc_msgSend(@"ExampleParameter.", "length") options range];
            if (v10 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v12 = v10;
              uint64_t v13 = v11;
              uint64_t v14 = [v9 substringToIndex:v10];
              uint64_t v15 = [v4 objectForKey:v14];
              if (!v15)
              {
                uint64_t v15 = [MEMORY[0x263EFF980] array];
                [v4 setObject:v15 forKey:v14];
              }
              if (v50 == 1 || ![v9 hasPrefix:@"ExampleParameter.IntegerValue"])
              {
                id v16 = [obj objectForKey:v9];
                [v15 addObject:v16];
              }
              else
              {
                id v16 = objc_msgSend(v9, "substringWithRange:", v12 + v13, objc_msgSend(v9, "rangeOfString:options:range:", @"_", 0, v13, objc_msgSend(v9, "length") - v13)- (v12+ v13));
                if ([v16 integerValue] <= 9)
                {
                  uint64_t v17 = [obj objectForKey:v9];
                  [v15 addObject:v17];
                }
              }
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
      }
      while (v6);
    }
    uint64_t v18 = objc_opt_new();
    p_isa = (id *)&v43->super.isa;
    uint64_t v20 = v43->_parameterIdentifiersToExamplesTable;
    v43->_parameterIdentifiersToExamplesTable = (NSMutableDictionary *)v18;

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v21 = [(id)AllValidCommandParameterIdentifiers() allObjects];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v63;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v63 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = *(void **)(*((void *)&v62 + 1) + 8 * v25);
          if (([v26 isEqualToString:kSRCSCommandParameterSwitchableApplication[0]] & 1) != 0
            || [v26 isEqualToString:kSRCSCommandParameterRunningApplication[0]])
          {
            uint64_t v27 = v4;
            long long v28 = @"ExampleParameter.AppName";
            goto LABEL_35;
          }
          if (([v26 isEqualToString:kSRCSCommandParameterTextSegmentCardinalNumber[0]] & 1) != 0
            || ([v26 isEqualToString:kSRCSCommandParameterScreenDistanceCardinalNumber[0]] & 1) != 0
            || ([v26 isEqualToString:kSRCSCommandParameterNumberZeroThroughOneHundred[0]] & 1) != 0
            || ([v26 isEqualToString:kSRCSCommandParameterNumberTwoThroughNinetyNine[0]] & 1) != 0
            || ([v26 isEqualToString:kSRCSCommandParameterNumberTwoThroughNinetyNine2[0]] & 1) != 0
            || ([v26 isEqualToString:kSRCSCommandParameterOverlayLabel[0]] & 1) != 0
            || [v26 isEqualToString:kSRCSCommandParameterOverlayLabel2[0]])
          {
            uint64_t v27 = v4;
            long long v28 = @"ExampleParameter.IntegerValue";
            goto LABEL_35;
          }
          if (([v26 isEqualToString:kSRCSCommandParameterMenuItem[0]] & 1) != 0
            || ([v26 isEqualToString:kSRCSCommandParameterWindowItem[0]] & 1) != 0
            || [v26 isEqualToString:kSRCSCommandParameterWindowItem2[0]])
          {
            uint64_t v27 = v4;
            long long v28 = @"ExampleParameter.ElementName";
            goto LABEL_35;
          }
          if ([v26 isEqualToString:kSRCSCommandParameterMenuBarItem[0]])
          {
            uint64_t v27 = v4;
            long long v28 = @"ExampleParameter.MenuBarName";
LABEL_35:
            v29 = [v27 objectForKey:v28];
            if (v29) {
              [p_isa[8] setObject:v29 forKey:v26];
            }
            goto LABEL_37;
          }
          if (([v26 isEqualToString:kSRCSCommandParameterDictation[0]] & 1) != 0
            || [v26 isEqualToString:kSRCSCommandParameterDictation2[0]])
          {
            uint64_t v27 = v4;
            long long v28 = @"ExampleParameter.DictatedPhrase";
            goto LABEL_35;
          }
          if ([v26 isEqualToString:kSRCSCommandParameterKeyboardKeyName[0]])
          {
            v29 = objc_opt_new();
            v48 = [p_isa _phoneticKeyNamesTable];
            uint64_t v30 = [p_isa _keyboardKeyNamesTable];
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v46 = v30;
            id v44 = [v30 allKeys];
            uint64_t v51 = [v44 countByEnumeratingWithState:&v58 objects:v71 count:16];
            if (v51)
            {
              uint64_t v45 = *(void *)v59;
              do
              {
                for (uint64_t j = 0; j != v51; ++j)
                {
                  if (*(void *)v59 != v45) {
                    objc_enumerationMutation(v44);
                  }
                  uint64_t v32 = *(void *)(*((void *)&v58 + 1) + 8 * j);
                  v33 = [v46 objectForKey:v32];
                  [v29 addObjectsFromArray:v33];

                  v34 = [v48 objectForKey:v32];
                  if (v34) {
                    [v29 addObjectsFromArray:v34];
                  }
                }
                uint64_t v51 = [v44 countByEnumeratingWithState:&v58 objects:v71 count:16];
              }
              while (v51);
            }

            p_isa = (id *)&v43->super.isa;
            [(NSMutableDictionary *)v43->_parameterIdentifiersToExamplesTable setObject:v29 forKey:v26];

            v35 = v48;
            goto LABEL_69;
          }
          if ([v26 isEqualToString:kSRCSCommandParameterModifierKeys[0]])
          {
            v29 = objc_opt_new();
            v36 = [p_isa _modifierKeyNamesTable];
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            v52 = v36;
            id v47 = [v36 allKeys];
            uint64_t v37 = [v47 countByEnumeratingWithState:&v54 objects:v70 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              uint64_t v49 = *(void *)v55;
              do
              {
                for (uint64_t k = 0; k != v38; ++k)
                {
                  if (*(void *)v55 != v49) {
                    objc_enumerationMutation(v47);
                  }
                  v40 = [v52 objectForKey:*(void *)(*((void *)&v54 + 1) + 8 * k)];
                  [v29 addObjectsFromArray:v40];
                }
                uint64_t v38 = [v47 countByEnumeratingWithState:&v54 objects:v70 count:16];
              }
              while (v38);
            }

            p_isa = (id *)&v43->super.isa;
            [(NSMutableDictionary *)v43->_parameterIdentifiersToExamplesTable setObject:v29 forKey:v26];
            v35 = v52;
LABEL_69:

LABEL_37:
          }
          ++v25;
        }
        while (v25 != v23);
        uint64_t v41 = [v21 countByEnumeratingWithState:&v62 objects:v72 count:16];
        uint64_t v23 = v41;
      }
      while (v41);
    }

    parameterIdentifiersToExamplesTable = (NSMutableDictionary *)p_isa[8];
  }
  return parameterIdentifiersToExamplesTable;
}

- (id)supportedCommandIdentifiersForTargetTypes:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [v4 count];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [(SRCSCommandStringsTable *)self _commandStringsTable];
  CFLocaleRef v8 = [v7 allKeys];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v17 = 0;
        uint64_t v14 = [(SRCSCommandStringsTable *)self _rootCommandIdentifierFrom:v13 foundTargetType:&v17];
        id v15 = v17;
        if ([v14 length]
          && ([v5 containsObject:v14] & 1) == 0
          && (!v6 || [v4 containsObject:v15])
          && [(SRCSCommandStringsTable *)self isSupportedCommandIdentifier:v14 forLocaleIdentifier:self->_localeIdentifier])
        {
          [v5 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isSupportedCommandIdentifier:(id)a3 forTargetTypes:(id)a4
{
  id v6 = a4;
  id v11 = 0;
  uint64_t v7 = [(SRCSCommandStringsTable *)self _rootCommandIdentifierFrom:a3 foundTargetType:&v11];
  id v8 = v11;
  if (v7) {
    char v9 = [v6 containsObject:v8];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isSupportedCommandIdentifier:(id)a3 forLocaleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities];
  id v8 = [v7 commandAttributes];
  char v9 = [v8 objectForKey:v6];

  uint64_t v10 = [v9 objectForKey:kSRCSCommandAttributeIncludeOnlyForLocales];
  if (v10
    && !+[SRCSCommandStringsTable isLocaleIdentifier:v5 containedInLocaleIdentifiers:v10])
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    id v11 = [v9 objectForKey:kSRCSCommandAttributeExcludeAlwaysForLocales];
    if (v11) {
      BOOL v12 = !+[SRCSCommandStringsTable isLocaleIdentifier:v5 containedInLocaleIdentifiers:v11];
    }
    else {
      LOBYTE(v12) = 1;
    }
  }
  return v12;
}

- (id)_rootCommandIdentifierFrom:(id)a3 foundTargetType:(id *)a4
{
  id v5 = a3;
  id v6 = (id)kSRCSCommandTargetTypeNone;
  unint64_t v7 = [v5 rangeOfString:@"_" options:4];
  if (v8 == 1 && (unint64_t v9 = v7, v7 < [v5 length] - 1))
  {
    uint64_t v10 = [v5 substringFromIndex:v9 + 1];
    if ([v10 length])
    {
      id v11 = [v5 substringToIndex:v9];

      id v12 = v10;
    }
    else
    {

      id v12 = 0;
      id v11 = 0;
    }

    id v6 = v12;
  }
  else
  {
    id v11 = v5;
  }
  id v13 = v6;
  *a4 = v13;

  return v11;
}

- (unint64_t)countOptionalNodesOfLanguageModelDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKey:kSRCSCommandParseDictionaryKeyAttributes[0]];
  id v6 = [v5 objectForKey:kSRCSCommandParseAttributeOptional[0]];
  unint64_t v7 = [v6 BOOLValue];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = objc_msgSend(v4, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0], 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v7 += [(SRCSCommandStringsTable *)self countOptionalNodesOfLanguageModelDictionary:*(void *)(*((void *)&v14 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)spokenStringPermutationOfLanguageModelDictionary:(id)a3 givenPermutation:(unsigned __int16 *)a4 stringsTable:(id)a5
{
  return [(SRCSCommandStringsTable *)self _spokenStringPermutationOfLanguageModelDictionary:a3 givenPermutation:a4 stringsTable:a5 segmentOffsets:0];
}

- (id)_spokenStringPermutationOfLanguageModelDictionary:(id)a3 givenPermutation:(unsigned __int16 *)a4 stringsTable:(id)a5 segmentOffsets:(id)a6
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v44 = a3;
  id v49 = a5;
  id v50 = a6;
  id v51 = [MEMORY[0x263F089D8] stringWithString:&stru_26EE2ED18];
  uint64_t v8 = [v44 objectForKey:kSRCSCommandParseDictionaryKeyAttributes[0]];
  uint64_t v9 = [v8 objectForKey:kSRCSCommandParseAttributeOptional[0]];
  LODWORD(a5) = [v9 BOOLValue];

  char v43 = (char)a5;
  if (a5)
  {
    int v48 = *a4 & 1;
    *a4 >>= 1;
  }
  else
  {
    int v48 = 1;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = [v44 objectForKey:kSRCSCommandParseDictionaryKeyChildren[0]];
  uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        if (v50) {
          long long v14 = objc_opt_new();
        }
        else {
          long long v14 = 0;
        }
        long long v15 = [(SRCSCommandStringsTable *)self _spokenStringPermutationOfLanguageModelDictionary:v13 givenPermutation:a4 stringsTable:v49 segmentOffsets:v14];
        long long v16 = v15;
        if (v48 && [v15 length])
        {
          if (v50 && [v14 count])
          {
            if ([v51 length])
            {
              uint64_t v17 = [v14 count];
              if (v17 >= 1)
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  uint64_t v19 = [v14 objectAtIndex:j];
                  uint64_t v20 = [v19 range];
                  uint64_t v21 = [v51 length];
                  [v19 range];
                  objc_msgSend(v19, "setRange:", v20 + v21, v22);
                }
              }
            }
            [v50 addObjectsFromArray:v14];
          }
          [v51 appendString:v16];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v10);
  }

  if (v48)
  {
    uint64_t v23 = [v44 objectForKey:kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]];
    int v24 = [v23 BOOLValue];

    if (!v24)
    {
      uint64_t v25 = [v44 objectForKey:kSRCSCommandParseDictionaryKeyText[0]];
      if ([(__CFString *)v25 length])
      {
        if (v50)
        {
          v35 = self;
          objc_sync_enter(v35);
          wordUnitStringTokenizer = v35->_wordUnitStringTokenizer;
          v59.length = [(__CFString *)v25 length];
          v59.location = 0;
          CFStringTokenizerSetString(wordUnitStringTokenizer, v25, v59);
          if (CFStringTokenizerAdvanceToNextToken(v35->_wordUnitStringTokenizer))
          {
            CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v35->_wordUnitStringTokenizer);
            uint64_t v38 = v25;
            if ((v43 & 1) == 0)
            {
              uint64_t v38 = -[__CFString substringWithRange:](v25, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
            }
            v39 = +[SRCSCommandSegmentInfo segmentInfoWith:text:](SRCSCommandSegmentInfo, "segmentInfoWith:text:", CurrentTokenRange.location, CurrentTokenRange.length, v38);
            [v50 addObject:v39];

            if ((v43 & 1) == 0) {
          }
            }
          objc_sync_exit(v35);
        }
        [v51 appendString:v25];
      }
      goto LABEL_56;
    }
    uint64_t v25 = [v44 objectForKeyedSubscript:kSRCSCommandParseDictionaryKeyIdentifier[0]];
    long long v26 = [v49 objectForKey:v25];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    id v28 = v27;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v29 = v26;
    }
    else {
      v29 = 0;
    }
    id v30 = v29;
    if ([v28 length])
    {
      int v31 = [(__CFString *)v25 isEqualToString:kSRCSCommandParameterDeviceName[0]];
      uint64_t v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v33 = v32;
      if (v31) {
        [v32 localizedStringForKey:@"CommandParameter.DeviceNameFormatString" value:&stru_26EE2ED18 table:0];
      }
      else {
      v34 = [v32 localizedStringForKey:@"CommandParameter.GenericFormatString" value:&stru_26EE2ED18 table:0];
      }
      objc_msgSend(v51, "appendFormat:", v34, v28);
    }
    else if ([v30 count])
    {
      if (![v30 count])
      {
LABEL_55:

LABEL_56:
        goto LABEL_57;
      }
      if ((unint64_t)[v30 count] < 2)
      {
        unint64_t v41 = 0;
      }
      else
      {
        do
        {
          unint64_t v40 = random();
          unint64_t v41 = v40 % [v30 count];
        }
        while (_spokenStringPermutationOfLanguageModelDictionary_givenPermutation_stringsTable_segmentOffsets__sLastRandomInteger == v41);
      }
      _spokenStringPermutationOfLanguageModelDictionary_givenPermutation_stringsTable_segmentOffsets__sLastRandomInteger = v41;
      v33 = objc_msgSend(v30, "objectAtIndex:");
      [v51 appendString:v33];
    }
    else
    {
      v33 = [v44 objectForKey:kSRCSCommandParseDictionaryKeyIdentifier[0]];
      [v51 appendFormat:@"{%@}", v33];
    }

    goto LABEL_55;
  }
LABEL_57:

  return v51;
}

- (id)setOfBuiltInIdentifiersFromLanguageModelDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  id v6 = [v4 objectForKey:kSRCSCommandParseDictionaryKeyChildren[0]];
  if ([v6 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unint64_t v7 = objc_msgSend(v4, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0], 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [(SRCSCommandStringsTable *)self setOfBuiltInIdentifiersFromLanguageModelDictionary:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          uint64_t v13 = [v12 allObjects];
          [v5 addObjectsFromArray:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
  else
  {
    long long v14 = [v4 objectForKey:kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]];
    int v15 = [v14 BOOLValue];

    if (v15)
    {
      long long v16 = [v4 objectForKeyedSubscript:kSRCSCommandParseDictionaryKeyIdentifier[0]];
      if (v16) {
        [v5 addObject:v16];
      }
    }
  }

  return v5;
}

- (void)_removeDuplicateSpacesFromMutableString:(id)a3
{
  id v3 = a3;
  while (objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"  ", @" ", 0, 0, objc_msgSend(v3, "length")));
}

- (id)unparsedCommandTextForCommandIdentifier:(id)a3 targetTypes:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = [MEMORY[0x263F089D8] string];
    id v29 = 0;
    id v24 = v6;
    uint64_t v10 = [(SRCSCommandStringsTable *)self _rootCommandIdentifierFrom:v6 foundTargetType:&v29];
    id v22 = v29;
    uint64_t v11 = [(SRCSCommandStringsTable *)self _commandStringsTable];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v23 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v17 isEqualToString:kSRCSCommandTargetTypeNone])
          {
            id v18 = v10;
          }
          else
          {
            id v18 = [NSString stringWithFormat:@"%@_%@", v10, v17];
          }
          long long v19 = v18;
          long long v20 = [v11 objectForKeyedSubscript:v18];
          if ([v20 length])
          {
            if ([(__CFString *)v9 length]) {
              [(__CFString *)v9 appendString:@"|"];
            }
            [(__CFString *)v9 appendString:v20];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v14);
    }

    uint64_t v8 = v23;
    id v6 = v24;
  }
  else
  {
    NSLog(&cfstr_ErrorDonTPassN.isa);
    uint64_t v9 = &stru_26EE2ED18;
  }

  return v9;
}

- (id)languageModelDictionaryForCommandIdentifier:(id)a3 targetType:(id)a4 parsingErrorString:(id *)a5
{
  v14[2] = *MEMORY[0x263EF8340];
  v14[0] = kSRCSCommandTargetTypeNone;
  v14[1] = a4;
  uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v8 arrayWithObjects:v14 count:2];

  id v12 = [(SRCSCommandStringsTable *)self languageModelDictionaryForCommandIdentifier:v10 targetTypes:v11 parsingErrorString:a5];

  return v12;
}

- (id)languageModelDictionaryForCommandIdentifier:(id)a3 targetTypes:(id)a4 parsingErrorString:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SRCSCommandStringsTable *)self unparsedCommandTextForCommandIdentifier:v8 targetTypes:v9];
  uint64_t v11 = objc_opt_class();
  objc_sync_enter(v11);
  if (a5) {
    *a5 = 0;
  }
  id v14 = 0;
  id v12 = (void *)CreateMutableDictionaryFromSpokenCommandString(v10, &v14);
  if (a5 && v14) {
    *a5 = v14;
  }
  objc_sync_exit(v11);

  return v12;
}

- (id)spokenStringPermutationsOfLanguageModelDictionary:(id)a3 stringsTable:(id)a4
{
  return [(SRCSCommandStringsTable *)self spokenStringPermutationsOfLanguageModelDictionary:a3 stringsTable:a4 restrictPermutationsToShortestAndLongest:0];
}

- (id)spokenStringPermutationsOfLanguageModelDictionary:(id)a3 stringsTable:(id)a4 restrictPermutationsToShortestAndLongest:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v31 = [MEMORY[0x263EFF980] array];
  id v10 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v11 = [v8 objectForKey:kSRCSCommandParseDictionaryKeyAttributes[0]];
  id v12 = [v11 objectForKey:kSRCSCommandParseAttributePath[0]];

  if (v12)
  {
    uint64_t v13 = SRCSLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v8;
      _os_log_impl(&dword_23AB39000, v13, OS_LOG_TYPE_DEFAULT, "Malformed LM dictionary in spokenStringPermutationsOfLanguageModelDictionary:stringsTable:, should not have a path at the top level: %@.", buf, 0xCu);
    }
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v13 = [v8 objectForKey:kSRCSCommandParseDictionaryKeyChildren[0]];
    uint64_t v32 = [v13 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v32)
    {
      id v27 = v8;
      id obj = v13;
      uint64_t v29 = *(void *)v34;
      BOOL v30 = v5;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          unsigned int v16 = -[SRCSCommandStringsTable countOptionalNodesOfLanguageModelDictionary:](self, "countOptionalNodesOfLanguageModelDictionary:", v15, v27);
          uint64_t v17 = objc_opt_new();
          if (v16 <= 0xF)
          {
            int v18 = 0;
            int v19 = 1 << v16;
            do
            {
              *(_WORD *)buf = v18;
              long long v20 = [(SRCSCommandStringsTable *)self spokenStringPermutationOfLanguageModelDictionary:v15 givenPermutation:buf stringsTable:v9];
              [(SRCSCommandStringsTable *)self _removeDuplicateSpacesFromMutableString:v20];
              long long v21 = [v20 stringByTrimmingCharactersInSet:v10];
              [v17 addObject:v21];

              ++v18;
            }
            while (v19 != v18);
          }
          id v22 = objc_alloc(MEMORY[0x263EFF980]);
          uint64_t v23 = [v17 allObjects];
          id v24 = [v23 sortedArrayUsingComparator:&__block_literal_global_225];
          long long v25 = (void *)[v22 initWithArray:v24];

          if (v30 && (unint64_t)[v25 count] >= 3) {
            objc_msgSend(v25, "removeObjectsInRange:", 1, objc_msgSend(v25, "count") - 2);
          }
          [v31 addObjectsFromArray:v25];
        }
        uint64_t v13 = obj;
        uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v32);
      id v8 = v27;
    }
  }

  return v31;
}

uint64_t __131__SRCSCommandStringsTable_spokenStringPermutationsOfLanguageModelDictionary_stringsTable_restrictPermutationsToShortestAndLongest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 length];
  if (v6 <= [v5 length])
  {
    unint64_t v8 = [v4 length];
    if (v8 >= [v5 length]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (id)_warningsOfIncorrectTokenizationAcrossSegmentBoundariesInLanguageModelDictionary:(id)a3 stringsTable:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v32 = a4;
  id v31 = [MEMORY[0x263EFF980] array];
  unint64_t v6 = [v26 objectForKey:kSRCSCommandParseDictionaryKeyAttributes[0]];
  uint64_t v7 = [v6 objectForKey:kSRCSCommandParseAttributePath[0]];

  if (v7)
  {
    unint64_t v8 = SRCSLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v26;
      _os_log_impl(&dword_23AB39000, v8, OS_LOG_TYPE_DEFAULT, "Malformed LM dictionary in _warningsOfIncorrectTokenizationAcrossSegmentBoundariesInLanguageModelDictionary:stringsTable:, should not have a path at the top level: %@.", buf, 0xCu);
    }
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [v26 objectForKey:kSRCSCommandParseDictionaryKeyChildren[0]];
    uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v29)
    {
      uint64_t v28 = *(void *)v36;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v36 != v28)
          {
            uint64_t v10 = v9;
            objc_enumerationMutation(obj);
            uint64_t v9 = v10;
          }
          uint64_t v30 = v9;
          uint64_t v34 = *(void *)(*((void *)&v35 + 1) + 8 * v9);
          unsigned int v11 = -[SRCSCommandStringsTable countOptionalNodesOfLanguageModelDictionary:](self, "countOptionalNodesOfLanguageModelDictionary:");
          if (v11 <= 0xF)
          {
            int v12 = 0;
            int v33 = 1 << v11;
            do
            {
              uint64_t v13 = [MEMORY[0x263EFF980] array];
              *(_WORD *)buf = v12;
              id v14 = [(SRCSCommandStringsTable *)self _spokenStringPermutationOfLanguageModelDictionary:v34 givenPermutation:buf stringsTable:v32 segmentOffsets:v13];
              uint64_t v15 = self;
              objc_sync_enter(v15);
              wordUnitStringTokenizer = self->_wordUnitStringTokenizer;
              v44.length = [(__CFString *)v14 length];
              v44.CFIndex location = 0;
              CFStringTokenizerSetString(wordUnitStringTokenizer, v14, v44);
LABEL_12:
              while (CFStringTokenizerAdvanceToNextToken(self->_wordUnitStringTokenizer))
              {
                CFIndex location = CFStringTokenizerGetCurrentTokenRange(self->_wordUnitStringTokenizer).location;
                uint64_t v18 = [v13 count];
                if (v18 >= 1)
                {
                  uint64_t v19 = 0;
                  while (1)
                  {
                    long long v20 = [v13 objectAtIndex:v19];
                    BOOL v21 = [v20 range] == location;

                    if (v21) {
                      break;
                    }
                    if (v18 == ++v19) {
                      goto LABEL_12;
                    }
                  }
                  [v13 removeObjectAtIndex:v19];
                }
              }
              objc_sync_exit(v15);

              if ([v13 count])
              {
                id v22 = NSString;
                uint64_t v23 = [v13 componentsJoinedByString:@", "];
                id v24 = [v22 stringWithFormat:@"%@ in “%@”", v23, v14];
                [v31 addObject:v24];
              }
              ++v12;
            }
            while (v12 != v33);
          }
          uint64_t v9 = v30 + 1;
        }
        while (v30 + 1 != v29);
        uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v29);
    }
    unint64_t v8 = obj;
  }

  return v31;
}

- (id)descriptionStringForCommandIdentifier:(id)a3 descriptionType:(id)a4 targetTypes:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [(SRCSCommandStringsTable *)self _commandDescriptionsTable];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v24;
LABEL_3:
    uint64_t v17 = 0;
    uint64_t v18 = v15;
    while (1)
    {
      if (*(void *)v24 != v16) {
        objc_enumerationMutation(v12);
      }
      uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
      if ([v19 isEqualToString:@"None"]) {
        [NSString stringWithFormat:@"%@_%@", v8, v9, v22];
      }
      else {
      long long v20 = [NSString stringWithFormat:@"%@_%@_%@", v8, v9, v19];
      }
      uint64_t v15 = [v11 objectForKey:v20];

      if ([v15 length]) {
        break;
      }
      ++v17;
      uint64_t v18 = v15;
      if (v14 == v17)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)mutableAttributedStringByReplacingPlaceholderAttribute:(id)a3 withAttributeName:(id)a4 inAttributedString:(id)a5 withValueTable:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  unsigned int v11 = (objc_class *)MEMORY[0x263F089B8];
  id v12 = a5;
  id v13 = a3;
  uint64_t v14 = (void *)[[v11 alloc] initWithAttributedString:v12];
  uint64_t v15 = [v12 length];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __134__SRCSCommandStringsTable_mutableAttributedStringByReplacingPlaceholderAttribute_withAttributeName_inAttributedString_withValueTable___block_invoke;
  v22[3] = &unk_264DC9988;
  id v23 = v10;
  id v16 = v14;
  id v24 = v16;
  id v25 = v9;
  id v17 = v9;
  id v18 = v10;
  objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v15, 0, v22);

  objc_msgSend(v16, "removeAttribute:range:", v13, 0, objc_msgSend(v16, "length"));
  uint64_t v19 = v25;
  id v20 = v16;

  return v20;
}

uint64_t __134__SRCSCommandStringsTable_mutableAttributedStringByReplacingPlaceholderAttribute_withAttributeName_inAttributedString_withValueTable___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v7) {
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(void *)(a1 + 48), v7, a3, a4);
  }
  return MEMORY[0x270F9A758]();
}

- (id)phrasesForCommandIdentifier:(id)a3 targetTypes:(id)a4 parameterStrings:(id)a5
{
  id v8 = a5;
  uint64_t v12 = 0;
  id v9 = [(SRCSCommandStringsTable *)self languageModelDictionaryForCommandIdentifier:a3 targetTypes:a4 parsingErrorString:&v12];
  if (v9)
  {
    id v10 = [(SRCSCommandStringsTable *)self spokenStringPermutationsOfLanguageModelDictionary:v9 stringsTable:v8 restrictPermutationsToShortestAndLongest:1];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)mutableAttributedStringCommandDescriptionForCommandIdentifier:(id)a3 calculateDisplayedAttributedStringWidthBlock:(id)a4
{
  uint64_t v4 = MEMORY[0x270FA5388](self, a2, a3, a4);
  unint64_t v6 = v5;
  uint64_t v7 = (void *)v4;
  uint64_t v430 = *MEMORY[0x263EF8340];
  id v275 = v8;
  v293 = v6;
  id v9 = objc_opt_new();
  id v10 = +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities];
  v282 = v7;
  v278 = [v10 commandStringsTableForLocaleIdentifier:v7[1]];

  v268 = objc_opt_new();
  long long v362 = 0u;
  long long v363 = 0u;
  long long v364 = 0u;
  long long v365 = 0u;
  unsigned int v11 = [(id)AllValidCommandParameterIdentifiers() allObjects];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v362 objects:v429 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v363;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v363 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v362 + 1) + 8 * i);
        id v17 = +[SRCSCommandStringsTable activeTargetTypes];
        id v18 = [v278 descriptionStringForCommandIdentifier:v16 descriptionType:@"NAME" targetTypes:v17];

        if ([v18 length]) {
          [v268 setObject:v18 forKey:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v362 objects:v429 count:16];
    }
    while (v13);
  }

  uint64_t v19 = +[SRCSCommandStringsTable activeTargetTypes];
  id v20 = v278;
  uint64_t v21 = [v278 descriptionStringForCommandIdentifier:@"Section.Phrases" descriptionType:@"TITL" targetTypes:v19];

  unint64_t v22 = 0x263F08000uLL;
  id v23 = objc_alloc(MEMORY[0x263F089B8]);
  if (v21)
  {
    id v24 = [NSString stringWithFormat:@"%@\n", v21];
  }
  else
  {
    id v24 = &stru_26EE2ED18;
  }
  id v25 = (void *)v21;
  v427[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
  v427[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
  v428[0] = kSRCSCommandDescriptionsSectionTitleValue;
  v428[1] = kSRCSCommandDescriptionsSectionTitleValue;
  v427[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
  v428[2] = kSRCSCommandDescriptionsSectionTitleValue;
  long long v26 = [NSDictionary dictionaryWithObjects:v428 forKeys:v427 count:3];
  uint64_t v27 = [v23 initWithString:v24 attributes:v26];

  v259 = v25;
  if (v25) {

  }
  v258 = (void *)v27;
  [v9 appendAttributedString:v27];
  uint64_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v271 = [v28 localizedStringForKey:@"CommandDisplay.commandDisplayWithBulletAndNewLineFormatter" value:&stru_26EE2ED18 table:0];

  uint64_t v29 = +[SRCSCommandStringsTable activeTargetTypes];
  uint64_t v30 = [v282 phrasesForCommandIdentifier:v275 targetTypes:v29 parameterStrings:v268];

  v265 = [MEMORY[0x263F089D8] string];
  long long v358 = 0u;
  long long v359 = 0u;
  long long v360 = 0u;
  long long v361 = 0u;
  id obj = v30;
  uint64_t v31 = [obj countByEnumeratingWithState:&v358 objects:v426 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v359;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v359 != v33) {
          objc_enumerationMutation(obj);
        }
        objc_msgSend(v265, "appendFormat:", v271, *(void *)(*((void *)&v358 + 1) + 8 * j));
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v358 objects:v426 count:16];
    }
    while (v32);
  }

  id v35 = objc_alloc(MEMORY[0x263F089B8]);
  v424[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
  v424[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
  v425[0] = kSRCSCommandDescriptionsVariantValue;
  v425[1] = kSRCSCommandDescriptionsSectionDescValue;
  v424[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
  v425[2] = kSRCSCommandDescriptionsSectionDescValue;
  long long v36 = [NSDictionary dictionaryWithObjects:v425 forKeys:v424 count:3];
  uint64_t v37 = [v35 initWithString:v265 attributes:v36];

  v257 = (void *)v37;
  [v9 appendAttributedString:v37];
  long long v38 = +[SRCSCommandStringsTable activeTargetTypes];
  v39 = [v278 descriptionStringForCommandIdentifier:v275 descriptionType:@"SUMM" targetTypes:v38];

  v266 = [v282 parameterIdentifiersFromCommandIdentifier:v275];
  v260 = v39;
  v287 = v9;
  if ([v39 length] || objc_msgSend(v266, "count"))
  {
    id v40 = +[SRCSCommandStringsTable activeTargetTypes];
    uint64_t v41 = [v278 descriptionStringForCommandIdentifier:@"Section.Description" descriptionType:@"TITL" targetTypes:v40];

    id v42 = objc_alloc(MEMORY[0x263F089B8]);
    char v43 = &stru_26EE2ED18;
    if (v41)
    {
      char v43 = [NSString stringWithFormat:@"%@\n", v41];
    }
    v422[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
    v422[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
    v423[0] = kSRCSCommandDescriptionsSectionTitleValue;
    v423[1] = kSRCSCommandDescriptionsSectionTitleValue;
    v422[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
    v423[2] = kSRCSCommandDescriptionsSectionTitleValue;
    CFRange v44 = [NSDictionary dictionaryWithObjects:v423 forKeys:v422 count:3];
    uint64_t v45 = [v42 initWithString:v43 attributes:v44];

    v284 = (void *)v41;
    if (v41) {

    }
    id v279 = (id)v45;
    [v9 appendAttributedString:v45];
    id v46 = v268;
    if ([v39 length])
    {
      id v47 = objc_alloc(MEMORY[0x263F089B8]);
      int v48 = [NSString stringWithFormat:@"%@\n", v39];
      id v49 = (void *)[v47 initWithString:v48];

      [v278 resolveReferencesInMutableAttributedString:v49 stringsTable:v268];
      v420[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
      v420[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
      v421[0] = kSRCSCommandDescriptionsSectionDescValue;
      v421[1] = kSRCSCommandDescriptionsSectionDescValue;
      v420[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
      v421[2] = kSRCSCommandDescriptionsSectionDescValue;
      id v50 = [NSDictionary dictionaryWithObjects:v421 forKeys:v420 count:3];
      objc_msgSend(v49, "addAttributes:range:", v50, 0, objc_msgSend(v49, "length"));

      [v9 appendAttributedString:v49];
    }
    id v303 = [MEMORY[0x263EFF9A0] dictionary];
    long long v354 = 0u;
    long long v355 = 0u;
    long long v356 = 0u;
    long long v357 = 0u;
    id v292 = v266;
    uint64_t v299 = [v292 countByEnumeratingWithState:&v354 objects:v419 count:16];
    if (v299)
    {
      id v294 = *(id *)v355;
      double v51 = 0.0;
      unint64_t v52 = 0x264DC9000uLL;
      do
      {
        for (uint64_t k = 0; k != v299; ++k)
        {
          if (*(id *)v355 != v294) {
            objc_enumerationMutation(v292);
          }
          uint64_t v54 = *(void *)(*((void *)&v354 + 1) + 8 * k);
          long long v55 = *(void **)(v52 + 1624);
          long long v56 = [v46 objectForKey:v54];
          uint64_t v57 = [v55 formattedBuiltInCommandString:v56];

          if ([v57 length])
          {
            id v58 = objc_alloc(MEMORY[0x263F089B8]);
            v417[0] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
            v417[1] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
            v418[0] = kSRCSCommandDescriptionsSectionDescBoldValue;
            v418[1] = kSRCSCommandDescriptionsSectionDescValue;
            CFRange v59 = [NSDictionary dictionaryWithObjects:v418 forKeys:v417 count:2];
            long long v60 = (void *)[v58 initWithString:v57 attributes:v59];

            long long v61 = [v282 _descriptionTypeForParameterIdentifier:v54 commandIdentifier:v275];
            id v62 = objc_alloc(MEMORY[0x263F089B8]);
            long long v63 = [*(id *)(v52 + 1624) activeTargetTypes];
            long long v64 = [v278 descriptionStringForCommandIdentifier:v54 descriptionType:v61 targetTypes:v63];
            long long v65 = (__CFString *)[v62 initWithString:v64];

            id v46 = v268;
            [v278 resolveReferencesInMutableAttributedString:v65 stringsTable:v268];
            v415[0] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
            v415[1] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
            v416[0] = kSRCSCommandDescriptionsSectionDescValue;
            v416[1] = kSRCSCommandDescriptionsSectionDescValue;
            long long v66 = [NSDictionary dictionaryWithObjects:v416 forKeys:v415 count:2];
            -[__CFString addAttributes:range:](v65, "addAttributes:range:", v66, 0, [(__CFString *)v65 length]);

            if ([(__CFString *)v65 length]) {
              long long v67 = v65;
            }
            else {
              long long v67 = &stru_26EE2ED18;
            }
            [v303 setObject:v67 forKey:v60];
            if (v293) {
              v293[2]();
            }
            else {
              float v68 = 10.0;
            }
            double v69 = v68;
            if (v51 < v69) {
              double v51 = v69;
            }

            unint64_t v52 = 0x264DC9000;
          }
        }
        uint64_t v299 = [v292 countByEnumeratingWithState:&v354 objects:v419 count:16];
      }
      while (v299);
    }
    else
    {
      double v51 = 0.0;
    }

    v70 = objc_opt_new();
    long long v350 = 0u;
    long long v351 = 0u;
    long long v352 = 0u;
    long long v353 = 0u;
    v291 = [v303 allKeys];
    uint64_t v300 = [(__CFString *)v291 countByEnumeratingWithState:&v350 objects:v414 count:16];
    if (v300)
    {
      id v295 = *(id *)v351;
      do
      {
        for (uint64_t m = 0; m != v300; ++m)
        {
          if (*(id *)v351 != v295) {
            objc_enumerationMutation(v291);
          }
          uint64_t v72 = *(void *)(*((void *)&v350 + 1) + 8 * m);
          [v70 appendAttributedString:v72];
          id v73 = objc_alloc(MEMORY[0x263F089B8]);
          v412[0] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
          v412[1] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
          v413[0] = kSRCSCommandDescriptionsSectionDescValue;
          v413[1] = kSRCSCommandDescriptionsSectionDescValue;
          uint64_t v74 = [NSDictionary dictionaryWithObjects:v413 forKeys:v412 count:2];
          v75 = (void *)[v73 initWithString:@"\t" attributes:v74];
          [v70 appendAttributedString:v75];

          v76 = [v303 objectForKey:v72];
          [v70 appendAttributedString:v76];

          id v77 = objc_alloc(MEMORY[0x263F089B8]);
          v410[0] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
          v410[1] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
          v411[0] = kSRCSCommandDescriptionsSectionDescValue;
          v411[1] = kSRCSCommandDescriptionsSectionDescValue;
          v78 = [NSDictionary dictionaryWithObjects:v411 forKeys:v410 count:2];
          v79 = (void *)[v77 initWithString:@"\n" attributes:v78];
          [v70 appendAttributedString:v79];
        }
        uint64_t v300 = [(__CFString *)v291 countByEnumeratingWithState:&v350 objects:v414 count:16];
      }
      while (v300);
    }

    uint64_t v408 = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
    uint64_t v409 = kSRCSCommandDescriptionsParameterValue;
    v80 = [NSDictionary dictionaryWithObjects:&v409 forKeys:&v408 count:1];
    objc_msgSend(v70, "addAttributes:range:", v80, 0, objc_msgSend(v70, "length"));

    id v9 = v287;
    [v287 appendAttributedString:v70];
    v81 = +[SRCSCommandStringsTable activeTargetTypes];
    id v20 = v278;
    v82 = [v278 descriptionStringForCommandIdentifier:v275 descriptionType:@"DESC" targetTypes:v81];

    unint64_t v22 = 0x263F08000uLL;
    if ([v82 length])
    {
      id v83 = objc_alloc(MEMORY[0x263F089B8]);
      v84 = [NSString stringWithFormat:@"%@\n", v82];
      v85 = (void *)[v83 initWithString:v84];

      [v278 resolveReferencesInMutableAttributedString:v85 stringsTable:v268];
      v406[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
      v406[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
      v407[0] = kSRCSCommandDescriptionsSectionDescValue;
      v407[1] = kSRCSCommandDescriptionsSectionDescValue;
      v406[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
      v407[2] = kSRCSCommandDescriptionsSectionDescValue;
      v86 = [NSDictionary dictionaryWithObjects:v407 forKeys:v406 count:3];
      objc_msgSend(v85, "addAttributes:range:", v86, 0, objc_msgSend(v85, "length"));

      [v287 appendAttributedString:v85];
    }
  }
  else
  {
    double v51 = 0.0;
  }
  unint64_t v87 = 0x263F08000uLL;
  if ([v266 count])
  {
    v88 = [v282 _exampleStringPermutationsFromCommandIdentifier:v275];
    if ([v88 count])
    {
      v89 = +[SRCSCommandStringsTable activeTargetTypes];
      v90 = [v20 descriptionStringForCommandIdentifier:@"Section.Examples" descriptionType:@"TITL" targetTypes:v89];

      id v91 = objc_alloc(MEMORY[0x263F089B8]);
      if (v90)
      {
        v92 = [NSString stringWithFormat:@"%@\n", v90];
      }
      else
      {
        v92 = &stru_26EE2ED18;
      }
      v404[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
      v404[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
      v405[0] = kSRCSCommandDescriptionsSectionTitleValue;
      v405[1] = kSRCSCommandDescriptionsSectionTitleValue;
      v404[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
      v405[2] = kSRCSCommandDescriptionsSectionTitleValue;
      v93 = [NSDictionary dictionaryWithObjects:v405 forKeys:v404 count:3];
      v94 = (void *)[v91 initWithString:v92 attributes:v93];

      if (v90) {
      [v9 appendAttributedString:v94];
      }
      v95 = [MEMORY[0x263F089D8] string];
      long long v346 = 0u;
      long long v347 = 0u;
      long long v348 = 0u;
      long long v349 = 0u;
      id v96 = v88;
      uint64_t v97 = [v96 countByEnumeratingWithState:&v346 objects:v403 count:16];
      if (v97)
      {
        uint64_t v98 = v97;
        uint64_t v99 = *(void *)v347;
        do
        {
          for (uint64_t n = 0; n != v98; ++n)
          {
            if (*(void *)v347 != v99) {
              objc_enumerationMutation(v96);
            }
            objc_msgSend(v95, "appendFormat:", v271, *(void *)(*((void *)&v346 + 1) + 8 * n));
          }
          uint64_t v98 = [v96 countByEnumeratingWithState:&v346 objects:v403 count:16];
        }
        while (v98);
      }

      id v101 = objc_alloc(MEMORY[0x263F089B8]);
      v401[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
      v401[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
      v402[0] = kSRCSCommandDescriptionsVariantValue;
      v402[1] = kSRCSCommandDescriptionsSectionDescValue;
      v401[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
      v402[2] = kSRCSCommandDescriptionsSectionDescValue;
      v102 = [NSDictionary dictionaryWithObjects:v402 forKeys:v401 count:3];
      v103 = (void *)[v101 initWithString:v95 attributes:v102];

      [v9 appendAttributedString:v103];
      unint64_t v22 = 0x263F08000uLL;

      unint64_t v87 = 0x263F08000uLL;
    }
  }
  long long v344 = 0u;
  long long v345 = 0u;
  long long v342 = 0u;
  long long v343 = 0u;
  v399[0] = kSRCSCommandParameterModifierKeys[0];
  v399[1] = kSRCSCommandParameterKeyboardKeyName[0];
  id v304 = [MEMORY[0x263EFF8C0] arrayWithObjects:v399 count:2];
  uint64_t v104 = [v304 countByEnumeratingWithState:&v342 objects:v400 count:16];
  if (v104)
  {
    uint64_t v105 = v104;
    id v106 = *(id *)v343;
    id v296 = *(id *)v343;
    do
    {
      for (iuint64_t i = 0; ii != v105; ++ii)
      {
        if (*(id *)v343 != v106) {
          objc_enumerationMutation(v304);
        }
        uint64_t v108 = *(void *)(*((void *)&v342 + 1) + 8 * ii);
        if ([v266 containsObject:v108])
        {
          v109 = [v20 exampleParameterStringsTable];
          v110 = [v109 objectForKey:v108];

          if ([v110 count])
          {
            v111 = *(void **)(v87 + 2880);
            v112 = +[SRCSCommandStringsTable activeTargetTypes];
            v113 = [v278 descriptionStringForCommandIdentifier:v108 descriptionType:@"TITL" targetTypes:v112];
            [v111 stringWithFormat:@"%@\n", v113];
            v114 = v9;
            v115 = (__CFString *)objc_claimAutoreleasedReturnValue();

            id v116 = objc_alloc(MEMORY[0x263F089B8]);
            if (v115) {
              v117 = v115;
            }
            else {
              v117 = &stru_26EE2ED18;
            }
            v397[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
            v397[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
            v398[0] = kSRCSCommandDescriptionsSectionTitleValue;
            v398[1] = kSRCSCommandDescriptionsSectionTitleValue;
            v397[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
            v398[2] = kSRCSCommandDescriptionsSectionTitleValue;
            v118 = [NSDictionary dictionaryWithObjects:v398 forKeys:v397 count:3];
            v119 = (void *)[v116 initWithString:v117 attributes:v118];

            [v114 appendAttributedString:v119];
            v120 = [MEMORY[0x263F089D8] string];
            long long v338 = 0u;
            long long v339 = 0u;
            long long v340 = 0u;
            long long v341 = 0u;
            v121 = [v110 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
            uint64_t v122 = [v121 countByEnumeratingWithState:&v338 objects:v396 count:16];
            if (v122)
            {
              uint64_t v123 = v122;
              uint64_t v124 = *(void *)v339;
              do
              {
                for (juint64_t j = 0; jj != v123; ++jj)
                {
                  if (*(void *)v339 != v124) {
                    objc_enumerationMutation(v121);
                  }
                  objc_msgSend(v120, "appendFormat:", v271, *(void *)(*((void *)&v338 + 1) + 8 * jj));
                }
                uint64_t v123 = [v121 countByEnumeratingWithState:&v338 objects:v396 count:16];
              }
              while (v123);
            }

            id v126 = objc_alloc(MEMORY[0x263F089B8]);
            v394[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
            v394[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
            v395[0] = kSRCSCommandDescriptionsVariantValue;
            v395[1] = kSRCSCommandDescriptionsSectionDescValue;
            v394[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
            v395[2] = kSRCSCommandDescriptionsSectionDescValue;
            v127 = [NSDictionary dictionaryWithObjects:v395 forKeys:v394 count:3];
            v128 = (void *)[v126 initWithString:v120 attributes:v127];

            [v287 appendAttributedString:v128];
            id v9 = v287;
            unint64_t v22 = 0x263F08000uLL;
            unint64_t v87 = 0x263F08000;
            id v106 = v296;
          }

          id v20 = v278;
        }
      }
      uint64_t v105 = [v304 countByEnumeratingWithState:&v342 objects:v400 count:16];
    }
    while (v105);
  }

  if (([v275 isEqualToString:@"Dictation.Streaming"] & 1) != 0
    || ([v275 isEqualToString:@"System.StartDictationMode"] & 1) != 0
    || (double v130 = 0.0, [v275 isEqualToString:@"System.StartSpellingMode"]))
  {
    v131 = +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities];
    uint64_t v132 = v282[1];
    v133 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v134 = [v131 dictionaryForLocaleIdentifier:v132 bundle:v133 subDirectory:@"LocalizedCommandDocumentation" rootFileName:@"EmbeddedCommands" rootFileExtension:@"plist"];

    if (v134)
    {
      v135 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v305 = [v135 localizedStringForKey:@"CommandDisplay.commandDisplayQuotedWithBulletFormatter" value:&stru_26EE2ED18 table:0];

      long long v336 = 0u;
      long long v337 = 0u;
      long long v334 = 0u;
      long long v335 = 0u;
      v256 = v134;
      id v280 = [v134 objectForKey:kSRCSEmbeddedCommandsKeySections];
      v288 = (char *)[v280 countByEnumeratingWithState:&v334 objects:v393 count:16];
      if (v288)
      {
        uint64_t v285 = *(void *)v335;
        double v130 = 0.0;
        do
        {
          v136 = 0;
          do
          {
            if (*(void *)v335 != v285) {
              objc_enumerationMutation(v280);
            }
            v291 = v136;
            v137 = *(void **)(*((void *)&v334 + 1) + 8 * (void)v136);
            v138 = [MEMORY[0x263EFF980] array];
            long long v330 = 0u;
            long long v331 = 0u;
            long long v332 = 0u;
            long long v333 = 0u;
            v139 = [v137 objectForKey:kSRCSEmbeddedCommandsKeyItems];
            uint64_t v140 = [v139 countByEnumeratingWithState:&v330 objects:v392 count:16];
            if (v140)
            {
              uint64_t v141 = v140;
              uint64_t v142 = *(void *)v331;
              do
              {
                for (kuint64_t k = 0; kk != v141; ++kk)
                {
                  if (*(void *)v331 != v142) {
                    objc_enumerationMutation(v139);
                  }
                  v144 = *(void **)(*((void *)&v330 + 1) + 8 * kk);
                  v145 = [v144 objectForKey:kSRCSEmbeddedCommandsKeyMode];
                  if ([v145 isEqualToString:kSRCSEmbeddedCommandsModeAll]) {
                    goto LABEL_114;
                  }
                  int v146 = [v275 isEqualToString:@"System.StartSpellingMode"];
                  v147 = &kSRCSEmbeddedCommandsModeSpellingOnly;
                  if (!v146) {
                    v147 = &kSRCSEmbeddedCommandsModeDictationOnly;
                  }
                  if ([v145 isEqualToString:*v147]) {
LABEL_114:
                  }
                    [v138 addObject:v144];
                }
                uint64_t v141 = [v139 countByEnumeratingWithState:&v330 objects:v392 count:16];
              }
              while (v141);
            }

            long long v328 = 0u;
            long long v329 = 0u;
            long long v326 = 0u;
            long long v327 = 0u;
            id v297 = v138;
            uint64_t v148 = [v297 countByEnumeratingWithState:&v326 objects:v391 count:16];
            if (v148)
            {
              uint64_t v149 = v148;
              uint64_t v301 = *(void *)v327;
              do
              {
                for (muint64_t m = 0; mm != v149; ++mm)
                {
                  if (*(void *)v327 != v301) {
                    objc_enumerationMutation(v297);
                  }
                  v151 = [*(id *)(*((void *)&v326 + 1) + 8 * mm) objectForKey:kSRCSEmbeddedCommandsKeyCommandStrings];
                  long long v322 = 0u;
                  long long v323 = 0u;
                  long long v324 = 0u;
                  long long v325 = 0u;
                  id v152 = v151;
                  uint64_t v153 = [v152 countByEnumeratingWithState:&v322 objects:v390 count:16];
                  if (v153)
                  {
                    uint64_t v154 = v153;
                    uint64_t v155 = *(void *)v323;
                    do
                    {
                      for (nuint64_t n = 0; nn != v154; ++nn)
                      {
                        if (*(void *)v323 != v155) {
                          objc_enumerationMutation(v152);
                        }
                        v157 = objc_msgSend(NSString, "stringWithFormat:", v305, *(void *)(*((void *)&v322 + 1) + 8 * nn));
                        id v158 = objc_alloc(MEMORY[0x263F089B8]);
                        v388[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                        v388[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                        v389[0] = kSRCSCommandDescriptionsPuncCommentValue;
                        v389[1] = kSRCSCommandDescriptionsSectionDescValue;
                        v388[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
                        v389[2] = kSRCSCommandDescriptionsSectionDescValue;
                        v159 = [NSDictionary dictionaryWithObjects:v389 forKeys:v388 count:3];
                        v160 = (void *)[v158 initWithString:v157 attributes:v159];

                        if (v293) {
                          v293[2]();
                        }
                        else {
                          float v161 = 10.0;
                        }
                        double v162 = v161;
                        if (v130 < v162) {
                          double v130 = v162;
                        }
                      }
                      uint64_t v154 = [v152 countByEnumeratingWithState:&v322 objects:v390 count:16];
                    }
                    while (v154);
                  }
                }
                uint64_t v149 = [v297 countByEnumeratingWithState:&v326 objects:v391 count:16];
              }
              while (v149);
            }

            v136 = (__CFString *)((char *)&v291->isa + 1);
            unint64_t v22 = 0x263F08000;
          }
          while ((char *)&v291->isa + 1 != v288);
          v288 = (char *)[v280 countByEnumeratingWithState:&v334 objects:v393 count:16];
        }
        while (v288);
      }
      else
      {
        double v130 = 0.0;
      }

      v163 = +[SRCSCommandStringsTable activeTargetTypes];
      id v20 = v278;
      uint64_t v164 = [v278 descriptionStringForCommandIdentifier:@"Section.Punctuation" descriptionType:@"TITL" targetTypes:v163];

      id v165 = objc_alloc(*(Class *)(v22 + 2488));
      id v9 = v287;
      if (v164)
      {
        unint64_t v166 = 0x263F08000uLL;
        v167 = [NSString stringWithFormat:@"%@\n", v164];
      }
      else
      {
        v167 = &stru_26EE2ED18;
        unint64_t v166 = 0x263F08000uLL;
      }
      v386[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
      v386[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
      v387[0] = kSRCSCommandDescriptionsSectionTitleValue;
      v387[1] = kSRCSCommandDescriptionsSectionTitleValue;
      v386[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
      v387[2] = kSRCSCommandDescriptionsSectionTitleValue;
      v168 = [NSDictionary dictionaryWithObjects:v387 forKeys:v386 count:3];
      uint64_t v169 = [v165 initWithString:v167 attributes:v168];

      v255 = (void *)v164;
      if (v164) {

      }
      v254 = (void *)v169;
      [v287 appendAttributedString:v169];
      if ([v275 isEqualToString:@"System.StartSpellingMode"]) {
        v170 = @"DSC2";
      }
      else {
        v170 = @"DESC";
      }
      v171 = +[SRCSCommandStringsTable activeTargetTypes];
      uint64_t v172 = [v278 descriptionStringForCommandIdentifier:@"Section.Punctuation" descriptionType:v170 targetTypes:v171];

      id v173 = objc_alloc(MEMORY[0x263F089B8]);
      if (v172)
      {
        v174 = [NSString stringWithFormat:@"%@\n", v172];
      }
      else
      {
        v174 = &stru_26EE2ED18;
      }
      v384[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
      v384[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
      v385[0] = kSRCSCommandDescriptionsSectionDescValue;
      v385[1] = kSRCSCommandDescriptionsSectionDescValue;
      v384[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
      v385[2] = kSRCSCommandDescriptionsSectionDescValue;
      v175 = [NSDictionary dictionaryWithObjects:v385 forKeys:v384 count:3];
      uint64_t v176 = [v173 initWithString:v174 attributes:v175];

      v253 = (void *)v172;
      if (v172) {

      }
      v252 = (void *)v176;
      [v287 appendAttributedString:v176];
      v177 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v277 = [v177 localizedStringForKey:@"CommandDisplay.commandDisplayHortLine" value:&stru_26EE2ED18 table:0];

      long long v320 = 0u;
      long long v321 = 0u;
      long long v318 = 0u;
      long long v319 = 0u;
      id v261 = [v256 objectForKey:kSRCSEmbeddedCommandsKeySections];
      uint64_t v264 = [v261 countByEnumeratingWithState:&v318 objects:v383 count:16];
      if (v264)
      {
        uint64_t v263 = *(void *)v319;
        do
        {
          uint64_t v178 = 0;
          do
          {
            if (*(void *)v319 != v263) {
              objc_enumerationMutation(v261);
            }
            uint64_t v267 = v178;
            v179 = *(void **)(*((void *)&v318 + 1) + 8 * v178);
            v180 = [MEMORY[0x263EFF980] array];
            long long v314 = 0u;
            long long v315 = 0u;
            long long v316 = 0u;
            long long v317 = 0u;
            v269 = v179;
            v181 = [v179 objectForKey:kSRCSEmbeddedCommandsKeyItems];
            uint64_t v182 = [v181 countByEnumeratingWithState:&v314 objects:v382 count:16];
            if (v182)
            {
              uint64_t v183 = v182;
              uint64_t v184 = *(void *)v315;
              do
              {
                for (uint64_t i1 = 0; i1 != v183; ++i1)
                {
                  if (*(void *)v315 != v184) {
                    objc_enumerationMutation(v181);
                  }
                  v186 = *(void **)(*((void *)&v314 + 1) + 8 * i1);
                  v187 = [v186 objectForKey:kSRCSEmbeddedCommandsKeyMode];
                  if ([v187 isEqualToString:kSRCSEmbeddedCommandsModeAll]) {
                    goto LABEL_168;
                  }
                  int v188 = [v275 isEqualToString:@"System.StartSpellingMode"];
                  v189 = &kSRCSEmbeddedCommandsModeSpellingOnly;
                  if (!v188) {
                    v189 = &kSRCSEmbeddedCommandsModeDictationOnly;
                  }
                  if ([v187 isEqualToString:*v189]) {
LABEL_168:
                  }
                    [v180 addObject:v186];
                }
                uint64_t v183 = [v181 countByEnumeratingWithState:&v314 objects:v382 count:16];
              }
              while (v183);
            }

            uint64_t v190 = [v180 count];
            long long v310 = 0u;
            long long v311 = 0u;
            long long v312 = 0u;
            long long v313 = 0u;
            id v270 = v180;
            uint64_t v276 = [v270 countByEnumeratingWithState:&v310 objects:v381 count:16];
            if (v276)
            {
              uint64_t v191 = 0;
              char v192 = 0;
              uint64_t v273 = *(void *)v311;
              uint64_t v274 = v190 - 1;
              do
              {
                v193 = 0;
                do
                {
                  if (*(void *)v311 != v273) {
                    objc_enumerationMutation(v270);
                  }
                  v302 = *(void **)(*((void *)&v310 + 1) + 8 * (void)v193);
                  unint64_t v194 = 0x263F08000uLL;
                  v281 = v193;
                  uint64_t v283 = v191;
                  if ((v192 & 1) == 0)
                  {
                    v195 = *(void **)(v166 + 2880);
                    v196 = [v269 objectForKey:kSRCSEmbeddedCommandsKeyTitle];
                    v197 = [v195 stringWithFormat:@"PunctuationGroup.%@", v196];
                    v198 = +[SRCSCommandStringsTable activeTargetTypes];
                    v199 = [v20 descriptionStringForCommandIdentifier:v197 descriptionType:@"TITL" targetTypes:v198];

                    id v200 = objc_alloc(MEMORY[0x263F089B8]);
                    if (v199)
                    {
                      v201 = [*(id *)(v166 + 2880) stringWithFormat:@"%@\n", v199];
                      v272 = v201;
                    }
                    else
                    {
                      v201 = &stru_26EE2ED18;
                    }
                    v379[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                    v379[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                    v380[0] = kSRCSCommandDescriptionsSectionSubTitleValue;
                    v380[1] = kSRCSCommandDescriptionsSectionSubTitleValue;
                    v379[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
                    v380[2] = kSRCSCommandDescriptionsSectionSubTitleValue;
                    v202 = [NSDictionary dictionaryWithObjects:v380 forKeys:v379 count:3];
                    uint64_t v203 = [v200 initWithString:v201 attributes:v202];

                    if (v199) {
                    [v9 appendAttributedString:v203];
                    }
                    id v204 = objc_alloc(MEMORY[0x263F089B8]);
                    v205 = [*(id *)(v166 + 2880) stringWithFormat:@"%@\n", v277];
                    v377[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                    v377[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                    v378[0] = kSRCSCommandDescriptionsPuncDividerValue;
                    v378[1] = kSRCSCommandDescriptionsPuncDividerValue;
                    v377[2] = kSRCSCommandDescriptionsStrikethroughColorPlaceholderAttributeName;
                    v377[3] = kSRCSCommandDescriptionsStrikethroughStylePlaceholderAttributeName;
                    v378[2] = kSRCSCommandDescriptionsSectionDescValue;
                    v378[3] = kSRCSCommandDescriptionsSectionDescValue;
                    v206 = [NSDictionary dictionaryWithObjects:v378 forKeys:v377 count:4];
                    v207 = (void *)[v204 initWithString:v205 attributes:v206];

                    [v9 appendAttributedString:v207];
                    id v289 = (id)v203;
                    v208 = +[SRCSCommandStringsTable activeTargetTypes];
                    v209 = [v278 descriptionStringForCommandIdentifier:@"PunctuationColumnHeader.Phrase" descriptionType:@"TITL" targetTypes:v208];

                    v210 = +[SRCSCommandStringsTable activeTargetTypes];
                    v211 = [v278 descriptionStringForCommandIdentifier:@"PunctuationColumnHeader.Result" descriptionType:@"TITL" targetTypes:v210];

                    id v212 = objc_alloc(MEMORY[0x263F089B8]);
                    v213 = [*(id *)(v166 + 2880) stringWithFormat:@"%@\t%@\n", v209, v211];
                    v375[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                    v375[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                    v376[0] = kSRCSCommandDescriptionsHeaderValue;
                    v376[1] = kSRCSCommandDescriptionsSectionDescValue;
                    v375[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
                    v376[2] = kSRCSCommandDescriptionsSectionDescValue;
                    v214 = [NSDictionary dictionaryWithObjects:v376 forKeys:v375 count:3];
                    v215 = (void *)[v212 initWithString:v213 attributes:v214];

                    unint64_t v194 = 0x263F08000uLL;
                    [v9 appendAttributedString:v215];
                    [v9 appendAttributedString:v207];
                  }
                  v216 = [v302 objectForKey:kSRCSEmbeddedCommandsKeyCommandStrings];
                  long long v306 = 0u;
                  long long v307 = 0u;
                  long long v308 = 0u;
                  long long v309 = 0u;
                  id v290 = v216;
                  uint64_t v217 = [v290 countByEnumeratingWithState:&v306 objects:v374 count:16];
                  if (v217)
                  {
                    uint64_t v218 = v217;
                    uint64_t v219 = 0;
                    id v298 = *(id *)v307;
                    do
                    {
                      uint64_t v220 = 0;
                      uint64_t v286 = v219;
                      uint64_t v221 = -v219;
                      do
                      {
                        if (*(id *)v307 != v298) {
                          objc_enumerationMutation(v290);
                        }
                        v222 = objc_msgSend(*(id *)(v166 + 2880), "stringWithFormat:", v305, *(void *)(*((void *)&v306 + 1) + 8 * v220));
                        id v223 = objc_alloc(*(Class *)(v194 + 2488));
                        v224 = *(void **)(v166 + 2880);
                        v225 = &stru_26EE2ED18;
                        if (v221 == v220)
                        {
                          v291 = [v302 objectForKey:kSRCSEmbeddedCommandsKeyResult];
                          v225 = v291;
                        }
                        v226 = [v224 stringWithFormat:@"%@\t%@", v222, v225];
                        v372[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                        v372[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                        v373[0] = kSRCSCommandDescriptionsItemValue;
                        v373[1] = kSRCSCommandDescriptionsSectionDescValue;
                        v372[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
                        v373[2] = kSRCSCommandDescriptionsSectionDescValue;
                        v227 = [NSDictionary dictionaryWithObjects:v373 forKeys:v372 count:3];
                        v228 = (void *)[v223 initWithString:v226 attributes:v227];

                        if (v221 != v220)
                        {
                          [v9 appendAttributedString:v228];
                          unint64_t v166 = 0x263F08000uLL;
LABEL_197:
                          id v239 = objc_alloc(*(Class *)(v194 + 2488));
                          v368[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                          v368[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                          v369[0] = kSRCSCommandDescriptionsItemValue;
                          v369[1] = kSRCSCommandDescriptionsSectionDescValue;
                          v368[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
                          v369[2] = kSRCSCommandDescriptionsSectionDescValue;
                          v233 = [NSDictionary dictionaryWithObjects:v369 forKeys:v368 count:3];
                          v238 = (void *)[v239 initWithString:@"\n" attributes:v233];
                          goto LABEL_198;
                        }

                        [v9 appendAttributedString:v228];
                        v229 = [v302 objectForKey:kSRCSEmbeddedCommandsKeyComment];
                        uint64_t v230 = [v229 length];

                        unint64_t v166 = 0x263F08000;
                        if (!v230) {
                          goto LABEL_197;
                        }
                        id v231 = objc_alloc(*(Class *)(v194 + 2488));
                        v232 = NSString;
                        v233 = [v302 objectForKey:kSRCSEmbeddedCommandsKeyResult];
                        if ([v233 length]) {
                          v234 = @"  ";
                        }
                        else {
                          v234 = &stru_26EE2ED18;
                        }
                        v235 = [v302 objectForKey:kSRCSEmbeddedCommandsKeyComment];
                        v236 = [v232 stringWithFormat:@"%@%@\n", v234, v235];
                        v370[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                        v370[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                        v371[0] = kSRCSCommandDescriptionsItemValue;
                        v371[1] = kSRCSCommandDescriptionsPuncCommentValue;
                        v370[2] = kSRCSCommandDescriptionsColorPlaceholderAttributeName;
                        v371[2] = kSRCSCommandDescriptionsPuncCommentValue;
                        v237 = [NSDictionary dictionaryWithObjects:v371 forKeys:v370 count:3];
                        v238 = (void *)[v231 initWithString:v236 attributes:v237];

                        unint64_t v194 = 0x263F08000;
                        unint64_t v166 = 0x263F08000;

                        id v9 = v287;
LABEL_198:

                        [v9 appendAttributedString:v238];
                        ++v220;
                      }
                      while (v218 != v220);
                      uint64_t v219 = v286 + v218;
                      uint64_t v218 = [v290 countByEnumeratingWithState:&v306 objects:v374 count:16];
                    }
                    while (v218);
                  }

                  id v240 = objc_alloc(*(Class *)(v194 + 2488));
                  v241 = &stru_26EE2ED18;
                  if (v283 < v274) {
                    v241 = v277;
                  }
                  v242 = [*(id *)(v166 + 2880) stringWithFormat:@"%@\n", v241];
                  v366[0] = kSRCSCommandDescriptionsParagraphPlaceholderAttributeName;
                  v366[1] = kSRCSCommandDescriptionsFontPlaceholderAttributeName;
                  v367[0] = kSRCSCommandDescriptionsPuncDividerValue;
                  v367[1] = kSRCSCommandDescriptionsPuncDividerValue;
                  v366[2] = kSRCSCommandDescriptionsStrikethroughColorPlaceholderAttributeName;
                  v366[3] = kSRCSCommandDescriptionsStrikethroughStylePlaceholderAttributeName;
                  v367[2] = kSRCSCommandDescriptionsPuncDividerValue;
                  v367[3] = kSRCSCommandDescriptionsPuncDividerValue;
                  v243 = [NSDictionary dictionaryWithObjects:v367 forKeys:v366 count:4];
                  v244 = (void *)[v240 initWithString:v242 attributes:v243];

                  [v9 appendAttributedString:v244];
                  uint64_t v191 = v283 + 1;

                  id v20 = v278;
                  v193 = v281 + 1;
                  char v192 = 1;
                }
                while (v281 + 1 != (char *)v276);
                uint64_t v276 = [v270 countByEnumeratingWithState:&v310 objects:v381 count:16];
              }
              while (v276);
            }

            uint64_t v178 = v267 + 1;
          }
          while (v267 + 1 != v264);
          uint64_t v264 = [v261 countByEnumeratingWithState:&v318 objects:v383 count:16];
        }
        while (v264);
      }

      v134 = v256;
    }
    else
    {
      double v130 = 0.0;
    }
  }
  uint64_t v245 = kSRCSCommandDescriptionsMaxParameterLengthPlaceholderAttributeName;
  *(float *)&double v129 = v51;
  v246 = [NSNumber numberWithFloat:v129];
  objc_msgSend(v9, "addAttribute:value:range:", v245, v246, 0, objc_msgSend(v9, "length"));

  uint64_t v247 = kSRCSCommandDescriptionsMaxEmbeddedCommandLengthPlaceholderAttributeName;
  *(float *)&double v248 = v130;
  v249 = [NSNumber numberWithFloat:v248];
  objc_msgSend(v9, "addAttribute:value:range:", v247, v249, 0, objc_msgSend(v9, "length"));

  id v250 = v9;
  return v250;
}

- (id)_exampleStringPermutationsFromCommandIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[SRCSCommandStringsTable activeTargetTypes];
  id v12 = 0;
  unint64_t v6 = [(SRCSCommandStringsTable *)self languageModelDictionaryForCommandIdentifier:v4 targetTypes:v5 parsingErrorString:&v12];

  id v7 = v12;
  uint64_t v8 = [v7 length];

  id v9 = 0;
  if (!v8)
  {
    id v10 = [(SRCSCommandStringsTable *)self exampleParameterStringsTable];
    id v9 = [(SRCSCommandStringsTable *)self spokenStringPermutationsOfLanguageModelDictionary:v6 stringsTable:v10 restrictPermutationsToShortestAndLongest:0];
  }
  return v9;
}

- (id)_descriptionTypeForParameterIdentifier:(id)a3 commandIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_descriptionTypeForParameterIdentifier_commandIdentifier__staticAlternateParameterDescriptionTypeTableSetUp != -1) {
    dispatch_once(&_descriptionTypeForParameterIdentifier_commandIdentifier__staticAlternateParameterDescriptionTypeTableSetUp, &__block_literal_global_320);
  }
  if (RXEngineTypeForLocaleIdentifier() != 1
    && (([v6 isEqualToString:@"BuiltInLM.TextSegmentCardinalNumber"] & 1) != 0
     || ([v6 isEqualToString:@"BuiltInLM.ScreenDistanceCardinalNumber"] & 1) != 0)
    || [v6 hasPrefix:@"BuiltInLM.Dictation"]
    && +[SRCSCommandStringsTable isLocaleIdentifier:self->_localeIdentifier containedInLocaleIdentifiers:RXLocalesSupportingSpellingMode()])
  {
    uint64_t v8 = @"DSC2";
  }
  else
  {
    id v9 = [(id)_descriptionTypeForParameterIdentifier_commandIdentifier__sAlternateParameterDescriptionTypeTable objectForKey:v6];
    int v10 = [v9 containsObject:v7];

    if (v10) {
      uint64_t v8 = @"DSC2";
    }
    else {
      uint64_t v8 = @"DESC";
    }
  }

  return v8;
}

void __84__SRCSCommandStringsTable__descriptionTypeForParameterIdentifier_commandIdentifier___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  int v1 = (void *)_descriptionTypeForParameterIdentifier_commandIdentifier__sAlternateParameterDescriptionTypeTable;
  _descriptionTypeForParameterIdentifier_commandIdentifier__sAlternateParameterDescriptionTypeTable = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"System.OverlayIncrementLabel", @"System.OverlayIncrementLabelUsingCardinalNumber", @"System.OverlayDecrementLabel", @"System.OverlayDecrementLabelUsingCardinalNumber", @"System.OverlaySetValueByPercentAtLabel", @"System.OverlayShowActionsForLabel", @"System.OverlayShowContextualMenuAtLabel", 0);
  [(id)_descriptionTypeForParameterIdentifier_commandIdentifier__sAlternateParameterDescriptionTypeTable setObject:v2 forKey:kSRCSCommandParameterOverlayLabel[0]];
}

- (id)parameterIdentifiersFromCommandIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[SRCSCommandStringsTable activeTargetTypes];
  uint64_t v10 = 0;
  id v6 = [(SRCSCommandStringsTable *)self languageModelDictionaryForCommandIdentifier:v4 targetTypes:v5 parsingErrorString:&v10];

  id v7 = [(SRCSCommandStringsTable *)self setOfBuiltInIdentifiersFromLanguageModelDictionary:v6];
  uint64_t v8 = [v7 allObjects];

  return v8;
}

- (void)resolveReferencesInMutableAttributedString:(id)a3 stringsTable:(id)a4
{
  id v42 = self;
  v46[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 string];
  uint64_t v8 = [v7 rangeOfString:@"{"];
  uint64_t v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v43 = v6;
    do
    {
      uint64_t v11 = v8 + v10;
      id v12 = objc_msgSend(v5, "string", v42);
      uint64_t v13 = objc_msgSend(v12, "rangeOfString:options:range:", @"}", 0, v8 + v10, objc_msgSend(v5, "length") - (v8 + v10));
      uint64_t v15 = v14;

      uint64_t v16 = [v5 string];
      id v17 = objc_msgSend(v16, "substringWithRange:", v11, v13 - v11);

      id v18 = 0;
      if ([v17 hasPrefix:@"BuiltInLM."])
      {
        id v18 = [v6 objectForKey:v17];

        if (v18)
        {
          id v19 = objc_alloc(MEMORY[0x263F089B8]);
          id v20 = [v6 objectForKey:v17];
          uint64_t v21 = +[SRCSCommandStringsTable formattedBuiltInCommandString:v20];
          id v18 = (void *)[v19 initWithString:v21];

          id v6 = v43;
        }
      }
      if ([v17 hasPrefix:@"CommonSection."])
      {
        id v22 = objc_alloc(MEMORY[0x263F089B8]);
        id v23 = +[SRCSCommandStringsTable activeTargetTypes];
        id v24 = [(SRCSCommandStringsTable *)v42 descriptionStringForCommandIdentifier:v17 descriptionType:@"DESC" targetTypes:v23];
        uint64_t v25 = [v22 initWithString:v24];

        id v6 = v43;
        [(SRCSCommandStringsTable *)v42 resolveReferencesInMutableAttributedString:v25 stringsTable:v43];
        id v18 = (void *)v25;
      }
      if ([v17 hasPrefix:@"RemoteURLRef."])
      {
        long long v26 = +[SRCSCommandStringsTable activeTargetTypes];
        uint64_t v27 = [(SRCSCommandStringsTable *)v42 descriptionStringForCommandIdentifier:v17 descriptionType:@"URLD" targetTypes:v26];

        uint64_t v28 = +[SRCSCommandStringsTable activeTargetTypes];
        uint64_t v29 = [(SRCSCommandStringsTable *)v42 descriptionStringForCommandIdentifier:v17 descriptionType:@"URLS" targetTypes:v28];

        if ([v27 length] && objc_msgSend(v29, "length"))
        {
          id v30 = objc_alloc(MEMORY[0x263F089B8]);
          uint64_t v45 = @"NSLink";
          v46[0] = v29;
          uint64_t v31 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];
          uint64_t v32 = [v30 initWithString:v27 attributes:v31];

          id v18 = (void *)v32;
        }

        id v6 = v43;
      }
      if (v18) {
        goto LABEL_21;
      }
      uint64_t v33 = +[SRCSCommandStringsTable activeTargetTypes];
      id v44 = 0;
      uint64_t v34 = [(SRCSCommandStringsTable *)v42 languageModelDictionaryForCommandIdentifier:v17 targetTypes:v33 parsingErrorString:&v44];
      id v35 = v44;

      uint64_t v36 = [v35 length];
      if (v36)
      {
      }
      else
      {
        uint64_t v37 = [(SRCSCommandStringsTable *)v42 spokenStringPermutationsOfLanguageModelDictionary:v34 stringsTable:v6 restrictPermutationsToShortestAndLongest:1];
        if ([v37 count])
        {
          id v38 = objc_alloc(MEMORY[0x263F089B8]);
          v39 = [v37 firstObject];
          id v18 = (void *)[v38 initWithString:v39];
        }
        else
        {
          id v18 = 0;
        }

        id v6 = v43;
        if (v18) {
          goto LABEL_21;
        }
      }
      id v18 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:@"<unknown>"];
LABEL_21:
      objc_msgSend(v5, "replaceCharactersInRange:withAttributedString:", v8, v15 - v8 + v13, v18);

      id v40 = [v5 string];
      uint64_t v8 = [v40 rangeOfString:@"{"];
      uint64_t v10 = v41;
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }
}

+ (NSString)deviceName
{
  v2 = (__CFString *)MGCopyAnswer();
  id v3 = v2;
  if (!v2) {
    v2 = &stru_26EE2ED18;
  }
  id v4 = v2;

  return v4;
}

- (id)rowDataForTargetTypes:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v45 = [MEMORY[0x263EFF980] array];
  id v5 = objc_opt_new();
  id v43 = v4;
  for (uint64_t i = 1; i != 3; ++i)
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v6 = [(SRCSCommandStringsTable *)self _commandStringsTable];
    id v7 = [v6 allKeys];
    uint64_t v8 = [v7 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v65 objects:v71 count:16];
    if (!v9) {
      goto LABEL_50;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v66;
    uint64_t v46 = *(void *)v66;
    id v47 = v8;
    do
    {
      uint64_t v12 = 0;
      uint64_t v48 = v10;
      do
      {
        if (*(void *)v66 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v65 + 1) + 8 * v12);
        if (![v4 count])
        {
          id v14 = v13;
LABEL_25:
          uint64_t v29 = 0;
          goto LABEL_48;
        }
        id v64 = 0;
        id v14 = [(SRCSCommandStringsTable *)self _rootCommandIdentifierFrom:v13 foundTargetType:&v64];
        id v15 = v64;
        if (!v15) {
          goto LABEL_25;
        }
        id v54 = v15;
        if (objc_msgSend(v4, "containsObject:"))
        {
          uint64_t v51 = v12;
          uint64_t v16 = [MEMORY[0x263F089D8] string];
          uint64_t v17 = [MEMORY[0x263EFF8C0] array];
          id v18 = v14;
          id v19 = (id)v17;
          id v63 = 0;
          long long v53 = v18;
          unint64_t v52 = -[SRCSCommandStringsTable languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:](self, "languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:");
          id v20 = v63;
          if ([v20 length]) {
            [v16 appendString:v20];
          }
          id v50 = v20;
          if (![v16 length])
          {
            uint64_t v21 = [(SRCSCommandStringsTable *)self spokenStringPermutationsOfLanguageModelDictionary:v52 stringsTable:0];

            if (i == 1)
            {
              long long v61 = 0uLL;
              long long v62 = 0uLL;
              long long v59 = 0uLL;
              long long v60 = 0uLL;
              id v22 = v21;
              uint64_t v23 = [v22 countByEnumeratingWithState:&v59 objects:v70 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                id v44 = v21;
                uint64_t v25 = *(void *)v60;
                do
                {
                  for (uint64_t j = 0; j != v24; ++j)
                  {
                    if (*(void *)v60 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    uint64_t v27 = [*(id *)(*((void *)&v59 + 1) + 8 * j) lowercaseString];
                    uint64_t v28 = [v5 objectForKey:v27];
                    if (!v28)
                    {
                      uint64_t v28 = [MEMORY[0x263EFF980] array];
                      [v5 setObject:v28 forKey:v27];
                    }
                    [v28 addObject:v13];
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v59 objects:v70 count:16];
                }
                while (v24);
                id v4 = v43;
                uint64_t v11 = v46;
                uint64_t v8 = v47;
                uint64_t v10 = v48;
                goto LABEL_41;
              }
              uint64_t v10 = v48;
LABEL_43:

              id v19 = v21;
            }
            else
            {
              long long v57 = 0uLL;
              long long v58 = 0uLL;
              long long v55 = 0uLL;
              long long v56 = 0uLL;
              id v44 = v21;
              id v19 = v21;
              uint64_t v30 = [v19 countByEnumeratingWithState:&v55 objects:v69 count:16];
              if (v30)
              {
                uint64_t v31 = v30;
                uint64_t v32 = *(void *)v56;
                do
                {
                  for (uint64_t k = 0; k != v31; ++k)
                  {
                    if (*(void *)v56 != v32) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v34 = [(SRCSCommandStringsTable *)self warningStringForText:*(void *)(*((void *)&v55 + 1) + 8 * k) identifier:v13 textTable:v5];
                    if ([v34 length] && (objc_msgSend(v16, "isEqualToString:", v34) & 1) == 0)
                    {
                      if ([v16 length]) {
                        [v16 appendString:@"  "];
                      }
                      [v16 appendString:v34];
                    }
                  }
                  uint64_t v31 = [v19 countByEnumeratingWithState:&v55 objects:v69 count:16];
                }
                while (v31);
              }

              uint64_t v11 = v46;
              uint64_t v8 = v47;
              uint64_t v10 = v48;
              if (![v16 length])
              {
                id v22 = [(SRCSCommandStringsTable *)self _warningsOfIncorrectTokenizationAcrossSegmentBoundariesInLanguageModelDictionary:v52 stringsTable:0];
                if ([v22 count])
                {
                  id v35 = NSString;
                  uint64_t v36 = [v22 componentsJoinedByString:@"; "];
                  uint64_t v37 = [v35 stringWithFormat:@"Optional phrase crosses word boundary, see: %@.  Optional phrases must contain entire words, not just characters to be prepended to the following word or appended to the preceding word. Fix by expanding the optional phrases as additional variants separated by the '|' symbol.", v36];
                  [v16 appendString:v37];

                  uint64_t v11 = v46;
                  uint64_t v8 = v47;
                }
LABEL_41:
                uint64_t v21 = v44;
                goto LABEL_43;
              }
            }
          }
          if (i == 2)
          {
            id v38 = (void *)MEMORY[0x263EFF9A0];
            v39 = [(SRCSCommandStringsTable *)self _commandStringsTable];
            id v40 = [v39 objectForKey:v13];
            uint64_t v41 = objc_msgSend(v38, "dictionaryWithObjectsAndKeys:", v53, @"Identifier", v40, @"Text", v13, @"DatabaseKey", v54, @"TargetType", v19, @"Permutations", v16, @"Warning", 0);
            [v45 addObject:v41];

            uint64_t v11 = v46;
            uint64_t v10 = v48;

            uint64_t v8 = v47;
          }

          uint64_t v12 = v51;
          id v14 = v53;
        }
        uint64_t v29 = v54;
LABEL_48:

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v10);
LABEL_50:
  }
  return v45;
}

- (id)warningStringForText:(id)a3 identifier:(id)a4 textTable:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 lowercaseString];
  uint64_t v11 = [v9 objectForKey:v10];

  if (v11) {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F08760]) initWithArray:v11];
  }
  else {
    uint64_t v12 = 0;
  }
  if ([v7 length] && (unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    unint64_t v13 = [v12 countForObject:v8];
    id v14 = NSString;
    if (v13 < 2)
    {
      uint64_t v16 = [v11 componentsJoinedByString:@", "];
      id v15 = [v14 stringWithFormat:@"Redundant permutation (\"%@\"", v7, v16];

      if (v15) {
        goto LABEL_27;
      }
    }
    else
    {
      id v15 = [NSString stringWithFormat:@"Redundant permutation (\"%@\"", v7, v8];
      if (v15) {
        goto LABEL_27;
      }
    }
  }
  if (![v7 length])
  {
    id v15 = [NSString stringWithFormat:@"Empty permutation found in %@. Check if any optional phrases causes a permutation to be reduced to an empty string.", v8];
    if (v15) {
      goto LABEL_27;
    }
  }
  if (![v7 length]
    || objc_msgSend(v7, "rangeOfString:", @"(") == 0x7FFFFFFFFFFFFFFFLL
    || [v7 rangeOfString:@""]) == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_26EE2ED18];
    if ([v17 rangeOfString:@"{BuiltInLM.NumberTwoThroughNinetyNine}{BuiltInLM.NumberTwoThroughNinetyNine.2}"] == 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(v17, "rangeOfString:", @"{BuiltInLM.KeyboardKeyName}{BuiltInLM.NumberTwoThroughNinetyNine}") == 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(v17, "rangeOfString:", @"{BuiltInLM.OverlayLabel}{BuiltInLM.NumberTwoThroughNinetyNine}") == 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(v17, "rangeOfString:", @"{BuiltInLM.OverlayLabel}{BuiltInLM.NumberZeroThroughOneHundred}") == 0x7FFFFFFFFFFFFFFFLL)
    {
    }
    else
    {
      id v15 = [NSString stringWithFormat:@"Two numbered parameters appear consecutively without an intervening word or phrase which may cause the following permutation to fail: %@", v7];

      if (v15) {
        goto LABEL_27;
      }
    }
    if ([v7 length] && objc_msgSend(v7, "rangeOfString:", @"’") != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v15 = [NSString stringWithFormat:@"Instead of using right single quotation mark (’)(U+2019) in translations e.g. in \"%@\", please use apostrophe(')(U+0027).", v7];
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = @"Alternative words cannot be indicated using parentheses. Please use two separate command strings, adding another command string entry if necessary.";
  }
LABEL_27:
  if (v15) {
    id v18 = v15;
  }
  else {
    id v18 = &stru_26EE2ED18;
  }
  id v19 = v18;

  return v19;
}

- (id)_commandStringsDictionaryForLocaleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[SRCSCommandStringsTable commandStringsLoader];

  if (v4)
  {
    id v5 = +[SRCSCommandStringsTable componentsFromLocaleIdentifier:v3];
    id v6 = [v5 objectForKey:*MEMORY[0x263EFF508]];

    if ([(__CFString *)v6 isEqualToString:@"nb"])
    {

      id v6 = @"no";
    }
    id v7 = +[SRCSCommandStringsTable commandStringsLoader];
    id v8 = ((void (**)(void, id, __CFString *))v7)[2](v7, v3, v6);
  }
  else
  {
    id v6 = +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities];
    id v8 = [(__CFString *)v6 dictionaryForLocaleIdentifier:v3 resourceFileName:@"CommandStrings" resourceFileExtension:@"strings"];
  }

  return v8;
}

+ (id)commandStringsLoader
{
  v2 = (void *)MEMORY[0x23ECC28C0](sCommandStringsLoader, a2);
  return v2;
}

+ (void)setCommandStringsLoader:(id)a3
{
  sCommandStringsLoader = MEMORY[0x23ECC28C0](a3, a2);
  MEMORY[0x270F9A758]();
}

+ (id)formattedBuiltInCommandString:(id)a3
{
  if (a3)
  {
    id v3 = NSString;
    id v4 = (void *)MEMORY[0x263F086E0];
    id v5 = a3;
    id v6 = [v4 bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"CommandParameter.GenericFormatString" value:&stru_26EE2ED18 table:0];
    id v8 = objc_msgSend(v3, "stringWithFormat:", v7, v5);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterIdentifiersToExamplesTable, 0);
  objc_storeStrong((id *)&self->_phoneticKeyNamesCache, 0);
  objc_storeStrong((id *)&self->_modifierKeyNamesCache, 0);
  objc_storeStrong((id *)&self->_keyboardKeyNamesCache, 0);
  objc_storeStrong((id *)&self->_commandDescriptionsCache, 0);
  objc_storeStrong((id *)&self->_commandStringsCache, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end