@interface PCBooleanCondition
- (NSString)identifier;
- (NSString)type;
- (NSString)value;
- (PCBooleanCondition)initWithType:(id)a3 value:(id)a4 identifier:(id)a5;
- (id)shortCircuitBundleIdentifier:(id)a3 condition:(id)a4;
- (id)storageRepresentation;
@end

@implementation PCBooleanCondition

- (PCBooleanCondition)initWithType:(id)a3 value:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PCBooleanCondition;
  v12 = [(PCBooleanCondition *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v13->_value, a4);
    uint64_t v14 = [(PCBooleanCondition *)v13 shortCircuitBundleIdentifier:v11 condition:v10];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;
  }
  return v13;
}

- (id)storageRepresentation
{
  v3 = +[APIDAccountProvider privateUserAccount];
  v4 = [v3 iTunesDSID];
  v5 = [(PCBooleanCondition *)self type];
  v6 = [(PCBooleanCondition *)self value];
  v7 = [(PCBooleanCondition *)self identifier];
  v8 = +[NSString stringWithFormat:@"%@%@%@%@", v4, v5, v6, v7];

  return v8;
}

- (id)shortCircuitBundleIdentifier:(id)a3 condition:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [&off_10024B5E8 objectForKey:v5];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 objectForKey:v6];
    id v10 = (void *)v9;
    if (v9) {
      id v11 = (void *)v9;
    }
    else {
      id v11 = v5;
    }
    id v12 = v11;
  }
  else
  {
    id v12 = v5;
  }

  return v12;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end