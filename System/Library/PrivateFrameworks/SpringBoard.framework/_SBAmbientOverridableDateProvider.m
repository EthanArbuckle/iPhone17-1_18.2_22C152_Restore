@interface _SBAmbientOverridableDateProvider
- (_SBAmbientOverridableDateProvider)init;
- (id)date;
- (id)observeMinuteUpdatesWithHandler:(id)a3;
- (void)removeMinuteUpdateHandler:(id)a3;
@end

@implementation _SBAmbientOverridableDateProvider

- (_SBAmbientOverridableDateProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)_SBAmbientOverridableDateProvider;
  v2 = [(_SBAmbientOverridableDateProvider *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FA5FB0]);
    v4 = [MEMORY[0x1E4FA7CE0] sharedInstance];
    uint64_t v5 = [v3 initWithDateProvider:v4];
    dateProvider = v2->_dateProvider;
    v2->_dateProvider = (SBFOverridableDateProvider *)v5;
  }
  return v2;
}

- (id)date
{
  return (id)[(SBFOverridableDateProvider *)self->_dateProvider date];
}

- (id)observeMinuteUpdatesWithHandler:(id)a3
{
  return (id)[(SBFOverridableDateProvider *)self->_dateProvider observeMinuteUpdatesWithHandler:a3];
}

- (void)removeMinuteUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end