@interface PowerUIRemoteLocationMonitor
- (NSDate)lastBatchRequest;
- (OS_dispatch_queue)syncQueue;
- (OS_os_log)log;
- (PowerUILocationSignalMonitor)locationManager;
- (PowerUIRemoteLocationMonitor)initWithManager:(id)a3 withLocationManager:(id)a4 withContext:(id)a5 withDefaultsDomain:(id)a6 withTrialManager:(id)a7;
- (PowerUISmartChargeManager)manager;
- (_CDContext)context;
- (_CDContextualChangeRegistration)wakingRegistration;
- (unint64_t)syncing;
- (void)setContext:(id)a3;
- (void)setLastBatchRequest:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLog:(id)a3;
- (void)setManager:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setSyncing:(unint64_t)a3;
- (void)setWakingRegistration:(id)a3;
@end

@implementation PowerUIRemoteLocationMonitor

- (PowerUIRemoteLocationMonitor)initWithManager:(id)a3 withLocationManager:(id)a4 withContext:(id)a5 withDefaultsDomain:(id)a6 withTrialManager:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)PowerUIRemoteLocationMonitor;
  return [(PowerUIRemoteLocationMonitor *)&v8 init];
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (PowerUISmartChargeManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (PowerUILocationSignalMonitor)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (unint64_t)syncing
{
  return self->_syncing;
}

- (void)setSyncing:(unint64_t)a3
{
  self->_syncing = a3;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_CDContextualChangeRegistration)wakingRegistration
{
  return self->_wakingRegistration;
}

- (void)setWakingRegistration:(id)a3
{
}

- (NSDate)lastBatchRequest
{
  return self->_lastBatchRequest;
}

- (void)setLastBatchRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBatchRequest, 0);
  objc_storeStrong((id *)&self->_wakingRegistration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end