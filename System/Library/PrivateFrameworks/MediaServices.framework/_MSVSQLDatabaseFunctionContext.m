@interface _MSVSQLDatabaseFunctionContext
- (BOOL)BOOLValueAtArgumentIndex:(int64_t)a3;
- (BOOL)isNullValueAtArgumentIndex:(int64_t)a3;
- (double)doubleValueAtArgumentIndex:(int64_t)a3;
- (float)floatValueAtArgumentIndex:(int64_t)a3;
- (id)dataValueAtArgumentIndex:(int64_t)a3;
- (id)dateValueAtArgumentIndex:(int64_t)a3;
- (id)functionContextOfClass:(Class)a3 atArgumentIndex:(int64_t)a4;
- (id)jsonDataAtArgumentIndex:(int64_t)a3;
- (id)jsonValueAtArgumentIndex:(int64_t)a3 error:(id *)a4;
- (id)memoizedObjectForArgumentIndex:(int64_t)a3;
- (id)objectValueAtArgumentIndex:(int64_t)a3;
- (id)returnBool:(BOOL)a3;
- (id)returnData:(id)a3;
- (id)returnDate:(id)a3;
- (id)returnDouble:(double)a3;
- (id)returnError:(id)a3;
- (id)returnError:(id)a3 sqliteCode:(int)a4;
- (id)returnErrorNoMemory;
- (id)returnErrorTooBig;
- (id)returnFloat:(float)a3;
- (id)returnFunctionContext:(id)a3;
- (id)returnInt64:(int64_t)a3;
- (id)returnJSON:(id)a3 error:(id *)a4;
- (id)returnNull;
- (id)returnString:(id)a3;
- (id)stringValueAtArgumentIndex:(int64_t)a3;
- (int64_t)int64ValueAtArgumentIndex:(int64_t)a3;
- (int64_t)numberOfArguments;
- (sqlite3_value)_valueAtIndex:(int64_t)a3;
- (unint64_t)uint64ValueAtArgumentIndex:(int64_t)a3;
- (void)memoizeObject:(id)a3 forArgumentIndex:(int64_t)a4;
@end

@implementation _MSVSQLDatabaseFunctionContext

- (id)returnError:(id)a3 sqliteCode:(int)a4
{
  v6 = objc_msgSend(a3, "msv_description");
  context = self->_context;
  id v8 = v6;
  sqlite3_result_error(context, (const char *)[v8 UTF8String], objc_msgSend(v8, "length"));
  sqlite3_result_error_code(self->_context, a4);

  return self;
}

- (id)returnError:(id)a3
{
  return [(_MSVSQLDatabaseFunctionContext *)self returnError:a3 sqliteCode:1];
}

- (id)returnErrorNoMemory
{
  return self;
}

- (id)returnErrorTooBig
{
  return self;
}

- (id)returnFunctionContext:(id)a3
{
  id v4 = a3;
  context = self->_context;
  id v6 = v4;
  ClassName = object_getClassName((id)[v6 classForCoder]);
  sqlite3_result_pointer(context, v6, ClassName, _MSVSQLBridgeDestroy);

  return self;
}

- (id)returnJSON:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v6])
  {
    v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:0 error:a4];
    id v8 = v7;
    if (a4)
    {
      context = self->_context;
      id v10 = v7;
      sqlite3_result_text64(context, (const char *)[v10 bytes], objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL, 1u);
    }
    else
    {
      self = 0;
    }
    a4 = self;
  }
  else if (a4)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    v14 = @"jsonValue";
    v15[0] = v6;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    objc_msgSend(v11, "msv_errorWithDomain:code:userInfo:debugDescription:", @"MSVSQLDatabaseError", 2, v12, @"Not valid JSON object: %@", v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (id)returnDate:(id)a3
{
  [a3 timeIntervalSince1970];
  return -[_MSVSQLDatabaseFunctionContext returnDouble:](self, "returnDouble:");
}

- (id)returnFloat:(float)a3
{
  return [(_MSVSQLDatabaseFunctionContext *)self returnDouble:a3];
}

- (id)returnBool:(BOOL)a3
{
  return self;
}

- (id)returnData:(id)a3
{
  context = self->_context;
  id v5 = a3;
  id v6 = (const void *)[v5 bytes];
  int v7 = [v5 length];

  sqlite3_result_blob64(context, v6, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  return self;
}

- (id)returnString:(id)a3
{
  context = self->_context;
  id v5 = a3;
  id v6 = (const char *)[v5 UTF8String];
  int v7 = [v5 length];

  sqlite3_result_text(context, v6, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  return self;
}

- (id)returnDouble:(double)a3
{
  return self;
}

- (id)returnInt64:(int64_t)a3
{
  return self;
}

- (id)returnNull
{
  return self;
}

- (id)memoizedObjectForArgumentIndex:(int64_t)a3
{
  return sqlite3_get_auxdata(self->_context, a3);
}

- (void)memoizeObject:(id)a3 forArgumentIndex:(int64_t)a4
{
  id v7 = a3;
  if ([(_MSVSQLDatabaseFunctionContext *)self numberOfArguments] <= a4)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MSVSQLDatabase.m", 908, @"argument index out of bounds: %d/%d", a4, -[_MSVSQLDatabaseFunctionContext numberOfArguments](self, "numberOfArguments"));
  }
  context = self->_context;
  sqlite3_set_auxdata(context, a4, v7, _MSVSQLBridgeDestroy);
}

- (id)functionContextOfClass:(Class)a3 atArgumentIndex:(int64_t)a4
{
  id v5 = [(_MSVSQLDatabaseFunctionContext *)self _valueAtIndex:a4];
  ClassName = object_getClassName(a3);
  return sqlite3_value_pointer(v5, ClassName);
}

- (id)objectValueAtArgumentIndex:(int64_t)a3
{
  switch(sqlite3_value_type(-[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:")))
  {
    case 1:
      id v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_MSVSQLDatabaseFunctionContext int64ValueAtArgumentIndex:](self, "int64ValueAtArgumentIndex:", a3));
      break;
    case 2:
      id v6 = NSNumber;
      [(_MSVSQLDatabaseFunctionContext *)self doubleValueAtArgumentIndex:a3];
      id v5 = objc_msgSend(v6, "numberWithDouble:");
      break;
    case 3:
      id v5 = [(_MSVSQLDatabaseFunctionContext *)self stringValueAtArgumentIndex:a3];
      break;
    case 4:
      id v5 = [(_MSVSQLDatabaseFunctionContext *)self dataValueAtArgumentIndex:a3];
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

- (id)jsonDataAtArgumentIndex:(int64_t)a3
{
  if (-[_MSVSQLDatabaseFunctionContext isNullValueAtArgumentIndex:](self, "isNullValueAtArgumentIndex:"))
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(_MSVSQLDatabaseFunctionContext *)self stringValueAtArgumentIndex:a3];
    id v5 = [v6 dataUsingEncoding:4];
  }
  return v5;
}

- (id)jsonValueAtArgumentIndex:(int64_t)a3 error:(id *)a4
{
  id v5 = [(_MSVSQLDatabaseFunctionContext *)self jsonDataAtArgumentIndex:a3];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:a4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)dateValueAtArgumentIndex:(int64_t)a3
{
  int v5 = sqlite3_value_type(-[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:"));
  if ((v5 - 1) >= 2)
  {
    if (v5 == 3)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      v9 = [(_MSVSQLDatabaseFunctionContext *)self stringValueAtArgumentIndex:a3];
      id v7 = [v8 dateFromString:v9];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1C9C8];
    [(_MSVSQLDatabaseFunctionContext *)self doubleValueAtArgumentIndex:a3];
    id v7 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  }
  return v7;
}

- (float)floatValueAtArgumentIndex:(int64_t)a3
{
  return sqlite3_value_double([(_MSVSQLDatabaseFunctionContext *)self _valueAtIndex:a3]);
}

- (unint64_t)uint64ValueAtArgumentIndex:(int64_t)a3
{
  v3 = [(_MSVSQLDatabaseFunctionContext *)self _valueAtIndex:a3];
  return sqlite3_value_int64(v3);
}

- (BOOL)BOOLValueAtArgumentIndex:(int64_t)a3
{
  return sqlite3_value_int([(_MSVSQLDatabaseFunctionContext *)self _valueAtIndex:a3]) != 0;
}

- (id)dataValueAtArgumentIndex:(int64_t)a3
{
  v3 = [(_MSVSQLDatabaseFunctionContext *)self _valueAtIndex:a3];
  id v4 = sqlite3_value_blob(v3);
  uint64_t v5 = sqlite3_value_bytes(v3);
  id v6 = (void *)MEMORY[0x1E4F1C9B8];
  return (id)[v6 dataWithBytes:v4 length:v5];
}

- (id)stringValueAtArgumentIndex:(int64_t)a3
{
  if (-[_MSVSQLDatabaseFunctionContext isNullValueAtArgumentIndex:](self, "isNullValueAtArgumentIndex:"))
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [(_MSVSQLDatabaseFunctionContext *)self _valueAtIndex:a3];
    id v7 = sqlite3_value_text(v6);
    uint64_t v5 = (void *)[[NSString alloc] initWithBytes:v7 length:sqlite3_value_bytes(v6) encoding:4];
  }
  return v5;
}

- (double)doubleValueAtArgumentIndex:(int64_t)a3
{
  v3 = [(_MSVSQLDatabaseFunctionContext *)self _valueAtIndex:a3];
  return sqlite3_value_double(v3);
}

- (int64_t)int64ValueAtArgumentIndex:(int64_t)a3
{
  v3 = [(_MSVSQLDatabaseFunctionContext *)self _valueAtIndex:a3];
  return sqlite3_value_int64(v3);
}

- (BOOL)isNullValueAtArgumentIndex:(int64_t)a3
{
  return sqlite3_value_type([(_MSVSQLDatabaseFunctionContext *)self _valueAtIndex:a3]) == 5;
}

- (int64_t)numberOfArguments
{
  return self->_argc;
}

- (sqlite3_value)_valueAtIndex:(int64_t)a3
{
  if ([(_MSVSQLDatabaseFunctionContext *)self numberOfArguments] <= a3)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MSVSQLDatabase.m", 784, @"argument index out of bounds: %d/%d", a3, -[_MSVSQLDatabaseFunctionContext numberOfArguments](self, "numberOfArguments"));
  }
  return self->_argv[a3];
}

@end