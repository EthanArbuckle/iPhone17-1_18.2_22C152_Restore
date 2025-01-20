@interface PQLResultSet
- (BOOL)checkSuccessWithError:(id *)a3;
- (BOOL)enumerateWithError:(id *)a3 block:(id)a4;
- (id)_expandedSQL;
- (id)_failureAtIndex:(unsigned int *)a3 childFailures:(id)a4;
- (id)assetMetadataFromIndex:(unsigned int *)a3;
- (id)fileWithDomain:(id)a3 fromIndex:(unsigned int *)a4;
- (id)xattrsFromIndex:(unsigned int *)a3;
- (void)getNode:(id *)a3 fromIndex:(unsigned int *)a4;
@end

@implementation PQLResultSet

- (void)getNode:(id *)a3 fromIndex:(unsigned int *)a4
{
  unsigned int v7 = *a4;
  a3->var8 = (unint64_t)[(PQLResultSet *)self unsignedLongLongAtIndex:*a4];
  a3->var7 = (int64_t)[(PQLResultSet *)self unsignedLongLongAtIndex:v7 + 1];
  a3->var4 = (int64_t)[(PQLResultSet *)self unsignedLongLongAtIndex:v7 + 2];
  a3->var5 = (int64_t)[(PQLResultSet *)self unsignedLongLongAtIndex:v7 + 3];
  a3->var6 = (int64_t)[(PQLResultSet *)self unsignedLongLongAtIndex:v7 + 4];
  a3->var1 = [(PQLResultSet *)self unsignedIntAtIndex:v7 + 5];
  a3->var2 = [(PQLResultSet *)self unsignedIntAtIndex:v7 + 6];
  WORD2(a3->var10) = (unsigned __int16)[(PQLResultSet *)self unsignedShortAtIndex:v7 + 7];
  a3->var3 = [(PQLResultSet *)self unsignedIntAtIndex:v7 + 8];
  BYTE6(a3->var10) = [(PQLResultSet *)self unsignedCharAtIndex:v7 + 9];
  *a4 = v7 + 10;
}

- (id)assetMetadataFromIndex:(unsigned int *)a3
{
  ++*a3;
  v5 = -[PQLResultSet stringAtIndex:](self, "stringAtIndex:");
  ++*a3;
  v6 = -[PQLResultSet dataAtIndex:](self, "dataAtIndex:");
  ++*a3;
  signed __int8 v7 = -[PQLResultSet unsignedIntegerAtIndex:](self, "unsignedIntegerAtIndex:");
  ++*a3;
  id v8 = -[PQLResultSet unsignedIntegerAtIndex:](self, "unsignedIntegerAtIndex:");
  ++*a3;
  id v9 = -[PQLResultSet unsignedLongLongAtIndex:](self, "unsignedLongLongAtIndex:");
  ++*a3;
  v10 = -[PQLResultSet dataAtIndex:](self, "dataAtIndex:");
  v11 = +[MBAssetMetadata assetMetadataFromRecordIDSuffix:v5 signature:v10 size:v9 type:v8 compressionMethod:v7 encryptionKey:v6];

  return v11;
}

- (id)xattrsFromIndex:(unsigned int *)a3
{
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v5 = +[NSArray arrayWithObjects:&v9 count:3];
  v6 = +[NSSet setWithArray:](NSSet, "setWithArray:", v5, v9, v10);

  ++*a3;
  signed __int8 v7 = -[PQLResultSet unarchivedObjectOfClasses:atIndex:](self, "unarchivedObjectOfClasses:atIndex:", v6);

  return v7;
}

- (id)fileWithDomain:(id)a3 fromIndex:(unsigned int *)a4
{
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = a3;
  [(PQLResultSet *)self getNode:&v11 fromIndex:a4];
  signed __int8 v7 = -[PQLResultSet xattrsFromIndex:](self, "xattrsFromIndex:", a4, v11, v12, v13, v14, v15);
  ++*a4;
  id v8 = -[PQLResultSet stringAtIndex:](self, "stringAtIndex:");
  uint64_t v9 = +[MBFile fileWithDomain:v6 relativePath:v8];

  [v9 setNode:&v11];
  [v9 setExtendedAttributes:v7];

  return v9;
}

- (BOOL)checkSuccessWithError:(id *)a3
{
  v5 = [(PQLResultSet *)self error];
  if (v5)
  {
    if (MBIsInternalInstall())
    {
      id v6 = [(PQLResultSet *)self _expandedSQL];
      id v7 = [v5 _errorWithSQL:v6];

      if (!a3) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    id v7 = v5;
    if (a3)
    {
LABEL_7:
      id v7 = v7;
      *a3 = v7;
    }
  }
  else
  {
    id v7 = 0;
  }
LABEL_8:

  return v5 == 0;
}

- (BOOL)enumerateWithError:(id *)a3 block:(id)a4
{
  id v6 = (uint64_t (**)(id, PQLResultSet *, id *))a4;
  id v7 = 0;
  while ([(PQLResultSet *)self next])
  {
    id v16 = v7;
    char v9 = v6[2](v6, self, &v16);
    id v10 = v16;

    id v7 = v10;
    if ((v9 & 1) == 0)
    {
      [(PQLResultSet *)self close];
      if (v10) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  id v10 = v7;
  if (v7) {
    goto LABEL_8;
  }
LABEL_7:
  long long v11 = [(PQLResultSet *)self error];
  id v10 = [v11 excludingNotFound];

  if (!v10)
  {
    id v13 = 0;
    BOOL v14 = 1;
    goto LABEL_12;
  }
LABEL_8:
  long long v12 = [(PQLResultSet *)self _expandedSQL];
  id v13 = [v10 _errorWithSQL:v12];

  if (a3)
  {
    id v13 = v13;
    BOOL v14 = 0;
    *a3 = v13;
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_12:

  return v14;
}

- (id)_expandedSQL
{
  v2 = (sqlite3_stmt *)[(PQLResultSet *)self stmt];
  if (v2)
  {
    v3 = sqlite3_expanded_sql(v2);
    v4 = +[NSString stringWithUTF8String:v3];
    free(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_failureAtIndex:(unsigned int *)a3 childFailures:(id)a4
{
  id v6 = a4;
  ++*a3;
  id v7 = -[PQLResultSet stringAtIndex:](self, "stringAtIndex:");
  ++*a3;
  id v8 = -[PQLResultSet integerAtIndex:](self, "integerAtIndex:");
  ++*a3;
  char v9 = -[PQLResultSet stringAtIndex:](self, "stringAtIndex:");
  ++*a3;
  -[PQLResultSet doubleAtIndex:](self, "doubleAtIndex:");
  id v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v11 = [v6 count];
  if (v11 == (id)1)
  {
    id v16 = objc_alloc((Class)NSError);
    v23[0] = NSLocalizedDescriptionKey;
    v23[1] = @"kMBErrorDateKey";
    v24[0] = v9;
    v24[1] = v10;
    v23[2] = NSUnderlyingErrorKey;
    v17 = [v6 firstObject];
    v24[2] = v17;
    v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
    id v19 = [v16 initWithDomain:v7 code:v8 userInfo:v18];
  }
  else
  {
    if (v11)
    {
      id v12 = objc_alloc((Class)NSError);
      v21[0] = NSLocalizedDescriptionKey;
      v21[1] = @"kMBErrorDateKey";
      v22[0] = v9;
      v22[1] = v10;
      v21[2] = @"kMBUnderlyingErrorsKey";
      v22[2] = v6;
      id v13 = v22;
      BOOL v14 = v21;
      uint64_t v15 = 3;
    }
    else
    {
      id v12 = objc_alloc((Class)NSError);
      v25[0] = NSLocalizedDescriptionKey;
      v25[1] = @"kMBErrorDateKey";
      v26[0] = v9;
      v26[1] = v10;
      id v13 = v26;
      BOOL v14 = v25;
      uint64_t v15 = 2;
    }
    v17 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v14 count:v15];
    id v19 = [v12 initWithDomain:v7 code:v8 userInfo:v17];
  }

  return v19;
}

@end