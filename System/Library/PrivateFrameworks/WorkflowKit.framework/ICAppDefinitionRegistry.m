@interface ICAppDefinitionRegistry
+ (id)registeredDefinitions;
+ (void)appDefinitionFor2Do;
+ (void)appDefinitionForAssociate;
+ (void)appDefinitionForBear;
+ (void)appDefinitionForBlink;
+ (void)appDefinitionForBooks;
+ (void)appDefinitionForCaptio;
+ (void)appDefinitionForClear;
+ (void)appDefinitionForDayOne;
+ (void)appDefinitionForDrafts;
+ (void)appDefinitionForDue;
+ (void)appDefinitionForEditorial;
+ (void)appDefinitionForFantastical2;
+ (void)appDefinitionForGoogleChrome;
+ (void)appDefinitionForInstagram;
+ (void)appDefinitionForLine;
+ (void)appDefinitionForOmniFocus;
+ (void)appDefinitionForOpener;
+ (void)appDefinitionForOvercast;
+ (void)appDefinitionForPythonista;
+ (void)appDefinitionForQuotebook;
+ (void)appDefinitionForSchemes;
+ (void)appDefinitionForShortcuts;
+ (void)appDefinitionForSkype;
+ (void)appDefinitionForTally;
+ (void)appDefinitionForTelegram;
+ (void)appDefinitionForTextTool;
+ (void)appDefinitionForTheHitList;
+ (void)appDefinitionForThings;
+ (void)appDefinitionForTweetbot;
+ (void)appDefinitionForUlysses;
+ (void)appDefinitionForWhatsApp;
+ (void)appDefinitionForiTranslate;
+ (void)initialize;
+ (void)rediscoverDefinitionsIfNeeded;
+ (void)registerDefinitionForKey:(id)a3 definition:(id)a4;
@end

@implementation ICAppDefinitionRegistry

+ (void)appDefinitionForDrafts
{
}

+ (void)appDefinitionForThings
{
}

+ (void)appDefinitionForClear
{
}

+ (void)appDefinitionForShortcuts
{
}

+ (void)appDefinitionForBooks
{
}

+ (void)appDefinitionForSkype
{
}

+ (void)appDefinitionForiTranslate
{
}

+ (void)appDefinitionForAssociate
{
}

+ (void)appDefinitionForCaptio
{
}

+ (void)appDefinitionForLine
{
}

+ (void)appDefinitionForInstagram
{
}

+ (void)appDefinitionForOmniFocus
{
}

+ (void)appDefinitionForDue
{
}

+ (void)appDefinitionForFantastical2
{
}

+ (void)appDefinitionForDayOne
{
}

+ (void)appDefinitionForQuotebook
{
}

+ (void)appDefinitionForUlysses
{
}

+ (void)appDefinitionForEditorial
{
}

+ (void)appDefinitionForTweetbot
{
}

+ (void)appDefinitionForOvercast
{
}

+ (void)appDefinitionForGoogleChrome
{
}

+ (void)appDefinitionForOpener
{
}

+ (void)appDefinitionForBlink
{
}

+ (void)appDefinitionForWhatsApp
{
}

+ (void)appDefinitionForPythonista
{
}

+ (void)appDefinitionForTextTool
{
}

+ (void)appDefinitionForSchemes
{
}

+ (void)appDefinitionForTally
{
}

+ (void)appDefinitionForTheHitList
{
}

+ (void)appDefinitionForTelegram
{
}

+ (void)appDefinitionForBear
{
}

+ (void)appDefinitionFor2Do
{
}

+ (void)rediscoverDefinitionsIfNeeded
{
  if (rediscoverDefinitionsIfNeeded_onceToken_67318 != -1) {
    dispatch_once(&rediscoverDefinitionsIfNeeded_onceToken_67318, &__block_literal_global_67319);
  }
  uint64_t v3 = rediscoverDefinitionsIfNeeded_calledDefinitionVendingSelectors_67320;
  MEMORY[0x1F4112E48](a1, @"appDefinitionFor", &rediscoverDefinitionsIfNeeded_lock_67322, ICShouldRediscoverAppDefinitions, v3);
}

uint64_t __56__ICAppDefinitionRegistry_rediscoverDefinitionsIfNeeded__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)rediscoverDefinitionsIfNeeded_calledDefinitionVendingSelectors_67320;
  rediscoverDefinitionsIfNeeded_calledDefinitionVendingSelectors_67320 = v0;

  rediscoverDefinitionsIfNeeded_lock_67322 = 0;
  return MEMORY[0x1F40C9F00](ICDyldBulkImageLoadCallback);
}

+ (id)registeredDefinitions
{
  [a1 rediscoverDefinitionsIfNeeded];
  v2 = (void *)[(id)_mutableRegisteredDefinitions_67327 copy];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  v5 = v4;

  return v5;
}

+ (void)registerDefinitionForKey:(id)a3 definition:(id)a4
{
  v5 = (void *)_mutableRegisteredDefinitions_67327;
  id v6 = a3;
  id v7 = _Block_copy(a4);
  [v5 setObject:v7 forKey:v6];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = (void *)_mutableRegisteredDefinitions_67327;
    _mutableRegisteredDefinitions_67327 = v2;
  }
}

@end