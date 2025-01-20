@interface _ML3MultiUserDaemonAccountChangeOperation
- (MLMediaLibraryAccountChangeObserver)accountChangeObserver;
- (NSString)finalDSID;
- (NSString)initialDSID;
- (_ML3MultiUserDaemonAccountChangeOperation)initWithInitialDSID:(id)a3 finalDSID:(id)a4 accountChangeObserver:(id)a5;
- (_ML3MultiUserDaemonAccountChangeOperationDelegate)delegate;
- (void)execute;
- (void)setAccountChangeObserver:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _ML3MultiUserDaemonAccountChangeOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountChangeObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_finalDSID, 0);

  objc_storeStrong((id *)&self->_initialDSID, 0);
}

- (void)setAccountChangeObserver:(id)a3
{
}

- (MLMediaLibraryAccountChangeObserver)accountChangeObserver
{
  return self->_accountChangeObserver;
}

- (void)setDelegate:(id)a3
{
}

- (_ML3MultiUserDaemonAccountChangeOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_ML3MultiUserDaemonAccountChangeOperationDelegate *)WeakRetained;
}

- (NSString)finalDSID
{
  return self->_finalDSID;
}

- (NSString)initialDSID
{
  return self->_initialDSID;
}

- (void)execute
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(_ML3MultiUserDaemonAccountChangeOperation *)self delegate];
  if (!v3)
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ - Missing delegate - unable to perform operation", buf, 0xCu);
    }

    [(MSVAsyncOperation *)self finish];
  }
  id v19 = 0;
  char v5 = [v3 shouldExecuteAccountChangeOperation:self reason:&v19];
  id v6 = v19;
  v7 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v9 = [(_ML3MultiUserDaemonAccountChangeOperation *)self initialDSID];
      v10 = [(_ML3MultiUserDaemonAccountChangeOperation *)self finalDSID];
      *(_DWORD *)buf = 138543874;
      v21 = self;
      __int16 v22 = 2114;
      id v23 = v9;
      __int16 v24 = 2114;
      v25 = v10;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Starting account change operation from %{public}@ to %{public}@", buf, 0x20u);
    }
    v11 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [(_ML3MultiUserDaemonAccountChangeOperation *)self accountChangeObserver];
      *(_DWORD *)buf = 138543618;
      v21 = self;
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ - Active account changed - Performing dabase path change with observer %{public}@", buf, 0x16u);
    }
    v13 = [(_ML3MultiUserDaemonAccountChangeOperation *)self finalDSID];
    v14 = [v3 databasePathForDSID:v13];

    [v3 accountChangeOperationWillStartPerformingDatabasePathChange:self newDatabasePath:v14];
    v15 = [(_ML3MultiUserDaemonAccountChangeOperation *)self accountChangeObserver];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52___ML3MultiUserDaemonAccountChangeOperation_execute__block_invoke;
    v17[3] = &unk_1E5FB8098;
    v17[4] = self;
    id v18 = v14;
    id v16 = v14;
    [v15 performDatabasePathChange:v16 completion:v17];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - No account change operation to perform - reason=%{public}@", buf, 0x16u);
    }

    [(MSVAsyncOperation *)self finish];
  }
}

- (_ML3MultiUserDaemonAccountChangeOperation)initWithInitialDSID:(id)a3 finalDSID:(id)a4 accountChangeObserver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_ML3MultiUserDaemonAccountChangeOperation;
  v11 = [(MSVAsyncOperation *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    initialDSID = v11->_initialDSID;
    v11->_initialDSID = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    finalDSID = v11->_finalDSID;
    v11->_finalDSID = (NSString *)v14;

    objc_storeStrong((id *)&v11->_accountChangeObserver, a5);
  }

  return v11;
}

@end