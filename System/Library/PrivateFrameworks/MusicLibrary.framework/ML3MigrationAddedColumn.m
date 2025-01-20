@interface ML3MigrationAddedColumn
- (BOOL)shouldImportFromForeignTable;
- (ML3MigrationAddedColumn)initWithName:(id)a3 foreignTable:(id)a4 foreignColumn:(id)a5 joinColumn:(id)a6;
- (NSString)columnName;
- (NSString)foreignColumnName;
- (NSString)foreignTableName;
- (NSString)joinColumnName;
@end

@implementation ML3MigrationAddedColumn

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinColumnName, 0);
  objc_storeStrong((id *)&self->_foreignColumnName, 0);
  objc_storeStrong((id *)&self->_foreignTableName, 0);

  objc_storeStrong((id *)&self->_columnName, 0);
}

- (NSString)joinColumnName
{
  return self->_joinColumnName;
}

- (NSString)foreignColumnName
{
  return self->_foreignColumnName;
}

- (NSString)foreignTableName
{
  return self->_foreignTableName;
}

- (NSString)columnName
{
  return self->_columnName;
}

- (BOOL)shouldImportFromForeignTable
{
  return self->_foreignColumnName != 0;
}

- (ML3MigrationAddedColumn)initWithName:(id)a3 foreignTable:(id)a4 foreignColumn:(id)a5 joinColumn:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ML3MigrationAddedColumn;
  v15 = [(ML3MigrationAddedColumn *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_columnName, a3);
    objc_storeStrong((id *)&v16->_foreignTableName, a4);
    objc_storeStrong((id *)&v16->_foreignColumnName, a5);
    objc_storeStrong((id *)&v16->_joinColumnName, a6);
  }

  return v16;
}

@end