@interface SKJSUIAnimatorDOMFeature
- (SKJSUIAnimatorDOMFeature)initWithAppContext:(id)a3 DOMFeature:(id)a4;
- (void)animate:(id)a3 :(id)a4;
@end

@implementation SKJSUIAnimatorDOMFeature

- (SKJSUIAnimatorDOMFeature)initWithAppContext:(id)a3 DOMFeature:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SKJSUIAnimatorDOMFeature;
  v7 = [(IKJSObject *)&v10 initWithAppContext:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_feature, v6);
  }

  return v8;
}

- (void)animate:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SKJSUIAnimatorDOMFeature_animate::__block_invoke;
  block[3] = &unk_265400958;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __37__SKJSUIAnimatorDOMFeature_animate::__block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  id v4 = [WeakRetained delegate];

  if (v4)
  {
    id v3 = objc_loadWeakRetained((id *)(a1[4] + 24));
    [v4 animatorFeature:v3 performAnimationWithName:a1[5] options:a1[6]];
  }
}

- (void).cxx_destruct
{
}

@end