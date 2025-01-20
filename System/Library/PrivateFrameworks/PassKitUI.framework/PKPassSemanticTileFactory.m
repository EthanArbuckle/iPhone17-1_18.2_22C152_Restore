@interface PKPassSemanticTileFactory
+ (BOOL)supportsSemanticTilesForPass:(id)a3;
+ (PKPassSemanticTileFactory)sharedInstance;
- (BOOL)_coalesceOutstandingRequestForPassUniqueID:(id)a3 contentIdentifier:(id)a4 tileUpdateBlock:(id)a5;
- (BOOL)_passSupportsMusicTileWithSemantics:(id)a3;
- (BOOL)_passSupportsWeatherTile:(id)a3;
- (id)_additionalTicketInfoTilesForPass:(id)a3;
- (id)_cacheKeyForPassUniqueID:(id)a3 contentIdentifier:(id)a4;
- (id)_cachedTileContentForPassUniqueID:(id)a3 contentIdentifier:(id)a4;
- (id)_dashboardTilesForPass:(id)a3 tileUpdateBlock:(id)a4;
- (id)_eventGuideTilesForPass:(id)a3 tileUpdateBlock:(id)a4;
- (id)_eventInformationItemsForPass:(id)a3 semantics:(id)a4;
- (id)_footerValueForTicketInfoField:(id)a3;
- (id)_generatedTicketTilesWithPass:(id)a3 context:(int64_t)a4 tileUpdateBlock:(id)a5;
- (id)_init;
- (id)_issuerActionTilesForPass:(id)a3;
- (id)analyticsTileAvailabilityForPass:(id)a3;
- (id)createTilesForPass:(id)a3 context:(int64_t)a4 tileUpdateBlock:(id)a5;
- (void)_cacheTileContent:(id)a3 forPassUniqueID:(id)a4 contentIdentifier:(id)a5;
- (void)_perfomOutstandingUpdatesForPassUniqueID:(id)a3 contentIdentifier:(id)a4 updatedTiles:(id)a5;
- (void)_reloadMapsInformationForPass:(id)a3 semantics:(id)a4 tileUpdateBlock:(id)a5;
- (void)_reloadMusicInformationForPass:(id)a3 semantics:(id)a4 tileUpdateBlock:(id)a5;
- (void)_reloadWeatherInformationForPass:(id)a3 tileUpdateBlock:(id)a4;
- (void)prewarmTileContentForPass:(id)a3 context:(int64_t)a4;
@end

@implementation PKPassSemanticTileFactory

- (id)_eventInformationItemsForPass:(id)a3 semantics:(id)a4
{
  id v4 = a4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v6 setDateStyle:0];
  [v6 setTimeStyle:1];
  [v6 setDoesRelativeDateFormatting:0];
  v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v6 setLocale:v7];

  v8 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  [v6 setCalendar:v8];

  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87688]];
  v10 = [v9 numberValue];

  if (v10)
  {
    v11 = [PKEventDetailsListViewItem alloc];
    v12 = PKLocalizedTicketingString(&cfstr_TileEventInfor.isa);
    if ([v10 BOOLValue]) {
      v13 = @"TILE_EVENT_INFORMATION_TAILGATING_ALLOWED";
    }
    else {
      v13 = @"TILE_EVENT_INFORMATION_TAILGATING_NOT_ALLOWED";
    }
    v14 = PKLocalizedTicketingString(&v13->isa);
    v15 = [(PKEventDetailsListViewItem *)v11 initWithTitle:v12 detail:v14 layoutStyle:1 axID:*MEMORY[0x1E4F85A88]];
    [v5 addObject:v15];
  }
  v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87628]];
  uint64_t v17 = [v16 dateValue];

  if (v17)
  {
    v18 = [PKEventDetailsListViewItem alloc];
    v19 = PKLocalizedTicketingString(&cfstr_TileEventInfor_2.isa);
    v20 = [v6 stringFromDate:v17];
    v21 = [(PKEventDetailsListViewItem *)v18 initWithTitle:v19 detail:v20 layoutStyle:1 axID:*MEMORY[0x1E4F854A0]];
    [v5 addObject:v21];
  }
  v67 = (void *)v17;
  v68 = v10;
  v22 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87638]];
  uint64_t v23 = [v22 dateValue];

  if (v23)
  {
    v24 = [PKEventDetailsListViewItem alloc];
    v25 = PKLocalizedTicketingString(&cfstr_TileEventInfor_3.isa);
    v26 = [v6 stringFromDate:v23];
    v27 = [(PKEventDetailsListViewItem *)v24 initWithTitle:v25 detail:v26 layoutStyle:1 axID:*MEMORY[0x1E4F855C8]];
    [v5 addObject:v27];
  }
  v28 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87648]];
  uint64_t v29 = [v28 dateValue];

  if (v29)
  {
    v30 = [PKEventDetailsListViewItem alloc];
    v31 = PKLocalizedTicketingString(&cfstr_TileEventInfor_4.isa);
    v32 = [v6 stringFromDate:v29];
    v33 = [(PKEventDetailsListViewItem *)v30 initWithTitle:v31 detail:v32 layoutStyle:1 axID:*MEMORY[0x1E4F85760]];
    [v5 addObject:v33];
  }
  v34 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F87618], v29);
  v35 = [v34 dateValue];

  if (v35)
  {
    v36 = [PKEventDetailsListViewItem alloc];
    v37 = PKLocalizedTicketingString(&cfstr_TileEventInfor_5.isa);
    v38 = [v6 stringFromDate:v35];
    v39 = [(PKEventDetailsListViewItem *)v36 initWithTitle:v37 detail:v38 layoutStyle:1 axID:*MEMORY[0x1E4F85308]];
    [v5 addObject:v39];
  }
  v66 = (void *)v23;
  v40 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87630]];
  v41 = [v40 dateValue];

  if (v41)
  {
    v42 = [PKEventDetailsListViewItem alloc];
    v43 = PKLocalizedTicketingString(&cfstr_TileEventInfor_6.isa);
    v44 = [v6 stringFromDate:v41];
    v45 = [(PKEventDetailsListViewItem *)v42 initWithTitle:v43 detail:v44 layoutStyle:1 axID:*MEMORY[0x1E4F85560]];
    [v5 addObject:v45];
  }
  v46 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87640]];
  v47 = [v46 dateValue];

  if (v47)
  {
    v48 = [PKEventDetailsListViewItem alloc];
    v49 = PKLocalizedTicketingString(&cfstr_TileEventInfor_7.isa);
    v50 = [v6 stringFromDate:v47];
    v51 = [(PKEventDetailsListViewItem *)v48 initWithTitle:v49 detail:v50 layoutStyle:1 axID:*MEMORY[0x1E4F85B68]];
    [v5 addObject:v51];
  }
  v52 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87620]];
  v53 = [v52 dateValue];

  if (v53)
  {
    v54 = [PKEventDetailsListViewItem alloc];
    v55 = PKLocalizedTicketingString(&cfstr_TileEventInfor_8.isa);
    v56 = [v6 stringFromDate:v53];
    v57 = [(PKEventDetailsListViewItem *)v54 initWithTitle:v55 detail:v56 layoutStyle:1 axID:*MEMORY[0x1E4F85B60]];
    [v5 addObject:v57];
  }
  v58 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87790]];
  v59 = [v58 stringValue];

  if (v59)
  {
    v60 = [PKEventDetailsListViewItem alloc];
    v61 = PKLocalizedTicketingString(&cfstr_TileEventInfor_9.isa);
    v62 = [(PKEventDetailsListViewItem *)v60 initWithTitle:v61 detail:v59 layoutStyle:1 axID:*MEMORY[0x1E4F854F0]];
    [v5 addObject:v62];
  }
  v63 = (void *)[v5 copy];

  return v63;
}

- (void)prewarmTileContentForPass:(id)a3 context:(int64_t)a4
{
  id v9 = a3;
  BOOL v6 = +[PKPassSemanticTileFactory supportsSemanticTilesForPass:v9];
  v7 = v9;
  if (v6)
  {
    v8 = [v9 allSemantics];
    if (a4 == 2)
    {
      [(PKPassSemanticTileFactory *)self _reloadWeatherInformationForPass:v9 tileUpdateBlock:0];
      [(PKPassSemanticTileFactory *)self _reloadMusicInformationForPass:v9 semantics:v8 tileUpdateBlock:0];
    }
    else if (a4 == 1)
    {
      [(PKPassSemanticTileFactory *)self _reloadMapsInformationForPass:v9 semantics:v8 tileUpdateBlock:0];
    }

    v7 = v9;
  }
}

+ (PKPassSemanticTileFactory)sharedInstance
{
  if (_MergedGlobals_683 != -1) {
    dispatch_once(&_MergedGlobals_683, &__block_literal_global_139);
  }
  v2 = (void *)qword_1EB545C68;

  return (PKPassSemanticTileFactory *)v2;
}

- (id)_issuerActionTilesForPass:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v3 = 0;
  while (2)
  {
    id v4 = v28;
    id v5 = v4;
    BOOL v6 = v4;
    switch(v3)
    {
      case 0uLL:
        uint64_t v7 = [v4 bagPolicyURL];
        goto LABEL_15;
      case 1uLL:
        uint64_t v7 = [v4 orderFoodURL];
        goto LABEL_15;
      case 2uLL:
        uint64_t v7 = [v4 transitInformationURL];
        goto LABEL_15;
      case 3uLL:
        uint64_t v7 = [v4 parkingInformationURL];
        goto LABEL_15;
      case 4uLL:
        uint64_t v7 = [v4 directionsInformationURL];
        goto LABEL_15;
      case 5uLL:
        uint64_t v7 = [v4 merchandiseURL];
        goto LABEL_15;
      case 6uLL:
        uint64_t v7 = [v4 accessibilityURL];
        goto LABEL_15;
      case 7uLL:
        uint64_t v7 = [v4 purchaseParkingURL];
        goto LABEL_15;
      case 8uLL:
        uint64_t v7 = [v4 partnerAddOnURL];
        goto LABEL_15;
      case 9uLL:
        uint64_t v7 = [v4 contactVenuePhoneNumber];
        goto LABEL_15;
      case 0xAuLL:
        uint64_t v7 = [v4 contactVenueEmail];
        goto LABEL_15;
      case 0xBuLL:
        uint64_t v7 = [v4 contactVenueWebsite];
LABEL_15:
        BOOL v6 = (void *)v7;

        if (!v6) {
          goto LABEL_37;
        }
        v30 = (void *)[objc_alloc(MEMORY[0x1E4F84B58]) _initWithExternalURL:v6];
        v8 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v9 = [v8 UUIDString];

        uint64_t v29 = (void *)v9;
        v10 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:0 identifier:v9 context:2];
        [v10 setPreferredStyle:1];
        v11 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:1];
        [v11 setPreferredStyle:5];
        v12 = 0;
        v13 = (void *)MEMORY[0x1E4F84920];
        if (v3 <= 0xB)
        {
          v12 = PKLocalizedTicketingString(&off_1E59D7F50[v3]->isa);
        }
        v14 = objc_msgSend(v13, "createWithContent:", v12, v27);
        [v11 setBody:v14];

        v15 = (void *)MEMORY[0x1E4F848F0];
        v16 = PKPassTileDescriptorIssuerActionSymbolForType(v3);
        uint64_t v17 = PKPassTileDescriptorIssuerActionSymbolForType(v3);
        v18 = [v17 pathExtension];
        if ([v18 isEqualToString:@"fill"])
        {
          id v19 = [v17 stringByDeletingPathExtension];
        }
        else
        {
          id v19 = v17;
        }
        v20 = v19;

        v21 = (void *)[v15 createWithSymbolName:v16 contextMenuSymbolName:v20 tintColor:5];
        [v11 setIcon:v21];

        v31[0] = v30;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
        [v11 setActions:v22];

        uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v10 childTiles:0 stateIdentifier:v29 state:v11 inProgress:0];
        v24 = v23;
        switch(v3)
        {
          case 0uLL:
            [v23 setAnalyticsIdentifier:@"bagPolicyTile"];
            v25 = (void *)MEMORY[0x1E4F85860];
            break;
          case 1uLL:
            [v23 setAnalyticsIdentifier:@"foodTile"];
            v25 = (void *)MEMORY[0x1E4F855A0];
            break;
          case 2uLL:
            [v23 setAnalyticsIdentifier:@"transitTile"];
            v25 = (void *)MEMORY[0x1E4F85B08];
            break;
          case 3uLL:
            [v23 setAnalyticsIdentifier:@"parkingTile"];
            v25 = (void *)MEMORY[0x1E4F85758];
            break;
          case 4uLL:
            [v23 setAnalyticsIdentifier:@"navigationTile"];
            v25 = (void *)MEMORY[0x1E4F85708];
            break;
          case 5uLL:
            [v23 setAnalyticsIdentifier:@"merchandiseTile"];
            v25 = (void *)MEMORY[0x1E4F856C8];
            break;
          case 6uLL:
            [v23 setAnalyticsIdentifier:@"accessibilityTile"];
            v25 = (void *)MEMORY[0x1E4F85180];
            break;
          case 7uLL:
            [v23 setAnalyticsIdentifier:@"parkingTile"];
            v25 = (void *)MEMORY[0x1E4F858B0];
            break;
          case 8uLL:
            [v23 setAnalyticsIdentifier:@"addOnTile"];
            v25 = (void *)MEMORY[0x1E4F851D8];
            break;
          case 9uLL:
            [v23 setAnalyticsIdentifier:@"venuePhoneTile"];
            v25 = (void *)MEMORY[0x1E4F85820];
            break;
          case 0xAuLL:
            [v23 setAnalyticsIdentifier:@"venueEmailTile"];
            v25 = (void *)MEMORY[0x1E4F854C8];
            break;
          case 0xBuLL:
            [v23 setAnalyticsIdentifier:@"venueWebsiteTile"];
            v25 = (void *)MEMORY[0x1E4F85B78];
            break;
          default:
            [v23 setAnalyticsIdentifier:0];
            v25 = (void *)MEMORY[0x1E4F85B28];
            break;
        }
        [v24 setAxID:*v25];
        [v27 addObject:v24];

LABEL_36:
LABEL_37:
        if (++v3 != 12) {
          continue;
        }

        return v27;
      default:
        goto LABEL_36;
    }
  }
}

void __43__PKPassSemanticTileFactory_sharedInstance__block_invoke()
{
  id v0 = [[PKPassSemanticTileFactory alloc] _init];
  v1 = (void *)qword_1EB545C68;
  qword_1EB545C68 = (uint64_t)v0;
}

- (id)_init
{
  v14.receiver = self;
  v14.super_class = (Class)PKPassSemanticTileFactory;
  v2 = [(PKPassSemanticTileFactory *)&v14 init];
  if (v2)
  {
    unint64_t v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    tileContentCache = v2->_tileContentCache;
    v2->_tileContentCache = v3;

    [(NSCache *)v2->_tileContentCache setEvictsObjectsWhenApplicationEntersBackground:0];
    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    outstandingTileUpdates = v2->_outstandingTileUpdates;
    v2->_outstandingTileUpdates = v5;

    v2->_tileUpdatesLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.passkitui.semantictilefactory", v7);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v8;

    v10 = [MEMORY[0x1E4F84D50] sharedService];
    uint64_t v11 = [v10 supportedRegionFeatureOfType:18 didFailOSVersionRequirements:0];
    featureOverrides = v2->_featureOverrides;
    v2->_featureOverrides = (PKWebServiceTicketingFeature *)v11;
  }
  return v2;
}

+ (BOOL)supportsSemanticTilesForPass:(id)a3
{
  return [a3 style] == 9;
}

- (id)createTilesForPass:(id)a3 context:(int64_t)a4 tileUpdateBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (+[PKPassSemanticTileFactory supportsSemanticTilesForPass:v8])
  {
    v10 = [(PKPassSemanticTileFactory *)self _generatedTicketTilesWithPass:v8 context:a4 tileUpdateBlock:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)analyticsTileAvailabilityForPass:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[PKPassSemanticTileFactory supportsSemanticTilesForPass:v4])
  {
    id v5 = [(PKPassSemanticTileFactory *)self createTilesForPass:v4 context:1 tileUpdateBlock:0];
    v37 = self;
    v38 = v4;
    BOOL v6 = [(PKPassSemanticTileFactory *)self createTilesForPass:v4 context:2 tileUpdateBlock:0];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    obuint64_t j = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v52 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          v13 = [v12 tiles];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v48;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v48 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = [*(id *)(*((void *)&v47 + 1) + 8 * j) analyticsIdentifier];
                [v7 safelyAddObject:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v57 count:16];
            }
            while (v15);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
      }
      while (v9);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v34 = v6;
    uint64_t v19 = [v34 countByEnumeratingWithState:&v43 objects:v56 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v36 = *(void *)v44;
      v21 = &stru_1EF1B5B50;
      uint64_t v22 = *MEMORY[0x1E4F86090];
      do
      {
        uint64_t v23 = 0;
        v24 = v21;
        do
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(v34);
          }
          v25 = *(void **)(*((void *)&v43 + 1) + 8 * v23);
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          v26 = [v25 tiles];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v55 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v40;
            do
            {
              for (uint64_t k = 0; k != v28; ++k)
              {
                if (*(void *)v40 != v29) {
                  objc_enumerationMutation(v26);
                }
                v31 = [*(id *)(*((void *)&v39 + 1) + 8 * k) analyticsIdentifier];
                [v7 safelyAddObject:v31];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v55 count:16];
            }
            while (v28);
          }

          id v4 = v38;
          v32 = [v38 allSemantics];
          if ([(PKPassSemanticTileFactory *)v37 _passSupportsMusicTileWithSemantics:v32])
          {
            [v7 addObject:@"musicTile"];
          }
          if ([(PKPassSemanticTileFactory *)v37 _passSupportsWeatherTile:v38]) {
            [v7 addObject:@"weatherTile"];
          }
          v21 = [v7 componentsJoinedByString:v22];

          ++v23;
          v24 = v21;
        }
        while (v23 != v20);
        uint64_t v20 = [v34 countByEnumeratingWithState:&v43 objects:v56 count:16];
      }
      while (v20);
    }
    else
    {
      v21 = &stru_1EF1B5B50;
      id v4 = v38;
    }
  }
  else
  {
    v21 = &stru_1EF1B5B50;
  }

  return v21;
}

- (id)_generatedTicketTilesWithPass:(id)a3 context:(int64_t)a4 tileUpdateBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 3:
      uint64_t v10 = [(PKPassSemanticTileFactory *)self _additionalTicketInfoTilesForPass:v8];
      goto LABEL_7;
    case 2:
      uint64_t v10 = [(PKPassSemanticTileFactory *)self _eventGuideTilesForPass:v8 tileUpdateBlock:v9];
      goto LABEL_7;
    case 1:
      uint64_t v10 = [(PKPassSemanticTileFactory *)self _dashboardTilesForPass:v8 tileUpdateBlock:v9];
LABEL_7:
      uint64_t v11 = (void *)v10;
      goto LABEL_9;
  }
  uint64_t v11 = 0;
LABEL_9:

  return v11;
}

- (id)_dashboardTilesForPass:(id)a3 tileUpdateBlock:(id)a4
{
  v134[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 allSemantics];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = [v6 additionalInfoFields];
    id v128 = v7;
    v129 = v8;
    v127 = v10;
    v130 = v9;
    if ([v10 count] == 1)
    {
      uint64_t v11 = [v10 firstObject];
      v12 = [MEMORY[0x1E4F29128] UUID];
      v13 = [v12 UUIDString];

      uint64_t v14 = (void *)MEMORY[0x1E4F848F8];
      uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
      [v15 UUIDString];
      id v124 = v6;
      uint64_t v17 = v16 = self;
      v18 = (void *)[v14 _createMetadataForType:0 identifier:v17 context:1];

      [v18 setPreferredStyle:0];
      uint64_t v19 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:1];
      [v19 setPreferredStyle:4];
      uint64_t v20 = (void *)MEMORY[0x1E4F84920];
      v21 = [v11 label];
      uint64_t v22 = (void *)[v20 createWithContent:v21];
      [v19 setTitle:v22];

      uint64_t v23 = (void *)MEMORY[0x1E4F84920];
      v24 = [v11 value];
      v25 = (void *)[v23 createWithContent:v24];
      [v19 setFooter:v25];

      v26 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v18 childTiles:0 stateIdentifier:v13 state:v19 inProgress:0];
      [v26 setAnalyticsIdentifier:@"additionalInfoTile"];
      [v9 safelyAddObject:v26];

      self = v16;
      id v6 = v124;
    }
    else if ((unint64_t)[v10 count] >= 2)
    {
      v125 = self;
      uint64_t v28 = [MEMORY[0x1E4F29128] UUID];
      v122 = [v28 UUIDString];

      uint64_t v29 = (void *)MEMORY[0x1E4F848F8];
      v30 = [MEMORY[0x1E4F29128] UUID];
      v31 = [v30 UUIDString];
      v32 = (void *)[v29 _createMetadataForType:0 identifier:v31 context:1];

      v121 = v32;
      [v32 setPreferredStyle:0];
      v33 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:1];
      [v33 setPreferredStyle:4];
      id v34 = (void *)MEMORY[0x1E4F84920];
      v35 = PKLocalizedTicketingString(&cfstr_TileAdditional.isa);
      uint64_t v36 = (void *)[v34 createWithContent:v35];
      [v33 setTitle:v36];

      if ((unint64_t)[v127 count] < 3)
      {
        long long v47 = (void *)MEMORY[0x1E4F84920];
        long long v48 = [v127 objectAtIndexedSubscript:0];
        long long v49 = [v48 label];
        long long v50 = [v127 objectAtIndexedSubscript:1];
        long long v51 = [v50 label];
        long long v52 = PKLocalizedTicketingString(&cfstr_TileAdditional_2.isa, &stru_1EF1B5770.isa, v49, v51);
        long long v46 = (void *)[v47 createWithContent:v52];
      }
      else
      {
        v37 = [v127 objectAtIndexedSubscript:0];
        v38 = [v37 label];
        v134[0] = v38;
        long long v39 = [v127 objectAtIndexedSubscript:1];
        long long v40 = [v39 label];
        v134[1] = v40;
        long long v41 = PKLocalizedTicketingString(&cfstr_TileAdditional_0.isa);
        v134[2] = v41;
        long long v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:3];

        long long v43 = (void *)MEMORY[0x1E4F84920];
        long long v44 = PKLocalizedTicketingString(&cfstr_TileAdditional_1.isa);
        long long v45 = [v42 componentsJoinedByString:v44];
        long long v46 = (void *)[v43 createWithContent:v45];
      }
      [v33 setFooter:v46];
      long long v53 = (void *)[MEMORY[0x1E4F848E8] createDefaultDisclosureAccessoryImage];
      [v33 setAccessory:v53];

      long long v54 = (void *)[objc_alloc(MEMORY[0x1E4F84B58]) _initWithContext:3];
      v133 = v54;
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
      [v33 setActions:v55];

      v56 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v121 childTiles:0 stateIdentifier:v122 state:v33 inProgress:0];
      [v56 setAnalyticsIdentifier:@"additionalInfoTile"];
      id v9 = v130;
      [v130 safelyAddObject:v56];

      self = v125;
    }
    featureOverrides = self->_featureOverrides;
    if (featureOverrides) {
      int v58 = [(PKWebServiceTicketingFeature *)featureOverrides isIntegrationTypeSupported:0];
    }
    else {
      int v58 = 1;
    }
    uint64_t v59 = [v8 objectForKey:*MEMORY[0x1E4F87860]];
    uint64_t v60 = [v59 stringValue];

    v126 = (void *)v60;
    if (v58 && v60)
    {
      v61 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:0 identifier:@"PKPassSemanticTileMapsIdentifier" context:1];
      [v61 setPreferredStyle:1];
      v62 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:1];
      [v62 setPreferredStyle:5];
      v63 = (void *)[MEMORY[0x1E4F84920] createWithContent:v60];
      [v62 setTitle:v63];

      v64 = (void *)MEMORY[0x1E4F84920];
      v65 = PKLocalizedTicketingString(&cfstr_TileViewInMaps.isa);
      v66 = (void *)[v64 createWithContent:v65];
      [v62 setFooter:v66];

      v67 = (void *)[MEMORY[0x1E4F848F0] createWithSymbolName:@"mappin.circle.fill" tintColor:23];
      [v62 setIcon:v67];

      v68 = [v6 uniqueID];
      v69 = [(PKPassSemanticTileFactory *)self _cachedTileContentForPassUniqueID:v68 contentIdentifier:@"MapsContentIdentifier"];

      if (v69)
      {
        v70 = [v69 mapItem];
        id v71 = objc_alloc(MEMORY[0x1E4F84780]);
        id v72 = [v69 icon];
        id v73 = v6;
        v74 = self;
        v75 = objc_msgSend(v71, "initWithCGImage:scale:orientation:", objc_msgSend(v72, "CGImage"), 1, PKUIScreenScale());

        v76 = (void *)[MEMORY[0x1E4F848F0] createImageWithImage:v75 tintColor:0 hasColorContent:1];
        [v62 setIcon:v76];

        v77 = [MEMORY[0x1E4F30F08] urlForMapItem:v70 options:0];
        v78 = (void *)MEMORY[0x1E4F84920];
        v79 = [v70 name];
        v80 = (void *)[v78 createWithContent:v79];
        [v62 setTitle:v80];

        v81 = (void *)[objc_alloc(MEMORY[0x1E4F84B58]) _initWithExternalURL:v77];
        v132 = v81;
        v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v132 count:1];
        [v62 setActions:v82];

        self = v74;
        id v6 = v73;
      }
      else if (v128)
      {
        [(PKPassSemanticTileFactory *)self _reloadMapsInformationForPass:v6 semantics:v8 tileUpdateBlock:v128];
      }
      v83 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v61 childTiles:0 stateIdentifier:@"PKPassSemanticTileMapsIdentifier" state:v62 inProgress:0];
      [v83 setAnalyticsIdentifier:@"mapsTile"];
      [v130 safelyAddObject:v83];

      id v9 = v130;
      id v8 = v129;
    }
    v84 = [v8 objectForKey:*MEMORY[0x1E4F877A0]];
    v85 = [v84 stringValue];

    if (v85) {
      BOOL v86 = [v85 length] == 0;
    }
    else {
      BOOL v86 = 1;
    }
    v87 = [(PKPassSemanticTileFactory *)self _issuerActionTilesForPass:v6];
    uint64_t v88 = [v87 count];

    v89 = [v6 relevantDates];
    if ([v89 count])
    {
      v90 = [v6 eventLocation];
      BOOL v91 = v90 == 0;
    }
    else
    {
      BOOL v91 = 1;
    }

    v92 = [(PKPassSemanticTileFactory *)self _eventInformationItemsForPass:v6 semantics:v8];
    uint64_t v93 = [v92 count];

    if (v88) {
      char v94 = v86;
    }
    else {
      char v94 = 1;
    }
    if ((v94 & 1) == 0 && !v91 && v93)
    {
      v95 = [MEMORY[0x1E4F29128] UUID];
      v123 = [v95 UUIDString];

      v96 = (void *)MEMORY[0x1E4F848F8];
      v97 = [MEMORY[0x1E4F29128] UUID];
      v98 = [v97 UUIDString];
      v99 = (void *)[v96 _createMetadataForType:0 identifier:v98 context:1];

      [v99 setPreferredStyle:1];
      v100 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:1];
      [v100 setPreferredStyle:5];
      v101 = (void *)[MEMORY[0x1E4F84920] createWithContent:v85];
      [v100 setTitle:v101];

      v102 = (void *)MEMORY[0x1E4F84920];
      v103 = PKLocalizedTicketingString(&cfstr_TileEventGuide.isa);
      v104 = (void *)[v102 createWithContent:v103];
      [v100 setFooter:v104];

      v105 = PKPassKitUIBundle();
      v106 = [v105 URLForResource:@"Event_Guide_Star_Glyph" withExtension:@"pdf"];

      double v107 = PKUIScreenScale();
      PKUIImageFromPDF(v106, 60.0, 60.0, v107);
      v108 = (UIImage *)objc_claimAutoreleasedReturnValue();
      id v109 = objc_alloc(MEMORY[0x1E4F84780]);
      v110 = UIImagePNGRepresentation(v108);
      v111 = (void *)[v109 initWithData:v110 scale:PKUIScreenScale()];

      v112 = (void *)[MEMORY[0x1E4F848F0] createImageWithImage:v111 tintColor:0 hasColorContent:1];
      [v100 setIcon:v112];

      v113 = (void *)[objc_alloc(MEMORY[0x1E4F84B58]) _initWithContext:2];
      v131 = v113;
      v114 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1];
      [v100 setActions:v114];

      v115 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v99 childTiles:0 stateIdentifier:v123 state:v100 inProgress:0];
      [v115 setAnalyticsIdentifier:@"eventGuideTile"];
      [v130 safelyAddObject:v115];

      id v8 = v129;
      id v9 = v130;
    }
    if ([v9 count])
    {
      id v116 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v117 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:2 identifier:@"PKPassSemanticTileDashboardGroupIdentifier" context:1];
      [v117 setPreferredStyle:1];
      [v117 setShowInPrearm:0];
      [v117 setColumns:2];
      [v117 setMaximumRows:3];
      [v117 setWidthClass:2];
      [v117 setHeightClass:3];
      [v117 setGroupStyle:0];
      v118 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:3];
      v119 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v117 childTiles:v9 stateIdentifier:@"PKPassSemanticTileDashboardGroupIdentifier" state:v118 inProgress:0];
      [v116 safelyAddObject:v119];
    }
    else
    {
      id v116 = 0;
    }
    uint64_t v27 = (void *)[v116 copy];

    id v7 = v128;
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

- (void)_reloadMapsInformationForPass:(id)a3 semantics:(id)a4 tileUpdateBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  featureOverrides = self->_featureOverrides;
  if (featureOverrides) {
    int v12 = [(PKWebServiceTicketingFeature *)featureOverrides isIntegrationTypeSupported:0];
  }
  else {
    int v12 = 1;
  }
  v13 = [v9 objectForKey:*MEMORY[0x1E4F87860]];
  uint64_t v14 = [v13 stringValue];

  if (v12 && v14)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__PKPassSemanticTileFactory__reloadMapsInformationForPass_semantics_tileUpdateBlock___block_invoke;
    block[3] = &unk_1E59CE110;
    block[4] = self;
    id v17 = v8;
    id v18 = v10;
    dispatch_async(workQueue, block);
  }
}

void __85__PKPassSemanticTileFactory__reloadMapsInformationForPass_semantics_tileUpdateBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) uniqueID];
  LOBYTE(v2) = [v2 _coalesceOutstandingRequestForPassUniqueID:v3 contentIdentifier:@"MapsContentIdentifier" tileUpdateBlock:*(void *)(a1 + 48)];

  if ((v2 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 40) eventLocation];
    id v5 = [*(id *)(a1 + 40) allSemantics];
    id v6 = [v5 valueForKey:*MEMORY[0x1E4F87860]];
    id v7 = [v6 stringValue];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v4 name];
    }
    id v10 = v9;

    id v11 = objc_alloc_init(MEMORY[0x1E4F30EF0]);
    int v12 = v11;
    if (v10) {
      [v11 setNaturalLanguageQuery:v10];
    }
    if (v4)
    {
      MEMORY[0x1A6220CA0]([v4 coordinate]);
      objc_msgSend(v12, "setRegion:");
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F30ED8]) initWithRequest:v12];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__PKPassSemanticTileFactory__reloadMapsInformationForPass_semantics_tileUpdateBlock___block_invoke_2;
    v16[3] = &unk_1E59D7E80;
    objc_copyWeak(&v19, &location);
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v17 = v14;
    uint64_t v18 = v15;
    [v13 startWithCompletionHandler:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __85__PKPassSemanticTileFactory__reloadMapsInformationForPass_semantics_tileUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = [v3 mapItems];
    id v6 = [v5 firstObject];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) uniqueID];
      id v8 = [MEMORY[0x1E4F30EB8] imageForMapItem:v6 size:5 forScale:0 format:0 fallbackToBundleIcon:PKUIScreenScale()];
      id v9 = [[PKPassSemanticTileFactoryMapItem alloc] initWithMapItem:v6 icon:v8];
      if (v9) {
        [WeakRetained _cacheTileContent:v9 forPassUniqueID:v7 contentIdentifier:@"MapsContentIdentifier"];
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __85__PKPassSemanticTileFactory__reloadMapsInformationForPass_semantics_tileUpdateBlock___block_invoke_3;
      v12[3] = &unk_1E59CB8B0;
      id v10 = *(void **)(a1 + 32);
      v12[4] = *(void *)(a1 + 40);
      id v13 = v7;
      id v14 = WeakRetained;
      id v15 = v10;
      id v11 = v7;
      dispatch_async(MEMORY[0x1E4F14428], v12);
    }
  }
}

void __85__PKPassSemanticTileFactory__reloadMapsInformationForPass_semantics_tileUpdateBlock___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) _dashboardTilesForPass:*(void *)(a1 + 56) tileUpdateBlock:0];
  [v1 _perfomOutstandingUpdatesForPassUniqueID:v2 contentIdentifier:@"MapsContentIdentifier" updatedTiles:v3];
}

- (id)_additionalTicketInfoTilesForPass:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 additionalInfoFields];
  if ([v3 count])
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];

    id v6 = objc_msgSend(v3, "pk_arrayByApplyingBlock:", &__block_literal_global_197);
    id v7 = (void *)MEMORY[0x1E4F84908];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __63__PKPassSemanticTileFactory__additionalTicketInfoTilesForPass___block_invoke_2;
    v23[3] = &unk_1E59D7EC8;
    id v24 = v6;
    id v22 = v6;
    uint64_t v20 = (void *)[v7 createWithPreferredStyle:4 hostedViewProvider:v23];
    [v20 setFullBleed:1];
    uint64_t v8 = v5;
    v21 = (void *)v5;
    id v9 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:0 identifier:v5 context:3];
    [v9 setPreferredStyle:0];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v9 childTiles:0 stateIdentifier:v8 state:v20 inProgress:0];
    id v11 = [MEMORY[0x1E4F29128] UUID];
    int v12 = [v11 UUIDString];

    id v13 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:2 identifier:v12 context:3];
    [v13 setPreferredStyle:0];
    [v13 setColumns:1];
    [v13 setMaximumRows:1];
    [v13 setWidthClass:1];
    [v13 setHeightClass:3];
    [v13 setGroupStyle:2];
    id v14 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:3];
    id v15 = objc_alloc(MEMORY[0x1E4F848D8]);
    v26[0] = v10;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    id v17 = (void *)[v15 _initWithMetadata:v13 childTiles:v16 stateIdentifier:v12 state:v14 inProgress:0];

    v25 = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

PKEventDetailsListViewItem *__63__PKPassSemanticTileFactory__additionalTicketInfoTilesForPass___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [PKEventDetailsListViewItem alloc];
  id v4 = [v2 label];
  uint64_t v5 = [v2 value];
  id v6 = [v2 key];

  id v7 = [(PKEventDetailsListViewItem *)v3 initWithTitle:v4 detail:v5 layoutStyle:0 axID:v6];

  return v7;
}

uint64_t __63__PKPassSemanticTileFactory__additionalTicketInfoTilesForPass___block_invoke_2(uint64_t a1)
{
  return objc_claimAutoreleasedReturnValue();
}

- (id)_footerValueForTicketInfoField:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (void *)MEMORY[0x1E4F84910];
    uint64_t v5 = [v3 value];
    uint64_t v6 = objc_msgSend(v4, "createWithContent:dateStyle:timeStyle:ignoresTimeZone:isRelative:", v5, objc_msgSend(v3, "dateStyle"), objc_msgSend(v3, "timeStyle"), objc_msgSend(v3, "ignoresTimeZone"), objc_msgSend(v3, "isRelative"));
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = (void *)MEMORY[0x1E4F84918];
      uint64_t v5 = [v3 unformattedValue];
      uint64_t v8 = [v3 currencyCode];
      id v9 = objc_msgSend(v7, "createWithContent:currencyCode:numberStyle:", v5, v8, objc_msgSend(v3, "numberStyle"));

      goto LABEL_7;
    }
    id v10 = (void *)MEMORY[0x1E4F84920];
    uint64_t v5 = [v3 value];
    uint64_t v6 = [v10 createWithContent:v5];
  }
  id v9 = (void *)v6;
LABEL_7:

  return v9;
}

- (id)_eventGuideTilesForPass:(id)a3 tileUpdateBlock:(id)a4
{
  v151[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 allSemantics];
  if (v8)
  {
    id v136 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = [(PKPassSemanticTileFactory *)self _issuerActionTilesForPass:v6];
    uint64_t v10 = [v9 count];
    unint64_t v11 = 0x1E4F29000uLL;
    v127 = v9;
    if (v9)
    {
      uint64_t v12 = v10;
      if (v10 >= 1)
      {
        id v13 = [MEMORY[0x1E4F29128] UUID];
        id v14 = [v13 UUIDString];

        id v15 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:2 identifier:v14 context:2];
        [v15 setPreferredStyle:1];
        [v15 setShowInPrearm:0];
        if (v12 >= 4) {
          uint64_t v16 = 4;
        }
        else {
          uint64_t v16 = v12;
        }
        [v15 setColumns:v16];
        [v15 setMaximumRows:1];
        [v15 setWidthClass:2];
        [v15 setHeightClass:3];
        [v15 setGroupStyle:1];
        id v17 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:3];
        uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v15 childTiles:v127 stateIdentifier:v14 state:v17 inProgress:0];
        [v136 safelyAddObject:v18];
      }
    }
    v132 = v8;
    id v133 = v7;
    v134 = self;
    id v126 = v6;
    if ([(PKPassSemanticTileFactory *)self _passSupportsWeatherTile:v6])
    {
      id v19 = [v6 uniqueID];
      uint64_t v20 = [(PKPassSemanticTileFactory *)self _cachedTileContentForPassUniqueID:v19 contentIdentifier:@"WeatherContentIdentifier"];

      if (v20)
      {
        v21 = [v20 weatherInformation];
        id v22 = (void *)MEMORY[0x1E4F84908];
        v141[0] = MEMORY[0x1E4F143A8];
        v141[1] = 3221225472;
        v141[2] = __69__PKPassSemanticTileFactory__eventGuideTilesForPass_tileUpdateBlock___block_invoke;
        v141[3] = &unk_1E59D7EC8;
        id v23 = v21;
        id v142 = v23;
        id v24 = (void *)[v22 createWithPreferredStyle:4 hostedViewProvider:v141];
        v129 = v23;
        v25 = [v23 weatherURL];
        if (v25)
        {
          v26 = (void *)[objc_alloc(MEMORY[0x1E4F84B58]) _initWithExternalURL:v25];
          v151[0] = v26;
          uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:1];
          [v24 setActions:v27];
        }
        uint64_t v28 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:0 identifier:@"PKPassSemanticTileWeatherIdentifier" context:2];
        [v28 setPreferredStyle:0];
        uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v28 childTiles:0 stateIdentifier:@"PKPassSemanticTileWeatherIdentifier" state:v24 inProgress:0];
        v30 = [MEMORY[0x1E4F29128] UUID];
        [v30 UUIDString];
        v32 = v31 = v24;

        v33 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:2 identifier:v32 context:2];
        [v33 setPreferredStyle:0];
        [v33 setShowInPrearm:0];
        [v33 setColumns:1];
        [v33 setMaximumRows:1];
        [v33 setWidthClass:1];
        [v33 setHeightClass:3];
        id v34 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:3];
        id v35 = objc_alloc(MEMORY[0x1E4F848D8]);
        v150 = v29;
        uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v150 count:1];
        v37 = (void *)[v35 _initWithMetadata:v33 childTiles:v36 stateIdentifier:v32 state:v34 inProgress:0];

        [v136 addObject:v37];
        unint64_t v11 = 0x1E4F29000;

        id v6 = v126;
        uint64_t v8 = v132;
        id v7 = v133;
        self = v134;
      }
      else if (v7)
      {
        [(PKPassSemanticTileFactory *)self _reloadWeatherInformationForPass:v6 tileUpdateBlock:v7];
      }
    }
    long long v39 = [v8 objectForKey:*MEMORY[0x1E4F87860]];
    long long v40 = [v39 stringValue];

    id v128 = [v6 venueMapImage];
    if (v128)
    {
      long long v41 = [*(id *)(v11 + 296) UUID];
      uint64_t v42 = [v41 UUIDString];

      long long v43 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:0 identifier:v42 context:1];
      [v43 setPreferredStyle:0];
      long long v44 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:1];
      [v44 setPreferredStyle:4];
      [v44 setFullBleed:1];
      long long v45 = (void *)[MEMORY[0x1E4F848F0] createImageWithImage:v128 tintColor:0 hasColorContent:1];
      [v44 setBodyImage:v45];

      id v124 = (void *)[MEMORY[0x1E4F848F0] createWithSymbolName:@"arrow.up.backward.and.arrow.down.forward" tintColor:5];
      long long v46 = objc_msgSend(MEMORY[0x1E4F848E8], "createAccessoryImageWithImage:");
      [v44 setSecondaryAccessory:v46];

      v130 = (void *)v42;
      long long v47 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v43 childTiles:0 stateIdentifier:v42 state:v44 inProgress:0];
      [v47 setAnalyticsIdentifier:@"venueMapTile"];
      long long v48 = (void *)[objc_alloc(MEMORY[0x1E4F84B58]) _initWithImage:v128 title:v40];
      v149 = v48;
      long long v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v149 count:1];
      [v44 setActions:v49];

      long long v50 = [MEMORY[0x1E4F29128] UUID];
      long long v51 = [v50 UUIDString];

      long long v52 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:2 identifier:v51 context:2];
      [v52 setPreferredStyle:0];
      [v52 setShowInPrearm:0];
      [v52 setColumns:1];
      [v52 setMaximumRows:1];
      [v52 setWidthClass:1];
      [v52 setHeightClass:3];
      [v52 setGroupStyle:2];
      long long v53 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:3];
      long long v54 = v53;
      if (v40) {
        [v53 setHeader:v40];
      }
      id v55 = objc_alloc(MEMORY[0x1E4F848D8]);
      v148 = v47;
      v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v148 count:1];
      v57 = (void *)[v55 _initWithMetadata:v52 childTiles:v56 stateIdentifier:v51 state:v54 inProgress:0];

      [v136 safelyAddObject:v57];
      id v6 = v126;
      uint64_t v8 = v132;
      id v7 = v133;
      self = v134;
      unint64_t v11 = 0x1E4F29000uLL;
    }
    int v58 = [(PKPassSemanticTileFactory *)self _eventInformationItemsForPass:v6 semantics:v8];
    v131 = v40;
    v125 = v58;
    if ([v58 count] >= 1)
    {
      uint64_t v59 = [*(id *)(v11 + 296) UUID];
      uint64_t v60 = [v59 UUIDString];

      v61 = (void *)MEMORY[0x1E4F84908];
      v139[0] = MEMORY[0x1E4F143A8];
      v139[1] = 3221225472;
      v139[2] = __69__PKPassSemanticTileFactory__eventGuideTilesForPass_tileUpdateBlock___block_invoke_2;
      v139[3] = &unk_1E59D7EC8;
      id v140 = v58;
      v62 = (void *)[v61 createWithPreferredStyle:4 hostedViewProvider:v139];
      [v62 setFullBleed:1];
      v63 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:0 identifier:v60 context:2];
      [v63 setPreferredStyle:0];
      v64 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v63 childTiles:0 stateIdentifier:v60 state:v62 inProgress:0];
      [v64 setAnalyticsIdentifier:@"additionalInformationTile"];
      v65 = [*(id *)(v11 + 296) UUID];
      v66 = [v65 UUIDString];

      v67 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:2 identifier:v66 context:2];
      [v67 setPreferredStyle:0];
      [v67 setShowInPrearm:0];
      [v67 setColumns:1];
      [v67 setMaximumRows:1];
      [v67 setWidthClass:1];
      [v67 setHeightClass:3];
      v68 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:3];
      id v69 = objc_alloc(MEMORY[0x1E4F848D8]);
      v147 = v64;
      v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v147 count:1];
      id v71 = (void *)[v69 _initWithMetadata:v67 childTiles:v70 stateIdentifier:v66 state:v68 inProgress:0];

      unint64_t v11 = 0x1E4F29000uLL;
      [v136 addObject:v71];

      uint64_t v8 = v132;
      id v7 = v133;

      long long v40 = v131;
    }
    id v72 = [*(id *)(v11 + 296) UUID];
    uint64_t v73 = [v72 UUIDString];

    if (v40)
    {
      id v74 = v40;
    }
    else
    {
      PKLocalizedTicketingString(&cfstr_TileFindFriend_1.isa);
      id v74 = (id)objc_claimAutoreleasedReturnValue();
    }
    v75 = (void *)MEMORY[0x1E4F84908];
    v137[0] = MEMORY[0x1E4F143A8];
    v137[1] = 3221225472;
    v137[2] = __69__PKPassSemanticTileFactory__eventGuideTilesForPass_tileUpdateBlock___block_invoke_3;
    v137[3] = &unk_1E59D7EC8;
    id v122 = v74;
    id v138 = v122;
    v76 = (void *)[v75 createWithPreferredStyle:4 hostedViewProvider:v137];
    v120 = [MEMORY[0x1E4F1CB10] URLWithString:@"findmy://friend/"];
    v119 = (void *)[objc_alloc(MEMORY[0x1E4F84B58]) _initWithExternalURL:v120];
    v146 = v119;
    v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v146 count:1];
    [v76 setActions:v77];

    v78 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:0 identifier:v73 context:2];
    [v78 setPreferredStyle:0];
    v117 = v78;
    v123 = (void *)v73;
    v121 = v76;
    v79 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v78 childTiles:0 stateIdentifier:v73 state:v76 inProgress:0];
    [v79 setAnalyticsIdentifier:@"findMyTile"];
    v80 = [MEMORY[0x1E4F29128] UUID];
    v81 = [v80 UUIDString];

    v82 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:2 identifier:v81 context:2];
    [v82 setPreferredStyle:0];
    [v82 setShowInPrearm:0];
    [v82 setColumns:1];
    [v82 setMaximumRows:1];
    [v82 setWidthClass:1];
    [v82 setHeightClass:3];
    uint64_t v83 = [MEMORY[0x1E4F84900] createResolvedStateWithType:3];
    id v84 = objc_alloc(MEMORY[0x1E4F848D8]);
    v145 = v79;
    v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v145 count:1];
    v118 = (void *)v83;
    BOOL v86 = (void *)[v84 _initWithMetadata:v82 childTiles:v85 stateIdentifier:v81 state:v83 inProgress:0];

    [v136 addObject:v86];
    if ([(PKPassSemanticTileFactory *)v134 _passSupportsMusicTileWithSemantics:v8])
    {
      v87 = [v6 uniqueID];
      uint64_t v88 = [(PKPassSemanticTileFactory *)v134 _cachedTileContentForPassUniqueID:v87 contentIdentifier:@"MusicContentIdentifier"];

      if (v88)
      {
        v89 = [v88 musicItem];
        v90 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:1];
        id v116 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:3];
        id v91 = objc_alloc(MEMORY[0x1E4F84780]);
        v92 = [v89 artwork];
        uint64_t v93 = [v91 initWithData:v92 scale:PKUIScreenScale()];

        [v90 setFullBleed:1];
        [v90 setPreferredStyle:4];
        v115 = (void *)v93;
        char v94 = (void *)[MEMORY[0x1E4F848F0] createImageWithImage:v93 tintColor:0 hasColorContent:1];
        [v90 setBodyImage:v94];

        id v95 = objc_alloc(MEMORY[0x1E4F84B58]);
        v96 = [v89 musicURL];
        uint64_t v97 = [v95 _initWithExternalURL:v96];

        v114 = (void *)v97;
        uint64_t v144 = v97;
        v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v144 count:1];
        [v90 setActions:v98];

        unint64_t v99 = [v89 type];
        uint64_t v100 = 0;
        if (v99 <= 2)
        {
          uint64_t v100 = PKLocalizedTicketingString(&off_1E59D7F38[v99]->isa);
        }
        v113 = (void *)v100;
        v135 = v88;
        [v116 setHeader:v100];
        if (([v89 appleCurated] & 1) == 0)
        {
          v101 = PKLocalizedTicketingString(&cfstr_TileMusicHeade_2.isa);
          [v116 setHeaderActionTitle:v101];
        }
        v102 = [v89 displayName];
        [v116 setFooterActionTitle:v102];

        v103 = [v89 itemDescription];
        [v116 setFooter:v103];

        v104 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:0 identifier:@"PKPassSemanticTileMusicIdentifier" context:2];
        [v104 setPreferredStyle:0];
        v112 = v89;
        v105 = (void *)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v104 childTiles:0 stateIdentifier:@"PKPassSemanticTileWeatherIdentifier" state:v90 inProgress:0];
        v106 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:2 identifier:@"PKPassSemanticTileMusicGroupStateIdentifier" context:2];
        [v106 setPreferredStyle:0];
        [v106 setShowInPrearm:0];
        [v106 setColumns:1];
        [v106 setMaximumRows:1];
        [v106 setWidthClass:1];
        [v106 setHeightClass:3];
        [v106 setGroupStyle:0];
        double v107 = v90;
        id v108 = objc_alloc(MEMORY[0x1E4F848D8]);
        v143 = v105;
        id v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v143 count:1];
        v110 = (void *)[v108 _initWithMetadata:v106 childTiles:v109 stateIdentifier:@"PKPassSemanticTileMusicGroupStateIdentifier" state:v116 inProgress:0];

        [v136 safelyAddObject:v110];
        id v6 = v126;
        uint64_t v8 = v132;
        id v7 = v133;
        uint64_t v88 = v135;
      }
      else if (v7)
      {
        [(PKPassSemanticTileFactory *)v134 _reloadMusicInformationForPass:v6 semantics:v8 tileUpdateBlock:v7];
      }
    }
    v38 = objc_msgSend(v136, "copy", v112);
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

uint64_t __69__PKPassSemanticTileFactory__eventGuideTilesForPass_tileUpdateBlock___block_invoke(uint64_t a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t __69__PKPassSemanticTileFactory__eventGuideTilesForPass_tileUpdateBlock___block_invoke_2(uint64_t a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t __69__PKPassSemanticTileFactory__eventGuideTilesForPass_tileUpdateBlock___block_invoke_3(uint64_t a1)
{
  return objc_claimAutoreleasedReturnValue();
}

- (void)_reloadWeatherInformationForPass:(id)a3 tileUpdateBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKPassSemanticTileFactory *)self _passSupportsWeatherTile:v6])
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PKPassSemanticTileFactory__reloadWeatherInformationForPass_tileUpdateBlock___block_invoke;
    block[3] = &unk_1E59CE110;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

void __78__PKPassSemanticTileFactory__reloadWeatherInformationForPass_tileUpdateBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) uniqueID];
  LOBYTE(v2) = [v2 _coalesceOutstandingRequestForPassUniqueID:v3 contentIdentifier:@"WeatherContentIdentifier" tileUpdateBlock:*(void *)(a1 + 48)];

  if ((v2 & 1) == 0)
  {
    id v4 = objc_alloc_init(_TtC9PassKitUI26PassLocationWeatherManager);
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v5 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__PKPassSemanticTileFactory__reloadWeatherInformationForPass_tileUpdateBlock___block_invoke_2;
    v9[3] = &unk_1E59D7EF0;
    id v6 = v4;
    id v10 = v6;
    objc_copyWeak(&v13, &location);
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = v7;
    uint64_t v12 = v8;
    [(PassLocationWeatherManager *)v6 fetchWeatherDisplayInformationFor:v5 completion:v9];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __78__PKPassSemanticTileFactory__reloadWeatherInformationForPass_tileUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v5 = [*(id *)(a1 + 40) uniqueID];
    if (v3)
    {
      id v6 = [[PKPassCachedWeatherInformation alloc] initWithWeatherInformation:v3];
      [WeakRetained _cacheTileContent:v6 forPassUniqueID:v5 contentIdentifier:@"WeatherContentIdentifier"];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__PKPassSemanticTileFactory__reloadWeatherInformationForPass_tileUpdateBlock___block_invoke_3;
    v9[3] = &unk_1E59CB8B0;
    id v7 = *(void **)(a1 + 40);
    void v9[4] = *(void *)(a1 + 48);
    id v10 = v5;
    id v11 = WeakRetained;
    id v12 = v7;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

void __78__PKPassSemanticTileFactory__reloadWeatherInformationForPass_tileUpdateBlock___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) _eventGuideTilesForPass:*(void *)(a1 + 56) tileUpdateBlock:0];
  [v1 _perfomOutstandingUpdatesForPassUniqueID:v2 contentIdentifier:@"WeatherContentIdentifier" updatedTiles:v3];
}

- (void)_reloadMusicInformationForPass:(id)a3 semantics:(id)a4 tileUpdateBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKPassSemanticTileFactory *)self _passSupportsMusicTileWithSemantics:v9])
  {
    workQueue = self->_workQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__PKPassSemanticTileFactory__reloadMusicInformationForPass_semantics_tileUpdateBlock___block_invoke;
    v12[3] = &unk_1E59CE9B0;
    v12[4] = self;
    id v13 = v8;
    id v15 = v10;
    id v14 = v9;
    dispatch_async(workQueue, v12);
  }
}

void __86__PKPassSemanticTileFactory__reloadMusicInformationForPass_semantics_tileUpdateBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) uniqueID];
  LOBYTE(v2) = [v2 _coalesceOutstandingRequestForPassUniqueID:v3 contentIdentifier:@"MusicContentIdentifier" tileUpdateBlock:*(void *)(a1 + 56)];

  if ((v2 & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v4 = objc_alloc_init(PKAMSMediaItemsService);
    uint64_t v5 = -[PKAMSMediaRequestArtworkConfiguration initWithArtworkSize:artworkCropType:animatedArtworkType:]([PKAMSMediaRequestArtworkConfiguration alloc], "initWithArtworkSize:artworkCropType:animatedArtworkType:", 0, 1, 2048.0, 2048.0);
    id v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F87888]];
    id v7 = [v6 stringsValue];

    id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F87880]];
    id v9 = [v8 stringsValue];

    id v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F87890]];
    id v11 = [v10 stringsValue];

    if ([v11 count])
    {
      id v12 = [PKAMSMediaRequestMusicItem alloc];
      id v13 = (void *)[v11 copy];
      uint64_t v14 = [(PKAMSMediaRequestMusicItem *)v12 initWithType:1 musicIDs:v13 artworkConfiguration:v5];
    }
    else if ([v9 count])
    {
      id v15 = [PKAMSMediaRequestMusicItem alloc];
      id v13 = (void *)[v9 copy];
      uint64_t v14 = [(PKAMSMediaRequestMusicItem *)v15 initWithType:0 musicIDs:v13 artworkConfiguration:v5];
    }
    else
    {
      if (![v7 count])
      {
LABEL_10:

        objc_destroyWeak(&location);
        return;
      }
      uint64_t v16 = [PKAMSMediaRequestMusicItem alloc];
      id v13 = (void *)[v7 copy];
      uint64_t v14 = [(PKAMSMediaRequestMusicItem *)v16 initWithType:2 musicIDs:v13 artworkConfiguration:v5];
    }
    id v17 = (void *)v14;

    if (v17)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __86__PKPassSemanticTileFactory__reloadMusicInformationForPass_semantics_tileUpdateBlock___block_invoke_2;
      v21[3] = &unk_1E59D7F18;
      id v22 = v4;
      objc_copyWeak(&v25, &location);
      id v18 = *(id *)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 32);
      id v23 = v18;
      uint64_t v24 = v19;
      id v20 = [(PKAMSMediaItemsService *)v22 fetchItemsWithRequest:v17 completion:v21];

      objc_destroyWeak(&v25);
    }
    goto LABEL_10;
  }
}

void __86__PKPassSemanticTileFactory__reloadMusicInformationForPass_semantics_tileUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v5 = [*(id *)(a1 + 40) uniqueID];
    if (v3)
    {
      id v6 = [v3 firstObject];
      id v7 = [v6 musicItem];

      if (v7)
      {
        id v8 = [[PKCachedAMSMediaLookupItemMusic alloc] initWithMusicLookupItem:v7];
        [WeakRetained _cacheTileContent:v8 forPassUniqueID:v5 contentIdentifier:@"MusicContentIdentifier"];
      }
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__PKPassSemanticTileFactory__reloadMusicInformationForPass_semantics_tileUpdateBlock___block_invoke_3;
    v11[3] = &unk_1E59CB8B0;
    id v9 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 48);
    id v12 = v5;
    id v13 = WeakRetained;
    id v14 = v9;
    id v10 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __86__PKPassSemanticTileFactory__reloadMusicInformationForPass_semantics_tileUpdateBlock___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) _eventGuideTilesForPass:*(void *)(a1 + 56) tileUpdateBlock:0];
  [v1 _perfomOutstandingUpdatesForPassUniqueID:v2 contentIdentifier:@"MusicContentIdentifier" updatedTiles:v3];
}

- (BOOL)_passSupportsWeatherTile:(id)a3
{
  id v4 = a3;
  featureOverrides = self->_featureOverrides;
  if (featureOverrides
    && ![(PKWebServiceTicketingFeature *)featureOverrides isIntegrationTypeSupported:1])
  {
    BOOL v8 = 0;
  }
  else
  {
    id v6 = [v4 eventLocation];
    if (v6)
    {
      id v7 = [v4 relevantDates];
      BOOL v8 = v7 != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (BOOL)_passSupportsMusicTileWithSemantics:(id)a3
{
  id v4 = a3;
  featureOverrides = self->_featureOverrides;
  if (featureOverrides
    && ![(PKWebServiceTicketingFeature *)featureOverrides isIntegrationTypeSupported:2])
  {
    BOOL v12 = 0;
  }
  else
  {
    id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87888]];
    id v7 = [v6 stringsValue];

    BOOL v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87880]];
    id v9 = [v8 stringsValue];

    id v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87890]];
    id v11 = [v10 stringsValue];

    BOOL v12 = [v7 count] || objc_msgSend(v9, "count") || objc_msgSend(v11, "count") != 0;
  }

  return v12;
}

- (id)_cachedTileContentForPassUniqueID:(id)a3 contentIdentifier:(id)a4
{
  uint64_t v5 = [(PKPassSemanticTileFactory *)self _cacheKeyForPassUniqueID:a3 contentIdentifier:a4];
  if (v5)
  {
    id v6 = [(NSCache *)self->_tileContentCache objectForKey:v5];
  }
  else
  {
    id v6 = 0;
  }
  if ([v6 isContentDiscarded]) {
    id v7 = 0;
  }
  else {
    id v7 = v6;
  }
  id v8 = v7;

  return v8;
}

- (void)_cacheTileContent:(id)a3 forPassUniqueID:(id)a4 contentIdentifier:(id)a5
{
  id v9 = a3;
  id v8 = [(PKPassSemanticTileFactory *)self _cacheKeyForPassUniqueID:a4 contentIdentifier:a5];
  if (v9 && v8) {
    [(NSCache *)self->_tileContentCache setObject:v9 forKey:v8];
  }
}

- (id)_cacheKeyForPassUniqueID:(id)a3 contentIdentifier:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSString;
  id v6 = a4;
  [a3 hash];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = objc_msgSend(v5, "pk_stringWithInteger:", PKCombinedHash());

  return v8;
}

- (BOOL)_coalesceOutstandingRequestForPassUniqueID:(id)a3 contentIdentifier:(id)a4 tileUpdateBlock:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  p_tileUpdatesLocuint64_t k = &self->_tileUpdatesLock;
  id v10 = a4;
  id v11 = a3;
  os_unfair_lock_lock(&self->_tileUpdatesLock);
  BOOL v12 = [(PKPassSemanticTileFactory *)self _cacheKeyForPassUniqueID:v11 contentIdentifier:v10];

  id v13 = [(NSMutableDictionary *)self->_outstandingTileUpdates objectForKey:v12];
  if (v13)
  {
    if (v8)
    {
      outstandingTileUpdates = self->_outstandingTileUpdates;
      id v15 = _Block_copy(v8);
      uint64_t v16 = [v13 arrayByAddingObject:v15];
      [(NSMutableDictionary *)outstandingTileUpdates setObject:v16 forKey:v12];
    }
    id v17 = v13;
  }
  else
  {
    if (v8)
    {
      id v18 = _Block_copy(v8);
      v20[0] = v18;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    }
    else
    {
      id v17 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [(NSMutableDictionary *)self->_outstandingTileUpdates setObject:v17 forKey:v12];
  }
  os_unfair_lock_unlock(p_tileUpdatesLock);

  return v13 != 0;
}

- (void)_perfomOutstandingUpdatesForPassUniqueID:(id)a3 contentIdentifier:(id)a4 updatedTiles:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_tileUpdatesLock);
  id v11 = [(PKPassSemanticTileFactory *)self _cacheKeyForPassUniqueID:v8 contentIdentifier:v9];
  BOOL v12 = [(NSMutableDictionary *)self->_outstandingTileUpdates objectForKey:v11];
  [(NSMutableDictionary *)self->_outstandingTileUpdates removeObjectForKey:v11];
  os_unfair_lock_unlock(&self->_tileUpdatesLock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v17) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * v17));
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureOverrides, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_outstandingTileUpdates, 0);

  objc_storeStrong((id *)&self->_tileContentCache, 0);
}

@end