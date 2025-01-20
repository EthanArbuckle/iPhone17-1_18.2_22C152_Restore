@interface SFSDirectoryCompressor
+ (BOOL)compressDirectoryAtURL:(id)a3 intoURL:(id)a4 withDenylist:(id)a5 error:(id *)a6;
@end

@implementation SFSDirectoryCompressor

+ (BOOL)compressDirectoryAtURL:(id)a3 intoURL:(id)a4 withDenylist:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v10 path];
  uint64_t v13 = soft_AAFileStreamOpenWithPath([v12 fileSystemRepresentation], 513);

  if (!v13) {
    goto LABEL_29;
  }
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v14 = getAACompressionOutputStreamOpenSymbolLoc_ptr;
  v47 = getAACompressionOutputStreamOpenSymbolLoc_ptr;
  if (!getAACompressionOutputStreamOpenSymbolLoc_ptr)
  {
    v15 = (void *)libAppleArchiveLibrary();
    v45[3] = (uint64_t)dlsym(v15, "AACompressionOutputStreamOpen");
    getAACompressionOutputStreamOpenSymbolLoc_ptr = (_UNKNOWN *)v45[3];
    v14 = (void *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v14)
  {
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
LABEL_32:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
LABEL_33:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
    goto LABEL_34;
  }
  uint64_t v16 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void, void))v14)(v13, 2049, 0x100000, 0, 0);
  if (!v16)
  {
LABEL_28:
    soft_AAByteStreamClose(v13);
    goto LABEL_29;
  }
  uint64_t v17 = v16;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v18 = getAAEncodeArchiveOutputStreamOpenSymbolLoc_ptr;
  v47 = getAAEncodeArchiveOutputStreamOpenSymbolLoc_ptr;
  if (!getAAEncodeArchiveOutputStreamOpenSymbolLoc_ptr)
  {
    v19 = (void *)libAppleArchiveLibrary();
    v45[3] = (uint64_t)dlsym(v19, "AAEncodeArchiveOutputStreamOpen");
    getAAEncodeArchiveOutputStreamOpenSymbolLoc_ptr = (_UNKNOWN *)v45[3];
    v18 = (void *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v18) {
    goto LABEL_32;
  }
  uint64_t v20 = ((uint64_t (*)(uint64_t, void, void, void, void))v18)(v17, 0, 0, 0, 0);
  if (!v20)
  {
LABEL_27:
    soft_AAByteStreamClose(v17);
    goto LABEL_28;
  }
  uint64_t v21 = v20;
  uint64_t v22 = [@"TYP,PAT,LNK,DEV,DAT,UID,GID,MOD,FLG,MTM,BTM,CTM" UTF8String];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v23 = (uint64_t (*)(uint64_t))getAAFieldKeySetCreateWithStringSymbolLoc_ptr;
  v47 = getAAFieldKeySetCreateWithStringSymbolLoc_ptr;
  if (!getAAFieldKeySetCreateWithStringSymbolLoc_ptr)
  {
    v24 = (void *)libAppleArchiveLibrary();
    v45[3] = (uint64_t)dlsym(v24, "AAFieldKeySetCreateWithString");
    getAAFieldKeySetCreateWithStringSymbolLoc_ptr = (_UNKNOWN *)v45[3];
    v23 = (uint64_t (*)(uint64_t))v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v23) {
    goto LABEL_33;
  }
  uint64_t v25 = v23(v22);
  if (!v25)
  {
LABEL_26:
    soft_AAArchiveStreamClose(v21);
    goto LABEL_27;
  }
  uint64_t v42 = v25;
  id v26 = [v9 path];
  uint64_t v27 = [v26 fileSystemRepresentation];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v28 = getAAPathListCreateWithDirectoryContentsSymbolLoc_ptr;
  v47 = getAAPathListCreateWithDirectoryContentsSymbolLoc_ptr;
  if (!getAAPathListCreateWithDirectoryContentsSymbolLoc_ptr)
  {
    v29 = (void *)libAppleArchiveLibrary();
    v45[3] = (uint64_t)dlsym(v29, "AAPathListCreateWithDirectoryContents");
    getAAPathListCreateWithDirectoryContentsSymbolLoc_ptr = (_UNKNOWN *)v45[3];
    v28 = (void *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v28)
  {
LABEL_34:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
LABEL_35:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
    goto LABEL_36;
  }
  uint64_t v30 = ((uint64_t (*)(uint64_t, void, id, BOOL (*)(void *, uint64_t, uint64_t), void, void))v28)(v27, 0, v11, filter_denylist, 0, 0);

  uint64_t v43 = v30;
  if (!v30) {
    goto LABEL_26;
  }
  id v31 = [v9 path];
  uint64_t v41 = [v31 fileSystemRepresentation];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v32 = getAAArchiveStreamWritePathListSymbolLoc_ptr;
  v47 = getAAArchiveStreamWritePathListSymbolLoc_ptr;
  if (!getAAArchiveStreamWritePathListSymbolLoc_ptr)
  {
    v33 = (void *)libAppleArchiveLibrary();
    v45[3] = (uint64_t)dlsym(v33, "AAArchiveStreamWritePathList");
    getAAArchiveStreamWritePathListSymbolLoc_ptr = (_UNKNOWN *)v45[3];
    v32 = (void *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v32) {
    goto LABEL_35;
  }
  int v34 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, id, BOOL (*)(void *, uint64_t, uint64_t), void, void))v32)(v21, v43, v42, v41, v11, filter_denylist, 0, 0);

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v35 = (void (*)(uint64_t))getAAPathListDestroySymbolLoc_ptr;
  v47 = getAAPathListDestroySymbolLoc_ptr;
  if (!getAAPathListDestroySymbolLoc_ptr)
  {
    v36 = (void *)libAppleArchiveLibrary();
    v45[3] = (uint64_t)dlsym(v36, "AAPathListDestroy");
    getAAPathListDestroySymbolLoc_ptr = (_UNKNOWN *)v45[3];
    v35 = (void (*)(uint64_t))v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v35)
  {
LABEL_36:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:]();
    v40 = v39;
    _Block_object_dispose(&v44, 8);
    _Unwind_Resume(v40);
  }
  v35(v43);
  soft_AAArchiveStreamClose(v21);
  soft_AAByteStreamClose(v17);
  soft_AAByteStreamClose(v13);
  if (v34)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F07F70], -1, 0, v41);
    BOOL v37 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  BOOL v37 = 1;
LABEL_30:

  return v37;
}

+ (void)compressDirectoryAtURL:intoURL:withDenylist:error:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  +[SFSSymbolAssetInfo localeAgnosticInfo:allowsPrivate:](v0, v1);
}

@end