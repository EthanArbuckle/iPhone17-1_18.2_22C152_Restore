void sub_100003530(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100003544(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = +[MPMediaLibrary defaultMediaLibrary];
  uint64_t v4 = (uint64_t)[*(id *)(a1 + 32) counterForGeneratingLibraryChangeNotifications];
  if (v4 >= 1) {
    [WeakRetained _endGeneratingLibraryChangeNotifications];
  }
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100003660;
  v11 = &unk_1000082E0;
  id v13 = *(id *)(a1 + 40);
  id v5 = v3;
  id v12 = v5;
  id v6 = [v5 performTransactionWithBlock:&v8];
  if (v4 >= 1) {
    [WeakRetained _beginGeneratingLibraryChangeNotifications:v8, v9, v10, v11];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
}

uint64_t sub_100003660(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100003720(uint64_t a1)
{
  id v2 = +[MPMediaLibrary defaultMediaLibrary];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100003AF4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);

  return [v3 _beginGeneratingLibraryChangeNotifications];
}

uint64_t sub_100003BF0(uint64_t a1)
{
  if ((uint64_t)[*(id *)(a1 + 32) counterForGeneratingLibraryChangeNotifications] >= 1) {
    [*(id *)(a1 + 32) _endGeneratingLibraryChangeNotifications];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_10000403C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = a2;
  id v5 = a3;
  if (MPMediaItemPropertyArtist == v9)
  {
    [*(id *)(a1 + 32) setArtist:v5];
  }
  else if ((NSString *)MPMediaItemPropertyPodcastURL == v9)
  {
    [*(id *)(a1 + 32) setFeedUrl:v5];
  }
  else if (MPMediaItemPropertyPodcastTitle == v9)
  {
    [*(id *)(a1 + 32) setPodcastTitle:v5];
  }
  else if (MPMediaItemPropertyPodcastPersistentID == v9)
  {
    [*(id *)(a1 + 32) setPodcastPersistentId:v5];
  }
  else if (MPMediaItemPropertyAssetURL == v9)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v5 absoluteString];
    [v6 setAssetUrl:v7];
  }
  else if ((NSString *)MPMediaItemPropertyIsITunesU == v9)
  {
    [*(id *)(a1 + 32) setIsItunesU:[v5 BOOLValue]];
  }
  else if (MPMediaItemPropertyPersistentID == v9)
  {
    [*(id *)(a1 + 32) setPersistentId:v5];
  }
  else if ((NSString *)MPMediaItemPropertyFileSize == v9)
  {
    [*(id *)(a1 + 32) setByteSize:v5];
  }
  else if (MPMediaItemPropertyGenre == v9)
  {
    [*(id *)(a1 + 32) setCategory:v5];
  }
  else if (MPMediaItemPropertyPlaybackDuration == v9)
  {
    [*(id *)(a1 + 32) setDuration:v5];
  }
  else if (MPMediaItemPropertyTitle == v9)
  {
    [*(id *)(a1 + 32) setTitle:v5];
  }
  else if (MPMediaItemPropertyMediaType == v9)
  {
    v8 = &kUTTypeMovie;
    if ([v5 integerValue] != (id)1024 && objc_msgSend(v5, "integerValue") != (id)4096) {
      v8 = &kUTTypeAudio;
    }
    [*(id *)(a1 + 32) setUti:*v8];
  }
  else if ((NSString *)MPMediaItemPropertyPodcastGUID == v9)
  {
    [*(id *)(a1 + 32) setGuid:v5];
  }
  else if (MPMediaItemPropertyReleaseDate == v9)
  {
    [*(id *)(a1 + 32) setPubDate:v5];
  }
  else if (MPMediaItemPropertyBookmarkTime == v9)
  {
    [*(id *)(a1 + 32) setPlayhead:v5];
  }
  else if ((NSString *)MPMediaItemPropertyHasBeenPlayed == v9)
  {
    [*(id *)(a1 + 32) setHasBeenPlayed:[v5 BOOLValue]];
  }
  else if (MPMediaItemPropertyPlayCount == v9)
  {
    [*(id *)(a1 + 32) setPlayCount:v5];
  }
  else if ((NSString *)MPMediaItemPropertyDownloadIdentifier == v9)
  {
    [*(id *)(a1 + 32) setDownloadIdentifier:v5];
  }
  else if ((NSString *)MPMediaItemPropertyRestricted == v9)
  {
    [*(id *)(a1 + 32) setIsExplicit:[v5 BOOLValue]];
  }
  else if ((NSString *)MPMediaItemPropertyStoreID == v9)
  {
    [*(id *)(a1 + 32) setStoreTrackId:v5];
  }
  else if ((NSString *)MPMediaItemPropertyStorePlaylistID == v9)
  {
    [*(id *)(a1 + 32) setStoreCollectionId:v5];
  }
  else if (MPMediaItemPropertyLastPlayedDate == v9)
  {
    [*(id *)(a1 + 32) setLastPlayedDate:v5];
  }
}

BOOL sub_100004420(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 itemWithPersistentID:[v2 persistentID]];

  BOOL v5 = +[MTMLMediaItem isMissingAssetForItem:v4];
  if (v5) {
    [v4 populateLocationPropertiesWithPath:0];
  }

  return v5;
}

void sub_100004CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004CF4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004D04(uint64_t a1)
{
}

void sub_100004D0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    [v3 setIgnoreSystemFilterPredicates:1];
    id v3 = v8;
  }
  uint64_t v4 = [v3 items];
  if ([v4 count])
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) arrayByAddingObjectsFromArray:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void sub_1000050D0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 description];
  [v4 setValue:v6 forKey:v5];
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MTLogCategoryMediaLibrary()
{
  return __MTLogCategoryMediaLibrary();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__applePodcastsFoundationSharedUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 _applePodcastsFoundationSharedUserDefaults];
}

id objc_msgSend__beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 _beginGeneratingLibraryChangeNotifications];
}

id objc_msgSend__endGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 _endGeneratingLibraryChangeNotifications];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 beginGeneratingLibraryChangeNotifications];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_counterForGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 counterForGeneratingLibraryChangeNotifications];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDataFileName(void *a1, const char *a2, ...)
{
  return [a1 debugDataFileName];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return [a1 defaultMediaLibrary];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_endGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 endGeneratingLibraryChangeNotifications];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return [a1 guid];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isMissingAsset(void *a1, const char *a2, ...)
{
  return [a1 isMissingAsset];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return [a1 persistentID];
}

id objc_msgSend_persistentId(void *a1, const char *a2, ...)
{
  return [a1 persistentId];
}

id objc_msgSend_podcastsQuery(void *a1, const char *a2, ...)
{
  return [a1 podcastsQuery];
}

id objc_msgSend_propertiesForMediaItem(void *a1, const char *a2, ...)
{
  return [a1 propertiesForMediaItem];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_sharedDocumentsDirectory(void *a1, const char *a2, ...)
{
  return [a1 sharedDocumentsDirectory];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_writeDebugData(void *a1, const char *a2, ...)
{
  return [a1 writeDebugData];
}