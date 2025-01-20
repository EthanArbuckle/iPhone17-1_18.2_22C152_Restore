@interface ML3DatabaseOperation
+ (id)databaseOperationForType:(unint64_t)a3 withLibrary:(id)a4 writer:(id)a5;
- (BOOL)_execute:(id *)a3;
- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3;
- (BOOL)success;
- (ML3ActiveTransaction)transaction;
- (ML3Client)originatingClient;
- (ML3DatabaseOperation)initWithLibrary:(id)a3 writer:(id)a4;
- (ML3MusicLibrary)library;
- (NSDictionary)attributes;
- (NSDictionary)options;
- (NSError)error;
- (id)_operationTypeDescription;
- (id)description;
- (unint64_t)type;
- (void)main;
- (void)setAttributes:(id)a3;
- (void)setError:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOriginatingClient:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation ML3DatabaseOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_originatingClient, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_destroyWeak((id *)&self->_writer);
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setAttributes:(id)a3
{
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOriginatingClient:(id)a3
{
}

- (ML3Client)originatingClient
{
  return self->_originatingClient;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)_operationTypeDescription
{
  unint64_t v2 = [(ML3DatabaseOperation *)self type];
  if (v2 - 1 > 8) {
    return @"<Unknown Write Operation Type>";
  }
  else {
    return off_1E5FB7438[v2 - 1];
  }
}

- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3
{
  v5 = [(ML3DatabaseOperation *)self attributes];

  if (v5)
  {
    v6 = [(ML3DatabaseOperation *)self library];

    if (v6)
    {
      v7 = [(ML3DatabaseOperation *)self transaction];

      if (v7)
      {
        id v8 = 0;
        goto LABEL_12;
      }
      v12 = @"Operation does not have a transaction set.";
    }
    else
    {
      v12 = @"Operation does not have library reference.";
    }
    id v8 = +[ML3MediaLibraryWriter writerErrorWithCode:600 description:v12];
    if (!a3) {
      goto LABEL_12;
    }
  }
  else
  {
    v9 = NSString;
    v10 = [(ML3DatabaseOperation *)self _operationTypeDescription];
    v11 = [v9 stringWithFormat:@"Missing attributes for operation type: %@", v10];

    id v8 = +[ML3MediaLibraryWriter writerErrorWithCode:500 description:v11];

    if (!a3) {
      goto LABEL_12;
    }
  }
  if (v8)
  {
    id v8 = v8;
    *a3 = v8;
  }
LABEL_12:

  return v8 == 0;
}

- (void)setError:(id)a3
{
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)_execute:(id *)a3
{
  return 0;
}

- (ML3ActiveTransaction)transaction
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  transaction = self->_transaction;
  if (!transaction)
  {
    v4 = [(ML3DatabaseOperation *)self options];
    v5 = [v4 objectForKey:@"MLDatabaseOperationOptionTransactionIdentifierKey"];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
    v7 = WeakRetained;
    if (v5)
    {
      id v8 = [WeakRetained _transactionForIdentifier:v5];
      v9 = self->_transaction;
      self->_transaction = v8;
    }
    if (!self->_transaction)
    {
      v10 = [(ML3DatabaseOperation *)self options];
      v11 = [v10 objectForKey:@"MLDatabaseOperationOptionReadOnlyKey"];
      int v12 = [v11 BOOLValue];

      if (v12) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 0;
      }
      library = self->_library;
      v15 = +[ML3Client daemonClient];
      id v22 = 0;
      v16 = [v7 beginTransactionForLibrary:library withClient:v15 options:v13 error:&v22];
      id v17 = v22;
      v18 = self->_transaction;
      self->_transaction = v16;

      [(ML3ActiveTransaction *)self->_transaction setInUseByOperation:1];
      if (self->_transaction)
      {
        self->_beganNewTransaction = 1;
      }
      else
      {
        v19 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v24 = self;
          __int16 v25 = 2114;
          id v26 = v17;
          _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_ERROR, "Error creating new transaction for operation %{public}@. %{public}@", buf, 0x16u);
        }

        [(ML3DatabaseOperation *)self setError:v17];
      }
    }
    transaction = self->_transaction;
  }
  [(ML3ActiveTransaction *)transaction updateLastUsed];
  v20 = self->_transaction;

  return v20;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ML3DatabaseOperation *)self _operationTypeDescription];
  v6 = [v3 stringWithFormat:@"<%@ %p operationType = %@, attributes = %@>", v4, self, v5, self->_attributes];

  return v6;
}

- (void)main
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v14 = 0;
  uint64_t v3 = [(ML3DatabaseOperation *)self _verifyLibraryConnectionAndAttributesProperties:&v14];
  id v4 = v14;
  v5 = v4;
  if (v3)
  {
    id v13 = v4;
    uint64_t v3 = [(ML3DatabaseOperation *)self _execute:&v13];
    id v6 = v13;

    if (v3)
    {
      if ([(ML3DatabaseOperation *)self isCancelled])
      {
        v5 = +[ML3MediaLibraryWriter writerErrorWithCode:400 description:@"Operation cancelled."];

        uint64_t v3 = 0;
        goto LABEL_7;
      }
      uint64_t v3 = 1;
    }
    v5 = v6;
  }
LABEL_7:
  if (self->_beganNewTransaction)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
    id v8 = [(ML3ActiveTransaction *)self->_transaction identifier];
    id v12 = v5;
    uint64_t v3 = [WeakRetained endTransaction:v8 shouldCommit:v3 error:&v12];
    id v9 = v12;

    if ((v3 & 1) == 0)
    {
      v10 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v16 = self;
        __int16 v17 = 2114;
        id v18 = v9;
        _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "Failed to end transaction for operation %{public}@. %{public}@", buf, 0x16u);
      }
    }
    transaction = self->_transaction;
    self->_transaction = 0;
  }
  else
  {
    id v9 = v5;
  }
  [(ML3DatabaseOperation *)self setSuccess:v3];
  [(ML3DatabaseOperation *)self setError:v9];
}

- (ML3DatabaseOperation)initWithLibrary:(id)a3 writer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3DatabaseOperation;
  id v9 = [(ML3DatabaseOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    v10->_type = 0;
    objc_storeWeak((id *)&v10->_writer, v8);
  }

  return v10;
}

+ (id)databaseOperationForType:(unint64_t)a3 withLibrary:(id)a4 writer:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 - 1 <= 8 && (id v9 = (objc_class *)objc_opt_class()) != 0) {
    v10 = (void *)[[v9 alloc] initWithLibrary:v7 writer:v8];
  }
  else {
    v10 = 0;
  }

  return v10;
}

@end