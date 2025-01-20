@interface _UIShareableContentSceneComponent
- (UIScene)_scene;
- (_UIShareableContentSceneComponent)initWithScene:(id)a3;
- (id)_actionRespondersForScene:(id)a3;
- (void)_setScene:(id)a3;
@end

@implementation _UIShareableContentSceneComponent

- (id)_actionRespondersForScene:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(_UIShareableContentSceneActionHandler);
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (_UIShareableContentSceneComponent)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIShareableContentSceneComponent;
  v5 = [(_UIShareableContentSceneComponent *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v6;
}

- (void)_setScene:(id)a3
{
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end