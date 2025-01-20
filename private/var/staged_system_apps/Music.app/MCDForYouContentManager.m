@interface MCDForYouContentManager
- (BOOL)wantsGridCellAtIndexPath:(id)a3;
- (BOOL)wantsTallCellAtIndexPath:(id)a3;
- (MCDForYouContentManager)initWithDataSource:(id)a3 delegate:(id)a4 viewController:(id)a5 playbackManager:(id)a6 limitedUI:(BOOL)a7 contentResults:(id)a8;
- (NSOperationQueue)refreshQueue;
- (id)_modelRequest;
- (id)_queueName;
- (id)_refreshRecentlyPlayedRequest;
- (id)artworksWithTitlesAtIndexPath:(id)a3;
- (id)cellTitleAtIndexPath:(id)a3;
- (id)childrenOfItemAtIndexPath:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)prefixSections;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4;
- (void)_initiatePlaybackForItem:(id)a3;
- (void)_processRefreshResponse:(id)a3 error:(id)a4;
- (void)performRefresh;
- (void)setRefreshQueue:(id)a3;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
@end

@implementation MCDForYouContentManager

- (MCDForYouContentManager)initWithDataSource:(id)a3 delegate:(id)a4 viewController:(id)a5 playbackManager:(id)a6 limitedUI:(BOOL)a7 contentResults:(id)a8
{
  v12.receiver = self;
  v12.super_class = (Class)MCDForYouContentManager;
  v8 = [(MCDFuseContentManager *)&v12 initWithDataSource:a3 delegate:a4 viewController:a5 playbackManager:a6 limitedUI:a7 contentResults:a8];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    refreshQueue = v8->_refreshQueue;
    v8->_refreshQueue = (NSOperationQueue *)v9;

    [(NSOperationQueue *)v8->_refreshQueue setMaxConcurrentOperationCount:4];
    [(NSOperationQueue *)v8->_refreshQueue setQualityOfService:17];
    [(NSOperationQueue *)v8->_refreshQueue setName:@"RefreshQueue"];
  }
  return v8;
}

- (id)prefixSections
{
  CFStringRef v4 = @"siri_action_section";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  v3 = [(MCDForYouContentManager *)self itemAtIndexPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 displaysAsGridCellInCarPlay];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)wantsTallCellAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(MCDFuseContentManager *)self lastReceivedResponse];
  v6 = [v5 results];
  v7 = [v6 sectionAtIndex:[v4 section]];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v7 displaysAsTitledSectionWithRowsInCarPlay] & 1) != 0)
  {
    BOOL v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MCDForYouContentManager;
    BOOL v8 = [(MCDFuseContentManager *)&v10 wantsTallCellAtIndexPath:v4];
  }

  return v8;
}

- (id)cellTitleAtIndexPath:(id)a3
{
  v3 = [(MCDForYouContentManager *)self itemAtIndexPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 groupType];
    v5 = [v3 title];
    v6 = v5;
    if (v4 == (id)4)
    {
      if (v5)
      {
        id v7 = v5;
      }
      else
      {
        BOOL v8 = +[NSBundle mainBundle];
        id v7 = [v8 localizedStringForKey:@"Recently Played" value:&stru_101023248 table:0];
      }
      v6 = v7;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)childrenOfItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(MCDFuseContentManager *)self lastReceivedResponse];
  v6 = [v5 results];
  id v7 = [v6 numberOfSections];
  id v8 = [v4 section];

  if ((uint64_t)v7 <= (uint64_t)v8)
  {
    v13 = &__NSArray0__struct;
  }
  else
  {
    uint64_t v9 = [(MCDFuseContentManager *)self lastReceivedResponse];
    objc_super v10 = [v9 results];
    v11 = [v10 sectionAtIndex:[v4 section]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = (uint64_t)[v11 numberOfItems];
      v13 = objc_opt_new();
      if (v12 >= 1)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          v15 = [v11 itemAtIndex:i];
          [v13 addObject:v15];
        }
      }
    }
    else
    {
      v13 = &__NSArray0__struct;
    }
  }

  return v13;
}

- (id)artworksWithTitlesAtIndexPath:(id)a3
{
  v3 = [(MCDForYouContentManager *)self childrenOfItemAtIndexPath:a3];
  id v4 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v11 = [v10 itemType];
        if (v11 == (id)3)
        {
          uint64_t v12 = [v10 radioStation];
LABEL_13:
          v13 = v12;
          id v16 = [v12 artworkCatalog];
LABEL_16:

          if (v16) {
            goto LABEL_18;
          }
          goto LABEL_17;
        }
        if (v11 == (id)2)
        {
          v13 = [v10 playlist];
          v14 = [v13 artworkCatalog];
          v15 = v14;
          if (v14)
          {
            id v16 = v14;
          }
          else
          {
            v17 = [v10 playlist];
            id v16 = [v17 tracksTiledArtworkCatalogWithRows:2 columns:2];
          }
          goto LABEL_16;
        }
        if (v11 == (id)1)
        {
          uint64_t v12 = [v10 album];
          goto LABEL_13;
        }
LABEL_17:
        v18 = [(MCDFuseContentManager *)self viewController];
        v19 = [v18 traitCollection];
        v20 = +[UIImage defaultPlaceholderForTraitCollection:v19];
        id v16 = +[MPArtworkCatalog staticArtworkCatalogWithImage:v20];

LABEL_18:
        id v21 = [v10 itemType];
        if (v21 == (id)3)
        {
          v24 = [v10 radioStation];
          goto LABEL_24;
        }
        if (v21 == (id)2)
        {
          v24 = [v10 playlist];
LABEL_24:
          v22 = v24;
          uint64_t v23 = [v24 name];
LABEL_25:
          v25 = (__CFString *)v23;

          if (v25) {
            goto LABEL_27;
          }
          goto LABEL_26;
        }
        if (v21 == (id)1)
        {
          v22 = [v10 album];
          uint64_t v23 = [v22 title];
          goto LABEL_25;
        }
LABEL_26:
        v25 = &stru_101023248;
LABEL_27:
        if (v16)
        {
          v26 = +[MusicObjectPair pairWithFirst:v16 andSecond:v25];
          [v4 addObject:v26];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }

  id v27 = [v4 copy];

  return v27;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(MCDFuseContentManager *)self lastReceivedResponse];
  id v6 = [v5 results];
  id v7 = [v6 sectionAtIndex:a4];

  if (v7
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v7 displaysAsTitledSectionWithRowsInCarPlay])
  {
    uint64_t v8 = [v7 title];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v13 = a4;
  id v7 = [(MCDFuseContentManager *)self lastReceivedResponse];
  uint64_t v8 = [v7 results];
  uint64_t v9 = [v8 sectionAtIndex:a5];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v9 displaysAsTitledSectionWithRowsInCarPlay])
      {
        id v10 = v13;
        id v11 = +[UIFont boldSystemFontOfSize:16.0];
        uint64_t v12 = [v10 textLabel];

        [v12 setFont:v11];
      }
    }
  }
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  id v6 = [(MCDFuseContentManager *)self lastReceivedResponse];
  id v7 = [v6 results];
  id v8 = [v7 numberOfSections];

  if ((uint64_t)v5 >= (uint64_t)v8)
  {
    id v13 = 0;
  }
  else
  {
    uint64_t v9 = [(MCDFuseContentManager *)self lastReceivedResponse];
    id v10 = [v9 results];
    id v11 = [v10 sectionAtIndex:[v4 section]];

    if ([v11 displaysAsTitledSectionWithRowsInCarPlay])
    {
      [v11 itemAtIndex:[v4 row]];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = v11;
    }
    id v13 = v12;
  }

  return v13;
}

- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(MCDFuseContentManager *)self lastReceivedResponse];
  id v8 = [v7 results];
  uint64_t v9 = [v8 sectionAtIndex:a4];

  if ([v9 displaysAsTitledSectionWithRowsInCarPlay])
  {
    id v10 = [v6 results];
    id v11 = [v10 sectionAtIndex:a4];
    id v12 = [v11 numberOfItems];

    int64_t v13 = [(MCDFuseContentManager *)self maximumNumberOfItemsForDisplay];
    if ((uint64_t)v12 >= v13) {
      int64_t v14 = v13;
    }
    else {
      int64_t v14 = (int64_t)v12;
    }
  }
  else
  {
    int64_t v14 = (uint64_t)[v9 numberOfItems] > 0;
  }

  return v14;
}

- (id)_queueName
{
  return @"com.apple.MusicCarDisplayUI.MCDForYouContentManager.operationQueue";
}

- (id)_modelRequest
{
  id v2 = objc_alloc_init((Class)MPModelForYouRecommendationsRequest);
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v3 = (void *)qword_1010D6E40;
  uint64_t v14 = qword_1010D6E40;
  if (!qword_1010D6E40)
  {
    id v4 = (void *)sub_100029870();
    v12[3] = (uint64_t)dlsym(v4, "MCDMusicCarPlayBundleIdentifier");
    qword_1010D6E40 = v12[3];
    v3 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v3)
  {
    sub_100D691B8();
LABEL_14:
    sub_100D691B8();
    goto LABEL_15;
  }
  [v2 setClientIdentifier:*v3];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v5 = (void *)qword_1010D6E50;
  uint64_t v14 = qword_1010D6E50;
  if (!qword_1010D6E50)
  {
    id v6 = (void *)sub_100029870();
    v12[3] = (uint64_t)dlsym(v6, "MCDMusicCarPlayVersion");
    qword_1010D6E50 = v12[3];
    id v5 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v5) {
    goto LABEL_14;
  }
  [v2 setClientVersion:*v5];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v7 = (void *)qword_1010D6E58;
  uint64_t v14 = qword_1010D6E58;
  if (!qword_1010D6E58)
  {
    id v8 = (void *)sub_100029870();
    v12[3] = (uint64_t)dlsym(v8, "MCDMusicCarPlayPlatformIdentifier");
    qword_1010D6E58 = v12[3];
    id v7 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v7)
  {
LABEL_15:
    id v10 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v10);
  }
  [v2 setClientPlatformIdentifier:*v7];
  [v2 setFilteringPolicy:1];
  [v2 setRequestEndpoint:1];
  [v2 setAuthenticationOptions:3];
  [v2 setMode:1];
  [v2 setWithRecentlyPlayed:0];
  [v2 setWithSocial:1];

  return v2;
}

- (void)performRefresh
{
  v3 = [(MCDForYouContentManager *)self _refreshRecentlyPlayedRequest];
  if (!v3)
  {
    id v4 = sub_10009A618();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100D692CC();
    }
  }
  [(MCDFuseContentManager *)self decorateRequest:v3];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_10009A724;
  v8[4] = sub_10009A734;
  uint64_t v9 = self;
  refreshQueue = v9->_refreshQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009A73C;
  v7[3] = &unk_100FC3B10;
  v7[4] = v8;
  id v6 = [v3 newOperationWithResponseHandler:v7];
  [(NSOperationQueue *)refreshQueue addOperation:v6];

  _Block_object_dispose(v8, 8);
}

- (void)_processRefreshResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = sub_10009A618();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100D6940C((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    v15 = [(MCDFuseContentManager *)self lastReceivedResponse];

    if (v15)
    {
      id v16 = [v6 results];
      id v8 = [v16 firstSection];

      if (v8)
      {
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x2020000000;
        uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
        v17 = [(MCDFuseContentManager *)self lastReceivedResponse];
        v18 = [v17 results];
        id v19 = [v18 mutableCopy];

        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10009AA10;
        v37[3] = &unk_100FC3B38;
        id v8 = v8;
        v38 = v8;
        v39 = &v40;
        [v19 replaceSectionsUsingBlock:v37];
        if (v41[3] == 0x7FFFFFFFFFFFFFFFLL)
        {
          v20 = sub_10009A618();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_100D693A0((uint64_t)v17, v20, v21, v22, v23, v24, v25, v26);
          }
        }
        else
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10009AAE4;
          block[3] = &unk_100FC3B60;
          block[4] = self;
          id v35 = v17;
          id v36 = v19;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
        _Block_object_dispose(&v40, 8);
      }
      else
      {
        id v27 = sub_10009A618();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_100D69334((uint64_t)v6, v27, v28, v29, v30, v31, v32, v33);
        }
      }
    }
    else
    {
      id v8 = sub_10009A618();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100D69300();
      }
    }
  }
}

- (id)_refreshRecentlyPlayedRequest
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_10009A724;
  uint64_t v14 = sub_10009A734;
  id v15 = 0;
  v3 = [(MCDFuseContentManager *)self lastReceivedResponse];
  id v4 = [v3 results];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009ADC4;
  v9[3] = &unk_100FC3B88;
  v9[4] = &v10;
  [v4 enumerateSectionsUsingBlock:v9];

  if (v11[5])
  {
    id v5 = [(MCDForYouContentManager *)self _modelRequest];
    [v5 setCustomForYouURL:v11[5]];
    [v5 setRefreshRequest:1];
  }
  else
  {
    id v6 = sub_10009A618();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(MCDFuseContentManager *)self lastReceivedResponse];
      sub_100D694E0(v7, buf, v6);
    }

    id v5 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (void)_initiatePlaybackForItem:(id)a3
{
  id v9 = a3;
  id v4 = [v9 itemType];
  if (v4 == (id)3)
  {
    id v5 = [(MCDFuseContentManager *)self playbackManager];
    id v6 = [v9 radioStation];
    id v7 = [(MCDFuseContentManager *)self viewController];
    id v8 = [v7 combinedPlayActivityFeatureName];
    [v5 initiatePlaybackForRadioStation:v6 lastResponse:0 shuffled:0 playActivityFeatureName:v8];
  }
  else if (v4 == (id)2)
  {
    id v5 = [(MCDFuseContentManager *)self playbackManager];
    id v6 = [v9 playlist];
    id v7 = [(MCDFuseContentManager *)self viewController];
    id v8 = [v7 combinedPlayActivityFeatureName];
    [v5 initiatePlaybackForPlaylist:v6 lastResponse:0 shuffled:0 playActivityFeatureName:v8];
  }
  else
  {
    if (v4 != (id)1) {
      goto LABEL_8;
    }
    id v5 = [(MCDFuseContentManager *)self playbackManager];
    id v6 = [v9 album];
    id v7 = [(MCDFuseContentManager *)self viewController];
    id v8 = [v7 combinedPlayActivityFeatureName];
    [v5 initiatePlaybackForAlbum:v6 lastResponse:0 shuffled:0 playActivityFeatureName:v8];
  }

LABEL_8:
}

- (NSOperationQueue)refreshQueue
{
  return self->_refreshQueue;
}

- (void)setRefreshQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end