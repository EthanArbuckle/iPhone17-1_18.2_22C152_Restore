@interface SXIssueCoverComponentViewFactory
- (SXIssueCoverComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 viewProvider:(id)a7;
- (SXIssueCoverViewProvider)viewProvider;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
@end

@implementation SXIssueCoverComponentViewFactory

- (SXIssueCoverComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6 viewProvider:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SXIssueCoverComponentViewFactory;
  v14 = [(SXComponentViewFactory *)&v17 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegateProvider:a5 componentStyleRendererFactory:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_viewProvider, a7);
  }

  return v15;
}

- (id)componentViewForComponent:(id)a3
{
  v4 = [SXIssueCoverComponentView alloc];
  v5 = [(SXComponentViewFactory *)self DOMObjectProvider];
  v6 = [(SXIssueCoverComponentViewFactory *)self viewProvider];
  v7 = [(SXComponentViewFactory *)self presentationDelegateProvider];
  v8 = [v7 presentationDelegate];
  v9 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
  v10 = [(SXIssueCoverComponentViewFactory *)self viewProvider];
  v11 = [(SXIssueCoverComponentView *)v4 initWithDOMObjectProvider:v5 viewport:v6 presentationDelegate:v8 componentStyleRendererFactory:v9 viewProvider:v10];

  return v11;
}

- (id)type
{
  return @"issue_cover";
}

- (int)role
{
  return 0;
}

- (SXIssueCoverViewProvider)viewProvider
{
  return self->_viewProvider;
}

- (void).cxx_destruct
{
}

@end