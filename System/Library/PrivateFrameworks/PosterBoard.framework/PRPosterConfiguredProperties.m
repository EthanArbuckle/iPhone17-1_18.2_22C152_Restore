@interface PRPosterConfiguredProperties
@end

@implementation PRPosterConfiguredProperties

id __81__PRPosterConfiguredProperties_PBFAdditions__pbf_configuredPropertiesForPreview___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PRSWidgetIdentifierForPreviewAndComplicationLookupInfo(*(void **)(a1 + 32), v3);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = [v3 suggestedComplication];
    v7 = [v6 proactiveRepresentation];
    [v5 setObject:v7 forKey:v4];
  }
  v8 = objc_msgSend(MEMORY[0x1E4F923A8], "pbf_PRSWidgetFromComplicationLookupInfo:uniqueIdentifier:intent:", v3, v4, 0);

  return v8;
}

id __81__PRPosterConfiguredProperties_PBFAdditions__pbf_configuredPropertiesForPreview___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PRSWidgetIdentifierForPreviewAndComplicationLookupInfo(*(void **)(a1 + 32), v3);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = [v3 suggestedComplication];
    v7 = [v6 proactiveRepresentation];
    [v5 setObject:v7 forKey:v4];
  }
  v8 = objc_msgSend(MEMORY[0x1E4F923A8], "pbf_PRSWidgetFromComplicationLookupInfo:uniqueIdentifier:intent:", v3, v4, 0);

  return v8;
}

@end