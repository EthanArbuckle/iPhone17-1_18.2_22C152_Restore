@interface MKContainerMigrator
- (MKContainerMigrator)init;
- (NSDictionary)signatures;
- (void)import:(id)a3 signature:(id)a4 chunk:(id)a5 filename:(id)a6 offset:(unint64_t)a7 length:(unint64_t)a8 total:(unint64_t)a9 required:(BOOL)a10 excludedFromBackup:(BOOL)a11 complete:(BOOL)a12;
- (void)importContainer:(id)a3 signature:(id)a4 chunk:(id)a5 filename:(id)a6 offset:(unint64_t)a7 length:(unint64_t)a8 total:(unint64_t)a9 required:(BOOL)a10 excludedFromBackup:(BOOL)a11 complete:(BOOL)a12;
- (void)setSignatures:(id)a3;
@end

@implementation MKContainerMigrator

- (MKContainerMigrator)init
{
  v23[1] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)MKContainerMigrator;
  v2 = [(MKMigrator *)&v20 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    containers = v2->_containers;
    v2->_containers = v3;

    v5 = objc_alloc_init(MKHex);
    v6 = [MKCrypto alloc];
    v7 = [(MKHex *)v5 hexToData:@"331BB104B13265802FC130A8AC28927CFF1CC3F0D502D0B0DE25A8D6F87D3528"];
    v8 = [(MKCrypto *)v6 initWithKey:v7];

    v9 = [(MKHex *)v5 hexToData:@"94FBBFDC34ECDA1EBEF8B963954CCE8370B1841A7E12A080793994F1184A8F213A0430023E"];
    v10 = [(MKCrypto *)v8 decryptData:v9];

    v11 = [(MKHex *)v5 hexToData:@"28EB9810F0391B9C3EDE3CF2BF6877F3BA7DE19BD371E17ABADE930CD817916E9CBBA56265158D4F4B32F15DF9BA7C0C843BE510FE128C505A33DD0C922309853DD00A6EDD954F254D5666F40362AD6F"];
    v12 = [(MKCrypto *)v8 decryptData:v11];

    v13 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
    v14 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
    v21 = v14;
    v22 = v13;
    v15 = (void *)MEMORY[0x263EFFA08];
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    v17 = [v15 setWithArray:v16];
    v23[0] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [(MKContainerMigrator *)v2 setSignatures:v18];

    [(MKMigrator *)v2 setType:7];
  }
  return v2;
}

- (void)importContainer:(id)a3 signature:(id)a4 chunk:(id)a5 filename:(id)a6 offset:(unint64_t)a7 length:(unint64_t)a8 total:(unint64_t)a9 required:(BOOL)a10 excludedFromBackup:(BOOL)a11 complete:(BOOL)a12
{
  id v25 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  objc_super v20 = self;
  uint64_t v21 = objc_sync_enter(v20);
  v22 = (void *)MEMORY[0x230F5C060](v21);
  BYTE2(v23) = a12;
  LOWORD(v23) = __PAIR16__(a11, a10);
  -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:](v20, "import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:", v25, v17, v18, v19, a7, a8, a9, v23);
  objc_sync_exit(v20);
}

- (void)import:(id)a3 signature:(id)a4 chunk:(id)a5 filename:(id)a6 offset:(unint64_t)a7 length:(unint64_t)a8 total:(unint64_t)a9 required:(BOOL)a10 excludedFromBackup:(BOOL)a11 complete:(BOOL)a12
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  if ([v21 length])
  {
    if (v18)
    {
      if (v19)
      {
        v22 = [MEMORY[0x263EFF910] date];
        v65 = [(NSDictionary *)self->_signatures objectForKey:v18];
        if ([v65 containsObject:v19])
        {
          uint64_t v23 = [(NSMutableDictionary *)self->_containers objectForKey:v18];
          if (v23) {
            goto LABEL_6;
          }
          v34 = [[MKPlaceholder alloc] initWithBundleIdentifier:v18];
          if ([(MKPlaceholder *)v34 enabled])
          {
            uint64_t v35 = [(MKPlaceholder *)v34 container];
            [(NSMutableDictionary *)self->_containers setObject:v35 forKey:v18];

            uint64_t v23 = (void *)v35;
            if (v35)
            {
LABEL_6:
              v64 = objc_msgSend(v23, "stringByAppendingPathComponent:", v21, v23);
              v62 = [v64 stringByDeletingLastPathComponent];
              v24 = +[MKLog log];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138413058;
                uint64_t v71 = (uint64_t)v64;
                __int16 v72 = 2048;
                *(void *)v73 = a7;
                *(_WORD *)&v73[8] = 2048;
                *(void *)&v73[10] = a8;
                __int16 v74 = 2048;
                unint64_t v75 = a9;
                _os_log_impl(&dword_22BFAC000, v24, OS_LOG_TYPE_INFO, "file=%@, offset=%lld, length=%lld, total=%lld", buf, 0x2Au);
              }

              v63 = [MEMORY[0x263F08850] defaultManager];
              if (([v63 fileExistsAtPath:v62] & 1) != 0
                || (id v69 = 0,
                    [v63 createDirectoryAtPath:v62 withIntermediateDirectories:1 attributes:0 error:&v69], (id v61 = v69) == 0))
              {
                id v61 = 0;
                if (a7)
                {
LABEL_13:
                  id v66 = 0;
                  v26 = [v63 attributesOfItemAtPath:v64 error:&v66];
                  id v27 = v66;
                  if (v27)
                  {
                    id v28 = v27;
                    v29 = +[MKLog log];
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                      -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.7();
                    }

                    v26 = v28;
                    goto LABEL_59;
                  }
                  v36 = [v26 objectForKey:*MEMORY[0x263F080B8]];
                  uint64_t v37 = [v36 unsignedLongLongValue];

                  if (v37 == a7)
                  {
                    v38 = [MEMORY[0x263F08840] fileHandleForWritingAtPath:v64];
                    [v38 seekToEndOfFile];
                    [v38 writeData:v20];
                    [v38 synchronizeFile];
                    [v38 closeFile];
                    v39 = +[MKLog log];
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v40 = [v20 length];
                      *(_DWORD *)buf = 134217984;
                      uint64_t v71 = v40;
                      _os_log_impl(&dword_22BFAC000, v39, OS_LOG_TYPE_INFO, "appended some bytes to a file. bytes=%ld", buf, 0xCu);
                    }
                  }
LABEL_58:

                  -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", [v20 length]);
                  id v50 = +[MKAnalytics sharedInstance];
                  objc_sync_enter(v50);
                  v26 = v50;
                  v51 = [v50 payload];
                  v52 = [v51 whatsapp];

                  v53 = [MEMORY[0x263EFF910] date];
                  [v53 timeIntervalSinceDate:v22];
                  double v55 = v54;

                  v56 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v55];
                  v57 = [v52 importElapsedTime];
                  v58 = [v57 decimalNumberByAdding:v56];
                  [v52 setImportElapsedTime:v58];

                  objc_sync_exit(v26);
LABEL_59:

                  v31 = v60;
                  goto LABEL_60;
                }
              }
              else
              {
                id v25 = +[MKLog log];
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                  -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.8();
                }

                if (a7) {
                  goto LABEL_13;
                }
              }
              if ([v63 fileExistsAtPath:v64])
              {
                if (![v63 isDeletableFileAtPath:v64])
                {
                  v49 = +[MKLog log];
                  v26 = v49;
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.6();
                    v26 = v49;
                  }
                  goto LABEL_59;
                }
                id v68 = 0;
                [v63 removeItemAtPath:v64 error:&v68];
                id v32 = v68;
                if (v32)
                {
                  v26 = v32;
                  v33 = +[MKLog log];
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                    -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.5((uint64_t)v64, v26, v33);
                  }

                  goto LABEL_59;
                }
              }
              char v41 = [v20 writeToFile:v64 atomically:1];
              v42 = +[MKLog log];
              BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);
              if (v41)
              {
                if (v43)
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v71 = (uint64_t)v64;
                  _os_log_impl(&dword_22BFAC000, v42, OS_LOG_TYPE_INFO, "created a file. file=%@", buf, 0xCu);
                }

                v26 = [NSURL fileURLWithPath:v64];
                v44 = [NSNumber numberWithBool:a11];
                uint64_t v45 = *MEMORY[0x263EFF6B0];
                id v67 = v61;
                [v26 setResourceValue:v44 forKey:v45 error:&v67];
                id v46 = v67;

                if (v46)
                {
                  v47 = +[MKLog log];
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                  {
                    v59 = [v46 description];
                    *(_DWORD *)buf = 138412802;
                    uint64_t v71 = (uint64_t)v64;
                    __int16 v72 = 1024;
                    *(_DWORD *)v73 = a11;
                    *(_WORD *)&v73[4] = 2112;
                    *(void *)&v73[6] = v59;
                    _os_log_error_impl(&dword_22BFAC000, v47, OS_LOG_TYPE_ERROR, "could not set a resource value. file=%@, is_excluded_from_backup=%d, error=%@", buf, 0x1Cu);
                  }
                  id v61 = v46;
                  goto LABEL_59;
                }
                [(MKMigrator *)self migratorDidImport];
                id v61 = 0;
              }
              else
              {
                if (v43)
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v71 = (uint64_t)v64;
                  _os_log_impl(&dword_22BFAC000, v42, OS_LOG_TYPE_INFO, "could not create a file. file=%@", buf, 0xCu);
                }

                uint64_t v48 = objc_msgSend(v21, "mk_validatePath");
                if (!v48)
                {
                  uint64_t v48 = [MEMORY[0x263F087E8] errorWithDomain:@"MKContainerError" code:1 userInfo:0];
                }
                v26 = (void *)v48;
                -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:");
              }
              goto LABEL_58;
            }
          }
          else
          {
          }
          v30 = +[MKLog log];
          v31 = v30;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.4();
            goto LABEL_38;
          }
        }
        else
        {
          v30 = +[MKLog log];
          v31 = v30;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.9();
LABEL_38:
            v31 = v30;
          }
        }
LABEL_60:

        goto LABEL_61;
      }
      v22 = +[MKLog log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:]();
      }
    }
    else
    {
      v22 = +[MKLog log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:]();
      }
    }
  }
  else
  {
    v22 = +[MKLog log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:]();
    }
  }
LABEL_61:
}

- (NSDictionary)signatures
{
  return self->_signatures;
}

- (void)setSignatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_containers, 0);
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "%@ can't continue to import a file because no filename found.", v2, v3, v4, v5, v6);
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "%@ can't continue to import a file because identifier was missing.", v2, v3, v4, v5, v6);
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "%@ can't continue to import a file because signature was missing.", v2, v3, v4, v5, v6);
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_22BFAC000, v0, v1, "%@ can't continue to import a file because the container was not set. id=%@");
}

- (void)import:(NSObject *)a3 signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.5(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_22BFAC000, a3, OS_LOG_TYPE_ERROR, "could not delete a temporary file. file=%@, error=%@", (uint8_t *)&v6, 0x16u);
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "could not delete a temporary file. file=%@", v2, v3, v4, v5, v6);
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_22BFAC000, v0, v1, "could not get file attributes. file=%@, error=%@");
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_22BFAC000, v0, v1, "file=%@, error=%@");
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "%@ can't continue to import a file because the signature was not approved.", v2, v3, v4, v5, v6);
}

@end