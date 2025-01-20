@interface SUUIAnimatorDOMFeature
+ (id)featureName;
+ (id)makeFeatureJSObjectForFeature:(id)a3;
- (IKAppContext)appContext;
- (NSString)featureName;
- (SUUIAnimatorDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4;
- (SUUIAnimatorDOMFeatureDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation SUUIAnimatorDOMFeature

- (SUUIAnimatorDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIAnimatorDOMFeature;
  v8 = [(SUUIAnimatorDOMFeature *)&v13 init];
  if (v8)
  {
    v9 = [v6 appContext];
    objc_storeWeak((id *)&v8->_appContext, v9);

    uint64_t v10 = [v7 copy];
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v10;
  }
  return v8;
}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3 = a3;
  v4 = [SKJSUIAnimatorDOMFeature alloc];
  v5 = [v3 appContext];
  id v6 = [(SKJSUIAnimatorDOMFeature *)v4 initWithAppContext:v5 DOMFeature:v3];

  return v6;
}

+ (id)featureName
{
  return @"animator";
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (SUUIAnimatorDOMFeatureDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIAnimatorDOMFeatureDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_destroyWeak((id *)&self->_delegate);
}

@end