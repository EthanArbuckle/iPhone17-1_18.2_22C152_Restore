@interface WiFiManagerCarSessionMonitor
+ (id)sharedInstance;
- (BOOL)isCarDNDActive;
- (CARAutomaticDNDStatus)dndStatus;
- (OS_dispatch_queue)queue;
- (__WiFiManager)manager;
- (void)_updateDNDStatus;
- (void)dealloc;
- (void)initializeWithManager:(__WiFiManager *)a3 queue:(id)a4;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setCarDNDActive:(BOOL)a3;
- (void)setDndStatus:(id)a3;
- (void)setManager:(__WiFiManager *)a3;
- (void)setQueue:(id)a3;
- (void)startMonitoringCarSession;
- (void)stopMonitoringCarSession;
@end

@implementation WiFiManagerCarSessionMonitor

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059A48;
  block[3] = &unk_10023EAF8;
  block[4] = a1;
  if (qword_10027D640 != -1) {
    dispatch_once(&qword_10027D640, block);
  }
  v2 = (void *)qword_10027D638;

  return v2;
}

- (void)initializeWithManager:(__WiFiManager *)a3 queue:(id)a4
{
  id v6 = a4;
  [(WiFiManagerCarSessionMonitor *)self setManager:a3];
  [(WiFiManagerCarSessionMonitor *)self setQueue:v6];

  self->_carDNDActive = 0;
  id v7 = objc_alloc_init((Class)CARAutomaticDNDStatus);
  [(WiFiManagerCarSessionMonitor *)self setDndStatus:v7];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100059B34, @"CARAutomaticDNDStatusChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  [(WiFiManagerCarSessionMonitor *)self _updateDNDStatus];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"CARAutomaticDNDStatusChangedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)WiFiManagerCarSessionMonitor;
  [(WiFiManagerCarSessionMonitor *)&v4 dealloc];
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: carplay session started", "-[WiFiManagerCarSessionMonitor sessionDidConnect:]");
    }
    id v6 = [v4 configuration];
    carPlaySessionConfiguration = self->carPlaySessionConfiguration;
    self->carPlaySessionConfiguration = v6;

    v8 = self->carPlaySessionConfiguration;
    if (v8)
    {
      v9 = [(CARSessionConfiguration *)v8 vehicleModelName];
      v10 = [(CARSessionConfiguration *)self->carPlaySessionConfiguration vehicleManufacturer];
      v11 = [(CARSessionConfiguration *)self->carPlaySessionConfiguration vehicleHardwareVersion];
      if (v9) {
        v12 = v9;
      }
      else {
        v12 = @"unknown";
      }
      v13 = v12;

      if (v10) {
        v14 = v10;
      }
      else {
        v14 = @"unknown";
      }
      v15 = v14;

      if (v11) {
        v16 = v11;
      }
      else {
        v16 = @"unknown";
      }
      v17 = v16;

      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: vehicleModelName %@, vehicleManufacturer %@, vehicleHardwareVersion %@", "-[WiFiManagerCarSessionMonitor sessionDidConnect:]", v13, v15, v17 message];
      }
      v19 = [(WiFiManagerCarSessionMonitor *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100059D94;
      block[3] = &unk_10023F590;
      block[4] = self;
      v24 = v13;
      v25 = v15;
      v26 = v17;
      v20 = v17;
      v21 = v15;
      v22 = v13;
      dispatch_async(v19, block);
    }
  }
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(WiFiManagerCarSessionMonitor *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100059EB8;
    block[3] = &unk_10023E9B8;
    block[4] = self;
    dispatch_async(v5, block);

    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: carplay session ended", @"-[WiFiManagerCarSessionMonitor sessionDidDisconnect:]"];
    }
  }
}

- (void)startMonitoringCarSession
{
  v3 = (CARSessionStatus *)objc_alloc_init((Class)CARSessionStatus);
  carSessionStatus = self->carSessionStatus;
  self->carSessionStatus = v3;

  v5 = self->carSessionStatus;

  [(CARSessionStatus *)v5 addSessionObserver:self];
}

- (void)stopMonitoringCarSession
{
}

- (void)_updateDNDStatus
{
  v3 = [(WiFiManagerCarSessionMonitor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059FD8;
  block[3] = &unk_10023E9B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)isCarDNDActive
{
  return self->_carDNDActive;
}

- (void)setCarDNDActive:(BOOL)a3
{
  self->_carDNDActive = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (CARAutomaticDNDStatus)dndStatus
{
  return self->_dndStatus;
}

- (void)setDndStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dndStatus, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->carPlaySessionConfiguration, 0);

  objc_storeStrong((id *)&self->carSessionStatus, 0);
}

@end