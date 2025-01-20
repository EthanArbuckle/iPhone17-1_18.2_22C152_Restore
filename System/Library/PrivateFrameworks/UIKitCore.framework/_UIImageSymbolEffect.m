@interface _UIImageSymbolEffect
+ (BOOL)supportsSecureCoding;
+ (id)effect;
- (BOOL)_isSymbolEffect;
- (BOOL)_isSymbolTransition;
- (BOOL)_isValidAnimationPreset;
- (BOOL)isEqual:(id)a3;
- (_UIImageSymbolEffect)init;
- (_UIImageSymbolEffect)initWithCoder:(id)a3;
- (id)_nsSymbolEffectRepresentation;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_desiredScale;
- (int64_t)_desiredVisibility;
- (int64_t)_stateUpdateType;
- (unint64_t)hash;
- (void)_performCompletionHandler;
- (void)setCompletionHandler:(id)a3;
@end

@implementation _UIImageSymbolEffect

+ (id)effect
{
  v2 = objc_opt_new();
  return v2;
}

- (_UIImageSymbolEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolEffect;
  return [(_UIImageSymbolEffect *)&v3 init];
}

- (BOOL)_isValidAnimationPreset
{
  return 0;
}

- (BOOL)_isSymbolEffect
{
  return 1;
}

- (BOOL)_isSymbolTransition
{
  return 0;
}

- (int64_t)_stateUpdateType
{
  return 0;
}

- (int64_t)_desiredScale
{
  return 0;
}

- (int64_t)_desiredVisibility
{
  return 0;
}

- (id)_nsSymbolEffectRepresentation
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIImageSymbolEffect.m" lineNumber:166 description:@"Should never be called in abstract superclass"];

  return 0;
}

- (void)_performCompletionHandler
{
  completionHandler = (void (**)(id, _UIImageSymbolEffect *))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, self);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIImageSymbolEffect *)a3;
  p_isa = (id *)&v4->super.isa;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && self->_completionHandler == p_isa[1];
  }

  return v6;
}

- (unint64_t)hash
{
  return [self->_completionHandler hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(id)objc_opt_class() effect];
  v5 = _Block_copy(self->_completionHandler);
  BOOL v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIImageSymbolEffect)initWithCoder:(id)a3
{
  v4 = [(id)objc_opt_class() effect];

  return v4;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end