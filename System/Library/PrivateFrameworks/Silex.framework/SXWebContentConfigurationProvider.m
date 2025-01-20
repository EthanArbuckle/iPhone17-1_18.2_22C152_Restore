@interface SXWebContentConfigurationProvider
- (NSLocale)locale;
- (SWLocation)location;
- (SXLiveActivityAttributesProvider)liveActivityAttributesProvider;
- (SXPresentationAttributesProvider)presentationAttributesProvider;
- (SXStoreFrontProvider)storeFrontProvider;
- (SXWebContentConfigurationProvider)initWithPresentationAttributesProvider:(id)a3 storeFrontProvider:(id)a4 liveActivityAttributesProvider:(id)a5 locale:(id)a6 location:(id)a7;
- (id)changeBlock;
- (id)configurationForSize:(CGSize)a3 dataSources:(id)a4 sourceURL:(id)a5;
- (void)invokeChangeListener;
- (void)presentationAttributesDidChangeFrom:(id)a3 toAttributes:(id)a4;
- (void)setChangeBlock:(id)a3;
@end

@implementation SXWebContentConfigurationProvider

- (SXWebContentConfigurationProvider)initWithPresentationAttributesProvider:(id)a3 storeFrontProvider:(id)a4 liveActivityAttributesProvider:(id)a5 locale:(id)a6 location:(id)a7
{
  id v13 = a3;
  id v20 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SXWebContentConfigurationProvider;
  v17 = [(SXWebContentConfigurationProvider *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_presentationAttributesProvider, a3);
    [v13 addObserver:v18];
    objc_storeStrong((id *)&v18->_storeFrontProvider, a4);
    objc_storeStrong((id *)&v18->_liveActivityAttributesProvider, a5);
    objc_storeStrong((id *)&v18->_locale, a6);
    objc_storeStrong((id *)&v18->_location, a7);
  }

  return v18;
}

- (void)invokeChangeListener
{
  v3 = [(SXWebContentConfigurationProvider *)self changeBlock];

  if (v3)
  {
    v4 = [(SXWebContentConfigurationProvider *)self changeBlock];
    v4[2]();
  }
}

- (id)configurationForSize:(CGSize)a3 dataSources:(id)a4 sourceURL:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = (objc_class *)MEMORY[0x263F6C6C0];
  id v10 = a5;
  id v11 = a4;
  id v12 = [v9 alloc];
  v25 = [(SXWebContentConfigurationProvider *)self storeFrontProvider];
  id v13 = [v25 storeFrontIdentifier];
  id v14 = [(SXWebContentConfigurationProvider *)self locale];
  v24 = [(SXWebContentConfigurationProvider *)self presentationAttributesProvider];
  id v15 = [v24 presentationAttributes];
  id v16 = [v15 contentSizeCategory];
  v17 = [(SXWebContentConfigurationProvider *)self location];
  id v18 = objc_alloc_init(MEMORY[0x263F6C6E0]);
  v19 = [(SXWebContentConfigurationProvider *)self liveActivityAttributesProvider];
  LOBYTE(v23) = 0;
  LOBYTE(v22) = [v19 supportsLiveActivities];
  id v20 = objc_msgSend(v12, "initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:keyboardConfiguration:networkStatus:isTransitioning:", v13, v14, 0, v16, v11, v17, width, height, 0.0, 0.0, width, height, v10, 0, v18,
                  v22,
                  0,
                  0,
                  v23);

  return v20;
}

- (void)presentationAttributesDidChangeFrom:(id)a3 toAttributes:(id)a4
{
  id v6 = a4;
  v7 = [a3 contentSizeCategory];
  v8 = [v6 contentSizeCategory];

  LOBYTE(v6) = [v7 isEqualToString:v8];
  if ((v6 & 1) == 0)
  {
    [(SXWebContentConfigurationProvider *)self invokeChangeListener];
  }
}

- (SXPresentationAttributesProvider)presentationAttributesProvider
{
  return self->_presentationAttributesProvider;
}

- (SXStoreFrontProvider)storeFrontProvider
{
  return self->_storeFrontProvider;
}

- (SXLiveActivityAttributesProvider)liveActivityAttributesProvider
{
  return self->_liveActivityAttributesProvider;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (SWLocation)location
{
  return self->_location;
}

- (id)changeBlock
{
  return self->_changeBlock;
}

- (void)setChangeBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeBlock, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_liveActivityAttributesProvider, 0);
  objc_storeStrong((id *)&self->_storeFrontProvider, 0);
  objc_storeStrong((id *)&self->_presentationAttributesProvider, 0);
}

@end