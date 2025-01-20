uint64_t sub_100003DC8(uint64_t a1, int a2, int a3)
{
  uint64_t result;

  result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, (a3 | a2) == 0);
  }
  return result;
}

void sub_100003FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  objc_sync_exit(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

id sub_100004014(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100004040(uint64_t a1)
{
}

void sub_100004048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 | a2)
  {
    id v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v7 + 16))(v7, a2, a3, 0);
      v8 = *(void **)(a1 + 32);
      id v9 = objc_retainBlock(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
      [v8 removeObject:v9];
    }
    objc_sync_exit(v6);
  }
  dispatch_time_t v10 = dispatch_time(0, 250000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004174;
  block[3] = &unk_10002C7D0;
  block[4] = *(void *)(a1 + 40);
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100004160(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004174(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) magicMomentCompletionHandlers];
  objc_sync_enter(v2);
  v3 = [*(id *)(a1 + 32) magicMomentCompletionHandlers];
  id v4 = [v3 count];

  objc_sync_exit(v2);
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    [v5 _getNowPlayingInfoAndCallPendingCompletions];
  }
}

void sub_100004200(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004368(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10000438C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained magicMomentCompletionHandlers];

  objc_sync_enter(v6);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = objc_loadWeakRetained(v4);
  v8 = [v7 magicMomentCompletionHandlers];

  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v11) + 16))();
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  id v12 = objc_loadWeakRetained(v4);
  v13 = [v12 magicMomentCompletionHandlers];
  [v13 removeAllObjects];

  MRMediaRemoteSetWantsNowPlayingNotifications();
  objc_sync_exit(v6);
}

void sub_100004518(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100004680(uint64_t a1)
{
  MRPlaybackQueueGetContentItemAtOffset();
  MRContentItemCopyNowPlayingInfo();
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }

  return _objc_release_x1();
}

void sub_1000049D8(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    v5 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134217984;
      uint64_t v11 = a2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to set playback queue: MediaRemote command failed with MRSendCommandError: %ld", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, 2, a2);
    }
  }
  else
  {
    id v7 = [a3 firstObject];
    unsigned int v8 = [v7 unsignedIntValue];
    if (v8)
    {
      id v9 = _MTLogCategoryPlayback();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 134217984;
        uint64_t v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set playback queue: MediaRemote command failed with MRMediaRemoteCommandHandlerStatus: %ld", (uint8_t *)&v10, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_100004DCC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004E88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000051AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isSourceOfTruth] & 1) != 0
    || ([*(id *)(a1 + 32) backgroundEpisodeUuidFetches],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v3 uuid],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v4 containsObject:v5],
        v5,
        v4,
        (v6 & 1) != 0))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v3 uuid];
  }

  return v7;
}

void sub_100005250(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005320;
  block[3] = &unk_10002C8E8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

void sub_100005320(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 48));
  id v2 = objc_loadWeakRetained(&to);
  if (v2)
  {
    id v3 = v2;
    id v4 = [*(id *)(a1 + 32) count];

    if (v4)
    {
      id v5 = objc_loadWeakRetained(&to);
      id v6 = [*(id *)(a1 + 32) allObjects];
      [v5 _didFetchEpisodePropertySources:v6];
    }
  }
  id v7 = objc_loadWeakRetained(&to);
  id v8 = [v7 backgroundEpisodeUuidFetches];
  [v8 removeObjectsInArray:*(void *)(a1 + 40)];

  objc_destroyWeak(&to);
}

void sub_1000053E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

NSString *__cdecl sub_1000055FC(id a1, EpisodePropertySource *a2)
{
  return (NSString *)[(EpisodePropertySource *)a2 uuid];
}

id sub_100005604(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  id v4 = [v2 containsObject:v3];

  return v4;
}

NSString *__cdecl sub_10000564C(id a1, EpisodePropertySource *a2)
{
  return (NSString *)[(EpisodePropertySource *)a2 uuid];
}

NSString *__cdecl sub_100005654(id a1, EpisodePropertySource *a2)
{
  return (NSString *)[(EpisodePropertySource *)a2 uuid];
}

void sub_100006280(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeNotificationFromHistory];
  id v2 = [*(id *)(a1 + 32) extensionContext];
  [v2 dismissNotificationContentExtension];
}

uint64_t sub_100006478(uint64_t a1, void *a2)
{
  id v3 = [a2 podcastUuid];
  id v4 = [*(id *)(a1 + 32) podcastUuid];
  uint64_t v5 = [v3 isEqualToString:v4] ^ 1;

  return v5;
}

id sub_100007410(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

double sub_1000075D8(uint64_t a1, unint64_t a2)
{
  [*(id *)(a1 + 32) itemSize];
  double v5 = v4;
  double v6 = 0.0;
  if (a2 >= 2)
  {
    [*(id *)(a1 + 32) minimumLineSpacing];
    double v6 = v7 * (double)(a2 - 1);
  }
  [*(id *)(a1 + 32) sectionInset];
  double v9 = v6 + v5 * (double)a2 + v8;
  [*(id *)(a1 + 32) sectionInset];
  double v11 = v9 + v10;
  [*(id *)(a1 + 32) footerReferenceSize];
  return v11 + v12;
}

id *sub_100008660(id *result, uint64_t a2)
{
  if (a2) {
    return (id *)[result[4] applyImage:a2 fromSource:result[5]];
  }
  return result;
}

void sub_100008740(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) episodePropertySource];
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    [*(id *)(a1 + 32) setHasLoadedCurrentImage:[*(id *)(a1 + 40) isSourceOfTruth]];
    id v4 = [*(id *)(a1 + 32) artworkView];
    [v4 setImage:*(void *)(a1 + 48)];
  }
}

void sub_100009804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009828(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = [objc_alloc((Class)NSData) initWithContentsOfURL:v3];
      uint64_t v6 = *(void *)(a1 + 40);
      double v7 = +[UIImage imageWithData:v5];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    else
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100009958;
      v9[3] = &unk_10002CAA8;
      double v8 = *(void **)(a1 + 32);
      id v10 = *(id *)(a1 + 40);
      objc_msgSend(v8, "placeholderWithSize:completionHandler:", v9, *(double *)(a1 + 56), *(double *)(a1 + 64));
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_100009958(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009C74()
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100009DF4;
  v3[3] = &unk_10002CB60;
  id v4 = &stru_10002CB10;
  id v5 = "preferredContentSizeCategory";
  +[IMRuntimeUtil swizzleMethod:"preferredContentSizeCategory" onClass:objc_opt_class() withReplacementBlock:v3];
  v0[0] = _NSConcreteStackBlock;
  v0[1] = 3221225472;
  v0[2] = sub_100009EB4;
  v0[3] = &unk_10002CB60;
  v1 = &stru_10002CB10;
  id v2 = "preferredContentSizeCategory";
  +[IMRuntimeUtil swizzleMethod:"preferredContentSizeCategory" onClass:objc_opt_class() withReplacementBlock:v0];
}

NSString *__cdecl sub_100009D9C(id a1, id a2, SEL a3, void *a4)
{
  ((void (*)(id, SEL))a4)(a2, a3);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v4)) {
    UIContentSizeCategory v5 = UIContentSizeCategoryExtraExtraExtraLarge;
  }
  else {
    UIContentSizeCategory v5 = v4;
  }
  uint64_t v6 = v5;

  return v6;
}

IMP sub_100009DF4(uint64_t a1, uint64_t a2)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009E9C;
  v9[3] = &unk_10002CB38;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v10 = v4;
  uint64_t v11 = v5;
  uint64_t v12 = a2;
  uint64_t v6 = objc_retainBlock(v9);
  IMP v7 = imp_implementationWithBlock(v6);

  return v7;
}

uint64_t sub_100009E9C(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1[4] + 16))(a1[4], a2, a1[5], a1[6]);
}

IMP sub_100009EB4(uint64_t a1, uint64_t a2)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009F5C;
  v9[3] = &unk_10002CB38;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v10 = v4;
  uint64_t v11 = v5;
  uint64_t v12 = a2;
  uint64_t v6 = objc_retainBlock(v9);
  IMP v7 = imp_implementationWithBlock(v6);

  return v7;
}

uint64_t sub_100009F5C(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1[4] + 16))(a1[4], a2, a1[5], a1[6]);
}

NSString *__cdecl sub_10000A230(id a1, MTNotificationEpisode *a2)
{
  return [(MTNotificationEpisode *)a2 podcastUuid];
}

void sub_10000A5E8(id a1, NSLayoutConstraint *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v6 = a2;
  id v4 = [(NSLayoutConstraint *)v6 mt_dynamicTypeConstant];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 currentConstant];
    -[NSLayoutConstraint setConstant:](v6, "setConstant:");
  }
}

id sub_10000A808(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)NSURLQueryItem);
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v6 = [v4 initWithName:v3 value:v5];

  return v6;
}

id sub_10000AA5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)NSURLQueryItem);
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v6 = [v4 initWithName:v3 value:v5];

  return v6;
}

void sub_10000AB80(id a1)
{
  v3[0] = @"playPodcast";
  v3[1] = @"playPodcasts";
  v3[2] = @"playStation";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:3];
  id v2 = (void *)qword_100037378;
  qword_100037378 = v1;
}

void sub_10000B308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B320(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B330(uint64_t a1)
{
}

void sub_10000B338(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) episodeForUuid:*(void *)(a1 + 40)];
  id v2 = [v6 podcast];
  uint64_t v3 = [v2 uuid];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10000BC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000BC98(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  id v6 = [v5 firstObject];
  uint64_t v7 = [v6 uuid];
  uint64_t v8 = *(void *)(a1[7] + 8);
  double v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_10000BF08(id a1)
{
  v3[0] = @"playPodcasts";
  v3[1] = @"playPodcast";
  v4[0] = &off_10002DF80;
  v4[1] = &off_10002DF98;
  v3[2] = @"playStation";
  v4[2] = &off_10002DFB0;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  id v2 = (void *)qword_100037390;
  qword_100037390 = v1;
}

void sub_10000CCBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 56));
  _Unwind_Resume(a1);
}

void sub_10000CCF0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained podcastUuid];
  uint64_t v4 = [v2 podcastForUuid:v3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 != 0;
}

void sub_10000CEDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 56));
  _Unwind_Resume(a1);
}

void sub_10000CF10(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained episodeUuid];
  uint64_t v4 = [v2 episodeForUuid:v3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 != 0;
}

int64_t sub_10000D510(id a1, MTLineCountLayoutGroupItem *a2, MTLineCountLayoutGroupItem *a3)
{
  uint64_t v4 = a3;
  unint64_t v5 = [(MTLineCountLayoutGroupItem *)a2 sharingPriority];
  id v6 = [(MTLineCountLayoutGroupItem *)v4 sharingPriority];

  int64_t v7 = -1;
  if (v5 <= (unint64_t)v6) {
    int64_t v7 = 1;
  }
  if ((id)v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

void sub_10000DA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DA90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000DAA0(uint64_t a1)
{
}

void sub_10000DAA8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) podcastForUuid:*(void *)(a1 + 40)];
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [v2 sortDescriptorsForSortOrder];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v2 = v6;
  }
}

NSURL *__cdecl sub_10000DF98(id a1, MTPodcast *a2)
{
  return (NSURL *)[(MTPodcast *)a2 displayURL];
}

NSURL *__cdecl sub_10000E118(id a1, MTEpisode *a2)
{
  return (NSURL *)[(MTEpisode *)a2 displayURL];
}

uint64_t sub_10000E374(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10000E38C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E54C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) episodeForUuid:*(void *)(a1 + 40)];
  if (v2)
  {
    id v8 = v2;
    uint64_t v3 = [v2 uuid];
    id v4 = [v3 length];

    id v2 = v8;
    if (v4)
    {
      uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      int64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      id v2 = v8;
    }
  }
}

void sub_10000E788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E7A4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) podcastForUuid:*(void *)(a1 + 40)];
  if (v2)
  {
    id v8 = v2;
    uint64_t v3 = [v2 uuid];
    id v4 = [v3 length];

    id v2 = v8;
    if (v4)
    {
      uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      int64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      id v2 = v8;
    }
  }
}

uint64_t sub_10000ED5C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000EF14(uint64_t a1)
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10000DA90;
  v28 = sub_10000DAA0;
  id v29 = 0;
  id v2 = +[MTDB sharedInstance];
  uint64_t v3 = [v2 mainOrPrivateContext];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000F198;
  v19[3] = &unk_10002CE58;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v20 = v4;
  uint64_t v23 = v5;
  id v6 = v3;
  id v21 = v6;
  v22 = &v24;
  [v6 performBlockAndWait:v19];
  int64_t v7 = +[NSMutableSet set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = (id)v25[5];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v11);
        uint64_t v13 = [DatabaseEpisodePropertySource alloc];
        uint64_t v14 = -[DatabaseEpisodePropertySource initWithFetchedPropertyValues:](v13, "initWithFetchedPropertyValues:", v12, (void)v15);
        if (v14) {
          [v7 addObject:v14];
        }

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v30 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(&v24, 8);
}

void sub_10000F164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_10000F198(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] == (id)1)
  {
    id v2 = [*(id *)(a1 + 32) firstObject];
    +[MTEpisode predicateForEpisodeUuid:v2];
  }
  else
  {
    id v2 = +[NSSet setWithArray:*(void *)(a1 + 32)];
    +[MTEpisode predicateForEpisodeUuids:v2];
  uint64_t v3 = };

  id v4 = [*(id *)(a1 + 56) propertiesToFetch];
  uint64_t v5 = [v4 setByAddingObject:kEpisodeUuid];

  id v6 = [*(id *)(a1 + 56) computedPropertiesToFetch];
  int64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = kMTEpisodeEntityName;
  id v9 = [v5 allObjects];
  uint64_t v10 = [v7 objectDictionariesInEntity:v8 predicate:v3 sortDescriptors:0 propertiesToFetch:v9 includeObjectId:0];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000F364;
  v15[3] = &unk_10002CE30;
  id v16 = *(id *)(a1 + 40);
  id v17 = v6;
  id v11 = v6;
  uint64_t v12 = [v10 mt_compactMap:v15];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

id sub_10000F364(uint64_t a1, void *a2)
{
  uint64_t v3 = kEpisodeUuid;
  id v4 = a2;
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = [*(id *)(a1 + 32) objectDictionaryForUuid:v5 entityName:kMTEpisodeEntityName byAddingComputedProperties:*(void *)(a1 + 40) toFetchedObjectDictionary:v4];

  return v6;
}

uint64_t sub_10000FCB0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_10000FF78(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100010374;
  void v3[3] = &unk_10002CEA0;
  void v3[4] = a1;
  uint64_t v1 = sub_1000102DC(v3);

  return v1;
}

id sub_1000102DC(void *a1)
{
  id v1 = a1;
  id v2 = (void (**)(void, void, void))v1;
  if (qword_100037398 == -1)
  {
    if (v1)
    {
LABEL_3:
      uint64_t v3 = v2[2](v2, qword_1000373A0, qword_1000373A8);
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&qword_100037398, &stru_10002CEC0);
    if (v2) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
LABEL_6:

  return v3;
}

id sub_100010374(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v3 objectForKeyedSubscript:&off_10002DFE0];
  }
  uint64_t v8 = v7;

  return v8;
}

void sub_100010414(id a1)
{
  v15[0] = &off_10002DFE0;
  id v1 = +[NSString stringWithFormat:@"%@%d", @"podcastAction-", 0];
  v16[0] = v1;
  v15[1] = &off_10002DFF8;
  id v2 = +[NSString stringWithFormat:@"%@%d", @"podcastAction-", 1];
  v16[1] = v2;
  v15[2] = &off_10002E010;
  id v3 = +[NSString stringWithFormat:@"%@%d", @"podcastAction-", 2];
  v16[2] = v3;
  v15[3] = &off_10002E028;
  id v4 = +[NSString stringWithFormat:@"%@%d", @"podcastAction-", 3];
  v16[3] = v4;
  void v15[4] = &off_10002E040;
  uint64_t v5 = +[NSString stringWithFormat:@"%@%d", @"podcastAction-", 4];
  v16[4] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];
  id v7 = (void *)qword_1000373A0;
  qword_1000373A0 = v6;

  uint64_t v8 = +[NSMutableDictionary dictionary];
  id v9 = (void *)qword_1000373A0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001063C;
  v13[3] = &unk_10002CEE8;
  id v14 = v8;
  id v10 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];
  id v11 = [v10 copy];
  uint64_t v12 = (void *)qword_1000373A8;
  qword_1000373A8 = (uint64_t)v11;
}

id sub_10001063C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

id sub_10001064C(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 objectForKeyedSubscript:*(void *)(a1 + 32)];
}

void sub_100010B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010B7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100010B8C(uint64_t a1)
{
}

void sub_100010B94(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) podcastForUuid:*(void *)(a1 + 40)];
  if ([v4 hidden])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
}

void sub_100010D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010D9C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) podcastForUuid:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 56);
  id v8 = v2;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(unsigned char *)(a1 + 65)) {
      [v2 newestUserEpisodeExcludingExplicit:v3];
    }
    else {
      [v2 oldestUserEpisodeExcludingExplicit:v3];
    }
  }
  else if (*(unsigned char *)(a1 + 65))
  {
    [v2 newestEpisodeExcludingUuid:0 excludeExplicit:v3];
  }
  else
  {
    [v2 oldestEpisodeExcludingExplicit:v3];
  id v4 = };
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = v4;
  id v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;
}

void sub_100010F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010F98(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) uuid];

  return _objc_release_x1();
}

id sub_1000110A8(id a1, NSDictionary *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = [[MTNotificationEpisode alloc] initWithDictionaryRepresentation:v2];

  return v3;
}

id sub_10001131C(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_100011A44(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create(0, 0);
  uint64_t v2 = (void *)qword_1000373B8;
  qword_1000373B8 = (uint64_t)v1;

  qword_1000373C0 = +[NSMutableDictionary dictionary];

  _objc_release_x1();
}

uint64_t sub_100011AA0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011BBC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011BCC(uint64_t a1)
{
}

void sub_100011BD4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 identifier];
  uint64_t v5 = [v4 objectForKeyedSubscript:v8];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_100011CE0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v6 = +[NSNumber numberWithUnsignedInteger:v3];
  uint64_t v5 = [*(id *)(a1 + 32) identifier];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

uint64_t sub_100011FE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011FF0(uint64_t a1)
{
}

void sub_100011FF8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  if (!v2) {
    uint64_t v2 = *(void **)(v1 + 56);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void sub_1000120C8(uint64_t a1)
{
  uint64_t v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: Setting active account: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 56), *(id *)(a1 + 32));
}

void sub_1000122B4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasFetchedInitialAccount] & 1) == 0) {
    [*(id *)(a1 + 32) _updateActiveAccount];
  }
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012368;
    block[3] = &unk_10002D010;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t sub_100012368(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000126CC(uint64_t a1)
{
  uint64_t v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: updating active account", v7, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) _activeAccountBlocking];
  int v4 = [v3 ams_DSID];
  uint64_t v5 = [v4 stringValue];

  unint64_t v6 = *(void *)(a1 + 40);
  if (v6 | v5 && ([(id)v6 isEqualToString:v5] & 1) == 0) {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10002D0E0);
  }
  [*(id *)(a1 + 32) setActiveAccount:v3];
  [*(id *)(a1 + 32) setHasFetchedInitialAccount:1];
}

void sub_1000127B8(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"AccountDSIDChangedNotification" object:0];
}

uint64_t sub_100012BCC(uint64_t a1)
{
  qword_1000373D0 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _initDefault];

  return _objc_release_x1();
}

uint64_t sub_100012FF4(uint64_t a1)
{
  qword_1000373E0 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _initDefault];

  return _objc_release_x1();
}

void sub_100013C74(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___MTShowsPreferencesDataStore;
  id v1 = objc_msgSend(objc_msgSendSuper2(&v3, "allocWithZone:", 0), "init");
  uint64_t v2 = (void *)qword_1000373E8;
  qword_1000373E8 = (uint64_t)v1;
}

NSString *__cdecl sub_1000156F8(id a1, NSSortDescriptor *a2)
{
  return [(NSSortDescriptor *)a2 key];
}

void sub_100015E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015E78(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  objc_super v3 = +[MTRecencyUtil upNextForPodcastUuid:v2 excludeExplicit:0 ctx:*(void *)(a1 + 40)];

  int v4 = [v3 episodeUuid];
  uint64_t v5 = [*(id *)(a1 + 32) nextEpisodeUuid];
  unint64_t v6 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) uuid];
    id v8 = [v3 episodeUuid];
    [v3 modifiedDate];
    int v14 = 138543874;
    long long v15 = v7;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 2050;
    uint64_t v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "UpNext result from update cursor position for podcast %{public}@: episodeUuid: %{public}@ at %{public}f", (uint8_t *)&v14, 0x20u);
  }
  id v10 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v3 episodeUuid];
    int v14 = 138543618;
    long long v15 = v5;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UpNext result updating podcast nextEpisodeUuid from %{public}@ to %{public}@", (uint8_t *)&v14, 0x16u);
  }
  if (v5 != v4 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    uint64_t v12 = [*(id *)(a1 + 40) episodeForUuid:v4];
    uint64_t v13 = [*(id *)(a1 + 40) episodeForUuid:v5];
    if ([v13 listenNowEpisode])
    {
      [v13 setListenNowEpisode:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    if (v12 && ([v12 listenNowEpisode] & 1) == 0)
    {
      [v12 setListenNowEpisode:1];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      [v3 modifiedDate];
      [*(id *)(a1 + 32) setModifiedDate:];
    }
  }
  if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) saveInCurrentBlock];
  }
}

void sub_100016268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016280(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100016290(uint64_t a1)
{
}

void sub_100016298(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) podcastForFeedUrl:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 uuid];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000166CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1000166E4(uint64_t a1)
{
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:kMTEpisodeEntityName];
  uint64_t v3 = [*(id *)(a1 + 32) uuid];
  int v4 = +[MTEpisode predicateForEpisodesWithSeasonNumbersOnPodcastUuid:v3];
  [v2 setPredicate:v4];

  [v2 setFetchLimit:1];
  id v5 = *(void **)(a1 + 40);
  id v8 = 0;
  unint64_t v6 = [v5 executeFetchRequest:v2 error:&v8];
  id v7 = v8;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 count] != 0;

  [v7 logAndThrow:0];
}

void sub_10001693C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016954(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fetchRequestForDistinctSeasons];
  uint64_t v3 = *(void **)(a1 + 40);
  id v9 = 0;
  int v4 = [v3 executeFetchRequest:v2 error:&v9];
  id v5 = v9;
  [v5 logAndThrow:0];
  uint64_t v6 = [v4 valueForKey:kEpisodeSeasonNumber];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_100016B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016B74(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) predicateForPodcast:*(void *)(a1 + 40)];
  uint64_t v2 = +[MTEpisode predicateForEpisodeType:1];
  uint64_t v3 = +[MTEpisode predicateForSeasonNumberWithNoEpisodeNumber:*(void *)(a1 + 64)];
  int v4 = [v10 AND:v2];
  id v5 = [v4 AND:v3];

  uint64_t v6 = +[MTEpisode sortDescriptorsForPubDateAscending:0];
  uint64_t v7 = [*(id *)(a1 + 48) objectsInEntity:kMTEpisodeEntityName predicate:v5 sortDescriptors:v6 returnsObjectsAsFaults:0 limit:1];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_100017B08(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) episodePropertySource];
  uint64_t v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 32) artworkView];
    [v4 setImage:*(void *)(a1 + 48)];
  }
}

id *sub_100017D20(id *result, uint64_t a2)
{
  if (a2) {
    return (id *)[result[4] applyImage:a2 fromSource:result[5]];
  }
  return result;
}

void sub_100017EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100017EE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = [objc_alloc((Class)NSData) initWithContentsOfURL:v3];
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = +[UIImage imageWithData:v5];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    else
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100018010;
      v9[3] = &unk_10002CAA8;
      uint64_t v8 = *(void **)(a1 + 32);
      id v10 = *(id *)(a1 + 40);
      [v8 placeholderWithSize:v9 completionHandler:^(id, id, id) {
    double a1 = *(double *)(a1 + 56);
    double a2 = *(double *)(a1 + 64);
}];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_100018010(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return _CFURLCreateStringByAddingPercentEscapes(allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return _CFURLCreateStringByReplacingPercentEscapes(allocator, originalString, charactersToLeaveEscaped);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

uint64_t CTFontDescriptorCreateWithTextStyle()
{
  return _CTFontDescriptorCreateWithTextStyle();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return _CTFontGetLanguageAwareOutsets();
}

uint64_t MRContentItemCopyNowPlayingInfo()
{
  return _MRContentItemCopyNowPlayingInfo();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return _MRMediaRemoteGetLocalOrigin();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync()
{
  return _MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync();
}

uint64_t MRMediaRemoteSetAppPlaybackQueueForPlayer()
{
  return _MRMediaRemoteSetAppPlaybackQueueForPlayer();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return _MRMediaRemoteSetWantsNowPlayingNotifications();
}

uint64_t MRNowPlayingClientCreate()
{
  return _MRNowPlayingClientCreate();
}

uint64_t MRNowPlayingPlayerCreate()
{
  return _MRNowPlayingPlayerCreate();
}

uint64_t MRNowPlayingPlayerGetIdentifier()
{
  return _MRNowPlayingPlayerGetIdentifier();
}

uint64_t MRNowPlayingPlayerPathCreate()
{
  return _MRNowPlayingPlayerPathCreate();
}

uint64_t MRNowPlayingPlayerPathGetPlayer()
{
  return _MRNowPlayingPlayerPathGetPlayer();
}

uint64_t MRPlaybackQueueGetContentItemAtOffset()
{
  return _MRPlaybackQueueGetContentItemAtOffset();
}

uint64_t MRPlaybackQueueRequestCreate()
{
  return _MRPlaybackQueueRequestCreate();
}

uint64_t MRPlaybackQueueRequestSetIncludeMetadata()
{
  return _MRPlaybackQueueRequestSetIncludeMetadata();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return _MRSystemAppPlaybackQueueCreate();
}

uint64_t MRSystemAppPlaybackQueueSetGenericTrackIdentifiers()
{
  return _MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return _MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
}

uint64_t MRSystemAppPlaybackQueueSetReplaceIntent()
{
  return _MRSystemAppPlaybackQueueSetReplaceIntent();
}

uint64_t MRSystemAppPlaybackQueueSetSiriAssetInfo()
{
  return _MRSystemAppPlaybackQueueSetSiriAssetInfo();
}

uint64_t MRSystemAppPlaybackQueueSetTracklistShuffleMode()
{
  return _MRSystemAppPlaybackQueueSetTracklistShuffleMode();
}

uint64_t MRSystemAppPlaybackQueueSetUserInfo()
{
  return _MRSystemAppPlaybackQueueSetUserInfo();
}

uint64_t MTEpisodeContextFromPersistentString()
{
  return _MTEpisodeContextFromPersistentString();
}

uint64_t MTEpisodeContextSortTypeFromPersistentString()
{
  return _MTEpisodeContextSortTypeFromPersistentString();
}

uint64_t MTPlayReasonFromPersistentString()
{
  return _MTPlayReasonFromPersistentString();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t NSPersistentStringForMTEpisodeContext()
{
  return _NSPersistentStringForMTEpisodeContext();
}

uint64_t NSPersistentStringForMTEpisodeContextSortType()
{
  return _NSPersistentStringForMTEpisodeContextSortType();
}

uint64_t NSPersistentStringForMTPlayReason()
{
  return _NSPersistentStringForMTPlayReason();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MTLogCategoryDatabase()
{
  return __MTLogCategoryDatabase();
}

uint64_t _MTLogCategoryDefault()
{
  return __MTLogCategoryDefault();
}

uint64_t _MTLogCategoryPlayback()
{
  return __MTLogCategoryPlayback();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

IMP imp_implementationWithBlock(id block)
{
  return _imp_implementationWithBlock(block);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__activeAccountBlocking(void *a1, const char *a2, ...)
{
  return [a1 _activeAccountBlocking];
}

id objc_msgSend__applePodcastsFoundationSharedUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 _applePodcastsFoundationSharedUserDefaults];
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return [a1 _baselineOffsetFromBottom];
}

id objc_msgSend__boundsRelativeHitRect(void *a1, const char *a2, ...)
{
  return [a1 _boundsRelativeHitRect];
}

id objc_msgSend__didUpdateEpisodePropertySourcesNeedingFullReload(void *a1, const char *a2, ...)
{
  return [a1 _didUpdateEpisodePropertySourcesNeedingFullReload];
}

id objc_msgSend__fetchRequestForDistinctSeasons(void *a1, const char *a2, ...)
{
  return [a1 _fetchRequestForDistinctSeasons];
}

id objc_msgSend__getNowPlayingInfoAndCallPendingCompletions(void *a1, const char *a2, ...)
{
  return [a1 _getNowPlayingInfoAndCallPendingCompletions];
}

id objc_msgSend__initDefault(void *a1, const char *a2, ...)
{
  return [a1 _initDefault];
}

id objc_msgSend__loadEpisodePropertySourcesFromNotificationInfo(void *a1, const char *a2, ...)
{
  return [a1 _loadEpisodePropertySourcesFromNotificationInfo];
}

id objc_msgSend__preferredCollectionViewHeight(void *a1, const char *a2, ...)
{
  return [a1 _preferredCollectionViewHeight];
}

id objc_msgSend__removeNotificationFromHistory(void *a1, const char *a2, ...)
{
  return [a1 _removeNotificationFromHistory];
}

id objc_msgSend__sortDescriptorsForDefaultOrdering(void *a1, const char *a2, ...)
{
  return [a1 _sortDescriptorsForDefaultOrdering];
}

id objc_msgSend__updateActiveAccount(void *a1, const char *a2, ...)
{
  return [a1 _updateActiveAccount];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_actionHandler(void *a1, const char *a2, ...)
{
  return [a1 actionHandler];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return [a1 activeAccount];
}

id objc_msgSend_activeDsid(void *a1, const char *a2, ...)
{
  return [a1 activeDsid];
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return [a1 adamID];
}

id objc_msgSend_adjustsFontForContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 adjustsFontForContentSizeCategory];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allPossibleEpisodeListSortOrderProperties(void *a1, const char *a2, ...)
{
  return [a1 allPossibleEpisodeListSortOrderProperties];
}

id objc_msgSend_appTintColor(void *a1, const char *a2, ...)
{
  return [a1 appTintColor];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artworkView(void *a1, const char *a2, ...)
{
  return [a1 artworkView];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return [a1 author];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_backgroundEpisodeUuidFetches(void *a1, const char *a2, ...)
{
  return [a1 backgroundEpisodeUuidFetches];
}

id objc_msgSend_beginLoadingFromDatabaseInBackground(void *a1, const char *a2, ...)
{
  return [a1 beginLoadingFromDatabaseInBackground];
}

id objc_msgSend_bestSummary(void *a1, const char *a2, ...)
{
  return [a1 bestSummary];
}

id objc_msgSend_bestTitle(void *a1, const char *a2, ...)
{
  return [a1 bestTitle];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_byteSize(void *a1, const char *a2, ...)
{
  return [a1 byteSize];
}

id objc_msgSend_canExtensionOpenDatabase(void *a1, const char *a2, ...)
{
  return [a1 canExtensionOpenDatabase];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_cellSecondaryTextColor(void *a1, const char *a2, ...)
{
  return [a1 cellSecondaryTextColor];
}

id objc_msgSend_cellSelectedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 cellSelectedBackgroundColor];
}

id objc_msgSend_cellSeparatorColor(void *a1, const char *a2, ...)
{
  return [a1 cellSeparatorColor];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_collectionViewHeightConstraint(void *a1, const char *a2, ...)
{
  return [a1 collectionViewHeightConstraint];
}

id objc_msgSend_computedPropertiesToFetch(void *a1, const char *a2, ...)
{
  return [a1 computedPropertiesToFetch];
}

id objc_msgSend_computedPropertyKeyForBestSummary(void *a1, const char *a2, ...)
{
  return [a1 computedPropertyKeyForBestSummary];
}

id objc_msgSend_computedPropertyKeyForBestTitle(void *a1, const char *a2, ...)
{
  return [a1 computedPropertyKeyForBestTitle];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return [a1 contentInset];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countOfAllEpisodes(void *a1, const char *a2, ...)
{
  return [a1 countOfAllEpisodes];
}

id objc_msgSend_countOfEpisodePropertySources(void *a1, const char *a2, ...)
{
  return [a1 countOfEpisodePropertySources];
}

id objc_msgSend_currentConstant(void *a1, const char *a2, ...)
{
  return [a1 currentConstant];
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 currentNotificationCenter];
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return [a1 databaseID];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultCombiningString(void *a1, const char *a2, ...)
{
  return [a1 defaultCombiningString];
}

id objc_msgSend_defaultHeight(void *a1, const char *a2, ...)
{
  return [a1 defaultHeight];
}

id objc_msgSend_defaultMarginH(void *a1, const char *a2, ...)
{
  return [a1 defaultMarginH];
}

id objc_msgSend_defaultStyle(void *a1, const char *a2, ...)
{
  return [a1 defaultStyle];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dismissNotificationContentExtension(void *a1, const char *a2, ...)
{
  return [a1 dismissNotificationContentExtension];
}

id objc_msgSend_dividerColor(void *a1, const char *a2, ...)
{
  return [a1 dividerColor];
}

id objc_msgSend_dividerLine(void *a1, const char *a2, ...)
{
  return [a1 dividerLine];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_episodeDateLabel(void *a1, const char *a2, ...)
{
  return [a1 episodeDateLabel];
}

id objc_msgSend_episodeMetadataLabel(void *a1, const char *a2, ...)
{
  return [a1 episodeMetadataLabel];
}

id objc_msgSend_episodePropertySource(void *a1, const char *a2, ...)
{
  return [a1 episodePropertySource];
}

id objc_msgSend_episodeSummaryLabel(void *a1, const char *a2, ...)
{
  return [a1 episodeSummaryLabel];
}

id objc_msgSend_episodeTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 episodeTitleLabel];
}

id objc_msgSend_episodeUuid(void *a1, const char *a2, ...)
{
  return [a1 episodeUuid];
}

id objc_msgSend_episodesPropertySourceController(void *a1, const char *a2, ...)
{
  return [a1 episodesPropertySourceController];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_feedChangedDate(void *a1, const char *a2, ...)
{
  return [a1 feedChangedDate];
}

id objc_msgSend_feedURL(void *a1, const char *a2, ...)
{
  return [a1 feedURL];
}

id objc_msgSend_firstAttribute(void *a1, const char *a2, ...)
{
  return [a1 firstAttribute];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstEpisodePropertySource(void *a1, const char *a2, ...)
{
  return [a1 firstEpisodePropertySource];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return [a1 firstIndex];
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return [a1 firstItem];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return [a1 flags];
}

id objc_msgSend_flowLayout(void *a1, const char *a2, ...)
{
  return [a1 flowLayout];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_footerReferenceSize(void *a1, const char *a2, ...)
{
  return [a1 footerReferenceSize];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_friendlyDisplayString(void *a1, const char *a2, ...)
{
  return [a1 friendlyDisplayString];
}

id objc_msgSend_fromLabel(void *a1, const char *a2, ...)
{
  return [a1 fromLabel];
}

id objc_msgSend_groupedFooterConfiguration(void *a1, const char *a2, ...)
{
  return [a1 groupedFooterConfiguration];
}

id objc_msgSend_hasFetchedInitialAccount(void *a1, const char *a2, ...)
{
  return [a1 hasFetchedInitialAccount];
}

id objc_msgSend_hasHTML(void *a1, const char *a2, ...)
{
  return [a1 hasHTML];
}

id objc_msgSend_hasLoadedCurrentImage(void *a1, const char *a2, ...)
{
  return [a1 hasLoadedCurrentImage];
}

id objc_msgSend_headerTitle(void *a1, const char *a2, ...)
{
  return [a1 headerTitle];
}

id objc_msgSend_headerTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 headerTitleLabel];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_hidden(void *a1, const char *a2, ...)
{
  return [a1 hidden];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return [a1 identifiers];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return [a1 imageURL];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_installedConstraints(void *a1, const char *a2, ...)
{
  return [a1 installedConstraints];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateLayout];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return [a1 isHighlighted];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isSerialShowTypeInFeed(void *a1, const char *a2, ...)
{
  return [a1 isSerialShowTypeInFeed];
}

id objc_msgSend_isSourceOfTruth(void *a1, const char *a2, ...)
{
  return [a1 isSourceOfTruth];
}

id objc_msgSend_isUserLoggedIn(void *a1, const char *a2, ...)
{
  return [a1 isUserLoggedIn];
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return [a1 isVideo];
}

id objc_msgSend_itemDescription(void *a1, const char *a2, ...)
{
  return [a1 itemDescription];
}

id objc_msgSend_itemSize(void *a1, const char *a2, ...)
{
  return [a1 itemSize];
}

id objc_msgSend_keepSorted(void *a1, const char *a2, ...)
{
  return [a1 keepSorted];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_lastDatePlayed(void *a1, const char *a2, ...)
{
  return [a1 lastDatePlayed];
}

id objc_msgSend_lastImplicitlyFollowedDate(void *a1, const char *a2, ...)
{
  return [a1 lastImplicitlyFollowedDate];
}

id objc_msgSend_latestSeasonNumber(void *a1, const char *a2, ...)
{
  return [a1 latestSeasonNumber];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layout(void *a1, const char *a2, ...)
{
  return [a1 layout];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lenientSharedInstance(void *a1, const char *a2, ...)
{
  return [a1 lenientSharedInstance];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return [a1 library];
}

id objc_msgSend_lineCountLayoutGroup(void *a1, const char *a2, ...)
{
  return [a1 lineCountLayoutGroup];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_listenNowEpisode(void *a1, const char *a2, ...)
{
  return [a1 listenNowEpisode];
}

id objc_msgSend_loadArtworkImage(void *a1, const char *a2, ...)
{
  return [a1 loadArtworkImage];
}

id objc_msgSend_loadCollectionView(void *a1, const char *a2, ...)
{
  return [a1 loadCollectionView];
}

id objc_msgSend_loadConstraints(void *a1, const char *a2, ...)
{
  return [a1 loadConstraints];
}

id objc_msgSend_loadContentViews(void *a1, const char *a2, ...)
{
  return [a1 loadContentViews];
}

id objc_msgSend_loadViewAndConstraints(void *a1, const char *a2, ...)
{
  return [a1 loadViewAndConstraints];
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 loadViewIfNeeded];
}

id objc_msgSend_localizedDateString(void *a1, const char *a2, ...)
{
  return [a1 localizedDateString];
}

id objc_msgSend_localizedDurationAndPodcastTitleString(void *a1, const char *a2, ...)
{
  return [a1 localizedDurationAndPodcastTitleString];
}

id objc_msgSend_localizedDurationString(void *a1, const char *a2, ...)
{
  return [a1 localizedDurationString];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_magicMomentCompletionHandlers(void *a1, const char *a2, ...)
{
  return [a1 magicMomentCompletionHandlers];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainOrPrivateContext(void *a1, const char *a2, ...)
{
  return [a1 mainOrPrivateContext];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 managedObjectContext];
}

id objc_msgSend_markPlaylistsForUpdate(void *a1, const char *a2, ...)
{
  return [a1 markPlaylistsForUpdate];
}

id objc_msgSend_maxLineCount(void *a1, const char *a2, ...)
{
  return [a1 maxLineCount];
}

id objc_msgSend_minimumLineSpacing(void *a1, const char *a2, ...)
{
  return [a1 minimumLineSpacing];
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return [a1 modifiedDate];
}

id objc_msgSend_multiplier(void *a1, const char *a2, ...)
{
  return [a1 multiplier];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsUpdate(void *a1, const char *a2, ...)
{
  return [a1 needsUpdate];
}

id objc_msgSend_newArtworkView(void *a1, const char *a2, ...)
{
  return [a1 newArtworkView];
}

id objc_msgSend_newSeeMoreButton(void *a1, const char *a2, ...)
{
  return [a1 newSeeMoreButton];
}

id objc_msgSend_nextEpisodeUuid(void *a1, const char *a2, ...)
{
  return [a1 nextEpisodeUuid];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_notificationActions(void *a1, const char *a2, ...)
{
  return [a1 notificationActions];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfRevealedEpisodes(void *a1, const char *a2, ...)
{
  return [a1 numberOfRevealedEpisodes];
}

id objc_msgSend_openEpisodeDetailInAppURL(void *a1, const char *a2, ...)
{
  return [a1 openEpisodeDetailInAppURL];
}

id objc_msgSend_openPodcastDetailInAppURL(void *a1, const char *a2, ...)
{
  return [a1 openPodcastDetailInAppURL];
}

id objc_msgSend_orderedEpisodePropertySources(void *a1, const char *a2, ...)
{
  return [a1 orderedEpisodePropertySources];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return [a1 persistentID];
}

id objc_msgSend_playButton(void *a1, const char *a2, ...)
{
  return [a1 playButton];
}

id objc_msgSend_playbackNewestToOldest(void *a1, const char *a2, ...)
{
  return [a1 playbackNewestToOldest];
}

id objc_msgSend_playlist(void *a1, const char *a2, ...)
{
  return [a1 playlist];
}

id objc_msgSend_playlistIfDefault(void *a1, const char *a2, ...)
{
  return [a1 playlistIfDefault];
}

id objc_msgSend_playlistSettings(void *a1, const char *a2, ...)
{
  return [a1 playlistSettings];
}

id objc_msgSend_podcast(void *a1, const char *a2, ...)
{
  return [a1 podcast];
}

id objc_msgSend_podcastStoreCollectionId(void *a1, const char *a2, ...)
{
  return [a1 podcastStoreCollectionId];
}

id objc_msgSend_podcastTitle(void *a1, const char *a2, ...)
{
  return [a1 podcastTitle];
}

id objc_msgSend_podcastTitleButton(void *a1, const char *a2, ...)
{
  return [a1 podcastTitleButton];
}

id objc_msgSend_podcastUuid(void *a1, const char *a2, ...)
{
  return [a1 podcastUuid];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_presentedContentViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedContentViewController];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_priorityOrderedItems(void *a1, const char *a2, ...)
{
  return [a1 priorityOrderedItems];
}

id objc_msgSend_propertiesToFetch(void *a1, const char *a2, ...)
{
  return [a1 propertiesToFetch];
}

id objc_msgSend_pubDate(void *a1, const char *a2, ...)
{
  return [a1 pubDate];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_relation(void *a1, const char *a2, ...)
{
  return [a1 relation];
}

id objc_msgSend_reloadContentPropertyValues(void *a1, const char *a2, ...)
{
  return [a1 reloadContentPropertyValues];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadValues(void *a1, const char *a2, ...)
{
  return [a1 reloadValues];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requiresForegroundLaunch(void *a1, const char *a2, ...)
{
  return [a1 requiresForegroundLaunch];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_saveInCurrentBlock(void *a1, const char *a2, ...)
{
  return [a1 saveInCurrentBlock];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_seasonNumbers(void *a1, const char *a2, ...)
{
  return [a1 seasonNumbers];
}

id objc_msgSend_seasonSortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return [a1 seasonSortDescriptorsForSortOrder];
}

id objc_msgSend_secondAttribute(void *a1, const char *a2, ...)
{
  return [a1 secondAttribute];
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return [a1 secondItem];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sectionInset(void *a1, const char *a2, ...)
{
  return [a1 sectionInset];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return [a1 semanticContentAttribute];
}

id objc_msgSend_separatorHidden(void *a1, const char *a2, ...)
{
  return [a1 separatorHidden];
}

id objc_msgSend_separatorView(void *a1, const char *a2, ...)
{
  return [a1 separatorView];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharingPriority(void *a1, const char *a2, ...)
{
  return [a1 sharingPriority];
}

id objc_msgSend_shouldShowRevealMoreFooter(void *a1, const char *a2, ...)
{
  return [a1 shouldShowRevealMoreFooter];
}

id objc_msgSend_showTypeInFeed(void *a1, const char *a2, ...)
{
  return [a1 showTypeInFeed];
}

id objc_msgSend_showTypeSetting(void *a1, const char *a2, ...)
{
  return [a1 showTypeSetting];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_sortAscending(void *a1, const char *a2, ...)
{
  return [a1 sortAscending];
}

id objc_msgSend_sortDescriptors(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptors];
}

id objc_msgSend_sortDescriptorsForManualOrder(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForManualOrder];
}

id objc_msgSend_sortDescriptorsForNewestOnTop(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForNewestOnTop];
}

id objc_msgSend_sortDescriptorsForPlayOrderByEpisodeNumber(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForPlayOrderByEpisodeNumber];
}

id objc_msgSend_sortDescriptorsForPlayOrderByPubDate(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForPlayOrderByPubDate];
}

id objc_msgSend_sortDescriptorsForRecentlyUnfollowed(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForRecentlyUnfollowed];
}

id objc_msgSend_sortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForSortOrder];
}

id objc_msgSend_sortOrder(void *a1, const char *a2, ...)
{
  return [a1 sortOrder];
}

id objc_msgSend_sortProperties(void *a1, const char *a2, ...)
{
  return [a1 sortProperties];
}

id objc_msgSend_sortPropertyValues(void *a1, const char *a2, ...)
{
  return [a1 sortPropertyValues];
}

id objc_msgSend_spacingBetweenTextAndArtwork(void *a1, const char *a2, ...)
{
  return [a1 spacingBetweenTextAndArtwork];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_storeCollectionId(void *a1, const char *a2, ...)
{
  return [a1 storeCollectionId];
}

id objc_msgSend_storeTrackId(void *a1, const char *a2, ...)
{
  return [a1 storeTrackId];
}

id objc_msgSend_streamURL(void *a1, const char *a2, ...)
{
  return [a1 streamURL];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByRemovingPercentEscapes(void *a1, const char *a2, ...)
{
  return [a1 stringByRemovingPercentEscapes];
}

id objc_msgSend_stringBySmartlyStrippingHTML(void *a1, const char *a2, ...)
{
  return [a1 stringBySmartlyStrippingHTML];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_subscribed(void *a1, const char *a2, ...)
{
  return [a1 subscribed];
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return [a1 subtitleLabel];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return [a1 summary];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_syncType(void *a1, const char *a2, ...)
{
  return [a1 syncType];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return [a1 textProperties];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_totalLineCount(void *a1, const char *a2, ...)
{
  return [a1 totalLineCount];
}

id objc_msgSend_touchInsets(void *a1, const char *a2, ...)
{
  return [a1 touchInsets];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_universalStore(void *a1, const char *a2, ...)
{
  return [a1 universalStore];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateAvg(void *a1, const char *a2, ...)
{
  return [a1 updateAvg];
}

id objc_msgSend_updateDebugUI(void *a1, const char *a2, ...)
{
  return [a1 updateDebugUI];
}

id objc_msgSend_updateDynamicConstraints(void *a1, const char *a2, ...)
{
  return [a1 updateDynamicConstraints];
}

id objc_msgSend_updateForCurrentContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 updateForCurrentContentSizeCategory];
}

id objc_msgSend_updateStdDev(void *a1, const char *a2, ...)
{
  return [a1 updateStdDev];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return [a1 vendorID];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return [a1 webpageURL];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 willChangeValueForKey:];
}