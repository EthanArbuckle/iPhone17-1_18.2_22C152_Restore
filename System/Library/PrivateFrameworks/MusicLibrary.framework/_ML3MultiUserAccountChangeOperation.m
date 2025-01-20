@interface _ML3MultiUserAccountChangeOperation
- (MLMediaLibraryAccountChangeObserver)accountChangeObserver;
- (NSString)databasePath;
- (_ML3MultiUserAccountChangeOperation)initWithDatabasePath:(id)a3 accountChangeObserver:(id)a4;
- (void)execute;
- (void)setAccountChangeObserver:(id)a3;
@end

@implementation _ML3MultiUserAccountChangeOperation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accountChangeObserver);

  objc_storeStrong((id *)&self->_databasePath, 0);
}

- (void)setAccountChangeObserver:(id)a3
{
}

- (MLMediaLibraryAccountChangeObserver)accountChangeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountChangeObserver);

  return (MLMediaLibraryAccountChangeObserver *)WeakRetained;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)execute
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "_ML3MultiUserAccountChangeOperation %p - Starting operation", buf, 0xCu);
  }

  v4 = [(_ML3MultiUserAccountChangeOperation *)self accountChangeObserver];
  v5 = [(_ML3MultiUserAccountChangeOperation *)self databasePath];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46___ML3MultiUserAccountChangeOperation_execute__block_invoke;
  v6[3] = &unk_1E5FB83A8;
  v6[4] = self;
  [v4 performDatabasePathChange:v5 completion:v6];
}

- (_ML3MultiUserAccountChangeOperation)initWithDatabasePath:(id)a3 accountChangeObserver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ML3MultiUserAccountChangeOperation;
  v8 = [(MSVAsyncOperation *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    databasePath = v8->_databasePath;
    v8->_databasePath = (NSString *)v9;

    objc_storeWeak((id *)&v8->_accountChangeObserver, v7);
  }

  return v8;
}

@end