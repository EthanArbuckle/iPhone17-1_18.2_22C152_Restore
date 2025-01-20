@interface SKUIUber
- (NSString)text;
- (SKUIArtworkProviding)artworkProvider;
- (SKUIColorScheme)colorScheme;
- (SKUIUber)initWithUberDictionary:(id)a3;
@end

@implementation SKUIUber

- (SKUIUber)initWithUberDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIUber initWithUberDictionary:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIUber;
  v13 = [(SKUIUber *)&v23 init];
  if (v13)
  {
    v14 = [v4 objectForKey:@"masterArt"];
    uint64_t v15 = +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:v14];
    artworkProvider = v13->_artworkProvider;
    v13->_artworkProvider = (SKUIArtworkProviding *)v15;

    v17 = [v4 objectForKey:@"description"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v17 copy];
      text = v13->_text;
      v13->_text = (NSString *)v18;
    }
    v20 = [[SKUIColorScheme alloc] initWithColorSchemeDictionary:v4];
    colorScheme = v13->_colorScheme;
    v13->_colorScheme = v20;
  }
  return v13;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (NSString)text
{
  return self->_text;
}

- (SKUIArtworkProviding)artworkProvider
{
  return self->_artworkProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_colorScheme, 0);
}

- (void)initWithUberDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end