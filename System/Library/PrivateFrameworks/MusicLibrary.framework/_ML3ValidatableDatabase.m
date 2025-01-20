@interface _ML3ValidatableDatabase
- (BOOL)currentQueueIsValidationQueue;
- (NSString)databasePath;
- (OS_dispatch_queue)validationSerialQueue;
- (_ML3ValidatableDatabase)init;
- (_ML3ValidatableDatabase)initWithDatabasePath:(id)a3;
- (unint64_t)validationState;
- (void)setDatabasePath:(id)a3;
- (void)setValidationSerialQueue:(id)a3;
- (void)setValidationState:(unint64_t)a3;
@end

@implementation _ML3ValidatableDatabase

- (_ML3ValidatableDatabase)initWithDatabasePath:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_ML3ValidatableDatabase;
  id v5 = [(_ML3ValidatableDatabase *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    *((void *)v5 + 3) = 0;
    id v8 = [v4 lastPathComponent];
    __sprintf_chk(label, 0, 0x100uLL, "com.apple.MusicLibrary.ValidationQueue.%s", (const char *)[v8 UTF8String]);

    dispatch_queue_t v9 = dispatch_queue_create(label, 0);
    v10 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v9;

    v11 = (void *)[v5 hash];
    *((void *)v5 + 1) = v11;
    dispatch_queue_set_specific(*((dispatch_queue_t *)v5 + 4), "com.apple.MusicLibrary._ML3ValidationQueueIdentifierKey", v11, 0);
  }

  return (_ML3ValidatableDatabase *)v5;
}

- (void)setValidationState:(unint64_t)a3
{
  self->_validationState = a3;
}

- (unint64_t)validationState
{
  return self->_validationState;
}

- (OS_dispatch_queue)validationSerialQueue
{
  return self->_validationSerialQueue;
}

- (BOOL)currentQueueIsValidationQueue
{
  return self->_queueID == (void)dispatch_get_specific("com.apple.MusicLibrary._ML3ValidationQueueIdentifierKey");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationSerialQueue, 0);

  objc_storeStrong((id *)&self->_databasePath, 0);
}

- (void)setValidationSerialQueue:(id)a3
{
}

- (void)setDatabasePath:(id)a3
{
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (_ML3ValidatableDatabase)init
{
  return 0;
}

@end