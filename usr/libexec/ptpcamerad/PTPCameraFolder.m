@interface PTPCameraFolder
- (PTPCameraFolder)initWithStorageID:(unsigned int)a3 objHandle:(unsigned int)a4 parent:(id)a5 initiator:(id)a6;
- (id)mediaItemType;
- (id)newFolderWithObjectInfo:(id)a3 inFolder:(id)a4 notify:(BOOL)a5;
- (void)dealloc;
- (void)newItemWithObjectInfo:(id)a3 notify:(BOOL)a4;
- (void)refreshInfo;
@end

@implementation PTPCameraFolder

- (PTPCameraFolder)initWithStorageID:(unsigned int)a3 objHandle:(unsigned int)a4 parent:(id)a5 initiator:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)PTPCameraFolder;
  v6 = [(PTPCameraItem *)&v9 initWithStorageID:*(void *)&a3 objHandle:*(void *)&a4 parent:a5 initiator:a6];
  v7 = v6;
  if (v6) {
    [(PTPCameraItem *)v6 setType:3];
  }
  return v7;
}

- (id)mediaItemType
{
  return @"folder";
}

- (void)dealloc
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)PTPCameraFolder;
  [(PTPCameraFolder *)&v3 dealloc];
}

- (void)refreshInfo
{
  id v4 = [(PTPCameraItem *)self initiator];
  objc_super v3 = [v4 objectInfo:-[PTPCameraItem objHandle](self, "objHandle")];
  [(PTPCameraItem *)self setInfo:v3];
}

- (void)newItemWithObjectInfo:(id)a3 notify:(BOOL)a4
{
  id v6 = a3;
  if (a4)
  {
    v7 = [(PTPCameraItem *)self initiator];
    v8 = [v7 delegate];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000211EC;
    v20[3] = &unk_10004C9E8;
    v20[4] = self;
    id v21 = v6;
    objc_super v9 = +[NSBlockOperation blockOperationWithBlock:v20];
    [v8 addInitiatedOperation:v9];
  }
  else
  {
    v10 = [PTPCameraFile alloc];
    uint64_t v11 = [(PTPCameraItem *)self storageID];
    id v12 = [v6 objectHandle];
    v13 = [(PTPCameraItem *)self initiator];
    v14 = [(PTPCameraFile *)v10 initWithStorageID:v11 ptpObjectInfo:v6 objHandle:v12 parent:self initiator:v13];

    __ICOSLogCreate();
    v15 = +[NSString stringWithFormat:@"File queued: %@\n", v14];
    v16 = [v15 description];
    v17 = +[NSString stringWithFormat:@"%@", v16];

    if (__ICLogTypeEnabled(4))
    {
      v18 = _gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }

    v19 = [(PTPCameraItem *)self storage];
    [v19 addCameraFileToIndex:v14];
  }
}

- (id)newFolderWithObjectInfo:(id)a3 inFolder:(id)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [PTPCameraFolder alloc];
  uint64_t v11 = [(PTPCameraItem *)self storageID];
  id v12 = [v8 objectHandle];
  v13 = [(PTPCameraItem *)self initiator];
  v14 = [(PTPCameraFolder *)v10 initWithStorageID:v11 objHandle:v12 parent:v9 initiator:v13];

  [(PTPCameraItem *)v14 setInfo:v8];
  v15 = [(PTPCameraItem *)self storage];
  [v15 addCameraFolderToIndex:v14];

  if (v5)
  {
    v16 = [(PTPCameraItem *)self initiator];
    v17 = [v16 delegate];

    CFStringRef v24 = @"ICPTPObjectInfoArray";
    v18 = [v8 content:2];
    v23 = v18;
    v19 = +[NSArray arrayWithObjects:&v23 count:1];
    v25 = v19;
    v20 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

    id v21 = [v17 allConnections];
    [v17 sendAddedItemsNotification:v20 toConnections:v21];
  }
  return v14;
}

@end