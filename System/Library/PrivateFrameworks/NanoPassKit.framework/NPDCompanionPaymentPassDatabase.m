@interface NPDCompanionPaymentPassDatabase
- (NPDCompanionPaymentPassDatabase)initWithDevice:(id)a3 outstandingDeletionStore:(id)a4;
- (NPDOutstandingPassDeletionStore)outstandingDeletionStore;
- (NSSet)uniqueIDs;
- (NSString)catalogPath;
- (NSString)paymentPassDirectoryPath;
- (OS_dispatch_queue)queue;
- (PKCatalog)catalog;
- (id)_paymentPassFromURL:(id)a3;
- (id)_paymentPassWithUniqueID:(id)a3;
- (id)paymentPassWithUniqueID:(id)a3;
- (void)_postPaymentPassDatabaseChanged;
- (void)_savePaymentLockedPassAtURL:(id)a3 withUniqueID:(id)a4 completion:(id)a5;
- (void)removePaymentPassWithUniqueID:(id)a3 completion:(id)a4;
- (void)savePaymentPass:(id)a3 requireExisting:(BOOL)a4 requireNewer:(BOOL)a5 completion:(id)a6;
- (void)setCatalog:(id)a3 fromWatch:(BOOL)a4;
- (void)setCatalogPath:(id)a3;
- (void)setPaymentPassDirectoryPath:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation NPDCompanionPaymentPassDatabase

- (NPDCompanionPaymentPassDatabase)initWithDevice:(id)a3 outstandingDeletionStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Companion payment pass database initializing with device: %@", buf, 0xCu);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)NPDCompanionPaymentPassDatabase;
  v11 = [(NPDCompanionPaymentPassDatabase *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_outstandingDeletionStore, a4);
    uint64_t v13 = NPKPaymentPassDirectoryPathForDevice();
    paymentPassDirectoryPath = v12->_paymentPassDirectoryPath;
    v12->_paymentPassDirectoryPath = (NSString *)v13;

    uint64_t v15 = NPKCatalogPathForDevice();
    catalogPath = v12->_catalogPath;
    v12->_catalogPath = (NSString *)v15;

    v17 = +[NSFileManager defaultManager];
    [v17 createDirectoryAtPath:v12->_paymentPassDirectoryPath withIntermediateDirectories:1 attributes:0 error:0];

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.NPDCompanionPaymentPassDatabase", 0);
    [(NPDCompanionPaymentPassDatabase *)v12 setQueue:v18];
  }
  return v12;
}

- (void)savePaymentPass:(id)a3 requireExisting:(BOOL)a4 requireNewer:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = pk_General_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Notice: Companion payment pass database saving payment pass: %@", buf, 0xCu);
    }
  }
  uint64_t v15 = [(NPDCompanionPaymentPassDatabase *)self queue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006CEC;
  v18[3] = &unk_10006CE18;
  v18[4] = self;
  id v19 = v10;
  BOOL v21 = a4;
  id v20 = v11;
  BOOL v22 = a5;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(v15, v18);
}

- (void)removePaymentPassWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NPDCompanionPaymentPassDatabase *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007480;
  block[3] = &unk_10006CEA0;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (NSSet)uniqueIDs
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = sub_100007B6C;
  id v14 = sub_100007B7C;
  id v15 = 0;
  v3 = [(NPDCompanionPaymentPassDatabase *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007B84;
  v9[3] = &unk_10006CEC8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v3, v9);

  v4 = pk_Payment_log();
  LODWORD(v3) = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v11[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Payment pass unique IDs: %@", buf, 0xCu);
    }
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSSet *)v7;
}

- (id)paymentPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  dispatch_queue_t v18 = sub_100007B6C;
  id v19 = sub_100007B7C;
  id v20 = 0;
  v5 = [(NPDCompanionPaymentPassDatabase *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007FE0;
  block[3] = &unk_10006CEF0;
  id v14 = &v15;
  void block[4] = self;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync(v5, block);

  id v7 = pk_Payment_log();
  LODWORD(v5) = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v16[5];
      *(_DWORD *)buf = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: Payment pass with uniqueID %@: %@", buf, 0x16u);
    }
  }
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)setCatalog:(id)a3 fromWatch:(BOOL)a4
{
  id v6 = a3;
  id v7 = NPKSecureArchiveObject();
  catalogPath = self->_catalogPath;
  id v16 = 0;
  [v7 writeToFile:catalogPath options:1 error:&v16];
  id v9 = v16;
  if (v9)
  {
    id v10 = pk_Sync_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      uint64_t v12 = pk_Sync_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error: Payment pass database: unable to write catalog to disk\n\tError: %@", buf, 0xCu);
      }
    }
  }
  if (v6)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000081C4;
    v13[3] = &unk_10006CF30;
    v13[4] = self;
    id v14 = v6;
    BOOL v15 = a4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
  }
}

- (PKCatalog)catalog
{
  catalogPath = self->_catalogPath;
  id v10 = 0;
  v3 = +[NSData dataWithContentsOfFile:catalogPath options:0 error:&v10];
  id v4 = v10;
  if (v4)
  {
    v5 = pk_Sync_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = pk_Sync_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: Payment pass database: Unable to read catalog.\n\tError: %@", buf, 0xCu);
      }
    }
    v8 = 0;
  }
  else
  {
    objc_opt_class();
    v8 = NPKSecureUnarchiveObject();
  }

  return (PKCatalog *)v8;
}

- (id)_paymentPassWithUniqueID:(id)a3
{
  id v4 = NPKStorePathForPaymentPassWithUniqueID();
  v5 = +[NSURL fileURLWithPath:v4];
  BOOL v6 = [(NPDCompanionPaymentPassDatabase *)self _paymentPassFromURL:v5];

  return v6;
}

- (void)_savePaymentLockedPassAtURL:(id)a3 withUniqueID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(NPDCompanionPaymentPassDatabase *)self paymentPassDirectoryPath];
  v34 = v9;
  id v12 = [v9 stringByAppendingPathExtension:PKRawPassExtension];
  id v13 = [v11 stringByAppendingPathComponent:v12];
  id v14 = +[NSURL fileURLWithPath:v13];

  BOOL v15 = +[NSFileManager defaultManager];
  id v16 = [(NPDCompanionPaymentPassDatabase *)self paymentPassDirectoryPath];
  [v15 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:0];

  uint64_t v17 = PKTemporaryItemURLWithExtension();
  unsigned int v18 = [v15 moveItemAtURL:v14 toURL:v17 error:0];
  [v15 removeItemAtURL:v14 error:0];
  id v42 = 0;
  unsigned int v19 = [v15 copyItemAtURL:v8 toURL:v14 error:&v42];
  id v33 = v42;
  if (v19)
  {
    NPKFlushCFBundleCacheAtURL();
    id v20 = pk_Payment_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      id v22 = pk_Payment_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v44 = v8;
        __int16 v45 = 2112;
        id v46 = v14;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Notice: Successfully copied payment pass from %@ to %@", buf, 0x16u);
      }
    }
    __int16 v23 = @"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.PassAdded";
    if (v18) {
      __int16 v23 = @"com.apple.NanoPassKit.NPDCompanionPaymentPassDatabase.PassUpdated";
    }
    uint64_t v24 = v23;
    v25 = [(NPDCompanionPaymentPassDatabase *)self _paymentPassFromURL:v8];
    if (v25)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000893C;
      block[3] = &unk_10006CF68;
      v39 = v24;
      v40 = self;
      id v41 = v25;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    [(NPDCompanionPaymentPassDatabase *)self _postPaymentPassDatabaseChanged];

LABEL_11:
    goto LABEL_22;
  }
  v26 = pk_Payment_log();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

  if (v27)
  {
    v28 = pk_Payment_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v44 = v34;
      __int16 v45 = 2112;
      id v46 = v8;
      __int16 v47 = 2112;
      v48 = v14;
      __int16 v49 = 2112;
      id v50 = v33;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Error: Failed to write pass with unique ID %@ from %@ to %@ (%@)", buf, 0x2Au);
    }
  }
  char v29 = v18 ^ 1;
  if (!v17) {
    char v29 = 1;
  }
  if ((v29 & 1) == 0)
  {
    unsigned int v30 = [v15 moveItemAtURL:v17 toURL:v14 error:0];
    v31 = pk_Payment_log();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

    if (v32)
    {
      uint64_t v24 = pk_Payment_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v44 = v34;
        __int16 v45 = 2112;
        id v46 = v14;
        __int16 v47 = 1024;
        LODWORD(v48) = v30;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Notice: Restored previous version of pass with unique ID %@ to %@ success %d", buf, 0x1Cu);
      }
      goto LABEL_11;
    }
  }
LABEL_22:
  if (v10)
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000089FC;
    v35[3] = &unk_10006CF90;
    id v36 = v10;
    char v37 = v19;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v35);
  }
}

- (id)_paymentPassFromURL:(id)a3
{
  v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  v5 = [v3 path];
  unsigned int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v28 = 0;
    id v7 = [objc_alloc((Class)PKFileDataAccessor) initWithFileURL:v3 error:&v28];
    id v8 = v28;
    id v9 = v8;
    if (!v7 || v8)
    {
      if (!v8) {
        goto LABEL_23;
      }
      BOOL v15 = pk_Sync_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (!v16) {
        goto LABEL_23;
      }
      uint64_t v17 = pk_Sync_log();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412546;
      unsigned int v30 = v7;
      __int16 v31 = 2112;
      id v32 = v9;
      unsigned int v18 = "Error: Error creating data accessor (%@). Error: %@";
    }
    else
    {
      id v27 = 0;
      id v10 = +[PKPass createWithFileDataAccessor:v7 validationOptions:2 warnings:0 error:&v27];
      id v9 = v27;
      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          BOOL v11 = NPKPairedDeviceSecureElementIdentifiers();
          if ([v11 count])
          {
            id v12 = [v10 secureElementPass];
            [v12 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v11];
          }
          NPKGizmoScreenScale();
          -[NSObject setPreferredImageScale:](v10, "setPreferredImageScale:");
          [v10 setPreferredImageSuffix:NPKWatchSpecificAssetSuffix];
          [v10 flushLoadedImageSets];

          goto LABEL_32;
        }
        __int16 v23 = pk_General_log();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

        if (v24)
        {
          v25 = pk_General_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            unsigned int v30 = v3;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error: Pass at URL %@ was not a payment pass", buf, 0xCu);
          }
        }
        goto LABEL_30;
      }
      unsigned int v19 = pk_Sync_log();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v20)
      {
LABEL_23:
        BOOL v21 = pk_General_log();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

        if (!v22)
        {
LABEL_31:
          id v10 = 0;
          goto LABEL_32;
        }
        id v10 = pk_General_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          unsigned int v30 = v3;
          __int16 v31 = 2112;
          id v32 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error: Could not initialize pass at URL %@ error %@", buf, 0x16u);
        }
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v17 = pk_Sync_log();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        goto LABEL_23;
      }
      *(_DWORD *)buf = 138412546;
      unsigned int v30 = v3;
      __int16 v31 = 2112;
      id v32 = v9;
      unsigned int v18 = "Error: Unable to create a pass from this pass URL! %@. Error: %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
    goto LABEL_22;
  }
  id v13 = pk_General_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (!v14)
  {
    id v10 = 0;
    id v9 = 0;
    goto LABEL_33;
  }
  id v7 = pk_General_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v30 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: No payment pass at URL %@", buf, 0xCu);
  }
  id v10 = 0;
  id v9 = 0;
LABEL_32:

LABEL_33:
  return v10;
}

- (void)_postPaymentPassDatabaseChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008E94;
  block[3] = &unk_10006CFC0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (NPDOutstandingPassDeletionStore)outstandingDeletionStore
{
  return self->_outstandingDeletionStore;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSString)paymentPassDirectoryPath
{
  return self->_paymentPassDirectoryPath;
}

- (void)setPaymentPassDirectoryPath:(id)a3
{
}

- (NSString)catalogPath
{
  return self->_catalogPath;
}

- (void)setCatalogPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogPath, 0);
  objc_storeStrong((id *)&self->_paymentPassDirectoryPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_outstandingDeletionStore, 0);
}

@end