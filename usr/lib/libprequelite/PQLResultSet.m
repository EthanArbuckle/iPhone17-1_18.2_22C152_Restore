@interface PQLResultSet
- (BOOL)BOOLAtIndex:(int)a3;
- (BOOL)_next:(BOOL)a3;
- (BOOL)isNullAtIndex:(int)a3;
- (BOOL)next;
- (NSError)error;
- (NSSet)defaultUnarchivingAllowedClasses;
- (PQLConnection)db;
- (PQLResultSet)initWithStatement:(id)a3 usingDatabase:(id)a4 preparationTime:(unint64_t)a5;
- (char)charAtIndex:(int)a3;
- (const)UTF8StringAtIndex:(int)a3;
- (double)doubleAtIndex:(int)a3;
- (float)floatAtIndex:(int)a3;
- (id)columnNameAtIndex:(int)a3;
- (id)dataAtIndex:(int)a3;
- (id)dataAtIndex:(int)a3 noCopy:(BOOL)a4;
- (id)dateAtIndex:(int)a3;
- (id)description;
- (id)enumerateObjects:(id)a3;
- (id)enumerateObjectsOfClass:(Class)a3;
- (id)enumerateObjectsOfClass:(Class)a3 initializer:(SEL)a4;
- (id)nextObject;
- (id)numberAtIndex:(int)a3;
- (id)object:(id)a3;
- (id)objectAtIndex:(int)a3;
- (id)objectOfClass:(Class)a3;
- (id)objectOfClass:(Class)a3 atIndex:(int)a4;
- (id)objectOfClass:(Class)a3 initializer:(SEL)a4;
- (id)onlyObject:(id)a3;
- (id)onlyObjectOfClass:(Class)a3;
- (id)onlyObjectOfClass:(Class)a3 initializer:(SEL)a4;
- (id)plistAtIndex:(int)a3;
- (id)stringAtIndex:(int)a3;
- (id)unarchivedObjectOfClass:(Class)a3 atIndex:(int)a4;
- (id)unarchivedObjectOfClasses:(id)a3 atIndex:(int)a4;
- (id)uuidAtIndex:(int)a3;
- (int)intAtIndex:(int)a3;
- (int64_t)integerAtIndex:(int)a3;
- (int64_t)longAtIndex:(int)a3;
- (int64_t)longLongAtIndex:(int)a3;
- (signed)shortAtIndex:(int)a3;
- (sqlite3_stmt)stmt;
- (unint64_t)columns;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)rowNumber;
- (unint64_t)unsignedIntegerAtIndex:(int)a3;
- (unint64_t)unsignedLongAtIndex:(int)a3;
- (unint64_t)unsignedLongLongAtIndex:(int)a3;
- (unsigned)unsignedCharAtIndex:(int)a3;
- (unsigned)unsignedIntAtIndex:(int)a3;
- (unsigned)unsignedShortAtIndex:(int)a3;
- (void)close;
- (void)dealloc;
- (void)setDefaultUnarchivingAllowedClasses:(id)a3;
@end

@implementation PQLResultSet

- (int64_t)longAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (BOOL)next
{
  return [(PQLResultSet *)self _next:0];
}

- (unint64_t)columns
{
  return self->_columns;
}

- (int64_t)longLongAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (unsigned)unsignedIntAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (BOOL)BOOLAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3) != 0;
}

- (id)stringAtIndex:(int)a3
{
  v3 = (void *)[NSString newFromSqliteStatement:self->_stmt->_stmt atIndex:*(void *)&a3];

  return v3;
}

- (id)dataAtIndex:(int)a3
{
  v3 = (void *)[MEMORY[0x1E4F1C9B8] newFromSqliteStatement:self->_stmt->_stmt atIndex:*(void *)&a3];

  return v3;
}

- (BOOL)isNullAtIndex:(int)a3
{
  return sqlite3_column_type(self->_stmt->_stmt, a3) == 5;
}

- (BOOL)_next:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PQLConnection *)self->_db serialQueue];
  if (!self->_stmt) {
    goto LABEL_18;
  }
  db = self->_db;
  if (!db) {
    goto LABEL_18;
  }
  if (v5) {
    [(PQLConnection *)db assertOnQueue];
  }
  uint64_t v7 = mach_absolute_time();
  int v8 = sqlite3_step(self->_stmt->_stmt);
  self->_executionTime += mach_absolute_time() - v7;
  if (v8 == 101)
  {
    if (v3)
    {
      v10 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:12 andMessage:@"no result found"];
      error = self->_error;
      self->_error = v10;
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (v8 != 100)
  {
    [MEMORY[0x1E4F28C58] errorForDB:-[PQLConnection dbHandle](self->_db, "dbHandle") stmt:self->_stmt->_stmt];
    v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    v13 = self->_error;
    self->_error = v12;

    if (self->_inTransaction && sqlite3_get_autocommit([(PQLConnection *)self->_db dbHandle]))
    {
      uint64_t v14 = [(PQLConnection *)self->_db autoRollbackHandler];
LABEL_15:
      error = (NSError *)v14;
      (*(void (**)(uint64_t, PQLConnection *, PQLStatement *, NSError *))(v14 + 16))(v14, self->_db, self->_stmt, self->_error);
      goto LABEL_16;
    }
    v15 = [(PQLConnection *)self->_db sqliteErrorHandler];

    if (v15)
    {
      uint64_t v14 = [(PQLConnection *)self->_db sqliteErrorHandler];
      goto LABEL_15;
    }
LABEL_17:
    [(PQLResultSet *)self close];
LABEL_18:
    BOOL v9 = 0;
    goto LABEL_19;
  }
  ++self->_rowNumber;
  BOOL v9 = 1;
LABEL_19:

  return v9;
}

- (void)dealloc
{
  [(PQLResultSet *)self close];
  error = self->_error;
  self->_error = 0;

  v4.receiver = self;
  v4.super_class = (Class)PQLResultSet;
  [(PQLResultSet *)&v4 dealloc];
}

- (void)close
{
  [(PQLStatement *)self->_stmt unbindForDB:self->_db returnedRows:self->_rowNumber executionTime:self->_executionTime preparationTime:self->_preparationTime];
  stmt = self->_stmt;
  self->_stmt = 0;

  db = self->_db;
  self->_db = 0;

  id lastEnumeratedObject = self->_lastEnumeratedObject;
  self->_id lastEnumeratedObject = 0;
}

- (PQLResultSet)initWithStatement:(id)a3 usingDatabase:(id)a4 preparationTime:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PQLResultSet;
  v11 = [(PQLResultSet *)&v16 init];
  v12 = v11;
  if (v11)
  {
    if (v9)
    {
      objc_storeStrong((id *)&v11->_stmt, a3);
      v12->_columns = sqlite3_column_count(v12->_stmt->_stmt);
    }
    else
    {
      uint64_t v13 = [v10 lastError];
      error = v12->_error;
      v12->_error = (NSError *)v13;
    }
    objc_storeStrong((id *)&v12->_db, a4);
    v12->_inTransaction = sqlite3_get_autocommit((sqlite3 *)[v10 dbHandle]) == 0;
    v12->_executionTime = 0;
    v12->_preparationTime = a5;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_defaultUnarchivingAllowedClasses, 0);
  objc_storeStrong(&self->_lastEnumeratedObject, 0);
  objc_storeStrong(&self->_objectsConstructor, 0);

  objc_storeStrong((id *)&self->_stmt, 0);
}

- (unint64_t)unsignedLongAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (unint64_t)unsignedLongLongAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (int64_t)integerAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (id)onlyObjectOfClass:(Class)a3 initializer:(SEL)a4
{
  if ([(PQLResultSet *)self _next:1])
  {
    uint64_t v7 = self;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __createObjectFromResultSetWithSel_block_invoke;
    objc_super v16 = &unk_1E6CAFB50;
    SEL v18 = a4;
    int v8 = v7;
    v17 = v8;
    Class v19 = a3;
    id v20 = 0;
    id v9 = __createObjectFromResultSetWithSel_block_invoke((uint64_t)&v13, v8, (uint64_t)&v20);
    id v10 = v20;
    id v11 = v20;
    if (!v9) {
      objc_storeStrong(v8 + 11, v10);
    }
  }
  else
  {
    id v9 = 0;
  }
  [(PQLResultSet *)self close];

  return v9;
}

- (sqlite3_stmt)stmt
{
  stmt = self->_stmt;
  if (stmt) {
    return stmt->_stmt;
  }
  else {
    return 0;
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id lastEnumeratedObject = self->_lastEnumeratedObject;
  self->_id lastEnumeratedObject = 0;

  if (!a3->var0) {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
  }
  a3->var1 = a4;
  id v9 = (void *)MEMORY[0x1E01AB700]();
  id v10 = [(PQLResultSet *)self nextObject];
  id v11 = self->_lastEnumeratedObject;
  self->_id lastEnumeratedObject = v10;

  id v12 = self->_lastEnumeratedObject;
  if (v12)
  {
    *a4 = v12;
    ++a3->var0;
    return 1;
  }
  else
  {
    [(PQLResultSet *)self close];
    return 0;
  }
}

- (id)onlyObjectOfClass:(Class)a3
{
  if ([(PQLResultSet *)self _next:1])
  {
    v5 = self;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __createObjectFromResultSetWithSel_block_invoke;
    uint64_t v14 = &unk_1E6CAFB50;
    uint64_t v16 = 0;
    v6 = v5;
    v15 = v6;
    Class v17 = a3;
    id v18 = 0;
    uint64_t v7 = __createObjectFromResultSetWithSel_block_invoke((uint64_t)&v11, v6, (uint64_t)&v18);
    id v8 = v18;
    id v9 = v18;
    if (!v7) {
      objc_storeStrong(v6 + 11, v8);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(PQLResultSet *)self close];

  return v7;
}

- (id)onlyObject:(id)a3
{
  objc_super v4 = (void (**)(id, PQLResultSet *, id *))a3;
  if ([(PQLResultSet *)self _next:1])
  {
    v5 = self;
    id v10 = 0;
    v6 = v4[2](v4, v5, &v10);
    id v7 = v10;
    id v8 = v10;
    if (!v6) {
      objc_storeStrong((id *)&v5->_error, v7);
    }
  }
  else
  {
    v6 = 0;
  }
  [(PQLResultSet *)self close];

  return v6;
}

- (id)objectOfClass:(Class)a3
{
  objc_super v4 = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __createObjectFromResultSetWithSel_block_invoke;
  v10[3] = &unk_1E6CAFB50;
  uint64_t v12 = 0;
  v5 = v4;
  uint64_t v11 = v5;
  Class v13 = a3;
  id v14 = 0;
  v6 = __createObjectFromResultSetWithSel_block_invoke((uint64_t)v10, v5, (uint64_t)&v14);
  id v7 = v14;
  id v8 = v14;
  if (!v6) {
    objc_storeStrong(v5 + 11, v7);
  }

  return v6;
}

- (id)objectOfClass:(Class)a3 initializer:(SEL)a4
{
  v6 = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __createObjectFromResultSetWithSel_block_invoke;
  v12[3] = &unk_1E6CAFB50;
  SEL v14 = a4;
  id v7 = v6;
  Class v13 = v7;
  Class v15 = a3;
  id v16 = 0;
  id v8 = __createObjectFromResultSetWithSel_block_invoke((uint64_t)v12, v7, (uint64_t)&v16);
  id v9 = v16;
  id v10 = v16;
  if (!v8) {
    objc_storeStrong(v7 + 11, v9);
  }

  return v8;
}

- (id)object:(id)a3
{
  objc_super v4 = self;
  id v9 = 0;
  v5 = (*((void (**)(id, PQLResultSet *, id *))a3 + 2))(a3, v4, &v9);
  id v6 = v9;
  id v7 = v9;
  if (!v5) {
    objc_storeStrong((id *)&v4->_error, v6);
  }

  return v5;
}

- (id)nextObject
{
  if ([(PQLResultSet *)self _next:0])
  {
    id objectsConstructor = self->_objectsConstructor;
    if (objectsConstructor)
    {
      objc_super v4 = self;
      v5 = (void (**)(id, PQLResultSet *, id *))objectsConstructor;
      v15[0] = 0;
      id v6 = v5[2](v5, v4, v15);
      id v7 = v15[0];
      id v8 = v15[0];
      if (!v6) {
        objc_storeStrong((id *)&v4->_error, v7);
      }
    }
    else
    {
      Class objectsClass = self->_objectsClass;
      if (self->_objectsClassInitializer) {
        SEL objectsClassInitializer = self->_objectsClassInitializer;
      }
      else {
        SEL objectsClassInitializer = 0;
      }
      uint64_t v11 = self;
      v15[0] = (id)MEMORY[0x1E4F143A8];
      v15[1] = (id)3221225472;
      v15[2] = __createObjectFromResultSetWithSel_block_invoke;
      v15[3] = &unk_1E6CAFB50;
      SEL v17 = objectsClassInitializer;
      objc_super v4 = v11;
      id v16 = v4;
      Class v18 = objectsClass;
      id v19 = 0;
      id v6 = __createObjectFromResultSetWithSel_block_invoke((uint64_t)v15, v4, (uint64_t)&v19);
      id v12 = v19;
      id v13 = v19;
      if (!v6) {
        objc_storeStrong((id *)&v4->_error, v12);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_db) {
    v5 = "no";
  }
  else {
    v5 = "yes";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p {stmt: %@; row: %ld; closed:%s}>"];
               v4,
               self,
               self->_stmt,
               self->_rowNumber,
               v5);
}

- (id)columnNameAtIndex:(int)a3
{
  BOOL v3 = NSString;
  uint64_t v4 = sqlite3_column_name(self->_stmt->_stmt, a3);

  return (id)[v3 stringWithUTF8String:v4];
}

- (id)objectOfClass:(Class)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  char v7 = objc_opt_respondsToSelector();
  stmt = self->_stmt;
  if (v7)
  {
    id v9 = (void *)[(objc_class *)a3 newFromSqliteStatement:stmt->_stmt atIndex:v4];
  }
  else
  {
    id v10 = sqlite3_column_value(stmt->_stmt, v4);
    uint64_t v11 = sqlite3_value_dup(v10);
    id v9 = (void *)[(objc_class *)a3 newFromSqliteValue:v11];
    sqlite3_value_free(v11);
  }

  return v9;
}

- (char)charAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (unsigned)unsignedCharAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (signed)shortAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (unsigned)unsignedShortAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (int)intAtIndex:(int)a3
{
  return sqlite3_column_int(self->_stmt->_stmt, a3);
}

- (unint64_t)unsignedIntegerAtIndex:(int)a3
{
  return sqlite3_column_int64(self->_stmt->_stmt, a3);
}

- (float)floatAtIndex:(int)a3
{
  return sqlite3_column_double(self->_stmt->_stmt, a3);
}

- (double)doubleAtIndex:(int)a3
{
  return sqlite3_column_double(self->_stmt->_stmt, a3);
}

- (const)UTF8StringAtIndex:(int)a3
{
  return (const char *)sqlite3_column_text(self->_stmt->_stmt, a3);
}

- (id)numberAtIndex:(int)a3
{
  BOOL v3 = (void *)[NSNumber newFromSqliteStatement:self->_stmt->_stmt atIndex:*(void *)&a3];

  return v3;
}

- (id)dateAtIndex:(int)a3
{
  BOOL v3 = (void *)[MEMORY[0x1E4F1C9C8] newFromSqliteStatement:self->_stmt->_stmt atIndex:*(void *)&a3];

  return v3;
}

- (id)dataAtIndex:(int)a3 noCopy:(BOOL)a4
{
  if (a4)
  {
    if ([(PQLResultSet *)self isNullAtIndex:*(void *)&a3])
    {
      id v6 = 0;
    }
    else
    {
      char v7 = sqlite3_column_blob(self->_stmt->_stmt, a3);
      id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v7 length:sqlite3_column_bytes(self->_stmt->_stmt, a3) freeWhenDone:0];
    }
  }
  else
  {
    id v6 = [(PQLResultSet *)self dataAtIndex:*(void *)&a3];
  }

  return v6;
}

- (id)uuidAtIndex:(int)a3
{
  BOOL v3 = (void *)[MEMORY[0x1E4F29128] newFromSqliteStatement:self->_stmt->_stmt atIndex:*(void *)&a3];

  return v3;
}

- (id)plistAtIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type(self->_stmt->_stmt, a3);
  if ((v5 - 1) < 2)
  {
    id v10 = NSNumber;
LABEL_7:
    id v9 = (void *)[v10 newFromSqliteStatement:self->_stmt->_stmt atIndex:v3];
    goto LABEL_9;
  }
  if (v5 == 3)
  {
    id v10 = NSString;
    goto LABEL_7;
  }
  if (v5 == 4)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    char v7 = sqlite3_column_blob(self->_stmt->_stmt, v3);
    id v8 = [v6 initWithBytesNoCopy:v7 length:sqlite3_column_bytes(self->_stmt->_stmt, v3) freeWhenDone:0];
    id v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:0];
  }
  else
  {
    id v9 = 0;
  }
LABEL_9:

  return v9;
}

- (NSSet)defaultUnarchivingAllowedClasses
{
  defaultUnarchivingAllowedClasses = self->_defaultUnarchivingAllowedClasses;
  if (!defaultUnarchivingAllowedClasses)
  {
    if (_defaultAllowedClasses_once != -1) {
      dispatch_once(&_defaultAllowedClasses_once, &__block_literal_global_0);
    }
    defaultUnarchivingAllowedClasses = (NSSet *)_defaultAllowedClasses_allowedClasses;
  }
  uint64_t v3 = defaultUnarchivingAllowedClasses;

  return v3;
}

- (id)unarchivedObjectOfClass:(Class)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v7 = sqlite3_column_type(self->_stmt->_stmt, a4);
  if ((v7 - 1) < 2)
  {
    id v13 = NSNumber;
LABEL_7:
    id v12 = (void *)[v13 newFromSqliteStatement:self->_stmt->_stmt atIndex:v4];
    goto LABEL_9;
  }
  if (v7 == 3)
  {
    id v13 = NSString;
    goto LABEL_7;
  }
  if (v7 == 4)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    id v9 = sqlite3_column_blob(self->_stmt->_stmt, v4);
    id v10 = [v8 initWithBytesNoCopy:v9 length:sqlite3_column_bytes(self->_stmt->_stmt, v4) freeWhenDone:0];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v10 error:0];
    id v12 = [v11 decodeObjectOfClass:a3 forKey:*MEMORY[0x1E4F284E8]];
  }
  else
  {
    id v12 = 0;
  }
LABEL_9:

  return v12;
}

- (id)unarchivedObjectOfClasses:(id)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int v7 = sqlite3_column_type(self->_stmt->_stmt, v4);
  if ((v7 - 1) < 2)
  {
    id v13 = NSNumber;
LABEL_7:
    id v12 = (void *)[v13 newFromSqliteStatement:self->_stmt->_stmt atIndex:v4];
    goto LABEL_9;
  }
  if (v7 == 3)
  {
    id v13 = NSString;
    goto LABEL_7;
  }
  if (v7 == 4)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    id v9 = sqlite3_column_blob(self->_stmt->_stmt, v4);
    id v10 = [v8 initWithBytesNoCopy:v9 length:sqlite3_column_bytes(self->_stmt->_stmt, v4) freeWhenDone:0];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v10 error:0];
    id v12 = [v11 decodeObjectOfClasses:v6 forKey:*MEMORY[0x1E4F284E8]];
  }
  else
  {
    id v12 = 0;
  }
LABEL_9:

  return v12;
}

- (id)objectAtIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = sqlite3_column_type(self->_stmt->_stmt, a3);
  if ((v5 - 1) < 2)
  {
    id v12 = NSNumber;
LABEL_7:
    uint64_t v11 = (void *)[v12 newFromSqliteStatement:self->_stmt->_stmt atIndex:v3];
    goto LABEL_9;
  }
  if (v5 == 3)
  {
    id v12 = NSString;
    goto LABEL_7;
  }
  if (v5 == 4)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    int v7 = sqlite3_column_blob(self->_stmt->_stmt, v3);
    id v8 = [v6 initWithBytesNoCopy:v7 length:sqlite3_column_bytes(self->_stmt->_stmt, v3) freeWhenDone:0];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:0];
    id v10 = [(PQLResultSet *)self defaultUnarchivingAllowedClasses];
    uint64_t v11 = [v9 decodeObjectOfClasses:v10 forKey:*MEMORY[0x1E4F284E8]];
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_9:

  return v11;
}

- (id)enumerateObjectsOfClass:(Class)a3 initializer:(SEL)a4
{
  if (self->_objectsClass || self->_objectsConstructor) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"-%s was called twice", sel_getName(sel_enumerateObjectsOfClass_)];
  }
  if (([(objc_class *)a3 instancesRespondToSelector:a4] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PQLResultSet.m", 448, @"Invalid parameter not satisfying: %@", @"[aClass instancesRespondToSelector:initializer]" object file lineNumber description];
  }
  self->_Class objectsClass = a3;
  if (a4) {
    id v8 = a4;
  }
  else {
    id v8 = 0;
  }
  self->_SEL objectsClassInitializer = v8;
  return self;
}

- (id)enumerateObjectsOfClass:(Class)a3
{
  if (self->_objectsClass || self->_objectsConstructor) {
    [MEMORY[0x1E4F1CA00] raise:[MEMORY[0x1E4F1C3C8] intValue] format:@"-%s was called twice", sel_getName(sel_enumerateObjectsOfClass_)];
  }
  if ([(objc_class *)a3 conformsToProtocol:&unk_1F3831CC8])
  {
    self->_hasValuable = 1;
  }
  else if (([(objc_class *)a3 conformsToProtocol:&unk_1F38315B0] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PQLResultSet.m", 462, @"%@ conforms neither to PQLValuable or PQLResultSetInitializer", a3 object file lineNumber description];
  }
  self->_Class objectsClass = a3;
  return self;
}

- (id)enumerateObjects:(id)a3
{
  id v4 = a3;
  if (self->_objectsClass || self->_objectsConstructor) {
    [MEMORY[0x1E4F1CA00] raise:[MEMORY[0x1E4F1C3C8] stringValue] format:@"-%s was called twice", sel_getName(sel_enumerateObjectsOfClass_)];
  }
  int v5 = (void *)MEMORY[0x1E01AB900](v4);
  id objectsConstructor = self->_objectsConstructor;
  self->_id objectsConstructor = v5;

  return self;
}

- (void)setDefaultUnarchivingAllowedClasses:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (unint64_t)rowNumber
{
  return self->_rowNumber;
}

- (PQLConnection)db
{
  return self->_db;
}

@end