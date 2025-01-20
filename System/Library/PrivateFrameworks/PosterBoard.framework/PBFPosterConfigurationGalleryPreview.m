@interface PBFPosterConfigurationGalleryPreview
- (NSArray)suggestedComplications;
- (NSArray)suggestedLandscapeComplications;
- (NSString)complicationLayoutType;
- (NSString)displayNameLocalizationKey;
- (NSString)galleryLocalizedDescription;
- (NSString)galleryLocalizedTitle;
- (NSString)previewUniqueIdentifier;
- (NSString)type;
- (PBFComplicationLookupInfo)subtitleComplication;
- (PBFGalleryOptions)galleryOptions;
- (PBFPosterConfigurationGalleryPreview)initWithConfiguration:(id)a3 extension:(id)a4;
- (PBFPosterDescriptorLookupInfo)posterDescriptorLookupInfo;
- (PRPosterConfiguration)configuration;
- (PRPosterFocusConfiguration)focusConfiguration;
- (PRPosterHomeScreenConfiguration)homeScreenConfiguration;
- (PRPosterRenderingConfiguration)renderingConfiguration;
- (PRPosterTitleStyleConfiguration)titleStyleConfiguration;
- (unint64_t)galleryDisplayStyle;
- (unint64_t)presentationStyle;
@end

@implementation PBFPosterConfigurationGalleryPreview

- (PBFPosterConfigurationGalleryPreview)initWithConfiguration:(id)a3 extension:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  NSClassFromString(&cfstr_Prposterconfig.isa);
  if (!v10)
  {
    v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterConfigurationGalleryPreview initWithConfiguration:extension:](a2);
    }
LABEL_17:
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325D990);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterConfigurationGalleryPreview initWithConfiguration:extension:](a2);
    }
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325D9F4);
  }

  if (!v9)
  {
    v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extension"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterConfigurationGalleryPreview initWithConfiguration:extension:](a2);
    }
    goto LABEL_17;
  }
  v42.receiver = self;
  v42.super_class = (Class)PBFPosterConfigurationGalleryPreview;
  v11 = [(PBFPosterConfigurationGalleryPreview *)&v42 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a3);
    v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];
    previewUniqueIdentifier = v12->_previewUniqueIdentifier;
    v12->_previewUniqueIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v12->_type, PBFPreviewTypeDefault);
    uint64_t v16 = [v10 loadTitleStyleConfigurationWithError:0];
    titleStyleConfiguration = v12->_titleStyleConfiguration;
    v12->_titleStyleConfiguration = (PRPosterTitleStyleConfiguration *)v16;

    v18 = [v10 loadOtherMetadataWithError:0];
    uint64_t v19 = [v18 displayNameLocalizationKey];
    displayNameLocalizationKey = v12->_displayNameLocalizationKey;
    v12->_displayNameLocalizationKey = (NSString *)v19;

    v21 = [v10 _path];
    uint64_t v22 = +[PBFGenericPosterDescriptorLookupInfo posterDescriptorLookupInfoForPath:v21 extension:v9];
    posterDescriptorLookupInfo = v12->_posterDescriptorLookupInfo;
    v12->_posterDescriptorLookupInfo = (PBFPosterDescriptorLookupInfo *)v22;

    v24 = [v9 localizedName];
    uint64_t v25 = [v24 copy];
    galleryLocalizedTitle = v12->_galleryLocalizedTitle;
    v12->_galleryLocalizedTitle = (NSString *)v25;

    galleryLocalizedDescription = v12->_galleryLocalizedDescription;
    v12->_galleryLocalizedDescription = 0;

    v12->_galleryDisplayStyle = 0;
    v28 = [v10 loadComplicationLayoutWithError:0];
    v29 = [v28 inlineComplication];

    if (v29)
    {
      v30 = [v28 inlineComplication];
      uint64_t v31 = objc_msgSend(v30, "pbf_complicationLookupInfo");
      subtitleComplication = v12->_subtitleComplication;
      v12->_subtitleComplication = (PBFComplicationLookupInfo *)v31;
    }
    v33 = [v28 complications];
    uint64_t v34 = objc_msgSend(v33, "bs_map:", &__block_literal_global_18);
    suggestedComplications = v12->_suggestedComplications;
    v12->_suggestedComplications = (NSArray *)v34;

    v36 = [v28 sidebarComplications];
    uint64_t v37 = objc_msgSend(v36, "bs_map:", &__block_literal_global_20);
    suggestedLandscapeComplications = v12->_suggestedLandscapeComplications;
    v12->_suggestedLandscapeComplications = (NSArray *)v37;
  }
  return v12;
}

uint64_t __72__PBFPosterConfigurationGalleryPreview_initWithConfiguration_extension___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbf_complicationLookupInfo");
}

uint64_t __72__PBFPosterConfigurationGalleryPreview_initWithConfiguration_extension___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbf_complicationLookupInfo");
}

- (NSString)previewUniqueIdentifier
{
  return self->_previewUniqueIdentifier;
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (NSString)galleryLocalizedTitle
{
  return self->_galleryLocalizedTitle;
}

- (NSString)galleryLocalizedDescription
{
  return self->_galleryLocalizedDescription;
}

- (PBFPosterDescriptorLookupInfo)posterDescriptorLookupInfo
{
  return self->_posterDescriptorLookupInfo;
}

- (PRPosterTitleStyleConfiguration)titleStyleConfiguration
{
  return self->_titleStyleConfiguration;
}

- (PBFComplicationLookupInfo)subtitleComplication
{
  return self->_subtitleComplication;
}

- (NSArray)suggestedComplications
{
  return self->_suggestedComplications;
}

- (NSArray)suggestedLandscapeComplications
{
  return self->_suggestedLandscapeComplications;
}

- (NSString)complicationLayoutType
{
  return self->_complicationLayoutType;
}

- (PRPosterHomeScreenConfiguration)homeScreenConfiguration
{
  return self->_homeScreenConfiguration;
}

- (PRPosterFocusConfiguration)focusConfiguration
{
  return self->_focusConfiguration;
}

- (PRPosterRenderingConfiguration)renderingConfiguration
{
  return self->_renderingConfiguration;
}

- (NSString)type
{
  return self->_type;
}

- (PBFGalleryOptions)galleryOptions
{
  return self->_galleryOptions;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (unint64_t)galleryDisplayStyle
{
  return self->_galleryDisplayStyle;
}

- (PRPosterConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_galleryOptions, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_renderingConfiguration, 0);
  objc_storeStrong((id *)&self->_focusConfiguration, 0);
  objc_storeStrong((id *)&self->_homeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_complicationLayoutType, 0);
  objc_storeStrong((id *)&self->_suggestedLandscapeComplications, 0);
  objc_storeStrong((id *)&self->_suggestedComplications, 0);
  objc_storeStrong((id *)&self->_subtitleComplication, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_posterDescriptorLookupInfo, 0);
  objc_storeStrong((id *)&self->_galleryLocalizedDescription, 0);
  objc_storeStrong((id *)&self->_galleryLocalizedTitle, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_previewUniqueIdentifier, 0);
}

- (void)initWithConfiguration:(const char *)a1 extension:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfiguration:(const char *)a1 extension:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end