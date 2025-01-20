@interface ML3ActiveTransaction
- (BOOL)inUseByOperation;
- (BOOL)isReadOnly;
- (BOOL)terminable;
- (ML3ActiveTransaction)init;
- (ML3ActiveTransaction)initWithLibrary:(id)a3 connection:(id)a4 client:(id)a5;
- (ML3Client)client;
- (ML3DatabaseConnection)connection;
- (ML3MusicLibrary)library;
- (NSUUID)identifier;
- (double)lastUsedTime;
- (id)_relinquishConnection;
- (id)debugDescription;
- (id)description;
- (void)lock;
- (void)setInUseByOperation:(BOOL)a3;
- (void)setLastUsedTime:(double)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setTerminable:(BOOL)a3;
- (void)unlock;
- (void)updateLastUsed;
@end

@implementation ML3ActiveTransaction

- (ML3Client)client
{
  return self->_client;
}

- (void)unlock
{
}

- (void)lock
{
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (id)_relinquishConnection
{
  v3 = self->_connection;
  connection = self->_connection;
  self->_connection = 0;

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setTerminable:(BOOL)a3
{
  self->_terminable = a3;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (ML3ActiveTransaction)initWithLibrary:(id)a3 connection:(id)a4 client:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"ML3ActiveTransaction.m" lineNumber:32 description:@"Tried to create a transaction object with a nil connection."];

    if (v10) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2 object:self file:@"ML3ActiveTransaction.m" lineNumber:33 description:@"Tried to create a transaction object without a library."];

LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)ML3ActiveTransaction;
  v13 = [(ML3ActiveTransaction *)&v28 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_library, a3);
    objc_storeStrong((id *)&v14->_client, a5);
    objc_storeStrong((id *)&v14->_connection, a4);
    v15 = [(ML3DatabaseConnection *)v14->_connection currentTransactionID];
    v16 = v15;
    if (v15) {
      v17 = v15;
    }
    else {
      v17 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    }
    identifier = v14->_identifier;
    v14->_identifier = v17;

    v14->_terminable = 1;
    v19 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v14->_lock;
    v14->_lock = v19;

    id v21 = objc_alloc(MEMORY[0x1E4F77A50]);
    v22 = [NSString stringWithFormat:@"Database transaction %@", v14->_identifier];
    uint64_t v23 = [v21 initWithName:v22];
    xpcTransaction = v14->_xpcTransaction;
    v14->_xpcTransaction = (MSVXPCTransaction *)v23;

    [(MSVXPCTransaction *)v14->_xpcTransaction beginTransaction];
    [(ML3ActiveTransaction *)v14 updateLastUsed];
  }
  return v14;
}

- (ML3DatabaseConnection)connection
{
  [(ML3ActiveTransaction *)self updateLastUsed];
  connection = self->_connection;

  return connection;
}

- (void)updateLastUsed
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_lastUsedTime = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_xpcTransaction, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void)setInUseByOperation:(BOOL)a3
{
  self->_inUseByOperation = a3;
}

- (BOOL)inUseByOperation
{
  return self->_inUseByOperation;
}

- (BOOL)terminable
{
  return self->_terminable;
}

- (void)setLastUsedTime:(double)a3
{
  self->_lastUsedTime = a3;
}

- (double)lastUsedTime
{
  return self->_lastUsedTime;
}

- (id)debugDescription
{
  uint64_t v3 = [(ML3Client *)self->_client processID];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = [(NSUUID *)self->_identifier UUIDString];
  if (self->_readOnly) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = [(ML3Client *)self->_client bundleID];
  v9 = [(ML3DatabaseConnection *)self->_connection debugDescription];
  id v10 = [v4 stringWithFormat:@"<%@ %p\n\tidentifier:             %@\n\treadonly:               %@\n\toriginating process:    %@ [%d]\n\tconnection:             %@\n\tlast used time:         %f", v5, self, v6, v7, v8, v3, v9, *(void *)&self->_lastUsedTime];

  return v10;
}

- (id)description
{
  uint64_t v3 = [(ML3Client *)self->_client processID];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = [(NSUUID *)self->_identifier UUIDString];
  if (self->_readOnly) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = [(ML3Client *)self->_client bundleID];
  v9 = [v4 stringWithFormat:@"<%@ %p\n\tidentifier:             %@\n\treadonly:               %@\n\toriginating process:    %@ [%d]\n\tconnection:             %@\n\tlast used time:         %f", v5, self, v6, v7, v8, v3, self->_connection, *(void *)&self->_lastUsedTime];

  return v9;
}

- (ML3ActiveTransaction)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  uint64_t v5 = NSStringFromSelector(a2);
  v6 = NSStringFromSelector(sel_initWithLibrary_connection_client_);
  [v3 raise:v4, @"%@ is invalid. use %@ instead", v5, v6 format];

  return 0;
}

@end