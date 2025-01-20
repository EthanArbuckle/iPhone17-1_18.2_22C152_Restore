@interface PPSSQLiteEntity
- (BOOL)isEqual:(id)a3;
- (NSArray)tableNames;
- (PPSSQLiteEntity)initWithTableNames:(id)a3;
- (id)disambiguatedSQLForProperty:(id)a3 shouldEscape:(BOOL)a4;
- (id)joinClause;
- (unint64_t)hash;
@end

@implementation PPSSQLiteEntity

- (PPSSQLiteEntity)initWithTableNames:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSSQLiteEntity;
  v5 = [(PPSSQLiteEntity *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    tableNames = v5->_tableNames;
    v5->_tableNames = (NSArray *)v6;
  }
  return v5;
}

- (id)disambiguatedSQLForProperty:(id)a3 shouldEscape:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = v5;
  v7 = @"%@";
  if (v4 && ![v5 isEqualToString:@"*"]) {
    v7 = @"\"%@\"";
  }
  v8 = objc_msgSend(NSString, "stringWithFormat:", v7, v6);

  return v8;
}

- (id)joinClause
{
  v3 = [(PPSSQLiteEntity *)self tableNames];
  unint64_t v4 = [v3 count];

  if (v4 < 2)
  {
    objc_super v9 = 0;
  }
  else
  {
    id v5 = [(PPSSQLiteEntity *)self tableNames];
    uint64_t v6 = [v5 objectAtIndex:0];

    v7 = [(PPSSQLiteEntity *)self tableNames];
    v8 = [v7 objectAtIndex:1];

    objc_super v9 = [NSString stringWithFormat:@"INNER JOIN '%@' ON '%@'.%@ = '%@'.%@", v8, v6, @"ID", v8, @"FK_ID"];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSSQLiteEntity;
  if ([(PPSSQLiteEntity *)&v9 isEqual:v4])
  {
    id v5 = [(PPSSQLiteEntity *)self tableNames];
    uint64_t v6 = [v4 tableNames];
    char v7 = [v5 isEqualToArray:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)PPSSQLiteEntity;
  id v3 = [(PPSSQLiteEntity *)&v7 hash];
  id v4 = [(PPSSQLiteEntity *)self tableNames];
  unint64_t v5 = (unint64_t)v3 + [v4 hash];

  return v5;
}

- (NSArray)tableNames
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end