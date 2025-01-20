@interface TRIArchiveExtractor
+ ($A5A652246548B43F8BC05201A1C72A70)_compressFilesInCurrentDirectoryWithLockWitness:(TRIFlockWitness_ *)a3 shouldDefer:(id)a4;
+ ($A5A652246548B43F8BC05201A1C72A70)_copyDataFromReadArchive:(archive *)a3 toWriteDiskArchive:(archive *)a4 remainingQuota:(unint64_t *)a5 archiveIdentifier:(id)a6 shouldDefer:(id)a7;
+ ($A5A652246548B43F8BC05201A1C72A70)_withLockWitness:(TRIFlockWitness_ *)a3 performExtractionIntoCurrentDirectoryFromArchive:(archive *)a4 maxUnarchivedSize:(unint64_t)a5 archiveIdentifier:(id)a6 shouldDefer:(id)a7;
+ ($A5A652246548B43F8BC05201A1C72A70)extractArchiveFromHandle:(id)a3 toDestinationDirectoryURL:(id)a4 maxUnarchivedSize:(unint64_t)a5 archiveIdentifier:(id)a6 postExtractionCompression:(id)a7 shouldDefer:(id)a8;
+ (BOOL)_withLockAndDirectoryChangedToURL:(id)a3 runBlock:(id)a4;
+ (archive)_createReadArchive;
+ (archive)_createWriteDiskArchive;
- (NSURL)archiveFileURL;
@end

@implementation TRIArchiveExtractor

+ (archive)_createReadArchive
{
  uint64_t v2 = archive_read_new();
  if (!v2)
  {
    v5 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = archive_error_string();
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "archive_read_new unable to create new archive: %s.", (uint8_t *)&v7, 0xCu);
    }
    goto LABEL_10;
  }
  v3 = (archive *)v2;
  if (archive_read_support_format_zip())
  {
    v4 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = archive_error_string();
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "archive_read unable to set supported formats: %s.", (uint8_t *)&v7, 0xCu);
    }

    if (!archive_read_free()) {
      return 0;
    }
    v5 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unable to free archive_read (leaking)", (uint8_t *)&v7, 2u);
    }
LABEL_10:

    return 0;
  }
  return v3;
}

+ (archive)_createWriteDiskArchive
{
  uint64_t v2 = (archive *)archive_write_disk_new();
  if (!v2) {
    return v2;
  }
  if (!archive_write_disk_set_standard_lookup())
  {
    if (!archive_write_disk_set_options()) {
      return v2;
    }
    v3 = TRILogCategory_Archiving();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v7 = 136315138;
    uint64_t v8 = archive_error_string();
    v4 = "archive_write_disk unable to set options - %s.";
    goto LABEL_14;
  }
  v3 = TRILogCategory_Archiving();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315138;
    uint64_t v8 = archive_error_string();
    v4 = "archive_write_disk unable to set lookup functions - %s.";
LABEL_14:
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v7, 0xCu);
  }
LABEL_7:

  if (archive_write_free())
  {
    v5 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unable to free archive_write_disk (leaking)", (uint8_t *)&v7, 2u);
    }
  }
  return 0;
}

+ ($A5A652246548B43F8BC05201A1C72A70)_copyDataFromReadArchive:(archive *)a3 toWriteDiskArchive:(archive *)a4 remainingQuota:(unint64_t *)a5 archiveIdentifier:(id)a6 shouldDefer:(id)a7
{
  id v9 = a6;
  v10 = a7;
  for (i = (uint64_t (*)(void))v10[2]; (i() & 1) == 0; i = (uint64_t (*)(void))v10[2])
  {
    int data_block = archive_read_data_block();
    if (data_block)
    {
      if (data_block == 1)
      {
        v14.var0 = 1;
        goto LABEL_15;
      }
      v15 = TRILogCategory_Archiving();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = archive_error_string();
      v16 = "archive_read_data_block failed - %s.";
      goto LABEL_17;
    }
    *a5 = *a5;
    if (archive_write_data_block() < 0)
    {
      v15 = TRILogCategory_Archiving();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        v14.var0 = 0;
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = archive_error_string();
      v16 = "archive_write_data_block failed - %s.";
LABEL_17:
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
      goto LABEL_14;
    }
  }
  v13 = TRILogCategory_Archiving();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deferring during archive extraction.", buf, 2u);
  }

  v14.var0 = 2;
LABEL_15:

  return v14;
}

+ (BOOL)_withLockAndDirectoryChangedToURL:(id)a3 runBlock:(id)a4
{
  v5 = (char *)a3;
  v6 = (void (**)(id, uint8_t *))a4;
  uint64_t v8 = +[NSFileManager defaultManager];
  id v35 = 0;
  unsigned __int8 v9 = [v8 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v35];
  v10 = (char *)v35;

  if ((v9 & 1) == 0)
  {
    v16 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v5;
      __int16 v44 = 2112;
      v45 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to create directory at %@ - %@.", buf, 0x16u);
    }

    goto LABEL_13;
  }
  v11 = (const char *)[v5 fileSystemRepresentation];
  int v12 = open(v11, 0x100000);
  if (v12 < 0)
  {
    v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v26 = __error();
      v27 = strerror(*v26);
      int v28 = *__error();
      *(_DWORD *)buf = 136315650;
      v43 = v11;
      __int16 v44 = 2080;
      v45 = v27;
      __int16 v46 = 1024;
      int v47 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to open directory %s: %s (%d)", buf, 0x1Cu);
    }

LABEL_13:
    char v18 = 0;
    goto LABEL_25;
  }
  bzero(buf, 0x400uLL);
  v13 = getcwd((char *)buf, 0x400uLL);
  if (flock(v12, 2))
  {
    $A5A652246548B43F8BC05201A1C72A70 v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v23 = __error();
      v24 = strerror(*v23);
      int v25 = *__error();
      *(_DWORD *)v36 = 136315650;
      v37 = v11;
      __int16 v38 = 2080;
      v39 = v24;
      __int16 v40 = 1024;
      int v41 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to lock directory %s err:%s (%d)", v36, 0x1Cu);
    }

    int v15 = 0;
LABEL_18:
    char v18 = 0;
    goto LABEL_19;
  }
  int v15 = 1;
  if (chdir(v11))
  {
    uint64_t v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v32 = __error();
      v33 = strerror(*v32);
      int v34 = *__error();
      *(_DWORD *)v36 = 136315650;
      v37 = v11;
      __int16 v38 = 2080;
      v39 = v33;
      __int16 v40 = 1024;
      int v41 = v34;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "failed to chdir directory %s err:%s (%d)", v36, 0x1Cu);
    }

    goto LABEL_18;
  }
  *(_DWORD *)v36 = v12;
  v6[2](v6, v36);
  char v18 = 1;
LABEL_19:
  chdir(v13);
  if (v15 && flock(v12, 8))
  {
    v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v29 = __error();
      v30 = strerror(*v29);
      int v31 = *__error();
      *(_DWORD *)v36 = 136315650;
      v37 = v11;
      __int16 v38 = 2080;
      v39 = v30;
      __int16 v40 = 1024;
      int v41 = v31;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to unlock lockfile %s: %s (%d)", v36, 0x1Cu);
    }
  }
  close(v12);
LABEL_25:

  return v18 & 1;
}

+ ($A5A652246548B43F8BC05201A1C72A70)_compressFilesInCurrentDirectoryWithLockWitness:(TRIFlockWitness_ *)a3 shouldDefer:(id)a4
{
  id v4 = a4;
  v5 = +[NSFileManager defaultManager];
  v6 = [v5 currentDirectoryPath];

  int v7 = objc_opt_new();
  unsigned __int8 v8 = [v7 inPlaceCompressDirectory:v6 shouldDefer:v4];

  return ($A5A652246548B43F8BC05201A1C72A70)v8;
}

+ ($A5A652246548B43F8BC05201A1C72A70)_withLockWitness:(TRIFlockWitness_ *)a3 performExtractionIntoCurrentDirectoryFromArchive:(archive *)a4 maxUnarchivedSize:(unint64_t)a5 archiveIdentifier:(id)a6 shouldDefer:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  id v89 = a1;
  id v90 = [a1 _createWriteDiskArchive];
  if (!v90)
  {
    v65 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v97 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Unable to create disk archive for writing.", v97, 2u);
    }

    v66.var0 = 0;
    goto LABEL_102;
  }
  unint64_t v92 = a5;
  while (1)
  {
    do
    {
      int next_header = archive_read_next_header();
      if (next_header)
      {
        if (next_header == 1)
        {
          v66.var0 = 1;
          goto LABEL_93;
        }
        v67 = TRILogCategory_Archiving();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          uint64_t v68 = archive_error_string();
          *(_DWORD *)v97 = 136315138;
          uint64_t v98 = v68;
          v69 = "archive_read_next_header failed - %s.";
          goto LABEL_104;
        }
LABEL_79:

LABEL_80:
        v66.var0 = 0;
        goto LABEL_93;
      }
      id v13 = v10;
      int v14 = archive_entry_filetype();
      int v15 = v14;
      if (v14 != 0x4000 && v14 != 0x8000)
      {
        v70 = TRILogCategory_Archiving();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          uint64_t v81 = archive_entry_pathname();
          *(_DWORD *)buf = 136315650;
          uint64_t v106 = v81;
          __int16 v107 = 1024;
          *(_DWORD *)v108 = v15;
          *(_WORD *)&v108[4] = 2112;
          *(void *)&v108[6] = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "found file that is neither directory nor regular file. Aborting. Offending file: %s, file type: 0x%x, archive identifier: %@", buf, 0x1Cu);
        }

        goto LABEL_80;
      }
      uint64_t v17 = archive_entry_pathname_utf8();
      if (v17)
      {
        char v18 = (const char *)v17;
        uint64_t v19 = 0;
        do
          int v20 = *(unsigned __int8 *)(v17 + v19++);
        while (v20 == 47);
        if (v19 != 1)
        {
          v21 = TRILogCategory_Archiving();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            size_t v22 = strlen(v18);
            *(_DWORD *)buf = 134218240;
            uint64_t v106 = v19 - 1;
            __int16 v107 = 2048;
            *(void *)v108 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "archive_entry with absolute path encountered...ignoring leading %zu of %zu bytes.", buf, 0x16u);
          }
        }
        v23 = [objc_alloc((Class)NSString) initWithUTF8String:&v18[v19 - 1]];
        v24 = v23;
        if (!v23)
        {
          v27 = TRILogCategory_Archiving();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v106 = (uint64_t)&v18[v19 - 1];
            int v28 = v27;
            v29 = "Unable to initialize entry path with string %s";
            uint32_t v30 = 12;
            goto LABEL_67;
          }
LABEL_22:
          BOOL v26 = 0;
          int v31 = 1;
LABEL_43:

          goto LABEL_44;
        }
        id v25 = [v23 length];
        BOOL v26 = v25 == 0;
        if (v15 != 0x4000 && !v25)
        {
          v27 = TRILogCategory_Archiving();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            int v28 = v27;
            v29 = "archive_entry with no path after sanitization encountered.";
            uint32_t v30 = 2;
LABEL_67:
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v29, buf, v30);
            goto LABEL_22;
          }
          goto LABEL_22;
        }
        v27 = [v24 lastPathComponent];
        if ((unint64_t)[v27 length] < 0x81)
        {
          id v86 = v11;
          id v87 = v10;
          v33 = [v24 pathComponents];
          long long v93 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          v32 = v33;
          id v34 = [v32 countByEnumeratingWithState:&v93 objects:v97 count:16];
          if (v34)
          {
            id v35 = v34;
            uint64_t v36 = *(void *)v94;
            while (2)
            {
              for (i = 0; i != v35; i = (char *)i + 1)
              {
                if (*(void *)v94 != v36) {
                  objc_enumerationMutation(v32);
                }
                if ([*(id *)(*((void *)&v93 + 1) + 8 * i) isEqualToString:@".."])
                {
                  v39 = TRILogCategory_Archiving();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v106 = (uint64_t)v24;
                  }

                  __int16 v38 = v32;
                  id v11 = v86;
                  id v10 = v87;
                  goto LABEL_40;
                }
              }
              id v35 = [v32 countByEnumeratingWithState:&v93 objects:v97 count:16];
              if (v35) {
                continue;
              }
              break;
            }
          }

          if ((unint64_t)[v32 count] < 0x11)
          {
            int v31 = 0;
            id v11 = v86;
            id v10 = v87;
            goto LABEL_42;
          }
          __int16 v38 = TRILogCategory_Archiving();
          id v11 = v86;
          id v10 = v87;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v106 = (uint64_t)v24;
            __int16 v107 = 2112;
            *(void *)v108 = v87;
            _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Directory depth more than maximum allowable depth. Stopping unarchival. Offending file: %@, archive identifier: %@", buf, 0x16u);
          }
LABEL_40:
        }
        else
        {
          v32 = TRILogCategory_Archiving();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218498;
            uint64_t v106 = 128;
            __int16 v107 = 2112;
            *(void *)v108 = v27;
            *(_WORD *)&v108[8] = 2112;
            *(void *)&v108[10] = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Encountered fileName greater that %ld characters. Offending fileName: %@, archive identifier: %@", buf, 0x20u);
          }
        }
        int v31 = 1;
LABEL_42:

        goto LABEL_43;
      }
      v24 = TRILogCategory_Archiving();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "archive_entry with no path encountered.", buf, 2u);
      }
      BOOL v26 = 0;
      int v31 = 1;
LABEL_44:

      if (v31) {
        goto LABEL_80;
      }
      archive_entry_perm();
      archive_entry_set_perm();
    }
    while (v26);
    id v40 = objc_alloc((Class)NSString);
    uint64_t v41 = archive_entry_pathname_utf8();
    if (!v41)
    {
      v64 = +[NSAssertionHandler currentHandler];
      [v64 handleFailureInMethod:a2, v89, @"TRIArchiveExtractor.m", 358, @"Expression was unexpectedly nil/false: %@", @"archive_entry_pathname_utf8(entry)" object file lineNumber description];
    }
    id v42 = [v40 initWithUTF8String:v41];
    if (!v42)
    {
      v67 = TRILogCategory_Archiving();
      if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      uint64_t v82 = archive_entry_pathname_utf8();
      *(_DWORD *)v97 = 136315138;
      uint64_t v98 = v82;
      v69 = "unable to convert path to UTF-8: %s";
LABEL_104:
      _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, v69, v97, 0xCu);
      goto LABEL_79;
    }
    id v43 = v42;
    __int16 v44 = [v43 lastPathComponent];
    unsigned int v45 = [v44 hasPrefix:@"._"];
    id v46 = v43;
    if (v15 != 0x4000)
    {
      id v46 = v43;
      if (v45)
      {
        int v47 = objc_opt_new();
        v48 = [v47 UUIDString];
        v49 = [v48 stringByAppendingString:v44];

        v50 = [v43 stringByDeletingLastPathComponent];
        v51 = [v50 stringByAppendingPathComponent:v49];

        id v46 = v51;
        [v46 fileSystemRepresentation];
        archive_entry_set_pathname_utf8();
        v52 = TRILogCategory_Archiving();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v97 = 138412290;
          uint64_t v98 = (uint64_t)v43;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "warning: extracting AppleDouble path as regular file: %@", v97, 0xCu);
        }
      }
    }
    if (archive_write_header()) {
      break;
    }
    if (!archive_entry_size_is_set() || archive_entry_size() >= 1)
    {
      unsigned __int8 v53 = [v89 _copyDataFromReadArchive:a4 toWriteDiskArchive:v90 remainingQuota:&v92 archiveIdentifier:v13 shouldDefer:v11];
      if (v53 == 2)
      {
        v66.var0 = v53;
        goto LABEL_92;
      }
      if (!v53)
      {
        v56 = TRILogCategory_Archiving();
        if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          goto LABEL_91;
        }
        uint64_t v74 = archive_error_string();
        *(_DWORD *)v97 = 136315138;
        uint64_t v98 = v74;
        v72 = "error copying data to write archive - %s";
LABEL_88:
        v75 = v56;
        uint32_t v76 = 12;
LABEL_89:
        _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, v72, v97, v76);
        goto LABEL_91;
      }
    }
    int v54 = archive_write_finish_entry();
    v55 = TRILogCategory_Archiving();
    v56 = v55;
    if (v54)
    {
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        goto LABEL_91;
      }
      uint64_t v73 = archive_error_string();
      *(_DWORD *)v97 = 136315138;
      uint64_t v98 = v73;
      v72 = "archive_write_finish_entry failed - %s";
      goto LABEL_88;
    }
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      uint64_t v57 = archive_entry_pathname();
      *(_DWORD *)v97 = 136315138;
      uint64_t v98 = v57;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "finished writing archive entry %s", v97, 0xCu);
    }

    if (([v46 isEqualToString:v43] & 1) == 0)
    {
      id v58 = v46;
      v59 = (const std::__fs::filesystem::path *)[v58 fileSystemRepresentation];
      id v60 = v43;
      v61 = (const std::__fs::filesystem::path *)[v60 fileSystemRepresentation];
      rename(v59, v61, v62);
      if (v63)
      {
        v56 = TRILogCategory_Archiving();
        if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          goto LABEL_91;
        }
        v83 = __error();
        v84 = strerror(*v83);
        int v85 = *__error();
        *(_DWORD *)v97 = 138413058;
        uint64_t v98 = (uint64_t)v58;
        __int16 v99 = 2112;
        id v100 = v60;
        __int16 v101 = 2080;
        v102 = v84;
        __int16 v103 = 1024;
        int v104 = v85;
        v72 = "unable to rename munged AppleDouble path %@ --> %@: %s (%d)";
        v75 = v56;
        uint32_t v76 = 38;
        goto LABEL_89;
      }
    }
  }
  v56 = TRILogCategory_Archiving();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
  {
    uint64_t v71 = archive_error_string();
    *(_DWORD *)v97 = 136315138;
    uint64_t v98 = v71;
    v72 = "archive_write_header failed - %s";
    goto LABEL_88;
  }
LABEL_91:

  v66.var0 = 0;
LABEL_92:

LABEL_93:
  int v77 = archive_write_close();
  if (v66.var0 == 1 && v77)
  {
    v78 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v97 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "unable to close archive_write_disk", v97, 2u);
    }

    v66.var0 = 0;
  }
  if (archive_write_free())
  {
    v79 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v97 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "unable to free archive_write_disk", v97, 2u);
    }
  }
LABEL_102:

  return v66;
}

+ ($A5A652246548B43F8BC05201A1C72A70)extractArchiveFromHandle:(id)a3 toDestinationDirectoryURL:(id)a4 maxUnarchivedSize:(unint64_t)a5 archiveIdentifier:(id)a6 postExtractionCompression:(id)a7 shouldDefer:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  char v18 = (Block_layout *)a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"TRIArchiveExtractor.m", 435, @"Invalid parameter not satisfying: %@", @"archiveHandle" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v27 = +[NSAssertionHandler currentHandler];
  [v27 handleFailureInMethod:a2, a1, @"TRIArchiveExtractor.m", 436, @"Invalid parameter not satisfying: %@", @"destinationURL" object file lineNumber description];

LABEL_3:
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = &stru_100010560;
  }
  int v20 = objc_retainBlock(v19);

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2810000000;
  v39 = &unk_10000D389;
  char v40 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100006528;
  v28[3] = &unk_100010588;
  v32 = &v36;
  id v33 = a1;
  id v21 = v15;
  id v29 = v21;
  unint64_t v34 = a5;
  id v22 = v17;
  id v30 = v22;
  v23 = v20;
  int v31 = v23;
  unint64_t var0 = a7.var0;
  +[TRIArchiveExtractor _withLockAndDirectoryChangedToURL:v16 runBlock:v28];
  v24.unint64_t var0 = *((unsigned char *)v37 + 32);

  _Block_object_dispose(&v36, 8);
  return v24;
}

- (NSURL)archiveFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end