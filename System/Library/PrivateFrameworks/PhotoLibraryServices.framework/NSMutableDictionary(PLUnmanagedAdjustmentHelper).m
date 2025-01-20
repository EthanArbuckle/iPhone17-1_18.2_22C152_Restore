@interface NSMutableDictionary(PLUnmanagedAdjustmentHelper)
- (void)pl_applyOrientation:()PLUnmanagedAdjustmentHelper toNormalizedPointWithXKey:yKey:;
- (void)pl_enforceCorrectValuesForMinKey:()PLUnmanagedAdjustmentHelper maxKey:;
@end

@implementation NSMutableDictionary(PLUnmanagedAdjustmentHelper)

- (void)pl_enforceCorrectValuesForMinKey:()PLUnmanagedAdjustmentHelper maxKey:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 objectForKeyedSubscript:v6];
  uint64_t v9 = [a1 objectForKeyedSubscript:v7];
  v10 = (void *)v9;
  if (v8 && v9)
  {
    [v8 doubleValue];
    double v12 = v11;
    [v10 doubleValue];
    if (v13 < v12)
    {
      [a1 setObject:v10 forKeyedSubscript:v6];
      [a1 setObject:v8 forKeyedSubscript:v7];
    }
  }
  else
  {
    v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Could not find matching min and max keys: %@, %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)pl_applyOrientation:()PLUnmanagedAdjustmentHelper toNormalizedPointWithXKey:yKey:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [a1 objectForKeyedSubscript:v7];
  uint64_t v10 = [a1 objectForKeyedSubscript:v8];
  double v11 = (void *)v10;
  if (v9 && v10)
  {
    [v9 doubleValue];
    [v11 doubleValue];
    PLOrientationTransformImagePoint();
    double v13 = v12;
    v14 = objc_msgSend(NSNumber, "numberWithDouble:");
    [a1 setObject:v14 forKeyedSubscript:v7];

    int v15 = [NSNumber numberWithDouble:v13];
    [a1 setObject:v15 forKeyedSubscript:v8];
  }
  else
  {
    id v16 = PLMigrationGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Could not find matching x and y keys: %@, %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

@end