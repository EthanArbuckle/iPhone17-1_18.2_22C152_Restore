@interface MKVoiceMemoMigrator
- (BOOL)isSupported:(id)a3;
- (MKVoiceMemoMigrator)init;
- (void)didImport:(id)a3 url:(id)a4 error:(id)a5;
- (void)import:(id)a3 identifier:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 filename:(id)a8 originalFilename:(id)a9 dateAdded:(id)a10 complete:(BOOL)a11;
- (void)import:(id)a3 originalFilename:(id)a4 dateAdded:(id)a5 size:(unint64_t)a6;
- (void)importChunk:(id)a3 identifier:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 filename:(id)a8 originalFilename:(id)a9 dateAdded:(id)a10 complete:(BOOL)a11;
- (void)init;
- (void)moveUnsupportedItemsToFiles:(id)a3 fileName:(id)a4;
- (void)removeTempFile:(id)a3;
@end

@implementation MKVoiceMemoMigrator

- (MKVoiceMemoMigrator)init
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)MKVoiceMemoMigrator;
  v2 = [(MKMigrator *)&v34 init];
  v3 = v2;
  if (!v2) {
    return v3;
  }
  [(MKMigrator *)v2 setType:14];
  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = objc_alloc_init(MKFileProvider);
  v6 = [(MKFileProvider *)v5 fetchRootPath];

  if (v6)
  {
    v7 = MKLocalizedString(@"MOVE_TO_IOS");
    uint64_t v8 = [v6 stringByAppendingPathComponent:v7];
    fileRoot = v3->_fileRoot;
    v3->_fileRoot = (NSString *)v8;

    v10 = +[MKLog log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = v3->_fileRoot;
      *(_DWORD *)buf = 138412290;
      v38 = v11;
      _os_log_impl(&dword_22BFAC000, v10, OS_LOG_TYPE_INFO, "file storage path=%@", buf, 0xCu);
    }

    if ([v4 fileExistsAtPath:v3->_fileRoot]) {
      goto LABEL_13;
    }
    v12 = v3->_fileRoot;
    id v33 = 0;
    [v4 createDirectoryAtPath:v12 withIntermediateDirectories:0 attributes:0 error:&v33];
    v13 = v33;
    if (v13)
    {
      v14 = +[MKLog log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MKVoiceMemoMigrator init]();
      }
    }
  }
  else
  {
    v13 = +[MKLog log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MKVoiceMemoMigrator init]();
    }
  }

LABEL_13:
  v35 = @"m4a";
  v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"soun/aac", 0);
  v36 = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  supports = v3->_supports;
  v3->_supports = (NSDictionary *)v16;

  uint64_t v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_26DF7B1F0];
  extensions = v3->_extensions;
  v3->_extensions = (NSSet *)v18;

  v20 = NSHomeDirectory();
  v21 = [v20 stringByAppendingPathComponent:@"/Library/MigrationKit/"];

  uint64_t v22 = [v21 stringByAppendingPathComponent:@"voice_memo"];
  tempRoot = v3->_tempRoot;
  v3->_tempRoot = (NSString *)v22;

  id v24 = 0;
  if (([v4 fileExistsAtPath:v3->_tempRoot] & 1) == 0)
  {
    v25 = v3->_tempRoot;
    id v32 = 0;
    [v4 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:&v32];
    id v24 = v32;
    if (v24)
    {
      v26 = +[MKLog log];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[MKFileMigrator import:filename:offset:length:total:complete:].cold.4();
      }
    }
  }
  v27 = objc_alloc_init(MKFileDecoder);
  fileDecoder = v3->_fileDecoder;
  v3->_fileDecoder = v27;

  v29 = objc_alloc_init(MKAudioDecoder);
  audioDecoder = v3->_audioDecoder;
  v3->_audioDecoder = v29;

  return v3;
}

- (void)importChunk:(id)a3 identifier:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 filename:(id)a8 originalFilename:(id)a9 dateAdded:(id)a10 complete:(BOOL)a11
{
  id v25 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v21 = self;
  uint64_t v22 = objc_sync_enter(v21);
  v23 = (void *)MEMORY[0x230F5C060](v22);
  LOBYTE(v24) = a11;
  [(MKVoiceMemoMigrator *)v21 import:v25 identifier:v17 offset:a5 length:a6 total:a7 filename:v18 originalFilename:v19 dateAdded:v20 complete:v24];
  objc_sync_exit(v21);
}

- (void)import:(id)a3 identifier:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 filename:(id)a8 originalFilename:(id)a9 dateAdded:(id)a10 complete:(BOOL)a11
{
  v53[1] = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if ([a4 length] && objc_msgSend(v18, "length"))
  {
    v45 = self;
    unint64_t v46 = a6;
    v21 = [(NSString *)self->_tempRoot stringByAppendingPathComponent:v18];
    v48 = [v21 pathExtension];
    unint64_t v47 = a7;
    if ([v48 length])
    {
      uint64_t v22 = [v21 stringByDeletingPathExtension];
      v23 = [v21 pathExtension];
      uint64_t v24 = [v23 lowercaseString];
      uint64_t v25 = [v22 stringByAppendingPathExtension:v24];

      a7 = v47;
      v21 = v25;
    }
    v26 = [MEMORY[0x263F08850] defaultManager];
    v27 = v26;
    if (a5)
    {
      id v49 = 0;
      v28 = [v26 attributesOfItemAtPath:v21 error:&v49];
      id v29 = v49;
      if (v29)
      {
        v30 = v29;
        v31 = v28;
        id v32 = +[MKLog log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[MKFileMigrator import:filename:offset:length:total:complete:]();
        }

        goto LABEL_32;
      }
      v44 = v28;
      v36 = [v28 objectForKey:*MEMORY[0x263F080B8]];
      uint64_t v37 = [v36 unsignedLongLongValue];

      if (v37 == a5)
      {
        v38 = [MEMORY[0x263F08840] fileHandleForWritingAtPath:v21];
        [v38 seekToEndOfFile];
        [v38 writeData:v17];
        [v38 synchronizeFile];
        [v38 closeFile];
        uint64_t v39 = +[MKLog log];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          uint64_t v40 = [v17 length];
          *(_DWORD *)buf = 134217984;
          uint64_t v51 = v40;
          _os_log_impl(&dword_22BFAC000, v39, OS_LOG_TYPE_INFO, "appended some bytes to a file. bytes=%ld", buf, 0xCu);
        }

        a7 = v47;
        if (a5 + v46 != v47 && !a11) {
          goto LABEL_32;
        }
        goto LABEL_29;
      }
      BOOL v41 = v37 == v47;
      a7 = v47;
      if (v41)
      {

        goto LABEL_29;
      }
      v42 = +[MKLog log];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[MKFileMigrator import:filename:offset:length:total:complete:](v42);
      }
    }
    else
    {
      if (([v26 fileExistsAtPath:v21] & 1) == 0
        && ([v17 writeToFile:v21 atomically:1] & 1) == 0)
      {
        id v33 = objc_msgSend(v18, "mk_validatePath");
        if (!v33)
        {
          objc_super v34 = (void *)MEMORY[0x263F087E8];
          uint64_t v52 = *MEMORY[0x263F08320];
          v53[0] = @"failed to write a file";
          v35 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
          id v33 = [v34 errorWithDomain:@"MKVoiceMemoError" code:1 userInfo:v35];

          a7 = v47;
        }
        [(MKMigrator *)v45 migratorDidFailWithImportError:v33];
      }
      if (v46 == a7) {
        goto LABEL_29;
      }
    }
    if (!a11)
    {
LABEL_32:

      goto LABEL_33;
    }
LABEL_29:
    if (!a7) {
      a7 = objc_msgSend(v27, "mk_fileSizeAtPath:", v21);
    }
    [(MKVoiceMemoMigrator *)v45 import:v21 originalFilename:v19 dateAdded:v20 size:a7];
    goto LABEL_32;
  }
  v21 = +[MKLog log];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[MKVoiceMemoMigrator import:identifier:offset:length:total:filename:originalFilename:dateAdded:complete:]();
  }
LABEL_33:
}

- (BOOL)isSupported:(id)a3
{
  id v4 = a3;
  v5 = [v4 pathExtension];
  if ([v5 length] && -[NSSet containsObject:](self->_extensions, "containsObject:", v5))
  {
    v6 = [(MKFileDecoder *)self->_fileDecoder extractFormatOfAsset:v4];
    v7 = [(MKVideoDecoder *)self->_audioDecoder extractFormatOfAsset:v4];
    if ([v6 length] && objc_msgSend(v7, "length"))
    {
      uint64_t v8 = [(NSDictionary *)self->_supports objectForKeyedSubscript:v6];
      char v9 = [v8 containsObject:v7];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)import:(id)a3 originalFilename:(id)a4 dateAdded:(id)a5 size:(unint64_t)a6
{
  v30[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = [(MKVoiceMemoMigrator *)self isSupported:v10];
  v14 = [[MKVoiceMemo alloc] initWithAudioPath:v10 originalFilename:v11 dateAdded:v12 size:a6];
  if (v13)
  {
    v15 = [(MKMigrator *)self delegate];
    [v15 migratorWillExecuteOperation:self];

    objc_initWeak(&location, self);
    uint64_t v16 = (void *)MEMORY[0x263F84D98];
    id v17 = [(MKVoiceMemo *)v14 audioUrl];
    id v18 = [(MKVoiceMemo *)v14 name];
    id v19 = [(MKVoiceMemo *)v14 dateAdded];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __62__MKVoiceMemoMigrator_import_originalFilename_dateAdded_size___block_invoke;
    v25[3] = &unk_264906358;
    objc_copyWeak(&v27, &location);
    v26 = v14;
    [v16 importRecordingWithSourceAudioURL:v17 name:v18 date:v19 completionHandler:v25];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    id v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    v30[0] = @"File format is not supported";
    v21 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    uint64_t v22 = [v20 errorWithDomain:@"MKVoiceMemoError" code:2 userInfo:v21];

    v23 = [(MKVoiceMemo *)v14 audioPath];
    uint64_t v24 = [(MKVoiceMemo *)v14 originalFilename];
    [(MKVoiceMemoMigrator *)self moveUnsupportedItemsToFiles:v23 fileName:v24];

    [(MKMigrator *)self migratorDidFailWithImportError:v22];
  }
}

void __62__MKVoiceMemoMigrator_import_originalFilename_dateAdded_size___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained didImport:*(void *)(a1 + 32) url:v7 error:v6];
}

- (void)didImport:(id)a3 url:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[MKLog log];
  id v12 = v11;
  if (!v9 || v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MKVoiceMemoMigrator didImport:url:error:](v8, (uint64_t)v10, v12);
    }

    v14 = [v8 audioPath];
    v15 = [v8 originalFilename];
    [(MKVoiceMemoMigrator *)self moveUnsupportedItemsToFiles:v14 fileName:v15];

    [(MKMigrator *)self migratorDidFailWithImportError:v10];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = [v8 audioPath];
      int v18 = 138412802;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2048;
      uint64_t v23 = [v8 size];
      _os_log_impl(&dword_22BFAC000, v12, OS_LOG_TYPE_INFO, "sucessfully imported voice memo. file=%@, savedRecordingURI=%@, size=%llu", (uint8_t *)&v18, 0x20u);
    }
    -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", [v8 size]);
    [(MKMigrator *)self migratorDidImport];
  }
  uint64_t v16 = [v8 audioPath];
  [(MKVoiceMemoMigrator *)self removeTempFile:v16];

  id v17 = [(MKMigrator *)self delegate];
  [v17 migratorDidExecuteOperation:self];
}

- (void)moveUnsupportedItemsToFiles:(id)a3 fileName:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = 0x263EFF000uLL;
  id v9 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v6];
  v30 = self;
  fileRoot = self->_fileRoot;
  if (fileRoot)
  {
    id v11 = [(NSString *)fileRoot stringByAppendingPathComponent:v7];
    v31 = [MEMORY[0x263F08850] defaultManager];
    if ([v31 fileExistsAtPath:v11])
    {
      id v27 = v9;
      id v29 = v6;
      id v12 = [v7 stringByDeletingPathExtension];
      id v28 = v7;
      BOOL v13 = [v7 pathExtension];
      uint64_t v14 = 0;
      BOOL v15 = 0;
      uint64_t v16 = v11;
      do
      {
        id v17 = [NSString stringWithFormat:@"%@ %ld", v12, v14 + 2];
        if ([v13 length])
        {
          uint64_t v18 = [v17 stringByAppendingFormat:@".%@", v13];

          id v17 = (void *)v18;
        }
        id v11 = [(NSString *)v30->_fileRoot stringByAppendingPathComponent:v17];

        char v19 = [v31 fileExistsAtPath:v11];
        if ((v19 & 1) == 0) {
          break;
        }
        BOOL v15 = (unint64_t)(v14 + 2) > 0x7FFFFFFD;
        ++v14;
        uint64_t v16 = v11;
      }
      while (v14 != 2147483645);

      id v7 = v28;
      id v6 = v29;
      id v9 = v27;
      unint64_t v8 = 0x263EFF000;
    }
    else
    {
      BOOL v15 = 0;
    }
    __int16 v20 = (void *)[objc_alloc(*(Class *)(v8 + 2608)) initFileURLWithPath:v11];
    if (v15) {
      goto LABEL_20;
    }
    uint64_t v32 = 0;
    char v21 = [v31 moveItemAtURL:v9 toURL:v20 error:&v32];
    __int16 v22 = +[MKLog log];
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v23)
      {
        *(_DWORD *)buf = 67109120;
        int v34 = 1;
        uint64_t v24 = "Local File Storage did import an asset. success=%d";
        uint64_t v25 = v22;
        uint32_t v26 = 8;
LABEL_18:
        _os_log_impl(&dword_22BFAC000, v25, OS_LOG_TYPE_INFO, v24, buf, v26);
      }
    }
    else if (v23)
    {
      *(_WORD *)buf = 0;
      uint64_t v24 = "Local File Storage failed to import the voice memo.";
      uint64_t v25 = v22;
      uint32_t v26 = 2;
      goto LABEL_18;
    }

LABEL_20:
    goto LABEL_21;
  }
  id v11 = +[MKLog log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[MKVoiceMemoMigrator moveUnsupportedItemsToFiles:fileName:]();
  }
LABEL_21:
}

- (void)removeTempFile:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 isDeletableFileAtPath:v3];

  if (v5)
  {
    id v6 = [MEMORY[0x263F08850] defaultManager];
    id v9 = 0;
    [v6 removeItemAtPath:v3 error:&v9];
    id v7 = v9;

    if (v7)
    {
      unint64_t v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MKVoiceMemoMigrator removeTempFile:]();
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_supports, 0);
  objc_storeStrong((id *)&self->_audioDecoder, 0);
  objc_storeStrong((id *)&self->_fileDecoder, 0);
  objc_storeStrong((id *)&self->_fileRoot, 0);
  objc_storeStrong((id *)&self->_tempRoot, 0);
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_22BFAC000, v1, OS_LOG_TYPE_ERROR, "%@ couldn't create a local file storage directory and will skip Voice Memos fallback. error=%@", v2, 0x16u);
}

- (void)import:identifier:offset:length:total:filename:originalFilename:dateAdded:complete:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "%@ can't continue to import a voice memo because no identifier or filename found.", v2, v3, v4, v5, v6);
}

- (void)didImport:(void *)a1 url:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 audioPath];
  OUTLINED_FUNCTION_2_1();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_22BFAC000, a3, OS_LOG_TYPE_ERROR, "could not import voice memo. file=%@ error=%@", v6, 0x16u);
}

- (void)moveUnsupportedItemsToFiles:fileName:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "%@ can't import a file because it could not find a root path.", v2, v3, v4, v5, v6);
}

- (void)removeTempFile:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "could not delete a temporary voice memo file. file=%@", v2, v3, v4, v5, v6);
}

@end