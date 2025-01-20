@interface PTCinematographyNetworkInputSchema
- (NSDictionary)params;
- (NSString)name;
- (PTCinematographyNetworkInputSchema)initWithModelDictionary:(id)a3;
- (unint64_t)count;
@end

@implementation PTCinematographyNetworkInputSchema

- (PTCinematographyNetworkInputSchema)initWithModelDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PTCinematographyNetworkInputSchema;
  v5 = [(PTCinematographyNetworkInputSchema *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = [v4 objectForKeyedSubscript:@"count"];
    v5->_count = [v8 unsignedIntegerValue];

    uint64_t v9 = [v4 copy];
    params = v5->_params;
    v5->_params = (NSDictionary *)v9;
  }
  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)count
{
  return self->_count;
}

- (NSDictionary)params
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end