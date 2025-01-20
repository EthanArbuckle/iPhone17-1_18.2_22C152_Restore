@interface SQLiteTable
+ (id)SQLToAddColumnWithSQL:(id)a3 toTableNamed:(id)a4;
+ (id)SQLToDropTableNamed:(id)a3;
+ (id)SQLToInsertColumnNames:(id)a3 fromTableNamed:(id)a4 intoTableNamed:(id)a5;
+ (id)SQLToRenameTable:(id)a3 to:(id)a4;
+ (id)tableWithSQL:(id)a3;
- (BOOL)removeColumn:(id)a3;
- (BOOL)renameColumn:(id)a3 to:(id)a4;
- (NSString)tableName;
- (id)_columnNamed:(id)a3;
- (id)_initWithTableSQL:(id)a3;
- (id)columnNames;
- (id)creationSQL;
- (unint64_t)_indexOfColumnNamed:(id)a3;
- (void)setTableName:(id)a3;
@end

@implementation SQLiteTable

+ (id)tableWithSQL:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) _initWithTableSQL:v4];

  return v5;
}

- (BOOL)removeColumn:(id)a3
{
  id v4 = [(SQLiteTable *)self _columnNamed:a3];
  if (v4) {
    [(NSMutableArray *)self->_columns removeObject:v4];
  }

  return v4 != 0;
}

- (BOOL)renameColumn:(id)a3 to:(id)a4
{
  id v6 = a4;
  v7 = [(SQLiteTable *)self _columnNamed:a3];
  v8 = v7;
  if (v7) {
    [v7 setName:v6];
  }

  return v8 != 0;
}

- (id)columnNames
{
  v3 = +[NSMutableArray arrayWithCapacity:[(NSMutableArray *)self->_columns count]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_columns;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "name", (void)v11);
        [v3 addObject:v9];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)creationSQL
{
  v3 = +[NSMutableArray arrayWithCapacity:(char *)[(NSMutableArray *)self->_columns count]+ (void)[(NSMutableArray *)self->_tableConstraints count]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_columns;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) SQL];
        [v3 addObject:v9];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [v3 addObjectsFromArray:self->_tableConstraints];
  v10 = +[NSString stringWithFormat:@"\"%@\"", self->_tableName];
  long long v11 = [v3 componentsJoinedByString:@", "];
  long long v12 = +[NSString stringWithFormat:@"CREATE TABLE %@ (%@)", v10, v11, (void)v14];

  return v12;
}

+ (id)SQLToInsertColumnNames:(id)a3 fromTableNamed:(id)a4 intoTableNamed:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = +[NSString stringWithFormat:@"\"%@\"", *(void *)(*((void *)&v22 + 1) + 8 * i)];
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  long long v17 = [v10 componentsJoinedByString:@", "];
  v18 = +[NSString stringWithFormat:@"\"%@\"", v9];
  v19 = +[NSString stringWithFormat:@"\"%@\"", v8];
  v20 = +[NSString stringWithFormat:@"INSERT INTO %@ SELECT %@ FROM %@", v18, v17, v19];

  return v20;
}

+ (id)SQLToAddColumnWithSQL:(id)a3 toTableNamed:(id)a4
{
  id v5 = a3;
  id v6 = +[NSString stringWithFormat:@"\"%@\"", a4];
  id v7 = +[NSString stringWithFormat:@"ALTER TABLE %@ ADD COLUMN %@", v6, v5];

  return v7;
}

+ (id)SQLToDropTableNamed:(id)a3
{
  v3 = +[NSString stringWithFormat:@"\"%@\"", a3];
  id v4 = +[NSString stringWithFormat:@"DROP TABLE %@", v3];

  return v4;
}

+ (id)SQLToRenameTable:(id)a3 to:(id)a4
{
  id v5 = a4;
  id v6 = +[NSString stringWithFormat:@"\"%@\"", a3];
  id v7 = +[NSString stringWithFormat:@"\"%@\"", v5];

  id v8 = +[NSString stringWithFormat:@"ALTER TABLE %@ RENAME TO %@", v6, v7];

  return v8;
}

- (id)_initWithTableSQL:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SQLiteTable;
  id v5 = [(SQLiteTable *)&v19 init];
  if (v5)
  {
    id v6 = +[NSScanner SQLParsingScannerWithSQL:v4];
    id v18 = 0;
    unsigned int v7 = [v6 scanTableSQLPreambleAndTableName:&v18];
    id v8 = v18;
    id v9 = v18;
    id v10 = 0;
    id v11 = 0;
    if (v7
      && (id v16 = 0,
          id v17 = 0,
          unsigned int v12 = [v6 scanTableSQLColumns:&v17 constraints:&v16],
          id v13 = v17,
          id v10 = v17,
          id v14 = v16,
          id v11 = v16,
          v12))
    {
      objc_storeStrong((id *)&v5->_tableName, v8);
      objc_storeStrong((id *)&v5->_columns, v13);
      objc_storeStrong((id *)&v5->_tableConstraints, v14);
    }
    else
    {

      id v5 = 0;
    }
  }
  return v5;
}

- (unint64_t)_indexOfColumnNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_columns count];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    while (1)
    {
      id v8 = [(NSMutableArray *)self->_columns objectAtIndex:v7];
      id v9 = [v8 name];
      unsigned __int8 v10 = [v4 isEqualToString:v9];

      if (v10) {
        break;
      }
      if (v6 == (id)++v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)_columnNamed:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_columns;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned __int8 v10 = objc_msgSend(v9, "name", (void)v13);
        unsigned __int8 v11 = [v4 isEqualToString:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_tableConstraints, 0);
  objc_storeStrong((id *)&self->_columns, 0);
}

@end