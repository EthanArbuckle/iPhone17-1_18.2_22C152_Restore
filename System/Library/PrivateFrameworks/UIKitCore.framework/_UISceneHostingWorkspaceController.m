@interface _UISceneHostingWorkspaceController
- (FBSceneWorkspace)sceneWorkspace;
- (_UISceneHostingWorkspaceController)initWithIdentifier:(id)a3;
- (void)workspace:(id)a3 didAddScene:(id)a4;
- (void)workspace:(id)a3 willRemoveScene:(id)a4;
@end

@implementation _UISceneHostingWorkspaceController

- (_UISceneHostingWorkspaceController)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UISceneHostingWorkspaceController;
  v5 = [(_UISceneHostingWorkspaceController *)&v13 init];
  if (v5)
  {
    v6 = NSString;
    if (v4)
    {
      v7 = [NSString stringWithFormat:@"UISceneHostingWorkspace-%@", v4];
    }
    else
    {
      v8 = [MEMORY[0x1E4F29128] UUID];
      v9 = [v8 UUIDString];
      v7 = [v6 stringWithFormat:@"UISceneHostingWorkspace-%@", v9];
    }
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F624B0]) initWithIdentifier:v7];
    sceneWorkspace = v5->_sceneWorkspace;
    v5->_sceneWorkspace = (FBSceneWorkspace *)v10;

    [(FBSceneWorkspace *)v5->_sceneWorkspace setDelegate:v5];
  }

  return v5;
}

- (void)workspace:(id)a3 didAddScene:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UISceneHosting", workspace_didAddScene____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v9 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412802;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v7;
      __int16 v14 = 2112;
      v15 = self;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Workspace %@ didAddScene:%@ (self: %@)", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)workspace:(id)a3 willRemoveScene:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UISceneHosting", &workspace_willRemoveScene____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v9 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412802;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v7;
      __int16 v14 = 2112;
      v15 = self;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Workspace %@ willRemoveScene:%@ (self: %@)", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (FBSceneWorkspace)sceneWorkspace
{
  return self->_sceneWorkspace;
}

- (void).cxx_destruct
{
}

@end