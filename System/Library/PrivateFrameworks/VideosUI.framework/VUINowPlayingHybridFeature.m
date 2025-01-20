@interface VUINowPlayingHybridFeature
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSkippable;
- (BOOL)shouldAutoRemove;
- (NSString)description;
- (VUINowPlayingHybridFeature)init;
- (VUINowPlayingHybridFeature)initWithType:(unint64_t)a3 startTime:(double)a4 duration:(double)a5;
- (double)duration;
- (double)startTime;
- (id)userInfo;
- (unint64_t)activationType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setActivationType:(unint64_t)a3;
- (void)setActive:(BOOL)a3;
- (void)setAutoRemove:(BOOL)a3;
- (void)setSkippable:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setType:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation VUINowPlayingHybridFeature

- (VUINowPlayingHybridFeature)init
{
  return [(VUINowPlayingHybridFeature *)self initWithType:-1 startTime:3.40282347e38 duration:3.40282347e38];
}

- (VUINowPlayingHybridFeature)initWithType:(unint64_t)a3 startTime:(double)a4 duration:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)VUINowPlayingHybridFeature;
  result = [(VUINowPlayingHybridFeature *)&v9 init];
  if (a3 && result)
  {
    *(_WORD *)&result->_active = 0;
    result->_type = a3;
    result->_startTime = a4;
    result->_duration = a5;
    result->_skippable = 1;
    result->_activationType = 0;
  }
  else
  {

    return 0;
  }
  return result;
}

- (NSString)description
{
  v3 = NSString;
  v4 = _sFeatureTypeDescription([(VUINowPlayingHybridFeature *)self type]);
  [(VUINowPlayingHybridFeature *)self isActive];
  v5 = VUIBoolLogString();
  [(VUINowPlayingHybridFeature *)self startTime];
  uint64_t v7 = v6;
  [(VUINowPlayingHybridFeature *)self duration];
  uint64_t v9 = v8;
  [(VUINowPlayingHybridFeature *)self isSkippable];
  v10 = VUIBoolLogString();
  v11 = [v3 stringWithFormat:@"{\ntype: %@,\n active: %@,\n startTime: %f,\n duration: %f,\n isSkippable: %@\n}\n", v4, v5, v7, v9, v10];

  return (NSString *)v11;
}

- (unint64_t)hash
{
  v2 = _sFeatureTypeDescription([(VUINowPlayingHybridFeature *)self type]);
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VUINowPlayingHybridFeature *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    unint64_t v7 = [(VUINowPlayingHybridFeature *)self type];
    if (v7 == [(VUINowPlayingHybridFeature *)v6 type]
      && ([(VUINowPlayingHybridFeature *)self startTime],
          double v9 = v8,
          [(VUINowPlayingHybridFeature *)v6 startTime],
          v9 == v10))
    {
      [(VUINowPlayingHybridFeature *)self duration];
      double v12 = v11;
      [(VUINowPlayingHybridFeature *)v6 duration];
      BOOL v14 = v12 == v13;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)shouldAutoRemove
{
  return self->_autoRemove;
}

- (void)setAutoRemove:(BOOL)a3
{
  self->_autoRemove = a3;
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

- (BOOL)isSkippable
{
  return self->_skippable;
}

- (void)setSkippable:(BOOL)a3
{
  self->_skippable = a3;
}

- (unint64_t)activationType
{
  return self->_activationType;
}

- (void)setActivationType:(unint64_t)a3
{
  self->_activationType = a3;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end