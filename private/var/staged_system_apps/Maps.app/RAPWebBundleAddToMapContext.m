@interface RAPWebBundleAddToMapContext
- (NSString)address;
- (NSString)entityName;
- (id)context;
- (void)setAddress:(id)a3;
- (void)setEntityName:(id)a3;
@end

@implementation RAPWebBundleAddToMapContext

- (id)context
{
  v13.receiver = self;
  v13.super_class = (Class)RAPWebBundleAddToMapContext;
  v3 = [(RAPWebBundleBaseContext *)&v13 context];
  id v4 = [v3 mutableCopy];

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:v5 forKeyedSubscript:@"place"];
  v6 = [(RAPWebBundleAddToMapContext *)self address];

  if (v6)
  {
    v7 = [(RAPWebBundleAddToMapContext *)self address];
    v14 = v7;
    v8 = +[NSArray arrayWithObjects:&v14 count:1];
    [v5 setObject:v8 forKeyedSubscript:@"formattedAddress"];
  }
  v9 = [(RAPWebBundleAddToMapContext *)self entityName];

  if (v9)
  {
    v10 = [(RAPWebBundleAddToMapContext *)self entityName];
    [v5 setObject:v10 forKeyedSubscript:@"entityName"];
  }
  id v11 = [v4 copy];

  return v11;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityName, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end