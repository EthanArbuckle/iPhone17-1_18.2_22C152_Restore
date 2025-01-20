@interface ML3ImportOperation
+ (id)importOperationWithSourceType:(unint64_t)a3 databaseImport:(id)a4;
- (BOOL)isSuspended;
- (BOOL)success;
- (ML3ImportOperation)init;
- (ML3ImportOperation)initWithDatabaseImport:(id)a3;
- (ML3ServiceDatabaseImport)import;
- (NSData)returnData;
- (NSError)error;
- (float)progress;
- (id)_clientCompletionHandler;
- (id)longDescription;
- (id)progressBlock;
- (unint64_t)importSource;
- (void)_setClientCompletionHandler:(id)a3;
- (void)_writerTransactionWithBlock:(id)a3;
- (void)main;
- (void)setError:(id)a3;
- (void)setProgress:(float)a3;
- (void)setProgressBlock:(id)a3;
- (void)setReturnData:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation ML3ImportOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_import, 0);

  objc_storeStrong(&self->_clientCompletionHandler, 0);
}

- (NSData)returnData
{
  return self->_returnData;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setProgressBlock:(id)a3
{
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (float)progress
{
  return self->_progress;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (ML3ServiceDatabaseImport)import
{
  return self->_import;
}

- (void)_setClientCompletionHandler:(id)a3
{
  id v6 = a3;
  v4 = (void *)[v6 copy];
  id clientCompletionHandler = self->_clientCompletionHandler;
  self->_id clientCompletionHandler = v4;
}

- (id)_clientCompletionHandler
{
  v2 = (void *)MEMORY[0x1B3E93EE0](self->_clientCompletionHandler, a2);

  return v2;
}

- (void)_writerTransactionWithBlock:(id)a3
{
  v4 = (uint64_t (**)(id, void *, id))a3;
  v5 = [(ML3ServiceDatabaseImport *)self->_import writer];
  id v6 = +[ML3Client daemonClient];
  v7 = [(ML3ServiceDatabaseImport *)self->_import library];
  id v13 = 0;
  v8 = [v5 beginTransactionForLibrary:v7 withClient:v6 options:1 error:&v13];
  id v9 = v13;

  v10 = [v8 connection];
  [v10 _setCloseConnectionWhenCheckingIn];

  [v8 setInUseByOperation:1];
  uint64_t v11 = v4[2](v4, v8, v9);
  [v8 updateLastUsed];
  [v8 setInUseByOperation:0];
  v12 = [v8 identifier];
  [v5 endTransaction:v12 shouldCommit:v11 error:0];
}

- (void)setReturnData:(id)a3
{
  objc_storeStrong((id *)&self->_returnData, a3);
}

- (void)setError:(id)a3
{
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
  v5 = [(ML3ImportOperation *)self progressBlock];

  if (v5)
  {
    id v6 = [(ML3ImportOperation *)self progressBlock];
    v6[2](a3);
  }
}

- (void)main
{
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "Warning: Empty import operation started.", v4, 2u);
  }

  [(ML3ImportOperation *)self setSuccess:1];
}

- (id)longDescription
{
  v3 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)ML3ImportOperation;
  v4 = [(ML3ImportOperation *)&v17 description];
  v5 = [(ML3ServiceDatabaseImport *)self->_import writer];
  id v6 = [(ML3ServiceDatabaseImport *)self->_import library];
  v7 = [(ML3DatabaseImport *)self->_import trackData];
  uint64_t v8 = [v7 length];
  BOOL success = self->_success;
  error = self->_error;
  int v11 = [(ML3ImportOperation *)self isCancelled];
  v12 = @"YES";
  if (success) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  if (v11) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  if (!self->_suspended) {
    v12 = @"NO";
  }
  v15 = [v3 stringWithFormat:@"%@:\n\twriter:             %p\n\tlibrary:            %@\n\timport data size:   %lu\n\tsuccess:            %@\n\terror:              %@\n\n\tcancelled:          %@\n\tsuspended:          %@\n", v4, v5, v6, v8, v13, error, v14, v12];

  return v15;
}

- (unint64_t)importSource
{
  return 0;
}

- (ML3ImportOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = objc_opt_class();
  v5 = NSStringFromSelector(sel_initWithDatabaseImport_);
  [v3 raise:*MEMORY[0x1E4F1C3A8], @"You must provide %@ with a database import. Use %@ instead.", v4, v5 format];

  return 0;
}

- (ML3ImportOperation)initWithDatabaseImport:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ML3ImportOperation.mm", 73, @"Invalid parameter not satisfying: %@", @"import" object file lineNumber description];
  }
  v7 = [v6 writer];

  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"ML3ImportOperation.mm", 74, @"Invalid parameter not satisfying: %@", @"import.writer" object file lineNumber description];
  }
  uint64_t v8 = [v6 library];

  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"ML3ImportOperation.mm", 75, @"Invalid parameter not satisfying: %@", @"import.library" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)ML3ImportOperation;
  id v9 = [(ML3ImportOperation *)&v15 init];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_import, a3);
  }

  return v10;
}

+ (id)importOperationWithSourceType:(unint64_t)a3 databaseImport:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"ML3ImportOperation.mm", 33, @"Invalid parameter not satisfying: %@", @"import" object file lineNumber description];
  }
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDatabaseImport:v6];

  return v7;
}

@end