@interface TKTonePickerController
+ (id)_latestRedownloadAllTonesDate;
+ (void)_updateLatestRedownloadAllTonesDate;
- (BOOL)_behavesAsRingtonePicker;
- (BOOL)_didSelectToneClassicsPickerItem:(id)a3;
- (BOOL)_enableToneStoreDownloadItemIfAppropriate;
- (BOOL)_isDefaultGroupAtIndexPath:(id)a3;
- (BOOL)_isDividerAtIndexPath:(id)a3;
- (BOOL)_isIgnoreMuteGroupAtIndexPath:(id)a3;
- (BOOL)_isMediaGroupAtIndexPath:(id)a3;
- (BOOL)_isNoneGroupAtIndexPath:(id)a3;
- (BOOL)_isToneStoreGroupAtIndexPath:(id)a3;
- (BOOL)_isVibrationGroupAtIndexPath:(id)a3;
- (BOOL)_showsMedia;
- (BOOL)_showsNoneInSeparateToneGroup;
- (BOOL)canDeleteTonePickerItem:(id)a3;
- (BOOL)canShowStore;
- (BOOL)didSelectTonePickerItem:(id)a3;
- (BOOL)ignoreMute;
- (BOOL)isMediaAtTop;
- (BOOL)isNoneAtTop;
- (BOOL)showsDefault;
- (BOOL)showsIgnoreMute;
- (BOOL)showsNone;
- (BOOL)showsNothingSelected;
- (BOOL)showsToneStore;
- (BOOL)showsVibrations;
- (BOOL)stopPlayingWithFadeOut:(BOOL)a3;
- (NSArray)_classicAlertToneIdentifiers;
- (NSArray)_classicRingtoneIdentifiers;
- (NSIndexPath)_indexPathForDefaultGroup;
- (NSIndexPath)_indexPathForFirstToneGroup;
- (NSIndexPath)_indexPathForMediaGroup;
- (NSIndexPath)_indexPathForNone;
- (NSIndexPath)_indexPathForToneStoreGroup;
- (NSIndexPath)_indexPathForVibrationGroup;
- (NSIndexPath)_selectedToneIndexPath;
- (NSString)_alertTonesPlistName;
- (NSString)_ringtonesPlistName;
- (NSString)defaultToneIdentifier;
- (NSString)noneString;
- (NSString)overrideFirstToneSectionTitle;
- (NSString)selectedToneIdentifier;
- (NSString)selectedVibrationIdentifier;
- (NSString)topic;
- (TKTonePickerController)initWithAlertType:(int64_t)a3;
- (TKTonePickerControllerDelegate)delegate;
- (TKTonePickerItem)_topLevelSelectedTonePickerItem;
- (TKTonePickerItem)selectedTonePickerItem;
- (TLToneManager)_toneManager;
- (TLToneStoreDownloadController)toneStoreDownloadController;
- (id)_annotatedNameForToneIdentifier:(id)a3;
- (id)_cachedPickerItemForSection:(int64_t)a3;
- (id)_cachedPickerRowItemAtIndex:(int64_t)a3 inSectionForItem:(id)a4;
- (id)_footerTextForToneStoreGroup;
- (id)_identifierAtIndexPath:(id)a3 isMediaItem:(BOOL *)a4;
- (id)_identifierOfMediaItemAtIndex:(unint64_t)a3;
- (id)_identifierOfSelectedClassicAlertTone;
- (id)_identifierOfSelectedClassicRingtone;
- (id)_identifierOfToneAtIndexPath:(id)a3;
- (id)_indexPathForIgnoreMuteGroup;
- (id)_indexPathForToneStoreDownloadItem;
- (id)_indexPathForToneWithIdentifier:(id)a3;
- (id)_loadAlertTonesFromPlist;
- (id)_loadRingtonesFromPlist;
- (id)_loadTonesFromPlistNamed:(id)a3;
- (id)_nameForToneIdentifier:(id)a3;
- (id)_nameOfSelectedVibrationIdentifier;
- (id)_pickerRowItemAtIndex:(int64_t)a3 inSectionForItem:(id)a4;
- (id)_platformSpecificAdjustedPlistName:(id)a3;
- (id)_sanitizedSelectedVibrationIdentifierAllowingNilForDefault:(BOOL)a3;
- (id)_selectedIdentifier:(BOOL *)a3;
- (id)_toneClassicsPickerItemAtIndex:(int64_t)a3 withToneIdentifier:(id)a4 belowTonePickerItem:(id)a5;
- (id)pickerItemForSection:(int64_t)a3;
- (int64_t)alertType;
- (int64_t)numberOfSections;
- (int64_t)targetDevice;
- (unint64_t)_indexOfMediaItemWithIdentifier:(id)a3;
- (unint64_t)_mediaItemsCount;
- (unint64_t)_selectedClassicAlertToneIndex;
- (unint64_t)_selectedClassicRingtoneIndex;
- (void)_applyBatchUpdatesWithDeletedPickerRowItems:(id)a3 deletedTonePickerSectionItems:(id)a4 insertedPickerRowItems:(id)a5 insertedTonePickerSectionItems:(id)a6 tonePickerSectionItemsWithUpdatedHeaderText:(id)a7 tonePickerSectionItemsWithUpdatedFooterText:(id)a8;
- (void)_cachePickerRowItem:(id)a3 atIndex:(int64_t)a4 inSectionForItem:(id)a5;
- (void)_cachePickerSectionItem:(id)a3 forSection:(int64_t)a4;
- (void)_didFinishPlayingAlert:(id)a3;
- (void)_didReloadTones;
- (void)_didSelectMediaItemWithIdentifier:(id)a3;
- (void)_didSelectToneWithIdentifier:(id)a3;
- (void)_didUpdateCheckedStatus:(BOOL)a3 ofPickerItemForRowAtIndexPath:(id)a4;
- (void)_didUpdateCheckedStatus:(BOOL)a3 ofToneClassicsPickerItem:(id)a4;
- (void)_didUpdateDetailText:(id)a3 ofPickerItemForRowAtIndexPath:(id)a4;
- (void)_didUpdateFooterTextForToneStoreGroup;
- (void)_didUpdateToneStoreDownloadItem;
- (void)_disableToneStoreDownloadItem;
- (void)_goToStore;
- (void)_handleAlertOverridePolicyDidChangeNotification:(id)a3;
- (void)_invalidatePickerItemCaches;
- (void)_performBatchUpdates:(id)a3 completion:(id)a4;
- (void)_playToneWithIdentifier:(id)a3;
- (void)_redownloadAllTones;
- (void)_registerForUserGeneratedVibrationsDidChangeNotification;
- (void)_reloadMediaItems;
- (void)_reloadStateForBasicBehavior;
- (void)_reloadTones;
- (void)_reloadTonesForExternalChange:(BOOL)a3 shouldSkipDelegateFullReload:(BOOL)a4;
- (void)_resetSelectedClassicAlertToneIndex;
- (void)_resetSelectedClassicRingtoneIndex;
- (void)_resetSelectedVibrationIdentifierForcingUpdatingVibrationName:(BOOL)a3;
- (void)_setBehavesAsRingtonePicker:(BOOL)a3;
- (void)_setClassicAlertToneIdentifiers:(id)a3;
- (void)_setClassicRingtoneIdentifiers:(id)a3;
- (void)_setSelectedClassicAlertToneIndex:(unint64_t)a3;
- (void)_setSelectedClassicRingtoneIndex:(unint64_t)a3;
- (void)_setSelectedToneIdentifier:(id)a3 currentlyReloadingTones:(BOOL)a4;
- (void)_setSelectedToneIndexPath:(id)a3;
- (void)_setSelectedVibrationIdentifier:(id)a3 explicitlySet:(BOOL)a4;
- (void)_setSelectedVibrationIdentifier:(id)a3 forceUpdatingVibrationName:(BOOL)a4 explicitlySet:(BOOL)a5;
- (void)_setToneManager:(id)a3;
- (void)_sortToneIdentifiersArray:(id)a3;
- (void)_togglePlayForToneWithIdentifier:(id)a3;
- (void)_toneManagerContentsChanged:(id)a3;
- (void)_uncachePickerRowItemAtIndex:(int64_t)a3 inSectionForItem:(id)a4;
- (void)_unregisterForUserGeneratedVibrationsDidChangeNotification;
- (void)_updateDetailTextOfVibrationItem;
- (void)dealloc;
- (void)deleteTonePickerItem:(id)a3;
- (void)didFinishCheckingForAvailableToneStoreDownloads:(BOOL)a3;
- (void)finishedWithPicker;
- (void)setDefaultToneIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIgnoreMute:(BOOL)a3;
- (void)setMediaAtTop:(BOOL)a3;
- (void)setNoneAtTop:(BOOL)a3;
- (void)setNoneString:(id)a3;
- (void)setOverrideFirstToneSectionTitle:(id)a3;
- (void)setSelectedToneIdentifier:(id)a3;
- (void)setSelectedVibrationIdentifier:(id)a3;
- (void)setShowsDefault:(BOOL)a3;
- (void)setShowsIgnoreMute:(BOOL)a3;
- (void)setShowsNone:(BOOL)a3;
- (void)setShowsNothingSelected:(BOOL)a3;
- (void)setShowsToneStore:(BOOL)a3;
- (void)setShowsVibrations:(BOOL)a3;
- (void)setTargetDevice:(int64_t)a3;
- (void)setToneStoreDownloadController:(id)a3;
- (void)setTopic:(id)a3;
- (void)storeAccountNameDidChange:(id)a3;
- (void)toneStoreDownloadsDidFinish:(id)a3;
- (void)toneStoreDownloadsDidProgress:(id)a3;
- (void)toneStoreDownloadsDidStart:(id)a3;
@end

@implementation TKTonePickerController

- (TKTonePickerController)initWithAlertType:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)TKTonePickerController;
  v4 = [(TKTonePickerController *)&v18 init];
  v5 = v4;
  if (v4)
  {
    if ((unint64_t)(a3 - 1) > 0x1C)
    {
      v6 = v4;
      v5 = 0;
    }
    else
    {
      v4->_alertType = a3;
      [(TKTonePickerController *)v4 _reloadStateForBasicBehavior];
      v6 = [MEMORY[0x263F7FC90] sharedToneManager];
      [(TKTonePickerController *)v5 _setToneManager:v6];
      v5->_showsDefault = 0;
      v5->_showsToneStore = 0;
      v5->_showsVibrations = 0;
      v7 = [v6 currentToneIdentifierForAlertType:a3];
      uint64_t v8 = [v7 copy];
      defaultToneIdentifier = v5->_defaultToneIdentifier;
      v5->_defaultToneIdentifier = (NSString *)v8;

      v5->_defaultToneIdentifierWasExplicitlySet = 0;
      *(_WORD *)&v5->_showsIgnoreMute = 0;
      v5->_toneStoreDownloadButtonState = 3;
      v10 = [(id)objc_opt_class() _latestRedownloadAllTonesDate];
      if (v10
        && ([MEMORY[0x263EFF910] date],
            v11 = objc_claimAutoreleasedReturnValue(),
            [v11 timeIntervalSinceDate:v10],
            double v13 = v12,
            v11,
            v13 <= 900.0))
      {
        v14 = TLLogToneManagement();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v20 = 15;
          _os_log_impl(&dword_22107E000, v14, OS_LOG_TYPE_DEFAULT, "Keeping redownload all tones functionality disabled for new tone picker because it was last triggered less than %ld minutes ago.", buf, 0xCu);
        }
      }
      else
      {
        v5->_isToneStoreDownloadButtonAllowed = 1;
      }
      [(TKTonePickerController *)v5 _setSelectedClassicAlertToneIndex:0x7FFFFFFFFFFFFFFFLL];
      [(TKTonePickerController *)v5 _setSelectedClassicRingtoneIndex:0x7FFFFFFFFFFFFFFFLL];
      v15 = [(TKTonePickerController *)v5 _indexPathForNone];
      [(TKTonePickerController *)v5 _setSelectedToneIndexPath:v15];

      [(TKTonePickerController *)v5 _resetSelectedVibrationIdentifierForcingUpdatingVibrationName:1];
      [(TKTonePickerController *)v5 _reloadTones];
      v16 = [MEMORY[0x263F08A00] defaultCenter];
      [v16 addObserver:v5 selector:sel__handleAlertOverridePolicyDidChangeNotification_ name:*MEMORY[0x263F7FD88] object:0];
    }
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F7FD88] object:0];
  if (self->_showsVibrations) {
    [(TKTonePickerController *)self _unregisterForUserGeneratedVibrationsDidChangeNotification];
  }
  [(TLToneStoreDownloadController *)self->_toneStoreDownloadController removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TKTonePickerController;
  [(TKTonePickerController *)&v4 dealloc];
}

- (void)setTopic:(id)a3
{
  objc_super v4 = (NSString *)a3;
  if (self->_topic != v4)
  {
    v10 = v4;
    v5 = (NSString *)[(NSString *)v4 copy];
    topic = self->_topic;
    self->_topic = v5;

    if (!self->_defaultToneIdentifierWasExplicitlySet)
    {
      v7 = [(TLToneManager *)self->_toneManager currentToneIdentifierForAlertType:self->_alertType topic:v10];
      uint64_t v8 = (NSString *)[v7 copy];
      defaultToneIdentifier = self->_defaultToneIdentifier;
      self->_defaultToneIdentifier = v8;
    }
    if (!self->_selectedVibrationIdentifierWasExplicitlySet) {
      [(TKTonePickerController *)self _resetSelectedVibrationIdentifierForcingUpdatingVibrationName:0];
    }
    [(TKTonePickerController *)self _reloadStateForBasicBehavior];
    [(TKTonePickerController *)self _reloadTones];
    objc_super v4 = v10;
  }
}

- (void)setDefaultToneIdentifier:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 length];
  v5 = (NSString *)v11;
  if (!v4)
  {
    toneManager = self->_toneManager;
    int64_t alertType = self->_alertType;
    uint64_t v8 = [(TKTonePickerController *)self topic];
    v5 = [(TLToneManager *)toneManager currentToneIdentifierForAlertType:alertType topic:v8];
  }
  if (self->_defaultToneIdentifier != v5)
  {
    v9 = (NSString *)[(NSString *)v5 copy];
    defaultToneIdentifier = self->_defaultToneIdentifier;
    self->_defaultToneIdentifier = v9;

    self->_defaultToneIdentifierWasExplicitlySet = v4 != 0;
    [(TKTonePickerController *)self _reloadTones];
  }
}

- (void)setShowsToneStore:(BOOL)a3
{
  if (self->_showsToneStore != a3)
  {
    BOOL v3 = a3;
    self->_showsToneStore = a3;
    id v9 = [(TKTonePickerController *)self _selectedToneIndexPath];
    if (v9)
    {
      uint64_t v5 = objc_msgSend(v9, "tk_section");
      uint64_t v6 = objc_msgSend(v9, "tk_row");
      if (v5 <= 0) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = -1;
      }
      if (v3) {
        uint64_t v7 = 1;
      }
      uint64_t v8 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", v6, v7 + v5);
      [(TKTonePickerController *)self _setSelectedToneIndexPath:v8];
    }
    [(TKTonePickerController *)self _invalidatePickerItemCaches];
    [(TKTonePickerController *)self _didReloadTones];
  }
}

- (void)setShowsIgnoreMute:(BOOL)a3
{
  if (self->_showsIgnoreMute != a3)
  {
    BOOL v3 = a3;
    self->_showsIgnoreMute = a3;
    id v9 = [(TKTonePickerController *)self _selectedToneIndexPath];
    if (v9)
    {
      uint64_t v5 = objc_msgSend(v9, "tk_section");
      uint64_t v6 = objc_msgSend(v9, "tk_row");
      if (v5 <= 0) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = -1;
      }
      if (v3) {
        uint64_t v7 = 1;
      }
      uint64_t v8 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", v6, v7 + v5);
      [(TKTonePickerController *)self _setSelectedToneIndexPath:v8];
    }
    [(TKTonePickerController *)self _invalidatePickerItemCaches];
    [(TKTonePickerController *)self _didReloadTones];
  }
}

- (void)setIgnoreMute:(BOOL)a3
{
  if (self->_ignoreMute != a3)
  {
    self->_ignoreMute = a3;
    uint64_t v4 = [(TKTonePickerController *)self _indexPathForIgnoreMuteGroup];
    id v8 = v4;
    if (v4)
    {
      uint64_t v5 = -[TKTonePickerController _cachedPickerItemForSection:](self, "_cachedPickerItemForSection:", objc_msgSend(v4, "tk_section"));
      if (v5)
      {
        uint64_t v6 = -[TKTonePickerController _cachedPickerRowItemAtIndex:inSectionForItem:](self, "_cachedPickerRowItemAtIndex:inSectionForItem:", objc_msgSend(v8, "tk_row"), v5);
      }
      else
      {
        uint64_t v6 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [(TKTonePickerController *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v7 tonePickerController:self didUpdateIgnoreMute:self->_ignoreMute forTonePickerItem:v6 atIndexPath:v8];
        }
      }
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
    }
  }
}

- (void)setShowsDefault:(BOOL)a3
{
  if (self->_showsDefault == a3) {
    return;
  }
  BOOL v3 = a3;
  id v13 = [(TKTonePickerController *)self _selectedToneIndexPath];
  BOOL v5 = [(TKTonePickerController *)self _isNoneGroupAtIndexPath:v13];
  BOOL v6 = [(TKTonePickerController *)self _isDefaultGroupAtIndexPath:v13];
  self->_showsDefault = v3;
  if (v3)
  {
    if (v13) {
      int v7 = v5;
    }
    else {
      int v7 = 1;
    }
    if (v7 == 1)
    {
      uint64_t v8 = [(TKTonePickerController *)self _indexPathForDefaultGroup];
LABEL_18:
      double v12 = (void *)v8;
      [(TKTonePickerController *)self _setSelectedToneIndexPath:v8];

      goto LABEL_19;
    }
LABEL_12:
    uint64_t v9 = objc_msgSend(v13, "tk_section");
    uint64_t v10 = objc_msgSend(v13, "tk_row");
    if (v9 <= 0) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = -1;
    }
    if (v3) {
      uint64_t v11 = 1;
    }
    uint64_t v8 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", v10, v11 + v9);
    goto LABEL_18;
  }
  if (v6)
  {
    if (!self->_showsNone)
    {
      [(TKTonePickerController *)self _setSelectedToneIndexPath:0];
      goto LABEL_19;
    }
    uint64_t v8 = [(TKTonePickerController *)self _indexPathForNone];
    goto LABEL_18;
  }
  if (v13) {
    goto LABEL_12;
  }
LABEL_19:
  [(TKTonePickerController *)self _invalidatePickerItemCaches];
  [(TKTonePickerController *)self _didReloadTones];
  if (self->_selectedToneWasExplicitlySetToDefaultTone) {
    [(TKTonePickerController *)self setSelectedToneIdentifier:0];
  }
}

- (void)setShowsNone:(BOOL)a3
{
  if (self->_showsNone != a3)
  {
    BOOL v3 = a3;
    id v7 = [(TKTonePickerController *)self _selectedToneIndexPath];
    BOOL v5 = [(TKTonePickerController *)self _isNoneGroupAtIndexPath:v7];
    self->_showsNone = v3;
    self->_showsNoneWasExplicitlySet = 1;
    if (v7 || !v3)
    {
      if (!v3 && v5) {
        [(TKTonePickerController *)self _setSelectedToneIndexPath:0];
      }
    }
    else
    {
      BOOL v6 = [(TKTonePickerController *)self _indexPathForNone];
      [(TKTonePickerController *)self _setSelectedToneIndexPath:v6];
    }
    [(TKTonePickerController *)self _reloadTones];
  }
}

- (void)setNoneAtTop:(BOOL)a3
{
  if (self->_noneAtTop != a3)
  {
    id v8 = [(TKTonePickerController *)self _selectedToneIndexPath];
    BOOL v5 = [(TKTonePickerController *)self _isNoneGroupAtIndexPath:v8];
    self->_noneAtTop = a3;
    if (v8 || !self->_showsNone)
    {
      if (!self->_showsNone && v5) {
        [(TKTonePickerController *)self _setSelectedToneIndexPath:0];
      }
    }
    else
    {
      BOOL v6 = [(TKTonePickerController *)self _indexPathForNone];
      [(TKTonePickerController *)self _setSelectedToneIndexPath:v6];
    }
    [(TKTonePickerController *)self _reloadTones];
  }
}

- (void)setNoneString:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  noneString = self->_noneString;
  if (noneString != v4)
  {
    id v8 = v4;
    if (![(NSString *)noneString isEqualToString:v4])
    {
      BOOL v6 = (NSString *)[(NSString *)v8 copy];
      id v7 = self->_noneString;
      self->_noneString = v6;

      [(TKTonePickerController *)self _invalidatePickerItemCaches];
      [(TKTonePickerController *)self _didReloadTones];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)setShowsNothingSelected:(BOOL)a3
{
  if (self->_showsNothingSelected != a3)
  {
    self->_showsNothingSelected = a3;
    [(TKTonePickerController *)self _invalidatePickerItemCaches];
    [(TKTonePickerController *)self _didReloadTones];
  }
}

- (void)setTargetDevice:(int64_t)a3
{
  if (self->_targetDevice != a3)
  {
    self->_targetDevice = a3;
    [(TKTonePickerController *)self _reloadTones];
  }
}

- (int64_t)numberOfSections
{
  unint64_t v3 = self->_showsVibrations
     + (unint64_t)self->_showsIgnoreMute
     + self->_showsToneStore
     + (unint64_t)self->_showsDefault;
  unint64_t v4 = [(NSMutableArray *)self->_toneGroupLists count] + v3;
  if (self->_showsNone) {
    v4 += [(TKTonePickerController *)self isNoneAtTop] ^ 1;
  }
  return v4 + [(TKTonePickerController *)self _showsMedia];
}

- (id)pickerItemForSection:(int64_t)a3
{
  -[TKTonePickerController _cachedPickerItemForSection:](self, "_cachedPickerItemForSection:");
  BOOL v5 = (TKTonePickerSectionItem *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (self->_showsIgnoreMute
      && ([(TKTonePickerController *)self _indexPathForIgnoreMuteGroup],
          BOOL v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = objc_msgSend(v6, "tk_section"),
          v6,
          v7 == a3))
    {
      id v8 = TLLocalizedString();
      uint64_t v9 = 0;
    }
    else
    {
      if (!self->_showsVibrations
        || ([(TKTonePickerController *)self _indexPathForVibrationGroup],
            uint64_t v10 = objc_claimAutoreleasedReturnValue(),
            uint64_t v11 = objc_msgSend(v10, "tk_section"),
            v10,
            v11 != a3))
      {
        if (self->_showsToneStore)
        {
          v15 = [(TKTonePickerController *)self _indexPathForToneStoreGroup];
          uint64_t v16 = objc_msgSend(v15, "tk_section");

          if (v16 == a3)
          {
            if (self->_toneStoreDownloadButtonState == 3) {
              unint64_t v14 = 1;
            }
            else {
              unint64_t v14 = 2;
            }
            uint64_t v9 = TLLocalizedString();
            id v8 = [(TKTonePickerController *)self _footerTextForToneStoreGroup];
            int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v12 = 4;
            goto LABEL_32;
          }
        }
        if (self->_showsDefault)
        {
          v17 = [(TKTonePickerController *)self _indexPathForDefaultGroup];
          uint64_t v18 = objc_msgSend(v17, "tk_section");

          if (v18 == a3)
          {
            uint64_t v9 = TLLocalizedString();
            id v8 = 0;
            int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
            unint64_t v14 = 1;
            uint64_t v12 = 1;
            goto LABEL_32;
          }
        }
        if (!self->_showsNone
          || [(TKTonePickerController *)self isNoneAtTop]
          || ([(TKTonePickerController *)self _indexPathForNone],
              v19 = objc_claimAutoreleasedReturnValue(),
              uint64_t v20 = objc_msgSend(v19, "tk_section"),
              v19,
              v20 != a3))
        {
          if ([(TKTonePickerController *)self _showsMedia]
            && ([(TKTonePickerController *)self _indexPathForMediaGroup],
                uint64_t v21 = objc_claimAutoreleasedReturnValue(),
                uint64_t v22 = objc_msgSend(v21, "tk_section"),
                v21,
                v22 == a3))
          {
            unint64_t v14 = [(TKTonePickerController *)self _mediaItemsCount] + 1;
            uint64_t v9 = TLLocalizedString();
            id v8 = 0;
            int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v12 = 3;
          }
          else
          {
            v23 = [(TKTonePickerController *)self _indexPathForFirstToneGroup];

            if (!v23
              || ([(TKTonePickerController *)self _indexPathForFirstToneGroup],
                  v24 = objc_claimAutoreleasedReturnValue(),
                  int64_t v13 = a3 - objc_msgSend(v24, "tk_section"),
                  v24,
                  v13 < 0)
              || v13 >= [(NSMutableArray *)self->_toneGroupLists count]
              || v13 >= [(NSMutableArray *)self->_toneGroupNames count])
            {
              uint64_t v9 = 0;
              id v8 = 0;
              unint64_t v14 = 0;
              uint64_t v12 = 0;
              int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else
            {
              v25 = [(NSMutableArray *)self->_toneGroupLists objectAtIndex:v13];
              unint64_t v14 = [v25 count];

              uint64_t v9 = [(NSMutableArray *)self->_toneGroupNames objectAtIndex:v13];
              if (![v9 length])
              {

                uint64_t v9 = 0;
              }
              id v8 = 0;
              uint64_t v12 = 2;
            }
          }
          goto LABEL_32;
        }
      }
      uint64_t v9 = 0;
      id v8 = 0;
    }
    uint64_t v12 = 0;
    int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v14 = 1;
LABEL_32:
    BOOL v5 = objc_alloc_init(TKTonePickerSectionItem);
    [(TKPickerSectionItem *)v5 _setText:v9];
    [(TKPickerSectionItem *)v5 _setFooterText:v8];
    [(TKTonePickerSectionItem *)v5 _setNumberOfChildren:v14];
    [(TKPickerItem *)v5 _setSection:a3];
    [(TKTonePickerSectionItem *)v5 _setSectionHeader:v12];
    [(TKTonePickerSectionItem *)v5 _setRegularToneSectionIndex:v13];
    [(TKTonePickerSectionItem *)v5 _setParentTonePickerController:self];
    [(TKTonePickerController *)self _cachePickerSectionItem:v5 forSection:a3];
  }

  return v5;
}

- (id)_pickerRowItemAtIndex:(int64_t)a3 inSectionForItem:(id)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(TKTonePickerController *)self _cachedPickerRowItemAtIndex:a3 inSectionForItem:v6];
  if (!v7)
  {
    id v8 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", a3, objc_msgSend(v6, "section"));
    v63 = self;
    if ([(TKTonePickerController *)self _isDividerAtIndexPath:v8])
    {
      uint64_t v9 = objc_alloc_init(TKPickerDividerItem);
      -[TKPickerItem _setSection:](v9, "_setSection:", objc_msgSend(v8, "tk_section"));
      v64 = v9;
      -[TKPickerRowItem _setRow:](v9, "_setRow:", objc_msgSend(v8, "tk_row"));
      uint64_t v10 = 0;
      uint64_t v59 = 0;
      uint64_t v60 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v61 = 0;
      v62 = 0;
      uint64_t v13 = 0;
      int v14 = 0;
      uint64_t v15 = 1;
LABEL_43:
      id v32 = v6;
      int64_t v33 = a3;
      if ([(TKTonePickerController *)self showsNothingSelected])
      {
        v34 = v8;
        uint64_t v35 = 0;
      }
      else
      {
        [(TKTonePickerController *)self _selectedToneIndexPath];
        v36 = v11;
        v38 = v37 = v12;
        v34 = v8;
        uint64_t v35 = [v38 isEqual:v8];

        uint64_t v12 = v37;
        uint64_t v11 = v36;
      }
      [(TKPickerSelectableItem *)v10 _setShowsCheckmark:v35];
      [(TKTonePickerItem *)v10 _setItemKind:v13];
      [(TKPickerSelectableItem *)v10 _setShowsDisclosureIndicator:v61];
      [(TKTonePickerItem *)v10 _setNeedsRoomForCheckmark:v15];
      [(TKTonePickerItem *)v10 _setNeedsActivityIndicator:v59];
      [(TKTonePickerItem *)v10 _setNeedsDownloadProgress:HIDWORD(v59)];
      LODWORD(v39) = v14;
      [(TKTonePickerItem *)v10 _setDownloadProgress:v39];
      [(TKPickerSelectableItem *)v10 _setShouldTintText:v60];
      [(TKPickerSelectableItem *)v10 _setShouldPreventSelection:HIDWORD(v60)];
      [(TKPickerSelectableItem *)v10 _setText:v62];
      [(TKPickerSelectableItem *)v10 _setDetailText:v12];
      if ([v11 count])
      {
        v40 = v12;
        id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
        v65[0] = MEMORY[0x263EF8330];
        v65[1] = 3221225472;
        v65[2] = __65__TKTonePickerController__pickerRowItemAtIndex_inSectionForItem___block_invoke;
        v65[3] = &unk_264589840;
        v42 = v63;
        v65[4] = v63;
        v66 = v10;
        id v67 = v41;
        id v43 = v41;
        [v11 enumerateObjectsUsingBlock:v65];
        v44 = (void *)[v43 copy];

        uint64_t v12 = v40;
      }
      else
      {
        v44 = 0;
        v42 = v63;
      }
      [(TKTonePickerItem *)v10 _setChildrenToneClassicsPickerItems:v44];
      v45 = v42;
      uint64_t v7 = v64;
      int64_t v46 = v33;
      id v6 = v32;
      [(TKTonePickerController *)v45 _cachePickerRowItem:v64 atIndex:v46 inSectionForItem:v32];

      goto LABEL_50;
    }
    uint64_t v16 = objc_alloc_init(TKTonePickerItem);
    -[TKPickerItem _setSection:](v16, "_setSection:", objc_msgSend(v8, "tk_section"));
    -[TKPickerRowItem _setRow:](v16, "_setRow:", objc_msgSend(v8, "tk_row"));
    [(TKTonePickerItem *)v16 _setParentSectionItem:v6];
    uint64_t v10 = v16;
    v64 = (TKPickerDividerItem *)v10;
    if ([(TKTonePickerController *)self _isIgnoreMuteGroupAtIndexPath:v8])
    {
      TLLocalizedString();
      v62 = uint64_t v61 = 0;
      uint64_t v59 = 0;
      uint64_t v15 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      int v14 = 0;
      uint64_t v60 = 0x100000000;
      uint64_t v13 = 3;
      goto LABEL_43;
    }
    if ([(TKTonePickerController *)self _isVibrationGroupAtIndexPath:v8])
    {
      uint64_t v12 = [(TKTonePickerController *)self _nameOfSelectedVibrationIdentifier];
      TLLocalizedString();
      uint64_t v59 = 0;
      uint64_t v60 = 0;
      uint64_t v15 = 0;
      uint64_t v11 = 0;
      uint64_t v13 = 0;
      v62 = uint64_t v61 = 1;
      int v14 = 0;
LABEL_42:
      uint64_t v10 = (TKTonePickerItem *)v64;
      goto LABEL_43;
    }
    if ([(TKTonePickerController *)self _isToneStoreGroupAtIndexPath:v8])
    {
      int v14 = 0;
      if (a3 == 1)
      {
        switch(self->_toneStoreDownloadButtonState)
        {
          case 0:
            goto LABEL_11;
          case 1:
          case 2:
            TLLocalizedString();
            v62 = uint64_t v61 = 0;
            uint64_t v60 = 0x100000000;
            uint64_t v15 = 0;
            uint64_t v11 = 0;
            uint64_t v12 = 0;
            uint64_t v13 = 0;
            uint64_t v59 = 1;
            break;
          case 3:
            v62 = TLLocalizedString();
            uint64_t v60 = 0;
            LODWORD(v59) = 0;
            uint64_t v15 = 0;
            uint64_t v11 = 0;
            uint64_t v12 = 0;
            goto LABEL_23;
          default:
            goto LABEL_22;
        }
        goto LABEL_43;
      }
      if (a3)
      {
LABEL_22:
        uint64_t v60 = 0;
        LODWORD(v59) = 0;
        uint64_t v15 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        v62 = 0;
LABEL_23:
        HIDWORD(v59) = 0;
        uint64_t v61 = 0;
        uint64_t v13 = 0;
      }
      else
      {
LABEL_11:
        TLLocalizedString();
        v62 = uint64_t v61 = 0;
        uint64_t v59 = 0;
        uint64_t v15 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v60 = 1;
      }
      goto LABEL_42;
    }
    if ([(TKTonePickerController *)self _isDefaultGroupAtIndexPath:v8])
    {
      v17 = [(TKTonePickerController *)self defaultToneIdentifier];
      if (!v17)
      {
        uint64_t v18 = v8;
        v19 = TLLogGeneral();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);

        if (v20)
        {
          uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m"];
          uint64_t v22 = TLLogGeneral();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = [v21 lastPathComponent];
            v24 = [MEMORY[0x263F08B88] callStackSymbols];
            *(_DWORD *)buf = 136381443;
            v69 = "-[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]";
            __int16 v70 = 2113;
            v71 = v23;
            __int16 v72 = 2049;
            uint64_t v73 = 585;
            __int16 v74 = 2113;
            v75 = v24;
            _os_log_impl(&dword_22107E000, v22, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

            self = v63;
          }
        }
        else
        {
          uint64_t v21 = TLLogGeneral();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
          }
        }
        id v8 = v18;

        v31 = TLLogGeneral();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
        }
      }
      id v26 = [(TKTonePickerController *)self _nameForToneIdentifier:v17];
    }
    else if ([(TKTonePickerController *)self _isNoneGroupAtIndexPath:v8])
    {
      v25 = [(TKTonePickerController *)self noneString];
      v17 = v25;
      if (v25)
      {
        id v26 = v25;
      }
      else
      {
        TLLocalizedString();
        id v26 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (![(TKTonePickerController *)self _isMediaGroupAtIndexPath:v8])
      {
        v28 = [(TKTonePickerController *)self _identifierOfToneAtIndexPath:v8];
        if (![v28 length] && !self->_showsDefault)
        {
          uint64_t v29 = [(TKTonePickerController *)self defaultToneIdentifier];

          v28 = (void *)v29;
        }
        if ([v28 isEqualToString:@"<classic_alert_tone_identifier>"])
        {
          uint64_t v30 = TLLocalizedString();
          uint64_t v11 = [(TKTonePickerController *)self _classicAlertToneIdentifiers];
          if ([(TKTonePickerController *)self _selectedClassicAlertToneIndex] == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v12 = 0;
          }
          else
          {
            [(TKTonePickerController *)self selectedToneIdentifier];
            v49 = v48 = v8;
            uint64_t v50 = [(TKTonePickerController *)self _nameForToneIdentifier:v49];

            id v8 = v48;
            uint64_t v12 = (void *)v50;
            self = v63;
          }
          uint64_t v61 = 1;
          uint64_t v13 = 2;
        }
        else if ([v28 isEqualToString:@"<classic_ringtone_identifier>"])
        {
          uint64_t v30 = TLLocalizedString();
          uint64_t v11 = [(TKTonePickerController *)self _classicRingtoneIdentifiers];
          if ([(TKTonePickerController *)self _selectedClassicRingtoneIndex] == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v12 = 0;
            uint64_t v61 = 1;
            uint64_t v13 = 1;
          }
          else
          {
            [(TKTonePickerController *)self selectedToneIdentifier];
            v52 = v51 = v8;
            uint64_t v53 = [(TKTonePickerController *)self _nameForToneIdentifier:v52];

            id v8 = v51;
            uint64_t v12 = (void *)v53;
            self = v63;
            uint64_t v13 = 1;
            uint64_t v61 = 1;
          }
        }
        else
        {
          uint64_t v30 = [(TKTonePickerController *)self _annotatedNameForToneIdentifier:v28];
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          uint64_t v61 = 0;
          uint64_t v13 = 0;
        }
        v54 = [(NSMutableDictionary *)self->_activeToneStoreDownloadsByIdentifier objectForKey:v28];
        v55 = self;
        v56 = v54;
        v62 = (void *)v30;
        if (v54)
        {
          [v54 downloadProgress];
          int v14 = v57;
          HIDWORD(v59) = 1;
        }
        else
        {
          v58 = [(NSMutableDictionary *)v55->_finishedToneStoreDownloadsByIdentifier objectForKey:v28];
          HIDWORD(v59) = v58 != 0;

          int v14 = 0;
        }

        uint64_t v60 = 0;
        LODWORD(v59) = 0;
        uint64_t v15 = 1;
        self = v63;
        uint64_t v10 = (TKTonePickerItem *)v64;
        goto LABEL_43;
      }
      uint64_t v27 = [(TKTonePickerController *)self _mediaItemsCount];
      if (objc_msgSend(v8, "tk_row") >= v27)
      {
        TLLocalizedString();
        uint64_t v59 = 0;
        uint64_t v60 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        int v14 = 0;
        uint64_t v15 = 1;
        uint64_t v10 = (TKTonePickerItem *)v64;
        v62 = uint64_t v61 = 1;
        goto LABEL_43;
      }
      v17 = [(TKTonePickerController *)self delegate];
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v62 = 0;
        goto LABEL_41;
      }
      objc_msgSend(v17, "tonePickerController:titleOfMediaItemAtIndex:", self, objc_msgSend(v8, "tk_row"));
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v62 = v26;
LABEL_41:

    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v61 = 0;
    uint64_t v13 = 0;
    int v14 = 0;
    uint64_t v15 = 1;
    goto LABEL_42;
  }
LABEL_50:

  return v7;
}

void __65__TKTonePickerController__pickerRowItemAtIndex_inSectionForItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(a1 + 32) _toneClassicsPickerItemAtIndex:a3 withToneIdentifier:a2 belowTonePickerItem:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObject:v4];
}

- (id)_toneClassicsPickerItemAtIndex:(int64_t)a3 withToneIdentifier:(id)a4 belowTonePickerItem:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 itemKind];
  if (v10 == 2)
  {
    unint64_t v11 = [(TKTonePickerController *)self _selectedClassicAlertToneIndex];
    goto LABEL_5;
  }
  if (v10 == 1)
  {
    unint64_t v11 = [(TKTonePickerController *)self _selectedClassicRingtoneIndex];
LABEL_5:
    uint64_t v12 = v11;
    goto LABEL_7;
  }
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_7:
  uint64_t v13 = [(TKTonePickerController *)self _annotatedNameForToneIdentifier:v8];
  int v14 = objc_alloc_init(TKToneClassicsPickerItem);
  [(TKTonePickerItem *)v14 _setItemKind:0];
  [(TKPickerSelectableItem *)v14 _setText:v13];
  [(TKPickerSelectableItem *)v14 _setShowsCheckmark:v12 == a3];
  [(TKTonePickerItem *)v14 _setNeedsRoomForCheckmark:1];
  -[TKPickerItem _setSection:](v14, "_setSection:", [v9 section]);
  -[TKPickerRowItem _setRow:](v14, "_setRow:", [v9 row]);
  [(TKToneClassicsPickerItem *)v14 _setClassicToneIndex:a3];
  [(TKToneClassicsPickerItem *)v14 _setParentItem:v9];

  return v14;
}

- (id)_cachedPickerItemForSection:(int64_t)a3
{
  if ([(NSMutableArray *)self->_cachedPickerSectionItems count] <= (unint64_t)a3)
  {
    id v6 = 0;
  }
  else
  {
    BOOL v5 = [(NSMutableArray *)self->_cachedPickerSectionItems objectAtIndex:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }

  return v6;
}

- (void)_cachePickerSectionItem:(id)a3 forSection:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v11 = v6;
    cachedPickerSectionItems = self->_cachedPickerSectionItems;
    if (!cachedPickerSectionItems)
    {
      id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      id v9 = self->_cachedPickerSectionItems;
      self->_cachedPickerSectionItems = v8;

      cachedPickerSectionItems = self->_cachedPickerSectionItems;
    }
    [(NSMutableArray *)cachedPickerSectionItems tk_ensureHasItemsOrNullUpToIndex:a4];
    uint64_t v10 = [(NSMutableArray *)self->_cachedPickerSectionItems objectAtIndex:a4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v10 _setParentTonePickerController:0];
    }
    [(NSMutableArray *)self->_cachedPickerSectionItems replaceObjectAtIndex:a4 withObject:v11];

    id v6 = v11;
  }
}

- (id)_cachedPickerRowItemAtIndex:(int64_t)a3 inSectionForItem:(id)a4
{
  unint64_t v6 = [a4 section];
  if (v6 >= [(NSMutableArray *)self->_cachedPickerRowItems count])
  {
    id v9 = 0;
  }
  else
  {
    id v7 = [(NSMutableArray *)self->_cachedPickerRowItems objectAtIndex:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      if ([v8 count] <= (unint64_t)a3)
      {
        id v9 = 0;
        id v7 = v8;
      }
      else
      {
        id v7 = [v8 objectAtIndex:a3];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = v7;
          id v9 = v7;
        }
        else
        {
          id v9 = 0;
        }
      }
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (void)_cachePickerRowItem:(id)a3 atIndex:(int64_t)a4 inSectionForItem:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  if (!v14) {
    goto LABEL_13;
  }
  if (!self->_cachedPickerRowItems)
  {
    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    cachedPickerRowItems = self->_cachedPickerRowItems;
    self->_cachedPickerRowItems = v9;
  }
  unint64_t v11 = [v8 section];
  if (v11 >= [(NSMutableArray *)self->_cachedPickerRowItems count]) {
    goto LABEL_9;
  }
  id v12 = [(NSMutableArray *)self->_cachedPickerRowItems objectAtIndex:v11];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_9:
    [(NSMutableArray *)self->_cachedPickerRowItems tk_ensureHasItemsOrNullUpToIndex:v11];
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(NSMutableArray *)self->_cachedPickerRowItems replaceObjectAtIndex:v11 withObject:v12];
    goto LABEL_10;
  }
  if (!v12) {
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(v12, "tk_ensureHasItemsOrNullUpToIndex:", a4);
  uint64_t v13 = [v12 objectAtIndex:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v13 _setParentSectionItem:0];
  }
  [v12 replaceObjectAtIndex:a4 withObject:v14];

LABEL_13:
}

- (void)_uncachePickerRowItemAtIndex:(int64_t)a3 inSectionForItem:(id)a4
{
  unint64_t v6 = [a4 section];
  if (v6 >= [(NSMutableArray *)self->_cachedPickerRowItems count])
  {
    id v7 = 0;
    goto LABEL_12;
  }
  id v10 = [(NSMutableArray *)self->_cachedPickerRowItems objectAtIndex:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    if (!v10) {
      goto LABEL_12;
    }
    if ([v10 count] <= (unint64_t)a3) {
      goto LABEL_11;
    }
    id v8 = [v10 objectAtIndex:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 _setParentSectionItem:0];
    }
    id v9 = [MEMORY[0x263EFF9D0] null];
    [v10 replaceObjectAtIndex:a3 withObject:v9];
  }
  else
  {
    id v8 = v10;
    id v10 = 0;
  }

LABEL_11:
  id v7 = v10;
LABEL_12:
}

- (void)_invalidatePickerItemCaches
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v3 = self->_cachedPickerSectionItems;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v32 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 _setParentTonePickerController:0];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v5);
  }

  cachedPickerSectionItems = self->_cachedPickerSectionItems;
  self->_cachedPickerSectionItems = 0;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v22 = self;
  obj = self->_cachedPickerRowItems;
  uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v36 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v25;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v25 != v18) {
                  objc_enumerationMutation(v15);
                }
                BOOL v20 = *(void **)(*((void *)&v24 + 1) + 8 * v19);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v20 _setParentSectionItem:0];
                }
                ++v19;
              }
              while (v17 != v19);
              uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v36 count:16];
            }
            while (v17);
          }
        }
        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v11);
  }

  cachedPickerRowItems = v22->_cachedPickerRowItems;
  v22->_cachedPickerRowItems = 0;
}

- (id)_indexPathForIgnoreMuteGroup
{
  if (self->_showsIgnoreMute)
  {
    v2 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", 0, 0);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (NSIndexPath)_indexPathForVibrationGroup
{
  if (self->_showsVibrations)
  {
    v2 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", 0, self->_showsIgnoreMute);
  }
  else
  {
    v2 = 0;
  }

  return (NSIndexPath *)v2;
}

- (NSIndexPath)_indexPathForToneStoreGroup
{
  if (self->_showsToneStore)
  {
    v2 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", 0, self->_showsVibrations + (unint64_t)self->_showsIgnoreMute);
  }
  else
  {
    v2 = 0;
  }

  return (NSIndexPath *)v2;
}

- (id)_indexPathForToneStoreDownloadItem
{
  v2 = [(TKTonePickerController *)self _indexPathForToneStoreGroup];
  if (v2)
  {
    unint64_t v3 = v2;
    uint64_t v4 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", 1, objc_msgSend(v2, "tk_section"));
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (NSIndexPath)_indexPathForDefaultGroup
{
  if (self->_showsDefault)
  {
    v2 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", 0, self->_showsVibrations + (unint64_t)self->_showsIgnoreMute + self->_showsToneStore);
  }
  else
  {
    v2 = 0;
  }

  return (NSIndexPath *)v2;
}

- (NSIndexPath)_indexPathForFirstToneGroup
{
  unint64_t v3 = (void *)[(NSMutableArray *)self->_toneGroupLists count];
  if (v3)
  {
    unint64_t v4 = self->_showsVibrations
       + (unint64_t)self->_showsIgnoreMute
       + self->_showsToneStore
       + (unint64_t)self->_showsDefault;
    if ([(TKTonePickerController *)self _showsMedia]) {
      v4 += [(TKTonePickerController *)self _isMediaAtTop];
    }
    unint64_t v3 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", 0, v4);
  }

  return (NSIndexPath *)v3;
}

- (NSIndexPath)_indexPathForMediaGroup
{
  if ([(TKTonePickerController *)self _showsMedia])
  {
    unint64_t v3 = self->_showsVibrations + (unint64_t)self->_showsIgnoreMute + self->_showsToneStore;
    if (![(TKTonePickerController *)self _isMediaAtTop]) {
      v3 += [(NSMutableArray *)self->_toneGroupLists count] + self->_showsDefault;
    }
    unint64_t v4 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", 0, v3);
  }
  else
  {
    unint64_t v4 = 0;
  }

  return (NSIndexPath *)v4;
}

- (NSIndexPath)_indexPathForNone
{
  if (self->_showsNone && ![(TKTonePickerController *)self isNoneAtTop])
  {
    unint64_t v4 = [(NSMutableArray *)self->_toneGroupLists count]
       + self->_showsIgnoreMute
       + (unint64_t)self->_showsVibrations
       + self->_showsToneStore
       + (unint64_t)self->_showsDefault;
    BOOL v5 = [(TKTonePickerController *)self _showsMedia];
    unint64_t v3 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", 0, v4 + v5);
  }
  else
  {
    unint64_t v3 = [(TKTonePickerController *)self _indexPathForToneWithIdentifier:*MEMORY[0x263F7FD70]];
  }

  return (NSIndexPath *)v3;
}

- (BOOL)_isIgnoreMuteGroupAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  BOOL v6 = 0;
  if (v4 && self->_showsIgnoreMute)
  {
    if (objc_msgSend(v4, "tk_row")) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = objc_msgSend(v5, "tk_section") == 0;
    }
  }

  return v6;
}

- (BOOL)_isVibrationGroupAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  BOOL v6 = 0;
  if (v4 && self->_showsVibrations)
  {
    uint64_t showsIgnoreMute = self->_showsIgnoreMute;
    if (objc_msgSend(v4, "tk_row")) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = objc_msgSend(v5, "tk_section") == showsIgnoreMute;
    }
  }

  return v6;
}

- (BOOL)_isToneStoreGroupAtIndexPath:(id)a3
{
  BOOL result = 0;
  if (a3)
  {
    if (self->_showsToneStore)
    {
      unint64_t v5 = self->_showsVibrations + (unint64_t)self->_showsIgnoreMute;
      return objc_msgSend(a3, "tk_section") == v5;
    }
  }
  return result;
}

- (BOOL)_isDefaultGroupAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  BOOL v6 = 0;
  if (v4 && self->_showsDefault)
  {
    BOOL showsIgnoreMute = self->_showsIgnoreMute;
    BOOL showsVibrations = self->_showsVibrations;
    BOOL showsToneStore = self->_showsToneStore;
    if (objc_msgSend(v4, "tk_row")) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = objc_msgSend(v5, "tk_section") == showsVibrations + showsIgnoreMute + showsToneStore;
    }
  }

  return v6;
}

- (BOOL)_isNoneGroupAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_showsNone)
  {
LABEL_5:
    BOOL v6 = 0;
    goto LABEL_6;
  }
  BOOL v5 = [(TKTonePickerController *)self isNoneAtTop];
  BOOL v6 = 0;
  if (v4 && !v5)
  {
    uint64_t v7 = [(NSMutableArray *)self->_toneGroupLists count];
    BOOL showsIgnoreMute = self->_showsIgnoreMute;
    BOOL showsVibrations = self->_showsVibrations;
    BOOL showsToneStore = self->_showsToneStore;
    BOOL showsDefault = self->_showsDefault;
    BOOL v12 = [(TKTonePickerController *)self _showsMedia];
    if (!objc_msgSend(v4, "tk_row"))
    {
      BOOL v6 = objc_msgSend(v4, "tk_section") == v7
                                           + showsIgnoreMute
                                           + showsVibrations
                                           + showsToneStore
                                           + showsDefault
                                           + v12;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (BOOL)_isMediaGroupAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TKTonePickerController *)self _showsMedia];
  BOOL v6 = 0;
  if (v4 && v5)
  {
    unint64_t v7 = self->_showsVibrations + (unint64_t)self->_showsIgnoreMute + self->_showsToneStore;
    if (![(TKTonePickerController *)self _isMediaAtTop]) {
      v7 += [(NSMutableArray *)self->_toneGroupLists count] + self->_showsDefault;
    }
    BOOL v6 = objc_msgSend(v4, "tk_section") == v7;
  }

  return v6;
}

- (BOOL)_isDividerAtIndexPath:(id)a3
{
  unint64_t v3 = [(TKTonePickerController *)self _identifierOfToneAtIndexPath:a3];
  char v4 = [v3 isEqualToString:&stru_26D2E1860];

  return v4;
}

- (id)_indexPathForToneWithIdentifier:(id)a3
{
  id v4 = a3;
  if (![(NSMutableArray *)self->_toneGroupLists count]) {
    goto LABEL_19;
  }
  uint64_t v5 = 0;
  while (1)
  {
    BOOL v6 = [(NSMutableArray *)self->_toneGroupLists objectAtIndex:v5];
    uint64_t v7 = [v6 indexOfObject:v4];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    if ([v6 indexOfObject:@"<classic_alert_tone_identifier>"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = [(TKTonePickerController *)self _classicAlertToneIdentifiers];
      uint64_t v9 = [v8 indexOfObject:v4];

      if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_12;
      }
    }
    if ([v6 indexOfObject:@"<classic_ringtone_identifier>"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [(TKTonePickerController *)self _classicRingtoneIdentifiers];
      uint64_t v11 = [v10 indexOfObject:v4];

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_12:
        BOOL showsIgnoreMute = self->_showsIgnoreMute;
        BOOL showsVibrations = self->_showsVibrations;
        BOOL showsToneStore = self->_showsToneStore;
        if ([(TKTonePickerController *)self _showsMedia])
        {
          BOOL v21 = showsIgnoreMute + [(TKTonePickerController *)self _isMediaAtTop];
          uint64_t v22 = showsVibrations + showsToneStore + v5;
        }
        else
        {
          BOOL v21 = showsIgnoreMute + showsVibrations;
          uint64_t v22 = showsToneStore + v5;
        }
        BOOL v26 = v21 + v22 + self->_showsDefault;
        long long v27 = (void *)MEMORY[0x263F088C8];
        uint64_t v25 = [v6 count] - 1;
        long long v24 = v27;
        BOOL v23 = v26;
        goto LABEL_18;
      }
    }

    if (++v5 >= (unint64_t)[(NSMutableArray *)self->_toneGroupLists count]) {
      goto LABEL_19;
    }
  }
  uint64_t v12 = v7;
  BOOL v13 = self->_showsIgnoreMute;
  BOOL v14 = self->_showsVibrations;
  BOOL v15 = self->_showsToneStore;
  if ([(TKTonePickerController *)self _showsMedia])
  {
    BOOL v16 = v13 + [(TKTonePickerController *)self _isMediaAtTop];
    uint64_t v17 = v14 + v15 + v5;
  }
  else
  {
    BOOL v16 = v13 + v14;
    uint64_t v17 = v15 + v5;
  }
  BOOL v23 = v16 + v17 + self->_showsDefault;
  long long v24 = (void *)MEMORY[0x263F088C8];
  uint64_t v25 = v12;
LABEL_18:
  long long v28 = objc_msgSend(v24, "tk_indexPathForRow:inSection:", v25, v23);

  if (!v28)
  {
LABEL_19:
    if ([(TKTonePickerController *)self _showsMedia]
      && (unint64_t v29 = [(TKTonePickerController *)self _indexOfMediaItemWithIdentifier:v4],
          v29 != 0x7FFFFFFFFFFFFFFFLL))
    {
      unint64_t v30 = v29;
      long long v31 = (void *)MEMORY[0x263F088C8];
      long long v32 = [(TKTonePickerController *)self _indexPathForMediaGroup];
      long long v28 = objc_msgSend(v31, "tk_indexPathForRow:inSection:", v30, objc_msgSend(v32, "tk_section"));
    }
    else
    {
      long long v28 = 0;
    }
  }

  return v28;
}

- (id)_identifierOfToneAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!v4 || [(TKTonePickerController *)self _isDefaultGroupAtIndexPath:v4])
  {
LABEL_3:
    id v5 = 0;
    goto LABEL_4;
  }
  if ([(TKTonePickerController *)self _isNoneGroupAtIndexPath:v4])
  {
    id v5 = (id)*MEMORY[0x263F7FD70];
  }
  else
  {
    uint64_t v7 = objc_msgSend(v4, "tk_section");
    uint64_t v8 = objc_msgSend(v4, "tk_row");
    if ([(TKTonePickerController *)self _showsMedia]) {
      v7 -= [(TKTonePickerController *)self _isMediaAtTop];
    }
    uint64_t v9 = v7 - self->_showsIgnoreMute - self->_showsVibrations - self->_showsToneStore - self->_showsDefault;
    if (v9 < 0 || v9 >= [(NSMutableArray *)self->_toneGroupLists count]) {
      goto LABEL_3;
    }
    uint64_t v10 = [(NSMutableArray *)self->_toneGroupLists objectAtIndex:v9];
    uint64_t v11 = v10;
    if (v8 < 0 || v8 >= [v10 count])
    {
      id v5 = 0;
    }
    else
    {
      id v5 = [v11 objectAtIndex:v8];
      if (!self->_showsDefault)
      {
        uint64_t v12 = [(TKTonePickerController *)self defaultToneIdentifier];
        BOOL v13 = [(TLToneManager *)self->_toneManager _aliasForToneIdentifier:v12];
        if ([v13 length] && objc_msgSend(v5, "isEqualToString:", v13))
        {

          id v5 = 0;
        }
      }
    }
  }
LABEL_4:

  return v5;
}

- (id)_identifierAtIndexPath:(id)a3 isMediaItem:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    unint64_t v8 = objc_msgSend(v6, "tk_row");
    if ([(TKTonePickerController *)self _isMediaGroupAtIndexPath:v7]
      && v8 < [(TKTonePickerController *)self _mediaItemsCount])
    {
      uint64_t v9 = [(TKTonePickerController *)self _identifierOfMediaItemAtIndex:v8];
      if (!a4) {
        goto LABEL_10;
      }
      BOOL v10 = 1;
    }
    else
    {
      uint64_t v9 = [(TKTonePickerController *)self _identifierOfToneAtIndexPath:v7];
      if (!a4) {
        goto LABEL_10;
      }
      BOOL v10 = 0;
    }
    *a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_10:

  return v9;
}

- (TKTonePickerItem)_topLevelSelectedTonePickerItem
{
  unint64_t v3 = [(TKTonePickerController *)self _selectedToneIndexPath];
  id v4 = v3;
  if (v3)
  {
    id v5 = -[TKTonePickerController pickerItemForSection:](self, "pickerItemForSection:", objc_msgSend(v3, "tk_section"));
    id v6 = objc_msgSend(v5, "childItemAtIndex:", objc_msgSend(v4, "tk_row"));
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return (TKTonePickerItem *)v7;
}

- (TKTonePickerItem)selectedTonePickerItem
{
  unint64_t v3 = [(TKTonePickerController *)self _topLevelSelectedTonePickerItem];
  id v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  uint64_t v5 = [v3 itemKind];
  if (v5 == 2)
  {
    unint64_t v7 = [(TKTonePickerController *)self _selectedClassicAlertToneIndex];
    goto LABEL_8;
  }
  if (v5 == 1)
  {
    unint64_t v7 = [(TKTonePickerController *)self _selectedClassicRingtoneIndex];
LABEL_8:
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = [v4 childItemAtIndex:v7];
      goto LABEL_11;
    }
LABEL_9:
    unint64_t v8 = 0;
    goto LABEL_12;
  }
  if (v5) {
    goto LABEL_9;
  }
  id v6 = v4;
LABEL_11:
  unint64_t v8 = v6;
LABEL_12:

  return (TKTonePickerItem *)v8;
}

- (NSString)selectedToneIdentifier
{
  unint64_t v3 = [(TKTonePickerController *)self _selectedToneIndexPath];
  id v4 = [(TKTonePickerController *)self _identifierOfToneAtIndexPath:v3];

  if ([v4 isEqualToString:@"<classic_alert_tone_identifier>"])
  {
    uint64_t v5 = [(TKTonePickerController *)self _identifierOfSelectedClassicAlertTone];
  }
  else
  {
    if (![v4 isEqualToString:@"<classic_ringtone_identifier>"]) {
      goto LABEL_6;
    }
    uint64_t v5 = [(TKTonePickerController *)self _identifierOfSelectedClassicRingtone];
  }
  id v6 = (void *)v5;

  id v4 = v6;
LABEL_6:

  return (NSString *)v4;
}

- (void)setSelectedToneIdentifier:(id)a3
{
  id v5 = a3;
  id v4 = v5;
  if (![v5 length])
  {
    id v4 = v5;
    if (!self->_showsDefault)
    {
      id v4 = [(TKTonePickerController *)self defaultToneIdentifier];
    }
  }
  self->_selectedToneWasExplicitlySetToDefaultTone = v4 != v5;
  [(TKTonePickerController *)self _setSelectedToneIdentifier:v4 currentlyReloadingTones:0];
}

- (void)_setSelectedToneIdentifier:(id)a3 currentlyReloadingTones:(BOOL)a4
{
  id v25 = [(TLToneManager *)self->_toneManager _aliasForToneIdentifier:a3];
  if (![v25 length]
    || self->_targetDevice
    || ([(TLToneManager *)self->_toneManager toneWithIdentifierIsValid:v25] & 1) != 0)
  {
    id v6 = v25;
  }
  else
  {

    id v6 = 0;
  }
  id v26 = v6;
  if ([v6 length])
  {
    unint64_t v7 = [(TKTonePickerController *)self _indexPathForToneWithIdentifier:v26];
  }
  else
  {
    unint64_t v7 = 0;
  }
  if (self->_showsNone
    && ![(TKTonePickerController *)self isNoneAtTop]
    && [v26 isEqualToString:*MEMORY[0x263F7FD70]])
  {
    uint64_t v8 = [(TKTonePickerController *)self _indexPathForNone];

    unint64_t v7 = (void *)v8;
  }
  if (!v7)
  {
    if (self->_showsDefault)
    {
      uint64_t v9 = [(TKTonePickerController *)self _indexPathForDefaultGroup];
    }
    else
    {
      if (!self->_showsNone)
      {
        unint64_t v7 = 0;
        goto LABEL_30;
      }
      uint64_t v9 = [(TKTonePickerController *)self _indexPathForNone];
    }
    unint64_t v7 = (void *)v9;
    if (v9) {
      goto LABEL_18;
    }
LABEL_30:
    BOOL v14 = 0;
    BOOL v10 = 0;
    goto LABEL_31;
  }
LABEL_18:
  BOOL v10 = [(TKTonePickerController *)self _identifierOfToneAtIndexPath:v7];
  if ([v10 isEqualToString:@"<classic_alert_tone_identifier>"])
  {
    uint64_t v11 = [(TKTonePickerController *)self _classicAlertToneIdentifiers];
    uint64_t v12 = [v11 indexOfObject:v26];

    unint64_t v13 = [(TKTonePickerController *)self _selectedClassicAlertToneIndex];
    BOOL v14 = v12 != v13;
    if (v12 != v13) {
      [(TKTonePickerController *)self _setSelectedClassicAlertToneIndex:v12];
    }
    [(TKTonePickerController *)self _setSelectedClassicRingtoneIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  else
  {
    if (![v10 isEqualToString:@"<classic_ringtone_identifier>"])
    {
      [(TKTonePickerController *)self _setSelectedClassicAlertToneIndex:0x7FFFFFFFFFFFFFFFLL];
      [(TKTonePickerController *)self _setSelectedClassicRingtoneIndex:0x7FFFFFFFFFFFFFFFLL];
      BOOL v14 = 0;
      goto LABEL_31;
    }
    BOOL v15 = [(TKTonePickerController *)self _classicRingtoneIdentifiers];
    uint64_t v16 = [v15 indexOfObject:v26];

    unint64_t v17 = [(TKTonePickerController *)self _selectedClassicRingtoneIndex];
    BOOL v14 = v16 != v17;
    if (v16 != v17) {
      [(TKTonePickerController *)self _setSelectedClassicRingtoneIndex:v16];
    }
    [(TKTonePickerController *)self _setSelectedClassicAlertToneIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  id v18 = v26;

  BOOL v10 = v18;
LABEL_31:
  uint64_t v19 = [(TKTonePickerController *)self _selectedToneIndexPath];
  int v20 = [v19 isEqual:v7];

  if (v14 || !v20)
  {
    [(TKTonePickerController *)self _setSelectedToneIndexPath:v7];
    unint64_t v21 = (unint64_t)v26;
    unint64_t v22 = v10;
    BOOL v23 = (void *)v22;
    if (!(v21 | v22)) {
      goto LABEL_39;
    }
    if (!v21 || !v22)
    {

      goto LABEL_46;
    }
    if (v21 == v22)
    {
LABEL_39:
    }
    else
    {
      char v24 = [(id)v21 isEqualToString:v22];

      if ((v24 & 1) == 0)
      {
LABEL_46:
        [(TKTonePickerController *)self _didSelectToneWithIdentifier:v23];
        if (a4) {
          goto LABEL_42;
        }
LABEL_41:
        [(TKTonePickerController *)self _invalidatePickerItemCaches];
        [(TKTonePickerController *)self _didReloadTones];
        goto LABEL_42;
      }
    }
    if (a4) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_42:
}

- (id)_identifierOfSelectedClassicAlertTone
{
  id v3 = (id)*MEMORY[0x263F7FD70];
  unint64_t v4 = [(TKTonePickerController *)self _selectedClassicAlertToneIndex];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    id v6 = [(TKTonePickerController *)self _classicAlertToneIdentifiers];
    uint64_t v7 = [v6 objectAtIndex:v5];

    id v3 = (id)v7;
  }

  return v3;
}

- (id)_identifierOfSelectedClassicRingtone
{
  id v3 = (id)*MEMORY[0x263F7FD70];
  unint64_t v4 = [(TKTonePickerController *)self _selectedClassicRingtoneIndex];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    id v6 = [(TKTonePickerController *)self _classicRingtoneIdentifiers];
    uint64_t v7 = [v6 objectAtIndex:v5];

    id v3 = (id)v7;
  }

  return v3;
}

- (id)_selectedIdentifier:(BOOL *)a3
{
  unint64_t v5 = [(TKTonePickerController *)self _selectedToneIndexPath];
  id v6 = [(TKTonePickerController *)self _identifierAtIndexPath:v5 isMediaItem:a3];

  return v6;
}

- (BOOL)didSelectTonePickerItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", objc_msgSend(v4, "row"), objc_msgSend(v4, "section"));
    [(TKTonePickerController *)self setShowsNothingSelected:0];
    if ([(TKTonePickerController *)self _isIgnoreMuteGroupAtIndexPath:v6])
    {
LABEL_4:
      id v7 = 0;
LABEL_5:
      uint64_t v8 = 0;
LABEL_6:
      BOOL v5 = 1;
LABEL_12:

      goto LABEL_13;
    }
    if ([(TKTonePickerController *)self _isVibrationGroupAtIndexPath:v6])
    {
      uint64_t v9 = [(TKTonePickerController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v9 tonePickerControllerRequestsPresentingVibrationPicker:self];
      }

      goto LABEL_11;
    }
    if ([(TKTonePickerController *)self _isToneStoreGroupAtIndexPath:v6])
    {
      uint64_t v11 = objc_msgSend(v6, "tk_row");
      if (v11 == 1)
      {
        [(TKTonePickerController *)self _redownloadAllTones];
      }
      else if (!v11)
      {
        [(TKTonePickerController *)self _goToStore];
      }
      goto LABEL_4;
    }
    if ([(TKTonePickerController *)self _isNoneGroupAtIndexPath:v6])
    {
      uint64_t v12 = [(TKTonePickerController *)self _selectedToneIndexPath];
      BOOL v13 = [(TKTonePickerController *)self _isNoneGroupAtIndexPath:v12];

      id v7 = (id)*MEMORY[0x263F7FD70];
      [(TKTonePickerController *)self stopPlayingWithFadeOut:0];
      uint64_t v8 = 0;
      if (v13) {
        goto LABEL_6;
      }
    }
    else
    {
      if (![(TKTonePickerController *)self _isMediaGroupAtIndexPath:v6])
      {
        if ([(TKTonePickerController *)self _isDividerAtIndexPath:v6])
        {
LABEL_11:
          id v7 = 0;
          uint64_t v8 = 0;
          BOOL v5 = 0;
          goto LABEL_12;
        }
        id v7 = [(TKTonePickerController *)self _identifierOfToneAtIndexPath:v6];
        if (([v7 isEqualToString:@"<classic_ringtone_identifier>"] & 1) != 0
          || [v7 isEqualToString:@"<classic_alert_tone_identifier>"])
        {
          [(TKTonePickerController *)self stopPlayingWithFadeOut:0];
          int v20 = [(TKTonePickerController *)self delegate];
          if (objc_opt_respondsToSelector()) {
            [v20 tonePickerController:self requestsPresentingToneClassicsPickerForItem:v4];
          }

          goto LABEL_5;
        }
        unint64_t v21 = [(TKTonePickerController *)self _selectedToneIndexPath];
        char v22 = [v6 isEqual:v21];

        if (v22)
        {
          [(TKTonePickerController *)self _togglePlayForToneWithIdentifier:v7];
          goto LABEL_5;
        }
        uint64_t v8 = 0;
        int v18 = 1;
LABEL_27:
        uint64_t v19 = [(TKTonePickerController *)self _selectedToneIndexPath];
        [(TKTonePickerController *)self _didUpdateCheckedStatus:0 ofPickerItemForRowAtIndexPath:v19];
        [(TKTonePickerController *)self _didUpdateDetailText:0 ofPickerItemForRowAtIndexPath:v19];
        [(TKTonePickerController *)self _didUpdateCheckedStatus:1 ofPickerItemForRowAtIndexPath:v6];
        [(TKTonePickerController *)self _setSelectedToneIndexPath:v6];
        [(TKTonePickerController *)self _resetSelectedClassicRingtoneIndex];
        [(TKTonePickerController *)self _resetSelectedClassicAlertToneIndex];
        [(TKTonePickerController *)self _updateDetailTextOfVibrationItem];
        if (v8) {
          [(TKTonePickerController *)self _didSelectMediaItemWithIdentifier:v8];
        }
        else {
          [(TKTonePickerController *)self _didSelectToneWithIdentifier:v7];
        }

        if (v18) {
          [(TKTonePickerController *)self _playToneWithIdentifier:v7];
        }
        goto LABEL_6;
      }
      BOOL v14 = [(TKTonePickerController *)self delegate];
      unint64_t v15 = objc_msgSend(v6, "tk_row");
      if (v15 >= [(TKTonePickerController *)self _mediaItemsCount])
      {
        if (objc_opt_respondsToSelector()) {
          [v14 tonePickerControllerRequestsPresentingMediaItemPicker:self];
        }

        goto LABEL_4;
      }
      uint64_t v8 = [(TKTonePickerController *)self _identifierOfMediaItemAtIndex:v15];
      uint64_t v16 = [(TKTonePickerController *)self _selectedToneIndexPath];
      int v17 = [v6 isEqual:v16];

      if (objc_opt_respondsToSelector()) {
        [v14 tonePickerController:self didSelectMediaItemAtIndex:v15 selectionDidChange:v17 ^ 1u];
      }

      id v7 = 0;
      if (v17) {
        goto LABEL_6;
      }
    }
    int v18 = 0;
    goto LABEL_27;
  }
  BOOL v5 = [(TKTonePickerController *)self _didSelectToneClassicsPickerItem:v4];
LABEL_13:

  return v5;
}

- (BOOL)_didSelectToneClassicsPickerItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TKTonePickerController *)self _indexPathForToneWithIdentifier:@"<classic_ringtone_identifier>"];
  id v6 = [(TKTonePickerController *)self _indexPathForToneWithIdentifier:@"<classic_alert_tone_identifier>"];
  uint64_t v7 = [v4 section];
  uint64_t v8 = [v4 classicToneIndex];
  uint64_t v17 = v7;
  if (v5 && v7 == objc_msgSend(v5, "tk_section"))
  {
    id v9 = v5;
    BOOL v10 = [(TKTonePickerController *)self _classicRingtoneIdentifiers];
    unint64_t v11 = [(TKTonePickerController *)self _selectedClassicRingtoneIndex];
  }
  else
  {
    if (!v6 || v7 != objc_msgSend(v6, "tk_section"))
    {
      BOOL v10 = 0;
      id v9 = 0;
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_9;
    }
    id v9 = v6;
    BOOL v10 = [(TKTonePickerController *)self _classicAlertToneIdentifiers];
    unint64_t v11 = [(TKTonePickerController *)self _selectedClassicAlertToneIndex];
  }
  uint64_t v12 = v11;
LABEL_9:
  BOOL v13 = [v10 objectAtIndex:v8];
  BOOL v14 = [(TKTonePickerController *)self _selectedToneIndexPath];
  if ([v9 isEqual:v14] && v8 == v12)
  {
    [(TKTonePickerController *)self _togglePlayForToneWithIdentifier:v13];
  }
  else
  {
    unint64_t v15 = [(TKTonePickerController *)self _nameForToneIdentifier:v13];
    [(TKTonePickerController *)self _didUpdateDetailText:v15 ofPickerItemForRowAtIndexPath:v9];

    if (([v9 isEqual:v14] & 1) == 0)
    {
      [(TKTonePickerController *)self _didUpdateCheckedStatus:0 ofPickerItemForRowAtIndexPath:v14];
      [(TKTonePickerController *)self _didUpdateDetailText:0 ofPickerItemForRowAtIndexPath:v14];
      [(TKTonePickerController *)self _didUpdateCheckedStatus:1 ofPickerItemForRowAtIndexPath:v9];
      [(TKTonePickerController *)self _setSelectedToneIndexPath:v9];
    }
    [(TKTonePickerController *)self _resetSelectedClassicRingtoneIndex];
    [(TKTonePickerController *)self _resetSelectedClassicAlertToneIndex];
    if (v5 && v17 == objc_msgSend(v5, "tk_section"))
    {
      [(TKTonePickerController *)self _setSelectedClassicRingtoneIndex:v8];
    }
    else if (v6 && v17 == objc_msgSend(v6, "tk_section"))
    {
      [(TKTonePickerController *)self _setSelectedClassicAlertToneIndex:v8];
    }
    [(TKTonePickerController *)self _didUpdateCheckedStatus:1 ofToneClassicsPickerItem:v4];
    [(TKTonePickerController *)self _updateDetailTextOfVibrationItem];
    [(TKTonePickerController *)self _didSelectToneWithIdentifier:v13];
    [(TKTonePickerController *)self _playToneWithIdentifier:v13];
  }

  return 1;
}

- (BOOL)canDeleteTonePickerItem:(id)a3
{
  id v4 = (void *)MEMORY[0x263F088C8];
  id v5 = a3;
  uint64_t v6 = [v5 row];
  uint64_t v7 = [v5 section];

  uint64_t v8 = objc_msgSend(v4, "tk_indexPathForRow:inSection:", v6, v7);
  if ([(TKTonePickerController *)self _isIgnoreMuteGroupAtIndexPath:v8]
    || [(TKTonePickerController *)self _isVibrationGroupAtIndexPath:v8]
    || [(TKTonePickerController *)self _isToneStoreGroupAtIndexPath:v8]
    || [(TKTonePickerController *)self _isNoneGroupAtIndexPath:v8]
    || [(TKTonePickerController *)self _isMediaGroupAtIndexPath:v8]
    || [(TKTonePickerController *)self _isDividerAtIndexPath:v8])
  {
    char v9 = 0;
  }
  else
  {
    unint64_t v11 = [(TKTonePickerController *)self _identifierOfToneAtIndexPath:v8];
    if (v11) {
      char v9 = [(NSMutableSet *)self->_identifiersOfRemovableTones containsObject:v11];
    }
    else {
      char v9 = 0;
    }
  }
  return v9;
}

- (void)deleteTonePickerItem:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(TKTonePickerController *)self canDeleteTonePickerItem:v4])
  {
    id v5 = TLLogGeneral();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

    if (v6)
    {
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m"];
      uint64_t v8 = TLLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        char v9 = [v7 lastPathComponent];
        BOOL v10 = [MEMORY[0x263F08B88] callStackSymbols];
        *(_DWORD *)buf = 136381443;
        BOOL v23 = "-[TKTonePickerController deleteTonePickerItem:]";
        __int16 v24 = 2113;
        id v25 = v9;
        __int16 v26 = 2049;
        uint64_t v27 = 1505;
        __int16 v28 = 2113;
        unint64_t v29 = v10;
        _os_log_impl(&dword_22107E000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v7 = TLLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
      }
    }

    unint64_t v11 = TLLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TKTonePickerController deleteTonePickerItem:]((uint64_t)v4, v11);
    }
  }
  uint64_t v12 = [v4 section];
  uint64_t v13 = [v4 row];
  BOOL v14 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", v13, v12);
  unint64_t v15 = [(TKTonePickerController *)self _identifierOfToneAtIndexPath:v14];
  uint64_t v16 = v15;
  if (v15)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __47__TKTonePickerController_deleteTonePickerItem___block_invoke;
    v17[3] = &unk_264589868;
    v17[4] = self;
    uint64_t v20 = v12;
    uint64_t v21 = v13;
    id v18 = v15;
    id v19 = v4;
    [(TKTonePickerController *)self _performBatchUpdates:v17 completion:0];
  }
}

void __47__TKTonePickerController_deleteTonePickerItem___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) numberOfSections];
  id v3 = [*(id *)(a1 + 32) pickerItemForSection:*(void *)(a1 + 56)];
  uint64_t v55 = [v3 text];
  uint64_t v56 = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  id v4 = [*(id *)(a1 + 32) _indexPathForFirstToneGroup];
  uint64_t v5 = objc_msgSend(v4, "tk_section");

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v5 < v2)
  {
    uint64_t v7 = v5;
    do
    {
      uint64_t v8 = [*(id *)(a1 + 32) pickerItemForSection:v7];
      [v6 addObject:v8];

      ++v7;
    }
    while (v2 != v7);
  }
  uint64_t v9 = [v3 numberOfChildren];
  if (*(void *)(a1 + 64) + 1 >= v9)
  {
    int v57 = 0;
  }
  else
  {
    int v57 = objc_msgSend(v3, "childItemAtIndex:");
  }
  uint64_t v10 = *(void *)(a1 + 32);
  char v11 = *(unsigned char *)(v10 + 56);
  *(unsigned char *)(v10 + 56) = 1;
  [*(id *)(*(void *)(a1 + 32) + 8) _removeToneWithIdentifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _reloadTonesForExternalChange:0 shouldSkipDelegateFullReload:1];
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = v11;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v14 = [*(id *)(a1 + 32) numberOfSections];
  unint64_t v15 = (void *)[*(id *)(*(void *)(a1 + 32) + 96) mutableCopy];
  if (v14 + 1 == v2)
  {
    [v13 addObject:v3];
    uint64_t v16 = (void *)v55;
    [v15 insertObject:v55 atIndex:*(void *)(a1 + 56) - v5];
    uint64_t v53 = v3;
    uint64_t v17 = (void *)v56;
  }
  else
  {
    if (v14 != v2)
    {
      id v18 = TLLogGeneral();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

      if (v19)
      {
        uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m"];
        uint64_t v21 = TLLogGeneral();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v54 = [v20 lastPathComponent];
          [MEMORY[0x263F08B88] callStackSymbols];
          *(_DWORD *)buf = 136381443;
          v63 = "-[TKTonePickerController deleteTonePickerItem:]_block_invoke";
          __int16 v64 = 2113;
          v65 = v54;
          __int16 v66 = 2049;
          uint64_t v67 = 1543;
          v69 = __int16 v68 = 2113;
          char v22 = (void *)v69;
          _os_log_impl(&dword_22107E000, v21, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
        }
      }
      else
      {
        uint64_t v20 = TLLogGeneral();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
        }
      }

      BOOL v23 = TLLogGeneral();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_7();
      }
    }
    __int16 v24 = [*(id *)(a1 + 32) pickerItemForSection:*(void *)(a1 + 56)];

    uint64_t v53 = v24;
    uint64_t v25 = [v24 numberOfChildren];
    [v12 addObject:*(void *)(a1 + 48)];
    if (v25 + 2 == v9)
    {
      uint64_t v16 = (void *)v55;
      uint64_t v17 = (void *)v56;
      __int16 v26 = v57;
      if (!v57)
      {
        uint64_t v27 = TLLogGeneral();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);

        if (v28)
        {
          unint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m"];
          uint64_t v30 = TLLogGeneral();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            long long v31 = [v29 lastPathComponent];
            long long v32 = [MEMORY[0x263F08B88] callStackSymbols];
            *(_DWORD *)buf = 136381443;
            v63 = "-[TKTonePickerController deleteTonePickerItem:]_block_invoke";
            __int16 v64 = 2113;
            v65 = v31;
            __int16 v66 = 2049;
            uint64_t v67 = 1549;
            __int16 v68 = 2113;
            uint64_t v69 = (uint64_t)v32;
            _os_log_impl(&dword_22107E000, v30, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

            uint64_t v17 = (void *)v56;
          }
        }
        else
        {
          unint64_t v29 = TLLogGeneral();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
          }
        }
        __int16 v26 = 0;

        v40 = TLLogGeneral();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_3();
        }
      }
      [v12 addObject:v26];
    }
    else
    {
      uint64_t v16 = (void *)v55;
      uint64_t v17 = (void *)v56;
      if (v25 + 1 != v9)
      {
        long long v33 = TLLogGeneral();
        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);

        if (v34)
        {
          long long v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m"];
          v36 = TLLogGeneral();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = [v35 lastPathComponent];
            v38 = [MEMORY[0x263F08B88] callStackSymbols];
            *(_DWORD *)buf = 136381443;
            v63 = "-[TKTonePickerController deleteTonePickerItem:]_block_invoke";
            __int16 v64 = 2113;
            v65 = v37;
            __int16 v66 = 2049;
            uint64_t v67 = 1552;
            __int16 v68 = 2113;
            uint64_t v69 = (uint64_t)v38;
            _os_log_impl(&dword_22107E000, v36, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

            uint64_t v17 = (void *)v56;
          }
        }
        else
        {
          long long v35 = TLLogGeneral();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
          }
        }

        uint64_t v39 = TLLogGeneral();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_5();
        }
      }
    }
  }
  id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v42 = [v17 count];
  if (v42 != [v15 count])
  {
    id v43 = TLLogGeneral();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_INFO);

    if (v44)
    {
      v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m"];
      int64_t v46 = TLLogGeneral();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = [v45 lastPathComponent];
        v48 = [MEMORY[0x263F08B88] callStackSymbols];
        *(_DWORD *)buf = 136381443;
        v63 = "-[TKTonePickerController deleteTonePickerItem:]_block_invoke";
        __int16 v64 = 2113;
        v65 = v47;
        __int16 v66 = 2049;
        uint64_t v67 = 1557;
        __int16 v68 = 2113;
        uint64_t v69 = (uint64_t)v48;
        _os_log_impl(&dword_22107E000, v46, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

        uint64_t v16 = (void *)v55;
      }

      uint64_t v17 = (void *)v56;
    }
    else
    {
      v45 = TLLogGeneral();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
      }
    }

    v49 = TLLogGeneral();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_1();
    }
  }
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __47__TKTonePickerController_deleteTonePickerItem___block_invoke_94;
  v58[3] = &unk_264589840;
  id v59 = v15;
  id v60 = v6;
  id v61 = v41;
  id v50 = v41;
  id v51 = v6;
  id v52 = v15;
  [v17 enumerateObjectsUsingBlock:v58];
  [*(id *)(a1 + 32) _applyBatchUpdatesWithDeletedPickerRowItems:v12 deletedTonePickerSectionItems:v13 insertedPickerRowItems:MEMORY[0x263EFFA68] insertedTonePickerSectionItems:MEMORY[0x263EFFA68] tonePickerSectionItemsWithUpdatedHeaderText:v50 tonePickerSectionItemsWithUpdatedFooterText:MEMORY[0x263EFFA68]];
}

void __47__TKTonePickerController_deleteTonePickerItem___block_invoke_94(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v8 = [v5 objectAtIndex:a3];
  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:");

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 40) objectAtIndex:a3];
    [v7 _setText:v8];
    [*(id *)(a1 + 48) addObject:v7];
  }
}

- (BOOL)_showsNoneInSeparateToneGroup
{
  if (self->_showsNone) {
    return ![(TKTonePickerController *)self isNoneAtTop];
  }
  else {
    return 0;
  }
}

- (void)_reloadStateForBasicBehavior
{
  int64_t alertType = self->_alertType;
  if (alertType > 13)
  {
    if (alertType == 14)
    {
      BOOL v5 = 0;
      uint64_t v9 = 1;
      uint64_t v7 = 28;
      uint64_t v6 = 30;
    }
    else
    {
      if (alertType != 28) {
        goto LABEL_14;
      }
      BOOL v5 = 0;
      uint64_t v9 = 1;
      uint64_t v7 = 28;
      uint64_t v6 = 31;
    }
LABEL_22:
    uint64_t v8 = 1;
    goto LABEL_23;
  }
  if (alertType == 1)
  {
    if ([(NSString *)self->_topic isEqualToString:*MEMORY[0x263F7FCE8]])
    {
      uint64_t v9 = 0;
      BOOL v5 = 0;
      uint64_t v8 = 1;
      uint64_t v6 = 31;
      uint64_t v7 = 31;
      goto LABEL_23;
    }
    BOOL v10 = [(NSString *)self->_topic isEqualToString:*MEMORY[0x263F7FCF0]];
    BOOL v5 = 0;
    uint64_t v6 = 31;
    if (v10) {
      uint64_t v7 = 31;
    }
    else {
      uint64_t v7 = 28;
    }
    uint64_t v9 = !v10;
    goto LABEL_22;
  }
  if (alertType != 13)
  {
LABEL_14:
    uint64_t v9 = 0;
    BOOL v5 = 0;
    uint64_t v8 = 1;
    uint64_t v7 = 27;
    uint64_t v6 = 31;
    goto LABEL_23;
  }
  BOOL v4 = [(NSString *)self->_topic isEqualToString:*MEMORY[0x263F7FCC0]];
  BOOL v5 = v4;
  if (v4) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 30;
  }
  if (v4) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 28;
  }
  uint64_t v8 = !v4;
  uint64_t v9 = 1;
LABEL_23:
  if (_os_feature_enabled_impl()) {
    unint64_t v11 = v7;
  }
  else {
    unint64_t v11 = v6;
  }
  self->_toneTypes = v11;
  [(TKTonePickerController *)self _setBehavesAsRingtonePicker:v9];
  if (self->_showsNoneWasExplicitlySet)
  {
    if (!v5) {
      return;
    }
  }
  else if (self->_hasLoadedTonesOnce)
  {
    [(TKTonePickerController *)self setShowsNone:v8];
    self->_showsNoneWasExplicitlySet = 0;
    if (!v5) {
      return;
    }
  }
  else
  {
    self->_showsNone = v8;
    if (!v5) {
      return;
    }
  }
  id v12 = [(TLToneManager *)self->_toneManager currentToneIdentifierForAlertType:self->_alertType topic:self->_topic];
  [(TKTonePickerController *)self setSelectedToneIdentifier:v12];
}

- (void)_reloadTones
{
}

- (void)_reloadTonesForExternalChange:(BOOL)a3 shouldSkipDelegateFullReload:(BOOL)a4
{
  BOOL v80 = a3;
  uint64_t v104 = *MEMORY[0x263EF8340];
  char v99 = 0;
  if (!self->_shouldFreezeContentsOriginatingFromToneManager) {
    [(TKTonePickerController *)self _reloadMediaItems];
  }
  [(TKTonePickerController *)self _invalidatePickerItemCaches];
  BOOL v5 = [(TKTonePickerController *)self _selectedToneIndexPath];
  BOOL v6 = [(TKTonePickerController *)self _isDefaultGroupAtIndexPath:v5];

  HIDWORD(v74) = v6;
  if (v6)
  {
    LODWORD(v74) = 0;
    int v78 = 0;
    v83 = 0;
    goto LABEL_14;
  }
  uint64_t v7 = [(TKTonePickerController *)self _selectedToneIndexPath];
  BOOL v8 = [(TKTonePickerController *)self _isNoneGroupAtIndexPath:v7];

  if (v8)
  {
    int v78 = 0;
    v83 = 0;
    LODWORD(v74) = 1;
    goto LABEL_14;
  }
  uint64_t v9 = [(TKTonePickerController *)self _selectedToneIndexPath];
  BOOL v10 = [(TKTonePickerController *)self _identifierAtIndexPath:v9 isMediaItem:&v99];

  if (!v99)
  {
    if ([v10 length]) {
      goto LABEL_9;
    }
LABEL_11:
    if (self->_showsDefault)
    {
      v83 = v10;
      LODWORD(v74) = 0;
      int v78 = 0;
    }
    else
    {
      uint64_t v11 = [(TKTonePickerController *)self defaultToneIdentifier];

      LODWORD(v74) = 0;
      int v78 = 0;
      v83 = (void *)v11;
    }
    goto LABEL_14;
  }
  if (!v10) {
    goto LABEL_11;
  }
LABEL_9:
  v83 = v10;
  LODWORD(v74) = 0;
  int v78 = 1;
LABEL_14:
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v82 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v86 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  toneGroupLists = self->_toneGroupLists;
  self->_toneGroupLists = v13;

  unint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  toneGroupNames = self->_toneGroupNames;
  self->_toneGroupNames = v15;

  uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  toneGroupBucketIdentifiers = self->_toneGroupBucketIdentifiers;
  self->_toneGroupBucketIdentifiers = v17;

  BOOL v90 = [(TKTonePickerController *)self _behavesAsRingtonePicker];
  id v87 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v88 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v84 = objc_alloc_init(MEMORY[0x263EFF980]);
  v85 = v12;
  id v79 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_shouldFreezeContentsOriginatingFromToneManager)
  {
    uint64_t v21 = self->_installedTones;
  }
  else
  {
    uint64_t v21 = [(TLToneManager *)self->_toneManager _installedTones];
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  obuint64_t j = v21;
  char v22 = v21;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v95 objects:v103 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v96 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        BOOL v28 = objc_msgSend(v27, "identifier", v74, obj);
        if (([v27 isPrivateTone] & 1) == 0)
        {
          if ([(TLToneManager *)self->_toneManager toneWithIdentifierIsValid:v28])
          {
            if (v90
              || ([v27 duration], v29 <= 30.0) && (objc_msgSend(v27, "isProtectedContent") & 1) == 0)
            {
              if ([v27 isRingtone])
              {
                int v30 = [v27 isPurchased];
                unint64_t toneTypes = self->_toneTypes;
                if (v30)
                {
                  if ((toneTypes & 0x10) == 0) {
                    goto LABEL_41;
                  }
                  long long v32 = v19;
                }
                else
                {
                  if ((toneTypes & 8) == 0) {
                    goto LABEL_41;
                  }
                  long long v32 = v87;
                }
              }
              else
              {
                if ((self->_toneTypes & 2) == 0) {
                  goto LABEL_41;
                }
                if ([v27 isPurchased]) {
                  long long v32 = v20;
                }
                else {
                  long long v32 = v88;
                }
              }
              [v32 addObject:v28];
            }
          }
          else
          {
            long long v33 = TLLogToneManagement();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v102 = v27;
              _os_log_impl(&dword_22107E000, v33, OS_LOG_TYPE_DEFAULT, "Skipping %{public}@ in tone picker because this tone is not valid.", buf, 0xCu);
            }
          }
        }
LABEL_41:
      }
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v95 objects:v103 count:16];
    }
    while (v24);
  }

  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(NSMutableDictionary *)self->_activeToneStoreDownloadsByIdentifier count])
  {
    long long v35 = [(NSMutableDictionary *)self->_activeToneStoreDownloadsByIdentifier allValues];
    [v34 addObjectsFromArray:v35];
  }
  if ([(NSMutableDictionary *)self->_finishedToneStoreDownloadsByIdentifier count])
  {
    v36 = [(NSMutableDictionary *)self->_finishedToneStoreDownloadsByIdentifier allValues];
    [v34 addObjectsFromArray:v36];
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v37 = v34;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v91 objects:v100 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v92;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v92 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void **)(*((void *)&v91 + 1) + 8 * j);
        id v43 = [v42 toneIdentifier];
        if (!v43)
        {
          id v43 = [v42 identifier];
        }
        int v44 = [v42 isRingtone];
        unint64_t v45 = self->_toneTypes;
        if (!v44)
        {
          int64_t v46 = v20;
          if ((v45 & 2) == 0) {
            goto LABEL_59;
          }
LABEL_58:
          [v46 addObject:v43];
          goto LABEL_59;
        }
        int64_t v46 = v19;
        if ((v45 & 0x10) != 0) {
          goto LABEL_58;
        }
LABEL_59:
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v91 objects:v100 count:16];
    }
    while (v39);
  }

  unint64_t v47 = self->_toneTypes;
  v48 = v85;
  if ((v47 & 4) != 0)
  {
    v49 = [(TKTonePickerController *)self _loadRingtonesFromPlist];
    id v50 = [v49 objectForKey:@"modern"];
    [v84 addObjectsFromArray:v50];
    id v51 = [v49 objectForKey:@"classic"];
    [(TKTonePickerController *)self _setClassicRingtoneIdentifiers:v51];
    if (v51) {
      [v84 addObject:@"<classic_ringtone_identifier>"];
    }

    unint64_t v47 = self->_toneTypes;
    v48 = v85;
  }
  if (v47)
  {
    id v52 = [(TKTonePickerController *)self _loadAlertTonesFromPlist];
    uint64_t v53 = [v52 objectForKey:@"modern"];
    [v79 addObjectsFromArray:v53];
    v54 = [v52 objectForKey:@"classic"];
    [(TKTonePickerController *)self _setClassicAlertToneIdentifiers:v54];
    if (v54) {
      [v79 addObject:@"<classic_alert_tone_identifier>"];
    }

    v48 = v85;
  }
  [(TKTonePickerController *)self _sortToneIdentifiersArray:v19];
  [(TKTonePickerController *)self _sortToneIdentifiersArray:v87];
  [(TKTonePickerController *)self _sortToneIdentifiersArray:v20];
  [(TKTonePickerController *)self _sortToneIdentifiersArray:v88];
  if ([v19 count])
  {
    [v82 addObjectsFromArray:v19];
    [v86 addObjectsFromArray:v19];
  }
  if ([v87 count])
  {
    [v82 addObjectsFromArray:v87];
    [v86 addObjectsFromArray:v87];
  }
  if ([v84 count])
  {
    if ([v82 count]) {
      [v82 addObject:&stru_26D2E1860];
    }
    [v82 addObjectsFromArray:v84];
  }
  if ([v20 count])
  {
    [v48 addObjectsFromArray:v20];
    [v86 addObjectsFromArray:v20];
  }
  if ([v88 count])
  {
    [v48 addObjectsFromArray:v88];
    [v86 addObjectsFromArray:v88];
  }
  if ([v79 count])
  {
    if ([v48 count]) {
      [v48 addObject:&stru_26D2E1860];
    }
    [v48 addObjectsFromArray:v79];
  }
  BOOL v55 = [(TKTonePickerController *)self _showsMedia];
  uint64_t v56 = [v82 count];
  uint64_t v57 = [v48 count];
  if (v57) {
    BOOL v58 = v56 == 0;
  }
  else {
    BOOL v58 = 1;
  }
  if (!v58 || v55)
  {
    TLLocalizedString();
    v89 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

    TLLocalizedString();
    id v59 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v59 = &stru_26D2E1860;
    v89 = &stru_26D2E1860;
  }
  if (v90)
  {
    if (v56)
    {
      [(NSMutableArray *)self->_toneGroupLists addObject:v82];
      [(NSMutableArray *)self->_toneGroupNames addObject:v89];
      [(NSMutableArray *)self->_toneGroupBucketIdentifiers addObject:@"ringtones"];
    }
    if (v57)
    {
      id v60 = @"alert tones";
      id v61 = v85;
      v62 = v59;
LABEL_102:
      [(NSMutableArray *)self->_toneGroupLists addObject:v61];
      [(NSMutableArray *)self->_toneGroupNames addObject:v62];
      [(NSMutableArray *)self->_toneGroupBucketIdentifiers addObject:v60];
    }
  }
  else
  {
    if (v57)
    {
      [(NSMutableArray *)self->_toneGroupLists addObject:v85];
      [(NSMutableArray *)self->_toneGroupNames addObject:v59];
      [(NSMutableArray *)self->_toneGroupBucketIdentifiers addObject:@"alert tones"];
    }
    if (v56)
    {
      id v60 = @"ringtones";
      id v61 = v82;
      v62 = v89;
      goto LABEL_102;
    }
  }
  if (self->_overrideFirstToneSectionTitle) {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_toneGroupNames, "replaceObjectAtIndex:withObject:", 0);
  }
  if (self->_showsNone && [(TKTonePickerController *)self isNoneAtTop])
  {
    if ([(TKTonePickerController *)self _showsNoneInSeparateToneGroup])
    {
      v63 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      [(NSMutableArray *)v63 addObject:*MEMORY[0x263F7FD70]];
      [(NSMutableArray *)self->_toneGroupLists insertObject:v63 atIndex:0];
      [(NSMutableArray *)self->_toneGroupNames insertObject:&stru_26D2E1860 atIndex:0];
      __int16 v64 = self->_toneGroupBucketIdentifiers;
      v65 = @"none";
    }
    else
    {
      v63 = [(NSMutableArray *)self->_toneGroupLists firstObject];
      [(NSMutableArray *)v63 insertObject:&stru_26D2E1860 atIndex:0];
      v65 = (__CFString *)*MEMORY[0x263F7FD70];
      __int16 v64 = v63;
    }
    [(NSMutableArray *)v64 insertObject:v65 atIndex:0];
  }
  objc_storeStrong((id *)&self->_installedTones, obj);
  objc_storeStrong((id *)&self->_identifiersOfRemovableTones, v86);
  if (!v78)
  {
    if (v76)
    {
      uint64_t v66 = [(TKTonePickerController *)self _indexPathForDefaultGroup];
    }
    else
    {
      if (!v75)
      {
        __int16 v72 = [(TKTonePickerController *)self defaultToneIdentifier];
        uint64_t v67 = [(TKTonePickerController *)self _indexPathForToneWithIdentifier:v72];

        goto LABEL_120;
      }
      uint64_t v66 = [(TKTonePickerController *)self _indexPathForNone];
    }
LABEL_119:
    uint64_t v67 = (void *)v66;
LABEL_120:
    int v68 = 0;
    goto LABEL_121;
  }
  uint64_t v66 = [(TKTonePickerController *)self _indexPathForToneWithIdentifier:v83];
  if (v66) {
    goto LABEL_119;
  }
  if (self->_showsDefault)
  {
    uint64_t v67 = [(TKTonePickerController *)self _indexPathForDefaultGroup];
  }
  else
  {
    uint64_t v73 = [(TKTonePickerController *)self defaultToneIdentifier];
    uint64_t v67 = [(TKTonePickerController *)self _indexPathForToneWithIdentifier:v73];
  }
  int v68 = 1;
LABEL_121:
  [(TKTonePickerController *)self _setSelectedToneIndexPath:v67];
  if (v80)
  {
    uint64_t v69 = [(TLToneManager *)self->_toneManager currentToneIdentifierForAlertType:[(TKTonePickerController *)self alertType]];
    [(TKTonePickerController *)self _setSelectedToneIdentifier:v69 currentlyReloadingTones:1];
    if (!v83 || ([v69 isEqualToString:v83] & 1) == 0) {
      int v68 = 1;
    }
  }
  self->_hasLoadedTonesOnce = 1;
  if (!a4) {
    [(TKTonePickerController *)self _didReloadTones];
  }
  if (v68)
  {
    uint64_t v70 = [(TKTonePickerController *)self _selectedToneIndexPath];
    v71 = [(TKTonePickerController *)self _identifierAtIndexPath:v70 isMediaItem:&v99];

    if (v99) {
      [(TKTonePickerController *)self _didSelectMediaItemWithIdentifier:v71];
    }
    else {
      [(TKTonePickerController *)self _didSelectToneWithIdentifier:v71];
    }
  }
}

- (id)_platformSpecificAdjustedPlistName:(id)a3
{
  id v4 = a3;
  int64_t targetDevice = self->_targetDevice;
  id v6 = v4;
  uint64_t v7 = v6;
  BOOL v8 = v6;
  if (targetDevice == 1)
  {
    BOOL v8 = [v6 stringByAppendingString:@"-watchOS"];
  }

  return v8;
}

- (NSString)_alertTonesPlistName
{
  return (NSString *)[(TKTonePickerController *)self _platformSpecificAdjustedPlistName:@"TKAlertTones"];
}

- (NSString)_ringtonesPlistName
{
  if (self->_alertType == 13 && [(NSString *)self->_topic isEqualToString:*MEMORY[0x263F7FCC0]])
  {
    id v3 = @"TKAlarmWakeUpRingtones";
  }
  else
  {
    id v3 = [(TKTonePickerController *)self _platformSpecificAdjustedPlistName:@"TKRingtones"];
  }

  return (NSString *)v3;
}

- (id)_loadTonesFromPlistNamed:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = v4;
  if (_os_feature_enabled_impl())
  {
    if (([v4 isEqualToString:@"TKRingtones"] & 1) != 0
      || (BOOL v5 = v4, [v4 isEqualToString:@"TKAlertTones"]))
    {
      BOOL v5 = [v4 stringByAppendingString:@"-EncoreInfinitum"];
    }
  }
  id v6 = TLLogToneManagement();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 138543618;
    long long v32 = self;
    __int16 v33 = 2114;
    id v34 = v5;
    _os_log_impl(&dword_22107E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Loading tones from plist named: %{public}@.", (uint8_t *)&v31, 0x16u);
  }

  uint64_t v7 = NSDictionary;
  BOOL v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 pathForResource:v5 ofType:@"plist"];
  BOOL v10 = [v7 dictionaryWithContentsOfFile:v9];

  uint64_t v11 = [v10 objectForKey:@"modern"];
  id v12 = (void *)[v11 mutableCopy];

  id v13 = [v10 objectForKey:@"classic"];
  uint64_t v14 = (void *)[v13 mutableCopy];

  unint64_t v15 = [MEMORY[0x263F7FC80] sharedCapabilitiesManager];
  if ([v15 wantsModernDefaultRingtone])
  {
    char v16 = [v4 isEqualToString:@"TKRingtones"];

    if (v16)
    {
      if (_os_feature_enabled_impl()) {
        uint64_t v17 = v14;
      }
      else {
        uint64_t v17 = v12;
      }
      [v17 addObject:@"system:Opening"];
    }
  }
  else
  {
  }
  id v18 = [v10 objectForKey:@"sort"];
  id v19 = v18;
  if (v18 && [v18 BOOLValue])
  {
    [(TKTonePickerController *)self _sortToneIdentifiersArray:v12];
    [(TKTonePickerController *)self _sortToneIdentifiersArray:v14];
  }
  toneManager = self->_toneManager;
  uint64_t v21 = [(TKTonePickerController *)self defaultToneIdentifier];
  char v22 = [(TLToneManager *)toneManager _aliasForToneIdentifier:v21];

  uint64_t v23 = [v12 indexOfObject:v22];
  if (self->_alertType == 17 && v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v14)
    {
      uint64_t v24 = [v14 indexOfObject:@"texttone:Tri-tone"];
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [v14 removeObjectAtIndex:v24];
        [v12 insertObject:@"texttone:Tri-tone" atIndex:0];
      }
    }
  }
  uint64_t v25 = [v12 indexOfObject:v22];
  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v12 removeObjectAtIndex:v25];
    uint64_t v27 = v12;
    goto LABEL_27;
  }
  if (v14)
  {
    uint64_t v26 = [v14 indexOfObject:v22];
    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v14 removeObjectAtIndex:v26];
      uint64_t v27 = v14;
LABEL_27:
      [v27 insertObject:v22 atIndex:0];
    }
  }
  id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  double v29 = v28;
  if (v12) {
    [v28 setObject:v12 forKey:@"modern"];
  }
  if (v14) {
    [v29 setObject:v14 forKey:@"classic"];
  }

  return v29;
}

- (id)_loadAlertTonesFromPlist
{
  id v3 = [(TKTonePickerController *)self _alertTonesPlistName];
  id v4 = [(TKTonePickerController *)self _loadTonesFromPlistNamed:v3];

  return v4;
}

- (id)_loadRingtonesFromPlist
{
  id v3 = [(TKTonePickerController *)self _ringtonesPlistName];
  id v4 = [(TKTonePickerController *)self _loadTonesFromPlistNamed:v3];

  return v4;
}

- (void)_sortToneIdentifiersArray:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__TKTonePickerController__sortToneIdentifiersArray___block_invoke;
  v3[3] = &unk_264589890;
  v3[4] = self;
  [a3 sortUsingComparator:v3];
}

uint64_t __52__TKTonePickerController__sortToneIdentifiersArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 _nameForToneIdentifier:a2];
  BOOL v8 = [*(id *)(a1 + 32) _nameForToneIdentifier:v6];

  uint64_t v9 = [v7 localizedCaseInsensitiveCompare:v8];
  return v9;
}

- (TLToneManager)_toneManager
{
  return self->_toneManager;
}

- (void)_setToneManager:(id)a3
{
  BOOL v5 = (TLToneManager *)a3;
  p_toneManager = &self->_toneManager;
  if (self->_toneManager != v5)
  {
    BOOL v10 = v5;
    uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    BOOL v8 = v7;
    uint64_t v9 = (void *)MEMORY[0x263F7FD98];
    if (*p_toneManager) {
      objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x263F7FD98]);
    }
    objc_storeStrong((id *)&self->_toneManager, a3);
    if (*p_toneManager) {
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__toneManagerContentsChanged_, *v9);
    }

    BOOL v5 = v10;
  }
}

- (void)_performBatchUpdates:(id)a3 completion:(id)a4
{
  BOOL v8 = (void (**)(id, uint64_t))a4;
  id v6 = (void (**)(void))a3;
  uint64_t v7 = [(TKTonePickerController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v7 tonePickerController:self requestsPerformingBatchUpdates:v6 completion:v8];
  }
  else
  {
    v6[2](v6);

    if (v8) {
      v8[2](v8, 1);
    }
  }
}

- (void)_applyBatchUpdatesWithDeletedPickerRowItems:(id)a3 deletedTonePickerSectionItems:(id)a4 insertedPickerRowItems:(id)a5 insertedTonePickerSectionItems:(id)a6 tonePickerSectionItemsWithUpdatedHeaderText:(id)a7 tonePickerSectionItemsWithUpdatedFooterText:(id)a8
{
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [(TKTonePickerController *)self delegate];
  if ([v20 count] && (objc_opt_respondsToSelector() & 1) != 0) {
    [v19 tonePickerController:self didDeletePickerRowItems:v20];
  }
  if ([v14 count] && (objc_opt_respondsToSelector() & 1) != 0) {
    [v19 tonePickerController:self didDeleteTonePickerSectionItems:v14];
  }
  if ([v15 count] && (objc_opt_respondsToSelector() & 1) != 0) {
    [v19 tonePickerController:self didInsertPickerRowItems:v15];
  }
  if ([v16 count] && (objc_opt_respondsToSelector() & 1) != 0) {
    [v19 tonePickerController:self didInsertTonePickerSectionItems:v16];
  }
  if ([v17 count] && (objc_opt_respondsToSelector() & 1) != 0) {
    [v19 tonePickerController:self didUpdateHeaderTextOfTonePickerSectionItems:v17];
  }
  if ([v18 count] && (objc_opt_respondsToSelector() & 1) != 0) {
    [v19 tonePickerController:self didUpdateFooterTextOfTonePickerSectionItems:v18];
  }
}

- (BOOL)canShowStore
{
  toneStoreDownloadController = self->_toneStoreDownloadController;
  unint64_t toneTypes = self->_toneTypes;
  if ((toneTypes & 0x10) != 0)
  {
    BOOL v8 = [MEMORY[0x263F7FC80] sharedCapabilitiesManager];
    char v4 = [v8 isRingtoneStoreAvailable];

    if ((self->_toneTypes & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    char v4 = 0;
    if ((toneTypes & 2) != 0)
    {
LABEL_3:
      BOOL v5 = [MEMORY[0x263F7FC80] sharedCapabilitiesManager];
      char v6 = [v5 isAlertToneStoreAvailable];

      goto LABEL_6;
    }
  }
  char v6 = 0;
LABEL_6:
  if (toneStoreDownloadController) {
    return v4 | v6;
  }
  else {
    return 0;
  }
}

- (void)setToneStoreDownloadController:(id)a3
{
  BOOL v5 = (TLToneStoreDownloadController *)a3;
  toneStoreDownloadController = self->_toneStoreDownloadController;
  if (toneStoreDownloadController != v5)
  {
    uint64_t v7 = v5;
    [(TLToneStoreDownloadController *)toneStoreDownloadController removeObserver:self];
    objc_storeStrong((id *)&self->_toneStoreDownloadController, a3);
    [(TLToneStoreDownloadController *)self->_toneStoreDownloadController addObserver:self];
    toneStoreDownloadController = (TLToneStoreDownloadController *)[(TKTonePickerController *)self _enableToneStoreDownloadItemIfAppropriate];
    BOOL v5 = v7;
  }

  MEMORY[0x270F9A758](toneStoreDownloadController, v5);
}

- (void)storeAccountNameDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  char v4 = __52__TKTonePickerController_storeAccountNameDidChange___block_invoke;
  BOOL v5 = &unk_2645898B8;
  char v6 = self;
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3)) {
    v4((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __52__TKTonePickerController_storeAccountNameDidChange___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _enableToneStoreDownloadItemIfAppropriate];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _didUpdateFooterTextForToneStoreGroup];
  }
  return result;
}

- (void)didFinishCheckingForAvailableToneStoreDownloads:(BOOL)a3
{
  char v4 = __74__TKTonePickerController_didFinishCheckingForAvailableToneStoreDownloads___block_invoke;
  BOOL v5 = &unk_2645898E0;
  BOOL v7 = a3;
  char v6 = self;
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", MEMORY[0x263EF8330], 3221225472)) {
    v4((uint64_t)&v3);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], &v3);
  }
}

uint64_t __74__TKTonePickerController_didFinishCheckingForAvailableToneStoreDownloads___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _disableToneStoreDownloadItem];
  }
  return result;
}

- (void)toneStoreDownloadsDidStart:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x263EF8330];
  BOOL v8 = __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke;
  uint64_t v9 = &unk_264589980;
  BOOL v10 = self;
  id v11 = v4;
  BOOL v5 = (void *)MEMORY[0x263F08B88];
  id v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472)) {
    v8((uint64_t)&v7);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], &v7);
  }
}

void __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = 2;
  [*(id *)(a1 + 32) _didUpdateToneStoreDownloadItem];
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_2;
  v3[3] = &unk_264589980;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  [v2 _performBatchUpdates:v3 completion:0];
}

void __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if (!*(void *)(*(void *)(a1 + 32) + 40))
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v12 = [v11 identifier];
        [*(id *)(*(void *)(a1 + 32) + 40) setObject:v11 forKey:v12];
        [v2 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v8);
  }

  id v13 = (void *)[*(id *)(*(void *)(a1 + 32) + 88) copy];
  id v14 = (void *)[*(id *)(*(void *)(a1 + 32) + 104) copy];
  [*(id *)(a1 + 32) _reloadTonesForExternalChange:0 shouldSkipDelegateFullReload:1];
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v17 = [*(id *)(a1 + 32) _indexPathForFirstToneGroup];
  uint64_t v18 = objc_msgSend(v17, "tk_section");

  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = *(void **)(v19 + 88);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_3;
  v26[3] = &unk_264589958;
  id v31 = v15;
  uint64_t v32 = v18;
  v26[4] = v19;
  id v27 = v14;
  id v28 = v16;
  id v29 = v13;
  id v30 = v2;
  id v21 = v15;
  id v22 = v2;
  id v23 = v13;
  id v24 = v16;
  id v25 = v14;
  [v20 enumerateObjectsUsingBlock:v26];
  [*(id *)(a1 + 32) _applyBatchUpdatesWithDeletedPickerRowItems:MEMORY[0x263EFFA68] deletedTonePickerSectionItems:MEMORY[0x263EFFA68] insertedPickerRowItems:v21 insertedTonePickerSectionItems:v24 tonePickerSectionItemsWithUpdatedHeaderText:MEMORY[0x263EFFA68] tonePickerSectionItemsWithUpdatedFooterText:MEMORY[0x263EFFA68]];
}

void __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) pickerItemForSection:*(void *)(a1 + 80) + a3];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 104) objectAtIndex:a3];
  uint64_t v8 = [*(id *)(a1 + 40) indexOfObject:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 48) addObject:v6];
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 56) objectAtIndex:v8];
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v42 = 0;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_4;
    v38[3] = &unk_264589908;
    v38[4] = &v39;
    [v9 enumerateObjectsUsingBlock:v38];
    uint64_t v34 = 0;
    long long v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_5;
    v23[3] = &unk_264589930;
    id v28 = &v34;
    id v29 = &v30;
    id v10 = *(id *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 32);
    id v24 = v10;
    uint64_t v25 = v11;
    id v12 = v6;
    id v26 = v12;
    id v27 = *(id *)(a1 + 72);
    [v5 enumerateObjectsUsingBlock:v23];
    uint64_t v13 = v35[3];
    uint64_t v14 = v40[3];
    if (v13 != v14)
    {
      if (v13 != v14 + 1)
      {
        id v15 = TLLogGeneral();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

        if (v16)
        {
          id v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m"];
          uint64_t v18 = TLLogGeneral();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [v17 lastPathComponent];
            id v20 = [MEMORY[0x263F08B88] callStackSymbols];
            *(_DWORD *)buf = 136381443;
            int v44 = "-[TKTonePickerController toneStoreDownloadsDidStart:]_block_invoke_3";
            __int16 v45 = 2113;
            id v46 = v19;
            __int16 v47 = 2049;
            uint64_t v48 = 2240;
            __int16 v49 = 2113;
            id v50 = v20;
            _os_log_impl(&dword_22107E000, v18, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
          }
        }
        else
        {
          id v17 = TLLogGeneral();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
          }
        }

        id v21 = TLLogGeneral();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_3_cold_1();
        }
      }
      id v22 = [*(id *)(a1 + 32) _pickerRowItemAtIndex:v31[3] inSectionForItem:v12];
      [*(id *)(a1 + 72) addObject:v22];
    }
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v39, 8);
  }
}

uint64_t __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isEqualToString:&stru_26D2E1860];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

void __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if ([v6 isEqualToString:&stru_26D2E1860])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a3;
  }
  else if ([*(id *)(a1 + 32) containsObject:v6])
  {
    id v5 = [*(id *)(a1 + 40) _pickerRowItemAtIndex:a3 inSectionForItem:*(void *)(a1 + 48)];
    [*(id *)(a1 + 56) addObject:v5];
  }
}

- (void)toneStoreDownloadsDidProgress:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = __56__TKTonePickerController_toneStoreDownloadsDidProgress___block_invoke;
  uint64_t v9 = &unk_264589980;
  id v10 = self;
  id v11 = v4;
  id v5 = (void *)MEMORY[0x263F08B88];
  id v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472)) {
    v8((uint64_t)&v7);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], &v7);
  }
}

void __56__TKTonePickerController_toneStoreDownloadsDidProgress___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _indexPathForFirstToneGroup];
  uint64_t v14 = objc_msgSend(v2, "tk_section");

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v3)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v6 = [v5 identifier];
        uint64_t v20 = 0;
        id v21 = &v20;
        uint64_t v22 = 0x3032000000;
        id v23 = __Block_byref_object_copy_;
        id v24 = __Block_byref_object_dispose_;
        id v25 = 0;
        uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 88);
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __56__TKTonePickerController_toneStoreDownloadsDidProgress___block_invoke_151;
        v15[3] = &unk_2645899A8;
        id v8 = v6;
        uint64_t v9 = *(void *)(a1 + 32);
        id v16 = v8;
        uint64_t v17 = v9;
        uint64_t v18 = &v20;
        uint64_t v19 = v14;
        [v7 enumerateObjectsUsingBlock:v15];
        id v10 = (void *)v21[5];
        if (v10)
        {
          [v5 downloadProgress];
          objc_msgSend(v10, "_setDownloadProgress:");
          id v11 = [*(id *)(a1 + 32) delegate];
          if (objc_opt_respondsToSelector()) {
            [v11 tonePickerController:*(void *)(a1 + 32) didUpdateDownloadProgressOfTonePickerItem:v21[5]];
          }
        }
        _Block_object_dispose(&v20, 8);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v3);
  }
}

uint64_t __56__TKTonePickerController_toneStoreDownloadsDidProgress___block_invoke_151(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 indexOfObject:*(void *)(a1 + 32)];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = result;
    uint64_t v9 = [*(id *)(a1 + 40) _cachedPickerItemForSection:*(void *)(a1 + 56) + a3];
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v12 = v9;
      id v11 = [*(id *)(a1 + 40) _cachedPickerRowItemAtIndex:v8 inSectionForItem:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v11);
      }

      uint64_t v10 = v12;
    }
    *a4 = 1;
    return MEMORY[0x270F9A758](v9, v10);
  }
  return result;
}

- (void)toneStoreDownloadsDidFinish:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke;
  uint64_t v9 = &unk_264589980;
  uint64_t v10 = self;
  id v11 = v4;
  id v5 = (void *)MEMORY[0x263F08B88];
  id v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472)) {
    v8((uint64_t)&v7);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], &v7);
  }
}

uint64_t __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _indexPathForFirstToneGroup];
  uint64_t v31 = objc_msgSend(v2, "tk_section");

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v3)
  {
    uint64_t v30 = *(void *)v43;
    *(void *)&long long v4 = 136381443;
    long long v28 = v4;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "identifier", v28);
        uint64_t v8 = [v6 toneIdentifier];
        if (!v8)
        {
          uint64_t v9 = TLLogGeneral();
          BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

          if (v10)
          {
            id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m"];
            uint64_t v12 = TLLogGeneral();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = [v11 lastPathComponent];
              uint64_t v14 = [MEMORY[0x263F08B88] callStackSymbols];
              *(_DWORD *)buf = v28;
              *(void *)&uint8_t buf[4] = "-[TKTonePickerController toneStoreDownloadsDidFinish:]_block_invoke";
              *(_WORD *)&buf[12] = 2113;
              *(void *)&buf[14] = v13;
              *(_WORD *)&buf[22] = 2049;
              uint64_t v47 = 2297;
              LOWORD(v48) = 2113;
              *(void *)((char *)&v48 + 2) = v14;
              _os_log_impl(&dword_22107E000, v12, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
            }
          }
          else
          {
            id v11 = TLLogGeneral();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke_cold_2(&v40, v41, v11);
            }
          }

          id v15 = TLLogGeneral();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke_cold_1(&v38, v39, v15);
          }
        }
        [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:v7];
        id v16 = *(void **)(*(void *)(a1 + 32) + 48);
        if (!v16)
        {
          id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = *(void **)(v18 + 48);
          *(void *)(v18 + 48) = v17;

          id v16 = *(void **)(*(void *)(a1 + 32) + 48);
        }
        [v16 setObject:v6 forKey:v8];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        uint64_t v47 = (uint64_t)__Block_byref_object_copy_;
        *(void *)&long long v48 = __Block_byref_object_dispose_;
        *((void *)&v48 + 1) = 0;
        uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 88);
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke_154;
        v32[3] = &unk_2645899D0;
        id v21 = v7;
        uint64_t v22 = *(void *)(a1 + 32);
        id v33 = v21;
        uint64_t v34 = v22;
        uint64_t v36 = buf;
        uint64_t v37 = v31;
        id v23 = v8;
        id v35 = v23;
        [v20 enumerateObjectsUsingBlock:v32];
        id v24 = *(void **)(*(void *)&buf[8] + 40);
        if (v24)
        {
          [v24 _setShouldPreventSelection:0];
          LODWORD(v25) = 1.0;
          [*(id *)(*(void *)&buf[8] + 40) _setDownloadProgress:v25];
          long long v26 = [*(id *)(a1 + 32) delegate];
          if (objc_opt_respondsToSelector()) {
            [v26 tonePickerController:*(void *)(a1 + 32) didUpdateDownloadProgressOfTonePickerItem:*(void *)(*(void *)&buf[8] + 40)];
          }
        }
        _Block_object_dispose(buf, 8);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v3);
  }

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) count];
  if (!result) {
    return [*(id *)(a1 + 32) _disableToneStoreDownloadItem];
  }
  return result;
}

void __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke_154(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v7 = [v11 indexOfObject:*(void *)(a1 + 32)];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [*(id *)(a1 + 40) _cachedPickerItemForSection:*(void *)(a1 + 64) + a3];
    if (v9)
    {
      BOOL v10 = [*(id *)(a1 + 40) _cachedPickerRowItemAtIndex:v8 inSectionForItem:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v10);
      }
    }
    [v11 replaceObjectAtIndex:v8 withObject:*(void *)(a1 + 48)];
    *a4 = 1;
  }
}

- (void)_didUpdateFooterTextForToneStoreGroup
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TKTonePickerController *)self _indexPathForToneStoreGroup];
  uint64_t v4 = objc_msgSend(v3, "tk_section");

  id v5 = [(TKTonePickerController *)self _cachedPickerItemForSection:v4];
  if (v5)
  {
    id v6 = [(TKTonePickerController *)self _footerTextForToneStoreGroup];
    [v5 _setFooterText:v6];
    v8[0] = v5;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    [(TKTonePickerController *)self _applyBatchUpdatesWithDeletedPickerRowItems:MEMORY[0x263EFFA68] deletedTonePickerSectionItems:MEMORY[0x263EFFA68] insertedPickerRowItems:MEMORY[0x263EFFA68] insertedTonePickerSectionItems:MEMORY[0x263EFFA68] tonePickerSectionItemsWithUpdatedHeaderText:MEMORY[0x263EFFA68] tonePickerSectionItemsWithUpdatedFooterText:v7];
  }
}

- (void)_didUpdateToneStoreDownloadItem
{
  uint64_t v3 = [(TKTonePickerController *)self _indexPathForToneStoreDownloadItem];
  if (v3)
  {
    id v11 = v3;
    uint64_t v4 = -[TKTonePickerController _cachedPickerItemForSection:](self, "_cachedPickerItemForSection:", objc_msgSend(v3, "tk_section"));
    if (v4)
    {
      uint64_t v5 = objc_msgSend(v11, "tk_row");
      id v6 = [(TKTonePickerController *)self _cachedPickerRowItemAtIndex:v5 inSectionForItem:v4];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;
        [(TKTonePickerController *)self _uncachePickerRowItemAtIndex:v5 inSectionForItem:v4];
        uint64_t v8 = [(TKTonePickerController *)self _pickerRowItemAtIndex:v5 inSectionForItem:v4];
        [v4 _setParentTonePickerController:self];
        uint64_t v9 = [v8 text];
        [v7 _setText:v9];

        objc_msgSend(v7, "_setShouldTintText:", objc_msgSend(v8, "shouldTintText"));
        objc_msgSend(v7, "_setNeedsActivityIndicator:", objc_msgSend(v8, "needsActivityIndicator"));
        objc_msgSend(v7, "_setShouldPreventSelection:", objc_msgSend(v8, "shouldPreventSelection"));
        [(TKTonePickerController *)self _cachePickerRowItem:v7 atIndex:v5 inSectionForItem:v4];
        BOOL v10 = [(TKTonePickerController *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v10 tonePickerController:self didUpdateTonePickerItem:v7];
        }
      }
    }

    uint64_t v3 = v11;
  }
}

- (BOOL)_enableToneStoreDownloadItemIfAppropriate
{
  if (!self->_isToneStoreDownloadButtonAllowed) {
    return 0;
  }
  if (self->_toneStoreDownloadButtonState != 3) {
    return 0;
  }
  uint64_t v3 = [(TLToneStoreDownloadController *)self->_toneStoreDownloadController storeAccountName];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  self->_toneStoreDownloadButtonState = 0;
  [(TKTonePickerController *)self _invalidatePickerItemCaches];
  [(TKTonePickerController *)self _didReloadTones];
  return 1;
}

- (void)_disableToneStoreDownloadItem
{
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__TKTonePickerController__disableToneStoreDownloadItem__block_invoke;
  v17[3] = &unk_2645898B8;
  v17[4] = self;
  uint64_t v3 = MEMORY[0x223C781A0](v17, a2);
  uint64_t v4 = (void (**)(void))v3;
  if (self->_toneStoreDownloadButtonState == 3)
  {
    if (v3) {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
    }
  }
  else
  {
    uint64_t v5 = [(TKTonePickerController *)self _indexPathForToneStoreDownloadItem];
    id v6 = v5;
    if (v5
      && (-[TKTonePickerController _cachedPickerItemForSection:](self, "_cachedPickerItemForSection:", objc_msgSend(v5, "tk_section")), (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:](self, "_pickerRowItemAtIndex:inSectionForItem:", objc_msgSend(v6, "tk_row"), v7);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __55__TKTonePickerController__disableToneStoreDownloadItem__block_invoke_2;
      v14[3] = &unk_2645899F8;
      v14[4] = self;
      id v15 = v8;
      id v16 = v9;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __55__TKTonePickerController__disableToneStoreDownloadItem__block_invoke_3;
      v12[3] = &unk_264589A20;
      v12[4] = self;
      uint64_t v13 = v4;
      id v10 = v9;
      id v11 = v8;
      [(TKTonePickerController *)self _performBatchUpdates:v14 completion:v12];
    }
    else
    {
      self->_toneStoreDownloadButtonState = 3;
      self->_isToneStoreDownloadButtonAllowed = 0;
      if (v4) {
        v4[2](v4);
      }
    }
  }
}

uint64_t __55__TKTonePickerController__disableToneStoreDownloadItem__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  id v6 = *(void **)(a1 + 32);

  return [v6 _reloadTonesForExternalChange:1 shouldSkipDelegateFullReload:0];
}

void __55__TKTonePickerController__disableToneStoreDownloadItem__block_invoke_2(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(a1 + 32) + 32) = 3;
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = 0;
  objc_msgSend(*(id *)(a1 + 40), "_setNumberOfChildren:", objc_msgSend(*(id *)(a1 + 40), "numberOfChildren") - 1);
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = *(void *)(a1 + 48);
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v2 _applyBatchUpdatesWithDeletedPickerRowItems:v3 deletedTonePickerSectionItems:MEMORY[0x263EFFA68] insertedPickerRowItems:MEMORY[0x263EFFA68] insertedTonePickerSectionItems:MEMORY[0x263EFFA68] tonePickerSectionItemsWithUpdatedHeaderText:MEMORY[0x263EFFA68] tonePickerSectionItemsWithUpdatedFooterText:MEMORY[0x263EFFA68]];
}

uint64_t __55__TKTonePickerController__disableToneStoreDownloadItem__block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v1 = objc_opt_class();

  return [v1 _updateLatestRedownloadAllTonesDate];
}

- (id)_footerTextForToneStoreGroup
{
  if (self->_toneStoreDownloadButtonState)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v4 = NSString;
    uint64_t v5 = TLLocalizedString();
    id v6 = [(TLToneStoreDownloadController *)self->_toneStoreDownloadController storeAccountName];
    uint64_t v2 = objc_msgSend(v4, "stringWithFormat:", v5, v6);
  }

  return v2;
}

- (id)_nameForToneIdentifier:(id)a3
{
  id v4 = a3;
  if (v4
    && (([(NSMutableDictionary *)self->_activeToneStoreDownloadsByIdentifier objectForKey:v4],
         (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([(NSMutableDictionary *)self->_finishedToneStoreDownloadsByIdentifier objectForKey:v4],
         (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    id v6 = [v5 name];
  }
  else
  {
    id v6 = [(TLToneManager *)self->_toneManager nameForToneIdentifier:v4];
  }

  return v6;
}

- (void)_goToStore
{
  [(TKTonePickerController *)self stopPlayingWithFadeOut:0];
  BOOL v3 = [(TKTonePickerController *)self _behavesAsRingtonePicker];
  toneStoreDownloadController = self->_toneStoreDownloadController;
  if (v3)
  {
    [(TLToneStoreDownloadController *)toneStoreDownloadController openRingtoneStore];
  }
  else
  {
    [(TLToneStoreDownloadController *)toneStoreDownloadController openAlertToneStore];
  }
}

- (void)_redownloadAllTones
{
  self->_toneStoreDownloadButtonState = 1;
  self->_shouldFreezeContentsOriginatingFromToneManager = 1;
  [(TKTonePickerController *)self _didUpdateFooterTextForToneStoreGroup];
  [(TKTonePickerController *)self _didUpdateToneStoreDownloadItem];
  toneStoreDownloadController = self->_toneStoreDownloadController;

  [(TLToneStoreDownloadController *)toneStoreDownloadController redownloadAllTones];
}

+ (id)_latestRedownloadAllTonesDate
{
  CFStringRef v2 = (const __CFString *)[MEMORY[0x263F7FC88] copySharedResourcesPreferencesDomain];
  if (v2)
  {
    CFStringRef v3 = v2;
    CFPropertyListRef v4 = CFPreferencesCopyAppValue(@"tonePickerLatestRedownloadAllDate", v2);
    uint64_t v5 = (void *)v4;
    if (v4)
    {
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 != CFDateGetTypeID())
      {
        CFRelease(v5);
        uint64_t v5 = 0;
      }
    }
    CFRelease(v3);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (void)_updateLatestRedownloadAllTonesDate
{
  value = [MEMORY[0x263EFF910] date];
  CFStringRef v2 = (const __CFString *)[MEMORY[0x263F7FC88] copySharedResourcesPreferencesDomain];
  if (v2)
  {
    CFStringRef v3 = v2;
    CFPreferencesSetAppValue(@"tonePickerLatestRedownloadAllDate", value, v2);
    CFPreferencesSynchronize(v3, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    CFRelease(v3);
  }
}

- (void)_playToneWithIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = [(TKTonePickerController *)self defaultToneIdentifier];

    if (![v5 length])
    {
      CFTypeID v6 = TLLogGeneral();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

      if (v7)
      {
        uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m"];
        uint64_t v9 = TLLogGeneral();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [v8 lastPathComponent];
          id v11 = [MEMORY[0x263F08B88] callStackSymbols];
          *(_DWORD *)buf = 136381443;
          double v25 = "-[TKTonePickerController _playToneWithIdentifier:]";
          __int16 v26 = 2113;
          long long v27 = v10;
          __int16 v28 = 2049;
          uint64_t v29 = 2517;
          __int16 v30 = 2113;
          uint64_t v31 = v11;
          _os_log_impl(&dword_22107E000, v9, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
        }
      }
      else
      {
        uint64_t v8 = TLLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
        }
      }

      uint64_t v12 = TLLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
      }
    }
  }
  uint64_t v13 = [(TKTonePickerController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v13 tonePickerController:self willBeginPlaybackOfToneWithIdentifier:v5];
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F7FC70]) initWithType:self->_alertType];
  [v14 setTopic:self->_topic];
  [v14 setToneIdentifier:v5];
  [v14 setVibrationIdentifier:self->_selectedVibrationIdentifier];
  [v14 setShouldRepeat:0];
  [v14 setForPreview:1];
  [v14 setTargetDevice:self->_targetDevice];
  id v15 = self->_playingAlert;
  id v16 = [MEMORY[0x263F7FC68] alertWithConfiguration:v14];
  playingAlert = self->_playingAlert;
  self->_playingAlert = v16;

  uint64_t v18 = self->_playingAlert;
  if (v18)
  {
    objc_initWeak((id *)buf, v18);
    objc_initWeak(&location, self);
    uint64_t v19 = self->_playingAlert;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __50__TKTonePickerController__playToneWithIdentifier___block_invoke;
    v20[3] = &unk_264589A70;
    objc_copyWeak(&v21, (id *)buf);
    objc_copyWeak(&v22, &location);
    [(TLAlert *)v19 playWithCompletionHandler:v20];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(TLAlert *)v15 stop];
  }
}

void __50__TKTonePickerController__playToneWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __50__TKTonePickerController__playToneWithIdentifier___block_invoke_2;
  uint64_t v9 = &unk_264589A48;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  objc_copyWeak(&v11, (id *)(a1 + 40));
  uint64_t v5 = &v6;
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", v6, v7)) {
    v8((uint64_t)v5);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void __50__TKTonePickerController__playToneWithIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [v2 _didFinishPlayingAlert:WeakRetained];
  }
}

- (void)_togglePlayForToneWithIdentifier:(id)a3
{
  if (self->_playingAlert) {
    [(TKTonePickerController *)self stopPlayingWithFadeOut:0];
  }
  else {
    [(TKTonePickerController *)self _playToneWithIdentifier:a3];
  }
}

- (BOOL)stopPlayingWithFadeOut:(BOOL)a3
{
  if (a3) {
    double v4 = 0.5;
  }
  else {
    double v4 = 0.0;
  }
  playingAlert = self->_playingAlert;
  BOOL v6 = playingAlert != 0;
  if (playingAlert)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F7FC78]);
    [v7 setFadeOutDuration:v4];
    [(TLAlert *)self->_playingAlert stopWithOptions:v7];
  }
  uint64_t v8 = [(TKTonePickerController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v9 = [v8 tonePickerControllerDidStopPlaying:self withFadeOutDuration:v4];
    if (playingAlert) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v9;
    }
  }

  return v6;
}

- (void)_didFinishPlayingAlert:(id)a3
{
  double v4 = (TLAlert *)a3;
  if (self->_playingAlert == v4)
  {
    self->_playingAlert = 0;
    uint64_t v5 = v4;

    double v4 = v5;
  }
}

- (void)finishedWithPicker
{
}

- (BOOL)_showsMedia
{
  CFStringRef v3 = [(TKTonePickerController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 tonePickerControllerShouldShowMedia:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setMediaAtTop:(BOOL)a3
{
  if (self->_mediaAtTop != a3)
  {
    self->_mediaAtTop = a3;
    [(TKTonePickerController *)self _invalidatePickerItemCaches];
    [(TKTonePickerController *)self _didReloadTones];
  }
}

- (unint64_t)_mediaItemsCount
{
  CFStringRef v3 = [(TKTonePickerController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 numberOfMediaItemsInTonePickerController:self];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_identifierOfMediaItemAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(TKTonePickerController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [v5 tonePickerController:self identifierOfMediaItemAtIndex:a3];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)_indexOfMediaItemWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TKTonePickerController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v6 = [v5 tonePickerController:self indexOfMediaItemWithIdentifier:v4];
  }
  else {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)_didSelectMediaItemWithIdentifier:(id)a3
{
  id v5 = a3;
  id v4 = [(TKTonePickerController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 tonePickerController:self selectedMediaItemWithIdentifier:v5];
  }
}

- (void)_reloadMediaItems
{
  id v3 = [(TKTonePickerController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 tonePickerControllerRequestsMediaItemsRefresh:self];
  }
}

- (void)setShowsVibrations:(BOOL)a3
{
  if (a3)
  {
    id v4 = [MEMORY[0x263F7FC80] sharedCapabilitiesManager];
    int v5 = [v4 hasVibratorCapability];
  }
  else
  {
    int v5 = 0;
  }
  if (self->_showsVibrations != v5)
  {
    self->_BOOL showsVibrations = v5;
    id v9 = [(TKTonePickerController *)self _selectedToneIndexPath];
    uint64_t v6 = objc_msgSend(v9, "tk_section");
    if (v5) {
      uint64_t v7 = v6 + 1;
    }
    else {
      uint64_t v7 = v6 - 1;
    }
    uint64_t v8 = objc_msgSend(MEMORY[0x263F088C8], "tk_indexPathForRow:inSection:", objc_msgSend(v9, "tk_row"), v7);
    [(TKTonePickerController *)self _setSelectedToneIndexPath:v8];

    [(TKTonePickerController *)self _invalidatePickerItemCaches];
    [(TKTonePickerController *)self _didReloadTones];
    if (v5) {
      [(TKTonePickerController *)self _registerForUserGeneratedVibrationsDidChangeNotification];
    }
    else {
      [(TKTonePickerController *)self _unregisterForUserGeneratedVibrationsDidChangeNotification];
    }
  }
}

- (void)setSelectedVibrationIdentifier:(id)a3
{
}

- (void)_setSelectedVibrationIdentifier:(id)a3 explicitlySet:(BOOL)a4
{
}

- (void)_setSelectedVibrationIdentifier:(id)a3 forceUpdatingVibrationName:(BOOL)a4 explicitlySet:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v8 = (NSString *)a3;
  selectedVibrationIdentifier = self->_selectedVibrationIdentifier;
  uint64_t v14 = v8;
  if (selectedVibrationIdentifier == v8
    || (selectedVibrationIdentifier = (NSString *)[(NSString *)selectedVibrationIdentifier isEqualToString:v8], uint64_t v8 = v14, (selectedVibrationIdentifier & 1) != 0))
  {
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = (NSString *)[(NSString *)v14 copy];
    id v11 = self->_selectedVibrationIdentifier;
    self->_selectedVibrationIdentifier = v10;

    uint64_t v8 = v14;
  }
  if (self->_showsVibrations)
  {
    uint64_t v12 = [(TKTonePickerController *)self _nameOfSelectedVibrationIdentifier];
    uint64_t v13 = [(TKTonePickerController *)self _indexPathForVibrationGroup];
    [(TKTonePickerController *)self _didUpdateDetailText:v12 ofPickerItemForRowAtIndexPath:v13];

    uint64_t v8 = v14;
  }
LABEL_8:
  self->_selectedVibrationIdentifierWasExplicitlySet = a5;

  MEMORY[0x270F9A758](selectedVibrationIdentifier, v8);
}

- (void)_resetSelectedVibrationIdentifierForcingUpdatingVibrationName:(BOOL)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F7FCA0], "sharedVibrationManager", a3);
  int64_t alertType = self->_alertType;
  BOOL v6 = [(TKTonePickerController *)self topic];
  id v9 = [v4 _currentVibrationIdentifierForAlertType:alertType topic:v6];

  if ([MEMORY[0x263F7FC68] _currentOverridePolicyForType:self->_alertType] == 1)
  {
    id v7 = (id)*MEMORY[0x263F7FD78];

    id v8 = v7;
  }
  else
  {
    id v8 = v9;
  }
  id v10 = v8;
  [(TKTonePickerController *)self _setSelectedVibrationIdentifier:v8 forceUpdatingVibrationName:1 explicitlySet:0];
}

- (id)_sanitizedSelectedVibrationIdentifierAllowingNilForDefault:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = self->_selectedVibrationIdentifier;
  BOOL v6 = v5;
  if ([(NSString *)v5 length])
  {
    id v7 = [(TKTonePickerController *)self selectedToneIdentifier];
    if (![v7 length])
    {
      uint64_t v8 = [(TKTonePickerController *)self defaultToneIdentifier];

      id v7 = (void *)v8;
    }
    char v14 = 0;
    id v9 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
    int64_t alertType = self->_alertType;
    id v11 = [(TKTonePickerController *)self topic];
    BOOL v6 = objc_msgSend(v9, "_sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:didFallbackToCurrentVibrationIdentifier:", v5, alertType, v11, -[TKTonePickerController targetDevice](self, "targetDevice"), v7, &v14);

    if (!v3) {
      goto LABEL_9;
    }
    if (v14)
    {
      uint64_t v12 = v6;
    }
    else
    {
      if ((unint64_t)(self->_alertType - 13) > 1) {
        goto LABEL_9;
      }
      uint64_t v12 = objc_msgSend(v9, "defaultVibrationIdentifierForAlertType:");
      if (![v6 isEqualToString:v12])
      {
LABEL_8:

LABEL_9:
        goto LABEL_10;
      }
    }
    BOOL v6 = 0;
    goto LABEL_8;
  }
LABEL_10:

  return v6;
}

- (id)_nameOfSelectedVibrationIdentifier
{
  id v2 = [(TKTonePickerController *)self _sanitizedSelectedVibrationIdentifierAllowingNilForDefault:1];
  if ([v2 length])
  {
    BOOL v3 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
    id v4 = [v3 nameOfVibrationWithIdentifier:v2];
  }
  else
  {
    id v4 = TLLocalizedString();
  }

  return v4;
}

- (void)_registerForUserGeneratedVibrationsDidChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F7FD80];

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_TKTonePickerControllerHandleUserGeneratedVibrationsDidChangeNotification, v4, 0, (CFNotificationSuspensionBehavior)1026);
}

- (void)_unregisterForUserGeneratedVibrationsDidChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F7FD80];

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
}

- (void)_updateDetailTextOfVibrationItem
{
  if (self->_showsVibrations)
  {
    id v4 = [(TKTonePickerController *)self _nameOfSelectedVibrationIdentifier];
    BOOL v3 = [(TKTonePickerController *)self _indexPathForVibrationGroup];
    [(TKTonePickerController *)self _didUpdateDetailText:v4 ofPickerItemForRowAtIndexPath:v3];
  }
}

- (id)_annotatedNameForToneIdentifier:(id)a3
{
  id v4 = [(TLToneManager *)self->_toneManager _aliasForToneIdentifier:a3];
  int v5 = [(TKTonePickerController *)self _nameForToneIdentifier:v4];
  if (!self->_showsDefault
    && (self->_alertType != 13 || ![(NSString *)self->_topic isEqualToString:*MEMORY[0x263F7FCC0]]))
  {
    toneManager = self->_toneManager;
    uint64_t v8 = [(TKTonePickerController *)self defaultToneIdentifier];
    id v9 = [(TLToneManager *)toneManager _aliasForToneIdentifier:v8];
    int v10 = [v4 isEqualToString:v9];

    if (v10)
    {
      id v11 = NSString;
      uint64_t v12 = TLLocalizedString();
      uint64_t v13 = objc_msgSend(v11, "stringWithFormat:", v12, v5);

      int v5 = (void *)v13;
    }
  }

  return v5;
}

- (void)_didReloadTones
{
  id v3 = [(TKTonePickerController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 tonePickerControllerDidReloadTones:self];
  }
}

- (void)_didSelectToneWithIdentifier:(id)a3
{
  id v5 = a3;
  id v4 = [(TKTonePickerController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 tonePickerController:self selectedToneWithIdentifier:v5];
  }
}

- (void)_didUpdateCheckedStatus:(BOOL)a3 ofPickerItemForRowAtIndexPath:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  -[TKTonePickerController pickerItemForSection:](self, "pickerItemForSection:", objc_msgSend(v6, "tk_section"));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend(v6, "tk_row");

  uint64_t v8 = [v11 childItemAtIndex:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    [v9 _setShowsCheckmark:v4];
    int v10 = [(TKTonePickerController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v10 tonePickerController:self didUpdateCheckedStatus:v4 ofTonePickerItem:v9];
    }
  }
}

- (void)_didUpdateDetailText:(id)a3 ofPickerItemForRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = -[TKTonePickerController pickerItemForSection:](self, "pickerItemForSection:", objc_msgSend(v6, "tk_section"));
  uint64_t v8 = objc_msgSend(v6, "tk_row");

  id v9 = [v7 childItemAtIndex:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    [v10 _setDetailText:v12];
    id v11 = [(TKTonePickerController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v11 tonePickerController:self didUpdateDetailText:v12 ofTonePickerItem:v10];
    }
  }
}

- (void)_didUpdateCheckedStatus:(BOOL)a3 ofToneClassicsPickerItem:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  [v7 _setShowsCheckmark:v4];
  id v6 = [(TKTonePickerController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 tonePickerController:self didUpdateCheckedStatus:v4 ofTonePickerItem:v7];
  }
}

- (void)_resetSelectedClassicRingtoneIndex
{
  unint64_t v3 = [(TKTonePickerController *)self _selectedClassicRingtoneIndex];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = v3;
    [(TKTonePickerController *)self _setSelectedClassicRingtoneIndex:0x7FFFFFFFFFFFFFFFLL];
    id v8 = [(TKTonePickerController *)self _indexPathForToneWithIdentifier:@"<classic_ringtone_identifier>"];
    id v5 = -[TKTonePickerController pickerItemForSection:](self, "pickerItemForSection:", objc_msgSend(v8, "tk_section"));
    id v6 = objc_msgSend(v5, "childItemAtIndex:", objc_msgSend(v8, "tk_row"));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 childItemAtIndex:v4];
      [(TKTonePickerController *)self _didUpdateCheckedStatus:0 ofToneClassicsPickerItem:v7];
    }
  }
}

- (void)_resetSelectedClassicAlertToneIndex
{
  unint64_t v3 = [(TKTonePickerController *)self _selectedClassicAlertToneIndex];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = v3;
    [(TKTonePickerController *)self _setSelectedClassicAlertToneIndex:0x7FFFFFFFFFFFFFFFLL];
    id v8 = [(TKTonePickerController *)self _indexPathForToneWithIdentifier:@"<classic_alert_tone_identifier>"];
    id v5 = -[TKTonePickerController pickerItemForSection:](self, "pickerItemForSection:", objc_msgSend(v8, "tk_section"));
    id v6 = objc_msgSend(v5, "childItemAtIndex:", objc_msgSend(v8, "tk_row"));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 childItemAtIndex:v4];
      [(TKTonePickerController *)self _didUpdateCheckedStatus:0 ofToneClassicsPickerItem:v7];
    }
  }
}

- (void)_toneManagerContentsChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  unint64_t v4 = __54__TKTonePickerController__toneManagerContentsChanged___block_invoke;
  id v5 = &unk_2645898B8;
  id v6 = self;
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3)) {
    v4((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

unsigned char *__54__TKTonePickerController__toneManagerContentsChanged___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[56])
  {
    [result stopPlayingWithFadeOut:0];
    unint64_t v3 = *(void **)(a1 + 32);
    return (unsigned char *)[v3 _reloadTonesForExternalChange:1 shouldSkipDelegateFullReload:0];
  }
  return result;
}

- (void)_handleAlertOverridePolicyDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  unint64_t v4 = __74__TKTonePickerController__handleAlertOverridePolicyDidChangeNotification___block_invoke;
  id v5 = &unk_2645898B8;
  id v6 = self;
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3)) {
    v4((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

unsigned char *__74__TKTonePickerController__handleAlertOverridePolicyDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[26]) {
    return (unsigned char *)[result _resetSelectedVibrationIdentifierForcingUpdatingVibrationName:0];
  }
  return result;
}

- (TKTonePickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TKTonePickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)defaultToneIdentifier
{
  return self->_defaultToneIdentifier;
}

- (BOOL)showsDefault
{
  return self->_showsDefault;
}

- (BOOL)showsNone
{
  return self->_showsNone;
}

- (BOOL)isNoneAtTop
{
  return self->_noneAtTop;
}

- (NSString)noneString
{
  return self->_noneString;
}

- (BOOL)showsNothingSelected
{
  return self->_showsNothingSelected;
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (BOOL)showsToneStore
{
  return self->_showsToneStore;
}

- (BOOL)isMediaAtTop
{
  return self->_mediaAtTop;
}

- (BOOL)showsVibrations
{
  return self->_showsVibrations;
}

- (NSString)selectedVibrationIdentifier
{
  return self->_selectedVibrationIdentifier;
}

- (BOOL)showsIgnoreMute
{
  return self->_showsIgnoreMute;
}

- (BOOL)ignoreMute
{
  return self->_ignoreMute;
}

- (NSString)overrideFirstToneSectionTitle
{
  return self->_overrideFirstToneSectionTitle;
}

- (void)setOverrideFirstToneSectionTitle:(id)a3
{
}

- (TLToneStoreDownloadController)toneStoreDownloadController
{
  return self->_toneStoreDownloadController;
}

- (NSArray)_classicRingtoneIdentifiers
{
  return self->__classicRingtoneIdentifiers;
}

- (void)_setClassicRingtoneIdentifiers:(id)a3
{
}

- (NSArray)_classicAlertToneIdentifiers
{
  return self->__classicAlertToneIdentifiers;
}

- (void)_setClassicAlertToneIdentifiers:(id)a3
{
}

- (unint64_t)_selectedClassicRingtoneIndex
{
  return self->__selectedClassicRingtoneIndex;
}

- (void)_setSelectedClassicRingtoneIndex:(unint64_t)a3
{
  self->__selectedClassicRingtoneIndex = a3;
}

- (unint64_t)_selectedClassicAlertToneIndex
{
  return self->__selectedClassicAlertToneIndex;
}

- (void)_setSelectedClassicAlertToneIndex:(unint64_t)a3
{
  self->__selectedClassicAlertToneIndex = a3;
}

- (NSIndexPath)_selectedToneIndexPath
{
  return self->__selectedToneIndexPath;
}

- (void)_setSelectedToneIndexPath:(id)a3
{
}

- (BOOL)_behavesAsRingtonePicker
{
  return self->__behavesAsRingtonePicker;
}

- (void)_setBehavesAsRingtonePicker:(BOOL)a3
{
  self->__behavesAsRingtonePicker = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectedToneIndexPath, 0);
  objc_storeStrong((id *)&self->__classicAlertToneIdentifiers, 0);
  objc_storeStrong((id *)&self->__classicRingtoneIdentifiers, 0);
  objc_storeStrong((id *)&self->_toneStoreDownloadController, 0);
  objc_storeStrong((id *)&self->_overrideFirstToneSectionTitle, 0);
  objc_storeStrong((id *)&self->_selectedVibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_noneString, 0);
  objc_storeStrong((id *)&self->_defaultToneIdentifier, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playingAlert, 0);
  objc_storeStrong((id *)&self->_identifiersOfRemovableTones, 0);
  objc_storeStrong((id *)&self->_toneGroupBucketIdentifiers, 0);
  objc_storeStrong((id *)&self->_toneGroupNames, 0);
  objc_storeStrong((id *)&self->_toneGroupLists, 0);
  objc_storeStrong((id *)&self->_installedTones, 0);
  objc_storeStrong((id *)&self->_cachedPickerRowItems, 0);
  objc_storeStrong((id *)&self->_cachedPickerSectionItems, 0);
  objc_storeStrong((id *)&self->_finishedToneStoreDownloadsByIdentifier, 0);
  objc_storeStrong((id *)&self->_activeToneStoreDownloadsByIdentifier, 0);

  objc_storeStrong((id *)&self->_toneManager, 0);
}

- (void)_pickerRowItemAtIndex:inSectionForItem:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22107E000, v0, v1, "We expect to have a default tone identifier.", v2, v3, v4, v5, v6);
}

- (void)_pickerRowItemAtIndex:inSectionForItem:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22107E000, v0, v1, "*** Assertion failure.", v2, v3, v4, v5, v6);
}

- (void)deleteTonePickerItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22107E000, a2, OS_LOG_TYPE_ERROR, "Cannot delete %{public}@.", (uint8_t *)&v2, 0xCu);
}

void __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22107E000, v0, v1, "Unexpected.", v2, v3, v4, v5, v6);
}

void __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22107E000, v0, v1, "Unexpected nil value for next picker row item.", v2, v3, v4, v5, v6);
}

void __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22107E000, v0, v1, "Unexpected number of items.", v2, v3, v4, v5, v6);
}

void __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22107E000, v0, v1, "Unexpected updated number of sections.", v2, v3, v4, v5, v6);
}

void __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22107E000, v0, v1, "This is the only scenario we know how to handle properly.", v2, v3, v4, v5, v6);
}

void __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22107E000, log, OS_LOG_TYPE_ERROR, "Unexpected.", buf, 2u);
}

void __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22107E000, log, OS_LOG_TYPE_ERROR, "*** Assertion failure.", buf, 2u);
}

@end