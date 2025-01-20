@interface WFDefaultFavoritesProvider
- (BOOL)canProvideDefaultFavorites;
- (WFDefaultFavoritesProvider)init;
- (WFDefaultFavoritesProvider)initWithDelegate:(id)a3 persistence:(id)a4;
- (WFFavoriteLocationProviderDelegate)delegate;
- (id)locationFromCity:(id)a3;
- (id)locations;
- (void)setDelegate:(id)a3;
@end

@implementation WFDefaultFavoritesProvider

- (WFDefaultFavoritesProvider)initWithDelegate:(id)a3 persistence:(id)a4
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFDefaultFavoritesProvider;
  v6 = [(WFDefaultFavoritesProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v5);
    v8 = v7;
  }

  return v7;
}

- (WFDefaultFavoritesProvider)init
{
  return [(WFDefaultFavoritesProvider *)self initWithDelegate:0 persistence:0];
}

- (BOOL)canProvideDefaultFavorites
{
  return 1;
}

- (id)locations
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263F25598] sharedManager];
  id v5 = [MEMORY[0x263EFF960] currentLocale];
  v6 = [v5 localeIdentifier];
  id v7 = [v4 defaultCitiesForLocaleCode:v6];

  if (v7) {
    goto LABEL_17;
  }
  v8 = [MEMORY[0x263F25598] sharedManager];
  v9 = [MEMORY[0x263EFF960] currentLocale];
  objc_super v10 = [v9 objectForKey:*MEMORY[0x263EFF4D0]];
  id v7 = [v8 defaultCitiesForLocaleCode:v10];

  if (v7)
  {
LABEL_17:
    if ([v7 count])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v7;
      uint64_t v11 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v7);
            }
            v15 = -[WFDefaultFavoritesProvider locationFromCity:](self, "locationFromCity:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
            [v3 addObject:v15];
          }
          uint64_t v12 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
  }

  return v3;
}

- (id)locationFromCity:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(WFLocation);
  id v5 = [v3 name];
  [(WFLocation *)v4 setCity:v5];

  id v6 = objc_alloc(MEMORY[0x263F00A50]);
  [v3 latitude];
  double v8 = v7;
  [v3 longitude];
  float v10 = v9;

  uint64_t v11 = (void *)[v6 initWithLatitude:v8 longitude:v10];
  [(WFLocation *)v4 setGeoLocation:v11];

  return v4;
}

- (WFFavoriteLocationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFFavoriteLocationProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end