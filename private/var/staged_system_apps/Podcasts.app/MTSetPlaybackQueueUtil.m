@interface MTSetPlaybackQueueUtil
+ (BOOL)_setManifest:(id)a3 playerController:(id)a4 queueType:(int64_t)a5 startPlayback:(BOOL)a6 forceLocal:(BOOL)a7 reason:(unint64_t)a8 interactive:(BOOL)a9 completion:(id)a10;
+ (BOOL)_setPlaybackQueueForMyPodcastsWithOrder:(int64_t)a3 playerController:(id)a4 startPlayback:(BOOL)a5 forceLocal:(BOOL)a6 reason:(unint64_t)a7 interactive:(BOOL)a8 completion:(id)a9;
+ (BOOL)_setPlaybackQueueFromStoreForPodcastAdamId:(id)a3 playerController:(id)a4 siriAssetInfo:(id)a5 savePlayHistory:(BOOL)a6 playbackOrder:(int64_t)a7 startPlayback:(BOOL)a8 reason:(unint64_t)a9 interactive:(BOOL)a10 completion:(id)a11;
+ (BOOL)setAutoResumePlaybackQueueAndStartPlayback:(BOOL)a3 playerController:(id)a4 forceLocal:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8;
+ (BOOL)setPlaybackQueueForRequest:(id)a3 playerController:(id)a4 siriAssetInfo:(id)a5 enqueuer:(id)a6 savePlayHistory:(BOOL)a7 startPlayback:(BOOL)a8 forceLocal:(BOOL)a9 isMagicMoment:(BOOL)a10 completion:(id)a11;
+ (BOOL)subscribeWithCommandURL:(id)a3 siriAssetInfo:(id)a4 requester:(id)a5 completion:(id)a6;
+ (id)queueCommandCustomStatusForRequestStatus:(int64_t)a3 queueType:(int64_t)a4;
+ (int64_t)_automaticCommandStatusForRequestStatus:(int64_t)a3;
+ (int64_t)queueCommandStatusForRequestStatus:(int64_t)a3 queueType:(int64_t)a4;
+ (int64_t)subscribeCommandStatusForErrorCode:(int64_t)a3;
@end

@implementation MTSetPlaybackQueueUtil

+ (BOOL)setPlaybackQueueForRequest:(id)a3 playerController:(id)a4 siriAssetInfo:(id)a5 enqueuer:(id)a6 savePlayHistory:(BOOL)a7 startPlayback:(BOOL)a8 forceLocal:(BOOL)a9 isMagicMoment:(BOOL)a10 completion:(id)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  id v16 = a3;
  id v17 = a4;
  id v70 = a5;
  id v18 = a6;
  id v19 = a11;
  id v20 = [v16 playQueueType];
  if (!v16 || !v20)
  {
    if (v19) {
      (*((void (**)(id, void, void))v19 + 2))(v19, 0, 0);
    }
    goto LABEL_10;
  }
  BOOL v68 = v11;
  v21 = +[MTReachability sharedInstance];
  unsigned __int8 v22 = [v21 isReachable];

  if ((v22 & 1) == 0
    && +[PFClientUtil isRunningOnHomepod])
  {
    v23 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No network connection for Homepod playback request.", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, uint64_t, void))v19 + 2))(v19, 11, 0);
LABEL_10:
    unsigned __int8 v24 = 0;
    goto LABEL_11;
  }
  unsigned int v26 = +[PFClientUtil isRunningOnHomepod];
  if (v18 && v26)
  {
    v27 = _MTLogCategoryMediaRemote();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Overriding active account, enqueuer: %@", (uint8_t *)&buf, 0xCu);
    }

    v28 = +[MTAccountController sharedInstance];
    [v28 setAccountOverride:v18];
  }
  else
  {
    v29 = +[MTAccountController sharedInstance];
    [v29 setAccountOverride:0];
  }
  id v67 = [v16 playReason];
  if ([v16 playQueueType] != (id)1)
  {
    if ([v16 playQueueType] != (id)2)
    {
      if ([v16 playQueueType] != (id)3)
      {
        if (v19)
        {
          (*((void (**)(id, void, void))v19 + 2))(v19, 0, 0);
          v46 = _MTLogCategoryMediaRemote();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v47 = [v16 urlString];
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v47;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Unexpected command: %@", (uint8_t *)&buf, 0xCu);
          }
        }
        goto LABEL_10;
      }
      v40 = _MTLogCategoryPlayback();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "setPlaybackQueueForRequest for type MTURLPlayCommandQueueTypeStation", (uint8_t *)&buf, 2u);
      }

      v41 = [v16 stationUuid];
      v42 = [v16 episodeUuid];
      if (+[PFClientUtil isRunningOnHomepod])
      {
        v43 = [[MTNetworkMediaManifest alloc] initWithStationId:v41 assetInfo:v70];
        [(MTPlayerManifest *)v43 setNetworkUPPEnabled:v12];
        uint64_t v44 = 8;
      }
      else
      {
        if (v42) {
          +[MTPlaybackQueueFactory playStationUuid:v41 episodeUuid:v42 limit:0x7FFFFFFFFFFFFFFFLL];
        }
        else {
        v43 = +[MTPlaybackQueueFactory playStationUuid:v41 limit:0x7FFFFFFFFFFFFFFFLL];
        }
        uint64_t v44 = 4;
      }
      if (a10)
      {
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_1001364C4;
        v71[3] = &unk_100552AB8;
        v72 = v43;
        id v73 = v17;
        id v74 = v19;
        v59 = v43;
        [v73 setManifestAsDryRun:v59 reason:9 completion:v71];

        unsigned __int8 v24 = 1;
      }
      else
      {
        LOBYTE(v63) = 0;
        unsigned __int8 v24 = [a1 _setManifest:v43 playerController:v17 queueType:v44 startPlayback:v68 forceLocal:0 reason:v67 interactive:v63 completion:v19];
      }
      goto LABEL_11;
    }
    v31 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "setPlaybackQueueForRequest for type MTURLPlayCommandQueueTypePodcast", (uint8_t *)&buf, 2u);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v116 = 0x3032000000;
    v117 = sub_10005711C;
    v118 = sub_100057358;
    id v119 = [v16 podcastUuid];
    v32 = [v16 episodeUuid];
    uint64_t v108 = 0;
    v109 = &v108;
    uint64_t v110 = 0x3032000000;
    v111 = sub_10005711C;
    v112 = sub_100057358;
    id v113 = [v16 podcastAdamId];
    uint64_t v102 = 0;
    v103 = &v102;
    uint64_t v104 = 0x3032000000;
    v105 = sub_10005711C;
    v106 = sub_100057358;
    id v107 = [v16 episodeAdamId];
    id v65 = [v16 playbackOrder];
    uint64_t v98 = 0;
    v99 = &v98;
    uint64_t v100 = 0x2020000000;
    char v101 = 0;
    uint64_t v94 = 0;
    v95 = &v94;
    uint64_t v96 = 0x2020000000;
    char v97 = 0;
    uint64_t v90 = 0;
    v91 = &v90;
    uint64_t v92 = 0x2020000000;
    char v93 = 0;
    id v33 = [(id)v103[5] length];
    v34 = +[MTDB sharedInstance];
    v35 = [v34 mainOrPrivateContext];

    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_100136214;
    v80[3] = &unk_100552A68;
    id v36 = v35;
    id v81 = v36;
    id v37 = v32;
    id v82 = v37;
    p_long long buf = &buf;
    v85 = &v98;
    v86 = &v94;
    v87 = &v108;
    v88 = &v90;
    v89 = &v102;
    id v83 = v16;
    [v36 performBlockAndWait:v80];
    v66 = v36;
    if (*((unsigned char *)v99 + 24) || v33)
    {
      if (!*((unsigned char *)v99 + 24))
      {
LABEL_31:
        v38 = _MTLogCategoryPlayback();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v114 = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "setPlaybackQueueForRequest using MAPI to get latest episode", v114, 2u);
        }

        if ((v22 & 1) == 0)
        {
          v51 = _MTLogCategoryPlayback();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v114 = 0;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "No network connection for playback request that needs the network.", v114, 2u);
          }

          uint64_t v52 = 11;
          goto LABEL_67;
        }
        int v39 = 0;
LABEL_51:
        v50 = _MTLogCategoryPlayback();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v114 = 67109120;
          *(_DWORD *)&v114[4] = v39;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "playUsingDatabaseUuids -- %d", v114, 8u);
        }

        if (v39
          && (+[PFClientUtil isRunningOnHomepod] & 1) == 0)
        {
          *(void *)v114 = 0;
          if (*((unsigned char *)v99 + 24)
            && (+[MTPlaybackQueueFactory playEpisodeUuid:context:limit:](MTPlaybackQueueFactory, "playEpisodeUuid:context:limit:", v37, 0, 0x7FFFFFFFFFFFFFFFLL), (v56 = objc_claimAutoreleasedReturnValue()) != 0)|| (+[MTPlaybackQueueFactory playPodcastUuid:*(void *)(*((void *)&buf + 1) + 40) order:v65 limit:0x7FFFFFFFFFFFFFFFLL error:v114], v56 = objc_claimAutoreleasedReturnValue(), *(void *)v114 != 3))
          {
            if (a10)
            {
              v75[0] = _NSConcreteStackBlock;
              v75[1] = 3221225472;
              v75[2] = sub_100136434;
              v75[3] = &unk_100552A90;
              id v58 = v56;
              id v76 = v58;
              id v77 = v17;
              id v78 = v19;
              uint64_t v79 = 2;
              [v77 setManifestAsDryRun:v58 reason:9 completion:v75];

              unsigned int v54 = 0;
              char v55 = 0;
LABEL_95:
              unsigned __int8 v24 = 1;
LABEL_96:

              _Block_object_dispose(&v90, 8);
              _Block_object_dispose(&v94, 8);
              _Block_object_dispose(&v98, 8);
              _Block_object_dispose(&v102, 8);

              _Block_object_dispose(&v108, 8);
              _Block_object_dispose(&buf, 8);

              if (v55) {
                unsigned __int8 v24 = v54 != 0;
              }
              goto LABEL_11;
            }
            LOBYTE(v63) = 0;
            unsigned int v54 = [a1 _setManifest:v56 playerController:v17 queueType:2 startPlayback:v68 forceLocal:a9 reason:v67 interactive:v63 completion:v19];
          }
          else
          {
            if (v19) {
              (*((void (**)(id, uint64_t, uint64_t))v19 + 2))(v19, 4, 2);
            }
            unsigned int v54 = 0;
          }
        }
        else if ([(id)v103[5] length])
        {
          if (a10) {
            goto LABEL_65;
          }
          if (v12) {
            id v57 = +[PFClientUtil isRunningOnHomepod];
          }
          else {
            id v57 = 0;
          }
          v60 = [MTNetworkMediaManifest alloc];
          v61 = [(MTNetworkMediaManifest *)v60 initWithEpisodeAdamId:v103[5] assetInfo:v70];
          [(MTPlayerManifest *)v61 setNetworkUPPEnabled:v57];
          LOBYTE(v63) = 0;
          unsigned int v54 = [a1 _setManifest:v61 playerController:v17 queueType:8 startPlayback:v68 forceLocal:a9 reason:v67 interactive:v63 completion:v19];
        }
        else if ([(id)v109[5] length])
        {
          if (a10)
          {
LABEL_65:
            v53 = [v17 playbackQueueController];
            [v53 setMagicMomentPlayerItem:0];

            if (!v19)
            {
LABEL_68:
              unsigned int v54 = 0;
              char v55 = 0;
              unsigned __int8 v24 = 0;
              goto LABEL_96;
            }
            uint64_t v52 = 1;
LABEL_67:
            (*((void (**)(id, uint64_t, void))v19 + 2))(v19, v52, 0);
            goto LABEL_68;
          }
          LOBYTE(v64) = 0;
          unsigned int v54 = [a1 _setPlaybackQueueFromStoreForPodcastAdamId:v109[5] playerController:v17 siriAssetInfo:v70 savePlayHistory:v12 playbackOrder:v65 startPlayback:v68 reason:v67 interactive:v64 completion:v19];
        }
        else
        {
          v62 = _MTLogCategoryDefault();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v114 = 0;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Invalid queue component specification.", v114, 2u);
          }

          if (v19) {
            (*((void (**)(id, void, void))v19 + 2))(v19, 0, 0);
          }
          unsigned int v54 = 0;
        }
        char v55 = 1;
        goto LABEL_95;
      }
    }
    else if (*((unsigned char *)v91 + 24) || !*((unsigned char *)v95 + 24))
    {
      goto LABEL_31;
    }
    int v39 = 1;
    goto LABEL_51;
  }
  v30 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "setPlaybackQueueForRequest for type MTURLPlayCommandQueueTypePodcasts", (uint8_t *)&buf, 2u);
  }

  if (a10)
  {
    if (v19) {
      (*((void (**)(id, void, void))v19 + 2))(v19, 0, 0);
    }
    goto LABEL_10;
  }
  if (+[PFClientUtil isRunningOnHomepod])
  {
    v45 = [[MTNetworkMediaManifest alloc] initWithAssetInfo:v70];
    [(MTPlayerManifest *)v45 setNetworkUPPEnabled:v12];
    LOBYTE(v63) = 0;
    unsigned __int8 v24 = [a1 _setManifest:v45 playerController:v17 queueType:8 startPlayback:v68 forceLocal:a9 reason:v67 interactive:v63 completion:v19];
  }
  else
  {
    id v48 = [v16 playbackOrder];
    v49 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v48;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "setPlaybackQueueForRequest with playback order: %ld", (uint8_t *)&buf, 0xCu);
    }

    unsigned __int8 v24 = [a1 _setPlaybackQueueForMyPodcastsWithOrder:v48 playerController:v17 startPlayback:v68 forceLocal:a9 reason:v67 interactive:0 completion:v19];
  }
LABEL_11:

  return v24;
}

+ (BOOL)subscribeWithCommandURL:(id)a3 siriAssetInfo:(id)a4 requester:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = (void (**)(id, void, uint64_t))a6;
  id v12 = a3;
  v13 = [[MTURLCommandRequest alloc] initWithURLString:v12];

  if ((id)[(MTURLCommandRequest *)v13 commandType] == (id)1)
  {
    v14 = [(MTURLCommandRequest *)v13 podcastAdamId];
    v15 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v14 longLongValue]);
    if (+[MTStoreIdentifier isEmptyNumber:v15])
    {
      id v16 = [(MTURLCommandRequest *)v13 podcastFeedUrl];
      id v17 = [v16 length];

      if (!v17)
      {
        if (v11) {
          v11[2](v11, 0, 2);
        }
        BOOL v19 = 0;
        goto LABEL_18;
      }
      id v18 = [(MTURLCommandRequest *)v13 podcastFeedUrl];
      +[MTSubscribeUtil subscribeToPodcastWithFeedUrl:v18 completion:v11];
    }
    else
    {
      if (!+[PFClientUtil isRunningOnHomepod])
      {
        v21 = +[MTStoreManifest podcastStorePlatformDictionaryFromSiriAssetInfo:v9 podcastAdamId:v15];
        BOOL v19 = v21 != 0;
        if (v21)
        {
          +[MTSubscribeUtil subscribeToPodcastWithStorePlatformDictionary:v21 completion:v11];
        }
        else
        {
          unsigned __int8 v22 = objc_alloc_init(MTAddPodcastParams);
          -[MTAddPodcastParams setStoreCollectionId:](v22, "setStoreCollectionId:", [v14 longLongValue]);
          v25 = _NSConcreteStackBlock;
          uint64_t v26 = 3221225472;
          v27 = sub_1001369EC;
          v28 = &unk_10054DA50;
          v29 = v11;
          [(MTAddPodcastParams *)v22 setCompletion:&v25];
          v23 = +[MTSubscriptionManager sharedInstance];
          [v23 subscribeToPodcastWithParams:v22];
        }
        goto LABEL_18;
      }
      id v20 = +[MTSubscriptionController sharedInstance];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100136870;
      v30[3] = &unk_1005502D0;
      v31 = v11;
      [v20 subscribeToShowWithPodcastStoreId:v14 account:v10 completion:v30];
    }
    BOOL v19 = 1;
LABEL_18:

    goto LABEL_19;
  }
  if (v11) {
    v11[2](v11, 0, 2);
  }
  BOOL v19 = 0;
LABEL_19:

  return v19;
}

+ (BOOL)setAutoResumePlaybackQueueAndStartPlayback:(BOOL)a3 playerController:(id)a4 forceLocal:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8
{
  return [a1 _setPlaybackQueueForMyPodcastsWithOrder:0 playerController:a4 startPlayback:a3 forceLocal:a5 reason:a6 interactive:a7 completion:a8];
}

+ (int64_t)queueCommandStatusForRequestStatus:(int64_t)a3 queueType:(int64_t)a4
{
  if ((unint64_t)a3 > 9) {
    return 200;
  }
  else {
    return qword_10046B280[a3];
  }
}

+ (id)queueCommandCustomStatusForRequestStatus:(int64_t)a3 queueType:(int64_t)a4
{
  if (a3 == 11)
  {
    v4 = +[NSError errorWithDomain:@"MTSetPlaybackQueueUtilErrorDomain" code:-433001 userInfo:0];
    v5 = +[MPRemoteCommandStatus statusWithCode:200 error:v4];
  }
  else
  {
    v5 = +[MPRemoteCommandStatus statusWithCode:](MPRemoteCommandStatus, "statusWithCode:", +[MTSetPlaybackQueueUtil queueCommandStatusForRequestStatus:a3 queueType:a4]);
  }

  return v5;
}

+ (int64_t)subscribeCommandStatusForErrorCode:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 100;
  }
  else {
    return qword_10046B2D0[a3];
  }
}

+ (BOOL)_setPlaybackQueueForMyPodcastsWithOrder:(int64_t)a3 playerController:(id)a4 startPlayback:(BOOL)a5 forceLocal:(BOOL)a6 reason:(unint64_t)a7 interactive:(BOOL)a8 completion:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a4;
  id v16 = a9;
  if (a3)
  {
    id v17 = +[MTPlaybackQueueFactory playMyPodcastsWithOrder:a3];
    LOBYTE(v20) = a8;
    unsigned __int8 v18 = [a1 _setManifest:v17 playerController:v15 queueType:1 startPlayback:v12 forceLocal:v11 reason:a7 interactive:v20 completion:v16];
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100136C88;
    v21[3] = &unk_100552AE0;
    id v22 = v15;
    BOOL v27 = v12;
    id v23 = v16;
    uint64_t v24 = 0;
    BOOL v28 = v11;
    id v25 = a1;
    unint64_t v26 = a7;
    BOOL v29 = a8;
    [v22 restorePlayerManifestWithCompletion:v21];

    unsigned __int8 v18 = 1;
  }

  return v18;
}

+ (BOOL)_setManifest:(id)a3 playerController:(id)a4 queueType:(int64_t)a5 startPlayback:(BOOL)a6 forceLocal:(BOOL)a7 reason:(unint64_t)a8 interactive:(BOOL)a9 completion:(id)a10
{
  BOOL v11 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a10;
  id v17 = v16;
  if (v14)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100136F8C;
    v19[3] = &unk_1005512D0;
    id v20 = v16;
    int64_t v21 = a5;
    [v15 setManifest:v14 startPlayback:v11 forceLocal:0 reason:a8 interactive:a9 completion:v19];
  }
  else if (v16)
  {
    (*((void (**)(id, uint64_t, int64_t))v16 + 2))(v16, 3, a5);
  }

  return v14 != 0;
}

+ (BOOL)_setPlaybackQueueFromStoreForPodcastAdamId:(id)a3 playerController:(id)a4 siriAssetInfo:(id)a5 savePlayHistory:(BOOL)a6 playbackOrder:(int64_t)a7 startPlayback:(BOOL)a8 reason:(unint64_t)a9 interactive:(BOOL)a10 completion:(id)a11
{
  BOOL v30 = a8;
  BOOL v28 = a6;
  id v14 = a3;
  id v15 = a5;
  id v16 = a11;
  id v17 = a4;
  id v18 = [v14 longLongValue];
  BOOL v19 = +[NSNumber numberWithLongLong:v18];
  id v20 = +[MTStoreManifest podcastStorePlatformDictionaryFromSiriAssetInfo:v15 podcastAdamId:v19];

  if (v20)
  {
    int64_t v21 = [MTStoreManifest alloc];
    id v22 = +[NSNumber numberWithLongLong:v18];
    id v23 = [(MTStoreManifest *)v21 initWithPodcastAdamId:v22 siriAssetInfo:v15 oldestEpisode:a7 == 2 initiatedByAnotherUser:0];

    uint64_t v24 = 3;
  }
  else
  {
    id v23 = [[MTNetworkMediaManifest alloc] initWithPodcastAdamId:v14 assetInfo:v15];
    [(MTPlayerManifest *)v23 setNetworkUPPEnabled:v28];
    uint64_t v24 = 8;
  }
  LOBYTE(v27) = a10;
  unsigned __int8 v25 = [a1 _setManifest:v23 playerController:v17 queueType:v24 startPlayback:v30 forceLocal:0 reason:a9 interactive:v27 completion:v16];

  return v25;
}

+ (int64_t)_automaticCommandStatusForRequestStatus:(int64_t)a3
{
  if (a3 == 4) {
    return 110;
  }
  else {
    return -1;
  }
}

@end