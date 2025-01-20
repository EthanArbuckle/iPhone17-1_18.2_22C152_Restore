@interface EnvironmentMonitorObserver
- (_TtC9MusicCore26EnvironmentMonitorObserver)init;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)environmentMonitorDidChangeThermalLevel:(id)a3;
@end

@implementation EnvironmentMonitorObserver

- (_TtC9MusicCore26EnvironmentMonitorObserver)init
{
  return (_TtC9MusicCore26EnvironmentMonitorObserver *)EnvironmentMonitorObserver.init()();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver_environmentMonitor);
  v5 = self;
  [v4 unregisterObserver:v5];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(EnvironmentMonitorObserver *)&v6 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver__networkType;
  uint64_t v4 = sub_10000BB04(&qword_10066DE38);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver__isNetworkConstrained;
  uint64_t v6 = sub_10000BB04(&qword_10066A3D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver__thermalLevel;
  uint64_t v8 = sub_10000BB04(&qword_10066DE58);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver_environmentMonitor);
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
}

@end