@interface _UIMutableCanvasDefinition
- (Class)canvasSubclass;
- (Class)delegateClass;
- (_UIMutableCanvasDefinition)initWithRepresentation:(id)a3;
- (id)configuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)persistentIdentifier;
- (id)representedCanvas;
- (id)role;
- (id)scene;
- (id)stateRestorationActivity;
- (id)userInfo;
- (int64_t)systemType;
- (void)setCanvasSubclass:(Class)a3;
- (void)setDelegateClass:(Class)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _UIMutableCanvasDefinition

- (_UIMutableCanvasDefinition)initWithRepresentation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIMutableCanvasDefinition;
  v6 = [(UISceneSession *)&v9 _init];
  v7 = (_UIMutableCanvasDefinition *)v6;
  if (v6) {
    objc_storeStrong(v6 + 8, a3);
  }

  return v7;
}

- (void)setCanvasSubclass:(Class)a3
{
  id v5 = [(UISceneSession *)self->_sceneSession configuration];
  [v5 setSceneClass:a3];
  [(UISceneSession *)self->_sceneSession _updateConfiguration:v5];
}

- (void)setDelegateClass:(Class)a3
{
  id v5 = [(UISceneSession *)self->_sceneSession configuration];
  [v5 setDelegateClass:a3];
  [(UISceneSession *)self->_sceneSession _updateConfiguration:v5];
}

- (void)setUserInfo:(id)a3
{
}

- (id)representedCanvas
{
  return [(UISceneSession *)self->_sceneSession scene];
}

- (int64_t)systemType
{
  v2 = [(UISceneSession *)self->_sceneSession role];
  int64_t v3 = _UICanvasCanvasSystemTypeFromFrameType(v2);

  return v3;
}

- (Class)canvasSubclass
{
  v2 = [(UISceneSession *)self->_sceneSession configuration];
  int64_t v3 = [v2 sceneClass];

  return (Class)v3;
}

- (Class)delegateClass
{
  v2 = [(UISceneSession *)self->_sceneSession configuration];
  int64_t v3 = [v2 delegateClass];

  return (Class)v3;
}

- (id)scene
{
  return [(UISceneSession *)self->_sceneSession scene];
}

- (id)role
{
  return [(UISceneSession *)self->_sceneSession role];
}

- (id)configuration
{
  return [(UISceneSession *)self->_sceneSession configuration];
}

- (id)persistentIdentifier
{
  return [(UISceneSession *)self->_sceneSession persistentIdentifier];
}

- (id)stateRestorationActivity
{
  return [(UISceneSession *)self->_sceneSession stateRestorationActivity];
}

- (id)userInfo
{
  return [(UISceneSession *)self->_sceneSession userInfo];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self->_sceneSession;
}

- (void).cxx_destruct
{
}

@end