@interface NTKGreenfieldDraftRecipe
+ (BOOL)supportsSecureCoding;
+ (id)descriptionFromComplicationOption:(unint64_t)a3;
+ (id)templateForComplicationAtSlot:(id)a3 face:(id)a4;
+ (id)titleFromComplicationOption:(unint64_t)a3;
- (BOOL)_shouldIncludeMetadataForSlot:(id)a3;
- (BOOL)canShareTemplate:(id)a3 slot:(id)a4;
- (BOOL)hasComplicationSharingOptions;
- (NSString)tempPathOverride;
- (NTKFace)faceForSharing;
- (NTKGreenfieldDraftRecipe)initWithCoder:(id)a3;
- (NTKGreenfieldDraftRecipe)initWithFace:(id)a3;
- (id)slotToBundleIdMapping;
- (id)slotToItemIdMapping;
- (id)slotToSampleTemplateMapping;
- (id)sortedComplicationSharingOptions;
- (unint64_t)faceForSharingComplicationOptionsCount;
- (unint64_t)optionForComplicationUniqueIdentifier:(id)a3;
- (void)_buildOptionTypeMapping;
- (void)_buildSlotToItemIdAndBundleIdMapping;
- (void)_buildSlotToSampleTemplateMapping;
- (void)encodeWithCoder:(id)a3;
- (void)setComplicationOption:(unint64_t)a3 forComplicationUniqueIdentifier:(id)a4;
- (void)setTempPathOverride:(id)a3;
@end

@implementation NTKGreenfieldDraftRecipe

- (NTKGreenfieldDraftRecipe)initWithFace:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKGreenfieldDraftRecipe;
  v6 = [(NTKGreenfieldDraftRecipe *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalface, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    complicationUniqueIdentifierToOptionTypeMapping = v7->_complicationUniqueIdentifierToOptionTypeMapping;
    v7->_complicationUniqueIdentifierToOptionTypeMapping = (NSMutableDictionary *)v8;

    [(NTKGreenfieldDraftRecipe *)v7 _buildSlotToSampleTemplateMapping];
    [(NTKGreenfieldDraftRecipe *)v7 _buildSlotToItemIdAndBundleIdMapping];
    [(NTKGreenfieldDraftRecipe *)v7 _buildOptionTypeMapping];
  }

  return v7;
}

- (void)setComplicationOption:(unint64_t)a3 forComplicationUniqueIdentifier:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)self->_complicationUniqueIdentifierToOptionTypeMapping setObject:v8 forKeyedSubscript:v7];
}

- (unint64_t)optionForComplicationUniqueIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_complicationUniqueIdentifierToOptionTypeMapping objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)hasComplicationSharingOptions
{
  v2 = [(NTKGreenfieldDraftRecipe *)self sortedComplicationSharingOptions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)slotToItemIdMapping
{
  BOOL v3 = (void *)[(NSMutableDictionary *)self->_slotToItemIdMapping mutableCopy];
  unint64_t v4 = [(NSMutableDictionary *)self->_slotToItemIdMapping allKeys];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __47__NTKGreenfieldDraftRecipe_slotToItemIdMapping__block_invoke;
  objc_super v11 = &unk_1E62C0160;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:&v8];

  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

void __47__NTKGreenfieldDraftRecipe_slotToItemIdMapping__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldIncludeMetadataForSlot:") & 1) == 0) {
    [*(id *)(a1 + 40) removeObjectForKey:v3];
  }
}

- (id)slotToSampleTemplateMapping
{
  id v3 = (void *)[(NSMutableDictionary *)self->_slotToSampleTemplateMapping mutableCopy];
  unint64_t v4 = [(NSMutableDictionary *)self->_slotToSampleTemplateMapping allKeys];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __55__NTKGreenfieldDraftRecipe_slotToSampleTemplateMapping__block_invoke;
  objc_super v11 = &unk_1E62C0160;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:&v8];

  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

void __55__NTKGreenfieldDraftRecipe_slotToSampleTemplateMapping__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldIncludeMetadataForSlot:") & 1) == 0) {
    [*(id *)(a1 + 40) removeObjectForKey:v3];
  }
}

- (id)slotToBundleIdMapping
{
  id v3 = (void *)[(NSMutableDictionary *)self->_slotToAppIdentifierMapping mutableCopy];
  unint64_t v4 = [(NSMutableDictionary *)self->_slotToAppIdentifierMapping allKeys];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __49__NTKGreenfieldDraftRecipe_slotToBundleIdMapping__block_invoke;
  objc_super v11 = &unk_1E62C0160;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:&v8];

  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

void __49__NTKGreenfieldDraftRecipe_slotToBundleIdMapping__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldIncludeMetadataForSlot:") & 1) == 0) {
    [*(id *)(a1 + 40) removeObjectForKey:v3];
  }
}

- (id)sortedComplicationSharingOptions
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  unint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = objc_opt_class();
  v6 = [(NTKFace *)self->_originalface device];
  originalface = self->_originalface;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__NTKGreenfieldDraftRecipe_sortedComplicationSharingOptions__block_invoke;
  v13[3] = &unk_1E62C60F8;
  v13[4] = self;
  id v14 = v4;
  id v16 = v3;
  uint64_t v17 = v5;
  id v15 = v6;
  id v8 = v3;
  id v9 = v6;
  id v10 = v4;
  [(NTKFace *)originalface enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:v13];
  [v8 sortUsingComparator:&__block_literal_global_110];
  objc_super v11 = (void *)[v8 copy];

  return v11;
}

void __60__NTKGreenfieldDraftRecipe_sortedComplicationSharingOptions__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "complicationForSlot:");
  if ([v3 complicationType])
  {
    unint64_t v4 = [v3 uniqueIdentifier];
    if (([*(id *)(a1 + 40) containsObject:v4] & 1) == 0)
    {
      [*(id *)(a1 + 40) addObject:v4];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = [v3 complicationDescriptor];
        unsigned int v6 = [v5 hasUserInfo];

        uint64_t v7 = v6;
      }
      else
      {
        uint64_t v7 = 0;
      }
      id v8 = [*(id *)(a1 + 64) richComplicationSlotsForDevice:*(void *)(a1 + 48)];
      id v9 = objc_msgSend(v3, "ntk_localizedNameWithOptions:forRichComplicationSlot:", 3, objc_msgSend(v8, "containsObject:", v11));
      id v10 = +[NTKGreenfieldComplicationSharingOption optionWithName:v9 uniqueIdentifier:v4 optionType:v7];
      [*(id *)(a1 + 56) addObject:v10];
    }
  }
}

uint64_t __60__NTKGreenfieldDraftRecipe_sortedComplicationSharingOptions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  unsigned int v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NTKFace)faceForSharing
{
  id v3 = [(NTKFace *)self->_originalface deepCopy];
  id v4 = [(NTKFace *)self->_originalface allVisibleComplicationsForCurrentConfiguration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__NTKGreenfieldDraftRecipe_faceForSharing__block_invoke;
  v10[3] = &unk_1E62C1918;
  id v5 = v3;
  id v11 = v5;
  v12 = self;
  id v13 = v4;
  id v6 = v4;
  [v5 enumerateComplicationSlotsWithBlock:v10];
  uint64_t v7 = v13;
  id v8 = (NTKFace *)v5;

  return v8;
}

void __42__NTKGreenfieldDraftRecipe_faceForSharing__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) complicationForSlot:v3];
  id v5 = *(void **)(a1 + 40);
  id v6 = [v4 uniqueIdentifier];
  uint64_t v7 = [v5 optionForComplicationUniqueIdentifier:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = 2;
  }
  if ([*(id *)(a1 + 48) containsObject:v3]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 2;
  }
  if (v8 == 2)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = +[NTKComplication nullComplication];
    [v9 setComplication:v10 forSlot:v3];

    goto LABEL_18;
  }
  if (v8 != 1) {
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 resetComplicationDescriptor];
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = +[NTKComplication anyComplicationOfType:24];
    [*(id *)(a1 + 32) setComplication:v11 forSlot:v3];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    id v11 = v4;
    v12 = [v11 complication];
    id v13 = [v12 bundleIdentifier];

    if ([v13 isEqualToString:@"com.apple.NanoCompass.complications.waypoints"])
    {
      id v14 = [v11 complication];
      id v15 = [v14 appBundleIdentifier];

      uint64_t v16 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.NanoCompass.complications.waypoint" appBundleIdentifier:v15 complicationDescriptor:0];

      [*(id *)(a1 + 32) setComplication:v16 forSlot:v3];
      id v11 = (id)v16;
    }
  }
LABEL_18:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = NTKFaceStyleDescription([*(id *)(*(void *)(a1 + 40) + 8) faceStyle]);
      int v21 = 138412546;
      id v22 = v3;
      __int16 v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, "Removing placeholder complication at slot: %@ face: %@", (uint8_t *)&v21, 0x16u);
    }
    v19 = *(void **)(a1 + 32);
    v20 = +[NTKComplication nullComplication];
    [v19 setComplication:v20 forSlot:v3];
  }
}

- (unint64_t)faceForSharingComplicationOptionsCount
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v3 = [(NTKGreenfieldDraftRecipe *)self faceForSharing];
  id v4 = [(NTKFace *)self->_originalface deepCopy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__NTKGreenfieldDraftRecipe_faceForSharingComplicationOptionsCount__block_invoke;
  v8[3] = &unk_1E62C2F60;
  id v5 = v4;
  id v9 = v5;
  id v10 = self;
  id v11 = &v12;
  [v3 enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:v8];
  unint64_t v6 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __66__NTKGreenfieldDraftRecipe_faceForSharingComplicationOptionsCount__block_invoke(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) complicationForSlot:a2];
  id v3 = *(void **)(a1 + 40);
  id v4 = [v7 uniqueIdentifier];
  unint64_t v5 = [v3 optionForComplicationUniqueIdentifier:v4];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ([v7 complicationType] && (isKindOfClass & 1) == 0 && v5 <= 1) {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

+ (id)titleFromComplicationOption:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v3 = @"GREENFIELD_SHARE_OPTIONS_REMOVE_COMPLICATION";
    id v4 = @"Don't include";
  }
  else if (a3 == 1)
  {
    id v3 = @"GREENFIELD_SHARE_OPTIONS_KEEP_COMPLICATION_WITHOUT_USER_INFO";
    id v4 = @"Include without data";
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    id v3 = @"GREENFIELD_SHARE_OPTIONS_KEEP_COMPLICATION_INCLUDE_USER_INFO";
    id v4 = @"Include with data";
  }
  NTKClockFaceLocalizedString(v3, v4);
  a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  return a1;
}

+ (id)descriptionFromComplicationOption:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v3 = @"GREENFIELD_SHARE_OPTIONS_REMOVE_COMPLICATION_FOOTER";
    id v4 = @"This complication will not be shared as part of the watch face.";
  }
  else if (a3 == 1)
  {
    id v3 = @"GREENFIELD_SHARE_OPTIONS_KEEP_COMPLICATION_WITHOUT_USER_INFO_FOOTER";
    id v4 = @"Including this complication without data will share a generic complication that launches the app but will not include personal data.";
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    id v3 = @"GREENFIELD_SHARE_OPTIONS_KEEP_COMPLICATION_INCLUDE_USER_INFO_FOOTER";
    id v4 = @"Including this complication with data could share location, descriptions, keywords, names, or other personally identifiable information.";
  }
  NTKClockFaceLocalizedString(v3, v4);
  a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  return a1;
}

- (BOOL)_shouldIncludeMetadataForSlot:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NTKFace *)self->_originalface allVisibleComplicationsForCurrentConfiguration];
  if ([v5 containsObject:v4])
  {
    unint64_t v6 = [(NTKFace *)self->_originalface complicationForSlot:v4];
    id v7 = [v6 uniqueIdentifier];
    unint64_t v8 = [(NTKGreenfieldDraftRecipe *)self optionForComplicationUniqueIdentifier:v7];

    BOOL v9 = v8 != 2;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_buildSlotToSampleTemplateMapping
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  slotToSampleTemplateMapping = self->_slotToSampleTemplateMapping;
  self->_slotToSampleTemplateMapping = v3;

  originalface = self->_originalface;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__NTKGreenfieldDraftRecipe__buildSlotToSampleTemplateMapping__block_invoke;
  v6[3] = &unk_1E62C3800;
  v6[4] = self;
  [(NTKFace *)originalface enumerateComplicationSlotsWithBlock:v6];
}

void __61__NTKGreenfieldDraftRecipe__buildSlotToSampleTemplateMapping__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(*(void *)(a1 + 32) + 8);
  unint64_t v5 = [(id)objc_opt_class() templateForComplicationAtSlot:v3 face:v4];
  if (v5)
  {
    if ([*(id *)(a1 + 32) canShareTemplate:v5 slot:v3]) {
      [*(id *)(*(void *)(a1 + 32) + 16) setObject:v5 forKey:v3];
    }
  }
  else
  {
    unint64_t v6 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61__NTKGreenfieldDraftRecipe__buildSlotToSampleTemplateMapping__block_invoke_cold_1((uint64_t)v3, v4, v6);
    }
  }
}

+ (id)templateForComplicationAtSlot:(id)a3 face:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 complicationForSlot:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = 0;
  }
  else
  {
    BOOL v9 = [v6 complicationVariantForComplication:v7 withSlot:v5];
    uint64_t v10 = [v9 family];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v7;
      v24 = [v6 device];
      uint64_t v12 = +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:](NTKCompanionComplicationCollectionManager, "sharedComplicationCollectionForDevice:");
      id v13 = [v11 clientIdentifier];
      uint64_t v14 = [v11 complicationDescriptor];
      uint64_t v15 = [v11 appBundleIdentifier];
      __int16 v23 = v12;
      uint64_t v16 = [v12 sampleTemplateForClientIdentifier:v13 descriptor:v14 applicationID:v15 family:v10];

      if (!v16)
      {
        uint64_t v17 = [NTKCompanionRemoteComplicationDataSource alloc];
        v18 = [v6 device];
        v19 = objc_opt_new();
        v20 = [(CLKCComplicationDataSource *)v17 initWithComplication:v11 family:v10 forDevice:v18 context:v19];

        uint64_t v16 = [(NTKCompanionRemoteComplicationDataSource *)v20 currentSwitcherTemplate];
      }
    }
    else
    {
      int v21 = [v6 device];
      id v11 = +[NTKComplicationController controllerForComplication:v7 variant:v9 device:v21];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = [v11 sharingTemplate];
      }
      else
      {
        uint64_t v16 = 0;
      }
    }

    id v8 = v16;
  }

  return v8;
}

- (BOOL)canShareTemplate:(id)a3 slot:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke;
  v33[3] = &unk_1E62C6140;
  id v8 = v6;
  id v34 = v8;
  v36 = &v37;
  id v9 = v7;
  id v35 = v9;
  [v8 _enumerateFullColorImageProviderKeysWithBlock:v33];
  if (*((unsigned char *)v38 + 24))
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke_54;
    v29[3] = &unk_1E62C6168;
    id v10 = v8;
    id v30 = v10;
    v32 = &v37;
    id v11 = v9;
    id v31 = v11;
    [v10 enumerateTextProviderKeysWithBlock:v29];
    if (*((unsigned char *)v38 + 24))
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke_60;
      v25[3] = &unk_1E62C6168;
      id v12 = v10;
      id v26 = v12;
      v28 = &v37;
      id v13 = v11;
      id v27 = v13;
      [v12 enumerateImageProviderKeysWithBlock:v25];
      if (!*((unsigned char *)v38 + 24)) {
        goto LABEL_11;
      }
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = [v12 metadata];
      LOBYTE(v14) = [(id)v14 dictionaryIsCompatibleWithJSONSerialization:v15];

      if ((v14 & 1) == 0)
      {
        *((unsigned char *)v38 + 24) = 0;
        uint64_t v16 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v12 metadata];
          *(_DWORD *)buf = 138412546;
          id v42 = v13;
          __int16 v43 = 2112;
          v44 = v17;
          _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, "Sample template for slot: %@ can't be shared because it has a non JSON representable dictionary %@.", buf, 0x16u);
        }
      }
      if (*((unsigned char *)v38 + 24))
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke_62;
        v20[3] = &unk_1E62C6190;
        id v21 = v12;
        id v22 = self;
        id v23 = v13;
        v24 = &v37;
        [v21 _enumerateEmbeddedTemplateKeysWithBlock:v20];
        BOOL v18 = *((unsigned char *)v38 + 24) != 0;
      }
      else
      {
LABEL_11:
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  _Block_object_dispose(&v37, 8);
  return v18;
}

void __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = [*(id *)(a1 + 32) valueForKey:a2];
  if ([v9 ImageViewClass])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a7 = 1;
    id v10 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Sample template for slot: %@ can't be shared because it has a custom view class.", (uint8_t *)&v12, 0xCu);
    }
  }
}

void __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke_54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = [*(id *)(a1 + 32) valueForKey:a2];
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || [v9 isEqualToString:@"DoseTextProvider"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
    id v10 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Sample template for slot: %@ can't be shared because it is CLKOverrideTextProvider.", (uint8_t *)&v12, 0xCu);
    }
  }
}

void __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke_60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = [*(id *)(a1 + 32) valueForKey:a2];
  id v8 = [v7 imageViewCreationHandler];

  if (v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
    id v9 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "Sample template for slot: %@ can't be shared because it is has a custom image view class.", (uint8_t *)&v11, 0xCu);
    }
  }
}

void __50__NTKGreenfieldDraftRecipe_canShareTemplate_slot___block_invoke_62(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = [*(id *)(a1 + 32) valueForKey:a2];
  if ((objc_msgSend(*(id *)(a1 + 40), "canShareTemplate:slot:") & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a5 = 1;
  }
}

- (void)_buildSlotToItemIdAndBundleIdMapping
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  slotToItemIdMapping = self->_slotToItemIdMapping;
  self->_slotToItemIdMapping = v3;

  id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  slotToAppIdentifierMapping = self->_slotToAppIdentifierMapping;
  self->_slotToAppIdentifierMapping = v5;

  originalface = self->_originalface;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__NTKGreenfieldDraftRecipe__buildSlotToItemIdAndBundleIdMapping__block_invoke;
  v8[3] = &unk_1E62C3800;
  void v8[4] = self;
  [(NTKFace *)originalface enumerateComplicationSlotsWithBlock:v8];
}

void __64__NTKGreenfieldDraftRecipe__buildSlotToItemIdAndBundleIdMapping__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "complicationForSlot:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 clientIdentifier];
    }
    else {
    id v4 = [v3 appIdentifier];
    }
    if (v4)
    {
      id v5 = NTKSharedRemoteComplicationProvider();
      id v6 = [v5 itemIdForVendorWithClientIdentifier:v4];

      if (v6) {
        id v7 = v6;
      }
      else {
        id v7 = &unk_1F16E1F98;
      }
      [*(id *)(*(void *)(a1 + 32) + 24) setObject:v7 forKeyedSubscript:v9];
      id v8 = [v3 appIdentifier];
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:v8 forKeyedSubscript:v9];
    }
  }
}

- (void)_buildOptionTypeMapping
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  complicationUniqueIdentifierToOptionTypeMapping = self->_complicationUniqueIdentifierToOptionTypeMapping;
  self->_complicationUniqueIdentifierToOptionTypeMapping = v3;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NTKGreenfieldDraftRecipe *)self sortedComplicationSharingOptions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = [v10 uniqueIdentifier];
        uint64_t v12 = [v10 optionType];
        if (v12)
        {
          if (v12 != 1) {
            goto LABEL_11;
          }
          uint64_t v13 = &unk_1F16E1FC8;
        }
        else
        {
          uint64_t v13 = &unk_1F16E1FB0;
        }
        [(NSMutableDictionary *)self->_complicationUniqueIdentifierToOptionTypeMapping setObject:v13 forKeyedSubscript:v11];
LABEL_11:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  originalface = self->_originalface;
  id v5 = a3;
  id v6 = [(NTKFace *)originalface instanceDescriptor];
  [v5 encodeObject:v6 forKey:@"kNTKGreenfieldWatchfaceKey"];
  [v5 encodeObject:self->_complicationUniqueIdentifierToOptionTypeMapping forKey:@"kNTKGreenfieldComplicationUniqueIdentifierToOptionTypeMappingKey"];
  [v5 encodeObject:self->_tempPathOverride forKey:@"kNTKGreenfieldTempPathKey"];
  [v5 encodeObject:self->_slotToSampleTemplateMapping forKey:@"kNTKGreenfieldSlotToSampleTemplateMappingKey"];
  [v5 encodeObject:self->_slotToItemIdMapping forKey:@"kNTKGreenfieldSlotToItemIdMappingKey"];
  [v5 encodeObject:self->_slotToAppIdentifierMapping forKey:@"kNTKGreenfieldSlotToBundleIdMappingKey"];
}

- (NTKGreenfieldDraftRecipe)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)NTKGreenfieldDraftRecipe;
  id v5 = [(NTKGreenfieldDraftRecipe *)&v36 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNTKGreenfieldWatchfaceKey"];
    uint64_t v7 = +[NTKFace faceWithInstanceDescriptor:v6];
    originalface = v5->_originalface;
    v5->_originalface = (NTKFace *)v7;

    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kNTKGreenfieldComplicationUniqueIdentifierToOptionTypeMappingKey"];
    complicationUniqueIdentifierToOptionTypeMapping = v5->_complicationUniqueIdentifierToOptionTypeMapping;
    v5->_complicationUniqueIdentifierToOptionTypeMapping = (NSMutableDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNTKGreenfieldTempPathKey"];
    tempPathOverride = v5->_tempPathOverride;
    v5->_tempPathOverride = (NSString *)v16;

    BOOL v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    id v21 = objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);

    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"kNTKGreenfieldSlotToSampleTemplateMappingKey"];
    slotToSampleTemplateMapping = v5->_slotToSampleTemplateMapping;
    v5->_slotToSampleTemplateMapping = (NSMutableDictionary *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    id v27 = objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);

    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"kNTKGreenfieldSlotToItemIdMappingKey"];
    slotToItemIdMapping = v5->_slotToItemIdMapping;
    v5->_slotToItemIdMapping = (NSMutableDictionary *)v28;

    id v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);

    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"kNTKGreenfieldSlotToBundleIdMappingKey"];
    slotToAppIdentifierMapping = v5->_slotToAppIdentifierMapping;
    v5->_slotToAppIdentifierMapping = (NSMutableDictionary *)v33;
  }
  return v5;
}

- (NSString)tempPathOverride
{
  return self->_tempPathOverride;
}

- (void)setTempPathOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempPathOverride, 0);
  objc_storeStrong((id *)&self->_slotToAppIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_complicationUniqueIdentifierToOptionTypeMapping, 0);
  objc_storeStrong((id *)&self->_slotToItemIdMapping, 0);
  objc_storeStrong((id *)&self->_slotToSampleTemplateMapping, 0);
  objc_storeStrong((id *)&self->_originalface, 0);
}

void __61__NTKGreenfieldDraftRecipe__buildSlotToSampleTemplateMapping__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = NTKFaceStyleDescription([a2 faceStyle]);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "Missing sample template for slot: %@ face: %@", (uint8_t *)&v6, 0x16u);
}

@end