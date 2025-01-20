@interface OSALog
+ (BOOL)isDataVaultEnabled;
+ (BOOL)randomlySelectForRetention:(id)a3;
+ (id)additionalRootsInstalled;
+ (id)commonFieldsForBody:(id)a3;
+ (id)createForSubmission:(id)a3 metadata:(id)a4 options:(id)a5 error:(id *)a6 writing:(id)a7;
+ (id)locallyCreateForSubmission:(id)a3 metadata:(id)a4 options:(id)a5 error:(id *)a6 writing:(id)a7;
+ (id)logObjForBugType:(id)a3;
+ (id)scanProxies:(id)a3;
+ (unsigned)scanLogs:(id)a3 from:(id)a4;
+ (unsigned)scanLogs:(id)a3 from:(id)a4 options:(id)a5;
+ (void)cleanupForUser:(id)a3;
+ (void)cleanupRetired:(id)a3;
+ (void)createRetiredDirectory:(id)a3;
+ (void)iterateLogsWithOptions:(id)a3 usingBlock:(id)a4;
+ (void)markDescriptor:(int)a3 forKey:(id)a4 withObj:(id)a5;
+ (void)markDescriptor:(int)a3 withPairs:(id)a4 andOptions:(id)a5;
+ (void)markFile:(id)a3 withKey:(const char *)a4 value:(const char *)a5;
+ (void)markPurgeableLevel:(unint64_t)a3 path:(id)a4;
+ (void)purgeLogs:(id)a3;
- (BOOL)deleteOnRetire;
- (BOOL)isReasonableSize:(int64_t)a3 forRouting:(id)a4;
- (BOOL)retire:(const char *)a3;
- (NSDictionary)metaData;
- (NSString)bugType;
- (NSString)filepath;
- (NSString)oldFilePath;
- (OSALog)initWithFilepath:(id)a3 type:(id)a4;
- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 options:(id)a5;
- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 options:(id)a5 error:(id *)a6;
- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 usingConfig:(id)a5 options:(id)a6 error:(id *)a7;
- (OSALog)initWithPath:(id)a3 options:(id)a4 error:(id *)a5;
- (OSALog)initWithType:(id)a3 filepath:(id)a4 metadata:(id)a5 options:(id)a6 at:(double)a7 error:(id *)a8;
- (__sFILE)stream;
- (id)description;
- (void)closeFileStream;
- (void)dealloc;
- (void)markWithKey:(const char *)a3 value:(const char *)a4;
- (void)rename:(id)a3;
- (void)setDeleteOnRetire:(BOOL)a3;
- (void)setOldFilePath:(id)a3;
@end

@implementation OSALog

- (NSString)filepath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

+ (void)markDescriptor:(int)a3 forKey:(id)a4 withObj:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (const char *)[v8 UTF8String];
    v10 = v9;
LABEL_7:
    size_t v12 = strlen(v9);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    id v13 = [v8 stringValue];
    v10 = (const char *)[v13 UTF8String];

    v9 = v10;
    goto LABEL_7;
  }
  id v11 = v8;
  v10 = (const char *)[v11 bytes];
  size_t v12 = [v11 length];
LABEL_8:
  size_t v14 = v12;
  if (v10 && v12)
  {
    id v15 = v7;
    if (fsetxattr(a3, (const char *)[v15 UTF8String], v10, v14, 0, 0)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = *__error();
      v17 = __error();
      v18 = strerror(*v17);
      int v19 = 138412802;
      id v20 = v15;
      __int16 v21 = 1024;
      int v22 = v16;
      __int16 v23 = 2080;
      v24 = v18;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to set xattr '%@', errno=%d: %s", (uint8_t *)&v19, 0x1Cu);
    }
    goto LABEL_15;
  }
LABEL_13:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[OSALog markDescriptor:forKey:withObj:]();
  }
LABEL_15:
}

+ (id)logObjForBugType:(id)a3
{
  id v3 = a3;
  if (v3 && ([&unk_1EFE25E68 containsObject:v3] & 1) != 0)
  {
    v4 = +[OSASystemConfiguration sharedInstance];
    v5 = (void *)[v4 logDomain];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  return v5;
}

void __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(id)markDescriptor_withPairs_andOptions__option_xattr_whitelist containsObject:v6])
  {
    +[OSALog markDescriptor:*(unsigned int *)(a1 + 32) forKey:v6 withObj:v5];
  }
}

void __68__OSALog_locallyCreateForSubmission_metadata_options_error_writing___block_invoke(uint64_t a1)
{
  v87[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v2 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v75 = v2;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Moving source file '%{public}@' into submission directory", buf, 0xCu);
    }
    id v3 = fopen((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], "r");
    if (v3)
    {
      v4 = v3;
      +[OSASystemConfiguration ensureConformanceOfFile:fileno(v3) options:*(void *)(a1 + 64)];
      +[OSALog markDescriptor:fileno(v4) withPairs:*(void *)(a1 + 56) andOptions:*(void *)(a1 + 64)];
      fclose(v4);
      id v5 = [[OSALog alloc] initWithFilepath:*(void *)(a1 + 32) type:*(void *)(a1 + 48)];
      uint64_t v6 = *(void *)(*(void *)(a1 + 88) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)) {
        goto LABEL_18;
      }
      uint64_t v8 = *(void *)(*(void *)(a1 + 96) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = @"Unable to access log from existing file";

      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      uint64_t v86 = *MEMORY[0x1E4F28568];
      v87[0] = v11;
      size_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:&v86 count:1];
      uint64_t v13 = [v10 errorWithDomain:@"OSALog" code:6 userInfo:v12];
      uint64_t v14 = *(void *)(*(void *)(a1 + 104) + 8);
      id v15 = *(id *)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    else
    {
      v32 = NSString;
      uint64_t v33 = *(void *)(a1 + 32);
      uint64_t v34 = *__error();
      v35 = __error();
      size_t v12 = [v32 stringWithFormat:@"Unable to open file '%@': [%d] %s", v33, v34, strerror(*v35)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v75 = v12;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
      uint64_t v36 = *(void *)(*(void *)(a1 + 96) + 8);
      v37 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = @"Unable to open file";

      v38 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v84 = *MEMORY[0x1E4F28568];
      v85 = v12;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
      uint64_t v39 = [v38 errorWithDomain:@"OSALog" code:3 userInfo:v15];
      uint64_t v40 = *(void *)(*(void *)(a1 + 104) + 8);
      v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v39;
    }
  }
  else
  {
    int v16 = [*(id *)(a1 + 40) stringByDeletingLastPathComponent];
    v17 = [*(id *)(a1 + 40) lastPathComponent];
    v18 = [@"." stringByAppendingString:v17];
    size_t v12 = [v16 stringByAppendingPathComponent:v18];

    int v19 = [OSALog alloc];
    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = *(void *)(a1 + 56);
    uint64_t v22 = *(void *)(a1 + 64);
    double v23 = *(double *)(a1 + 120);
    id v71 = 0;
    uint64_t v24 = [(OSALog *)v19 initWithType:v20 filepath:v12 metadata:v21 options:v22 at:&v71 error:v23];
    id v25 = v71;
    uint64_t v26 = *(void *)(*(void *)(a1 + 88) + 8);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v24;

    v28 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    if (v28)
    {
      uint64_t v29 = *(void *)(a1 + 80);
      uint64_t v30 = fileno((FILE *)[v28 stream]);
      id v70 = v25;
      int v31 = (*(uint64_t (**)(uint64_t, uint64_t, id *))(v29 + 16))(v29, v30, &v70);
      id v15 = v70;

      if (v31)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) closeFileStream];
      }
      else
      {
        unlink((const char *)[v12 UTF8String]);
        uint64_t v42 = *(void *)(*(void *)(a1 + 88) + 8);
        v43 = *(void **)(v42 + 40);
        *(void *)(v42 + 40) = 0;
      }
    }
    else
    {
      id v15 = v25;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
    {
      uint64_t v44 = *(void *)(*(void *)(a1 + 96) + 8);
      v45 = *(void **)(v44 + 40);
      *(void *)(v44 + 40) = @"Unable to create a new log file";

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), v15);
    }
  }

LABEL_18:
  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    v46 = [MEMORY[0x1E4F28CB8] defaultManager];
    v47 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) filepath];
    uint64_t v48 = *(void *)(a1 + 40);
    id v69 = 0;
    int v49 = [v46 moveItemAtPath:v47 toPath:v48 error:&v69];
    id v50 = v69;

    if (v49)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) rename:*(void *)(a1 + 40)];
      if (!*(unsigned char *)(a1 + 136))
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
        v51 = +[OSALogTrackerObject sharedTrackers];
        uint64_t v52 = *(void *)(a1 + 72);
        v53 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"Signature"];
        objc_msgSend(v51, "osa_logTracker_incrementForSubtype:signature:filepath:", v52, v53, objc_msgSend(*(id *)(a1 + 40), "fileSystemRepresentation"));
      }
      +[OSABridgeLinkProxy transfer:*(void *)(a1 + 40) key:*(void *)(a1 + 72)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v54 = *(void **)(a1 + 72);
        uint64_t v55 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
        uint64_t v56 = *(void *)(a1 + 128);
        uint64_t v58 = *(void *)(a1 + 40);
        v57 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138544386;
        v75 = v57;
        __int16 v76 = 2112;
        id v77 = v54;
        __int16 v78 = 2048;
        uint64_t v79 = v55;
        __int16 v80 = 2048;
        uint64_t v81 = v56;
        __int16 v82 = 2114;
        uint64_t v83 = v58;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Saved type '%{public}@(%@)' report (%lu of max %lu) at %{public}@", buf, 0x34u);
      }
      uint64_t v59 = *(void *)(*(void *)(a1 + 96) + 8);
      v60 = *(void **)(v59 + 40);
      *(void *)(v59 + 40) = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v65 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) filepath];
        *(_DWORD *)buf = 138543618;
        v75 = v65;
        __int16 v76 = 2114;
        id v77 = v50;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to move tmp file '%{public}@': %{public}@", buf, 0x16u);
      }
      uint64_t v66 = *(void *)(*(void *)(a1 + 96) + 8);
      v67 = *(void **)(v66 + 40);
      *(void *)(v66 + 40) = @"Unable to move tmp file";

      uint64_t v68 = *(void *)(*(void *)(a1 + 104) + 8);
      id v50 = v50;
      v60 = *(void **)(v68 + 40);
      *(void *)(v68 + 40) = v50;
    }
    goto LABEL_32;
  }
  uint64_t v61 = *(void *)(*(void *)(a1 + 96) + 8);
  if (!*(void *)(v61 + 40))
  {
    *(void *)(v61 + 40) = @"Failed to create log";
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
  {
    v62 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v72 = *MEMORY[0x1E4F28568];
    v73 = @"datawriter returned with negative response";
    id v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    uint64_t v63 = [v62 errorWithDomain:@"OSALog" code:14 userInfo:v50];
    uint64_t v64 = *(void *)(*(void *)(a1 + 104) + 8);
    v60 = *(void **)(v64 + 40);
    *(void *)(v64 + 40) = v63;
LABEL_32:
  }
}

- (OSALog)initWithType:(id)a3 filepath:(id)a4 metadata:(id)a5 options:(id)a6 at:(double)a7 error:(id *)a8
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (char *)a3;
  uint64_t v14 = (char *)a4;
  id v44 = a5;
  id v15 = a6;
  v46.receiver = self;
  v46.super_class = (Class)OSALog;
  int v16 = [(OSALog *)&v46 init];
  if (!v16) {
    goto LABEL_22;
  }
  mode_t v42 = umask(0);
  objc_storeStrong((id *)&v16->_filepath, a4);
  v17 = +[OSALog logObjForBugType:v13];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v51 = v13;
    __int16 v52 = 2114;
    v53 = v14;
    _os_log_impl(&dword_1A7C6D000, v17, OS_LOG_TYPE_DEFAULT, "creating type %{public}@ as %{public}@", buf, 0x16u);
  }

  v18 = v14;
  uint64_t v19 = open_dprotected_np((const char *)[v18 UTF8String], 2561, 4, 0, 432);
  if ((v19 & 0x80000000) == 0)
  {
    +[OSASystemConfiguration ensureConformanceOfFile:v19 options:v15];
    uint64_t v20 = +[OSASystemConfiguration sharedInstance];
    uint64_t v21 = [v20 createReportMetadata:v13 with:v44 at:v15 usingOptions:a7];
    metaData = v16->_metaData;
    v16->_metaData = (NSDictionary *)v21;

    double v23 = v16->_metaData;
    int v49 = @"bug_type";
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    id v25 = [(NSDictionary *)v23 dictionaryWithValuesForKeys:v24];

    uint64_t v26 = v16->_metaData;
    id v45 = 0;
    v27 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v26 options:0 error:&v45];
    id v41 = v45;
    if (v27)
    {
      uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v19 closeOnDealloc:0];
      v28 = [v15 objectForKeyedSubscript:@"alt-metadata"];
      BOOL v29 = v28 == 0;

      if (v29)
      {
        [v40 writeData:v27];
        uint64_t v30 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"\n" length:1];
        [v40 writeData:v30];
      }
      if ((v19 & 0x80000000) == 0)
      {
        +[OSALog markDescriptor:v19 withPairs:v25 andOptions:v15];
        v16->_stream = fdopen(v19, "w");
        goto LABEL_20;
      }
    }
    else
    {
      if (a8) {
        *a8 = v41;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v51 = 0;
        __int16 v52 = 2114;
        v53 = (char *)v41;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error while serializing ips metadata %{public}@. Error: %{public}@", buf, 0x16u);
      }
      close(v19);
    }
    unlink((const char *)[v18 UTF8String]);
    goto LABEL_20;
  }
  uint64_t v31 = *__error();
  v32 = __error();
  uint64_t v33 = strerror(*v32);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v51 = v18;
    __int16 v52 = 2082;
    v53 = v33;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error creating file %{public}@, %{public}s", buf, 0x16u);
  }
  if (!a8) {
    goto LABEL_21;
  }
  id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
  v47[0] = *MEMORY[0x1E4F28568];
  id v25 = [NSString stringWithUTF8String:v33];
  v47[1] = @"errno";
  v48[0] = v25;
  v35 = [NSNumber numberWithInt:v31];
  v48[1] = v35;
  uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
  *a8 = (id)[v34 initWithDomain:@"OSALog" code:13 userInfo:v36];

LABEL_20:
LABEL_21:
  umask(v42);
LABEL_22:
  if (v16->_stream) {
    v37 = v16;
  }
  else {
    v37 = 0;
  }
  v38 = v37;

  return v38;
}

+ (id)locallyCreateForSubmission:(id)a3 metadata:(id)a4 options:(id)a5 error:(id *)a6 writing:(id)a7
{
  v135[1] = *MEMORY[0x1E4F143B8];
  v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v83 = a7;
  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__4;
  v122 = __Block_byref_object_dispose__4;
  id v123 = 0;
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x3032000000;
  v115 = __Block_byref_object_copy__4;
  v116 = __Block_byref_object_dispose__4;
  id v117 = 0;
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x3032000000;
  v109 = __Block_byref_object_copy__4;
  v110 = __Block_byref_object_dispose__4;
  v111 = @"Undescribed error";
  uint64_t v13 = [v12 objectForKeyedSubscript:@"LogType"];
  if (![v13 length])
  {
    uint64_t v14 = v10;

    uint64_t v13 = v14;
  }
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x2020000000;
  id v15 = [v12 objectForKeyedSubscript:@"override-filePath"];
  BOOL v16 = v15 != 0;

  if (v16) {
    goto LABEL_7;
  }
  v17 = +[OSALogTrackerObject sharedTrackers];
  v18 = (id *)(v107 + 5);
  id obj = (id)v107[5];
  int v19 = objc_msgSend(v17, "osa_logTracker_isLog:byKey:count:withinLimit:withOptions:errorDescription:", v10, v13, v102 + 3, &v105, v12, &obj);
  objc_storeStrong(v18, obj);
  if (v19)
  {

LABEL_7:
    id v21 = v11;
    uint64_t v22 = [v21 objectForKeyedSubscript:@"roots_installed"];
    BOOL v23 = v22 == 0;

    if (v23)
    {
      id v25 = +[OSALog additionalRootsInstalled];
      if (v25)
      {
        uint64_t v24 = (void *)[v21 mutableCopy];
        [v24 addEntriesFromDictionary:v25];
      }
      else
      {
        uint64_t v24 = v21;
      }
    }
    else
    {
      uint64_t v24 = v21;
    }
    uint64_t v26 = [v12 objectForKeyedSubscript:@"capture-time"];
    [v26 doubleValue];
    double v28 = v27;

    BOOL v29 = +[OSASystemConfiguration sharedInstance];
    uint64_t v30 = [v29 logPathForType:v10 at:v12 options:v28];

    if (v30)
    {
      uint64_t v31 = [v12 objectForKeyedSubscript:@"move-file"];
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __68__OSALog_locallyCreateForSubmission_metadata_options_error_writing___block_invoke;
      v85[3] = &unk_1E5D1FD90;
      id v32 = v31;
      id v86 = v32;
      id v87 = v30;
      v93 = &v118;
      v88 = v10;
      id v89 = v24;
      id v90 = v12;
      double v97 = v28;
      id v92 = v83;
      v94 = &v106;
      BOOL v99 = v16;
      v95 = &v112;
      v96 = &v101;
      id v91 = v13;
      uint64_t v98 = v105;
      __68__OSALog_locallyCreateForSubmission_metadata_options_error_writing___block_invoke((uint64_t)v85);

      uint64_t v33 = v86;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v129 = v10;
        __int16 v130 = 2112;
        v131 = v13;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Report of type '%{public}@(%@)' not saved because the destination is unavailable", buf, 0x16u);
      }
      id v34 = (void *)v107[5];
      v107[5] = @"Destination unavailable";

      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = v107[5];
      uint64_t v134 = *MEMORY[0x1E4F28568];
      v135[0] = v36;
      id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v135 forKeys:&v134 count:1];
      uint64_t v37 = [v35 errorWithDomain:@"OSALog" code:5 userInfo:v32];
      uint64_t v33 = (void *)v113[5];
      v113[5] = v37;
    }

    goto LABEL_19;
  }
  BOOL v20 = +[OSALog randomlySelectForRetention:v10];

  if (v20) {
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v129 = v10;
    __int16 v130 = 2112;
    v131 = v13;
    __int16 v132 = 2048;
    uint64_t v133 = v105;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Report of type '%{public}@(%@)' not saved because the limit of %lu logs has been reached", buf, 0x20u);
  }
  v67 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v68 = v107[5];
  uint64_t v126 = *MEMORY[0x1E4F28568];
  uint64_t v127 = v68;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
  uint64_t v69 = [v67 errorWithDomain:@"OSALog" code:4 userInfo:v24];
  uint64_t v30 = (void *)v113[5];
  v113[5] = v69;
LABEL_19:

  v38 = [MEMORY[0x1E4F1CA60] dictionary];
  [v38 setObject:v10 forKeyedSubscript:@"bug_type"];
  uint64_t v39 = [NSNumber numberWithInt:v107[5] == 0];
  [v38 setObject:v39 forKeyedSubscript:@"saved"];

  uint64_t v40 = (void *)v113[5];
  if (v40)
  {
    id v41 = [v40 userInfo];
    mode_t v42 = [v41 objectForKeyedSubscript:@"errno"];
    uint64_t v43 = [v42 intValue];

    id v44 = NSString;
    uint64_t v45 = v107[5];
    objc_super v46 = [(id)v113[5] domain];
    v47 = [v44 stringWithFormat:@"%@ (%@:%ld:%d)", v45, v46, objc_msgSend((id)v113[5], "code"), v43];
    [v38 setObject:v47 forKeyedSubscript:@"error"];

    if (v43)
    {
      uint64_t v48 = [(id)v113[5] userInfo];
      int v49 = [v48 objectForKeyedSubscript:@"errno"];
      [v38 setObject:v49 forKeyedSubscript:@"errno"];
    }
  }
  else
  {
    [v38 setObject:v107[5] forKeyedSubscript:@"error"];
  }
  AnalyticsSendEvent();
  if ([(__CFString *)v10 isEqualToString:@"211"])
  {
    +[OSAStateMonitor recordEvent:@"ca-log-written"];
    if (v107[5])
    {
      v124[0] = @"crk";
      id v50 = +[OSASystemConfiguration sharedInstance];
      uint64_t v51 = [v50 crashReporterKey];
      __int16 v52 = (void *)v51;
      if (v10) {
        v53 = v10;
      }
      else {
        v53 = @"<unknown>";
      }
      v125[0] = v51;
      v125[1] = v53;
      v124[1] = @"bug_type";
      v124[2] = @"error";
      uint64_t v54 = objc_msgSend(v38, "objectForKeyedSubscript:");
      uint64_t v55 = (void *)v54;
      if (v54) {
        uint64_t v56 = (__CFString *)v54;
      }
      else {
        uint64_t v56 = @"<unknown>";
      }
      v125[2] = v56;
      v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:3];
      rtcsc_send(2003, 2003, v57);
    }
  }
  if (+[OSALog isDataVaultEnabled])
  {
    uint64_t v58 = [v12 objectForKeyedSubscript:@"datavault-filePath"];
    if (![v58 BOOLValue] || v107[5])
    {
LABEL_44:

      goto LABEL_45;
    }
    uint64_t v59 = [(id)v119[5] filepath];
    BOOL v60 = v59 == 0;

    if (!v60)
    {
      uint64_t v61 = [(id)v119[5] filepath];
      uint64_t v58 = [v61 lastPathComponent];

      v62 = +[OSASystemConfiguration sharedInstance];
      uint64_t v63 = [v62 pathSubmission];
      uint64_t v64 = [(id)v63 stringByAppendingPathComponent:v58];

      v65 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v66 = [(id)v119[5] filepath];
      id v84 = 0;
      LOBYTE(v63) = [v65 copyItemAtPath:v66 toPath:v64 error:&v84];
      id v81 = v84;

      if (v63)
      {
        +[OSALog markFile:v64 withKey:"DoNotSubmit" value:"1"];
        [(id)v119[5] setOldFilePath:v64];
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        +[OSALog locallyCreateForSubmission:metadata:options:error:writing:]((uint64_t)v81, v70, v71, v72, v73, v74, v75, v76);
      }
      id v77 = [(id)v119[5] filepath];
      +[OSALog markPurgeableLevel:98308 path:v77];

      goto LABEL_44;
    }
  }
LABEL_45:
  if (a6)
  {
    __int16 v78 = (void *)v113[5];
    if (v78) {
      *a6 = v78;
    }
  }
  id v79 = (id)v119[5];

  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v106, 8);

  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v118, 8);

  return v79;
}

+ (id)createForSubmission:(id)a3 metadata:(id)a4 options:(id)a5 error:(id *)a6 writing:(id)a7
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v95 = a7;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v65 = (void *)MEMORY[0x1AD0D8280](v95);
    uint64_t v66 = NSUserName();
    *(_DWORD *)v115 = 138413314;
    *(void *)&v115[4] = v10;
    *(_WORD *)&v115[12] = 2112;
    *(void *)&v115[14] = v11;
    *(_WORD *)&v115[22] = 2112;
    v116 = v12;
    *(_WORD *)id v117 = 2048;
    *(void *)&v117[2] = v65;
    *(_WORD *)&v117[10] = 2112;
    *(void *)&v117[12] = v66;
    _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "createForSubmission: %@ metadata: %@ options: %@ block: %p (by %@)", v115, 0x34u);
  }
  if (v12) {
    uint64_t v13 = [v12 mutableCopy];
  }
  else {
    uint64_t v13 = objc_opt_new();
  }
  uint64_t v14 = (void *)v13;
  id v15 = objc_opt_new();
  if (v11)
  {
    BOOL v16 = [v12 objectForKeyedSubscript:@"nestedMetadata"];
    int v17 = [v16 BOOLValue];

    if (v17) {
      [v15 setObject:v11 forKeyedSubscript:@"custom_headers"];
    }
    else {
      [v15 addEntriesFromDictionary:v11];
    }
  }
  v18 = [v12 objectForKeyedSubscript:@"capture-time"];
  BOOL v19 = v18 == 0;

  if (v19)
  {
    BOOL v20 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
    [v14 setObject:v20 forKeyedSubscript:@"capture-time"];
  }
  id v21 = [v11 objectForKeyedSubscript:@"incident_id"];
  BOOL v22 = v21 == 0;

  if (v22)
  {
    BOOL v23 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v24 = [v23 UUIDString];
    [v15 setObject:v24 forKeyedSubscript:@"incident_id"];
  }
  id v25 = [v12 objectForKeyedSubscript:@"LogType"];
  BOOL v26 = [v25 length] == 0;

  if (v26) {
    [v14 setObject:v10 forKeyedSubscript:@"LogType"];
  }
  uint64_t v27 = geteuid();
  if (v27 >= 0x1F4)
  {
    double v28 = [NSNumber numberWithUnsignedInt:v27];
    [v14 setObject:v28 forKeyedSubscript:@"file-owner-uid"];
  }
  BOOL v29 = [v12 objectForKeyedSubscript:@"observer_info"];
  BOOL v30 = v29 == 0;

  if (v30)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v10 forKey:@"bug_type"];
    [v14 setObject:v31 forKeyedSubscript:@"observer_info"];
  }
  else
  {
    uint64_t v31 = [v14 objectForKeyedSubscript:@"observer_info"];
    [v31 setObject:v10 forKeyedSubscript:@"bug_type"];
  }

  id v32 = +[OSASystemConfiguration sharedInstance];
  int v33 = [v32 usesLegacySubmission:v10];

  if (v33) {
    [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"alt-metadata"];
  }
  unint64_t v34 = 0x1E5D1F000uLL;
  if (+[OSALog isDataVaultEnabled]
    && _os_feature_enabled_impl()
    && [v10 isEqualToString:@"309"])
  {
    [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"datavault-filePath"];
  }
  *(void *)v115 = 0;
  *(void *)&v115[8] = v115;
  *(void *)&v115[16] = 0x3032000000;
  v116 = __Block_byref_object_copy__4;
  *(void *)id v117 = __Block_byref_object_dispose__4;
  *(void *)&v117[8] = 0;
  v35 = [v12 objectForKeyedSubscript:@"override-filePath"];

  if (!v35)
  {
    context = (void *)MEMORY[0x1AD0D8030]();
    mach_service = xpc_connection_create_mach_service("com.apple.osanalytics.osanalyticshelper", 0, 2uLL);
    connection = mach_service;
    if (!mach_service)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        +[OSALog createForSubmission:metadata:options:error:writing:]();
      }
      uint64_t v56 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v102 = *MEMORY[0x1E4F28568];
      uint64_t v103 = @"Couldn't get XPC connection";
      uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
      uint64_t v58 = [v56 errorWithDomain:@"OSALog" code:17 userInfo:v57];
      id v92 = (_xpc_connection_s *)v57;
      uint64_t v37 = 0;
      uint64_t v59 = *(NSObject **)(*(void *)&v115[8] + 40);
      *(void *)(*(void *)&v115[8] + 40) = v58;
      goto LABEL_103;
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_262;
    handler[3] = &unk_1E5D1F988;
    handler[4] = v115;
    xpc_connection_set_event_handler(mach_service, handler);
    id v41 = xpc_connection_create(0, 0);
    id v92 = v41;
    if (!v41)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v114 = 0;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Couldn't config private XPC connection", v114, 2u);
      }
      uint64_t v61 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v104 = *MEMORY[0x1E4F28568];
      uint64_t v105 = @"Couldn't config private XPC connection";
      v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
      uint64_t v63 = [v61 errorWithDomain:@"OSALog" code:16 userInfo:v62];
      uint64_t v64 = *(void **)(*(void *)&v115[8] + 40);
      *(void *)(*(void *)&v115[8] + 40) = v63;

      uint64_t v37 = 0;
      goto LABEL_95;
    }
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_267;
    v96[3] = &unk_1E5D1FE08;
    id v97 = v95;
    xpc_connection_set_event_handler(v41, v96);
    xpc_endpoint_t v42 = xpc_endpoint_create(v41);
    xpc_connection_resume(v92);
    xpc_connection_resume(connection);
    xpc_object_t v43 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v43, "datawriter_endpoint", v42);
    xpc_endpoint_t v89 = v42;
    memset(v114, 0, sizeof(v114));
    id v44 = getprogname();
    if (!v44)
    {
      pid_t v45 = getpid();
      id v44 = (const char *)v114;
      __sprintf_chk((char *)v114, 0, 0x20uLL, "%d", v45);
    }
    xpc_dictionary_set_string(v43, "caller", v44);
    xpc_dictionary_set_uint64(v43, "operation", 6uLL);
    objc_super v46 = (const char *)[@"bug_type" UTF8String];
    id v47 = v10;
    xpc_dictionary_set_string(v43, v46, (const char *)[v47 UTF8String]);
    if ([v15 count])
    {
      uint64_t v48 = ns2xpc(v15);
      xpc_dictionary_set_value(v43, "additionalHeaders", v48);
    }
    if ([v14 count])
    {
      int v49 = ns2xpc(v14);
      xpc_dictionary_set_value(v43, "options", v49);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v113 = (const char *)v47;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "C1. request '%@' report service via XPC/osanalyticshelper", buf, 0xCu);
    }
    xpc_object_t v50 = xpc_connection_send_message_with_reply_sync(connection, v43);
    xpc_object_t xdict = v50;
    if (v50)
    {
      if (xpc_dictionary_get_BOOL(v50, "result"))
      {
        string = xpc_dictionary_get_string(xdict, "filePath");
        if (string)
        {
          __int16 v52 = [OSALog alloc];
          v53 = [NSString stringWithUTF8String:string];
          uint64_t v37 = [(OSALog *)v52 initWithFilepath:v53 type:v47];

          unint64_t v34 = 0x1E5D1F000;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v113 = string;
            _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "C6. report request completed: %s", buf, 0xCu);
          }
          uint64_t v54 = xpc_dictionary_get_string(xdict, "oldFilePath");
          if (!v54) {
            goto LABEL_94;
          }
          uint64_t v55 = [NSString stringWithUTF8String:v54];
          [(OSALog *)v37 setOldFilePath:v55];
          goto LABEL_93;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          +[OSALog createForSubmission:metadata:options:error:writing:]();
        }
        if (!*(void *)(*(void *)&v115[8] + 40))
        {
          uint64_t v74 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v110 = *MEMORY[0x1E4F28568];
          v111 = @"Incomplete XPC result -- no filename";
          uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
          uint64_t v68 = [v74 errorWithDomain:@"OSALog" code:7 userInfo:v55];
          goto LABEL_78;
        }
      }
      else
      {
        xpc_object_t v69 = xdict;
        if (xdict == (xpc_object_t)MEMORY[0x1E4F14528] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          +[OSALog createForSubmission:metadata:options:error:writing:]();
          xpc_object_t v69 = xdict;
        }
        uint64_t v70 = (char *)MEMORY[0x1AD0D87B0](v69);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v113 = v70;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "XPC Response: '%s'", buf, 0xCu);
        }
        if (v70) {
          free(v70);
        }
        uint64_t v71 = xpc_dictionary_get_string(xdict, "error_desc");
        if (!v71)
        {
          uint64_t v72 = *(void **)(*(void *)&v115[8] + 40);
          if (v72)
          {
            id v73 = [v72 localizedDescription];
            uint64_t v71 = (const char *)[v73 UTF8String];
          }
          else
          {
            uint64_t v71 = 0;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v113 = v71;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "C6. report request failed: %s", buf, 0xCu);
        }
        if (!*(void *)(*(void *)&v115[8] + 40))
        {
          v88 = xpc_dictionary_get_string(xdict, "error_domain");
          uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "error_code");
          v85 = (void *)MEMORY[0x1E4F28C58];
          if (v88)
          {
            objc_msgSend(NSString, "stringWithUTF8String:");
            id v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v87 = @"OSALog";
          }
          uint64_t v108 = *MEMORY[0x1E4F28568];
          if (v71)
          {
            uint64_t v76 = [NSString stringWithUTF8String:v71];
          }
          else
          {
            uint64_t v76 = @"<unknown>";
          }
          v109 = v76;
          id v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
          uint64_t v78 = [v85 errorWithDomain:v87 code:uint64 userInfo:v77];
          id v79 = *(void **)(*(void *)&v115[8] + 40);
          *(void *)(*(void *)&v115[8] + 40) = v78;

          if (v71) {
          uint64_t v37 = 0;
          }
          uint64_t v55 = v87;
          if (!v88) {
            goto LABEL_94;
          }
          goto LABEL_93;
        }
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Invalid XPC response", buf, 2u);
      }
      if (!*(void *)(*(void *)&v115[8] + 40))
      {
        v67 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v106 = *MEMORY[0x1E4F28568];
        v107 = @"Invalid XPC response";
        uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
        uint64_t v68 = [v67 errorWithDomain:@"OSALog" code:15 userInfo:v55];
LABEL_78:
        uint64_t v75 = *(void **)(*(void *)&v115[8] + 40);
        *(void *)(*(void *)&v115[8] + 40) = v68;

        uint64_t v37 = 0;
LABEL_93:

        goto LABEL_94;
      }
    }
    uint64_t v37 = 0;
LABEL_94:

    v62 = v97;
LABEL_95:

    uint64_t v59 = [*(id *)(v34 + 968) logObjForBugType:v10];
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      if (v37) {
        __int16 v80 = @"success";
      }
      else {
        __int16 v80 = @"FAILED";
      }
      if (*(void *)(*(void *)&v115[8] + 40)) {
        [*(id *)(*(void *)&v115[8] + 40) localizedDescription];
      }
      else {
      id v81 = [(OSALog *)v37 filepath];
      }
      *(_DWORD *)uint64_t v114 = 138543874;
      *(void *)&v114[4] = v10;
      *(_WORD *)&v114[12] = 2112;
      *(void *)&v114[14] = v80;
      *(_WORD *)&v114[22] = 2114;
      *(void *)&v114[24] = v81;
      _os_log_impl(&dword_1A7C6D000, v59, OS_LOG_TYPE_DEFAULT, "client log create type %{public}@ result %@: %{public}@", v114, 0x20u);
    }
LABEL_103:

    goto LABEL_104;
  }
  uint64_t v36 = *(void *)&v115[8];
  id obj = *(id *)(*(void *)&v115[8] + 40);
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke;
  v99[3] = &unk_1E5D1FDB8;
  id v100 = v95;
  uint64_t v37 = +[OSALog locallyCreateForSubmission:v10 metadata:v15 options:v14 error:&obj writing:v99];
  objc_storeStrong((id *)(v36 + 40), obj);
  v38 = +[OSALog logObjForBugType:v10];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    if (v37) {
      uint64_t v39 = @"success";
    }
    else {
      uint64_t v39 = @"FAILED";
    }
    if (*(void *)(*(void *)&v115[8] + 40)) {
      [*(id *)(*(void *)&v115[8] + 40) localizedDescription];
    }
    else {
    BOOL v60 = [(OSALog *)v37 filepath];
    }
    *(_DWORD *)uint64_t v114 = 138543874;
    *(void *)&v114[4] = v10;
    *(_WORD *)&v114[12] = 2112;
    *(void *)&v114[14] = v39;
    *(_WORD *)&v114[22] = 2114;
    *(void *)&v114[24] = v60;
    _os_log_impl(&dword_1A7C6D000, v38, OS_LOG_TYPE_DEFAULT, "local log create type %{public}@ result %@: %{public}@", v114, 0x20u);
  }
LABEL_104:
  if (a6)
  {
    __int16 v82 = *(void **)(*(void *)&v115[8] + 40);
    if (v82) {
      *a6 = v82;
    }
  }
  id v83 = v37;
  _Block_object_dispose(v115, 8);

  return v83;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldFilePath, 0);
  objc_storeStrong((id *)&self->_bugType, 0);
  objc_storeStrong((id *)&self->_filepath, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
}

- (void)dealloc
{
  [(OSALog *)self closeFileStream];
  v3.receiver = self;
  v3.super_class = (Class)OSALog;
  [(OSALog *)&v3 dealloc];
}

- (void)closeFileStream
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  stream = self->_stream;
  if (stream)
  {
    if (fclose(stream))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v4 = [(NSString *)self->_filepath lastPathComponent];
        int v5 = *__error();
        uint64_t v6 = __error();
        id v7 = strerror(*v6);
        int v8 = 138412802;
        v9 = v4;
        __int16 v10 = 1024;
        int v11 = v5;
        __int16 v12 = 2080;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WARNING: Failed to close %@. Please do NOT call -[NSFileHandle closeFile] errno=%d: %s", (uint8_t *)&v8, 0x1Cu);
      }
    }
    self->_stream = 0;
  }
}

+ (void)markDescriptor:(int)a3 withPairs:(id)a4 andOptions:(id)a5
{
  uint64_t v7 = markDescriptor_withPairs_andOptions__onceToken;
  id v8 = a5;
  id v9 = a4;
  if (v7 != -1) {
    dispatch_once(&markDescriptor_withPairs_andOptions__onceToken, &__block_literal_global_302);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke_2;
  v12[3] = &__block_descriptor_36_e15_v32__0_8_16_B24l;
  int v13 = a3;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke_3;
  v10[3] = &__block_descriptor_36_e15_v32__0_8_16_B24l;
  int v11 = a3;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];
}

void __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_262(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3 != (id)MEMORY[0x1E4F14520] && MEMORY[0x1AD0D88F0](v3) == MEMORY[0x1E4F145A8])
  {
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "com.apple.osanalytics.osanalyticshelper";
      __int16 v16 = 2080;
      int v17 = string;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Got xpc error message from %s: %s\n", buf, 0x16u);
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"XPC Error: %s", string);
    int v13 = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v9 = [v6 errorWithDomain:@"OSALog" code:8 userInfo:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

void __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    +[OSALog markDescriptor:*(unsigned int *)(a1 + 32) forKey:v6 withObj:v5];
  }
}

- (__sFILE)stream
{
  return self->_stream;
}

- (void)rename:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_filepath, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[OSALog rename:]((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (NSString)oldFilePath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (OSALog)initWithFilepath:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OSALog;
  uint64_t v9 = [(OSALog *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bugType, a4);
    objc_storeStrong((id *)&v10->_filepath, a3);
  }

  return v10;
}

+ (BOOL)isDataVaultEnabled
{
  return os_variant_is_darwinos() ^ 1;
}

+ (id)additionalRootsInstalled
{
  v8[1] = *MEMORY[0x1E4F143B8];
  size_t v5 = 8;
  uint64_t v6 = 0;
  v2 = 0;
  if (!sysctlbyname("kern.roots_installed", &v6, &v5, 0, 0))
  {
    id v7 = @"roots_installed";
    id v3 = [NSNumber numberWithUnsignedLongLong:v6];
    v8[0] = v3;
    v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  return v2;
}

- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 usingConfig:(id)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[OSALog initWithPath:forRouting:usingConfig:options:error:]();
  }
  v102.receiver = self;
  v102.super_class = (Class)OSALog;
  int v17 = [(OSALog *)&v102 init];
  if (!v17) {
    goto LABEL_92;
  }
  v96 = a7;
  uint64_t v101 = "rejected";
  uint64_t v18 = [v16 objectForKeyedSubscript:@"<cleanup>"];
  v17->_deleteOnRetire = [v18 BOOLValue];

  BOOL v19 = [v16 objectForKeyedSubscript:@"<preserve>"];
  v17->_preserveFiles = [v19 BOOLValue];

  BOOL v20 = [v16 objectForKeyedSubscript:@"<exempt>"];
  char v21 = [v20 BOOLValue];

  p_filepath = (id *)&v17->_filepath;
  objc_storeStrong((id *)&v17->_filepath, a3);
  v17->_stream = fopen([(NSString *)v17->_filepath fileSystemRepresentation], "r");
  BOOL v23 = __error();
  id v97 = v13;
  if (v17->_stream)
  {
    memset(&v100, 0, sizeof(v100));
    int v24 = fileno(v17->_stream);
    if (fstat(v24, &v100))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v25 = *p_filepath;
        int v26 = *__error();
        *(_DWORD *)buf = 138412546;
        id v109 = v25;
        __int16 v110 = 1024;
        LODWORD(st_size) = v26;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Logfile '%@' fstat errno %d", buf, 0x12u);
      }
      uint64_t v101 = "rejected-fstat";
      fclose(v17->_stream);
      v17->_stream = 0;
      uint64_t v27 = a7;
      goto LABEL_77;
    }
    unint64_t v34 = [*p_filepath pathExtension];
    char v35 = [v34 isEqualToString:@"synced"];
    id v36 = *p_filepath;
    if (v35)
    {
      id v37 = [v36 stringByDeletingPathExtension];
    }
    else
    {
      id v37 = v36;
    }
    v38 = v37;

    uint64_t v39 = [v38 pathExtension];
    bugType = v17->_bugType;
    v17->_bugType = (NSString *)v39;

    v99.tv_sec = 0;
    *(void *)&v99.tv_usec = 0;
    gettimeofday(&v99, 0);
    if ((v21 & 1) == 0 && v99.tv_sec - v100.st_mtimespec.tv_sec > 2591999)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v58 = *p_filepath;
        *(_DWORD *)buf = 138412290;
        id v109 = v58;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Logfile '%@' is too old for submission", buf, 0xCu);
      }
      fclose(v17->_stream);
      v17->_stream = 0;
      uint64_t v101 = "rejected-age";
      uint64_t v27 = a7;
      goto LABEL_76;
    }
    id v41 = [v16 objectForKeyedSubscript:@"<metadata>"];
    id v95 = v41;
    if (v41 && ![v41 BOOLValue])
    {
      if ((v21 & 1) != 0
        || [(OSALog *)v17 isReasonableSize:v100.st_size forRouting:v14])
      {
        uint64_t v59 = v95;
        if (([v14 isEqualToString:@"anon"] & 1) == 0
          && ([v95 BOOLValue] & 1) != 0)
        {
          metaData = v17->_metaData;
          v17->_metaData = (NSDictionary *)MEMORY[0x1E4F1CC08];

          uint64_t v27 = v96;
LABEL_75:

LABEL_76:
LABEL_77:
          if (v17->_stream) {
            goto LABEL_78;
          }
          uint64_t v57 = v101;
          goto LABEL_84;
        }
        v94 = (NSDictionary *)objc_opt_new();
        if ([v14 isEqualToString:@"anon"])
        {
          uint64_t v63 = [v38 stringByDeletingPathExtension];
          [v63 pathExtension];
          v65 = uint64_t v64 = v38;

          [(NSDictionary *)v94 setObject:v65 forKeyedSubscript:@"subrouting"];
          uint64_t v66 = [v65 stringByAppendingPathExtension:v17->_bugType];
          v67 = v17->_bugType;
          v17->_bugType = (NSString *)v66;

          v38 = v64;
        }
        id v92 = v38;
        if (initWithPath_forRouting_usingConfig_options_error__onceToken != -1) {
          dispatch_once(&initWithPath_forRouting_usingConfig_options_error__onceToken, &__block_literal_global_4);
        }
        int v68 = fileno(v17->_stream);
        ssize_t v69 = flistxattr(v68, (char *)buf, 0x1FFuLL, 0);
        if (v69 >= 1)
        {
          ssize_t v70 = v69;
          buf[v69] = 0;
          uint64_t v71 = buf;
          do
          {
            ssize_t v72 = fgetxattr(v68, (const char *)v71, __ptr, 0x20uLL, 0, 0);
            if (v72 >= 1)
            {
              __ptr[v72] = 0;
              id v73 = [NSString stringWithUTF8String:v71];
              if (([(id)initWithPath_forRouting_usingConfig_options_error__option_xattr_whitelist containsObject:v73] & 1) == 0)
              {
                uint64_t v74 = [NSString stringWithUTF8String:__ptr];
                [(NSDictionary *)v94 setObject:v74 forKeyedSubscript:v73];
              }
            }
            v71 += strlen((const char *)v71) + 1;
          }
          while (v71 - buf < v70);
        }
        uint64_t v75 = v17->_metaData;
        v17->_metaData = v94;

        v38 = v92;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          id v90 = *p_filepath;
          *(_DWORD *)buf = 138412546;
          id v109 = v90;
          __int16 v110 = 2048;
          off_t st_size = v100.st_size;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Logfile '%@' is too large (%lld) for submission", buf, 0x16u);
        }
        uint64_t v101 = "rejected-rawsize";
        fclose(v17->_stream);
        v17->_stream = 0;
      }
LABEL_74:
      uint64_t v27 = v96;
      uint64_t v59 = v95;
      goto LABEL_75;
    }
    xpc_endpoint_t v42 = [MEMORY[0x1E4F1CA58] dataWithCapacity:1024];
    __ptr[0] = 0;
    if (fread(__ptr, 1uLL, 1uLL, v17->_stream) && __ptr[0] != 10)
    {
      unsigned int v43 = 0;
      do
      {
        [v42 appendBytes:__ptr length:1];
        if (fread(__ptr, 1uLL, 1uLL, v17->_stream)) {
          BOOL v44 = __ptr[0] == 10;
        }
        else {
          BOOL v44 = 1;
        }
        if (v44) {
          break;
        }
      }
      while (v43++ < 0x3FF);
    }
    if (![v42 length])
    {
      if (v21)
      {
LABEL_73:

        goto LABEL_74;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v61 = *p_filepath;
        int v62 = *__error();
        *(_DWORD *)buf = 138412546;
        id v109 = v61;
        __int16 v110 = 1024;
        LODWORD(st_size) = v62;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Logfile '%@' rejected for submission: missing metadata (or fread errno %d)", buf, 0x12u);
      }
      uint64_t v101 = "rejected-header";
LABEL_68:
      if (v17->_metaData) {
        char v77 = 1;
      }
      else {
        char v77 = v21;
      }
      if ((v77 & 1) == 0)
      {
        fclose(v17->_stream);
        v17->_stream = 0;
      }
      goto LABEL_73;
    }
    objc_super v46 = v38;
    id v98 = 0;
    uint64_t v47 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v42 options:0 error:&v98];
    id v93 = v98;
    uint64_t v48 = v17->_metaData;
    v17->_metaData = (NSDictionary *)v47;

    if (v17->_metaData)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      xpc_object_t v50 = v17->_metaData;
      if (isKindOfClass)
      {
        uint64_t v51 = [(NSDictionary *)v50 objectForKey:@"bug_type"];
        __int16 v52 = v17->_bugType;
        v17->_bugType = (NSString *)v51;

        if ((v21 & 1) == 0)
        {
          filepath = v17->_filepath;
          id v91 = v17->_bugType;
          off_t v54 = v100.st_size;
          uint64_t v55 = [v16 objectForKeyedSubscript:@"<whitelist>"];
          LOBYTE(v54) = [v15 isFile:filepath validForSubmission:v91 reasonableSize:v54 to:v14 internalTypes:v55 result:&v101];

          if ((v54 & 1) == 0)
          {
            uint64_t v56 = v17->_metaData;
            v17->_metaData = 0;
          }
        }
LABEL_67:

        v38 = v46;
        goto LABEL_68;
      }
    }
    else
    {
      xpc_object_t v50 = 0;
    }
    v17->_metaData = 0;

    if ((v21 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v76 = *p_filepath;
        *(_DWORD *)buf = 138412546;
        id v109 = v76;
        __int16 v110 = 2112;
        off_t st_size = (off_t)v93;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Logfile '%@' rejected for submission: bad metadata (or json error %@)", buf, 0x16u);
      }
      uint64_t v101 = "rejected-metadata";
    }
    goto LABEL_67;
  }
  int v28 = *v23;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v29 = v15;
    id v30 = *p_filepath;
    int v31 = *__error();
    *(_DWORD *)buf = 138412546;
    id v109 = v30;
    id v15 = v29;
    __int16 v110 = 1024;
    LODWORD(st_size) = v31;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Logfile '%@' failed to open (errno %d)", buf, 0x12u);
  }
  uint64_t v101 = "rejected-fopen";
  uint64_t v27 = a7;
  if (!v17->_stream)
  {
    if (v28 == 2)
    {
      id v13 = v97;
      if (a7)
      {
        id v32 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v103 = *MEMORY[0x1E4F28568];
        uint64_t v104 = @"File doesn't exist";
        int v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
        id *v96 = [v32 errorWithDomain:@"OSALog" code:1 userInfo:v33];
      }
      goto LABEL_89;
    }
    uint64_t v57 = "rejected-fopen";
LABEL_84:
    if (v27)
    {
      v85 = (void *)MEMORY[0x1E4F28C58];
      v105[0] = *MEMORY[0x1E4F28568];
      id v86 = [NSString stringWithUTF8String:v57];
      v105[1] = @"bug_type";
      v106[0] = v86;
      id v87 = (__CFString *)v17->_bugType;
      if (!v87) {
        id v87 = @"<unknown>";
      }
      v106[1] = v87;
      v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:2];
      id *v27 = [v85 errorWithDomain:@"OSALog" code:2 userInfo:v88];

      uint64_t v57 = v101;
    }
    id v13 = v97;
    [(OSALog *)v17 retire:v57];
LABEL_89:
    id v84 = v17;
    int v17 = 0;
LABEL_90:

    goto LABEL_92;
  }
LABEL_78:
  uint64_t v78 = v17->_metaData;
  if (!v78)
  {
    id v13 = v97;
    goto LABEL_92;
  }
  id v79 = [(NSDictionary *)v78 objectForKeyedSubscript:@"incident_id"];

  id v13 = v97;
  if (!v79)
  {
    __int16 v80 = (NSDictionary *)[(NSDictionary *)v17->_metaData mutableCopy];
    id v81 = [(NSDictionary *)v17->_metaData objectForKeyedSubscript:@"incident_id"];

    if (!v81)
    {
      __int16 v82 = [MEMORY[0x1E4F29128] UUID];
      id v83 = [v82 UUIDString];
      [(NSDictionary *)v80 setObject:v83 forKeyedSubscript:@"incident_id"];
    }
    id v84 = v17->_metaData;
    v17->_metaData = v80;
    goto LABEL_90;
  }
LABEL_92:

  return v17;
}

void __60__OSALog_initWithPath_forRouting_usingConfig_options_error___block_invoke()
{
  v2[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"SubmissionPolicy";
  v2[1] = @"routing";
  v2[2] = @"urgent";
  v2[3] = @"Signature";
  v2[4] = @"LogType";
  v2[5] = @"dialog_displayed";
  v2[6] = @"ReopenPath";
  v2[7] = @"displayName";
  v2[8] = @"priority";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:9];
  v1 = (void *)initWithPath_forRouting_usingConfig_options_error__option_xattr_whitelist;
  initWithPath_forRouting_usingConfig_options_error__option_xattr_whitelist = v0;
}

- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[OSASystemConfiguration sharedInstance];
  id v14 = [(OSALog *)self initWithPath:v12 forRouting:v11 usingConfig:v13 options:v10 error:a6];

  return v14;
}

- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[OSASystemConfiguration sharedInstance];
  id v12 = [(OSALog *)self initWithPath:v10 forRouting:v9 usingConfig:v11 options:v8 error:0];

  return v12;
}

- (OSALog)initWithPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)[a4 mutableCopy];
  [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"<exempt>"];
  id v10 = [(OSALog *)self initWithPath:v8 forRouting:&stru_1EFE17BD0 options:v9 error:a5];

  return v10;
}

- (id)description
{
  return self->_filepath;
}

+ (void)markPurgeableLevel:(unint64_t)a3 path:(id)a4
{
  unint64_t v7 = a3;
  id v4 = a4;
  int v5 = fsctl((const char *)[v4 fileSystemRepresentation], 0xC0084A44uLL, &v7, 0);
  if (v5)
  {
    int v6 = v5;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[OSALog markPurgeableLevel:path:](v4, (uint64_t *)&v7, v6);
    }
  }
}

+ (BOOL)randomlySelectForRetention:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (randomlySelectForRetention__onceToken != -1) {
    dispatch_once(&randomlySelectForRetention__onceToken, &__block_literal_global_189);
  }
  id v4 = randomlySelectForRetention__logRetentionCountQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__OSALog_randomlySelectForRetention___block_invoke_2;
  v7[3] = &unk_1E5D1FD68;
  id v8 = v3;
  id v9 = &v10;
  id v5 = v3;
  dispatch_sync(v4, v7);
  LOBYTE(v4) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

uint64_t __37__OSALog_randomlySelectForRetention___block_invoke()
{
  randomlySelectForRetention__logRetentionCountQueue = (uint64_t)dispatch_queue_create("com.apple.osanalytics.logRetentionCount", 0);
  return MEMORY[0x1F41817F8]();
}

void __37__OSALog_randomlySelectForRetention___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [[OSADateCounter alloc] initWithIdentifier:@"logLimit_309"];
  if ([*(id *)(a1 + 32) isEqualToString:@"309"])
  {
    if ([(OSADateCounter *)v2 count] <= 0x31 && OSARandomSelection(0x1F4uLL, @"logLimitRate_309"))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      [(OSADateCounter *)v2 increment];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        int v4 = 138543362;
        uint64_t v5 = v3;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Retaining additional log with bug type %{public}@", (uint8_t *)&v4, 0xCu);
      }
    }
  }
}

uint64_t __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:a2];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  }
  return 1;
}

void __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_267(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1AD0D88F0]() == MEMORY[0x1E4F14578])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "C3. private back-channel connection established", buf, 2u);
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_268;
    v5[3] = &unk_1E5D1FDE0;
    id v7 = *(id *)(a1 + 32);
    id v4 = v3;
    id v6 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, v5);
    xpc_connection_resume((xpc_connection_t)v4);
  }
}

void __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_268(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1AD0D88F0]() == MEMORY[0x1E4F14590])
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      uint64_t v5 = xpc_dictionary_dup_fd(v3, "fileDesc");
      if (v5)
      {
        uint64_t v6 = v5;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int v10 = 67109120;
          BOOL v11 = v6;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "C4. write payload using file descriptor (%d)", (uint8_t *)&v10, 8u);
        }
        uint64_t v7 = *(void *)(a1 + 40);
        if (v7)
        {
          id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v6];
          (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
        }
        BOOL v9 = 1;
        close(v6);
      }
      else
      {
        BOOL v9 = 0;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 67109120;
          BOOL v11 = 0;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "C4. ERROR no file descriptor (%d)", (uint8_t *)&v10, 8u);
          BOOL v9 = 0;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v10 = 67109120;
        BOOL v11 = v9;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "C5. payload writing complete, return status %d", (uint8_t *)&v10, 8u);
      }
      xpc_dictionary_set_BOOL(reply, "result", v9);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "C4. ERROR Unable to reply", (uint8_t *)&v10, 2u);
    }
  }
}

- (BOOL)isReasonableSize:(int64_t)a3 forRouting:(id)a4
{
  uint64_t v6 = [(NSString *)self->_filepath lastPathComponent];
  if ([v6 hasSuffix:@".pll.anon"])
  {
  }
  else
  {
    BOOL v7 = [(NSString *)self->_filepath hasSuffix:@".mss.anon"];

    if (!v7)
    {
      unint64_t v8 = 0x100000;
      return v8 >= a3;
    }
  }
  unint64_t v8 = 104857600;
  return v8 >= a3;
}

- (void)markWithKey:(const char *)a3 value:(const char *)a4
{
  uint64_t v6 = [(NSString *)self->_filepath UTF8String];
  size_t v7 = strlen(a4);
  if (setxattr(v6, a3, a4, v7 + 1, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[OSALog markWithKey:value:]();
    }
  }
}

+ (void)markFile:(id)a3 withKey:(const char *)a4 value:(const char *)a5
{
  id v7 = a3;
  unint64_t v8 = (const char *)[v7 UTF8String];
  size_t v9 = strlen(a5);
  if (setxattr(v8, a4, a5, v9 + 1, 0, 0) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[OSALog markFile:withKey:value:]();
  }
}

void __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke()
{
  v2[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"SubmissionPolicy";
  v2[1] = @"routing";
  v2[2] = @"urgent";
  v2[3] = @"Signature";
  v2[4] = @"LogType";
  v2[5] = @"dialog_displayed";
  v2[6] = @"ReopenPath";
  v2[7] = @"displayName";
  v2[8] = @"priority";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:9];
  v1 = (void *)markDescriptor_withPairs_andOptions__option_xattr_whitelist;
  markDescriptor_withPairs_andOptions__option_xattr_whitelist = v0;
}

- (BOOL)retire:(const char *)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  p_filepath = &self->_filepath;
  filepath = self->_filepath;
  if (!filepath) {
    return 1;
  }
  id v7 = (void *)[(NSString *)filepath copy];
  [(OSALog *)self closeFileStream];
  if (!self->_preserveFiles)
  {
    off_t v54 = v7;
    if (self->_deleteOnRetire)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *p_filepath;
        *(_DWORD *)buf = 136315394;
        uint64_t v66 = a3;
        __int16 v67 = 2114;
        int v68 = (const char *)v12;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Cleanup %s '%{public}@'", buf, 0x16u);
      }
      char v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*p_filepath];
      id v58 = 0;
      char v14 = OSASafeRemoveFileAtURL(v13, &v58);
      id v9 = v58;

      if (v14)
      {
LABEL_11:
        uint64_t v10 = 1;
LABEL_27:
        int v24 = +[OSALog logObjForBugType:self->_bugType];
        id v25 = @"<unknown>";
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          bugType = (__CFString *)self->_bugType;
          if (!bugType) {
            bugType = @"<unknown>";
          }
          uint64_t v27 = "success";
          int v28 = self->_filepath;
          *(_DWORD *)buf = 138544130;
          if (!v10) {
            uint64_t v27 = "failed";
          }
          uint64_t v66 = (const char *)bugType;
          __int16 v67 = 2082;
          int v68 = a3;
          __int16 v69 = 2114;
          ssize_t v70 = v28;
          __int16 v71 = 2080;
          ssize_t v72 = v27;
          _os_log_impl(&dword_1A7C6D000, v24, OS_LOG_TYPE_DEFAULT, "Retiring (%{public}@) %{public}s '%{public}@': %s", buf, 0x2Au);
        }

        id v29 = (__CFString *)self->_bugType;
        if (!v29) {
          id v29 = @"<unknown>";
        }
        v64[0] = v29;
        v63[0] = @"bug_type";
        v63[1] = @"reason";
        if (a3)
        {
          id v30 = [NSString stringWithUTF8String:a3];
        }
        else
        {
          id v30 = @"<unknown>";
        }
        v64[1] = v30;
        v63[2] = @"proxied";
        int v31 = objc_msgSend(NSNumber, "numberWithBool:", -[NSString containsString:](*p_filepath, "containsString:", @"ProxiedDevice-"));
        v64[2] = v31;
        v63[3] = @"success";
        id v32 = [NSNumber numberWithBool:v10];
        v64[3] = v32;
        int v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:4];
        AnalyticsSendEvent();

        if (a3) {
        if ([(NSString *)self->_bugType isEqualToString:@"211"]
        }
          && ![(NSString *)*p_filepath containsString:@"ProxiedDevice-"]
          && ([(NSString *)*p_filepath containsString:@"Analytics-Never"]
           || [(NSString *)*p_filepath containsString:@"Analytics-2"]))
        {
          v61[0] = @"crk";
          v53 = +[OSASystemConfiguration sharedInstance];
          uint64_t v34 = [v53 crashReporterKey];
          char v35 = (void *)v34;
          id v36 = (__CFString *)self->_bugType;
          if (!v36) {
            id v36 = @"<unknown>";
          }
          v62[0] = v34;
          v62[1] = v36;
          v61[1] = @"bug_type";
          v61[2] = @"incident_id";
          uint64_t v37 = -[NSDictionary objectForKeyedSubscript:](self->_metaData, "objectForKeyedSubscript:");
          v38 = (void *)v37;
          if (v37) {
            uint64_t v39 = (__CFString *)v37;
          }
          else {
            uint64_t v39 = @"<unknown>";
          }
          v62[2] = v39;
          v61[3] = @"timestamp";
          uint64_t v40 = -[NSDictionary objectForKeyedSubscript:](self->_metaData, "objectForKeyedSubscript:");
          id v41 = (void *)v40;
          if (v40) {
            xpc_endpoint_t v42 = (__CFString *)v40;
          }
          else {
            xpc_endpoint_t v42 = @"<unknown>";
          }
          v62[3] = v42;
          v61[4] = @"reason";
          if (a3)
          {
            id v25 = [NSString stringWithUTF8String:a3];
          }
          v62[4] = v25;
          v61[5] = @"optInStatus";
          unsigned int v43 = NSNumber;
          BOOL v44 = +[OSASystemConfiguration sharedInstance];
          pid_t v45 = objc_msgSend(v43, "numberWithBool:", objc_msgSend(v44, "optInApple"));
          v62[5] = v45;
          objc_super v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:6];
          rtcsc_send(2001, 2001, v46);

          if (a3) {
          v60[0] = v54;
          }
          v59[0] = @"logPath";
          v59[1] = @"retiredReason";
          if (a3)
          {
            uint64_t v47 = [NSString stringWithUTF8String:a3];
          }
          else
          {
            uint64_t v47 = @"<unknown>";
          }
          v60[1] = v47;
          __int16 v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
          +[OSAStateMonitor recordEvent:@"ca-log-retired" with:v52];

          if (a3) {
        }
          }
        id v7 = v54;
        goto LABEL_68;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[OSALog retire:]();
      }
LABEL_17:
      uint64_t v10 = 0;
      goto LABEL_27;
    }
    id v15 = +[OSASystemConfiguration sharedInstance];
    if ([v15 appleInternal])
    {
      if ([(NSString *)*p_filepath hasSuffix:@"pll.anon"])
      {

LABEL_59:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          int v49 = *p_filepath;
          *(_DWORD *)buf = 138543362;
          uint64_t v66 = (const char *)v49;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Auto deletion of '%{public}@'", buf, 0xCu);
        }
        xpc_object_t v50 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*p_filepath];
        id v57 = 0;
        char v51 = OSASafeRemoveFileAtURL(v50, &v57);
        id v9 = v57;

        if (v51) {
          goto LABEL_11;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[OSALog retire:]();
        }
        goto LABEL_17;
      }
      BOOL v48 = [(NSString *)*p_filepath hasSuffix:@"mss.anon"];

      if (v48) {
        goto LABEL_59;
      }
    }
    else
    {
    }
    id v16 = [(NSString *)*p_filepath stringByDeletingLastPathComponent];
    int v17 = [v16 stringByAppendingPathComponent:@"Retired"];
    uint64_t v18 = [(NSString *)*p_filepath lastPathComponent];
    BOOL v19 = [v17 stringByAppendingPathComponent:v18];

    BOOL v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*p_filepath];
    char v21 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v19];
    id v56 = 0;
    char v22 = OSASafeMoveItemAtURL(v20, v21, &v56);
    id v9 = v56;

    if (v22)
    {
      objc_storeStrong((id *)p_filepath, v19);
      [(OSALog *)self markWithKey:"retired-reason" value:a3];
      uint64_t v10 = 1;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[OSALog retire:]();
      }
      uint64_t v10 = 0;
    }
    if ([(NSString *)self->_bugType isEqualToString:@"211"])
    {
      BOOL v23 = [(NSString *)self->_filepath fileSystemRepresentation];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __17__OSALog_retire___block_invoke;
      v55[3] = &unk_1E5D1FE50;
      v55[4] = self;
      OSASafeOpenReadOnly((uint64_t)v23, v55);
    }

    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = *p_filepath;
    *(_DWORD *)buf = 136315394;
    uint64_t v66 = a3;
    __int16 v67 = 2114;
    int v68 = (const char *)v8;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Sparing %s '%{public}@'", buf, 0x16u);
  }
  id v9 = 0;
  LODWORD(v10) = 1;
LABEL_68:

  return v10 != 0;
}

void __17__OSALog_retire___block_invoke(int a1, int a2)
{
  if (fcntl(a2, 64, 2) == -1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __17__OSALog_retire___block_invoke_cold_1();
  }
}

+ (void)cleanupRetired:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v3;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Cleaning up retired logs (in %{public}@)", buf, 0xCu);
  }
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v3 stringByAppendingPathComponent:@"Retired"];
  uint64_t v6 = (const char *)[v5 fileSystemRepresentation];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __25__OSALog_cleanupRetired___block_invoke;
  v9[3] = &unk_1E5D1FE78;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  osa_scanDir(v6, 129, v9, 0);
}

void __25__OSALog_cleanupRetired___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(NSString, "stringWithUTF8String:");
  id v4 = [v2 stringByAppendingPathComponent:v3];

  id v5 = *(void **)(a1 + 40);
  id v15 = 0;
  uint64_t v6 = [v5 attributesOfItemAtPath:v4 error:&v15];
  id v7 = v15;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      int v17 = v4;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Failed to get attrs for retired log '%{public}@': %{public}@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  id v8 = [v6 fileModificationDate];
  [v8 timeIntervalSinceNow];
  double v10 = fabs(v9);

  if (v10 <= 604800.0)
  {
LABEL_10:
    id v13 = v7;
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v17 = v4;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Removing old retired log '%{public}@'", buf, 0xCu);
  }
  id v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  id v14 = v7;
  char v12 = OSASafeRemoveFileAtURL(v11, &v14);
  id v13 = v14;

  if ((v12 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int v17 = v4;
    __int16 v18 = 2114;
    id v19 = v13;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to remove retired log '%{public}@': %{public}@", buf, 0x16u);
  }
LABEL_11:
}

+ (void)cleanupForUser:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:&stru_1EFE17BD0];
  id v5 = v4;
  if (v3) {
    [v4 addObject:v3];
  }
  id v13 = v3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = MEMORY[0x1E4F1CC38];
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        char v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v13);
        [v12 setObject:v8 forKeyedSubscript:@"include-proxies"];
        if (+[OSALog isDataVaultEnabled]) {
          [v12 setObject:v8 forKeyedSubscript:@"datavault-filePath"];
        }
        if ([v11 length]) {
          [v12 setObject:v11 forKeyedSubscript:@"file-owner"];
        }
        +[OSALog iterateLogsWithOptions:v12 usingBlock:&__block_literal_global_346];

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

void __25__OSALog_cleanupForUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 pathExtension];
  char v4 = [v3 isEqualToString:@"proxy"];

  if ((v4 & 1) == 0)
  {
    id v23 = 0;
    uint64_t v5 = *MEMORY[0x1E4F1C540];
    id v22 = 0;
    int v6 = [v2 getResourceValue:&v23 forKey:v5 error:&v22];
    id v7 = v23;
    id v8 = v22;
    if (v6)
    {
      [v7 timeIntervalSinceNow];
      if (fabs(v9) > 2592000.0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v2 path];
          *(_DWORD *)buf = 138543362;
          id v25 = v10;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Removing old log '%{public}@'", buf, 0xCu);
        }
        id v11 = [v2 URLByDeletingLastPathComponent];
        char v12 = [v11 lastPathComponent];
        char v13 = [v12 isEqualToString:@"Retired"];

        if (v13)
        {
          id v20 = v8;
          char v14 = OSASafeRemoveFileAtURL(v2, &v20);
          id v15 = v20;

          if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            long long v16 = [v2 path];
            *(_DWORD *)buf = 138543618;
            id v25 = v16;
            __int16 v26 = 2114;
            id v27 = v15;
            _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to remove old log '%{public}@': %{public}@", buf, 0x16u);
          }
        }
        else
        {
          long long v17 = [OSALog alloc];
          long long v18 = [v2 path];
          id v21 = v8;
          id v19 = [(OSALog *)v17 initWithPath:v18 options:&unk_1EFE25D38 error:&v21];
          id v15 = v21;

          [(OSALog *)v19 retire:"expired"];
        }
        goto LABEL_13;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __25__OSALog_cleanupForUser___block_invoke_cold_1(v2);
    }
    id v15 = v8;
LABEL_13:
  }
}

+ (id)scanProxies:(id)a3
{
  id v3 = a3;
  +[OSALog createRetiredDirectory:v3];
  char v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = v3;
  int v6 = opendir((const char *)[v5 fileSystemRepresentation]);
  if (v6)
  {
    id v7 = v6;
    for (i = readdir(v6); i; i = readdir(v7))
    {
      if (i->d_type == 4)
      {
        double v9 = [NSString stringWithUTF8String:i->d_name];
        if ([v9 hasPrefix:@"ProxiedDevice-"])
        {
          uint64_t v10 = [v5 stringByAppendingPathComponent:v9];
          [v4 addObject:v10];
          +[OSALog createRetiredDirectory:v10];
        }
      }
    }
    closedir(v7);
  }

  return v4;
}

+ (unsigned)scanLogs:(id)a3 from:(id)a4 options:(id)a5
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v52 = a4;
  id v51 = a5;
  uint64_t v97 = 0;
  id v98 = &v97;
  uint64_t v99 = 0x2020000000;
  int v100 = 0;
  id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  uint64_t v63 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  id v56 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v93 objects:v106 count:16];
  if (v9)
  {
    uint64_t v57 = *(void *)v94;
    do
    {
      uint64_t v10 = 0;
      uint64_t v59 = v9;
      do
      {
        if (*(void *)v94 != v57) {
          objc_enumerationMutation(obj);
        }
        id v61 = *(void **)(*((void *)&v93 + 1) + 8 * v10);
        id v11 = [v61 objectForKeyedSubscript:@"<inactive>"];
        BOOL v12 = v11 == 0;

        if (v12)
        {
          char v13 = [v61 objectForKeyedSubscript:@"logs"];
          char v14 = [MEMORY[0x1E4F1CA48] array];
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id v15 = v13;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v89 objects:v105 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v90;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v90 != v17) {
                  objc_enumerationMutation(v15);
                }
                id v19 = *(id *)(*((void *)&v89 + 1) + 8 * i);
                if (getxattr((const char *)[v19 UTF8String], "DoNotSubmit", 0, 0, 0, 0) >= 1) {
                  [v14 addObject:v19];
                }
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v89 objects:v105 count:16];
            }
            while (v16);
          }

          [v15 removeObjectsInArray:v14];
          if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            int v20 = [v15 count];
            *((_DWORD *)v98 + 6) += v20;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v21 = (void *)[v15 mutableCopy];
              [v61 setObject:v21 forKeyedSubscript:@"logs"];
            }
          }
          else
          {
            uint64_t v22 = objc_opt_new();

            [v61 setObject:v22 forKeyedSubscript:@"logs"];
            id v15 = (id)v22;
          }
          id v23 = [v61 objectForKeyedSubscript:@"extensions"];
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id v24 = v23;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v85 objects:v104 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v86;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v86 != v26) {
                  objc_enumerationMutation(v24);
                }
                [v8 setObject:v15 forKeyedSubscript:*(void *)(*((void *)&v85 + 1) + 8 * j)];
              }
              uint64_t v25 = [v24 countByEnumeratingWithState:&v85 objects:v104 count:16];
            }
            while (v25);
          }

          uint64_t v28 = [v61 objectForKeyedSubscript:@"<descend>"];
          int v29 = [v28 BOOLValue];

          if (v29)
          {
            long long v83 = 0u;
            long long v84 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            id v30 = v24;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v81 objects:v103 count:16];
            if (v31)
            {
              uint64_t v32 = *(void *)v82;
              do
              {
                for (uint64_t k = 0; k != v31; ++k)
                {
                  if (*(void *)v82 != v32) {
                    objc_enumerationMutation(v30);
                  }
                  [v63 setObject:v15 forKeyedSubscript:*(void *)(*((void *)&v81 + 1) + 8 * k)];
                }
                uint64_t v31 = [v30 countByEnumeratingWithState:&v81 objects:v103 count:16];
              }
              while (v31);
            }
          }
          uint64_t v34 = [v61 objectForKeyedSubscript:@"routing"];
          [v56 setObject:v15 forKeyedSubscript:v34];
        }
        ++v10;
      }
      while (v10 != v59);
      uint64_t v9 = [obj countByEnumeratingWithState:&v93 objects:v106 count:16];
    }
    while (v9);
  }

  char v35 = [v51 objectForKeyedSubscript:@"only-urgent"];
  int v36 = [v35 BOOLValue];

  uint64_t v37 = 324;
  long long v79 = 0u;
  long long v80 = 0u;
  if (v36) {
    uint64_t v37 = 836;
  }
  uint64_t v54 = v37;
  long long v77 = 0uLL;
  long long v78 = 0uLL;
  id v53 = v52;
  uint64_t v60 = [v53 countByEnumeratingWithState:&v77 objects:v102 count:16];
  if (v60)
  {
    uint64_t v58 = *(void *)v78;
    do
    {
      for (uint64_t m = 0; m != v60; ++m)
      {
        if (*(void *)v78 != v58) {
          objc_enumerationMutation(v53);
        }
        v38 = *(void **)(*((void *)&v77 + 1) + 8 * m);
        uint64_t v39 = [v38 length];
        BOOL v40 = [v63 count] == 0;
        if (([v8 count] || objc_msgSend(v56, "count")) && objc_msgSend(v38, "length"))
        {
          id v41 = (const char *)[v38 fileSystemRepresentation];
          v71[0] = MEMORY[0x1E4F143A8];
          v71[1] = 3221225472;
          v71[2] = __32__OSALog_scanLogs_from_options___block_invoke;
          v71[3] = &unk_1E5D1FEC0;
          id v72 = v56;
          uint64_t v76 = v39;
          id v73 = v8;
          id v74 = v63;
          uint64_t v75 = &v97;
          osa_scanDir(v41, v54 | v40, v71, &__block_literal_global_374);
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v42 = obj;
          uint64_t v43 = [v42 countByEnumeratingWithState:&v67 objects:v101 count:16];
          if (v43)
          {
            uint64_t v44 = *(void *)v68;
            do
            {
              for (uint64_t n = 0; n != v43; ++n)
              {
                if (*(void *)v68 != v44) {
                  objc_enumerationMutation(v42);
                }
                objc_super v46 = *(void **)(*((void *)&v67 + 1) + 8 * n);
                uint64_t v47 = [v46 objectForKeyedSubscript:@"<sort>"];
                if ([v47 length])
                {
                  BOOL v48 = [v46 objectForKeyedSubscript:@"logs"];
                  v65[0] = MEMORY[0x1E4F143A8];
                  v65[1] = 3221225472;
                  v65[2] = __32__OSALog_scanLogs_from_options___block_invoke_2;
                  v65[3] = &unk_1E5D1FF08;
                  id v66 = v47;
                  [v48 sortUsingComparator:v65];
                }
              }
              uint64_t v43 = [v42 countByEnumeratingWithState:&v67 objects:v101 count:16];
            }
            while (v43);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "no reason to scan", buf, 2u);
        }
      }
      uint64_t v60 = [v53 countByEnumeratingWithState:&v77 objects:v102 count:16];
    }
    while (v60);
  }

  unsigned int v49 = *((_DWORD *)v98 + 6);
  _Block_object_dispose(&v97, 8);

  return v49;
}

void __32__OSALog_scanLogs_from_options___block_invoke(void *a1, const char *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v4 = objc_msgSend(NSString, "stringWithUTF8String:");
  id v5 = [NSString stringWithUTF8String:a2];
  int v6 = [v5 stringByAppendingPathComponent:v4];

  char v21 = 0;
  memset(value, 0, sizeof(value));
  id v7 = v6;
  if (getxattr((const char *)[v7 fileSystemRepresentation], (const char *)objc_msgSend(@"routing", "UTF8String"), value, 0x40uLL, 0, 0) >= 1)
  {
    id v8 = (void *)a1[4];
    uint64_t v9 = [NSString stringWithUTF8String:value];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];

    if (v10) {
      goto LABEL_12;
    }
  }
  if ([v4 hasSuffix:@".synced"])
  {
    id v11 = [v4 stringByDeletingPathExtension];
  }
  else
  {
    id v11 = v4;
  }
  BOOL v12 = v11;
  uint64_t v13 = [v11 pathExtension];
  if (!v13)
  {

    uint64_t v10 = 0;
    goto LABEL_17;
  }
  char v14 = (void *)v13;
  size_t v15 = strlen(a2);
  uint64_t v16 = 6;
  if (v15 == a1[8]) {
    uint64_t v16 = 5;
  }
  id v17 = (id)a1[v16];
  uint64_t v10 = [v17 objectForKeyedSubscript:v14];
  if (!v10)
  {
    uint64_t v10 = [v17 objectForKeyedSubscript:@"<*>"];
  }

  if (v10)
  {
LABEL_12:
    if ((unint64_t)[v10 count] <= 0x3E7)
    {
      [v10 addObject:v7];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = v7;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "scan: including '%@'", (uint8_t *)&v18, 0xCu);
      }
      ++*(_DWORD *)(*(void *)(a1[7] + 8) + 24);
    }
  }
LABEL_17:
}

uint64_t __32__OSALog_scanLogs_from_options___block_invoke_371()
{
  return 1;
}

uint64_t __32__OSALog_scanLogs_from_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  int v6 = [a2 lastPathComponent];
  int v7 = [v6 hasPrefix:*(void *)(a1 + 32)];

  id v8 = [v5 lastPathComponent];

  unsigned int v9 = [v8 hasPrefix:*(void *)(a1 + 32)];
  if (v7) {
    return v9 - 1;
  }
  else {
    return v9;
  }
}

+ (unsigned)scanLogs:(id)a3 from:(id)a4
{
  return +[OSALog scanLogs:a3 from:a4 options:0];
}

+ (void)purgeLogs:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = v3;
    id v5 = (const char *)[v4 fileSystemRepresentation];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __20__OSALog_purgeLogs___block_invoke;
    v6[3] = &unk_1E5D1FF30;
    id v7 = v4;
    osa_scanDir(v5, 65, v6, 0);
  }
}

void __20__OSALog_purgeLogs___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(NSString, "stringWithUTF8String:");
  id v5 = [v4 pathExtension];
  char v6 = [v5 isEqualToString:@"proxy"];

  if ((v6 & 1) == 0)
  {
    id v7 = [OSALog alloc];
    id v8 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v4];
    id v24 = 0;
    unsigned int v9 = [(OSALog *)v7 initWithPath:v8 options:0 error:&v24];
    id v10 = v24;

    if (v9)
    {
      if ([(OSALog *)v9 retire:"opt-changed"])
      {
        id v11 = v10;
LABEL_12:

        goto LABEL_13;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __20__OSALog_purgeLogs___block_invoke_cold_3(a2, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __20__OSALog_purgeLogs___block_invoke_cold_2();
    }
    id v19 = (void *)MEMORY[0x1E4F1CB10];
    int v20 = [NSString stringWithUTF8String:a2];
    char v21 = [v19 fileURLWithPath:v20];
    id v23 = v10;
    char v22 = OSASafeRemoveFileAtURL(v21, &v23);
    id v11 = v23;

    if ((v22 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __20__OSALog_purgeLogs___block_invoke_cold_1();
    }
    goto LABEL_12;
  }
LABEL_13:
}

+ (void)iterateLogsWithOptions:(id)a3 usingBlock:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v36 = a4;
  char v6 = (void *)MEMORY[0x1AD0D8030]();
  id v7 = objc_opt_new();
  id v8 = [v5 objectForKeyedSubscript:@"override-filePath"];
  unsigned int v9 = +[OSASystemConfiguration sharedInstance];
  id v10 = v9;
  if (v8)
  {
    int v11 = [v9 isWhitelisted:v8 forDomain:@"transfer_paths"];

    if (v11)
    {
      [v7 addObject:v8];
    }
    else
    {
      char v35 = 0;
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = v8;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "path is not whitelisted for listing: %@", buf, 0xCu);
    }
    char v35 = 0;
  }
  else
  {
    uint64_t v12 = [v5 objectForKeyedSubscript:@"file-owner"];
    uint64_t v13 = [v10 pathSubmissionForOwner:v12];

    if (v13) {
      [v7 addObject:v13];
    }
    uint64_t v14 = [v5 objectForKeyedSubscript:@"datavault-filePath"];
    int v15 = [v14 BOOLValue];

    if (v15)
    {
      uint64_t v16 = +[OSASystemConfiguration sharedInstance];
      uint64_t v17 = [v16 pathSubmissionDataVault];

      if (v17)
      {
        [v7 addObject:v17];
        uint64_t v13 = (void *)v17;
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    uint64_t v18 = [v5 objectForKeyedSubscript:@"include-proxies"];
    char v35 = [v18 BOOLValue];
  }
LABEL_14:
  if ([v7 count])
  {
    id v19 = [v5 objectForKeyedSubscript:@"exclude-retired"];
    char v20 = [v19 BOOLValue];

    if (v20)
    {
      uint64_t v21 = 68;
    }
    else
    {
      char v22 = [v5 objectForKeyedSubscript:@"only-retired"];
      int v23 = [v22 BOOLValue];

      if (v23) {
        uint64_t v21 = 132;
      }
      else {
        uint64_t v21 = 4;
      }
    }
    id v33 = v5;
    id v24 = objc_msgSend(v5, "objectForKeyedSubscript:", @"only-urgent", v8);
    int v25 = [v24 BOOLValue];

    long long v44 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    if (v25) {
      uint64_t v26 = v21 | 0x200;
    }
    else {
      uint64_t v26 = v21;
    }
    long long v41 = 0uLL;
    id obj = v7;
    uint64_t v27 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = (const char *)[*(id *)(*((void *)&v41 + 1) + 8 * i) fileSystemRepresentation];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __44__OSALog_iterateLogsWithOptions_usingBlock___block_invoke;
          v39[3] = &unk_1E5D1FF58;
          id v40 = v36;
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __44__OSALog_iterateLogsWithOptions_usingBlock___block_invoke_2;
          v37[3] = &__block_descriptor_41_e13_B24__0r_8r_16l;
          v37[4] = v26;
          char v38 = v35;
          osa_scanDir(v31, v26, v39, v37);
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v28);
    }

    id v5 = v33;
    id v8 = v32;
  }
}

void __44__OSALog_iterateLogsWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  char v6 = [NSString stringWithUTF8String:a2];
  v10[0] = v6;
  id v7 = [NSString stringWithUTF8String:a3];
  v10[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  unsigned int v9 = [v5 fileURLWithPathComponents:v8];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);
}

uint64_t __44__OSALog_iterateLogsWithOptions_usingBlock___block_invoke_2(uint64_t a1)
{
  id v2 = objc_msgSend(NSString, "stringWithUTF8String:");
  id v3 = v2;
  if ((*(unsigned char *)(a1 + 32) & 0x40) != 0 || ([v2 isEqualToString:@"Retired"] & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v4 = [v3 hasPrefix:@"ProxiedDevice-"];
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

+ (id)commonFieldsForBody:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unsigned int v9 = @"bug_type";
  v10[0] = a3;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  id v5 = [v3 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  char v6 = +[OSALog additionalRootsInstalled];

  if (v6)
  {
    id v7 = (void *)[v5 mutableCopy];
    [v7 addEntriesFromDictionary:v6];

    id v5 = v7;
  }

  return v5;
}

+ (void)createRetiredDirectory:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Creating Retired directory in %@", buf, 0xCu);
  }
  id v4 = v3;
  uint64_t v5 = [v4 fileSystemRepresentation];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__OSALog_createRetiredDirectory___block_invoke;
  v7[3] = &unk_1E5D1FE50;
  id v8 = v4;
  id v6 = v4;
  OSASafeOpenReadOnly(v5, v7);
}

void __33__OSALog_createRetiredDirectory___block_invoke(uint64_t a1, int a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  memset(&v13, 0, sizeof(v13));
  if (fstat(a2, &v13))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __33__OSALog_createRetiredDirectory___block_invoke_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
    }
    id v10 = 0;
  }
  else
  {
    uint64_t v14 = @"file-owner-uid";
    uint64_t v11 = [NSNumber numberWithUnsignedInt:v13.st_uid];
    v15[0] = v11;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  uint64_t v12 = +[OSASystemConfiguration ensureUsablePath:*(void *)(a1 + 32) component:@"Retired" options:v10];
  +[OSALog markPurgeableLevel:75780 path:v12];
}

- (NSDictionary)metaData
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)deleteOnRetire
{
  return self->_deleteOnRetire;
}

- (void)setDeleteOnRetire:(BOOL)a3
{
  self->_deleteOnRetire = a3;
}

- (NSString)bugType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOldFilePath:(id)a3
{
}

- (void)initWithPath:forRouting:usingConfig:options:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = v0;
  uint64_t v4 = v1;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Log::initWithPath:'%@' forRouting:'%@' options:%@", v2, 0x20u);
}

- (void)rename:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)markPurgeableLevel:(int)a3 path:.cold.1(void *a1, uint64_t *a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 UTF8String];
  uint64_t v6 = __error();
  uint64_t v7 = strerror(*v6);
  uint64_t v8 = *a2;
  int v9 = 136315906;
  uint64_t v10 = v5;
  __int16 v11 = 1024;
  int v12 = a3;
  __int16 v13 = 2080;
  uint64_t v14 = v7;
  __int16 v15 = 2048;
  uint64_t v16 = v8;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to mark %s as purgeable %d (%s) (flags 0x%11llx)", (uint8_t *)&v9, 0x26u);
}

+ (void)locallyCreateForSubmission:(uint64_t)a3 metadata:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 writing:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)createForSubmission:metadata:options:error:writing:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136315138;
  uint64_t v1 = "com.apple.osanalytics.osanalyticshelper";
  _os_log_fault_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Couldn't get XPC connection to %s", (uint8_t *)&v0, 0xCu);
}

+ (void)createForSubmission:metadata:options:error:writing:.cold.2()
{
  *(_WORD *)int v0 = 0;
  _os_log_fault_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "(C6. report request completed successfully, but no filename returned!)", v0, 2u);
}

+ (void)createForSubmission:metadata:options:error:writing:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136315138;
  uint64_t v1 = "com.apple.osanalytics.osanalyticshelper";
  _os_log_fault_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Invalid connection to %s. Caller may need sandbox exception.", (uint8_t *)&v0, 0xCu);
}

void __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_cold_1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error while writing file: %{public}@", buf, 0xCu);
}

- (void)markWithKey:value:.cold.1()
{
  __error();
  int v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1A7C6D000, MEMORY[0x1E4F14500], v1, "marking failed for %@, [%d] %s", v2, v3, v4, v5, v6);
}

+ (void)markFile:withKey:value:.cold.1()
{
  __error();
  int v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1A7C6D000, MEMORY[0x1E4F14500], v1, "marking failed for %@, [%d] %s", v2, v3, v4, v5, v6);
}

+ (void)markDescriptor:forKey:withObj:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_3(&dword_1A7C6D000, MEMORY[0x1E4F14500], v1, "Unsupported ips/xattr type %@ for '%@'", v2, v3, v4, v5, 2u);
}

- (void)retire:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7C6D000, MEMORY[0x1E4F14500], v0, "Failed to remove retiring log '%{public}@': %{public}@", v1, v2, v3, v4, v5);
}

- (void)retire:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7C6D000, MEMORY[0x1E4F14500], v0, "Error retiring '%{public}@': %{public}@", v1, v2, v3, v4, v5);
}

void __17__OSALog_retire___block_invoke_cold_1()
{
  uint64_t v0 = __error();
  strerror(*v0);
  __error();
  OUTLINED_FUNCTION_5_0(&dword_1A7C6D000, MEMORY[0x1E4F14500], v1, "Error setting protection class after retiring %{public}@: %{public}s (%{public}i)", v2, v3, v4, v5, 2u);
}

void __25__OSALog_cleanupForUser___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0_3(&dword_1A7C6D000, MEMORY[0x1E4F14500], v2, "Failed to retrieve creation date from %{public}@: %{public}@", v3, v4, v5, v6, 2u);
}

void __20__OSALog_purgeLogs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1A7C6D000, MEMORY[0x1E4F14500], v0, "Error deleting non-retirable log at %s while purging: %@", v1, v2, v3, v4, v5);
}

void __20__OSALog_purgeLogs___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1A7C6D000, MEMORY[0x1E4F14500], v0, "Error creating log at %s while purging: %@", v1, v2, v3, v4, v5);
}

void __20__OSALog_purgeLogs___block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __33__OSALog_createRetiredDirectory___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end