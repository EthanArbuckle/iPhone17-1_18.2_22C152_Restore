@interface OBSetupAssistantAppearanceController
- (BOOL)scrollViewContentIsUnderTray;
- (OBSetupAssistantAppearanceController)init;
- (void)_scrollViewDidLayoutSubviews:(id)a3;
@end

@implementation OBSetupAssistantAppearanceController

- (OBSetupAssistantAppearanceController)init
{
  return 0;
}

- (BOOL)scrollViewContentIsUnderTray
{
  return 0;
}

- (void)_scrollViewDidLayoutSubviews:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBSetupAssistantAppearanceController;
  [(OBWelcomeController *)&v4 _scrollViewDidLayoutSubviews:a3];
  [(OBSetupAssistantAppearanceController *)self updateContentViewForScrollViewLayoutChange];
}

@end