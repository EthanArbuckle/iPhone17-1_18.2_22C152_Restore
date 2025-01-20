@interface AVAsset
+ (void)tui_createAssetFromURL:(id)a3 completion:(id)a4;
@end

@implementation AVAsset

+ (void)tui_createAssetFromURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_2DF6A8 != -1) {
    dispatch_once(&qword_2DF6A8, &stru_255368);
  }
  v7 = qword_2DF6A0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_DE730;
  v10[3] = &unk_2525D8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

@end