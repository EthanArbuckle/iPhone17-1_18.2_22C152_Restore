@interface SiriCoreSQLiteTableDescription
- (NSArray)columns;
- (NSArray)constraints;
- (NSString)name;
- (SiriCoreSQLiteTableDescription)initWithName:(id)a3 columns:(id)a4 constraints:(id)a5;
- (SiriCoreSQLiteTableDescription)initWithName:(id)a3 columnsProvider:(id)a4 constraintsProvider:(id)a5;
@end

@implementation SiriCoreSQLiteTableDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (NSArray)columns
{
  return self->_columns;
}

- (NSString)name
{
  return self->_name;
}

- (SiriCoreSQLiteTableDescription)initWithName:(id)a3 columnsProvider:(id)a4 constraintsProvider:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(void))a4;
  v10 = (void (**)(void))a5;
  v11 = v10;
  if (!v9)
  {
    v12 = 0;
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = v9[2](v9);
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  v13 = v11[2](v11);
LABEL_6:
  v14 = [(SiriCoreSQLiteTableDescription *)self initWithName:v8 columns:v12 constraints:v13];

  return v14;
}

- (SiriCoreSQLiteTableDescription)initWithName:(id)a3 columns:(id)a4 constraints:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SiriCoreSQLiteTableDescription;
  v11 = [(SiriCoreSQLiteTableDescription *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    columns = v11->_columns;
    v11->_columns = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    constraints = v11->_constraints;
    v11->_constraints = (NSArray *)v16;
  }
  return v11;
}

@end