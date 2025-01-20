@interface _UIViewPropertyAnimationUpdate
- (BOOL)isAdditive;
- (BOOL)isImplicit;
- (NSString)propertyName;
- (NSValue)fromValue;
- (NSValue)toValue;
- (_UIViewPropertyAnimationUpdate)init;
- (_UIViewPropertyAnimationUpdate)initWithPropertyName:(id)a3 implicit:(BOOL)a4 additive:(BOOL)a5;
- (double)delay;
- (double)duration;
- (double)startTime;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFromValue:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setToValue:(id)a3;
@end

@implementation _UIViewPropertyAnimationUpdate

- (_UIViewPropertyAnimationUpdate)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[_UIViewPropertyAnimationUpdate init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (_UIViewPropertyAnimationUpdate)initWithPropertyName:(id)a3 implicit:(BOOL)a4 additive:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIViewPropertyAnimationUpdate;
  v9 = [(_UIViewPropertyAnimationUpdate *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    propertyName = v9->_propertyName;
    v9->_propertyName = (NSString *)v10;

    v9->_implicit = a4;
    v9->_additive = a5;
    v9->_duration = 0.0;
    v9->_delay = 0.0;
    v9->_startTime = 0.0;
  }

  return v9;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (BOOL)isAdditive
{
  return self->_additive;
}

- (NSValue)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(id)a3
{
}

- (NSValue)toValue
{
  return self->_toValue;
}

- (void)setToValue:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (BOOL)isImplicit
{
  return self->_implicit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toValue, 0);
  objc_storeStrong((id *)&self->_fromValue, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

@end