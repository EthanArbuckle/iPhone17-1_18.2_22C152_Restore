@interface NSURL(Pasteboard)
- (BOOL)_pb_isFileProvider;
- (uint64_t)_pb_isDirectory;
@end

@implementation NSURL(Pasteboard)

- (uint64_t)_pb_isDirectory
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  uint64_t v2 = *MEMORY[0x1E4F1C628];
  id v10 = 0;
  int v3 = [a1 getResourceValue:&v11 forKey:v2 error:&v10];
  id v4 = v11;
  id v5 = v10;
  if (v3)
  {
    uint64_t v6 = [v4 BOOLValue];
  }
  else
  {
    v7 = _PBLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a1;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_18D208000, v7, OS_LOG_TYPE_INFO, "Warning: Cannot stat file at %@. Error: %@. Using -[NSURL hasDirectoryPath] instead.", buf, 0x16u);
    }

    uint64_t v6 = [a1 hasDirectoryPath];
  }
  uint64_t v8 = v6;

  return v8;
}

- (BOOL)_pb_isFileProvider
{
  return FPURLMightBeInFileProvider() != 0;
}

@end