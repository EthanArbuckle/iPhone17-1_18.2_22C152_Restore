void sub_100002E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100002E90(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100011598)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_100002FD0;
    v5[4] = &unk_10000C380;
    v5[5] = v5;
    long long v6 = off_10000C368;
    uint64_t v7 = 0;
    qword_100011598 = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)qword_100011598;
    if (qword_100011598)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)qword_100011598;
LABEL_5:
  result = dlsym(v2, "NTKCSeparatorColor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100011590 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100002FD0()
{
  uint64_t result = _sl_dlopen();
  qword_100011598 = result;
  return result;
}

void sub_1000035BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

id sub_1000035DC()
{
  uint64_t v5 = 0;
  long long v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void (*)(uint64_t, const char *))off_1000115B0;
  v8 = off_1000115B0;
  if (!off_1000115B0)
  {
    v1 = (void *)sub_100005B80();
    v6[3] = (uint64_t)dlsym(v1, "_NTKLoggingObjectForDomain");
    off_1000115B0 = (_UNKNOWN *)v6[3];
    v0 = (void (*)(uint64_t, const char *))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)sub_1000080B4();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = v0(24, "NTKLoggingDomainCompanionApp");
  return v2;
}

id sub_1000036F4(void *a1)
{
  v1 = [a1 addFaceDetailViewController];
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"CREATE_WATCH_FACE" value:&stru_10000C520 table:0];
  [v1 setTitle:v3];

  return v1;
}

BOOL sub_100004998()
{
  v0 = +[UIScreen mainScreen];
  v1 = [v0 traitCollection];

  v2 = [v1 preferredContentSizeCategory];
  BOOL v3 = UIContentSizeCategoryCompareToCategory(v2, UIContentSizeCategoryAccessibilityMedium) != NSOrderedAscending;

  return v3;
}

void sub_1000053AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000053D4()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (uint64_t (*)(void))off_1000115D0;
  uint64_t v7 = off_1000115D0;
  if (!off_1000115D0)
  {
    v1 = (void *)sub_100005B80();
    v5[3] = (uint64_t)dlsym(v1, "NTKCScreenStyle");
    off_1000115D0 = (_UNKNOWN *)v5[3];
    v0 = (uint64_t (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    BOOL v3 = (_Unwind_Exception *)sub_1000080B4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0();
}

id sub_100005844(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:1.0];
}

void *sub_100005B30(uint64_t a1)
{
  v2 = (void *)sub_100005B80();
  uint64_t result = dlsym(v2, "NTKAllAvailableFaceDescriptors");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000115A0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100005B80()
{
  v3[0] = 0;
  if (!qword_1000115A8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100005C80;
    v3[4] = &unk_10000C380;
    v3[5] = v3;
    long long v4 = off_10000C3C8;
    uint64_t v5 = 0;
    qword_1000115A8 = _sl_dlopen();
  }
  uint64_t v0 = qword_1000115A8;
  v1 = (void *)v3[0];
  if (!qword_1000115A8)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100005C80()
{
  uint64_t result = _sl_dlopen();
  qword_1000115A8 = result;
  return result;
}

void *sub_100005CF4(uint64_t a1)
{
  v2 = (void *)sub_100005B80();
  uint64_t result = dlsym(v2, "_NTKLoggingObjectForDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000115B0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100005D44(uint64_t a1)
{
  v2 = (void *)sub_100005B80();
  uint64_t result = dlsym(v2, "NTKCScreenEdgeMargin");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000115B8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100005D94(uint64_t a1)
{
  sub_100005B80();
  Class result = objc_getClass("NTKCompanionFaceViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000115C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_1000080D8();
    return (Class)sub_100005DEC(v3);
  }
  return result;
}

Class sub_100005DEC(uint64_t a1)
{
  sub_100005B80();
  Class result = objc_getClass("NTKCFaceContainerView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000115C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_100008100();
    return (Class)sub_100005E44(v3);
  }
  return result;
}

void *sub_100005E44(uint64_t a1)
{
  v2 = (void *)sub_100005B80();
  Class result = dlsym(v2, "NTKCScreenStyle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000115D0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100005E94(uint64_t a1)
{
  v2 = (void *)sub_100005B80();
  Class result = dlsym(v2, "NTKCActionColor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000115D8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000063A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000063D0()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void (*)(uint64_t, const char *))off_1000115F8;
  v8 = off_1000115F8;
  if (!off_1000115F8)
  {
    v1 = (void *)sub_100007BBC();
    v6[3] = (uint64_t)dlsym(v1, "_NTKLoggingObjectForDomain");
    off_1000115F8 = (_UNKNOWN *)v6[3];
    uint64_t v0 = (void (*)(uint64_t, const char *))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    long long v4 = (_Unwind_Exception *)sub_1000080B4();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = v0(24, "NTKLoggingDomainCompanionApp");
  return v2;
}

intptr_t sub_1000064E8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006960(uint64_t a1)
{
  v2 = dispatch_group_create();
  v29 = +[NSMutableArray array];
  v28 = +[NSMutableArray array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v23 = a1;
  uint64_t v3 = [*(id *)(a1 + 32) extensionContext];
  long long v4 = [v3 inputItems];

  id obj = v4;
  id v26 = [v4 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v44;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v5;
        uint64_t v6 = *(void **)(*((void *)&v43 + 1) + 8 * v5);
        uint64_t v7 = sub_1000063D0();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }

        long long v41 = 0u;
        long long v42 = 0u;
        long long v40 = 0u;
        long long v39 = 0u;
        v8 = [v6 attachments];
        id v9 = [v8 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v40;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v40 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              v14 = sub_1000063D0();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v13;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
              }

              v15 = [UTTypeImage identifier];
              unsigned int v16 = [v13 hasItemConformingToTypeIdentifier:v15];

              if (v16)
              {
                v17 = sub_1000063D0();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  v18 = [UTTypeImage identifier];
                  *(_DWORD *)buf = 138412290;
                  v49 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "conforms to %@", buf, 0xCu);
                }
                dispatch_group_enter(v2);
                v19 = [UTTypeImage identifier];
                v34[0] = _NSConcreteStackBlock;
                v34[1] = 3221225472;
                v34[2] = sub_100006DEC;
                v34[3] = &unk_10000C438;
                id v35 = v28;
                v36 = v2;
                v37 = v13;
                id v38 = v29;
                [v13 loadItemForTypeIdentifier:v19 options:0 completionHandler:v34];
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v10);
        }

        uint64_t v5 = v27 + 1;
      }
      while ((id)(v27 + 1) != v26);
      id v26 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v26);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007410;
  block[3] = &unk_10000C460;
  uint64_t v20 = *(void *)(v23 + 32);
  id v31 = v28;
  uint64_t v32 = v20;
  id v33 = v29;
  id v21 = v29;
  id v22 = v28;
  dispatch_group_notify(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100006DEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    long long v4 = sub_1000063D0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "attachment converted to NSString: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) addObject:v3];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 48);
    uint64_t v6 = [UTTypeImage identifier];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100006F64;
    v9[3] = &unk_10000C410;
    id v10 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v11 = v7;
    uint64_t v12 = v8;
    [v5 loadItemForTypeIdentifier:v6 options:0 completionHandler:v9];
  }
}

void sub_100006F64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = sub_1000063D0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v5 length];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "attachment converted to NSData: %p (%ld bytes)", buf, 0x16u);
    }

    CFDataRef v8 = (const __CFData *)v5;
    id v9 = CGImageSourceCreateWithData(v8, 0);
    if (v9)
    {
      CFStringRef v31 = kCGImageSourceShouldCache;
      uint64_t v32 = &__kCFBooleanFalse;
      CFDictionaryRef v10 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, v10);
      uint64_t v12 = ImageAtIndex;
      if (ImageAtIndex)
      {
        size_t Width = CGImageGetWidth(ImageAtIndex);
        size_t Height = CGImageGetHeight(v12);
        if (768.0 / (double)Width >= 768.0 / (double)Height) {
          double v15 = 768.0 / (double)Height;
        }
        else {
          double v15 = 768.0 / (double)Width;
        }
        id v16 = [sub_100007F28() _subsampleFactorForScale:v15];
        uint64_t v27 = 0;
        v28 = &v27;
        uint64_t v29 = 0x2020000000;
        v17 = (uint64_t (*)(CGImageSource *))off_100011640;
        v30 = off_100011640;
        if (!off_100011640)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_100008064;
          v34 = &unk_10000C348;
          id v35 = &v27;
          v18 = (void *)sub_100007BBC();
          v19 = dlsym(v18, "NTKPhotosUIImageOrientation");
          *(void *)(v35[1] + 24) = v19;
          off_100011640 = *(_UNKNOWN **)(v35[1] + 24);
          v17 = (uint64_t (*)(CGImageSource *))v28[3];
        }
        _Block_object_dispose(&v27, 8);
        if (!v17)
        {
          sub_1000080B4();
          __break(1u);
        }
        uint64_t v20 = v17(v9);
        id v21 = [sub_100007F28() _subsampledImageWithData:v8 orientation:v20 subsampleFactor:(unint64_t)(double)(unint64_t)v16];
        CFRelease(v12);
      }
      else
      {
        id v21 = 0;
      }
      CFRelease(v9);

      if (v21)
      {
        [*(id *)(a1 + 32) addObject:v21];
      }
    }
    else
    {
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    id v22 = *(void **)(a1 + 48);
    uint64_t v23 = [UTTypeImage identifier];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000730C;
    v24[3] = &unk_10000C3E8;
    id v25 = *(id *)(a1 + 32);
    id v26 = *(id *)(a1 + 40);
    [v22 loadItemForTypeIdentifier:v23 options:0 completionHandler:v24];
  }
}

void sub_1000072EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000730C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_1000063D0();
  CFDataRef v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "attachment converted to UIImage: %@", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 32) addObject:v5];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100008128((uint64_t)v6, v8);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

id sub_100007410(uint64_t a1)
{
  v2 = sub_1000063D0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "all images loaded", (uint8_t *)&buf, 2u);
  }

  if ([*(id *)(a1 + 32) count])
  {
    id v3 = *(id *)(a1 + 32);
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    long long v4 = (void (*)(id))off_100011630;
    id v14 = off_100011630;
    if (!off_100011630)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      id v16 = sub_100007ED8;
      v17 = &unk_10000C348;
      v18 = &v11;
      id v5 = (void *)sub_100007BBC();
      id v6 = dlsym(v5, "NTKPHAssetsForLocalIdentifiers");
      *(void *)(v18[1] + 24) = v6;
      off_100011630 = *(_UNKNOWN **)(v18[1] + 24);
      long long v4 = (void (*)(id))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v4)
    {
      sub_1000080B4();
      __break(1u);
    }
    id v7 = v4(v3);

    objc_msgSend(*(id *)(a1 + 40), "setAssets:", v7, v11);
  }
  else
  {
    [*(id *)(a1 + 40) setAssets:*(void *)(a1 + 48)];
  }
  CFDataRef v8 = sub_1000063D0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [*(id *)(a1 + 40) assets];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "found assets: %@", (uint8_t *)&buf, 0xCu);
  }
  return [*(id *)(a1 + 40) _finishedLoadingAssets];
}

void sub_100007620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100007988(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assets];
  id v3 = +[NTKEChooseWatchFaceViewController viewControllerWithAssets:v2];

  id v6 = v3;
  long long v4 = +[NSArray arrayWithObjects:&v6 count:1];
  id v5 = [*(id *)(a1 + 32) ntkNavController];
  [v5 setViewControllers:v4];
}

uint64_t sub_100007A58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *sub_100007B6C(uint64_t a1)
{
  v2 = (void *)sub_100007BBC();
  Class result = dlsym(v2, "_NTKLoggingObjectForDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000115F8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100007BBC()
{
  v3[0] = 0;
  if (!qword_100011600)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100007CBC;
    v3[4] = &unk_10000C380;
    v3[5] = v3;
    long long v4 = off_10000C4A8;
    uint64_t v5 = 0;
    qword_100011600 = _sl_dlopen();
  }
  uint64_t v0 = qword_100011600;
  v1 = (void *)v3[0];
  if (!qword_100011600)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100007CBC()
{
  uint64_t result = _sl_dlopen();
  qword_100011600 = result;
  return result;
}

void *sub_100007D30(uint64_t a1)
{
  v2 = (void *)sub_100007BBC();
  uint64_t result = dlsym(v2, "NTKCFaceDetailViewControllerDidAddFace");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100011608 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100007D80(uint64_t a1)
{
  sub_100007BBC();
  Class result = objc_getClass("NTKCompanionAppLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1000081A0();
  }
  qword_100011610 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100007DD8(uint64_t a1)
{
  v2 = (void *)sub_100007BBC();
  Class result = dlsym(v2, "NTKSharedRemoteComplicationProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100011618 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100007E28(uint64_t a1)
{
  sub_100007BBC();
  Class result = objc_getClass("NTKTransactionCommitCoordinator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1000081C8();
  }
  qword_100011620 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100007E80(uint64_t a1)
{
  sub_100007BBC();
  Class result = objc_getClass("NTKCNavigationController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1000081F0();
  }
  qword_100011628 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100007ED8(uint64_t a1)
{
  v2 = (void *)sub_100007BBC();
  Class result = dlsym(v2, "NTKPHAssetsForLocalIdentifiers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100011630 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100007F28()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100011638;
  uint64_t v7 = qword_100011638;
  if (!qword_100011638)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000800C;
    v3[3] = &unk_10000C348;
    v3[4] = &v4;
    sub_10000800C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100007FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10000800C(uint64_t a1)
{
  sub_100007BBC();
  Class result = objc_getClass("NTKCompanionResourceDirectoryEditor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100008218();
  }
  qword_100011638 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100008064(uint64_t a1)
{
  v2 = (void *)sub_100007BBC();
  Class result = dlsym(v2, "NTKPhotosUIImageOrientation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100011640 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000080B4()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_1000080D8(v0);
}

uint64_t sub_1000080D8()
{
  uint64_t v0 = abort_report_np();
  return sub_100008100(v0);
}

uint64_t sub_100008100()
{
  uint64_t v0 = abort_report_np();
  return sub_100008128(v0);
}

void sub_100008128(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "attachment could not be converted; error == %@",
    (uint8_t *)&v2,
    0xCu);
}

void sub_1000081A0()
{
  uint64_t v0 = abort_report_np();
  sub_1000081C8(v0);
}

void sub_1000081C8()
{
  uint64_t v0 = abort_report_np();
  sub_1000081F0(v0);
}

void sub_1000081F0()
{
  uint64_t v0 = abort_report_np();
  sub_100008218(v0);
}

void sub_100008218()
{
  uint64_t v0 = (const void *)abort_report_np();
  CFRelease(v0);
}

void CFRelease(CFTypeRef cf)
{
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateImageAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend__adjustContentHeight(void *a1, const char *a2, ...)
{
  return [a1 _adjustContentHeight];
}

id objc_msgSend__displayChooser(void *a1, const char *a2, ...)
{
  return [a1 _displayChooser];
}

id objc_msgSend__finishedLoadingAssets(void *a1, const char *a2, ...)
{
  return [a1 _finishedLoadingAssets];
}

id objc_msgSend__loadImages(void *a1, const char *a2, ...)
{
  return [a1 _loadImages];
}

id objc_msgSend__updateEdgeMargins(void *a1, const char *a2, ...)
{
  return [a1 _updateEdgeMargins];
}

id objc_msgSend__updateTitle(void *a1, const char *a2, ...)
{
  return [a1 _updateTitle];
}

id objc_msgSend_addFaceDetailViewController(void *a1, const char *a2, ...)
{
  return [a1 addFaceDetailViewController];
}

id objc_msgSend_adjustedContentInset(void *a1, const char *a2, ...)
{
  return [a1 adjustedContentInset];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assets(void *a1, const char *a2, ...)
{
  return [a1 assets];
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

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_face(void *a1, const char *a2, ...)
{
  return [a1 face];
}

id objc_msgSend_faceClass(void *a1, const char *a2, ...)
{
  return [a1 faceClass];
}

id objc_msgSend_faceStyle(void *a1, const char *a2, ...)
{
  return [a1 faceStyle];
}

id objc_msgSend_faces(void *a1, const char *a2, ...)
{
  return [a1 faces];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flushCommitHandlers(void *a1, const char *a2, ...)
{
  return [a1 flushCommitHandlers];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frameLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 frameLayoutGuide];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return [a1 layoutFrame];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_needsAppleNeuralEngine(void *a1, const char *a2, ...)
{
  return [a1 needsAppleNeuralEngine];
}

id objc_msgSend_ntkNavController(void *a1, const char *a2, ...)
{
  return [a1 ntkNavController];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_sharedAppLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedAppLibrary];
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return [a1 sharedRenderingContext];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_supportsExternalAssets(void *a1, const char *a2, ...)
{
  return [a1 supportsExternalAssets];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}