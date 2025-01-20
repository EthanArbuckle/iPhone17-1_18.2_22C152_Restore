@interface BSUIContentTasteController
+ (BSUIContentTasteController)sharedController;
+ (id)getInstance;
- (BOOL)_explicitlyDeclinedFromTasteInteger:(signed __int16)a3;
- (BSUIContentTasteController)init;
- (BUCoalescingCallBlock)syncTastesCallBlock;
- (signed)_tasteIntegerFromTasteType:(unint64_t)a3 explicitlyDeclined:(BOOL)a4;
- (unint64_t)_loveOrHateFromTasteInteger:(signed __int16)a3;
- (void)fetchTasteTypeForStoreID:(id)a3 completion:(id)a4;
- (void)fetchTastesForStoreUploading:(id)a3;
- (void)setExplicitlyDeclined:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5;
- (void)setSyncTastesCallBlock:(id)a3;
- (void)setTasteType:(unint64_t)a3 forStoreID:(id)a4 completion:(id)a5;
- (void)tastesForStoreUploading:(id)a3;
- (void)tastesUploadedToStore:(id)a3;
- (void)tastesUploadedToStore:(id)a3 completion:(id)a4;
@end

@implementation BSUIContentTasteController

+ (id)getInstance
{
  return +[BSUIContentTasteController sharedController];
}

+ (BSUIContentTasteController)sharedController
{
  if (qword_3D40A0 != -1) {
    dispatch_once(&qword_3D40A0, &stru_38E468);
  }
  v2 = (void *)qword_3D4098;

  return (BSUIContentTasteController *)v2;
}

- (BSUIContentTasteController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BSUIContentTasteController;
  v2 = [(BSUIContentTasteController *)&v6 init];
  if (v2)
  {
    v3 = (BUCoalescingCallBlock *)[objc_alloc((Class)BUCoalescingCallBlock) initWithNotifyBlock:&stru_38E4A8 blockDescription:@"BSUIContentTasteController"];
    syncTastesCallBlock = v2->_syncTastesCallBlock;
    v2->_syncTastesCallBlock = v3;

    [(BUCoalescingCallBlock *)v2->_syncTastesCallBlock setCoalescingDelay:0.5];
  }
  return v2;
}

- (void)tastesForStoreUploading:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_FC20;
  v5[3] = &unk_38E4D0;
  id v6 = a3;
  id v4 = v6;
  [(BSUIContentTasteController *)self fetchTastesForStoreUploading:v5];
}

- (void)tastesUploadedToStore:(id)a3
{
  id v5 = a3;
  if ([v5 isObject])
  {
    id v4 = [v5 toDictionary];
  }
  else
  {
    id v4 = 0;
  }
  [(BSUIContentTasteController *)self tastesUploadedToStore:v4 completion:0];
}

- (void)fetchTasteTypeForStoreID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[BCCloudAssetManager sharedManager];
  v9 = [v8 assetDetailManager];

  if (v9)
  {
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_FEE4;
    v12[3] = &unk_38E4F8;
    objc_copyWeak(&v14, &location);
    id v13 = v7;
    [v9 assetDetailForAssetID:v6 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = objc_retainBlock(v7);
    v11 = v10;
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (void)setTasteType:(unint64_t)a3 forStoreID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[BCCloudAssetManager sharedManager];
  v11 = [v10 assetDetailManager];

  if (v11)
  {
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_101B8;
    v14[3] = &unk_38E568;
    id v15 = v8;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a3;
    id v16 = v11;
    id v17 = v9;
    [v16 assetDetailForAssetID:v15 completion:v14];

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    id v12 = objc_retainBlock(v9);
    id v13 = v12;
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

- (void)setExplicitlyDeclined:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[BCCloudAssetManager sharedManager];
  v11 = [v10 assetDetailManager];

  if (v11)
  {
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10654;
    v14[3] = &unk_38E5B0;
    id v15 = v8;
    objc_copyWeak(&v19, &location);
    id v16 = self;
    BOOL v20 = a3;
    id v17 = v11;
    id v18 = v9;
    [v17 assetDetailForAssetID:v15 completion:v14];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    id v12 = objc_retainBlock(v9);
    id v13 = v12;
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

- (void)fetchTastesForStoreUploading:(id)a3
{
  id v4 = a3;
  id v5 = +[BCCloudAssetManager sharedManager];
  id v6 = [v5 assetDetailManager];

  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10A58;
    v9[3] = &unk_38E5D8;
    v9[4] = self;
    id v10 = v4;
    [v6 fetchAssetDetailsForUnsyncedTastes:v9];
  }
  else
  {
    id v7 = objc_retainBlock(v4);
    id v8 = v7;
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)tastesUploadedToStore:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BCCloudAssetManager sharedManager];
  id v9 = [v8 assetDetailManager];

  if (v9)
  {
    id v10 = [v6 allKeys];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10DA4;
    v13[3] = &unk_38E628;
    id v14 = v6;
    id v15 = self;
    id v16 = v9;
    id v17 = v7;
    [v16 assetDetailsForAssetIDs:v10 completion:v13];
  }
  else
  {
    id v11 = objc_retainBlock(v7);
    id v12 = v11;
    if (v11) {
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
}

- (BOOL)_explicitlyDeclinedFromTasteInteger:(signed __int16)a3
{
  return (a3 >> 2) & 1;
}

- (unint64_t)_loveOrHateFromTasteInteger:(signed __int16)a3
{
  return a3 & 3;
}

- (signed)_tasteIntegerFromTasteType:(unint64_t)a3 explicitlyDeclined:(BOOL)a4
{
  if (a4) {
    __int16 v4 = 4;
  }
  else {
    __int16 v4 = 0;
  }
  return v4 | a3;
}

- (BUCoalescingCallBlock)syncTastesCallBlock
{
  return self->_syncTastesCallBlock;
}

- (void)setSyncTastesCallBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end