@interface PXContentSyndicationSectionHeaderLayout
@end

@implementation PXContentSyndicationSectionHeaderLayout

void __121___PXContentSyndicationSectionHeaderLayout_additionalContextMenuActionsForAttributionViewInContentSyndicationHeaderView___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canPerformActionType:*(void *)(a1 + 40)])
  {
    id v2 = [*(id *)(a1 + 32) actionPerformerForActionType:*(void *)(a1 + 40)];
    [v2 performActionWithCompletionHandler:0];
  }
}

@end