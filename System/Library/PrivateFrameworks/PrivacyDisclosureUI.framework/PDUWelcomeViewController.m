@interface PDUWelcomeViewController
@end

@implementation PDUWelcomeViewController

void __59__PDUWelcomeViewController_iOS__requestIconForApplication___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__PDUWelcomeViewController_iOS__requestIconForApplication___block_invoke_2;
  v3[3] = &unk_26547A590;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  [v1 getCGImageForImageDescriptor:v2 completion:v3];
  objc_destroyWeak(&v4);
}

void __59__PDUWelcomeViewController_iOS__requestIconForApplication___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (a2 && WeakRetained)
  {
    v5 = [MEMORY[0x263F1C6B0] imageWithCGImage:a2];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__PDUWelcomeViewController_iOS__requestIconForApplication___block_invoke_3;
    v7[3] = &unk_26547A568;
    id v8 = v4;
    id v9 = v5;
    id v6 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

void __59__PDUWelcomeViewController_iOS__requestIconForApplication___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) headerView];
  [v2 setIcon:*(void *)(a1 + 40) accessibilityLabel:@"AppIcon"];
}

@end