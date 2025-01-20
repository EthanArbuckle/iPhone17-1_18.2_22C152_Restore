@interface SXDataTableComponentViewFactory
- (SXAdIgnorableViewFactory)adIgnorableViewFactory;
- (SXComponentActionHandler)componentActionHandler;
- (SXComponentController)componentController;
- (SXDataTableComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 imageViewFactory:(id)a7 componentActionHandler:(id)a8 textComponentLayoutHosting:(id)a9 componentController:(id)a10 adIgnorableViewFactory:(id)a11 config:(id)a12;
- (SXFeatures)config;
- (SXImageViewFactory)imageViewFactory;
- (SXTextComponentLayoutHosting)textComponentLayoutHosting;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
- (void)setConfig:(id)a3;
@end

@implementation SXDataTableComponentViewFactory

- (SXDataTableComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 imageViewFactory:(id)a7 componentActionHandler:(id)a8 textComponentLayoutHosting:(id)a9 componentController:(id)a10 adIgnorableViewFactory:(id)a11 config:(id)a12
{
  id v27 = a7;
  id v26 = a8;
  id v18 = a9;
  id v19 = a10;
  id v25 = a11;
  id v20 = a12;
  v28.receiver = self;
  v28.super_class = (Class)SXDataTableComponentViewFactory;
  v21 = [(SXComponentViewFactory *)&v28 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegateProvider:a5 componentStyleRendererFactory:a6];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_imageViewFactory, a7);
    objc_storeStrong((id *)&v22->_componentActionHandler, a8);
    objc_storeWeak((id *)&v22->_textComponentLayoutHosting, v18);
    objc_storeWeak((id *)&v22->_componentController, v19);
    objc_storeStrong((id *)&v22->_adIgnorableViewFactory, a11);
    objc_storeStrong((id *)&v22->_config, a12);
  }

  return v22;
}

- (id)componentViewForComponent:(id)a3
{
  v16 = [SXDataTableComponentView alloc];
  v15 = [(SXComponentViewFactory *)self DOMObjectProvider];
  v4 = [(SXComponentViewFactory *)self viewport];
  v17 = [(SXComponentViewFactory *)self presentationDelegateProvider];
  v5 = [v17 presentationDelegate];
  v6 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
  v7 = [(SXDataTableComponentViewFactory *)self imageViewFactory];
  v8 = [(SXDataTableComponentViewFactory *)self componentActionHandler];
  v9 = [(SXDataTableComponentViewFactory *)self textComponentLayoutHosting];
  v10 = [(SXDataTableComponentViewFactory *)self componentController];
  v11 = [(SXDataTableComponentViewFactory *)self adIgnorableViewFactory];
  v12 = [(SXDataTableComponentViewFactory *)self config];
  v13 = [(SXDataTableComponentView *)v16 initWithDOMObjectProvider:v15 viewport:v4 presentationDelegate:v5 componentStyleRendererFactory:v6 imageViewFactory:v7 componentActionHandler:v8 textComponentLayoutHosting:v9 componentController:v10 adIgnorableViewFactory:v11 config:v12];

  return v13;
}

- (id)type
{
  return @"data_table";
}

- (int)role
{
  return 0;
}

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXComponentActionHandler)componentActionHandler
{
  return self->_componentActionHandler;
}

- (SXTextComponentLayoutHosting)textComponentLayoutHosting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textComponentLayoutHosting);
  return (SXTextComponentLayoutHosting *)WeakRetained;
}

- (SXComponentController)componentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentController);
  return (SXComponentController *)WeakRetained;
}

- (SXAdIgnorableViewFactory)adIgnorableViewFactory
{
  return self->_adIgnorableViewFactory;
}

- (SXFeatures)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_adIgnorableViewFactory, 0);
  objc_destroyWeak((id *)&self->_componentController);
  objc_destroyWeak((id *)&self->_textComponentLayoutHosting);
  objc_storeStrong((id *)&self->_componentActionHandler, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
}

@end