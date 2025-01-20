@interface NTKFace
+ (BOOL)_complication:(id)a3 isValidForSlot:(id)a4 forDevice:(id)a5;
+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5;
+ (BOOL)_customEditModeDeterminesDynamicSections:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)_customEditModeIsColor:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)_customEditModeIsShowSeconds:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)_isInternalOnlyForDevice:(id)a3;
+ (BOOL)isFaceStyleAvailableInternal:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (BOOL)needsAppleNeuralEngine;
+ (BOOL)supportsExternalAssets;
+ (BOOL)supportsSecureCoding;
+ (Class)_faceClassForStyle:(int64_t)a3 onDevice:(id)a4;
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (NTKArgonKeyDescriptor)keyDescriptor;
+ (id)PPTBlankFace;
+ (id)_complicationSlotDescriptors;
+ (id)_complicationTypeMigrations;
+ (id)_dateComplicationSlotForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_defaultSelectedSlotForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_monogramComplicationSlotForDevice:(id)a3;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)_slotForAddColorsViewFrame;
+ (id)_slotsForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)additionalPigmentFaceDomains;
+ (id)allPigmentFaceDomains;
+ (id)argon_overlayAssetArchiveURL;
+ (id)availableInternalFaceDescriptorsForDevice:(id)a3;
+ (id)bundledFaceWithIdentifier:(id)a3 analyticsIdentifier:(id)a4 forDevice:(id)a5 initCustomization:(id)a6;
+ (id)bundledFaceWithIdentifier:(id)a3 forDevice:(id)a4 initCustomization:(id)a5;
+ (id)complicationConfiguration;
+ (id)defaultAnalyticsIdentifierForBundleIdentifier:(id)a3;
+ (id)defaultFaceFromFaceDescriptor:(id)a3 forDevice:(id)a4;
+ (id)defaultFaceOfStyle:(int64_t)a3 forDevice:(id)a4;
+ (id)defaultFaceOfStyle:(int64_t)a3 forDevice:(id)a4 initCustomization:(id)a5;
+ (id)faceWithInstanceDescriptor:(id)a3;
+ (id)faceWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4;
+ (id)faceWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4 forMigration:(BOOL)a5 allowFallbackFromInvalidFaceStyle:(BOOL)a6;
+ (id)fixedComplicationSlotsForDevice:(id)a3;
+ (id)localizedNameForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)pigmentFaceDomain;
+ (id)possibleComplicationTypesForSlot:(id)a3;
+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4;
+ (id)upgradeManagerWithFace:(id)a3 forDevice:(id)a4;
+ (int64_t)_complicationFontStyleForSlot:(id)a3;
+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3;
+ (unint64_t)maximumRemoteComplicationsOnAnyFace;
+ (unint64_t)maximumRemoteComplicationsOnAnyFaceForDevice:(id)a3;
+ (void)enumerateComplicationSlots:(id)a3 withBlock:(id)a4;
+ (void)enumerateComplicationSlotsWithBlock:(id)a3;
+ (void)greenfieldFaceWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4 withCompletion:(id)a5;
+ (void)initialize;
- (BOOL)_allowsEditing;
- (BOOL)_applyConfiguration:(id)a3 allowFailure:(BOOL)a4;
- (BOOL)_applyConfiguration:(id)a3 allowFailure:(BOOL)a4 forMigration:(BOOL)a5;
- (BOOL)_complication:(id)a3 appearsInDailySnapshotForSlot:(id)a4;
- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4;
- (BOOL)_faceGalleryDidUpdateFaceColorForColorEditOptionClass:(Class)a3 availableHardwareSpecificColorOptions:(id)a4 availableColorOptions:(id)a5;
- (BOOL)_faceGalleryIsRestricted;
- (BOOL)_hasCustomSwitcherSelectionAction;
- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3;
- (BOOL)_migrationExistsForComplicationType:(unint64_t)a3 rankedFamilies:(id)a4;
- (BOOL)_option:(id)a3 isValidForCustomEditMode:(int64_t)a4 slot:(id)a5;
- (BOOL)_option:(id)a3 migratesToValidOption:(id *)a4 forCustomEditMode:(int64_t)a5 slot:(id)a6;
- (BOOL)_sanitizeFaceConfiguration:(id *)a3;
- (BOOL)_shouldColorEditModeBeAtTop;
- (BOOL)_shouldHideUI;
- (BOOL)_shouldIncludeResourceDirectoryForSharing;
- (BOOL)_shouldPresentAlertForSharingUnreleasedFace;
- (BOOL)_shouldSanitizeFaceConfigurationWhenAddingSharedFace;
- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (BOOL)_verifyCompatibilityOfConfiguration:(id)a3;
- (BOOL)_wantsUnadornedSnapshot;
- (BOOL)applyConfiguration:(id)a3;
- (BOOL)beingEdited;
- (BOOL)complicationExistenceInvalidatesSnapshot;
- (BOOL)containsEditOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (BOOL)deviceSupportsPigmentEditOption;
- (BOOL)editOptionsPrepared;
- (BOOL)forMigration;
- (BOOL)forceUsingLegacyColorOptions;
- (BOOL)hasCompanionEdits;
- (BOOL)hasGizmoEdits;
- (BOOL)hasPrideEditOptions;
- (BOOL)hasValidConfigurationForDevice:(id)a3;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToFace:(id)a3;
- (BOOL)isFullscreenConfiguration;
- (BOOL)isLibraryFace;
- (BOOL)isSingular;
- (BOOL)isUsingConfigurationModifiedForThisDevice;
- (BOOL)isValidConfigurationToAddToLibrary;
- (BOOL)option:(id)a3 migratesToValidOption:(id *)a4 forCustomEditMode:(int64_t)a5 slot:(id)a6;
- (BOOL)slot:(id)a3 supportsFamiliesOfComplications:(id)a4;
- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (BOOL)supportsPigmentEditOption;
- (BOOL)wantsUnadornedSnapshot;
- (CLKDevice)device;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (Class)editOptionClassFromEditMode:(int64_t)a3 resourceDirectoryExists:(BOOL)a4;
- (Class)faceViewClass;
- (Class)legacyEditOptionClassFromCustomEditMode:(int64_t)a3 resourceDirectoryExists:(BOOL)a4;
- (NSArray)editModes;
- (NSArray)externalAssets;
- (NSDate)creationDate;
- (NSDate)lastEditedDate;
- (NSNumber)numberOfCompanionEdits;
- (NSNumber)numberOfGizmoEdits;
- (NSString)analyticsIdentifier;
- (NSString)bundleIdentifier;
- (NSString)companionGalleryName;
- (NSString)dailySnapshotKey;
- (NSString)description;
- (NSString)name;
- (NSString)resourceDirectory;
- (NSString)unadornedSnapshotKey;
- (NSString)unsafeDailySnapshotKey;
- (NSURL)argon_embeddedOverlayAssetURL;
- (NTKArgonKeyDescriptor)keyDescriptor;
- (NTKFace)initWithCoder:(id)a3;
- (NTKFaceComplicationConfiguration)complicationConfiguration;
- (NTKFaceConfiguration)configuration;
- (NTKFaceView)faceView;
- (NTKPigmentEditOptionProvider)pigmentOptionProvider;
- (id)JSONObjectRepresentation;
- (id)_allComplications;
- (id)_complicationMigrationPaths;
- (id)_complicationProviderOptionsForSlot:(id)a3;
- (id)_complicationSlotDescriptors;
- (id)_configurationFromOldEncodingWithCoder:(id)a3;
- (id)_createSharingMetadata;
- (id)_customEditModes;
- (id)_defaultComplicationOfType:(unint64_t)a3 forSlot:(id)a4;
- (id)_defaultName;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_disabledComplicationTypesIndexSet;
- (id)_editOptionsForEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionForExternal;
- (id)_faceDescriptionForLibrary;
- (id)_faceDescriptionKey;
- (id)_faceDescriptionKeyForExternal;
- (id)_faceDescriptionKeyForLibrary;
- (id)_faceGalleryCalloutName;
- (id)_faceWithRichComplicationSlots;
- (id)_initWithFaceStyle:(int64_t)a3 forDevice:(id)a4;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_localizedNameForDynamicSectionCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_localizedStringForExternal:(id)a3 comment:(id)a4;
- (id)_migratedBundleFace;
- (id)_migratedFaceBundleIdentifier;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)_orderedComplicationSlots;
- (id)_resourceDirectorySnapshotKey;
- (id)_sortedComplicationSlots;
- (id)_uniqueOptionForCustomEditMode:(int64_t)a3 slot:(id)a4 withExistingOptions:(id)a5;
- (id)_validOptionForOption:(id)a3 mode:(int64_t)a4 slot:(id)a5 configuration:(id)a6;
- (id)addFaceDetailViewController;
- (id)albumFaceContent;
- (id)allVisibleComplicationsForCurrentConfiguration;
- (id)allowedComplicationTypesForSlot:(id)a3;
- (id)allowedComplicationTypesFromDescriptors:(id)a3 slot:(id)a4;
- (id)allowedComplicationsForSlot:(id)a3;
- (id)allowedComplicationsForSlot:(id)a3 includingComplication:(id)a4;
- (id)bundleIdentifierForUpgrade;
- (id)complicationForSlot:(id)a3;
- (id)complicationSlotsHiddenByEditOption:(id)a3;
- (id)complicationVariantForComplication:(id)a3 withSlot:(id)a4;
- (id)configurationJSONRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDataForKey:(id)a3;
- (id)deepCopy;
- (id)defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)editOptionThatHidesAllComplications;
- (id)editOptionsForCustomEditModes;
- (id)editOptionsThatHideEditModes;
- (id)faceDescriptor;
- (id)faceSharingName;
- (id)greenfieldJSONObjectRepresentation;
- (id)instanceDescriptor;
- (id)libraryDetailViewController;
- (id)localizedExplanationMessageForDisabledEditMode:(int64_t)a3;
- (id)nameOfSelectedOptionForCustomEditMode:(int64_t)a3;
- (id)namesOfSelectedOptionsForCustomEditModes;
- (id)newDynamicEditOptionCollectionForSection:(unint64_t)a3;
- (id)nightModeConfiguration;
- (id)optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)possibleComplicationTypesForSlot:(id)a3;
- (id)rankedComplicationFamiliesForSlot:(id)a3;
- (id)replacedOptionWithFulfilledOption:(id)a3 forEditMode:(int64_t)a4 slot:(id)a5;
- (id)selectedOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)selectedOptionsForCustomEditModes;
- (id)selectedSlotForEditMode:(int64_t)a3;
- (id)selectedSlotOptionsForCustomEditMode:(int64_t)a3;
- (id)slotForAddColorsViewFrame;
- (id)slotsForCustomEditMode:(int64_t)a3;
- (id)trackedPhotosContent;
- (id)upgradeContext;
- (int64_t)_customEditModeForUniqueConfiguration;
- (int64_t)_dynamicEditMode;
- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3;
- (int64_t)argon_overlayAssetType;
- (int64_t)editModeForCustomEditViewController;
- (int64_t)editedState;
- (int64_t)faceStyle;
- (int64_t)mostRecentEditMode;
- (int64_t)origin;
- (int64_t)preferredComplicationFamilyForComplication:(id)a3 withSlot:(id)a4;
- (int64_t)timeStyle;
- (unint64_t)_collectionTypeForEditMode:(int64_t)a3;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfDynamicSections;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (unint64_t)indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)_commonInit;
- (void)_deleteResourceDirectoryIfOwned;
- (void)_handleComplicationChangeNotification;
- (void)_handleSingleComplicationDidChangeNotification:(id)a3;
- (void)_notifyObserversComplicationDidChangeForSlot:(id)a3;
- (void)_notifyObserversFaceConfigurationDidChange;
- (void)_notifyObserversFaceResourceDirectoryDidChange;
- (void)_notifyObserversFaceTimeStyleChanged;
- (void)_notifyObserversFaceUpgradeOccurred;
- (void)_notifyObserversOptionsDidChangeForEditMode:(int64_t)a3;
- (void)_notifyObserversThatRespondToSelector:(SEL)a3 callSelector:(id)a4;
- (void)_selectDefaultSlots;
- (void)_setFaceGalleryComplicationTypesForSlots:(id)a3;
- (void)_setFaceGalleryComplicationTypesForSlots:(id)a3 canRepeat:(BOOL)a4;
- (void)_setResourceDirectory:(id)a3;
- (void)_updateComplicationTombstones;
- (void)addObserver:(id)a3;
- (void)applyDefaultComplicationConfiguration;
- (void)applyDefaultConfiguration;
- (void)applyUniqueConfigurationWithExistingFaces:(id)a3;
- (void)argon_compositedSnapshotWithCompletion:(id)a3;
- (void)argon_notificationContentWithCompletion:(id)a3;
- (void)argon_notificationOverlayImageWithCompletion:(id)a3;
- (void)cleanupEditOptions;
- (void)clearMetrics;
- (void)companionEditorWithAssets:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateComplicationSlotsWithBlock:(id)a3;
- (void)enumerateCustomEditModesWithBlock:(id)a3;
- (void)enumerateSlotsForCustomEditMode:(int64_t)a3 withBlock:(id)a4;
- (void)enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:(id)a3;
- (void)handleColorEditOptionsChanged;
- (void)handleSharingMetadata:(id)a3;
- (void)incrementNumberOfCompanionEdits;
- (void)incrementNumberOfGizmoEdits;
- (void)prepareEditOptions;
- (void)removeObserver:(id)a3;
- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)selectOptions:(id)a3 forCustomEditMode:(int64_t)a4;
- (void)setBeingEdited:(BOOL)a3;
- (void)setCompanionGalleryName:(id)a3;
- (void)setComplication:(id)a3 forSlot:(id)a4;
- (void)setComplicationConfiguration:(id)a3;
- (void)setComplicationSlotDescriptors:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCustomData:(id)a3 forKey:(id)a4;
- (void)setDevice:(id)a3;
- (void)setEditedState:(int64_t)a3;
- (void)setExternalAssets:(id)a3;
- (void)setForMigration:(BOOL)a3;
- (void)setForceUsingLegacyColorOptions:(BOOL)a3;
- (void)setGalleryName:(id)a3;
- (void)setIsLibraryFace:(BOOL)a3;
- (void)setLastEditedDate:(id)a3;
- (void)setMostRecentEditMode:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setResourceDirectory:(id)a3;
- (void)setResourceDirectoryByTransferringOwnership:(id)a3;
- (void)setSelectedSlot:(id)a3 forEditMode:(int64_t)a4;
- (void)toggleComplicationChangeObservation:(BOOL)a3;
@end

@implementation NTKFace

- (void)dealloc
{
  [(NTKFace *)self _deleteResourceDirectoryIfOwned];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"NTKRemoteComplicationProviderComplicationsDidChange" object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"NTKComplicationDidChangeNotification" object:0];

  v5.receiver = self;
  v5.super_class = (Class)NTKFace;
  [(NTKFace *)&v5 dealloc];
}

- (void)_deleteResourceDirectoryIfOwned
{
  if (self->_resourceDirectoryIsOwned)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v3 removeItemAtPath:self->_resourceDirectory error:0];

    resourceDirectory = self->_resourceDirectory;
    self->_resourceDirectory = 0;

    self->_resourceDirectoryIsOwned = 0;
  }
}

+ (void)initialize
{
  id v2 = (id)[MEMORY[0x1E4F19A30] currentDevice];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pigmentOptionProvider, 0);
  objc_storeStrong((id *)&self->_complicationConfiguration, 0);
  objc_storeStrong((id *)&self->_companionGalleryName, 0);
  objc_storeStrong((id *)&self->_galleryName, 0);
  objc_storeStrong((id *)&self->_resourceDirectory, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_externalAssets, 0);
  objc_storeStrong((id *)&self->_cachedDefaultName, 0);
  objc_storeStrong((id *)&self->_selectedSlotsByEditMode, 0);
  objc_storeStrong((id *)&self->_complicationSlotDescriptors, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_fvcObservers, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  return 0;
}

- (id)instanceDescriptor
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(NTKFace *)self resourceDirectory];
  v4 = (void *)MEMORY[0x1C1875BE0]();
  objc_super v5 = [(NTKFace *)self JSONObjectRepresentation];
  id v15 = 0;
  v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:2 error:&v15];
  id v7 = v15;
  if (v6)
  {
    v8 = [(NTKFace *)self device];
    v9 = [v8 nrDeviceUUID];

    v10 = [[NTKFaceInstanceDescriptor alloc] initWithJSONRepresentation:v6 nrDeviceUUID:v9 resourceDirectory:v3];
  }
  else
  {
    v11 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138413058;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      v21 = v5;
      __int16 v22 = 2112;
      v23 = self;
      id v14 = v13;
      _os_log_error_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_ERROR, "Face %@ failed to generate JSON %@ - %@ / %@", buf, 0x2Au);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)faceWithInstanceDescriptor:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1C1875BE0]();
  objc_super v5 = [v3 faceJSONRepresentation];
  if (v5)
  {
    id v15 = 0;
    v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v15];
    id v7 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      v9 = [v3 nrDeviceUUID];
      v10 = [MEMORY[0x1E4F19A30] deviceForNRDeviceUUID:v9];
      int v11 = 0;
    }
    else
    {
      v9 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[NTKFace(NTKFaceInstanceDescriptorAdditions) faceWithInstanceDescriptor:]((uint64_t)v7, v9);
      }
      v10 = 0;
      id v8 = 0;
      int v11 = 1;
    }
  }
  else
  {
    id v7 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[NTKFace(NTKFaceInstanceDescriptorAdditions) faceWithInstanceDescriptor:]((uint64_t)v3, v7);
    }
    v10 = 0;
    id v8 = 0;
    int v11 = 1;
  }

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    v12 = +[NTKFace faceWithJSONObjectRepresentation:v8 forDevice:v10];
    v13 = [v3 resourceDirectory];
    [v12 setResourceDirectory:v13];
  }

  return v12;
}

- (id)bundleIdentifierForUpgrade
{
  return 0;
}

- (id)upgradeContext
{
  return 0;
}

+ (id)upgradeManagerWithFace:(id)a3 forDevice:(id)a4
{
  return 0;
}

- (void)_setFaceGalleryComplicationTypesForSlots:(id)a3
{
}

- (void)_setFaceGalleryComplicationTypesForSlots:(id)a3 canRepeat:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NTKFace *)self device];
  id v8 = +[NTKComplicationProvider providerForDevice:v7];
  v9 = [v8 disabledComplicationTypes];

  v10 = objc_opt_new();
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  int v11 = [v6 allValues];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke;
  v26[3] = &unk_1E62C2C70;
  v26[4] = &v27;
  [v11 enumerateObjectsUsingBlock:v26];

  if (v4 && *((unsigned char *)v28 + 24))
  {
    v12 = +[NTKComplication allComplicationsOfType:5];
  }
  else
  {
    v12 = 0;
  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_3;
  v17[3] = &unk_1E62C2CE8;
  id v13 = v6;
  id v18 = v13;
  BOOL v24 = v4;
  id v14 = v10;
  id v19 = v14;
  v23 = v25;
  id v15 = v12;
  id v20 = v15;
  v21 = self;
  id v16 = v9;
  id v22 = v16;
  [(NTKFace *)self enumerateComplicationSlotsWithBlock:v17];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);
}

uint64_t __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_2;
  v7[3] = &unk_1E62C2C48;
  v7[4] = *(void *)(a1 + 32);
  uint64_t result = [a2 enumerateObjectsUsingBlock:v7];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

uint64_t __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 unsignedIntegerValue];
  if (result == 5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  char v30 = __Block_byref_object_copy__11;
  v31 = __Block_byref_object_dispose__11;
  id v32 = 0;
  uint64_t v23 = 0;
  BOOL v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_5;
  v13[3] = &unk_1E62C2CC0;
  char v22 = *(unsigned char *)(a1 + 80);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 72);
  id v14 = v5;
  uint64_t v19 = v6;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v15 = v7;
  uint64_t v16 = v8;
  id v9 = v3;
  id v17 = v9;
  id v18 = *(id *)(a1 + 64);
  id v20 = &v27;
  v21 = &v23;
  [v4 enumerateObjectsUsingBlock:v13];
  if (!*((unsigned char *)v24 + 24))
  {
    uint64_t v10 = v28[5];
    int v11 = *(void **)(a1 + 56);
    if (v10)
    {
      [v11 setComplication:v10 forSlot:v9];
    }
    else
    {
      v12 = +[NTKComplication anyComplicationOfType:](NTKComplication, "anyComplicationOfType:");
      [v11 setComplication:v12 forSlot:v9];
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 unsignedIntegerValue];
  if (*(unsigned char *)(a1 + 96) || ([*(id *)(a1 + 32) containsIndex:v7] & 1) == 0)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__11;
    BOOL v24 = __Block_byref_object_dispose__11;
    id v25 = 0;
    if (v7 == 5
      && (unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), v8 < [*(id *)(a1 + 40) count]))
    {
      uint64_t v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
      uint64_t v10 = (void *)v21[5];
      v21[5] = v9;

      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    }
    else
    {
      uint64_t v11 = +[NTKComplication anyComplicationOfType:v7];
      v12 = (void *)v21[5];
      v21[5] = v11;
    }
    id v13 = [*(id *)(a1 + 48) rankedComplicationFamiliesForSlot:*(void *)(a1 + 56)];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_2_6;
    v19[3] = &unk_1E62C2C98;
    v19[4] = *(void *)(a1 + 48);
    v19[5] = &v20;
    v19[6] = v7;
    [v13 enumerateObjectsUsingBlock:v19];
    if (v21[5])
    {
      int v14 = [*(id *)(a1 + 64) containsIndex:v7];
      uint64_t v15 = v21[5];
      if (v14)
      {
        uint64_t v16 = +[NTKComplicationTombstone tombstoneWithComplication:v15];
        uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
        id v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;
      }
      else
      {
        [*(id *)(a1 + 48) setComplication:v15 forSlot:*(void *)(a1 + 56)];
        [*(id *)(a1 + 32) addIndex:v7];
        *a4 = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      }
    }

    _Block_object_dispose(&v20, 8);
  }
}

void __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_2_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = *(void *)(a1 + 48);
  unint64_t v8 = [*(id *)(a1 + 32) device];
  BOOL v9 = +[NTKWidgetComplicationMigrationDefines hasMigratedComplicationType:v7 forDevice:v8];

  if (v9
    && (+[NTKWidgetComplicationMigrationDefines migrateComplication:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forFamily:v6], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
  else
  {
    id v13 = +[NTKBundleComplicationMigrationProvider cachedInstance];
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = [*(id *)(a1 + 32) device];
    id v20 = [v13 migratedComplicationFromType:v14 family:v6 device:v15];

    uint64_t v16 = v20;
    if (v20)
    {
      uint64_t v17 = +[NTKWidgetComplication complicationWithDescriptor:v20];
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      uint64_t v16 = v20;
      *a4 = 1;
    }
  }
}

- (BOOL)_faceGalleryDidUpdateFaceColorForColorEditOptionClass:(Class)a3 availableHardwareSpecificColorOptions:(id)a4 availableColorOptions:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 count]) {
    BOOL v9 = v7;
  }
  else {
    BOOL v9 = v8;
  }
  uint64_t v10 = [v9 firstObject];
  if (v10)
  {
    [(NTKFace *)self selectOption:v10 forCustomEditMode:10 slot:0];
    [v7 removeObject:v10];
    [v8 removeObject:v10];
  }

  return v10 != 0;
}

- (id)_faceGalleryCalloutName
{
  id v3 = [(NTKFace *)self device];
  BOOL v4 = [(NTKFace *)self name];
  if (-[NTKFace faceStyle](self, "faceStyle") == 3 && [v3 deviceCategory] != 1)
  {
    uint64_t v6 = [(NTKFace *)self selectedOptionForCustomEditMode:15 slot:0];
    id v7 = [v6 localizedName];
    id v5 = [v4 stringByAppendingFormat:@" (%@)", v7];
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (BOOL)_faceGalleryIsRestricted
{
  id v3 = +[NTKFaceBundleManager sharedManager];
  BOOL v4 = [(NTKFace *)self device];
  id v5 = [v3 faceBundleForFaceStyle:26 onDevice:v4];

  uint64_t v6 = +[NTKFaceBundleManager sharedManager];
  id v7 = [(NTKFace *)self device];
  id v8 = [v6 faceBundleForFaceStyle:33 onDevice:v7];

  [v5 faceClass];
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    [v8 faceClass];
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)_faceDescription
{
  id v2 = [(NTKFace *)self _faceDescriptionKey];
  id v3 = NTKClockFaceLocalizedString(v2, @"description");

  return v3;
}

- (id)_faceDescriptionKey
{
  uint64_t v2 = NTKEffectiveFaceStyleForFaceStyle([(NTKFace *)self faceStyle]);
  id v3 = NSString;
  BOOL v4 = [NSNumber numberWithInteger:v2];
  id v5 = [v3 stringWithFormat:@"FACE_STYLE_%@_DESCRIPTION", v4];

  return v5;
}

- (id)_faceDescriptionForLibrary
{
  uint64_t v2 = [(NTKFace *)self _faceDescriptionKeyForLibrary];
  id v3 = v2;
  if (v2)
  {
    BOOL v4 = NTKClockFaceLocalizedString(v2, @"library description");
    if (![v4 isEqualToString:v3]) {
      goto LABEL_5;
    }
  }
  BOOL v4 = 0;
LABEL_5:

  return v4;
}

- (id)_faceDescriptionKeyForLibrary
{
  uint64_t v2 = [(NTKFace *)self _faceDescriptionKey];
  id v3 = [v2 stringByAppendingString:@"_LIBRARY"];

  return v3;
}

- (id)_faceDescriptionForExternal
{
  id v3 = [(NTKFace *)self _faceDescriptionKeyForExternal];
  if (v3)
  {
    BOOL v4 = [(NTKFace *)self _localizedStringForExternal:v3 comment:@"external description"];
    if (![v4 isEqualToString:v3]) {
      goto LABEL_5;
    }
  }
  BOOL v4 = 0;
LABEL_5:

  return v4;
}

- (id)_faceDescriptionKeyForExternal
{
  uint64_t v2 = [(NTKFace *)self _faceDescriptionKey];
  id v3 = [v2 stringByAppendingString:@"_EXTERNAL"];

  return v3;
}

- (id)_localizedStringForExternal:(id)a3 comment:(id)a4
{
  return NTKClockFaceLocalizedString(a3, a4);
}

+ (id)pigmentFaceDomain
{
  return 0;
}

+ (id)additionalPigmentFaceDomains
{
  return 0;
}

+ (id)allPigmentFaceDomains
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [a1 pigmentFaceDomain];

  if (v4)
  {
    id v5 = [a1 pigmentFaceDomain];
    [v3 addObject:v5];
  }
  uint64_t v6 = [a1 additionalPigmentFaceDomains];

  if (v6)
  {
    id v7 = [a1 additionalPigmentFaceDomains];
    [v3 addObjectsFromArray:v7];
  }

  return v3;
}

- (void)handleColorEditOptionsChanged
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__NTKFace_handleColorEditOptionsChanged__block_invoke;
  aBlock[3] = &unk_1E62BFF20;
  aBlock[4] = self;
  uint64_t v2 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v2[2](v2);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v2);
  }
}

void __40__NTKFace_handleColorEditOptionsChanged__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyObserversOptionsDidChangeForEditMode:10];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKColorEditOptionsChangedNotificationName" object:*(void *)(a1 + 32)];
}

- (BOOL)deviceSupportsPigmentEditOption
{
  if (self->_forceUsingLegacyColorOptions) {
    return 0;
  }
  device = self->_device;
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A87D220D-4D8E-42CE-AB39-6E071D6B2B2C"];
  LODWORD(device) = [(CLKDevice *)device supportsCapability:v4];

  if (!device) {
    return 0;
  }

  return [(NTKFace *)self supportsPigmentEditOption];
}

- (BOOL)supportsPigmentEditOption
{
  id v2 = [(id)objc_opt_class() pigmentFaceDomain];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)editOptionThatHidesAllComplications
{
  return 0;
}

- (id)editOptionsThatHideEditModes
{
  return 0;
}

- (id)localizedExplanationMessageForDisabledEditMode:(int64_t)a3
{
  return 0;
}

- (id)albumFaceContent
{
  return 0;
}

- (id)trackedPhotosContent
{
  return 0;
}

- (id)complicationSlotsHiddenByEditOption:(id)a3
{
  return 0;
}

- (void)_commonInit
{
  if ([(NTKFace *)self supportsPigmentEditOption])
  {
    BOOL v3 = [[NTKPigmentEditOptionProvider alloc] initWithFace:self];
    pigmentOptionProvider = self->_pigmentOptionProvider;
    self->_pigmentOptionProvider = v3;
  }
  id v5 = [(id)objc_opt_class() complicationConfiguration];
  complicationConfiguration = self->_complicationConfiguration;
  self->_complicationConfiguration = v5;

  id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  fvcObservers = self->_fvcObservers;
  self->_fvcObservers = v7;

  BOOL v9 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
  observers = self->_observers;
  self->_observers = v9;

  uint64_t v11 = [(NTKFace *)self _complicationSlotDescriptors];
  complicationSlotDescriptors = self->_complicationSlotDescriptors;
  self->_complicationSlotDescriptors = v11;

  self->_mostRecentEditMode = 0;
  id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  selectedSlotsByEditMode = self->_selectedSlotsByEditMode;
  self->_selectedSlotsByEditMode = v13;

  uint64_t v15 = objc_alloc_init(NTKFaceConfiguration);
  configuration = self->_configuration;
  self->_configuration = v15;

  [(NTKFace *)self _selectDefaultSlots];
}

+ (id)complicationConfiguration
{
  return 0;
}

- (BOOL)isValidConfigurationToAddToLibrary
{
  return 1;
}

- (id)_initWithFaceStyle:(int64_t)a3 forDevice:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKFace;
  id v8 = [(NTKFace *)&v11 init];
  BOOL v9 = v8;
  if (v8)
  {
    v8->_faceStyle = a3;
    objc_storeStrong((id *)&v8->_device, a4);
    [(NTKFace *)v9 _commonInit];
    [(NTKFace *)v9 toggleComplicationChangeObservation:1];
  }

  return v9;
}

- (NSString)description
{
  BOOL v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@ [%@] [resources=%@]", v5, self->_configuration, self->_resourceDirectory];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKFace;
  return [(NTKFace *)&v4 isEqual:a3];
}

- (void)toggleComplicationChangeObservation:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"NTKRemoteComplicationProviderComplicationsDidChange" object:0];
  [v6 removeObserver:self name:@"NTKComplicationDidChangeNotification" object:0];
  if (v3)
  {
    [v6 addObserver:self selector:sel__handleComplicationChangeNotification name:@"NTKRemoteComplicationProviderComplicationsDidChange" object:0];
    [v6 addObserver:self selector:sel__handleComplicationChangeNotification name:@"NTKWidgetComplicationProviderComplicationsDidChange" object:0];
    [v6 addObserver:self selector:sel__handleSingleComplicationDidChangeNotification_ name:@"NTKComplicationDidChangeNotification" object:0];
    id v5 = +[NTKComplicationProvider providerForDevice:self->_device];
    [v5 registerObserver:self];
  }
  else
  {
    id v5 = +[NTKComplicationProvider providerForDevice:self->_device];
    [v5 unregisterObserver:self];
  }
}

- (void)addObserver:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = 24;
  if (isKindOfClass) {
    uint64_t v5 = 16;
  }
  [*(id *)((char *)&self->super.isa + v5) addObject:v6];
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = 24;
  if (isKindOfClass) {
    uint64_t v5 = 16;
  }
  [*(id *)((char *)&self->super.isa + v5) removeObject:v6];
}

- (void)setResourceDirectory:(id)a3
{
  id v4 = a3;
  if (self->_resourceDirectoryIsOwned || (NTKEqualStrings(v4, self->_resourceDirectory) & 1) == 0)
  {
    [(NTKFace *)self _deleteResourceDirectoryIfOwned];
    [(NTKFace *)self _setResourceDirectory:v4];
  }
}

- (void)setResourceDirectoryByTransferringOwnership:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_resourceDirectoryIsOwned || (NTKEqualStrings(v4, self->_resourceDirectory) & 1) == 0)
  {
    [(NTKFace *)self _deleteResourceDirectoryIfOwned];
    if (v5)
    {
      id v6 = [(id)objc_opt_class() _linkedResourceRootDirectory];
      id v7 = [MEMORY[0x1E4F29128] UUID];
      id v8 = [v7 UUIDString];
      BOOL v9 = [v6 stringByAppendingPathComponent:v8];

      uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v14 = 0;
      LODWORD(v8) = [v10 copyItemAtPath:v5 toPath:v9 error:&v14];
      id v11 = v14;

      if (v8)
      {
        self->_resourceDirectoryIsOwned = 1;
      }
      else
      {
        v12 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = [(NTKFace *)self description];
          *(_DWORD *)buf = 138412802;
          uint64_t v16 = v5;
          __int16 v17 = 2112;
          uint64_t v18 = v13;
          __int16 v19 = 2112;
          id v20 = v11;
          _os_log_error_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_ERROR, "Failed to copy face directory “%@” for face “%@”: %@", buf, 0x20u);
        }
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
    [(NTKFace *)self _setResourceDirectory:v9];
  }
}

- (void)setComplicationSlotDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_complicationSlotDescriptors, a3);

  [(NTKFace *)self _selectDefaultSlots];
}

- (void)_setResourceDirectory:(id)a3
{
  resourceDirectory = self->_resourceDirectory;
  id v5 = a3;
  id v8 = (id)[(NSString *)resourceDirectory copy];
  id v6 = (NSString *)[v5 copy];

  id v7 = self->_resourceDirectory;
  self->_resourceDirectory = v6;

  [(NTKFaceConfiguration *)self->_configuration setResourceDirectoryExists:self->_resourceDirectory != 0];
  [(NTKFace *)self _updateForResourceDirectoryChange:v8];
  [(NTKFace *)self _notifyObserversFaceResourceDirectoryDidChange];
}

- (void)_notifyObserversThatRespondToSelector:(SEL)a3 callSelector:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__NTKFace__notifyObserversThatRespondToSelector_callSelector___block_invoke;
  aBlock[3] = &unk_1E62C5790;
  SEL v29 = a3;
  id v7 = v6;
  id v28 = v7;
  id v8 = (void (**)(void *, void))_Block_copy(aBlock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v9 = (void *)[(NSHashTable *)self->_fvcObservers copy];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v8[2](v8, *(void *)(*((void *)&v23 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v11);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        v8[2](v8, *(void *)(*((void *)&v19 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v16);
  }
}

void __62__NTKFace__notifyObserversThatRespondToSelector_callSelector___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_notifyObserversFaceConfigurationDidChange
{
  if (self->_suppressingConfigurationChangeNotifications)
  {
    self->_configurationChangedWhileSuppressingNotifications = 1;
  }
  else
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __53__NTKFace__notifyObserversFaceConfigurationDidChange__block_invoke;
    v2[3] = &unk_1E62C57B8;
    v2[4] = self;
    [(NTKFace *)self _notifyObserversThatRespondToSelector:sel_faceConfigurationDidChange_ callSelector:v2];
  }
}

uint64_t __53__NTKFace__notifyObserversFaceConfigurationDidChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 faceConfigurationDidChange:*(void *)(a1 + 32)];
}

- (void)_notifyObserversOptionsDidChangeForEditMode:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__NTKFace__notifyObserversOptionsDidChangeForEditMode___block_invoke;
  v3[3] = &unk_1E62C57E0;
  v3[4] = self;
  v3[5] = a3;
  [(NTKFace *)self _notifyObserversThatRespondToSelector:sel_face_didChangeOptionsForEditMode_ callSelector:v3];
}

uint64_t __55__NTKFace__notifyObserversOptionsDidChangeForEditMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 face:*(void *)(a1 + 32) didChangeOptionsForEditMode:*(void *)(a1 + 40)];
}

- (void)_notifyObserversComplicationDidChangeForSlot:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__NTKFace__notifyObserversComplicationDidChangeForSlot___block_invoke;
  v6[3] = &unk_1E62C5808;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NTKFace *)self _notifyObserversThatRespondToSelector:sel_face_didChangeComplicationForSlot_ callSelector:v6];
}

uint64_t __56__NTKFace__notifyObserversComplicationDidChangeForSlot___block_invoke(uint64_t a1, void *a2)
{
  return [a2 face:*(void *)(a1 + 32) didChangeComplicationForSlot:*(void *)(a1 + 40)];
}

- (void)_notifyObserversFaceResourceDirectoryDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__NTKFace__notifyObserversFaceResourceDirectoryDidChange__block_invoke;
  v2[3] = &unk_1E62C57B8;
  v2[4] = self;
  [(NTKFace *)self _notifyObserversThatRespondToSelector:sel_faceResourceDirectoryDidChange_ callSelector:v2];
}

uint64_t __57__NTKFace__notifyObserversFaceResourceDirectoryDidChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 faceResourceDirectoryDidChange:*(void *)(a1 + 32)];
}

- (void)_notifyObserversFaceTimeStyleChanged
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__NTKFace__notifyObserversFaceTimeStyleChanged__block_invoke;
  v2[3] = &unk_1E62C57B8;
  v2[4] = self;
  [(NTKFace *)self _notifyObserversThatRespondToSelector:sel_faceDidChangeTimeStyle_ callSelector:v2];
}

uint64_t __47__NTKFace__notifyObserversFaceTimeStyleChanged__block_invoke(uint64_t a1, void *a2)
{
  return [a2 faceDidChangeTimeStyle:*(void *)(a1 + 32)];
}

- (void)_notifyObserversFaceUpgradeOccurred
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__NTKFace__notifyObserversFaceUpgradeOccurred__block_invoke;
  v2[3] = &unk_1E62C57B8;
  v2[4] = self;
  [(NTKFace *)self _notifyObserversThatRespondToSelector:sel_faceUpgradeOccurred_ callSelector:v2];
}

uint64_t __46__NTKFace__notifyObserversFaceUpgradeOccurred__block_invoke(uint64_t a1, void *a2)
{
  return [a2 faceUpgradeOccurred:*(void *)(a1 + 32)];
}

- (BOOL)_shouldHideUI
{
  uint64_t v2 = [ViewClassForFace(self) uiSensitivity];
  id v3 = [MEMORY[0x1E4F19A98] sharedMonitor];
  LOBYTE(v2) = [v3 shouldHideForSensitivity:v2];

  return v2;
}

- (NSString)dailySnapshotKey
{
  uint64_t v2 = [(NTKFace *)self unsafeDailySnapshotKey];
  id v3 = NTKSanitizedFileNameFromStableIdentifier(v2);

  return (NSString *)v3;
}

- (NSString)unadornedSnapshotKey
{
  uint64_t v2 = [(NTKFace *)self unsafeDailySnapshotKey];
  id v3 = [@"unadorned" stringByAppendingString:v2];

  id v4 = NTKSanitizedFileNameFromStableIdentifier(v3);

  return (NSString *)v4;
}

- (NSString)unsafeDailySnapshotKey
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if ([(NTKFace *)self _shouldHideUI])
  {
    id v3 = @"sensitive";
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F28E78];
    id v5 = [NSNumber numberWithInteger:self->_faceStyle];
    id v6 = [v4 stringWithFormat:@"face%@", v5];

    [(NTKFaceConfiguration *)self->_configuration appendEditModesToDailySnapshotKey:v6];
    if ([(NSDictionary *)self->_complicationSlotDescriptors count])
    {
      [v6 appendString:@"-"];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      obuint64_t j = [(NTKFace *)self _sortedComplicationSlots];
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v36 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            uint64_t v12 = [(NTKFace *)self complicationForSlot:v11];
            objc_msgSend(v6, "appendString:", @"(");
            uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", NTKPrintableComplicationType(objc_msgSend(v12, "complicationType")));
            [v6 appendFormat:@"%@", v13];

            int64_t v14 = [(NTKFace *)self preferredComplicationFamilyForComplication:v12 withSlot:v11];
            uint64_t v15 = [(NTKFace *)self device];
            uint64_t v16 = [v12 customDailySnapshotKeyForFamily:v14 device:v15];
            uint64_t v17 = (void *)v16;
            if (v16) {
              [v6 appendFormat:@"-%@", v16];
            }

            [v6 appendString:@""]);
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v8);
      }
    }
    if ([(NTKFace *)self complicationExistenceInvalidatesSnapshot])
    {
      objc_msgSend(v6, "appendString:", @"-(");
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v18 = [(NTKFace *)self _sortedComplicationSlots];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * j);
            long long v24 = [(NTKFace *)self complicationForSlot:v23];
            if ([v24 complicationType]) {
              [v6 appendString:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v20);
      }

      [v6 appendString:@""]);
    }
    objc_msgSend(v6, "appendFormat:", @"-(%lu)", -[CLKDevice sizeClass](self->_device, "sizeClass"));
    uint64_t v25 = [(NTKFace *)self _resourceDirectorySnapshotKey];
    long long v26 = (void *)v25;
    if (v25) {
      [v6 appendFormat:@"-%@", v25];
    }
    uint64_t v27 = [(NTKFace *)self device];
    int v28 = NTKMonochromeComplicationsEnabledForDevice();

    if (v28) {
      [v6 appendString:@"-mc"];
    }
    [(NTKFaceConfiguration *)self->_configuration appendCustomDataToDailySnapshotKey:v6];
    id v3 = (__CFString *)[v6 copy];
  }

  return (NSString *)v3;
}

- (BOOL)complicationExistenceInvalidatesSnapshot
{
  id v3 = [(NTKFace *)self complicationConfiguration];

  if (!v3) {
    return 0;
  }
  id v4 = [(NTKFace *)self complicationConfiguration];
  char v5 = [v4 complicationExistenceInvalidatesSnapshot];

  return v5;
}

- (BOOL)_complication:(id)a3 appearsInDailySnapshotForSlot:(id)a4
{
  id v6 = a3;
  LOBYTE(a4) = objc_msgSend(v6, "appearsInDailySnapshotForFamily:", -[NTKFace preferredComplicationFamilyForComplication:withSlot:](self, "preferredComplicationFamilyForComplication:withSlot:", v6, a4));

  return (char)a4;
}

- (BOOL)wantsUnadornedSnapshot
{
  return 0;
}

- (BOOL)_wantsUnadornedSnapshot
{
  return 0;
}

- (NSString)name
{
  id v3 = [(NTKFaceConfiguration *)self->_configuration name];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NTKFace *)self _defaultName];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  id v4 = [(NTKFaceConfiguration *)self->_configuration name];
  char v5 = [v6 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    [(NTKFaceConfiguration *)self->_configuration setName:v6];
    [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
  }
}

- (NSString)companionGalleryName
{
  return 0;
}

- (id)selectedOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NTKFaceConfiguration *)self->_configuration optionForCustomEditMode:a3 slot:v6];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(NTKFace *)self _validOptionForOption:v7 mode:a3 slot:v6 configuration:self->_configuration];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a5;
  id v10 = [(NTKFace *)self replacedOptionWithFulfilledOption:a3 forEditMode:a4 slot:v8];
  uint64_t v9 = [(NTKFaceConfiguration *)self->_configuration optionForCustomEditMode:a4 slot:v8];
  [(NTKFaceConfiguration *)self->_configuration setOption:v10 forCustomEditMode:a4 slot:v8];
  if ((NTKEqualObjects(v10, v9) & 1) == 0)
  {
    [(NTKFace *)self _noteOptionChangedFrom:v9 to:v10 forCustomEditMode:a4 slot:v8];
    [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
  }
}

- (void)selectOptions:(id)a3 forCustomEditMode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self->_configuration;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __43__NTKFace_selectOptions_forCustomEditMode___block_invoke;
  uint64_t v12 = &unk_1E62C5830;
  id v8 = v7;
  uint64_t v13 = v8;
  int64_t v14 = self;
  uint64_t v15 = &v17;
  int64_t v16 = a4;
  [v6 enumerateKeysAndObjectsUsingBlock:&v9];
  if (*((unsigned char *)v18 + 24)) {
    [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
  }

  _Block_object_dispose(&v17, 8);
}

void __43__NTKFace_selectOptions_forCustomEditMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) optionForCustomEditMode:*(void *)(a1 + 56) slot:v7];
  [*(id *)(a1 + 32) setOption:v5 forCustomEditMode:*(void *)(a1 + 56) slot:v7];
  if ((NTKEqualObjects(v5, v6) & 1) == 0)
  {
    [*(id *)(a1 + 40) _noteOptionChangedFrom:v6 to:v5 forCustomEditMode:*(void *)(a1 + 56) slot:v7];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 10 && [(NTKFace *)self deviceSupportsPigmentEditOption])
  {
    id v7 = [(NTKFace *)self pigmentOptionProvider];
    id v8 = [v7 defaultColorOptionForSlot:v6];
  }
  else
  {
    id v8 = [(NTKFace *)self _defaultOptionForCustomEditMode:a3 slot:v6];
  }

  return v8;
}

+ (id)localizedNameForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v5 = [a1 _localizedNameOverrideForCustomEditMode:a3 forDevice:a4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    NTKLocalizedNameForCustomEditMode(a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;

  return v8;
}

- (id)selectedSlotOptionsForCustomEditMode:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__NTKFace_selectedSlotOptionsForCustomEditMode___block_invoke;
  v10[3] = &unk_1E62C5858;
  v10[4] = self;
  int64_t v12 = a3;
  id v6 = v5;
  id v11 = v6;
  [(NTKFace *)self enumerateSlotsForCustomEditMode:a3 withBlock:v10];
  id v7 = v11;
  id v8 = v6;

  return v8;
}

void __48__NTKFace_selectedSlotOptionsForCustomEditMode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) selectedOptionForCustomEditMode:*(void *)(a1 + 48) slot:v3];
  if (v4) {
    goto LABEL_5;
  }
  id v4 = [*(id *)(a1 + 32) defaultOptionForCustomEditMode:*(void *)(a1 + 48) slot:v3];
  id v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __48__NTKFace_selectedSlotOptionsForCustomEditMode___block_invoke_cold_1();
  }

  if (v4)
  {
LABEL_5:
    [*(id *)(a1 + 40) setObject:v4 forKey:v3];
  }
}

- (id)selectedOptionsForCustomEditModes
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKFace *)self editModes];
  id v29 = (id)objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v48 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v31;
    *(void *)&long long v6 = 138413826;
    long long v22 = v6;
    id v28 = v4;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(v10, "integerValue", v22);
        if (v11 != 1)
        {
          uint64_t v12 = v11;
          uint64_t v13 = [(NTKFace *)self slotsForCustomEditMode:v11];
          int64_t v14 = [v13 firstObject];
          uint64_t v15 = [(NTKFace *)self selectedOptionForCustomEditMode:v12 slot:v14];
          if (v15) {
            goto LABEL_11;
          }
          uint64_t v15 = [(NTKFace *)self defaultOptionForCustomEditMode:v12 slot:v14];
          int64_t v16 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = (objc_class *)objc_opt_class();
            long long v26 = NSStringFromClass(v19);
            *(_DWORD *)buf = 138412546;
            long long v35 = v26;
            __int16 v36 = 2048;
            uint64_t v37 = v12;
            _os_log_error_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_ERROR, "MISSING SELECTION FOR AN EDIT OPTION (face: %@, editMode: %ld). falling back to default edit option.", buf, 0x16u);
          }
          id v4 = v28;
          if (v15)
          {
LABEL_11:
            [v29 setObject:v15 forKey:v10];
          }
          else
          {
            uint64_t v15 = [(NTKFace *)self device];
            uint64_t v17 = [(NTKFace *)self faceDescriptor];
            uint64_t v18 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            {
              uint64_t v27 = NTKFaceBundleStringFromCustomEditMode(v12);
              long long v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "isRunningGraceOrLater"));
              uint64_t v25 = [v15 nrDevice];
              uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v15, "nrDeviceVersion"));
              *(_DWORD *)buf = v22;
              long long v35 = v27;
              __int16 v36 = 2048;
              uint64_t v37 = v12;
              __int16 v38 = 2112;
              v39 = v17;
              __int16 v40 = 2112;
              uint64_t v41 = v15;
              __int16 v42 = 2112;
              v43 = v24;
              __int16 v44 = 2112;
              v45 = v25;
              __int16 v46 = 2112;
              v47 = v23;
              _os_log_fault_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_FAULT, "Rare Clock Bug: Edit Mode %@ (%ld) has a bad default option for face %@:\n<<<Face>>> CLKDevice <%@>, isRunningGraceOrLater <%@>, NRDevice <%@>, NRDeviceVersion <%@>", buf, 0x48u);
            }
            id v4 = v28;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v20 = [v4 countByEnumeratingWithState:&v30 objects:v48 count:16];
      uint64_t v7 = v20;
    }
    while (v20);
  }

  return v29;
}

- (id)nameOfSelectedOptionForCustomEditMode:(int64_t)a3
{
  uint64_t v5 = -[NTKFace slotsForCustomEditMode:](self, "slotsForCustomEditMode:");
  long long v6 = [v5 firstObject];
  uint64_t v7 = [(NTKFace *)self selectedOptionForCustomEditMode:a3 slot:v6];
  uint64_t v8 = [v7 localizedName];

  return v8;
}

- (id)namesOfSelectedOptionsForCustomEditModes
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKFace *)self editModes];
  id v4 = objc_opt_new();
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
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "integerValue", (void)v13);
        if (v10 != 1)
        {
          uint64_t v11 = [(NTKFace *)self nameOfSelectedOptionForCustomEditMode:v10];
          if (v11) {
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)setCustomData:(id)a3 forKey:(id)a4
{
  configuration = self->_configuration;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NTKFaceConfiguration *)configuration customDataForKey:v7];
  [(NTKFaceConfiguration *)self->_configuration setCustomData:v8 forKey:v7];

  LOBYTE(configuration) = NTKEqualObjects(v9, v8);
  if ((configuration & 1) == 0) {
    [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
  }
}

- (id)customDataForKey:(id)a3
{
  return [(NTKFaceConfiguration *)self->_configuration customDataForKey:a3];
}

- (id)editOptionsForCustomEditModes
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKFace *)self editModes];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObject:&unk_1F16E1C38];
  uint64_t v19 = [v4 count];
  if (v19) {
    [(NTKFace *)self prepareEditOptions];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v4;
  uint64_t v22 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  id v5 = 0;
  if (v22)
  {
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "integerValue", v19);
        id v8 = [(NTKFace *)self _editOptionsForEditMode:v7 slot:0];
        if ([v8 count])
        {
          if (!v5) {
            id v5 = objc_opt_new();
          }
          unint64_t v9 = [(NTKFace *)self _collectionTypeForEditMode:v7];
          uint64_t v10 = objc_opt_class();
          uint64_t v11 = [(NTKFace *)self device];
          uint64_t v12 = [v10 localizedNameForCustomEditMode:v7 forDevice:v11];
          long long v13 = +[NTKEditOptionCollection editOptionCollectionWithEditMode:v7 localizedName:v12 options:v8 collectionType:v9];

          long long v14 = [(NTKFace *)self device];
          long long v15 = [v13 filteredCollectionForDevice:v14];

          if ([(NTKFace *)self dynamicEditMode] != v7) {
            [v5 addObject:v15];
          }
          if (v9 == 5 && [(NTKFace *)self numberOfDynamicSections])
          {
            unint64_t v16 = 0;
            do
            {
              id v17 = [(NTKFace *)self newDynamicEditOptionCollectionForSection:v16];
              [v5 addObject:v17];

              ++v16;
            }
            while (v16 < [(NTKFace *)self numberOfDynamicSections]);
          }
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v22);
  }

  if (v19) {
    [(NTKFace *)self cleanupEditOptions];
  }

  return v5;
}

- (id)_editOptionsForEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    unint64_t v9 = [(NTKFace *)self slotsForCustomEditMode:a3];
    id v8 = [v9 firstObject];
  }
  unint64_t v10 = [(NTKFace *)self numberOfOptionsForCustomEditMode:a3 slot:v7];
  if (v10)
  {
    unint64_t v11 = v10;
    if (a3 == 10 && [(NTKFace *)self deviceSupportsPigmentEditOption])
    {
      uint64_t v12 = [(NTKFace *)self pigmentOptionProvider];
      long long v13 = [v12 availableColorsForSlot:v7];
      long long v14 = [v13 array];
    }
    else
    {
      long long v14 = [MEMORY[0x1E4F1CA48] array];
      for (uint64_t i = 0; i != v11; ++i)
      {
        unint64_t v16 = [(NTKFace *)self optionAtIndex:i forCustomEditMode:a3 slot:v7];
        [v14 addObject:v16];
      }
    }
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

- (unint64_t)_collectionTypeForEditMode:(int64_t)a3
{
  uint64_t v5 = objc_opt_class();
  id v6 = [(NTKFace *)self device];
  LOBYTE(v5) = [(id)v5 customEditModeIsColor:a3 forDevice:v6];

  if (v5) {
    return 1;
  }
  uint64_t v8 = objc_opt_class();
  unint64_t v9 = [(NTKFace *)self device];
  LOBYTE(v8) = [(id)v8 customEditModeIsRows:a3 forDevice:v9];

  if (v8) {
    return 2;
  }
  uint64_t v10 = objc_opt_class();
  unint64_t v11 = [(NTKFace *)self device];
  LOBYTE(v10) = [(id)v10 customEditModeIsShowSeconds:a3 forDevice:v11];

  if (v10) {
    return 3;
  }
  uint64_t v12 = objc_opt_class();
  long long v13 = [(NTKFace *)self device];
  int v14 = [v12 customEditModeDeterminesDynamicSections:a3 forDevice:v13];

  if (v14) {
    return 5;
  }
  else {
    return 0;
  }
}

- (id)newDynamicEditOptionCollectionForSection:(unint64_t)a3
{
  int64_t v5 = [(NTKFace *)self dynamicEditMode];
  id v6 = [(NTKFace *)self slotsForCustomEditMode:v5];
  if ([v6 count] <= a3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
  }
  uint64_t v8 = [(NTKFace *)self localizedNameForDynamicSectionCustomEditMode:v5 slot:v7];
  unint64_t v9 = [NTKEditOptionCollection alloc];
  uint64_t v10 = [(NTKFace *)self _editOptionsForEditMode:v5 slot:v7];
  unint64_t v11 = [(NTKEditOptionCollection *)v9 initWithEditMode:v5 localizedName:v8 options:v10 collectionType:[(NTKFace *)self _collectionTypeForEditMode:v5] slot:v7];

  return v11;
}

- (id)_localizedNameForDynamicSectionCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = objc_opt_class();
  uint64_t v7 = [(NTKFace *)self device];
  uint64_t v8 = [v6 localizedNameForCustomEditMode:a3 forDevice:v7];

  return v8;
}

- (id)complicationForSlot:(id)a3
{
  id v3 = [(NTKFaceConfiguration *)self->_configuration complicationForSlot:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NTKComplication nullComplication];
  }
  id v6 = v5;

  return v6;
}

- (void)setComplication:(id)a3 forSlot:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v7 = +[NTKComplication nullComplication];
  }
  id v10 = (id)v7;
  uint64_t v8 = [(NTKFace *)self complicationForSlot:v6];
  [(NTKFaceConfiguration *)self->_configuration setComplication:v10 forSlot:v6];
  if ((NTKEqualObjects(v10, v8) & 1) == 0)
  {
    [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
    [(NTKFace *)self _notifyObserversComplicationDidChangeForSlot:v6];
  }
}

+ (void)enumerateComplicationSlots:(id)a3 withBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void, char *))a4;
  char v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v13 != v10) {
        objc_enumerationMutation(v7);
      }
      v6[2](v6, *(void *)(*((void *)&v12 + 1) + 8 * v11), &v16);
      if (v16) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

+ (void)enumerateComplicationSlotsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [a1 _orderedComplicationSlots];
  [v5 enumerateComplicationSlots:v6 withBlock:v4];
}

- (void)enumerateComplicationSlotsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(NTKFace *)self _allComplications];
  [v5 enumerateComplicationSlots:v6 withBlock:v4];
}

- (void)enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NTKFace *)self allVisibleComplicationsForCurrentConfiguration];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)_allComplications
{
  id v3 = [(NTKFace *)self _orderedComplicationSlots];
  id v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = (void *)[v3 mutableCopy];

  uint64_t v6 = [(NSDictionary *)self->_complicationSlotDescriptors allKeys];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    [v7 minusSet:v8];
    uint64_t v9 = [v7 allObjects];
    [v5 addObjectsFromArray:v9];
  }

  return v5;
}

- (id)allVisibleComplicationsForCurrentConfiguration
{
  id v3 = [(NTKFace *)self _allComplications];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__30;
  long long v23 = __Block_byref_object_dispose__30;
  id v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v4 = [(NTKFace *)self editOptionThatHidesAllComplications];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__NTKFace_allVisibleComplicationsForCurrentConfiguration__block_invoke;
  v10[3] = &unk_1E62C5880;
  v10[4] = self;
  long long v13 = &v15;
  id v5 = v4;
  id v11 = v5;
  char v14 = &v19;
  id v6 = v3;
  id v12 = v6;
  [(NTKFace *)self enumerateCustomEditModesWithBlock:v10];
  if (*((unsigned char *)v16 + 24))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    if ([(id)v20[5] count])
    {
      id v8 = [v6 arrayByExcludingObjectsInArray:v20[5]];
    }
    else
    {
      id v8 = v6;
    }
    uint64_t v7 = v8;
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __57__NTKFace_allVisibleComplicationsForCurrentConfiguration__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v12 = [*(id *)(a1 + 32) selectedOptionForCustomEditMode:a2 slot:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v12 isEqual:*(void *)(a1 + 40)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    *a3 = 1;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) selectedOptionForCustomEditMode:a2 slot:0];
    uint64_t v7 = [*(id *)(a1 + 32) complicationSlotsHiddenByEditOption:v6];
    if ([v7 count])
    {
      id v8 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      if (!v8)
      {
        uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
        uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
        id v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        id v8 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      }
      [v8 addObjectsFromArray:v7];
    }
  }
}

- (BOOL)isFullscreenConfiguration
{
  uint64_t v2 = [(NTKFace *)self allVisibleComplicationsForCurrentConfiguration];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)nightModeConfiguration
{
  return @"unsupported";
}

- (int64_t)preferredComplicationFamilyForComplication:(id)a3 withSlot:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSDictionary *)self->_complicationSlotDescriptors objectForKey:v7];
  uint64_t v9 = [v8 familiesRankedList];
  if ([v6 complicationType])
  {
    uint64_t v20 = v9;
    id v21 = v7;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          int64_t v15 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v14), "integerValue", v20);
          if ([v8 allowsFamily:v15 inFace:self])
          {
            uint64_t v16 = [(NTKFace *)self device];
            char v17 = [v6 supportsComplicationFamily:v15 forDevice:v16];

            if (v17)
            {
              uint64_t v9 = v20;
              id v7 = v21;
              goto LABEL_16;
            }
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    char v18 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    id v7 = v21;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[NTKFace preferredComplicationFamilyForComplication:withSlot:]();
    }

    uint64_t v9 = v20;
  }
  objc_msgSend(v9, "firstObject", v20);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v15 = [v10 integerValue];
LABEL_16:

  return v15;
}

- (id)complicationVariantForComplication:(id)a3 withSlot:(id)a4
{
  int64_t v5 = [(NTKFace *)self preferredComplicationFamilyForComplication:a3 withSlot:a4];
  device = self->_device;

  return +[NTKComplicationVariant defaultVariantForFamily:v5 device:device];
}

- (id)rankedComplicationFamiliesForSlot:(id)a3
{
  BOOL v3 = [(NSDictionary *)self->_complicationSlotDescriptors objectForKey:a3];
  id v4 = [v3 familiesRankedList];

  return v4;
}

- (BOOL)slot:(id)a3 supportsFamiliesOfComplications:(id)a4
{
  id v6 = a4;
  id v7 = [(NSDictionary *)self->_complicationSlotDescriptors objectForKey:a3];
  id v8 = v7;
  if (v7) {
    char v9 = [v7 supportsFamiliesOfComplications:v6 inFace:self];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (id)allowedComplicationTypesFromDescriptors:(id)a3 slot:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28E60];
  id v7 = a4;
  id v8 = a3;
  char v9 = [v6 indexSet];
  id v10 = [v8 objectForKey:v7];

  uint64_t v11 = [v10 possibleTypes];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__NTKFace_allowedComplicationTypesFromDescriptors_slot___block_invoke;
  v16[3] = &unk_1E62C58A8;
  id v17 = v10;
  char v18 = self;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  [v11 enumerateIndexesUsingBlock:v16];
  uint64_t v14 = (void *)[v12 copy];

  return v14;
}

void __56__NTKFace_allowedComplicationTypesFromDescriptors_slot___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) allowsType:a2 inFace:*(void *)(a1 + 40)])
  {
    id v4 = +[NTKFace _complicationTypeMigrations];
    int64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (!v6)
    {
      id v7 = *(void **)(a1 + 48);
      [v7 addIndex:a2];
    }
  }
}

- (id)allowedComplicationTypesForSlot:(id)a3
{
  return [(NTKFace *)self allowedComplicationTypesFromDescriptors:self->_complicationSlotDescriptors slot:a3];
}

+ (id)possibleComplicationTypesForSlot:(id)a3
{
  id v4 = a3;
  int64_t v5 = [a1 _complicationSlotDescriptors];
  id v6 = [v5 objectForKey:v4];

  id v7 = [v6 possibleTypes];

  return v7;
}

- (id)possibleComplicationTypesForSlot:(id)a3
{
  BOOL v3 = [(NSDictionary *)self->_complicationSlotDescriptors objectForKey:a3];
  id v4 = [v3 possibleTypes];

  return v4;
}

- (id)_complicationProviderOptionsForSlot:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NTKFace *)self allowedComplicationTypesForSlot:v4];
  id v6 = (void *)[v5 mutableCopy];

  [v6 addIndex:0];
  id v7 = NTKLunarCalendarLocaleID();

  if (!v7) {
    [v6 removeIndex:16];
  }
  id v8 = objc_opt_class();
  char v9 = [(NTKFace *)self device];
  id v10 = [v8 _dateComplicationSlotForDevice:v9];
  int v11 = [v4 isEqualToString:v10];

  id v12 = objc_opt_new();
  if ([v6 containsIndex:1] && v11)
  {
    id v13 = objc_opt_class();
    uint64_t v14 = [(NTKFace *)self device];
    uint64_t v15 = [v13 _dateComplicationSlotSupportedStylesForDevice:v14];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47__NTKFace__complicationProviderOptionsForSlot___block_invoke;
    v20[3] = &unk_1E62C3648;
    id v21 = v12;
    NTKEnumerateDateStyles(v15, v20);
  }
  uint64_t v16 = [(NSDictionary *)self->_complicationSlotDescriptors objectForKey:v4];
  id v17 = objc_opt_new();
  [v17 setAllowedComplicationTypes:v6];
  char v18 = [v16 familiesRankedList];
  [v17 setRankedFamilies:v18];
  [v17 setSupportedDateStyles:v12];
  objc_msgSend(v17, "setAllowGenericDateComplication:", (v11 | -[NTKFace _migrationExistsForComplicationType:rankedFamilies:](self, "_migrationExistsForComplicationType:rankedFamilies:", 1, v18)) ^ 1);

  return v17;
}

void __47__NTKFace__complicationProviderOptionsForSlot___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

- (BOOL)_migrationExistsForComplicationType:(unint64_t)a3 rankedFamilies:(id)a4
{
  id v6 = a4;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__NTKFace__migrationExistsForComplicationType_rankedFamilies___block_invoke;
  v8[3] = &unk_1E62C2C98;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  [v6 enumerateObjectsUsingBlock:v8];
  LOBYTE(a3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return a3;
}

void __62__NTKFace__migrationExistsForComplicationType_rankedFamilies___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 integerValue];
  id v7 = +[NTKBundleComplicationMigrationProvider cachedInstance];
  id v8 = [v7 migratedComplicationFromType:a1[6] family:v6 device:*(void *)(a1[4] + 104)];

  if (v8)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (id)allowedComplicationsForSlot:(id)a3
{
  return [(NTKFace *)self allowedComplicationsForSlot:a3 includingComplication:0];
}

- (id)allowedComplicationsForSlot:(id)a3 includingComplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NTKFace *)self _complicationProviderOptionsForSlot:v6];
  uint64_t v9 = [(NTKFace *)self device];
  id v10 = +[NTKComplicationProvider providerForDevice:v9];

  uint64_t v11 = [v10 complicationsWithOptions:v8];
  char v12 = (void *)[v11 mutableCopy];

  id v13 = [(NTKFace *)self complicationForSlot:v6];
  if (([v12 containsObject:v13] & 1) == 0) {
    [v12 addObject:v13];
  }
  if (v7 && ([v12 containsObject:v7] & 1) == 0)
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [(NTKFace *)self device];
    uint64_t v16 = [v14 _dateComplicationSlotForDevice:v15];
    if ([v6 isEqualToString:v16])
    {
    }
    else
    {
      id v17 = objc_opt_class();
      long long v22 = [(NTKFace *)self device];
      char v18 = [v17 _monogramComplicationSlotForDevice:v22];
      char v23 = [v6 isEqualToString:v18];

      if ((v23 & 1) == 0)
      {
        id v19 = [(NTKFace *)self possibleComplicationTypesForSlot:v6];
        int v20 = objc_msgSend(v19, "containsIndex:", objc_msgSend(v7, "complicationType"));

        if (v20) {
          [v12 addObject:v7];
        }
      }
    }
  }

  return v12;
}

- (id)_disabledComplicationTypesIndexSet
{
  uint64_t v2 = +[NTKComplicationProvider providerForDevice:self->_device];
  id v3 = [v2 disabledComplicationTypes];

  return v3;
}

- (void)_handleComplicationChangeNotification
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1C1875BE0](self, a2);
  id v4 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "%@ is handling complication change", (uint8_t *)&v5, 0xCu);
  }

  [(NTKFace *)self _complicationsDidChange];
}

- (void)_handleSingleComplicationDidChangeNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = self;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling single complication change", buf, 0xCu);
  }

  if ((NTKIsDaemonOrFaceSnapshotService() & 1) == 0)
  {
    id v6 = [v4 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = [v4 object];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __58__NTKFace__handleSingleComplicationDidChangeNotification___block_invoke;
      v10[3] = &unk_1E62C18C8;
      v10[4] = self;
      id v11 = v8;
      id v9 = v8;
      [(NTKFace *)self enumerateComplicationSlotsWithBlock:v10];
    }
  }
}

void __58__NTKFace__handleSingleComplicationDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:");
  id v4 = v3;
  if (v3 == *(void **)(a1 + 40))
  {
    uint64_t v5 = [v3 complicationType];
    id v6 = *(void **)(a1 + 32);
    if (v5) {
      [v6 _notifyObserversFaceConfigurationDidChange];
    }
    else {
      [v6 setComplication:0 forSlot:v7];
    }
  }
}

- (void)_updateComplicationTombstones
{
  if (NTKIsDaemonOrFaceSnapshotService()) {
    return;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_updateComplicationTombstones___lock);
  id WeakRetained = objc_loadWeakRetained(&_updateComplicationTombstones___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_6;
  }
  id v4 = WeakRetained;
  device = self->_device;
  id v6 = (CLKDevice *)objc_loadWeakRetained(&_updateComplicationTombstones___cachedDevice);
  if (device != v6)
  {

LABEL_6:
    id v9 = self->_device;
    id v10 = objc_storeWeak(&_updateComplicationTombstones___cachedDevice, v9);
    _updateComplicationTombstones___previousCLKDeviceVersion = [(CLKDevice *)v9 version];

    id v11 = +[NTKCompanionAppLibrary sharedAppLibrary];
    [v11 prewarmCompanionDaemonWithCompletion:&__block_literal_global_99];

    goto LABEL_7;
  }
  uint64_t v7 = [(CLKDevice *)self->_device version];
  uint64_t v8 = _updateComplicationTombstones___previousCLKDeviceVersion;

  if (v7 != v8) {
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_updateComplicationTombstones___lock);
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__NTKFace__updateComplicationTombstones__block_invoke_3;
  v12[3] = &unk_1E62C1F28;
  v12[4] = self;
  v12[5] = &v13;
  [(NTKFace *)self enumerateComplicationSlotsWithBlock:v12];
  if (*((unsigned char *)v14 + 24)) {
    [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
  }
  _Block_object_dispose(&v13, 8);
}

void __40__NTKFace__updateComplicationTombstones__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) complicationForSlot:v3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __40__NTKFace__updateComplicationTombstones__block_invoke_4;
  char v18 = &unk_1E62C58D0;
  uint64_t v19 = *(void *)(a1 + 32);
  id v7 = v3;
  id v20 = v7;
  uint64_t v8 = _Block_copy(&v15);
  id v9 = (unsigned int (**)(void, void))v8;
  if (v6)
  {
    id v10 = v4;
    id v11 = [v10 complication];
    if (((unsigned int (**)(void, void *))v9)[2](v9, v11))
    {
      char v12 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v22 = v11;
        __int16 v23 = 2112;
        long long v24 = v10;
        uint64_t v13 = "Tombstone: %@ is no longer a greenfield placeholder (%@)";
LABEL_9:
        _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (isKindOfClass)
  {
    id v10 = v4;
    id v11 = [v10 complication];
    if (((unsigned int (**)(void, void *))v9)[2](v9, v11))
    {
      char v12 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v22 = v11;
        __int16 v23 = 2112;
        long long v24 = v10;
        uint64_t v13 = "Tombstone: %@ is no longer a tombstone (%@)";
        goto LABEL_9;
      }
LABEL_10:

      uint64_t v14 = v11;
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    uint64_t v14 = 0;
    goto LABEL_12;
  }
  if ((*((uint64_t (**)(void *, void *))v8 + 2))(v8, v4))
  {
    uint64_t v14 = 0;
    goto LABEL_15;
  }
  uint64_t v14 = +[NTKComplicationTombstone tombstoneWithComplication:](NTKComplicationTombstone, "tombstoneWithComplication:", v4, v15, v16, v17, v18, v19);
  id v10 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v22 = v4;
    __int16 v23 = 2112;
    long long v24 = v14;
    _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Tombstone: %@ is now a tombstone (%@)", buf, 0x16u);
  }
LABEL_13:

  if (v14)
  {
    [*(id *)(a1 + 32) setComplication:v14 forSlot:v7];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
LABEL_15:
}

uint64_t __40__NTKFace__updateComplicationTombstones__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 device];
  char v6 = +[NTKComplicationProvider providerForDevice:v5];
  id v7 = [*(id *)(a1 + 32) rankedComplicationFamiliesForSlot:*(void *)(a1 + 40)];
  uint64_t v8 = [v6 isComplicationAvailable:v4 forFamilies:v7];

  return v8;
}

+ (id)_complicationTypeMigrations
{
  if (_complicationTypeMigrations_onceToken != -1) {
    dispatch_once(&_complicationTypeMigrations_onceToken, &__block_literal_global_104);
  }
  uint64_t v2 = (void *)_complicationTypeMigrations___complicationTypeMigrations;

  return v2;
}

void __38__NTKFace__complicationTypeMigrations__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)_complicationTypeMigrations___complicationTypeMigrations;
  _complicationTypeMigrations___complicationTypeMigrations = v0;
}

+ (id)defaultFaceOfStyle:(int64_t)a3 forDevice:(id)a4
{
  return (id)[a1 defaultFaceOfStyle:a3 forDevice:a4 initCustomization:0];
}

+ (id)defaultFaceOfStyle:(int64_t)a3 forDevice:(id)a4 initCustomization:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (a3 == 44)
  {
    if ((id)objc_opt_class() == a1)
    {
      id v11 = 0;
      goto LABEL_9;
    }
    a3 = 44;
  }
  else
  {
    a1 = (id)[a1 _faceClassForStyle:a3 onDevice:v8];
  }
  id v10 = (void *)[objc_alloc((Class)a1) _initWithFaceStyle:a3 forDevice:v8];
  id v11 = v10;
  if (v10)
  {
    [v10 applyDefaultConfiguration];
    if (v9) {
      v9[2](v9, v11);
    }
  }
LABEL_9:

  return v11;
}

+ (id)bundledFaceWithIdentifier:(id)a3 forDevice:(id)a4 initCustomization:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_opt_class();
  id v11 = +[NTKFace defaultAnalyticsIdentifierForBundleIdentifier:v9];
  char v12 = [v10 bundledFaceWithIdentifier:v9 analyticsIdentifier:v11 forDevice:v8 initCustomization:v7];

  return v12;
}

+ (id)bundledFaceWithIdentifier:(id)a3 analyticsIdentifier:(id)a4 forDevice:(id)a5 initCustomization:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  char v12 = [a1 defaultFaceOfStyle:44 forDevice:a5 initCustomization:a6];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    uint64_t v14 = (void *)v12[12];
    v12[12] = v13;

    uint64_t v15 = [v11 copy];
    uint64_t v16 = (void *)v12[9];
    v12[9] = v15;
  }

  return v12;
}

- (int64_t)timeStyle
{
  return 0;
}

- (NSString)analyticsIdentifier
{
  analyticsIdentifier = self->_analyticsIdentifier;
  if (analyticsIdentifier)
  {
    id v3 = analyticsIdentifier;
  }
  else
  {
    id v3 = +[NTKFace defaultAnalyticsIdentifierForBundleIdentifier:self->_bundleIdentifier];
  }

  return v3;
}

+ (id)defaultAnalyticsIdentifierForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 length];
    char v6 = @"com.apple.NTK";
    if (([v4 hasPrefix:@"com.apple.NTK"] & 1) != 0
      || (char v6 = @"com.apple.NanoTimeKit.NTK",
          [v4 hasPrefix:@"com.apple.NanoTimeKit.NTK"]))
    {
      uint64_t v7 = [(__CFString *)v6 length];
    }
    else
    {
      uint64_t v7 = 0;
    }
    if ([v4 hasSuffix:@"FaceBundle"]) {
      v5 -= [@"FaceBundle" length];
    }
    id v9 = objc_msgSend(v4, "substringWithRange:", v7, v5 - v7);
    id v8 = [v9 lowercaseString];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unint64_t)maximumRemoteComplicationsOnAnyFace
{
  id v3 = [MEMORY[0x1E4F19A30] currentDevice];
  unint64_t v4 = [a1 maximumRemoteComplicationsOnAnyFaceForDevice:v3];

  return v4;
}

+ (unint64_t)maximumRemoteComplicationsOnAnyFaceForDevice:(id)a3
{
  return 8;
}

- (NSArray)editModes
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __20__NTKFace_editModes__block_invoke;
  id v11 = &unk_1E62C58F8;
  char v12 = self;
  id v4 = v3;
  id v13 = v4;
  [(NTKFace *)self enumerateCustomEditModesWithBlock:&v8];
  if ([(NSDictionary *)self->_complicationSlotDescriptors count]) {
    [v4 addObject:&unk_1F16E1C38];
  }
  uint64_t v5 = v13;
  char v6 = (NSArray *)v4;

  return v6;
}

void __20__NTKFace_editModes__block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) _hasOptionsForCustomEditMode:a2])
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [NSNumber numberWithInteger:a2];
    [v4 addObject:v5];
  }
}

- (int64_t)editModeForCustomEditViewController
{
  return 0;
}

- (BOOL)isEditable
{
  if (![(NTKFace *)self _allowsEditing]) {
    return 0;
  }
  if ([(NTKFace *)self _shouldHideUI]) {
    return 0;
  }
  if ([(NSDictionary *)self->_complicationSlotDescriptors count]) {
    return 1;
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__NTKFace_isEditable__block_invoke;
  v5[3] = &unk_1E62C5920;
  v5[4] = self;
  v5[5] = &v6;
  [(NTKFace *)self enumerateCustomEditModesWithBlock:v5];
  int v4 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v4 != 0;
}

uint64_t __21__NTKFace_isEditable__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) _hasOptionsForCustomEditMode:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isSingular
{
  return 0;
}

- (BOOL)isUsingConfigurationModifiedForThisDevice
{
  return self->_configurationWasModifiedForThisDevice;
}

- (id)selectedSlotForEditMode:(int64_t)a3
{
  selectedSlotsByEditMode = self->_selectedSlotsByEditMode;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  uint64_t v7 = [(NSMutableDictionary *)selectedSlotsByEditMode objectForKey:v6];

  if (!v7)
  {
    if (a3 == 1)
    {
      uint64_t v8 = [(NTKFace *)self _sortedComplicationSlots];
      uint64_t v7 = [v8 firstObject];
    }
    else
    {
      char v9 = objc_opt_class();
      uint64_t v8 = [(NTKFace *)self device];
      id v10 = [v9 _slotsForCustomEditMode:a3 forDevice:v8];
      uint64_t v7 = [v10 firstObject];
    }
  }

  return v7;
}

- (void)setSelectedSlot:(id)a3 forEditMode:(int64_t)a4
{
  id v8 = a3;
  selectedSlotsByEditMode = self->_selectedSlotsByEditMode;
  uint64_t v7 = [NSNumber numberWithInteger:a4];
  if (v8) {
    [(NSMutableDictionary *)selectedSlotsByEditMode setObject:v8 forKey:v7];
  }
  else {
    [(NSMutableDictionary *)selectedSlotsByEditMode removeObjectForKey:v7];
  }
}

- (BOOL)applyConfiguration:(id)a3
{
  return [(NTKFace *)self _applyConfiguration:a3 allowFailure:1];
}

- (void)applyDefaultConfiguration
{
  [(NTKFace *)self applyDefaultComplicationConfiguration];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__NTKFace_applyDefaultConfiguration__block_invoke;
  v3[3] = &unk_1E62C5970;
  v3[4] = self;
  [(NTKFace *)self enumerateCustomEditModesWithBlock:v3];
}

uint64_t __36__NTKFace_applyDefaultConfiguration__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__NTKFace_applyDefaultConfiguration__block_invoke_2;
  v4[3] = &unk_1E62C5948;
  v4[4] = v2;
  v4[5] = a2;
  return [v2 enumerateSlotsForCustomEditMode:a2 withBlock:v4];
}

void __36__NTKFace_applyDefaultConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 defaultOptionForCustomEditMode:v4 slot:v5];
  [*(id *)(a1 + 32) selectOption:v6 forCustomEditMode:*(void *)(a1 + 40) slot:v5];
}

- (void)applyDefaultComplicationConfiguration
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Applying default complication configuration while type cache isn't loaded", v1, 2u);
}

void __48__NTKFace_applyDefaultComplicationConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = __Block_byref_object_copy__30;
  long long v33 = __Block_byref_object_dispose__30;
  uint64_t v7 = objc_opt_class();
  id v8 = [*(id *)(a1 + 32) device];
  id v34 = [v7 _initialDefaultComplicationForSlot:v5 forDevice:v8];

  uint64_t v9 = v30[5];
  if (!v9)
  {
    id v10 = [v6 typesRankedList];
    unint64_t v11 = [v10 count];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    char v12 = [v6 typesRankedList];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v26;
      long long v22 = v24;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v15), "unsignedIntegerValue", v22);
        if (!v16) {
          break;
        }
        if (v11 < 2
          || ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsIndex:v16] & 1) == 0)
        {
          if ([v6 allowsType:v16 inFace:*(void *)(a1 + 32)])
          {
            uint64_t v17 = [*(id *)(a1 + 32) _defaultComplicationOfType:v16 forSlot:v5];
            char v18 = (void *)v30[5];
            v30[5] = v17;

            uint64_t v19 = [*(id *)(a1 + 32) rankedComplicationFamiliesForSlot:v5];
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v24[0] = __48__NTKFace_applyDefaultComplicationConfiguration__block_invoke_2;
            v24[1] = &unk_1E62C2C98;
            v24[2] = *(void *)(a1 + 32);
            v24[3] = &v29;
            v24[4] = v16;
            [v19 enumerateObjectsUsingBlock:v23];

            if (v30[5])
            {
              [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addIndex:v16];
              break;
            }
          }
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v35 count:16];
          if (v13) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    uint64_t v9 = v30[5];
    if (!v9)
    {
      uint64_t v20 = [*(id *)(a1 + 32) _defaultComplicationOfType:0 forSlot:v5];
      id v21 = (void *)v30[5];
      v30[5] = v20;

      uint64_t v9 = v30[5];
    }
  }
  [*(id *)(a1 + 32) setComplication:v9 forSlot:v5];
  _Block_object_dispose(&v29, 8);
}

void __48__NTKFace_applyDefaultComplicationConfiguration__block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = +[NTKBundleComplicationMigrationProvider cachedInstance];
  id v12 = [v7 migratedComplicationFromType:a1[6] family:v6 device:*(void *)(a1[4] + 104)];

  id v8 = v12;
  if (v12)
  {
    uint64_t v9 = +[NTKWidgetComplication complicationWithDescriptor:v12];
    uint64_t v10 = *(void *)(a1[5] + 8);
    unint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v8 = v12;
    *a4 = 1;
  }
}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  return 0;
}

- (id)_uniqueOptionForCustomEditMode:(int64_t)a3 slot:(id)a4 withExistingOptions:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(NTKFace *)self defaultOptionForCustomEditMode:a3 slot:v8];
  unint64_t v11 = [(NTKFace *)self indexOfOption:v10 forCustomEditMode:a3 slot:v8];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = v11;
  }
  unint64_t v13 = [(NTKFace *)self numberOfOptionsForCustomEditMode:a3 slot:v8];
  if (v13)
  {
    unint64_t v14 = v13;
    unint64_t v15 = v13;
    while (1)
    {
      uint64_t v16 = [(NTKFace *)self optionAtIndex:v12 % v14 forCustomEditMode:a3 slot:v8];
      if (![v9 containsObject:v16]) {
        break;
      }

      ++v12;
      if (!--v15) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)applyUniqueConfigurationWithExistingFaces:(id)a3
{
  id v4 = a3;
  [(NTKFace *)self prepareEditOptions];
  int64_t v5 = [(NTKFace *)self _customEditModeForUniqueConfiguration];
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__NTKFace_applyUniqueConfigurationWithExistingFaces___block_invoke;
    v6[3] = &unk_1E62C5858;
    id v8 = self;
    int64_t v9 = v5;
    id v7 = v4;
    [(NTKFace *)self enumerateSlotsForCustomEditMode:v9 withBlock:v6];
  }
  [(NTKFace *)self cleanupEditOptions];
}

void __53__NTKFace_applyUniqueConfigurationWithExistingFaces___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "selectedOptionForCustomEditMode:slot:", *(void *)(a1 + 48), v3, (void)v14);
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  unint64_t v11 = [*(id *)(a1 + 40) _uniqueOptionForCustomEditMode:*(void *)(a1 + 48) slot:v3 withExistingOptions:v4];
  if (!v11)
  {
    unint64_t v11 = [*(id *)(a1 + 40) defaultOptionForCustomEditMode:*(void *)(a1 + 48) slot:v3];
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12 == 19 || v12 == 13)
  {
    uint64_t v13 = objc_msgSend(*(id *)(a1 + 40), "defaultOptionForCustomEditMode:slot:", *(void *)(a1 + 48), v3, (void)v14);

    uint64_t v12 = *(void *)(a1 + 48);
    unint64_t v11 = (void *)v13;
  }
  objc_msgSend(*(id *)(a1 + 40), "selectOption:forCustomEditMode:slot:", v11, v12, v3, (void)v14);
}

- (void)prepareEditOptions
{
  self->_editOptionsPrepared = 1;
  [(NTKFace *)self _prepareEditOptions];
}

- (void)cleanupEditOptions
{
  self->_editOptionsPrepared = 0;
}

- (BOOL)hasPrideEditOptions
{
  return 0;
}

- (unint64_t)numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 10 && [(NTKFace *)self deviceSupportsPigmentEditOption])
  {
    uint64_t v7 = [(NTKFace *)self pigmentOptionProvider];
    unint64_t v8 = [v7 numberOfOptionsForSlot:v6];
  }
  else
  {
    unint64_t v8 = [(NTKFace *)self _numberOfOptionsForCustomEditMode:a3 slot:v6];
  }

  return v8;
}

- (id)optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a5;
  if (a4 == 10 && [(NTKFace *)self deviceSupportsPigmentEditOption])
  {
    uint64_t v9 = [(NTKFace *)self pigmentOptionProvider];
    uint64_t v10 = [v9 optionAtIndex:a3 slot:v8];
  }
  else
  {
    uint64_t v10 = [(NTKFace *)self _optionAtIndex:a3 forCustomEditMode:a4 slot:v8];
  }

  return v10;
}

- (unint64_t)indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 10 && [(NTKFace *)self deviceSupportsPigmentEditOption])
  {
    uint64_t v10 = [(NTKFace *)self pigmentOptionProvider];
    unint64_t v11 = [v10 indexOfOption:v8 slot:v9];
  }
  else
  {
    unint64_t v11 = [(NTKFace *)self _indexOfOption:v8 forCustomEditMode:a4 slot:v9];
  }

  return v11;
}

- (BOOL)containsEditOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  return [(NTKFace *)self indexOfOption:a3 forCustomEditMode:a4 slot:a5] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumerateCustomEditModesWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, unsigned char *))a3;
  unsigned __int8 v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NTKFace *)self _customEditModes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      unint64_t v11 = (void *)MEMORY[0x1C1875BE0]();
      v4[2](v4, [v10 integerValue], &v16);
      LODWORD(v10) = v16;
      if (v10) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateSlotsForCustomEditMode:(int64_t)a3 withBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void, char *))a4;
  uint64_t v7 = [(NTKFace *)self slotsForCustomEditMode:a3];
  char v17 = 0;
  if ([v7 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        v6[2](v6, *(void *)(*((void *)&v13 + 1) + 8 * v12), &v17);
        if (v17) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    v6[2](v6, 0, &v17);
  }
}

- (id)slotsForCustomEditMode:(int64_t)a3
{
  id v5 = objc_opt_class();
  uint64_t v6 = [(NTKFace *)self device];
  uint64_t v7 = [v5 _slotsForCustomEditMode:a3 forDevice:v6];

  return v7;
}

- (id)slotForAddColorsViewFrame
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 _slotForAddColorsViewFrame];
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if ([v6 localeMatchesContext:v7])
  {
    int v8 = [v6 buildVersionMatchesContext:v7];
    *((unsigned char *)v17 + 24) = v8 ^ 1;
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__NTKFace_snapshotContext_isStaleRelativeToContext___block_invoke;
      v12[3] = &unk_1E62C59C0;
      v12[4] = self;
      id v13 = v6;
      id v14 = v7;
      long long v15 = &v16;
      [(NTKFace *)self enumerateComplicationSlotsWithBlock:v12];

      int v8 = *((unsigned char *)v17 + 24) == 0;
    }
    if (!v8)
    {
      BOOL v9 = 1;
      goto LABEL_9;
    }
    BOOL v9 = [(NTKFace *)self _snapshotContext:v6 isStaleRelativeToContext:v7];
    uint64_t v10 = v17;
  }
  else
  {
    uint64_t v10 = v17;
    BOOL v9 = 1;
  }
  *((unsigned char *)v10 + 24) = v9;
LABEL_9:
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __52__NTKFace_snapshotContext_isStaleRelativeToContext___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = [*(id *)(a1 + 32) complicationForSlot:a2];
  if ([v5 snapshotContext:*(void *)(a1 + 40) isStaleRelativeToContext:*(void *)(a1 + 48)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (BOOL)isEquivalentToFace:(id)a3
{
  id v4 = (NTKFace *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v6 = [(NTKFace *)v4 faceStyle];
    if (v6 == [(NTKFace *)self faceStyle]
      && ([(NTKFace *)v5 device],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [(NTKFace *)self device],
          int v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v7 isEqual:v8],
          v8,
          v7,
          v9))
    {
      uint64_t v19 = 0;
      uint64_t v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 1;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __30__NTKFace_isEquivalentToFace___block_invoke;
      v16[3] = &unk_1E62C5A10;
      void v16[4] = self;
      uint64_t v10 = v5;
      char v17 = v10;
      uint64_t v18 = &v19;
      [(NTKFace *)self enumerateCustomEditModesWithBlock:v16];
      if (*((unsigned char *)v20 + 24))
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __30__NTKFace_isEquivalentToFace___block_invoke_3;
        v13[3] = &unk_1E62C2F60;
        void v13[4] = self;
        id v14 = v10;
        long long v15 = &v19;
        [(NTKFace *)self enumerateComplicationSlotsWithBlock:v13];
        BOOL v11 = *((unsigned char *)v20 + 24) != 0;
      }
      else
      {
        BOOL v11 = 0;
      }

      _Block_object_dispose(&v19, 8);
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

void __30__NTKFace_isEquivalentToFace___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__NTKFace_isEquivalentToFace___block_invoke_2;
  v9[3] = &unk_1E62C59E8;
  v9[4] = v6;
  uint64_t v12 = a2;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v11 = v8;
  [v6 enumerateSlotsForCustomEditMode:a2 withBlock:v9];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a3 = 1;
  }
}

void __30__NTKFace_isEquivalentToFace___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = a2;
  id v12 = [v5 selectedOptionForCustomEditMode:v6 slot:v7];
  uint64_t v8 = [*(id *)(a1 + 40) selectedOptionForCustomEditMode:*(void *)(a1 + 56) slot:v7];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 isEqual:v12];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && [v8 conformsToProtocol:&unk_1FCDEF740])
  {
    int v9 = [v8 pigmentEditOption];
    id v10 = [v9 JSONObjectRepresentation];
    uint64_t v11 = [v12 JSONObjectRepresentation];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 isEqualToString:v11];
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a3 = 1;
  }
}

void __30__NTKFace_isEquivalentToFace___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v8 = [v5 complicationForSlot:v6];
  id v7 = [*(id *)(a1 + 40) complicationForSlot:v6];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 isEqual:v8];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a3 = 1;
  }
}

- (int64_t)origin
{
  uint64_t v2 = [(NTKFaceConfiguration *)self->_configuration metricForKey:@"origin"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setOrigin:(int64_t)a3
{
  if (![(NTKFace *)self origin])
  {
    configuration = self->_configuration;
    id v6 = [NSNumber numberWithInteger:a3];
    [(NTKFaceConfiguration *)configuration setMetric:v6 forKey:@"origin"];

    [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
  }
}

- (NSDate)creationDate
{
  return (NSDate *)[(NTKFaceConfiguration *)self->_configuration metricForKey:@"dateCreated"];
}

- (void)setCreationDate:(id)a3
{
  id v4 = a3;
  id v6 = [(NTKFace *)self creationDate];
  [(NTKFaceConfiguration *)self->_configuration setMetric:v4 forKey:@"dateCreated"];
  char v5 = NTKEqualObjects(v4, v6);

  if ((v5 & 1) == 0) {
    [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
  }
}

- (NSDate)lastEditedDate
{
  return (NSDate *)[(NTKFaceConfiguration *)self->_configuration metricForKey:@"dateLastEdited"];
}

- (void)setLastEditedDate:(id)a3
{
  id v4 = a3;
  id v6 = [(NTKFace *)self lastEditedDate];
  [(NTKFaceConfiguration *)self->_configuration setMetric:v4 forKey:@"dateLastEdited"];
  char v5 = NTKEqualObjects(v4, v6);

  if ((v5 & 1) == 0) {
    [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
  }
}

- (int64_t)editedState
{
  uint64_t v2 = [(NTKFaceConfiguration *)self->_configuration metricForKey:@"editedState"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setEditedState:(int64_t)a3
{
  if (![(NTKFace *)self editedState] || [(NTKFace *)self editedState] == 1)
  {
    configuration = self->_configuration;
    id v6 = [NSNumber numberWithInteger:a3];
    [(NTKFaceConfiguration *)configuration setMetric:v6 forKey:@"editedState"];

    [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
  }
}

- (NSNumber)numberOfGizmoEdits
{
  uint64_t v2 = [(NTKFaceConfiguration *)self->_configuration metricForKey:@"numberOfGizmoEdits"];
  int64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = &unk_1F16E1C50;
  }
  id v4 = v2;

  return v4;
}

- (BOOL)hasGizmoEdits
{
  uint64_t v2 = [(NTKFaceConfiguration *)self->_configuration metricForKey:@"numberOfGizmoEdits"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)incrementNumberOfGizmoEdits
{
  [(NTKFaceConfiguration *)self->_configuration incrementMetricForKey:@"numberOfGizmoEdits"];

  [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
}

- (NSNumber)numberOfCompanionEdits
{
  uint64_t v2 = [(NTKFaceConfiguration *)self->_configuration metricForKey:@"numberOfCompanionEdits"];
  BOOL v3 = v2;
  if (!v2) {
    uint64_t v2 = &unk_1F16E1C50;
  }
  id v4 = v2;

  return v4;
}

- (BOOL)hasCompanionEdits
{
  uint64_t v2 = [(NTKFaceConfiguration *)self->_configuration metricForKey:@"numberOfCompanionEdits"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)incrementNumberOfCompanionEdits
{
  [(NTKFaceConfiguration *)self->_configuration incrementMetricForKey:@"numberOfCompanionEdits"];

  [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
}

- (void)clearMetrics
{
}

- (id)_customEditModes
{
  return 0;
}

+ (id)_slotsForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (id)_slotForAddColorsViewFrame
{
  return 0;
}

+ (id)_defaultSelectedSlotForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 0;
}

- (int64_t)_customEditModeForUniqueConfiguration
{
  uint64_t v2 = [(NTKFace *)self _customEditModes];
  BOOL v3 = [v2 firstObject];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_complicationSlotDescriptors
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 _complicationSlotDescriptors];
}

+ (id)_complicationSlotDescriptors
{
  BOOL v3 = [a1 complicationConfiguration];

  if (v3)
  {
    int64_t v4 = [a1 complicationConfiguration];
    char v5 = [v4 complicationSlotDescriptors];
  }
  else
  {
    char v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

+ (id)fixedComplicationSlotsForDevice:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  id v4 = a3;
  char v5 = [a1 complicationConfiguration];

  if (v5)
  {
    id v6 = [a1 complicationConfiguration];
    id v7 = [v6 defaultSelectedComplicationSlotForDevice:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_defaultComplicationOfType:(unint64_t)a3 forSlot:(id)a4
{
  id v6 = [(NTKFace *)self _complicationProviderOptionsForSlot:a4];
  id v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  [v6 setAllowedComplicationTypes:v7];

  id v8 = [(NTKFace *)self device];
  int v9 = +[NTKComplicationProvider providerForDevice:v8];

  id v10 = [v9 complicationsWithOptions:v6];
  uint64_t v11 = [v10 firstObject];

  return v11;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (BOOL)_customEditModeIsColor:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 10;
}

+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (BOOL)_customEditModeIsShowSeconds:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5
{
  return 0;
}

+ (BOOL)_customEditModeDeterminesDynamicSections:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

- (BOOL)_shouldColorEditModeBeAtTop
{
  return 1;
}

- (int64_t)_dynamicEditMode
{
  return 0;
}

- (unint64_t)_numberOfDynamicSections
{
  return 0;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  return 1;
}

- (BOOL)_option:(id)a3 isValidForCustomEditMode:(int64_t)a4 slot:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (a4 == 10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [(NTKFace *)self pigmentOptionProvider];
      uint64_t v11 = [v10 indexOfOption:v8 slot:v9];

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        char v13 = 1;
        goto LABEL_11;
      }
      id v12 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        long long v15 = [(id)objc_opt_class() pigmentFaceDomain];
        uint64_t v16 = [(NTKFace *)self pigmentOptionProvider];
        char v17 = [v16 availableColorsForSlot:v9];
        int v18 = 138543874;
        id v19 = v8;
        __int16 v20 = 2114;
        uint64_t v21 = v15;
        __int16 v22 = 2114;
        __int16 v23 = v17;
        _os_log_error_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_ERROR, "Invalid pigment option - %{public}@ - Face: %{public}@ - Available Options: %{public}@", (uint8_t *)&v18, 0x20u);
      }
      goto LABEL_9;
    }
  }
  [(NTKFace *)self editOptionClassFromEditMode:a4 resourceDirectoryExists:[(NTKFaceConfiguration *)self->_configuration resourceDirectoryExists]];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    char v13 = 0;
    goto LABEL_11;
  }
  char v13 = [v8 isValidOption];
LABEL_11:

  return v13;
}

- (BOOL)option:(id)a3 migratesToValidOption:(id *)a4 forCustomEditMode:(int64_t)a5 slot:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (a5 != 10) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v10;
      char v17 = [(id)objc_opt_class() optionByValidatingValueOfInvalidOption:v16];

      id v18 = v17;
      *a4 = v18;
      BOOL v15 = v18 != 0;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v15 = [(NTKFace *)self _option:v10 migratesToValidOption:a4 forCustomEditMode:a5 slot:v11];
    goto LABEL_7;
  }
  id v12 = [(NTKFace *)self pigmentOptionProvider];
  char v13 = [v12 migratedOptionForInvalidOption:v10 slot:v11];

  id v14 = v13;
  *a4 = v14;
  BOOL v15 = v14 != 0;

LABEL_7:
  return v15;
}

- (BOOL)_option:(id)a3 migratesToValidOption:(id *)a4 forCustomEditMode:(int64_t)a5 slot:(id)a6
{
  return 0;
}

- (BOOL)_allowsEditing
{
  return 1;
}

- (BOOL)_hasCustomSwitcherSelectionAction
{
  return 0;
}

- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  return 0;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  return 0;
}

+ (BOOL)_complication:(id)a3 isValidForSlot:(id)a4 forDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([a1 _dateComplicationSlotForDevice:v10],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v9 isEqual:v11],
        v11,
        v12))
  {
    uint64_t v13 = [v8 dateStyle];
    BOOL v14 = ([a1 _dateComplicationSlotSupportedStylesForDevice:v10] & v13) != 0;
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

+ (id)_dateComplicationSlotForDevice:(id)a3
{
  id v4 = a3;
  char v5 = [a1 complicationConfiguration];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = [a1 complicationConfiguration];
    id v7 = [v6 dateComplicationSlotForDevice:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_monogramComplicationSlotForDevice:(id)a3
{
  return 0;
}

+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3
{
  id v4 = a3;
  char v5 = [a1 complicationConfiguration];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = [a1 complicationConfiguration];
    unint64_t v7 = [v6 dateComplicationSlotSupportedStylesForDevice:v4];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)_orderedComplicationSlots
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 _orderedComplicationSlots];
}

+ (id)_orderedComplicationSlots
{
  BOOL v3 = [a1 complicationConfiguration];

  if (v3)
  {
    id v4 = [a1 complicationConfiguration];
    char v5 = [v4 orderedComplicationSlots];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  char v5 = [(NTKFace *)self complicationConfiguration];

  if (v5)
  {
    id v6 = [(NTKFace *)self complicationConfiguration];
    unint64_t v7 = [v6 localizedNameForComplicationSlot:v4];
  }
  else
  {
    unint64_t v7 = +[NTKFaceComplicationConfiguration defaultLocalizedNameForComplicationSlot:v4];
  }

  return v7;
}

- (id)_defaultName
{
  cachedDefaultName = self->_cachedDefaultName;
  if (!cachedDefaultName)
  {
    id v4 = [(NTKFace *)self faceSharingName];
    if (!v4)
    {
      NTKLocalizedNameForFaceStyle(self->_faceStyle);
      id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    char v5 = self->_cachedDefaultName;
    self->_cachedDefaultName = v4;

    cachedDefaultName = self->_cachedDefaultName;
  }

  return cachedDefaultName;
}

- (id)_resourceDirectorySnapshotKey
{
  return 0;
}

+ (BOOL)_isInternalOnlyForDevice:(id)a3
{
  return 0;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  id v4 = a3;
  char v5 = [a1 complicationConfiguration];

  if (v5)
  {
    id v6 = [a1 complicationConfiguration];
    unint64_t v7 = [v6 richComplicationSlotsForDevice:v4];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (int64_t)_complicationFontStyleForSlot:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) _initWithFaceStyle:self->_faceStyle forDevice:self->_device];
  uint64_t v5 = [(NTKFaceConfiguration *)self->_configuration copy];
  id v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  uint64_t v7 = [(id)v4 _complicationSlotDescriptors];
  id v8 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v7;

  uint64_t v9 = [(NSString *)self->_bundleIdentifier copy];
  id v10 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v9;

  uint64_t v11 = [(NSString *)self->_analyticsIdentifier copy];
  int v12 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v11;

  *(unsigned char *)(v4 + 80) = self->_forMigration;
  resourceDirectory = self->_resourceDirectory;
  if (self->_resourceDirectoryIsOwned) {
    [(id)v4 setResourceDirectoryByTransferringOwnership:resourceDirectory];
  }
  else {
    [(id)v4 setResourceDirectory:resourceDirectory];
  }
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t faceStyle = self->_faceStyle;
  id v6 = a3;
  [v6 encodeInteger:faceStyle forKey:@"FaceStyle"];
  [v6 encodeObject:self->_bundleIdentifier forKey:@"FaceBundleIdentifier"];
  [v6 encodeObject:self->_analyticsIdentifier forKey:@"FaceBundleAnalyticsIdentifier"];
  uint64_t v5 = [(CLKDevice *)self->_device nrDeviceUUID];
  [v6 encodeObject:v5 forKey:@"DeviceUUID"];

  [v6 encodeObject:self->_resourceDirectory forKey:@"ResourceDirectory"];
  [v6 encodeObject:self->_configuration forKey:@"Configuration"];
}

- (NTKFace)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NTKFace;
  uint64_t v5 = [(NTKFace *)&v19 init];
  if (v5)
  {
    v5->_int64_t faceStyle = [v4 decodeIntegerForKey:@"FaceStyle"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FaceBundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FaceBundleAnalyticsIdentifier"];
    analyticsIdentifier = v5->_analyticsIdentifier;
    v5->_analyticsIdentifier = (NSString *)v8;

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceUUID"];
    uint64_t v11 = [MEMORY[0x1E4F19A30] deviceForNRDeviceUUID:v10];
    device = v5->_device;
    v5->_device = (CLKDevice *)v11;

    [(NTKFace *)v5 _commonInit];
    if (NTKUglyBooleanToSignalThisIsFaceMigration)
    {
      uint64_t v13 = NTKMigratableFaceStyles();
      BOOL v14 = [NSNumber numberWithInteger:v5->_faceStyle];
      [v13 containsObject:v14];
    }
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ResourceDirectory"];
    resourceDirectory = v5->_resourceDirectory;
    v5->_resourceDirectory = (NSString *)v15;

    char v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Configuration"];
    if (!v17)
    {
      char v17 = [(NTKFace *)v5 _configurationFromOldEncodingWithCoder:v4];
    }
    [(NTKFace *)v5 _applyConfiguration:v17 allowFailure:0];

    [(NTKFace *)v5 toggleComplicationChangeObservation:1];
  }

  return v5;
}

- (id)_configurationFromOldEncodingWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(NTKFaceConfiguration);
  uint64_t v6 = [(NTKFace *)self _complicationMigrationPaths];
  complicationSlotDescriptors = self->_complicationSlotDescriptors;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke;
  v35[3] = &unk_1E62C5A38;
  id v30 = v6;
  id v36 = v30;
  id v8 = v4;
  id v37 = v8;
  uint64_t v9 = v5;
  __int16 v38 = v9;
  [(NSDictionary *)complicationSlotDescriptors enumerateKeysAndObjectsUsingBlock:v35];
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  uint64_t v14 = [v8 decodeObjectOfClasses:v13 forKey:@"EditConfigurations"];
  if (v14)
  {
    id v15 = (id)v14;
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    NTKValidateDictionary(v15, v16, v17);
  }
  else
  {
    id v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    __int16 v22 = [v8 decodeObjectOfClasses:v21 forKey:@"EditOptions"];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    NTKValidateDictionary(v22, v23, v24);
    long long v25 = [MEMORY[0x1E4F1CA60] dictionary];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke_2;
    v33[3] = &unk_1E62C5A60;
    id v15 = v25;
    id v34 = v15;
    [v22 enumerateKeysAndObjectsUsingBlock:v33];
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke_3;
  v31[3] = &unk_1E62C5A88;
  v31[4] = self;
  long long v26 = v9;
  long long v32 = v26;
  [v15 enumerateKeysAndObjectsUsingBlock:v31];
  long long v27 = v32;
  long long v28 = v26;

  return v28;
}

void __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  id v6 = v3;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v10, (void)v17);
        int v12 = [v11 isEqualToString:v3];

        if (v12)
        {
          id v6 = v10;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    id v6 = v3;
  }
LABEL_11:

  uint64_t v13 = *(void **)(a1 + 40);
  uint64_t v14 = objc_opt_class();
  id v15 = [@"ComplicationSlot-" stringByAppendingString:v6];
  uint64_t v16 = [v13 decodeObjectOfClass:v14 forKey:v15];

  [*(id *)(a1 + 48) setComplication:v16 forSlot:v3];
}

void __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = objc_alloc_init(NTKEditModeConfiguration);
  [(NTKEditModeConfiguration *)v7 setEditOption:v5 forSlot:0];

  [*(id *)(a1 + 32) setObject:v7 forKey:v6];
}

void __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = [*(id *)(a1 + 32) _editModeForOldEncodingIndex:v6];
  if (!v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F28498];
    id v10 = [NSNumber numberWithInteger:v6];
    [v8 raise:v9, @"invalid old edit mode index: %@", v10 format];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke_4;
  v12[3] = &unk_1E62C5858;
  id v13 = *(id *)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v7;
  id v11 = v5;
  [v11 enumerateSlotsWithBlock:v12];
}

void __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke_4(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 editOptionForSlot:v5];
  [v3 setOption:v6 forCustomEditMode:a1[6] slot:v5];
}

- (id)faceSharingName
{
  return NTKTitleCaseLocalizedNameForFaceStyle(self->_faceStyle);
}

- (id)_createSharingMetadata
{
  return 0;
}

- (BOOL)_shouldPresentAlertForSharingUnreleasedFace
{
  id v3 = [MEMORY[0x1E4F19A98] sharedMonitor];
  LOBYTE(self) = objc_msgSend(v3, "considersUISensitivitySensitive:", objc_msgSend(ViewClassForFace(self), "uiSensitivity"));

  return (char)self;
}

- (void)handleSharingMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__NTKFace_handleSharingMetadata___block_invoke;
  v5[3] = &unk_1E62C1F28;
  v5[4] = self;
  v5[5] = &v6;
  [(NTKFace *)self enumerateComplicationSlotsWithBlock:v5];
  if (*((unsigned char *)v7 + 24)) {
    [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
  }
  if (v4) {
    [(NTKFace *)self _handleSharingMetadata:v4];
  }
  _Block_object_dispose(&v6, 8);
}

void __33__NTKFace_handleSharingMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) complicationForSlot:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v5 complication];

    id v5 = (id)v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v5 complicationDescriptor];
    [v4 setNeedsAppNotify:1];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)_shouldIncludeResourceDirectoryForSharing
{
  return 1;
}

- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NTKFace *)self resourceDirectory];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v9 = [(NTKFace *)self resourceDirectory];
    char v10 = [v8 copyItemAtPath:v9 toPath:v6 error:a4];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)_shouldSanitizeFaceConfigurationWhenAddingSharedFace
{
  return 0;
}

- (BOOL)_sanitizeFaceConfiguration:(id *)a3
{
  return 0;
}

- (id)deepCopy
{
  uint64_t v3 = [(NTKFace *)self device];
  id v4 = [(NTKFace *)self JSONObjectRepresentation];
  id v5 = +[NTKFace faceWithJSONObjectRepresentation:v4 forDevice:v3];

  resourceDirectory = self->_resourceDirectory;
  if (self->_resourceDirectoryIsOwned) {
    [v5 setResourceDirectoryByTransferringOwnership:resourceDirectory];
  }
  else {
    [v5 setResourceDirectory:resourceDirectory];
  }

  return v5;
}

- (id)JSONObjectRepresentation
{
  uint64_t v3 = objc_opt_new();
  [v3 setObject:&unk_1F16E7A50 forKeyedSubscript:@"version"];
  id v4 = NTKFaceBundleStringFromFaceStyle([(NTKFace *)self faceStyle]);
  [v3 setObject:v4 forKeyedSubscript:@"face type"];

  id v5 = [(NTKFace *)self bundleIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"bundle id"];

  id v6 = NTKAnalyticsValueForFace(self);
  [v3 setObject:v6 forKeyedSubscript:@"analytics id"];

  uint64_t v7 = [(NTKFace *)self keyDescriptor];
  uint64_t v8 = objc_msgSend(v7, "argon_JSONRepresentation");
  [v3 setObject:v8 forKeyedSubscript:@"argon"];

  char v9 = objc_msgSend(NSNumber, "numberWithBool:", -[NTKFace forMigration](self, "forMigration"));
  [v3 setObject:v9 forKeyedSubscript:@"forMigration"];

  [(NTKFaceConfiguration *)self->_configuration addConfigurationKeysToJSONDictionary:v3 face:self];
  char v10 = (void *)[v3 copy];

  return v10;
}

- (id)greenfieldJSONObjectRepresentation
{
  uint64_t v3 = NTKEffectiveFaceStyleForFaceStyle([(NTKFace *)self faceStyle]);
  int64_t v4 = [(NTKFace *)self faceStyle];
  id v5 = [(NTKFace *)self JSONObjectRepresentation];
  id v6 = v5;
  if (v3 != v4)
  {
    uint64_t v7 = (void *)[v5 mutableCopy];

    uint64_t v8 = NTKFaceBundleStringFromFaceStyle(v3);
    [v7 setObject:v8 forKeyedSubscript:@"face type"];

    id v6 = (void *)[v7 copy];
  }

  return v6;
}

- (id)configurationJSONRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(NTKFaceConfiguration *)self->_configuration addConfigurationKeysToJSONDictionary:v3 face:self];

  return v3;
}

+ (void)greenfieldFaceWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4 withCompletion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = objc_opt_new();
  id v11 = dispatch_group_create();
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__30;
  long long v25 = __Block_byref_object_dispose__30;
  id v26 = +[NTKFace faceWithJSONObjectRepresentation:v7 forDevice:v8 forMigration:1 allowFallbackFromInvalidFaceStyle:0];
  if (v22[5])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__NTKFace_greenfieldFaceWithJSONObjectRepresentation_forDevice_withCompletion___block_invoke;
    aBlock[3] = &unk_1E62C5AB0;
    void aBlock[4] = &v21;
    int v12 = (void (**)(void *, void, uint64_t))_Block_copy(aBlock);
    v12[2](v12, v22[5], 1);
    if (NTKShowBlueRidgeUI(v8))
    {
      id v13 = [(id)v22[5] _faceWithRichComplicationSlots];
      ((void (**)(void *, void *, uint64_t))v12)[2](v12, v13, 0);
    }
    id v14 = [(id)v22[5] _migratedBundleFace];
    ((void (**)(void *, void *, uint64_t))v12)[2](v12, v14, 0);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__NTKFace_greenfieldFaceWithJSONObjectRepresentation_forDevice_withCompletion___block_invoke_2;
    v16[3] = &unk_1E62C1768;
    id v17 = v10;
    long long v19 = &v21;
    id v18 = v9;
    dispatch_group_notify(v11, MEMORY[0x1E4F14428], v16);
  }
  else
  {
    uint64_t v15 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v7;
      _os_log_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_DEFAULT, "Could not create new greenfield face because the base face from description:%@ is nil", buf, 0xCu);
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
  _Block_object_dispose(&v21, 8);
}

void __79__NTKFace_greenfieldFaceWithJSONObjectRepresentation_forDevice_withCompletion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(id *)(v7 + 40);
    id v8 = (id *)(v7 + 40);
    if (v9 != v6 || a3 != 0)
    {
      id v11 = v6;
      objc_storeStrong(v8, a2);
      id v6 = v11;
    }
  }
}

uint64_t __79__NTKFace_greenfieldFaceWithJSONObjectRepresentation_forDevice_withCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__NTKFace_greenfieldFaceWithJSONObjectRepresentation_forDevice_withCompletion___block_invoke_3;
  v4[3] = &unk_1E62C5AD8;
  v4[4] = a1[6];
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __79__NTKFace_greenfieldFaceWithJSONObjectRepresentation_forDevice_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) complicationForSlot:v8];
  char v7 = [v6 isEqual:v5];

  if ((v7 & 1) == 0) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setComplication:v5 forSlot:v8];
  }
}

+ (id)faceWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  return (id)[a1 faceWithJSONObjectRepresentation:a3 forDevice:a4 forMigration:0 allowFallbackFromInvalidFaceStyle:1];
}

+ (id)faceWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4 forMigration:(BOOL)a5 allowFallbackFromInvalidFaceStyle:(BOOL)a6
{
  BOOL v6 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v36 = 0;
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"top level object must be a dictionary. Invalid value: %@", v9 format];
  }
  id v11 = [v9 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"'%@' must be a string. Invalid value: %@", @"version", v11 format];
  }
  id v39 = a1;
  BOOL v40 = v6;
  int v12 = [v9 objectForKeyedSubscript:@"face type"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"'%@' must be a string. Invalid value: %@", @"face type", v12 format];
  }
  id v13 = [v9 objectForKeyedSubscript:@"bundle id"];
  obuint64_t j = [v9 objectForKeyedSubscript:@"analytics id"];
  *(void *)buf = 0;
  if (!NTKFaceBundleGetFaceStyleFromString(v12, buf)) {
    [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"invalid value for '%@': %@", @"face type", v12 format];
  }
  if (*(void *)buf == 12 && NTKShowBlueRidgeUI(v10))
  {
    id v14 = [v9 objectForKeyedSubscript:@"customization"];
    uint64_t v15 = NTKFaceBundleStringFromCustomEditMode(17);
    uint64_t v16 = [v14 valueForKey:v15];
    BOOL v17 = v16 == 0;

    if (!v17) {
      *(void *)buf = 212;
    }
  }
  id v18 = [v9 objectForKeyedSubscript:@"forMigration"];
  uint64_t v19 = [v18 BOOLValue];

  if (*(void *)buf == 44)
  {
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    int isKindOfClass = 0;
  }
  uint64_t v21 = [v9 objectForKeyedSubscript:@"argon"];
  if (v21)
  {
    objc_opt_class();
    if (isKindOfClass & objc_opt_isKindOfClass())
    {
      uint64_t v22 = +[NTKFaceBundleManager sharedManager];
      uint64_t v23 = [v22 faceBundleForBundleIdentifier:v13 onDevice:v10];

      if (!v23)
      {
        uint64_t v24 = [NTKArgonKeyDescriptor alloc];
        long long v25 = [(NTKArgonKeyDescriptor *)v24 argon_initWithJSONRepresentation:v21];

        if (v25
          && (+[NTKFaceBundleManager sharedManager],
              id v26 = objc_claimAutoreleasedReturnValue(),
              char v27 = [v26 loadKeyDescriptor:v25],
              v26,
              (v27 & 1) != 0))
        {
          id v28 = +[NTKFaceBundleManager sharedManager];
          uint64_t v23 = [v28 faceBundleForBundleIdentifier:v13 onDevice:v10];
        }
        else
        {
          uint64_t v23 = 0;
        }
      }
    }
  }
  if (*(void *)buf != 44) {
    goto LABEL_33;
  }
  if (![v13 length])
  {
    if (*(void *)buf == 44)
    {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"invalid pair for '%@': %@", v13, v12 format];
LABEL_36:
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"Unable to determine NTKFace subclass for style %@", v12 format];
      uint64_t v31 = 0;
      goto LABEL_37;
    }
LABEL_33:
    if (v40)
    {
      long long v32 = NTKMigratableFaceStyles();
      long long v33 = [NSNumber numberWithInteger:*(void *)buf];
      [v32 containsObject:v33];
    }
    uint64_t v31 = (objc_class *)objc_msgSend(v39, "_faceClassForStyle:onDevice:");
    if (v31) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  uint64_t v29 = +[NTKFaceBundleManager sharedManager];
  id v30 = [v29 faceBundleForBundleIdentifier:v13 onDevice:v10 forMigration:v19];

  uint64_t v31 = (objc_class *)[v30 faceClass];
  if (!v31) {
    goto LABEL_36;
  }
LABEL_37:
  id v34 = [v31 alloc];
  uint64_t v35 = [v34 _initWithFaceStyle:*(void *)buf forDevice:v10];
  uint64_t v36 = v35;
  if (v35)
  {
    objc_storeStrong((id *)(v35 + 96), v13);
    objc_storeStrong((id *)(v36 + 72), obj);
    *(unsigned char *)(v36 + 80) = v19;
    id v37 = [[NTKFaceConfiguration alloc] initWithJSONDictionary:v9 editModeMapping:v36 forDevice:v10];
    [(id)v36 _customizeWithJSONDescription:v9];
    [(id)v36 _applyConfiguration:v37 allowFailure:0 forMigration:v40];
  }
LABEL_41:

  return (id)v36;
}

- (NTKArgonKeyDescriptor)keyDescriptor
{
  uint64_t v2 = objc_opt_class();

  return (NTKArgonKeyDescriptor *)[v2 keyDescriptor];
}

+ (NTKArgonKeyDescriptor)keyDescriptor
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  uint64_t v3 = +[NTKArgonKeyDescriptor keyDescriptorFromBundle:v2];

  return (NTKArgonKeyDescriptor *)v3;
}

- (Class)editOptionClassFromEditMode:(int64_t)a3 resourceDirectoryExists:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 10 && [(NTKFace *)self deviceSupportsPigmentEditOption])
  {
    char v7 = objc_opt_class();
  }
  else
  {
    char v7 = [(NTKFace *)self _optionClassForCustomEditMode:a3 resourceDirectoryExists:v4];
  }

  return (Class)v7;
}

- (Class)legacyEditOptionClassFromCustomEditMode:(int64_t)a3 resourceDirectoryExists:(BOOL)a4
{
  id v5 = [(NTKFace *)self _optionClassForCustomEditMode:a3 resourceDirectoryExists:a4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    if (a3 == 10 && v5 == (objc_class *)v6) {
      goto LABEL_4;
    }
  }
  else if (a3 == 10)
  {
LABEL_4:
    objc_opt_class();
    char v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  char v7 = v5;
LABEL_7:

  return v7;
}

- (BOOL)_applyConfiguration:(id)a3 allowFailure:(BOOL)a4
{
  return [(NTKFace *)self _applyConfiguration:a3 allowFailure:a4 forMigration:0];
}

- (BOOL)_applyConfiguration:(id)a3 allowFailure:(BOOL)a4 forMigration:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6 && ![(NTKFace *)self _verifyCompatibilityOfConfiguration:v8])
  {
    BOOL v16 = 0;
  }
  else
  {
    *(_WORD *)&self->_suppressingConfigurationChangeNotifications = 1;
    uint64_t v9 = [v8 resourceDirectoryExists];
    id v10 = [(NTKFace *)self configuration];
    [v10 setResourceDirectoryExists:v9];

    id v11 = [(NTKFace *)self _complicationMigrationPaths];
    complicationSlotDescriptors = self->_complicationSlotDescriptors;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __57__NTKFace__applyConfiguration_allowFailure_forMigration___block_invoke;
    v24[3] = &unk_1E62C5B00;
    id v13 = v11;
    id v25 = v13;
    id v14 = v8;
    BOOL v28 = a5;
    id v26 = v14;
    char v27 = self;
    [(NSDictionary *)complicationSlotDescriptors enumerateKeysAndObjectsUsingBlock:v24];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    long long v20 = __57__NTKFace__applyConfiguration_allowFailure_forMigration___block_invoke_233;
    uint64_t v21 = &unk_1E62C58F8;
    uint64_t v22 = self;
    id v15 = v14;
    id v23 = v15;
    [(NTKFace *)self enumerateCustomEditModesWithBlock:&v18];
    [(NTKFace *)self _complicationsDidChange];
    [(NTKFaceConfiguration *)self->_configuration setMetricsFromConfiguration:v15];
    [(NTKFaceConfiguration *)self->_configuration setCustomDataFromConfiguration:v15];
    self->_suppressingConfigurationChangeNotifications = 0;
    if (self->_configurationChangedWhileSuppressingNotifications) {
      [(NTKFace *)self _notifyObserversFaceConfigurationDidChange];
    }

    BOOL v16 = 1;
  }

  return v16;
}

void __57__NTKFace__applyConfiguration_allowFailure_forMigration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 objectForKey:v7];
  uint64_t v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = v7;
  }
  id v11 = v10;

  int v12 = [*(id *)(a1 + 40) complicationForSlot:v11];
  if (v12 && !*(unsigned char *)(a1 + 56))
  {
    uint64_t v13 = objc_opt_class();
    id v14 = [*(id *)(a1 + 48) device];
    LOBYTE(v13) = [(id)v13 _complication:v12 isValidForSlot:v11 forDevice:v14];

    if ((v13 & 1) == 0)
    {
      BOOL v16 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v23 = 138412802;
        *(void *)&v23[4] = objc_opt_class();
        *(_WORD *)&v23[12] = 2112;
        *(void *)&v23[14] = v11;
        *(_WORD *)&v23[22] = 2112;
        uint64_t v24 = v12;
        id v20 = *(id *)&v23[4];
        _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, "%@ has invalid complication for slot %@: %@ → nil", v23, 0x20u);
      }
      goto LABEL_14;
    }
    if ((objc_msgSend(v5, "allowsType:inFace:", objc_msgSend(v12, "complicationType"), *(void *)(a1 + 48)) & 1) == 0)
    {
      int v15 = objc_msgSend(v5, "supportsType:", objc_msgSend(v12, "complicationType"));
      BOOL v16 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v17)
        {
          *(_DWORD *)id v23 = 138412802;
          *(void *)&v23[4] = objc_opt_class();
          *(_WORD *)&v23[12] = 2112;
          *(void *)&v23[14] = v11;
          *(_WORD *)&v23[22] = 2112;
          uint64_t v24 = v12;
          id v18 = *(id *)&v23[4];
          _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, "%@ has disallowed complication for slot %@: %@ → Tombstone", v23, 0x20u);
        }
        uint64_t v19 = +[NTKComplicationTombstone tombstoneWithComplication:v12];
        goto LABEL_15;
      }
      if (v17)
      {
        uint64_t v21 = objc_opt_class();
        id v22 = v21;
        *(_DWORD *)id v23 = 138413058;
        *(void *)&v23[4] = v21;
        *(_WORD *)&v23[12] = 2112;
        *(void *)&v23[14] = v11;
        *(_WORD *)&v23[22] = 2112;
        uint64_t v24 = v12;
        __int16 v25 = 2048;
        uint64_t v26 = [v12 complicationType];
        _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, "%@ has impossible complication for slot %@: %@ (%lu) → nil", v23, 0x2Au);
      }
LABEL_14:

      uint64_t v19 = 0;
LABEL_15:

      int v12 = (void *)v19;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "setComplication:forSlot:", v12, v11, *(_OWORD *)v23, *(void *)&v23[16], v24);
}

void __57__NTKFace__applyConfiguration_allowFailure_forMigration___block_invoke_233(uint64_t a1, uint64_t a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__NTKFace__applyConfiguration_allowFailure_forMigration___block_invoke_2;
  v7[3] = &unk_1E62C5858;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  uint64_t v10 = a2;
  [v4 enumerateSlotsForCustomEditMode:a2 withBlock:v7];
}

void __57__NTKFace__applyConfiguration_allowFailure_forMigration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) optionForCustomEditMode:*(void *)(a1 + 48) slot:v3];
  id v5 = [*(id *)(a1 + 40) replacedOptionWithFulfilledOption:v4 forEditMode:*(void *)(a1 + 48) slot:v3];

  uint64_t v6 = [*(id *)(a1 + 40) _validOptionForOption:v5 mode:*(void *)(a1 + 48) slot:v3 configuration:*(void *)(a1 + 32)];
  if (v6 != v5)
  {
    if ([*(id *)(a1 + 40) deviceSupportsPigmentEditOption]
      && *(void *)(a1 + 48) == 10
      && [v6 conformsToProtocol:&unk_1FCDEF740])
    {
      id v7 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [(id)objc_opt_class() pigmentFaceDomain];
        uint64_t v9 = [*(id *)(a1 + 40) pigmentOptionProvider];
        uint64_t v10 = [v9 availableColorsForSlot:v3];
        int v12 = 138544130;
        uint64_t v13 = v5;
        __int16 v14 = 2114;
        int v15 = v6;
        __int16 v16 = 2114;
        BOOL v17 = v8;
        __int16 v18 = 2114;
        uint64_t v19 = v10;
        _os_log_error_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_ERROR, "Invalid option %{public}@ - substitute: %{public}@ - Face: %{public}@ - Available Options: %{public}@", (uint8_t *)&v12, 0x2Au);
      }
    }
    else
    {
      id v7 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v11 = *(void **)(a1 + 40);
        int v12 = 138543874;
        uint64_t v13 = v5;
        __int16 v14 = 2114;
        int v15 = v6;
        __int16 v16 = 2114;
        BOOL v17 = v11;
        _os_log_error_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_ERROR, "Invalid option %{public}@ - substitute: %{public}@ - Face: %{public}@", (uint8_t *)&v12, 0x20u);
      }
    }

    *(unsigned char *)(*(void *)(a1 + 40) + 50) = 1;
  }
  [*(id *)(a1 + 40) selectOption:v6 forCustomEditMode:*(void *)(a1 + 48) slot:v3];
}

- (id)_validOptionForOption:(id)a3 mode:(int64_t)a4 slot:(id)a5 configuration:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    if (![(NTKFace *)self _option:v10 isValidForCustomEditMode:a4 slot:v11 configuration:v12])
    {
      id v16 = v10;
      BOOL v13 = [(NTKFace *)self option:v10 migratesToValidOption:&v16 forCustomEditMode:a4 slot:v11];
      id v14 = v16;

      if (v13)
      {
        id v10 = v14;
      }
      else
      {
        id v10 = [(NTKFace *)self defaultOptionForCustomEditMode:a4 slot:v11];
      }
    }
  }
  else
  {
    id v10 = [(NTKFace *)self _defaultOptionForMissingCustomEditMode:a4 slot:v11];
  }

  return v10;
}

- (id)replacedOptionWithFulfilledOption:(id)a3 forEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(NTKFace *)self deviceSupportsPigmentEditOption];
  if (a4 != 10) {
    goto LABEL_5;
  }
  if (!v10) {
    goto LABEL_5;
  }
  if (![v8 conformsToProtocol:&unk_1FCDEF740]) {
    goto LABEL_5;
  }
  id v11 = [v8 pigmentEditOption];
  id v12 = [(NTKFace *)self pigmentOptionProvider];
  id v13 = [v12 fulfilledOptionForOption:v11 slot:v9];

  if (!v13) {
LABEL_5:
  }
    id v13 = v8;

  return v13;
}

- (BOOL)_verifyCompatibilityOfConfiguration:(id)a3
{
  return 1;
}

- (id)_sortedComplicationSlots
{
  uint64_t v2 = [(NSDictionary *)self->_complicationSlotDescriptors allKeys];
  id v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  return v3;
}

- (void)_selectDefaultSlots
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__NTKFace__selectDefaultSlots__block_invoke;
  v6[3] = &unk_1E62C5970;
  void v6[4] = self;
  [(NTKFace *)self enumerateCustomEditModesWithBlock:v6];
  id v3 = objc_opt_class();
  BOOL v4 = [(NTKFace *)self device];
  id v5 = [v3 _defaultSelectedComplicationSlotForDevice:v4];

  if (v5) {
    [(NSMutableDictionary *)self->_selectedSlotsByEditMode setObject:v5 forKey:&unk_1F16E1C38];
  }
}

void __30__NTKFace__selectDefaultSlots__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = objc_opt_class();
  id v5 = [*(id *)(a1 + 32) device];
  id v11 = [v4 _slotsForCustomEditMode:a2 forDevice:v5];

  if ([v11 count])
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [*(id *)(a1 + 32) device];
    id v8 = [v6 _defaultSelectedSlotForCustomEditMode:a2 forDevice:v7];

    if (v8)
    {
      id v9 = *(void **)(*(void *)(a1 + 32) + 40);
      BOOL v10 = [NSNumber numberWithInteger:a2];
      [v9 setObject:v8 forKey:v10];
    }
  }
}

+ (Class)_faceClassForStyle:(int64_t)a3 onDevice:(id)a4
{
  id v5 = a4;
  uint64_t v6 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 10:
    case 12:
    case 14:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 41:
    case 42:
      goto LABEL_4;
    case 5:
    case 9:
    case 13:
    case 21:
    case 22:
    case 23:
    case 34:
    case 40:
    case 43:
      goto LABEL_10;
    case 11:
    case 15:
      goto LABEL_5;
    default:
      if ((unint64_t)(a3 - 200) > 0x21) {
        goto LABEL_5;
      }
      if (((1 << (a3 + 56)) & 0x3991F140FLL) != 0)
      {
LABEL_4:
        id v7 = +[NTKFaceBundleManager sharedManager];
        id v8 = [v7 faceBundleForFaceStyle:a3 onDevice:v5];
        uint64_t v6 = [v8 faceClass];
      }
      else if (a3 == 221 || a3 == 223)
      {
LABEL_10:
        uint64_t v6 = objc_opt_class();
      }
LABEL_5:

      return (Class)v6;
  }
}

+ (id)availableInternalFaceDescriptorsForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&availableInternalFaceDescriptorsForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&availableInternalFaceDescriptorsForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&availableInternalFaceDescriptorsForDevice____cachedDevice);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&availableInternalFaceDescriptorsForDevice____cachedDevice, v4);
    availableInternalFaceDescriptorsForDevice____previousCLKDeviceVersion = [v4 version];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__NTKFace_availableInternalFaceDescriptorsForDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    void v13[4] = a1;
    __53__NTKFace_availableInternalFaceDescriptorsForDevice___block_invoke((uint64_t)v13, v4);
    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = availableInternalFaceDescriptorsForDevice____previousCLKDeviceVersion;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&availableInternalFaceDescriptorsForDevice____lock);
  id v11 = (id)availableInternalFaceDescriptorsForDevice____availableInternalFaceDescriptors;

  return v11;
}

void __53__NTKFace_availableInternalFaceDescriptorsForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 100; i != 102; ++i)
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_faceClassForStyle:onDevice:", i, v3), "_isInternalOnlyForDevice:", v3))
    {
      uint64_t v6 = [[NTKFaceDescriptor alloc] initWithFaceStyle:i];
      if (v6) {
        [v4 addObject:v6];
      }
    }
  }
  id v7 = +[NTKFaceBundleManager sharedManager];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __53__NTKFace_availableInternalFaceDescriptorsForDevice___block_invoke_2;
  int v15 = &unk_1E62C0F40;
  id v16 = v3;
  id v17 = v4;
  id v8 = v4;
  id v9 = v3;
  [v7 enumerateFaceBundlesOnDevice:v9 withBlock:&v12];

  uint64_t v10 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
  id v11 = (void *)availableInternalFaceDescriptorsForDevice____availableInternalFaceDescriptors;
  availableInternalFaceDescriptorsForDevice____availableInternalFaceDescriptors = v10;
}

void __53__NTKFace_availableInternalFaceDescriptorsForDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_msgSend((id)objc_msgSend(v6, "faceClass"), "_isInternalOnlyForDevice:", *(void *)(a1 + 32)))
  {
    id v3 = [NTKFaceDescriptor alloc];
    id v4 = [(id)objc_opt_class() identifier];
    id v5 = [(NTKFaceDescriptor *)v3 initWithBundleIdentifier:v4];

    [*(id *)(a1 + 40) addObject:v5];
  }
}

+ (BOOL)isFaceStyleAvailableInternal:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 == 44)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v8 = [a1 availableInternalFaceDescriptorsForDevice:v6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__NTKFace_isFaceStyleAvailableInternal_forDevice___block_invoke;
    v10[3] = &unk_1E62C5B28;
    v10[4] = &v11;
    void v10[5] = a3;
    [v8 enumerateObjectsUsingBlock:v10];
    BOOL v7 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }

  return v7;
}

uint64_t __50__NTKFace_isFaceStyleAvailableInternal_forDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 faceStyle];
  if (*(void *)(a1 + 40) == result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)hasValidConfigurationForDevice:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NTKFace *)self selectedOptionsForCustomEditModes];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (([v10 optionExistsInDevice:v4] & 1) == 0)
        {
          uint64_t v12 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[NTKFace hasValidConfigurationForDevice:](v10);
          }

          BOOL v11 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

+ (id)PPTBlankFace
{
  return 0;
}

- (int64_t)faceStyle
{
  return self->_faceStyle;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)forMigration
{
  return self->_forMigration;
}

- (void)setForMigration:(BOOL)a3
{
  self->_forMigration = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NTKFaceConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (BOOL)editOptionsPrepared
{
  return self->_editOptionsPrepared;
}

- (BOOL)isLibraryFace
{
  return self->_isLibraryFace;
}

- (void)setIsLibraryFace:(BOOL)a3
{
  self->_isLibraryFace = a3;
}

- (void)setGalleryName:(id)a3
{
}

- (void)setCompanionGalleryName:(id)a3
{
}

- (NTKFaceComplicationConfiguration)complicationConfiguration
{
  return self->_complicationConfiguration;
}

- (void)setComplicationConfiguration:(id)a3
{
}

- (BOOL)forceUsingLegacyColorOptions
{
  return self->_forceUsingLegacyColorOptions;
}

- (void)setForceUsingLegacyColorOptions:(BOOL)a3
{
  self->_forceUsingLegacyColorOptions = a3;
}

- (NTKPigmentEditOptionProvider)pigmentOptionProvider
{
  return self->_pigmentOptionProvider;
}

- (int64_t)mostRecentEditMode
{
  return self->_mostRecentEditMode;
}

- (void)setMostRecentEditMode:(int64_t)a3
{
  self->_mostRecentEditMode = a3;
}

- (BOOL)beingEdited
{
  return self->_beingEdited;
}

- (void)setBeingEdited:(BOOL)a3
{
  self->_beingEdited = a3;
}

- (NTKFaceView)faceView
{
  id v2 = +[NTKFaceView newFaceViewForFace:self];

  return (NTKFaceView *)v2;
}

- (Class)faceViewClass
{
  return 0;
}

- (id)libraryDetailViewController
{
  id v2 = [[NTKCFaceDetailViewController alloc] initWithLibraryFace:self];

  return v2;
}

- (id)addFaceDetailViewController
{
  id v2 = [[NTKCFaceDetailViewController alloc] initWithCandidateFace:self externalAssets:0];

  return v2;
}

+ (BOOL)needsAppleNeuralEngine
{
  return 0;
}

+ (BOOL)supportsExternalAssets
{
  return 0;
}

+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4
{
  return 0;
}

- (NSArray)externalAssets
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSArray *)v2->_externalAssets copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setExternalAssets:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)[v4 copy];

  objc_storeStrong((id *)&v5->_externalAssets, v6);
  objc_sync_exit(v5);

  objc_initWeak(&location, v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__NTKFace_ExternalAssets__setExternalAssets___block_invoke;
  v8[3] = &unk_1E62C5B78;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [(NTKFace *)v5 companionEditorWithAssets:v7 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __45__NTKFace_ExternalAssets__setExternalAssets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__30;
  uint64_t v13 = __Block_byref_object_dispose__30;
  id v3 = a2;
  id v14 = v3;
  id v4 = (void *)v10[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NTKFace_ExternalAssets__setExternalAssets___block_invoke_2;
  v5[3] = &unk_1E62C5B50;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v7 = &v9;
  [v4 generateGalleryPreviewResourceDirectoryWithCompletion:v5];

  objc_destroyWeak(&v8);
  _Block_object_dispose(&v9, 8);
}

void __45__NTKFace_ExternalAssets__setExternalAssets___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 48));
  id v4 = objc_loadWeakRetained(&to);
  BOOL v5 = v4 == 0;

  if (!v5)
  {
    id v6 = objc_loadWeakRetained(&to);
    objc_sync_enter(v6);
    id v7 = objc_loadWeakRetained(&to);
    id v8 = [v7 externalAssets];
    BOOL v9 = v8 == *(void **)(a1 + 32);

    objc_sync_exit(v6);
    if (v9)
    {
      id v12 = objc_loadWeakRetained(&to);
      [v12 setResourceDirectory:v3];

      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      id v10 = *(NSObject **)(v13 + 40);
      *(void *)(v13 + 40) = 0;
    }
    else
    {
      id v10 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v11;
        _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Skipping assets %@ - changed", buf, 0xCu);
      }
    }
  }
  objc_destroyWeak(&to);
}

- (void)companionEditorWithAssets:(id)a3 completion:(id)a4
{
}

+ (id)argon_overlayAssetArchiveURL
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 keyDescriptor];
  id v3 = BSCurrentUserDirectory();
  id v4 = [v3 stringByAppendingPathComponent:@"/Library/NanoTimeKit/FaceSupport/Assets/"];
  BOOL v5 = [v2 fileName];
  id v6 = [v4 stringByAppendingPathComponent:v5];
  id v7 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Reading from %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];

  return v8;
}

- (NSURL)argon_embeddedOverlayAssetURL
{
  return 0;
}

- (int64_t)argon_overlayAssetType
{
  return 0;
}

- (void)argon_notificationContentWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__NTKFace_ArgonSupport__argon_notificationContentWithCompletion___block_invoke;
    v6[3] = &unk_1E62C5EF0;
    void v6[4] = self;
    id v7 = v4;
    [(NTKFace *)self argon_compositedSnapshotWithCompletion:v6];
  }
}

void __65__NTKFace_ArgonSupport__argon_notificationContentWithCompletion___block_invoke(uint64_t a1, UIImage *image, uint64_t a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (image)
  {
    BOOL v5 = UIImageJPEGRepresentation(image, 0.7);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = [v7 stringByAppendingPathExtension:@"jpeg"];

    BOOL v9 = NTKFaceArgonSupportCreateAttachmentWithImageData(v5, v8);
    id v10 = objc_alloc_init(MEMORY[0x1E4F445B0]);
    if (v9)
    {
      v20[0] = v9;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v10 setAttachments:v11];
    }
    if (a3) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    objc_msgSend(v10, "argon_setArtworkUsed:", v12);
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", a3, @"defaultImage");
    uint64_t v19 = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    [v10 setUserInfo:v14];

    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = (void *)[v10 copy];
    (*(void (**)(uint64_t, void *, void))(v15 + 16))(v15, v16, 0);
  }
  else
  {
    uint64_t v17 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v17();
  }
}

- (void)argon_compositedSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = dispatch_group_create();
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__32;
    v32[4] = __Block_byref_object_dispose__32;
    id v33 = 0;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__32;
    v30[4] = __Block_byref_object_dispose__32;
    id v31 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 0;
    dispatch_group_enter(v5);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke;
    v23[3] = &unk_1E62C5F18;
    __int16 v25 = v32;
    uint64_t v26 = v30;
    uint64_t v27 = v28;
    id v6 = v5;
    uint64_t v24 = v6;
    [(NTKFace *)self argon_notificationOverlayImageWithCompletion:v23];
    id v7 = +[NTKFaceSnapshotClient sharedInstance];
    id v8 = +[NTKFaceSnapshotter defaultModernSnapshotOptions];
    BOOL v9 = (void *)[v8 mutableCopy];
    [v9 removeObjectForKey:@"NTKSnapshotPersistableKey"];
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__32;
    v21[4] = __Block_byref_object_dispose__32;
    id v22 = 0;
    dispatch_group_enter(v6);
    id v10 = (void *)[v9 copy];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_2;
    v18[3] = &unk_1E62C5F40;
    uint64_t v20 = v21;
    uint64_t v11 = v6;
    uint64_t v19 = v11;
    [v7 snapshotFace:self options:v10 completion:v18];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_3;
    v12[3] = &unk_1E62C5F90;
    id v14 = v32;
    uint64_t v15 = v30;
    uint64_t v16 = v21;
    void v12[4] = self;
    id v13 = v4;
    uint64_t v17 = v28;
    dispatch_group_notify(v11, MEMORY[0x1E4F14428], v12);

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v30, 8);

    _Block_object_dispose(v32, 8);
  }
}

void __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v2 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_3_cold_1(a1 + 56, v2);
      }
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportDomain" code:202 userInfo:&unk_1F16E89A8];
      (*(void (**)(uint64_t, void, uint64_t, void *))(v15 + 16))(v15, 0, 1, v16);

      return;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) size];
    double v4 = v3;
    double v6 = v5;
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) scale];
    double v8 = v7;
    uint64_t v9 = [MEMORY[0x1E4FB17E0] preferredFormat];
    [v9 setScale:v8];
    id v10 = [*(id *)(a1 + 32) device];
    unint64_t v11 = [v10 sizeClass];

    if (v11 > 5)
    {
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = &unk_1F16E89F8;
    }
    else
    {
      if (((1 << v11) & 3) == 0)
      {
        if (((1 << v11) & 0xC) != 0)
        {
          double v12 = 69.0;
          double v13 = 64.0;
        }
        else
        {
          double v12 = 65.0;
          double v13 = 60.0;
        }
        double v20 = floor(v13 * 1.33333333);
        double v21 = floor(v12 * 1.33333333);
        id v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v9, v4, v6);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_41;
        v25[3] = &unk_1E62C5F68;
        *(double *)&v25[6] = v4;
        *(double *)&v25[7] = v6;
        *(double *)&v25[8] = v8;
        *(double *)&v25[9] = v20;
        *(double *)&v25[10] = v21;
        uint64_t v23 = *(void *)(a1 + 48);
        void v25[4] = *(void *)(a1 + 64);
        v25[5] = v23;
        uint64_t v24 = [v22 imageWithActions:v25];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        goto LABEL_20;
      }
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = &unk_1F16E89D0;
    }
    id v22 = [v18 errorWithDomain:@"NTKFaceSupportDomain" code:503 userInfo:v19];
    (*(void (**)(uint64_t, void, uint64_t, void *))(v17 + 16))(v17, 0, 1, v22);
LABEL_20:

    return;
  }
  id v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);

  v14();
}

uint64_t __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_41(uint64_t a1, void *a2)
{
  CGFloat v3 = *(double *)(a1 + 48);
  CGFloat v4 = *(double *)(a1 + 56);
  double v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a2;
  double v7 = [v5 whiteColor];
  [v7 setFill];

  v19.origin.double x = 0.0;
  v19.origin.double y = 0.0;
  v19.size.double width = v3;
  v19.size.double height = v4;
  UIRectFill(v19);
  double v8 = (CGContext *)[v6 CGContext];

  CGContextTranslateCTM(v8, -3.0 / *(double *)(a1 + 64), 0.0);
  v20.origin.double x = 0.0;
  v20.origin.double y = 0.0;
  v20.size.double width = v3;
  v20.size.double height = v4;
  CGRect v21 = CGRectInset(v20, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
  double x = v21.origin.x;
  double y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;
  double v13 = [MEMORY[0x1E4FB1618] blackColor];
  [v13 setFill];

  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  UIRectFill(v22);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "drawInRect:", x, y, width, height);
  id v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  double v15 = *MEMORY[0x1E4F1DAD8];
  double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);

  return objc_msgSend(v14, "drawAtPoint:", v15, v16);
}

- (void)argon_notificationOverlayImageWithCompletion:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__NTKFace_ArgonSupport__argon_notificationOverlayImageWithCompletion___block_invoke;
    aBlock[3] = &unk_1E62C4E78;
    id v6 = v4;
    id v27 = v6;
    double v7 = _Block_copy(aBlock);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __70__NTKFace_ArgonSupport__argon_notificationOverlayImageWithCompletion___block_invoke_2;
    v23[3] = &unk_1E62C5FD8;
    id v8 = v7;
    id v24 = v8;
    id v9 = v6;
    id v25 = v9;
    id v10 = (void (**)(void *, void *, void))_Block_copy(v23);
    unint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int64_t v12 = [(NTKFace *)self argon_overlayAssetType];
    if (v12 == 1)
    {
      id v14 = [(NTKFace *)self argon_embeddedOverlayAssetURL];
      double v15 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      double v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          char v29 = v11;
          __int16 v30 = 2114;
          id v31 = v14;
          _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, "Notification: Displaying in-bundle overlay asset for bundle %{public}@ at %{public}@", buf, 0x16u);
        }

        id v22 = 0;
        uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v14 options:0 error:&v22];
        id v18 = v22;
        if (v17) {
          v10[2](v10, v17, 0);
        }
        else {
          (*((void (**)(id, void, uint64_t, id))v9 + 2))(v9, 0, 1, v18);
        }
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[NTKFace(ArgonSupport) argon_notificationOverlayImageWithCompletion:](v16);
        }

        CGRect v19 = (void *)MEMORY[0x1E4F28C58];
        v33[0] = @"overlay asset missing";
        v32[0] = @"description";
        v32[1] = @"bundleID";
        CGRect v20 = [(NTKFace *)self bundleIdentifier];
        v33[1] = v20;
        CGRect v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
        id v18 = [v19 errorWithDomain:@"NTKFaceSupportDomain" code:800 userInfo:v21];

        (*((void (**)(id, void, uint64_t, id))v9 + 2))(v9, 0, 1, v18);
      }
    }
    else
    {
      if (!v12)
      {
        double v13 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          char v29 = v11;
          _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "Notification: Displaying default overlay asset for bundle %{public}@.", buf, 0xCu);
        }
      }
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
}

void __70__NTKFace_ArgonSupport__argon_notificationOverlayImageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportDomain" code:606 userInfo:&unk_1F16E8A20];
  (*(void (**)(uint64_t, void, uint64_t, id))(v1 + 16))(v1, 0, 1, v2);
}

void __70__NTKFace_ArgonSupport__argon_notificationOverlayImageWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  CFDataRef v5 = a2;
  id v6 = a3;
  if (v5)
  {
    double v7 = CGDataProviderCreateWithCFData(v5);
    if (v7)
    {
      id v8 = v7;
      id v9 = CGPDFDocumentCreateWithProvider(v7);
      if (v9)
      {
        id v10 = v9;
        Page = CGPDFDocumentGetPage(v9, 1uLL);
        if (Page)
        {
          int64_t v12 = Page;
          CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
          double width = BoxRect.size.width;
          double height = BoxRect.size.height;
          double v15 = objc_msgSend(MEMORY[0x1E4FB17E0], "preferredFormat", BoxRect.origin.x, BoxRect.origin.y);
          [v15 setOpaque:0];
          double v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v15, width, height);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __70__NTKFace_ArgonSupport__argon_notificationOverlayImageWithCompletion___block_invoke_3;
          v22[3] = &__block_descriptor_72_e40_v16__0__UIGraphicsImageRendererContext_8l;
          v22[4] = 0;
          v22[5] = 0;
          *(double *)&v22[6] = width;
          *(double *)&v22[7] = height;
          v22[8] = v12;
          uint64_t v17 = [v16 imageWithActions:v22];
          CFRelease(v8);
          CFRelease(v10);
          if (v17)
          {
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          }
          else
          {
            CGRect v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NTKFaceSupportDomain" code:707 userInfo:&unk_1F16E8AC0];
            (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
          }
          goto LABEL_14;
        }
        CFRelease(v8);
        CFRelease(v10);
        id v18 = (void *)MEMORY[0x1E4F28C58];
        CGRect v19 = &unk_1F16E8A98;
        uint64_t v20 = 704;
      }
      else
      {
        CFRelease(v8);
        id v18 = (void *)MEMORY[0x1E4F28C58];
        CGRect v19 = &unk_1F16E8A70;
        uint64_t v20 = 702;
      }
    }
    else
    {
      id v18 = (void *)MEMORY[0x1E4F28C58];
      CGRect v19 = &unk_1F16E8A48;
      uint64_t v20 = 701;
    }
    double v15 = [v18 errorWithDomain:@"NTKFaceSupportDomain" code:v20 userInfo:v19];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_14:

    goto LABEL_15;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_15:
}

void __70__NTKFace_ArgonSupport__argon_notificationOverlayImageWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  CGFloat v3 = (CGContext *)[a2 CGContext];
  CGFloat Height = CGRectGetHeight(*(CGRect *)(a1 + 32));
  CGContextTranslateCTM(v3, 0.0, Height);
  CGContextScaleCTM(v3, 1.0, -1.0);
  CFDataRef v5 = *(CGPDFPage **)(a1 + 64);

  CGContextDrawPDFPage(v3, v5);
}

+ (id)defaultFaceFromFaceDescriptor:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    unint64_t v11 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[NTKFace(NTKFaceDescriptorAdditions) defaultFaceFromFaceDescriptor:forDevice:](v11);
    }
    id v14 = 0;
    goto LABEL_26;
  }
  if (!v7)
  {
    id v9 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[NTKFace(NTKFaceDescriptorAdditions) defaultFaceFromFaceDescriptor:forDevice:].cold.6();
    }

    id v8 = [MEMORY[0x1E4F19A30] currentDevice];
  }
  uint64_t v10 = [v6 faceStyle];
  if (v10 == 44)
  {
    unint64_t v11 = [v6 bundleIdentifier];
    if (!v11)
    {
      double v13 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[NTKFaceDescriptor faceClass]();
      }
      id v14 = 0;
      goto LABEL_25;
    }
    int64_t v12 = +[NTKFaceBundleManager sharedManager];
    double v13 = [v12 faceBundleForBundleIdentifier:v11 onDevice:v8];

    if (v13)
    {
      id v14 = [v13 defaultFaceForDevice:v8];
      if (v14)
      {
LABEL_25:

        goto LABEL_26;
      }
      double v15 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[NTKFace(NTKFaceDescriptorAdditions) defaultFaceFromFaceDescriptor:forDevice:].cold.4();
      }
    }
    else
    {
      double v15 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[NTKFace(NTKFaceDescriptorAdditions) defaultFaceFromFaceDescriptor:forDevice:]();
      }
      id v14 = 0;
    }

    goto LABEL_25;
  }
  uint64_t v16 = v10;
  id v14 = [a1 defaultFaceOfStyle:v10 forDevice:v8];
  if (v14) {
    goto LABEL_27;
  }
  unint64_t v11 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    +[NTKFace(NTKFaceDescriptorAdditions) defaultFaceFromFaceDescriptor:forDevice:].cold.5(v16, (uint64_t)v6, v11);
  }
LABEL_26:

LABEL_27:

  return v14;
}

- (id)faceDescriptor
{
  int64_t v3 = [(NTKFace *)self faceStyle];
  id v4 = [NTKFaceDescriptor alloc];
  if (v3 == 44)
  {
    CFDataRef v5 = [(NTKFace *)self bundleIdentifier];
    id v6 = [(NTKFaceDescriptor *)v4 initWithBundleIdentifier:v5];
  }
  else
  {
    id v6 = [(NTKFaceDescriptor *)v4 initWithFaceStyle:[(NTKFace *)self faceStyle]];
  }

  return v6;
}

- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3
{
  return 0;
}

- (id)_complicationMigrationPaths
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return 0;
}

- (id)_faceWithRichComplicationSlots
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NTKFace *)self device];
  if (NTKShowBlueRidgeUI(v3)
    && (int64_t v4 = [(NTKFace *)self faceStyle],
        uint64_t v5 = __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke(v4, v4),
        v5 != -1)
    && (uint64_t v6 = v5,
        (id v7 = (void *)[(id)objc_opt_class() _faceClassOfFaceWithRichComplicationSlotsForDevice:v3]) != 0))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke_2;
    v11[3] = &unk_1E62C91F8;
    v11[4] = self;
    id v8 = [v7 defaultFaceOfStyle:v6 forDevice:v3 initCustomization:v11];
    id v9 = _NTKLoggingObjectForDomain(17, (uint64_t)"NTKLoggingDomainMigration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v13 = self;
      __int16 v14 = 2112;
      double v15 = v8;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "***** blue_ridge migration from face %@ to face %@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x21) {
    return -1;
  }
  else {
    return qword_1BC8A2298[a2];
  }
}

void __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int64_t v4 = [v3 editModes];
  uint64_t v5 = [*(id *)(a1 + 32) editModes];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v4 containsObject:v10])
        {
          uint64_t v11 = [v10 integerValue];
          if (v11 != 1)
          {
            uint64_t v12 = v11;
            double v13 = [*(id *)(a1 + 32) selectedOptionForCustomEditMode:v11 slot:0];
            [v3 selectOption:v13 forCustomEditMode:v12 slot:0];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }
  __int16 v14 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke_3;
  v23[3] = &unk_1E62C18C8;
  void v23[4] = v14;
  id v15 = v3;
  id v24 = v15;
  [v14 enumerateComplicationSlotsWithBlock:v23];
  uint64_t v16 = [*(id *)(a1 + 32) resourceDirectory];

  if (v16)
  {
    uint64_t v17 = NTKNewUniqueTeporaryResourceDirectory();
    id v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    CGRect v19 = [*(id *)(a1 + 32) resourceDirectory];
    id v22 = 0;
    [v18 copyItemAtPath:v19 toPath:v17 error:&v22];
    id v20 = v22;

    if (v20)
    {
      CGRect v21 = _NTKLoggingObjectForDomain(17, (uint64_t)"NTKLoggingDomainMigration");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke_2_cold_1(v15, v21);
      }

      uint64_t v17 = 0;
    }
    [v15 setResourceDirectory:v17];
  }
}

void __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke_3(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [*(id *)(a1 + 32) complicationForSlot:v12];
  int64_t v4 = [*(id *)(a1 + 40) rankedComplicationFamiliesForSlot:v12];
  uint64_t v5 = [v4 firstObject];

  if (v5)
  {
    uint64_t v6 = [v5 integerValue];
    uint64_t v7 = [*(id *)(a1 + 40) allowedComplicationsForSlot:v12];
    uint64_t v8 = [v3 _migrateToFamily:v6 withAllowedComplications:v7];
    id v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = (void *)v8;
    }
    else {
      uint64_t v10 = v3;
    }
    id v11 = v10;

    id v3 = v11;
  }
  [*(id *)(a1 + 40) setComplication:v3 forSlot:v12];
}

- (id)_migratedFaceBundleIdentifier
{
  return 0;
}

- (id)_migratedBundleFace
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKFace *)self device];
  uint64_t v4 = [(NTKFace *)self faceStyle];
  if (v4 <= 201)
  {
    if (v4 <= 20)
    {
      if (v4 != 2)
      {
        if (v4 != 18) {
          goto LABEL_12;
        }
        goto LABEL_9;
      }
LABEL_26:
      uint64_t v5 = +[NTKFaceBundleManager sharedManager];
      uint64_t v6 = v5;
      uint64_t v7 = @"com.apple.NTKAlaskanFaceBundle.NTKSharkFaceBundle";
      goto LABEL_29;
    }
    if (v4 != 21)
    {
      if (v4 != 24) {
        goto LABEL_12;
      }
LABEL_24:
      uint64_t v23 = +[NTKFaceBundleManager sharedManager];
      uint64_t v8 = [v23 faceBundleForFaceStyle:30 onDevice:v3];

      id v22 = [v8 defaultFaceForDevice:v3];
      uint64_t v10 = [MEMORY[0x1E4F59148] complicationWithBundleIdentifier:@"com.apple.NanoTimeKit.NTKCellularConnectivityComplicationDataSource" appBundleIdentifier:0 complicationDescriptor:0];
      id v24 = +[NTKBundleComplication bundledComplicationWithComplication:v10];
      [v22 setComplication:v24 forSlot:@"bezel"];

      long long v25 = [MEMORY[0x1E4F59148] complicationWithBundleIdentifier:@"com.apple.NanoTimeKit.AnalogSeconds" appBundleIdentifier:0 complicationDescriptor:0];
      long long v26 = +[NTKBundleComplication bundledComplicationWithComplication:v25];
      [v22 setComplication:v26 forSlot:@"slot3"];

LABEL_25:
      goto LABEL_31;
    }
    goto LABEL_27;
  }
  if (v4 > 220)
  {
    if (v4 != 221)
    {
      if (v4 != 224) {
        goto LABEL_12;
      }
      goto LABEL_24;
    }
LABEL_27:
    unint64_t v27 = [v3 deviceCategory];
    uint64_t v5 = +[NTKFaceBundleManager sharedManager];
    uint64_t v6 = v5;
    if (v27 < 3)
    {
      uint64_t v28 = [v5 faceBundleForFaceStyle:29 onDevice:v3];
      goto LABEL_30;
    }
    uint64_t v7 = @"com.apple.NTKCloudrakerFaceBundle";
LABEL_29:
    uint64_t v28 = [v5 faceBundleForBundleIdentifier:v7 onDevice:v3];
LABEL_30:
    uint64_t v8 = (void *)v28;

    id v22 = [v8 defaultFaceForDevice:v3];
    goto LABEL_31;
  }
  if (v4 == 202) {
    goto LABEL_26;
  }
  if (v4 == 218)
  {
LABEL_9:
    uint64_t v5 = +[NTKFaceBundleManager sharedManager];
    uint64_t v6 = v5;
    uint64_t v7 = @"com.apple.NTKBigNumeralsAnalogFaceBundle";
    goto LABEL_29;
  }
LABEL_12:
  uint64_t v8 = [(NTKFace *)self _migratedFaceBundleIdentifier];
  if (v8)
  {
    id v9 = +[NTKFaceBundleManager sharedManager];
    uint64_t v10 = [v9 faceBundleForBundleIdentifier:v8 onDevice:v3];

    if (v10)
    {
      uint64_t v30 = v10;
      id v31 = v8;
      id v11 = [v10 defaultFaceForDevice:v3];
      [v11 setForMigration:1];
      id v12 = [(NTKFace *)self selectedOptionsForCustomEditModes];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = [*(id *)(*((void *)&v34 + 1) + 8 * i) unsignedIntValue];
            id v18 = [(NTKFace *)self selectedOptionForCustomEditMode:v17 slot:0];
            CGRect v19 = objc_msgSend(v11, "optionAtIndex:forCustomEditMode:slot:", -[NTKFace indexOfOption:forCustomEditMode:slot:](self, "indexOfOption:forCustomEditMode:slot:", v18, v17, 0), v17, 0);
            [v11 selectOption:v19 forCustomEditMode:v17 slot:0];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v14);
      }
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      void v32[2] = __41__NTKFace_Migration___migratedBundleFace__block_invoke;
      v32[3] = &unk_1E62C18C8;
      v32[4] = self;
      id v20 = v11;
      id v33 = v20;
      [(NTKFace *)self enumerateComplicationSlotsWithBlock:v32];
      CGRect v21 = v33;
      id v22 = v20;

      uint64_t v10 = v30;
      uint64_t v8 = v31;
    }
    else
    {
      id v22 = 0;
    }
    goto LABEL_25;
  }
  id v22 = 0;
LABEL_31:

  return v22;
}

void __41__NTKFace_Migration___migratedBundleFace__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 complicationForSlot:v4];
  [*(id *)(a1 + 40) setComplication:v5 forSlot:v4];
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 0;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  return 0;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  return 0;
}

void __48__NTKFace_selectedSlotOptionsForCustomEditMode___block_invoke_cold_1()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "MISSING SELECTION FOR AN EDIT OPTION (face: %@, editMode: %ld). falling back to default edit option.", v4, v5, v6, v7, 2u);
}

- (void)preferredComplicationFamilyForComplication:withSlot:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1BC5A9000, v1, OS_LOG_TYPE_ERROR, "No supported families were found for complication:%@ slot:%@ in descriptor", v2, 0x16u);
}

+ (void)faceWithJSONObjectRepresentation:(os_log_t)log forDevice:forMigration:allowFallbackFromInvalidFaceStyle:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Face bundle fatal error: %@", buf, 0xCu);
}

- (void)hasValidConfigurationForDevice:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = [a1 description];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "Edit option %@ does not exist in device %@", v4, v5, v6, v7, v8);
}

void __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Error getting overlay %@ - using fallback…", (uint8_t *)&v3, 0xCu);
}

void __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 resourceDirectory];
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2112;
  uint8_t v8 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "***** blue_ridge cannot copy resource directory %@ of face %@", (uint8_t *)&v5, 0x16u);
}

@end