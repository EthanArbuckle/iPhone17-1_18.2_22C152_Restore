@interface SiriCoreSQLiteIndexDescription
- (NSArray)columnNames;
- (NSString)name;
- (NSString)tableName;
- (SiriCoreSQLiteIndexDescription)initWithName:(id)a3 tableName:(id)a4 columnNames:(id)a5 options:(unint64_t)a6;
- (unint64_t)options;
@end

@implementation SiriCoreSQLiteIndexDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (unint64_t)options
{
  return self->_options;
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)name
{
  return self->_name;
}

- (SiriCoreSQLiteIndexDescription)initWithName:(id)a3 tableName:(id)a4 columnNames:(id)a5 options:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SiriCoreSQLiteIndexDescription;
  v13 = [(SiriCoreSQLiteIndexDescription *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    tableName = v13->_tableName;
    v13->_tableName = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    columnNames = v13->_columnNames;
    v13->_columnNames = (NSArray *)v18;

    v13->_options = a6;
  }

  return v13;
}

@end