@interface PKPGSVTransitionInterstitialItem
- (PKPGSVTransitionInterstitialItem)init;
- (id)initWithView:(id *)a1;
- (void)beginTrackingWithConfiguration:(void *)a3 handler:;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PKPGSVTransitionInterstitialItem

- (PKPGSVTransitionInterstitialItem)init
{
  return 0;
}

- (id)initWithView:(id *)a1
{
  result = a2;
  v5 = result;
  if (!a1) {
    goto LABEL_5;
  }
  if (result)
  {
    v30.receiver = a1;
    v30.super_class = (Class)PKPGSVTransitionInterstitialItem;
    v6 = (id *)objc_msgSendSuper2(&v30, sel_init);
    a1 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 1, a2);
      *((unsigned char *)a1 + 16) = [a1[1] isHidden];
      id v7 = objc_alloc(MEMORY[0x1E4FB17D8]);
      [v5 bounds];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      v16 = [MEMORY[0x1E4FB17E0] preferredFormat];
      v17 = objc_msgSend(v7, "initWithBounds:format:", v16, v9, v11, v13, v15);

      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __49__PKPGSVTransitionInterstitialItem_initWithView___block_invoke;
      v28[3] = &unk_1E59CDA50;
      v29 = v5;
      uint64_t v18 = [v17 imageWithActions:v28];
      id v19 = a1[3];
      a1[3] = (id)v18;

      id v20 = a1[3];
      [a1[1] alignmentRectInsets];
      uint64_t v21 = objc_msgSend(v20, "imageWithAlignmentRectInsets:");
      id v22 = a1[3];
      a1[3] = (id)v21;

      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v24 = a1[4];
      a1[4] = v23;

      v25 = (void *)MEMORY[0x1E4FB1EB0];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __49__PKPGSVTransitionInterstitialItem_initWithView___block_invoke_3;
      v26[3] = &unk_1E59CA7D0;
      a1 = a1;
      v27 = a1;
      [v25 performWithoutAnimation:v26];
    }
LABEL_5:

    return a1;
  }
  __break(1u);
  return result;
}

void __49__PKPGSVTransitionInterstitialItem_initWithView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) traitCollection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PKPGSVTransitionInterstitialItem_initWithView___block_invoke_2;
  v6[3] = &unk_1E59CA870;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  PKUIPerformWithEffectiveTraitCollection(v4, v6);
}

void __49__PKPGSVTransitionInterstitialItem_initWithView___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v2, "renderInContext:", objc_msgSend(*(id *)(a1 + 40), "CGContext"));
}

uint64_t __49__PKPGSVTransitionInterstitialItem_initWithView___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setHidden:1];
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    id v3 = self->_view;
    BOOL viewWasHidden = self->_viewWasHidden;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PKPGSVTransitionInterstitialItem_dealloc__block_invoke;
    block[3] = &unk_1E59CDA78;
    id v8 = v3;
    BOOL v9 = viewWasHidden;
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v6.receiver = self;
  v6.super_class = (Class)PKPGSVTransitionInterstitialItem;
  [(PKPGSVTransitionInterstitialItem *)&v6 dealloc];
}

void __43__PKPGSVTransitionInterstitialItem_dealloc__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1EB0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__PKPGSVTransitionInterstitialItem_dealloc__block_invoke_2;
  v3[3] = &unk_1E59CDA78;
  id v4 = *(id *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  [v2 performWithoutAnimation:v3];
}

uint64_t __43__PKPGSVTransitionInterstitialItem_dealloc__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:*(unsigned __int8 *)(a1 + 40)];
}

- (void)beginTrackingWithConfiguration:(void *)a3 handler:
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    __break(1u);
LABEL_13:
    double v21 = *MEMORY[0x1E4F1DAD8];
    double v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [*(id *)(a1 + 24) size];
    objc_msgSend(v4, "setFrame:", v21, v22, v23, v24);
    goto LABEL_6;
  }
  id v3 = (void (**)(void, void, void))v7;
  id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = *(void *)(a1 + 24);
  }
  id v4 = (void *)[v8 initWithImage:v9];
  if (*(unsigned char *)(a1 + 40)) {
    goto LABEL_13;
  }
LABEL_6:
  [*(id *)(a1 + 8) anchorPoint];
  objc_msgSend(v4, "setAnchorPoint:");
  [v4 setHidden:1];
  if (a2)
  {
    double v10 = [v4 layer];
    double v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v11 setName:@"gaussianBlur"];
    double v12 = [NSNumber numberWithDouble:8.33333333];
    [v11 setValue:v12 forKey:@"inputRadius"];

    v34[0] = v11;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    [v10 setFilters:v13];
  }
  objc_msgSend(v4, "pkui_setAlpha:animated:", 0, 0.0);
  if (*(unsigned char *)(a1 + 40))
  {
    ((void (**)(void, void *, void *))v3)[2](v3, v4, &__block_literal_global_36);
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v4];
    objc_initWeak(&location, (id)a1);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__PKPGSVTransitionInterstitialItem_beginTrackingWithConfiguration_handler___block_invoke_2;
    aBlock[3] = &unk_1E59CB010;
    objc_copyWeak(&v32, &location);
    id v14 = v4;
    id v31 = v14;
    double v15 = _Block_copy(aBlock);
    id v16 = objc_alloc(MEMORY[0x1E4F84630]);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __75__PKPGSVTransitionInterstitialItem_beginTrackingWithConfiguration_handler___block_invoke_3;
    v28[3] = &unk_1E59CAA98;
    id v17 = v15;
    id v29 = v17;
    uint64_t v18 = (void *)[v16 initWithBlock:v28];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __75__PKPGSVTransitionInterstitialItem_beginTrackingWithConfiguration_handler___block_invoke_4;
    v25[3] = &unk_1E59CAD18;
    id v19 = v18;
    id v26 = v19;
    id v20 = v17;
    id v27 = v20;
    ((void (**)(void, id, void *))v3)[2](v3, v14, v25);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
}

void __75__PKPGSVTransitionInterstitialItem_beginTrackingWithConfiguration_handler___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setImage:0];
    [WeakRetained[4] removeObjectIdenticalTo:*(void *)(a1 + 32)];
  }
}

uint64_t __75__PKPGSVTransitionInterstitialItem_beginTrackingWithConfiguration_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__PKPGSVTransitionInterstitialItem_beginTrackingWithConfiguration_handler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 40))
  {
    *(unsigned char *)(a1 + 40) = 1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__PKPGSVTransitionInterstitialItem_invalidate__block_invoke;
    v11[3] = &unk_1E59CA7D0;
    v11[4] = a1;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v11];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "setImage:", 0, (void)v7);
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

uint64_t __46__PKPGSVTransitionInterstitialItem_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setHidden:*(unsigned __int8 *)(*(void *)(a1 + 32) + 16)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendedSnapshots, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end