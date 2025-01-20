@interface SiriCoreSQLiteColumnDescription
+ (id)integerPrimaryKeyColumnWithName:(id)a3;
+ (id)uniqueTextColumnWithName:(id)a3;
- (NSArray)constraints;
- (NSString)name;
- (NSString)type;
- (SiriCoreSQLiteColumnDescription)initWithName:(id)a3 type:(id)a4 constraints:(id)a5;
- (SiriCoreSQLiteColumnDescription)initWithName:(id)a3 type:(id)a4 constraintsProvider:(id)a5;
@end

@implementation SiriCoreSQLiteColumnDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (SiriCoreSQLiteColumnDescription)initWithName:(id)a3 type:(id)a4 constraintsProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    (*((void (**)(id))a5 + 2))(a5);
    a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = [(SiriCoreSQLiteColumnDescription *)self initWithName:v8 type:v9 constraints:a5];

  return v10;
}

- (SiriCoreSQLiteColumnDescription)initWithName:(id)a3 type:(id)a4 constraints:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SiriCoreSQLiteColumnDescription;
  v11 = [(SiriCoreSQLiteColumnDescription *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    type = v11->_type;
    v11->_type = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    constraints = v11->_constraints;
    v11->_constraints = (NSArray *)v16;
  }
  return v11;
}

+ (id)uniqueTextColumnWithName:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [SiriCoreSQLiteColumnDescription alloc];
  v5 = [[SiriCoreSQLiteColumnConstraint alloc] initWithName:0 type:3 value:0 options:0];
  v9[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  v7 = [(SiriCoreSQLiteColumnDescription *)v4 initWithName:v3 type:@"TEXT" constraints:v6];

  return v7;
}

+ (id)integerPrimaryKeyColumnWithName:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [SiriCoreSQLiteColumnDescription alloc];
  v5 = [[SiriCoreSQLiteColumnConstraint alloc] initWithName:0 type:1 value:0 options:0];
  v9[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  v7 = [(SiriCoreSQLiteColumnDescription *)v4 initWithName:v3 type:@"INTEGER" constraints:v6];

  return v7;
}

@end