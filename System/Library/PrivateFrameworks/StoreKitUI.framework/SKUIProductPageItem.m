@interface SKUIProductPageItem
- (NSArray)inAppPurchases;
- (NSArray)parentBundleItemIdentifiers;
- (NSArray)releaseNotes;
- (NSArray)screenshots;
- (NSArray)secondaryContentRatings;
- (NSString)copyrightString;
- (NSString)installationRequirementsDescription;
- (NSString)itemDescription;
- (NSString)lastUpdateDateString;
- (NSString)licenseAgreementURLString;
- (NSString)privacyPolicyURLString;
- (NSString)regularPriceString;
- (NSString)reviewsURLString;
- (NSString)sellerName;
- (NSString)shortenedProductPageURLString;
- (NSString)supportURLString;
- (NSString)updateDescription;
- (NSURL)artistPageURL;
- (SKUIDeveloperInfo)developerInfo;
- (SKUIItemContentRating)contentRating;
- (SKUIProductPageItem)initWithIdentifier:(id)a3 mediaResult:(id)a4;
- (SKUIProductPageItem)initWithLookupDictionary:(id)a3;
- (SKUIStoreNotes)storeNotes;
- (id)childItemForIdentifier:(id)a3;
- (id)childItemIdentifiers;
- (id)loadedChildItems;
- (int64_t)numberOfChildItems;
- (int64_t)supportedFeatures;
- (unint64_t)supportedGameCenterFeatures;
- (void)_setInAppPurchases:(id)a3;
- (void)_setVersionHistory:(id)a3;
@end

@implementation SKUIProductPageItem

- (SKUIProductPageItem)initWithIdentifier:(id)a3 mediaResult:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIProductPageItem initWithIdentifier:mediaResult:]();
  }
  v8 = [v7 responseDataItems];
  v9 = [v8 firstObject];
  v10 = [v9 objectForKeyedSubscript:@"attributes"];

  if (!v10)
  {
    v11 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v58.receiver = self;
  v58.super_class = (Class)SKUIProductPageItem;
  v11 = [(SKUIItem *)&v58 initWithIdentifier:v6 mediaResultDictionary:v10];
  if (v11)
  {
    v12 = [v10 objectForKeyedSubscript:@"platformAttributes"];
    self = [v12 objectForKeyedSubscript:@"ios"];

    v13 = [(SKUIProductPageItem *)self objectForKey:@"copyright"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v13 copy];
      copyrightString = v11->_copyrightString;
      v11->_copyrightString = (NSString *)v14;
    }
    v16 = [(SKUIProductPageItem *)self objectForKey:@"releaseDate"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v17 setDateFormat:@"yyyy-MM-dd"];
      v18 = [v17 dateFromString:v16];
      [v17 setDateFormat:0];
      [v17 setDateStyle:2];
      [v17 setTimeStyle:0];
      uint64_t v19 = [v17 stringFromDate:v18];
      lastUpdateDateString = v11->_lastUpdateDateString;
      v11->_lastUpdateDateString = (NSString *)v19;
    }
    v21 = [v10 objectForKey:@"url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [v21 copy];
      shortenedProductPageURLString = v11->_shortenedProductPageURLString;
      v11->_shortenedProductPageURLString = (NSString *)v22;
    }
    v24 = [v10 objectForKey:@"contentRatingsBySystem"];
    objc_opt_class();
    v53 = v24;
    if (objc_opt_isKindOfClass())
    {
      v47 = v21;
      v48 = v10;
      v49 = self;
      id v50 = v7;
      id v51 = v6;
      v25 = [v24 keyEnumerator];
      id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v26 = v25;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v55 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              char v32 = [v31 isEqualToString:@"appsApple"];
              v33 = [SKUIItemContentRating alloc];
              v34 = [v53 objectForKey:v31];
              v35 = (void *)[v31 copy];
              uint64_t v36 = [(SKUIItemContentRating *)v33 initWithContentRatingDictionary:v34 systemName:v35];
              v37 = (void *)v36;
              if (v32)
              {
                contentRating = v11->_contentRating;
                v11->_contentRating = (SKUIItemContentRating *)v36;

                v37 = v34;
              }
              else
              {

                [v52 addObject:v37];
              }
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v54 objects:v59 count:16];
        }
        while (v28);
      }

      uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithArray:v52];
      secondaryContentRatings = v11->_secondaryContentRatings;
      v11->_secondaryContentRatings = (NSArray *)v39;

      id v7 = v50;
      id v6 = v51;
      v10 = v48;
      self = v49;
      v21 = v47;
    }
    v41 = [(SKUIProductPageItem *)self objectForKey:@"editorialNotes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = objc_alloc_init(SKUIStoreNotes);
      storeNotes = v11->_storeNotes;
      v11->_storeNotes = v42;

      uint64_t v44 = [v41 objectForKey:@"tagline"];
      v45 = v21;
      v21 = (void *)v44;

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SKUIStoreNotes *)v11->_storeNotes setStandardNotes:v21];
      }
    }

    goto LABEL_32;
  }
LABEL_33:

  return v11;
}

- (SKUIProductPageItem)initWithLookupDictionary:(id)a3
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[SKUIProductPageItem initWithLookupDictionary:]();
    }
  }
  v135.receiver = self;
  v135.super_class = (Class)SKUIProductPageItem;
  id v7 = [(SKUIItem *)&v135 initWithLookupDictionary:v4];

  if (v7)
  {
    v8 = [v4 objectForKey:*MEMORY[0x1E4FA8708]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v8];
      artistPageURL = v7->_artistPageURL;
      v7->_artistPageURL = (NSURL *)v9;
    }
    v11 = [v4 objectForKey:*MEMORY[0x1E4FA8730]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v11 copy];
      copyrightString = v7->_copyrightString;
      v7->_copyrightString = (NSString *)v12;
    }
    uint64_t v14 = [v4 objectForKey:@"regularPriceFormatted"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 copy];
      regularPriceString = v7->_regularPriceString;
      v7->_regularPriceString = (NSString *)v15;
    }
    id v17 = [v4 objectForKey:*MEMORY[0x1E4FA87A8]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v18 setDateFormat:@"yyyy-MM-dd"];
      uint64_t v19 = [v18 dateFromString:v17];
      if (v19)
      {
        [v18 setDateFormat:0];
        [v18 setDateStyle:2];
        [v18 setTimeStyle:0];
        uint64_t v20 = [v18 stringFromDate:v19];
      }
      else
      {
        uint64_t v20 = [v17 copy];
      }
      lastUpdateDateString = v7->_lastUpdateDateString;
      v7->_lastUpdateDateString = (NSString *)v20;
    }
    uint64_t v22 = [v4 objectForKey:*MEMORY[0x1E4FA87E8]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v23 = [v22 copy];
      shortenedProductPageURLString = v7->_shortenedProductPageURLString;
      v7->_shortenedProductPageURLString = (NSString *)v23;
    }
    v25 = [v4 objectForKey:@"childrenIds"];
    objc_opt_class();
    v119 = v25;
    id v117 = v4;
    v121 = v7;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v26 = [v25 copy];
      childItemIdentifiers = v7->_childItemIdentifiers;
      v7->_childItemIdentifiers = (NSArray *)v26;

      uint64_t v28 = [v4 objectForKey:@"children"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v114 = v22;
        uint64_t v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        loadedChildItems = v7->_loadedChildItems;
        v7->_loadedChildItems = v29;

        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        v31 = v7->_childItemIdentifiers;
        uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v131 objects:v138 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v132;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v132 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void **)(*((void *)&v131 + 1) + 8 * i);
              v37 = [v36 stringValue];
              v38 = [v28 objectForKey:v37];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v39 = [[SKUIItem alloc] initWithLookupDictionary:v38];
                if (v39) {
                  [(NSMutableDictionary *)v7->_loadedChildItems setObject:v39 forKey:v36];
                }
              }
            }
            uint64_t v33 = [(NSArray *)v31 countByEnumeratingWithState:&v131 objects:v138 count:16];
          }
          while (v33);
        }

        uint64_t v22 = v114;
        id v4 = v117;
      }
    }
    v40 = [v4 objectForKey:@"appBundleAdamIds"];
    objc_opt_class();
    v118 = v40;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v41 = [v40 copy];
      parentBundleItemIdentifiers = v7->_parentBundleItemIdentifiers;
      v7->_parentBundleItemIdentifiers = (NSArray *)v41;
    }
    v43 = [v4 objectForKey:@"contentRatingsBySystem"];
    objc_opt_class();
    v122 = v43;
    if (objc_opt_isKindOfClass())
    {
      v115 = v22;
      uint64_t v44 = [v43 keyEnumerator];
      v120 = (SKUIItemContentRating *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v127 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      id v45 = v44;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v127 objects:v137 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v128;
        do
        {
          for (uint64_t j = 0; j != v47; ++j)
          {
            if (*(void *)v128 != v48) {
              objc_enumerationMutation(v45);
            }
            id v50 = *(void **)(*((void *)&v127 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              char v51 = [v50 isEqualToString:@"appsApple"];
              id v52 = [SKUIItemContentRating alloc];
              v53 = [v122 objectForKey:v50];
              long long v54 = (void *)[v50 copy];
              uint64_t v55 = [(SKUIItemContentRating *)v52 initWithContentRatingDictionary:v53 systemName:v54];
              long long v56 = (void *)v55;
              if (v51)
              {
                contentRating = v121->_contentRating;
                v121->_contentRating = (SKUIItemContentRating *)v55;

                long long v56 = v53;
              }
              else
              {

                [(SKUIItemContentRating *)v120 addObject:v56];
              }
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v127 objects:v137 count:16];
        }
        while (v47);
      }

      objc_super v58 = v120;
      uint64_t v59 = [MEMORY[0x1E4F1C978] arrayWithArray:v120];
      id v7 = v121;
      secondaryContentRatings = v121->_secondaryContentRatings;
      v121->_secondaryContentRatings = (NSArray *)v59;

      uint64_t v22 = v115;
      id v4 = v117;
    }
    else
    {
      id v45 = [v4 objectForKey:*MEMORY[0x1E4FA8720]];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_54:

        v62 = [v4 objectForKey:*MEMORY[0x1E4FA8738]];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v63 = [v62 objectForKey:*MEMORY[0x1E4FA8740]];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v64 = [v63 copy];
            itemDescription = v7->_itemDescription;
            v7->_itemDescription = (NSString *)v64;
          }
        }
        else
        {
          v63 = v22;
        }
        v66 = [v4 objectForKey:*MEMORY[0x1E4FA87F0]];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v67 = [v66 objectForKey:*MEMORY[0x1E4FA8768]];

          if ((objc_opt_respondsToSelector() & 1) != 0 && [v67 BOOLValue]) {
            v7->_supportedFeatures |= 1uLL;
          }
          v68 = [v66 objectForKey:*MEMORY[0x1E4FA8780]];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v69 = [v68 copy];
            licenseAgreementURLString = v7->_licenseAgreementURLString;
            v7->_licenseAgreementURLString = (NSString *)v69;
          }
          v71 = [v66 objectForKey:*MEMORY[0x1E4FA8798]];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v72 = [v71 copy];
            privacyPolicyURLString = v7->_privacyPolicyURLString;
            v7->_privacyPolicyURLString = (NSString *)v72;
          }
          v74 = [v66 objectForKey:*MEMORY[0x1E4FA87B8]];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v75 = [v74 copy];
            installationRequirementsDescription = v7->_installationRequirementsDescription;
            v7->_installationRequirementsDescription = (NSString *)v75;
          }
          v77 = [v66 objectForKey:*MEMORY[0x1E4FA8810]];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v78 = [v77 copy];
            supportURLString = v7->_supportURLString;
            v7->_supportURLString = (NSString *)v78;
          }
          v80 = [v66 objectForKey:*MEMORY[0x1E4FA8758]];

          if (objc_opt_respondsToSelector()) {
            -[SKUIItem _setHasInAppPurchases:](v7, "_setHasInAppPurchases:", [v80 BOOLValue]);
          }
          v81 = [v66 objectForKey:@"developerInfo"];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v82 = [[SKUIDeveloperInfo alloc] initWithDeveloperDictionary:v81];
            developerInfo = v7->_developerInfo;
            v7->_developerInfo = v82;

            v84 = v7->_developerInfo;
            v85 = [(SKUIItem *)v7 artistName];
            [(SKUIDeveloperInfo *)v84 setTradeName:v85];
          }
          v63 = [v66 objectForKey:@"seller"];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v86 = [v63 copy];
            sellerName = v7->_sellerName;
            v7->_sellerName = (NSString *)v86;
          }
        }
        v88 = [v4 objectForKey:@"supportsPassbook"];

        if ((objc_opt_respondsToSelector() & 1) != 0 && [v88 BOOLValue]) {
          v7->_supportedFeatures |= 4uLL;
        }
        if ([(SKUIItem *)v7 isNewsstandApp]) {
          v7->_supportedFeatures |= 8uLL;
        }
        v89 = [v4 objectForKey:@"gameCenterInfo"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v90 = [v89 objectForKey:@"hasLiveAchievements"];

          if ((objc_opt_respondsToSelector() & 1) != 0 && [v90 BOOLValue]) {
            v7->_supportedGameCenterFeatures |= 2uLL;
          }
          v91 = v89;
          v92 = [v89 objectForKey:@"hasLiveLeaderboards"];

          if ((objc_opt_respondsToSelector() & 1) != 0 && [v92 BOOLValue]) {
            v7->_supportedGameCenterFeatures |= 4uLL;
          }
          v93 = [v91 objectForKey:@"usesGameControllerAPI"];

          if ((objc_opt_respondsToSelector() & 1) != 0 && [v93 BOOLValue]) {
            v7->_supportedGameCenterFeatures |= 1uLL;
          }
          v94 = [v91 objectForKey:@"usesMultiplayerAPI"];

          if ((objc_opt_respondsToSelector() & 1) != 0 && [v94 BOOLValue]) {
            v7->_supportedGameCenterFeatures |= 8uLL;
          }
          v88 = [v91 objectForKey:@"usesTurnBasedAPI"];

          if ((objc_opt_respondsToSelector() & 1) != 0 && [v88 BOOLValue]) {
            v7->_supportedGameCenterFeatures |= 0x10uLL;
          }
          v89 = v91;
        }
        v95 = [v4 objectForKey:*MEMORY[0x1E4FA8808]];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v96 = objc_alloc_init(SKUIStoreNotes);
          storeNotes = v7->_storeNotes;
          v7->_storeNotes = v96;

          v98 = [v95 objectForKey:*MEMORY[0x1E4FA87F8]];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(SKUIStoreNotes *)v7->_storeNotes setStandardNotes:v98];
          }
        }
        else
        {
          v98 = v88;
        }
        uint64_t v99 = SKUIItemScreenshotsForDictionary(v4);
        screenshots = v7->_screenshots;
        v7->_screenshots = (NSArray *)v99;

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v113 = v89;
          v116 = v66;
          id v101 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v123 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          id v102 = v98;
          uint64_t v103 = [v102 countByEnumeratingWithState:&v123 objects:v136 count:16];
          if (v103)
          {
            uint64_t v104 = v103;
            uint64_t v105 = *(void *)v124;
            do
            {
              for (uint64_t k = 0; k != v104; ++k)
              {
                if (*(void *)v124 != v105) {
                  objc_enumerationMutation(v102);
                }
                uint64_t v107 = *(void *)(*((void *)&v123 + 1) + 8 * k);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v108 = [[SKUIScreenshot alloc] initWithScreenshotDictionary:v107];
                  if (v108) {
                    [v101 addObject:v108];
                  }
                }
              }
              uint64_t v104 = [v102 countByEnumeratingWithState:&v123 objects:v136 count:16];
            }
            while (v104);
          }

          uint64_t v109 = [v101 copy];
          id v7 = v121;
          v110 = v121->_screenshots;
          v121->_screenshots = (NSArray *)v109;

          v66 = v116;
          id v4 = v117;
          v89 = v113;
        }

        goto LABEL_116;
      }
      v61 = [[SKUIItemContentRating alloc] initWithContentRatingDictionary:v45 systemName:@"appsApple"];
      objc_super v58 = v7->_contentRating;
      v7->_contentRating = v61;
    }

    goto LABEL_54;
  }
LABEL_116:
  v111 = v7;

  return v111;
}

- (id)childItemForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_loadedChildItems objectForKey:a3];
}

- (id)loadedChildItems
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_childItemIdentifiers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[NSMutableDictionary objectForKey:](self->_loadedChildItems, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (int64_t)numberOfChildItems
{
  if (self->_childItemIdentifiers)
  {
    childItemIdentifiers = self->_childItemIdentifiers;
    return [(NSArray *)childItemIdentifiers count];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SKUIProductPageItem;
    return [(SKUIItem *)&v4 numberOfChildItems];
  }
}

- (void)_setVersionHistory:(id)a3
{
  id v13 = a3;
  if ([v13 count])
  {
    uint64_t v5 = (NSString *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    [(NSString *)v5 setDateStyle:2];
    [(NSString *)v5 setTimeStyle:0];
    uint64_t v6 = [v13 objectAtIndex:0];
    uint64_t v7 = [v6 date];
    v8 = [(NSString *)v5 stringFromDate:v7];
    lastUpdateDateString = self->_lastUpdateDateString;
    self->_lastUpdateDateString = v8;

    objc_storeStrong((id *)&self->_releaseNotes, a3);
    v10 = [v6 changeNotes];
    updateDescription = self->_updateDescription;
    self->_updateDescription = v10;
  }
  else
  {
    releaseNotes = self->_releaseNotes;
    self->_releaseNotes = 0;

    uint64_t v5 = self->_updateDescription;
    self->_updateDescription = 0;
  }
}

- (void)_setInAppPurchases:(id)a3
{
}

- (NSURL)artistPageURL
{
  return self->_artistPageURL;
}

- (id)childItemIdentifiers
{
  return self->_childItemIdentifiers;
}

- (SKUIItemContentRating)contentRating
{
  return self->_contentRating;
}

- (NSString)copyrightString
{
  return self->_copyrightString;
}

- (SKUIDeveloperInfo)developerInfo
{
  return self->_developerInfo;
}

- (NSArray)inAppPurchases
{
  return self->_inAppPurchases;
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (NSString)lastUpdateDateString
{
  return self->_lastUpdateDateString;
}

- (NSString)licenseAgreementURLString
{
  return self->_licenseAgreementURLString;
}

- (NSArray)parentBundleItemIdentifiers
{
  return self->_parentBundleItemIdentifiers;
}

- (NSString)privacyPolicyURLString
{
  return self->_privacyPolicyURLString;
}

- (NSString)regularPriceString
{
  return self->_regularPriceString;
}

- (NSArray)releaseNotes
{
  return self->_releaseNotes;
}

- (NSString)reviewsURLString
{
  return self->_reviewsURLString;
}

- (NSArray)screenshots
{
  return self->_screenshots;
}

- (NSArray)secondaryContentRatings
{
  return self->_secondaryContentRatings;
}

- (NSString)sellerName
{
  return self->_sellerName;
}

- (NSString)shortenedProductPageURLString
{
  return self->_shortenedProductPageURLString;
}

- (SKUIStoreNotes)storeNotes
{
  return self->_storeNotes;
}

- (int64_t)supportedFeatures
{
  return self->_supportedFeatures;
}

- (unint64_t)supportedGameCenterFeatures
{
  return self->_supportedGameCenterFeatures;
}

- (NSString)supportURLString
{
  return self->_supportURLString;
}

- (NSString)updateDescription
{
  return self->_updateDescription;
}

- (NSString)installationRequirementsDescription
{
  return self->_installationRequirementsDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDescription, 0);
  objc_storeStrong((id *)&self->_supportURLString, 0);
  objc_storeStrong((id *)&self->_storeNotes, 0);
  objc_storeStrong((id *)&self->_shortenedProductPageURLString, 0);
  objc_storeStrong((id *)&self->_sellerName, 0);
  objc_storeStrong((id *)&self->_secondaryContentRatings, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_reviewsURLString, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);
  objc_storeStrong((id *)&self->_regularPriceString, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURLString, 0);
  objc_storeStrong((id *)&self->_parentBundleItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_loadedChildItems, 0);
  objc_storeStrong((id *)&self->_licenseAgreementURLString, 0);
  objc_storeStrong((id *)&self->_lastUpdateDateString, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_installationRequirementsDescription, 0);
  objc_storeStrong((id *)&self->_inAppPurchases, 0);
  objc_storeStrong((id *)&self->_developerInfo, 0);
  objc_storeStrong((id *)&self->_copyrightString, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_childItemIdentifiers, 0);

  objc_storeStrong((id *)&self->_artistPageURL, 0);
}

- (void)initWithIdentifier:mediaResult:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPageItem initWithIdentifier:mediaResult:]";
}

- (void)initWithLookupDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPageItem initWithLookupDictionary:]";
}

@end