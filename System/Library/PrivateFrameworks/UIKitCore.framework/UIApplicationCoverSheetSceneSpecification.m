@interface UIApplicationCoverSheetSceneSpecification
- (id)baseSceneComponentClassDictionary;
- (id)connectionHandlers;
- (id)disconnectionHandlers;
- (id)uiSceneSessionRole;
@end

@implementation UIApplicationCoverSheetSceneSpecification

- (id)baseSceneComponentClassDictionary
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = _UIStatusBarManagerWindowSceneComponentKey;
  v5[0] = [(id)objc_opt_class() _statusBarManagerClass];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)connectionHandlers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(id)UIApp _appAdoptsUISceneLifecycle])
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v3 = _Block_copy(&__block_literal_global_20);
    v5[0] = v3;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  return v2;
}

- (id)disconnectionHandlers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)uiSceneSessionRole
{
  return @"UIWindowSceneSessionTypeCoverSheet";
}

@end