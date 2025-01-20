@interface ML3RemoveTracksOperation
- (BOOL)_execute:(id *)a3;
- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3;
- (unint64_t)type;
@end

@implementation ML3RemoveTracksOperation

- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ML3RemoveTracksOperation;
  if (!-[ML3DatabaseOperation _verifyLibraryConnectionAndAttributesProperties:](&v9, sel__verifyLibraryConnectionAndAttributesProperties_))return 0; {
  v5 = [(ML3DatabaseOperation *)self attributes];
  }
  v6 = [v5 objectForKey:@"MLDatabaseOperationAttributeTrackSourceKey"];
  BOOL v7 = v6 != 0;

  if (a3 && !v6)
  {
    +[ML3MediaLibraryWriter writerErrorWithCode:500 description:@"ML3RemoveTracksOperation requires a track source attribute"];
    BOOL v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)_execute:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = [(ML3DatabaseOperation *)self transaction];
  v6 = [v5 connection];
  BOOL v7 = [v5 library];
  v8 = [(ML3DatabaseOperation *)self attributes];
  objc_super v9 = [v8 objectForKey:@"MLDatabaseOperationAttributeTrackSourceKey"];
  uint64_t v10 = [v9 intValue];

  v11 = [(ML3DatabaseOperation *)self attributes];
  v12 = [v11 objectForKey:@"MLDatabaseOperationAttributePersistentIDsArrayKey"];

  v13 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 67109376;
    int v23 = v10;
    __int16 v24 = 2048;
    double v25 = COERCE_DOUBLE([v12 count]);
    _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "[ML3RemoveTracksOperation] Beginning remove tracks operation with source %d (%lu specified tracks)", (uint8_t *)&v22, 0x12u);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v15 = v14;
  if ([v12 count]) {
    int v16 = [v7 removeSource:v10 fromPersistentIDS:v12 forImportOperation:self usingConnection:v6 postNotifications:1];
  }
  else {
    int v16 = [v7 removeSource:v10 forImportOperation:self usingConnection:v6 postNotifications:1];
  }
  BOOL v17 = v16;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v19 = v18;
  v20 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 67109376;
    int v23 = v17;
    __int16 v24 = 2048;
    double v25 = v19 - v15;
    _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_DEFAULT, "[ML3RemoveTracksOperation] Remove tracks operation success=%d in %.3f seconds", (uint8_t *)&v22, 0x12u);
  }

  if (a3) {
    *a3 = 0;
  }

  return v17;
}

- (unint64_t)type
{
  return 3;
}

@end