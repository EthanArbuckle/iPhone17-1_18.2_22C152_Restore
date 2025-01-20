@interface AEAggregationPlugin
- (AEAggregationPlugin)initWithFileExtension:(id)a3;
- (AEAggregationPlugin)initWithUrlScheme:(id)a3;
- (AEAnnotationProvider)sharedAnnotationProvider;
- (NSString)extension;
- (NSString)scheme;
- (id)associatedAssetType;
- (id)helperForURL:(id)a3 withOptions:(id)a4;
- (id)supportedFileExtensions;
- (id)supportedUrlSchemes;
- (void)addPlugin:(id)a3;
- (void)dealloc;
- (void)setSharedAnnotationProvider:(id)a3;
@end

@implementation AEAggregationPlugin

- (AEAggregationPlugin)initWithFileExtension:(id)a3
{
  id v4 = a3;
  v5 = [(AEAggregationPlugin *)self init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    extension = v5->_extension;
    v5->_extension = v6;
  }
  return v5;
}

- (AEAggregationPlugin)initWithUrlScheme:(id)a3
{
  id v4 = a3;
  v5 = [(AEAggregationPlugin *)self init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    scheme = v5->_scheme;
    v5->_scheme = v6;
  }
  return v5;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_plugins removeAllObjects];
  plugins = self->_plugins;
  self->_plugins = 0;

  v4.receiver = self;
  v4.super_class = (Class)AEAggregationPlugin;
  [(AEAggregationPlugin *)&v4 dealloc];
}

- (void)addPlugin:(id)a3
{
  id v4 = a3;
  plugins = self->_plugins;
  id v8 = v4;
  if (!plugins)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_plugins;
    self->_plugins = v6;

    id v4 = v8;
    plugins = self->_plugins;
  }
  [(NSMutableArray *)plugins addObject:v4];
}

- (id)associatedAssetType
{
  return 0;
}

- (id)supportedFileExtensions
{
  v3 = [(NSString *)self->_extension length];
  if (v3)
  {
    v3 = +[NSArray arrayWithObject:self->_extension];
  }

  return v3;
}

- (id)supportedUrlSchemes
{
  v3 = [(NSString *)self->_scheme length];
  if (v3)
  {
    v3 = +[NSArray arrayWithObject:self->_scheme];
  }

  return v3;
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AEAggregationhelper alloc] initWithPlugins:self->_plugins forUrl:v7 withOptions:v6];

  return v8;
}

- (AEAnnotationProvider)sharedAnnotationProvider
{
  return self->_sharedAnnotationProvider;
}

- (void)setSharedAnnotationProvider:(id)a3
{
}

- (NSString)extension
{
  return self->_extension;
}

- (NSString)scheme
{
  return self->_scheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_extension, 0);

  objc_storeStrong((id *)&self->_plugins, 0);
}

@end