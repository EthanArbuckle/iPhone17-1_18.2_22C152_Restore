@interface _UIVisualEffectViewEntry
- (BOOL)canTransitionToEffect:(id)a3;
- (BOOL)isSameTypeOfEffect:(id)a3;
- (BOOL)shouldAnimateProperty:(id)a3;
- (NSString)description;
- (id)copyForTransitionOut;
- (id)copyForTransitionToEffect:(id)a3;
- (int64_t)requirements;
- (void)applyEffectAsRequested:(BOOL)a3 toView:(id)a4;
- (void)setRequirements:(int64_t)a3;
@end

@implementation _UIVisualEffectViewEntry

- (BOOL)shouldAnimateProperty:(id)a3
{
  return 0;
}

- (void)applyEffectAsRequested:(BOOL)a3 toView:(id)a4
{
  if (a3) {
    [(_UIVisualEffectViewEntry *)self applyRequestedEffectToView:a4];
  }
  else {
    [(_UIVisualEffectViewEntry *)self applyIdentityEffectToView:a4];
  }
}

- (void)setRequirements:(int64_t)a3
{
  self->_requirements = a3;
}

- (int64_t)requirements
{
  return self->_requirements;
}

- (BOOL)isSameTypeOfEffect:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (id)copyForTransitionToEffect:(id)a3
{
  id v4 = a3;
  v5 = [[_UIVisualEffectViewTransitioningEntry alloc] initWithSourceEntry:self destinationEntry:v4];

  return v5;
}

- (id)copyForTransitionOut
{
  id v3 = [_UIVisualEffectViewReversingEntry alloc];
  return [(_UIVisualEffectViewReversingEntry *)v3 initWithViewEntry:self];
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectViewEntry;
  id v3 = [(_UIVisualEffectViewEntry *)&v6 description];
  id v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" requirements=%li", self->_requirements);

  return (NSString *)v4;
}

@end