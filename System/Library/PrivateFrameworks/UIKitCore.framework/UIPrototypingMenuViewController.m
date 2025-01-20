@interface UIPrototypingMenuViewController
@end

@implementation UIPrototypingMenuViewController

void __51___UIPrototypingMenuViewController__resetSettings___block_invoke(uint64_t a1)
{
  v2 = +[_UIPrototypingSettingsManager sharedManager];
  [v2 deleteAllStoredSettings];

  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 976);
  *(void *)(v3 + 976) = 0;

  id v5 = [*(id *)(a1 + 32) tableView];
  [v5 reloadData];
}

uint64_t __51___UIPrototypingMenuViewController__resetSettings___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

@end