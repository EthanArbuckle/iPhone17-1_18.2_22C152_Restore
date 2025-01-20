void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t dscsym_iterate_buffer(uint64_t a1, uint64_t a2, unsigned __int8 *a3, void *a4, void *a5, void *a6)
{
  id v11 = a6;
  if (a4) {
    *a4 = -1;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a3) {
    uuid_clear(a3);
  }
  if (a1 && a2)
  {
    v12 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:a1 length:a2 freeWhenDone:0];
    id v24 = 0;
    v13 = [MEMORY[0x263F08AC0] propertyListWithData:v12 options:0 format:0 error:&v24];
    id v14 = v24;
    if (!isValidDict(v13))
    {
      int v21 = *__error();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        dscsym_iterate_buffer_cold_3(v14);
      }
      *__error() = v21;
      uint64_t v19 = 9;
      goto LABEL_26;
    }
    if (a3)
    {
      v15 = [v13 objectForKeyedSubscript:@"Cache_UUID_String"];
      if ((isValidString(v15) & 1) == 0)
      {
        int v22 = *__error();
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          dscsym_iterate_buffer_cold_2();
        }
        *__error() = v22;

        uint64_t v19 = 22;
        goto LABEL_26;
      }
      v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v15];
      [v16 getUUIDBytes:a3];
    }
    if (a4)
    {
      v17 = [v13 objectForKeyedSubscript:@"Unslid_Base_Address"];

      if (v17)
      {
        v18 = [v13 objectForKeyedSubscript:@"Unslid_Base_Address"];
        *a4 = [v18 longLongValue];
      }
    }
    uint64_t v19 = _dscsym_dict_iterate(v13, v11);
LABEL_26:

    goto LABEL_27;
  }
  int v20 = *__error();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    dscsym_iterate_buffer_cold_1();
  }
  *__error() = v20;
  uint64_t v19 = 22;
LABEL_27:

  return v19;
}

BOOL isValidDict(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v1 count] != 0;

  return v2;
}

uint64_t isValidString(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v2 = [v1 isEqualToString:&stru_26BE10058] ^ 1;
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t _dscsym_dict_iterate(void *a1, void *a2)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  v68 = a2;
  v3 = [a1 objectForKeyedSubscript:@"Binaries"];
  if (isValidArray(v3))
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v58 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v75 objects:v89 count:16];
    if (!v5)
    {
      int v29 = 0;
      goto LABEL_80;
    }
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v76;
    unint64_t v9 = 0x263F08000uLL;
    *(void *)&long long v6 = 68157954;
    long long v57 = v6;
    uint64_t v59 = *(void *)v76;
    id v60 = v4;
    while (1)
    {
      uint64_t v10 = 0;
      uint64_t v61 = v7;
      do
      {
        if (*(void *)v76 != v8) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v75 + 1) + 8 * v10);
        if (!isValidDict(v11))
        {
          int v54 = *__error();
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            _dscsym_dict_iterate_cold_3();
          }
          *__error() = v54;
          goto LABEL_79;
        }
        v88[0] = 0;
        v88[1] = 0;
        v12 = [v11 objectForKeyedSubscript:@"UUID_String"];
        if ((isValidString(v12) & 1) == 0)
        {
          int v55 = *__error();
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            _dscsym_dict_iterate_cold_2();
          }
          goto LABEL_78;
        }
        v13 = (void *)[objc_alloc(*(Class *)(v9 + 3128)) initWithUUIDString:v12];
        if (!v13)
        {
          int v55 = *__error();
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            _dscsym_dict_iterate_cold_1();
          }
LABEL_78:
          *__error() = v55;

LABEL_79:
          int v29 = 1;
          goto LABEL_80;
        }
        v64 = v13;
        [v13 getUUIDBytes:v88];
        id v14 = [v11 objectForKeyedSubscript:@"Path"];
        v65 = v14;
        if (isValidString(v14))
        {
          uint64_t v69 = [v14 UTF8String];
        }
        else
        {
          int v15 = *__error();
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 68158210;
            int v80 = 16;
            __int16 v81 = 2096;
            v82 = v88;
            __int16 v83 = 2112;
            v84 = v65;
            _os_log_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "binary %{uuid_t}.16P has no path %@", buf, 0x1Cu);
          }
          uint64_t v69 = 0;
          *__error() = v15;
        }
        v16 = [v11 objectForKeyedSubscript:@"Segments" v57];
        v17 = v16;
        uint64_t v63 = v10;
        if (v16 && !isValidArray(v16))
        {
          v18 = v17;
          int v19 = *__error();
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68158210;
            int v80 = 16;
            __int16 v81 = 2096;
            v82 = v88;
            __int16 v83 = 2048;
            v84 = v18;
            _os_log_error_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "binary %{uuid_t}.16P segments_array invalid %p", buf, 0x1Cu);
          }
          *__error() = v19;

          v17 = 0;
        }
        int v20 = [v11 objectForKeyedSubscript:@"Load_Address"];
        int valid = isValidNumber(v20);
        v70 = v20;
        v67 = v17;
        if (valid)
        {
          int v22 = v20;
          v23 = v12;
          uint64_t v24 = [v22 unsignedLongLongValue];
          v25 = [v11 objectForKeyedSubscript:@"Text_Segment_Size"];
          if (isValidNumber(v25))
          {
            uint64_t v26 = [v25 unsignedLongLongValue];
          }
          else
          {
            int v30 = *__error();
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 68158210;
              int v80 = 16;
              __int16 v81 = 2096;
              v82 = v88;
              __int16 v83 = 2112;
              v84 = v25;
              _os_log_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "binary %{uuid_t}.16P has no text size %@", buf, 0x1Cu);
            }
            v31 = __error();
            uint64_t v26 = 0;
            int *v31 = v30;
          }
          int v32 = v68[2](v68, v88, v69, "__TEXT", v24, v26);

          v12 = v23;
          int v20 = v70;
          if (v32)
          {
            int v28 = 0;
            int v29 = 2;
            goto LABEL_62;
          }
        }
        else if (!v17)
        {
          int v27 = *__error();
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68158210;
            int v80 = 16;
            __int16 v81 = 2096;
            v82 = v88;
            __int16 v83 = 2112;
            v84 = v20;
            _os_log_error_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "binary %{uuid_t}.16P has no load address %@", buf, 0x1Cu);
          }
          int v28 = 0;
          *__error() = v27;
          int v29 = 1;
          goto LABEL_62;
        }
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id obj = v67;
        uint64_t v33 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
        if (!v33) {
          goto LABEL_46;
        }
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v72;
        v62 = v12;
        while (2)
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v72 != v35) {
              objc_enumerationMutation(obj);
            }
            v37 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            if (!isValidDict(v37))
            {
              int v47 = *__error();
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 68158210;
                int v80 = 16;
                __int16 v81 = 2096;
                v82 = v88;
                __int16 v83 = 2048;
                v84 = v37;
                _os_log_error_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "binary %{uuid_t}.16P segment dict invalid %p", buf, 0x1Cu);
              }
              *__error() = v47;
              goto LABEL_57;
            }
            v38 = [v37 objectForKeyedSubscript:@"Name"];
            if ((isValidString(v38) & 1) == 0)
            {
              int v48 = *__error();
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v57;
                int v80 = 16;
                __int16 v81 = 2096;
                v82 = v88;
                _os_log_error_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "binary %{uuid_t}.16P segment has no name", buf, 0x12u);
              }
              *__error() = v48;
              goto LABEL_56;
            }
            if (!valid || ([v38 isEqualToString:@"__TEXT"] & 1) == 0)
            {
              v39 = [v37 objectForKeyedSubscript:@"Load_Address"];
              if ((isValidNumber(v39) & 1) == 0)
              {
                int v49 = *__error();
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 68158466;
                  int v80 = 16;
                  __int16 v81 = 2096;
                  v82 = v88;
                  __int16 v83 = 2112;
                  v84 = v38;
                  __int16 v85 = 2112;
                  v86 = v39;
                  _os_log_error_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "binary %{uuid_t}.16P segment %@ has no load address %@", buf, 0x26u);
                }
                *__error() = v49;

LABEL_56:
LABEL_57:
                id v4 = v60;
                uint64_t v7 = v61;
                uint64_t v8 = v59;
                unint64_t v9 = 0x263F08000;
                v12 = v62;
                uint64_t v50 = v63;

                int v28 = 0;
                int v29 = 1;
                goto LABEL_63;
              }
              uint64_t v40 = [v39 unsignedLongLongValue];
              v41 = [v37 objectForKeyedSubscript:@"Size"];
              if ((isValidNumber(v39) & 1) == 0)
              {
                int v51 = *__error();
                uint64_t v7 = v61;
                unint64_t v9 = 0x263F08000;
                uint64_t v50 = v63;
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 68158466;
                  int v80 = 16;
                  __int16 v81 = 2096;
                  v82 = v88;
                  __int16 v83 = 2112;
                  v84 = v38;
                  __int16 v85 = 2112;
                  v86 = v41;
                  _os_log_error_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "binary %{uuid_t}.16P segment %@ has no size %@", buf, 0x26u);
                }
                *__error() = v51;

                int v28 = 0;
                int v29 = 1;
                uint64_t v8 = v59;
                id v4 = v60;
                v12 = v62;
                goto LABEL_63;
              }
              uint64_t v42 = [v41 unsignedLongLongValue];
              id v43 = v38;
              uint64_t v44 = [v43 UTF8String];
              uint64_t v45 = v42;
              int v20 = v70;
              int v46 = v68[2](v68, v88, v69, (const char *)v44, v40, v45);

              if (v46)
              {

                int v29 = 0;
                int v28 = 1;
                id v4 = v60;
                uint64_t v7 = v61;
                uint64_t v8 = v59;
                unint64_t v9 = 0x263F08000;
                v12 = v62;
                goto LABEL_62;
              }
            }
          }
          uint64_t v34 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
          id v4 = v60;
          uint64_t v7 = v61;
          uint64_t v8 = v59;
          v12 = v62;
          if (v34) {
            continue;
          }
          break;
        }
LABEL_46:

        int v29 = 0;
        int v28 = 1;
        unint64_t v9 = 0x263F08000;
LABEL_62:
        uint64_t v50 = v63;
LABEL_63:

        if (!v28)
        {
LABEL_80:

          uint64_t v53 = (v29 << 31 >> 31) & 0x16;
          v3 = v58;
          goto LABEL_81;
        }
        uint64_t v10 = v50 + 1;
      }
      while (v10 != v7);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v75 objects:v89 count:16];
      int v29 = 0;
      if (!v7) {
        goto LABEL_80;
      }
    }
  }
  int v52 = *__error();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    _dscsym_dict_iterate_cold_4();
  }
  *__error() = v52;
  uint64_t v53 = 22;
LABEL_81:

  return v53;
}

uint64_t dscsym_iterate(const char *a1, unsigned __int8 *a2, void *a3, void *a4, void *a5)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v9 = a5;
  if (a3) {
    *a3 = -1;
  }
  if (a4) {
    *a4 = 0;
  }
  int is_null = uuid_is_null(a2);
  if (!v9 || is_null)
  {
    int v15 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
      dscsym_iterate_cold_1((uint64_t)a2, (uint64_t)v9);
    }
    *__error() = v15;
    uint64_t v14 = 22;
  }
  else
  {
    if (a1) {
      goto LABEL_15;
    }
    id v11 = v9;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = a3;
    if (a3) {
      *a3 = -1;
    }
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&long long v40 = 3221225472;
    *((void *)&v40 + 1) = ___dscsym_iterate_live_shared_cache_with_uuid_block_invoke;
    v41 = &unk_263FCF408;
    id v43 = v38;
    id v12 = v11;
    id v42 = v12;
    char v13 = _dscsym_dyld_shared_cache_with_uuid((uint64_t)a2, buf);

    _Block_object_dispose(v38, 8);
    if ((v13 & 1) == 0)
    {
LABEL_15:
      v16 = _dscsym_copy_dscsym_path_for_uuid(a1, a2);
      uint64_t v17 = access(v16, 4);
      if (v17)
      {
        uint64_t v14 = *__error();
        free(v16);
        int v21 = *__error();
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          *(_DWORD *)&uint8_t buf[4] = 16;
          LOWORD(v40) = 2096;
          *(void *)((char *)&v40 + 2) = a2;
          WORD5(v40) = 1024;
          HIDWORD(v40) = v14;
          _os_log_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "unable to read dscsym %{uuid_t}.16P: %{errno}d", buf, 0x18u);
        }
        *__error() = v21;
      }
      else
      {
        int v22 = (void *)MEMORY[0x210510FA0](v17, v18, v19, v20);
        v23 = [NSString stringWithUTF8String:v16];
        if (v23)
        {
          free(v16);
          uint64_t v24 = [NSDictionary dictionaryWithContentsOfFile:v23];
          v25 = v24;
          if (v24)
          {
            uint64_t v26 = [v24 objectForKeyedSubscript:@"Cache_UUID_String"];
            if (isValidString(v26))
            {
              int v27 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v26];
              uint64_t v28 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a2];
              int v29 = (void *)v28;
              if (v27 && v28 && ([v27 isEqual:v28] & 1) != 0)
              {
                if (a3)
                {
                  int v30 = [v25 objectForKeyedSubscript:@"Unslid_Base_Address"];
                  BOOL v31 = v30 == 0;

                  if (!v31)
                  {
                    int v32 = [v25 objectForKeyedSubscript:@"Unslid_Base_Address"];
                    *a3 = [v32 longLongValue];
                  }
                }
                uint64_t v14 = _dscsym_dict_iterate(v25, v9);
              }
              else
              {
                int v36 = *__error();
                if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                  dscsym_iterate_cold_4();
                }
                *__error() = v36;
                uint64_t v14 = 22;
              }
            }
            else
            {
              int v35 = *__error();
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                dscsym_iterate_cold_5();
              }
              *__error() = v35;
              uint64_t v14 = 22;
            }
          }
          else
          {
            int v34 = *__error();
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              dscsym_iterate_cold_3();
            }
            *__error() = v34;
            uint64_t v14 = 22;
          }
        }
        else
        {
          int v33 = *__error();
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            dscsym_iterate_cold_2();
          }
          *__error() = v33;
          free(v16);
          uint64_t v14 = 22;
        }
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }

  return v14;
}

void sub_20A025964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

char *_dscsym_copy_dscsym_path_for_uuid(const char *a1, unsigned __int8 *uu)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = 0;
  memset(out, 0, 37);
  uuid_unparse(uu, out);
  if (a1) {
    asprintf(&v4, "%s/%s%s", a1, "DSCSYM-", out);
  }
  else {
    asprintf(&v4, "%s/%s%s", "/private/var/db/dscsym", "DSCSYM-", out);
  }
  result = v4;
  if (!v4) {
    _dscsym_copy_dscsym_path_for_uuid_cold_1();
  }
  return result;
}

uint64_t dscsym_copy_dscsym_files(const char *a1, uint64_t a2)
{
  id v4 = (char *)_dscsym_directory_copy(a1, 1);
  dscsym_save_dscsyms_for_current_caches(a1);
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __dscsym_copy_dscsym_files_block_invoke;
  v7[3] = &unk_263FCF288;
  v7[4] = &v8;
  v7[5] = a2;
  _dscsym_foreach_dscsym_file(v4, v7);
  if (v4 != "/private/var/db/dscsym") {
    free(v4);
  }
  uint64_t v5 = *((unsigned int *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_20A025B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const char *_dscsym_directory_copy(const char *a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  if (!a1 || !strcmp(a1, "/"))
  {
    result = "/private/var/db/dscsym";
    uint64_t v10 = "/private/var/db/dscsym";
    if (!a2) {
      return result;
    }
LABEL_7:
    memset(&v9, 0, sizeof(v9));
    if (stat(result, &v9))
    {
      uid_t v5 = geteuid();
      int v6 = *__error();
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          id v12 = v10;
          _os_log_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "dscsym unable to create directory %s: not root", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = v10;
          int v8 = *__error();
          *(_DWORD *)buf = 136315394;
          id v12 = v7;
          __int16 v13 = 1024;
          int v14 = v8;
          _os_log_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "creating dscsym directory %s (stat said: %{errno}d)", buf, 0x12u);
        }
        *__error() = v6;
        if (!mkdir(v10, 0x1EDu)) {
          return v10;
        }
        int v6 = *__error();
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          _dscsym_directory_copy_cold_1();
        }
      }
      *__error() = v6;
    }
    return v10;
  }
  asprintf(&v10, "%s%s", a1, "/private/var/db/dscsym");
  result = v10;
  if (!v10) {
    _dscsym_copy_dscsym_path_for_uuid_cold_1();
  }
  if (a2) {
    goto LABEL_7;
  }
  return result;
}

uint64_t dscsym_save_dscsyms_for_current_caches(const char *a1)
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  id v1 = (char *)_dscsym_directory_copy(a1, 1);
  dyld_for_each_installed_shared_cache_with_system_path();
  uint64_t v2 = v11[3];
  int v3 = *((_DWORD *)v7 + 6);
  time_t v4 = time(0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = ___dscsym_remove_obsolete_caches_block_invoke;
  v14[3] = &__block_descriptor_52_e9_i16__0r_8l;
  int v15 = v3;
  v14[4] = v2;
  v14[5] = v4 - 1209600;
  _dscsym_foreach_dscsym_file(v1, v14);
  free((void *)v11[3]);
  if (v1 != "/private/var/db/dscsym") {
    free(v1);
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return 0;
}

void sub_20A025EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void _dscsym_foreach_dscsym_file(const char *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v3 = a2;
  time_t v4 = opendir(a1);
  uid_t v5 = __error();
  if (v4)
  {
    *uid_t v5 = 0;
    uint64_t v6 = readdir(v4);
    if (v6)
    {
      uint64_t v7 = MEMORY[0x263EF8438];
      do
      {
        d_name = v6->d_name;
        if (!strncmp(v6->d_name, "DSCSYM-", 7uLL))
        {
          snprintf(__str, 0x400uLL, "%s/%s", a1, d_name);
          if (v3[2](v3, __str)) {
            goto LABEL_14;
          }
          int v9 = 0;
        }
        else
        {
          int v9 = *__error();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            _dscsym_foreach_dscsym_file_cold_3(buf, (uint64_t)d_name, &v13);
          }
        }
        *__error() = v9;
        uint64_t v6 = readdir(v4);
      }
      while (v6);
    }
    if (*__error())
    {
      int v10 = *__error();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        _dscsym_foreach_dscsym_file_cold_2();
      }
      *__error() = v10;
    }
LABEL_14:
    closedir(v4);
  }
  else
  {
    int v11 = *v5;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _dscsym_foreach_dscsym_file_cold_1();
    }
    *__error() = v11;
  }
}

uint64_t __dscsym_copy_dscsym_files_block_invoke(uint64_t a1, char *__s1)
{
  time_t v4 = strdup(__s1);
  uid_t v5 = basename(v4);
  to = 0;
  int v6 = asprintf(&to, "%s/%s", *(const char **)(a1 + 40), v5);
  free(v4);
  if (v6 == -1)
  {
    int v9 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __dscsym_copy_dscsym_files_block_invoke_cold_1();
    }
    *__error() = v9;
    uint64_t result = 12;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 12;
  }
  else
  {
    if (copyfile(__s1, to, 0, 0x100000Au))
    {
      int v7 = *__error();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __dscsym_copy_dscsym_files_block_invoke_cold_2();
      }
      *__error() = v7;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *__error();
    }
    free(to);
    return 0;
  }
  return result;
}

uint64_t dscsym_mmap_dscsym_for_uuid(const char *a1, unsigned __int8 *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  off_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  *a3 = 0;
  *a4 = 0;
  uint64_t v8 = (void *)MEMORY[0x210510FA0]();
  int v9 = (char *)_dscsym_directory_copy(a1, a1 == 0);
  int v10 = _dscsym_copy_dscsym_path_for_uuid(v9, a2);
  if (v9 != "/private/var/db/dscsym") {
    free(v9);
  }
  int v11 = _dscsym_mmap_file(v10, &v24, &v23);
  uint64_t v12 = v20;
  *((_DWORD *)v20 + 6) = v11;
  if (!v11)
  {
    *a3 = v24;
    *a4 = v23;
    int v15 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68158210;
      int v26 = 16;
      __int16 v27 = 2096;
      uint64_t v28 = a2;
      __int16 v29 = 2080;
      int v30 = v10;
      _os_log_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "dscsym %{uuid_t}.16P mapped from file %s", buf, 0x1Cu);
    }
    v16 = __error();
    goto LABEL_13;
  }
  uint64_t v13 = 2;
  if (!a1)
  {
    *((_DWORD *)v12 + 6) = 2;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __dscsym_mmap_dscsym_for_uuid_block_invoke;
    v18[3] = &unk_263FCF2B0;
    v18[4] = &v19;
    v18[5] = v10;
    _dscsym_dyld_shared_cache_with_uuid((uint64_t)a2, v18);
    if (!*((_DWORD *)v20 + 6))
    {
      int v14 = _dscsym_mmap_file(v10, &v24, &v23);
      *((_DWORD *)v20 + 6) = v14;
      if (!v14)
      {
        *a3 = v24;
        *a4 = v23;
        int v15 = *__error();
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68158210;
          int v26 = 16;
          __int16 v27 = 2096;
          uint64_t v28 = a2;
          __int16 v29 = 2080;
          int v30 = v10;
          _os_log_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "dscsym %{uuid_t}.16P mapped from file %s", buf, 0x1Cu);
        }
        v16 = __error();
LABEL_13:
        uint64_t v13 = 0;
        int *v16 = v15;
      }
    }
  }
  free(v10);
  _Block_object_dispose(&v19, 8);
  return v13;
}

void sub_20A026468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _dscsym_mmap_file(const char *a1, void *a2, off_t *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v6 = open(a1, 0);
  if (v6 == -1)
  {
    int v8 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      int v9 = *__error();
      v14.st_dev = 136315394;
      *(void *)&v14.st_mode = a1;
      WORD2(v14.st_ino) = 1024;
      *(_DWORD *)((char *)&v14.st_ino + 6) = v9;
      _os_log_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "dscsym unable to open %s: %{errno}d", (uint8_t *)&v14, 0x12u);
    }
    goto LABEL_7;
  }
  int v7 = v6;
  memset(&v14, 0, sizeof(v14));
  if (fstat(v6, &v14))
  {
    int v8 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _dscsym_mmap_file_cold_3();
    }
LABEL_7:
    *__error() = v8;
    return *__error();
  }
  if (v14.st_size < 0x7FFFFFFFFFFFFFFFuLL)
  {
    uint64_t v12 = mmap(0, v14.st_size, 1, 1, v7, 0);
    if (v12 == (void *)-1)
    {
      int v8 = *__error();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        _dscsym_mmap_file_cold_2();
      }
      goto LABEL_7;
    }
    uint64_t v13 = v12;
    close(v7);
    uint64_t result = 0;
    *a2 = v13;
    *a3 = v14.st_size;
  }
  else
  {
    int v11 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _dscsym_mmap_file_cold_1();
    }
    *__error() = v11;
    return 27;
  }
  return result;
}

uint64_t _dscsym_dyld_shared_cache_with_uuid(uint64_t a1, void *a2)
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v4 = a2;
  dyld_for_each_installed_shared_cache_with_system_path();

  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_20A02675C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __dscsym_mmap_dscsym_for_uuid_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = _dscsym_create_dsc_file_for_shared_cache(a2, *(void *)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t _dscsym_create_dsc_file_for_shared_cache(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x210510FA0]();
  id v18 = 0;
  _dscsym_iterate_dyld_shared_cache(a1, (unint64_t)&v18, 0);
  id v5 = v18;
  int v6 = v5;
  if (v5)
  {
    id v7 = v5;
    char v8 = (void *)[[NSString alloc] initWithUTF8String:a2];
    if (v8)
    {
      int v9 = (void *)[objc_alloc(MEMORY[0x263EFF9E0]) initToFileAtPath:v8 append:0];
      int v10 = v9;
      if (v9)
      {
        [v9 open];
        id v19 = 0;
        uint64_t v11 = [MEMORY[0x263F08AC0] writePropertyList:v7 toStream:v10 format:200 options:0 error:&v19];
        id v12 = v19;
        [v10 close];
        int v13 = *__error();
        if (v11)
        {
          uint64_t v14 = 0;
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v21 = a2;
            __int16 v22 = 2048;
            uint64_t v23 = v11;
            _os_log_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Wrote out new dscsym for shared cache to %s (%{bytes}ld)", buf, 0x16u);
            uint64_t v14 = 0;
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            _dscsym_create_dsc_file_for_shared_cache_cold_3(a2, v12);
          }
          uint64_t v14 = 9;
        }
        *__error() = v13;
      }
      else
      {
        int v16 = *__error();
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          _dscsym_create_dsc_file_for_shared_cache_cold_2();
        }
        *__error() = v16;
        uint64_t v14 = 12;
      }
    }
    else
    {
      int v15 = *__error();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        _dscsym_create_dsc_file_for_shared_cache_cold_1();
      }
      *__error() = v15;
      uint64_t v14 = 12;
    }
  }
  else
  {
    uint64_t v14 = 2;
  }

  return v14;
}

uint64_t dscsym_generate_dscsym_file()
{
  uint64_t v2 = 0;
  int v3 = &v2;
  uint64_t v4 = 0x2020000000;
  int v5 = 2;
  dyld_shared_cache_for_file();
  uint64_t v0 = *((unsigned int *)v3 + 6);
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_20A026AB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __dscsym_generate_dscsym_file_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = _dscsym_generate_dscsym_file(a2, *(const char **)(a1 + 40), *(char ***)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t _dscsym_generate_dscsym_file(uint64_t a1, const char *a2, char **a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a3) {
    *a3 = 0;
  }
  *(void *)uu = 0;
  uint64_t v14 = 0;
  dyld_shared_cache_copy_uuid();
  int v6 = *__error();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
    _dscsym_generate_dscsym_file_cold_2();
  }
  *__error() = v6;
  id v7 = _dscsym_copy_dscsym_path_for_uuid(a2, uu);
  if (!v7) {
    return 12;
  }
  char v8 = v7;
  if (!access(v7, 0))
  {
    int v11 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      _dscsym_generate_dscsym_file_cold_1();
    }
    *__error() = v11;
    if (!a3)
    {
      free(v8);
      return 0;
    }
    uint64_t v10 = 0;
    goto LABEL_15;
  }
  uint64_t dsc_file_for_shared_cache = _dscsym_create_dsc_file_for_shared_cache(a1, (uint64_t)v8);
  uint64_t v10 = dsc_file_for_shared_cache;
  if (a3 && !dsc_file_for_shared_cache)
  {
LABEL_15:
    *a3 = v8;
    return v10;
  }
  free(v8);
  return v10;
}

uint64_t __dscsym_save_dscsyms_for_current_caches_block_invoke(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = malloc_type_realloc(*(void **)(*(void *)(a1[4] + 8) + 24), 16* (*(_DWORD *)(*(void *)(a1[5] + 8) + 24) + 1), 0x1000040451B5BE8uLL);
  if (!*(void *)(*(void *)(a1[4] + 8) + 24)) {
    _dscsym_copy_dscsym_path_for_uuid_cold_1();
  }
  ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  dyld_shared_cache_copy_uuid();
  uint64_t v4 = (const char *)a1[6];

  return _dscsym_generate_dscsym_file(a2, v4, 0);
}

uint64_t dscsym_buffer_iterate_binaries(uint64_t a1, uint64_t a2, unsigned __int8 *a3, void *a4)
{
  return dscsym_buffer_iterate(a1, a2, a3, 0, a4);
}

uint64_t dscsym_buffer_iterate(uint64_t a1, uint64_t a2, unsigned __int8 *a3, void *a4, void *a5)
{
  id v9 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __dscsym_buffer_iterate_block_invoke;
  v13[3] = &unk_263FCF328;
  id v14 = v9;
  id v10 = v9;
  uint64_t v11 = dscsym_iterate_buffer(a1, a2, a3, a4, 0, v13);

  return v11;
}

uint64_t __dscsym_buffer_iterate_block_invoke(uint64_t a1, int a2, int a3, char *__s1)
{
  if (strcmp(__s1, "__TEXT")) {
    return 0;
  }
  int v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v6();
}

uint64_t dscsym_iterate_binaries(const char *a1, unsigned __int8 *a2, void *a3)
{
  return dscsym_uuid_iterate(a1, a2, 0, a3);
}

uint64_t dscsym_uuid_iterate(const char *a1, unsigned __int8 *a2, void *a3, void *a4)
{
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __dscsym_uuid_iterate_block_invoke;
  v11[3] = &unk_263FCF328;
  id v12 = v7;
  id v8 = v7;
  uint64_t v9 = dscsym_iterate(a1, a2, a3, 0, v11);

  return v9;
}

uint64_t __dscsym_uuid_iterate_block_invoke(uint64_t a1, int a2, int a3, char *__s1)
{
  if (strcmp(__s1, "__TEXT")) {
    return 0;
  }
  int v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v6();
}

BOOL isValidArray(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v1 count] != 0;

  return v2;
}

uint64_t isValidNumber(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

void _dscsym_iterate_dyld_shared_cache(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v5 = a3;
  if (!(a2 | v5)) {
    _dscsym_copy_dscsym_path_for_uuid_cold_1();
  }
  int v6 = (void *)v5;
  if (a2)
  {
    id v7 = (id) [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
    *(void *)a2 = v7;
    uint64_t v13 = 0;
    id v14 = 0;
    dyld_shared_cache_copy_uuid();
    id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v13];
    uint64_t v9 = [v8 UUIDString];
    [v7 setObject:v9 forKeyedSubscript:@"Cache_UUID_String"];

    id v10 = [NSNumber numberWithUnsignedLongLong:MEMORY[0x210510F00](a1)];
    [v7 setObject:v10 forKeyedSubscript:@"Unslid_Base_Address"];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v11 = v7;
  id v12 = v6;
  dyld_shared_cache_for_each_image();

  _Block_object_dispose(&v13, 8);
}

void sub_20A027284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___dscsym_iterate_dyld_shared_cache_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32) || !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(void *)uu = 0;
    uint64_t v22 = 0;
    if (dyld_image_copy_uuid())
    {
      if (!uuid_is_null(uu))
      {
        uint64_t v4 = MEMORY[0x210510EC0](a2);
        if (*(void *)(a1 + 32))
        {
          unint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
          int v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:uu];
          id v7 = [v6 UUIDString];
          [v5 setObject:v7 forKeyedSubscript:@"UUID_String"];

          if (v4)
          {
            id v8 = [NSString stringWithUTF8String:v4];
            [v5 setObject:v8 forKeyedSubscript:@"Path"];
          }
          id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v5 setObject:v9 forKeyedSubscript:@"Segments"];
          id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Binaries"];
          if (!v10)
          {
            id v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2300];
            [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"Binaries"];
          }
          [v10 addObject:v5];
        }
        else
        {
          unint64_t v5 = 0;
          id v9 = 0;
        }
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = ___dscsym_iterate_dyld_shared_cache_block_invoke_2;
        v15[3] = &unk_263FCF350;
        id v16 = v5;
        id v17 = v9;
        long long v14 = *(_OWORD *)(a1 + 40);
        id v11 = (id)v14;
        long long v18 = v14;
        id v19 = uu;
        uint64_t v20 = v4;
        id v12 = v9;
        id v13 = v5;
        MEMORY[0x210510EB0](a2, v15);
      }
    }
  }
}

void ___dscsym_iterate_dyld_shared_cache_block_invoke_2(uint64_t a1, char *__s2, uint64_t a3, uint64_t a4)
{
  if (__s2)
  {
    if (*(void *)(a1 + 32))
    {
      if (!strcmp("__TEXT", __s2))
      {
        id v12 = [NSNumber numberWithUnsignedLongLong:a3];
        [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:@"Load_Address"];

        id v11 = [NSNumber numberWithUnsignedLongLong:a4];
        [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:@"Text_Segment_Size"];
      }
      else
      {
        id v8 = *(void **)(a1 + 40);
        id v9 = objc_alloc(NSDictionary);
        if (CachedNSStringForCString_onceToken != -1) {
          dispatch_once(&CachedNSStringForCString_onceToken, &__block_literal_global);
        }
        id v10 = (void *)[[NSString alloc] initWithUTF8String:__s2];
        if (v10)
        {
          id v11 = [(id)CachedNSStringForCString_cachedStrings member:v10];
          if (!v11)
          {
            id v11 = v10;
            [(id)CachedNSStringForCString_cachedStrings addObject:v11];
          }
        }
        else
        {
          id v11 = 0;
        }

        id v13 = [NSNumber numberWithUnsignedLongLong:a3];
        long long v14 = [NSNumber numberWithUnsignedLongLong:a4];
        uint64_t v15 = [v9 initWithObjectsAndKeys:v11, @"Name", v13, @"Load_Address", v14, @"Size", 0];
        [v8 addObject:v15];
      }
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      if (v16)
      {
        if ((*(unsigned int (**)(uint64_t, void, void, char *, uint64_t, uint64_t))(v16 + 16))(v16, *(void *)(a1 + 64), *(void *)(a1 + 72), __s2, a3, a4))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
      }
    }
  }
}

uint64_t __CachedNSStringForCString_block_invoke()
{
  CachedNSStringForCString_cachedStrings = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:8];

  return MEMORY[0x270F9A758]();
}

uint64_t ___dscsym_remove_obsolete_caches_block_invoke(uint64_t a1, char *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  memset(&v12, 0, sizeof(v12));
  if (stat(a2, &v12))
  {
    int v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ___dscsym_remove_obsolete_caches_block_invoke_cold_4();
    }
    *__error() = v4;
    return 0;
  }
  __darwin_time_t tv_sec = v12.st_birthtimespec.tv_sec;
  if (*(_DWORD *)(a1 + 48))
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      memset(out, 0, sizeof(out));
      uuid_unparse((const unsigned __int8 *)(*(void *)(a1 + 32) + v6), out);
      if (strstr(a2, out)) {
        break;
      }
      ++v7;
      v6 += 16;
      if (v7 >= *(unsigned int *)(a1 + 48)) {
        goto LABEL_9;
      }
    }
    int v10 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      ___dscsym_remove_obsolete_caches_block_invoke_cold_3();
    }
    goto LABEL_17;
  }
LABEL_9:
  if (tv_sec >= *(void *)(a1 + 40))
  {
    int v10 = *__error();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      ___dscsym_remove_obsolete_caches_block_invoke_cold_2();
    }
LABEL_17:
    *__error() = v10;
    return 0;
  }
  int v8 = unlink(a2);
  int v9 = *__error();
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ___dscsym_remove_obsolete_caches_block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uuid_string_t out = 136315394;
    *(void *)&out[4] = a2;
    *(_WORD *)&out[12] = 2048;
    *(void *)&out[14] = tv_sec;
    _os_log_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Unlinked old dscsym %s created at %{time_t}ld", (uint8_t *)out, 0x16u);
  }
  *__error() = v9;
  return 0;
}

uint64_t ___dscsym_dyld_shared_cache_with_uuid_block_invoke(uint64_t result)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    *(void *)uu2 = 0;
    uint64_t v3 = 0;
    dyld_shared_cache_copy_uuid();
    uint64_t result = uuid_compare(*(const unsigned __int8 **)(v1 + 48), uu2);
    if (!result)
    {
      *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
    }
  }
  return result;
}

void ___dscsym_iterate_live_shared_cache_with_uuid_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    **(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = MEMORY[0x210510F00](a2);
  }
  uint64_t v4 = *(void **)(a1 + 32);

  _dscsym_iterate_dyld_shared_cache(a2, 0, v4);
}

void dscsym_iterate_buffer_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9(&dword_20A023000, MEMORY[0x263EF8438], v0, "buffer %p length %ld", v1, v2, v3, v4, v5);
}

void dscsym_iterate_buffer_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20A023000, MEMORY[0x263EF8438], v0, "dscsym has no uuid %@", v1, v2, v3, v4, v5);
}

void dscsym_iterate_buffer_cold_3(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20A023000, MEMORY[0x263EF8438], v2, "dscsym deserialization failed: %@", v3, v4, v5, v6, v7);
}

void _dscsym_dict_iterate_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20A023000, MEMORY[0x263EF8438], v0, "binary unable to parse uuid %@", v1, v2, v3, v4, v5);
}

void _dscsym_dict_iterate_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20A023000, MEMORY[0x263EF8438], v0, "binary has no uuid %@", v1, v2, v3, v4, v5);
}

void _dscsym_dict_iterate_cold_3()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "binary_dict invalid", v0, 2u);
}

void _dscsym_dict_iterate_cold_4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20A023000, MEMORY[0x263EF8438], v0, "binaries_array invalid %p", v1, v2, v3, v4, v5);
}

void dscsym_iterate_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x2105110E0](a2);
  v4[0] = 68158210;
  v4[1] = 16;
  __int16 v5 = 2096;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  int v8 = v3;
  _os_log_fault_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "uuid %{uuid_t}.16P callback %p", (uint8_t *)v4, 0x1Cu);
}

void dscsym_iterate_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_20A023000, MEMORY[0x263EF8438], v0, "dscsym %{uuid_t}.16P unable to create NSString from path %s", v1, v2, v3, v4, v5);
}

void dscsym_iterate_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_20A023000, MEMORY[0x263EF8438], v0, "dscsym %{uuid_t}.16P file invalid", v1, v2, v3, v4, v5);
}

void dscsym_iterate_cold_4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20A023000, MEMORY[0x263EF8438], v0, "dscsym %{uuid_t}.16P uuid mismatch %@", v1, v2, v3, v4, v5);
}

void dscsym_iterate_cold_5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20A023000, MEMORY[0x263EF8438], v0, "dscsym %{uuid_t}.16P uuid invalid %@", v1, v2, v3, v4, v5);
}

void _dscsym_copy_dscsym_path_for_uuid_cold_1()
{
}

void _dscsym_directory_copy_cold_1()
{
  __error();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_20A023000, MEMORY[0x263EF8438], v0, "dscsym unable to create directory %s: %{errno}d", v1, v2, v3, v4, v5);
}

void _dscsym_foreach_dscsym_file_cold_1()
{
  __error();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_20A023000, MEMORY[0x263EF8438], v0, "Unable to open dscsym directory %s: %{errno}d", v1, v2, v3, v4, v5);
}

void _dscsym_foreach_dscsym_file_cold_2()
{
  __error();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_20A023000, MEMORY[0x263EF8438], v0, "Unable to read cache directory %s: %{errno}d", v1, v2, v3, v4, v5);
}

void _dscsym_foreach_dscsym_file_cold_3(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 136315138;
  *a3 = a2;
  _os_log_debug_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "File %s isn't a dscsym file", buf, 0xCu);
}

void __dscsym_copy_dscsym_files_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "dscsym unable to asprintf copy destination path: %{errno}d", (uint8_t *)v1, 8u);
}

void __dscsym_copy_dscsym_files_block_invoke_cold_2()
{
  __error();
  OUTLINED_FUNCTION_3(&dword_20A023000, MEMORY[0x263EF8438], v0, "Unable to copy dscsym file %s to %s: %{errno}d", v1, v2, v3, v4, 2u);
}

void _dscsym_mmap_file_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_20A023000, MEMORY[0x263EF8438], v0, "dscsym file too large %s: %{bytes}lld", v1, v2, v3, v4, v5);
}

void _dscsym_mmap_file_cold_2()
{
  __error();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_20A023000, MEMORY[0x263EF8438], v0, "dscsym unable to mmap %s: %{errno}d", v1, v2, v3, v4, v5);
}

void _dscsym_mmap_file_cold_3()
{
  __error();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_20A023000, MEMORY[0x263EF8438], v0, "dscsym unable to fstat %s: %{errno}d", v1, v2, v3, v4, v5);
}

void _dscsym_create_dsc_file_for_shared_cache_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20A023000, MEMORY[0x263EF8438], v0, "Unable to create string for dscsym path %s", v1, v2, v3, v4, v5);
}

void _dscsym_create_dsc_file_for_shared_cache_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_20A023000, MEMORY[0x263EF8438], v0, "Unable to create stream for dscsym path %s", v1, v2, v3, v4, v5);
}

void _dscsym_create_dsc_file_for_shared_cache_cold_3(uint64_t a1, void *a2)
{
  __int16 v7 = [a2 debugDescription];
  OUTLINED_FUNCTION_9(&dword_20A023000, MEMORY[0x263EF8438], v2, "Unable to save shared cache dscsym %s: %@", v3, v4, v5, v6, 2u);
}

void _dscsym_generate_dscsym_file_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "dscsym already exists for %{uuid_t}.16P: %s", v0, 0x1Cu);
}

void _dscsym_generate_dscsym_file_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "checking cache file %{uuid_t}.16P", v0, 0x12u);
}

void ___dscsym_remove_obsolete_caches_block_invoke_cold_1()
{
  __error();
  OUTLINED_FUNCTION_3(&dword_20A023000, MEMORY[0x263EF8438], v0, "Unable to unlink old dscsym %s created at %{time_t}ld: %{errno}d", v1, v2, v3, v4, 2u);
}

void ___dscsym_remove_obsolete_caches_block_invoke_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Not unlinking old dscsym %s created at %{time_t}ld", v0, 0x16u);
}

void ___dscsym_remove_obsolete_caches_block_invoke_cold_3()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_20A023000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Not unlinking live dscsym %s created at %{time_t}ld", v0, 0x16u);
}

void ___dscsym_remove_obsolete_caches_block_invoke_cold_4()
{
  __error();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_20A023000, MEMORY[0x263EF8438], v0, "Unable to stat dscsym file %s: %{errno}d", v1, v2, v3, v4, v5);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
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

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x270ED8740](a1);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x270ED9100](from, to, state, *(void *)&flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dyld_for_each_installed_shared_cache_with_system_path()
{
  return MEMORY[0x270ED9690]();
}

uint64_t dyld_image_copy_uuid()
{
  return MEMORY[0x270ED96B0]();
}

uint64_t dyld_image_for_each_segment_info()
{
  return MEMORY[0x270ED96B8]();
}

uint64_t dyld_image_get_installname()
{
  return MEMORY[0x270ED96C8]();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return MEMORY[0x270ED9720]();
}

uint64_t dyld_shared_cache_for_each_image()
{
  return MEMORY[0x270ED9730]();
}

uint64_t dyld_shared_cache_for_file()
{
  return MEMORY[0x270ED9738]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x270ED9740]();
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x270EDBA08](uu1, uu2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}