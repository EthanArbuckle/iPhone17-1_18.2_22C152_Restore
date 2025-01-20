@interface UIDragRelaySession
@end

@implementation UIDragRelaySession

void __47___UIDragRelaySession_beginDragFromView_point___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dragSessionCompletedInitialCheckIn];
}

void __58___UIDragRelaySession_updateDragPreviewForItemsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v7 = (id)objc_opt_new();
  [v7 setIndex:a2];
  [*(id *)(a1 + 32) addObject:v7];
  v4 = [*(id *)(a1 + 40) dragItems];
  v5 = [v4 objectAtIndexedSubscript:a2];

  v6 = [v5 previewProvider];
  [v5 setPreviewProvider:0];
  [v5 setPreviewProvider:v6];
  [v5 _updatePreferredPreview];
}

@end