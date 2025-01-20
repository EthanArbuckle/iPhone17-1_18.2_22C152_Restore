@interface NWKUIAQIFormatter
+ (NWKUIAQIFormatter)autoupdatingSharedFormatter;
- (NWKUIAQIFormatter)initWithLocale:(id)a3;
- (id)formattedIndexFromAirQualityConditions:(id)a3;
- (void)_localeChanged:(id)a3;
- (void)_reloadWithLocale:(id)a3;
@end

@implementation NWKUIAQIFormatter

+ (NWKUIAQIFormatter)autoupdatingSharedFormatter
{
  if (autoupdatingSharedFormatter_onceToken != -1) {
    dispatch_once(&autoupdatingSharedFormatter_onceToken, &__block_literal_global);
  }
  v2 = (void *)autoupdatingSharedFormatter_SharedFormatter;
  return (NWKUIAQIFormatter *)v2;
}

void __48__NWKUIAQIFormatter_autoupdatingSharedFormatter__block_invoke()
{
  v0 = [NWKUIAQIFormatter alloc];
  v1 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v2 = [(NWKUIAQIFormatter *)v0 initWithLocale:v1];
  v3 = (void *)autoupdatingSharedFormatter_SharedFormatter;
  autoupdatingSharedFormatter_SharedFormatter = v2;

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:autoupdatingSharedFormatter_SharedFormatter selector:sel__localeChanged_ name:*MEMORY[0x263EFF458] object:0];
}

- (NWKUIAQIFormatter)initWithLocale:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NWKUIAQIFormatter;
  v5 = [(NWKUIAQIFormatter *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    [(NWKUIAQIFormatter *)v5 _reloadWithLocale:v4];
  }

  return v6;
}

- (void)_reloadWithLocale:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSNumberFormatter *)objc_opt_new();
  [(NSNumberFormatter *)v6 setLocale:v5];

  [(NSNumberFormatter *)v6 setMaximumFractionDigits:0];
  [(NSNumberFormatter *)v6 setMinimumIntegerDigits:1];
  formatter = self->_formatter;
  self->_formatter = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)_localeChanged:(id)a3
{
  objc_msgSend(MEMORY[0x263EFF960], "currentLocale", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NWKUIAQIFormatter *)self _reloadWithLocale:v4];
}

- (id)formattedIndexFromAirQualityConditions:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  formatter = self->_formatter;
  v7 = NSNumber;
  uint64_t v8 = [v5 airQualityIndex];

  v9 = [v7 numberWithUnsignedInteger:v8];
  v10 = [(NSNumberFormatter *)formatter stringFromNumber:v9];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void).cxx_destruct
{
}

@end