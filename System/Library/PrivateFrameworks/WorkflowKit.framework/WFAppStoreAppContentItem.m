@interface WFAppStoreAppContentItem
+ (BOOL)canLowercaseTypeDescription;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (BOOL)loadsListThumbnailAsynchronously;
@end

@implementation WFAppStoreAppContentItem

+ (BOOL)canLowercaseTypeDescription
{
  return 0;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d App Store apps");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"App Store apps", @"App Store apps");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"App Store app", @"App Store app");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F5AA90];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  id v3 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)stringConversionBehavior
{
  v2 = (void *)MEMORY[0x1E4F5A860];
  id v3 = WFLocalizedString(@"Name and Store URL");
  v4 = [v2 coercingToStringWithDescription:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v86[24] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F5A880];
  v85 = WFLocalizedContentPropertyNameMarker(@"Artist");
  v84 = [v2 block:&__block_literal_global_6300 name:v85 class:objc_opt_class()];
  v86[0] = v84;
  id v3 = (void *)MEMORY[0x1E4F5A880];
  v83 = WFLocalizedContentPropertyNameMarker(@"Price");
  v82 = [v3 keyPath:@"object.price" name:v83 class:objc_opt_class()];
  v86[1] = v82;
  v4 = (void *)MEMORY[0x1E4F5A880];
  v81 = WFLocalizedContentPropertyNameMarker(@"Currency Code");
  v80 = [v4 keyPath:@"object.currencyCode" name:v81 class:objc_opt_class()];
  v86[2] = v80;
  v5 = (void *)MEMORY[0x1E4F5A880];
  v79 = WFLocalizedContentPropertyNameMarker(@"Formatted Price");
  v78 = [v5 keyPath:@"object.formattedPrice" name:v79 class:objc_opt_class()];
  v86[3] = v78;
  v6 = (void *)MEMORY[0x1E4F5A880];
  v77 = WFLocalizedContentPropertyNameMarker(@"Release Date");
  v76 = [v6 keyPath:@"object.releaseDate" name:v77 class:objc_opt_class()];
  v86[4] = v76;
  v7 = (void *)MEMORY[0x1E4F5A880];
  v75 = WFLocalizedContentPropertyNameMarker(@"Category");
  v74 = [v7 keyPath:@"object.category" name:v75 class:objc_opt_class()];
  v86[5] = v74;
  v8 = (void *)MEMORY[0x1E4F5A880];
  v73 = WFLocalizedContentPropertyNameMarker(@"Description");
  v72 = [v8 keyPath:@"object.descriptionText" name:v73 class:objc_opt_class()];
  v86[6] = v72;
  v9 = (void *)MEMORY[0x1E4F5A880];
  v71 = WFLocalizedContentPropertyNameMarker(@"Rating");
  v70 = [v9 keyPath:@"object.averageRating" name:v71 class:objc_opt_class()];
  v86[7] = v70;
  v10 = (void *)MEMORY[0x1E4F5A880];
  v69 = WFLocalizedContentPropertyNameMarker(@"# of Ratings");
  v68 = [v10 keyPath:@"object.numberOfRatings" name:v69 class:objc_opt_class()];
  v86[8] = v68;
  v11 = (void *)MEMORY[0x1E4F5A880];
  v67 = WFLocalizedContentPropertyNameMarker(@"Rating (This Version)");
  v66 = [v11 keyPath:@"object.averageRatingLatestVersion" name:v67 class:objc_opt_class()];
  v86[9] = v66;
  v12 = (void *)MEMORY[0x1E4F5A880];
  v65 = WFLocalizedContentPropertyNameMarker(@"# of Ratings (This Version)");
  v64 = [v12 keyPath:@"object.numberOfRatingsLatestVersion" name:v65 class:objc_opt_class()];
  v86[10] = v64;
  v13 = (void *)MEMORY[0x1E4F5A880];
  v63 = WFLocalizedContentPropertyNameMarker(@"Version");
  v62 = [v13 keyPath:@"object.version" name:v63 class:objc_opt_class()];
  v86[11] = v62;
  v14 = (void *)MEMORY[0x1E4F5A880];
  v61 = WFLocalizedContentPropertyNameMarker(@"Last Updated");
  v60 = [v14 keyPath:@"object.lastUpdated" name:v61 class:objc_opt_class()];
  v86[12] = v60;
  v15 = (void *)MEMORY[0x1E4F5A880];
  v59 = WFLocalizedContentPropertyNameMarker(@"Release Notes");
  v58 = [v15 keyPath:@"object.releaseNotes" name:v59 class:objc_opt_class()];
  v86[13] = v58;
  v16 = (void *)MEMORY[0x1E4F5A880];
  v57 = WFLocalizedContentPropertyNameMarker(@"Content Rating");
  v56 = [v16 keyPath:@"object.contentRating" name:v57 class:objc_opt_class()];
  v86[14] = v56;
  v17 = (void *)MEMORY[0x1E4F5A880];
  v55 = WFLocalizedContentPropertyNameMarker(@"Minimum OS Version");
  v54 = [v17 keyPath:@"object.minimumOSVersion" name:v55 class:objc_opt_class()];
  v86[15] = v54;
  v18 = (void *)MEMORY[0x1E4F5A880];
  v52 = WFLocalizedContentPropertyNameMarker(@"Is Universal");
  v53 = [NSNumber numberWithBool:1];
  v51 = [v18 keyPath:@"object.isUniversal" name:v52 class:objc_opt_class()];
  v50 = WFLocalizedContentPropertyNameMarker(@"Is Not Universal");
  v49 = [v51 negativeName:v50];
  v86[16] = v49;
  v19 = (void *)MEMORY[0x1E4F5A880];
  v47 = WFLocalizedContentPropertyNameMarker(@"Supports Game Center");
  v48 = [NSNumber numberWithBool:1];
  v46 = [v19 keyPath:@"object.supportsGameCenter" name:v47 class:objc_opt_class()];
  v45 = WFLocalizedContentPropertyNameMarker(@"Does Not Support Game Center");
  v44 = [v46 negativeName:v45];
  v86[17] = v44;
  v20 = (void *)MEMORY[0x1E4F5A880];
  v43 = WFLocalizedContentPropertyNameMarker(@"Supported Devices");
  v42 = [v20 keyPath:@"object.supportedDevices" name:v43 class:objc_opt_class()];
  v41 = [v42 multipleValues:1];
  v86[18] = v41;
  v21 = (void *)MEMORY[0x1E4F5A880];
  v40 = WFLocalizedContentPropertyNameMarker(@"Supported Languages");
  v39 = [v21 keyPath:@"object.supportedLanguages" name:v40 class:objc_opt_class()];
  v38 = [v39 multipleValues:1];
  v86[19] = v38;
  v22 = (void *)MEMORY[0x1E4F5A880];
  v23 = WFLocalizedContentPropertyNameMarker(@"Screenshot URLs");
  v24 = [v22 keyPath:@"object.screenshotURLs" name:v23 class:objc_opt_class()];
  v25 = [v24 multipleValues:1];
  v86[20] = v25;
  v26 = (void *)MEMORY[0x1E4F5A880];
  v27 = WFLocalizedContentPropertyNameMarker(@"iPad Screenshot URLs");
  v28 = [v26 keyPath:@"object.iPadScreenshotURLs" name:v27 class:objc_opt_class()];
  v29 = [v28 multipleValues:1];
  v86[21] = v29;
  v30 = (void *)MEMORY[0x1E4F5A880];
  v31 = WFLocalizedContentPropertyNameMarker(@"Download Size");
  v32 = [v30 block:&__block_literal_global_303_6348 name:v31 class:objc_opt_class()];
  v86[22] = v32;
  v33 = (void *)MEMORY[0x1E4F5A880];
  v34 = WFLocalizedContentPropertyNameMarker(@"Bundle Identifier");
  v35 = [v33 keyPath:@"object.bundleIdentifier" name:v34 class:objc_opt_class()];
  v86[23] = v35;
  id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:24];

  return v37;
}

void __44__WFAppStoreAppContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v5 = a4;
  id v9 = [a2 object];
  id v6 = objc_alloc(MEMORY[0x1E4F5A908]);
  v7 = [v9 fileSize];
  v8 = objc_msgSend(v6, "initWithByteCount:", objc_msgSend(v7, "longLongValue"));
  v5[2](v5, v8);
}

void __44__WFAppStoreAppContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a2 softwareObject];
  v7 = objc_opt_new();
  v8 = [v6 artistID];
  v13[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__WFAppStoreAppContentItem_propertyBuilders__block_invoke_2;
  v11[3] = &unk_1E65586C8;
  id v12 = v5;
  id v10 = v5;
  [v7 lookupMediaWithIdentifiers:v9 countryCode:0 completion:v11];
}

void __44__WFAppStoreAppContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__WFAppStoreAppContentItem_getListThumbnail_forSize___block_invoke;
    v10[3] = &unk_1E6556870;
    id v11 = v7;
    -[WFiTunesObjectContentItem getArtworkForSize:completionHandler:](self, "getArtworkForSize:completionHandler:", v10, width, height);
  }
  return 1;
}

void __53__WFAppStoreAppContentItem_getListThumbnail_forSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__WFAppStoreAppContentItem_getListThumbnail_forSize___block_invoke_2;
  v6[3] = &unk_1E65572A0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __53__WFAppStoreAppContentItem_getListThumbnail_forSize___block_invoke_2(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FB4C40];
  v4[0] = &unk_1F2316620;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

- (BOOL)getListAltText:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(WFAppStoreAppContentItem *)self softwareObject];
    id v7 = [v6 formattedPrice];
    (*((void (**)(id, void *))a3 + 2))(v5, v7);
  }
  return 1;
}

- (BOOL)getListSubtitle:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(WFAppStoreAppContentItem *)self softwareObject];
    id v7 = [v6 artistName];
    (*((void (**)(id, void *))a3 + 2))(v5, v7);
  }
  return 1;
}

@end