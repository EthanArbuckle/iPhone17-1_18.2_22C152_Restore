@interface VUINowPlayingUserTriggeredFeature
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAutoRemove;
- (NSString)description;
- (VUINowPlayingUserTriggeredFeature)init;
- (VUINowPlayingUserTriggeredFeature)initWithType:(unint64_t)a3;
- (id)userInfo;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setActive:(BOOL)a3;
- (void)setAutoRemove:(BOOL)a3;
- (void)setType:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation VUINowPlayingUserTriggeredFeature

- (VUINowPlayingUserTriggeredFeature)init
{
  return [(VUINowPlayingUserTriggeredFeature *)self initWithType:-1];
}

- (VUINowPlayingUserTriggeredFeature)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUINowPlayingUserTriggeredFeature;
  result = [(VUINowPlayingUserTriggeredFeature *)&v5 init];
  if (a3 && result)
  {
    *(_WORD *)&result->_active = 0;
    result->_type = a3;
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
  v4 = _sFeatureTypeDescription([(VUINowPlayingUserTriggeredFeature *)self type]);
  [(VUINowPlayingUserTriggeredFeature *)self isActive];
  objc_super v5 = VUIBoolLogString();
  v6 = [v3 stringWithFormat:@"{\ntype: %@,\n active: %@\n}\n", v4, v5];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  v2 = _sFeatureTypeDescription([(VUINowPlayingUserTriggeredFeature *)self type]);
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VUINowPlayingUserTriggeredFeature *)a3;
  objc_super v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = [(VUINowPlayingUserTriggeredFeature *)self type];
    BOOL v7 = v6 == [(VUINowPlayingUserTriggeredFeature *)v5 type];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
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