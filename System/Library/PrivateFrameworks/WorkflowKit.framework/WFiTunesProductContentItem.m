@interface WFiTunesProductContentItem
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (BOOL)loadsListThumbnailAsynchronously;
- (id)mediaTrackObject;
@end

@implementation WFiTunesProductContentItem

+ (id)outputTypes
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesProductContentItem;
  v2 = objc_msgSendSuper2(&v6, sel_outputTypes);
  v3 = [MEMORY[0x1E4F5A9A8] typeWithClassName:@"MPMediaItem" frameworkName:@"MediaPlayer" location:2];
  v4 = [v2 orderedSetByAddingObject:v3];

  return v4;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  v3 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)stringConversionBehavior
{
  v2 = (void *)MEMORY[0x1E4F5A860];
  v3 = WFLocalizedString(@"Name and Store URL");
  v4 = [v2 coercingToStringWithDescription:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v42[10] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F5A880];
  v41 = WFLocalizedContentPropertyNameMarker(@"Artist");
  v40 = [v2 block:&__block_literal_global_5400 name:v41 class:objc_opt_class()];
  v42[0] = v40;
  v3 = (void *)MEMORY[0x1E4F5A880];
  v39 = WFLocalizedContentPropertyNameMarker(@"Price");
  v38 = [v3 keyPath:@"object.price" name:v39 class:objc_opt_class()];
  v42[1] = v38;
  v4 = (void *)MEMORY[0x1E4F5A880];
  v37 = WFLocalizedContentPropertyNameMarker(@"Currency Code");
  v36 = [v4 keyPath:@"object.currencyCode" name:v37 class:objc_opt_class()];
  v42[2] = v36;
  v5 = (void *)MEMORY[0x1E4F5A880];
  v35 = WFLocalizedContentPropertyNameMarker(@"Formatted Price");
  v34 = [v5 keyPath:@"object.formattedPrice" name:v35 class:objc_opt_class()];
  v42[3] = v34;
  objc_super v6 = (void *)MEMORY[0x1E4F5A880];
  v33 = WFLocalizedContentPropertyNameMarker(@"Release Date");
  v32 = [v6 keyPath:@"object.releaseDate" name:v33 class:objc_opt_class()];
  v42[4] = v32;
  v7 = (void *)MEMORY[0x1E4F5A880];
  v31 = WFLocalizedContentPropertyNameMarker(@"Genre");
  v30 = [v7 keyPath:@"mediaTrackObject.genre" name:v31 class:objc_opt_class()];
  v42[5] = v30;
  v8 = (void *)MEMORY[0x1E4F5A880];
  v29 = WFLocalizedContentPropertyNameMarker(@"Duration");
  v28 = [v8 keyPath:@"mediaTrackObject.duration" name:v29 class:objc_opt_class()];
  v42[6] = v28;
  v9 = (void *)MEMORY[0x1E4F5A880];
  v26 = WFLocalizedContentPropertyNameMarker(@"Streamable");
  v27 = [NSNumber numberWithBool:1];
  v25 = [v9 keyPath:@"mediaTrackObject.streamable" name:v26 class:objc_opt_class()];
  v24 = WFLocalizedContentPropertyNameMarker(@"Is Streamable");
  v10 = [v25 displayName:v24];
  v11 = WFLocalizedContentPropertyNameMarker(@"Is Not Streamable");
  v12 = [v10 negativeName:v11];
  v42[7] = v12;
  v13 = (void *)MEMORY[0x1E4F5A880];
  v14 = WFLocalizedContentPropertyNameMarker(@"Is Explicit");
  v15 = [NSNumber numberWithBool:1];
  v16 = [v13 keyPath:@"mediaTrackObject.explicit" name:v14 class:objc_opt_class()];
  v17 = WFLocalizedContentPropertyNameMarker(@"Is Not Explicit");
  v18 = [v16 negativeName:v17];
  v42[8] = v18;
  v19 = (void *)MEMORY[0x1E4F5A880];
  v20 = WFLocalizedContentPropertyNameMarker(@"Description");
  v21 = [v19 keyPath:@"object.descriptionText" name:v20 class:objc_opt_class()];
  v42[9] = v21;
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:10];

  return v23;
}

void __46__WFiTunesProductContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = [a2 object];
  v7 = objc_opt_new();
  v8 = [v6 artistID];
  v13[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__WFiTunesProductContentItem_propertyBuilders__block_invoke_2;
  v11[3] = &unk_1E65586C8;
  id v12 = v5;
  id v10 = v5;
  [v7 lookupMediaWithIdentifiers:v9 countryCode:0 completion:v11];
}

void __46__WFiTunesProductContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2)
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
    v10[2] = __55__WFiTunesProductContentItem_getListThumbnail_forSize___block_invoke;
    v10[3] = &unk_1E6556870;
    id v11 = v7;
    -[WFiTunesObjectContentItem getArtworkForSize:completionHandler:](self, "getArtworkForSize:completionHandler:", v10, width, height);
  }
  return 1;
}

void __55__WFiTunesProductContentItem_getListThumbnail_forSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__WFiTunesProductContentItem_getListThumbnail_forSize___block_invoke_2;
  v6[3] = &unk_1E65572A0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __55__WFiTunesProductContentItem_getListThumbnail_forSize___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
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
    objc_super v6 = [(WFiTunesProductContentItem *)self storeObject];
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
    objc_super v6 = [(WFiTunesProductContentItem *)self storeObject];
    id v7 = [v6 artistName];
    (*((void (**)(id, void *))a3 + 2))(v5, v7);
  }
  return 1;
}

- (id)mediaTrackObject
{
  uint64_t v2 = [(WFiTunesObjectContentItem *)self object];
  id v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v2 = v3;
    }
    else {
      uint64_t v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

@end