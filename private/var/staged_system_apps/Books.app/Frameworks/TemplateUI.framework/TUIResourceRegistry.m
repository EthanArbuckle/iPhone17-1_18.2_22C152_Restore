@interface TUIResourceRegistry
- (TUIResourceRegistry)init;
- (id)fileProviderForKind:(id)a3;
- (id)imageProviderForKind:(id)a3;
- (void)registerFileProvider:(id)a3 forKind:(id)a4;
- (void)registerImageProvider:(id)a3 forKind:(id)a4;
@end

@implementation TUIResourceRegistry

- (TUIResourceRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUIResourceRegistry;
  v2 = [(TUIResourceRegistry *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    imageProviders = v2->_imageProviders;
    v2->_imageProviders = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    fileProviders = v2->_fileProviders;
    v2->_fileProviders = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)registerImageProvider:(id)a3 forKind:(id)a4
{
  if (a4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imageProviders, "setObject:forKeyedSubscript:", a3);
  }
}

- (id)imageProviderForKind:(id)a3
{
  if (a3)
  {
    v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_imageProviders, "objectForKeyedSubscript:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)registerFileProvider:(id)a3 forKind:(id)a4
{
  if (a4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fileProviders, "setObject:forKeyedSubscript:", a3);
  }
}

- (id)fileProviderForKind:(id)a3
{
  if (a3)
  {
    v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_fileProviders, "objectForKeyedSubscript:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviders, 0);

  objc_storeStrong((id *)&self->_imageProviders, 0);
}

@end