void sub_100001940(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  RCSharedAudioFileInfo *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = [v5 lastPathComponent];
    v8 = [v7 stringByDeletingPathExtension];

    v9 = +[NSFileManager defaultManager];
    v26 = 0;
    v10 = [v9 URLForDirectory:99 inDomain:1 appropriateForURL:v5 create:1 error:&v26];
    v11 = v26;

    v12 = *(void **)(a1 + 32);
    if (v10)
    {
      v23 = v8;
      [v12 setTemporaryDirectoryURL:v10];
      v13 = [v5 lastPathComponent];
      v14 = [v10 URLByAppendingPathComponent:v13];

      v15 = +[NSFileManager defaultManager];
      v25 = 0;
      v16 = [v15 copyItemAtURL:v5 toURL:v14 error:&v25];
      v17 = v25;
      if (v16)
      {
        v24 = 0;
        [v14 getResourceValue:&v24 forKey:NSURLCreationDateKey error:0];
        v18 = v24;
        v19 = [[RCSharedAudioFileInfo alloc] initWithURL:v14 fileName:v23 creationDate:v18];
        [*(id *)(a1 + 32) setSharedAudioFileInfo:v19];

        v20 = *(void **)(a1 + 32);
        v21 = [v20 sharedAudioFileInfo];
        [v20 _didLoadFileInPlaceWithFileInfo:v21];
      }
      v8 = v23;
    }
    else
    {
      v14 = [v12 extensionContext];
      [v14 cancelRequestWithError:v11];
    }
  }
  else
  {
    v22 = [*(id *)(a1 + 32) extensionContext];
    [v22 cancelRequestWithError:v6];
  }
}

void sub_100002028(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableViewController];
  v3 = [*(id *)(a1 + 40) fileName];
  [v2 setSharedFileName:v3];

  id v4 = [*(id *)(a1 + 32) doneButtonItem];
  [v4 setEnabled:1];
}

void sub_100002364(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  [*(id *)(a1 + 32) _removeTemporaryAudioFileIfNeeded];
  v5 = [*(id *)(a1 + 32) extensionContext];
  v6 = v5;
  if (a2)
  {
    v7 = [*(id *)(a1 + 32) extensionContext];
    v8 = [v7 inputItems];
    [v6 completeRequestReturningItems:v8 completionHandler:0];

    +[RCAnalyticsUtilities sendReceivedSharedRecording];
  }
  else
  {
    [v5 cancelRequestWithError:v9];
  }
}

void sub_1000025A4(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  v3 = "-[RCShareViewController _removeTemporaryAudioFileIfNeeded]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s -- Unable to remove file. Error = %@", (uint8_t *)&v2, 0x16u);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t OSLogForCategory()
{
  return _OSLogForCategory();
}

uint64_t RCLocalizedFrameworkString()
{
  return _RCLocalizedFrameworkString();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__removeTemporaryAudioFileIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _removeTemporaryAudioFileIfNeeded];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_doneButtonItem(void *a1, const char *a2, ...)
{
  return [a1 doneButtonItem];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return [a1 fileName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_loadFileRepresentation(void *a1, const char *a2, ...)
{
  return [a1 loadFileRepresentation];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemBackgroundColor];
}

id objc_msgSend_sendReceivedSharedRecording(void *a1, const char *a2, ...)
{
  return [a1 sendReceivedSharedRecording];
}

id objc_msgSend_setupViews(void *a1, const char *a2, ...)
{
  return [a1 setupViews];
}

id objc_msgSend_sharedAudioFileInfo(void *a1, const char *a2, ...)
{
  return [a1 sharedAudioFileInfo];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_tableViewController(void *a1, const char *a2, ...)
{
  return [a1 tableViewController];
}

id objc_msgSend_temporaryDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectoryURL];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_voiceMemoTitleText(void *a1, const char *a2, ...)
{
  return [a1 voiceMemoTitleText];
}