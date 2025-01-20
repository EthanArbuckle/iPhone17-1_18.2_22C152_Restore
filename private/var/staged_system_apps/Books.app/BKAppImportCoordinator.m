@interface BKAppImportCoordinator
- (BKAppImportCoordinator)init;
- (OS_dispatch_queue)queue;
- (double)lastImportedBookTimestamp;
- (id)mainLibrary;
- (id)sceneManager;
- (void)_handleImportedAndPotentiallyMigratedAsset:(id)a3 canShow:(BOOL)a4 transaction:(id)a5;
- (void)importBookFromURL:(id)a3 openAfterImport:(BOOL)a4 importInPlace:(BOOL)a5 showLibraryAllCollection:(BOOL)a6 switchToLibrary:(BOOL)a7 transaction:(id)a8 completion:(id)a9;
- (void)setLastImportedBookTimestamp:(double)a3;
- (void)setQueue:(id)a3;
@end

@implementation BKAppImportCoordinator

- (BKAppImportCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKAppImportCoordinator;
  v2 = [(BKAppImportCoordinator *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BKAppImportCoordinator.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    +[NSDate timeIntervalSinceReferenceDate];
    v2->_lastImportedBookTimestamp = v6 + -15.0 + -1.0;
  }
  return v2;
}

- (id)mainLibrary
{
  return +[BKLibraryManager defaultManager];
}

- (id)sceneManager
{
  return +[BKAppDelegate sceneManager];
}

- (void)importBookFromURL:(id)a3 openAfterImport:(BOOL)a4 importInPlace:(BOOL)a5 showLibraryAllCollection:(BOOL)a6 switchToLibrary:(BOOL)a7 transaction:(id)a8 completion:(id)a9
{
  id v12 = a3;
  id v31 = a8;
  id v13 = a9;
  +[NSDate timeIntervalSinceReferenceDate];
  double v15 = v14;
  [(BKAppImportCoordinator *)self lastImportedBookTimestamp];
  BOOL v33 = v15 - v16 > 15.0;
  [(BKAppImportCoordinator *)self setLastImportedBookTimestamp:v15];
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = sub_100006F64;
  v62[4] = sub_10000719C;
  id v63 = 0;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_1000B8B24;
  v59[3] = &unk_100A43DD8;
  v17 = [[BKResolveAssetForImportOperation alloc] initWithURL:v12];
  v60 = v17;
  v61 = self;
  v18 = objc_retainBlock(v59);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000B8B64;
  v53[3] = &unk_100A45028;
  id v19 = v13;
  id v55 = v19;
  v20 = v18;
  id v56 = v20;
  v53[4] = self;
  BOOL v58 = a5;
  id v21 = v31;
  id v54 = v21;
  v57 = v62;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000B9364;
  v51[3] = &unk_100A45050;
  v51[4] = self;
  v52 = objc_retainBlock(v53);
  v32 = v52;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000B947C;
  v49[3] = &unk_100A450C8;
  v49[4] = self;
  v50 = objc_retainBlock(v51);
  v22 = v50;
  v23 = objc_retainBlock(v49);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B9928;
  block[3] = &unk_100A45168;
  id v37 = v12;
  v38 = self;
  id v41 = v20;
  id v42 = v19;
  BOOL v45 = a6;
  v39 = v17;
  id v40 = v21;
  BOOL v46 = v33;
  BOOL v47 = a5;
  BOOL v48 = a7;
  id v43 = v23;
  v44 = v62;
  v25 = v23;
  id v26 = v21;
  id v27 = v19;
  v28 = v20;
  v29 = v17;
  id v30 = v12;
  dispatch_async(queue, block);

  _Block_object_dispose(v62, 8);
}

- (void)_handleImportedAndPotentiallyMigratedAsset:(id)a3 canShow:(BOOL)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = +[BKLibraryManager defaultManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000BA050;
    v11[3] = &unk_100A45190;
    v11[4] = self;
    id v12 = v8;
    BOOL v14 = a4;
    id v13 = v9;
    [v10 addCustomOperationBlock:v11];
  }
}

- (double)lastImportedBookTimestamp
{
  return self->_lastImportedBookTimestamp;
}

- (void)setLastImportedBookTimestamp:(double)a3
{
  self->_lastImportedBookTimestamp = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end