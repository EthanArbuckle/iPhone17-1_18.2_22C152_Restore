@interface _UIVisualEffectAlphaEntry
- (_UIVisualEffectAlphaEntry)initWithInitialAlpha:(double)a3 finalAlpha:(double)a4;
- (id)copyForTransitionOut;
- (id)copyForTransitionToEffect:(id)a3;
- (id)description;
- (void)applyIdentityEffectToView:(id)a3;
- (void)applyRequestedEffectToView:(id)a3;
- (void)removeEffectFromView:(id)a3;
@end

@implementation _UIVisualEffectAlphaEntry

- (_UIVisualEffectAlphaEntry)initWithInitialAlpha:(double)a3 finalAlpha:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIVisualEffectAlphaEntry;
  result = [(_UIVisualEffectAlphaEntry *)&v7 init];
  if (result)
  {
    result->_initialAlpha = a3;
    result->_finalAlpha = a4;
  }
  return result;
}

- (void)applyIdentityEffectToView:(id)a3
{
}

- (void)applyRequestedEffectToView:(id)a3
{
}

- (void)removeEffectFromView:(id)a3
{
}

- (id)copyForTransitionToEffect:(id)a3
{
  v4 = (double *)a3;
  v5 = [_UIVisualEffectAlphaEntry alloc];
  double finalAlpha = self->_finalAlpha;
  double v7 = v4[3];

  return [(_UIVisualEffectAlphaEntry *)v5 initWithInitialAlpha:finalAlpha finalAlpha:v7];
}

- (id)copyForTransitionOut
{
  v3 = [_UIVisualEffectAlphaEntry alloc];
  double finalAlpha = self->_finalAlpha;
  double initialAlpha = self->_initialAlpha;
  return [(_UIVisualEffectAlphaEntry *)v3 initWithInitialAlpha:finalAlpha finalAlpha:initialAlpha];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectAlphaEntry;
  v3 = [(_UIVisualEffectViewEntry *)&v6 description];
  v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" initialAlpha=%f finalAlpha=%f", *(void *)&self->_initialAlpha, *(void *)&self->_finalAlpha);

  return v4;
}

@end