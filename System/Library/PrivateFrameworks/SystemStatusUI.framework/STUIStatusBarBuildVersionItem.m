@interface STUIStatusBarBuildVersionItem
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (BOOL)needsUpdate;
- (STUIStatusBarStringView)buildVersionView;
- (void)_create_buildVersionView;
- (void)setBuildVersionView:(id)a3;
@end

@implementation STUIStatusBarBuildVersionItem

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  if (qword_1EC05EF70 != -1) {
    dispatch_once(&qword_1EC05EF70, &__block_literal_global_15);
  }
  return _MergedGlobals_48;
}

- (void).cxx_destruct
{
}

void __63__STUIStatusBarBuildVersionItem_canEnableDisplayItem_fromData___block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.UIKit"];
  v0 = [v2 dictionaryRepresentation];
  v1 = [v0 objectForKey:@"UIStatusBarShowBuildVersion"];
  _MergedGlobals_48 = [v1 BOOLValue];
}

- (BOOL)needsUpdate
{
  return 1;
}

- (STUIStatusBarStringView)buildVersionView
{
  buildVersionView = self->_buildVersionView;
  if (!buildVersionView)
  {
    [(STUIStatusBarBuildVersionItem *)self _create_buildVersionView];
    buildVersionView = self->_buildVersionView;
  }
  return buildVersionView;
}

- (void)_create_buildVersionView
{
  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  buildVersionView = self->_buildVersionView;
  self->_buildVersionView = v4;

  v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v8 = [v6 buildVersion];

  if (MEMORY[0x1D94828D0]("-[STUIStatusBarBuildVersionItem _create_buildVersionView]"))
  {
    if (qword_1EC05EF78 != -1) {
      dispatch_once(&qword_1EC05EF78, &__block_literal_global_26);
    }
    if (byte_1EC05EF69)
    {
      uint64_t v7 = [v8 stringByAppendingString:@"*"];

      id v8 = (id)v7;
    }
  }
  [(STUIStatusBarStringView *)self->_buildVersionView setText:v8];
}

- (void)setBuildVersionView:(id)a3
{
}

@end