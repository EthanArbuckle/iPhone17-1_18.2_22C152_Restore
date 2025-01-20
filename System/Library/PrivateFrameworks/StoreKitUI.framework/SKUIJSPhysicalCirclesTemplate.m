@interface SKUIJSPhysicalCirclesTemplate
- (SKUIJSPhysicalCirclesTemplate)initWithAppContext:(id)a3 DOMFeature:(id)a4;
- (void)_performAnimationWithType:(int64_t)a3 callback:(id)a4;
- (void)afterDOMUpdate:(id)a3;
- (void)performFinishAnimation:(id)a3;
- (void)performResetAnimation:(id)a3;
@end

@implementation SKUIJSPhysicalCirclesTemplate

- (SKUIJSPhysicalCirclesTemplate)initWithAppContext:(id)a3 DOMFeature:(id)a4
{
  id v6 = a3;
  objc_initWeak(&location, a4);
  v10.receiver = self;
  v10.super_class = (Class)SKUIJSPhysicalCirclesTemplate;
  v7 = [(IKJSObject *)&v10 initWithAppContext:v6];
  if (v7)
  {
    id v8 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_feature, v8);
  }
  objc_destroyWeak(&location);

  return v7;
}

- (void)afterDOMUpdate:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F30928];
  id v5 = a3;
  id v6 = [v4 managedValueWithValue:v5];
  v7 = [v5 context];

  id v8 = [v7 virtualMachine];

  [v8 addManagedReference:v6 withOwner:self];
  v9 = [(IKJSObject *)self appContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__SKUIJSPhysicalCirclesTemplate_afterDOMUpdate___block_invoke;
  v12[3] = &unk_1E6426950;
  v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  [v9 evaluateDelegateBlockSync:v12];
}

void __48__SKUIJSPhysicalCirclesTemplate_afterDOMUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SKUIJSPhysicalCirclesTemplate_afterDOMUpdate___block_invoke_2;
  v8[3] = &unk_1E6423618;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = v3;
  [WeakRetained _addDOMUpdateBlock:v8];
}

void __48__SKUIJSPhysicalCirclesTemplate_afterDOMUpdate___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SKUIJSPhysicalCirclesTemplate_afterDOMUpdate___block_invoke_3;
  v5[3] = &unk_1E6423DA8;
  v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 evaluate:v5 completionBlock:0];
}

uint64_t __48__SKUIJSPhysicalCirclesTemplate_afterDOMUpdate___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) value];
  id v3 = (id)[v2 callWithArguments:0];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v4 removeManagedReference:v5 withOwner:v6];
}

- (void)performFinishAnimation:(id)a3
{
}

- (void)performResetAnimation:(id)a3
{
}

- (void)_performAnimationWithType:(int64_t)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = [(IKJSObject *)self appContext];
  uint64_t v8 = objc_alloc_init(SKUIPhysicalCirclesAnimationRequest);
  [(SKUIPhysicalCirclesAnimationRequest *)v8 setAnimationType:a3];
  if (v6)
  {
    id v9 = [MEMORY[0x1E4F30928] managedValueWithValue:v6];
    id v10 = [v6 context];
    id v11 = [v10 virtualMachine];

    [v11 addManagedReference:v9 withOwner:self];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__SKUIJSPhysicalCirclesTemplate__performAnimationWithType_callback___block_invoke;
    v17[3] = &unk_1E6423618;
    id v18 = v7;
    id v19 = v9;
    id v20 = v11;
    v21 = self;
    id v12 = v11;
    id v13 = v9;
    [(SKUIPhysicalCirclesAnimationRequest *)v8 _setCompletionBlock:v17];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__SKUIJSPhysicalCirclesTemplate__performAnimationWithType_callback___block_invoke_3;
  v15[3] = &unk_1E6424C30;
  v15[4] = self;
  v16 = v8;
  id v14 = v8;
  [v7 evaluateDelegateBlockSync:v15];
}

void __68__SKUIJSPhysicalCirclesTemplate__performAnimationWithType_callback___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__SKUIJSPhysicalCirclesTemplate__performAnimationWithType_callback___block_invoke_2;
  v5[3] = &unk_1E6423DA8;
  v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 evaluate:v5 completionBlock:0];
}

void *__68__SKUIJSPhysicalCirclesTemplate__performAnimationWithType_callback___block_invoke_2(void *a1)
{
  result = (void *)a1[4];
  if (result)
  {
    id v3 = [result value];
    id v4 = (id)[v3 callWithArguments:0];

    uint64_t v6 = a1[4];
    uint64_t v5 = (void *)a1[5];
    uint64_t v7 = a1[6];
    return (void *)[v5 removeManagedReference:v6 withOwner:v7];
  }
  return result;
}

void __68__SKUIJSPhysicalCirclesTemplate__performAnimationWithType_callback___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained _requestAnimation:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
}

@end