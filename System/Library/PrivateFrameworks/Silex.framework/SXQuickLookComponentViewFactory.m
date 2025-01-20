@interface SXQuickLookComponentViewFactory
- (SXQuickLookComponentFileProvider)fileProvider;
- (SXQuickLookComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 fileProvider:(id)a7 quickLookModule:(id)a8;
- (SXQuickLookModule)quickLookModule;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
@end

@implementation SXQuickLookComponentViewFactory

- (SXQuickLookComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 fileProvider:(id)a7 quickLookModule:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SXQuickLookComponentViewFactory;
  v17 = [(SXComponentViewFactory *)&v20 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegateProvider:a5 componentStyleRendererFactory:a6];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_quickLookModule, a8);
    objc_storeStrong((id *)&v18->_fileProvider, a7);
  }

  return v18;
}

- (id)componentViewForComponent:(id)a3
{
  v4 = [SXQuickLookComponentView alloc];
  v5 = [(SXComponentViewFactory *)self DOMObjectProvider];
  v6 = [(SXComponentViewFactory *)self viewport];
  v7 = [(SXComponentViewFactory *)self presentationDelegateProvider];
  v8 = [v7 presentationDelegate];
  v9 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
  v10 = [(SXQuickLookComponentViewFactory *)self fileProvider];
  v11 = [(SXQuickLookComponentViewFactory *)self quickLookModule];
  v12 = [(SXQuickLookComponentView *)v4 initWithDOMObjectProvider:v5 viewport:v6 presentationDelegate:v8 componentStyleRendererFactory:v9 fileProvider:v10 quickLookModule:v11];

  return v12;
}

- (id)type
{
  return @"quicklook";
}

- (int)role
{
  return 0;
}

- (SXQuickLookModule)quickLookModule
{
  return self->_quickLookModule;
}

- (SXQuickLookComponentFileProvider)fileProvider
{
  return self->_fileProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProvider, 0);
  objc_storeStrong((id *)&self->_quickLookModule, 0);
}

@end