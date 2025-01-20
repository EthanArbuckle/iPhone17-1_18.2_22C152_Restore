@interface BKLibrarySharedContainerManager
+ (id)sharedInstance;
- (BKLibrarySharedContainerManager)init;
- (IMLibraryPlist)plist;
- (OS_dispatch_queue)plistQueue;
- (id)sharedURLForEntry:(id)a3;
@end

@implementation BKLibrarySharedContainerManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C9C9C;
  block[3] = &unk_100A43EF8;
  block[4] = a1;
  if (qword_100B4A2B8 != -1) {
    dispatch_once(&qword_100B4A2B8, block);
  }
  v2 = (void *)qword_100B4A2B0;

  return v2;
}

- (BKLibrarySharedContainerManager)init
{
  v3 = +[BLLibrary defaultBookLibrary];
  unsigned int v4 = [v3 _isMultiUser];

  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)BKLibrarySharedContainerManager;
    v5 = [(BKLibrarySharedContainerManager *)&v11 init];
    if (v5)
    {
      dispatch_queue_t v6 = dispatch_queue_create("BKLibrarySharedContainerManager.urlQueue", 0);
      plistQueue = v5->_plistQueue;
      v5->_plistQueue = (OS_dispatch_queue *)v6;

      uint64_t v8 = +[IMLibraryPlist libraryPlistWithKind:3];
      plist = v5->_plist;
      v5->_plist = (IMLibraryPlist *)v8;
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)sharedURLForEntry:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100006F94;
  v20 = sub_1000071B4;
  id v21 = 0;
  v5 = +[IMLibraryPlist assetIDFromPlistEntry:v4];
  dispatch_queue_t v6 = +[IMLibraryPlist temporaryItemIdentifierFromPlistEntry:v4];
  v7 = +[IMLibraryPlist permlinkFromPlistEntry:v4];
  if ([v5 length] || objc_msgSend(v6, "length") || v7)
  {
    plistQueue = self->_plistQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C9F68;
    block[3] = &unk_100A45790;
    block[4] = self;
    id v12 = v5;
    id v13 = v6;
    id v14 = v7;
    v15 = &v16;
    dispatch_sync(plistQueue, block);
  }
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

- (OS_dispatch_queue)plistQueue
{
  return self->_plistQueue;
}

- (IMLibraryPlist)plist
{
  return self->_plist;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plist, 0);

  objc_storeStrong((id *)&self->_plistQueue, 0);
}

@end