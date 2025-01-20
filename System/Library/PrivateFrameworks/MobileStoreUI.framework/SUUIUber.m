@interface SUUIUber
- (NSString)text;
- (SUUIArtworkProviding)artworkProvider;
- (SUUIColorScheme)colorScheme;
- (SUUIUber)initWithUberDictionary:(id)a3;
@end

@implementation SUUIUber

- (SUUIUber)initWithUberDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIUber;
  v5 = [(SUUIUber *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"masterArt"];
    uint64_t v7 = +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:v6];
    artworkProvider = v5->_artworkProvider;
    v5->_artworkProvider = (SUUIArtworkProviding *)v7;

    v9 = [v4 objectForKey:@"description"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      text = v5->_text;
      v5->_text = (NSString *)v10;
    }
    v12 = [[SUUIColorScheme alloc] initWithColorSchemeDictionary:v4];
    colorScheme = v5->_colorScheme;
    v5->_colorScheme = v12;
  }
  return v5;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (NSString)text
{
  return self->_text;
}

- (SUUIArtworkProviding)artworkProvider
{
  return self->_artworkProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end