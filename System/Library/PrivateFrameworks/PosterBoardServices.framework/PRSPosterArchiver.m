@interface PRSPosterArchiver
+ (BOOL)markURLPurgableAfterOneHour:(id)a3 error:(id *)a4;
+ (id)archiveConfiguration:(id)a3 error:(id *)a4;
+ (id)archiveConfiguration:(id)a3 format:(int64_t)a4 error:(id *)a5;
+ (id)archiveExtensionForFormat:(int64_t)a3;
+ (id)unarchiveConfigurationAtURL:(id)a3 error:(id *)a4;
+ (id)unarchiveConfigurationAtURL:(id)a3 format:(int64_t)a4 error:(id *)a5;
+ (id)unarchiveConfigurationFromData:(id)a3 error:(id *)a4;
+ (id)unarchiveConfigurationFromData:(id)a3 format:(int64_t)a4 error:(id *)a5;
+ (int64_t)formatForData:(id)a3;
+ (int64_t)formatForDataAtURL:(id)a3;
+ (int64_t)minSupportedArchiveVersion;
- (BSProcessHandle)processHandle;
- (NSFileManager)fileManager;
- (NSURL)unarchivingContainerURL;
- (PRSPosterArchiver)init;
- (PRSPosterArchiver)initWithFileManager:(id)a3;
- (PRSPosterArchiver)initWithFileManager:(id)a3 processHandle:(id)a4;
- (PRSPosterArchiver)initWithFileManager:(id)a3 processHandle:(id)a4 unarchivingContainerURL:(id)a5;
- (PRSPosterArchiver)initWithFileManager:(id)a3 unarchivingContainerURL:(id)a4;
- (id)_unarchiveWithHandler:(id)a3 manifest:(id *)a4 error:(id *)a5;
- (id)archiveConfiguration:(id)a3 error:(id *)a4;
- (id)archiveConfiguration:(id)a3 format:(int64_t)a4 error:(id *)a5;
- (id)unarchiveConfigurationAppleArchiveAtURL:(id)a3 manifest:(id *)a4 error:(id *)a5;
- (id)unarchiveConfigurationAppleArchiveData:(id)a3 manifest:(id *)a4 error:(id *)a5;
- (id)unarchiveConfigurationAtURL:(id)a3 error:(id *)a4;
- (id)unarchiveConfigurationAtURL:(id)a3 format:(int64_t)a4 error:(id *)a5;
- (id)unarchiveConfigurationFromData:(id)a3 error:(id *)a4;
- (id)unarchiveConfigurationFromData:(id)a3 format:(int64_t)a4 error:(id *)a5;
- (id)unarchiveConfigurationZipArchiveAtURL:(id)a3 manifest:(id *)a4 error:(id *)a5;
- (id)unarchiveConfigurationZipArchiveData:(id)a3 manifest:(id *)a4 error:(id *)a5;
- (void)setFileManager:(id)a3;
- (void)setProcessHandle:(id)a3;
- (void)setUnarchivingContainerURL:(id)a3;
@end

@implementation PRSPosterArchiver

+ (int64_t)minSupportedArchiveVersion
{
  return 1;
}

+ (id)archiveExtensionForFormat:(int64_t)a3
{
  if (a3 == 1) {
    return @"zapa";
  }
  else {
    return @"apa";
  }
}

+ (int64_t)formatForDataAtURL:(id)a3
{
  id v4 = a3;
  id v13 = 0;
  v5 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v4 error:&v13];
  id v6 = v13;
  if (v5)
  {
    id v12 = 0;
    v7 = [v5 readDataUpToLength:4 error:&v12];
    id v8 = v12;

    if (v7)
    {
      int64_t v9 = [a1 formatForData:v7];
    }
    else
    {
      v10 = PRSLogArchiver();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[PRSPosterArchiver formatForDataAtURL:]();
      }

      int64_t v9 = -1;
    }
  }
  else
  {
    v7 = PRSLogArchiver();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PRSPosterArchiver formatForDataAtURL:]();
    }
    int64_t v9 = -1;
    id v8 = v6;
  }

  return v9;
}

+ (int64_t)formatForData:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] < 4) {
    goto LABEL_12;
  }
  id v4 = (unsigned __int8 *)[v3 bytes];
  int v5 = *v4;
  if (v5 == 65)
  {
    if (v4[1] == 65 && v4[2] == 48 && v4[3] == 49)
    {
      int64_t v6 = 0;
      goto LABEL_13;
    }
LABEL_12:
    int64_t v6 = -1;
    goto LABEL_13;
  }
  if (v5 != 80 || v4[1] != 75 || v4[2] != 3 || v4[3] != 4) {
    goto LABEL_12;
  }
  int64_t v6 = 1;
LABEL_13:

  return v6;
}

+ (id)archiveConfiguration:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init(PRSPosterArchiver);
  int64_t v9 = [(PRSPosterArchiver *)v8 archiveConfiguration:v7 format:a4 error:a5];

  return v9;
}

+ (id)unarchiveConfigurationAtURL:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init(PRSPosterArchiver);
  int64_t v9 = [(PRSPosterArchiver *)v8 unarchiveConfigurationAtURL:v7 format:a4 error:a5];

  return v9;
}

+ (id)unarchiveConfigurationFromData:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init(PRSPosterArchiver);
  int64_t v9 = [(PRSPosterArchiver *)v8 unarchiveConfigurationFromData:v7 format:a4 error:a5];

  return v9;
}

+ (BOOL)markURLPurgableAfterOneHour:(id)a3 error:(id *)a4
{
  int v5 = (void *)MEMORY[0x1E4F1C9A8];
  id v6 = a3;
  id v7 = [v5 currentCalendar];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v8 setHour:1];
  int64_t v9 = [MEMORY[0x1E4F1C9C8] date];
  v10 = [v7 dateByAddingComponents:v8 toDate:v9 options:0];

  id v15 = 0;
  char v11 = objc_msgSend(v6, "prs_setPurgable:afterDate:error:", 1, v10, &v15);

  id v12 = v15;
  if (v12)
  {
    id v13 = PRSLogArchiver();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[PRSPosterArchiver markURLPurgableAfterOneHour:error:]();
    }

    if (a4) {
      *a4 = v12;
    }
  }

  return v11;
}

- (PRSPosterArchiver)init
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(PRSPosterArchiver *)self initWithFileManager:v3];

  return v4;
}

- (PRSPosterArchiver)initWithFileManager:(id)a3
{
  return [(PRSPosterArchiver *)self initWithFileManager:a3 processHandle:0 unarchivingContainerURL:0];
}

- (PRSPosterArchiver)initWithFileManager:(id)a3 unarchivingContainerURL:(id)a4
{
  return [(PRSPosterArchiver *)self initWithFileManager:a3 processHandle:0 unarchivingContainerURL:a4];
}

- (PRSPosterArchiver)initWithFileManager:(id)a3 processHandle:(id)a4
{
  return [(PRSPosterArchiver *)self initWithFileManager:a3 processHandle:a4 unarchivingContainerURL:0];
}

- (PRSPosterArchiver)initWithFileManager:(id)a3 processHandle:(id)a4 unarchivingContainerURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PRSPosterArchiver;
  id v12 = [(PRSPosterArchiver *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fileManager, a3);
    objc_storeStrong((id *)&v13->_processHandle, a4);
    objc_storeStrong((id *)&v13->_unarchivingContainerURL, a5);
  }

  return v13;
}

- (id)archiveConfiguration:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4 == -1)
  {
    v45 = PRSLogArchiver();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      -[PRSPosterArchiver archiveConfiguration:format:error:]();
    }

    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v84 = *MEMORY[0x1E4F28568];
    v85[0] = @"Cannot archive to unknown format";
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = (__CFString **)v85;
    id v13 = &v84;
    goto LABEL_16;
  }
  if (a4
    || ![(BSProcessHandle *)self->_processHandle hasEntitlement:@"com.apple.posterboardservices.disallowArchivingAppleArchive"])
  {
    v65 = a5;
    id v64 = v8;
    v14 = [[PRSPosterConfigurationAttributes alloc] initWithConfiguration:v8];
    objc_super v15 = [(PRSPosterConfigurationAttributes *)v14 extensionIdentifier];
    v16 = [[PRSPosterArchiveManifest alloc] initWithConfigurationAttributes:v14];
    v17 = [(PRSPosterConfigurationAttributes *)v14 posterUUID];
    v18 = [v17 UUIDString];
    v69 = v15;
    uint64_t v19 = [v15 stringByAppendingFormat:@"-%@", v18];

    uint64_t v20 = [(id)objc_opt_class() archiveExtensionForFormat:a4];
    v21 = [(PRSPosterArchiver *)self fileManager];
    v22 = [v21 temporaryDirectory];

    v23 = [v22 URLByAppendingPathComponent:v19];
    v72 = (void *)v20;
    v71 = [v23 URLByAppendingPathExtension:v20];

    v24 = [(PRSPosterArchiver *)self fileManager];
    id v79 = 0;
    v67 = v22;
    v25 = [v24 URLForDirectory:99 inDomain:1 appropriateForURL:v22 create:1 error:&v79];
    id v26 = v79;

    v73 = v25;
    v68 = (void *)v19;
    v27 = [v25 URLByAppendingPathComponent:v19];
    v28 = [(PRSPosterArchiver *)self fileManager];
    v29 = PFFileProtectionNoneAttributes();
    id v78 = v26;
    char v30 = [v28 createDirectoryAtURL:v27 withIntermediateDirectories:1 attributes:v29 error:&v78];
    id v31 = v78;

    v70 = v27;
    v66 = v16;
    if (v30)
    {
      id v77 = 0;
      v32 = [(PRSPosterArchiveManifest *)v16 dataRepresentationWithError:&v77];
      id v33 = v77;

      if (v32)
      {
        v34 = [v27 URLByAppendingPathComponent:@"manifest"];
        v35 = [v34 URLByAppendingPathExtension:@"plist"];

        id v76 = v33;
        char v36 = [v32 writeToURL:v35 options:0 error:&v76];
        id v37 = v76;

        if (v36)
        {
          v62 = v35;
          v38 = [(PRSPosterArchiver *)self fileManager];
          v39 = [(PRSPosterConfigurationAttributes *)v14 identifierURL];
          v40 = [v27 URLByAppendingPathComponent:@"configuration"];
          id v75 = v37;
          char v41 = [v38 copyItemAtURL:v39 toURL:v40 error:&v75];
          id v61 = v75;

          if (v41)
          {
            v42 = [v27 URLByAppendingPathExtension:v72];
            v43 = v65;
            if (a4)
            {
              v44 = [(PRSPosterArchiver *)self fileManager];
              PRSZipArchiverCompressDirectory(v27, v42, v44);
            }
            else
            {
              PRSAppleArchiveCompressDirectory(v27, v42);
            }
            v35 = v62;
            v51 = v42;
            v52 = [(PRSPosterArchiver *)self fileManager];
            [v52 removeItemAtURL:v71 error:0];

            v53 = [(PRSPosterArchiver *)self fileManager];
            id v74 = v61;
            v63 = v51;
            LODWORD(v51) = [v53 moveItemAtURL:v51 toURL:v71 error:&v74];
            id v37 = v74;

            if (v51) {
              id v49 = v71;
            }
            else {
              id v49 = 0;
            }
            v50 = v63;
            id v8 = v64;
          }
          else
          {
            v50 = PRSLogArchiver();
            v43 = v65;
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              id v37 = v61;
              -[PRSPosterArchiver archiveConfiguration:format:error:].cold.5();
              id v49 = 0;
            }
            else
            {
              id v49 = 0;
              id v37 = v61;
            }
            v35 = v62;
            id v8 = v64;
          }
        }
        else
        {
          v50 = PRSLogArchiver();
          id v8 = v64;
          v43 = v65;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            -[PRSPosterArchiver archiveConfiguration:format:error:].cold.6();
          }
          id v49 = 0;
        }

        id v33 = v37;
      }
      else
      {
        v35 = PRSLogArchiver();
        id v8 = v64;
        v43 = v65;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[PRSPosterArchiver archiveConfiguration:format:error:].cold.4();
        }
        id v49 = 0;
      }

      id v31 = v33;
    }
    else
    {
      v32 = PRSLogArchiver();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[PRSPosterArchiver archiveConfiguration:format:error:].cold.7();
      }
      id v49 = 0;
      id v8 = v64;
      v43 = v65;
    }
    v54 = v73;

    v55 = [(PRSPosterArchiver *)self fileManager];
    [v55 removeItemAtURL:v73 error:0];

    if (v49)
    {
      v56 = v71;
      [(id)objc_opt_class() markURLPurgableAfterOneHour:v71 error:0];
      if (!v43)
      {
LABEL_41:
        id v47 = v49;

        v48 = v47;
        goto LABEL_42;
      }
    }
    else
    {
      v58 = PRSLogArchiver();
      v56 = v71;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        -[PRSPosterArchiver archiveConfiguration:format:error:]();
      }

      if (v31)
      {
        uint64_t v80 = *MEMORY[0x1E4F28A50];
        id v81 = v31;
        v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
      }
      else
      {
        v59 = 0;
      }
      uint64_t v60 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PRSPosterArchiverErrorDomain" code:2 userInfo:v59];

      id v31 = (id)v60;
      v54 = v73;
      if (!v43) {
        goto LABEL_41;
      }
    }
    id *v43 = v31;
    goto LABEL_41;
  }
  id v9 = PRSLogArchiver();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[PRSPosterArchiver archiveConfiguration:format:error:]();
  }

  id v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v82 = *MEMORY[0x1E4F28568];
  v83 = @"Process has disallow AppleArchive entitlement and thus cannot archive to that format";
  id v11 = (void *)MEMORY[0x1E4F1C9E8];
  id v12 = &v83;
  id v13 = &v82;
LABEL_16:
  v46 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
  id v47 = [v10 errorWithDomain:@"PRSPosterArchiverErrorDomain" code:6 userInfo:v46];

  if (a5)
  {
    id v47 = v47;
    v48 = 0;
    *a5 = v47;
  }
  else
  {
    v48 = 0;
  }
LABEL_42:

  return v48;
}

- (id)unarchiveConfigurationAtURL:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4 == -1) {
    a4 = [(id)objc_opt_class() formatForDataAtURL:v8];
  }
  if (a4 == 1)
  {
    uint64_t v21 = 0;
    uint64_t v14 = [(PRSPosterArchiver *)self unarchiveConfigurationZipArchiveAtURL:v8 manifest:&v21 error:a5];
LABEL_18:
    v18 = (void *)v14;
    goto LABEL_19;
  }
  if (!a4)
  {
    if ([(BSProcessHandle *)self->_processHandle hasEntitlement:@"com.apple.posterboardservices.disallowArchivingAppleArchive"])
    {
      objc_super v15 = PRSLogArchiver();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[PRSPosterArchiver unarchiveConfigurationAtURL:format:error:]();
      }

      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23 = @"Process has disallow AppleArchive entitlement and thus cannot unarchive that format";
      id v11 = (void *)MEMORY[0x1E4F1C9E8];
      id v12 = &v23;
      id v13 = &v22;
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  if (a4 != -1)
  {
LABEL_17:
    uint64_t v20 = 0;
    uint64_t v14 = [(PRSPosterArchiver *)self unarchiveConfigurationAppleArchiveAtURL:v8 manifest:&v20 error:a5];
    goto LABEL_18;
  }
  id v9 = PRSLogArchiver();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[PRSPosterArchiver unarchiveConfigurationAtURL:format:error:]();
  }

  id v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v24 = *MEMORY[0x1E4F28568];
  v25[0] = @"Unable to resolve format for file to be unarchived";
  id v11 = (void *)MEMORY[0x1E4F1C9E8];
  id v12 = (__CFString **)v25;
  id v13 = &v24;
LABEL_14:
  v16 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
  v17 = [v10 errorWithDomain:@"PRSPosterArchiverErrorDomain" code:6 userInfo:v16];

  if (a5) {
    *a5 = v17;
  }

  v18 = 0;
LABEL_19:

  return v18;
}

- (id)unarchiveConfigurationFromData:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4 == -1) {
    a4 = [(id)objc_opt_class() formatForData:v8];
  }
  if (a4 == 1)
  {
    uint64_t v21 = 0;
    uint64_t v14 = [(PRSPosterArchiver *)self unarchiveConfigurationZipArchiveData:v8 manifest:&v21 error:a5];
LABEL_18:
    v18 = (void *)v14;
    goto LABEL_19;
  }
  if (!a4)
  {
    if ([(BSProcessHandle *)self->_processHandle hasEntitlement:@"com.apple.posterboardservices.disallowArchivingAppleArchive"])
    {
      objc_super v15 = PRSLogArchiver();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[PRSPosterArchiver unarchiveConfigurationAtURL:format:error:]();
      }

      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23 = @"Process has disallow AppleArchive entitlement and thus cannot unarchive that format";
      id v11 = (void *)MEMORY[0x1E4F1C9E8];
      id v12 = &v23;
      id v13 = &v22;
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  if (a4 != -1)
  {
LABEL_17:
    uint64_t v20 = 0;
    uint64_t v14 = [(PRSPosterArchiver *)self unarchiveConfigurationAppleArchiveData:v8 manifest:&v20 error:a5];
    goto LABEL_18;
  }
  id v9 = PRSLogArchiver();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[PRSPosterArchiver unarchiveConfigurationAtURL:format:error:]();
  }

  id v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v24 = *MEMORY[0x1E4F28568];
  v25[0] = @"Unable to resolve format for file to be unarchived";
  id v11 = (void *)MEMORY[0x1E4F1C9E8];
  id v12 = (__CFString **)v25;
  id v13 = &v24;
LABEL_14:
  v16 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
  v17 = [v10 errorWithDomain:@"PRSPosterArchiverErrorDomain" code:6 userInfo:v16];

  if (a5) {
    *a5 = v17;
  }

  v18 = 0;
LABEL_19:

  return v18;
}

- (id)unarchiveConfigurationAppleArchiveAtURL:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PRSPosterArchiver_unarchiveConfigurationAppleArchiveAtURL_manifest_error___block_invoke;
  v12[3] = &unk_1E5D00950;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(PRSPosterArchiver *)self _unarchiveWithHandler:v12 manifest:a4 error:a5];

  return v10;
}

BOOL __76__PRSPosterArchiver_unarchiveConfigurationAppleArchiveAtURL_manifest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(id *)(a1 + 32);
  id v4 = a2;
  int v5 = AAFileStreamOpenWithPath((const char *)[v3 fileSystemRepresentation], 0, 0);
  BOOL v6 = PRSAppleArchiveDecompressStream(v5, v4);

  return v6;
}

- (id)unarchiveConfigurationZipArchiveAtURL:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PRSPosterArchiver_unarchiveConfigurationZipArchiveAtURL_manifest_error___block_invoke;
  v12[3] = &unk_1E5D00950;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(PRSPosterArchiver *)self _unarchiveWithHandler:v12 manifest:a4 error:a5];

  return v10;
}

uint64_t __74__PRSPosterArchiver_unarchiveConfigurationZipArchiveAtURL_manifest_error___block_invoke(uint64_t a1, NSURL *a2)
{
  return PRSUnarchiverZip(*(NSURL **)(a1 + 32), a2);
}

- (id)unarchiveConfigurationAppleArchiveData:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [MEMORY[0x1E4F28F48] pipe];
  id v10 = [v9 fileHandleForWriting];
  id v11 = [v9 fileHandleForReading];
  Serial = BSDispatchQueueCreateSerial();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PRSPosterArchiver_unarchiveConfigurationAppleArchiveData_manifest_error___block_invoke;
  block[3] = &unk_1E5D00978;
  id v21 = v10;
  id v22 = v8;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(Serial, block);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__PRSPosterArchiver_unarchiveConfigurationAppleArchiveData_manifest_error___block_invoke_2;
  v18[3] = &unk_1E5D00950;
  id v19 = v11;
  id v15 = v11;
  v16 = [(PRSPosterArchiver *)self _unarchiveWithHandler:v18 manifest:a4 error:a5];
  [v15 closeFile];

  return v16;
}

uint64_t __75__PRSPosterArchiver_unarchiveConfigurationAppleArchiveData_manifest_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) writeData:*(void *)(a1 + 40) error:0];
  v2 = *(void **)(a1 + 32);
  return [v2 closeFile];
}

BOOL __75__PRSPosterArchiver_unarchiveConfigurationAppleArchiveData_manifest_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = AAFileStreamOpenWithFD([v2 fileDescriptor], 0);
  BOOL v5 = PRSAppleArchiveDecompressStream(v4, v3);

  return v5;
}

- (id)unarchiveConfigurationZipArchiveData:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PRSPosterArchiver_unarchiveConfigurationZipArchiveData_manifest_error___block_invoke;
  v12[3] = &unk_1E5D00950;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(PRSPosterArchiver *)self _unarchiveWithHandler:v12 manifest:a4 error:a5];

  return v10;
}

uint64_t __73__PRSPosterArchiver_unarchiveConfigurationZipArchiveData_manifest_error___block_invoke(uint64_t a1, NSURL *a2)
{
  return PRSUnarchiverZip(*(NSData **)(a1 + 32), a2);
}

- (id)_unarchiveWithHandler:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  v113[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = (uint64_t (**)(id, void *))a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [(PRSPosterArchiver *)self fileManager];
  id v9 = [v8 temporaryDirectory];
  id v10 = [(PRSPosterArchiver *)self unarchivingContainerURL];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
    if (([v10 checkResourceIsReachableAndReturnError:0] & 1) == 0)
    {
      id v12 = v9;

      id v13 = PRSLogArchiver();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.9((uint64_t)v11, v13, v14);
      }
    }
  }
  else
  {
    id v12 = v9;
  }
  if ([v11 checkResourceIsReachableAndReturnError:0])
  {
    id v15 = v11;
  }
  else
  {
    id v15 = [v9 URLByAppendingPathComponent:@"PosterConfigurations"];
  }
  v98 = v15;
  id v107 = 0;
  v16 = [v8 URLForDirectory:99 inDomain:1 appropriateForURL:v12 create:1 error:&v107];
  id v17 = v107;
  if (v16)
  {
    v95 = v9;
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = __58__PRSPosterArchiver__unarchiveWithHandler_manifest_error___block_invoke;
    v104[3] = &unk_1E5D00978;
    id v93 = v7;
    id v18 = v7;
    id v105 = v18;
    id v19 = v8;
    id v106 = v19;
    uint64_t v96 = MEMORY[0x1AD0D2EC0](v104);
    id v94 = v12;
    if (v6[2](v6, v16))
    {
      v85 = v8;
      uint64_t v20 = v6;
      v89 = v19;
      uint64_t v21 = [v16 URLByAppendingPathComponent:@"configuration"];
      id v22 = [v16 URLByAppendingPathComponent:@"manifest"];
      uint64_t v23 = [v22 URLByAppendingPathExtension:@"plist"];

      uint64_t v24 = (void *)v21;
      [v18 addObject:v21];
      [v18 addObject:v23];
      id v103 = v17;
      v87 = (void *)v23;
      v25 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v23 options:0 error:&v103];
      id v26 = v103;

      if (v25)
      {
        v83 = v25;
        v27 = [[PRSPosterArchiveManifest alloc] initWithDataRepresentation:v25];
        if (v27)
        {
          p_super = &v27->super;
          uint64_t v29 = [(PRSPosterArchiveManifest *)v27 archiveVersion];
          BOOL v6 = v20;
          id v81 = v24;
          if (v29 >= [(id)objc_opt_class() minSupportedArchiveVersion])
          {
            v45 = [p_super extensionIdentifier];
            uint64_t v46 = [v16 URLByAppendingPathComponent:v45];

            id v47 = (void *)MEMORY[0x1E4F1CB10];
            v48 = [p_super configurationUUID];
            id v79 = v46;
            id v49 = objc_msgSend(v47, "pf_posterPathIdentifierURLProviderURL:type:posterUUID:", v46, 3, v48);

            uint64_t v80 = v49;
            v50 = [v49 URLByDeletingLastPathComponent];
            v51 = PFPosterPathFileAttributes();
            id v102 = v26;
            char v78 = [v89 createDirectoryAtURL:v50 withIntermediateDirectories:1 attributes:v51 error:&v102];
            id v52 = v102;

            id v8 = v85;
            if (v78)
            {
              id v101 = v52;
              uint64_t v24 = v81;
              char v53 = [v89 copyItemAtURL:v81 toURL:v80 error:&v101];
              id v54 = v101;

              if (v53)
              {
                if (a4)
                {
                  p_super = p_super;
                  *a4 = p_super;
                }
              }
              else
              {
                v57 = PRSLogArchiver();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                  -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.7();
                }

                p_super = 0;
              }
              id v91 = v54;
              v25 = v83;
              v55 = v80;
            }
            else
            {
              v55 = v80;
              v56 = PRSLogArchiver();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
                -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.8();
              }

              p_super = 0;
              uint64_t v24 = v81;
              v25 = v83;
              id v91 = v52;
            }
            v35 = p_super;

            p_super = v79;
            id v26 = v91;
          }
          else
          {
            char v30 = PRSLogArchiver();
            id v8 = v85;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.6(p_super, (uint64_t)self, v30);
            }

            id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v110 = *MEMORY[0x1E4F28568];
            v32 = objc_msgSend(NSString, "stringWithFormat:", @"Archive version %lu is older than min supported %lu", -[NSObject archiveVersion](p_super, "archiveVersion"), objc_msgSend((id)objc_opt_class(), "minSupportedArchiveVersion"));
            v111 = v32;
            id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
            uint64_t v34 = [v31 initWithDomain:@"PRSPosterArchiverErrorDomain" code:4 userInfo:v33];

            v35 = 0;
            id v26 = (id)v34;
            uint64_t v24 = v81;
            v25 = v83;
          }
        }
        else
        {
          v42 = PRSLogArchiver();
          BOOL v6 = v20;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.5();
          }

          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v112 = *MEMORY[0x1E4F28568];
          v113[0] = @"Archive is unsupported";
          p_super = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:&v112 count:1];
          uint64_t v44 = [v43 initWithDomain:@"PRSPosterArchiverErrorDomain" code:4 userInfo:p_super];

          v35 = 0;
          id v26 = (id)v44;
          v25 = v83;
          id v8 = v85;
        }
      }
      else
      {
        p_super = PRSLogArchiver();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.4();
        }
        v35 = 0;
        BOOL v6 = v20;
        id v8 = v85;
      }

      BOOL v38 = v26 != 0;
      if (v35)
      {
        v39 = (void (**)(void))v96;
        if (!v26)
        {
          uint64_t v84 = v6;
          (*(void (**)(uint64_t))(v96 + 16))(v96);
          v58 = [v35 configurationUUID];
          v59 = [v58 UUIDString];
          uint64_t v60 = [v98 URLByAppendingPathComponent:v59];

          id v61 = [v35 extensionIdentifier];
          uint64_t v82 = v16;
          uint64_t v62 = [v16 URLByAppendingPathComponent:v61];

          v63 = PFPosterPathFileAttributes();
          id v100 = 0;
          [v89 createDirectoryAtURL:v60 withIntermediateDirectories:1 attributes:v63 error:&v100];
          id v64 = v100;

          v65 = [v35 extensionIdentifier];
          uint64_t v66 = [v60 URLByAppendingPathComponent:v65 isDirectory:1];

          id v99 = v64;
          v92 = (void *)v62;
          [v89 moveItemAtURL:v62 toURL:v66 error:&v99];
          id v26 = v99;

          v67 = (void *)MEMORY[0x1E4F924C8];
          v68 = [v35 extensionIdentifier];
          v69 = [v35 role];
          v70 = [v35 configurationUUID];
          uint64_t v71 = objc_msgSend(v67, "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", v68, 0, v69, v70, -[NSObject latestConfigurationVersion](v35, "latestConfigurationVersion"), -[NSObject latestConfigurationSupplement](v35, "latestConfigurationSupplement"));

          v88 = (void *)v66;
          v72 = [MEMORY[0x1E4F924D0] pathWithProviderURL:v66 identity:v71];
          id v73 = [[PRSPosterConfiguration alloc] _initWithPath:v72];
          v86 = (void *)v71;
          if (v73)
          {
            v16 = v82;
            BOOL v6 = v84;
          }
          else
          {
            id v74 = PRSLogArchiver();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
              -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:]();
            }

            v16 = v82;
            BOOL v6 = v84;
            if (v26)
            {
              uint64_t v108 = *MEMORY[0x1E4F28A50];
              id v109 = v26;
              id v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
            }
            else
            {
              id v75 = 0;
            }
            uint64_t v76 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PRSPosterArchiverErrorDomain" code:3 userInfo:v75];

            id v26 = (id)v76;
          }
          [v89 removeItemAtURL:v16 error:0];
          id v7 = v93;
          if (a5 && v26) {
            *a5 = v26;
          }
          id v37 = v73;

          v39 = (void (**)(void))v96;
LABEL_66:

          id v17 = v26;
          id v12 = v94;
          id v9 = v95;
          goto LABEL_67;
        }
LABEL_25:
        [(NSFileManager *)self->_fileManager removeItemAtURL:v16 error:0];
        v39[2](v39);
        v40 = PRSLogArchiver();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:]();
        }

        if (a5) {
          BOOL v41 = v38;
        }
        else {
          BOOL v41 = 0;
        }
        if (v41)
        {
          id v26 = v26;
          id v37 = 0;
          *a5 = v26;
        }
        else
        {
          id v37 = 0;
        }
        id v7 = v93;
        goto LABEL_66;
      }
    }
    else
    {
      id v26 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PRSPosterArchiverErrorDomain" code:3 userInfo:0];

      v35 = 0;
      BOOL v38 = v26 != 0;
    }
    v39 = (void (**)(void))v96;
    goto LABEL_25;
  }
  char v36 = PRSLogArchiver();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:]();
  }

  id v37 = 0;
  if (a5 && v17)
  {
    id v17 = v17;
    id v37 = 0;
    *a5 = v17;
  }
LABEL_67:

  return v37;
}

void __58__PRSPosterArchiver__unarchiveWithHandler_manifest_error___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__PRSPosterArchiver__unarchiveWithHandler_manifest_error___block_invoke_2;
  v3[3] = &unk_1E5D009A0;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v3];
  [*(id *)(a1 + 32) removeAllObjects];
}

uint64_t __58__PRSPosterArchiver__unarchiveWithHandler_manifest_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeItemAtURL:a2 error:0];
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (void)setProcessHandle:(id)a3
{
}

- (NSURL)unarchivingContainerURL
{
  return self->_unarchivingContainerURL;
}

- (void)setUnarchivingContainerURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unarchivingContainerURL, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

+ (id)archiveConfiguration:(id)a3 error:(id *)a4
{
  return (id)[a1 archiveConfiguration:a3 format:0 error:a4];
}

+ (id)unarchiveConfigurationAtURL:(id)a3 error:(id *)a4
{
  return (id)[a1 unarchiveConfigurationAtURL:a3 format:-1 error:a4];
}

+ (id)unarchiveConfigurationFromData:(id)a3 error:(id *)a4
{
  return (id)[a1 unarchiveConfigurationFromData:a3 format:-1 error:a4];
}

- (id)archiveConfiguration:(id)a3 error:(id *)a4
{
  return [(PRSPosterArchiver *)self archiveConfiguration:a3 format:0 error:a4];
}

- (id)unarchiveConfigurationAtURL:(id)a3 error:(id *)a4
{
  return [(PRSPosterArchiver *)self unarchiveConfigurationAtURL:a3 format:-1 error:a4];
}

- (id)unarchiveConfigurationFromData:(id)a3 error:(id *)a4
{
  return [(PRSPosterArchiver *)self unarchiveConfigurationFromData:a3 format:-1 error:a4];
}

+ (void)formatForDataAtURL:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1A78AC000, v0, v1, "Could not open file handle for reading from URL %@: %@");
}

+ (void)formatForDataAtURL:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1A78AC000, v0, v1, "Could not read data from file handle %@: %@");
}

+ (void)markURLPurgableAfterOneHour:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "Failed to mark URL as purgable: %{public}@", v2);
}

- (void)archiveConfiguration:format:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1A78AC000, v0, v1, "Cannot archive to unknown format", v2, v3, v4, v5, v6);
}

- (void)archiveConfiguration:format:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1A78AC000, v0, v1, "Process has disallow AppleArchive entitlement and thus cannot archive to that format", v2, v3, v4, v5, v6);
}

- (void)archiveConfiguration:format:error:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1A78AC000, v0, v1, "Failed to get final archive URL", v2, v3, v4, v5, v6);
}

- (void)archiveConfiguration:format:error:.cold.4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "Unable to create poster manifest data: %@", v2);
}

- (void)archiveConfiguration:format:error:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1A78AC000, v0, v1, "Unable to copy configuration contents to container URL %@ : %@");
}

- (void)archiveConfiguration:format:error:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1A78AC000, v0, v1, "Unable to write manifest data to URL %@: %@");
}

- (void)archiveConfiguration:format:error:.cold.7()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "Unable to create container directory for archiving: %@", v2);
}

- (void)unarchiveConfigurationAtURL:format:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1A78AC000, v0, v1, "Unable to resolve format for file to be unarchived", v2, v3, v4, v5, v6);
}

- (void)unarchiveConfigurationAtURL:format:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1A78AC000, v0, v1, "Process has disallow AppleArchive entitlement and thus cannot unarchive that format", v2, v3, v4, v5, v6);
}

- (void)_unarchiveWithHandler:manifest:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "Unable to create placement URL: %@", v2);
}

- (void)_unarchiveWithHandler:manifest:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1A78AC000, v0, v1, "Manifest is nil due to prior errors (or not found), bailing.", v2, v3, v4, v5, v6);
}

- (void)_unarchiveWithHandler:manifest:error:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "Unable to create incoming poster configuration: %@", v2);
}

- (void)_unarchiveWithHandler:manifest:error:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1A78AC000, v0, v1, "Manifest data failed to load from URL %@, error: %@");
}

- (void)_unarchiveWithHandler:manifest:error:.cold.5()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1A78AC000, v0, v1, "No manifest found, Unsupported archive", v2, v3, v4, v5, v6);
}

- (void)_unarchiveWithHandler:(void *)a1 manifest:(uint64_t)a2 error:(NSObject *)a3 .cold.6(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  uint64_t v6 = [a1 archiveVersion];
  __int16 v7 = 2048;
  uint64_t v8 = [(id)objc_opt_class() minSupportedArchiveVersion];
  OUTLINED_FUNCTION_8(&dword_1A78AC000, a3, v4, "Archive version %lu is older than min supported %lu", (uint8_t *)&v5);
}

- (void)_unarchiveWithHandler:manifest:error:.cold.7()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "Unable to copy contents for poster configuration: %@", v2);
}

- (void)_unarchiveWithHandler:manifest:error:.cold.8()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "Unable to create directory for poster configuration: %@", v2);
}

- (void)_unarchiveWithHandler:(uint64_t)a1 manifest:(NSObject *)a2 error:(uint64_t)a3 .cold.9(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = 0;
  OUTLINED_FUNCTION_8(&dword_1A78AC000, a2, a3, "unarchivingContainerURL %@ is not reachable URL : %@", (uint8_t *)&v3);
}

@end