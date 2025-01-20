@interface SUItem
- (BOOL)BOOLValueForProperty:(id)a3;
- (BOOL)isDisplayable:(id *)a3;
- (BOOL)isDownloadable;
- (BOOL)isGameCenterEnabled;
- (BOOL)isInstalled;
- (NSArray)itemLinks;
- (NSArray)storeOffers;
- (NSArray)versionOrdering;
- (NSDate)releaseDate;
- (NSDictionary)itemDictionary;
- (NSNumber)versionIdentifier;
- (NSString)artistName;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)collectionName;
- (NSString)containerName;
- (NSString)copyrightString;
- (NSString)disclaimerString;
- (NSString)genreName;
- (NSString)humanReadableDescription;
- (NSString)itemMediaKind;
- (NSString)itemTypeString;
- (NSString)secondaryTitle;
- (NSString)softwareType;
- (NSString)tellAFriendBody;
- (NSString)tellAFriendBodyMIMEType;
- (NSString)tellAFriendSubject;
- (NSString)title;
- (NSString)tweetInitialText;
- (NSString)unmodifiedTitle;
- (NSURL)tellAFriendBodyURL;
- (NSURL)tweetURL;
- (SSItemImageCollection)itemImageCollection;
- (SSItemOffer)defaultStoreOffer;
- (SUItem)containerItem;
- (SUItem)initWithDictionary:(id)a3;
- (SUItemContentRating)contentRating;
- (SUItemLink)externalArtistPageLink;
- (SUItemReviewStatistics)reviewStatistics;
- (id)_newItemLinkWithType:(int64_t)a3 URLKey:(id)a4 titleKey:(id)a5;
- (id)_newItemLinkWithType:(int64_t)a3 dictionary:(id)a4;
- (id)_newPrimaryItemLink;
- (id)_squishImageForSquishDictionary:(id)a3;
- (id)_valueForFirstAvailableKey:(id)a3;
- (id)copyReleaseDateStringWithStyle:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateValueForProperty:(id)a3;
- (id)firstItemLinkForType:(int64_t)a3;
- (id)itemLinksForType:(int64_t)a3;
- (id)relatedItemsForRelationType:(id)a3;
- (id)storeOfferForIdentifier:(id)a3;
- (id)stringValueForProperty:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)_linkTargetForTargetString:(id)a3 typeString:(id)a4;
- (int64_t)_linkTypeForString:(id)a3;
- (int64_t)integerValueForProperty:(id)a3;
- (int64_t)itemDisplayType;
- (int64_t)itemType;
- (int64_t)representedItemCount;
- (unint64_t)itemIdentifier;
- (void)_reloadDefaultStoreOffer;
- (void)_reloadImagesAndLinksFromSquishes:(id)a3;
- (void)_reloadItemImages;
- (void)_reloadItemLinks;
- (void)_reloadProperties;
- (void)_reloadStoreOffers;
- (void)dealloc;
- (void)setArtistName:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCollectionName:(id)a3;
- (void)setContainerItem:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setContentRating:(id)a3;
- (void)setCopyrightString:(id)a3;
- (void)setDisclaimerString:(id)a3;
- (void)setGameCenterEnabled:(BOOL)a3;
- (void)setGenreName:(id)a3;
- (void)setHumanReadableDescription:(id)a3;
- (void)setItemDisplayType:(int64_t)a3;
- (void)setItemIdentifier:(unint64_t)a3;
- (void)setItemImageCollection:(id)a3;
- (void)setItemLinks:(id)a3;
- (void)setItemMediaKind:(id)a3;
- (void)setItemType:(int64_t)a3;
- (void)setReleaseDate:(id)a3;
- (void)setRepresentedItemCount:(int64_t)a3;
- (void)setReviewStatistics:(id)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setSoftwareType:(id)a3;
- (void)setStoreOffers:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUnmodifiedTitle:(id)a3;
- (void)setVersionIdentifier:(id)a3;
- (void)setVersionOrdering:(id)a3;
@end

@implementation SUItem

- (SUItem)initWithDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUItem;
  v4 = [(SUItem *)&v7 init];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F7B2D0]) initWithDictionary:a3];
    v4->_dictionary = (NSDictionary *)objc_msgSend((id)objc_msgSend(v5, "dictionaryByEvaluatingConditions"), "copy");
    v4->_isInstalled = -1;

    [(SUItem *)v4 _reloadProperties];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUItem;
  [(SUItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  *(void *)(v5 + 8) = [(NSString *)self->_artistName copyWithZone:a3];
  *(void *)(v5 + 16) = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  *(void *)(v5 + 24) = [(NSString *)self->_bundleVersion copyWithZone:a3];
  *(void *)(v5 + 32) = [(NSString *)self->_collectionName copyWithZone:a3];
  *(void *)(v5 + 40) = self->_containerItem;
  *(void *)(v5 + 48) = [(NSString *)self->_containerName copyWithZone:a3];
  *(void *)(v5 + 56) = [(SUItemContentRating *)self->_contentRating copyWithZone:a3];
  *(void *)(v5 + 64) = [(NSString *)self->_copyrightString copyWithZone:a3];
  *(void *)(v5 + 72) = [(SSItemOffer *)self->_defaultStoreOffer copyWithZone:a3];
  *(void *)(v5 + 80) = [(NSDictionary *)self->_dictionary copyWithZone:a3];
  *(void *)(v5 + 88) = [(NSString *)self->_disclaimerString copyWithZone:a3];
  *(unsigned char *)(v5 + 96) = self->_gameCenterEnabled;
  *(void *)(v5 + 104) = [(NSString *)self->_genreName copyWithZone:a3];
  *(void *)(v5 + 112) = [(NSString *)self->_humanReadableDescription copyWithZone:a3];
  *(unsigned char *)(v5 + 120) = self->_isInstalled;
  *(_OWORD *)(v5 + 128) = *(_OWORD *)&self->_itemDisplayType;
  *(void *)(v5 + 144) = [(SSItemImageCollection *)self->_itemImageCollection copyWithZone:a3];
  *(void *)(v5 + 152) = [(NSArray *)self->_itemLinks copyWithZone:a3];
  *(void *)(v5 + 160) = [(NSString *)self->_itemMediaKind copyWithZone:a3];
  *(void *)(v5 + 168) = self->_itemType;
  *(void *)(v5 + 176) = self->_releaseDate;
  *(void *)(v5 + 184) = [(NSString *)self->_releaseDateString copyWithZone:a3];
  *(void *)(v5 + 192) = self->_representedItemCount;
  *(void *)(v5 + 200) = [(SUItemReviewStatistics *)self->_reviewStatistics copyWithZone:a3];
  *(void *)(v5 + 208) = [(NSString *)self->_secondaryTitle copyWithZone:a3];
  *(void *)(v5 + 216) = [(NSString *)self->_softwareType copyWithZone:a3];
  *(void *)(v5 + 224) = [(NSArray *)self->_storeOffers copyWithZone:a3];
  *(void *)(v5 + 232) = [(NSDictionary *)self->_tellAFriendDictionary copyWithZone:a3];
  *(void *)(v5 + 240) = [(NSString *)self->_title copyWithZone:a3];
  *(void *)(v5 + 248) = [(NSDictionary *)self->_tweetDictionary copyWithZone:a3];
  *(void *)(v5 + 256) = [(NSString *)self->_unmodifiedTitle copyWithZone:a3];
  *(void *)(v5 + 264) = [(NSNumber *)self->_versionIdentifier copyWithZone:a3];
  *(void *)(v5 + 272) = [(NSArray *)self->_versionOrdering copyWithZone:a3];
  return (id)v5;
}

- (BOOL)BOOLValueForProperty:(id)a3
{
  id v3 = [(NSDictionary *)self->_dictionary objectForKey:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v3 BOOLValue];
}

- (id)copyReleaseDateStringWithStyle:(int64_t)a3
{
  id result = [(SUItem *)self stringValueForProperty:@"release-date-string"];
  if (!result)
  {
    v6 = [(SUItem *)self releaseDate];
    return SUCopyDateStringForDate((const __CFDate *)v6, (CFDateFormatterStyle)a3);
  }
  return result;
}

- (id)dateValueForProperty:(id)a3
{
  id v3 = [(NSDictionary *)self->_dictionary objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    return v4;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = objc_alloc_init(MEMORY[0x263F08790]);
      [v6 setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
      objc_super v7 = (void *)[v6 dateFromString:v3];

      return v7;
    }
    else
    {
      return 0;
    }
  }
}

- (SUItemLink)externalArtistPageLink
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [(SUItem *)self itemLinksForType:2];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v10;
LABEL_3:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v10 != v5) {
      objc_enumerationMutation(v2);
    }
    objc_super v7 = *(SUItemLink **)(*((void *)&v9 + 1) + 8 * v6);
    if ([(SUItemLink *)v7 linkTarget] == 1) {
      return v7;
    }
    if (v4 == ++v6)
    {
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)firstItemLinkForType:(int64_t)a3
{
  id v3 = [(SUItem *)self itemLinksForType:a3];
  id result = (id)[v3 count];
  if (result)
  {
    return (id)[v3 objectAtIndex:0];
  }
  return result;
}

- (int64_t)integerValueForProperty:(id)a3
{
  id v3 = [(NSDictionary *)self->_dictionary objectForKey:a3];
  if (objc_opt_respondsToSelector()) {
    return (int)[v3 intValue];
  }
  else {
    return 0;
  }
}

- (BOOL)isDisplayable:(id *)a3
{
  long long v10 = 0;
  uint64_t v5 = objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "newDisplayItemValidationTestsForItem:", self);
  if ([v5 count])
  {
    uint64_t v6 = objc_alloc_init(SUItemValidator);
    [(SUItemValidator *)v6 addItemValidationTests:v5];
    objc_super v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", self, 0);
    char v8 = [(SUItemValidator *)v6 validateItems:v7 error:&v10];
  }
  else
  {
    char v8 = 1;
  }

  if (a3) {
    *a3 = v10;
  }
  return v8;
}

- (BOOL)isDownloadable
{
  if ([MEMORY[0x263F1C408] isRunningInStoreDemoMode]) {
    return 0;
  }
  contentRating = self->_contentRating;
  if (contentRating)
  {
    if ([(SUItemContentRating *)contentRating isRestricted]) {
      return 0;
    }
  }
  id v5 = +[SUItemDataSource sharedDataSource];
  uint64_t v6 = objc_msgSend(v5, "newPurchaseWithItem:storeOffer:", self, -[SUItem defaultStoreOffer](self, "defaultStoreOffer"));
  uint64_t v7 = objc_msgSend(v5, "newExternalDownloadWithItem:storeOffer:", self, -[SUItem defaultStoreOffer](self, "defaultStoreOffer"));
  BOOL v4 = (v6 | v7) != 0;

  return v4;
}

- (BOOL)isInstalled
{
  int isInstalled = self->_isInstalled;
  if (isInstalled == 255)
  {
    if ([(SUItem *)self itemType] == 2000
      && (BOOL v4 = [(SUItem *)self bundleIdentifier], [(NSString *)v4 length])
      && (uint64_t v5 = [MEMORY[0x263F89518] applicationForBundleIdentifier:v4]) != 0)
    {
      uint64_t v6 = (void *)v5;
      if (![(SUItem *)self versionOrdering]) {
        [v6 versionOrdering];
      }
      [v6 versionIdentifier];
      [(SUItem *)self versionIdentifier];
      int isInstalled = ISCompareSoftwareVersions() != -1;
    }
    else
    {
      int isInstalled = 0;
    }
    self->_int isInstalled = isInstalled;
  }
  return isInstalled != 0;
}

- (id)itemLinksForType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  itemLinks = self->_itemLinks;
  uint64_t v7 = [(NSArray *)itemLinks countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(itemLinks);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 linkType] == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)itemLinks countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (NSString)itemMediaKind
{
  itemMediaKind = self->_itemMediaKind;
  if (itemMediaKind)
  {
    id v3 = itemMediaKind;
    return v3;
  }
  else
  {
    uint64_t v6 = [(SUItem *)self defaultStoreOffer];
    [(SUItem *)self itemTypeString];
    [(SSItemOffer *)v6 offerIdentifier];
    uint64_t v7 = (void *)SSItemMediaKindForItemKind();
    uint64_t v8 = (NSString *)*MEMORY[0x263F7B960];
    if ([v7 isEqualToString:*MEMORY[0x263F7B960]]) {
      uint64_t v7 = objc_msgSend((id)-[SSItemOffer offerMedia](v6, "offerMedia"), "mediaKind");
    }
    if (v7) {
      return (NSString *)v7;
    }
    else {
      return v8;
    }
  }
}

- (id)relatedItemsForRelationType:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = [(NSDictionary *)self->_dictionary objectForKey:@"related-items"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = (void *)[v4 objectForKey:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v6 = +[SUItemDataSource sharedDataSource];
  uint64_t v7 = (void *)[MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v6 newItemWithItemDictionary:v12];
          if (v13)
          {
            long long v14 = (void *)v13;
            [v7 addObject:v13];
          }
        }
      }
      uint64_t v9 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  return v7;
}

- (void)setStoreOffers:(id)a3
{
  storeOffers = self->_storeOffers;
  if (storeOffers != a3)
  {

    self->_storeOffers = (NSArray *)[a3 copy];
    [(SUItem *)self _reloadDefaultStoreOffer];
  }
}

- (id)storeOfferForIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  storeOffers = self->_storeOffers;
  id result = (id)[(NSArray *)storeOffers countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(storeOffers);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_msgSend((id)objc_msgSend(v9, "offerIdentifier"), "isEqualToString:", a3)) {
          return v9;
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = (id)[(NSArray *)storeOffers countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)stringValueForProperty:(id)a3
{
  id v3 = [(NSDictionary *)self->_dictionary objectForKey:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)tellAFriendBody
{
  id v2 = [(NSDictionary *)self->_tellAFriendDictionary objectForKey:@"body"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;

  return (NSString *)v3;
}

- (NSString)tellAFriendBodyMIMEType
{
  id v2 = [(NSDictionary *)self->_tellAFriendDictionary objectForKey:@"body-mime-type"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;

  return (NSString *)v3;
}

- (NSURL)tellAFriendBodyURL
{
  id v2 = [(NSDictionary *)self->_tellAFriendDictionary objectForKey:@"body-url"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = NSURL;

  return (NSURL *)[v3 URLWithString:v2];
}

- (NSString)tellAFriendSubject
{
  id v2 = [(NSDictionary *)self->_tellAFriendDictionary objectForKey:@"subject"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;

  return (NSString *)v3;
}

- (NSString)tweetInitialText
{
  id v2 = [(NSDictionary *)self->_tweetDictionary objectForKey:@"text"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;

  return (NSString *)v3;
}

- (NSURL)tweetURL
{
  id v2 = [(NSDictionary *)self->_tweetDictionary objectForKey:@"url"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = NSURL;

  return (NSURL *)[v3 URLWithString:v2];
}

- (NSString)unmodifiedTitle
{
  unmodifiedTitle = self->_unmodifiedTitle;
  if (unmodifiedTitle)
  {
    id v3 = unmodifiedTitle;
    return v3;
  }
  else
  {
    return [(SUItem *)self title];
  }
}

- (id)valueForProperty:(id)a3
{
  id v3 = [(NSDictionary *)self->_dictionary objectForKey:a3];

  return v3;
}

- (NSString)itemTypeString
{
  id v3 = [(SUItem *)self _valueForFirstAvailableKey:@"type", 0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = 0;
  if (isKindOfClass)
  {
    int v6 = [v3 isEqualToString:*MEMORY[0x263F7B8C8]];
    uint64_t v5 = v3;
    if (v6)
    {
      id v7 = [(SUItem *)self _valueForFirstAvailableKey:@"link-type", 0];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v5 = v7;
      }
      else {
        uint64_t v5 = v3;
      }
    }
  }
  id v8 = v5;

  return (NSString *)v8;
}

- (int64_t)_linkTargetForTargetString:(id)a3 typeString:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = 0;
    char v7 = 1;
    while (1)
    {
      char v8 = v7;
      if ([(__CFString *)*(&kLinkTargets + 2 * v6) isEqualToString:a3]) {
        return (int64_t)*(&kLinkTargets + 2 * v6 + 1);
      }
      char v7 = 0;
      uint64_t v6 = 1;
      if ((v8 & 1) == 0) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return [a4 isEqualToString:@"safari"];
    }
    else {
      return 0;
    }
  }
}

- (int64_t)_linkTypeForString:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([a3 hasPrefix:@"account"]) {
    return 1;
  }
  uint64_t v5 = 0;
  while (![*(__CFString **)((char *)&kLinkTypes + v5) isEqualToString:a3])
  {
    v5 += 16;
    if (v5 == 48) {
      return 0;
    }
  }
  return *(int64_t *)((char *)&kLinkTypes + v5 + 8);
}

- (id)_newItemLinkWithType:(int64_t)a3 dictionary:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v7 = [a4 objectForKey:@"url"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v8 = [objc_alloc(NSURL) initWithString:v7];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = (void *)v8;
  long long v10 = objc_alloc_init(SUItemLink);
  -[SUItemLink setLinkTarget:](v10, "setLinkTarget:", -[SUItem _linkTargetForTargetString:typeString:](self, "_linkTargetForTargetString:typeString:", 0, [a4 objectForKey:@"url-page-type"]));
  [(SUItemLink *)v10 setLinkType:a3];
  [(SUItemLink *)v10 setURL:v9];
  uint64_t v11 = [a4 objectForKey:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUItemLink *)v10 setTitle:v11];
  }

  return v10;
}

- (id)_newItemLinkWithType:(int64_t)a3 URLKey:(id)a4 titleKey:(id)a5
{
  id v8 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", a4, 0);
  objc_opt_class();
  uint64_t v9 = 0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [objc_alloc(NSURL) initWithString:v8];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v9 = objc_alloc_init(SUItemLink);
      [(SUItemLink *)v9 setLinkType:a3];
      [(SUItemLink *)v9 setURL:v11];
      id v12 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", a5, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SUItemLink *)v9 setTitle:v12];
      }
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (id)_newPrimaryItemLink
{
  id v3 = [(SUItem *)self _valueForFirstAvailableKey:@"url", 0];
  objc_opt_class();
  id v4 = 0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [objc_alloc(NSURL) initWithString:v3];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      id v7 = [(SUItem *)self _valueForFirstAvailableKey:@"url-target", 0];
      id v8 = [(SUItem *)self _valueForFirstAvailableKey:@"url-page-type", 0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v9 = [(SUItem *)self _valueForFirstAvailableKey:@"page-type", 0];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v8 = (id)[v9 objectForKey:@"template-name"];
        }
      }
      id v4 = objc_alloc_init(SUItemLink);
      [(SUItemLink *)v4 setLinkTarget:[(SUItem *)self _linkTargetForTargetString:v7 typeString:v8]];
      [(SUItemLink *)v4 setLinkType:[(SUItem *)self _linkTypeForString:v8]];
      [(SUItemLink *)v4 setURL:v6];
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (void)_reloadDefaultStoreOffer
{
  if ([(NSArray *)self->_storeOffers count])
  {
    uint64_t v3 = 0;
    while (1)
    {
      id v4 = [(SUItem *)self storeOfferForIdentifier:_reloadDefaultStoreOffer_sOfferNames[v3]];
      if (v4) {
        break;
      }
      if (++v3 == 6)
      {
        id v4 = [(NSArray *)self->_storeOffers objectAtIndex:0];
        break;
      }
    }
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }

  self->_defaultStoreOffer = (SSItemOffer *)v5;
}

- (void)_reloadImagesAndLinksFromSquishes:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    id v8 = @"url";
    unint64_t v9 = 0x263EFF000uLL;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v26 = [(SUItem *)self _squishImageForSquishDictionary:v11];
          uint64_t v12 = [v11 objectForKey:v8];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = v6;
            uint64_t v14 = v7;
            unint64_t v15 = v9;
            id v16 = a3;
            long long v17 = v8;
            uint64_t v18 = [v11 objectForKey:@"url-page-type"];
            long long v19 = objc_alloc_init(SUItemLink);
            [(SUItemLink *)v19 setLinkTarget:[(SUItem *)self _linkTargetForTargetString:0 typeString:v18]];
            uint64_t v20 = v18;
            id v8 = v17;
            a3 = v16;
            unint64_t v9 = v15;
            uint64_t v7 = v14;
            uint64_t v6 = v13;
            [(SUItemLink *)v19 setLinkType:[(SUItem *)self _linkTypeForString:v20]];
            -[SUItemLink setURL:](v19, "setURL:", [NSURL URLWithString:v12]);
          }
          else
          {
            long long v19 = 0;
          }
          if ([v26 URL] && -[SUItemLink URL](v19, "URL"))
          {
            [v25 addObject:v26];
            [v24 addObject:v19];
          }
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F7B1C0]) initWithItemImages:v25];
  if ([v25 count]) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  [(SUItem *)self setItemImageCollection:v22];
  if ([v24 count]) {
    id v23 = v24;
  }
  else {
    id v23 = 0;
  }
  [(SUItem *)self setItemLinks:v23];
}

- (void)_reloadItemImages
{
  id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F7B1C0]), "initWithImageCollection:", -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", @"artwork-urls", 0));
  if (objc_msgSend((id)objc_msgSend(v4, "itemImages"), "count")) {
    id v3 = v4;
  }
  else {
    id v3 = 0;
  }
  [(SUItem *)self setItemImageCollection:v3];
}

- (void)_reloadItemLinks
{
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = [(SUItem *)self _newPrimaryItemLink];
  if (v3)
  {
    id v4 = v3;
    [v22 addObject:v3];
  }
  id v5 = [(SUItem *)self _newItemLinkWithType:2, [(SUItem *)self _valueForFirstAvailableKey:@"company", 0] dictionary];
  if (v5)
  {
    uint64_t v6 = v5;
    [v5 setLinkTarget:1];
    [v22 addObject:v6];
  }
  id v7 = [(SUItem *)self _newItemLinkWithType:3 URLKey:@"submit-user-review-url" titleKey:@"submit-user-review-title"];
  if (v7)
  {
    id v8 = v7;
    [v22 addObject:v7];
  }
  id v9 = [(SUItem *)self _newItemLinkWithType:4 URLKey:@"deletion-url" titleKey:@"deletion-action-name"];
  if (v9)
  {
    uint64_t v10 = v9;
    [v22 addObject:v9];
  }
  id v11 = [(SUItem *)self _newItemLinkWithType:5, [(SUItem *)self _valueForFirstAvailableKey:@"gifting-button", 0] dictionary];
  if (v11)
  {
    uint64_t v12 = v11;
    [v22 addObject:v11];
  }
  id v13 = [(SUItem *)self _newItemLinkWithType:6, [(SUItem *)self _valueForFirstAvailableKey:@"apple-eula", 0] dictionary];
  if (v13)
  {
    uint64_t v14 = v13;
    [v22 addObject:v13];
  }
  id v15 = [(SUItem *)self _newItemLinkWithType:6, [(SUItem *)self _valueForFirstAvailableKey:@"developers-eula", 0] dictionary];
  if (v15)
  {
    id v16 = v15;
    [v22 addObject:v15];
  }
  id v17 = [(SUItem *)self _newItemLinkWithType:8, [(SUItem *)self _valueForFirstAvailableKey:@"view-more-info-button", 0] dictionary];
  if (v17)
  {
    uint64_t v18 = v17;
    [v22 addObject:v17];
  }
  id v19 = [(SUItem *)self _newItemLinkWithType:9 URLKey:@"view-user-reviews-url" titleKey:0];
  uint64_t v20 = v22;
  if (v19)
  {
    [v22 addObject:v19];

    uint64_t v20 = v22;
  }
  if ([v20 count]) {
    id v21 = v22;
  }
  else {
    id v21 = 0;
  }
  [(SUItem *)self setItemLinks:v21];
}

- (void)_reloadProperties
{
  id v3 = [(SUItem *)self _valueForFirstAvailableKey:@"artist-name", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_artistName = (NSString *)v3;
  }
  id v4 = [(SUItem *)self _valueForFirstAvailableKey:@"bundle-id", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_bundleIdentifier = (NSString *)v4;
  }
  id v5 = [(SUItem *)self _valueForFirstAvailableKey:@"version", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_bundleVersion = (NSString *)v5;
  }
  id v6 = [(SUItem *)self _valueForFirstAvailableKey:@"collection-name", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_collectionName = (NSString *)v6;
  }
  id v7 = [(SUItem *)self _valueForFirstAvailableKey:@"container-name", @"mix-type-name", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_containerName = (NSString *)v7;
  }
  id v8 = [(SUItem *)self _valueForFirstAvailableKey:@"copyright", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_copyrightString = (NSString *)v8;
  }
  id v9 = [(SUItem *)self _valueForFirstAvailableKey:@"disclaimer", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_disclaimerString = (NSString *)v9;
  }
  id v10 = [(SUItem *)self _valueForFirstAvailableKey:@"game-center-enabled", 0];
  if (objc_opt_respondsToSelector()) {
    self->_gameCenterEnabled = [v10 BOOLValue];
  }
  id v11 = [(SUItem *)self _valueForFirstAvailableKey:@"genre-name", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_genreName = (NSString *)v11;
  }
  id v12 = [(SUItem *)self _valueForFirstAvailableKey:@"rating", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_contentRating = [[SUItemContentRating alloc] initWithDictionary:v12];
  }
  id v13 = [(SUItem *)self _valueForFirstAvailableKey:@"release-date", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_releaseDate = (NSDate *)v13;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = objc_alloc_init(MEMORY[0x263F08790]);
      [v14 setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];

      self->_releaseDate = (NSDate *)(id)[v14 dateFromString:v13];
    }
  }
  id v15 = [(SUItem *)self _valueForFirstAvailableKey:@"release-date-string", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_releaseDateString = (NSString *)v15;
  }
  id v16 = [(SUItem *)self _valueForFirstAvailableKey:@"tell-a-friend", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_tellAFriendDictionary = (NSDictionary *)v16;
  }
  id v17 = [(SUItem *)self _valueForFirstAvailableKey:@"tweet-info", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_tweetDictionary = (NSDictionary *)v17;
  }
  id v18 = [(SUItem *)self _valueForFirstAvailableKey:@"title2", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_secondaryTitle = (NSString *)v18;
  }
  id v19 = [(SUItem *)self _valueForFirstAvailableKey:@"software-type", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_softwareType = (NSString *)v19;
  }
  id v20 = [(SUItem *)self _valueForFirstAvailableKey:@"title", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_title = (NSString *)v20;
  }
  id v21 = [(SUItem *)self _valueForFirstAvailableKey:@"unmodified-title", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_unmodifiedTitle = (NSString *)v21;
  }
  id v22 = [(SUItem *)self _valueForFirstAvailableKey:@"version-external-identifier", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_versionIdentifier = (NSNumber *)v22;
  }
  id v23 = [(SUItem *)self _valueForFirstAvailableKey:@"version-external-identifiers", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_versionOrdering = (NSArray *)v23;
  }
  -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", *MEMORY[0x263F89410], 0);
  [(SUItem *)self setItemIdentifier:SSGetUnsignedLongLongFromValue()];
  id v24 = [(SUItem *)self _valueForFirstAvailableKey:@"media-type", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_itemMediaKind = (NSString *)v24;
  }
  id v25 = [(SUItem *)self _valueForFirstAvailableKey:@"total-items", 0];
  if (objc_opt_respondsToSelector()) {
    goto LABEL_48;
  }
  id v26 = [(SUItem *)self _valueForFirstAvailableKey:@"content-count", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = (id)[v26 objectForKey:@"songs"];
    if (objc_opt_respondsToSelector())
    {
LABEL_48:
      int64_t v27 = (int)[v25 intValue];
      goto LABEL_51;
    }
    int64_t v27 = 0;
  }
  else
  {
    int64_t v27 = -1;
  }
LABEL_51:
  self->_representedItemCount = v27;
  self->_itemDisplayType = 0;
  id v28 = [(SUItem *)self _valueForFirstAvailableKey:@"display-type", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_57;
  }
  if ([v28 isEqualToString:@"left-justified-text"])
  {
    int64_t v29 = 1;
  }
  else
  {
    if (![v28 isEqualToString:@"now-playing"]) {
      goto LABEL_57;
    }
    int64_t v29 = 2;
  }
  self->_itemDisplayType = v29;
LABEL_57:
  id v30 = [(SUItem *)self _valueForFirstAvailableKey:@"update-info", 0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (id v31 = (id)[v30 objectForKey:@"text"],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0)
    && v31
    || (id v31 = [(SUItem *)self _valueForFirstAvailableKey:@"description", @"markup", @"text", 0], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& v31)
  {

    self->_humanReadableDescription = (NSString *)v31;
  }

  self->_reviewStatistics = [[SUItemReviewStatistics alloc] initWithDictionary:self->_dictionary];
  [(SUItem *)self _reloadStoreOffers];
  id v32 = [(SUItem *)self _valueForFirstAvailableKey:@"squishes", 0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUItem *)self _reloadImagesAndLinksFromSquishes:v32];
  }
  else
  {
    [(SUItem *)self _reloadItemImages];
    [(SUItem *)self _reloadItemLinks];
  }
}

- (void)_reloadStoreOffers
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v14 = self;
  id v4 = -[SUItem _valueForFirstAvailableKey:](self, "_valueForFirstAvailableKey:", *MEMORY[0x263F7B988], 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v10 = [v4 objectForKey:v9];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v11 = [objc_alloc(MEMORY[0x263F7B1D0]) initWithOfferIdentifier:v9 dictionary:v10];
              if (v11)
              {
                id v12 = (void *)v11;
                [v3 addObject:v11];
              }
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  if ([v3 count]) {
    id v13 = v3;
  }
  else {
    id v13 = 0;
  }
  [(SUItem *)v14 setStoreOffers:v13];
}

- (id)_squishImageForSquishDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 objectForKey:@"artwork-urls"];
  if (!v4) {
    uint64_t v4 = [a3 objectForKey:@"artwork-url"];
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F7B1C0]) initWithImageCollection:v4];
  uint64_t v6 = (void *)[v5 itemImages];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
  double v8 = v7;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v6);
      }
      id v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
      [v13 imageScale];
      if (v14 == v8) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }
    id v15 = v13;
    if (v15) {
      goto LABEL_16;
    }
  }
LABEL_13:
  if ([v6 count]) {
    id v15 = (id)[v6 objectAtIndex:0];
  }
  else {
    id v15 = 0;
  }
LABEL_16:

  return v15;
}

- (id)_valueForFirstAvailableKey:(id)a3
{
  double v7 = &v8;
  if (!a3) {
    return 0;
  }
  do
  {
    id result = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:");
    uint64_t v5 = v7++;
    if (*v5) {
      BOOL v6 = result == 0;
    }
    else {
      BOOL v6 = 0;
    }
  }
  while (v6);
  return result;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (void)setCollectionName:(id)a3
{
}

- (SUItem)containerItem
{
  return self->_containerItem;
}

- (void)setContainerItem:(id)a3
{
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
}

- (SUItemContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
}

- (NSString)copyrightString
{
  return self->_copyrightString;
}

- (void)setCopyrightString:(id)a3
{
}

- (SSItemOffer)defaultStoreOffer
{
  return self->_defaultStoreOffer;
}

- (NSString)disclaimerString
{
  return self->_disclaimerString;
}

- (void)setDisclaimerString:(id)a3
{
}

- (BOOL)isGameCenterEnabled
{
  return self->_gameCenterEnabled;
}

- (void)setGameCenterEnabled:(BOOL)a3
{
  self->_gameCenterEnabled = a3;
}

- (NSString)genreName
{
  return self->_genreName;
}

- (void)setGenreName:(id)a3
{
}

- (NSString)humanReadableDescription
{
  return self->_humanReadableDescription;
}

- (void)setHumanReadableDescription:(id)a3
{
}

- (NSDictionary)itemDictionary
{
  return self->_dictionary;
}

- (int64_t)itemDisplayType
{
  return self->_itemDisplayType;
}

- (void)setItemDisplayType:(int64_t)a3
{
  self->_itemDisplayType = a3;
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(unint64_t)a3
{
  self->_itemIdentifier = a3;
}

- (SSItemImageCollection)itemImageCollection
{
  return self->_itemImageCollection;
}

- (void)setItemImageCollection:(id)a3
{
}

- (NSArray)itemLinks
{
  return self->_itemLinks;
}

- (void)setItemLinks:(id)a3
{
}

- (void)setItemMediaKind:(id)a3
{
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(int64_t)a3
{
  self->_itemType = a3;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (int64_t)representedItemCount
{
  return self->_representedItemCount;
}

- (void)setRepresentedItemCount:(int64_t)a3
{
  self->_representedItemCount = a3;
}

- (SUItemReviewStatistics)reviewStatistics
{
  return self->_reviewStatistics;
}

- (void)setReviewStatistics:(id)a3
{
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setSecondaryTitle:(id)a3
{
}

- (NSString)softwareType
{
  return self->_softwareType;
}

- (void)setSoftwareType:(id)a3
{
}

- (NSArray)storeOffers
{
  return self->_storeOffers;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void)setUnmodifiedTitle:(id)a3
{
}

- (NSNumber)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void)setVersionIdentifier:(id)a3
{
}

- (NSArray)versionOrdering
{
  return self->_versionOrdering;
}

- (void)setVersionOrdering:(id)a3
{
}

@end