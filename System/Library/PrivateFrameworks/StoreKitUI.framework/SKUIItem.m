@interface SKUIItem
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
- (SKUIArtworkProviding)artworksProvider;
- (SKUIArtworkProviding)newsstandArtworks;
- (SKUIItem)initWithCacheRepresentation:(id)a3;
- (SKUIItem)initWithIdentifier:(id)a3 mediaResultDictionary:(id)a4;
- (SKUIItem)initWithLookupDictionary:(id)a3;
- (SKUIItemOffer)primaryItemOffer;
- (SKUIStoreIdentifier)storeIdentifier;
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

@implementation SKUIItem

- (id)initContainerItemWithItem:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIItem initContainerItemWithItem:]();
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIItem;
  v5 = [(SKUIItem *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 artistName];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v6;

    uint64_t v8 = [v4 artworksProvider];
    artworksProvider = v5->_artworksProvider;
    v5->_artworksProvider = (SKUIArtworkProviding *)v8;

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
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v5->_productPageURLString];
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
      goto LABEL_15;
    }
    if (v22 == 14)
    {
      uint64_t v23 = 15;
LABEL_15:
      v5->_itemKind = v23;
    }
  }

  return v5;
}

- (SKUIItem)initWithLookupDictionary:(id)a3
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SKUIItem initWithLookupDictionary:]();
    }
  }
  v132.receiver = self;
  v132.super_class = (Class)SKUIItem;
  v7 = [(SKUIItem *)&v132 init];

  if (!v7) {
    goto LABEL_166;
  }
  uint64_t v8 = [v4 objectForKey:*MEMORY[0x1E4FA8700]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v7->_artistName, v8);
  }
  v9 = [v4 objectForKey:*MEMORY[0x1E4FA8718]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v7->_bundleID, v9);
  }
  id v10 = [v4 objectForKey:*MEMORY[0x1E4FA8750]];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 count])
  {
    v11 = [v10 objectAtIndex:0];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_22;
    }
    id v10 = v11;
    categoryName = v7->_categoryName;
    v7->_categoryName = (NSString *)v10;
  }
  else
  {
    categoryName = [v4 objectForKey:@"genres"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [categoryName firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [v13 objectForKey:@"name"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v7->_categoryName, v14);
        }
      }
    }
  }

  v11 = v10;
LABEL_22:
  v15 = [v4 objectForKey:@"collectionName"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v15 copy];
    collectionName = v7->_collectionName;
    v7->_collectionName = (NSString *)v16;
  }
  v18 = [v4 objectForKey:*MEMORY[0x1E4FA8770]];

  if (objc_opt_respondsToSelector()) {
    v7->_itemIdentifier = [v18 longLongValue];
  }
  uint64_t v19 = [v4 objectForKey:@"feedUrl"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v7->_feedUrlString, v19);
  }
  uint64_t v20 = [v4 objectForKey:@"appCount"];

  if (objc_opt_respondsToSelector()) {
    v7->_numberOfChildItems = [v20 integerValue];
  }
  v21 = [v4 objectForKey:@"hasInAppPurchases"];

  if (objc_opt_respondsToSelector()) {
    v7->_hasInAppPurchases = [v21 BOOLValue];
  }
  uint64_t v22 = [v4 objectForKey:*MEMORY[0x1E4FA87A0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v7->_productPageURLString, v22);
  }
  uint64_t v23 = [v4 objectForKey:*MEMORY[0x1E4FA87B0]];

  objc_opt_class();
  id v106 = v4;
  v115 = v7;
  if (objc_opt_isKindOfClass())
  {
    v24 = v23;
    requiredCapabilities = v7->_requiredCapabilities;
    v7->_requiredCapabilities = v24;
LABEL_47:

    goto LABEL_48;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    requiredCapabilities = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v23 componentsSeparatedByString:@" "];
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v26 countByEnumeratingWithState:&v128 objects:v137 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v129;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v129 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v128 + 1) + 8 * i);
          if ([v31 length]) {
            [(NSArray *)requiredCapabilities addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v128 objects:v137 count:16];
      }
      while (v28);
    }

    uint64_t v32 = [(NSArray *)requiredCapabilities copy];
    v7 = v115;
    v33 = v115->_requiredCapabilities;
    v115->_requiredCapabilities = (NSArray *)v32;

    id v4 = v106;
    goto LABEL_47;
  }
LABEL_48:
  v34 = [v4 objectForKey:*MEMORY[0x1E4FA8748]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v7->_title, v34);
  }
  v35 = [v4 objectForKey:*MEMORY[0x1E4FA8778]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&v7->_itemKindString, v35);
    v36 = v7;
    uint64_t v37 = 0;
    itemKindString = v36->_itemKindString;
    while (![(id)qword_1E6423DC8[v37 + 1] isEqualToString:itemKindString])
    {
      v37 += 2;
      if (v37 == 50)
      {
        uint64_t v39 = 0;
        goto LABEL_56;
      }
    }
    uint64_t v39 = qword_1E6423DC8[v37];
LABEL_56:
    v115->_int64_t itemKind = v39;
  }
  v40 = [v4 objectForKey:*MEMORY[0x1E4FA8710]];

  uint64_t v41 = +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:v40];
  artworksProvider = v115->_artworksProvider;
  v115->_artworksProvider = (SKUIArtworkProviding *)v41;

  v43 = [v4 objectForKey:*MEMORY[0x1E4FA8788]];

  v7 = v115;
  uint64_t v44 = +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:v43];
  newsstandArtworks = v115->_newsstandArtworks;
  v115->_newsstandArtworks = (SKUIArtworkProviding *)v44;

  if (v115->_newsstandArtworks) {
    v115->_newsstandApp = 1;
  }
  v46 = [v4 objectForKey:@"hasMessagesExtension"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v115->_hasMessagesExtension = [v46 BOOLValue];
  }
  v47 = [v4 objectForKey:@"isHiddenFromSpringBoard"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v115->_isHiddenFromSpringBoard = [v47 BOOLValue];
  }
  v48 = [v4 objectForKey:@"isGameControllerSupported"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v115->_gameControllerSupported = [v48 BOOLValue];
  }
  v49 = [v4 objectForKey:@"requiresGameController"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v115->_requiresGameController = [v49 BOOLValue];
  }
  v50 = [v4 objectForKey:@"ageBand"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v51 = [v50 objectForKey:@"maxAge"];
    v105 = [v50 objectForKey:@"minAge"];
  }
  else
  {
    v105 = 0;
    v51 = 0;
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v115->_ageBandRange.location = [v105 integerValue];
    uint64_t v52 = [v51 integerValue] - v115->_ageBandRange.location;
  }
  else
  {
    uint64_t v52 = 0;
    v115->_ageBandRange.location = 0x7FFFFFFFFFFFFFFFLL;
  }
  v115->_ageBandRange.length = v52;
  v53 = [v4 objectForKey:*MEMORY[0x1E4FA8720]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v54 = [v53 objectForKey:@"value"];

    v110 = v54;
    if (objc_opt_respondsToSelector()) {
      v115->_parentalControlsRanuint64_t k = [v54 integerValue];
    }
  }
  else
  {
    v110 = v49;
  }
  v55 = [v4 objectForKey:*MEMORY[0x1E4FA8790]];
  objc_opt_class();
  v109 = v55;
  v103 = v53;
  v104 = v51;
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v55 count])
  {
    v56 = [v55 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v57 = [v56 objectForKey:@"version"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v58 = [v57 objectForKey:@"display"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v115->_versionString, v58);
        }
        v59 = [v57 objectForKey:@"externalId"];

        v110 = v59;
        if (objc_opt_respondsToSelector()) {
          v115->_versionIdentifier = [v59 longLongValue];
        }
      }
      v60 = [[SKUIItemOffer alloc] initWithLookupDictionary:v56];
      itemOffer = v115->_itemOffer;
      v115->_itemOffer = v60;

      v62 = [v4 objectForKey:@"fileSizeByDevice"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SKUIItemOffer *)v115->_itemOffer _setFileSizeWithDeviceSizes:v62];
      }

      v53 = v103;
      v51 = v104;
    }

    v55 = v109;
  }
  v63 = [v4 objectForKey:@"deviceFamilies"];
  if (!v63)
  {
    v64 = [v4 objectForKey:*MEMORY[0x1E4FA87F0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v63 = [v64 objectForKey:@"deviceFamilies"];
    }
    else
    {
      v63 = 0;
    }

    v55 = v109;
  }
  objc_opt_class();
  v114 = v63;
  v102 = v50;
  if (objc_opt_isKindOfClass())
  {
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id v65 = v63;
    uint64_t v66 = [v65 countByEnumeratingWithState:&v124 objects:v136 count:16];
    if (!v66) {
      goto LABEL_113;
    }
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v125;
    while (1)
    {
      for (uint64_t j = 0; j != v67; ++j)
      {
        if (*(void *)v125 != v68) {
          objc_enumerationMutation(v65);
        }
        v70 = *(void **)(*((void *)&v124 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v70 isEqualToString:@"ipad"])
          {
            uint64_t v71 = 1;
          }
          else if ([v70 isEqualToString:@"iphone"])
          {
            uint64_t v71 = 2;
          }
          else if ([v70 isEqualToString:@"ipod"])
          {
            uint64_t v71 = 4;
          }
          else
          {
            if (![v70 isEqualToString:@"tvos"]) {
              continue;
            }
            uint64_t v71 = 8;
          }
          v115->_deviceFamilies |= v71;
        }
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v124 objects:v136 count:16];
      if (!v67)
      {
LABEL_113:

        id v4 = v106;
        v50 = v102;
        v53 = v103;
        v51 = v104;
        v55 = v109;
        v63 = v114;
        goto LABEL_115;
      }
    }
  }
  v115->_deviceFamilies = 15;
LABEL_115:
  v72 = [v4 objectForKey:@"editorialBadgeInfo"];
  objc_opt_class();
  v107 = v72;
  if (objc_opt_isKindOfClass())
  {
    v73 = [v72 objectForKey:@"nameForDisplay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v115->_editorialBadge, v73);
    }

    v55 = v109;
  }
  if (!v115->_versionIdentifier)
  {
    v74 = [v4 objectForKey:@"version"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v115->_versionString, v74);
    }
    v75 = [v4 objectForKey:@"versionId"];

    v110 = v75;
    if (objc_opt_respondsToSelector()) {
      v115->_versionIdentifier = [v75 longLongValue];
    }
    v55 = v109;
    v63 = v114;
  }
  v76 = [v4 objectForKey:*MEMORY[0x1E4FA8828]];
  objc_opt_class();
  v108 = v76;
  if (objc_opt_isKindOfClass())
  {
    int64_t itemKind = v115->_itemKind;
    if (itemKind == 17 || itemKind == 12)
    {
      v78 = [v76 objectForKey:*MEMORY[0x1E4FA8820]];

      if (objc_opt_respondsToSelector()) {
        v115->_numberOfUserRatings = [v78 integerValue];
      }
      v79 = (void *)MEMORY[0x1E4FA8838];
    }
    else
    {
      v78 = [v76 objectForKey:*MEMORY[0x1E4FA8818]];

      if (objc_opt_respondsToSelector()) {
        v115->_numberOfUserRatings = [v78 integerValue];
      }
      v79 = (void *)MEMORY[0x1E4FA8830];
    }
    uint64_t v80 = [v76 objectForKey:*v79];

    v110 = (void *)v80;
    v55 = v109;
    v63 = v114;
    if (objc_opt_respondsToSelector())
    {
      [v110 floatValue];
      v115->_userRating = v81;
    }
  }
  uint64_t v82 = [v4 objectForKey:@"videoPreviewByType"];
  objc_opt_class();
  v113 = (void *)v82;
  if (objc_opt_isKindOfClass())
  {
    v83 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v84 = [v83 userInterfaceIdiom];

    if (v84 == 1) {
      v85 = &unk_1F1D62030;
    }
    else {
      v85 = &unk_1F1D62048;
    }
    id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    uint64_t v112 = [v85 countByEnumeratingWithState:&v120 objects:v135 count:16];
    if (v112)
    {
      uint64_t v111 = *(void *)v121;
LABEL_142:
      uint64_t v87 = 0;
      while (1)
      {
        if (*(void *)v121 != v111) {
          objc_enumerationMutation(v85);
        }
        v88 = [v113 objectForKey:*(void *)(*((void *)&v120 + 1) + 8 * v87)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v89 = v88;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v134 = v88;
            id v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:1];
          }
          else
          {
            id v89 = 0;
          }
        }
        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        id v90 = v89;
        uint64_t v91 = [v90 countByEnumeratingWithState:&v116 objects:v133 count:16];
        if (v91)
        {
          uint64_t v92 = v91;
          uint64_t v93 = *(void *)v117;
          do
          {
            for (uint64_t k = 0; k != v92; ++k)
            {
              if (*(void *)v117 != v93) {
                objc_enumerationMutation(v90);
              }
              uint64_t v95 = *(void *)(*((void *)&v116 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v96 = [[SKUIVideo alloc] initWithVideoDictionary:v95];
                if (v96) {
                  [v86 addObject:v96];
                }
              }
            }
            uint64_t v92 = [v90 countByEnumeratingWithState:&v116 objects:v133 count:16];
          }
          while (v92);
        }

        uint64_t v97 = [v86 count];
        v63 = v114;
        v7 = v115;
        if (v97) {
          break;
        }
        if (++v87 == v112)
        {
          uint64_t v112 = [v85 countByEnumeratingWithState:&v120 objects:v135 count:16];
          if (v112) {
            goto LABEL_142;
          }
          break;
        }
      }
    }
    uint64_t v98 = [v86 copy];
    videos = v7->_videos;
    v7->_videos = (NSArray *)v98;

    id v4 = v106;
    v50 = v102;
    v53 = v103;
    v51 = v104;
    v55 = v109;
  }

LABEL_166:
  v100 = v7;

  return v100;
}

- (SKUIItem)initWithIdentifier:(id)a3 mediaResultDictionary:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIItem initWithIdentifier:mediaResultDictionary:]();
  }
  v68.receiver = self;
  v68.super_class = (Class)SKUIItem;
  uint64_t v8 = [(SKUIItem *)&v68 init];
  if (!v8) {
    goto LABEL_74;
  }
  if (objc_opt_respondsToSelector()) {
    v8->_itemIdentifier = [v6 longLongValue];
  }
  v9 = [v7 objectForKeyedSubscript:@"platformAttributes"];
  id v10 = [v9 objectForKeyedSubscript:@"ios"];

  v11 = [v7 objectForKey:@"artistName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v8->_artistName, v11);
  }
  uint64_t v12 = [v10 objectForKey:@"bundleId"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v8->_bundleID, v12);
  }
  v13 = [v7 objectForKey:@"genreDisplayName"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v8->_categoryName, v13);
  }
  uint64_t v14 = [v10 objectForKey:@"hasInAppPurchases"];

  if (objc_opt_respondsToSelector()) {
    v8->_hasInAppPurchases = [v14 BOOLValue];
  }
  v15 = [v7 objectForKey:@"url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v8->_productPageURLString, v15);
  }
  uint64_t v16 = [v10 objectForKey:@"requiredCapabilities"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = v16;
    requiredCapabilities = v8->_requiredCapabilities;
    v8->_requiredCapabilities = v17;
LABEL_31:

    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v55 = v10;
    id v56 = v7;
    id v58 = v6;
    requiredCapabilities = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v19 = [v16 componentsSeparatedByString:@" "];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v65 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if ([v24 length]) {
            [(NSArray *)requiredCapabilities addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v21);
    }
    uint64_t v25 = [(NSArray *)requiredCapabilities copy];
    id v26 = v8->_requiredCapabilities;
    v8->_requiredCapabilities = (NSArray *)v25;

    id v7 = v56;
    id v6 = v58;
    id v10 = v55;
    goto LABEL_31;
  }
LABEL_32:
  uint64_t v27 = [v7 objectForKey:@"name"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&v8->_title, v27);
  }
  uint64_t v28 = [v10 objectForKey:@"artwork"];

  uint64_t v29 = +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:v28];
  artworksProvider = v8->_artworksProvider;
  v8->_artworksProvider = (SKUIArtworkProviding *)v29;

  v31 = [v10 objectForKey:@"hasMessagesExtension"];

  if (objc_opt_respondsToSelector()) {
    v8->_hasMessagesExtension = [v31 BOOLValue];
  }
  uint64_t v32 = [v10 objectForKey:@"isHiddenFromSpringboard"];

  if (objc_opt_respondsToSelector()) {
    v8->_isHiddenFromSpringBoard = [v32 BOOLValue];
  }
  v33 = [v10 objectForKey:@"supportsGameController"];

  if (objc_opt_respondsToSelector()) {
    v8->_gameControllerSupported = [v33 BOOLValue];
  }
  v34 = [v10 objectForKey:@"requiresGameController"];

  if (objc_opt_respondsToSelector()) {
    v8->_requiresGameController = [v34 BOOLValue];
  }
  v35 = [v10 objectForKey:@"externalVersionId"];

  if (objc_opt_respondsToSelector()) {
    v8->_versionIdentifier = [v35 longLongValue];
  }
  v36 = [v10 objectForKey:@"offers"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v36 count])
  {
    uint64_t v37 = [v36 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = [[SKUIItemOffer alloc] initWithLookupDictionary:v37];
      itemOffer = v8->_itemOffer;
      v8->_itemOffer = v38;
    }
  }
  v40 = [v7 objectForKey:@"deviceFamilies"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v53 = v36;
    v54 = v35;
    id v57 = v7;
    id v59 = v6;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v52 = v40;
    id v41 = v40;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (!v42) {
      goto LABEL_67;
    }
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v61;
    while (1)
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v61 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v60 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v46 isEqualToString:@"ipad"])
          {
            uint64_t v47 = 1;
          }
          else if ([v46 isEqualToString:@"iphone"])
          {
            uint64_t v47 = 2;
          }
          else if ([v46 isEqualToString:@"ipod"])
          {
            uint64_t v47 = 4;
          }
          else
          {
            if (![v46 isEqualToString:@"tvos"]) {
              continue;
            }
            uint64_t v47 = 8;
          }
          v8->_deviceFamilies |= v47;
        }
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (!v43)
      {
LABEL_67:

        id v7 = v57;
        id v6 = v59;
        v35 = v54;
        v40 = v52;
        v36 = v53;
        break;
      }
    }
  }
  v48 = objc_msgSend(v7, "objectForKey:", @"userRating", v52, v53);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v49 = [v48 objectForKey:@"ratingCount"];

    if (objc_opt_respondsToSelector()) {
      v8->_numberOfUserRatings = [v49 integerValue];
    }
    v35 = [v48 objectForKey:@"value"];

    if (objc_opt_respondsToSelector())
    {
      [v35 floatValue];
      v8->_userRating = v50;
    }
  }

LABEL_74:
  return v8;
}

- (id)artworkURLForSize:(int64_t)a3
{
  return (id)[(SKUIArtworkProviding *)self->_artworksProvider artworkURLForSize:a3];
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
  v2 = [(SKUIArtworkProviding *)self->_artworksProvider largestArtwork];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

- (NSArray)loadedChildItems
{
  return 0;
}

- (SKUIStoreIdentifier)storeIdentifier
{
  storeIdentifier = self->_storeIdentifier;
  if (!storeIdentifier)
  {
    id v4 = [[SKUIStoreIdentifier alloc] initWithLongLong:[(SKUIItem *)self itemIdentifier]];
    v5 = self->_storeIdentifier;
    self->_storeIdentifier = v4;

    id v6 = [(SKUIItem *)self bundleIdentifier];
    [(SKUIStoreIdentifier *)self->_storeIdentifier setBundleIdentifier:v6];

    [(SKUIStoreIdentifier *)self->_storeIdentifier setPodcastFeedURLIdentifier:self->_feedUrlString];
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
  v64[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(SKUIItem *)self ageBandRange];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = [NSNumber numberWithUnsignedInteger:v6];
    [v8 setObject:v9 forKey:@"minAge"];

    id v10 = [NSNumber numberWithUnsignedInteger:v6 + v7];
    [v8 setObject:v10 forKey:@"maxAge"];

    [v3 setObject:v8 forKey:@"ageBand"];
  }
  v11 = [(SKUIItem *)self artistName];
  if (v11) {
    [v3 setObject:v11 forKey:*MEMORY[0x1E4FA8700]];
  }
  uint64_t v12 = [(SKUIItem *)self bundleIdentifier];

  if (v12) {
    [v3 setObject:v12 forKey:*MEMORY[0x1E4FA8718]];
  }
  v13 = [(SKUIItem *)self categoryName];

  if (v13)
  {
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v13, 0);
    [v3 setObject:v14 forKey:*MEMORY[0x1E4FA8750]];
  }
  v15 = [(SKUIItem *)self collectionName];

  if (v15) {
    [v3 setObject:v15 forKey:@"collectionName"];
  }
  if ([(SKUIItem *)self hasInAppPurchases]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"hasInAppPurchases"];
  }
  int64_t v16 = [(SKUIItem *)self itemIdentifier];
  if (v16)
  {
    v17 = (void *)[objc_alloc(NSNumber) initWithLongLong:v16];
    [v3 setObject:v17 forKey:*MEMORY[0x1E4FA8770]];
  }
  v18 = [(SKUIItem *)self itemKindString];

  if (v18) {
    [v3 setObject:v18 forKey:*MEMORY[0x1E4FA8778]];
  }
  uint64_t v19 = [(SKUIItem *)self primaryItemOffer];
  uint64_t v20 = v19;
  if (v19)
  {
    uint64_t v21 = [v19 lookupDictionary];
    v64[0] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
    [v3 setObject:v22 forKey:*MEMORY[0x1E4FA8790]];
  }
  uint64_t v23 = [(SKUIItem *)self numberOfChildItems];
  if (v23 >= 1)
  {
    v24 = [NSNumber numberWithInteger:v23];
    [v3 setObject:v24 forKey:@"appCount"];
  }
  int64_t v25 = [(SKUIItem *)self parentalControlsRank];
  if (v25)
  {
    long long v62 = @"value";
    id v26 = [NSNumber numberWithInteger:v25];
    long long v63 = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    [v3 setObject:v27 forKey:*MEMORY[0x1E4FA8720]];
  }
  uint64_t v28 = [(SKUIItem *)self productPageURLString];

  if (v28) {
    [v3 setObject:v28 forKey:*MEMORY[0x1E4FA87A0]];
  }
  uint64_t v29 = [(SKUIItem *)self requiredCapabilities];

  if (v29) {
    [v3 setObject:v29 forKey:*MEMORY[0x1E4FA87B0]];
  }
  v30 = [(SKUIItem *)self title];

  if (v30) {
    [v3 setObject:v30 forKey:*MEMORY[0x1E4FA8748]];
  }
  int64_t v31 = [(SKUIItem *)self versionIdentifier];
  if (v31)
  {
    uint64_t v32 = [NSNumber numberWithLongLong:v31];
    [v3 setObject:v32 forKey:@"versionId"];
  }
  v33 = [(SKUIItem *)self versionString];

  if (v33) {
    [v3 setObject:v33 forKey:@"version"];
  }
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v35 = [(SKUIItem *)self deviceFamilies];
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
    uint64_t v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v34, @"deviceFamilies", 0);
    [v3 setObject:v37 forKey:*MEMORY[0x1E4FA87F0]];
  }
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int64_t v39 = [(SKUIItem *)self itemKind];
  v40 = (void *)MEMORY[0x1E4FA8830];
  id v41 = (void *)MEMORY[0x1E4FA8818];
  if (v39 == 17)
  {
    id v41 = (void *)MEMORY[0x1E4FA8820];
    v40 = (void *)MEMORY[0x1E4FA8838];
  }
  if (v39 == 12) {
    uint64_t v42 = (void *)MEMORY[0x1E4FA8820];
  }
  else {
    uint64_t v42 = v41;
  }
  if (v39 == 12) {
    uint64_t v43 = (void *)MEMORY[0x1E4FA8838];
  }
  else {
    uint64_t v43 = v40;
  }
  uint64_t v44 = objc_msgSend(NSNumber, "numberWithInteger:", -[SKUIItem numberOfUserRatings](self, "numberOfUserRatings"));
  [v38 setObject:v44 forKey:*v42];

  v45 = NSNumber;
  [(SKUIItem *)self userRating];
  v46 = objc_msgSend(v45, "numberWithFloat:");
  [v38 setObject:v46 forKey:*v43];

  [v3 setObject:v38 forKey:*MEMORY[0x1E4FA8828]];
  uint64_t v47 = [(SKUIItem *)self artworksProvider];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v49 = [(SKUIItem *)self artworksProvider];
  float v50 = v49;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v53 = objc_opt_isKindOfClass();

    if ((v53 & 1) == 0) {
      goto LABEL_58;
    }
    float v50 = [(SKUIItem *)self artworksProvider];
    uint64_t v52 = [v50 _lookupArray];
    if (![v52 count]) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  v51 = [v49 urlTemplateString];

  if (v51)
  {
    uint64_t v52 = [v50 _lookupDictionary];
LABEL_55:
    [v3 setObject:v52 forKey:*MEMORY[0x1E4FA8710]];
LABEL_56:
  }
LABEL_58:
  v54 = [(SKUIItem *)self newsstandArtworks];
  objc_opt_class();
  char v55 = objc_opt_isKindOfClass();

  id v56 = [(SKUIItem *)self newsstandArtworks];
  id v57 = v56;
  if ((v55 & 1) == 0)
  {
    objc_opt_class();
    char v60 = objc_opt_isKindOfClass();

    if ((v60 & 1) == 0) {
      goto LABEL_66;
    }
    id v57 = [(SKUIItem *)self newsstandArtworks];
    id v59 = [v57 _lookupArray];
    if (![v59 count]) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  id v58 = [v56 urlTemplateString];

  if (v58)
  {
    id v59 = [v57 _lookupDictionary];
LABEL_63:
    [v3 setObject:v59 forKey:*MEMORY[0x1E4FA8788]];
LABEL_64:
  }
LABEL_66:

  return v3;
}

- (NSString)_downloadKind
{
  unint64_t v2 = [(SKUIItem *)self itemKind];
  if (v2 <= 0x12) {
    id v3 = **((id **)&unk_1E6423F58 + v2);
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
    BOOL v6 = v7 == [(SKUIItem *)self itemIdentifier];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (SKUIItem)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v58.receiver = self;
    v58.super_class = (Class)SKUIItem;
    uint64_t v5 = [(SKUIItem *)&v58 init];
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
        uint64_t v21 = [[SKUIItemOffer alloc] initWithCacheRepresentation:v20];
        itemOffer = v5->_itemOffer;
        v5->_itemOffer = v21;
      }
      uint64_t v23 = [v4 objectForKey:@"child_count"];

      if (objc_opt_respondsToSelector()) {
        v5->_numberOfChildItems = [v23 integerValue];
      }
      v24 = [v4 objectForKey:@"user_rating_count"];

      if (objc_opt_respondsToSelector()) {
        v5->_numberOfUserRatings = [v24 integerValue];
      }
      int64_t v25 = [v4 objectForKey:@"parental_rank"];

      if (objc_opt_respondsToSelector()) {
        v5->_parentalControlsRanuint64_t k = [v25 integerValue];
      }
      id v26 = [v4 objectForKey:@"url"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v27 = [v26 copy];
        productPageURLString = v5->_productPageURLString;
        v5->_productPageURLString = (NSString *)v27;
      }
      uint64_t v29 = [v4 objectForKey:@"req_caps"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v30 = [v29 copy];
        requiredCapabilities = v5->_requiredCapabilities;
        v5->_requiredCapabilities = (NSArray *)v30;
      }
      uint64_t v32 = [v4 objectForKey:@"name"];

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
      id v41 = [v4 objectForKey:@"kind"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v42 = [v41 copy];
        itemKindString = v5->_itemKindString;
        v5->_itemKindString = (NSString *)v42;

        uint64_t v44 = 0;
        v45 = v5->_itemKindString;
        while (![(id)qword_1E6423DC8[v44 + 1] isEqualToString:v45])
        {
          v44 += 2;
          if (v44 == 50)
          {
            uint64_t v46 = 0;
            goto LABEL_43;
          }
        }
        uint64_t v46 = qword_1E6423DC8[v44];
LABEL_43:
        v5->_int64_t itemKind = v46;
      }
      else
      {
        uint64_t v47 = v5->_itemKindString;
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
          float v50 = SKUIArtworkTemplate;
        }
        else
        {
          float v50 = SKUIArtworkList;
        }
        uint64_t v51 = [[v50 alloc] initWithCacheRepresentation:v48];
        artworksProvider = v5->_artworksProvider;
        v5->_artworksProvider = (SKUIArtworkProviding *)v51;
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
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
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
  uint64_t v23 = [(SKUIItemOffer *)self->_itemOffer cacheRepresentation];
  if (v23) {
    [v3 setObject:v23 forKey:@"offer"];
  }
  v24 = [(SKUIArtworkProviding *)self->_artworksProvider cacheRepresentation];
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
  if ([v4 isEqualToString:*MEMORY[0x1E4FA8890]])
  {
    uint64_t v5 = [NSNumber numberWithLongLong:self->_itemIdentifier];
LABEL_6:
    BOOL v6 = (void *)v5;
    goto LABEL_7;
  }
  if (([v4 isEqualToString:*MEMORY[0x1E4FA88A8]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x1E4FA88A0]])
  {
    uint64_t v5 = [(SKUIItem *)self title];
    goto LABEL_6;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA88B0]])
  {
    uint64_t v5 = [(SKUIItem *)self itemKindString];
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

- (SKUIItemOffer)primaryItemOffer
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

- (SKUIArtworkProviding)artworksProvider
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

- (SKUIArtworkProviding)newsstandArtworks
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

- (void)initContainerItemWithItem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIItem initContainerItemWithItem:]";
}

- (void)initWithLookupDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIItem initWithLookupDictionary:]";
}

- (void)initWithIdentifier:mediaResultDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIItem initWithIdentifier:mediaResultDictionary:]";
}

@end