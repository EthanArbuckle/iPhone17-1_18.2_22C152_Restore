@interface BKBookSampleHelper
+ (id)defaultHelper;
- (void)downloadSampleWithURL:(id)a3 contentData:(id)a4 tracker:(id)a5 completion:(id)a6;
@end

@implementation BKBookSampleHelper

+ (id)defaultHelper
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013B868;
  block[3] = &unk_100A43EF8;
  block[4] = a1;
  if (qword_100B4A438 != -1) {
    dispatch_once(&qword_100B4A438, block);
  }
  v2 = (void *)qword_100B4A430;

  return v2;
}

- (void)downloadSampleWithURL:(id)a3 contentData:(id)a4 tracker:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = +[JSABridge sharedInstance];
  v14 = [v13 windowManager];

  id v15 = objc_alloc((Class)BLDownloadManifestRequest);
  v16 = +[NSURLRequest requestWithURL:v9];
  id v17 = [v15 initWithURLRequest:v16];

  kdebug_trace();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10013BA58;
  v22[3] = &unk_100A47D70;
  id v23 = v9;
  id v24 = v11;
  id v25 = v10;
  id v26 = v12;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v21 = v9;
  [v17 startWithUIManager:v14 manifestResponseBlock:v22];
  kdebug_trace();
}

@end