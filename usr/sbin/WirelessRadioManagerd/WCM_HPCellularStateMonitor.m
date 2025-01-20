@interface WCM_HPCellularStateMonitor
- (BOOL)bHPCellSetBTAFH;
- (BOOL)start;
- (WCM_HPCellularStateMonitor)init;
- (void)setBHPCellSetBTAFH:(BOOL)a3;
- (void)stateChanged:(id)a3;
@end

@implementation WCM_HPCellularStateMonitor

- (BOOL)start
{
  +[WCM_Logging logLevel:4 message:@"HPCellular: start method in WCM_HPCellularStateMonitor is called."];
  unsigned int v3 = [(CTStewieStateMonitor *)self->fMonitor start];
  if (v3)
  {
    id v4 = [(CTStewieStateMonitor *)self->fMonitor getState];
    +[WCM_Logging logLevel:4, @"HPCellular: Initial state queried succesfully. Initial state: %@", v4 message];
    id v5 = [v4 status];
    id v6 = +[WCM_PolicyManager singleton];
    if (v6)
    {
      v7 = v6;
      +[WCM_Logging logLevel:4 message:@"HPCellular: in initial state query, creating [WCM_PolicyManager singleton] is successful in WCM_HPCellularStateMonitor.m."];
      if (objc_msgSend(objc_msgSend(v7, "activeCoexFeatures"), "containsObject:", @"hpcellularstatemonitorsupport"))
      {
        BOOL v8 = v5 == (id)5;
        if (v5 == (id)5) {
          CFStringRef v9 = @"HPCellular: In initial state query, HPCellular Status is active and Bool flag bHPCellSetBTAFH of WCM_HPCellularStateMonitor class has been set to: (%d)";
        }
        else {
          CFStringRef v9 = @"HPCellular: In initial state query, HPCellular Status is not active and Bool flag bHPCellSetBTAFH of WCM_HPCellularStateMonitor class has been set to: (%d)";
        }
        [(WCM_HPCellularStateMonitor *)self setBHPCellSetBTAFH:v8];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v9, [(WCM_HPCellularStateMonitor *)self bHPCellSetBTAFH]);
        [v7 handleHPCellularStateUpdate:-[WCM_HPCellularStateMonitor bHPCellSetBTAFH](self, "bHPCellSetBTAFH")];
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"HPCellular: In initial state query, Failed to start"];
  }
  return v3;
}

- (BOOL)bHPCellSetBTAFH
{
  return self->_bHPCellSetBTAFH;
}

- (void)setBHPCellSetBTAFH:(BOOL)a3
{
  self->_bHPCellSetBTAFH = a3;
}

- (WCM_HPCellularStateMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)WCM_HPCellularStateMonitor;
  v2 = [(WCM_HPCellularStateMonitor *)&v6 init];
  unsigned int v3 = v2;
  if (v2)
  {
    v2->_bHPCellSetBTAFH = 0;
    id v4 = (CTStewieStateMonitor *)[objc_alloc((Class)CTStewieStateMonitor) initWithDelegate:v2 queue:&_dispatch_main_q];
    v3->fMonitor = v4;
    if (!v4) {
      +[WCM_Logging logLevel:2 message:@"HPCellular: Failed to create HPCellStateMonitor"];
    }
  }
  return v3;
}

- (void)stateChanged:(id)a3
{
  +[WCM_Logging logLevel:4 message:@"HPCellular: stateChanged method is called in delegate callback."];
  if (a3)
  {
    id v5 = [a3 status];
    [a3 reason];
    [a3 allowedServices];
    [a3 transportType];
    +[WCM_Logging logLevel:4, @"HPCellular: stateChanged method, HPCellular state changed to: %@", a3 message];
    id v6 = +[WCM_PolicyManager singleton];
    if (v6)
    {
      v7 = v6;
      +[WCM_Logging logLevel:4 message:@"HPCellular: in stateChanged method, [WCM_PolicyManager singleton] is successful in WCM_HPCellularStateMonitor.m."];
      if (objc_msgSend(objc_msgSend(v7, "activeCoexFeatures"), "containsObject:", @"hpcellularstatemonitorsupport"))
      {
        BOOL v8 = v5 == (id)5;
        if (v5 == (id)5) {
          CFStringRef v9 = @"HPCellular: in stateChanged method, HPCellular Status is active and Bool flag bHPCellSetBTAFH of WCM_HPCellularStateMonitor class has been set to: (%d)";
        }
        else {
          CFStringRef v9 = @"HPCellular: in stateChanged method, HPCellular Status is not active and Bool flag bHPCellSetBTAFH of WCM_HPCellularStateMonitor class has been set to: (%d)";
        }
        [(WCM_HPCellularStateMonitor *)self setBHPCellSetBTAFH:v8];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v9, [(WCM_HPCellularStateMonitor *)self bHPCellSetBTAFH]);
        BOOL v10 = [(WCM_HPCellularStateMonitor *)self bHPCellSetBTAFH];
        [v7 handleHPCellularStateUpdate:v10];
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:4 message:@"HPCellular: in stateChanged method, unexpected CTHPCellState null pointer in delegate callback"];
  }
}

@end