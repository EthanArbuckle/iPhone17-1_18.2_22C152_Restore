@interface WiFi3BarsTileFetcher
- (NSXPCConnection)connectionToService;
- (TBDataSourceMediator)dataSourceMediator;
- (WiFi3BarsTileCacheObserver)tileCacheObserver;
- (WiFi3BarsTileFetcher)initWithDataSourceMediator:(id)a3;
- (unint64_t)lastFetchedKey;
- (void)_handleLocationManagerVisitCallbackWithVisit:(id)a3;
- (void)dealloc;
- (void)setDataSourceMediator:(id)a3;
- (void)setLastFetchedKey:(unint64_t)a3;
- (void)setTileCacheObserver:(id)a3;
@end

@implementation WiFi3BarsTileFetcher

- (WiFi3BarsTileFetcher)initWithDataSourceMediator:(id)a3
{
  v4 = (TBDataSourceMediator *)a3;
  v13.receiver = self;
  v13.super_class = (Class)WiFi3BarsTileFetcher;
  v5 = [(WiFi3BarsTileFetcher *)&v13 init];
  dataSourceMediator = v5->_dataSourceMediator;
  v5->_dataSourceMediator = v4;
  v7 = v4;

  v8 = +[WiFiLocationManager sharedWiFiLocationManager];
  [v8 setShouldMonitorVisits:1];

  v9 = +[WiFiLocationManager sharedWiFiLocationManager];
  [v9 registerVisitCallbackFunctionPtr:__WiFiManagerLocationManagerVisitCallback withContext:v5];

  v10 = [[WiFi3BarsTileCacheObserver alloc] initWithDataSourceMediator:v7];
  tileCacheObserver = v5->_tileCacheObserver;
  v5->_tileCacheObserver = v10;

  return v5;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connectionToService invalidate];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WiFi3BarsTileFetcher;
  [(WiFi3BarsTileFetcher *)&v4 dealloc];
}

- (void)_handleLocationManagerVisitCallbackWithVisit:(id)a3
{
  id v21 = a3;
  objc_super v4 = (void *)MEMORY[0x1D9440170]();
  v5 = [v21 departureDate];
  v6 = [MEMORY[0x1E4F1C9C8] distantFuture];

  if (v5 == v6)
  {
    [v21 horizontalAccuracy];
    if (v7 <= 2000.0)
    {
      v9 = [TBGloriaTile alloc];
      [v21 coordinate];
      double v11 = v10;
      [v21 coordinate];
      objc_super v13 = [(TBGloriaTile *)v9 initWithLat:+[TBGloriaTile defaultZoomLevel] lng:v11 zoom:v12];
      if ([(TBGloriaTile *)v13 key])
      {
        uint64_t v14 = [(TBGloriaTile *)v13 key];
        NSLog(&cfstr_SFetchingNetwo.isa, "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]", v14, +[TBGloriaTile defaultZoomLevel](TBGloriaTile, "defaultZoomLevel"));
        NSLog(&cfstr_SLastFetchedTi.isa, "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]", self->_lastFetchedKey, v14);
        v15 = [MEMORY[0x1E4F1C9C8] date];
        v16 = [v15 dateByAddingDays:-7];

        v17 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.wifi.ThreeBarsXPCService"];
        connectionToService = self->_connectionToService;
        self->_connectionToService = v17;

        if (self->_connectionToService)
        {
          v19 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2BC2640];
          [(NSXPCConnection *)self->_connectionToService setRemoteObjectInterface:v19];

          [(NSXPCConnection *)self->_connectionToService resume];
          v20 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_0];
          if (v20) {
            objc_msgSend(v20, "fetchTileFromVisitedCallback:cacheAge:", -[TBGloriaTile key](v13, "key"), v16);
          }
          else {
            NSLog(&cfstr_SProxyIsNull.isa, "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]");
          }
        }
        else
        {
          NSLog(&cfstr_SConnectiontos.isa, "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]");
        }
      }
      else
      {
        NSLog(&cfstr_SInvalidTileke.isa, "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]", +[TBGloriaTile defaultZoomLevel](TBGloriaTile, "defaultZoomLevel"));
      }
    }
    else
    {
      [v21 horizontalAccuracy];
      NSLog(&cfstr_SVisitAccuracy.isa, "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]", v8);
    }
  }
  else
  {
    NSLog(&cfstr_SVisitIsADepar.isa, "-[WiFi3BarsTileFetcher _handleLocationManagerVisitCallbackWithVisit:]");
  }
}

void __69__WiFi3BarsTileFetcher__handleLocationManagerVisitCallbackWithVisit___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (TBDataSourceMediator)dataSourceMediator
{
  return self->_dataSourceMediator;
}

- (void)setDataSourceMediator:(id)a3
{
}

- (unint64_t)lastFetchedKey
{
  return self->_lastFetchedKey;
}

- (void)setLastFetchedKey:(unint64_t)a3
{
  self->_lastFetchedKey = a3;
}

- (WiFi3BarsTileCacheObserver)tileCacheObserver
{
  return self->_tileCacheObserver;
}

- (void)setTileCacheObserver:(id)a3
{
}

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);
  objc_storeStrong((id *)&self->_tileCacheObserver, 0);

  objc_storeStrong((id *)&self->_dataSourceMediator, 0);
}

@end