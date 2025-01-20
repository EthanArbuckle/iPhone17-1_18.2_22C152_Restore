@interface SUItemDataSource
+ (id)sharedDataSource;
+ (void)setSharedDataSource:(id)a3;
- (id)_newDownloadForDocumentItem:(id)a3 storeOffer:(id)a4;
- (id)_newDownloadForPodcastEpisode:(id)a3 storeOffer:(id)a4;
- (id)_newDownloadMetadataForPodcastEpisode:(id)a3 storeOffer:(id)a4;
- (id)_newTonePurchaseWithPurchase:(id)a3;
- (id)_thumbnailImageForItem:(id)a3;
- (id)newDisplayItemValidationTestsForItem:(id)a3;
- (id)newExternalDownloadWithItem:(id)a3 storeOffer:(id)a4;
- (id)newItemWithItemDictionary:(id)a3;
- (id)newPurchaseWithItem:(id)a3 storeOffer:(id)a4;
- (id)typeStringForItemType:(int64_t)a3;
- (int64_t)estimatedDiskSpaceNeededForItem:(id)a3 storeOffer:(id)a4;
- (int64_t)itemTypeForItem:(id)a3;
- (int64_t)itemTypeForTypeString:(id)a3;
@end

@implementation SUItemDataSource

+ (void)setSharedDataSource:(id)a3
{
  _os_nospin_lock_lock();
  if ((id)__SharedInstance_3 != a3)
  {

    __SharedInstance_3 = (uint64_t)a3;
  }

  _os_nospin_lock_unlock();
}

+ (id)sharedDataSource
{
  _os_nospin_lock_lock();
  id v2 = (id)__SharedInstance_3;
  if (!__SharedInstance_3)
  {
    id v2 = objc_alloc_init((Class)objc_opt_class());
    __SharedInstance_3 = (uint64_t)v2;
  }
  id v3 = v2;
  _os_nospin_lock_unlock();
  return v3;
}

- (int64_t)estimatedDiskSpaceNeededForItem:(id)a3 storeOffer:(id)a4
{
  int64_t v5 = objc_msgSend((id)objc_msgSend(a4, "offerMedia"), "mediaFileSize");
  if ([a3 itemType] == 2000) {
    return (uint64_t)((double)v5 * 2.5);
  }
  else {
    return v5;
  }
}

- (int64_t)itemTypeForItem:(id)a3
{
  int64_t result = -[SUItemDataSource itemTypeForTypeString:](self, "itemTypeForTypeString:", [a3 itemTypeString]);
  if (!result)
  {
    uint64_t v6 = [a3 stringValueForProperty:@"type"];
    return [(SUItemDataSource *)self itemTypeForTypeString:v6];
  }
  return result;
}

- (int64_t)itemTypeForTypeString:(id)a3
{
  uint64_t v4 = 0;
  while (![*(__CFString **)((char *)&kItemTypes + v4) isEqualToString:a3])
  {
    v4 += 16;
    if (v4 == 496) {
      return 0;
    }
  }
  return *(int64_t *)((char *)&kItemTypes + v4 + 8);
}

- (id)newDisplayItemValidationTestsForItem:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", +[SUItemValidatorTest defaultTest](SUItemValidatorRatingTest, "defaultTest"), 0);
}

- (id)newExternalDownloadWithItem:(id)a3 storeOffer:(id)a4
{
  if ([a3 itemType] == 11
    || (v7 = (void *)[a3 itemMediaKind],
        [v7 isEqualToString:*MEMORY[0x263F7B958]]))
  {
    return [(SUItemDataSource *)self _newDownloadForDocumentItem:a3 storeOffer:a4];
  }
  else if ([a3 itemType] == 1007)
  {
    return [(SUItemDataSource *)self _newDownloadForPodcastEpisode:a3 storeOffer:a4];
  }
  else
  {
    return 0;
  }
}

- (id)newItemWithItemDictionary:(id)a3
{
  uint64_t v4 = [[SUItem alloc] initWithDictionary:a3];
  [(SUItem *)v4 setItemType:[(SUItemDataSource *)self itemTypeForItem:v4]];
  return v4;
}

- (id)newPurchaseWithItem:(id)a3 storeOffer:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "buyParameters"), "length"))
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263F7B1A8]), "initWithItemDictionary:", objc_msgSend(a3, "itemDictionary"));
    v8 = (void *)[objc_alloc(MEMORY[0x263F7B2D8]) initWithItem:v7 offer:a4];
    id v9 = [(SUItemDataSource *)self _thumbnailImageForItem:a3];
    if (v9)
    {
      v10 = v9;
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isPrerendered"));
      [v8 setValue:v11 forDownloadProperty:*MEMORY[0x263F7B5F8]];
      uint64_t v12 = objc_msgSend((id)objc_msgSend(v10, "URL"), "absoluteString");
      [v8 setValue:v12 forDownloadProperty:*MEMORY[0x263F7B730]];
    }

    uint64_t v13 = [a3 itemType];
    if (v8 && (v13 == 1011 || v13 == 1005))
    {
      id v14 = [(SUItemDataSource *)self _newTonePurchaseWithPurchase:v8];
      objc_msgSend(v14, "setAllowedToneStyles:", objc_msgSend(a4, "allowedToneStyles"));

      return v14;
    }
  }
  else
  {
    [a3 itemType];
    return 0;
  }
  return v8;
}

- (id)typeStringForItemType:(int64_t)a3
{
  uint64_t v3 = 0;
  while (*(__CFString **)((char *)&kItemTypes + v3 + 8) != (__CFString *)a3)
  {
    v3 += 16;
    if (v3 == 496) {
      return 0;
    }
  }
  return *(__CFString **)((char *)&kItemTypes + v3);
}

- (id)_newDownloadForDocumentItem:(id)a3 storeOffer:(id)a4
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a4, "offerMedia"), "URL");
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  id v8 = objc_alloc_init(MEMORY[0x263F7B168]);
  uint64_t v9 = [NSNumber numberWithBool:1];
  [v8 setValue:v9 forProperty:*MEMORY[0x263F7B668]];
  v10 = objc_msgSend(objc_alloc(MEMORY[0x263F7B1A8]), "initWithItemDictionary:", objc_msgSend(a3, "itemDictionary"));
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F7B190]) initWithItem:v10 offer:a4];
  [v11 setKind:*MEMORY[0x263F7B568]];
  [v8 setValuesWithStoreDownloadMetadata:v11];

  id v12 = objc_alloc(MEMORY[0x263F7B170]);
  uint64_t v13 = objc_msgSend(v12, "initWithURLRequest:", objc_msgSend(MEMORY[0x263EFC630], "requestWithURL:", v7));
  [v8 addAsset:v13 forType:*MEMORY[0x263F7B530]];

  return v8;
}

- (id)_newDownloadForPodcastEpisode:(id)a3 storeOffer:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "offerMedia"), "URL");
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  id v9 = objc_alloc_init(MEMORY[0x263F7B168]);
  uint64_t v10 = [NSNumber numberWithBool:1];
  [v9 setValue:v10 forProperty:*MEMORY[0x263F7B668]];
  id v11 = [(SUItemDataSource *)self _newDownloadMetadataForPodcastEpisode:a3 storeOffer:a4];
  [v9 setValuesWithStoreDownloadMetadata:v11];

  id v12 = objc_alloc(MEMORY[0x263F7B170]);
  uint64_t v13 = objc_msgSend(v12, "initWithURLRequest:", objc_msgSend(MEMORY[0x263EFC630], "requestWithURL:", v8));
  [v9 addAsset:v13 forType:*MEMORY[0x263F7B530]];

  id v14 = objc_msgSend((id)objc_msgSend(a3, "itemImageCollection"), "bestImageForSize:", 600.0, 600.0);
  if (v14
    || (id v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "containerItem"), "itemImageCollection"), "bestImageForSize:", 600.0, 600.0)) != 0)
  {
    id v15 = objc_alloc(MEMORY[0x263F7B170]);
    v16 = objc_msgSend(v15, "initWithURLRequest:", objc_msgSend(MEMORY[0x263EFC630], "requestWithURL:", objc_msgSend(v14, "URL")));
    [v9 addAsset:v16 forType:*MEMORY[0x263F7B528]];
  }
  uint64_t v17 = [a3 stringValueForProperty:@"podcast-feed-url"];
  if (v17
    || (uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "containerItem"), "stringValueForProperty:", @"podcast-feed-url")) != 0)
  {
    id v18 = objc_alloc(MEMORY[0x263F7B170]);
    v19 = objc_msgSend(v18, "initWithURLRequest:", objc_msgSend(MEMORY[0x263EFC630], "requestWithURL:", objc_msgSend(NSURL, "URLWithString:", v17)));
    [v9 addAsset:v19 forType:*MEMORY[0x263F7B538]];
  }
  return v9;
}

- (id)_newDownloadMetadataForPodcastEpisode:(id)a3 storeOffer:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "itemDictionary"), "mutableCopy");
  uint64_t v8 = [v7 objectForKey:@"url"];
  if (v8)
  {
    id v9 = objc_msgSend((id)objc_msgSend(NSURL, "URLWithString:", v8), "sanitizedURL");
    if (v9) {
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(v9, "absoluteString"), @"url");
    }
  }
  if (![v7 objectForKey:@"podcast-feed-url"])
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "containerItem"), "stringValueForProperty:", @"podcast-feed-url");
    if (v10) {
      [v7 setObject:v10 forKey:@"podcast-feed-url"];
    }
  }
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a4, "offerMedia"), "fullDurationInMilliseconds");
  if ((v11 & 0x8000000000000000) == 0) {
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", v11), @"duration");
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x263F7B190]) initWithDictionary:v7];
  objc_msgSend(v12, "setItemIdentifier:", objc_msgSend(a3, "itemIdentifier"));
  objc_msgSend(v12, "setSubtitle:", objc_msgSend(a3, "artistName"));
  objc_msgSend(v12, "setThumbnailImageURL:", objc_msgSend(-[SUItemDataSource _thumbnailImageForItem:](self, "_thumbnailImageForItem:", a3), "URL"));
  objc_msgSend(v12, "setTitle:", objc_msgSend(a3, "unmodifiedTitle"));
  uint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "playableMedia"), "mediaKind");
  int v14 = [v13 isEqualToString:*MEMORY[0x263F7B968]];
  id v15 = (void *)MEMORY[0x263F7B598];
  if (!v14) {
    id v15 = (void *)MEMORY[0x263F7B578];
  }
  [v12 setKind:*v15];

  return v12;
}

- (id)_newTonePurchaseWithPurchase:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F7B348]);
  objc_msgSend(v4, "setAccountIdentifier:", objc_msgSend(a3, "accountIdentifier"));
  objc_msgSend(v4, "setBuyParameters:", objc_msgSend(a3, "buyParameters"));
  objc_msgSend(v4, "setDownloadProperties:", objc_msgSend(a3, "downloadProperties"));
  return v4;
}

- (id)_thumbnailImageForItem:(id)a3
{
  id v4 = (void *)[a3 itemImageCollection];
  int64_t v5 = objc_msgSend((id)objc_msgSend(a3, "containerItem"), "itemImageCollection");
  if ([a3 itemType] == 2000)
  {
    uint64_t v6 = (void *)[a3 softwareType];
    if ([v6 isEqualToString:*MEMORY[0x263F7B740]]) {
      uint64_t v7 = (void *)[v4 imagesForKind:*MEMORY[0x263F7B890]];
    }
    else {
      uint64_t v7 = 0;
    }
    if (![v7 count]) {
      uint64_t v7 = (void *)[v4 imagesForKind:*MEMORY[0x263F7B858]];
    }
    if ([v7 count])
    {
      return (id)[v7 objectAtIndex:0];
    }
    double v11 = 57.0;
    id v12 = v4;
    double v13 = 57.0;
  }
  else
  {
    id result = (id)objc_msgSend(v4, "bestImageForSize:", 88.0, 88.0);
    if (result) {
      return result;
    }
    id result = (id)objc_msgSend(v5, "bestImageForSize:", 88.0, 88.0);
    if (result) {
      return result;
    }
    double v9 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
    id result = (id)objc_msgSend(v4, "bestImageForSize:", *MEMORY[0x263F001B0], v10);
    if (result) {
      return result;
    }
    id v12 = v5;
    double v11 = v9;
    double v13 = v10;
  }

  return (id)objc_msgSend(v12, "bestImageForSize:", v11, v13);
}

@end