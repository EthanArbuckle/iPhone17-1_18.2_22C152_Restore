@interface _UIImageSymbolTransition
+ (BOOL)supportsSecureCoding;
+ (id)transition;
- (BOOL)_isSymbolEffect;
- (BOOL)_isSymbolTransition;
- (BOOL)_isValidAnimationPreset;
- (BOOL)isEqual:(id)a3;
- (_UIImageSymbolTransition)init;
- (_UIImageSymbolTransition)initWithCoder:(id)a3;
- (id)_nsSymbolContentTransitionRepresentation;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_performCompletionHandler;
- (void)setCompletionHandler:(id)a3;
@end

@implementation _UIImageSymbolTransition

+ (id)transition
{
  v2 = objc_opt_new();
  return v2;
}

- (_UIImageSymbolTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolTransition;
  return [(_UIImageSymbolTransition *)&v3 init];
}

- (BOOL)_isValidAnimationPreset
{
  return 0;
}

- (BOOL)_isSymbolEffect
{
  return 0;
}

- (BOOL)_isSymbolTransition
{
  return 1;
}

- (id)_nsSymbolContentTransitionRepresentation
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIImageSymbolEffect.m" lineNumber:792 description:@"Should never be called in abstract superclass"];

  return 0;
}

- (void)_performCompletionHandler
{
  completionHandler = (void (**)(id, _UIImageSymbolTransition *))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, self);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIImageSymbolTransition *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(_UIImageSymbolTransition *)self completionHandler];
    v7 = [(_UIImageSymbolTransition *)v5 completionHandler];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return [self->_completionHandler hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(id)objc_opt_class() transition];
  v5 = _Block_copy(self->_completionHandler);
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIImageSymbolTransition)initWithCoder:(id)a3
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