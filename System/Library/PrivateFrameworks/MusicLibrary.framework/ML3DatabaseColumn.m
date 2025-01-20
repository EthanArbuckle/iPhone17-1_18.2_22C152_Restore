@interface ML3DatabaseColumn
+ (id)columnWithName:(id)a3 datatype:(unint64_t)a4 constraints:(unint64_t)a5 defaultValue:(id)a6;
- (ML3DatabaseColumn)initWithName:(id)a3 datatype:(unint64_t)a4 constraints:(unint64_t)a5 defaultValue:(id)a6;
- (NSString)name;
- (id)_columnDefinitionSQL;
- (id)defaultValue;
- (id)description;
- (unint64_t)columnConstraints;
- (unint64_t)datatype;
@end

@implementation ML3DatabaseColumn

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (unint64_t)columnConstraints
{
  return self->_columnConstraints;
}

- (unint64_t)datatype
{
  return self->_datatype;
}

- (NSString)name
{
  return self->_name;
}

- (id)_columnDefinitionSQL
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t columnConstraints = self->_columnConstraints;
  if ((columnConstraints & 1) == 0)
  {
    if ((columnConstraints & 0x10) == 0) {
      goto LABEL_3;
    }
    goto LABEL_26;
  }
  v11 = (void *)[@"PRIMARY KEY" mutableCopy];
  v12 = v11;
  unint64_t v13 = self->_columnConstraints;
  if ((v13 & 2) != 0)
  {
    v14 = @" ASC";
  }
  else
  {
    if ((v13 & 4) == 0) {
      goto LABEL_23;
    }
    v14 = @" DESC";
  }
  [v11 appendString:v14];
  unint64_t v13 = self->_columnConstraints;
LABEL_23:
  if ((v13 & 8) != 0) {
    [v12 appendString:@" AUTOINCREMENT"];
  }
  [v4 addObject:v12];

  unint64_t columnConstraints = self->_columnConstraints;
  if ((columnConstraints & 0x10) == 0)
  {
LABEL_3:
    if ((columnConstraints & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
LABEL_26:
  [v4 addObject:@"NOT NULL"];
  if ((self->_columnConstraints & 0x20) != 0) {
LABEL_4:
  }
    [v4 addObject:@"UNIQUE"];
LABEL_5:
  id defaultValue = self->_defaultValue;
  if (defaultValue)
  {
    v7 = objc_msgSend(defaultValue, "ml_stringValueForSQL");
    if (!v7)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"ML3DatabaseColumn.m", 79, @"Unsupported default value type %@", self->_defaultValue object file lineNumber description];
    }
    v8 = [NSString stringWithFormat:@"DEFAULT %@", v7];
    [v4 addObject:v8];
  }
  unint64_t v9 = self->_datatype - 1;
  if (v9 > 4) {
    v10 = 0;
  }
  else {
    v10 = off_1E5FAF420[v9];
  }
  v15 = [v4 componentsJoinedByString:@" "];
  if ([v4 count]) {
    [NSString stringWithFormat:@"%@ %@ %@", self->_name, v10, v15];
  }
  else {
  v16 = [NSString stringWithFormat:@"%@ %@", self->_name, v10, v19];
  }

  return v16;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, name = '%@'>", objc_opt_class(), self, self->_name];
}

- (ML3DatabaseColumn)initWithName:(id)a3 datatype:(unint64_t)a4 constraints:(unint64_t)a5 defaultValue:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ML3DatabaseColumn;
  v12 = [(ML3DatabaseColumn *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_datatype = a4;
    v12->_unint64_t columnConstraints = a5;
    objc_storeStrong(&v12->_defaultValue, a6);
  }

  return v12;
}

+ (id)columnWithName:(id)a3 datatype:(unint64_t)a4 constraints:(unint64_t)a5 defaultValue:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v10 datatype:a4 constraints:a5 defaultValue:v9];

  return v11;
}

@end