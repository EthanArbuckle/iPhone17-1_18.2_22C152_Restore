@interface WFWorkflowReference(CSSearchableItem)
- (id)searchableItemRepresentationWithIconDrawerContext:()CSSearchableItem;
- (uint64_t)spotlightHash;
@end

@implementation WFWorkflowReference(CSSearchableItem)

- (id)searchableItemRepresentationWithIconDrawerContext:()CSSearchableItem
{
  v4 = (objc_class *)MEMORY[0x1E4F23840];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [v6 attributeSet];
  v8 = [a1 name];
  [v7 setDisplayName:v8];

  [v7 setContentDescription:&stru_1F225E938];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F30678]) initWithWorkflowReference:a1 includeIcon:1 iconDrawerContext:v5];

  [v9 configureAttributeSet:v7 includingData:0];
  [v7 setContentDescription:0];
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  [v7 setUserOwned:MEMORY[0x1E4F1CC38]];
  [v7 setUserCurated:v10];
  [v7 setUserCreated:v10];
  v11 = [a1 identifier];
  [v7 setUniqueIdentifier:v11];

  [v7 setDomainIdentifier:*MEMORY[0x1E4FB4C00]];
  v12 = [a1 creationDate];
  [v7 setContentCreationDate:v12];

  v13 = [a1 modificationDate];
  [v7 setContentModificationDate:v13];

  v14 = [a1 lastRunDate];
  [v7 setLastUsedDate:v14];

  v15 = [a1 runEventsCount];
  [v7 setPlayCount:v15];

  v16 = [a1 associatedAppBundleIdentifier];
  if (v16) {
    objc_msgSend(v7, "wf_associateWithBundleIdentifier:", v16);
  }
  v17 = [a1 icon];
  [v17 glyphCharacter];

  v18 = WFSystemImageNameForGlyphCharacter();
  if (v18)
  {
    v19 = WFSpotlightResultRunnableAccessorySystemImageNameKey();
    [v7 setValue:v18 forCustomKey:v19];
  }
  id v20 = objc_alloc(MEMORY[0x1E4FB4A48]);
  v21 = [a1 identifier];
  v22 = [a1 name];
  uint64_t v23 = [a1 color];
  uint64_t v24 = [a1 glyphCharacter];
  v25 = [a1 associatedAppBundleIdentifier];
  v26 = (void *)[v20 initWithIdentifier:v21 name:v22 color:v23 glyphCharacter:v24 associatedAppBundleIdentifier:v25];

  [v7 setWorkflowReferenceForDisplayRepresentation:v26];
  [v7 associateWithAppEntityForDescriptor:v26];

  return v6;
}

- (uint64_t)spotlightHash
{
  v2 = objc_opt_new();
  v3 = [a1 name];
  id v4 = (id)[v2 combineContentsOfPropertyListObject:v3];

  id v5 = [a1 subtitle];

  if (v5)
  {
    id v6 = [a1 subtitle];
    id v7 = (id)[v2 combineContentsOfPropertyListObject:v6];
  }
  v8 = [a1 icon];
  id v9 = (id)objc_msgSend(v2, "combineInteger:", objc_msgSend(v8, "glyphCharacter"));

  uint64_t v10 = [a1 icon];
  id v11 = (id)objc_msgSend(v2, "combineInteger:", objc_msgSend(v10, "backgroundColorValue"));

  id v12 = (id)[v2 combineInteger:4];
  v13 = [a1 creationDate];
  id v14 = (id)[v2 combineContentsOfPropertyListObject:v13];

  v15 = [a1 modificationDate];
  id v16 = (id)[v2 combineContentsOfPropertyListObject:v15];

  v17 = [a1 lastRunDate];
  if (v17) {
    id v18 = (id)[v2 combineContentsOfPropertyListObject:v17];
  }
  uint64_t v19 = [v2 finalize];

  return v19;
}

@end