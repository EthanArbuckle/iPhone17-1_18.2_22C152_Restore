@interface SKFilesystemMaintainer
- (BOOL)repairWithError:(id *)a3;
- (BOOL)runMaintenanceOperationWithArgsCreator:(id)a3 error:(id *)a4;
- (BOOL)verifyWithError:(id *)a3;
- (FSClient)client;
- (NSArray)disks;
- (SKFilesystemMaintainer)initWithDisk:(id)a3;
- (SKFilesystemMaintainer)initWithDisks:(id)a3;
- (SKProgress)progress;
- (id)createReceiverUsingFSKit:(id)a3 opts:(id)a4 taskGroup:(id)a5 writable:(BOOL)a6;
- (void)setProgress:(id)a3;
@end

@implementation SKFilesystemMaintainer

- (SKFilesystemMaintainer)initWithDisk:(id)a3
{
  id v8 = a3;
  id v4 = a3;
  v5 = +[NSArray arrayWithObjects:&v8 count:1];

  v6 = -[SKFilesystemMaintainer initWithDisks:](self, "initWithDisks:", v5, v8);
  return v6;
}

- (SKFilesystemMaintainer)initWithDisks:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKFilesystemMaintainer;
  v6 = [(SKFilesystemMaintainer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_disks, a3);
    uint64_t v8 = +[SKProgress progressWithTotalUnitCount:100];
    progress = v7->_progress;
    v7->_progress = (SKProgress *)v8;
  }
  return v7;
}

- (FSClient)client
{
  client = self->_client;
  if (!client)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_client)
    {
      id v5 = (FSClient *)objc_opt_new();
      v6 = self->_client;
      self->_client = v5;
    }
    objc_sync_exit(v4);

    client = self->_client;
  }

  return client;
}

- (id)createReceiverUsingFSKit:(id)a3 opts:(id)a4 taskGroup:(id)a5 writable:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  objc_super v11 = a5;
  id v31 = a4;
  v12 = [SKFSTaskPair alloc];
  v13 = [SKFSTaskMessageHandler alloc];
  v14 = [(SKFilesystemMaintainer *)self progress];
  v15 = [(SKFSTaskMessageHandler *)v13 initWithProgress:v14 dispatchGroup:v11];
  v16 = [(SKFSTaskPair *)v12 initWithMessageHandler:v15];

  v17 = [v10 diskIdentifier];
  v30 = +[FSBlockDeviceResource proxyResourceForBSDName:v17 writable:v6];

  dispatch_group_enter(v11);
  v18 = [(SKFilesystemMaintainer *)self client];
  v19 = [v10 filesystem];
  v20 = [v19 bundle];
  v21 = [v20 bundleIdentifier];
  v22 = [(SKFSTaskPair *)v16 receiver];
  v23 = [v22 getConnection];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100028418;
  v32[3] = &unk_100049770;
  v24 = v16;
  v33 = v24;
  v34 = self;
  id v35 = v10;
  v36 = v11;
  v29 = v11;
  id v25 = v10;
  [v18 checkResource:v30 usingBundle:v21 options:v31 connection:v23 replyHandler:v32];

  v26 = v36;
  v27 = v24;

  return v27;
}

- (BOOL)runMaintenanceOperationWithArgsCreator:(id)a3 error:(id *)a4
{
  id v5 = (void (**)(id, void *, id *))a3;
  BOOL v6 = [(SKFilesystemMaintainer *)self disks];
  v7 = +[NSPredicate predicateWithBlock:&stru_1000497B0];
  uint64_t v8 = [v6 filteredArrayUsingPredicate:v7];

  if ([v8 count])
  {
    v9 = sub_10000DD48();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v70 = "-[SKFilesystemMaintainer runMaintenanceOperationWithArgsCreator:error:]";
      __int16 v71 = 2112;
      v72 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Cannot run maintenance operation on disks without filesystem, %@", buf, 0x16u);
    }

    id v10 = +[SKError errorWithCode:117 disks:v8 userInfo:0];
    unsigned __int8 v11 = +[SKError failWithError:v10 error:a4];
    goto LABEL_28;
  }
  v12 = [(SKFilesystemMaintainer *)self progress];
  [v12 setCompletedUnitCount:0];

  uint64_t v54 = objc_opt_new();
  v13 = objc_opt_new();
  dispatch_group_t v58 = dispatch_group_create();
  v14 = [(SKFilesystemMaintainer *)self disks];
  id v15 = [v14 count];

  if (!v15)
  {
LABEL_18:
    v38 = [SKWaitableAggregate alloc];
    id v10 = (void *)v54;
    v39 = [[SKTaskExecuter alloc] initWithTasks:v54];
    v67[0] = v39;
    v40 = [[SKFSTaskPairsWaiter alloc] initWithTaskPairs:v13];
    v67[1] = v40;
    v41 = +[NSArray arrayWithObjects:v67 count:2];
    v42 = [(SKWaitableAggregate *)v38 initWithWaitables:v41];

    unsigned __int8 v11 = [(SKWaitableAggregate *)v42 waitWithError:a4];
    goto LABEL_27;
  }
  v16 = self;
  uint64_t v17 = 0;
  v57 = v13;
  v55 = self;
  v56 = v5;
  while (1)
  {
    v18 = [(SKFilesystemMaintainer *)v16 disks];
    v19 = [v18 objectAtIndexedSubscript:v17];

    v20 = v5[2](v5, v19, a4);
    if (!v20)
    {
      v43 = v19;
      unsigned __int8 v11 = 0;
LABEL_23:

      id v10 = (void *)v54;
      v42 = v43;
      goto LABEL_27;
    }
    uint64_t v61 = v17;
    v21 = [(SKWaitableAggregate *)v19 filesystem];
    v22 = [v21 repairArgs];
    unsigned int v60 = [v20 containsObject:v22];

    v23 = [(SKWaitableAggregate *)v19 filesystem];
    LODWORD(v22) = [v23 isExtension];

    if (!v22)
    {
      v44 = objc_opt_new();
      [v44 addObjectsFromArray:v20];
      v45 = [(SKWaitableAggregate *)v19 filesystem];
      [v45 xmlOutputArg];
      v47 = v46 = v19;

      if (v47)
      {
        v48 = [(SKWaitableAggregate *)v46 filesystem];
        v49 = [v48 xmlOutputArg];
        [v44 addObject:v49];
      }
      v43 = v46;
      v50 = [(SKWaitableAggregate *)v46 diskIdentifier];
      v51 = +[NSString stringWithFormat:@"/dev/%@", v50];
      [v44 addObject:v51];

      unsigned __int8 v11 = +[SKError failWithPOSIXCode:45 error:a4];
      goto LABEL_23;
    }
    v59 = v19;
    v24 = [(SKWaitableAggregate *)v19 filesystem];
    id v25 = [v24 bundle];
    v26 = [v25 bundleIdentifier];
    v27 = sub_100027820(v26, 0, a4);

    if (!v27) {
      break;
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v28 = v20;
    id v29 = [v28 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v64;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v64 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v63 + 1) + 8 * i) stringByReplacingOccurrencesOfString:@"-" withString:&stru_10004A7A8];
          v34 = +[FSTaskOption optionWithoutValue:v33];
          [v27 addOption:v34];
        }
        id v30 = [v28 countByEnumeratingWithState:&v63 objects:v68 count:16];
      }
      while (v30);
    }

    v16 = v55;
    id v35 = [(SKFilesystemMaintainer *)v55 createReceiverUsingFSKit:v59 opts:v27 taskGroup:v58 writable:[(SKWaitableAggregate *)v59 isWritable] | v60];
    v13 = v57;
    [v57 addObject:v35];

    uint64_t v17 = v61 + 1;
    v36 = [(SKFilesystemMaintainer *)v55 disks];
    id v37 = [v36 count];

    id v5 = v56;
    if (v61 + 1 >= (unint64_t)v37) {
      goto LABEL_18;
    }
  }
  v52 = sub_10000DD48();
  id v10 = (void *)v54;
  v13 = v57;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v70 = "-[SKFilesystemMaintainer runMaintenanceOperationWithArgsCreator:error:]";
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%s: Failed to create bundle options", buf, 0xCu);
  }

  unsigned __int8 v11 = 0;
  v42 = v59;
LABEL_27:

LABEL_28:
  return v11;
}

- (BOOL)verifyWithError:(id *)a3
{
  id v5 = sub_10000DD48();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(SKFilesystemMaintainer *)self disks];
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[SKFilesystemMaintainer verifyWithError:]";
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Started verify on %@", buf, 0x16u);
  }
  id v15 = 0;
  unsigned __int8 v7 = [(SKFilesystemMaintainer *)self runMaintenanceOperationWithArgsCreator:&stru_1000497F0 error:&v15];
  id v8 = v15;
  v9 = sub_10000DD48();
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v11 = [(SKFilesystemMaintainer *)self disks];
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[SKFilesystemMaintainer verifyWithError:]";
      __int16 v18 = 2112;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Finished verify on %@", buf, 0x16u);
    }
    unsigned __int8 v12 = 1;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = [(SKFilesystemMaintainer *)self disks];
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[SKFilesystemMaintainer verifyWithError:]";
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to verify disk(s) %@", buf, 0x16u);
    }
    id v10 = +[SKError errorWithCode:350 underlyingError:v8];
    unsigned __int8 v12 = +[SKError failWithError:v10 error:a3];
  }

  return v12;
}

- (BOOL)repairWithError:(id *)a3
{
  id v4 = sub_10000DD48();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(SKFilesystemMaintainer *)self disks];
    *(_DWORD *)buf = 136315394;
    id v37 = "-[SKFilesystemMaintainer repairWithError:]";
    __int16 v38 = 2112;
    v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Started repair on %@", buf, 0x16u);
  }
  id v32 = 0;
  unsigned __int8 v6 = [(SKFilesystemMaintainer *)self runMaintenanceOperationWithArgsCreator:&stru_100049810 error:&v32];
  id v7 = v32;
  id v8 = v7;
  if (v6)
  {
    id v25 = v7;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obj = [(SKFilesystemMaintainer *)self disks];
    id v9 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v29;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v14 = +[SKManager syncSharedManager];
          uint64_t v15 = [v13 diskIdentifier];
          v16 = [v14 diskForString:v15];

          uint64_t v33 = kSKDiskMountOptionRestore;
          v34 = &__kCFBooleanTrue;
          uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
          LOBYTE(v15) = [v16 mountWithOptionsDictionary:v17 error:a3];

          if ((v15 & 1) == 0)
          {
            v23 = sub_10000DD48();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              id v37 = "-[SKFilesystemMaintainer repairWithError:]";
              __int16 v38 = 2112;
              v39 = v16;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Failed to remount disk %@ after repair", buf, 0x16u);
            }

            unsigned __int8 v20 = 0;
            id v8 = v25;
            __int16 v18 = obj;
            goto LABEL_21;
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    __int16 v18 = sub_10000DD48();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(SKFilesystemMaintainer *)self disks];
      *(_DWORD *)buf = 136315394;
      id v37 = "-[SKFilesystemMaintainer repairWithError:]";
      __int16 v38 = 2112;
      v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Finished repair on %@", buf, 0x16u);
    }
    unsigned __int8 v20 = 1;
    id v8 = v25;
  }
  else
  {
    v21 = sub_10000DD48();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = [(SKFilesystemMaintainer *)self disks];
      *(_DWORD *)buf = 136315394;
      id v37 = "-[SKFilesystemMaintainer repairWithError:]";
      __int16 v38 = 2112;
      v39 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: Failed to repair disk(s) %@", buf, 0x16u);
    }
    __int16 v18 = +[SKError errorWithCode:351 underlyingError:v8];
    unsigned __int8 v20 = +[SKError failWithError:v18 error:a3];
  }
LABEL_21:

  return v20;
}

- (NSArray)disks
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (SKProgress)progress
{
  return (SKProgress *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_disks, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end