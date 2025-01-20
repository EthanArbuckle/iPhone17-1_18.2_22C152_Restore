@interface TUITransactionOptions
+ (id)defaultImplicitOptions;
+ (id)noAnimationOptions;
- (BOOL)animate;
- (BOOL)isCompatibleWithOptions:(id)a3;
- (NSString)identifier;
- (TUITransactionOptions)initWithOther:(id)a3;
- (UITimingCurveProvider)timingProvider;
- (double)duration;
- (double)syncTimeout;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)flags;
- (void)setAnimate:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setSyncTimeout:(double)a3;
- (void)setTimingProvider:(id)a3;
@end

@implementation TUITransactionOptions

- (TUITransactionOptions)initWithOther:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUITransactionOptions;
  v5 = [(TUITransactionOptions *)&v15 init];
  if (v5)
  {
    v5->_animate = [v4 animate];
    [v4 duration];
    v5->_duration = v6;
    [v4 syncTimeout];
    v5->_syncTimeout = v7;
    v5->_flags = (unint64_t)[v4 flags];
    v8 = [v4 identifier];
    v9 = (NSString *)[v8 copy];
    identifier = v5->_identifier;
    v5->_identifier = v9;

    v11 = [v4 timingProvider];
    v12 = (UITimingCurveProvider *)[v11 copyWithZone:0];
    timingProvider = v5->_timingProvider;
    v5->_timingProvider = v12;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[TUIMutableTransactionOptions allocWithZone:a3];

  return [(TUITransactionOptions *)v4 initWithOther:self];
}

+ (id)defaultImplicitOptions
{
  v2 = objc_alloc_init(TUIMutableTransactionOptions);
  [(TUITransactionOptions *)v2 setDuration:0.25];
  [(TUITransactionOptions *)v2 setAnimate:1];
  id v3 = [(TUIMutableTransactionOptions *)v2 copy];

  return v3;
}

+ (id)noAnimationOptions
{
  v2 = objc_alloc_init(TUITransactionOptions);

  return v2;
}

- (BOOL)isCompatibleWithOptions:(id)a3
{
  id v4 = a3;
  int animate = self->_animate;
  if (animate == [v4 animate]
    && (double duration = self->_duration, [v4 duration], duration == v7))
  {
    timingProvider = self->_timingProvider;
    v9 = [v4 timingProvider];
    if (timingProvider == v9)
    {
      unsigned __int8 v12 = 1;
    }
    else
    {
      v10 = self->_timingProvider;
      v11 = [v4 timingProvider];
      unsigned __int8 v12 = [(UITimingCurveProvider *)v10 isEqual:v11];
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3 = objc_opt_new();
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@", v5];

  if (self->_identifier) {
    [v3 appendFormat:@" id=%@", self->_identifier];
  }
  [v3 appendFormat:@" animate=%lu", self->_animate];
  if (self->_animate)
  {
    if (self->_duration == 0.25
      || (objc_msgSend(v3, "appendFormat:", @" duration=%g", *(void *)&self->_duration), self->_animate))
    {
      if (self->_timingProvider) {
        [v3 appendFormat:@" timingProvider=%@", self->_timingProvider];
      }
    }
  }
  if (self->_flags) {
    [v3 appendFormat:@" flags=%lu" self->_flags];
  }
  if (self->_syncTimeout != 0.0) {
    [v3 appendFormat:@" syncTimeout=%g", *(void *)&self->_syncTimeout];
  }
  [v3 appendString:@">"];
  id v6 = [v3 copy];

  return v6;
}

- (BOOL)animate
{
  return self->_animate;
}

- (void)setAnimate:(BOOL)a3
{
  self->_int animate = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (double)syncTimeout
{
  return self->_syncTimeout;
}

- (void)setSyncTimeout:(double)a3
{
  self->_syncTimeout = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UITimingCurveProvider)timingProvider
{
  return self->_timingProvider;
}

- (void)setTimingProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end