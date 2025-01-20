@interface _UIStatusBarBuildVersionItem
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (BOOL)needsUpdate;
- (_UIStatusBarStringView)buildVersionView;
- (void)_create_buildVersionView;
- (void)setBuildVersionView:(id)a3;
@end

@implementation _UIStatusBarBuildVersionItem

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  v4 = _UIKitPreferencesOnce();
  v5 = [v4 objectForKey:@"UIStatusBarShowBuildVersion"];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)needsUpdate
{
  return 1;
}

- (_UIStatusBarStringView)buildVersionView
{
  buildVersionView = self->_buildVersionView;
  if (!buildVersionView)
  {
    [(_UIStatusBarBuildVersionItem *)self _create_buildVersionView];
    buildVersionView = self->_buildVersionView;
  }
  return buildVersionView;
}

- (void)_create_buildVersionView
{
  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  buildVersionView = self->_buildVersionView;
  self->_buildVersionView = v4;

  char v6 = +[UIDevice currentDevice];
  id v7 = [v6 buildVersion];

  [(_UIStatusBarStringView *)self->_buildVersionView setText:v7];
}

- (void)setBuildVersionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end