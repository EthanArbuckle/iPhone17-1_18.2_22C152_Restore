@interface NSKeyedUnarchiver(PLKeyedUnarchiverAdditions)
+ (id)pl_safeUnarchiveObjectFromData:()PLKeyedUnarchiverAdditions class:;
+ (id)pl_safeUnarchiveObjectFromData:()PLKeyedUnarchiverAdditions classes:;
+ (id)pl_safeUnarchiveObjectFromFile:()PLKeyedUnarchiverAdditions class:;
+ (id)pl_safeUnarchiveObjectFromFile:()PLKeyedUnarchiverAdditions classes:;
- (id)pl_safeInitForReadingFromData:()PLKeyedUnarchiverAdditions;
@end

@implementation NSKeyedUnarchiver(PLKeyedUnarchiverAdditions)

- (id)pl_safeInitForReadingFromData:()PLKeyedUnarchiverAdditions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v3 = (void *)[a1 initForReadingFromData:a3 error:&v8];
  id v4 = v8;
  id v5 = v3;
  if (!v5)
  {
    v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Data was corrupt; forcing -[NSKeyedUnarchiver initForReadingFromData:error:] to return nil, error: %@",
        buf,
        0xCu);
    }
  }
  return v5;
}

+ (id)pl_safeUnarchiveObjectFromFile:()PLKeyedUnarchiverAdditions classes:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1C9B8];
  id v8 = a4;
  v9 = [v7 dataWithContentsOfFile:v6];
  id v14 = 0;
  id v10 = [a1 unarchivedObjectOfClasses:v8 fromData:v9 error:&v14];

  id v11 = v14;
  if (!v10)
  {
    v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_ERROR, "Data at path %@ was corrupt; forcing +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:] to return nil, error: %@",
        buf,
        0x16u);
    }
  }
  return v10;
}

+ (id)pl_safeUnarchiveObjectFromFile:()PLKeyedUnarchiverAdditions class:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6];
  id v12 = 0;
  id v8 = [a1 unarchivedObjectOfClass:a4 fromData:v7 error:&v12];
  id v9 = v12;

  if (!v8)
  {
    id v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "Data at path %@ was corrupt; forcing +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:] to return nil, error: %@",
        buf,
        0x16u);
    }
  }
  return v8;
}

+ (id)pl_safeUnarchiveObjectFromData:()PLKeyedUnarchiverAdditions classes:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  id v4 = [a1 unarchivedObjectOfClasses:a4 fromData:a3 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Data was corrupt; forcing +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:] to return nil, error: %@",
        buf,
        0xCu);
    }
  }
  return v4;
}

+ (id)pl_safeUnarchiveObjectFromData:()PLKeyedUnarchiverAdditions class:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  id v4 = [a1 unarchivedObjectOfClass:a4 fromData:a3 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Data was corrupt; forcing +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:] to return nil, error: %@",
        buf,
        0xCu);
    }
  }
  return v4;
}

@end