@interface ML3DatabaseDistantConnection
- (BOOL)_internalBeginTransactionWithBehaviorType:(unint64_t)a3;
- (BOOL)_internalBeginTransactionWithBehaviorType:(unint64_t)a3 isRetry:(BOOL)a4;
- (BOOL)_internalEndTransactionAndCommit:(BOOL)a3;
- (BOOL)_internalExecuteUpdate:(id)a3 withParameters:(id)a4 error:(id *)a5;
- (BOOL)_openWithFlags:(int)a3;
- (BOOL)close;
- (BOOL)isOpen;
- (BOOL)isReadOnly;
- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 block:(id)a5;
- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 functionPointer:(void *)a5 userData:(void *)a6;
- (BOOL)registerModule:(id)a3;
- (BOOL)shouldCacheStatements;
- (ML3DatabaseDistantConnection)initWithDatabasePath:(id)a3;
- (ML3DatabaseDistantConnectionDelegate)distantDelegate;
- (id)_internalExecuteQuery:(id)a3 withParameters:(id)a4 limitProperty:(id)a5 limitValue:(int64_t)a6;
- (id)currentTransactionID;
- (id)openBlobInTable:(id)a3 column:(id)a4 row:(int64_t)a5 readOnly:(BOOL)a6;
- (int)checkpointDatabase;
- (sqlite3)_sqliteHandle;
- (void)_serviceTerminatedTransactionNotification:(id)a3;
- (void)dealloc;
- (void)setDistantDelegate:(id)a3;
@end

@implementation ML3DatabaseDistantConnection

- (BOOL)isOpen
{
  return self->_connectionOpen;
}

- (BOOL)isReadOnly
{
  return 0;
}

- (BOOL)_internalExecuteUpdate:(id)a3 withParameters:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v8 = (ML3DatabaseDistantConnection *)a3;
  id v9 = a4;
  BOOL v10 = [(ML3DatabaseConnection *)self isInTransaction];
  if (!v10) {
    [(ML3DatabaseConnection *)self pushTransaction];
  }
  if (!self->_currentTransactionID)
  {
    v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_ERROR, "No valid transaction ID for connection %{public}@", buf, 0xCu);
    }

    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22 = @"The media library service failed to return a valid transaction ID.";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v12 = [v14 errorWithDomain:@"ML3DatabaseErrorDomain" code:600 userInfo:v11];
LABEL_11:

    BOOL v15 = 0;
    if (v10) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if ([(ML3DatabaseConnection *)self transactionMarkedForRollBack])
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "failing update request in a transaction marked for rollback. sql=%{public}@", buf, 0xCu);
    }
    id v12 = 0;
    goto LABEL_11;
  }
  mediaLibraryService = self->_mediaLibraryService;
  currentTransactionID = self->_currentTransactionID;
  id v20 = 0;
  BOOL v19 = [(MLMediaLibraryService *)mediaLibraryService executeUpdate:v8 withParameters:v9 onTransaction:currentTransactionID error:&v20];
  id v12 = v20;
  if (!v19)
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      __int16 v25 = 2114;
      id v26 = v12;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "Could not execute update on distant connection: %{public}@. %{public}@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  BOOL v15 = 1;
  if (!v10) {
LABEL_12:
  }
    [(ML3DatabaseConnection *)self popTransactionAndCommit:1];
LABEL_13:
  if (a5) {
    *a5 = v12;
  }

  return v15;
}

- (BOOL)_internalBeginTransactionWithBehaviorType:(unint64_t)a3
{
  return [(ML3DatabaseDistantConnection *)self _internalBeginTransactionWithBehaviorType:a3 isRetry:0];
}

- (BOOL)_internalBeginTransactionWithBehaviorType:(unint64_t)a3 isRetry:(BOOL)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([(ML3DatabaseConnection *)self isInTransaction])
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"ML3DatabaseDistantConnection.m" lineNumber:152 description:@"Attempted to begin distant transaction while one is already in process."];
  }
  [(ML3DatabaseConnection *)self _ensureConnectionIsOpen];
  p_currentTransactionID = &self->_currentTransactionID;
  if (!self->_currentTransactionID)
  {
    if (ML3IsUIApplication___once != -1) {
      dispatch_once(&ML3IsUIApplication___once, &__block_literal_global_21435);
    }
    if (ML3IsUIApplication___isUIApplication) {
      uint64_t IsFirstPartyMediaApplication = ML3IsFirstPartyMediaApplication();
    }
    else {
      uint64_t IsFirstPartyMediaApplication = 1;
    }
    uint64_t v11 = [MEMORY[0x1E4F29060] isMainThread];
    id v12 = [(ML3DatabaseConnection *)self databasePath];
    v13 = [MLTransactionContext alloc];
    v14 = [(ML3DatabaseConnection *)self privacyContext];
    BOOL v15 = [(MLTransactionContext *)v13 initWithPrivacyContext:v14 path:v12 priorityLevel:v11 options:IsFirstPartyMediaApplication];

    mediaLibraryService = self->_mediaLibraryService;
    id v30 = 0;
    v17 = [(MLMediaLibraryService *)mediaLibraryService beginTransactionForDatabaseWithContext:v15 error:&v30];
    id v18 = v30;
    BOOL v19 = [(ML3DatabaseConnection *)self connectionDelegate];
    if (!v18 && v17)
    {
      objc_storeStrong((id *)&self->_currentTransactionID, v17);
      id v20 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = [v17 UUIDString];
        *(_DWORD *)buf = 138543362;
        v32 = v21;
        _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_DEBUG, "Successfully began transaction with ID %{public}@", buf, 0xCu);
      }
      if (objc_opt_respondsToSelector()) {
        [v19 connectionDidBeginDatabaseTransaction:self];
      }
LABEL_25:
      BOOL v9 = 1;
LABEL_30:

      return v9;
    }
    v22 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = self;
      __int16 v33 = 2114;
      id v34 = v18;
      _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_DEFAULT, "Could not begin transaction on distant connection: %{public}@. %{public}@", buf, 0x16u);
    }

    if (!a4)
    {
      v23 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v23, OS_LOG_TYPE_DEFAULT, "Reattempting to begin transaction with media library service...", buf, 2u);
      }

      BOOL v24 = [(ML3DatabaseDistantConnection *)self _internalBeginTransactionWithBehaviorType:a3 isRetry:1];
      __int16 v25 = os_log_create("com.apple.amp.medialibrary", "Default");
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v24)
      {
        if (v26)
        {
          uint64_t v27 = [(NSUUID *)*p_currentTransactionID UUIDString];
          *(_DWORD *)buf = 138543362;
          v32 = v27;
          _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEFAULT, "Reattempt to begin transaction succeeded. Proceeding with new transaction ID %{public}@.", buf, 0xCu);
        }
        goto LABEL_25;
      }
      if (v26)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEFAULT, "Reattempt to begin transaction failed.", buf, 2u);
      }
    }
    BOOL v9 = 0;
    goto LABEL_30;
  }
  return 0;
}

- (BOOL)_internalEndTransactionAndCommit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(ML3DatabaseConnection *)self isInTransaction])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"ML3DatabaseDistantConnection.m" lineNumber:203 description:@"Attempted to end non-existent distant transaction."];
  }
  [(ML3DatabaseConnection *)self _ensureConnectionIsOpen];
  currentTransactionID = self->_currentTransactionID;
  if (currentTransactionID)
  {
    mediaLibraryService = self->_mediaLibraryService;
    id v17 = 0;
    BOOL v8 = [(MLMediaLibraryService *)mediaLibraryService endTransaction:currentTransactionID shouldCommit:v3 error:&v17];
    id v9 = v17;
    BOOL v10 = [(ML3DatabaseConnection *)self connectionDelegate];
    uint64_t v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    id v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v13 = [(NSUUID *)self->_currentTransactionID UUIDString];
        *(_DWORD *)buf = 138543362;
        BOOL v19 = v13;
        _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEBUG, "Successfully ended transaction with ID %{public}@", buf, 0xCu);
      }
      if (objc_opt_respondsToSelector()) {
        [v10 connection:self didEndDatabaseTransactionAndCommit:v3];
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        BOOL v19 = self;
        __int16 v20 = 2114;
        id v21 = v9;
        _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "Could not end transaction on distant connection: %{public}@. %{public}@", buf, 0x16u);
      }
    }
    v14 = self->_currentTransactionID;
    self->_currentTransactionID = 0;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_distantDelegate);
  objc_storeStrong((id *)&self->_currentTransactionID, 0);

  objc_storeStrong((id *)&self->_mediaLibraryService, 0);
}

- (void)setDistantDelegate:(id)a3
{
}

- (ML3DatabaseDistantConnectionDelegate)distantDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_distantDelegate);

  return (ML3DatabaseDistantConnectionDelegate *)WeakRetained;
}

- (void)_serviceTerminatedTransactionNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ML3DatabaseConnection *)self isInTransaction] && self->_currentTransactionID)
  {
    v5 = [v4 userInfo];
    v6 = [v5 objectForKey:@"MLTerminatedTransactionIdentifierKey"];

    if ([(NSUUID *)self->_currentTransactionID isEqual:v6])
    {
      v7 = [v4 userInfo];
      BOOL v8 = [v7 objectForKey:*MEMORY[0x1E4F28A50]];

      id v9 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v8;
        _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "Service terminated distant transaction with error: %{public}@", (uint8_t *)&v11, 0xCu);
      }

      currentTransactionID = self->_currentTransactionID;
      self->_currentTransactionID = 0;

      [(ML3DatabaseConnection *)self setTransactionLevel:0];
    }
  }
}

- (id)_internalExecuteQuery:(id)a3 withParameters:(id)a4 limitProperty:(id)a5 limitValue:(int64_t)a6
{
  id v10 = a5;
  if (a3)
  {
    id v11 = a4;
    id v12 = a3;
    a3 = [[ML3DatabaseDistantResult alloc] initWithDistantConnection:self sql:v12 parameters:v11];

    if (v10) {
      [a3 setLimitProperty:v10 limitValue:a6];
    }
    uint64_t v13 = [(ML3DatabaseConnection *)self connectionDelegate];
    if (objc_opt_respondsToSelector()) {
      [v13 connectionDidAccessDatabase:self];
    }
  }

  return a3;
}

- (int)checkpointDatabase
{
  return 0;
}

- (id)openBlobInTable:(id)a3 column:(id)a4 row:(int64_t)a5 readOnly:(BOOL)a6
{
  return 0;
}

- (BOOL)registerModule:(id)a3
{
  return 0;
}

- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 functionPointer:(void *)a5 userData:(void *)a6
{
  return 0;
}

- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 block:(id)a5
{
  return 0;
}

- (BOOL)close
{
  if ([(ML3DatabaseConnection *)self isInTransaction]) {
    BOOL result = [(ML3DatabaseConnection *)self popToRootTransactionAndCommit:0];
  }
  else {
    BOOL result = 1;
  }
  self->_connectionOpen = 0;
  return result;
}

- (BOOL)_openWithFlags:(int)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(ML3DatabaseConnection *)self connectionDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 connectionWillOpenDatabase:self];
  }
  self->_BOOL connectionOpen = 1;
  if (objc_opt_respondsToSelector())
  {
    [v4 connectionDidOpenDatabase:0];
  }
  else if (!self->_connectionOpen && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"Distant connection could not open XPC connection to media library service daemon.";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ML3DatabaseErrorDomain" code:0 userInfo:v5];
    [v4 connection:self didFailToOpenDatabaseWithError:v6];
  }
  BOOL connectionOpen = self->_connectionOpen;

  return connectionOpen;
}

- (id)currentTransactionID
{
  return self->_currentTransactionID;
}

- (BOOL)shouldCacheStatements
{
  return 0;
}

- (sqlite3)_sqliteHandle
{
  return 0;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"MLMediaLibraryServiceDidTerminateTransactionNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)ML3DatabaseDistantConnection;
  [(ML3DatabaseConnection *)&v4 dealloc];
}

- (ML3DatabaseDistantConnection)initWithDatabasePath:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ML3DatabaseDistantConnection;
  BOOL v3 = [(ML3DatabaseConnection *)&v9 initWithDatabasePath:a3];
  if (v3)
  {
    uint64_t v4 = +[MLMediaLibraryService sharedMediaLibraryService];
    mediaLibraryService = v3->_mediaLibraryService;
    v3->_mediaLibraryService = (MLMediaLibraryService *)v4;

    currentTransactionID = v3->_currentTransactionID;
    v3->_currentTransactionID = 0;

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v3 selector:sel__serviceTerminatedTransactionNotification_ name:@"MLMediaLibraryServiceDidTerminateTransactionNotification" object:0];
  }
  return v3;
}

@end