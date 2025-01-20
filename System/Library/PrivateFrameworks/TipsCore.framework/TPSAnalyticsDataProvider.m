@interface TPSAnalyticsDataProvider
- (TPSAnalyticsDataProvider)initWithDataSource:(id)a3;
- (TPSAnalyticsDataProviderDataSource)dataSource;
- (id)bundleIDForIdentifier:(id)a3;
- (id)contextForIdentifier:(id)a3;
- (id)correlationIDForIdentifier:(id)a3;
- (id)deliveryInfoVersion;
- (id)displayTypeForIdentifier:(id)a3;
- (id)experimentCampID;
- (id)experimentID;
- (unint64_t)hintDisplayedCountForIdentifier:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation TPSAnalyticsDataProvider

- (id)deliveryInfoVersion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = [WeakRetained deliveryInfoVersion];

  return v3;
}

- (TPSAnalyticsDataProvider)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSAnalyticsDataProvider;
  v5 = [(TPSAnalyticsDataProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

- (id)displayTypeForIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  v6 = [WeakRetained displayTypeForIdentifier:v4];

  return v6;
}

- (id)experimentCampID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = [WeakRetained experimentCampID];

  return v3;
}

- (id)experimentID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = [WeakRetained experimentID];

  return v3;
}

- (id)correlationIDForIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  v6 = [WeakRetained correlationIDForIdentifier:v4];

  return v6;
}

- (id)bundleIDForIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  v6 = [WeakRetained bundleIDForIdentifier:v4];

  return v6;
}

- (id)contextForIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  v6 = [WeakRetained contextForIdentifier:v4];

  return v6;
}

- (unint64_t)hintDisplayedCountForIdentifier:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  unint64_t v6 = [WeakRetained hintDisplayedCountForIdentifier:v4];

  return v6;
}

- (TPSAnalyticsDataProviderDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (TPSAnalyticsDataProviderDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end