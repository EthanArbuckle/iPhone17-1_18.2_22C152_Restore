@interface TPSNetworkPathMonitor
+ (BOOL)isNetworkError:(id)a3;
+ (TPSNetworkPathMonitor)sharedMonitor;
- (TPSNetworkPathMonitor)init;
- (void)addObserverForKey:(id)a3 using:(id)a4;
- (void)removeObserverForKey:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation TPSNetworkPathMonitor

+ (TPSNetworkPathMonitor)sharedMonitor
{
  if (qword_1EB516AA8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB516BE0;
  return (TPSNetworkPathMonitor *)v2;
}

- (void)addObserverForKey:(id)a3 using:(id)a4
{
  uint64_t v6 = sub_19C9765A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_19C976580();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  NetworkMonitorProxy.addObserver(for:using:)((uint64_t)v9, (uint64_t)sub_19C9472FC, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)stop
{
  v2 = self;
  NetworkMonitorProxy.stop()();
}

- (void)start
{
  v2 = self;
  NetworkMonitorProxy.start()();
}

- (void)removeObserverForKey:(id)a3
{
  uint64_t v4 = sub_19C9765A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C976580();
  uint64_t v8 = self;
  NetworkMonitorProxy.removeObserver(_:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

+ (BOOL)isNetworkError:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, sel_domain);
  uint64_t v5 = sub_19C9768B0();
  uint64_t v7 = v6;

  if (v5 == sub_19C9768B0() && v7 == v8)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v10 = sub_19C976FB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {

      return 0;
    }
  }
  id v12 = objc_msgSend(v3, sel_code);

  return v12 == (id)-1009;
}

- (TPSNetworkPathMonitor)init
{
  result = (TPSNetworkPathMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end