@interface SXComponentViewFactory
- (NSString)type;
- (SXComponentStyleRendererFactory)componentStyleRendererFactory;
- (SXComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXPresentationDelegateProvider)presentationDelegateProvider;
- (SXViewport)viewport;
- (id)componentViewForComponent:(id)a3;
- (int)role;
@end

@implementation SXComponentViewFactory

- (SXComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SXComponentViewFactory;
  v15 = [(SXComponentViewFactory *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v16->_viewport, a4);
    objc_storeStrong((id *)&v16->_presentationDelegateProvider, a5);
    objc_storeStrong((id *)&v16->_componentStyleRendererFactory, a6);
  }

  return v16;
}

- (NSString)type
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:@"Unavailable" reason:@"Must be implemented by subclass" userInfo:0];
  objc_exception_throw(v2);
}

- (int)role
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:@"Unavailable" reason:@"Must be implemented by subclass" userInfo:0];
  objc_exception_throw(v2);
}

- (id)componentViewForComponent:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF940] exceptionWithName:@"Unavailable" reason:@"Must be implemented by subclass" userInfo:0];
  objc_exception_throw(v4);
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXPresentationDelegateProvider)presentationDelegateProvider
{
  return self->_presentationDelegateProvider;
}

- (SXComponentStyleRendererFactory)componentStyleRendererFactory
{
  return self->_componentStyleRendererFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentStyleRendererFactory, 0);
  objc_storeStrong((id *)&self->_presentationDelegateProvider, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end