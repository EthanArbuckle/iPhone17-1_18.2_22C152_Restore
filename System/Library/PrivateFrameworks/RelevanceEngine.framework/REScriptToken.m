@interface REScriptToken
- (BOOL)isEqual:(id)a3;
- (NSString)value;
- (REScriptToken)initWithValue:(id)a3 type:(unint64_t)a4 line:(int64_t)a5 column:(int64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)column;
- (int64_t)line;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)type;
@end

@implementation REScriptToken

- (REScriptToken)initWithValue:(id)a3 type:(unint64_t)a4 line:(int64_t)a5 column:(int64_t)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)REScriptToken;
  v11 = [(REScriptToken *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    value = v11->_value;
    v11->_value = (NSString *)v12;

    v11->_type = a4;
    v11->_line = a5;
    v11->_column = a6;
  }

  return v11;
}

- (unint64_t)length
{
  return [(NSString *)self->_value length];
}

- (unint64_t)hash
{
  return [(NSString *)self->_value hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REScriptToken *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (self->_type == v5->_type && self->_line == v5->_line && self->_column == v5->_column)
      {
        value = self->_value;
        v8 = v5->_value;
        v9 = value;
        id v10 = v9;
        if (v9 == v8) {
          char v11 = 1;
        }
        else {
          char v11 = [(NSString *)v9 isEqual:v8];
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, self->_value];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  value = self->_value;
  unint64_t type = self->_type;
  int64_t line = self->_line;
  int64_t column = self->_column;
  return (id)[v4 initWithValue:value type:type line:line column:column];
}

- (int64_t)line
{
  return self->_line;
}

- (int64_t)column
{
  return self->_column;
}

- (NSString)value
{
  return self->_value;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end