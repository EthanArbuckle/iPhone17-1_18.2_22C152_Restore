@interface SUUIItem
- (BOOL)gameControllerSupported;
- (BOOL)hasInAppPurchases;
- (BOOL)hasMessagesExtension;
- (BOOL)hasPrerenderedArtwork;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHiddenFromSpringBoard;
- (BOOL)isNewsstandApp;
- (BOOL)requiresGameController;
- (NSArray)childItemIdentifiers;
- (NSArray)loadedChildItems;
- (NSArray)requiredCapabilities;
- (NSArray)videos;
- (NSMutableDictionary)cacheRepresentation;
- (NSString)_downloadKind;
- (NSString)artistName;
- (NSString)bundleIdentifier;
- (NSString)categoryName;
- (NSString)collectionName;
- (NSString)editorialBadge;
- (NSString)itemKindString;
- (NSString)productPageURLString;
- (NSString)title;
- (NSString)versionString;
- (NSURL)largestArtworkURL;
- (SUUIArtworkProviding)artworksProvider;
- (SUUIArtworkProviding)newsstandArtworks;
- (SUUIItem)initWithCacheRepresentation:(id)a3;
- (SUUIItem)initWithLookupDictionary:(id)a3;
- (SUUIItemOffer)primaryItemOffer;
- (SUUIStoreIdentifier)storeIdentifier;
- (UIImage)artworkImage;
- (_NSRange)ageBandRange;
- (float)userRating;
- (id)artworkURLForSize:(int64_t)a3;
- (id)childItemForIdentifier:(id)a3;
- (id)initContainerItemWithItem:(id)a3;
- (id)lookupDictionary;
- (id)valueForMetricsField:(id)a3;
- (int64_t)itemIdentifier;
- (int64_t)itemKind;
- (int64_t)newsstandBindingEdge;
- (int64_t)newsstandBindingType;
- (int64_t)numberOfChildItems;
- (int64_t)numberOfUserRatings;
- (int64_t)parentalControlsRank;
- (int64_t)versionIdentifier;
- (unint64_t)deviceFamilies;
- (unint64_t)hash;
- (void)_setHasInAppPurchases:(BOOL)a3;
- (void)addItemOfferParameterWithName:(id)a3 value:(id)a4;
- (void)setItemIdentifier:(int64_t)a3;
- (void)setItemKind:(int64_t)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIItem

- (id)initContainerItemWithItem:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SUUIItem;
  v5 = [(SUUIItem *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 artistName];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v6;

    uint64_t v8 = [v4 artworksProvider];
    artworksProvider = v5->_artworksProvider;
    v5->_artworksProvider = (SUUIArtworkProviding *)v8;

    uint64_t v10 = [v4 categoryName];
    categoryName = v5->_categoryName;
    v5->_categoryName = (NSString *)v10;

    uint64_t v12 = [v4 productPageURLString];
    productPageURLString = v5->_productPageURLString;
    v5->_productPageURLString = (NSString *)v12;

    uint64_t v14 = [v4 collectionName];
    title = v5->_title;
    v5->_title = (NSString *)v14;

    if (v5->_productPageURLString)
    {
      v16 = (void *)[objc_alloc(NSURL) initWithString:v5->_productPageURLString];
      v17 = [v16 path];
      v18 = v17;
      if (v17)
      {
        uint64_t v19 = [v17 rangeOfString:@"/id"];
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v21 = [v18 substringFromIndex:v19 + v20];
          v5->_itemIdentifier = [v21 longLongValue];
        }
      }
    }
    uint64_t v22 = [v4 itemKind];
    if (v22 == 13)
    {
      uint64_t v23 = 7;
      goto LABEL_11;
    }
    if (v22 == 14)
    {
      uint64_t v23 = 15;
LABEL_11:
      v5->_itemKind = v23;
    }
  }

  return v5;
}

- (SUUIItem)initWithLookupDictionary:(id)a3
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v130.receiver = self;
  v130.super_class = (Class)SUUIItem;
  v5 = [(SUUIItem *)&v130 init];

  if (!v5) {
    goto LABEL_161;
  }
  uint64_t v6 = [v4 objectForKey:*MEMORY[0x263F7B9D8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v5->_artistName, v6);
  }
  v7 = [v4 objectForKey:*MEMORY[0x263F7B9F0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v5->_bundleID, v7);
  }
  id v8 = [v4 objectForKey:*MEMORY[0x263F7BA28]];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 count])
  {
    v9 = [v8 objectAtIndex:0];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    id v8 = v9;
    categoryName = v5->_categoryName;
    v5->_categoryName = (NSString *)v8;
  }
  else
  {
    categoryName = [v4 objectForKey:@"genres"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [categoryName firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [v11 objectForKey:@"name"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v5->_categoryName, v12);
        }
      }
    }
  }

  v9 = v8;
LABEL_17:
  v13 = [v4 objectForKey:@"collectionName"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v13 copy];
    collectionName = v5->_collectionName;
    v5->_collectionName = (NSString *)v14;
  }
  v16 = [v4 objectForKey:*MEMORY[0x263F7BA40]];

  if (objc_opt_respondsToSelector()) {
    v5->_itemIdentifier = [v16 longLongValue];
  }
  v17 = [v4 objectForKey:@"feedUrl"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v5->_feedUrlString, v17);
  }
  v18 = [v4 objectForKey:@"appCount"];

  if (objc_opt_respondsToSelector()) {
    v5->_numberOfChildItems = [v18 integerValue];
  }
  uint64_t v19 = [v4 objectForKey:@"hasInAppPurchases"];

  if (objc_opt_respondsToSelector()) {
    v5->_hasInAppPurchases = [v19 BOOLValue];
  }
  uint64_t v20 = [v4 objectForKey:*MEMORY[0x263F7BA70]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v5->_productPageURLString, v20);
  }
  v21 = [v4 objectForKey:*MEMORY[0x263F7BA80]];

  objc_opt_class();
  id v104 = v4;
  v113 = v5;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v22 = v21;
    requiredCapabilities = v5->_requiredCapabilities;
    v5->_requiredCapabilities = v22;
LABEL_42:

    goto LABEL_43;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    requiredCapabilities = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    [v21 componentsSeparatedByString:@" "];
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 countByEnumeratingWithState:&v126 objects:v135 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v127;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v127 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v126 + 1) + 8 * i);
          if ([v29 length]) {
            [(NSArray *)requiredCapabilities addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v126 objects:v135 count:16];
      }
      while (v26);
    }

    uint64_t v30 = [(NSArray *)requiredCapabilities copy];
    v5 = v113;
    v31 = v113->_requiredCapabilities;
    v113->_requiredCapabilities = (NSArray *)v30;

    id v4 = v104;
    goto LABEL_42;
  }
LABEL_43:
  v32 = [v4 objectForKey:*MEMORY[0x263F7BA20]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v5->_title, v32);
  }
  v33 = [v4 objectForKey:*MEMORY[0x263F7BA48]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&v5->_itemKindString, v33);
    v34 = v5;
    uint64_t v35 = 0;
    itemKindString = v34->_itemKindString;
    while (![(id)qword_265407D70[v35 + 1] isEqualToString:itemKindString])
    {
      v35 += 2;
      if (v35 == 50)
      {
        uint64_t v37 = 0;
        goto LABEL_51;
      }
    }
    uint64_t v37 = qword_265407D70[v35];
LABEL_51:
    v113->_int64_t itemKind = v37;
  }
  v38 = [v4 objectForKey:*MEMORY[0x263F7B9E8]];

  uint64_t v39 = +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:v38];
  artworksProvider = v113->_artworksProvider;
  v113->_artworksProvider = (SUUIArtworkProviding *)v39;

  v41 = [v4 objectForKey:*MEMORY[0x263F7BA58]];

  v5 = v113;
  uint64_t v42 = +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:v41];
  newsstandArtworks = v113->_newsstandArtworks;
  v113->_newsstandArtworks = (SUUIArtworkProviding *)v42;

  if (v113->_newsstandArtworks) {
    v113->_newsstandApp = 1;
  }
  v44 = [v4 objectForKey:@"hasMessagesExtension"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v113->_hasMessagesExtension = [v44 BOOLValue];
  }
  v45 = [v4 objectForKey:@"isHiddenFromSpringBoard"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v113->_isHiddenFromSpringBoard = [v45 BOOLValue];
  }
  v46 = [v4 objectForKey:@"isGameControllerSupported"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v113->_gameControllerSupported = [v46 BOOLValue];
  }
  v47 = [v4 objectForKey:@"requiresGameController"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v113->_requiresGameController = [v47 BOOLValue];
  }
  v48 = [v4 objectForKey:@"ageBand"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v49 = [v48 objectForKey:@"maxAge"];
    v103 = [v48 objectForKey:@"minAge"];
  }
  else
  {
    v103 = 0;
    v49 = 0;
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v113->_ageBandRange.location = [v103 integerValue];
    uint64_t v50 = [v49 integerValue] - v113->_ageBandRange.location;
  }
  else
  {
    uint64_t v50 = 0;
    v113->_ageBandRange.location = 0x7FFFFFFFFFFFFFFFLL;
  }
  v113->_ageBandRange.length = v50;
  v51 = [v4 objectForKey:*MEMORY[0x263F7B9F8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = [v51 objectForKey:@"value"];

    v108 = v52;
    if (objc_opt_respondsToSelector()) {
      v113->_parentalControlsRanuint64_t k = [v52 integerValue];
    }
  }
  else
  {
    v108 = v47;
  }
  v53 = [v4 objectForKey:*MEMORY[0x263F7BA60]];
  objc_opt_class();
  v107 = v53;
  v101 = v51;
  v102 = v49;
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v53 count])
  {
    v54 = [v53 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v55 = [v54 objectForKey:@"version"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v56 = [v55 objectForKey:@"display"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v113->_versionString, v56);
        }
        v57 = [v55 objectForKey:@"externalId"];

        v108 = v57;
        if (objc_opt_respondsToSelector()) {
          v113->_versionIdentifier = [v57 longLongValue];
        }
      }
      v58 = [[SUUIItemOffer alloc] initWithLookupDictionary:v54];
      itemOffer = v113->_itemOffer;
      v113->_itemOffer = v58;

      v60 = [v4 objectForKey:@"fileSizeByDevice"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SUUIItemOffer *)v113->_itemOffer _setFileSizeWithDeviceSizes:v60];
      }

      v51 = v101;
      v49 = v102;
    }

    v53 = v107;
  }
  v61 = [v4 objectForKey:@"deviceFamilies"];
  if (!v61)
  {
    v62 = [v4 objectForKey:*MEMORY[0x263F7BAC0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v61 = [v62 objectForKey:@"deviceFamilies"];
    }
    else
    {
      v61 = 0;
    }

    v53 = v107;
  }
  objc_opt_class();
  v112 = v61;
  v100 = v48;
  if (objc_opt_isKindOfClass())
  {
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v63 = v61;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v122 objects:v134 count:16];
    if (!v64) {
      goto LABEL_108;
    }
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v123;
    while (1)
    {
      for (uint64_t j = 0; j != v65; ++j)
      {
        if (*(void *)v123 != v66) {
          objc_enumerationMutation(v63);
        }
        v68 = *(void **)(*((void *)&v122 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v68 isEqualToString:@"ipad"])
          {
            uint64_t v69 = 1;
          }
          else if ([v68 isEqualToString:@"iphone"])
          {
            uint64_t v69 = 2;
          }
          else if ([v68 isEqualToString:@"ipod"])
          {
            uint64_t v69 = 4;
          }
          else
          {
            if (![v68 isEqualToString:@"tvos"]) {
              continue;
            }
            uint64_t v69 = 8;
          }
          v113->_deviceFamilies |= v69;
        }
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v122 objects:v134 count:16];
      if (!v65)
      {
LABEL_108:

        id v4 = v104;
        v48 = v100;
        v51 = v101;
        v49 = v102;
        v53 = v107;
        v61 = v112;
        goto LABEL_110;
      }
    }
  }
  v113->_deviceFamilies = 15;
LABEL_110:
  v70 = [v4 objectForKey:@"editorialBadgeInfo"];
  objc_opt_class();
  v105 = v70;
  if (objc_opt_isKindOfClass())
  {
    v71 = [v70 objectForKey:@"nameForDisplay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v113->_editorialBadge, v71);
    }

    v53 = v107;
  }
  if (!v113->_versionIdentifier)
  {
    v72 = [v4 objectForKey:@"version"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v113->_versionString, v72);
    }
    v73 = [v4 objectForKey:@"versionId"];

    v108 = v73;
    if (objc_opt_respondsToSelector()) {
      v113->_versionIdentifier = [v73 longLongValue];
    }
    v53 = v107;
    v61 = v112;
  }
  v74 = [v4 objectForKey:*MEMORY[0x263F7BAF0]];
  objc_opt_class();
  v106 = v74;
  if (objc_opt_isKindOfClass())
  {
    int64_t itemKind = v113->_itemKind;
    if (itemKind == 17 || itemKind == 12)
    {
      v76 = [v74 objectForKey:*MEMORY[0x263F7BAE8]];

      if (objc_opt_respondsToSelector()) {
        v113->_numberOfUserRatings = [v76 integerValue];
      }
      v77 = (void *)MEMORY[0x263F7BB00];
    }
    else
    {
      v76 = [v74 objectForKey:*MEMORY[0x263F7BAE0]];

      if (objc_opt_respondsToSelector()) {
        v113->_numberOfUserRatings = [v76 integerValue];
      }
      v77 = (void *)MEMORY[0x263F7BAF8];
    }
    uint64_t v78 = [v74 objectForKey:*v77];

    v108 = (void *)v78;
    v53 = v107;
    v61 = v112;
    if (objc_opt_respondsToSelector())
    {
      [v108 floatValue];
      v113->_userRating = v79;
    }
  }
  uint64_t v80 = [v4 objectForKey:@"videoPreviewByType"];
  objc_opt_class();
  v111 = (void *)v80;
  if (objc_opt_isKindOfClass())
  {
    v81 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v82 = [v81 userInterfaceIdiom];

    if (v82 == 1) {
      v83 = &unk_2705D0A60;
    }
    else {
      v83 = &unk_2705D0A78;
    }
    id v84 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    uint64_t v110 = [v83 countByEnumeratingWithState:&v118 objects:v133 count:16];
    if (v110)
    {
      uint64_t v109 = *(void *)v119;
LABEL_137:
      uint64_t v85 = 0;
      while (1)
      {
        if (*(void *)v119 != v109) {
          objc_enumerationMutation(v83);
        }
        v86 = [v111 objectForKey:*(void *)(*((void *)&v118 + 1) + 8 * v85)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v87 = v86;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v132 = v86;
            id v87 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v132 count:1];
          }
          else
          {
            id v87 = 0;
          }
        }
        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v88 = v87;
        uint64_t v89 = [v88 countByEnumeratingWithState:&v114 objects:v131 count:16];
        if (v89)
        {
          uint64_t v90 = v89;
          uint64_t v91 = *(void *)v115;
          do
          {
            for (uint64_t k = 0; k != v90; ++k)
            {
              if (*(void *)v115 != v91) {
                objc_enumerationMutation(v88);
              }
              uint64_t v93 = *(void *)(*((void *)&v114 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v94 = [[SUUIVideo alloc] initWithVideoDictionary:v93];
                if (v94) {
                  [v84 addObject:v94];
                }
              }
            }
            uint64_t v90 = [v88 countByEnumeratingWithState:&v114 objects:v131 count:16];
          }
          while (v90);
        }

        uint64_t v95 = [v84 count];
        v61 = v112;
        v5 = v113;
        if (v95) {
          break;
        }
        if (++v85 == v110)
        {
          uint64_t v110 = [v83 countByEnumeratingWithState:&v118 objects:v133 count:16];
          if (v110) {
            goto LABEL_137;
          }
          break;
        }
      }
    }
    uint64_t v96 = [v84 copy];
    videos = v5->_videos;
    v5->_videos = (NSArray *)v96;

    id v4 = v104;
    v48 = v100;
    v51 = v101;
    v49 = v102;
    v53 = v107;
  }

LABEL_161:
  v98 = v5;

  return v98;
}

- (id)artworkURLForSize:(int64_t)a3
{
  return (id)[(SUUIArtworkProviding *)self->_artworksProvider artworkURLForSize:a3];
}

- (UIImage)artworkImage
{
  return 0;
}

- (id)childItemForIdentifier:(id)a3
{
  return 0;
}

- (NSArray)childItemIdentifiers
{
  return 0;
}

- (NSURL)largestArtworkURL
{
  v2 = [(SUUIArtworkProviding *)self->_artworksProvider largestArtwork];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

- (NSArray)loadedChildItems
{
  return 0;
}

- (SUUIStoreIdentifier)storeIdentifier
{
  storeIdentifier = self->_storeIdentifier;
  if (!storeIdentifier)
  {
    id v4 = [[SUUIStoreIdentifier alloc] initWithLongLong:[(SUUIItem *)self itemIdentifier]];
    v5 = self->_storeIdentifier;
    self->_storeIdentifier = v4;

    uint64_t v6 = [(SUUIItem *)self bundleIdentifier];
    [(SUUIStoreIdentifier *)self->_storeIdentifier setBundleIdentifier:v6];

    [(SUUIStoreIdentifier *)self->_storeIdentifier setPodcastFeedURLIdentifier:self->_feedUrlString];
    storeIdentifier = self->_storeIdentifier;
  }
  return storeIdentifier;
}

- (void)setTitle:(id)a3
{
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (void)setItemKind:(int64_t)a3
{
  self->_int64_t itemKind = a3;
}

- (void)addItemOfferParameterWithName:(id)a3 value:(id)a4
{
}

- (id)lookupDictionary
{
  v64[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = [(SUUIItem *)self ageBandRange];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v9 = [NSNumber numberWithUnsignedInteger:v6];
    [v8 setObject:v9 forKey:@"minAge"];

    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v6 + v7];
    [v8 setObject:v10 forKey:@"maxAge"];

    [v3 setObject:v8 forKey:@"ageBand"];
  }
  v11 = [(SUUIItem *)self artistName];
  if (v11) {
    [v3 setObject:v11 forKey:*MEMORY[0x263F7B9D8]];
  }
  uint64_t v12 = [(SUUIItem *)self bundleIdentifier];

  if (v12) {
    [v3 setObject:v12 forKey:*MEMORY[0x263F7B9F0]];
  }
  v13 = [(SUUIItem *)self categoryName];

  if (v13)
  {
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v13, 0);
    [v3 setObject:v14 forKey:*MEMORY[0x263F7BA28]];
  }
  v15 = [(SUUIItem *)self collectionName];

  if (v15) {
    [v3 setObject:v15 forKey:@"collectionName"];
  }
  if ([(SUUIItem *)self hasInAppPurchases]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"hasInAppPurchases"];
  }
  int64_t v16 = [(SUUIItem *)self itemIdentifier];
  if (v16)
  {
    v17 = (void *)[objc_alloc(NSNumber) initWithLongLong:v16];
    [v3 setObject:v17 forKey:*MEMORY[0x263F7BA40]];
  }
  v18 = [(SUUIItem *)self itemKindString];

  if (v18) {
    [v3 setObject:v18 forKey:*MEMORY[0x263F7BA48]];
  }
  uint64_t v19 = [(SUUIItem *)self primaryItemOffer];
  uint64_t v20 = v19;
  if (v19)
  {
    v21 = [v19 lookupDictionary];
    v64[0] = v21;
    uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:1];
    [v3 setObject:v22 forKey:*MEMORY[0x263F7BA60]];
  }
  uint64_t v23 = [(SUUIItem *)self numberOfChildItems];
  if (v23 >= 1)
  {
    id v24 = [NSNumber numberWithInteger:v23];
    [v3 setObject:v24 forKey:@"appCount"];
  }
  int64_t v25 = [(SUUIItem *)self parentalControlsRank];
  if (v25)
  {
    v62 = @"value";
    uint64_t v26 = [NSNumber numberWithInteger:v25];
    id v63 = v26;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    [v3 setObject:v27 forKey:*MEMORY[0x263F7B9F8]];
  }
  v28 = [(SUUIItem *)self productPageURLString];

  if (v28) {
    [v3 setObject:v28 forKey:*MEMORY[0x263F7BA70]];
  }
  v29 = [(SUUIItem *)self requiredCapabilities];

  if (v29) {
    [v3 setObject:v29 forKey:*MEMORY[0x263F7BA80]];
  }
  uint64_t v30 = [(SUUIItem *)self title];

  if (v30) {
    [v3 setObject:v30 forKey:*MEMORY[0x263F7BA20]];
  }
  int64_t v31 = [(SUUIItem *)self versionIdentifier];
  if (v31)
  {
    v32 = [NSNumber numberWithLongLong:v31];
    [v3 setObject:v32 forKey:@"versionId"];
  }
  v33 = [(SUUIItem *)self versionString];

  if (v33) {
    [v3 setObject:v33 forKey:@"version"];
  }
  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v35 = [(SUUIItem *)self deviceFamilies];
  char v36 = v35;
  if (v35)
  {
    [v34 addObject:@"ipad"];
    if ((v36 & 2) == 0)
    {
LABEL_35:
      if ((v36 & 4) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  else if ((v35 & 2) == 0)
  {
    goto LABEL_35;
  }
  [v34 addObject:@"iphone"];
  if ((v36 & 4) != 0) {
LABEL_36:
  }
    [v34 addObject:@"ipod"];
LABEL_37:
  if ([v34 count])
  {
    uint64_t v37 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v34, @"deviceFamilies", 0);
    [v3 setObject:v37 forKey:*MEMORY[0x263F7BAC0]];
  }
  id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int64_t v39 = [(SUUIItem *)self itemKind];
  v40 = (void *)MEMORY[0x263F7BAF8];
  v41 = (void *)MEMORY[0x263F7BAE0];
  if (v39 == 17)
  {
    v41 = (void *)MEMORY[0x263F7BAE8];
    v40 = (void *)MEMORY[0x263F7BB00];
  }
  if (v39 == 12) {
    uint64_t v42 = (void *)MEMORY[0x263F7BAE8];
  }
  else {
    uint64_t v42 = v41;
  }
  if (v39 == 12) {
    v43 = (void *)MEMORY[0x263F7BB00];
  }
  else {
    v43 = v40;
  }
  v44 = objc_msgSend(NSNumber, "numberWithInteger:", -[SUUIItem numberOfUserRatings](self, "numberOfUserRatings"));
  [v38 setObject:v44 forKey:*v42];

  v45 = NSNumber;
  [(SUUIItem *)self userRating];
  v46 = objc_msgSend(v45, "numberWithFloat:");
  [v38 setObject:v46 forKey:*v43];

  [v3 setObject:v38 forKey:*MEMORY[0x263F7BAF0]];
  v47 = [(SUUIItem *)self artworksProvider];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v49 = [(SUUIItem *)self artworksProvider];
  uint64_t v50 = v49;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v53 = objc_opt_isKindOfClass();

    if ((v53 & 1) == 0) {
      goto LABEL_58;
    }
    uint64_t v50 = [(SUUIItem *)self artworksProvider];
    v52 = [v50 _lookupArray];
    if (![v52 count]) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  v51 = [v49 urlTemplateString];

  if (v51)
  {
    v52 = [v50 _lookupDictionary];
LABEL_55:
    [v3 setObject:v52 forKey:*MEMORY[0x263F7B9E8]];
LABEL_56:
  }
LABEL_58:
  v54 = [(SUUIItem *)self newsstandArtworks];
  objc_opt_class();
  char v55 = objc_opt_isKindOfClass();

  v56 = [(SUUIItem *)self newsstandArtworks];
  v57 = v56;
  if ((v55 & 1) == 0)
  {
    objc_opt_class();
    char v60 = objc_opt_isKindOfClass();

    if ((v60 & 1) == 0) {
      goto LABEL_66;
    }
    v57 = [(SUUIItem *)self newsstandArtworks];
    v59 = [v57 _lookupArray];
    if (![v59 count]) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  v58 = [v56 urlTemplateString];

  if (v58)
  {
    v59 = [v57 _lookupDictionary];
LABEL_63:
    [v3 setObject:v59 forKey:*MEMORY[0x263F7BA58]];
LABEL_64:
  }
LABEL_66:

  return v3;
}

- (NSString)_downloadKind
{
  unint64_t v2 = [(SUUIItem *)self itemKind];
  if (v2 <= 0x12) {
    id v3 = **((id **)&unk_265407F00 + v2);
  }
  return (NSString *)v3;
}

- (void)_setHasInAppPurchases:(BOOL)a3
{
  self->_hasInAppPurchases = a3;
}

- (unint64_t)hash
{
  return self->_itemIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    uint64_t v7 = [v4 itemIdentifier];
    BOOL v6 = v7 == [(SUUIItem *)self itemIdentifier];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (SUUIItem)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v58.receiver = self;
    v58.super_class = (Class)SUUIItem;
    uint64_t v5 = [(SUUIItem *)&v58 init];
    if (v5)
    {
      BOOL v6 = [v4 objectForKey:@"artistName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v6 copy];
        artistName = v5->_artistName;
        v5->_artistName = (NSString *)v7;
      }
      v9 = [v4 objectForKey:@"bid"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 copy];
        bundleID = v5->_bundleID;
        v5->_bundleID = (NSString *)v10;
      }
      uint64_t v12 = [v4 objectForKey:@"genre"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 copy];
        categoryName = v5->_categoryName;
        v5->_categoryName = (NSString *)v13;
      }
      v15 = [v4 objectForKey:@"col_name"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = [v15 copy];
        collectionName = v5->_collectionName;
        v5->_collectionName = (NSString *)v16;
      }
      v18 = [v4 objectForKey:@"dev_fam"];

      if (objc_opt_respondsToSelector()) {
        v5->_deviceFamilies = [v18 unsignedIntegerValue];
      }
      uint64_t v19 = [v4 objectForKey:@"id"];

      if (objc_opt_respondsToSelector()) {
        v5->_itemIdentifier = [v19 longLongValue];
      }
      uint64_t v20 = [v4 objectForKey:@"offer"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = [[SUUIItemOffer alloc] initWithCacheRepresentation:v20];
        itemOffer = v5->_itemOffer;
        v5->_itemOffer = v21;
      }
      uint64_t v23 = [v4 objectForKey:@"child_count"];

      if (objc_opt_respondsToSelector()) {
        v5->_numberOfChildItems = [v23 integerValue];
      }
      id v24 = [v4 objectForKey:@"user_rating_count"];

      if (objc_opt_respondsToSelector()) {
        v5->_numberOfUserRatings = [v24 integerValue];
      }
      int64_t v25 = [v4 objectForKey:@"parental_rank"];

      if (objc_opt_respondsToSelector()) {
        v5->_parentalControlsRanuint64_t k = [v25 integerValue];
      }
      uint64_t v26 = [v4 objectForKey:@"url"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v27 = [v26 copy];
        productPageURLString = v5->_productPageURLString;
        v5->_productPageURLString = (NSString *)v27;
      }
      v29 = [v4 objectForKey:@"req_caps"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v30 = [v29 copy];
        requiredCapabilities = v5->_requiredCapabilities;
        v5->_requiredCapabilities = (NSArray *)v30;
      }
      v32 = [v4 objectForKey:@"name"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v33 = [v32 copy];
        title = v5->_title;
        v5->_title = (NSString *)v33;
      }
      char v35 = [v4 objectForKey:@"user_rating"];

      if (objc_opt_respondsToSelector())
      {
        [v35 floatValue];
        v5->_userRating = v36;
      }
      uint64_t v37 = [v4 objectForKey:@"version_id"];

      if (objc_opt_respondsToSelector()) {
        v5->_versionIdentifier = [v37 longLongValue];
      }
      id v38 = [v4 objectForKey:@"version"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v39 = [v38 copy];
        versionString = v5->_versionString;
        v5->_versionString = (NSString *)v39;
      }
      v41 = [v4 objectForKey:@"kind"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v42 = [v41 copy];
        itemKindString = v5->_itemKindString;
        v5->_itemKindString = (NSString *)v42;

        uint64_t v44 = 0;
        v45 = v5->_itemKindString;
        while (![(id)qword_265407D70[v44 + 1] isEqualToString:v45])
        {
          v44 += 2;
          if (v44 == 50)
          {
            uint64_t v46 = 0;
            goto LABEL_43;
          }
        }
        uint64_t v46 = qword_265407D70[v44];
LABEL_43:
        v5->_int64_t itemKind = v46;
      }
      else
      {
        v47 = v5->_itemKindString;
        v5->_int64_t itemKind = 12;
        v5->_itemKindString = (NSString *)@"iosSoftware";
      }
      v48 = [v4 objectForKey:@"artwork"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v49 = [v4 objectForKey:@"artworkProvider"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v49 isEqualToString:@"artworkTemplate"])
        {
          uint64_t v50 = SUUIArtworkTemplate;
        }
        else
        {
          uint64_t v50 = SUUIArtworkList;
        }
        uint64_t v51 = [[v50 alloc] initWithCacheRepresentation:v48];
        artworksProvider = v5->_artworksProvider;
        v5->_artworksProvider = (SUUIArtworkProviding *)v51;
      }
      char v53 = [v4 objectForKey:@"ageblen"];
      v54 = [v4 objectForKey:@"agebloc"];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        uint64_t v55 = [v54 integerValue];
        uint64_t v56 = [v53 integerValue];
        v5->_ageBandRange.location = v55;
      }
      else
      {
        uint64_t v56 = 0;
        v5->_ageBandRange.location = 0x7FFFFFFFFFFFFFFFLL;
      }
      v5->_ageBandRange.length = v56;
    }
  }
  else
  {

    uint64_t v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [NSNumber numberWithUnsignedInteger:self->_ageBandRange.length];
  [v3 setObject:v4 forKey:@"ageblen"];

  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_ageBandRange.location];
  [v3 setObject:v5 forKey:@"agebloc"];

  BOOL v6 = [NSNumber numberWithUnsignedInteger:self->_deviceFamilies];
  [v3 setObject:v6 forKey:@"dev_fam"];

  uint64_t v7 = [NSNumber numberWithLongLong:self->_itemIdentifier];
  [v3 setObject:v7 forKey:@"id"];

  id v8 = [NSNumber numberWithInteger:self->_numberOfChildItems];
  [v3 setObject:v8 forKey:@"child_count"];

  v9 = [NSNumber numberWithInteger:self->_numberOfUserRatings];
  [v3 setObject:v9 forKey:@"user_rating_count"];

  uint64_t v10 = [NSNumber numberWithInteger:self->_parentalControlsRank];
  [v3 setObject:v10 forKey:@"parental_rank"];

  *(float *)&double v11 = self->_userRating;
  uint64_t v12 = [NSNumber numberWithFloat:v11];
  [v3 setObject:v12 forKey:@"user_rating"];

  uint64_t v13 = [NSNumber numberWithLongLong:self->_versionIdentifier];
  [v3 setObject:v13 forKey:@"version_id"];

  artistName = self->_artistName;
  if (artistName) {
    [v3 setObject:artistName forKey:@"artistName"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bid"];
  }
  categoryName = self->_categoryName;
  if (categoryName) {
    [v3 setObject:categoryName forKey:@"genre"];
  }
  collectionName = self->_collectionName;
  if (collectionName) {
    [v3 setObject:collectionName forKey:@"col_name"];
  }
  itemKindString = self->_itemKindString;
  if (itemKindString) {
    [v3 setObject:itemKindString forKey:@"kind"];
  }
  productPageURLString = self->_productPageURLString;
  if (productPageURLString) {
    [v3 setObject:productPageURLString forKey:@"url"];
  }
  requiredCapabilities = self->_requiredCapabilities;
  if (requiredCapabilities) {
    [v3 setObject:requiredCapabilities forKey:@"req_caps"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"name"];
  }
  versionString = self->_versionString;
  if (versionString) {
    [v3 setObject:versionString forKey:@"version"];
  }
  uint64_t v23 = [(SUUIItemOffer *)self->_itemOffer cacheRepresentation];
  if (v23) {
    [v3 setObject:v23 forKey:@"offer"];
  }
  id v24 = [(SUUIArtworkProviding *)self->_artworksProvider cacheRepresentation];
  if (v24) {
    [v3 setObject:v24 forKey:@"artwork"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v25 = @"artworkTemplate";
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_28;
    }
    int64_t v25 = @"artworkList";
  }
  [v3 setObject:v25 forKey:@"artworkProvider"];
LABEL_28:

  return (NSMutableDictionary *)v3;
}

- (id)valueForMetricsField:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F7BB68]])
  {
    uint64_t v5 = [NSNumber numberWithLongLong:self->_itemIdentifier];
LABEL_6:
    BOOL v6 = (void *)v5;
    goto LABEL_7;
  }
  if (([v4 isEqualToString:*MEMORY[0x263F7BB80]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263F7BB78]])
  {
    uint64_t v5 = [(SUUIItem *)self title];
    goto LABEL_6;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F7BB88]])
  {
    uint64_t v5 = [(SUUIItem *)self itemKindString];
    goto LABEL_6;
  }
  BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleID;
}

- (SUUIItemOffer)primaryItemOffer
{
  return self->_itemOffer;
}

- (_NSRange)ageBandRange
{
  NSUInteger length = self->_ageBandRange.length;
  NSUInteger location = self->_ageBandRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (SUUIArtworkProviding)artworksProvider
{
  return self->_artworksProvider;
}

- (int64_t)numberOfChildItems
{
  return self->_numberOfChildItems;
}

- (unint64_t)deviceFamilies
{
  return self->_deviceFamilies;
}

- (BOOL)hasPrerenderedArtwork
{
  return self->_prerenderedArtwork;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (NSString)editorialBadge
{
  return self->_editorialBadge;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (int64_t)itemKind
{
  return self->_itemKind;
}

- (NSString)itemKindString
{
  return self->_itemKindString;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (int64_t)parentalControlsRank
{
  return self->_parentalControlsRank;
}

- (NSString)productPageURLString
{
  return self->_productPageURLString;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (float)userRating
{
  return self->_userRating;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

- (NSString)versionString
{
  return self->_versionString;
}

- (NSArray)videos
{
  return self->_videos;
}

- (BOOL)hasInAppPurchases
{
  return self->_hasInAppPurchases;
}

- (BOOL)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (BOOL)isHiddenFromSpringBoard
{
  return self->_isHiddenFromSpringBoard;
}

- (BOOL)gameControllerSupported
{
  return self->_gameControllerSupported;
}

- (BOOL)requiresGameController
{
  return self->_requiresGameController;
}

- (BOOL)isNewsstandApp
{
  return self->_newsstandApp;
}

- (int64_t)newsstandBindingEdge
{
  return self->_newsstandBindingEdge;
}

- (int64_t)newsstandBindingType
{
  return self->_newsstandBindingType;
}

- (SUUIArtworkProviding)newsstandArtworks
{
  return self->_newsstandArtworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsstandArtworks, 0);
  objc_storeStrong((id *)&self->_editorialBadge, 0);
  objc_storeStrong((id *)&self->_artworksProvider, 0);
  objc_storeStrong((id *)&self->_videos, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_productPageURLString, 0);
  objc_storeStrong((id *)&self->_itemOffer, 0);
  objc_storeStrong((id *)&self->_itemKindString, 0);
  objc_storeStrong((id *)&self->_feedUrlString, 0);
  objc_storeStrong((id *)&self->_editorialBage, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
}

@end