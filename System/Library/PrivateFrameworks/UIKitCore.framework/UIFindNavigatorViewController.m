@interface UIFindNavigatorViewController
@end

@implementation UIFindNavigatorViewController

id __45___UIFindNavigatorViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1064) parentInteraction];
  v3 = [v2 optionsMenuProvider];

  if (v3)
  {
    v4 = [*(id *)(*(void *)(a1 + 32) + 1064) parentInteraction];
    v5 = [v4 optionsMenuProvider];
    v6 = [*(id *)(*(void *)(a1 + 32) + 1024) suggestedFindMenuItems];
    v7 = ((void (**)(void, void *))v5)[2](v5, v6);
  }
  else
  {
    v4 = [*(id *)(*(void *)(a1 + 32) + 1024) suggestedFindMenuItems];
    v7 = +[UIMenu menuWithChildren:v4];
  }

  return v7;
}

@end