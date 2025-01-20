@interface _UIBackgroundColorViewEntry
- (BOOL)canTransitionToEffect:(id)a3;
- (UIColor)color;
- (id)description;
- (void)applyIdentityEffectToView:(id)a3;
- (void)applyRequestedEffectToView:(id)a3;
- (void)removeEffectFromView:(id)a3;
- (void)setColor:(id)a3;
@end

@implementation _UIBackgroundColorViewEntry

- (void)applyRequestedEffectToView:(id)a3
{
}

- (void)applyIdentityEffectToView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _nilBackgroundColor];
  [v3 setBackgroundColor:v4];
}

- (void)removeEffectFromView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _nilBackgroundColor];
  [v3 setBackgroundColor:v4];
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIBackgroundColorViewEntry;
  id v3 = [(_UIVisualEffectViewEntry *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" color=%@", self->_color];

  return v4;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end