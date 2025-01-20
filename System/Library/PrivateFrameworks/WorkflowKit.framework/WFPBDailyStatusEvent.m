@interface WFPBDailyStatusEvent
- (BOOL)autoShortcutsSectionsViewed;
- (BOOL)hasAppComplicationSlotsUsed;
- (BOOL)hasAppSessionCount;
- (BOOL)hasAutoShortcutsSectionsViewed;
- (BOOL)hasAutomationSuggestionsTrialIdentifier;
- (BOOL)hasAverageShortcutCountPerFolder;
- (BOOL)hasFolderCount;
- (BOOL)hasHomeAutomationsEnabled;
- (BOOL)hasInstalled;
- (BOOL)hasKey;
- (BOOL)hasNumberOfExtraLargeWidgets;
- (BOOL)hasNumberOfLargeWidgets;
- (BOOL)hasNumberOfLockScreenWidgets;
- (BOOL)hasNumberOfMediumWidgets;
- (BOOL)hasNumberOfPersonalAutomationsEnabled;
- (BOOL)hasNumberOfPersonalAutomationsFromSuggestionsEnabled;
- (BOOL)hasNumberOfRemoteWidgetsSetup;
- (BOOL)hasNumberOfSmallMultiShortcutWidgets;
- (BOOL)hasNumberOfSmallWidgets;
- (BOOL)hasNumberOfSuggestedAutomationsGenerated;
- (BOOL)hasNumberOfSuggestedAutomationsGeneratedUserAlreadyHas;
- (BOOL)hasNumberOfWidgetsOnHomeScreen;
- (BOOL)hasNumberOfWidgetsOnLoL;
- (BOOL)hasPersonalAutomationsEnabled;
- (BOOL)hasSharingEnabled;
- (BOOL)hasShortcutComplicationSlotsUsed;
- (BOOL)hasShortcutRunCount;
- (BOOL)hasShortcutsCount;
- (BOOL)hasSleepEnabled;
- (BOOL)hasSleepShortcutsCount;
- (BOOL)hasUncategorizedShortcutCount;
- (BOOL)hasWatchShortcutCount;
- (BOOL)homeAutomationsEnabled;
- (BOOL)installed;
- (BOOL)isEqual:(id)a3;
- (BOOL)personalAutomationsEnabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)sharingEnabled;
- (BOOL)sleepEnabled;
- (NSString)automationSuggestionsTrialIdentifier;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
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
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppComplicationSlotsUsed:(unsigned int)a3;
- (void)setAppSessionCount:(unsigned int)a3;
- (void)setAutoShortcutsSectionsViewed:(BOOL)a3;
- (void)setAutomationSuggestionsTrialIdentifier:(id)a3;
- (void)setAverageShortcutCountPerFolder:(unsigned int)a3;
- (void)setFolderCount:(unsigned int)a3;
- (void)setHasAppComplicationSlotsUsed:(BOOL)a3;
- (void)setHasAppSessionCount:(BOOL)a3;
- (void)setHasAutoShortcutsSectionsViewed:(BOOL)a3;
- (void)setHasAverageShortcutCountPerFolder:(BOOL)a3;
- (void)setHasFolderCount:(BOOL)a3;
- (void)setHasHomeAutomationsEnabled:(BOOL)a3;
- (void)setHasInstalled:(BOOL)a3;
- (void)setHasNumberOfExtraLargeWidgets:(BOOL)a3;
- (void)setHasNumberOfLargeWidgets:(BOOL)a3;
- (void)setHasNumberOfLockScreenWidgets:(BOOL)a3;
- (void)setHasNumberOfMediumWidgets:(BOOL)a3;
- (void)setHasNumberOfPersonalAutomationsEnabled:(BOOL)a3;
- (void)setHasNumberOfPersonalAutomationsFromSuggestionsEnabled:(BOOL)a3;
- (void)setHasNumberOfRemoteWidgetsSetup:(BOOL)a3;
- (void)setHasNumberOfSmallMultiShortcutWidgets:(BOOL)a3;
- (void)setHasNumberOfSmallWidgets:(BOOL)a3;
- (void)setHasNumberOfSuggestedAutomationsGenerated:(BOOL)a3;
- (void)setHasNumberOfSuggestedAutomationsGeneratedUserAlreadyHas:(BOOL)a3;
- (void)setHasNumberOfWidgetsOnHomeScreen:(BOOL)a3;
- (void)setHasNumberOfWidgetsOnLoL:(BOOL)a3;
- (void)setHasPersonalAutomationsEnabled:(BOOL)a3;
- (void)setHasSharingEnabled:(BOOL)a3;
- (void)setHasShortcutComplicationSlotsUsed:(BOOL)a3;
- (void)setHasShortcutRunCount:(BOOL)a3;
- (void)setHasShortcutsCount:(BOOL)a3;
- (void)setHasSleepEnabled:(BOOL)a3;
- (void)setHasSleepShortcutsCount:(BOOL)a3;
- (void)setHasUncategorizedShortcutCount:(BOOL)a3;
- (void)setHasWatchShortcutCount:(BOOL)a3;
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
- (void)writeTo:(id)a3;
@end

@implementation WFPBDailyStatusEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, 0);
}

- (unsigned)numberOfSmallMultiShortcutWidgets
{
  return self->_numberOfSmallMultiShortcutWidgets;
}

- (unsigned)numberOfExtraLargeWidgets
{
  return self->_numberOfExtraLargeWidgets;
}

- (unsigned)numberOfLockScreenWidgets
{
  return self->_numberOfLockScreenWidgets;
}

- (unsigned)numberOfRemoteWidgetsSetup
{
  return self->_numberOfRemoteWidgetsSetup;
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

- (unsigned)numberOfSuggestedAutomationsGeneratedUserAlreadyHas
{
  return self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas;
}

- (unsigned)numberOfSuggestedAutomationsGenerated
{
  return self->_numberOfSuggestedAutomationsGenerated;
}

- (unsigned)numberOfPersonalAutomationsFromSuggestionsEnabled
{
  return self->_numberOfPersonalAutomationsFromSuggestionsEnabled;
}

- (unsigned)numberOfPersonalAutomationsEnabled
{
  return self->_numberOfPersonalAutomationsEnabled;
}

- (unsigned)numberOfWidgetsOnLoL
{
  return self->_numberOfWidgetsOnLoL;
}

- (unsigned)numberOfWidgetsOnHomeScreen
{
  return self->_numberOfWidgetsOnHomeScreen;
}

- (unsigned)numberOfLargeWidgets
{
  return self->_numberOfLargeWidgets;
}

- (unsigned)numberOfMediumWidgets
{
  return self->_numberOfMediumWidgets;
}

- (unsigned)numberOfSmallWidgets
{
  return self->_numberOfSmallWidgets;
}

- (unsigned)sleepShortcutsCount
{
  return self->_sleepShortcutsCount;
}

- (unsigned)watchShortcutCount
{
  return self->_watchShortcutCount;
}

- (unsigned)appSessionCount
{
  return self->_appSessionCount;
}

- (unsigned)shortcutRunCount
{
  return self->_shortcutRunCount;
}

- (unsigned)uncategorizedShortcutCount
{
  return self->_uncategorizedShortcutCount;
}

- (unsigned)averageShortcutCountPerFolder
{
  return self->_averageShortcutCountPerFolder;
}

- (unsigned)folderCount
{
  return self->_folderCount;
}

- (unsigned)shortcutsCount
{
  return self->_shortcutsCount;
}

- (BOOL)sleepEnabled
{
  return self->_sleepEnabled;
}

- (unsigned)appComplicationSlotsUsed
{
  return self->_appComplicationSlotsUsed;
}

- (unsigned)shortcutComplicationSlotsUsed
{
  return self->_shortcutComplicationSlotsUsed;
}

- (BOOL)homeAutomationsEnabled
{
  return self->_homeAutomationsEnabled;
}

- (BOOL)personalAutomationsEnabled
{
  return self->_personalAutomationsEnabled;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (BOOL)installed
{
  return self->_installed;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 4))
  {
    -[WFPBDailyStatusEvent setKey:](self, "setKey:");
    id v4 = v7;
  }
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x2000000) != 0)
  {
    self->_installed = *((unsigned char *)v4 + 118);
    *(_DWORD *)&self->_has |= 0x2000000u;
    int v5 = *((_DWORD *)v4 + 31);
    if ((v5 & 0x8000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x4000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_41;
    }
  }
  else if ((v5 & 0x8000000) == 0)
  {
    goto LABEL_5;
  }
  self->_sharingEnabled = *((unsigned char *)v4 + 120);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_personalAutomationsEnabled = *((unsigned char *)v4 + 119);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_homeAutomationsEnabled = *((unsigned char *)v4 + 117);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x20000) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_shortcutComplicationSlotsUsed = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_appComplicationSlotsUsed = *((_DWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_sleepEnabled = *((unsigned char *)v4 + 121);
  *(_DWORD *)&self->_has |= 0x10000000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x80000) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_shortcutsCount = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_folderCount = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 4) == 0)
  {
LABEL_13:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_averageShortcutCountPerFolder = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x200000) == 0)
  {
LABEL_14:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_uncategorizedShortcutCount = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x40000) == 0)
  {
LABEL_15:
    if ((v5 & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_shortcutRunCount = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 2) == 0)
  {
LABEL_16:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_appSessionCount = *((_DWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x400000) == 0)
  {
LABEL_17:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_watchShortcutCount = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x100000) == 0)
  {
LABEL_18:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_sleepShortcutsCount = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x1000) == 0)
  {
LABEL_19:
    if ((v5 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_numberOfSmallWidgets = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x80) == 0)
  {
LABEL_20:
    if ((v5 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_numberOfMediumWidgets = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x20) == 0)
  {
LABEL_21:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_numberOfLargeWidgets = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x8000) == 0)
  {
LABEL_22:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_numberOfWidgetsOnHomeScreen = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x10000) == 0)
  {
LABEL_23:
    if ((v5 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_numberOfWidgetsOnLoL = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x100) == 0)
  {
LABEL_24:
    if ((v5 & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_numberOfPersonalAutomationsEnabled = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x200) == 0)
  {
LABEL_25:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_numberOfPersonalAutomationsFromSuggestionsEnabled = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x2000) == 0)
  {
LABEL_26:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_61:
  self->_numberOfSuggestedAutomationsGenerated = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v4 + 31) & 0x4000) != 0)
  {
LABEL_27:
    self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_28:
  if (*((void *)v4 + 2))
  {
    -[WFPBDailyStatusEvent setAutomationSuggestionsTrialIdentifier:](self, "setAutomationSuggestionsTrialIdentifier:");
    id v4 = v7;
  }
  int v6 = *((_DWORD *)v4 + 31);
  if ((v6 & 0x800000) != 0)
  {
    self->_autoShortcutsSectionsViewed = *((unsigned char *)v4 + 116);
    *(_DWORD *)&self->_has |= 0x800000u;
    int v6 = *((_DWORD *)v4 + 31);
    if ((v6 & 0x400) == 0)
    {
LABEL_32:
      if ((v6 & 0x40) == 0) {
        goto LABEL_33;
      }
      goto LABEL_65;
    }
  }
  else if ((v6 & 0x400) == 0)
  {
    goto LABEL_32;
  }
  self->_numberOfRemoteWidgetsSetup = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  int v6 = *((_DWORD *)v4 + 31);
  if ((v6 & 0x40) == 0)
  {
LABEL_33:
    if ((v6 & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_numberOfLockScreenWidgets = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  int v6 = *((_DWORD *)v4 + 31);
  if ((v6 & 0x10) == 0)
  {
LABEL_34:
    if ((v6 & 0x800) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_66:
  self->_numberOfExtraLargeWidgets = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)v4 + 31) & 0x800) != 0)
  {
LABEL_35:
    self->_numberOfSmallMultiShortcutWidgets = *((_DWORD *)v4 + 17);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_36:
}

- (unint64_t)hash
{
  NSUInteger v37 = [(NSString *)self->_key hash];
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    uint64_t v36 = 2654435761 * self->_installed;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
LABEL_3:
      uint64_t v35 = 2654435761 * self->_sharingEnabled;
      if ((*(_DWORD *)&has & 0x4000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v36 = 0;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v35 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_4:
    uint64_t v34 = 2654435761 * self->_personalAutomationsEnabled;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v34 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_5:
    uint64_t v33 = 2654435761 * self->_homeAutomationsEnabled;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_6:
    uint64_t v32 = 2654435761 * self->_shortcutComplicationSlotsUsed;
    if (*(unsigned char *)&has) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v32 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_7:
    uint64_t v31 = 2654435761 * self->_appComplicationSlotsUsed;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_8:
    uint64_t v30 = 2654435761 * self->_sleepEnabled;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_9:
    uint64_t v29 = 2654435761 * self->_shortcutsCount;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v29 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_10:
    uint64_t v28 = 2654435761 * self->_folderCount;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v28 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_11:
    uint64_t v27 = 2654435761 * self->_averageShortcutCountPerFolder;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v27 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_12:
    uint64_t v26 = 2654435761 * self->_uncategorizedShortcutCount;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_13:
    uint64_t v25 = 2654435761 * self->_shortcutRunCount;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v25 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_14:
    uint64_t v24 = 2654435761 * self->_appSessionCount;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_15:
    uint64_t v23 = 2654435761 * self->_watchShortcutCount;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v23 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_16:
    uint64_t v22 = 2654435761 * self->_sleepShortcutsCount;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v22 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_17:
    uint64_t v20 = 2654435761 * self->_numberOfSmallWidgets;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_18:
    uint64_t v4 = 2654435761 * self->_numberOfMediumWidgets;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_19:
    uint64_t v5 = 2654435761 * self->_numberOfLargeWidgets;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_20:
    uint64_t v6 = 2654435761 * self->_numberOfWidgetsOnHomeScreen;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_21:
    uint64_t v7 = 2654435761 * self->_numberOfWidgetsOnLoL;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_22;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_22:
    uint64_t v8 = 2654435761 * self->_numberOfPersonalAutomationsEnabled;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_23:
    uint64_t v9 = 2654435761 * self->_numberOfPersonalAutomationsFromSuggestionsEnabled;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_24;
    }
LABEL_48:
    uint64_t v10 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_49;
  }
LABEL_47:
  uint64_t v9 = 0;
  if ((*(_WORD *)&has & 0x2000) == 0) {
    goto LABEL_48;
  }
LABEL_24:
  uint64_t v10 = 2654435761 * self->_numberOfSuggestedAutomationsGenerated;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_25:
    uint64_t v11 = 2654435761 * self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas;
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v11 = 0;
LABEL_50:
  NSUInteger v12 = [(NSString *)self->_automationSuggestionsTrialIdentifier hash];
  $C78FFC96DE9D923BD21BCE108E8119F6 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) != 0)
  {
    uint64_t v14 = 2654435761 * self->_autoShortcutsSectionsViewed;
    if ((*(_WORD *)&v13 & 0x400) != 0)
    {
LABEL_52:
      uint64_t v15 = 2654435761 * self->_numberOfRemoteWidgetsSetup;
      if ((*(unsigned char *)&v13 & 0x40) != 0) {
        goto LABEL_53;
      }
      goto LABEL_58;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(_WORD *)&v13 & 0x400) != 0) {
      goto LABEL_52;
    }
  }
  uint64_t v15 = 0;
  if ((*(unsigned char *)&v13 & 0x40) != 0)
  {
LABEL_53:
    uint64_t v16 = 2654435761 * self->_numberOfLockScreenWidgets;
    if ((*(unsigned char *)&v13 & 0x10) != 0) {
      goto LABEL_54;
    }
LABEL_59:
    uint64_t v17 = 0;
    if ((*(_WORD *)&v13 & 0x800) != 0) {
      goto LABEL_55;
    }
LABEL_60:
    uint64_t v18 = 0;
    return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
LABEL_58:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&v13 & 0x10) == 0) {
    goto LABEL_59;
  }
LABEL_54:
  uint64_t v17 = 2654435761 * self->_numberOfExtraLargeWidgets;
  if ((*(_WORD *)&v13 & 0x800) == 0) {
    goto LABEL_60;
  }
LABEL_55:
  uint64_t v18 = 2654435761 * self->_numberOfSmallMultiShortcutWidgets;
  return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_170;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_170;
    }
  }
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  int v7 = *((_DWORD *)v4 + 31);
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0) {
      goto LABEL_170;
    }
    if (self->_installed)
    {
      if (!*((unsigned char *)v4 + 118)) {
        goto LABEL_170;
      }
    }
    else if (*((unsigned char *)v4 + 118))
    {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_170;
    }
    if (self->_sharingEnabled)
    {
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_170;
      }
    }
    else if (*((unsigned char *)v4 + 120))
    {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0) {
      goto LABEL_170;
    }
    if (self->_personalAutomationsEnabled)
    {
      if (!*((unsigned char *)v4 + 119)) {
        goto LABEL_170;
      }
    }
    else if (*((unsigned char *)v4 + 119))
    {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0) {
      goto LABEL_170;
    }
    if (self->_homeAutomationsEnabled)
    {
      if (!*((unsigned char *)v4 + 117)) {
        goto LABEL_170;
      }
    }
    else if (*((unsigned char *)v4 + 117))
    {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_shortcutComplicationSlotsUsed != *((_DWORD *)v4 + 23)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_170;
  }
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_appComplicationSlotsUsed != *((_DWORD *)v4 + 2)) {
      goto LABEL_170;
    }
  }
  else if (v7)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0) {
      goto LABEL_170;
    }
    if (self->_sleepEnabled)
    {
      if (!*((unsigned char *)v4 + 121)) {
        goto LABEL_170;
      }
    }
    else if (*((unsigned char *)v4 + 121))
    {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_shortcutsCount != *((_DWORD *)v4 + 25)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_folderCount != *((_DWORD *)v4 + 7)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_170;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_averageShortcutCountPerFolder != *((_DWORD *)v4 + 6)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_uncategorizedShortcutCount != *((_DWORD *)v4 + 27)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_shortcutRunCount != *((_DWORD *)v4 + 24)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_appSessionCount != *((_DWORD *)v4 + 3)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_watchShortcutCount != *((_DWORD *)v4 + 28)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_sleepShortcutsCount != *((_DWORD *)v4 + 26)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_numberOfSmallWidgets != *((_DWORD *)v4 + 18)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_numberOfMediumWidgets != *((_DWORD *)v4 + 13)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_170;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_numberOfLargeWidgets != *((_DWORD *)v4 + 11)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_numberOfWidgetsOnHomeScreen != *((_DWORD *)v4 + 21)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_numberOfWidgetsOnLoL != *((_DWORD *)v4 + 22)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_numberOfPersonalAutomationsEnabled != *((_DWORD *)v4 + 14)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_numberOfPersonalAutomationsFromSuggestionsEnabled != *((_DWORD *)v4 + 15)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_numberOfSuggestedAutomationsGenerated != *((_DWORD *)v4 + 19)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas != *((_DWORD *)v4 + 20)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_170;
  }
  automationSuggestionsTrialIdentifier = self->_automationSuggestionsTrialIdentifier;
  if ((unint64_t)automationSuggestionsTrialIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](automationSuggestionsTrialIdentifier, "isEqual:")) {
      goto LABEL_170;
    }
    $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
    int v7 = *((_DWORD *)v4 + 31);
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) != 0)
    {
      if (self->_autoShortcutsSectionsViewed)
      {
        if (!*((unsigned char *)v4 + 116)) {
          goto LABEL_170;
        }
        goto LABEL_150;
      }
      if (!*((unsigned char *)v4 + 116)) {
        goto LABEL_150;
      }
    }
LABEL_170:
    BOOL v9 = 0;
    goto LABEL_171;
  }
  if ((v7 & 0x800000) != 0) {
    goto LABEL_170;
  }
LABEL_150:
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_numberOfRemoteWidgetsSetup != *((_DWORD *)v4 + 16)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_170;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_numberOfLockScreenWidgets != *((_DWORD *)v4 + 12)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_170;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_numberOfExtraLargeWidgets != *((_DWORD *)v4 + 10)) {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_numberOfSmallMultiShortcutWidgets != *((_DWORD *)v4 + 17)) {
      goto LABEL_170;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v7 & 0x800) == 0;
  }
LABEL_171:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  int v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    *(unsigned char *)(v5 + 118) = self->_installed;
    *(_DWORD *)(v5 + 124) |= 0x2000000u;
    $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 120) = self->_sharingEnabled;
  *(_DWORD *)(v5 + 124) |= 0x8000000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(unsigned char *)(v5 + 119) = self->_personalAutomationsEnabled;
  *(_DWORD *)(v5 + 124) |= 0x4000000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(unsigned char *)(v5 + 117) = self->_homeAutomationsEnabled;
  *(_DWORD *)(v5 + 124) |= 0x1000000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 92) = self->_shortcutComplicationSlotsUsed;
  *(_DWORD *)(v5 + 124) |= 0x20000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 8) = self->_appComplicationSlotsUsed;
  *(_DWORD *)(v5 + 124) |= 1u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(unsigned char *)(v5 + 121) = self->_sleepEnabled;
  *(_DWORD *)(v5 + 124) |= 0x10000000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 100) = self->_shortcutsCount;
  *(_DWORD *)(v5 + 124) |= 0x80000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 28) = self->_folderCount;
  *(_DWORD *)(v5 + 124) |= 8u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 24) = self->_averageShortcutCountPerFolder;
  *(_DWORD *)(v5 + 124) |= 4u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 108) = self->_uncategorizedShortcutCount;
  *(_DWORD *)(v5 + 124) |= 0x200000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v5 + 96) = self->_shortcutRunCount;
  *(_DWORD *)(v5 + 124) |= 0x40000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v5 + 12) = self->_appSessionCount;
  *(_DWORD *)(v5 + 124) |= 2u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v5 + 112) = self->_watchShortcutCount;
  *(_DWORD *)(v5 + 124) |= 0x400000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v5 + 104) = self->_sleepShortcutsCount;
  *(_DWORD *)(v5 + 124) |= 0x100000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v5 + 72) = self->_numberOfSmallWidgets;
  *(_DWORD *)(v5 + 124) |= 0x1000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 52) = self->_numberOfMediumWidgets;
  *(_DWORD *)(v5 + 124) |= 0x80u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 44) = self->_numberOfLargeWidgets;
  *(_DWORD *)(v5 + 124) |= 0x20u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v5 + 84) = self->_numberOfWidgetsOnHomeScreen;
  *(_DWORD *)(v5 + 124) |= 0x8000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v5 + 88) = self->_numberOfWidgetsOnLoL;
  *(_DWORD *)(v5 + 124) |= 0x10000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v5 + 56) = self->_numberOfPersonalAutomationsEnabled;
  *(_DWORD *)(v5 + 124) |= 0x100u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v5 + 60) = self->_numberOfPersonalAutomationsFromSuggestionsEnabled;
  *(_DWORD *)(v5 + 124) |= 0x200u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_55:
  *(_DWORD *)(v5 + 76) = self->_numberOfSuggestedAutomationsGenerated;
  *(_DWORD *)(v5 + 124) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_25:
    *(_DWORD *)(v5 + 80) = self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas;
    *(_DWORD *)(v5 + 124) |= 0x4000u;
  }
LABEL_26:
  uint64_t v9 = [(NSString *)self->_automationSuggestionsTrialIdentifier copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  $C78FFC96DE9D923BD21BCE108E8119F6 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    *(unsigned char *)(v5 + 116) = self->_autoShortcutsSectionsViewed;
    *(_DWORD *)(v5 + 124) |= 0x800000u;
    $C78FFC96DE9D923BD21BCE108E8119F6 v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x400) == 0)
    {
LABEL_28:
      if ((*(unsigned char *)&v11 & 0x40) == 0) {
        goto LABEL_29;
      }
      goto LABEL_59;
    }
  }
  else if ((*(_WORD *)&v11 & 0x400) == 0)
  {
    goto LABEL_28;
  }
  *(_DWORD *)(v5 + 64) = self->_numberOfRemoteWidgetsSetup;
  *(_DWORD *)(v5 + 124) |= 0x400u;
  $C78FFC96DE9D923BD21BCE108E8119F6 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x40) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v11 & 0x10) == 0) {
      goto LABEL_30;
    }
LABEL_60:
    *(_DWORD *)(v5 + 40) = self->_numberOfExtraLargeWidgets;
    *(_DWORD *)(v5 + 124) |= 0x10u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0) {
      return (id)v5;
    }
    goto LABEL_31;
  }
LABEL_59:
  *(_DWORD *)(v5 + 48) = self->_numberOfLockScreenWidgets;
  *(_DWORD *)(v5 + 124) |= 0x40u;
  $C78FFC96DE9D923BD21BCE108E8119F6 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x10) != 0) {
    goto LABEL_60;
  }
LABEL_30:
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
LABEL_31:
    *(_DWORD *)(v5 + 68) = self->_numberOfSmallMultiShortcutWidgets;
    *(_DWORD *)(v5 + 124) |= 0x800u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v7;
  }
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    *((unsigned char *)v4 + 118) = self->_installed;
    *((_DWORD *)v4 + 31) |= 0x2000000u;
    $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_41;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 120) = self->_sharingEnabled;
  *((_DWORD *)v4 + 31) |= 0x8000000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((unsigned char *)v4 + 119) = self->_personalAutomationsEnabled;
  *((_DWORD *)v4 + 31) |= 0x4000000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((unsigned char *)v4 + 117) = self->_homeAutomationsEnabled;
  *((_DWORD *)v4 + 31) |= 0x1000000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 23) = self->_shortcutComplicationSlotsUsed;
  *((_DWORD *)v4 + 31) |= 0x20000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 2) = self->_appComplicationSlotsUsed;
  *((_DWORD *)v4 + 31) |= 1u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((unsigned char *)v4 + 121) = self->_sleepEnabled;
  *((_DWORD *)v4 + 31) |= 0x10000000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 25) = self->_shortcutsCount;
  *((_DWORD *)v4 + 31) |= 0x80000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 7) = self->_folderCount;
  *((_DWORD *)v4 + 31) |= 8u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 6) = self->_averageShortcutCountPerFolder;
  *((_DWORD *)v4 + 31) |= 4u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 27) = self->_uncategorizedShortcutCount;
  *((_DWORD *)v4 + 31) |= 0x200000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 24) = self->_shortcutRunCount;
  *((_DWORD *)v4 + 31) |= 0x40000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 3) = self->_appSessionCount;
  *((_DWORD *)v4 + 31) |= 2u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 28) = self->_watchShortcutCount;
  *((_DWORD *)v4 + 31) |= 0x400000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 26) = self->_sleepShortcutsCount;
  *((_DWORD *)v4 + 31) |= 0x100000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 18) = self->_numberOfSmallWidgets;
  *((_DWORD *)v4 + 31) |= 0x1000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 13) = self->_numberOfMediumWidgets;
  *((_DWORD *)v4 + 31) |= 0x80u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 11) = self->_numberOfLargeWidgets;
  *((_DWORD *)v4 + 31) |= 0x20u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 21) = self->_numberOfWidgetsOnHomeScreen;
  *((_DWORD *)v4 + 31) |= 0x8000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 22) = self->_numberOfWidgetsOnLoL;
  *((_DWORD *)v4 + 31) |= 0x10000u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 14) = self->_numberOfPersonalAutomationsEnabled;
  *((_DWORD *)v4 + 31) |= 0x100u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 15) = self->_numberOfPersonalAutomationsFromSuggestionsEnabled;
  *((_DWORD *)v4 + 31) |= 0x200u;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_61:
  *((_DWORD *)v4 + 19) = self->_numberOfSuggestedAutomationsGenerated;
  *((_DWORD *)v4 + 31) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_27:
    *((_DWORD *)v4 + 20) = self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas;
    *((_DWORD *)v4 + 31) |= 0x4000u;
  }
LABEL_28:
  if (self->_automationSuggestionsTrialIdentifier)
  {
    objc_msgSend(v7, "setAutomationSuggestionsTrialIdentifier:");
    id v4 = v7;
  }
  $C78FFC96DE9D923BD21BCE108E8119F6 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    *((unsigned char *)v4 + 116) = self->_autoShortcutsSectionsViewed;
    *((_DWORD *)v4 + 31) |= 0x800000u;
    $C78FFC96DE9D923BD21BCE108E8119F6 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_32:
      if ((*(unsigned char *)&v6 & 0x40) == 0) {
        goto LABEL_33;
      }
      goto LABEL_65;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_32;
  }
  *((_DWORD *)v4 + 16) = self->_numberOfRemoteWidgetsSetup;
  *((_DWORD *)v4 + 31) |= 0x400u;
  $C78FFC96DE9D923BD21BCE108E8119F6 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v4 + 12) = self->_numberOfLockScreenWidgets;
  *((_DWORD *)v4 + 31) |= 0x40u;
  $C78FFC96DE9D923BD21BCE108E8119F6 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_66:
  *((_DWORD *)v4 + 10) = self->_numberOfExtraLargeWidgets;
  *((_DWORD *)v4 + 31) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_35:
    *((_DWORD *)v4 + 17) = self->_numberOfSmallMultiShortcutWidgets;
    *((_DWORD *)v4 + 31) |= 0x800u;
  }
LABEL_36:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_41;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_27:
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
LABEL_28:
  if (self->_automationSuggestionsTrialIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  $C78FFC96DE9D923BD21BCE108E8119F6 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    $C78FFC96DE9D923BD21BCE108E8119F6 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_32:
      if ((*(unsigned char *)&v6 & 0x40) == 0) {
        goto LABEL_33;
      }
      goto LABEL_65;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_32;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_35:
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
LABEL_36:
}

- (BOOL)readFrom:(id)a3
{
  return WFPBDailyStatusEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    NSUInteger v12 = [NSNumber numberWithBool:self->_installed];
    [v4 setObject:v12 forKey:@"installed"];

    $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_41;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_5;
  }
  $C78FFC96DE9D923BD21BCE108E8119F6 v13 = [NSNumber numberWithBool:self->_sharingEnabled];
  [v4 setObject:v13 forKey:@"sharingEnabled"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v14 = [NSNumber numberWithBool:self->_personalAutomationsEnabled];
  [v4 setObject:v14 forKey:@"personalAutomationsEnabled"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v15 = [NSNumber numberWithBool:self->_homeAutomationsEnabled];
  [v4 setObject:v15 forKey:@"homeAutomationsEnabled"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v16 = [NSNumber numberWithUnsignedInt:self->_shortcutComplicationSlotsUsed];
  [v4 setObject:v16 forKey:@"shortcutComplicationSlotsUsed"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v17 = [NSNumber numberWithUnsignedInt:self->_appComplicationSlotsUsed];
  [v4 setObject:v17 forKey:@"appComplicationSlotsUsed"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v18 = [NSNumber numberWithBool:self->_sleepEnabled];
  [v4 setObject:v18 forKey:@"sleepEnabled"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  v19 = [NSNumber numberWithUnsignedInt:self->_shortcutsCount];
  [v4 setObject:v19 forKey:@"shortcutsCount"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v20 = [NSNumber numberWithUnsignedInt:self->_folderCount];
  [v4 setObject:v20 forKey:@"folderCount"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v21 = [NSNumber numberWithUnsignedInt:self->_averageShortcutCountPerFolder];
  [v4 setObject:v21 forKey:@"averageShortcutCountPerFolder"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v22 = [NSNumber numberWithUnsignedInt:self->_uncategorizedShortcutCount];
  [v4 setObject:v22 forKey:@"uncategorizedShortcutCount"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v23 = [NSNumber numberWithUnsignedInt:self->_shortcutRunCount];
  [v4 setObject:v23 forKey:@"shortcutRunCount"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v24 = [NSNumber numberWithUnsignedInt:self->_appSessionCount];
  [v4 setObject:v24 forKey:@"appSessionCount"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v25 = [NSNumber numberWithUnsignedInt:self->_watchShortcutCount];
  [v4 setObject:v25 forKey:@"watchShortcutCount"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v26 = [NSNumber numberWithUnsignedInt:self->_sleepShortcutsCount];
  [v4 setObject:v26 forKey:@"sleepShortcutsCount"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v27 = [NSNumber numberWithUnsignedInt:self->_numberOfSmallWidgets];
  [v4 setObject:v27 forKey:@"numberOfSmallWidgets"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v28 = [NSNumber numberWithUnsignedInt:self->_numberOfMediumWidgets];
  [v4 setObject:v28 forKey:@"numberOfMediumWidgets"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v29 = [NSNumber numberWithUnsignedInt:self->_numberOfLargeWidgets];
  [v4 setObject:v29 forKey:@"numberOfLargeWidgets"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v30 = [NSNumber numberWithUnsignedInt:self->_numberOfWidgetsOnHomeScreen];
  [v4 setObject:v30 forKey:@"numberOfWidgetsOnHomeScreen"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v31 = [NSNumber numberWithUnsignedInt:self->_numberOfWidgetsOnLoL];
  [v4 setObject:v31 forKey:@"numberOfWidgetsOnLoL"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v32 = [NSNumber numberWithUnsignedInt:self->_numberOfPersonalAutomationsEnabled];
  [v4 setObject:v32 forKey:@"numberOfPersonalAutomationsEnabled"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v33 = [NSNumber numberWithUnsignedInt:self->_numberOfPersonalAutomationsFromSuggestionsEnabled];
  [v4 setObject:v33 forKey:@"numberOfPersonalAutomationsFromSuggestionsEnabled"];

  $C78FFC96DE9D923BD21BCE108E8119F6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_61:
  uint64_t v34 = [NSNumber numberWithUnsignedInt:self->_numberOfSuggestedAutomationsGenerated];
  [v4 setObject:v34 forKey:@"numberOfSuggestedAutomationsGenerated"];

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_27:
    id v7 = [NSNumber numberWithUnsignedInt:self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas];
    [v4 setObject:v7 forKey:@"numberOfSuggestedAutomationsGeneratedUserAlreadyHas"];
  }
LABEL_28:
  automationSuggestionsTrialIdentifier = self->_automationSuggestionsTrialIdentifier;
  if (automationSuggestionsTrialIdentifier) {
    [v4 setObject:automationSuggestionsTrialIdentifier forKey:@"automationSuggestionsTrialIdentifier"];
  }
  $C78FFC96DE9D923BD21BCE108E8119F6 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
    uint64_t v35 = [NSNumber numberWithBool:self->_autoShortcutsSectionsViewed];
    [v4 setObject:v35 forKey:@"autoShortcutsSectionsViewed"];

    $C78FFC96DE9D923BD21BCE108E8119F6 v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x400) == 0)
    {
LABEL_32:
      if ((*(unsigned char *)&v9 & 0x40) == 0) {
        goto LABEL_33;
      }
      goto LABEL_65;
    }
  }
  else if ((*(_WORD *)&v9 & 0x400) == 0)
  {
    goto LABEL_32;
  }
  uint64_t v36 = [NSNumber numberWithUnsignedInt:self->_numberOfRemoteWidgetsSetup];
  [v4 setObject:v36 forKey:@"numberOfRemoteWidgetsSetup"];

  $C78FFC96DE9D923BD21BCE108E8119F6 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x40) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v9 & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_66;
  }
LABEL_65:
  NSUInteger v37 = [NSNumber numberWithUnsignedInt:self->_numberOfLockScreenWidgets];
  [v4 setObject:v37 forKey:@"numberOfLockScreenWidgets"];

  $C78FFC96DE9D923BD21BCE108E8119F6 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x10) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v9 & 0x800) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_66:
  v38 = [NSNumber numberWithUnsignedInt:self->_numberOfExtraLargeWidgets];
  [v4 setObject:v38 forKey:@"numberOfExtraLargeWidgets"];

  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_35:
    uint64_t v10 = [NSNumber numberWithUnsignedInt:self->_numberOfSmallMultiShortcutWidgets];
    [v4 setObject:v10 forKey:@"numberOfSmallMultiShortcutWidgets"];
  }
LABEL_36:
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBDailyStatusEvent;
  id v4 = [(WFPBDailyStatusEvent *)&v8 description];
  uint64_t v5 = [(WFPBDailyStatusEvent *)self dictionaryRepresentation];
  $C78FFC96DE9D923BD21BCE108E8119F6 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasNumberOfSmallMultiShortcutWidgets
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasNumberOfSmallMultiShortcutWidgets:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)setNumberOfSmallMultiShortcutWidgets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_numberOfSmallMultiShortcutWidgets = a3;
}

- (BOOL)hasNumberOfExtraLargeWidgets
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasNumberOfExtraLargeWidgets:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (void)setNumberOfExtraLargeWidgets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_numberOfExtraLargeWidgets = a3;
}

- (BOOL)hasNumberOfLockScreenWidgets
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasNumberOfLockScreenWidgets:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (void)setNumberOfLockScreenWidgets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_numberOfLockScreenWidgets = a3;
}

- (BOOL)hasNumberOfRemoteWidgetsSetup
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasNumberOfRemoteWidgetsSetup:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (void)setNumberOfRemoteWidgetsSetup:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_numberOfRemoteWidgetsSetup = a3;
}

- (BOOL)hasAutoShortcutsSectionsViewed
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasAutoShortcutsSectionsViewed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (void)setAutoShortcutsSectionsViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_autoShortcutsSectionsViewed = a3;
}

- (BOOL)hasAutomationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier != 0;
}

- (BOOL)hasNumberOfSuggestedAutomationsGeneratedUserAlreadyHas
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasNumberOfSuggestedAutomationsGeneratedUserAlreadyHas:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (void)setNumberOfSuggestedAutomationsGeneratedUserAlreadyHas:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas = a3;
}

- (BOOL)hasNumberOfSuggestedAutomationsGenerated
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasNumberOfSuggestedAutomationsGenerated:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (void)setNumberOfSuggestedAutomationsGenerated:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_numberOfSuggestedAutomationsGenerated = a3;
}

- (BOOL)hasNumberOfPersonalAutomationsFromSuggestionsEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasNumberOfPersonalAutomationsFromSuggestionsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (void)setNumberOfPersonalAutomationsFromSuggestionsEnabled:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_numberOfPersonalAutomationsFromSuggestionsEnabled = a3;
}

- (BOOL)hasNumberOfPersonalAutomationsEnabled
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasNumberOfPersonalAutomationsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)setNumberOfPersonalAutomationsEnabled:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_numberOfPersonalAutomationsEnabled = a3;
}

- (BOOL)hasNumberOfWidgetsOnLoL
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasNumberOfWidgetsOnLoL:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)setNumberOfWidgetsOnLoL:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_numberOfWidgetsOnLoL = a3;
}

- (BOOL)hasNumberOfWidgetsOnHomeScreen
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasNumberOfWidgetsOnHomeScreen:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (void)setNumberOfWidgetsOnHomeScreen:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_numberOfWidgetsOnHomeScreen = a3;
}

- (BOOL)hasNumberOfLargeWidgets
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasNumberOfLargeWidgets:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (void)setNumberOfLargeWidgets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_numberOfLargeWidgets = a3;
}

- (BOOL)hasNumberOfMediumWidgets
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasNumberOfMediumWidgets:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (void)setNumberOfMediumWidgets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_numberOfMediumWidgets = a3;
}

- (BOOL)hasNumberOfSmallWidgets
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasNumberOfSmallWidgets:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)setNumberOfSmallWidgets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_numberOfSmallWidgets = a3;
}

- (BOOL)hasSleepShortcutsCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasSleepShortcutsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (void)setSleepShortcutsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_sleepShortcutsCount = a3;
}

- (BOOL)hasWatchShortcutCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasWatchShortcutCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (void)setWatchShortcutCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_watchShortcutCount = a3;
}

- (BOOL)hasAppSessionCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasAppSessionCount:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (void)setAppSessionCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_appSessionCount = a3;
}

- (BOOL)hasShortcutRunCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasShortcutRunCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)setShortcutRunCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_shortcutRunCount = a3;
}

- (BOOL)hasUncategorizedShortcutCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasUncategorizedShortcutCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)setUncategorizedShortcutCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_uncategorizedShortcutCount = a3;
}

- (BOOL)hasAverageShortcutCountPerFolder
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasAverageShortcutCountPerFolder:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (void)setAverageShortcutCountPerFolder:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_averageShortcutCountPerFolder = a3;
}

- (BOOL)hasFolderCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasFolderCount:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (void)setFolderCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_folderCount = a3;
}

- (BOOL)hasShortcutsCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasShortcutsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (void)setShortcutsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_shortcutsCount = a3;
}

- (BOOL)hasSleepEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHasSleepEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (void)setSleepEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_sleepEnabled = a3;
}

- (BOOL)hasAppComplicationSlotsUsed
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasAppComplicationSlotsUsed:(BOOL)a3
{
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)setAppComplicationSlotsUsed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_appComplicationSlotsUsed = a3;
}

- (BOOL)hasShortcutComplicationSlotsUsed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasShortcutComplicationSlotsUsed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (void)setShortcutComplicationSlotsUsed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_shortcutComplicationSlotsUsed = a3;
}

- (BOOL)hasHomeAutomationsEnabled
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHasHomeAutomationsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (void)setHomeAutomationsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_homeAutomationsEnabled = a3;
}

- (BOOL)hasPersonalAutomationsEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasPersonalAutomationsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (void)setPersonalAutomationsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_personalAutomationsEnabled = a3;
}

- (BOOL)hasSharingEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasSharingEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (void)setSharingEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_sharingEnabled = a3;
}

- (BOOL)hasInstalled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasInstalled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C78FFC96DE9D923BD21BCE108E8119F6 has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (void)setInstalled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_installed = a3;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"DailyStatus";
  }
}

@end