@interface MFStoreController
+ (OS_os_log)log;
+ (id)_canLoadAsStoreURL:(id)a3;
+ (id)_presentStoreURL:(id)a3 from:(id)a4;
+ (id)openPossibleStoreURL:(id)a3 presentingFrom:(id)a4;
- (MFStoreController)init;
- (id)_presentStoreURL:(id)a3 from:(id)a4;
@end

@implementation MFStoreController

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E60F8;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699D30 != -1) {
    dispatch_once(&qword_100699D30, block);
  }
  v2 = (void *)qword_100699D28;

  return (OS_os_log *)v2;
}

+ (id)openPossibleStoreURL:(id)a3 presentingFrom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[EFScheduler mainThreadScheduler];
  v9 = [v7 view];
  unsigned __int8 v10 = [v9 isUserInteractionEnabled];

  v11 = [v7 view];
  [v11 setUserInteractionEnabled:0];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1001E64F8;
  v33[3] = &unk_1006058A8;
  id v12 = v7;
  id v34 = v12;
  unsigned __int8 v35 = v10;
  v13 = +[EFDeallocInvocationToken tokenWithLabel:@"MFStoreController Interaction Resumer" invocationBlock:v33];
  v14 = [a1 _canLoadAsStoreURL:v6];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001E6628;
  v30[3] = &unk_100604618;
  id v15 = v13;
  id v31 = v15;
  id v16 = v14;
  id v32 = v16;
  [v8 afterDelay:v30 performBlock:2.0];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001E6664;
  v25[3] = &unk_10060D220;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v17;
  id v29 = a1;
  id v18 = v6;
  id v27 = v18;
  id v19 = v12;
  id v28 = v19;
  v20 = [v16 onScheduler:v8 then:v25];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001E66AC;
  v23[3] = &unk_1006047A0;
  id v21 = v15;
  id v24 = v21;
  [v20 onScheduler:v8 always:v23];

  return v20;
}

+ (id)_canLoadAsStoreURL:(id)a3
{
  id v3 = a3;
  +[EFPromise promise];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001E67E8;
  v9[3] = &unk_100604550;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v4;
  v5 = objc_retainBlock(v9);
  Class v6 = off_1006911C0();
  if (v6) {
    [(objc_class *)v6 getCanLoadURL:v3 completionBlock:v5];
  }
  else {
    ((void (*)(void *, void))v5[2])(v5, 0);
  }
  id v7 = [v4 future];

  return v7;
}

+ (id)_presentStoreURL:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MFStoreController);
  v8 = [(MFStoreController *)v7 _presentStoreURL:v5 from:v6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E69CC;
  v11[3] = &unk_1006047A0;
  v9 = v7;
  id v12 = v9;
  [v8 always:v11];

  return v8;
}

- (MFStoreController)init
{
  v8.receiver = self;
  v8.super_class = (Class)MFStoreController;
  v2 = [(MFStoreController *)&v8 init];
  if (v2)
  {
    id v3 = (SKStoreProductViewController *)objc_alloc_init(off_1006911C0());
    storeViewController = v2->_storeViewController;
    v2->_storeViewController = v3;

    id v5 = (EFPromise *)objc_alloc_init((Class)EFPromise);
    promise = v2->_promise;
    v2->_promise = v5;
  }
  return v2;
}

- (id)_presentStoreURL:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  storeViewController = self->_storeViewController;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001E6BEC;
  v14[3] = &unk_10060D248;
  id v9 = v6;
  id v15 = v9;
  id v16 = self;
  [(SKStoreProductViewController *)storeViewController loadProductWithURL:v9 completionBlock:v14];
  id v10 = self->_storeViewController;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001E6D54;
  v13[3] = &unk_1006047A0;
  v13[4] = self;
  [v7 presentViewController:v10 animated:1 completion:v13];
  v11 = [(EFPromise *)self->_promise future];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);

  objc_storeStrong((id *)&self->_storeViewController, 0);
}

@end