void sub_100003314(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  uint64_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "thumbnailProvider: image: %@ error: %@", buf, 0x16u);
  }

  if (v6)
  {
    v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v5)
    {
      v9 = *(void *)(a1 + 32);
      v10 = *(NSObject **)(v9 + 8);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000034F4;
      v13[3] = &unk_100004140;
      v13[4] = v9;
      v14 = v5;
      v11 = *(id *)(a1 + 40);
      v15 = 0;
      v16 = v11;
      dispatch_async(v10, v13);

      goto LABEL_8;
    }
    v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000383C(v12);
    }

    v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
LABEL_8:
}

void sub_1000034F4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _queue_createPreviewImageDataWithImage:*(void *)(a1 + 40)];
  v3 = +[NSUUID UUID];
  v4 = [v3 UUIDString];
  v5 = +[NSString stringWithFormat:@"%@.png", v4];

  v6 = NSTemporaryDirectory();
  v7 = [v6 stringByAppendingPathComponent:v5];

  id v12 = 0;
  [v2 writeToFile:v7 options:0 error:&v12];
  id v8 = v12;
  if (v8)
  {
    v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "thumbnailProvider: failed to save image with error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v10 = +[NSURL fileURLWithPath:v7];
    v11 = +[QLThumbnailReply replyWithImageFileURL:v10];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id sub_100003804(uint64_t a1)
{
  __asm { FMOV            V1.2D, #0.5 }
  return [*(id *)(a1 + 32) drawAtPoint:vmulq_f64(vsubq_f64(*(float64x2_t *)(a1 + 40), *(float64x2_t *)(a1 + 56)), _Q1)];
}

void sub_10000383C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "thumbnailProvider: no error and no image in the response.", v1, 2u);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:];
}