@interface SKBaseDiskArbOperation
+ (id)getMountState:(id)a3;
+ (void)clearMountState:(id)a3;
+ (void)storeMountState:(id)a3;
- (BOOL)completeDiskArbOp;
- (BOOL)diskArbOpDone;
- (BOOL)raidTraverse;
- (BOOL)recursive;
- (BOOL)run;
- (BOOL)toOperateWithDisk:(id)a3;
- (NSDictionary)options;
- (NSString)DAstatusString;
- (NSString)currentOperationName;
- (SKBaseDiskArbOperation)initWithTarget:(id)a3 options:(id)a4 callbackBlock:(id)a5;
- (id)callbackBlock;
- (id)diskWithFSRefresh:(id)a3;
- (id)disksForOperationWithTarget:(id)a3 ignoreGroup:(BOOL)a4;
- (id)newDAError;
- (id)newPerformOperation;
- (int)DAstatus;
- (int)dissenterPID;
- (int64_t)defaultErrorCode;
- (void)diskArbCallbackWithDissenter:(__DADissenter *)a3;
- (void)removeWithMountPoint:(id)a3;
- (void)setCallbackBlock:(id)a3;
- (void)setCurrentOperationName:(id)a3;
- (void)setDAstatus:(int)a3;
- (void)setDAstatusString:(id)a3;
- (void)setDiskArbOpDone:(BOOL)a3;
- (void)setDissenterPID:(int)a3;
- (void)setOptions:(id)a3;
@end

@implementation SKBaseDiskArbOperation

+ (void)storeMountState:(id)a3
{
  id v7 = a3;
  v3 = [v7 mountPoint];

  if (v3)
  {
    v4 = [SKMountState alloc];
    v5 = [v7 mountPoint];
    v6 = [(SKMountState *)v4 initWithMountPoint:v5];

    [v7 setPreviousMount:v6];
  }
}

+ (id)getMountState:(id)a3
{
  return [a3 previousMount];
}

+ (void)clearMountState:(id)a3
{
}

- (SKBaseDiskArbOperation)initWithTarget:(id)a3 options:(id)a4 callbackBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SKBaseDiskArbOperation;
  v11 = [(SKManagerOperation *)&v23 init];
  if (v8
    && ([v8 daDisk], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v13 = (void *)v12, unsigned int v14 = [v8 isValid], v13, v14)
    && v11)
  {
    if (v9) {
      v15 = v9;
    }
    else {
      v15 = &__NSDictionary0__struct;
    }
    objc_storeStrong((id *)&v11->_options, v15);
    id v16 = [v10 copy];
    id callbackBlock = v11->_callbackBlock;
    v11->_id callbackBlock = v16;

    v18 = v11;
  }
  else
  {
    v19 = +[SKBaseManager sharedManager];
    [v19 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_100049270];

    v20 = sub_10000DD48();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "-[SKBaseDiskArbOperation initWithTarget:options:callbackBlock:]";
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2112;
      v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s: Reached with invalid disk (%@) or init failed (%@)", buf, 0x20u);
    }

    if (v10)
    {
      v21 = +[SKError errorWithCode:102 userInfo:0];
      (*((void (**)(id, void *))v10 + 2))(v10, v21);
    }
    v18 = 0;
  }

  return v18;
}

- (BOOL)recursive
{
  v2 = [(SKBaseDiskArbOperation *)self options];
  v3 = [v2 objectForKeyedSubscript:kSKDiskMountOptionRecursive];

  if (sub_10001217C(v3)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)raidTraverse
{
  v2 = [(SKBaseDiskArbOperation *)self options];
  v3 = [v2 objectForKeyedSubscript:kSKDiskMountOptionRecursiveRAID];

  LOBYTE(v2) = sub_100012340(v3);
  return (char)v2;
}

- (id)diskWithFSRefresh:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 filesystem];
  if (v4)
  {

LABEL_5:
    id v7 = v3;
    goto LABEL_6;
  }
  if (([v3 isIOMediaDisk] & 1) == 0) {
    goto LABEL_5;
  }
  v5 = [v3 diskIdentifier];
  v6 = +[NSString stringWithFormat:@"/dev/%@", v5];
  id v7 = +[SKMediaKit getMediaKitFilesystemType:v6];

  if (v7) {
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

- (id)disksForOperationWithTarget:(id)a3 ignoreGroup:(BOOL)a4
{
  id v5 = a3;
  id v63 = +[NSMutableSet set];
  if ([(SKBaseDiskArbOperation *)self recursive])
  {
    v6 = +[NSMutableArray arrayWithObject:v5];
    if ([v5 isWholeDisk])
    {
      id v7 = [v5 children];
      if (v7) {
        [v6 addObjectsFromArray:v7];
      }
    }
    v57 = v5;
    [(SKBaseDiskArbOperation *)self raidTraverse];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = v6;
    id v8 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v73;
      uint64_t v58 = *(void *)v73;
      do
      {
        v11 = 0;
        id v60 = v9;
        do
        {
          if (*(void *)v73 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(id *)(*((void *)&v72 + 1) + 8 * (void)v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [v12 container];
            if (!v13) {
              goto LABEL_58;
            }
            unsigned int v14 = (void *)v13;

            id v12 = v14;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = v11;
            id v16 = v12;
            id v17 = v12;
            v18 = [v17 volumes];
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            id v19 = [v18 countByEnumeratingWithState:&v68 objects:v77 count:16];
            if (v19)
            {
              id v20 = v19;
              uint64_t v21 = *(void *)v69;
              do
              {
                for (i = 0; i != v20; i = (char *)i + 1)
                {
                  if (*(void *)v69 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v23 = *(void *)(*((void *)&v68 + 1) + 8 * i);
                  if ([(SKBaseDiskArbOperation *)self toOperateWithDisk:v23]) {
                    [v63 addObject:v23];
                  }
                }
                id v20 = [v18 countByEnumeratingWithState:&v68 objects:v77 count:16];
              }
              while (v20);
            }

            id v9 = v60;
            v11 = v15;
            id v12 = v16;
            goto LABEL_57;
          }
          v24 = [v12 type];
          if ([v24 isEqualToString:kSKDiskTypeEFI])
          {
            v25 = v11;
            id v26 = v12;
            id v27 = [v12 diskIdentifier];
            __int16 v28 = [v57 diskIdentifier];
            if (![v27 isEqualToString:v28])
            {
              v48 = [(SKBaseDiskArbOperation *)self options];
              v49 = [v48 objectForKeyedSubscript:kSKDiskMountOptionWithoutEFI];
              unsigned __int8 v50 = sub_100012340(v49);

              v11 = v25;
              id v12 = v26;
              id v9 = v60;
              if (v50)
              {
                uint64_t v10 = v58;
                goto LABEL_58;
              }
              goto LABEL_29;
            }

            v11 = v25;
            id v12 = v26;
            id v9 = v60;
          }

LABEL_29:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || ([v12 apfsVolumeGroupUUID],
                v29 = objc_claimAutoreleasedReturnValue(),
                v29,
                !v29)
            || a4)
          {
            id v17 = [(SKBaseDiskArbOperation *)self diskWithFSRefresh:v12];
            if (v17) {
              [v63 addObject:v17];
            }
            uint64_t v10 = v58;
            goto LABEL_57;
          }
          v56 = v11;
          id v17 = [v12 apfsVolumeGroupUUID];
          id v55 = v12;
          v30 = [v12 container];
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          v31 = [v30 volumes];
          id v32 = [v31 countByEnumeratingWithState:&v64 objects:v76 count:16];
          if (!v32)
          {

            v34 = 0;
            v47 = 0;
            uint64_t v10 = v58;
            goto LABEL_55;
          }
          id v33 = v32;
          v61 = 0;
          id v62 = v31;
          v53 = v30;
          v34 = 0;
          uint64_t v35 = *(void *)v65;
          do
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v65 != v35) {
                objc_enumerationMutation(v62);
              }
              v37 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
              v38 = [v37 apfsVolumeGroupUUID];
              unsigned int v39 = [v38 isEqualToString:v17];

              if (v39)
              {
                v40 = [v37 getAPFSVolumeRole];
                unsigned __int8 v41 = [v40 isEqualToString:SKAPFSVolumeRoleData];

                if (v41)
                {
                  v42 = v61;
                  v61 = v37;
                  v43 = v34;
                }
                else
                {
                  v44 = [v37 getAPFSVolumeRole];
                  unsigned int v45 = [v44 isEqualToString:SKAPFSVolumeRoleSystem];

                  v42 = v34;
                  v43 = v37;
                  if (!v45) {
                    continue;
                  }
                }
                id v46 = v37;

                v34 = v43;
              }
            }
            id v33 = [v62 countByEnumeratingWithState:&v64 objects:v76 count:16];
          }
          while (v33);

          v47 = v61;
          if (v61)
          {
            uint64_t v10 = v58;
            id v9 = v60;
            id v12 = v55;
            v11 = v56;
            if (v34)
            {
              [v63 addObject:v61];
              [v63 addObject:v34];
              v30 = v53;
              goto LABEL_56;
            }
          }
          else
          {
            uint64_t v10 = v58;
            id v9 = v60;
            id v12 = v55;
            v11 = v56;
          }
          v30 = v53;
LABEL_55:
          [v63 addObject:v12];
LABEL_56:

LABEL_57:
LABEL_58:

          v11 = (char *)v11 + 1;
        }
        while (v11 != v9);
        id v9 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
      }
      while (v9);
    }

    id v5 = v57;
  }
  else
  {
    v51 = [(SKBaseDiskArbOperation *)self diskWithFSRefresh:v5];
    if (v51) {
      [v63 addObject:v51];
    }
  }

  return v63;
}

- (BOOL)toOperateWithDisk:(id)a3
{
  return 1;
}

- (void)diskArbCallbackWithDissenter:(__DADissenter *)a3
{
  if (a3)
  {
    [(SKBaseDiskArbOperation *)self setDAstatus:DADissenterGetStatus(a3)];
    [(SKBaseDiskArbOperation *)self setDissenterPID:DADissenterGetProcessID()];
    [(SKBaseDiskArbOperation *)self setDAstatusString:DADissenterGetStatusString(a3)];
    id v5 = sub_10000DD48();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(SKBaseDiskArbOperation *)self currentOperationName];
      unsigned int v7 = [(SKBaseDiskArbOperation *)self DAstatus];
      unsigned int v8 = [(SKBaseDiskArbOperation *)self dissenterPID];
      id v9 = [(SKBaseDiskArbOperation *)self DAstatusString];
      if (v9)
      {
        uint64_t v10 = [(SKBaseDiskArbOperation *)self DAstatusString];
      }
      else
      {
        uint64_t v10 = @"(no status details)";
      }
      int v12 = 136316162;
      uint64_t v13 = "-[SKBaseDiskArbOperation diskArbCallbackWithDissenter:]";
      __int16 v14 = 2112;
      v15 = v6;
      __int16 v16 = 1024;
      unsigned int v17 = v7;
      __int16 v18 = 1024;
      unsigned int v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s: %@: dissented with status 0x%x by pid %d: %@", (uint8_t *)&v12, 0x2Cu);
      if (v9) {

      }
      goto LABEL_11;
    }
  }
  else
  {
    -[SKBaseDiskArbOperation setDAstatus:](self, "setDAstatus:");
    id v5 = sub_10000DD48();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(SKBaseDiskArbOperation *)self currentOperationName];
      int v12 = 136315394;
      uint64_t v13 = "-[SKBaseDiskArbOperation diskArbCallbackWithDissenter:]";
      __int16 v14 = 2112;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: success", (uint8_t *)&v12, 0x16u);
LABEL_11:
    }
  }

  [(SKBaseDiskArbOperation *)self setDiskArbOpDone:1];
  v11 = +[SKDaemonManager sharedManager];
  [v11 dispatchToWorkThread:&stru_100049290];
}

- (BOOL)completeDiskArbOp
{
  id v3 = [(SKBaseDiskArbOperation *)self currentOperationName];

  if (!v3)
  {
    unsigned __int8 v4 = [(SKBaseDiskArbOperation *)self description];
    [(SKBaseDiskArbOperation *)self setCurrentOperationName:v4];
  }
  id v5 = sub_10000DD48();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(SKBaseDiskArbOperation *)self currentOperationName];
    int v11 = 136315394;
    int v12 = "-[SKBaseDiskArbOperation completeDiskArbOp]";
    __int16 v13 = 2112;
    __int16 v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: running", (uint8_t *)&v11, 0x16u);
  }
  unsigned int v7 = +[NSRunLoop currentRunLoop];
  if (![(SKBaseDiskArbOperation *)self diskArbOpDone])
  {
    do
    {
      unsigned int v8 = +[NSDate dateWithTimeIntervalSinceNow:1.0];
      [v7 runMode:NSDefaultRunLoopMode beforeDate:v8];
    }
    while (![(SKBaseDiskArbOperation *)self diskArbOpDone]);
  }
  [(SKBaseDiskArbOperation *)self setDiskArbOpDone:0];
  BOOL v9 = [(SKBaseDiskArbOperation *)self DAstatus] == 0;

  return v9;
}

- (id)newDAError
{
  id v3 = +[NSMutableDictionary dictionary];
  unsigned __int8 v4 = [(SKBaseDiskArbOperation *)self DAstatusString];

  if (v4)
  {
    id v5 = [(SKBaseDiskArbOperation *)self DAstatusString];
    [v3 setObject:v5 forKeyedSubscript:kSKErrorDiskArbErrorStringKey];

    uint64_t v6 = [(SKBaseDiskArbOperation *)self DAstatus];
    unsigned int v7 = [(SKBaseDiskArbOperation *)self DAstatusString];
    unsigned int v8 = +[NSString stringWithFormat:@"DA error code 0x%x: %@", v6, v7];
  }
  else
  {
    unsigned int v8 = +[NSString stringWithFormat:@"DA error code 0x%x", [(SKBaseDiskArbOperation *)self DAstatus]];
  }
  unsigned int v9 = [(SKBaseDiskArbOperation *)self dissenterPID];
  uint64_t v10 = [(SKBaseDiskArbOperation *)self description];
  int v11 = (void *)v10;
  if (v9)
  {
    int v12 = +[NSString stringWithFormat:@"%@ dissented by process with PID %d, %@", v10, [(SKBaseDiskArbOperation *)self dissenterPID], v8];
    [v3 setObject:v12 forKeyedSubscript:NSDebugDescriptionErrorKey];

    int v11 = +[NSNumber numberWithInt:[(SKBaseDiskArbOperation *)self dissenterPID]];
    [v3 setObject:v11 forKeyedSubscript:kSKErrorDissenterPIDKey];
  }
  else
  {
    __int16 v13 = +[NSString stringWithFormat:@"%@ failed, %@", v10, v8];
    [v3 setObject:v13 forKeyedSubscript:NSDebugDescriptionErrorKey];
  }
  if ([(SKBaseDiskArbOperation *)self DAstatus] < 49152
    || [(SKBaseDiskArbOperation *)self DAstatus] > 49258)
  {
    uint64_t v14 = +[SKError errorWithCode:[(SKBaseDiskArbOperation *)self defaultErrorCode] userInfo:v3];
  }
  else
  {
    uint64_t v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:(int)([(SKBaseDiskArbOperation *)self DAstatus] & 0xFFFF3FFF) userInfo:v3];
  }
  v15 = (void *)v14;

  return v15;
}

- (id)newPerformOperation
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"No implementation provided for generic base class." userInfo:0];
  objc_exception_throw(v2);
}

- (BOOL)run
{
  id v3 = [(SKBaseDiskArbOperation *)self newPerformOperation];
  unsigned __int8 v4 = [(SKBaseDiskArbOperation *)self callbackBlock];

  if (v4)
  {
    id v5 = [(SKBaseDiskArbOperation *)self callbackBlock];
    ((void (**)(void, id))v5)[2](v5, v3);
  }
  [(SKManagerOperation *)self finished];

  return v3 == 0;
}

- (void)removeWithMountPoint:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"/private/var/mnt"])
  {
    unsigned __int8 v4 = +[NSFileManager defaultManager];
    id v13 = 0;
    unsigned int v5 = [v4 removeItemAtPath:v3 error:&v13];
    id v6 = v13;

    unsigned int v7 = sub_10000DD48();
    unsigned int v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v3;
        unsigned int v9 = "Removed %@";
        uint64_t v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        uint32_t v12 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v3;
      __int16 v16 = 2112;
      id v17 = v6;
      unsigned int v9 = "Failed to remove %@: %@";
      uint64_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
      goto LABEL_7;
    }
  }
}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (void)setCallbackBlock:(id)a3
{
}

- (int)dissenterPID
{
  return self->_dissenterPID;
}

- (void)setDissenterPID:(int)a3
{
  self->_dissenterPID = a3;
}

- (int)DAstatus
{
  return self->_DAstatus;
}

- (void)setDAstatus:(int)a3
{
  self->_DAstatus = a3;
}

- (NSString)DAstatusString
{
  return self->_DAstatusString;
}

- (void)setDAstatusString:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSString)currentOperationName
{
  return self->_currentOperationName;
}

- (void)setCurrentOperationName:(id)a3
{
}

- (int64_t)defaultErrorCode
{
  return self->_defaultErrorCode;
}

- (BOOL)diskArbOpDone
{
  return self->_diskArbOpDone;
}

- (void)setDiskArbOpDone:(BOOL)a3
{
  self->_diskArbOpDone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOperationName, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_DAstatusString, 0);

  objc_storeStrong(&self->_callbackBlock, 0);
}

@end