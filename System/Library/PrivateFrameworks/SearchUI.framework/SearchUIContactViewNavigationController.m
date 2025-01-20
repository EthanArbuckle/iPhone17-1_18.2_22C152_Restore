@interface SearchUIContactViewNavigationController
- (BOOL)_canShowWhileLocked;
- (SearchUIContactViewNavigationController)initWithContact:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
@end

@implementation SearchUIContactViewNavigationController

- (SearchUIContactViewNavigationController)initWithContact:(id)a3
{
  v4 = [MEMORY[0x1E4F1BBA8] viewControllerForNewContact:a3];
  v7.receiver = self;
  v7.super_class = (Class)SearchUIContactViewNavigationController;
  v5 = [(SearchUIContactViewNavigationController *)&v7 initWithRootViewController:v4];
  if (v5) {
    [v4 setDelegate:v5];
  }

  return v5;
}

- (BOOL)_canShowWhileLocked
{
  v2 = [(SearchUIContactViewNavigationController *)self viewControllers];
  v3 = [v2 firstObject];
  char v4 = [v3 _canShowWhileLocked];

  return v4;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
}

@end