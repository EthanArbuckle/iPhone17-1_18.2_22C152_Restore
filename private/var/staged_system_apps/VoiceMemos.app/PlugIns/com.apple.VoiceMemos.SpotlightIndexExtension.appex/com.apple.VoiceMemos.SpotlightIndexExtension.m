void sub_1000048B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004970(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000049F4;
  block[3] = &unk_1000082D8;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_1000049F4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100004AE4(id *a1)
{
  id v2 = +[NSMutableArray array];
  v3 = +[NSMutableArray array];
  v5 = [a1[4] container];
  id v6 = [v5 newBackgroundModel];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004C98;
  v13[3] = &unk_100008328;
  id v14 = a1[5];
  id v15 = v6;
  id v7 = v2;
  id v16 = v7;
  id v8 = v3;
  id v17 = v8;
  id v9 = v6;
  [v9 performBlockAndWait:v13];

  v10 = +[RCSSavedRecordingService sharedService];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004DE0;
  v11[3] = &unk_100008300;
  id v12 = a1[6];
  [v10 updateSearchMetadataWithRecordingURIsToInsert:0 recordingURIsToUpdate:v7 recordingURIsToDelete:v8 completionBlock:v11];
}

void sub_100004C98(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = +[RCCloudRecording savedRecordingURIForSearchableItemIdentifier:](RCCloudRecording, "savedRecordingURIForSearchableItemIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        id v8 = [*(id *)(a1 + 40) recordingWithURIRepresentation:v7];
        if (v8) {
          uint64_t v9 = 48;
        }
        else {
          uint64_t v9 = 56;
        }
        [*(id *)(a1 + v9) addObject:v7];
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void sub_100004DE0(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004E64;
  block[3] = &unk_1000082D8;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100004E64(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100005528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = +[AVMetadataItem metadataItemsFromArray:a1 withKey:a2 keySpace:a3];
  id v4 = [v3 na_map:&stru_100008450];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

BOOL sub_10000573C(id a1, AVAssetTrack *a2)
{
  return [(AVAssetTrack *)a2 isEnabled];
}

BOOL sub_100005D28(id a1, AVMutableMovieTrack *a2)
{
  return [(AVMutableMovieTrack *)a2 isEnabled];
}

id sub_100005D30(int a1)
{
  if (a1) {
    CFStringRef v1 = @"com.apple.VoiceMemos.tsrp";
  }
  else {
    CFStringRef v1 = @"tsrp";
  }
  id v2 = &AVMetadataKeySpaceQuickTimeMetadata;
  if (!a1) {
    id v2 = &AVMetadataKeySpaceISOUserData;
  }
  id v3 = +[AVMetadataItem identifierForKey:v1 keySpace:*v2];

  return v3;
}

BOOL sub_100005F80(id a1, AVMovieTrack *a2)
{
  return [(AVMovieTrack *)a2 isEnabled];
}

id sub_100005F88(uint64_t a1, uint64_t a2)
{
  id v2 = +[AVMetadataItem metadataItemsFromArray:a1 filteredByIdentifier:a2];
  id v3 = [v2 na_map:&stru_100008510];
  id v4 = [v3 firstObject];

  return v4;
}

NSString *__cdecl sub_1000062C0(id a1, AVMetadataItem *a2)
{
  return [(AVMetadataItem *)a2 stringValue];
}

NSDate *__cdecl sub_1000062C8(id a1, AVMetadataItem *a2)
{
  return [(AVMetadataItem *)a2 dateValue];
}

NSNumber *__cdecl sub_1000062D0(id a1, AVMetadataItem *a2)
{
  return [(AVMetadataItem *)a2 numberValue];
}

NSData *__cdecl sub_1000062D8(id a1, AVMetadataItem *a2)
{
  return [(AVMetadataItem *)a2 dataValue];
}

void sub_1000062E0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315394;
  id v4 = "+[AVURLAsset(RCAdditions) rc_updateFile:withTranscriptionData:error:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s -- writeMovieHeaderToURL error = %@", (uint8_t *)&v3, 0x16u);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return _CMAudioFormatDescriptionGetStreamBasicDescription(desc);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t OSLogForCategory()
{
  return _OSLogForCategory();
}

uint64_t RCCloudRecordingsStoreURL()
{
  return _RCCloudRecordingsStoreURL();
}

uint64_t RCTimeRangeFromCMTimeRange()
{
  return _RCTimeRangeFromCMTimeRange();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
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

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_fileFormat(void *a1, const char *a2, ...)
{
  return [a1 fileFormat];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_formatDescriptions(void *a1, const char *a2, ...)
{
  return [a1 formatDescriptions];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isQuickTime(void *a1, const char *a2, ...)
{
  return [a1 isQuickTime];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_newBackgroundModel(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundModel];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_processingFormat(void *a1, const char *a2, ...)
{
  return [a1 processingFormat];
}

id objc_msgSend_sampleRate(void *a1, const char *a2, ...)
{
  return [a1 sampleRate];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_timeRange(void *a1, const char *a2, ...)
{
  return [a1 timeRange];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_writeMovieHeaderToURL_fileType_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeMovieHeaderToURL:fileType:options:error:];
}