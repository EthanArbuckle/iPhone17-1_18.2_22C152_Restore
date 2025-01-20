@interface VUINowPlayingTimerTriggeredFeature
- (BOOL)isActive;
- (BOOL)isBackgroundTimer;
- (BOOL)isEqual:(id)a3;
- (BOOL)repeats;
- (BOOL)shouldAutoRemove;
- (NSString)description;
- (VUINowPlayingTimerTriggeredFeature)initWithType:(unint64_t)a3 duration:(double)a4 repeats:(BOOL)a5;
- (VUINowPlayingTimerTriggeredFeature)initWithType:(unint64_t)a3 duration:(double)a4 repeats:(BOOL)a5 backgroundTimer:(BOOL)a6;
- (double)duration;
- (id)userInfo;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setActive:(BOOL)a3;
- (void)setAutoRemove:(BOOL)a3;
- (void)setType:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation VUINowPlayingTimerTriggeredFeature

- (VUINowPlayingTimerTriggeredFeature)initWithType:(unint64_t)a3 duration:(double)a4 repeats:(BOOL)a5
{
  return [(VUINowPlayingTimerTriggeredFeature *)self initWithType:a3 duration:a5 repeats:0 backgroundTimer:a4];
}

- (VUINowPlayingTimerTriggeredFeature)initWithType:(unint64_t)a3 duration:(double)a4 repeats:(BOOL)a5 backgroundTimer:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)VUINowPlayingTimerTriggeredFeature;
  result = [(VUINowPlayingTimerTriggeredFeature *)&v11 init];
  if (result)
  {
    result->_type = a3;
    result->_duration = a4;
    result->_repeats = a5;
    result->_backgroundTimer = a6;
    *(_WORD *)&result->_active = 0;
  }
  return result;
}

- (NSString)description
{
  v3 = NSString;
  v4 = _sFeatureTypeDescription([(VUINowPlayingTimerTriggeredFeature *)self type]);
  [(VUINowPlayingTimerTriggeredFeature *)self isActive];
  v5 = VUIBoolLogString();
  [(VUINowPlayingTimerTriggeredFeature *)self duration];
  uint64_t v7 = v6;
  [(VUINowPlayingTimerTriggeredFeature *)self repeats];
  v8 = VUIBoolLogString();
  v9 = [v3 stringWithFormat:@"{\ntype: %@,\n active: %@,\n duration: %f,\n repeats: %@\n}\n", v4, v5, v7, v8];

  return (NSString *)v9;
}

- (unint64_t)hash
{
  v2 = [(VUINowPlayingTimerTriggeredFeature *)self description];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VUINowPlayingTimerTriggeredFeature *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    unint64_t v7 = [(VUINowPlayingTimerTriggeredFeature *)self type];
    if (v7 == [(VUINowPlayingTimerTriggeredFeature *)v6 type]
      && ([(VUINowPlayingTimerTriggeredFeature *)self duration],
          double v9 = v8,
          [(VUINowPlayingTimerTriggeredFeature *)v6 duration],
          v9 == v10))
    {
      BOOL v11 = [(VUINowPlayingTimerTriggeredFeature *)self repeats];
      BOOL v12 = v11 ^ [(VUINowPlayingTimerTriggeredFeature *)v6 repeats] ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (double)duration
{
  return self->_duration;
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

- (BOOL)repeats
{
  return self->_repeats;
}

- (BOOL)isBackgroundTimer
{
  return self->_backgroundTimer;
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