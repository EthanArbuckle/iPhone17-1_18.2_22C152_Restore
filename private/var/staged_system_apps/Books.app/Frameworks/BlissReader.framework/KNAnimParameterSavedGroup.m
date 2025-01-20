@interface KNAnimParameterSavedGroup
+ (BOOL)supportsSecureCoding;
- (KNAnimParameterSavedGroup)init;
- (KNAnimParameterSavedGroup)initWithCoder:(id)a3;
- (NSMutableDictionary)parameters;
- (NSString)name;
- (NSString)version;
- (id)parameterForName:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setParameters:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation KNAnimParameterSavedGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(KNAnimParameterSavedGroup *)self name];
  [v4 encodeObject:v5 forKey:@"nm"];

  v6 = [(KNAnimParameterSavedGroup *)self version];
  [v4 encodeObject:v6 forKey:@"vers"];

  id v7 = [(KNAnimParameterSavedGroup *)self parameters];
  [v4 encodeObject:v7 forKey:@"params"];
}

- (KNAnimParameterSavedGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)KNAnimParameterSavedGroup;
  v5 = [(KNAnimParameterSavedGroup *)&v20 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nm"];
    id v7 = (NSString *)[v6 copy];
    name = v5->_name;
    v5->_name = v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vers"];
    v10 = (NSString *)[v9 copy];
    version = v5->_version;
    v5->_version = v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"params"];
    parameters = v5->_parameters;
    v5->_parameters = (NSMutableDictionary *)v15;

    if (!v5->_parameters)
    {
      v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v18 = v5->_parameters;
      v5->_parameters = v17;
    }
  }

  return v5;
}

- (KNAnimParameterSavedGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)KNAnimParameterSavedGroup;
  v2 = [(KNAnimParameterSavedGroup *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    parameters = v2->_parameters;
    v2->_parameters = v3;
  }
  return v2;
}

- (id)parameterForName:(id)a3
{
  id v4 = a3;
  v5 = [(KNAnimParameterSavedGroup *)self parameters];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSMutableDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end