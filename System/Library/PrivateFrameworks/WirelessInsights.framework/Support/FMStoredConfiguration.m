@interface FMStoredConfiguration
- (NSDictionary)prevValues;
- (NSDictionary)values;
- (id)description;
- (id)init:(int64_t)a3 prevValues:(id)a4 values:(id)a5;
- (int64_t)version;
@end

@implementation FMStoredConfiguration

- (id)init:(int64_t)a3 prevValues:(id)a4 values:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FMStoredConfiguration;
  v11 = [(FMStoredConfiguration *)&v15 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_version = a3;
    objc_storeStrong((id *)&v11->_prevValues, a4);
    objc_storeStrong(p_isa + 3, a5);
    v13 = p_isa;
  }

  return p_isa;
}

- (id)description
{
  int64_t v3 = [(FMStoredConfiguration *)self version];
  v4 = [(FMStoredConfiguration *)self prevValues];
  v5 = [(FMStoredConfiguration *)self values];
  v6 = +[NSString stringWithFormat:@"Version: %lld, prevValues: %@, values: %@", v3, v4, v5];

  return v6;
}

- (int64_t)version
{
  return self->_version;
}

- (NSDictionary)prevValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)values
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_prevValues, 0);
}

@end