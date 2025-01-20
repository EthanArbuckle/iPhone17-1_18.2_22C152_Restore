@interface MKFileMigrator
- (MKFileMigrator)init;
- (void)import:(id)a3 filename:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 complete:(BOOL)a8;
- (void)importChunk:(id)a3 filename:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 complete:(BOOL)a8;
- (void)init;
@end

@implementation MKFileMigrator

- (MKFileMigrator)init
{
  v10.receiver = self;
  v10.super_class = (Class)MKFileMigrator;
  v2 = [(MKMigrator *)&v10 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_3;
  }
  [(MKMigrator *)v2 setType:9];
  v4 = objc_alloc_init(MKFileProvider);
  uint64_t v5 = [(MKFileProvider *)v4 fetchRootPath];
  root = v3->_root;
  v3->_root = (NSString *)v5;

  if (!v3->_root)
  {
    v8 = +[MKLog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MKFileMigrator init]();
    }

    v7 = 0;
  }
  else
  {
LABEL_3:
    v7 = v3;
  }

  return v7;
}

- (void)importChunk:(id)a3 filename:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 complete:(BOOL)a8
{
  BOOL v8 = a8;
  id v18 = a3;
  id v14 = a4;
  v15 = self;
  uint64_t v16 = objc_sync_enter(v15);
  v17 = (void *)MEMORY[0x230F5C060](v16);
  [(MKFileMigrator *)v15 import:v18 filename:v14 offset:a5 length:a6 total:a7 complete:v8];
  objc_sync_exit(v15);
}

- (void)import:(id)a3 filename:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 complete:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v14 = a4;
  if ([v14 length])
  {
    unint64_t v37 = a6;
    unint64_t v38 = a7;
    v15 = [MEMORY[0x263EFF910] date];
    v39 = self->_root;
    uint64_t v16 = [(NSString *)v39 stringByAppendingPathComponent:v14];
    v41 = [v16 stringByDeletingLastPathComponent];
    v17 = [MEMORY[0x263F08850] defaultManager];
    if (([v17 fileExistsAtPath:v41] & 1) != 0
      || (id v44 = 0,
          [v17 createDirectoryAtPath:v41 withIntermediateDirectories:1 attributes:0 error:&v44],
          (id v40 = v44) == 0))
    {
      id v40 = 0;
      if (a5) {
        goto LABEL_7;
      }
    }
    else
    {
      id v18 = +[MKLog log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MKFileMigrator import:filename:offset:length:total:complete:].cold.4();
      }

      if (a5)
      {
LABEL_7:
        id v43 = 0;
        v19 = [v17 attributesOfItemAtPath:v16 error:&v43];
        id v20 = v43;
        if (v20)
        {
          id v21 = v20;
          v22 = +[MKLog log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[MKFileMigrator import:filename:offset:length:total:complete:]();
          }

          goto LABEL_35;
        }
        v24 = [v19 objectForKey:*MEMORY[0x263F080B8]];
        uint64_t v25 = [v24 unsignedLongLongValue];

        if (v25 == a5)
        {
          v26 = [MEMORY[0x263F08840] fileHandleForWritingAtPath:v16];
          [v26 seekToEndOfFile];
          [v26 writeData:v42];
          [v26 synchronizeFile];
          [v26 closeFile];
          v27 = +[MKLog log];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            uint64_t v28 = [v42 length];
            *(_DWORD *)buf = 134217984;
            uint64_t v46 = v28;
            _os_log_impl(&dword_22BFAC000, v27, OS_LOG_TYPE_INFO, "appended some bytes to a file. bytes=%ld", buf, 0xCu);
          }

          if (a5 + v37 == v38) {
            BOOL v8 = 1;
          }
        }
        else
        {
          if (v25 == v38)
          {
            BOOL v8 = 1;
LABEL_31:

LABEL_32:
            -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", [v42 length]);
            if (!v8)
            {
LABEL_36:

              goto LABEL_37;
            }
            [(MKMigrator *)self migratorDidImport];
            id v21 = +[MKAnalytics sharedInstance];
            objc_sync_enter(v21);
            v29 = [v21 payload];
            v30 = [v29 files];

            v31 = [MEMORY[0x263EFF910] date];
            [v31 timeIntervalSinceDate:v15];
            double v33 = v32;

            v34 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v33];
            v35 = [v30 importElapsedTime];
            v36 = [v35 decimalNumberByAdding:v34];
            [v30 setImportElapsedTime:v36];

            objc_sync_exit(v21);
            v19 = +[MKLog log];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22BFAC000, v19, OS_LOG_TYPE_INFO, "did import a file.", buf, 2u);
            }
LABEL_35:

            goto LABEL_36;
          }
          v26 = +[MKLog log];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[MKFileMigrator import:filename:offset:length:total:complete:](v26);
          }
        }

        goto LABEL_31;
      }
    }
    if (([v17 fileExistsAtPath:v16] & 1) == 0
      && ([v42 writeToFile:v16 atomically:1] & 1) == 0)
    {
      v23 = objc_msgSend(v14, "mk_validatePath");
      if (!v23)
      {
        v23 = [MEMORY[0x263F087E8] errorWithDomain:@"MKFileError" code:1 userInfo:0];
      }
      [(MKMigrator *)self migratorDidFailWithImportError:v23];
    }
    if (a6 == v38) {
      BOOL v8 = 1;
    }
    goto LABEL_32;
  }
  v15 = +[MKLog log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[MKFileMigrator import:filename:offset:length:total:complete:]();
  }
LABEL_37:
}

- (void).cxx_destruct
{
}

- (void)init
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "%@ could not get a path for Local File Storage and will skip all files transferred.", v2, v3, v4, v5, v6);
}

- (void)import:filename:offset:length:total:complete:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "%@ can't continue to import a media file because no filename found.", v2, v3, v4, v5, v6);
}

- (void)import:(os_log_t)log filename:offset:length:total:complete:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "a file was corrupted by others.", v1, 2u);
}

- (void)import:filename:offset:length:total:complete:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "could not get file attributes. error=%@", v2, v3, v4, v5, v6);
}

- (void)import:filename:offset:length:total:complete:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "error=%@", v2, v3, v4, v5, v6);
}

@end