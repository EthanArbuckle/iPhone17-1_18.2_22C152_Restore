@interface SiriCoreSQLiteColumnConstraint
+ (id)defaultColumnConstraintWithName:(id)a3 value:(id)a4;
+ (id)notNullColumnConstraintWithName:(id)a3;
+ (id)primaryKeyColumnConstraintWithName:(id)a3 usesAutoIncrement:(BOOL)a4;
+ (id)uniqueColumnConstraintWithName:(id)a3;
- (NSString)name;
- (SiriCoreSQLiteColumnConstraint)initWithName:(id)a3 type:(int64_t)a4 value:(id)a5 options:(unint64_t)a6;
- (SiriCoreSQLiteValue)value;
- (int64_t)type;
- (unint64_t)options;
@end

@implementation SiriCoreSQLiteColumnConstraint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (unint64_t)options
{
  return self->_options;
}

- (SiriCoreSQLiteValue)value
{
  return self->_value;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (SiriCoreSQLiteColumnConstraint)initWithName:(id)a3 type:(int64_t)a4 value:(id)a5 options:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SiriCoreSQLiteColumnConstraint;
  v12 = [(SiriCoreSQLiteColumnConstraint *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_type = a4;
    uint64_t v15 = [v11 copy];
    value = v12->_value;
    v12->_value = (SiriCoreSQLiteValue *)v15;

    v12->_options = a6;
  }

  return v12;
}

+ (id)defaultColumnConstraintWithName:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SiriCoreSQLiteColumnConstraint alloc] initWithName:v6 type:4 value:v5 options:0];

  return v7;
}

+ (id)uniqueColumnConstraintWithName:(id)a3
{
  id v3 = a3;
  v4 = [[SiriCoreSQLiteColumnConstraint alloc] initWithName:v3 type:3 value:0 options:0];

  return v4;
}

+ (id)notNullColumnConstraintWithName:(id)a3
{
  id v3 = a3;
  v4 = [[SiriCoreSQLiteColumnConstraint alloc] initWithName:v3 type:2 value:0 options:0];

  return v4;
}

+ (id)primaryKeyColumnConstraintWithName:(id)a3 usesAutoIncrement:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [[SiriCoreSQLiteColumnConstraint alloc] initWithName:v5 type:1 value:0 options:v4];

  return v6;
}

@end