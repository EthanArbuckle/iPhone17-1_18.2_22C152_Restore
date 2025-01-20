@interface FCContentArchive
+ (BOOL)supportsSecureCoding;
+ (FCContentArchive)archiveWithAVAsset:(id)a3;
+ (FCContentArchive)archiveWithAVAssetKey:(id)a3;
+ (FCContentArchive)archiveWithAsset:(id)a3 remoteURL:(id)a4 filePath:(id)a5;
+ (FCContentArchive)archiveWithAssetWrappingKey:(id)a3 wrappingKeyID:(id)a4;
+ (FCContentArchive)archiveWithChildArchives:(id)a3;
+ (FCContentArchive)archiveWithPersistedArchivePath:(id)a3;
+ (FCContentArchive)archiveWithRecord:(id)a3;
+ (FCContentArchive)empty;
- (FCContentArchive)initWithCoder:(id)a3;
- (FCContentManifest)manifest;
- (id)unarchiveIntoContentContext:(id)a3;
- (int64_t)storageSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCContentArchive

+ (BOOL)supportsSecureCoding
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCContentArchive supportsSecureCoding]";
    __int16 v9 = 2080;
    v10 = "FCContentArchive.m";
    __int16 v11 = 1024;
    int v12 = 88;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "+[FCContentArchive supportsSecureCoding]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCContentArchive)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCContentArchive initWithCoder:]";
    __int16 v11 = 2080;
    int v12 = "FCContentArchive.m";
    __int16 v13 = 1024;
    int v14 = 93;
    __int16 v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCContentArchive initWithCoder:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCContentArchive encodeWithCoder:]";
    __int16 v11 = 2080;
    int v12 = "FCContentArchive.m";
    __int16 v13 = 1024;
    int v14 = 98;
    __int16 v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCContentArchive encodeWithCoder:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

+ (FCContentArchive)empty
{
  if (qword_1EB5D0FA0 != -1) {
    dispatch_once(&qword_1EB5D0FA0, &__block_literal_global_1);
  }
  v2 = (void *)_MergedGlobals_3;
  return (FCContentArchive *)v2;
}

uint64_t __25__FCContentArchive_empty__block_invoke()
{
  v0 = objc_alloc_init(FCEmptyContentArchive);
  uint64_t v1 = _MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (FCContentArchive)archiveWithRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [FCRecordContentArchive alloc];
    id v6 = v4;
    if (v5)
    {
      v9.receiver = v5;
      v9.super_class = (Class)FCRecordContentArchive;
      v7 = objc_msgSendSuper2(&v9, sel_init);
      v5 = (FCRecordContentArchive *)v7;
      if (v7) {
        objc_storeStrong(v7 + 1, a3);
      }
    }
  }
  else
  {
    v5 = +[FCContentArchive empty];
  }

  return (FCContentArchive *)v5;
}

+ (FCContentArchive)archiveWithAsset:(id)a3 remoteURL:(id)a4 filePath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    __int16 v11 = [FCAssetContentArchive alloc];
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    if (v11)
    {
      v19.receiver = v11;
      v19.super_class = (Class)FCAssetContentArchive;
      __int16 v15 = objc_msgSendSuper2(&v19, sel_init);
      __int16 v11 = (FCAssetContentArchive *)v15;
      if (v15)
      {
        objc_storeStrong(v15 + 1, a3);
        objc_storeStrong((id *)&v11->_remoteURL, a4);
        uint64_t v16 = [v14 copy];
        filePath = v11->_filePath;
        v11->_filePath = (NSString *)v16;
      }
    }
  }
  else
  {
    __int16 v11 = +[FCContentArchive empty];
  }

  return (FCContentArchive *)v11;
}

+ (FCContentArchive)archiveWithAssetWrappingKey:(id)a3 wrappingKeyID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [FCAssetKeyContentArchive alloc];
    id v9 = v6;
    id v10 = v7;
    if (v8)
    {
      v13.receiver = v8;
      v13.super_class = (Class)FCAssetKeyContentArchive;
      __int16 v11 = objc_msgSendSuper2(&v13, sel_init);
      id v8 = (FCAssetKeyContentArchive *)v11;
      if (v11)
      {
        objc_storeStrong(v11 + 1, a3);
        objc_storeStrong((id *)&v8->_wrappingKeyID, a4);
      }
    }
  }
  else
  {
    id v8 = +[FCContentArchive empty];
  }

  return (FCContentArchive *)v8;
}

+ (FCContentArchive)archiveWithAVAsset:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [FCAVAssetContentArchive alloc];
    id v6 = v4;
    if (v5)
    {
      v9.receiver = v5;
      v9.super_class = (Class)FCAVAssetContentArchive;
      id v7 = objc_msgSendSuper2(&v9, sel_init);
      v5 = (FCAVAssetContentArchive *)v7;
      if (v7) {
        objc_storeStrong(v7 + 1, a3);
      }
    }
  }
  else
  {
    v5 = +[FCContentArchive empty];
  }

  return (FCContentArchive *)v5;
}

+ (FCContentArchive)archiveWithAVAssetKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [FCAVAssetKeyContentArchive alloc];
    id v6 = v4;
    if (v5)
    {
      v9.receiver = v5;
      v9.super_class = (Class)FCAVAssetKeyContentArchive;
      id v7 = objc_msgSendSuper2(&v9, sel_init);
      v5 = (FCAVAssetKeyContentArchive *)v7;
      if (v7) {
        objc_storeStrong(v7 + 1, a3);
      }
    }
  }
  else
  {
    v5 = +[FCContentArchive empty];
  }

  return (FCContentArchive *)v5;
}

+ (FCContentArchive)archiveWithPersistedArchivePath:(id)a3
{
  id v3 = a3;
  id v4 = [FCPersistedContentArchive alloc];
  id v5 = v3;
  if (v4)
  {
    v9.receiver = v4;
    v9.super_class = (Class)FCPersistedContentArchive;
    id v4 = objc_msgSendSuper2(&v9, sel_init);
    if (v4)
    {
      uint64_t v6 = [v5 copy];
      archivePath = v4->_archivePath;
      v4->_archivePath = (NSString *)v6;
    }
  }

  return (FCContentArchive *)v4;
}

+ (FCContentArchive)archiveWithChildArchives:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
  }
  else
  {
    id v4 = [FCAggregateContentArchive alloc];
    id v5 = v3;
    if (v4)
    {
      v13.receiver = v4;
      v13.super_class = (Class)FCAggregateContentArchive;
      id v4 = objc_msgSendSuper2(&v13, sel_init);
      if (v4)
      {
        uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __51__FCAggregateContentArchive_initWithChildArchives___block_invoke;
        v11[3] = &unk_1E5B4C2F0;
        id v12 = v5;
        id v7 = objc_msgSend(v6, "fc_set:", v11);
        uint64_t v8 = [v7 allObjects];
        childArchives = v4->_childArchives;
        v4->_childArchives = (NSArray *)v8;
      }
    }
  }
  return (FCContentArchive *)v4;
}

- (id)unarchiveIntoContentContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v4 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    id v10 = "-[FCContentArchive unarchiveIntoContentContext:]";
    __int16 v11 = 2080;
    id v12 = "FCContentArchive.m";
    __int16 v13 = 1024;
    int v14 = 162;
    __int16 v15 = 2114;
    uint64_t v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCContentArchive unarchiveIntoContentContext:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (FCContentManifest)manifest
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCContentArchive manifest]";
    __int16 v9 = 2080;
    id v10 = "FCContentArchive.m";
    __int16 v11 = 1024;
    int v12 = 168;
    __int16 v13 = 2114;
    int v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCContentArchive manifest]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (int64_t)storageSize
{
  return 0;
}

@end