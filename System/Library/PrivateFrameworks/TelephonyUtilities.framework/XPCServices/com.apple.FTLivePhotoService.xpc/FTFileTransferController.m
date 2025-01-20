@interface FTFileTransferController
+ (id)copyFileAtURL:(id)a3 toTemporaryFileWithName:(id)a4;
+ (id)renameResourceAtURL:(id)a3 toResourceWithName:(id)a4;
+ (id)renamedResourceURL:(id)a3 withName:(id)a4;
+ (void)deleteContentsAtURL:(id)a3;
- (FTFileSandboxDelegate)sandboxDelegate;
- (FTFileTransferController)initWithService:(id)a3 serverBag:(id)a4;
- (FTFileTransferringDelegate)delegate;
- (FTIDSService)service;
- (FTMomentsServerBag)serverBag;
- (NSMutableDictionary)clientFileURLByIdentifier;
- (NSMutableDictionary)temporaryFileURLByClientFileURL;
- (NSMutableDictionary)transactionIDByIDSFileIdentifier;
- (OS_dispatch_queue)queue;
- (void)cleanUpTemporaryFileIfExistsForClientFileURL:(id)a3;
- (void)performFileCopierOperation:(unint64_t)a3 onInputURL:(id)a4 outputURL:(id)a5 completion:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)setDelegate:(id)a3;
- (void)setSandboxDelegate:(id)a3;
- (void)setService:(id)a3;
- (void)transferFileAtTemporaryURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5;
- (void)transferFileAtURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5;
- (void)unzipArchiveAtURL:(id)a3 completion:(id)a4;
- (void)zipDirectoryAtURL:(id)a3 completion:(id)a4;
@end

@implementation FTFileTransferController

- (FTFileTransferController)initWithService:(id)a3 serverBag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)FTFileTransferController;
  v9 = [(FTFileTransferController *)&v22 init];
  if (v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clientFileURLByIdentifier = v9->_clientFileURLByIdentifier;
    v9->_clientFileURLByIdentifier = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    temporaryFileURLByClientFileURL = v9->_temporaryFileURLByClientFileURL;
    v9->_temporaryFileURLByClientFileURL = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    transactionIDByIDSFileIdentifier = v9->_transactionIDByIDSFileIdentifier;
    v9->_transactionIDByIDSFileIdentifier = v14;

    objc_storeStrong((id *)&v9->_service, a3);
    objc_storeStrong((id *)&v9->_serverBag, a4);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.telephonyutilities.FTFileTransfercontroller", v17);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v18;
    v20 = v18;

    [(FTIDSService *)v9->_service addServiceDelegate:v9 queue:v9->_queue];
  }

  return v9;
}

- (void)transferFileAtURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = FTDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "transferFileAtURL: %@, destinations: %@", buf, 0x16u);
  }

  v12 = [(FTFileTransferController *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100009018;
  v16[3] = &unk_100051130;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)unzipArchiveAtURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 URLByDeletingLastPathComponent];
  id v9 = FTDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "placing unzip results into folder %@", buf, 0xCu);
  }

  id v10 = [(FTFileTransferController *)self queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000091A8;
  v14[3] = &unk_1000513B0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v7;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v10, v14);
}

- (void)transferFileAtTemporaryURL:(id)a3 toDestinations:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(FTFileTransferController *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = FTDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v9 allObjects];
    id v14 = TULoggableStringForHandles();
    *(_DWORD *)buf = 138412546;
    id v34 = v8;
    __int16 v35 = 2112;
    v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "temporaryClientFileURL: %@, destinations: %@", buf, 0x16u);
  }
  buf[0] = 0;
  id v15 = +[NSFileManager defaultManager];
  id v16 = [v8 path];
  unsigned int v17 = [v15 fileExistsAtPath:v16 isDirectory:buf];

  if (v17)
  {
    id v18 = +[NSMutableDictionary dictionary];
    id v19 = +[NSNumber numberWithBool:buf[0]];
    [v18 setObject:v19 forKeyedSubscript:@"CSDFileTransferringMetadataKeyIsDirectory"];

    [v18 setObject:v10 forKeyedSubscript:@"CSDFileTransferringMetadataKeyUserData"];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100009800;
    v27[3] = &unk_1000513D8;
    id v28 = v9;
    v20 = v18;
    v29 = v20;
    id v30 = v10;
    v31 = self;
    id v21 = v8;
    id v32 = v21;
    __int16 v22 = objc_retainBlock(v27);
    id v23 = v22;
    if (buf[0])
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100009AB8;
      v24[3] = &unk_100051400;
      v24[4] = self;
      id v25 = v21;
      id v26 = v23;
      [(FTFileTransferController *)self zipDirectoryAtURL:v25 completion:v24];
    }
    else
    {
      ((void (*)(void *, id))v22[2])(v22, v21);
    }
  }
  else
  {
    v20 = FTDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10003C9C8();
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(FTFileTransferController *)self queue];
  dispatch_assert_queue_V2(v16);

  unsigned int v17 = FTDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v12 serviceIdentifier];
    id v19 = IDSLoggableDescriptionForHandleOnService();
    *(_DWORD *)buf = 138412802;
    id v38 = v13;
    __int16 v39 = 2112;
    id v40 = v14;
    __int16 v41 = 2112;
    v42 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "incomingResourceURL: %@ metadata: %@ fromID: %@", buf, 0x20u);
  }
  v20 = [v14 objectForKeyedSubscript:@"CSDFileTransferringMetadataKeyIsDirectory"];
  unsigned __int8 v21 = [v20 BOOLValue];

  __int16 v22 = [v14 objectForKeyedSubscript:@"CSDFileTransferringMetadataKeyUserData"];
  id v23 = [v22 objectForKeyedSubscript:@"CSDMomentsControllerMetadataKeyTransactionID"];
  dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
  id v25 = [(FTFileTransferController *)self sandboxDelegate];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100009DE4;
  v31[3] = &unk_100051428;
  v31[4] = self;
  id v32 = v13;
  unsigned __int8 v36 = v21;
  id v33 = v22;
  id v34 = v15;
  dispatch_semaphore_t v35 = v24;
  id v26 = v24;
  id v27 = v15;
  id v28 = v22;
  id v29 = v13;
  [v25 requestSandboxExtensionForTransactionID:v23 reply:v31];

  dispatch_time_t v30 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v26, v30);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(FTFileTransferController *)self queue];
  dispatch_assert_queue_V2(v16);

  unsigned int v17 = FTDefaultLog();
  id v18 = v17;
  if (v8)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "successfully sent file with identifier: %@", (uint8_t *)&v27, 0xCu);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    sub_10003CAB4();
  }

  id v19 = [(FTFileTransferController *)self clientFileURLByIdentifier];
  v20 = [v19 objectForKeyedSubscript:v14];

  if (v20)
  {
    [(FTFileTransferController *)self cleanUpTemporaryFileIfExistsForClientFileURL:v20];
    unsigned __int8 v21 = [(FTFileTransferController *)self delegate];
    __int16 v22 = [(FTFileTransferController *)self transactionIDByIDSFileIdentifier];
    id v23 = [v22 objectForKeyedSubscript:v14];
    [v21 fileTransferer:self didTransferFileAtURL:v20 transactionID:v23 successfully:v8];

    dispatch_semaphore_t v24 = [(FTFileTransferController *)self clientFileURLByIdentifier];
    [v24 setObject:0 forKeyedSubscript:v14];

    id v25 = [(FTFileTransferController *)self transactionIDByIDSFileIdentifier];
    [v25 setObject:0 forKeyedSubscript:v14];
  }
  else
  {
    id v25 = FTDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [(FTFileTransferController *)self clientFileURLByIdentifier];
      int v27 = 138413570;
      id v28 = v12;
      __int16 v29 = 2112;
      id v30 = v13;
      __int16 v31 = 2112;
      id v32 = v14;
      __int16 v33 = 1024;
      BOOL v34 = v8;
      __int16 v35 = 2112;
      id v36 = v15;
      __int16 v37 = 2112;
      id v38 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[WARN] Unexpected nil clientFileURL for service: %@, account: %@, identifier: %@, didSendWithSuccess: %d, error: %@, clientFileURLByIdentifier: %@", (uint8_t *)&v27, 0x3Au);
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
    id v19 = FTDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10003CB1C();
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
    id v19 = FTDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v5;
      __int16 v26 = 2112;
      int v27 = v14;
      __int16 v28 = 2112;
      id v29 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to copy URL at %@ to %@: %@", buf, 0x20u);
    }
LABEL_9:
    id v18 = v14;

    id v14 = 0;
    goto LABEL_10;
  }
  id v18 = v14;
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
    id v11 = FTDefaultLog();
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

  id v7 = FTDefaultLog();
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
    sub_10003C124();
  }
}

- (void)zipDirectoryAtURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(FTFileTransferController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = NSTemporaryDirectory();
  id v10 = +[NSUUID UUID];
  id v11 = [v10 UUIDString];
  id v12 = [v9 stringByAppendingPathComponent:v11];
  id v13 = [v12 stringByAppendingPathExtension:@"zip"];

  id v14 = +[NSURL fileURLWithPath:v13];
  id v15 = FTDefaultLog();
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
  v19[2] = sub_10000A924;
  v19[3] = &unk_100051450;
  id v20 = v6;
  id v21 = v14;
  id v22 = v7;
  id v16 = v7;
  id v17 = v14;
  id v18 = v6;
  [(FTFileTransferController *)self performFileCopierOperation:0 onInputURL:v18 outputURL:v17 completion:v19];
}

- (void)performFileCopierOperation:(unint64_t)a3 onInputURL:(id)a4 outputURL:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(FTFileTransferController *)self queue];
  dispatch_assert_queue_V2(v13);

  id v14 = FTDefaultLog();
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
  id v19 = [(FTFileTransferController *)self queue];
  id v20 = [v15 initWithInputURL:v18 outputURL:v17 identifier:0 operation:a3 completionBlock:&v21 queue:v19];

  [v20 start];
}

- (void)cleanUpTemporaryFileIfExistsForClientFileURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FTFileTransferController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(FTFileTransferController *)self temporaryFileURLByClientFileURL];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    BOOL v8 = FTDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "deleting temporary file at URL: %@", (uint8_t *)&v10, 0xCu);
    }

    [(id)objc_opt_class() deleteContentsAtURL:v7];
    id v9 = [(FTFileTransferController *)self temporaryFileURLByClientFileURL];
    [v9 setObject:0 forKeyedSubscript:v4];
  }
}

- (FTFileTransferringDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FTFileTransferringDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FTFileSandboxDelegate)sandboxDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sandboxDelegate);

  return (FTFileSandboxDelegate *)WeakRetained;
}

- (void)setSandboxDelegate:(id)a3
{
}

- (FTMomentsServerBag)serverBag
{
  return self->_serverBag;
}

- (FTIDSService)service
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

- (NSMutableDictionary)transactionIDByIDSFileIdentifier
{
  return self->_transactionIDByIDSFileIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transactionIDByIDSFileIdentifier, 0);
  objc_storeStrong((id *)&self->_temporaryFileURLByClientFileURL, 0);
  objc_storeStrong((id *)&self->_clientFileURLByIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_destroyWeak((id *)&self->_sandboxDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end