@interface SKEjectOperation
- (BOOL)run;
- (SKDisk)diskToEject;
- (SKEjectOperation)initWithDisk:(id)a3 withCompletionBlock:(id)a4;
- (id)_wholeDisksToEject;
- (id)description;
- (int64_t)defaultErrorCode;
- (void)_deepUnmountWithWholeDisk:(id)a3;
- (void)setDiskToEject:(id)a3;
@end

@implementation SKEjectOperation

- (SKEjectOperation)initWithDisk:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SKEjectOperation;
  v7 = [(SKBaseDiskArbOperation *)&v14 initWithTarget:v6 options:&__NSDictionary0__struct callbackBlock:a4];
  if (v7)
  {
    v8 = +[SKDaemonManager sharedManager];
    v9 = [v8 wholeDiskForDisk:v6];

    if (v9) {
      v10 = v9;
    }
    else {
      v10 = v6;
    }
    v11 = v10;
    diskToEject = v7->_diskToEject;
    v7->_diskToEject = v11;
  }
  return v7;
}

- (id)_wholeDisksToEject
{
  v3 = +[SKDaemonManager sharedManager];
  v4 = +[NSMutableSet set];
  v5 = [(SKEjectOperation *)self diskToEject];
  id v6 = [(SKEjectOperation *)self diskToEject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v8 = [(SKEjectOperation *)self diskToEject];
  v9 = v8;
  if (isKindOfClass)
  {
    v10 = [v8 physicalStores];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        objc_super v14 = 0;
        v15 = v5;
        do
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          v5 = [v3 wholeDiskForDisk:*(void *)(*((void *)&v31 + 1) + 8 * (void)v14)];

          if (v5) {
            [v4 addObject:v5];
          }
          objc_super v14 = (char *)v14 + 1;
          v15 = v5;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v12);
    }
  }
  else
  {
    [v4 addObject:v8];
  }

  v16 = +[NSMutableArray array];
  v17 = [v5 children];
  v18 = v17;
  if (v17)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v24 = [v23 container];
            if (v24) {
              [v16 addObject:v24];
            }
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v20);
    }
  }
  v25 = [v4 allObjects];
  [v16 addObjectsFromArray:v25];

  return v16;
}

- (void)_deepUnmountWithWholeDisk:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  v5 = [v3 children];
  if (v5) {
    [v4 addObjectsFromArray:v5];
  }
  [v4 addObject:v3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = kSKDiskMountOptionRecursive;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v18 = v9;
        id v19 = &__kCFBooleanTrue;
        id v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        +[SKUnmountOperation unmountWithDisk:v11 options:v12 error:0];
      }
      id v7 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }
}

- (BOOL)run
{
  id v3 = [(SKEjectOperation *)self _wholeDisksToEject];
  v4 = sub_10000DD48();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v30 = "-[SKEjectOperation run]";
    __int16 v31 = 1024;
    LODWORD(v32) = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Ejecting %d disks", buf, 0x12u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (!v6)
  {
LABEL_22:

LABEL_26:
    uint64_t v21 = +[SKDaemonManager sharedManager];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002E498;
    v24[3] = &unk_100048B88;
    v24[4] = self;
    [v21 syncAllDisksWithCompletionBlock:v24];

    BOOL v20 = 1;
    goto LABEL_27;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v26;
  v23 = v5;
LABEL_5:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v26 != v8) {
      objc_enumerationMutation(v5);
    }
    v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
    [(SKEjectOperation *)self _deepUnmountWithWholeDisk:v10];
    uint64_t v11 = sub_10000DD48();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v30 = "-[SKEjectOperation run]";
      __int16 v31 = 2112;
      long long v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Ejecting %@", buf, 0x16u);
    }

    id v12 = [v10 daDisk];
    if (!v12) {
      goto LABEL_20;
    }
    uint64_t v13 = +[NSString stringWithFormat:@"Eject of %@", v10];
    [(SKBaseDiskArbOperation *)self setCurrentOperationName:v13];

    DADiskEject(v12, 0, (DADiskEjectCallback)sub_100019AEC, self);
    if (![(SKBaseDiskArbOperation *)self completeDiskArbOp]) {
      break;
    }
LABEL_17:
    long long v17 = sub_10000DD48();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v30 = "-[SKEjectOperation run]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Ejected", buf, 0xCu);
    }

LABEL_20:
    if (v7 == (id)++v9)
    {
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v7) {
        goto LABEL_5;
      }
      goto LABEL_22;
    }
  }
  long long v14 = [(SKEjectOperation *)self diskToEject];
  if (([v10 isEqual:v14] & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_24;
    }
    long long v16 = sub_10000DD48();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v30 = "-[SKEjectOperation run]";
      __int16 v31 = 2112;
      long long v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: %@ failed to eject, continue anyway", buf, 0x16u);
    }

    id v5 = v23;
    goto LABEL_17;
  }

LABEL_24:
  id v18 = [(SKBaseDiskArbOperation *)self newDAError];

  id v5 = v23;
  if (!v18) {
    goto LABEL_26;
  }
  id v19 = [(SKBaseDiskArbOperation *)self callbackBlock];
  ((void (**)(void, id))v19)[2](v19, v18);

  [(SKManagerOperation *)self finished];
  BOOL v20 = 0;
LABEL_27:

  return v20;
}

- (id)description
{
  v2 = [(SKEjectOperation *)self diskToEject];
  id v3 = +[NSString stringWithFormat:@"Eject Operation for %@", v2];

  return v3;
}

- (int64_t)defaultErrorCode
{
  return 403;
}

- (SKDisk)diskToEject
{
  return (SKDisk *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDiskToEject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end