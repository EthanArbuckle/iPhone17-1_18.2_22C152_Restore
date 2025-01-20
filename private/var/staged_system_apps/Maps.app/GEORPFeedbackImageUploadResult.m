@interface GEORPFeedbackImageUploadResult
- (id)_photoForClientImageIdentifier:(id)a3 inPhotoList:(id)a4;
- (void)enumerateAndMatchPhotosWithMetadata:(id)a3 withBlock:(id)a4;
@end

@implementation GEORPFeedbackImageUploadResult

- (void)enumerateAndMatchPhotosWithMetadata:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id obj = [(GEORPFeedbackImageUploadResult *)self imageUploadInfos];
    id v8 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v13 = [v12 clientImageUuid];
          v14 = [(GEORPFeedbackImageUploadResult *)self _photoForClientImageIdentifier:v13 inPhotoList:v6];

          v7[2](v7, v12, v14);
        }
        id v9 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: block != ((void *)0)", buf, 2u);
  }
}

- (id)_photoForClientImageIdentifier:(id)a3 inPhotoList:(id)a4
{
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 photoMetadata:v15];
        v12 = [v11 clientImageUuid];
        id v13 = [v12 caseInsensitiveCompare:v5];

        if (!v13)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

@end