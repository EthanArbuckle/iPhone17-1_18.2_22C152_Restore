@interface SBSimScrollToIconTestRecipe
- (id)title;
- (void)_simulateScrollToIconWithDisplayIdentifier:(id)a3;
- (void)handleVolumeIncrease;
@end

@implementation SBSimScrollToIconTestRecipe

- (id)title
{
  return @"Simulate Scroll To Icon";
}

- (void)handleVolumeIncrease
{
}

- (void)_simulateScrollToIconWithDisplayIdentifier:(id)a3
{
  id v3 = a3;
  id v17 = +[SBIconController sharedInstance];
  v4 = [v17 iconManager];
  v5 = [v17 model];
  v6 = [v5 leafIconForIdentifier:v3];

  if (v6)
  {
    [v4 setIconToReveal:v6 revealingPrevious:1];
    v7 = +[SBWorkspace mainWorkspace];
    v8 = [v7 mainWindowScene];
    v9 = [v8 switcherController];

    if (!v9)
    {
      v10 = SBLogCommon();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

      if (v11) {
        NSLog(&cfstr_ExpectedASwitc.isa);
      }
    }
    v12 = [v7 transientOverlayPresentationManager];
    if ([v12 hasActivePresentation])
    {
    }
    else
    {
      v13 = [v9 layoutStatePrimaryElement];
      v14 = [v13 workspaceEntity];
      v15 = [v14 applicationSceneEntity];
      v16 = [v15 sceneHandle];

      if (!v16)
      {
        [v4 tryScrollToIconToRevealAnimated:1];
        goto LABEL_10;
      }
    }
    SBWorkspaceSuspendActiveDisplay();
LABEL_10:
  }
}

@end