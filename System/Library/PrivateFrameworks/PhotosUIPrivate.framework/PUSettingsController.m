@interface PUSettingsController
@end

@implementation PUSettingsController

void __35___PUSettingsController__hideToast__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTitle:@"Don’t ever show this reminder again?"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35___PUSettingsController__hideToast__block_invoke_2;
  v4[3] = &unk_1E5F2ED10;
  id v5 = *(id *)(a1 + 32);
  [v3 addActionWithTitle:@"Don‘t Show Ever Again" style:2 action:v4];
  [v3 addActionWithTitle:@"Cancel" style:1 action:0];
}

uint64_t __35___PUSettingsController__hideToast__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBool:1 forKey:@"InternalSettingsDisableReminderToQuitAfterChange"];
}

uint64_t __55___PUSettingsController__showReminderToQuitAfterChange__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PURootSettings configureToastForReminderToQuitAfterLaunch:a2 target:*(void *)(a1 + 32)];
}

void __47___PUSettingsController__clearSettingsOverride__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  exit(0);
}

uint64_t __49___PUSettingsController__warnForSettingsOverride__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSettingsOverride];
}

uint64_t __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsFavorite:*(unsigned char *)(a1 + 48) == 0 settings:*(void *)(a1 + 40)];
}

void __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 searchNavigationController];
  [v1 presentViewController:v2 animated:1 completion:0];
}

void __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke_3(uint64_t a1)
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F90670]) initWithSettings:*(void *)(a1 + 32)];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v3];
  [*(id *)(a1 + 40) presentViewController:v2 animated:1 completion:0];
}

uint64_t __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke_4()
{
  return +[PURootSettings _presentTapToRadar];
}

void __63___PUSettingsController__updateNavigationItemOfViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    v4 = v3[2]();
    id v3 = v5;
    if (v4)
    {
      [*(id *)(a1 + 32) addObject:v4];

      id v3 = v5;
    }
  }
}

@end