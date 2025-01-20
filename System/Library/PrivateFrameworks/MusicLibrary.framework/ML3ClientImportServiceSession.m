@interface ML3ClientImportServiceSession
- (BOOL)addTrack:(id)a3 persistentID:(id *)a4;
- (BOOL)begin;
- (BOOL)finish;
- (BOOL)removeTrack:(id)a3 persistentID:(id *)a4;
- (BOOL)updateTrack:(id)a3 persistentID:(id *)a4;
- (ML3ClientImportServiceSession)initWithLibrary:(id)a3 connection:(id)a4 configuration:(id)a5;
- (void)dealloc;
@end

@implementation ML3ClientImportServiceSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_databaseConnection, 0);
}

- (BOOL)removeTrack:(id)a3 persistentID:(id *)a4
{
  id v4 = a3;
  operator new();
}

- (BOOL)updateTrack:(id)a3 persistentID:(id *)a4
{
  id v4 = a3;
  operator new();
}

- (BOOL)addTrack:(id)a3 persistentID:(id *)a4
{
  id v4 = a3;
  operator new();
}

- (BOOL)finish
{
  importSession = (ML3ImportSession *)self->_importSession;
  int v3 = ML3ImportSession::flush(importSession, 1);
  if (v3) {
    ML3ImportSession::_finishImport((id *)importSession);
  }
  return v3;
}

- (BOOL)begin
{
  importSession = (ML3ImportSession *)self->_importSession;
  int v3 = [(ML3ClientImportSessionConfiguration *)self->_configuration operationCount];

  return ML3ImportSession::begin(importSession, v3, 0, 0);
}

- (void)dealloc
{
  importSession = self->_importSession;
  if (importSession)
  {
    (*(void (**)(void *, SEL))(*(void *)importSession + 8))(importSession, a2);
    self->_importSession = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ML3ClientImportServiceSession;
  [(ML3ClientImportServiceSession *)&v4 dealloc];
}

- (ML3ClientImportServiceSession)initWithLibrary:(id)a3 connection:(id)a4 configuration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(ML3ClientImportServiceSession *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_library, a3);
    objc_storeStrong((id *)&v13->_databaseConnection, a4);
    uint64_t v14 = [(ML3ClientImportSessionConfiguration *)v13->_configuration copy];
    configuration = v13->_configuration;
    v13->_configuration = (ML3ClientImportSessionConfiguration *)v14;

    operator new();
  }

  return 0;
}

@end