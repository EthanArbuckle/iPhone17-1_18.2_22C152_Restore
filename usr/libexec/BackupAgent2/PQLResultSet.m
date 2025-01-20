@interface PQLResultSet
- (BOOL)checkSuccessWithError:(id *)a3;
- (BOOL)enumerateWithError:(id *)a3 block:(id)a4;
- (id)_expandedSQL;
@end

@implementation PQLResultSet

- (BOOL)checkSuccessWithError:(id *)a3
{
  v5 = [(PQLResultSet *)self error];
  if (v5)
  {
    if (sub_100092304())
    {
      v6 = [(PQLResultSet *)self _expandedSQL];
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
  v6 = (uint64_t (**)(id, PQLResultSet *, id *))a4;
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
  v11 = [(PQLResultSet *)self error];
  id v10 = [v11 excludingNotFound];

  if (!v10)
  {
    id v13 = 0;
    BOOL v14 = 1;
    goto LABEL_12;
  }
LABEL_8:
  v12 = [(PQLResultSet *)self _expandedSQL];
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

@end