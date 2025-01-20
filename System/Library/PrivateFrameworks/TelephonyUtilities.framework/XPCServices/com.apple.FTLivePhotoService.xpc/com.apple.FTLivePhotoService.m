id FTDefaultLog()
{
  void *v0;
  uint64_t vars8;

  if (qword_10005A998 != -1) {
    dispatch_once(&qword_10005A998, &stru_100050FF8);
  }
  v0 = (void *)qword_10005A990;

  return v0;
}

void sub_100002D80(id a1)
{
  qword_10005A990 = (uint64_t)os_log_create("com.apple.calls.ftlivephotoservice", "Default");

  _objc_release_x1();
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = _setUpTemporaryDirectory();
  v4 = objc_opt_new();
  v5 = +[NSXPCListener serviceListener];
  [v5 setDelegate:v4];
  [v5 resume];

  return 0;
}

id _setUpTemporaryDirectory()
{
  unsetenv("TMPDIR");
  bzero(v4, 0x400uLL);
  [TUBundleIdentifierLivePhotoXPCService UTF8String];
  if (!_set_user_dir_suffix() || !confstr(65537, v4, 0x400uLL) || mkdir(v4, 0x1C0u) && *__error() != 17)
  {
    v2 = FTDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10003BA08();
    }
LABEL_13:

    exit(1);
  }
  bzero(v3, 0x400uLL);
  if (!realpath_DARWIN_EXTSN(v4, v3))
  {
    v2 = FTDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10003BA90();
    }
    goto LABEL_13;
  }
  v0 = +[NSString stringWithUTF8String:v3];

  return v0;
}

void sub_1000033A8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sub_100003468(uint64_t a1)
{
  qword_10005A9A0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100003800(uint64_t a1)
{
  uint64_t v2 = +[FTServerBag sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 48));
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = &stru_100051058;

  uint64_t v7 = +[NSMutableDictionary dictionary];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = v7;

  uint64_t v10 = +[NSMutableDictionary dictionary];
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 80);
  *(void *)(v11 + 80) = v10;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 56));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setDelegate:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setSandboxDelegate:");
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 64));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 72));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 80));
  v13 = *(void **)(a1 + 88);
  v14 = (id *)(*(void *)(a1 + 32) + 96);

  objc_storeStrong(v14, v13);
}

FTAVCMomentsProtocol *__cdecl sub_100003924(id a1, int64_t a2, NSString *a3, FTAVCMomentsDelegate *a4, OS_dispatch_queue *a5)
{
  uint64_t v8 = a5;
  v9 = a4;
  uint64_t v10 = a3;
  uint64_t v11 = FTDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    int64_t v15 = a2;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "videoStreamToken: %ld", (uint8_t *)&v14, 0xCu);
  }

  v12 = [[_TtC18FTLivePhotoService12FTAVCMoments alloc] initWithStreamToken:a2 requesterID:v10 delegate:v9 dispatchQueue:v8];

  return (FTAVCMomentsProtocol *)v12;
}

void sub_100004120(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_10000414C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = FTDefaultLog();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003BC50();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [WeakRetained idsService];
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully donated %@ to firewall for service %@", (uint8_t *)&v9, 0x16u);
  }
}

void sub_100004264(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = FTDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10003BCC0();
  }
}

id mediaTypesCapabilitiesSetForCapabilities(char a1)
{
  uint64_t v2 = +[NSMutableSet set];
  id v3 = v2;
  if (a1)
  {
    [v2 addObject:&off_100053208];
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:&off_100053220];
  if ((a1 & 2) != 0) {
LABEL_4:
  }
    [v3 addObject:&off_100053238];
LABEL_5:
  id v4 = [v3 copy];

  return v4;
}

void sub_100004BA0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = FTDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10003BCC0();
  }
}

void sub_100004E34(uint64_t a1)
{
  uint64_t v2 = FTDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    int v5 = *(unsigned __int8 *)(a1 + 64);
    v6 = TULoggableStringForHandle();
    *(_DWORD *)buf = 138413058;
    v54 = v3;
    __int16 v55 = 2112;
    id v56 = v4;
    __int16 v57 = 1024;
    *(_DWORD *)v58 = v5;
    *(_WORD *)&v58[4] = 2112;
    *(void *)&v58[6] = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "url: %@ metadata: %@ isZipped: %d fromIDSDestination: %@", buf, 0x26u);
  }
  uint64_t v7 = (id *)(a1 + 56);
  uint64_t v8 = [*(id *)(a1 + 56) serverBag];
  if ([v8 isMomentsDisabled])
  {

LABEL_17:
    v28 = FTDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10003BDF8(v28, v29, v30, v31, v32, v33, v34, v35);
    }

    [*(id *)(a1 + 56) deleteContentsAtURL:*(void *)(a1 + 32)];
    return;
  }
  unsigned int v9 = [(id)objc_opt_class() isFaceTimePhotosAvailable];

  if (!v9) {
    goto LABEL_17;
  }
  uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSDMomentsControllerMetadataKeyTransactionID"];
  if (v10)
  {
    __int16 v11 = [*v7 sessionForTransactionID:v10];
    v12 = [v11 activeRequestsByTransactionID];
    v13 = [v12 objectForKeyedSubscript:v10];

    int v14 = [v13 avcRequest];
    int64_t v15 = [v11 remoteRequesteeIDSDestinationFor:v14];

    v16 = FTDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v13 avcRequest];
      v18 = [v17 requesterID];
      v19 = TULoggableStringForHandle();
      *(_DWORD *)buf = 138412802;
      v54 = v11;
      __int16 v55 = 2112;
      id v56 = v18;
      __int16 v57 = 2112;
      *(void *)v58 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "session: %@ request: %@ remoteIDSDestination: %@", buf, 0x20u);
    }
    if (v11 && v13 && v15)
    {
      id v52 = 0;
      id v20 = [v15 _stripPotentialTokenURIWithToken:&v52];
      id v21 = v52;
      v22 = *(void **)(a1 + 48);
      id v51 = 0;
      id v23 = [v22 _stripPotentialTokenURIWithToken:&v51];
      id v24 = v51;
      v25 = v24;
      if (v21 && v24)
      {
        if ([v21 isEqualToData:v24])
        {
          if (*(unsigned char *)(a1 + 64))
          {
            v26 = [*(id *)(a1 + 56) fileTransferController];
            uint64_t v27 = *(void *)(a1 + 32);
            v48[0] = _NSConcreteStackBlock;
            v48[1] = 3221225472;
            v48[2] = sub_100005408;
            v48[3] = &unk_100051158;
            v48[4] = *(void *)(a1 + 56);
            id v49 = v10;
            id v50 = *(id *)(a1 + 32);
            [v26 unzipArchiveAtURL:v27 completion:v48];
          }
          else
          {
            v42 = FTDefaultLog();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              sub_10003BE9C();
            }

            [*(id *)(a1 + 56) deleteContentsAtURL:*(void *)(a1 + 32)];
          }
          [v11 removeActiveRequestForTransactionID:v10];
          id v43 = *v7;
          v44 = [v11 moments];
          [v43 cleanUpForMomentIfNecessary:v44];

          v45 = [*v7 reportingControllerDataSource];
          v46 = [v11 moments];
          objc_msgSend(v45, "didReceiveResultsForStream:withTransactionID:reply:", objc_msgSend(v46, "streamToken"), v10, &stru_100051178);
        }
        else
        {
          v41 = FTDefaultLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            sub_10003BF08((uint64_t *)(a1 + 48), v11, v41);
          }

          [*(id *)(a1 + 56) deleteContentsAtURL:*(void *)(a1 + 32)];
        }
      }
      else
      {
        v38 = [v13 avcRequest];
        v39 = [v11 remoteRequesteeIDSDestinationFor:v38];

        v40 = FTDefaultLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          uint64_t v47 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138413058;
          v54 = v39;
          __int16 v55 = 2112;
          id v56 = v21;
          __int16 v57 = 2112;
          *(void *)v58 = v47;
          *(_WORD *)&v58[8] = 2112;
          *(void *)&v58[10] = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Could not convert remote IDS destination %@ (token=%@) and/or from IDS destination %@ (token=%@) to token data", buf, 0x2Au);
        }

        [*(id *)(a1 + 56) deleteContentsAtURL:*(void *)(a1 + 32)];
      }
    }
    else
    {
      v37 = FTDefaultLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_10003BFAC((uint64_t)v10, (id *)(a1 + 56), v37);
      }

      [*(id *)(a1 + 56) deleteContentsAtURL:*(void *)(a1 + 32)];
    }
  }
  else
  {
    v36 = FTDefaultLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_10003BE30();
    }

    [*(id *)(a1 + 56) deleteContentsAtURL:*(void *)(a1 + 32)];
  }
}

void sub_100005408(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000054E4;
  v8[3] = &unk_100051130;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v4, v8);
}

id sub_1000054E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = FTDefaultLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unzipped resource to URL: %@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 40) _handleReceivedResourcesAtDirectoryURL:*(void *)(a1 + 32) transactionID:*(void *)(a1 + 48)];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003C050();
    }
  }
  return [*(id *)(a1 + 40) deleteContentsAtURL:*(void *)(a1 + 56)];
}

void sub_1000055D8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = FTDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10003BCC0();
  }
}

void sub_100005DCC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = FTDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10003BCC0();
  }
}

void sub_10000629C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)TUMomentDescriptor) initWithPhotosAppAssetIdentifier:v3];

  uint64_t v5 = [*(id *)(a1 + 32) queue];
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_10000639C;
  id v11 = &unk_1000511E8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v4;
  id v6 = v4;
  dispatch_async(v5, &v8);

  objc_msgSend(*(id *)(a1 + 32), "deleteContentsAtURL:", *(void *)(a1 + 40), v8, v9, v10, v11, v12);
  int v7 = [*(id *)(a1 + 32) sandboxURLsByRequestTransactionID];
  [v7 setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
}

id sub_10000639C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) handleRequestResultWithMomentDescriptor:*(void *)(a1 + 40)];
}

void sub_1000064EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)TUMomentDescriptor) initWithPhotosAppAssetIdentifier:v3];

  uint64_t v5 = [*(id *)(a1 + 32) queue];
  int v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  uint64_t v9 = sub_1000065CC;
  uint64_t v10 = &unk_1000511E8;
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v4;
  id v6 = v4;
  dispatch_async(v5, &v7);

  objc_msgSend(*(id *)(a1 + 32), "deleteContentsAtURL:", *(void *)(a1 + 40), v7, v8, v9, v10, v11);
}

id sub_1000065CC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) handleRequestResultWithMomentDescriptor:*(void *)(a1 + 40)];
}

void sub_10000678C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = FTDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003C2C4();
    }
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);
  }
}

void sub_1000069A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = FTDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003C338();
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);
  }
}

void sub_100006B38(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sessionForTransactionID:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = FTDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[WARN] Timeout reached for active request for transaction ID %@", (uint8_t *)&v8, 0xCu);
    }

    [v2 removeActiveRequestForTransactionID:*(void *)(a1 + 40)];
    id v5 = *(void **)(a1 + 32);
    id v6 = [v2 moments];
    [v5 cleanUpForMomentIfNecessary:v6];

    int v7 = [*(id *)(a1 + 32) sandboxURLsByRequestTransactionID];
    [v7 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

void sub_100006F80(id a1)
{
  if (!qword_10005A9B8)
  {
    qword_10005A9B8 = objc_alloc_init(FTMomentsControllerLocalCapabilities);
    _objc_release_x1();
  }
}

void sub_1000070C4(id a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"PreserveFaceTimePhotosFiles", TUBundleIdentifierTelephonyUtilitiesFramework, &keyExistsAndHasValidFormat))
  {
    BOOL v1 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v1 = 1;
  }
  char v2 = !v1;
  byte_10005A9C0 = v2;
}

void sub_1000076C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = FTDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 URL];
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received sandbox extension for URL: %@", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) sandboxURLsByRequestTransactionID];
  int v7 = [*(id *)(a1 + 40) transactionID];
  [v6 setObject:v3 forKeyedSubscript:v7];
}

void sub_1000077C8(id a1, NSError *a2)
{
  char v2 = a2;
  if (v2)
  {
    id v3 = FTDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003C444();
    }
  }
}

void sub_100008434(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = FTDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v5 URL];
    int v10 = 138412290;
    uint64_t v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "saving sandboxURL: %@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v9 = [*(id *)(a1 + 32) sandboxURLsByRequestTransactionID];
  [v9 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100008798(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000087D8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000087F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100008810(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008840(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000088C0(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v2) = info.denom;
  LODWORD(v1) = info.numer;
  *(double *)&qword_10005A9D8 = (double)v1 / (double)v2 / 1000000000.0;
}

id sub_100009018(uint64_t a1)
{
  return _[*(id *)(a1 + 32) transferFileAtTemporaryURL:*(void *)(a1 + 40) toDestinations:*(void *)(a1 + 48) withMetadata:*(void *)(a1 + 56)];
}

void sub_1000091A8(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009264;
  v5[3] = &unk_100051388;
  id v6 = v4;
  id v7 = *(id *)(a1 + 56);
  [v2 performFileCopierOperation:1 onInputURL:v3 outputURL:v6 completion:v5];
}

void sub_100009264(uint64_t a1)
{
  unint64_t v2 = +[NSFileManager defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v22 = 0;
  uint64_t v4 = [v2 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:0 error:&v22];
  id v5 = v22;

  if (v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v7)
    {
      id v16 = v5;
      uint64_t v17 = a1;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          buf[0] = 0;
          uint64_t v11 = +[NSFileManager defaultManager];
          id v12 = [v10 path];
          unsigned int v13 = [v11 fileExistsAtPath:v12 isDirectory:buf];

          if (v13) {
            BOOL v14 = buf[0] == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14)
          {
            id v7 = v10;
            goto LABEL_14;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v7);
LABEL_14:
      id v5 = v16;
      a1 = v17;
    }

    int64_t v15 = FTDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "new directory urls: %@, unzippedDirectoryURL: %@", buf, 0x16u);
    }
  }
  else
  {
    int64_t v15 = FTDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003C95C();
    }
    id v7 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100009800(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = FTDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    id v27 = v3;
    __int16 v28 = 2112;
    uint64_t v29 = v5;
    __int16 v30 = 2112;
    uint64_t v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending resource at URL %@ to destinations %@ with metadata %@", buf, 0x20u);
  }

  id v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"CSDMomentsControllerMetadataKeyTransactionID"];
  if (v3)
  {
    uint64_t v24 = IDSSendMessageOptionTimeoutKey;
    uint64_t v8 = [*(id *)(a1 + 56) serverBag];
    [v8 momentsRequestTimeout];
    uint64_t v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    __int16 v25 = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

    uint64_t v11 = [*(id *)(a1 + 56) service];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v22 = 0;
    id v23 = 0;
    unsigned int v14 = [v11 sendResourceAtURL:v3 metadata:v12 toDestinations:v13 priority:300 options:v10 identifier:&v23 error:&v22];
    id v15 = v23;
    id v16 = v22;

    if (v14)
    {
      uint64_t v17 = *(void *)(a1 + 64);
      long long v18 = [*(id *)(a1 + 56) clientFileURLByIdentifier];
      [v18 setObject:v17 forKeyedSubscript:v15];

      long long v19 = [*(id *)(a1 + 56) transactionIDByIDSFileIdentifier];
      [v19 setObject:v7 forKeyedSubscript:v15];

      long long v20 = FTDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v15;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Successfully started sending resource with identifier %@", buf, 0xCu);
      }
    }
    else
    {
      [*(id *)(a1 + 56) cleanUpTemporaryFileIfExistsForClientFileURL:*(void *)(a1 + 64)];
      long long v21 = FTDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10003CA4C();
      }

      long long v20 = [*(id *)(a1 + 56) delegate];
      [v20 fileTransferer:*(void *)(a1 + 56) didTransferFileAtURL:*(void *)(a1 + 64) transactionID:v7 successfully:0];
    }
  }
}

void sub_100009AB8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [*(id *)(a1 + 32) temporaryFileURLByClientFileURL];
  [v5 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100009DE4(uint64_t a1)
{
  unint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = +[NSUUID UUID];
  uint64_t v5 = [v4 UUIDString];
  id v6 = [v2 copyFileAtURL:v3 toTemporaryFileWithName:v5];

  if (v6)
  {
    id v7 = FTDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Copied resource to temporary URL: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v8 = [*(id *)(a1 + 32) delegate];
    [v8 fileTransferer:*(void *)(a1 + 32) didReceiveResourcesAtURL:v6 withMetadata:*(void *)(a1 + 48) isZipped:*(unsigned __int8 *)(a1 + 72) fromIDSDestination:*(void *)(a1 + 56)];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

uint64_t sub_10000A924(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = FTDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003CB84();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10000AB70(void *a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [v3 didErrorOccur];
  uint64_t v5 = FTDefaultLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003CBFC();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[7];
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    int v13 = 134218498;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "completed operation: %ld, inputURL: %@, outputURL: %@", (uint8_t *)&v13, 0x20u);
  }

  [v3 cleanup];
  uint64_t v10 = a1[6];
  unsigned int v11 = [v3 didErrorOccur];

  return (*(uint64_t (**)(uint64_t, void))(v10 + 16))(v10, v11 ^ 1);
}

uint64_t sub_10000AF24()
{
  id v1 = [v0 transactionID];
  uint64_t v2 = sub_10003CFC0();

  return v2;
}

uint64_t sub_10000AF7C()
{
  return sub_10000AF24();
}

id sub_10000AFA0()
{
  return sub_10000B024((SEL *)&selRef_startWithError_);
}

id sub_10000AFCC()
{
  return sub_10000B024((SEL *)&selRef_endWithError_);
}

id sub_10000AFF8()
{
  return sub_10000B024((SEL *)&selRef_rejectWithError_);
}

id sub_10000B024(SEL *a1)
{
  id v4 = 0;
  if (objc_msgSend(v1, *a1, &v4)) {
    return v4;
  }
  id v3 = v4;
  sub_10003CC90();

  return (id)swift_willThrow();
}

uint64_t sub_10000B0C8()
{
  return sub_10003CE10();
}

uint64_t sub_10000B114()
{
  return sub_10003CE00();
}

Swift::Int sub_10000B16C()
{
  return sub_10003D3C0();
}

uint64_t sub_10000B1D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t WitnessTable = swift_getWitnessTable();

  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

void type metadata accessor for AVCCaptionsReason(uint64_t a1)
{
}

void type metadata accessor for TUMomentsMediaType(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for TUMessageMediaType(uint64_t a1)
{
}

void type metadata accessor for AVCMomentsMediaType(uint64_t a1)
{
}

void type metadata accessor for AVCMomentsCapabilities(uint64_t a1)
{
}

uint64_t sub_10000B2B8()
{
  return sub_10000B320((unint64_t *)&qword_100059800);
}

uint64_t sub_10000B2EC()
{
  return sub_10000B320(&qword_100059808);
}

uint64_t sub_10000B320(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CFString(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Caption(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithCopy for AudioManager(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioManager(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AudioManager(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for audit_token_t(uint64_t a1)
{
}

void sub_10000B408(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000B450(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_avcMoments) = a1;
  return _objc_release_x1();
}

uint64_t sub_10000B464(uint64_t a1, uint64_t a2)
{
  return sub_10000B4E4(a1, a2, &OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_onRequestFinishedProcessing, (uint64_t (*)(uint64_t, uint64_t))sub_10000CDF0);
}

uint64_t sub_10000B484()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_onRequestError);
  sub_10000D9C4(v1);
  return v1;
}

uint64_t sub_10000B4C4(uint64_t a1, uint64_t a2)
{
  return sub_10000B4E4(a1, a2, &OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_onRequestError, (uint64_t (*)(uint64_t, uint64_t))sub_10000D9D4);
}

uint64_t sub_10000B4E4(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = (uint64_t *)(v4 + *a3);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t *v5 = a1;
  v5[1] = a2;
  return a4(v6, v7);
}

void (*sub_10000B504(uint64_t a1, uint64_t a2, void *a3))(uint64_t, uint64_t)
{
  uint64_t v4 = v3;
  sub_10003D150();
  sub_10000D9D8();
  uint64_t v47 = v8;
  uint64_t v48 = v7;
  __chkstk_darwin(v7);
  sub_10000D9F4();
  uint64_t v11 = v10 - v9;
  sub_10003D130();
  sub_10000DA20();
  __chkstk_darwin(v12);
  sub_10000D9F4();
  uint64_t v13 = sub_10003CED0();
  uint64_t v14 = sub_10000DA68(v13);
  __chkstk_darwin(v14);
  sub_10000D9F4();
  uint64_t v52 = OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_avcMoments;
  *(void *)&v3[OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_avcMoments] = 0;
  __int16 v15 = (uint64_t *)&v3[OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_onRequestFinishedProcessing];
  *__int16 v15 = 0;
  v15[1] = 0;
  v45 = v15;
  uint64_t v16 = (uint64_t *)&v3[OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_onRequestError];
  uint64_t *v16 = 0;
  v16[1] = 0;
  v46 = v16;
  __int16 v17 = &v3[OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_uuid];
  sub_10003CDA0();
  sub_10000DA04();
  uint64_t v55 = v19;
  uint64_t v56 = v18;
  v44 = v17;
  uint64_t v51 = a1;
  (*(void (**)(char *, uint64_t))(v19 + 16))(v17, a1);
  long long v20 = &v3[OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_mediaURL];
  sub_10003CD40();
  sub_10000DA04();
  uint64_t v53 = v22;
  uint64_t v54 = v21;
  id v43 = v20;
  (*(void (**)(char *, uint64_t))(v22 + 16))(v20, a2);
  sub_10000D988(0, (unint64_t *)&unk_100059ED0);
  id v23 = v3;
  sub_10003CEC0();
  v58 = _swiftEmptyArrayStorage;
  sub_10000D680();
  sub_10000CCE8(&qword_100059EE0);
  sub_10000D6D0();
  sub_10003D1F0();
  (*(void (**)(uint64_t, void, uint64_t))(v47 + 104))(v11, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v48);
  uint64_t v24 = sub_10003D170();
  uint64_t v25 = OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_queue;
  *(void *)&v23[OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_queue] = v24;
  id v26 = [objc_allocWithZone((Class)type metadata accessor for MessageMomentsAVCDelegate()) init];
  uint64_t v27 = OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_avcDelegate;
  *(void *)&v23[OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_avcDelegate] = v26;
  uint64_t v28 = OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_mediaTokens;
  *(void *)&v23[OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_mediaTokens] = a3;
  id v29 = a3;
  id v30 = objc_msgSend(objc_allocWithZone((Class)AVCMoments), "initWithStreamToken:requesterID:delegate:dispatchQueue:", objc_msgSend(v29, "combinedAudioStreamToken"), 0, *(void *)&v23[v27], *(void *)&v23[v25]);
  if (v30)
  {
    uint64_t v31 = *(void **)&v3[v52];
    *(void *)&v4[v52] = v30;
    id v32 = v30;

    v57.receiver = v23;
    v57.super_class = (Class)type metadata accessor for MediaMoments();
    uint64_t v33 = (void (*)(uint64_t, uint64_t))objc_msgSendSuper2(&v57, "init");
    *(void *)(*(void *)((char *)v33 + OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_avcDelegate)
              + OBJC_IVAR____TtC18FTLivePhotoService25MessageMomentsAVCDelegate_owner
              + 8) = &off_100051880;
    swift_unknownObjectWeakAssign();

    sub_10000DA30();
    v34();
    sub_10000DA30();
    v35();
  }
  else
  {
    id v50 = v3;
    if (qword_100059760 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_10003CEA0();
    sub_10000CD54(v36, (uint64_t)qword_10005B8B0);
    v37 = sub_10003CE80();
    os_log_type_t v38 = sub_10003D100();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Could not construct moments", v39, 2u);
      sub_10000DA3C();
    }

    sub_10000D76C();
    swift_allocError();
    unsigned char *v40 = 0;
    swift_willThrow();

    v41 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
    v41(a2, v54);
    uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v55 + 8);
    v33(v51, v56);

    v33((uint64_t)v44, v56);
    v41((uint64_t)v43, v54);

    sub_10000CDF0(*v45);
    sub_10000CDF0(*v46);

    type metadata accessor for MediaMoments();
    swift_deallocPartialClassInstance();
  }
  return v33;
}

void sub_10000BABC(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  sub_10003CD40();
  sub_10000D9D8();
  __chkstk_darwin(v6);
  sub_10000D9F4();
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_10003CEA0();
  sub_10000CD54(v7, (uint64_t)qword_10005B8B0);
  uint64_t v8 = sub_10003CE80();
  os_log_type_t v9 = sub_10003D120();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v33 = a1;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136446210;
    type metadata accessor for AVCMomentsMediaType(0);
    uint64_t v11 = sub_10003CFF0();
    uint64_t v13 = sub_10000CE00(v11, v12, &v34);
    sub_10000DA54(v13);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Generating new request for AVCMomentsMediaType %{public}s", v10, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    a1 = v33;
    sub_10000DA3C();
  }

  id v14 = [objc_allocWithZone((Class)AVCMediaRecorderRequestConfiguration) init];
  id v15 = [a1 sandboxURL];
  id v16 = [v15 URL];

  sub_10003CD00();
  sub_10003CCD0(v17);
  uint64_t v19 = v18;
  sub_10000DA30();
  v20();
  [v14 setDirectoryURL:v19];

  [v14 setMediaType:5];
  [v14 setRequestMode:1];
  uint64_t v21 = *(void **)(v3 + OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_avcMoments);
  if (v21 && (id v22 = [v21 newRequestWithConfiguration:v14]) != 0)
  {
    id v23 = v22;
    a2[3] = sub_10000D988(0, (unint64_t *)&qword_100059C60);
    a2[4] = &off_100051700;

    *a2 = v23;
  }
  else
  {
    id v24 = v14;
    uint64_t v25 = sub_10003CE80();
    os_log_type_t v26 = sub_10003D100();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136446210;
      sub_10000D988(0, &qword_100059968);
      id v28 = v24;
      uint64_t v29 = sub_10003CFF0();
      uint64_t v31 = sub_10000CE00(v29, v30, &v34);
      sub_10000DA54(v31);
      sub_10003D1B0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Generating request failed %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
    }
    sub_10000D76C();
    swift_allocError();
    *id v32 = 1;
    swift_willThrow();
  }
}

uint64_t sub_10000BF2C(uint64_t a1)
{
  sub_10000D8DC(a1, (uint64_t)&v3, &qword_100059930);
  if (v4)
  {
    sub_10000D668(&v3, (uint64_t)v5);
    sub_10000CD8C((uint64_t)v5, (uint64_t)&v3);
    sub_10000CCE8(&qword_100059940);
    uint64_t v1 = sub_10003CFF0();
    sub_10000D5B8((uint64_t)v5);
  }
  else
  {
    sub_10000D938((uint64_t)&v3, &qword_100059930);
    return 7104878;
  }
  return v1;
}

uint64_t sub_10000BFD0(uint64_t a1)
{
  return sub_10000C010(a1, &qword_100059D40, (uint64_t (*)(void))&type metadata accessor for Locale);
}

uint64_t sub_10000BFF0(uint64_t a1)
{
  return sub_10000C010(a1, (uint64_t *)&unk_100059C70, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_10000C010(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_10000CCE8(a2);
  uint64_t v7 = sub_10000DA68(v6);
  __chkstk_darwin(v7);
  sub_10000D9F4();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = a3(0);
  sub_10000D9D8();
  uint64_t v13 = v12;
  uint64_t v15 = __chkstk_darwin(v14);
  __int16 v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v22 - v18;
  sub_10000D8DC(a1, v10, a2);
  if (sub_10000CD2C(v10, 1, v11) == 1)
  {
    sub_10000D938(v10, a2);
    return 7104878;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v19, v10, v11);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v19, v11);
    uint64_t v20 = sub_10003CFF0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v19, v11);
  }
  return v20;
}

uint64_t sub_10000C1B8(uint64_t a1)
{
  return sub_10000C010(a1, (uint64_t *)&unk_100059E30, (uint64_t (*)(void))&type metadata accessor for UUID);
}

uint64_t sub_10000C1D8(uint64_t a1)
{
  uint64_t v2 = sub_10000CCE8(&qword_100059960);
  uint64_t v3 = sub_10000DA68(v2);
  __chkstk_darwin(v3);
  sub_10000D9F4();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for MessageRequest();
  sub_10000DA20();
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v16 - v12;
  sub_10000D8DC(a1, v6, &qword_100059960);
  if (sub_10000CD2C(v6, 1, v7) == 1)
  {
    sub_10000D938(v6, &qword_100059960);
    return 7104878;
  }
  else
  {
    sub_10000D7B8(v6, (uint64_t)v13);
    sub_10000D81C((uint64_t)v13, (uint64_t)v11);
    uint64_t v14 = sub_10003CFF0();
    sub_10000D880((uint64_t)v13);
  }
  return v14;
}

uint64_t sub_10000C334()
{
  sub_10000D76C();
  swift_allocError();
  unsigned char *v0 = 2;
  return swift_willThrow();
}

void sub_10000C384()
{
}

id sub_10000C3C4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MediaMoments();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000C500()
{
  return type metadata accessor for MediaMoments();
}

uint64_t type metadata accessor for MediaMoments()
{
  uint64_t result = qword_100059920;
  if (!qword_100059920) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000C550()
{
  uint64_t result = sub_10003CDA0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_10003CD40();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_10000C644(uint64_t a1, uint64_t a2)
{
  return sub_10000B464(a1, a2);
}

uint64_t sub_10000C668(uint64_t a1, uint64_t a2)
{
  return sub_10000B4C4(a1, a2);
}

uint64_t sub_10000C68C()
{
  return sub_10000C334();
}

uint64_t sub_10000C6A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v10 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  uint64_t v11 = sub_10000DA68(v10);
  __chkstk_darwin(v11);
  sub_10000D9F4();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_10003CD40();
  sub_10000D9D8();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_10000D9F4();
  uint64_t v21 = v20 - v19;
  if (a5)
  {
    swift_errorRetain();
    if (qword_100059760 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_10003CEA0();
    sub_10000CD54(v22, (uint64_t)qword_10005B8B0);
    sub_10000CD8C(a2, (uint64_t)v51);
    swift_errorRetain();
    swift_errorRetain();
    id v23 = sub_10003CE80();
    os_log_type_t v24 = sub_10003D100();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136446466;
      sub_10000CD8C((uint64_t)v51, (uint64_t)v49);
      uint64_t v26 = sub_10000BF2C((uint64_t)v49);
      unint64_t v28 = v27;
      sub_10000D938((uint64_t)v49, &qword_100059930);
      uint64_t v29 = sub_10000CE00(v26, v28, &v50);
      sub_10000DA74(v29);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      sub_10000D5B8((uint64_t)v51);
      *(_WORD *)(v25 + 12) = 2082;
      v49[0] = a5;
      swift_errorRetain();
      sub_10000CCE8((uint64_t *)&unk_100059D70);
      uint64_t v30 = sub_10003CFF0();
      uint64_t v32 = sub_10000CE00(v30, v31, &v50);
      sub_10000DA74(v32);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Moments finished processing request %{public}s with error %{public}s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
      sub_10000D5B8((uint64_t)v51);
      swift_errorRelease();
      swift_errorRelease();
    }

    v37 = *(void (**)(unsigned char *, uint64_t))(v6
                                                  + OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_onRequestError);
    if (v37)
    {
      sub_10000CD8C(a2, (uint64_t)v51);
      swift_retain();
      v37(v51, a5);
      sub_10000CDF0((uint64_t)v37);
      swift_errorRelease();
      sub_10000D938((uint64_t)v51, &qword_100059930);
    }
    else
    {
      swift_errorRelease();
    }
  }
  else
  {
    sub_10000D8DC(a4, v14, (uint64_t *)&unk_100059C70);
    if (sub_10000CD2C(v14, 1, v15) == 1)
    {
      sub_10000D938(v14, (uint64_t *)&unk_100059C70);
      if (qword_100059760 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_10003CEA0();
      sub_10000CD54(v33, (uint64_t)qword_10005B8B0);
      uint64_t v34 = sub_10003CE80();
      os_log_type_t v35 = sub_10003D100();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Moments finished without an error or a videoURL", v36, 2u);
        sub_10000DA3C();
      }
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v21, v14, v15);
      if (qword_100059760 != -1) {
        swift_once();
      }
      uint64_t v38 = sub_10003CEA0();
      sub_10000CD54(v38, (uint64_t)qword_10005B8B0);
      sub_10000CD8C(a2, (uint64_t)v51);
      v39 = sub_10003CE80();
      os_log_type_t v40 = sub_10003D120();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v48 = a2;
        uint64_t v41 = v6;
        v42 = (uint8_t *)swift_slowAlloc();
        uint64_t v50 = swift_slowAlloc();
        *(_DWORD *)v42 = 136446210;
        sub_10000CD8C((uint64_t)v51, (uint64_t)v49);
        uint64_t v43 = sub_10000BF2C((uint64_t)v49);
        unint64_t v45 = v44;
        sub_10000D938((uint64_t)v49, &qword_100059930);
        v49[0] = sub_10000CE00(v43, v45, &v50);
        sub_10003D1B0();
        uint64_t v6 = v41;
        a2 = v48;
        swift_bridgeObjectRelease();
        sub_10000D5B8((uint64_t)v51);
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "Moments finished processing request %{public}s", v42, 0xCu);
        swift_arrayDestroy();
        sub_10000DA3C();
        sub_10000DA3C();
      }
      else
      {
        sub_10000D5B8((uint64_t)v51);
      }

      v46 = *(void (**)(uint64_t, uint64_t))(v6
                                                    + OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_onRequestFinishedProcessing);
      if (v46)
      {
        swift_retain();
        v46(a2, v21);
        sub_10000CDF0((uint64_t)v46);
      }
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v21, v15);
    }
  }
  return sub_10000B450(0);
}

uint64_t sub_10000CCE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000CD2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10000CD54(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000CD8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000CDF0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000CE00(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000CED4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000D608((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000D608((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000D5B8((uint64_t)v12);
  return v7;
}

uint64_t sub_10000CED4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10000D02C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_10003D1C0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_10000D104(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_10003D2A0();
    if (!v8)
    {
      uint64_t result = sub_10003D2D0();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_10000D02C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_10003D300();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_10000D104(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_10000D19C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_10000D378(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    unint64_t v2 = sub_10000D378((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10000D19C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_10003D020();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_10000D310(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_10003D270();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_10003D300();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_10003D2D0();
  __break(1u);
  return result;
}

void *sub_10000D310(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000CCE8(&qword_100059938);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10000D378(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000CCE8(&qword_100059938);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10000D528(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000D450(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_10000D450(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_10003D300();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_10000D528(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_10003D300();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_10000D5B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000D608(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D668(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_10000D680()
{
  unint64_t result = qword_100059948;
  if (!qword_100059948)
  {
    sub_10003D130();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059948);
  }
  return result;
}

unint64_t sub_10000D6D0()
{
  unint64_t result = qword_100059950;
  if (!qword_100059950)
  {
    sub_10000D724(&qword_100059EE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059950);
  }
  return result;
}

uint64_t sub_10000D724(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000D76C()
{
  unint64_t result = qword_100059958;
  if (!qword_100059958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059958);
  }
  return result;
}

uint64_t sub_10000D7B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D81C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D880(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MessageRequest();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D8DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000CCE8(a3);
  sub_10000DA20();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_10000D938(uint64_t a1, uint64_t *a2)
{
  sub_10000CCE8(a2);
  sub_10000DA20();
  sub_10000DA30();
  v3();
  return a1;
}

uint64_t sub_10000D988(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000D9C4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000DA3C()
{
  return swift_slowDealloc();
}

uint64_t sub_10000DA54(uint64_t a1)
{
  *(void *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t sub_10000DA68(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10000DA74(uint64_t a1)
{
  *(void *)(v1 - 168) = a1;
  return v1 - 168;
}

BOOL sub_10000DA88(char a1, char a2)
{
  return a1 == a2;
}

void sub_10000DA98(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_10000DAC0(unsigned __int8 a1)
{
  return sub_10003D3C0();
}

BOOL sub_10000DB08(char *a1, char *a2)
{
  return sub_10000DA88(*a1, *a2);
}

Swift::Int sub_10000DB14()
{
  return sub_10000DAC0(*v0);
}

void sub_10000DB1C(uint64_t a1)
{
  sub_10000DA98(a1, *v1);
}

Swift::Int sub_10000DB24()
{
  Swift::UInt v1 = *v0;
  sub_10003D3A0();
  sub_10003D3B0(v1);
  return sub_10003D3C0();
}

id sub_10000DB68@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_10003CD40();
  __chkstk_darwin(v4);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [objc_allocWithZone((Class)TUFeatureFlags) init];
  unsigned int v8 = [v7 transcriptionEvaluationEnabled];

  if (v8)
  {
    uint64_t v9 = sub_10000E4A4();
    v10(v9);
    uint64_t v11 = type metadata accessor for TextCaptionsWriter();
    swift_allocObject();
    uint64_t v12 = sub_10000EB84((uint64_t)v6, (uint64_t)a1);
    id result = a1;
    uint64_t v14 = &off_100051AD8;
  }
  else
  {
    uint64_t v11 = type metadata accessor for WebVTTCaptionsWriter();
    uint64_t v15 = sub_10000E4A4();
    v16(v15);
    id result = (id)sub_100024298((uint64_t)v6, (uint64_t)a1);
    uint64_t v12 = (uint64_t)result;
    uint64_t v14 = &off_1000524F0;
  }
  a2[3] = v11;
  a2[4] = (uint64_t)v14;
  *a2 = v12;
  return result;
}

void sub_10000DCDC()
{
  uint64_t v2 = v0;
  sub_10000CD8C(v0 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_request, (uint64_t)v9);
  sub_10000E400(v9, v9[3]);
  uint64_t v3 = sub_10000E4C0();
  v4(v3);
  sub_10000D5B8((uint64_t)v9);
  if (!v1)
  {
    uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_localCaptionsMachine);
    if (v5)
    {
      id v6 = v5;
      sub_1000111D0();
    }
    id v7 = *(void **)(v2 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_remoteCaptionsMachine);
    if (v7)
    {
      id v8 = v7;
      sub_1000111D0();
    }
    *(unsigned char *)(v2 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_state) = 1;
  }
}

void sub_10000DDB4()
{
  uint64_t v2 = v0;
  sub_10000CD8C(v0 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_request, (uint64_t)v9);
  sub_10000E400(v9, v9[3]);
  uint64_t v3 = sub_10000E4C0();
  v4(v3);
  sub_10000D5B8((uint64_t)v9);
  if (!v1)
  {
    uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_localCaptionsMachine);
    if (v5)
    {
      id v6 = v5;
      sub_1000111F8();
    }
    id v7 = *(void **)(v2 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_remoteCaptionsMachine);
    if (v7)
    {
      id v8 = v7;
      sub_1000111F8();
    }
    *(unsigned char *)(v2 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_state) = 2;
  }
}

void sub_10000DE8C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_localCaptionsMachine);
  if (v2)
  {
    id v3 = v2;
    sub_1000111F8();
  }
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_remoteCaptionsMachine);
  if (v4)
  {
    id v5 = v4;
    sub_1000111F8();
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_state) = 3;
}

void sub_10000DF0C()
{
}

id sub_10000DF4C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MediaRequest();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000E064()
{
  return type metadata accessor for MediaRequest();
}

uint64_t type metadata accessor for MediaRequest()
{
  uint64_t result = qword_100059998;
  if (!qword_100059998) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000E0B4()
{
  sub_10003CDA0();
  if (v0 <= 0x3F)
  {
    sub_10000E1AC();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10000E1AC()
{
  if (!qword_1000599A8)
  {
    sub_10003CD40();
    unint64_t v0 = sub_10003D190();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000599A8);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for MediaRequest.MediaRequestState(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MediaRequest.MediaRequestState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for MediaRequest.MediaRequestState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000E364);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_10000E38C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000E398(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MediaRequest.MediaRequestState()
{
  return &type metadata for MediaRequest.MediaRequestState;
}

unint64_t sub_10000E3B4()
{
  unint64_t result = qword_1000599B0;
  if (!qword_1000599B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000599B0);
  }
  return result;
}

void *sub_10000E400(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000E444(uint64_t a1)
{
  uint64_t v2 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E4A4()
{
  return v0;
}

uint64_t sub_10000E4C0()
{
  return v0;
}

uint64_t getEnumTagSinglePayload for MessageControllerError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 5) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for MessageControllerError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000E62CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageControllerError()
{
  return &type metadata for MessageControllerError;
}

uint64_t sub_10000E664(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000515B0;
  v6._object = a2;
  unint64_t v4 = sub_10003D310(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 6) {
    return 6;
  }
  else {
    return v4;
  }
}

unint64_t sub_10000E6B0(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x556E776F6E6B6E75;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6575716552637661;
      break;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      unint64_t result = 0x5364696C61766E69;
      break;
  }
  return result;
}

uint64_t sub_10000E794(char *a1, char *a2)
{
  return sub_1000362DC(*a1, *a2);
}

Swift::Int sub_10000E7A0()
{
  return sub_10002C434(*v0);
}

uint64_t sub_10000E7A8(uint64_t a1)
{
  return sub_10002C554(a1, *v1);
}

Swift::Int sub_10000E7B0(uint64_t a1)
{
  return sub_10002C618(a1, *v1);
}

uint64_t sub_10000E7B8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000E664(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10000E7E8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000E6B0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000E818()
{
  unint64_t result = qword_1000599B8;
  if (!qword_1000599B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000599B8);
  }
  return result;
}

uint64_t sub_10000E874(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100051660;
  v6._object = a2;
  unint64_t v4 = sub_10003D310(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_10000E8C0(char a1)
{
  if (!a1) {
    return sub_10000EB6C();
  }
  if (a1 == 1) {
    return 0xD000000000000014;
  }
  return 0x64657472617473;
}

uint64_t sub_10000E908(unsigned __int8 *a1, char *a2)
{
  return sub_1000361E0(*a1, *a2);
}

Swift::Int sub_10000E914()
{
  return sub_10002C484(*v0);
}

uint64_t sub_10000E91C(uint64_t a1)
{
  return sub_10002C4E8(a1, *v1);
}

Swift::Int sub_10000E924(uint64_t a1)
{
  return sub_10002C664(a1, *v1);
}

uint64_t sub_10000E92C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000E874(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10000E95C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000E8C0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000E988()
{
  return sub_10000E8C0(*v0);
}

uint64_t getEnumTagSinglePayload for MessageControllerState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 2) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for MessageControllerState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000EAE4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageControllerState()
{
  return &type metadata for MessageControllerState;
}

unint64_t sub_10000EB20()
{
  unint64_t result = qword_1000599C0;
  if (!qword_1000599C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000599C0);
  }
  return result;
}

uint64_t sub_10000EB6C()
{
  return 0x676E6974696177;
}

uint64_t sub_10000EB84(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC18FTLivePhotoService18TextCaptionsWriter_text);
  void *v5 = 0;
  v5[1] = 0xE000000000000000;
  uint64_t v6 = v2 + OBJC_IVAR____TtC18FTLivePhotoService18TextCaptionsWriter_fileURL;
  sub_10003CD40();
  sub_10000DA20();
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v6, a1);
  *(void *)(v2 + OBJC_IVAR____TtC18FTLivePhotoService18TextCaptionsWriter_queue) = a2;
  return v2;
}

void sub_10000EC14()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  __chkstk_darwin(v3 - 8);
  sub_10000FB6C();
  uint64_t v4 = sub_10003CF30();
  sub_10000D9D8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_10000D9F4();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = *(void **)(v2 + OBJC_IVAR____TtC18FTLivePhotoService18TextCaptionsWriter_queue);
  *(void *)(v9 - v8) = v11;
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v9 - v8, enum case for DispatchPredicate.onQueue(_:), v4);
  id v12 = v11;
  LOBYTE(v11) = sub_10003CF50();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  if (v11)
  {
    if (qword_100059760 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v13 = sub_10003CEA0();
  sub_10000CD54(v13, (uint64_t)qword_10005B8B0);
  swift_retain_n();
  uint64_t v14 = sub_10003CE80();
  os_log_type_t v15 = sub_10003D120();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315394;
    type metadata accessor for TextCaptionsWriter();
    swift_retain();
    uint64_t v17 = sub_10003CFF0();
    sub_10000CE00(v17, v18, &v26);
    sub_10003D1B0();
    sub_10000FB38();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    uint64_t v19 = sub_10003CD40();
    sub_10000DA20();
    sub_10000FB84();
    v22(v20, v21);
    sub_10000FA0C(v1, 0, 1, v19);
    uint64_t v23 = sub_10000BFF0(v1);
    unint64_t v25 = v24;
    sub_10000E444(v1);
    sub_10000CE00(v23, v25, &v26);
    sub_10003D1B0();
    sub_10000FB38();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Start writing for %s to %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_10000EF4C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10003CF30();
  sub_10000D9D8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_10000D9F4();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = *(void **)(v2 + OBJC_IVAR____TtC18FTLivePhotoService18TextCaptionsWriter_queue);
  *(void *)(v9 - v8) = v11;
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v9 - v8, enum case for DispatchPredicate.onQueue(_:), v4);
  id v12 = v11;
  LOBYTE(v11) = sub_10003CF50();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  if (v11)
  {
    int64_t v14 = *(void *)(a1 + 16);
    if (v14)
    {
      sub_10000FA34(0, v14, 0);
      os_log_type_t v15 = (uint64_t *)(a1 + 40);
      do
      {
        uint64_t v17 = *(v15 - 1);
        uint64_t v16 = *v15;
        unint64_t v19 = *((void *)&_swiftEmptyArrayStorage + 2);
        unint64_t v18 = *((void *)&_swiftEmptyArrayStorage + 3);
        unint64_t v20 = v19 + 1;
        swift_bridgeObjectRetain();
        if (v19 >= v18 >> 1) {
          sub_10000FA34((char *)(v18 > 1), v19 + 1, 1);
        }
        v15 += 5;
        *((void *)&_swiftEmptyArrayStorage + 2) = v20;
        uint64_t v21 = (char *)&_swiftEmptyArrayStorage + 16 * v19;
        *((void *)v21 + 4) = v17;
        *((void *)v21 + 5) = v16;
        --v14;
      }
      while (v14);
    }
    else
    {
      unint64_t v20 = *((void *)&_swiftEmptyArrayStorage + 2);
    }
    uint64_t v22 = (uint64_t *)(v2 + OBJC_IVAR____TtC18FTLivePhotoService18TextCaptionsWriter_text);
    uint64_t v23 = *(void *)(v2 + OBJC_IVAR____TtC18FTLivePhotoService18TextCaptionsWriter_text);
    unint64_t v24 = *(void **)(v2 + OBJC_IVAR____TtC18FTLivePhotoService18TextCaptionsWriter_text + 8);
    if (v20)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      unint64_t v25 = (void **)((char *)&_swiftEmptyArrayStorage + 40);
      do
      {
        uint64_t v27 = (uint64_t)*(v25 - 1);
        uint64_t v26 = *v25;
        if (!v23 && v24 == (void *)0xE000000000000000 || (sub_10003D330() & 1) != 0)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v23 = v27;
          unint64_t v24 = v26;
        }
        else
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v28._countAndFlagsBits = 32;
          v28._object = (void *)0xE100000000000000;
          sub_10003D010(v28);
          swift_bridgeObjectRetain();
          v29._countAndFlagsBits = v27;
          v29._object = v26;
          sub_10003D010(v29);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        v25 += 2;
        --v20;
      }
      while (v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    uint64_t *v22 = v23;
    v22[1] = (uint64_t)v24;
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000F200()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  __chkstk_darwin(v3 - 8);
  sub_10000D9F4();
  sub_10003CFE0();
  sub_10000D9D8();
  __chkstk_darwin(v4);
  sub_10000D9F4();
  uint64_t v5 = sub_10003CF30();
  sub_10000D9D8();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_10000FB6C();
  uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC18FTLivePhotoService18TextCaptionsWriter_queue);
  void *v1 = v9;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v1, enum case for DispatchPredicate.onQueue(_:), v5);
  id v10 = v9;
  char v11 = sub_10003CF50();
  (*(void (**)(void *, uint64_t))(v7 + 8))(v1, v5);
  if (v11)
  {
    if (qword_100059760 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v12 = sub_10003CEA0();
  sub_10000CD54(v12, (uint64_t)qword_10005B8B0);
  swift_retain_n();
  uint64_t v13 = sub_10003CE80();
  os_log_type_t v14 = sub_10003D120();
  if (os_log_type_enabled(v13, v14))
  {
    os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
    v22[0] = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v15 = 136315138;
    type metadata accessor for TextCaptionsWriter();
    swift_retain();
    uint64_t v16 = sub_10003CFF0();
    sub_10000CE00(v16, v17, v22);
    sub_10003D1B0();
    sub_10000FB38();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Stopping %s", v15, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {

    sub_10000FB38();
  }
  uint64_t v18 = *(void *)(v2 + OBJC_IVAR____TtC18FTLivePhotoService18TextCaptionsWriter_text + 8);
  v22[0] = *(void *)(v2 + OBJC_IVAR____TtC18FTLivePhotoService18TextCaptionsWriter_text);
  v22[1] = v18;
  swift_bridgeObjectRetain();
  sub_10003CFD0();
  sub_10000F9C0();
  sub_10003D1D0();
  uint64_t v19 = sub_10000FB50();
  v20(v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000F784()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18FTLivePhotoService18TextCaptionsWriter_fileURL;
  sub_10003CD40();
  sub_10000DA20();
  (*(void (**)(uint64_t))(v2 + 8))(v1);

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000F804()
{
  sub_10000F784();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10000F85C()
{
  return type metadata accessor for TextCaptionsWriter();
}

uint64_t type metadata accessor for TextCaptionsWriter()
{
  uint64_t result = qword_1000599F8;
  if (!qword_1000599F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000F8AC()
{
  uint64_t result = sub_10003CD40();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_10000F954()
{
}

uint64_t sub_10000F978(uint64_t a1)
{
  return sub_10000EF4C(a1);
}

uint64_t sub_10000F99C()
{
  return sub_10000F200();
}

unint64_t sub_10000F9C0()
{
  unint64_t result = qword_100059AC0;
  if (!qword_100059AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059AC0);
  }
  return result;
}

uint64_t sub_10000FA0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

char *sub_10000FA34(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10000FA54(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_10000FA54(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000CCE8(&qword_100059AD0);
    id v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100026988(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100026AA8((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_10000FB38()
{
  return swift_release_n();
}

uint64_t sub_10000FB50()
{
  return v0;
}

uint64_t *sub_10000FB98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10003CDA0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    long long v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
  }
  return a1;
}

uint64_t sub_10000FCAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003CDA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);

  return sub_10000D5B8(v5);
}

uint64_t sub_10000FD20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003CDA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  long long v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  return a1;
}

uint64_t sub_10000FDE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003CDA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  sub_10000FE64((uint64_t *)(a1 + *(int *)(a3 + 20)), (uint64_t *)(a2 + *(int *)(a3 + 20)));
  return a1;
}

uint64_t *sub_10000FE64(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        size_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t sub_100010094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003CDA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  return a1;
}

uint64_t sub_100010120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003CDA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_10000D5B8(a1 + v7);
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  return a1;
}

uint64_t sub_1000101B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000101C8);
}

uint64_t sub_1000101C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10003CDA0();
  sub_1000103D4();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return sub_10000CD2C(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_100010258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001026C);
}

void sub_10001026C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_10003CDA0();
  sub_1000103D4();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    sub_10000FA0C(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
}

uint64_t type metadata accessor for MessageRequest()
{
  uint64_t result = qword_100059B30;
  if (!qword_100059B30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100010340()
{
  uint64_t result = sub_10003CDA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_100010420()
{
  return sub_100010600(OBJC_IVAR___FTMomentsRequest_avcRequest);
}

id sub_100010460()
{
  return sub_100010600(OBJC_IVAR___FTMomentsRequest_session);
}

id sub_10001046C(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR___FTMomentsRequest_avcRequest] = a1;
  *(void *)&v2[OBJC_IVAR___FTMomentsRequest_session] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, "init");
}

void sub_100010518()
{
}

id sub_100010558()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LivePhotosMomentsRequest()
{
  return self;
}

id sub_100010600@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(v1 + a1);
}

id sub_100010608()
{
  type metadata accessor for FTMessagingIDSService();
  id result = sub_100026F44(0xD00000000000002ALL, 0x80000001000411A0);
  qword_100059BA0 = (uint64_t)result;
  return result;
}

id sub_100010678()
{
  if (qword_100059740 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_100059BA0;

  return v0;
}

char *sub_1000106D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  return sub_100028ED0(a1, a2, a3);
}

id sub_100010720()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FTMessagingIDSService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FTMessagingIDSService()
{
  return self;
}

void sub_10001077C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, _UNKNOWN **a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_100011014();
  a23 = v25;
  a24 = v26;
  Swift::String v28 = v27;
  uint64_t v29 = v24 + OBJC_IVAR____TtC18FTLivePhotoService25MessageMomentsAVCDelegate_owner;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v30 = *(void *)(v29 + 8);
    if (v28)
    {
      *((void *)&a10 + 1) = sub_100010F14();
      a11 = &off_100051700;
      *(void *)&a9 = v28;
    }
    else
    {
      a11 = 0;
      a9 = 0u;
      a10 = 0u;
    }
    swift_getObjectType();
    unint64_t v31 = *(void (**)(uint64_t))(v30 + 16);
    id v32 = v28;
    uint64_t v33 = sub_100010FD8();
    v31(v33);
    swift_unknownObjectRelease();
    sub_100010F54((uint64_t)&a9, &qword_100059930);
  }
  sub_100010FF8();
}

void sub_100010854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, _UNKNOWN **a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_100011014();
  a23 = v25;
  a24 = v26;
  Swift::String v28 = v27;
  uint64_t v29 = v24 + OBJC_IVAR____TtC18FTLivePhotoService25MessageMomentsAVCDelegate_owner;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v30 = *(void *)(v29 + 8);
    if (v28)
    {
      *((void *)&a10 + 1) = sub_100010F14();
      a11 = &off_100051700;
      *(void *)&a9 = v28;
    }
    else
    {
      a11 = 0;
      a9 = 0u;
      a10 = 0u;
    }
    swift_getObjectType();
    unint64_t v31 = *(void (**)(uint64_t))(v30 + 24);
    id v32 = v28;
    uint64_t v33 = sub_100010FD8();
    v31(v33);
    swift_unknownObjectRelease();
    sub_100010F54((uint64_t)&a9, &qword_100059930);
  }
  sub_100010FF8();
}

void sub_10001092C(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void (*a6)(id, void *, void *))
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  id v13 = a5;
  a6(v10, a4, a5);
}

uint64_t sub_1000109C8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC18FTLivePhotoService25MessageMomentsAVCDelegate_owner;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v7 = *(void *)(v5 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8))(a1, a2, ObjectType, v7);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_100010AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, unint64_t a13, _UNKNOWN **a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_100011014();
  a25 = v27;
  a26 = v28;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v39 = v26 + OBJC_IVAR____TtC18FTLivePhotoService25MessageMomentsAVCDelegate_owner;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v40 = *(void *)(v39 + 8);
    uint64_t ObjectType = swift_getObjectType();
    a13 = sub_100010F14();
    a14 = &off_100051700;
    a10 = v36;
    uint64_t v42 = v30;
    uint64_t v43 = *(void (**)(uint64_t, void **, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 32);
    id v44 = v36;
    v43(v38, &a10, v34, v32, v42, ObjectType, v40);
    swift_unknownObjectRelease();
    sub_10000D5B8((uint64_t)&a10);
  }
  sub_100010FF8();
}

#error "100010CF4: call analysis failed (funcsize=98)"

uint64_t sub_100010D44(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18FTLivePhotoService25MessageMomentsAVCDelegate_owner;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = *(void *)(v3 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, ObjectType, v5);
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_100010E3C()
{
  *(void *)&v0[OBJC_IVAR____TtC18FTLivePhotoService25MessageMomentsAVCDelegate_owner + 8] = 0;
  swift_unknownObjectWeakInit();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessageMomentsAVCDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100010EAC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessageMomentsAVCDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MessageMomentsAVCDelegate()
{
  return self;
}

unint64_t sub_100010F14()
{
  unint64_t result = qword_100059C60;
  if (!qword_100059C60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100059C60);
  }
  return result;
}

uint64_t sub_100010F54(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000CCE8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100010FB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100010FD8()
{
  return v0;
}

uint64_t destroy for Caption()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Caption(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Caption(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return a1;
}

__n128 initializeWithTake for Caption(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Caption(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for Caption(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 36))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Caption(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 36) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 36) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Caption()
{
  return &type metadata for Caption;
}

void sub_1000111D0()
{
}

void sub_1000111F8()
{
}

void sub_100011220()
{
  sub_100014728();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_10003CEB0();
  sub_10000D9D8();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  uint64_t v11 = sub_100014678();
  sub_10000D9D8();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  sub_1000146A0();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v0;
  v18[4] = v6;
  v18[5] = v15;
  v18[0] = _NSConcreteStackBlock;
  sub_100014770(COERCE_DOUBLE(1107296256));
  v18[2] = sub_1000147FC;
  v18[3] = v4;
  uint64_t v16 = _Block_copy(v18);
  id v17 = v0;
  sub_10003CEC0();
  sub_100014314();
  sub_10000CCE8(&qword_100059D58);
  sub_100014364();
  sub_1000146FC();
  sub_10003D160();
  _Block_release(v16);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v7);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v11);
  swift_release();
  sub_1000146B8();
}

char *sub_1000113D4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v4[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_avcCaptionsClient] = 0;
  *(void *)&v4[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_lastCaptions] = 0;
  v4[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_hasReceivedAudio] = 0;
  *(void *)&v4[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_startTime] = 0;
  *(void *)&v4[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_streamToken] = a2;
  *(void *)&v4[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_queue] = a4;
  sub_10000CD8C(a1, (uint64_t)&v4[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_captionsWriter]);
  v16.receiver = v4;
  v16.super_class = ObjectType;
  id v10 = a4;
  uint64_t v11 = (char *)objc_msgSendSuper2(&v16, "init");
  uint64_t v12 = sub_10001151C(a2, a3);

  uint64_t v13 = sub_10003CDE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a3, v13);
  sub_10000D5B8(a1);
  uint64_t v14 = *(void **)&v11[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_avcCaptionsClient];
  *(void *)&v11[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_avcCaptionsClient] = v12;

  return v11;
}

void *sub_10001151C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = sub_10000CCE8(&qword_100059D40);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    if (qword_100059760 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_10003CEA0();
    sub_10000CD54(v25, (uint64_t)qword_10005B8B0);
    uint64_t v26 = sub_10003CE80();
    os_log_type_t v27 = sub_10003D100();
    if (!os_log_type_enabled(v26, v27)) {
      goto LABEL_16;
    }
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Requesting captions provider with stream streamToken == 0. Will not create client.", v28, 2u);
    goto LABEL_15;
  }
  id v10 = [objc_allocWithZone((Class)AVCCaptionsClient) initWithDelegate:v2 streamToken:a1];
  if (!v10)
  {
    if (qword_100059760 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_10003CEA0();
    sub_10000CD54(v29, (uint64_t)qword_10005B8B0);
    uint64_t v26 = sub_10003CE80();
    os_log_type_t v30 = sub_10003D100();
    if (!os_log_type_enabled(v26, v30)) {
      goto LABEL_16;
    }
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v57 = a1;
    uint64_t v58 = v32;
    *(_DWORD *)uint64_t v31 = 136315138;
    uint64_t v33 = sub_10003CFF0();
    uint64_t v57 = sub_10000CE00(v33, v34, &v58);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v26, v30, "Failed to create AVCCaptionsClient with stream token %s.", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
LABEL_15:
    swift_slowDealloc();
LABEL_16:

    return 0;
  }
  uint64_t v11 = v10;
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_10003CEA0();
  uint64_t v13 = sub_10000CD54(v12, (uint64_t)qword_10005B8B0);
  id v14 = v11;
  v55[2] = v13;
  uint64_t v15 = sub_10003CE80();
  os_log_type_t v16 = sub_10003D120();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v56 = v11;
  v55[1] = ObjectType;
  if (v17)
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v57 = a1;
    uint64_t v58 = v19;
    *(_DWORD *)uint64_t v18 = 136315394;
    v55[0] = a2;
    uint64_t v20 = sub_10003CFF0();
    uint64_t v57 = sub_10000CE00(v20, v21, &v58);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v57 = (uint64_t)v14;
    sub_1000142BC();
    id v22 = v14;
    uint64_t v23 = sub_10003CFF0();
    uint64_t v57 = sub_10000CE00(v23, v24, &v58);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Captions client created for token %s: %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v11 = v56;
    swift_slowDealloc();
  }
  else
  {
  }
  id v35 = [objc_allocWithZone((Class)AVCCaptionsConfig) init];
  Class isa = sub_10003CDC0().super.isa;
  [v35 setLocale:isa];

  [v35 setUsage:3];
  [v14 configureCaptions:v35];
  id v37 = v35;
  id v38 = v3;
  id v39 = v37;
  id v40 = v38;
  uint64_t v41 = sub_10003CE80();
  os_log_type_t v42 = sub_10003D120();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 136315394;
    id v44 = [v39 locale];
    if (v44)
    {
      unint64_t v45 = v44;
      sub_10003CDD0();

      uint64_t v46 = 0;
    }
    else
    {
      uint64_t v46 = 1;
    }
    uint64_t v47 = sub_10003CDE0();
    sub_10000FA0C((uint64_t)v9, v46, 1, v47);
    uint64_t v48 = sub_10000BFD0((uint64_t)v9);
    unint64_t v50 = v49;
    sub_10001425C((uint64_t)v9);
    uint64_t v57 = sub_10000CE00(v48, v50, &v58);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2080;
    uint64_t v57 = (uint64_t)v40;
    id v51 = v40;
    uint64_t v52 = sub_10003CFF0();
    uint64_t v57 = sub_10000CE00(v52, v53, &v58);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "Captions client configure with locale: %s self %s", (uint8_t *)v43, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return v56;
  }
  else
  {
  }
  return v11;
}

uint64_t sub_100011C20(char *a1)
{
  swift_getObjectType();
  [self mediaTimeBase];
  *(void *)&a1[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_startTime] = v2;
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10003CEA0();
  sub_10000CD54(v3, (uint64_t)qword_10005B8B0);
  uint64_t v4 = a1;
  uint64_t v5 = sub_10003CE80();
  os_log_type_t v6 = sub_10003D120();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    v17[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v8 = v4;
    uint64_t v9 = sub_10003CFF0();
    sub_10000CE00(v9, v10, v17);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v11 = sub_10003CFF0();
    sub_10000CE00(v11, v12, v17);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Starting captions machine %s at timestamp %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v13 = *(void **)&v4[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_avcCaptionsClient];
  if (v13) {
    [v13 enableCaptions:1];
  }
  sub_10000CD8C((uint64_t)&v4[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_captionsWriter], (uint64_t)v17);
  uint64_t v14 = v18;
  uint64_t v15 = v19;
  sub_10000E400(v17, v18);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
  return sub_10000D5B8((uint64_t)v17);
}

uint64_t sub_100011ED0(void *a1)
{
  swift_getObjectType();
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10003CEA0();
  sub_10000CD54(v2, (uint64_t)qword_10005B8B0);
  uint64_t v3 = a1;
  uint64_t v4 = sub_10003CE80();
  os_log_type_t v5 = sub_10003D120();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    v21[0] = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v6 = 136315138;
    uint64_t v7 = v3;
    uint64_t v8 = sub_10003CFF0();
    sub_10000CE00(v8, v9, v21);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Stopping captions machine %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  unint64_t v10 = *(void **)&v3[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_avcCaptionsClient];
  if (v10) {
    [v10 enableCaptions:0];
  }
  uint64_t v11 = OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_lastCaptions;
  unint64_t v12 = *(void **)&v3[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_lastCaptions];
  if (v12)
  {
    sub_10000CD8C((uint64_t)&v3[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_captionsWriter], (uint64_t)v21);
    uint64_t v13 = v22;
    uint64_t v14 = v23;
    sub_10000E400(v21, v22);
    id v15 = v12;
    uint64_t v16 = sub_100012180(v15);
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v16, v13);
    swift_bridgeObjectRelease();

    sub_10000D5B8((uint64_t)v21);
    BOOL v17 = *(void **)&v3[v11];
    *(void *)&v3[v11] = 0;
  }
  sub_10000CD8C((uint64_t)&v3[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_captionsWriter], (uint64_t)v21);
  uint64_t v18 = v22;
  uint64_t v19 = v23;
  sub_10000E400(v21, v22);
  (*(void (**)(uint64_t, uint64_t))(v19 + 24))(v18, v19);
  return sub_10000D5B8((uint64_t)v21);
}

uint64_t sub_100012180(void *a1)
{
  [a1 utteranceStartTimestamp];
  double v4 = v3;
  double v5 = *(double *)(v1 + OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_startTime);
  uint64_t result = sub_100014400(a1);
  if (v7)
  {
    uint64_t v8 = result;
    uint64_t v9 = v7;
    double v10 = v4 - v5;
    [a1 utteranceDuration];
    uint64_t v12 = v11;
    unsigned int v13 = [a1 utteranceNumber];
    sub_10000CCE8(&qword_100059D68);
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_100042840;
    *(void *)(result + 32) = v8;
    *(void *)(result + 40) = v9;
    *(void *)(result + 48) = v12;
    *(double *)(result + 56) = v10;
    *(_DWORD *)(result + 64) = v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100012240()
{
}

uint64_t type metadata accessor for CaptionsMachine()
{
  return self;
}

void sub_1000123C0()
{
  sub_100014728();
  uint64_t v22 = v3;
  uint64_t v23 = v4;
  uint64_t v6 = v5;
  char v8 = v7;
  double v10 = v9;
  uint64_t v11 = sub_10003CEB0();
  sub_10000D9D8();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100014678();
  sub_10000D9D8();
  uint64_t v16 = v15;
  __chkstk_darwin(v17);
  sub_1000146A0();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v10;
  *(unsigned char *)(v18 + 24) = v8;
  *(void *)(v18 + 32) = v6;
  *(void *)(v18 + 40) = v0;
  v25[4] = v22;
  v25[5] = v18;
  v25[0] = _NSConcreteStackBlock;
  sub_100014770(COERCE_DOUBLE(1107296256));
  v25[2] = sub_1000147FC;
  v25[3] = v23;
  uint64_t v19 = _Block_copy(v25);
  id v20 = v10;
  swift_errorRetain();
  id v21 = v0;
  sub_10003CEC0();
  sub_100014314();
  sub_10000CCE8(&qword_100059D58);
  sub_100014364();
  sub_1000146D0();
  sub_1000147E8();
  sub_10003D160();
  _Block_release(v19);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v11);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v2, v24);
  swift_release();
  sub_1000146B8();
}

void sub_10001258C()
{
  sub_100014728();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7;
  swift_getObjectType();
  uint64_t v9 = sub_10003CEA0();
  sub_10000D9D8();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_100014794();
  if (qword_100059760 != -1) {
    swift_once();
  }
  sub_10000CD54(v9, (uint64_t)qword_10005B8B0);
  uint64_t v13 = sub_10001477C();
  v14(v13);
  id v15 = v8;
  swift_errorRetain();
  id v16 = v4;
  id v17 = v15;
  swift_errorRetain();
  id v18 = v16;
  uint64_t v19 = sub_10003CE80();
  os_log_type_t v20 = sub_10003D120();
  if (os_log_type_enabled(v19, v20))
  {
    id v35 = v2;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315906;
    if (v8)
    {
      sub_1000142BC();
      id v22 = v17;
      uint64_t v23 = sub_10003CFF0();
      unint64_t v25 = v24;
    }
    else
    {
      unint64_t v25 = 0xE300000000000000;
      uint64_t v23 = 7104878;
    }
    uint64_t v26 = sub_10000CE00(v23, v25, &v36);
    sub_1000147D0(v26);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v27 = sub_10003CFF0();
    sub_10000CE00(v27, v28, &v36);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 22) = 2080;
    if (v6)
    {
      swift_errorRetain();
      sub_10000CCE8((uint64_t *)&unk_100059D70);
      uint64_t v29 = sub_10003CFF0();
      unint64_t v31 = v30;
    }
    else
    {
      unint64_t v31 = 0xE300000000000000;
      uint64_t v29 = 7104878;
    }
    sub_10000CE00(v29, v31, &v36);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    *(_WORD *)(v21 + 32) = 2080;
    id v32 = v18;
    uint64_t v33 = sub_10003CFF0();
    sub_10000CE00(v33, v34, &v36);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, v35, (uint8_t *)v21, 0x2Au);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0, v9);
  sub_1000146B8();
}

void sub_100012A78()
{
  sub_100014728();
  uint64_t v21 = v3;
  uint64_t v5 = v4;
  char v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_10003CEB0();
  sub_10000D9D8();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  uint64_t v22 = sub_100014678();
  sub_10000D9D8();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_1000146A0();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v9;
  *(unsigned char *)(v17 + 24) = v7;
  *(void *)(v17 + 32) = v0;
  v23[4] = v5;
  v23[5] = v17;
  v23[0] = _NSConcreteStackBlock;
  sub_100014770(COERCE_DOUBLE(1107296256));
  v23[2] = sub_1000147FC;
  v23[3] = v21;
  id v18 = _Block_copy(v23);
  id v19 = v9;
  id v20 = v0;
  sub_10003CEC0();
  sub_100014314();
  sub_10000CCE8(&qword_100059D58);
  sub_100014364();
  sub_1000146D0();
  sub_10003D160();
  _Block_release(v18);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v10);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v2, v22);
  swift_release();
  sub_1000146B8();
}

void sub_100012C44()
{
  sub_100014728();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  char v6 = v5;
  swift_getObjectType();
  uint64_t v7 = sub_10003CEA0();
  sub_10000D9D8();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_100014794();
  if (qword_100059760 != -1) {
    swift_once();
  }
  sub_10000CD54(v7, (uint64_t)qword_10005B8B0);
  uint64_t v11 = sub_10001477C();
  v12(v11);
  id v13 = v6;
  id v14 = v4;
  id v15 = v13;
  id v16 = v14;
  uint64_t v17 = sub_10003CE80();
  os_log_type_t v18 = sub_10003D120();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 136315650;
    if (v6)
    {
      sub_1000142BC();
      id v20 = v15;
      uint64_t v21 = sub_10003CFF0();
      unint64_t v23 = v22;
    }
    else
    {
      unint64_t v23 = 0xE300000000000000;
      uint64_t v21 = 7104878;
    }
    uint64_t v24 = sub_10000CE00(v21, v23, &v30);
    sub_1000147D0(v24);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    type metadata accessor for AVCCaptionsReason(0);
    uint64_t v25 = sub_10003CFF0();
    sub_10000CE00(v25, v26, &v30);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2080;
    id v27 = v16;
    uint64_t v28 = sub_10003CFF0();
    sub_10000CE00(v28, v29, &v30);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, v2, (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
  }
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0, v7);
  sub_1000146B8();
}

void sub_100012FC8()
{
  sub_100014728();
  char v2 = v1;
  sub_10003CEB0();
  sub_10000D9D8();
  __chkstk_darwin(v3);
  sub_100014678();
  sub_10000D9D8();
  __chkstk_darwin(v4);
  sub_1000146A0();
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v0;
  v12[4] = sub_10001449C;
  v12[5] = v5;
  v12[0] = _NSConcreteStackBlock;
  sub_100014770(COERCE_DOUBLE(1107296256));
  v12[2] = sub_1000147FC;
  void v12[3] = &unk_100051C20;
  char v6 = _Block_copy(v12);
  id v7 = v0;
  sub_10003CEC0();
  sub_100014314();
  sub_10000CCE8(&qword_100059D58);
  sub_100014364();
  sub_1000146FC();
  sub_1000147AC();
  _Block_release(v6);
  uint64_t v8 = sub_100014758();
  v9(v8);
  uint64_t v10 = sub_100014740();
  v11(v10);
  swift_release();
  sub_1000146B8();
}

void sub_10001315C(uint64_t a1, void *a2)
{
  swift_getObjectType();
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10003CEA0();
  sub_10000CD54(v3, (uint64_t)qword_10005B8B0);
  id v4 = a2;
  uint64_t v5 = sub_10003CE80();
  os_log_type_t v6 = sub_10003D120();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v8 = sub_10003CFF0();
    sub_10000CE00(v8, v9, &v13);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    id v10 = v4;
    uint64_t v11 = sub_10003CFF0();
    sub_10000CE00(v11, v12, &v13);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Captions didDetectGibberish: isGibberish: %s self %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  *((unsigned char *)v4 + OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_hasReceivedAudio) = 1;
}

void sub_1000133E8()
{
  sub_100014728();
  char v2 = v1;
  sub_10003CEB0();
  sub_10000D9D8();
  __chkstk_darwin(v3);
  sub_100014678();
  sub_10000D9D8();
  __chkstk_darwin(v4);
  sub_1000146A0();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v0;
  *(void *)(v5 + 24) = v2;
  v13[4] = sub_1000143F8;
  v13[5] = v5;
  v13[0] = _NSConcreteStackBlock;
  sub_100014770(COERCE_DOUBLE(1107296256));
  v13[2] = sub_1000147FC;
  v13[3] = &unk_100051BD0;
  os_log_type_t v6 = _Block_copy(v13);
  id v7 = v2;
  id v8 = v0;
  sub_10003CEC0();
  sub_100014314();
  sub_10000CCE8(&qword_100059D58);
  sub_100014364();
  sub_1000146D0();
  sub_1000147E8();
  sub_10003D160();
  _Block_release(v6);
  uint64_t v9 = sub_100014758();
  v10(v9);
  uint64_t v11 = sub_100014740();
  v12(v11);
  swift_release();
  sub_1000146B8();
}

void sub_100013584(void *a1, void *a2)
{
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10003CEA0();
  sub_10000CD54(v4, (uint64_t)qword_10005B8B0);
  uint64_t v5 = a1;
  os_log_type_t v6 = sub_10003CE80();
  os_log_type_t v7 = sub_10003D120();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    v60[0] = swift_slowAlloc();
    *(_DWORD *)id v8 = 136315138;
    uint64_t v63 = (uint64_t)v5;
    type metadata accessor for CaptionsMachine();
    uint64_t v9 = v5;
    uint64_t v10 = sub_10003CFF0();
    uint64_t v63 = sub_10000CE00(v10, v11, v60);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Captions didUpdateCaptions self %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  v5[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_hasReceivedAudio] = 1;
  uint64_t v12 = OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_lastCaptions;
  uint64_t v13 = *(void **)&v5[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_lastCaptions];
  if (v13)
  {
    id v14 = v13;
    unsigned int v15 = [v14 utteranceNumber];
    if (a2)
    {
      if (v15 != [a2 utteranceNumber])
      {
        uint64_t v58 = v5;
        unint64_t v34 = v5;
        id v35 = v14;
        id v36 = a2;
        id v37 = v34;
        id v38 = v35;
        id v39 = v36;
        id v40 = sub_10003CE80();
        os_log_type_t v41 = sub_10003D120();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = swift_slowAlloc();
          v60[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v42 = 136315650;
          uint64_t v63 = (uint64_t)v37;
          type metadata accessor for CaptionsMachine();
          uint64_t v59 = v12;
          uint64_t v43 = v37;
          uint64_t v44 = sub_10003CFF0();
          uint64_t v63 = sub_10000CE00(v44, v45, v60);
          sub_10003D1B0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v42 + 12) = 2080;
          LODWORD(v63) = [v38 utteranceNumber];
          uint64_t v46 = sub_10003CFF0();
          uint64_t v63 = sub_10000CE00(v46, v47, v60);
          sub_10003D1B0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v42 + 22) = 2080;
          LODWORD(v63) = [v39 utteranceNumber];
          uint64_t v48 = sub_10003CFF0();
          uint64_t v63 = sub_10000CE00(v48, v49, v60);
          sub_10003D1B0();

          uint64_t v12 = v59;
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v40, v41, "updating transcript with lastCaptions because utterance numbers are different %s last: %s current: %s", (uint8_t *)v42, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        uint64_t v54 = *(void **)&v58[v12];
        *(void *)&v58[v12] = 0;

        sub_10000CD8C((uint64_t)&v37[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_captionsWriter], (uint64_t)v60);
        uint64_t v55 = v62;
        sub_10000E400(v60, v61);
        sub_100012180(v38);
        (*(void (**)(void))(v55 + 16))();
        swift_bridgeObjectRelease();

        goto LABEL_24;
      }

      goto LABEL_11;
    }
    __break(1u);
LABEL_26:
    __break(1u);
    return;
  }
  if (!a2) {
    goto LABEL_26;
  }
LABEL_11:
  unsigned int v16 = [a2 utteranceComplete];
  id v17 = a2;
  os_log_type_t v18 = v5;
  id v19 = v17;
  id v20 = v18;
  uint64_t v21 = sub_10003CE80();
  os_log_type_t v22 = sub_10003D120();
  BOOL v23 = os_log_type_enabled(v21, v22);
  if (v16)
  {
    if (v23)
    {
      uint64_t v56 = v5;
      uint64_t v24 = swift_slowAlloc();
      v60[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315394;
      uint64_t v63 = (uint64_t)v20;
      type metadata accessor for CaptionsMachine();
      uint64_t v25 = v20;
      uint64_t v26 = sub_10003CFF0();
      uint64_t v63 = sub_10000CE00(v26, v27, v60);
      sub_10003D1B0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 1024;
      unsigned int v28 = [v19 utteranceComplete];

      LODWORD(v63) = v28;
      sub_10003D1B0();

      _os_log_impl((void *)&_mh_execute_header, v21, v22, "updating transcript with utterance complete %s for utterance %{BOOL}d", (uint8_t *)v24, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v5 = v56;
      swift_slowDealloc();
    }
    else
    {
    }
    unint64_t v50 = *(void **)&v5[v12];
    *(void *)&v5[v12] = 0;

    sub_10000CD8C((uint64_t)&v20[OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_captionsWriter], (uint64_t)v60);
    uint64_t v51 = v62;
    sub_10000E400(v60, v61);
    sub_100012180(v19);
    (*(void (**)(void))(v51 + 16))();
    swift_bridgeObjectRelease();
LABEL_24:
    sub_10000D5B8((uint64_t)v60);
    return;
  }
  if (v23)
  {
    uint64_t v57 = a2;
    uint64_t v29 = swift_slowAlloc();
    v60[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 136315394;
    uint64_t v63 = (uint64_t)v20;
    type metadata accessor for CaptionsMachine();
    uint64_t v30 = v20;
    uint64_t v31 = sub_10003CFF0();
    uint64_t v63 = sub_10000CE00(v31, v32, v60);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 1024;
    unsigned int v33 = [v19 utteranceComplete];

    LODWORD(v63) = v33;
    sub_10003D1B0();

    _os_log_impl((void *)&_mh_execute_header, v21, v22, "updating last caption %s for utterance %{BOOL}d", (uint8_t *)v29, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v57;
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v52 = *(void **)&v5[v12];
  *(void *)&v5[v12] = a2;
  id v53 = v19;
}

void sub_100013E5C()
{
  sub_100014728();
  sub_10003CEB0();
  sub_10000D9D8();
  __chkstk_darwin(v0);
  sub_100014678();
  sub_10000D9D8();
  __chkstk_darwin(v1);
  sub_1000146A0();
  v7[4] = sub_100013FC4;
  v7[5] = 0;
  v7[0] = _NSConcreteStackBlock;
  sub_100014770(COERCE_DOUBLE(1107296256));
  v7[2] = sub_1000147FC;
  v7[3] = &unk_100051B80;
  char v2 = _Block_copy(v7);
  sub_10003CEC0();
  sub_100014314();
  sub_10000CCE8(&qword_100059D58);
  sub_100014364();
  sub_1000146FC();
  sub_1000147AC();
  _Block_release(v2);
  uint64_t v3 = sub_100014758();
  v4(v3);
  uint64_t v5 = sub_100014740();
  v6(v5);
  sub_1000146B8();
}

void sub_100013FC4()
{
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10003CEA0();
  sub_10000CD54(v0, (uint64_t)qword_10005B8B0);
  oslog = sub_10003CE80();
  os_log_type_t v1 = sub_10003D120();
  if (os_log_type_enabled(oslog, v1))
  {
    char v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Captions server did die", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_100014174()
{
  swift_getObjectType();
  v1._countAndFlagsBits = sub_10003D3D0();
  sub_10003D010(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = sub_10003D320();
  sub_10003D010(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0x3D6E656B6F7420;
  v3._object = (void *)0xE700000000000000;
  sub_10003D010(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 62;
  v4._object = (void *)0xE100000000000000;
  sub_10003D010(v4);
  return 60;
}

uint64_t sub_10001425C(uint64_t a1)
{
  uint64_t v2 = sub_10000CCE8(&qword_100059D40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000142BC()
{
  unint64_t result = qword_100059D48;
  if (!qword_100059D48)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100059D48);
  }
  return result;
}

uint64_t sub_1000142FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001430C()
{
  return swift_release();
}

unint64_t sub_100014314()
{
  unint64_t result = qword_100059D50;
  if (!qword_100059D50)
  {
    sub_10003CEB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059D50);
  }
  return result;
}

unint64_t sub_100014364()
{
  unint64_t result = qword_100059D60;
  if (!qword_100059D60)
  {
    sub_10000D724(&qword_100059D58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059D60);
  }
  return result;
}

uint64_t sub_1000143B8()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000143F8()
{
  sub_100013584(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100014400(void *a1)
{
  id v1 = [a1 text];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_10003CFC0();

  return v3;
}

uint64_t sub_100014464()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001449C()
{
  sub_10001315C(*(unsigned __int8 *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1000144A8()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_1000144E8()
{
}

void sub_100014514()
{
}

void sub_100014544()
{
}

uint64_t sub_100014574()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000145BC()
{
}

uint64_t sub_1000145E8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100014620()
{
  return sub_100011ED0(*(void **)(v0 + 16));
}

uint64_t sub_100014628()
{
  return sub_100011C20(*(char **)(v0 + 16));
}

uint64_t sub_100014678()
{
  return sub_10003CED0();
}

uint64_t sub_1000146D0()
{
  return sub_10003D1F0();
}

uint64_t sub_1000146FC()
{
  return sub_10003D1F0();
}

uint64_t sub_100014740()
{
  return v0;
}

uint64_t sub_100014758()
{
  return v0;
}

void sub_100014770(double a1)
{
  *(double *)(v1 - 120) = a1;
}

uint64_t sub_10001477C()
{
  return v0;
}

uint64_t sub_1000147AC()
{
  return sub_10003D160();
}

uint64_t sub_1000147D0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_1000147E8()
{
  return 0;
}

uint64_t sub_1000147FC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100014840(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___FTMomentsController_clientObject) = a1;
  return swift_unknownObjectRelease();
}

id sub_10001488C()
{
  return *(id *)(v0 + OBJC_IVAR___FTMomentsController_queue);
}

uint64_t sub_1000148F8(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___FTMomentsController_queue) = a1;
  return _objc_release_x1();
}

void sub_10001490C()
{
  sub_100014728();
  sub_10003D150();
  sub_10000D9D8();
  uint64_t v17 = v2;
  uint64_t v18 = v1;
  __chkstk_darwin(v1);
  sub_10001D6C0();
  uint64_t v15 = v3;
  sub_10003D130();
  sub_10001D8E0();
  __chkstk_darwin(v4);
  sub_10001D6C0();
  uint64_t v5 = sub_10003CED0();
  uint64_t v6 = sub_10000DA68(v5);
  __chkstk_darwin(v6);
  type metadata accessor for MessageMoments();
  swift_allocObject();
  id v16 = v0;
  uint64_t v14 = sub_10003636C();
  BSAuditTokenForCurrentProcess();
  id v7 = [objc_allocWithZone((Class)type metadata accessor for MediaAssetManager()) init];
  sub_10000CCE8(&qword_100059EB8);
  uint64_t v8 = swift_allocObject();
  swift_defaultActor_initialize();
  sub_10003CD40();
  sub_10000D988(0, &qword_100059EC0);
  sub_10001CF40(&qword_100059EC8, (void (*)(uint64_t))&type metadata accessor for URL);
  *(void *)(v8 + 112) = sub_10003CF80();
  sub_10003CE60();
  uint64_t v9 = sub_10003CE50();
  id v10 = sub_10001CD00(0, v14, v19, v20, v21, v22, v7, v8, v9);
  sub_10000D988(0, (unint64_t *)&unk_100059ED0);
  sub_10003CEC0();
  sub_10001CF40((unint64_t *)&qword_100059948, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000CCE8(&qword_100059EE0);
  sub_10001CF88((unint64_t *)&qword_100059950, &qword_100059EE0);
  sub_10003D1F0();
  (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v15, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v18);
  unint64_t v11 = (void *)sub_10003D170();
  id v12 = [self sharedInstance];
  type metadata accessor for MediaRecordingController();
  swift_allocObject();
  uint64_t v13 = sub_100032EC4();

  sub_10001CBD8((uint64_t)v10, v12, v13, v11);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  sub_1000146B8();
}

uint64_t sub_100014CE4()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR___FTMomentsController_messageController);
  swift_beginAccess();
  sub_10000E400(v1, v1[3]);
  return sub_10001F2CC();
}

void sub_100014F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  sub_10001D6F0();
  a21 = v23;
  a22 = v24;
  uint64_t v25 = v22;
  uint64_t v27 = v26;
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_10003CEA0();
  sub_10000CD54(v28, (uint64_t)qword_10005B880);
  swift_unknownObjectRetain_n();
  uint64_t v29 = (void *)sub_10003CE80();
  os_log_type_t v30 = sub_10003D120();
  if (sub_10001D7E4(v30))
  {
    uint64_t v31 = (_DWORD *)sub_10001D70C();
    a10 = sub_10001D7CC();
    *uint64_t v31 = 136315138;
    swift_unknownObjectRetain();
    sub_10000CCE8(&qword_100059E88);
    uint64_t v32 = sub_10003CFF0();
    sub_10000CE00(v32, v33, &a10);
    sub_10001D86C();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    sub_10001D740((void *)&_mh_execute_header, v34, v35, "MomentsController: Setting client Object %s");
    sub_10001D914();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  uint64_t v36 = swift_unknownObjectRetain();
  sub_100014840(v36);
  [*(id *)(v25 + OBJC_IVAR___FTMomentsController_livePhotoController) setClientObject:v27];
  sub_10001D724();
}

#error "1000150C4: call analysis failed (funcsize=26)"

id sub_1000150F4(void *a1)
{
  return sub_100015280(a1, (SEL *)&selRef_didFinishProcessingRawVideoMessage_);
}

void sub_100015100()
{
  sub_10001D6F0();
  uint64_t v2 = v0;
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10003CEA0();
  sub_10000CD54(v3, (uint64_t)qword_10005B880);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = (void *)sub_10003CE80();
  os_log_type_t v5 = sub_10003D120();
  if (sub_10001D7E4(v5))
  {
    sub_10001D70C();
    uint64_t v6 = (void *)sub_10001D8A8();
    sub_10001D92C(5.7779e-34);
    _swift_stdlib_bridgeErrorToNSError();
    sub_10001D780();
    void *v6 = v1;
    swift_errorRelease();
    swift_errorRelease();
    sub_10001D740((void *)&_mh_execute_header, v7, v8, "Request error %@");
    sub_10000CCE8(&qword_100059AC8);
    sub_10001D914();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v9 = *(void **)(v2 + OBJC_IVAR___FTMomentsController_clientObject);
  if (v9)
  {
    swift_unknownObjectRetain();
    id v10 = (void *)sub_10003CC80();
    [v9 didReceiveMessageRecordingError:v10];

    swift_unknownObjectRelease();
  }
  sub_10001D724();
}

id sub_100015274(void *a1)
{
  return sub_100015280(a1, (SEL *)&selRef_didFinishRecordingMedia_);
}

id sub_100015280(void *a1, SEL *a2)
{
  uint64_t v4 = v2;
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10003CEA0();
  sub_10000CD54(v6, (uint64_t)qword_10005B880);
  id v7 = a1;
  uint64_t v8 = sub_10003CE80();
  os_log_type_t v9 = sub_10003D120();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v15 = a2;
    id v10 = (uint8_t *)sub_10001D70C();
    uint64_t v16 = sub_10001D7CC();
    *(_DWORD *)id v10 = 136315138;
    sub_10000D988(0, &qword_100059EB0);
    id v11 = v7;
    uint64_t v12 = sub_10003CFF0();
    sub_10000CE00(v12, v13, &v16);
    sub_10003D1B0();

    a2 = v15;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Request finished and generated descriptor %s", v10, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
  }
  id result = *(id *)(v4 + OBJC_IVAR___FTMomentsController_clientObject);
  if (result) {
    return objc_msgSend(result, *a2, v7);
  }
  return result;
}

void sub_100015460()
{
  sub_10001D6F0();
  uint64_t v2 = v0;
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10003CEA0();
  sub_10000CD54(v3, (uint64_t)qword_10005B880);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = (void *)sub_10003CE80();
  os_log_type_t v5 = sub_10003D120();
  if (sub_10001D7E4(v5))
  {
    sub_10001D70C();
    uint64_t v6 = (void *)sub_10001D8A8();
    sub_10001D92C(5.7779e-34);
    _swift_stdlib_bridgeErrorToNSError();
    sub_10001D780();
    void *v6 = v1;
    swift_errorRelease();
    swift_errorRelease();
    sub_10001D740((void *)&_mh_execute_header, v7, v8, "Request error %@");
    sub_10000CCE8(&qword_100059AC8);
    sub_10001D914();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  os_log_type_t v9 = *(void **)(v2 + OBJC_IVAR___FTMomentsController_clientObject);
  if (v9)
  {
    swift_unknownObjectRetain();
    id v10 = (void *)sub_10003CC80();
    [v9 didReceiveMediaRecordingError:v10];

    swift_unknownObjectRelease();
  }
  sub_10001D724();
}

id sub_1000155D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MomentsController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MomentsController()
{
  return self;
}

void sub_1000156C8()
{
  sub_100014728();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = sub_10000CCE8((uint64_t *)&unk_100059E30);
  uint64_t v9 = sub_10000DA68(v8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = &v24[-v13];
  __chkstk_darwin(v12);
  uint64_t v16 = &v24[-v15];
  if (*(void *)(v5 + OBJC_IVAR___FTMomentsController_mediaRecordingController))
  {
    swift_retain();
    v1(v7);
    swift_release();
    uint64_t v17 = sub_10003CDA0();
    uint64_t v18 = (uint64_t)v16;
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v17 = sub_10003CDA0();
    uint64_t v18 = (uint64_t)v16;
    uint64_t v19 = 1;
  }
  sub_10000FA0C(v18, v19, 1, v17);
  sub_10001BFF0((uint64_t)v16, (uint64_t)v14);
  sub_10003CDA0();
  Class isa = 0;
  if (sub_10000CD2C((uint64_t)v14, 1, v17) != 1)
  {
    Class isa = sub_10003CD60().super.isa;
    sub_10001D8E0();
    (*(void (**)(unsigned char *, uint64_t))(v21 + 8))(v14, v17);
  }
  uint64_t v22 = sub_10001D900();
  v23(v22);

  sub_10001BF90((uint64_t)v16);
  _Block_release(v3);
  sub_1000146B8();
}

void sub_100015B04(void *a1, int a2, void *a3, void *aBlock)
{
  uint64_t v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = a1;
  sub_1000156C8();
  _Block_release(v6);
}

void sub_100015BA0(uint8_t *a1, uint64_t a2, void (**a3)(void, void))
{
  if (*(void *)(a2 + OBJC_IVAR___FTMomentsController_mediaRecordingController))
  {
    swift_retain();
    sub_100031C84(a1);
    swift_release();
  }
  a3[2](a3, 0);

  _Block_release(a3);
}

void sub_100015C84(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_10003CC80();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_100015CE8()
{
  return _swift_task_switch(sub_100015D04, 0, 0);
}

uint64_t sub_100015D04()
{
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10003CEA0();
  sub_10000CD54(v0, (uint64_t)qword_10005B880);
  uint64_t v1 = sub_10003CE80();
  os_log_type_t v2 = sub_10003D120();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Registering XPC client", v3, 2u);
    sub_10000DA3C();
  }

  sub_10001D6E4();
  return v4();
}

uint64_t sub_100015E88(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  void *v5 = v2;
  v5[1] = sub_100015F2C;
  return sub_100015CE8();
}

uint64_t sub_100015F2C()
{
  sub_10001D6B4();
  sub_10001D69C();
  os_log_type_t v2 = *(void (***)(void))(v1 + 24);
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *v0;
  sub_10001D6D4();
  void *v5 = v4;
  swift_task_dealloc();

  v2[2](v2);
  _Block_release(v2);
  sub_10001D6E4();
  return v6();
}

void sub_10001603C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  sub_10001D6F0();
  a21 = v23;
  a22 = v24;
  uint64_t v26 = v25;
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_10003CEA0();
  sub_10000CD54(v27, (uint64_t)qword_10005B880);
  swift_unknownObjectRetain_n();
  uint64_t v28 = sub_10003CE80();
  os_log_type_t v29 = sub_10003D120();
  if (sub_10001D7E4(v29))
  {
    os_log_type_t v30 = (uint8_t *)sub_10001D70C();
    a10 = sub_10001D7CC();
    *(_DWORD *)os_log_type_t v30 = 136315138;
    swift_unknownObjectRetain();
    sub_10000CCE8(&qword_100059E88);
    uint64_t v31 = sub_10003CFF0();
    sub_10000CE00(v31, v32, &a10);
    sub_10001D86C();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v28, v22, v26, v30, 0xCu);
    sub_10001D914();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  sub_10001D724();
}

#error "1000161EC: call analysis failed (funcsize=28)"

void sub_100016220()
{
  sub_100014728();
  uint64_t v4 = v3;
  uint64_t v26 = v5;
  char v25 = v6;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v24 = v11;
  uint64_t v13 = v12;
  uint64_t v14 = sub_10003CEB0();
  sub_10000D9D8();
  uint64_t v28 = v15;
  __chkstk_darwin(v16);
  uint64_t v27 = sub_100014678();
  sub_10000D9D8();
  uint64_t v18 = v17;
  __chkstk_darwin(v19);
  sub_1000146A0();
  id v20 = [*(id *)&v0[OBJC_IVAR___FTMomentsController_livePhotoController] queue];
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v0;
  *(void *)(v21 + 24) = v13;
  *(void *)(v21 + 32) = v24;
  *(void *)(v21 + 40) = v10;
  *(void *)(v21 + 48) = v8;
  *(unsigned char *)(v21 + 56) = v25;
  *(void *)(v21 + 64) = v26;
  *(void *)(v21 + 72) = v4;
  v29[4] = sub_10001C7F8;
  v29[5] = v21;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 1107296256;
  v29[2] = sub_1000147FC;
  v29[3] = &unk_1000521C0;
  os_log_type_t v22 = _Block_copy(v29);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v23 = v0;
  swift_bridgeObjectRetain();
  sub_10003CEC0();
  sub_10001CF40((unint64_t *)&qword_100059D50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000CCE8(&qword_100059D58);
  sub_10001CF88((unint64_t *)&qword_100059D60, &qword_100059D58);
  sub_10001D800();
  sub_10003D1F0();
  sub_10001D8EC();
  sub_10003D160();
  _Block_release(v22);

  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v1, v14);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v2, v27);
  swift_release();
  sub_1000146B8();
}

void sub_100016490(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, Class isa, char a6, uint64_t a7, uint64_t a8)
{
  NSString v12 = a4;
  uint64_t v14 = *(void **)(a1 + OBJC_IVAR___FTMomentsController_livePhotoController);
  if (!a4)
  {
    id v18 = v14;
    if (!isa) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v15 = v14;
  NSString v12 = sub_10003CFB0();
  if (isa) {
LABEL_3:
  }
    Class isa = sub_10003CF60().super.isa;
LABEL_4:
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a7;
  v16[4] = a8;
  v19[4] = sub_10001C810;
  v19[5] = v16;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 1107296256;
  v19[2] = sub_100016B8C;
  v19[3] = &unk_100052210;
  uint64_t v17 = _Block_copy(v19);
  swift_retain();
  swift_release();
  [v14 registerStreamToken:a2 requesterID:v12 remoteIDSDestinations:isa remoteMomentsAvailable:a6 & 1 reply:v17];
  _Block_release(v17);
}

void sub_100016608(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void *, uint64_t))
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_100059750 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_10003CEA0();
    sub_10000CD54(v7, (uint64_t)qword_10005B880);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v8 = sub_10003CE80();
    os_log_type_t v9 = sub_10003D100();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315394;
      uint64_t v12 = sub_10003CFF0();
      sub_10000CE00(v12, v13, &v31);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2112;
      swift_errorRetain();
      uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
      sub_10003D1B0();
      *uint64_t v11 = v30;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Error registering streamToken %s %@", (uint8_t *)v10, 0x16u);
      sub_10000CCE8(&qword_100059AC8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_errorRetain();
    a4(a1, a2);
    swift_errorRelease();
    swift_errorRelease();
  }
  else if (a1)
  {
    uint64_t v14 = qword_100059750;
    id v15 = a1;
    if (v14 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_10003CEA0();
    sub_10000CD54(v16, (uint64_t)qword_10005B880);
    id v17 = v15;
    id v18 = sub_10003CE80();
    os_log_type_t v19 = sub_10003D120();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v21 = (void *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315394;
      uint64_t v22 = sub_10003CFF0();
      sub_10000CE00(v22, v23, &v31);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2112;
      id v24 = v17;
      sub_10003D1B0();
      *uint64_t v21 = a1;

      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Registered streamToken %s %@", (uint8_t *)v20, 0x16u);
      sub_10000CCE8(&qword_100059AC8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v29 = v17;
    a4(a1, 0);
  }
  else
  {
    if (qword_100059750 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_10003CEA0();
    sub_10000CD54(v25, (uint64_t)qword_10005B880);
    uint64_t v26 = sub_10003CE80();
    os_log_type_t v27 = sub_10003D110();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Unknown error registering streamToken", v28, 2u);
      swift_slowDealloc();
    }

    a4(0, 0);
  }
}

void sub_100016B8C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_100016D30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_10003CC80();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_100016DA0()
{
  sub_100014728();
  uint64_t v3 = v0;
  uint64_t v27 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = sub_10003CEB0();
  sub_10000D9D8();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_100014678();
  sub_10000D9D8();
  uint64_t v28 = v14;
  uint64_t v29 = v13;
  __chkstk_darwin(v13);
  sub_1000146A0();
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10003CEA0();
  sub_10000CD54(v15, (uint64_t)qword_10005B880);
  uint64_t v16 = sub_10003CE80();
  os_log_type_t v17 = sub_10003D120();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v26 = v11;
    id v18 = (uint8_t *)sub_10001D70C();
    uint64_t v19 = sub_10001D7CC();
    *(_DWORD *)id v18 = 136315138;
    v30[0] = v19;
    uint64_t v20 = sub_10003CFF0();
    sub_10000CE00(v20, v21, v30);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Unregistering streamToken %s", v18, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    uint64_t v11 = v26;
    sub_10000DA3C();
  }

  id v22 = [*(id *)&v3[OBJC_IVAR___FTMomentsController_livePhotoController] queue];
  unint64_t v23 = (void *)swift_allocObject();
  v23[2] = v3;
  v23[3] = v8;
  v23[4] = v6;
  v23[5] = v27;
  v30[4] = (uint64_t)sub_10001C750;
  v30[5] = (uint64_t)v23;
  v30[0] = (uint64_t)_NSConcreteStackBlock;
  v30[1] = 1107296256;
  v30[2] = (uint64_t)sub_1000147FC;
  v30[3] = (uint64_t)&unk_1000520F8;
  id v24 = _Block_copy(v30);
  uint64_t v25 = v3;
  swift_retain();
  sub_10003CEC0();
  sub_10001CF40((unint64_t *)&qword_100059D50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000CCE8(&qword_100059D58);
  sub_10001CF88((unint64_t *)&qword_100059D60, &qword_100059D58);
  sub_10003D1F0();
  sub_10001D8EC();
  sub_10003D160();
  _Block_release(v24);

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v9);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v2, v29);
  swift_release();
  sub_1000146B8();
}

void sub_100017150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(a1 + OBJC_IVAR___FTMomentsController_livePhotoController);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  void v8[4] = a4;
  v11[4] = sub_10001C794;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100017630;
  v11[3] = &unk_100052148;
  uint64_t v9 = _Block_copy(v11);
  id v10 = v7;
  swift_retain();
  swift_release();
  [v10 unregisterStreamToken:a2 reply:v9];
  _Block_release(v9);
}

uint64_t sub_10001725C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  if (!a1)
  {
    if (qword_100059750 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_10003CEA0();
    sub_10000CD54(v12, (uint64_t)qword_10005B880);
    uint64_t v6 = sub_10003CE80();
    os_log_type_t v13 = sub_10003D120();
    if (os_log_type_enabled(v6, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      uint64_t v15 = sub_10003CFF0();
      sub_10000CE00(v15, v16, &v19);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v6, v13, "Unregistered streamToken %s", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    goto LABEL_11;
  }
  swift_errorRetain();
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10003CEA0();
  sub_10000CD54(v5, (uint64_t)qword_10005B880);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v6 = sub_10003CE80();
  os_log_type_t v7 = sub_10003D100();
  if (!os_log_type_enabled(v6, v7))
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
LABEL_11:

    return a3(a1);
  }
  uint64_t v8 = swift_slowAlloc();
  uint64_t v9 = (void *)swift_slowAlloc();
  uint64_t v19 = swift_slowAlloc();
  *(_DWORD *)uint64_t v8 = 136315394;
  uint64_t v10 = sub_10003CFF0();
  sub_10000CE00(v10, v11, &v19);
  sub_10003D1B0();
  swift_bridgeObjectRelease();
  *(_WORD *)(v8 + 12) = 2112;
  swift_errorRetain();
  uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
  sub_10003D1B0();
  void *v9 = v18;
  swift_errorRelease();
  swift_errorRelease();
  _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error unregistering streamToken %s %@", (uint8_t *)v8, 0x16u);
  sub_10000CCE8(&qword_100059AC8);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  swift_errorRelease();
  return a3(a1);
}

void sub_100017630(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_100017730()
{
  sub_100014728();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v57 = v5;
  uint64_t v58 = v4;
  uint64_t v56 = v6;
  uint64_t v8 = v7;
  uint64_t v63 = v9;
  uint64_t v65 = v10;
  int v64 = v11;
  uint64_t v12 = sub_10003CEB0();
  sub_10000D9D8();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_10001D6C0();
  uint64_t v61 = v16;
  uint64_t v62 = sub_10003CED0();
  sub_10000D9D8();
  uint64_t v60 = v17;
  __chkstk_darwin(v18);
  sub_10001D6C0();
  uint64_t v59 = v19;
  uint64_t v20 = sub_10003CEA0();
  sub_10000D9D8();
  uint64_t v22 = v21;
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v50 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_10000CD54(v20, (uint64_t)qword_10005B880);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v25, v26, v20);
  swift_bridgeObjectRetain_n();
  uint64_t v27 = sub_10003CE80();
  os_log_type_t v28 = sub_10003D120();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v52 = v3;
    id v53 = v1;
    uint64_t v54 = v14;
    uint64_t v55 = v12;
    uint64_t v29 = sub_10001D7CC();
    uint64_t v51 = (void *)swift_slowAlloc();
    v66 = v51;
    *(_DWORD *)uint64_t v29 = 136315650;
    LODWORD(v67) = v64;
    type metadata accessor for TUMomentsMediaType(0);
    uint64_t v30 = sub_10003CFF0();
    uint64_t v67 = sub_10000CE00(v30, v31, (uint64_t *)&v66);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 2080;
    uint64_t v67 = v65;
    uint64_t v32 = sub_10003CFF0();
    uint64_t v67 = sub_10000CE00(v32, v33, (uint64_t *)&v66);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 22) = 2080;
    if (v8)
    {
      uint64_t v67 = v63;
      uint64_t v68 = v8;
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_10003CFF0();
      unint64_t v36 = v35;
    }
    else
    {
      unint64_t v36 = 0xE300000000000000;
      uint64_t v34 = 7104878;
    }
    uint64_t v67 = sub_10000CE00(v34, v36, (uint64_t *)&v66);
    sub_10003D1B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Start request mediaType %s streamToken %s requesteeID %s", (uint8_t *)v29, 0x20u);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();

    uint64_t v39 = sub_10001D890();
    v40(v39);
    uint64_t v14 = v54;
    uint64_t v12 = v55;
    uint64_t v3 = v52;
    uint64_t v1 = v53;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v37 = sub_10001D890();
    v38(v37);
  }
  id v41 = [*(id *)&v1[OBJC_IVAR___FTMomentsController_livePhotoController] queue];
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = v1;
  *(_DWORD *)(v42 + 24) = v64;
  uint64_t v43 = v63;
  *(void *)(v42 + 32) = v65;
  *(void *)(v42 + 40) = v43;
  uint64_t v44 = v56;
  *(void *)(v42 + 48) = v8;
  *(void *)(v42 + 56) = v44;
  uint64_t v45 = v57;
  *(void *)(v42 + 64) = v58;
  *(void *)(v42 + 72) = v45;
  *(void *)(v42 + 80) = v3;
  v71 = sub_10001C660;
  uint64_t v72 = v42;
  uint64_t v67 = (uint64_t)_NSConcreteStackBlock;
  uint64_t v68 = 1107296256;
  v69 = sub_1000147FC;
  v70 = &unk_100052030;
  uint64_t v46 = _Block_copy(&v67);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  unint64_t v47 = v1;
  uint64_t v48 = v59;
  sub_10003CEC0();
  v66 = _swiftEmptyArrayStorage;
  sub_10001CF40((unint64_t *)&qword_100059D50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000CCE8(&qword_100059D58);
  sub_10001CF88((unint64_t *)&qword_100059D60, &qword_100059D58);
  uint64_t v49 = v61;
  sub_10003D1F0();
  sub_10003D160();
  _Block_release(v46);

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v49, v12);
  (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v48, v62);
  swift_release();
  sub_1000146B8();
}

void sub_100017CA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, NSString a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15 = *(void **)(a1 + OBJC_IVAR___FTMomentsController_livePhotoController);
  if (a5)
  {
    id v16 = v15;
    NSString v17 = sub_10003CFB0();
  }
  else
  {
    id v18 = v15;
    NSString v17 = 0;
  }
  if (a7) {
    a7 = sub_10003CFB0();
  }
  uint64_t v19 = swift_allocObject();
  *(_DWORD *)(v19 + 16) = a2;
  *(void *)(v19 + 24) = a3;
  *(void *)(v19 + 32) = a4;
  *(void *)(v19 + 40) = a5;
  *(void *)(v19 + 48) = a8;
  *(void *)(v19 + 56) = a9;
  v21[4] = sub_10001C6DC;
  v21[5] = v19;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 1107296256;
  v21[2] = sub_10001869C;
  uint64_t v21[3] = &unk_100052080;
  uint64_t v20 = _Block_copy(v21);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [v15 startRequestWithMediaType:a2 forStreamToken:a3 requesteeID:v17 destinationID:a7 reply:v20];
  _Block_release(v20);
}

uint64_t sub_100017E2C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(void, void, void), uint64_t a9)
{
  uint64_t v60 = a6;
  uint64_t v61 = a5;
  uint64_t v15 = sub_10003CEA0();
  uint64_t v62 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  id v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v54 - v19;
  if (a3)
  {
    swift_errorRetain();
    if (qword_100059750 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_10000CD54(v15, (uint64_t)qword_10005B880);
    uint64_t v22 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v20, v21, v15);
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_10003CE80();
    uint64_t v24 = v15;
    os_log_type_t v25 = sub_10003D100();
    if (os_log_type_enabled(v23, v25))
    {
      uint64_t v57 = v24;
      uint64_t v58 = a9;
      uint64_t v59 = a8;
      uint64_t v26 = swift_slowAlloc();
      uint64_t v55 = (void *)swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      uint64_t v65 = (void *)v56;
      *(_DWORD *)uint64_t v26 = 136315906;
      LODWORD(v63) = a4;
      type metadata accessor for TUMomentsMediaType(0);
      uint64_t v27 = sub_10003CFF0();
      uint64_t v63 = sub_10000CE00(v27, v28, (uint64_t *)&v65);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2080;
      uint64_t v63 = v61;
      uint64_t v29 = sub_10003CFF0();
      uint64_t v63 = sub_10000CE00(v29, v30, (uint64_t *)&v65);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 22) = 2080;
      if (a7)
      {
        uint64_t v63 = v60;
        uint64_t v64 = a7;
        swift_bridgeObjectRetain();
        uint64_t v31 = sub_10003CFF0();
        unint64_t v33 = v32;
      }
      else
      {
        uint64_t v31 = 7104878;
        unint64_t v33 = 0xE300000000000000;
      }
      a8 = v59;
      uint64_t v63 = sub_10000CE00(v31, v33, (uint64_t *)&v65);
      sub_10003D1B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 32) = 2112;
      swift_errorRetain();
      uint64_t v50 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v63 = v50;
      sub_10003D1B0();
      *uint64_t v55 = v50;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v25, "Error starting request mediaType %s streamToken %s requesteeID %s error %@", (uint8_t *)v26, 0x2Au);
      sub_10000CCE8(&qword_100059AC8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v62 + 8))(v20, v57);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v24);
    }
    swift_errorRetain();
    a8(0, 0, a3);
    swift_errorRelease();
    return swift_errorRelease();
  }
  else
  {
    if (a2)
    {
      if (qword_100059750 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_10000CD54(v15, (uint64_t)qword_10005B880);
      uint64_t v35 = v62;
      (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v18, v34, v15);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      unint64_t v36 = sub_10003CE80();
      LODWORD(v56) = sub_10003D120();
      if (os_log_type_enabled(v36, (os_log_type_t)v56))
      {
        uint64_t v57 = v15;
        uint64_t v58 = a9;
        uint64_t v59 = a8;
        uint64_t v37 = swift_slowAlloc();
        uint64_t v55 = (void *)swift_slowAlloc();
        uint64_t v65 = v55;
        *(_DWORD *)uint64_t v37 = 136315906;
        LODWORD(v63) = a4;
        type metadata accessor for TUMomentsMediaType(0);
        uint64_t v38 = sub_10003CFF0();
        uint64_t v63 = sub_10000CE00(v38, v39, (uint64_t *)&v65);
        sub_10003D1B0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2080;
        uint64_t v63 = v61;
        uint64_t v40 = sub_10003CFF0();
        uint64_t v63 = sub_10000CE00(v40, v41, (uint64_t *)&v65);
        sub_10003D1B0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 22) = 2080;
        if (a7)
        {
          uint64_t v63 = v60;
          uint64_t v64 = a7;
          swift_bridgeObjectRetain();
          uint64_t v42 = sub_10003CFF0();
          unint64_t v44 = v43;
        }
        else
        {
          uint64_t v42 = 7104878;
          unint64_t v44 = 0xE300000000000000;
        }
        uint64_t v63 = sub_10000CE00(v42, v44, (uint64_t *)&v65);
        sub_10003D1B0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 32) = 2080;
        uint64_t v63 = a1;
        uint64_t v64 = a2;
        swift_bridgeObjectRetain();
        uint64_t v52 = sub_10003CFF0();
        uint64_t v63 = sub_10000CE00(v52, v53, (uint64_t *)&v65);
        sub_10003D1B0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v56, "Started request mediaType %s streamToken %s requesteeID %s transactionID %s", (uint8_t *)v37, 0x2Au);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v62 + 8))(v18, v57);
        a8 = v59;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v35 + 8))(v18, v15);
      }
      uint64_t v48 = a1;
      uint64_t v49 = a2;
    }
    else
    {
      if (qword_100059750 != -1) {
        swift_once();
      }
      sub_10000CD54(v15, (uint64_t)qword_10005B880);
      uint64_t v45 = sub_10003CE80();
      os_log_type_t v46 = sub_10003D110();
      if (os_log_type_enabled(v45, v46))
      {
        unint64_t v47 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v47 = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "Unknown error starting request", v47, 2u);
        swift_slowDealloc();
      }

      uint64_t v48 = 0;
      uint64_t v49 = 0;
    }
    return ((uint64_t (*)(uint64_t, uint64_t, void))a8)(v48, v49, 0);
  }
}

uint64_t sub_10001869C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v5 = sub_10003CFC0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a3;
  v4(v5, v7, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_10001884C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    NSString v6 = sub_10003CFB0();
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_10003CC80();
      goto LABEL_6;
    }
  }
  else
  {
    NSString v6 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, NSString))(a4 + 16))(a4, v6);
}

void sub_1000188DC()
{
  sub_100014728();
  uint64_t v4 = v3;
  uint64_t v21 = v5;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_10003CEB0();
  sub_10000D9D8();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  uint64_t v22 = sub_100014678();
  sub_10000D9D8();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_1000146A0();
  id v17 = [*(id *)&v0[OBJC_IVAR___FTMomentsController_livePhotoController] queue];
  id v18 = (void *)swift_allocObject();
  v18[2] = v0;
  v18[3] = v9;
  v18[4] = v7;
  v18[5] = v21;
  void v18[6] = v4;
  v23[4] = sub_10001C594;
  v23[5] = v18;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 1107296256;
  v23[2] = sub_1000147FC;
  v23[3] = &unk_100051F68;
  uint64_t v19 = _Block_copy(v23);
  uint64_t v20 = v0;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10003CEC0();
  sub_10001CF40((unint64_t *)&qword_100059D50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000CCE8(&qword_100059D58);
  sub_10001CF88((unint64_t *)&qword_100059D60, &qword_100059D58);
  sub_10001D800();
  sub_10003D1F0();
  sub_10003D160();
  _Block_release(v19);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v10);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v2, v22);
  swift_release();
  sub_1000146B8();
}

void sub_100018B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = *(id *)(a1 + OBJC_IVAR___FTMomentsController_livePhotoController);
  NSString v10 = sub_10003CFB0();
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = a4;
  v11[5] = a5;
  v13[4] = sub_10001C5FC;
  v13[5] = v11;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100017630;
  v13[3] = &unk_100051FB8;
  uint64_t v12 = _Block_copy(v13);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [v9 endRequestWithTransactionID:v10 reply:v12];
  _Block_release(v12);
}

uint64_t sub_100018C5C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(uint64_t))
{
  if (!a1)
  {
    if (qword_100059750 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_10003CEA0();
    sub_10000CD54(v13, (uint64_t)qword_10005B880);
    swift_bridgeObjectRetain_n();
    id v9 = sub_10003CE80();
    os_log_type_t v14 = sub_10003D120();
    if (!os_log_type_enabled(v9, v14))
    {

      swift_bridgeObjectRelease_n();
      return a4(a1);
    }
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315138;
    swift_bridgeObjectRetain();
    sub_10000CE00(a2, a3, &v18);
    sub_10003D1B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v9, v14, "Ended request transactionID %s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    goto LABEL_11;
  }
  swift_errorRetain();
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_10003CEA0();
  sub_10000CD54(v8, (uint64_t)qword_10005B880);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  id v9 = sub_10003CE80();
  os_log_type_t v10 = sub_10003D100();
  if (!os_log_type_enabled(v9, v10))
  {
    swift_errorRelease();
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
LABEL_11:

    return a4(a1);
  }
  uint64_t v11 = swift_slowAlloc();
  uint64_t v12 = (void *)swift_slowAlloc();
  uint64_t v18 = swift_slowAlloc();
  *(_DWORD *)uint64_t v11 = 136315394;
  swift_bridgeObjectRetain();
  sub_10000CE00(a2, a3, &v18);
  sub_10003D1B0();
  swift_bridgeObjectRelease_n();
  *(_WORD *)(v11 + 12) = 2112;
  swift_errorRetain();
  uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
  sub_10003D1B0();
  void *v12 = v17;
  swift_errorRelease();
  swift_errorRelease();
  _os_log_impl((void *)&_mh_execute_header, v9, v10, "Error ending request transactionID %s error %@", (uint8_t *)v11, 0x16u);
  sub_10000CCE8(&qword_100059AC8);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  swift_errorRelease();
  return a4(a1);
}

uint64_t sub_100019120(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10000CCE8(&qword_100059E40);
  uint64_t v6 = sub_10000DA68(v5);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10003D090();
  sub_10000FA0C((uint64_t)v8, 1, 1, v9);
  os_log_type_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v2;
  v10[5] = a1;
  v10[6] = a2;
  id v11 = v2;
  swift_retain();
  sub_1000282EC((uint64_t)v8, (uint64_t)&unk_100059E78, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_10001920C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  return _swift_task_switch(sub_100019230, 0, 0);
}

uint64_t sub_100019230()
{
  sub_10001D6B4();
  sub_10001D760();
  sub_10001D8C0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  void *v1 = v0;
  v1[1] = sub_1000192D0;
  return sub_10001F398();
}

uint64_t sub_1000192D0()
{
  sub_10001D6B4();
  sub_10001D69C();
  sub_10001D81C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_10001D6D4();
  void *v5 = v4;
  *(void *)(v6 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v7 = sub_10001940C;
  }
  else {
    uint64_t v7 = sub_1000193AC;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_1000193AC()
{
  sub_10001D6B4();
  (*(void (**)(void))(v0 + 48))(0);
  sub_10001D6E4();
  return v1();
}

uint64_t sub_10001940C()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void (**)(uint64_t))(v0 + 48);
  swift_errorRetain();
  v2(v1);
  swift_errorRelease();
  swift_errorRelease();
  sub_10001D6E4();
  return v3();
}

void sub_100019520(int a1, uint64_t a2, void (**a3)(void, void, void))
{
  uint64_t v6 = sub_10000CCE8((uint64_t *)&unk_100059E30);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v51 = (char *)&v45 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v47 = (char *)&v45 - v13;
  __chkstk_darwin(v12);
  uint64_t v48 = (char *)&v45 - v14;
  uint64_t v15 = sub_10003CDA0();
  uint64_t v16 = *(void (**)(void, void, void))(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v49 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v54 = (uint64_t)&v45 - v19;
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_10003CEA0();
  sub_10000CD54(v20, (uint64_t)qword_10005B880);
  uint64_t v21 = sub_10003CE80();
  os_log_type_t v22 = sub_10003D120();
  BOOL v23 = os_log_type_enabled(v21, v22);
  unint64_t v53 = a3;
  uint64_t v50 = v9;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v52 = v16;
    uint64_t v46 = v15;
    os_log_type_t v25 = (uint8_t *)v24;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v45 = a2;
    v57[0] = v26;
    *(_DWORD *)os_log_type_t v25 = 136315138;
    LODWORD(v56[0]) = a1;
    type metadata accessor for TUMessageMediaType(0);
    uint64_t v27 = sub_10003CFF0();
    v56[0] = sub_10000CE00(v27, v28, v57);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Start recording message mediaType %s", v25, 0xCu);
    swift_arrayDestroy();
    a2 = v45;
    swift_slowDealloc();
    uint64_t v15 = v46;
    uint64_t v16 = v52;
    swift_slowDealloc();
  }

  uint64_t v29 = (void *)(a2 + OBJC_IVAR___FTMomentsController_messageController);
  swift_beginAccess();
  sub_10000E400(v29, v29[3]);
  uint64_t v30 = v54;
  sub_10001F660(a1, v54);
  uint64_t v31 = v49;
  uint64_t v52 = (void (*)(void, void, void))*((void *)v16 + 2);
  v52(v49, v30, v15);
  unint64_t v32 = sub_10003CE80();
  os_log_type_t v33 = sub_10003D120();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v51 = (char *)swift_slowAlloc();
    v56[0] = (uint64_t)v51;
    *(_DWORD *)uint64_t v34 = 136315394;
    LODWORD(v55) = a1;
    type metadata accessor for TUMessageMediaType(0);
    uint64_t v35 = sub_10003CFF0();
    uint64_t v55 = sub_10000CE00(v35, v36, v56);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2080;
    sub_10001CF40(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v37 = v49;
    uint64_t v38 = sub_10003D320();
    uint64_t v55 = sub_10000CE00(v38, v39, v56);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    uint64_t v40 = (void (*)(char *, uint64_t))*((void *)v16 + 1);
    v40(v37, v15);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Started recording message mediaType %s uuid %s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v30 = v54;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v40 = (void (*)(char *, uint64_t))*((void *)v16 + 1);
    v40(v31, v15);
  }

  unint64_t v41 = v53;
  uint64_t v42 = (uint64_t)v47;
  uint64_t v43 = (uint64_t)v48;
  v52(v48, v30, v15);
  sub_10000FA0C(v43, 0, 1, v15);
  sub_10001BFF0(v43, v42);
  if (sub_10000CD2C(v42, 1, v15) == 1)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_10003CD60().super.isa;
    v40((char *)v42, v15);
  }
  ((void (**)(void, Class, void))v41)[2](v41, isa, 0);

  sub_10001BF90(v43);
  v40((char *)v30, v15);
  _Block_release(v41);
}

void sub_100019E24(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v40 = a3;
  uint64_t v5 = sub_10003CDA0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v34 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v34 - v13;
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10003CEA0();
  uint64_t v16 = sub_10000CD54(v15, (uint64_t)qword_10005B880);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v43 = a1;
  unint64_t v41 = v17;
  v17(v14, a1, v5);
  uint64_t v42 = v16;
  uint64_t v18 = sub_10003CE80();
  os_log_type_t v19 = sub_10003D120();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v37 = v9;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    unint64_t v36 = v12;
    v46[0] = v22;
    uint64_t v35 = a2;
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v38 = v6;
    sub_10001CF40(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v23 = sub_10003D320();
    uint64_t v45 = sub_10000CE00(v23, v24, v46);
    uint64_t v25 = v38;
    a2 = v35;
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    unint64_t v39 = *(void (**)(char *, uint64_t))(v25 + 8);
    v39(v14, v5);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "End recording message uuid %s", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v12 = v36;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    unint64_t v39 = *(void (**)(char *, uint64_t))(v6 + 8);
    v39(v14, v5);
  }

  uint64_t v26 = (void *)(a2 + OBJC_IVAR___FTMomentsController_messageController);
  swift_beginAccess();
  sub_10000E400(v26, v26[3]);
  uint64_t v27 = v43;
  sub_10001FCA8(v43);
  v41(v12, v27, v5);
  unint64_t v28 = sub_10003CE80();
  os_log_type_t v29 = sub_10003D120();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315138;
    sub_10001CF40(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v31 = sub_10003D320();
    uint64_t v44 = sub_10000CE00(v31, v32, &v45);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    v39(v12, v5);
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Ended recording message uuid %s", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v39(v12, v5);
  }

  os_log_type_t v33 = v40;
  v40[2](v40, 0);
  _Block_release(v33);
}

void sub_10001A5C4(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v6 = sub_10003CDA0();
  __chkstk_darwin(v6);
  uint64_t v7 = (void *)(a2 + OBJC_IVAR___FTMomentsController_messageController);
  swift_beginAccess();
  sub_10000E400(v7, v7[3]);
  swift_beginAccess();
  sub_1000393D8(a1);
  swift_endAccess();
  a3[2](a3, 0);
  _Block_release(a3);
}

uint64_t sub_10001A9EC(void *a1, uint64_t a2, uint64_t a3, const void *a4, void (*a5)(uint64_t, id, void *))
{
  uint64_t v9 = sub_10003CDA0();
  sub_10000D9D8();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_10001D83C();
  uint64_t v13 = _Block_copy(a4);
  sub_10003CD80();
  _Block_copy(v13);
  id v14 = a1;
  a5(v5, v14, v13);
  _Block_release(v13);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v5, v9);
}

uint64_t sub_10001AAD4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = sub_10000CCE8(&qword_100059E40);
  uint64_t v9 = sub_10000DA68(v8);
  __chkstk_darwin(v9);
  sub_1000146A0();
  uint64_t v10 = sub_10003D090();
  sub_10000FA0C(v4, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v3;
  v11[5] = a1;
  void v11[6] = a2;
  v11[7] = a3;
  id v12 = v3;
  id v13 = a1;
  swift_retain();
  sub_1000282EC(v4, (uint64_t)&unk_100059E68, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_10001ABB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  return _swift_task_switch(sub_10001ABDC, 0, 0);
}

uint64_t sub_10001ABDC()
{
  sub_10001D6B4();
  sub_10001D760();
  sub_10001D8C0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  void *v1 = v0;
  v1[1] = sub_10001AC84;
  return sub_100020550();
}

uint64_t sub_10001AC84()
{
  sub_10001D6B4();
  sub_10001D69C();
  sub_10001D81C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_10001D6D4();
  void *v5 = v4;
  *(void *)(v6 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v7 = sub_10001ADC0;
  }
  else {
    uint64_t v7 = sub_10001AD60;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_10001AD60()
{
  sub_10001D6B4();
  (*(void (**)(void))(v0 + 72))(0);
  sub_10001D6E4();
  return v1();
}

uint64_t sub_10001ADC0()
{
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[8];
  uint64_t v2 = sub_10003CEA0();
  sub_10000CD54(v2, (uint64_t)qword_10005B880);
  id v3 = v1;
  swift_errorRetain();
  id v4 = v3;
  swift_errorRetain();
  uint64_t v5 = sub_10003CE80();
  os_log_type_t v6 = sub_10003D100();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[8];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412546;
    v0[5] = v8;
    id v11 = v8;
    sub_10003D1B0();
    *uint64_t v10 = v8;

    *(_WORD *)(v9 + 12) = 2112;
    swift_errorRetain();
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[6] = v12;
    sub_10003D1B0();
    v10[1] = v12;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Error sending video message request %@ error %@", (uint8_t *)v9, 0x16u);
    sub_10000CCE8(&qword_100059AC8);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v13 = v0[12];
  id v14 = (void (*)(uint64_t))v0[9];

  swift_errorRetain();
  v14(v13);
  swift_errorRelease();
  swift_errorRelease();
  sub_10001D6E4();
  return v15();
}

void sub_10001B0C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_100014728();
  a19 = v22;
  a20 = v23;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v30 = sub_10003CDA0();
  sub_10000D9D8();
  uint64_t v32 = v31;
  uint64_t v34 = *(void *)(v33 + 64);
  __chkstk_darwin(v35);
  uint64_t v36 = sub_10000CCE8(&qword_100059E40);
  uint64_t v37 = sub_10000DA68(v36);
  __chkstk_darwin(v37);
  sub_10001D83C();
  uint64_t v38 = sub_10003D090();
  sub_10000FA0C(v21, 1, 1, v38);
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))((char *)&a9 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v30);
  unint64_t v39 = (*(unsigned __int8 *)(v32 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  uint64_t v40 = (char *)swift_allocObject();
  *((void *)v40 + 2) = 0;
  *((void *)v40 + 3) = 0;
  *((void *)v40 + 4) = v20;
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(&v40[v39], (char *)&a9 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0), v30);
  unint64_t v41 = &v40[(v34 + v39 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(void *)unint64_t v41 = v27;
  *((void *)v41 + 1) = v25;
  id v42 = v20;
  swift_retain();
  sub_1000282EC(v21, (uint64_t)&unk_100059E50, (uint64_t)v40);
  swift_release();
  sub_1000146B8();
}

uint64_t sub_10001B24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  uint64_t v8 = sub_10003CDA0();
  v7[11] = v8;
  v7[12] = *(void *)(v8 - 8);
  v7[13] = swift_task_alloc();
  return _swift_task_switch(sub_10001B310, 0, 0);
}

uint64_t sub_10001B310()
{
  sub_10001D6B4();
  sub_10001D760();
  sub_10001D8C0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  void *v1 = v0;
  v1[1] = sub_10001B3B8;
  return sub_100021EB8();
}

uint64_t sub_10001B3B8()
{
  sub_10001D6B4();
  sub_10001D69C();
  sub_10001D81C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_10001D6D4();
  void *v5 = v4;
  *(void *)(v6 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    BOOL v7 = sub_10001B4FC;
  }
  else {
    BOOL v7 = sub_10001B494;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_10001B494()
{
  sub_10001D6B4();
  (*(void (**)(void))(v0 + 72))(0);
  swift_task_dealloc();
  sub_10001D6E4();
  return v1();
}

uint64_t sub_10001B4FC()
{
  uint64_t v22 = v0;
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[8];
  uint64_t v5 = sub_10003CEA0();
  sub_10000CD54(v5, (uint64_t)qword_10005B880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v6 = sub_10003CE80();
  os_log_type_t v7 = sub_10003D100();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v20 = (void *)sub_10001D8A8();
    uint64_t v21 = sub_10001D7CC();
    *(_DWORD *)uint64_t v8 = 136315394;
    sub_10001CF40(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v9 = sub_10003D320();
    v0[5] = sub_10000CE00(v9, v10, &v21);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_10001D854();
    v12(v11);
    *(_WORD *)(v8 + 12) = 2112;
    swift_errorRetain();
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[6] = v13;
    sub_10003D1B0();
    *uint64_t v20 = v13;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error saving video message uuid %s error %@", (uint8_t *)v8, 0x16u);
    sub_10000CCE8(&qword_100059AC8);
    swift_arrayDestroy();
    sub_10000DA3C();
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    uint64_t v14 = sub_10001D854();
    v15(v14);
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v16 = v0[15];
  uint64_t v17 = (void (*)(uint64_t))v0[9];
  swift_errorRetain();
  v17(v16);
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  sub_10001D6E4();
  return v18();
}

#error "10001B8E8: call analysis failed (funcsize=74)"

void sub_10001B928(void (*a1)(void), uint64_t a2, void (**a3)(void, void))
{
  uint64_t v6 = sub_10000CCE8((uint64_t *)&unk_100059E30);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  v15[5] = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = sub_10003CEA0();
  __chkstk_darwin(v9);
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_10000CD54(v9, (uint64_t)qword_10005B880);
  uint64_t v11 = sub_10003CE80();
  os_log_type_t v12 = sub_10003D120();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    v15[4] = v10;
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "MomentsController resetting message controller", v13, 2u);
    swift_slowDealloc();
  }

  uint64_t v14 = (void *)(a2 + OBJC_IVAR___FTMomentsController_messageController);
  swift_beginAccess();
  sub_10000E400(v14, v14[3]);
  sub_1000227E4(a1);
  a3[2](a3, 0);
  _Block_release(a3);
}

uint64_t sub_10001BF90(uint64_t a1)
{
  uint64_t v2 = sub_10000CCE8((uint64_t *)&unk_100059E30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001BFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CCE8((uint64_t *)&unk_100059E30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001C058()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001C090(uint64_t a1)
{
  sub_100015C84(a1, *(void *)(v1 + 16));
}

uint64_t sub_10001C098()
{
  uint64_t v1 = sub_10003CDA0();
  sub_10000D9D8();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 40) & ~v6;
  uint64_t v8 = v6 | 7;
  unint64_t v9 = ((*(void *)(v5 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  swift_release();

  return _swift_deallocObject(v0, v9, v8);
}

uint64_t sub_10001C164()
{
  uint64_t v1 = *(void *)(sub_10003CDA0() - 8);
  uint64_t v2 = *(void *)(v0
                 + ((*(void *)(v1 + 64)
                   + ((*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
                   + 7) & 0xFFFFFFFFFFFFFFF8)
                 + 8);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)sub_10001D82C(v3);
  void *v4 = v5;
  v4[1] = sub_10001C280;
  uint64_t v6 = sub_10001D7AC();
  return sub_10001B24C(v6, v7, v8, v9, v10, v11, v2);
}

uint64_t sub_10001C280()
{
  sub_10001D6B4();
  sub_10001D69C();
  uint64_t v1 = *v0;
  sub_10001D6D4();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10001D6E4();
  return v3();
}

uint64_t sub_10001C340()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10001C390(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v7 = v1[7];
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = (void *)sub_10001D82C(v9);
  *uint64_t v10 = v11;
  v10[1] = sub_10001D698;
  return sub_10001ABB8(a1, v3, v4, v5, v6, v8, v7);
}

uint64_t sub_10001C45C()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10001C4A4()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10001D82C(v0);
  void *v1 = v2;
  v1[1] = sub_10001D698;
  uint64_t v3 = sub_10001D7AC();
  return sub_10001920C(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10001C54C()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10001C594()
{
  sub_100018B30(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_10001C5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001C5B4()
{
  return swift_release();
}

uint64_t sub_10001C5BC()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001C5FC(uint64_t a1)
{
  return sub_100018C5C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(uint64_t (**)(uint64_t))(v1 + 32));
}

void sub_10001C608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10001884C(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_10001C610()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 88, 7);
}

void sub_10001C660()
{
  sub_100017CA8(*(void *)(v0 + 16), *(unsigned int *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(NSString *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80));
}

uint64_t sub_10001C69C()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10001C6DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100017E2C(a1, a2, a3, *(_DWORD *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(void (**)(void, void, void))(v3 + 48), *(void *)(v3 + 56));
}

uint64_t sub_10001C710()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10001C750()
{
  sub_100017150(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_10001C75C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001C794(uint64_t a1)
{
  return sub_10001725C(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

void sub_10001C7A0(uint64_t a1, uint64_t a2)
{
  sub_100016D30(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10001C7A8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

void sub_10001C7F8()
{
  sub_100016490(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), *(Class *)(v0 + 48), *(unsigned char *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72));
}

void sub_10001C810(void *a1, uint64_t a2)
{
  sub_100016608(a1, a2, *(void *)(v2 + 16), *(void (**)(void *, uint64_t))(v2 + 24));
}

uint64_t sub_10001C81C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001C85C()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_10001D698;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_100059E90 + dword_100059E90);
  return v5(v2, v3);
}

char *sub_10001C908(uint64_t a1, void *a2, uint64_t a3, void *a4, char *a5)
{
  v37[3] = type metadata accessor for MessageController();
  v37[4] = &off_100052428;
  v37[0] = a1;
  *(void *)&a5[OBJC_IVAR___FTMomentsController_clientObject] = 0;
  uint64_t v10 = OBJC_IVAR___FTMomentsController_mediaRecordingController;
  *(void *)&a5[OBJC_IVAR___FTMomentsController_mediaRecordingController] = 0;
  sub_10001D5BC((uint64_t)v37, (uint64_t)&a5[OBJC_IVAR___FTMomentsController_messageController]);
  *(void *)&a5[OBJC_IVAR___FTMomentsController_livePhotoController] = a2;
  *(void *)&a5[v10] = a3;
  uint64_t v11 = a5;
  id v35 = a2;
  swift_retain();
  swift_release();
  *(void *)&v11[OBJC_IVAR___FTMomentsController_queue] = a4;
  id v34 = a4;

  v36.receiver = v11;
  v36.super_class = (Class)type metadata accessor for MomentsController();
  id v12 = objc_msgSendSuper2(&v36, "init");
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = (uint64_t)v12 + OBJC_IVAR___FTMomentsController_messageController;
  swift_beginAccess();
  uint64_t v16 = *(void *)(v14 + 24);
  uint64_t v15 = *(void *)(v14 + 32);
  sub_10001CFD8(v14, v16);
  uint64_t v17 = *(void (**)(id (*)(void *), uint64_t, uint64_t, uint64_t))(v15 + 16);
  id v18 = v12;
  v17(sub_10001D060, v13, v16, v15);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  uint64_t v20 = *(void *)(v14 + 24);
  uint64_t v21 = *(void *)(v14 + 32);
  sub_10001CFD8(v14, v20);
  uint64_t v22 = *(void (**)(void (*)(), uint64_t, uint64_t, uint64_t))(v21 + 40);
  uint64_t v23 = (char *)v18;
  v22(sub_10001D084, v19, v20, v21);
  swift_endAccess();

  swift_release();
  sub_10000D5B8((uint64_t)v37);
  uint64_t v24 = OBJC_IVAR___FTMomentsController_mediaRecordingController;
  uint64_t v25 = *(void *)&v23[OBJC_IVAR___FTMomentsController_mediaRecordingController];
  if (v25)
  {
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v23;
    uint64_t v27 = *(void *)(v25 + 56);
    *(void *)(v25 + 56) = sub_10001D0A8;
    *(void *)(v25 + 64) = v26;
    uint64_t v28 = v23;
    sub_10000CDF0(v27);
    uint64_t v29 = *(void *)&v23[v24];
    if (v29)
    {
      uint64_t v30 = swift_allocObject();
      *(void *)(v30 + 16) = v28;
      uint64_t v31 = *(void *)(v29 + 72);
      *(void *)(v29 + 72) = sub_10001D0CC;
      *(void *)(v29 + 80) = v30;
      uint64_t v32 = v28;
      sub_10000CDF0(v31);
    }
  }
  return v23;
}

char *sub_10001CBD8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = type metadata accessor for MessageController();
  id v18 = &off_100052428;
  v16[0] = a1;
  uint64_t v8 = (char *)objc_allocWithZone((Class)type metadata accessor for MomentsController());
  uint64_t v9 = sub_10001CFD8((uint64_t)v16, v17);
  __chkstk_darwin(v9);
  uint64_t v11 = (void *)((char *)&v16[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  uint64_t v13 = sub_10001C908(*v11, a2, a3, a4, v8);
  sub_10000D5B8((uint64_t)v16);
  return v13;
}

id sub_10001CD00(char a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v31 = a7;
  uint64_t v32 = a8;
  int v9 = a6;
  int v10 = a5;
  int v11 = a4;
  int v12 = a3;
  uint64_t v29 = a9;
  uint64_t v30 = a2;
  unint64_t v13 = HIDWORD(a3);
  unint64_t v14 = HIDWORD(a4);
  unint64_t v15 = HIDWORD(a5);
  id v35 = &type metadata for MessageControllerStateMachine;
  objc_super v36 = &off_100052CA8;
  v34[0] = a1;
  unint64_t v16 = HIDWORD(a6);
  v33[3] = &type metadata for AudioManager;
  v33[4] = &off_100052410;
  uint64_t v17 = (_DWORD *)swift_allocObject();
  v33[0] = v17;
  v17[4] = v12;
  v17[5] = v13;
  v17[6] = v11;
  v17[7] = v14;
  v17[8] = v10;
  v17[9] = v15;
  v17[10] = v9;
  v17[11] = v16;
  id v18 = (char *)objc_allocWithZone((Class)type metadata accessor for MessageController());
  uint64_t v19 = sub_10001CFD8((uint64_t)v34, (uint64_t)&type metadata for MessageControllerStateMachine);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v22 + 16))(v21);
  uint64_t v23 = sub_10001CFD8((uint64_t)v33, (uint64_t)&type metadata for AudioManager);
  __chkstk_darwin(v23);
  uint64_t v25 = (unint64_t *)((char *)&v29 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(unint64_t *))(v26 + 16))(v25);
  id v27 = sub_10001D100(*v21, v30, *v25, v25[1], v25[2], v25[3], v31, v32, v29, v18);
  sub_10000D5B8((uint64_t)v33);
  sub_10000D5B8((uint64_t)v34);
  return v27;
}

uint64_t sub_10001CF40(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001CF88(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000D724(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001CFD8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_10001D028()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10001D060(void *a1)
{
  return sub_1000150F4(a1);
}

void sub_10001D084()
{
}

id sub_10001D0A8(void *a1)
{
  return sub_100015274(a1);
}

void sub_10001D0CC()
{
}

uint64_t sub_10001D0F0()
{
  return _swift_deallocObject(v0, 48, 7);
}

id sub_10001D100(char a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, void *a7, uint64_t a8, uint64_t a9, char *a10)
{
  uint64_t v55 = a8;
  uint64_t v54 = a7;
  int v10 = a6;
  int v11 = a5;
  int v12 = a4;
  int v13 = a3;
  unint64_t v50 = HIDWORD(a3);
  unint64_t v51 = HIDWORD(a4);
  unint64_t v52 = HIDWORD(a5);
  unint64_t v53 = HIDWORD(a6);
  uint64_t v16 = sub_10003CD40();
  __chkstk_darwin(v16 - 8);
  id v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for MessageStore();
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62[3] = sub_10003CE60();
  v62[4] = &protocol witness table for VideoMessagingController;
  v62[0] = a9;
  uint64_t v22 = type metadata accessor for MessageMoments();
  v61[4] = &off_100052AA0;
  v61[3] = v22;
  v61[0] = a2;
  uint64_t v59 = &type metadata for MessageControllerStateMachine;
  uint64_t v60 = &off_100052CA8;
  v58[0] = a1;
  uint64_t v57[3] = &type metadata for AudioManager;
  v57[4] = &off_100052410;
  uint64_t v23 = (_DWORD *)swift_allocObject();
  v57[0] = v23;
  int v24 = v50;
  v23[4] = v13;
  v23[5] = v24;
  int v25 = v51;
  void v23[6] = v12;
  v23[7] = v25;
  int v26 = v52;
  v23[8] = v11;
  v23[9] = v26;
  int v27 = v53;
  v23[10] = v10;
  v23[11] = v27;
  uint64_t v28 = (uint64_t)&a10[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_currentRequest];
  uint64_t v29 = type metadata accessor for MessageRequest();
  sub_10000FA0C(v28, 1, 1, v29);
  uint64_t v30 = OBJC_IVAR____TtC18FTLivePhotoService17MessageController_processAssertionManager;
  *(void *)&a10[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_processAssertionManager] = 0;
  uint64_t v31 = &a10[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_onRequestFinishedProcessing];
  *(void *)uint64_t v31 = 0;
  *((void *)v31 + 1) = 0;
  uint64_t v32 = &a10[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_onRequestError];
  *(void *)uint64_t v32 = 0;
  *((void *)v32 + 1) = 0;
  sub_10001D5BC((uint64_t)v58, (uint64_t)&a10[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_stateMachine]);
  sub_10001D5BC((uint64_t)v61, (uint64_t)&a10[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_moments]);
  sub_10001D5BC((uint64_t)v57, (uint64_t)&a10[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_audioManager]);
  uint64_t v33 = a10;
  sub_10003CCC0();
  sub_100038714((uint64_t)v18, (uint64_t)v21);
  sub_10001D558((uint64_t)v21, (uint64_t)&v33[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_messageStore]);
  id v34 = v54;
  *(void *)&v33[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_mediaManager] = v54;
  *(void *)&a10[v30] = v55;
  id v35 = v34;
  swift_retain();
  swift_release();
  sub_10001D5BC((uint64_t)v62, (uint64_t)&v33[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_videoMessagingController]);

  objc_super v36 = (objc_class *)type metadata accessor for MessageController();
  v56.receiver = v33;
  v56.super_class = v36;
  id v37 = objc_msgSendSuper2(&v56, "init");
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v37;
  uint64_t v39 = (uint64_t)v37 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_moments;
  swift_beginAccess();
  uint64_t v40 = *(void *)(v39 + 24);
  uint64_t v41 = *(void *)(v39 + 32);
  sub_10001CFD8(v39, v40);
  id v42 = *(void (**)(void (*)(void *, uint64_t), uint64_t, uint64_t, uint64_t))(v41 + 16);
  id v43 = v37;
  v42(sub_10001D61C, v38, v40, v41);
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = v43;
  uint64_t v45 = *(void *)(v39 + 24);
  uint64_t v46 = *(void *)(v39 + 32);
  sub_10001CFD8(v39, v45);
  unint64_t v47 = *(void (**)(uint64_t (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v46 + 40);
  id v48 = v43;
  v47(sub_10001D624, v44, v45, v46);
  swift_endAccess();

  swift_release();
  sub_10000D5B8((uint64_t)v62);
  sub_10000D5B8((uint64_t)v57);
  sub_10000D5B8((uint64_t)v61);
  sub_10000D5B8((uint64_t)v58);
  return v48;
}

uint64_t sub_10001D558(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageStore();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D5BC(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  sub_10001D8E0();
  (*v3)(a2);
  return a2;
}

void sub_10001D61C(void *a1, uint64_t a2)
{
}

uint64_t sub_10001D624(uint64_t a1, uint64_t a2)
{
  return sub_10001EDF8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10001D6E4()
{
  return v0 + 8;
}

uint64_t sub_10001D70C()
{
  return swift_slowAlloc();
}

void sub_10001D740(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_10001D760()
{
  return swift_beginAccess();
}

uint64_t sub_10001D780()
{
  return sub_10003D1B0();
}

uint64_t sub_10001D7AC()
{
  return v0;
}

uint64_t sub_10001D7CC()
{
  return swift_slowAlloc();
}

BOOL sub_10001D7E4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10001D800()
{
  return v0 - 136;
}

uint64_t sub_10001D82C(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_10001D854()
{
  return v0;
}

uint64_t sub_10001D86C()
{
  return sub_10003D1B0();
}

uint64_t sub_10001D890()
{
  return v0;
}

uint64_t sub_10001D8A8()
{
  return swift_slowAlloc();
}

void *sub_10001D8C0()
{
  return sub_10000E400(v0, v0[3]);
}

uint64_t sub_10001D8EC()
{
  return 0;
}

uint64_t sub_10001D900()
{
  return v0;
}

uint64_t sub_10001D914()
{
  return swift_arrayDestroy();
}

uint64_t sub_10001D92C(float a1)
{
  float *v1 = a1;
  return swift_errorRetain();
}

uint64_t sub_10001D94C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[141] = a4;
  v4[140] = a3;
  v4[139] = a2;
  v4[138] = a1;
  return _swift_task_switch(sub_10001D978, 0, 0);
}

uint64_t sub_10001D978()
{
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10003CEA0();
  *(void *)(v0 + 1136) = sub_10000CD54(v1, (uint64_t)qword_10005B898);
  uint64_t v2 = sub_10003CE80();
  os_log_type_t v3 = sub_10003D120();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "AudioManager start", v4, 2u);
    sub_10000DA3C();
  }
  uint64_t v5 = *(void *)(v0 + 1128);
  uint64_t v6 = *(void *)(v0 + 1120);
  unint64_t v7 = *(void *)(v0 + 1112);
  int v42 = v7;
  unint64_t v8 = *(void *)(v0 + 1104);
  int v40 = v8;

  unint64_t v43 = HIDWORD(v7);
  unint64_t v41 = HIDWORD(v8);
  sub_10000CCE8(&qword_100059EF0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000428D0;
  int v10 = (void *)kMXSessionProperty_AudioCategory;
  *(void *)(v0 + 1096) = kMXSessionProperty_AudioCategory;
  id v11 = v10;
  sub_10000CCE8(&qword_100059EF8);
  sub_10001E538();
  sub_10001E68C();
  *(void *)(inited + 96) = &type metadata for String;
  strcpy((char *)(inited + 72), "PlayAndRecord");
  *(_WORD *)(inited + 86) = -4864;
  int v12 = (void *)kMXSessionProperty_AudioMode;
  *(void *)(v0 + 1088) = kMXSessionProperty_AudioMode;
  id v13 = v12;
  sub_10001E68C();
  unint64_t v14 = self;
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 144) = 0x6168436F65646956;
  *(void *)(inited + 152) = 0xE900000000000074;
  unint64_t v15 = (void *)kMXSessionProperty_ClientPriority;
  *(void *)(v0 + 1072) = kMXSessionProperty_ClientPriority;
  id v16 = v15;
  sub_10001E68C();
  *(void *)(inited + 240) = &type metadata for Int;
  *(void *)(inited + 216) = 10;
  uint64_t v17 = (void *)kMXSessionProperty_CreateSpeakerDevice;
  *(void *)(v0 + 1048) = kMXSessionProperty_CreateSpeakerDevice;
  id v18 = v17;
  sub_10001E68C();
  *(void *)(inited + 312) = &type metadata for Int;
  *(void *)(inited + 288) = 0;
  uint64_t v19 = (void *)kMXSessionProperty_PrefersToPlayDuringWombat;
  *(void *)(v0 + 1032) = kMXSessionProperty_PrefersToPlayDuringWombat;
  id v20 = v19;
  sub_10001E68C();
  *(void *)(inited + 384) = &type metadata for Int;
  *(void *)(inited + 360) = 1;
  *(void *)(v0 + 1008) = 0xD000000000000020;
  *(void *)(v0 + 1016) = 0x8000000100041560;
  sub_10003D240();
  *(void *)(inited + 456) = &type metadata for Int;
  *(void *)(inited + 432) = 2;
  uint64_t v21 = (void *)kMXSessionProperty_InitiationDescription;
  *(void *)(v0 + 1024) = kMXSessionProperty_InitiationDescription;
  id v22 = v21;
  sub_10001E68C();
  sub_10000CCE8(&qword_100059F08);
  uint64_t v23 = swift_initStackObject();
  *(_OWORD *)(v23 + 16) = xmmword_1000428E0;
  *(void *)(v23 + 32) = sub_10003CFC0();
  *(void *)(v23 + 40) = v24;
  *(NSNumber *)(v23 + 48) = sub_10003D1A0();
  *(void *)(v23 + 56) = sub_10003CFC0();
  *(void *)(v23 + 64) = v25;
  *(NSNumber *)(v23 + 72) = sub_10003D1A0();
  *(void *)(v23 + 80) = sub_10003CFC0();
  *(void *)(v23 + 88) = v26;
  *(NSNumber *)(v23 + 96) = sub_10003D0D0();
  sub_10000D988(0, (unint64_t *)&qword_100059F10);
  uint64_t v27 = sub_10003CF80();
  *(void *)(inited + 528) = sub_10000CCE8(&qword_100059F18);
  *(void *)(inited + 504) = v27;
  uint64_t v28 = (void *)kMXSessionProperty_HostProcessAttribution;
  *(void *)(v0 + 1040) = kMXSessionProperty_HostProcessAttribution;
  id v29 = v28;
  sub_10001E68C();
  uint64_t v30 = swift_initStackObject();
  *(_OWORD *)(v30 + 16) = xmmword_1000428F0;
  uint64_t v31 = (void *)kMXSession_HostProcessAttributionKey_BundleID;
  *(void *)(v0 + 1056) = kMXSession_HostProcessAttributionKey_BundleID;
  id v32 = v31;
  sub_10001E68C();
  *(void *)(v30 + 96) = &type metadata for String;
  *(void *)(v30 + 72) = 0xD00000000000001CLL;
  *(void *)(v30 + 80) = 0x8000000100041590;
  uint64_t v33 = (void *)kMXSession_HostProcessAttributionKey_AuditToken;
  *(void *)(v0 + 1064) = kMXSession_HostProcessAttributionKey_AuditToken;
  id v34 = v33;
  sub_10001E68C();
  id v35 = self;
  *(_DWORD *)(v0 + 1152) = v40;
  *(_DWORD *)(v0 + 1156) = v41;
  *(_DWORD *)(v0 + 1160) = v42;
  *(_DWORD *)(v0 + 1164) = v43;
  *(void *)(v0 + 1168) = v6;
  *(void *)(v0 + 1176) = v5;
  id v36 = objc_msgSend(v35, "tu_dataForAuditToken:", v0 + 1152);
  *(void *)(v30 + 168) = sub_10000D988(0, &qword_100059F20);
  *(void *)(v30 + 144) = v36;
  uint64_t v37 = sub_10003CF80();
  *(void *)(inited + 600) = sub_10000CCE8(&qword_100059F28);
  *(void *)(inited + 576) = v37;
  uint64_t v38 = sub_10003CF80();
  sub_10001E5FC(v38, v14);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 1184;
  *(void *)(v0 + 24) = sub_10001E024;
  *(void *)(v0 + 1000) = swift_continuation_init();
  *(void *)(v0 + 968) = _NSConcreteStackBlock;
  *(void *)(v0 + 976) = 0x40000000;
  *(void *)(v0 + 984) = sub_10001E3E4;
  *(void *)(v0 + 992) = &unk_100052378;
  objc_msgSend(v14, "startAudioSessionWithCompletionHandler:");
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_10001E024()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 1144) = v1;
  if (v1) {
    uint64_t v2 = sub_10001E234;
  }
  else {
    uint64_t v2 = sub_10001E134;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001E134()
{
  int v1 = *(unsigned __int8 *)(v0 + 1184);
  uint64_t v2 = sub_10003CE80();
  if (v1 == 1)
  {
    os_log_type_t v3 = sub_10003D120();
    if (!os_log_type_enabled(v2, v3)) {
      goto LABEL_7;
    }
    uint64_t v4 = "AudioManager started successfully ";
  }
  else
  {
    os_log_type_t v3 = sub_10003D110();
    if (!os_log_type_enabled(v2, v3)) {
      goto LABEL_7;
    }
    uint64_t v4 = "AudioManager AVAudioClient didn't throw, but the session didn't start";
  }
  uint64_t v5 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v5 = 0;
  _os_log_impl((void *)&_mh_execute_header, v2, v3, v4, v5, 2u);
  sub_10000DA3C();
LABEL_7:

  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_10001E234()
{
  swift_willThrow();
  swift_errorRetain();
  swift_errorRetain();
  int v1 = sub_10003CE80();
  os_log_type_t v2 = sub_10003D100();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v3 = 138543362;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 1080) = v5;
    sub_10003D1B0();
    void *v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "AudioManager start failed with error %{public}@", v3, 0xCu);
    sub_10000CCE8(&qword_100059AC8);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_willThrow();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_10001E3E4(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_10002C7E8(v3, v4);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    return sub_10002C850(v6, a2);
  }
}

id sub_10001E444()
{
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10003CEA0();
  sub_10000CD54(v0, (uint64_t)qword_10005B898);
  int v1 = sub_10003CE80();
  os_log_type_t v2 = sub_10003D120();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "AudioManager stop", v3, 2u);
    sub_10000DA3C();
  }

  id v4 = self;

  return [v4 stopAudioSession];
}

unint64_t sub_10001E538()
{
  unint64_t result = qword_100059F00;
  if (!qword_100059F00)
  {
    sub_10000D724(&qword_100059EF8);
    sub_10001E5AC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059F00);
  }
  return result;
}

unint64_t sub_10001E5AC()
{
  unint64_t result = qword_100059800;
  if (!qword_100059800)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059800);
  }
  return result;
}

void sub_10001E5FC(uint64_t a1, void *a2)
{
  Class isa = sub_10003CF60().super.isa;
  swift_bridgeObjectRelease();
  [a2 setAudioSessionProperties:isa];
}

ValueMetadata *type metadata accessor for AudioManager()
{
  return &type metadata for AudioManager;
}

uint64_t sub_10001E68C()
{
  return sub_10003D240();
}

uint64_t sub_10001E6A4(uint64_t a1, uint64_t a2)
{
  return sub_10001E6E4(a1, a2, &OBJC_IVAR____TtC18FTLivePhotoService17MessageController_onRequestFinishedProcessing, (uint64_t (*)(uint64_t, uint64_t))sub_10000D9D4);
}

uint64_t sub_10001E6C4(uint64_t a1, uint64_t a2)
{
  return sub_10001E6E4(a1, a2, &OBJC_IVAR____TtC18FTLivePhotoService17MessageController_onRequestError, (uint64_t (*)(uint64_t, uint64_t))sub_10000CDF0);
}

uint64_t sub_10001E6E4(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = (uint64_t *)(v4 + *a3);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t *v5 = a1;
  v5[1] = a2;
  return a4(v6, v7);
}

void sub_10001E704(void *a1, uint64_t a2)
{
}

void sub_10001E728(void *a1, uint64_t a2)
{
  uint64_t v34 = a2;
  uint64_t v4 = type metadata accessor for MessageStore();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000CCE8(&qword_100059960);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  v32[1] = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v11 = (char *)v32 - v10;
  uint64_t v12 = type metadata accessor for MessageRequest();
  __chkstk_darwin(v12);
  uint64_t v33 = (uint64_t)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = v2;
  uint64_t v14 = v2 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_messageStore;
  swift_beginAccess();
  sub_100023BE0(v14, (uint64_t)v6, (void (*)(void))type metadata accessor for MessageStore);
  uint64_t v16 = a1[3];
  uint64_t v15 = a1[4];
  id v35 = a1;
  sub_10000E400(a1, v16);
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v16, v15);
  uint64_t v19 = v18;
  swift_bridgeObjectRetain();
  uint64_t v20 = swift_bridgeObjectRetain();
  sub_1000237E8(v20, v17, v19, (uint64_t)v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100023C34((uint64_t)v6, (void (*)(void))type metadata accessor for MessageStore);
  v32[0] = v12;
  if (sub_10000CD2C((uint64_t)v11, 1, v12) == 1)
  {
    sub_100023DDC((uint64_t)v11, &qword_100059960);
    if (qword_100059758 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_10003CEA0();
    sub_10000CD54(v21, (uint64_t)qword_10005B898);
    sub_10000CD8C((uint64_t)v35, (uint64_t)v39);
    id v22 = sub_10003CE80();
    os_log_type_t v23 = sub_10003D100();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136446210;
      sub_10000CD8C((uint64_t)v39, (uint64_t)v37);
      uint64_t v25 = sub_10000BF2C((uint64_t)v37);
      unint64_t v27 = v26;
      sub_100023DDC((uint64_t)v37, &qword_100059930);
      v37[0] = sub_10000CE00(v25, v27, &v38);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      sub_10000D5B8((uint64_t)v39);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Couldn't find processing request that apparently finished %{public}s", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10000D5B8((uint64_t)v39);
    }
  }
  else
  {
    uint64_t v28 = (uint64_t)v11;
    uint64_t v29 = v33;
    sub_10000D7B8(v28, v33);
    swift_beginAccess();
    uint64_t v30 = sub_100039970(v29, v34);
    swift_endAccess();
    uint64_t v31 = *(void (**))(v36
                                            + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_onRequestFinishedProcessing);
    if (v31)
    {
      swift_retain();
      v31(v30);
      sub_10000CDF0((uint64_t)v31);

      sub_100023C34(v29, (void (*)(void))type metadata accessor for MessageRequest);
    }
    else
    {
      sub_100023C34(v29, (void (*)(void))type metadata accessor for MessageRequest);
    }
  }
}

uint64_t sub_10001EDF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for MessageStore();
  sub_10000DA20();
  __chkstk_darwin(v6);
  sub_10000D9F4();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_10000CCE8(&qword_100059960);
  uint64_t v11 = sub_10000DA68(v10);
  __chkstk_darwin(v11);
  sub_100023F9C();
  uint64_t v14 = v12 - v13;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v39 - v16;
  uint64_t v18 = type metadata accessor for MessageRequest();
  sub_10000DA20();
  __chkstk_darwin(v19);
  sub_10000D9F4();
  uint64_t v22 = v21 - v20;
  sub_100023D8C(a1, (uint64_t)&v44, &qword_100059930);
  if (v45)
  {
    uint64_t v40 = a2;
    sub_10000D668(&v44, (uint64_t)v46);
    uint64_t v41 = a3;
    uint64_t v23 = a3 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_messageStore;
    swift_beginAccess();
    sub_100023BE0(v23, v9, (void (*)(void))type metadata accessor for MessageStore);
    sub_10000E400(v46, v46[3]);
    sub_100023FF4();
    uint64_t v25 = v24();
    uint64_t v27 = v26;
    swift_bridgeObjectRetain();
    uint64_t v28 = swift_bridgeObjectRetain();
    sub_1000237E8(v28, v25, v27, (uint64_t)v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100023C34(v9, (void (*)(void))type metadata accessor for MessageStore);
    if (sub_10000CD2C((uint64_t)v17, 1, v18) == 1)
    {
      sub_100023DDC((uint64_t)v17, &qword_100059960);
      if (qword_100059758 != -1) {
        swift_once();
      }
      uint64_t v29 = sub_10003CEA0();
      sub_10000CD54(v29, (uint64_t)qword_10005B898);
      sub_10000CD8C((uint64_t)v46, (uint64_t)&v44);
      uint64_t v30 = sub_10003CE80();
      os_log_type_t v31 = sub_10003D100();
      if (os_log_type_enabled(v30, v31))
      {
        id v32 = (uint8_t *)sub_10001D70C();
        uint64_t v43 = sub_10001D7CC();
        *(_DWORD *)id v32 = 136446210;
        sub_10000CD8C((uint64_t)&v44, (uint64_t)v42);
        uint64_t v33 = sub_10000BF2C((uint64_t)v42);
        unint64_t v35 = v34;
        sub_100023DDC((uint64_t)v42, &qword_100059930);
        v42[0] = sub_10000CE00(v33, v35, &v43);
        sub_10003D1B0();
        swift_bridgeObjectRelease();
        sub_10000D5B8((uint64_t)&v44);
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "Couldn't find processing request that apparently finished %{public}s", v32, 0xCu);
        swift_arrayDestroy();
        sub_10000DA3C();
        sub_10000DA3C();
      }
      else
      {
        sub_10000D5B8((uint64_t)&v44);
      }
    }
    else
    {
      sub_10000D7B8((uint64_t)v17, v22);
      uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v41
                                                    + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_onRequestError);
      if (v38)
      {
        sub_100023BE0(v22, v14, (void (*)(void))type metadata accessor for MessageRequest);
        sub_10000FA0C(v14, 0, 1, v18);
        swift_retain();
        v38(v14, v40);
        sub_10000CDF0((uint64_t)v38);
        sub_100023DDC(v14, &qword_100059960);
      }
      sub_100023C34(v22, (void (*)(void))type metadata accessor for MessageRequest);
    }
    return sub_10000D5B8((uint64_t)v46);
  }
  else
  {
    uint64_t result = sub_100023DDC((uint64_t)&v44, &qword_100059930);
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(a3
                                                  + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_onRequestError);
    if (v37)
    {
      sub_10000FA0C(v14, 1, 1, v18);
      swift_retain();
      v37(v14, a2);
      sub_10000CDF0((uint64_t)v37);
      return sub_100023DDC(v14, &qword_100059960);
    }
  }
  return result;
}

uint64_t sub_10001F2CC()
{
  uint64_t v1 = type metadata accessor for MessageStore();
  uint64_t v2 = sub_10000DA68(v1);
  __chkstk_darwin(v2);
  sub_10000D9F4();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = v0 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_messageStore;
  swift_beginAccess();
  sub_100023BE0(v6, v5, (void (*)(void))type metadata accessor for MessageStore);
  sub_1000389A8();
  return sub_100023C34(v5, (void (*)(void))type metadata accessor for MessageStore);
}

uint64_t sub_10001F398()
{
  *(void *)(v1 + 40) = v0;
  return sub_100023F14((uint64_t)sub_10001F3B0);
}

uint64_t sub_10001F3B0()
{
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10003CEA0();
  sub_10000CD54(v2, (uint64_t)qword_10005B898);
  uint64_t v3 = sub_10003CE80();
  os_log_type_t v4 = sub_10003D120();
  if (sub_100023F20(v4))
  {
    uint64_t v5 = (uint8_t *)sub_100023FDC();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v0, "MessageController prewarm audio client", v5, 2u);
    sub_10000DA3C();
  }

  sub_100023F6C();
  swift_beginAccess();
  uint64_t v6 = sub_100023F6C();
  sub_10001CFD8(v6, v7);
  sub_100023FF4();
  v8();
  uint64_t v9 = sub_10000E400((void *)(*(void *)(v1 + 40) + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_audioManager), *(void *)(*(void *)(v1 + 40) + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_audioManager + 24));
  uint64_t v10 = v9[2];
  uint64_t v11 = v9[3];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v1 + 48) = v12;
  void *v12 = v1;
  v12[1] = sub_10001F59C;
  uint64_t v13 = sub_100023F6C();
  return sub_10001D94C(v13, v14, v10, v11);
}

uint64_t sub_10001F59C()
{
  sub_10001D6B4();
  sub_10001D69C();
  uint64_t v1 = *v0;
  sub_100023F3C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10001D6E4();
  return v3();
}

uint64_t sub_10001F660@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v46 = a2;
  uint64_t v7 = sub_10000CCE8(&qword_100059960);
  uint64_t v8 = sub_10000DA68(v7);
  __chkstk_darwin(v8);
  sub_10001D6C0();
  long long v44 = (uint8_t *)v9;
  unint64_t v47 = (char *)type metadata accessor for MessageRequest();
  sub_10000DA20();
  __chkstk_darwin(v10);
  sub_100023F9C();
  uint64_t v13 = v11 - v12;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v41 - v15;
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_10003CEA0();
  uint64_t v43 = sub_10000CD54(v17, (uint64_t)qword_10005B898);
  uint64_t v18 = sub_10003CE80();
  os_log_type_t v19 = sub_10003D120();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v41 = v3;
    uint64_t v20 = sub_10001D70C();
    uint64_t v45 = v13;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = sub_10001D7CC();
    uint64_t v42 = v5;
    v48[0] = v22;
    *(_DWORD *)uint64_t v21 = 136446210;
    int v49 = a1;
    type metadata accessor for TUMessageMediaType(0);
    uint64_t v23 = sub_10003CFF0();
    uint64_t v25 = sub_10000CE00(v23, v24, v48);
    sub_100023EA0(v25);
    sub_10003D1B0();
    uint64_t v4 = v41;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "MessageController will start recording mediaType %{public}s", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v5 = v42;
    sub_10000DA3C();
    uint64_t v13 = v45;
    sub_10000DA3C();
  }

  uint64_t result = sub_10001FB74(a1, (uint64_t)v16);
  if (!v4)
  {
    uint64_t v27 = v5 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_stateMachine;
    sub_100023EFC();
    sub_10001CFD8(v27, *(void *)(v27 + 24));
    sub_100023FF4();
    v28();
    swift_endAccess();
    sub_10000E400(&v16[*((int *)v47 + 5)], *(void *)&v16[*((int *)v47 + 5) + 24]);
    sub_100023F78();
    v29();
    uint64_t v30 = (uint64_t)v44;
    sub_100023BE0((uint64_t)v16, (uint64_t)v44, (void (*)(void))type metadata accessor for MessageRequest);
    sub_10000FA0C(v30, 0, 1, (uint64_t)v47);
    uint64_t v31 = v5 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_currentRequest;
    sub_100023EFC();
    sub_100023B78(v30, v31);
    swift_endAccess();
    sub_100023BE0((uint64_t)v16, v13, (void (*)(void))type metadata accessor for MessageRequest);
    id v32 = sub_10003CE80();
    os_log_type_t v33 = sub_10003D120();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = sub_10001D70C();
      unint64_t v47 = v16;
      unint64_t v35 = (uint8_t *)v34;
      uint64_t v36 = sub_10001D7CC();
      uint64_t v45 = v13;
      v48[0] = v36;
      *(_DWORD *)unint64_t v35 = 136446210;
      long long v44 = v35 + 4;
      sub_10003CDA0();
      sub_100023CCC(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v37 = sub_10003D320();
      uint64_t v39 = sub_10000CE00(v37, v38, v48);
      sub_100023EA0(v39);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      sub_100023C34(v45, (void (*)(void))type metadata accessor for MessageRequest);
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "MessageController started recording with UUID %{public}s", v35, 0xCu);
      swift_arrayDestroy();
      sub_10000DA3C();
      uint64_t v16 = v47;
      sub_10000DA3C();
    }
    else
    {
      sub_100023C34(v13, (void (*)(void))type metadata accessor for MessageRequest);
    }

    sub_10003CDA0();
    sub_10000DA20();
    (*(void (**)(uint64_t, char *))(v40 + 16))(v46, v16);
    return sub_100023C34((uint64_t)v16, (void (*)(void))type metadata accessor for MessageRequest);
  }
  return result;
}

uint64_t sub_10001FB74@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_10003CDA0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003CD90();
  sub_1000236E4(a1);
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
  uint64_t v10 = type metadata accessor for MessageRequest();
  return sub_10000D668(&v12, a2 + *(int *)(v10 + 20));
}

uint64_t sub_10001FCA8(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v71 = type metadata accessor for MessageRequest();
  sub_10000DA20();
  __chkstk_darwin(v5);
  sub_10000D9F4();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_10000CCE8(&qword_100059960);
  uint64_t v10 = sub_10000DA68(v9);
  __chkstk_darwin(v10);
  sub_100023EB4();
  uint64_t v62 = v11;
  sub_100023EF0();
  __chkstk_darwin(v12);
  sub_100024068();
  uint64_t v63 = v13;
  sub_100023EF0();
  __chkstk_darwin(v14);
  v69 = (uint8_t *)&v62 - v15;
  sub_10003CDA0();
  sub_100023E80();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_100023F9C();
  uint64_t v21 = v19 - v20;
  __chkstk_darwin(v22);
  unint64_t v24 = (char *)&v62 - v23;
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v68 = v21;
  uint64_t v25 = sub_10003CEA0();
  uint64_t v26 = sub_10000CD54(v25, (uint64_t)qword_10005B898);
  uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  uint64_t v74 = a1;
  uint64_t v65 = v27;
  uint64_t v66 = v17 + 16;
  v27((uint64_t)v24, a1, v2);
  uint64_t v67 = v26;
  uint64_t v28 = sub_10003CE80();
  os_log_type_t v29 = sub_10003D120();
  BOOL v30 = os_log_type_enabled(v28, v29);
  uint64_t v64 = v8;
  if (v30)
  {
    uint64_t v31 = sub_10001D70C();
    uint64_t v72 = v3;
    id v32 = (uint8_t *)v31;
    v75[0] = sub_10001D7CC();
    *(_DWORD *)id v32 = 136446210;
    uint64_t v70 = v17;
    sub_100023CCC(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v33 = sub_10003D320();
    uint64_t v78 = sub_10000CE00(v33, v34, v75);
    uint64_t v17 = v70;
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    unint64_t v35 = *(void (**)(void))(v17 + 8);
    sub_100023F78();
    v35();
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "MessageController will end recording with UUID %{public}s", v32, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    uint64_t v3 = v72;
    sub_10000DA3C();
  }
  else
  {
    unint64_t v35 = *(void (**)(void))(v17 + 8);
    sub_100023F78();
    v35();
  }

  uint64_t v36 = v73;
  uint64_t v37 = v74;
  uint64_t result = sub_100020380();
  if (!v36)
  {
    uint64_t v39 = v3 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_stateMachine;
    sub_100023EFC();
    uint64_t v72 = v3;
    uint64_t v40 = *(void *)(v39 + 24);
    uint64_t v41 = *(void *)(v39 + 32);
    sub_10001CFD8(v39, v40);
    uint64_t v42 = sub_100023EC8();
    v43(v42);
    swift_endAccess();
    uint64_t v44 = v41 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_currentRequest;
    swift_beginAccess();
    uint64_t v73 = v44;
    uint64_t v45 = (uint64_t)v69;
    sub_100023D8C(v44, (uint64_t)v69, &qword_100059960);
    uint64_t v46 = v71;
    if (sub_10000CD2C(v45, 1, v71))
    {
      sub_100023DDC(v45, &qword_100059960);
    }
    else
    {
      sub_10000CD8C(v45 + *(int *)(v46 + 20), (uint64_t)v75);
      sub_100023DDC(v45, &qword_100059960);
      uint64_t v40 = v76;
      uint64_t v41 = v77;
      sub_10000E400(v75, v76);
      uint64_t v60 = sub_100023EC8();
      v61(v60);
      sub_10000D5B8((uint64_t)v75);
    }
    uint64_t v70 = v17;
    v65(v68, v37, v40);
    unint64_t v47 = sub_10003CE80();
    os_log_type_t v48 = sub_10003D120();
    if (os_log_type_enabled(v47, v48))
    {
      int v49 = (uint8_t *)sub_10001D70C();
      uint64_t v74 = sub_10001D7CC();
      v75[0] = v74;
      *(_DWORD *)int v49 = 136446210;
      v69 = v49 + 4;
      sub_100023CCC(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v50 = sub_10003D320();
      uint64_t v52 = sub_10000CE00(v50, v51, v75);
      sub_100023EA0(v52);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      uint64_t v53 = sub_100023F48();
      ((void (*)(uint64_t))v35)(v53);
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "MessageController ended recording with UUID %{public}s", v49, 0xCu);
      swift_arrayDestroy();
      sub_10000DA3C();
      uint64_t v41 = v72;
      sub_10000DA3C();
    }
    else
    {
      uint64_t v54 = sub_100023F48();
      ((void (*)(uint64_t))v35)(v54);
    }

    uint64_t v55 = v63;
    uint64_t v56 = v64;
    uint64_t v57 = v73;
    sub_10000E400((void *)(v41 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_audioManager), *(void *)(v41 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_audioManager + 24));
    sub_10001E444();
    sub_100023D8C(v57, v55, &qword_100059960);
    if (sub_10000CD2C(v55, 1, v71) == 1)
    {
      sub_100023DDC(v55, &qword_100059960);
      sub_100023B2C();
      swift_allocError();
      unsigned char *v58 = 0;
      return swift_willThrow();
    }
    else
    {
      sub_10000D7B8(v55, v56);
      sub_100023EFC();
      sub_100038DA8(v56);
      swift_endAccess();
      uint64_t v59 = v62;
      sub_10000FA0C(v62, 1, 1, v71);
      sub_100023EFC();
      sub_100023B78(v59, v57);
      swift_endAccess();
      return sub_100023C34(v56, (void (*)(void))type metadata accessor for MessageRequest);
    }
  }
  return result;
}

uint64_t sub_100020380()
{
  uint64_t v1 = sub_10000CCE8(&qword_100059960);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MessageRequest();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v0 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_currentRequest;
  swift_beginAccess();
  sub_100023D8C(v7, (uint64_t)v3, &qword_100059960);
  if (sub_10000CD2C((uint64_t)v3, 1, v4) == 1)
  {
    sub_100023DDC((uint64_t)v3, &qword_100059960);
    sub_100023B2C();
    swift_allocError();
    *uint64_t v8 = 0;
    return swift_willThrow();
  }
  else
  {
    sub_10000D7B8((uint64_t)v3, (uint64_t)v6);
    if ((sub_10003CD70() & 1) == 0)
    {
      sub_100023B2C();
      swift_allocError();
      *uint64_t v10 = 1;
      swift_willThrow();
    }
    return sub_100023C34((uint64_t)v6, (void (*)(void))type metadata accessor for MessageRequest);
  }
}

uint64_t sub_100020550()
{
  sub_10001D6B4();
  v1[6] = v2;
  v1[7] = v0;
  uint64_t v3 = sub_10003CE40();
  v1[8] = v3;
  sub_100023E68(v3);
  v1[9] = v4;
  v1[10] = sub_100023F84();
  uint64_t v5 = sub_10003CD40();
  v1[11] = v5;
  sub_100023E68(v5);
  v1[12] = v6;
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for MessageStore();
  v1[15] = v7;
  sub_10000DA68(v7);
  v1[16] = sub_100023F84();
  uint64_t v8 = sub_10003CDA0();
  v1[17] = v8;
  sub_100023E68(v8);
  v1[18] = v9;
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  sub_100023F60();
  return _swift_task_switch(v10, v11, v12);
}

uint64_t sub_100020690()
{
  uint64_t v64 = v0;
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v2 = (id *)(v0 + 6);
  uint64_t v1 = (void *)v0[6];
  uint64_t v3 = sub_10003CEA0();
  sub_10000CD54(v3, (uint64_t)qword_10005B898);
  id v4 = v1;
  uint64_t v5 = sub_10003CE80();
  os_log_type_t v6 = sub_10003D120();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t type = v6;
    uint64_t v7 = v0[20];
    uint64_t v8 = v0[17];
    uint64_t v9 = v0[18];
    uint64_t v10 = (void *)v0[6];
    uint64_t v58 = v10;
    uint64_t v11 = (uint8_t *)sub_10001D70C();
    uint64_t v63 = sub_10001D7CC();
    *(_DWORD *)uint64_t v11 = 136446210;
    id v12 = [v10 sessionUUID];
    sub_10003CD80();

    sub_100023CCC(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v13 = sub_10003D320();
    unint64_t v15 = v14;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    v0[5] = sub_10000CE00(v13, v15, &v63);
    sub_10003D1B0();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v5, type, "MessageController sending message with uuid %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    id v16 = *v2;
  }
  id v17 = [*v2 destinationHandles];
  sub_100023C8C();
  sub_100023CCC(&qword_100059FF0, (void (*)(uint64_t))sub_100023C8C);
  uint64_t v18 = sub_10003D0B0();

  uint64_t v19 = sub_100021038(v18);
  swift_bridgeObjectRelease();
  if (v19 < 1)
  {
    unint64_t v47 = (void *)sub_10003CE80();
    os_log_type_t v52 = sub_10003D100();
    if (!sub_100023F20(v52))
    {
      char v51 = 4;
      goto LABEL_19;
    }
    *(_WORD *)sub_100023FDC() = 0;
    sub_100024048((void *)&_mh_execute_header, v53, v54, "Skipping message send as there are no sender handles");
    char v51 = 4;
  }
  else
  {
    uint64_t v21 = v0[15];
    uint64_t v20 = v0[16];
    uint64_t v22 = (void *)v0[6];
    uint64_t v23 = v0[7] + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_messageStore;
    swift_beginAccess();
    sub_100023BE0(v23, v20, (void (*)(void))type metadata accessor for MessageStore);
    id v24 = [v22 sessionUUID];
    sub_10003CD80();

    uint64_t v25 = *(void *)(v20 + *(int *)(v21 + 28));
    if (*(void *)(v25 + 16))
    {
      unint64_t v26 = sub_100033224(v0[19]);
      if (v27)
      {
        uint64_t v28 = v0[19];
        uint64_t v30 = v0[17];
        uint64_t v29 = v0[18];
        uint64_t v31 = v0[16];
        uint64_t v57 = v0[14];
        *(void *)typea = v0[12];
        uint64_t v61 = v0[13];
        uint64_t v62 = v0[11];
        id v32 = (void *)v0[6];
        uint64_t v33 = *(void **)(*(void *)(v25 + 56) + 8 * v26);
        v0[21] = v33;
        unint64_t v34 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
        id v35 = v33;
        v34(v28, v30);
        sub_100023C34(v31, (void (*)(void))type metadata accessor for MessageStore);
        id v36 = [v35 videoURL];
        id v37 = [v36 URL];

        sub_10003CD00();
        id v38 = [v32 destinationHandles];
        uint64_t v39 = sub_10003D0B0();

        sub_100021058(v39);
        swift_bridgeObjectRelease();
        id v40 = [v32 conversationID];
        sub_10003CD80();

        id v41 = [v32 senderHandle];
        id v42 = [v41 value];

        sub_10003CFC0();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)typea + 16))(v61, v57, v62);
        sub_10003CE20();
        uint64_t v43 = (void *)swift_task_alloc();
        v0[22] = v43;
        *uint64_t v43 = v0;
        v43[1] = sub_100020D88;
        uint64_t v44 = v0[10];
        return sub_1000213FC(v44);
      }
    }
    uint64_t v46 = v0[16];
    (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
    sub_100023C34(v46, (void (*)(void))type metadata accessor for MessageStore);
    unint64_t v47 = (void *)sub_10003CE80();
    os_log_type_t v48 = sub_10003D100();
    if (!sub_100023F20(v48))
    {
      char v51 = 1;
      goto LABEL_19;
    }
    *(_WORD *)sub_100023FDC() = 0;
    sub_100024048((void *)&_mh_execute_header, v49, v50, "Trying to send a message with an unknown UUID");
    char v51 = 1;
  }
  sub_10000DA3C();
LABEL_19:

  sub_100023B2C();
  swift_allocError();
  *uint64_t v55 = v51;
  swift_willThrow();
  sub_100024028();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10001D6E4();
  return v56();
}

uint64_t sub_100020D88()
{
  sub_10001D6B4();
  sub_10001D69C();
  sub_100023F3C();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_100023F3C();
  void *v5 = v4;
  *(void *)(v6 + 184) = v0;
  swift_task_dealloc();
  sub_100023F60();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_100020E68()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 80);
  uint64_t v6 = *(void *)(v0 + 64);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_100023FAC();
  return v7();
}

uint64_t sub_100020F60()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = sub_100023F6C();
  v5(v4);
  sub_100024028();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10001D6E4();
  return v6();
}

uint64_t sub_100021038(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) == 0) {
    return *(void *)(a1 + 16);
  }
  if (a1 < 0) {
    return __CocoaSet.count.getter(a1);
  }
  return __CocoaSet.count.getter(a1 & 0xFFFFFFFFFFFFFF8);
}

void sub_100021058(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_10003D200();
    sub_100023C8C();
    sub_100023CCC(&qword_100059FF0, (void (*)(uint64_t))sub_100023C8C);
    sub_10003D0C0();
    uint64_t v1 = v28;
    uint64_t v27 = v29;
    uint64_t v2 = v30;
    int64_t v3 = v31;
    uint64_t v4 = v32;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v27 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    uint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    int64_t v3 = 0;
  }
  uint64_t v24 = v2;
  int64_t v26 = (unint64_t)(v2 + 64) >> 6;
  uint64_t v25 = (char *)_swiftEmptyArrayStorage;
LABEL_8:
  int64_t v8 = v3;
  unint64_t v9 = v4;
  while (1)
  {
    if (v1 < 0)
    {
      if (!sub_10003D220()) {
        goto LABEL_42;
      }
      sub_100023C8C();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v11 = v33;
      swift_unknownObjectRelease();
      int64_t v3 = v8;
      uint64_t v4 = v9;
      if (!v33) {
        goto LABEL_42;
      }
      goto LABEL_27;
    }
    if (!v9) {
      break;
    }
    uint64_t v4 = (v9 - 1) & v9;
    unint64_t v10 = __clz(__rbit64(v9)) | (v8 << 6);
    int64_t v3 = v8;
LABEL_26:
    id v11 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v11) {
      goto LABEL_42;
    }
LABEL_27:
    NSString v14 = objc_msgSend(v11, "value", v24);
    if (!v14)
    {
      sub_10003CFC0();
      NSString v14 = sub_10003CFB0();
      swift_bridgeObjectRelease();
    }
    uint64_t v15 = sub_100023D1C(v14);
    uint64_t v17 = v16;

    int64_t v8 = v3;
    unint64_t v9 = v4;
    if (v17)
    {
      uint64_t v19 = v25;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        uint64_t v19 = sub_1000266A0(0, *((void *)v25 + 2) + 1, 1, (uint64_t)v25);
      }
      unint64_t v22 = *((void *)v19 + 2);
      unint64_t v21 = *((void *)v19 + 3);
      if (v22 >= v21 >> 1) {
        uint64_t v19 = sub_1000266A0((char *)(v21 > 1), v22 + 1, 1, (uint64_t)v19);
      }
      *((void *)v19 + 2) = v22 + 1;
      uint64_t v25 = v19;
      uint64_t v23 = &v19[16 * v22];
      *((void *)v23 + 4) = v15;
      *((void *)v23 + 5) = v17;
      goto LABEL_8;
    }
  }
  int64_t v3 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v3 >= v26) {
      goto LABEL_42;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v3);
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_42;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (v12) {
        goto LABEL_24;
      }
      int64_t v13 = v8 + 3;
      if (v8 + 3 >= v26) {
        goto LABEL_42;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (v12) {
        goto LABEL_24;
      }
      int64_t v13 = v8 + 4;
      if (v8 + 4 >= v26) {
        goto LABEL_42;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (v12)
      {
LABEL_24:
        int64_t v3 = v13;
      }
      else
      {
        int64_t v3 = v8 + 5;
        if (v8 + 5 >= v26) {
          goto LABEL_42;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v3);
        if (!v12)
        {
          int64_t v18 = v8 + 6;
          while (v18 < v26)
          {
            unint64_t v12 = *(void *)(v27 + 8 * v18++);
            if (v12)
            {
              int64_t v3 = v18 - 1;
              goto LABEL_25;
            }
          }
LABEL_42:
          sub_100023D14();
          return;
        }
      }
    }
LABEL_25:
    uint64_t v4 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
    goto LABEL_26;
  }
  __break(1u);
}

uint64_t sub_1000213FC(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return sub_100023F14((uint64_t)sub_100021414);
}

uint64_t sub_100021414()
{
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10003CEA0();
  v0[5] = sub_10000CD54(v1, (uint64_t)qword_10005B898);
  uint64_t v2 = sub_10003CE80();
  os_log_type_t v3 = sub_10003D120();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)sub_100023FDC();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "SENDING USING NEW DAEMON METHOD", v4, 2u);
    sub_10000DA3C();
  }
  uint64_t v5 = v0[4];

  uint64_t v6 = (void *)(v5 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_videoMessagingController);
  uint64_t v7 = *(void *)(v5 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_videoMessagingController + 24);
  uint64_t v8 = v6[4];
  sub_10000E400(v6, v7);
  unint64_t v9 = (void *)swift_task_alloc();
  v0[6] = v9;
  void *v9 = v0;
  v9[1] = sub_100021584;
  uint64_t v10 = v0[3];
  return dispatch thunk of VideoMessagingDataSource.sendVideoMessage(_:)(v10, v7, v8);
}

uint64_t sub_100021584()
{
  sub_10001D6B4();
  sub_10001D69C();
  sub_100023F3C();
  *os_log_type_t v3 = v2;
  uint64_t v4 = *v1;
  sub_100023F3C();
  void *v5 = v4;
  *(void *)(v6 + 56) = v0;
  swift_task_dealloc();
  sub_100023F60();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_100021664()
{
  sub_10001D6B4();
  sub_100021854(*(void *)(v0 + 24));
  sub_100023FAC();
  return v1();
}

uint64_t sub_1000216BC()
{
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_10003CE80();
  os_log_type_t v3 = sub_10003D100();
  if (sub_100023F20(v3))
  {
    uint64_t v4 = (uint8_t *)sub_10001D70C();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138543362;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v1 + 16) = v6;
    sub_10003D1B0();
    void *v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v0, "Failed to send video message using daemon %{public}@", v4, 0xCu);
    sub_10000CCE8(&qword_100059AC8);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v7 = *(void *)(v1 + 24);
  swift_willThrow();
  sub_100021854(v7);
  sub_10001D6E4();
  return v8();
}

void sub_100021854(uint64_t a1)
{
  uint64_t v2 = sub_10003CD40();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  os_log_type_t v52 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10003CE40();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v50 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v45 - v9;
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_10003CEA0();
  uint64_t v12 = sub_10000CD54(v11, (uint64_t)qword_10005B898);
  unint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v48 = v6 + 16;
  v47(v10, a1, v5);
  uint64_t v49 = (uint8_t *)v12;
  int64_t v13 = sub_10003CE80();
  os_log_type_t v14 = sub_10003D120();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v54 = v6;
  if (v15)
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v53 = v3;
    uint64_t v17 = (uint8_t *)v16;
    int64_t v18 = (void *)swift_slowAlloc();
    uint64_t v45 = a1;
    id v56 = v18;
    uint64_t v51 = v5;
    *(_DWORD *)uint64_t v17 = 136446210;
    uint64_t v46 = (void (*)(char *, uint64_t))(v17 + 4);
    uint64_t v19 = v52;
    sub_10003CE30();
    sub_100023CCC((unint64_t *)&qword_100059FE0, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v20 = sub_10003D320();
    unint64_t v22 = v21;
    (*(void (**)(char *, uint64_t))(v53 + 8))(v19, v2);
    uint64_t v55 = sub_10000CE00(v20, v22, (uint64_t *)&v56);
    uint64_t v5 = v51;
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    uint64_t v46 = *(void (**)(char *, uint64_t))(v54 + 8);
    v46(v10, v5);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Cleaning up video message at URL %{public}s", v17, 0xCu);
    swift_arrayDestroy();
    a1 = v45;
    swift_slowDealloc();
    uint64_t v3 = v53;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v46 = *(void (**)(char *, uint64_t))(v6 + 8);
    v46(v10, v5);

    uint64_t v19 = v52;
  }
  id v23 = [self defaultManager];
  sub_10003CE30();
  sub_10003CCD0(v24);
  int64_t v26 = v25;
  uint64_t v29 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v27 = v3 + 8;
  uint64_t v28 = v29;
  v29(v19, v2);
  id v56 = 0;
  unsigned int v30 = [v23 removeItemAtURL:v26 error:&v56];

  id v31 = v56;
  if (!v30)
  {
    uint64_t v32 = v31;
    uint64_t v33 = sub_10003CC90();

    swift_willThrow();
    unint64_t v34 = v50;
    v47(v50, a1, v5);
    id v35 = sub_10003CE80();
    uint64_t v36 = v5;
    os_log_type_t v37 = sub_10003D100();
    if (os_log_type_enabled(v35, v37))
    {
      uint64_t v51 = v36;
      uint64_t v38 = swift_slowAlloc();
      os_log_type_t v52 = (char *)v33;
      uint64_t v39 = (uint8_t *)v38;
      id v40 = (void *)swift_slowAlloc();
      uint64_t v53 = v27;
      id v56 = v40;
      *(_DWORD *)uint64_t v39 = 136446210;
      uint64_t v49 = v39 + 4;
      sub_10003CE30();
      sub_100023CCC((unint64_t *)&qword_100059FE0, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v41 = sub_10003D320();
      uint64_t v42 = v2;
      unint64_t v44 = v43;
      v28(v19, v42);
      uint64_t v55 = sub_10000CE00(v41, v44, (uint64_t *)&v56);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      v46(v34, v51);
      _os_log_impl((void *)&_mh_execute_header, v35, v37, "Failed to clean up video message %{public}s", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v46(v34, v36);
    }
    swift_errorRelease();
  }
}

uint64_t sub_100021EB8()
{
  sub_10001D6B4();
  v1[22] = v2;
  v1[23] = v0;
  uint64_t v3 = sub_10003CD40();
  v1[24] = v3;
  sub_100023E68(v3);
  v1[25] = v4;
  v1[26] = sub_100023F84();
  uint64_t v5 = type metadata accessor for MessageStore();
  v1[27] = v5;
  sub_10000DA68(v5);
  v1[28] = sub_100023F84();
  uint64_t v6 = sub_10003CDA0();
  v1[29] = v6;
  sub_100023E68(v6);
  v1[30] = v7;
  v1[31] = sub_100023F84();
  sub_100023F60();
  return _swift_task_switch(v8, v9, v10);
}

uint64_t sub_100021F98()
{
  id v40 = v0;
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[30];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[29];
  uint64_t v5 = sub_10003CEA0();
  v0[32] = sub_10000CD54(v5, (uint64_t)qword_10005B898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v1, v4);
  uint64_t v6 = sub_10003CE80();
  os_log_type_t v7 = sub_10003D120();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)sub_10001D70C();
    uint64_t v39 = sub_10001D7CC();
    *(_DWORD *)uint64_t v8 = 136446210;
    sub_100023CCC(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v9 = sub_10003D320();
    v0[21] = sub_10000CE00(v9, v10, &v39);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_100024014();
    v12(v11);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "MessageController saving video message %{public}s", v8, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    uint64_t v13 = sub_100024014();
    v14(v13);
  }

  uint64_t v16 = v0[27];
  uint64_t v15 = v0[28];
  uint64_t v17 = v0[23] + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_messageStore;
  swift_beginAccess();
  sub_100023BE0(v17, v15, (void (*)(void))type metadata accessor for MessageStore);
  uint64_t v18 = *(void *)(v15 + *(int *)(v16 + 28));
  if (*(void *)(v18 + 16) && (unint64_t v19 = sub_100033224(v0[22]), (v20 & 1) != 0))
  {
    uint64_t v21 = v0[28];
    uint64_t v23 = v0[25];
    uint64_t v22 = v0[26];
    uint64_t v25 = v0[23];
    uint64_t v24 = v0[24];
    int64_t v26 = *(void **)(*(void *)(v18 + 56) + 8 * v19);
    v0[33] = v26;
    id v27 = v26;
    sub_100023C34(v21, (void (*)(void))type metadata accessor for MessageStore);
    uint64_t v28 = *(void **)(v25 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_mediaManager);
    v0[34] = v28;
    id v29 = v28;
    id v30 = [v27 videoURL];
    id v31 = [v30 URL];

    sub_10003CD00();
    sub_10003CCD0(v32);
    uint64_t v34 = v33;
    v0[35] = v33;
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    v0[2] = v0;
    v0[7] = v0 + 18;
    v0[3] = sub_100022440;
    uint64_t v35 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_10002276C;
    v0[13] = &unk_1000524A0;
    v0[14] = v35;
    [v29 saveVideoWithURL:v34 completion:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    sub_100023C34(v0[28], (void (*)(void))type metadata accessor for MessageStore);
    sub_100023B2C();
    swift_allocError();
    unsigned char *v36 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_10001D6E4();
    return v37();
  }
}

uint64_t sub_100022440()
{
  sub_10001D6B4();
  sub_10001D69C();
  sub_100023F3C();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 288) = *(void *)(v3 + 48);
  sub_100023F60();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_100022520()
{
  uint64_t v12 = v0;
  uint64_t v1 = *(void **)(v0 + 280);
  uint64_t v3 = *(void *)(v0 + 144);
  unint64_t v2 = *(void *)(v0 + 152);

  swift_bridgeObjectRetain();
  uint64_t v4 = sub_10003CE80();
  os_log_type_t v5 = sub_10003D120();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 264);
    os_log_type_t v7 = (uint8_t *)sub_10001D70C();
    uint64_t v11 = sub_10001D7CC();
    *(_DWORD *)os_log_type_t v7 = 136446210;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 160) = sub_10000CE00(v3, v2, &v11);
    sub_10003D1B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "MessageController saved video message with new asset identifier %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    uint64_t v8 = *(void **)(v0 + 264);
    swift_bridgeObjectRelease_n();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_100023FAC();
  return v9();
}

uint64_t sub_1000226CC()
{
  uint64_t v1 = (void *)v0[35];
  uint64_t v3 = (void *)v0[33];
  unint64_t v2 = (void *)v0[34];
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10001D6E4();
  return v4();
}

uint64_t sub_10002276C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_10002C7E8(v3, v4);
  }
  else
  {
    uint64_t v7 = sub_10003CFC0();
    return sub_10002C870(v3, v7, v6);
  }
}

id sub_1000227E4(void (*a1)(void))
{
  v116 = a1;
  uint64_t v114 = type metadata accessor for MessageRequest();
  sub_10000DA20();
  __chkstk_darwin(v2);
  sub_100023EB4();
  uint64_t v99 = v3;
  sub_100023EF0();
  __chkstk_darwin(v4);
  uint64_t v105 = (uint64_t)&v96 - v5;
  sub_10003CDA0();
  sub_100023E80();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_10001D6C0();
  uint64_t v100 = v9;
  uint64_t v111 = sub_10000CCE8(&qword_100059FC8);
  sub_10000DA20();
  __chkstk_darwin(v10);
  sub_10000D9F4();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_10000CCE8(&qword_100059960);
  uint64_t v15 = sub_10000DA68(v14);
  __chkstk_darwin(v15);
  sub_100023EB4();
  uint64_t v101 = v16;
  sub_100023EF0();
  __chkstk_darwin(v17);
  sub_100024068();
  uint64_t v98 = v18;
  sub_100023EF0();
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v96 - v21;
  __chkstk_darwin(v20);
  uint64_t v110 = (uint64_t)&v96 - v23;
  uint64_t v24 = sub_10000CCE8((uint64_t *)&unk_100059E30);
  uint64_t v25 = sub_10000DA68(v24);
  __chkstk_darwin(v25);
  sub_100023EB4();
  uint64_t v103 = v26;
  sub_100023EF0();
  uint64_t v28 = __chkstk_darwin(v27);
  id v30 = (char *)&v96 - v29;
  __chkstk_darwin(v28);
  sub_100024068();
  uint64_t v104 = v31;
  sub_100023EF0();
  __chkstk_darwin(v32);
  sub_100024068();
  v112 = v33;
  sub_100023EF0();
  __chkstk_darwin(v34);
  uint64_t v36 = (char *)&v96 - v35;
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_10003CEA0();
  uint64_t v38 = sub_10000CD54(v37, (uint64_t)qword_10005B898);
  sub_100023D8C((uint64_t)v116, (uint64_t)v36, (uint64_t *)&unk_100059E30);
  uint64_t v108 = v38;
  uint64_t v39 = sub_10003CE80();
  os_log_type_t v40 = sub_10003D120();
  BOOL v41 = os_log_type_enabled(v39, v40);
  uint64_t v109 = v1;
  v102 = v22;
  if (v41)
  {
    uint64_t v42 = sub_10001D70C();
    v107 = (char *)v7;
    unint64_t v43 = (uint8_t *)v42;
    uint64_t v44 = sub_10001D7CC();
    uint64_t v97 = v13;
    v118[0] = v44;
    v106 = v30;
    *(_DWORD *)unint64_t v43 = 136446210;
    uint64_t v45 = sub_10000C1B8((uint64_t)v36);
    v117[0] = sub_10000CE00(v45, v46, v118);
    id v30 = v106;
    sub_10003D1B0();
    uint64_t v1 = v109;
    swift_bridgeObjectRelease();
    sub_100023DDC((uint64_t)v36, (uint64_t *)&unk_100059E30);
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "MessageController resetting for session %{public}s", v43, 0xCu);
    swift_arrayDestroy();
    uint64_t v13 = v97;
    sub_10000DA3C();
    uint64_t v7 = (uint64_t)v107;
    sub_10000DA3C();
  }
  else
  {
    sub_100023DDC((uint64_t)v36, (uint64_t *)&unk_100059E30);
  }

  unint64_t v47 = &v115[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_currentRequest];
  swift_beginAccess();
  v107 = v47;
  uint64_t v48 = (uint64_t)v47;
  uint64_t v49 = v110;
  sub_100023D8C(v48, v110, &qword_100059960);
  uint64_t v50 = 1;
  int v51 = sub_10000CD2C(v49, 1, v114);
  uint64_t v52 = (uint64_t)v112;
  if (!v51)
  {
    (*(void (**)(uint8_t *, uint64_t, uint64_t))(v7 + 16))(v112, v49, v1);
    uint64_t v50 = 0;
  }
  sub_100023DDC(v49, &qword_100059960);
  sub_10000FA0C(v52, v50, 1, v1);
  uint64_t v53 = v13 + *(int *)(v111 + 48);
  sub_100023D8C((uint64_t)v116, v13, (uint64_t *)&unk_100059E30);
  sub_100023D8C(v52, v53, (uint64_t *)&unk_100059E30);
  sub_100023FBC(v13);
  if (!v55)
  {
    uint64_t v54 = v104;
    sub_100023D8C(v13, v104, (uint64_t *)&unk_100059E30);
    sub_100023FBC(v53);
    if (!v55)
    {
      uint64_t v57 = v100;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v100, v53, v1);
      sub_100023CCC(&qword_100059FD8, (void (*)(uint64_t))&type metadata accessor for UUID);
      LODWORD(v111) = sub_10003CFA0();
      uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
      v58(v57, v1);
      uint64_t v59 = sub_100023F6C();
      sub_100023DDC(v59, v60);
      v58(v54, v1);
      sub_100023DDC(v13, (uint64_t *)&unk_100059E30);
      if (v111) {
        goto LABEL_18;
      }
LABEL_20:
      sub_100023D8C((uint64_t)v116, (uint64_t)v30, (uint64_t *)&unk_100059E30);
      uint64_t v64 = v115;
      uint64_t v65 = sub_10003CE80();
      os_log_type_t v66 = sub_10003D120();
      if (os_log_type_enabled(v65, v66))
      {
        v106 = v30;
        uint64_t v67 = swift_slowAlloc();
        v116 = (void (*)(void))swift_slowAlloc();
        v117[0] = (uint64_t)v116;
        *(_DWORD *)uint64_t v67 = 136315394;
        uint64_t v68 = v101;
        sub_100023D8C((uint64_t)v107, v101, &qword_100059960);
        uint64_t v69 = 1;
        if (!sub_10000CD2C(v68, 1, v114))
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v103, v68, v109);
          uint64_t v69 = 0;
        }
        sub_100023DDC(v68, &qword_100059960);
        uint64_t v70 = v103;
        sub_10000FA0C(v103, v69, 1, v109);
        uint64_t v71 = sub_10000C1B8(v70);
        unint64_t v73 = v72;
        sub_100023DDC(v70, (uint64_t *)&unk_100059E30);
        uint64_t v119 = sub_10000CE00(v71, v73, v117);
        sub_10003D1B0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v67 + 12) = 2080;
        uint64_t v74 = (uint64_t)v106;
        uint64_t v75 = sub_10000C1B8((uint64_t)v106);
        uint64_t v119 = sub_10000CE00(v75, v76, v117);
        sub_10003D1B0();
        swift_bridgeObjectRelease();
        sub_100023DDC(v74, (uint64_t *)&unk_100059E30);
        _os_log_impl((void *)&_mh_execute_header, v65, v66, "Current request UUID %s doesn't match reset request UUID %s", (uint8_t *)v67, 0x16u);
        swift_arrayDestroy();
        sub_10000DA3C();
        sub_10000DA3C();
      }
      else
      {

        sub_100023DDC((uint64_t)v30, (uint64_t *)&unk_100059E30);
      }

      sub_100023B2C();
      uint64_t v77 = swift_allocError();
      *uint64_t v78 = 1;
      uint64_t v113 = v77;
      return (id)swift_willThrow();
    }
    sub_100023DDC(v52, (uint64_t *)&unk_100059E30);
    sub_100023F78();
    v56();
LABEL_16:
    sub_100023DDC(v13, &qword_100059FC8);
    goto LABEL_20;
  }
  sub_100023DDC(v52, (uint64_t *)&unk_100059E30);
  sub_100023FBC(v53);
  if (!v55) {
    goto LABEL_16;
  }
  sub_100023DDC(v13, (uint64_t *)&unk_100059E30);
LABEL_18:
  uint64_t v61 = &v115[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_stateMachine];
  sub_100023EFC();
  sub_10001CFD8((uint64_t)v61, *((void *)v61 + 3));
  sub_100023FF4();
  v62();
  swift_endAccess();
  uint64_t v63 = (uint64_t)v102;
  sub_100023D8C((uint64_t)v107, (uint64_t)v102, &qword_100059960);
  if (sub_10000CD2C(v63, 1, v114) == 1)
  {
    sub_100023DDC(v63, &qword_100059960);
  }
  else
  {
    uint64_t v80 = v63;
    uint64_t v81 = v105;
    sub_10000D7B8(v80, v105);
    uint64_t v82 = v99;
    sub_100023BE0(v81, v99, (void (*)(void))type metadata accessor for MessageRequest);
    v83 = sub_10003CE80();
    os_log_type_t v84 = sub_10003D120();
    if (os_log_type_enabled(v83, v84))
    {
      v85 = (uint8_t *)sub_10001D70C();
      uint64_t v86 = sub_10001D7CC();
      *(_DWORD *)v85 = 136446210;
      v112 = v85 + 4;
      v116 = (void (*)(void))type metadata accessor for MessageRequest;
      v117[0] = v86;
      uint64_t v87 = v98;
      sub_100023BE0(v82, v98, (void (*)(void))type metadata accessor for MessageRequest);
      sub_10000FA0C(v87, 0, 1, v114);
      uint64_t v88 = sub_10000C1D8(v87);
      unint64_t v90 = v89;
      sub_100023DDC(v87, &qword_100059960);
      uint64_t v91 = sub_10000CE00(v88, v90, v117);
      sub_100023EA0(v91);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      sub_100023C34(v82, v116);
      _os_log_impl((void *)&_mh_execute_header, v83, v84, "Rejecting current active request %{public}s", v85, 0xCu);
      swift_arrayDestroy();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
      sub_100023C34(v82, (void (*)(void))type metadata accessor for MessageRequest);
    }

    sub_10000E400((void *)(v105 + *(int *)(v114 + 20)), *(void *)(v105 + *(int *)(v114 + 20) + 24));
    uint64_t v92 = v113;
    sub_100023F78();
    v93();
    uint64_t v113 = v92;
    if (v92) {
      return (id)sub_100023C34(v105, (void (*)(void))type metadata accessor for MessageRequest);
    }
    uint64_t v94 = v98;
    sub_10000FA0C(v98, 1, 1, v114);
    uint64_t v95 = (uint64_t)v107;
    sub_100023EFC();
    sub_100023B78(v94, v95);
    swift_endAccess();
    sub_100023C34(v105, (void (*)(void))type metadata accessor for MessageRequest);
  }
  sub_10000E400(&v115[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_audioManager], *(void *)&v115[OBJC_IVAR____TtC18FTLivePhotoService17MessageController_audioManager + 24]);
  return sub_10001E444();
}

void sub_100023398()
{
}

id sub_1000233D8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessageController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100023500()
{
  return type metadata accessor for MessageController();
}

uint64_t type metadata accessor for MessageController()
{
  uint64_t result = qword_100059F90;
  if (!qword_100059F90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100023550()
{
  sub_100023644();
  if (v0 <= 0x3F)
  {
    type metadata accessor for MessageStore();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100023644()
{
  if (!qword_100059FC0)
  {
    type metadata accessor for MessageRequest();
    unint64_t v0 = sub_10003D190();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100059FC0);
    }
  }
}

uint64_t sub_10002369C(uint64_t a1, uint64_t a2)
{
  return sub_10001E6A4(a1, a2);
}

uint64_t sub_1000236C0(uint64_t a1, uint64_t a2)
{
  return sub_10001E6C4(a1, a2);
}

uint64_t sub_1000236E4(int a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = 4;
    goto LABEL_5;
  }
  if (a1 == 2)
  {
    uint64_t v2 = 2;
LABEL_5:
    uint64_t v3 = v1 + OBJC_IVAR____TtC18FTLivePhotoService17MessageController_moments;
    swift_beginAccess();
    sub_10000CD8C(v3, (uint64_t)v8);
    uint64_t v4 = v9;
    uint64_t v5 = v10;
    sub_10000E400(v8, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 56))(v2, v4, v5);
    return sub_10000D5B8((uint64_t)v8);
  }
  sub_100023B2C();
  swift_allocError();
  *uint64_t v7 = 2;
  return swift_willThrow();
}

uint64_t sub_1000237E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v29 = a4;
  uint64_t v35 = type metadata accessor for MessageRequest();
  uint64_t v32 = *(void *)(v35 - 8);
  uint64_t v7 = __chkstk_darwin(v35);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v28 - v10;
  sub_100023E30(a1, v34);
  uint64_t v33 = v34[0];
  int64_t v12 = v34[3];
  unint64_t v13 = v34[4];
  uint64_t v30 = v34[1];
  int64_t v31 = (unint64_t)(v34[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v13) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    sub_100023BE0(*(void *)(v33 + 56) + *(void *)(v32 + 72) * v16, (uint64_t)v11, (void (*)(void))type metadata accessor for MessageRequest);
    sub_10000D7B8((uint64_t)v11, (uint64_t)v9);
    uint64_t v21 = &v9[*(int *)(v35 + 20)];
    uint64_t v23 = *((void *)v21 + 3);
    uint64_t v22 = *((void *)v21 + 4);
    sub_10000E400(v21, v23);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v23, v22) == a2 && v24 == a3)
    {
      swift_release();
      swift_bridgeObjectRelease();
LABEL_28:
      uint64_t v27 = v29;
      sub_10000D7B8((uint64_t)v9, v29);
      sub_10000FA0C(v27, 0, 1, v35);
      return swift_bridgeObjectRelease();
    }
    char v26 = sub_10003D330();
    swift_bridgeObjectRelease();
    if (v26)
    {
      swift_release();
      goto LABEL_28;
    }
    uint64_t result = sub_100023C34((uint64_t)v9, (void (*)(void))type metadata accessor for MessageRequest);
    if (v13) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v31) {
      goto LABEL_29;
    }
    unint64_t v18 = *(void *)(v30 + 8 * v17);
    int64_t v19 = v12 + 1;
    if (!v18)
    {
      int64_t v19 = v12 + 2;
      if (v12 + 2 >= v31) {
        goto LABEL_29;
      }
      unint64_t v18 = *(void *)(v30 + 8 * v19);
      if (!v18)
      {
        int64_t v19 = v12 + 3;
        if (v12 + 3 >= v31) {
          goto LABEL_29;
        }
        unint64_t v18 = *(void *)(v30 + 8 * v19);
        if (!v18)
        {
          int64_t v19 = v12 + 4;
          if (v12 + 4 >= v31) {
            goto LABEL_29;
          }
          unint64_t v18 = *(void *)(v30 + 8 * v19);
          if (!v18)
          {
            int64_t v19 = v12 + 5;
            if (v12 + 5 >= v31) {
              goto LABEL_29;
            }
            unint64_t v18 = *(void *)(v30 + 8 * v19);
            if (!v18)
            {
              int64_t v20 = v12 + 6;
              while (v20 < v31)
              {
                unint64_t v18 = *(void *)(v30 + 8 * v20++);
                if (v18)
                {
                  int64_t v19 = v20 - 1;
                  goto LABEL_18;
                }
              }
LABEL_29:
              swift_release();
              sub_10000FA0C(v29, 1, 1, v35);
              return swift_bridgeObjectRelease();
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v13 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v19 << 6);
    int64_t v12 = v19;
  }
  __break(1u);
  return result;
}

unint64_t sub_100023B2C()
{
  unint64_t result = qword_100059FD0;
  if (!qword_100059FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059FD0);
  }
  return result;
}

uint64_t sub_100023B78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CCE8(&qword_100059960);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100023BE0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_10000DA20();
  uint64_t v4 = sub_100024000();
  v5(v4);
  return a2;
}

uint64_t sub_100023C34(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_10000DA20();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_100023C8C()
{
  unint64_t result = qword_100059FE8;
  if (!qword_100059FE8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100059FE8);
  }
  return result;
}

uint64_t sub_100023CCC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100023D14()
{
  return swift_release();
}

uint64_t sub_100023D1C(void *a1)
{
  id v2 = [a1 IDSFormattedDestinationID];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_10003CFC0();

  return v3;
}

uint64_t sub_100023D8C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000CCE8(a3);
  sub_10000DA20();
  uint64_t v4 = sub_100024000();
  v5(v4);
  return a2;
}

uint64_t sub_100023DDC(uint64_t a1, uint64_t *a2)
{
  sub_10000CCE8(a2);
  sub_10000DA20();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_100023E30@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_100023E68(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100023EA0(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t sub_100023EC8()
{
  return v0;
}

uint64_t sub_100023EFC()
{
  return swift_beginAccess();
}

uint64_t sub_100023F14(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

BOOL sub_100023F20(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100023F48()
{
  return v0;
}

uint64_t sub_100023F6C()
{
  return v0;
}

uint64_t sub_100023F84()
{
  return swift_task_alloc();
}

uint64_t sub_100023FAC()
{
  return v0 + 8;
}

uint64_t sub_100023FBC(uint64_t a1)
{
  return sub_10000CD2C(a1, 1, v1);
}

uint64_t sub_100023FDC()
{
  return swift_slowAlloc();
}

uint64_t sub_100024000()
{
  return v0;
}

uint64_t sub_100024014()
{
  return v0;
}

uint64_t sub_100024028()
{
  return swift_task_dealloc();
}

void sub_100024048(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 2u);
}

uint64_t sub_10002409C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___MockMomentsServerBag_isLoaded);
}

uint64_t sub_1000240D4(uint64_t result)
{
  *(unsigned char *)(v1 + OBJC_IVAR___MockMomentsServerBag_isLoaded) = result;
  return result;
}

uint64_t sub_10002410C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___MockMomentsServerBag_isMomentsDisabled);
}

uint64_t sub_100024144(uint64_t result)
{
  *(unsigned char *)(v1 + OBJC_IVAR___MockMomentsServerBag_isMomentsDisabled) = result;
  return result;
}

double sub_100024178()
{
  return *(double *)(v0 + OBJC_IVAR___MockMomentsServerBag_momentsRequestTimeout);
}

void sub_1000241AC(double a1)
{
  *(double *)(v1 + OBJC_IVAR___MockMomentsServerBag_momentsRequestTimeout) = a1;
}

id sub_1000241BC()
{
  v0[OBJC_IVAR___MockMomentsServerBag_isLoaded] = 1;
  v0[OBJC_IVAR___MockMomentsServerBag_isMomentsDisabled] = 0;
  *(void *)&v0[OBJC_IVAR___MockMomentsServerBag_momentsRequestTimeout] = 0x3FF0000000000000;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MockMomentsServerBag();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100024240()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MockMomentsServerBag();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MockMomentsServerBag()
{
  return self;
}

uint64_t sub_100024298(uint64_t a1, uint64_t a2)
{
  id v4 = sub_1000245A0(a1);
  uint64_t v5 = sub_10003CD40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t v6 = swift_allocObject();

  return sub_100026C5C((uint64_t)v4, a2, v6);
}

id sub_100024330()
{
  return sub_100024354();
}

id sub_100024354()
{
  id v1 = [v0 error];

  return v1;
}

uint64_t sub_10002438C()
{
  return sub_1000243B0();
}

uint64_t sub_1000243B0()
{
  id v1 = [v0 inputs];
  sub_10000D988(0, (unint64_t *)&unk_10005A100);
  uint64_t v2 = sub_10003D040();

  return v2;
}

id sub_100024418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002443C(a1, a2, a3);
}

id sub_10002443C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  return [v3 startSessionAtSourceTime:v5];
}

unint64_t sub_100024480()
{
  return (unint64_t)sub_1000244A8() & 1;
}

id sub_1000244A8()
{
  return [v0 startWriting];
}

uint64_t sub_1000244CC(uint64_t a1, uint64_t a2)
{
  return sub_1000244F0(a1, a2);
}

uint64_t sub_1000244F0(uint64_t a1, uint64_t a2)
{
  void v5[4] = a1;
  v5[5] = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_1000147FC;
  void v5[3] = &unk_100052510;
  uint64_t v3 = _Block_copy(v5);
  swift_retain();
  [v2 finishWritingWithCompletionHandler:v3];
  _Block_release(v3);
  return swift_release();
}

id sub_1000245A0(uint64_t a1)
{
  uint64_t v3 = sub_10003CD40();
  sub_100026CF8();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_10000FB6C();
  sub_10000D988(0, &qword_10005A0F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, a1, v3);
  id v7 = sub_1000262EC(v1, AVFileTypeQuickTimeMovie);
  CMFormatDescriptionRef formatDescriptionOut = 0;
  CMFormatDescriptionCreate(kCFAllocatorDefault, 0x74657874u, 0x77767474u, 0, &formatDescriptionOut);
  CMFormatDescriptionRef v8 = formatDescriptionOut;
  objc_allocWithZone((Class)AVAssetWriterInput);
  uint64_t v9 = AVMediaTypeText;
  uint64_t v10 = v8;
  id v11 = sub_100026500(v9, 0, v8);
  [v11 setExpectsMediaDataInRealTime:1];
  CMTimeMakeWithSeconds(&v13, 10.0, 1000);
  [v7 setMovieFragmentInterval:&v13];
  [v7 addInput:v11];

  return v7;
}

uint64_t sub_1000247AC()
{
  uint64_t v2 = v0;
  sub_100026D10();
  sub_10003CF30();
  sub_100026CF8();
  __chkstk_darwin(v3);
  sub_100026D8C(v4, v22);
  uint64_t v5 = sub_100026E14();
  v6(v5);
  id v7 = v1;
  sub_10003CF50();
  uint64_t v8 = sub_100026DF8();
  v9(v8);
  if (v1)
  {
    if (qword_100059760 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v10 = sub_10003CEA0();
  sub_100026D44(v10, (uint64_t)qword_10005B8B0);
  id v11 = (void *)sub_10003CE80();
  os_log_type_t v12 = sub_10003D0E0();
  if (sub_10001D7E4(v12))
  {
    sub_10001D70C();
    v23[0] = sub_10001D7CC();
    sub_100026F0C(4.8149e-34);
    uint64_t v13 = sub_10003CFF0();
    sub_10000CE00(v13, v14, v23);
    sub_10003D1B0();
    sub_10000FB38();
    swift_bridgeObjectRelease();
    sub_10001D740((void *)&_mh_execute_header, v15, v16, "Start writing for %s");
    sub_100026DDC();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {

    sub_10000FB38();
  }
  sub_10000CD8C(v2 + 16, (uint64_t)v23);
  uint64_t v17 = v24;
  uint64_t v18 = v25;
  sub_10000E400(v23, v24);
  (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
  sub_10000D5B8((uint64_t)v23);
  sub_10000CD8C(v2 + 16, (uint64_t)v23);
  uint64_t v19 = v24;
  uint64_t v20 = v25;
  sub_10000E400(v23, v24);
  (*(void (**)(CMTimeValue, void, CMTimeEpoch, uint64_t, uint64_t))(v20 + 32))(kCMTimeZero.value, *(void *)&kCMTimeZero.timescale, kCMTimeZero.epoch, v19, v20);
  uint64_t result = sub_10000D5B8((uint64_t)v23);
  *(unsigned char *)(v2 + 64) = 1;
  return result;
}

void sub_100024A10()
{
  uint64_t v2 = sub_10003CF30();
  sub_100026CF8();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_1000146A0();
  uint64_t v6 = *(void **)(v0 + 72);
  void *v1 = v6;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v1, enum case for DispatchPredicate.onQueue(_:), v2);
  id v7 = v6;
  LOBYTE(v6) = sub_10003CF50();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v1, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
LABEL_11:
    swift_once();
    goto LABEL_5;
  }
  swift_beginAccess();
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_100024C74(v8);
  swift_endAccess();
  if (!*(void *)(*(void *)(v0 + 56) + 16)) {
    return;
  }
  if ((*(unsigned char *)(v0 + 65) & 1) == 0)
  {
    sub_100024D54();
    return;
  }
  if (qword_100059760 != -1) {
    goto LABEL_11;
  }
LABEL_5:
  uint64_t v9 = sub_10003CEA0();
  sub_100026D44(v9, (uint64_t)qword_10005B8B0);
  uint64_t v10 = (void *)sub_10003CE80();
  os_log_type_t v11 = sub_10003D120();
  if (sub_10001D7E4(v11))
  {
    sub_10001D70C();
    v16[0] = sub_10001D7CC();
    sub_100026F0C(4.8149e-34);
    uint64_t v12 = sub_10003CFF0();
    sub_10000CE00(v12, v13, v16);
    sub_10003D1B0();
    sub_10000FB38();
    swift_bridgeObjectRelease();
    sub_10001D740((void *)&_mh_execute_header, v14, v15, "Ignoring captions update we already stopped writing %s");
    sub_100026DDC();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {

    sub_10000FB38();
  }
}

uint64_t sub_100024C74(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    uint64_t result = (uint64_t)sub_1000265A8((char *)result, v7, 1, v3);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = sub_100026B70(v6 + 32, v2, v3 + 40 * v8 + 32);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v9 = *(void *)(v3 + 16);
  BOOL v10 = __OFADD__(v9, v2);
  uint64_t v11 = v9 + v2;
  if (!v10)
  {
    *(void *)(v3 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

void sub_100024D54()
{
  CMTimeValue v4 = v0;
  sub_100026D10();
  uint64_t v113 = v5;
  unint64_t v6 = sub_10003CF30();
  sub_100026CF8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_10000FB6C();
  BOOL v10 = *(void **)(v4 + 72);
  void *v1 = v10;
  (*(void (**)(void *, void, unint64_t))(v8 + 104))(v1, enum case for DispatchPredicate.onQueue(_:), v6);
  id v11 = v10;
  LOBYTE(v10) = sub_10003CF50();
  (*(void (**)(void *, unint64_t))(v8 + 8))(v1, v6);
  if (v10)
  {
    if ((*(unsigned char *)(v4 + 64) & 1) == 0) {
      sub_1000247AC();
    }
    uint64_t v3 = (void *)(v4 + 16);
    uint64_t v12 = *(void *)(v4 + 40);
    uint64_t v13 = *(void *)(v4 + 48);
    sub_10000E400((void *)(v4 + 16), v12);
    sub_100026CF8();
    uint64_t v15 = v14;
    __chkstk_darwin(v16);
    sub_1000146A0();
    (*(void (**)(uint64_t))(v15 + 16))(v2);
    unint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 16))(v12, v13);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v2, v12);
    if (!(v6 >> 62))
    {
      if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_6;
      }
LABEL_61:
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  swift_bridgeObjectRetain();
  uint64_t v95 = sub_10003D2E0();
  swift_bridgeObjectRelease();
  if (!v95) {
    goto LABEL_61;
  }
LABEL_6:
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v17 = (id)sub_10003D290();
  }
  else
  {
    if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_64;
    }
    id v17 = *(id *)(v6 + 32);
  }
  id v106 = v17;
  swift_bridgeObjectRelease();
  if (qword_100059760 != -1) {
LABEL_64:
  }
    swift_once();
  uint64_t v18 = sub_10003CEA0();
  uint64_t v19 = sub_10000CD54(v18, (uint64_t)qword_10005B8B0);
  sub_100026EDC();
  uint64_t v20 = sub_10003CE80();
  os_log_type_t v21 = sub_10003D0F0();
  uint64_t v109 = v19;
  uint64_t v99 = v3;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)sub_10001D70C();
    v129[0] = sub_10001D7CC();
    sub_100026EAC(4.8149e-34);
    uint64_t v23 = sub_100026F2C();
    v128.CMTimeValue value = sub_10000CE00(v23, v24, v129);
    sub_10003D1B0();
    sub_100026D74();
    sub_100026ED0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Draining captions queue... %s", v22, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {

    sub_100026D74();
  }
  if (![v106 isReadyForMoreMediaData])
  {
    sub_100026EDC();
    unint64_t v90 = sub_10003CE80();
    os_log_type_t v91 = sub_10003D100();
    if (os_log_type_enabled(v90, v91))
    {
      uint64_t v92 = (uint8_t *)sub_10001D70C();
      v129[0] = sub_10001D7CC();
      sub_100026EAC(4.8149e-34);
      uint64_t v93 = sub_100026F2C();
      v128.CMTimeValue value = sub_10000CE00(v93, v94, v129);
      sub_10003D1B0();
      sub_100026D74();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v90, v91, "Writer input not ready for input data for %s", v92, 0xCu);
      swift_arrayDestroy();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {

      sub_100026D74();
    }
    goto LABEL_58;
  }
  uint64_t v25 = (void *)(v4 + 56);
  swift_beginAccess();
  uint64_t v26 = *(void *)(v4 + 56);
  uint64_t v27 = *(void *)(v26 + 16);
  if (!v27) {
    goto LABEL_52;
  }
  uint64_t v97 = (void *)(v4 + 56);
  id v112 = self;
  p_CMTimeScale timescale = &v128.timescale;
  CFAllocatorRef v111 = kCFAllocatorDefault;
  swift_bridgeObjectRetain();
  uint64_t v96 = v26;
  uint64_t v28 = (_DWORD *)(v26 + 64);
  *(void *)&long long v29 = 136316162;
  long long v102 = v29;
  uint64_t v101 = (char *)&type metadata for Any + 8;
  *(void *)&long long v29 = 138412290;
  long long v98 = v29;
  *(void *)&long long v29 = 67109378;
  long long v103 = v29;
  *(void *)&long long v29 = 136315906;
  long long v100 = v29;
  CMTimeValue v107 = v4;
  do
  {
    CMTimeValue v30 = *((void *)v28 - 4);
    uint64_t v31 = *((void *)v28 - 3);
    int v32 = *v28;
    Float64 v34 = *((double *)v28 - 2);
    Float64 v33 = *((double *)v28 - 1);
    swift_bridgeObjectRetain();
    CMTimeMakeWithSeconds(&v128, v34, 1000);
    CMTimeValue value = v128.value;
    CMTimeScale timescale = v128.timescale;
    LODWORD(v122) = v128.flags;
    epoch = (void *)v128.epoch;
    CMTimeMakeWithSeconds(&v128, v33, 1000);
    CMTimeValue v120 = v128.value;
    CMTimeFlags flags = v128.flags;
    CMTimeScale v119 = v128.timescale;
    CMTimeEpoch v117 = v128.epoch;
    if (TUCaptionsLoggingEnabled())
    {
      CMTimeValue v116 = value;
      swift_bridgeObjectRetain_n();
      sub_100026EDC();
      uint64_t v37 = sub_10003CE80();
      LODWORD(v108) = sub_10003D0E0();
      if (os_log_type_enabled(v37, (os_log_type_t)v108))
      {
        int v114 = v32;
        CMTimeScale v115 = timescale;
        CMTimeValue v110 = v30;
        uint64_t v38 = swift_slowAlloc();
        uint64_t v39 = (void *)swift_slowAlloc();
        uint64_t v104 = swift_slowAlloc();
        uint64_t v123 = v104;
        *(_DWORD *)uint64_t v38 = v102;
        v128.CMTimeValue value = v4;
        swift_retain();
        uint64_t v40 = sub_100026F2C();
        v128.CMTimeValue value = sub_100026E54(v40, v41);
        sub_10003D1B0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 2112;
        v128.CMTimeValue value = v120;
        v128.CMTimeScale timescale = v119;
        v128.CMTimeFlags flags = flags;
        CFStringRef v42 = sub_100026D24(v117);
        CFStringRef v43 = v42;
        if (v42) {
          v128.CMTimeValue value = (CMTimeValue)v42;
        }
        else {
          v128.CMTimeValue value = 0;
        }
        sub_100026DC0();
        void *v39 = v43;
        *(_WORD *)(v38 + 22) = 2080;
        LODWORD(v128.value) = v114;
        uint64_t v52 = sub_10003CFF0();
        v128.CMTimeValue value = sub_100026E54(v52, v53);
        sub_100026DC0();
        sub_100026EF4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 32) = 2112;
        v128.CMTimeValue value = v116;
        v128.CMTimeScale timescale = v115;
        v128.CMTimeFlags flags = v122;
        CFStringRef v54 = sub_100026D24((uint64_t)epoch);
        CFStringRef v55 = v54;
        CMTimeValue v56 = v110;
        if (v54) {
          v128.CMTimeValue value = (CMTimeValue)v54;
        }
        else {
          v128.CMTimeValue value = 0;
        }
        sub_100026DC0();
        v39[1] = v55;
        *(_WORD *)(v38 + 42) = 2080;
        v128.CMTimeValue value = v56;
        *(void *)&v128.CMTimeScale timescale = v31;
        swift_bridgeObjectRetain();
        uint64_t v61 = sub_10003CFF0();
        v128.CMTimeValue value = sub_100026E54(v61, v62);
        sub_100026DC0();
        sub_100026EF4();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v37, (os_log_type_t)v108, "%s writing caption with timestamp %@ number: %s duration %@ text: \"%s\"", (uint8_t *)v38, 0x34u);
        sub_10000CCE8(&qword_100059AC8);
        swift_arrayDestroy();
        sub_10000DA3C();
        swift_arrayDestroy();
        sub_10000DA3C();
        sub_10000DA3C();

        CMTimeValue v4 = v107;
        sub_100026ED0();
        CMTimeValue value = v116;
LABEL_35:
        CMTimeScale timescale = v115;
        goto LABEL_36;
      }

      swift_bridgeObjectRelease_n();
      sub_100026D74();
      CMTimeValue value = v116;
    }
    else
    {
      int v114 = v32;
      sub_100026EDC();
      swift_bridgeObjectRetain_n();
      uint64_t v44 = sub_10003CE80();
      os_log_type_t v45 = sub_10003D0E0();
      if (os_log_type_enabled(v44, v45))
      {
        CMTimeScale v115 = timescale;
        CMTimeValue v116 = value;
        CMTimeValue v110 = v30;
        uint64_t v108 = v27;
        uint64_t v46 = swift_slowAlloc();
        unint64_t v47 = (void *)swift_slowAlloc();
        uint64_t v104 = swift_slowAlloc();
        uint64_t v123 = v104;
        *(_DWORD *)uint64_t v46 = v100;
        v128.CMTimeValue value = v4;
        swift_retain();
        uint64_t v48 = sub_100026F2C();
        v128.CMTimeValue value = sub_100026E54(v48, v49);
        sub_10003D1B0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v46 + 12) = 2112;
        v128.CMTimeValue value = v120;
        v128.CMTimeScale timescale = v119;
        v128.CMTimeFlags flags = flags;
        CFStringRef v50 = sub_100026D24(v117);
        CFStringRef v51 = v50;
        if (v50) {
          v128.CMTimeValue value = (CMTimeValue)v50;
        }
        else {
          v128.CMTimeValue value = 0;
        }
        sub_100026E90();
        CMTimeValue value = v116;
        *unint64_t v47 = v51;
        *(_WORD *)(v46 + 22) = 2080;
        LODWORD(v128.value) = v114;
        uint64_t v57 = sub_10003CFF0();
        v128.CMTimeValue value = sub_100026E54(v57, v58);
        sub_100026E90();
        sub_100026EF4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v46 + 32) = 2112;
        v128.CMTimeValue value = value;
        v128.CMTimeScale timescale = v115;
        v128.CMTimeFlags flags = v122;
        CFStringRef v59 = sub_100026D24((uint64_t)epoch);
        CFStringRef v60 = v59;
        if (v59) {
          v128.CMTimeValue value = (CMTimeValue)v59;
        }
        else {
          v128.CMTimeValue value = 0;
        }
        sub_100026E90();
        v47[1] = v60;
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "%s writing caption with timestamp %@ number: %s duration %@", (uint8_t *)v46, 0x2Au);
        sub_10000CCE8(&qword_100059AC8);
        swift_arrayDestroy();
        sub_10000DA3C();
        swift_arrayDestroy();
        sub_10000DA3C();
        sub_10000DA3C();

        CMTimeValue v4 = v107;
        sub_100026ED0();
        uint64_t v27 = v108;
        goto LABEL_35;
      }

      sub_100026EF4();
      sub_100026D74();
      sub_100026ED0();
    }
LABEL_36:
    v127 = 0;
    NSString v63 = sub_10003CFB0();
    swift_bridgeObjectRelease();
    v128.CMTimeValue value = v120;
    v128.CMTimeScale timescale = v119;
    v128.CMTimeFlags flags = flags;
    v128.epoch = v117;
    uint64_t v123 = value;
    CMTimeScale v124 = timescale;
    int v125 = (int)v122;
    uint64_t v126 = (uint64_t)epoch;
    unsigned int v64 = objc_msgSend(v112, "createWebVTTTextSampleBuffer:startTime:duration:sampleBufferOut:", v63, &v128, &v123, &v127, v96);

    if (v64 || (uint64_t v70 = v127) == 0)
    {
      sub_100026EDC();
      uint64_t v65 = sub_10003CE80();
      os_log_type_t v66 = sub_10003D100();
      if (os_log_type_enabled(v65, v66))
      {
        uint64_t v67 = swift_slowAlloc();
        v128.CMTimeValue value = sub_10001D7CC();
        *(_DWORD *)uint64_t v67 = v103;
        *(_DWORD *)(v67 + 4) = v64;
        *(_WORD *)(v67 + 8) = 2080;
        uint64_t v123 = v4;
        swift_retain();
        uint64_t v68 = sub_10003CFF0();
        *(void *)(v67 + 10) = sub_10000CE00(v68, v69, &v128.value);
        sub_100026D74();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v65, v66, "Error while creating sample buffer %d for %s", (uint8_t *)v67, 0x12u);
        swift_arrayDestroy();
        sub_10000DA3C();
        sub_10000DA3C();
      }
      else
      {

        sub_100026D74();
      }
    }
    else
    {
      uint64_t v71 = sub_10003CE80();
      os_log_type_t v72 = sub_10003D0E0();
      if (os_log_type_enabled(v71, v72))
      {
        unint64_t v73 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v73 = 0;
        _os_log_impl((void *)&_mh_execute_header, v71, v72, "Adding text buffer", v73, 2u);
        sub_10000DA3C();
      }

      unsigned __int8 v74 = [v106 appendSampleBuffer:v70];
      if ((v74 & 1) == 0)
      {
        swift_retain();
        uint64_t v75 = sub_10003CE80();
        os_log_type_t v76 = sub_10003D100();
        if (os_log_type_enabled(v75, v76))
        {
          uint64_t v77 = sub_10001D70C();
          v122 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v77 = v98;
          uint64_t v78 = *(void *)(v4 + 40);
          uint64_t v79 = *(void *)(v4 + 48);
          sub_10000E400(v99, v78);
          epoch = &v96;
          sub_100026CF8();
          uint64_t v81 = v80;
          __chkstk_darwin(v82);
          os_log_type_t v84 = (char *)&v96 - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(char *))(v81 + 16))(v84);
          uint64_t v85 = (*(uint64_t (**)(uint64_t, uint64_t))(v79 + 8))(v78, v79);
          (*(void (**)(char *, uint64_t))(v81 + 8))(v84, v78);
          if (v85) {
            uint64_t v86 = _swift_stdlib_bridgeErrorToNSError();
          }
          else {
            uint64_t v86 = 0;
          }
          *(void *)(v77 + 4) = v86;
          void *v122 = v86;
          CMTimeValue v4 = v107;
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v75, v76, "Error while adding sample buffer %@", (uint8_t *)v77, 0xCu);
          sub_10000CCE8(&qword_100059AC8);
          swift_arrayDestroy();
          sub_10000DA3C();
          sub_10000DA3C();

          sub_100026ED0();
        }
        else
        {

          swift_release();
        }
      }
    }
    v28 += 10;
    --v27;
  }
  while (v27);
  swift_bridgeObjectRelease();
  uint64_t v25 = v97;
LABEL_52:
  void *v25 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  uint64_t v87 = sub_10003CE80();
  os_log_type_t v88 = sub_10003D0F0();
  if (os_log_type_enabled(v87, v88))
  {
    unint64_t v89 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v89 = 0;
    _os_log_impl((void *)&_mh_execute_header, v87, v88, "Clearing captions queue...", v89, 2u);
    sub_10000DA3C();
  }

LABEL_58:
}

void sub_100025C90()
{
  uint64_t v2 = (void *)v0;
  sub_100026D10();
  sub_10003CF30();
  sub_100026CF8();
  __chkstk_darwin(v3);
  sub_100026D8C(v4, v40[0]);
  uint64_t v5 = sub_100026E14();
  v6(v5);
  id v7 = v1;
  sub_10003CF50();
  uint64_t v8 = sub_100026DF8();
  v9(v8);
  if ((v1 & 1) == 0)
  {
    __break(1u);
LABEL_19:
    swift_once();
    goto LABEL_4;
  }
  sub_100024D54();
  if (*(unsigned char *)(v0 + 64) != 1)
  {
    if (qword_100059760 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_10003CEA0();
    sub_100026D44(v18, (uint64_t)qword_10005B8B0);
    uint64_t v19 = (void *)sub_10003CE80();
    os_log_type_t v20 = sub_10003D120();
    if (sub_10001D7E4(v20))
    {
      sub_10001D70C();
      v40[0] = sub_10001D7CC();
      sub_100026E30(4.8149e-34);
      uint64_t v21 = sub_10003CFF0();
      uint64_t v23 = sub_10000CE00(v21, v22, v40);
      sub_100026E6C(v23);
      sub_10000FB38();
      swift_bridgeObjectRelease();
      sub_10001D740((void *)&_mh_execute_header, v24, v25, "Skipping to call stop on asset writer since, it was never started %s");
      sub_100026DDC();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {

      sub_10000FB38();
    }
    return;
  }
  *(unsigned char *)(v0 + 65) = 1;
  if (qword_100059760 != -1) {
    goto LABEL_19;
  }
LABEL_4:
  uint64_t v10 = sub_10003CEA0();
  sub_100026D44(v10, (uint64_t)qword_10005B8B0);
  id v11 = (void *)sub_10003CE80();
  os_log_type_t v12 = sub_10003D120();
  if (sub_10001D7E4(v12))
  {
    sub_10001D70C();
    v40[0] = sub_10001D7CC();
    sub_100026E30(4.8149e-34);
    uint64_t v13 = sub_10003CFF0();
    uint64_t v15 = sub_10000CE00(v13, v14, v40);
    sub_100026E6C(v15);
    sub_10000FB38();
    swift_bridgeObjectRelease();
    sub_10001D740((void *)&_mh_execute_header, v16, v17, "Marking input as finished %s");
    sub_100026DDC();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {

    sub_10000FB38();
  }
  uint64_t v26 = v2[5];
  uint64_t v27 = v2[6];
  sub_10000E400(v2 + 2, v26);
  sub_100026CF8();
  uint64_t v29 = v28;
  __chkstk_darwin(v30);
  int v32 = (char *)v40 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v29 + 16))(v32);
  unint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 16))(v26, v27);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v32, v26);
  if (v33 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_10003D2E0();
    swift_bridgeObjectRelease();
    if (v36) {
      goto LABEL_13;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  if (!*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_21;
  }
LABEL_13:
  if ((v33 & 0xC000000000000001) != 0)
  {
    id v34 = (id)sub_10003D290();
    goto LABEL_16;
  }
  if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v34 = *(id *)(v33 + 32);
LABEL_16:
    uint64_t v35 = v34;
    swift_bridgeObjectRelease();
    [v35 markAsFinished];

LABEL_22:
    sub_10000CD8C((uint64_t)(v2 + 2), (uint64_t)v40);
    uint64_t v37 = v41;
    uint64_t v38 = v42;
    sub_10000E400(v40, v41);
    uint64_t v39 = *(void (**)(void (*)(), void *, uint64_t, uint64_t))(v38 + 48);
    swift_retain();
    v39(sub_100026C54, v2, v37, v38);
    swift_release();
    sub_10000D5B8((uint64_t)v40);
    return;
  }
  __break(1u);
}

void sub_100026108()
{
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10003CEA0();
  sub_10000CD54(v0, (uint64_t)qword_10005B8B0);
  swift_retain_n();
  uint64_t v1 = sub_10003CE80();
  os_log_type_t v2 = sub_10003D120();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_retain();
    uint64_t v4 = sub_10003CFF0();
    sub_10000CE00(v4, v5, &v6);
    sub_10003D1B0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Finished writing %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
}

id sub_1000262EC(uint64_t a1, void *a2)
{
  sub_10003CCD0(__stack_chk_guard);
  unint64_t v5 = v4;
  id v11 = 0;
  id v6 = [(id)swift_getObjCClassFromMetadata() assetWriterWithURL:v4 fileType:a2 error:&v11];

  if (v6)
  {
    id v7 = v11;
  }
  else
  {
    id v8 = v11;
    sub_10003CC90();

    swift_willThrow();
  }

  uint64_t v9 = sub_10003CD40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  return v6;
}

uint64_t sub_10002640C()
{
  sub_10000D5B8(v0 + 16);
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_10002643C()
{
  sub_10002640C();

  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for WebVTTCaptionsWriter()
{
  return self;
}

uint64_t sub_100026494()
{
  return sub_1000247AC();
}

void sub_1000264B8()
{
}

void sub_1000264DC()
{
}

id sub_100026500(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    v7.super.Class isa = sub_10003CF60().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.Class isa = 0;
  }
  id v8 = [v4 initWithMediaType:a1 outputSettings:v7.super.isa sourceFormatHint:a3];

  return v8;
}

char *sub_1000265A8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000CCE8(&qword_100059D68);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  os_log_type_t v12 = v10 + 32;
  if (v5)
  {
    sub_100026A10((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100026790(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_1000266A0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000CCE8(&qword_100059AD0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  os_log_type_t v12 = v10 + 32;
  if (v5)
  {
    sub_100026988((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100026890(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_100026790(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_10003D300();
  __break(1u);
  return result;
}

uint64_t sub_100026890(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_10003D300();
  __break(1u);
  return result;
}

char *sub_100026988(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_100026DAC();
    __src = (char *)sub_10003D300();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_100026A10(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_10003D300();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

uint64_t sub_100026AA8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    sub_100026DAC();
    uint64_t result = sub_10003D300();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_100026B70(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 40 * a2 > a1 ? (BOOL v3 = a1 + 40 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_10003D300();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

void sub_100026C54()
{
}

uint64_t sub_100026C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = sub_10000D988(0, &qword_10005A0F8);
  uint64_t v9 = &off_1000524B8;
  *(void *)&long long v7 = a1;
  *(void *)(a3 + 56) = _swiftEmptyArrayStorage;
  *(_WORD *)(a3 + 64) = 0;
  *(void *)(a3 + 72) = a2;
  sub_10000D668(&v7, a3 + 16);
  return a3;
}

uint64_t sub_100026CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100026CF0()
{
  return swift_release();
}

CFStringRef sub_100026D24@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 144) = a1;
  CFAllocatorRef v3 = *(const __CFAllocator **)(v1 - 272);
  return CMTimeCopyDescription(v3, (CMTime *)(v1 - 160));
}

uint64_t sub_100026D44(uint64_t a1, uint64_t a2)
{
  sub_10000CD54(a1, a2);
  return swift_retain_n();
}

uint64_t sub_100026D74()
{
  return swift_release_n();
}

void sub_100026D8C(uint64_t a1@<X8>, uint64_t a2)
{
  *(uint64_t *)((char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0)) = *(void *)(v2 + 72);
}

uint64_t sub_100026DC0()
{
  return sub_10003D1B0();
}

uint64_t sub_100026DDC()
{
  return swift_arrayDestroy();
}

uint64_t sub_100026DF8()
{
  return v0;
}

uint64_t sub_100026E14()
{
  return v0;
}

uint64_t sub_100026E30(float a1)
{
  float *v2 = a1;
  *(void *)(v3 - 88) = v1;
  return swift_retain();
}

uint64_t sub_100026E54(uint64_t a1, unint64_t a2)
{
  return sub_10000CE00(a1, a2, (uint64_t *)(v2 - 192));
}

uint64_t sub_100026E6C(uint64_t a1)
{
  *(void *)(v1 - 88) = a1;
  return sub_10003D1B0();
}

uint64_t sub_100026E90()
{
  return sub_10003D1B0();
}

uint64_t sub_100026EAC(float a1)
{
  float *v1 = a1;
  *(void *)(v3 - 160) = v2;
  return swift_retain();
}

uint64_t sub_100026EDC()
{
  return swift_retain_n();
}

uint64_t sub_100026EF4()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_100026F0C(float a1)
{
  float *v1 = a1;
  return swift_retain();
}

uint64_t sub_100026F2C()
{
  return sub_10003CFF0();
}

id sub_100026F44(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone((Class)IDSService);
  swift_bridgeObjectRetain();
  id result = sub_10002A810(a1, a2);
  if (result)
  {
    long long v7 = *(uint64_t (**)(void))(v2 + 216);
    return (id)v7();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100026FC8()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_100026FD8(uint64_t a1)
{
  return sub_10002AE70(a1);
}

uint64_t sub_100026FE4(uint64_t a1)
{
  return sub_10002AE70(a1);
}

uint64_t sub_100026FF0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_name);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10002702C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_name);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

id sub_100027048()
{
  return *(id *)(v0 + OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_queue);
}

uint64_t sub_100027058(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_queue) = a1;
  return _objc_release_x1();
}

id sub_10002706C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, Class isa, uint64_t a6)
{
  uint64_t v10 = *(void **)(v6 + OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_idsService);
  swift_unknownObjectRetain();
  sub_10003CCD0(v11);
  uint64_t v13 = v12;
  sub_1000296C4(a2);
  v14.super.Class isa = sub_10003CF60().super.isa;
  swift_bridgeObjectRelease();
  sub_100029A88(a3);
  v15.super.Class isa = sub_10003D0A0().super.isa;
  swift_bridgeObjectRelease();
  if (isa)
  {
    sub_1000296C4((uint64_t)isa);
    Class isa = sub_10003CF60().super.isa;
    swift_bridgeObjectRelease();
  }
  id v21 = 0;
  unsigned int v16 = [v10 sendResourceAtURL:v13 metadata:v14.super.isa toDestinations:v15.super.isa priority:a4 options:isa identifier:a6 error:&v21];
  swift_unknownObjectRelease();

  if (v16) {
    return v21;
  }
  id v18 = v21;
  sub_10003CC90();

  return (id)swift_willThrow();
}

uint64_t sub_10002724C()
{
  sub_10001D6B4();
  *(void *)(v1 + 128) = v0;
  if (qword_100059748 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10005B878;
  *(void *)(v1 + 136) = qword_10005B878;
  return _swift_task_switch(sub_1000272E4, v2, 0);
}

uint64_t sub_1000272E4()
{
  sub_10002AE64();
  uint64_t v1 = v0[16];
  if (*(void *)(v1 + OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_firewall))
  {
    sub_100023FAC();
    return v2();
  }
  else
  {
    uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_idsService);
    v0[18] = v4;
    id v5 = *(void **)(v1 + OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_queue);
    v0[19] = v5;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_10002744C;
    uint64_t v6 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_10002A030;
    v0[13] = &unk_100052630;
    v0[14] = v6;
    swift_unknownObjectRetain();
    [v4 retrieveFTFirewallWith:v5 completionHandler:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
}

uint64_t sub_10002744C()
{
  sub_10001D6B4();
  sub_10001D69C();
  sub_100023F3C();
  void *v2 = v1;
  void *v2 = *v0;
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v1 + 160) = v4;
  uint64_t v5 = *(void *)(v3 + 136);
  if (v4) {
    uint64_t v6 = sub_1000275B0;
  }
  else {
    uint64_t v6 = sub_100027540;
  }
  return _swift_task_switch(v6, v5, 0);
}

uint64_t sub_100027540()
{
  sub_10002AE64();
  uint64_t v1 = *(void **)(v0 + 152);
  sub_100026FE4(*(void *)(v0 + 120));
  swift_unknownObjectRelease();

  sub_100023FAC();
  return v2();
}

uint64_t sub_1000275B0()
{
  sub_10002AE64();
  uint64_t v1 = *(void **)(v0 + 152);
  swift_willThrow();
  swift_unknownObjectRelease();

  sub_10001D6E4();
  return v2();
}

uint64_t sub_100027624()
{
  sub_10001D6B4();
  v1[25] = v2;
  v1[26] = v0;
  v1[24] = v3;
  if (qword_100059748 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_10005B878;
  v1[27] = qword_10005B878;
  return _swift_task_switch(sub_1000276C0, v4, 0);
}

uint64_t sub_1000276C0()
{
  uint64_t v23 = v0;
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10003CEA0();
  v0[28] = sub_10000CD54(v1, (uint64_t)qword_10005B880);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_10003CE80();
  os_log_type_t v3 = sub_10003D120();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[25];
  if (v4)
  {
    uint64_t v6 = v0[24];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    v0[15] = v6;
    v0[16] = v5;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_10003CFF0();
    v0[23] = sub_10000CE00(v8, v9, &v22);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Asked to donate %s", v7, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  NSString v10 = sub_10003CFB0();
  size_t v11 = (void *)IDSCopyAddressDestinationForDestination();

  if (!v11
    || (sub_10003CFC0(),
        v11,
        sub_10000D988(0, &qword_10005A2D0),
        id v12 = sub_10002A0A8(),
        (v0[29] = v12) == 0))
  {
    sub_10002AC98();
    swift_allocError();
    unsigned char *v18 = 0;
    swift_willThrow();
    goto LABEL_13;
  }
  uint64_t v13 = v12;
  id v14 = [objc_allocWithZone((Class)IDSFirewallEntry) initWithURI:v12];
  v0[30] = v14;
  if (!v14)
  {
    sub_10002AC98();
    swift_allocError();
    *id v21 = 1;
    swift_willThrow();

LABEL_13:
    sub_10001D6E4();
    sub_10002AEAC();
    __asm { BRAA            X1, X16 }
  }
  NSSet v15 = (void *)swift_task_alloc();
  v0[31] = v15;
  *NSSet v15 = v0;
  v15[1] = sub_100027A08;
  sub_10002AEAC();
  return sub_10002724C();
}

uint64_t sub_100027A08()
{
  sub_10002AE64();
  sub_10002AE4C();
  sub_100023F3C();
  void *v4 = v3;
  void *v4 = *v2;
  *(void *)(v3 + 256) = v0;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v1 + 216);
  if (v0) {
    uint64_t v6 = sub_100027E88;
  }
  else {
    uint64_t v6 = sub_100027B08;
  }
  return _swift_task_switch(v6, v5, 0);
}

uint64_t sub_100027B08()
{
  uint64_t v1 = *(void **)(v0[26] + OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_firewall);
  v0[33] = v1;
  if (v1)
  {
    uint64_t v2 = (void *)v0[30];
    sub_10000CCE8(&qword_10005A2D8);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_100042A80;
    *(void *)(v3 + 32) = v2;
    sub_10003D060();
    v0[34] = sub_10000D988(0, &qword_10005A2E0);
    swift_unknownObjectRetain();
    id v4 = v2;
    Class isa = sub_10003D030().super.isa;
    v0[35] = isa;
    swift_bridgeObjectRelease();
    v0[2] = v0;
    v0[3] = sub_100027D1C;
    uint64_t v6 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_10002A11C;
    v0[13] = &unk_100052618;
    v0[14] = v6;
    [v1 donateEntries:isa withCompletion:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    uint64_t v8 = (void *)v0[29];
    uint64_t v7 = (void *)v0[30];
    sub_10002AC98();
    swift_allocError();
    unsigned char *v9 = 2;
    swift_willThrow();

    sub_10001D6E4();
    return v10();
  }
}

uint64_t sub_100027D1C()
{
  sub_10001D6B4();
  sub_10001D69C();
  sub_100023F3C();
  void *v2 = v1;
  void *v2 = *v0;
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v1 + 288) = v4;
  uint64_t v5 = *(void *)(v3 + 216);
  if (v4) {
    uint64_t v6 = sub_10002805C;
  }
  else {
    uint64_t v6 = sub_100027E10;
  }
  return _swift_task_switch(v6, v5, 0);
}

uint64_t sub_100027E10()
{
  sub_10002AE64();
  uint64_t v1 = *(void **)(v0 + 280);
  uint64_t v2 = *(void **)(v0 + 232);

  swift_unknownObjectRelease();
  sub_100023FAC();
  return v3();
}

uint64_t sub_100027E88()
{
  uint64_t v13 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_10003CE80();
  os_log_type_t v2 = sub_10003D100();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[32];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v12 = v5;
    v0[22] = v3;
    swift_errorRetain();
    sub_10000CCE8((uint64_t *)&unk_100059D70);
    uint64_t v6 = sub_10003CFF0();
    v0[17] = sub_10000CE00(v6, v7, &v12);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to retrieve firewall with error %s", v4, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v8 = (void *)v0[29];
  unint64_t v9 = (void *)v0[30];
  swift_willThrow();

  sub_10001D6E4();
  return v10();
}

void sub_10002805C()
{
  uint64_t v1 = v0;
  os_log_type_t v2 = (void *)v0[35];
  uint64_t v3 = (void *)v1[30];
  swift_willThrow();

  id v4 = v3;
  swift_errorRetain();
  id v5 = v4;
  swift_errorRetain();
  uint64_t v6 = sub_10003CE80();
  os_log_type_t v7 = sub_10003D100();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = v1[36];
    unint64_t v9 = (void *)v1[30];
    uint64_t v20 = (void *)v1[29];
    uint64_t v10 = swift_slowAlloc();
    v21[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315394;
    v1[18] = v9;
    id v11 = v9;
    uint64_t v12 = sub_10003CFF0();
    v1[19] = sub_10000CE00(v12, v13, v21);
    sub_10003D1B0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 12) = 2080;
    v1[20] = v8;
    swift_errorRetain();
    sub_10000CCE8((uint64_t *)&unk_100059D70);
    uint64_t v14 = sub_10003CFF0();
    v1[21] = sub_10000CE00(v14, v15, v21);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to donate %s with error %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();

    swift_unknownObjectRelease();
    swift_errorRelease();
  }
  else
  {
    uint64_t v17 = (void *)v1[29];
    uint64_t v16 = (void *)v1[30];

    swift_unknownObjectRelease();
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  sub_10002AEAC();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_1000282EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003D090();
  if (sub_10000CD2C(a1, 1, v6) == 1)
  {
    sub_10002A7B0(a1);
  }
  else
  {
    sub_10003D080();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10003D070();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100028454(uint64_t a1)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = v1;
  return _swift_task_switch(sub_100028474, 0, 0);
}

uint64_t sub_100028474()
{
  sub_10002AE64();
  uint64_t v2 = v0[16];
  uint64_t v1 = (void *)v0[17];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100028570;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1000286D4;
  v0[13] = &unk_100052600;
  v0[14] = v3;
  [v1 retrieveFirewallWithQueue:v2 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100028570()
{
  sub_10001D6B4();
  sub_10001D69C();
  sub_100023F3C();
  void *v2 = v1;
  void *v2 = *v0;
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v1 + 144) = v4;
  if (v4) {
    uint64_t v5 = sub_100028670;
  }
  else {
    uint64_t v5 = sub_100028654;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100028654()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 120));
}

uint64_t sub_100028670()
{
  sub_10002AE64();
  swift_willThrow();
  sub_10001D6E4();
  return v0();
}

uint64_t sub_1000286D4(uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_10002C7E8(v3, v4);
  }
  else if (a2)
  {
    id v5 = a2;
    return sub_10002C890(v3, v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100028764(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100028828;
  return sub_100028454((uint64_t)v6);
}

uint64_t sub_100028828(uint64_t a1)
{
  uint64_t v4 = v1;
  sub_10002AE4C();
  id v6 = (void *)v2[3];
  uint64_t v7 = (void *)v2[2];
  uint64_t v8 = *v3;
  sub_100023F3C();
  void *v9 = v8;
  swift_task_dealloc();

  uint64_t v10 = (void (**)(void, void, void))v2[4];
  if (v4)
  {
    id v11 = (void *)sub_10003CC80();
    swift_errorRelease();
    uint64_t v12 = sub_10002AED4();
    v13(v12);

    _Block_release(v10);
  }
  else
  {
    v10[2](v10, a1, 0);
    _Block_release(v10);
    swift_unknownObjectRelease();
  }
  uint64_t v14 = *(uint64_t (**)(void))(v8 + 8);
  return v14();
}

uint64_t sub_1000289B0()
{
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for FirewallActor.ActorType()
{
  return self;
}

uint64_t sub_100028A04()
{
  return v0;
}

uint64_t sub_100028A10()
{
  return sub_100028A04();
}

uint64_t sub_100028A2C()
{
  type metadata accessor for FirewallActor.ActorType();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  qword_10005B878 = v0;
  return result;
}

uint64_t *sub_100028A68()
{
  if (qword_100059748 != -1) {
    swift_once();
  }
  return &qword_10005B878;
}

uint64_t sub_100028B30()
{
  swift_getObjectType();
  v2._uint64_t countAndFlagsBits = sub_10003D3D0();
  v3._uint64_t countAndFlagsBits = 40;
  v3._object = (void *)0xE100000000000000;
  sub_10003D010(v3);
  uint64_t countAndFlagsBits = v2._countAndFlagsBits;
  strcpy((char *)&v2, "IDSService=");
  HIDWORD(v2._object) = -352321536;
  swift_unknownObjectRetain();
  sub_10000CCE8(&qword_10005A2A8);
  v4._uint64_t countAndFlagsBits = sub_10003CFF0();
  sub_10003D010(v4);
  swift_bridgeObjectRelease();
  v5._uint64_t countAndFlagsBits = 32;
  v5._object = (void *)0xE100000000000000;
  sub_10003D010(v5);
  swift_bridgeObjectRetain();
  sub_10003D010(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  strcpy((char *)&v2, "Service Name=");
  HIWORD(v2._object) = -4864;
  swift_bridgeObjectRetain();
  v6._uint64_t countAndFlagsBits = sub_10003CFF0();
  sub_10003D010(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_10003D010(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v7._uint64_t countAndFlagsBits = 41;
  v7._object = (void *)0xE100000000000000;
  sub_10003D010(v7);
  swift_bridgeObjectRelease();
  return countAndFlagsBits;
}

char *sub_100028ED0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_10000CCE8(&qword_100059E40);
  __chkstk_darwin(v6 - 8);
  sub_10000D9F4();
  uint64_t v27 = v8 - v7;
  uint64_t v25 = sub_10003D150();
  uint64_t v9 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  sub_10000D9F4();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_10003D130();
  __chkstk_darwin(v13);
  sub_10000D9F4();
  uint64_t v14 = sub_10003CED0();
  __chkstk_darwin(v14 - 8);
  sub_10000D9F4();
  *(void *)&v3[OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_firewall] = 0;
  unint64_t v15 = (uint64_t *)&v3[OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_name];
  *unint64_t v15 = a2;
  v15[1] = (uint64_t)a3;
  sub_10000D988(0, (unint64_t *)&unk_100059ED0);
  unint64_t v30 = 0x80000001000419D0;
  v31._uint64_t countAndFlagsBits = a2;
  v31._object = a3;
  sub_10003D010(v31);
  uint64_t v16 = v3;
  sub_10003CEC0();
  uint64_t v29 = _swiftEmptyArrayStorage;
  sub_10000D680();
  sub_10000CCE8(&qword_100059EE0);
  sub_10000D6D0();
  sub_10003D1F0();
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v12, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v25);
  *(void *)&v16[OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_queue] = sub_10003D170();
  *(void *)&v16[OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_idsService] = a1;
  swift_unknownObjectRetain();

  v28.receiver = v16;
  v28.super_class = (Class)type metadata accessor for FTIDSService();
  uint64_t v17 = (char *)objc_msgSendSuper2(&v28, "init");
  uint64_t v18 = *(void *)&v17[OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_queue];
  uint64_t v19 = *(void **)&v17[OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_idsService];
  uint64_t v20 = v17;
  [v19 addDelegate:v20 queue:v18];
  uint64_t v21 = sub_10003D090();
  sub_10000FA0C(v27, 1, 1, v21);
  uint64_t v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  uint64_t v23[3] = 0;
  v23[4] = v22;
  sub_1000282EC(v27, (uint64_t)&unk_10005A278, (uint64_t)v23);
  swift_release();

  swift_unknownObjectRelease();
  return v20;
}

uint64_t sub_100029260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 56) = a4;
  return _swift_task_switch(sub_100029280, 0, 0);
}

uint64_t sub_100029280()
{
  sub_10001D6B4();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 64) = Strong;
  if (Strong)
  {
    Swift::String v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    void *v2 = v0;
    v2[1] = sub_100029364;
    return sub_10002724C();
  }
  else
  {
    sub_10001D6E4();
    return v4();
  }
}

uint64_t sub_100029364()
{
  sub_10001D6B4();
  sub_10001D69C();
  sub_100023F3C();
  *Swift::String v3 = v2;
  uint64_t v4 = *v1;
  sub_100023F3C();
  void *v5 = v4;
  *(void *)(v6 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v7 = sub_1000294A0;
  }
  else {
    uint64_t v7 = sub_100029448;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_100029448()
{
  sub_10001D6B4();

  sub_10001D6E4();
  return v1();
}

uint64_t sub_1000294A0()
{
  uint64_t v13 = v0;
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10003CEA0();
  sub_10000CD54(v1, (uint64_t)qword_10005B880);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_10003CE80();
  os_log_type_t v3 = sub_10003D100();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[10];
  uint64_t v6 = (void *)v0[8];
  if (v4)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    v0[5] = v5;
    swift_errorRetain();
    sub_10000CCE8((uint64_t *)&unk_100059D70);
    uint64_t v8 = sub_10003CFF0();
    v0[6] = sub_10000CE00(v8, v9, &v12);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to retrieve firewall with error %s", v7, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();

    swift_errorRelease();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  sub_10001D6E4();
  return v10();
}

uint64_t sub_1000296C4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_10000CCE8(&qword_10005A2F0);
    uint64_t v2 = (void *)sub_10003D2F0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    unint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_10000D608(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v17;
    *((void *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10002ACE4(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_10002ACE4(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_10002ACE4(v36, v37);
    sub_10002ACE4(v37, &v33);
    uint64_t result = sub_10003D230(v2[5]);
    uint64_t v18 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)]) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v20];
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)])) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v6[(v21 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v21;
    uint64_t v26 = v2[6] + 40 * v21;
    *(_OWORD *)uint64_t v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(void *)(v26 + 32) = v31;
    uint64_t result = (uint64_t)sub_10002ACE4(&v33, (_OWORD *)(v2[7] + 32 * v21));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v28 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_100023D14();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100029A88(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_10000CCE8(&qword_10005A2E8);
    uint64_t v2 = (void *)sub_10003D250();
  }
  else
  {
    uint64_t v2 = &_swiftEmptySetSingleton;
  }
  uint64_t v3 = a1 + 56;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  uint64_t v6 = v5 & *(void *)(a1 + 56);
  int64_t v7 = (unint64_t)(63 - v4) >> 6;
  int64_t v8 = (char *)(v2 + 7);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  if (!v6) {
    goto LABEL_9;
  }
LABEL_8:
  v6 &= v6 - 1;
  while (1)
  {
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    uint64_t result = sub_10003D230(v2[5]);
    uint64_t v15 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)&v8[8 * (v16 >> 6)]) == 0)
    {
      char v19 = 0;
      unint64_t v20 = (unint64_t)(63 - v15) >> 6;
      while (++v17 != v20 || (v19 & 1) == 0)
      {
        BOOL v21 = v17 == v20;
        if (v17 == v20) {
          unint64_t v17 = 0;
        }
        v19 |= v21;
        uint64_t v22 = *(void *)&v8[8 * v17];
        if (v22 != -1)
        {
          unint64_t v18 = __clz(__rbit64(~v22)) + (v17 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)&v8[8 * (v16 >> 6)])) | v16 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v8[(v18 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v18;
    uint64_t v23 = v2[6] + 40 * v18;
    *(_OWORD *)uint64_t v23 = v24;
    *(_OWORD *)(v23 + 16) = v25;
    *(void *)(v23 + 32) = v26;
    ++v2[2];
    if (v6) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v7) {
      goto LABEL_36;
    }
    uint64_t v12 = *(void *)(v3 + 8 * v11);
    int64_t v13 = v10 + 1;
    if (!v12)
    {
      int64_t v13 = v10 + 2;
      if (v10 + 2 >= v7) {
        goto LABEL_36;
      }
      uint64_t v12 = *(void *)(v3 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v10 + 3;
        if (v10 + 3 >= v7) {
          goto LABEL_36;
        }
        uint64_t v12 = *(void *)(v3 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v10 + 4;
          if (v10 + 4 >= v7) {
            goto LABEL_36;
          }
          uint64_t v12 = *(void *)(v3 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    uint64_t v6 = (v12 - 1) & v12;
    int64_t v10 = v13;
  }
  int64_t v14 = v10 + 5;
  if (v10 + 5 >= v7)
  {
LABEL_36:
    swift_release();
    sub_100023D14();
    return (uint64_t)v2;
  }
  uint64_t v12 = *(void *)(v3 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v10 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v7) {
      goto LABEL_36;
    }
    uint64_t v12 = *(void *)(v3 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10002A030(uint64_t result, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_10002C7E8(v3, v4);
  }
  else if (a2)
  {
    swift_unknownObjectRetain();
    return sub_10002C890(v3, a2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10002A0A8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_10003CFB0();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithPrefixedURI:v1];

  return v2;
}

uint64_t sub_10002A11C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = a2;
    return sub_10002C7E8(v2, v3);
  }
  else
  {
    return j__swift_continuation_throwingResume();
  }
}

uint64_t sub_10002A19C(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6)
{
  unint64_t v9 = _Block_copy(aBlock);
  sub_10002AE9C();
  int64_t v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = a1;
  id v11 = a3;
  id v12 = a1;

  return sub_10002C6E4(a6, (uint64_t)v10);
}

void sub_10002A218()
{
}

uint64_t sub_10002A248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100028A68();
  uint64_t v4 = qword_10005B878;
  return _swift_task_switch(sub_10002A2B8, v4, 0);
}

uint64_t sub_10002A2B8()
{
  NSString v1 = *(void **)(v0 + 32);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_10003CFC0();
  *(void *)(v0 + 48) = v2;
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  void *v4 = v0;
  v4[1] = sub_10002A38C;
  return sub_100027624();
}

uint64_t sub_10002A38C()
{
  uint64_t v3 = v0;
  sub_10002AE4C();
  uint64_t v5 = v4;
  sub_100023F3C();
  uint64_t *v6 = v5;
  int64_t v7 = *(void **)(v1 + 32);
  uint64_t v8 = *v2;
  uint64_t *v6 = *v2;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(v1 + 40);
  if (v3)
  {
    int64_t v10 = (void *)sub_10003CC80();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    uint64_t v11 = sub_10002AED4();
    v12(v11);
  }
  _Block_release(*(const void **)(v5 + 40));
  int64_t v13 = *(uint64_t (**)(void))(v8 + 8);
  return v13();
}

id sub_10002A508()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FTIDSService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FTIDSService()
{
  return self;
}

uint64_t sub_10002A5D0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002A608()
{
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v0 = sub_10002AE9C();

  return _swift_deallocObject(v0, v1, v2);
}

uint64_t sub_10002A640()
{
  sub_10002AE64();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = swift_task_alloc();
  int64_t v7 = (void *)sub_10002AEC8(v6);
  *int64_t v7 = v8;
  v7[1] = sub_10002A6EC;
  return sub_100029260(v2, v3, v4, v5);
}

uint64_t sub_10002A6EC()
{
  sub_10001D6B4();
  sub_10001D69C();
  uint64_t v1 = *v0;
  sub_100023F3C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10001D6E4();
  return v3();
}

uint64_t sub_10002A7B0(uint64_t a1)
{
  uint64_t v2 = sub_10000CCE8(&qword_100059E40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_10002A810(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = sub_10003CFB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  id v4 = [v2 initWithService:v3];

  return v4;
}

uint64_t sub_10002A874(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10002A950;
  return v6(a1);
}

uint64_t sub_10002A950()
{
  sub_10001D6B4();
  sub_10001D69C();
  uint64_t v1 = *v0;
  sub_100023F3C();
  void *v2 = v1;
  swift_task_dealloc();
  sub_100023FAC();
  return v3();
}

uint64_t sub_10002AA14()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002AA4C()
{
  sub_10002AE64();
  uint64_t v2 = v1;
  NSString v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_10002AEC8(v4);
  void *v5 = v6;
  v5[1] = sub_10002A6EC;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10005A280 + dword_10005A280);
  return v7(v2, v3);
}

uint64_t sub_10002AB00()
{
  sub_10002AE64();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10002AEC8(v0);
  void *v1 = v2;
  v1[1] = sub_10002AE48;
  uint64_t v3 = sub_10002AE80();
  return v4(v3);
}

id sub_10002AB98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a3 + OBJC_IVAR____TtC18FTLivePhotoService12FTIDSService_idsService) addDelegate:a1 queue:a2];
}

uint64_t sub_10002ABC0()
{
  _Block_release(*(const void **)(v0 + 24));
  uint64_t v1 = sub_10002AE9C();

  return _swift_deallocObject(v1, v2, v3);
}

uint64_t sub_10002AC00()
{
  sub_10002AE64();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10002AEC8(v0);
  void *v1 = v2;
  v1[1] = sub_10002AE48;
  uint64_t v3 = sub_10002AE80();
  return v4(v3);
}

unint64_t sub_10002AC98()
{
  unint64_t result = qword_10005A2C8;
  if (!qword_10005A2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A2C8);
  }
  return result;
}

_OWORD *sub_10002ACE4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unsigned char *storeEnumTagSinglePayload for FTIDSServiceDonationError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10002ADC0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FTIDSServiceDonationError()
{
  return &type metadata for FTIDSServiceDonationError;
}

unint64_t sub_10002ADFC()
{
  unint64_t result = qword_10005A2F8;
  if (!qword_10005A2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A2F8);
  }
  return result;
}

uint64_t sub_10002AE70(uint64_t a1)
{
  *(void *)(v2 + v1) = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_10002AE80()
{
  return v0;
}

uint64_t sub_10002AE9C()
{
  return v0;
}

uint64_t sub_10002AEC8(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_10002AED4()
{
  return v0;
}

uint64_t sub_10002AEEC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10002AF3C()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_10002AF64()
{
  sub_10002AF3C();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for ProcessAssertionManager()
{
  return sub_10002AFA8();
}

uint64_t sub_10002AFA8()
{
  return swift_getGenericMetadata();
}

uint64_t sub_10002AFD8(uint64_t a1)
{
  uint64_t result = sub_10002C350(a1);
  if (v4) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  else {
    return sub_10002C2D4(result, v3, 0, a1);
  }
}

id sub_10002B074()
{
  return *(id *)(v0 + OBJC_IVAR___FTMomentsControllerSession_moments);
}

uint64_t sub_10002B194()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___FTMomentsControllerSession_isRegistered);
}

uint64_t sub_10002B1CC(uint64_t result)
{
  *(unsigned char *)(v1 + OBJC_IVAR___FTMomentsControllerSession_isRegistered) = result;
  return result;
}

uint64_t sub_10002B254()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10002B324(uint64_t a1, void *a2)
{
  char v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  void *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002B3DC()
{
  swift_getObjectType();
  uint64_t v14 = sub_10003D3D0();
  v16._uint64_t countAndFlagsBits = 40;
  v16._object = (void *)0xE100000000000000;
  sub_10003D010(v16);
  uint64_t v1 = v14;
  uint64_t v14 = 0x3D73746E656D6F6DLL;
  unint64_t v15 = 0xE800000000000000;
  id v2 = *(id *)(v0 + OBJC_IVAR___FTMomentsControllerSession_moments);
  sub_10000CCE8(&qword_10005A438);
  v17._uint64_t countAndFlagsBits = sub_10003CFF0();
  sub_10003D010(v17);
  swift_bridgeObjectRelease();
  sub_10002C41C();
  swift_bridgeObjectRetain();
  v18._uint64_t countAndFlagsBits = 0x3D73746E656D6F6DLL;
  v18._object = (void *)0xE800000000000000;
  sub_10003D010(v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = 0;
  unint64_t v15 = 0xE000000000000000;
  sub_10003D260(25);
  swift_bridgeObjectRelease();
  v11._uint64_t countAndFlagsBits = 0xD000000000000016;
  v11._object = (void *)0x8000000100041D10;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  Class isa = sub_10003CF60().super.isa;
  swift_bridgeObjectRelease();
  id v4 = (id)TULoggableStringForObject();

  if (v4)
  {
    uint64_t v5 = sub_10003CFC0();
    uint64_t v7 = v6;

    uint64_t v12 = v5;
    uint64_t v13 = v7;
    v8._uint64_t countAndFlagsBits = sub_10003CFF0();
    object = v8._object;
  }
  else
  {
    object = (void *)0xE300000000000000;
    v8._uint64_t countAndFlagsBits = 7104878;
  }
  v8._object = object;
  sub_10003D010(v8);
  swift_bridgeObjectRelease();
  sub_10002C41C();
  swift_bridgeObjectRetain();
  sub_10003D010(v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003D260(16);
  swift_bridgeObjectRelease();
  strcpy((char *)&v11, "isRegistered=");
  HIWORD(v11._object) = -4864;
  v19._uint64_t countAndFlagsBits = sub_10003CFF0();
  sub_10003D010(v19);
  swift_bridgeObjectRelease();
  sub_10002C41C();
  swift_bridgeObjectRetain();
  sub_10003D010(v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003D260(33);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_10000CCE8(&qword_10005A440);
  v20._uint64_t countAndFlagsBits = sub_10003CFF0();
  sub_10003D010(v20);
  swift_bridgeObjectRelease();
  sub_10002C41C();
  swift_bridgeObjectRetain();
  v21._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
  v21._object = (void *)0x8000000100041D30;
  sub_10003D010(v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v22._uint64_t countAndFlagsBits = 41;
  v22._object = (void *)0xE100000000000000;
  sub_10003D010(v22);
  swift_bridgeObjectRelease();
  return v1;
}

id sub_10002B7A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v3[OBJC_IVAR___FTMomentsControllerSession_isRegistered] = 1;
  *(void *)&v3[OBJC_IVAR___FTMomentsControllerSession_activeRequestsByTransactionID] = &_swiftEmptyDictionarySingleton;
  *(void *)&v3[OBJC_IVAR___FTMomentsControllerSession_moments] = a1;
  *(void *)&v3[OBJC_IVAR___FTMomentsControllerSession_remoteIDSDestinations] = a2;
  *(void *)&v3[OBJC_IVAR___FTMomentsControllerSession_callCenter] = a3;
  v9.receiver = v3;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t sub_10002B8B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void **)(v3 + OBJC_IVAR___FTMomentsControllerSession_callCenter);
  aBlock[4] = sub_10002BE80;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002BE84;
  aBlock[3] = &unk_100052790;
  unint64_t v7 = (unint64_t)_Block_copy(aBlock);
  swift_release();
  id v45 = v6;
  id v8 = [v6 callsPassingTest:v7];
  _Block_release((const void *)v7);
  if (swift_isEscapingClosureAtFileLocation())
  {
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10003D2E0();
    swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_4;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    if (qword_100059750 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_10003CEA0();
    sub_10000CD54(v26, (uint64_t)qword_10005B880);
    int64_t v27 = sub_10003CE80();
    os_log_type_t v28 = sub_10003D120();
    if (os_log_type_enabled(v27, v28))
    {
      long long v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "MomentsControllerSession: no streamtoken found", v29, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  sub_10002C294();
  unint64_t v7 = sub_10003D040();

  uint64_t v44 = a1;
  if (v7 >> 62) {
    goto LABEL_37;
  }
  uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v9) {
    goto LABEL_18;
  }
LABEL_4:
  unint64_t v10 = v7 & 0xC000000000000001;
  uint64_t v47 = OBJC_IVAR___FTMomentsControllerSession_moments;
  uint64_t v11 = 4;
  while (1)
  {
    if (v10) {
      id v12 = (id)sub_10003D290();
    }
    else {
      id v12 = *(id *)(v7 + 8 * v11);
    }
    uint64_t v13 = v12;
    uint64_t v14 = v11 - 3;
    if (__OFADD__(v11 - 4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (!a2) {
      break;
    }
    id v15 = [v45 activeConversationForCall:v12];
    if (v15)
    {
      Swift::String v16 = v15;
      id v46 = [v15 avcSessionToken];
      unint64_t v17 = v7;
      unint64_t v18 = v10;
      uint64_t v19 = v9;
      uint64_t v20 = a2;
      uint64_t v21 = v3;
      id v22 = [*(id *)(v3 + v47) streamToken];

      BOOL v23 = v46 == v22;
      uint64_t v3 = v21;
      a2 = v20;
      uint64_t v9 = v19;
      unint64_t v10 = v18;
      unint64_t v7 = v17;
      if (v23) {
        goto LABEL_24;
      }
    }
    else
    {
    }
LABEL_17:
    ++v11;
    if (v14 == v9) {
      goto LABEL_18;
    }
  }
  id v24 = [v12 videoStreamToken];
  id v25 = [*(id *)(v3 + v47) streamToken];

  if (v24 != v25) {
    goto LABEL_17;
  }
LABEL_24:
  swift_bridgeObjectRelease();
  if (a2)
  {
    if (qword_100059750 != -1) {
      swift_once();
    }
    uint64_t v32 = a2;
    uint64_t v33 = sub_10003CEA0();
    sub_10000CD54(v33, (uint64_t)qword_10005B880);
    long long v34 = sub_10003CE80();
    os_log_type_t v35 = sub_10003D120();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "MomentsControllerSession: GroupFaceTime", v36, 2u);
      swift_slowDealloc();
    }

    uint64_t v37 = (uint64_t *)(v3 + OBJC_IVAR___FTMomentsControllerSession_remoteIDSDestinations);
    swift_beginAccess();
    uint64_t v38 = *v37;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_10002F990(v44, v32, v38);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_100059750 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_10003CEA0();
    sub_10000CD54(v39, (uint64_t)qword_10005B880);
    uint64_t v40 = sub_10003CE80();
    os_log_type_t v41 = sub_10003D120();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "MomentsControllerSession: FaceTime 1:1", v42, 2u);
      swift_slowDealloc();
    }

    CFStringRef v43 = (uint64_t *)(v3 + OBJC_IVAR___FTMomentsControllerSession_remoteIDSDestinations);
    swift_beginAccess();
    return sub_10002AFD8(*v43);
  }
  return v30;
}

id sub_10002BE1C(void *a1)
{
  id result = [a1 isVideo];
  if (result)
  {
    if ([a1 status] == 1) {
      return (id)([a1 isVideoPaused] ^ 1);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10002BE84(uint64_t a1, void *a2)
{
  uint64_t v2 = *(uint64_t (**)(void))(a1 + 32);
  id v3 = a2;
  char v4 = v2();

  return v4 & 1;
}

uint64_t sub_10002BED4(void *a1, SEL *a2)
{
  if (a1 && (id v2 = [a1 *a2]) != 0)
  {
    id v3 = v2;
    uint64_t v4 = sub_10003CFC0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = sub_10002B8B0(v4, v6);
  swift_bridgeObjectRelease();
  return v7;
}

id sub_10002BF60(void *a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6 = a1;
  id v7 = a3;
  sub_10002BED4(a3, a4);
  uint64_t v9 = v8;

  if (v9)
  {
    NSString v10 = sub_10003CFB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

uint64_t sub_10002BFF4(void *a1, uint64_t a2, uint64_t a3)
{
  return swift_bridgeObjectRelease();
}

void sub_10002C0D8(uint64_t a1, uint64_t a2)
{
  sub_10002C3F8();
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_100033864(a1, a2);
  swift_endAccess();
  swift_bridgeObjectRelease();
}

void sub_10002C1AC()
{
}

uint64_t type metadata accessor for LivePhotosMomentsControllerSession()
{
  return self;
}

uint64_t sub_10002C27C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002C28C()
{
  return swift_release();
}

unint64_t sub_10002C294()
{
  unint64_t result = qword_10005A430;
  if (!qword_10005A430)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005A430);
  }
  return result;
}

uint64_t sub_10002C2D4(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
  {
    uint64_t v4 = *(void *)(*(void *)(a4 + 48) + 16 * result);
    swift_bridgeObjectRetain();
    return v4;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_10002C350(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 192;
  for (uint64_t i = 12; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_10002C3F8()
{
  return swift_beginAccess();
}

void sub_10002C41C()
{
  v1._uint64_t countAndFlagsBits = 32;
  v1._object = (void *)0xE100000000000000;
  sub_10003D010(v1);
}

Swift::Int sub_10002C434(char a1)
{
  return sub_10003D3C0();
}

Swift::Int sub_10002C484(char a1)
{
  return sub_10002C664(0, a1);
}

Swift::Int sub_10002C490()
{
  return sub_10003D3C0();
}

uint64_t sub_10002C4E8(uint64_t a1, char a2)
{
  if (a2) {
    sub_10002F47C();
  }
  else {
    sub_10002F4B4();
  }
  sub_10003D000();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002C554(uint64_t a1, char a2)
{
  sub_10000E6B0(a2);
  sub_10003D000();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002C5A8()
{
  return sub_10003D000();
}

Swift::Int sub_10002C5C4()
{
  return sub_10003D3C0();
}

Swift::Int sub_10002C618(uint64_t a1, char a2)
{
  return sub_10003D3C0();
}

Swift::Int sub_10002C664(uint64_t a1, char a2)
{
  if (a2) {
    sub_10002F47C();
  }
  else {
    sub_10002F4B4();
  }
  sub_10003D000();
  swift_bridgeObjectRelease();
  return sub_10003D3C0();
}

uint64_t sub_10002C6E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CCE8(&qword_100059E40);
  __chkstk_darwin(v4 - 8);
  unsigned int v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10003D090();
  sub_10000FA0C((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  void v8[3] = 0;
  void v8[4] = a1;
  v8[5] = a2;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  void v9[4] = &unk_10005A4A8;
  v9[5] = v8;
  sub_10002E954((uint64_t)v6, (uint64_t)&unk_10005A4B8, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_10002C7EC(uint64_t a1, uint64_t a2)
{
  sub_10000CCE8((uint64_t *)&unk_100059D70);
  uint64_t v4 = swift_allocError();
  void *v5 = a2;

  return _swift_continuation_throwingResumeWithError(a1, v4);
}

uint64_t sub_10002C850(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_10002C870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 64) + 40);
  *uint64_t v3 = a2;
  v3[1] = a3;
  return swift_continuation_throwingResume();
}

uint64_t sub_10002C894(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

BOOL sub_10002C8B8(uint64_t a1, void *a2)
{
  v6._uint64_t countAndFlagsBits = a1;
  v3._rawValue = &off_1000516C8;
  v6._object = a2;
  Swift::Int v4 = sub_10003D310(v3, v6);
  swift_bridgeObjectRelease();
  return v4 != 0;
}

unint64_t sub_10002C900()
{
  return 0xD00000000000001BLL;
}

BOOL sub_10002C92C@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = sub_10002C8B8(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10002C964@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_10002C900();
  *a1 = 0xD00000000000001BLL;
  a1[1] = v3;
  return result;
}

id sub_10002C994()
{
  uint64_t v0 = (objc_class *)type metadata accessor for MediaAssetManager();
  Swift::String v1 = (char *)objc_allocWithZone(v0);
  uint64_t v2 = (id (**)())&v1[OBJC_IVAR___FTMediaAssetManager_photoLibraryProvider];
  void *v2 = sub_10002CA1C;
  v2[1] = 0;
  v5.receiver = v1;
  v5.super_class = v0;
  id v3 = objc_msgSendSuper2(&v5, "init");
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

id sub_10002CA1C()
{
  id v0 = [self sharedPhotoLibrary];

  return v0;
}

uint64_t sub_10002CA80()
{
  sub_10001D6B4();
  v1[28] = v2;
  v1[29] = v0;
  v1[27] = v3;
  uint64_t v4 = sub_10003CD40();
  v1[30] = v4;
  sub_100023E68(v4);
  v1[31] = v5;
  v1[32] = *(void *)(v6 + 64);
  v1[33] = swift_task_alloc();
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  return _swift_task_switch(sub_10002CB4C, 0, 0);
}

uint64_t sub_10002CB4C()
{
  CFStringRef v43 = v0;
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[27];
  uint64_t v3 = v0[35];
  uint64_t v2 = v0[36];
  uint64_t v4 = v0[30];
  uint64_t v5 = v0[31];
  uint64_t v6 = v0[28];
  uint64_t v7 = sub_10003CEA0();
  v0[37] = sub_10000CD54(v7, (uint64_t)qword_10005B880);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v8(v2, v1, v4);
  os_log_type_t v41 = v8;
  v8(v3, v6, v4);
  uint64_t v9 = sub_10003CE80();
  os_log_type_t v10 = sub_10003D120();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = v0[31];
  if (v11)
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    sub_10002EC5C();
    uint64_t v14 = sub_10003D320();
    v0[25] = sub_10000CE00(v14, v15, &v42);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    Swift::String v16 = *(void (**)(void))(v12 + 8);
    sub_10002F43C();
    v16();
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v17 = sub_10003D320();
    v0[26] = sub_10000CE00(v17, v18, &v42);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    sub_10002F43C();
    v16();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "photoURL: %s videoURL: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    uint64_t v19 = *(void (**)(void))(v12 + 8);
    sub_10002F43C();
    v19();
    sub_10002F43C();
    v19();
  }
  uint64_t v21 = v0[33];
  uint64_t v20 = v0[34];
  uint64_t v38 = v21;
  uint64_t v22 = v0[31];
  uint64_t v39 = v0[32];
  id v24 = (char *)v0[29];
  uint64_t v23 = v0[30];
  uint64_t v25 = v0[27];
  uint64_t v26 = v0[28];
  uint64_t v27 = swift_allocObject();
  v0[38] = v27;
  *(void *)(v27 + 16) = 0;
  os_log_type_t type = (void *)(*(uint64_t (**)(void))&v24[OBJC_IVAR___FTMediaAssetManager_photoLibraryProvider])();
  v0[39] = type;
  v41(v20, v25, v23);
  v41(v21, v26, v23);
  uint64_t v28 = *(unsigned __int8 *)(v22 + 80);
  uint64_t v29 = (v28 + 16) & ~v28;
  unint64_t v30 = (v29 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = (v28 + v30 + 8) & ~v28;
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32);
  v33(v32 + v29, v20, v23);
  *(void *)(v32 + v30) = v24;
  v33(v32 + v31, v38, v23);
  *(void *)(v32 + ((v31 + v39 + 7) & 0xFFFFFFFFFFFFFFF8)) = v27;
  v0[14] = sub_10002ED8C;
  v0[15] = v32;
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 1107296256;
  v0[12] = sub_1000147FC;
  v0[13] = &unk_100052858;
  long long v34 = _Block_copy(v0 + 10);
  v0[40] = v34;
  os_log_type_t v35 = v24;
  swift_retain();
  swift_release();
  v0[2] = v0;
  v0[3] = sub_10002D02C;
  uint64_t v36 = swift_continuation_init();
  v0[16] = _NSConcreteStackBlock;
  v0[17] = 0x40000000;
  v0[18] = sub_10002D5FC;
  v0[19] = &unk_100052880;
  v0[20] = v36;
  objc_msgSend(type, "performChanges:completionHandler:", v34);
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10002D02C()
{
  sub_10001D6B4();
  sub_10001D69C();
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v2 + 328) = v1;
  if (v1) {
    uint64_t v3 = sub_10002D3F4;
  }
  else {
    uint64_t v3 = sub_10002D114;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10002D114()
{
  uint64_t v21 = v0;
  uint64_t v1 = *(const void **)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 304);

  uint64_t v3 = (uint8_t *)(v2 + 16);
  _Block_release(v1);
  swift_beginAccess();
  uint64_t v4 = *(void **)(v2 + 16);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = sub_10003CE80();
    os_log_type_t v7 = sub_10003D120();
    p_align = &stru_100056FE8.align;
    if (os_log_type_enabled(v6, v7))
    {
      swift_slowAlloc();
      uint64_t v20 = sub_10002F498();
      *(_DWORD *)uint64_t v3 = 136315138;
      id v9 = [v5 localIdentifier];
      uint64_t v10 = sub_10003CFC0();
      unint64_t v12 = v11;

      *(void *)(v0 + 192) = sub_10000CE00(v10, v12, &v20);
      sub_10003D1B0();
      p_align = (_DWORD *)(&stru_100056FE8 + 24);
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Saved live photo with identifier %s", v3, 0xCu);
      swift_arrayDestroy();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
    }
    id v15 = objc_msgSend(v5, *((SEL *)p_align + 398));
    uint64_t v16 = sub_10003CFC0();
    uint64_t v18 = v17;

    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v19(v16, v18);
  }
  else
  {
    sub_10002E770();
    swift_allocError();
    swift_willThrow();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_10001D6E4();
    return v13();
  }
}

uint64_t sub_10002D3F4()
{
  sub_10002F508();
  uint64_t v1 = *(const void **)(v0 + 320);
  uint64_t v2 = *(void **)(v0 + 312);
  swift_willThrow();

  _Block_release(v1);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10001D6E4();
  return v3();
}

void sub_10002D4A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = [self creationRequestForAsset];
  sub_10003CCD0(v6);
  uint64_t v8 = v7;
  id v9 = [objc_allocWithZone((Class)PHAssetResourceCreationOptions) init];
  [v9 setShouldMoveFile:1];
  [v5 addResourceWithType:1 fileURL:v8 options:v9];

  sub_10003CCD0(v10);
  unint64_t v12 = v11;
  id v13 = [objc_allocWithZone((Class)PHAssetResourceCreationOptions) init];
  [v13 setShouldMoveFile:1];
  [v5 addResourceWithType:9 fileURL:v12 options:v13];

  id v14 = [v5 placeholderForCreatedAsset];
  swift_beginAccess();
  id v15 = *(void **)(a4 + 16);
  *(void *)(a4 + 16) = v14;
}

uint64_t sub_10002D5FC(uint64_t result, int a2, void *a3)
{
  if (a2)
  {
    return j__swift_continuation_throwingResume();
  }
  else if (a3)
  {
    return sub_10002C7EC(*(void *)(result + 32), (uint64_t)a3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10002D6F0(uint64_t a1, uint64_t a2, const void *a3, void *a4)
{
  v4[2] = a4;
  uint64_t v7 = sub_10003CD40();
  v4[3] = v7;
  v4[4] = *(void *)(v7 - 8);
  v4[5] = swift_task_alloc();
  v4[6] = swift_task_alloc();
  v4[7] = _Block_copy(a3);
  sub_10003CD00();
  sub_10003CD00();
  a4;
  uint64_t v8 = (void *)swift_task_alloc();
  v4[8] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_10002D84C;
  return sub_10002CA80();
}

uint64_t sub_10002D84C()
{
  sub_10002F418();
  uint64_t v4 = v3;
  sub_10001D6D4();
  uint64_t *v5 = v4;
  uint64_t v6 = (void *)v2[2];
  uint64_t v7 = *v1;
  uint64_t *v5 = *v1;
  swift_task_dealloc();

  uint64_t v8 = v2[6];
  uint64_t v9 = v2[3];
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v2[4] + 8);
  v10(v2[5], v9);
  v10(v8, v9);
  if (v0)
  {
    uint64_t v11 = sub_10003CC80();
    swift_errorRelease();
    unint64_t v12 = (void *)v11;
  }
  else
  {
    NSString v13 = sub_10003CFB0();
    swift_bridgeObjectRelease();
    unint64_t v12 = v13;
  }
  id v14 = *(const void **)(v4 + 56);
  uint64_t v15 = sub_10002F4CC();
  v16(v15);

  _Block_release(v14);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(void))(v7 + 8);
  return v17();
}

uint64_t sub_10002DA2C()
{
  sub_10001D6B4();
  v1[14] = v2;
  v1[15] = v0;
  uint64_t v3 = sub_10003CD40();
  v1[16] = v3;
  sub_100023E68(v3);
  v1[17] = v4;
  v1[18] = *(void *)(v5 + 64);
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  return _swift_task_switch(sub_10002DB08, 0, 0);
}

uint64_t sub_10002DB08()
{
  uint64_t v47 = v0;
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v1 = (_DWORD *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 136);
  uint64_t v6 = sub_10003CEA0();
  sub_10000CD54(v6, (uint64_t)qword_10005B880);
  id v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v45(v3, v2, v4);
  uint64_t v7 = sub_10003CE80();
  os_log_type_t v8 = sub_10003D120();
  if (os_log_type_enabled(v7, v8))
  {
    swift_slowAlloc();
    v46[0] = sub_10002F498();
    _DWORD *v1 = 136315138;
    sub_10002EC5C();
    uint64_t v9 = sub_10003D320();
    *(void *)uint64_t v1 = sub_10000CE00(v9, v10, v46);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    sub_10002F44C();
    v11();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "MediaAssetManager saving video with URL %s", (uint8_t *)(v0 + 104), 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    sub_10002F44C();
    v12();
  }
  uint64_t v14 = *(void *)(v0 + 144);
  uint64_t v13 = *(void *)(v0 + 152);
  uint64_t v15 = *(void *)(v0 + 128);
  uint64_t v16 = *(void *)(v0 + 136);
  uint64_t v17 = *(void *)(v0 + 112);
  uint64_t v18 = *(char **)(v0 + 120);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = 0;
  CFStringRef v43 = (id *)(v19 + 16);
  os_log_t log = (os_log_t)(*(uint64_t (**)(void))&v18[OBJC_IVAR___FTMediaAssetManager_photoLibraryProvider])();
  v45(v13, v17, v15);
  unint64_t v20 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v21 = (v14 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 32))(v22 + v20, v13, v15);
  *(void *)(v22 + v21) = v18;
  *(void *)(v22 + ((v21 + 15) & 0xFFFFFFFFFFFFFFF8)) = v19;
  *(void *)(v0 + 48) = sub_10002E6E4;
  *(void *)(v0 + 56) = v22;
  *(void *)(v0 + 16) = _NSConcreteStackBlock;
  *(void *)(v0 + 24) = 1107296256;
  *(void *)(v0 + 32) = sub_1000147FC;
  *(void *)(v0 + 40) = &unk_100052808;
  uint64_t v23 = _Block_copy((const void *)(v0 + 16));
  id v24 = v18;
  swift_retain();
  swift_release();
  *(void *)(v0 + 88) = 0;
  uint64_t v25 = (uint8_t *)[log performChangesAndWait:v23 error:v0 + 88];
  _Block_release(v23);

  id v26 = *(id *)(v0 + 88);
  if (v25)
  {
    swift_beginAccess();
    if (*v43)
    {
      id v27 = *v43;
      uint64_t v28 = sub_10003CE80();
      os_log_type_t v29 = sub_10003D120();
      p_align = &stru_100056FE8.align;
      if (os_log_type_enabled(v28, v29))
      {
        swift_slowAlloc();
        v46[0] = sub_10002F498();
        *(_DWORD *)uint64_t v25 = 136315138;
        id v31 = [v27 localIdentifier];
        uint64_t v32 = sub_10003CFC0();
        unint64_t v34 = v33;

        *(void *)(v0 + 96) = sub_10000CE00(v32, v34, v46);
        sub_10003D1B0();

        p_align = (_DWORD *)(&stru_100056FE8 + 24);
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "Saved video with identifier %s", v25, 0xCu);
        swift_arrayDestroy();
        sub_10000DA3C();
        sub_10000DA3C();
      }
      else
      {
      }
      id v38 = objc_msgSend(v27, *((SEL *)p_align + 398));
      uint64_t v39 = sub_10003CFC0();
      uint64_t v41 = v40;
      swift_release();

      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v42 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
      return v42(v39, v41);
    }
    sub_10002E770();
    swift_allocError();
  }
  else
  {
    os_log_type_t v35 = v26;
    sub_10003CC90();
  }
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10001D6E4();
  return v36();
}

void sub_10002E138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [self creationRequestForAsset];
  sub_10003CCD0(v5);
  uint64_t v7 = v6;
  id v8 = [objc_allocWithZone((Class)PHAssetResourceCreationOptions) init];
  [v8 setShouldMoveFile:0];
  [v4 addResourceWithType:2 fileURL:v7 options:v8];

  id v9 = [v4 placeholderForCreatedAsset];
  swift_beginAccess();
  unint64_t v10 = *(void **)(a3 + 16);
  *(void *)(a3 + 16) = v9;
}

uint64_t sub_10002E2BC(uint64_t a1, const void *a2, void *a3)
{
  v3[2] = a3;
  uint64_t v6 = sub_10003CD40();
  v3[3] = v6;
  v3[4] = *(void *)(v6 - 8);
  v3[5] = swift_task_alloc();
  v3[6] = _Block_copy(a2);
  sub_10003CD00();
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[7] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10002E3E8;
  return sub_10002DA2C();
}

uint64_t sub_10002E3E8()
{
  sub_10002F508();
  sub_10002F418();
  uint64_t v4 = v3;
  sub_10001D6D4();
  uint64_t *v5 = v4;
  uint64_t v6 = *v1;
  uint64_t *v5 = *v1;
  swift_task_dealloc();
  uint64_t v7 = (void *)v2[2];
  (*(void (**)(void, void))(v2[4] + 8))(v2[5], v2[3]);

  if (v0)
  {
    uint64_t v8 = sub_10003CC80();
    swift_errorRelease();
    uint64_t v9 = (void *)v8;
  }
  else
  {
    NSString v10 = sub_10003CFB0();
    swift_bridgeObjectRelease();
    uint64_t v9 = v10;
  }
  uint64_t v11 = *(const void **)(v4 + 48);
  uint64_t v12 = sub_10002F4CC();
  v13(v12);

  _Block_release(v11);
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v6 + 8);
  return v14();
}

id sub_10002E584()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MediaAssetManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MediaAssetManager()
{
  return self;
}

uint64_t sub_10002E5F0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002E628()
{
  uint64_t v1 = sub_10003CD40();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();

  return _swift_deallocObject(v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

void sub_10002E6E4()
{
  uint64_t v1 = sub_10003CD40();
  sub_100023E68(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v0 + v7);
  uint64_t v9 = *(void *)(v0 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));

  sub_10002E138(v0 + v6, v8, v9);
}

uint64_t sub_10002E758(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002E768()
{
  return swift_release();
}

unint64_t sub_10002E770()
{
  unint64_t result = qword_10005A488;
  if (!qword_10005A488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A488);
  }
  return result;
}

uint64_t sub_10002E7BC(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10001D698;
  return v6();
}

uint64_t sub_10002E888(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_10001D698;
  return v7();
}

uint64_t sub_10002E954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003D090();
  if (sub_10000CD2C(a1, 1, v6) == 1)
  {
    sub_10002A7B0(a1);
  }
  else
  {
    sub_10003D080();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10003D070();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10002EABC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10002EB98;
  return v6(a1);
}

uint64_t sub_10002EB98()
{
  sub_10001D6B4();
  sub_10001D69C();
  uint64_t v1 = *v0;
  sub_10001D6D4();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10001D6E4();
  return v3();
}

unint64_t sub_10002EC5C()
{
  unint64_t result = qword_100059FE0;
  if (!qword_100059FE0)
  {
    sub_10003CD40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059FE0);
  }
  return result;
}

uint64_t sub_10002ECAC()
{
  uint64_t v1 = *(void *)(sub_10003CD40() - 8);
  uint64_t v2 = *(void (**)(void))(v1 + 8);
  uint64_t v3 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = v3 | 7;
  uint64_t v5 = *(void *)(v1 + 64) + 7;
  unint64_t v6 = (v5 + ((v3 + 16) & ~v3)) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v5 + ((v3 + v6 + 8) & ~v3)) & 0xFFFFFFFFFFFFFFF8;
  sub_10002F44C();
  v2();

  sub_10002F44C();
  v2();
  swift_release();

  return _swift_deallocObject(v0, v7 + 8, v4);
}

void sub_10002ED8C()
{
  uint64_t v1 = sub_10003CD40();
  sub_100023E68(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64) + 7;
  unint64_t v9 = (v8 + v7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = (v6 + v9 + 8) & ~v6;
  uint64_t v11 = *(void *)(v0 + v9);
  uint64_t v12 = *(void *)(v0 + ((v8 + v10) & 0xFFFFFFFFFFFFFFF8));

  sub_10002D4A0(v0 + v7, v11, v0 + v10, v12);
}

uint64_t sub_10002EE10()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002EE58()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = (const void *)v0[3];
  uint64_t v3 = (void *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_10002AEC8(v4);
  void *v5 = v6;
  v5[1] = sub_10001D698;
  uint64_t v7 = (uint64_t (*)(uint64_t, const void *, void *))((char *)&dword_10005A490 + dword_10005A490);
  return v7(v1, v2, v3);
}

uint64_t sub_10002EF0C()
{
  sub_10002F508();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10002AEC8(v0);
  void *v1 = v2;
  v1[1] = sub_10001D698;
  uint64_t v3 = sub_10002F45C();
  return v4(v3);
}

uint64_t sub_10002EFB0()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002EFF0()
{
  sub_10002F508();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = (int *)v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_10002AEC8(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_10001D698;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10005A4B0 + dword_10005A4B0);
  return v9(v2, v3, v4, v5);
}

uint64_t sub_10002F0B4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002F0EC(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_10002AEC8(v4);
  void *v5 = v6;
  v5[1] = sub_10001C280;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10005A4C0 + dword_10005A4C0);
  return v7(a1, v3);
}

uint64_t sub_10002F1A0()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002F1F0()
{
  sub_10002F508();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10002AEC8(v0);
  void *v1 = v2;
  v1[1] = sub_10001C280;
  uint64_t v3 = sub_10002F45C();
  return v4(v3);
}

uint64_t getEnumTagSinglePayload for MediaAssetManagerError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for MediaAssetManagerError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10002F380);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10002F3A8()
{
  return 0;
}

ValueMetadata *type metadata accessor for MediaAssetManagerError()
{
  return &type metadata for MediaAssetManagerError;
}

unint64_t sub_10002F3C4()
{
  unint64_t result = qword_10005A4E0;
  if (!qword_10005A4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A4E0);
  }
  return result;
}

uint64_t sub_10002F45C()
{
  return v0;
}

uint64_t sub_10002F498()
{
  return swift_slowAlloc();
}

uint64_t sub_10002F4CC()
{
  return v0;
}

uint64_t sub_10002F4E4()
{
  return sub_10003D000();
}

id FTServerBag.isMomentsDisabled.getter()
{
  if (sub_10002F720(0xD000000000000010, 0x8000000100041DA0, v0))
  {
    sub_10003D1E0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_10002F784((uint64_t)v4, (uint64_t)v5);
  if (!v6)
  {
    sub_10002F7EC((uint64_t)v5);
    return 0;
  }
  sub_10002F84C();
  if ((sub_10002F88C() & 1) == 0) {
    return 0;
  }
  id v1 = [v3 BOOLValue];

  return v1;
}

double FTServerBag.momentsRequestTimeout.getter()
{
  if (sub_10002F720(0xD000000000000017, 0x8000000100041DC0, v0))
  {
    sub_10003D1E0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_10002F784((uint64_t)v5, (uint64_t)v6);
  if (!v7)
  {
    sub_10002F7EC((uint64_t)v6);
    return 300.0;
  }
  sub_10002F84C();
  if ((sub_10002F88C() & 1) == 0) {
    return 300.0;
  }
  [v4 doubleValue];
  double v2 = v1;

  return v2;
}

id sub_10002F720(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_10003CFB0();
  swift_bridgeObjectRelease();
  id v5 = [a3 objectForKey:v4];

  return v5;
}

uint64_t sub_10002F784(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CCE8(&qword_10005A4E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002F7EC(uint64_t a1)
{
  uint64_t v2 = sub_10000CCE8(&qword_10005A4E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10002F84C()
{
  unint64_t result = qword_100059F10;
  if (!qword_100059F10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100059F10);
  }
  return result;
}

uint64_t sub_10002F88C()
{
  return swift_dynamicCast();
}

uint64_t sub_10002F8AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100033224(a1), (v6 & 1) != 0))
  {
    unint64_t v7 = v5;
    uint64_t v8 = *(void *)(a2 + 56);
    uint64_t v9 = type metadata accessor for MessageRequest();
    sub_10000DA20();
    sub_10000D81C(v8 + *(void *)(v10 + 72) * v7, a3);
    uint64_t v11 = a3;
    uint64_t v12 = 0;
    uint64_t v13 = 1;
    uint64_t v14 = v9;
  }
  else
  {
    type metadata accessor for MessageRequest();
    uint64_t v11 = sub_100035B04();
  }

  return sub_10000FA0C(v11, v12, v13, v14);
}

void *sub_10002F948(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  unint64_t v3 = sub_100033224(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  unint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v3);
  id v6 = v5;
  return v5;
}

uint64_t sub_10002F990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_1000331AC(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

void *sub_10002F9E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_1000331AC(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void **)(*(void *)(a3 + 56) + 8 * v4);
  id v7 = v6;
  return v6;
}

id sub_10002FA30(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = sub_10003CDA0();
  __chkstk_darwin(v8);
  uint64_t v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(unsigned char *, uint64_t))(v11 + 16))(v10, a1);
  sub_10000CD8C(a2, (uint64_t)v19);
  id v12 = objc_allocWithZone((Class)TUFeatureFlags);
  id v13 = a3;
  id v14 = a4;
  id v15 = [v12 init];
  uint64_t v16 = objc_allocWithZone((Class)type metadata accessor for MediaRequest());
  return sub_10003434C((uint64_t)v10, (uint64_t)v19, v13, v14, v15, v16);
}

void sub_10002FB6C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10003CD40();
  uint64_t v6 = sub_10000DA68(v5);
  __chkstk_darwin(v6);
  sub_10000D9F4();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_10003CDA0();
  uint64_t v11 = sub_10000DA68(v10);
  __chkstk_darwin(v11);
  sub_10000D9F4();
  uint64_t v14 = v13 - v12;
  id v15 = [a1 callUUID];
  sub_10003CD80();

  id v16 = [a1 sandboxURL];
  id v17 = [v16 URL];

  sub_10003CD00();
  id v18 = [a1 mediaTokens];
  id v19 = objc_allocWithZone((Class)type metadata accessor for MediaMoments());
  unint64_t v20 = sub_10000B504(v14, v9, v18);
  if (!v2)
  {
    unint64_t v21 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v20;
    uint64_t v22 = v20;

    uint64_t v23 = *(void **)(v3 + 32);
    if (v23)
    {
      id v24 = v23;
      swift_retain();
      sub_10000B464((uint64_t)sub_100033F78, v3);

      uint64_t v25 = *(void **)(v3 + 32);
      if (v25)
      {
        swift_retain();
        id v26 = v25;
        sub_10000B4C4((uint64_t)sub_100033F7C, v3);
      }
    }
  }
}

void sub_10002FD68(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10003CEF0();
  sub_10000D9D8();
  uint64_t v8 = v7;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v83 - v13;
  uint64_t v92 = sub_10003CEB0();
  sub_10000DA20();
  __chkstk_darwin(v15);
  sub_10000D9F4();
  uint64_t v18 = v17 - v16;
  uint64_t v93 = sub_10003CD40();
  sub_10000D9D8();
  uint64_t v95 = v19;
  __chkstk_darwin(v20);
  uint64_t v90 = v21;
  os_log_type_t v91 = (char *)&v83 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  uint64_t v23 = sub_10000DA68(v22);
  __chkstk_darwin(v23);
  sub_10000D9F4();
  uint64_t v26 = v25 - v24;
  id v27 = (void *)v3[3];
  if (!v27) {
    goto LABEL_8;
  }
  uint64_t v88 = v18;
  uint64_t v89 = a2;
  os_log_type_t v84 = v12;
  uint64_t v85 = v14;
  uint64_t v86 = v8;
  uint64_t v87 = v6;
  sub_10000CD8C((uint64_t)v27 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_request, (uint64_t)aBlock);
  uint64_t v28 = v97;
  os_log_type_t v29 = v98;
  sub_10000E400(aBlock, (uint64_t)v97);
  unint64_t v30 = (uint64_t (*)(void *, void (*)()))*((void *)v29 + 1);
  id v31 = v27;
  uint64_t v32 = v30(v28, v29);
  uint64_t v34 = v33;
  sub_10000E400(a1, a1[3]);
  sub_100035B18();
  if (v32 == v35() && v34 == v36)
  {
    swift_bridgeObjectRelease_n();
    sub_10000D5B8((uint64_t)aBlock);
  }
  else
  {
    char v38 = sub_10003D330();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000D5B8((uint64_t)aBlock);
    if ((v38 & 1) == 0)
    {

      a2 = v89;
LABEL_8:
      sub_10000E400(a1, a1[3]);
      sub_100035B18();
      uint64_t v40 = v39();
      uint64_t v42 = v41;
      swift_beginAccess();
      uint64_t v43 = v3[6];
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_10002F9E8(v40, v42, v43);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v44)
      {
        sub_1000324AC((uint64_t)v44, a2);
        sub_10000E400(a1, a1[3]);
        sub_100035B18();
        uint64_t v46 = v45();
        uint64_t v48 = v47;
        swift_beginAccess();
        unint64_t v49 = sub_100033884(v46, v48, &qword_10005A6A8, (void (*)(void))type metadata accessor for MediaRequest);
        swift_endAccess();

        swift_bridgeObjectRelease();
      }
      else
      {
        if (qword_100059760 != -1) {
          swift_once();
        }
        uint64_t v77 = sub_10003CEA0();
        sub_10000CD54(v77, (uint64_t)qword_10005B8B0);
        sub_10000CD8C((uint64_t)a1, (uint64_t)aBlock);
        unint64_t v49 = sub_10003CE80();
        os_log_type_t v78 = sub_10003D0E0();
        if (os_log_type_enabled(v49, v78))
        {
          uint64_t v79 = (uint8_t *)swift_slowAlloc();
          uint64_t v101 = swift_slowAlloc();
          *(_DWORD *)uint64_t v79 = 136315138;
          sub_10000CD8C((uint64_t)aBlock, (uint64_t)v100);
          uint64_t v80 = sub_10000BF2C((uint64_t)v100);
          unint64_t v82 = v81;
          sub_10000D938((uint64_t)v100, &qword_100059930);
          v100[0] = sub_10000CE00(v80, v82, &v101);
          sub_10003D1B0();
          swift_bridgeObjectRelease();
          sub_10000D5B8((uint64_t)aBlock);
          _os_log_impl((void *)&_mh_execute_header, v49, v78, "MediaRecordingController did not finish processing request because it isn't being tracked %s", v79, 0xCu);
          swift_arrayDestroy();
          sub_10000DA3C();
          sub_10000DA3C();
        }
        else
        {
          sub_10000D5B8((uint64_t)aBlock);
        }
      }

      return;
    }
  }
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v50 = sub_10003CEA0();
  uint64_t v51 = sub_10000CD54(v50, (uint64_t)qword_10005B8B0);
  id v52 = v31;
  unint64_t v53 = sub_10003CE80();
  os_log_type_t v54 = sub_10003D0E0();
  BOOL v55 = os_log_type_enabled(v53, v54);
  id v94 = v52;
  uint64_t v83 = v51;
  if (v55)
  {
    CMTimeValue v56 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)CMTimeValue v56 = 136315138;
    v100[0] = v94;
    type metadata accessor for MediaRequest();
    id v57 = v94;
    uint64_t v58 = sub_10003CFF0();
    v100[0] = sub_10000CE00(v58, v59, aBlock);
    sub_10003D1B0();

    id v52 = v94;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "Current request finished processing, but we did't ask to end. Delaying finished processing callback until the client requests it to end or until timeout expires %s", v56, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
  }
  uint64_t v60 = v93;
  *((unsigned char *)v52 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_state) = 3;
  uint64_t v61 = *(void (**)(uint64_t))(v95 + 16);
  sub_100035AD0();
  v61(v62);
  sub_10000FA0C(v26, 0, 1, v60);
  uint64_t v63 = (uint64_t)v52 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_videoURL;
  swift_beginAccess();
  sub_100033F84(v26, v63);
  swift_endAccess();
  sub_10000DE8C();
  unsigned int v64 = v91;
  sub_100035AD0();
  v61(v65);
  uint64_t v66 = v95;
  unint64_t v67 = (*(unsigned __int8 *)(v95 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v95 + 80);
  uint64_t v68 = swift_allocObject();
  *(void *)(v68 + 16) = v3;
  (*(void (**)(unint64_t, char *, uint64_t))(v66 + 32))(v68 + v67, v64, v60);
  long long v98 = sub_100034090;
  uint64_t v99 = v68;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000147FC;
  uint64_t v97 = &unk_100052A18;
  _Block_copy(aBlock);
  v100[0] = _swiftEmptyArrayStorage;
  sub_1000359C0((unint64_t *)&qword_100059D50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  swift_retain();
  sub_10000CCE8(&qword_100059D58);
  sub_100014364();
  sub_10003D1F0();
  sub_10003CF20();
  swift_allocObject();
  uint64_t v69 = sub_10003CF00();
  swift_release();
  v3[5] = v69;
  swift_retain();
  swift_release();
  uint64_t v70 = v3[3];
  if (v70)
  {
    id v71 = *(id *)(v70 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_queue);
    os_log_type_t v72 = v84;
    sub_10003CEE0();
    unint64_t v73 = v85;
    sub_10003CF40();
    unsigned __int8 v74 = *(void (**)(char *, uint64_t))(v86 + 8);
    uint64_t v75 = v72;
    uint64_t v76 = v87;
    v74(v75, v87);
    sub_10003D140();

    swift_release();
    v74(v73, v76);
  }
  else
  {

    swift_release();
  }
}

void sub_100030794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = *(void (**)(void *, uint64_t))(a3 + 72);
  if (*(void *)(a1 + 24))
  {
    if (v4)
    {
      uint64_t v5 = *(void **)(a3 + 24);
      sub_10000D9C4(*(void *)(a3 + 72));
      id v6 = v5;
      v4(v5, a2);
      sub_10000CDF0((uint64_t)v4);
    }
  }
  else if (v4)
  {
    swift_retain();
    v4(0, a2);
    sub_10000CDF0((uint64_t)v4);
  }
}

char *sub_100030888(char *a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = sub_10003CDA0();
  sub_10000D9D8();
  long long v103 = v7;
  __chkstk_darwin(v8);
  sub_100023EB4();
  uint64_t v95 = v9;
  sub_100023EF0();
  __chkstk_darwin(v10);
  long long v98 = &v92[-v11];
  uint64_t v102 = sub_10000CCE8(&qword_100059FC8);
  sub_10000DA20();
  __chkstk_darwin(v12);
  sub_100023EB4();
  long long v100 = (char *)v13;
  sub_100023EF0();
  __chkstk_darwin(v14);
  uint64_t v16 = &v92[-v15];
  uint64_t v17 = sub_10000CCE8((uint64_t *)&unk_100059E30);
  uint64_t v18 = sub_10000DA68(v17);
  __chkstk_darwin(v18);
  sub_100023EB4();
  uint64_t v96 = v19;
  sub_100023EF0();
  __chkstk_darwin(v20);
  uint64_t v99 = &v92[-v21];
  sub_100023EF0();
  __chkstk_darwin(v22);
  uint64_t v97 = &v92[-v23];
  sub_100023EF0();
  uint64_t v25 = __chkstk_darwin(v24);
  id v27 = &v92[-v26];
  uint64_t v28 = __chkstk_darwin(v25);
  unint64_t v30 = &v92[-v29];
  __chkstk_darwin(v28);
  uint64_t v32 = &v92[-v31];
  if (!*(void *)(v1 + 32)) {
    goto LABEL_12;
  }
  sub_100035A60();
  v33();
  sub_10000FA0C((uint64_t)v32, 0, 1, v6);
  uint64_t v101 = a1;
  id v34 = [a1 callUUID];
  sub_10003CD80();

  sub_10000FA0C((uint64_t)v30, 0, 1, v6);
  uint64_t v35 = (uint64_t)&v16[*(int *)(v102 + 48)];
  sub_10000D8DC((uint64_t)v32, (uint64_t)v16, (uint64_t *)&unk_100059E30);
  sub_10000D8DC((uint64_t)v30, v35, (uint64_t *)&unk_100059E30);
  sub_100035A08((uint64_t)v16);
  if (!v36)
  {
    sub_10000D8DC((uint64_t)v16, (uint64_t)v27, (uint64_t *)&unk_100059E30);
    sub_100035A08(v35);
    if (!v36)
    {
      uint64_t v94 = v4;
      uint64_t v47 = v103;
      (*((void (**)(unsigned char *, uint64_t, uint64_t))v103 + 4))(v98, v35, v6);
      sub_1000359C0(&qword_100059FD8, (void (*)(uint64_t))&type metadata accessor for UUID);
      int v93 = sub_10003CFA0();
      uint64_t v48 = (void (*)(void))*((void *)v47 + 1);
      sub_100035AAC();
      v48();
      sub_10000D938((uint64_t)v30, (uint64_t *)&unk_100059E30);
      sub_10000D938((uint64_t)v32, (uint64_t *)&unk_100059E30);
      sub_100035AAC();
      v48();
      uint64_t v4 = v94;
      uint64_t v3 = v2;
      sub_10000D938((uint64_t)v16, (uint64_t *)&unk_100059E30);
      a1 = v101;
      if ((v93 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
    sub_10000D938((uint64_t)v30, (uint64_t *)&unk_100059E30);
    sub_10000D938((uint64_t)v32, (uint64_t *)&unk_100059E30);
    (*((void (**)(unsigned char *, uint64_t))v103 + 1))(v27, v6);
LABEL_10:
    sub_10000D938((uint64_t)v16, &qword_100059FC8);
LABEL_11:
    a1 = v101;
    goto LABEL_12;
  }
  sub_10000D938((uint64_t)v30, (uint64_t *)&unk_100059E30);
  sub_10000D938((uint64_t)v32, (uint64_t *)&unk_100059E30);
  sub_100035A08(v35);
  if (!v36) {
    goto LABEL_10;
  }
  sub_10000D938((uint64_t)v16, (uint64_t *)&unk_100059E30);
LABEL_20:
  uint64_t v49 = *(void *)(v4 + 32);
  if (v49)
  {
    uint64_t v50 = *(void **)(v49 + OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_mediaTokens);
    id v51 = v50;
  }
  else
  {
    uint64_t v50 = 0;
  }
  uint64_t v37 = v101;
  id v52 = [v101 mediaTokens];
  unint64_t v53 = v52;
  if (v50)
  {
    if (v52)
    {
      sub_10000D988(0, &qword_10005A6C0);
      id v54 = v50;
      char v55 = sub_10003D180();

      a1 = v101;
      if (v55)
      {
        uint64_t v37 = v101;
        goto LABEL_13;
      }
      goto LABEL_12;
    }

    goto LABEL_11;
  }
  if (!v52) {
    goto LABEL_13;
  }

  a1 = v37;
LABEL_12:
  sub_10002FB6C(a1);
  uint64_t v37 = a1;
  if (v3) {
    return a1;
  }
LABEL_13:
  a1 = *(char **)(v4 + 24);
  if (!a1) {
    goto LABEL_56;
  }
  uint64_t v94 = v4;
  sub_10000D988(0, &qword_10005A6B8);
  char v38 = *(void **)&a1[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_tuMediaRecordRequest];
  uint64_t v39 = a1;
  a1 = v38;
  char v40 = sub_10003D180();

  if ((v40 & 1) == 0 || v39[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_state])
  {

    uint64_t v41 = *(void **)(v94 + 24);
    if (!v41) {
      goto LABEL_56;
    }
    if (*(void *)(v94 + 32))
    {
      uint64_t v42 = v103;
      uint64_t v43 = v97;
      sub_100035A60();
      v44();
      uint64_t v45 = 0;
      uint64_t v46 = (uint64_t)v100;
    }
    else
    {
      uint64_t v45 = 1;
      uint64_t v42 = v103;
      uint64_t v46 = (uint64_t)v100;
      uint64_t v43 = v97;
    }
    sub_10000FA0C((uint64_t)v43, v45, 1, v6);
    uint64_t v101 = v41;
    id v56 = [v37 callUUID];
    id v57 = v99;
    sub_10003CD80();

    sub_10000FA0C((uint64_t)v57, 0, 1, v6);
    uint64_t v58 = v46 + *(int *)(v102 + 48);
    sub_10000D8DC((uint64_t)v43, (uint64_t)v100, (uint64_t *)&unk_100059E30);
    a1 = v100;
    sub_10000D8DC((uint64_t)v57, v58, (uint64_t *)&unk_100059E30);
    sub_100035A08((uint64_t)a1);
    if (v36)
    {
      sub_10000D938((uint64_t)v57, (uint64_t *)&unk_100059E30);
      a1 = v100;
      sub_10000D938((uint64_t)v43, (uint64_t *)&unk_100059E30);
      sub_100035A08(v58);
      if (v36)
      {
        sub_10000D938((uint64_t)a1, (uint64_t *)&unk_100059E30);
        unint64_t v59 = v101;
        goto LABEL_45;
      }
    }
    else
    {
      uint64_t v60 = v96;
      sub_10000D8DC((uint64_t)a1, v96, (uint64_t *)&unk_100059E30);
      sub_100035A08(v58);
      if (!v61)
      {
        uint64_t v69 = v6;
        uint64_t v70 = v98;
        (*((void (**)(unsigned char *, uint64_t, uint64_t))v42 + 4))(v98, v58, v69);
        sub_1000359C0(&qword_100059FD8, (void (*)(uint64_t))&type metadata accessor for UUID);
        char v71 = sub_10003CFA0();
        os_log_type_t v72 = v42;
        uint64_t v73 = v3;
        unsigned __int8 v74 = (void (*)(void))*((void *)v72 + 1);
        ((void (*)(unsigned char *, uint64_t))v74)(v70, v69);
        sub_10000D938((uint64_t)v99, (uint64_t *)&unk_100059E30);
        sub_10000D938((uint64_t)v97, (uint64_t *)&unk_100059E30);
        sub_100035AAC();
        v74();
        uint64_t v3 = v73;
        sub_10000D938((uint64_t)a1, (uint64_t *)&unk_100059E30);
        unint64_t v59 = v101;
        if (v71)
        {
LABEL_45:
          if (v59[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_state])
          {
            uint64_t v102 = v3;
            if (qword_100059760 != -1) {
              swift_once();
            }
            uint64_t v75 = sub_10003CEA0();
            sub_10000CD54(v75, (uint64_t)qword_10005B8B0);
            uint64_t v76 = v59;
            uint64_t v77 = sub_10003CE80();
            os_log_type_t v78 = sub_10003D100();
            if (os_log_type_enabled(v77, v78))
            {
              uint64_t v79 = (uint8_t *)sub_10001D70C();
              long long v100 = (char *)sub_10001D7CC();
              uint64_t v105 = (uint64_t)v100;
              uint64_t v99 = v79;
              *(_DWORD *)uint64_t v79 = 136446210;
              long long v98 = v79 + 4;
              uint64_t v104 = (uint64_t)v76;
              type metadata accessor for MediaRequest();
              uint64_t v101 = v37;
              uint64_t v80 = v76;
              uint64_t v81 = sub_10003CFF0();
              uint64_t v104 = sub_10000CE00(v81, v82, &v105);
              sub_10003D1B0();

              uint64_t v37 = v101;
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v77, v78, "Ending existing moments request before starting the next %{public}s", v99, 0xCu);
              swift_arrayDestroy();
              sub_10000DA3C();
              sub_10000DA3C();
            }
            else
            {
            }
            a1 = v103;
            uint64_t v83 = v95;
            sub_100035A60();
            v84();
            uint64_t v85 = v102;
            sub_100031C84(v83);
            if (v85)
            {
              uint64_t v86 = sub_100035A94();
              v87(v86);

              return a1;
            }
            uint64_t v88 = sub_100035A94();
            v89(v88);
            uint64_t v3 = 0;
          }
        }
LABEL_55:

LABEL_56:
        uint64_t v90 = sub_10003142C(v37);
        if (!v3) {
          return (char *)v90;
        }
        return a1;
      }
      sub_10000D938((uint64_t)v99, (uint64_t *)&unk_100059E30);
      sub_10000D938((uint64_t)v43, (uint64_t *)&unk_100059E30);
      (*((void (**)(uint64_t, uint64_t))v42 + 1))(v60, v6);
    }
    sub_10000D938((uint64_t)a1, &qword_100059FC8);
    unint64_t v59 = v101;
    goto LABEL_55;
  }
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v62 = sub_10003CEA0();
  sub_10000CD54(v62, (uint64_t)qword_10005B8B0);
  a1 = v39;
  uint64_t v63 = sub_10003CE80();
  os_log_type_t v64 = sub_10003D0E0();
  if (os_log_type_enabled(v63, v64))
  {
    uint64_t v65 = sub_10001D70C();
    uint64_t v102 = v3;
    uint64_t v66 = (uint8_t *)v65;
    uint64_t v105 = sub_10001D7CC();
    *(_DWORD *)uint64_t v66 = 136446210;
    uint64_t v104 = (uint64_t)a1;
    type metadata accessor for MediaRequest();
    a1 = a1;
    uint64_t v67 = sub_10003CFF0();
    uint64_t v104 = sub_10000CE00(v67, v68, &v105);
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v63, v64, "Using pre-warmed request %{public}s", v66, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
  }
  return a1;
}

uint64_t sub_10003142C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10003CDA0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void **)(v1 + 32);
  if (v9)
  {
    uint64_t v10 = v9;
    sub_10003CD90();
    uint64_t v1 = (uint64_t)v10;
    sub_10000BABC(a1, v16);
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    else
    {
      uint64_t v17 = *(uint64_t (**)(char *, void *, void *, id))(v3 + 88);
      uint64_t v12 = *(void **)&v10[OBJC_IVAR____TtC18FTLivePhotoService12MediaMoments_queue];
      swift_retain();
      id v13 = v12;
      uint64_t v1 = v17(v8, v16, a1, v13);

      swift_release();
      sub_10000D5B8((uint64_t)v16);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
  }
  else
  {
    sub_100023B2C();
    swift_allocError();
    *uint64_t v11 = 0;
    swift_willThrow();
  }
  return v1;
}

void sub_1000315FC(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_10003CEA0();
  sub_10000CD54(v8, (uint64_t)qword_10005B8B0);
  id v9 = a1;
  uint64_t v10 = sub_10003CE80();
  os_log_type_t v11 = sub_10003D0E0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)sub_10001D70C();
    uint64_t v21 = sub_10001D7CC();
    *(_DWORD *)uint64_t v12 = 136446210;
    sub_10000D988(0, &qword_10005A6B0);
    id v13 = v9;
    uint64_t v14 = sub_10003CFF0();
    sub_10000CE00(v14, v15, &v21);
    sub_10003D1B0();

    uint64_t v4 = v3;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "MediaRecordingController prewarm using %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
  }
  uint64_t v16 = sub_100030888((char *)v9);
  if (!v4)
  {
    uint64_t v17 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v16;
    uint64_t v18 = v16;

    uint64_t v19 = &v18[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_uuid];
    sub_10003CDA0();
    sub_10000DA20();
    (*(void (**)(uint64_t, char *))(v20 + 16))(a2, v19);
  }
}

void sub_100031850(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v7 = sub_10003CDA0();
  sub_10000D9D8();
  uint64_t v38 = v8;
  __chkstk_darwin(v9);
  sub_10001D6C0();
  uint64_t v37 = v10;
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_10003CEA0();
  sub_10000CD54(v11, (uint64_t)qword_10005B8B0);
  id v12 = a1;
  id v13 = sub_10003CE80();
  os_log_type_t v14 = sub_10003D0E0();
  unint64_t v15 = "4";
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v35 = v7;
    uint64_t v16 = (uint8_t *)sub_10001D70C();
    uint64_t v40 = sub_10001D7CC();
    *(_DWORD *)uint64_t v16 = 136446210;
    sub_10000D988(0, &qword_10005A6B0);
    id v17 = v12;
    uint64_t v18 = sub_10003CFF0();
    uint64_t v20 = sub_10000CE00(v18, v19, &v40);
    sub_10000DA54(v20);
    unint64_t v15 = "v28@0:8@16I24" + 12;
    sub_10003D1B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "MediaRecordingController startRecordingMessage using %{public}s", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v4 = v3;
    sub_10000DA3C();
    uint64_t v7 = v35;
    sub_10000DA3C();
  }
  else
  {
  }
  uint64_t v21 = sub_100030888((char *)v12);
  if (!v4)
  {
    uint64_t v22 = v21;
    sub_10000DCDC();
    uint64_t v23 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v22;
    uint64_t v24 = v22;

    uint64_t v25 = v24;
    uint64_t v26 = sub_10003CE80();
    os_log_type_t v27 = sub_10003D0E0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)sub_10001D70C();
      uint64_t v40 = sub_10001D7CC();
      *(_DWORD *)uint64_t v28 = *((void *)v15 + 121);
      char v36 = *(void (**)(uint64_t, char *, uint64_t))(v38 + 16);
      sub_100035A60();
      v29();
      sub_1000359C0(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v30 = sub_10003D320();
      uint64_t v31 = v7;
      unint64_t v33 = v32;
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v31);
      uint64_t v34 = sub_10000CE00(v30, v33, &v40);
      sub_10000DA54(v34);
      sub_10003D1B0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "MediaRecordingController started recording with UUID %{public}s", v28, 0xCu);
      swift_arrayDestroy();
      sub_10000DA3C();
      sub_10000DA3C();

      v36(a2, &v25[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_uuid], v31);
    }
    else
    {

      (*(void (**)(uint64_t, char *, uint64_t))(v38 + 16))(a2, &v25[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_uuid], v7);
    }
  }
}

void sub_100031C84(uint8_t *a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  uint64_t v7 = sub_10000DA68(v6);
  __chkstk_darwin(v7);
  sub_10001D6C0();
  os_log_type_t v84 = v8;
  sub_10003CD40();
  sub_10000D9D8();
  uint64_t v77 = v10;
  uint64_t v78 = v9;
  __chkstk_darwin(v9);
  sub_10001D6C0();
  uint64_t v76 = v11;
  uint64_t v12 = sub_10003CDA0();
  sub_10000D9D8();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_100023EB4();
  uint64_t v79 = v16;
  sub_100023EF0();
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)v74 - v19;
  __chkstk_darwin(v18);
  if (qword_100059760 != -1) {
    swift_once();
  }
  v74[1] = v20;
  uint64_t v21 = sub_10003CEA0();
  uint64_t v22 = sub_10000CD54(v21, (uint64_t)qword_10005B8B0);
  uint64_t v23 = *(void *)(v14 + 16);
  uint64_t v86 = a1;
  uint64_t v80 = v23;
  uint64_t v81 = v14 + 16;
  sub_100035A60();
  v24();
  uint64_t v82 = v22;
  uint64_t v25 = sub_10003CE80();
  os_log_type_t v26 = sub_10003D120();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = sub_10001D70C();
    v74[0] = v2;
    uint64_t v28 = (uint8_t *)v27;
    uint64_t v29 = sub_10001D7CC();
    uint64_t v75 = v4;
    v85[0] = v29;
    *(_DWORD *)uint64_t v28 = 136446210;
    uint64_t v83 = v14;
    sub_1000359C0(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v30 = sub_10003D320();
    uint64_t v32 = sub_10000CE00(v30, v31, v85);
    sub_100035A4C(v32);
    uint64_t v14 = v83;
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    unint64_t v33 = *(void (**)(uint64_t))(v14 + 8);
    uint64_t v34 = sub_100035A84();
    v33(v34);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "MediaRecordingController will end recording with UUID %{public}s", v28, 0xCu);
    swift_arrayDestroy();
    uint64_t v4 = v75;
    sub_10000DA3C();
    uint64_t v3 = v74[0];
    sub_10000DA3C();
  }
  else
  {
    unint64_t v33 = *(void (**)(uint64_t))(v14 + 8);
    uint64_t v35 = sub_100035A84();
    v33(v35);
  }

  char v36 = *(void **)(v4 + 24);
  uint64_t v37 = (uint64_t)v84;
  if (v36)
  {
    if (*((unsigned char *)v36 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_state) == 3)
    {
      uint64_t v38 = (uint64_t)v36 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_videoURL;
      swift_beginAccess();
      sub_10000D8DC(v38, v37, (uint64_t *)&unk_100059C70);
      uint64_t v39 = v78;
      if (sub_10000CD2C(v37, 1, v78) != 1)
      {
        uint64_t v52 = v37;
        uint64_t v54 = v76;
        uint64_t v53 = v77;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 32))(v76, v52, v39);
        if (*(void *)(v4 + 40))
        {
          id v55 = v36;
          swift_retain();
          sub_10003CF10();
          swift_release();
        }
        else
        {
          id v66 = v36;
        }
        *(void *)(v4 + 40) = 0;
        swift_release();
        sub_1000324AC((uint64_t)v36, v54);

        (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v54, v39);
LABEL_26:
        uint64_t v73 = *(void **)(v4 + 24);
        *(void *)(v4 + 24) = 0;

        return;
      }
      id v40 = v36;
      sub_10000D938(v37, (uint64_t *)&unk_100059C70);
    }
    else
    {
      id v49 = v36;
    }
    sub_100032C8C();
    if (v3)
    {

      return;
    }
    sub_10000DDB4();
    uint64_t v83 = v14;
    uint64_t v75 = v4;
    sub_100035A60();
    v56();
    id v57 = sub_10003CE80();
    os_log_type_t v58 = sub_10003D0E0();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v60 = (uint8_t *)sub_10001D70C();
      uint64_t v61 = sub_10001D7CC();
      v74[0] = 0;
      v85[0] = v61;
      uint64_t v86 = v60;
      *(_DWORD *)uint64_t v60 = 136446210;
      os_log_type_t v84 = v60 + 4;
      sub_1000359C0(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v62 = sub_10003D320();
      uint64_t v64 = sub_10000CE00(v62, v63, v85);
      sub_100035A4C(v64);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      uint64_t v65 = sub_100035A6C();
      v33(v65);
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "MediaRecordingController ended recording with UUID %{public}s", v86, 0xCu);
      swift_arrayDestroy();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
      uint64_t v67 = sub_100035A6C();
      v33(v67);
    }

    sub_10000CD8C((uint64_t)v36 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_request, (uint64_t)v85);
    sub_10000E400(v85, v85[3]);
    sub_100035B18();
    uint64_t v69 = v68();
    uint64_t v71 = v70;
    uint64_t v4 = v75;
    swift_beginAccess();
    id v72 = v36;
    sub_100033A48((uint64_t)v72, v69, v71, &qword_10005A6A8);
    swift_endAccess();

    swift_bridgeObjectRelease();
    sub_10000D5B8((uint64_t)v85);
    goto LABEL_26;
  }
  uint64_t v41 = v79;
  sub_100035A60();
  v42();
  uint64_t v43 = sub_10003CE80();
  os_log_type_t v44 = sub_10003D100();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = (uint8_t *)sub_10001D70C();
    v85[0] = sub_10001D7CC();
    uint64_t v83 = v14;
    *(_DWORD *)uint64_t v45 = 136446210;
    uint64_t v86 = v45 + 4;
    sub_1000359C0(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v46 = sub_10003D320();
    uint64_t v48 = sub_10000CE00(v46, v47, v85);
    sub_100035A4C(v48);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, uint64_t))v33)(v41, v12);
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Invalid state, no current request %{public}s", v45, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    uint64_t v50 = sub_100035A84();
    v33(v50);
  }

  sub_100023B2C();
  swift_allocError();
  *id v51 = 0;
  swift_willThrow();
}

void sub_1000324AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v71 = a2;
  uint64_t v5 = sub_10003CDA0();
  uint64_t v69 = *(void *)(v5 - 8);
  uint64_t v70 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v58 - v12;
  uint64_t v14 = sub_10003CD40();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v58 - v20;
  __chkstk_darwin(v19);
  unint64_t v68 = (char *)&v58 - v22;
  *(void *)(v3 + 40) = 0;
  swift_release();
  if ([*(id *)(v3 + 16) transcriptionEvaluationEnabled])
  {
    uint64_t v67 = a1;
    uint64_t v23 = a1 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_evalDirectoryURL;
    swift_beginAccess();
    sub_10000D8DC(v23, (uint64_t)v13, (uint64_t *)&unk_100059C70);
    if (sub_10000CD2C((uint64_t)v13, 1, v14) == 1)
    {
      sub_10000D938((uint64_t)v13, (uint64_t *)&unk_100059C70);
    }
    else
    {
      uint64_t v64 = v7;
      uint64_t v24 = v68;
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v68, v13, v14);
      if (qword_100059760 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_10003CEA0();
      uint64_t v26 = sub_10000CD54(v25, (uint64_t)qword_10005B8B0);
      uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
      v27(v21, v24, v14);
      unint64_t v63 = (void *)v26;
      uint64_t v28 = sub_10003CE80();
      os_log_type_t v29 = sub_10003D0E0();
      LODWORD(v62) = v29;
      if (os_log_type_enabled(v28, v29))
      {
        os_log_t v61 = v28;
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        uint64_t v60 = (void *)swift_slowAlloc();
        id v73 = v60;
        unint64_t v59 = v30;
        *(_DWORD *)uint64_t v30 = 136315138;
        id v66 = (void (*)(char *, uint64_t))(v30 + 4);
        v27(v11, v21, v14);
        sub_10000FA0C((uint64_t)v11, 0, 1, v14);
        uint64_t v31 = sub_10000BFF0((uint64_t)v11);
        unint64_t v33 = v32;
        sub_10000D938((uint64_t)v11, (uint64_t *)&unk_100059C70);
        uint64_t v72 = sub_10000CE00(v31, v33, (uint64_t *)&v73);
        sub_10003D1B0();
        swift_bridgeObjectRelease();
        uint64_t v34 = *(void (**)(char *, uint64_t))(v15 + 8);
        uint64_t v65 = (v15 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        id v66 = v34;
        v34(v21, v14);
        uint64_t v28 = v61;
        _os_log_impl((void *)&_mh_execute_header, v61, (os_log_type_t)v62, "Copying audio to temp directory for automation evaluation %s", v59, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        uint64_t v35 = *(void (**)(char *, uint64_t))(v15 + 8);
        uint64_t v65 = (v15 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        id v66 = v35;
        v35(v21, v14);
      }

      uint64_t v7 = v64;
      id v36 = [self defaultManager];
      sub_10003CCD0(v37);
      uint64_t v39 = v38;
      sub_10003CCB0();
      id v40 = v68;
      sub_10003CCE0();
      swift_bridgeObjectRelease();
      sub_10003CCD0(v41);
      uint64_t v43 = v42;
      v66(v18, v14);
      id v73 = 0;
      unsigned int v44 = [v36 copyItemAtURL:v39 toURL:v43 error:&v73];

      id v45 = v73;
      if (v44)
      {
        uint64_t v46 = v40;
      }
      else
      {
        unint64_t v47 = v45;
        uint64_t v48 = sub_10003CC90();

        swift_willThrow();
        swift_errorRetain();
        swift_errorRetain();
        id v49 = sub_10003CE80();
        int v50 = sub_10003D0E0();
        if (os_log_type_enabled(v49, (os_log_type_t)v50))
        {
          uint64_t v51 = swift_slowAlloc();
          unint64_t v63 = (void *)swift_slowAlloc();
          id v73 = v63;
          uint64_t v62 = (uint8_t *)v51;
          *(_DWORD *)uint64_t v51 = 136315138;
          os_log_t v61 = (os_log_t)(v51 + 4);
          uint64_t v72 = v48;
          swift_errorRetain();
          sub_10000CCE8((uint64_t *)&unk_100059D70);
          uint64_t v52 = sub_10003CFF0();
          uint64_t v72 = sub_10000CE00(v52, v53, (uint64_t *)&v73);
          uint64_t v7 = v64;
          sub_10003D1B0();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v49, (os_log_type_t)v50, "Error copying audio to temp directory %s", v62, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_errorRelease();
          swift_errorRelease();
        }
        swift_errorRelease();
        uint64_t v46 = v68;
      }
      v66(v46, v14);
    }
    a1 = v67;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v7, a1 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_uuid, v70);
  sub_10000D988(0, &qword_10005A6A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v71, v14);
  id v54 = sub_100033084((uint64_t)v18);
  id v55 = objc_allocWithZone((Class)TUMomentsRawVideoMessageDescriptor);
  id v56 = sub_100033120((uint64_t)v7, v54);
  id v57 = *(void (**)(id))(v3 + 56);
  if (v57)
  {
    swift_retain();
    v57(v56);
    sub_10000CDF0((uint64_t)v57);
  }
}

void sub_100032C8C()
{
  uint64_t v1 = sub_10003CDA0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void **)(v0 + 24);
  if (v5)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, (uint64_t)v5 + OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_uuid, v1);
    id v6 = v5;
    char v7 = sub_10003CD70();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    if ((v7 & 1) == 0)
    {
      sub_100023B2C();
      swift_allocError();
      *uint64_t v8 = 1;
      swift_willThrow();
    }
  }
  else
  {
    sub_100023B2C();
    swift_allocError();
    unsigned char *v9 = 0;
    swift_willThrow();
  }
}

uint64_t sub_100032E14()
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000CDF0(*(void *)(v0 + 56));
  sub_10000CDF0(*(void *)(v0 + 72));
  swift_release();
  return v0;
}

uint64_t sub_100032E6C()
{
  sub_100032E14();

  return _swift_deallocClassInstance(v0, 104, 7);
}

uint64_t type metadata accessor for MediaRecordingController()
{
  return self;
}

uint64_t sub_100032EC4()
{
  *(void *)(v0 + 16) = [objc_allocWithZone((Class)TUFeatureFlags) init];
  type metadata accessor for MediaRequest();
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 48) = sub_10003CF80();
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(void *)(v0 + 88) = sub_10002FA30;
  *(void *)(v0 + 96) = 0;
  return v0;
}

void sub_100032F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    uint64_t v5 = qword_100059760;
    id v6 = v2;
    if (v5 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_10003CEA0();
    sub_10000CD54(v7, (uint64_t)qword_10005B8B0);
    uint64_t v8 = sub_10003CE80();
    os_log_type_t v9 = sub_10003D0E0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Hit timeout for ending request!", v10, 2u);
      swift_slowDealloc();
    }

    sub_1000324AC((uint64_t)v6, a2);
    uint64_t v11 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

id sub_100033084(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_10003CCD0(v3);
  uint64_t v5 = v4;
  id v6 = [v2 initWithURL:v4];

  uint64_t v7 = sub_10003CD40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  return v6;
}

id sub_100033120(uint64_t a1, void *a2)
{
  Class isa = sub_10003CD60().super.isa;
  id v5 = [v2 initWithUUID:isa videoURL:a2];

  sub_10003CDA0();
  sub_10000DA20();
  sub_10000DA30();
  v6();
  return v5;
}

unint64_t sub_1000331AC(uint64_t a1, uint64_t a2)
{
  sub_10003D3A0();
  sub_10003D000();
  Swift::Int v4 = sub_10003D3C0();

  return sub_1000332BC(a1, a2, v4);
}

unint64_t sub_100033224(uint64_t a1)
{
  sub_10003CDA0();
  sub_1000359C0(&qword_10005A6D0, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v2 = sub_10003CF90();

  return sub_1000333A0(a1, v2);
}

unint64_t sub_1000332BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10003D330() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10003D330() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000333A0(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_10003CDA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1000359C0(&qword_100059FD8, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v15 = sub_10003CFA0();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_100033560@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100033224(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v3;
    uint64_t v9 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    Swift::Int v10 = *(void *)(v9 + 24);
    sub_10000CCE8(&qword_10005A6D8);
    sub_10003D2B0(isUniquelyReferenced_nonNull_native, v10);
    sub_10003CDA0();
    sub_10000DA20();
    sub_10000DA30();
    v11();
    uint64_t v12 = *(void *)(v20 + 56);
    uint64_t v13 = type metadata accessor for MessageRequest();
    sub_10000DA20();
    sub_10000D7B8(v12 + *(void *)(v14 + 72) * v6, a2);
    sub_1000359C0(&qword_10005A6D0, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_10003D2C0();
    *uint64_t v3 = v20;
    swift_bridgeObjectRelease();
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = 1;
    uint64_t v18 = v13;
  }
  else
  {
    type metadata accessor for MessageRequest();
    uint64_t v15 = sub_100035B04();
  }

  return sub_10000FA0C(v15, v16, v17, v18);
}

uint64_t sub_100033704(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100033224(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_100035ABC();
  Swift::Int v8 = *(void *)(v7 + 24);
  sub_10000CCE8(&qword_10005A6E0);
  sub_10003D2B0(isUniquelyReferenced_nonNull_native, v8);
  sub_10003CDA0();
  sub_10000DA20();
  sub_10000DA30();
  v9();
  uint64_t v10 = *(void *)(*(void *)(v12 + 56) + 8 * v4);
  sub_10000D988(0, &qword_100059EB0);
  sub_1000359C0(&qword_10005A6D0, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_10003D2C0();
  void *v2 = v12;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100033864(uint64_t a1, uint64_t a2)
{
  return sub_100033884(a1, a2, &qword_10005A6C8, (void (*)(void))type metadata accessor for LivePhotosMomentsRequest);
}

uint64_t sub_100033884(uint64_t a1, uint64_t a2, uint64_t *a3, void (*a4)(void))
{
  uint64_t v7 = v4;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_1000331AC(a1, a2);
  LOBYTE(a2) = v11;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_100035ABC();
  Swift::Int v14 = *(void *)(v13 + 24);
  sub_10000CCE8(a3);
  sub_10003D2B0(isUniquelyReferenced_nonNull_native, v14);
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(*(void *)(v17 + 56) + 8 * v10);
  a4(0);
  sub_10003D2C0();
  *uint64_t v7 = v17;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_100033994()
{
  sub_100035AE4();
  uint64_t v1 = sub_100035A28();
  sub_100033AE0(v1, v2, v3);
  void *v0 = v5;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000339E8()
{
  sub_100035AE4();
  uint64_t v1 = sub_100035A28();
  sub_100033CB4(v1, v2, v3);
  void *v0 = v5;

  return swift_bridgeObjectRelease();
}

uint64_t sub_100033A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100033A48(a1, a2, a3, &qword_10005A6C8);
}

uint64_t sub_100033A48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v4;
  uint64_t *v4 = 0x8000000000000000;
  sub_100033E44(a1, a2, a3, isUniquelyReferenced_nonNull_native, a4);
  uint64_t *v4 = v11;

  return swift_bridgeObjectRelease();
}

uint64_t sub_100033AE0(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = sub_10003CDA0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v13 = sub_100033224(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  sub_10000CCE8(&qword_10005A6D8);
  if (!sub_10003D2B0(a3 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_100033224(a2);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_11:
    uint64_t result = sub_10003D340();
    __break(1u);
    return result;
  }
  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = *v4;
  if (v19)
  {
    uint64_t v23 = v22[7];
    uint64_t v24 = v23 + *(void *)(*(void *)(type metadata accessor for MessageRequest() - 8) + 72) * v18;
    return sub_1000342E8(a1, v24);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    return sub_10003410C(v18, (uint64_t)v11, a1, v22);
  }
}

void sub_100033CB4(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = sub_10003CDA0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v13 = sub_100033224(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  sub_10000CCE8(&qword_10005A6E0);
  if (!sub_10003D2B0(a3 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_100033224(a2);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_10:
    sub_10003D340();
    __break(1u);
    return;
  }
  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = *v4;
  if (v19)
  {
    uint64_t v23 = v22[7];

    *(void *)(v23 + 8 * v18) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    sub_1000341E8(v18, (uint64_t)v11, a1, v22);
  }
}

void sub_100033E44(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v13 = sub_1000331AC(a2, a3);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  sub_10000CCE8(a5);
  if (!sub_10003D2B0(a4 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_1000331AC(a2, a3);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_11:
    sub_10003D340();
    __break(1u);
    return;
  }
  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = *v7;
  if (v19)
  {
    uint64_t v23 = v22[7];

    *(void *)(v23 + 8 * v18) = a1;
  }
  else
  {
    sub_1000342A0(v18, a2, a3, a1, v22);
    swift_bridgeObjectRetain();
  }
}

void sub_100033F7C(uint64_t a1, uint64_t a2)
{
  sub_100030794(a1, a2, v2);
}

uint64_t sub_100033F84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100033FEC()
{
  uint64_t v1 = sub_10003CD40();
  sub_10000D9D8();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 24) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return _swift_deallocObject(v0, v8, v9);
}

void sub_100034090()
{
  uint64_t v1 = *(void *)(sub_10003CD40() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_100032F4C(v2, v3);
}

uint64_t sub_1000340F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100034104()
{
  return swift_release();
}

uint64_t sub_10003410C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_10003CDA0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for MessageRequest();
  uint64_t result = sub_10000D7B8(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_1000341E8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_10003CDA0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

unint64_t sub_1000342A0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_1000342E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_10003434C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, unsigned char *a6)
{
  id v219 = a5;
  uint64_t v11 = sub_10003CDE0();
  __chkstk_darwin(v11 - 8);
  v196 = (char *)v185 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  __chkstk_darwin(v13 - 8);
  v187 = (char *)v185 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v216 = sub_10003CCA0();
  v218 = *(void **)(v216 - 8);
  __chkstk_darwin(v216);
  v214 = (char *)v185 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10003CD40();
  uint64_t v209 = *(void *)(v16 - 8);
  uint64_t v17 = __chkstk_darwin(v16);
  v190 = (char *)v185 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  v191 = (char *)v185 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v188 = (char *)v185 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  v189 = (char *)v185 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v192 = (char *)v185 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  v193 = (char *)v185 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  v212 = (char *)v185 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  v215 = (char *)v185 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v35 = (char *)v185 - v34;
  uint64_t v36 = __chkstk_darwin(v33);
  uint64_t v38 = (char *)v185 - v37;
  __chkstk_darwin(v36);
  id v40 = (char *)v185 - v39;
  uint64_t v217 = v16;
  sub_10000FA0C((uint64_t)&a6[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_videoURL], 1, 1, v16);
  uint64_t v194 = OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_localCaptionsMachine;
  *(void *)&a6[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_localCaptionsMachine] = 0;
  uint64_t v195 = OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_remoteCaptionsMachine;
  *(void *)&a6[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_remoteCaptionsMachine] = 0;
  v186 = &a6[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_evalDirectoryURL];
  sub_10000FA0C((uint64_t)&a6[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_evalDirectoryURL], 1, 1, v16);
  uint64_t v41 = &a6[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_uuid];
  uint64_t v42 = sub_10003CDA0();
  uint64_t v200 = *(void *)(v42 - 8);
  uint64_t v43 = *(void (**)(char *, uint64_t))(v200 + 16);
  uint64_t v203 = a1;
  uint64_t v201 = v42;
  v43(v41, a1);
  uint64_t v202 = a2;
  sub_10000CD8C(a2, (uint64_t)&a6[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_request]);
  *(void *)&a6[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_tuMediaRecordRequest] = a3;
  *(void *)&a6[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_queue] = a4;
  a6[OBJC_IVAR____TtC18FTLivePhotoService12MediaRequest_state] = 0;
  v197 = a6;
  v207 = a6;
  unsigned int v44 = a3;
  id v206 = a4;
  id v45 = [v44 sandboxURL];
  id v46 = [v45 URL];

  sub_10003CD00();
  id v47 = [v44 localCaptionsFileName];
  uint64_t v48 = (void *)sub_10003CFC0();
  uint64_t v50 = v49;

  id v222 = v48;
  uint64_t v223 = v50;
  uint64_t v51 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v52 = v218;
  unint64_t v53 = v218 + 13;
  v208 = (void (*)(char *, void, uint64_t))v218[13];
  id v54 = v214;
  uint64_t v55 = v216;
  v208(v214, enum case for URL.DirectoryHint.inferFromPath(_:), v216);
  unint64_t v204 = sub_10000F9C0();
  sub_10003CD20();
  id v56 = (void (*)(char *, uint64_t))v52[1];
  v218 = v52 + 1;
  v205 = v56;
  v56(v54, v55);
  swift_bridgeObjectRelease();
  uint64_t v57 = v209 + 8;
  uint64_t v58 = *(void (**)(char *, uint64_t))(v209 + 8);
  v199 = v35;
  uint64_t v59 = v217;
  v58(v35, v217);
  v213 = v40;
  uint64_t v60 = v57;
  sub_10003CCF0();
  v58(v38, v59);
  id v61 = [v44 sandboxURL];
  id v62 = [v61 URL];

  sub_10003CD00();
  unint64_t v63 = v44;
  id v64 = [v44 remoteCaptionsFileName];
  uint64_t v65 = (void *)sub_10003CFC0();
  uint64_t v67 = v66;

  id v222 = v65;
  uint64_t v223 = v67;
  uint64_t v68 = v59;
  uint64_t v69 = v216;
  uint64_t v70 = v58;
  uint64_t v71 = v53;
  uint64_t v72 = v214;
  unsigned int v198 = v51;
  id v73 = v70;
  v208(v214, v51, v216);
  unsigned __int8 v74 = v212;
  uint64_t v75 = v199;
  sub_10003CD20();
  v205(v72, v69);
  uint64_t v76 = v63;
  swift_bridgeObjectRelease();
  v73(v75, v68);
  sub_10003CCF0();
  uint64_t v211 = v60;
  v210 = v73;
  v73(v74, v68);
  int v77 = TUCallTranscriptionSupported();
  v212 = v63;
  if (!v77
    || [v219 offlineTranscriptionEnabled]
    && ![v219 transcriptionEvaluationEnabled])
  {
    id v131 = v207;

    if (qword_100059760 != -1) {
      swift_once();
    }
    uint64_t v132 = sub_10003CEA0();
    sub_10000CD54(v132, (uint64_t)qword_10005B8B0);
    swift_unknownObjectRetain_n();
    v133 = sub_10003CE80();
    os_log_type_t v134 = sub_10003D120();
    if (os_log_type_enabled(v133, v134))
    {
      uint64_t v135 = swift_slowAlloc();
      v218 = (void *)swift_slowAlloc();
      id v222 = v218;
      *(_DWORD *)uint64_t v135 = 136315650;
      id v136 = (id)TUCallTranscriptionSupportedLocales();
      sub_10003D040();

      uint64_t v137 = sub_10003D050();
      unint64_t v139 = v138;
      swift_bridgeObjectRelease();
      uint64_t v221 = sub_10000CE00(v137, v139, (uint64_t *)&v222);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v135 + 12) = 2080;
      id v140 = (id)TUCurrentLocaleIdentifier();
      uint64_t v141 = sub_10003CFC0();
      unint64_t v143 = v142;

      uint64_t v221 = sub_10000CE00(v141, v143, (uint64_t *)&v222);
      sub_10003D1B0();
      id v144 = v219;
      swift_bridgeObjectRelease();
      *(_WORD *)(v135 + 22) = 2080;
      LOBYTE(v221) = [v144 offlineTranscriptionEnabled];
      uint64_t v145 = sub_10003CFF0();
      uint64_t v221 = sub_10000CE00(v145, v146, (uint64_t *)&v222);
      sub_10003D1B0();

      id v131 = v207;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v133, v134, "Not creating captions machines since we're only transcribing calls for %s, current locale is %s. Or feature flag for offline transcription is turned on %s", (uint8_t *)v135, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v147 = v217;
      v148 = v210;
      v210(v215, v217);
      v148(v213, v147);
      goto LABEL_19;
    }

    id v149 = v219;
    v150 = v215;
    goto LABEL_16;
  }
  v185[1] = v71;
  if ([v219 transcriptionEvaluationEnabled])
  {
    uint64_t v78 = v75;
    sub_10003CCC0();
    id v79 = [v63 sandboxURL];
    id v80 = [v79 URL];

    uint64_t v81 = v192;
    sub_10003CD00();

    uint64_t v82 = (void *)sub_10003CCB0();
    uint64_t v84 = v83;
    uint64_t v85 = v217;
    uint64_t v86 = v210;
    v210(v81, v217);
    id v222 = v82;
    uint64_t v223 = v84;
    uint64_t v87 = v216;
    v208(v72, v198, v216);
    uint64_t v88 = v193;
    sub_10003CD20();
    uint64_t v89 = v87;
    uint64_t v90 = v205;
    v205(v72, v89);
    swift_bridgeObjectRelease();
    v86(v78, v85);
    id v91 = [self defaultManager];
    sub_10003CCD0(v92);
    uint64_t v94 = v93;
    id v222 = 0;
    LODWORD(v86) = [v91 createDirectoryAtURL:v93 withIntermediateDirectories:1 attributes:0 error:&v222];

    id v95 = v222;
    if (v86)
    {
      uint64_t v96 = v72;
      uint64_t v97 = v90;
      uint64_t v98 = (uint64_t)v187;
      uint64_t v99 = v88;
      uint64_t v100 = v217;
      (*(void (**)(char *, char *, uint64_t))(v209 + 16))(v187, v99, v217);
      sub_10000FA0C(v98, 0, 1, v100);
      uint64_t v101 = (uint64_t)v186;
      swift_beginAccess();
      id v102 = v95;
      sub_100033F84(v98, v101);
      swift_endAccess();
      id v103 = [v76 localCaptionsFileName];
      uint64_t v104 = (void *)sub_10003CFC0();
      uint64_t v106 = v105;

      id v222 = v104;
      uint64_t v223 = v106;
      CMTimeValue v107 = v96;
      uint64_t v108 = v216;
      v208(v96, v198, v216);
      uint64_t v109 = v188;
      sub_10003CD20();
      v97(v96, v108);
      swift_bridgeObjectRelease();
      CMTimeValue v110 = v189;
      sub_10003CCF0();
      CFAllocatorRef v111 = v210;
      v210(v109, v100);
      id v112 = *(void (**)(void, void, void))(v209 + 40);
      v209 += 40;
      v199 = (char *)v112;
      v112(v213, v110, v100);
      id v113 = [v212 remoteCaptionsFileName];
      int v114 = (void *)sub_10003CFC0();
      uint64_t v116 = v115;

      id v222 = v114;
      uint64_t v223 = v116;
      v208(v96, v198, v108);
      CMTimeEpoch v117 = v190;
      v118 = v193;
      sub_10003CD20();
      CMTimeScale v119 = v111;
      v205(v107, v108);
      swift_bridgeObjectRelease();
      CMTimeValue v120 = v191;
      sub_10003CCF0();
      v119(v117, v100);
      v119(v118, v100);
      ((void (*)(char *, char *, uint64_t))v199)(v215, v120, v100);
      goto LABEL_7;
    }
    id v176 = v222;
    id v131 = v207;

    sub_10003CC90();
    swift_willThrow();
    v210(v88, v217);
    if (qword_100059760 != -1) {
      swift_once();
    }
    uint64_t v177 = sub_10003CEA0();
    sub_10000CD54(v177, (uint64_t)qword_10005B8B0);
    v178 = sub_10003CE80();
    os_log_type_t v179 = sub_10003D100();
    BOOL v180 = os_log_type_enabled(v178, v179);
    v181 = v215;
    if (v180)
    {
      v182 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v182 = 0;
      _os_log_impl((void *)&_mh_execute_header, v178, v179, "Error while creating captions machine", v182, 2u);
      swift_slowDealloc();
      swift_errorRelease();

      uint64_t v183 = v217;
      v184 = v210;
      v210(v181, v217);
      v184(v213, v183);
      goto LABEL_19;
    }
    swift_errorRelease();

    v150 = v181;
LABEL_16:
    uint64_t v151 = v217;
    v152 = v210;
    v210(v150, v217);
    v152(v213, v151);
    goto LABEL_19;
  }
LABEL_7:
  if (qword_100059760 != -1) {
    swift_once();
  }
  uint64_t v121 = sub_10003CEA0();
  sub_10000CD54(v121, (uint64_t)qword_10005B8B0);
  v122 = sub_10003CE80();
  os_log_type_t v123 = sub_10003D120();
  if (os_log_type_enabled(v122, v123))
  {
    uint64_t v124 = swift_slowAlloc();
    id v222 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v124 = 136315394;
    swift_beginAccess();
    sub_1000359C0((unint64_t *)&qword_100059FE0, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v125 = sub_10003D320();
    uint64_t v221 = sub_10000CE00(v125, v126, (uint64_t *)&v222);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v124 + 12) = 2080;
    v127 = v215;
    swift_beginAccess();
    CMTime v128 = v127;
    uint64_t v129 = sub_10003D320();
    uint64_t v221 = sub_10000CE00(v129, v130, (uint64_t *)&v222);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v122, v123, "Captions URLs: localCaptionsDestinationURL: %s remoteCaptionsDestinationURL: %s", (uint8_t *)v124, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    CMTime v128 = v215;
  }
  type metadata accessor for MediaRequest();
  swift_beginAccess();
  v153 = v206;
  sub_10000DB68(v206, (uint64_t *)&v222);
  id v154 = v212;
  id v155 = [v212 mediaTokens];
  id v156 = [v155 uplinkStreamToken];

  id v157 = [v154 localeIdentifier];
  sub_10003CFC0();

  uint64_t v158 = (uint64_t)v196;
  sub_10003CDB0();
  v159 = (objc_class *)type metadata accessor for CaptionsMachine();
  id v160 = objc_allocWithZone(v159);
  id v161 = v153;
  v162 = sub_1000113D4((uint64_t)&v222, (uint64_t)v156, v158, v161);
  v163 = v197;
  v164 = *(void **)&v197[v194];
  *(void *)&v197[v194] = v162;

  swift_beginAccess();
  sub_10000DB68(v161, (uint64_t *)&v222);
  id v165 = [v154 mediaTokens];
  id v166 = [v165 downlinkStreamToken];

  id v167 = [v154 localeIdentifier];
  sub_10003CFC0();

  sub_10003CDB0();
  id v168 = objc_allocWithZone(v159);
  v169 = sub_1000113D4((uint64_t)&v222, (uint64_t)v166, v158, v161);
  v170 = *(void **)&v163[v195];
  *(void *)&v163[v195] = v169;
  id v131 = v207;

  uint64_t v171 = v217;
  v172 = v210;
  v210(v128, v217);
  v172(v213, v171);
LABEL_19:
  v173 = (objc_class *)type metadata accessor for MediaRequest();
  v220.receiver = v131;
  v220.super_class = v173;
  id v174 = objc_msgSendSuper2(&v220, "init");

  sub_10000D5B8(v202);
  (*(void (**)(uint64_t, uint64_t))(v200 + 8))(v203, v201);
  return v174;
}

uint64_t sub_1000359C0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100035A08(uint64_t a1)
{
  return sub_10000CD2C(a1, 1, v1);
}

uint64_t sub_100035A28()
{
  void *v0 = 0x8000000000000000;
  return v1;
}

uint64_t sub_100035A4C(uint64_t a1)
{
  *(void *)(v1 - 152) = a1;
  return v1 - 152;
}

uint64_t sub_100035A6C()
{
  return v0;
}

uint64_t sub_100035A84()
{
  return v0;
}

uint64_t sub_100035A94()
{
  return v0;
}

void sub_100035ABC()
{
  void *v0 = 0x8000000000000000;
}

uint64_t sub_100035AE4()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_100035B04()
{
  return v0;
}

void sub_100035B24()
{
}

void sub_100035B3C()
{
  if (qword_100059750 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10003CEA0();
  sub_10000CD54(v0, (uint64_t)qword_10005B880);
  osos_log_t log = sub_10003CE80();
  os_log_type_t v1 = sub_10003D120();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136446210;
    type metadata accessor for AVCMomentsCapabilities(0);
    uint64_t v3 = sub_10003CFF0();
    sub_10000CE00(v3, v4, &v6);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Moments capabilities changed %{public}s", v2, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
  }
}

void sub_100035CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_100035D14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_100035D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const char *a6, const char *a7)
{
  if (a3)
  {
    swift_errorRetain();
    if (qword_100059750 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_10003CEA0();
    sub_10000CD54(v12, (uint64_t)qword_10005B880);
    sub_10000D8DC(a2, (uint64_t)v30, &qword_100059930);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v13 = sub_10003CE80();
    os_log_type_t v14 = sub_10003D100();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136446466;
      uint64_t v16 = sub_10000BF2C((uint64_t)v30);
      sub_10000CE00(v16, v17, &v29);
      sub_100037118();
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      sub_100023DDC((uint64_t)v30, &qword_100059930);
      *(_WORD *)(v15 + 12) = 2082;
      swift_errorRetain();
      sub_10000CCE8((uint64_t *)&unk_100059D70);
      uint64_t v18 = sub_10003CFF0();
      sub_10000CE00(v18, v19, &v29);
      sub_100037118();
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, a6, (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
      sub_100023DDC((uint64_t)v30, &qword_100059930);
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v27 = (void (*)(uint64_t, uint64_t))(*(uint64_t (**)(uint64_t, uint64_t))(a5 + 72))(a4, a5);
    if (v27)
    {
      uint64_t v28 = (uint64_t)v27;
      v27(a2, a3);
      swift_errorRelease();
      sub_10000CDF0(v28);
    }
    else
    {
      swift_errorRelease();
    }
  }
  else
  {
    if (qword_100059750 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_10003CEA0();
    sub_10000CD54(v21, (uint64_t)qword_10005B880);
    sub_10000D8DC(a2, (uint64_t)v30, &qword_100059930);
    uint64_t v22 = sub_10003CE80();
    os_log_type_t v23 = sub_10003D120();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136446210;
      uint64_t v25 = sub_10000BF2C((uint64_t)v30);
      sub_10000CE00(v25, v26, &v29);
      sub_100037130();
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      sub_100023DDC((uint64_t)v30, &qword_100059930);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, a7, v24, 0xCu);
      swift_arrayDestroy();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
      sub_100023DDC((uint64_t)v30, &qword_100059930);
    }
  }
}

uint64_t sub_100036134()
{
  return sub_10003614C();
}

uint64_t sub_10003614C()
{
  sub_10000CCE8(&qword_10005A838);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100042840;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 32) = 0xD00000000000001BLL;
  *(void *)(v0 + 40) = 0x8000000100041F10;
  sub_10003D390();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000361E0(unsigned __int8 a1, char a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0xD000000000000014;
    }
    else {
      unint64_t v3 = 0x64657472617473;
    }
    if (v2 == 1) {
      unint64_t v4 = 0x80000001000404A0;
    }
    else {
      unint64_t v4 = 0xE700000000000000;
    }
  }
  else
  {
    unint64_t v4 = 0xE700000000000000;
    unint64_t v3 = 0x676E6974696177;
  }
  if (a2)
  {
    if (a2 == 1) {
      unint64_t v5 = 0xD000000000000014;
    }
    else {
      unint64_t v5 = 0x64657472617473;
    }
    if (a2 == 1) {
      unint64_t v6 = 0x80000001000404A0;
    }
    else {
      unint64_t v6 = 0xE700000000000000;
    }
  }
  else
  {
    unint64_t v6 = 0xE700000000000000;
    unint64_t v5 = 0x676E6974696177;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10003D330();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1000362DC(char a1, char a2)
{
  unint64_t v3 = sub_10000E6B0(a1);
  uint64_t v5 = v4;
  if (v3 == sub_10000E6B0(a2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10003D330();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100036364()
{
  return 1;
}

uint64_t sub_10003636C()
{
  uint64_t v1 = sub_10003D150();
  sub_10000D9D8();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_10000D9F4();
  uint64_t v7 = v6 - v5;
  sub_10003D130();
  sub_10000DA20();
  __chkstk_darwin(v8);
  sub_10000D9F4();
  uint64_t v9 = sub_10003CED0();
  __chkstk_darwin(v9 - 8);
  sub_10001D83C();
  *(void *)(v0 + 24) = 0;
  sub_10000D988(0, (unint64_t *)&unk_100059ED0);
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 56) = 0u;
  sub_10003CEC0();
  sub_10000D680();
  sub_10000CCE8(&qword_100059EE0);
  sub_10000D6D0();
  sub_10003D1F0();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  *(void *)(v0 + 32) = sub_10003D170();
  *(void *)(v0 + 16) = [objc_allocWithZone((Class)type metadata accessor for MessageMomentsAVCDelegate()) init];
  return v0;
}

void sub_10003655C(unsigned __int8 a1@<W0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  id v6 = [objc_allocWithZone((Class)AVCMediaRecorderConfiguration) init];
  [v6 setMediaAvailability:3];
  id v7 = [objc_allocWithZone((Class)AVCMoments) initWithConfiguration:v6 delegate:*(void *)(v2 + 16) dispatchQueue:*(void *)(v2 + 32)];

  if (v7)
  {
    unsigned __int8 v22 = a1;
    uint64_t v8 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = v7;
    id v9 = v7;

    *(void *)(*(void *)(v3 + 16) + OBJC_IVAR____TtC18FTLivePhotoService25MessageMomentsAVCDelegate_owner + 8) = &off_100052A40;
    swift_unknownObjectWeakAssign();
    if (qword_100059758 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_10003CEA0();
    sub_10000CD54(v10, (uint64_t)qword_10005B898);
    uint64_t v11 = sub_10003CE80();
    os_log_type_t v12 = sub_10003D120();
    if (os_log_type_enabled(v11, v12))
    {
      id v21 = v9;
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136446210;
      type metadata accessor for AVCMomentsMediaType(0);
      uint64_t v14 = sub_10003CFF0();
      sub_10000CE00(v14, v15, &v23);
      sub_100037130();
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Generating new request for AVCMomentsMediaType %{public}s", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      id v9 = v21;
      swift_slowDealloc();
    }

    uint64_t v16 = *(void **)(v3 + 24);
    if (v16 && (id v17 = [v16 newRequestWithMediaType:v22 mode:1 requesteeID:0]) != 0)
    {
      id v18 = v17;
      a2[3] = sub_10000D988(0, (unint64_t *)&qword_100059C60);
      a2[4] = &off_100051700;

      *a2 = v18;
    }
    else
    {
      sub_10000D76C();
      swift_allocError();
      unsigned char *v19 = 1;
      swift_willThrow();
    }
  }
  else
  {
    sub_10000D76C();
    swift_allocError();
    *uint64_t v20 = 0;
    swift_willThrow();
  }
}

void sub_100036878()
{
  uint64_t v1 = *(void **)(v0 + 24);
  *(void *)(v0 + 24) = 0;
}

uint64_t sub_100036884()
{
  sub_10000CDF0(*(void *)(v0 + 40));
  sub_10000CDF0(*(void *)(v0 + 56));
  return v0;
}

uint64_t sub_1000368C4()
{
  sub_100036884();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for MessageMoments()
{
  return self;
}

uint64_t sub_10003691C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 40);
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = a2;
  return sub_10000CDF0(v4);
}

uint64_t sub_100036934(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 56);
  *(void *)(v3 + 56) = a1;
  *(void *)(v3 + 64) = a2;
  return sub_10000CDF0(v4);
}

void sub_10003694C(unsigned __int8 a1@<W0>, void *a2@<X8>)
{
}

void sub_100036970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = v5;
  uint64_t v11 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  __chkstk_darwin(v11 - 8);
  sub_10000D9F4();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_10003CD40();
  sub_10000D9D8();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_10001D83C();
  if (a5)
  {
    swift_errorRetain();
    if (qword_100059758 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_10003CEA0();
    sub_10000CD54(v19, (uint64_t)qword_10005B898);
    sub_10000CD8C(a2, (uint64_t)v47);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v20 = sub_10003CE80();
    os_log_type_t v21 = sub_10003D100();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136446466;
      sub_10000CD8C((uint64_t)v47, (uint64_t)v45);
      uint64_t v23 = sub_10000BF2C((uint64_t)v45);
      unint64_t v25 = v24;
      sub_100023DDC((uint64_t)v45, &qword_100059930);
      uint64_t v26 = sub_10000CE00(v23, v25, &v46);
      sub_100037144(v26);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      sub_10000D5B8((uint64_t)v47);
      *(_WORD *)(v22 + 12) = 2082;
      v45[0] = a5;
      swift_errorRetain();
      sub_10000CCE8((uint64_t *)&unk_100059D70);
      uint64_t v27 = sub_10003CFF0();
      uint64_t v29 = sub_10000CE00(v27, v28, &v46);
      sub_100037144(v29);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Moments finished processing request %{public}s with error %{public}s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
      sub_10000D5B8((uint64_t)v47);
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v34 = *(void (**)(unsigned char *, uint64_t))(v7 + 56);
    if (v34)
    {
      sub_10000CD8C(a2, (uint64_t)v47);
      swift_retain();
      v34(v47, a5);
      sub_10000CDF0((uint64_t)v34);
      swift_errorRelease();
      sub_100023DDC((uint64_t)v47, &qword_100059930);
    }
    else
    {
      swift_errorRelease();
    }
  }
  else
  {
    sub_10000D8DC(a4, v14, (uint64_t *)&unk_100059C70);
    if (sub_10000CD2C(v14, 1, v15) == 1)
    {
      sub_100023DDC(v14, (uint64_t *)&unk_100059C70);
      if (qword_100059758 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_10003CEA0();
      sub_10000CD54(v30, (uint64_t)qword_10005B898);
      uint64_t v31 = sub_10003CE80();
      os_log_type_t v32 = sub_10003D100();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v33 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Moments finished without an error or a videoURL", v33, 2u);
        sub_10000DA3C();
      }
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v6, v14, v15);
      if (qword_100059758 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_10003CEA0();
      sub_10000CD54(v35, (uint64_t)qword_10005B898);
      sub_10000CD8C(a2, (uint64_t)v47);
      uint64_t v36 = sub_10003CE80();
      os_log_type_t v37 = sub_10003D120();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v44 = v7;
        uint64_t v38 = a2;
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        *(_DWORD *)uint64_t v39 = 136446210;
        sub_10000CD8C((uint64_t)v47, (uint64_t)v45);
        uint64_t v40 = sub_10000BF2C((uint64_t)v45);
        unint64_t v42 = v41;
        sub_100023DDC((uint64_t)v45, &qword_100059930);
        v45[0] = sub_10000CE00(v40, v42, &v46);
        sub_10003D1B0();
        a2 = v38;
        uint64_t v7 = v44;
        swift_bridgeObjectRelease();
        sub_10000D5B8((uint64_t)v47);
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "Moments finished processing request %{public}s", v39, 0xCu);
        swift_arrayDestroy();
        sub_10000DA3C();
        sub_10000DA3C();
      }
      else
      {
        sub_10000D5B8((uint64_t)v47);
      }

      uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v7 + 40);
      if (v43)
      {
        swift_retain();
        v43(a2, v6);
        sub_10000CDF0((uint64_t)v43);
      }
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v6, v15);
    }
  }
  sub_100036878();
}

uint64_t sub_100036F90()
{
  uint64_t v1 = *(void *)(v0 + 56);
  sub_10000D9C4(v1);
  return v1;
}

unsigned char *storeEnumTagSinglePayload for MessageMomentsError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100037090);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageMomentsError()
{
  return &type metadata for MessageMomentsError;
}

unint64_t sub_1000370CC()
{
  unint64_t result = qword_10005A840;
  if (!qword_10005A840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A840);
  }
  return result;
}

uint64_t sub_100037144(uint64_t a1)
{
  *(void *)(v1 - 168) = a1;
  return v1 - 168;
}

uint64_t sub_10003718C()
{
  return swift_unknownObjectWeakLoadStrong();
}

void sub_1000371F8(void *a1)
{
  swift_unknownObjectWeakAssign();
}

char *sub_100037240(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  unsigned int v6 = v5;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v13 = OBJC_IVAR____TtC18FTLivePhotoService12FTAVCMoments_moments;
  *(void *)&v6[OBJC_IVAR____TtC18FTLivePhotoService12FTAVCMoments_moments] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v14 = *(void **)&v6[v13];
  *(void *)&v6[v13] = 0;
  uint64_t v15 = v6;

  swift_unknownObjectWeakAssign();
  v20.receiver = v15;
  v20.super_class = ObjectType;
  uint64_t v16 = (char *)objc_msgSendSuper2(&v20, "init");
  id v17 = sub_100037E60(a1, a2, a3, v16, a5);

  if (v17)
  {
    uint64_t v18 = *(void **)&v16[OBJC_IVAR____TtC18FTLivePhotoService12FTAVCMoments_moments];
    *(void *)&v16[OBJC_IVAR____TtC18FTLivePhotoService12FTAVCMoments_moments] = v17;
  }
  else
  {

    return 0;
  }
  return v16;
}

id sub_100037410()
{
  id result = *(id *)(v0 + OBJC_IVAR____TtC18FTLivePhotoService12FTAVCMoments_moments);
  if (result) {
    return [result streamToken];
  }
  __break(1u);
  return result;
}

SEL *sub_1000374E4(SEL *result)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC18FTLivePhotoService12FTAVCMoments_moments)) {
    return (SEL *)[*(id *)(v1 + OBJC_IVAR____TtC18FTLivePhotoService12FTAVCMoments_moments) *result];
  }
  __break(1u);
  return result;
}

id sub_100037504(id result, unsigned __int8 a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void **)(v4 + OBJC_IVAR____TtC18FTLivePhotoService12FTAVCMoments_moments);
  if (v5)
  {
    NSString v6 = a4;
    unsigned __int8 v8 = result;
    if (a4)
    {
      id v9 = v5;
      NSString v6 = sub_10003CFB0();
    }
    else
    {
      id v10 = v5;
    }
    id v11 = [v5 newRequestWithMediaType:v8 mode:a2 requesteeID:v6];

    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10003762C()
{
}

uint64_t type metadata accessor for FTAVCMoments()
{
  return self;
}

void sub_1000376DC(uint64_t a1, uint64_t a2)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = Strong;
    [Strong moments:v2 capabilitiesDidChange:a2];
  }
}

void sub_1000377C8(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v9 = (id)Strong;
    if (a3) {
      a3 = (void *)sub_10003CC80();
    }
    objc_msgSend(v9, *a4, v4, a2, a3);
  }
}

void sub_100037878(void *a1, uint64_t a2, void *a3, void *a4, void *a5, SEL *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  id v13 = a5;
  sub_1000377C8((uint64_t)v13, (uint64_t)a4, a5, a6);
}

void sub_1000379C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = v5;
  uint64_t v11 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v26 - v15;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v18 = (void *)Strong;
    sub_100037DF8(a3, (uint64_t)v16);
    uint64_t v19 = sub_10003CD40();
    os_log_type_t v21 = 0;
    if (sub_10000CD2C((uint64_t)v16, 1, v19) != 1)
    {
      sub_10003CCD0(v20);
      os_log_type_t v21 = v22;
      (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v16, v19);
    }
    sub_100037DF8(a4, (uint64_t)v14);
    if (sub_10000CD2C((uint64_t)v14, 1, v19) == 1)
    {
      unint64_t v24 = 0;
      if (!a5) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_10003CCD0(v23);
      unint64_t v24 = v25;
      (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v14, v19);
      if (!a5)
      {
LABEL_9:
        [v18 moments:v6 didEndProcessingRequest:a2 stillImageURL:v21 movieURL:v24 error:a5];

        return;
      }
    }
    a5 = (void *)sub_10003CC80();
    goto LABEL_9;
  }
}

void sub_100037D34()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v2 = Strong;
    [Strong momentsServerDidDisconnect:v0];
  }
}

uint64_t sub_100037DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_100037E60(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  if (a3)
  {
    NSString v8 = sub_10003CFB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  id v9 = [objc_allocWithZone((Class)AVCMoments) initWithStreamToken:a1 requesterID:v8 delegate:a4 dispatchQueue:a5];

  return v9;
}

uint64_t sub_100037EFC(uint64_t a1)
{
  return sub_100037F64(a1, qword_10005B880);
}

uint64_t sub_100037F1C(uint64_t a1)
{
  return sub_100038040(a1, qword_10005B898);
}

uint64_t sub_100037F40(uint64_t a1)
{
  return sub_100038040(a1, qword_10005B8B0);
}

uint64_t sub_100037F64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10003CEA0();
  sub_100037FDC(v3, a2);
  sub_10000CD54(v3, (uint64_t)a2);
  return sub_10003CE90();
}

uint64_t *sub_100037FDC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100038040(uint64_t a1, uint64_t *a2)
{
  return sub_100037F64(a1, a2);
}

uint64_t *sub_10003804C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10003CD40();
    NSString v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[7];
    *(uint64_t *)((char *)a1 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100038154(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003CD40();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100038200(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003CD40();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000382B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003CD40();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100038388(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003CD40();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  return a1;
}

uint64_t sub_100038434(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003CD40();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000384F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100038508);
}

uint64_t sub_100038508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10003CD40();
  sub_1000103D4();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return sub_10000CD2C(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_100038594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000385A8);
}

void sub_1000385A8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_10003CD40();
  sub_1000103D4();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    sub_10000FA0C(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
}

uint64_t type metadata accessor for MessageStore()
{
  uint64_t result = qword_10005A8E0;
  if (!qword_10005A8E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100038678()
{
  uint64_t result = sub_10003CD40();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100038714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v24 = sub_10003CCA0();
  sub_10000D9D8();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10003CD40();
  sub_10000D9D8();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_10001D6C0();
  uint64_t v23 = v13;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a2, a1, v9);
  sub_10003CDA0();
  type metadata accessor for MessageRequest();
  sub_10003A854(&qword_10005A6D0, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v14 = sub_10003CF80();
  uint64_t v15 = (int *)type metadata accessor for MessageStore();
  *(void *)(a2 + v15[6]) = v14;
  sub_10000D988(0, &qword_100059EB0);
  *(void *)(a2 + v15[7]) = sub_10003CF80();
  uint64_t v16 = a2;
  strcpy((char *)v25, "VideoMessages");
  v25[7] = -4864;
  uint64_t v17 = v24;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for URL.DirectoryHint.inferFromPath(_:), v24);
  sub_10000F9C0();
  uint64_t v18 = v22;
  uint64_t v19 = v23;
  sub_10003CD30();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v18, v9);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v17);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v16 + v15[5], v19, v9);
}

id sub_1000389A8()
{
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10003CEA0();
  sub_10000CD54(v0, (uint64_t)qword_10005B898);
  unint64_t v1 = sub_10003CE80();
  os_log_type_t v2 = sub_10003D120();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)sub_100023FDC();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Creating video message folder", v3, 2u);
    sub_10000DA3C();
  }

  uint64_t v4 = self;
  id v5 = [v4 defaultManager];
  type metadata accessor for MessageStore();
  sub_10003CD10(1);
  NSString v6 = sub_10003CFB0();
  swift_bridgeObjectRelease();
  unsigned int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    uint64_t v8 = sub_10003CE80();
    os_log_type_t v9 = sub_10003D120();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)sub_100023FDC();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "VideoMessage folder already exists - removing", v10, 2u);
      sub_10000DA3C();
    }

    id v11 = [v4 defaultManager];
    sub_10003CCD0(v12);
    uint64_t v14 = v13;
    id v30 = 0;
    unsigned int v15 = [v11 removeItemAtURL:v13 error:&v30];

    if (!v15)
    {
      uint64_t v24 = v30;
      sub_10003CC90();
      goto LABEL_16;
    }
    id v16 = v30;
  }
  id v17 = [v4 defaultManager];
  sub_10003CCD0(v18);
  objc_super v20 = v19;
  id v30 = 0;
  unsigned int v21 = [v17 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v30];

  if (v21) {
    return v30;
  }
  id v23 = v30;
  sub_10003CC90();

  swift_willThrow();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v24 = sub_10003CE80();
  os_log_type_t v25 = sub_10003D100();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (_DWORD *)swift_slowAlloc();
    uint64_t v27 = (void *)swift_slowAlloc();
    _DWORD *v26 = 138543362;
    swift_errorRetain();
    unint64_t v28 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id v30 = v28;
    sub_10003D1B0();
    *uint64_t v27 = v28;
    swift_errorRelease();
    swift_errorRelease();
    sub_10003AAA0((void *)&_mh_execute_header, v24, v29, "Failed to create video message folder %{public}@");
    sub_10000CCE8(&qword_100059AC8);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
LABEL_16:

  return (id)swift_willThrow();
}

uint64_t sub_100038DA8(uint64_t a1)
{
  uint64_t v2 = sub_10003CDA0();
  sub_10000D9D8();
  uint64_t v56 = v3;
  __chkstk_darwin(v4);
  sub_10001D6C0();
  uint64_t v57 = v5;
  uint64_t v6 = sub_10000CCE8(&qword_100059960);
  __chkstk_darwin(v6 - 8);
  sub_100023EB4();
  uint64_t v55 = v7;
  sub_100023EF0();
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v52 - v9;
  uint64_t v11 = type metadata accessor for MessageRequest();
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v53 = (uint64_t)&v52 - v15;
  sub_100023EF0();
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v52 - v17;
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v61 = v2;
  uint64_t v19 = sub_10003CEA0();
  uint64_t v20 = sub_10000CD54(v19, (uint64_t)qword_10005B898);
  sub_10000D81C(a1, (uint64_t)v18);
  uint64_t v59 = v20;
  unsigned int v21 = sub_10003CE80();
  os_log_type_t v22 = sub_10003D120();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v58 = a1;
    uint64_t v24 = (uint8_t *)v23;
    uint64_t v25 = sub_10001D7CC();
    uint64_t v52 = v14;
    uint64_t v62 = v25;
    uint64_t v54 = v11;
    *(_DWORD *)uint64_t v24 = 136315138;
    sub_10003A854(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v26 = sub_10003D320();
    uint64_t v28 = sub_10000CE00(v26, v27, &v62);
    sub_10000DA54(v28);
    uint64_t v11 = v54;
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    sub_10000D880((uint64_t)v18);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Started processing message %s", v24, 0xCu);
    swift_arrayDestroy();
    uint64_t v14 = v52;
    sub_10000DA3C();
    a1 = v58;
    sub_10000DA3C();
  }
  else
  {
    sub_10000D880((uint64_t)v18);
  }

  uint64_t v29 = type metadata accessor for MessageStore();
  sub_10002F8AC(a1, *(void *)&v60[*(int *)(v29 + 24)], (uint64_t)v10);
  int v30 = sub_10000CD2C((uint64_t)v10, 1, v11);
  sub_10003A508((uint64_t)v10);
  if (v30 == 1)
  {
    uint64_t v31 = v53;
    sub_10000D81C(a1, v53);
    os_log_type_t v32 = sub_10003CE80();
    os_log_type_t v33 = sub_10003D120();
    BOOL v34 = os_log_type_enabled(v32, v33);
    uint64_t v35 = v61;
    if (v34)
    {
      uint64_t v36 = (uint8_t *)sub_10003AA84();
      uint64_t v37 = sub_10001D7CC();
      uint64_t v54 = v11;
      uint64_t v62 = v37;
      uint64_t v58 = a1;
      *(_DWORD *)uint64_t v36 = 136446210;
      uint64_t v60 = v36 + 4;
      sub_10003A854(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v38 = sub_10003D320();
      uint64_t v40 = sub_10000CE00(v38, v39, &v62);
      sub_10000DA54(v40);
      a1 = v58;
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      sub_10000D880(v31);
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Started processing message with UUID %{public}s", v36, 0xCu);
      swift_arrayDestroy();
      uint64_t v11 = v54;
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
      sub_10000D880(v31);
    }

    uint64_t v48 = v57;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16))(v57, a1, v35);
    uint64_t v49 = v55;
    sub_10000D81C(a1, v55);
    sub_10000FA0C(v49, 0, 1, v11);
    return sub_10003A380(v49, v48);
  }
  else
  {
    sub_10000D81C(a1, (uint64_t)v14);
    unint64_t v41 = sub_10003CE80();
    os_log_type_t v42 = sub_10003D100();
    if (sub_10003AABC(v42))
    {
      uint64_t v43 = (_DWORD *)sub_10003AA84();
      uint64_t v62 = sub_10001D7CC();
      *uint64_t v43 = 136446210;
      sub_10003A854(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v44 = sub_10003D320();
      uint64_t v46 = sub_10000CE00(v44, v45, &v62);
      sub_10000DA54(v46);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      sub_10000D880((uint64_t)v14);
      sub_10003AAA0((void *)&_mh_execute_header, v41, v47, "Already processing message with UUID %{public}s");
      sub_100026DDC();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
      sub_10000D880((uint64_t)v14);
    }

    sub_10003A808();
    swift_allocError();
    *uint64_t v51 = 1;
    return swift_willThrow();
  }
}

uint64_t sub_1000393D8(uint64_t a1)
{
  sub_10003CD40();
  sub_10000D9D8();
  uint64_t v60 = v4;
  uint64_t v61 = v3;
  __chkstk_darwin(v3);
  sub_10001D6C0();
  uint64_t v59 = v5;
  uint64_t v6 = sub_10003CDA0();
  sub_10000D9D8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_100023EB4();
  uint64_t v57 = v10;
  sub_100023EF0();
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v52 - v12;
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_10003CEA0();
  uint64_t v15 = sub_10000CD54(v14, (uint64_t)qword_10005B898);
  uint64_t v16 = (void (*)(char *, uint64_t, uint64_t))*((void *)v8 + 2);
  uint64_t v62 = a1;
  v16(v13, a1, v6);
  uint64_t v17 = sub_10003CE80();
  os_log_type_t v18 = sub_10003D120();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v58 = v8;
  if (v19)
  {
    uint64_t v54 = v16;
    uint64_t v55 = v15;
    uint64_t v20 = sub_10003AA84();
    uint64_t v56 = v1;
    unsigned int v21 = (uint8_t *)v20;
    uint64_t v53 = (void *)sub_10001D7CC();
    id v64 = v53;
    *(_DWORD *)unsigned int v21 = 136446210;
    uint64_t v8 = &v21[v15];
    v52[1] = v21 + 4;
    sub_10003A854(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v22 = sub_10003D320();
    uint64_t v24 = sub_10000CE00(v22, v23, (uint64_t *)&v64);
    sub_10003AB18(v24);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    uint64_t v16 = v54;
    uint64_t v25 = sub_10003AAEC();
    ((void (*)(uint64_t))&v21[v15])(v25);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Discarding message %{public}s", v21, 0xCu);
    swift_arrayDestroy();
    sub_10000DA3C();
    sub_10000DA3C();
  }
  else
  {
    uint64_t v26 = sub_10003AAEC();
    ((void (*)(uint64_t))v8)(v26);
  }

  uint64_t v27 = type metadata accessor for MessageStore();
  uint64_t v28 = v62;
  uint64_t v29 = sub_10002F948(v62, *(void *)((char *)v63 + *(int *)(v27 + 28)));

  if (v29)
  {
    int v30 = sub_10003CE80();
    os_log_type_t v31 = sub_10003D120();
    if (os_log_type_enabled(v30, v31))
    {
      os_log_type_t v32 = (uint8_t *)sub_100023FDC();
      *(_WORD *)os_log_type_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Deleting message from disk", v32, 2u);
      sub_10000DA3C();
    }

    uint64_t v33 = v59;
    sub_10003A604();
    id v34 = [self defaultManager];
    sub_10003CCD0(v35);
    uint64_t v37 = v36;
    id v64 = 0;
    unsigned __int8 v38 = [v34 removeItemAtURL:v36 error:&v64];

    if (v38)
    {
      id v39 = v64;
    }
    else
    {
      id v49 = v64;
      sub_10003CC90();

      swift_willThrow();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v60 + 8))(v33, v61);
  }
  else
  {
    uint64_t v40 = v57;
    v16(v57, v28, v6);
    unint64_t v41 = sub_10003CE80();
    os_log_type_t v42 = sub_10003D100();
    if (sub_10003AABC(v42))
    {
      uint64_t v43 = v6;
      uint64_t v44 = (_DWORD *)sub_10003AA84();
      id v64 = (id)sub_10001D7CC();
      _DWORD *v44 = 136446210;
      unint64_t v63 = v44 + 1;
      sub_10003A854(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v45 = sub_10003D320();
      uint64_t v47 = sub_10000CE00(v45, v46, (uint64_t *)&v64);
      sub_10003AB18(v47);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v8)(v40, v43);
      sub_10003AAA0((void *)&_mh_execute_header, v41, v48, "Unable to find message %{public}s in processed store");
      sub_100026DDC();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
      ((void (*)(char *, uint64_t))v8)(v40, v6);
    }

    sub_10003A808();
    swift_allocError();
    *uint64_t v51 = 0;
    return swift_willThrow();
  }
}

NSObject *sub_100039970(uint64_t a1, uint64_t a2)
{
  uint64_t v105 = sub_10003CDA0();
  sub_10000D9D8();
  uint64_t v98 = v4;
  __chkstk_darwin(v5);
  sub_10001D6C0();
  uint64_t v97 = v6;
  uint64_t v7 = sub_10003CD40();
  sub_10000D9D8();
  uint64_t v108 = v8;
  __chkstk_darwin(v9);
  sub_100023EB4();
  uint64_t v96 = v10;
  sub_100023EF0();
  __chkstk_darwin(v11);
  uint64_t v101 = (char *)&v89 - v12;
  sub_100023EF0();
  __chkstk_darwin(v13);
  uint64_t v100 = (char *)&v89 - v14;
  sub_100023EF0();
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v89 - v16;
  uint64_t v18 = sub_10000CCE8(&qword_100059960);
  __chkstk_darwin(v18 - 8);
  sub_100023EB4();
  uint64_t v95 = v19;
  sub_100023EF0();
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v89 - v21;
  uint64_t v104 = type metadata accessor for MessageRequest();
  __chkstk_darwin(v104);
  sub_100023EB4();
  uint64_t v99 = v23;
  sub_100023EF0();
  __chkstk_darwin(v24);
  uint64_t v26 = (char *)&v89 - v25;
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_10003CEA0();
  uint64_t v28 = sub_10000CD54(v27, (uint64_t)qword_10005B898);
  uint64_t v107 = a1;
  sub_10000D81C(a1, (uint64_t)v26);
  uint64_t v106 = v28;
  uint64_t v29 = sub_10003CE80();
  os_log_type_t v30 = sub_10003D120();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = sub_10003AA84();
    uint64_t v102 = a2;
    os_log_type_t v32 = (uint8_t *)v31;
    uint64_t v33 = sub_10001D7CC();
    uint64_t v94 = v7;
    CFAllocatorRef v111 = v33;
    id v103 = v17;
    *(_DWORD *)os_log_type_t v32 = 136446210;
    sub_10003A854(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v34 = sub_10003D320();
    uint64_t v36 = sub_10003AB00(v34, v35);
    sub_10003AAD8(v36);
    uint64_t v17 = v103;
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    sub_10000D880((uint64_t)v26);
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Finished processing message %{public}s", v32, 0xCu);
    swift_arrayDestroy();
    uint64_t v7 = v94;
    sub_10000DA3C();
    a2 = v102;
    sub_10000DA3C();
  }
  else
  {
    sub_10000D880((uint64_t)v26);
  }

  uint64_t v37 = type metadata accessor for MessageStore();
  unsigned __int8 v38 = (uint64_t *)(v109 + *(int *)(v37 + 24));
  uint64_t v39 = v107;
  sub_10002F8AC(v107, *v38, (uint64_t)v22);
  int v40 = sub_10000CD2C((uint64_t)v22, 1, v104);
  sub_10003A508((uint64_t)v22);
  if (v40 == 1)
  {
    uint64_t v41 = v99;
    sub_10000D81C(v39, v99);
    os_log_type_t v42 = sub_10003CE80();
    os_log_type_t v43 = sub_10003D120();
    if (sub_10003AABC(v43))
    {
      uint64_t v44 = (_DWORD *)sub_10003AA84();
      CFAllocatorRef v111 = sub_10001D7CC();
      _DWORD *v44 = 136446210;
      sub_10003A854(&qword_100059E58, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v45 = sub_10003D320();
      uint64_t v47 = sub_10003AB00(v45, v46);
      sub_10003AAD8(v47);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      sub_10000D880(v41);
      sub_10003AAA0((void *)&_mh_execute_header, v42, v48, "Unable to find message %{public}s in processing store");
      sub_100026DDC();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
      sub_10000D880(v41);
    }

    sub_10003A808();
    swift_allocError();
    unsigned char *v66 = 0;
    swift_willThrow();
  }
  else
  {
    uint64_t v104 = v37;
    sub_10003A604();
    uint64_t v49 = v108 + 16;
    uint64_t v50 = *(void (**)(char *, uint64_t, uint64_t))(v108 + 16);
    uint64_t v51 = v100;
    v50(v100, a2, v7);
    uint64_t v52 = v101;
    uint64_t v99 = v49;
    int v93 = (void (*)(uint64_t, char *, uint64_t))v50;
    v50(v101, (uint64_t)v17, v7);
    uint64_t v53 = sub_10003CE80();
    os_log_type_t v54 = sub_10003D120();
    int v55 = v54;
    BOOL v56 = os_log_type_enabled(v53, v54);
    uint64_t v94 = (uint64_t)v38;
    if (v56)
    {
      uint64_t v57 = swift_slowAlloc();
      uint64_t v102 = a2;
      uint64_t v58 = v57;
      uint64_t v92 = swift_slowAlloc();
      CFAllocatorRef v111 = v92;
      *(_DWORD *)uint64_t v58 = 136446466;
      int v91 = v55;
      sub_10003A854((unint64_t *)&qword_100059FE0, (void (*)(uint64_t))&type metadata accessor for URL);
      id v103 = v17;
      os_log_t v90 = v53;
      uint64_t v59 = sub_10003D320();
      uint64_t v110 = sub_10003AB00(v59, v60);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      uint64_t v61 = v52;
      uint64_t v62 = *(void (**)(char *, uint64_t))(v108 + 8);
      v62(v51, v7);
      *(_WORD *)(v58 + 12) = 2082;
      uint64_t v17 = v103;
      uint64_t v63 = sub_10003D320();
      uint64_t v110 = sub_10003AB00(v63, v64);
      sub_10003D1B0();
      swift_bridgeObjectRelease();
      v62(v61, v7);
      uint64_t v65 = v62;
      uint64_t v53 = v90;
      _os_log_impl((void *)&_mh_execute_header, v90, (os_log_type_t)v91, "Found message, moving video from %{public}s to %{public}s", (uint8_t *)v58, 0x16u);
      swift_arrayDestroy();
      sub_10000DA3C();
      sub_10000DA3C();
    }
    else
    {
      uint64_t v65 = *(void (**)(char *, uint64_t))(v108 + 8);
      v65(v51, v7);
      v65(v52, v7);
    }

    id v67 = [self defaultManager];
    sub_10003CD10(1);
    NSString v68 = sub_10003CFB0();
    swift_bridgeObjectRelease();
    sub_10003CD10(1);
    uint64_t v69 = v17;
    NSString v70 = sub_10003CFB0();
    swift_bridgeObjectRelease();
    CFAllocatorRef v111 = 0;
    unsigned int v71 = [v67 copyItemAtPath:v68 toPath:v70 error:&v111];

    os_log_type_t v42 = v111;
    if (v71)
    {
      id v103 = (char *)v65;
      uint64_t v72 = v69;
      id v73 = v111;
      unsigned __int8 v74 = sub_10003CE80();
      os_log_type_t v75 = sub_10003D120();
      if (os_log_type_enabled(v74, v75))
      {
        uint64_t v76 = (uint8_t *)sub_100023FDC();
        *(_WORD *)uint64_t v76 = 0;
        _os_log_impl((void *)&_mh_execute_header, v74, v75, "Finished processing and moved video", v76, 2u);
        sub_10000DA3C();
      }

      uint64_t v78 = v97;
      uint64_t v77 = v98;
      uint64_t v79 = v107;
      uint64_t v80 = v105;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v98 + 16))(v97, v107, v105);
      sub_10000D988(0, &qword_10005A6A0);
      uint64_t v81 = v96;
      v93(v96, v72, v7);
      id v82 = sub_10003A764(v81, 0);
      id v83 = objc_allocWithZone((Class)TUMomentsRawVideoMessageDescriptor);
      id v84 = sub_100033120(v78, v82);
      uint64_t v85 = v95;
      sub_100033560(v79, v95);
      sub_10003A508(v85);
      id v86 = [v84 uuid];
      sub_10003CD80();

      os_log_type_t v42 = v84;
      sub_1000339E8();
      (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v78, v80);
      ((void (*)(char *, uint64_t))v103)(v72, v7);
    }
    else
    {
      uint64_t v87 = v111;
      sub_10003CC90();

      swift_willThrow();
      v65(v69, v7);
    }
  }
  return v42;
}

uint64_t sub_10003A380(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000CCE8(&qword_100059960);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for MessageRequest();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_10000CD2C(a1, 1, v10) == 1)
  {
    sub_10003A508(a1);
    sub_100033560(a2, (uint64_t)v6);
    uint64_t v11 = sub_10003CDA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a2, v11);
    return sub_10003A508((uint64_t)v6);
  }
  else
  {
    sub_10000D7B8(a1, (uint64_t)v9);
    sub_100033994();
    uint64_t v13 = sub_10003CDA0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
  }
}

uint64_t sub_10003A508(uint64_t a1)
{
  uint64_t v2 = sub_10000CCE8(&qword_100059960);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL sub_10003A568(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_10003A578(uint64_t a1, char a2)
{
}

Swift::Int sub_10003A5A0(char a1)
{
  return sub_10003D3C0();
}

BOOL sub_10003A5E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10003A568(*a1, *a2);
}

Swift::Int sub_10003A5F4()
{
  return sub_10003A5A0(*v0);
}

void sub_10003A5FC(uint64_t a1)
{
  sub_10003A578(a1, *v1);
}

uint64_t sub_10003A604()
{
  uint64_t v0 = sub_10003CCA0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[0] = sub_10003CD50();
  v6[1] = v4;
  type metadata accessor for MessageStore();
  v7._uint64_t countAndFlagsBits = 0x766F6D2E7761725FLL;
  v7._object = (void *)0xE800000000000000;
  sub_10003D010(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for URL.DirectoryHint.inferFromPath(_:), v0);
  sub_10000F9C0();
  sub_10003CD30();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return swift_bridgeObjectRelease();
}

id sub_10003A764(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_10003CCD0(v5);
  Swift::String v7 = v6;
  id v8 = [v4 initWithURL:v6 withExtensionType:a2];

  uint64_t v9 = sub_10003CD40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  return v8;
}

unint64_t sub_10003A808()
{
  unint64_t result = qword_10005A920;
  if (!qword_10005A920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A920);
  }
  return result;
}

uint64_t sub_10003A854(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MessageStoreError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 1) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for MessageStoreError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10003A9F0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_10003AA18(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MessageStoreError()
{
  return &type metadata for MessageStoreError;
}

unint64_t sub_10003AA38()
{
  unint64_t result = qword_10005A928;
  if (!qword_10005A928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A928);
  }
  return result;
}

uint64_t sub_10003AA84()
{
  return swift_slowAlloc();
}

void sub_10003AAA0(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

BOOL sub_10003AABC(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10003AAD8(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t sub_10003AAEC()
{
  return v0;
}

uint64_t sub_10003AB00(uint64_t a1, unint64_t a2)
{
  return sub_10000CE00(a1, a2, (uint64_t *)(v2 - 104));
}

uint64_t sub_10003AB18(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

id sub_10003AB2C()
{
  type metadata accessor for FTLivePhotoIDSService();
  id result = sub_100026F44(0xD000000000000023, 0x80000001000420E0);
  qword_10005A930 = (uint64_t)result;
  return result;
}

id sub_10003AB9C()
{
  if (qword_100059768 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_10005A930;

  return v0;
}

id sub_10003ABF8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FTLivePhotoIDSService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FTLivePhotoIDSService()
{
  return self;
}

id sub_10003AC88()
{
  return [self isFaceTimePhotosEnabled];
}

id sub_10003ACE8()
{
  return [self isFaceTimePhotosRestricted];
}

id sub_10003AD14()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for MomentsCapabilities()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for MessageControllerStateMachine(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *id result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10003AE60);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *id result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageControllerStateMachine()
{
  return &type metadata for MessageControllerStateMachine;
}

void sub_10003AE98()
{
  if (*v0)
  {
    sub_100023B2C();
    swift_allocError();
    unsigned char *v1 = 0;
    swift_willThrow();
  }
  else
  {
    unsigned char *v0 = 1;
  }
}

uint64_t sub_10003AEFC()
{
  int v1 = *v0;
  sub_10003AF60((uint64_t)"start()", 7, 2, *v0);
  if (v1 == 1) {
    return sub_10003B234(2);
  }
  else {
    return sub_10003B53C(1, v1);
  }
}

uint64_t sub_10003AF60(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = sub_10003CEA0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10000CD54(v5, (uint64_t)qword_10005B898);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v10 = sub_10003CE80();
  os_log_type_t v11 = sub_10003D120();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v21 = v19;
    *(_DWORD *)uint64_t v12 = 136446466;
    uint64_t v13 = sub_10003D280();
    uint64_t v20 = sub_10000CE00(v13, v14, &v21);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2082;
    if (a4)
    {
      if (a4 == 1) {
        uint64_t v15 = 0xD000000000000014;
      }
      else {
        uint64_t v15 = 0x64657472617473;
      }
      if (a4 == 1) {
        unint64_t v16 = 0x80000001000404A0;
      }
      else {
        unint64_t v16 = 0xE700000000000000;
      }
    }
    else
    {
      unint64_t v16 = 0xE700000000000000;
      uint64_t v15 = 0x676E6974696177;
    }
    uint64_t v20 = sub_10000CE00(v15, v16, &v21);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Called %{public}s with state %{public}s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10003B234(char a1)
{
  uint64_t v3 = sub_10003CEA0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v7 = *v1;
  unsigned char *v1 = a1;
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_10000CD54(v3, (uint64_t)qword_10005B898);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  uint64_t v9 = sub_10003CE80();
  os_log_type_t v10 = sub_10003D120();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v22 = v20;
    *(_DWORD *)uint64_t v11 = 136446466;
    unint64_t v12 = 0xE700000000000000;
    unint64_t v13 = 0x64657472617473;
    if (v7 == 1)
    {
      unint64_t v13 = 0xD000000000000014;
      unint64_t v12 = 0x80000001000404A0;
    }
    if (v7) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0x676E6974696177;
    }
    if (v7) {
      unint64_t v15 = v12;
    }
    else {
      unint64_t v15 = 0xE700000000000000;
    }
    uint64_t v21 = sub_10000CE00(v14, v15, &v22);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    if (a1)
    {
      if (a1 == 1) {
        uint64_t v16 = 0xD000000000000014;
      }
      else {
        uint64_t v16 = 0x64657472617473;
      }
      if (a1 == 1) {
        unint64_t v17 = 0x80000001000404A0;
      }
      else {
        unint64_t v17 = 0xE700000000000000;
      }
    }
    else
    {
      unint64_t v17 = 0xE700000000000000;
      uint64_t v16 = 0x676E6974696177;
    }
    uint64_t v21 = sub_10000CE00(v16, v17, &v22);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "State transform from '%{public}s' to '%{public}s' succeeded", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10003B53C(int a1, char a2)
{
  uint64_t v4 = sub_10003CEA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100059758 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_10000CD54(v4, (uint64_t)qword_10005B898);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_10003CE80();
  os_log_type_t v10 = sub_10003D100();
  if (os_log_type_enabled(v9, v10))
  {
    int v20 = a1;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v22 = v19;
    *(_DWORD *)uint64_t v11 = 136446466;
    if (a2)
    {
      if (a2 == 1) {
        uint64_t v12 = 0xD000000000000014;
      }
      else {
        uint64_t v12 = 0x64657472617473;
      }
      if (a2 == 1) {
        unint64_t v13 = 0x80000001000404A0;
      }
      else {
        unint64_t v13 = 0xE700000000000000;
      }
    }
    else
    {
      unint64_t v13 = 0xE700000000000000;
      uint64_t v12 = 0x676E6974696177;
    }
    uint64_t v21 = sub_10000CE00(v12, v13, &v22);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    if ((_BYTE)v20)
    {
      if (v20 == 1) {
        uint64_t v14 = 0xD000000000000014;
      }
      else {
        uint64_t v14 = 0x64657472617473;
      }
      if (v20 == 1) {
        unint64_t v15 = 0x80000001000404A0;
      }
      else {
        unint64_t v15 = 0xE700000000000000;
      }
    }
    else
    {
      unint64_t v15 = 0xE700000000000000;
      uint64_t v14 = 0x676E6974696177;
    }
    uint64_t v21 = sub_10000CE00(v14, v15, &v22);
    sub_10003D1B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Invalid state '%{public}s' expected '%{public}s'", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_100023B2C();
  swift_allocError();
  unsigned char *v16 = 0;
  return swift_willThrow();
}

uint64_t sub_10003B878()
{
  int v1 = *v0;
  sub_10003AF60((uint64_t)"end()", 5, 2, *v0);
  if (v1 == 2) {
    return sub_10003B234(0);
  }
  else {
    return sub_10003B53C(2, v1);
  }
}

uint64_t sub_10003B8DC()
{
  sub_10003AF60((uint64_t)"reset()", 7, 2, *v0);

  return sub_10003B234(0);
}

void sub_10003B91C()
{
}

uint64_t sub_10003B934()
{
  return sub_10003AEFC();
}

uint64_t sub_10003B94C()
{
  return sub_10003B878();
}

void sub_10003B968(uint64_t a1, char a2, os_log_t log)
{
  CFStringRef v3 = @"YES";
  if ((a2 & 1) == 0) {
    CFStringRef v3 = @"NO";
  }
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  CFStringRef v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Rejecting the connection since it is not entitled %@, lockdownModeEnabled: %@", (uint8_t *)&v4, 0x16u);
}

void sub_10003BA08()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100003390();
  sub_1000033A8((void *)&_mh_execute_header, v1, v2, "failed to initialize temporary directory (%d): %s", v3, v4, v5, v6, v7);
}

void sub_10003BA90()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100003390();
  sub_1000033A8((void *)&_mh_execute_header, v1, v2, "failed to resolve temporary directory (%d): %s", v3, v4, v5, v6, v7);
}

void sub_10003BB18()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void sub_10003BB80()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "error: %@", v2, v3, v4, v5, v6);
}

void sub_10003BBE8()
{
  sub_1000087C0();
  sub_1000087D8((void *)&_mh_execute_header, v0, v1, "Failed to start AVCMomentsRequest: %@, error: %@");
}

void sub_10003BC50()
{
  sub_100008868();
  sub_1000087D8((void *)&_mh_execute_header, v0, v1, "Failed to donate %@ to firewall with error %@");
}

void sub_10003BCC0()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Error while reporting: %@", v2, v3, v4, v5, v6);
}

void sub_10003BD28()
{
  sub_1000087C0();
  sub_1000087D8((void *)&_mh_execute_header, v0, v1, "Failed to end request %@: %@");
}

void sub_10003BD90()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Error while creating moments for streamToken: %ld", v2, v3, v4, v5, v6);
}

void sub_10003BDF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003BE30()
{
  sub_10000885C();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Received moments resource with missing transaction ID in metadata: %@", v2, v3, v4, v5, v6);
}

void sub_10003BE9C()
{
  sub_10000885C();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Received non-zipped resource at %@", v2, v3, v4, v5, v6);
}

void sub_10003BF08(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = [a2 remoteIDSDestinations];
  int v7 = 138412546;
  uint64_t v8 = v4;
  sub_100008830();
  sub_1000087F8((void *)&_mh_execute_header, a3, v6, "Received moments resource from IDS destination %@ but expected %@", (uint8_t *)&v7);
}

void sub_10003BFAC(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5 = [*a2 sessionsByToken];
  int v7 = 138412546;
  uint64_t v8 = a1;
  sub_100008830();
  sub_1000087F8((void *)&_mh_execute_header, a3, v6, "Received moments resource with unknown transaction ID %@. All sessions: %@", (uint8_t *)&v7);
}

void sub_10003C050()
{
  sub_10000885C();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Failed to unzip file at URL %@", v2, v3, v4, v5, v6);
}

void sub_10003C0BC()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "file url: %@ was not sent successfully", v2, v3, v4, v5, v6);
}

void sub_10003C124()
{
  sub_1000087C0();
  sub_1000087D8((void *)&_mh_execute_header, v0, v1, "Failed to delete contents at URL %@: %@");
}

void sub_10003C18C()
{
  sub_1000087C0();
  sub_1000087D8((void *)&_mh_execute_header, v0, v1, "Could not retrieve contents of dictionary at URL %@: %@");
}

void sub_10003C1F4()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Could not determine both photo URL and video URL from contents of directory: %@", v2, v3, v4, v5, v6);
}

void sub_10003C25C()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Resources directory URL %@ does not exist", v2, v3, v4, v5, v6);
}

void sub_10003C2C4()
{
  sub_100008868();
  uint64_t v4 = v0;
  sub_1000087F8((void *)&_mh_execute_header, v1, v2, "Error saving resources with photo url: %@ video url: %@", v3);
}

void sub_10003C338()
{
  sub_10000885C();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Error saving resources with video url: %@", v2, v3, v4, v5, v6);
}

void sub_10003C3A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C3DC()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Failed to start processing request: %@", v2, v3, v4, v5, v6);
}

void sub_10003C444()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Failed to request posting notification to the dataSource: %@", v2, v3, v4, v5, v6);
}

void sub_10003C4AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C4E4(void *a1)
{
  [a1 streamToken];
  sub_1000087B4();
  sub_100008810((void *)&_mh_execute_header, v1, v2, "Failed to find session for moments stream token: %ldl", v3, v4, v5, v6, v7);
}

void sub_10003C55C()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Did not receive movie URL for request: %@", v2, v3, v4, v5, v6);
}

void sub_10003C5C4(void *a1)
{
  uint64_t v1 = [a1 transactionID];
  sub_1000087B4();
  sub_100008810((void *)&_mh_execute_header, v2, v3, "Received an invalid request transaction ID: %@", v4, v5, v6, v7, v8);
}

void sub_10003C648()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Received an error staging the movie file: %@", v2, v3, v4, v5, v6);
}

void sub_10003C6B0()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Received an error creating the temporary directory: %@", v2, v3, v4, v5, v6);
}

void sub_10003C718(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 remoteIDSDestinations];
  int v7 = 138412546;
  uint64_t v8 = a1;
  sub_100008830();
  sub_1000087F8((void *)&_mh_execute_header, a3, v6, "failed to find remoteIDSDestination from request: %@ in session remoteIDSDestinations: %@", (uint8_t *)&v7);
}

void sub_10003C7BC()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Received an error staging the still photo: %@", v2, v3, v4, v5, v6);
}

void sub_10003C824()
{
  sub_1000087C0();
  sub_1000087D8((void *)&_mh_execute_header, v0, v1, "Media files for Live Photo do not have the correct path extensions. stillImageURL: %@ movieURL: %@");
}

void sub_10003C88C()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "Did not receive both parts of Live Photo for request: %@", v2, v3, v4, v5, v6);
}

void sub_10003C8F4()
{
  sub_1000087B4();
  sub_100008798((void *)&_mh_execute_header, v0, v1, "moment server disconnected: %@", v2, v3, v4, v5, v6);
}

void sub_10003C95C()
{
  sub_10000AEF4();
  sub_1000087D8((void *)&_mh_execute_header, v0, v1, "Error retrieving contents of directory at URL %@: %@");
}

void sub_10003C9C8()
{
  sub_10000AEF4();
  sub_1000087D8((void *)&_mh_execute_header, v0, v1, "%@ doesn't exist at client file url: %@");
}

void sub_10003CA4C()
{
  sub_1000087C0();
  sub_1000087D8((void *)&_mh_execute_header, v0, v1, "Failed to start sending resource with identifier %@: %@");
}

void sub_10003CAB4()
{
  sub_1000087C0();
  sub_1000087D8((void *)&_mh_execute_header, v0, v1, "failed to send file with identifier: %@, error: %@");
}

void sub_10003CB1C()
{
  sub_1000087C0();
  sub_1000087D8((void *)&_mh_execute_header, v0, v1, "Failed to create directory at URL %@: %@");
}

void sub_10003CB84()
{
  sub_10000AF0C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error zipping directory at URL %@ to output URL %@", v1, 0x16u);
}

void sub_10003CBFC()
{
  sub_10000AF0C();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Error occurred during IMFileCopierOperation type %ld on inputURL %@ and outputURL %@", v3, 0x20u);
}

uint64_t sub_10003CC80()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10003CC90()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10003CCA0()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_10003CCB0()
{
  return URL.lastPathComponent.getter();
}

uint64_t sub_10003CCC0()
{
  return static URL.temporaryDirectory.getter();
}

void sub_10003CCD0(NSURL *retstr@<X8>)
{
}

uint64_t sub_10003CCE0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_10003CCF0()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t sub_10003CD00()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003CD10(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_10003CD20()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_10003CD30()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t sub_10003CD40()
{
  return type metadata accessor for URL();
}

uint64_t sub_10003CD50()
{
  return UUID.uuidString.getter();
}

NSUUID sub_10003CD60()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_10003CD70()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_10003CD80()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003CD90()
{
  return UUID.init()();
}

uint64_t sub_10003CDA0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10003CDB0()
{
  return Locale.init(identifier:)();
}

NSLocale sub_10003CDC0()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_10003CDD0()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003CDE0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10003CE00()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_10003CE10()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_10003CE20()
{
  return OutgoingVideoMessage.init(conversationID:senderHandle:destinationHandles:messageType:url:)();
}

uint64_t sub_10003CE30()
{
  return OutgoingVideoMessage.url.getter();
}

uint64_t sub_10003CE40()
{
  return type metadata accessor for OutgoingVideoMessage();
}

uint64_t sub_10003CE50()
{
  return VideoMessagingController.__allocating_init()();
}

uint64_t sub_10003CE60()
{
  return type metadata accessor for VideoMessagingController();
}

uint64_t sub_10003CE80()
{
  return Logger.logObject.getter();
}

uint64_t sub_10003CE90()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10003CEA0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10003CEB0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10003CEC0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10003CED0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10003CEE0()
{
  return static DispatchTime.now()();
}

uint64_t sub_10003CEF0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10003CF00()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_10003CF10()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t sub_10003CF20()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_10003CF30()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_10003CF40()
{
  return + infix(_:_:)();
}

uint64_t sub_10003CF50()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary sub_10003CF60()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10003CF70()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003CF80()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_10003CF90()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_10003CFA0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10003CFB0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10003CFC0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003CFD0()
{
  return static String.Encoding.utf32.getter();
}

uint64_t sub_10003CFE0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_10003CFF0()
{
  return String.init<A>(reflecting:)();
}

uint64_t sub_10003D000()
{
  return String.hash(into:)();
}

void sub_10003D010(Swift::String a1)
{
}

Swift::Int sub_10003D020()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_10003D030()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10003D040()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003D050()
{
  return Array.description.getter();
}

uint64_t sub_10003D060()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10003D070()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10003D080()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10003D090()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_10003D0A0()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_10003D0B0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003D0C0()
{
  return Set.Iterator.init(_cocoa:)();
}

NSNumber sub_10003D0D0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_10003D0E0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10003D0F0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10003D100()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10003D110()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10003D120()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10003D130()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10003D140()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t sub_10003D150()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10003D160()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10003D170()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10003D180()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10003D190()
{
  return type metadata accessor for Optional();
}

NSNumber sub_10003D1A0()
{
  return UInt._bridgeToObjectiveC()();
}

uint64_t sub_10003D1B0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10003D1C0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10003D1D0()
{
  return StringProtocol.write(to:atomically:encoding:)();
}

uint64_t sub_10003D1E0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10003D1F0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10003D200()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_10003D220()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int sub_10003D230(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10003D240()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10003D250()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10003D260(Swift::Int a1)
{
}

uint64_t sub_10003D270()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10003D280()
{
  return StaticString.description.getter();
}

uint64_t sub_10003D290()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10003D2A0()
{
  return _StringObject.sharedUTF8.getter();
}

BOOL sub_10003D2B0(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_10003D2C0()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_10003D2D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10003D2E0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10003D2F0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10003D300()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10003D310(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10003D320()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10003D330()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10003D340()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10003D350()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10003D360()
{
  return Error._code.getter();
}

uint64_t sub_10003D370()
{
  return Error._domain.getter();
}

uint64_t sub_10003D380()
{
  return Error._userInfo.getter();
}

uint64_t sub_10003D390()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_10003D3A0()
{
  return Hasher.init(_seed:)();
}

void sub_10003D3B0(Swift::UInt a1)
{
}

Swift::Int sub_10003D3C0()
{
  return Hasher._finalize()();
}

uint64_t sub_10003D3D0()
{
  return _typeName(_:qualified:)();
}

uint64_t BSAuditTokenForCurrentProcess()
{
  return _BSAuditTokenForCurrentProcess();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return _CMBlockBufferCreateWithMemoryBlock(structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, flags, blockBufferOut);
}

OSStatus CMFormatDescriptionCreate(CFAllocatorRef allocator, CMMediaType mediaType, FourCharCode mediaSubType, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return _CMFormatDescriptionCreate(allocator, mediaType, mediaSubType, extensions, formatDescriptionOut);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return _CMSampleBufferCreate(allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries, sampleSizeArray, sampleBufferOut);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return _CMTimeCopyDescription(allocator, time);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

uint64_t IDSCopyAddressDestinationForDestination()
{
  return _IDSCopyAddressDestinationForDestination();
}

uint64_t IDSLoggableDescriptionForHandleOnService()
{
  return _IDSLoggableDescriptionForHandleOnService();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t TUAllowLocalVideoRecording()
{
  return _TUAllowLocalVideoRecording();
}

uint64_t TUCallTranscriptionSupported()
{
  return _TUCallTranscriptionSupported();
}

uint64_t TUCallTranscriptionSupportedLocales()
{
  return _TUCallTranscriptionSupportedLocales();
}

uint64_t TUCaptionsLoggingEnabled()
{
  return _TUCaptionsLoggingEnabled();
}

uint64_t TUCurrentLocaleIdentifier()
{
  return _TUCurrentLocaleIdentifier();
}

uint64_t TULockdownModeEnabled()
{
  return _TULockdownModeEnabled();
}

uint64_t TULoggableStringForHandle()
{
  return _TULoggableStringForHandle();
}

uint64_t TULoggableStringForHandles()
{
  return _TULoggableStringForHandles();
}

uint64_t TULoggableStringForObject()
{
  return _TULoggableStringForObject();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__handleReceivedResourcesAtDirectoryURL_transactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleReceivedResourcesAtDirectoryURL:transactionID:");
}

id objc_msgSend__handleReceivedVideoURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleReceivedVideoURL:");
}

id objc_msgSend__saveLivePhotoWithPhotoURL_videoURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveLivePhotoWithPhotoURL:videoURL:completion:");
}

id objc_msgSend__saveVideoWithURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveVideoWithURL:completion:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__startTimeoutForMomentsRequestWithTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startTimeoutForMomentsRequestWithTransactionID:");
}

id objc_msgSend__stripPotentialTokenURIWithToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stripPotentialTokenURIWithToken:");
}

id objc_msgSend__transferFileAtURL_forSession_request_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transferFileAtURL:forSession:request:");
}

id objc_msgSend_activeRequestCount(void *a1, const char *a2, ...)
{
  return _[a1 activeRequestCount];
}

id objc_msgSend_activeRequestsByTransactionID(void *a1, const char *a2, ...)
{
  return _[a1 activeRequestsByTransactionID];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addServiceDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addServiceDelegate:queue:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_availabilityWithRemoteAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availabilityWithRemoteAvailable:");
}

id objc_msgSend_avcRequest(void *a1, const char *a2, ...)
{
  return _[a1 avcRequest];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_callCenter(void *a1, const char *a2, ...)
{
  return _[a1 callCenter];
}

id objc_msgSend_callCenterWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callCenterWithQueue:");
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return _[a1 capabilities];
}

id objc_msgSend_cleanUpForMomentIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpForMomentIfNecessary:");
}

id objc_msgSend_cleanUpTemporaryFileIfExistsForClientFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpTemporaryFileIfExistsForClientFileURL:");
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return _[a1 cleanup];
}

id objc_msgSend_clientFileURLByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 clientFileURLByIdentifier];
}

id objc_msgSend_clientObject(void *a1, const char *a2, ...)
{
  return _[a1 clientObject];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentsOfDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyFileAtURL_toTemporaryFileWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyFileAtURL:toTemporaryFileWithName:");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteContentsAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteContentsAtURL:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didCleanUpForStream_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCleanUpForStream:reply:");
}

id objc_msgSend_didErrorOccur(void *a1, const char *a2, ...)
{
  return _[a1 didErrorOccur];
}

id objc_msgSend_didReceiveLocallyRequestedMomentDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveLocallyRequestedMomentDescriptor:");
}

id objc_msgSend_didReceiveResultsForStream_withTransactionID_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveResultsForStream:withTransactionID:reply:");
}

id objc_msgSend_didStartRequestForStream_withTransactionID_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStartRequestForStream:withTransactionID:reply:");
}

id objc_msgSend_didUpdateCapabilities_forVideoStreamToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateCapabilities:forVideoStreamToken:");
}

id objc_msgSend_donateWithDestination_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateWithDestination:completionHandler:");
}

id objc_msgSend_endWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endWithError:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _[a1 featureFlags];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileTransferController(void *a1, const char *a2, ...)
{
  return _[a1 fileTransferController];
}

id objc_msgSend_fileTransferer_didReceiveResourcesAtURL_withMetadata_isZipped_fromIDSDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileTransferer:didReceiveResourcesAtURL:withMetadata:isZipped:fromIDSDestination:");
}

id objc_msgSend_fileTransferer_didTransferFileAtURL_transactionID_successfully_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileTransferer:didTransferFileAtURL:transactionID:successfully:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPathComponents:");
}

id objc_msgSend_idsService(void *a1, const char *a2, ...)
{
  return _[a1 idsService];
}

id objc_msgSend_initWithAVCRequest_session_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAVCRequest:session:");
}

id objc_msgSend_initWithAvailability_supportedMediaTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAvailability:supportedMediaTypes:");
}

id objc_msgSend_initWithInputURL_outputURL_identifier_operation_completionBlock_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInputURL:outputURL:identifier:operation:completionBlock:queue:");
}

id objc_msgSend_initWithMoments_remoteIDSDestinations_callCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMoments:remoteIDSDestinations:callCenter:");
}

id objc_msgSend_initWithPhotosAppAssetIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPhotosAppAssetIdentifier:");
}

id objc_msgSend_initWithQueue_fileTransferController_idsService_mediaAssetManager_callCenter_userNotificationProviderDataSource_reportingControllerDataSource_featureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:fileTransferController:idsService:mediaAssetManager:callCenter:userNotificationProviderDataSource:reportingControllerDataSource:featureFlags:");
}

id objc_msgSend_initWithService_serverBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:serverBag:");
}

id objc_msgSend_initWithStreamToken_requesterID_delegate_dispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStreamToken:requesterID:delegate:dispatchQueue:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isConnectionEntitled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConnectionEntitled:");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToIgnoringCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToIgnoringCase:");
}

id objc_msgSend_isFaceTimePhotosAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimePhotosAvailable];
}

id objc_msgSend_isMomentsDisabled(void *a1, const char *a2, ...)
{
  return _[a1 isMomentsDisabled];
}

id objc_msgSend_isRegionBlocked(void *a1, const char *a2, ...)
{
  return _[a1 isRegionBlocked];
}

id objc_msgSend_isRegistered(void *a1, const char *a2, ...)
{
  return _[a1 isRegistered];
}

id objc_msgSend_livePhotoDonation(void *a1, const char *a2, ...)
{
  return _[a1 livePhotoDonation];
}

id objc_msgSend_localCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 localCapabilities];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_machTimeScale(void *a1, const char *a2, ...)
{
  return _[a1 machTimeScale];
}

id objc_msgSend_mediaAssetManager(void *a1, const char *a2, ...)
{
  return _[a1 mediaAssetManager];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _[a1 mediaType];
}

id objc_msgSend_momentCapturedForStreamToken_requesterID_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "momentCapturedForStreamToken:requesterID:reply:");
}

id objc_msgSend_moments(void *a1, const char *a2, ...)
{
  return _[a1 moments];
}

id objc_msgSend_momentsControllerClientXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 momentsControllerClientXPCInterface];
}

id objc_msgSend_momentsControllerServerXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 momentsControllerServerXPCInterface];
}

id objc_msgSend_momentsGenerator(void *a1, const char *a2, ...)
{
  return _[a1 momentsGenerator];
}

id objc_msgSend_momentsRequestTimeout(void *a1, const char *a2, ...)
{
  return _[a1 momentsRequestTimeout];
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_newRequestWithMediaType_mode_requesteeID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newRequestWithMediaType:mode:requesteeID:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _[a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pendingRequestCount(void *a1, const char *a2, ...)
{
  return _[a1 pendingRequestCount];
}

id objc_msgSend_performFileCopierOperation_onInputURL_outputURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performFileCopierOperation:onInputURL:outputURL:completion:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_registeredStream_withAvailability_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredStream:withAvailability:reply:");
}

id objc_msgSend_remoteIDSDestinations(void *a1, const char *a2, ...)
{
  return _[a1 remoteIDSDestinations];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteRequesteeIDSDestinationFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteRequesteeIDSDestinationFor:");
}

id objc_msgSend_remoteRequesterIDSDestinationFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteRequesterIDSDestinationFor:");
}

id objc_msgSend_removeActiveRequestForTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeActiveRequestForTransactionID:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_renamedResourceURL_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renamedResourceURL:withName:");
}

id objc_msgSend_reportingControllerDataSource(void *a1, const char *a2, ...)
{
  return _[a1 reportingControllerDataSource];
}

id objc_msgSend_requestSandboxExtensionForTransactionID_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSandboxExtensionForTransactionID:reply:");
}

id objc_msgSend_requestSandboxExtensionForURL_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSandboxExtensionForURL:reply:");
}

id objc_msgSend_requesterID(void *a1, const char *a2, ...)
{
  return _[a1 requesterID];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_sandboxDataSource(void *a1, const char *a2, ...)
{
  return _[a1 sandboxDataSource];
}

id objc_msgSend_sandboxDelegate(void *a1, const char *a2, ...)
{
  return _[a1 sandboxDelegate];
}

id objc_msgSend_sandboxURLsByRequestTransactionID(void *a1, const char *a2, ...)
{
  return _[a1 sandboxURLsByRequestTransactionID];
}

id objc_msgSend_saveLivePhotoWithPhotoURL_videoURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveLivePhotoWithPhotoURL:videoURL:completion:");
}

id objc_msgSend_saveVideoWithURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveVideoWithURL:completion:");
}

id objc_msgSend_sendResourceAtURL_metadata_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_serverBag(void *a1, const char *a2, ...)
{
  return _[a1 serverBag];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_serviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 serviceIdentifier];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_sessionForTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionForTransactionID:");
}

id objc_msgSend_sessionsByToken(void *a1, const char *a2, ...)
{
  return _[a1 sessionsByToken];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActiveRequest_forTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveRequest:forTransactionID:");
}

id objc_msgSend_setClientObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientObject:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setIsRegistered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRegistered:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setRemoteIDSDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteIDSDestinations:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setSandboxDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSandboxDelegate:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return _[a1 setup];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldPreserveMomentsFile(void *a1, const char *a2, ...)
{
  return _[a1 shouldPreserveMomentsFile];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithError:");
}

id objc_msgSend_streamToken(void *a1, const char *a2, ...)
{
  return _[a1 streamToken];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_temporaryFileURLByClientFileURL(void *a1, const char *a2, ...)
{
  return _[a1 temporaryFileURLByClientFileURL];
}

id objc_msgSend_transactionID(void *a1, const char *a2, ...)
{
  return _[a1 transactionID];
}

id objc_msgSend_transactionIDByIDSFileIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 transactionIDByIDSFileIdentifier];
}

id objc_msgSend_transferFileAtURL_toDestinations_withMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transferFileAtURL:toDestinations:withMetadata:");
}

id objc_msgSend_unregisterStreamToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterStreamToken:");
}

id objc_msgSend_unzipArchiveAtURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unzipArchiveAtURL:completion:");
}

id objc_msgSend_urlFromResources_withExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlFromResources:withExtension:");
}

id objc_msgSend_userNotificationProviderDataSource(void *a1, const char *a2, ...)
{
  return _[a1 userNotificationProviderDataSource];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_videoMessagingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 videoMessagingEnabled];
}

id objc_msgSend_willCaptureRemoteRequestFromRequesterID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willCaptureRemoteRequestFromRequesterID:");
}

id objc_msgSend_zipDirectoryAtURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zipDirectoryAtURL:completion:");
}