@interface TUIVisibilityOptions
+ (id)defaultOptions;
+ (id)modalAnchorOptions;
- (TUIVisibilityOptions)init;
- (TUIVisibilityOptions)initWithOther:(id)a3;
- (double)duration;
- (double)fraction;
- (unint64_t)flags;
- (void)setDuration:(double)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setFraction:(double)a3;
@end

@implementation TUIVisibilityOptions

+ (id)defaultOptions
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)modalAnchorOptions
{
  id v2 = (char *)objc_alloc_init((Class)a1);
  *(_OWORD *)(v2 + 8) = xmmword_243100;
  *((void *)v2 + 3) = 1;

  return v2;
}

- (TUIVisibilityOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIVisibilityOptions;
  result = [(TUIVisibilityOptions *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_fraction = xmmword_243110;
    result->_flags = 0;
  }
  return result;
}

- (TUIVisibilityOptions)initWithOther:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIVisibilityOptions;
  v5 = [(TUIVisibilityOptions *)&v9 init];
  if (v5)
  {
    [v4 fraction];
    v5->_fraction = v6;
    [v4 duration];
    v5->_duration = v7;
    v5->_flags = (unint64_t)[v4 flags];
  }

  return v5;
}

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  self->_fraction = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

@end