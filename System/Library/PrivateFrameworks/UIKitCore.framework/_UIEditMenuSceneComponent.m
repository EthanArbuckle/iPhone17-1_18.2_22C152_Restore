@interface _UIEditMenuSceneComponent
+ (id)sceneComponentForView:(id)a3;
- (BOOL)hasVisibleMenu;
- (UIScene)_scene;
- (_UIEditMenuPresentation)activePresentation;
- (_UIEditMenuSceneComponent)initWithScene:(id)a3;
- (void)_setScene:(id)a3;
- (void)dismissCurrentMenu;
- (void)removeActivePresentation:(id)a3;
- (void)setActivePresentation:(id)a3;
@end

@implementation _UIEditMenuSceneComponent

- (void)_setScene:(id)a3
{
}

- (void)dismissCurrentMenu
{
  activePresentation = self->_activePresentation;
  if (activePresentation)
  {
    [(_UIEditMenuPresentation *)activePresentation hideMenuWithReason:0];
    v4 = self->_activePresentation;
    [(_UIEditMenuSceneComponent *)self removeActivePresentation:v4];
  }
  else if (+[UIView areAnimationsEnabled])
  {
    +[UICalloutBar fadeSharedCalloutBar];
  }
  else
  {
    +[UICalloutBar hideSharedCalloutBar];
  }
}

+ (id)sceneComponentForView:(id)a3
{
  v3 = [a3 _window];
  v4 = [v3 windowScene];
  v5 = [v4 _editMenuSceneComponent];

  return v5;
}

- (_UIEditMenuSceneComponent)initWithScene:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"_UIEditMenuSceneComponent.m", 42, @"Only UIWindowScene is supported by %@.", v11 object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIEditMenuSceneComponent;
  v6 = [(_UIEditMenuSceneComponent *)&v12 init];
  v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_scene, v5);
  }

  return v7;
}

- (void)setActivePresentation:(id)a3
{
  v4 = (_UIEditMenuPresentation *)a3;
  activePresentation = self->_activePresentation;
  v6 = v4;
  if (activePresentation != v4)
  {
    [(_UIEditMenuPresentation *)activePresentation hideMenuWithReason:0];
    v6 = self->_activePresentation;
  }
  self->_activePresentation = v4;
}

- (void)removeActivePresentation:(id)a3
{
  v4 = (_UIEditMenuPresentation *)a3;
  if (self->_activePresentation == v4)
  {
    self->_activePresentation = 0;
    id v5 = v4;

    v4 = v5;
  }
}

- (BOOL)hasVisibleMenu
{
  v3 = [(_UIEditMenuSceneComponent *)self activePresentation];

  if (v3)
  {
    v4 = [(_UIEditMenuSceneComponent *)self activePresentation];
    id v5 = [v4 displayedMenu];
    LOBYTE(v6) = v5 != 0;
  }
  else
  {
    v4 = +[UICalloutBar activeCalloutBar];
    uint64_t v6 = [v4 visible];
  }

  return v6;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (_UIEditMenuPresentation)activePresentation
{
  return self->_activePresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePresentation, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end