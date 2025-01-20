@interface SUUIProductPageItem
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
- (SUUIDeveloperInfo)developerInfo;
- (SUUIItemContentRating)contentRating;
- (SUUIProductPageItem)initWithLookupDictionary:(id)a3;
- (SUUIStoreNotes)storeNotes;
- (id)childItemForIdentifier:(id)a3;
- (id)childItemIdentifiers;
- (id)loadedChildItems;
- (int64_t)numberOfChildItems;
- (int64_t)supportedFeatures;
- (unint64_t)supportedGameCenterFeatures;
- (void)_setInAppPurchases:(id)a3;
- (void)_setVersionHistory:(id)a3;
@end

@implementation SUUIProductPageItem

- (SUUIProductPageItem)initWithLookupDictionary:(id)a3
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v133.receiver = self;
  v133.super_class = (Class)SUUIProductPageItem;
  v5 = [(SUUIItem *)&v133 initWithLookupDictionary:v4];

  if (!v5) {
    goto LABEL_111;
  }
  v6 = [v4 objectForKey:*MEMORY[0x263F7B9E0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [objc_alloc(NSURL) initWithString:v6];
    artistPageURL = v5->_artistPageURL;
    v5->_artistPageURL = (NSURL *)v7;
  }
  v9 = [v4 objectForKey:*MEMORY[0x263F7BA08]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v9 copy];
    copyrightString = v5->_copyrightString;
    v5->_copyrightString = (NSString *)v10;
  }
  v12 = [v4 objectForKey:@"regularPriceFormatted"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v12 copy];
    regularPriceString = v5->_regularPriceString;
    v5->_regularPriceString = (NSString *)v13;
  }
  v15 = [v4 objectForKey:*MEMORY[0x263F7BA78]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = objc_alloc_init(MEMORY[0x263F08790]);
    [v16 setDateFormat:@"yyyy-MM-dd"];
    v17 = [v16 dateFromString:v15];
    if (v17)
    {
      [v16 setDateFormat:0];
      [v16 setDateStyle:2];
      [v16 setTimeStyle:0];
      uint64_t v18 = [v16 stringFromDate:v17];
    }
    else
    {
      uint64_t v18 = [v15 copy];
    }
    lastUpdateDateString = v5->_lastUpdateDateString;
    v5->_lastUpdateDateString = (NSString *)v18;
  }
  v20 = [v4 objectForKey:*MEMORY[0x263F7BAB8]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = [v20 copy];
    shortenedProductPageURLString = v5->_shortenedProductPageURLString;
    v5->_shortenedProductPageURLString = (NSString *)v21;
  }
  v23 = [v4 objectForKey:@"childrenIds"];
  objc_opt_class();
  v117 = v23;
  id v115 = v4;
  v119 = v5;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = [v23 copy];
    childItemIdentifiers = v5->_childItemIdentifiers;
    v5->_childItemIdentifiers = (NSArray *)v24;

    v26 = [v4 objectForKey:@"children"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v112 = v20;
      v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      loadedChildItems = v5->_loadedChildItems;
      v5->_loadedChildItems = v27;

      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      v29 = v5->_childItemIdentifiers;
      uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v129 objects:v136 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v130;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v130 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v129 + 1) + 8 * i);
            v35 = [v34 stringValue];
            v36 = [v26 objectForKey:v35];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v37 = [[SUUIItem alloc] initWithLookupDictionary:v36];
              if (v37) {
                [(NSMutableDictionary *)v5->_loadedChildItems setObject:v37 forKey:v34];
              }
            }
          }
          uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v129 objects:v136 count:16];
        }
        while (v31);
      }

      v20 = v112;
      id v4 = v115;
    }
  }
  v38 = [v4 objectForKey:@"appBundleAdamIds"];
  objc_opt_class();
  v116 = v38;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v39 = [v38 copy];
    parentBundleItemIdentifiers = v5->_parentBundleItemIdentifiers;
    v5->_parentBundleItemIdentifiers = (NSArray *)v39;
  }
  v41 = [v4 objectForKey:@"contentRatingsBySystem"];
  objc_opt_class();
  v120 = v41;
  if (objc_opt_isKindOfClass())
  {
    v113 = v20;
    v42 = [v41 keyEnumerator];
    v118 = (SUUIItemContentRating *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v43 = v42;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v125 objects:v135 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v126;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v126 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(void **)(*((void *)&v125 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v49 = [v48 isEqualToString:@"appsApple"];
            v50 = [SUUIItemContentRating alloc];
            v51 = [v120 objectForKey:v48];
            v52 = (void *)[v48 copy];
            uint64_t v53 = [(SUUIItemContentRating *)v50 initWithContentRatingDictionary:v51 systemName:v52];
            v54 = (void *)v53;
            if (v49)
            {
              contentRating = v119->_contentRating;
              v119->_contentRating = (SUUIItemContentRating *)v53;

              v54 = v51;
            }
            else
            {

              [(SUUIItemContentRating *)v118 addObject:v54];
            }
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v125 objects:v135 count:16];
      }
      while (v45);
    }

    v56 = v118;
    uint64_t v57 = [MEMORY[0x263EFF8C0] arrayWithArray:v118];
    v5 = v119;
    secondaryContentRatings = v119->_secondaryContentRatings;
    v119->_secondaryContentRatings = (NSArray *)v57;

    v20 = v113;
    id v4 = v115;
    goto LABEL_48;
  }
  id v43 = [v4 objectForKey:*MEMORY[0x263F7B9F8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v59 = [[SUUIItemContentRating alloc] initWithContentRatingDictionary:v43 systemName:@"appsApple"];
    v56 = v5->_contentRating;
    v5->_contentRating = v59;
LABEL_48:
  }
  v60 = [v4 objectForKey:*MEMORY[0x263F7BA10]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v61 = [v60 objectForKey:*MEMORY[0x263F7BA18]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v62 = [v61 copy];
      itemDescription = v5->_itemDescription;
      v5->_itemDescription = (NSString *)v62;
    }
  }
  else
  {
    v61 = v20;
  }
  v64 = [v4 objectForKey:*MEMORY[0x263F7BAC0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v65 = [v64 objectForKey:*MEMORY[0x263F7BA38]];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v65 BOOLValue]) {
      v5->_supportedFeatures |= 1uLL;
    }
    v66 = [v64 objectForKey:*MEMORY[0x263F7BA50]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v67 = [v66 copy];
      licenseAgreementURLString = v5->_licenseAgreementURLString;
      v5->_licenseAgreementURLString = (NSString *)v67;
    }
    v69 = [v64 objectForKey:*MEMORY[0x263F7BA68]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v70 = [v69 copy];
      privacyPolicyURLString = v5->_privacyPolicyURLString;
      v5->_privacyPolicyURLString = (NSString *)v70;
    }
    v72 = [v64 objectForKey:*MEMORY[0x263F7BA88]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v73 = [v72 copy];
      installationRequirementsDescription = v5->_installationRequirementsDescription;
      v5->_installationRequirementsDescription = (NSString *)v73;
    }
    v75 = [v64 objectForKey:*MEMORY[0x263F7BAD8]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v76 = [v75 copy];
      supportURLString = v5->_supportURLString;
      v5->_supportURLString = (NSString *)v76;
    }
    v78 = [v64 objectForKey:*MEMORY[0x263F7BA30]];

    if (objc_opt_respondsToSelector()) {
      -[SUUIItem _setHasInAppPurchases:](v5, "_setHasInAppPurchases:", [v78 BOOLValue]);
    }
    v79 = [v64 objectForKey:@"developerInfo"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v80 = [[SUUIDeveloperInfo alloc] initWithDeveloperDictionary:v79];
      developerInfo = v5->_developerInfo;
      v5->_developerInfo = v80;

      v82 = v5->_developerInfo;
      v83 = [(SUUIItem *)v5 artistName];
      [(SUUIDeveloperInfo *)v82 setTradeName:v83];
    }
    v61 = [v64 objectForKey:@"seller"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v84 = [v61 copy];
      sellerName = v5->_sellerName;
      v5->_sellerName = (NSString *)v84;
    }
  }
  v86 = [v4 objectForKey:@"supportsPassbook"];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v86 BOOLValue]) {
    v5->_supportedFeatures |= 4uLL;
  }
  if ([(SUUIItem *)v5 isNewsstandApp]) {
    v5->_supportedFeatures |= 8uLL;
  }
  v87 = [v4 objectForKey:@"gameCenterInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v88 = [v87 objectForKey:@"hasLiveAchievements"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v88 BOOLValue]) {
      v5->_supportedGameCenterFeatures |= 2uLL;
    }
    v89 = v87;
    v90 = [v87 objectForKey:@"hasLiveLeaderboards"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v90 BOOLValue]) {
      v5->_supportedGameCenterFeatures |= 4uLL;
    }
    v91 = [v89 objectForKey:@"usesGameControllerAPI"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v91 BOOLValue]) {
      v5->_supportedGameCenterFeatures |= 1uLL;
    }
    v92 = [v89 objectForKey:@"usesMultiplayerAPI"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v92 BOOLValue]) {
      v5->_supportedGameCenterFeatures |= 8uLL;
    }
    v86 = [v89 objectForKey:@"usesTurnBasedAPI"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v86 BOOLValue]) {
      v5->_supportedGameCenterFeatures |= 0x10uLL;
    }
    v87 = v89;
  }
  v93 = [v4 objectForKey:*MEMORY[0x263F7BAD0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v94 = objc_alloc_init(SUUIStoreNotes);
    storeNotes = v5->_storeNotes;
    v5->_storeNotes = v94;

    v96 = [v93 objectForKey:*MEMORY[0x263F7BAC8]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUUIStoreNotes *)v5->_storeNotes setStandardNotes:v96];
    }
  }
  else
  {
    v96 = v86;
  }
  uint64_t v97 = SUUIItemScreenshotsForDictionary(v4);
  screenshots = v5->_screenshots;
  v5->_screenshots = (NSArray *)v97;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v111 = v87;
    v114 = v64;
    id v99 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v100 = v96;
    uint64_t v101 = [v100 countByEnumeratingWithState:&v121 objects:v134 count:16];
    if (v101)
    {
      uint64_t v102 = v101;
      uint64_t v103 = *(void *)v122;
      do
      {
        for (uint64_t k = 0; k != v102; ++k)
        {
          if (*(void *)v122 != v103) {
            objc_enumerationMutation(v100);
          }
          uint64_t v105 = *(void *)(*((void *)&v121 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v106 = [[SUUIScreenshot alloc] initWithScreenshotDictionary:v105];
            if (v106) {
              [v99 addObject:v106];
            }
          }
        }
        uint64_t v102 = [v100 countByEnumeratingWithState:&v121 objects:v134 count:16];
      }
      while (v102);
    }

    uint64_t v107 = [v99 copy];
    v5 = v119;
    v108 = v119->_screenshots;
    v119->_screenshots = (NSArray *)v107;

    v64 = v114;
    id v4 = v115;
    v87 = v111;
  }

LABEL_111:
  v109 = v5;

  return v109;
}

- (id)childItemForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_loadedChildItems objectForKey:a3];
}

- (id)loadedChildItems
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
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
        v9 = -[NSMutableDictionary objectForKey:](self->_loadedChildItems, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
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
    v4.super_class = (Class)SUUIProductPageItem;
    return [(SUUIItem *)&v4 numberOfChildItems];
  }
}

- (void)_setVersionHistory:(id)a3
{
  id v13 = a3;
  if ([v13 count])
  {
    uint64_t v5 = (NSString *)objc_alloc_init(MEMORY[0x263F08790]);
    [(NSString *)v5 setDateStyle:2];
    [(NSString *)v5 setTimeStyle:0];
    uint64_t v6 = [v13 objectAtIndex:0];
    uint64_t v7 = [v6 date];
    v8 = [(NSString *)v5 stringFromDate:v7];
    lastUpdateDateString = self->_lastUpdateDateString;
    self->_lastUpdateDateString = v8;

    objc_storeStrong((id *)&self->_releaseNotes, a3);
    uint64_t v10 = [v6 changeNotes];
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

- (SUUIItemContentRating)contentRating
{
  return self->_contentRating;
}

- (NSString)copyrightString
{
  return self->_copyrightString;
}

- (SUUIDeveloperInfo)developerInfo
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

- (SUUIStoreNotes)storeNotes
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

@end