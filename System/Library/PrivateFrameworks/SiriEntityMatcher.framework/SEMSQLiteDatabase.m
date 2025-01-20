@interface SEMSQLiteDatabase
- (BOOL)beginTransactionWithError:(id *)a3;
- (BOOL)cleanup:(id *)a3;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)executeCommand:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)executeCommandString:(id)a3 error:(id *)a4;
- (BOOL)openWithError:(id *)a3;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (NSString)path;
- (SEMSQLiteDatabase)init;
- (SEMSQLiteDatabase)initWithPath:(id)a3 accessPermission:(int64_t)a4 threadingMode:(int64_t)a5 dataProtectionClass:(int)a6 databaseOptions:(int64_t)a7;
- (id)executeCommand:(id)a3 options:(unint64_t)a4;
- (int)dataProtectionClass;
- (int)rowsModified:(id *)a3;
- (int64_t)accessPermission;
- (int64_t)databaseOptions;
- (int64_t)threadingMode;
@end

@implementation SEMSQLiteDatabase

- (SEMSQLiteDatabase)initWithPath:(id)a3 accessPermission:(int64_t)a4 threadingMode:(int64_t)a5 dataProtectionClass:(int)a6 databaseOptions:(int64_t)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SEMSQLiteDatabase;
  v16 = [(SEMSQLiteDatabase *)&v31 init];
  if (!v16) {
    goto LABEL_4;
  }
  v17 = objc_msgSend_stringByStandardizingPath(v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_copy(v17, v18, v19, v20);
  path = v16->_path;
  v16->_path = (NSString *)v21;

  if (objc_msgSend_length(v16->_path, v23, v24, v25))
  {
    v16->_accessPermission = a4;
    v16->_threadingMode = a5;
    v16->_dataProtectionClass = a6;
    v16->_databaseOptions = a7;
    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cachedSQLiteStatements = v16->_cachedSQLiteStatements;
    v16->_cachedSQLiteStatements = v26;

LABEL_4:
    v28 = v16;
    goto LABEL_8;
  }
  v29 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SEMSQLiteDatabase initWithPath:accessPermission:threadingMode:dataProtectionClass:databaseOptions:]";
    _os_log_error_impl(&dword_25C7CA000, v29, OS_LOG_TYPE_ERROR, "%s Cannot create SEMSQLiteDatabase with nil path", buf, 0xCu);
  }
  v28 = 0;
LABEL_8:

  return v28;
}

- (SEMSQLiteDatabase)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use -initWithPath", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)openWithError:(id *)a3
{
  v127[1] = *MEMORY[0x263EF8340];
  p_handle = &self->_handle;
  if (!self->_handle)
  {
    uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"Failed to open database at path: %@", v3, self->_path);
    v13 = (void *)v9;
    if (!self->_path)
    {
      v26 = (void *)MEMORY[0x263F087E8];
      uint64_t v126 = *MEMORY[0x263F08320];
      v127[0] = v9;
      v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v127, (uint64_t)&v126, 1);
      v29 = objc_msgSend_errorWithDomain_code_userInfo_(v26, v28, 0x2709E0C50, 3, v27);
      sub_25C81F288(a3, v29);

LABEL_34:
      goto LABEL_35;
    }
    char v109 = 0;
    uint64_t v14 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v10, v11, v12);
    int isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v14, v15, (uint64_t)self->_path, (uint64_t)&v109);

    if (isDirectory)
    {
      if (v109)
      {
        uint64_t v20 = (void *)MEMORY[0x263F087E8];
        path = self->_path;
        uint64_t v22 = *MEMORY[0x263F08320];
        v124[0] = *MEMORY[0x263F08068];
        v124[1] = v22;
        v125[0] = path;
        v125[1] = v13;
        v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, (uint64_t)v125, (uint64_t)v124, 2);
        uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(v20, v24, 0x2709E0C50, 4, v23);
        sub_25C81F288(a3, v25);

LABEL_35:
        char v6 = 0;
LABEL_36:

        return v6;
      }
LABEL_15:
      unint64_t v47 = self->_accessPermission - 1;
      if (v47 > 2) {
        int v48 = 0;
      }
      else {
        int v48 = dword_25C839CB8[v47];
      }
      int64_t threadingMode = self->_threadingMode;
      if (threadingMode == 3) {
        int v50 = 0x10000;
      }
      else {
        int v50 = (threadingMode == 2) << 15;
      }
      int v51 = v50 | v48;
      int v52 = self->_dataProtectionClass - 1;
      if (v52 > 5) {
        int v53 = 0;
      }
      else {
        int v53 = dword_25C839CC4[v52];
      }
      int v54 = v51 | v53;
      v55 = (const char *)objc_msgSend_fileSystemRepresentation(self->_path, v17, v18, v19);
      int v56 = sqlite3_open_v2(v55, p_handle, v54, 0);
      if (v56)
      {
        int v59 = v56;
        uint64_t v60 = sqlite3_extended_errcode(self->_handle);
        v61 = (void *)MEMORY[0x263F087E8];
        uint64_t v62 = *MEMORY[0x263F08068];
        v119[0] = self->_path;
        uint64_t v63 = *MEMORY[0x263F08608];
        v118[0] = v62;
        v118[1] = v63;
        v64 = sub_25C81C710(v59, v60);
        v118[2] = *MEMORY[0x263F08320];
        v119[1] = v64;
        v119[2] = v13;
        v66 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v65, (uint64_t)v119, (uint64_t)v118, 3);
        v68 = objc_msgSend_errorWithDomain_code_userInfo_(v61, v67, 0x2709E0C50, 2, v66);
        sub_25C81F288(a3, v68);

        char v6 = 0;
        self->_handle = 0;
      }
      else
      {
        if ((self->_databaseOptions & 2) != 0)
        {
          uint64_t v69 = sqlite3_exec(*p_handle, "PRAGMA journal_mode=WAL", 0, 0, 0);
          if (v69)
          {
            uint64_t v70 = v69;
            uint64_t v71 = sqlite3_extended_errcode(*p_handle);
            v72 = (void *)qword_26B3549D8;
            if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
            {
              v99 = NSNumber;
              v100 = v72;
              v103 = objc_msgSend_numberWithInt_(v99, v101, v70, v102);
              v106 = objc_msgSend_numberWithInt_(NSNumber, v104, v71, v105);
              *(_DWORD *)buf = 136315650;
              v113 = "-[SEMSQLiteDatabase openWithError:]";
              __int16 v114 = 2112;
              v115 = v103;
              __int16 v116 = 2112;
              v117 = v106;
              _os_log_error_impl(&dword_25C7CA000, v100, OS_LOG_TYPE_ERROR, "%s Failed to enable WAL journal_mode with errorCode: %@, extendedCode: %@", buf, 0x20u);
            }
          }
        }
        v73 = objc_msgSend_fileURLWithPath_(NSURL, v57, (uint64_t)self->_path, v58);
        v76 = objc_msgSend_numberWithInt_(NSNumber, v74, self->_databaseOptions & 1, v75);
        uint64_t v77 = *MEMORY[0x263EFF6B0];
        id v107 = 0;
        char v6 = objc_msgSend_setResourceValue_forKey_error_(v73, v78, (uint64_t)v76, v77, &v107);
        id v79 = v107;

        if (v6)
        {
          objc_msgSend_removeAllObjects(self->_cachedSQLiteStatements, v80, v81, v82);
        }
        else
        {
          v91 = (void *)MEMORY[0x263F087E8];
          uint64_t v92 = *MEMORY[0x263F08068];
          v111[0] = self->_path;
          uint64_t v93 = *MEMORY[0x263F08608];
          v110[0] = v92;
          v110[1] = v93;
          v94 = sub_25C81C6B4(v79);
          v110[2] = *MEMORY[0x263F08320];
          v111[1] = v94;
          v111[2] = v13;
          v96 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v95, (uint64_t)v111, (uint64_t)v110, 3);
          v98 = objc_msgSend_errorWithDomain_code_userInfo_(v91, v97, 0x2709E0C50, 1, v96);
          sub_25C81F288(a3, v98);

          sqlite3_close_v2(self->_handle);
          self->_handle = 0;
        }
      }
      goto LABEL_36;
    }
    v27 = objc_msgSend_stringByDeletingLastPathComponent(self->_path, v17, v18, v19);
    v33 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v30, v31, v32);
    int v35 = objc_msgSend_fileExistsAtPath_isDirectory_(v33, v34, (uint64_t)v27, (uint64_t)&v109);

    if (v35)
    {
      if (!v109)
      {
        v39 = (void *)MEMORY[0x263F087E8];
        uint64_t v40 = *MEMORY[0x263F08320];
        v122[0] = *MEMORY[0x263F08068];
        v122[1] = v40;
        v123[0] = v27;
        v123[1] = v13;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v36, (uint64_t)v123, (uint64_t)v122, 2);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend_errorWithDomain_code_userInfo_(v39, v42, 0x2709E0C50, 5, v41);
        sub_25C81F288(a3, v43);
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      v44 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v36, v37, v38);
      id v108 = 0;
      char v46 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v44, v45, (uint64_t)v27, 1, 0, &v108);
      id v41 = v108;

      if ((v46 & 1) == 0)
      {
        v83 = (void *)MEMORY[0x263F087E8];
        uint64_t v84 = *MEMORY[0x263F08068];
        v121[0] = self->_path;
        uint64_t v85 = *MEMORY[0x263F08608];
        v120[0] = v84;
        v120[1] = v85;
        v43 = sub_25C81C6B4(v41);
        v120[2] = *MEMORY[0x263F08320];
        v121[1] = v43;
        v121[2] = v13;
        v87 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v86, (uint64_t)v121, (uint64_t)v120, 3);
        v89 = objc_msgSend_errorWithDomain_code_userInfo_(v83, v88, 0x2709E0C50, 1, v87);
        sub_25C81F288(a3, v89);

        goto LABEL_33;
      }
    }
    goto LABEL_15;
  }
  v5 = qword_26B3549D8;
  char v6 = 1;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v113 = "-[SEMSQLiteDatabase openWithError:]";
    _os_log_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_INFO, "%s Try to open a valid SQLite database handle, skipping open.", buf, 0xCu);
  }
  return v6;
}

- (BOOL)closeWithError:(id *)a3
{
  v23[3] = *MEMORY[0x263EF8340];
  if (!self->_handle) {
    return 1;
  }
  objc_msgSend_removeAllObjects(self->_cachedSQLiteStatements, a2, (uint64_t)a3, v3);
  int v6 = sqlite3_close_v2(self->_handle);
  BOOL v7 = v6 == 0;
  if (v6)
  {
    int v8 = v6;
    uint64_t v9 = sqlite3_extended_errcode(self->_handle);
    uint64_t v12 = objc_msgSend_stringWithFormat_(NSString, v10, @"Failed to close database at path: %@", v11, self->_path);
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08068];
    v23[0] = self->_path;
    uint64_t v15 = *MEMORY[0x263F08608];
    v22[0] = v14;
    v22[1] = v15;
    v16 = sub_25C81C710(v8, v9);
    v22[2] = *MEMORY[0x263F08320];
    v23[1] = v16;
    v23[2] = v12;
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, (uint64_t)v23, (uint64_t)v22, 3);
    uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(v13, v19, 0x2709E0C50, 2, v18);
    sub_25C81F288(a3, v20);
  }
  self->_handle = 0;
  return v7;
}

- (id)executeCommand:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v219 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = mach_absolute_time();
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  ppStmt = 0;
  if (!self->_handle)
  {
    objc_msgSend_stringWithFormat_(NSString, v8, @"Failed to execute command: %@", v10, v6);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = objc_alloc(MEMORY[0x263F087E8]);
    path = self->_path;
    uint64_t v31 = *MEMORY[0x263F08320];
    v210[0] = *MEMORY[0x263F08068];
    v210[1] = v31;
    v211[0] = path;
    v211[1] = v28;
    v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v32, (uint64_t)v211, (uint64_t)v210, 2);
    uint64_t v35 = objc_msgSend_initWithDomain_code_userInfo_(v29, v34, 0x2709E0C50, 6, v33);
LABEL_14:
    v42 = (void *)v35;

    v43 = v6;
    goto LABEL_15;
  }
  if (!v6)
  {
    objc_msgSend_stringWithFormat_(NSString, v8, @"Failed to execute command: %@", v10, 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    id v36 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v37 = self->_path;
    uint64_t v38 = *MEMORY[0x263F08320];
    v208[0] = *MEMORY[0x263F08068];
    v208[1] = v38;
    v209[0] = v37;
    v209[1] = v28;
    uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v39, (uint64_t)v209, (uint64_t)v208, 2);
    v42 = objc_msgSend_initWithDomain_code_userInfo_(v36, v41, 0x2709E0C50, 7, v40);

    v43 = 0;
LABEL_15:
    int v48 = sub_25C81D72C(v43, v7, v11, v42);
    goto LABEL_76;
  }
  uint64_t v12 = objc_msgSend_commandString(v6, v8, v9, v10);

  if (!v12)
  {
    objc_msgSend_stringWithFormat_(NSString, v13, @"Failed to execute command: %@", v15, v6);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    id v44 = objc_alloc(MEMORY[0x263F087E8]);
    v45 = self->_path;
    v206[0] = *MEMORY[0x263F08068];
    v206[1] = @"command";
    v207[0] = v45;
    v207[1] = v6;
    v206[2] = *MEMORY[0x263F08320];
    v207[2] = v28;
    v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v46, (uint64_t)v207, (uint64_t)v206, 3);
    uint64_t v35 = objc_msgSend_initWithDomain_code_userInfo_(v44, v47, 0x2709E0C50, 8, v33);
    goto LABEL_14;
  }
  char v194 = v4;
  if ((v4 & 2) != 0)
  {
    cachedSQLiteStatements = self->_cachedSQLiteStatements;
    v17 = objc_msgSend_commandString(v6, v13, v14, v15);
    uint64_t v20 = objc_msgSend_objectForKey_(cachedSQLiteStatements, v18, (uint64_t)v17, v19);

    if (v20)
    {
      uint64_t v24 = (sqlite3_stmt *)objc_msgSend_stmt(v20, v21, v22, v23);
      if (!v24 || (uint64_t v25 = v24, sqlite3_reset(v24)) || (v26 = sqlite3_clear_bindings(v25), v27 = v20, v26))
      {
        v27 = 0;
        uint64_t v25 = 0;
      }
      ppStmt = v25;
    }
    else
    {
      uint64_t v25 = 0;
      v27 = 0;
    }
    id v28 = v27;

    if (v25)
    {
      uint64_t v49 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    id v28 = 0;
  }
  handle = self->_handle;
  objc_msgSend_commandString(v6, v13, v14, v15);
  id v51 = objc_claimAutoreleasedReturnValue();
  v55 = (const char *)objc_msgSend_UTF8String(v51, v52, v53, v54);
  int v56 = sqlite3_prepare_v2(handle, v55, 0x80000000, &ppStmt, 0);

  if (v56)
  {
    uint64_t v59 = sqlite3_extended_errcode(self->_handle);
    if (ppStmt)
    {
      sqlite3_finalize(ppStmt);
      ppStmt = 0;
    }
    uint64_t v60 = objc_msgSend_stringWithFormat_(NSString, v57, @"Failed to execute command: %@", v58, v6);
    id v61 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v62 = self->_path;
    v204[0] = *MEMORY[0x263F08068];
    v204[1] = @"command";
    v205[0] = v62;
    v205[1] = v6;
    v204[2] = *MEMORY[0x263F08608];
    uint64_t v63 = sub_25C81C710(v56, v59);
    v204[3] = *MEMORY[0x263F08320];
    v205[2] = v63;
    v205[3] = v60;
    v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v64, (uint64_t)v205, (uint64_t)v204, 4);
    v42 = objc_msgSend_initWithDomain_code_userInfo_(v61, v66, 0x2709E0C50, 2, v65);

    int v48 = sub_25C81D72C(v6, v7, v11, v42);
    goto LABEL_75;
  }
  v67 = [SEMSQLiteCachedStatement alloc];
  uint64_t v49 = objc_msgSend_initWithStmt_(v67, v68, (uint64_t)ppStmt, v69);
LABEL_25:
  uint64_t v195 = v49;
  uint64_t v70 = objc_msgSend_parameters(v6, v13, v14, v15);
  uint64_t v74 = objc_msgSend_count(v70, v71, v72, v73);
  int v75 = sqlite3_bind_parameter_count(ppStmt);
  v196 = v70;
  if (v75 < 0 || v75 == v74)
  {
    v191 = self;
    uint64_t v192 = v7;
    id v193 = v28;
    if (v74)
    {
      uint64_t v84 = 0;
      while (2)
      {
        uint64_t v85 = objc_msgSend_objectAtIndex_(v70, v76, v84, v77);
        ++v84;
        v86 = ppStmt;
        id v87 = v85;
        switch(objc_msgSend_databaseValue_type(v87, v88, v89, v90))
        {
          case 0:
            objc_msgSend_description(v87, v91, v92, v93);
            id v94 = objc_claimAutoreleasedReturnValue();
            v98 = (const char *)objc_msgSend_UTF8String(v94, v95, v96, v97);
            int v99 = sqlite3_bind_text(v86, v84, v98, -1, 0);

            v100 = (void *)qword_26B3549D8;
            if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
            {
              v106 = NSNumber;
              id v107 = v100;
              v110 = objc_msgSend_numberWithInt_(v106, v108, v84, v109);
              v113 = objc_msgSend_numberWithInteger_(NSNumber, v111, 0, v112);
              *(_DWORD *)buf = 136315906;
              *(void *)&uint8_t buf[4] = "SEMSQLiteDatabaseBindParameterToSQLiteStatement";
              __int16 v213 = 2112;
              id v214 = v87;
              __int16 v215 = 2112;
              v216 = v110;
              __int16 v217 = 2112;
              v218 = v113;
              _os_log_error_impl(&dword_25C7CA000, v107, OS_LOG_TYPE_ERROR, "%s Bind parameter: %@ with unspecified type (sqlite_parameter_index: %@, valueType: %@)", buf, 0x2Au);
            }
            uint64_t v70 = v196;
            goto LABEL_41;
          case 1:
            *(void *)buf = 0;
            v101 = (const void *)objc_msgSend_databaseValue_blobRepresentationWithLength_(v87, v91, (uint64_t)buf, v93);
            int v102 = sqlite3_bind_blob64(v86, v84, v101, *(sqlite3_uint64 *)buf, 0);
            goto LABEL_40;
          case 2:
            objc_msgSend_databaseValue_doubleRepresentation(v87, v91, v92, v93);
            int v102 = sqlite3_bind_double(v86, v84, v103);
            goto LABEL_40;
          case 3:
            sqlite3_int64 v104 = objc_msgSend_databaseValue_integerRepresentation(v87, v91, v92, v93);
            int v102 = sqlite3_bind_int64(v86, v84, v104);
            goto LABEL_40;
          case 4:
            int v102 = sqlite3_bind_null(v86, v84);
            goto LABEL_40;
          case 5:
            uint64_t v105 = (const char *)objc_msgSend_databaseValue_textRepresentation(v87, v91, v92, v93);
            int v102 = sqlite3_bind_text(v86, v84, v105, -1, 0);
LABEL_40:
            int v99 = v102;
LABEL_41:

            if (!v99) {
              goto LABEL_42;
            }
            uint64_t v180 = sqlite3_extended_errcode(v191->_handle);
            v183 = objc_msgSend_stringWithFormat_(NSString, v181, @"Failed to execute command: %@", v182, v6);
            id v184 = objc_alloc(MEMORY[0x263F087E8]);
            v185 = v191->_path;
            v200[0] = *MEMORY[0x263F08068];
            v200[1] = @"command";
            v201[0] = v185;
            v201[1] = v6;
            v200[2] = *MEMORY[0x263F08608];
            v186 = sub_25C81C710(v99, v180);
            v200[3] = *MEMORY[0x263F08320];
            v201[2] = v186;
            v201[3] = v183;
            v188 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v187, (uint64_t)v201, (uint64_t)v200, 4);
            v42 = objc_msgSend_initWithDomain_code_userInfo_(v184, v189, 0x2709E0C50, 2, v188);

            int v48 = sub_25C81D72C(v6, v192, v11, v42);

            goto LABEL_72;
          default:

LABEL_42:
            if (v74 == v84) {
              break;
            }
            continue;
        }
        break;
      }
    }
    uint64_t v114 = sqlite3_column_count(ppStmt);
    unint64_t v115 = 0x263EFF000uLL;
    while (1)
    {
      int v116 = sqlite3_step(ppStmt);
      if (v116 != 100) {
        break;
      }
      v120 = *(void **)(v115 + 2432);
      if ((int)v114 < 1)
      {
        v124 = objc_msgSend_array(v120, v117, v118, v119);
      }
      else
      {
        id v121 = objc_alloc((Class)v120);
        v124 = objc_msgSend_initWithCapacity_(v121, v122, v114, v123);
        uint64_t v125 = 0;
        while (2)
        {
          uint64_t v126 = ppStmt;
          uint64_t v127 = sqlite3_column_type(ppStmt, v125);
          switch((int)v127)
          {
            case 1:
              sqlite3_int64 v131 = sqlite3_column_int64(v126, v125);
              uint64_t v134 = objc_msgSend_numberWithLongLong_(NSNumber, v132, v131, v133);
              goto LABEL_59;
            case 2:
              double v149 = sqlite3_column_double(v126, v125);
              uint64_t v134 = objc_msgSend_numberWithDouble_(NSNumber, v150, v151, v152, v149);
              goto LABEL_59;
            case 3:
              v153 = sqlite3_column_text(v126, v125);
              if (!v153) {
                goto LABEL_62;
              }
              uint64_t v154 = (uint64_t)v153;
              id v155 = [NSString alloc];
              uint64_t v134 = objc_msgSend_initWithUTF8String_(v155, v156, v154, v157);
              goto LABEL_59;
            case 4:
              v158 = sqlite3_column_blob(v126, v125);
              int v159 = sqlite3_column_bytes(v126, v125);
              if (v159 < 1)
              {
LABEL_62:
                v136 = 0;
              }
              else
              {
                uint64_t v134 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v160, (uint64_t)v158, v159);
LABEL_59:
                v136 = (void *)v134;
              }
LABEL_60:
              v161 = sub_25C81C6B4(v136);

              objc_msgSend_addObject_(v124, v162, (uint64_t)v161, v163);
              uint64_t v125 = (v125 + 1);
              if (v114 != v125) {
                continue;
              }
              unint64_t v115 = 0x263EFF000;
              break;
            case 5:
              uint64_t v134 = objc_msgSend_null(MEMORY[0x263EFF9D0], v128, v129, v130);
              goto LABEL_59;
            default:
              uint64_t v135 = v127;
              v136 = (void *)sqlite3_column_text(v126, v125);
              if (v136)
              {
                id v137 = [NSString alloc];
                v136 = objc_msgSend_initWithUTF8String_(v137, v138, (uint64_t)v136, v139);
              }
              v140 = (void *)qword_26B3549D8;
              if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
              {
                v141 = NSNumber;
                v142 = v140;
                v145 = objc_msgSend_numberWithInt_(v141, v143, v125, v144);
                v148 = objc_msgSend_numberWithInt_(NSNumber, v146, v135, v147);
                *(_DWORD *)buf = 136315906;
                *(void *)&uint8_t buf[4] = "SEMSQLiteDatabaseGetColumnValueFromSQLiteStatement";
                __int16 v213 = 2112;
                id v214 = v136;
                __int16 v215 = 2112;
                v216 = v145;
                __int16 v217 = 2112;
                v218 = v148;
                _os_log_error_impl(&dword_25C7CA000, v142, OS_LOG_TYPE_ERROR, "%s value: %@ with unknown column type (sqlite_column_index: %@, sqlite_column_type: %@)", buf, 0x2Au);
              }
              goto LABEL_60;
          }
          break;
        }
      }
      objc_msgSend_addObject_(v11, v164, (uint64_t)v124, v165);
    }
    int v166 = v116;
    if (v116 == 101)
    {
      uint64_t v60 = (void *)v195;
      if ((v194 & 2) != 0 && v195)
      {
        v167 = v191->_cachedSQLiteStatements;
        v168 = objc_msgSend_commandString(v6, v117, v118, v119);
        objc_msgSend_setObject_forKey_(v167, v169, v195, (uint64_t)v168);
      }
      sqlite3_reset(ppStmt);
      sqlite3_clear_bindings(ppStmt);
      int v48 = sub_25C81D72C(v6, v192, v11, 0);
      v42 = 0;
      id v28 = v193;
      goto LABEL_74;
    }

    uint64_t v170 = sqlite3_extended_errcode(v191->_handle);
    v173 = objc_msgSend_stringWithFormat_(NSString, v171, @"Failed to execute command: %@", v172, v6);
    id v174 = objc_alloc(MEMORY[0x263F087E8]);
    v175 = v191->_path;
    v198[0] = *MEMORY[0x263F08068];
    v198[1] = @"command";
    v199[0] = v175;
    v199[1] = v6;
    v198[2] = *MEMORY[0x263F08608];
    v176 = sub_25C81C710(v166, v170);
    v198[3] = *MEMORY[0x263F08320];
    v199[2] = v176;
    v199[3] = v173;
    v178 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v177, (uint64_t)v199, (uint64_t)v198, 4);
    v42 = objc_msgSend_initWithDomain_code_userInfo_(v174, v179, 0x2709E0C50, 2, v178);

    int v48 = sub_25C81D72C(v6, v192, 0, v42);

    id v11 = 0;
LABEL_72:
    id v28 = v193;
  }
  else
  {
    v78 = objc_msgSend_stringWithFormat_(NSString, v76, @"Failed to execute command: %@", v77, v6);
    id v79 = objc_alloc(MEMORY[0x263F087E8]);
    v80 = self->_path;
    v202[0] = *MEMORY[0x263F08068];
    v202[1] = @"command";
    v203[0] = v80;
    v203[1] = v6;
    v202[2] = *MEMORY[0x263F08320];
    v203[2] = v78;
    uint64_t v82 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v81, (uint64_t)v203, (uint64_t)v202, 3);
    v42 = objc_msgSend_initWithDomain_code_userInfo_(v79, v83, 0x2709E0C50, 9, v82);

    int v48 = sub_25C81D72C(v6, v7, v11, v42);
  }
  uint64_t v60 = (void *)v195;
LABEL_74:

LABEL_75:
LABEL_76:

  return v48;
}

- (BOOL)executeCommand:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v6 = objc_msgSend_executeCommand_options_(self, a2, (uint64_t)a3, a4);
  uint64_t v10 = objc_msgSend_error(v6, v7, v8, v9);
  if (v10) {
    sub_25C81F288(a5, v10);
  }

  return v10 == 0;
}

- (BOOL)executeCommandString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [SEMDatabaseCommand alloc];
  uint64_t v9 = objc_msgSend_initWithCommandString_parameters_(v7, v8, (uint64_t)v6, 0);

  LOBYTE(a4) = objc_msgSend_executeCommand_options_error_(self, v10, (uint64_t)v9, 0, a4);
  return (char)a4;
}

- (BOOL)cleanup:(id *)a3
{
  return objc_msgSend_executeCommandString_error_(self, a2, @"VACUUM", (uint64_t)a3);
}

- (int)rowsModified:(id *)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  handle = self->_handle;
  if (handle)
  {
    return sqlite3_changes(handle);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v11 = *MEMORY[0x263F08320];
    v12[0] = @"Invalid sqlite handle.";
    uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v12, (uint64_t)&v11, 1);
    uint64_t v10 = objc_msgSend_initWithDomain_code_userInfo_(v6, v9, 0x2709E0C50, 6, v8);

    if (a3 && v10) {
      *a3 = v10;
    }

    return -1;
  }
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  return objc_msgSend_executeCommandString_error_(self, a2, @"BEGIN TRANSACTION", (uint64_t)a3);
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  return objc_msgSend_executeCommandString_error_(self, a2, @"COMMIT TRANSACTION", (uint64_t)a3);
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  return objc_msgSend_executeCommandString_error_(self, a2, @"ROLLBACK TRANSACTION", (uint64_t)a3);
}

- (NSString)path
{
  return self->_path;
}

- (int64_t)accessPermission
{
  return self->_accessPermission;
}

- (int64_t)threadingMode
{
  return self->_threadingMode;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (int64_t)databaseOptions
{
  return self->_databaseOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_cachedSQLiteStatements, 0);
}

@end