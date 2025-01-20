@interface SBSceneBackgroundedStatusAssertion
- (NSSet)scenes;
- (SBSceneBackgroundedStatusAssertion)initWithScenes:(id)a3 invalidationHandler:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBSceneBackgroundedStatusAssertion

- (SBSceneBackgroundedStatusAssertion)initWithScenes:(id)a3 invalidationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSceneBackgroundedStatusAssertion;
  v8 = [(SBSceneBackgroundedStatusAssertion *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    scenes = v8->_scenes;
    v8->_scenes = (NSSet *)v9;

    uint64_t v11 = [v7 copy];
    id invalidationHandler = v8->_invalidationHandler;
    v8->_id invalidationHandler = (id)v11;
  }
  return v8;
}

- (void)dealloc
{
  if (self->_invalidationHandler)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBSceneBackgroundedStatusAssertion.m" lineNumber:30 description:@"must invalidate before releasing"];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBSceneBackgroundedStatusAssertion;
  [(SBSceneBackgroundedStatusAssertion *)&v5 dealloc];
}

- (void)invalidate
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"-[SBSceneBackgroundedStatusAssertion invalidate]"];
    [v5 handleFailureInFunction:v6 file:@"SBSceneBackgroundedStatusAssertion.m" lineNumber:40 description:@"this call must be made on the main thread"];
  }
  id invalidationHandler = (void (**)(id, NSSet *))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2](invalidationHandler, self->_scenes);
    id v4 = self->_invalidationHandler;
    self->_id invalidationHandler = 0;
  }
}

- (NSSet)scenes
{
  return self->_scenes;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_scenes, 0);
}

@end