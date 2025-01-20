@interface PedestrianARSessionTileAvailabilityMonitor
+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey;
+ (id)friendlyName;
- (NSString)debugDescription;
- (PedestrianARSessionTileAvailabilityMonitor)initWithObserver:(id)a3 tileObserver:(id)a4;
- (VLFTileObserver)tileObserver;
- (void)dealloc;
- (void)setTileObserver:(id)a3;
- (void)updateState;
@end

@implementation PedestrianARSessionTileAvailabilityMonitor

- (void)updateState
{
  v3 = [(PedestrianARSessionTileAvailabilityMonitor *)self tileObserver];
  id v4 = [v3 areTilesAvailable];

  v5 = sub_100012940();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      int v8 = 134349056;
      v9 = self;
      v7 = "[%{public}p] Tiles are available";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v6)
  {
    int v8 = 134349056;
    v9 = self;
    v7 = "[%{public}p] Tiles are not available";
    goto LABEL_6;
  }

  [(PedestrianARSessionMonitor *)self setShouldShowPedestrianAR:v4];
}

- (PedestrianARSessionTileAvailabilityMonitor)initWithObserver:(id)a3 tileObserver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "-[PedestrianARSessionTileAvailabilityMonitor initWithObserver:tileObserver:]";
      __int16 v17 = 2080;
      v18 = "PedestrianARSessionTileAvailabilityMonitor.m";
      __int16 v19 = 1024;
      int v20 = 31;
      __int16 v21 = 2080;
      v22 = "tileObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)PedestrianARSessionTileAvailabilityMonitor;
  int v8 = [(PedestrianARSessionMonitor *)&v14 initWithObserver:v6];
  if (v8)
  {
    v9 = sub_100012940();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v16 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v8->_tileObserver, a4);
    [(VLFTileObserver *)v8->_tileObserver addAvailabilityObserver:v8];
    [(PedestrianARSessionTileAvailabilityMonitor *)v8 updateState];
  }

  return v8;
}

- (VLFTileObserver)tileObserver
{
  return self->_tileObserver;
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2 = MapsConfig_PedestrianARSessionTileAvailabilityMonitorEnabled;
  v3 = off_1015EFF38;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- (void)dealloc
{
  v3 = sub_100012940();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  [(VLFTileObserver *)self->_tileObserver removeAvailabilityObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARSessionTileAvailabilityMonitor;
  [(PedestrianARSessionMonitor *)&v4 dealloc];
}

- (NSString)debugDescription
{
  v3 = [(id)objc_opt_class() friendlyName];
  objc_super v4 = [(PedestrianARSessionTileAvailabilityMonitor *)self tileObserver];
  unsigned int v5 = [v4 areTilesAvailable];
  id v6 = @"NO";
  if (v5) {
    id v6 = @"YES";
  }
  id v7 = v6;
  GEOConfigGetDouble();
  uint64_t v9 = v8;
  GEOConfigGetDouble();
  v11 = +[NSString stringWithFormat:@"%@\nare tiles available: %@\nerror timeout threshold (seconds): %.2f\nminimum distance threshold (meters): %.2f\n", v3, v7, v9, v10];

  return (NSString *)v11;
}

+ (id)friendlyName
{
  return @"Tile Availability Monitor";
}

- (void)setTileObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end