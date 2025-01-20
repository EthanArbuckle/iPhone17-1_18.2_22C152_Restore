@interface TIKeyboardKeyBehaviors
+ (id)behaviorForSpaceKey:(unint64_t)a3 forReturnKey:(unint64_t)a4;
+ (id)behaviorForSpaceKey:(unint64_t)a3 forReturnKey:(unint64_t)a4 forTabKey:(unint64_t)a5;
- (TIKeyboardKeyBehaviors)initWithSpaceKeyBehavior:(unint64_t)a3 returnKeyBehavior:(unint64_t)a4 tabKeyBehavior:(unint64_t)a5;
- (unint64_t)returnKeyBehavior;
- (unint64_t)spaceKeyBehavior;
- (unint64_t)tabKeyBehavior;
- (void)setReturnKeyBehavior:(unint64_t)a3;
- (void)setSpaceKeyBehavior:(unint64_t)a3;
- (void)setTabKeyBehavior:(unint64_t)a3;
@end

@implementation TIKeyboardKeyBehaviors

- (void)setTabKeyBehavior:(unint64_t)a3
{
  self->_tabKeyBehavior = a3;
}

- (unint64_t)tabKeyBehavior
{
  return self->_tabKeyBehavior;
}

- (void)setReturnKeyBehavior:(unint64_t)a3
{
  self->_returnKeyBehavior = a3;
}

- (unint64_t)returnKeyBehavior
{
  return self->_returnKeyBehavior;
}

- (void)setSpaceKeyBehavior:(unint64_t)a3
{
  self->_spaceKeyBehavior = a3;
}

- (unint64_t)spaceKeyBehavior
{
  return self->_spaceKeyBehavior;
}

- (TIKeyboardKeyBehaviors)initWithSpaceKeyBehavior:(unint64_t)a3 returnKeyBehavior:(unint64_t)a4 tabKeyBehavior:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardKeyBehaviors;
  v8 = [(TIKeyboardKeyBehaviors *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(TIKeyboardKeyBehaviors *)v8 setSpaceKeyBehavior:a3];
    [(TIKeyboardKeyBehaviors *)v9 setReturnKeyBehavior:a4];
    [(TIKeyboardKeyBehaviors *)v9 setTabKeyBehavior:a5];
  }
  return v9;
}

+ (id)behaviorForSpaceKey:(unint64_t)a3 forReturnKey:(unint64_t)a4 forTabKey:(unint64_t)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithSpaceKeyBehavior:a3 returnKeyBehavior:a4 tabKeyBehavior:a5];

  return v5;
}

+ (id)behaviorForSpaceKey:(unint64_t)a3 forReturnKey:(unint64_t)a4
{
  return (id)[a1 behaviorForSpaceKey:a3 forReturnKey:a4 forTabKey:1];
}

@end