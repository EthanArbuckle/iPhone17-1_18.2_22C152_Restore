@interface CACElementActionsPresentationManager
+ (BOOL)canShowElementActionsForElement:(id)a3;
- (BOOL)isOverlay;
- (void)elementActionsPresentationViewController:(id)a3 hideWithCompletion:(id)a4;
- (void)showElementActionsForElement:(id)a3 usingPortraitUpRect:(CGRect)a4;
@end

@implementation CACElementActionsPresentationManager

+ (BOOL)canShowElementActionsForElement:(id)a3
{
  return +[CACElementActionsPresentationViewController canShowElementActionsForElement:a3];
}

- (void)showElementActionsForElement:(id)a3 usingPortraitUpRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__CACElementActionsPresentationManager_showElementActionsForElement_usingPortraitUpRect___block_invoke;
  v17[3] = &unk_264D11F80;
  v17[4] = self;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __89__CACElementActionsPresentationManager_showElementActionsForElement_usingPortraitUpRect___block_invoke_2;
  v11[3] = &unk_264D11FA8;
  id v12 = v9;
  CGFloat v13 = x;
  CGFloat v14 = y;
  CGFloat v15 = width;
  CGFloat v16 = height;
  id v10 = v9;
  [(CACSimpleContentViewManager *)self showViewControllerWithCreationHandler:v17 updateHandler:v11];
}

CACElementActionsPresentationViewController *__89__CACElementActionsPresentationManager_showElementActionsForElement_usingPortraitUpRect___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(CACElementActionsPresentationViewController);
  [(CACElementActionsPresentationViewController *)v2 setElementActionsDelegate:*(void *)(a1 + 32)];
  return v2;
}

void __89__CACElementActionsPresentationManager_showElementActionsForElement_usingPortraitUpRect___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setElement:v3];
  objc_msgSend(v4, "setSourceRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)isOverlay
{
  return 0;
}

- (void)elementActionsPresentationViewController:(id)a3 hideWithCompletion:(id)a4
{
}

@end