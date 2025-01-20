@interface _UISceneHostingContentSizePreferenceHostComponent
- (CGSize)preferredContentSize;
- (_UISceneHostingContentSizePreferenceHostReceiving)contentSizePreferenceReceiver;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)setContentSizePreferenceReceiver:(id)a3;
@end

@implementation _UISceneHostingContentSizePreferenceHostComponent

- (CGSize)preferredContentSize
{
  v2 = [(FBSSceneComponent *)self hostScene];
  v3 = [v2 clientSettings];
  [v3 preferredContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8 = a6;
  if ([a4 containsProperty:sel_preferredContentSize])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __127___UISceneHostingContentSizePreferenceHostComponent_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
    aBlock[3] = &unk_1E52D9F70;
    aBlock[4] = self;
    double v9 = (void (**)(void))_Block_copy(aBlock);
    v10 = [(FBSSceneComponent *)self hostScene];
    v11 = [v10 _uiHostingController];

    if (v11) {
      -[_UISceneHostingController performBlock:withClientTransitionContext:]((uint64_t)v11, v9, v8);
    }
    else {
      v9[2](v9);
    }
  }
}

- (void)setContentSizePreferenceReceiver:(id)a3
{
  p_contentSizePreferenceReceiver = &self->_contentSizePreferenceReceiver;
  id v5 = a3;
  objc_storeWeak((id *)p_contentSizePreferenceReceiver, v5);
  [(_UISceneHostingContentSizePreferenceHostComponent *)self preferredContentSize];
  objc_msgSend(v5, "setPreferredContentSize:");
}

- (_UISceneHostingContentSizePreferenceHostReceiving)contentSizePreferenceReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentSizePreferenceReceiver);
  return (_UISceneHostingContentSizePreferenceHostReceiving *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end