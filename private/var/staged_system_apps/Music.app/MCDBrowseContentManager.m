@interface MCDBrowseContentManager
- (BOOL)wantsGridCellAtIndexPath:(id)a3;
- (id)_modelRequest;
- (id)_queueName;
- (id)artworksWithTitlesAtIndexPath:(id)a3;
- (id)cellTitleAtIndexPath:(id)a3;
- (id)childrenOfItemAtIndexPath:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (int64_t)maximumNumberOfItemsForDisplay;
- (void)_initiatePlaybackForItem:(id)a3;
@end

@implementation MCDBrowseContentManager

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(MCDFuseContentManager *)self contentResults];

  if (v5)
  {
    v6 = [(MCDFuseContentManager *)self contentResults];
    v7 = [v6 itemsInSectionAtIndex:[v4 section]];
    v8 = [v7 objectAtIndexedSubscript:[v4 row]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 firstSection];
    }
    else
    {
      id v9 = v8;
    }
  }
  else
  {
    v10 = [(MCDFuseContentManager *)self lastReceivedResponse];
    v8 = [v10 request];

    uint64_t v11 = [v8 loadAdditionalContentURL];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [(MCDFuseContentManager *)self lastReceivedResponse];
      v14 = [v13 results];
      uint64_t v15 = (uint64_t)[v14 numberOfSections];

      if (v15 >= 1)
      {
        v16 = [(MCDFuseContentManager *)self lastReceivedResponse];
        v17 = [v16 results];
        v18 = [v17 itemsInSectionAtIndex:0];
        v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

        goto LABEL_10;
      }
    }
    v21.receiver = self;
    v21.super_class = (Class)MCDBrowseContentManager;
    id v9 = [(MCDFuseContentManager *)&v21 itemAtIndexPath:v4];
  }
  v19 = v9;
LABEL_10:

  return v19;
}

- (id)childrenOfItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(MCDFuseContentManager *)self lastReceivedResponse];
  v6 = [v5 results];
  id v7 = [v6 numberOfSections];
  id v8 = [v4 row];

  if ((uint64_t)v7 <= (uint64_t)v8)
  {
    uint64_t v11 = &__NSArray0__struct;
  }
  else
  {
    id v9 = [(MCDFuseContentManager *)self lastReceivedResponse];
    v10 = [v9 results];
    uint64_t v11 = [v10 itemsInSectionAtIndex:[v4 row]];
  }

  return v11;
}

- (id)artworksWithTitlesAtIndexPath:(id)a3
{
  id v30 = a3;
  v31 = self;
  id v4 = -[MCDBrowseContentManager childrenOfItemAtIndexPath:](self, "childrenOfItemAtIndexPath:");
  v32 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v34;
    *(void *)&long long v7 = 138543618;
    long long v29 = v7;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 innerObject];
          v12 = +[MPModelGenericObject genericObjectWithModelObject:v11];

          v13 = [v12 artworkCatalog];
          if (!v13)
          {
            if ([v12 type] != (id)4
              || ([v12 playlist],
                  v14 = objc_claimAutoreleasedReturnValue(),
                  [v14 tracksTiledArtworkCatalogWithRows:2 columns:2],
                  v13 = objc_claimAutoreleasedReturnValue(),
                  v14,
                  !v13))
            {
              uint64_t v15 = [(MCDFuseContentManager *)v31 viewController];
              v16 = [v15 traitCollection];
              v17 = +[UIImage defaultPlaceholderForTraitCollection:v16];
              v13 = +[MPArtworkCatalog staticArtworkCatalogWithImage:v17];
            }
          }
          switch((unint64_t)objc_msgSend(v10, "itemType", v29))
          {
            case 1uLL:
              v18 = [v10 album];
              uint64_t v19 = [v18 title];
              goto LABEL_32;
            case 2uLL:
              v18 = [v10 artist];
              uint64_t v19 = [v18 name];
              goto LABEL_32;
            case 3uLL:
              v18 = [v10 curator];
              uint64_t v19 = [v18 name];
              goto LABEL_32;
            case 4uLL:
              v18 = [v10 playlist];
              uint64_t v19 = [v18 name];
              goto LABEL_32;
            case 5uLL:
              v18 = [v10 radioStation];
              uint64_t v19 = [v18 name];
              goto LABEL_32;
            case 6uLL:
              v18 = [v10 socialPerson];
              uint64_t v19 = [v18 name];
              goto LABEL_32;
            case 7uLL:
              v18 = [v10 song];
              uint64_t v19 = [v18 title];
              goto LABEL_32;
            case 8uLL:
              v18 = [v10 episode];
              uint64_t v19 = [v18 title];
              goto LABEL_32;
            case 9uLL:
              v18 = [v10 show];
              uint64_t v19 = [v18 title];
              goto LABEL_32;
            case 0xAuLL:
              v18 = [v10 season];
              v24 = [v18 show];
              v25 = [v24 title];

              goto LABEL_33;
            case 0xBuLL:
              v18 = [v10 showCreator];
              uint64_t v19 = [v18 name];
              goto LABEL_32;
            case 0xCuLL:
              v18 = [v10 movie];
              uint64_t v19 = [v18 title];
              goto LABEL_32;
            case 0xDuLL:
              v18 = [v10 mediaClip];
              uint64_t v19 = [v18 title];
              goto LABEL_32;
            case 0xEuLL:
              v18 = [v10 recordLabel];
              uint64_t v19 = [v18 name];
              goto LABEL_32;
            case 0xFuLL:
              v18 = [v10 creditsArtist];
              uint64_t v19 = [v18 name];
LABEL_32:
              v25 = (__CFString *)v19;
LABEL_33:

              if (!v25) {
                goto LABEL_36;
              }
              if (!v13) {
                goto LABEL_38;
              }
              goto LABEL_37;
            default:
LABEL_36:
              v25 = &stru_101023248;
              if (v13)
              {
LABEL_37:
                v26 = +[MusicObjectPair pairWithFirst:v13 andSecond:v25];
                [v32 addObject:v26];
              }
LABEL_38:

              break;
          }
        }
        else
        {
          uint64_t v37 = 0;
          v38 = &v37;
          uint64_t v39 = 0x2020000000;
          v20 = (void (*)(void))off_1010D6BC0;
          v40 = off_1010D6BC0;
          if (!off_1010D6BC0)
          {
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = sub_1000845F8;
            v43 = &unk_100FC34A0;
            v44 = &v37;
            objc_super v21 = (void *)sub_100028F70();
            v22 = dlsym(v21, "MCDMusicGeneralLogging");
            *(void *)(v44[1] + 24) = v22;
            off_1010D6BC0 = *(_UNKNOWN **)(v44[1] + 24);
            v20 = (void (*)(void))v38[3];
          }
          _Block_object_dispose(&v37, 8);
          if (!v20)
          {
            sub_100D691B8();
            __break(1u);
          }
          v12 = v20();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = objc_opt_class();
            *(_DWORD *)buf = v29;
            *(void *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v30;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Wrong kind (%{public}@) of child found in childrenOfItemAtIndexPath at %{public}@", buf, 0x16u);
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v6);
  }

  id v27 = [v32 copy];

  return v27;
}

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  v3 = [(MCDBrowseContentManager *)self itemAtIndexPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 displaysAsGridCellInCarPlay];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (int64_t)maximumNumberOfItemsForDisplay
{
  v12.receiver = self;
  v12.super_class = (Class)MCDBrowseContentManager;
  int64_t v3 = [(MCDFuseContentManager *)&v12 maximumNumberOfItemsForDisplay];
  unsigned __int8 v4 = [(MCDFuseContentManager *)self lastReceivedResponse];
  id v5 = [v4 request];

  uint64_t v6 = [v5 loadAdditionalContentURL];
  if (v6)
  {
    long long v7 = (void *)v6;
    uint64_t v8 = [(MCDFuseContentManager *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(MCDFuseContentManager *)self delegate];
      unsigned int v10 = [v9 showRankedList];

      if (v10)
      {
        if ([(MCDFuseContentManager *)self limitedUI]) {
          int64_t v3 = 11;
        }
        else {
          int64_t v3 = 20;
        }
      }
    }
    else
    {
    }
  }

  return v3;
}

- (id)cellTitleAtIndexPath:(id)a3
{
  int64_t v3 = [(MCDBrowseContentManager *)self itemAtIndexPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v4 = [v3 title];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)_initiatePlaybackForItem:(id)a3
{
  id v18 = a3;
  switch((unint64_t)[v18 itemType])
  {
    case 1uLL:
      unsigned __int8 v4 = [(MCDFuseContentManager *)self playbackManager];
      id v5 = [v18 album];
      uint64_t v6 = [(MCDFuseContentManager *)self viewController];
      long long v7 = [v6 combinedPlayActivityFeatureName];
      [v4 initiatePlaybackForAlbum:v5 lastResponse:0 shuffled:0 playActivityFeatureName:v7];
      goto LABEL_11;
    case 4uLL:
      unsigned __int8 v4 = [(MCDFuseContentManager *)self playbackManager];
      id v5 = [v18 playlist];
      uint64_t v6 = [(MCDFuseContentManager *)self viewController];
      long long v7 = [v6 combinedPlayActivityFeatureName];
      [v4 initiatePlaybackForPlaylist:v5 lastResponse:0 shuffled:0 playActivityFeatureName:v7];
      goto LABEL_11;
    case 5uLL:
      unsigned __int8 v4 = [(MCDFuseContentManager *)self playbackManager];
      id v5 = [v18 radioStation];
      uint64_t v6 = [(MCDFuseContentManager *)self viewController];
      long long v7 = [v6 combinedPlayActivityFeatureName];
      [v4 initiatePlaybackForRadioStation:v5 lastResponse:0 shuffled:0 playActivityFeatureName:v7];
      goto LABEL_11;
    case 7uLL:
      uint64_t v8 = [(MCDFuseContentManager *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        unsigned int v10 = [(MCDFuseContentManager *)self delegate];
        id v11 = [v10 queueListForPlayback];
      }
      else
      {
        id v11 = 0;
      }
      objc_super v12 = [(MCDFuseContentManager *)self lastReceivedResponse];
      v13 = [v12 results];
      unsigned __int8 v4 = [v13 itemsInSectionAtIndex:0];

      v14 = [(MCDFuseContentManager *)self lastReceivedResponse];
      unint64_t v15 = [(MCDFuseContentManager *)self allowedNumberOfItemsForDisplayWithResponse:v14 inSection:0];

      if (v15 <= (unint64_t)[v4 count])
      {
        uint64_t v16 = [v4 subarrayWithRange:0, v15];

        unsigned __int8 v4 = (void *)v16;
      }
      id v5 = [(MCDFuseContentManager *)self playbackManager];
      uint64_t v6 = [v18 song];
      long long v7 = [(MCDFuseContentManager *)self viewController];
      v17 = [v7 combinedPlayActivityFeatureName];
      [v5 initiatePlaybackForSong:v6 useResultsAsPlaybackQueue:v11 itemList:v4 playActivityFeatureName:v17];

LABEL_11:
      break;
    default:
      break;
  }
}

- (id)_modelRequest
{
  id v3 = objc_alloc_init((Class)MPModelStoreBrowseRequest);
  [v3 setFilteringPolicy:1];
  unsigned __int8 v4 = [(MCDFuseContentManager *)self dataSource];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(MCDFuseContentManager *)self dataSource];
    long long v7 = [v6 parentSection];
    [v3 configureWithParentSection:v7];
  }
  uint64_t v8 = [(MCDFuseContentManager *)self dataSource];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    unsigned int v10 = [(MCDFuseContentManager *)self dataSource];
    [v3 setDomain:[v10 domain]];
  }
  if ([v3 domain] != (id)1)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    id v11 = (void *)qword_1010D6BD0;
    uint64_t v22 = qword_1010D6BD0;
    if (!qword_1010D6BD0)
    {
      objc_super v12 = (void *)sub_100028F70();
      v20[3] = (uint64_t)dlsym(v12, "MCDMusicCarPlayBundleIdentifier");
      qword_1010D6BD0 = v20[3];
      id v11 = (void *)v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (v11)
    {
      [v3 setClientIdentifier:*v11];
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      v13 = (void *)qword_1010D6BD8;
      uint64_t v22 = qword_1010D6BD8;
      if (!qword_1010D6BD8)
      {
        v14 = (void *)sub_100028F70();
        v20[3] = (uint64_t)dlsym(v14, "MCDMusicCarPlayVersion");
        qword_1010D6BD8 = v20[3];
        v13 = (void *)v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (v13)
      {
        [v3 setClientVersion:*v13];
        uint64_t v19 = 0;
        v20 = &v19;
        uint64_t v21 = 0x2020000000;
        unint64_t v15 = (void *)qword_1010D6BE0;
        uint64_t v22 = qword_1010D6BE0;
        if (!qword_1010D6BE0)
        {
          uint64_t v16 = (void *)sub_100028F70();
          v20[3] = (uint64_t)dlsym(v16, "MCDMusicCarPlayPlatformIdentifier");
          qword_1010D6BE0 = v20[3];
          unint64_t v15 = (void *)v20[3];
        }
        _Block_object_dispose(&v19, 8);
        if (v15)
        {
          [v3 setClientPlatformIdentifier:*v15];
          [v3 setRequestEndpoint:1];
          [v3 setAuthenticationOptions:1];
          goto LABEL_16;
        }
LABEL_21:
        id v18 = (_Unwind_Exception *)sub_100D691B8();
        _Block_object_dispose(&v19, 8);
        _Unwind_Resume(v18);
      }
    }
    else
    {
      sub_100D691B8();
    }
    sub_100D691B8();
    goto LABEL_21;
  }
LABEL_16:

  return v3;
}

- (id)_queueName
{
  return @"com.apple.MusicCarDisplayUI.MCDBrowseContentManager.operationQueue";
}

@end