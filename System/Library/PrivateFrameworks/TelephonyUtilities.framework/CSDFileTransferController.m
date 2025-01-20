@interface CSDFileTransferController
+ (id)copyFileAtURL:(id)a3 toTemporaryFileWithName:(id)a4;
+ (id)renameResourceAtURL:(id)a3 toResourceWithName:(id)a4;
+ (id)renamedResourceURL:(id)a3 withName:(id)a4;
+ (void)deleteContentsAtURL:(id)a3;
- (CSDFileTransferController)init;
- (CSDFileTransferController)initWithService:(id)a3;
- (CSDFileTransferringDelegate)delegate;
- (CSDIDSService)service;
- (NSMutableDictionary)clientFileURLByIdentifier;
- (NSMutableDictionary)temporaryFileURLByClientFileURL;
- (OS_dispatch_queue)queue;
- (void)cleanUpTemporaryFileIfExistsForClientFileURL:(id)a3;
- (void)performFileCopierOperation:(unint64_t)a3 onInputURL:(id)a4 outputURL:(id)a5 completion:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)setDelegate:(id)a3;
- (void)setService:(id)a3;
- (void)transferFileAtSandboxExtendedURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5 fromMember:(id)a6;
- (void)transferFileAtTemporaryURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5 fromMember:(id)a6;
- (void)transferFileAtURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5;
- (void)unzipArchiveAtURL:(id)a3 completion:(id)a4;
- (void)zipDirectoryAtURL:(id)a3 completion:(id)a4;
@end

@implementation CSDFileTransferController

- (CSDFileTransferController)init
{
  v3 = +[CSDFaceTimeLivePhotosIDSService sharedInstance];
  v4 = [(CSDFileTransferController *)self initWithService:v3];

  return v4;
}

- (CSDFileTransferController)initWithService:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSDFileTransferController;
  v6 = [(CSDFileTransferController *)&v14 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clientFileURLByIdentifier = v6->_clientFileURLByIdentifier;
    v6->_clientFileURLByIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    temporaryFileURLByClientFileURL = v6->_temporaryFileURLByClientFileURL;
    v6->_temporaryFileURLByClientFileURL = v9;

    objc_storeStrong((id *)&v6->_service, a3);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.csdfiletransfercontroller", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    [(CSDIDSService *)v6->_service addServiceDelegate:v6 queue:v6->_queue];
  }

  return v6;
}

- (void)transferFileAtURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "transferFileAtURL: %@, destinations: %@", buf, 0x16u);
  }

  v12 = [(CSDFileTransferController *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A8B54;
  v16[3] = &unk_1005053D0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)transferFileAtSandboxExtendedURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5 fromMember:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CSDFileTransferController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A8C8C;
  block[3] = &unk_1005053A8;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)unzipArchiveAtURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 URLByDeletingLastPathComponent];
  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "placing unzip results into folder %@", buf, 0xCu);
  }

  id v10 = [(CSDFileTransferController *)self queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A8E6C;
  v14[3] = &unk_100505F18;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v7;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v10, v14);
}

- (void)transferFileAtTemporaryURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5 fromMember:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CSDFileTransferController *)self queue];
  dispatch_assert_queue_V2(v14);

  id v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v35 = v10;
    __int16 v36 = 2112;
    id v37 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "temporaryClientFileURL: %@, destinations: %@", buf, 0x16u);
  }

  buf[0] = 0;
  id v16 = +[NSFileManager defaultManager];
  id v17 = [v10 path];
  unsigned int v18 = [v16 fileExistsAtPath:v17 isDirectory:buf];

  if (v18)
  {
    id v19 = +[NSMutableDictionary dictionary];
    id v20 = +[NSNumber numberWithBool:buf[0]];
    [v19 setObject:v20 forKeyedSubscript:@"CSDFileTransferringMetadataKeyIsDirectory"];

    [v19 setObject:v12 forKeyedSubscript:@"CSDFileTransferringMetadataKeyUserData"];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000A94B0;
    v28[3] = &unk_100506A08;
    id v29 = v11;
    id v21 = v19;
    v30 = v21;
    id v31 = v13;
    v32 = self;
    id v22 = v10;
    id v33 = v22;
    id v23 = objc_retainBlock(v28);
    v24 = v23;
    if (buf[0])
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000A9710;
      v25[3] = &unk_100506A30;
      v25[4] = self;
      id v26 = v22;
      id v27 = v24;
      [(CSDFileTransferController *)self zipDirectoryAtURL:v26 completion:v25];
    }
    else
    {
      ((void (*)(void *, id))v23[2])(v23, v22);
    }
  }
  else
  {
    id v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1003A9998();
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = [(CSDFileTransferController *)self queue];
  dispatch_assert_queue_V2(v14);

  id v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412802;
    id v26 = v11;
    __int16 v27 = 2112;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "incomingResourceURL: %@ metadata: %@ fromID: %@", (uint8_t *)&v25, 0x20u);
  }

  id v16 = [v12 objectForKeyedSubscript:@"CSDFileTransferringMetadataKeyIsDirectory"];
  id v17 = [v16 BOOLValue];

  unsigned int v18 = [v12 objectForKeyedSubscript:@"CSDFileTransferringMetadataKeyUserData"];
  id v19 = objc_opt_class();
  id v20 = +[NSUUID UUID];
  id v21 = [v20 UUIDString];
  id v22 = [v19 copyFileAtURL:v11 toTemporaryFileWithName:v21];

  if (v22)
  {
    id v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Copied resource to temporary URL: %@", (uint8_t *)&v25, 0xCu);
    }

    v24 = [(CSDFileTransferController *)self delegate];
    [v24 fileTransferer:self didReceiveResourcesAtURL:v22 withMetadata:v18 isZipped:v17 fromIDSDestination:v13];
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(CSDFileTransferController *)self queue];
  dispatch_assert_queue_V2(v16);

  id v17 = sub_100008DCC();
  unsigned int v18 = v17;
  if (v8)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "successfully sent file with identifier: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    sub_1003A9A84();
  }

  id v19 = [(CSDFileTransferController *)self clientFileURLByIdentifier];
  id v20 = [v19 objectForKeyedSubscript:v14];

  if (v20)
  {
    id v21 = [(CSDFileTransferController *)self delegate];
    [v21 fileTransferer:self didTransferFileAtURL:v20 successfully:v8];

    id v22 = [(CSDFileTransferController *)self clientFileURLByIdentifier];
    [v22 setObject:0 forKeyedSubscript:v14];

    [(CSDFileTransferController *)self cleanUpTemporaryFileIfExistsForClientFileURL:v20];
  }
  else
  {
    id v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(CSDFileTransferController *)self clientFileURLByIdentifier];
      int v25 = 138413570;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v13;
      __int16 v29 = 2112;
      id v30 = v14;
      __int16 v31 = 1024;
      BOOL v32 = v8;
      __int16 v33 = 2112;
      id v34 = v15;
      __int16 v35 = 2112;
      __int16 v36 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Unexpected nil clientFileURL for service: %@, account: %@, identifier: %@, didSendWithSuccess: %d, error: %@, clientFileURLByIdentifier: %@", (uint8_t *)&v25, 0x3Au);
    }
  }
}

+ (id)copyFileAtURL:(id)a3 toTemporaryFileWithName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = NSTemporaryDirectory();
  BOOL v8 = +[NSUUID UUID];
  id v9 = [v8 UUIDString];
  id v10 = [v7 stringByAppendingPathComponent:v9];
  id v11 = +[NSURL fileURLWithPath:v10];

  id v12 = +[NSFileManager defaultManager];
  id v23 = 0;
  LODWORD(v8) = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v23];
  id v13 = v23;

  if (!v8)
  {
    id v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1003A9AEC();
    }
    id v14 = 0;
    id v17 = v13;
    goto LABEL_9;
  }
  id v14 = [v11 URLByAppendingPathComponent:v6];
  id v15 = +[NSFileManager defaultManager];
  id v22 = v13;
  unsigned __int8 v16 = [v15 copyItemAtURL:v5 toURL:v14 error:&v22];
  id v17 = v22;

  if ((v16 & 1) == 0)
  {
    id v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v5;
      __int16 v26 = 2112;
      __int16 v27 = v14;
      __int16 v28 = 2112;
      id v29 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to copy URL at %@ to %@: %@", buf, 0x20u);
    }
LABEL_9:
    unsigned int v18 = v14;

    id v14 = 0;
    goto LABEL_10;
  }
  unsigned int v18 = v14;
LABEL_10:
  id v20 = v14;

  return v20;
}

+ (id)renameResourceAtURL:(id)a3 toResourceWithName:(id)a4
{
  id v6 = a3;
  id v7 = [a1 renamedResourceURL:v6 withName:a4];
  BOOL v8 = +[NSFileManager defaultManager];
  id v13 = 0;
  unsigned __int8 v9 = [v8 moveItemAtURL:v6 toURL:v7 error:&v13];
  id v10 = v13;

  if ((v9 & 1) == 0)
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error moving url %@ to %@: %@", buf, 0x20u);
    }

    id v7 = 0;
  }

  return v7;
}

+ (id)renamedResourceURL:(id)a3 withName:(id)a4
{
  id v5 = a4;
  id v6 = [a3 pathComponents];
  id v7 = [v6 mutableCopy];

  [v7 removeLastObject];
  [v7 addObject:v5];

  BOOL v8 = +[NSURL fileURLWithPathComponents:v7];

  return v8;
}

+ (void)deleteContentsAtURL:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned int v5 = [v4 removeItemAtURL:v3 error:&v9];
  id v6 = v9;

  id v7 = sub_100008DCC();
  BOOL v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleted contents at URL: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1003A9B54();
  }
}

- (void)zipDirectoryAtURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CSDFileTransferController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = NSTemporaryDirectory();
  id v10 = +[NSUUID UUID];
  id v11 = [v10 UUIDString];
  id v12 = [v9 stringByAppendingPathComponent:v11];
  id v13 = [v12 stringByAppendingPathExtension:@"zip"];

  id v14 = +[NSURL fileURLWithPath:v13];
  id v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v6;
    __int16 v25 = 2112;
    __int16 v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Zipping directory at URL: %@, output to: %@", buf, 0x16u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000AA380;
  v19[3] = &unk_1005056C0;
  id v20 = v6;
  id v21 = v14;
  id v22 = v7;
  id v16 = v7;
  id v17 = v14;
  id v18 = v6;
  [(CSDFileTransferController *)self performFileCopierOperation:0 onInputURL:v18 outputURL:v17 completion:v19];
}

- (void)performFileCopierOperation:(unint64_t)a3 onInputURL:(id)a4 outputURL:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(CSDFileTransferController *)self queue];
  dispatch_assert_queue_V2(v13);

  id v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v27 = a3;
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 2112;
    id v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "operation: %ld, inputURL: %@, outputURL: %@", buf, 0x20u);
  }

  id v15 = objc_alloc((Class)IMFileCopier);
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  unint64_t v25 = a3;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = [(CSDFileTransferController *)self queue];
  id v20 = [v15 initWithInputURL:v18 outputURL:v17 identifier:0 operation:a3 completionBlock:&v21 queue:v19];

  [v20 start];
}

- (void)cleanUpTemporaryFileIfExistsForClientFileURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CSDFileTransferController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDFileTransferController *)self temporaryFileURLByClientFileURL];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    BOOL v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "deleting temporary file at URL: %@", (uint8_t *)&v10, 0xCu);
    }

    [(id)objc_opt_class() deleteContentsAtURL:v7];
    id v9 = [(CSDFileTransferController *)self temporaryFileURLByClientFileURL];
    [v9 setObject:0 forKeyedSubscript:v4];
  }
}

- (CSDFileTransferringDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDFileTransferringDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSDIDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSMutableDictionary)clientFileURLByIdentifier
{
  return self->_clientFileURLByIdentifier;
}

- (NSMutableDictionary)temporaryFileURLByClientFileURL
{
  return self->_temporaryFileURLByClientFileURL;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_temporaryFileURLByClientFileURL, 0);
  objc_storeStrong((id *)&self->_clientFileURLByIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end