@interface CTService
- (CBMutableCharacteristic)currentTimeCharacteristic;
- (CBMutableCharacteristic)localTimeInformationCharacteristic;
- (CTService)init;
- (NSTimer)nextDSTTransitionTimer;
- (char)currentTimeZone;
- (id)currentTimeValue;
- (id)localTimeInformationValue;
- (id)readLocalTimeInformation;
- (unsigned)currentDstOffset;
- (void)cancelNextDSTTransitionTimer;
- (void)currentTimeDidChange;
- (void)dealloc;
- (void)dstDidChange;
- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4;
- (void)setCurrentTimeCharacteristic:(id)a3;
- (void)setLocalTimeInformationCharacteristic:(id)a3;
- (void)setNextDSTTransitionTimer:(id)a3;
- (void)setupNextDSTTransitionTimer;
- (void)significantTimeChange;
- (void)startNotifications;
- (void)stop;
- (void)stopNotifications;
- (void)updateCurrentTime;
@end

@implementation CTService

- (CTService)init
{
  v18.receiver = self;
  v18.super_class = (Class)CTService;
  v2 = [(CTService *)&v18 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)CBMutableCharacteristic);
    v4 = +[CBUUID UUIDWithString:CBUUIDCurrentTimeCharacteristicString];
    v5 = (CBMutableCharacteristic *)[v3 initWithType:v4 properties:1042 value:0 permissions:17];
    currentTimeCharacteristic = v2->_currentTimeCharacteristic;
    v2->_currentTimeCharacteristic = v5;

    id v7 = objc_alloc((Class)CBMutableCharacteristic);
    v8 = +[CBUUID UUIDWithString:CBUUIDLocalTimeInformationCharacteristicString];
    v9 = (CBMutableCharacteristic *)[v7 initWithType:v8 properties:2 value:0 permissions:17];
    localTimeInformationCharacteristic = v2->_localTimeInformationCharacteristic;
    v2->_localTimeInformationCharacteristic = v9;

    id v11 = objc_alloc((Class)CBMutableService);
    v12 = +[CBUUID UUIDWithString:CBUUIDCurrentTimeServiceString];
    id v13 = [v11 initWithType:v12 primary:1];
    [(ServerService *)v2 setService:v13];

    v19[0] = v2->_currentTimeCharacteristic;
    v19[1] = v2->_localTimeInformationCharacteristic;
    v14 = +[NSArray arrayWithObjects:v19 count:2];
    v15 = [(ServerService *)v2 service];
    [v15 setCharacteristics:v14];

    nextDSTTransitionTimer = v2->_nextDSTTransitionTimer;
    v2->_nextDSTTransitionTimer = 0;
  }
  return v2;
}

- (void)stop
{
  [(CTService *)self cancelNextDSTTransitionTimer];
  v3.receiver = self;
  v3.super_class = (Class)CTService;
  [(ServerService *)&v3 stop];
}

- (void)dealloc
{
  [(CTService *)self stopNotifications];
  v3.receiver = self;
  v3.super_class = (Class)CTService;
  [(CTService *)&v3 dealloc];
}

- (id)currentTimeValue
{
  v2 = +[DataOutputStream outputStreamWithByteOrder:1];
  id v3 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  v4 = +[NSDate date];
  v5 = [v3 components:33532 fromDate:v4];

  [v2 writeUint16:(unsigned __int16)[v5 year]];
  [v2 writeUint8:[v5 month]];
  [v2 writeUint8:[v5 day]];
  [v2 writeUint8:[v5 hour]];
  [v2 writeUint8:[v5 minute]];
  [v2 writeUint8:[v5 second]];
  unsigned __int8 v6 = [v5 weekday];
  unsigned __int8 v7 = v6 - 1;
  if (v6 == 1) {
    unsigned __int8 v7 = 7;
  }
  [v2 writeUint8:v7];
  [v2 writeUint8:((((((unint64_t)objc_msgSend(v5, "nanosecond") >> 1)* (unsigned __int128)0x112E0BE826D694B3uLL) >> 64) >> 17)];
  [v2 writeUint8:2];
  v8 = [v2 data];

  return v8;
}

- (void)updateCurrentTime
{
  id v4 = [(CTService *)self currentTimeValue];
  id v3 = [(CTService *)self currentTimeCharacteristic];
  [(ServerService *)self updateValue:v4 forCharacteristic:v3 onSubscribedCentrals:0];
}

- (id)localTimeInformationValue
{
  id v3 = +[DataOutputStream outputStream];
  [v3 writeUint8:-[CTService currentTimeZone](self, "currentTimeZone")];
  [v3 writeUint8:-[CTService currentDstOffset](self, "currentDstOffset")];
  id v4 = [v3 data];

  return v4;
}

- (id)readLocalTimeInformation
{
  return [(CTService *)self localTimeInformationValue];
}

- (void)cancelNextDSTTransitionTimer
{
  id v3 = [(CTService *)self nextDSTTransitionTimer];
  [v3 invalidate];

  [(CTService *)self setNextDSTTransitionTimer:0];
}

- (void)setupNextDSTTransitionTimer
{
  [(CTService *)self cancelNextDSTTransitionTimer];
  id v3 = +[NSTimeZone systemTimeZone];
  id v7 = [v3 nextDaylightSavingTimeTransition];

  if (v7)
  {
    id v4 = [objc_alloc((Class)NSTimer) initWithFireDate:v7 interval:self target:"dstDidChange" selector:0 userInfo:0 repeats:0.0];
    [(CTService *)self setNextDSTTransitionTimer:v4];

    v5 = +[NSRunLoop mainRunLoop];
    unsigned __int8 v6 = [(CTService *)self nextDSTTransitionTimer];
    [v5 addTimer:v6 forMode:NSDefaultRunLoopMode];
  }
}

- (void)startNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100055B70, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  [(CTService *)self setupNextDSTTransitionTimer];
}

- (void)stopNotifications
{
  id v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v6[0] = 67109120;
    v6[1] = [(ServerService *)self restrictedMode];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restrictedMode : %d", (uint8_t *)v6, 8u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
  [(CTService *)self cancelNextDSTTransitionTimer];
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [(CTService *)self currentTimeCharacteristic];
  v8 = [v7 subscribedCentrals];
  id v9 = [v8 count];

  if (!v9) {
    +[NSTimeZone resetSystemTimeZone];
  }
  v10 = [v6 characteristic];
  id v11 = [(CTService *)self currentTimeCharacteristic];

  if (v10 == v11)
  {
    uint64_t v15 = [(CTService *)self readCurrentTime];
  }
  else
  {
    v12 = [v6 characteristic];
    id v13 = [(CTService *)self localTimeInformationCharacteristic];

    if (v12 != v13)
    {
      uint64_t v14 = 10;
      goto LABEL_9;
    }
    uint64_t v15 = [(CTService *)self readLocalTimeInformation];
  }
  v16 = (void *)v15;
  [v6 setValue:v15];

  uint64_t v14 = 0;
LABEL_9:
  [v17 respondToRequest:v6 withResult:v14];
}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v6 = a5;
  id v7 = [(CTService *)self currentTimeCharacteristic];

  if (v7 == v6)
  {
    v8 = [(CTService *)self currentTimeCharacteristic];
    id v9 = [v8 subscribedCentrals];
    id v10 = [v9 count];

    if (v10 == (id)1)
    {
      [(CTService *)self startNotifications];
      +[NSTimeZone resetSystemTimeZone];
    }
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  id v6 = a5;
  id v7 = [(CTService *)self currentTimeCharacteristic];

  if (v7 == v6)
  {
    v8 = [(CTService *)self currentTimeCharacteristic];
    id v9 = [v8 subscribedCentrals];
    id v10 = [v9 count];

    if (!v10)
    {
      [(CTService *)self stopNotifications];
    }
  }
}

- (void)significantTimeChange
{
  id v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Significant time change", v4, 2u);
  }
  +[NSTimeZone resetSystemTimeZone];
  [(CTService *)self currentTimeDidChange];
}

- (void)dstDidChange
{
  id v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DST did change", v4, 2u);
  }
  [(CTService *)self currentTimeDidChange];
}

- (void)currentTimeDidChange
{
  [(CTService *)self setupNextDSTTransitionTimer];

  [(CTService *)self updateCurrentTime];
}

- (char)currentTimeZone
{
  v2 = +[NSTimeZone systemTimeZone];
  double v3 = (double)(uint64_t)[v2 secondsFromGMT];
  [v2 daylightSavingTimeOffset];
  int v5 = (int)((v3 - v4) / 60.0 / 15.0);

  return v5;
}

- (unsigned)currentDstOffset
{
  v2 = +[NSTimeZone systemTimeZone];
  [v2 daylightSavingTimeOffset];
  int v4 = (int)(v3 / 60.0 / 15.0);

  return v4;
}

- (CBMutableCharacteristic)currentTimeCharacteristic
{
  return self->_currentTimeCharacteristic;
}

- (void)setCurrentTimeCharacteristic:(id)a3
{
}

- (CBMutableCharacteristic)localTimeInformationCharacteristic
{
  return self->_localTimeInformationCharacteristic;
}

- (void)setLocalTimeInformationCharacteristic:(id)a3
{
}

- (NSTimer)nextDSTTransitionTimer
{
  return self->_nextDSTTransitionTimer;
}

- (void)setNextDSTTransitionTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextDSTTransitionTimer, 0);
  objc_storeStrong((id *)&self->_localTimeInformationCharacteristic, 0);

  objc_storeStrong((id *)&self->_currentTimeCharacteristic, 0);
}

@end