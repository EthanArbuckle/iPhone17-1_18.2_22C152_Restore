@interface PHPickerResult
+ (id)crl_loadFileRepresentationsForResultItemProviders:(id)a3 supportedTypeIdentifiers:(id)a4 completionHandler:(id)a5;
+ (id)crl_safeLastPathComponentForItemURL:(id)a3 registeredTypeIdentifier:(id)a4;
+ (id)crl_typeIdentifiersForResults:(id)a3;
@end

@implementation PHPickerResult

+ (id)crl_loadFileRepresentationsForResultItemProviders:(id)a3 supportedTypeIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v21 = a3;
  id v7 = a4;
  id v22 = a5;
  id v54 = 0;
  v29 = [[CRLTemporaryDirectory alloc] initWithSignature:@"PHPickerResult.crl_loadFileRepresentationsForResultItemProviders" error:&v54];
  id v20 = v54;
  if (v29)
  {
    v26 = +[NSMutableArray array];
    v25 = +[NSFileManager defaultManager];
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2810000000;
    v52[3] = "";
    int v53 = 0;
    v28 = +[NSMutableArray array];
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = sub_1004EAFD0;
    v50[4] = sub_1004EAFE0;
    id v51 = 0;
    group = dispatch_group_create();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v21;
    id v8 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v8)
    {
      uint64_t v30 = *(void *)v47;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v11 = [v10 registeredTypeIdentifiers];
          id v12 = [v11 countByEnumeratingWithState:&v42 objects:v55 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v43;
            while (2)
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v43 != v13) {
                  objc_enumerationMutation(v11);
                }
                v15 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
                if (objc_msgSend(v15, "crl_conformsToAnyUTI:", v7))
                {
                  dispatch_group_enter(group);
                  v40[0] = 0;
                  v40[1] = v40;
                  v40[2] = 0x2020000000;
                  char v41 = 0;
                  v34[0] = _NSConcreteStackBlock;
                  v34[1] = 3221225472;
                  v34[2] = sub_1004EAFE8;
                  v34[3] = &unk_101500D08;
                  v34[4] = v29;
                  v34[5] = v15;
                  v36 = v40;
                  v37 = v52;
                  v34[6] = v25;
                  v34[7] = v28;
                  v38 = v50;
                  id v39 = a1;
                  v35 = group;
                  v16 = [v10 loadFileRepresentationForTypeIdentifier:v15 completionHandler:v34];
                  [v26 addObject:v16];

                  _Block_object_dispose(v40, 8);
                  goto LABEL_17;
                }
              }
              id v12 = [v11 countByEnumeratingWithState:&v42 objects:v55 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        id v8 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v8);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004EB69C;
    block[3] = &unk_101500D30;
    block[4] = v29;
    block[5] = v28;
    id v32 = v22;
    v33 = v50;
    dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);
    v17 = +[NSProgress crl_progressWithChildren:v26];

    _Block_object_dispose(v50, 8);
    _Block_object_dispose(v52, 8);
  }
  else
  {
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_101500C20);
    }
    v18 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
      sub_1010BE374(v18, v20);
    }
    if (v22) {
      (*((void (**)(id, void, void, id))v22 + 2))(v22, 0, 0, v20);
    }
    v17 = +[NSProgress discreteProgressWithTotalUnitCount:1];
  }

  return v17;
}

+ (id)crl_safeLastPathComponentForItemURL:(id)a3 registeredTypeIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 lastPathComponent];
  id v8 = [v7 pathExtension];
  id v9 = [v8 length];

  if (v9)
  {
    id v10 = v7;
LABEL_16:
    id v20 = v10;
    goto LABEL_17;
  }
  v11 = [UTTypeImage identifier];
  uint64_t v12 = [v6 crl_conformsToUTI:v11];

  if ((v12 & 1) == 0)
  {
    id v10 = [v7 stringByAppendingPathExtension:@"mov"];
    goto LABEL_16;
  }
  uint64_t v13 = CGImageSourceCreateWithURL((CFURLRef)v5, 0);
  if (!v13)
  {
    int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500D90);
    }
    v23 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BE6A4(v22, v23);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500DB0);
    }
    v24 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v24);
    }
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PHPickerResult(CRLAdditions) crl_safeLastPathComponentForItemURL:registeredTypeIdentifier:]");
    v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/PHPickerResult_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v18 lineNumber:127 isFatal:0 description:"Unable to create image source to check file type for photo picker file URL with no file extension."];
    v16 = 0;
    goto LABEL_29;
  }
  v14 = v13;
  v15 = CGImageSourceGetType(v13);
  CFRelease(v14);
  [v15 crl_UTIFilenameExtension];
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![(__CFString *)v16 length])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500D50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BE750();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500D70);
    }
    v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PHPickerResult(CRLAdditions) crl_safeLastPathComponentForItemURL:registeredTypeIdentifier:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/PHPickerResult_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 125, 0, "No file extension for CG-provided type identifier: %{public}@", v15);

LABEL_29:
  }

  if ([(__CFString *)v16 length])
  {
    v25 = v16;
  }
  else
  {
    [v6 crl_UTIFilenameExtension];
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (![(__CFString *)v25 length])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500DD0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BE610();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101500DF0);
      }
      v26 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v26);
      }
      v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PHPickerResult(CRLAdditions) crl_safeLastPathComponentForItemURL:registeredTypeIdentifier:]");
      v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/PHPickerResult_CRLAdditions.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 132, 0, "No file extension for file URL with registered type identifier: %{public}@", v6);
    }
  }
  if (v25) {
    CFStringRef v29 = v25;
  }
  else {
    CFStringRef v29 = @"jpeg";
  }
  id v20 = [v7 stringByAppendingPathExtension:v29];

LABEL_17:

  return v20;
}

+ (id)crl_typeIdentifiersForResults:(id)a3
{
  id v3 = a3;
  v4 = [UTTypeImage identifier];
  id v5 = [UTTypeMovie identifier];
  id v22 = objc_alloc_init((Class)NSMutableSet);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v11 = [v10 itemProvider];
        uint64_t v12 = [v11 registeredTypeIdentifiers];

        id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (!v13) {
          goto LABEL_19;
        }
        id v14 = v13;
        uint64_t v15 = *(void *)v24;
        while (2)
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
            if (objc_msgSend(v17, "crl_conformsToUTI:", v4))
            {
              v18 = v4;
LABEL_18:
              [v22 addObject:v18];
              goto LABEL_19;
            }
            if (objc_msgSend(v17, "crl_conformsToUTI:", v5))
            {
              v18 = v5;
              goto LABEL_18;
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v14) {
            continue;
          }
          break;
        }
LABEL_19:
      }
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  id v19 = [v22 copy];

  return v19;
}

@end