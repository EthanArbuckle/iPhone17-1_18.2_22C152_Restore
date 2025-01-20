@interface USKObject
- (NSDictionary)metadata;
- (USKObjectPath)path;
- (USKToken)name;
@end

@implementation USKObject

- (NSDictionary)metadata
{
  v2 = objc_opt_new();
  return (NSDictionary *)v2;
}

- (USKToken)name
{
  return self->_name;
}

- (USKObjectPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end