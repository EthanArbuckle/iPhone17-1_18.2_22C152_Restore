@interface WeatherView
- (BOOL)_setCity:(id)a3 associateAsDelegate:(BOOL)a4;
- (BOOL)updateWeatherDisplayForCity:(id)a3;
- (City)city;
- (WeatherView)initWithFrame:(CGRect)a3;
- (id)bundle;
- (void)cityDidStartWeatherUpdate:(id)a3;
- (void)cleanupWindView;
- (void)dealloc;
- (void)refreshLocalization;
- (void)resetLocale:(id)a3;
- (void)showCity:(id)a3;
@end

@implementation WeatherView

- (WeatherView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WeatherView;
  v3 = -[WeatherView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF960] currentLocale];
    lastLocale = v3->_lastLocale;
    v3->_lastLocale = (NSLocale *)v4;

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v3 selector:sel_resetLocale_ name:*MEMORY[0x263EFF458] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(City *)self->_city removeUpdateObserver:self];
  [(WeatherView *)self cleanupWindView];
  v4.receiver = self;
  v4.super_class = (Class)WeatherView;
  [(WeatherView *)&v4 dealloc];
}

- (void)resetLocale:(id)a3
{
  lastLocale = self->_lastLocale;
  v5 = objc_msgSend(MEMORY[0x263EFF960], "currentLocale", a3);
  LOBYTE(lastLocale) = [(NSLocale *)lastLocale isEqualToLocaleForWeather:v5];

  if ((lastLocale & 1) == 0)
  {
    v6 = [(WeatherView *)self city];
    [(WeatherView *)self showCity:v6];
  }
  v7 = [MEMORY[0x263EFF960] currentLocale];
  objc_super v8 = self->_lastLocale;
  self->_lastLocale = v7;
  MEMORY[0x270F9A758](v7, v8);
}

- (BOOL)_setCity:(id)a3 associateAsDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (City *)a3;
  city = self->_city;
  if (city != v7)
  {
    [(City *)self->_city removeUpdateObserver:self];
    if (([MEMORY[0x263F1C408] shouldMakeUIForDefaultPNG] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_city, a3);
      if (self->_city) {
        BOOL v9 = !v4;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9) {
        [(City *)v7 addUpdateObserver:self];
      }
    }
  }

  return city != v7;
}

- (void)showCity:(id)a3
{
  id v4 = a3;
  if (-[WeatherView _setCity:associateAsDelegate:](self, "_setCity:associateAsDelegate:")) {
    [(WeatherView *)self updateWeatherDisplayForCity:v4];
  }
}

- (BOOL)updateWeatherDisplayForCity:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"WeatherView.m", 113, @"%s is an abstract method that must be overriden by subclass %@", "-[WeatherView updateWeatherDisplayForCity:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)cityDidStartWeatherUpdate:(id)a3
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2, self, @"WeatherView.m", 119, @"%s is an abstract method that must be overriden by subclass %@", "-[WeatherView cityDidStartWeatherUpdate:]", objc_opt_class() object file lineNumber description];
}

- (void)refreshLocalization
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"WeatherView.m", 124, @"%s is an abstract method that must be overriden by subclass %@", "-[WeatherView refreshLocalization]", objc_opt_class() object file lineNumber description];
}

- (id)bundle
{
  v2 = (void *)bundle___bundle;
  if (!bundle___bundle)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = (void *)bundle___bundle;
    bundle___bundle = v3;

    v2 = (void *)bundle___bundle;
  }
  return v2;
}

- (void)cleanupWindView
{
  windView = self->_windView;
  if (windView)
  {
    id v4 = [(UIView *)windView layer];
    [v4 removeAnimationForKey:@"contents"];

    [(UIView *)self->_windView removeFromSuperview];
    id v5 = self->_windView;
    self->_windView = 0;
  }
}

- (City)city
{
  return self->_city;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocale, 0);
  objc_storeStrong((id *)&self->_windView, 0);
  objc_storeStrong((id *)&self->_city, 0);
}

@end