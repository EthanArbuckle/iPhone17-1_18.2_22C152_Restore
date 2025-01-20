@interface SXAdvertisingSettingsFactory
- (SXAdvertisingSettingsFactory)initWithDocumentProvider:(id)a3 debugSettingsProvider:(id)a4;
- (SXDebugAdvertisementSettingsProvider)debugSettingsProvider;
- (SXDocumentProviding)documentProvider;
- (id)createAdvertisingSettingsWithDOMObjectProvider:(id)a3;
@end

@implementation SXAdvertisingSettingsFactory

- (SXAdvertisingSettingsFactory)initWithDocumentProvider:(id)a3 debugSettingsProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXAdvertisingSettingsFactory;
  v9 = [(SXAdvertisingSettingsFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_documentProvider, a3);
    objc_storeStrong((id *)&v10->_debugSettingsProvider, a4);
  }

  return v10;
}

- (id)createAdvertisingSettingsWithDOMObjectProvider:(id)a3
{
  id v4 = a3;
  v5 = [(SXAdvertisingSettingsFactory *)self debugSettingsProvider];
  v6 = [v5 debugSettings];

  if (v6)
  {
    id v7 = v6;
    goto LABEL_10;
  }
  id v8 = [v4 autoPlacement];
  v9 = [v8 advertisement];

  if (v9)
  {
    if (![v9 enabled])
    {
      id v7 = 0;
      goto LABEL_9;
    }
    v10 = [SXAutoPlacementAdvertisingSettings alloc];
    uint64_t v11 = [v9 frequency];
    uint64_t v12 = [v9 bannerType];
    v13 = [v9 layout];
    uint64_t v14 = [v9 distanceFromMedia];
    id v7 = -[SXAutoPlacementAdvertisingSettings initWithFrequency:bannerType:layout:distanceFromMedia:](v10, "initWithFrequency:bannerType:layout:distanceFromMedia:", v11, v12, v13, v14, v15);
  }
  else
  {
    v13 = [(SXAdvertisingSettingsFactory *)self documentProvider];
    v16 = [v13 document];
    id v7 = [v16 advertisingSettings];
  }
LABEL_9:

LABEL_10:
  return v7;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (SXDebugAdvertisementSettingsProvider)debugSettingsProvider
{
  return self->_debugSettingsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugSettingsProvider, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
}

@end