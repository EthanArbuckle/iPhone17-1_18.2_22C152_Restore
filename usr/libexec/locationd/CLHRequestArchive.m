@interface CLHRequestArchive
- (BOOL)deleteSubArchiveIfInactive:(id)a3;
- (BOOL)isActiveSubArchive;
- (BOOL)primaryDataExists;
- (CLHRequestArchive)init;
- (CLHRequestArchive)initWithDirectory:(id)a3;
- (CLHRequestArchive)initWithDirectory:(id)a3 itemCountThresholdForAutoCleanUp:(int)a4;
- (CLHRequestArchive)initWithDirectory:(id)a3 requestCode:(int)a4;
- (CLHRequestArchive)initWithDirectory:(id)a3 requestCode:(int)a4 itemCountThresholdForAutoCleanUp:(int)a5;
- (NSFileHandle)secondaryFileHandle;
- (NSString)directory;
- (NSString)secondaryPath;
- (double)rotationInterval;
- (id)inactiveSubArchives;
- (id)jsonObject;
- (id)mappedDataByDestructivelyCombiningPrimaryAndSecondaryData;
- (id)mappedPrimaryData;
- (id)mappedSecondaryData;
- (id)mappedSecondaryDataByDestructivelyCombiningAllSecondaryData;
- (id)pathForPrimaryData;
- (id)pathForSecondaryData;
- (id)pruneAndGetSecondaryDataOlderThan:(double)a3;
- (id)secondaryFileURLs;
- (unint64_t)count;
- (unint64_t)fileCount;
- (unint64_t)totalCount;
- (unint64_t)totalCountIncludingAllSubArchives;
- (unint64_t)totalSecondaryPointsUnderAllSubArchives;
- (unsigned)primaryDataSize;
- (unsigned)requestCode;
- (unsigned)secondaryDataSize;
- (void)dealloc;
- (void)eraseAllData;
- (void)generateNewSubArchive;
- (void)incrementCountBy:(unint64_t)a3;
- (void)iterateSecondaryData:(id)a3 forField:(unsigned int)a4 withHandler:(id)a5;
- (void)iterateSubArchivesWithHandler:(id)a3;
- (void)overwritePrimaryData:(id)a3;
- (void)overwritePrimaryObject:(id)a3;
- (void)pruneSecondaryDataOlderThan:(double)a3;
- (void)rotateSecondaryFile;
- (void)setCount:(unint64_t)a3;
- (void)setRotationInterval:(double)a3;
- (void)setSecondaryFileHandle:(id)a3;
- (void)setSecondaryPath:(id)a3;
- (void)setTotalCount:(unint64_t)a3;
- (void)updateCount;
- (void)writeSecondaryData:(id)a3 toField:(unsigned int)a4;
- (void)writeSecondaryObject:(id)a3 toField:(unsigned int)a4;
@end

@implementation CLHRequestArchive

- (void)setCount:(unint64_t)a3
{
  unint64_t count = self->_count;
  unint64_t totalCount = self->_totalCount;
  self->_unint64_t count = a3;
  if ([(CLHRequestArchive *)self isActiveSubArchive])
  {
    unint64_t v6 = self->_count - count + self->_totalCount;
    if ((v6 & 0x80000000) == 0) {
      self->_unint64_t totalCount = v6;
    }
  }
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_10231EDF0);
  }
  v7 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    directory = self->_directory;
    unint64_t v9 = self->_count;
    unint64_t v10 = self->_totalCount;
    *(_DWORD *)buf = 138413314;
    v13 = directory;
    __int16 v14 = 1024;
    int v15 = count;
    __int16 v16 = 1024;
    int v17 = v9;
    __int16 v18 = 1024;
    int v19 = totalCount;
    __int16 v20 = 1024;
    int v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#update-count: archive:%@, oldCount:%d, newCount:%d, oldTotalCount:%d, newTotalCount:%d", buf, 0x24u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHRequestArchive setCount:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
}

- (CLHRequestArchive)init
{
  return 0;
}

- (CLHRequestArchive)initWithDirectory:(id)a3
{
  return [(CLHRequestArchive *)self initWithDirectory:a3 requestCode:0 itemCountThresholdForAutoCleanUp:0xFFFFFFFFLL];
}

- (CLHRequestArchive)initWithDirectory:(id)a3 requestCode:(int)a4
{
  return [(CLHRequestArchive *)self initWithDirectory:a3 requestCode:*(void *)&a4 itemCountThresholdForAutoCleanUp:0xFFFFFFFFLL];
}

- (CLHRequestArchive)initWithDirectory:(id)a3 itemCountThresholdForAutoCleanUp:(int)a4
{
  return [(CLHRequestArchive *)self initWithDirectory:a3 requestCode:0 itemCountThresholdForAutoCleanUp:*(void *)&a4];
}

- (CLHRequestArchive)initWithDirectory:(id)a3 requestCode:(int)a4 itemCountThresholdForAutoCleanUp:(int)a5
{
  v58.receiver = self;
  v58.super_class = (Class)CLHRequestArchive;
  v8 = [(CLHRequestArchive *)&v58 init];
  unint64_t v9 = v8;
  if (!v8) {
    return v9;
  }
  v8->_rotationInterval = 1800.0;
  v8->_lastRotationTime = CFAbsoluteTimeGetCurrent();
  unint64_t v10 = (NSString *)a3;
  v9->_directory = v10;
  v9->_requestCode = a4;
  v11 = CKSyncEngine_ptr;
  if (a5 == -1)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    uint64_t v23 = qword_102419568;
    if (!os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    v24 = [(NSString *)v10 UTF8String];
    uint64_t buf = 68289282;
    __int16 v72 = 2082;
    v73 = "";
    __int16 v74 = 2082;
    id v75 = (id)v24;
    v25 = "{\"msg%{public}.0s\":\"CLHRequestArchive auto clean-up, threshold none\", \"dir\":%{public, location:escape_only}s}";
LABEL_24:
    v27 = v23;
    os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
    goto LABEL_25;
  }
  if (![+[NSFileManager defaultManager] fileExistsAtPath:v10])
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    uint64_t v23 = qword_102419568;
    if (!os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    v26 = [(NSString *)v10 UTF8String];
    uint64_t buf = 68289282;
    __int16 v72 = 2082;
    v73 = "";
    __int16 v74 = 2082;
    id v75 = (id)v26;
    v25 = "{\"msg%{public}.0s\":\"CLHRequestArchive auto clean-up. dir not exists\", \"dir\":%{public, location:escape_only}s}";
    goto LABEL_24;
  }
  v12 = +[NSURL fileURLWithPath:v10];
  if (v12)
  {
    v13 = v12;
    int v53 = a5;
    id v51 = a3;
    v52 = v10;
    __int16 v14 = +[NSFileManager defaultManager];
    NSURLResourceKey v78 = NSURLNameKey;
    v50 = v13;
    int v15 = [(NSFileManager *)v14 enumeratorAtURL:v13 includingPropertiesForKeys:+[NSArray arrayWithObjects:&v78 count:1] options:5 errorHandler:&stru_10231EE30];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v16 = [(NSDirectoryEnumerator *)v15 countByEnumeratingWithState:&v59 objects:&buf count:16];
    if (v16)
    {
      id v17 = v16;
      int v18 = 0;
      uint64_t v19 = *(void *)v60;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v60 != v19) {
            objc_enumerationMutation(v15);
          }
          int v21 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          *(void *)v64 = 0;
          [v21 getResourceValue:v64 forKey:NSURLNameKey error:0];
          if (([*(id *)v64 hasPrefix:@"secondary"] & 1) != 0
            || [*(id *)v64 hasPrefix:@"sub"])
          {
            ++v18;
          }
        }
        id v17 = [(NSDirectoryEnumerator *)v15 countByEnumeratingWithState:&v59 objects:&buf count:16];
      }
      while (v17);
    }
    else
    {
      int v18 = 0;
    }
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    a3 = v51;
    v11 = CKSyncEngine_ptr;
    v41 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
    {
      v42 = [(NSString *)v52 UTF8String];
      *(_DWORD *)v64 = 68289794;
      *(_DWORD *)&v64[4] = 0;
      __int16 v65 = 2082;
      v66 = "";
      __int16 v67 = 1026;
      *(_DWORD *)v68 = v53;
      *(_WORD *)&v68[4] = 2082;
      *(void *)&v68[6] = v42;
      __int16 v69 = 1026;
      int v70 = v18;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLHRequestArchive auto clean-up completed\", \"threshold\":%{public}u, \"dir\":%{public, location:escape_only}s, \"total-items\":%{public}u}", v64, 0x28u);
    }
    if (v18 >= v53)
    {
      BOOL v43 = sub_1012E4228(v50);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10231EDF0);
      }
      v44 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
      {
        v45 = [(NSString *)v52 UTF8String];
        *(_DWORD *)v64 = 68289538;
        *(_DWORD *)&v64[4] = 0;
        __int16 v65 = 2082;
        v66 = "";
        __int16 v67 = 2082;
        *(void *)v68 = v45;
        *(_WORD *)&v68[8] = 1026;
        *(_DWORD *)&v68[10] = v43;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLHRequestArchive auto clean-up. dir deleted.\", \"dir\":%{public, location:escape_only}s, \"status\":%{public}hhd}", v64, 0x22u);
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_10231EDF0);
        }
      }
      v46 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_FAULT))
      {
        v47 = [(NSString *)v52 UTF8String];
        *(_DWORD *)v64 = 68289794;
        *(_DWORD *)&v64[4] = 0;
        __int16 v65 = 2082;
        v66 = "";
        __int16 v67 = 1026;
        *(_DWORD *)v68 = v53;
        *(_WORD *)&v68[4] = 2082;
        *(void *)&v68[6] = v47;
        __int16 v69 = 1026;
        int v70 = v18;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLHRequestArchive auto clean-up threshold crossed\", \"threshold\":%{public}u, \"dir\":%{public, location:escape_only}s, \"total-items\":%{public}u}", v64, 0x28u);
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_10231EDF0);
        }
      }
      v48 = qword_102419568;
      if (os_signpost_enabled((os_log_t)qword_102419568))
      {
        v49 = [(NSString *)v52 UTF8String];
        *(_DWORD *)v64 = 68289794;
        *(_DWORD *)&v64[4] = 0;
        __int16 v65 = 2082;
        v66 = "";
        __int16 v67 = 1026;
        *(_DWORD *)v68 = v53;
        *(_WORD *)&v68[4] = 2082;
        *(void *)&v68[6] = v49;
        __int16 v69 = 1026;
        int v70 = v18;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLHRequestArchive auto clean-up threshold crossed", "{\"msg%{public}.0s\":\"CLHRequestArchive auto clean-up threshold crossed\", \"threshold\":%{public}u, \"dir\":%{public, location:escape_only}s, \"total-items\":%{public}u}", v64, 0x28u);
      }
    }
    goto LABEL_26;
  }
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_10231EDF0);
  }
  uint64_t v39 = qword_102419568;
  if (!os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_26;
  }
  v40 = [(NSString *)v10 UTF8String];
  uint64_t buf = 68289282;
  __int16 v72 = 2082;
  v73 = "";
  __int16 v74 = 2082;
  id v75 = (id)v40;
  v25 = "{\"msg%{public}.0s\":\"#warning CLHRequestArchive auto clean-up, directory-url nil\", \"dir\":%{public, location:escape_only}s}";
  v27 = v39;
  os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
LABEL_25:
  _os_log_impl((void *)&_mh_execute_header, v27, v28, v25, (uint8_t *)&buf, 0x1Cu);
LABEL_26:
  *(void *)&long long v59 = 0;
  [objc_msgSend(v11[319], "defaultManager") createDirectoryAtPath:a3 withIntermediateDirectories:1 attributes:0 error:&v59];
  if ((void)v59)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    v29 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68289539;
      __int16 v72 = 2082;
      v73 = "";
      __int16 v74 = 2113;
      id v75 = a3;
      __int16 v76 = 2113;
      uint64_t v77 = v59;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"failed to create archive dir\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10231EDF0);
      }
    }
    v30 = qword_102419568;
    if (os_signpost_enabled((os_log_t)qword_102419568))
    {
      uint64_t buf = 68289539;
      __int16 v72 = 2082;
      v73 = "";
      __int16 v74 = 2113;
      id v75 = a3;
      __int16 v76 = 2113;
      uint64_t v77 = v59;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to create archive dir", "{\"msg%{public}.0s\":\"failed to create archive dir\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
    }
  }
  else
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    v31 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      uint64_t buf = 68289283;
      __int16 v72 = 2082;
      v73 = "";
      __int16 v74 = 2113;
      id v75 = a3;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"archive dir now exists\", \"path\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v32 = [(CLHRequestArchive *)v9 secondaryFileURLs];
  id v33 = [v32 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v55;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v55 != v35) {
          objc_enumerationMutation(v32);
        }
        sub_100881A78(*(void **)(*((void *)&v54 + 1) + 8 * (void)j));
        v9->_count += v37;
      }
      id v34 = [v32 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v34);
  }
  v9->_unint64_t totalCount = [(CLHRequestArchive *)v9 totalSecondaryPointsUnderAllSubArchives];
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHRequestArchive;
  [(CLHRequestArchive *)&v3 dealloc];
}

- (NSFileHandle)secondaryFileHandle
{
  double Current = CFAbsoluteTimeGetCurrent();
  double rotationInterval = self->_rotationInterval;
  double lastRotationTime = self->_lastRotationTime;
  BOOL v6 = rotationInterval >= 0.0;
  if (lastRotationTime <= 0.0) {
    BOOL v6 = 1;
  }
  if (Current <= lastRotationTime + rotationInterval) {
    BOOL v6 = 0;
  }
  if (self->_secondaryPath) {
    BOOL v7 = !v6;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7) {
    [(CLHRequestArchive *)self rotateSecondaryFile];
  }
  return self->_secondaryFileHandle;
}

- (void)rotateSecondaryFile
{
  id v3 = [(CLHRequestArchive *)self pathForSecondaryData];
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_10231EDF0);
  }
  v4 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    secondaryPath = self->_secondaryPath;
    int v9 = 68289539;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    __int16 v13 = 2113;
    __int16 v14 = secondaryPath;
    __int16 v15 = 2113;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"rotating secondary file\", \"from\":%{private, location:escape_only}@, \"to\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x26u);
  }
  [(CLHRequestArchive *)self setSecondaryPath:v3];
  uint64_t v6 = sub_100881B5C(self->_secondaryPath);
  if (v6 == -1)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    BOOL v7 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
    {
      v8 = self->_secondaryPath;
      int v9 = 68289283;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2113;
      __int16 v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Warning could not open file\", \"path\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
    }
  }
  else
  {
    -[CLHRequestArchive setSecondaryFileHandle:](self, "setSecondaryFileHandle:", [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v6 closeOnDealloc:1]);
    self->_double lastRotationTime = CFAbsoluteTimeGetCurrent();
  }
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)totalCountIncludingAllSubArchives
{
  unsigned int v3 = [(CLHRequestArchive *)self isActiveSubArchive];
  uint64_t v4 = 40;
  if (v3) {
    uint64_t v4 = 48;
  }
  return *(unint64_t *)((char *)&self->super.isa + v4);
}

- (NSString)directory
{
  return self->_directory;
}

- (unint64_t)fileCount
{
  id v2 = [(CLHRequestArchive *)self secondaryFileURLs];

  return (unint64_t)[v2 count];
}

- (unsigned)primaryDataSize
{
  id v3 = 0;
  [+[NSURL fileURLWithPath:[(CLHRequestArchive *)self pathForPrimaryData]] getResourceValue:&v3 forKey:NSURLFileSizeKey error:0];
  return [v3 unsignedIntValue];
}

- (unsigned)secondaryDataSize
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(CLHRequestArchive *)self secondaryFileURLs];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unsigned int v5 = 0;
  uint64_t v6 = *(void *)v12;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v2);
      }
      v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
      id v10 = 0;
      [v8 getResourceValue:&v10 forKey:NSURLFileSizeKey error:0];
      v5 += [v10 unsignedIntValue];
    }
    id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v4);
  return v5;
}

- (id)mappedDataByDestructivelyCombiningPrimaryAndSecondaryData
{
  id v3 = objc_alloc_init((Class)PBDataWriter);
  [v3 writeData:sub_10153D234()];
  [v3 writeBigEndianFixed32:self->_requestCode];
  [v3 writeBigEndianFixed32:-[CLHRequestArchive secondaryDataSize](self, "secondaryDataSize")+ -[CLHRequestArchive primaryDataSize](self, "primaryDataSize")];
  id v4 = [(NSString *)self->_directory stringByAppendingPathComponent:@"conglomerate"];
  unsigned int v5 = +[NSURL fileURLWithPath:v4];
  if (v5) {
    sub_1012E4228(v5);
  }
  uint64_t v6 = sub_100881B5C(v4);
  if (v6 == -1)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    __int16 v20 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 68289283;
      __int16 v28 = 2082;
      v29 = "";
      __int16 v30 = 2113;
      v31 = (const char *)v4;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Warning could not open file\", \"path\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }

    return 0;
  }
  else
  {
    id v7 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v6 closeOnDealloc:1];
    id v25 = 0;
    [v7 writeData:[v3 immutableData] error:&v25];
    if (v25)
    {
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10231EDF0);
      }
      v8 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
      {
        int v9 = [(NSString *)v4 UTF8String];
        id v10 = [[objc_msgSend(v25, "description") UTF8String];
        uint64_t buf = 68289538;
        __int16 v28 = 2082;
        v29 = "";
        __int16 v30 = 2082;
        v31 = v9;
        __int16 v32 = 2082;
        id v33 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLHRequestArchive error writing conglomerate(parimary and secondaries)\", \"file\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_10231EDF0);
        }
      }
      long long v11 = qword_102419568;
      if (os_signpost_enabled((os_log_t)qword_102419568))
      {
        long long v12 = [(NSString *)v4 UTF8String];
        id v13 = [[objc_msgSend(v25, "description") UTF8String];
        uint64_t buf = 68289538;
        __int16 v28 = 2082;
        v29 = "";
        __int16 v30 = 2082;
        v31 = v12;
        __int16 v32 = 2082;
        id v33 = v13;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLHRequestArchive error writing conglomerate(parimary and secondaries)", "{\"msg%{public}.0s\":\"CLHRequestArchive error writing conglomerate(parimary and secondaries)\", \"file\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
      }
    }

    sub_100881DAC(v4, [(CLHRequestArchive *)self pathForPrimaryData], 1);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = [(CLHRequestArchive *)self secondaryFileURLs];
    id v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          sub_100881DAC(v4, [*(id *)(*((void *)&v21 + 1) + 8 * i) path], 1);
        }
        id v16 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v16);
    }
    [(CLHRequestArchive *)self rotateSecondaryFile];
    [(CLHRequestArchive *)self updateCount];
    return sub_1012E3D64(v4, 1);
  }
}

- (void)overwritePrimaryData:(id)a3
{
  unsigned int v5 = +[NSURL fileURLWithPath:[(CLHRequestArchive *)self pathForPrimaryData] isDirectory:0];
  if (v5)
  {
    uint64_t v6 = v5;
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    id v7 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v20 = 0;
      __int16 v21 = 2082;
      long long v22 = "";
      __int16 v23 = 2113;
      long long v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"removing primary file\", \"url\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    sub_1012E4228(v6);
  }
  v8 = [(CLHRequestArchive *)self pathForPrimaryData];
  uint64_t v9 = sub_100881B5C(v8);
  if (v9 == -1)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    uint64_t v17 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v20 = 0;
      __int16 v21 = 2082;
      long long v22 = "";
      __int16 v23 = 2113;
      long long v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Warning could not open file\", \"path\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    id v10 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v9 closeOnDealloc:1];
    id v18 = 0;
    [v10 writeData:a3 error:&v18];
    if (v18)
    {
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10231EDF0);
      }
      long long v11 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
      {
        long long v12 = (NSURL *)[(NSURL *)v8 UTF8String];
        id v13 = [[objc_msgSend(v18, "description") UTF8String];
        *(_DWORD *)uint64_t buf = 68289538;
        int v20 = 0;
        __int16 v21 = 2082;
        long long v22 = "";
        __int16 v23 = 2082;
        long long v24 = v12;
        __int16 v25 = 2082;
        id v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLHRequestArchive error over-writing primary data\", \"file\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", buf, 0x26u);
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_10231EDF0);
        }
      }
      id v14 = qword_102419568;
      if (os_signpost_enabled((os_log_t)qword_102419568))
      {
        id v15 = (NSURL *)[(NSURL *)v8 UTF8String];
        id v16 = [[objc_msgSend(v18, "description") UTF8String];
        *(_DWORD *)uint64_t buf = 68289538;
        int v20 = 0;
        __int16 v21 = 2082;
        long long v22 = "";
        __int16 v23 = 2082;
        long long v24 = v15;
        __int16 v25 = 2082;
        id v26 = v16;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLHRequestArchive error over-writing primary data", "{\"msg%{public}.0s\":\"CLHRequestArchive error over-writing primary data\", \"file\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", buf, 0x26u);
      }
    }
  }
}

- (void)overwritePrimaryObject:(id)a3
{
  id v4 = [a3 data];

  [(CLHRequestArchive *)self overwritePrimaryData:v4];
}

- (id)mappedPrimaryData
{
  id v2 = [(CLHRequestArchive *)self pathForPrimaryData];

  return sub_1012E3D64(v2, 0);
}

- (BOOL)primaryDataExists
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = [(CLHRequestArchive *)self pathForPrimaryData];

  return [(NSFileManager *)v3 fileExistsAtPath:v4];
}

- (void)incrementCountBy:(unint64_t)a3
{
  sub_1008819EC(self->_secondaryPath);
  uint64_t v6 = v5;
  [(CLHRequestArchive *)self setCount:self->_count + a3];
  *(double *)&uint64_t v7 = CFAbsoluteTimeGetCurrent();
  uint64_t v15 = 0;
  v8 = [(NSString *)self->_directory stringByAppendingPathComponent:sub_100881AA0(v7, v6 + a3)];
  [+[NSFileManager defaultManager] moveItemAtPath:self->_secondaryPath toPath:v8 error:&v15];
  if (v15)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    uint64_t v9 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
    {
      secondaryPath = self->_secondaryPath;
      *(_DWORD *)uint64_t buf = 68289795;
      int v17 = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2113;
      __int16 v21 = secondaryPath;
      __int16 v22 = 2113;
      __int16 v23 = v8;
      __int16 v24 = 2113;
      uint64_t v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"failed to update secondary filename\", \"from\":%{private, location:escape_only}@, \"to\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x30u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10231EDF0);
      }
    }
    long long v11 = qword_102419568;
    if (os_signpost_enabled((os_log_t)qword_102419568))
    {
      long long v12 = self->_secondaryPath;
      *(_DWORD *)uint64_t buf = 68289795;
      int v17 = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2113;
      __int16 v21 = v12;
      __int16 v22 = 2113;
      __int16 v23 = v8;
      __int16 v24 = 2113;
      uint64_t v25 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to update secondary filename", "{\"msg%{public}.0s\":\"failed to update secondary filename\", \"from\":%{private, location:escape_only}@, \"to\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x30u);
    }
  }
  else
  {
    [(CLHRequestArchive *)self setSecondaryPath:v8];
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    id v13 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      id v14 = self->_secondaryPath;
      *(_DWORD *)uint64_t buf = 68289283;
      int v17 = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2113;
      __int16 v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"updated secondary filename\", \"to\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
}

- (void)writeSecondaryObject:(id)a3 toField:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 data];

  [(CLHRequestArchive *)self writeSecondaryData:v6 toField:v4];
}

- (void)writeSecondaryData:(id)a3 toField:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = objc_alloc_init((Class)PBDataWriter);
  [v7 writeData:a3 forTag:v4];
  id v14 = 0;
  -[NSFileHandle writeData:error:](-[CLHRequestArchive secondaryFileHandle](self, "secondaryFileHandle"), "writeData:error:", [v7 immutableData], &v14);

  if (v14)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    v8 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [(NSString *)self->_secondaryPath UTF8String];
      id v10 = [[objc_msgSend(v14, "description") UTF8String];
      *(_DWORD *)uint64_t buf = 68289538;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      __int16 v20 = v9;
      __int16 v21 = 2082;
      id v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLHRequestArchive secondary-data write failed\", \"secondaryFilePath\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", buf, 0x26u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10231EDF0);
      }
    }
    long long v11 = qword_102419568;
    if (os_signpost_enabled((os_log_t)qword_102419568))
    {
      long long v12 = [(NSString *)self->_secondaryPath UTF8String];
      id v13 = [[objc_msgSend(v14, "description") UTF8String];
      *(_DWORD *)uint64_t buf = 68289538;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      __int16 v20 = v12;
      __int16 v21 = 2082;
      id v22 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLHRequestArchive secondary-data write failed", "{\"msg%{public}.0s\":\"CLHRequestArchive secondary-data write failed\", \"secondaryFilePath\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", buf, 0x26u);
    }
  }
  else
  {
    [(CLHRequestArchive *)self incrementCountBy:1];
  }
}

- (id)mappedSecondaryDataByDestructivelyCombiningAllSecondaryData
{
  id v3 = [(NSString *)self->_directory stringByAppendingPathComponent:@"allSecondaryCombined"];
  uint64_t v4 = +[NSURL fileURLWithPath:v3];
  if (v4) {
    sub_1012E4228(v4);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(CLHRequestArchive *)self secondaryFileURLs];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        sub_100881DAC(v3, [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) path], 1);
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(CLHRequestArchive *)self rotateSecondaryFile];
  [(CLHRequestArchive *)self updateCount];
  return sub_1012E3D64(v3, 1);
}

- (id)mappedSecondaryData
{
  id v3 = [(NSString *)self->_directory stringByAppendingPathComponent:@"allSecondaryCombined"];
  uint64_t v4 = +[NSURL fileURLWithPath:v3];
  if (v4) {
    sub_1012E4228(v4);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(CLHRequestArchive *)self secondaryFileURLs];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        sub_100881DAC(v3, [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) path], 0);
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  return sub_1012E3D64(v3, 1);
}

- (void)pruneSecondaryDataOlderThan:(double)a3
{
  id v5 = [(CLHRequestArchive *)self secondaryFileURLs];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v11 = COERCE_DOUBLE(sub_100881A78(v10));
        if (v11 < a3 && sub_1012E4228(v10))
        {
          unint64_t count = self->_count;
          sub_100881A78(v10);
          [(CLHRequestArchive *)self setCount:count - v13];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)pruneAndGetSecondaryDataOlderThan:(double)a3
{
  id v5 = [(NSString *)self->_directory stringByAppendingPathComponent:@"prunedSecondaryCombined"];
  id v6 = +[NSURL fileURLWithPath:v5];
  if (v6) {
    sub_1012E4228(v6);
  }
  id v7 = [(CLHRequestArchive *)self secondaryFileURLs];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v13 = COERCE_DOUBLE(sub_100881A78(v12));
        if (v13 < a3)
        {
          sub_100881DAC(v5, [v12 path:v13], 0);
          if (sub_1012E4228(v12))
          {
            unint64_t count = self->_count;
            sub_100881A78(v12);
            [(CLHRequestArchive *)self setCount:count - v15];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  return sub_1012E3D64(v5, 1);
}

- (void)iterateSecondaryData:(id)a3 forField:(unsigned int)a4 withHandler:(id)a5
{
  if ([a3 length])
  {
    id v8 = [objc_alloc((Class)PBDataReader) initWithData:a3];
    if ([v8 hasMoreData])
    {
      do
      {
        int v13 = 0;
        char v12 = 0;
        [v8 readTag:&v13 type:&v12];
        if (v13 == a4 && v12 == 2)
        {
          id v11 = [v8 readData];
          if (v11) {
            (*((void (**)(id, id))a5 + 2))(a5, v11);
          }
        }
      }
      while (([v8 hasMoreData] & 1) != 0);
    }
  }
}

- (void)generateNewSubArchive
{
  if (![(CLHRequestArchive *)self isActiveSubArchive])
  {
    id v3 = [(CLHRequestArchive *)self secondaryFileURLs];
    if ([v3 count])
    {
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10231EDF0);
      }
      uint64_t v4 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
      {
        directory = self->_directory;
        *(_DWORD *)uint64_t buf = 68289283;
        int v21 = 0;
        __int16 v22 = 2082;
        __int16 v23 = "";
        __int16 v24 = 2113;
        uint64_t v25 = directory;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Turning on sub-archiving on an archive with existing data erases existing data.\", \"directory\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = [v3 countByEnumeratingWithState:&v16 objects:v28 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v17;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v3);
            }
            sub_1012E4228(*(void **)(*((void *)&v16 + 1) + 8 * i));
          }
          id v7 = [v3 countByEnumeratingWithState:&v16 objects:v28 count:16];
        }
        while (v7);
      }
    }
  }
  unsigned int v10 = [(CLHRequestArchive *)self isActiveSubArchive];
  id v11 = self->_directory;
  if (v10) {
    id v11 = [(NSString *)self->_directory stringByDeletingLastPathComponent];
  }
  char v12 = [(NSString *)v11 stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"sub_%@", [+[NSUUID UUID] UUIDString])];
  uint64_t v15 = 0;
  [+[NSFileManager defaultManager] createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v15];
  if (v15)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    int v13 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      __int16 v23 = "";
      __int16 v24 = 2113;
      uint64_t v25 = v12;
      __int16 v26 = 2113;
      uint64_t v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"failed to create sub-archive\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10231EDF0);
      }
    }
    long long v14 = qword_102419568;
    if (os_signpost_enabled((os_log_t)qword_102419568))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      __int16 v23 = "";
      __int16 v24 = 2113;
      uint64_t v25 = v12;
      __int16 v26 = 2113;
      uint64_t v27 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to create sub-archive", "{\"msg%{public}.0s\":\"failed to create sub-archive\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }
  self->_double rotationInterval = 1800.0;
  self->_double lastRotationTime = CFAbsoluteTimeGetCurrent();
  [(CLHRequestArchive *)self setSecondaryPath:0];

  self->_directory = v12;
  self->_unint64_t count = 0;
}

- (void)iterateSubArchivesWithHandler:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CLHRequestArchive *)self inactiveSubArchives];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 count];
        (*((void (**)(id, void *))a3 + 2))(a3, v10);
        unint64_t v12 = self->_totalCount + (unsigned char *)[v10 count] - v11;
        if ((v12 & 0x80000000) == 0) {
          self->_unint64_t totalCount = v12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  (*((void (**)(id, CLHRequestArchive *))a3 + 2))(a3, self);
}

- (BOOL)deleteSubArchiveIfInactive:(id)a3
{
  if (![[(NSString *)self->_directory lastPathComponent] hasPrefix:@"sub"])
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    id v7 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = [(NSString *)self->_directory UTF8String];
      int v17 = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      long long v20 = "";
      __int16 v21 = 2082;
      __int16 v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SubArchiving delete inactive. receiver not sub-archive\", \"receiver\":%{public, location:escape_only}s}", (uint8_t *)&v17, 0x1Cu);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10231EDF0);
      }
    }
    uint64_t v9 = qword_102419568;
    if (!os_signpost_enabled((os_log_t)qword_102419568)) {
      return 0;
    }
    unsigned int v10 = [(NSString *)self->_directory UTF8String];
    int v17 = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    long long v20 = "";
    __int16 v21 = 2082;
    __int16 v22 = v10;
    id v11 = "#SubArchiving delete inactive. receiver not sub-archive";
    unint64_t v12 = "{\"msg%{public}.0s\":\"#SubArchiving delete inactive. receiver not sub-archive\", \"receiver\":%{public, locat"
          "ion:escape_only}s}";
    long long v13 = v9;
LABEL_22:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, v12, (uint8_t *)&v17, 0x1Cu);
    return 0;
  }
  if ((objc_msgSend(objc_msgSend(objc_msgSend(a3, "directory"), "lastPathComponent"), "hasPrefix:", @"sub") & 1) == 0)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    long long v14 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_FAULT))
    {
      int v17 = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      long long v20 = "";
      __int16 v21 = 2082;
      __int16 v22 = (const char *)[a3 directory];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SubArchiving delete inactive. archiveToDelete not sub-archive\", \"archiveToDelete\":%{public, location:escape_only}s}", (uint8_t *)&v17, 0x1Cu);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10231EDF0);
      }
    }
    uint64_t v15 = qword_102419568;
    if (!os_signpost_enabled((os_log_t)qword_102419568)) {
      return 0;
    }
    long long v16 = (const char *)[[[a3 directory] UTF8String];
    int v17 = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    long long v20 = "";
    __int16 v21 = 2082;
    __int16 v22 = v16;
    id v11 = "#SubArchiving delete inactive. archiveToDelete not sub-archive";
    unint64_t v12 = "{\"msg%{public}.0s\":\"#SubArchiving delete inactive. archiveToDelete not sub-archive\", \"archiveToDelete\":%"
          "{public, location:escape_only}s}";
    long long v13 = v15;
    goto LABEL_22;
  }
  if (-[NSString isEqualToString:](-[NSString lastPathComponent](self->_directory, "lastPathComponent"), "isEqualToString:", objc_msgSend(objc_msgSend(a3, "directory"), "lastPathComponent")))
  {
    return 0;
  }
  id v5 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [a3 directory]);
  if (!v5) {
    return 0;
  }

  return sub_1012E4228(v5);
}

- (BOOL)isActiveSubArchive
{
  id v2 = [(NSString *)[(CLHRequestArchive *)self directory] lastPathComponent];

  return [(NSString *)v2 hasPrefix:@"sub_"];
}

- (id)inactiveSubArchives
{
  if (![(CLHRequestArchive *)self isActiveSubArchive]) {
    sub_101AADE44();
  }
  id v3 = [(NSArray *)sub_1012E5C74((uint64_t)[(NSString *)self->_directory stringByDeletingLastPathComponent]) filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:@"self.lastPathComponent BEGINSWITH 'sub_'"]];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v8);
        if (!-[NSString isEqualToString:](-[NSString lastPathComponent](self->_directory, "lastPathComponent"), "isEqualToString:", [v9 lastPathComponent]))
        {
          unsigned int v10 = -[CLHRequestArchive initWithDirectory:requestCode:]([CLHRequestArchive alloc], "initWithDirectory:requestCode:", [v9 path], self->_requestCode);
          [v4 addObject:v10];
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v4;
}

- (void)updateCount
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(CLHRequestArchive *)self secondaryFileURLs];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        sub_100881A78(*(void **)(*((void *)&v11 + 1) + 8 * i));
        v6 += v9;
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
    uint64_t v10 = v6;
  }
  else
  {
    uint64_t v10 = 0;
  }
  [(CLHRequestArchive *)self setCount:v10];
}

- (id)pathForPrimaryData
{
  return [(NSString *)self->_directory stringByAppendingPathComponent:@"primary"];
}

- (id)pathForSecondaryData
{
  *(double *)&uint64_t v3 = CFAbsoluteTimeGetCurrent();
  id v4 = sub_100881AA0(v3, 0);
  directory = self->_directory;

  return [(NSString *)directory stringByAppendingPathComponent:v4];
}

- (id)secondaryFileURLs
{
  id v2 = [(NSArray *)sub_1012E5C74((uint64_t)self->_directory) filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:@"self.lastPathComponent BEGINSWITH 'secondary-'"]];

  return [(NSArray *)v2 sortedArrayUsingComparator:&stru_10231ED70];
}

- (unint64_t)totalSecondaryPointsUnderAllSubArchives
{
  uint64_t v3 = +[NSPredicate predicateWithFormat:@"self.lastPathComponent BEGINSWITH 'sub_'"];
  id v4 = +[NSPredicate predicateWithFormat:@"self.lastPathComponent BEGINSWITH 'secondary-'"];
  long long v20 = self;
  id v5 = [(NSArray *)sub_1012E5C74((uint64_t)self->_directory) filteredArrayUsingPredicate:v3];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = -[NSArray filteredArrayUsingPredicate:](sub_1012E5C74((uint64_t)objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "path", v20)), "filteredArrayUsingPredicate:", v4);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v38 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              sub_100881A78(*(void **)(*((void *)&v22 + 1) + 8 * (void)j));
              v8 += v16;
            }
            id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v38 count:16];
          }
          while (v13);
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v39 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_10231EDF0);
  }
  int v17 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    directory = v20->_directory;
    *(_DWORD *)uint64_t buf = 68289538;
    int v31 = 0;
    __int16 v32 = 2082;
    id v33 = "";
    __int16 v34 = 2114;
    uint64_t v35 = directory;
    __int16 v36 = 1026;
    int v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"totalSecondaryPointsUnderAllSubArchives\", \"archive\":%{public, location:escape_only}@, \"totalCount\":%{public}d}", buf, 0x22u);
  }
  return v8;
}

- (void)eraseAllData
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = sub_1012E5C74((uint64_t)self->_directory);
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        sub_1012E4228(*(void **)(*((void *)&v8 + 1) + 8 * (void)v7));
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  -[CLHRequestArchive setCount:](self, "setCount:", 0, (void)v8);
}

- (id)jsonObject
{
  v5[0] = @"identifier";
  uint64_t v3 = [(NSString *)self->_directory lastPathComponent];
  v5[1] = @"count";
  v6[0] = v3;
  v6[1] = +[NSNumber numberWithUnsignedLong:self->_count];
  return +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
}

- (double)rotationInterval
{
  return self->_rotationInterval;
}

- (void)setRotationInterval:(double)a3
{
  self->_double rotationInterval = a3;
}

- (unsigned)requestCode
{
  return self->_requestCode;
}

- (NSString)secondaryPath
{
  return self->_secondaryPath;
}

- (void)setSecondaryPath:(id)a3
{
}

- (void)setSecondaryFileHandle:(id)a3
{
}

- (unint64_t)totalCount
{
  return self->_totalCount;
}

- (void)setTotalCount:(unint64_t)a3
{
  self->_unint64_t totalCount = a3;
}

@end