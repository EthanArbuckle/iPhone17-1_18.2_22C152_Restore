@interface TRISqliteErrorHandler
- (BOOL)handleSqliteError:(int)a3 error:(id)a4 onError:(id)a5 db:(id)a6;
- (TRISqliteErrorHandler)initWithStorageManagement:(id)a3;
- (TRISqliteErrorHandler)initWithStorageManagement:(id)a3 defaultErrorHandler:(id)a4;
@end

@implementation TRISqliteErrorHandler

- (TRISqliteErrorHandler)initWithStorageManagement:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(TRISqliteErrorHandler *)self initWithStorageManagement:v4 defaultErrorHandler:v5];

  return v6;
}

- (TRISqliteErrorHandler)initWithStorageManagement:(id)a3 defaultErrorHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TRISqliteErrorHandler;
  v9 = [(TRISqliteErrorHandler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_defaultErrorHandler, a4);
    objc_storeStrong((id *)&v10->_storageManagement, a3);
    if (!v10->_storageManagement)
    {
      v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v13 = 0;
        _os_log_debug_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEBUG, "Initiating TRISqliteErrorHandler with no storage management.", v13, 2u);
      }
    }
  }

  return v10;
}

- (BOOL)handleSqliteError:(int)a3 error:(id)a4 onError:(id)a5 db:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v8 != 11)
  {
    if (v8 == 8)
    {
      v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_super v14 = [v10 localizedDescription];
        *(_DWORD *)v23 = 138412290;
        *(void *)&v23[4] = v14;
        v15 = "Encountered SQLITE_READONLY error.\n error description: %@";
LABEL_13:
        v18 = v13;
        uint32_t v19 = 12;
        goto LABEL_14;
      }
    }
    else
    {
      v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_super v14 = [v10 localizedDescription];
        *(_DWORD *)v23 = 67109378;
        *(_DWORD *)&v23[4] = v8;
        *(_WORD *)&v23[8] = 2112;
        *(void *)&v23[10] = v14;
        v15 = "Encountered sqlite error: %d\n error description: %@";
        v18 = v13;
        uint32_t v19 = 18;
LABEL_14:
        _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, v15, v23, v19);

        goto LABEL_15;
      }
    }
    goto LABEL_15;
  }
  storageManagement = self->_storageManagement;
  v13 = TRILogCategory_Server();
  BOOL v17 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (!storageManagement)
  {
    if (v17)
    {
      objc_super v14 = [v10 localizedDescription];
      *(_DWORD *)v23 = 138412290;
      *(void *)&v23[4] = v14;
      v15 = "Encountered SQLITE_CORRUPT error. Unable to request trial storage reset due to no storage management.\n"
            " error description: %@";
      goto LABEL_13;
    }
LABEL_15:

    goto LABEL_16;
  }
  if (v17)
  {
    v22 = [v10 localizedDescription];
    *(_DWORD *)v23 = 138412290;
    *(void *)&v23[4] = v22;
    _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Encountered SQLITE_CORRUPT error. Requesting trial storage reset on next launch.\n error description: %@", v23, 0xCu);
  }
  [(TRIStorageManagementProtocol *)self->_storageManagement requestTrialStorageResetOnNextLaunch];
LABEL_16:
  char v20 = -[_PASSqliteErrorHandlerProtocol handleSqliteError:error:onError:db:](self->_defaultErrorHandler, "handleSqliteError:error:onError:db:", v8, v10, v11, v12, *(_OWORD *)v23, *(void *)&v23[16], v24);

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageManagement, 0);
  objc_storeStrong((id *)&self->_defaultErrorHandler, 0);
}

@end