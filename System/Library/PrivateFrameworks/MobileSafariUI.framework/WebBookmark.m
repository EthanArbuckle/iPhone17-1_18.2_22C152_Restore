@interface WebBookmark
- (id)safari_bestCurrentURL;
- (void)safari_bestCurrentURL;
@end

@implementation WebBookmark

- (id)safari_bestCurrentURL
{
  id v1 = a1;
  if (a1)
  {
    if (([a1 isReadingListItem] & 1) == 0
      || ([MEMORY[0x1E4F4BE68] sharedNetworkObserver],
          v2 = objc_claimAutoreleasedReturnValue(),
          int v3 = [v2 isNetworkReachable],
          v2,
          v3))
    {
      v4 = [v1 address];
      uint64_t v5 = objc_msgSend(v4, "_web_bestURLForUserTypedString");
      goto LABEL_5;
    }
    if ([v1 isFullArchiveAvailable])
    {
      char v10 = 0;
      v4 = [v1 webarchivePathInReaderForm:0 fileExists:&v10];
      if (!v10)
      {
        v7 = WBS_LOG_CHANNEL_PREFIXReadingList();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[WebBookmark safari_bestCurrentURL](v7);
        }
        if ([MEMORY[0x1E4FB60E8] lockSync])
        {
          [v1 setArchiveStatus:6];
          v8 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
          [v8 saveBookmark:v1];

          [MEMORY[0x1E4FB60E8] unlockSync];
        }
        else
        {
          v9 = WBS_LOG_CHANNEL_PREFIXReadingList();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[WebBookmark safari_bestCurrentURL](v9);
          }
        }
        id v1 = 0;
        goto LABEL_6;
      }
      uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
LABEL_5:
      id v1 = (id)v5;
LABEL_6:

      goto LABEL_7;
    }
    id v1 = 0;
  }
LABEL_7:
  return v1;
}

- (void)safari_bestCurrentURL
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "WebBookmark claims it has a web archive available, but file doesn't exist", v1, 2u);
}

@end