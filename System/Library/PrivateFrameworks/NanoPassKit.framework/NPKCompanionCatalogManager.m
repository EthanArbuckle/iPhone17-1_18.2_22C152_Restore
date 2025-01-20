@interface NPKCompanionCatalogManager
- (BOOL)needsUpdateForNewCatalog:(id)a3;
- (NPKCompanionCatalogManager)init;
- (OS_dispatch_queue)mutex;
- (PKCatalog)currentCatalog;
- (id)archiveFileName;
- (void)setCurrentCatalog:(id)a3;
- (void)setMutex:(id)a3;
@end

@implementation NPKCompanionCatalogManager

- (NPKCompanionCatalogManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NPKCompanionCatalogManager;
  v2 = [(NPKCompanionCatalogManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nanopassbook.NPKCompanionAgent.NPKCompanionAgentCatalogManager", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    [(NPKCompanionCatalogManager *)v2 setMutex:v3];

    v4 = [(NPKCompanionCatalogManager *)v2 archiveFileName];
    v5 = +[NSData dataWithContentsOfFile:v4];

    objc_opt_class();
    v6 = NPKSecureUnarchiveObject();
    [(NPKCompanionCatalogManager *)v2 setCurrentCatalog:v6];
  }
  return v2;
}

- (id)archiveFileName
{
  v2 = NPKHomeDirectoryPath();
  dispatch_queue_t v3 = [v2 stringByAppendingPathComponent:@"Catalog.archive"];

  return v3;
}

- (PKCatalog)currentCatalog
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10000668C;
  v11 = sub_10000669C;
  id v12 = 0;
  dispatch_queue_t v3 = [(NPKCompanionCatalogManager *)self mutex];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000066A4;
  v6[3] = &unk_10006CD78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PKCatalog *)v4;
}

- (BOOL)needsUpdateForNewCatalog:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(NPKCompanionCatalogManager *)self mutex];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000067B8;
  block[3] = &unk_10006CDA0;
  block[4] = self;
  id v9 = v4;
  v10 = &v11;
  id v6 = v4;
  dispatch_barrier_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)setCurrentCatalog:(id)a3
{
}

- (OS_dispatch_queue)mutex
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMutex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutex, 0);
  objc_storeStrong((id *)&self->_currentCatalog, 0);
}

@end