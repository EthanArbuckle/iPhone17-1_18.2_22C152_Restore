@interface UIRemoteCategoryKeyView
- (id)contentViewController;
- (id)emojiKeyManager;
- (void)setEmojiKeyManager:(id)a3;
@end

@implementation UIRemoteCategoryKeyView

- (id)contentViewController
{
  viewController = self->_viewController;
  if (!viewController)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v4 = (void *)_MergedGlobals_1_30;
    uint64_t v13 = _MergedGlobals_1_30;
    if (!_MergedGlobals_1_30)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getSTKCategoryViewControllerClass_block_invoke;
      v9[3] = &unk_1E52D9900;
      v9[4] = &v10;
      __getSTKCategoryViewControllerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = v4;
    _Block_object_dispose(&v10, 8);
    v6 = (STKCategoryViewController *)objc_alloc_init(v5);
    v7 = self->_viewController;
    self->_viewController = v6;

    viewController = self->_viewController;
  }
  return viewController;
}

- (id)emojiKeyManager
{
  id WeakRetained = objc_loadWeakRetained(&self->_emojiKeyManager);
  return WeakRetained;
}

- (void)setEmojiKeyManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_emojiKeyManager);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end