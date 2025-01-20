@interface NTKGreenfieldDecodedRecipe
+ (BOOL)supportsSecureCoding;
- (BOOL)_template:(id)a3 isUnsupportedForComplication:(id)a4;
- (BOOL)wasModifiedForThisDevice;
- (NSDictionary)complicationSlotToBundleIdMapping;
- (NSDictionary)complicationSlotToItemIdMapping;
- (NSDictionary)complicationSlotToNameMapping;
- (NSDictionary)complicationSlotToTemplateMapping;
- (NSNumber)senderBoxedDeviceSize;
- (NSString)noBorderFacePreviewImagePath;
- (NTKFace)watchFace;
- (NTKGreenfieldDecodedRecipe)initWithCoder:(id)a3;
- (NTKGreenfieldDecodedRecipe)initWithWatchFace:(id)a3 complicationSlotToTemplateMapping:(id)a4 complicationSlotToItemIdMapping:(id)a5 complicationSlotToNameMapping:(id)a6 complicationSlotToBundleIdMapping:(id)a7 isUsingModifiedComplicationsSet:(BOOL)a8 noBorderFacePreviewImagePath:(id)a9 senderBoxedDeviceSize:(id)a10;
- (id)_overrideTemplateForComplication:(id)a3 atSlot:(id)a4 face:(id)a5;
- (void)collectOverrideTemplates;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKGreenfieldDecodedRecipe

- (NTKGreenfieldDecodedRecipe)initWithWatchFace:(id)a3 complicationSlotToTemplateMapping:(id)a4 complicationSlotToItemIdMapping:(id)a5 complicationSlotToNameMapping:(id)a6 complicationSlotToBundleIdMapping:(id)a7 isUsingModifiedComplicationsSet:(BOOL)a8 noBorderFacePreviewImagePath:(id)a9 senderBoxedDeviceSize:(id)a10
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v16 = a9;
  id v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)NTKGreenfieldDecodedRecipe;
  v18 = [(NTKGreenfieldDecodedRecipe *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_watchFace, a3);
    objc_storeStrong((id *)&v19->_complicationSlotToTemplateMapping, a4);
    objc_storeStrong((id *)&v19->_complicationSlotToItemIdMapping, a5);
    objc_storeStrong((id *)&v19->_complicationSlotToNameMapping, a6);
    objc_storeStrong((id *)&v19->_complicationSlotToBundleIdMapping, a7);
    v19->_isUsingModifiedComplicationsSet = a8;
    objc_storeStrong((id *)&v19->_noBorderFacePreviewImagePath, a9);
    objc_storeStrong((id *)&v19->_senderBoxedDeviceSize, a10);
  }

  return v19;
}

- (NSDictionary)complicationSlotToTemplateMapping
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 addEntriesFromDictionary:self->_complicationSlotToTemplateMapping];
  if (self->_complicationSlotToTemplateOverrideMapping) {
    objc_msgSend(v3, "addEntriesFromDictionary:");
  }
  v4 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "complicationSlotToTemplateMapping: %@", (uint8_t *)&v6, 0xCu);
  }

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NTKGreenfieldDecodedRecipe *)self watchFace];
  id v11 = [v5 instanceDescriptor];

  [v4 encodeObject:v11 forKey:@"NTKGreenfieldWatchfaceKey"];
  [v4 encodeObject:self->_complicationSlotToTemplateMapping forKey:@"NTKGreenfieldComplicationSlotToTemplateMappingKey"];
  int v6 = [(NTKGreenfieldDecodedRecipe *)self complicationSlotToItemIdMapping];
  [v4 encodeObject:v6 forKey:@"kNTKGreenfieldComplicationSlotToItemIdMappingKey"];

  v7 = [(NTKGreenfieldDecodedRecipe *)self complicationSlotToBundleIdMapping];
  [v4 encodeObject:v7 forKey:@"kNTKGreenfieldComplicationSlotToBundleIdMappingKey"];

  uint64_t v8 = [(NTKGreenfieldDecodedRecipe *)self complicationSlotToNameMapping];
  [v4 encodeObject:v8 forKey:@"kNTKGreenfieldComplicationSlotToNameMappingKey"];

  [v4 encodeBool:self->_isUsingModifiedComplicationsSet forKey:@"kNTKGreenfieldIsUsingModifiedComplicationsSet"];
  v9 = [(NTKGreenfieldDecodedRecipe *)self noBorderFacePreviewImagePath];
  [v4 encodeObject:v9 forKey:@"NTKGreenfieldNoBordersWatchFaceSnapshotPathKey"];

  v10 = [(NTKGreenfieldDecodedRecipe *)self senderBoxedDeviceSize];
  [v4 encodeObject:v10 forKey:@"NTKGreenfieldDeviceSizePathKey"];
}

- (NTKGreenfieldDecodedRecipe)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)NTKGreenfieldDecodedRecipe;
  v5 = [(NTKGreenfieldDecodedRecipe *)&v33 init];
  if (v5)
  {
    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NTKGreenfieldWatchfaceKey"];
    uint64_t v6 = +[NTKFace faceWithInstanceDescriptor:v32];
    watchFace = v5->_watchFace;
    v5->_watchFace = (NTKFace *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"NTKGreenfieldComplicationSlotToTemplateMappingKey"];
    complicationSlotToTemplateMapping = v5->_complicationSlotToTemplateMapping;
    v5->_complicationSlotToTemplateMapping = (NSDictionary *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);

    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kNTKGreenfieldComplicationSlotToItemIdMappingKey"];
    complicationSlotToItemIdMapping = v5->_complicationSlotToItemIdMapping;
    v5->_complicationSlotToItemIdMapping = (NSDictionary *)v19;

    uint64_t v21 = [v4 decodeObjectOfClasses:v18 forKey:@"kNTKGreenfieldComplicationSlotToBundleIdMappingKey"];
    complicationSlotToBundleIdMapping = v5->_complicationSlotToBundleIdMapping;
    v5->_complicationSlotToBundleIdMapping = (NSDictionary *)v21;

    uint64_t v23 = [v4 decodeObjectOfClasses:v18 forKey:@"kNTKGreenfieldComplicationSlotToNameMappingKey"];
    complicationSlotToNameMapping = v5->_complicationSlotToNameMapping;
    v5->_complicationSlotToNameMapping = (NSDictionary *)v23;

    v5->_isUsingModifiedComplicationsSet = [v4 decodeBoolForKey:@"kNTKGreenfieldIsUsingModifiedComplicationsSet"];
    id v25 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);

    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"NTKGreenfieldNoBordersWatchFaceSnapshotPathKey"];
    noBorderFacePreviewImagePath = v5->_noBorderFacePreviewImagePath;
    v5->_noBorderFacePreviewImagePath = (NSString *)v26;

    v28 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);

    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"NTKGreenfieldDeviceSizePathKey"];
    senderBoxedDeviceSize = v5->_senderBoxedDeviceSize;
    v5->_senderBoxedDeviceSize = (NSNumber *)v29;
  }
  return v5;
}

- (id)_overrideTemplateForComplication:(id)a3 atSlot:(id)a4 face:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(NTKFace *)self->_watchFace complicationVariantForComplication:v8 withSlot:v9];
  uint64_t v12 = [v11 family];
  objc_opt_class();
  uint64_t v36 = v12;
  if (objc_opt_isKindOfClass())
  {
    id v13 = v8;
    v14 = [v13 appBundleIdentifier];
    +[NTKComplicationCollection lsSDKVersionForApplicationID:v14];
    id v33 = v8;
    uint64_t v16 = v15 = v12;

    uint64_t v17 = [v10 device];
    +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:v17];
    v34 = v11;
    id v35 = v9;
    uint64_t v19 = v18 = v10;
    [v13 clientIdentifier];
    uint64_t v21 = v20 = self;
    id v22 = [v13 complicationDescriptor];
    uint64_t v23 = [v13 appBundleIdentifier];

    uint64_t v24 = v15;
    id v8 = v33;
    id v25 = [v19 sampleTemplateForClientIdentifier:v21 descriptor:v22 applicationID:v23 family:v24];

    self = v20;
    id v10 = v18;
    uint64_t v11 = v34;
    id v9 = v35;
  }
  else
  {
    uint64_t v26 = [v10 device];
    uint64_t v17 = +[NTKComplicationController controllerForComplication:v8 variant:v11 device:v26];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = [v17 sharingTemplate];
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = 0;
      id v25 = 0;
    }
  }

  objc_super v27 = (void *)v16;
  if (v25) {
    goto LABEL_8;
  }
  v28 = [(NSDictionary *)self->_complicationSlotToNameMapping objectForKeyedSubscript:v9];
  uint64_t v29 = [(NSDictionary *)self->_complicationSlotToBundleIdMapping objectForKeyedSubscript:v9];
  v30 = [v10 device];
  id v25 = +[NTKGreenfieldFallbackTemplateProvider templateForClientIdentifier:v29 displayName:v28 family:v36 device:v30 sdkVersion:v16];

  if (v25)
  {
LABEL_8:
    v31 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v38 = v8;
      __int16 v39 = 2112;
      id v40 = v9;
      __int16 v41 = 2112;
      v42 = v25;
      _os_log_impl(&dword_1BC5A9000, v31, OS_LOG_TYPE_DEFAULT, "_overrideTemplateForComplication: '%@' at slot '%@': %@", buf, 0x20u);
    }
  }
  else
  {
    v31 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[NTKGreenfieldDecodedRecipe _overrideTemplateForComplication:atSlot:face:](v31);
    }
    id v25 = 0;
  }

  return v25;
}

- (void)collectOverrideTemplates
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  watchFace = self->_watchFace;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__NTKGreenfieldDecodedRecipe_collectOverrideTemplates__block_invoke;
  v8[3] = &unk_1E62C18C8;
  v8[4] = self;
  v5 = v3;
  id v9 = v5;
  [(NTKFace *)watchFace enumerateComplicationSlotsWithBlock:v8];
  complicationSlotToTemplateOverrideMapping = self->_complicationSlotToTemplateOverrideMapping;
  self->_complicationSlotToTemplateOverrideMapping = v5;
  v7 = v5;
}

void __54__NTKGreenfieldDecodedRecipe_collectOverrideTemplates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 32) complicationForSlot:v3];
  v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "collectOverrideTemplates: original complication '%@' in slot '%@'", (uint8_t *)&v16, 0x16u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 32) complicationForSlot:v3];
    uint64_t v7 = [v6 complication];

    id v4 = (void *)v7;
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v3];
  if ([v4 complicationType])
  {
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 32) preferredComplicationFamilyForComplication:v4 withSlot:v3];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (id v10 = *(void **)(*(void *)(a1 + 32) + 32),
          id v11 = v4,
          [v10 device],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v11 supportsComplicationFamily:v9 forDevice:v12],
          v11,
          v12,
          (v13 & 1) == 0))
    {
      if (!v8
        || ![v8 isCompatibleWithFamily:v9]
        || [*(id *)(a1 + 32) _template:v8 isUnsupportedForComplication:v4])
      {
        v14 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412546;
          id v17 = v3;
          __int16 v18 = 2112;
          id v19 = v8;
          _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "collectOverrideTemplates: slot '%@' has invalid template: %@", (uint8_t *)&v16, 0x16u);
        }

        uint64_t v15 = [*(id *)(a1 + 32) _overrideTemplateForComplication:v4 atSlot:v3 face:*(void *)(*(void *)(a1 + 32) + 32)];
        [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:v3];
      }
    }
  }
}

- (BOOL)_template:(id)a3 isUnsupportedForComplication:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 complicationType];
  BOOL v7 = 0;
  if (v6 > 15)
  {
    if (v6 != 16)
    {
      if (v6 != 18) {
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_14;
      }
LABEL_12:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_14;
    }
LABEL_11:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (v6 == 1) {
    goto LABEL_11;
  }
  if (v6 == 8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_13:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v7 = 0;
        goto LABEL_15;
      }
    }
LABEL_14:
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

- (BOOL)wasModifiedForThisDevice
{
  return self->_isUsingModifiedComplicationsSet;
}

- (NTKFace)watchFace
{
  return self->_watchFace;
}

- (NSDictionary)complicationSlotToItemIdMapping
{
  return self->_complicationSlotToItemIdMapping;
}

- (NSDictionary)complicationSlotToNameMapping
{
  return self->_complicationSlotToNameMapping;
}

- (NSDictionary)complicationSlotToBundleIdMapping
{
  return self->_complicationSlotToBundleIdMapping;
}

- (NSString)noBorderFacePreviewImagePath
{
  return self->_noBorderFacePreviewImagePath;
}

- (NSNumber)senderBoxedDeviceSize
{
  return self->_senderBoxedDeviceSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderBoxedDeviceSize, 0);
  objc_storeStrong((id *)&self->_noBorderFacePreviewImagePath, 0);
  objc_storeStrong((id *)&self->_complicationSlotToBundleIdMapping, 0);
  objc_storeStrong((id *)&self->_complicationSlotToNameMapping, 0);
  objc_storeStrong((id *)&self->_complicationSlotToItemIdMapping, 0);
  objc_storeStrong((id *)&self->_watchFace, 0);
  objc_storeStrong((id *)&self->_complicationSlotToTemplateOverrideMapping, 0);
  objc_storeStrong((id *)&self->_complicationSlotToTemplateMapping, 0);
}

- (void)_overrideTemplateForComplication:(os_log_t)log atSlot:face:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "_overrideTemplateForComplication: unable to provide fallback template. This should not be happening.", v1, 2u);
}

@end