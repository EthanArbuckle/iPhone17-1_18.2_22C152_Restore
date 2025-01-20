@interface WFMetricStatusEvent
+ (Class)codableEventClass;
- (BOOL)autoShortcutsSectionsViewed;
- (BOOL)homeAutomationsEnabled;
- (BOOL)installed;
- (BOOL)personalAutomationsEnabled;
- (BOOL)sharingEnabled;
- (BOOL)sleepEnabled;
- (NSString)automationSuggestionsTrialIdentifier;
- (NSString)key;
- (unsigned)appComplicationSlotsUsed;
- (unsigned)appSessionCount;
- (unsigned)averageShortcutCountPerFolder;
- (unsigned)folderCount;
- (unsigned)numberOfExtraLargeWidgets;
- (unsigned)numberOfLargeWidgets;
- (unsigned)numberOfLockScreenWidgets;
- (unsigned)numberOfMediumWidgets;
- (unsigned)numberOfPersonalAutomationsEnabled;
- (unsigned)numberOfPersonalAutomationsFromSuggestionsEnabled;
- (unsigned)numberOfRemoteWidgetsSetup;
- (unsigned)numberOfSmallMultiShortcutWidgets;
- (unsigned)numberOfSmallWidgets;
- (unsigned)numberOfSuggestedAutomationsGenerated;
- (unsigned)numberOfSuggestedAutomationsGeneratedUserAlreadyHas;
- (unsigned)numberOfWidgetsOnHomeScreen;
- (unsigned)numberOfWidgetsOnLoL;
- (unsigned)shortcutComplicationSlotsUsed;
- (unsigned)shortcutRunCount;
- (unsigned)shortcutsCount;
- (unsigned)sleepShortcutsCount;
- (unsigned)uncategorizedShortcutCount;
- (unsigned)watchShortcutCount;
- (void)setAppComplicationSlotsUsed:(unsigned int)a3;
- (void)setAppSessionCount:(unsigned int)a3;
- (void)setAutoShortcutsSectionsViewed:(BOOL)a3;
- (void)setAutomationSuggestionsTrialIdentifier:(id)a3;
- (void)setAverageShortcutCountPerFolder:(unsigned int)a3;
- (void)setFolderCount:(unsigned int)a3;
- (void)setHomeAutomationsEnabled:(BOOL)a3;
- (void)setInstalled:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setNumberOfExtraLargeWidgets:(unsigned int)a3;
- (void)setNumberOfLargeWidgets:(unsigned int)a3;
- (void)setNumberOfLockScreenWidgets:(unsigned int)a3;
- (void)setNumberOfMediumWidgets:(unsigned int)a3;
- (void)setNumberOfPersonalAutomationsEnabled:(unsigned int)a3;
- (void)setNumberOfPersonalAutomationsFromSuggestionsEnabled:(unsigned int)a3;
- (void)setNumberOfRemoteWidgetsSetup:(unsigned int)a3;
- (void)setNumberOfSmallMultiShortcutWidgets:(unsigned int)a3;
- (void)setNumberOfSmallWidgets:(unsigned int)a3;
- (void)setNumberOfSuggestedAutomationsGenerated:(unsigned int)a3;
- (void)setNumberOfSuggestedAutomationsGeneratedUserAlreadyHas:(unsigned int)a3;
- (void)setNumberOfWidgetsOnHomeScreen:(unsigned int)a3;
- (void)setNumberOfWidgetsOnLoL:(unsigned int)a3;
- (void)setPersonalAutomationsEnabled:(BOOL)a3;
- (void)setSharingEnabled:(BOOL)a3;
- (void)setShortcutComplicationSlotsUsed:(unsigned int)a3;
- (void)setShortcutRunCount:(unsigned int)a3;
- (void)setShortcutsCount:(unsigned int)a3;
- (void)setSleepEnabled:(BOOL)a3;
- (void)setSleepShortcutsCount:(unsigned int)a3;
- (void)setUncategorizedShortcutCount:(unsigned int)a3;
- (void)setWatchShortcutCount:(unsigned int)a3;
@end

@implementation WFMetricStatusEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setAutoShortcutsSectionsViewed:(BOOL)a3
{
  self->_autoShortcutsSectionsViewed = a3;
}

- (BOOL)autoShortcutsSectionsViewed
{
  return self->_autoShortcutsSectionsViewed;
}

- (void)setAutomationSuggestionsTrialIdentifier:(id)a3
{
}

- (NSString)automationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier;
}

- (void)setNumberOfRemoteWidgetsSetup:(unsigned int)a3
{
  self->_numberOfRemoteWidgetsSetup = a3;
}

- (unsigned)numberOfRemoteWidgetsSetup
{
  return self->_numberOfRemoteWidgetsSetup;
}

- (void)setNumberOfSuggestedAutomationsGeneratedUserAlreadyHas:(unsigned int)a3
{
  self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas = a3;
}

- (unsigned)numberOfSuggestedAutomationsGeneratedUserAlreadyHas
{
  return self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas;
}

- (void)setNumberOfSuggestedAutomationsGenerated:(unsigned int)a3
{
  self->_numberOfSuggestedAutomationsGenerated = a3;
}

- (unsigned)numberOfSuggestedAutomationsGenerated
{
  return self->_numberOfSuggestedAutomationsGenerated;
}

- (void)setNumberOfLockScreenWidgets:(unsigned int)a3
{
  self->_numberOfLockScreenWidgets = a3;
}

- (unsigned)numberOfLockScreenWidgets
{
  return self->_numberOfLockScreenWidgets;
}

- (void)setNumberOfWidgetsOnLoL:(unsigned int)a3
{
  self->_numberOfWidgetsOnLoL = a3;
}

- (unsigned)numberOfWidgetsOnLoL
{
  return self->_numberOfWidgetsOnLoL;
}

- (void)setNumberOfWidgetsOnHomeScreen:(unsigned int)a3
{
  self->_numberOfWidgetsOnHomeScreen = a3;
}

- (unsigned)numberOfWidgetsOnHomeScreen
{
  return self->_numberOfWidgetsOnHomeScreen;
}

- (void)setNumberOfExtraLargeWidgets:(unsigned int)a3
{
  self->_numberOfExtraLargeWidgets = a3;
}

- (unsigned)numberOfExtraLargeWidgets
{
  return self->_numberOfExtraLargeWidgets;
}

- (void)setNumberOfLargeWidgets:(unsigned int)a3
{
  self->_numberOfLargeWidgets = a3;
}

- (unsigned)numberOfLargeWidgets
{
  return self->_numberOfLargeWidgets;
}

- (void)setNumberOfMediumWidgets:(unsigned int)a3
{
  self->_numberOfMediumWidgets = a3;
}

- (unsigned)numberOfMediumWidgets
{
  return self->_numberOfMediumWidgets;
}

- (void)setNumberOfSmallMultiShortcutWidgets:(unsigned int)a3
{
  self->_numberOfSmallMultiShortcutWidgets = a3;
}

- (unsigned)numberOfSmallMultiShortcutWidgets
{
  return self->_numberOfSmallMultiShortcutWidgets;
}

- (void)setNumberOfSmallWidgets:(unsigned int)a3
{
  self->_numberOfSmallWidgets = a3;
}

- (unsigned)numberOfSmallWidgets
{
  return self->_numberOfSmallWidgets;
}

- (void)setSleepShortcutsCount:(unsigned int)a3
{
  self->_sleepShortcutsCount = a3;
}

- (unsigned)sleepShortcutsCount
{
  return self->_sleepShortcutsCount;
}

- (void)setAppSessionCount:(unsigned int)a3
{
  self->_appSessionCount = a3;
}

- (unsigned)appSessionCount
{
  return self->_appSessionCount;
}

- (void)setShortcutRunCount:(unsigned int)a3
{
  self->_shortcutRunCount = a3;
}

- (unsigned)shortcutRunCount
{
  return self->_shortcutRunCount;
}

- (void)setNumberOfPersonalAutomationsFromSuggestionsEnabled:(unsigned int)a3
{
  self->_numberOfPersonalAutomationsFromSuggestionsEnabled = a3;
}

- (unsigned)numberOfPersonalAutomationsFromSuggestionsEnabled
{
  return self->_numberOfPersonalAutomationsFromSuggestionsEnabled;
}

- (void)setNumberOfPersonalAutomationsEnabled:(unsigned int)a3
{
  self->_numberOfPersonalAutomationsEnabled = a3;
}

- (unsigned)numberOfPersonalAutomationsEnabled
{
  return self->_numberOfPersonalAutomationsEnabled;
}

- (void)setFolderCount:(unsigned int)a3
{
  self->_folderCount = a3;
}

- (unsigned)folderCount
{
  return self->_folderCount;
}

- (void)setWatchShortcutCount:(unsigned int)a3
{
  self->_watchShortcutCount = a3;
}

- (unsigned)watchShortcutCount
{
  return self->_watchShortcutCount;
}

- (void)setUncategorizedShortcutCount:(unsigned int)a3
{
  self->_uncategorizedShortcutCount = a3;
}

- (unsigned)uncategorizedShortcutCount
{
  return self->_uncategorizedShortcutCount;
}

- (void)setShortcutsCount:(unsigned int)a3
{
  self->_shortcutsCount = a3;
}

- (unsigned)shortcutsCount
{
  return self->_shortcutsCount;
}

- (void)setAverageShortcutCountPerFolder:(unsigned int)a3
{
  self->_averageShortcutCountPerFolder = a3;
}

- (unsigned)averageShortcutCountPerFolder
{
  return self->_averageShortcutCountPerFolder;
}

- (void)setAppComplicationSlotsUsed:(unsigned int)a3
{
  self->_appComplicationSlotsUsed = a3;
}

- (unsigned)appComplicationSlotsUsed
{
  return self->_appComplicationSlotsUsed;
}

- (void)setShortcutComplicationSlotsUsed:(unsigned int)a3
{
  self->_shortcutComplicationSlotsUsed = a3;
}

- (unsigned)shortcutComplicationSlotsUsed
{
  return self->_shortcutComplicationSlotsUsed;
}

- (void)setSleepEnabled:(BOOL)a3
{
  self->_sleepEnabled = a3;
}

- (BOOL)sleepEnabled
{
  return self->_sleepEnabled;
}

- (void)setHomeAutomationsEnabled:(BOOL)a3
{
  self->_homeAutomationsEnabled = a3;
}

- (BOOL)homeAutomationsEnabled
{
  return self->_homeAutomationsEnabled;
}

- (void)setPersonalAutomationsEnabled:(BOOL)a3
{
  self->_personalAutomationsEnabled = a3;
}

- (BOOL)personalAutomationsEnabled
{
  return self->_personalAutomationsEnabled;
}

- (void)setSharingEnabled:(BOOL)a3
{
  self->_sharingEnabled = a3;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (BOOL)installed
{
  return self->_installed;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end