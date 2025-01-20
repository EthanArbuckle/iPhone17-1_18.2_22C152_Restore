@interface SKJSUIAnimatorDOMFeature
- (SKJSUIAnimatorDOMFeature)initWithAppContext:(id)a3 DOMFeature:(id)a4;
- (void)animate:(id)a3 :(id)a4;
@end

@implementation SKJSUIAnimatorDOMFeature

- (SKJSUIAnimatorDOMFeature)initWithAppContext:(id)a3 DOMFeature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKJSUIAnimatorDOMFeature initWithAppContext:DOMFeature:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKJSUIAnimatorDOMFeature;
  v16 = [(IKJSObject *)&v19 initWithAppContext:v6];
  v17 = v16;
  if (v16) {
    objc_storeWeak((id *)&v16->_feature, v7);
  }

  return v17;
}

- (void)animate:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SKJSUIAnimatorDOMFeature_animate::__block_invoke;
  block[3] = &unk_1E64225B0;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
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

- (void)initWithAppContext:(uint64_t)a3 DOMFeature:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end