@interface RAPWebBundleImageContext
- (NSData)image;
- (NSDictionary)context;
- (NSString)identifier;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation RAPWebBundleImageContext

- (NSDictionary)context
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(RAPWebBundleImageContext *)self identifier];

  if (v4)
  {
    v5 = [(RAPWebBundleImageContext *)self identifier];
    [v3 setObject:v5 forKeyedSubscript:@"icon"];
  }
  id v6 = [v3 copy];

  return (NSDictionary *)v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end