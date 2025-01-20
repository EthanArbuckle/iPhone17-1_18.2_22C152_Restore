@interface CSDMediaAssetManager
- (void)saveLivePhotoWithPhotoURL:(id)a3 videoURL:(id)a4 completion:(id)a5;
- (void)saveVideoWithURL:(id)a3 completion:(id)a4;
@end

@implementation CSDMediaAssetManager

- (void)saveLivePhotoWithPhotoURL:(id)a3 videoURL:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "photoURL: %@ videoURL: %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v23 = sub_1000C553C;
  v24 = sub_1000C554C;
  id v25 = 0;
  v11 = [(id)CUTWeakLinkClass() sharedPhotoLibrary];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000C5554;
  v18[3] = &unk_100505DC0;
  id v12 = v7;
  id v19 = v12;
  id v13 = v8;
  id v20 = v13;
  v21 = buf;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000C5620;
  v15[3] = &unk_100506E70;
  v17 = buf;
  id v14 = v9;
  id v16 = v14;
  [v11 performChanges:v18 completionHandler:v15];

  _Block_object_dispose(buf, 8);
}

- (void)saveVideoWithURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TUAllowLocalVideoRecording())
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "saveVideoWithURL: %@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x3032000000;
    v17 = sub_1000C553C;
    v18 = sub_1000C554C;
    id v19 = 0;
    id v8 = [(id)CUTWeakLinkClass() sharedPhotoLibrary];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000C5958;
    v12[3] = &unk_100506E98;
    id v13 = v5;
    p_long long buf = &buf;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C5A10;
    v9[3] = &unk_100506E70;
    v11 = &buf;
    id v10 = v6;
    [v8 performChanges:v12 completionHandler:v9];

    _Block_object_dispose(&buf, 8);
  }
}

@end