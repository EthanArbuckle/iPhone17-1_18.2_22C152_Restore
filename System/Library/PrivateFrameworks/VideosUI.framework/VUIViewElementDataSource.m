@interface VUIViewElementDataSource
- (IKViewElement)viewElement;
- (NSDictionary)dataDictionary;
- (VUIRouterDataSource)routerDataSource;
- (VUIViewElementDataSource)initWithDataDictionary:(id)a3 viewElement:(id)a4;
- (void)setDataDictionary:(id)a3;
- (void)setRouterDataSource:(id)a3;
- (void)setViewElement:(id)a3;
@end

@implementation VUIViewElementDataSource

- (VUIViewElementDataSource)initWithDataDictionary:(id)a3 viewElement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIViewElementDataSource;
  v9 = [(VUIViewElementDataSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataDictionary, a3);
    objc_storeWeak((id *)&v10->_viewElement, v8);
  }

  return v10;
}

- (VUIRouterDataSource)routerDataSource
{
  routerDataSource = self->_routerDataSource;
  if (!routerDataSource)
  {
    v4 = [(NSDictionary *)self->_dataDictionary objectForKeyedSubscript:@"routerDataSource"];
    v5 = [[VUIRouterDataSource alloc] initWithRouterData:v4 appContext:0];
    v6 = self->_routerDataSource;
    self->_routerDataSource = v5;

    routerDataSource = self->_routerDataSource;
  }
  return routerDataSource;
}

- (void)setRouterDataSource:(id)a3
{
}

- (NSDictionary)dataDictionary
{
  return self->_dataDictionary;
}

- (void)setDataDictionary:(id)a3
{
}

- (IKViewElement)viewElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewElement);
  return (IKViewElement *)WeakRetained;
}

- (void)setViewElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewElement);
  objc_storeStrong((id *)&self->_dataDictionary, 0);
  objc_storeStrong((id *)&self->_routerDataSource, 0);
}

@end