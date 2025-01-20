@interface PRPosterConfiguredProperties(PBFAdditions)
+ (id)pbf_configuredPropertiesForPreview:()PBFAdditions;
@end

@implementation PRPosterConfiguredProperties(PBFAdditions)

+ (id)pbf_configuredPropertiesForPreview:()PBFAdditions
{
  id v3 = a3;
  v39 = [v3 titleStyleConfiguration];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5 = [v3 suggestedComplications];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __81__PRPosterConfiguredProperties_PBFAdditions__pbf_configuredPropertiesForPreview___block_invoke;
  v43[3] = &unk_1E6982AE0;
  id v6 = v3;
  id v44 = v6;
  id v7 = v4;
  id v45 = v7;
  uint64_t v8 = objc_msgSend(v5, "bs_mapNoNulls:", v43);

  v9 = [v6 suggestedLandscapeComplications];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __81__PRPosterConfiguredProperties_PBFAdditions__pbf_configuredPropertiesForPreview___block_invoke_2;
  v40[3] = &unk_1E6982AE0;
  id v10 = v6;
  id v41 = v10;
  id v11 = v7;
  id v42 = v11;
  uint64_t v12 = objc_msgSend(v9, "bs_mapNoNulls:", v40);

  v13 = [v10 subtitleComplication];
  v14 = PRSWidgetIdentifierForPreviewAndComplicationLookupInfo(v10, v13);

  if (v14)
  {
    v15 = [v10 subtitleComplication];
    v16 = [v15 suggestedComplication];
    v17 = [v16 proactiveRepresentation];
    [v11 setObject:v17 forKey:v14];
  }
  v18 = (void *)MEMORY[0x1E4F923A8];
  v19 = [v10 subtitleComplication];
  v38 = objc_msgSend(v18, "pbf_PRSWidgetFromComplicationLookupInfo:uniqueIdentifier:intent:", v19, v14, 0);

  v35 = (void *)[objc_alloc(MEMORY[0x1E4F92628]) initWithInlineComplication:v38 sidebarComplications:v12 complications:v8];
  v20 = [v10 homeScreenConfiguration];
  v21 = [v10 focusConfiguration];
  v22 = [v10 renderingConfiguration];
  id v23 = objc_alloc(MEMORY[0x1E4F926D8]);
  [v10 galleryOptions];
  v24 = v37 = (void *)v8;
  [v24 suggestedGalleryItem];
  id v25 = v11;
  v26 = v36 = v11;
  [MEMORY[0x1E4F1C9C8] date];
  v27 = v34 = (void *)v12;
  v28 = (void *)[v23 initWithSuggestedGalleryItem:v26 suggestedComplicationsByIdentifier:v25 lastModifiedDate:v27];

  id v29 = objc_alloc(MEMORY[0x1E4F92698]);
  v30 = [v10 displayNameLocalizationKey];
  v31 = (void *)[v29 initWithDisplayNameLocalizationKey:v30];

  v32 = (void *)[objc_alloc(MEMORY[0x1E4F92640]) initWithTitleStyleConfiguration:v39 focusConfiguration:v21 complicationLayout:v35 renderingConfiguration:v22 homeScreenConfiguration:v20 colorVariationsConfiguration:0 quickActionsConfiguration:0 suggestionMetadata:v28 otherMetadata:v31 userInfo:0];
  return v32;
}

@end