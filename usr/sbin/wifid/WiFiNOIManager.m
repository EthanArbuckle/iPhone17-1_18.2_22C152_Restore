@interface WiFiNOIManager
+ (id)sharedWiFiNOIManagerWithQueue:(id)a3;
- (BOOL)setNetworkOfInterest:(__WiFiNetwork *)a3;
- (WiFiNOIManager)initWithQueue:(id)a3;
- (id)copyHomeNetworkTransitionDate;
- (id)getHomeNetworkNextTransitionDate:(id)a3;
- (void)armHomeNetworkTransitionTimer:(__WiFiDeviceManager *)a3;
- (void)asyncScopeHomeNetworks;
- (void)asyncScopeWorkNetworks;
- (void)asyncTrackNetworksOfInterest:(BOOL)a3;
- (void)attemptHomeNetworkTransition:(id)a3;
- (void)dealloc;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
- (void)disarmHomeNetworkTransitionTimer;
@end

@implementation WiFiNOIManager

+ (id)sharedWiFiNOIManagerWithQueue:(id)a3
{
  v5 = objc_opt_class();
  objc_sync_enter(v5);
  id v6 = (id)qword_10027DC28;
  if (!qword_10027DC28)
  {
    id v6 = [objc_alloc((Class)a1) initWithQueue:a3];
    qword_10027DC28 = (uint64_t)v6;
  }
  objc_sync_exit(v5);
  return v6;
}

- (WiFiNOIManager)initWithQueue:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)WiFiNOIManager;
  v4 = [(WiFiNOIManager *)&v15 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_24;
  }
  v4->_managerQueue = (OS_dispatch_queue *)a3;
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: nil _managerQueue" args:("-[WiFiNOIManager initWithQueue:]", nil)];
    }
    goto LABEL_23;
  }
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifid.wifinoimanagerq", v6);
  v5->_dispatchQueue = (OS_dispatch_queue *)v7;
  if (!v7)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: nil _dispatchQueue" arguments:((id)-[WiFiNOIManager initWithQueue:])];
    }
    goto LABEL_23;
  }
  v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  v5->_trackedHomeNetworks = v8;
  if (!v8)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null _trackedHomeNetworks", "-[WiFiNOIManager initWithQueue:]")
    }
    goto LABEL_23;
  }
  v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  v5->_trackedWorkNetworks = v9;
  if (!v9)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: null _trackedWorkNetworks" args:("-[WiFiNOIManager initWithQueue:]")];
    }
    goto LABEL_23;
  }
  v10 = (NWNetworkOfInterestManager *)objc_alloc_init((Class)NWNetworkOfInterestManager);
  v5->_noiManager = v10;
  if (!v10)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: null _noiManager" arguments:("-[WiFiNOIManager initWithQueue:]", nil)];
    }
    goto LABEL_23;
  }
  [(NWNetworkOfInterestManager *)v10 setQueue:v5->_dispatchQueue];
  [(NWNetworkOfInterestManager *)v5->_noiManager setDelegate:v5];
  v5->_isTracking = 0;
  v5->_deviceClass = MGGetSInt32Answer();
  v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v5->_sortedTopHomeNetworks = v11;
  if (!v11)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: null _sortedTopHomeNetworks" args:("-[WiFiNOIManager initWithQueue:]")];
    }
    goto LABEL_23;
  }
  v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v5->_sortedTopWorkNetworks = v12;
  if (!v12)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null _sortedTopWorkNetworks", "-[WiFiNOIManager initWithQueue:]")
    }
LABEL_23:
LABEL_24:

    v5 = 0;
  }
  qword_10027DC28 = (uint64_t)v5;
  return v5;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  trackedHomeNetworks = self->_trackedHomeNetworks;
  if (trackedHomeNetworks)
  {
    [(NSMutableSet *)trackedHomeNetworks removeAllObjects];
  }
  trackedWorkNetworks = self->_trackedWorkNetworks;
  if (trackedWorkNetworks)
  {
    [(NSMutableSet *)trackedWorkNetworks removeAllObjects];
  }
  v6.receiver = self;
  v6.super_class = (Class)WiFiNOIManager;
  [(WiFiNOIManager *)&v6 dealloc];
}

- (void)asyncTrackNetworksOfInterest:(BOOL)a3
{
  if ((self->_deviceClass | 2) == 3 && self->_isTracking != a3)
  {
    self->_isTracking = a3;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016626C;
    block[3] = &unk_10023EFA8;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (BOOL)setNetworkOfInterest:(__WiFiNetwork *)a3
{
  if ((self->_deviceClass | 2) != 3) {
    return 0;
  }
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100166478;
    block[3] = &unk_100242B50;
    void block[5] = &v8;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: null network" args:("-[WiFiNOIManager setNetworkOfInterest:]")];
    }
  }
  BOOL v4 = *((unsigned char *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void)asyncScopeHomeNetworks
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001666D8;
  block[3] = &unk_10023EFA8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)asyncScopeWorkNetworks
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001669E0;
  block[3] = &unk_10023EFA8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)attemptHomeNetworkTransition:(id)a3
{
  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100166CE8;
  block[3] = &unk_10023EFA8;
  block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)armHomeNetworkTransitionTimer:(__WiFiDeviceManager *)a3
{
  if (self->_deviceClass != 7) {
    return;
  }
  if (a3)
  {
    id v5 = [(WiFiNOIManager *)self copyHomeNetworkTransitionDate];
    homeTransitionTimer = self->_homeTransitionTimer;
    id v11 = v5;
    if (homeTransitionTimer)
    {
      [(NSTimer *)homeTransitionTimer setFireDate:v5];
LABEL_8:
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "Armed NOI Transition Check Timer. Fire at %@", v11 message];
      }

      return;
    }
    self->_deviceManager = a3;
    [self getHomeNetworkNextTransitionDate:v5].timeIntervalSinceNow;
    uint64_t v8 = (NSTimer *)[objc_alloc((Class)NSTimer) initWithFireDate:v11 interval:self target:"attemptHomeNetworkTransition:" selector:0 userInfo:1 repeats:v7];
    self->_homeTransitionTimer = v8;
    if (v8)
    {
      [+[NSRunLoop mainRunLoop] addTimer:self->_homeTransitionTimer forMode:NSDefaultRunLoopMode];
      goto LABEL_8;
    }
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, "%s: _noiTransitionCheckTimer is NULL", "-[WiFiNOIManager armHomeNetworkTransitionTimer:]"];
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: null manager" args:("-[WiFiNOIManager armHomeNetworkTransitionTimer:]", NULL)];
    }
  }
}

- (void)disarmHomeNetworkTransitionTimer
{
  if (self->_deviceClass == 7)
  {
    p_homeTransitionTimer = &self->_homeTransitionTimer;
    homeTransitionTimer = self->_homeTransitionTimer;
    if (homeTransitionTimer && [(NSTimer *)homeTransitionTimer isValid])
    {
      [(NSTimer *)*p_homeTransitionTimer invalidate];

      *p_homeTransitionTimer = 0;
      p_homeTransitionTimer[1] = 0;
    }
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3 message:"Disarm NOI Transition Check Timer"];
    }
  }
}

- (id)copyHomeNetworkTransitionDate
{
  v3 = +[NSDate date];
  BOOL v4 = +[NSCalendar currentCalendar];
  id v5 = [(NSCalendar *)v4 components:25100 fromDate:v3];
  if (!v5)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: null dateComponents" arguments:((id)qword_10027DD68), @"-[WiFiNOIManager copyHomeNetworkTransitionDate]"];
    }
    goto LABEL_11;
  }
  objc_super v6 = v5;
  [(NSDateComponents *)v5 setHour:5];
  [(NSDateComponents *)v6 setMinute:0];
  [(NSDateComponents *)v6 setSecond:0];
  double v7 = [(NSCalendar *)v4 dateFromComponents:v6];
  if (!v7)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:4, "%s: null fireDate", "-[WiFiNOIManager copyHomeNetworkTransitionDate]"];
    }
LABEL_11:
    return 0;
  }
  uint64_t v8 = v7;
  if ((id)[(NSDate *)v7 compare:v3] != (id)1) {
    uint64_t v8 = [(WiFiNOIManager *)self getHomeNetworkNextTransitionDate:v8];
  }
  v9 = v8;
  return v8;
}

- (id)getHomeNetworkNextTransitionDate:(id)a3
{
  id v5 = +[NSCalendar currentCalendar];
  id v6 = objc_alloc_init((Class)NSDateComponents);
  [v6 setDay:1];
  double v7 = [(NSCalendar *)v5 dateByAddingComponents:v6 toDate:a3 options:0];

  return v7;
}

- (void)didStartTrackingNOI:(id)a3
{
  if ([a3 atHomeScopedNOI])
  {
    [(NSMutableSet *)self->_trackedHomeNetworks addObject:a3];
    [(WiFiNOIManager *)self asyncScopeHomeNetworks];
  }
  if ([a3 atWorkScopedNOI])
  {
    [(NSMutableSet *)self->_trackedWorkNetworks addObject:a3];
    [(WiFiNOIManager *)self asyncScopeWorkNetworks];
  }
}

- (void)didStopTrackingNOI:(id)a3
{
  if ([a3 atHomeScopedNOI]) {
    [(NSMutableSet *)self->_trackedHomeNetworks removeObject:a3];
  }
  if ([a3 atWorkScopedNOI])
  {
    trackedWorkNetworks = self->_trackedWorkNetworks;
    [(NSMutableSet *)trackedWorkNetworks removeObject:a3];
  }
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "didStopTrackingAllNOIs type %@", a3 message];
  }
  if (self->_isTracking)
  {
    self->_isTracking = 0;
    trackedHomeNetworks = self->_trackedHomeNetworks;
    if (trackedHomeNetworks)
    {
      [(NSMutableSet *)trackedHomeNetworks removeAllObjects];

      [(NSMutableArray *)self->_sortedTopHomeNetworks removeAllObjects];
    }
    trackedWorkNetworks = self->_trackedWorkNetworks;
    if (trackedWorkNetworks)
    {
      [(NSMutableSet *)trackedWorkNetworks removeAllObjects];

      [(NSMutableArray *)self->_sortedTopWorkNetworks removeAllObjects];
    }
    self->_trackedHomeNetworks = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    self->_trackedWorkNetworks = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    [(WiFiNOIManager *)self asyncTrackNetworksOfInterest:1];
  }
}

@end