@interface AssetExportController
- (AssetExportController)init;
- (OS_dispatch_queue)completionQueue;
- (void)finalizeAssetWithComposition:(id)a3 completionBlock:(id)a4;
- (void)setCompletionQueue:(id)a3;
@end

@implementation AssetExportController

- (AssetExportController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AssetExportController;
  v2 = [(AssetExportController *)&v5 init];
  v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_completionQueue, &_dispatch_main_q);
  }
  return v3;
}

- (void)finalizeAssetWithComposition:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 decomposedFragments];
  id v9 = [v8 count];

  if (v9)
  {
    id v10 = [v6 composedAVURL];
    v11 = OSLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100022B60((uint64_t)v10, v11);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000A43C;
    v17[3] = &unk_100038B50;
    v17[4] = self;
    id v18 = v7;
    id v12 = v7;
    objc_msgSend(v6, "rcs_composeToFinalDestinationWithCompletionBlock:", v17);
  }
  else
  {
    completionQueue = self->_completionQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000A544;
    v14[3] = &unk_100038B78;
    id v16 = v7;
    id v15 = v6;
    id v10 = v7;
    dispatch_async((dispatch_queue_t)completionQueue, v14);

    id v12 = v16;
  }
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end