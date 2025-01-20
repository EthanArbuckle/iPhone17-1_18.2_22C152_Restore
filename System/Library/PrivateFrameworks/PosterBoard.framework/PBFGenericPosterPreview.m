@interface PBFGenericPosterPreview
+ (id)posterPreviewWithUniqueIdentifier:(id)a3 displayNameLocalizationKey:(id)a4 galleryLocalizedTitle:(id)a5 galleryLocalizedDescription:(id)a6 posterDescriptorLookupInfo:(id)a7 titleStyleConfiguration:(id)a8 focusConfiguration:(id)a9 subtitleComplication:(id)a10 suggestedComplications:(id)a11 suggestedLandscapeComplications:(id)a12 complicationLayoutType:(id)a13 renderingConfiguration:(id)a14 homeScreenConfiguration:(id)a15 previewType:(id)a16 galleryOptions:(id)a17;
+ (id)testPosterPreviewWithLocalizedTitle:(id)a3 description:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)suggestedComplications;
- (NSArray)suggestedLandscapeComplications;
- (NSString)complicationLayoutType;
- (NSString)description;
- (NSString)displayNameLocalizationKey;
- (NSString)galleryLocalizedDescription;
- (NSString)galleryLocalizedTitle;
- (NSString)previewUniqueIdentifier;
- (NSString)type;
- (PBFComplicationLookupInfo)subtitleComplication;
- (PBFGalleryOptions)galleryOptions;
- (PBFPosterDescriptorLookupInfo)posterDescriptorLookupInfo;
- (PRPosterFocusConfiguration)focusConfiguration;
- (PRPosterHomeScreenConfiguration)homeScreenConfiguration;
- (PRPosterRenderingConfiguration)renderingConfiguration;
- (PRPosterTitleStyleConfiguration)titleStyleConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)galleryDisplayStyle;
- (unint64_t)hash;
- (unint64_t)presentationStyle;
- (void)_hydrateGalleryOptions;
@end

@implementation PBFGenericPosterPreview

+ (id)posterPreviewWithUniqueIdentifier:(id)a3 displayNameLocalizationKey:(id)a4 galleryLocalizedTitle:(id)a5 galleryLocalizedDescription:(id)a6 posterDescriptorLookupInfo:(id)a7 titleStyleConfiguration:(id)a8 focusConfiguration:(id)a9 subtitleComplication:(id)a10 suggestedComplications:(id)a11 suggestedLandscapeComplications:(id)a12 complicationLayoutType:(id)a13 renderingConfiguration:(id)a14 homeScreenConfiguration:(id)a15 previewType:(id)a16 galleryOptions:(id)a17
{
  v22 = (NSString *)a3;
  id v73 = a4;
  id v72 = a5;
  id v71 = a6;
  v23 = (PBFPosterDescriptorLookupInfo *)a7;
  id v70 = a8;
  id v69 = a9;
  v24 = v22;
  v25 = (PBFComplicationLookupInfo *)a10;
  v26 = (NSArray *)a11;
  v27 = (NSArray *)a12;
  v28 = (NSString *)a13;
  id v68 = a14;
  v29 = (PRPosterHomeScreenConfiguration *)a15;
  id v67 = a16;
  v66 = (PBFGalleryOptions *)a17;
  if (v22)
  {
    if (v23) {
      goto LABEL_3;
    }
  }
  else
  {
    v59 = [MEMORY[0x1E4F28B00] currentHandler];
    [v59 handleFailureInMethod:a2, a1, @"PBFPosterPreview.m", 210, @"Invalid parameter not satisfying: %@", @"previewUniqueIdentifier" object file lineNumber description];

    if (v23) {
      goto LABEL_3;
    }
  }
  v60 = [MEMORY[0x1E4F28B00] currentHandler];
  [v60 handleFailureInMethod:a2, a1, @"PBFPosterPreview.m", 211, @"Invalid parameter not satisfying: %@", @"posterLookupInfo" object file lineNumber description];

LABEL_3:
  v30 = objc_alloc_init(PBFGenericPosterPreview);
  previewUniqueIdentifier = v30->_previewUniqueIdentifier;
  v30->_previewUniqueIdentifier = v24;
  v65 = v24;

  uint64_t v32 = [v73 copy];
  displayNameLocalizationKey = v30->_displayNameLocalizationKey;
  v30->_displayNameLocalizationKey = (NSString *)v32;

  uint64_t v34 = [v72 copy];
  galleryLocalizedTitle = v30->_galleryLocalizedTitle;
  v30->_galleryLocalizedTitle = (NSString *)v34;

  uint64_t v36 = [v71 copy];
  galleryLocalizedDescription = v30->_galleryLocalizedDescription;
  v30->_galleryLocalizedDescription = (NSString *)v36;

  posterDescriptorLookupInfo = v30->_posterDescriptorLookupInfo;
  v30->_posterDescriptorLookupInfo = v23;
  v64 = v23;

  uint64_t v39 = [v70 copy];
  titleStyleConfiguration = v30->_titleStyleConfiguration;
  v30->_titleStyleConfiguration = (PRPosterTitleStyleConfiguration *)v39;

  uint64_t v41 = [v69 copy];
  focusConfiguration = v30->_focusConfiguration;
  v30->_focusConfiguration = (PRPosterFocusConfiguration *)v41;

  subtitleComplication = v30->_subtitleComplication;
  v30->_subtitleComplication = v25;
  v63 = v25;

  suggestedComplications = v30->_suggestedComplications;
  v30->_suggestedComplications = v26;
  v45 = v26;

  suggestedLandscapeComplications = v30->_suggestedLandscapeComplications;
  v30->_suggestedLandscapeComplications = v27;
  v47 = v27;

  complicationLayoutType = v30->_complicationLayoutType;
  v30->_complicationLayoutType = v28;
  v49 = v28;

  uint64_t v50 = [v68 copy];
  renderingConfiguration = v30->_renderingConfiguration;
  v30->_renderingConfiguration = (PRPosterRenderingConfiguration *)v50;

  homeScreenConfiguration = v30->_homeScreenConfiguration;
  v30->_homeScreenConfiguration = v29;
  v53 = v29;

  uint64_t v54 = [v67 copy];
  v55 = (void *)v54;
  if (v54) {
    v56 = (__CFString *)v54;
  }
  else {
    v56 = PBFPreviewTypeDefault;
  }
  objc_storeStrong((id *)&v30->_type, v56);

  galleryOptions = v30->_galleryOptions;
  v30->_galleryOptions = v66;

  *(int64x2_t *)&v30->_cachedGalleryPresentationStyle = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  return v30;
}

+ (id)testPosterPreviewWithLocalizedTitle:(id)a3 description:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_class();
  v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v8 UUIDString];
  v10 = +[PBFGenericPosterDescriptorLookupInfo nullPosterDescriptorLookupInfo];
  v11 = [v7 posterPreviewWithUniqueIdentifier:v9 displayNameLocalizationKey:0 galleryLocalizedTitle:v6 galleryLocalizedDescription:v5 posterDescriptorLookupInfo:v10 titleStyleConfiguration:0 focusConfiguration:0 subtitleComplication:0 suggestedComplications:0 suggestedLandscapeComplications:0 complicationLayoutType:PBFComplicationLayoutTypeEmpty renderingConfiguration:0 homeScreenConfiguration:0 previewType:PBFPreviewTypeDefault galleryOptions:0];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)objc_opt_class() posterPreviewWithUniqueIdentifier:self->_previewUniqueIdentifier displayNameLocalizationKey:self->_displayNameLocalizationKey galleryLocalizedTitle:self->_galleryLocalizedTitle galleryLocalizedDescription:self->_galleryLocalizedDescription posterDescriptorLookupInfo:self->_posterDescriptorLookupInfo titleStyleConfiguration:self->_titleStyleConfiguration focusConfiguration:self->_focusConfiguration subtitleComplication:self->_subtitleComplication suggestedComplications:self->_suggestedComplications suggestedLandscapeComplications:self->_suggestedLandscapeComplications complicationLayoutType:self->_complicationLayoutType renderingConfiguration:self->_renderingConfiguration homeScreenConfiguration:self->_homeScreenConfiguration previewType:self->_type galleryOptions:self->_galleryOptions];
  *((void *)result + 1) = self->_hash;
  return result;
}

- (unint64_t)hash
{
  uint64_t hash = self->_hash;
  if (!hash)
  {
    v4 = [MEMORY[0x1E4F4F758] builder];
    id v5 = (id)[v4 appendString:self->_previewUniqueIdentifier];
    id v6 = (id)[v4 appendString:self->_displayNameLocalizationKey];
    id v7 = (id)[v4 appendString:self->_galleryLocalizedTitle];
    id v8 = (id)[v4 appendString:self->_galleryLocalizedDescription];
    id v9 = (id)[v4 appendObject:self->_posterDescriptorLookupInfo];
    id v10 = (id)[v4 appendObject:self->_titleStyleConfiguration];
    id v11 = (id)[v4 appendObject:self->_subtitleComplication];
    id v12 = (id)[v4 appendObject:self->_focusConfiguration];
    id v13 = (id)[v4 appendObject:self->_suggestedComplications];
    id v14 = (id)[v4 appendObject:self->_suggestedLandscapeComplications];
    id v15 = (id)[v4 appendObject:self->_complicationLayoutType];
    id v16 = (id)[v4 appendObject:self->_renderingConfiguration];
    id v17 = (id)[v4 appendObject:self->_homeScreenConfiguration];
    uint64_t hash = [v4 hash];
    self->_uint64_t hash = hash;
  }
  return hash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PBFGenericPosterPreview *)a3;
  id v5 = v4;
  if (v4 == self
    || (uint64_t v6 = [(PBFGenericPosterPreview *)v4 hash], v6 == [(PBFGenericPosterPreview *)self hash]))
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects())
    {
      char v7 = BSEqualObjects();
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(PBFGenericPosterPreview *)self posterDescriptorLookupInfo];
  id v5 = [v4 posterDescriptorPath];
  id v6 = (id)[v3 appendObject:v5 withName:@"posterDescriptorPath"];

  char v7 = [v3 build];

  return (NSString *)v7;
}

- (unint64_t)presentationStyle
{
  v3 = [(PBFGenericPosterPreview *)self type];
  char v4 = [v3 isEqualToString:PBFPreviewTypeHero];

  if (v4) {
    return 1;
  }
  unint64_t result = self->_cachedGalleryPresentationStyle;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PBFGenericPosterPreview *)self _hydrateGalleryOptions];
    return self->_cachedGalleryPresentationStyle;
  }
  return result;
}

- (unint64_t)galleryDisplayStyle
{
  v3 = [(PBFGenericPosterPreview *)self type];
  char v4 = [v3 isEqualToString:PBFPreviewTypeHero];

  if (v4) {
    return 0;
  }
  if (self->_cachedGalleryPresentationStyle == 0x7FFFFFFFFFFFFFFFLL) {
    [(PBFGenericPosterPreview *)self _hydrateGalleryOptions];
  }
  return self->_cachedDisplayStyle;
}

- (void)_hydrateGalleryOptions
{
  v3 = [(PBFGenericPosterPreview *)self posterDescriptorLookupInfo];
  id v7 = [v3 posterDescriptorPath];

  char v4 = [MEMORY[0x1E4F926A8] modelObjectCacheForPath:v7];
  uint64_t v5 = [v4 galleryOptions];
  if (v5)
  {
    id v6 = (void *)v5;

LABEL_4:
    self->_cachedGalleryPresentationStyle = [v6 presentationStyle];
    self->_cachedDisplayStyle = [v6 displayStyle];

    goto LABEL_5;
  }
  id v6 = [MEMORY[0x1E4F926B0] loadPosterDescriptorGalleryOptionsForPath:v7 error:0];

  if (v6) {
    goto LABEL_4;
  }
  self->_cachedGalleryPresentationStyle = 0;
  self->_cachedDisplayStyle = 0;
LABEL_5:
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

- (void).cxx_destruct
{
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

@end