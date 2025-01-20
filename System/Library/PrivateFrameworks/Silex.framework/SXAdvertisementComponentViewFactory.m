@interface SXAdvertisementComponentViewFactory
- (TFResolver)resolver;
- (id)componentViewForComponent:(id)a3;
- (id)type;
- (int)role;
@end

@implementation SXAdvertisementComponentViewFactory

- (id)componentViewForComponent:(id)a3
{
  v4 = [SXAdvertisementComponentView alloc];
  v5 = [(SXComponentViewFactory *)self DOMObjectProvider];
  v6 = [(SXComponentViewFactory *)self viewport];
  v7 = [(SXComponentViewFactory *)self presentationDelegateProvider];
  v8 = [v7 presentationDelegate];
  v9 = [(SXComponentViewFactory *)self componentStyleRendererFactory];
  v10 = [(SXComponentView *)v4 initWithDOMObjectProvider:v5 viewport:v6 presentationDelegate:v8 componentStyleRendererFactory:v9];

  return v10;
}

- (id)type
{
  return @"advertisement";
}

- (int)role
{
  return 0;
}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (void).cxx_destruct
{
}

@end