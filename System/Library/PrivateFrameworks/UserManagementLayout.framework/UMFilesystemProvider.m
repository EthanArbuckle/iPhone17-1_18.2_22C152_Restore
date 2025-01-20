@interface UMFilesystemProvider
- (BOOL)atomicallyWriteData:(id)a3 toPath:(id)a4 error:(id *)a5;
- (BOOL)chmodPath:(id)a3 withMode:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)chownPath:(id)a3 toUser:(unsigned int)a4 group:(unsigned int)a5 error:(id *)a6;
- (BOOL)clonePath:(id)a3 toPath:(id)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)fileExistsAtPath:(id)a3 isDirectory:(BOOL *)a4;
- (BOOL)fixupPath:(id)a3 withMode:(unsigned __int16)a4 toUser:(unsigned int)a5 group:(unsigned int)a6 error:(id *)a7;
- (BOOL)makePath:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)removeFileAtPath:(id)a3 error:(id *)a4;
- (BOOL)removePath:(id)a3 error:(id *)a4;
- (BOOL)renameFileFromPath:(id)a3 toPath:(id)a4 error:(id *)a5;
- (BOOL)writeToFileWithDescriptor:(int)a3 string:(id)a4 error:(id *)a5;
- (id)dataWithContentsOfFile:(id)a3 error:(id *)a4;
- (int)openFileForAppendingAtPath:(id)a3 error:(id *)a4;
- (int64_t)sizeOfFileWithDescriptor:(int)a3 error:(id *)a4;
- (void)closeFileWithDescriptor:(int)a3;
@end

@implementation UMFilesystemProvider

- (BOOL)fileExistsAtPath:(id)a3 isDirectory:(BOOL *)a4
{
  v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  v7 = [v5 defaultManager];
  LOBYTE(a4) = [v7 fileExistsAtPath:v6 isDirectory:a4];

  return (char)a4;
}

- (id)dataWithContentsOfFile:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v35 = 0;
  id v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5 options:0 error:&v35];
  id v7 = v35;
  v8 = v7;
  if (v6)
  {
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    v9 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v10 = sub_2608CE99C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      if (v11)
      {
        int v36 = 138412290;
        id v37 = v5;
        uint64_t v12 = _os_log_send_and_compose_impl();
        v13 = (void *)v12;
        if (v12) {
          sub_2608CE9C4(v12);
        }
      }
      else
      {
        v13 = 0;
      }
      free(v13);
    }

    goto LABEL_28;
  }
  if (!a4 || !v7) {
    goto LABEL_28;
  }
  v14 = [v7 userInfo];
  uint64_t v15 = *MEMORY[0x263F08608];
  v16 = [v14 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if (v16)
  {
    v17 = [v8 userInfo];
    v18 = [v17 objectForKeyedSubscript:v15];

    v19 = [v18 domain];
    int v20 = [v19 isEqualToString:*MEMORY[0x263F08438]];

    if (v20)
    {
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      v21 = (id)qword_26B3F3E68;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_51;
      }
      int v22 = sub_2608CE99C();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        v22 &= ~1u;
      }
      if (v22)
      {
        v23 = v21;
        int v24 = [v18 code];
        int v36 = 138543618;
        id v37 = v5;
        __int16 v38 = 1024;
        LODWORD(v39) = v24;
        v25 = (void *)_os_log_send_and_compose_impl();

        if (!v25) {
          goto LABEL_50;
        }
        goto LABEL_48;
      }
    }
    else
    {
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      v21 = (id)qword_26B3F3E68;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_51;
      }
      unsigned int v32 = sub_2608CE99C();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        unsigned int v33 = v32;
      }
      else {
        unsigned int v33 = v32 & 0xFFFFFFFE;
      }
      if (v33)
      {
        int v36 = 138543618;
        id v37 = v5;
        __int16 v38 = 2114;
        v39 = v18;
        v25 = (void *)_os_log_send_and_compose_impl();
        if (!v25)
        {
LABEL_50:
          free(v25);
LABEL_51:

          id v34 = v18;
          *a4 = v34;

          goto LABEL_28;
        }
LABEL_48:
        sub_2608CE9C4((uint64_t)v25);
        goto LABEL_50;
      }
    }
    v25 = 0;
    goto LABEL_50;
  }
  if (qword_26B3F3E78 != -1) {
    dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
  }
  v27 = (id)qword_26B3F3E68;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    unsigned int v28 = sub_2608CE99C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      unsigned int v29 = v28;
    }
    else {
      unsigned int v29 = v28 & 0xFFFFFFFE;
    }
    if (v29)
    {
      int v36 = 138543618;
      id v37 = v5;
      __int16 v38 = 2114;
      v39 = v8;
      uint64_t v30 = _os_log_send_and_compose_impl();
      v31 = (void *)v30;
      if (v30) {
        sub_2608CE9C4(v30);
      }
    }
    else
    {
      v31 = 0;
    }
    free(v31);
  }

  *a4 = v8;
LABEL_28:

  return v6;
}

- (BOOL)atomicallyWriteData:(id)a3 toPath:(id)a4 error:(id *)a5
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (a5) {
    *a5 = 0;
  }
  id v9 = [NSString stringWithFormat:@"%@.writing", v8];
  if (unlink((const char *)[v9 UTF8String]))
  {
    int v10 = *__error();
    if (v10 != 2)
    {
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      v21 = (id)qword_26B3F3E68;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      unsigned int v22 = sub_2608CE99C();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        unsigned int v23 = v22;
      }
      else {
        unsigned int v23 = v22 & 0xFFFFFFFE;
      }
      if (v23)
      {
        int v90 = 138543874;
        id v91 = v8;
        __int16 v92 = 2114;
        *(void *)v93 = v9;
        *(_WORD *)&v93[8] = 1024;
        *(_DWORD *)&v93[10] = v10;
        goto LABEL_32;
      }
LABEL_42:
      v27 = 0;
LABEL_43:
      free(v27);
LABEL_44:

      if (a5)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v10 userInfo:0];
        BOOL v33 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v33 = 0;
      }
      goto LABEL_138;
    }
  }
  id v11 = v9;
  int v12 = open_dprotected_np((const char *)[v11 UTF8String], 3585, 4, 0, 420);
  if (v12 == -1)
  {
    int v10 = *__error();
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    v21 = (id)qword_26B3F3E68;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    unsigned int v24 = sub_2608CE99C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      unsigned int v25 = v24;
    }
    else {
      unsigned int v25 = v24 & 0xFFFFFFFE;
    }
    if (v25)
    {
      int v90 = 138543874;
      id v91 = v8;
      __int16 v92 = 2114;
      *(void *)v93 = v11;
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)&v93[10] = v10;
LABEL_32:
      uint64_t v26 = _os_log_send_and_compose_impl();
      v27 = (void *)v26;
      if (v26) {
        sub_2608CE9C4(v26);
      }
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  int v13 = v12;
  id v14 = v7;
  ssize_t v15 = write(v13, (const void *)[v14 bytes], objc_msgSend(v14, "length"));
  if (v15 < 0)
  {
    int v28 = *__error();
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    unsigned int v29 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      int v30 = sub_2608CE99C();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        v30 &= ~1u;
      }
      if (v30)
      {
        v31 = v29;
        int v90 = 138544130;
        id v91 = v8;
        __int16 v92 = 1024;
        *(_DWORD *)v93 = v13;
        *(_WORD *)&v93[4] = 2048;
        *(void *)&v93[6] = [v14 length];
        __int16 v94 = 1024;
        LODWORD(v95) = v28;
        LODWORD(v88) = 34;
        v87 = &v90;
        unsigned int v32 = (void *)_os_log_send_and_compose_impl();

        if (v32) {
          sub_2608CE9C4((uint64_t)v32);
        }
      }
      else
      {
        unsigned int v32 = 0;
      }
      free(v32);
    }

    if (a5)
    {
      uint64_t v34 = v28;
LABEL_90:
      v61 = (void *)MEMORY[0x263F087E8];
      uint64_t v62 = *MEMORY[0x263F08438];
LABEL_91:
      objc_msgSend(v61, "errorWithDomain:code:userInfo:", v62, v34, 0, v87, v88);
      BOOL v33 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_125;
    }
    goto LABEL_124;
  }
  ssize_t v16 = v15;
  if (v15 != [v14 length])
  {
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    v17 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v89 = v7;
      int v18 = sub_2608CE99C();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        v18 &= ~1u;
      }
      if (v18)
      {
        v19 = v17;
        int v90 = 138544130;
        id v91 = v8;
        __int16 v92 = 1024;
        *(_DWORD *)v93 = v13;
        *(_WORD *)&v93[4] = 2048;
        *(void *)&v93[6] = [v14 length];
        __int16 v94 = 2048;
        ssize_t v95 = v16;
        LODWORD(v88) = 38;
        v87 = &v90;
        int v20 = (void *)_os_log_send_and_compose_impl();

        if (v20) {
          sub_2608CE9C4((uint64_t)v20);
        }
      }
      else
      {
        int v20 = 0;
      }
      id v7 = v89;
      free(v20);
    }
  }
  if (!fsync(v13))
  {
    id v41 = v11;
    v42 = (const char *)[v41 UTF8String];
    id v43 = v8;
    if (renamex_np(v42, (const char *)[v43 UTF8String], 2u))
    {
      int v35 = *__error();
      if (v35 != 2)
      {
        if (qword_26B3F3E78 != -1) {
          dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
        }
        v63 = (id)qword_26B3F3E68;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          unsigned int v64 = sub_2608CE99C();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            unsigned int v65 = v64;
          }
          else {
            unsigned int v65 = v64 & 0xFFFFFFFE;
          }
          if (v65)
          {
            int v90 = 138543618;
            id v91 = v43;
            __int16 v92 = 1024;
            *(_DWORD *)v93 = v35;
            LODWORD(v88) = 18;
            v87 = &v90;
            uint64_t v66 = _os_log_send_and_compose_impl();
            v67 = (void *)v66;
            if (v66) {
              sub_2608CE9C4(v66);
            }
          }
          else
          {
            v67 = 0;
          }
          free(v67);
        }

        if (a5) {
          goto LABEL_89;
        }
        goto LABEL_124;
      }
      v44 = (const std::__fs::filesystem::path *)[v41 UTF8String];
      id v45 = v43;
      v46 = (const std::__fs::filesystem::path *)[v45 UTF8String];
      rename(v44, v46, v47);
      if (v48)
      {
        int v49 = *__error();
        if (qword_26B3F3E78 != -1) {
          dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
        }
        v50 = (id)qword_26B3F3E68;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          unsigned int v51 = sub_2608CE99C();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            unsigned int v52 = v51;
          }
          else {
            unsigned int v52 = v51 & 0xFFFFFFFE;
          }
          if (v52)
          {
            int v90 = 138543874;
            id v91 = v45;
            __int16 v92 = 1024;
            *(_DWORD *)v93 = 2;
            *(_WORD *)&v93[4] = 1024;
            *(_DWORD *)&v93[6] = v49;
            LODWORD(v88) = 24;
            v87 = &v90;
            uint64_t v53 = _os_log_send_and_compose_impl();
            v54 = (void *)v53;
            if (v53) {
              sub_2608CE9C4(v53);
            }
          }
          else
          {
            v54 = 0;
          }
          free(v54);
        }

        if (a5)
        {
          v61 = (void *)MEMORY[0x263F087E8];
          uint64_t v62 = *MEMORY[0x263F08438];
          uint64_t v34 = 2;
          goto LABEL_91;
        }
        goto LABEL_124;
      }
    }
    if (fcntl(v13, 85, v87, v88))
    {
      int v55 = *__error();
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      v56 = (id)qword_26B3F3E68;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        unsigned int v57 = sub_2608CE99C();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          unsigned int v58 = v57;
        }
        else {
          unsigned int v58 = v57 & 0xFFFFFFFE;
        }
        if (v58)
        {
          int v90 = 138543874;
          id v91 = v43;
          __int16 v92 = 1024;
          *(_DWORD *)v93 = v13;
          *(_WORD *)&v93[4] = 1024;
          *(_DWORD *)&v93[6] = v55;
          uint64_t v59 = _os_log_send_and_compose_impl();
          v60 = (void *)v59;
          if (v59) {
            sub_2608CE9C4(v59);
          }
        }
        else
        {
          v60 = 0;
        }
        free(v60);
      }
    }
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    v68 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v69 = sub_2608CE99C();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
        unsigned int v70 = v69;
      }
      else {
        unsigned int v70 = v69 & 0xFFFFFFFE;
      }
      if (v70)
      {
        int v90 = 138543362;
        id v91 = v43;
        uint64_t v71 = _os_log_send_and_compose_impl();
        v72 = (void *)v71;
        if (v71) {
          sub_2608CE9C4(v71);
        }
      }
      else
      {
        v72 = 0;
      }
      free(v72);
    }

    BOOL v33 = 1;
    goto LABEL_125;
  }
  int v35 = *__error();
  if (qword_26B3F3E78 != -1) {
    dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
  }
  int v36 = (id)qword_26B3F3E68;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    unsigned int v37 = sub_2608CE99C();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      unsigned int v38 = v37;
    }
    else {
      unsigned int v38 = v37 & 0xFFFFFFFE;
    }
    if (v38)
    {
      int v90 = 138543874;
      id v91 = v8;
      __int16 v92 = 1024;
      *(_DWORD *)v93 = v13;
      *(_WORD *)&v93[4] = 1024;
      *(_DWORD *)&v93[6] = v35;
      LODWORD(v88) = 24;
      v87 = &v90;
      uint64_t v39 = _os_log_send_and_compose_impl();
      uint64_t v40 = (void *)v39;
      if (v39) {
        sub_2608CE9C4(v39);
      }
    }
    else
    {
      uint64_t v40 = 0;
    }
    free(v40);
  }

  if (a5)
  {
LABEL_89:
    uint64_t v34 = v35;
    goto LABEL_90;
  }
LABEL_124:
  BOOL v33 = 0;
LABEL_125:
  if (close(v13))
  {
    int v73 = *__error();
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    v74 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v75 = sub_2608CE99C();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v76 = v75;
      }
      else {
        unsigned int v76 = v75 & 0xFFFFFFFE;
      }
      if (v76)
      {
        int v90 = 138543874;
        id v91 = v8;
        __int16 v92 = 1024;
        *(_DWORD *)v93 = v13;
        *(_WORD *)&v93[4] = 1024;
        *(_DWORD *)&v93[6] = v73;
        uint64_t v77 = _os_log_send_and_compose_impl();
        v78 = (void *)v77;
        if (v77) {
          sub_2608CE9C4(v77);
        }
      }
      else
      {
        v78 = 0;
      }
      free(v78);
    }
  }
LABEL_138:
  id v79 = v9;
  if (unlink((const char *)[v79 UTF8String]))
  {
    int v80 = *__error();
    if (v80 != 2)
    {
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      v81 = (id)qword_26B3F3E68;
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v82 = sub_2608CE99C();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v83 = v82;
        }
        else {
          unsigned int v83 = v82 & 0xFFFFFFFE;
        }
        if (v83)
        {
          int v90 = 138543874;
          id v91 = v8;
          __int16 v92 = 2114;
          *(void *)v93 = v79;
          *(_WORD *)&v93[8] = 1024;
          *(_DWORD *)&v93[10] = v80;
          uint64_t v84 = _os_log_send_and_compose_impl();
          v85 = (void *)v84;
          if (v84) {
            sub_2608CE9C4(v84);
          }
        }
        else
        {
          v85 = 0;
        }
        free(v85);
      }
    }
  }

  return v33;
}

- (int)openFileForAppendingAtPath:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  int v5 = open_dprotected_np((const char *)[a3 UTF8String], 777, 4, 0, 420);
  if (v5 == -1)
  {
    id v6 = __error();
    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*v6 userInfo:0];
    }
  }
  return v5;
}

- (void)closeFileWithDescriptor:(int)a3
{
}

- (BOOL)writeToFileWithDescriptor:(int)a3 string:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  id v7 = a4;
  id v8 = (const void *)[v7 UTF8String];
  size_t v9 = [v7 length];

  ssize_t v10 = write(a3, v8, v9);
  if (v10 == -1)
  {
    id v11 = __error();
    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*v11 userInfo:0];
    }
  }
  return v10 != -1;
}

- (int64_t)sizeOfFileWithDescriptor:(int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  memset(&v7, 0, sizeof(v7));
  if (!fstat(a3, &v7)) {
    return v7.st_size;
  }
  int v5 = __error();
  if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*v5 userInfo:0];
  }
  return -1;
}

- (BOOL)renameFileFromPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  id v7 = a3;
  id v8 = a4;
  size_t v9 = (const std::__fs::filesystem::path *)[v7 UTF8String];
  id v10 = v8;
  id v11 = (const std::__fs::filesystem::path *)[v10 UTF8String];

  rename(v9, v11, v12);
  int v14 = v13;
  if (v13)
  {
    ssize_t v15 = __error();
    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*v15 userInfo:0];
    }
  }
  return v14 == 0;
}

- (BOOL)removeFileAtPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v6 = v5;
  if (!unlink((const char *)[v6 UTF8String]))
  {
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    id v7 = (id)qword_26B3F3E68;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_33;
    }
    unsigned int v10 = sub_2608CE99C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      unsigned int v11 = v10;
    }
    else {
      unsigned int v11 = v10 & 0xFFFFFFFE;
    }
    if (v11)
    {
LABEL_20:
      uint64_t v12 = _os_log_send_and_compose_impl();
      int v13 = (void *)v12;
      if (v12) {
        sub_2608CE9C4(v12);
      }
      goto LABEL_32;
    }
LABEL_31:
    int v13 = 0;
LABEL_32:
    free(v13);
LABEL_33:

    BOOL v20 = 1;
    goto LABEL_39;
  }
  if (*__error() == 2)
  {
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    id v7 = (id)qword_26B3F3E68;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_33;
    }
    unsigned int v8 = sub_2608CE99C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      unsigned int v9 = v8;
    }
    else {
      unsigned int v9 = v8 & 0xFFFFFFFE;
    }
    if (v9) {
      goto LABEL_20;
    }
    goto LABEL_31;
  }
  int v14 = *__error();
  if (qword_26B3F3E78 != -1) {
    dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
  }
  ssize_t v15 = (id)qword_26B3F3E68;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    unsigned int v16 = sub_2608CE99C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      unsigned int v17 = v16;
    }
    else {
      unsigned int v17 = v16 & 0xFFFFFFFE;
    }
    if (v17)
    {
      uint64_t v18 = _os_log_send_and_compose_impl();
      v19 = (void *)v18;
      if (v18) {
        sub_2608CE9C4(v18);
      }
    }
    else
    {
      v19 = 0;
    }
    free(v19);
  }

  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v14 userInfo:0];
    BOOL v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_39:

  return v20;
}

- (BOOL)removePath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = removefile_state_alloc();
  LOBYTE(a4) = sub_2608CC384((uint64_t)self, v6, v7, a4);

  removefile_state_free(v7);
  return (char)a4;
}

- (BOOL)chownPath:(id)a3 toUser:(unsigned int)a4 group:(unsigned int)a5 error:(id *)a6
{
  id v9 = a3;
  if (a6) {
    *a6 = 0;
  }
  id v10 = v9;
  int v11 = lchown((const char *)[v10 UTF8String], a4, a5);
  if (v11)
  {
    int v12 = *__error();
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    int v13 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unsigned int v14 = sub_2608CE99C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        uint64_t v16 = _os_log_send_and_compose_impl();
        unsigned int v17 = (void *)v16;
        if (v16) {
          sub_2608CE9C4(v16);
        }
      }
      else
      {
        unsigned int v17 = 0;
      }
      free(v17);
    }

    if (a6)
    {
      *a6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v12 userInfo:0];
    }
  }

  return v11 == 0;
}

- (BOOL)chmodPath:(id)a3 withMode:(unsigned __int16)a4 error:(id *)a5
{
  id v7 = a3;
  if (a5) {
    *a5 = 0;
  }
  id v8 = v7;
  int v9 = chmod((const char *)[v8 UTF8String], a4);
  if (v9)
  {
    int v10 = *__error();
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    int v11 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = sub_2608CE99C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        uint64_t v14 = _os_log_send_and_compose_impl();
        unsigned int v15 = (void *)v14;
        if (v14) {
          sub_2608CE9C4(v14);
        }
      }
      else
      {
        unsigned int v15 = 0;
      }
      free(v15);
    }

    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v10 userInfo:0];
    }
  }

  return v9 == 0;
}

- (BOOL)fixupPath:(id)a3 withMode:(unsigned __int16)a4 toUser:(unsigned int)a5 group:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  if (a7) {
    *a7 = 0;
  }
  id v13 = v12;
  if (lchmod((const char *)[v13 UTF8String], a4))
  {
    int v14 = *__error();
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    unsigned int v15 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v16 = sub_2608CE99C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        uint64_t v18 = _os_log_send_and_compose_impl();
        v19 = (void *)v18;
        if (v18) {
          sub_2608CE9C4(v18);
        }
      }
      else
      {
        v19 = 0;
      }
      free(v19);
    }

    if (a7)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v14 userInfo:0];
      BOOL v20 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = [(UMFilesystemProvider *)self chownPath:v13 toUser:v9 group:v8 error:a7];
  }

  return v20;
}

- (BOOL)makePath:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  id v7 = a3;
  if (a5) {
    *a5 = 0;
  }
  id v8 = v7;
  int v9 = mkpath_np((const char *)[v8 UTF8String], a4);
  if (v9)
  {
    if (qword_26B3F3E78 != -1) {
      dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
    }
    int v10 = (id)qword_26B3F3E68;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v11 = sub_2608CE99C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        uint64_t v13 = _os_log_send_and_compose_impl();
        int v14 = (void *)v13;
        if (v13) {
          sub_2608CE9C4(v13);
        }
      }
      else
      {
        int v14 = 0;
      }
      free(v14);
    }

    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v9 userInfo:0];
    }
  }

  return v9 == 0;
}

- (BOOL)clonePath:(id)a3 toPath:(id)a4 error:(id *)a5 handler:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (a5) {
    *a5 = 0;
  }
  id v11 = a6;
  unsigned int v12 = copyfile_state_alloc();
  copyfile_state_set(v12, 7u, v11);

  copyfile_state_set(v12, 6u, sub_2608CDB58);
  id v13 = v9;
  int v14 = (const char *)[v13 UTF8String];
  id v15 = v10;
  int v16 = copyfile(v14, (const char *)[v15 UTF8String], v12, 0xC800Fu);
  copyfile_state_free(v12);
  if (v16)
  {
    int v17 = *__error();
    if (v17)
    {
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      uint64_t v18 = (id)qword_26B3F3E68;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        unsigned int v19 = sub_2608CE99C();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          unsigned int v20 = v19;
        }
        else {
          unsigned int v20 = v19 & 0xFFFFFFFE;
        }
        if (v20)
        {
          int v34 = 138543874;
          id v35 = v13;
          __int16 v36 = 2114;
          id v37 = v15;
          __int16 v38 = 1024;
          int v39 = v17;
          LODWORD(v33) = 28;
          unsigned int v32 = &v34;
          uint64_t v21 = _os_log_send_and_compose_impl();
          unsigned int v22 = (void *)v21;
          if (v21) {
            sub_2608CE9C4(v21);
          }
        }
        else
        {
          unsigned int v22 = 0;
        }
        free(v22);
      }

      if (a5)
      {
        uint64_t v28 = v17;
        unsigned int v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v30 = *MEMORY[0x263F08438];
LABEL_31:
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, v28, 0, v32, v33);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (qword_26B3F3E78 != -1) {
        dispatch_once(&qword_26B3F3E78, &unk_270CA9FE8);
      }
      unsigned int v23 = (id)qword_26B3F3E68;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v24 = sub_2608CE99C();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v25 = v24;
        }
        else {
          unsigned int v25 = v24 & 0xFFFFFFFE;
        }
        if (v25)
        {
          int v34 = 138543618;
          id v35 = v13;
          __int16 v36 = 2114;
          id v37 = v15;
          LODWORD(v33) = 22;
          unsigned int v32 = &v34;
          uint64_t v26 = _os_log_send_and_compose_impl();
          v27 = (void *)v26;
          if (v26) {
            sub_2608CE9C4(v26);
          }
        }
        else
        {
          v27 = 0;
        }
        free(v27);
      }

      if (a5)
      {
        unsigned int v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v30 = *MEMORY[0x263F08438];
        uint64_t v28 = 89;
        goto LABEL_31;
      }
    }
  }

  return v16 == 0;
}

@end