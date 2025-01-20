@interface UserCoreFileHandler
- (UserCoreFileHandler)initWithCoreFilePath:(const char *)a3 :(const char *)a4;
- (id)saveUserSpaceCoreToDisk:(double)a3;
- (void)dealloc;
@end

@implementation UserCoreFileHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input_corefile_name, 0);

  objc_storeStrong((id *)&self->_input_corefile_path, 0);
}

- (id)saveUserSpaceCoreToDisk:(double)a3
{
  if (!self->_input_core)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_59;
  }
  v4 = self;
  v10 = self->_input_corefile_name;
  if (!v10)
  {
LABEL_59:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_60;
  }

  v11 = v4->_input_corefile_path;
  if (!v11)
  {
LABEL_60:
    _os_assert_log();
    int v73 = _os_crash();
    __break(1u);
    goto LABEL_61;
  }

  id v99 = 0;
  char v12 = sub_100015090(@"/private/var/mobile/Library/Logs/CrashReporter/Panics", &v99, 493);
  id v13 = v99;
  v14 = v13;
  if ((v12 & 1) == 0)
  {
    v36 = (void *)qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v37 = 0;
      v5 = 0;
      v38 = 0;
      id v3 = v14;
      goto LABEL_37;
    }
    id v3 = v14;
    v40 = v36;
    v49 = (const char *)[v3 UTF8String];
    *(_DWORD *)buf = 136315138;
    v101 = v49;
    v42 = "failed to setup corefile output directory with error: %s";
LABEL_34:
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v42, buf, 0xCu);

    goto LABEL_35;
  }
  id v98 = v13;
  char v15 = sub_100015090(@"/private/var/mobile/Library/Logs/CrashReporter/Panics/staged", &v98, 493);
  id v3 = v98;

  if ((v15 & 1) == 0)
  {
    v39 = (void *)qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    id v3 = v3;
    v40 = v39;
    v41 = (const char *)[v3 UTF8String];
    *(_DWORD *)buf = 136315138;
    v101 = v41;
    v42 = "failed to setup corefile stage directory with error: %s";
    goto LABEL_34;
  }
  id v16 = sub_100016D80(@"/private/var/mobile/Library/Logs/CrashReporter/Panics", v4->_input_corefile_name);
  v17 = (char *)malloc_type_malloc(0x20000uLL, 0xFC1095D3uLL);
  v7 = &unk_10003A000;
  v18 = qword_10003A5D8;
  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      input_corefile_name = v4->_input_corefile_name;
      v44 = v18;
      v45 = [(NSString *)input_corefile_name UTF8String];
      *(_DWORD *)buf = 136315138;
      v101 = v45;
      _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to allocate compression buffer for %s core", buf, 0xCu);
    }
    goto LABEL_35;
  }
  v19 = v17;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v101 = "/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "gzopen %s", buf, 0xCu);
  }
  gzFile v20 = gzopen("/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX", "w");
  if (!v20)
  {
    v48 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v55 = v4->_input_corefile_name;
      v56 = v48;
      v57 = [(NSString *)v55 UTF8String];
      v58 = __error();
      v59 = strerror(*v58);
      *(_DWORD *)buf = 136315394;
      v101 = v57;
      __int16 v102 = 2080;
      v103 = v59;
      _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to open %s core compressed output file with error %s", buf, 0x16u);
    }
    fclose(v4->_input_core);
    v4->_input_core = 0;
    free(v19);
LABEL_35:
    v37 = 0;
    v5 = 0;
    goto LABEL_36;
  }
  v21 = v20;
  do
  {
    size_t v22 = fread(v19, 1uLL, 0x20000uLL, v4->_input_core);
    if (v22)
    {
      unint64_t v23 = v22;
      uint64_t v24 = 0;
      int v25 = 0;
      while (1)
      {
        int v26 = gzwrite(v21, &v19[v24], v23 - v25);
        if (!v26) {
          break;
        }
        v25 += v26;
        uint64_t v24 = v25;
        if (v23 <= v25) {
          goto LABEL_17;
        }
      }
      v46 = (void *)qword_10003A5D8;
      if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      v51 = v4->_input_corefile_name;
      v52 = v46;
      v53 = [(NSString *)v51 UTF8String];
      *(_DWORD *)buf = 136315138;
      v101 = v53;
      v54 = "gzwrite failed to write %s core";
      goto LABEL_41;
    }
    if (!feof(v4->_input_core))
    {
      v60 = (void *)qword_10003A5D8;
      if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      v61 = v4->_input_corefile_name;
      v52 = v60;
      v62 = [(NSString *)v61 UTF8String];
      *(_DWORD *)buf = 136315138;
      v101 = v62;
      v54 = "Failed to read content from %s core";
LABEL_41:
      _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, v54, buf, 0xCu);

LABEL_29:
      fclose(v4->_input_core);
      free(v19);
      gzclose(v21);
      remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX", v47);
      fclose(v4->_input_core);
      goto LABEL_35;
    }
LABEL_17:
    ;
  }
  while (!feof(v4->_input_core));
  free(v19);
  fclose(v4->_input_core);
  v4->_input_core = 0;
  int v27 = gzclose(v21);
  if (v27)
  {
    int v28 = v27;
    if (v27 == -1)
    {
      v29 = (void *)qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        v31 = v4->_input_corefile_name;
        v32 = v29;
        v33 = [(NSString *)v31 UTF8String];
        v34 = __error();
        v35 = strerror(*v34);
        *(_DWORD *)buf = 136315394;
        v101 = v33;
        __int16 v102 = 2080;
        v103 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to close compressed %s core with error : %s", buf, 0x16u);
      }
    }
    else
    {
      v71 = (void *)qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        v91 = v4->_input_corefile_name;
        v92 = v71;
        v93 = [(NSString *)v91 UTF8String];
        *(_DWORD *)buf = 136315394;
        v101 = v93;
        __int16 v102 = 1024;
        LODWORD(v103) = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "Failed to close compressed %s core with error : %d", buf, 0x12u);
      }
    }
    remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX", v30);
    goto LABEL_35;
  }
  v8 = &AAByteStreamClose_ptr;
  v63 = sub_10001ACD4(a3);
  v5 = +[NSString stringWithFormat:@"%@.%s%@.core.gz", v63, "", v4->_input_corefile_name];

  id v64 = +[NSString stringWithFormat:@"%s/%@", "/private/var/mobile/Library/Logs/CrashReporter/Panics/staged", v5];
  v65 = (const std::__fs::filesystem::path *)[v64 UTF8String];
  rename((const std::__fs::filesystem::path *)"/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX", v65, v66);
  int v68 = v67;

  if (v68)
  {
    v69 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v94 = v4->_input_corefile_name;
      v95 = v69;
      v96 = [(NSString *)v94 UTF8String];
      id v97 = [v5 UTF8String];
      *(_DWORD *)buf = 136315650;
      v101 = v96;
      __int16 v102 = 2080;
      v103 = "/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX";
      __int16 v104 = 2080;
      id v105 = v97;
      _os_log_error_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "Failed to rename compressed %s from %s to %s", buf, 0x20u);
    }
    remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX", v70);
    goto LABEL_48;
  }
  int v72 = sub_10000F968();
  v6 = (void *)qword_10003A5D8;
  int v73 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
  if (!v72)
  {
LABEL_61:
    if (v73)
    {
      v81 = v4->_input_corefile_name;
      v82 = v6;
      v83 = [(NSString *)v81 UTF8String];
      *(_DWORD *)buf = 136315138;
      v101 = v83;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Removing original %s core", buf, 0xCu);
    }
    v84 = [(NSString *)v4->_input_corefile_path UTF8String];
    remove(v84, v85);
    goto LABEL_64;
  }
  if (v73)
  {
    v74 = v4->_input_corefile_name;
    v75 = v6;
    v76 = [(NSString *)v74 UTF8String];
    *(_DWORD *)buf = 136315138;
    v101 = v76;
    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Detected stress rack device, setting xattr on original %s core", buf, 0xCu);
  }
  if (setxattr([(NSString *)v4->_input_corefile_path UTF8String], "UserSpaceCoreCompressed", "YES", 4uLL, 0, 0))
  {
    v77 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v78 = v77;
      v79 = __error();
      v80 = strerror(*v79);
      *(_DWORD *)buf = 136315394;
      v101 = "UserSpaceCoreCompressed";
      __int16 v102 = 2080;
      v103 = v80;
      _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "Failed to set %s xattr returned error : %s", buf, 0x16u);
    }
LABEL_48:
    v37 = 0;
LABEL_36:
    v38 = 0;
    goto LABEL_37;
  }
LABEL_64:
  id v86 = sub_100016D80(@"/private/var/mobile/Library/Logs/CrashReporter/Panics", v4->_input_corefile_name);
  v37 = [v8[234] stringWithFormat:@"%s/%@", "/private/var/mobile/Library/Logs/CrashReporter/Panics", v5];
  v87 = +[NSFileManager defaultManager];
  unsigned __int8 v88 = [v87 fileExistsAtPath:v37];

  v89 = *((void *)v7 + 187);
  if ((v88 & 1) == 0)
  {
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v101 = v37;
      _os_log_error_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "Cannot find %@", buf, 0xCu);
    }
    goto LABEL_36;
  }
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
    v90 = v4->_input_corefile_name;
    *(_DWORD *)buf = 138412546;
    v101 = (const char *)v90;
    __int16 v102 = 2112;
    v103 = v37;
    _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "Finished processing %@ core, available at %@", buf, 0x16u);
  }
  v37 = v37;
  v38 = v37;
LABEL_37:

  return v38;
}

- (void)dealloc
{
  input_core = self->_input_core;
  if (input_core)
  {
    fclose(input_core);
    self->_input_core = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UserCoreFileHandler;
  [(UserCoreFileHandler *)&v4 dealloc];
}

- (UserCoreFileHandler)initWithCoreFilePath:(const char *)a3 :(const char *)a4
{
  self->_input_core = 0;
  char v35 = 0;
  int value = 0;
  v7 = +[NSString stringWithUTF8String:a4];
  input_corefile_path = self->_input_corefile_path;
  self->_input_corefile_path = v7;

  v9 = +[NSString stringWithUTF8String:a3];
  input_corefile_name = self->_input_corefile_name;
  self->_input_corefile_name = v9;

  input_core = fopen(a4, "r");
  self->_input_core = input_core;
  if (input_core) {
    goto LABEL_2;
  }
  if (*__error() == 2)
  {
    v17 = (void *)qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:
      int v27 = 0;
      goto LABEL_22;
    }
    v18 = self->_input_corefile_name;
    v19 = v17;
    *(_DWORD *)buf = 136315394;
    v37 = [(NSString *)v18 UTF8String];
    __int16 v38 = 2080;
    v39 = a4;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No %s core found at %s", buf, 0x16u);
LABEL_8:

    goto LABEL_17;
  }
  input_core = self->_input_core;
  if (!input_core)
  {
    int v26 = (void *)qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    v19 = v26;
    v30 = __error();
    v31 = strerror(*v30);
    *(_DWORD *)buf = 136315394;
    v37 = a4;
    __int16 v38 = 2080;
    v39 = v31;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "open %s failed with error: %s", buf, 0x16u);
    goto LABEL_8;
  }
LABEL_2:
  int v12 = feof(input_core);
  id v13 = (void *)qword_10003A5D8;
  BOOL v14 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      char v15 = self->_input_corefile_name;
      id v16 = v13;
      *(_DWORD *)buf = 136315138;
      v37 = [(NSString *)v15 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s core is empty", buf, 0xCu);
    }
    goto LABEL_21;
  }
  if (v14)
  {
    gzFile v20 = self->_input_corefile_name;
    v21 = v13;
    *(_DWORD *)buf = 136315394;
    v37 = [(NSString *)v20 UTF8String];
    __int16 v38 = 2080;
    v39 = a4;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found %s core at %s", buf, 0x16u);
  }
  if (getxattr(a4, "UserSpaceCoreCompressed", &value, 5uLL, 0, 0) != -1)
  {
    size_t v22 = (void *)qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:
      fclose(self->_input_core);
      int v27 = 0;
      self->_input_core = 0;
      goto LABEL_22;
    }
    unint64_t v23 = self->_input_corefile_name;
    uint64_t v24 = v22;
    int v25 = [(NSString *)v23 UTF8String];
    *(_DWORD *)buf = 136315138;
    v37 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s core already compressed, skipping collection", buf, 0xCu);
LABEL_14:

    goto LABEL_21;
  }
  if (*__error() != 93)
  {
    int v28 = (void *)qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    uint64_t v24 = v28;
    v32 = __error();
    v33 = strerror(*v32);
    *(_DWORD *)buf = 136315394;
    v37 = "UserSpaceCoreCompressed";
    __int16 v38 = 2080;
    v39 = v33;
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "getxattr %s returned error : %s", buf, 0x16u);
    goto LABEL_14;
  }
  int v27 = self;
LABEL_22:

  return v27;
}

@end