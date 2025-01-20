@interface _UIPointerContentEffectAnimationBuilder
- (_UIPointerContentEffectAnimationBuilder)initWithCreationHandler:(id)a3;
- (id)createAnimation;
@end

@implementation _UIPointerContentEffectAnimationBuilder

- (_UIPointerContentEffectAnimationBuilder)initWithCreationHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIPointerContentEffectAnimationBuilder;
  v5 = [(_UIPointerContentEffectAnimationBuilder *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id creationHandler = v5->_creationHandler;
    v5->_id creationHandler = v6;
  }
  return v5;
}

- (id)createAnimation
{
  id creationHandler = (void (**)(void, void))self->_creationHandler;
  if (creationHandler
    || ([MEMORY[0x1E4F28B00] currentHandler],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 handleFailureInMethod:a2 object:self file:@"_UIPointerArbiter.m" lineNumber:97 description:@"creationHandler must be non-nil"], v6, (id creationHandler = (void (**)(void, void))self->_creationHandler) != 0))
  {
    ((void (**)(void, SEL))creationHandler)[2](creationHandler, a2);
    id creationHandler = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  }
  return creationHandler;
}

- (void).cxx_destruct
{
}

@end