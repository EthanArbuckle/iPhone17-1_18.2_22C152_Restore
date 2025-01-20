@interface SUUICollectionDOMFeature
+ (id)featureName;
+ (id)makeFeatureJSObjectForFeature:(id)a3;
- (IKAppContext)appContext;
- (NSString)featureName;
- (SUUICollectionDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4;
- (SUUICollectionDOMFeatureTargetting)collectionTarget;
- (void)setCollectionTarget:(id)a3;
- (void)setEditing:(BOOL)a3 options:(id)a4;
@end

@implementation SUUICollectionDOMFeature

- (SUUICollectionDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUICollectionDOMFeature;
  v8 = [(SUUICollectionDOMFeature *)&v13 init];
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
  v4 = [SUUIJSDOMFeatureCollection alloc];
  v5 = [v3 appContext];
  id v6 = [(IKJSObject *)v4 initWithAppContext:v5];

  [(SUUIJSDOMFeatureCollection *)v6 setAppBridge:v3];
  return v6;
}

+ (id)featureName
{
  return @"Collection";
}

- (void)setEditing:(BOOL)a3 options:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__SUUICollectionDOMFeature_setEditing_options___block_invoke;
  v9[3] = &unk_265402880;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [WeakRetained evaluateDelegateBlockSync:v9];
}

void __47__SUUICollectionDOMFeature_setEditing_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) objectForKey:@"animated"];
  objc_msgSend(WeakRetained, "setEditing:animated:", v2, objc_msgSend(v3, "BOOLValue"));
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (SUUICollectionDOMFeatureTargetting)collectionTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionTarget);
  return (SUUICollectionDOMFeatureTargetting *)WeakRetained;
}

- (void)setCollectionTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionTarget);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

@end