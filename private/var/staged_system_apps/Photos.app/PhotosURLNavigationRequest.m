@interface PhotosURLNavigationRequest
- (NSURL)destinationURL;
- (PHPhotoLibrary)photoLibrary;
- (PXRootLibraryNavigationController)rootController;
- (PhotosURLNavigationRequest)initWithDestinationURL:(id)a3 rootController:(id)a4;
- (id)_albumForKnownName:(id)a3 orUUID:(id)a4 requestIsValid:(BOOL *)a5;
- (id)_uuidFromURLParams:(id)a3 prefix:(id)a4;
- (unint64_t)state;
- (void)_contextDidFinishMerge:(id)a3;
- (void)_finishNavigationSuccessfully:(BOOL)a3;
- (void)_navigateAllowingRetry:(BOOL)a3;
- (void)_processPendingNavigation;
- (void)_rootUpdatedAvailableDestinations:(id)a3;
- (void)_schedulePendingNavigation;
- (void)cancelPendingNavigation;
- (void)dealloc;
- (void)navigateAllowingRetry:(BOOL)a3 completion:(id)a4;
- (void)setPhotoLibrary:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation PhotosURLNavigationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);

  objc_storeStrong(&self->_navigationCompletionHandler, 0);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXRootLibraryNavigationController)rootController
{
  return self->_rootController;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)_rootUpdatedAvailableDestinations:(id)a3
{
}

- (void)_contextDidFinishMerge:(id)a3
{
}

- (void)_finishNavigationSuccessfully:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 4;
  }
  [(PhotosURLNavigationRequest *)self setState:v5];
  id navigationCompletionHandler = self->_navigationCompletionHandler;
  if (navigationCompletionHandler)
  {
    v8 = (void (**)(id, BOOL))objc_retainBlock(navigationCompletionHandler);
    id v7 = self->_navigationCompletionHandler;
    self->_id navigationCompletionHandler = 0;

    v8[2](v8, v3);
  }
}

- (void)_processPendingNavigation
{
  if ((id)[(PhotosURLNavigationRequest *)self state] == (id)2)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"cancelPendingNavigation" object:0];
    [(PhotosURLNavigationRequest *)self setState:3];
    [(PhotosURLNavigationRequest *)self _navigateAllowingRetry:0];
  }
}

- (void)_schedulePendingNavigation
{
  [(PhotosURLNavigationRequest *)self setState:2];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"cancelPendingNavigation" object:0];
  [(PhotosURLNavigationRequest *)self performSelector:"cancelPendingNavigation" withObject:0 afterDelay:3.0];
  id v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v3 = PLManagedObjectContextFinishedRemoteMergeNotification;
  v4 = +[PLPhotoLibrary systemPhotoLibrary];
  uint64_t v5 = [v4 managedObjectContext];
  [v6 addObserver:self selector:"_contextDidFinishMerge:" name:v3 object:v5];

  [v6 addObserver:self selector:"_rootUpdatedAvailableDestinations:" name:PXRootLibraryNavigationControllerUpdatedAvailableDestinations object:self->_rootController];
}

- (void)cancelPendingNavigation
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"cancelPendingNavigation" object:0];
  if ((id)[(PhotosURLNavigationRequest *)self state] == (id)2)
  {
    [(PhotosURLNavigationRequest *)self _finishNavigationSuccessfully:0];
  }
}

- (void)navigateAllowingRetry:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = [a4 copy];
  id navigationCompletionHandler = self->_navigationCompletionHandler;
  self->_id navigationCompletionHandler = v6;

  [(PhotosURLNavigationRequest *)self _navigateAllowingRetry:v4];
}

- (id)_uuidFromURLParams:(id)a3 prefix:(id)a4
{
  id v5 = a3;
  id v6 = (__CFString *)a4;
  if (v6) {
    CFStringRef v7 = v6;
  }
  else {
    CFStringRef v7 = &stru_1000654D8;
  }
  v8 = +[NSString stringWithFormat:@"%@%@", v7, @"identifier"];
  uint64_t v9 = [v5 objectForKeyedSubscript:v8];
  if (v9)
  {
    v10 = (void *)v9;
  }
  else
  {
    uint64_t v11 = +[NSString stringWithFormat:@"%@%@", v7, @"localidentifier"];

    v10 = [v5 objectForKeyedSubscript:v11];
    v8 = (void *)v11;
  }
  if ([v10 length])
  {
    v12 = +[PHObject uuidFromLocalIdentifier:v10];
  }
  else
  {
    v13 = +[NSString stringWithFormat:@"%@%@", v7, @"uuid"];
    v12 = [v5 objectForKeyedSubscript:v13];
  }

  return v12;
}

- (void)_navigateAllowingRetry:(BOOL)a3
{
  BOOL v72 = a3;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  char v81 = 0;
  BOOL v77 = 0;
  BOOL v4 = [(PhotosURLNavigationRequest *)self rootController];
  id v5 = [(PhotosURLNavigationRequest *)self destinationURL];
  id v6 = [v5 host];
  CFStringRef v7 = [v5 query];
  v8 = [v7 queryKeysAndValues];

  +[PXAnalyticsURLNavigationUtilities sendNavigationStartEventForURL:v5];
  [(PhotosURLNavigationRequest *)self setState:1];
  if (![v6 isEqualToString:@"oneyearago"])
  {
    if ([v6 isEqualToString:@"contentmode"])
    {
      v71 = [v8 objectForKeyedSubscript:@"id"];
      v10 = [&off_1000683E8 objectForKeyedSubscript:];
      id v11 = v10;
      if (v10)
      {
        BOOL v77 = 1;
        uint64_t v12 = (uint64_t)[v10 integerValue];
        unsigned __int8 v13 = [v4 contentModeIsAvailableForNavigation:v12];
        *((unsigned char *)v79 + 24) = v13;
        if (v13)
        {
LABEL_9:
          [v4 navigateToContentMode:v12 animated:0 completion:0];
          goto LABEL_10;
        }
        if (v12 == 6)
        {
          uint64_t v12 = 6;
          goto LABEL_9;
        }
      }
LABEL_10:

      goto LABEL_47;
    }
    if ([v6 isEqualToString:@"album"])
    {
      v71 = [v8 objectForKeyedSubscript:@"name"];
      v14 = [(PhotosURLNavigationRequest *)self _uuidFromURLParams:v8 prefix:0];
      v70 = v8;
      v15 = [(PhotosURLNavigationRequest *)self _uuidFromURLParams:v8 prefix:@"revealasset"];
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_100040B08;
      v74[3] = &unk_1000645D8;
      v76 = &v78;
      id v16 = v4;
      id v75 = v16;
      v17 = objc_retainBlock(v74);
      v18 = [(PhotosURLNavigationRequest *)self _albumForKnownName:v71 orUUID:v14 requestIsValid:&v77];
      if (v18 && [v16 albumIsAvailableForNavigation:v18])
      {
        if ([v15 length])
        {
          v19 = +[PLPhotoLibrary systemPhotoLibrary];
          v68 = [v19 assetWithUUID:v15];

          if (v15)
          {
            unsigned int v20 = [v16 assetIsAvailableForNavigation:v68 inAlbum:v18];
            *((unsigned char *)v79 + 24) = v20;
            if (v20) {
              [v16 navigateToRevealAsset:v68 inAlbum:v18 animated:0];
            }
          }
          else
          {
            *((unsigned char *)v79 + 24) = 0;
          }
        }
        else
        {
          *((unsigned char *)v79 + 24) = 1;
          [v16 navigateToAlbum:v18 animated:0 completion:0];
        }
      }
      else
      {
        ((void (*)(void *))v17[2])(v17);
      }

      goto LABEL_45;
    }
    if ([v6 isEqualToString:@"people"])
    {
      v71 = [(PhotosURLNavigationRequest *)self _uuidFromURLParams:v8 prefix:0];
      [v4 navigateToPeopleAlbumAnimated:0 revealPersonWithLocalIdentifier:v71 completion:0];
      goto LABEL_47;
    }
    if ([v6 isEqualToString:@"places"])
    {
      [v4 navigateToPlacesAlbumAnimated:0];
      BOOL v21 = 0;
LABEL_80:
      [(PhotosURLNavigationRequest *)self _finishNavigationSuccessfully:v21];
      goto LABEL_81;
    }
    if ([v6 isEqualToString:@"asset"])
    {
      v71 = [(PhotosURLNavigationRequest *)self _uuidFromURLParams:v8 prefix:0];
      v22 = [v8 objectForKeyedSubscript:@"url"];
      v23 = [v8 objectForKeyedSubscript:@"albumname"];
      v70 = v8;
      v24 = [(PhotosURLNavigationRequest *)self _uuidFromURLParams:v8 prefix:@"album"];
      buf[0] = 1;
      if ([v23 length] || objc_msgSend(v24, "length"))
      {
        v25 = [(PhotosURLNavigationRequest *)self _albumForKnownName:v23 orUUID:v24 requestIsValid:buf];
      }
      else
      {
        v25 = 0;
      }
      if (buf[0])
      {
        if (![v71 length] && objc_msgSend(v22, "length"))
        {
          v26 = v22;
          v27 = +[NSURL URLWithString:v22];
          uint64_t v28 = +[PLManagedAsset uuidFromAssetURL:v27];

          v71 = (void *)v28;
          v22 = v26;
        }
        v29 = v22;
        BOOL v77 = [v71 length] != 0;
        v30 = +[PLPhotoLibrary systemPhotoLibrary];
        v31 = [v30 assetWithUUID:v71];

        if (v31)
        {
          unsigned int v32 = [v4 assetIsAvailableForNavigation:v31 inAlbum:v25];
          *((unsigned char *)v79 + 24) = v32;
          if (v32) {
            [v4 navigateToAsset:v31 inAlbum:v25 animated:0];
          }
        }
        else
        {
          *((unsigned char *)v79 + 24) = 0;
        }

        v22 = v29;
      }

      goto LABEL_46;
    }
    if ([v6 isEqualToString:@"comment"])
    {
      v71 = [v8 objectForKeyedSubscript:@"cloudguid"];
      v33 = [(PhotosURLNavigationRequest *)self _uuidFromURLParams:v8 prefix:@"asset"];
      BOOL v77 = 0;
      if ([v71 length] && objc_msgSend(v33, "length"))
      {
        BOOL v77 = 1;
        v34 = +[PLPhotoLibrary systemPhotoLibrary];
        v35 = +[PLCloudSharedComment cloudSharedCommentWithGUID:v71 inLibrary:v34];

        v36 = +[PLPhotoLibrary systemPhotoLibrary];
        v37 = [v36 assetWithUUID:v33];

        if (v37 && v35)
        {
          unsigned int v38 = [v4 commentIsAvailableForNavigation:v35 inAsset:v37];
          *((unsigned char *)v79 + 24) = v38;
          if (v38) {
            [v4 navigateToComment:v35 forAsset:v37 animated:0];
          }
        }
        else
        {
          *((unsigned char *)v79 + 24) = 0;
        }
      }
      goto LABEL_47;
    }
    if (![v6 isEqualToString:@"cloudfeed"])
    {
      if (![v6 isEqualToString:@"memory"])
      {
        if ([v6 isEqualToString:@"search"]
          && ([v5 scheme],
              v41 = objc_claimAutoreleasedReturnValue(),
              unsigned int v42 = [v41 isEqualToString:@"photos-navigation"],
              v41,
              v42))
        {
          BOOL v77 = 1;
          unsigned int v43 = [v4 contentModeIsAvailableForNavigation:12];
          *((unsigned char *)v79 + 24) = v43;
          if (!v43) {
            goto LABEL_48;
          }
          v71 = [v8 objectForKeyedSubscript:@"hashtag"];
          id v11 = [v8 objectForKeyedSubscript:@"searchterm"];
          v44 = [v8 objectForKeyedSubscript:@"searchcategory"];
          if ([v11 length] && objc_msgSend(v44, "length"))
          {
            v45 = [v11 componentsSeparatedByString:@","];
            v46 = [v44 componentsSeparatedByString:@","];
            [v4 navigateToSearchWithTerms:v45 searchCategories:v46];
          }
          else if ([v71 length])
          {
            [v4 navigateToSearchWithHashtag:v71];
          }
        }
        else if ([v6 isEqualToString:@"allAlbums"] {
               && ([v5 scheme],
        }
                   v47 = objc_claimAutoreleasedReturnValue(),
                   unsigned int v48 = [v47 isEqualToString:@"photos-navigation"],
                   v47,
                   v48))
        {
          v49 = [(PhotosURLNavigationRequest *)self photoLibrary];
          v50 = [v49 px_virtualCollections];
          v71 = [v50 rootAlbumCollectionList];

          id v11 = [objc_alloc((Class)PXProgrammaticNavigationDestination) initWithObject:v71 revealMode:0];
          [v4 navigateToDestination:v11 options:0 completionHandler:&stru_100064618];
        }
        else
        {
          if (![v6 isEqualToString:@"allSharedAlbums"]) {
            goto LABEL_79;
          }
          v51 = [v5 scheme];
          unsigned int v52 = [v51 isEqualToString:@"photos-navigation"];

          if (!v52) {
            goto LABEL_79;
          }
          v53 = [(PhotosURLNavigationRequest *)self photoLibrary];
          v54 = [v53 px_virtualCollections];
          v71 = [v54 sharedAlbumsCollectionList];

          id v11 = [objc_alloc((Class)PXProgrammaticNavigationDestination) initWithObject:v71 revealMode:0];
          [v4 navigateToDestination:v11 options:0 completionHandler:&stru_100064638];
        }
        goto LABEL_10;
      }
      v40 = PLUIGetLog();
      v71 = v40;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "'memory' navigation URL scheme is now handled using PXProgrammaticNavigation", buf, 2u);
      }
LABEL_47:

      if (v77) {
        goto LABEL_48;
      }
LABEL_79:
      BOOL v21 = 0;
      goto LABEL_80;
    }
    BOOL v77 = 1;
    v71 = [(PhotosURLNavigationRequest *)self _uuidFromURLParams:v8 prefix:@"asset"];
    v14 = [v8 objectForKeyedSubscript:@"commentguid"];
    v39 = [(PhotosURLNavigationRequest *)self _uuidFromURLParams:v8 prefix:@"revealasset"];
    if ([v39 length])
    {
      if ([v71 length])
      {
        int v67 = 0;
        BOOL v77 = 0;
      }
      else
      {
        id v55 = v39;

        int v67 = 1;
        v71 = v55;
      }
    }
    else
    {
      int v67 = 0;
    }
    v70 = v8;
    v56 = [v8 objectForKeyedSubscript:@"revealcommentguid"];
    if ([v56 length])
    {
      if ([v14 length])
      {
        BOOL v77 = 0;
      }
      else
      {
        id v57 = v56;

        int v67 = 1;
        v14 = v57;
      }
    }
    v58 = [(PhotosURLNavigationRequest *)self _uuidFromURLParams:v70 prefix:@"invitationalbum"];
    v69 = v39;
    if ([v14 length])
    {
      v59 = +[PLPhotoLibrary systemPhotoLibrary];
      v60 = +[PLCloudSharedComment cloudSharedCommentWithGUID:v14 inLibrary:v59];

      if (v60)
      {
        unsigned int v61 = [v4 cloudFeedCommentIsAvailableForNavigation:v60];
        *((unsigned char *)v79 + 24) = v61;
        if (v61)
        {
          if (v67) {
            [v4 navigateToRevealCloudFeedComment:v60 completion:0];
          }
          else {
            [v4 navigateToCloudFeedComment:v60 completion:0];
          }
        }
        goto LABEL_108;
      }
    }
    else
    {
      if (![v71 length])
      {
        if (![v58 length])
        {
          unsigned int v66 = [v4 cloudFeedIsAvailableForNavigation];
          *((unsigned char *)v79 + 24) = v66;
          if (v66) {
            [v4 navigateToCloudFeedWithCompletion:0];
          }
          goto LABEL_109;
        }
        v64 = +[PLPhotoLibrary systemPhotoLibrary];
        v60 = [v64 albumWithUuid:v58];

        unsigned int v65 = [v4 cloudFeedInvitationForAlbumIsAvailableForNavigation:v60];
        *((unsigned char *)v79 + 24) = v65;
        if (v65) {
          [v4 navigateToRevealCloudFeedInvitationForAlbum:v60 completion:0];
        }
LABEL_108:

        v39 = v69;
LABEL_109:

LABEL_45:
LABEL_46:
        v8 = v70;
        goto LABEL_47;
      }
      v62 = +[PLPhotoLibrary systemPhotoLibrary];
      v60 = [v62 assetWithUUID:v71];

      if (v60)
      {
        unsigned int v63 = [v4 cloudFeedAssetIsAvailableForNavigation:v60];
        *((unsigned char *)v79 + 24) = v63;
        if (v63)
        {
          if (v67) {
            [v4 navigateToRevealCloudFeedAsset:v60 completion:0];
          }
          else {
            [v4 navigateToCloudFeedAsset:v60 completion:0];
          }
        }
        goto LABEL_108;
      }
    }
    v60 = 0;
    *((unsigned char *)v79 + 24) = 0;
    goto LABEL_108;
  }
  BOOL v77 = 1;
  unsigned int v9 = [v4 contentModeIsAvailableForNavigation:12];
  *((unsigned char *)v79 + 24) = v9;
  if (v9) {
    [v4 navigateToOneYearAgoSearch];
  }
LABEL_48:
  if (*((unsigned char *)v79 + 24) || !v72)
  {
    BOOL v21 = *((unsigned __int8 *)v79 + 24) != 0;
    goto LABEL_80;
  }
  [(PhotosURLNavigationRequest *)self _schedulePendingNavigation];
LABEL_81:
  +[PXAnalyticsURLNavigationUtilities sendNavigationEndEventForURL:v5];

  _Block_object_dispose(&v78, 8);
}

- (id)_albumForKnownName:(id)a3 orUUID:(id)a4 requestIsValid:(BOOL *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 length])
  {
    unsigned int v9 = +[PLPhotoLibrary systemPhotoLibrary];
    if (([v7 isEqualToString:@"camera-roll"] & 1) != 0
      || [v7 isEqualToString:@"recents"])
    {
      uint64_t v10 = +[PLGenericAlbum userLibraryAlbumInLibrary:v9];
    }
    else if ([v7 isEqualToString:@"last-imported"])
    {
      uint64_t v10 = [v9 lastImportedPhotosAlbumCreateIfNeeded:0];
    }
    else if ([v7 isEqualToString:@"all-imported"])
    {
      uint64_t v10 = [v9 allImportedPhotosAlbumCreateIfNeeded:0];
    }
    else
    {
      if (![v7 isEqualToString:@"photo-library"])
      {
        if ([v7 isEqualToString:@"favorites"])
        {
          v14 = [v9 managedObjectContext];
          uint64_t v15 = 1609;
        }
        else
        {
          if (![v7 isEqualToString:@"recently-deleted"])
          {
            BOOL v11 = 0;
            uint64_t v12 = 0;
LABEL_17:

            if (!a5) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
          v14 = [v9 managedObjectContext];
          uint64_t v15 = 1612;
        }
        uint64_t v12 = +[PLGenericAlbum albumWithKind:v15 inManagedObjectContext:v14];

LABEL_16:
        BOOL v11 = 1;
        goto LABEL_17;
      }
      uint64_t v10 = +[PLGenericAlbum iTunesLibraryAlbumInLibrary:v9];
    }
LABEL_15:
    uint64_t v12 = (void *)v10;
    goto LABEL_16;
  }
  if ([v8 length])
  {
    unsigned int v9 = +[PLPhotoLibrary systemPhotoLibrary];
    uint64_t v10 = [v9 albumWithUuid:v8];
    goto LABEL_15;
  }
  BOOL v11 = 0;
  uint64_t v12 = 0;
  if (a5) {
LABEL_18:
  }
    *a5 = v11;
LABEL_19:

  return v12;
}

- (void)setState:(unint64_t)a3
{
  unint64_t state = self->_state;
  switch(a3)
  {
    case 1uLL:
      if (state > 3 || state == 1) {
        goto LABEL_13;
      }
      break;
    case 2uLL:
      if (state >= 2) {
        goto LABEL_13;
      }
      break;
    case 3uLL:
      if (state != 2) {
        goto LABEL_13;
      }
      break;
    case 4uLL:
      if (state >= 3) {
        goto LABEL_13;
      }
      break;
    case 5uLL:
      if (state != 1) {
        goto LABEL_13;
      }
      break;
    default:
LABEL_13:
      id v8 = +[NSAssertionHandler currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"PhotosURLNavigationRequest.m" lineNumber:118 description:@"Invalid state transition %lu -> %lu", state, a3];

      break;
  }
  self->_unint64_t state = a3;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:PLManagedObjectContextFinishedRemoteMergeNotification object:0];
  [v3 removeObserver:self name:PXRootLibraryNavigationControllerUpdatedAvailableDestinations object:0];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"cancelPendingNavigation" object:0];

  v4.receiver = self;
  v4.super_class = (Class)PhotosURLNavigationRequest;
  [(PhotosURLNavigationRequest *)&v4 dealloc];
}

- (PhotosURLNavigationRequest)initWithDestinationURL:(id)a3 rootController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PhotosURLNavigationRequest;
  unsigned int v9 = [(PhotosURLNavigationRequest *)&v17 init];
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        uint64_t v10 = [v8 photoLibrary];
        photoLibrary = v9->_photoLibrary;
        v9->_photoLibrary = (PHPhotoLibrary *)v10;

        uint64_t v12 = (NSURL *)[v7 copy];
        destinationURL = v9->_destinationURL;
        v9->_destinationURL = v12;

        objc_storeStrong((id *)&v9->_rootController, a4);
        v9->_unint64_t state = 0;
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v15 = +[NSAssertionHandler currentHandler];
      [v15 handleFailureInMethod:a2, v9, @"PhotosURLNavigationRequest.m", 65, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

      if (v8) {
        goto LABEL_4;
      }
    }
    id v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, v9, @"PhotosURLNavigationRequest.m", 66, @"Invalid parameter not satisfying: %@", @"rootController" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

@end