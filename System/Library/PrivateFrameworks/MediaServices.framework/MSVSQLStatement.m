@interface MSVSQLStatement
- (BOOL)bindJSONValue:(id)a3 toParameterAtIndex:(int64_t)a4 error:(id *)a5;
- (BOOL)bindJSONValue:(id)a3 toParameterNamed:(id)a4 error:(id *)a5;
- (id)description;
- (void)bindBoolValue:(BOOL)a3 toParameterAtIndex:(int64_t)a4;
- (void)bindBoolValue:(BOOL)a3 toParameterNamed:(id)a4;
- (void)bindDataValue:(id)a3 toParameterAtIndex:(int64_t)a4;
- (void)bindDataValue:(id)a3 toParameterNamed:(id)a4;
- (void)bindDateValue:(id)a3 toParameterAtIndex:(int64_t)a4;
- (void)bindDateValue:(id)a3 toParameterNamed:(id)a4;
- (void)bindDoubleValue:(double)a3 toParameterAtIndex:(int64_t)a4;
- (void)bindDoubleValue:(double)a3 toParameterNamed:(id)a4;
- (void)bindFloatValue:(float)a3 toParameterAtIndex:(int64_t)a4;
- (void)bindFloatValue:(float)a3 toParameterNamed:(id)a4;
- (void)bindFunctionContext:(id)a3 toParameterAtIndex:(int64_t)a4;
- (void)bindFunctionContext:(id)a3 toParameterNamed:(id)a4;
- (void)bindInt64Value:(int64_t)a3 toParameterAtIndex:(int64_t)a4;
- (void)bindInt64Value:(int64_t)a3 toParameterNamed:(id)a4;
- (void)bindNullValueToParameterAtIndex:(int64_t)a3;
- (void)bindNullValueToParameterNamed:(id)a3;
- (void)bindStringValue:(id)a3 toParameterAtIndex:(int64_t)a4;
- (void)bindStringValue:(id)a3 toParameterNamed:(id)a4;
- (void)bindUInt64Value:(unint64_t)a3 toParameterAtIndex:(int64_t)a4;
- (void)bindUInt64Value:(unint64_t)a3 toParameterNamed:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)reset;
@end

@implementation MSVSQLStatement

- (BOOL)bindJSONValue:(id)a3 toParameterNamed:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MSVSQLDatabase.m", 389, @"Invalid parameter not satisfying: %@", @"jsonValue" object file lineNumber description];
  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:390 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  id v12 = v10;
  BOOL v13 = -[MSVSQLStatement bindJSONValue:toParameterAtIndex:error:](self, "bindJSONValue:toParameterAtIndex:error:", v9, sqlite3_bind_parameter_index(statementHandle, (const char *)[v12 UTF8String]), a5);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implicitTransaction, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  [(MSVSQLStatement *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MSVSQLStatement;
  [(MSVSQLStatement *)&v3 dealloc];
}

- (void)invalidate
{
  statementHandle = self->_statementHandle;
  if (statementHandle)
  {
    sqlite3_finalize(statementHandle);
    [(MSVSQLDatabaseTransaction *)self->_implicitTransaction commit];
    connection = self->_connection;
    self->_statementHandle = 0;
    self->_connection = 0;
  }
}

- (void)bindUInt64Value:(unint64_t)a3 toParameterNamed:(id)a4
{
  id v7 = a4;
  id v9 = v7;
  if (!self->_statementHandle)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:341 description:@"Attempt to use invalidated statement."];

    id v7 = v9;
  }
  [(MSVSQLStatement *)self bindInt64Value:a3 toParameterNamed:v7];
}

- (void)bindInt64Value:(int64_t)a3 toParameterNamed:(id)a4
{
  id v7 = a4;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:282 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  id v10 = v7;
  -[MSVSQLStatement bindInt64Value:toParameterAtIndex:](self, "bindInt64Value:toParameterAtIndex:", a3, sqlite3_bind_parameter_index(statementHandle, (const char *)[v10 UTF8String]));
}

- (void)bindInt64Value:(int64_t)a3 toParameterAtIndex:(int64_t)a4
{
  int v4 = a4;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:277 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  sqlite3_bind_int64(statementHandle, v4, a3);
}

- (void)bindDataValue:(id)a3 toParameterNamed:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (!v12)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MSVSQLDatabase.m", 318, @"Invalid parameter not satisfying: %@", @"dataValue" object file lineNumber description];
  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:319 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  id v9 = v7;
  -[MSVSQLStatement bindDataValue:toParameterAtIndex:](self, "bindDataValue:toParameterAtIndex:", v12, sqlite3_bind_parameter_index(statementHandle, (const char *)[v9 UTF8String]));
}

- (void)bindDataValue:(id)a3 toParameterAtIndex:(int64_t)a4
{
  int v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MSVSQLDatabase.m", 312, @"Invalid parameter not satisfying: %@", @"dataValue" object file lineNumber description];
  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:313 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  id v11 = v7;
  sqlite3_bind_blob64(statementHandle, v4, (const void *)[v11 bytes], objc_msgSend(v11, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)bindJSONValue:(id)a3 toParameterAtIndex:(int64_t)a4 error:(id *)a5
{
  int v6 = a4;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MSVSQLDatabase.m", 370, @"Invalid parameter not satisfying: %@", @"jsonValue" object file lineNumber description];
  }
  if (!self->_statementHandle)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:371 description:@"Attempt to use invalidated statement."];
  }
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v9])
  {
    id v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:a5];
    id v11 = v10;
    if (a5)
    {
      statementHandle = self->_statementHandle;
      id v13 = v10;
      sqlite3_bind_text64(statementHandle, v6, (const char *)[v13 bytes], objc_msgSend(v13, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL, 1u);
    }
    LOBYTE(a5) = v11 != 0;
  }
  else if (a5)
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    v19 = @"jsonValue";
    v20[0] = v9;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    objc_msgSend(v14, "msv_errorWithDomain:code:userInfo:debugDescription:", @"MSVSQLDatabaseError", 2, v15, @"Not valid JSON object: %@", v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (void)bindStringValue:(id)a3 toParameterNamed:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (!v12)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MSVSQLDatabase.m", 305, @"Invalid parameter not satisfying: %@", @"stringValue" object file lineNumber description];
  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:306 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  id v9 = v7;
  -[MSVSQLStatement bindStringValue:toParameterAtIndex:](self, "bindStringValue:toParameterAtIndex:", v12, sqlite3_bind_parameter_index(statementHandle, (const char *)[v9 UTF8String]));
}

- (void)bindStringValue:(id)a3 toParameterAtIndex:(int64_t)a4
{
  int v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MSVSQLDatabase.m", 299, @"Invalid parameter not satisfying: %@", @"stringValue" object file lineNumber description];
  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:300 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  id v11 = v7;
  sqlite3_bind_text(statementHandle, v4, (const char *)[v11 UTF8String], objc_msgSend(v11, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)bindFunctionContext:(id)a3 toParameterNamed:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (!v12)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MSVSQLDatabase.m", 404, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:405 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  id v9 = v7;
  -[MSVSQLStatement bindFunctionContext:toParameterAtIndex:](self, "bindFunctionContext:toParameterAtIndex:", v12, sqlite3_bind_parameter_index(statementHandle, (const char *)[v9 UTF8String]));
}

- (void)bindFunctionContext:(id)a3 toParameterAtIndex:(int64_t)a4
{
  int v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MSVSQLDatabase.m", 398, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:399 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  id v12 = v7;
  ClassName = object_getClassName((id)[v12 classForCoder]);
  sqlite3_bind_pointer(statementHandle, v4, v12, ClassName, _MSVSQLBridgeDestroy);
}

- (void)bindDateValue:(id)a3 toParameterNamed:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (!v12)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MSVSQLDatabase.m", 363, @"Invalid parameter not satisfying: %@", @"dateValue" object file lineNumber description];
  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:364 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  id v9 = v7;
  -[MSVSQLStatement bindDateValue:toParameterAtIndex:](self, "bindDateValue:toParameterAtIndex:", v12, sqlite3_bind_parameter_index(statementHandle, (const char *)[v9 UTF8String]));
}

- (void)bindDateValue:(id)a3 toParameterAtIndex:(int64_t)a4
{
  int v4 = a4;
  id v7 = a3;
  id v11 = v7;
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MSVSQLDatabase.m", 356, @"Invalid parameter not satisfying: %@", @"dateValue" object file lineNumber description];

    id v7 = 0;
  }
  if (!self->_statementHandle)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:357 description:@"Attempt to use invalidated statement."];

    id v7 = v11;
  }
  [v7 timeIntervalSince1970];
  sqlite3_bind_double(self->_statementHandle, v4, v8);
}

- (void)bindFloatValue:(float)a3 toParameterNamed:(id)a4
{
  id v7 = a4;
  id v9 = v7;
  if (!self->_statementHandle)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:351 description:@"Attempt to use invalidated statement."];

    id v7 = v9;
  }
  [(MSVSQLStatement *)self bindDoubleValue:v7 toParameterNamed:a3];
}

- (void)bindFloatValue:(float)a3 toParameterAtIndex:(int64_t)a4
{
  if (!self->_statementHandle)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:346 description:@"Attempt to use invalidated statement."];
  }
  [(MSVSQLStatement *)self bindDoubleValue:a4 toParameterAtIndex:a3];
}

- (void)bindUInt64Value:(unint64_t)a3 toParameterAtIndex:(int64_t)a4
{
  if (!self->_statementHandle)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:336 description:@"Attempt to use invalidated statement."];
  }
  [(MSVSQLStatement *)self bindInt64Value:a3 toParameterAtIndex:a4];
}

- (void)bindBoolValue:(BOOL)a3 toParameterNamed:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:330 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  id v10 = v7;
  -[MSVSQLStatement bindBoolValue:toParameterAtIndex:](self, "bindBoolValue:toParameterAtIndex:", v4, sqlite3_bind_parameter_index(statementHandle, (const char *)[v10 UTF8String]));
}

- (void)bindBoolValue:(BOOL)a3 toParameterAtIndex:(int64_t)a4
{
  int v4 = a4;
  BOOL v5 = a3;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:325 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  sqlite3_bind_int(statementHandle, v4, v5);
}

- (void)bindDoubleValue:(double)a3 toParameterNamed:(id)a4
{
  id v7 = a4;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:293 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  id v10 = v7;
  -[MSVSQLStatement bindDoubleValue:toParameterAtIndex:](self, "bindDoubleValue:toParameterAtIndex:", sqlite3_bind_parameter_index(statementHandle, (const char *)[v10 UTF8String]), a3);
}

- (void)bindDoubleValue:(double)a3 toParameterAtIndex:(int64_t)a4
{
  int v4 = a4;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:288 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  sqlite3_bind_double(statementHandle, v4, a3);
}

- (void)bindNullValueToParameterNamed:(id)a3
{
  id v5 = a3;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:271 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  id v8 = v5;
  -[MSVSQLStatement bindNullValueToParameterAtIndex:](self, "bindNullValueToParameterAtIndex:", sqlite3_bind_parameter_index(statementHandle, (const char *)[v8 UTF8String]));
}

- (void)bindNullValueToParameterAtIndex:(int64_t)a3
{
  int v3 = a3;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:266 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  sqlite3_bind_null(statementHandle, v3);
}

- (void)reset
{
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MSVSQLDatabase.m" lineNumber:260 description:@"Attempt to use invalidated statement."];

    statementHandle = self->_statementHandle;
  }
  sqlite3_reset(statementHandle);
  int v4 = self->_statementHandle;
  sqlite3_clear_bindings(v4);
}

- (id)description
{
  statementHandle = self->_statementHandle;
  if (statementHandle)
  {
    int v4 = sqlite3_expanded_sql(statementHandle);
    [NSString stringWithFormat:@"<%@: %p> %s", objc_opt_class(), self, v4];
  }
  else
  {
    [NSString stringWithFormat:@"<%@: %p INVALIDATED>", objc_opt_class(), self, v7];
  id v5 = };
  return v5;
}

@end