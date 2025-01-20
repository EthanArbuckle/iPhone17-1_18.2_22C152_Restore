@interface ML3DatabaseBlob
- (ML3DatabaseBlob)init;
- (ML3DatabaseBlob)initWithSQLiteHandle:(sqlite3_blob *)a3;
- (id)data;
- (int)readData:(id)a3 numberOfBytes:(unint64_t)a4 offset:(unint64_t)a5;
- (int)writeData:(id)a3 numberOfBytes:(unint64_t)a4 offset:(unint64_t)a5;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation ML3DatabaseBlob

- (id)data
{
  unint64_t v3 = [(ML3DatabaseBlob *)self length];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v3];
  int v5 = [(ML3DatabaseBlob *)self readData:v4 numberOfBytes:v3 offset:0];
  id v6 = 0;
  if (!v5) {
    id v6 = v4;
  }

  return v6;
}

- (int)writeData:(id)a3 numberOfBytes:(unint64_t)a4 offset:(unint64_t)a5
{
  int v5 = a5;
  int v6 = a4;
  sqliteHandle = self->_sqliteHandle;
  v8 = (const void *)[a3 bytes];

  return sqlite3_blob_write(sqliteHandle, v8, v6, v5);
}

- (int)readData:(id)a3 numberOfBytes:(unint64_t)a4 offset:(unint64_t)a5
{
  int v5 = a5;
  id v8 = a3;
  [v8 setLength:a4];
  sqliteHandle = self->_sqliteHandle;
  id v10 = v8;
  v11 = (void *)[v10 mutableBytes];

  return sqlite3_blob_read(sqliteHandle, v11, a4, v5);
}

- (unint64_t)length
{
  unint64_t result = (unint64_t)self->_sqliteHandle;
  if (result) {
    return sqlite3_blob_bytes((sqlite3_blob *)result);
  }
  return result;
}

- (void)dealloc
{
  sqliteHandle = self->_sqliteHandle;
  if (sqliteHandle) {
    sqlite3_blob_close(sqliteHandle);
  }
  v4.receiver = self;
  v4.super_class = (Class)ML3DatabaseBlob;
  [(ML3DatabaseBlob *)&v4 dealloc];
}

- (ML3DatabaseBlob)initWithSQLiteHandle:(sqlite3_blob *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ML3DatabaseBlob;
  unint64_t result = [(ML3DatabaseBlob *)&v5 init];
  if (result) {
    result->_sqliteHandle = a3;
  }
  return result;
}

- (ML3DatabaseBlob)init
{
  return 0;
}

@end