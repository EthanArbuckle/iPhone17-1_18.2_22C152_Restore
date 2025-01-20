@interface UISaveToCameraRollSaveItemsController
@end

@implementation UISaveToCameraRollSaveItemsController

uint64_t __58___UISaveToCameraRollSaveItemsController_beginSavingItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _didCompleteSavingItem:*(void *)(a1 + 40) error:a3 contextInfo:0];
}

uint64_t __83___UISaveToCameraRollSaveItemsController__didCompleteSavingItem_error_contextInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteDidCompleteSavingItem:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

@end