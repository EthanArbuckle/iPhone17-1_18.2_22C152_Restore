@interface SiriCoreSQLiteTableConstraint
+ (id)primaryKeyTableConstraintWithName:(id)a3 columnNames:(id)a4;
+ (id)uniqueTableConstraintWithName:(id)a3 columnNames:(id)a4;
- (NSArray)columnNames;
- (NSString)name;
- (SiriCoreSQLiteTableConstraint)initWithName:(id)a3 type:(int64_t)a4 columnNames:(id)a5;
- (int64_t)type;
@end

@implementation SiriCoreSQLiteTableConstraint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (SiriCoreSQLiteTableConstraint)initWithName:(id)a3 type:(int64_t)a4 columnNames:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SiriCoreSQLiteTableConstraint;
  v10 = [(SiriCoreSQLiteTableConstraint *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_type = a4;
    uint64_t v13 = [v9 copy];
    columnNames = v10->_columnNames;
    v10->_columnNames = (NSArray *)v13;
  }
  return v10;
}

+ (id)uniqueTableConstraintWithName:(id)a3 columnNames:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SiriCoreSQLiteTableConstraint alloc] initWithName:v6 type:2 columnNames:v5];

  return v7;
}

+ (id)primaryKeyTableConstraintWithName:(id)a3 columnNames:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SiriCoreSQLiteTableConstraint alloc] initWithName:v6 type:1 columnNames:v5];

  return v7;
}

@end