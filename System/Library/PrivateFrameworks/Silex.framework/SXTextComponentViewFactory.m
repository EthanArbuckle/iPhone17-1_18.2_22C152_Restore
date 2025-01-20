@interface SXTextComponentViewFactory
- (SXTangierController)tangierController;
- (SXTextComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 tangierController:(id)a7;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
@end

@implementation SXTextComponentViewFactory

- (SXTextComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 tangierController:(id)a7
{
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)SXTextComponentViewFactory;
  v13 = [(SXComponentViewFactory *)&v16 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegateProvider:a5 componentStyleRendererFactory:a6];
  v14 = v13;
  if (v13) {
    objc_storeWeak((id *)&v13->_tangierController, v12);
  }

  return v14;
}

- (id)componentViewForComponent:(id)a3
{
  v4 = [SXTextComponentView alloc];
  v5 = [(SXComponentViewFactory *)self DOMObjectProvider];
  v6 = [(SXComponentViewFactory *)self viewport];
  v7 = [(SXComponentViewFactory *)self presentationDelegateProvider];
  v8 = [v7 presentationDelegate];
  v9 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
  v10 = [(SXTextComponentViewFactory *)self tangierController];
  v11 = [(SXTextComponentView *)v4 initWithDOMObjectProvider:v5 viewport:v6 presentationDelegate:v8 componentStyleRendererFactory:v9 tangierController:v10];

  return v11;
}

- (id)type
{
  return @"text";
}

- (int)role
{
  return 0;
}

- (SXTangierController)tangierController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tangierController);
  return (SXTangierController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end