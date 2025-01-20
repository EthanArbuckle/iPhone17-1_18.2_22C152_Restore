id sub_100003F10()
{
  void *v0;
  uint64_t vars8;

  if (qword_100036508 != -1) {
    dispatch_once(&qword_100036508, &stru_100031140);
  }
  v0 = (void *)qword_100036500;

  return v0;
}

void sub_100003F64(id a1)
{
  qword_100036500 = (uint64_t)os_log_create("com.apple.soundscapes.utility", "log");

  _objc_release_x1();
}

uint64_t sub_100004048(uint64_t a1)
{
  qword_100036510 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10000424C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004274(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = sub_100003F10();
  v8 = v7;
  if (!a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Catalog Download Successful", buf, 2u);
    }

    v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_14;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100028BCC();
  }

  unint64_t v9 = WeakRetained[1] + 1;
  WeakRetained[1] = v9;
  v10 = sub_100003F10();
  v11 = v10;
  if (v9 > 2)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100028B58(v11, v15, v16, v17, v18, v19, v20, v21);
    }

    v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_14:
    v14();
    goto LABEL_15;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = 1;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Retrying catalog download in %ld sec", buf, 0xCu);
  }

  dispatch_time_t v12 = dispatch_time(0, 1000000000);
  v13 = WeakRetained[2];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000044BC;
  v22[3] = &unk_100031188;
  objc_copyWeak(&v24, (id *)(a1 + 40));
  id v23 = *(id *)(a1 + 32);
  dispatch_after(v12, v13, v22);

  objc_destroyWeak(&v24);
LABEL_15:
}

void sub_1000044BC(uint64_t a1)
{
  v2 = sub_100003F10();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Retrying catalog download", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained downloadCatalogWithCompleteHandler:*(void *)(a1 + 32)];
}

void sub_1000046A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000046D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  v8 = WeakRetained;
  if (v6)
  {
    unint64_t v9 = sub_100003F10();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100028D40(a2, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    *((unsigned char *)WeakRetained + 24) = 1;
    unint64_t v9 = sub_100003F10();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100028CD0(v9, v16, v17, v18, v19, v20, v21, v22);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004894(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    v7 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
    if (a2)
    {
      v8 = +[NSError errorWithDomain:@"SoundScapesPickerAssetQueryDomain" code:a2 userInfo:0];
      unint64_t v9 = sub_100003F10();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100028E38();
      }
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = [a1[4] results];
    id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v26;
      uint64_t v15 = ASAttributeCompatibilityVersion;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v18 = [a1[5] getAssetVersion:v13 forKey:v15];
          if (v18 < [a1[5] getAssetVersion:v17 forKey:v15])
          {
            id v19 = v17;

            uint64_t v13 = v19;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);

      v7 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
      if (v13)
      {
        uint64_t v20 = [a1[5] _getAssetURLFuture:v13];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100004B8C;
        v23[3] = &unk_100031200;
        id v24 = a1[6];
        id v21 = [v20 addCompletionBlock:v23];

LABEL_24:
        goto LABEL_25;
      }
    }
    else
    {
    }
    uint64_t v13 = [v7[409] errorWithDomain:@"SoundScapesPickerDomain" code:1 userInfo:0];
    uint64_t v22 = sub_100003F10();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100028DF8();
    }

    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_24;
  }
  id v6 = sub_100003F10();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100028EA0();
  }

  (*((void (**)(void))a1[6] + 2))();
LABEL_25:
}

void sub_100004B8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_100003F10();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100028F08();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = [a2 URLByAppendingPathComponent:@"SupportVersion.plist"];
    id v10 = 0;
    v8 = +[NSDictionary dictionaryWithContentsOfURL:v7 error:&v10];
    id v9 = v10;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100004D50(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = sub_100003F10();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100028FA4();
    }
  }
  [*(id *)(a1 + 32) _getSystemVersionsMappingWithCompleteHandler:*(void *)(a1 + 40)];
}

void sub_100004E74(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 32);
  if ([v5 wasLocal]
    && ([*v4 getLocalUrl], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = sub_100003F10();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002907C((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    }

    id v14 = [*v4 getLocalUrl];
    [v3 finishWithResult:v14];
  }
  else
  {
    id v14 = objc_alloc_init((Class)MADownloadOptions);
    [v14 setAllowsCellularAccess:1];
    [v14 setDiscretionary:0];
    uint64_t v15 = sub_100003F10();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10002900C((uint64_t)v4, v15, v16, v17, v18, v19, v20, v21);
    }

    id v22 = *v4;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100004FF0;
    v23[3] = &unk_100031278;
    id v24 = v22;
    id v25 = v3;
    [v24 startDownload:v14 completionWithError:v23];
  }
}

void sub_100004FF0(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    id v4 = a3;
    id v5 = sub_100003F10();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000290EC();
    }

    [*(id *)(a1 + 40) finishWithResult:0 error:v4];
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = a3;
    id v4 = [v6 getLocalFileUrl];
    [*(id *)(a1 + 40) finishWithResult:v4 error:v7];

    uint64_t v8 = sub_100003F10();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asset Successfully downloaded at %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

void sub_100005210(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_100003F10();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000291BC();
  }

  [*(id *)(a1 + 32) _downloadAssetForCompabilityVersions:*(void *)(a1 + 40) withCompleteHandler:*(void *)(a1 + 48)];
}

void sub_1000053A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_100003F10();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100028F08();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (a2)
    {
      id v7 = +[NSError errorWithDomain:@"SoundScapesPickerAssetQueryDomain" code:a2 userInfo:0];
      uint64_t v8 = sub_100003F10();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000292B8(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    uint64_t v16 = [*(id *)(a1 + 32) results];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000055F8;
    v25[3] = &unk_1000312F0;
    uint64_t v17 = *(void **)(a1 + 48);
    v25[4] = *(void *)(a1 + 40);
    id v26 = v17;
    uint64_t v18 = objc_msgSend(v16, "na_filter:", v25);

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100005664;
    v24[3] = &unk_100031318;
    v24[4] = *(void *)(a1 + 40);
    uint64_t v19 = objc_msgSend(v18, "na_map:", v24);
    uint64_t v20 = [*(id *)(a1 + 40) combineAllFutures:v19];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100005670;
    v22[3] = &unk_100031340;
    id v23 = *(id *)(a1 + 56);
    id v21 = [v20 addCompletionBlock:v22];
  }
}

id sub_1000055F8(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) getAssetVersion:a2 forKey:ASAttributeCompatibilityVersion];
  id v4 = *(void **)(a1 + 40);
  id v5 = +[NSNumber numberWithUnsignedInteger:v3];
  id v6 = [v4 containsObject:v5];

  return v6;
}

id sub_100005664(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _getAssetURLFuture:a2];
}

void sub_100005670(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = sub_100003F10();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100029328();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 200), 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000059E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000059F0(uint64_t a1)
{
}

void sub_1000059F8(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    unint64_t v2 = 0;
    do
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      id v4 = *(void **)(v3 + 8 * v2);
      *(void *)(v3 + 8 * v2) = 0;

      ++v2;
    }
    while (v2 < *(void *)(a1 + 40));
  }
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  free(v5);
}

void sub_100005A68(uint64_t a1, void *a2, uint64_t a3)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005B48;
  v7[3] = &unk_100031408;
  uint64_t v14 = a3;
  long long v11 = *(_OWORD *)(a1 + 56);
  id v8 = *(id *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v13 = *(void *)(a1 + 88);
  uint64_t v15 = v5;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v6 = [a2 addCompletionBlock:v7];
}

void sub_100005B48(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 8 * *(void *)(a1 + 96)), a2);
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
  objc_sync_enter(*(id *)(a1 + 32));
  --*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v6) {
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v9 = *(void *)(*(void *)(a1 + 88) + 8);
  if (v8) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = *(unsigned char *)(v9 + 24) == 0;
  }
  if (v10)
  {
    *(unsigned char *)(v9 + 24) = 1;
    objc_sync_exit(*(id *)(a1 + 32));
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100005D7C;
      v20[3] = &unk_1000313E0;
      uint64_t v14 = *(void **)(a1 + 40);
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 64);
      id v21 = v15;
      uint64_t v22 = v16;
      [v14 performBlock:v20];
      id v17 = v21;
    }
    else
    {
      uint64_t v18 = +[NSArray arrayWithObjects:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) count:*(void *)(a1 + 104)];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100005D70;
      v23[3] = &unk_1000313B8;
      uint64_t v19 = *(void **)(a1 + 40);
      id v24 = *(id *)(a1 + 32);
      id v25 = v18;
      id v17 = v18;
      [v19 performBlock:v23];
    }
    goto LABEL_15;
  }
  objc_sync_exit(*(id *)(a1 + 32));
  if (!v8) {
LABEL_15:
  }
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v11, v12, v13);
}

id sub_100005D70(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

id sub_100005D7C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) finishWithError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void sub_100005ED0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005EEC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100005F14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100005F50()
{
  sub_100013690();
  sub_100029AD0("com.apple.SoundScapes", 0x15uLL, 1);
  sub_100029AD0("SSSoundScapeDataSource", 0x16uLL, 1);
  id result = sub_10001D934();
  qword_1000357D8 = (uint64_t)result;
  return result;
}

uint64_t *sub_100005FE0()
{
  if (qword_1000357D0 != -1) {
    swift_once();
  }
  return &qword_1000357D8;
}

void sub_100006044(unsigned int a1)
{
  id v4 = (id)*sub_100005FE0();
  id v1 = v4;
  swift_bridgeObjectRetain();
  NSString v3 = sub_100029A70();
  swift_bridgeObjectRelease();
  [v4 ulog:a1 message:v3];
}

uint64_t sub_1000060E0()
{
  return sub_100029FD0();
}

uint64_t sub_1000060F8()
{
  return sub_100029FC0();
}

uint64_t sub_100006110()
{
  return sub_100029FE0();
}

uint64_t sub_100006128()
{
  return sub_100029FB0();
}

BOOL sub_100006140(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t sub_100006258()
{
  return sub_100029FF0();
}

uint64_t sub_100006324()
{
  return sub_100029E40();
}

unint64_t sub_100006370()
{
  uint64_t v2 = qword_100035830;
  if (!qword_100035830)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035830);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_1000063F0(char *a1, char *a2)
{
  return sub_100006140(*a1, *a2);
}

uint64_t sub_100006414()
{
  return sub_100006324();
}

uint64_t sub_100006430()
{
  return sub_100006258();
}

Swift::Int sub_10000644C(Swift::Int a1)
{
  return sub_100029A30(a1);
}

void sub_100006464(void *a1)
{
  id v58 = a1;
  v56 = sub_100007964;
  v57 = sub_100007A14;
  uint64_t v88 = 0;
  id v81 = 0;
  v89 = a1;
  id v1 = a1;
  if (v58)
  {
    id v54 = v58;
    id v53 = v58;
    [v58 pause];
  }
  sub_100007340((uint64_t)v85);
  if (v86)
  {
    sub_100007A80((uint64_t)v85, (uint64_t)v87);
    id v2 = v58;
    if (v58)
    {
      id v52 = v58;
      id v51 = v58;
      v49 = v59;
      sub_100007A9C((uint64_t)v87, (uint64_t)v59);
      uint64_t v46 = v60;
      sub_100007B00(v59, v60);
      uint64_t v44 = *(void *)(v46 - 8);
      uint64_t v45 = v46 - 8;
      uint64_t v3 = *(void *)(v44 + 64);
      v48 = &v17;
      unint64_t v43 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
      __chkstk_darwin(&v17);
      v47 = (char *)&v17 - v43;
      (*(void (**)(void))(v44 + 16))();
      uint64_t v50 = sub_100029F90();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v47, v46);
      sub_1000073E8((uint64_t)v49);
      [v51 removeTimeObserver:v50];
      swift_unknownObjectRelease();
    }
    sub_1000073E8((uint64_t)v87);
  }
  else
  {
    sub_1000073A4((uint64_t)v85);
  }
  memset(v84, 0, sizeof(v84));
  sub_100007628((uint64_t)v84);
  memset(v83, 0, sizeof(v83));
  sub_100007494((uint64_t)v83);
  sub_1000077EC();
  v40 = (id *)&v55[OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayer];
  v41 = &v82;
  swift_beginAccess();
  id v42 = *v40;
  id v4 = v42;
  swift_endAccess();
  if (v42)
  {
    id v39 = v42;
    id v38 = v42;
    id v81 = v42;
    unint64_t v77 = sub_100029D60(0.5, 44100);
    uint64_t v78 = v5;
    uint64_t v79 = v6;
    unint64_t v19 = v77;
    uint64_t v20 = v5;
    uint64_t v21 = v6;
    sub_100007874();
    id v7 = (void *)sub_100029D20();
    uint64_t v8 = v55;
    id v23 = v7;
    long long v28 = &unk_100031570;
    uint64_t v26 = 24;
    uint64_t v27 = 7;
    uint64_t v18 = swift_allocObject();
    uint64_t v17 = v18 + 16;
    id v9 = v8;
    swift_unknownObjectWeakInit();

    id v10 = v38;
    swift_retain();
    uint64_t v11 = swift_allocObject();
    uint64_t v12 = v56;
    uint64_t v13 = v11;
    uint64_t v14 = v18;
    *(void *)(v13 + 16) = v38;
    *(void *)(v13 + 24) = v14;
    v75 = v12;
    uint64_t v76 = v13;
    v70 = _NSConcreteStackBlock;
    int v30 = 1107296256;
    int v71 = 1107296256;
    int v72 = 0;
    v73 = sub_100006E08;
    v74 = &unk_1000315B0;
    uint64_t v22 = _Block_copy(&v70);
    swift_release();
    swift_release();
    v69[0] = v19;
    v69[1] = v20;
    v69[2] = v21;
    id v25 = [v38 addPeriodicTimeObserverForInterval:v69 queue:v23 usingBlock:v22];
    _Block_release(v22);

    id v24 = &v80;
    sub_100029E00();
    sub_100007494((uint64_t)v24);
    id v15 = v55;
    swift_unknownObjectRelease();
    id v36 = [self defaultCenter];
    id v35 = sub_100006EA4();
    id v34 = [v38 currentItem];
    id v33 = [self mainQueue];
    uint64_t v31 = swift_allocObject();
    uint64_t v29 = v31 + 16;
    id v16 = v15;
    swift_unknownObjectWeakInit();

    swift_retain();
    v66 = v57;
    uint64_t v67 = v31;
    v61 = _NSConcreteStackBlock;
    int v62 = v30;
    int v63 = 0;
    v64 = sub_100006FBC;
    v65 = &unk_1000315D8;
    uint64_t v32 = _Block_copy(&v61);
    swift_release();
    swift_release();
    id v37 = [v36 addObserverForName:v35 object:v34 queue:v33 usingBlock:v32];
    _Block_release(v32);

    swift_unknownObjectRelease();
    v68[3] = swift_getObjectType();
    v68[0] = v37;
    sub_100007628((uint64_t)v68);
  }
}

void sub_100006AF8(uint64_t a1, uint64_t a2, uint64_t a3, id a4, uint64_t a5)
{
  uint64_t v18 = 0;
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v28 = a3;
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  id v22 = a4;
  uint64_t v21 = a5 + 16;
  id v12 = [a4 currentItem];
  if (v12)
  {
    [v12 duration];

    uint64_t v8 = v13;
    id v9 = (void *)(v14 | ((unint64_t)v15 << 32));
    id v10 = v16;
    char v11 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = 0;
    id v10 = 0;
    char v11 = 1;
  }
  if ((v11 & 1) == 0)
  {
    uint64_t v18 = v8;
    unint64_t v19 = v9;
    uint64_t v20 = v10;
    v17[4] = v8;
    v17[5] = v9;
    v17[6] = v10;
    char v5 = sub_100029D80();
    if (v5)
    {
      swift_beginAccess();
      v17[0] = (id)swift_unknownObjectWeakLoadStrong();
      if (v17[0])
      {
        id v7 = v17[0];
        id v6 = v17[0];
        sub_100010C8C(v17);
        swift_endAccess();
        sub_100029D70();
        sub_100029D70();
        sub_1000077EC();
      }
      else
      {
        sub_100010C8C(v17);
        swift_endAccess();
      }
    }
  }
}

uint64_t sub_100006E08(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  id v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v6(v3, v4, v5);
  return swift_release();
}

NSString sub_100006EA4()
{
  sub_100029AD0("AVPlayerItemDidPlayToEndTimeNotification", 0x28uLL, 1);
  NSString v1 = sub_100029A70();
  swift_bridgeObjectRelease();
  return v1;
}

void sub_100006EF8(void *a1, uint64_t a2)
{
  v4[5] = a1;
  v4[4] = (id)(a2 + 16);
  swift_beginAccess();
  v4[0] = (id)swift_unknownObjectWeakLoadStrong();
  if (v4[0])
  {
    id v3 = v4[0];
    id v2 = v4[0];
    sub_100010C8C(v4);
    swift_endAccess();
    sub_100009FBC();
  }
  else
  {
    sub_100010C8C(v4);
    swift_endAccess();
  }
}

uint64_t sub_100006FBC(uint64_t a1, void *a2)
{
  uint64_t v6 = a1;
  id v13 = a2;
  uint64_t v12 = sub_100029460();
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v7 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v6);
  char v11 = (char *)&v5 - v7;
  uint64_t v8 = *(void (**)(char *))(v2 + 32);
  uint64_t v14 = *(void *)(v2 + 40);
  swift_retain();
  id v3 = v13;
  sub_100029450();
  v8(v11);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v12);

  return swift_release();
}

id sub_1000070CC()
{
  id v3 = (id *)(v0 + OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayer);
  swift_beginAccess();
  id v4 = *v3;
  id v1 = *v3;
  swift_endAccess();
  return v4;
}

void sub_100007134(void *a1)
{
  uint64_t v5 = (id *)(v1 + OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayer);
  swift_beginAccess();
  id v7 = *v5;
  id v2 = *v5;
  swift_endAccess();
  id v3 = a1;
  uint64_t v6 = (void **)(v1 + OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayer);
  swift_beginAccess();
  id v4 = *v6;
  *uint64_t v6 = a1;

  swift_endAccess();
  sub_100006464(v7);
}

void (*sub_100007210(void *a1))(id **a1, char a2)
{
  uint64_t v5 = malloc(0x28uLL);
  *a1 = v5;
  v5[4] = v1;
  id v4 = (id *)(v1 + OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayer);
  swift_beginAccess();
  id v6 = *v4;
  id v2 = *v4;
  swift_endAccess();
  v5[3] = v6;
  return sub_1000072C0;
}

void sub_1000072C0(id **a1, char a2)
{
  id v4 = *a1;
  if (a2)
  {
    id v3 = v4[3];
    id v2 = v3;
    sub_100007134(v3);
    sub_100010C8C(v4 + 3);
  }
  else
  {
    sub_100007134(v4[3]);
  }
  free(v4);
}

uint64_t sub_100007340@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayerPeriodicObserver;
  swift_beginAccess();
  sub_100007B78(v3, a1);
  return swift_endAccess();
}

uint64_t sub_1000073A4(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    sub_1000073E8(a1);
  }
  return a1;
}

uint64_t sub_1000073E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

uint64_t sub_100007494(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = a1;
  sub_100007B78(a1, (uint64_t)v5);
  uint64_t v3 = v1 + OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayerPeriodicObserver;
  swift_beginAccess();
  sub_100007C10(v5, v3);
  swift_endAccess();
  return sub_1000073A4(a1);
}

uint64_t (*sub_100007518())()
{
  return sub_100007584;
}

uint64_t sub_100007584()
{
  return swift_endAccess();
}

uint64_t sub_1000075C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayerEndtimeObserver;
  swift_beginAccess();
  sub_100007B78(v3, a1);
  return swift_endAccess();
}

uint64_t sub_100007628(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = a1;
  sub_100007B78(a1, (uint64_t)v5);
  uint64_t v3 = v1 + OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayerEndtimeObserver;
  swift_beginAccess();
  sub_100007C10(v5, v3);
  swift_endAccess();
  return sub_1000073A4(a1);
}

uint64_t (*sub_1000076AC())()
{
  return sub_100007584;
}

uint64_t sub_100007718@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)&v3[1] = a2;
  *(double *)uint64_t v3 = a2;
  return sub_1000101B0((uint64_t)v3, (uint64_t)&type metadata for Double, a1);
}

double sub_100007750()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100029600();
  swift_release();
  swift_release();

  return v3;
}

uint64_t sub_1000077EC()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_100029610();
}

unint64_t sub_100007874()
{
  uint64_t v2 = qword_100035840;
  if (!qword_100035840)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100035840);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1000078DC()
{
  return swift_deallocObject();
}

uint64_t sub_10000791C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_100007964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100006AF8(a1, a2, a3, *(id *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_1000079B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_1000079F8()
{
  return swift_release();
}

void sub_100007A14(void *a1)
{
  sub_100006EF8(a1, v1);
}

uint64_t sub_100007A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_100007A64()
{
  return swift_release();
}

__n128 sub_100007A80(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_100007A9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

void *sub_100007B00(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  }
  return result;
}

uint64_t sub_100007B78(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    uint64_t v2 = *(void *)(a1 + 24);
    *(void *)(a2 + 24) = v2;
    (**(void (***)(void))(v2 - 8))();
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  }
  return a2;
}

uint64_t sub_100007C10(_OWORD *a1, uint64_t a2)
{
  if (*(void *)(a2 + 24))
  {
    sub_1000073E8(a2);
    *(_OWORD *)a2 = *a1;
    *(_OWORD *)(a2 + 16) = a1[1];
  }
  else
  {
    *(_OWORD *)a2 = *a1;
    *(_OWORD *)(a2 + 16) = a1[1];
  }
  return a2;
}

void (*sub_100007CFC(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v3;
  id v1 = v3;
  v4[5] = swift_getKeyPath();
  id v4[6] = swift_getKeyPath();
  v4[7] = sub_1000295F0();
  return sub_100007DD4;
}

void sub_100007DD4(uint64_t *a1, char a2)
{
  uint64_t v4 = *a1;
  if (a2)
  {
    id v2 = *(id *)(v4 + 32);
    (*(void (**)(uint64_t, void))(v4 + 56))(v4, 0);
    swift_release();
    swift_release();
  }
  else
  {
    id v3 = *(void **)(v4 + 32);
    (*(void (**)(uint64_t, void))(v4 + 56))(v4, 0);
    swift_release();
    swift_release();
  }
  free((void *)v4);
}

uint64_t sub_100007EB0()
{
  return swift_endAccess();
}

uint64_t sub_100007F24(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = sub_1000102A0(&qword_100035868);
  uint64_t v5 = *(void *)(v8 - 8);
  uint64_t v6 = v8 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  v4[1] = (char *)v4 - v4[0];
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  (*(void (**)(void))(v5 + 16))();
  v4[2] = &v9;
  swift_beginAccess();
  sub_1000102A0(&qword_100035860);
  sub_1000295E0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

void (*sub_100008068(void *a1))(void **a1, char a2)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  *uint64_t v6 = v1;
  uint64_t v2 = sub_1000102A0(&qword_100035868);
  v6[1] = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  v6[2] = v4;
  size_t __size = *(void *)(v4 + 64);
  v6[3] = malloc(__size);
  v6[4] = malloc(__size);
  sub_100007EB0();
  return sub_100008170;
}

void sub_100008170(void **a1, char a2)
{
  uint64_t v8 = *a1;
  if (a2)
  {
    uint64_t v4 = (void *)v8[4];
    uint64_t v5 = (void *)v8[3];
    uint64_t v3 = v8[1];
    uint64_t v2 = v8[2];
    (*(void (**)(void))(v2 + 16))();
    sub_100007F24((uint64_t)v5);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v3);
    free(v4);
    free(v5);
  }
  else
  {
    uint64_t v6 = (void *)v8[4];
    uint64_t v7 = (void *)v8[3];
    sub_100007F24((uint64_t)v6);
    free(v6);
    free(v7);
  }
  free(v8);
}

uint64_t sub_10000826C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v6[1] = a1;
  swift_retain();
  v6[0] = a1;
  uint64_t v2 = sub_1000102A0(&qword_100035870);
  sub_1000101B0((uint64_t)v6, v2, a2);
  return swift_release();
}

uint64_t sub_1000082D0()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100029600();
  swift_release();
  swift_release();

  return v3;
}

uint64_t sub_10000836C()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100029610();
  return swift_release();
}

void (*sub_100008410(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v3;
  id v1 = v3;
  v4[5] = swift_getKeyPath();
  id v4[6] = swift_getKeyPath();
  v4[7] = sub_1000295F0();
  return sub_100007DD4;
}

uint64_t sub_1000084E8()
{
  return swift_endAccess();
}

uint64_t sub_10000855C(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = sub_1000102A0(&qword_100036190);
  uint64_t v5 = *(void *)(v8 - 8);
  uint64_t v6 = v8 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  v4[1] = (char *)v4 - v4[0];
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  (*(void (**)(void))(v5 + 16))();
  v4[2] = &v9;
  swift_beginAccess();
  sub_1000102A0((uint64_t *)&unk_100035880);
  sub_1000295E0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

void (*sub_1000086A0(void *a1))(void **a1, char a2)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  *uint64_t v6 = v1;
  uint64_t v2 = sub_1000102A0(&qword_100036190);
  v6[1] = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  void v6[2] = v4;
  size_t __size = *(void *)(v4 + 64);
  v6[3] = malloc(__size);
  v6[4] = malloc(__size);
  sub_1000084E8();
  return sub_1000087A8;
}

void sub_1000087A8(void **a1, char a2)
{
  uint64_t v8 = *a1;
  if (a2)
  {
    uint64_t v4 = (void *)v8[4];
    uint64_t v5 = (void *)v8[3];
    uint64_t v3 = v8[1];
    uint64_t v2 = v8[2];
    (*(void (**)(void))(v2 + 16))();
    sub_10000855C((uint64_t)v5);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v3);
    free(v4);
    free(v5);
  }
  else
  {
    uint64_t v6 = (void *)v8[4];
    uint64_t v7 = (void *)v8[3];
    sub_10000855C((uint64_t)v6);
    free(v6);
    free(v7);
  }
  free(v8);
}

uint64_t sub_1000088A4@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  v3[1] = a1 & 1;
  v3[0] = a1 & 1;
  return sub_1000101B0((uint64_t)v3, (uint64_t)&type metadata for Bool, a2);
}

uint64_t sub_1000088EC()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100029600();
  swift_release();
  swift_release();

  return v3 & 1;
}

uint64_t sub_10000898C()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_100029610();
}

void (*sub_100008A30(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v3;
  id v1 = v3;
  v4[5] = swift_getKeyPath();
  id v4[6] = swift_getKeyPath();
  v4[7] = sub_1000295F0();
  return sub_100007DD4;
}

uint64_t sub_100008B08()
{
  return swift_endAccess();
}

uint64_t sub_100008B7C(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = sub_1000102A0(&qword_1000358A0);
  uint64_t v5 = *(void *)(v8 - 8);
  uint64_t v6 = v8 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  v4[1] = (char *)v4 - v4[0];
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  (*(void (**)(void))(v5 + 16))();
  v4[2] = &v9;
  swift_beginAccess();
  sub_1000102A0(&qword_100035898);
  sub_1000295E0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

void (*sub_100008CC0(void *a1))(void **a1, char a2)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  *uint64_t v6 = v1;
  uint64_t v2 = sub_1000102A0(&qword_1000358A0);
  v6[1] = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  void v6[2] = v4;
  size_t __size = *(void *)(v4 + 64);
  v6[3] = malloc(__size);
  v6[4] = malloc(__size);
  sub_100008B08();
  return sub_100008DC8;
}

void sub_100008DC8(void **a1, char a2)
{
  uint64_t v8 = *a1;
  if (a2)
  {
    uint64_t v4 = (void *)v8[4];
    uint64_t v5 = (void *)v8[3];
    uint64_t v3 = v8[1];
    uint64_t v2 = v8[2];
    (*(void (**)(void))(v2 + 16))();
    sub_100008B7C((uint64_t)v5);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v3);
    free(v4);
    free(v5);
  }
  else
  {
    uint64_t v6 = (void *)v8[4];
    uint64_t v7 = (void *)v8[3];
    sub_100008B7C((uint64_t)v6);
    free(v6);
    free(v7);
  }
  free(v8);
}

uint64_t sub_100008EC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v6[1] = a1;
  swift_bridgeObjectRetain();
  v6[0] = a1;
  uint64_t v2 = sub_1000102A0(&qword_1000358A8);
  sub_1000101B0((uint64_t)v6, v2, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100008F2C()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100029600();
  swift_release();
  swift_release();

  return v3;
}

uint64_t sub_100008FC8()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_100029610();
  return swift_bridgeObjectRelease();
}

void (*sub_10000906C(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v3;
  id v1 = v3;
  v4[5] = swift_getKeyPath();
  id v4[6] = swift_getKeyPath();
  v4[7] = sub_1000295F0();
  return sub_100007DD4;
}

uint64_t sub_100009144()
{
  return swift_endAccess();
}

uint64_t sub_1000091B8(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = sub_1000102A0(&qword_1000358C0);
  uint64_t v5 = *(void *)(v8 - 8);
  uint64_t v6 = v8 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  v4[1] = (char *)v4 - v4[0];
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  (*(void (**)(void))(v5 + 16))();
  v4[2] = &v9;
  swift_beginAccess();
  sub_1000102A0(&qword_1000358B8);
  sub_1000295E0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

void (*sub_1000092FC(void *a1))(void **a1, char a2)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  *uint64_t v6 = v1;
  uint64_t v2 = sub_1000102A0(&qword_1000358C0);
  v6[1] = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  void v6[2] = v4;
  size_t __size = *(void *)(v4 + 64);
  v6[3] = malloc(__size);
  v6[4] = malloc(__size);
  sub_100009144();
  return sub_100009404;
}

void sub_100009404(void **a1, char a2)
{
  uint64_t v8 = *a1;
  if (a2)
  {
    uint64_t v4 = (void *)v8[4];
    uint64_t v5 = (void *)v8[3];
    uint64_t v3 = v8[1];
    uint64_t v2 = v8[2];
    (*(void (**)(void))(v2 + 16))();
    sub_1000091B8((uint64_t)v5);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v3);
    free(v4);
    free(v5);
  }
  else
  {
    uint64_t v6 = (void *)v8[4];
    uint64_t v7 = (void *)v8[3];
    sub_1000091B8((uint64_t)v6);
    free(v6);
    free(v7);
  }
  free(v8);
}

uint64_t sub_100009500@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  v3[1] = a1;
  v3[0] = a1;
  return sub_1000101B0((uint64_t)v3, (uint64_t)&unk_1000317B0, a2);
}

uint64_t sub_100009540()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100029600();
  swift_release();
  swift_release();

  return v3;
}

uint64_t sub_1000095DC()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_100029610();
}

void (*sub_100009668(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v3;
  id v1 = v3;
  v4[5] = swift_getKeyPath();
  id v4[6] = swift_getKeyPath();
  v4[7] = sub_1000295F0();
  return sub_100007DD4;
}

uint64_t sub_100009740()
{
  return swift_endAccess();
}

uint64_t sub_1000097B4(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = sub_1000102A0(&qword_1000358D8);
  uint64_t v5 = *(void *)(v8 - 8);
  uint64_t v6 = v8 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  v4[1] = (char *)v4 - v4[0];
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  (*(void (**)(void))(v5 + 16))();
  v4[2] = &v9;
  swift_beginAccess();
  sub_1000102A0(&qword_1000358D0);
  sub_1000295E0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

void (*sub_1000098F8(void *a1))(void **a1, char a2)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  *uint64_t v6 = v1;
  uint64_t v2 = sub_1000102A0(&qword_1000358D8);
  v6[1] = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  void v6[2] = v4;
  size_t __size = *(void *)(v4 + 64);
  v6[3] = malloc(__size);
  v6[4] = malloc(__size);
  sub_100009740();
  return sub_100009A00;
}

void sub_100009A00(void **a1, char a2)
{
  uint64_t v8 = *a1;
  if (a2)
  {
    uint64_t v4 = (void *)v8[4];
    uint64_t v5 = (void *)v8[3];
    uint64_t v3 = v8[1];
    uint64_t v2 = v8[2];
    (*(void (**)(void))(v2 + 16))();
    sub_1000097B4((uint64_t)v5);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v3);
    free(v4);
    free(v5);
  }
  else
  {
    uint64_t v6 = (void *)v8[4];
    uint64_t v7 = (void *)v8[3];
    sub_1000097B4((uint64_t)v6);
    free(v6);
    free(v7);
  }
  free(v8);
}

uint64_t sub_100009AFC()
{
  uint64_t v41 = 0;
  uint64_t v38 = 0;
  id v37 = 0;
  uint64_t v27 = sub_1000294C0();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = v27 - 8;
  unint64_t v30 = (*(void *)(v28 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v27);
  uint64_t v31 = (uint64_t)&v10 - v30;
  uint64_t v41 = v0;
  uint64_t v44 = 0;
  id v34 = [self sharedInstance];
  AVAudioSessionCategory v33 = AVAudioSessionCategoryPlayback;
  uint64_t v1 = AVAudioSessionCategoryPlayback;
  id v40 = v44;
  unsigned int v35 = [v34 setCategory:v33 error:&v40];
  id v32 = v40;
  id v2 = v40;
  uint64_t v3 = v44;
  uint64_t v44 = v32;

  if ((v35 & 1) == 0)
  {
    id v15 = v44;
    uint64_t v16 = sub_100029480();

    swift_willThrow();
    swift_errorRelease();
  }
  uint64_t v26 = sub_100009F20();
  if (v26)
  {
    uint64_t v25 = v26;
    uint64_t v20 = v26;
    uint64_t v38 = v26;
    sub_100010310();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v31, v20 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_audioAddress, v27);
    id v21 = sub_10000A11C(v31);
    id v37 = v21;
    id v4 = v21;
    sub_100007134(v21);
    [v21 play];
    id v42 = 0;
    id v23 = [self sharedInstance];
    id v36 = v42;
    unsigned int v24 = [v23 setActive:1 error:&v36];
    id v22 = v36;
    id v5 = v36;
    uint64_t v6 = v42;
    id v42 = v22;

    if ((v24 & 1) == 0)
    {
      id v13 = v42;
      uint64_t v14 = sub_100029480();

      swift_willThrow();
      swift_errorRelease();
    }

    return swift_release();
  }
  else
  {
    sub_100007134(0);
    unint64_t v43 = 0;
    id v18 = [self sharedInstance];
    id v39 = v43;
    unsigned int v19 = [v18 setActive:0 error:&v39];
    id v17 = v39;
    id v8 = v39;
    char v9 = v43;
    unint64_t v43 = v17;

    uint64_t result = v19;
    if ((v19 & 1) == 0)
    {
      id v11 = v43;
      uint64_t v12 = sub_100029480();

      swift_willThrow();
      return swift_errorRelease();
    }
  }
  return result;
}

uint64_t sub_100009F20()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100029600();
  swift_release();
  swift_release();

  return v3;
}

uint64_t sub_100009FBC()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100029610();
  sub_100009AFC();
  return swift_release();
}

uint64_t (*sub_10000A054(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  *a1 = sub_100009F20();
  return sub_10000A0B0;
}

uint64_t sub_10000A0B0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return sub_100009FBC();
  }
  swift_retain();
  sub_100009FBC();
  uint64_t result = a1;
  sub_100012014();
  return result;
}

id sub_10000A11C(uint64_t a1)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_10000FC80(a1, v2);
}

uint64_t sub_10000A15C()
{
  return swift_endAccess();
}

uint64_t sub_10000A1D0(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = sub_1000102A0(&qword_100036190);
  uint64_t v5 = *(void *)(v8 - 8);
  uint64_t v6 = v8 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  v4[1] = (char *)v4 - v4[0];
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  (*(void (**)(void))(v5 + 16))();
  v4[2] = &v9;
  swift_beginAccess();
  sub_1000102A0((uint64_t *)&unk_100035880);
  sub_1000295E0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

void (*sub_10000A314(void *a1))(void **a1, char a2)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  *uint64_t v6 = v1;
  uint64_t v2 = sub_1000102A0(&qword_100036190);
  v6[1] = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  void v6[2] = v4;
  size_t __size = *(void *)(v4 + 64);
  v6[3] = malloc(__size);
  v6[4] = malloc(__size);
  sub_10000A15C();
  return sub_10000A41C;
}

void sub_10000A41C(void **a1, char a2)
{
  uint64_t v8 = *a1;
  if (a2)
  {
    uint64_t v4 = (void *)v8[4];
    uint64_t v5 = (void *)v8[3];
    uint64_t v3 = v8[1];
    uint64_t v2 = v8[2];
    (*(void (**)(void))(v2 + 16))();
    sub_10000A1D0((uint64_t)v5);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v3);
    free(v4);
    free(v5);
  }
  else
  {
    uint64_t v6 = (void *)v8[4];
    uint64_t v7 = (void *)v8[3];
    sub_10000A1D0((uint64_t)v6);
    free(v6);
    free(v7);
  }
  free(v8);
}

uint64_t sub_10000A518()
{
  return sub_10000836C();
}

uint64_t sub_10000A574(uint64_t a1, uint64_t a2)
{
  uint64_t v57 = a1;
  uint64_t v56 = a2;
  intptr_t v87 = 0;
  int v63 = sub_100010468;
  v91 = sub_10000B214;
  id v51 = sub_10000B214;
  id v52 = sub_100010830;
  id v53 = sub_10000B214;
  id v54 = sub_100010830;
  uint64_t v129 = 0;
  uint64_t v128 = 0;
  uint64_t v127 = 0;
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  uint64_t v123 = 0;
  dispatch_semaphore_t v122 = 0;
  uint64_t v88 = 0;
  uint64_t v99 = 0;
  uint64_t v96 = 0;
  uint64_t v94 = 0;
  uint64_t v70 = sub_100029970();
  uint64_t v67 = *(void *)(v70 - 8);
  uint64_t v68 = v70 - 8;
  unint64_t v55 = (*(void *)(v67 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  v69 = (uint64_t *)((char *)&v25 - v55);
  uint64_t v74 = sub_1000299D0();
  uint64_t v71 = *(void *)(v74 - 8);
  uint64_t v72 = v74 - 8;
  uint64_t v59 = *(void *)(v71 + 64);
  unint64_t v58 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v57);
  v73 = (char *)&v25 - v58;
  unint64_t v60 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v2);
  unint64_t v77 = (char *)&v25 - v60;
  uint64_t v129 = v3;
  uint64_t v128 = v4;
  uint64_t v127 = v5;
  uint64_t v62 = 7;
  uint64_t v80 = swift_allocObject();
  uint64_t v78 = v80 + 16;
  uint64_t v123 = v80 + 16;
  sub_1000102A0(&qword_1000358F0);
  uint64_t v61 = sub_100029F80();
  unint64_t v83 = sub_1000103B8();
  char v82 = &type metadata for String;
  v84 = &protocol witness table for String;
  uint64_t v6 = sub_100029A00();
  intptr_t v7 = v87;
  *(void *)(v80 + 16) = v6;
  dispatch_semaphore_t v66 = dispatch_semaphore_create(v7);
  dispatch_semaphore_t v122 = v66;
  id v65 = [self sharedInstance];
  uint64_t v8 = v66;
  swift_retain();
  uint64_t v79 = 32;
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = v63;
  uint64_t v11 = v9;
  uint64_t v12 = v80;
  *(void *)(v11 + 16) = v66;
  *(void *)(v11 + 24) = v12;
  v120 = v10;
  uint64_t v121 = v11;
  aBlock = _NSConcreteStackBlock;
  int v116 = 1107296256;
  int v117 = 0;
  v118 = sub_10000B0DC;
  v119 = &unk_100031650;
  v64 = _Block_copy(&aBlock);
  swift_release();
  [v65 getSystemVersionsMappingWithCompleteHandler:v64];
  _Block_release(v64);

  sub_1000299B0();
  uint64_t v13 = v67;
  void *v69 = 1;
  (*(void (**)(void))(v13 + 104))();
  sub_1000299C0();
  (*(void (**)(void *, uint64_t))(v67 + 8))(v69, v70);
  uint64_t v76 = *(void (**)(char *, uint64_t))(v71 + 8);
  uint64_t v75 = v71 + 8;
  v76(v73, v74);
  sub_100029D40();
  v76(v77, v74);
  id v81 = &v107;
  swift_beginAccess();
  uint64_t v85 = *(void *)(v80 + 16);
  swift_bridgeObjectRetain();
  swift_endAccess();
  uint64_t v86 = sub_100029A10();
  swift_bridgeObjectRelease();
  v106[1] = v86;
  uint64_t v89 = sub_1000102A0(&qword_100035900);
  uint64_t v90 = type metadata accessor for OperatingSystemVersion();
  sub_10001057C();
  uint64_t v14 = sub_100029B20();
  uint64_t v92 = 0;
  uint64_t v93 = v14;
  uint64_t v47 = v14;
  sub_100010678();
  uint64_t v50 = v106;
  v106[0] = v47;
  uint64_t v49 = sub_1000102A0(&qword_100035910);
  unint64_t v48 = sub_1000106A4();
  sub_100010728();
  sub_100029B40();
  sub_100010678();
  uint64_t v102 = v108;
  uint64_t v103 = v109;
  uint64_t v104 = v110;
  char v105 = v111 & 1;
  if (v111)
  {
    uint64_t v112 = 16;
    uint64_t v113 = 1;
    uint64_t v114 = 0;
  }
  else
  {
    uint64_t v112 = v102;
    uint64_t v113 = v103;
    uint64_t v114 = v104;
  }
  uint64_t v15 = v92;
  uint64_t v40 = v112;
  uint64_t v41 = v113;
  uint64_t v42 = v114;
  uint64_t v124 = v112;
  uint64_t v125 = v113;
  uint64_t v126 = v114;
  uint64_t v101 = v57;
  uint64_t v43 = sub_1000102A0(&qword_100035928);
  unint64_t v44 = sub_1000107AC();
  uint64_t result = sub_100029B20();
  uint64_t v45 = v15;
  uint64_t v46 = result;
  if (v15)
  {
    __break(1u);
    __break(1u);
    __break(1u);
    __break(1u);
  }
  else
  {
    uint64_t v100 = v46;
    unsigned int v35 = &v25;
    __chkstk_darwin(&v25);
    uint64_t v17 = v41;
    id v18 = &v25 - 6;
    id v36 = &v25 - 6;
    v18[2] = v40;
    v18[3] = v17;
    v18[4] = v19;
    unint64_t v37 = sub_100010864();
    uint64_t v20 = sub_100029E70();
    uint64_t v38 = 0;
    uint64_t v39 = v20;
    uint64_t v32 = v20;
    uint64_t v99 = v20;
    uint64_t v98 = v56;
    uint64_t v21 = sub_100029B20();
    uint64_t v33 = 0;
    uint64_t v34 = v21;
    uint64_t v97 = v34;
    unint64_t v30 = &v25;
    __chkstk_darwin(v54);
    uint64_t v22 = v41;
    id v23 = &v25 - 6;
    v23[2] = v40;
    v23[3] = v22;
    void v23[4] = v24;
    uint64_t v31 = sub_100029E70();
    uint64_t v27 = v31;
    uint64_t v96 = v31;
    swift_bridgeObjectRetain();
    uint64_t v28 = &v95;
    uint64_t v95 = v32;
    sub_1000108E8();
    int v29 = sub_100029CD0();
    sub_100010678();
    if (v29)
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = v27;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = v32;
    }
    uint64_t v25 = v26;
    uint64_t v94 = v26;
    sub_10000DE84(v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return swift_release();
  }
  return result;
}

Swift::Int sub_10000AE0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_errorRetain();
  if (a2)
  {
    sub_100029F70();
    v8._countAndFlagsBits = sub_100029AD0("Error getting system version mapping ", 0x25uLL, 1);
    sub_100029F60(v8);
    swift_bridgeObjectRelease();
    swift_getErrorValue();
    sub_100029FA0();
    sub_100029F50();
    sub_100012D00();
    v9._countAndFlagsBits = sub_100029AD0("", 0, 1);
    sub_100029F60(v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_100012D00();
    sub_100029AB0();
    sub_100006044(0x5Au);
    swift_bridgeObjectRelease();
    swift_errorRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    if (a1)
    {
      swift_bridgeObjectRetain();
      swift_beginAccess();
      *(void *)(a4 + 16) = a1;
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
    else
    {
      sub_100029AD0("Error getting system version mapping for unknown error", 0x36uLL, 1);
      sub_100006044(0x5Au);
    }
    swift_bridgeObjectRelease();
  }
  return sub_10000B0A4();
}

Swift::Int sub_10000B0A4()
{
  return sub_100029D50();
}

uint64_t sub_10000B0DC(uint64_t a1, void *a2, void *a3)
{
  Swift::String v9 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  id v3 = a2;
  if (a2)
  {
    sub_1000103B8();
    uint64_t v6 = sub_1000299F0();

    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v4 = a3;
  v9(v7);
  swift_errorRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_10000B214@<X0>(uint64_t a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_10001C4B0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4 & 1;
  return result;
}

uint64_t sub_10000B288()
{
  return sub_100029A50() & 1;
}

uint64_t sub_10000B41C(uint64_t a1)
{
  v2[6] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = v1;
  return _swift_task_switch(sub_10000B464, 0, 0);
}

uint64_t sub_10000B464()
{
  uint64_t v4 = v0[6];
  v0[2] = v0;
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_task_alloc();
  v0[7] = v6;
  *(void *)(v6 + 16) = v4;
  uint64_t v7 = (char *)&dword_100035950 + dword_100035950;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v5 + 64) = v1;
  uint64_t v2 = sub_1000102A0(&qword_100035958);
  void *v1 = *(void *)(v5 + 16);
  v1[1] = sub_10000B59C;
  return ((uint64_t (*)(uint64_t, void, void, void (*)(uint64_t), uint64_t, uint64_t))v7)(v5 + 40, 0, 0, sub_10001096C, v6, v2);
}

uint64_t sub_10000B59C()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10000B778;
  }
  else
  {
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_10000B728;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000B728()
{
  *(void *)(v0 + 16) = v0;
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 8))(*(void *)(v0 + 40));
}

uint64_t sub_10000B778()
{
  *(void *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 16) + 8);
  return v1();
}

void sub_10000B830(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = a1;
  uint64_t v14 = a2;
  id v6 = [self sharedInstance];
  swift_bridgeObjectRetain();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  uint64_t v12 = sub_100013254;
  uint64_t v13 = v2;
  aBlock = _NSConcreteStackBlock;
  int v8 = 1107296256;
  int v9 = 0;
  uint64_t v10 = sub_10000B0DC;
  uint64_t v11 = &unk_100031988;
  uint64_t v5 = _Block_copy(&aBlock);
  swift_release();
  [v6 getSystemVersionsMappingWithCompleteHandler:v5];
  _Block_release(v5);
}

uint64_t sub_10000B968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v59 = a1;
  uint64_t v52 = a2;
  uint64_t v53 = a3;
  uint64_t v54 = a4;
  unint64_t v55 = sub_10000C148;
  uint64_t v56 = sub_1000132C4;
  uint64_t v57 = sub_100013374;
  uint64_t v67 = 0;
  uint64_t v65 = 0;
  uint64_t v58 = 0;
  uint64_t v63 = 0;
  uint64_t v61 = 0;
  uint64_t v80 = a1;
  uint64_t v79 = a2;
  uint64_t v78 = a3;
  uint64_t v77 = a4;
  swift_bridgeObjectRetain();
  if (v59)
  {
    uint64_t v51 = v59;
    uint64_t v5 = v58;
    uint64_t v43 = v59;
    uint64_t v65 = v59;
    uint64_t v64 = v59;
    unint64_t v44 = v20;
    __chkstk_darwin(v20);
    uint64_t v45 = v19;
    v19[2] = v55;
    v19[3] = 0;
    uint64_t v46 = sub_1000102A0(&qword_100035B58);
    uint64_t v47 = sub_1000102A0(&qword_100035B60);
    sub_1000132F0();
    uint64_t v6 = sub_100029B20();
    uint64_t v48 = v5;
    uint64_t v49 = v6;
    uint64_t v39 = v6;
    uint64_t v63 = v6;
    uint64_t v62 = v54;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v38 = v19;
    __chkstk_darwin(v19);
    uint64_t v7 = &v19[-4];
    uint64_t v40 = &v19[-4];
    v7[2] = v39;
    v7[3] = v8;
    uint64_t v41 = sub_1000102A0(&qword_100035910);
    sub_1000106A4();
    uint64_t v42 = sub_100029B20();
    uint64_t v37 = v42;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v61 = v37;
    swift_bridgeObjectRetain();
    id v36 = &v60;
    uint64_t v60 = v37;
    uint64_t v35 = sub_1000102A0(&qword_100035958);
    sub_1000102A0(&qword_100035AF0);
    sub_10000C80C((uint64_t)v36, v53, v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v75 = sub_100029F70();
    uint64_t v76 = v4;
    v81._countAndFlagsBits = sub_100029AD0("Error fetching system version mapping ", 0x26uLL, 1);
    object = v81._object;
    sub_100029F60(v81);
    swift_bridgeObjectRelease();
    swift_errorRetain();
    if (v52)
    {
      uint64_t v30 = v52;
      swift_getErrorValue();
      uint64_t v31 = sub_100029FA0();
      uint64_t v32 = v10;
      swift_errorRelease();
      uint64_t v33 = v31;
      uint64_t v34 = v32;
    }
    else
    {
      uint64_t v33 = 0;
      uint64_t v34 = 0;
    }
    uint64_t v71 = v33;
    uint64_t v72 = v34;
    if (v34)
    {
      uint64_t v73 = v71;
      uint64_t v74 = v72;
    }
    else
    {
      uint64_t v73 = sub_100029AD0("Unknown error", 0xDuLL, 1);
      uint64_t v74 = v11;
      sub_100012D00();
    }
    id v23 = v70;
    v70[0] = v73;
    v70[1] = v74;
    uint64_t v25 = &v75;
    sub_100029F50();
    sub_100012D00();
    v82._countAndFlagsBits = sub_100029AD0("", 0, 1);
    uint64_t v24 = v82._object;
    sub_100029F60(v82);
    swift_bridgeObjectRelease();
    uint64_t v27 = v75;
    uint64_t v26 = v76;
    swift_bridgeObjectRetain();
    sub_100012D00();
    uint64_t v28 = sub_100029AB0();
    uint64_t v29 = v12;
    sub_100006044(0x5Au);
    swift_bridgeObjectRelease();
    swift_errorRetain();
    uint64_t v68 = v52;
    if (v52)
    {
      uint64_t v69 = v68;
    }
    else
    {
      uint64_t v21 = sub_100029AD0("System Version Mapping", 0x16uLL, 1);
      uint64_t v22 = v13;
      sub_1000129E0();
      uint64_t v14 = swift_allocError();
      uint64_t v16 = v15;
      uint64_t v17 = v22;
      uint64_t v69 = v14;
      uint64_t *v16 = v21;
      v16[1] = v17;
      sub_100012E48();
    }
    uint64_t v67 = v69;
    swift_errorRetain();
    uint64_t v66 = v69;
    v20[0] = sub_1000102A0(&qword_100035958);
    uint64_t v18 = sub_1000102A0(&qword_100035AF0);
    sub_10000C0B8((uint64_t)&v66, v53, v20[0], v18);
    return swift_errorRelease();
  }
}

uint64_t sub_10000C0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_allocError();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(v4, a1);
  return swift_continuation_throwingResumeWithError();
}

id sub_10000C148@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  swift_bridgeObjectRetain();
  id result = (id)sub_10001C4B0();
  id v13 = result;
  uint64_t v14 = v3;
  uint64_t v15 = v4;
  if (v5)
  {
    id v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
    char v10 = 1;
  }
  else
  {
    id result = [a1 unsignedIntegerValue];
    id v6 = v13;
    uint64_t v7 = v14;
    uint64_t v8 = v15;
    id v9 = result;
    char v10 = 0;
  }
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v7;
  *(void *)(a2 + 16) = v8;
  *(void *)(a2 + 24) = v9;
  *(unsigned char *)(a2 + 32) = v10 & 1;
  return result;
}

void *sub_10000C2A0@<X0>(void *a1@<X0>, void (*a2)(void, void, void)@<X1>, void *a3@<X8>)
{
  a2(*a1, a1[1], a1[2]);
  return sub_1000135E4(v5, a3);
}

uint64_t sub_10000C304@<X0>(uint64_t a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000102A0(&qword_100035B70);
  sub_1000133D4();
  uint64_t result = sub_100029E70();
  if (v6)
  {
    __break(1u);
    __break(1u);
  }
  else
  {
    unint64_t v2 = sub_100013458();
    sub_10001C978((void (*)(char *, char *))sub_10000C7CC, 0, v5, (uint64_t)&type metadata for UInt, (uint64_t)&type metadata for Never, v2, (uint64_t)&protocol witness table for Never, v3);
    sub_1000102A0(&qword_100035958);
    sub_1000134DC();
    sub_100029B30();
    sub_100010678();
    if (v8)
    {
      sub_100029F70();
      v9._countAndFlagsBits = sub_100029AD0("Unable version ", 0xFuLL, 1);
      sub_100029F60(v9);
      swift_bridgeObjectRelease();
      type metadata accessor for OperatingSystemVersion();
      sub_100029F30();
      v10._countAndFlagsBits = sub_100029AD0(" using mapping ", 0xFuLL, 1);
      sub_100029F60(v10);
      swift_bridgeObjectRelease();
      sub_1000102A0(&qword_100035B58);
      sub_100013560();
      sub_100029F40();
      v11._countAndFlagsBits = sub_100029AD0("", 0, 1);
      sub_100029F60(v11);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_100012D00();
      sub_100029AB0();
      sub_100006044(0x5Au);
      swift_bridgeObjectRelease();
    }
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8 & 1;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000C6DC()
{
  return sub_100029A60() & 1;
}

double sub_10000C7CC@<D0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  double result = 0.0;
  *a2 = *(void *)(a1 + 24);
  return result;
}

uint64_t sub_10000C80C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_continuation_throwingResume();
}

uint64_t sub_10000C88C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[14] = a6;
  v6[13] = a5;
  v6[12] = a4;
  v6[11] = a1;
  v6[10] = v6;
  v6[15] = *(void *)(a6 - 8);
  v6[16] = swift_task_alloc();
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  if (a2)
  {
    swift_getObjectType();
    uint64_t v10 = sub_100029BF0();
    uint64_t v11 = v7;
  }
  return _swift_task_switch(sub_10000C9C0, v10, v11);
}

uint64_t sub_10000C9C0()
{
  uint64_t v1 = v0[16];
  uint64_t v4 = (uint64_t (*)(void))v0[12];
  v0[10] = v0;
  v0[2] = v0[10];
  v0[7] = v1;
  v0[3] = sub_10000CA88;
  uint64_t v2 = swift_continuation_init();
  sub_100012040(v2, v4);
  return j__swift_continuation_await();
}

uint64_t sub_10000CA88()
{
  uint64_t v3 = (void *)*v0;
  v3[10] = *v0;
  uint64_t v4 = v3 + 10;
  if (v3[6])
  {
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(*v4 + 8);
  }
  else
  {
    (*(void (**)(void))(v3[15] + 32))(v3[11]);
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(*v4 + 8);
  }
  return v1();
}

uint64_t sub_10000CC6C(uint64_t a1)
{
  v2[6] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = v1;
  return _swift_task_switch(sub_10000CCB4, 0, 0);
}

uint64_t sub_10000CCB4()
{
  uint64_t v4 = v0[6];
  v0[2] = v0;
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_task_alloc();
  v0[7] = v6;
  *(void *)(v6 + 16) = v4;
  uint64_t v7 = (char *)&dword_100035950 + dword_100035950;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v5 + 64) = v1;
  uint64_t v2 = sub_1000102A0(&qword_1000358A8);
  void *v1 = *(void *)(v5 + 16);
  v1[1] = sub_10000B59C;
  return ((uint64_t (*)(uint64_t, void, void, void (*)(uint64_t), uint64_t, uint64_t))v7)(v5 + 40, 0, 0, sub_100010974, v6, v2);
}

void sub_10000CDEC(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v20 = a2;
  id v8 = [self sharedInstance];
  uint64_t v19 = a2;
  uint64_t v9 = sub_1000102A0(&qword_100035958);
  unint64_t v10 = sub_1000103B8();
  unint64_t v2 = sub_100012D2C();
  sub_10001C978((void (*)(char *, char *))sub_10000CFE4, 0, v9, v10, (uint64_t)&type metadata for Never, v2, (uint64_t)&protocol witness table for Never, v11);
  Class isa = sub_100029B70().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  uint64_t v17 = sub_100012DDC;
  uint64_t v18 = v3;
  aBlock = _NSConcreteStackBlock;
  int v13 = 1107296256;
  int v14 = 0;
  uint64_t v15 = sub_10000DD5C;
  uint64_t v16 = &unk_100031938;
  uint64_t v4 = _Block_copy(&aBlock);
  swift_release();
  [v8 downloadAssetForCompabilityVersions:isa withCompleteHandler:v4];
  _Block_release(v4);
}

id sub_10000CFE4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_1000103B8();
  id result = sub_10000D040(v3);
  *a2 = result;
  return result;
}

id sub_10000D040(uint64_t a1)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_10000FD1C(a1);
}

uint64_t sub_10000D080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v37 = 0;
  uint64_t v35 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  v29[4] = 0;
  v29[5] = 0;
  uint64_t v50 = a1;
  uint64_t v49 = a2;
  uint64_t v48 = a3;
  swift_bridgeObjectRetain();
  if (a1)
  {
    uint64_t v35 = a1;
    uint64_t v34 = a1;
    sub_1000102A0(&qword_100035B00);
    sub_1000102A0(&qword_100035B08);
    sub_100012E74();
    uint64_t v4 = sub_100029B20();
    uint64_t v25 = v4;
    uint64_t v33 = v4;
    swift_bridgeObjectRetain();
    v30[1] = v25;
    sub_1000102A0(&qword_100035B18);
    sub_100012EF8();
    sub_100029CB0();
    sub_100010678();
    if (v31)
    {
      uint64_t v32 = v31;
      swift_bridgeObjectRetain();
      v29[3] = v25;
      sub_100029CE0();
      while (1)
      {
        sub_1000102A0(&qword_100035B28);
        sub_100029EC0();
        if (!v29[2]) {
          break;
        }
        sub_100012F7C();
        sub_100029C50();
        swift_bridgeObjectRelease();
      }
      sub_100010678();
      uint64_t v21 = v32;
      swift_bridgeObjectRetain();
      v29[1] = v21;
      sub_100012F7C();
      sub_100013000();
      uint64_t v22 = sub_100029B50();
      sub_100010678();
      v29[0] = v22;
      uint64_t v23 = sub_1000102A0(&qword_1000358A8);
      sub_1000102A0(&qword_100035AF0);
      sub_10000C80C((uint64_t)v29, a3, v23);
      sub_100010678();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    else
    {
      sub_1000129E0();
      uint64_t v5 = swift_allocError();
      *uint64_t v6 = 0;
      v6[1] = 0;
      v30[0] = v5;
      uint64_t v24 = sub_1000102A0(&qword_1000358A8);
      uint64_t v7 = sub_1000102A0(&qword_100035AF0);
      sub_10000C0B8((uint64_t)v30, a3, v24, v7);
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v46 = sub_100029F70();
    uint64_t v47 = v3;
    v51._countAndFlagsBits = sub_100029AD0("Error download assets ", 0x16uLL, 1);
    sub_100029F60(v51);
    swift_bridgeObjectRelease();
    swift_errorRetain();
    if (a2)
    {
      swift_getErrorValue();
      uint64_t v17 = sub_100029FA0();
      uint64_t v18 = v9;
      swift_errorRelease();
      uint64_t v19 = v17;
      uint64_t v20 = v18;
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v20 = 0;
    }
    uint64_t v42 = v19;
    uint64_t v43 = v20;
    if (v20)
    {
      uint64_t v44 = v42;
      uint64_t v45 = v43;
    }
    else
    {
      uint64_t v44 = sub_100029AD0("Unknown error", 0xDuLL, 1);
      uint64_t v45 = v10;
      sub_100012D00();
    }
    uint64_t v40 = v44;
    uint64_t v41 = v45;
    sub_100029F50();
    sub_100012D00();
    v52._countAndFlagsBits = sub_100029AD0("", 0, 1);
    sub_100029F60(v52);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_100012D00();
    sub_100029AB0();
    sub_100006044(0x5Au);
    swift_bridgeObjectRelease();
    swift_errorRetain();
    uint64_t v38 = a2;
    if (a2)
    {
      uint64_t v39 = v38;
    }
    else
    {
      uint64_t v15 = sub_100029AD0("Asset", 5uLL, 1);
      uint64_t v16 = v11;
      sub_1000129E0();
      uint64_t v39 = swift_allocError();
      *uint64_t v12 = v15;
      v12[1] = v16;
      sub_100012E48();
    }
    uint64_t v37 = v39;
    swift_errorRetain();
    uint64_t v36 = v39;
    uint64_t v14 = sub_1000102A0(&qword_1000358A8);
    uint64_t v13 = sub_1000102A0(&qword_100035AF0);
    sub_10000C0B8((uint64_t)&v36, a3, v14, v13);
    return swift_errorRelease();
  }
}

uint64_t sub_10000D710@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v63 = a1;
  uint64_t v80 = 0;
  uint64_t v79 = 0;
  uint64_t v75 = 0;
  uint64_t v58 = 0;
  uint64_t v62 = sub_1000294C0();
  uint64_t v60 = *(void *)(v62 - 8);
  uint64_t v61 = v62 - 8;
  unint64_t v59 = (*(void *)(v60 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v65 = (char *)&v18 - v59;
  uint64_t v80 = v2;
  type metadata accessor for SoundScapesOptionsManager();
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v65, v63, v62);
  uint64_t v3 = v64;
  uint64_t v4 = sub_10001547C(v65);
  uint64_t v66 = v3;
  uint64_t v67 = v4;
  uint64_t v68 = v3;
  if (v3)
  {
    uint64_t v29 = v68;
    uint64_t v30 = 0;
    swift_errorRetain();
    uint64_t v79 = v29;
    Builtin::Word v19 = 20;
    uint64_t v13 = sub_100029F70();
    uint64_t v24 = &v77;
    uint64_t v77 = v13;
    uint64_t v78 = v14;
    int v22 = 1;
    v84._countAndFlagsBits = sub_100029AD0("Error opening asset ", v19, 1);
    object = v84._object;
    sub_100029F60(v84);
    swift_bridgeObjectRelease();
    swift_getErrorValue();
    uint64_t v15 = sub_100029FA0();
    uint64_t v21 = v76;
    v76[0] = v15;
    v76[1] = v16;
    sub_100029F50();
    sub_100012D00();
    v85._countAndFlagsBits = sub_100029AD0("", 0, v22 & 1);
    uint64_t v23 = v85._object;
    sub_100029F60(v85);
    swift_bridgeObjectRelease();
    uint64_t v26 = v77;
    uint64_t v25 = v78;
    swift_bridgeObjectRetain();
    sub_100012D00();
    uint64_t v27 = sub_100029AB0();
    uint64_t v28 = v17;
    sub_100006044(0x5Au);
    swift_bridgeObjectRelease();
    *uint64_t v57 = 0;
    swift_errorRelease();
    swift_errorRelease();
    return v30;
  }
  else
  {
    uint64_t v55 = v67;
    uint64_t v75 = v67;
    Builtin::Word v33 = 10;
    uint64_t v5 = sub_100029F70();
    uint64_t v44 = &v73;
    uint64_t v73 = v5;
    uint64_t v74 = v6;
    uint64_t v42 = "";
    Builtin::Word v49 = 0;
    int v41 = 1;
    v81._countAndFlagsBits = sub_100029AD0("", 0, 1);
    uint64_t v31 = v81._object;
    sub_100029F60(v81);
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_100029AD0("loadSoundScapes(for:)", 0x15uLL, v41 & 1);
    uint64_t v32 = v72;
    v72[0] = v7;
    v72[1] = v8;
    uint64_t v39 = &type metadata for String;
    uint64_t v37 = &protocol witness table for String;
    uint64_t v38 = &protocol witness table for String;
    sub_100029F50();
    sub_100012D00();
    v82._countAndFlagsBits = sub_100029AD0(" uint64_t result = ", v33, v41 & 1);
    uint64_t v34 = v82._object;
    sub_100029F60(v82);
    swift_bridgeObjectRelease();
    uint64_t v35 = *(void *)(v55 + 16);
    swift_bridgeObjectRetain();
    uint64_t v36 = &v71;
    uint64_t v71 = v35;
    uint64_t v52 = sub_1000102A0(&qword_1000358A8);
    sub_100013084();
    uint64_t v9 = sub_100029AA0();
    uint64_t v40 = v70;
    v70[0] = v9;
    v70[1] = v10;
    sub_100029F50();
    sub_100012D00();
    v83._countAndFlagsBits = sub_100029AD0(v42, v49, v41 & 1);
    uint64_t v43 = v83._object;
    sub_100029F60(v83);
    swift_bridgeObjectRelease();
    uint64_t v46 = v73;
    uint64_t v45 = v74;
    swift_bridgeObjectRetain();
    sub_100012D00();
    uint64_t v47 = sub_100029AB0();
    uint64_t v48 = v11;
    sub_100006044(0x28u);
    swift_bridgeObjectRelease();
    uint64_t v50 = *(void *)(v55 + 16);
    swift_bridgeObjectRetain();
    uint64_t v54 = &v69;
    uint64_t v69 = v50;
    uint64_t v51 = type metadata accessor for SoundScapesOption();
    unint64_t v53 = sub_100013108();
    sub_10001318C();
    *uint64_t v57 = sub_100029C60();
    swift_release();
    uint64_t result = v66;
    uint64_t v56 = v66;
  }
  return result;
}

uint64_t sub_10000DD5C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  id v3 = a2;
  if (a2)
  {
    sub_1000294C0();
    uint64_t v6 = sub_100029B80();

    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v4 = a3;
  v9(v7);
  swift_errorRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_10000DE84(uint64_t a1)
{
  uint64_t v14 = a1;
  uint64_t v12 = 0;
  uint64_t v15 = &unk_100035978;
  uint64_t v19 = 0;
  uint64_t v18 = 0;
  unint64_t v13 = (*(void *)(*(void *)(sub_1000102A0(&qword_100035968) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v16 = (uint64_t)&v12 - v13;
  uint64_t v19 = v2;
  uint64_t v18 = v1;
  uint64_t v3 = sub_100029C10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v16, 1);
  id v4 = v1;
  swift_bridgeObjectRetain();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = v14;
  uint64_t v7 = (uint64_t)v15;
  uint64_t v8 = (void *)v5;
  uint64_t v9 = v16;
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v1;
  v8[5] = v6;
  sub_10000F1F0(v9, v7, (uint64_t)v8, (uint64_t)&type metadata for () + 8);
  uint64_t v17 = v10;
  sub_100010BDC(v16);
  return swift_release();
}

uint64_t sub_10000DFEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[21] = a4;
  v5[14] = v5;
  v5[15] = 0;
  v5[16] = 0;
  v5[17] = 0;
  v5[18] = 0;
  v5[19] = 0;
  uint64_t v7 = sub_100029980();
  v5[22] = v7;
  v5[23] = *(void *)(v7 - 8);
  v5[24] = swift_task_alloc();
  uint64_t v8 = sub_1000299A0();
  v5[25] = v8;
  v5[26] = *(void *)(v8 - 8);
  v5[27] = swift_task_alloc();
  v5[15] = a4;
  v5[16] = a5;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v11 + 224) = v9;
  *uint64_t v9 = *(void *)(v11 + 112);
  v9[1] = sub_10000E1C4;
  return sub_10000B41C(a5);
}

uint64_t sub_10000E1C4(uint64_t a1)
{
  uint64_t v6 = (void *)*v2;
  v6[14] = *v2;
  v6[29] = a1;
  v6[30] = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_10000EA58, 0, 0);
  }
  else
  {
    v6[18] = a1;
    uint64_t v3 = (void *)swift_task_alloc();
    v6[31] = v3;
    *uint64_t v3 = v6[14];
    v3[1] = sub_10000E3AC;
    return sub_10000CC6C(a1);
  }
}

uint64_t sub_10000E3AC(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[14] = *v2;
  v5[32] = a1;
  v5[33] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = sub_10000ECCC;
  }
  else
  {
    uint64_t v3 = sub_10000E51C;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10000E51C()
{
  uint64_t v29 = v0[32];
  v0[14] = v0;
  v0[19] = v29;
  swift_bridgeObjectRetain();
  v0[20] = v29;
  sub_1000102A0(&qword_1000358A8);
  sub_10001295C();
  char v30 = sub_100029CD0();
  sub_100010678();
  if (v30)
  {
    sub_1000129E0();
    uint64_t v17 = swift_allocError();
    *uint64_t v3 = 0;
    v3[1] = 0;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void *)(v28 + 216);
    uint64_t v14 = *(void *)(v28 + 200);
    uint64_t v10 = *(void *)(v28 + 192);
    uint64_t v11 = *(void *)(v28 + 176);
    id v8 = *(id *)(v28 + 168);
    uint64_t v12 = *(void *)(v28 + 208);
    uint64_t v9 = *(void *)(v28 + 184);
    swift_errorRetain();
    *(void *)(v28 + 136) = v17;
    sub_100007874();
    id v16 = (id)sub_100029D20();
    swift_errorRetain();
    id v4 = v8;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v17;
    *(void *)(v5 + 24) = v8;
    *(void *)(v28 + 48) = sub_1000128EC;
    *(void *)(v28 + 56) = v5;
    *(void *)(v28 + 16) = _NSConcreteStackBlock;
    *(_DWORD *)(v28 + 24) = 1107296256;
    *(_DWORD *)(v28 + 28) = 0;
    *(void *)(v28 + 32) = sub_10000EFB0;
    *(void *)(v28 + 40) = &unk_100031898;
    aBlock = _Block_copy((const void *)(v28 + 16));
    sub_10000F000();
    sub_10000F018();
    sub_100029D30();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
    _Block_release(aBlock);
    swift_release();

    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    uint64_t v27 = *(void *)(v28 + 256);
    uint64_t v23 = *(void *)(v28 + 216);
    uint64_t v24 = *(void *)(v28 + 200);
    uint64_t v20 = *(void *)(v28 + 192);
    uint64_t v21 = *(void *)(v28 + 176);
    id v18 = *(id *)(v28 + 168);
    uint64_t v22 = *(void *)(v28 + 208);
    uint64_t v19 = *(void *)(v28 + 184);
    sub_100007874();
    uint64_t v26 = (void *)sub_100029D20();
    id v1 = v18;
    swift_bridgeObjectRetain();
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v18;
    *(void *)(v2 + 24) = v27;
    *(void *)(v28 + 96) = sub_100012AA8;
    *(void *)(v28 + 104) = v2;
    *(void *)(v28 + 64) = _NSConcreteStackBlock;
    *(_DWORD *)(v28 + 72) = 1107296256;
    *(_DWORD *)(v28 + 76) = 0;
    *(void *)(v28 + 80) = sub_10000EFB0;
    *(void *)(v28 + 88) = &unk_1000318E8;
    uint64_t v25 = _Block_copy((const void *)(v28 + 64));
    sub_10000F000();
    sub_10000F018();
    sub_100029D30();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v24);
    _Block_release(v25);
    swift_release();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(v28 + 112) + 8);
  return v6();
}

uint64_t sub_10000EA58()
{
  *(void *)(v0 + 112) = v0;
  uint64_t v14 = *(void *)(v0 + 240);
  uint64_t v10 = *(void *)(v0 + 216);
  uint64_t v9 = *(void *)(v0 + 208);
  uint64_t v11 = *(void *)(v0 + 200);
  uint64_t v7 = *(void *)(v0 + 192);
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v8 = *(void *)(v0 + 176);
  id v5 = *(id *)(v0 + 168);
  swift_errorRetain();
  *(void *)(v0 + 136) = v14;
  sub_100007874();
  uint64_t v13 = (void *)sub_100029D20();
  swift_errorRetain();
  id v1 = v5;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v14;
  *(void *)(v2 + 24) = v5;
  *(void *)(v0 + 48) = sub_1000128EC;
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 16) = _NSConcreteStackBlock;
  *(_DWORD *)(v0 + 24) = 1107296256;
  *(_DWORD *)(v0 + 28) = 0;
  *(void *)(v0 + 32) = sub_10000EFB0;
  *(void *)(v0 + 40) = &unk_100031898;
  uint64_t v12 = _Block_copy((const void *)(v0 + 16));
  sub_10000F000();
  sub_10000F018();
  sub_100029D30();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  _Block_release(v12);
  swift_release();

  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v0 + 112) + 8);
  return v3();
}

uint64_t sub_10000ECCC()
{
  *(void *)(v0 + 112) = v0;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v0 + 264);
  uint64_t v10 = *(void *)(v0 + 216);
  uint64_t v9 = *(void *)(v0 + 208);
  uint64_t v11 = *(void *)(v0 + 200);
  uint64_t v7 = *(void *)(v0 + 192);
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v8 = *(void *)(v0 + 176);
  id v5 = *(id *)(v0 + 168);
  swift_errorRetain();
  *(void *)(v0 + 136) = v14;
  sub_100007874();
  uint64_t v13 = (void *)sub_100029D20();
  swift_errorRetain();
  id v1 = v5;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v14;
  *(void *)(v2 + 24) = v5;
  *(void *)(v0 + 48) = sub_1000128EC;
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 16) = _NSConcreteStackBlock;
  *(_DWORD *)(v0 + 24) = 1107296256;
  *(_DWORD *)(v0 + 28) = 0;
  *(void *)(v0 + 32) = sub_10000EFB0;
  *(void *)(v0 + 40) = &unk_100031898;
  uint64_t v12 = _Block_copy((const void *)(v0 + 16));
  sub_10000F000();
  sub_10000F018();
  sub_100029D30();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  _Block_release(v12);
  swift_release();

  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v0 + 112) + 8);
  return v3();
}

uint64_t sub_10000EF4C()
{
  return sub_1000095DC();
}

uint64_t sub_10000EFB0(uint64_t a1)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v1 = swift_retain();
  v3(v1);
  return swift_release();
}

uint64_t sub_10000F000()
{
  return sub_100029990();
}

uint64_t sub_10000F018()
{
  return sub_100029E20();
}

uint64_t sub_10000F0B0()
{
  sub_100029F70();
  v1._countAndFlagsBits = sub_100029AD0("Fetch failed because of ", 0x18uLL, 1);
  sub_100029F60(v1);
  swift_bridgeObjectRelease();
  sub_1000102A0(&qword_100035AF0);
  sub_100029F30();
  v2._countAndFlagsBits = sub_100029AD0("", 0, 1);
  sub_100029F60(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_100012D00();
  sub_100029AB0();
  sub_100006044(0x5Au);
  swift_bridgeObjectRelease();
  return sub_1000095DC();
}

void sub_10000F1F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000120BC(a1, 0, 0, 0, 1, 0, 0);
  uint64_t v8 = *(void *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v8)
  {
    swift_getObjectType();
    sub_100029BF0();
    swift_unknownObjectRelease();
  }
  id v4 = (void *)swift_allocObject();
  v4[2] = a4;
  void v4[3] = a2;
  v4[4] = a3;
  swift_task_create();
  sub_1000120A8();
}

id sub_10000F3D0()
{
  return [objc_allocWithZone(v0) init];
}

id sub_10000F3F8()
{
  id v56 = 0;
  uint64_t v45 = sub_1000102A0(&qword_1000358D0);
  uint64_t v41 = *(void *)(v45 - 8);
  uint64_t v42 = v45 - 8;
  unint64_t v17 = (*(void *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v45);
  uint64_t v44 = (uint64_t)&v16 - v17;
  uint64_t v39 = sub_1000102A0(&qword_1000358B8);
  uint64_t v35 = *(void *)(v39 - 8);
  uint64_t v36 = v39 - 8;
  unint64_t v18 = (*(void *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v39);
  uint64_t v38 = (uint64_t)&v16 - v18;
  uint64_t v34 = sub_1000102A0(&qword_100035898);
  uint64_t v30 = *(void *)(v34 - 8);
  uint64_t v31 = v34 - 8;
  unint64_t v19 = (*(void *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v34);
  uint64_t v33 = (uint64_t)&v16 - v19;
  uint64_t v48 = sub_1000102A0((uint64_t *)&unk_100035880);
  uint64_t v27 = *(void *)(v48 - 8);
  uint64_t v28 = v48 - 8;
  unint64_t v20 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v48);
  uint64_t v47 = (uint64_t)&v16 - v20;
  uint64_t v26 = sub_1000102A0(&qword_100035860);
  uint64_t v22 = *(void *)(v26 - 8);
  uint64_t v23 = v26 - 8;
  unint64_t v21 = (*(void *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v26);
  uint64_t v25 = (uint64_t)&v16 - v21;
  Swift::String v1 = v0;
  Swift::String v2 = v0;
  uint64_t v3 = v0;
  id v4 = v0;
  id v5 = v0;
  uint64_t v6 = v0;
  uint64_t v7 = v0;
  uint64_t v8 = v0;
  uint64_t v9 = v0;
  id v56 = v0;
  uint64_t v52 = 0;
  *(void *)&v0[OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayer] = 0;

  uint64_t v10 = &v0[OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayerPeriodicObserver];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  *((void *)v10 + 2) = 0;
  *((void *)v10 + 3) = 0;

  uint64_t v11 = &v0[OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayerEndtimeObserver];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 3) = 0;

  uint64_t v24 = OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource__playbackProgress;
  sub_100007718(v25, 0.0);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 32))(&v0[v24], v25, v26);

  uint64_t v29 = OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource__selectedSoundScapes;
  sub_10000826C(v52, v47);
  uint64_t v50 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 32);
  uint64_t v49 = v27 + 32;
  v50(&v0[v29], v47, v48);

  uint64_t v32 = OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource__dismiss;
  int v40 = 1;
  sub_1000088A4(0, v33);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(&v0[v32], v33, v34);

  uint64_t v37 = OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource__soundScapes;
  type metadata accessor for SoundScapesOption();
  uint64_t v12 = sub_100029F80();
  sub_100008EC4(v12, v38);
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(&v0[v37], v38, v39);

  uint64_t v43 = OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource__status;
  sub_100009500(v40, v44);
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(&v0[v43], v44, v45);

  uint64_t v46 = OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource__nowplayingSoundScapes;
  sub_10000826C(v52, v47);
  v50(&v0[v46], v47, v48);

  unint64_t v53 = v56;
  uint64_t v13 = (objc_class *)type metadata accessor for SoundScapesDataSource();
  v55.receiver = v53;
  v55.super_class = v13;
  id v54 = objc_msgSendSuper2(&v55, "init");
  id v14 = v54;
  id v56 = v54;

  return v54;
}

id sub_10000F9D4()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SoundScapesDataSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000FC44@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SoundScapesDataSource();
  uint64_t result = sub_1000295B0();
  *a1 = result;
  return result;
}

id sub_10000FC80@<X0>(uint64_t a1@<X0>, NSURL *a2@<X8>)
{
  sub_100029490(a2);
  id v6 = v3;
  id v8 = objc_msgSend(v2, "initWithURL:");

  uint64_t v4 = sub_1000294C0();
  (*(void (**)(uint64_t))(*(void *)(v4 - 8) + 8))(a1);
  return v8;
}

id sub_10000FD1C(uint64_t a1)
{
  return [v1 initWithUnsignedInteger:a1];
}

void sub_10000FD44(id *a1@<X0>, double *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = sub_100007750();
}

void sub_10000FD9C(uint64_t a1, id *a2)
{
  id v3 = *a2;
  id v2 = *a2;
  sub_1000077EC();
}

void sub_10000FDF4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = sub_1000082D0();
}

void sub_10000FE50(uint64_t *a1, id *a2)
{
  sub_100013620(a1, &v5);
  id v4 = *a2;
  id v2 = *a2;
  sub_10000836C();
}

void sub_10000FEB8(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = sub_1000088EC() & 1;
}

void sub_10000FF18(uint64_t a1, id *a2)
{
  id v3 = *a2;
  id v2 = *a2;
  sub_10000898C();
}

void sub_10000FF74(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = sub_100008F2C();
}

void sub_10000FFD0(uint64_t *a1, id *a2)
{
  sub_100013658(a1, &v5);
  id v4 = *a2;
  id v2 = *a2;
  sub_100008FC8();
}

void sub_100010038(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = sub_100009540();
}

void sub_100010094(uint64_t a1, id *a2)
{
  id v3 = *a2;
  id v2 = *a2;
  sub_1000095DC();
}

void sub_1000100EC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = sub_100009F20();
}

void sub_100010148(uint64_t *a1, id *a2)
{
  sub_100013620(a1, &v5);
  id v4 = *a2;
  id v2 = *a2;
  sub_100009FBC();
}

uint64_t sub_1000101B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v4[1] = a3;
  uint64_t v7 = a1;
  uint64_t v8 = a2;
  uint64_t v9 = a2;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = a2 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(a1);
  v4[2] = (char *)v4 - v4[0];
  (*(void (**)(void))(v5 + 16))();
  sub_1000295C0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

uint64_t sub_1000102A0(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

unint64_t sub_100010310()
{
  uint64_t v2 = qword_1000358E0;
  if (!qword_1000358E0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1000358E0);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_100010378()
{
  return swift_deallocObject();
}

unint64_t sub_1000103B8()
{
  uint64_t v2 = qword_1000358F8;
  if (!qword_1000358F8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1000358F8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_100010420()
{
  swift_release();
  return swift_deallocObject();
}

Swift::Int sub_100010468(uint64_t a1, uint64_t a2)
{
  return sub_10000AE0C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_100010474(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_1000104BC()
{
  return swift_release();
}

uint64_t type metadata accessor for OperatingSystemVersion()
{
  uint64_t v4 = qword_100035A48;
  if (!qword_100035A48)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100035A48);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_10001057C()
{
  uint64_t v2 = qword_100035908;
  if (!qword_100035908)
  {
    sub_100010600(&qword_100035900);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035908);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100010600(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100010678()
{
}

unint64_t sub_1000106A4()
{
  uint64_t v2 = qword_100035918;
  if (!qword_100035918)
  {
    sub_100010600(&qword_100035910);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035918);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100010728()
{
  uint64_t v2 = qword_100035920;
  if (!qword_100035920)
  {
    type metadata accessor for OperatingSystemVersion();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035920);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000107AC()
{
  uint64_t v2 = qword_100035930;
  if (!qword_100035930)
  {
    sub_100010600(&qword_100035928);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035930);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100010830()
{
  return sub_10000B288() & 1;
}

unint64_t sub_100010864()
{
  uint64_t v2 = qword_100035938;
  if (!qword_100035938)
  {
    sub_100010600(&qword_100035910);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035938);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000108E8()
{
  uint64_t v2 = qword_100035940;
  if (!qword_100035940)
  {
    sub_100010600(&qword_100035910);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035940);
    return WitnessTable;
  }
  return v2;
}

void sub_10001096C(uint64_t a1)
{
  sub_10000B830(a1, *(void *)(v1 + 16));
}

void sub_100010974(uint64_t a1)
{
  sub_10000CDEC(a1, *(void *)(v1 + 16));
}

uint64_t sub_10001097C()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1000109CC(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[5];
  id v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *id v3 = *(void *)(v5 + 16);
  v3[1] = sub_100010AB0;
  return sub_10000DFEC(a1, v6, v7, v8, v9);
}

uint64_t sub_100010AB0()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_100010BDC(uint64_t a1)
{
  uint64_t v3 = sub_100029C10();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100010C8C(id *a1)
{
}

uint64_t type metadata accessor for SoundScapesDataSource()
{
  uint64_t v1 = qword_100035A08;
  if (!qword_100035A08) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_100010D30()
{
  return type metadata accessor for SoundScapesDataSource();
}

uint64_t sub_100010D4C()
{
  uint64_t updated = sub_100010FE4();
  if (v0 <= 0x3F)
  {
    uint64_t updated = sub_100011084();
    if (v1 <= 0x3F)
    {
      uint64_t updated = sub_10001112C();
      if (v2 <= 0x3F)
      {
        uint64_t updated = sub_1000111CC();
        if (v3 <= 0x3F)
        {
          uint64_t updated = sub_100011274();
          if (v4 <= 0x3F)
          {
            uint64_t updated = swift_updateClassMetadata2();
            if (!updated) {
              return 0;
            }
          }
        }
      }
    }
  }
  return updated;
}

uint64_t sub_100010FE4()
{
  uint64_t v4 = qword_100035A18;
  if (!qword_100035A18)
  {
    unint64_t v3 = sub_100029620();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_100035A18);
      return v1;
    }
  }
  return v4;
}

uint64_t sub_100011084()
{
  uint64_t v4 = qword_100035A20;
  if (!qword_100035A20)
  {
    sub_100010600(&qword_100035870);
    unint64_t v3 = sub_100029620();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_100035A20);
      return v1;
    }
  }
  return v4;
}

uint64_t sub_10001112C()
{
  uint64_t v4 = qword_100035A28;
  if (!qword_100035A28)
  {
    unint64_t v3 = sub_100029620();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_100035A28);
      return v1;
    }
  }
  return v4;
}

uint64_t sub_1000111CC()
{
  uint64_t v4 = qword_100035A30;
  if (!qword_100035A30)
  {
    sub_100010600(&qword_1000358A8);
    unint64_t v3 = sub_100029620();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_100035A30);
      return v1;
    }
  }
  return v4;
}

uint64_t sub_100011274()
{
  uint64_t v4 = qword_100035A38;
  if (!qword_100035A38)
  {
    unint64_t v3 = sub_100029620();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_100035A38);
      return v1;
    }
  }
  return v4;
}

void *sub_100011318(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  a1[1] = v4;
  return result;
}

uint64_t sub_100011358()
{
  return swift_bridgeObjectRelease();
}

void *sub_100011374(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

__n128 sub_1000113C0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1000113CC(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
}

uint64_t sub_10001140C(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFE && *(unsigned char *)(a1 + 16))
    {
      int v5 = *(_OWORD *)a1 + 2147483646;
    }
    else
    {
      int v4 = -1;
      if (*(void *)(a1 + 8) < (unint64_t)&_mh_execute_header) {
        int v4 = *(void *)(a1 + 8);
      }
      int v2 = v4 - 1;
      if (v4 - 1 < 0) {
        int v2 = -1;
      }
      int v5 = v2;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_100011584(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFE;
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(unsigned char *)(result + 16) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(unsigned char *)(result + 16) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_100011790(uint64_t a1)
{
  uint64_t v1 = sub_1000102A0(&qword_100035A40);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 48))(a1, 1);
}

uint64_t sub_1000117F4(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = sub_1000102A0(&qword_100035A40);
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 56))(a1, a2, 1);
}

void *type metadata accessor for SoundScapesDataSource.DataSourceError()
{
  return &unk_100031720;
}

unsigned char *sub_100011870(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t sub_100011880(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFC) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 3) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 4;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_100011A30(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFC)
  {
    unsigned int v5 = ((a3 + 3) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFC)
  {
    unsigned int v4 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *__n128 result = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_100011C74(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100011C7C(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

void *type metadata accessor for SoundScapesDataSource.Status()
{
  return &unk_1000317B0;
}

__n128 sub_100011C98(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  return result;
}

uint64_t sub_100011CAC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(unsigned char *)(a1 + 24)) {
      int v3 = *(_DWORD *)a1;
    }
    else {
      int v3 = -1;
    }
  }
  else
  {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t sub_100011D8C(uint64_t result, int a2, int a3)
{
  BOOL v3 = a3 != 0;
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    if (a3)
    {
      if (v3) {
        *(unsigned char *)(result + 24) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else if (a3)
  {
    if (v3) {
      *(unsigned char *)(result + 24) = 0;
    }
    else {
      __break(1u);
    }
  }
  return result;
}

void *sub_100011F70()
{
  return &protocol witness table for ObservableObjectPublisher;
}

unint64_t sub_100011F7C()
{
  return sub_100011F94();
}

unint64_t sub_100011F94()
{
  uint64_t v2 = qword_100035A50;
  if (!qword_100035A50)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035A50);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100012014()
{
}

uint64_t sub_100012040(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_1000120BC(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7)
{
  uint64_t v34 = a1;
  int v28 = a2;
  int v29 = a3;
  int v30 = a4;
  int v31 = a5;
  int v32 = a6;
  int v33 = a7;
  unint64_t v35 = (*(void *)(*(void *)(sub_1000102A0(&qword_100035968) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  int v7 = (const void *)__chkstk_darwin(v34);
  uint64_t v36 = (uint64_t)&v9 - v35;
  sub_10001277C(v7, (char *)&v9 - v35);
  uint64_t v37 = sub_100029C10();
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = v37 - 8;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v38 + 48))(v36, 1) != 1)
  {
    int v19 = sub_100029C00();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
    uint64_t v20 = v19;
    if ((v28 & 1) == 0)
    {
      uint64_t v18 = v20;
LABEL_19:
      uint64_t v17 = v18;
      if ((v29 & 1) == 0)
      {
        uint64_t v16 = v17;
LABEL_23:
        uint64_t v15 = v16;
        if ((v30 & 1) == 0)
        {
          uint64_t v14 = v15;
LABEL_27:
          uint64_t v13 = v14;
          if ((v31 & 1) == 0)
          {
            uint64_t v12 = v13;
LABEL_31:
            uint64_t v11 = v12;
            if ((v32 & 1) == 0)
            {
              uint64_t v10 = v11;
LABEL_35:
              uint64_t v9 = v10;
              if ((v33 & 1) == 0) {
                return v9;
              }
              uint64_t v26 = v9;
              return v26 | 0x4000;
            }
            uint64_t v25 = v11;
LABEL_34:
            uint64_t v10 = v25 | 0x2000;
            goto LABEL_35;
          }
          uint64_t v24 = v13;
LABEL_30:
          uint64_t v12 = v24 | 0x1000;
          goto LABEL_31;
        }
        uint64_t v23 = v15;
LABEL_26:
        uint64_t v14 = v23 | 0x800;
        goto LABEL_27;
      }
      uint64_t v22 = v17;
LABEL_22:
      uint64_t v16 = v22 | 0x400;
      goto LABEL_23;
    }
    uint64_t v21 = v20;
LABEL_18:
    uint64_t v18 = v21 | 0x100;
    goto LABEL_19;
  }
  sub_100010BDC(v36);
  if (v28)
  {
    uint64_t v21 = 0;
    goto LABEL_18;
  }
  if (v29)
  {
    uint64_t v22 = 0;
    goto LABEL_22;
  }
  if (v30)
  {
    uint64_t v23 = 0;
    goto LABEL_26;
  }
  if (v31)
  {
    uint64_t v24 = 0;
    goto LABEL_30;
  }
  if (v32)
  {
    uint64_t v25 = 0;
    goto LABEL_34;
  }
  if (v33)
  {
    uint64_t v26 = 0;
    return v26 | 0x4000;
  }
  return 0;
}

uint64_t sub_100012410(uint64_t a1, int *a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  int v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  BOOL v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *BOOL v3 = *(void *)(v5 + 16);
  v3[1] = sub_100012510;
  return v6(a1);
}

uint64_t sub_100012510()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_100012640()
{
  return swift_deallocObject();
}

uint64_t sub_100012688(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  int v7 = *(int **)(v1 + 24);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_100010AB0;
  uint64_t v4 = dword_100035AB8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100035AB8 + v4))(a1, v7);
}

void *sub_10001277C(const void *a1, void *a2)
{
  uint64_t v6 = sub_100029C10();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = sub_1000102A0(&qword_100035968);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_1000128A4()
{
  swift_errorRelease();

  return swift_deallocObject();
}

uint64_t sub_1000128EC()
{
  return sub_10000F0B0();
}

uint64_t sub_1000128F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_100012940()
{
  return swift_release();
}

unint64_t sub_10001295C()
{
  uint64_t v2 = qword_100035AC8;
  if (!qword_100035AC8)
  {
    sub_100010600(&qword_1000358A8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035AC8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000129E0()
{
  uint64_t v2 = qword_100035AD0;
  if (!qword_100035AD0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035AD0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100012A60()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_100012AA8()
{
  return sub_10000EF4C();
}

uint64_t sub_100012AB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_100012AFC()
{
  return swift_release();
}

uint64_t sub_100012B18(uint64_t result)
{
  uint64_t v3 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_100029980();
      uint64_t v1 = sub_100029BB0();
      *(void *)(v1 + 16) = v3;
      uint64_t v2 = (void *)v1;
    }
    else
    {
      swift_retain();
      uint64_t v2 = &_swiftEmptyArrayStorage;
    }
    sub_100029980();
    return (uint64_t)v2;
  }
  return result;
}

unint64_t sub_100012BF8()
{
  uint64_t v2 = qword_100035AD8;
  if (!qword_100035AD8)
  {
    sub_100029980();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035AD8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100012C7C()
{
  uint64_t v2 = qword_100035AE8;
  if (!qword_100035AE8)
  {
    sub_100010600(&qword_100035AE0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035AE8);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100012D00()
{
}

unint64_t sub_100012D2C()
{
  uint64_t v2 = qword_100035AF8;
  if (!qword_100035AF8)
  {
    sub_100010600(&qword_100035958);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035AF8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100012DB0()
{
  return swift_deallocObject();
}

uint64_t sub_100012DDC(uint64_t a1, uint64_t a2)
{
  return sub_10000D080(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100012DE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_100012E2C()
{
  return swift_release();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100012E48()
{
}

unint64_t sub_100012E74()
{
  uint64_t v2 = qword_100035B10;
  if (!qword_100035B10)
  {
    sub_100010600(&qword_100035B00);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035B10);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100012EF8()
{
  uint64_t v2 = qword_100035B20;
  if (!qword_100035B20)
  {
    sub_100010600(&qword_100035B18);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035B20);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100012F7C()
{
  uint64_t v2 = qword_100035B30;
  if (!qword_100035B30)
  {
    sub_100010600(&qword_100035B08);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035B30);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100013000()
{
  uint64_t v2 = qword_100035B38;
  if (!qword_100035B38)
  {
    type metadata accessor for SoundScapesOption();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035B38);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100013084()
{
  uint64_t v2 = qword_100035B40;
  if (!qword_100035B40)
  {
    sub_100010600(&qword_1000358A8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035B40);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100013108()
{
  uint64_t v2 = qword_100035B48;
  if (!qword_100035B48)
  {
    type metadata accessor for SoundScapesOption();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035B48);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001318C()
{
  uint64_t v2 = qword_100035B50;
  if (!qword_100035B50)
  {
    sub_100010600(&qword_1000358A8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035B50);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100013214()
{
  return swift_deallocObject();
}

uint64_t sub_100013254(uint64_t a1, uint64_t a2)
{
  return sub_10000B968(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_100013260(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_1000132A8()
{
  return swift_release();
}

void *sub_1000132C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_10000C2A0(a1, *(void (**)(void, void, void))(v2 + 16), a2);
}

unint64_t sub_1000132F0()
{
  uint64_t v2 = qword_100035B68;
  if (!qword_100035B68)
  {
    sub_100010600(&qword_100035B58);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035B68);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100013374@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C304(a1);
}

uint64_t sub_1000133A0()
{
  return sub_10000C6DC() & 1;
}

unint64_t sub_1000133D4()
{
  uint64_t v2 = qword_100035B78;
  if (!qword_100035B78)
  {
    sub_100010600(&qword_100035B70);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035B78);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100013458()
{
  uint64_t v2 = qword_100035B80;
  if (!qword_100035B80)
  {
    sub_100010600(&qword_100035B70);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035B80);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000134DC()
{
  uint64_t v2 = qword_100035B88;
  if (!qword_100035B88)
  {
    sub_100010600(&qword_100035958);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035B88);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100013560()
{
  uint64_t v2 = qword_100035B90;
  if (!qword_100035B90)
  {
    sub_100010600(&qword_100035B58);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035B90);
    return WitnessTable;
  }
  return v2;
}

void *sub_1000135E4(const void *a1, void *__dst)
{
  return __dst;
}

void *sub_100013620(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  swift_retain();
  uint64_t result = a2;
  *a2 = v4;
  return result;
}

void *sub_100013658(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  *a2 = v4;
  return result;
}

unint64_t sub_100013690()
{
  uint64_t v2 = qword_100035B98;
  if (!qword_100035B98)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100035B98);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1000136F8()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v1 = sub_100029AE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

BOOL sub_10001378C(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t sub_1000138A4()
{
  return sub_100029FF0();
}

uint64_t sub_100013970()
{
  swift_bridgeObjectRetain();
  sub_100029AD0("identifier", 0xAuLL, 1);
  swift_bridgeObjectRetain();
  char v5 = sub_100029AE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v6 = 0;
LABEL_10:
    swift_bridgeObjectRelease();
    return v6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_100029AD0("name", 4uLL, 1);
  swift_bridgeObjectRetain();
  char v4 = sub_100029AE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v6 = 1;
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_100029AD0("imageFile", 9uLL, 1);
  swift_bridgeObjectRetain();
  char v3 = sub_100029AE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v6 = 2;
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_100029AD0("audioFile", 9uLL, 1);
  swift_bridgeObjectRetain();
  char v2 = sub_100029AE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v6 = 3;
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 4;
}

uint64_t sub_100013C3C()
{
  return 4;
}

uint64_t sub_100013C54()
{
  return sub_100029E40();
}

unint64_t sub_100013CA0()
{
  uint64_t v2 = qword_100035C00;
  if (!qword_100035C00)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035C00);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100013D20()
{
  return 0;
}

uint64_t sub_100013D3C(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = sub_100029AD0("name", 4uLL, 1);
      break;
    case 2:
      uint64_t v2 = sub_100029AD0("imageFile", 9uLL, 1);
      break;
    case 3:
      uint64_t v2 = sub_100029AD0("audioFile", 9uLL, 1);
      break;
    default:
      uint64_t v2 = sub_100029AD0("identifier", 0xAuLL, 1);
      break;
  }
  return v2;
}

BOOL sub_100013E4C(char *a1, char *a2)
{
  return sub_10001378C(*a1, *a2);
}

uint64_t sub_100013E70()
{
  return sub_100013C54();
}

uint64_t sub_100013E8C()
{
  return sub_1000138A4();
}

uint64_t sub_100013EA8()
{
  return sub_100013D3C(*v0);
}

uint64_t sub_100013EC4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100013970();
  *a1 = result;
  return result;
}

uint64_t sub_100013EF0()
{
  return sub_100013D20();
}

uint64_t sub_100013F10@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100013C3C();
  *a1 = result;
  return result;
}

uint64_t sub_100013F3C()
{
  return sub_10002A020();
}

unint64_t sub_100013F6C()
{
  uint64_t v2 = qword_100035C08;
  if (!qword_100035C08)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035C08);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100013FEC()
{
  return sub_10002A030();
}

uint64_t sub_10001401C(uint64_t a1)
{
  uint64_t v23 = a1;
  uint64_t v42 = 0;
  uint64_t v41 = 0;
  uint64_t v34 = sub_1000102A0((uint64_t *)&unk_100035C30);
  uint64_t v24 = *(void *)(v34 - 8);
  uint64_t v25 = v34 - 8;
  unint64_t v26 = (*(void *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  int v29 = (char *)v7 - v26;
  uint64_t v42 = (void *)__chkstk_darwin(v23);
  uint64_t v41 = v1;
  uint64_t v27 = v42[3];
  uint64_t v28 = v42[4];
  sub_100007B00(v42, v27);
  sub_100013F6C();
  sub_10002A010();
  uint64_t v2 = v31;
  uint64_t v32 = *v30;
  uint64_t v33 = v30[1];
  swift_bridgeObjectRetain();
  char v40 = 0;
  sub_100029F10();
  uint64_t v35 = v2;
  uint64_t v36 = v2;
  if (v2)
  {
    uint64_t v9 = v36;
    swift_bridgeObjectRelease();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v29, v34);
    uint64_t v10 = v9;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = v35;
    uint64_t v19 = v30[2];
    uint64_t v20 = v30[3];
    swift_bridgeObjectRetain();
    char v39 = 1;
    sub_100029F10();
    uint64_t v21 = v3;
    uint64_t v22 = v3;
    if (v3)
    {
      uint64_t v8 = v22;
      swift_bridgeObjectRelease();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v29, v34);
      uint64_t v10 = v8;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v4 = v21;
      uint64_t v15 = v30[4];
      uint64_t v16 = v30[5];
      swift_bridgeObjectRetain();
      char v38 = 2;
      sub_100029F10();
      uint64_t v17 = v4;
      uint64_t v18 = v4;
      if (v4)
      {
        v7[1] = v18;
        swift_bridgeObjectRelease();
        return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v29, v34);
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v5 = v17;
        uint64_t v11 = v30[6];
        uint64_t v12 = v30[7];
        swift_bridgeObjectRetain();
        char v37 = 3;
        sub_100029F10();
        uint64_t v13 = v5;
        uint64_t v14 = v5;
        if (v5) {
          v7[0] = v14;
        }
        swift_bridgeObjectRelease();
        return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v29, v34);
      }
    }
  }
  return result;
}

void *sub_100014410@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v48 = a1;
  uint64_t v63 = 0;
  uint64_t v49 = sub_1000102A0(&qword_100035C28);
  uint64_t v50 = *(void *)(v49 - 8);
  uint64_t v51 = v49 - 8;
  unint64_t v52 = (*(void *)(v50 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v53 = (char *)v20 - v52;
  char v67 = 0;
  uint64_t v63 = (void *)__chkstk_darwin(v48);
  uint64_t v55 = v63[3];
  uint64_t v56 = v63[4];
  sub_100007B00(v63, v55);
  sub_100013F6C();
  uint64_t v2 = v54;
  sub_10002A000();
  uint64_t v57 = v2;
  uint64_t v58 = v2;
  if (v2)
  {
    v20[6] = v58;
    v20[1] = v58;
    uint64_t result = (void *)sub_1000073E8(v48);
    if (v67)
    {
      uint64_t result = v64;
      sub_100012D00();
    }
    if ((v67 & 2) != 0)
    {
      uint64_t result = v65;
      sub_100012D00();
    }
    if ((v67 & 4) != 0)
    {
      uint64_t result = v66;
      sub_100012D00();
    }
  }
  else
  {
    char v62 = 0;
    uint64_t v3 = sub_100029F00();
    uint64_t v43 = 0;
    uint64_t v44 = v3;
    uint64_t v45 = v4;
    uint64_t v46 = 0;
    uint64_t v37 = v4;
    uint64_t v36 = v3;
    int v38 = 1;
    char v67 = 1;
    swift_bridgeObjectRetain();
    v64[0] = v36;
    v64[1] = v37;
    char v61 = v38;
    uint64_t v5 = sub_100029F00();
    uint64_t v39 = 0;
    uint64_t v40 = v5;
    uint64_t v41 = v6;
    uint64_t v42 = 0;
    uint64_t v31 = v6;
    uint64_t v30 = v5;
    char v67 = 3;
    swift_bridgeObjectRetain();
    v65[0] = v30;
    v65[1] = v31;
    char v60 = 2;
    uint64_t v7 = sub_100029F00();
    uint64_t v32 = 0;
    uint64_t v33 = v7;
    uint64_t v34 = v8;
    uint64_t v35 = 0;
    uint64_t v25 = v8;
    uint64_t v24 = v7;
    char v67 = 7;
    swift_bridgeObjectRetain();
    v66[0] = v24;
    v66[1] = v25;
    char v59 = 3;
    uint64_t v9 = sub_100029F00();
    uint64_t v26 = 0;
    uint64_t v27 = v9;
    uint64_t v28 = v10;
    uint64_t v29 = 0;
    uint64_t v23 = v10;
    uint64_t v22 = v9;
    uint64_t v21 = v64;
    char v67 = 15;
    swift_bridgeObjectRetain();
    v66[2] = v22;
    v66[3] = v23;
    (*(void (**)(char *, uint64_t))(v50 + 8))(v53, v49);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000073E8(v48);
    uint64_t result = v21;
    sub_10001542C();
    uint64_t v12 = v37;
    uint64_t v13 = v30;
    uint64_t v14 = v31;
    uint64_t v15 = v24;
    uint64_t v16 = v25;
    uint64_t v17 = v22;
    uint64_t v18 = v47;
    uint64_t v19 = v23;
    uint64_t *v47 = v36;
    v18[1] = v12;
    v18[2] = v13;
    v18[3] = v14;
    v18[4] = v15;
    v18[5] = v16;
    v18[6] = v17;
    v18[7] = v19;
  }
  return result;
}

void *sub_100014A84@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_100014410(a1, __src);
  if (!v2) {
    return memcpy(a2, __src, 0x40uLL);
  }
  return result;
}

uint64_t sub_100014AF8(uint64_t a1)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_10001401C(a1);
}

uint64_t sub_100014B70(const void *a1, const void *a2)
{
  memcpy(__dst, a1, sizeof(__dst));
  memcpy(v5, a2, sizeof(v5));
  return sub_1000136F8() & 1;
}

uint64_t sub_100014BD8(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

uint64_t sub_100014C18()
{
  return swift_bridgeObjectRelease();
}

void *sub_100014C64(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  a1[2] = a2[2];
  uint64_t v4 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v4;
  a1[4] = a2[4];
  uint64_t v5 = a2[5];
  swift_bridgeObjectRetain();
  a1[5] = v5;
  a1[6] = a2[6];
  uint64_t v8 = a2[7];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  a1[7] = v8;
  return result;
}

void *sub_100014D14(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v4 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v4;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  uint64_t v5 = a2[5];
  swift_bridgeObjectRetain();
  a1[5] = v5;
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  uint64_t v7 = a2[7];
  swift_bridgeObjectRetain();
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100014DF4(void *a1, const void *a2)
{
}

void *sub_100014E24(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100014EC8(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(unsigned char *)(a1 + 64))
    {
      int v4 = *(void *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (*(void *)(a1 + 8) < (unint64_t)&_mh_execute_header) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_100015024(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)uint64_t result = a2 + 0x80000000;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 64) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 64) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }
  return result;
}

void *type metadata accessor for SoundScapesInfo()
{
  return &unk_100031A18;
}

void *type metadata accessor for SoundScapesInfo.CodingKeys()
{
  return &unk_100031AB8;
}

unint64_t sub_100015264()
{
  return sub_10001527C();
}

unint64_t sub_10001527C()
{
  uint64_t v2 = qword_100035C10;
  if (!qword_100035C10)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035C10);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000152FC()
{
  return sub_100015314();
}

unint64_t sub_100015314()
{
  uint64_t v2 = qword_100035C18;
  if (!qword_100035C18)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035C18);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100015394()
{
  return sub_1000153AC();
}

unint64_t sub_1000153AC()
{
  uint64_t v2 = qword_100035C20;
  if (!qword_100035C20)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035C20);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10001542C()
{
}

uint64_t sub_10001547C(char *a1)
{
  swift_allocObject();
  uint64_t v5 = sub_1000175A4(a1);
  if (v3) {
    return v2;
  }
  else {
    return v5;
  }
}

id sub_10001550C()
{
  sub_1000102A0(&qword_100035C40);
  unint64_t v2 = sub_100017E1C();
  unint64_t v0 = sub_100017E84();
  id result = sub_100015570(v2, v0);
  qword_100037200 = (uint64_t)result;
  return result;
}

id sub_100015570(uint64_t a1, uint64_t a2)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_10001971C(a1, a2);
}

uint64_t *sub_1000155C4()
{
  if (qword_1000357E0 != -1) {
    swift_once();
  }
  return &qword_100037200;
}

uint64_t sub_100015628()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 48);
  swift_endAccess();
  return v2;
}

uint64_t sub_100015674(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 48) = a1;
  return swift_endAccess();
}

uint64_t (*sub_1000156C0())()
{
  return sub_10001571C;
}

uint64_t sub_10001571C()
{
  return swift_endAccess();
}

uint64_t sub_10001575C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (const void *)(v1 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_timePreviewLastPlayed);
  swift_beginAccess();
  sub_100017EEC(v3, a1);
  return swift_endAccess();
}

uint64_t sub_1000157B8(uint64_t a1)
{
  uint64_t v8 = a1;
  unint64_t v4 = (*(void *)(*(void *)(sub_1000102A0(&qword_100035C58) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (const void *)__chkstk_darwin(v8);
  uint64_t v5 = (char *)&v4 - v4;
  sub_100017EEC(v2, (char *)&v4 - v4);
  uint64_t v6 = (void *)(v1 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_timePreviewLastPlayed);
  uint64_t v7 = &v9;
  swift_beginAccess();
  sub_100018014(v5, v6);
  swift_endAccess();
  return sub_100018244(v8);
}

uint64_t (*sub_100015880())()
{
  return sub_10001571C;
}

uint64_t sub_1000158E4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

id sub_100015928()
{
  uint64_t v33 = 0;
  id v32 = 0;
  id v31 = 0;
  id v30 = 0;
  uint64_t v20 = sub_1000294C0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = v20 - 8;
  unint64_t v23 = (*(void *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)v7 - v23;
  uint64_t v33 = v0;
  id v28 = (id)*sub_1000155C4();
  id v1 = v28;
  uint64_t v25 = *(void *)(v0 + 16);
  uint64_t v27 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  id v26 = sub_100029A70();
  id v29 = objc_msgSend(v28, "objectForKey:");

  swift_bridgeObjectRelease();
  if (v29)
  {
    id v18 = v29;
    id v30 = v29;
    return v29;
  }
  else
  {
    uint64_t v2 = v24;
    unint64_t v13 = sub_100017E84();
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v2, v19 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_artworkAddress, v20);
    uint64_t v14 = sub_1000294B0();
    uint64_t v15 = v3;
    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
    id v16 = sub_100015BCC();
    id v32 = v16;
    id v4 = v16;
    if (v16)
    {
      id v12 = v16;
      id v11 = v16;
      id v31 = v16;
      id v10 = (id)*sub_1000155C4();
      id v5 = v10;
      v7[1] = *(void *)(v19 + 16);
      uint64_t v9 = *(void *)(v19 + 24);
      swift_bridgeObjectRetain();
      id v8 = sub_100029A70();
      objc_msgSend(v10, "setObject:forKey:", v11);

      swift_bridgeObjectRelease();
    }
    return v16;
  }
}

id sub_100015BCC()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_100019754();
}

uint64_t sub_100015C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100015C98(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_100015C98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v30 = a1;
  uint64_t v47 = a2;
  uint64_t v31 = a3;
  uint64_t v46 = a4;
  uint64_t v42 = a5;
  uint64_t v41 = a6;
  uint64_t v38 = a7;
  uint64_t v37 = a8;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v53 = 0;
  uint64_t v52 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v49 = 0;
  v27[1] = 0;
  uint64_t v43 = sub_1000294C0();
  uint64_t v39 = *(void **)(v43 - 8);
  uint64_t v40 = v43 - 8;
  unint64_t v28 = (v39[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v34 = (char *)v27 - v28;
  uint64_t v56 = v9;
  uint64_t v57 = v10;
  uint64_t v54 = v11;
  uint64_t v55 = v12;
  uint64_t v53 = v13;
  uint64_t v52 = v14;
  uint64_t v50 = v15;
  uint64_t v51 = v16;
  uint64_t v49 = v8;
  v8[6] = 0;
  uint64_t v29 = OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_timePreviewLastPlayed;
  uint64_t v17 = sub_100029520();
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 56))((char *)v8 + v29, 1);
  swift_bridgeObjectRetain();
  uint64_t v18 = v47;
  v8[2] = v30;
  v8[3] = v18;
  swift_bridgeObjectRetain();
  uint64_t v19 = v34;
  uint64_t v20 = v39;
  uint64_t v21 = v42;
  uint64_t v22 = v43;
  uint64_t v23 = v46;
  v8[4] = v31;
  v8[5] = v23;
  uint64_t v33 = (void (*)(char *, uint64_t, uint64_t))v20[2];
  id v32 = v20 + 2;
  v33(v19, v21, v22);
  uint64_t v36 = (void (*)(char *, char *, uint64_t))v39[4];
  uint64_t v35 = v39 + 4;
  v36((char *)v8 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_artworkAddress, v34, v43);
  v33(v34, v41, v43);
  v36((char *)v8 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_audioAddress, v34, v43);
  swift_bridgeObjectRetain();
  uint64_t v24 = v37;
  uint64_t v25 = (void *)((char *)v8 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_artistName);
  *uint64_t v25 = v38;
  v25[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v45 = (void (*)(uint64_t, uint64_t))v39[1];
  uint64_t v44 = v39 + 1;
  v45(v41, v43);
  v45(v42, v43);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v48;
}

uint64_t sub_100015FA8()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_100029AE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_100016044()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_100029AC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_1000160E0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100016140()
{
  uint64_t v65 = sub_100018434;
  uint64_t v66 = sub_1000186BC;
  uint64_t v88 = 0;
  uint64_t v92 = 0;
  unint64_t v93 = 0;
  id v87 = 0;
  id v86 = 0;
  Class v85 = 0;
  uint64_t v89 = 0;
  unint64_t v90 = 0;
  uint64_t v83 = 0;
  uint64_t v67 = sub_1000294C0();
  uint64_t v74 = *(void *)(v67 - 8);
  uint64_t v68 = v67 - 8;
  uint64_t v70 = *(void *)(v74 + 64);
  unint64_t v69 = (v70 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v67);
  uint64_t v71 = (uint64_t)&v26 - v69;
  unint64_t v72 = v69;
  __chkstk_darwin((char *)&v26 - v69);
  uint64_t v78 = (char *)&v26 - v72;
  uint64_t v88 = v73;
  uint64_t v75 = *(void (**)(void))(v74 + 16);
  uint64_t v76 = v74 + 16;
  v75();
  sub_1000169E0();
  uint64_t v0 = v77;
  uint64_t v1 = sub_1000294D0();
  uint64_t v79 = v0;
  uint64_t v80 = v1;
  unint64_t v81 = v2;
  uint64_t v82 = v0;
  if (v0)
  {
    uint64_t v29 = v82;
    uint64_t v30 = 0;
    unint64_t v31 = 0xF000000000000000;
    uint64_t v32 = 0;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v78, v67);
    swift_errorRelease();
    uint64_t v62 = v30;
    unint64_t v63 = v31;
    uint64_t v64 = v32;
  }
  else
  {
    unint64_t v61 = v81;
    uint64_t v60 = v80;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v78, v67);
    uint64_t v62 = v60;
    unint64_t v63 = v61;
    uint64_t v64 = v79;
  }
  uint64_t v39 = v64;
  unint64_t v42 = v63;
  uint64_t v41 = v62;
  uint64_t v92 = v62;
  unint64_t v93 = v63;
  BOOL v54 = 0;
  sub_1000182F4();
  swift_retain();
  sub_10001835C(v41, v42);
  uint64_t v40 = &v26;
  uint64_t v3 = __chkstk_darwin(v65);
  uint64_t v4 = v41;
  id v5 = &v26 - 12;
  *((void *)v5 + 2) = v73;
  *((void *)v5 + 3) = v4;
  *((void *)v5 + 4) = v6;
  id v43 = (id)sub_100016CA8(v3, (uint64_t)(&v26 - 12));
  swift_release();
  sub_100018444(v41, v42);
  id v87 = v43;
  unint64_t v51 = sub_10001851C();
  uint64_t v47 = v73[2];
  uint64_t v48 = v73[3];
  swift_bridgeObjectRetain();
  uint64_t v44 = v73[4];
  uint64_t v45 = v73[5];
  swift_bridgeObjectRetain();
  sub_100018584();
  ((void (*)(uint64_t, char *, uint64_t))v75)(v71, (char *)v73 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_artworkAddress, v67);
  id v46 = sub_100016CF0(v71, v7);
  unsigned int v55 = 1;
  uint64_t v8 = sub_100029AD0("Apple", 5uLL, 1);
  id v49 = sub_100016D9C(v47, v48, v44, v45, 17, v46, v8, v9);
  id v86 = v49;
  sub_1000185EC();
  INPlaybackRepeatMode v53 = INPlaybackRepeatModeNone;
  uint64_t v52 = (void *)sub_100029F80();
  uint64_t v50 = v10;
  id v11 = v49;
  v94.value._rawValue = v52;
  *uint64_t v50 = v49;
  sub_10001D2B4();
  v12.value = v54;
  v25.value = 0.0;
  v94.is_nil = v54;
  v13.value = 2;
  v95.value.super.Class isa = (Class)2;
  v95.is_nil = v53;
  Class isa = sub_100029D10(v94, v95, v13, v53, v12, (INPlaybackQueueLocation)v55, v25, v26, (INMediaSearch_optional)v27).super.super.isa;
  Class v85 = isa;
  v91 = 0;
  id v56 = self;
  uint64_t v14 = isa;
  id v84 = v91;
  id v59 = [v56 archivedDataWithRootObject:isa requiringSecureCoding:v55 & 1 error:&v84];
  id v57 = v84;
  id v15 = v84;
  uint64_t v16 = v91;
  v91 = v57;

  swift_unknownObjectRelease();
  if (v59)
  {
    id v38 = v59;
    id v33 = v59;
    uint64_t v36 = sub_1000294F0();
    unint64_t v37 = v17;
    uint64_t v89 = v36;
    unint64_t v90 = v17;

    sub_100018654();
    swift_retain();
    sub_1000183A8(v36, v37);
    id v18 = v43;
    uint64_t v34 = &v26;
    uint64_t v19 = __chkstk_darwin(v66);
    uint64_t v20 = v36;
    unint64_t v21 = v37;
    uint64_t v22 = &v26 - 12;
    *((void *)v22 + 2) = v73;
    *((void *)v22 + 3) = v20;
    *((void *)v22 + 4) = v21;
    *((void *)v22 + 5) = v23;
    uint64_t v35 = sub_100017008(v19, (uint64_t)(&v26 - 12));
    swift_release();
    sub_100018490(v36, v37);

    uint64_t v83 = v35;
    sub_100018490(v36, v37);

    sub_100018444(v41, v42);
    return v35;
  }
  else
  {
    *((void *)&v27 + 1) = v91;
    uint64_t v28 = sub_100029480();

    swift_willThrow();
    sub_100018444(v41, v42);
    return v27;
  }
}

uint64_t sub_1000169E0()
{
  return 0;
}

void sub_1000169E8(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  id v30 = a1;
  uint64_t v24 = a2;
  uint64_t v31 = a3;
  unint64_t v32 = a4;
  uint64_t v36 = 0;
  uint64_t v35 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v19 = sub_1000294C0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = v19 - 8;
  unint64_t v22 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v23 = (char *)&v11 - v22;
  uint64_t v36 = __chkstk_darwin(v30);
  uint64_t v35 = v4;
  uint64_t v33 = v5;
  uint64_t v34 = v6;
  swift_getObjectType();
  uint64_t v25 = *(void *)(v24 + 32);
  uint64_t v26 = *(void *)(v24 + 40);
  swift_bridgeObjectRetain();
  id v27 = sub_100029A70();
  swift_bridgeObjectRelease();
  [v30 setTitle:v27];

  swift_getObjectType();
  sub_100029AD0("Apple", 5uLL, 1);
  uint64_t v28 = v7;
  id v29 = sub_100029A70();
  swift_bridgeObjectRelease();
  [v30 setSubtitle:v29];

  swift_getObjectType();
  sub_10001835C(v31, v32);
  if ((v32 & 0xF000000000000000) == 0xF000000000000000)
  {
    Class v16 = 0;
  }
  else
  {
    uint64_t v17 = v31;
    unint64_t v18 = v32;
    unint64_t v13 = v32;
    uint64_t v14 = v31;
    Class isa = sub_1000294E0().super.isa;
    sub_100018490(v14, v13);
    Class v16 = isa;
  }
  uint64_t v8 = v23;
  [v30 setArtworkImageData:v16];

  swift_getObjectType();
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v8, v24 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_artworkAddress, v19);
  sub_100029490(v9);
  id v12 = v10;
  (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
  [v30 setArtworkImageURL:v12];
}

uint64_t sub_100016CA8(uint64_t a1, uint64_t a2)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_1000197B0(a1, a2);
}

id sub_100016CF0@<X0>(uint64_t a1@<X0>, NSURL *a2@<X8>)
{
  sub_100029490(a2);
  id v5 = v2;
  id v7 = [(id)swift_getObjCClassFromMetadata() imageWithURL:v2];

  uint64_t v3 = sub_1000294C0();
  (*(void (**)(uint64_t))(*(void *)(v3 - 8) + 8))(a1);
  return v7;
}

id sub_100016D9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_100019974(a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_100016E14(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  swift_getObjectType();
  [a1 setType:1];
  swift_getObjectType();
  swift_bridgeObjectRetain();
  NSString v11 = sub_100029A70();
  swift_bridgeObjectRelease();
  sub_100029AD0("NSKeyedArchive", 0xEuLL, 1);
  swift_bridgeObjectRetain();
  NSString v10 = sub_100029A70();
  id v5 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1000183A8(a3, a4);
  Class isa = sub_1000294E0().super.isa;
  sub_100018490(a3, a4);
  [a1 setSessionIdentifier:v11 type:v10 data:isa];

  swift_getObjectType();
  sub_100029AD0("com.apple.SoundScapes", 0x15uLL, 1);
  NSString v12 = sub_100029A70();
  swift_bridgeObjectRelease();
  [a1 setBundleIdentifier:v12];

  swift_getObjectType();
  id v6 = a5;
  [a1 setDisplayProperties:a5];
}

uint64_t sub_100017008(uint64_t a1, uint64_t a2)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_100019B34(a1, a2);
}

uint64_t sub_100017050()
{
  uint64_t v17 = 0;
  uint64_t v1 = sub_1000102A0(&qword_100035C58);
  unint64_t v11 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v1);
  NSString v12 = (char *)&v7 - v11;
  unint64_t v13 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v7 - v11);
  uint64_t v14 = (char *)&v7 - v13;
  uint64_t v17 = v0;
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v15 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
  }
  else
  {
    *(void *)(v10 + 48) = v15;
    swift_endAccess();
    sub_100029510();
    uint64_t v6 = sub_100029520();
    (*(void (**)(char *, void, uint64_t))(*(void *)(v6 - 8) + 56))(v14, 0, 1);
    sub_100017EEC(v14, v12);
    id v8 = (void *)(v10 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_timePreviewLastPlayed);
    uint64_t v9 = &v16;
    swift_beginAccess();
    sub_100018014(v12, v8);
    swift_endAccess();
    return sub_100018244((uint64_t)v14);
  }
  return result;
}

uint64_t sub_1000171EC()
{
  sub_100012D00();
  sub_100012D00();
  sub_100018244(v0 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_timePreviewLastPlayed);
  uint64_t v2 = OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_artworkAddress;
  uint64_t v3 = sub_1000294C0();
  uint64_t v4 = *(void (**)(uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v0 + v2);
  ((void (*)(uint64_t, uint64_t))v4)(v0 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_audioAddress, v3);
  sub_100012D00();
  return v5;
}

uint64_t sub_1000172C8()
{
  return swift_deallocClassInstance();
}

uint64_t sub_100017330()
{
  return sub_100029E40();
}

uint64_t sub_100017384()
{
  return sub_100016044() & 1;
}

uint64_t sub_1000173A8()
{
  return sub_100029A60() & 1;
}

uint64_t sub_1000173C4()
{
  return sub_100029A50() & 1;
}

uint64_t sub_1000173E0()
{
  return sub_100029A40() & 1;
}

uint64_t sub_1000173FC()
{
  return 1;
}

uint64_t sub_100017420()
{
  return sub_100029FF0();
}

uint64_t sub_100017478()
{
  return sub_100029E40();
}

uint64_t sub_1000174B0()
{
  return sub_100017330();
}

uint64_t sub_1000174D4()
{
  return sub_1000160E0();
}

uint64_t sub_1000174F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000158E4();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_100017534()
{
  return sub_100015FA8() & 1;
}

uint64_t sub_100017558()
{
  return sub_1000173FC() & 1;
}

uint64_t sub_100017574()
{
  return sub_100017478();
}

uint64_t sub_10001758C()
{
  return sub_100017420();
}

uint64_t sub_1000175A4(char *a1)
{
  uint64_t v75 = a1;
  uint64_t v65 = 0;
  uint64_t v64 = (void (*)(char *, char *))sub_100018EA0;
  uint64_t v89 = 0;
  uint64_t v88 = 0;
  id v87 = 0;
  uint64_t v85 = 0;
  unint64_t v86 = 0;
  uint64_t v83 = 0;
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  uint64_t v74 = sub_1000294C0();
  uint64_t v72 = *(void *)(v74 - 8);
  uint64_t v73 = v74 - 8;
  uint64_t v69 = *(void *)(v72 + 64);
  unint64_t v66 = (v69 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(0);
  uint64_t v67 = (char *)v23 - v66;
  unint64_t v68 = v66;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v70 = (char *)v23 - v68;
  unint64_t v71 = (v69 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v3);
  uint64_t v78 = (uint64_t)v23 - v71;
  uint64_t v89 = v4;
  uint64_t v88 = v1;
  sub_1000187C8();
  uint64_t v76 = *(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16);
  uint64_t v77 = v72 + 16;
  v76(v78, (uint64_t)v75, v74);
  id v79 = sub_100018830(v78);
  if (v79)
  {
    id v61 = v79;
    id v51 = v79;
    id v87 = v79;
    sub_100029AD0("Info.json", 9uLL, 1);
    uint64_t v52 = v5;
    sub_1000294A0();
    swift_bridgeObjectRelease();
    sub_1000169E0();
    uint64_t v6 = v63;
    uint64_t v7 = sub_1000294D0();
    uint64_t v53 = v6;
    uint64_t v54 = v7;
    unint64_t v55 = v8;
    uint64_t v56 = v6;
    if (v6)
    {
      uint64_t v25 = v56;
      (*(void (**)(char *, uint64_t))(v72 + 8))(v70, v74);

      uint64_t v59 = v25;
      uint64_t v60 = v62;
    }
    else
    {
      unint64_t v47 = v55;
      uint64_t v46 = v54;
      id v43 = *(void (**)(char *, uint64_t))(v72 + 8);
      uint64_t v44 = v72 + 8;
      v43(v70, v74);
      uint64_t v85 = v46;
      unint64_t v86 = v47;
      sub_100029440();
      uint64_t v45 = sub_100029430();
      uint64_t v48 = sub_1000102A0(&qword_100035CA8);
      sub_100018918();
      uint64_t v9 = v53;
      sub_100029420();
      uint64_t v49 = v9;
      uint64_t v50 = v9;
      if (v9)
      {
        uint64_t v24 = v50;
        swift_release();
        sub_100018490(v46, v47);

        uint64_t v59 = v24;
        uint64_t v60 = v62;
      }
      else
      {
        swift_release();
        uint64_t v35 = v84;
        uint64_t v83 = v84;
        int v29 = 1;
        sub_100029AD0("ARTIST_NAME", 0xBuLL, 1);
        uint64_t v27 = v10;
        id v33 = sub_100029A70();
        swift_bridgeObjectRelease();
        sub_100029AD0("Apple", 5uLL, v29 & 1);
        uint64_t v28 = v11;
        id v32 = sub_100029A70();
        swift_bridgeObjectRelease();
        sub_100029AD0("SSLocalizedAssets", 0x11uLL, v29 & 1);
        uint64_t v30 = v12;
        id v31 = sub_100029A70();
        swift_bridgeObjectRelease();
        id v34 = [v51 localizedStringForKey:v33 value:v32 table:v31];

        uint64_t v36 = sub_100029A80();
        uint64_t v37 = v13;
        uint64_t v81 = v36;
        uint64_t v82 = v13;

        uint64_t v80 = v35;
        id v14 = v51;
        v76((uint64_t)v67, (uint64_t)v75, v74);
        swift_bridgeObjectRetain();
        id v38 = v23;
        uint64_t v15 = __chkstk_darwin(v36);
        char v16 = v67;
        uint64_t v17 = &v23[-6];
        uint64_t v39 = &v23[-6];
        v17[2] = v51;
        v17[3] = v16;
        v17[4] = v15;
        v17[5] = v18;
        uint64_t v40 = type metadata accessor for SoundScapesOption();
        unint64_t v19 = sub_100018ED8();
        uint64_t v20 = v49;
        uint64_t v21 = sub_10001C978(v64, (uint64_t)v39, v48, v40, (uint64_t)&type metadata for Never, v19, (uint64_t)&protocol witness table for Never, v57);
        uint64_t v41 = v20;
        uint64_t v42 = v21;
        if (!v20)
        {
          uint64_t v26 = v42;

          v43(v67, v74);
          swift_bridgeObjectRelease();
          *(void *)(v62 + 16) = v26;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_100018490(v46, v47);

          v43(v75, v74);
          return v62;
        }
        __break(1u);
      }
    }
  }
  else
  {
    sub_100018870();
    uint64_t v58 = swift_allocError();
    swift_willThrow();
    uint64_t v59 = v58;
    uint64_t v60 = v62;
  }
  v23[0] = v60;
  v23[1] = v59;
  type metadata accessor for SoundScapesOptionsManager();
  swift_deallocPartialClassInstance();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v75, v74);
  return v57;
}

unint64_t sub_100017E1C()
{
  uint64_t v2 = qword_100035C48;
  if (!qword_100035C48)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100035C48);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_100017E84()
{
  uint64_t v2 = qword_100035C50;
  if (!qword_100035C50)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100035C50);
    return ObjCClassMetadata;
  }
  return v2;
}

void *sub_100017EEC(const void *a1, void *a2)
{
  uint64_t v6 = sub_100029520();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = sub_1000102A0(&qword_100035C58);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

void *sub_100018014(const void *a1, void *a2)
{
  uint64_t v7 = sub_100029520();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a2, 1))
  {
    if (v9(a1, 1, v7))
    {
      uint64_t v3 = sub_1000102A0(&qword_100035C58);
      memcpy(a2, a1, *(void *)(*(void *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a2, a1, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
    }
  }
  else if (v9(a1, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a2, v7);
    uint64_t v2 = sub_1000102A0(&qword_100035C58);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a2, a1, v7);
  }
  return a2;
}

uint64_t sub_100018244(uint64_t a1)
{
  uint64_t v3 = sub_100029520();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

unint64_t sub_1000182F4()
{
  uint64_t v2 = qword_100035C60;
  if (!qword_100035C60)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100035C60);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_10001835C(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000) {
    return sub_1000183A8(result, a2);
  }
  return result;
}

uint64_t sub_1000183A8(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_retain();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

void sub_100018434(void *a1)
{
  sub_1000169E8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_100018444(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000) {
    return sub_100018490(result, a2);
  }
  return result;
}

uint64_t sub_100018490(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_release();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_10001851C()
{
  uint64_t v2 = qword_100035C68;
  if (!qword_100035C68)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100035C68);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_100018584()
{
  uint64_t v2 = qword_100035C70;
  if (!qword_100035C70)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100035C70);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_1000185EC()
{
  uint64_t v2 = qword_100035C78;
  if (!qword_100035C78)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100035C78);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_100018654()
{
  uint64_t v2 = qword_100035C80;
  if (!qword_100035C80)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100035C80);
    return ObjCClassMetadata;
  }
  return v2;
}

void sub_1000186BC(void *a1)
{
  sub_100016E14(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t type metadata accessor for SoundScapesOption()
{
  uint64_t v1 = qword_100035CF0;
  if (!qword_100035CF0) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

unint64_t sub_100018748()
{
  uint64_t v2 = qword_100035C90;
  if (!qword_100035C90)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035C90);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000187C8()
{
  uint64_t v2 = qword_100035C98;
  if (!qword_100035C98)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100035C98);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_100018830(uint64_t a1)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_100019C78(a1, v2);
}

unint64_t sub_100018870()
{
  uint64_t v2 = qword_100035CA0;
  if (!qword_100035CA0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035CA0);
    return WitnessTable;
  }
  return v2;
}

uint64_t type metadata accessor for SoundScapesOptionsManager()
{
  return self;
}

unint64_t sub_100018918()
{
  uint64_t v2 = qword_100035CB0;
  if (!qword_100035CB0)
  {
    sub_100010600(&qword_100035CA8);
    sub_1000189AC();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035CB0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000189AC()
{
  uint64_t v2 = qword_100035CB8;
  if (!qword_100035CB8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035CB8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100018A28@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v50 = a6;
  v20[1] = a1;
  id v28 = a2;
  uint64_t v48 = a4;
  uint64_t v49 = a5;
  uint64_t v63 = 0;
  uint64_t v62 = 0;
  uint64_t v61 = 0;
  uint64_t v60 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  uint64_t v37 = 0;
  uint64_t v51 = sub_1000294C0();
  uint64_t v35 = *(void *)(v51 - 8);
  uint64_t v36 = v51 - 8;
  uint64_t v23 = *(void *)(v35 + 64);
  unint64_t v21 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v51);
  uint64_t v47 = (uint64_t)v20 - v21;
  unint64_t v22 = v21;
  __chkstk_darwin((char *)v20 - v21);
  uint64_t v46 = (uint64_t)v20 - v22;
  unint64_t v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v20 - v22);
  uint64_t v54 = (char *)v20 - v24;
  uint64_t v63 = (char *)v20 - v24;
  uint64_t v43 = *v7;
  uint64_t v44 = v7[1];
  uint64_t v25 = v7[2];
  uint64_t v26 = v7[3];
  uint64_t v38 = v7[4];
  uint64_t v39 = v7[5];
  uint64_t v40 = v7[6];
  uint64_t v42 = v7[7];
  uint64_t v62 = v7;
  uint64_t v61 = v8;
  uint64_t v60 = a3;
  uint64_t v58 = v9;
  uint64_t v59 = v10;
  swift_bridgeObjectRetain();
  id v31 = sub_100029A70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v30 = sub_100029A70();
  swift_bridgeObjectRelease();
  int v33 = 1;
  sub_100029AD0("SSLocalizedAssets", 0x11uLL, 1);
  uint64_t v27 = v11;
  id v29 = sub_100029A70();
  swift_bridgeObjectRelease();
  id v32 = [v28 localizedStringForKey:v31 value:v30 table:v29];

  uint64_t v45 = sub_100029A80();
  uint64_t v55 = v12;
  uint64_t v56 = v45;
  uint64_t v57 = v12;

  sub_100029AD0("Resources", 9uLL, v33 & 1);
  uint64_t v34 = v13;
  sub_1000294A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1000294A0();
  swift_bridgeObjectRelease();
  uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
  uint64_t v52 = v35 + 8;
  v53(v46, v51);
  uint64_t v41 = type metadata accessor for SoundScapesOption();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000294A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1000294A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_100015C14(v43, v44, v45, v55, v46, v47, v48, v49);
  uint64_t v15 = v51;
  char v16 = (void (*)(char *, uint64_t))v53;
  uint64_t v17 = v14;
  uint64_t v18 = v54;
  *uint64_t v50 = v17;
  v16(v18, v15);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100018EA0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100018A28(a1, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), a2);
}

unint64_t sub_100018ED8()
{
  uint64_t v2 = qword_100035CC0;
  if (!qword_100035CC0)
  {
    sub_100010600(&qword_100035CA8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035CC0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100018F5C()
{
  return type metadata accessor for SoundScapesOption();
}

uint64_t sub_100018F78()
{
  uint64_t updated = sub_1000190FC();
  if (v0 <= 0x3F)
  {
    uint64_t updated = sub_1000294C0();
    if (v1 <= 0x3F)
    {
      uint64_t updated = swift_updateClassMetadata2();
      if (!updated) {
        return 0;
      }
    }
  }
  return updated;
}

uint64_t sub_1000190FC()
{
  uint64_t v4 = qword_100035D00;
  if (!qword_100035D00)
  {
    sub_100029520();
    unint64_t v3 = sub_100029DC0();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_100035D00);
      return v1;
    }
  }
  return v4;
}

uint64_t sub_1000191A4()
{
  sub_100010678();
  return v1;
}

uint64_t sub_1000191D8()
{
  return swift_deallocClassInstance();
}

uint64_t sub_10001921C(unsigned __int8 *a1, int a2)
{
  if (a2)
  {
    int v6 = 1;
    if ((a2 + 1) >= 0x100)
    {
      if ((a2 + 1) >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v6 = v2;
    }
    if (v6 == 1)
    {
      int v5 = *a1;
    }
    else if (v6 == 2)
    {
      int v5 = *(unsigned __int16 *)a1;
    }
    else
    {
      int v5 = *(_DWORD *)a1;
    }
    if (v5) {
      int v4 = v5 - 1;
    }
    else {
      int v4 = -1;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

unsigned char *sub_1000193B0(unsigned char *result, int a2, int a3)
{
  int v5 = 0;
  if (a3)
  {
    int v4 = 1;
    if ((a3 + 1) >= 0x100)
    {
      if ((a3 + 1) >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v4 = v3;
    }
    int v5 = v4;
  }
  if (a2)
  {
    if (v5)
    {
      if (v5 == 1)
      {
        *uint64_t result = a2;
      }
      else if (v5 == 2)
      {
        *(_WORD *)uint64_t result = a2;
      }
      else
      {
        *(_DWORD *)uint64_t result = a2;
      }
    }
  }
  else if (v5)
  {
    if (v5 == 1)
    {
      *uint64_t result = 0;
    }
    else if (v5 == 2)
    {
      *(_WORD *)uint64_t result = 0;
    }
    else
    {
      *(_DWORD *)uint64_t result = 0;
    }
  }
  return result;
}

uint64_t sub_1000195C0()
{
  return 0;
}

void *type metadata accessor for SoundScapesOptionsManager.Error()
{
  return &unk_100031B48;
}

unint64_t sub_1000195DC()
{
  return sub_1000195F4();
}

unint64_t sub_1000195F4()
{
  uint64_t v2 = qword_100035EB0;
  if (!qword_100035EB0)
  {
    type metadata accessor for SoundScapesOption();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035EB0);
    return WitnessTable;
  }
  return v2;
}

void *sub_100019678()
{
  return &protocol witness table for String;
}

unint64_t sub_100019684()
{
  return sub_10001969C();
}

unint64_t sub_10001969C()
{
  uint64_t v2 = qword_100035EB8;
  if (!qword_100035EB8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035EB8);
    return WitnessTable;
  }
  return v2;
}

id sub_10001971C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(v2, "init", a2, a1);
}

id sub_100019754()
{
  NSString v2 = sub_100029A70();
  id v3 = objc_msgSend(v1, "initWithContentsOfFile:");

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1000197B0(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  uint64_t v14 = sub_100019D40;
  uint64_t v15 = v8;
  aBlock = _NSConcreteStackBlock;
  int v10 = 1107296256;
  int v11 = 0;
  uint64_t v12 = sub_10001991C;
  uint64_t v13 = &unk_100031BD0;
  int v6 = _Block_copy(&aBlock);
  id v7 = objc_msgSend(v5, "initWithBlock:");
  _Block_release(v6);
  swift_release();
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    return (uint64_t)v7;
  }
  return result;
}

uint64_t sub_1000198F4(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_10001991C(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

id sub_100019974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    NSString v15 = sub_100029A70();
    swift_bridgeObjectRelease();
    char v16 = v15;
  }
  else
  {
    char v16 = 0;
  }
  if (a4)
  {
    NSString v13 = sub_100029A70();
    swift_bridgeObjectRelease();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (a8)
  {
    NSString v12 = sub_100029A70();
    swift_bridgeObjectRelease();
    id v8 = [v21 initWithIdentifier:v16 title:v14 type:a5 artwork:a6 artist:v12];
  }
  else
  {
    id v8 = [v21 initWithIdentifier:v16 title:v14 type:a5 artwork:a6 artist:0];
  }
  id v11 = v8;

  return v11;
}

uint64_t sub_100019B34(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  uint64_t v14 = sub_100019D40;
  uint64_t v15 = v8;
  aBlock = _NSConcreteStackBlock;
  int v10 = 1107296256;
  int v11 = 0;
  NSString v12 = sub_10001991C;
  NSString v13 = &unk_100031B80;
  int v6 = _Block_copy(&aBlock);
  id v7 = objc_msgSend(v5, "initWithBlock:");
  _Block_release(v6);
  swift_release();
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    return (uint64_t)v7;
  }
  return result;
}

id sub_100019C78@<X0>(uint64_t a1@<X0>, NSURL *a2@<X8>)
{
  sub_100029490(a2);
  id v6 = v3;
  id v8 = objc_msgSend(v2, "initWithURL:");

  uint64_t v4 = sub_1000294C0();
  (*(void (**)(uint64_t))(*(void *)(v4 - 8) + 8))(a1);
  return v8;
}

uint64_t sub_100019D14()
{
  return swift_deallocObject();
}

uint64_t sub_100019D40(uint64_t a1)
{
  return sub_1000198F4(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_100019D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_100019D94()
{
  return swift_release();
}

uint64_t sub_100019DB0()
{
  return swift_deallocObject();
}

uint64_t sub_100019DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_100019E24()
{
  return swift_release();
}

uint64_t sub_100019E40()
{
  uint64_t v1 = sub_1000295A0();
  sub_100019EE4(v1, qword_100035F80);
  sub_100019F8C(v1, (uint64_t)qword_100035F80);
  sub_100029AD0("com.apple.soundscapes", 0x15uLL, 1);
  sub_100029AD0("AnalyticsSender", 0xFuLL, 1);
  return sub_100029590();
}

uint64_t sub_100019EE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t sub_100019F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t sub_100019FF0()
{
  if (qword_1000357E8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1000295A0();
  return sub_100019F8C(v0, (uint64_t)qword_100035F80);
}

void sub_10001A060(void *a1)
{
  uint64_t v57 = a1;
  uint64_t v60 = sub_10001AE44;
  unint64_t v66 = sub_10001AD98;
  unint64_t v68 = sub_10001C2D0;
  uint64_t v73 = sub_10001B09C;
  uint64_t v77 = sub_10001C2D0;
  id v79 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001C25C;
  uint64_t v81 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001C25C;
  uint64_t v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001C31C;
  uint64_t v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001C25C;
  id v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001C25C;
  unint64_t v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001C31C;
  uint64_t v105 = 0;
  uint64_t v50 = 0;
  uint64_t v55 = sub_1000295A0();
  uint64_t v53 = *(void *)(v55 - 8);
  uint64_t v54 = v55 - 8;
  unint64_t v51 = (*(void *)(v53 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (char *)&v29 - v51;
  uint64_t v52 = (char *)&v29 - v51;
  uint64_t v105 = __chkstk_darwin(v57);
  uint64_t v2 = sub_100019FF0();
  (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v1, v2, v55);
  uint64_t v56 = v104;
  sub_10001ACB0((uint64_t)v57, (uint64_t)v104);
  uint64_t v58 = 56;
  uint64_t v75 = 7;
  uint64_t v67 = swift_allocObject();
  sub_10001AD5C(v56, (void *)(v67 + 16));
  uint64_t v59 = v103;
  sub_10001ACB0((uint64_t)v57, (uint64_t)v103);
  uint64_t v61 = swift_allocObject();
  sub_10001AD5C(v59, (void *)(v61 + 16));
  swift_retain();
  uint64_t v74 = 32;
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = v61;
  uint64_t v76 = v3;
  *(void *)(v3 + 16) = v60;
  *(void *)(v3 + 24) = v4;
  swift_release();
  Swift::OpaquePointer_optional v94 = sub_100029580();
  int v95 = sub_100029D00();
  uint64_t v64 = &v101;
  uint64_t v101 = 22;
  unint64_t v62 = sub_10001B180();
  unint64_t v63 = sub_10001B1FC();
  sub_10001B278();
  sub_100029B60();
  uint32_t v65 = v102;
  uint64_t v71 = 17;
  uint64_t v80 = swift_allocObject();
  int v70 = 32;
  *(unsigned char *)(v80 + 16) = 32;
  uint64_t v82 = swift_allocObject();
  int v72 = 8;
  *(unsigned char *)(v82 + 16) = 8;
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = v67;
  uint64_t v69 = v5;
  *(void *)(v5 + 16) = v66;
  *(void *)(v5 + 24) = v6;
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v69;
  uint64_t v84 = v7;
  *(void *)(v7 + 16) = v68;
  *(void *)(v7 + 24) = v8;
  uint64_t v86 = swift_allocObject();
  *(unsigned char *)(v86 + 16) = v70;
  uint64_t v88 = swift_allocObject();
  *(unsigned char *)(v88 + 16) = v72;
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = v76;
  uint64_t v78 = v9;
  *(void *)(v9 + 16) = v73;
  *(void *)(v9 + 24) = v10;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v78;
  uint64_t v91 = v11;
  *(void *)(v11 + 16) = v77;
  *(void *)(v11 + 24) = v12;
  uint64_t v93 = sub_1000102A0(&qword_100035FC0);
  uint64_t v89 = sub_100029F80();
  uint64_t v92 = v13;
  swift_retain();
  uint64_t v14 = v80;
  uint64_t v15 = v92;
  *uint64_t v92 = v79;
  v15[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v14;
  swift_retain();
  uint64_t v16 = v82;
  uint64_t v17 = v92;
  v92[2] = v81;
  v17[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v16;
  swift_retain();
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v84;
  unint64_t v19 = v92;
  v92[4] = v83;
  v19[5] = v18;
  swift_retain();
  uint64_t v20 = v86;
  unint64_t v21 = v92;
  v92[6] = v85;
  v21[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20;
  swift_retain();
  uint64_t v22 = v88;
  uint64_t v23 = v92;
  v92[8] = v87;
  v23[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v22;
  swift_retain();
  unint64_t v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v91;
  uint64_t v25 = v92;
  v92[10] = v90;
  v25[11] = v24;
  sub_10001D2B4();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v94, (os_log_type_t)v95))
  {
    uint64_t v26 = v50;
    uint64_t v42 = (uint8_t *)sub_100029DB0();
    uint64_t v41 = sub_1000102A0(&qword_100035FD0);
    uint64_t v43 = sub_10001AE4C(0);
    uint64_t v44 = sub_10001AE4C(2);
    uint64_t v46 = &v100;
    uint64_t v100 = v42;
    uint64_t v47 = &v99;
    uint64_t v99 = v43;
    uint64_t v48 = &v98;
    uint64_t v98 = v44;
    unsigned int v45 = 2;
    sub_10001AEA8(2, &v100);
    sub_10001AEA8(v45, v46);
    uint64_t v96 = v79;
    uint64_t v97 = v80;
    sub_10001AEBC(&v96, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48);
    uint64_t v49 = v26;
    if (v26)
    {
      __break(1u);
    }
    else
    {
      uint64_t v96 = v81;
      uint64_t v97 = v82;
      sub_10001AEBC(&v96, (uint64_t)&v100, (uint64_t)&v99, (uint64_t)&v98);
      uint64_t v40 = 0;
      uint64_t v27 = v40;
      uint64_t v96 = v83;
      uint64_t v97 = v84;
      sub_10001AEBC(&v96, (uint64_t)&v100, (uint64_t)&v99, (uint64_t)&v98);
      uint64_t v39 = v27;
      uint64_t v96 = v85;
      uint64_t v97 = v86;
      sub_10001AEBC(&v96, (uint64_t)&v100, (uint64_t)&v99, (uint64_t)&v98);
      uint64_t v38 = 0;
      uint64_t v96 = v87;
      uint64_t v97 = v88;
      sub_10001AEBC(&v96, (uint64_t)&v100, (uint64_t)&v99, (uint64_t)&v98);
      uint64_t v37 = 0;
      uint64_t v96 = v90;
      uint64_t v97 = v91;
      sub_10001AEBC(&v96, (uint64_t)&v100, (uint64_t)&v99, (uint64_t)&v98);
      _os_log_impl((void *)&_mh_execute_header, v94, (os_log_type_t)v95, "Sending analytic event named: %s with info: %s", v42, v65);
      sub_10001AF08(v43);
      sub_10001AF08(v44);
      sub_100029D90();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }

  (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v55);
  uint64_t v30 = v57[3];
  uint64_t v29 = v57[4];
  sub_100007B00(v57, v30);
  (*(void (**)(uint64_t))(v29 + 8))(v30);
  uint64_t v31 = v28;
  id v36 = sub_100029A70();
  swift_bridgeObjectRelease();
  uint64_t v33 = v57[3];
  uint64_t v32 = v57[4];
  sub_100007B00(v57, v33);
  uint64_t v34 = (*(uint64_t (**)(uint64_t))(v32 + 16))(v33);
  sub_10001C400();
  Class isa = sub_1000299E0().super.isa;
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
}

uint64_t sub_10001AC58(void *a1)
{
  uint64_t v3 = a1[3];
  uint64_t v2 = a1[4];
  sub_100007B00(a1, v3);
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v3);
}

uint64_t sub_10001ACB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t sub_10001AD1C()
{
  sub_1000073E8(v0 + 16);
  return swift_deallocObject();
}

void *sub_10001AD5C(const void *a1, void *__dst)
{
  return __dst;
}

uint64_t sub_10001AD98()
{
  return sub_10001AC58((void *)(v0 + 16));
}

uint64_t sub_10001ADA0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  sub_100007B00(a1, v4);
  uint64_t result = (*(uint64_t (**)(uint64_t))(v3 + 16))(v4);
  *a2 = result;
  return result;
}

uint64_t sub_10001AE04()
{
  sub_1000073E8(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_10001AE44@<X0>(uint64_t *a1@<X8>)
{
  return sub_10001ADA0((void *)(v1 + 16), a1);
}

uint64_t sub_10001AE4C(uint64_t a1)
{
  if (a1) {
    return sub_100029DB0();
  }
  else {
    return 0;
  }
}

uint64_t sub_10001AEA8(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10001AEBC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void sub_10001AF08(uint64_t a1)
{
  if (a1)
  {
    sub_100029DA0();
    sub_100029D90();
  }
}

uint64_t sub_10001AF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a3;
  v7[1] = a4;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = a3 - 8;
  v7[0] = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (void (*)(void))__chkstk_darwin(a1);
  uint64_t v10 = (char *)v7 - v7[0];
  v4();
  uint64_t v12 = sub_100029F20();
  uint64_t v13 = v5;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v11);
  return v12;
}

uint64_t sub_10001B05C()
{
  return swift_deallocObject();
}

uint64_t sub_10001B09C()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = sub_1000102A0(&qword_100035F98);
  unint64_t v1 = sub_10001B0FC();

  return sub_10001AF78(v5, v3, v4, v1);
}

unint64_t sub_10001B0FC()
{
  uint64_t v2 = qword_100035FA0;
  if (!qword_100035FA0)
  {
    sub_100010600(&qword_100035F98);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035FA0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B180()
{
  uint64_t v2 = qword_100035FA8;
  if (!qword_100035FA8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035FA8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B1FC()
{
  uint64_t v2 = qword_100035FB0;
  if (!qword_100035FB0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035FB0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001B278()
{
  uint64_t v2 = qword_100035FB8;
  if (!qword_100035FB8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035FB8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001B2F4(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_10001B31C(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  sub_10001B3A0(v4, v5, a3);
  uint64_t v8 = *a1;
  sub_100029DD0();
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t sub_10001B3A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = sub_10001B514((uint64_t)&v17, 0, 0, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      sub_100007A9C((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    sub_1000073E8((uint64_t)v12);
  }
  else
  {
    v13[3] = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      sub_100007A9C((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    sub_1000073E8((uint64_t)v13);
  }
  return v11;
}

uint64_t sub_10001B514(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }
      else
      {
        int64_t v16 = 0;
      }
      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_10001B88C(v21, v15, a2);
          sub_100029DE0();
          *uint64_t v17 = a2;
          uint64_t v11 = 0;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          char v22 = v13 & 1;
          char v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    uint64_t v6 = sub_10001B8CC(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  uint64_t result = sub_100029E60();
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_10001B88C(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *sub_10001B8CC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_10001B980(a1, a2);
  sub_10001BAFC();
  uint64_t v4 = v6[2];
  sub_10001BB74(v4);
  sub_10001BBF8(v4, 0);
  sub_10001BC68();
  swift_retain();
  uint64_t v5 = sub_10001BC74((uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *sub_10001B980(uint64_t a1, uint64_t a2)
{
  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = sub_100029B00();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7) {
    return sub_10001BDF8();
  }
  uint64_t v5 = sub_10001BC8C(v7, 0);
  swift_retain();
  swift_release();
  uint64_t result = (void *)sub_100029E50();
  uint64_t v6 = result;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    sub_100012D00();
    if (v6 == (void *)v7) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10001BAFC()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = sub_10001BC74(*v3);
    uint64_t result = sub_10001BE28(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }
  return result;
}

uint64_t sub_10001BB74(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24) >> 1 < result + 1)
  {
    uint64_t result = sub_10001BE28(*(void *)(*(void *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    uint64_t *v2 = result;
  }
  return result;
}

uint64_t sub_10001BBF8(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release();
  uint64_t v6 = *v2;
  swift_retain();
  *(unsigned char *)(v6 + 32 + a1) = a2;
  return swift_release();
}

void sub_10001BC68()
{
  *uint64_t v0 = *v0;
}

uint64_t sub_10001BC74(uint64_t a1)
{
  return sub_10001C128(a1);
}

void *sub_10001BC8C(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = a2;
  }
  if (v6)
  {
    sub_1000102A0(&qword_100035FD8);
    uint64_t v5 = (void *)swift_allocObject();
    if (sub_10001C47C())
    {
      size_t v3 = (size_t)v5 + sub_10001C488(v5);
      swift_retain();
      _OWORD v5[2] = a1;
      v5[3] = 2 * (v3 - (void)(v5 + 4));
    }
    else
    {
      swift_retain();
      _OWORD v5[2] = a1;
      v5[3] = 2 * v6;
    }
    swift_release();
    return v5;
  }
  else
  {
    swift_retain();
    return &_swiftEmptyArrayStorage;
  }
}

void *sub_10001BDF8()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10001BE28(char a1, uint64_t a2, char a3, uint64_t a4)
{
  swift_retain();
  uint64_t result = swift_retain();
  uint64_t v15 = *(void *)(a4 + 24) >> 1;
  if (a3)
  {
    if (v15 < a2)
    {
      if ((unsigned __int128)(v15 * (__int128)2) >> 64 != (2 * v15) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v15 < a2) {
        uint64_t v10 = a2;
      }
      else {
        uint64_t v10 = 2 * v15;
      }
    }
    else
    {
      uint64_t v10 = *(void *)(a4 + 24) >> 1;
    }
  }
  else
  {
    uint64_t v10 = a2;
  }
  int64_t v9 = *(void *)(a4 + 16);
  if (v10 < v9) {
    uint64_t v8 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v8 = v10;
  }
  if (v8)
  {
    sub_1000102A0(&qword_100035FD8);
    uint64_t v7 = (void *)swift_allocObject();
    if (sub_10001C47C())
    {
      size_t v5 = (size_t)v7 + sub_10001C488(v7);
      swift_retain();
      void v7[2] = v9;
      v7[3] = 2 * (v5 - (void)(v7 + 4));
    }
    else
    {
      swift_retain();
      void v7[2] = v9;
      v7[3] = 2 * v8;
    }
    swift_release();
    uint64_t v6 = (char *)v7;
  }
  else
  {
    swift_retain();
    uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
  }
  if (a1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_10001C168((char *)(a4 + 32), v9, v6 + 32);
    *(void *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    sub_10001C130((const void *)(a4 + 32), v9, v6 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v6;
}

uint64_t sub_10001C128(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_10001C130(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_10001C168(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

unsigned char **sub_10001C21C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10001C230()
{
  return swift_deallocObject();
}

unsigned char **sub_10001C25C(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_10001C21C(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_10001C264()
{
  return swift_deallocObject();
}

uint64_t sub_10001C290()
{
  return swift_deallocObject();
}

uint64_t sub_10001C2D0()
{
  return sub_10001B2F4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10001C2DC()
{
  return swift_deallocObject();
}

void *sub_10001C31C(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10001B31C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10001C328()
{
  return swift_deallocObject();
}

uint64_t sub_10001C354()
{
  return swift_deallocObject();
}

uint64_t sub_10001C380()
{
  return swift_deallocObject();
}

uint64_t sub_10001C3C0()
{
  return swift_deallocObject();
}

unint64_t sub_10001C400()
{
  uint64_t v2 = qword_100035FC8;
  if (!qword_100035FC8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100035FC8);
    return ObjCClassMetadata;
  }
  return v2;
}

void *type metadata accessor for AnalyticsSender()
{
  return &unk_100031DC0;
}

uint64_t sub_10001C47C()
{
  return 1;
}

size_t sub_10001C488(const void *a1)
{
  return malloc_size(a1);
}

uint64_t sub_10001C4B0()
{
  sub_100029AD0(".", 1uLL, 1);
  sub_10001C8FC();
  sub_100029DF0();
  sub_100012D00();
  uint64_t v4 = sub_1000102A0(&qword_100035928);
  uint64_t v5 = sub_1000102A0(&qword_100035FE8);
  unint64_t v0 = sub_10001D370();
  sub_10001C978((void (*)(char *, char *))sub_10001D2F8, 0, v4, v5, (uint64_t)&type metadata for Never, v0, (uint64_t)&protocol witness table for Never, v6);
  sub_100010678();
  sub_1000102A0(&qword_100035FF8);
  sub_10001D468();
  if ((sub_100029B10() & 1) != 0 && sub_100029BC0() <= 3)
  {
    sub_100029B20();
    sub_100029F80();
    void *v1 = 0;
    v1[1] = 0;
    v1[2] = 0;
    sub_10001D2B4();
    sub_100029B90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000102A0(&qword_100036008);
    sub_10001D530();
    sub_100029CC0();
    sub_100029E10();
    sub_100029E10();
    sub_100029E10();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
}

unint64_t sub_10001C8FC()
{
  uint64_t v2 = qword_100035FE0;
  if (!qword_100035FE0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035FE0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001C978(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v55 = a3;
  uint64_t v45 = a4;
  uint64_t v32 = a5;
  uint64_t v54 = a6;
  uint64_t v34 = a8;
  uint64_t v35 = "Fatal error";
  id v36 = "Index out of bounds";
  uint64_t v37 = "Swift/Collection.swift";
  uint64_t v38 = "Range requires lowerBound <= upperBound";
  uint64_t v39 = "Swift/Range.swift";
  uint64_t v40 = "Index out of range";
  uint64_t v70 = a3;
  uint64_t v69 = a4;
  uint64_t v68 = a5;
  uint64_t v41 = *(void *)(a5 - 8);
  uint64_t v42 = a5 - 8;
  unint64_t v43 = (*(void *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(a1);
  uint64_t v44 = (char *)&v15 - v43;
  uint64_t v46 = 0;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v48 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v49 = AssociatedTypeWitness - 8;
  unint64_t v50 = (*(void *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = __chkstk_darwin(v46);
  unint64_t v51 = (char *)&v15 - v50;
  unint64_t v52 = (*(void *)(*(void *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  uint64_t v53 = (char *)&v15 - v52;
  uint64_t v56 = swift_getAssociatedTypeWitness();
  uint64_t v57 = *(void *)(v56 - 8);
  uint64_t v58 = v56 - 8;
  unint64_t v59 = (*(void *)(v57 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = __chkstk_darwin(v55);
  uint64_t v60 = (char *)&v15 - v59;
  unint64_t v61 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  unint64_t v62 = (char *)&v15 - v61;
  Swift::Int v63 = sub_100029C90();
  if (v63)
  {
    uint64_t v67 = sub_100029EA0();
    uint64_t v29 = sub_100029EB0();
    sub_100029E80(v63);
    uint64_t result = sub_100029C80();
    if (v63 >= 0)
    {
      uint64_t v27 = 0;
      for (uint64_t i = v33; ; uint64_t i = v18)
      {
        uint64_t v25 = i;
        uint64_t v26 = v27;
        if (v27 == v63) {
          goto LABEL_17;
        }
        if (v26 < 0 || v26 >= v63) {
          goto LABEL_16;
        }
        uint64_t v65 = v26;
        if (v63 < 0) {
          goto LABEL_15;
        }
        if (v26 >= v63) {
          break;
        }
        uint64_t v24 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
          return result;
        }
        char v66 = 0;
        uint64_t v23 = v24;
LABEL_18:
        uint64_t v22 = v23;
        if (v66)
        {
          (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v60, v62, v56);
          sub_100029E30();
          (*(void (**)(char *, uint64_t))(v57 + 8))(v60, v56);
          uint64_t v19 = v67;
          swift_retain();
          swift_release();
          uint64_t v20 = v19;
          uint64_t v21 = v25;
          return v20;
        }
        uint64_t v17 = &v64;
        int64_t v16 = (void (*)(void))sub_100029CF0();
        (*(void (**)(char *))(v48 + 16))(v51);
        v16();
        uint64_t v14 = v25;
        v30(v51, v44);
        uint64_t v18 = v14;
        if (v14)
        {
          (*(void (**)(char *, uint64_t))(v48 + 8))(v51, AssociatedTypeWitness);
          (*(void (**)(char *, uint64_t))(v57 + 8))(v62, v56);
          sub_100012014();
          (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v34, v44, v32);
          return v15;
        }
        (*(void (**)(char *, uint64_t))(v48 + 8))(v51, AssociatedTypeWitness);
        sub_100029E90();
        sub_100029CA0();
        uint64_t result = v18;
        uint64_t v27 = v22;
      }
      sub_100029EE0();
      __break(1u);
LABEL_15:
      sub_100029EE0();
      __break(1u);
LABEL_16:
      sub_100029EF0();
      __break(1u);
LABEL_17:
      uint64_t v65 = 0;
      char v66 = 1;
      uint64_t v23 = v26;
      goto LABEL_18;
    }
    sub_100029EE0();
    __break(1u);
  }
  uint64_t v20 = sub_100029BA0();
  uint64_t v21 = v33;
  return v20;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10001D2B4()
{
}

uint64_t sub_10001D2F8()
{
  return sub_100029ED0();
}

unint64_t sub_10001D370()
{
  uint64_t v2 = qword_100035FF0;
  if (!qword_100035FF0)
  {
    sub_100010600(&qword_100035928);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100035FF0);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_10001D3F4(uint64_t a1)
{
  return (*(unsigned char *)(a1 + 8) & 1) == 0;
}

unint64_t sub_10001D468()
{
  uint64_t v2 = qword_100036000;
  if (!qword_100036000)
  {
    sub_100010600(&qword_100035FF8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036000);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001D4EC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 8) & 1;
  *(void *)a2 = *(void *)result;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

unint64_t sub_10001D530()
{
  uint64_t v2 = qword_100036010;
  if (!qword_100036010)
  {
    sub_100010600(&qword_100036008);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036010);
    return WitnessTable;
  }
  return v2;
}

BOOL static NSOperatingSystemVersion.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v8 = a1 == a4 && a2 == a5;
  return v8 && a3 == a6;
}

BOOL static NSOperatingSystemVersion.< infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 >= a4)
  {
    if (a4 >= a1) {
      return a2 < a5 || a5 >= a2 && a3 < a6;
    }
    else {
      return 0;
    }
  }
  else
  {
    return 1;
  }
}

unint64_t sub_10001D7A4()
{
  return sub_10001D7BC();
}

unint64_t sub_10001D7BC()
{
  uint64_t v2 = qword_100036018;
  if (!qword_100036018)
  {
    type metadata accessor for OperatingSystemVersion();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036018);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_10001D840(uint64_t *a1, uint64_t *a2)
{
  return static NSOperatingSystemVersion.< infix(_:_:)(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

BOOL sub_10001D87C(uint64_t *a1, uint64_t *a2)
{
  return static NSOperatingSystemVersion.== infix(_:_:)(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

unint64_t sub_10001D8B8()
{
  uint64_t v2 = qword_100036020;
  if (!qword_100036020)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036020);
    return WitnessTable;
  }
  return v2;
}

id sub_10001D934()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_100020100();
}

id sub_10001D98C()
{
  sub_100013690();
  sub_100029AD0("com.apple.SoundScapes", 0x15uLL, 1);
  sub_100029AD0("SSSoundScapeExtension", 0x15uLL, 1);
  id result = sub_10001D934();
  qword_100036030 = (uint64_t)result;
  return result;
}

uint64_t *sub_10001DA20()
{
  if (qword_1000357F0 != -1) {
    swift_once();
  }
  return &qword_100036030;
}

void sub_10001DA84(unsigned int a1)
{
  id v4 = (id)*sub_10001DA20();
  id v1 = v4;
  swift_bridgeObjectRetain();
  NSString v3 = sub_100029A70();
  swift_bridgeObjectRelease();
  [v4 ulog:a1 message:v3];
}

uint64_t sub_10001DB20()
{
  uint64_t result = sub_100029AD0("com.apple.soundscapes.picker", 0x1CuLL, 1);
  qword_100037228 = result;
  qword_100037230 = v1;
  return result;
}

uint64_t *sub_10001DB64()
{
  if (qword_1000357F8 != -1) {
    swift_once();
  }
  return &qword_100037228;
}

void *sub_10001DBC8()
{
  return sub_10001DC04();
}

void *sub_10001DC04()
{
  type metadata accessor for SoundScapesDataSource();
  id v0 = sub_10000F3D0();
  uint64_t result = v2;
  v2[2] = v0;
  v2[3] = 0;
  v2[4] = 0;
  v2[5] = 0;
  return result;
}

uint64_t sub_10001DC5C()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  swift_retain();
  swift_endAccess();
  return v2;
}

uint64_t sub_10001DCAC(uint64_t a1)
{
  swift_retain();
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*sub_10001DD0C())()
{
  return sub_10001571C;
}

uint64_t sub_10001DD68()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 32);
  swift_retain();
  swift_endAccess();
  return v2;
}

uint64_t sub_10001DDB8(uint64_t a1)
{
  swift_retain();
  swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*sub_10001DE18())()
{
  return sub_10001571C;
}

void *sub_10001DE74()
{
  swift_beginAccess();
  NSString v3 = *(void **)(v0 + 40);
  id v1 = v3;
  swift_endAccess();
  return v3;
}

void sub_10001DEC4(void *a1)
{
  id v2 = a1;
  swift_beginAccess();
  NSString v3 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = a1;

  swift_endAccess();
}

uint64_t (*sub_10001DF24())()
{
  return sub_10001571C;
}

uint64_t sub_10001DF80()
{
  id v2 = (id)_EXSceneRoleDefault;
  id v0 = _EXSceneRoleDefault;
  sub_10001E050(v2);

  swift_retain();
  swift_retain();
  sub_1000102A0(&qword_100036038);
  sub_10001EB50();
  return sub_100029530();
}

uint64_t sub_10001E050(void *a1)
{
  id v1 = a1;
  uint64_t v4 = sub_100029A80();

  return v4;
}

id *sub_10001E0A0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  v18[4] = a1;
  v17[0] = sub_100020F4C();
  v17[1] = v2;
  id v8 = (id)a1[2];
  id v3 = v8;
  type metadata accessor for SoundScapesDataSource();
  sub_10001EBF4();
  sub_100020038();
  sub_1000297E0();

  sub_100010C8C(v17);
  v16[0] = v17[2];
  v16[1] = v17[3];
  v16[2] = v17[4];
  v16[3] = v17[5];
  uint64_t v14 = sub_1000102A0(&qword_100036038);
  sub_10001EB50();
  sub_10002106C((uint64_t)v16, v14, (uint64_t)v18);
  sub_1000200BC(v16);
  id v9 = v18[0];
  id v10 = v18[1];
  id v11 = v18[2];
  id v12 = v18[3];
  id v4 = v18[0];
  swift_retain();
  id v5 = v12;
  v15[0] = v9;
  v15[1] = v10;
  v15[2] = v11;
  v15[3] = v12;
  sub_10002106C((uint64_t)v15, v14, a2);
  sub_1000200BC(v15);
  return sub_1000200BC(v18);
}

id *sub_10001E220@<X0>(uint64_t a1@<X8>)
{
  return sub_10001E0A0(v1, a1);
}

uint64_t sub_10001E228(void *a1, void *a2)
{
  id v96 = a1;
  uint64_t v85 = a2;
  uint64_t v86 = 16;
  uint64_t v78 = sub_10001FE88;
  id v79 = sub_10001FF14;
  uint64_t v120 = 0;
  uint64_t v119 = 0;
  id v103 = 0;
  uint64_t v80 = sub_1000102A0(&qword_1000358A0);
  uint64_t v81 = *(void *)(v80 - 8);
  uint64_t v82 = v80 - 8;
  unint64_t v83 = (*(void *)(v81 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v80);
  uint64_t v84 = (char *)&object - v83;
  uint64_t v87 = sub_1000102A0(&qword_100036190);
  uint64_t v88 = *(void *)(v87 - 8);
  uint64_t v89 = v87 - 8;
  unint64_t v90 = (*(void *)(v88 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v96);
  uint64_t v91 = (char *)&object - v90;
  uint64_t v120 = v2;
  uint64_t v119 = v3;
  uint64_t v92 = sub_100029AD0("Start connection", v4, 1);
  uint64_t v93 = v5;
  sub_10001DA84(0x28u);
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_10001DB64();
  uint64_t v94 = *v6;
  uint64_t v95 = v6[1];
  swift_bridgeObjectRetain();
  id v97 = sub_100029A70();
  swift_bridgeObjectRelease();
  id v98 = [v96 valueForEntitlement:v97];

  if (v98)
  {
    id v77 = v98;
    id v76 = v98;
    uint64_t v75 = v99;
    sub_100029E00();
    sub_100007A80((uint64_t)v75, (uint64_t)&v114);
    swift_unknownObjectRelease();
  }
  else
  {
    long long v114 = 0uLL;
    uint64_t v115 = 0;
    uint64_t v116 = 0;
  }
  sub_10001FD7C(&v114, &v117);
  if (v118)
  {
    sub_1000103B8();
    if (swift_dynamicCast()) {
      int v72 = (void *)v99[4];
    }
    else {
      int v72 = 0;
    }
    uint64_t v74 = v72;
  }
  else
  {
    uint64_t v73 = 0;
    sub_1000073A4((uint64_t)&v117);
    uint64_t v74 = v73;
  }
  id v71 = v74;
  if (v74)
  {
    id v70 = v71;
    id v69 = v71;
    id v103 = v71;
    if ([v71 BOOLValue])
    {
      id v49 = (id)v85[2];
      id v7 = v49;
      sub_10000A518();

      id v50 = (id)v85[2];
      id v8 = v50;
      [v96 setExportedObject:v50];
      swift_unknownObjectRelease();
      unint64_t v52 = sub_10001FDE0();
      unint64_t v51 = &OBJC_PROTOCOL___SSURemoteViewServiceProtocol;
      id v9 = &OBJC_PROTOCOL___SSURemoteViewServiceProtocol;
      id v53 = sub_10001ECF4(v51);
      objc_msgSend(v96, "setExportedInterface:");

      uint64_t v54 = &OBJC_PROTOCOL___SSUViewServiceHostProtocol;
      id v10 = &OBJC_PROTOCOL___SSUViewServiceHostProtocol;
      id v55 = sub_10001ECF4(v54);
      objc_msgSend(v96, "setRemoteObjectInterface:");

      id v11 = v96;
      id v12 = v96;
      uint64_t v56 = &v102;
      uint64_t v64 = 33;
      uint64_t v65 = 0;
      swift_beginAccess();
      char v13 = (void *)v85[5];
      v85[5] = v96;

      swift_endAccess();
      id v57 = (id)v85[2];
      id v14 = v57;
      sub_1000084E8();

      uint64_t v60 = swift_allocObject();
      uint64_t v58 = v60 + 16;
      swift_retain();
      unint64_t v59 = v85;
      swift_weakInit();
      swift_release();
      swift_retain();
      swift_release();
      sub_10001FE90();
      uint64_t v62 = sub_100029630();
      swift_release();
      (*(void (**)(char *, uint64_t))(v88 + 8))(v91, v87);
      swift_retain();
      unint64_t v61 = &v101;
      swift_beginAccess();
      v85[3] = v62;
      swift_release();
      swift_endAccess();
      swift_release();
      id v63 = (id)v85[2];
      id v15 = v63;
      sub_100008B08();

      swift_retain();
      sub_10001FF1C();
      uint64_t v67 = sub_100029630();
      swift_release();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v84, v80);
      swift_retain();
      char v66 = &v100;
      swift_beginAccess();
      v85[4] = v67;
      swift_release();
      swift_endAccess();
      swift_release();
      [v96 resume];

      int v68 = 1;
      return v68 & 1;
    }
  }
  int64_t v16 = sub_10001DB64();
  uint64_t v45 = *v16;
  uint64_t v46 = v16[1];
  swift_bridgeObjectRetain();
  id v47 = sub_100029A70();
  swift_bridgeObjectRelease();
  id v48 = [v96 valueForEntitlement:v47];

  if (v48)
  {
    id v44 = v48;
    id v43 = v48;
    uint64_t v42 = &v104;
    sub_100029E00();
    sub_100007A80((uint64_t)v42, (uint64_t)&v110);
    swift_unknownObjectRelease();
  }
  else
  {
    long long v110 = 0uLL;
    uint64_t v111 = 0;
    uint64_t v112 = 0;
  }
  uint64_t v41 = v113;
  sub_10001FD7C(&v110, v113);
  uint64_t v17 = sub_100029F70();
  id v36 = &v108;
  uint64_t v108 = v17;
  uint64_t v109 = v18;
  int v34 = 1;
  v121._countAndFlagsBits = sub_100029AD0("Unexpect entitlement ", 0x15uLL, 1);
  object = v121._object;
  sub_100029F60(v121);
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_10001DB64();
  uint64_t v25 = *v19;
  uint64_t v26 = v19[1];
  swift_bridgeObjectRetain();
  uint64_t v27 = v107;
  v107[0] = v25;
  v107[1] = v26;
  uint64_t v32 = &type metadata for String;
  uint64_t v30 = &protocol witness table for String;
  uint64_t v31 = &protocol witness table for String;
  sub_100029F50();
  sub_100012D00();
  v122._countAndFlagsBits = sub_100029AD0(" with value ", 0xCuLL, v34 & 1);
  uint64_t v28 = v122._object;
  sub_100029F60(v122);
  swift_bridgeObjectRelease();
  uint64_t v29 = v106;
  sub_100007B78((uint64_t)v41, (uint64_t)v106);
  sub_1000102A0(&qword_100036198);
  uint64_t v20 = sub_100029A90();
  uint64_t v33 = v105;
  v105[0] = v20;
  v105[1] = v21;
  sub_100029F50();
  sub_100012D00();
  v123._countAndFlagsBits = sub_100029AD0("", 0, v34 & 1);
  uint64_t v35 = v123._object;
  sub_100029F60(v123);
  swift_bridgeObjectRelease();
  uint64_t v38 = v108;
  uint64_t v37 = v109;
  swift_bridgeObjectRetain();
  sub_100012D00();
  uint64_t v39 = sub_100029AB0();
  uint64_t v40 = v22;
  sub_10001DA84(0x5Au);
  swift_bridgeObjectRelease();
  sub_1000073A4((uint64_t)v41);
  int v68 = 0;
  return v68 & 1;
}

uint64_t sub_10001EB48(void *a1)
{
  return sub_10001E228(a1, v1);
}

unint64_t sub_10001EB50()
{
  uint64_t v2 = qword_100036040;
  if (!qword_100036040)
  {
    sub_100010600(&qword_100036038);
    sub_10001EBF4();
    sub_10001EC70();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036040);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001EBF4()
{
  uint64_t v2 = qword_100036048;
  if (!qword_100036048)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036048);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001EC70()
{
  uint64_t v2 = qword_100036050;
  if (!qword_100036050)
  {
    sub_100010600(&qword_100036058);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036050);
    return WitnessTable;
  }
  return v2;
}

id sub_10001ECF4(void *a1)
{
  id v3 = [(id)swift_getObjCClassFromMetadata() interfaceWithProtocol:a1];

  return v3;
}

uint64_t sub_10001ED48(uint64_t a1, uint64_t a2)
{
  uint64_t v71 = a1;
  uint64_t v69 = a2;
  uint64_t v97 = 0;
  uint64_t v96 = 0;
  uint64_t v94 = 0;
  uint64_t v89 = 0;
  uint64_t v88 = 0;
  uint64_t v70 = 0;
  uint64_t v68 = 0;
  uint64_t v87 = 0;
  uint64_t v82 = 0;
  unint64_t v72 = (*(void *)(*(void *)(sub_1000102A0(&qword_100035C58) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v73 = (char *)v17 - v72;
  uint64_t v74 = *(void *)__chkstk_darwin(v71);
  uint64_t v97 = v74;
  uint64_t v75 = v2 + 16;
  uint64_t v96 = v2 + 16;
  id v76 = &v95;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_endAccess();
  if (!Strong) {
    goto LABEL_26;
  }
  uint64_t v67 = Strong;
  uint64_t v64 = Strong;
  uint64_t v94 = Strong;
  uint64_t v65 = &v90;
  swift_beginAccess();
  id v66 = *(id *)(v64 + 40);
  id v3 = v66;
  swift_endAccess();
  id v91 = v66;
  if (v66)
  {
    unint64_t v61 = &v91;
    id v62 = v91;
    id v4 = v91;
    sub_100010C8C(v61);
    id v63 = [v62 remoteObjectProxy];
    sub_100029E00();

    swift_unknownObjectRelease();
  }
  else
  {
    sub_100010C8C(&v91);
    memset(v92, 0, sizeof(v92));
    uint64_t v93 = 0;
  }
  if (v93)
  {
    sub_1000102A0((uint64_t *)&unk_1000361C0);
    if (swift_dynamicCast()) {
      uint64_t v58 = v78;
    }
    else {
      uint64_t v58 = 0;
    }
    uint64_t v60 = v58;
  }
  else
  {
    unint64_t v59 = 0;
    sub_1000073A4((uint64_t)v92);
    uint64_t v60 = v59;
  }
  id v57 = v60;
  if (!v60)
  {
    swift_release();
LABEL_26:
    uint64_t v28 = sub_100029AD0("Try to send result, but can't find the extension", 0x30uLL, 1);
    uint64_t v29 = v11;
    sub_10001DA84(0x5Au);
    return swift_bridgeObjectRelease();
  }
  uint64_t v56 = v57;
  id v55 = v57;
  uint64_t v89 = v57;
  swift_retain();
  if (v74)
  {
    uint64_t v54 = v74;
    uint64_t v5 = v68;
    uint64_t v51 = v74;
    uint64_t v88 = v74;
    unint64_t v52 = (void *)sub_100016140();
    uint64_t v53 = v5;
    if (v5)
    {
      uint64_t v27 = v53;
      swift_errorRetain();
      uint64_t v87 = v27;
      uint64_t v12 = sub_100029F70();
      uint64_t v21 = &v85;
      uint64_t v85 = v12;
      uint64_t v86 = v13;
      int v19 = 1;
      v99._countAndFlagsBits = sub_100029AD0("Fail to convert soundscapes ", 0x1CuLL, 1);
      v17[0] = v99._object;
      sub_100029F60(v99);
      swift_bridgeObjectRelease();
      v17[1] = &v84;
      uint64_t v84 = v51;
      Builtin::Word v18 = 0;
      type metadata accessor for SoundScapesOption();
      sub_100029F30();
      v100._countAndFlagsBits = sub_100029AD0(" to playback archive ", 0x15uLL, v19 & 1);
      v17[2] = v100._object;
      sub_100029F60(v100);
      swift_bridgeObjectRelease();
      swift_getErrorValue();
      uint64_t v14 = sub_100029FA0();
      v17[3] = v83;
      v83[0] = v14;
      v83[1] = v15;
      sub_100029F50();
      sub_100012D00();
      v101._countAndFlagsBits = sub_100029AD0("", v18, v19 & 1);
      object = v101._object;
      sub_100029F60(v101);
      swift_bridgeObjectRelease();
      uint64_t v23 = v85;
      uint64_t v22 = v86;
      swift_bridgeObjectRetain();
      sub_100012D00();
      uint64_t v24 = sub_100029AB0();
      uint64_t v25 = v16;
      sub_10001DA84(0x5Au);
      swift_bridgeObjectRelease();
      swift_getObjectType();
      swift_errorRetain();
      id v26 = (id)sub_100029470();
      swift_errorRelease();
      [v55 selectedSoundScapes:0 withError:v26];

      swift_errorRelease();
      swift_errorRelease();
    }
    else
    {
      id v36 = v52;
      uint64_t v82 = v52;
      swift_getObjectType();
      id v6 = v36;
      uint64_t v44 = 0;
      objc_msgSend(v55, "selectedSoundScapes:withError:", v36);

      unsigned int v47 = 1;
      uint64_t v37 = sub_100029AD0("Sent the soundscapes to the extension", 0x25uLL, 1);
      uint64_t v38 = v7;
      sub_10001DA84(0x28u);
      swift_bridgeObjectRelease();
      uint64_t v39 = sub_1000158E4();
      uint64_t v40 = v8;
      uint64_t v41 = &v81;
      uint64_t v43 = 32;
      swift_beginAccess();
      uint64_t v42 = *(void *)(v51 + 48);
      swift_endAccess();
      uint64_t v45 = (const void *)(v51 + OBJC_IVAR____TtC23SoundScapesViewServices17SoundScapesOption_timePreviewLastPlayed);
      uint64_t v46 = &v80;
      swift_beginAccess();
      sub_100017EEC(v45, v73);
      swift_endAccess();
      uint64_t v48 = sub_100029520();
      uint64_t v49 = *(void *)(v48 - 8);
      uint64_t v50 = v48 - 8;
      if ((*(unsigned int (**)(char *, void))(v49 + 48))(v73, v47) == 1)
      {
        uint64_t v33 = 0;
        sub_100018244((uint64_t)v73);
        uint64_t v34 = v33;
        int v35 = 1;
      }
      else
      {
        sub_100029500();
        uint64_t v32 = v9;
        (*(void (**)(char *, uint64_t))(v49 + 8))(v73, v48);
        uint64_t v34 = v32;
        int v35 = 0;
      }
      uint64_t v31 = v98;
      sub_10002018C(1, 0, v39, v40, v42, 0, v34, v35 & 1, (uint64_t)v98);
      sub_10001FFA0();
      uint64_t v30 = v79;
      v79[3] = &unk_100031EA8;
      v79[4] = &off_100031ED0;
      v79[0] = swift_allocObject();
      memcpy((void *)(v79[0] + 16), v31, 0x31uLL);
      sub_10001A060(v30);
      sub_1000073E8((uint64_t)v30);
      sub_10002000C();
    }
    swift_release();
  }
  swift_unknownObjectRelease();
  return swift_release();
}

unsigned char *sub_10001F558(unsigned char *a1, uint64_t a2)
{
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  char v10 = *a1;
  uint64_t v17 = a1;
  uint64_t v16 = a2;
  sub_100029AD0("Dismiss the picker", 0x12uLL, 1);
  sub_10001DA84(0x28u);
  swift_bridgeObjectRelease();
  sub_10002018C(0, 1, 0, 0, 0, 1, 0, 1, (uint64_t)v18);
  sub_10001FFA0();
  v15[3] = &unk_100031EA8;
  id v15[4] = &off_100031ED0;
  v15[0] = swift_allocObject();
  memcpy((void *)(v15[0] + 16), v18, 0x31uLL);
  sub_10001A060(v15);
  sub_1000073E8((uint64_t)v15);
  if ((v10 & 1) == 0) {
    goto LABEL_13;
  }
  swift_beginAccess();
  uint64_t v8 = *(void **)(a2 + 40);
  id v2 = v8;
  swift_endAccess();
  id v12 = v8;
  if (v8)
  {
    id v7 = v12;
    id v3 = v12;
    sub_100010C8C(&v12);
    [v7 remoteObjectProxy];
    sub_100029E00();

    swift_unknownObjectRelease();
  }
  else
  {
    sub_100010C8C(&v12);
    memset(v13, 0, sizeof(v13));
    uint64_t v14 = 0;
  }
  if (v14)
  {
    sub_1000102A0((uint64_t *)&unk_1000361C0);
    uint64_t v5 = (swift_dynamicCast() & 1) != 0 ? (void *)v11 : 0;
    id v6 = v5;
  }
  else
  {
    sub_1000073A4((uint64_t)v13);
    id v6 = 0;
  }
  if (v6)
  {
    swift_getObjectType();
    [v6 requestDismiss];
    sub_100029AD0("Sent dismiss message to the extension", 0x25uLL, 1);
    sub_10001DA84(0x28u);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
LABEL_13:
    sub_100029AD0("Fail to send the message to the extension", 0x29uLL, 1);
    sub_10001DA84(0x5Au);
    swift_bridgeObjectRelease();
  }
  uint64_t result = v18;
  sub_10002000C();
  return result;
}

uint64_t sub_10001F8B4()
{
  return 0;
}

uint64_t sub_10001F8D0()
{
  return sub_10001F8B4() & 1;
}

uint64_t sub_10001F8EC()
{
  uint64_t v0 = swift_retain();
  nullsub_1(v0);
  sub_100029540();
  sub_10001F9D0();
  return sub_100029560();
}

uint64_t sub_10001F9A4()
{
  return sub_10001DF80();
}

uint64_t sub_10001F9C8()
{
  return sub_10001F9A4();
}

unint64_t sub_10001F9D0()
{
  uint64_t v2 = qword_100036060;
  if (!qword_100036060)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036060);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10001FA50()
{
  return sub_100029570();
}

uint64_t sub_10001FAD0()
{
  sub_100012014();
  sub_100012014();
  sub_100010C8C((id *)(v0 + 40));
  return v2;
}

uint64_t sub_10001FB20()
{
  return swift_deallocClassInstance();
}

uint64_t sub_10001FB60()
{
  return sub_10001F8EC();
}

void *sub_10001FB84@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10001DBC8();
  *a1 = result;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for SoundScapesPickerExtension()
{
  return self;
}

void *type metadata accessor for SoundScapesPickerExtension.AlwaysFailConfiguration()
{
  return &unk_100031DE0;
}

void *sub_10001FC50()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

unint64_t sub_10001FC5C()
{
  return sub_10001FC74();
}

unint64_t sub_10001FC74()
{
  uint64_t v2 = qword_100036178;
  if (!qword_100036178)
  {
    sub_100029550();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036178);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10001FCF8()
{
  uint64_t v2 = qword_100036180;
  if (!qword_100036180)
  {
    type metadata accessor for SoundScapesPickerExtension();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036180);
    return WitnessTable;
  }
  return v2;
}

_OWORD *sub_10001FD7C(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  a2[1] = a1[1];
  return a2;
}

unint64_t sub_10001FDE0()
{
  uint64_t v2 = qword_1000361A0;
  if (!qword_1000361A0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1000361A0);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_10001FE48()
{
  return swift_deallocObject();
}

uint64_t sub_10001FE88(uint64_t a1)
{
  return sub_10001ED48(a1, v1);
}

unint64_t sub_10001FE90()
{
  uint64_t v2 = qword_1000361A8;
  if (!qword_1000361A8)
  {
    sub_100010600(&qword_100036190);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000361A8);
    return WitnessTable;
  }
  return v2;
}

unsigned char *sub_10001FF14(unsigned char *a1)
{
  return sub_10001F558(a1, v1);
}

unint64_t sub_10001FF1C()
{
  uint64_t v2 = qword_1000361B0;
  if (!qword_1000361B0)
  {
    sub_100010600(&qword_1000358A0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000361B0);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10001FFA0()
{
}

uint64_t sub_10001FFCC()
{
  return swift_deallocObject();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10002000C()
{
}

unint64_t sub_100020038()
{
  uint64_t v2 = qword_1000361D0;
  if (!qword_1000361D0)
  {
    type metadata accessor for SoundScapesDataSource();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000361D0);
    return WitnessTable;
  }
  return v2;
}

id *sub_1000200BC(id *a1)
{
  swift_release();
  return a1;
}

id sub_100020100()
{
  NSString v3 = sub_100029A70();
  NSString v2 = sub_100029A70();
  id v4 = objc_msgSend(v1, "initWithSubsystem:category:", v3);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10002018C@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>)
{
  *(unsigned char *)a9 = result & 1;
  *(unsigned char *)(a9 + 1) = a2 & 1;
  *(void *)(a9 + 8) = a3;
  *(void *)(a9 + 16) = a4;
  *(void *)(a9 + 24) = a5;
  *(unsigned char *)(a9 + 32) = a6 & 1;
  *(void *)(a9 + 40) = a7;
  *(unsigned char *)(a9 + 48) = a8 & 1;
  return result;
}

uint64_t sub_1000201D0()
{
  uint64_t result = sub_100029AD0("Selected", 8uLL, 1);
  qword_1000361D8 = result;
  qword_1000361E0 = v1;
  return result;
}

uint64_t *sub_100020214()
{
  if (qword_100035800 != -1) {
    swift_once();
  }
  return &qword_1000361D8;
}

uint64_t sub_100020278()
{
  uint64_t result = sub_100029AD0("Cancelled", 9uLL, 1);
  qword_1000361E8 = result;
  qword_1000361F0 = v1;
  return result;
}

uint64_t *sub_1000202BC()
{
  if (qword_100035808 != -1) {
    swift_once();
  }
  return &qword_1000361E8;
}

uint64_t sub_100020320()
{
  uint64_t result = sub_100029AD0("SoundScapesID", 0xDuLL, 1);
  qword_1000361F8 = result;
  qword_100036200 = v1;
  return result;
}

uint64_t *sub_100020364()
{
  if (qword_100035810 != -1) {
    swift_once();
  }
  return &qword_1000361F8;
}

uint64_t sub_1000203C8()
{
  uint64_t result = sub_100029AD0("PreviewPlayed", 0xDuLL, 1);
  qword_100036208 = result;
  qword_100036210 = v1;
  return result;
}

uint64_t *sub_10002040C()
{
  if (qword_100035818 != -1) {
    swift_once();
  }
  return &qword_100036208;
}

uint64_t sub_100020470()
{
  uint64_t result = sub_100029AD0("LastPreviewSince", 0x10uLL, 1);
  qword_100036218 = result;
  qword_100036220 = v1;
  return result;
}

uint64_t *sub_1000204B4()
{
  if (qword_100035820 != -1) {
    swift_once();
  }
  return &qword_100036218;
}

uint64_t sub_100020518()
{
  return sub_100029AD0("com.apple.SoundScapesPicker.Behavior", 0x24uLL, 1);
}

uint64_t sub_100020558()
{
  sub_1000102A0(&qword_100036228);
  sub_100029F80();
  sub_10001C400();
  uint64_t v2 = sub_100029A00();
  sub_100020214();
  swift_bridgeObjectRetain();
  sub_100029BE0();
  sub_1000102A0(&qword_100035F98);
  sub_100029A20();
  sub_1000202BC();
  swift_bridgeObjectRetain();
  sub_100029BE0();
  sub_100029A20();
  sub_100020364();
  swift_bridgeObjectRetain();
  sub_100020984((__n128 *)(v0 + 8), &v5);
  sub_100020998();
  sub_100020984(&v5, &v6);
  if (v6.n128_u64[1])
  {
    sub_100029A70();
    swift_bridgeObjectRelease();
  }
  sub_100029A20();
  sub_10002040C();
  swift_bridgeObjectRetain();
  sub_1000209C4(v0 + 24, (uint64_t)v4);
  sub_1000209C4((uint64_t)v4, (uint64_t)&v7);
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = v7;
    sub_100029C70();
  }
  sub_100029A20();
  sub_1000204B4();
  swift_bridgeObjectRetain();
  sub_1000209C4(v0 + 40, (uint64_t)v3);
  sub_1000209C4((uint64_t)v3, (uint64_t)&v10);
  if ((v11 & 1) == 0)
  {
    uint64_t v12 = v10;
    sub_100029C20();
  }
  sub_100029A20();
  swift_bridgeObjectRetain();
  sub_100010678();
  return v2;
}

__n128 sub_100020984(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100020998()
{
}

uint64_t sub_1000209C4(uint64_t a1, uint64_t a2)
{
  uint64_t result = a2;
  *(void *)a2 = *(void *)a1;
  *(unsigned char *)(a2 + 8) = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1000209E0()
{
  memcpy(__dst, v0, sizeof(__dst));
  return sub_100020518();
}

uint64_t sub_100020A20()
{
  memcpy(__dst, v0, sizeof(__dst));
  return sub_100020558();
}

uint64_t sub_100020A60()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100020A7C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return result;
}

uint64_t sub_100020AF4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2 & 1;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1) & 1;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100020B84(void *a1, const void *a2)
{
}

uint64_t sub_100020BB4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2 & 1;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1) & 1;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return result;
}

uint64_t sub_100020C38(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 49))
    {
      int v5 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      int v4 = -1;
      if (!HIDWORD(*(void *)(a1 + 16))) {
        int v4 = *(void *)(a1 + 16);
      }
      int v2 = v4 - 1;
      if (v4 - 1 < 0) {
        int v2 = -1;
      }
      int v5 = v2;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_100020D68(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = (unsigned char *)(result + 49);
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(unsigned char *)(result + 48) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *uint64_t v3 = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *uint64_t v3 = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

void *type metadata accessor for SoundScapesBehaviorAnalyticEvent()
{
  return &unk_100031EA8;
}

void *sub_100020F4C()
{
  id v6 = 0;
  uint64_t v7 = 0;
  type metadata accessor for SoundScapesDataSource();
  sub_100020038();
  int v5 = (void *)sub_100029680();
  uint64_t v4 = v0;
  id v1 = v5;
  id v6 = v5;
  uint64_t v7 = v4;
  sub_100021004();
  id v3 = [(id)swift_getObjCClassFromMetadata() appearance];
  [v3 setBounces:0];

  sub_100010C8C(&v6);
  return v5;
}

unint64_t sub_100021004()
{
  uint64_t v2 = qword_100036230;
  if (!qword_100036230)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100036230);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_10002106C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_1000210D0(void *a1)
{
  id v1 = a1;
  type metadata accessor for SoundScapesDataSource();
  sub_100020038();
  uint64_t v4 = sub_100029670();

  return v4;
}

uint64_t *sub_100021140@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v97 = &v206;
  uint64_t v98 = a3;
  v150 = a1;
  uint64_t v149 = a2;
  uint64_t v125 = 0;
  Swift::String v99 = &opaque type descriptor for <<opaque return type of View.progressViewStyle<A>(_:)>>;
  Swift::String v100 = sub_100023BA4;
  Swift::String v101 = &opaque type descriptor for <<opaque return type of View.listStyle<A>(_:)>>;
  uint64_t v102 = sub_100023DFC;
  v237 = 0;
  v236 = 0;
  v235 = 0;
  v233 = 0;
  uint64_t v234 = 0;
  long long v231 = 0u;
  long long v232 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  uint64_t v103 = sub_1000296E0();
  uint64_t v104 = *(void *)(v103 - 8);
  uint64_t v105 = v103 - 8;
  unint64_t v106 = (*(void *)(v104 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v103);
  char v107 = (char *)&v36 - v106;
  uint64_t v108 = sub_1000102A0(&qword_100036238);
  uint64_t v109 = *(void *)(v108 - 8);
  uint64_t v110 = v108 - 8;
  unint64_t v111 = (*(void *)(v109 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v108);
  uint64_t v112 = (char *)&v36 - v111;
  uint64_t v113 = sub_1000102A0(&qword_100036240);
  uint64_t v114 = *(void *)(v113 - 8);
  uint64_t v115 = v113 - 8;
  unint64_t v116 = (*(void *)(v114 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v113);
  uint64_t v117 = (uint64_t)&v36 - v116;
  unint64_t v118 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v36 - v116);
  uint64_t v119 = (uint64_t)&v36 - v118;
  unint64_t v120 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v36 - v118);
  uint64_t v121 = (uint64_t)&v36 - v120;
  v237 = (char *)&v36 - v120;
  uint64_t v122 = sub_1000102A0(&qword_100036248);
  unint64_t v123 = (*(void *)(*(void *)(v122 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v122);
  uint64_t v124 = (uint64_t)&v36 - v123;
  uint64_t v126 = sub_1000102A0(&qword_100036250);
  unint64_t v127 = (*(void *)(*(void *)(v126 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v125);
  uint64_t v128 = (uint64_t)&v36 - v127;
  uint64_t v129 = sub_100029660();
  uint64_t v130 = *(void *)(v129 - 8);
  uint64_t v131 = v129 - 8;
  unint64_t v132 = (*(void *)(v130 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v129);
  v133 = (char *)&v36 - v132;
  uint64_t v134 = sub_1000102A0(&qword_100036258);
  uint64_t v135 = *(void *)(v134 - 8);
  uint64_t v136 = v134 - 8;
  unint64_t v137 = (*(void *)(v135 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v134);
  v138 = (char *)&v36 - v137;
  uint64_t v139 = sub_1000102A0(&qword_100036260);
  uint64_t v140 = *(void *)(v139 - 8);
  uint64_t v141 = v139 - 8;
  unint64_t v142 = (*(void *)(v140 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v139);
  v143 = (char *)&v36 - v142;
  uint64_t v144 = sub_1000102A0(&qword_100036268);
  unint64_t v145 = (*(void *)(*(void *)(v144 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v144);
  uint64_t v146 = (uint64_t)&v36 - v145;
  unint64_t v147 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v36 - v145);
  uint64_t v148 = (uint64_t)&v36 - v147;
  v236 = (char *)&v36 - v147;
  uint64_t v151 = sub_1000102A0(&qword_100036270);
  unint64_t v152 = (*(void *)(*(void *)(v151 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v150);
  v153 = (char *)&v36 - v152;
  unint64_t v154 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  char v8 = (void *)__chkstk_darwin(v6);
  v155 = (char *)&v36 - v154;
  v235 = (char *)&v36 - v154;
  v233 = v8;
  uint64_t v234 = v9;
  id v156 = (id)sub_1000210D0(v8);
  int v157 = sub_100009540();

  uint64_t v158 = v157;
  switch((char)v157)
  {
    case 1:
      sub_100029AD0("LOADING", 7uLL, 1);
      sub_1000296A0();
      sub_100029640();
      sub_100022CCC();
      unint64_t v62 = sub_100022F74();
      unint64_t v63 = sub_100022FF8();
      sub_100029780();
      (*(void (**)(char *, uint64_t))(v104 + 8))(v107, v103);
      (*(void (**)(char *, uint64_t))(v109 + 8))(v112, v108);
      v181[7] = v108;
      v181[8] = v103;
      v181[9] = v62;
      v181[10] = v63;
      uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
      sub_10002106C(v119, v113, v121);
      uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v114 + 8);
      uint64_t v67 = v114 + 8;
      v68(v119, v113);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v114 + 16))(v117, v121, v113);
      sub_10002106C(v117, v113, v119);
      v68(v117, v113);
      unint64_t v25 = sub_100022EF0();
      sub_100022CE4(v119, v122, v113, v25, OpaqueTypeConformance2, v128);
      v68(v119, v113);
      uint64_t v65 = sub_1000102A0(&qword_100036278);
      unint64_t v66 = sub_100022DDC();
      unint64_t v26 = sub_10002307C();
      sub_100022BD4(v128, v126, v65, v66, v26, (uint64_t)v153);
      sub_10002396C(v128);
      sub_1000231CC(v153, v155);
      v68(v121, v113);
      break;
    case 2:
      int v57 = 1;
      sub_100029AD0("ERROR", 5uLL, 1);
      sub_1000296A0();
      uint64_t v202 = 0;
      uint64_t v203 = 0;
      char v204 = 0;
      char v205 = v57 & 1;
      uint64_t v198 = sub_100029740();
      uint64_t v199 = v27;
      char v200 = v28;
      uint64_t v201 = v29;
      uint64_t v49 = v195;
      v195[0] = v198;
      v195[1] = v27;
      char v196 = v28 & 1 & v57;
      uint64_t v197 = v29;
      unint64_t v61 = &v206;
      uint64_t v54 = &type metadata for Text;
      id v55 = &protocol witness table for Text;
      sub_10002106C((uint64_t)v195, (uint64_t)&type metadata for Text, (uint64_t)&v206);
      sub_1000222E4((uint64_t)v49);
      long long v50 = v206;
      int v51 = v207;
      uint64_t v52 = *((void *)&v207 + 1);
      sub_100022370(v206, *((uint64_t *)&v206 + 1), v207 & 1);
      swift_bridgeObjectRetain();
      uint64_t v53 = &v187;
      long long v187 = v50;
      char v188 = v51 & 1 & v57;
      uint64_t v189 = v52;
      sub_10002106C((uint64_t)&v187, (uint64_t)v54, (uint64_t)v190);
      sub_1000222E4((uint64_t)v53);
      uint64_t v56 = v184;
      v184[0] = v190[0];
      v184[1] = v190[1];
      char v185 = v191 & 1 & v57;
      uint64_t v186 = v192;
      sub_100022BD4((uint64_t)v184, (uint64_t)v54, (uint64_t)v54, (uint64_t)v55, (uint64_t)v55, (uint64_t)v193);
      sub_1000222E4((uint64_t)v56);
      uint64_t v60 = v182;
      v182[0] = v193[0];
      v182[1] = v193[1];
      v182[2] = v193[2];
      v182[3] = v193[3];
      char v183 = v194 & 1 & v57;
      uint64_t v58 = sub_1000102A0(&qword_100036278);
      unint64_t v59 = sub_100022DDC();
      unint64_t v30 = sub_10002307C();
      sub_100022CE4((uint64_t)v60, v126, v58, v59, v30, (uint64_t)v153);
      sub_100023114(v60);
      sub_1000231CC(v153, v155);
      sub_1000222E4((uint64_t)v61);
      break;
    case 3:
      id v10 = [self separatorColor];
      uint64_t v11 = sub_100029860();
      uint64_t v71 = v175;
      v175[0] = v11;
      uint64_t v69 = &type metadata for Color;
      uint64_t v70 = &protocol witness table for Color;
      sub_1000223B4();
      int v72 = 1;
      sub_100029800();
      sub_100012014();
      uint64_t v73 = v169;
      v169[0] = v175[1];
      v169[1] = v175[2];
      char v170 = v176 & 1;
      uint64_t v171 = v177;
      char v172 = v178 & 1 & v72;
      uint64_t v173 = v179;
      uint64_t v174 = v180;
      uint64_t v86 = sub_1000102A0(&qword_1000362C8);
      unint64_t v87 = sub_100023AC8();
      uint64_t v96 = v181;
      sub_10002106C((uint64_t)v73, v86, (uint64_t)v181);
      sub_100012014();
      id v74 = (id)sub_1000210D0(v150);
      uint64_t v75 = sub_100008F2C();

      uint64_t v80 = &v168;
      uint64_t v168 = v75;
      id v12 = v150;
      uint64_t v81 = 32;
      uint64_t v82 = 7;
      uint64_t v13 = swift_allocObject();
      uint64_t v14 = v149;
      uint64_t v76 = v13;
      *(void *)(v13 + 16) = v150;
      *(void *)(v13 + 24) = v14;
      uint64_t v77 = sub_1000102A0(&qword_1000358A8);
      unint64_t v78 = sub_100023BB0();
      unint64_t v79 = sub_100023C34();
      sub_100023CB4();
      sub_10002272C((uint64_t)v80, (uint64_t)v100, v76, v77);
      sub_1000228FC();
      unint64_t v83 = sub_100023D38();
      uint64_t v84 = &protocol witness table for PlainListStyle;
      sub_100029840();
      (*(void (**)(char *, uint64_t))(v130 + 8))(v133, v129);
      (*(void (**)(char *, uint64_t))(v135 + 8))(v138, v134);
      id v15 = v150;
      uint64_t v16 = swift_allocObject();
      uint64_t v17 = v149;
      uint64_t v18 = v134;
      uint64_t v19 = v129;
      unint64_t v20 = v83;
      uint64_t v21 = v84;
      *(void *)(v16 + 16) = v150;
      *(void *)(v16 + 24) = v17;
      uint64_t v85 = v16;
      v167[2] = v18;
      v167[3] = v19;
      v167[4] = v20;
      v167[5] = v21;
      uint64_t v92 = 1;
      swift_getOpaqueTypeConformance2();
      sub_1000297A0();
      sub_100023E08((uint64_t)v102);
      (*(void (**)(char *, uint64_t))(v140 + 8))(v143, v139);
      unint64_t v88 = sub_100023E44();
      sub_10002106C(v146, v144, v148);
      sub_100023F50(v146);
      char v90 = v166;
      sub_100024030(v96, v166);
      uint64_t v89 = v167;
      v167[0] = v90;
      sub_100024088(v148, v146);
      v167[1] = v146;
      v165[0] = v86;
      v165[1] = v144;
      unint64_t v163 = v87;
      unint64_t v164 = v88;
      sub_100022964((uint64_t)v89, 2uLL, (uint64_t)v165, v124);
      sub_100023F50(v146);
      sub_100012014();
      unint64_t v93 = sub_100022EF0();
      unint64_t v91 = sub_100022F74();
      unint64_t v22 = sub_100022FF8();
      uint64_t v159 = v108;
      uint64_t v160 = v103;
      unint64_t v161 = v91;
      unint64_t v162 = v22;
      uint64_t v23 = swift_getOpaqueTypeConformance2();
      sub_100022BD4(v124, v122, v113, v93, v23, v128);
      sub_100024214(v124);
      uint64_t v94 = sub_1000102A0(&qword_100036278);
      unint64_t v95 = sub_100022DDC();
      unint64_t v24 = sub_10002307C();
      sub_100022BD4(v128, v126, v94, v95, v24, (uint64_t)v153);
      sub_10002396C(v128);
      sub_1000231CC(v153, v155);
      sub_100023F50(v148);
      sub_100012014();
      break;
    default:
      *(_DWORD *)&v44[1] = 1;
      sub_100029AD0("UNSUPPORTED", 0xBuLL, 1);
      sub_1000296A0();
      uint64_t v228 = 0;
      uint64_t v229 = 0;
      __int16 v230 = *(_WORD *)v44 & 0x100;
      uint64_t v224 = sub_100029740();
      uint64_t v225 = v31;
      char v226 = v32;
      uint64_t v227 = v33;
      id v36 = v221;
      v221[0] = v224;
      v221[1] = v31;
      char v222 = v32 & 1 & v44[1];
      uint64_t v223 = v33;
      uint64_t v48 = &v231;
      uint64_t v41 = &type metadata for Text;
      uint64_t v42 = &protocol witness table for Text;
      sub_10002106C((uint64_t)v221, (uint64_t)&type metadata for Text, (uint64_t)&v231);
      sub_1000222E4((uint64_t)v36);
      long long v37 = v231;
      int v38 = v232;
      uint64_t v39 = *((void *)&v232 + 1);
      sub_100022370(v231, *((uint64_t *)&v231 + 1), v232 & 1);
      swift_bridgeObjectRetain();
      uint64_t v40 = &v213;
      long long v213 = v37;
      char v214 = v38 & 1 & v44[1];
      uint64_t v215 = v39;
      sub_10002106C((uint64_t)&v213, (uint64_t)v41, (uint64_t)v216);
      sub_1000222E4((uint64_t)v40);
      uint64_t v43 = v210;
      v210[0] = v216[0];
      v210[1] = v216[1];
      char v211 = v217 & 1 & v44[1];
      uint64_t v212 = v218;
      sub_100022CE4((uint64_t)v210, (uint64_t)v41, (uint64_t)v41, (uint64_t)v42, (uint64_t)v42, (uint64_t)v219);
      sub_1000222E4((uint64_t)v43);
      unsigned int v47 = v208;
      v208[0] = v219[0];
      v208[1] = v219[1];
      v208[2] = v219[2];
      v208[3] = v219[3];
      char v209 = v220 & 1 & v44[1];
      uint64_t v45 = sub_1000102A0(&qword_100036278);
      unint64_t v46 = sub_100022DDC();
      unint64_t v34 = sub_10002307C();
      sub_100022CE4((uint64_t)v47, v126, v45, v46, v34, (uint64_t)v153);
      sub_100023114(v47);
      sub_1000231CC(v153, v155);
      sub_1000222E4((uint64_t)v48);
      break;
  }
  sub_1000233AC((uint64_t)v155, (uint64_t)v153);
  sub_10002371C();
  sub_10002106C((uint64_t)v153, v151, v98);
  sub_1000237C0((uint64_t *)v153);
  return sub_1000237C0((uint64_t *)v155);
}

uint64_t sub_1000222E4(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002232C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100022370(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1000223B4()
{
  return sub_100029940();
}

id *sub_1000223D8@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v28 = 0;
  unint64_t v26 = 0;
  uint64_t v27 = 0;
  memset(__b, 0, sizeof(__b));
  uint64_t v28 = *a1;
  uint64_t v13 = v28;
  unint64_t v26 = a2;
  uint64_t v27 = a3;
  swift_retain();
  id v4 = a2;
  swift_retain();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a2;
  v14[3] = a3;
  v14[4] = v13;
  uint64_t v11 = sub_100022680();
  uint64_t v12 = v5;
  sub_1000226B8();
  sub_1000226C0(v11, v12, v13, (uint64_t)sub_1000288F8, (uint64_t)v14, v29);
  memcpy(__dst, v29, sizeof(__dst));
  sub_100023C34();
  sub_10002106C((uint64_t)__dst, (uint64_t)&unk_100032070, (uint64_t)__b);
  sub_100028908(__dst);
  id v15 = __b[0];
  id v16 = __b[1];
  id v17 = __b[2];
  id v18 = __b[3];
  id v19 = __b[4];
  id v20 = __b[5];
  id v21 = __b[6];
  id v6 = __b[0];
  swift_retain();
  swift_retain();
  swift_retain();
  v23[0] = v15;
  v23[1] = v16;
  void v23[2] = v17;
  v23[3] = v18;
  void v23[4] = v19;
  v23[5] = v20;
  v23[6] = v21;
  sub_10002106C((uint64_t)v23, (uint64_t)&unk_100032070, a4);
  sub_100028908(v23);
  uint64_t result = __b;
  sub_100028908(__b);
  return result;
}

uint64_t sub_1000225E0(void *a1)
{
  id v2 = (id)sub_1000210D0(a1);
  swift_retain();
  sub_10000836C();

  id v4 = (id)sub_1000210D0(a1);
  swift_retain();
  sub_100009FBC();

  return sub_100017050();
}

uint64_t sub_100022680()
{
  return sub_100029680();
}

double sub_1000226B8()
{
  return 0.0;
}

uint64_t sub_1000226C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t result = sub_1000243F0();
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  a6[5] = v7;
  a6[6] = result;
  return result;
}

uint64_t sub_10002272C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a4 - 8) + 8))(a1);
}

uint64_t sub_1000228FC()
{
  return sub_100029650();
}

void sub_100022914(void *a1)
{
  id v1 = (id)sub_1000210D0(a1);
  sub_100009FBC();
}

uint64_t *sub_100022964@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a4;
  uint64_t v25 = a1;
  unint64_t v26 = a2;
  uint64_t v27 = a3;
  unint64_t v28 = a3 & 0xFFFFFFFFFFFFFFFELL;
  if (a2 == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(v27 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    id v19 = &v9;
    unint64_t v20 = (8 * v26 + 15) & 0xFFFFFFFFFFFFFFF0;
    __chkstk_darwin(&v9);
    id v21 = (char *)&v9 - v20;
    for (unint64_t i = v4; ; unint64_t i = v5 + 1)
    {
      unint64_t v18 = i;
      if (i >= v26) {
        break;
      }
      unint64_t v5 = v18;
      *(void *)&v21[8 * v18] = *(void *)((v27 & 0xFFFFFFFFFFFFFFFELL) + 8 * v18);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  uint64_t v14 = TupleTypeMetadata;
  uint64_t v6 = *(void *)(*(void *)(TupleTypeMetadata - 8) + 64);
  id v15 = &v9;
  unint64_t v16 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(&v9);
  id v17 = (char *)&v9 - v16;
  if (v7)
  {
    for (uint64_t j = 0; ; uint64_t j = v9)
    {
      uint64_t v11 = j;
      uint64_t v12 = *(void *)((v27 & 0xFFFFFFFFFFFFFFFELL) + 8 * j);
      int v10 = v26 == 1 ? 0 : *(_DWORD *)(v14 + 24 + 16 * v11 + 8);
      (*(void (**)(char *, void))(*(void *)(v12 - 8) + 16))(&v17[v10], *(void *)(v25 + 8 * v11));
      uint64_t v9 = v11 + 1;
      if (v11 + 1 == v26) {
        break;
      }
    }
  }
  sub_100029960();
  return v15;
}

uint64_t sub_100022BD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11 = a6;
  v8[1] = a1;
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  uint64_t v16 = a5;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  uint64_t v10 = sub_1000296B0();
  unint64_t v9 = (*(void *)(*(void *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v8 - v9;
  (*(void (**)(void))(*(void *)(v6 - 8) + 16))();
  swift_storeEnumTagMultiPayload();
  return sub_1000296C0();
}

uint64_t sub_100022CCC()
{
  return sub_1000296D0();
}

uint64_t sub_100022CE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11 = a6;
  v8[1] = a1;
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  uint64_t v16 = a5;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  uint64_t v10 = sub_1000296B0();
  unint64_t v9 = (*(void *)(*(void *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v8 - v9;
  (*(void (**)(void))(*(void *)(v6 - 8) + 16))();
  swift_storeEnumTagMultiPayload();
  return sub_1000296C0();
}

unint64_t sub_100022DDC()
{
  uint64_t v2 = qword_100036280;
  if (!qword_100036280)
  {
    sub_100010600(&qword_100036250);
    sub_100022EF0();
    sub_100010600(&qword_100036238);
    sub_1000296E0();
    sub_100022F74();
    sub_100022FF8();
    swift_getOpaqueTypeConformance2();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036280);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100022EF0()
{
  uint64_t v2 = qword_100036288;
  if (!qword_100036288)
  {
    sub_100010600(&qword_100036248);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036288);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100022F74()
{
  uint64_t v2 = qword_100036290;
  if (!qword_100036290)
  {
    sub_100010600(&qword_100036238);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036290);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100022FF8()
{
  uint64_t v2 = qword_100036298;
  if (!qword_100036298)
  {
    sub_1000296E0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036298);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10002307C()
{
  uint64_t v2 = qword_1000362A0;
  if (!qword_1000362A0)
  {
    sub_100010600(&qword_100036278);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000362A0);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_100023114(uint64_t *a1)
{
  return a1;
}

uint64_t sub_100023158(uint64_t a1, uint64_t a2, char a3)
{
  return swift_bridgeObjectRelease();
}

char *sub_1000231CC(char *a1, char *a2)
{
  uint64_t v13 = sub_1000102A0(&qword_1000362A8);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a2, a1, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    sub_1000102A0(&qword_1000362B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000102A0(&qword_100036240);
      (*(void (**)(char *, char *))(*(void *)(v7 - 8) + 32))(a2, a1);
    }
    else
    {
      memcpy(a2, a1, 0x38uLL);
      uint64_t v2 = sub_1000102A0(&qword_1000362B8);
      unint64_t v9 = &a2[*(int *)(v2 + 48)];
      uint64_t v10 = &a1[*(int *)(v2 + 48)];
      uint64_t v3 = sub_1000102A0(&qword_100036260);
      (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 32))(v9, v10);
      uint64_t v4 = sub_1000102A0(&qword_100036268);
      unint64_t v5 = &v9[*(int *)(v4 + 36)];
      uint64_t v6 = &v10[*(int *)(v4 + 36)];
      *(_OWORD *)unint64_t v5 = *(_OWORD *)v6;
      *((_OWORD *)v5 + 1) = *((_OWORD *)v6 + 1);
    }
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
  }
  return a2;
}

uint64_t sub_1000233AC(uint64_t a1, uint64_t a2)
{
  sub_1000102A0(&qword_1000362A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = *(void *)a1;
    uint64_t v8 = *(void *)(a1 + 8);
    uint64_t v9 = *(void *)(a1 + 16);
    uint64_t v10 = *(void *)(a1 + 24);
    char v11 = *(unsigned char *)(a1 + 32);
    sub_1000236A8(*(void *)a1, v8, v9);
    *(void *)a2 = v7;
    *(void *)(a2 + 8) = v8;
    *(void *)(a2 + 16) = v9;
    *(void *)(a2 + 24) = v10;
    *(unsigned char *)(a2 + 32) = v11 & 1;
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    sub_1000102A0(&qword_1000362B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_1000102A0(&qword_100036240);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t v16 = *(void *)a1;
      swift_retain();
      *(void *)a2 = v16;
      memcpy((void *)(a2 + 8), (const void *)(a1 + 8), 0x30uLL);
      uint64_t v2 = sub_1000102A0(&qword_1000362B8);
      uint64_t v17 = a2 + *(int *)(v2 + 48);
      uint64_t v18 = a1 + *(int *)(v2 + 48);
      uint64_t v3 = sub_1000102A0(&qword_100036260);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v17, v18);
      uint64_t v4 = sub_1000102A0(&qword_100036268);
      id v19 = (void *)(v17 + *(int *)(v4 + 36));
      unint64_t v20 = (void *)(v18 + *(int *)(v4 + 36));
      if (*v20)
      {
        uint64_t v14 = *v20;
        uint64_t v15 = v20[1];
        swift_retain();
        *id v19 = v14;
        v19[1] = v15;
      }
      else
      {
        *(_OWORD *)id v19 = *(_OWORD *)v20;
      }
      if (v20[2])
      {
        uint64_t v12 = v20[2];
        uint64_t v13 = v20[3];
        swift_retain();
        v19[2] = v12;
        v19[3] = v13;
      }
      else
      {
        *((_OWORD *)v19 + 1) = *((_OWORD *)v20 + 1);
      }
      swift_storeEnumTagMultiPayload();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a2;
}

uint64_t sub_1000236A8(uint64_t a1, uint64_t a2, char a3)
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_10002371C()
{
  uint64_t v2 = qword_1000362C0;
  if (!qword_1000362C0)
  {
    sub_100010600(&qword_100036270);
    sub_100022DDC();
    sub_10002307C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000362C0);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_1000237C0(uint64_t *a1)
{
  sub_1000102A0(&qword_1000362A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100023158(*a1, a1[1], a1[2]);
  }
  else
  {
    sub_1000102A0(&qword_1000362B0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v2 = sub_1000102A0(&qword_100036240);
      (*(void (**)(uint64_t *))(*(void *)(v2 - 8) + 8))(a1);
    }
    else
    {
      swift_release();
      uint64_t v4 = (char *)a1 + *(int *)(sub_1000102A0(&qword_1000362B8) + 48);
      uint64_t v1 = sub_1000102A0(&qword_100036260);
      (*(void (**)(char *))(*(void *)(v1 - 8) + 8))(v4);
      uint64_t v5 = &v4[*(int *)(sub_1000102A0(&qword_100036268) + 36)];
      if (*(void *)v5) {
        swift_release();
      }
      if (*((void *)v5 + 2)) {
        swift_release();
      }
    }
  }
  return a1;
}

uint64_t sub_10002396C(uint64_t a1)
{
  sub_1000102A0(&qword_1000362B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_1000102A0(&qword_100036240);
    (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
  else
  {
    swift_release();
    uint64_t v4 = a1 + *(int *)(sub_1000102A0(&qword_1000362B8) + 48);
    uint64_t v1 = sub_1000102A0(&qword_100036260);
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v4);
    uint64_t v5 = (void *)(v4 + *(int *)(sub_1000102A0(&qword_100036268) + 36));
    if (*v5) {
      swift_release();
    }
    if (v5[2]) {
      swift_release();
    }
  }
  return a1;
}

unint64_t sub_100023AC8()
{
  uint64_t v2 = qword_1000362D0;
  if (!qword_1000362D0)
  {
    sub_100010600(&qword_1000362C8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000362D0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100023B64()
{
  return swift_deallocObject();
}

id *sub_100023BA4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000223D8(a1, *(void **)(v2 + 16), *(void *)(v2 + 24), a2);
}

unint64_t sub_100023BB0()
{
  uint64_t v2 = qword_1000362D8;
  if (!qword_1000362D8)
  {
    sub_100010600(&qword_1000358A8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000362D8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100023C34()
{
  uint64_t v2 = qword_1000362E0;
  if (!qword_1000362E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000362E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100023CB4()
{
  uint64_t v2 = qword_1000362E8;
  if (!qword_1000362E8)
  {
    type metadata accessor for SoundScapesOption();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000362E8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100023D38()
{
  uint64_t v2 = qword_1000362F0;
  if (!qword_1000362F0)
  {
    sub_100010600(&qword_100036258);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000362F0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100023DBC()
{
  return swift_deallocObject();
}

void sub_100023DFC()
{
  sub_100022914(*(void **)(v0 + 16));
}

uint64_t sub_100023E08(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_100023E44()
{
  uint64_t v2 = qword_1000362F8;
  if (!qword_1000362F8)
  {
    sub_100010600(&qword_100036268);
    sub_100010600(&qword_100036258);
    sub_100029660();
    sub_100023D38();
    swift_getOpaqueTypeConformance2();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000362F8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100023F50(uint64_t a1)
{
  uint64_t v1 = sub_1000102A0(&qword_100036260);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  uint64_t v4 = *(int *)(sub_1000102A0(&qword_100036268) + 36);
  if (*(void *)(a1 + v4)) {
    swift_release();
  }
  if (*(void *)(a1 + v4 + 16)) {
    swift_release();
  }
  return a1;
}

void *sub_100024030(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  swift_retain();
  *a2 = v4;
  memcpy(a2 + 1, a1 + 1, 0x30uLL);
  return a2;
}

uint64_t sub_100024088(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1000102A0(&qword_100036260);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v13 = *(int *)(sub_1000102A0(&qword_100036268) + 36);
  if (*(void *)(a1 + v13))
  {
    uint64_t v9 = *(void *)(a1 + v13);
    uint64_t v10 = *(void *)(a1 + v13 + 8);
    swift_retain();
    uint64_t v3 = (void *)(a2 + v13);
    *uint64_t v3 = v9;
    v3[1] = v10;
  }
  else
  {
    *(_OWORD *)(a2 + v13) = *(_OWORD *)(a1 + v13);
  }
  uint64_t v7 = a2 + v13;
  uint64_t v8 = a1 + v13;
  if (*(void *)(a1 + v13 + 16))
  {
    uint64_t v5 = *(void *)(v8 + 16);
    uint64_t v6 = *(void *)(a1 + v13 + 24);
    swift_retain();
    *(void *)(v7 + 16) = v5;
    *(void *)(a2 + v13 + 24) = v6;
  }
  else
  {
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v8 + 16);
  }
  return a2;
}

uint64_t sub_100024214(uint64_t a1)
{
  swift_release();
  uint64_t v3 = *(int *)(sub_1000102A0(&qword_1000362B8) + 48);
  uint64_t v1 = sub_1000102A0(&qword_100036260);
  (*(void (**)(void))(*(void *)(v1 - 8) + 8))();
  uint64_t v5 = *(int *)(sub_1000102A0(&qword_100036268) + 36);
  if (*(void *)(a1 + v3 + v5)) {
    swift_release();
  }
  if (*(void *)(a1 + v3 + v5 + 16)) {
    swift_release();
  }
  return a1;
}

uint64_t sub_100024330()
{
  return sub_100029760();
}

uint64_t sub_100024348()
{
  return sub_100029770();
}

uint64_t sub_100024360()
{
  return sub_1000297B0();
}

uint64_t sub_10002437C()
{
  id v3 = *v0;
  id v1 = *v0;
  type metadata accessor for SoundScapesDataSource();
  sub_100020038();
  uint64_t v4 = sub_100029670();

  return v4;
}

uint64_t sub_1000243F0()
{
  sub_1000298D0();
  return v1;
}

long long *sub_100024434()
{
  long long v2 = *(_OWORD *)(v0 + 40);
  sub_1000244D4();
  sub_1000244D4();
  sub_1000102A0(&qword_100036300);
  sub_1000298E0();
  sub_100024500();
  uint64_t result = &v2;
  sub_100024500();
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1000244D4()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100024500()
{
}

uint64_t *sub_10002452C@<X0>(uint64_t a1@<X8>)
{
  return sub_100021140(*(void **)v1, *(void *)(v1 + 8), a1);
}

uint64_t sub_10002454C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v24 = sub_100024B74;
  id v21 = sub_100024E18;
  unint64_t v30 = sub_1000260E4;
  uint64_t v49 = 0;
  size_t v29 = 56;
  memset(__b, 0, sizeof(__b));
  memcpy(__dst, v1, sizeof(__dst));
  uint64_t v11 = __dst[0];
  uint64_t v12 = __dst[1];
  uint64_t v17 = __dst[2];
  uint64_t v18 = __dst[3];
  uint64_t v19 = __dst[4];
  uint64_t v13 = __dst[5];
  uint64_t v14 = __dst[6];
  uint64_t v36 = sub_1000102A0(&qword_100035868);
  uint64_t v33 = *(void *)(v36 - 8);
  uint64_t v34 = v36 - 8;
  unint64_t v9 = (*(void *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v36);
  int v35 = (char *)&v8 - v9;
  uint64_t v40 = sub_1000102A0(&qword_100036308);
  uint64_t v37 = *(void *)(v40 - 8);
  uint64_t v38 = v40 - 8;
  unint64_t v10 = (*(void *)(v37 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v40);
  uint64_t v39 = (char *)&v8 - v10;
  uint64_t v42 = sub_1000102A0(&qword_100036310);
  uint64_t v16 = *(void *)(*(void *)(v42 - 8) + 64);
  unint64_t v15 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v42);
  uint64_t v44 = (uint64_t)&v8 - v15;
  double v2 = __chkstk_darwin((char *)&v8 - v15);
  uint64_t v45 = (uint64_t)&v8 - v3;
  uint64_t v49 = (char *)&v8 - v3;
  __b[0] = v4;
  __b[1] = v5;
  __b[2] = v17;
  __b[3] = v18;
  __b[4] = v19;
  *(double *)&__b[5] = v2;
  __b[6] = v6;
  sub_100024ABC((id *)v1);
  uint64_t v26 = 72;
  uint64_t v27 = 7;
  uint64_t v20 = swift_allocObject();
  memcpy((void *)(v20 + 16), v1, v29);
  sub_100024ABC((id *)v1);
  unint64_t v22 = &v46;
  unsigned int v47 = v1;
  uint64_t v23 = sub_1000102A0(&qword_100036318);
  sub_100024E20();
  sub_1000298F0();
  sub_100024F44((id *)v1);
  id v25 = (id)sub_10002437C();
  sub_100007EB0();

  sub_100024ABC(v28);
  uint64_t v32 = swift_allocObject();
  memcpy((void *)(v32 + 16), v28, v29);
  unint64_t v31 = sub_1000260EC();
  sub_100026170();
  sub_100029850();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v36);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v40);
  unint64_t v43 = sub_1000261F4();
  sub_10002106C(v44, v42, v45);
  sub_100026278(v44);
  sub_10002634C(v45, v44);
  sub_10002106C(v44, v42, v41);
  sub_100026278(v44);
  return sub_100026278(v45);
}

uint64_t sub_100024A60(uint64_t a1)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 24);
  uint64_t v1 = swift_retain();
  v3(v1);
  return swift_release();
}

id *sub_100024ABC(id *a1)
{
  id v1 = *a1;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100024B1C()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_100024B74()
{
  return sub_100024A60(v0 + 16);
}

uint64_t sub_100024B7C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  memset(&v12[52], 0, 0x38uLL);
  memcpy(__dst, a1, sizeof(__dst));
  v12[52] = __dst[0];
  v12[53] = __dst[1];
  v12[54] = __dst[2];
  v12[55] = __dst[3];
  v12[56] = __dst[4];
  v12[57] = __dst[5];
  v12[58] = __dst[6];
  sub_100024ABC((id *)a1);
  sub_1000102A0(&qword_100036350);
  sub_10002701C();
  sub_100025E98();
  sub_100029900();
  sub_100024F44((id *)a1);
  memcpy(v14, v10, sizeof(v14));
  memcpy(v9, v14, sizeof(v9));
  sub_100029C30();
  sub_100029C40(v2);
  sub_100029940();
  sub_1000102A0(&qword_100036330);
  sub_100024EC0();
  sub_100029810();
  sub_1000270A0((uint64_t)v9);
  memcpy(v15, v11, sizeof(v15));
  memcpy(v8, v15, sizeof(v8));
  uint64_t v6 = sub_1000102A0(&qword_100036318);
  sub_100024E20();
  sub_10002106C((uint64_t)v8, v6, (uint64_t)v12);
  sub_1000270A0((uint64_t)v8);
  memcpy(v16, v12, sizeof(v16));
  sub_100027184((uint64_t)v16);
  memcpy(v7, v16, sizeof(v7));
  sub_10002106C((uint64_t)v7, v6, a2);
  sub_1000270A0((uint64_t)v7);
  return sub_1000270A0((uint64_t)v12);
}

uint64_t sub_100024E18@<X0>(uint64_t a1@<X8>)
{
  return sub_100024B7C(*(void **)(v1 + 16), a1);
}

unint64_t sub_100024E20()
{
  uint64_t v2 = qword_100036320;
  if (!qword_100036320)
  {
    sub_100010600(&qword_100036318);
    sub_100024EC0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036320);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100024EC0()
{
  uint64_t v2 = qword_100036328;
  if (!qword_100036328)
  {
    sub_100010600(&qword_100036330);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036328);
    return WitnessTable;
  }
  return v2;
}

id *sub_100024F44(id *a1)
{
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t *sub_100024FA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v95 = a2;
  uint64_t v98 = a1;
  uint64_t v281 = 0;
  uint64_t v134 = 0;
  char v135 = 0;
  uint64_t v2 = sub_1000102A0(&qword_100036360);
  unint64_t v96 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v2);
  uint64_t v97 = (uint64_t)&v16 - v96;
  uint64_t v99 = sub_1000298B0();
  uint64_t v100 = *(void *)(v99 - 8);
  uint64_t v101 = v99 - 8;
  unint64_t v102 = (*(void *)(v100 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v98);
  uint64_t v103 = (uint64_t)&v16 - v102;
  uint64_t v281 = v3;
  uint64_t v104 = *(void *)(v3 + 16);
  swift_retain();
  id v105 = sub_100015928();
  swift_release();
  id v247 = v105;
  if (v105)
  {
    id v248 = v247;
  }
  else
  {
    sub_100017E84();
    id v248 = sub_100025D9C();
    sub_100010C8C(&v247);
  }
  uint64_t v55 = sub_100029890();
  double v51 = sub_100025DCC();
  uint64_t v52 = v4;
  uint64_t v53 = v5;
  uint64_t v54 = v6;
  sub_100025DE0(v103);
  uint64_t v56 = sub_1000298C0();
  (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v103, v99);
  swift_release();
  int v57 = &v245;
  uint64_t v245 = v56;
  int v62 = 0;
  sub_100029790();
  sub_100012014();
  unint64_t v61 = v242;
  v242[0] = v249;
  v242[1] = v250;
  int v91 = 1;
  char v243 = v251 & 1;
  char v244 = v252 & 1;
  uint64_t v58 = sub_100029950();
  uint64_t v59 = v7;
  uint64_t v60 = sub_1000102A0(&qword_100036368);
  sub_1000272EC();
  uint64_t v90 = 0;
  sub_100029800();
  sub_100012014();
  uint64_t v65 = v233;
  v233[0] = v253;
  v233[1] = v254;
  char v234 = v255 & 1 & v91;
  char v235 = v256 & v91;
  uint64_t v236 = v257;
  char v237 = v258 & 1 & v91;
  uint64_t v238 = v259;
  char v239 = v260 & 1 & v91;
  uint64_t v240 = v261;
  uint64_t v241 = v262;
  int v64 = sub_1000296F0();
  uint64_t v63 = sub_1000102A0(&qword_100036378);
  sub_100027388();
  sub_100029820();
  sub_100012014();
  uint64_t v67 = v218;
  v218[0] = v263;
  v218[1] = v264;
  char v219 = v265 & 1 & v91;
  char v220 = v266 & v91;
  uint64_t v221 = v267;
  char v222 = v268 & 1 & v91;
  uint64_t v223 = v269;
  char v224 = v270 & 1 & v91;
  uint64_t v225 = v271;
  uint64_t v226 = v272;
  char v227 = v273;
  uint64_t v228 = v274;
  uint64_t v229 = v275;
  uint64_t v230 = v276;
  uint64_t v231 = v277;
  char v232 = v278 & 1 & v91;
  uint64_t v66 = sub_1000102A0(&qword_100036388);
  sub_100027428();
  uint64_t v68 = &v279;
  sub_1000297C0();
  sub_100012014();
  uint64_t v69 = v246;
  uint64_t v70 = 128;
  memcpy(v246, v68, sizeof(v246));
  uint64_t v73 = v217;
  memcpy(v217, v246, sizeof(v217));
  uint64_t v71 = sub_1000102A0(&qword_100036398);
  unint64_t v72 = sub_1000274C8();
  sub_10002106C((uint64_t)v73, v71, (uint64_t)v280);
  sub_100012014();
  uint64_t v74 = *(void *)(v98 + 16);
  swift_retain();
  uint64_t v75 = *(void *)(v74 + 32);
  uint64_t v76 = *(void *)(v74 + 40);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v77 = v178;
  v178[0] = v75;
  v178[1] = v76;
  sub_10001C8FC();
  uint64_t v174 = sub_100029750();
  uint64_t v175 = v8;
  char v176 = v9;
  uint64_t v177 = v10;
  unint64_t v78 = v171;
  v171[0] = v174;
  v171[1] = v8;
  char v172 = v9 & 1 & v91;
  uint64_t v173 = v10;
  sub_100029830();
  sub_1000222E4((uint64_t)v78);
  uint64_t v81 = v165;
  v165[0] = v178[2];
  v165[1] = v178[3];
  char v166 = v179 & 1 & v91;
  uint64_t v167 = v180;
  uint64_t v168 = v181;
  uint64_t v169 = v182;
  char v170 = v183 & 1 & v91;
  uint64_t v80 = sub_100029720();
  uint64_t v79 = sub_1000102A0(&qword_1000363B8);
  sub_1000275F0();
  sub_1000297F0();
  swift_release();
  sub_100027714((uint64_t)v81);
  uint64_t v84 = v157;
  v157[0] = v184;
  v157[1] = v185;
  char v158 = v186 & 1 & v91;
  uint64_t v159 = v187;
  uint64_t v160 = v188;
  uint64_t v161 = v189;
  char v162 = v190 & 1 & v91;
  uint64_t v163 = v191;
  uint64_t v164 = v192;
  uint64_t v83 = sub_100029880();
  uint64_t v82 = sub_1000102A0(&qword_1000363D8);
  sub_100027768();
  sub_1000297D0();
  swift_release();
  sub_100027890((uint64_t)v84);
  uint64_t v86 = v147;
  v147[0] = v193;
  v147[1] = v194;
  char v148 = v195 & 1 & v91;
  uint64_t v149 = v196;
  uint64_t v150 = v197;
  uint64_t v151 = v198;
  char v152 = v199 & 1 & v91;
  uint64_t v153 = v200;
  uint64_t v154 = v201;
  uint64_t v155 = v202;
  uint64_t v156 = v203;
  uint64_t v85 = sub_1000102A0(&qword_1000363F8);
  sub_1000278FC();
  sub_1000297C0();
  uint64_t v11 = v98;
  sub_100027A24((uint64_t)v86);
  uint64_t v89 = v136;
  v136[0] = v204;
  v136[1] = v205;
  char v137 = v206 & 1 & v91;
  uint64_t v138 = v207;
  uint64_t v139 = v208;
  uint64_t v140 = v209;
  char v141 = v210 & 1 & v91;
  uint64_t v142 = v211;
  uint64_t v143 = v212;
  uint64_t v144 = v213;
  uint64_t v145 = v214;
  uint64_t v146 = v215;
  uint64_t v87 = sub_1000102A0(&qword_100036418);
  unint64_t v88 = sub_100027AA8();
  sub_10002106C((uint64_t)v89, v87, (uint64_t)v216);
  sub_100027A24((uint64_t)v89);
  uint64_t v132 = sub_100029910();
  char v133 = v12 & 1 & v91;
  sub_10002106C((uint64_t)&v132, (uint64_t)&type metadata for Spacer, (uint64_t)&v134);
  uint64_t v94 = *(void *)(v11 + 16);
  swift_retain();
  swift_retain();
  id v92 = (id)sub_10002437C();
  uint64_t v93 = sub_1000082D0();

  swift_retain();
  uint64_t v125 = v94;
  uint64_t v126 = v93;
  if (v94)
  {
    sub_100013620(&v125, &v106);
    if (v126)
    {
      uint64_t v48 = v106;
      swift_retain();
      uint64_t v47 = v126;
      swift_retain();
      type metadata accessor for SoundScapesOption();
      int v49 = sub_100015FA8();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      sub_100012014();
      int v50 = v49;
      goto LABEL_10;
    }
    swift_release();
    goto LABEL_12;
  }
  if (v126)
  {
LABEL_12:
    sub_100026FDC();
    int v50 = 0;
    goto LABEL_10;
  }
  sub_100012014();
  int v50 = 1;
LABEL_10:
  int v46 = v50;
  swift_release();
  swift_release();
  if (v46)
  {
    unsigned int v29 = 1;
    sub_100029AD0("checkmark", 9uLL, 1);
    uint64_t v13 = sub_1000298A0();
    unint64_t v31 = v113;
    v113[0] = v13;
    uint64_t v28 = 0;
    uint64_t v14 = sub_100029700();
    (*(void (**)(uint64_t, void))(*(void *)(v14 - 8) + 56))(v97, v29);
    uint64_t v30 = sub_100029710();
    sub_100028040(v97);
    sub_1000297F0();
    swift_release();
    sub_100012014();
    uint64_t v34 = v112;
    v112[0] = v113[1];
    v112[1] = v113[2];
    v112[2] = v113[3];
    uint64_t v33 = sub_100029870();
    uint64_t v32 = sub_1000102A0(&qword_100036440);
    sub_100027BF0();
    sub_1000297D0();
    swift_release();
    sub_1000280F0();
    int v35 = v111;
    v111[0] = v113[4];
    v111[1] = v113[5];
    v111[2] = v113[6];
    v111[3] = v113[7];
    v111[4] = v113[8];
    uint64_t v42 = sub_1000102A0(&qword_100036428);
    unint64_t v43 = sub_100027B4C();
    uint64_t v45 = v114;
    sub_10002106C((uint64_t)v35, v42, (uint64_t)v114);
    sub_100028134();
    uint64_t v36 = v114[0];
    uint64_t v37 = v114[1];
    uint64_t v38 = v114[2];
    uint64_t v39 = v114[3];
    uint64_t v40 = v114[4];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v41 = v108;
    v108[0] = v36;
    v108[1] = v37;
    v108[2] = v38;
    v108[3] = v39;
    v108[4] = v40;
    sub_10002106C((uint64_t)v108, v42, (uint64_t)v109);
    sub_100028134();
    uint64_t v44 = v107;
    v107[0] = v109[0];
    v107[1] = v109[1];
    void v107[2] = v109[2];
    v107[3] = v109[3];
    v107[4] = v109[4];
    sub_100025E4C(v107, v42, v110);
    sub_100027FC8(v44);
    uint64_t v127 = v110[0];
    uint64_t v128 = v110[1];
    uint64_t v129 = v110[2];
    uint64_t v130 = v110[3];
    uint64_t v131 = v110[4];
    sub_100028134();
  }
  else
  {
    uint64_t v27 = v123;
    memset(v123, 0, sizeof(v123));
    uint64_t v26 = sub_1000102A0(&qword_100036428);
    sub_100027B4C();
    sub_100025E4C(v27, v26, v124);
    uint64_t v127 = v124[0];
    uint64_t v128 = v124[1];
    uint64_t v129 = v124[2];
    uint64_t v130 = v124[3];
    uint64_t v131 = v124[4];
  }
  id v25 = v280;
  unint64_t v22 = v121;
  sub_100027C90(v280, (uint64_t)v121);
  uint64_t v19 = v122;
  v122[0] = v22;
  uint64_t v24 = v216;
  id v21 = v120;
  sub_100027D20((uint64_t)v216, (uint64_t)v120);
  v122[1] = v21;
  uint64_t v118 = v134;
  char v119 = v135;
  v122[2] = &v118;
  uint64_t v23 = &v127;
  uint64_t v20 = v117;
  sub_100027E50(&v127, v117);
  v122[3] = v20;
  uint64_t v17 = v116;
  v116[0] = v71;
  v116[1] = v87;
  v116[2] = &type metadata for Spacer;
  v116[3] = sub_1000102A0(&qword_100036448);
  uint64_t v18 = v115;
  v115[0] = v72;
  v115[1] = v88;
  v115[2] = &protocol witness table for Spacer;
  v115[3] = sub_100027F34();
  sub_100022964((uint64_t)v19, 4uLL, (uint64_t)v17, v95);
  sub_100027FC8(v20);
  sub_100027A24((uint64_t)v21);
  sub_100012014();
  sub_100027FC8(v23);
  sub_100027A24((uint64_t)v24);
  uint64_t result = v25;
  sub_100012014();
  return result;
}

id sub_100025D9C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_1000282A8();
}

double sub_100025DCC()
{
  return 0.0;
}

uint64_t sub_100025DE0@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = enum case for Image.ResizingMode.stretch(_:);
  uint64_t v1 = sub_1000298B0();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

void *sub_100025E4C@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = sub_100029DC0();
  return sub_100028190(a1, a3, a2, v3);
}

uint64_t sub_100025E98()
{
  return sub_100029690();
}

long long *sub_100025EBC(uint64_t *a1, uint64_t a2)
{
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v10 = a2;
  id v3 = (id)sub_10002437C();
  uint64_t v5 = sub_100009F20();

  swift_retain();
  uint64_t v6 = *(void *)(a2 + 16);
  swift_retain();
  swift_retain();
  uint64_t v8 = v5;
  uint64_t v9 = v6;
  if (!v5)
  {
    if (!v9)
    {
      sub_100012014();
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  sub_100013620(&v8, &v7);
  if (!v9)
  {
    swift_release();
LABEL_8:
    sub_100026FDC();
    goto LABEL_7;
  }
  swift_retain();
  swift_retain();
  type metadata accessor for SoundScapesOption();
  sub_100015FA8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_100012014();
LABEL_7:
  swift_release();
  swift_release();
  return sub_100024434();
}

uint64_t sub_10002608C()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

long long *sub_1000260E4(uint64_t *a1)
{
  return sub_100025EBC(a1, v1 + 16);
}

unint64_t sub_1000260EC()
{
  uint64_t v2 = qword_100036338;
  if (!qword_100036338)
  {
    sub_100010600(&qword_100036308);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036338);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100026170()
{
  uint64_t v2 = qword_100036340;
  if (!qword_100036340)
  {
    sub_100010600(&qword_100035868);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036340);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000261F4()
{
  uint64_t v2 = qword_100036348;
  if (!qword_100036348)
  {
    sub_100010600(&qword_100036310);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036348);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100026278(uint64_t a1)
{
  uint64_t v1 = sub_1000102A0(&qword_100036308);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  uint64_t v4 = *(int *)(sub_1000102A0(&qword_100036310) + 52);
  uint64_t v2 = sub_1000102A0(&qword_100035868);
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1 + v4);
  swift_release();
  return a1;
}

uint64_t sub_10002634C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1000102A0(&qword_100036308);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v7 = sub_1000102A0(&qword_100036310);
  uint64_t v6 = *(int *)(v7 + 52);
  uint64_t v3 = sub_1000102A0(&qword_100035868);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a2 + v6, a1 + v6);
  uint64_t v10 = *(int *)(v7 + 56);
  uint64_t v11 = *(void *)(a1 + v10);
  uint64_t v12 = *(void *)(a1 + v10 + 8);
  swift_retain();
  uint64_t result = a2;
  uint64_t v5 = (void *)(a2 + v10);
  *uint64_t v5 = v11;
  v5[1] = v12;
  return result;
}

uint64_t sub_100026468@<X0>(uint64_t a1@<X8>)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_10002454C(a1);
}

void *sub_1000264B0(void *a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  id v2 = *(id *)a2;
  uint64_t result = a1;
  *a1 = v4;
  a1[1] = *(void *)(a2 + 8);
  return result;
}

void sub_1000264F8(id *a1)
{
}

uint64_t sub_100026514(uint64_t a1, uint64_t a2)
{
  id v5 = *(id *)a1;
  id v4 = *(id *)a2;
  id v2 = *(id *)a2;
  *(void *)a1 = v4;

  uint64_t result = a1;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t sub_100026570(uint64_t a1, void *a2)
{
  id v2 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t result = a1;
  *(void *)(a1 + 8) = a2[1];
  return result;
}

uint64_t sub_1000265B8(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFE && *(unsigned char *)(a1 + 16))
    {
      int v5 = *(_OWORD *)a1 + 2147483646;
    }
    else
    {
      int v4 = -1;
      if (*(void *)a1 < (unint64_t)&_mh_execute_header) {
        int v4 = *(void *)a1;
      }
      int v2 = v4 - 1;
      if (v4 - 1 < 0) {
        int v2 = -1;
      }
      int v5 = v2;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_100026730(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFE;
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(unsigned char *)(result + 16) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(unsigned char *)(result + 16) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

void *type metadata accessor for SoundScapeList()
{
  return &unk_100031FF0;
}

uint64_t sub_100026950(id *a1)
{
  swift_release();
  swift_release();
  return swift_release();
}

void *sub_10002699C(void *a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  id v2 = *(id *)a2;
  *a1 = v4;
  a1[1] = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  swift_retain();
  a1[2] = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  swift_retain();
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  swift_retain();
  uint64_t result = a1;
  a1[6] = v10;
  return result;
}

uint64_t sub_100026A4C(uint64_t a1, uint64_t a2)
{
  id v5 = *(id *)a1;
  id v4 = *(id *)a2;
  id v2 = *(id *)a2;
  *(void *)a1 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  swift_retain();
  *(void *)(a1 + 16) = v6;
  swift_release();
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  swift_retain();
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  swift_retain();
  *(void *)(a1 + 48) = v10;
  swift_release();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100026B38(void *a1, const void *a2)
{
}

uint64_t sub_100026B68(uint64_t a1, void *a2)
{
  id v2 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = a2[2];
  swift_release();
  uint64_t v3 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v3;
  swift_release();
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  swift_release();
  return a1;
}

uint64_t sub_100026C04(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      int v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (!HIDWORD(*(void *)(a1 + 16))) {
        int v3 = *(void *)(a1 + 16);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_100026D1C(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)uint64_t result = a2 + 0x80000000;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 48) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 56) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 56) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 16) = a2 - 1;
    }
  }
  return result;
}

void *type metadata accessor for SoundScapeList.Cell()
{
  return &unk_100032070;
}

unint64_t sub_100026F44()
{
  return sub_10002371C();
}

unint64_t sub_100026F5C()
{
  return sub_1000261F4();
}

uint64_t sub_100026F74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100026FA8()
{
  return swift_getOpaqueTypeConformance2();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100026FDC()
{
}

uint64_t *sub_100027014@<X0>(uint64_t a1@<X8>)
{
  return sub_100024FA4(*(void *)(v1 + 16), a1);
}

unint64_t sub_10002701C()
{
  uint64_t v2 = qword_100036358;
  if (!qword_100036358)
  {
    sub_100010600(&qword_100036350);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036358);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000270A0(uint64_t a1)
{
  if (*(void *)(a1 + 264))
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  return a1;
}

uint64_t sub_100027184(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 152);
  uint64_t v3 = *(void *)(a1 + 160);
  char v4 = *(unsigned char *)(a1 + 168);
  uint64_t v5 = *(void *)(a1 + 264);
  swift_retain();
  sub_100022370(v2, v3, v4 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100027280(v5);
  return a1;
}

uint64_t sub_100027280(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

unint64_t sub_1000272EC()
{
  uint64_t v2 = qword_100036370;
  if (!qword_100036370)
  {
    sub_100010600(&qword_100036368);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036370);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100027388()
{
  uint64_t v2 = qword_100036380;
  if (!qword_100036380)
  {
    sub_100010600(&qword_100036378);
    sub_1000272EC();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036380);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100027428()
{
  uint64_t v2 = qword_100036390;
  if (!qword_100036390)
  {
    sub_100010600(&qword_100036388);
    sub_100027388();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036390);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000274C8()
{
  uint64_t v2 = qword_1000363A0;
  if (!qword_1000363A0)
  {
    sub_100010600(&qword_100036398);
    sub_100027428();
    sub_10002756C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000363A0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10002756C()
{
  uint64_t v2 = qword_1000363A8;
  if (!qword_1000363A8)
  {
    sub_100010600(&qword_1000363B0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000363A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000275F0()
{
  uint64_t v2 = qword_1000363C0;
  if (!qword_1000363C0)
  {
    sub_100010600(&qword_1000363B8);
    sub_100027690();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000363C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100027690()
{
  uint64_t v2 = qword_1000363C8;
  if (!qword_1000363C8)
  {
    sub_100010600(&qword_1000363D0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000363C8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100027714(uint64_t a1)
{
  return a1;
}

unint64_t sub_100027768()
{
  uint64_t v2 = qword_1000363E0;
  if (!qword_1000363E0)
  {
    sub_100010600(&qword_1000363D8);
    sub_1000275F0();
    sub_10002780C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000363E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_10002780C()
{
  uint64_t v2 = qword_1000363E8;
  if (!qword_1000363E8)
  {
    sub_100010600(&qword_1000363F0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1000363E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100027890(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000278FC()
{
  uint64_t v2 = qword_100036400;
  if (!qword_100036400)
  {
    sub_100010600(&qword_1000363F8);
    sub_100027768();
    sub_1000279A0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036400);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000279A0()
{
  uint64_t v2 = qword_100036408;
  if (!qword_100036408)
  {
    sub_100010600(&qword_100036410);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036408);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100027A24(uint64_t a1)
{
  return a1;
}

unint64_t sub_100027AA8()
{
  uint64_t v2 = qword_100036420;
  if (!qword_100036420)
  {
    sub_100010600(&qword_100036418);
    sub_1000278FC();
    sub_10002756C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036420);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100027B4C()
{
  uint64_t v2 = qword_100036430;
  if (!qword_100036430)
  {
    sub_100010600(&qword_100036428);
    sub_100027BF0();
    sub_1000279A0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036430);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100027BF0()
{
  uint64_t v2 = qword_100036438;
  if (!qword_100036438)
  {
    sub_100010600(&qword_100036440);
    sub_10002780C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036438);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100027C90(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  swift_retain();
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = a1[1];
  *(_WORD *)(a2 + 16) = *((_WORD *)a1 + 8);
  memcpy((void *)(a2 + 24), a1 + 3, 0x30uLL);
  memcpy((void *)(a2 + 72), a1 + 9, 0x29uLL);
  uint64_t result = a2;
  *(void *)(a2 + 120) = a1[15];
  return result;
}

uint64_t sub_100027D20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  char v5 = *(unsigned char *)(a1 + 16);
  sub_100022370(*(void *)a1, v4, v5 & 1);
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  uint64_t v6 = *(void *)(a1 + 24);
  swift_bridgeObjectRetain();
  *(void *)(a2 + 24) = v6;
  uint64_t v7 = *(void *)(a1 + 32);
  swift_retain();
  *(void *)(a2 + 32) = v7;
  *(void *)(a2 + 40) = *(void *)(a1 + 40);
  *(unsigned char *)(a2 + 48) = *(unsigned char *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  swift_retain();
  *(void *)(a2 + 56) = v8;
  uint64_t v9 = *(void *)(a1 + 64);
  swift_retain();
  *(void *)(a2 + 64) = v9;
  uint64_t v10 = *(void *)(a1 + 72);
  swift_retain();
  *(void *)(a2 + 72) = v10;
  uint64_t v12 = *(void *)(a1 + 80);
  swift_retain();
  uint64_t result = a2;
  *(void *)(a2 + 80) = v12;
  *(void *)(a2 + 88) = *(void *)(a1 + 88);
  return result;
}

void *sub_100027E50(uint64_t *a1, void *a2)
{
  if (*a1)
  {
    uint64_t v3 = *a1;
    swift_retain();
    *a2 = v3;
    uint64_t v4 = a1[1];
    swift_retain();
    a2[1] = v4;
    uint64_t v5 = a1[2];
    swift_retain();
    a2[2] = v5;
    uint64_t v6 = a1[3];
    swift_retain();
    a2[3] = v6;
    uint64_t v7 = a1[4];
    swift_retain();
    a2[4] = v7;
  }
  else
  {
    memcpy(a2, a1, 0x28uLL);
  }
  return a2;
}

unint64_t sub_100027F34()
{
  uint64_t v2 = qword_100036450;
  if (!qword_100036450)
  {
    sub_100010600(&qword_100036448);
    sub_100027B4C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_100036450);
    return WitnessTable;
  }
  return v2;
}

void *sub_100027FC8(void *a1)
{
  if (*a1)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  return a1;
}

uint64_t sub_100028040(uint64_t a1)
{
  uint64_t v3 = sub_100029700();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1000280F0()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100028134()
{
}

void *sub_100028190(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(a3 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v9 + 48))(a1, 1))
  {
    memcpy(a2, a1, *(void *)(*(void *)(a4 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(a2, a1, a3);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(a2, 0, 1, a3);
  }
  return a2;
}

id sub_1000282A8()
{
  return [v0 init];
}

uint64_t sub_1000282CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v41 = a9;
  v21[6] = a1;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v32 = a4;
  uint64_t v34 = a5;
  uint64_t v35 = a6;
  uint64_t v36 = a7;
  uint64_t v29 = a8;
  void v21[4] = 0;
  uint64_t v30 = sub_100028880;
  uint64_t v37 = &protocol conformance descriptor for <> ForEach<A, B, C>;
  uint64_t v54 = a4;
  uint64_t v53 = a5;
  uint64_t v25 = *(void *)(a4 - 8);
  v21[5] = a4 - 8;
  v21[0] = (*(void *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(a1);
  uint64_t v28 = (char *)v21 - v21[0];
  v21[1] = 255;
  v21[3] = swift_getAssociatedTypeWitness();
  v21[2] = &protocol requirements base descriptor for Identifiable;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v48 = v32;
  uint64_t v49 = AssociatedTypeWitness;
  uint64_t v50 = v34;
  uint64_t v51 = v35;
  uint64_t v52 = AssociatedConformanceWitness;
  uint64_t v44 = sub_100029930();
  uint64_t v38 = *(void *)(v44 - 8);
  uint64_t v39 = v44 - 8;
  uint64_t v23 = *(void *)(v38 + 64);
  unint64_t v22 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = __chkstk_darwin(v28);
  uint64_t v40 = (uint64_t)v21 - v22;
  unint64_t v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v43 = (uint64_t)v21 - v24;
  (*(void (**)(uint64_t))(v25 + 16))(v11);
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v26;
  uint64_t v14 = v29;
  uint64_t v15 = v34;
  uint64_t v16 = v35;
  uint64_t v17 = v36;
  uint64_t v18 = (void *)v12;
  uint64_t v19 = v27;
  unint64_t v31 = v18;
  v18[2] = v32;
  v18[3] = v15;
  v18[4] = v16;
  id v18[5] = v17;
  v18[6] = v14;
  v18[7] = v13;
  v18[8] = v19;
  swift_retain();
  sub_100029920();
  uint64_t v47 = v36;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_10002106C(v40, v44, v43);
  int v46 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
  uint64_t v45 = v38 + 8;
  v46(v40, v44);
  sub_10002106C(v43, v44, v41);
  return ((uint64_t (*)(uint64_t, uint64_t))v46)(v43, v44);
}

uint64_t sub_1000286A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000282CC(v1[7], v1[8], v1[9], v1[2], v1[3], v1[4], v1[5], v1[6], a1);
}

uint64_t sub_1000286DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v15 = a5;
  uint64_t v18 = a3;
  uint64_t v16 = a4;
  uint64_t v22 = a2;
  uint64_t v21 = a3;
  uint64_t v12 = *(void *)(a3 - 8);
  uint64_t v13 = a3 - 8;
  uint64_t v10 = *(void *)(v12 + 64);
  unint64_t v9 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(a1);
  uint64_t v14 = (uint64_t)&v9 - v9;
  unint64_t v11 = v9;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v17 = (uint64_t)&v9 - v11;
  v7(v6);
  sub_10002106C(v14, v18, v17);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  uint64_t v19 = v12 + 8;
  v20(v14, v18);
  sub_10002106C(v17, v18, v15);
  return ((uint64_t (*)(uint64_t, uint64_t))v20)(v17, v18);
}

uint64_t sub_100028830()
{
  return swift_deallocObject();
}

uint64_t sub_100028880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000286DC(a1, v2[2], v2[3], v2[5], a2);
}

uint64_t sub_1000288B0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1000288F8()
{
  return sub_1000225E0(*(void **)(v0 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100028908(id *a1)
{
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_100028958()
{
  return v0;
}

uint64_t sub_10002897C()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1000289BC()
{
  return sub_100028958();
}

id sub_1000289F8()
{
  sub_1000187C8();
  type metadata accessor for ResourceBundleClass();
  id result = sub_100028A40();
  qword_100036458 = (uint64_t)result;
  return result;
}

id sub_100028A40()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v0 = [(id)swift_getObjCClassFromMetadata() bundleForClass:ObjCClassFromMetadata];

  return v0;
}

uint64_t *sub_100028A98()
{
  if (qword_100035828 != -1) {
    swift_once();
  }
  return &qword_100036458;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100028B24()
{
  sub_100005F30();
  sub_100005EEC((void *)&_mh_execute_header, v0, v1, "Start downloading catalog", v2, v3, v4, v5, v6);
}

void sub_100028B58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028BCC()
{
  sub_100005F08();
  sub_100005ED0((void *)&_mh_execute_header, v0, v1, "Catalog Download failed with reason %ld", v2, v3, v4, v5, v6);
}

void sub_100028C34()
{
  sub_100005F30();
  sub_100005EEC((void *)&_mh_execute_header, v0, v1, "Download asset catalog", v2, v3, v4, v5, v6);
}

void sub_100028C68()
{
  sub_100005F30();
  sub_100005EEC((void *)&_mh_execute_header, v0, v1, "We have the catalog", v2, v3, v4, v5, v6);
}

void sub_100028C9C()
{
  sub_100005F30();
  sub_100005EEC((void *)&_mh_execute_header, v0, v1, "Fetch asset catalog", v2, v3, v4, v5, v6);
}

void sub_100028CD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028D40(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028DC4()
{
  sub_100005F30();
  sub_100005EEC((void *)&_mh_execute_header, v0, v1, "Get system version mapping", v2, v3, v4, v5, v6);
}

void sub_100028DF8()
{
  sub_100005F30();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to get newest asset", v1, 2u);
}

void sub_100028E38()
{
  sub_100005F08();
  sub_100005ED0((void *)&_mh_execute_header, v0, v1, "Query result is not successful %@", v2, v3, v4, v5, v6);
}

void sub_100028EA0()
{
  sub_100005F08();
  sub_100005ED0((void *)&_mh_execute_header, v0, v1, "Failed to get system version mapping: %@", v2, v3, v4, v5, v6);
}

void sub_100028F08()
{
  sub_100005F08();
  sub_100005ED0((void *)&_mh_execute_header, v0, v1, "Failed to download newest asset: %@", v2, v3, v4, v5, v6);
}

void sub_100028F70()
{
  sub_100005F30();
  sub_100005EEC((void *)&_mh_execute_header, v0, v1, "Start system version mapping", v2, v3, v4, v5, v6);
}

void sub_100028FA4()
{
  sub_100005F08();
  sub_100005ED0((void *)&_mh_execute_header, v0, v1, "Can't get newest version mapping: can't get asset catalog for error %@", v2, v3, v4, v5, v6);
}

void sub_10002900C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002907C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000290EC()
{
  sub_100005F08();
  sub_100005ED0((void *)&_mh_execute_header, v0, v1, "Failed to download Asset with reason %ld", v2, v3, v4, v5, v6);
}

void sub_100029154()
{
  sub_100005F08();
  sub_100005F14((void *)&_mh_execute_header, v0, v1, "Asset download for versions: %@", v2, v3, v4, v5, v6);
}

void sub_1000291BC()
{
  sub_100005F3C();
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Fetch asset catalog: %@ with error: %@", v2, 0x16u);
}

void sub_100029250()
{
  sub_100005F08();
  sub_100005F14((void *)&_mh_execute_header, v0, v1, "Start asset download for versions: %@", v2, v3, v4, v5, v6);
}

void sub_1000292B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029328()
{
  sub_100005F3C();
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Download newest asset %@: %@", v2, 0x16u);
}

void sub_1000293B8()
{
  sub_100005F08();
  sub_100005ED0((void *)&_mh_execute_header, v0, v1, "Failed to retrieve %@ for asset", v2, v3, v4, v5, v6);
}

uint64_t sub_100029420()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_100029430()
{
  return JSONDecoder.__allocating_init()();
}

uint64_t sub_100029440()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_100029450()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029460()
{
  return type metadata accessor for Notification();
}

uint64_t sub_100029470()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100029480()
{
  return _convertNSErrorToError(_:)();
}

void sub_100029490(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000294A0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_1000294B0()
{
  return URL.path.getter();
}

uint64_t sub_1000294C0()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000294D0()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_1000294E0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000294F0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029500()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_100029510()
{
  return static Date.now.getter();
}

uint64_t sub_100029520()
{
  return type metadata accessor for Date();
}

uint64_t sub_100029530()
{
  return PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)();
}

uint64_t sub_100029540()
{
  return type metadata accessor for PrimitiveAppExtensionScene();
}

uint64_t sub_100029550()
{
  return type metadata accessor for AppExtensionSceneConfiguration();
}

uint64_t sub_100029560()
{
  return AppExtensionSceneConfiguration.init<A, B>(_:configuration:)();
}

uint64_t sub_100029570()
{
  return static AppExtension<>.main()();
}

uint64_t sub_100029580()
{
  return Logger.logObject.getter();
}

uint64_t sub_100029590()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000295A0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000295B0()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_1000295C0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_1000295D0()
{
  return Published.projectedValue.getter();
}

uint64_t sub_1000295E0()
{
  return Published.projectedValue.setter();
}

uint64_t sub_1000295F0()
{
  return static Published.subscript.modify();
}

uint64_t sub_100029600()
{
  return static Published.subscript.getter();
}

uint64_t sub_100029610()
{
  return static Published.subscript.setter();
}

uint64_t sub_100029620()
{
  return type metadata accessor for Published();
}

uint64_t sub_100029630()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_100029640()
{
  return ProgressView<>.init<>(_:)();
}

uint64_t sub_100029650()
{
  return PlainListStyle.init()();
}

uint64_t sub_100029660()
{
  return type metadata accessor for PlainListStyle();
}

uint64_t sub_100029670()
{
  return EnvironmentObject.wrappedValue.getter();
}

uint64_t sub_100029680()
{
  return EnvironmentObject.init()();
}

uint64_t sub_100029690()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_1000296A0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1000296B0()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_1000296C0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000296D0()
{
  return CircularProgressViewStyle.init()();
}

uint64_t sub_1000296E0()
{
  return type metadata accessor for CircularProgressViewStyle();
}

uint64_t sub_1000296F0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100029700()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_100029710()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_100029720()
{
  return static Font.title2.getter();
}

uint64_t sub_100029730()
{
  return List<>.init(content:)();
}

uint64_t sub_100029740()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100029750()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100029760()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100029770()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100029780()
{
  return View.progressViewStyle<A>(_:)();
}

uint64_t sub_100029790()
{
  return View.aspectRatio(_:contentMode:)();
}

uint64_t sub_1000297A0()
{
  return View.onDisappear(perform:)();
}

uint64_t sub_1000297B0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000297C0()
{
  return View.layoutPriority(_:)();
}

uint64_t sub_1000297D0()
{
  return View.foregroundColor(_:)();
}

uint64_t sub_1000297E0()
{
  return View.environmentObject<A>(_:)();
}

uint64_t sub_1000297F0()
{
  return View.font(_:)();
}

uint64_t sub_100029800()
{
  return View.frame(width:height:alignment:)();
}

uint64_t sub_100029810()
{
  return View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_100029820()
{
  return View.padding(_:_:)();
}

uint64_t sub_100029830()
{
  return View.lineLimit(_:)();
}

uint64_t sub_100029840()
{
  return View.listStyle<A>(_:)();
}

uint64_t sub_100029850()
{
  return View.onReceive<A>(_:perform:)();
}

uint64_t sub_100029860()
{
  return Color.init(uiColor:)();
}

uint64_t sub_100029870()
{
  return static Color.accentColor.getter();
}

uint64_t sub_100029880()
{
  return static Color.primary.getter();
}

uint64_t sub_100029890()
{
  return Image.init(uiImage:)();
}

uint64_t sub_1000298A0()
{
  return Image.init(systemName:)();
}

uint64_t sub_1000298B0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_1000298C0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_1000298D0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_1000298E0()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000298F0()
{
  return Button.init(action:label:)();
}

uint64_t sub_100029900()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t sub_100029910()
{
  return Spacer.init(minLength:)();
}

uint64_t sub_100029920()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100029930()
{
  return type metadata accessor for ForEach();
}

uint64_t sub_100029940()
{
  return static Alignment.center.getter();
}

uint64_t sub_100029950()
{
  return static Alignment.leading.getter();
}

uint64_t sub_100029960()
{
  return TupleView.init(_:)();
}

uint64_t sub_100029970()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_100029980()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100029990()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000299A0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_1000299B0()
{
  return static DispatchTime.now()();
}

uint64_t sub_1000299C0()
{
  return DispatchTime.advanced(by:)();
}

uint64_t sub_1000299D0()
{
  return type metadata accessor for DispatchTime();
}

NSDictionary sub_1000299E0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000299F0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029A00()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100029A10()
{
  return Dictionary.keys.getter();
}

uint64_t sub_100029A20()
{
  return Dictionary.subscript.setter();
}

Swift::Int sub_100029A30(Swift::Int seed)
{
  return Hashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100029A40()
{
  return static Comparable.> infix(_:_:)();
}

uint64_t sub_100029A50()
{
  return static Comparable.>= infix(_:_:)();
}

uint64_t sub_100029A60()
{
  return static Comparable.<= infix(_:_:)();
}

NSString sub_100029A70()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100029A80()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029A90()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100029AA0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100029AB0()
{
  return String.init(stringInterpolation:)();
}

uint64_t sub_100029AC0()
{
  return static String.< infix(_:_:)();
}

uint64_t sub_100029AD0(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(_builtinStringLiteral, utf8CodeUnitCount, isASCII)._countAndFlagsBits;
}

uint64_t sub_100029AE0()
{
  return static String.== infix(_:_:)();
}

uint64_t sub_100029AF0()
{
  return String.hash(into:)();
}

Swift::Int sub_100029B00()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100029B10()
{
  return Sequence.allSatisfy(_:)();
}

uint64_t sub_100029B20()
{
  return Sequence.compactMap<A>(_:)();
}

uint64_t sub_100029B30()
{
  return Sequence<>.max()();
}

uint64_t sub_100029B40()
{
  return Sequence<>.min()();
}

uint64_t sub_100029B50()
{
  return Sequence<>.sorted()();
}

uint64_t sub_100029B60()
{
  return UnsignedInteger<>.init<A>(_:)();
}

NSArray sub_100029B70()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100029B80()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029B90()
{
  return static Array.+ infix(_:_:)();
}

uint64_t sub_100029BA0()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t sub_100029BB0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100029BC0()
{
  return Array.count.getter();
}

uint64_t sub_100029BD0()
{
  return type metadata accessor for Array();
}

NSNumber sub_100029BE0()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_100029BF0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100029C00()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100029C10()
{
  return type metadata accessor for TaskPriority();
}

NSNumber sub_100029C20()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_100029C30()
{
  return static Double.infinity.getter();
}

double sub_100029C40(Swift::Double a1)
{
  return Double.init(_:)(a1);
}

uint64_t sub_100029C50()
{
  return Set.formIntersection<A>(_:)();
}

uint64_t sub_100029C60()
{
  return Set.init<A>(_:)();
}

NSNumber sub_100029C70()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100029C80()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_100029C90()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_100029CA0()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_100029CB0()
{
  return Collection.first.getter();
}

uint64_t sub_100029CC0()
{
  return Collection.prefix(_:)();
}

uint64_t sub_100029CD0()
{
  return Collection.isEmpty.getter();
}

uint64_t sub_100029CE0()
{
  return Collection<>.makeIterator()();
}

uint64_t sub_100029CF0()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_100029D00()
{
  return static os_log_type_t.default.getter();
}

INPlayMediaIntent sub_100029D10(Swift::OpaquePointer_optional mediaItems, INMediaItem_optional mediaContainer, Swift::Bool_optional playShuffled, INPlaybackRepeatMode playbackRepeatMode, Swift::Bool_optional resumePlayback, INPlaybackQueueLocation playbackQueueLocation, Swift::Double_optional playbackSpeed, int a8, INMediaSearch_optional mediaSearch)
{
  return INPlayMediaIntent.init(mediaItems:mediaContainer:playShuffled:playbackRepeatMode:resumePlayback:playbackQueueLocation:playbackSpeed:mediaSearch:)(mediaItems, mediaContainer, playShuffled, playbackRepeatMode, resumePlayback, playbackQueueLocation, playbackSpeed, mediaSearch);
}

uint64_t sub_100029D20()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100029D30()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100029D40()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_100029D50()
{
  return OS_dispatch_semaphore.signal()();
}

unint64_t sub_100029D60(Swift::Double seconds, Swift::Int32 preferredTimescale)
{
  return (unint64_t)CMTime.init(seconds:preferredTimescale:)(seconds, preferredTimescale);
}

uint64_t sub_100029D70()
{
  return CMTime.seconds.getter();
}

uint64_t sub_100029D80()
{
  return CMTime.isNumeric.getter();
}

void sub_100029D90()
{
}

uint64_t sub_100029DA0()
{
  return UnsafeMutablePointer.deinitialize(count:)();
}

uint64_t sub_100029DB0()
{
  return static UnsafeMutablePointer.allocate(capacity:)();
}

uint64_t sub_100029DC0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100029DD0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100029DE0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100029DF0()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_100029E00()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100029E10()
{
  return ArraySlice.subscript.getter();
}

uint64_t sub_100029E20()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100029E30()
{
  return _expectEnd<A>(of:is:)();
}

uint64_t sub_100029E40()
{
  return _hashValue<A>(for:)();
}

uint64_t sub_100029E50()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100029E60()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100029E70()
{
  return _ArrayProtocol.filter(_:)();
}

void sub_100029E80(Swift::Int a1)
{
}

uint64_t sub_100029E90()
{
  return ContiguousArray.append(_:)();
}

uint64_t sub_100029EA0()
{
  return ContiguousArray.init()();
}

uint64_t sub_100029EB0()
{
  return type metadata accessor for ContiguousArray();
}

uint64_t sub_100029EC0()
{
  return IndexingIterator.next()();
}

uint64_t sub_100029ED0()
{
  return FixedWidthInteger.init(_:)();
}

uint64_t sub_100029EE0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100029EF0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100029F00()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100029F10()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100029F20()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100029F30()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_100029F40()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_100029F50()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

void sub_100029F60(Swift::String a1)
{
}

uint64_t sub_100029F70()
{
  return DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100029F80()
{
  return _allocateUninitializedArray<A>(_:)();
}

uint64_t sub_100029F90()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100029FA0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100029FB0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100029FC0()
{
  return Error._code.getter();
}

uint64_t sub_100029FD0()
{
  return Error._domain.getter();
}

uint64_t sub_100029FE0()
{
  return Error._userInfo.getter();
}

uint64_t sub_100029FF0()
{
  return Hasher.combine<A>(_:)();
}

uint64_t sub_10002A000()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10002A010()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_10002A020()
{
  return CodingKey.description.getter();
}

uint64_t sub_10002A030()
{
  return CodingKey.debugDescription.getter();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_continuation_await()
{
  return _swift_continuation_await();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return _swift_continuation_throwingResumeWithError();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend__downloadAssetForCompabilityVersions_withCompleteHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_downloadAssetForCompabilityVersions:withCompleteHandler:");
}

id objc_msgSend__fetchAssetCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchAssetCatalog:");
}

id objc_msgSend__getAssetURLFuture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAssetURLFuture:");
}

id objc_msgSend__getSystemVersionsMappingWithCompleteHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getSystemVersionsMappingWithCompleteHandler:");
}

id objc_msgSend_addCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCompletionBlock:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_combineAllFutures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineAllFutures:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
}

id objc_msgSend_downloadCatalogWithCompleteHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadCatalogWithCompleteHandler:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_finishWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:error:");
}

id objc_msgSend_futureWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "futureWithBlock:");
}

id objc_msgSend_futureWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "futureWithResult:");
}

id objc_msgSend_getAssetVersion_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAssetVersion:forKey:");
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return _[a1 getLocalFileUrl];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return _[a1 getLocalUrl];
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return _[a1 mainThreadScheduler];
}

id objc_msgSend_na_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_filter:");
}

id objc_msgSend_na_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_map:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_queryMetaDataWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryMetaDataWithError:");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_startCatalogDownload_options_completionWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCatalogDownload:options:completionWithError:");
}

id objc_msgSend_startDownload_completionWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDownload:completionWithError:");
}

id objc_msgSend_wasLocal(void *a1, const char *a2, ...)
{
  return _[a1 wasLocal];
}