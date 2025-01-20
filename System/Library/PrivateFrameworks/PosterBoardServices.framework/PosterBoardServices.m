id PRSLogCommon()
{
  void *v0;
  uint64_t vars8;

  if (PRSLogCommon_onceToken != -1) {
    dispatch_once(&PRSLogCommon_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)PRSLogCommon___logObj;
  return v0;
}

id __descriptorsForPath_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PRSPosterDescriptor alloc] _initWithPath:v2];

  return v3;
}

uint64_t __PRSLogCommon_block_invoke()
{
  PRSLogCommon___logObj = (uint64_t)os_log_create("com.apple.PosterBoardServices", "Common");
  return MEMORY[0x1F41817F8]();
}

void sub_1A78AEE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PaperBoardUILibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __PaperBoardUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5D007D0;
    uint64_t v6 = 0;
    PaperBoardUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v2 = (void *)PaperBoardUILibraryCore_frameworkLibrary;
  if (!PaperBoardUILibraryCore_frameworkLibrary) {
    __getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "PBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                         + 24);
  return result;
}

uint64_t __PaperBoardUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PaperBoardUILibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id PRSLogObserver()
{
  if (PRSLogObserver_onceToken != -1) {
    dispatch_once(&PRSLogObserver_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)PRSLogObserver___logObj;
  return v0;
}

uint64_t __PRSLogObserver_block_invoke()
{
  PRSLogObserver___logObj = (uint64_t)os_log_create("com.apple.PosterBoardServices", "Observer");
  return MEMORY[0x1F41817F8]();
}

id PRSLogPosterContents()
{
  if (PRSLogPosterContents_onceToken != -1) {
    dispatch_once(&PRSLogPosterContents_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)PRSLogPosterContents___logObj;
  return v0;
}

uint64_t __PRSLogPosterContents_block_invoke()
{
  PRSLogPosterContents___logObj = (uint64_t)os_log_create("com.apple.PosterBoardServices", "PosterContents");
  return MEMORY[0x1F41817F8]();
}

id PRSLogArchiver()
{
  if (PRSLogArchiver_onceToken != -1) {
    dispatch_once(&PRSLogArchiver_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)PRSLogArchiver___logObj;
  return v0;
}

uint64_t __PRSLogArchiver_block_invoke()
{
  PRSLogArchiver___logObj = (uint64_t)os_log_create("com.apple.PosterBoardServices", "Archiver");
  return MEMORY[0x1F41817F8]();
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return objc_opt_class();
}

void PRSAppleArchiveCompressDirectory(void *a1, void *a2)
{
  id v12 = a1;
  id v3 = AAFileStreamOpenWithPath((const char *)[a2 fileSystemRepresentation], 514, 0x1A4u);
  if (v3)
  {
    v4 = v3;
    AAArchiveStream v5 = AAEncodeArchiveOutputStreamOpen(v3, 0, 0, 0, 0);
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = v12;
      AAPathList v8 = AAPathListCreateWithDirectoryContents((const char *)[v7 fileSystemRepresentation], 0, 0, 0, 0, 0);
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = AAFieldKeySetCreateWithString("TYP,PAT,LNK,DEV,DAT,MOD,FLG,MTM,BTM,CTM,HLC,CLC");
        if (v10)
        {
          v11 = v10;
          AAArchiveStreamWritePathList(v6, v9, v10, (const char *)[v7 fileSystemRepresentation], 0, 0, 0, 0);
          AAFieldKeySetDestroy(v11);
        }
        AAPathListDestroy(v9);
      }
      AAArchiveStreamClose(v6);
    }
    AAByteStreamClose(v4);
  }
}

uint64_t PRSZipArchiverCompressDirectory(void *a1, void *a2, void *a3)
{
  AAArchiveStream v5 = a1;
  id v6 = a2;
  id v7 = a3;
  AAPathList v8 = PRSArchiverZipData(v5, v7);
  if (!v8)
  {
    id v12 = PRSLogArchiver();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      PRSZipArchiverCompressDirectory_cold_1();
    }
    goto LABEL_11;
  }
  uint64_t v9 = [v6 URLByDeletingLastPathComponent];
  uint64_t v10 = PFPosterPathFileAttributes();
  id v16 = 0;
  BOOL v11 = [(NSFileManager *)v7 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:v10 error:&v16];
  id v12 = v16;

  if (!v11)
  {
    v14 = PRSLogArchiver();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      PRSZipArchiverCompressDirectory_cold_3();
    }
    goto LABEL_10;
  }
  uint64_t v13 = 1;
  if (([v8 writeToURL:v6 atomically:1] & 1) == 0)
  {
    v14 = PRSLogArchiver();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      PRSZipArchiverCompressDirectory_cold_2();
    }
LABEL_10:

LABEL_11:
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t PRSUnarchiverZip(NSURL *a1, NSURL *a2)
{
  id v3 = a1;
  v4 = a2;
  AAArchiveStream v5 = v4;
  uint64_t v6 = 0;
  if (!v3 || !v4) {
    goto LABEL_14;
  }
  if (![(NSURL *)v3 isFileURL])
  {
    uint64_t v10 = PRSLogArchiver();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      PRSUnarchiverZip();
    }
    goto LABEL_12;
  }
  id v7 = v3;
  int v8 = open([(NSURL *)v7 fileSystemRepresentation], 4);
  if (v8 < 0)
  {
    uint64_t v10 = PRSLogArchiver();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      PRSUnarchiverZip((uint64_t)v7, v10);
    }
LABEL_12:
    uint64_t v6 = 0;
LABEL_13:

    goto LABEL_14;
  }
  int v9 = v8;
  uint64_t v6 = PRSUnarchiverZip(v8, v5, 0);
  if (close(v9))
  {
    uint64_t v10 = PRSLogArchiver();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      PRSUnarchiverZip();
    }
    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

uint64_t PRSUnarchiverZip(NSData *a1, NSURL *a2)
{
  if (!a1 || !a2) {
    return 0;
  }
  id v3 = a1;
  v4 = a2;
  AAArchiveStream v5 = v3;
  uint64_t v6 = [(NSData *)v5 bytes];
  unint64_t v7 = [(NSData *)v5 length];

  uint64_t v8 = PRSUnarchiverZip(v6, v7, v4, 0);
  return v8;
}

id PRSArchiverZipData(NSURL *a1, NSFileManager *a2)
{
  v86[5] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4 = a2;
  if (!v3)
  {
    AAArchiveStream v5 = 0;
LABEL_8:
    unint64_t v7 = 0;
    goto LABEL_65;
  }
  if (![(NSURL *)v3 isFileURL])
  {
    uint64_t v8 = PRSLogArchiver();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      PRSUnarchiverZip();
    }
    unint64_t v7 = 0;
    goto LABEL_64;
  }
  AAArchiveStream v5 = [(NSURL *)v3 URLByStandardizingPath];

  if (!archive_read_disk_new()) {
    goto LABEL_8;
  }
  if (archive_read_disk_set_standard_lookup())
  {
    uint64_t v6 = PRSLogArchiver();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }
    goto LABEL_15;
  }
  if (archive_read_disk_set_symlink_physical())
  {
    uint64_t v6 = PRSLogArchiver();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }
LABEL_15:

    if (archive_read_free())
    {
      uint64_t v8 = PRSLogArchiver();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        PRSArchiverZipData();
      }
      unint64_t v7 = 0;
      id v3 = v5;
      goto LABEL_64;
    }
    goto LABEL_8;
  }
  id v9 = [NSString alloc];
  id v3 = v5;
  uint64_t v10 = objc_msgSend(v9, "initWithUTF8String:", -[NSURL fileSystemRepresentation](v3, "fileSystemRepresentation"));
  BOOL v11 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v8 = v10;
  [v8 UTF8String];
  if (archive_read_disk_open())
  {
    id v12 = PRSLogArchiver();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }
    unint64_t v7 = 0;
    goto LABEL_59;
  }
  uint64_t v13 = NSString;
  v14 = [v11 UUIDString];
  id v12 = [v13 stringWithFormat:@"%@.zip", v14];

  v15 = [(NSFileManager *)v4 temporaryDirectory];
  id v16 = [v15 URLByAppendingPathComponent:@"com.apple.PosterBoardServices" isDirectory:1];

  v17 = [v16 URLByAppendingPathComponent:v12 isDirectory:0];
  uint64_t v85 = *MEMORY[0x1E4F28330];
  v86[0] = &unk_1EFD98038;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:&v85 count:1];
  v83[0] = 0;
  BOOL v19 = [(NSFileManager *)v4 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:v18 error:v83];
  id v81 = v83[0];

  if (!v19)
  {
    v20 = PRSLogArchiver();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }
  }
  id v21 = v17;
  int v22 = open((const char *)[v21 fileSystemRepresentation], 2566, 384);
  if (v22 < 0)
  {
    v28 = PRSLogArchiver();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData((uint64_t)v21, v28);
    }

    unint64_t v7 = 0;
    goto LABEL_54;
  }
  int v23 = v22;
  v80 = v16;
  v24 = v8;
  if (!v24 || (size_t v25 = NSPageSize(), (v26 = malloc_type_malloc(v25, 0xBF83E0A0uLL)) == 0))
  {
LABEL_48:

    unint64_t v7 = 0;
    id v16 = v80;
    goto LABEL_49;
  }
  size_t v76 = v25;
  v79 = v26;
  if (!archive_write_new())
  {
LABEL_47:
    free(v79);
    goto LABEL_48;
  }
  v78 = v24;
  if (archive_write_set_format_zip())
  {
    v27 = PRSLogArchiver();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }
LABEL_43:

    v24 = v78;
    if (archive_write_free())
    {
      v29 = PRSLogArchiver();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        PRSArchiverZipData();
      }

      v24 = v78;
    }
    goto LABEL_47;
  }
  if (archive_write_set_format_option())
  {
    v27 = PRSLogArchiver();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }
    goto LABEL_43;
  }
  if (archive_write_open_fd())
  {
    v27 = PRSLogArchiver();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }
    goto LABEL_43;
  }
  v71 = v11;
  v72 = v12;
  id v73 = v21;
  int v77 = v23;
  v34 = [v24 pathComponents];
  unint64_t v74 = [v34 count];

  while (1)
  {
    v83[1] = 0;
    int next_header = archive_read_next_header();
    if (next_header)
    {
      int v36 = next_header;
      if (next_header == 1)
      {
        int v62 = 1;
        goto LABEL_122;
      }
      v37 = PRSLogArchiver();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        PRSArchiverZipData();
      }

      if (v36 != -20) {
        goto LABEL_121;
      }
    }
    archive_read_disk_descend();
    int v38 = archive_entry_filetype();
    v39 = (void *)MEMORY[0x1AD0D2CA0]();
    uint64_t v40 = archive_entry_pathname_utf8();
    if (!v40) {
      break;
    }
    v41 = (void *)[[NSString alloc] initWithUTF8String:v40];
    v42 = [v41 pathComponents];
    unint64_t v43 = [v42 count];
    v44 = v41;
    if (![v41 hasPrefix:v78] || v43 < v74) {
      PRSArchiverZipData();
    }
    v45 = objc_msgSend(v42, "subarrayWithRange:", v74, v43 - v74);
    int v75 = v38;
    if ([v45 count])
    {
      v46 = [NSString pathWithComponents:v45];
      if ([v46 length])
      {
        if (v46)
        {
          v47 = v46;
          [v47 fileSystemRepresentation];
          archive_entry_update_pathname_utf8();
          int v48 = 1;
LABEL_87:

          char v49 = 0;
          goto LABEL_88;
        }
        int v38 = v75;
      }
      else
      {

        int v38 = v75;
      }
    }
    archive_entry_update_pathname_utf8();
    if (v38 != 0x4000)
    {
      v47 = PRSLogArchiver();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        buf.st_dev = 138412290;
        *(void *)&buf.st_mode = v78;
        _os_log_error_impl(&dword_1A78AC000, v47, OS_LOG_TYPE_ERROR, "PRSPosterArchiver: non-directory archive target path %@.", (uint8_t *)&buf, 0xCu);
      }
      int v48 = 0;
      goto LABEL_87;
    }
    char v49 = 1;
    int v48 = 1;
LABEL_88:

    if (!v48) {
      goto LABEL_121;
    }
    if ((v49 & 1) == 0)
    {
      if (archive_write_header())
      {
        v63 = PRSLogArchiver();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          PRSArchiverZipData();
        }
        goto LABEL_120;
      }
      BOOL v50 = 0;
      if (v75 != 0x4000 && v75 != 40960)
      {
        v51 = (const char *)archive_entry_sourcepath();
        int v52 = open(v51, 0x200000);
        v53 = v79;
        if (v52 < 0)
        {
          v63 = PRSLogArchiver();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            PRSArchiverZipData();
          }
          goto LABEL_120;
        }
        while (1)
        {
          ssize_t v54 = read(v52, v53, v76);
          BOOL v50 = v54 != 0;
          if (!v54) {
            break;
          }
          if (v54 < 0)
          {
            v55 = PRSLogArchiver();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v59 = __error();
              v60 = strerror(*v59);
              buf.st_dev = 67240450;
              *(_DWORD *)&buf.st_mode = v52;
              LOWORD(buf.st_ino) = 2082;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 2) = (__darwin_ino64_t)v60;
              _os_log_error_impl(&dword_1A78AC000, v55, OS_LOG_TYPE_ERROR, "PRSPosterArchiver: unable to read file data from descriptor %{public}d for header - %{public}s.", (uint8_t *)&buf, 0x12u);
            }
            goto LABEL_102;
          }
          v53 = v79;
          if (archive_write_data() < 0)
          {
            v55 = PRSLogArchiver();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
              PRSArchiverZipData();
            }
LABEL_102:

            break;
          }
        }
        if (close(v52))
        {
          v56 = PRSLogArchiver();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v57 = __error();
            v58 = strerror(*v57);
            buf.st_dev = 67240450;
            *(_DWORD *)&buf.st_mode = v52;
            LOWORD(buf.st_ino) = 2082;
            *(__darwin_ino64_t *)((char *)&buf.st_ino + 2) = (__darwin_ino64_t)v58;
            _os_log_error_impl(&dword_1A78AC000, v56, OS_LOG_TYPE_ERROR, "PRSPosterArchiver: unable to close file descriptor %{public}d for header (leaking) - %{public}s.", (uint8_t *)&buf, 0x12u);
          }
        }
      }
      if (archive_write_finish_entry())
      {
        v63 = PRSLogArchiver();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          PRSArchiverZipData();
        }
LABEL_120:

        goto LABEL_121;
      }
      if (v50) {
        goto LABEL_121;
      }
    }
  }
  v61 = PRSLogArchiver();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
    PRSArchiverZipData();
  }

LABEL_121:
  int v62 = 0;
LABEL_122:
  free(v79);
  if (archive_write_close())
  {
    v64 = PRSLogArchiver();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }

    int v62 = 0;
  }
  if (archive_write_free())
  {
    v65 = PRSLogArchiver();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }

    if ((v62 & 1) == 0)
    {
LABEL_136:
      unint64_t v7 = 0;
      goto LABEL_137;
    }
  }
  else
  {

    if (!v62) {
      goto LABEL_136;
    }
  }
  memset(&buf, 0, sizeof(buf));
  if (fstat(v77, &buf))
  {
    v66 = PRSLogArchiver();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }
LABEL_135:

    goto LABEL_136;
  }
  if (buf.st_size < 1) {
    goto LABEL_136;
  }
  size_t v67 = buf.st_size & ~(buf.st_size >> 63);
  v68 = mmap(0, v67, 1, 2, v77, 0);
  if (v68 == (void *)-1)
  {
    v66 = PRSLogArchiver();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }
    goto LABEL_135;
  }
  v69 = v68;
  id v70 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = ___Z18PRSArchiverZipDataP5NSURLP13NSFileManager_block_invoke;
  v82[3] = &__block_descriptor_48_e12_v24__0_v8Q16l;
  v82[4] = v69;
  v82[5] = v67;
  unint64_t v7 = (void *)[v70 initWithBytesNoCopy:v69 length:v67 deallocator:v82];
LABEL_137:
  int v23 = v77;
  id v12 = v72;
  id v21 = v73;
  id v16 = v80;
  BOOL v11 = v71;
LABEL_49:
  if (close(v23))
  {
    v30 = PRSLogArchiver();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      PRSUnarchiverZip();
    }
  }
  unlink((const char *)[v21 fileSystemRepresentation]);
LABEL_54:
  if (archive_read_close())
  {
    v31 = PRSLogArchiver();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }
  }
LABEL_59:

  if (archive_read_free())
  {
    v32 = PRSLogArchiver();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      PRSArchiverZipData();
    }
  }
LABEL_64:

  AAArchiveStream v5 = v3;
LABEL_65:

  return v7;
}

uint64_t ___Z18PRSArchiverZipDataP5NSURLP13NSFileManager_block_invoke(uint64_t a1)
{
  uint64_t result = munmap(*(void **)(a1 + 32), *(void *)(a1 + 40));
  if (result) {
    ___Z18PRSArchiverZipDataP5NSURLP13NSFileManager_block_invoke_cold_1();
  }
  return result;
}

uint64_t PRSUnarchiverZip(int a1, NSURL *a2)
{
  return PRSUnarchiverZip(a1, a2, 0);
}

uint64_t PRSUnarchiverZip(const void *a1, unint64_t a2, NSURL *a3)
{
  return PRSUnarchiverZip(a1, a2, a3, 0);
}

uint64_t PRSUnarchiverZip(int a1, NSURL *a2, unint64_t a3)
{
  AAArchiveStream v5 = a2;
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  if (a1 < 0 || !v5) {
    goto LABEL_17;
  }
  uint64_t Archive = PRSZipCreateReadArchive();
  if (!Archive)
  {
    uint64_t v7 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = Archive;
  NSPageSize();
  if (archive_read_open_fd())
  {
    uint64_t v10 = PRSLogArchiver();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      PRSUnarchiverZip();
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = PRSZipUnarchive(v9, v6, a3);
    if (!archive_read_close()) {
      goto LABEL_13;
    }
    uint64_t v10 = PRSLogArchiver();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      PRSUnarchiverZip();
    }
  }

LABEL_13:
  if (archive_read_free())
  {
    BOOL v11 = PRSLogArchiver();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      PRSUnarchiverZip();
    }
  }
LABEL_17:

  return v7;
}

uint64_t PRSZipCreateReadArchive()
{
  uint64_t v0 = archive_read_new();
  if (!v0) {
    return v0;
  }
  if (archive_read_support_format_zip())
  {
    v1 = PRSLogArchiver();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      PRSZipCreateReadArchive_cold_3();
    }

LABEL_6:
    if (archive_read_free())
    {
      id v2 = PRSLogArchiver();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        PRSUnarchiverZip();
      }
    }
    return 0;
  }
  int support_filter_all = archive_read_support_filter_all();
  if (support_filter_all != -20)
  {
    int v5 = support_filter_all;
    if (support_filter_all)
    {
      uint64_t v6 = PRSLogArchiver();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        PRSZipCreateReadArchive_cold_2();
      }

      if (v5) {
        goto LABEL_6;
      }
    }
  }
  return v0;
}

uint64_t PRSZipUnarchive(uint64_t a1, void *a2, unint64_t a3)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (([v4 isFileURL] & 1) == 0)
  {
    uint64_t v8 = PRSLogArchiver();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      PRSZipUnarchive_cold_16();
    }
    goto LABEL_21;
  }
  int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v51 = *MEMORY[0x1E4F28330];
  v52[0] = &unk_1EFD98038;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
  v47[0] = 0;
  char v7 = [v5 createDirectoryAtURL:v4 withIntermediateDirectories:0 attributes:v6 error:v47];
  uint64_t v8 = v47[0];

  if (v7) {
    goto LABEL_5;
  }
  uint64_t v9 = [v8 domain];
  if (![v9 isEqualToString:*MEMORY[0x1E4F281F8]])
  {

    goto LABEL_12;
  }
  uint64_t v10 = [v8 code];

  if (v10 != 516)
  {
LABEL_12:
    id v12 = PRSLogArchiver();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      PRSZipUnarchive_cold_15();
    }

    goto LABEL_21;
  }
LABEL_5:

  if (!archive_write_disk_new()) {
    goto LABEL_24;
  }
  if (archive_write_disk_set_standard_lookup())
  {
    BOOL v11 = PRSLogArchiver();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      PRSZipUnarchive_cold_14();
    }
  }
  else
  {
    if (!archive_write_disk_set_options())
    {
      v15 = [v4 path];
      if (v15)
      {
        uint64_t v8 = v15;
        v17 = realpath_DARWIN_EXTSN((const char *)[v8 fileSystemRepresentation], 0);
        if (v17)
        {
          v18 = v17;
          uint64_t v19 = [[NSString alloc] initWithUTF8String:v17];

          free(v18);
          uint64_t v8 = v19;
        }
        else
        {
          v20 = PRSLogArchiver();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            PRSZipUnarchive_cold_11((uint64_t)v8, v20);
          }
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
      *(void *)&long long v16 = 134218240;
      long long v46 = v16;
      while (1)
      {
        int next_header = archive_read_next_header();
        if (next_header)
        {
          if (next_header == 1)
          {
            uint64_t v13 = 1;
            goto LABEL_82;
          }
          int v38 = PRSLogArchiver();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            PRSZipUnarchive_cold_3();
          }
          goto LABEL_66;
        }
        int v22 = archive_entry_filetype();
        int v23 = (void *)MEMORY[0x1AD0D2CA0]();
        uint64_t v24 = archive_entry_pathname_utf8();
        if (!v24) {
          break;
        }
        size_t v25 = (const char *)v24;
        uint64_t v26 = 0;
        do
          int v27 = *(unsigned __int8 *)(v24 + v26++);
        while (v27 == 47);
        uint64_t v28 = v26 - 1;
        if (v26 != 1)
        {
          v29 = PRSLogArchiver();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            size_t v37 = strlen(v25);
            *(_DWORD *)stat buf = v46;
            *(void *)&buf[4] = v28;
            __int16 v49 = 2048;
            size_t v50 = v37;
            _os_log_error_impl(&dword_1A78AC000, v29, OS_LOG_TYPE_ERROR, "PRSPosterArchiver: archive_entry with absolute path encountered...ignoring leading %zu of %zu bytes.", buf, 0x16u);
          }
        }
        v30 = (void *)[[NSString alloc] initWithUTF8String:&v25[v28]];
        uint64_t v31 = [v30 length];
        if (!v31 && v22 != 0x4000)
        {
          v41 = PRSLogArchiver();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            PRSZipUnarchive_cold_10();
          }

          goto LABEL_73;
        }
        v32 = -[NSObject stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", v30, v46, 0);

        id v33 = v32;
        [v33 fileSystemRepresentation];
        archive_entry_update_pathname_utf8();

        archive_entry_perm();
        archive_entry_set_perm();
        if (v31)
        {
          if (archive_write_header())
          {
            v42 = PRSLogArchiver();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              PRSArchiverZipData();
            }
LABEL_80:

            goto LABEL_81;
          }
          uint64_t v34 = archive_entry_size();
          if (archive_entry_size_is_set())
          {
            if (v34 >= 1)
            {
              if (!a3 || v34 <= a3)
              {
                while (1)
                {
                  v47[2] = 0;
                  *(void *)stat buf = 0;
                  v47[1] = 0;
                  int data_block = archive_read_data_block();
                  if (data_block) {
                    break;
                  }
                  if (archive_write_data_block() < 0)
                  {
                    int v38 = PRSLogArchiver();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                      PRSZipUnarchive_cold_8();
                    }
                    goto LABEL_66;
                  }
                }
                if (data_block == 1) {
                  goto LABEL_56;
                }
                int v38 = PRSLogArchiver();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                  PRSZipUnarchive_cold_7();
                }
LABEL_66:

                goto LABEL_81;
              }
              v42 = PRSLogArchiver();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                PRSZipUnarchive_cold_6();
              }
              goto LABEL_80;
            }
          }
          else
          {
            int v36 = PRSLogArchiver();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)stat buf = 0;
              _os_log_impl(&dword_1A78AC000, v36, OS_LOG_TYPE_INFO, "PRSPosterArchiver: not writing archive_entry with unknown size", buf, 2u);
            }
          }
LABEL_56:
          if (archive_write_finish_entry())
          {
            v42 = PRSLogArchiver();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              PRSArchiverZipData();
            }
            goto LABEL_80;
          }
        }
      }
      uint64_t v40 = PRSLogArchiver();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        PRSArchiverZipData();
      }

LABEL_73:
LABEL_81:
      uint64_t v13 = 0;
LABEL_82:
      if (archive_write_close())
      {
        v44 = PRSLogArchiver();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          PRSZipUnarchive_cold_2();
        }

        uint64_t v13 = 0;
      }
      if (archive_write_free())
      {
        v45 = PRSLogArchiver();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          PRSZipUnarchive_cold_1();
        }
      }
      goto LABEL_22;
    }
    BOOL v11 = PRSLogArchiver();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      PRSZipUnarchive_cold_13();
    }
  }

  if (!archive_write_free())
  {
LABEL_24:
    uint64_t v13 = 0;
    goto LABEL_23;
  }
  uint64_t v8 = PRSLogArchiver();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    PRSZipUnarchive_cold_1();
  }
LABEL_21:
  uint64_t v13 = 0;
LABEL_22:

LABEL_23:
  return v13;
}

uint64_t PRSUnarchiverZip(const void *a1, unint64_t a2, NSURL *a3, unint64_t a4)
{
  uint64_t v6 = a3;
  char v7 = v6;
  uint64_t v8 = 0;
  if (!a1 || !v6) {
    goto LABEL_17;
  }
  uint64_t Archive = PRSZipCreateReadArchive();
  if (!Archive)
  {
    uint64_t v8 = 0;
    goto LABEL_17;
  }
  uint64_t v10 = Archive;
  if (archive_read_open_memory())
  {
    BOOL v11 = PRSLogArchiver();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      PRSUnarchiverZip();
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = PRSZipUnarchive(v10, v7, a4);
    if (!archive_read_close()) {
      goto LABEL_13;
    }
    BOOL v11 = PRSLogArchiver();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      PRSUnarchiverZip();
    }
  }

LABEL_13:
  if (archive_read_free())
  {
    id v12 = PRSLogArchiver();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      PRSUnarchiverZip();
    }
  }
LABEL_17:

  return v8;
}

BOOL PRSAppleArchiveDecompressStream(AAByteStream_impl *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = AADecompressionInputStreamOpen(a1, 0, 0);
    if (v4)
    {
      int v5 = v4;
      AAArchiveStream v6 = AADecodeArchiveInputStreamOpen(v4, 0, 0, 0, 0);
      if (v6)
      {
        char v7 = v6;
        uint64_t v8 = AAExtractArchiveOutputStreamOpen((const char *)[v3 fileSystemRepresentation], 0, 0, 0, 0);
        if (v8)
        {
          uint64_t v9 = v8;
          ssize_t v10 = AAArchiveStreamProcess(v7, v8, 0, 0, 0, 0);
          AAArchiveStreamClose(v9);
        }
        else
        {
          ssize_t v10 = -1;
        }
        AAArchiveStreamClose(v7);
      }
      else
      {
        ssize_t v10 = -1;
      }
      AAByteStreamClose(v5);
    }
    else
    {
      ssize_t v10 = -1;
    }
    AAByteStreamClose(a1);
  }
  else
  {
    ssize_t v10 = -1;
  }

  return v10 >= 0;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return archive_error_string();
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id soft_PUIIOSurfaceFromCGImage(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v4 = (void (*)(uint64_t, uint64_t))getPUIIOSurfaceFromCGImageSymbolLoc_ptr;
  BOOL v11 = getPUIIOSurfaceFromCGImageSymbolLoc_ptr;
  if (!getPUIIOSurfaceFromCGImageSymbolLoc_ptr)
  {
    uint64_t v5 = (void *)PosterUIFoundationLibrary();
    v9[3] = (uint64_t)dlsym(v5, "PUIIOSurfaceFromCGImage");
    getPUIIOSurfaceFromCGImageSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    uint64_t v4 = (void (*)(uint64_t, uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4) {
    soft_PUIIOSurfaceFromCGImage_cold_1();
  }
  uint64_t v6 = v4(a1, a2);
  return v6;
}

void sub_1A78B91B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A78BA434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPUIImageEncoderErrorDomain()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getPUIImageEncoderErrorDomainSymbolLoc_ptr;
  uint64_t v7 = getPUIImageEncoderErrorDomainSymbolLoc_ptr;
  if (!getPUIImageEncoderErrorDomainSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary();
    v5[3] = (uint64_t)dlsym(v1, "PUIImageEncoderErrorDomain");
    getPUIImageEncoderErrorDomainSymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getPUIImageEncoderErrorDomain_cold_1();
  }
  id v2 = *v0;
  return v2;
}

void sub_1A78BA544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPUIIOSurfaceFromCGImageSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)PosterUIFoundationLibrary();
  uint64_t result = dlsym(v2, "PUIIOSurfaceFromCGImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIIOSurfaceFromCGImageSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PosterUIFoundationLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __PosterUIFoundationLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5D009E8;
    uint64_t v4 = 0;
    PosterUIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PosterUIFoundationLibraryCore_frameworkLibrary;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary) {
    PosterUIFoundationLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __PosterUIFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PosterUIFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPUIImageOnDiskFormatClass_block_invoke(uint64_t a1)
{
  PosterUIFoundationLibrary();
  Class result = objc_getClass("PUIImageOnDiskFormat");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPUIImageOnDiskFormatClass_block_invoke_cold_1();
  }
  getPUIImageOnDiskFormatClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getPUIImageEncoderErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)PosterUIFoundationLibrary();
  Class result = dlsym(v2, "PUIImageEncoderErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPUIImageEncoderErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id NSStringFromPRSPosterSnapshotOptions(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __NSStringFromPRSPosterSnapshotOptions_block_invoke;
  uint64_t v13 = &unk_1E5D00A20;
  id v3 = v2;
  id v14 = v3;
  uint64_t v4 = &v10;
  if (a1)
  {
    char v15 = 0;
    uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v5.i16[0] = vaddlv_u8(v5);
    int v6 = v5.i32[0];
    if (v5.i32[0])
    {
      unint64_t v7 = 0;
      do
      {
        if (((1 << v7) & a1) != 0)
        {
          ((void (*)(uint64_t *))v12)(v4);
          if (v15) {
            break;
          }
          --v6;
        }
        if (v7 > 0x3E) {
          break;
        }
        ++v7;
      }
      while (v6 > 0);
    }
  }

  uint64_t v8 = [v3 componentsJoinedByString:@", ", v10, v11];

  return v8;
}

void *__NSStringFromPRSPosterSnapshotOptions_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = 0;
  if (a2 > 15)
  {
    id v3 = @"IncludeFloatingLayer";
    uint64_t v4 = @"RenderAsUnlocked";
    uint8x8_t v5 = @"RenderAsPreview";
    if (a2 != 128) {
      uint8x8_t v5 = 0;
    }
    if (a2 != 64) {
      uint64_t v4 = v5;
    }
    if (a2 != 32) {
      id v3 = v4;
    }
    int v6 = @"IncludeBackgroundLayer";
    unint64_t v7 = @"IncludePrimaryLayers";
    if (a2 != 24) {
      unint64_t v7 = 0;
    }
    if (a2 != 16) {
      int v6 = v7;
    }
    if (a2 <= 31) {
      id v2 = v6;
    }
    else {
      id v2 = v3;
    }
  }
  else
  {
    switch(a2)
    {
      case -1:
        id v2 = @"All";
        break;
      case 0:
        id v2 = @"None";
        break;
      case 2:
        id v2 = @"IncludeHeaderElements";
        break;
      case 4:
        id v2 = @"IncludeComplications";
        break;
      case 8:
        id v2 = @"IncludeForegroundLayer";
        break;
      default:
        break;
    }
  }
  Class result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result addObject:v2];
  }
  return result;
}

BOOL PRSPosterSnapshotOptionsIsFloatingLayerOnly(char a1)
{
  return (a1 & 0x38) == 32;
}

BOOL PRSPosterSnapshotOptionsAllowTransparency(char a1)
{
  return (a1 & 0x10) == 0;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A78C7C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 128));
  _Unwind_Resume(a1);
}

void sub_1A78C810C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A78C92B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_1A78CA214(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A78CA2A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A78CA5A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return objc_opt_class();
}

void sub_1A78CBEB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

id __clientDescription(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  id v9 = a1;
  uint64_t v10 = [v9 name];
  uint64_t v11 = NSString;
  uint64_t v12 = [v9 pid];

  uint64_t v13 = PRSWallpaperObserverLocationsDescription(a4);
  uint64_t v14 = (void *)v13;
  if (v10) {
    [v11 stringWithFormat:@"<%@:%d:%@:%p %@>", v10, v12, v8, v7, v13];
  }
  else {
  char v15 = [v11 stringWithFormat:@"<%d:%@:%p %@>", v12, v8, v7, v13, v17];
  }

  return v15;
}

void sub_1A78CC11C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A78CEA2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A78CF16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

id getPRPosterPathUtilitiesClass()
{
  uint64_t v4 = 0;
  uint8x8_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPRPosterPathUtilitiesClass_softClass;
  uint64_t v7 = getPRPosterPathUtilitiesClass_softClass;
  if (!getPRPosterPathUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRPosterPathUtilitiesClass_block_invoke;
    v3[3] = &unk_1E5D007B0;
    v3[4] = &v4;
    __getPRPosterPathUtilitiesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A78CF28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRPosterPathUtilitiesClass_block_invoke(uint64_t a1)
{
  PosterKitLibrary();
  Class result = objc_getClass("PRPosterPathUtilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRPosterPathUtilitiesClass_block_invoke_cold_1();
  }
  getPRPosterPathUtilitiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void PosterKitLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!PosterKitLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __PosterKitLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5D00EA0;
    uint64_t v2 = 0;
    PosterKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PosterKitLibraryCore_frameworkLibrary) {
    PosterKitLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __PosterKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PosterKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPRPosterMutableConfiguredPropertiesClass_block_invoke(uint64_t a1)
{
  PosterKitLibrary();
  Class result = objc_getClass("PRPosterMutableConfiguredProperties");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRPosterMutableConfiguredPropertiesClass_block_invoke_cold_1();
  }
  getPRPosterMutableConfiguredPropertiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id PRSWallpaperObserverLocationsDescription(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = v2;
  if (a1)
  {
    [v2 addObject:@"sl"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"sh"];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  [v3 addObject:@"al"];
  if ((a1 & 8) != 0) {
LABEL_5:
  }
    [v3 addObject:@"ah"];
LABEL_6:
  if ((a1 & 0xFFFFFFFFFFFFFFF0) != 0)
  {
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a1 & 0xFFFFFFFFFFFFFFF0);
    [v3 addObject:v4];
  }
  if (![v3 count]) {
    [v3 addObject:@"none"];
  }
  uint8x8_t v5 = [v3 componentsJoinedByString:@"|"];

  return v5;
}

BOOL PRSWallpaperObserverLocationsIndexIsValid(unsigned int a1)
{
  return a1 < 4;
}

uint64_t PRSWallpaperObserverLocationsToIndex(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 8 && ((0x8Bu >> v1)) {
    return dword_1A78F4240[v1];
  }
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"unknown location (%li)", a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    PRSWallpaperObserverLocationsToIndex_cold_1();
  }
  [v3 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t PRSWallpaperObserverLocationsFromIndex(uint64_t a1)
{
  if (a1 < 4) {
    return qword_1A78F4260[(int)a1];
  }
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"unknown index (%i)", a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    PRSWallpaperObserverLocationsFromIndex_cold_1();
  }
  [v2 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t PRSWallpaperObserverLocationsLockIndexIfHomeIndex(uint64_t a1)
{
  if (a1 < 4) {
    return dword_1A78F4280[(int)a1];
  }
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"unknown index (%i)", a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    PRSWallpaperObserverLocationsLockIndexIfHomeIndex_cold_1();
  }
  [v2 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

id PRSDictionaryFromXPCObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __PRSDictionaryFromXPCObject_block_invoke;
  applier[3] = &unk_1E5D00EC0;
  id v7 = v2;
  id v3 = v2;
  xpc_dictionary_apply(v1, applier);

  uint64_t v4 = (void *)[v3 copy];
  return v4;
}

uint64_t __PRSDictionaryFromXPCObject_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint8x8_t v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithUTF8String:a2];
  string_ptr = (char *)xpc_string_get_string_ptr(v6);

  if (string_ptr) {
    string_ptr = (char *)[[NSString alloc] initWithUTF8String:string_ptr];
  }
  [*(id *)(a1 + 32) setObject:string_ptr forKeyedSubscript:v7];

  return 1;
}

id PRSXPCDictionaryFromDictionary(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = objc_msgSend(v1, "keyEnumerator", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(id *)(*((void *)&v12 + 1) + 8 * i);
          uint64_t v9 = (const char *)[v8 UTF8String];
          id v10 = [v1 objectForKey:v8];
          xpc_dictionary_set_string(empty, v9, (const char *)[v10 UTF8String]);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
  else
  {
    xpc_object_t empty = 0;
  }

  return empty;
}

__CFString *PRSPosterUpdateAmbientWidgetsIdentifiers(void *a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "bs_safeObjectForKey:ofType:", @"AMUIIconStateKey", objc_opt_class());
  id v3 = objc_msgSend(v2, "bs_safeObjectForKey:ofType:", @"iconLists", objc_opt_class());
  uint64_t v4 = [v3 firstObject];

  if ([v4 count])
  {
    uint64_t v5 = [v4 firstObject];
    uint64_t v6 = objc_opt_class();
    id v7 = v5;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
    unint64_t v10 = v8;

    if ((unint64_t)[v4 count] < 2)
    {
      unint64_t v15 = 0;
    }
    else
    {
      uint64_t v11 = [v4 objectAtIndex:1];
      uint64_t v12 = objc_opt_class();
      id v13 = v11;
      if (v12)
      {
        if (objc_opt_isKindOfClass()) {
          long long v14 = v13;
        }
        else {
          long long v14 = 0;
        }
      }
      else
      {
        long long v14 = 0;
      }
      unint64_t v15 = v14;
    }
    if (v10 | v15)
    {
      int v38 = (void *)v15;
      size_t v37 = v2;
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      unint64_t v36 = v10;
      uint64_t v17 = objc_msgSend((id)v10, "bs_safeObjectForKey:ofType:", @"elements", objc_opt_class());
      uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v44 != v20) {
              objc_enumerationMutation(v17);
            }
            int v22 = NSString;
            int v23 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * i), "bs_safeObjectForKey:ofType:", @"uniqueIdentifier", objc_opt_class());
            uint64_t v24 = [v22 stringWithFormat:@"lead-%@", v23];
            objc_msgSend(v16, "bs_safeAddObject:", v24);
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v19);
      }

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      size_t v25 = objc_msgSend(v38, "bs_safeObjectForKey:ofType:", @"elements", objc_opt_class());
      uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v40;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v40 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = NSString;
            uint64_t v31 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "bs_safeObjectForKey:ofType:", @"uniqueIdentifier", objc_opt_class());
            v32 = [v30 stringWithFormat:@"trail-%@", v31];
            objc_msgSend(v16, "bs_safeAddObject:", v32);
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
        }
        while (v27);
      }

      id v33 = NSString;
      uint64_t v34 = [v16 componentsJoinedByString:@","];
      uint64_t v9 = [v33 stringWithFormat:@"ambient widget identifiers; %@", v34];

      uint64_t v2 = v37;
      unint64_t v10 = v36;
      unint64_t v15 = (unint64_t)v38;
    }
    else
    {
      uint64_t v9 = @"(elements did not return an array; bailing)";
    }
  }
  else
  {
    uint64_t v9 = @"(no stacks)";
  }

  return v9;
}

void _validateUserInfo(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = objc_msgSend(v1, "keyEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v8 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          id v13 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v14 = *MEMORY[0x1E4F1C3C8];
          unint64_t v15 = @"contains non-string key";
          goto LABEL_13;
        }
        unint64_t v10 = [v1 objectForKey:v7];
        uint64_t v11 = self;
        char v12 = objc_opt_isKindOfClass();

        if ((v12 & 1) == 0)
        {
          id v13 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v14 = *MEMORY[0x1E4F1C3C8];
          unint64_t v15 = @"contains non-string val";
LABEL_13:
          id v16 = [v13 exceptionWithName:v14 reason:v15 userInfo:v1];
          objc_exception_throw(v16);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
}

__CFString *PRSErrorCodeToDebugDescription(uint64_t a1)
{
  if (a1) {
    return @"the 'currentConfiguration' argument was invalid.";
  }
  else {
    return @"Unknown error.";
  }
}

__CFString *NSStringFromPRSPosterUpdateType(unint64_t a1)
{
  if (a1 > 0x12) {
    return @"(unknown update type)";
  }
  else {
    return off_1E5D00EE8[a1];
  }
}

id PRSPosterGallerySuggestedComplicationErrorCreateWithCodeAndDescription(void *a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 length])
  {
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = v1;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithDomain:v5 code:1 userInfo:v2];

  return v6;
}

id getkPaperboardIOSurfaceDeviceOrientationPropertiesKey()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_ptr;
  uint64_t v7 = getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_ptr;
  if (!getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_block_invoke;
    v3[3] = &unk_1E5D007B0;
    v3[4] = &v4;
    __getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_block_invoke((uint64_t)v3);
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getkPaperboardIOSurfaceDeviceOrientationPropertiesKey_cold_1();
  }
  id v1 = *v0;
  return v1;
}

void sub_1A78DAFD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary_0)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __PosterUIFoundationLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5D01038;
    uint64_t v6 = 0;
    PosterUIFoundationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v2 = (void *)PosterUIFoundationLibraryCore_frameworkLibrary_0;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary_0) {
    __getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "kPaperboardIOSurfaceDeviceOrientationPropertiesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t __PosterUIFoundationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  PosterUIFoundationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t descriptorsForPath(void *a1, const char *a2)
{
  return objc_msgSend(a1, "bs_mapNoNulls:", &__block_literal_global_13);
}

uint64_t configurationsForPath(void *a1, const char *a2)
{
  return objc_msgSend(a1, "bs_mapNoNulls:", &__block_literal_global_33);
}

id __configurationsForPath_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PRSPosterConfiguration alloc] _initWithPath:v2];

  return v3;
}

void sub_1A78DBF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A78DC110(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t PRSDefaultServiceQuality()
{
  return [MEMORY[0x1E4F50BE0] userInitiated];
}

id PRSWallpaperObserverInterface()
{
  if (PRSWallpaperObserverInterface_onceToken != -1) {
    dispatch_once(&PRSWallpaperObserverInterface_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)PRSWallpaperObserverInterface___interface;
  return v0;
}

void __PRSWallpaperObserverInterface_block_invoke()
{
  id v4 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"com.apple.posterboardservices.active-wallpaper-observer"];
  uint64_t v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EFD9CB38];
  [v4 setClient:v0];

  id v1 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EFD9D0D0];
  [v4 setServer:v1];

  [v4 setClientMessagingExpectation:1];
  uint64_t v2 = [v4 copy];
  id v3 = (void *)PRSWallpaperObserverInterface___interface;
  PRSWallpaperObserverInterface___interface = v2;
}

id PRSServiceInterface()
{
  if (PRSServiceInterface_onceToken != -1) {
    dispatch_once(&PRSServiceInterface_onceToken, &__block_literal_global_62);
  }
  uint64_t v0 = (void *)PRSServiceInterface___interface;
  return v0;
}

void __PRSServiceInterface_block_invoke()
{
  id v3 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"com.apple.posterboardservices.dataModel"];
  uint64_t v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EFD9BE90];
  [v3 setServer:v0];

  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)PRSServiceInterface___interface;
  PRSServiceInterface___interface = v1;
}

void sub_1A78E751C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A78E78F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

Class __getPFPosterConfigurationClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PhotosFormatsLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __PhotosFormatsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5D01690;
    uint64_t v5 = 0;
    PhotosFormatsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotosFormatsLibraryCore_frameworkLibrary) {
    __getPFPosterConfigurationClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("PFPosterConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPFPosterConfigurationClass_block_invoke_cold_2();
  }
  getPFPosterConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PhotosFormatsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosFormatsLibraryCore_frameworkLibrary = result;
  return result;
}

void __getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *PaperBoardUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PRSPosterConfigurationCacheProvider.m", 17, @"%s", *a1);

  __break(1u);
}

void PRSZipArchiverCompressDirectory_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: data for %@ is nil", v2);
}

void PRSZipArchiverCompressDirectory_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to write data to url %@", v2);
}

void PRSZipArchiverCompressDirectory_cold_3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to create directory for URL %@", v2);
}

void PRSUnarchiverZip(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = __error();
  strerror(*v3);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1A78AC000, a2, v4, "PRSPosterArchiver: unable to open file %@ - %{public}s.", v5);
}

void PRSUnarchiverZip()
{
  OUTLINED_FUNCTION_10();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9(&dword_1A78AC000, v1, v2, "PRSPosterArchiver: unable to close file descriptor %{public}d for %@ (leaking) - %{public}s.", v3, v4, v5, v6, v7);
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to open non-file URL %@.", v2);
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to free archive_read (leaking) - %p.", v2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to close archive_read - %{public}s.", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to open archive_read - %{public}s.", v2, v3, v4, v5, v6);
}

void PRSArchiverZipData()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to free read disk archive (leaking) - %p.", v2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to close read disk archive - %{public}s.", v2, v3, v4, v5, v6);
}

{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_10();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9(&dword_1A78AC000, v1, v2, "PRSPosterArchiver: unable to mmap file descriptor %{public}d for %@ - %{public}s.", v3, v4, v5, v6, v7);
}

{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_10();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9(&dword_1A78AC000, v1, v2, "PRSPosterArchiver: unable to fstat %{public}d for %@ - %{public}s.", v3, v4, v5, v6, v7);
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to free archive_write (leaking) - %p.", v2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to close archive_write - %{public}s.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_entry with no path encountered.", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_write_finish_entry failed - %{public}s.", v2, v3, v4, v5, v6);
}

{
  uint64_t *v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  uint64_t v2 = OUTLINED_FUNCTION_13();
  void *v1 = 136446210;
  NSObject *v0 = v2;
  OUTLINED_FUNCTION_14(&dword_1A78AC000, v3, v4, "PRSPosterArchiver: archive_write_data failed - %{public}s.");
}

{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_15(&dword_1A78AC000, v1, v2, "PRSPosterArchiver: failed to open file for header of type %{public}ud - %{public}s.", v3, v4, v5, v6, v7);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_write_header failed - %{public}s.", v2, v3, v4, v5, v6);
}

{
  __assert_rtn("PRSZipArchive", "PRSPosterArchiver.m", 631, "NO");
}

{
  uint64_t *v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  uint64_t v2 = OUTLINED_FUNCTION_13();
  void *v1 = 136446210;
  NSObject *v0 = v2;
  OUTLINED_FUNCTION_14(&dword_1A78AC000, v3, v4, "PRSPosterArchiver: archive_read_next_header failed - %{public}s.");
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_15(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_write unable to open file descriptor %{public}d - %{public}s.", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to set archive_write supported compression formats - %{public}s.", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to set archive_write supported formats - %{public}s.", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: failed to create temporary directory at %{public}@ - %@.");
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to open read disk archive - %{public}s.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to free archive_read_disk (leaking) - %p.", v2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_read_disk unable to set reader symlink mode - %{public}s.", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_read_disk unable to set lookup functions - %{public}s.", v2, v3, v4, v5, v6);
}

void PRSArchiverZipData(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = __error();
  strerror(*v3);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1A78AC000, a2, v4, "PRSPosterArchiver: unable to create output file %@ - %{public}s.", v5);
}

void ___Z18PRSArchiverZipDataP5NSURLP13NSFileManager_block_invoke_cold_1()
{
}

void PRSZipCreateReadArchive_cold_2()
{
  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_read unable to set supported compression formats - %{public}s.", v2, v3, v4, v5, v6);
}

void PRSZipCreateReadArchive_cold_3()
{
  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_read unable to set supported formats - %{public}s.", v2, v3, v4, v5, v6);
}

void PRSZipUnarchive_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to free archive_write_disk (leaking) - %p.", v2);
}

void PRSZipUnarchive_cold_2()
{
  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to close archive_write_disk - %{public}s.", v2, v3, v4, v5, v6);
}

void PRSZipUnarchive_cold_3()
{
  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_read_next_header failed - %{public}s.", v2, v3, v4, v5, v6);
}

void PRSZipUnarchive_cold_6()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_entry greater than allowed size of %{public}zu.", v2);
}

void PRSZipUnarchive_cold_7()
{
  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_read_data_block failed - %{public}s.", v2, v3, v4, v5, v6);
}

void PRSZipUnarchive_cold_8()
{
  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_write_data_block failed - %{public}s.", v2, v3, v4, v5, v6);
}

void PRSZipUnarchive_cold_10()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_entry with no path after sanitization encountered.", v2, v3, v4, v5, v6);
}

void PRSZipUnarchive_cold_11(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = __error();
  uint64_t v5 = strerror(*v4);
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_8(&dword_1A78AC000, a2, v6, "PRSPosterArchiver: unable to resolve physical path for destination path %@ - %s.", (uint8_t *)&v7);
}

void PRSZipUnarchive_cold_13()
{
  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_write_disk unable to set options - %{public}s.", v2, v3, v4, v5, v6);
}

void PRSZipUnarchive_cold_14()
{
  archive_error_string();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: archive_write_disk unable to set lookup functions - %{public}s.", v2, v3, v4, v5, v6);
}

void PRSZipUnarchive_cold_15()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: failed to create directory at %@ - %@.");
}

void PRSZipUnarchive_cold_16()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1A78AC000, v0, v1, "PRSPosterArchiver: unable to write to non-file URL %@.", v2);
}

void soft_PUIIOSurfaceFromCGImage_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "IOSurface *soft_PUIIOSurfaceFromCGImage(CGImageRef, BOOL)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUICodableImage.m", 39, @"%s", dlerror());

  __break(1u);
}

void getPUIImageEncoderErrorDomain_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getPUIImageEncoderErrorDomain(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUICodableImage.m", 38, @"%s", dlerror());

  __break(1u);
}

void PosterUIFoundationLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PosterUIFoundationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PBUICodableImage.m", 36, @"%s", *a1);

  __break(1u);
}

void __getPUIImageOnDiskFormatClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPUIImageOnDiskFormatClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBUICodableImage.m", 37, @"Unable to find class %s", "PUIImageOnDiskFormat");

  __break(1u);
}

void __getPRPosterPathUtilitiesClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRPosterPathUtilitiesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PRSPosterUpdater.m", 22, @"Unable to find class %s", "PRPosterPathUtilities");

  __break(1u);
}

void PosterKitLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PosterKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PRSPosterUpdater.m", 20, @"%s", *a1);

  __break(1u);
}

void __getPRPosterMutableConfiguredPropertiesClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRPosterMutableConfiguredPropertiesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PRSPosterUpdater.m", 23, @"Unable to find class %s", "PRPosterMutableConfiguredProperties");

  __break(1u);
}

void PRSWallpaperObserverLocationsToIndex_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"int PRSWallpaperObserverLocationsToIndex(PRSWallpaperObserverLocations)"];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_2(&dword_1A78AC000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void PRSWallpaperObserverLocationsFromIndex_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"PRSWallpaperObserverLocations PRSWallpaperObserverLocationsFromIndex(int)"];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_2(&dword_1A78AC000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void PRSWallpaperObserverLocationsLockIndexIfHomeIndex_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"int PRSWallpaperObserverLocationsLockIndexIfHomeIndex(int)"];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_2(&dword_1A78AC000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void getkPaperboardIOSurfaceDeviceOrientationPropertiesKey_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getkPaperboardIOSurfaceDeviceOrientationPropertiesKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PRSPosterSnapshotCollection.m", 17, @"%s", dlerror());

  __break(1u);
}

void __getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PosterUIFoundationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PRSPosterSnapshotCollection.m", 16, @"%s", *a1);

  __break(1u);
}

void __getPFPosterConfigurationClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PhotosFormatsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PRSExternalSystemService.m", 21, @"%s", *a1);

  __break(1u);
}

void __getPFPosterConfigurationClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPFPosterConfigurationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PRSExternalSystemService.m", 22, @"Unable to find class %s", "PFPosterConfiguration");

  __break(1u);
  AAArchiveStreamClose(v2);
}

int AAArchiveStreamClose(AAArchiveStream s)
{
  return MEMORY[0x1F4179268](s);
}

ssize_t AAArchiveStreamProcess(AAArchiveStream istream, AAArchiveStream ostream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x1F4179270](istream, ostream, msg_data, msg_proc, flags, *(void *)&n_threads);
}

int AAArchiveStreamWritePathList(AAArchiveStream s, AAPathList path_list, AAFieldKeySet key_set, const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x1F4179298](s, path_list, key_set, dir, msg_data, msg_proc, flags, *(void *)&n_threads);
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x1F41792A8](s);
}

AAArchiveStream AADecodeArchiveInputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x1F4179308](stream, msg_data, msg_proc, flags, *(void *)&n_threads);
}

AAByteStream AADecompressionInputStreamOpen(AAByteStream compressed_stream, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x1F4179310](compressed_stream, flags, *(void *)&n_threads);
}

AAArchiveStream AAEncodeArchiveOutputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x1F4179318](stream, msg_data, msg_proc, flags, *(void *)&n_threads);
}

AAArchiveStream AAExtractArchiveOutputStreamOpen(const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x1F4179320](dir, msg_data, msg_proc, flags, *(void *)&n_threads);
}

AAFieldKeySet AAFieldKeySetCreateWithString(const char *s)
{
  return (AAFieldKeySet)MEMORY[0x1F4179328](s);
}

void AAFieldKeySetDestroy(AAFieldKeySet key_set)
{
}

AAByteStream AAFileStreamOpenWithFD(int fd, int automatic_close)
{
  return (AAByteStream)MEMORY[0x1F4179340](*(void *)&fd, *(void *)&automatic_close);
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  return (AAByteStream)MEMORY[0x1F4179348](path, *(void *)&open_flags, open_mode);
}

AAPathList AAPathListCreateWithDirectoryContents(const char *dir, const char *path, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAPathList)MEMORY[0x1F41793A8](dir, path, msg_data, msg_proc, flags, *(void *)&n_threads);
}

void AAPathListDestroy(AAPathList path_list)
{
}

uint64_t BSAbsoluteMachTimeNow()
{
  return MEMORY[0x1F410C138]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x1F410C2C8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSInterfaceOrientationIsPortrait()
{
  return MEMORY[0x1F410C3A8]();
}

uint64_t BSSystemSharedDirectoryForIdentifier()
{
  return MEMORY[0x1F410C680]();
}

uint64_t BSSystemSharedResourcesDirectoryForIdentifier()
{
  return MEMORY[0x1F410C688]();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CGImageCopyJPEGData()
{
  return MEMORY[0x1F40E9690]();
}

uint64_t CGImageCopySourceData()
{
  return MEMORY[0x1F40E9698]();
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1F40E96E0]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

uint64_t CGImageGetHash()
{
  return MEMORY[0x1F40E9778]();
}

uint64_t CGImageGetIdentifier()
{
  return MEMORY[0x1F40DA950]();
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E9A00](isrc);
}

uint64_t CHSWidgetFamilyFromString()
{
  return MEMORY[0x1F4111790]();
}

uint64_t CHSWidgetFamilyIsAccessory()
{
  return MEMORY[0x1F4111798]();
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1F40E9328](aSurface);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9460](buffer);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9560](xobj);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1F40E71C8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x1F41117F0]();
}

uint64_t PFFileProtectionNoneAttributes()
{
  return MEMORY[0x1F4145C28]();
}

uint64_t PFPosterPathFileAttributes()
{
  return MEMORY[0x1F4145C38]();
}

uint64_t PFPosterRoleDefaultRoleForCurrentExtensionProcess()
{
  return MEMORY[0x1F4145C48]();
}

uint64_t PFPosterRoleIsValid()
{
  return MEMORY[0x1F4145C58]();
}

uint64_t PFTemporaryDirectory()
{
  return MEMORY[0x1F4145C90]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1F410C6E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t archive_entry_filetype()
{
  return MEMORY[0x1F417DFE8]();
}

uint64_t archive_entry_pathname_utf8()
{
  return MEMORY[0x1F417E008]();
}

uint64_t archive_entry_perm()
{
  return MEMORY[0x1F417E010]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x1F417E048]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x1F417E058]();
}

uint64_t archive_entry_size_is_set()
{
  return MEMORY[0x1F417E060]();
}

uint64_t archive_entry_sourcepath()
{
  return MEMORY[0x1F417E068]();
}

uint64_t archive_entry_update_pathname_utf8()
{
  return MEMORY[0x1F417E070]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1F417E080]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x1F417E098]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x1F417E0A8]();
}

uint64_t archive_read_disk_descend()
{
  return MEMORY[0x1F417E0C8]();
}

uint64_t archive_read_disk_new()
{
  return MEMORY[0x1F417E0D8]();
}

uint64_t archive_read_disk_open()
{
  return MEMORY[0x1F417E0E0]();
}

uint64_t archive_read_disk_set_standard_lookup()
{
  return MEMORY[0x1F417E0F0]();
}

uint64_t archive_read_disk_set_symlink_physical()
{
  return MEMORY[0x1F417E0F8]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1F417E110]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1F417E118]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1F417E120]();
}

uint64_t archive_read_open_fd()
{
  return MEMORY[0x1F417E138]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x1F417E148]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x1F417E158]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x1F417E1A0]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x1F417E1D0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1F417E1D8]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x1F417E1E0]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x1F417E1E8]();
}

uint64_t archive_write_disk_set_options()
{
  return MEMORY[0x1F417E1F0]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x1F417E1F8]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x1F417E200]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1F417E208]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1F417E210]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1F417E218]();
}

uint64_t archive_write_open_fd()
{
  return MEMORY[0x1F417E228]();
}

uint64_t archive_write_set_format_option()
{
  return MEMORY[0x1F417E240]();
}

uint64_t archive_write_set_format_zip()
{
  return MEMORY[0x1F417E260]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1F40CE190](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}