@interface QLCacheDeleteHandler
+ (id)dateBeforePurgingThumbnailsForUrgency:(int)a3;
+ (void)setUpCacheDeleteWithThumbnailAdditionIndex:(id)a3;
@end

@implementation QLCacheDeleteHandler

uint64_t __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v6 = _log_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    __int16 v19 = 1024;
    int v20 = a2;
    _os_log_impl(&dword_1DDC5E000, v6, OS_LOG_TYPE_INFO, "#CacheDelete computing purgeable space on %@ with urgency %d", buf, 0x12u);
  }

  v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  v8 = +[QLCacheDeleteHandler dateBeforePurgingThumbnailsForUrgency:a2];
  uint64_t v9 = [*(id *)(a1 + 32) purgeableSpaceOnMountPoint:v7 withUrgency:a2 beforeDate:v8];
  v10 = [(id)QLServerThreadInstance cacheThreadForVolume:v7];
  uint64_t v11 = [v10 purgeableSpaceOnMountPoint:v7 withUrgency:a2 beforeDate:v8];
  v12 = objc_msgSend(NSNumber, "numberWithLongLong:", v11 + v9, @"CACHE_DELETE_VOLUME", @"CACHE_DELETE_AMOUNT", v5);
  v16[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:2];

  return v13;
}

+ (id)dateBeforePurgingThumbnailsForUrgency:(int)a3
{
  if ((a3 + 1) >= 6)
  {
    v5 = _log_2();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[QLCacheDeleteHandler dateBeforePurgingThumbnailsForUrgency:](a3, v5);
    }

    double v3 = 978307200.0;
  }
  else
  {
    double v3 = dbl_1DDCB9500[a3 + 1];
  }
  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v3];
  return v6;
}

+ (void)setUpCacheDeleteWithThumbnailAdditionIndex:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke;
  aBlock[3] = &unk_1E6D0C620;
  id v4 = v3;
  id v24 = v4;
  v5 = _Block_copy(aBlock);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_8;
  v21[3] = &unk_1E6D0C620;
  id v6 = v4;
  id v22 = v6;
  v7 = _Block_copy(v21);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_9;
  v19[3] = &unk_1E6D0C648;
  id v20 = v6;
  id v8 = v6;
  uint64_t v9 = _Block_copy(v19);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_2;
  v15[3] = &unk_1E6D0C670;
  id v16 = v5;
  id v17 = v7;
  id v18 = v9;
  uint64_t v10 = setUpCacheDeleteWithThumbnailAdditionIndex__once;
  id v11 = v9;
  id v12 = v7;
  id v13 = v5;
  if (v10 != -1) {
    dispatch_once(&setUpCacheDeleteWithThumbnailAdditionIndex__once, v15);
  }
  v14 = dispatch_get_global_queue(9, 0);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v14, &__block_literal_global_1);
}

uint64_t __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  id v6 = _log_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v5;
    __int16 v19 = 1024;
    int v20 = a2;
    _os_log_impl(&dword_1DDC5E000, v6, OS_LOG_TYPE_INFO, "#CacheDelete purging on %@ with urgency %d", buf, 0x12u);
  }

  v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  id v8 = +[QLCacheDeleteHandler dateBeforePurgingThumbnailsForUrgency:a2];
  uint64_t v9 = [(id)QLServerThreadInstance cacheThreadForVolume:v7];
  uint64_t v10 = [*(id *)(a1 + 32) purgeOnMountPoint:v7 withUrgency:a2 beforeDate:v8];
  uint64_t v11 = [v9 purgeOnMountPoint:v7 withUrgency:a2 beforeDate:v8];
  id v12 = objc_msgSend(NSNumber, "numberWithLongLong:", v11 + v10, @"CACHE_DELETE_VOLUME", @"CACHE_DELETE_AMOUNT", v5);
  v16[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:2];

  return v13;
}

uint64_t __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelCacheDeletePurge];
}

uint64_t __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_2(uint64_t a1)
{
  return MEMORY[0x1F410DCF0](@"com.apple.quicklook.ThumbnailsAgent.CacheDelete", *(void *)(a1 + 32));
}

void __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  string = xpc_dictionary_get_string(v2, "Name");
  id v4 = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E4F14560]);
  v5 = [NSString stringWithUTF8String:string];
  if ([v5 isEqualToString:@"EmptyingTrash"])
  {
  }
  else
  {
    id v6 = [NSString stringWithUTF8String:string];
    int v7 = [v6 isEqualToString:@"DeleteImmediately"];

    if (!v7) {
      goto LABEL_8;
    }
  }
  id v8 = xpc_dictionary_get_string(v2, "Object");
  uint64_t v9 = _log_2();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    v14 = v4;
    __int16 v15 = 2080;
    id v16 = string;
    __int16 v17 = 2080;
    id v18 = v8;
    _os_log_impl(&dword_1DDC5E000, v9, OS_LOG_TYPE_DEFAULT, "Got event: %s, name: %s, object_str: %s", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v10 = [NSString stringWithUTF8String:v8];
  int v11 = [v10 isEqualToString:@"com.apple.finder.cacheDelete"];

  if (v11)
  {
    id v12 = +[QLThumbnailAdditionIndex sharedInstance];
    [v12 performDatabaseMaintenance];

    [(id)QLServerThreadInstance forEachCacheThread:&__block_literal_global_32];
  }
LABEL_8:
}

void __67__QLCacheDeleteHandler_setUpCacheDeleteWithThumbnailAdditionIndex___block_invoke_29(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setShouldRemoveThumbnailsForDeletedFiles:1];
  [v2 forceCommit];
  [v2 setShouldRemoveThumbnailsForDeletedFiles:0];
}

+ (void)dateBeforePurgingThumbnailsForUrgency:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_ERROR, "Unhandled #CacheDelete urgency %d", (uint8_t *)v2, 8u);
}

@end