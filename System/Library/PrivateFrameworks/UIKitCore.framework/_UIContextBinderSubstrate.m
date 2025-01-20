@interface _UIContextBinderSubstrate
- (FBSScene)scene;
- (_UIContextBinderSubstrate)initWithScene:(id)a3;
- (void)attachContext:(id)a3;
- (void)detachContext:(id)a3;
@end

@implementation _UIContextBinderSubstrate

- (_UIContextBinderSubstrate)initWithScene:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextBinderSubstrate;
  v6 = [(_UIContextBinderSubstrate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_scene, a3);
  }

  return v7;
}

- (FBSScene)scene
{
  return self->_scene;
}

- (void)attachContext:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)detachContext:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void).cxx_destruct
{
}

@end