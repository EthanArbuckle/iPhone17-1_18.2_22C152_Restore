@interface IMAdminTable
- (BOOL)hasDatabaseVersion;
- (IMAdminTable)initWithDatabaseHandle:(id)a3;
- (id)blobValueForKey:(id)a3 domain:(id)a4;
- (id)lastAccessDate;
- (id)numberValueForKey:(id)a3 domain:(id)a4;
- (id)stringValueForKey:(id)a3 domain:(id)a4;
- (int64_t)databaseVersion;
- (void)setDatabaseVersion:(int64_t)a3;
- (void)setLastAccessDate:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4 domain:(id)a5;
@end

@implementation IMAdminTable

- (IMAdminTable)initWithDatabaseHandle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMAdminTable;
  v6 = [(IMAdminTable *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, a3);
    v8 = +[NSString stringWithFormat:@"create table if not exists admin (pk %@, domain %@, key %@, stringValue %@, intValue %@, blobValue %@)", @"integer primary key", @"text", @"text", @"text", @"integer", @"blob"];
    [(IMDatabaseHandle *)v7->_db runStatement:v8 arguments:0];
  }
  return v7;
}

- (int64_t)databaseVersion
{
  db = self->_db;
  v3 = +[NSArray arrayWithObjects:@"version", @"database", 0];
  v4 = [(IMDatabaseHandle *)db arrayForQuery:@"select intValue from admin where key = ? and domain = ?" arguments:v3 rawRows:0];

  if ([v4 count])
  {
    id v5 = [v4 objectAtIndex:0];
  }
  else
  {
    id v5 = 0;
  }
  v6 = [v5 objectForKey:@"intValue"];
  id v7 = [v6 integerValue];

  return (int64_t)v7;
}

- (void)setDatabaseVersion:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(IMAdminTable *)self setProperty:v4 forKey:@"version" domain:@"database"];
}

- (BOOL)hasDatabaseVersion
{
  db = self->_db;
  v3 = +[NSArray arrayWithObjects:@"version", @"database", 0];
  id v4 = [(IMDatabaseHandle *)db arrayForQuery:@"select count(*) from admin where key = ? and domain = ?" arguments:v3 rawRows:1];

  id v5 = [v4 firstObject];
  v6 = [v5 firstObject];
  id v7 = [v6 integerValue];

  return (uint64_t)v7 > 0;
}

- (void)setLastAccessDate:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[NSDate date];
  }
  id v7 = v4;
  [v4 timeIntervalSinceReferenceDate];
  *(float *)&double v5 = v5;
  v6 = +[NSNumber numberWithFloat:v5];
  [(IMAdminTable *)self setProperty:v6 forKey:@"lastAccessDate" domain:@"database"];
}

- (id)lastAccessDate
{
  v2 = [(IMAdminTable *)self numberValueForKey:@"lastAccessDate" domain:@"database"];
  [v2 floatValue];
  id v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v3];

  return v4;
}

- (void)setProperty:(id)a3 forKey:(id)a4 domain:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = @"select count(*) from admin where key = ? and domain = ?";
  if (!v9) {
    objc_super v10 = @"select count(*) from admin where key = ?";
  }
  v11 = v10;
  id v12 = [objc_alloc((Class)NSArray) initWithObjects:v8, v9, 0];
  v13 = [(IMDatabaseHandle *)self->_db arrayForQuery:v11 arguments:v12 rawRows:1];
  v14 = [v13 firstObject];
  v15 = [v14 firstObject];
  id v16 = [v15 integerValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v17 = @"blobValue";
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v17 = @"intValue";
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
        CFStringRef v17 = @"stringValue";
      }
      else {
        CFStringRef v17 = 0;
      }
    }
  }
  if (v16)
  {
    if (v9)
    {
      v18 = +[NSString stringWithFormat:@"update admin set %@ = ? where key = ? and domain = ?", v17];
      id v21 = v9;
      uint64_t v23 = 0;
    }
    else
    {
      v18 = +[NSString stringWithFormat:@"update admin set %@ = ? where key = ?", v17];
      id v21 = 0;
    }
    +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v24, v8, v21, v23);
  }
  else
  {
    if (v9)
    {
      v18 = +[NSString stringWithFormat:@"insert into admin (key, domain, %@) values (?,?,?)", v17];
      id v22 = v24;
      uint64_t v23 = 0;
      id v20 = v9;
    }
    else
    {
      v18 = +[NSString stringWithFormat:@"insert into admin (key, %@) values (?,?)", v17];
      id v20 = v24;
      id v22 = 0;
    }
    +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, v20, v22, v23);
  v19 = };

  [(IMDatabaseHandle *)self->_db runStatement:v18 arguments:v19];
}

- (id)blobValueForKey:(id)a3 domain:(id)a4
{
  if (a4)
  {
    double v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, a4, 0);
    CFStringRef v6 = @"select blobValue from admin where key = ? and domain = ?";
  }
  else
  {
    double v5 = +[NSArray arrayWithObject:a3];
    CFStringRef v6 = @"select blobValue from admin where key = ?";
  }
  id v7 = [(IMDatabaseHandle *)self->_db arrayForQuery:v6 arguments:v5 rawRows:1];
  id v8 = [v7 firstObject];
  id v9 = [v8 firstObject];

  return v9;
}

- (id)stringValueForKey:(id)a3 domain:(id)a4
{
  if (a4)
  {
    double v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, a4, 0);
    CFStringRef v6 = @"select stringValue from admin where key = ? and domain = ?";
  }
  else
  {
    double v5 = +[NSArray arrayWithObject:a3];
    CFStringRef v6 = @"select stringValue from admin where key = ?";
  }
  id v7 = [(IMDatabaseHandle *)self->_db arrayForQuery:v6 arguments:v5 rawRows:1];
  id v8 = [v7 firstObject];
  id v9 = [v8 firstObject];

  return v9;
}

- (id)numberValueForKey:(id)a3 domain:(id)a4
{
  if (a4)
  {
    double v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, a4, 0);
    CFStringRef v6 = @"select intValue from admin where key = ? and domain = ?";
  }
  else
  {
    double v5 = +[NSArray arrayWithObject:a3];
    CFStringRef v6 = @"select intValue from admin where key = ?";
  }
  id v7 = [(IMDatabaseHandle *)self->_db arrayForQuery:v6 arguments:v5 rawRows:1];
  id v8 = [v7 firstObject];
  id v9 = [v8 firstObject];

  return v9;
}

- (void).cxx_destruct
{
}

@end