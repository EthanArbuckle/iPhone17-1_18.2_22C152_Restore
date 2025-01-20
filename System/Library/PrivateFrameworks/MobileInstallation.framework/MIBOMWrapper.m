@interface MIBOMWrapper
+ (BOOL)_countFilesAndBytesInArchiveAtURL:(id)a3 withBOMCopier:(_BOMCopier *)a4 totalFiles:(unint64_t *)a5 totalUncompressedBytes:(unint64_t *)a6 error:(id *)a7;
+ (BOOL)extractZipArchiveAtURL:(id)a3 toURL:(id)a4 withError:(id *)a5;
+ (BOOL)extractZipArchiveAtURL:(id)a3 toURL:(id)a4 withError:(id *)a5 extractionProgressBlock:(id)a6;
@end

@implementation MIBOMWrapper

+ (BOOL)_countFilesAndBytesInArchiveAtURL:(id)a3 withBOMCopier:(_BOMCopier *)a4 totalFiles:(unint64_t *)a5 totalUncompressedBytes:(unint64_t *)a6 error:(id *)a7
{
  [a3 fileSystemRepresentation];
  uint64_t v8 = BOMCopierCountFilesInArchive();
  uint64_t v10 = v8;
  if (v8 == -1)
  {
    int v12 = *__error();
    v13 = (void *)*MEMORY[0x1E4F6F548];
    if (v12) {
      strerror(v12);
    }
  }
  else
  {
    if (!v8)
    {
      id v11 = 0;
      goto LABEL_10;
    }
    v13 = (void *)*MEMORY[0x1E4F6F548];
  }
  _CreateError((uint64_t)"+[MIBOMWrapper _countFilesAndBytesInArchiveAtURL:withBOMCopier:totalFiles:totalUncompressedBytes:error:]", 149, v13, 4, 0, 0, @"Failed to count the files and bytes in archive : %d (%s)", v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (a7 && v11)
  {
    id v11 = v11;
    *a7 = v11;
  }
LABEL_10:
  BOOL v14 = v11 == 0;

  return v14;
}

+ (BOOL)extractZipArchiveAtURL:(id)a3 toURL:(id)a4 withError:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  LOBYTE(a5) = [(id)objc_opt_class() extractZipArchiveAtURL:v8 toURL:v7 withError:a5 extractionProgressBlock:0];

  return (char)a5;
}

+ (BOOL)extractZipArchiveAtURL:(id)a3 toURL:(id)a4 withError:(id *)a5 extractionProgressBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void, double))a6;
  long long v43 = 0u;
  long long v44 = 0u;
  int v12 = objc_opt_new();
  v13 = v12;
  if (a5) {
    *a5 = 0;
  }
  [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"extractPKZip"];
  uint64_t v42 = 0;
  BomSys_init();
  BomSys_set_open();
  uint64_t v15 = BOMCopierNewWithSys();
  if (v15)
  {
    BOMCopierSetFileErrorHandler();
    BOMCopierSetFatalErrorHandler();
    BOMCopierSetFatalFileErrorHandler();
    BOMCopierSetUserData();
    if (v11)
    {
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      id v39 = 0;
      char v16 = [(id)objc_opt_class() _countFilesAndBytesInArchiveAtURL:v9 withBOMCopier:v15 totalFiles:&v41 totalUncompressedBytes:&v40 error:&v39];
      id v17 = v39;
      uint64_t v18 = v40;
      if (v40) {
        char v19 = v16;
      }
      else {
        char v19 = 0;
      }
      if (v19)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v38 = [v9 path];
          MOLogWrite();

          uint64_t v18 = v40;
        }
        v20 = (void *)MEMORY[0x1BA996BD0](v11);
        *((void *)&v43 + 1) = v18;
        *(void *)&long long v44 = 0;
        uint64_t v21 = MEMORY[0x1BA996BD0]();
        v22 = (void *)*((void *)&v44 + 1);
        *((void *)&v44 + 1) = v21;

        BOMCopierSetCopyFileFinishedHandler();
        BOMCopierSetCopyFileUpdateHandler();
      }
      else
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v38 = [v9 path];
          MOLogWrite();
        }
        v11[2](v11, -1.0);
      }
    }
    id v26 = v9;
    id v27 = v10;
    id v28 = v13;
    if (!v28) {
      id v28 = (id)objc_opt_new();
    }
    MIAssertHighResourceUsage();
    id v29 = v26;
    [v29 fileSystemRepresentation];
    id v30 = v27;
    [v30 fileSystemRepresentation];
    int v31 = BOMCopierCopyWithOptions();
    MIClearResourceAssertion();

    int v32 = v31 | BYTE4(v43);
    BOOL v25 = v32 == 0;
    if (v32)
    {
      v33 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:(int)v43 userInfo:0];
      v23 = _CreateAndLogError((uint64_t)"+[MIBOMWrapper extractZipArchiveAtURL:toURL:withError:extractionProgressBlock:]", 223, (void *)*MEMORY[0x1E4F6F548], 5, v33, &unk_1F0DCF0F0, @"Could not extract archive", v34, (uint64_t)v38);
    }
    else
    {
      v23 = 0;
    }
    v35 = (void *)*((void *)&v44 + 1);
    *((void *)&v44 + 1) = 0;

    BOMCopierFree();
  }
  else
  {
    v23 = _CreateAndLogError((uint64_t)"+[MIBOMWrapper extractZipArchiveAtURL:toURL:withError:extractionProgressBlock:]", 189, (void *)*MEMORY[0x1E4F6F548], 5, 0, 0, @"Failed to create copier", v14, (uint64_t)v38);
    v24 = (void *)*((void *)&v44 + 1);
    *((void *)&v44 + 1) = 0;

    BOOL v25 = 0;
  }
  if (v42) {
    BomSys_free();
  }
  if (a5) {
    char v36 = v25;
  }
  else {
    char v36 = 1;
  }
  if ((v36 & 1) == 0) {
    *a5 = v23;
  }

  return v25;
}

@end