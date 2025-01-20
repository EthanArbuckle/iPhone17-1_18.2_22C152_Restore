@interface FedStatsSQLiteCategoryDatabase
+ (FedStatsSQLiteCategoryDatabase)databaseWithFileURL:(id)a3 error:(id *)a4;
+ (id)categoryDatabaseAt:(id)a3 withCategories:(id)a4 error:(id *)a5;
- (FedStatsSQLiteCategoryDatabase)initWithSQLiteDatabase:(id)a3 dimensionality:(unint64_t)a4;
- (FedStatsSQLiteDatabase)sqliteDB;
- (id)decode:(unint64_t)a3 error:(id *)a4;
- (id)encode:(id)a3 error:(id *)a4;
- (unint64_t)dimensionality;
@end

@implementation FedStatsSQLiteCategoryDatabase

- (FedStatsSQLiteCategoryDatabase)initWithSQLiteDatabase:(id)a3 dimensionality:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FedStatsSQLiteCategoryDatabase;
  v8 = [(FedStatsSQLiteCategoryDatabase *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sqliteDB, a3);
    v9->_dimensionality = a4;
  }

  return v9;
}

+ (FedStatsSQLiteCategoryDatabase)databaseWithFileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:302 description:@"SQLite categories database requires a path in URL"];
      id v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v33 = 0;
    }
    goto LABEL_67;
  }
  id v68 = 0;
  id v7 = +[FedStatsSQLiteDatabase databaseWithURL:v6 mode:114 error:&v68];
  id v8 = v68;
  id v9 = v8;
  if (!v7)
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:302 underlyingError:v8 description:@"Cannot open database"];
      id v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v33 = 0;
    }
    goto LABEL_66;
  }
  v48 = (objc_class *)a1;
  id v49 = v6;
  v50 = a4;
  v51 = v8;
  v57 = v7;
  v75[0] = @"SELECT COUNT(*) AS count FROM sqlite_master WHERE type == 'table' AND name == 'categories'";
  v75[1] = &off_100034748;
  v10 = +[NSArray arrayWithObjects:v75 count:2];
  v76[0] = v10;
  v74[0] = @"SELECT COUNT(*) AS count FROM PRAGMA_TABLE_XINFO('categories')";
  v74[1] = &off_100034760;
  objc_super v11 = +[NSArray arrayWithObjects:v74 count:2];
  v76[1] = v11;
  v73[0] = @"SELECT COUNT(*) AS count FROM sqlite_master, PRAGMA_INDEX_LIST(sqlite_master.name) AS index_list, PRAGMA_INDEX_XINFO(index_list.name) AS index_info WHERE sqlite_master.type == 'table' AND index_list.origin == 'pk' AND index_info.cid < 0";
  v73[1] = &off_100034778;
  v12 = +[NSArray arrayWithObjects:v73 count:2];
  v76[2] = v12;
  v72[0] = @"SELECT COUNT(*) AS count FROM PRAGMA_INDEX_LIST('categories') AS indices, PRAGMA_TABLE_XINFO('categories') AS table_info, PRAGMA_INDEX_XINFO(indices.name) AS index_info WHERE indices.origin != 'pk' AND indices.[unique] == 1 AND index_info.key == 1 AND index_info.name == table_info.name AND index_info.name == 'idx' AND table_info.type == 'INTEGER'";
  v72[1] = &off_100034748;
  v13 = +[NSArray arrayWithObjects:v72 count:2];
  v76[3] = v13;
  v71[0] = @"SELECT COUNT(*) AS count FROM PRAGMA_INDEX_LIST('categories') AS indices, PRAGMA_TABLE_XINFO('categories') AS table_info, PRAGMA_INDEX_XINFO(indices.name) AS index_info WHERE indices.origin != 'pk' AND indices.[unique] == 1 AND index_info.key == 1 AND index_info.name == table_info.name AND index_info.name == 'category' AND table_info.type == 'TEXT'";
  v71[1] = &off_100034748;
  v14 = +[NSArray arrayWithObjects:v71 count:2];
  v76[4] = v14;
  v70[0] = @"SELECT COUNT(*) AS count FROM PRAGMA_INDEX_LIST('categories') AS indices, PRAGMA_INDEX_XINFO(indices.name) AS index_info WHERE indices.origin == 'pk' AND index_info.key == 1;";
  v70[1] = &off_100034760;
  v15 = +[NSArray arrayWithObjects:v70 count:2];
  v76[5] = v15;
  v16 = +[NSArray arrayWithObjects:v76 count:6];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v17 = v16;
  id v54 = [v17 countByEnumeratingWithState:&v64 objects:v69 count:16];
  v18 = 0;
  v19 = 0;
  v20 = 0;
  if (!v54)
  {
    v60 = 0;
    goto LABEL_22;
  }
  v21 = 0;
  v22 = 0;
  uint64_t v55 = *(void *)v65;
  id obj = v17;
  while (2)
  {
    v23 = 0;
    v24 = v18;
    v25 = v19;
    v58 = v20;
    v26 = v21;
    v27 = v51;
    do
    {
      if (*(void *)v65 != v55) {
        objc_enumerationMutation(obj);
      }
      v28 = *(void **)(*((void *)&v64 + 1) + 8 * (void)v23);
      uint64_t v29 = [v28 objectAtIndex:0];

      uint64_t v30 = [v28 objectAtIndex:1];

      id v63 = v27;
      v60 = (void *)v29;
      v21 = [v57 runQuery:v29 error:&v63];
      id v9 = v63;

      if (!v21)
      {
        v45 = v50;
        v44 = v58;
        if (!v50)
        {
LABEL_52:
          v18 = (void *)v30;

          id v33 = 0;
          v19 = v25;
          v20 = v44;
          id v17 = obj;
          id v6 = v49;
          goto LABEL_64;
        }
        id v46 = +[FedStatsError errorWithCode:302 underlyingError:v9 description:@"Cannot query database"];
LABEL_42:
        id *v45 = v46;
        goto LABEL_52;
      }
      v20 = [v21 next];

      if (!v20)
      {
        v45 = v50;
        if (!v50)
        {
          v44 = 0;
          goto LABEL_52;
        }
        id v46 = +[FedStatsError errorWithCode:302 underlyingError:v9 description:@"Cannot check query result"];
        v44 = 0;
        goto LABEL_42;
      }
      v19 = [v20 objectForKey:@"count"];

      if (!v19
        || (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || ([v19 isEqualToNumber:v30] & 1) == 0)
      {
        if (v50)
        {
          v43 = +[NSString stringWithFormat:@"Cannot complete check statement for %@", v60];
          id *v50 = +[FedStatsError errorWithCode:302 description:v43];
        }
        v25 = v19;
        v44 = v20;
        goto LABEL_52;
      }
      v23 = (char *)v23 + 1;
      id v32 = v9;
      v24 = (void *)v30;
      v25 = v19;
      v58 = v20;
      v26 = v21;
      v22 = v60;
      v27 = v32;
    }
    while (v54 != v23);
    v51 = v32;
    id v17 = obj;
    v22 = v60;
    v18 = v31;
    id v54 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v54) {
      continue;
    }
    break;
  }

LABEL_22:
  id v62 = v51;
  id v7 = v57;
  uint64_t v34 = [v57 runQuery:@"SELECT COUNT(*) AS count FROM categories" error:&v62];
  id v35 = v62;

  id v6 = v49;
  v59 = (void *)v34;
  if (v34)
  {
    id v61 = v35;
    v36 = [v57 runQuery:@"SELECT MAX(idx) AS maxIndex FROM categories" error:&v61];
    id v9 = v61;

    v37 = v36;
    v38 = v18;
    if (v36)
    {
      v39 = [v59 next];

      if (v39)
      {
        v56 = v36;
        v40 = [v36 next];
        id obja = v17;
        if (v40)
        {
          uint64_t v41 = [v39 objectForKey:@"count"];

          v42 = [v40 objectForKey:@"maxIndex"];
          if (v41
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && v42
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && ([v42 isEqualToNumber:v41] & 1) != 0)
          {
            id v33 = objc_msgSend([v48 alloc], "initWithSQLiteDatabase:dimensionality:", v57, objc_msgSend(v42, "unsignedLongValue"));
          }
          else if (v50)
          {
            +[FedStatsError errorWithCode:302 description:@"Cannot check if max index is equal to the number of entries"];
            id v33 = 0;
            id *v50 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v33 = 0;
          }
        }
        else
        {
          if (v50)
          {
            +[FedStatsError errorWithCode:302 description:@"No results for max index (how?)"];
            id v33 = 0;
            id *v50 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v33 = 0;
          }
          uint64_t v41 = (uint64_t)v19;
        }

        v19 = (void *)v41;
        id v17 = obja;
        v37 = v56;
      }
      else if (v50)
      {
        +[FedStatsError errorWithCode:302 description:@"No results for row count (how?)"];
        v39 = 0;
        id v33 = 0;
        id *v50 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = 0;
        id v33 = 0;
      }
    }
    else
    {
      if (v50)
      {
        +[FedStatsError errorWithCode:302 underlyingError:v9 description:@"Cannot find max index"];
        id v33 = 0;
        id *v50 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v33 = 0;
      }
      v39 = v20;
    }

    v20 = v39;
    v18 = v38;
LABEL_64:
    id v7 = v57;
  }
  else
  {
    if (v50)
    {
      +[FedStatsError errorWithCode:302 underlyingError:v35 description:@"Cannot count rows"];
      id v33 = 0;
      id *v50 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v33 = 0;
    }
    id v9 = v35;
  }

LABEL_66:
LABEL_67:

  return (FedStatsSQLiteCategoryDatabase *)v33;
}

- (id)encode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = +[NSString stringWithFormat:@"SELECT idx FROM categories WHERE category == '%@'", v6];
    id v8 = [(FedStatsSQLiteCategoryDatabase *)self sqliteDB];
    id v17 = 0;
    id v9 = [v8 runQuery:v7 error:&v17];
    id v10 = v17;

    if (v9)
    {
      objc_super v11 = [v9 next];
      v12 = v11;
      v13 = &off_100034778;
      if (v11)
      {
        v14 = [v11 objectForKey:@"idx"];
        if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if ((int)[v14 intValue] >= 0) {
            v15 = v14;
          }
          else {
            v15 = &off_100034778;
          }
          v13 = v15;
        }
        else if (a4)
        {
          +[FedStatsError errorWithCode:900 description:@"Database columns are malformed"];
          v13 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
        }
      }
    }
    else if (a4)
    {
      +[FedStatsError errorWithCode:401 underlyingError:v10 description:@"Failed to lookup category in the database"];
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:401 description:@"Input category should be a string"];
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)decode:(unint64_t)a3 error:(id *)a4
{
  v5 = +[NSString stringWithFormat:@"SELECT category FROM categories WHERE idx == %lu", a4, a3];
  id v6 = [(FedStatsSQLiteCategoryDatabase *)self sqliteDB];
  uint64_t v13 = 0;
  id v7 = [v6 runQuery:v5 error:&v13];

  if (v7)
  {
    id v8 = [v7 next];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 objectForKey:@"category"];
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        objc_super v11 = v10;
      }
      else {
        objc_super v11 = 0;
      }
    }
    else
    {
      objc_super v11 = @"FedStatsCategoricalDataOutOfBounds";
    }
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

+ (id)categoryDatabaseAt:(id)a3 withCategories:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v9 = v8;
      id v10 = (char *)[v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v10)
      {
        objc_super v11 = v10;
        uint64_t v12 = *(void *)v33;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(void *)v33 != v12) {
              objc_enumerationMutation(v9);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a5)
              {
                *a5 = (id)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_35;
            }
          }
          objc_super v11 = (char *)[v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      id v31 = 0;
      v14 = +[FedStatsSQLiteDatabase databaseWithURL:v7 mode:119 error:&v31];
      id v15 = v31;
      v16 = v15;
      if (v14)
      {
        id v30 = v15;
        unsigned int v17 = [v14 execute:@"CREATE TABLE categories (idx INTEGER UNIQUE, category TEXT UNIQUE, PRIMARY KEY(idx,category)) WITHOUT ROWID,STRICT", &v30 error];
        id v18 = v30;

        if (v17)
        {
          v28 = v14;
          v19 = 0;
          uint64_t v20 = 1;
          do
          {
            if (v20 - 1 >= (unint64_t)[v9 count])
            {

              v25 = +[FedStatsSQLiteCategoryDatabase databaseWithFileURL:v7 error:a5];
              goto LABEL_36;
            }
            uint64_t v21 = [v9 objectAtIndex:v20 - 1];
            v22 = +[NSString stringWithFormat:@"INSERT INTO categories VALUES (%lu, '%@')", v20, v21];

            id v29 = v18;
            LOBYTE(v21) = [v28 execute:v22 error:&v29];
            id v23 = v29;

            ++v20;
            id v18 = v23;
            v19 = v22;
          }
          while ((v21 & 1) != 0);
          if (a5)
          {
            *a5 = +[FedStatsError errorWithCode:302 underlyingError:v23 description:@"Cannot insert elements into the table"];
          }

          goto LABEL_35;
        }
        if (!a5) {
        v26 = goto LABEL_34;
        }
      }
      else
      {
        if (!a5)
        {
          id v18 = v15;
          goto LABEL_34;
        }
        v26 = +[FedStatsError errorWithCode:302 underlyingError:v15 description:@"Cannot create new database"];
        id v18 = v16;
      }
      *a5 = v26;
LABEL_34:

      goto LABEL_35;
    }
    if (a5)
    {
      goto LABEL_23;
    }
  }
  else if (a5)
  {
LABEL_23:
    +[FedStatsError errorWithCode:302 description:v24];
    v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
LABEL_35:
  v25 = 0;
LABEL_36:

  return v25;
}

- (FedStatsSQLiteDatabase)sqliteDB
{
  return (FedStatsSQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)dimensionality
{
  return self->_dimensionality;
}

- (void).cxx_destruct
{
}

@end