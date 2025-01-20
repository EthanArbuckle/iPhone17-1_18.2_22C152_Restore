@interface WiFiManagerLifeCycle
- (NSMutableArray)signals;
- (WiFiManagerLifeCycle)init;
- (__WiFiManager)manager;
- (id)handleSignal:(int)a3 onQueue:(id)a4;
- (void)dealloc;
- (void)setManager:(__WiFiManager *)a3;
- (void)setSignals:(id)a3;
- (void)startOnQueue:(id)a3;
- (void)stopOnQueue:(id)a3;
@end

@implementation WiFiManagerLifeCycle

- (WiFiManagerLifeCycle)init
{
  v5.receiver = self;
  v5.super_class = (Class)WiFiManagerLifeCycle;
  v2 = [(WiFiManagerLifeCycle *)&v5 init];
  if (!v2 || (uint64_t v3 = objc_opt_new(), (v2->_signals = (NSMutableArray *)v3) == 0))
  {

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  self->_signals = 0;
  v3.receiver = self;
  v3.super_class = (Class)WiFiManagerLifeCycle;
  [(WiFiManagerLifeCycle *)&v3 dealloc];
}

- (void)startOnQueue:(id)a3
{
  if (!a3) {
    goto LABEL_6;
  }
  NSLog(@"----- WiFiManager starting, version: %s -----", a2, "WiFiManager-1800.35 Nov 14 2024 23:00:53");
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:4 message:@"----- WiFiManager starting, version: %s -----" args:("WiFiManager-1800.35 Nov 14 2024 23:00:53")];
  }
  v6 = (__WiFiManager *)sub_10007FA3C((uint64_t)kCFAllocatorDefault, a3);
  self->_manager = v6;
  if (v6)
  {
    [(NSMutableArray *)self->_signals addObject:[(WiFiManagerLifeCycle *)self handleSignal:2 onQueue:a3]];
    [(NSMutableArray *)self->_signals addObject:[(WiFiManagerLifeCycle *)self handleSignal:15 onQueue:a3]];
    [(NSMutableArray *)self->_signals addObject:[(WiFiManagerLifeCycle *)self handleSignal:3 onQueue:a3]];
    sub_1000870EC((uint64_t)self->_manager, 0);
    sub_10008DDB8((uint64_t)self->_manager);
    sub_100087434((uint64_t)self->_manager, (uint64_t)a3);
    notify_post("com.apple.wifivelocity.trigger");
LABEL_6:
    v8 = (void *)qword_10027DD68;
    if (!qword_10027DD68) {
      goto LABEL_11;
    }
    v9 = "WiFiManager started";
    goto LABEL_10;
  }
  v8 = (void *)qword_10027DD68;
  if (!qword_10027DD68) {
    goto LABEL_11;
  }
  v10 = "-[WiFiManagerLifeCycle startOnQueue:]";
  v9 = "%s: Error: WiFiManagerCreate failed";
LABEL_10:
  [v8 WFLog:4 message:v9, v10];
LABEL_11:
}

- (void)stopOnQueue:(id)a3
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "----- WiFiManager stopping, version: %s -----", "WiFiManager-1800.35 Nov 14 2024 23:00:53")];
  }
  sub_1000887D8((uint64_t)self->_manager, a3);
  sub_10008875C((uint64_t)self->_manager, 0);
  [(NSMutableArray *)self->_signals enumerateObjectsUsingBlock:&stru_100241090];
  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0;
  }
  NSLog(@"WiFiManager stopped");
}

- (id)handleSignal:(int)a3 onQueue:(id)a4
{
  signal(a3, (void (__cdecl *)(int))1);
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a3, 0, (dispatch_queue_t)a4);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000C2748;
  handler[3] = &unk_1002410B8;
  int v10 = a3;
  handler[4] = self;
  handler[5] = a4;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate(v7);
  return v7;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (NSMutableArray)signals
{
  return self->_signals;
}

- (void)setSignals:(id)a3
{
}

@end