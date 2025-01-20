@interface SXVideoComponentAnalyticsReporting
- (SXAnalyticsReporting)analyticsReporting;
- (SXVideoComponent)component;
- (SXVideoComponentAnalyticsReporting)initWithComponent:(id)a3 analyticsProviding:(id)a4;
- (void)reportEvent:(id)a3;
@end

@implementation SXVideoComponentAnalyticsReporting

- (SXVideoComponentAnalyticsReporting)initWithComponent:(id)a3 analyticsProviding:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXVideoComponentAnalyticsReporting;
  v9 = [(SXVideoComponentAnalyticsReporting *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_component, a3);
    objc_storeWeak((id *)&v10->_analyticsReporting, v8);
  }

  return v10;
}

- (void)reportEvent:(id)a3
{
  id v16 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v16;
    v5 = [(SXVideoComponentAnalyticsReporting *)self component];
    v6 = [v5 analytics];
    id v7 = [v6 jsonDictionary];
    [v4 setMetaData:v7];

    id v8 = [(SXVideoComponentAnalyticsReporting *)self component];
    v9 = [v8 identifier];
    [v4 setComponentIdentifier:v9];

    v10 = [(SXVideoComponentAnalyticsReporting *)self component];
    v11 = [v10 type];
    [v4 setComponentType:v11];

    objc_super v12 = [(SXVideoComponentAnalyticsReporting *)self component];
    v13 = [v12 classification];
    v14 = [(id)objc_opt_class() roleString];
    [v4 setComponentRole:v14];
  }
  v15 = [(SXVideoComponentAnalyticsReporting *)self analyticsReporting];
  [v15 reportEvent:v16];
}

- (SXVideoComponent)component
{
  return self->_component;
}

- (SXAnalyticsReporting)analyticsReporting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsReporting);
  return (SXAnalyticsReporting *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsReporting);
  objc_storeStrong((id *)&self->_component, 0);
}

@end