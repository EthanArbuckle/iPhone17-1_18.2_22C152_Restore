@interface TFKey
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (TFKey)initWithAddress:(unint64_t)a3 type:(id)a4 name:(id)a5;
- (TFKey)initWithAddressOfType:(id)a3 name:(id)a4;
- (TFKey)initWithTypeName:(id)a3 name:(id)a4;
- (id)copyWithName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)type;
- (unint64_t)address;
- (unint64_t)hash;
@end

@implementation TFKey

- (TFKey)initWithAddressOfType:(id)a3 name:(id)a4
{
  return [(TFKey *)self initWithAddress:a3 type:a3 name:a4];
}

- (TFKey)initWithAddress:(unint64_t)a3 type:(id)a4 name:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TFKey;
  v11 = [(TFKey *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_address = a3;
    objc_storeStrong(&v11->_type, a4);
    objc_storeStrong((id *)&v12->_name, a5);
  }

  return v12;
}

- (unint64_t)address
{
  return self->_address;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_type, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (TFKey)initWithTypeName:(id)a3 name:(id)a4
{
  v6 = (NSString *)a3;
  id v7 = a4;
  NSProtocolFromString(v6);
  v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    id v9 = self;
    Class v10 = v8;
  }
  else
  {
    Class v10 = NSClassFromString(v6);
    if (!v10)
    {
      v11 = [(TFKey *)self initWithAddress:0 type:0 name:v7];
      goto LABEL_6;
    }
    id v9 = self;
  }
  v11 = [(TFKey *)v9 initWithAddressOfType:v10 name:v7];
LABEL_6:
  v12 = v11;

  return v12;
}

- (id)copyWithName:(id)a3
{
  id v4 = a3;
  v5 = [[TFKey alloc] initWithAddress:self->_address type:self->_type name:v4];

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ address=%ld, name=%@, type=%@>", objc_opt_class(), self->_address, self->_name, self->_type];
}

- (unint64_t)hash
{
  name = self->_name;
  unint64_t address = self->_address;
  if (name) {
    address ^= [(NSString *)name hash];
  }
  return address;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t address = self->_address;
    if (address == [v5 address])
    {
      if (!self->_name) {
        goto LABEL_8;
      }
      id v7 = [v5 name];

      name = self->_name;
      if (v7)
      {
        id v9 = [v5 name];
        char v10 = [(NSString *)name isEqualToString:v9];

LABEL_10:
        goto LABEL_11;
      }
      if (!name)
      {
LABEL_8:
        v11 = [v5 name];

        if (!v11)
        {
          char v10 = 1;
          goto LABEL_10;
        }
      }
    }
    char v10 = 0;
    goto LABEL_10;
  }
  char v10 = 0;
LABEL_11:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [TFKey alloc];
  name = self->_name;
  id type = self->_type;
  unint64_t address = self->_address;

  return [(TFKey *)v4 initWithAddress:address type:type name:name];
}

- (NSString)name
{
  return self->_name;
}

- (id)type
{
  return self->_type;
}

@end