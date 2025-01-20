@interface CLTileDownloadSchedulingClient
- (BOOL)hasExecutedScheduleFromCellularConnectivity;
- (BOOL)hasExecutedScheduleFromWifiConnectivity;
- (BOOL)scheduleTileDownloadIfNecessary;
- (BOOL)valid;
- (CLITileDownloadSchedulingClientDelegate)delegate;
- (CLIntersiloUniverse)universe;
- (CLTileDownloadSchedulingClient)initWithUniverse:(id)a3 andDelegate:(CLITileDownloadSchedulingClientDelegate *)a4;
- (CLTileDownloadSchedulingServiceProtocol)proxy;
- (void)dealloc;
- (void)onScheduledTileDownloadWithReachabilityRequirement:(int64_t)a3;
- (void)setDelegate:(CLITileDownloadSchedulingClientDelegate *)a3;
- (void)setHasExecutedScheduleFromCellularConnectivity:(BOOL)a3;
- (void)setHasExecutedScheduleFromWifiConnectivity:(BOOL)a3;
- (void)setProxy:(id)a3;
- (void)setUniverse:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLTileDownloadSchedulingClient

- (CLTileDownloadSchedulingClient)initWithUniverse:(id)a3 andDelegate:(CLITileDownloadSchedulingClientDelegate *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLTileDownloadSchedulingClient;
  v6 = [(CLTileDownloadSchedulingClient *)&v8 init];
  if (v6)
  {
    v6->_universe = (CLIntersiloUniverse *)a3;
    v6->_delegate = a4;
    [(CLTileDownloadSchedulingClient *)v6 setValid:1];
  }
  return v6;
}

- (void)dealloc
{
  [(CLTileDownloadSchedulingClient *)self setProxy:0];
  [(CLTileDownloadSchedulingClient *)self setUniverse:0];
  [(CLTileDownloadSchedulingClient *)self setValid:0];
  [(CLTileDownloadSchedulingClient *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CLTileDownloadSchedulingClient;
  [(CLTileDownloadSchedulingClient *)&v3 dealloc];
}

- (BOOL)scheduleTileDownloadIfNecessary
{
  if (![(CLTileDownloadSchedulingClient *)self proxy])
  {
    -[CLTileDownloadSchedulingClient setProxy:](self, "setProxy:", [CLIntersiloUniverse vendor:[CLTileDownloadSchedulingClient universe:self]vendor:@"CLTileDownloadSchedulingService"]);
    [(CLTileDownloadSchedulingServiceProtocol *)[(CLTileDownloadSchedulingClient *)self proxy] registerDelegate:self inSilo:[(CLIntersiloUniverse *)[(CLTileDownloadSchedulingClient *)self universe] silo]];
LABEL_6:
    [(CLTileDownloadSchedulingServiceProtocol *)[(CLTileDownloadSchedulingClient *)self proxy] requestForSchedulingTileDownload:self];
    [(CLTileDownloadSchedulingClient *)self setHasExecutedScheduleFromCellularConnectivity:0];
    [(CLTileDownloadSchedulingClient *)self setHasExecutedScheduleFromWifiConnectivity:0];
    LOBYTE(v3) = 1;
    return v3;
  }
  if ([(CLTileDownloadSchedulingClient *)self hasExecutedScheduleFromCellularConnectivity])
  {
    goto LABEL_6;
  }
  BOOL v3 = [(CLTileDownloadSchedulingClient *)self hasExecutedScheduleFromWifiConnectivity];
  if (v3) {
    goto LABEL_6;
  }
  return v3;
}

- (void)onScheduledTileDownloadWithReachabilityRequirement:(int64_t)a3
{
  if (a3 == 2)
  {
    [(CLTileDownloadSchedulingClient *)self setHasExecutedScheduleFromWifiConnectivity:1];
  }
  else if (a3 == 1)
  {
    [(CLTileDownloadSchedulingClient *)self setHasExecutedScheduleFromCellularConnectivity:1];
  }
  if ([(CLTileDownloadSchedulingClient *)self hasExecutedScheduleFromCellularConnectivity]&& [(CLTileDownloadSchedulingClient *)self hasExecutedScheduleFromWifiConnectivity])
  {
    [(CLTileDownloadSchedulingServiceProtocol *)[(CLTileDownloadSchedulingClient *)self proxy] stopListeningForForScheduledTileDownload:self];
    [(CLTileDownloadSchedulingClient *)self setProxy:0];
  }
  v4 = *(void (**)(void))(*(void *)[(CLTileDownloadSchedulingClient *)self delegate] + 16);

  v4();
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (CLTileDownloadSchedulingServiceProtocol)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
}

- (CLIntersiloUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
}

- (BOOL)hasExecutedScheduleFromCellularConnectivity
{
  return self->_hasExecutedScheduleFromCellularConnectivity;
}

- (void)setHasExecutedScheduleFromCellularConnectivity:(BOOL)a3
{
  self->_hasExecutedScheduleFromCellularConnectivity = a3;
}

- (BOOL)hasExecutedScheduleFromWifiConnectivity
{
  return self->_hasExecutedScheduleFromWifiConnectivity;
}

- (void)setHasExecutedScheduleFromWifiConnectivity:(BOOL)a3
{
  self->_hasExecutedScheduleFromWifiConnectivity = a3;
}

- (CLITileDownloadSchedulingClientDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(CLITileDownloadSchedulingClientDelegate *)a3
{
  self->_delegate = a3;
}

@end