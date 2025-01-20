@interface NRVolatilePreferences
- (void)_clearIfFirstAccessSinceBoot;
- (void)_setDomain:(id)a3;
@end

@implementation NRVolatilePreferences

- (void)_clearIfFirstAccessSinceBoot
{
  v3 = [(NRPreferences *)self _objectForKeyedSubscript:@"__BOOTTIME"];
  uint64_t v9 = 0;
  *(void *)v10 = 0x1500000001;
  size_t v7 = 16;
  uint64_t v8 = 0;
  int v4 = sysctl(v10, 2u, &v8, &v7, 0, 0);
  double v5 = -1.0;
  if (v4 != -1 && v8) {
    double v5 = (double)(int)v9 / 1000000.0 + (double)v8;
  }
  v6 = +[NSNumber numberWithDouble:v5];
  if (!v3 || ([v3 isEqual:v6] & 1) == 0)
  {
    [(NRPreferences *)self _clear];
    [(NRPreferences *)self _setObject:v6 forKeyedSubscript:@"__BOOTTIME"];
    [(NRPreferences *)self _synchronize];
  }
}

- (void)_setDomain:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NRVolatilePreferences;
  [(NRPreferences *)&v4 _setDomain:a3];
  [(NRVolatilePreferences *)self _clearIfFirstAccessSinceBoot];
}

@end