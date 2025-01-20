@interface ML3DatabaseException
+ (id)databaseExceptionWithReason:(id)a3 sqliteError:(id)a4;
- (ML3DatabaseException)init;
- (ML3DatabaseException)initWithReason:(id)a3 sqliteError:(id)a4;
- (NSError)sqliteError;
- (void)_SQLITE_ABORT;
- (void)_SQLITE_AUTH;
- (void)_SQLITE_BUSY;
- (void)_SQLITE_CANTOPEN;
- (void)_SQLITE_CONSTRAINT;
- (void)_SQLITE_CORRUPT;
- (void)_SQLITE_DONE;
- (void)_SQLITE_EMPTY;
- (void)_SQLITE_ERROR;
- (void)_SQLITE_FORMAT;
- (void)_SQLITE_FULL;
- (void)_SQLITE_INTERNAL;
- (void)_SQLITE_INTERRUPT;
- (void)_SQLITE_IOERR;
- (void)_SQLITE_LOCKED;
- (void)_SQLITE_MISMATCH;
- (void)_SQLITE_MISUSE;
- (void)_SQLITE_NOLFS;
- (void)_SQLITE_NOMEM;
- (void)_SQLITE_NOTADB;
- (void)_SQLITE_NOTFOUND;
- (void)_SQLITE_PERM;
- (void)_SQLITE_PROTOCOL;
- (void)_SQLITE_RANGE;
- (void)_SQLITE_READONLY;
- (void)_SQLITE_ROW;
- (void)_SQLITE_SCHEMA;
- (void)_SQLITE_TOOBIG;
- (void)raise;
@end

@implementation ML3DatabaseException

- (void).cxx_destruct
{
}

- (NSError)sqliteError
{
  return self->_sqliteError;
}

- (void)_SQLITE_DONE
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_ROW
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_NOTADB
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_RANGE
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_FORMAT
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_AUTH
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_NOLFS
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_MISUSE
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_MISMATCH
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_CONSTRAINT
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_TOOBIG
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_SCHEMA
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_EMPTY
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_PROTOCOL
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_CANTOPEN
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_FULL
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_NOTFOUND
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_CORRUPT
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_IOERR
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_INTERRUPT
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_READONLY
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_NOMEM
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_LOCKED
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_BUSY
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_ABORT
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_PERM
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_INTERNAL
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)_SQLITE_ERROR
{
  v2.receiver = self;
  v2.super_class = (Class)ML3DatabaseException;
  [(MLException *)&v2 raise];
}

- (void)raise
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v15[0] = 1;
  v16 = sel__SQLITE_ERROR;
  int v17 = 2;
  v18 = sel__SQLITE_INTERNAL;
  int v19 = 3;
  v20 = sel__SQLITE_PERM;
  int v21 = 4;
  v22 = sel__SQLITE_ABORT;
  int v23 = 5;
  v24 = sel__SQLITE_BUSY;
  int v25 = 6;
  v26 = sel__SQLITE_LOCKED;
  int v27 = 7;
  v28 = sel__SQLITE_NOMEM;
  int v29 = 8;
  v30 = sel__SQLITE_READONLY;
  int v31 = 9;
  v32 = sel__SQLITE_INTERRUPT;
  int v33 = 10;
  v34 = sel__SQLITE_IOERR;
  int v35 = 11;
  v36 = sel__SQLITE_CORRUPT;
  int v37 = 12;
  v38 = sel__SQLITE_NOTFOUND;
  int v39 = 13;
  v40 = sel__SQLITE_FULL;
  int v41 = 14;
  v42 = sel__SQLITE_CANTOPEN;
  int v43 = 15;
  v44 = sel__SQLITE_PROTOCOL;
  int v45 = 16;
  v46 = sel__SQLITE_EMPTY;
  int v47 = 17;
  v48 = sel__SQLITE_SCHEMA;
  int v49 = 18;
  v50 = sel__SQLITE_TOOBIG;
  int v51 = 19;
  v52 = sel__SQLITE_CONSTRAINT;
  int v53 = 20;
  v54 = sel__SQLITE_MISMATCH;
  int v55 = 21;
  v56 = sel__SQLITE_MISUSE;
  int v57 = 22;
  v58 = sel__SQLITE_NOLFS;
  int v59 = 23;
  v60 = sel__SQLITE_AUTH;
  int v61 = 24;
  v62 = sel__SQLITE_FORMAT;
  int v63 = 25;
  v64 = sel__SQLITE_RANGE;
  int v65 = 26;
  v66 = sel__SQLITE_NOTADB;
  int v67 = 100;
  v68 = sel__SQLITE_ROW;
  int v69 = 101;
  v70 = sel__SQLITE_DONE;
  NSInteger v3 = [(NSError *)self->_sqliteError code];
  NSInteger v4 = v3;
  uint64_t v5 = 0;
  v6 = v15;
  while (1)
  {
    uint64_t v7 = *v6;
    v6 += 4;
    if (v3 == v7) {
      break;
    }
    if (++v5 == 28) {
      goto LABEL_9;
    }
  }
  v8 = &v15[4 * v5];
  uint64_t v9 = *((void *)v8 + 1);
  if (!v9)
  {
LABEL_9:
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      NSInteger v14 = v4;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "No helper method can be found for SQLite error code %ld.", buf, 0xCu);
    }

    v12.receiver = self;
    v12.super_class = (Class)ML3DatabaseException;
    [(MLException *)&v12 raise];
    return;
  }
  v10 = (void (*)(ML3DatabaseException *, uint64_t))[(ML3DatabaseException *)self methodForSelector:*((void *)v8 + 1)];

  v10(self, v9);
}

- (ML3DatabaseException)init
{
  NSInteger v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  uint64_t v5 = NSStringFromSelector(a2);
  v6 = NSStringFromSelector(sel_initWithReason_sqliteError_);
  [v3 raise:v4, @"%@ is invalid. Use %@.", v5, v6 format];

  return 0;
}

- (ML3DatabaseException)initWithReason:(id)a3 sqliteError:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v15 = @"ML3DatabaseExceptionErrorUserInfoKey";
    v16[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *MEMORY[0x1E4F1C3B8];
  v14.receiver = self;
  v14.super_class = (Class)ML3DatabaseException;
  v11 = [(ML3DatabaseException *)&v14 initWithName:v10 reason:v6 userInfo:v9];
  objc_super v12 = v11;
  if (v11) {
    objc_storeStrong((id *)&v11->_sqliteError, a4);
  }

  return v12;
}

+ (id)databaseExceptionWithReason:(id)a3 sqliteError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithReason:v6 sqliteError:v5];

  return v7;
}

@end