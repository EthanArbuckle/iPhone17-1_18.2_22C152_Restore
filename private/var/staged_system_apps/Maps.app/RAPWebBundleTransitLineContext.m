@interface RAPWebBundleTransitLineContext
- (NSDictionary)context;
- (NSString)identifier;
- (NSString)name;
- (RAPWebBundleImageContext)imageContext;
- (void)setIdentifier:(id)a3;
- (void)setImageContext:(id)a3;
- (void)setName:(id)a3;
@end

@implementation RAPWebBundleTransitLineContext

- (NSDictionary)context
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(RAPWebBundleTransitLineContext *)self name];

  if (v4)
  {
    v5 = [(RAPWebBundleTransitLineContext *)self name];
    [v3 setObject:v5 forKeyedSubscript:@"name"];
  }
  v6 = [(RAPWebBundleTransitLineContext *)self identifier];

  if (v6)
  {
    v7 = [(RAPWebBundleTransitLineContext *)self identifier];
    [v3 setObject:v7 forKeyedSubscript:@"muid"];
  }
  v8 = [(RAPWebBundleTransitLineContext *)self imageContext];

  if (v8)
  {
    v9 = [(RAPWebBundleTransitLineContext *)self imageContext];
    v10 = [v9 identifier];
    [v3 setObject:v10 forKeyedSubscript:@"artworkURL"];
  }
  id v11 = [v3 copy];

  return (NSDictionary *)v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (RAPWebBundleImageContext)imageContext
{
  return self->_imageContext;
}

- (void)setImageContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageContext, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end