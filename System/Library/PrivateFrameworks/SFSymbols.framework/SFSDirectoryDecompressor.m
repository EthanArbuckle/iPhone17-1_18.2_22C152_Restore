@interface SFSDirectoryDecompressor
+ (BOOL)decompressDataAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
@end

@implementation SFSDirectoryDecompressor

+ (BOOL)decompressDataAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 path];
  uint64_t v10 = soft_AAFileStreamOpenWithPath([v9 fileSystemRepresentation], 0);

  if (!v10) {
    goto LABEL_24;
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v11 = getAADecompressionInputStreamOpenSymbolLoc_ptr;
  v39 = getAADecompressionInputStreamOpenSymbolLoc_ptr;
  if (!getAADecompressionInputStreamOpenSymbolLoc_ptr)
  {
    v12 = (void *)libAppleArchiveLibrary();
    v37[3] = (uint64_t)dlsym(v12, "AADecompressionInputStreamOpen");
    getAADecompressionInputStreamOpenSymbolLoc_ptr = (_UNKNOWN *)v37[3];
    v11 = (void *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v11)
  {
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
LABEL_27:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
    goto LABEL_28;
  }
  uint64_t v13 = ((uint64_t (*)(uint64_t, void, void))v11)(v10, 0, 0);
  if (!v13)
  {
LABEL_23:
    soft_AAByteStreamClose(v10);
    goto LABEL_24;
  }
  uint64_t v14 = v13;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v15 = getAADecodeArchiveInputStreamOpenSymbolLoc_ptr;
  v39 = getAADecodeArchiveInputStreamOpenSymbolLoc_ptr;
  if (!getAADecodeArchiveInputStreamOpenSymbolLoc_ptr)
  {
    v16 = (void *)libAppleArchiveLibrary();
    v37[3] = (uint64_t)dlsym(v16, "AADecodeArchiveInputStreamOpen");
    getAADecodeArchiveInputStreamOpenSymbolLoc_ptr = (_UNKNOWN *)v37[3];
    v15 = (void *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v15) {
    goto LABEL_27;
  }
  uint64_t v17 = ((uint64_t (*)(uint64_t, void, void, void, void))v15)(v14, 0, 0, 0, 0);
  if (!v17)
  {
LABEL_22:
    soft_AAByteStreamClose(v14);
    goto LABEL_23;
  }
  uint64_t v18 = v17;
  v19 = [MEMORY[0x263F08850] defaultManager];
  v20 = [v8 path];
  char v21 = [v19 fileExistsAtPath:v20];

  if ((v21 & 1) == 0)
  {
    v22 = [MEMORY[0x263F08850] defaultManager];
    int v23 = [v22 createDirectoryAtURL:v8 withIntermediateDirectories:0 attributes:0 error:0];

    if (!v23)
    {
LABEL_21:
      soft_AAArchiveStreamClose(v18);
      goto LABEL_22;
    }
  }
  id v24 = [v8 path];
  uint64_t v25 = [v24 fileSystemRepresentation];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v26 = getAAExtractArchiveOutputStreamOpenSymbolLoc_ptr;
  v39 = getAAExtractArchiveOutputStreamOpenSymbolLoc_ptr;
  if (!getAAExtractArchiveOutputStreamOpenSymbolLoc_ptr)
  {
    v27 = (void *)libAppleArchiveLibrary();
    v37[3] = (uint64_t)dlsym(v27, "AAExtractArchiveOutputStreamOpen");
    getAAExtractArchiveOutputStreamOpenSymbolLoc_ptr = (_UNKNOWN *)v37[3];
    v26 = (void *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v26)
  {
LABEL_28:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
    goto LABEL_29;
  }
  uint64_t v28 = ((uint64_t (*)(uint64_t, void, void, uint64_t, void))v26)(v25, 0, 0, 1, 0);

  if (!v28) {
    goto LABEL_21;
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v29 = getAAArchiveStreamProcessSymbolLoc_ptr;
  v39 = getAAArchiveStreamProcessSymbolLoc_ptr;
  if (!getAAArchiveStreamProcessSymbolLoc_ptr)
  {
    v30 = (void *)libAppleArchiveLibrary();
    v37[3] = (uint64_t)dlsym(v30, "AAArchiveStreamProcess");
    getAAArchiveStreamProcessSymbolLoc_ptr = (_UNKNOWN *)v37[3];
    v29 = (void *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v29)
  {
LABEL_29:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
    v35 = v34;
    _Block_object_dispose(&v36, 8);
    _Unwind_Resume(v35);
  }
  uint64_t v31 = ((uint64_t (*)(uint64_t, uint64_t, void, void, void, void))v29)(v18, v28, 0, 0, 0, 0);
  soft_AAArchiveStreamClose(v28);
  soft_AAArchiveStreamClose(v18);
  soft_AAByteStreamClose(v14);
  soft_AAByteStreamClose(v10);
  if (v31 < 0)
  {
LABEL_24:
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:-1 userInfo:0];
    BOOL v32 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  BOOL v32 = 1;
LABEL_25:

  return v32;
}

@end