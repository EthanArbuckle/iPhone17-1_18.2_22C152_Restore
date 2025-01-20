int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  uint64_t v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFNotificationCenter *v27;
  __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;

  v44 = type metadata accessor for Container.Environment();
  sub_1000053F4();
  v4 = v3;
  __chkstk_darwin();
  v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ContainerLock();
  sub_1000053F4();
  v9 = v8;
  __chkstk_darwin();
  v11 = (uint64_t *)((char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  if ((WDWeatherAppIsInstalled() & 1) == 0)
  {
    if (qword_1000624E8 != -1) {
      swift_once();
    }
    v12 = type metadata accessor for Logger();
    sub_100005248(v12, (uint64_t)static Logger.daemon);
    v13 = (void *)Logger.logObject.getter();
    v14 = static os_log_type_t.error.getter();
    if (sub_10000544C(v14))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_100005410((void *)&_mh_execute_header, v15, v16, "Launched while Weather is uninstalled");
      sub_100005430();
    }

    type metadata accessor for Daemon();
    sub_10002E334();
  }
  if ((WDDeviceUnlockedSinceBoot() & 1) == 0)
  {
    if (qword_1000624E8 != -1) {
      swift_once();
    }
    v17 = type metadata accessor for Logger();
    sub_100005248(v17, (uint64_t)static Logger.daemon);
    v18 = (void *)Logger.logObject.getter();
    v19 = static os_log_type_t.error.getter();
    if (sub_10000544C(v19))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_100005410((void *)&_mh_execute_header, v20, v21, "Launched before first unlock");
      sub_100005430();
    }

    type metadata accessor for Daemon();
    sub_10002E528();
  }
  if (_set_user_dir_suffix())
  {
    v22 = NSTemporaryDirectory();
  }
  else
  {
    if (qword_1000624E8 != -1) {
      swift_once();
    }
    v23 = type metadata accessor for Logger();
    sub_100005248(v23, (uint64_t)static Logger.daemon);
    v22 = (NSString *)Logger.logObject.getter();
    v24 = static os_log_type_t.error.getter();
    if (sub_10000544C(v24))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_100005410((void *)&_mh_execute_header, v25, v26, "Failed to set temporary directory suffix");
      sub_100005430();
    }
  }

  v27 = CFNotificationCenterGetDarwinNotifyCenter();
  v28 = (__CFString *)String._bridgeToObjectiveC()();
  CFNotificationCenterAddObserver(v27, 0, (CFNotificationCallback)sub_100005070, v28, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  qword_100064218 = (uint64_t)[objc_allocWithZone((Class)NSRecursiveLock) init];
  sub_100005280(&qword_100062508);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1000506E0;
  v30 = type metadata accessor for Assembly();
  sub_100005484();
  v31 = Assembly.init()();
  *(void *)(v29 + 56) = v30;
  *(void *)(v29 + 64) = sub_1000052C4(&qword_100062510, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v29 + 32) = v31;
  v32 = type metadata accessor for Assembly();
  sub_100005484();
  v33 = Assembly.init()();
  *(void *)(v29 + 96) = v32;
  *(void *)(v29 + 104) = sub_1000052C4(&qword_100062518, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v29 + 72) = v33;
  sub_100005280(&qword_100062520);
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_1000506F0;
  type metadata accessor for AnalyticsAssembly();
  v35 = sub_100005468();
  *(void *)(v34 + 56) = v33;
  *(void *)(v34 + 64) = sub_1000052C4(&qword_100062528, (void (*)(uint64_t))type metadata accessor for AnalyticsAssembly);
  *(void *)(v34 + 32) = v35;
  type metadata accessor for DaemonAssembly();
  v36 = sub_100005468();
  *(void *)(v34 + 96) = v33;
  *(void *)(v34 + 104) = sub_1000052C4(&qword_100062530, (void (*)(uint64_t))type metadata accessor for DaemonAssembly);
  *(void *)(v34 + 72) = v36;
  type metadata accessor for NotificationAssembly();
  v37 = sub_100005468();
  *(void *)(v34 + 136) = v33;
  *(void *)(v34 + 144) = sub_1000052C4(&qword_100062538, (void (*)(uint64_t))type metadata accessor for NotificationAssembly);
  *(void *)(v34 + 112) = v37;
  type metadata accessor for SingletonPool();
  sub_100005484();
  SingletonPool.init()();
  v38 = (void *)qword_100064218;
  *v11 = qword_100064218;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, enum case for ContainerLock.lock(_:), v7);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Container.Environment.normal(_:), v44);
  type metadata accessor for Container();
  sub_100005484();
  v39 = v38;
  qword_100064220 = Container.init(bundleAssemblies:assemblies:singletonPool:environment:containerLock:)();
  Container.resolver.getter();
  v40 = [self currentProcess];
  sub_10000530C(0xD000000000000011, 0x8000000100052A90, v40);

  [self setSuppressEngagement:1];
  sub_100005370(qword_100064228, qword_100064240);
  type metadata accessor for Daemon();
  v41 = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v41) {
    __break(1u);
  }
  qword_100064250 = v41;
  sub_10002E7D4();
  dispatch_main();
}

void sub_100004FA0()
{
  if (qword_1000624E8 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005248(v0, (uint64_t)static Logger.daemon);
  v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Exiting due to language change", v3, 2u);
    swift_slowDealloc();
  }

  exit(0);
}

void sub_100005070(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a1;
  id v8 = a3;
  a5;
  sub_100004FA0();
}

void sub_1000050D4()
{
}

id variable initialization expression of NotificationsManager.listener()
{
  uint64_t v0 = type metadata accessor for MachService();
  sub_1000053F4();
  uint64_t v2 = v1;
  __chkstk_darwin();
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000053B4();
  static MachServices.Notifications.getter();
  MachService.name.getter();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
  return sub_1000051D4();
}

id sub_1000051D4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithMachServiceName:v1];

  return v2;
}

uint64_t sub_100005248(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005280(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000052C4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10000530C(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [a3 setProxyAppBundleID:v4];
}

void *sub_100005370(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000053B4()
{
  unint64_t result = qword_100062540;
  if (!qword_100062540)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100062540);
  }
  return result;
}

void sub_100005410(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_100005430()
{
  return swift_slowDealloc();
}

BOOL sub_10000544C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100005468()
{
  return swift_allocObject();
}

uint64_t sub_100005484()
{
  return swift_allocObject();
}

uint64_t sub_10000549C(uint64_t a1, uint64_t a2)
{
  uint64_t v51 = *v2;
  uint64_t v5 = type metadata accessor for Location();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v43 = v8;
  v44 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v40 - v9;
  uint64_t v11 = type metadata accessor for Logger();
  unint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v49 = a1;
  uint64_t v50 = v5;
  v47 = v15;
  uint64_t v48 = v6 + 16;
  v15(v10, a1, v5);
  swift_bridgeObjectRetain_n();
  v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v45 = v6;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    unint64_t v42 = v12;
    uint64_t v20 = v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v40 = v21;
    *(_DWORD *)uint64_t v20 = 141558531;
    uint64_t v52 = 1752392040;
    uint64_t v53 = v21;
    uint64_t v41 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v20 + 12) = 2081;
    uint64_t v22 = Location.id.getter();
    uint64_t v52 = sub_1000466F4(v22, v23, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v50);
    *(_WORD *)(v20 + 22) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v24 = Array.description.getter();
    unint64_t v26 = v25;
    swift_bridgeObjectRelease();
    uint64_t v52 = sub_1000466F4(v24, v26, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Finding cloud channel for location: %{private,mask.hash}s in assets: %{public}s", (uint8_t *)v20, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v42 + 8))(v14, v41);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v50);

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  unint64_t v42 = sub_100007450();
  v27 = (void *)static OS_dispatch_queue.notifications.getter();
  *(void *)(swift_allocObject() + 16) = a2;
  swift_bridgeObjectRetain();
  sub_100005280(&qword_100062618);
  uint64_t v28 = v46;
  firstly<A, B>(on:disposeOn:closure:)();

  swift_release();
  v29 = (void *)static OS_dispatch_queue.notifications.getter();
  v30 = v44;
  uint64_t v31 = v50;
  v47(v44, v49, v50);
  uint64_t v32 = v45;
  uint64_t v33 = *(unsigned __int8 *)(v45 + 80);
  uint64_t v41 = v33 | 7;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v28;
  uint64_t v45 = *(void *)(v32 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v45)(v34 + ((v33 + 24) & ~v33), v30, v31);
  swift_retain();
  sub_100005280(&qword_100062620);
  sub_100008DE0(&qword_100062628, &qword_100062618);
  Promise<A>.compactMap<A>(on:closure:)();
  swift_release();

  swift_release();
  v35 = (void *)zalgo.getter();
  sub_100005280(&qword_100062630);
  Promise.then<A>(on:closure:)();
  swift_release();

  v36 = (void *)static OS_dispatch_queue.notifications.getter();
  v47(v30, v49, v31);
  uint64_t v37 = swift_allocObject();
  ((void (*)(uint64_t, char *, uint64_t))v45)(v37 + ((v33 + 16) & ~v33), v30, v31);
  sub_100005280(&qword_100062608);
  uint64_t v38 = Promise.then<A, B>(on:disposeOn:closure:)();
  swift_release();

  swift_release();
  return v38;
}

uint64_t sub_100005B08()
{
  return Promise.init(value:)();
}

uint64_t sub_100005B6C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  v17[1] = a2;
  uint64_t v18 = a3;
  uint64_t v19 = a4;
  uint64_t v5 = type metadata accessor for Location();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = *a1;
  uint64_t v9 = a1[1];
  sub_100007450();
  v10 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  *(void *)(v11 + 24) = v9;
  swift_bridgeObjectRetain();
  sub_100005280(&qword_100062680);
  type metadata accessor for CloudChannelMapProvider();
  firstly<A, B>(on:disposeOn:closure:)();

  swift_release();
  unint64_t v12 = (void *)static OS_dispatch_queue.notifications.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v18, v5);
  unint64_t v13 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v14 + v13, (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  sub_100005280(&qword_100062688);
  uint64_t v15 = Promise.then<A>(on:closure:)();
  swift_release();

  uint64_t result = swift_release();
  *uint64_t v19 = v15;
  return result;
}

uint64_t sub_100005D84(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_10002FB64(a2, a3);
}

uint64_t sub_100005DD8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  sub_100005370(a1, a1[3]);
  uint64_t v5 = dispatch thunk of CloudChannelMapType.regions.getter();
  v7[2] = a2;
  uint64_t result = sub_100015ED0((uint64_t)sub_100008C80, (uint64_t)v7, v5);
  *a3 = result;
  return result;
}

uint64_t sub_100005E60(void *a1)
{
  return dispatch thunk of CloudChannelRegionType.contains(_:)() & 1;
}

uint64_t sub_100005EC0()
{
  sub_100005280(&qword_100062620);
  uint64_t v0 = (void *)zalgo.getter();
  sub_100005280(&qword_100062648);
  sub_100008DE0(&qword_100062650, &qword_100062648);
  static Promise.all<A>(on:_:)();

  NSString v1 = (void *)zalgo.getter();
  sub_100005280(&qword_100062630);
  sub_100008DE0(&qword_100062658, &qword_100062660);
  Promise<A>.compactMap<A>(on:closure:)();
  swift_release();

  uint64_t v2 = (void *)zalgo.getter();
  sub_100008DE0(&qword_100062668, &qword_100062670);
  sub_100008DE0(&qword_100062678, &qword_100062630);
  uint64_t v3 = Promise<A>.flatMap<A>(on:closure:)();
  swift_release();

  return v3;
}

uint64_t sub_10000606C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000608C(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = *v2;
  uint64_t v45 = (uint64_t)v2;
  uint64_t v5 = type metadata accessor for Location();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v46 = &v37[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  v10 = &v37[-v9];
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v42 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v13 = &v37[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static Logger.notifications.getter();
  uint64_t v14 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v48 = v6 + 16;
  uint64_t v49 = a1;
  uint64_t v43 = v14;
  v14(v10, a1, v5);
  swift_bridgeObjectRetain_n();
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  int v17 = v16;
  BOOL v18 = os_log_type_enabled(v15, v16);
  uint64_t v47 = a2;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v41 = v7;
    uint64_t v20 = v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v39 = v21;
    *(_DWORD *)uint64_t v20 = 141558531;
    uint64_t v50 = 1752392040;
    uint64_t v51 = v21;
    int v38 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v20 + 12) = 2081;
    uint64_t v40 = v11;
    uint64_t v22 = Location.id.getter();
    uint64_t v50 = sub_1000466F4(v22, v23, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v10, v5);
    *(_WORD *)(v20 + 22) = 2050;
    uint64_t v24 = *(void *)(a2 + 16);
    swift_bridgeObjectRelease();
    uint64_t v50 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, (os_log_type_t)v38, "Locating cloud channel for location: %{private,mask.hash}s in %{public}ld regions", (uint8_t *)v20, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v7 = v41;
    swift_slowDealloc();

    (*(void (**)(unsigned char *, uint64_t))(v42 + 8))(v13, v40);
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v10, v5);

    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v42 + 8))(v13, v11);
  }
  sub_100007450();
  unint64_t v25 = (void *)static OS_dispatch_queue.notifications.getter();
  unint64_t v26 = v46;
  v27 = v43;
  v43(v46, v49, v5);
  uint64_t v28 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v29 = (v28 + 16) & ~v28;
  uint64_t v30 = v29 + v7;
  uint64_t v42 = v28 | 7;
  uint64_t v31 = swift_allocObject();
  uint64_t v32 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v6 + 32);
  v32(v31 + v29, v26, v5);
  uint64_t v45 = firstly<A, B>(on:disposeOn:closure:)();

  swift_release();
  uint64_t v33 = (void *)static OS_dispatch_queue.notifications.getter();
  v27(v26, v49, v5);
  uint64_t v34 = swift_allocObject();
  v32(v34 + v29, v26, v5);
  *(void *)(v34 + ((v30 + 7) & 0xFFFFFFFFFFFFFFF8)) = v47;
  swift_bridgeObjectRetain();
  sub_100005280(&qword_100062608);
  uint64_t v35 = Promise.then<A>(on:closure:)();
  swift_release();

  swift_release();
  return v35;
}

uint64_t sub_1000065B4(uint64_t a1)
{
  return dispatch thunk of LocationMetadataManagerType.resolveCountryCode(for:)();
}

uint64_t sub_100006610(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for Location();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v56 - 8);
  uint64_t v12 = __chkstk_darwin(v56);
  os_log_t v58 = (os_log_t)((char *)v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __chkstk_darwin(v12);
  v55 = ((char *)v50 - v15);
  __chkstk_darwin(v14);
  int v17 = (char *)v50 - v16;
  uint64_t v57 = a1[1];
  if (v57)
  {
    uint64_t v51 = v3;
    uint64_t v18 = a3;
    uint64_t v19 = *(void *)(a3 + 16);
    if (v19)
    {
      uint64_t v54 = *a1;
      uint64_t v20 = v18 + 32;
      v59 = (void (**)(os_log_t, uint64_t))(v11 + 8);
      v50[1] = v18;
      swift_bridgeObjectRetain();
      *(void *)&long long v21 = 141558275;
      long long v53 = v21;
      uint64_t v52 = (char *)&type metadata for Any + 8;
      uint64_t v22 = v56;
      os_log_t v23 = v58;
      while (1)
      {
        sub_100008A6C(v20, (uint64_t)&v65);
        sub_100005370(&v65, v67);
        uint64_t v24 = dispatch thunk of CloudChannelRegionType.channel.getter();
        if (v25)
        {
          uint64_t v26 = v24;
          uint64_t v27 = v25;
          sub_100005370(&v65, v67);
          uint64_t v28 = dispatch thunk of CloudChannelRegionType.country.getter();
          if (v29)
          {
            uint64_t v62 = v28;
            uint64_t v63 = v29;
            uint64_t v60 = v54;
            uint64_t v61 = v57;
            sub_100008B20();
            uint64_t v30 = StringProtocol.caseInsensitiveCompare<A>(_:)();
            swift_bridgeObjectRelease();
            if (!v30)
            {
              swift_bridgeObjectRelease();
              uint64_t v62 = v26;
              uint64_t v63 = v27;
              sub_100005280(&qword_100062610);
              swift_allocObject();
              uint64_t v41 = Promise.init(value:)();
              sub_100008AD0((uint64_t)&v65);
              return v41;
            }
          }
          swift_bridgeObjectRelease();
          static Logger.notifications.getter();
          sub_100008A6C((uint64_t)&v65, (uint64_t)&v62);
          uint64_t v31 = Logger.logObject.getter();
          os_log_type_t v32 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v31, v32))
          {
            uint64_t v33 = swift_slowAlloc();
            uint64_t v68 = swift_slowAlloc();
            *(_DWORD *)uint64_t v33 = v53;
            *(void *)(v33 + 4) = 1752392040;
            *(_WORD *)(v33 + 12) = 2081;
            sub_100005370(&v62, v64);
            os_log_t v23 = v58;
            uint64_t v22 = v56;
            uint64_t v60 = dispatch thunk of CloudChannelRegionType.country.getter();
            uint64_t v61 = v34;
            sub_100005280(&qword_100062638);
            uint64_t v35 = String.init<A>(describing:)();
            *(void *)(v33 + 14) = sub_1000466F4(v35, v36, &v68);
            swift_bridgeObjectRelease();
            sub_100008AD0((uint64_t)&v62);
            _os_log_impl((void *)&_mh_execute_header, v31, v32, "Ignoring channel region due to mismatching country: %{private,mask.hash}s", (uint8_t *)v33, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            sub_100008AD0((uint64_t)&v62);
          }

          (*v59)(v23, v22);
        }
        else
        {
          uint64_t v37 = v55;
          static Logger.notifications.getter();
          int v38 = Logger.logObject.getter();
          os_log_type_t v39 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v38, v39))
          {
            uint64_t v40 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v40 = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, v39, "Channel region is missing channel identifier", v40, 2u);
            os_log_t v23 = v58;
            swift_slowDealloc();
          }

          (*v59)(v37, v22);
        }
        sub_100008AD0((uint64_t)&v65);
        v20 += 40;
        if (!--v19)
        {
          swift_bridgeObjectRelease();
          break;
        }
      }
    }
    v65 = 0;
    uint64_t v66 = 0;
    sub_100005280(&qword_100062610);
    swift_allocObject();
    return Promise.init(value:)();
  }
  else
  {
    static Logger.notifications.getter();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
    uint64_t v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v51 = v3;
      uint64_t v45 = v44;
      v59 = (void (**)(os_log_t, uint64_t))swift_slowAlloc();
      v65 = v59;
      *(_DWORD *)uint64_t v45 = 141558275;
      uint64_t v62 = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v45 + 12) = 2081;
      uint64_t v57 = v45 + 14;
      os_log_t v58 = v42;
      uint64_t v46 = Location.id.getter();
      uint64_t v62 = sub_1000466F4(v46, v47, (uint64_t *)&v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      os_log_t v48 = v58;
      _os_log_impl((void *)&_mh_execute_header, v58, v43, "Failed to resolve country code for location: %{private,mask.hash}s", (uint8_t *)v45, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v56);
    v65 = 0;
    uint64_t v66 = 0;
    sub_100005280(&qword_100062610);
    swift_allocObject();
    return Promise.init(value:)();
  }
}

BOOL sub_100006D20(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_100006D30(uint64_t a1, char a2)
{
}

Swift::Int sub_100006D58(char a1)
{
  return Hasher._finalize()();
}

BOOL sub_100006DA0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100006D20(*a1, *a2);
}

Swift::Int sub_100006DAC()
{
  return sub_100006D58(*v0);
}

void sub_100006DB4(uint64_t a1)
{
  sub_100006D30(a1, *v1);
}

Swift::Int sub_100006DBC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_100006E10()
{
  swift_release();
  sub_100008AD0(v0 + 24);
  sub_100008AD0(v0 + 64);
  return v0;
}

uint64_t sub_100006E40()
{
  sub_100006E10();
  return _swift_deallocClassInstance(v0, 104, 7);
}

uint64_t type metadata accessor for CloudChannelMapProvider()
{
  return self;
}

uint64_t sub_100006E98(uint64_t a1)
{
  uint64_t v57 = *v1;
  os_log_t v58 = v1;
  uint64_t v3 = type metadata accessor for Location();
  sub_1000053F4();
  uint64_t v5 = v4;
  uint64_t v7 = __chkstk_darwin(v6);
  long long v53 = (char *)v48 - ((unint64_t)(v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)v48 - v9;
  uint64_t v11 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  int v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v59 = a1;
  uint64_t v56 = v5 + 16;
  uint64_t v52 = v17;
  v17(v10, a1, v3);
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v50 = v21;
    *(_DWORD *)uint64_t v20 = 141558275;
    uint64_t v60 = 1752392040;
    uint64_t v61 = v21;
    uint64_t v55 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v20 + 12) = 2081;
    uint64_t v51 = (char *)v11;
    uint64_t v22 = Location.id.getter();
    uint64_t v60 = sub_1000466F4(v22, v23, &v61);
    uint64_t v3 = v55;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_100009100();
    v25(v24);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Requested cloud channel for location: %{private,mask.hash}s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, char *))(v13 + 8))(v16, v51);
  }
  else
  {
    uint64_t v26 = sub_100009100();
    v27(v26);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v11);
  }
  unint64_t v49 = sub_100007450();
  uint64_t v28 = (void *)static OS_dispatch_queue.notifications.getter();
  type metadata accessor for NotificationConfiguration();
  firstly<A, B>(on:disposeOn:closure:)();

  uint64_t v29 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_100005280(&qword_1000625F8);
  Promise.then<A, B>(on:disposeOn:closure:)();
  swift_release();

  uint64_t v30 = v52;
  uint64_t v31 = v53;
  uint64_t v32 = v59;
  v52(v53, v59, v3);
  uint64_t v33 = v30;
  uint64_t v34 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v35 = (v34 + 16) & ~v34;
  uint64_t v55 = v35;
  uint64_t v50 = v34 | 7;
  uint64_t v51 = &v54[v35];
  uint64_t v36 = swift_allocObject();
  uint64_t v54 = *(char **)(v5 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v54)(v36 + v35, v31, v3);
  v48[1] = v5 + 32;
  uint64_t v37 = (void *)zalgo.getter();
  sub_100008DE0(&qword_100062600, &qword_1000625F8);
  v48[2] = Promise<A>.compactMap<A>(on:closure:)();
  swift_release();
  swift_release();

  int v38 = (void *)static OS_dispatch_queue.notifications.getter();
  v33(v31, v32, v3);
  uint64_t v39 = swift_allocObject();
  uint64_t v40 = sub_10000911C(v39);
  v41(v40);
  unint64_t v49 = sub_100005280(&qword_100062608);
  Promise.then<A, B>(on:disposeOn:closure:)();
  swift_release();

  swift_release();
  v33(v31, v59, v3);
  uint64_t v42 = swift_allocObject();
  uint64_t v43 = sub_10000911C(v42);
  v44(v43);
  uint64_t v45 = (void *)zalgo.getter();
  uint64_t v46 = Promise.then<A>(on:closure:)();
  swift_release();
  swift_release();

  return v46;
}

unint64_t sub_100007450()
{
  unint64_t result = qword_100063FE0;
  if (!qword_100063FE0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100063FE0);
  }
  return result;
}

uint64_t sub_100007490()
{
  return NotificationConfigurationManager.fetchNotificationConfiguration()();
}

NSObject *sub_1000074BC()
{
  uint64_t v0 = sub_100005280(&qword_100062698);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v43 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_100005280(&qword_1000626A0);
  uint64_t v46 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v45 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for String.Encoding();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v49 = *(void *)(v8 - 8);
  uint64_t v50 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v44 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v43 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v43 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v43 - v17;
  NotificationConfiguration.cloudChannelsConfiguration.getter();
  if (!v19)
  {
    static Logger.notifications.getter();
    unint64_t v23 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v26, "App configuration is missing cloud channels configuration", v27, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v49 + 8))(v18, v50);
    goto LABEL_9;
  }
  static String.Encoding.utf8.getter();
  uint64_t v20 = String.data(using:allowLossyConversion:)();
  unint64_t v22 = v21;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v22 >> 60 == 15)
  {
    static Logger.notifications.getter();
    unint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Failed to encode the cloud channels configuration to JSON", v25, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v49 + 8))(v16, v50);
LABEL_9:
    sub_100008CA0();
    swift_allocError();
    *uint64_t v28 = 0;
    swift_willThrow();
    return v23;
  }
  type metadata accessor for JSONDecoder();
  swift_allocObject();
  JSONDecoder.init()();
  sub_100008DE0(&qword_1000626B0, &qword_1000626A0);
  uint64_t v29 = v47;
  uint64_t v30 = v48;
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  if (v29)
  {
    swift_errorRelease();
    swift_release();
    sub_100008CEC((uint64_t)v2, 1, 1, v30);
    sub_100008D14((uint64_t)v2);
    static Logger.notifications.getter();
    unint64_t v23 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v31, "Failed to decode the cloud channels configuration to GeoJSON", v32, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v49 + 8))(v13, v50);
    sub_100008CA0();
    swift_allocError();
    *uint64_t v33 = 0;
    swift_willThrow();
    sub_100008D74(v20, v22);
  }
  else
  {
    swift_release();
    sub_100008CEC((uint64_t)v2, 0, 1, v30);
    uint64_t v36 = v45;
    uint64_t v35 = v46;
    (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v45, v2, v30);
    uint64_t v37 = GeoJSON<>.assets.getter();
    if (v37)
    {
      int v38 = sub_100007BE4(v37);
      swift_bridgeObjectRelease();
      uint64_t v51 = v38;
      sub_100005280(&qword_1000626B8);
      swift_allocObject();
      unint64_t v23 = Promise.init(value:)();
      sub_100008D74(v20, v22);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v30);
    }
    else
    {
      uint64_t v39 = v44;
      static Logger.notifications.getter();
      unint64_t v23 = Logger.logObject.getter();
      os_log_type_t v40 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v40))
      {
        uint64_t v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v41 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v40, "Cloud channels configuration did not provide any assets", v41, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v49 + 8))(v39, v50);
      sub_100008CA0();
      swift_allocError();
      *uint64_t v42 = 0;
      swift_willThrow();
      sub_100008D74(v20, v22);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v30);
    }
  }
  return v23;
}

void *sub_100007BE4(uint64_t a1)
{
  uint64_t v2 = sub_100005280(&qword_1000626C0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = _swiftEmptyArrayStorage;
  if (v6)
  {
    unint64_t v21 = _swiftEmptyArrayStorage;
    sub_100011F48(0, v6, 0);
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v8 = v3 + 16;
    uint64_t v9 = v10;
    uint64_t v7 = v21;
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64));
    uint64_t v17 = *(void *)(v8 + 56);
    do
    {
      v9(v5, v11, v2);
      unint64_t v21 = v7;
      unint64_t v13 = v7[2];
      unint64_t v12 = v7[3];
      if (v13 >= v12 >> 1)
      {
        sub_100011F48((void *)(v12 > 1), v13 + 1, 1);
        uint64_t v7 = v21;
      }
      uint64_t v19 = v2;
      uint64_t v20 = sub_100008DE0(&qword_1000626C8, &qword_1000626C0);
      uint64_t v14 = sub_100008E24((uint64_t *)&v18);
      v9((char *)v14, (uint64_t)v5, v2);
      v7[2] = v13 + 1;
      sub_100008E88(&v18, (uint64_t)&v7[5 * v13 + 4]);
      (*(void (**)(char *, uint64_t))(v8 - 8))(v5, v2);
      v11 += v17;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_100007DD4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v27 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v27 - 8);
  uint64_t v5 = __chkstk_darwin(v27);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v26 - v8;
  sub_100005370(a1, a1[3]);
  uint64_t v10 = dispatch thunk of CloudChannelMapAssetType.identifier.getter();
  if (v11)
  {
    uint64_t v12 = v10;
    uint64_t v13 = v11;
    uint64_t v26 = v2;
    sub_100005370(a1, a1[3]);
    if (dispatch thunk of CloudChannelMapAssetType.boundingBox.getter())
    {
      Location.coordinate.getter();
      char v14 = Array<A>.contains(_:)();
      uint64_t result = swift_bridgeObjectRelease();
      if (v14)
      {
        uint64_t v16 = v28;
        *uint64_t v28 = v12;
        v16[1] = v13;
      }
      else
      {
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v25 = v28;
        *uint64_t v28 = 0;
        v25[1] = 0;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      static Logger.notifications.getter();
      unint64_t v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v21, v22))
      {
        unint64_t v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "CloudChannelMapAsset is missing bounding box", v23, 2u);
        swift_slowDealloc();
      }

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v27);
      os_log_type_t v24 = v28;
      *uint64_t v28 = 0;
      v24[1] = 0;
    }
  }
  else
  {
    static Logger.notifications.getter();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Unusable CloudChannelMapAsset due to invalid identifier", v19, 2u);
      swift_slowDealloc();
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v27);
    uint64_t v20 = v28;
    *uint64_t v28 = 0;
    v20[1] = 0;
  }
  return result;
}

uint64_t sub_1000080AC()
{
  uint64_t v0 = sub_1000090B8();
  sub_1000090A4(v0);
  uint64_t v1 = (void *)sub_1000090D8();
  return sub_100007DD4(v1, v2);
}

uint64_t sub_1000080E4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008130(void *a1, uint64_t a2)
{
  return sub_1000088A0(a1, a2, (uint64_t (*)(unint64_t, void))sub_10000549C);
}

uint64_t sub_10000815C(uint64_t *a1, uint64_t a2)
{
  uint64_t v45 = type metadata accessor for Location();
  uint64_t v5 = *(void *)(v45 - 8);
  uint64_t v6 = __chkstk_darwin(v45);
  uint64_t v8 = &v38[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  uint64_t v10 = &v38[-v9];
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = __chkstk_darwin(v11);
  char v14 = &v38[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v12);
  uint64_t v16 = &v38[-v15];
  uint64_t v17 = *a1;
  unint64_t v18 = a1[1];
  uint64_t v43 = v19;
  uint64_t v44 = v17;
  if (!v18)
  {
    static Logger.notifications.getter();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v10, a2, v45);
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.default.getter();
    int v31 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v42 = v2;
      uint64_t v33 = v32;
      uint64_t v40 = swift_slowAlloc();
      v46[0] = v40;
      *(_DWORD *)uint64_t v33 = 141558275;
      uint64_t v47 = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v33 + 12) = 2081;
      uint64_t v41 = v11;
      int v39 = v31;
      uint64_t v34 = Location.id.getter();
      uint64_t v47 = sub_1000466F4(v34, v35, v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v10, v45);
      _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v39, "Failed to find channel for location: %{private,mask.hash}s", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v27 = *(void (**)(unsigned char *, uint64_t))(v43 + 8);
      uint64_t v28 = v16;
      goto LABEL_6;
    }
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v10, v45);

    uint64_t v27 = *(void (**)(unsigned char *, uint64_t))(v43 + 8);
    uint64_t v28 = v16;
LABEL_9:
    uint64_t v36 = v11;
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  static Logger.notifications.getter();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v8, a2, v45);
  swift_bridgeObjectRetain();
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  int v22 = v21;
  if (!os_log_type_enabled(v20, v21))
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v45);

    uint64_t v27 = *(void (**)(unsigned char *, uint64_t))(v43 + 8);
    uint64_t v28 = v14;
    goto LABEL_9;
  }
  uint64_t v23 = swift_slowAlloc();
  int v39 = v22;
  uint64_t v24 = v23;
  uint64_t v40 = swift_slowAlloc();
  v46[0] = v40;
  *(_DWORD *)uint64_t v24 = 136446723;
  swift_bridgeObjectRetain();
  uint64_t v47 = sub_1000466F4(v44, v18, v46);
  uint64_t v42 = v2;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  *(_WORD *)(v24 + 12) = 2160;
  uint64_t v47 = 1752392040;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v24 + 22) = 2081;
  uint64_t v41 = v11;
  uint64_t v25 = Location.id.getter();
  uint64_t v47 = sub_1000466F4(v25, v26, v46);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v45);
  _os_log_impl((void *)&_mh_execute_header, v20, (os_log_type_t)v39, "Found channel %{public}s for location %{private,mask.hash}s", (uint8_t *)v24, 0x20u);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  uint64_t v27 = *(void (**)(unsigned char *, uint64_t))(v43 + 8);
  uint64_t v28 = v14;
LABEL_6:
  uint64_t v36 = v41;
LABEL_10:
  v27(v28, v36);
  v46[0] = v44;
  v46[1] = v18;
  sub_100005280(&qword_100062610);
  swift_allocObject();
  swift_bridgeObjectRetain();
  return Promise.init(value:)();
}

uint64_t sub_1000086F0()
{
  uint64_t v0 = sub_100009134();
  sub_1000090A4(v0);
  uint64_t v1 = (uint64_t *)sub_1000090F4();
  return sub_10000815C(v1, v2);
}

uint64_t sub_10000872C()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008764()
{
  return sub_100005B08();
}

uint64_t sub_100008780()
{
  uint64_t v1 = type metadata accessor for Location();
  sub_1000053F4();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 24) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return _swift_deallocObject(v0, v8, v9);
}

uint64_t sub_100008824()
{
  uint64_t v0 = sub_1000090B8();
  sub_1000090A4(v0);
  uint64_t v1 = (uint64_t *)sub_1000090F4();
  return sub_100005B6C(v1, v2, v3, v4);
}

uint64_t sub_100008874(void *a1, uint64_t a2)
{
  return sub_1000088A0(a1, a2, (uint64_t (*)(unint64_t, void))sub_10000608C);
}

uint64_t sub_1000088A0(void *a1, uint64_t a2, uint64_t (*a3)(unint64_t, void))
{
  uint64_t v6 = type metadata accessor for Location();
  sub_1000090A4(v6);
  return a3(v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), *a1);
}

uint64_t sub_100008910()
{
  uint64_t v0 = sub_100009134();
  sub_1000090A4(v0);
  uint64_t v1 = sub_1000090F4();
  return sub_1000065B4(v1);
}

uint64_t sub_10000894C()
{
  type metadata accessor for Location();
  sub_100009150();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_1000089E4()
{
  sub_100009134();
  uint64_t v0 = (uint64_t *)sub_1000090F4();
  return sub_100006610(v0, v1, v2);
}

uint64_t sub_100008A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008AD0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100008B20()
{
  unint64_t result = qword_100062640;
  if (!qword_100062640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062640);
  }
  return result;
}

uint64_t sub_100008B6C()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008BA4(uint64_t a1)
{
  return sub_100005D84(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100008BC4()
{
  type metadata accessor for Location();
  sub_100009150();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100008C48()
{
  uint64_t v0 = sub_1000090B8();
  sub_1000090A4(v0);
  uint64_t v1 = (void *)sub_1000090D8();
  return sub_100005DD8(v1, v2, v3);
}

uint64_t sub_100008C80(void *a1)
{
  return sub_100005E60(a1) & 1;
}

unint64_t sub_100008CA0()
{
  unint64_t result = qword_1000626A8;
  if (!qword_1000626A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000626A8);
  }
  return result;
}

uint64_t sub_100008CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100008D14(uint64_t a1)
{
  uint64_t v2 = sub_100005280(&qword_100062698);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008D74(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100008D88(a1, a2);
  }
  return a1;
}

uint64_t sub_100008D88(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_100008DE0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000080E4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_100008E24(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100008E88(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for CloudChannelMapProvider.Errors(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CloudChannelMapProvider.Errors(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 1) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for CloudChannelMapProvider.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100009004);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_10000902C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100009038(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CloudChannelMapProvider.Errors()
{
  return &type metadata for CloudChannelMapProvider.Errors;
}

unint64_t sub_100009058()
{
  unint64_t result = qword_1000626D0;
  if (!qword_1000626D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000626D0);
  }
  return result;
}

uint64_t sub_1000090A4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_1000090B8()
{
  return type metadata accessor for Location();
}

uint64_t sub_1000090D8()
{
  return v0;
}

uint64_t sub_1000090F4()
{
  return v0;
}

uint64_t sub_100009100()
{
  return v0;
}

uint64_t sub_10000911C(uint64_t a1)
{
  return a1 + *(void *)(v1 - 136);
}

uint64_t sub_100009134()
{
  return type metadata accessor for Location();
}

void sub_100009164(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005280(&qword_1000626D8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[1] = [a1 identifier];
  *a2 = dispatch thunk of CustomStringConvertible.description.getter();
  a2[1] = v11;
  id v12 = [a1 timestamp];
  if (!v12)
  {
    sub_100008CEC((uint64_t)v10, 1, 1, v4);
    goto LABEL_9;
  }
  uint64_t v13 = v12;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  char v14 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v14(v10, v7, v4);
  sub_100008CEC((uint64_t)v10, 0, 1, v4);
  if (sub_1000093BC((uint64_t)v10, 1, v4) == 1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v15 = (int *)type metadata accessor for APSMessage();
  v14((char *)a2 + v15[5], v10, v4);
  id v16 = a1;
  uint64_t v17 = sub_10000942C(v16);
  if (!v17)
  {
LABEL_10:
    __break(1u);
    return;
  }
  *(uint64_t *)((char *)a2 + v15[6]) = v17;
  id v18 = [v16 channelID];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = v21;

    uint64_t v23 = (uint64_t *)((char *)a2 + v15[7]);
    *uint64_t v23 = v20;
    v23[1] = v22;
  }
  else
  {

    uint64_t v24 = (uint64_t *)((char *)a2 + v15[7]);
    *uint64_t v24 = 0;
    v24[1] = 0;
  }
}

uint64_t sub_1000093BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t type metadata accessor for APSMessage()
{
  uint64_t result = qword_100062738;
  if (!qword_100062738) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000942C(void *a1)
{
  id v2 = [a1 userInfo];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t *sub_1000094A4(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Date();
    id v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    char v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1000095C4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_100009660(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  uint64_t v13 = (void *)((char *)a1 + v12);
  char v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_100009730(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_10000981C(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  return a1;
}

void *sub_1000098BC(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100009980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009994);
}

uint64_t sub_100009994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return sub_1000093BC(v9, a2, v8);
  }
}

uint64_t sub_100009A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009A30);
}

uint64_t sub_100009A30(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Date();
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return sub_100008CEC(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_100009AB0()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100009B60()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for JSONEncoder.DateEncodingStrategy();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + 192))
  {
    uint64_t v6 = *(void *)(v0 + 192);
  }
  else
  {
    type metadata accessor for JSONEncoder();
    swift_allocObject();
    uint64_t v6 = JSONEncoder.init()();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for JSONEncoder.DateEncodingStrategy.secondsSince1970(_:), v2);
    dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
    *(void *)(v1 + 192) = v6;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v6;
}

uint64_t sub_100009C88()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for JSONDecoder.DateDecodingStrategy();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + 200))
  {
    uint64_t v6 = *(void *)(v0 + 200);
  }
  else
  {
    type metadata accessor for JSONDecoder();
    swift_allocObject();
    uint64_t v6 = JSONDecoder.init()();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for JSONDecoder.DateDecodingStrategy.secondsSince1970(_:), v2);
    dispatch thunk of JSONDecoder.dateDecodingStrategy.setter();
    *(void *)(v1 + 200) = v6;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v6;
}

void *sub_100009DB0(uint64_t a1, long long *a2, uint64_t a3, long long *a4, long long *a5, long long *a6)
{
  v6[24] = 0;
  v6[25] = 0;
  v6[2] = a1;
  sub_100008E88(a2, (uint64_t)(v6 + 3));
  v6[8] = a3;
  sub_100008E88(a4, (uint64_t)(v6 + 9));
  sub_100008E88(a5, (uint64_t)(v6 + 14));
  sub_100008E88(a6, (uint64_t)(v6 + 19));
  return v6;
}

uint64_t sub_100009E30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v51 = a2;
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  uint64_t v5 = *(void *)(HourForecast - 8);
  __chkstk_darwin(HourForecast);
  uint64_t v50 = v6;
  long long v53 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for NotificationSubscription();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v47 = v10;
  uint64_t v48 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v39 - v11;
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v43 = *(void *)(v13 - 8);
  uint64_t v44 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v46 = v8 + 16;
  v45(v12, a1, v7);
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v49 = v8;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v42 = v2;
    uint64_t v20 = v19;
    uint64_t v21 = swift_slowAlloc();
    v39[1] = v21;
    *(_DWORD *)uint64_t v20 = 141558275;
    uint64_t v54 = 1752392040;
    uint64_t v55 = v21;
    uint64_t v40 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v20 + 12) = 2081;
    uint64_t v41 = v5;
    uint64_t v22 = NotificationSubscription.identifier.getter();
    uint64_t v54 = sub_1000466F4(v22, v23, &v55);
    a1 = v40;
    uint64_t v5 = v41;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Validating accuracy for subscription: %{private,mask.hash}s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v3 = v42;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  }

  uint64_t v24 = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v15, v44);
  __chkstk_darwin(v24);
  uint64_t v25 = v3;
  v39[-2] = v3;
  v39[-1] = a1;
  type metadata accessor for PrecipitationNotificationConfiguration();
  uint64_t v44 = firstly<A>(closure:)();
  sub_100007450();
  uint64_t v43 = static OS_dispatch_queue.notifications.getter();
  unint64_t v26 = v48;
  v45(v48, a1, v7);
  uint64_t v27 = v5;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v30 = HourForecast;
  uint64_t v29 = v53;
  v28(v53, v51, HourForecast);
  uint64_t v31 = v49;
  unint64_t v32 = (*(unsigned __int8 *)(v49 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  uint64_t v33 = v7;
  unint64_t v34 = (v47 + *(unsigned __int8 *)(v27 + 80) + v32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v31 + 32))(v35 + v32, v26, v33);
  (*(void (**)(unint64_t, char *, uint64_t))(v27 + 32))(v35 + v34, v29, v30);
  swift_retain();
  uint64_t v36 = (void *)v43;
  uint64_t v37 = Promise.then<A>(on:closure:)();
  swift_release();

  swift_release();
  return v37;
}

uint64_t sub_10000A360(uint64_t a1)
{
  return dispatch thunk of PreciptationNotificationConfigurationProviderType.configuration(for:)();
}

uint64_t sub_10000A3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v154 = a4;
  uint64_t v165 = a3;
  uint64_t v155 = a1;
  uint64_t v141 = type metadata accessor for PrecipitationNotificationType();
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  v139 = (char *)&v127 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = type metadata accessor for NotificationSubscription();
  uint64_t v137 = *(void *)(v138 - 8);
  uint64_t v8 = __chkstk_darwin(v138);
  v134 = (char *)&v127 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v133 = (char *)&v127 - v10;
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v167 = v11;
  uint64_t v168 = v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v170 = (uint64_t)&v127 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  v136 = (char *)&v127 - v16;
  __chkstk_darwin(v15);
  v135 = (char *)&v127 - v17;
  uint64_t v144 = type metadata accessor for PrecipitationType();
  uint64_t v143 = *(void *)(v144 - 8);
  __chkstk_darwin(v144);
  v142 = (char *)&v127 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100005280(&qword_100062870);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v145 = (uint64_t)&v127 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v152 = (uint64_t)&v127 - v22;
  uint64_t v23 = type metadata accessor for ForecastSummary();
  uint64_t v156 = *(void *)(v23 - 8);
  uint64_t v157 = v23;
  uint64_t v24 = __chkstk_darwin(v23);
  v147 = (char *)&v127 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v146 = (char *)&v127 - v26;
  uint64_t v149 = type metadata accessor for Date();
  __chkstk_darwin(v149);
  v150 = (char *)&v127 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100005280(&qword_1000626D8);
  __chkstk_darwin(v28 - 8);
  v148 = (char *)&v127 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = type metadata accessor for PrecipitationForecastSummaries();
  uint64_t v30 = __chkstk_darwin(v151);
  uint64_t v158 = (uint64_t)&v127 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v159 = (uint64_t)&v127 - v32;
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  uint64_t v153 = *(void *)(HourForecast - 8);
  __chkstk_darwin(HourForecast);
  v161 = (char *)&v127 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100005280(&qword_100062878);
  __chkstk_darwin(v34 - 8);
  uint64_t v36 = (uint64_t *)((char *)&v127 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v37 = type metadata accessor for Expression();
  os_log_t v164 = *(os_log_t *)(v37 - 8);
  __chkstk_darwin(v37);
  v163 = (char *)&v127 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100005280(&qword_100062880);
  __chkstk_darwin(v39 - 8);
  v162 = (char *)&v127 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ResultEntity = type metadata accessor for FetchResultEntity();
  uint64_t v42 = *(void *)(ResultEntity - 8);
  __chkstk_darwin(ResultEntity);
  uint64_t v44 = (char *)&v127 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = *(void *)(a2 + 16);
  ReferenceCountedLazy.increase()();
  uint64_t v169 = v171;
  NotificationStore.fetchResults.getter();
  if (v4)
  {
    uint64_t v52 = v170;
    goto LABEL_4;
  }
  uint64_t v132 = v37;
  v131 = v44;
  uint64_t v130 = ResultEntity;
  uint64_t v129 = v42;
  uint64_t v128 = a2;
  uint64_t v166 = v45;
  dispatch thunk of Table.query.getter();
  swift_release();
  uint64_t v46 = NotificationSubscription.identifier.getter();
  v173 = &type metadata for String;
  v174 = &protocol witness table for String;
  uint64_t v171 = v46;
  unint64_t v172 = v47;
  uint64_t v48 = v163;
  == infix(_:_:)();
  sub_100008AD0((uint64_t)&v171);
  void *v36 = 0x64657461657263;
  v36[1] = 0xE700000000000000;
  uint64_t v49 = enum case for OrderBy.descending(_:);
  uint64_t v50 = type metadata accessor for OrderBy();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v50 - 8) + 104))(v36, v49, v50);
  sub_100008CEC((uint64_t)v36, 0, 1, v50);
  uint64_t v51 = (uint64_t)v162;
  dispatch thunk of Query.first(_:orderBy:)();
  uint64_t v127 = 0;
  swift_release();
  sub_10000F94C((uint64_t)v36, &qword_100062878);
  ((void (*)(char *, uint64_t))v164[1].isa)(v48, v132);
  uint64_t v61 = v130;
  if (sub_1000093BC(v51, 1, v130) == 1)
  {
    sub_10000F94C(v51, &qword_100062880);
    sub_100005280(&qword_100062850);
    swift_allocObject();
    uint64_t v59 = Promise.init(value:)();
    goto LABEL_8;
  }
  uint64_t v62 = v129;
  (*(void (**)(char *, uint64_t, uint64_t))(v129 + 32))(v131, v51, v61);
  sub_100009C88();
  FetchResultEntity.forecast.getter();
  dispatch thunk of Column.value.getter();
  uint64_t result = swift_release();
  unint64_t v63 = v172;
  uint64_t v64 = v127;
  if (v172 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    uint64_t v65 = v171;
    sub_10000F904(&qword_100062888, (void (*)(uint64_t))&type metadata accessor for NextHourForecast);
    uint64_t v66 = HourForecast;
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    if (v64)
    {
      (*(void (**)(char *, uint64_t))(v62 + 8))(v131, v61);
      sub_100008D74(v65, v63);
      swift_release();
      uint64_t v5 = v64;
      uint64_t v52 = v170;
      uint64_t v45 = v166;
LABEL_4:
      static Logger.notifications.getter();
      swift_errorRetain();
      swift_errorRetain();
      long long v53 = Logger.logObject.getter();
      os_log_type_t v54 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v53, v54))
      {
        uint64_t v55 = swift_slowAlloc();
        uint64_t v166 = v45;
        uint64_t v56 = (uint8_t *)v55;
        uint64_t v171 = swift_slowAlloc();
        *(_DWORD *)uint64_t v56 = 136446210;
        uint64_t v175 = v5;
        swift_errorRetain();
        sub_100005280(&qword_100062868);
        uint64_t v57 = String.init<A>(describing:)();
        uint64_t v175 = sub_1000466F4(v57, v58, &v171);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "An error occurred while validating accuracy: %{public}s", v56, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
        (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v170, v167);
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();

        (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v52, v167);
      }
      goto LABEL_7;
    }
    swift_release();
    sub_100008D74(v65, v63);
    FetchResultEntity.created.getter();
    uint64_t v67 = (uint64_t)v148;
    dispatch thunk of Column.value.getter();
    swift_release();
    uint64_t result = sub_1000093BC(v67, 1, v149);
    if (result != 1)
    {
      uint64_t Hour = NextHourForecast.summary.getter();
      uint64_t v69 = v159;
      sub_1000417C0(v67, Hour, v159);
      uint64_t v70 = (uint64_t)v150;
      PrecipitationNotificationConfiguration.now.getter();
      uint64_t v71 = NextHourForecast.summary.getter();
      uint64_t v72 = v158;
      sub_1000417C0(v70, v71, v158);
      uint64_t v73 = v151;
      uint64_t v74 = v69 + *(int *)(v151 + 20);
      uint64_t v75 = v152;
      sub_10000F36C(v74, v152);
      uint64_t v76 = v157;
      int v77 = sub_1000093BC(v75, 1, v157);
      uint64_t v78 = v153;
      uint64_t v79 = v156;
      if (v77 == 1)
      {
        uint64_t v80 = v75;
        v81 = v131;
LABEL_19:
        sub_10000F94C(v80, &qword_100062870);
        sub_100005280(&qword_100062850);
        swift_allocObject();
        uint64_t v59 = Promise.init(value:)();
        sub_10000F3D4(v158);
        sub_10000F3D4(v159);
        (*(void (**)(char *, uint64_t))(v78 + 8))(v161, v66);
        (*(void (**)(char *, uint64_t))(v62 + 8))(v81, v130);
        goto LABEL_8;
      }
      v82 = *(void (**)(char *, uint64_t, uint64_t))(v156 + 32);
      v83 = v146;
      v82(v146, v75, v76);
      uint64_t v84 = v72 + *(int *)(v73 + 20);
      uint64_t v80 = v145;
      sub_10000F36C(v84, v145);
      if (sub_1000093BC(v80, 1, v76) == 1)
      {
        (*(void (**)(char *, uint64_t))(v79 + 8))(v83, v76);
        uint64_t v62 = v129;
        v81 = v131;
        uint64_t v66 = HourForecast;
        goto LABEL_19;
      }
      v82(v147, v80, v76);
      FetchResultEntity.notification.getter();
      dispatch thunk of Column.value.getter();
      swift_release();
      v163 = (char *)v172;
      sub_10000F430(v171, v172);
      v85 = v142;
      ForecastSummary.condition.getter();
      LODWORD(v170) = PrecipitationType.isClear.getter();
      v86 = *(void (**)(char *, uint64_t))(v143 + 8);
      uint64_t v87 = v144;
      v86(v85, v144);
      ForecastSummary.condition.getter();
      LODWORD(v164) = PrecipitationType.isClear.getter();
      v86(v85, v87);
      int v88 = ForecastSummary.meetsNotificationThresholds(with:)();
      int v89 = ForecastSummary.meetsNotificationThresholds(with:)();
      if (v170)
      {
        uint64_t v90 = v165;
        uint64_t v91 = HourForecast;
        if ((v89 & ~v164 & 1) != 0 && v163 == (char *)1)
        {
          v92 = v135;
          static Logger.notifications.getter();
          uint64_t v93 = v137;
          v94 = v133;
          uint64_t v95 = v138;
          (*(void (**)(char *, uint64_t, uint64_t))(v137 + 16))(v133, v90, v138);
          v96 = Logger.logObject.getter();
          os_log_type_t v97 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v96, v97))
          {
            uint64_t v98 = swift_slowAlloc();
            uint64_t v170 = swift_slowAlloc();
            uint64_t v171 = v170;
            *(_DWORD *)uint64_t v98 = 141558275;
            uint64_t v175 = 1752392040;
            os_log_t v164 = v96;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *(_WORD *)(v98 + 12) = 2081;
            uint64_t v99 = NotificationSubscription.identifier.getter();
            uint64_t v175 = sub_1000466F4(v99, v100, &v171);
            uint64_t v91 = HourForecast;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v93 + 8))(v94, v95);
            os_log_t v101 = v164;
            _os_log_impl((void *)&_mh_execute_header, v164, v97, "Detected missing starting notification for subscription: %{private,mask.hash}s", (uint8_t *)v98, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(char *, uint64_t))(v168 + 8))(v135, v167);
          }
          else
          {
            (*(void (**)(char *, uint64_t))(v93 + 8))(v94, v95);

            (*(void (**)(char *, uint64_t))(v168 + 8))(v92, v167);
          }
          uint64_t v115 = v140;
          v116 = v139;
          v117 = v161;
          uint64_t v118 = v141;
          uint64_t v119 = (*(uint64_t (**)(char *, void, uint64_t))(v140 + 104))(v139, enum case for PrecipitationNotificationType.starting(_:), v141);
          __chkstk_darwin(v119);
          uint64_t v120 = v165;
          *(&v127 - 6) = v128;
          *(&v127 - 5) = v120;
          uint64_t v121 = v154;
          *(&v127 - 4) = (uint64_t)v117;
          *(&v127 - 3) = v121;
          *(&v127 - 2) = (uint64_t)v116;
          sub_100005280(&qword_100062850);
          swift_allocObject();
LABEL_34:
          uint64_t v59 = Promise.init(resolver:)();
          (*(void (**)(char *, uint64_t))(v115 + 8))(v116, v118);
          uint64_t v125 = v157;
          v126 = *(void (**)(char *, uint64_t))(v156 + 8);
          v126(v147, v157);
          v126(v146, v125);
          sub_10000F3D4(v158);
          sub_10000F3D4(v159);
          (*(void (**)(char *, uint64_t))(v153 + 8))(v117, v91);
          (*(void (**)(char *, uint64_t))(v129 + 8))(v131, v130);
          goto LABEL_8;
        }
      }
      else
      {
        uint64_t v102 = v165;
        uint64_t v91 = HourForecast;
        if ((v88 & v164 & 1) != 0 && v163 == (char *)1)
        {
          v103 = v136;
          static Logger.notifications.getter();
          uint64_t v104 = v137;
          v105 = v134;
          uint64_t v106 = v138;
          (*(void (**)(char *, uint64_t, uint64_t))(v137 + 16))(v134, v102, v138);
          v107 = Logger.logObject.getter();
          os_log_type_t v108 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v107, v108))
          {
            uint64_t v109 = swift_slowAlloc();
            uint64_t v170 = swift_slowAlloc();
            uint64_t v171 = v170;
            *(_DWORD *)uint64_t v109 = 141558275;
            uint64_t v175 = 1752392040;
            os_log_t v164 = v107;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *(_WORD *)(v109 + 12) = 2081;
            uint64_t v110 = NotificationSubscription.identifier.getter();
            uint64_t v175 = sub_1000466F4(v110, v111, &v171);
            uint64_t v91 = HourForecast;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v104 + 8))(v105, v106);
            os_log_t v112 = v164;
            _os_log_impl((void *)&_mh_execute_header, v164, v108, "Detected missing stopping notification for subscription: %{private,mask.hash}s ", (uint8_t *)v109, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(char *, uint64_t))(v168 + 8))(v136, v167);
          }
          else
          {
            (*(void (**)(char *, uint64_t))(v104 + 8))(v105, v106);

            (*(void (**)(char *, uint64_t))(v168 + 8))(v103, v167);
          }
          uint64_t v115 = v140;
          v116 = v139;
          v117 = v161;
          uint64_t v118 = v141;
          uint64_t v122 = (*(uint64_t (**)(char *, void, uint64_t))(v140 + 104))(v139, enum case for PrecipitationNotificationType.stopping(_:), v141);
          __chkstk_darwin(v122);
          uint64_t v123 = v165;
          *(&v127 - 6) = v128;
          *(&v127 - 5) = v123;
          uint64_t v124 = v154;
          *(&v127 - 4) = (uint64_t)v117;
          *(&v127 - 3) = v124;
          *(&v127 - 2) = (uint64_t)v116;
          sub_100005280(&qword_100062850);
          swift_allocObject();
          goto LABEL_34;
        }
      }
      uint64_t v113 = v157;
      v114 = *(void (**)(char *, uint64_t))(v156 + 8);
      v114(v147, v157);
      v114(v83, v113);
      sub_10000F3D4(v158);
      sub_10000F3D4(v159);
      (*(void (**)(char *, uint64_t))(v78 + 8))(v161, v91);
      (*(void (**)(char *, uint64_t))(v129 + 8))(v131, v130);
LABEL_7:
      sub_100005280(&qword_100062850);
      swift_allocObject();
      uint64_t v59 = Promise.init(value:)();
LABEL_8:
      ReferenceCountedLazy.decrease()();
      swift_release();
      return v59;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10000B9C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v62 = a7;
  uint64_t v63 = a8;
  uint64_t v61 = a6;
  uint64_t v50 = a5;
  uint64_t v64 = a9;
  uint64_t v12 = type metadata accessor for PrecipitationNotificationType();
  uint64_t v67 = *(void *)(v12 - 8);
  uint64_t v68 = v12;
  uint64_t v65 = *(void *)(v67 + 64);
  __chkstk_darwin(v12);
  uint64_t v72 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  uint64_t v57 = *(void *)(HourForecast - 8);
  uint64_t v60 = *(void *)(v57 + 64);
  uint64_t v14 = __chkstk_darwin(HourForecast);
  uint64_t v71 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v69 = (char *)&v49 - v16;
  uint64_t v55 = type metadata accessor for NotificationSubscription();
  uint64_t v53 = *(void *)(v55 - 8);
  uint64_t v56 = *(void *)(v53 + 64);
  __chkstk_darwin(v55);
  uint64_t v66 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = type metadata accessor for Date();
  uint64_t v73 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  uint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for UUID();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for Session.Kind();
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v49 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = swift_allocObject();
  uint64_t v58 = v28;
  *(void *)(v28 + 16) = a1;
  *(void *)(v28 + 24) = a2;
  uint64_t v29 = *(void *)(a5 + 64);
  (*(void (**)(char *, void, uint64_t))(v25 + 104))(v27, enum case for Session.Kind.telemetry(_:), v24);
  swift_retain();
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  Date.init()();
  uint64_t v52 = v19;
  uint64_t v51 = v29;
  SessionManager.start(for:identifier:startDate:timestampJitter:)();
  swift_bridgeObjectRelease();
  uint64_t v30 = *(uint64_t (**)(char *, uint64_t))(v73 + 8);
  v73 += 8;
  os_log_type_t v54 = v30;
  v30(v19, v70);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  uint64_t v49 = SessionManager.tracker.getter();
  uint64_t v31 = v53;
  uint64_t v32 = v55;
  (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v66, v61, v55);
  uint64_t v33 = v57;
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 16);
  uint64_t v35 = HourForecast;
  v34(v69, v62, HourForecast);
  v34(v71, v63, v35);
  uint64_t v36 = v67;
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v72, v64, v68);
  unint64_t v37 = (*(unsigned __int8 *)(v31 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  unint64_t v38 = (v56 + v37 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v39 = *(unsigned __int8 *)(v33 + 80);
  uint64_t v40 = (v39 + v38 + 8) & ~v39;
  uint64_t v41 = (v60 + v39 + v40) & ~v39;
  unint64_t v42 = (v60 + *(unsigned __int8 *)(v36 + 80) + v41) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v43 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v31 + 32))(v43 + v37, v66, v32);
  *(void *)(v43 + v38) = v50;
  uint64_t v44 = *(void (**)(uint64_t, char *, uint64_t))(v33 + 32);
  v44(v43 + v40, v69, v35);
  v44(v43 + v41, v71, v35);
  (*(void (**)(unint64_t, char *, uint64_t))(v67 + 32))(v43 + v42, v72, v68);
  swift_retain();
  Tracker.transaction(block:)();
  swift_release();
  swift_release();
  uint64_t v45 = swift_allocObject();
  uint64_t v46 = v58;
  *(void *)(v45 + 16) = sub_10000F478;
  *(void *)(v45 + 24) = v46;
  unint64_t v47 = v52;
  Date.init()();
  SessionManager.end(endDate:completion:)();
  swift_release();
  return v54(v47, v70);
}

uint64_t sub_10000C074(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v182 = a6;
  unint64_t v198 = a5;
  uint64_t v204 = a4;
  uint64_t v167 = a1;
  uint64_t v166 = type metadata accessor for NotificationSubscription();
  uint64_t v165 = *(void *)(v166 - 8);
  __chkstk_darwin(v166);
  uint64_t v162 = v8;
  os_log_t v164 = (char *)v145 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005280(&qword_100062890);
  __chkstk_darwin(v9 - 8);
  uint64_t v156 = (char *)v145 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005280(&qword_100062898);
  __chkstk_darwin(v11 - 8);
  uint64_t v175 = (char *)v145 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005280(&qword_1000628A0);
  __chkstk_darwin(v13 - 8);
  v186 = (char *)v145 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005280(&qword_1000628A8);
  __chkstk_darwin(v15 - 8);
  uint64_t v157 = (char *)v145 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v185 = type metadata accessor for Locale.Language();
  uint64_t v174 = *(void *)(v185 - 8);
  uint64_t v17 = __chkstk_darwin(v185);
  uint64_t v169 = (char *)v145 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v171 = (char *)v145 - v19;
  uint64_t v173 = type metadata accessor for Locale();
  uint64_t v172 = *(void *)(v173 - 8);
  uint64_t v20 = __chkstk_darwin(v173);
  uint64_t v155 = (char *)v145 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v170 = (char *)v145 - v22;
  uint64_t v23 = sub_100005280(&qword_1000628B0);
  __chkstk_darwin(v23 - 8);
  uint64_t v152 = (char *)v145 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v181 = type metadata accessor for TimeZone();
  uint64_t v184 = *(void *)(v181 - 8);
  __chkstk_darwin(v181);
  v180 = (char *)v145 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v187 = type metadata accessor for SessionData();
  uint64_t v161 = *(void *)(v187 - 8);
  __chkstk_darwin(v187);
  v160 = (char *)v145 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v179 = type metadata accessor for PrecipitationNotificationType();
  uint64_t v178 = *(void *)(v179 - 8);
  __chkstk_darwin(v179);
  v183 = (char *)v145 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = type metadata accessor for MissedPrecipitationNotificationData();
  uint64_t v158 = *(void *)(v159 - 8);
  __chkstk_darwin(v159);
  v191 = (char *)v145 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for Date();
  uint64_t v30 = *(void *)(v29 - 8);
  unint64_t v196 = v29;
  uint64_t v197 = v30;
  __chkstk_darwin(v29);
  uint64_t v195 = (uint64_t)v145 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v194 = type metadata accessor for Metadata();
  unint64_t v200 = *(void *)(v194 - 8);
  __chkstk_darwin(v194);
  v193 = (char *)v145 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v190 = type metadata accessor for PrecipitationForecastData();
  uint64_t v189 = *(void *)(v190 - 8);
  uint64_t v33 = __chkstk_darwin(v190);
  v177 = (char *)v145 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __chkstk_darwin(v33);
  v176 = (char *)v145 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  v188 = (char *)v145 - v38;
  __chkstk_darwin(v37);
  v192 = (char *)v145 - v39;
  uint64_t v40 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v40 - 8);
  uint64_t v199 = (uint64_t)v145 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for LocationData();
  uint64_t v201 = *(void *)(v42 - 8);
  uint64_t v202 = v42;
  __chkstk_darwin(v42);
  v205 = (char *)v145 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v203 = type metadata accessor for AppConfiguration();
  uint64_t v44 = *(void *)(v203 - 8);
  uint64_t v45 = __chkstk_darwin(v203);
  uint64_t v153 = (char *)v145 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v45);
  uint64_t v48 = (char *)v145 - v47;
  uint64_t v49 = type metadata accessor for Location();
  uint64_t v50 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v52 = (char *)v145 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = type metadata accessor for NotificationSubscription.Location();
  uint64_t v54 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v56 = (char *)v145 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = a2;
  NotificationSubscription.location.getter();
  NotificationSubscription.Location.location.getter();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v53);
  Location.coordinate.getter();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v52, v49);
  uint64_t v57 = a3[17];
  uint64_t v168 = a3 + 14;
  sub_100005370(a3 + 14, v57);
  dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
  Swift::Int v58 = AppConfiguration.locationDecimalPrecision.getter();
  uint64_t v59 = *(void (**)(char *, uint64_t))(v44 + 8);
  uint64_t v154 = v44 + 8;
  v59(v48, v203);
  CLLocationCoordinate2D.rounded(with:)(v58);
  LocationData.init(latitudeDouble:longitudeDouble:)();
  sub_100009B60();
  *(void *)&v206[0] = NextHourForecast.summary.getter();
  sub_100005280(&qword_1000628B8);
  sub_10000F78C();
  uint64_t v60 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v69 = v68;
  uint64_t v151 = a3;
  unint64_t v70 = v200;
  v146 = v59;
  v147 = v48;
  uint64_t v71 = v60;
  swift_release();
  swift_bridgeObjectRelease();
  static String.Encoding.utf8.getter();
  uint64_t v72 = String.init(data:encoding:)();
  if (!v73)
  {
    sub_100008D88(v71, v69);
    uint64_t v62 = v201;
    uint64_t v61 = v202;
    uint64_t v63 = v205;
    if (qword_1000624E0 != -1) {
      swift_once();
    }
    uint64_t v64 = type metadata accessor for Logger();
    sub_100005248(v64, (uint64_t)static Logger.analytics);
    uint64_t v65 = Logger.logObject.getter();
    os_log_type_t v66 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v65, v66))
    {
      uint64_t v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v67 = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, v66, "Failed to encode previous forecast summaries for missed notification event", v67, 2u);
      swift_slowDealloc();
    }
    goto LABEL_13;
  }
  v145[1] = v72;
  uint64_t v150 = v73;
  uint64_t v148 = v71;
  unint64_t v149 = v69;
  sub_100009B60();
  *(void *)&v206[0] = NextHourForecast.summary.getter();
  uint64_t v78 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v80 = v79;
  swift_release();
  swift_bridgeObjectRelease();
  static String.Encoding.utf8.getter();
  String.init(data:encoding:)();
  if (!v81)
  {
    swift_bridgeObjectRelease();
    sub_100008D88(v78, v80);
    uint64_t v62 = v201;
    uint64_t v61 = v202;
    uint64_t v63 = v205;
    if (qword_1000624E0 != -1) {
      swift_once();
    }
    uint64_t v74 = type metadata accessor for Logger();
    sub_100005248(v74, (uint64_t)static Logger.analytics);
    uint64_t v65 = Logger.logObject.getter();
    os_log_type_t v75 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v65, v75))
    {
      uint64_t v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v76 = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, v75, "Failed to encode current forecast summaries for missed notification event", v76, 2u);
      swift_slowDealloc();
    }
    sub_100008D88(v148, v149);
LABEL_13:

    return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v63, v61);
  }
  uint64_t v199 = v78;
  v82 = v193;
  NextHourForecast.metadata.getter();
  uint64_t v83 = v195;
  Metadata.readTime.getter();
  uint64_t v84 = *(void (**)(char *, uint64_t))(v70 + 8);
  unint64_t v200 = v70 + 8;
  v84(v82, v194);
  Date.timeIntervalSince1970.getter();
  double v86 = v85;
  uint64_t v87 = *(uint64_t (**)(uint64_t, unint64_t))(v197 + 8);
  v197 += 8;
  int v88 = v87;
  uint64_t result = v87(v83, v196);
  if ((~*(void *)&v86 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_33;
  }
  unint64_t v198 = v80;
  int v89 = v192;
  uint64_t v90 = v184;
  uint64_t v91 = v183;
  if (v86 <= -2147483650.0)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v92 = v182;
  unint64_t v93 = v196;
  if (v86 >= 2147483650.0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  PrecipitationForecastData.init(date:summaries:)();
  v94 = v193;
  NextHourForecast.metadata.getter();
  uint64_t v95 = v195;
  Metadata.readTime.getter();
  v84(v94, v194);
  Date.timeIntervalSince1970.getter();
  double v97 = v96;
  uint64_t result = v88(v95, v93);
  if ((~*(void *)&v97 & 0x7FF0000000000000) == 0)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v98 = v190;
  uint64_t v99 = v189;
  unint64_t v100 = v188;
  if (v97 <= -2147483650.0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  if (v97 >= 2147483650.0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  PrecipitationForecastData.init(date:summaries:)();
  (*(void (**)(char *, uint64_t, uint64_t))(v178 + 16))(v91, v92, v179);
  os_log_t v101 = *(void (**)(char *, char *, uint64_t))(v99 + 16);
  v101(v176, v89, v98);
  v101(v177, v100, v98);
  MissedPrecipitationNotificationData.init(notificationType:currentPrecipitationForecastData:previousPrecipitationForecastData:)();
  uint64_t v102 = v180;
  static TimeZone.current.getter();
  uint64_t v103 = v195;
  Date.init()();
  uint64_t v104 = TimeZone.secondsFromGMT(for:)();
  v88(v103, v196);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v90 + 8))(v102, v181);
  uint64_t v204 = v104;
  if (v104 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v105 = (uint64_t)v175;
  uint64_t v106 = v174;
  uint64_t v107 = v173;
  uint64_t v108 = v172;
  uint64_t v109 = v171;
  uint64_t v110 = v170;
  if (v204 > 0x7FFFFFFF)
  {
LABEL_39:
    __break(1u);
    return result;
  }
  static Locale.current.getter();
  Locale.language.getter();
  unint64_t v111 = *(void (**)(char *, uint64_t))(v108 + 8);
  v111(v110, v107);
  uint64_t v112 = (uint64_t)v152;
  Locale.Language.languageCode.getter();
  uint64_t v113 = *(void (**)(char *, uint64_t))(v106 + 8);
  uint64_t v114 = v112;
  v113(v109, v185);
  uint64_t v115 = type metadata accessor for Locale.LanguageCode();
  int v116 = sub_1000093BC(v112, 1, v115);
  uint64_t v117 = (uint64_t)v186;
  if (v116 == 1)
  {
    sub_10000F94C(v114, &qword_1000628B0);
    unint64_t v200 = 0xE100000000000000;
    uint64_t v197 = 45;
  }
  else
  {
    uint64_t v197 = Locale.LanguageCode.identifier.getter();
    unint64_t v200 = v118;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v115 - 8) + 8))(v114, v115);
  }
  uint64_t v119 = v169;
  uint64_t v120 = v147;
  uint64_t v121 = v155;
  static Locale.current.getter();
  Locale.language.getter();
  v111(v121, v107);
  uint64_t v122 = (uint64_t)v157;
  Locale.Language.region.getter();
  v113(v119, v185);
  uint64_t v123 = type metadata accessor for Locale.Region();
  if (sub_1000093BC(v122, 1, v123) == 1)
  {
    sub_10000F94C(v122, &qword_1000628A8);
    uint64_t v195 = 45;
    unint64_t v196 = 0xE100000000000000;
  }
  else
  {
    uint64_t v195 = Locale.Region.identifier.getter();
    unint64_t v196 = v124;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v123 - 8) + 8))(v122, v123);
  }
  uint64_t v125 = v203;
  v126 = v168;
  uint64_t v127 = enum case for StartMethod.unknown(_:);
  uint64_t started = type metadata accessor for StartMethod();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(started - 8) + 104))(v117, v127, started);
  sub_100008CEC(v117, 0, 1, started);
  uint64_t v129 = v151;
  sub_100005370(v151 + 9, v151[12]);
  dispatch thunk of LocationAccessDataProviderType.locationAccessData.getter();
  uint64_t v130 = type metadata accessor for LocationAccessData();
  sub_100008CEC(v105, 0, 1, v130);
  sub_100005370(v129 + 19, v129[22]);
  uint64_t v131 = (uint64_t)v156;
  dispatch thunk of CellularRadioAccessTechnologyProviderType.cellularRadioAccessTechnology.getter();
  uint64_t v132 = type metadata accessor for CellularRadioAccessTechnology();
  sub_100008CEC(v131, 0, 1, v132);
  sub_100005370(v126, v129[17]);
  dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
  AppConfiguration.treatmentIDs.getter();
  v133 = v146;
  v146(v120, v125);
  sub_100005370(v126, v129[17]);
  v134 = v153;
  dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
  AppConfiguration.segmentSetIDs.getter();
  v133(v134, v125);
  v135 = v160;
  SessionData.init(utcOffset:languageCode:countryCode:startMethod:productType:locationAccess:cellularRadioAccessTechnology:userSegmentationTreatmentIDs:userSegmentationSegmentSetIDs:)();
  sub_10000F904(&qword_1000628D0, (void (*)(uint64_t))&type metadata accessor for SessionData);
  AccessTracker.push<A>(data:traits:file:line:)();
  sub_10000F904(&qword_1000628D8, (void (*)(uint64_t))&type metadata accessor for LocationData);
  AccessTracker.push<A>(data:traits:file:line:)();
  sub_10000F904(&qword_1000628E0, (void (*)(uint64_t))&type metadata accessor for MissedPrecipitationNotificationData);
  v136 = v191;
  uint64_t v137 = v159;
  AccessTracker.push<A>(data:traits:file:line:)();
  type metadata accessor for PrecipitationNotificationMissedEvent();
  memset(v206, 0, sizeof(v206));
  uint64_t v138 = v165;
  v139 = v164;
  uint64_t v140 = v166;
  (*(void (**)(char *, uint64_t, uint64_t))(v165 + 16))(v164, v163, v166);
  unint64_t v141 = (*(unsigned __int8 *)(v138 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v138 + 80);
  uint64_t v142 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v138 + 32))(v142 + v141, v139, v140);
  sub_10000F904(&qword_1000628E8, (void (*)(uint64_t))&type metadata accessor for PrecipitationNotificationMissedEvent);
  AccessTracker.submit<A>(_:onlyIfTimed:userInfo:completion:)();
  sub_100008D88(v148, v149);
  sub_100008D88(v199, v198);
  swift_release();
  sub_10000F94C((uint64_t)v206, (uint64_t *)&unk_1000628F0);
  (*(void (**)(char *, uint64_t))(v161 + 8))(v135, v187);
  (*(void (**)(char *, uint64_t))(v158 + 8))(v136, v137);
  uint64_t v143 = *(void (**)(char *, uint64_t))(v189 + 8);
  uint64_t v144 = v190;
  v143(v188, v190);
  v143(v192, v144);
  return (*(uint64_t (**)(char *, uint64_t))(v201 + 8))(v205, v202);
}

void sub_10000D898(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for NotificationSubscription();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000624E0 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100005248(v7, (uint64_t)static Logger.analytics);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a2, v3);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 141558275;
    uint64_t v14 = 1752392040;
    uint64_t v15 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v10 + 12) = 2081;
    uint64_t v12 = NotificationSubscription.identifier.getter();
    uint64_t v14 = sub_1000466F4(v12, v13, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Finished missed notification event submit for subscription: %{private,mask.hash}s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_10000DB0C()
{
  swift_release();
  sub_100008AD0(v0 + 24);
  swift_release();
  sub_100008AD0(v0 + 72);
  sub_100008AD0(v0 + 112);
  sub_100008AD0(v0 + 152);
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_10000DB64()
{
  sub_10000DB0C();
  return _swift_deallocClassInstance(v0, 208, 7);
}

uint64_t type metadata accessor for PrecipitationNotificationAccuracyTracker()
{
  return self;
}

uint64_t sub_10000DBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v124 = a3;
  uint64_t v116 = a2;
  type metadata accessor for NextHourForecast();
  sub_1000053F4();
  uint64_t v118 = v4;
  uint64_t v119 = v3;
  __chkstk_darwin(v3);
  uint64_t v117 = v5;
  uint64_t v125 = (char *)&v100 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v113 = v7;
  uint64_t v114 = v6;
  __chkstk_darwin(v6);
  sub_10000F9B8();
  uint64_t v120 = (char *)(v9 - v8);
  uint64_t Schedule = type metadata accessor for PrecipitationNotificationFetchSchedule();
  sub_1000053F4();
  uint64_t v122 = v10;
  __chkstk_darwin(v11);
  sub_10000FA00();
  uint64_t v111 = v12;
  uint64_t v115 = v13;
  __chkstk_darwin(v14);
  uint64_t v128 = (char *)&v100 - v15;
  uint64_t v107 = type metadata accessor for PrecipitationNotificationDeliverySchedule();
  sub_1000053F4();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_10000F9B8();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = type metadata accessor for PrecipitationNotification();
  sub_1000053F4();
  uint64_t v24 = v23;
  __chkstk_darwin(v25);
  sub_10000F9B8();
  uint64_t v28 = v27 - v26;
  uint64_t v29 = type metadata accessor for PrecipitationNotificationPolicy();
  sub_1000053F4();
  uint64_t v31 = v30;
  __chkstk_darwin(v32);
  sub_10000F9B8();
  uint64_t v35 = v34 - v33;
  uint64_t v129 = type metadata accessor for NotificationSubscription();
  sub_1000053F4();
  uint64_t v123 = v36;
  __chkstk_darwin(v37);
  sub_10000FA00();
  uint64_t v110 = v38;
  uint64_t v40 = __chkstk_darwin(v39);
  uint64_t v127 = (char *)&v100 - v41;
  uint64_t v112 = v42;
  __chkstk_darwin(v40);
  uint64_t v44 = (char *)&v100 - v43;
  sub_10000FA20();
  v45();
  int v46 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 88))(v35, v29);
  if (v46 == enum case for PrecipitationNotificationPolicy.notify(_:))
  {
    uint64_t v47 = sub_10000F9E8();
    v48(v47);
    sub_100005280(&qword_100062858);
    sub_10000FA14();
    v49();
    uint64_t v50 = v107;
    sub_10000FA14();
    v51();
    PrecipitationNotificationDeliverySchedule.subscription.getter();
    uint64_t v109 = PrecipitationNotification.identifier.getter();
    uint64_t v108 = v52;
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v21, v50);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v28, v22);
    uint64_t v53 = v122;
    uint64_t v54 = *(void (**)(void))(v122 + 8);
    uint64_t v55 = Schedule;
    sub_10000F9C8();
    v54();
    uint64_t v56 = v129;
    uint64_t v57 = v123;
  }
  else
  {
    uint64_t v53 = v122;
    uint64_t v55 = Schedule;
    if (v46 != enum case for PrecipitationNotificationPolicy.reschedule(_:))
    {
      sub_100005280(&qword_100062850);
      swift_allocObject();
      uint64_t v98 = Promise.init(value:)();
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v35, v29);
      return v98;
    }
    uint64_t v58 = sub_10000F9E8();
    v59(v58);
    sub_10000FA14();
    v60();
    PrecipitationNotificationFetchSchedule.subscription.getter();
    uint64_t v61 = *(void (**)(void))(v53 + 8);
    sub_10000F9C8();
    v61();
    uint64_t v57 = v123;
    uint64_t v54 = v61;
    uint64_t v56 = v129;
    sub_10000FA14();
    v62();
    uint64_t v109 = 0;
    uint64_t v108 = 0;
  }
  uint64_t v63 = v120;
  static Logger.notifications.getter();
  uint64_t v64 = *(void *)(v57 + 16);
  uint64_t v65 = v110;
  uint64_t v121 = v44;
  uint64_t v107 = v57 + 16;
  uint64_t v106 = v64;
  sub_10000FA20();
  v66();
  uint64_t v67 = v111;
  uint64_t v105 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16);
  v105(v111, v124, v55);
  unint64_t v68 = Logger.logObject.getter();
  os_log_type_t v69 = static os_log_type_t.default.getter();
  int v103 = v69;
  if (os_log_type_enabled(v68, v69))
  {
    uint64_t v70 = swift_slowAlloc();
    os_log_t v101 = v54;
    uint64_t v71 = v57;
    uint64_t v72 = v70;
    uint64_t v73 = swift_slowAlloc();
    uint64_t v102 = v73;
    *(_DWORD *)uint64_t v72 = 141558531;
    uint64_t v131 = 1752392040;
    uint64_t v132 = v73;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v72 + 12) = 2081;
    uint64_t v74 = NotificationSubscription.identifier.getter();
    uint64_t v131 = sub_1000466F4(v74, v75, &v132);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v76 = *(void (**)(void, void))(v71 + 8);
    uint64_t v104 = (v71 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v110 = v76;
    v76(v65, v56);
    *(_WORD *)(v72 + 22) = 2082;
    uint64_t v77 = PrecipitationNotificationFetchSchedule.identifier.getter();
    uint64_t v131 = sub_1000466F4(v77, v78, &v132);
    uint64_t v53 = v122;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v55 = Schedule;
    ((void (*)(uint64_t, uint64_t))v101)(v67, Schedule);
    _os_log_impl((void *)&_mh_execute_header, v68, (os_log_type_t)v103, "Tracking fetch result for subscription %{private,mask.hash}s on schedule %{public}s", (uint8_t *)v72, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v79 = (*(uint64_t (**)(char *, uint64_t))(v113 + 8))(v120, v114);
  }
  else
  {
    unint64_t v80 = *(void (**)(void, void))(v57 + 8);
    uint64_t v104 = (v57 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v110 = v80;
    v80(v65, v56);
    sub_10000F9C8();
    v54();

    uint64_t v79 = (*(uint64_t (**)(char *, uint64_t))(v113 + 8))(v63, v114);
  }
  __chkstk_darwin(v79);
  uint64_t v81 = v121;
  *(&v100 - 4) = v126;
  *(&v100 - 3) = (uint64_t)v81;
  *(&v100 - 2) = v116;
  uint64_t v120 = (char *)&type metadata for () + 8;
  uint64_t v114 = firstly<A>(closure:)();
  sub_100007450();
  uint64_t v113 = static OS_dispatch_queue.notifications.getter();
  uint64_t v82 = v118;
  uint64_t v83 = v119;
  sub_10000FA20();
  v84();
  sub_10000FA20();
  v85();
  v105((uint64_t)v128, v124, v55);
  unint64_t v86 = (*(unsigned __int8 *)(v82 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80);
  uint64_t v87 = v123;
  unint64_t v88 = (v117 + *(unsigned __int8 *)(v123 + 80) + v86) & ~(unint64_t)*(unsigned __int8 *)(v123 + 80);
  unint64_t v89 = (v112 + *(unsigned __int8 *)(v53 + 80) + v88) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
  unint64_t v90 = (v115 + v89 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v91 = swift_allocObject();
  uint64_t v92 = v125;
  *(void *)(v91 + 16) = v126;
  (*(void (**)(unint64_t, char *, uint64_t))(v82 + 32))(v91 + v86, v92, v83);
  unint64_t v93 = v91 + v88;
  uint64_t v94 = v129;
  (*(void (**)(unint64_t, char *, uint64_t))(v87 + 32))(v93, v127, v129);
  (*(void (**)(unint64_t, char *, uint64_t))(v53 + 32))(v91 + v89, v128, Schedule);
  uint64_t v95 = (uint64_t *)(v91 + v90);
  uint64_t v96 = v108;
  *uint64_t v95 = v109;
  v95[1] = v96;
  swift_retain();
  double v97 = (void *)v113;
  uint64_t v98 = Promise.then<A>(on:closure:)();
  swift_release();

  swift_release();
  v110(v121, v94);
  return v98;
}

uint64_t sub_10000E578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v62 = a3;
  uint64_t v57 = a6;
  uint64_t v58 = a7;
  uint64_t v56 = a5;
  uint64_t v65 = a4;
  uint64_t v66 = type metadata accessor for NotificationSubscription();
  uint64_t v59 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  uint64_t v61 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v68 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v67 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Expression();
  uint64_t v52 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for UUID();
  uint64_t v54 = *(void *)(v14 - 8);
  uint64_t v55 = v14;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ResultEntity = type metadata accessor for FetchResultEntity();
  uint64_t v53 = *(void *)(ResultEntity - 8);
  __chkstk_darwin(ResultEntity);
  uint64_t v19 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = *(void *)(a2 + 16);
  ReferenceCountedLazy.increase()();
  uint64_t v20 = v69[0];
  sub_100009B60();
  type metadata accessor for NextHourForecast();
  sub_10000F904(&qword_100062860, (void (*)(uint64_t))&type metadata accessor for NextHourForecast);
  unint64_t v21 = v63;
  uint64_t v22 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  uint64_t v60 = v20;
  if (v21)
  {
    swift_release();
    unint64_t v63 = 0;
    uint64_t v25 = v66;
    uint64_t v24 = v67;
    uint64_t v26 = v59;
    uint64_t v27 = v61;
    uint64_t v28 = v65;
    uint64_t v29 = v68;
    uint64_t v30 = v9;
    static Logger.notifications.getter();
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v27, v28, v25);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = swift_slowAlloc();
      uint64_t v62 = v30;
      uint64_t v40 = v39;
      uint64_t v65 = swift_slowAlloc();
      v69[0] = v65;
      *(_DWORD *)uint64_t v40 = 141558531;
      uint64_t v70 = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v40 + 12) = 2081;
      uint64_t v41 = NotificationSubscription.identifier.getter();
      uint64_t v70 = sub_1000466F4(v41, v42, v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v66);
      *(_WORD *)(v40 + 22) = 2082;
      uint64_t v70 = v21;
      swift_errorRetain();
      sub_100005280(&qword_100062868);
      uint64_t v43 = String.init<A>(describing:)();
      uint64_t v70 = sub_1000466F4(v43, v44, v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "An error occurred while tracking fetch results for subscription: %{private,mask.hash}s error: %{public}s", (uint8_t *)v40, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v68 + 8))(v67, v62);
    }
    else
    {
      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v25);
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v29 + 8))(v24, v30);
    }
  }
  else
  {
    uint64_t v49 = v13;
    uint64_t v48 = v11;
    uint64_t v50 = ResultEntity;
    uint64_t v62 = v9;
    uint64_t v31 = v22;
    unint64_t v32 = v23;
    swift_release();
    unint64_t v63 = NotificationSubscription.identifier.getter();
    uint64_t v51 = v33;
    uint64_t v56 = PrecipitationNotificationFetchSchedule.identifier.getter();
    sub_10000F168(v31, v32);
    UUID.init()();
    UUID.uuidString.getter();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v16, v55);
    swift_bridgeObjectRetain();
    FetchResultEntity.init(identifier:subscriptionIdentifier:scheduleIdentifier:notificationIdentifier:forecast:)();
    NotificationStore.fetchResults.getter();
    uint64_t v58 = v31;
    unint64_t v63 = v32;
    dispatch thunk of Table.delete.getter();
    swift_release();
    uint64_t v34 = NotificationSubscription.identifier.getter();
    v69[3] = (uint64_t)&type metadata for String;
    v69[4] = (uint64_t)&protocol witness table for String;
    v69[0] = v34;
    v69[1] = v35;
    uint64_t v36 = v49;
    == infix(_:_:)();
    sub_100008AD0((uint64_t)v69);
    dispatch thunk of Delete.where(_:)();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v36, v48);
    swift_release();
    NotificationStore.fetchResults.getter();
    dispatch thunk of Table.save.getter();
    swift_release();
    dispatch thunk of Save.entity(_:)();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v19, v50);
    sub_100008D88(v58, v63);
    swift_release();
  }
  sub_100005280(&qword_100062850);
  swift_allocObject();
  uint64_t v45 = Promise.init(value:)();
  ReferenceCountedLazy.decrease()();
  swift_release();
  return v45;
}

uint64_t sub_10000EE94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DBBC(a1, a2, a3);
}

uint64_t sub_10000EEB8()
{
  return sub_100009E30(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_10000EEEC()
{
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  sub_1000053F4();
  uint64_t v2 = v1;
  uint64_t v3 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v23 = type metadata accessor for NotificationSubscription();
  sub_1000053F4();
  uint64_t v8 = v7;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = (v4 + v6 + v9) & ~v9;
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t Schedule = type metadata accessor for PrecipitationNotificationFetchSchedule();
  sub_1000053F4();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v18 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v19 = (v10 + v12 + v18) & ~v18;
  uint64_t v22 = v3 | v9 | v18 | 7;
  unint64_t v20 = ((*(void *)(v17 + 64) + v19 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, HourForecast);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v10, v23);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v0 + v19, Schedule);
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, v20, v22);
}

uint64_t sub_10000F06C(uint64_t a1)
{
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  sub_10000F9A0(HourForecast);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = type metadata accessor for NotificationSubscription();
  sub_10000F9A0(v8);
  unint64_t v10 = (v5 + v7 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t Schedule = type metadata accessor for PrecipitationNotificationFetchSchedule();
  sub_10000F9A0(Schedule);
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  unint64_t v18 = (v10 + v12 + *(unsigned __int8 *)(v15 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v19 = (*(void *)(v17 + 64) + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_10000E578(a1, *(void *)(v1 + 16), v1 + v5, v1 + v10, v1 + v18, *(void *)(v1 + v19), *(void *)(v1 + v19 + 8));
}

uint64_t sub_10000F168(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_10000F1C0()
{
  return sub_10000A360(*(void *)(v0 + 16));
}

uint64_t sub_10000F1DC()
{
  uint64_t v1 = type metadata accessor for NotificationSubscription();
  sub_1000053F4();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 24) & ~v4;
  uint64_t v7 = *(void *)(v6 + 64);
  type metadata accessor for NextHourForecast();
  sub_1000053F4();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = ((v5 + v7 + v12) & ~v12) + *(void *)(v11 + 64);
  uint64_t v14 = v4 | v12 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v1);
  sub_10000F9D8();
  v15();
  return _swift_deallocObject(v0, v13, v14);
}

uint64_t sub_10000F2DC(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for NotificationSubscription();
  sub_10000F9A0(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  sub_1000090A4(HourForecast);
  return sub_10000A3BC(a1, *(void *)(v1 + 16), v1 + v5, v1 + ((v5 + v7 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)));
}

uint64_t sub_10000F36C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005280(&qword_100062870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F3D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PrecipitationForecastSummaries();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000F430(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000F448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000B9C8(a1, a2, a3, a4, v4[2], v4[3], v4[4], v4[5], v4[6]);
}

uint64_t sub_10000F478()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000F4A0()
{
  uint64_t v23 = type metadata accessor for NotificationSubscription();
  sub_1000053F4();
  uint64_t v2 = v1;
  uint64_t v3 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v21 = (v3 + 16) & ~v3;
  unint64_t v5 = (*(void *)(v4 + 64) + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  type metadata accessor for NextHourForecast();
  sub_1000053F4();
  uint64_t v7 = v6;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v22 = type metadata accessor for PrecipitationNotificationType();
  sub_1000053F4();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = (((v10 + v8 + ((v5 + v8 + 8) & ~v8)) & ~v8) + v10 + v15) & ~v15;
  uint64_t v20 = v16 + *(void *)(v14 + 64);
  uint64_t v17 = v3 | v8 | v15 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v21, v23);
  swift_release();
  unint64_t v18 = *(void (**)(void))(v7 + 8);
  sub_10000F9D8();
  v18();
  sub_10000F9D8();
  v18();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0 + v16, v22);
  return _swift_deallocObject(v0, v20, v17);
}

uint64_t sub_10000F634(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for NotificationSubscription();
  sub_10000F9A0(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v7 = (*(void *)(v6 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t HourForecast = type metadata accessor for NextHourForecast();
  sub_10000F9A0(HourForecast);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = (v7 + v13 + 8) & ~v13;
  uint64_t v15 = *(void *)(v12 + 64);
  uint64_t v16 = (v15 + v13 + v14) & ~v13;
  uint64_t v17 = type metadata accessor for PrecipitationNotificationType();
  sub_1000090A4(v17);
  unint64_t v19 = *(uint64_t **)(v1 + v7);
  uint64_t v20 = v1 + ((v16 + v15 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
  return sub_10000C074(a1, v1 + v5, v19, v1 + v14, v1 + v16, v20);
}

uint64_t sub_10000F72C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000F764()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_10000F78C()
{
  unint64_t result = qword_1000628C0;
  if (!qword_1000628C0)
  {
    sub_1000080E4(&qword_1000628B8);
    sub_10000F904(&qword_1000628C8, (void (*)(uint64_t))&type metadata accessor for ForecastSummary);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000628C0);
  }
  return result;
}

uint64_t sub_10000F830()
{
  type metadata accessor for NotificationSubscription();
  sub_100009150();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return _swift_deallocObject(v0, v4, v5);
}

void sub_10000F8B4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for NotificationSubscription();
  sub_1000090A4(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  sub_10000D898(a1, v5);
}

uint64_t sub_10000F904(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000F94C(uint64_t a1, uint64_t *a2)
{
  sub_100005280(a2);
  sub_100009150();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_10000F9A0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10000F9E8()
{
  return v0;
}

id sub_10000FA2C(uint64_t a1, void *a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR____TtC8weatherd32NotificationAuthorizationManager_notificationsManager] = a1;
  *(void *)&v2[OBJC_IVAR____TtC8weatherd32NotificationAuthorizationManager_notificationCenter] = a2;
  v9.receiver = v2;
  v9.super_class = ObjectType;
  swift_unknownObjectRetain();
  id v6 = a2;
  id v7 = objc_msgSendSuper2(&v9, "init");
  objc_msgSend(v6, "setPrivateDelegate:", v7, v9.receiver, v9.super_class);
  [v6 setWantsNotificationResponsesDelivered];

  swift_unknownObjectRelease();
  return v7;
}

void sub_10000FAE8()
{
}

id NotificationsManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NotificationAuthorizationManager()
{
  return self;
}

void sub_10000FBD0(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  objc_super v9 = a2;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134349056;
    id v14 = [v9 authorizationStatus];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Notification settings changed with authorization status: %{public}ld", v12, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10000FD94(v3);
}

void sub_10000FD94(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + OBJC_IVAR____TtC8weatherd32NotificationAuthorizationManager_notificationsManager);
  v3[4] = sub_10000FE54;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 1107296256;
  v3[2] = sub_100010074;
  v3[3] = &unk_10005E6E8;
  uint64_t v2 = _Block_copy(v3);
  [v1 scheduleWith:v2];
  _Block_release(v2);
}

uint64_t sub_10000FE54(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  id v6 = a1;
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v17 = v2;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = (uint64_t)a1;
    uint64_t v19 = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    id v12 = v6;
    sub_100005280(&qword_100062998);
    uint64_t v13 = String.init<A>(describing:)();
    uint64_t v18 = sub_1000466F4(v13, v14, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Rescheduled notification fetching in response to settings change to date: %{public}s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

void sub_100010074(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100010154(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100010164()
{
  return swift_release();
}

uint64_t sub_10001016C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v91 = a6;
  uint64_t v92 = a7;
  uint64_t v85 = a1;
  uint64_t v86 = a3;
  uint64_t v10 = type metadata accessor for Date();
  sub_1000053F4();
  uint64_t v90 = v11;
  __chkstk_darwin(v12);
  sub_100013014();
  uint64_t v84 = v13;
  uint64_t v93 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v15 = v14;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v18 = __chkstk_darwin(v17);
  unint64_t v88 = (char *)v79 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)v79 - v21;
  uint64_t v23 = type metadata accessor for SevereMessage();
  __chkstk_darwin(v23);
  sub_100013014();
  uint64_t v89 = a4;
  if (!a4)
  {
    uint64_t v27 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    static Logger.notifications.getter();
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Attempted to parse APSMessage without channel identifier", v30, 2u);
      sub_100012FA4();
    }

    sub_100012FF0();
    v31();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v93);
    goto LABEL_37;
  }
  uint64_t v82 = v24;
  uint64_t v94 = 0x6E6F6973726576;
  unint64_t v95 = 0xE700000000000000;
  AnyHashable.init<A>(_:)();
  uint64_t v87 = a5;
  sub_100010A10((uint64_t)&v96, a5, &v98);
  sub_10001278C((uint64_t)&v96);
  if (!v99)
  {
    uint64_t v83 = a2;
    sub_1000127E0((uint64_t)&v98);
LABEL_11:
    uint64_t v25 = 0;
    char v26 = 1;
    goto LABEL_12;
  }
  if ((sub_100012FD4() & 1) == 0)
  {
    uint64_t v83 = a2;
    goto LABEL_11;
  }
  uint64_t v25 = v94;
  if ((unint64_t)(v94 - 1) > 1)
  {
    uint64_t v81 = v15;
    unint64_t v88 = (char *)v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    static Logger.notifications.getter();
    uint64_t v62 = Logger.logObject.getter();
    os_log_type_t v63 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v98 = swift_slowAlloc();
      uint64_t v65 = v90;
      uint64_t v80 = v23;
      *(_DWORD *)uint64_t v64 = 136446210;
      uint64_t v96 = v25;
      char v97 = 0;
      sub_100005280(&qword_100062AA8);
      uint64_t v66 = String.init<A>(describing:)();
      uint64_t v96 = sub_1000466F4(v66, v67, (uint64_t *)&v98);
      uint64_t v23 = v80;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "Attempted to parse APSMessage with unsupported version %{public}s", v64, 0xCu);
      uint64_t v61 = 1;
      swift_arrayDestroy();
      sub_100012FA4();
      sub_100012FA4();

      (*(void (**)(uint64_t, char *))(v65 + 8))(v91, v88);
      sub_100012FBC();
      sub_100012FF0();
      v68();
      return sub_100008CEC(v92, v61, 1, v23);
    }

    sub_100012FF0();
    v74();
    uint64_t v75 = sub_100012FBC();
    v77(v75, v76);
    goto LABEL_37;
  }
  uint64_t v83 = a2;
  char v26 = 0;
LABEL_12:
  static Logger.notifications.getter();
  unint64_t v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v81 = v15;
    uint64_t v35 = (uint8_t *)v34;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v80 = v23;
    *(void *)&long long v98 = v36;
    *(_DWORD *)uint64_t v35 = 136446210;
    v79[1] = v35 + 4;
    uint64_t v96 = v25;
    char v97 = v26;
    sub_100005280(&qword_100062AA8);
    uint64_t v37 = String.init<A>(describing:)();
    uint64_t v38 = v25;
    uint64_t v96 = sub_1000466F4(v37, v39, (uint64_t *)&v98);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Parse APSMessage with version %{public}s", v35, 0xCu);
    swift_arrayDestroy();
    uint64_t v23 = v80;
    sub_100012FA4();
    uint64_t v40 = v81;
    sub_100012FA4();

    uint64_t v41 = *(void (**)(uint64_t))(v40 + 8);
    uint64_t v42 = sub_100012F90();
    v41(v42);
  }
  else
  {

    uint64_t v41 = *(void (**)(uint64_t))(v15 + 8);
    uint64_t v43 = sub_100012F90();
    v41(v43);
    uint64_t v38 = v25;
  }
  if (v38 == 2) {
    char v44 = v26;
  }
  else {
    char v44 = 1;
  }
  if ((v44 & 1) == 0)
  {
    uint64_t v94 = 0x737472656C61;
    unint64_t v95 = 0xE600000000000000;
    AnyHashable.init<A>(_:)();
    sub_100010A10((uint64_t)&v96, v87, &v98);
    swift_bridgeObjectRelease();
    sub_10001278C((uint64_t)&v96);
    if (v99)
    {
      if (sub_100012FD4())
      {
        uint64_t v52 = v84;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v90 + 16))(v84, v91, v10);
        uint64_t v53 = sub_100012F48();
        sub_100010B1C(v53, v54, v55, v56, v57, v58, v52, v59);
        goto LABEL_25;
      }
      swift_bridgeObjectRelease();
      sub_100013028();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_100013028();
      sub_1000127E0((uint64_t)&v98);
    }
    static Logger.notifications.getter();
    os_log_type_t v69 = Logger.logObject.getter();
    os_log_type_t v70 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v69, v70))
    {
      uint64_t v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v71 = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "Attempted to parse APSMessage with version 2, without binary alert payload", v71, 2u);
      sub_100012FA4();
    }

    sub_100012FF0();
    v72();
    uint64_t v73 = sub_100012F90();
    v41(v73);
LABEL_37:
    uint64_t v61 = 1;
    return sub_100008CEC(v92, v61, 1, v23);
  }
  uint64_t v94 = 0x73746E657665;
  unint64_t v95 = 0xE600000000000000;
  AnyHashable.init<A>(_:)();
  sub_100010A10((uint64_t)&v96, v87, &v98);
  swift_bridgeObjectRelease();
  sub_10001278C((uint64_t)&v96);
  if (!v99)
  {
    swift_bridgeObjectRelease();
    sub_100013028();
    sub_1000127E0((uint64_t)&v98);
LABEL_31:
    (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v91, v10);
    goto LABEL_37;
  }
  sub_100005280(&qword_100062AA0);
  if ((sub_100012FD4() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_100013028();
    goto LABEL_31;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v90 + 16))(v84, v91, v10);
  uint64_t v45 = sub_100012F48();
  sub_1000114C4(v45, v46, v47, v48, v49, v50, v51);
LABEL_25:
  sub_100012FF0();
  v60();
  sub_100012840((uint64_t)v41, v92);
  uint64_t v61 = 0;
  return sub_100008CEC(v92, v61, 1, v23);
}

double sub_100010A10@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100024EF8(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_1000128A4(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_100010A74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_100024F3C(a1, a2), (v3 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

double sub_100010AB8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_100024F3C(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_1000128A4(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_100010B1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  uint64_t v65 = a7;
  uint64_t v63 = a4;
  uint64_t v62 = a3;
  uint64_t v74 = a1;
  uint64_t v64 = a8;
  uint64_t v73 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v73 - 8);
  uint64_t v12 = __chkstk_darwin(v73);
  uint64_t v59 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  unint64_t v58 = (char *)&v57 - v15;
  __chkstk_darwin(v14);
  uint64_t v75 = (char *)&v57 - v16;
  uint64_t v17 = type metadata accessor for UUID();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v71 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = a5;
  unint64_t v80 = a6;
  sub_10000F168(a5, a6);
  uint64_t v20 = 0;
  os_log_type_t v70 = (void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v72 = (void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v21 = &_swiftEmptyArrayStorage;
  *((void *)&v22 + 1) = 8;
  long long v69 = xmmword_1000509A0;
  *(void *)&long long v22 = 136315394;
  long long v67 = v22;
  uint64_t v66 = (char *)&type metadata for Any + 8;
  unint64_t v61 = a6;
  unint64_t v23 = a6;
  uint64_t v60 = a5;
  uint64_t v68 = v17;
  while (2)
  {
    switch(v23 >> 62)
    {
      case 1uLL:
        uint64_t v24 = (int)a5;
        uint64_t v25 = a5 >> 32;
        goto LABEL_7;
      case 2uLL:
        uint64_t v24 = *(void *)(a5 + 16);
        uint64_t v25 = *(void *)(a5 + 24);
LABEL_7:
        if (v24 != v25) {
          goto LABEL_8;
        }
        goto LABEL_17;
      case 3uLL:
        goto LABEL_17;
      default:
        if ((v23 & 0xFF000000000000) == 0)
        {
LABEL_17:
          sub_100008D88(v60, v61);
          uint64_t v44 = a5;
          unint64_t v45 = v23;
          goto LABEL_18;
        }
LABEL_8:
        if (v20 != 500)
        {
          uint64_t v77 = v20;
          char v26 = v71;
          static FixedSizeTypeBinaryCodable.read(from:)();
          uint64_t v27 = UUID.uuidString.getter();
          unint64_t v29 = v28;
          (*v70)(v26, v17);
          sub_100005280(&qword_100062AB0);
          uint64_t v30 = swift_allocObject();
          *(_OWORD *)(v30 + 16) = v69;
          static FixedSizeTypeBinaryCodable.read(from:)();
          *(double *)(v30 + 32) = (double)((int)bswap32(LOWORD(v78[0])) >> 16) / 100.0;
          static FixedSizeTypeBinaryCodable.read(from:)();
          *(double *)(v30 + 40) = (double)((int)bswap32(LOWORD(v78[0])) >> 16) / 100.0;
          static FixedSizeTypeBinaryCodable.read(from:)();
          *(double *)(v30 + 48) = (double)((int)bswap32(LOWORD(v78[0])) >> 16) / 100.0;
          static FixedSizeTypeBinaryCodable.read(from:)();
          *(double *)(v30 + 56) = (double)((int)bswap32(LOWORD(v78[0])) >> 16) / 100.0;
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_100032FD4(0, v21[2] + 1, 1, (uint64_t)v21);
            uint64_t v21 = v42;
          }
          unint64_t v32 = v21[2];
          unint64_t v31 = v21[3];
          if (v32 >= v31 >> 1)
          {
            sub_100032FD4(v31 > 1, v32 + 1, 1, (uint64_t)v21);
            uint64_t v21 = v43;
          }
          v21[2] = v32 + 1;
          uint64_t v76 = v21;
          os_log_type_t v33 = &v21[5 * v32];
          v33[4] = v27;
          v33[5] = v29;
          uint64_t v34 = v75;
          v33[6] = v74;
          v33[7] = a2;
          v33[8] = v30;
          static Logger.notifications.getter();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          uint64_t v35 = Logger.logObject.getter();
          os_log_type_t v36 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v35, v36))
          {
            uint64_t v37 = swift_slowAlloc();
            v78[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v37 = v67;
            swift_bridgeObjectRetain();
            *(void *)(v37 + 4) = sub_1000466F4(v27, v29, v78);
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v37 + 12) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v38 = Array.description.getter();
            uint64_t v39 = a2;
            unint64_t v41 = v40;
            swift_bridgeObjectRelease();
            *(void *)(v37 + 14) = sub_1000466F4(v38, v41, v78);
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            a2 = v39;
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v35, v36, "Received weather alert: %s - %s", (uint8_t *)v37, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*v72)(v75, v73);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            (*v72)(v34, v73);
          }
          uint64_t v21 = v76;
          uint64_t v20 = v77 + 1;
          a5 = v79;
          unint64_t v23 = v80;
          uint64_t v17 = v68;
          continue;
        }
        uint64_t v53 = v58;
        static Logger.notifications.getter();
        uint64_t v54 = Logger.logObject.getter();
        os_log_type_t v55 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v54, v55))
        {
          uint64_t v56 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v56 = 0;
          _os_log_impl((void *)&_mh_execute_header, v54, v55, "Breaking out of SevereMessage parsing", v56, 2u);
          swift_slowDealloc();
        }
        sub_100008D88(v60, v61);

        (*v72)(v53, v73);
        uint64_t v44 = v79;
        unint64_t v45 = v80;
LABEL_18:
        sub_100008D88(v44, v45);
        uint64_t v46 = v65;
        uint64_t v47 = v64;
        uint64_t v48 = v63;
        uint64_t v49 = v62;
        *uint64_t v64 = v74;
        v47[1] = a2;
        v47[2] = v49;
        v47[3] = v48;
        v47[4] = v21;
        uint64_t v50 = (char *)v47 + *(int *)(type metadata accessor for SevereMessage() + 28);
        uint64_t v51 = type metadata accessor for Date();
        return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v51 - 8) + 32))(v50, v46, v51);
    }
  }
}

uint64_t sub_1000114C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  uint64_t v7 = *(void *)(a5 + 16);
  if (v7)
  {
    uint64_t v8 = (uint64_t *)(a5 + 32);
    uint64_t v9 = &_swiftEmptyArrayStorage;
    do
    {
      uint64_t v29 = *v8;
      sub_100011654(&v29, &v25);
      uint64_t v10 = v26;
      if (v26)
      {
        uint64_t v11 = v25;
        uint64_t v12 = v27;
        long long v24 = v28;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100032FD4(0, v9[2] + 1, 1, (uint64_t)v9);
          uint64_t v9 = v16;
        }
        unint64_t v14 = v9[2];
        unint64_t v13 = v9[3];
        if (v14 >= v13 >> 1)
        {
          sub_100032FD4(v13 > 1, v14 + 1, 1, (uint64_t)v9);
          uint64_t v9 = v17;
        }
        v9[2] = v14 + 1;
        uint64_t v15 = (char *)&v9[5 * v14];
        *((void *)v15 + 4) = v11;
        *((void *)v15 + 5) = v10;
        *((void *)v15 + 6) = v12;
        *(_OWORD *)(v15 + 56) = v24;
      }
      ++v8;
      --v7;
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  a7[4] = v9;
  uint64_t v18 = (char *)a7 + *(int *)(type metadata accessor for SevereMessage() + 28);
  uint64_t v19 = type metadata accessor for Date();
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32);
  return v20(v18, a6, v19);
}

double sub_100011654@<D0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v24 - v9;
  uint64_t v11 = *a1;
  uint64_t v12 = sub_100010A74(0x696669746E656469, 0xEA00000000007265, v11);
  if (v12 && (uint64_t v25 = v12, (swift_dynamicCast() & 1) != 0))
  {
    uint64_t v14 = v24[0];
    uint64_t v13 = v24[1];
    uint64_t v15 = sub_100010A74(2020565602, 0xE400000000000000, v11);
    if (v15)
    {
      v24[0] = v15;
      sub_100005280(&qword_100062AB8);
      if (swift_dynamicCast())
      {
        uint64_t v16 = v25;
        *a2 = v14;
        a2[1] = v13;
        a2[2] = v14;
        a2[3] = v13;
        a2[4] = v16;
        swift_bridgeObjectRetain();
        return result;
      }
    }
    swift_bridgeObjectRelease();
    static Logger.notifications.getter();
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Message event payload did not include bounding box", v23, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    static Logger.notifications.getter();
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Message event payload did not include identifier", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  a2[4] = 0;
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  return result;
}

uint64_t sub_10001191C()
{
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  strcpy((char *)v18, "Identifier: ");
  BYTE5(v18[1]) = 0;
  HIWORD(v18[1]) = -5120;
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)v0[1];
  swift_bridgeObjectRetain();
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x3A737472656C410ALL;
  v4._object = (void *)0xE900000000000020;
  String.append(_:)(v4);
  uint64_t v5 = v0[4];
  int64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    sub_100011F8C(0, v6, 0);
    uint64_t v7 = (uint64_t *)(v5 + 40);
    do
    {
      uint64_t v9 = *(v7 - 1);
      uint64_t v8 = *v7;
      unint64_t v11 = _swiftEmptyArrayStorage[2];
      unint64_t v10 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain();
      if (v11 >= v10 >> 1) {
        sub_100011F8C((char *)(v10 > 1), v11 + 1, 1);
      }
      v7 += 5;
      _swiftEmptyArrayStorage[2] = v11 + 1;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage[2 * v11];
      *((void *)v12 + 4) = v9;
      *((void *)v12 + 5) = v8;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
  }
  sub_100005280(&qword_100062618);
  sub_100011FAC();
  uint64_t v13 = BidirectionalCollection<>.joined(separator:)();
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  v16._countAndFlagsBits = v13;
  v16._object = v15;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  return v18[0];
}

uint64_t sub_100011AE4(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  if (a2 < 0)
  {
    sub_100012F34();
    sub_100012F80();
LABEL_11:
    uint64_t result = sub_100012FFC();
    __break(1u);
    return result;
  }
  if (a3 + 40 * a2 > a1 && a1 + 40 * a2 > a3)
  {
    sub_100012F34();
    sub_100012F70();
    goto LABEL_11;
  }
  sub_100005280(a4);
  sub_100013040();
  return swift_arrayInitWithCopy();
}

uint64_t sub_100011BA8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_100012F34();
    sub_100012F80();
LABEL_11:
    uint64_t result = sub_100012FFC();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    sub_100012F34();
    sub_100012F70();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_100011C58(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_100012F34();
    sub_100012F80();
LABEL_11:
    uint64_t result = sub_100012FFC();
    __break(1u);
    return result;
  }
  if (a3 + 40 * a2 > a1 && a1 + 40 * a2 > a3)
  {
    sub_100012F34();
    sub_100012F70();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_100011D0C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    sub_100005280(&qword_100062A90);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_100011E0C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_100011E24(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for WeatherAlert);
}

uint64_t sub_100011E24(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void))
{
  if (a2 < 0)
  {
    sub_100012F34();
    sub_100012F80();
LABEL_11:
    uint64_t result = sub_100012FFC();
    __break(1u);
    return result;
  }
  uint64_t v6 = *(void *)(*(void *)(a4(0) - 8) + 72) * a2;
  unint64_t v7 = a3 + v6;
  unint64_t v8 = a1 + v6;
  if (v7 > a1 && v8 > a3)
  {
    sub_100012F34();
    sub_100012F70();
    goto LABEL_11;
  }
  sub_100013040();
  return swift_arrayInitWithCopy();
}

void *sub_100011F04(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000121D0(a1, a2, a3, *v3, &qword_100062AC8, (void (*)(unint64_t, uint64_t, unint64_t))sub_100033E3C, &qword_100062AD0);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

void *sub_100011F48(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000121D0(a1, a2, a3, *v3, &qword_100062AD8, (void (*)(unint64_t, uint64_t, unint64_t))sub_100033E3C, &qword_100062AE0);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_100011F8C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000122D0(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

unint64_t sub_100011FAC()
{
  unint64_t result = qword_100062A60;
  if (!qword_100062A60)
  {
    sub_1000080E4(&qword_100062618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062A60);
  }
  return result;
}

size_t sub_100012000(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_100012588(a1, a2, a3, *v3, &qword_100062A80, (uint64_t (*)(void))&type metadata accessor for URLQueryItem, (void (*)(unint64_t, uint64_t, unint64_t))sub_100033F00, (uint64_t (*)(void))&type metadata accessor for URLQueryItem);
  uint64_t *v3 = result;
  return result;
}

char *sub_100012064(char *a1, int64_t a2, char a3)
{
  size_t result = sub_1000123B8(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_100012084(char *a1, int64_t a2, char a3)
{
  size_t result = sub_1000124A4(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

size_t sub_1000120A4(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_100012588(a1, a2, a3, *v3, &qword_100062A78, (uint64_t (*)(void))&type metadata accessor for WeatherAlert, (void (*)(unint64_t, uint64_t, unint64_t))sub_1000340AC, (uint64_t (*)(void))&type metadata accessor for WeatherAlert);
  uint64_t *v3 = result;
  return result;
}

size_t sub_100012108(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_100012588(a1, a2, a3, *v3, &qword_100062A70, (uint64_t (*)(void))&type metadata accessor for SevereNotificationEntity, (void (*)(unint64_t, uint64_t, unint64_t))sub_1000340C4, (uint64_t (*)(void))&type metadata accessor for SevereNotificationEntity);
  uint64_t *v3 = result;
  return result;
}

size_t sub_10001216C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_100012588(a1, a2, a3, *v3, &qword_100062AC0, (uint64_t (*)(void))type metadata accessor for CloudChannelSubscription, (void (*)(unint64_t, uint64_t, unint64_t))sub_1000340DC, (uint64_t (*)(void))type metadata accessor for CloudChannelSubscription);
  uint64_t *v3 = result;
  return result;
}

void *sub_1000121D0(void *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(unint64_t, uint64_t, unint64_t), uint64_t *a7)
{
  char v10 = (char)result;
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (v14)
  {
    sub_100005280(a5);
    uint64_t v15 = (void *)swift_allocObject();
    size_t v16 = j__malloc_size(v15);
    v15[2] = v13;
    v15[3] = 2 * ((uint64_t)(v16 - 32) / 40);
  }
  else
  {
    uint64_t v15 = _swiftEmptyArrayStorage;
  }
  unint64_t v17 = (unint64_t)(v15 + 4);
  unint64_t v18 = a4 + 32;
  if (v10)
  {
    a6(v18, v13, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100011AE4(v18, v13, v17, a7);
  }
  swift_release();
  return v15;
}

char *sub_1000122D0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005280(&qword_100062A68);
    char v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    char v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100033EA4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100011BA8((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_1000123B8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005280(&qword_100062A98);
    char v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    char v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100033E40(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100011C58((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_1000124A4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005280(&qword_100062A88);
    char v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    char v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100034050(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100011D0C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_100012588(size_t result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), void (*a7)(unint64_t, uint64_t, unint64_t), uint64_t (*a8)(void))
{
  char v12 = result;
  if (a3)
  {
    unint64_t v13 = *(void *)(a4 + 24);
    uint64_t v14 = v13 >> 1;
    if ((uint64_t)(v13 >> 1) < a2)
    {
      if (v14 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }
      uint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v13 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v14 = a2;
      }
    }
  }
  else
  {
    uint64_t v14 = a2;
  }
  uint64_t v15 = *(void *)(a4 + 16);
  if (v14 <= v15) {
    uint64_t v16 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v16 = v14;
  }
  if (!v16)
  {
    uint64_t v20 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005280(a5);
  uint64_t v17 = *(void *)(a6(0) - 8);
  uint64_t v18 = *(void *)(v17 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v20);
  if (!v18)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v19 == 0x8000000000000000 && v18 == -1) {
    goto LABEL_24;
  }
  v20[2] = v15;
  v20[3] = 2 * ((uint64_t)(result - v19) / v18);
LABEL_19:
  uint64_t v22 = *(void *)(a6(0) - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v24 = (unint64_t)v20 + v23;
  unint64_t v25 = a4 + v23;
  if (v12)
  {
    a7(v25, v15, v24);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100011E24(v25, v15, v24, a8);
  }
  swift_release();
  return (size_t)v20;
}

uint64_t type metadata accessor for SevereMessage()
{
  uint64_t result = qword_100062B40;
  if (!qword_100062B40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001278C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000127E0(uint64_t a1)
{
  uint64_t v2 = sub_100005280((uint64_t *)&unk_1000628F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100012840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SevereMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000128A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100012900(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 28);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    a1[4] = a2[4];
    uint64_t v10 = type metadata accessor for Date();
    size_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_100012A10(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_100012A98(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  a1[4] = a2[4];
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *sub_100012B58(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_100012C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_100012CB0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_100012D5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100012D70);
}

uint64_t sub_100012D70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    return sub_1000093BC(v9, a2, v8);
  }
}

uint64_t sub_100012DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100012E0C);
}

uint64_t sub_100012E0C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Date();
    uint64_t v8 = v5 + *(int *)(a4 + 28);
    return sub_100008CEC(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_100012E8C()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100012F48()
{
  return *(void *)(v0 - 248);
}

uint64_t sub_100012F90()
{
  return v0;
}

uint64_t sub_100012FA4()
{
  return swift_slowDealloc();
}

uint64_t sub_100012FBC()
{
  return v0;
}

uint64_t sub_100012FD4()
{
  return swift_dynamicCast();
}

uint64_t sub_100012FFC()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100013028()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100013040()
{
  return v0;
}

void sub_100013054()
{
}

Swift::Int sub_10001307C()
{
  return Hasher._finalize()();
}

uint64_t sub_1000130C0()
{
  return 1;
}

Swift::Int sub_1000130D0()
{
  return Hasher._finalize()();
}

uint64_t sub_100013110()
{
  sub_100008AD0(v0 + 16);
  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for GeocodeWeatherService()
{
  return self;
}

uint64_t sub_10001316C(uint64_t a1, void *a2)
{
  sub_100005370((void *)(v2 + 16), *(void *)(v2 + 40));
  [a2 coordinate];
  dispatch thunk of WeatherDataServiceType.perform(requests:for:with:)();
  unint64_t v4 = (void *)zalgo.getter();
  type metadata accessor for LocationInfo();
  uint64_t v5 = Promise.then<A>(on:closure:)();
  swift_release();

  return v5;
}

uint64_t sub_100013228(uint64_t *a1)
{
  uint64_t v3 = type metadata accessor for WeatherDataResponse();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v61 = (uint64_t)v48 - v8;
  uint64_t v9 = type metadata accessor for LocationInfo();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v50 = (char *)v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v58 = (char *)v48 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  os_log_type_t v55 = (char *)v48 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v54 = (char *)v48 - v18;
  __chkstk_darwin(v17);
  uint64_t v49 = (char *)v48 - v19;
  uint64_t v20 = sub_100005280(&qword_100062C20);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  unint64_t v23 = (char *)v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v51 = (char *)v48 - v25;
  __chkstk_darwin(v24);
  uint64_t v52 = (uint64_t)v48 - v26;
  uint64_t v27 = *a1;
  uint64_t v28 = *(void *)(*a1 + 16);
  uint64_t v56 = v10;
  if (v28)
  {
    v48[0] = v27;
    v48[1] = v1;
    uint64_t v29 = v27 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v30 = *(void *)(v4 + 72);
    uint64_t v59 = (void (**)(char *, char *, uint64_t))(v10 + 32);
    swift_bridgeObjectRetain();
    uint64_t v60 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v53 = v7;
    uint64_t v57 = v3;
    unint64_t v31 = v59;
    do
    {
      uint64_t v32 = v61;
      sub_100013968(v29, v61);
      sub_100013968(v32, (uint64_t)v7);
      if (swift_getEnumCaseMultiPayload() == 7)
      {
        os_log_type_t v33 = *v31;
        uint64_t v34 = v55;
        (*v31)(v55, v7, v9);
        v33(v23, v34, v9);
        uint64_t v35 = 0;
      }
      else
      {
        sub_1000139CC((uint64_t)v7);
        uint64_t v35 = 1;
      }
      sub_100008CEC((uint64_t)v23, v35, 1, v9);
      sub_1000139CC(v61);
      if (sub_1000093BC((uint64_t)v23, 1, v9) == 1)
      {
        sub_100013A28((uint64_t)v23);
      }
      else
      {
        os_log_type_t v36 = *v59;
        uint64_t v37 = v54;
        (*v59)(v54, v23, v9);
        v36(v58, v37, v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v60 = (char *)sub_1000330B0(0, *((void *)v60 + 2) + 1, 1, (uint64_t)v60);
        }
        unint64_t v39 = *((void *)v60 + 2);
        unint64_t v38 = *((void *)v60 + 3);
        if (v39 >= v38 >> 1) {
          uint64_t v60 = (char *)sub_1000330B0(v38 > 1, v39 + 1, 1, (uint64_t)v60);
        }
        unint64_t v40 = v60;
        *((void *)v60 + 2) = v39 + 1;
        v36(&v40[((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v39], v58, v9);
        uint64_t v7 = v53;
      }
      v29 += v30;
      --v28;
    }
    while (v28);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v60 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v41 = (uint64_t)v51;
  uint64_t v42 = v52;
  sub_100013898((uint64_t)v60, (uint64_t (*)(void))&type metadata accessor for LocationInfo, v52);
  swift_bridgeObjectRelease();
  sub_100013A88(v42, v41);
  int v43 = sub_1000093BC(v41, 1, v9);
  uint64_t v44 = v56;
  if (v43 == 1)
  {
    sub_100013A28(v41);
    sub_100013AF0();
    swift_allocError();
    sub_100005280(&qword_100062C30);
    swift_allocObject();
    uint64_t v45 = Promise.init(error:)();
  }
  else
  {
    uint64_t v46 = v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 32))(v49, v41, v9);
    (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v50, v46, v9);
    sub_100005280(&qword_100062C30);
    swift_allocObject();
    uint64_t v45 = Promise.init(value:)();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v9);
  }
  sub_100013A28(v42);
  return v45;
}

uint64_t sub_100013800@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100013898(a1, (uint64_t (*)(void))&type metadata accessor for WeatherAlert, a2);
}

uint64_t sub_100013818(uint64_t a1)
{
  uint64_t result = sub_100013BB8(a1);
  if (v4) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  else {
    return sub_100013B3C(result, v3, 0, a1);
  }
}

uint64_t sub_100013880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100013898(a1, (uint64_t (*)(void))&type metadata accessor for SevereNotificationEntity, a2);
}

uint64_t sub_100013898@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = a2(0);
  uint64_t v7 = v6;
  if (v5)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a3, a1+ ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80)), v6);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }
  return sub_100008CEC(a3, v8, 1, v7);
}

uint64_t sub_100013944(uint64_t a1, void *a2)
{
  return sub_10001316C(a1, a2);
}

uint64_t sub_100013968(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WeatherDataResponse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000139CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WeatherDataResponse();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100013A28(uint64_t a1)
{
  uint64_t v2 = sub_100005280(&qword_100062C20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100013A88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005280(&qword_100062C20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100013AF0()
{
  unint64_t result = qword_100062C28;
  if (!qword_100062C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062C28);
  }
  return result;
}

uint64_t sub_100013B3C(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
  {
    uint64_t v4 = *(void *)(*(void *)(a4 + 48) + 16 * result);
    swift_bridgeObjectRetain();
    return v4;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_100013BB8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t getEnumTagSinglePayload for GeocodeWeatherService.Error(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for GeocodeWeatherService.Error(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100013D28);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100013D50()
{
  return 0;
}

ValueMetadata *type metadata accessor for GeocodeWeatherService.Error()
{
  return &type metadata for GeocodeWeatherService.Error;
}

unint64_t sub_100013D6C()
{
  unint64_t result = qword_100062C38;
  if (!qword_100062C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062C38);
  }
  return result;
}

uint64_t sub_100013DB8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEF72656469766F72;
  unint64_t v3 = 0x50746C7561666564;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD000000000000013;
    }
    else {
      unint64_t v5 = 0;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x8000000100052AC0;
    }
    else {
      unint64_t v6 = 0xE000000000000000;
    }
  }
  else
  {
    unint64_t v5 = 0x50746C7561666564;
    unint64_t v6 = 0xEF72656469766F72;
  }
  if (a2)
  {
    if (a2 == 1) {
      unint64_t v3 = 0xD000000000000013;
    }
    else {
      unint64_t v3 = 0;
    }
    if (a2 == 1) {
      unint64_t v2 = 0x8000000100052AC0;
    }
    else {
      unint64_t v2 = 0xE000000000000000;
    }
  }
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100013EB8()
{
  type metadata accessor for Severity();
  sub_100015C10(&qword_100062D00, (void (*)(uint64_t))&type metadata accessor for Severity);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t type metadata accessor for SevereNotificationContentFactory()
{
  return self;
}

uint64_t sub_100013FC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v159 = a4;
  uint64_t v154 = a3;
  uint64_t v163 = a1;
  uint64_t v6 = sub_100005280(&qword_1000626D8);
  uint64_t v7 = sub_100015EA4(v6);
  __chkstk_darwin(v7);
  sub_100013014();
  uint64_t v158 = v8;
  uint64_t v146 = type metadata accessor for Urgency();
  sub_1000053F4();
  uint64_t v145 = v9;
  __chkstk_darwin(v10);
  sub_100013014();
  uint64_t v142 = v11;
  uint64_t v144 = sub_100005280(&qword_100062CE0);
  __chkstk_darwin(v144);
  sub_100013014();
  uint64_t v148 = v12;
  uint64_t v13 = sub_100005280(&qword_100062CE8);
  uint64_t v14 = sub_100015EA4(v13);
  __chkstk_darwin(v14);
  sub_100015DF8();
  uint64_t v143 = v15;
  sub_100015E0C();
  __chkstk_darwin(v16);
  sub_100015E7C();
  __chkstk_darwin(v17);
  sub_100015EC4();
  sub_100015E34(v18);
  type metadata accessor for Severity();
  sub_1000053F4();
  uint64_t v152 = v20;
  uint64_t v153 = v19;
  __chkstk_darwin(v19);
  sub_100015DF8();
  uint64_t v151 = v21;
  sub_100015E0C();
  __chkstk_darwin(v22);
  sub_100015EC4();
  uint64_t v150 = v23;
  uint64_t v24 = sub_100005280(&qword_100062CF0);
  uint64_t v25 = sub_100015EA4(v24);
  __chkstk_darwin(v25);
  sub_100013014();
  uint64_t v156 = v26;
  uint64_t v168 = type metadata accessor for UUID();
  sub_1000053F4();
  uint64_t v166 = v27;
  __chkstk_darwin(v28);
  sub_100013014();
  uint64_t v167 = v29;
  uint64_t v30 = type metadata accessor for WeatherAlert();
  sub_1000053F4();
  uint64_t v162 = v31;
  __chkstk_darwin(v32);
  sub_100015DF8();
  uint64_t v155 = v33;
  sub_100015E0C();
  __chkstk_darwin(v34);
  uint64_t v157 = (char *)&v132 - v35;
  sub_100015E0C();
  __chkstk_darwin(v36);
  unint64_t v38 = (char *)&v132 - v37;
  uint64_t v39 = type metadata accessor for Location();
  sub_1000053F4();
  uint64_t v41 = v40;
  __chkstk_darwin(v42);
  sub_10000F9B8();
  uint64_t v45 = v44 - v43;
  uint64_t v46 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v48 = v47;
  __chkstk_darwin(v49);
  sub_10000F9B8();
  uint64_t v52 = v51 - v50;
  static Logger.notifications.getter();
  uint64_t v161 = a2;
  sub_10000FA20();
  v53();
  swift_bridgeObjectRetain_n();
  uint64_t v54 = Logger.logObject.getter();
  int v149 = static os_log_type_t.default.getter();
  BOOL v55 = os_log_type_enabled(v54, (os_log_type_t)v149);
  uint64_t v169 = v4;
  uint64_t v170 = v30;
  if (v55)
  {
    os_log_t v135 = v54;
    uint64_t v136 = v45;
    uint64_t v137 = v41;
    uint64_t v138 = v39;
    uint64_t v139 = v52;
    uint64_t v140 = v48;
    uint64_t v141 = v46;
    uint64_t v56 = (_DWORD *)swift_slowAlloc();
    uint64_t v133 = swift_slowAlloc();
    uint64_t v172 = v133;
    v134 = v56;
    *uint64_t v56 = 136446723;
    uint64_t v57 = *(void *)(v163 + 16);
    if (v57)
    {
      uint64_t v58 = *(void *)(v162 + 16);
      unint64_t v59 = v163 + ((*(unsigned __int8 *)(v162 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v162 + 80));
      uint64_t v164 = *(void *)(v162 + 72);
      uint64_t v165 = v58;
      uint64_t v60 = (void (**)(uint64_t, uint64_t))(v166 + 8);
      uint64_t v166 = v162 + 16;
      uint64_t v61 = (void (**)(char *, uint64_t))(v162 + 8);
      swift_bridgeObjectRetain();
      uint64_t v62 = _swiftEmptyArrayStorage;
      do
      {
        sub_10000FA20();
        v63();
        uint64_t v64 = v167;
        WeatherAlert.id.getter();
        uint64_t v65 = UUID.uuidString.getter();
        uint64_t v67 = v66;
        (*v60)(v64, v168);
        (*v61)(v38, v30);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100015E44();
          uint64_t v62 = v71;
        }
        unint64_t v69 = v62[2];
        unint64_t v68 = v62[3];
        if (v69 >= v68 >> 1)
        {
          sub_100033334(v68 > 1, v69 + 1, 1, (uint64_t)v62);
          uint64_t v62 = v72;
        }
        v62[2] = v69 + 1;
        os_log_type_t v70 = &v62[2 * v69];
        v70[4] = v65;
        v70[5] = v67;
        v59 += v164;
        --v57;
        uint64_t v4 = v169;
        uint64_t v30 = v170;
      }
      while (v57);
      uint64_t v74 = v163;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v74 = v163;
    }
    uint64_t v75 = v134;
    uint64_t v76 = Array.description.getter();
    unint64_t v78 = v77;
    swift_bridgeObjectRelease();
    uint64_t v171 = sub_1000466F4(v76, v78, &v172);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *((_WORD *)v75 + 6) = 2160;
    uint64_t v171 = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *((_WORD *)v75 + 11) = 2081;
    uint64_t v79 = Location.id.getter();
    uint64_t v171 = sub_1000466F4(v79, v80, &v172);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100012FF0();
    v81();
    os_log_t v82 = v135;
    _os_log_impl((void *)&_mh_execute_header, v135, (os_log_type_t)v149, "Creating notification content for alerts: %{public}s and location: %{private,mask.hash}s", (uint8_t *)v75, 0x20u);
    swift_arrayDestroy();
    sub_100012FA4();
    sub_100012FA4();

    (*(void (**)(uint64_t, uint64_t))(v140 + 8))(v139, v141);
  }
  else
  {
    uint64_t v73 = v163;
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v45, v39);

    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v52, v46);
    uint64_t v74 = v73;
  }
  uint64_t v83 = v160;
  uint64_t v84 = v161;
  uint64_t v85 = v162;
  uint64_t v86 = v156;
  sub_100013800(v74, v156);
  if (sub_1000093BC(v86, 1, v30) != 1)
  {
    sub_10000FA14();
    v90();
    uint64_t v168 = (uint64_t)sub_100014C78(v84, v83, v74);
    uint64_t v91 = v150;
    WeatherAlert.severity.getter();
    uint64_t v92 = v152;
    uint64_t v93 = v153;
    uint64_t v94 = v151;
    (*(void (**)(uint64_t, void, uint64_t))(v152 + 104))(v151, enum case for Severity.extreme(_:), v153);
    char v95 = sub_100013EB8();
    uint64_t v96 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
    v96(v94, v93);
    v96(v91, v93);
    sub_10000FA20();
    v97();
    if (v95)
    {
      uint64_t v98 = v146;
      uint64_t v99 = v4;
      uint64_t v100 = v147;
      WeatherAlert.urgency.getter();
      uint64_t v101 = v145;
      (*(void (**)(uint64_t, void, uint64_t))(v145 + 104))(v99, enum case for Urgency.immediate(_:), v98);
      sub_100008CEC(v99, 0, 1, v98);
      uint64_t v102 = v148;
      uint64_t v103 = v148 + *(int *)(v144 + 48);
      sub_100015BA8(v100, v148);
      sub_100015BA8(v99, v103);
      if (sub_1000093BC(v102, 1, v98) == 1)
      {
        sub_100015C58(v99, &qword_100062CE8);
        sub_100015C58(v100, &qword_100062CE8);
        uint64_t v104 = *(void (**)(void))(v85 + 8);
        sub_100015E18();
        v104();
        if (sub_1000093BC(v103, 1, v98) == 1)
        {
          sub_100015C58(v148, &qword_100062CE8);
          LODWORD(v167) = 1;
          uint64_t v105 = v160;
          uint64_t v169 = (uint64_t)v104;
LABEL_25:
          sub_1000159F4(v158);
          sub_100005370((void *)(v105 + 16), *(void *)(v105 + 40));
          uint64_t v116 = dispatch thunk of SevereNotificationStringBuilderType.title(for:)();
          uint64_t v118 = v117;
          sub_100005370((void *)(v105 + 16), *(void *)(v105 + 40));
          uint64_t v119 = dispatch thunk of SevereNotificationStringBuilderType.subtitle(for:)();
          uint64_t v121 = v120;
          sub_100005370((void *)(v105 + 16), *(void *)(v105 + 40));
          type metadata accessor for SevereMessage();
          uint64_t v122 = dispatch thunk of SevereNotificationStringBuilderType.body(for:at:timestamp:)();
          uint64_t v124 = v123;
          uint64_t v125 = Location.id.getter();
          uint64_t v127 = v126;
          sub_100015E18();
          v128();
          uint64_t v129 = v159;
          *uint64_t v159 = v116;
          v129[1] = v118;
          v129[2] = v119;
          v129[3] = v121;
          v129[4] = v122;
          v129[5] = v124;
          v129[6] = v125;
          v129[7] = v127;
          v129[8] = v168;
          *((unsigned char *)v129 + 72) = v167 & 1;
          uint64_t v130 = type metadata accessor for SevereNotificationContent();
          sub_100015B40(v158, (uint64_t)v129 + *(int *)(v130 + 40));
          uint64_t v88 = (uint64_t)v129;
          uint64_t v89 = 0;
          uint64_t v87 = v130;
          return sub_100008CEC(v88, v89, 1, v87);
        }
        uint64_t v108 = (uint64_t)v104;
        uint64_t v105 = v160;
        uint64_t v111 = v148;
      }
      else
      {
        sub_100015BA8(v102, v143);
        if (sub_1000093BC(v103, 1, v98) != 1)
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v101 + 32))(v142, v103, v98);
          sub_100015C10(&qword_100062CF8, (void (*)(uint64_t))&type metadata accessor for Urgency);
          LODWORD(v167) = dispatch thunk of static Equatable.== infix(_:_:)();
          uint64_t v112 = v102;
          uint64_t v113 = *(void (**)(void))(v101 + 8);
          sub_100015E24();
          v113();
          sub_100015C58(v169, &qword_100062CE8);
          sub_100015C58(v147, &qword_100062CE8);
          sub_100015E90();
          uint64_t v169 = v114;
          sub_100015E18();
          v115();
          sub_100015E24();
          v113();
          sub_100015C58(v112, &qword_100062CE8);
          uint64_t v105 = v160;
          goto LABEL_25;
        }
        sub_100015C58(v169, &qword_100062CE8);
        sub_100015C58(v147, &qword_100062CE8);
        sub_100015E90();
        uint64_t v108 = v107;
        sub_100015E18();
        v109();
        sub_100015E24();
        v110();
        uint64_t v105 = v160;
        uint64_t v111 = v102;
      }
      uint64_t v169 = v108;
      sub_100015C58(v111, &qword_100062CE0);
      LODWORD(v167) = 0;
      goto LABEL_25;
    }
    uint64_t v169 = *(void *)(v85 + 8);
    sub_100015E18();
    v106();
    LODWORD(v167) = 0;
    uint64_t v105 = v160;
    goto LABEL_25;
  }
  sub_100015C58(v86, &qword_100062CF0);
  uint64_t v87 = type metadata accessor for SevereNotificationContent();
  uint64_t v88 = (uint64_t)v159;
  uint64_t v89 = 1;
  return sub_100008CEC(v88, v89, 1, v87);
}

void *sub_100014C78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = &_swiftEmptyDictionarySingleton;
  *((void *)&v9 + 1) = &type metadata for String;
  *(void *)&long long v8 = Location.id.getter();
  *((void *)&v8 + 1) = v4;
  sub_100014D34((uint64_t)&v8, 0x6E6F697461636F4CLL, 0xE800000000000000);
  uint64_t v5 = sub_100014DC8(a3);
  if (v6)
  {
    *((void *)&v9 + 1) = &type metadata for String;
    *(void *)&long long v8 = v5;
    *((void *)&v8 + 1) = v6;
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  sub_100014D34((uint64_t)&v8, 0x55736C6961746544, 0xEA00000000004C52);
  return v10;
}

uint64_t sub_100014D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_100015DE8((_OWORD *)a1, v6);
    sub_10002515C();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_100015C58(a1, (uint64_t *)&unk_1000628F0);
    sub_100015CB0(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_100015C58((uint64_t)v6, (uint64_t *)&unk_1000628F0);
  }
}

uint64_t sub_100014DC8(uint64_t a1)
{
  uint64_t v122 = type metadata accessor for URLQueryItem();
  sub_1000053F4();
  uint64_t v129 = v3;
  __chkstk_darwin(v4);
  sub_100015DF8();
  uint64_t v117 = v5;
  sub_100015E0C();
  __chkstk_darwin(v6);
  sub_100015E7C();
  __chkstk_darwin(v7);
  uint64_t v128 = (char *)&v115 - v8;
  sub_100015E0C();
  __chkstk_darwin(v9);
  sub_100015EC4();
  uint64_t v130 = v10;
  uint64_t v11 = sub_100005280(&qword_100062D08);
  uint64_t v12 = sub_100015EA4(v11);
  __chkstk_darwin(v12);
  sub_100013014();
  sub_100015E34(v13);
  uint64_t v121 = type metadata accessor for URLComponents();
  sub_1000053F4();
  uint64_t v118 = v14;
  __chkstk_darwin(v15);
  sub_100013014();
  sub_100015E34(v16);
  type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v126 = v18;
  uint64_t v127 = v17;
  __chkstk_darwin(v17);
  sub_100015DF8();
  uint64_t v116 = v19;
  sub_100015E0C();
  __chkstk_darwin(v20);
  uint64_t v115 = (char *)&v115 - v21;
  sub_100015E0C();
  __chkstk_darwin(v22);
  sub_100015EC4();
  uint64_t v124 = v23;
  uint64_t v136 = (void (**)(void))type metadata accessor for UUID();
  sub_1000053F4();
  uint64_t v25 = v24;
  __chkstk_darwin(v26);
  sub_10000F9B8();
  uint64_t v138 = type metadata accessor for WeatherAlert();
  sub_1000053F4();
  uint64_t v28 = v27;
  __chkstk_darwin(v29);
  sub_100015DF8();
  uint64_t v137 = v30;
  sub_100015E0C();
  __chkstk_darwin(v31);
  uint64_t v33 = (char *)&v115 - v32;
  int64_t v34 = *(void *)(a1 + 16);
  uint64_t v35 = _swiftEmptyArrayStorage;
  uint64_t v123 = v1;
  uint64_t v125 = a1;
  uint64_t v131 = v28;
  int64_t v120 = v34;
  if (v34)
  {
    v139[0] = (uint64_t)_swiftEmptyArrayStorage;
    sub_100011F8C(0, v34, 0);
    uint64_t v37 = *(void (**)(void))(v28 + 16);
    uint64_t v36 = v28 + 16;
    uint64_t v38 = a1 + ((*(unsigned __int8 *)(v36 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 64));
    uint64_t v133 = *(void *)(v36 + 56);
    v134 = v37;
    uint64_t v132 = v25 + 8;
    uint64_t v135 = v36;
    uint64_t v39 = (void (**)(char *, uint64_t))(v36 - 8);
    int64_t v40 = v34;
    do
    {
      uint64_t v41 = v138;
      sub_10000FA20();
      v42();
      WeatherAlert.id.getter();
      uint64_t v43 = UUID.uuidString.getter();
      uint64_t v45 = v44;
      sub_100012FF0();
      v46();
      (*v39)(v33, v41);
      uint64_t v35 = (void *)v139[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        uint64_t v47 = (char *)sub_100015EB0();
        sub_100011F8C(v47, v48, v49);
        uint64_t v35 = (void *)v139[0];
      }
      unint64_t v51 = v35[2];
      unint64_t v50 = v35[3];
      if (v51 >= v50 >> 1)
      {
        sub_100011F8C((char *)(v50 > 1), v51 + 1, 1);
        uint64_t v35 = (void *)v139[0];
      }
      v35[2] = v51 + 1;
      uint64_t v52 = &v35[2 * v51];
      v52[4] = v43;
      v52[5] = v45;
      v38 += v133;
      --v40;
    }
    while (v40);
    char v1 = v123;
  }
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v35;
  uint64_t v54 = Logger.logObject.getter();
  os_log_type_t v55 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    v139[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v56 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v57 = Array.description.getter();
    unint64_t v59 = v58;
    swift_bridgeObjectRelease();
    uint64_t v60 = sub_1000466F4(v57, v59, v139);
    sub_100015E68(v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v54, v55, "Creating weather alert details URL based with identifiers: %s", v56, 0xCu);
    swift_arrayDestroy();
    sub_100012FA4();
    sub_100012FA4();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v61 = *(void (**)(void))(v126 + 8);
  sub_100015E18();
  v61();
  uint64_t v62 = v129;
  uint64_t v63 = _swiftEmptyArrayStorage;
  uint64_t v135 = (uint64_t)v53;
  int64_t v64 = v120;
  if (v120)
  {
    v134 = v61;
    uint64_t v65 = v131 + 16;
    uint64_t v136 = *(void (***)(void))(v131 + 16);
    uint64_t v66 = v125 + ((*(unsigned __int8 *)(v131 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80));
    uint64_t v67 = *(void *)(v131 + 72);
    unint64_t v68 = (void (**)(uint64_t, uint64_t))(v131 + 8);
    swift_bridgeObjectRetain();
    uint64_t v131 = v65;
    uint64_t v69 = v137;
    do
    {
      uint64_t v70 = v138;
      ((void (*)(uint64_t, uint64_t, uint64_t))v136)(v69, v66, v138);
      uint64_t v71 = WeatherAlert.detailsUrl.getter();
      uint64_t v73 = v72;
      (*v68)(v69, v70);
      if (v73)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100015E44();
          uint64_t v63 = v77;
        }
        unint64_t v75 = v63[2];
        unint64_t v74 = v63[3];
        if (v75 >= v74 >> 1)
        {
          sub_100033334(v74 > 1, v75 + 1, 1, (uint64_t)v63);
          uint64_t v63 = v78;
        }
        v63[2] = v75 + 1;
        uint64_t v76 = &v63[2 * v75];
        v76[4] = v71;
        v76[5] = v73;
      }
      v66 += v67;
      --v64;
    }
    while (v64);
    swift_bridgeObjectRelease();
    uint64_t v62 = v129;
    uint64_t v61 = v134;
    char v1 = v123;
  }
  uint64_t v79 = v121;
  if (!v63[2])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v88 = v116;
    static Logger.notifications.getter();
    uint64_t v89 = Logger.logObject.getter();
    os_log_type_t v90 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v89, v90))
    {
      uint64_t v91 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v91 = 0;
      _os_log_impl((void *)&_mh_execute_header, v89, v90, "None of the weather alerts specify detail URLs", v91, 2u);
      sub_100012FA4();
    }

    uint64_t v92 = v88;
    goto LABEL_48;
  }
  uint64_t v81 = v63[4];
  unint64_t v80 = v63[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v82 = v119;
  URLComponents.init(string:)();
  if (sub_1000093BC(v82, 1, v79) == 1)
  {
    swift_bridgeObjectRelease();
    sub_100015C58(v82, &qword_100062D08);
    uint64_t v83 = v115;
    static Logger.notifications.getter();
    swift_bridgeObjectRetain();
    uint64_t v84 = Logger.logObject.getter();
    os_log_type_t v85 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = (uint8_t *)swift_slowAlloc();
      v139[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v86 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v87 = sub_1000466F4(v81, v80, v139);
      sub_100015E68(v87);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v84, v85, "Failed to construct components from URL: %s", v86, 0xCu);
      swift_arrayDestroy();
      sub_100012FA4();
      sub_100012FA4();

      sub_100015E18();
      v61();
      return 0;
    }

    swift_bridgeObjectRelease_n();
    uint64_t v92 = v83;
LABEL_48:
    ((void (*)(char *, uint64_t))v61)(v92, v127);
    return 0;
  }
  swift_bridgeObjectRelease();
  sub_10000FA14();
  v93();
  uint64_t v94 = URLComponents.queryItems.getter();
  if (v94)
  {
    uint64_t v95 = v94;
    unint64_t v96 = (unint64_t)_swiftEmptyArrayStorage;
    v139[0] = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v97 = v122;
    uint64_t v98 = v135;
    uint64_t v138 = *(void *)(v94 + 16);
    if (v138)
    {
      unint64_t v96 = 0;
      uint64_t v136 = (void (**)(void))(v62 + 32);
      uint64_t v137 = v62 + 16;
      char v1 = (void (**)(uint64_t, uint64_t))(v62 + 8);
      while (1)
      {
        if (v96 >= *(void *)(v95 + 16))
        {
          __break(1u);
LABEL_60:
          unint64_t v96 = sub_1000330F8(0, *(void *)(v96 + 16) + 1, 1, v96);
LABEL_54:
          unint64_t v112 = *(void *)(v96 + 16);
          unint64_t v111 = *(void *)(v96 + 24);
          if (v112 >= v111 >> 1) {
            unint64_t v96 = sub_1000330F8(v111 > 1, v112 + 1, 1, v96);
          }
          *(void *)(v96 + 16) = v112 + 1;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v62 + 32))(v96+ ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80))+ *(void *)(v62 + 72) * v112, v117, v97);
          goto LABEL_57;
        }
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v62 + 16))(v130, v95+ ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80))+ *(void *)(v62 + 72) * v96, v97);
        if (URLQueryItem.name.getter() == 7562345 && v99 == 0xE300000000000000)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v101 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v101 & 1) == 0)
          {
            uint64_t v102 = *v136;
            sub_10000FA14();
            v102();
            uint64_t v103 = v139[0];
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              size_t v104 = sub_100015EB0();
              sub_100012000(v104, v105, v106);
              uint64_t v103 = v139[0];
            }
            unint64_t v108 = *(void *)(v103 + 16);
            unint64_t v107 = *(void *)(v103 + 24);
            uint64_t v98 = v135;
            if (v108 >= v107 >> 1)
            {
              sub_100012000(v107 > 1, v108 + 1, 1);
              uint64_t v98 = v135;
              uint64_t v103 = v139[0];
            }
            *(void *)(v103 + 16) = v108 + 1;
            uint64_t v97 = v122;
            sub_10000FA14();
            v102();
            v139[0] = v103;
            uint64_t v62 = v129;
            goto LABEL_45;
          }
        }
        (*v1)(v130, v97);
        uint64_t v98 = v135;
LABEL_45:
        if (v138 == ++v96)
        {
          unint64_t v96 = v139[0];
          char v1 = v123;
          break;
        }
      }
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v96 = 0;
    uint64_t v97 = v122;
    uint64_t v98 = v135;
  }
  v139[0] = v98;
  sub_100005280(&qword_100062618);
  sub_100011FAC();
  BidirectionalCollection<>.joined(separator:)();
  swift_bridgeObjectRelease();
  URLQueryItem.init(name:value:)();
  swift_bridgeObjectRelease();
  if (v96)
  {
    sub_10000FA20();
    v110();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_60;
    }
    goto LABEL_54;
  }
LABEL_57:
  swift_bridgeObjectRetain();
  URLComponents.queryItems.setter();
  uint64_t v109 = URLComponents.string.getter();
  (*(void (**)(void, uint64_t))(v62 + 8))(v1, v97);
  sub_100012FF0();
  v113();
  swift_bridgeObjectRelease();
  return v109;
}

uint64_t sub_1000159F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v13 - v7;
  WeatherAlert.expireTime.getter();
  Date.init()();
  char v9 = static Date.> infix(_:_:)();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v10(v8, v2);
  if (v9)
  {
    WeatherAlert.expireTime.getter();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 1;
  }
  return sub_100008CEC(a1, v11, 1, v2);
}

uint64_t sub_100015B40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005280(&qword_1000626D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100015BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005280(&qword_100062CE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100015C10(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100015C58(uint64_t a1, uint64_t *a2)
{
  sub_100005280(a2);
  sub_100012FF0();
  v3();
  return a1;
}

double sub_100015CB0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100024F3C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v4;
    uint64_t v11 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    Swift::Int v12 = *(void *)(v11 + 24);
    sub_100005280(&qword_100062D10);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v12);
    swift_bridgeObjectRelease();
    sub_100015DE8((_OWORD *)(*(void *)(v14 + 56) + 32 * v8), a3);
    _NativeDictionary._delete(at:)();
    uint64_t *v4 = v14;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

_OWORD *sub_100015DE8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100015E34@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

void sub_100015E44()
{
  uint64_t v2 = *(void *)(v0 + 16) + 1;
  sub_100033334(0, v2, 1, v0);
}

uint64_t sub_100015E68(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t sub_100015E90()
{
  return *(void *)(v0 - 232);
}

uint64_t sub_100015EA4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100015EB0()
{
  return 0;
}

uint64_t sub_100015ED0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = _swiftEmptyArrayStorage;
  uint64_t v17 = _swiftEmptyArrayStorage;
  uint64_t v6 = *(void **)(a3 + 16);
  if (v6)
  {
    uint64_t v7 = (uint64_t (*)(long long *))result;
    uint64_t v5 = 0;
    uint64_t v8 = a3 + 32;
    char v9 = _swiftEmptyArrayStorage;
    uint64_t v13 = *(void **)(a3 + 16);
    uint64_t v14 = (uint64_t (*)(long long *))result;
    while ((unint64_t)v5 < *(void *)(a3 + 16))
    {
      sub_100008A6C(v8, (uint64_t)v16);
      char v10 = v7(v16);
      if (v3)
      {
        sub_100008AD0((uint64_t)v16);
        swift_release();
        swift_bridgeObjectRelease();
        return (uint64_t)v5;
      }
      if (v10)
      {
        sub_100008E88(v16, (uint64_t)v15);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_100011F04(0, v9[2] + 1, 1);
        }
        char v9 = v17;
        unint64_t v12 = v17[2];
        unint64_t v11 = v17[3];
        if (v12 >= v11 >> 1)
        {
          sub_100011F04((void *)(v11 > 1), v12 + 1, 1);
          char v9 = v17;
        }
        v9[2] = v12 + 1;
        double result = sub_100008E88(v15, (uint64_t)&v9[5 * v12 + 4]);
        uint64_t v6 = v13;
        uint64_t v7 = v14;
      }
      else
      {
        double result = sub_100008AD0((uint64_t)v16);
      }
      uint64_t v5 = (void *)((char *)v5 + 1);
      v8 += 40;
      if (v6 == v5)
      {
        uint64_t v5 = v17;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return (uint64_t)v5;
  }
  return result;
}

uint64_t sub_10001605C(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = a2;
  uint64_t v40 = type metadata accessor for Logger();
  uint64_t result = __chkstk_darwin(v40);
  uint64_t v7 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    unint64_t v9 = 0;
    uint64_t v38 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v39 = v8;
    uint64_t v10 = a1 + 64;
    uint64_t v31 = v8 - 1;
    uint64_t v33 = _swiftEmptyArrayStorage;
    *(void *)&long long v6 = 136446210;
    long long v36 = v6;
    int64_t v34 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v35 = (char *)&type metadata for Any + 8;
    uint64_t v37 = a1;
    uint64_t v32 = a1 + 64;
    do
    {
      unint64_t v11 = (uint64_t *)(v10 + 40 * v9);
      while (1)
      {
        if (v9 >= *(void *)(a1 + 16))
        {
          __break(1u);
          return result;
        }
        uint64_t v12 = *(v11 - 4);
        unint64_t v13 = *(v11 - 3);
        uint64_t v14 = *(v11 - 2);
        uint64_t v15 = *(v11 - 1);
        uint64_t v16 = *v11;
        *(void *)&long long v44 = v12;
        *((void *)&v44 + 1) = v13;
        *(void *)&long long v45 = v14;
        *((void *)&v45 + 1) = v15;
        uint64_t v46 = v16;
        unint64_t v42 = v9 + 1;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((sub_1000198B8((uint64_t *)&v44) & 1) == 0) {
          break;
        }
        static Logger.notifications.getter();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v17 = Logger.logObject.getter();
        uint64_t v18 = v7;
        os_log_type_t v19 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v17, v19))
        {
          uint64_t v20 = swift_slowAlloc();
          uint64_t v43 = swift_slowAlloc();
          *(_DWORD *)uint64_t v20 = v36;
          swift_bridgeObjectRetain();
          *(void *)(v20 + 4) = sub_1000466F4(v12, v13, &v43);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v17, v19, "Previously handled event with identifier: %{public}s", (uint8_t *)v20, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          a1 = v37;
          swift_slowDealloc();

          uint64_t v7 = v34;
          (*v38)(v34, v40);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          (*v38)(v18, v40);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          uint64_t v7 = v18;
        }
        v11 += 5;
        unint64_t v9 = v42;
        if (v39 == v42) {
          goto LABEL_19;
        }
      }
      uint64_t v21 = v7;
      uint64_t v22 = v33;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v23 = v22;
      uint64_t v47 = v22;
      uint64_t v24 = a1;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_100012064(0, v22[2] + 1, 1);
        uint64_t v23 = v47;
      }
      unint64_t v26 = v23[2];
      unint64_t v25 = v23[3];
      if (v26 >= v25 >> 1)
      {
        uint64_t result = (uint64_t)sub_100012064((char *)(v25 > 1), v26 + 1, 1);
        uint64_t v23 = v47;
      }
      v23[2] = v26 + 1;
      uint64_t v33 = v23;
      uint64_t v27 = &v23[5 * v26];
      long long v28 = v44;
      long long v29 = v45;
      v27[8] = v46;
      *((_OWORD *)v27 + 2) = v28;
      *((_OWORD *)v27 + 3) = v29;
      uint64_t v10 = v32;
      BOOL v30 = v31 == v9;
      a1 = v24;
      uint64_t v7 = v21;
      unint64_t v9 = v42;
    }
    while (!v30);
  }
  else
  {
    uint64_t v33 = _swiftEmptyArrayStorage;
  }
LABEL_19:
  swift_release();
  swift_bridgeObjectRelease();
  return (uint64_t)v33;
}

uint64_t sub_100016474(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = (uint64_t (*)(void *))result;
  uint64_t v15 = *(void *)(a3 + 16);
  if (v15)
  {
    unint64_t v4 = 0;
    uint64_t v5 = (_OWORD *)(a3 + 56);
    long long v6 = _swiftEmptyArrayStorage;
    uint64_t v14 = a3;
    while (v4 < *(void *)(a3 + 16))
    {
      uint64_t v7 = *((void *)v5 - 3);
      uint64_t v8 = *((void *)v5 - 2);
      uint64_t v9 = *((void *)v5 - 1);
      long long v17 = *v5;
      v18[0] = v7;
      v18[1] = v8;
      void v18[2] = v9;
      long long v19 = v17;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v10 = v16(v18);
      if (v3)
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return (uint64_t)v6;
      }
      if (v10)
      {
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v20 = v6;
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_100012064(0, v6[2] + 1, 1);
          long long v6 = v20;
        }
        unint64_t v12 = v6[2];
        unint64_t v11 = v6[3];
        uint64_t v3 = 0;
        if (v12 >= v11 >> 1)
        {
          uint64_t result = (uint64_t)sub_100012064((char *)(v11 > 1), v12 + 1, 1);
          uint64_t v3 = 0;
          long long v6 = v20;
        }
        _OWORD v6[2] = v12 + 1;
        unint64_t v13 = &v6[5 * v12];
        v13[4] = v7;
        v13[5] = v8;
        v13[6] = v9;
        *(_OWORD *)(v13 + 7) = v17;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v3 = 0;
      }
      ++v4;
      uint64_t v5 = (_OWORD *)((char *)v5 + 40);
      a3 = v14;
      if (v15 == v4) {
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
    long long v6 = _swiftEmptyArrayStorage;
LABEL_15:
    swift_bridgeObjectRelease();
    return (uint64_t)v6;
  }
  return result;
}

uint64_t sub_100016654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a3;
  uint64_t v25 = type metadata accessor for WeatherAlert();
  uint64_t v6 = *(void *)(v25 - 8);
  uint64_t v7 = __chkstk_darwin(v25);
  BOOL v30 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v22 - v10;
  unint64_t v12 = _swiftEmptyArrayStorage;
  uint64_t v32 = _swiftEmptyArrayStorage;
  uint64_t v29 = *(void *)(a1 + 16);
  if (v29)
  {
    unint64_t v13 = 0;
    uint64_t v23 = a2;
    uint64_t v24 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v27 = (void (**)(char *, char *, uint64_t))(v6 + 32);
    uint64_t v28 = v6 + 16;
    uint64_t v22 = a1;
    uint64_t v14 = v25;
    while (v13 < *(void *)(a1 + 16))
    {
      unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v16 = *(void *)(v6 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, a1 + v15 + v16 * v13, v14);
      char v17 = sub_10001ECF0((unint64_t)v11, a2, v31);
      if (v3)
      {
        (*v24)(v11, v14);
        swift_bridgeObjectRelease();
        unint64_t v12 = v32;
        swift_bridgeObjectRelease();
        swift_release();
        return (uint64_t)v12;
      }
      if (v17)
      {
        unint64_t v26 = *v27;
        v26(v30, v11, v14);
        uint64_t v18 = v32;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000120A4(0, v18[2] + 1, 1);
          uint64_t v18 = v32;
        }
        unint64_t v20 = v18[2];
        unint64_t v19 = v18[3];
        if (v20 >= v19 >> 1)
        {
          sub_1000120A4(v19 > 1, v20 + 1, 1);
          uint64_t v18 = v32;
        }
        void v18[2] = v20 + 1;
        uint64_t v21 = v25;
        uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v26)((char *)v18 + v15 + v20 * v16, v30, v25);
        uint64_t v32 = v18;
        uint64_t v14 = v21;
        a1 = v22;
        a2 = v23;
      }
      else
      {
        uint64_t result = ((uint64_t (*)(char *, uint64_t))*v24)(v11, v14);
      }
      if (v29 == ++v13)
      {
        unint64_t v12 = v32;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v12;
  }
  return result;
}

void *sub_100016920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_100005280(&qword_100062F68);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100005280(&qword_100062E98);
  uint64_t v24 = *(void *)(v26 - 8);
  uint64_t v10 = __chkstk_darwin(v26);
  uint64_t v25 = (uint64_t)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)v22 - v12;
  uint64_t v14 = *(void *)(a1 + 16);
  if (v14)
  {
    uint64_t v15 = *(void *)(type metadata accessor for NotificationSubscription.Location() - 8);
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    uint64_t v17 = *(void *)(v15 + 72);
    v22[1] = a1;
    swift_bridgeObjectRetain();
    uint64_t v18 = _swiftEmptyArrayStorage;
    v22[2] = a3;
    uint64_t v23 = a2;
    while (1)
    {
      sub_100019E3C(v16, a2, (uint64_t)v9);
      if (v3) {
        break;
      }
      if (sub_1000093BC((uint64_t)v9, 1, v26) == 1)
      {
        sub_1000277BC((uint64_t)v9, &qword_100062F68);
      }
      else
      {
        sub_10002774C((uint64_t)v9, (uint64_t)v13, &qword_100062E98);
        sub_10002774C((uint64_t)v13, v25, &qword_100062E98);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v18 = (void *)sub_1000333B0(0, v18[2] + 1, 1, (uint64_t)v18);
        }
        unint64_t v20 = v18[2];
        unint64_t v19 = v18[3];
        if (v20 >= v19 >> 1) {
          uint64_t v18 = (void *)sub_1000333B0(v19 > 1, v20 + 1, 1, (uint64_t)v18);
        }
        void v18[2] = v20 + 1;
        sub_10002774C(v25, (uint64_t)v18+ ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))+ *(void *)(v24 + 72) * v20, &qword_100062E98);
        a2 = v23;
      }
      v16 += v17;
      if (!--v14)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v18;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  return v18;
}

void *sub_100016C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005280(&qword_100062CF0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WeatherAlert();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v33 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v31 = (char *)&v29 - v13;
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14)
  {
    swift_release();
    return _swiftEmptyArrayStorage;
  }
  uint64_t v34 = a2;
  uint64_t v15 = *(void *)(type metadata accessor for SevereNotificationEntity() - 8);
  uint64_t v16 = v10;
  uint64_t v17 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  uint64_t v18 = *(void *)(v15 + 72);
  uint64_t v29 = a1;
  uint64_t v30 = v16;
  uint64_t v32 = (void (**)(char *, char *, uint64_t))(v16 + 32);
  swift_bridgeObjectRetain();
  uint64_t v37 = _swiftEmptyArrayStorage;
  while (1)
  {
    SevereNotificationEntity.replacementAlert.getter();
    dispatch thunk of Column.value.getter();
    swift_release();
    unint64_t v19 = v36;
    sub_10000F430(v35, v36);
    if (v19 != 1) {
      goto LABEL_7;
    }
    SevereNotificationEntity.alert.getter();
    dispatch thunk of Column.value.getter();
    uint64_t result = (void *)swift_release();
    unint64_t v21 = v36;
    if (v36 >> 60 == 15) {
      break;
    }
    uint64_t v22 = v35;
    sub_1000278CC(&qword_100062F10, 255, (void (*)(uint64_t))&type metadata accessor for WeatherAlert);
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    if (!v3)
    {
      sub_100008D74(v22, v21);
      sub_100008CEC((uint64_t)v8, 0, 1, v9);
      uint64_t v23 = v31;
      uint64_t v24 = *v32;
      (*v32)(v31, v8, v9);
      v24(v33, v23, v9);
      if (swift_isUniquelyReferenced_nonNull_native()) {
        uint64_t v25 = v37;
      }
      else {
        uint64_t v25 = (void *)sub_10003358C(0, v37[2] + 1, 1, (uint64_t)v37);
      }
      unint64_t v27 = v25[2];
      unint64_t v26 = v25[3];
      if (v27 >= v26 >> 1) {
        uint64_t v25 = (void *)sub_10003358C(v26 > 1, v27 + 1, 1, (uint64_t)v25);
      }
      void v25[2] = v27 + 1;
      unint64_t v28 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
      uint64_t v37 = v25;
      v24((char *)v25 + v28 + *(void *)(v30 + 72) * v27, v33, v9);
      goto LABEL_8;
    }
    swift_errorRelease();
    sub_100008D74(v22, v21);
    uint64_t v3 = 0;
LABEL_7:
    sub_100008CEC((uint64_t)v8, 1, 1, v9);
    sub_1000277BC((uint64_t)v8, &qword_100062CF0);
LABEL_8:
    v17 += v18;
    if (!--v14)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return v37;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10001701C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  uint64_t v2 = a1;
  sub_100012084(0, v1, 0);
  uint64_t result = sub_1000273AC(v2);
  if ((result & 0x8000000000000000) == 0)
  {
    unint64_t v5 = result;
    if (result < 1 << *(unsigned char *)(v2 + 32))
    {
      int v6 = v4;
      uint64_t v7 = v2 + 64;
      uint64_t v12 = v2 + 64;
      while ((*(void *)(v7 + 8 * (v5 >> 6)) & (1 << v5)) != 0)
      {
        if (v6 != *(_DWORD *)(v2 + 36)) {
          goto LABEL_18;
        }
        int64_t v13 = v1;
        uint64_t v8 = *(void *)(*(void *)(v2 + 56) + 8 * v5);
        uint64_t v9 = v2;
        unint64_t v11 = _swiftEmptyArrayStorage[2];
        unint64_t v10 = _swiftEmptyArrayStorage[3];
        uint64_t result = swift_bridgeObjectRetain();
        if (v11 >= v10 >> 1) {
          uint64_t result = (uint64_t)sub_100012084((char *)(v10 > 1), v11 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v11 + 1;
        _swiftEmptyArrayStorage[v11 + 4] = v8;
        if ((uint64_t)v5 >= -(-1 << *(unsigned char *)(v9 + 32))) {
          goto LABEL_19;
        }
        uint64_t v7 = v12;
        if ((*(void *)(v12 + 8 * (v5 >> 6)) & (1 << v5)) == 0) {
          goto LABEL_20;
        }
        uint64_t v2 = v9;
        if (v6 != *(_DWORD *)(v9 + 36)) {
          goto LABEL_21;
        }
        uint64_t result = _HashTable.occupiedBucket(after:)();
        int64_t v1 = v13 - 1;
        if (v13 == 1) {
          return (uint64_t)_swiftEmptyArrayStorage;
        }
        unint64_t v5 = result;
        if ((result & 0x8000000000000000) == 0)
        {
          int v6 = *(_DWORD *)(v2 + 36);
          if (result < 1 << *(unsigned char *)(v2 + 32)) {
            continue;
          }
        }
        goto LABEL_22;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
    }
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_1000171D8()
{
  return sub_1000171FC();
}

uint64_t sub_1000171FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005280(&qword_100062E30);
  __chkstk_darwin(v2 - 8);
  int v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for NotificationSubscription();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for DispatchPredicate();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (uint64_t *)&v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  *uint64_t v12 = static OS_dispatch_queue.notifications.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v10 + 104))(v12, enum case for DispatchPredicate.onQueue(_:), v9);
  char v13 = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v10 + 8))(v12, v9);
  if ((v13 & 1) == 0)
  {
    __break(1u);
    return result;
  }
  sub_100005370((void *)(v1 + 336), *(void *)(v1 + 360));
  if ((dispatch thunk of NotificationAuthorizationStatusProviderType.hasNotificationAuthorization()() & 1) == 0) {
    return sub_10001FE94();
  }
  sub_100005370((void *)(v1 + 216), *(void *)(v1 + 240));
  static Location.currentLocationID.getter();
  dispatch thunk of NotificationSubscriptionManagerType.subscription(with:)();
  swift_bridgeObjectRelease();
  if (sub_1000093BC((uint64_t)v4, 1, v5) == 1)
  {
    sub_1000277BC((uint64_t)v4, &qword_100062E30);
    return sub_10001FE94();
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32))(v8, v4, v5);
  if ((NotificationSubscription.severeEnabled.getter() & 1) == 0)
  {
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    return sub_10001FE94();
  }
  if (*(unsigned char *)(v1 + 416)) {
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_100005370((void *)(v1 + 256), *(void *)(v1 + 280));
  sub_1000278CC(&qword_100062E38, v15, (void (*)(uint64_t))type metadata accessor for SevereNotificationsManager);
  dispatch thunk of LocationManagerType.addObserver(_:)();
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  *(unsigned char *)(v1 + 416) = 1;
  return result;
}

uint64_t sub_100017598(uint64_t *a1)
{
  uint64_t v65 = a1;
  uint64_t v60 = *v1;
  uint64_t v61 = v1;
  uint64_t v2 = (int *)type metadata accessor for APSMessage();
  uint64_t v62 = *((void *)v2 - 1);
  __chkstk_darwin(v2);
  uint64_t v63 = v3;
  uint64_t v64 = (uint64_t)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SevereNotificationContent();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v56 = v4;
  uint64_t v57 = v5;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v58 = v7;
  uint64_t v59 = (uint64_t)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v54 - v8;
  uint64_t v66 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  uint64_t v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005280(&qword_100062E40);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v55 = (uint64_t)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v67 = (uint64_t)&v54 - v16;
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  unint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Received a severe weather notification; creating debug presentation",
      v23,
      2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  uint64_t v24 = (uint64_t)v65;
  uint64_t v25 = *v65;
  uint64_t v26 = v65[1];
  unint64_t v27 = (uint64_t *)((char *)v65 + v2[7]);
  uint64_t v28 = v27[1];
  if (v28) {
    uint64_t v29 = *v27;
  }
  else {
    uint64_t v29 = 0x6E776F6E6B6E55;
  }
  if (v28) {
    uint64_t v30 = (void *)v27[1];
  }
  else {
    uint64_t v30 = (void *)0xE700000000000000;
  }
  uint64_t v31 = v2[5];
  uint64_t v32 = *(uint64_t *)((char *)v65 + v2[6]);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, (char *)v65 + v31, v66);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v33 = v67;
  sub_10001016C(v25, v26, v29, (uint64_t)v30, v32, (uint64_t)v12, v67);
  uint64_t v68 = 0x3A6C656E6E616843;
  unint64_t v69 = 0xE900000000000020;
  swift_bridgeObjectRetain();
  v34._countAndFlagsBits = v29;
  v34._object = v30;
  String.append(_:)(v34);
  swift_bridgeObjectRelease();
  uint64_t v36 = v68;
  unint64_t v35 = v69;
  uint64_t v37 = v33;
  uint64_t v38 = v55;
  sub_1000274B0(v37, v55, &qword_100062E40);
  uint64_t v39 = type metadata accessor for SevereMessage();
  if (sub_1000093BC(v38, 1, v39) == 1)
  {
    sub_1000277BC(v38, &qword_100062E40);
    uint64_t v40 = 0;
    unint64_t v41 = 0xE000000000000000;
  }
  else
  {
    uint64_t v40 = sub_10001191C();
    unint64_t v41 = v42;
    sub_100027A28();
  }
  uint64_t v43 = Dictionary.init(dictionaryLiteral:)();
  sub_100008CEC((uint64_t)&v9[*(int *)(v56 + 40)], 1, 1, v66);
  *(void *)uint64_t v9 = 0xD000000000000021;
  *((void *)v9 + 1) = 0x8000000100053310;
  *((void *)v9 + 2) = v36;
  *((void *)v9 + 3) = v35;
  *((void *)v9 + 4) = v40;
  *((void *)v9 + 5) = v41;
  *((void *)v9 + 6) = 0x6775626564;
  *((void *)v9 + 7) = 0xE500000000000000;
  *((void *)v9 + 8) = v43;
  v9[72] = 0;
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  long long v44 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v45 = v59;
  sub_1000279D4((uint64_t)v9, v59, (void (*)(void))type metadata accessor for SevereNotificationContent);
  unint64_t v46 = (*(unsigned __int8 *)(v57 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
  uint64_t v47 = swift_allocObject();
  sub_10002729C(v45, v47 + v46, (void (*)(void))type metadata accessor for SevereNotificationContent);
  firstly<A, B>(on:disposeOn:closure:)();

  swift_release();
  int64_t v48 = (void *)zalgo.getter();
  Promise.then<A>(on:closure:)();
  swift_release();

  uint64_t v49 = v64;
  sub_1000279D4(v24, v64, (void (*)(void))type metadata accessor for APSMessage);
  unint64_t v50 = (*(unsigned __int8 *)(v62 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
  uint64_t v51 = swift_allocObject();
  sub_10002729C(v49, v51 + v50, (void (*)(void))type metadata accessor for APSMessage);
  uint64_t v52 = (void *)zalgo.getter();
  Promise.error(on:closure:)();
  swift_release();
  swift_release();
  swift_release();

  sub_100027A28();
  return sub_1000277BC(v67, &qword_100062E40);
}

void sub_100017CC8(uint64_t a1)
{
}

uint64_t sub_100017D14(uint64_t *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  unint64_t v7 = a1[1];
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v15 = v3;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v16 = v1;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1000466F4(v8, v7, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Delivered debug notification with identifier: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v15);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_100017F38(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SevereMessage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4 - 8);
  uint64_t v8 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  os_log_type_t v10 = (uint64_t *)((char *)&v29 - v9);
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v36 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  sub_1000279D4(a1, (uint64_t)v10, (void (*)(void))type metadata accessor for SevereMessage);
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v35 = v2;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v33 = a1;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    Swift::String v34 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v38 = v18;
    uint64_t v30 = v11;
    uint64_t v31 = v5;
    *(_DWORD *)uint64_t v17 = 136446210;
    uint64_t v32 = v6;
    uint64_t v19 = *v10;
    unint64_t v20 = v10[1];
    swift_bridgeObjectRetain();
    uint64_t v21 = v19;
    uint64_t v2 = v35;
    uint64_t v37 = sub_1000466F4(v21, v20, &v38);
    uint64_t v5 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100027A28();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Handling severe message with identifier: %{public}s", v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v8 = v34;
    swift_slowDealloc();
    a1 = v33;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v36 + 8))(v13, v30);
  }
  else
  {
    sub_100027A28();

    (*(void (**)(char *, uint64_t))(v36 + 8))(v13, v11);
  }
  sub_1000279D4(a1, (uint64_t)v8, (void (*)(void))type metadata accessor for SevereMessage);
  unint64_t v22 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v2;
  sub_10002729C((uint64_t)v8, v23 + v22, (void (*)(void))type metadata accessor for SevereMessage);
  id v24 = objc_allocWithZone((Class)sub_100005280(&qword_100062E50));
  swift_retain();
  uint64_t v25 = (void *)AsyncBlockOperation.init(_:)();
  sub_100005280(&qword_100062690);
  id v26 = v25;
  uint64_t v27 = Promise.__allocating_init(_:scheduleOn:)();

  return v27;
}

uint64_t sub_100018328(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SevereMessage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  uint64_t v7 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_1000279D4(a2, (uint64_t)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for SevereMessage);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  sub_10002729C((uint64_t)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8, (void (*)(void))type metadata accessor for SevereMessage);
  swift_retain();
  sub_100005280(&qword_100062618);
  type metadata accessor for SevereNotificationsManager();
  firstly<A, B>(on:disposeOn:closure:)();

  swift_release();
  os_log_type_t v10 = (void *)zalgo.getter();
  uint64_t v11 = Promise.error(on:closure:)();
  swift_release();

  return v11;
}

uint64_t sub_1000184F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v95 = a3;
  uint64_t v91 = a2;
  uint64_t v96 = type metadata accessor for Location();
  uint64_t v100 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  uint64_t v86 = (char *)v83 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SevereMessage();
  uint64_t v87 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8);
  uint64_t v93 = v6;
  uint64_t v88 = (char *)v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005280(&qword_100062E58);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = type metadata accessor for NotificationSubscription.Location();
  uint64_t v102 = *(void *)(v110 - 8);
  uint64_t v10 = __chkstk_darwin(v110);
  uint64_t v97 = (char *)v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v103 = (char *)v83 - v13;
  __chkstk_darwin(v12);
  uint64_t v99 = (char *)v83 - v14;
  uint64_t v104 = type metadata accessor for NotificationSubscription();
  uint64_t v92 = *(void *)(v104 - 8);
  uint64_t v15 = __chkstk_darwin(v104);
  uint64_t v98 = (char *)v83 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v83 - v17;
  uint64_t v19 = sub_100005280(&qword_100062E30);
  uint64_t v89 = *(void *)(v19 - 8);
  uint64_t v20 = *(void *)(v89 + 64);
  uint64_t v21 = __chkstk_darwin(v19 - 8);
  uint64_t v90 = (uint64_t)v83 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v94 = (uint64_t)v83 - v22;
  uint64_t v23 = type metadata accessor for NotificationSubscription.Kind();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  id v26 = (char *)v83 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = *(void *)(a1 + 240);
  sub_100005370((void *)(a1 + 216), v27);
  static NotificationSubscription.Kind.severe.getter();
  uint64_t v28 = v109;
  uint64_t v29 = dispatch thunk of NotificationSubscriptionManagerType.subscriptions(of:)();
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  }
  else
  {
    uint64_t v30 = v29;
    uint64_t v84 = v20;
    uint64_t v85 = 0;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    uint64_t v31 = *(void *)(v30 + 16);
    if (v31)
    {
      uint64_t v32 = *(uint64_t (**)())(v92 + 16);
      unint64_t v33 = v30 + ((*(unsigned __int8 *)(v92 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80));
      uint64_t v106 = *(void *)(v92 + 72);
      unint64_t v107 = v32;
      uint64_t v108 = v92 + 16;
      int64_t v105 = (void (**)(char *, uint64_t))(v92 + 8);
      Swift::String v34 = (void (**)(char *, char *, uint64_t))(v102 + 32);
      v83[1] = v30;
      swift_bridgeObjectRetain();
      uint64_t v109 = (uint64_t (*)())_swiftEmptyArrayStorage;
      v83[0] = v33;
      uint64_t v101 = v31;
      uint64_t v35 = v100;
      do
      {
        uint64_t v36 = v104;
        ((void (*)(char *, unint64_t, uint64_t))v107)(v18, v33, v104);
        NotificationSubscription.location.getter();
        uint64_t v37 = v110;
        sub_100008CEC((uint64_t)v9, 0, 1, v110);
        uint64_t v38 = *v105;
        (*v105)(v18, v36);
        if (sub_1000093BC((uint64_t)v9, 1, v37) == 1)
        {
          sub_1000277BC((uint64_t)v9, &qword_100062E58);
        }
        else
        {
          uint64_t v39 = *v34;
          uint64_t v40 = v99;
          (*v34)(v99, v9, v37);
          v39(v103, v40, v37);
          if (swift_isUniquelyReferenced_nonNull_native()) {
            unint64_t v41 = (void (*)(void))v109;
          }
          else {
            unint64_t v41 = (void (*)(void))sub_100033368(0, *((void *)v109 + 2) + 1, 1, (uint64_t)v109);
          }
          unint64_t v43 = *((void *)v41 + 2);
          unint64_t v42 = *((void *)v41 + 3);
          uint64_t v44 = v102;
          if (v43 >= v42 >> 1)
          {
            uint64_t v46 = sub_100033368(v42 > 1, v43 + 1, 1, (uint64_t)v41);
            uint64_t v44 = v102;
            unint64_t v41 = (void (*)(void))v46;
          }
          *((void *)v41 + 2) = v43 + 1;
          unint64_t v45 = (*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
          uint64_t v109 = (uint64_t (*)())v41;
          ((void (*)(char *))v39)((char *)v41 + v45 + *(void *)(v44 + 72) * v43);
          uint64_t v35 = v100;
        }
        v33 += v106;
        --v31;
      }
      while (v31);
      swift_bridgeObjectRelease();
      uint64_t v47 = (void (**)(char *, uint64_t))(v102 + 8);
      int64_t v48 = (void (**)(char *, uint64_t))(v35 + 8);
      swift_bridgeObjectRetain();
      uint64_t v49 = v86;
      uint64_t v50 = v104;
      uint64_t v51 = v97;
      uint64_t v52 = v98;
      uint64_t v53 = v83[0];
      while (1)
      {
        uint64_t v54 = v53;
        ((void (*)(char *))v107)(v52);
        NotificationSubscription.location.getter();
        NotificationSubscription.Location.locationOverride.getter();
        (*v47)(v51, v110);
        Location.kind.getter();
        (*v48)(v49, v96);
        uint64_t v55 = Location.Identifier.Kind.rawValue.getter();
        uint64_t v57 = v56;
        if (v55 == Location.Identifier.Kind.rawValue.getter() && v57 == v58) {
          break;
        }
        char v60 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v60) {
          goto LABEL_24;
        }
        uint64_t v52 = v98;
        v38(v98, v50);
        uint64_t v53 = v54 + v106;
        --v101;
        uint64_t v51 = v97;
        if (!v101)
        {
          swift_bridgeObjectRelease();
          uint64_t v61 = 1;
          uint64_t v63 = v94;
          uint64_t v62 = v95;
          goto LABEL_25;
        }
      }
      swift_bridgeObjectRelease_n();
LABEL_24:
      swift_bridgeObjectRelease();
      uint64_t v63 = v94;
      (*(void (**)(uint64_t, char *, uint64_t))(v92 + 32))(v94, v98, v50);
      uint64_t v61 = 0;
      uint64_t v62 = v95;
LABEL_25:
      uint64_t v65 = (uint64_t)v88;
      uint64_t v66 = v87;
      uint64_t v64 = v109;
    }
    else
    {
      uint64_t v64 = (uint64_t (*)())_swiftEmptyArrayStorage;
      uint64_t v61 = 1;
      uint64_t v63 = v94;
      uint64_t v62 = v95;
      uint64_t v65 = (uint64_t)v88;
      uint64_t v66 = v87;
      uint64_t v50 = v104;
    }
    sub_100008CEC(v63, v61, 1, v50);
    swift_bridgeObjectRelease();
    unint64_t v111 = v64;
    sub_100005280(&qword_100062E60);
    swift_allocObject();
    Promise.init(value:)();
    uint64_t v110 = sub_100027A84(0, (unint64_t *)&qword_100063FE0);
    uint64_t v67 = (void *)static OS_dispatch_queue.notifications.getter();
    uint64_t v109 = type metadata accessor for SevereMessage;
    sub_1000279D4(v62, v65, (void (*)(void))type metadata accessor for SevereMessage);
    uint64_t v68 = *(unsigned __int8 *)(v66 + 80);
    uint64_t v108 = v68 | 7;
    uint64_t v69 = swift_allocObject();
    unint64_t v107 = type metadata accessor for SevereMessage;
    sub_10002729C(v65, v69 + ((v68 + 16) & ~v68), (void (*)(void))type metadata accessor for SevereMessage);
    sub_100005280(&qword_100062E68);
    type metadata accessor for SevereNotificationsManager();
    uint64_t v70 = v91;
    Promise.then<A, B>(on:disposeOn:closure:)();
    swift_release();

    swift_release();
    uint64_t v71 = v90;
    sub_1000274B0(v63, v90, &qword_100062E30);
    unint64_t v72 = (*(unsigned __int8 *)(v89 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80);
    unint64_t v73 = (v84 + v72 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v74 = swift_allocObject();
    sub_10002774C(v71, v74 + v72, &qword_100062E30);
    *(void *)(v74 + v73) = v70;
    uint64_t v75 = swift_allocObject();
    *(void *)(v75 + 16) = sub_100024728;
    *(void *)(v75 + 24) = v74;
    swift_retain();
    uint64_t v76 = (void *)zalgo.getter();
    sub_100008DE0(&qword_100062E70, &qword_100062E68);
    Promise<A>.filter(on:closure:)();
    swift_release();
    swift_release();

    sub_1000279D4(v95, v65, (void (*)(void))v109);
    uint64_t v77 = swift_allocObject();
    *(void *)(v77 + 16) = v70;
    sub_10002729C(v65, v77 + ((v68 + 24) & ~v68), (void (*)(void))v107);
    uint64_t v78 = swift_allocObject();
    *(void *)(v78 + 16) = sub_1000248D8;
    *(void *)(v78 + 24) = v77;
    swift_retain();
    uint64_t v79 = (void *)zalgo.getter();
    sub_100005280(&qword_100062690);
    Promise<A>.compactMap<A>(on:closure:)();
    swift_release();
    swift_release();

    unint64_t v80 = (void *)zalgo.getter();
    sub_100005280(&qword_100062E78);
    Promise.then<A>(on:closure:)();
    swift_release();

    uint64_t v81 = (void *)static OS_dispatch_queue.notifications.getter();
    sub_100005280(&qword_100062618);
    sub_100008DE0(&qword_100062E80, &qword_100062E78);
    sub_100008DE0(&qword_100062628, &qword_100062618);
    uint64_t v27 = Promise<A>.flatMap<A>(on:closure:)();
    swift_release();

    sub_1000277BC(v94, &qword_100062E30);
  }
  return v27;
}

uint64_t sub_100019168(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v63 = a3;
  uint64_t v62 = type metadata accessor for WeatherAlertEntity();
  uint64_t v66 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for NotificationSubscription.Location();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v70 = v9;
  uint64_t v71 = v10;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *a1;
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v18 = Logger.logObject.getter();
  LODWORD(v65) = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, (os_log_type_t)v65))
  {
    os_log_t v57 = v18;
    uint64_t v58 = v14;
    uint64_t v69 = v16;
    uint64_t v60 = v13;
    uint64_t v61 = (void (**)(char *, uint64_t))a2;
    uint64_t v64 = v3;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v56 = swift_slowAlloc();
    v73[0] = v56;
    *(_DWORD *)uint64_t v19 = 141558275;
    uint64_t v74 = 1752392040;
    uint64_t v55 = &v75;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v19 + 12) = 2081;
    int64_t v20 = *(void *)(v17 + 16);
    uint64_t v59 = (void *)v17;
    if (v20)
    {
      uint64_t v53 = v19;
      uint64_t v54 = v8;
      uint64_t v74 = (uint64_t)_swiftEmptyArrayStorage;
      sub_100011F8C(0, v20, 0);
      uint64_t v21 = *(void (**)(char *, unint64_t, uint64_t))(v71 + 16);
      unint64_t v22 = v17 + ((*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80));
      uint64_t v67 = *(void *)(v71 + 72);
      uint64_t v68 = v21;
      v71 += 16;
      uint64_t v23 = (void (**)(char *, uint64_t))(v71 - 8);
      do
      {
        uint64_t v24 = v70;
        v68(v12, v22, v70);
        uint64_t v25 = NotificationSubscription.Location.id.getter();
        uint64_t v27 = v26;
        (*v23)(v12, v24);
        uint64_t v28 = v74;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100011F8C(0, *(void *)(v28 + 16) + 1, 1);
          uint64_t v28 = v74;
        }
        unint64_t v30 = *(void *)(v28 + 16);
        unint64_t v29 = *(void *)(v28 + 24);
        if (v30 >= v29 >> 1)
        {
          sub_100011F8C((char *)(v29 > 1), v30 + 1, 1);
          uint64_t v28 = v74;
        }
        *(void *)(v28 + 16) = v30 + 1;
        unint64_t v31 = v28 + 16 * v30;
        *(void *)(v31 + 32) = v25;
        *(void *)(v31 + 40) = v27;
        v22 += v67;
        --v20;
        uint64_t v32 = v69;
      }
      while (v20);
      uint64_t v8 = v54;
      uint64_t v33 = v66;
      uint64_t v19 = v53;
    }
    else
    {
      uint64_t v32 = v69;
      uint64_t v33 = v66;
    }
    uint64_t v34 = Array.description.getter();
    unint64_t v36 = v35;
    swift_bridgeObjectRelease();
    uint64_t v74 = sub_1000466F4(v34, v36, v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v17 = (uint64_t)v59;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v37 = v57;
    _os_log_impl((void *)&_mh_execute_header, v57, (os_log_type_t)v65, "Filtering events that apply to locations: %{private,mask.hash}s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v58 + 8))(v32, v60);
    uint64_t v4 = v64;
    a2 = (uint64_t)v61;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t v33 = v66;
  }
  uint64_t v60 = *(void *)(a2 + 376);
  ReferenceCountedLazy.increase()();
  uint64_t v70 = v73[0];
  swift_retain();
  uint64_t v38 = swift_bridgeObjectRetain();
  uint64_t v39 = sub_10001605C(v38, a2);
  uint64_t v74 = (uint64_t)&_swiftEmptySetSingleton;
  swift_bridgeObjectRetain();
  uint64_t v59 = sub_100016920(v17, v39, (uint64_t)&v74);
  uint64_t v40 = v4;
  uint64_t v41 = *(void *)(v39 + 16);
  if (v41)
  {
    uint64_t v61 = (void (**)(char *, uint64_t))(v33 + 8);
    unint64_t v42 = (uint64_t *)(v39 + 64);
    uint64_t v69 = (char *)v39;
    do
    {
      uint64_t v43 = *(v42 - 3);
      uint64_t v44 = *(v42 - 2);
      uint64_t v45 = *(v42 - 1);
      uint64_t v46 = *v42;
      uint64_t v71 = *(v42 - 4);
      v73[0] = v71;
      v73[1] = v43;
      v73[2] = v44;
      v73[3] = v45;
      v73[4] = v46;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      NotificationStore.weatherAlerts.getter();
      if (v40)
      {
        swift_errorRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v40 = 0;
      }
      else
      {
        uint64_t v68 = (void (*)(char *, unint64_t, uint64_t))dispatch thunk of Table.save.getter();
        swift_release();
        uint64_t v47 = *v63;
        uint64_t v48 = v63[1];
        uint64_t v49 = v63[3];
        uint64_t v66 = v63[2];
        uint64_t v67 = v47;
        uint64_t v64 = v49;
        uint64_t v65 = v48;
        uint64_t v50 = v74;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_10001A4C4(v73, v50);
        swift_bridgeObjectRelease();
        WeatherAlertEntity.init(alertIdentifier:messageIdentifier:channelIdentifier:boundingBox:relevant:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        dispatch thunk of Save.entity(_:)();
        (*v61)(v8, v62);
        swift_release();
      }
      v42 += 5;
      --v41;
    }
    while (v41);
  }
  swift_bridgeObjectRelease();
  unint64_t v72 = v59;
  sub_100005280(&qword_100062F60);
  swift_allocObject();
  uint64_t v51 = Promise.init(value:)();
  swift_bridgeObjectRelease();
  ReferenceCountedLazy.decrease()();
  swift_release();
  return v51;
}

uint64_t sub_1000198B8(uint64_t *a1)
{
  uint64_t v25 = a1;
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v26 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v2 = sub_100005280(&qword_100062878);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Expression();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005280(&qword_100062F78);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Settings.Notifications.Severe.filterIncomingEvents.getter();
  sub_1000278CC(&qword_100062E48, v12, (void (*)(uint64_t))type metadata accessor for SevereNotificationsManager);
  Configurable.setting<A>(_:)();
  swift_release();
  if (LOBYTE(v27[0]) != 1) {
    return 0;
  }
  uint64_t v22 = v5;
  uint64_t v23 = v6;
  uint64_t v24 = v1;
  ReferenceCountedLazy.increase()();
  uint64_t v13 = v27[0];
  NotificationStore.weatherAlerts.getter();
  v21[1] = v13;
  dispatch thunk of Table.query.getter();
  swift_release();
  uint64_t v15 = *v25;
  uint64_t v14 = v25[1];
  v27[3] = &type metadata for String;
  v27[4] = &protocol witness table for String;
  v27[0] = v15;
  v27[1] = v14;
  swift_bridgeObjectRetain();
  == infix(_:_:)();
  sub_100008AD0((uint64_t)v27);
  uint64_t v16 = type metadata accessor for OrderBy();
  sub_100008CEC((uint64_t)v4, 1, 1, v16);
  dispatch thunk of Query.first(_:orderBy:)();
  swift_release();
  sub_1000277BC((uint64_t)v4, &qword_100062878);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
  uint64_t v18 = type metadata accessor for WeatherAlertEntity();
  uint64_t v19 = 1;
  int v20 = sub_1000093BC((uint64_t)v11, 1, v18);
  sub_1000277BC((uint64_t)v11, &qword_100062F78);
  if (v20 == 1) {
    uint64_t v19 = 0;
  }
  ReferenceCountedLazy.decrease()();
  swift_release();
  return v19;
}

uint64_t sub_100019E3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = type metadata accessor for NotificationSubscription.Location();
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v34 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = a1;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_100016474((uint64_t)sub_10002779C, (uint64_t)v35, a2);
  if (*(void *)(v14 + 16))
  {
    uint64_t v15 = swift_bridgeObjectRetain();
    sub_10001A414(v15);
    uint64_t v16 = sub_100005280(&qword_100062E98);
    uint64_t v17 = *(int *)(v16 + 48);
    NotificationSubscription.Location.location.getter();
    *(void *)(a3 + v17) = v14;
    uint64_t v18 = a3;
    uint64_t v19 = 0;
    uint64_t v20 = v16;
  }
  else
  {
    uint64_t v32 = v10;
    swift_bridgeObjectRelease();
    static Logger.notifications.getter();
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v9, a1, v34);
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    uint64_t v23 = a3;
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v31 = v3;
      uint64_t v25 = v24;
      uint64_t v29 = swift_slowAlloc();
      uint64_t v38 = v29;
      *(_DWORD *)uint64_t v25 = 141558275;
      uint64_t v37 = 1752392040;
      uint64_t v30 = a3;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v25 + 12) = 2081;
      uint64_t v26 = NotificationSubscription.Location.id.getter();
      uint64_t v37 = sub_1000466F4(v26, v27, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v34);
      uint64_t v23 = v30;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "None of the events intersect with location: %{private,mask.hash}s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v34);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v32);
    uint64_t v20 = sub_100005280(&qword_100062E98);
    uint64_t v18 = v23;
    uint64_t v19 = 1;
  }
  return sub_100008CEC(v18, v19, 1, v20);
}

uint64_t sub_10001A1E8(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = type metadata accessor for NotificationSubscription.Location();
  uint64_t v4 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Location();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 32);
  NotificationSubscription.Location.locationOverride.getter();
  Location.coordinate.getter();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v8 + 8);
  v12(v10, v7);
  uint64_t v16 = v11;
  LOBYTE(a1) = Array<A>.contains(_:)();
  uint64_t v13 = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a2, v17);
  if (a1)
  {
    char v14 = 1;
  }
  else
  {
    NotificationSubscription.Location.location.getter();
    Location.coordinate.getter();
    v12(v10, v7);
    char v14 = Array<A>.contains(_:)();
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v13);
  return v14 & 1;
}

uint64_t sub_10001A414(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (uint64_t *)(a1 + 64);
    do
    {
      uint64_t v4 = *(v2 - 4);
      uint64_t v3 = *(v2 - 3);
      uint64_t v5 = *(v2 - 2);
      uint64_t v6 = *(v2 - 1);
      uint64_t v7 = *v2;
      v2 += 5;
      v10[0] = v4;
      v10[1] = v3;
      v10[2] = v5;
      v10[3] = v6;
      v10[4] = v7;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1000255D4(&v9, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v1;
    }
    while (v1);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001A4C4(uint64_t *a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  Hasher.init(_seed:)();
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1[2];
  uint64_t v7 = a1[3];
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  uint64_t v8 = a1[4];
  sub_100027354((uint64_t)v26, v8);
  Swift::Int v9 = Hasher._finalize()();
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = v9 & ~v10;
  uint64_t v12 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  uint64_t v24 = ~v10;
  uint64_t v25 = *(void *)(a2 + 48);
  while (1)
  {
    uint64_t v13 = (void *)(v25 + 40 * v11);
    uint64_t v14 = v13[2];
    uint64_t v15 = v13[3];
    uint64_t v16 = v13[4];
    BOOL v17 = *v13 == v4 && v13[1] == v5;
    if (!v17 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_25;
    }
    BOOL v18 = v14 == v6 && v15 == v7;
    if (!v18 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_25;
    }
    uint64_t v19 = *(void *)(v16 + 16);
    if (v19 != *(void *)(v8 + 16)) {
      goto LABEL_25;
    }
    if (!v19 || v16 == v8) {
      return 1;
    }
    if (*(double *)(v16 + 32) == *(double *)(v8 + 32))
    {
      if (v19 == 1) {
        return 1;
      }
      if (*(double *)(v16 + 40) == *(double *)(v8 + 40))
      {
        uint64_t v20 = v19 - 2;
        if (!v20) {
          return 1;
        }
        uint64_t v21 = (double *)(v16 + 48);
        for (uint64_t i = (double *)(v8 + 48); *v21 == *i; ++i)
        {
          ++v21;
          if (!--v20) {
            return 1;
          }
        }
      }
    }
LABEL_25:
    unint64_t v11 = (v11 + 1) & v24;
    if (((*(void *)(v12 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
      return 0;
    }
  }
}

uint64_t sub_10001A6D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v70 = a4;
  uint64_t v73 = a3;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v63 = *(void *)(v5 - 8);
  uint64_t v64 = v5;
  __chkstk_darwin(v5);
  uint64_t v71 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for NotificationSubscription.Location();
  Class isa = v7[-1].isa;
  os_log_t v69 = v7;
  __chkstk_darwin(v7);
  uint64_t v67 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = type metadata accessor for Location();
  uint64_t v72 = *(void *)(v66 - 8);
  uint64_t v9 = __chkstk_darwin(v66);
  uint64_t v65 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v58 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v58 - v14;
  uint64_t v16 = sub_100005280(&qword_100062E30);
  __chkstk_darwin(v16 - 8);
  BOOL v18 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for NotificationSubscription();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  os_log_type_t v22 = (char *)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1;
  Location.kind.getter();
  uint64_t v24 = Location.Identifier.Kind.rawValue.getter();
  uint64_t v26 = v25;
  if (v24 == Location.Identifier.Kind.rawValue.getter() && v26 == v27)
  {
    swift_bridgeObjectRelease_n();
    return 1;
  }
  uint64_t v58 = v13;
  uint64_t v59 = v23;
  uint64_t v60 = v15;
  uint64_t v61 = v22;
  uint64_t v62 = v20;
  char v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v29) {
    return 1;
  }
  sub_1000274B0(v73, (uint64_t)v18, &qword_100062E30);
  uint64_t v30 = v19;
  if (sub_1000093BC((uint64_t)v18, 1, v19) == 1)
  {
    sub_1000277BC((uint64_t)v18, &qword_100062E30);
    return 1;
  }
  uint64_t v33 = v61;
  uint64_t v32 = v62;
  (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v61, v18, v30);
  if ((NotificationSubscription.severeEnabled.getter() & 1) == 0)
  {
LABEL_16:
    (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v30);
    return 1;
  }
  uint64_t v34 = v67;
  NotificationSubscription.location.getter();
  unint64_t v35 = v60;
  NotificationSubscription.Location.locationOverride.getter();
  (*((void (**)(char *, os_log_t))isa + 1))(v34, v69);
  sub_100005370((void *)(v70 + 296), *(void *)(v70 + 320));
  uint64_t v36 = v59;
  if ((dispatch thunk of NotificationLocationComparatorType.areLocationsEquivalent(_:_:)() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v72 + 8))(v35, v66);
    goto LABEL_16;
  }
  static Logger.notifications.getter();
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 16);
  uint64_t v38 = v58;
  uint64_t v39 = v36;
  uint64_t v40 = v66;
  v37(v58, v39, v66);
  uint64_t v41 = v65;
  v37(v65, (uint64_t)v35, v40);
  unint64_t v42 = v38;
  uint64_t v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.default.getter();
  int v45 = v44;
  BOOL v46 = os_log_type_enabled(v43, v44);
  uint64_t v47 = v63;
  if (v46)
  {
    uint64_t v48 = swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    uint64_t v70 = v49;
    *(_DWORD *)uint64_t v48 = 141558787;
    uint64_t v74 = 1752392040;
    uint64_t v75 = v49;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v48 + 12) = 2081;
    uint64_t v73 = v30;
    sub_1000278CC(&qword_100062F58, 255, (void (*)(uint64_t))&type metadata accessor for Location);
    os_log_t v69 = v43;
    uint64_t v50 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v74 = sub_1000466F4(v50, v51, &v75);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    LODWORD(isa) = v45;
    uint64_t v52 = *(void (**)(char *, uint64_t))(v72 + 8);
    v52(v42, v40);
    *(_WORD *)(v48 + 22) = 2160;
    uint64_t v74 = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v48 + 32) = 2081;
    uint64_t v53 = v65;
    uint64_t v54 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v74 = sub_1000466F4(v54, v55, &v75);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v52(v53, v40);
    os_log_t v56 = v69;
    _os_log_impl((void *)&_mh_execute_header, v69, (os_log_type_t)isa, "Suppressing notifications for location because it's near current location, subscriptionLocation=%{private,mask.hash}s, currentLocation=%{private,mask.hash}s", (uint8_t *)v48, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v47 + 8))(v71, v64);
    v52(v60, v40);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v61, v73);
  }
  else
  {

    os_log_t v57 = *(void (**)(char *, uint64_t))(v72 + 8);
    v57(v41, v40);
    v57(v42, v40);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v71, v64);
    v57(v35, v40);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v30);
  }
  return 0;
}

uint64_t sub_10001AE50(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  uint64_t v4 = sub_100005280(&qword_100062E98);
  return a2(a1, *(void *)(a1 + *(int *)(v4 + 48))) & 1;
}

uint64_t sub_10001AEAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v67 = a2;
  uint64_t v5 = type metadata accessor for SevereMessage();
  uint64_t v66 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v66 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Location();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v63 = v11;
  uint64_t v64 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v50 - v12;
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  BOOL v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v65 = a3;
  uint64_t v61 = v18;
  uint64_t v62 = v9 + 16;
  v18(v13, a3, v8);
  swift_bridgeObjectRetain_n();
  uint64_t v19 = Logger.logObject.getter();
  int v60 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, (os_log_type_t)v60))
  {
    os_log_t v53 = v19;
    uint64_t v54 = v13;
    uint64_t v55 = v15;
    uint64_t v56 = v14;
    uint64_t v57 = v6;
    uint64_t v58 = v8;
    uint64_t v59 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v20 = swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    v70[0] = v52;
    *(_DWORD *)uint64_t v20 = 136446723;
    uint64_t v21 = *(void *)(a1 + 16);
    if (v21)
    {
      swift_bridgeObjectRetain();
      uint64_t v51 = a1;
      os_log_type_t v22 = (uint64_t *)(a1 + 40);
      uint64_t v23 = _swiftEmptyArrayStorage;
      do
      {
        uint64_t v24 = *(v22 - 1);
        uint64_t v25 = *v22;
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100033334(0, v23[2] + 1, 1, (uint64_t)v23);
          uint64_t v23 = v29;
        }
        unint64_t v27 = v23[2];
        unint64_t v26 = v23[3];
        if (v27 >= v26 >> 1)
        {
          sub_100033334(v26 > 1, v27 + 1, 1, (uint64_t)v23);
          uint64_t v23 = v30;
        }
        v22 += 5;
        v23[2] = v27 + 1;
        uint64_t v28 = &v23[2 * v27];
        v28[4] = v24;
        v28[5] = v25;
        --v21;
      }
      while (v21);
      a1 = v51;
      swift_bridgeObjectRelease();
    }
    uint64_t v32 = v67;
    uint64_t v33 = Array.description.getter();
    unint64_t v35 = v34;
    swift_bridgeObjectRelease();
    uint64_t v69 = sub_1000466F4(v33, v35, v70);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2160;
    uint64_t v69 = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v20 + 22) = 2081;
    uint64_t v36 = v54;
    uint64_t v37 = Location.id.getter();
    uint64_t v69 = sub_1000466F4(v37, v38, v70);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v8 = v58;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v36, v58);
    os_log_t v39 = v53;
    _os_log_impl((void *)&_mh_execute_header, v53, (os_log_type_t)v60, "Handling severe events with identifier: %{public}s for location: %{private,mask.hash}s", (uint8_t *)v20, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v55 + 8))(v17, v56);
    uint64_t v31 = a1;
    uint64_t v7 = v59;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    uint64_t v31 = a1;
    uint64_t v32 = v67;
  }
  uint64_t v40 = v64;
  v61(v64, v65, v8);
  sub_1000279D4(v32, (uint64_t)v7, (void (*)(void))type metadata accessor for SevereMessage);
  unint64_t v41 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v42 = (v63 + *(unsigned __int8 *)(v66 + 80) + v41) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
  uint64_t v43 = swift_allocObject();
  uint64_t v44 = v68;
  *(void *)(v43 + 16) = v31;
  *(void *)(v43 + 24) = v44;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v43 + v41, v40, v8);
  sub_10002729C((uint64_t)v7, v43 + v42, (void (*)(void))type metadata accessor for SevereMessage);
  id v45 = objc_allocWithZone((Class)sub_100005280(&qword_100062E50));
  swift_bridgeObjectRetain();
  swift_retain();
  BOOL v46 = (void *)AsyncBlockOperation.init(_:)();
  sub_100005280(&qword_100062690);
  id v47 = v46;
  uint64_t v48 = Promise.__allocating_init(_:scheduleOn:)();

  return v48;
}

uint64_t sub_10001B4F8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, void)@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_100005280(&qword_100062E98);
  uint64_t result = a2(a1, *(void *)(a1 + *(int *)(v6 + 48)));
  *a3 = result;
  return result;
}

uint64_t sub_10001B560()
{
  sub_100005280(&qword_100062690);
  uint64_t v0 = (void *)zalgo.getter();
  sub_100005280(&qword_100062E88);
  sub_100008DE0(&qword_100062E90, &qword_100062E88);
  uint64_t v1 = static Promise.all<A>(on:_:)();

  return v1;
}

void sub_10001B60C()
{
}

uint64_t sub_10001B618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v41 = a4;
  uint64_t v42 = a2;
  uint64_t v33 = a3;
  uint64_t v6 = type metadata accessor for SevereMessage();
  uint64_t v40 = *(void *)(v6 - 8);
  uint64_t v39 = *(void *)(v40 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v38 = (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Location();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  uint64_t v12 = (void *)static OS_dispatch_queue.notifications.getter();
  *(void *)(swift_allocObject() + 16) = a1;
  swift_bridgeObjectRetain();
  sub_100005280(&qword_100062EA0);
  firstly<A>(on:closure:)();

  swift_release();
  uint64_t v13 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v31 = v8;
  uint64_t v32 = v14;
  v14(v11, a3, v8);
  uint64_t v15 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = ((v15 + 24) & ~v15) + v10;
  uint64_t v17 = (v15 + 24) & ~v15;
  uint64_t v37 = v17;
  uint64_t v34 = v16;
  uint64_t v35 = v15 | 7;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v42;
  uint64_t v36 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  v36(v18 + v17, v11, v8);
  swift_retain();
  sub_100005280(&qword_100062EA8);
  sub_100008DE0(&qword_100062EB0, &qword_100062EA0);
  Promise<A>.compactMap<A>(on:closure:)();
  swift_release();

  swift_release();
  uint64_t v19 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_100005280(&qword_100062EB8);
  Promise.then<A>(on:closure:)();
  swift_release();

  uint64_t v20 = (void *)static OS_dispatch_queue.notifications.getter();
  type metadata accessor for WeatherAlert();
  sub_100008DE0(&qword_100062EC0, &qword_100062EB8);
  Promise<A>.compactMap<A>(on:closure:)();
  swift_release();

  uint64_t v21 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_100005280(&qword_100062EC8);
  Promise.then<A>(on:closure:)();
  swift_release();

  uint64_t v22 = v31;
  v32(v11, v33, v31);
  uint64_t v23 = v38;
  sub_1000279D4(v41, v38, (void (*)(void))type metadata accessor for SevereMessage);
  unint64_t v24 = (v34 + *(unsigned __int8 *)(v40 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v42;
  v36(v25 + v37, v11, v22);
  sub_10002729C(v23, v25 + v24, (void (*)(void))type metadata accessor for SevereMessage);
  swift_retain();
  unint64_t v26 = (void *)zalgo.getter();
  sub_100005280(&qword_100062ED0);
  sub_100008DE0(&qword_100062ED8, &qword_100062EC8);
  Promise<A>.compactMap<A>(on:closure:)();
  swift_release();
  swift_release();

  unint64_t v27 = (void *)zalgo.getter();
  sub_100005280(&qword_100062618);
  Promise.then<A>(on:closure:)();
  swift_release();

  uint64_t v28 = (void *)zalgo.getter();
  uint64_t v29 = Promise.error(on:closure:)();
  swift_release();

  return v29;
}

uint64_t sub_10001BBBC()
{
  return Promise.init(value:)();
}

uint64_t sub_10001BC20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_10001BC64(*(void (**)(uint64_t, char *, uint64_t))a1, *(void *)(a1 + 8), a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001BC64(void (*a1)(uint64_t, char *, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v20 = a3;
  uint64_t v21 = a1;
  uint64_t v22 = *v3;
  uint64_t v7 = type metadata accessor for Location();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  v18[0] = static OS_dispatch_queue.notifications.getter();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v19((char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v7);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  v18[1] = v10 | 7;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v21;
  *(void *)(v11 + 24) = a2;
  uint64_t v21 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v21(v11 + ((v10 + 32) & ~v10), (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  type metadata accessor for WeatherAlert();
  swift_bridgeObjectRetain();
  uint64_t v12 = (void *)v18[0];
  firstly<A, B>(on:disposeOn:closure:)();

  swift_release();
  v19((char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v20, v7);
  uint64_t v13 = (v10 + 16) & ~v10;
  uint64_t v14 = swift_allocObject();
  v21(v14 + v13, (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  *(void *)(v14 + ((v9 + v13 + 7) & 0xFFFFFFFFFFFFFFF8)) = v4;
  swift_retain();
  uint64_t v15 = (void *)zalgo.getter();
  sub_100005280(&qword_100062CF0);
  uint64_t v16 = Promise.then<A>(on:closure:)();
  swift_release();
  swift_release();

  return v16;
}

uint64_t sub_10001BF08(uint64_t a1)
{
  return sub_10001C918(a1, &qword_100062EA8, &qword_100062F40, &qword_100062F48);
}

uint64_t sub_10001BF38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000274B0(a1, a2, &qword_100062CF0);
}

uint64_t sub_10001BF6C()
{
  sub_100005280(&qword_100062A90);
  sub_100008DE0(&qword_100062F30, &qword_100062A90);
  uint64_t v0 = Sequence.groupedBy<A>(_:)();
  sub_10001701C(v0);
  swift_bridgeObjectRelease();
  sub_100005280(&qword_100062F38);
  swift_allocObject();
  return Promise.init(value:)();
}

uint64_t sub_10001C05C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004C6BC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001C088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v80 = a3;
  uint64_t v82 = *v3;
  uint64_t v83 = v3;
  uint64_t v6 = type metadata accessor for SevereMessage();
  uint64_t v78 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v79 = v7;
  uint64_t v81 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = type metadata accessor for UUID();
  uint64_t v72 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  uint64_t v87 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = type metadata accessor for WeatherAlert();
  uint64_t v89 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  uint64_t v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Location();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v76 = v14;
  uint64_t v77 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v61 - v15;
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  uint64_t v21 = a2;
  uint64_t v74 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v75 = v12 + 16;
  v74(v16, a2, v11);
  uint64_t v22 = a1;
  swift_bridgeObjectRetain_n();
  uint64_t v23 = Logger.logObject.getter();
  int v73 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, (os_log_type_t)v73))
  {
    os_log_t v64 = v23;
    uint64_t v65 = v16;
    uint64_t v66 = v20;
    uint64_t v67 = v18;
    uint64_t v68 = v17;
    uint64_t v69 = v12;
    uint64_t v70 = v11;
    uint64_t v71 = v21;
    unint64_t v24 = (_DWORD *)swift_slowAlloc();
    uint64_t v62 = swift_slowAlloc();
    v91[0] = v62;
    uint64_t v63 = v24;
    *unint64_t v24 = 136446723;
    uint64_t v25 = *(void *)(v22 + 16);
    uint64_t v26 = v22;
    if (v25)
    {
      unint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v89 + 16);
      uint64_t v28 = v22 + ((*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80));
      uint64_t v84 = *(void *)(v89 + 72);
      uint64_t v85 = v27;
      uint64_t v29 = (void (**)(char *, uint64_t))(v72 + 8);
      v89 += 16;
      uint64_t v30 = (void (**)(char *, uint64_t))(v89 - 8);
      uint64_t v72 = v26;
      swift_bridgeObjectRetain();
      uint64_t v31 = _swiftEmptyArrayStorage;
      do
      {
        uint64_t v32 = v86;
        v85(v10, v28, v86);
        uint64_t v33 = v87;
        WeatherAlert.id.getter();
        uint64_t v34 = UUID.uuidString.getter();
        uint64_t v36 = v35;
        (*v29)(v33, v88);
        (*v30)(v10, v32);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100033334(0, v31[2] + 1, 1, (uint64_t)v31);
          uint64_t v31 = v40;
        }
        unint64_t v38 = v31[2];
        unint64_t v37 = v31[3];
        if (v38 >= v37 >> 1)
        {
          sub_100033334(v37 > 1, v38 + 1, 1, (uint64_t)v31);
          uint64_t v31 = v41;
        }
        v31[2] = v38 + 1;
        uint64_t v39 = &v31[2 * v38];
        v39[4] = v34;
        v39[5] = v36;
        v28 += v84;
        --v25;
      }
      while (v25);
      uint64_t v26 = v72;
      swift_bridgeObjectRelease();
    }
    uint64_t v44 = (uint64_t)v81;
    BOOL v46 = v63;
    uint64_t v47 = Array.description.getter();
    unint64_t v49 = v48;
    swift_bridgeObjectRelease();
    uint64_t v90 = sub_1000466F4(v47, v49, v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *((_WORD *)v46 + 6) = 2160;
    uint64_t v90 = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *((_WORD *)v46 + 11) = 2081;
    uint64_t v50 = v65;
    uint64_t v51 = Location.id.getter();
    uint64_t v90 = sub_1000466F4(v51, v52, v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v12 = v69;
    uint64_t v42 = v70;
    (*(void (**)(char *, uint64_t))(v69 + 8))(v50, v70);
    os_log_t v53 = v64;
    _os_log_impl((void *)&_mh_execute_header, v64, (os_log_type_t)v73, "Deliver notification for alerts %{public}s with location: %{private,mask.hash}s", (uint8_t *)v46, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v67 + 8))(v66, v68);
    uint64_t v43 = v80;
    uint64_t v45 = v71;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    uint64_t v42 = v11;
    uint64_t v43 = v80;
    uint64_t v44 = (uint64_t)v81;
    uint64_t v26 = v22;
    uint64_t v45 = v21;
  }
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  uint64_t v54 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v55 = v77;
  v74(v77, v45, v42);
  sub_1000279D4(v43, v44, (void (*)(void))type metadata accessor for SevereMessage);
  unint64_t v56 = (*(unsigned __int8 *)(v12 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v57 = (v76 + *(unsigned __int8 *)(v78 + 80) + v56) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
  uint64_t v58 = swift_allocObject();
  *(void *)(v58 + 16) = v26;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v58 + v56, v55, v42);
  sub_10002729C(v44, v58 + v57, (void (*)(void))type metadata accessor for SevereMessage);
  swift_bridgeObjectRetain();
  uint64_t v59 = firstly<A, B>(on:disposeOn:closure:)();

  swift_release();
  return v59;
}

uint64_t sub_10001C8E8(uint64_t a1)
{
  return sub_10001C918(a1, &qword_100062ED0, &qword_100062EE8, &qword_100062EF0);
}

uint64_t sub_10001C918(uint64_t a1, uint64_t *a2, uint64_t *a3, unint64_t *a4)
{
  sub_100005280(a2);
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  uint64_t v6 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_100005280(a3);
  sub_100008DE0(a4, a3);
  uint64_t v7 = static Promise.all<A>(on:_:)();

  return v7;
}

void sub_10001C9E4()
{
  if (qword_1000624E8 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005248(v0, (uint64_t)static Logger.daemon);
  swift_errorRetain();
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = swift_slowAlloc();
    uint64_t v3 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 141558275;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v2 + 12) = 2113;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v3 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Cannot handle severe message event. error=%{private,mask.hash}@", (uint8_t *)v2, 0x16u);
    sub_100005280(&qword_100062EE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t sub_10001CBE4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  return sub_10003E510(a2, a3, a4);
}

uint64_t sub_10001CC48(uint64_t a1, char *a2, uint64_t *a3)
{
  uint64_t v39 = a2;
  uint64_t v36 = *a3;
  uint64_t v4 = sub_100005280(&qword_100062CF0);
  __chkstk_darwin(v4 - 8);
  uint64_t v40 = (uint64_t)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v34 = v6;
  uint64_t v35 = v7;
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v38 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v10 = type metadata accessor for UUID();
  __chkstk_darwin(v10 - 8);
  uint64_t v41 = type metadata accessor for WeatherAlert();
  uint64_t v37 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v12 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005280(&qword_100062698);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100005280(&qword_1000626A0);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  WeatherAlert.area.getter();
  if (sub_1000093BC((uint64_t)v15, 1, v16) == 1)
  {
    sub_1000277BC((uint64_t)v15, &qword_100062698);
LABEL_8:
    sub_100008CEC(v40, 1, 1, v41);
    sub_100005280(&qword_100062EA8);
    swift_allocObject();
    return Promise.init(value:)();
  }
  v32[1] = a1;
  uint64_t v33 = v12;
  uint64_t v20 = v38;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  Location.coordinate.getter();
  if (!GeoJSON.contains(_:)((CLLocationCoordinate2D)__PAIR128__(v22, v21)))
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    goto LABEL_8;
  }
  v32[0] = v16;
  uint64_t v39 = v19;
  uint64_t v23 = (uint64_t)v33;
  sub_10004D0CC((uint64_t)v33);
  static Settings.Notifications.Severe.simulateAlertUpdates.getter();
  sub_1000278CC(&qword_100062E48, v24, (void (*)(uint64_t))type metadata accessor for SevereNotificationsManager);
  Configurable.setting<A>(_:)();
  swift_release();
  if (v42 == 1)
  {
    UUID.init()();
    WeatherAlert.id.setter();
    WeatherAlert.issuedTime.getter();
    sub_100026EE8(0.0, 1000.0);
    Date.addingTimeInterval(_:)();
    uint64_t v25 = v34;
    uint64_t v26 = *(void (**)(char *, uint64_t))(v35 + 8);
    v26(v20, v34);
    WeatherAlert.issuedTime.setter();
    WeatherAlert.expireTime.getter();
    sub_100026EE8(0.0, 10000.0);
    Date.addingTimeInterval(_:)();
    uint64_t v23 = (uint64_t)v33;
    v26(v20, v25);
    WeatherAlert.expireTime.setter();
  }
  uint64_t v27 = v37;
  uint64_t v28 = v40;
  uint64_t v29 = v41;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v40, v23, v41);
  sub_100008CEC(v28, 0, 1, v29);
  sub_100005280(&qword_100062EA8);
  swift_allocObject();
  uint64_t v30 = Promise.init(value:)();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v23, v29);
  (*(void (**)(char *, void))(v17 + 8))(v39, v32[0]);
  return v30;
}

uint64_t sub_10001D1C8(void *a1, uint64_t a2, uint64_t (**a3)(char *, uint64_t), uint64_t *a4)
{
  uint64_t v5 = v4;
  uint64_t v132 = a4;
  uint64_t v116 = type metadata accessor for JSONDecoder.DateDecodingStrategy();
  uint64_t v115 = *(void *)(v116 - 8);
  __chkstk_darwin(v116);
  uint64_t v114 = (char *)&v97 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for SevereNotification();
  uint64_t v112 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (uint64_t *)((char *)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (uint64_t *)((char *)&v97 - v15);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v111 = (uint64_t)&v97 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  unint64_t v21 = (uint64_t *)((char *)&v97 - v20);
  uint64_t v113 = v22;
  __chkstk_darwin(v19);
  int64_t v120 = (uint64_t *)((char *)&v97 - v23);
  uint64_t v24 = sub_100005280(&qword_100062878);
  __chkstk_darwin(v24 - 8);
  uint64_t v117 = (uint64_t)&v97 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = type metadata accessor for Expression();
  uint64_t v118 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  uint64_t v123 = (char *)&v97 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = type metadata accessor for UUID();
  uint64_t v129 = *(void (***)(char *, uint64_t))(v136 - 8);
  __chkstk_darwin(v136);
  uint64_t v135 = (char *)&v97 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = type metadata accessor for WeatherAlert();
  uint64_t v137 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  uint64_t v133 = (char *)&v97 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for Location();
  uint64_t v124 = *(void *)(v29 - 8);
  uint64_t v125 = v29;
  __chkstk_darwin(v29);
  uint64_t v127 = (char *)&v97 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = type metadata accessor for Logger();
  uint64_t v121 = *(void *)(v122 - 8);
  __chkstk_darwin(v122);
  uint64_t v126 = (char *)&v97 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Settings.Notifications.Severe.filterIncomingEvents.getter();
  uint64_t v32 = type metadata accessor for SevereNotificationsManager();
  sub_1000278CC(&qword_100062E48, v33, (void (*)(uint64_t))type metadata accessor for SevereNotificationsManager);
  uint64_t v110 = v32;
  Configurable.setting<A>(_:)();
  swift_release();
  if (LOBYTE(v139[0]) != 1)
  {
    sub_10001E264(a2, (uint64_t)a3, v132, v13);
    if (!v4)
    {
      sub_100005370(a1 + 22, a1[25]);
      sub_1000280C0();
      unint64_t v21 = v39;
      sub_100027A28();
    }
    return (uint64_t)v21;
  }
  uint64_t v108 = v21;
  uint64_t v138 = a3;
  uint64_t v109 = a1[47];
  ReferenceCountedLazy.increase()();
  uint64_t v34 = v139[0];
  uint64_t v35 = &_swiftEmptySetSingleton;
  v139[0] = (uint64_t)&_swiftEmptySetSingleton;
  unint64_t v21 = *(uint64_t **)(a2 + 16);
  if (!v21)
  {
LABEL_9:
    if (v35[2] == 1)
    {
      uint64_t v106 = sub_100013818((uint64_t)v35);
      unint64_t v41 = v40;
      swift_bridgeObjectRelease();
      if (v41)
      {
        uint64_t v104 = a1;
        char v42 = v126;
        static Logger.notifications.getter();
        uint64_t v43 = v124;
        uint64_t v44 = v125;
        (*(void (**)(char *, uint64_t (**)(char *, uint64_t), uint64_t))(v124 + 16))(v127, v138, v125);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v45 = Logger.logObject.getter();
        int v103 = static os_log_type_t.default.getter();
        BOOL v46 = os_log_type_enabled(v45, (os_log_type_t)v103);
        uint64_t v107 = a2;
        uint64_t v105 = v41;
        if (v46)
        {
          os_log_t v102 = v45;
          uint64_t v47 = swift_slowAlloc();
          uint64_t v100 = swift_slowAlloc();
          v139[0] = v100;
          *(_DWORD *)uint64_t v47 = 136315907;
          swift_bridgeObjectRetain();
          uint64_t v140 = sub_1000466F4(v106, v41, v139);
          uint64_t v99 = &v141;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          uint64_t v101 = v47;
          *(_WORD *)(v47 + 12) = 2082;
          if (v21)
          {
            uint64_t v98 = v34;
            uint64_t v131 = *(void (**)(char *, uint64_t, uint64_t))(v137 + 16);
            uint64_t v48 = v107 + ((*(unsigned __int8 *)(v137 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v137 + 80));
            uint64_t v49 = *(void *)(v137 + 72);
            ++v129;
            uint64_t v130 = v49;
            v137 += 16;
            uint64_t v128 = (void (**)(char *, uint64_t))(v137 - 8);
            swift_bridgeObjectRetain();
            uint64_t v50 = _swiftEmptyArrayStorage;
            uint64_t v51 = v133;
            do
            {
              uint64_t v52 = v134;
              v131(v51, v48, v134);
              os_log_t v53 = v135;
              WeatherAlert.id.getter();
              uint64_t v54 = UUID.uuidString.getter();
              uint64_t v56 = v55;
              (*v129)(v53, v136);
              (*v128)(v51, v52);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_100033334(0, v50[2] + 1, 1, (uint64_t)v50);
                uint64_t v50 = v60;
              }
              unint64_t v58 = v50[2];
              unint64_t v57 = v50[3];
              if (v58 >= v57 >> 1)
              {
                sub_100033334(v57 > 1, v58 + 1, 1, (uint64_t)v50);
                uint64_t v50 = v61;
              }
              void v50[2] = v58 + 1;
              uint64_t v59 = &v50[2 * v58];
              v59[4] = v54;
              v59[5] = v56;
              v48 += v130;
              unint64_t v21 = (uint64_t *)((char *)v21 - 1);
            }
            while (v21);
            swift_bridgeObjectRelease();
            uint64_t v66 = v132;
            uint64_t v34 = v98;
          }
          else
          {
            uint64_t v66 = v132;
          }
          uint64_t v67 = v101;
          uint64_t v68 = Array.description.getter();
          unint64_t v70 = v69;
          swift_bridgeObjectRelease();
          uint64_t v140 = sub_1000466F4(v68, v70, v139);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v67 + 22) = 2160;
          uint64_t v140 = 1752392040;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v67 + 32) = 2081;
          uint64_t v71 = v127;
          uint64_t v72 = Location.id.getter();
          uint64_t v140 = sub_1000466F4(v72, v73, v139);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v124 + 8))(v71, v125);
          os_log_t v74 = v102;
          _os_log_impl((void *)&_mh_execute_header, v102, (os_log_type_t)v103, "Updating existing notification: %s with alerts: %{public}s for location: %{private,mask.hash}s", (uint8_t *)v67, 0x2Au);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(char *, uint64_t))(v121 + 8))(v126, v122);
          uint64_t v63 = v138;
          uint64_t v65 = v123;
          os_log_t v64 = v66;
        }
        else
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v43 + 8))(v127, v44);

          (*(void (**)(char *, uint64_t))(v121 + 8))(v42, v122);
          uint64_t v63 = v138;
          os_log_t v64 = v132;
          uint64_t v65 = v123;
        }
        uint64_t v75 = v104;
        NotificationStore.severeNotifications.getter();
        if (!v5)
        {
          dispatch thunk of Table.query.getter();
          swift_release();
          v139[3] = (uint64_t)&type metadata for String;
          v139[4] = (uint64_t)&protocol witness table for String;
          v139[0] = v106;
          v139[1] = v105;
          swift_bridgeObjectRetain();
          == infix(_:_:)();
          sub_100008AD0((uint64_t)v139);
          uint64_t v76 = type metadata accessor for OrderBy();
          uint64_t v77 = v117;
          sub_100008CEC(v117, 1, 1, v76);
          uint64_t v78 = dispatch thunk of Query.where(_:orderBy:limit:)();
          uint64_t v98 = v34;
          uint64_t v81 = v78;
          swift_release();
          sub_1000277BC(v77, &qword_100062878);
          (*(void (**)(char *, uint64_t))(v118 + 8))(v65, v119);
          uint64_t v82 = swift_allocObject();
          *(void *)(v82 + 16) = &_swiftEmptyDictionarySingleton;
          uint64_t v83 = v82 + 16;
          type metadata accessor for JSONDecoder();
          swift_allocObject();
          uint64_t v84 = (uint64_t)v63;
          uint64_t v85 = v64;
          uint64_t v86 = JSONDecoder.init()();
          (*(void (**)(char *, void, uint64_t))(v115 + 104))(v114, enum case for JSONDecoder.DateDecodingStrategy.secondsSince1970(_:), v116);
          dispatch thunk of JSONDecoder.dateDecodingStrategy.setter();
          swift_retain();
          uint64_t v87 = sub_100016C2C(v81, v86);
          swift_bridgeObjectRelease();
          uint64_t v88 = v107;
          swift_bridgeObjectRetain();
          v139[0] = sub_100016654((uint64_t)v87, v88, v83);
          uint64_t v89 = swift_bridgeObjectRetain();
          sub_100026FF4(v89);
          uint64_t v90 = v108;
          sub_10001E264(v139[0], v84, v85, v108);
          swift_bridgeObjectRelease();
          uint64_t v137 = sub_100027A84(0, (unint64_t *)&qword_100063FE0);
          uint64_t v91 = (void *)static OS_dispatch_queue.notifications.getter();
          uint64_t v138 = (uint64_t (**)(char *, uint64_t))type metadata accessor for SevereNotification;
          uint64_t v92 = v111;
          sub_1000279D4((uint64_t)v90, v111, (void (*)(void))type metadata accessor for SevereNotification);
          unint64_t v93 = (*(unsigned __int8 *)(v112 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v112 + 80);
          uint64_t v94 = swift_allocObject();
          uint64_t v95 = v105;
          *(void *)(v94 + 16) = v106;
          *(void *)(v94 + 24) = v95;
          sub_10002729C(v92, v94 + v93, (void (*)(void))type metadata accessor for SevereNotification);
          firstly<A, B>(on:disposeOn:closure:)();

          swift_release();
          uint64_t v96 = (void *)static OS_dispatch_queue.notifications.getter();
          swift_retain();
          unint64_t v21 = (uint64_t *)Promise.then<A, B>(on:disposeOn:closure:)();
          swift_release();

          swift_release();
          swift_release();
          sub_100027A28();
          swift_release();
          ReferenceCountedLazy.decrease()();
LABEL_32:
          swift_release();
          return (uint64_t)v21;
        }
        swift_bridgeObjectRelease();
        swift_errorRelease();
        sub_10001E264(v107, (uint64_t)v63, v64, v120);
        sub_100005370(v75 + 22, v75[25]);
        sub_1000280C0();
        unint64_t v21 = v79;
LABEL_31:
        sub_100027A28();
        ReferenceCountedLazy.decrease()();
        goto LABEL_32;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_10001E264(a2, (uint64_t)v138, v132, v16);
    if (v5)
    {
      ReferenceCountedLazy.decrease()();
      swift_release();
      return (uint64_t)v21;
    }
    sub_100005370(a1 + 22, a1[25]);
    sub_1000280C0();
    unint64_t v21 = v62;
    goto LABEL_31;
  }
  uint64_t v36 = a2 + ((*(unsigned __int8 *)(v137 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v137 + 80));
  uint64_t v37 = *(void *)(v137 + 72);
  swift_bridgeObjectRetain();
  unint64_t v38 = v21;
  while (1)
  {
    sub_10001E528((uint64_t)v139, v36, v34, v138);
    if (v5) {
      break;
    }
    uint64_t v5 = 0;
    v36 += v37;
    unint64_t v38 = (uint64_t *)((char *)v38 - 1);
    if (!v38)
    {
      swift_bridgeObjectRelease();
      uint64_t v35 = (void *)v139[0];
      goto LABEL_9;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_10001E264@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v29 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005280(&qword_100062F20);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (uint64_t *)((char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = type metadata accessor for SevereNotificationContent();
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005370((void *)(v4 + 136), *(void *)(v4 + 160));
  uint64_t v30 = a2;
  uint64_t v31 = a1;
  sub_100013FC0(a1, a2, (uint64_t)a3, v14);
  if (sub_1000093BC((uint64_t)v14, 1, v15) == 1)
  {
    sub_1000277BC((uint64_t)v14, &qword_100062F20);
    sub_100027464();
    swift_allocError();
    *uint64_t v18 = 0;
    return swift_willThrow();
  }
  else
  {
    sub_10002729C((uint64_t)v14, (uint64_t)v17, (void (*)(void))type metadata accessor for SevereNotificationContent);
    UUID.init()();
    uint64_t v20 = UUID.uuidString.getter();
    uint64_t v22 = v21;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v29);
    uint64_t v23 = *a3;
    uint64_t v24 = a3[1];
    uint64_t v25 = type metadata accessor for SevereNotification();
    sub_10002729C((uint64_t)v17, (uint64_t)a4 + *(int *)(v25 + 28), (void (*)(void))type metadata accessor for SevereNotificationContent);
    uint64_t v26 = (char *)a4 + *(int *)(v25 + 32);
    uint64_t v27 = type metadata accessor for Location();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v26, v30, v27);
    *a4 = v20;
    a4[1] = v22;
    a4[2] = v23;
    a4[3] = v24;
    a4[4] = v31;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10001E528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(char *, uint64_t))
{
  uint64_t v75 = a4;
  uint64_t v73 = a2;
  uint64_t v81 = a1;
  uint64_t v4 = type metadata accessor for SevereNotificationEntity();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v68 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v68 - v12;
  uint64_t v14 = sub_100005280(&qword_100062878);
  __chkstk_darwin(v14 - 8);
  uint64_t v78 = (uint64_t *)((char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = type metadata accessor for Expression();
  uint64_t v79 = *(void *)(v16 - 8);
  uint64_t v80 = (void *)v16;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v68 - v21;
  uint64_t v23 = __chkstk_darwin(v20);
  uint64_t v25 = (char *)&v68 - v24;
  uint64_t v26 = __chkstk_darwin(v23);
  uint64_t v72 = (char *)&v68 - v27;
  __chkstk_darwin(v26);
  os_log_t v74 = (char *)&v68 - v28;
  uint64_t v29 = v88;
  NotificationStore.severeNotifications.getter();
  if (v29) {
    return swift_errorRelease();
  }
  uint64_t v76 = v13;
  uint64_t v77 = v11;
  unint64_t v69 = v8;
  uint64_t v88 = v4;
  uint64_t v71 = 0;
  uint64_t v70 = dispatch thunk of Table.query.getter();
  swift_release();
  uint64_t v31 = type metadata accessor for Date();
  uint64_t v86 = (void *)v31;
  uint64_t v87 = &protocol witness table for Date;
  sub_100008E24(&v84);
  Date.init(timeIntervalSinceNow:)();
  >= infix(_:_:)();
  sub_100008AD0((uint64_t)&v84);
  uint64_t v32 = WeatherAlert.description.getter();
  uint64_t v86 = &type metadata for String;
  uint64_t v87 = &protocol witness table for String;
  uint64_t v84 = v32;
  uint64_t v85 = v33;
  == infix(_:_:)();
  sub_100008AD0((uint64_t)&v84);
  && infix(_:_:)();
  uint64_t v34 = v80;
  uint64_t v35 = *(void (**)(char *, void *))(v79 + 8);
  v35(v19, v80);
  v35(v22, v34);
  uint64_t v86 = (void *)v31;
  uint64_t v87 = &protocol witness table for Date;
  sub_100008E24(&v84);
  WeatherAlert.issuedTime.getter();
  >= infix(_:_:)();
  sub_100008AD0((uint64_t)&v84);
  uint64_t v36 = v72;
  && infix(_:_:)();
  v35(v22, v34);
  v35(v25, v34);
  uint64_t v37 = Location.id.getter();
  uint64_t v86 = &type metadata for String;
  uint64_t v87 = &protocol witness table for String;
  uint64_t v84 = v37;
  uint64_t v85 = v38;
  == infix(_:_:)();
  sub_100008AD0((uint64_t)&v84);
  uint64_t v39 = v74;
  && infix(_:_:)();
  v35(v25, v34);
  v35(v36, v34);
  uint64_t v40 = type metadata accessor for OrderBy();
  unint64_t v41 = v78;
  sub_100008CEC((uint64_t)v78, 1, 1, v40);
  uint64_t v42 = v71;
  uint64_t v43 = dispatch thunk of Query.where(_:orderBy:limit:)();
  if (v42)
  {
    swift_release();
    swift_errorRelease();
    sub_1000277BC((uint64_t)v41, &qword_100062878);
    return ((uint64_t (*)(char *, void *))v35)(v39, v34);
  }
  uint64_t v44 = v43;
  swift_release();
  sub_1000277BC((uint64_t)v41, &qword_100062878);
  v35(v39, v34);
  uint64_t v45 = _swiftEmptyArrayStorage;
  uint64_t v82 = (char *)_swiftEmptyArrayStorage;
  BOOL v46 = *(void **)(v44 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v80 = v46;
  uint64_t v73 = 0;
  if (v46)
  {
    unint64_t v47 = 0;
    uint64_t v75 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
    uint64_t v78 = (void *)(v5 + 32);
    uint64_t v79 = v5 + 16;
    uint64_t v48 = v76;
    uint64_t v49 = v77;
    while (v47 < *(void *)(v44 + 16))
    {
      unint64_t v50 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      uint64_t v51 = *(void *)(v5 + 72);
      uint64_t v52 = v88;
      (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v48, v44 + v50 + v51 * v47, v88);
      SevereNotificationEntity.replacementAlert.getter();
      dispatch thunk of Column.value.getter();
      swift_release();
      uint64_t v53 = v85;
      sub_10000F430(v84, v85);
      if (v53 == 1)
      {
        uint64_t v54 = v48;
        uint64_t v55 = v5;
        uint64_t v56 = (uint64_t (*)(char *, char *, uint64_t))*v78;
        ((void (*)(char *, char *, uint64_t))*v78)(v49, v54, v52);
        unint64_t v57 = v82;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100012108(0, *((void *)v57 + 2) + 1, 1);
          unint64_t v57 = v82;
        }
        unint64_t v59 = *((void *)v57 + 2);
        unint64_t v58 = *((void *)v57 + 3);
        if (v59 >= v58 >> 1)
        {
          sub_100012108(v58 > 1, v59 + 1, 1);
          unint64_t v57 = v82;
        }
        *((void *)v57 + 2) = v59 + 1;
        uint64_t v49 = v77;
        uint64_t result = v56(&v57[v50 + v59 * v51], v77, v88);
        uint64_t v82 = v57;
        uint64_t v5 = v55;
        uint64_t v48 = v76;
      }
      else
      {
        uint64_t result = (*v75)(v48, v52);
      }
      if (v80 == (void *)++v47)
      {
        uint64_t v45 = v82;
        goto LABEL_17;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_17:
    swift_bridgeObjectRelease_n();
    uint64_t v60 = v45[2];
    uint64_t v61 = v88;
    if (!v60) {
      return swift_release();
    }
    uint64_t v62 = v5 + 16;
    uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    os_log_t v64 = (char *)v45 + ((*(unsigned __int8 *)(v62 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 64));
    uint64_t v65 = (void (**)(char *, uint64_t))(v62 - 8);
    uint64_t v66 = *(void *)(v62 + 56);
    uint64_t v80 = v45;
    swift_retain();
    uint64_t v67 = v69;
    while (1)
    {
      v63(v67, v64, v61);
      SevereNotificationEntity.notificationIdentifier.getter();
      dispatch thunk of Column.value.getter();
      uint64_t result = swift_release();
      if (!v83) {
        break;
      }
      sub_1000258E8(&v84, (Swift::Int)v82, v83);
      swift_bridgeObjectRelease();
      (*v65)(v67, v61);
      v64 += v66;
      if (!--v60) {
        return swift_release_n();
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10001ECF0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v112 = a1;
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = type metadata accessor for Date();
  uint64_t v116 = *(uint64_t **)(v104 - 8);
  uint64_t v11 = __chkstk_darwin(v104);
  int v103 = (char *)&v93 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  os_log_t v102 = (char *)&v93 - v13;
  uint64_t v14 = type metadata accessor for UUID();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v111 = (char *)&v93 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v93 - v18;
  uint64_t v114 = type metadata accessor for WeatherAlert();
  uint64_t v20 = *(void *)(v114 - 8);
  uint64_t v21 = __chkstk_darwin(a2);
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v23 = __chkstk_darwin(v22);
  uint64_t v24 = __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v93 - v25;
  uint64_t v27 = __chkstk_darwin(v24);
  uint64_t v113 = (char *)&v93 - v31;
  if (!*(void *)(v27 + 16)) {
    return 1;
  }
  os_log_t v117 = *(os_log_t *)(v27 + 16);
  uint64_t v107 = v30;
  unint64_t v93 = v29;
  uint64_t v98 = v28;
  uint64_t v109 = v19;
  uint64_t v97 = v10;
  uint64_t v94 = v8;
  uint64_t v95 = v7;
  uint64_t v96 = a3;
  uint64_t v100 = v4;
  uint64_t v33 = *(void (**)(char *, unint64_t, uint64_t))(v20 + 16);
  uint64_t v32 = v20 + 16;
  uint64_t v119 = v33;
  unint64_t v34 = v27 + ((*(unsigned __int8 *)(v32 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 64));
  uint64_t v110 = (void (**)(char *, uint64_t))(v15 + 8);
  uint64_t v101 = (void (**)(char *, uint64_t))(v116 + 1);
  uint64_t v106 = *(void *)(v32 + 56);
  uint64_t v99 = v27;
  swift_bridgeObjectRetain();
  uint64_t v36 = v113;
  uint64_t v35 = v114;
  uint64_t v108 = v14;
  unint64_t v120 = v32 - 8;
  uint64_t v118 = v32;
  while (1)
  {
    v119(v36, v34, v35);
    uint64_t v37 = v109;
    WeatherAlert.id.getter();
    uint64_t v38 = v111;
    unint64_t v39 = v112;
    WeatherAlert.id.getter();
    char v40 = static UUID.== infix(_:_:)();
    unint64_t v41 = *v110;
    (*v110)(v38, v14);
    v41(v37, v14);
    if (v40)
    {
      (*(void (**)(char *, uint64_t))v120)(v36, v114);
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v105 = v41;
    uint64_t v42 = WeatherAlert.description.getter();
    uint64_t v44 = v43;
    BOOL v46 = v42 == WeatherAlert.description.getter() && v44 == v45;
    uint64_t v47 = v120 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    if (v46) {
      break;
    }
    char v48 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v49 = v114;
    unint64_t v50 = (void (*)(uint64_t, uint64_t, uint64_t))v119;
    v119(v26, (unint64_t)v36, v114);
    uint64_t v51 = v26;
    uint64_t v52 = v107;
    unint64_t v53 = v39;
    uint64_t v35 = v49;
    v50(v107, v53, v49);
    if (v48) {
      goto LABEL_11;
    }
    uint64_t v54 = *(void (**)(char *, uint64_t))v120;
    (*(void (**)(uint64_t, uint64_t))v120)(v52, v49);
    v54(v51, v49);
    uint64_t v26 = v51;
LABEL_13:
    uint64_t v36 = v113;
    v54(v113, v35);
    v34 += v106;
    os_log_t v117 = (os_log_t)((char *)v117 - 1);
    uint64_t v14 = v108;
    if (!v117)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
  }
  swift_bridgeObjectRelease_n();
  uint64_t v55 = v114;
  uint64_t v56 = (void (*)(uint64_t, uint64_t, uint64_t))v119;
  v119(v26, (unint64_t)v36, v114);
  uint64_t v51 = v26;
  uint64_t v52 = v107;
  unint64_t v57 = v39;
  uint64_t v35 = v55;
  v56(v107, v57, v55);
LABEL_11:
  uint64_t v115 = v34;
  uint64_t v116 = (uint64_t *)v47;
  unint64_t v58 = v51;
  unint64_t v59 = v102;
  WeatherAlert.issuedTime.getter();
  uint64_t v60 = v103;
  WeatherAlert.expireTime.getter();
  sub_1000278CC(&qword_100062F00, 255, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v61 = v104;
  char v62 = dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v63 = *v101;
  (*v101)(v60, v61);
  v63(v59, v61);
  uint64_t v54 = *(void (**)(char *, uint64_t))v120;
  (*(void (**)(uint64_t, uint64_t))v120)(v52, v35);
  v54(v58, v35);
  if (v62)
  {
    uint64_t v26 = v58;
    unint64_t v34 = v115;
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
  uint64_t v65 = v97;
  static Logger.notifications.getter();
  uint64_t v66 = v93;
  uint64_t v67 = (void (*)(uint64_t, char *, uint64_t))v119;
  v119(v93, v112, v35);
  uint64_t v68 = v98;
  v67((uint64_t)v98, v113, v35);
  unint64_t v69 = Logger.logObject.getter();
  os_log_type_t v70 = static os_log_type_t.default.getter();
  int v71 = v70;
  if (os_log_type_enabled(v69, v70))
  {
    uint64_t v72 = swift_slowAlloc();
    uint64_t v119 = (void (*)(char *, unint64_t, uint64_t))swift_slowAlloc();
    uint64_t v123 = v119;
    *(_DWORD *)uint64_t v72 = 136446466;
    uint64_t v115 = v72 + 4;
    LODWORD(v118) = v71;
    uint64_t v73 = v109;
    os_log_t v117 = v69;
    WeatherAlert.id.getter();
    uint64_t v74 = UUID.uuidString.getter();
    unint64_t v76 = v75;
    uint64_t v77 = v108;
    uint64_t v78 = v105;
    v105(v73, v108);
    uint64_t v121 = sub_1000466F4(v74, v76, (uint64_t *)&v123);
    uint64_t v116 = &v122;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v54(v66, v114);
    *(_WORD *)(v72 + 12) = 2082;
    uint64_t v115 = v72 + 14;
    WeatherAlert.id.getter();
    uint64_t v79 = UUID.uuidString.getter();
    unint64_t v81 = v80;
    v78(v73, v77);
    uint64_t v121 = sub_1000466F4(v79, v81, (uint64_t *)&v123);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v82 = v73;
    swift_bridgeObjectRelease();
    v54(v98, v114);
    os_log_t v83 = v117;
    _os_log_impl((void *)&_mh_execute_header, v117, (os_log_type_t)v118, "Replacing existing alert: %{public}s with alert: %{public}s", (uint8_t *)v72, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v94 + 8))(v97, v95);
  }
  else
  {
    v54(v66, v35);
    v54(v68, v35);

    (*(void (**)(char *, uint64_t))(v94 + 8))(v65, v95);
    uint64_t v82 = v109;
  }
  WeatherAlert.id.getter();
  uint64_t v119 = (void (*)(char *, unint64_t, uint64_t))UUID.uuidString.getter();
  uint64_t v85 = v84;
  uint64_t v86 = v108;
  uint64_t v87 = v105;
  v105(v82, v108);
  uint64_t v88 = v111;
  uint64_t v89 = v113;
  WeatherAlert.id.getter();
  uint64_t v90 = UUID.uuidString.getter();
  uint64_t v92 = v91;
  v87(v88, v86);
  sub_1000251E8(v90, v92, (uint64_t)v119, v85);
  swift_bridgeObjectRelease();
  v54(v89, v114);
  return 0;
}

void sub_10001F74C(uint64_t a1)
{
}

uint64_t sub_10001F7B0()
{
  ReferenceCountedLazy.increase()();
  swift_beginAccess();
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_10001FCE0(v0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10002734C);
  swift_bridgeObjectRelease();
  sub_100005280(&qword_100062ED0);
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v1 = Promise.init(value:)();
  ReferenceCountedLazy.decrease()();
  swift_release();
  return v1;
}

uint64_t sub_10001F8A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v35 = a3;
  uint64_t v36 = a4;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v6 = sub_100005280(&qword_100062878);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Expression();
  uint64_t v37 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005280(&qword_100062EF8);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for SevereNotificationEntity();
  uint64_t v15 = *(void *)(v40 - 8);
  uint64_t v16 = __chkstk_darwin(v40);
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v29 - v19;
  NotificationStore.severeNotifications.getter();
  uint64_t v33 = v15;
  uint64_t v34 = v9;
  uint64_t v30 = v18;
  uint64_t v31 = v20;
  uint64_t v32 = a5;
  dispatch thunk of Table.query.getter();
  swift_release();
  v41[3] = &type metadata for String;
  v41[4] = &protocol witness table for String;
  v41[0] = v38;
  v41[1] = v39;
  swift_bridgeObjectRetain();
  == infix(_:_:)();
  sub_100008AD0((uint64_t)v41);
  uint64_t v21 = type metadata accessor for OrderBy();
  sub_100008CEC((uint64_t)v8, 1, 1, v21);
  dispatch thunk of Query.first(_:orderBy:)();
  swift_release();
  sub_1000277BC((uint64_t)v8, &qword_100062878);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v34);
  uint64_t v23 = v40;
  int v24 = sub_1000093BC((uint64_t)v14, 1, v40);
  if (v24 == 1) {
    return sub_1000277BC((uint64_t)v14, &qword_100062EF8);
  }
  uint64_t v25 = v33;
  uint64_t v26 = v31;
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v31, v14, v23);
  NotificationStore.severeNotifications.getter();
  dispatch thunk of Table.save.getter();
  swift_release();
  uint64_t v27 = v30;
  SevereNotificationEntity.markAsReplaced(by:)();
  dispatch thunk of Save.entity(_:)();
  swift_release();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v25 + 8);
  v28(v27, v23);
  return ((uint64_t (*)(char *, uint64_t))v28)(v26, v23);
}

uint64_t sub_10001FCE0(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_10002742C(a1, v20);
  uint64_t v3 = v20[0];
  uint64_t v21 = v20[1];
  int64_t v4 = v20[3];
  unint64_t v5 = v20[4];
  int64_t v6 = (unint64_t)(v20[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v4 << 6);
  while (1)
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (uint64_t *)(*(void *)(v3 + 56) + 16 * v9);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v15, v16, v18, v19);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v10 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v10 >= v6) {
      return swift_release();
    }
    unint64_t v11 = *(void *)(v21 + 8 * v10);
    int64_t v12 = v4 + 1;
    if (!v11)
    {
      int64_t v12 = v4 + 2;
      if (v4 + 2 >= v6) {
        return swift_release();
      }
      unint64_t v11 = *(void *)(v21 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v4 + 3;
        if (v4 + 3 >= v6) {
          return swift_release();
        }
        unint64_t v11 = *(void *)(v21 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v4 + 4;
          if (v4 + 4 >= v6) {
            return swift_release();
          }
          unint64_t v11 = *(void *)(v21 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v4 + 5;
            if (v4 + 5 >= v6) {
              return swift_release();
            }
            unint64_t v11 = *(void *)(v21 + 8 * v12);
            if (!v11)
            {
              int64_t v13 = v4 + 6;
              while (v13 < v6)
              {
                unint64_t v11 = *(void *)(v21 + 8 * v13++);
                if (v11)
                {
                  int64_t v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
              return swift_release();
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v4 = v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001FE94()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchPredicate();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (uint64_t *)((char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  *unint64_t v5 = static OS_dispatch_queue.notifications.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  char v6 = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    if (*(unsigned char *)(v1 + 416) == 1)
    {
      sub_100005370((void *)(v1 + 256), *(void *)(v1 + 280));
      sub_1000278CC(&qword_100062E38, v8, (void (*)(uint64_t))type metadata accessor for SevereNotificationsManager);
      uint64_t result = dispatch thunk of LocationManagerType.removeObserver(_:)();
      *(unsigned char *)(v1 + 416) = 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100020024()
{
  sub_100008AD0(v0 + 16);
  sub_100008AD0(v0 + 56);
  sub_100008AD0(v0 + 96);
  sub_100008AD0(v0 + 136);
  sub_100008AD0(v0 + 176);
  sub_100008AD0(v0 + 216);
  sub_100008AD0(v0 + 256);
  sub_100008AD0(v0 + 296);
  sub_100008AD0(v0 + 336);
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  return v0;
}

uint64_t sub_1000200B4()
{
  sub_100020024();
  return _swift_deallocClassInstance(v0, 432, 7);
}

uint64_t type metadata accessor for SevereNotificationsManager()
{
  return self;
}

uint64_t sub_10002010C()
{
  type metadata accessor for Logger();
  sub_1000053F4();
  __chkstk_darwin();
  sub_100027C54();
  uint64_t v1 = (void *)Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (sub_100027D4C(v2))
  {
    *(_WORD *)sub_100027E10() = 0;
    sub_100027CE4((void *)&_mh_execute_header, v3, v4, "Setting up severe weather notifications");
    sub_100012FA4();
  }

  uint64_t v5 = sub_100027C8C();
  v6(v5);
  uint64_t v7 = sub_100005370((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_1000341F8(v0, *v7);
  swift_retain();
  Debouncer.execute(_:)();
  return swift_release();
}

uint64_t sub_100020218()
{
  uint64_t v1 = v0;
  type metadata accessor for Logger();
  sub_1000053F4();
  __chkstk_darwin(v2);
  sub_100027C54();
  uint64_t v3 = (void *)Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (sub_100027D4C(v4))
  {
    *(_WORD *)sub_100027E10() = 0;
    sub_100027CE4((void *)&_mh_execute_header, v5, v6, "Requested cloud channel subscription validation");
    sub_100012FA4();
  }

  uint64_t v7 = sub_100027C8C();
  v8(v7);
  ReferenceCountedLazy.increase()();
  NotificationEnablementTracker.trackEnablement()();
  ReferenceCountedLazy.decrease()();
  sub_1000171FC();
  sub_100027A84(0, (unint64_t *)&unk_100063E50);
  id v9 = sub_100043E54();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v1;
  *(void *)(v10 + 24) = v9;
  id v11 = objc_allocWithZone((Class)sub_100005280(&qword_100062F98));
  swift_retain();
  id v12 = v9;
  int64_t v13 = (void *)AsyncBlockOperation.init(_:)();
  sub_100005280(&qword_100062850);
  id v14 = v13;
  uint64_t v15 = Promise.__allocating_init(_:scheduleOn:)();
  swift_release();

  return v15;
}

uint64_t sub_1000203FC()
{
  type metadata accessor for Logger();
  sub_1000053F4();
  __chkstk_darwin(v1);
  sub_100027C54();
  uint64_t v2 = (void *)Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (sub_100027D4C(v3))
  {
    *(_WORD *)sub_100027E10() = 0;
    sub_100027CE4((void *)&_mh_execute_header, v4, v5, "Invalidating severe notifications management");
    sub_100012FA4();
  }

  uint64_t v6 = sub_100027C8C();
  v7(v6);
  Debouncer.cancel()();
  [*(id *)(v0 + 400) cancelAllOperations];
  [*(id *)(v0 + 408) cancelAllOperations];
  id v8 = objc_allocWithZone((Class)sub_100005280(&qword_100062F98));
  swift_retain();
  id v9 = (void *)AsyncBlockOperation.init(_:)();
  sub_100005280(&qword_100062850);
  id v10 = v9;
  uint64_t v11 = Promise.__allocating_init(_:scheduleOn:)();

  return v11;
}

uint64_t sub_100020560()
{
  sub_10001FE94();
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  uint64_t v0 = (void *)static OS_dispatch_queue.notifications.getter();
  firstly<A, B>(on:disposeOn:closure:)();

  uint64_t v1 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v2 = Promise.then<A, B>(on:disposeOn:closure:)();
  swift_release();

  return v2;
}

uint64_t sub_100020668(uint64_t a1)
{
  return sub_1000488C8();
}

void sub_1000206A4(uint64_t a1, uint64_t a2)
{
}

void sub_1000206DC(uint64_t a1)
{
  sub_100027A84(0, &qword_100062FC8);
  id v2 = (id)static NSOperationQueue.notifications.getter();
  [v2 addOperation:a1];
}

uint64_t sub_10002074C(uint64_t a1, void *a2)
{
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  os_log_type_t v3 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_100005280(&qword_100062FA0);
  type metadata accessor for SevereNotificationsManager();
  firstly<A, B>(on:disposeOn:closure:)();

  uint64_t v4 = (void *)static OS_dispatch_queue.notifications.getter();
  type metadata accessor for NotificationSubscription();
  sub_100008DE0(&qword_100062FA8, &qword_100062FA0);
  swift_retain();
  Promise<A>.compactMap<A>(on:closure:)();
  swift_release();

  swift_release();
  uint64_t v5 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_100005280(&qword_100062FB0);
  Promise.then<A, B>(on:disposeOn:closure:)();
  swift_release();

  uint64_t v6 = (void *)static OS_dispatch_queue.notifications.getter();
  Promise.then<A, B>(on:disposeOn:closure:)();
  swift_release();

  uint64_t v7 = (void *)zalgo.getter();
  Promise.error(on:closure:)();
  swift_release();

  *(void *)(swift_allocObject() + 16) = a2;
  id v8 = a2;
  id v9 = (void *)zalgo.getter();
  uint64_t v10 = Promise.always(on:closure:)();
  swift_release();
  swift_release();

  return v10;
}

uint64_t sub_1000209CC(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for NotificationSubscription.Kind();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005370((void *)(a1 + 216), *(void *)(a1 + 240));
  static NotificationSubscription.Kind.severe.getter();
  uint64_t v7 = dispatch thunk of NotificationSubscriptionManagerType.subscriptions(of:)();
  if (v1) {
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v9 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v10[1] = v9;
  sub_100005280(&qword_100062FB8);
  swift_allocObject();
  return Promise.init(value:)();
}

uint64_t sub_100020B20@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v78 = a1;
  uint64_t v5 = type metadata accessor for NotificationSubscription();
  uint64_t v76 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  int v71 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  unint64_t v69 = (char *)&v57 - v8;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v67 = *(void *)(v9 - 8);
  uint64_t v68 = v9;
  __chkstk_darwin(v9);
  uint64_t v72 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = type metadata accessor for Location();
  uint64_t v77 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v74 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for NotificationSubscription.Location();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v73 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v57 - v16;
  sub_100005370(a2 + 42, a2[45]);
  if ((dispatch thunk of NotificationAuthorizationStatusProviderType.hasNotificationAuthorization()() & 1) == 0) {
    return sub_100008CEC(a3, 1, 1, v5);
  }
  uint64_t v66 = a3;
  uint64_t v70 = v5;
  uint64_t v18 = v78;
  NotificationSubscription.location.getter();
  uint64_t v19 = NotificationSubscription.Location.id.getter();
  uint64_t v21 = v20;
  int v24 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v23 = v13 + 8;
  uint64_t v22 = v24;
  v24(v17, v12);
  if (v19 == static Location.currentLocationID.getter() && v21 == v25)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v27 & 1) == 0)
    {
      uint64_t v28 = v66;
      uint64_t v29 = v70;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v76 + 16))(v66, v18, v70);
      uint64_t v30 = v28;
      uint64_t v31 = 0;
      uint64_t v32 = v29;
      return sub_100008CEC(v30, v31, 1, v32);
    }
  }
  sub_100005370(a2 + 32, a2[35]);
  if (dispatch thunk of LocationManagerType.authorizationState.getter() != 3) {
    goto LABEL_12;
  }
  uint64_t v34 = v73;
  NotificationSubscription.location.getter();
  uint64_t v35 = v74;
  NotificationSubscription.Location.locationOverride.getter();
  v22(v34, v12);
  LOBYTE(v34) = Location.isNotificationSubscriptionCurrentLocationPlaceholder.getter();
  uint64_t v36 = v77 + 8;
  uint64_t v37 = *(void (**)(char *, uint64_t))(v77 + 8);
  v37(v35, v75);
  if (v34)
  {
LABEL_12:
    uint64_t v30 = v66;
    uint64_t v31 = 1;
    uint64_t v32 = v70;
    return sub_100008CEC(v30, v31, 1, v32);
  }
  uint64_t v64 = v23;
  uint64_t v65 = v12;
  uint64_t v77 = v36;
  static Logger.notifications.getter();
  uint64_t v38 = v76;
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v76 + 16);
  unint64_t v41 = v69;
  uint64_t v40 = v70;
  v39(v69, v18, v70);
  v39(v71, v18, v40);
  uint64_t v42 = Logger.logObject.getter();
  os_log_type_t v43 = static os_log_type_t.default.getter();
  int v63 = v43;
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v60 = v45;
    *(_DWORD *)uint64_t v44 = 141558787;
    uint64_t v79 = 1752392040;
    v80[0] = v45;
    char v62 = v80;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v44 + 12) = 2081;
    unint64_t v58 = (void (*)(char *, uint64_t))(v44 + 14);
    BOOL v46 = v73;
    os_log_t v59 = v42;
    NotificationSubscription.location.getter();
    uint64_t v47 = v74;
    NotificationSubscription.Location.location.getter();
    v22(v46, v65);
    Location.coordinate.getter();
    uint64_t v61 = v39;
    v37(v47, v75);
    uint64_t v48 = Double.description.getter();
    uint64_t v79 = sub_1000466F4(v48, v49, v80);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v50 = *(void (**)(char *, uint64_t))(v76 + 8);
    v76 += 8;
    unint64_t v58 = v50;
    v50(v41, v70);
    *(_WORD *)(v44 + 22) = 2160;
    uint64_t v79 = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v44 + 32) = 2081;
    unint64_t v69 = (char *)(v44 + 34);
    uint64_t v51 = v71;
    NotificationSubscription.location.getter();
    NotificationSubscription.Location.location.getter();
    v22(v46, v65);
    Location.coordinate.getter();
    uint64_t v39 = v61;
    v37(v47, v75);
    uint64_t v52 = Double.description.getter();
    uint64_t v79 = sub_1000466F4(v52, v53, v80);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v58(v51, v70);
    os_log_t v54 = v59;
    _os_log_impl((void *)&_mh_execute_header, v59, (os_log_type_t)v63, "Validate channel subscription with coordinate: %{private,mask.hash}s %{private,mask.hash}s", (uint8_t *)v44, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v40 = v70;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v55 = *(void (**)(char *, uint64_t))(v38 + 8);
    v55(v41, v40);
    v55(v71, v40);
  }
  (*(void (**)(char *, uint64_t))(v67 + 8))(v72, v68);
  uint64_t v56 = v66;
  v39((char *)v66, v78, v40);
  return sub_100008CEC(v56, 0, 1, v40);
}

uint64_t sub_1000212E0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  sub_100005370((void *)(a2 + 56), *(void *)(a2 + 80));
  return sub_1000372A4(v2);
}

void sub_100021328(uint64_t *a1, uint64_t a2)
{
  uint64_t v59 = a2;
  uint64_t v64 = type metadata accessor for CloudChannelSubscription();
  uint64_t v4 = *(void *)(v64 - 8);
  uint64_t v5 = __chkstk_darwin(v64);
  uint64_t v7 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v52 - v8;
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v15 = Logger.logObject.getter();
  int v60 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v15, (os_log_type_t)v60);
  uint64_t v61 = v14;
  uint64_t v62 = v2;
  if (v16)
  {
    os_log_t v55 = v15;
    uint64_t v56 = v13;
    uint64_t v57 = v11;
    uint64_t v58 = v10;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    uint64_t v67 = v53;
    *(_DWORD *)uint64_t v17 = 141558275;
    uint64_t v65 = 1752392040;
    v52[1] = &v66;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    os_log_t v54 = (uint8_t *)v17;
    *(_WORD *)(v17 + 12) = 2081;
    uint64_t v18 = *(void *)(v14 + 16);
    if (v18)
    {
      uint64_t v19 = v14 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
      v52[0] = v4;
      uint64_t v63 = *(void *)(v4 + 72);
      swift_bridgeObjectRetain();
      uint64_t v20 = _swiftEmptyArrayStorage;
      do
      {
        sub_1000279D4(v19, (uint64_t)v9, (void (*)(void))type metadata accessor for CloudChannelSubscription);
        uint64_t v65 = Location.id.getter();
        uint64_t v66 = v21;
        v22._countAndFlagsBits = 58;
        v22._object = (void *)0xE100000000000000;
        String.append(_:)(v22);
        uint64_t v23 = (uint64_t *)&v9[*(int *)(v64 + 20)];
        if (v23[1])
        {
          uint64_t v24 = *v23;
          uint64_t v25 = (void *)v23[1];
        }
        else
        {
          uint64_t v25 = (void *)0xE400000000000000;
          uint64_t v24 = 1701736270;
        }
        swift_bridgeObjectRetain();
        v26._countAndFlagsBits = v24;
        v26._object = v25;
        String.append(_:)(v26);
        swift_bridgeObjectRelease();
        uint64_t v28 = v65;
        uint64_t v27 = v66;
        sub_100027A28();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100033334(0, v20[2] + 1, 1, (uint64_t)v20);
          uint64_t v20 = v32;
        }
        unint64_t v30 = v20[2];
        unint64_t v29 = v20[3];
        if (v30 >= v29 >> 1)
        {
          sub_100033334(v29 > 1, v30 + 1, 1, (uint64_t)v20);
          uint64_t v20 = v33;
        }
        v20[2] = v30 + 1;
        uint64_t v31 = &v20[2 * v30];
        v31[4] = v28;
        v31[5] = v27;
        v19 += v63;
        --v18;
      }
      while (v18);
      uint64_t v14 = v61;
      swift_bridgeObjectRelease();
      uint64_t v4 = v52[0];
    }
    uint64_t v34 = v54;
    uint64_t v35 = Array.description.getter();
    unint64_t v37 = v36;
    swift_bridgeObjectRelease();
    uint64_t v65 = sub_1000466F4(v35, v37, &v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v38 = v55;
    _os_log_impl((void *)&_mh_execute_header, v55, (os_log_type_t)v60, "Validated channel subscriptions: %{private,mask.hash}s", v34, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v57 + 8))(v56, v58);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  uint64_t v39 = *(void *)(v14 + 16);
  if (v39)
  {
    uint64_t v40 = v14 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v41 = *(void *)(v4 + 72);
    swift_bridgeObjectRetain();
    uint64_t v42 = _swiftEmptyArrayStorage;
    do
    {
      sub_1000279D4(v40, (uint64_t)v7, (void (*)(void))type metadata accessor for CloudChannelSubscription);
      os_log_type_t v43 = &v7[*(int *)(v64 + 20)];
      uint64_t v45 = *(void *)v43;
      uint64_t v44 = *((void *)v43 + 1);
      swift_bridgeObjectRetain();
      sub_100027A28();
      if (v44)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000335D4(0, v42[2] + 1, 1, (uint64_t)v42);
          uint64_t v42 = v49;
        }
        unint64_t v47 = v42[2];
        unint64_t v46 = v42[3];
        if (v47 >= v46 >> 1)
        {
          sub_1000335D4(v46 > 1, v47 + 1, 1, (uint64_t)v42);
          uint64_t v42 = v50;
        }
        v42[2] = v47 + 1;
        uint64_t v48 = &v42[2 * v47];
        v48[4] = v45;
        v48[5] = v44;
      }
      v40 += v41;
      --v39;
    }
    while (v39);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v42 = _swiftEmptyArrayStorage;
  }
  uint64_t v51 = v42[2];
  swift_bridgeObjectRelease();
  if (!v51)
  {
    sub_100005370((void *)(v59 + 16), *(void *)(v59 + 40));
    sub_100048B0C();
  }
}

void sub_1000218E8()
{
}

void sub_1000218F4()
{
  sub_100027CCC();
  uint64_t v2 = v1;
  uint64_t v3 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_100027C54();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v13 = v2;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446210;
    swift_errorRetain();
    sub_100005280(&qword_100062868);
    uint64_t v10 = String.init<A>(describing:)();
    uint64_t v12 = sub_1000466F4(v10, v11, &v14);
    sub_100027D80(v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, v13, v9, 0xCu);
    swift_arrayDestroy();
    sub_100012FA4();
    sub_100012FA4();

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v3);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v3);
  }
  sub_100027CA4();
}

uint64_t sub_100021ABC()
{
  return Configurable.setting<A>(_:)();
}

uint64_t sub_100021AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Configurable.setting<A>(_:defaultValue:)(a1, a2, *v6, a6);
}

uint64_t sub_100021B1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return Configurable.setting<A>(_:_:)(a1, a2, a3, *v7, a7);
}

uint64_t sub_100021B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, *v8, a8);
}

void sub_100021B7C()
{
  sub_100027CCC();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v131 = *v0;
  uint64_t v126 = type metadata accessor for SevereMessage();
  sub_1000053F4();
  uint64_t v109 = v8;
  __chkstk_darwin(v9);
  sub_10000FA00();
  uint64_t v114 = v10;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v112 = (uint64_t)v108 - v13;
  uint64_t v110 = v14;
  __chkstk_darwin(v12);
  BOOL v16 = (char *)v108 - v15;
  type metadata accessor for Date();
  sub_1000053F4();
  uint64_t v122 = v18;
  uint64_t v123 = v17;
  __chkstk_darwin(v17);
  uint64_t v124 = (uint8_t *)v108 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100005280(&qword_100062E40);
  __chkstk_darwin(v20 - 8);
  sub_100015DF8();
  uint64_t v125 = v21;
  __chkstk_darwin(v22);
  uint64_t v129 = (char *)v108 - v23;
  uint64_t v121 = (void (*)(void))type metadata accessor for APSMessage();
  sub_1000053F4();
  v108[0] = v24;
  __chkstk_darwin(v25);
  sub_10000FA00();
  uint64_t v111 = v26;
  v108[1] = v27;
  __chkstk_darwin(v28);
  unint64_t v30 = (void *)((char *)v108 - v29);
  uint64_t v120 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v32 = v31;
  __chkstk_darwin(v33);
  sub_100015DF8();
  uint64_t v117 = v34;
  uint64_t v36 = __chkstk_darwin(v35);
  uint64_t v113 = (char *)v108 - v37;
  __chkstk_darwin(v36);
  uint64_t v39 = (char *)v108 - v38;
  static Logger.notifications.getter();
  uint64_t v128 = v7;
  sub_1000279D4((uint64_t)v7, (uint64_t)v30, (void (*)(void))type metadata accessor for APSMessage);
  uint64_t v40 = Logger.logObject.getter();
  os_log_type_t v41 = static os_log_type_t.default.getter();
  BOOL v42 = os_log_type_enabled(v40, v41);
  uint64_t v127 = v1;
  uint64_t v118 = v16;
  uint64_t v130 = v32;
  if (v42)
  {
    uint64_t v43 = swift_slowAlloc();
    uint64_t v116 = v3;
    uint64_t v44 = (uint8_t *)v43;
    uint64_t v45 = swift_slowAlloc();
    uint64_t v115 = v5;
    v133[0] = v45;
    *(_DWORD *)uint64_t v44 = 136315138;
    uint64_t v47 = *v30;
    unint64_t v46 = v30[1];
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_1000466F4(v47, v46, v133);
    sub_100015E68(v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100027A28();
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "Severe notifications manager received message with identifier: %s", v44, 0xCu);
    swift_arrayDestroy();
    uint64_t v5 = v115;
    sub_100012FA4();
    uint64_t v3 = v116;
    sub_100012FA4();

    uint64_t v49 = v130;
  }
  else
  {
    sub_100027A28();

    uint64_t v49 = v32;
  }
  uint64_t v119 = *(void (**)(char *, uint64_t))(v49 + 8);
  v119(v39, v120);
  ReferenceCountedLazy.increase()();
  uint64_t v120 = v133[0];
  NotificationEnablementTracker.trackEnablement()();
  ReferenceCountedLazy.decrease()();
  static Settings.Notifications.Severe.debugNotifications.getter();
  sub_1000278CC(&qword_100062E48, v50, (void (*)(uint64_t))type metadata accessor for SevereNotificationsManager);
  Configurable.setting<A>(_:)();
  swift_release();
  uint64_t v52 = v128;
  uint64_t v51 = (uint64_t)v129;
  if (LOBYTE(v133[0]) == 1) {
    sub_100017598(v128);
  }
  uint64_t v53 = *v52;
  uint64_t v54 = v52[1];
  os_log_t v55 = (uint64_t *)((char *)v52 + *((int *)v121 + 7));
  uint64_t v56 = *v55;
  uint64_t v57 = v55[1];
  uint64_t v58 = *(uint64_t *)((char *)v52 + *((int *)v121 + 6));
  uint64_t v59 = (char *)v52 + *((int *)v121 + 5);
  uint64_t v60 = (uint64_t)v124;
  (*(void (**)(uint8_t *, char *, uint64_t (*)()))(v122 + 16))(v124, v59, v123);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10001016C(v53, v54, v56, v57, v58, v60, v51);
  uint64_t v61 = v125;
  sub_1000274B0(v51, v125, &qword_100062E40);
  if (sub_1000093BC(v61, 1, (uint64_t)v126) == 1)
  {
    sub_1000277BC(v61, &qword_100062E40);
LABEL_17:
    static Logger.notifications.getter();
    uint64_t v79 = Logger.logObject.getter();
    os_log_type_t v80 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v79, v80))
    {
      unint64_t v81 = (uint8_t *)sub_100027E10();
      *(_WORD *)unint64_t v81 = 0;
      _os_log_impl((void *)&_mh_execute_header, v79, v80, "Unable to parse APSMessage into a SevereMessage", v81, 2u);
      sub_100012FA4();
    }

    sub_100027DB4();
    uint64_t v83 = v82();
    v5(v83);
    swift_release();
    goto LABEL_23;
  }
  uint64_t v62 = v61;
  uint64_t v63 = (uint64_t)v118;
  sub_10002729C(v62, (uint64_t)v118, (void (*)(void))type metadata accessor for SevereMessage);
  if (!*(void *)(*(void *)(v63 + 32) + 16))
  {
    sub_100027A28();
    goto LABEL_17;
  }
  static Logger.notifications.getter();
  uint64_t v64 = v112;
  sub_1000279D4(v63, v112, (void (*)(void))type metadata accessor for SevereMessage);
  uint64_t v65 = Logger.logObject.getter();
  int v66 = static os_log_type_t.default.getter();
  BOOL v67 = os_log_type_enabled(v65, (os_log_type_t)v66);
  uint64_t v115 = v5;
  uint64_t v116 = v3;
  if (v67)
  {
    LODWORD(v125) = v66;
    uint64_t v126 = v65;
    uint64_t v68 = (uint8_t *)swift_slowAlloc();
    unint64_t v69 = (uint64_t (*)())swift_slowAlloc();
    v133[0] = (uint64_t)v69;
    *(_DWORD *)uint64_t v68 = 136446210;
    uint64_t v70 = *(void *)(v64 + 32);
    int64_t v71 = *(void *)(v70 + 16);
    if (v71)
    {
      uint64_t v123 = v69;
      uint64_t v124 = v68;
      uint64_t v132 = _swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
      sub_100011F8C(0, v71, 0);
      uint64_t v72 = v132;
      uint64_t v73 = (uint64_t *)(v70 + 40);
      do
      {
        uint64_t v74 = *(v73 - 1);
        uint64_t v75 = *v73;
        uint64_t v132 = v72;
        unint64_t v76 = v72[2];
        unint64_t v77 = v72[3];
        swift_bridgeObjectRetain();
        if (v76 >= v77 >> 1)
        {
          sub_100011F8C((char *)(v77 > 1), v76 + 1, 1);
          uint64_t v72 = v132;
        }
        v73 += 5;
        v72[2] = v76 + 1;
        uint64_t v78 = &v72[2 * v76];
        v78[4] = v74;
        v78[5] = v75;
        --v71;
      }
      while (v71);
      swift_bridgeObjectRelease();
      uint64_t v63 = (uint64_t)v118;
      uint64_t v68 = v124;
    }
    uint64_t v84 = Array.description.getter();
    unint64_t v86 = v85;
    swift_bridgeObjectRelease();
    uint64_t v87 = sub_1000466F4(v84, v86, v133);
    sub_100015E68(v87);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100027A28();
    uint64_t v88 = v126;
    _os_log_impl((void *)&_mh_execute_header, v126, (os_log_type_t)v125, "Severe message contains the following events: %{public}s", v68, 0xCu);
    swift_arrayDestroy();
    sub_100012FA4();
    sub_100012FA4();
  }
  else
  {
    sub_100027A28();
  }
  sub_100027DB4();
  v89();
  uint64_t v130 = sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  uint64_t v90 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v126 = type metadata accessor for SevereMessage;
  uint64_t v91 = v114;
  sub_1000279D4(v63, v114, (void (*)(void))type metadata accessor for SevereMessage);
  uint64_t v92 = *(unsigned __int8 *)(v109 + 80);
  uint64_t v122 = ((v92 + 16) & ~v92) + v110;
  uint64_t v93 = (v92 + 16) & ~v92;
  uint64_t v124 = (uint8_t *)(v92 | 7);
  uint64_t v125 = v93;
  uint64_t v94 = swift_allocObject();
  uint64_t v123 = type metadata accessor for SevereMessage;
  sub_10002729C(v91, v94 + v93, (void (*)(void))type metadata accessor for SevereMessage);
  sub_100005280(&qword_100062618);
  firstly<A, B>(on:disposeOn:closure:)();

  swift_release();
  uint64_t v121 = (void (*)(void))type metadata accessor for APSMessage;
  uint64_t v95 = v128;
  uint64_t v96 = v111;
  sub_1000279D4((uint64_t)v128, v111, (void (*)(void))type metadata accessor for APSMessage);
  unint64_t v97 = (*(unsigned __int8 *)(v108[0] + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v108[0] + 80);
  uint64_t v98 = swift_allocObject();
  sub_10002729C(v96, v98 + v97, (void (*)(void))type metadata accessor for APSMessage);
  uint64_t v99 = (void *)zalgo.getter();
  Promise.then<A>(on:closure:)();
  swift_release();
  swift_release();

  sub_1000279D4((uint64_t)v95, v96, v121);
  uint64_t v100 = swift_allocObject();
  sub_10002729C(v96, v100 + v97, (void (*)(void))type metadata accessor for APSMessage);
  uint64_t v101 = (void *)zalgo.getter();
  Promise.error(on:closure:)();
  swift_release();

  swift_release();
  os_log_t v102 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v103 = v114;
  sub_1000279D4((uint64_t)v118, v114, v126);
  unint64_t v104 = (v122 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v105 = swift_allocObject();
  sub_10002729C(v103, v105 + v125, (void (*)(void))v123);
  uint64_t v106 = (void *)(v105 + v104);
  uint64_t v107 = v116;
  *uint64_t v106 = v115;
  v106[1] = v107;
  swift_retain();
  Promise.always<A>(on:disposeOn:closure:)();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  sub_100027A28();
  uint64_t v51 = (uint64_t)v129;
LABEL_23:
  sub_1000277BC(v51, &qword_100062E40);
  sub_100027CA4();
}

uint64_t sub_10002278C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for APSMessage();
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (uint64_t *)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  sub_1000279D4(a2, (uint64_t)v6, (void (*)(void))type metadata accessor for APSMessage);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = v8;
    uint64_t v14 = v13;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v27 = v22;
    *(_DWORD *)uint64_t v14 = 136446466;
    uint64_t v25 = v2;
    uint64_t v23 = v7;
    uint64_t v15 = *v6;
    unint64_t v16 = v6[1];
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_1000466F4(v15, v16, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100027A28();
    *(_WORD *)(v14 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v17 = Array.description.getter();
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    uint64_t v26 = sub_1000466F4(v17, v19, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Message with identifier %{public}s resulted in notifications %{public}s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v10, v23);
  }
  else
  {
    sub_100027A28();

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

void sub_100022AC8()
{
  sub_100027CCC();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = type metadata accessor for APSMessage();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  sub_100027C54();
  sub_1000279D4(v4, (uint64_t)v9, (void (*)(void))type metadata accessor for APSMessage);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v27 = v24;
    *(_DWORD *)uint64_t v16 = 136446466;
    uint64_t v23 = v2;
    uint64_t v25 = v10;
    uint64_t v18 = *v9;
    unint64_t v17 = v9[1];
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1000466F4(v18, v17, &v27);
    sub_100027D80(v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100027A28();
    *(_WORD *)(v16 + 12) = 2082;
    uint64_t v26 = v6;
    swift_errorRetain();
    sub_100005280(&qword_100062868);
    uint64_t v20 = String.init<A>(describing:)();
    uint64_t v26 = sub_1000466F4(v20, v21, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v23, (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    sub_100012FA4();
    sub_100012FA4();

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0, v25);
  }
  else
  {
    sub_100027A28();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0, v10);
  }
  sub_100027CA4();
}

uint64_t sub_100022D7C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v15 = a4;
  uint64_t v16 = a3;
  uint64_t v5 = type metadata accessor for Expression();
  uint64_t v14 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v13 - v9;
  ReferenceCountedLazy.increase()();
  sub_100005370((void *)(a1 + 176), *(void *)(a1 + 200));
  sub_10002AD50();
  SevereNotificationsPowerLogger.report()();
  NotificationStore.weatherAlerts.getter();
  dispatch thunk of Table.delete.getter();
  swift_release();
  uint64_t v18 = type metadata accessor for Date();
  uint64_t v19 = &protocol witness table for Date;
  sub_100008E24(v17);
  Date.init(timeIntervalSinceNow:)();
  <= infix(_:_:)();
  sub_100008AD0((uint64_t)v17);
  dispatch thunk of Delete.where(_:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v5);
  swift_release();
  NotificationStore.severeNotifications.getter();
  dispatch thunk of Table.delete.getter();
  swift_release();
  uint64_t v18 = type metadata accessor for Date();
  uint64_t v19 = &protocol witness table for Date;
  sub_100008E24(v17);
  Date.init(timeIntervalSinceNow:)();
  <= infix(_:_:)();
  sub_100008AD0((uint64_t)v17);
  dispatch thunk of Delete.where(_:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v5);
  uint64_t v11 = swift_release();
  v16(v11);
  ReferenceCountedLazy.decrease()();
  return swift_release();
}

uint64_t sub_100023074()
{
  sub_100005280(&qword_100062FC0);
  sub_100027DA8();
  uint64_t updated = type metadata accessor for LocationManagerUpdateType();
  sub_1000053F4();
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1000506E0;
  unint64_t v7 = v6 + v5;
  uint64_t v8 = *(void (**)(unint64_t, void, uint64_t))(v2 + 104);
  v8(v7, enum case for LocationManagerUpdateType.authorization(_:), updated);
  v8(v7 + v4, enum case for LocationManagerUpdateType.currentCLLocation(_:), updated);
  return v6;
}

void sub_10002314C()
{
  sub_100027CCC();
  uint64_t v3 = v0;
  int v5 = v4;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  sub_1000053F4();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_100027D04();
  sub_1000053F4();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_100027D68();
  if (v5)
  {
    uint64_t v16 = v13;
    sub_100027A84(0, (unint64_t *)&qword_100063FE0);
    uint64_t v14 = (void *)static OS_dispatch_queue.notifications.getter();
    v17[4] = sub_100027A70;
    v17[5] = v3;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 1107296256;
    void v17[2] = sub_1000308F0;
    uint64_t v17[3] = &unk_10005EC20;
    uint64_t v15 = _Block_copy(v17);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    sub_1000278CC(&qword_100062F80, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005280((uint64_t *)&unk_100064000);
    sub_100008DE0(&qword_100062F88, (uint64_t *)&unk_100064000);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v15);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v16);
    swift_release();
  }
  sub_100027CA4();
}

uint64_t sub_100023398(uint64_t a1)
{
  uint64_t v2 = sub_100005280(&qword_100062E30);
  __chkstk_darwin(v2 - 8);
  int v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for NotificationSubscription();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100005370((void *)(a1 + 216), *(void *)(a1 + 240));
  static Location.currentLocationID.getter();
  dispatch thunk of NotificationSubscriptionManagerType.subscription(with:)();
  swift_bridgeObjectRelease();
  if (sub_1000093BC((uint64_t)v4, 1, v5) == 1) {
    return sub_1000277BC((uint64_t)v4, &qword_100062E30);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32))(v8, v4, v5);
  if (NotificationSubscription.severeEnabled.getter())
  {
    swift_retain();
    Debouncer.execute(_:)();
    swift_release();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000235A4()
{
  sub_100020218();
  return swift_release();
}

void sub_1000235D8()
{
  sub_100027CCC();
  int v4 = v3;
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  sub_1000053F4();
  uint64_t v18 = v6;
  __chkstk_darwin(v7);
  uint64_t v17 = sub_100027D04();
  sub_1000053F4();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_100027D68();
  sub_100027A84(0, (unint64_t *)&unk_100063E50);
  id v11 = sub_100043E54();
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  uint64_t v12 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v4;
  v13[3] = v0;
  v13[4] = v11;
  v19[4] = sub_1000278A8;
  v19[5] = v13;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 1107296256;
  v19[2] = sub_1000308F0;
  v19[3] = &unk_10005EB80;
  uint64_t v14 = _Block_copy(v19);
  id v15 = v4;
  swift_retain();
  id v16 = v11;
  static DispatchQoS.unspecified.getter();
  sub_1000278CC(&qword_100062F80, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005280((uint64_t *)&unk_100064000);
  sub_100008DE0(&qword_100062F88, (uint64_t *)&unk_100064000);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v1, v5);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v17);
  swift_release();
  sub_100027CA4();
}

uint64_t sub_10002388C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v29 = a3;
  id v33 = a1;
  uint64_t v34 = a2;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  __chkstk_darwin(v3);
  uint64_t v32 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005280(&qword_100062F90);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for NotificationSubscription.Location();
  uint64_t v35 = *(void *)(v8 - 8);
  uint64_t v36 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005280(&qword_1000626D8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for TimeZone();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = type metadata accessor for Location();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  unint64_t v21 = (char *)&v28 - v20;
  static Location.currentLocationID.getter();
  static TimeZone.current.getter();
  [v33 coordinate];
  uint64_t v22 = type metadata accessor for Date();
  sub_100008CEC((uint64_t)v13, 1, 1, v22);
  uint64_t v23 = v34;
  Location.init(id:name:timeZone:coordinate:lastRefreshDate:searchTitle:searchSubtitle:preciseName:secondaryName:)();
  sub_100005370((void *)(v23 + 216), *(void *)(v23 + 240));
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
  sub_100008CEC((uint64_t)v7, 1, 1, v15);
  NotificationSubscription.Location.init(location:locationOverride:)();
  dispatch thunk of NotificationSubscriptionManagerType.updateSubscription(for:)();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v36);
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = v29;
  *(void *)(v24 + 16) = v23;
  *(void *)(v24 + 24) = v25;
  swift_retain();
  id v26 = v25;
  Debouncer.execute(_:)();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v21, v15);
}

uint64_t sub_100023E70()
{
  return sub_100023074();
}

uint64_t sub_100023E90(uint64_t a1, uint64_t a2)
{
  return LocationManagerObserver.currentLocationDidUpdate(_:location:)(a1, a2, *v2);
}

uint64_t sub_100023EBC(uint64_t a1, uint64_t a2)
{
  return LocationManagerObserver.currentLocationUpdateDidFail(_:error:)(a1, a2, *v2);
}

BOOL sub_100023EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(double *)(a1 + 32) != *(double *)(a2 + 32)) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = (double *)(a1 + 40);
  uint64_t v6 = (double *)(a2 + 40);
  do
  {
    double v7 = *v5++;
    double v8 = v7;
    double v9 = *v6++;
    double v10 = v9;
    BOOL v12 = v4-- != 0;
    BOOL result = v8 == v10;
  }
  while (v8 == v10 && v12);
  return result;
}

uint64_t sub_100023F5C(void *a1, void *a2)
{
  unint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = 0;
    if ((v7 & 1) == 0) {
      return result;
    }
  }
  if (v2 == 1) {
    return 1;
  }
  double v8 = a1 + 7;
  double v9 = a2 + 7;
  unint64_t v10 = 1;
  while (v10 < v2)
  {
    uint64_t result = *(v8 - 1);
    if (result != *(v9 - 1) || *v8 != *v9)
    {
      uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((result & 1) == 0) {
        return 0;
      }
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10) {
      return 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100024030()
{
  uint64_t v1 = type metadata accessor for SevereMessage();
  sub_1000090A4(v1);
  return sub_100017F38(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
}

uint64_t sub_100024088()
{
  uint64_t v0 = type metadata accessor for APSMessage();
  sub_1000090A4(v0);
  sub_100027D98();
  uint64_t v1 = sub_1000090F4();
  return sub_10002278C(v1, v2);
}

void sub_1000240DC()
{
}

uint64_t sub_1000240E8()
{
  type metadata accessor for SevereMessage();
  sub_100027C28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for Date();
  sub_100009150();
  uint64_t v0 = sub_100027C7C();
  v1(v0);
  swift_release();
  sub_100027DC8();
  return _swift_deallocObject(v2, v3, v4);
}

uint64_t sub_1000241C4()
{
  sub_100027DA8();
  uint64_t v2 = type metadata accessor for SevereMessage();
  sub_10000F9A0(v2);
  sub_100027E5C();
  uint64_t v5 = *(void (**)(uint64_t))(v1 + v4);
  uint64_t v6 = *(void *)(v1 + v4 + 8);
  return sub_100022D7C(v0, v3, v5, v6);
}

uint64_t sub_100024230()
{
  type metadata accessor for SevereNotificationContent();
  sub_100027C28();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v1 + v4 + *(int *)(v0 + 48);
  uint64_t v8 = type metadata accessor for Date();
  if (!sub_100027E3C(v8)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 + v4 - 8) + 8))(v7, v1 + v4);
  }
  return _swift_deallocObject(v1, v4 + v6, v3 | 7);
}

void sub_10002431C()
{
  uint64_t v0 = type metadata accessor for SevereNotificationContent();
  sub_1000090A4(v0);
  sub_100027D98();
  uint64_t v1 = sub_1000090F4();
  sub_100017CC8(v1);
}

uint64_t sub_100024360()
{
  type metadata accessor for APSMessage();
  sub_100027C28();
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  swift_bridgeObjectRelease();
  uint64_t v4 = v3 + *(int *)(v0 + 28);
  type metadata accessor for Date();
  sub_100009150();
  (*(void (**)(uint64_t))(v5 + 8))(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_100027CBC();
  return _swift_deallocObject(v6, v7, v8);
}

void sub_100024434()
{
}

void sub_100024440()
{
  uint64_t v0 = type metadata accessor for APSMessage();
  sub_1000090A4(v0);
  sub_100027D98();
  sub_100022AC8();
}

uint64_t sub_100024490()
{
  uint64_t v1 = type metadata accessor for SevereMessage();
  sub_1000090A4(v1);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return sub_100018328(v3, v4);
}

id sub_1000244D4(uint64_t a1)
{
  return [*(id *)(v1 + 400) addOperation:a1];
}

uint64_t sub_1000244EC()
{
  uint64_t v0 = type metadata accessor for SevereMessage();
  sub_1000090A4(v0);
  sub_100027E28();
  uint64_t v1 = sub_1000090F4();
  return sub_1000184F0(v1, v2, v3);
}

uint64_t sub_100024530()
{
  type metadata accessor for SevereMessage();
  sub_100027C28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for Date();
  sub_100009150();
  uint64_t v0 = sub_100027C7C();
  v1(v0);
  uint64_t v2 = sub_100027CBC();
  return _swift_deallocObject(v2, v3, v4);
}

uint64_t sub_1000245F0(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for SevereMessage();
  sub_1000090A4(v5);
  return sub_100019168(a1, a2, (uint64_t *)(v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))));
}

uint64_t sub_10002464C()
{
  uint64_t v2 = sub_100005280(&qword_100062E30);
  sub_10000F9A0(v2);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = type metadata accessor for NotificationSubscription();
  if (!sub_100027E3C(v8)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v5, v1);
  }
  swift_release();
  return _swift_deallocObject(v0, ((v7 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v4 | 7);
}

uint64_t sub_100024728(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100005280(&qword_100062E30);
  sub_10000F9A0(v5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = *(void *)(v2 + ((*(void *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_10001A6D0(a1, a2, v2 + v10, v11);
}

uint64_t sub_1000247B4()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000247EC(uint64_t a1)
{
  return sub_10001AE50(a1, *(uint64_t (**)(uint64_t, void))(v1 + 16)) & 1;
}

uint64_t sub_100024810()
{
  type metadata accessor for SevereMessage();
  sub_100027C28();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for Date();
  sub_100009150();
  uint64_t v0 = sub_100027C7C();
  v1(v0);
  uint64_t v2 = sub_100027CBC();
  return _swift_deallocObject(v2, v3, v4);
}

uint64_t sub_1000248D8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for SevereMessage();
  sub_1000090A4(v5);
  return sub_10001AEAC(a2, v2 + ((*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)), a1);
}

uint64_t sub_100024934@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10001B4F8(a1, *(uint64_t (**)(uint64_t, void))(v2 + 16), a2);
}

uint64_t sub_100024950()
{
  uint64_t v1 = type metadata accessor for Location();
  sub_1000053F4();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(type metadata accessor for SevereMessage() - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = ((v5 + v7 + v9) & ~v9) + *(void *)(v8 + 64);
  uint64_t v11 = v4 | v9 | 7;
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for Date();
  sub_100009150();
  uint64_t v12 = sub_100027C7C();
  v13(v12);
  return _swift_deallocObject(v0, v10, v11);
}

uint64_t sub_100024AAC()
{
  uint64_t v1 = type metadata accessor for Location();
  sub_10000F9A0(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = type metadata accessor for SevereMessage();
  sub_1000090A4(v6);
  uint64_t v8 = *(void *)(v0 + 16);
  uint64_t v9 = *(void *)(v0 + 24);
  uint64_t v10 = v0 + ((v3 + v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return sub_10001B618(v8, v9, v0 + v3, v10);
}

uint64_t sub_100024B38()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100024B70()
{
  return sub_10001BBBC();
}

uint64_t sub_100024B8C()
{
  type metadata accessor for Location();
  sub_1000053F4();
  swift_release();
  uint64_t v0 = sub_100027D34();
  v1(v0);
  uint64_t v2 = sub_100027CBC();
  return _swift_deallocObject(v2, v3, v4);
}

uint64_t sub_100024C18()
{
  uint64_t v0 = sub_1000090B8();
  sub_1000090A4(v0);
  sub_100027E28();
  uint64_t v1 = sub_1000090F4();
  return sub_10001BC20(v1, v2, v3);
}

uint64_t sub_100024C58()
{
  return sub_100024D1C();
}

uint64_t sub_100024C70()
{
  uint64_t v3 = sub_1000090B8();
  sub_10000F9A0(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = type metadata accessor for SevereMessage();
  sub_1000090A4(v8);
  uint64_t result = sub_10001C088(*v1, v0 + v5, v0 + ((v5 + v7 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)));
  *uint64_t v2 = result;
  return result;
}

uint64_t sub_100024D04()
{
  return sub_100024D1C();
}

uint64_t sub_100024D1C()
{
  sub_100027CCC();
  sub_100027DA8();
  uint64_t v2 = type metadata accessor for Location();
  sub_1000053F4();
  uint64_t v4 = v3;
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  type metadata accessor for SevereMessage();
  v0(*(void *)(v1 + 16));
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v1 + v5, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for Date();
  sub_100009150();
  uint64_t v6 = sub_100027C7C();
  v7(v6);
  sub_100027CA4();
  return _swift_deallocObject(v8, v9, v10);
}

uint64_t sub_100024E6C()
{
  uint64_t v0 = type metadata accessor for Location();
  sub_10000F9A0(v0);
  uint64_t v1 = type metadata accessor for SevereMessage();
  sub_1000090A4(v1);
  uint64_t v2 = (void *)sub_1000090F4();
  return sub_10001D1C8(v2, v3, v4, v5);
}

unint64_t sub_100024EF8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_100024FB0(a1, v4);
}

unint64_t sub_100024F3C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  sub_100027DC8();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return sub_100025078(a1, a2, v4);
}

unint64_t sub_100024FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100027804(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10001278C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100025078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10002515C()
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v0;
  *uint64_t v0 = 0x8000000000000000;
  sub_100027DC8();
  sub_100025280(v1, v2, v3, v4);
  *uint64_t v0 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000251E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v4;
  uint64_t *v4 = 0x8000000000000000;
  sub_1000253C0(a1, a2, a3, a4, isUniquelyReferenced_nonNull_native);
  uint64_t *v4 = v11;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_100025280(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_100024F3C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100005280(&qword_100062D10);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_100024F3C(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if (v17)
  {
    unint64_t v21 = (_OWORD *)(v20[7] + 32 * v16);
    sub_100008AD0((uint64_t)v21);
    return sub_100015DE8(a1, v21);
  }
  else
  {
    sub_100025500(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_1000253C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = (void **)v5;
  char v12 = (void *)*v5;
  unint64_t v13 = sub_100024F3C(a3, a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  sub_100005280(&qword_100062F08);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a5 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_100024F3C(a3, a4);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_11:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = *v6;
  if (v19)
  {
    uint64_t v23 = (uint64_t *)(v22[7] + 16 * v18);
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v23 = a1;
    v23[1] = a2;
  }
  else
  {
    sub_10002556C(v18, a3, a4, a1, a2, v22);
    return swift_bridgeObjectRetain();
  }
  return result;
}

_OWORD *sub_100025500(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100015DE8(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_10002556C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t v7 = (void *)(a6[7] + 16 * result);
  *uint64_t v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

uint64_t sub_1000255B8(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_1000255D4(void *a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v8 = a2[2];
  uint64_t v9 = a2[3];
  uint64_t v10 = a2[4];
  uint64_t v11 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v12 = v8;
  String.hash(into:)();
  uint64_t v46 = v9;
  swift_bridgeObjectRelease();
  sub_100027354((uint64_t)v47, v10);
  Swift::Int v13 = Hasher._finalize()();
  uint64_t v14 = -1 << *(unsigned char *)(v11 + 32);
  unint64_t v15 = v13 & ~v14;
  uint64_t v16 = v11;
  uint64_t v17 = v11 + 56;
  uint64_t v43 = v3;
  uint64_t v44 = a1;
  Swift::Int v42 = (Swift::Int)a2;
  if ((*(void *)(v17 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
  {
    uint64_t v18 = ~v14;
    uint64_t v19 = *(void *)(v16 + 48);
    os_log_type_t v41 = (double *)(v10 + 48);
    uint64_t v20 = v10;
    uint64_t v45 = v10;
    do
    {
      char v21 = (void *)(v19 + 40 * v15);
      uint64_t v22 = v21[2];
      uint64_t v23 = v21[3];
      uint64_t v24 = v21[4];
      BOOL v25 = *v21 == v7 && v21[1] == v6;
      if (v25 || (v26 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t v20 = v45, (v26 & 1) != 0))
      {
        BOOL v27 = v22 == v12 && v23 == v46;
        if (v27 || (v28 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t v20 = v45, (v28 & 1) != 0))
        {
          uint64_t v29 = *(void *)(v24 + 16);
          if (v29 == *(void *)(v20 + 16))
          {
            if (!v29 || v24 == v20)
            {
LABEL_26:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              id v33 = (void *)(*(void *)(*v43 + 48) + 40 * v15);
              uint64_t v34 = v33[1];
              uint64_t v35 = v33[2];
              uint64_t v36 = v33[3];
              uint64_t v37 = v33[4];
              void *v44 = *v33;
              v44[1] = v34;
              v44[2] = v35;
              v44[3] = v36;
              v44[4] = v37;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              return 0;
            }
            if (*(double *)(v24 + 32) == *(double *)(v20 + 32))
            {
              if (v29 == 1) {
                goto LABEL_26;
              }
              if (*(double *)(v24 + 40) == *(double *)(v20 + 40))
              {
                uint64_t v30 = v29 - 2;
                if (!v30) {
                  goto LABEL_26;
                }
                uint64_t v31 = (double *)(v24 + 48);
                uint64_t v32 = v41;
                while (*v31 == *v32)
                {
                  ++v31;
                  ++v32;
                  if (!--v30) {
                    goto LABEL_26;
                  }
                }
              }
            }
          }
        }
      }
      unint64_t v15 = (v15 + 1) & v18;
    }
    while (((*(void *)(v17 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) != 0);
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v47[0] = *v43;
  *uint64_t v43 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000260F0(v42, v15, isUniquelyReferenced_nonNull_native);
  *uint64_t v43 = v47[0];
  swift_bridgeObjectRelease();
  long long v40 = *(_OWORD *)(v42 + 16);
  *(_OWORD *)uint64_t v44 = *(_OWORD *)v42;
  *((_OWORD *)v44 + 1) = v40;
  v44[4] = *(void *)(v42 + 32);
  return 1;
}

uint64_t sub_1000258E8(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  sub_100027DFC();
  if (v11)
  {
    uint64_t v12 = *(void *)(v7 + 48);
    Swift::Int v13 = (void *)(v12 + 16 * v10);
    BOOL v14 = *v13 == a2 && v13[1] == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v15 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v18 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v18;
      sub_100027DFC();
      if ((v19 & 1) == 0) {
        break;
      }
      uint64_t v20 = (void *)(v12 + 16 * v10);
      BOOL v21 = *v20 == a2 && v20[1] == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v23 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100026390(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100025A80()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005280(&qword_100062F70);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v36 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v35 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    uint64_t v37 = v2;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
    {
      uint64_t v16 = *(void *)(v2 + 48) + 40 * i;
      uint64_t v17 = *(void *)v16;
      uint64_t v18 = *(void *)(v16 + 8);
      uint64_t v19 = *(void *)(v16 + 16);
      long long v38 = *(_OWORD *)(v16 + 24);
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      Swift::UInt v20 = *(void *)(*((void *)&v38 + 1) + 16);
      Hasher._combine(_:)(v20);
      if (v20)
      {
        BOOL v21 = (Swift::UInt64 *)(*((void *)&v38 + 1) + 32);
        do
        {
          Swift::UInt64 v23 = *v21++;
          Swift::UInt64 v22 = v23;
          if ((v23 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
            Swift::UInt64 v24 = v22;
          }
          else {
            Swift::UInt64 v24 = 0;
          }
          Hasher._combine(_:)(v24);
          --v20;
        }
        while (v20);
      }
      uint64_t result = Hasher._finalize()();
      uint64_t v25 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v8 + 8 * (v26 >> 6))) == 0)
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v25) >> 6;
        while (++v27 != v30 || (v29 & 1) == 0)
        {
          BOOL v31 = v27 == v30;
          if (v27 == v30) {
            unint64_t v27 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v8 + 8 * v27);
          if (v32 != -1)
          {
            unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
            goto LABEL_36;
          }
        }
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
        return result;
      }
      unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v8 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_36:
      *(void *)(v8 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
      uint64_t v33 = *(void *)(v4 + 48) + 40 * v28;
      *(void *)uint64_t v33 = v17;
      *(void *)(v33 + 8) = v18;
      *(void *)(v33 + 16) = v19;
      *(_OWORD *)(v33 + 24) = v38;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v37;
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v13 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_44;
      }
      if (v13 >= v35) {
        goto LABEL_38;
      }
      unint64_t v14 = v36[v13];
      ++v10;
      if (!v14)
      {
        int64_t v10 = v13 + 1;
        if (v13 + 1 >= v35) {
          goto LABEL_38;
        }
        unint64_t v14 = v36[v10];
        if (!v14)
        {
          int64_t v10 = v13 + 2;
          if (v13 + 2 >= v35) {
            goto LABEL_38;
          }
          unint64_t v14 = v36[v10];
          if (!v14)
          {
            int64_t v15 = v13 + 3;
            if (v15 >= v35)
            {
LABEL_38:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v34 = 1 << *(unsigned char *)(v2 + 32);
              if (v34 > 63) {
                sub_1000255B8(0, (unint64_t)(v34 + 63) >> 6, v36);
              }
              else {
                void *v36 = -1 << v34;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v14 = v36[v15];
            if (!v14)
            {
              while (1)
              {
                int64_t v10 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_45;
                }
                if (v10 >= v35) {
                  goto LABEL_38;
                }
                unint64_t v14 = v36[v10];
                ++v15;
                if (v14) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v10 = v15;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v14 - 1) & v14;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_100025E14()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005280(&qword_100062F18);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      unint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *unint64_t v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_1000255B8(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                void *v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_1000260F0(Swift::Int result, unint64_t a2, char a3)
{
  uint64_t v5 = (uint64_t *)result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  Swift::Int v35 = result;
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_100025A80();
    }
    else
    {
      if (v7 > v6)
      {
        uint64_t result = (Swift::Int)sub_10002652C();
        goto LABEL_34;
      }
      sub_1000268CC();
    }
    uint64_t v8 = *v3;
    Hasher.init(_seed:)();
    uint64_t v9 = *v5;
    uint64_t v10 = v5[1];
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t v11 = v5[2];
    uint64_t v12 = v5[3];
    swift_bridgeObjectRetain();
    uint64_t v37 = v11;
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t v13 = v5[4];
    sub_100027354((uint64_t)v38, v13);
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v14;
    uint64_t v36 = v8 + 56;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v15 = ~v14;
      uint64_t v16 = *(void *)(v8 + 48);
      do
      {
        uint64_t v17 = (Swift::Int *)(v16 + 40 * a2);
        uint64_t result = *v17;
        Swift::Int v18 = v17[2];
        Swift::Int v19 = v17[3];
        Swift::Int v20 = v17[4];
        BOOL v21 = *v17 == v9 && v17[1] == v10;
        if (v21 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
          BOOL v22 = v18 == v37 && v19 == v12;
          if (v22 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
          {
            uint64_t v23 = *(void *)(v20 + 16);
            if (v23 == *(void *)(v13 + 16))
            {
              if (v23) {
                BOOL v24 = v20 == v13;
              }
              else {
                BOOL v24 = 1;
              }
              if (v24) {
                goto LABEL_37;
              }
              if (*(double *)(v20 + 32) == *(double *)(v13 + 32))
              {
                if (v23 == 1) {
                  goto LABEL_37;
                }
                if (*(double *)(v20 + 40) == *(double *)(v13 + 40))
                {
                  uint64_t v25 = v23 - 2;
                  if (!v25) {
                    goto LABEL_37;
                  }
                  BOOL v26 = (double *)(v20 + 48);
                  uint64_t v27 = (double *)(v13 + 48);
                  while (*v26 == *v27)
                  {
                    ++v26;
                    ++v27;
                    if (!--v25) {
                      goto LABEL_37;
                    }
                  }
                }
              }
            }
          }
        }
        a2 = (a2 + 1) & v15;
      }
      while (((*(void *)(v36 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_34:
  uint64_t v28 = *v34;
  *(void *)(*v34 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v29 = *(void *)(v28 + 48) + 40 * a2;
  long long v30 = *(_OWORD *)(v35 + 16);
  *(_OWORD *)uint64_t v29 = *(_OWORD *)v35;
  *(_OWORD *)(v29 + 16) = v30;
  *(void *)(v29 + 32) = *(void *)(v35 + 32);
  uint64_t v31 = *(void *)(v28 + 16);
  BOOL v32 = __OFADD__(v31, 1);
  uint64_t v33 = v31 + 1;
  if (v32)
  {
    __break(1u);
LABEL_37:
    uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
    *(void *)(v28 + 16) = v33;
  }
  return result;
}

Swift::Int sub_100026390(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100025E14();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100026718();
      goto LABEL_22;
    }
    sub_100026C3C();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        Swift::Int v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  BOOL v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *BOOL v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_10002652C()
{
  uint64_t v1 = v0;
  sub_100005280(&qword_100062F70);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = 5 * i;
    uint64_t v21 = *(void *)(v2 + 48) + 8 * v20;
    uint64_t v22 = *(void *)(v21 + 8);
    uint64_t v23 = *(void *)(v21 + 16);
    long long v24 = *(_OWORD *)(v21 + 24);
    uint64_t v25 = *(void *)(v4 + 48) + 8 * v20;
    *(void *)uint64_t v25 = *(void *)v21;
    *(void *)(v25 + 8) = v22;
    *(void *)(v25 + 16) = v23;
    *(_OWORD *)(v25 + 24) = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_100026718()
{
  uint64_t v1 = v0;
  sub_100005280(&qword_100062F18);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000268CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005280(&qword_100062F70);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_40:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v34 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v35 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  uint64_t v36 = v2;
  if (!v7) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    uint64_t v16 = *(void *)(v2 + 48) + 40 * i;
    uint64_t v17 = *(void *)v16;
    uint64_t v18 = *(void *)(v16 + 8);
    uint64_t v19 = *(void *)(v16 + 16);
    long long v37 = *(_OWORD *)(v16 + 24);
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    Swift::UInt v20 = *(void *)(*((void *)&v37 + 1) + 16);
    Hasher._combine(_:)(v20);
    if (v20)
    {
      uint64_t v21 = (Swift::UInt64 *)(*((void *)&v37 + 1) + 32);
      do
      {
        Swift::UInt64 v23 = *v21++;
        Swift::UInt64 v22 = v23;
        if ((v23 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
          Swift::UInt64 v24 = v22;
        }
        else {
          Swift::UInt64 v24 = 0;
        }
        Hasher._combine(_:)(v24);
        --v20;
      }
      while (v20);
    }
    uint64_t result = Hasher._finalize()();
    uint64_t v25 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v8 + 8 * (v26 >> 6))) == 0)
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        BOOL v31 = v27 == v30;
        if (v27 == v30) {
          unint64_t v27 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v8 + 8 * v27);
        if (v32 != -1)
        {
          unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_36;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v8 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_36:
    *(void *)(v8 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    uint64_t v33 = *(void *)(v4 + 48) + 40 * v28;
    *(void *)uint64_t v33 = v17;
    *(void *)(v33 + 8) = v18;
    *(void *)(v33 + 16) = v19;
    *(_OWORD *)(v33 + 24) = v37;
    ++*(void *)(v4 + 16);
    uint64_t v2 = v36;
    if (v7) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_42;
    }
    if (v13 >= v35) {
      goto LABEL_38;
    }
    unint64_t v14 = *(void *)(v34 + 8 * v13);
    ++v10;
    if (!v14)
    {
      int64_t v10 = v13 + 1;
      if (v13 + 1 >= v35) {
        goto LABEL_38;
      }
      unint64_t v14 = *(void *)(v34 + 8 * v10);
      if (!v14)
      {
        int64_t v10 = v13 + 2;
        if (v13 + 2 >= v35) {
          goto LABEL_38;
        }
        unint64_t v14 = *(void *)(v34 + 8 * v10);
        if (!v14) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v7 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v35)
  {
LABEL_38:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_40;
  }
  unint64_t v14 = *(void *)(v34 + 8 * v15);
  if (v14)
  {
    int64_t v10 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v35) {
      goto LABEL_38;
    }
    unint64_t v14 = *(void *)(v34 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_20;
    }
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_100026C3C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005280(&qword_100062F18);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    unint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *unint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_100026EE8(double a1, double a2)
{
  if ((~COERCE__INT64(a2 - a1) & 0x7FF0000000000000) != 0) {
    sub_100026F68(0x20000000000001uLL);
  }
  else {
    __break(1u);
  }
}

unint64_t sub_100026F68(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    uint64_t result = (0 * (unsigned __int128)v1) >> 64;
    if (-(uint64_t)v1 % v1)
    {
      while (1)
        swift_stdlib_random();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100026FF4(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      uint64_t v7 = v4 + v2;
    }
    else {
      uint64_t v7 = v4;
    }
    uint64_t result = sub_10003358C(result, v7, 1, v3);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = type metadata accessor for WeatherAlert();
  uint64_t v12 = *(void *)(v10 - 8);
  uint64_t result = v10 - 8;
  uint64_t v11 = v12;
  if (v9 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t result = sub_100011E0C(v6 + v13, v2, v3 + v13 + *(void *)(v11 + 72) * v8);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v14 = *(void *)(v3 + 16);
  BOOL v15 = __OFADD__(v14, v2);
  uint64_t v16 = v14 + v2;
  if (!v15)
  {
    *(void *)(v3 + 16) = v16;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10002710C()
{
  uint64_t v1 = type metadata accessor for SevereNotification();
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v3 = v0 + v2 + *(int *)(v1 + 28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = v3 + *(int *)(type metadata accessor for SevereNotificationContent() + 40);
  uint64_t v5 = type metadata accessor for Date();
  if (!sub_1000093BC(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  type metadata accessor for Location();
  sub_100009150();
  uint64_t v6 = sub_100027C7C();
  v7(v6);
  sub_100027DC8();
  return _swift_deallocObject(v8, v9, v10);
}

uint64_t sub_10002729C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100027C44();
  uint64_t v4 = sub_100027DD4();
  v5(v4);
  return a2;
}

uint64_t sub_1000272F0(uint64_t a1)
{
  return sub_1000275CC(a1, (uint64_t (*)(void))type metadata accessor for SevereNotification, (uint64_t (*)(uint64_t, void, void, unint64_t))sub_10001F74C);
}

uint64_t sub_100027330()
{
  return sub_10001F7B0();
}

uint64_t sub_10002734C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001F8A8(a1, a2, a3, a4, v4);
}

void sub_100027354(uint64_t a1, uint64_t a2)
{
  Swift::UInt v3 = *(void *)(a2 + 16);
  Hasher._combine(_:)(v3);
  if (v3)
  {
    uint64_t v4 = (Swift::UInt64 *)(a2 + 32);
    do
    {
      Swift::UInt64 v6 = *v4++;
      Swift::UInt64 v5 = v6;
      if ((v6 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v7 = v5;
      }
      else {
        Swift::UInt64 v7 = 0;
      }
      Hasher._combine(_:)(v7);
      --v3;
    }
    while (v3);
  }
}

uint64_t sub_1000273AC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_10002742C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

unint64_t sub_100027464()
{
  unint64_t result = qword_100062F28;
  if (!qword_100062F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062F28);
  }
  return result;
}

uint64_t sub_1000274B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_100005280(a3);
  sub_100027C44();
  uint64_t v4 = sub_100027DE8();
  v5(v4);
  return a2;
}

uint64_t sub_100027500()
{
  type metadata accessor for Location();
  sub_1000053F4();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_100027D34();
  v1(v0);
  uint64_t v2 = sub_100027CBC();
  return _swift_deallocObject(v2, v3, v4);
}

uint64_t sub_10002758C(uint64_t a1)
{
  return sub_1000275CC(a1, (uint64_t (*)(void))&type metadata accessor for Location, (uint64_t (*)(uint64_t, void, void, unint64_t))sub_10001CBE4);
}

uint64_t sub_1000275CC(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t, void, void, unint64_t))
{
  uint64_t v6 = *(void *)(a2(0) - 8);
  return a3(a1, *(void *)(v3 + 16), *(void *)(v3 + 24), v3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)));
}

uint64_t sub_100027650()
{
  type metadata accessor for Location();
  sub_100009150();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_release();
  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_1000276E8()
{
  uint64_t v0 = type metadata accessor for Location();
  sub_10000F9A0(v0);
  sub_100027E5C();
  uint64_t v1 = sub_1000090F4();
  return sub_10001CC48(v1, v2, v3);
}

uint64_t sub_10002774C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_100005280(a3);
  sub_100027C44();
  uint64_t v4 = sub_100027DD4();
  v5(v4);
  return a2;
}

uint64_t sub_10002779C(uint64_t a1)
{
  return sub_10001A1E8(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_1000277BC(uint64_t a1, uint64_t *a2)
{
  sub_100005280(a2);
  sub_100009150();
  uint64_t v3 = sub_100027C7C();
  v4(v3);
  return a1;
}

uint64_t sub_100027804(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100027860()
{
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000278A8()
{
  return sub_10002388C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1000278B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000278C4()
{
  return swift_release();
}

uint64_t sub_1000278CC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100027918()
{
  return sub_1000235A4();
}

uint64_t sub_100027924()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100027964()
{
  return sub_10002074C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

id sub_10002796C(uint64_t a1)
{
  return [*(id *)(v1 + 408) addOperation:a1];
}

uint64_t sub_100027980@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100020B20(a1, v2, a2);
}

uint64_t sub_10002799C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000279D4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100027C44();
  uint64_t v4 = sub_100027DE8();
  v5(v4);
  return a2;
}

uint64_t sub_100027A28()
{
  uint64_t v1 = sub_100027DA8();
  v2(v1);
  sub_100009150();
  uint64_t v3 = sub_100027C7C();
  v4(v3);
  return v0;
}

uint64_t sub_100027A70()
{
  return sub_100023398(v0);
}

uint64_t sub_100027A7C()
{
  return sub_100020560();
}

uint64_t sub_100027A84(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SevereNotificationsManager.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100027B8CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SevereNotificationsManager.Errors()
{
  return &type metadata for SevereNotificationsManager.Errors;
}

unint64_t sub_100027BC8()
{
  unint64_t result = qword_100062FD0;
  if (!qword_100062FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062FD0);
  }
  return result;
}

uint64_t sub_100027C54()
{
  return static Logger.notifications.getter();
}

uint64_t sub_100027C7C()
{
  return v0;
}

uint64_t sub_100027C8C()
{
  return v0;
}

uint64_t sub_100027CBC()
{
  return v0;
}

void sub_100027CE4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_100027D04()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100027D2C()
{
  return sub_1000235A4();
}

uint64_t sub_100027D34()
{
  return v0 + v1;
}

BOOL sub_100027D4C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100027D80(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_100027DA8()
{
  return 0;
}

uint64_t sub_100027DD4()
{
  return v0;
}

uint64_t sub_100027DE8()
{
  return v0;
}

uint64_t sub_100027E10()
{
  return swift_slowAlloc();
}

uint64_t sub_100027E3C(uint64_t a1)
{
  return sub_1000093BC(v1, 1, a1);
}

void *sub_100027E70(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3;
  if (a3 >> 62) {
    goto LABEL_19;
  }
  uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v21 = v4 & 0xC000000000000001;
    unsigned int v6 = _swiftEmptyArrayStorage;
    uint64_t v7 = 4;
    unint64_t v20 = v4;
    while (1)
    {
      id v8 = v21 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v4 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v25 = v8;
      a1(&v23, &v25);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return v6;
      }

      uint64_t v11 = v24;
      if (v24)
      {
        uint64_t v12 = v5;
        uint64_t v13 = v23;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100033334(0, v6[2] + 1, 1, (uint64_t)v6);
          unsigned int v6 = v17;
        }
        unint64_t v15 = v6[2];
        unint64_t v14 = v6[3];
        if (v15 >= v14 >> 1)
        {
          sub_100033334(v14 > 1, v15 + 1, 1, (uint64_t)v6);
          unsigned int v6 = v18;
        }
        _OWORD v6[2] = v15 + 1;
        uint64_t v16 = &v6[2 * v15];
        v16[4] = v13;
        v16[5] = v11;
        unint64_t v4 = v20;
        uint64_t v5 = v12;
      }
      ++v7;
      if (v10 == v5)
      {
        swift_bridgeObjectRelease();
        return v6;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100028040()
{
  swift_release();
  return v0;
}

uint64_t sub_100028068()
{
  sub_100028040();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for SevereNotificationScheduler()
{
  return self;
}

void sub_1000280C0()
{
  sub_100027CCC();
  uint64_t v3 = v2;
  sub_10002CA88();
  uint64_t v4 = type metadata accessor for SevereNotificationContent();
  __chkstk_darwin(v4 - 8);
  sub_10002CAB0();
  uint64_t v5 = type metadata accessor for SevereNotification();
  sub_1000053F4();
  uint64_t v40 = v6;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v41 = v9;
  uint64_t v42 = (uint64_t)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (uint64_t *)((char *)&v34 - v10);
  uint64_t v12 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v39 = v13;
  __chkstk_darwin(v14);
  sub_100027C54();
  uint64_t v43 = (uint64_t *)v3;
  sub_10002C5D8(v3, (uint64_t)v11, (void (*)(void))type metadata accessor for SevereNotification);
  unint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v36 = v12;
    uint64_t v17 = sub_10002CAE4();
    uint64_t v38 = v0;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v35 = sub_10002CACC();
    uint64_t v44 = v35;
    uint64_t v37 = v1;
    *(_DWORD *)uint64_t v18 = 136446210;
    uint64_t v34 = v18 + 4;
    uint64_t v20 = *v11;
    unint64_t v19 = v11[1];
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1000466F4(v20, v19, &v44);
    sub_10002CA9C(v21);
    uint64_t v1 = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10002C7F0((uint64_t)v11, (void (*)(void))type metadata accessor for SevereNotification);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Scheduling notification with identifier %{public}s", v18, 0xCu);
    swift_arrayDestroy();
    sub_100012FA4();
    sub_100012FA4();
  }
  else
  {
    sub_10002C7F0((uint64_t)v11, (void (*)(void))type metadata accessor for SevereNotification);
  }

  sub_100012FF0();
  v22();
  sub_100027A84(0, &qword_100063080);
  uint64_t v23 = (uint64_t)v43;
  uint64_t v24 = *v43;
  uint64_t v25 = v43[1];
  sub_100027A84(0, &qword_100063088);
  sub_10002C5D8(v23 + *(int *)(v5 + 28), v1, (void (*)(void))type metadata accessor for SevereNotificationContent);
  swift_bridgeObjectRetain();
  id v26 = sub_100049FCC(v1);
  id v27 = sub_100028554(v24, v25, v26, 0);
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  unint64_t v28 = (void *)static OS_dispatch_queue.notifications.getter();
  *(void *)(swift_allocObject() + 16) = v27;
  id v29 = v27;
  firstly<A, B>(on:disposeOn:closure:)();

  swift_release();
  unint64_t v30 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v31 = v42;
  sub_10002C5D8(v23, v42, (void (*)(void))type metadata accessor for SevereNotification);
  unint64_t v32 = (*(unsigned __int8 *)(v40 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  uint64_t v33 = swift_allocObject();
  sub_10002C63C(v31, v33 + v32, (void (*)(void))type metadata accessor for SevereNotification);
  Promise.then<A, B>(on:disposeOn:closure:)();

  swift_release();
  swift_release();
  sub_100027CA4();
}

id sub_100028554(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v7 = [(id)swift_getObjCClassFromMetadata() requestWithIdentifier:v6 content:a3 trigger:a4];

  return v7;
}

uint64_t sub_1000285D8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v64 = type metadata accessor for Logger();
  uint64_t v63 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v62 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for Expression();
  uint64_t v59 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v58 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for Date();
  uint64_t v10 = __chkstk_darwin(v57);
  unint64_t v81 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  os_log_type_t v80 = (char *)&v56 - v12;
  uint64_t v79 = type metadata accessor for UUID();
  uint64_t v100 = *(void *)(v79 - 8);
  uint64_t v13 = __chkstk_darwin(v79);
  uint64_t v78 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  unint64_t v77 = (char *)&v56 - v15;
  uint64_t v76 = type metadata accessor for SevereNotificationEntity();
  uint64_t v99 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for WeatherAlert();
  uint64_t v85 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v83 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for JSONEncoder.DateEncodingStrategy();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = *a1;
  uint64_t v101 = a1[1];
  uint64_t v65 = *(void *)(a2 + 24);
  ReferenceCountedLazy.increase()();
  uint64_t v86 = v102[0];
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  uint64_t v24 = JSONEncoder.init()();
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v23, enum case for JSONEncoder.DateEncodingStrategy.secondsSince1970(_:), v20);
  dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
  uint64_t v25 = *(void *)(a3 + 32);
  uint64_t v26 = *(void *)(v25 + 16);
  uint64_t v82 = v24;
  if (v26)
  {
    uint64_t v27 = type metadata accessor for SevereNotification();
    uint64_t v28 = *(int *)(v27 + 28);
    uint64_t v75 = a3 + *(int *)(v27 + 32);
    uint64_t v74 = a3 + v28;
    uint64_t v29 = v85 + 16;
    uint64_t v73 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 16);
    uint64_t v30 = v25 + ((*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80));
    uint64_t v70 = (void (**)(char *, uint64_t))(v100 + 8);
    uint64_t v68 = (void (**)(char *, uint64_t))(v99 + 8);
    uint64_t v72 = (void (**)(char *, uint64_t))(v85 + 8);
    uint64_t v66 = *(void *)(v85 + 72);
    uint64_t v61 = v25;
    swift_bridgeObjectRetain();
    uint64_t v31 = v83;
    uint64_t v67 = a3;
    uint64_t v69 = v18;
    int64_t v71 = v17;
    uint64_t v85 = v29;
    while (1)
    {
      uint64_t v96 = v30;
      v73(v31, v30, v18);
      swift_bridgeObjectRetain();
      uint64_t v99 = Location.id.getter();
      uint64_t v100 = v32;
      type metadata accessor for SevereNotificationContent();
      sub_10002C6C8(&qword_1000630A0, (void (*)(uint64_t))type metadata accessor for SevereNotificationContent);
      uint64_t v33 = dispatch thunk of JSONEncoder.encode<A>(_:)();
      if (v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        (*v72)(v31, v18);
        goto LABEL_12;
      }
      uint64_t v97 = v33;
      uint64_t v98 = v34;
      uint64_t v87 = v26;
      sub_10002C6C8(&qword_1000630A8, (void (*)(uint64_t))&type metadata accessor for WeatherAlert);
      uint64_t v35 = dispatch thunk of JSONEncoder.encode<A>(_:)();
      uint64_t v36 = v77;
      uint64_t v94 = v37;
      uint64_t v95 = v35;
      WeatherAlert.id.getter();
      uint64_t v93 = UUID.uuidString.getter();
      uint64_t v91 = v38;
      uint64_t v39 = *v70;
      uint64_t v40 = v79;
      (*v70)(v36, v79);
      uint64_t v90 = *(void *)(a3 + 16);
      swift_bridgeObjectRetain();
      uint64_t v41 = WeatherAlert.description.getter();
      uint64_t v92 = 0;
      uint64_t v88 = v42;
      uint64_t v89 = v41;
      WeatherAlert.issuedTime.getter();
      WeatherAlert.expireTime.getter();
      uint64_t v43 = v78;
      UUID.init()();
      UUID.uuidString.getter();
      uint64_t v44 = v40;
      uint64_t v45 = v71;
      v39(v43, v44);
      SevereNotificationEntity.init(identifier:notificationIdentifier:subscription:notification:alert:alertIdentifier:messageIdentifier:alertDescription:issuedTime:expireTime:replacementAlert:)();
      uint64_t v46 = v92;
      NotificationStore.severeNotifications.getter();
      uint64_t v4 = v46;
      if (v46) {
        break;
      }
      dispatch thunk of Table.save.getter();
      swift_release();
      dispatch thunk of Save.entity(_:)();
      uint64_t v18 = v69;
      swift_release();
      (*v68)(v45, v76);
      uint64_t v31 = v83;
      (*v72)(v83, v18);
      uint64_t v30 = v96 + v66;
      uint64_t v26 = v87 - 1;
      a3 = v67;
      if (v87 == 1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
    }
    swift_release();
    (*v68)(v45, v76);
    (*v72)(v83, v69);
LABEL_12:
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_7:
    NotificationStore.severeNotifications.getter();
    if (!v4)
    {
      dispatch thunk of Table.delete.getter();
      swift_release();
      v102[3] = v57;
      v102[4] = (uint64_t)&protocol witness table for Date;
      sub_100008E24(v102);
      Date.init(timeIntervalSinceNow:)();
      uint64_t v47 = v58;
      <= infix(_:_:)();
      sub_100008AD0((uint64_t)v102);
      dispatch thunk of Delete.where(_:)();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v47, v60);
      swift_release();
      swift_release();
      goto LABEL_17;
    }
    swift_release();
  }
  uint64_t v48 = v62;
  static Logger.notifications.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v49 = Logger.logObject.getter();
  os_log_type_t v50 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    v102[0] = swift_slowAlloc();
    uint64_t v100 = 0;
    *(_DWORD *)uint64_t v51 = 136446210;
    uint64_t v103 = v4;
    swift_errorRetain();
    sub_100005280(&qword_100062868);
    uint64_t v52 = String.init<A>(describing:)();
    uint64_t v103 = sub_1000466F4(v52, v53, v102);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v49, v50, "An error occurred while saving severe notification entity: %{public}s", v51, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(char *, uint64_t))(v63 + 8))(v48, v64);
LABEL_17:
  ReferenceCountedLazy.decrease()();
  v102[0] = v84;
  v102[1] = v101;
  sub_100005280(&qword_100062ED0);
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v54 = Promise.init(value:)();
  swift_release();
  return v54;
}

void sub_100029258()
{
  sub_100027CCC();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  uint64_t v32 = v6;
  sub_10002CA88();
  uint64_t v7 = type metadata accessor for SevereNotification();
  uint64_t v8 = sub_10000F9A0(v7);
  uint64_t v31 = v9;
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_100027C54();
  swift_bridgeObjectRetain_n();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v29 = v0;
    uint64_t v18 = sub_10002CAE4();
    uint64_t v28 = v3;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v20 = sub_10002CACC();
    uint64_t v27 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v33 = v20;
    v26[1] = v11;
    *(_DWORD *)uint64_t v19 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1000466F4(v32, v5, &v33);
    sub_10002CA9C(v21);
    uint64_t v1 = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Replacing content for notification with identifier %{public}s", v19, 0xCu);
    swift_arrayDestroy();
    uint64_t v12 = v27;
    sub_100012FA4();
    uint64_t v3 = v28;
    sub_100012FA4();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v0, v30);
  __chkstk_darwin(v22);
  v26[-4] = v3;
  v26[-3] = v1;
  v26[-2] = v32;
  v26[-1] = v5;
  sub_100005280(&qword_100062ED0);
  swift_allocObject();
  Promise.init(resolver:)();
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  uint64_t v23 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_10002C5D8(v3, (uint64_t)v12, (void (*)(void))type metadata accessor for SevereNotification);
  unint64_t v24 = (*(unsigned __int8 *)(v31 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  uint64_t v25 = swift_allocObject();
  sub_10002C63C((uint64_t)v12, v25 + v24, (void (*)(void))type metadata accessor for SevereNotification);
  Promise.then<A, B>(on:disposeOn:closure:)();
  swift_release();

  swift_release();
  sub_100027CA4();
}

void sub_1000295B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = type metadata accessor for SevereNotificationContent();
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)aBlock - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a1;
  *(void *)(v19 + 24) = a2;
  sub_100027A84(0, &qword_100063088);
  uint64_t v20 = type metadata accessor for SevereNotification();
  sub_10002C5D8(a5 + *(int *)(v20 + 28), (uint64_t)v18, (void (*)(void))type metadata accessor for SevereNotificationContent);
  swift_retain();
  id v21 = sub_100049FCC((uint64_t)v18);
  uint64_t v22 = *(void **)(a6 + 16);
  NSString v23 = String._bridgeToObjectiveC()();
  unint64_t v24 = (void *)swift_allocObject();
  void v24[2] = a7;
  v24[3] = a8;
  v24[4] = a3;
  v24[5] = a4;
  v24[6] = sub_10002C748;
  v24[7] = v19;
  aBlock[4] = sub_10002C7C8;
  aBlock[5] = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100029C54;
  aBlock[3] = &unk_10005EDC8;
  uint64_t v25 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [v22 replaceContentForRequestWithIdentifier:v23 replacementContent:v21 completionHandler:v25];
  _Block_release(v25);
}

uint64_t sub_1000297C4(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void), uint64_t (*a5)(uint64_t, unint64_t), uint64_t (*a6)(uint64_t, unint64_t), void (*a7)(void))
{
  uint64_t v38 = a2;
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v35 - v18;
  if (a1)
  {
    swift_errorRetain();
    static Logger.notifications.getter();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v35 = a5;
      uint64_t v23 = v22;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v36 = a4;
      uint64_t v40 = v24;
      *(_DWORD *)uint64_t v23 = 136446466;
      uint64_t v37 = v13;
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_1000466F4(v38, a3, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v23 + 12) = 2082;
      uint64_t v39 = a1;
      swift_errorRetain();
      sub_100005280(&qword_100062868);
      uint64_t v25 = String.init<A>(describing:)();
      uint64_t v39 = sub_1000466F4(v25, v26, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Failed to replace content of notification: %{public}s with error: %{public}s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      a4 = v36;
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v37);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    }
    a4(a1);
    return swift_errorRelease();
  }
  else
  {
    uint64_t v36 = a7;
    static Logger.notifications.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v35 = a6;
      uint64_t v30 = (uint8_t *)v29;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v37 = v13;
      uint64_t v40 = v31;
      *(_DWORD *)uint64_t v30 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v32 = v38;
      uint64_t v39 = sub_1000466F4(v38, a3, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Replaced content of notification: %{public}s", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v33 = v35;
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v37);
      return v33(v32, a3);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      return a6(v38, a3);
    }
  }
}

void sub_100029C54(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100029CC0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v68 = type metadata accessor for Logger();
  uint64_t v67 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v66 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for Expression();
  uint64_t v63 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v62 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = type metadata accessor for Date();
  uint64_t v10 = __chkstk_darwin(v61);
  uint64_t v85 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v84 = (char *)&v60 - v12;
  uint64_t v83 = type metadata accessor for UUID();
  uint64_t v104 = *(void *)(v83 - 8);
  uint64_t v13 = __chkstk_darwin(v83);
  uint64_t v82 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  unint64_t v81 = (char *)&v60 - v15;
  uint64_t v80 = type metadata accessor for SevereNotificationEntity();
  uint64_t v103 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v17 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for WeatherAlert();
  uint64_t v89 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v87 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for JSONEncoder.DateEncodingStrategy();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v60 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = *a1;
  uint64_t v105 = a1[1];
  uint64_t v69 = *(void *)(a2 + 24);
  ReferenceCountedLazy.increase()();
  uint64_t v90 = v106[0];
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  uint64_t v24 = JSONEncoder.init()();
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v23, enum case for JSONEncoder.DateEncodingStrategy.secondsSince1970(_:), v20);
  dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
  uint64_t v25 = *(void *)(a3 + 32);
  uint64_t v26 = *(void *)(v25 + 16);
  uint64_t v86 = v24;
  if (v26)
  {
    uint64_t v27 = type metadata accessor for SevereNotification();
    uint64_t v28 = *(int *)(v27 + 28);
    uint64_t v79 = a3 + *(int *)(v27 + 32);
    uint64_t v78 = a3 + v28;
    uint64_t v29 = v89 + 16;
    unint64_t v77 = *(void (**)(char *, uint64_t, uint64_t))(v89 + 16);
    uint64_t v30 = v25 + ((*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80));
    uint64_t v73 = (void (**)(char *, uint64_t))(v104 + 8);
    uint64_t v72 = (void (**)(char *, uint64_t))(v103 + 8);
    uint64_t v76 = (void (**)(char *, uint64_t))(v89 + 8);
    uint64_t v70 = *(void *)(v89 + 72);
    uint64_t v65 = v25;
    swift_bridgeObjectRetain();
    uint64_t v31 = v87;
    uint64_t v71 = a3;
    uint64_t v75 = v18;
    uint64_t v74 = v17;
    uint64_t v89 = v29;
    while (1)
    {
      uint64_t v100 = v30;
      v77(v31, v30, v18);
      swift_bridgeObjectRetain();
      uint64_t v103 = Location.id.getter();
      uint64_t v104 = v32;
      type metadata accessor for SevereNotificationContent();
      sub_10002C6C8(&qword_1000630A0, (void (*)(uint64_t))type metadata accessor for SevereNotificationContent);
      uint64_t v33 = dispatch thunk of JSONEncoder.encode<A>(_:)();
      if (v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v49 = *v76;
        os_log_type_t v50 = v31;
        uint64_t v51 = v18;
        goto LABEL_12;
      }
      uint64_t v101 = v33;
      uint64_t v102 = v34;
      uint64_t v91 = v26;
      sub_10002C6C8(&qword_1000630A8, (void (*)(uint64_t))&type metadata accessor for WeatherAlert);
      uint64_t v35 = dispatch thunk of JSONEncoder.encode<A>(_:)();
      uint64_t v36 = v81;
      uint64_t v97 = v37;
      uint64_t v98 = v35;
      WeatherAlert.id.getter();
      uint64_t v38 = UUID.uuidString.getter();
      uint64_t v95 = v39;
      uint64_t v96 = v38;
      uint64_t v99 = 0;
      uint64_t v40 = *v73;
      uint64_t v41 = v83;
      (*v73)(v36, v83);
      uint64_t v94 = *(void *)(a3 + 16);
      swift_bridgeObjectRetain();
      uint64_t v42 = WeatherAlert.description.getter();
      uint64_t v92 = v43;
      uint64_t v93 = v42;
      WeatherAlert.issuedTime.getter();
      WeatherAlert.expireTime.getter();
      uint64_t v44 = v82;
      UUID.init()();
      UUID.uuidString.getter();
      uint64_t v45 = v41;
      uint64_t v46 = v74;
      v40(v44, v45);
      SevereNotificationEntity.init(identifier:notificationIdentifier:subscription:notification:alert:alertIdentifier:messageIdentifier:alertDescription:issuedTime:expireTime:replacementAlert:)();
      uint64_t v47 = v99;
      NotificationStore.severeNotifications.getter();
      uint64_t v4 = v47;
      if (v47) {
        break;
      }
      dispatch thunk of Table.save.getter();
      swift_release();
      dispatch thunk of Save.entity(_:)();
      uint64_t v18 = v75;
      swift_release();
      (*v72)(v46, v80);
      uint64_t v31 = v87;
      (*v76)(v87, v18);
      uint64_t v30 = v100 + v70;
      uint64_t v26 = v91 - 1;
      a3 = v71;
      if (v91 == 1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
    }
    swift_release();
    (*v72)(v46, v80);
    uint64_t v49 = *v76;
    os_log_type_t v50 = v87;
    uint64_t v51 = v75;
LABEL_12:
    v49(v50, v51);
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_7:
    NotificationStore.severeNotifications.getter();
    if (!v4)
    {
      dispatch thunk of Table.delete.getter();
      swift_release();
      v106[3] = v61;
      v106[4] = (uint64_t)&protocol witness table for Date;
      sub_100008E24(v106);
      Date.init(timeIntervalSinceNow:)();
      uint64_t v48 = v62;
      <= infix(_:_:)();
      sub_100008AD0((uint64_t)v106);
      dispatch thunk of Delete.where(_:)();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v48, v64);
      swift_release();
      swift_release();
      goto LABEL_17;
    }
    swift_release();
  }
  uint64_t v52 = v66;
  static Logger.notifications.getter();
  swift_errorRetain();
  swift_errorRetain();
  unint64_t v53 = Logger.logObject.getter();
  os_log_type_t v54 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v53, v54))
  {
    os_log_t v55 = (uint8_t *)swift_slowAlloc();
    v106[0] = swift_slowAlloc();
    uint64_t v104 = 0;
    *(_DWORD *)os_log_t v55 = 136446210;
    uint64_t v107 = v4;
    swift_errorRetain();
    sub_100005280(&qword_100062868);
    uint64_t v56 = String.init<A>(describing:)();
    uint64_t v107 = sub_1000466F4(v56, v57, v106);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "An error occurred while saving severe notification entity: %{public}s", v55, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(char *, uint64_t))(v67 + 8))(v52, v68);
LABEL_17:
  v106[0] = v88;
  v106[1] = v105;
  sub_100005280(&qword_100062ED0);
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v58 = Promise.init(value:)();
  ReferenceCountedLazy.decrease()();
  swift_release();
  return v58;
}

void sub_10002A950()
{
  sub_100027CCC();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  sub_10002CA88();
  uint64_t v6 = v5;
  uint64_t v7 = type metadata accessor for SevereNotificationContent();
  __chkstk_darwin(v7 - 8);
  sub_10002CAB0();
  uint64_t v8 = type metadata accessor for Logger();
  sub_1000053F4();
  v30[4] = v9;
  __chkstk_darwin(v10);
  uint64_t v11 = type metadata accessor for UUID();
  sub_1000053F4();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()();
  uint64_t v31 = UUID.uuidString.getter();
  unint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v11);
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = sub_10002CAE4();
    v30[2] = v6;
    uint64_t v22 = (uint8_t *)v21;
    uint64_t v23 = sub_10002CACC();
    v30[3] = v2;
    uint64_t v32 = v23;
    v30[1] = v8;
    *(_DWORD *)uint64_t v22 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_1000466F4(v31, v18, &v32);
    sub_10002CA9C(v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Scheduling notification with identifier %{public}s", v22, 0xCu);
    swift_arrayDestroy();
    sub_100012FA4();
    sub_100012FA4();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_100012FF0();
  v25();
  sub_100027A84(0, &qword_100063080);
  sub_100027A84(0, &qword_100063088);
  sub_10002C5D8(v4, v1, (void (*)(void))type metadata accessor for SevereNotificationContent);
  id v26 = sub_100049FCC(v1);
  id v27 = sub_100028554(v31, v18, v26, 0);
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  uint64_t v28 = (void *)static OS_dispatch_queue.notifications.getter();
  *(void *)(swift_allocObject() + 16) = v27;
  id v29 = v27;
  firstly<A, B>(on:disposeOn:closure:)();

  swift_release();
  sub_100027CA4();
}

uint64_t sub_10002ACE4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002AD1C()
{
  return UNUserNotificationCenter.addNotificationRequest(_:)();
}

void sub_10002AD50()
{
  sub_100027CCC();
  uint64_t v2 = v1;
  sub_10002CA88();
  uint64_t v4 = v3;
  uint64_t v5 = type metadata accessor for SevereMessage();
  uint64_t v6 = sub_10000F9A0(v5);
  uint64_t v35 = v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v30 - v11;
  uint64_t v13 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_100027C54();
  sub_10002C5D8(v2, (uint64_t)v12, (void (*)(void))type metadata accessor for SevereMessage);
  unint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v32 = v2;
    uint64_t v19 = sub_10002CAE4();
    uint64_t v34 = v0;
    os_log_type_t v20 = (uint8_t *)v19;
    uint64_t v21 = sub_10002CACC();
    v30[1] = v15;
    uint64_t v37 = v21;
    v30[0] = v13;
    *(_DWORD *)os_log_type_t v20 = 136315138;
    uint64_t v31 = v10;
    uint64_t v33 = v4;
    uint64_t v22 = *((void *)v12 + 2);
    unint64_t v23 = *((void *)v12 + 3);
    swift_bridgeObjectRetain();
    uint64_t v24 = v22;
    uint64_t v2 = v32;
    uint64_t v25 = sub_1000466F4(v24, v23, &v37);
    sub_10002CA9C(v25);
    uint64_t v10 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10002C7F0((uint64_t)v12, (void (*)(void))type metadata accessor for SevereMessage);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Determining whether to revoke cancelled notifications for channel: %s", v20, 0xCu);
    swift_arrayDestroy();
    sub_100012FA4();
    sub_100012FA4();

    sub_100012FF0();
    v26();
  }
  else
  {
    sub_10002C7F0((uint64_t)v12, (void (*)(void))type metadata accessor for SevereMessage);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v0, v13);
  }
  sub_100005280(&qword_100063090);
  firstly<A>(closure:)();
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  id v27 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_10002C5D8(v2, (uint64_t)v10, (void (*)(void))type metadata accessor for SevereMessage);
  unint64_t v28 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  uint64_t v29 = swift_allocObject();
  sub_10002C63C((uint64_t)v10, v29 + v28, (void (*)(void))type metadata accessor for SevereMessage);
  Promise.then<A, B>(on:disposeOn:closure:)();
  swift_release();
  swift_release();

  swift_release();
  sub_100027CA4();
}

uint64_t sub_10002B0D8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = (uint8_t *)*a1;
  uint64_t v37 = a2;
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v10 = ReferenceCountedLazy.increase()();
  uint64_t v11 = v43;
  uint64_t v12 = *(void *)(a3 + 32);
  uint64_t v13 = *(void *)(v12 + 16);
  uint64_t v38 = v8;
  uint64_t v39 = v43;
  if (v13)
  {
    v34[1] = v9;
    swift_bridgeObjectRetain_n();
    uint64_t v14 = (uint64_t *)(v12 + 40);
    uint64_t v15 = _swiftEmptyArrayStorage;
    do
    {
      uint64_t v17 = *(v14 - 1);
      uint64_t v16 = *v14;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100033334(0, v15[2] + 1, 1, (uint64_t)v15);
        uint64_t v15 = v21;
      }
      unint64_t v19 = v15[2];
      unint64_t v18 = v15[3];
      if (v19 >= v18 >> 1)
      {
        sub_100033334(v18 > 1, v19 + 1, 1, (uint64_t)v15);
        uint64_t v15 = v22;
      }
      v14 += 5;
      long long v15[2] = v19 + 1;
      os_log_type_t v20 = &v15[2 * v19];
      v20[4] = v17;
      void v20[5] = v16;
      --v13;
    }
    while (v13);
    uint64_t v10 = swift_bridgeObjectRelease_n();
    uint64_t v8 = v38;
    uint64_t v11 = v39;
  }
  else
  {
    uint64_t v15 = _swiftEmptyArrayStorage;
  }
  __chkstk_darwin(v10);
  v34[-4] = v11;
  v34[-3] = a3;
  v34[-2] = v15;
  uint64_t v23 = v41;
  uint64_t v24 = sub_100027E70((void (*)(uint64_t *__return_ptr, id *))sub_10002C55C, (uint64_t)&v34[-6], (unint64_t)v40);
  swift_bridgeObjectRelease();
  if (v24[2])
  {
    static Logger.notifications.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v41 = v23;
      id v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)id v27 = 136446210;
      uint64_t v40 = v27 + 4;
      swift_bridgeObjectRetain();
      uint64_t v28 = Array.description.getter();
      unint64_t v30 = v29;
      swift_bridgeObjectRelease();
      uint64_t v42 = sub_1000466F4(v28, v30, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Revoking notifications with identifiers: %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v35 + 8))(v38, v36);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v36);
    }
    uint64_t v31 = *(void **)(v37 + 16);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v31 removeDeliveredNotificationsWithIdentifiers:isa];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  ReferenceCountedLazy.decrease()();
  return swift_release();
}

uint64_t sub_10002B4D4@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, void *a5@<X8>)
{
  uint64_t v106 = a4;
  uint64_t v107 = a3;
  uint64_t v119 = a5;
  uint64_t v109 = type metadata accessor for Logger();
  uint64_t v108 = *(void *)(v109 - 8);
  __chkstk_darwin(v109);
  uint64_t v110 = (char *)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005280(&qword_100063098);
  __chkstk_darwin(v8 - 8);
  uint64_t v115 = (uint64_t)&v97 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for IncomingMessageEntity();
  uint64_t v113 = *(void *)(v10 - 8);
  uint64_t v114 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v111 = (char *)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v112 = (char *)&v97 - v13;
  uint64_t v14 = sub_100005280(&qword_100062EF8);
  __chkstk_darwin(v14 - 8);
  uint64_t v116 = (uint64_t)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for SevereNotificationEntity();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v120 = v16;
  uint64_t v121 = v17;
  uint64_t v18 = __chkstk_darwin(v16);
  os_log_t v133 = (os_log_t)((char *)&v97 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v97 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v97 - v23;
  uint64_t v25 = sub_100005280(&qword_100062878);
  uint64_t v26 = __chkstk_darwin(v25 - 8);
  uint64_t v28 = (char *)&v97 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  uint64_t v124 = (id *)((char *)&v97 - v29);
  uint64_t v30 = type metadata accessor for Expression();
  uint64_t v31 = *(NSObject **)(v30 - 8);
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v34 = (char *)&v97 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  uint64_t v123 = (char *)&v97 - v35;
  uint64_t v36 = *a1;
  uint64_t v37 = v126;
  NotificationStore.severeNotifications.getter();
  if (v37)
  {
    uint64_t result = swift_errorRelease();
    uint64_t v52 = v119;
    *uint64_t v119 = 0;
    v52[1] = 0;
    return result;
  }
  uint64_t v118 = v22;
  uint64_t v101 = v34;
  uint64_t v103 = v28;
  uint64_t v126 = v31;
  uint64_t v105 = v30;
  uint64_t v104 = a2;
  uint64_t v102 = v24;
  uint64_t v39 = dispatch thunk of Table.query.getter();
  swift_release();
  p_name = &stru_100060FF8.name;
  uint64_t v41 = v36;
  id v42 = [v36 identifier];
  uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v45 = v44;

  uint64_t v131 = &type metadata for String;
  uint64_t v132 = &protocol witness table for String;
  uint64_t v129 = (void *)v43;
  unint64_t v130 = v45;
  uint64_t v46 = v123;
  == infix(_:_:)();
  sub_100008AD0((uint64_t)&v129);
  uint64_t v47 = (uint64_t)v124;
  *uint64_t v124 = 1702125924;
  *(void *)(v47 + 8) = 0xE400000000000000;
  uint64_t v48 = enum case for OrderBy.descending(_:);
  uint64_t v49 = type metadata accessor for OrderBy();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 104))(v47, v48, v49);
  sub_100008CEC(v47, 0, 1, v49);
  uint64_t v50 = dispatch thunk of Query.where(_:orderBy:limit:)();
  uint64_t v51 = 0;
  uint64_t v98 = v49;
  uint64_t v100 = 0;
  uint64_t v125 = v50;
  swift_release();
  sub_10002C57C(v47, &qword_100062878);
  unint64_t v53 = v126 + 1;
  Class isa = (void (*)(char *, uint64_t))v126[1].isa;
  isa(v46, v105);
  uint64_t v54 = v125;
  os_log_t v55 = _swiftEmptyArrayStorage;
  uint64_t v127 = _swiftEmptyArrayStorage;
  uint64_t v56 = *(void **)(v125 + 16);
  uint64_t v57 = v121;
  id v97 = v41;
  uint64_t v124 = v56;
  if (v56)
  {
    unint64_t v58 = 0;
    uint64_t v117 = (void (**)(char *, uint64_t))(v121 + 8);
    uint64_t v122 = (void (**)(os_log_t, char *, uint64_t))(v121 + 32);
    uint64_t v123 = (char *)(v121 + 16);
    uint64_t v59 = v120;
    uint64_t v60 = v118;
    uint64_t v126 = v53;
    while (v58 < *(void *)(v54 + 16))
    {
      uint64_t v39 = (uint64_t)p_name;
      unint64_t v61 = (*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
      uint64_t v62 = *(void *)(v57 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v57 + 16))(v60, v54 + v61 + v62 * v58, v59);
      uint64_t v51 = (void **)SevereNotificationEntity.replacementAlert.getter();
      dispatch thunk of Column.value.getter();
      swift_release();
      unint64_t v63 = v130;
      sub_10000F430((uint64_t)v129, v130);
      if (v63 == 1)
      {
        uint64_t v64 = v60;
        uint64_t v65 = *v122;
        (*v122)(v133, v64, v59);
        uint64_t v66 = v127;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          uint64_t v51 = &v127;
          sub_100012108(0, v66[2] + 1, 1);
          uint64_t v66 = v127;
        }
        unint64_t v68 = v66[2];
        unint64_t v67 = v66[3];
        if (v68 >= v67 >> 1)
        {
          uint64_t v51 = &v127;
          sub_100012108(v67 > 1, v68 + 1, 1);
          uint64_t v66 = v127;
        }
        v66[2] = v68 + 1;
        uint64_t v59 = v120;
        v65((os_log_t)((char *)v66 + v61 + v68 * v62), (char *)v133, v120);
        uint64_t v127 = v66;
        uint64_t v57 = v121;
        uint64_t v60 = v118;
      }
      else
      {
        (*v117)(v60, v59);
      }
      ++v58;
      uint64_t v54 = v125;
      p_name = (char **)v39;
      unint64_t v53 = v126;
      if (v124 == (void *)v58)
      {
        os_log_t v55 = v127;
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v59 = v120;
LABEL_16:
  swift_bridgeObjectRelease();
  uint64_t v69 = v116;
  sub_100013880((uint64_t)v55, v116);
  swift_release();
  int v70 = sub_1000093BC(v69, 1, v59);
  uint64_t v71 = v119;
  uint64_t v72 = (uint64_t)v103;
  if (v70 == 1)
  {
    uint64_t result = sub_10002C57C(v69, &qword_100062EF8);
    *uint64_t v71 = 0;
    v71[1] = 0;
    return result;
  }
  uint64_t v73 = v102;
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))(v102, v69, v59);
  uint64_t v74 = v100;
  NotificationStore.incomingMessages.getter();
  if (v74)
  {
    swift_errorRelease();
    uint64_t v77 = v115;
    sub_100008CEC(v115, 1, 1, v114);
LABEL_22:
    (*(void (**)(char *, uint64_t))(v57 + 8))(v73, v59);
    uint64_t result = sub_10002C57C(v77, &qword_100063098);
LABEL_23:
    *uint64_t v71 = 0;
    v71[1] = 0;
    return result;
  }
  uint64_t v126 = v53;
  dispatch thunk of Table.query.getter();
  swift_release();
  SevereNotificationEntity.messageIdentifier.getter();
  dispatch thunk of Column.value.getter();
  uint64_t result = swift_release();
  if (v128)
  {
    uint64_t v131 = &type metadata for String;
    uint64_t v132 = &protocol witness table for String;
    uint64_t v129 = v127;
    unint64_t v130 = v128;
    uint64_t v75 = v101;
    == infix(_:_:)();
    sub_100008AD0((uint64_t)&v129);
    sub_100008CEC(v72, 1, 1, v98);
    uint64_t v76 = v115;
    dispatch thunk of Query.first(_:orderBy:)();
    swift_release();
    sub_10002C57C(v72, &qword_100062878);
    isa(v75, v105);
    uint64_t v78 = v114;
    uint64_t v77 = v76;
    if (sub_1000093BC(v76, 1, v114) == 1)
    {
      uint64_t v73 = v102;
      goto LABEL_22;
    }
    uint64_t v39 = v113;
    p_name = (char **)v112;
    (*(void (**)(char *, uint64_t, uint64_t))(v113 + 32))(v112, v77, v78);
    IncomingMessageEntity.channel.getter();
    dispatch thunk of Column.value.getter();
    swift_release();
    uint64_t v79 = v130;
    if (v130 < 2)
    {
      uint64_t v60 = v110;
      static Logger.notifications.getter();
      (*(void (**)(char *, char **, uint64_t))(v39 + 16))(v111, p_name, v78);
      unint64_t v53 = Logger.logObject.getter();
      uint64_t v51 = (void **)v78;
      os_log_type_t v80 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v53, v80))
      {
LABEL_37:

        uint64_t v90 = *(void (**)(char *, void **))(v39 + 8);
        v90(v111, v51);
        (*(void (**)(char *, uint64_t))(v108 + 8))(v60, v109);
        v90((char *)p_name, v51);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v102, v59);
        goto LABEL_38;
      }
      os_log_t v133 = v53;
      unint64_t v81 = (uint8_t *)swift_slowAlloc();
      uint64_t v127 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v81 = 136315138;
      IncomingMessageEntity.messageID.getter();
      dispatch thunk of Column.value.getter();
      uint64_t result = swift_release();
      if (v130)
      {
        uint64_t v129 = (void *)sub_1000466F4((uint64_t)v129, v130, (uint64_t *)&v127);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        uint64_t v82 = v114;
        uint64_t v83 = *(void (**)(char *, uint64_t))(v113 + 8);
        v83(v111, v114);
        os_log_type_t v84 = v80;
        os_log_t v85 = v133;
        _os_log_impl((void *)&_mh_execute_header, v133, v84, "Encountered incoming message without channel identifier: %s", v81, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v108 + 8))(v110, v109);
        v83(v112, v82);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v121 + 8))(v102, v59);
LABEL_38:
        uint64_t v91 = v119;
        *uint64_t v119 = 0;
        v91[1] = 0;
        return result;
      }
      goto LABEL_46;
    }
    uint64_t v86 = v102;
    uint64_t v87 = (uint64_t)v129;
    if (v129 == *(void **)(v107 + 16) && v130 == *(void *)(v107 + 24))
    {
      sub_10000F430((uint64_t)v129, v130);
    }
    else
    {
      char v89 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10000F430(v87, v79);
      if ((v89 & 1) == 0) {
        goto LABEL_42;
      }
    }
    SevereNotificationEntity.alertIdentifier.getter();
    dispatch thunk of Column.value.getter();
    uint64_t result = swift_release();
    if (v130)
    {
      char v92 = sub_10002C30C((uint64_t)v129, v130, v106);
      swift_bridgeObjectRelease();
      if ((v92 & 1) == 0)
      {
        id v93 = [v97 identifier];
        uint64_t v94 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v96 = v95;

        (*(void (**)(char *, uint64_t))(v113 + 8))(v112, v114);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v86, v59);
        *uint64_t v71 = v94;
        v71[1] = v96;
        return result;
      }
LABEL_42:
      (*(void (**)(char *, uint64_t))(v113 + 8))(v112, v114);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v86, v59);
      goto LABEL_23;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_10002C30C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10002C3D4()
{
  return UNUserNotificationCenter.deliveredNotifications()();
}

uint64_t sub_10002C400()
{
  uint64_t v1 = *(void *)(type metadata accessor for SevereMessage() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for Date();
  sub_100027C44();
  sub_100012FF0();
  v5();
  return _swift_deallocObject(v0, v3, v4);
}

uint64_t sub_10002C4F8(unint64_t *a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for SevereMessage();
  sub_1000090A4(v5);
  return sub_10002B0D8(a1, a2, v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)));
}

uint64_t sub_10002C55C@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  return sub_10002B4D4(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), a2);
}

uint64_t sub_10002C57C(uint64_t a1, uint64_t *a2)
{
  sub_100005280(a2);
  sub_100027C44();
  sub_100012FF0();
  v3();
  return a1;
}

void sub_10002C5CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000295B0(a1, a2, a3, a4, v4[2], v4[3], v4[4], v4[5]);
}

uint64_t sub_10002C5D8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100027C44();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_10002C63C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100027C44();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_10002C69C(uint64_t a1, uint64_t a2)
{
  return sub_10002CA08(a1, a2, (uint64_t (*)(uint64_t, uint64_t, unint64_t))sub_100029CC0);
}

uint64_t sub_10002C6C8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002C710()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002C748(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(void *))(v2 + 16);
  v5[0] = a1;
  v5[1] = a2;
  return v3(v5);
}

uint64_t sub_10002C780()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002C7C8(uint64_t a1)
{
  return sub_1000297C4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void))(v1 + 32), *(uint64_t (**)(uint64_t, unint64_t))(v1 + 40), *(uint64_t (**)(uint64_t, unint64_t))(v1 + 48), *(void (**)(void))(v1 + 56));
}

uint64_t sub_10002C7D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002C7E8()
{
  return swift_release();
}

uint64_t sub_10002C7F0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_100027C44();
  sub_100012FF0();
  v3();
  return a1;
}

uint64_t sub_10002C848()
{
  uint64_t v1 = type metadata accessor for SevereNotification();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v5 + *(int *)(type metadata accessor for SevereNotificationContent() + 40);
  uint64_t v7 = type metadata accessor for Date();
  if (!sub_1000093BC(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  type metadata accessor for Location();
  sub_100027C44();
  sub_100012FF0();
  v8();
  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10002C9DC(uint64_t a1, uint64_t a2)
{
  return sub_10002CA08(a1, a2, (uint64_t (*)(uint64_t, uint64_t, unint64_t))sub_1000285D8);
}

uint64_t sub_10002CA08(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t))
{
  uint64_t v7 = type metadata accessor for SevereNotification();
  sub_1000090A4(v7);
  return a3(a1, a2, v3 + ((*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)));
}

uint64_t sub_10002CA70()
{
  return sub_10002AD1C();
}

uint64_t sub_10002CA9C(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_10002CAB0()
{
  return 0;
}

uint64_t sub_10002CACC()
{
  return swift_slowAlloc();
}

uint64_t sub_10002CAE4()
{
  return swift_slowAlloc();
}

id sub_10002CAFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v2);
  uint64_t v3 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = *(void **)(v0 + 16);
  if (v8)
  {
    id v9 = *(id *)(v0 + 16);
  }
  else
  {
    sub_100007450();
    static DispatchQoS.background.getter();
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v3);
    v14[1] = _swiftEmptyArrayStorage;
    sub_10002E1B4(&qword_100063150, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
    sub_100005280(&qword_100063158);
    sub_10002E1FC(&qword_100063160, &qword_100063158);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    uint64_t v10 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
    uint64_t v11 = *(void **)(v0 + 16);
    *(void *)(v1 + 16) = v10;
    id v9 = v10;

    uint64_t v8 = 0;
  }
  id v12 = v8;
  return v9;
}

uint64_t sub_10002CD68()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_10002CDA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  sub_100008CEC(a1, 0, 1, v4);
  return 0;
}

uint64_t sub_10002CE28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  type metadata accessor for DispatchWorkItemFlags();
  sub_1000053F4();
  uint64_t v29 = v4;
  __chkstk_darwin(v5);
  sub_100013014();
  type metadata accessor for DispatchQoS();
  sub_1000053F4();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_100013014();
  if (qword_1000624E8 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100005248(v9, (uint64_t)static Logger.daemon);
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Performing database management activities", v12, 2u);
    swift_slowDealloc();
  }

  id v13 = sub_10002CAFC();
  uint64_t v34 = sub_10002DFCC;
  uint64_t v35 = v3;
  aBlock = _NSConcreteStackBlock;
  uint64_t v31 = 1107296256;
  uint64_t v32 = sub_1000308F0;
  uint64_t v33 = &unk_10005EE40;
  uint64_t v28 = v3;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  sub_10002E1B4(&qword_100062F80, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005280((uint64_t *)&unk_100064000);
  sub_10002E1FC(&qword_100062F88, (uint64_t *)&unk_100064000);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_10002E2D0();
  _Block_release(v14);

  uint64_t v26 = *(void (**)(void))(v29 + 8);
  sub_10002E310();
  sub_100015E18();
  v15();
  uint64_t v27 = *(void (**)(void))(v7 + 8);
  sub_10002E304();
  v16();
  swift_release();
  id v17 = sub_10002CAFC();
  uint64_t v34 = sub_10002E030;
  uint64_t v35 = v28;
  aBlock = _NSConcreteStackBlock;
  uint64_t v31 = 1107296256;
  uint64_t v32 = sub_1000308F0;
  uint64_t v33 = &unk_10005EE68;
  _Block_copy(&aBlock);
  sub_10002E31C();
  static DispatchQoS.unspecified.getter();
  sub_10002E2F4((uint64_t)_swiftEmptyArrayStorage);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_10002E2D0();
  _Block_release(v14);

  sub_10002E310();
  sub_10002E304();
  v26();
  sub_100015E18();
  v18();
  swift_release();
  id v19 = sub_10002CAFC();
  uint64_t v34 = sub_10002E07C;
  uint64_t v35 = v28;
  aBlock = _NSConcreteStackBlock;
  uint64_t v31 = 1107296256;
  uint64_t v32 = sub_1000308F0;
  uint64_t v33 = &unk_10005EE90;
  _Block_copy(&aBlock);
  sub_10002E31C();
  static DispatchQoS.unspecified.getter();
  sub_10002E2F4((uint64_t)_swiftEmptyArrayStorage);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_10002E2D0();
  _Block_release(v14);

  sub_10002E310();
  sub_10002E304();
  v26();
  sub_10002E304();
  v27();
  swift_release();
  id v20 = sub_10002CAFC();
  uint64_t v34 = sub_10002E0C8;
  uint64_t v35 = v28;
  aBlock = _NSConcreteStackBlock;
  uint64_t v31 = 1107296256;
  uint64_t v32 = sub_1000308F0;
  uint64_t v33 = &unk_10005EEB8;
  _Block_copy(&aBlock);
  sub_10002E31C();
  static DispatchQoS.unspecified.getter();
  sub_10002E2F4((uint64_t)_swiftEmptyArrayStorage);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_10002E2D0();
  _Block_release(v14);

  sub_10002E310();
  sub_100015E18();
  v26();
  sub_10002E304();
  v27();
  swift_release();
  id v21 = sub_10002CAFC();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a1;
  *(void *)(v22 + 24) = a2;
  uint64_t v34 = sub_10002E14C;
  uint64_t v35 = v22;
  aBlock = _NSConcreteStackBlock;
  uint64_t v31 = 1107296256;
  uint64_t v32 = sub_1000308F0;
  uint64_t v33 = &unk_10005EF08;
  _Block_copy(&aBlock);
  sub_10002E31C();
  static DispatchQoS.unspecified.getter();
  sub_10002E2F4((uint64_t)_swiftEmptyArrayStorage);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_10002E2D0();
  _Block_release(v14);

  sub_10002E310();
  sub_100015E18();
  v26();
  sub_10002E304();
  v27();
  swift_release();
  return 1;
}

void sub_10002D490(uint64_t a1)
{
  uint64_t v43 = a1;
  uint64_t v1 = type metadata accessor for Database.VacuumMode();
  uint64_t v41 = *(void *)(v1 - 8);
  uint64_t v42 = v1;
  __chkstk_darwin(v1);
  uint64_t v40 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for Database.CacheSize();
  uint64_t v3 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v5 = (uint64_t *)((char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v38 = type metadata accessor for Database.RecoveryMode();
  uint64_t v6 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Database.JournalingMode();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AssertionOptions();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = type metadata accessor for Database.Location();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v35 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v36 = v15;
  uint64_t v37 = v18;
  uint64_t v34 = *(void (**)(char *, uint64_t))(v15 + 16);
  v34((char *)&v33 - v19, v43);
  static AssertionOptions.weatherAssertions.getter();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Database.JournalingMode.wal(_:), v9);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Database.RecoveryMode.truncate(_:), v38);
  *uint64_t v5 = 16;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, enum case for Database.CacheSize.pages(_:), v39);
  (*(void (**)(char *, void, uint64_t))(v41 + 104))(v40, enum case for Database.VacuumMode.incremental(_:), v42);
  type metadata accessor for Database();
  swift_allocObject();
  LOBYTE(v45[0]) = 1;
  Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)();
  Database.incrementalVacuum()();
  if (v20)
  {
    swift_release();
    uint64_t v21 = v37;
    uint64_t v22 = v35;
    if (qword_1000624E8 != -1) {
      swift_once();
    }
    uint64_t v23 = type metadata accessor for Logger();
    sub_100005248(v23, (uint64_t)static Logger.daemon);
    ((void (*)(char *, uint64_t, uint64_t))v34)(v22, v43, v21);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v44 = v20;
      v45[0] = v27;
      *(_DWORD *)uint64_t v26 = 136446466;
      swift_errorRetain();
      sub_100005280(&qword_100062868);
      uint64_t v28 = String.init<A>(describing:)();
      uint64_t v44 = sub_1000466F4(v28, v29, v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      *(_WORD *)(v26 + 12) = 2082;
      uint64_t v30 = Database.Location.path.getter();
      if (v31)
      {
        unint64_t v32 = v31;
      }
      else
      {
        uint64_t v30 = 7104878;
        unint64_t v32 = 0xE300000000000000;
      }
      uint64_t v44 = sub_1000466F4(v30, v32, v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v22, v21);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "An error occurred while performing incremental vacuum %{public}s at location: %{public}s", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v22, v21);
    }
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_10002DB14(uint64_t a1, const char *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t v7 = type metadata accessor for Database.Location();
  sub_1000053F4();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  id v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000624E8 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_100005248(v13, (uint64_t)static Logger.daemon);
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, a2, v16, 2u);
    swift_slowDealloc();
  }

  a3(0);
  a4();
  sub_10002D490((uint64_t)v12);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v7);
}

uint64_t sub_10002DCA4(void (*a1)(char *, void, uint64_t))
{
  uint64_t v2 = sub_100005280(&qword_1000626D8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Date();
  sub_100008CEC((uint64_t)v4, 1, 1, v5);
  a1(v4, 0, 1);
  return sub_10002E154((uint64_t)v4);
}

uint64_t sub_10002DD54(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t sub_10002DD7C(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t sub_10002DD9C()
{
  uint64_t v0 = type metadata accessor for XPCActivity.XPCPriority();
  sub_1000053F4();
  uint64_t v2 = v1;
  __chkstk_darwin();
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for XPCActivity();
  sub_10002E24C(v5, static XPCActivity.Databases);
  sub_100005248(v5, (uint64_t)static XPCActivity.Databases);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for XPCActivity.XPCPriority.maintenance(_:), v0);
  return XPCActivity.init(identifier:gracePeriod:priority:requiresNetworkConnectivity:)();
}

uint64_t XPCActivity.Databases.unsafeMutableAddressor()
{
  if (qword_100062430 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for XPCActivity();
  return sub_100005248(v0, (uint64_t)static XPCActivity.Databases);
}

uint64_t static XPCActivity.Databases.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100062430 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for XPCActivity();
  uint64_t v3 = sub_100005248(v2, (uint64_t)static XPCActivity.Databases);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t type metadata accessor for DatabaseManager()
{
  return self;
}

uint64_t sub_10002DFCC()
{
  return sub_10002DB14(v0, "Performing incremental vacuum on NotificationStore database", (void (*)(void))&type metadata accessor for NotificationStore, (void (*)(void))&static NotificationStore.location.getter);
}

uint64_t sub_10002E018(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002E028()
{
  return swift_release();
}

uint64_t sub_10002E030()
{
  return sub_10002DB14(v0, "Performing incremental vacuum on GeocodeStore database", (void (*)(void))&type metadata accessor for GeocodeStore, (void (*)(void))&static GeocodeStore.location.getter);
}

uint64_t sub_10002E07C()
{
  return sub_10002DB14(v0, "Performing incremental vacuum on LocationMetadataStore database", (void (*)(void))&type metadata accessor for LocationMetadataStore, (void (*)(void))&static LocationMetadataStore.location.getter);
}

uint64_t sub_10002E0C8()
{
  return sub_10002DB14(v0, "Performing incremental vacuum on WeatherDataStore database", (void (*)(void))&type metadata accessor for WeatherDataStore, (void (*)(void))&static WeatherDataStore.location.getter);
}

uint64_t sub_10002E114()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002E14C()
{
  return sub_10002DCA4(*(void (**)(char *, void, uint64_t))(v0 + 16));
}

uint64_t sub_10002E154(uint64_t a1)
{
  uint64_t v2 = sub_100005280(&qword_1000626D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002E1B4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002E1FC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000080E4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_10002E24C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10002E2D0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10002E2F4@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 160) = a1;
  return v1 - 160;
}

uint64_t sub_10002E310()
{
  return v0;
}

uint64_t sub_10002E31C()
{
  return swift_retain();
}

void sub_10002E334()
{
  if (qword_1000624E8 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005248(v0, (uint64_t)static Logger.daemon);
  uint64_t v1 = (void *)Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (sub_10002EA4C(v2))
  {
    *(_WORD *)sub_100027E10() = 0;
    sub_10002EA2C((void *)&_mh_execute_header, v3, v4, "Daemon has been requested to unregister and exit");
    sub_100012FA4();
  }

  type metadata accessor for XPCActivityManager();
  sub_100005280(&qword_1000631B8);
  uint64_t v5 = type metadata accessor for XPCActivity();
  sub_1000053F4();
  uint64_t v7 = v6;
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1000506E0;
  unint64_t v12 = v11 + v10;
  static XPCActivity.Notifications.getter();
  uint64_t v13 = v12 + v9;
  if (qword_100062430 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_100005248(v5, (uint64_t)static XPCActivity.Databases);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v13, v14, v5);
  static XPCActivityManager.unregister(_:)();
  swift_bridgeObjectRelease();
  os_log_type_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    *(_WORD *)sub_100027E10() = 0;
    sub_10002EA68((void *)&_mh_execute_header, v17, v18, "Exiting after unregistering activities");
    sub_100012FA4();
  }

  exit(0);
}

void sub_10002E528()
{
  if (qword_1000624E8 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005248(v0, (uint64_t)static Logger.daemon);
  uint64_t v1 = (void *)Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (sub_10002EA4C(v2))
  {
    *(_WORD *)sub_100027E10() = 0;
    sub_10002EA2C((void *)&_mh_execute_header, v3, v4, "Daemon has been requested to exit");
    sub_100012FA4();
  }

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  type metadata accessor for XPCActivityManager();
  sub_100005280(&qword_1000631B8);
  uint64_t v6 = type metadata accessor for XPCActivity();
  sub_1000053F4();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 72);
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1000506E0;
  unint64_t v13 = v12 + v11;
  static XPCActivity.Notifications.getter();
  uint64_t v14 = v13 + v10;
  if (qword_100062430 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_100005248(v6, (uint64_t)static XPCActivity.Databases);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v14, v15, v6);
  *(void *)(swift_allocObject() + 16) = v5;
  v5;
  static XPCActivityManager.defer(_:completion:)();
  swift_bridgeObjectRelease();
  swift_release();
  os_log_type_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)sub_100027E10();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Daemon is waiting at defer semaphore", v18, 2u);
    sub_100012FA4();
  }

  OS_dispatch_semaphore.wait()();
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    *(_WORD *)sub_100027E10() = 0;
    sub_10002EA68((void *)&_mh_execute_header, v21, v22, "Exiting after deferring activities");
    sub_100012FA4();
  }

  exit(0);
}

uint64_t sub_10002E7D4()
{
  uint64_t v1 = v0;
  if (qword_1000624E8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005248(v2, (uint64_t)static Logger.daemon);
  uint64_t v3 = (void *)Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (sub_10002EA4C(v4))
  {
    *(_WORD *)sub_100027E10() = 0;
    sub_10002EA2C((void *)&_mh_execute_header, v5, v6, "Daemon running");
    sub_100012FA4();
  }

  type metadata accessor for Settings();
  static Settings.memoryTesting.getter();
  char v7 = dispatch thunk of SettingGroup.isEnabled.getter();
  uint64_t result = swift_release();
  if ((v7 & 1) == 0)
  {
    sub_100005370((void *)(v1 + OBJC_IVAR____TtC8weatherd6Daemon_activityManager), *(void *)(v1 + OBJC_IVAR____TtC8weatherd6Daemon_activityManager + 24));
    dispatch thunk of XPCActivityManagerType.checkIn()();
    sub_100005370((void *)(v1 + OBJC_IVAR____TtC8weatherd6Daemon_severeNotificationsManager), *(void *)(v1 + OBJC_IVAR____TtC8weatherd6Daemon_severeNotificationsManager + 24));
    return sub_10002010C();
  }
  return result;
}

void sub_10002E8F0()
{
}

uint64_t type metadata accessor for Daemon()
{
  return self;
}

uint64_t sub_10002E9D0()
{
  return _swift_deallocObject(v0, 24, 7);
}

Swift::Int sub_10002EA08()
{
  return OS_dispatch_semaphore.signal()();
}

void sub_10002EA2C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL sub_10002EA4C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void sub_10002EA68(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void *sub_10002EA88(void *a1, void *a2, uint64_t a3)
{
  os_log_type_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    void *v4 = *a2;
    os_log_type_t v4 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    a1[4] = a2[4];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)((char *)a2 + v8 + 8);
    *(void *)uint64_t v9 = *(void *)((char *)a2 + v8);
    *((void *)v9 + 1) = v11;
    uint64_t v12 = *(void *)((char *)a2 + v8 + 24);
    *((void *)v9 + 2) = *(void *)((char *)a2 + v8 + 16);
    *((void *)v9 + 3) = v12;
    uint64_t v13 = *(void *)((char *)a2 + v8 + 40);
    *((void *)v9 + 4) = *(void *)((char *)a2 + v8 + 32);
    *((void *)v9 + 5) = v13;
    uint64_t v14 = *(void *)((char *)a2 + v8 + 56);
    *((void *)v9 + 6) = *(void *)((char *)a2 + v8 + 48);
    *((void *)v9 + 7) = v14;
    *((void *)v9 + 8) = *(void *)((char *)a2 + v8 + 64);
    v9[72] = *((unsigned char *)a2 + v8 + 72);
    uint64_t v15 = *(int *)(type metadata accessor for SevereNotificationContent() + 40);
    __dst = &v9[v15];
    os_log_type_t v16 = &v10[v15];
    uint64_t v17 = type metadata accessor for Date();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (sub_1000093BC((uint64_t)v16, 1, v17))
    {
      uint64_t v18 = sub_100005280(&qword_1000626D8);
      memcpy(__dst, v16, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(__dst, v16, v17);
      sub_100008CEC((uint64_t)__dst, 0, 1, v17);
    }
    uint64_t v20 = *(int *)(a3 + 32);
    uint64_t v21 = (char *)v4 + v20;
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = type metadata accessor for Location();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  }
  return v4;
}

uint64_t sub_10002ECC8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v4 + *(int *)(type metadata accessor for SevereNotificationContent() + 40);
  uint64_t v6 = type metadata accessor for Date();
  if (!sub_1000093BC(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 32);
  uint64_t v8 = type metadata accessor for Location();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

void *sub_10002EDE8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  a1[4] = a2[4];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)((char *)a2 + v7 + 8);
  *(void *)uint64_t v8 = *(void *)((char *)a2 + v7);
  *((void *)v8 + 1) = v10;
  uint64_t v11 = *(void *)((char *)a2 + v7 + 24);
  *((void *)v8 + 2) = *(void *)((char *)a2 + v7 + 16);
  *((void *)v8 + 3) = v11;
  uint64_t v12 = *(void *)((char *)a2 + v7 + 40);
  *((void *)v8 + 4) = *(void *)((char *)a2 + v7 + 32);
  *((void *)v8 + 5) = v12;
  uint64_t v13 = *(void *)((char *)a2 + v7 + 56);
  *((void *)v8 + 6) = *(void *)((char *)a2 + v7 + 48);
  *((void *)v8 + 7) = v13;
  *((void *)v8 + 8) = *(void *)((char *)a2 + v7 + 64);
  v8[72] = *((unsigned char *)a2 + v7 + 72);
  uint64_t v14 = *(int *)(type metadata accessor for SevereNotificationContent() + 40);
  uint64_t v15 = &v8[v14];
  os_log_type_t v16 = &v9[v14];
  uint64_t v17 = type metadata accessor for Date();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (sub_1000093BC((uint64_t)v16, 1, v17))
  {
    uint64_t v18 = sub_100005280(&qword_1000626D8);
    memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    sub_100008CEC((uint64_t)v15, 0, 1, v17);
  }
  uint64_t v19 = *(int *)(a3 + 32);
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = type metadata accessor for Location();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  return a1;
}

void *sub_10002EFD0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(void *)uint64_t v7 = *(void *)((char *)a2 + v6);
  *((void *)v7 + 1) = *(void *)((char *)a2 + v6 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v7 + 2) = *((void *)v8 + 2);
  *((void *)v7 + 3) = *((void *)v8 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v7 + 4) = *((void *)v8 + 4);
  *((void *)v7 + 5) = *((void *)v8 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v7 + 6) = *((void *)v8 + 6);
  *((void *)v7 + 7) = *((void *)v8 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v7 + 8) = *((void *)v8 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7[72] = v8[72];
  uint64_t v9 = *(int *)(type metadata accessor for SevereNotificationContent() + 40);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = &v8[v9];
  uint64_t v12 = type metadata accessor for Date();
  int v13 = sub_1000093BC((uint64_t)v10, 1, v12);
  int v14 = sub_1000093BC((uint64_t)v11, 1, v12);
  if (!v13)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v16 = sub_100005280(&qword_1000626D8);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  sub_100008CEC((uint64_t)v10, 0, 1, v12);
LABEL_7:
  uint64_t v17 = *(int *)(a3 + 32);
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = type metadata accessor for Location();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  return a1;
}

uint64_t sub_10002F28C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(a2 + v7 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(v8 + 16) = v10;
  long long v11 = *(_OWORD *)(a2 + v7 + 48);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + v7 + 32);
  *(_OWORD *)(v8 + 48) = v11;
  *(void *)(v8 + 64) = *(void *)(a2 + v7 + 64);
  *(unsigned char *)(v8 + 72) = *(unsigned char *)(a2 + v7 + 72);
  uint64_t v12 = *(int *)(type metadata accessor for SevereNotificationContent() + 40);
  int v13 = (void *)(v8 + v12);
  int v14 = (const void *)(v9 + v12);
  uint64_t v15 = type metadata accessor for Date();
  if (sub_1000093BC((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = sub_100005280(&qword_1000626D8);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
    sub_100008CEC((uint64_t)v13, 0, 1, v15);
  }
  uint64_t v17 = *(int *)(a3 + 32);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = type metadata accessor for Location();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  return a1;
}

void *sub_10002F3F8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (char *)a1 + v8;
  long long v10 = (char *)a2 + v8;
  uint64_t v11 = *(void *)((char *)a2 + v8 + 8);
  *(void *)uint64_t v9 = *(void *)((char *)a2 + v8);
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *((void *)v10 + 3);
  *((void *)v9 + 2) = *((void *)v10 + 2);
  *((void *)v9 + 3) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *((void *)v10 + 5);
  *((void *)v9 + 4) = *((void *)v10 + 4);
  *((void *)v9 + 5) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *((void *)v10 + 7);
  *((void *)v9 + 6) = *((void *)v10 + 6);
  *((void *)v9 + 7) = v14;
  swift_bridgeObjectRelease();
  *((void *)v9 + 8) = *((void *)v10 + 8);
  swift_bridgeObjectRelease();
  v9[72] = v10[72];
  uint64_t v15 = *(int *)(type metadata accessor for SevereNotificationContent() + 40);
  uint64_t v16 = &v9[v15];
  uint64_t v17 = &v10[v15];
  uint64_t v18 = type metadata accessor for Date();
  int v19 = sub_1000093BC((uint64_t)v16, 1, v18);
  int v20 = sub_1000093BC((uint64_t)v17, 1, v18);
  if (!v19)
  {
    uint64_t v21 = *(void *)(v18 - 8);
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v16, v17, v18);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v16, v18);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    uint64_t v22 = sub_100005280(&qword_1000626D8);
    memcpy(v16, v17, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  sub_100008CEC((uint64_t)v16, 0, 1, v18);
LABEL_7:
  uint64_t v23 = *(int *)(a3 + 32);
  uint64_t v24 = (char *)a1 + v23;
  os_log_type_t v25 = (char *)a2 + v23;
  uint64_t v26 = type metadata accessor for Location();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 40))(v24, v25, v26);
  return a1;
}

uint64_t sub_10002F644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002F658);
}

uint64_t sub_10002F658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    type metadata accessor for SevereNotificationContent();
    sub_10002F8EC();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 28);
    }
    else
    {
      uint64_t v10 = type metadata accessor for Location();
      uint64_t v11 = *(int *)(a3 + 32);
    }
    return sub_1000093BC(a1 + v11, a2, v10);
  }
}

uint64_t sub_10002F704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002F718);
}

uint64_t sub_10002F718(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    type metadata accessor for SevereNotificationContent();
    sub_10002F8EC();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 28);
    }
    else
    {
      uint64_t v10 = type metadata accessor for Location();
      uint64_t v11 = *(int *)(a4 + 32);
    }
    return sub_100008CEC(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for SevereNotification()
{
  uint64_t result = qword_100063218;
  if (!qword_100063218) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002F808()
{
  uint64_t result = type metadata accessor for SevereNotificationContent();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Location();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

id sub_10002F904()
{
  unint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = *(id *)(v0 + 16);
  }
  else
  {
    id v3 = sub_10002F95C();
    unint64_t v4 = *(void **)(v0 + 16);
    *(void *)(v0 + 16) = v3;
    id v2 = v3;

    unint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

id sub_10002F95C()
{
  id v0 = [objc_allocWithZone((Class)NSOperationQueue) init];
  [v0 setMaxConcurrentOperationCount:1];
  sub_100007450();
  unint64_t v1 = (void *)static OS_dispatch_queue.notifications.getter();
  [v0 setUnderlyingQueue:v1];

  return v0;
}

uint64_t sub_10002F9D4(long long *a1)
{
  uint64_t v3 = type metadata accessor for PromiseDeduperFlags();
  __chkstk_darwin(v3);
  *(void *)(v1 + 16) = 0;
  sub_100030770();
  sub_100005280(&qword_100063310);
  sub_1000307C0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_100005280(&qword_100063318);
  swift_allocObject();
  *(void *)(v1 + 64) = PromiseDeduper.init(options:)();
  sub_100008E88(a1, v1 + 24);
  return v1;
}

uint64_t sub_10002FADC()
{
  sub_100008AD0(v0 + 24);
  swift_release();
  return v0;
}

uint64_t sub_10002FB0C()
{
  sub_10002FADC();
  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for CloudChannelMapManager()
{
  return self;
}

uint64_t sub_10002FB64(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v20 = v6;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = a1;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_1000466F4(v21, a2, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Requested channel map asset download with identifier: %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v21;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v20);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v14 = *(void *)(v3 + 64);
  uint64_t v15 = (void *)swift_allocObject();
  long long v15[2] = a1;
  v15[3] = a2;
  v15[4] = v14;
  v15[5] = v3;
  objc_allocWithZone((Class)sub_100005280(&qword_100063320));
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v16 = (void *)AsyncBlockOperation.init(_:)();
  sub_100005280(&qword_100063328);
  id v17 = v16;
  uint64_t v18 = Promise.__allocating_init(_:scheduleOn:)();

  return v18;
}

uint64_t sub_10002FE38(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  os_log_type_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v20 = a3;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v18 = v8;
    uint64_t v15 = (uint8_t *)v14;
    v22[0] = swift_slowAlloc();
    uint64_t v19 = a4;
    *(_DWORD *)uint64_t v15 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1000466F4(a1, a2, v22);
    a4 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Starting channel map download for identifier: %{public}s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v16 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v18);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v16 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v22[0] = a1;
  v22[1] = a2;
  __chkstk_darwin(v16);
  *(&v18 - 4) = a4;
  *(&v18 - 3) = a1;
  *(&v18 - 2) = a2;
  return PromiseDeduper.promise(key:createBlock:)();
}

uint64_t sub_1000300B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100007450();
  id v5 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_bridgeObjectRetain();
  sub_100005280(&qword_100062680);
  type metadata accessor for CloudChannelMapManager();
  firstly<A, B>(on:disposeOn:closure:)();

  swift_release();
  uint64_t v7 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  swift_bridgeObjectRetain();
  Promise.then<A>(on:closure:)();
  swift_release();

  swift_release();
  uint64_t v9 = (void *)zalgo.getter();
  uint64_t v10 = Promise.error(on:closure:)();
  swift_release();

  return v10;
}

uint64_t sub_10003021C(uint64_t a1)
{
  return dispatch thunk of ChannelMapServiceType.channelMap(with:)();
}

uint64_t sub_100030288(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  os_log_type_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v17 = v7;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v18 = a1;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v19 = v3;
    v20[0] = v15;
    *(_DWORD *)uint64_t v14 = 136446210;
    swift_bridgeObjectRetain();
    v20[6] = sub_1000466F4(a2, a3, v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Completed channel map download with identifier: %{public}s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v18;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v17);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  sub_100008A6C(a1, (uint64_t)v20);
  sub_100005280(&qword_100063328);
  swift_allocObject();
  return Promise.init(value:)();
}

uint64_t sub_1000304E4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v15 = v2;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v16 = a1;
    uint64_t v17 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    swift_errorRetain();
    sub_100005280(&qword_100062868);
    uint64_t v11 = String.init<A>(describing:)();
    uint64_t v16 = sub_1000466F4(v11, v12, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to download cloud channel: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v15);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

void sub_100030718(uint64_t a1)
{
  id v2 = sub_10002F904();
  [v2 addOperation:a1];
}

unint64_t sub_100030770()
{
  unint64_t result = qword_100064010;
  if (!qword_100064010)
  {
    type metadata accessor for PromiseDeduperFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064010);
  }
  return result;
}

unint64_t sub_1000307C0()
{
  unint64_t result = qword_100064020;
  if (!qword_100064020)
  {
    sub_1000080E4(&qword_100063310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064020);
  }
  return result;
}

uint64_t sub_100030814()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10003085C()
{
  return sub_10002FE38(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

void sub_100030868(uint64_t a1)
{
}

uint64_t sub_100030870()
{
  return sub_1000300B0(v0[2], v0[3], v0[4]);
}

uint64_t sub_10003087C()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000308B4(uint64_t a1)
{
  return sub_10003021C(a1);
}

uint64_t sub_1000308D0(uint64_t a1)
{
  return sub_100030288(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000308F0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_100030934()
{
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000633C8);
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000633D0);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  type metadata accessor for PrecipitationNotificationsManager();
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.private.getter();
  sub_100005280(&qword_1000633D8);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  type metadata accessor for NotificationAuthorizationManager();
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000633E0);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000633E8);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.private.getter();
  RegistrationContainer.lazy(block:)();
  return swift_release();
}

uint64_t sub_100030B2C(void *a1)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000633D0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v12)
  {
    __break(1u);
    goto LABEL_6;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000633E0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v10)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063460);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = sub_100032E98((uint64_t)v9, v10);
    __chkstk_darwin(v4);
    uint64_t v6 = (uint64_t *)&v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    uint64_t v8 = sub_100034AB8((uint64_t)v11, *v6, v3);
    sub_100008AD0((uint64_t)v9);
    return (uint64_t)v8;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_100030CD4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  uint64_t v3 = type metadata accessor for PrecipitationNotificationsManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    a2[3] = v3;
    a2[4] = (uint64_t)&protocol witness table for PrecipitationNotificationsManager;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100030D48(void *a1)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063498);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_15;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000633F8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v12)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063400);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v11)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063408);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v10)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063410);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v9)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063490);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v8)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000633E8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v7)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063418);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v6)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000634D0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v5)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000633D8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v4)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063460);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000634E0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    id v3 = objc_allocWithZone((Class)type metadata accessor for PrecipitationNotificationsManager());
    return PrecipitationNotificationsManager.init(weatherDataService:policyHandler:notificationContentFactory:notificationDeliveryScheduler:notificationFetchScheduler:notificationSubscriptionManager:notificationConfigurationProvider:notificationAuthorizationStatusProvider:locationManager:locationComparator:notificationsEnablementTracker:notificationAccuracyTracker:)();
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1000310C0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000634D8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v4 = type metadata accessor for NotificationLocationComparator();
    swift_allocObject();
    uint64_t result = NotificationLocationComparator.init(lazyAppConfigurationManager:)();
    a2[3] = v4;
    a2[4] = (uint64_t)&protocol witness table for NotificationLocationComparator;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100031158(void *a1)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000633C8);
  id result = (id)dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    sub_100005370(a1, a1[3]);
    sub_100027A84(0, &qword_1000633F0);
    id result = (id)dispatch thunk of ResolverType.resolve<A>(_:)();
    if (result)
    {
      uint64_t v4 = result;
      id v5 = objc_allocWithZone((Class)type metadata accessor for NotificationAuthorizationManager());
      return sub_10000FA2C(v3, v4);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100031228@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063420);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v47)
  {
    __break(1u);
    goto LABEL_15;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063428);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v45)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063440);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v43)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063448);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v41)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063458);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v39)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063490);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v37[3])
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000634D0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v36[3])
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000633D8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v35[3])
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063418);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v34[3])
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063488);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v5 = result;
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063460);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v31 = result;
  uint64_t v32 = v5;
  uint64_t v33 = a2;
  sub_100005370(a1, a1[3]);
  type metadata accessor for SevereNotificationsPowerLogger();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = sub_100032E98((uint64_t)v46, v47);
    void v30[2] = v30;
    __chkstk_darwin(v7);
    uint64_t v9 = (void *)((char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v10 + 16))(v9);
    uint64_t v11 = sub_100032E98((uint64_t)v44, v45);
    v30[1] = v30;
    __chkstk_darwin(v11);
    uint64_t v13 = (void *)((char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v14 + 16))(v13);
    uint64_t v15 = sub_100032E98((uint64_t)v42, v43);
    v30[0] = v30;
    __chkstk_darwin(v15);
    uint64_t v17 = (void *)((char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v18 + 16))(v17);
    uint64_t v19 = sub_100032E98((uint64_t)v40, v41);
    __chkstk_darwin(v19);
    uint64_t v21 = (void *)((char *)v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v22 + 16))(v21);
    uint64_t v23 = sub_100032E98((uint64_t)v38, v39);
    __chkstk_darwin(v23);
    os_log_type_t v25 = (void *)((char *)v30 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v26 + 16))(v25);
    *(void *)&long long v29 = v34;
    *((void *)&v29 + 1) = v32;
    uint64_t v27 = sub_100034BDC(*v9, *v13, *v17, *v21, *v25, (uint64_t)v37, (uint64_t)v36, (uint64_t)v35, v29, v31, v6);
    sub_100008AD0((uint64_t)v38);
    sub_100008AD0((uint64_t)v40);
    sub_100008AD0((uint64_t)v42);
    sub_100008AD0((uint64_t)v44);
    sub_100008AD0((uint64_t)v46);
    uint64_t result = type metadata accessor for SevereNotificationsManager();
    uint64_t v28 = v33;
    v33[3] = result;
    v28[4] = (uint64_t)&off_10005E7C8;
    *uint64_t v28 = v27;
    return result;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_10003192C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  type metadata accessor for NotificationConfigurationManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_100005370(a1, a1[3]);
    sub_100005280(&qword_100063408);
    uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
    if (v6)
    {
      uint64_t v5 = type metadata accessor for PreciptationNotificationConfigurationProvider();
      swift_allocObject();
      uint64_t result = PreciptationNotificationConfigurationProvider.init(notificationConfigurationManager:notificationDeliveryScheduler:)();
      a2[3] = v5;
      a2[4] = (uint64_t)&protocol witness table for PreciptationNotificationConfigurationProvider;
      *a2 = result;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100031A14()
{
  sub_100027A84(0, &qword_1000633F0);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_1000633F8);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063400);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063408);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063410);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063418);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063420);
  RegistrationContainer.register<A>(_:name:factory:)();
  Definition.thenConfigure(_:)();
  swift_release();
  swift_release();
  sub_100005280(&qword_100063428);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063430);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063438);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063440);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063448);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063450);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063458);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  type metadata accessor for APSIncomingMessageStore();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063460);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  type metadata accessor for SevereNotificationsPowerLogger();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063468);
  RegistrationContainer.register<A>(_:name:factory:)();
  return swift_release();
}

id sub_100031E64()
{
  id v0 = [self weatherNotificationCenter];
  return v0;
}

uint64_t sub_100031EA4@<X0>(uint64_t *a1@<X8>)
{
  return sub_100032904((uint64_t (*)(void))&type metadata accessor for PrecipitationNotificationPolicyHandler, (uint64_t (*)(void))&PrecipitationNotificationPolicyHandler.init(), (uint64_t)&protocol witness table for PrecipitationNotificationPolicyHandler, a1);
}

uint64_t sub_100031ED8@<X0>(uint64_t *a1@<X8>)
{
  return sub_100032904((uint64_t (*)(void))&type metadata accessor for PrecipitationNotificationContentFactory, (uint64_t (*)(void))&PrecipitationNotificationContentFactory.init(), (uint64_t)&protocol witness table for PrecipitationNotificationContentFactory, a1);
}

uint64_t sub_100031F0C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063488);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_100005370(a1, a1[3]);
    sub_100027A84(0, &qword_1000633F0);
    uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
    if (result)
    {
      uint64_t v5 = type metadata accessor for PrecipitationNotificationDeliveryScheduler();
      swift_allocObject();
      uint64_t result = PrecipitationNotificationDeliveryScheduler.init(notificationStore:userNotificationCenter:)();
      a2[3] = v5;
      a2[4] = (uint64_t)&protocol witness table for PrecipitationNotificationDeliveryScheduler;
      *a2 = result;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100031FFC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063488);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_100005370(a1, a1[3]);
    sub_100005280(&qword_1000634C8);
    uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
    if (v6)
    {
      uint64_t Scheduler = type metadata accessor for PrecipitationNotificationFetchScheduler();
      swift_allocObject();
      uint64_t result = PrecipitationNotificationFetchScheduler.init(notificationStore:activityManager:)();
      a2[3] = Scheduler;
      a2[4] = (uint64_t)&protocol witness table for PrecipitationNotificationFetchScheduler;
      *a2 = result;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000320E8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100027A84(0, &qword_1000633F0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = type metadata accessor for NotificationAuthorizationStatusProvider();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    a2[3] = v5;
    uint64_t result = sub_100035244(&qword_1000634C0, (void (*)(uint64_t))type metadata accessor for NotificationAuthorizationStatusProvider);
    a2[4] = result;
    *a2 = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000321B4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = (objc_class *)type metadata accessor for APSConnectionManager();
  id result = [objc_allocWithZone(v2) init];
  a1[3] = v2;
  a1[4] = &off_10005F7F0;
  *a1 = result;
  return result;
}

uint64_t sub_100032200(void *a1, void *a2)
{
  uint64_t v3 = sub_100005370(a1, a1[3]);
  sub_100005370(a2, a2[3]);
  type metadata accessor for APSIncomingMessageStore();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_1000342A8(result, *v3);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100032288@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063468);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v5 = result;
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063420);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v14)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_100005370(a1, a1[3]);
  type metadata accessor for NotificationConfigurationManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = sub_100032E98((uint64_t)v13, v14);
    __chkstk_darwin(v7);
    uint64_t v9 = (uint64_t *)&v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    (*(void (**)(uint64_t *))(v10 + 16))(v9);
    uint64_t v11 = sub_1000350F8(v5, *v9, v6);
    sub_100008AD0((uint64_t)v13);
    uint64_t result = type metadata accessor for CloudChannelManager();
    a2[3] = result;
    a2[4] = &off_10005F0E0;
    *a2 = v11;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_100032448@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  type metadata accessor for NotificationConfigurationManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v5 = result;
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063438);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v24)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000634A8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v22)
  {
    uint64_t v6 = sub_100032E98((uint64_t)v23, v24);
    __chkstk_darwin(v6);
    uint64_t v8 = (void *)((char *)&v20[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v9 + 16))(v8);
    uint64_t v10 = *v8;
    uint64_t v11 = type metadata accessor for CloudChannelMapManager();
    v20[3] = v11;
    v20[4] = &off_10005EF58;
    v20[0] = v10;
    uint64_t v12 = type metadata accessor for CloudChannelMapProvider();
    uint64_t v13 = (void *)swift_allocObject();
    uint64_t v14 = sub_100032E98((uint64_t)v20, v11);
    __chkstk_darwin(v14);
    uint64_t v16 = (void *)((char *)&v20[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v17 + 16))(v16);
    uint64_t v18 = *v16;
    v13[6] = v11;
    v13[7] = &off_10005EF58;
    v13[2] = v5;
    v13[3] = v18;
    sub_100008E88(&v21, (uint64_t)(v13 + 8));
    sub_100008AD0((uint64_t)v20);
    uint64_t result = sub_100008AD0((uint64_t)v23);
    a2[3] = v12;
    a2[4] = &off_10005E3C8;
    *a2 = v13;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1000326F8@<X0>(uint64_t *a1@<X8>)
{
  sub_100005370(qword_100064228, qword_100064240);
  sub_100005280(&qword_1000634A0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v5)
  {
    uint64_t v3 = type metadata accessor for CloudChannelMapManager();
    swift_allocObject();
    uint64_t result = sub_10002F9D4(&v4);
    a1[3] = v3;
    a1[4] = (uint64_t)&off_10005EF58;
    *a1 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000327A0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063498);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = type metadata accessor for SevereWeatherEventDataProvider();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    a2[3] = v5;
    a2[4] = (uint64_t)&off_10005F2D8;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003282C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063450);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v7)
  {
    uint64_t v4 = type metadata accessor for SevereNotificationContentFactory();
    uint64_t v5 = swift_allocObject();
    uint64_t result = sub_100008E88(&v6, v5 + 16);
    a2[3] = v4;
    a2[4] = (uint64_t)&off_10005E7A0;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000328D0@<X0>(uint64_t *a1@<X8>)
{
  return sub_100032904((uint64_t (*)(void))&type metadata accessor for SevereNotificationStringBuilder, (uint64_t (*)(void))&SevereNotificationStringBuilder.init(), (uint64_t)&protocol witness table for SevereNotificationStringBuilder, a1);
}

uint64_t sub_100032904@<X0>(uint64_t (*a1)(void)@<X1>, uint64_t (*a2)(void)@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v7 = a1(0);
  swift_allocObject();
  uint64_t result = a2();
  a4[3] = v7;
  a4[4] = a3;
  *a4 = result;
  return result;
}

uint64_t sub_10003296C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100027A84(0, &qword_1000633F0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v5 = result;
    sub_100005370(a1, a1[3]);
    sub_100005280(&qword_100063488);
    uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = type metadata accessor for SevereNotificationScheduler();
      uint64_t result = swift_allocObject();
      *(void *)(result + 16) = v5;
      *(void *)(result + 24) = v6;
      a2[3] = v7;
      a2[4] = (uint64_t)&off_10005ECD8;
      *a2 = result;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100032A4C(void *a1)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063488);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v2 = result;
    type metadata accessor for APSIncomingMessageStore();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100032AC0(uint64_t a1)
{
  return sub_100032C1C(a1, (uint64_t)&unk_10005F018, &qword_100063460);
}

uint64_t sub_100032AE8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063490);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v4)
  {
    type metadata accessor for NotificationEnablementTracker();
    swift_allocObject();
    uint64_t result = NotificationEnablementTracker.init(subscriptionManager:)();
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100032B78(void *a1)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063488);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    type metadata accessor for SevereNotificationsPowerLogger();
    swift_allocObject();
    return SevereNotificationsPowerLogger.init(notificationStore:)();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100032BF4(uint64_t a1)
{
  return sub_100032C1C(a1, (uint64_t)&unk_10005EFF0, &qword_100063468);
}

uint64_t sub_100032C1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = type metadata accessor for LazyOptions();
  __chkstk_darwin(v5);
  sub_100008A6C(a1, (uint64_t)v8);
  uint64_t v6 = swift_allocObject();
  sub_100008E88(v8, v6 + 16);
  *(void *)&v8[0] = _swiftEmptyArrayStorage;
  sub_100035244(&qword_100063470, (void (*)(uint64_t))&type metadata accessor for LazyOptions);
  sub_100005280(&qword_100063478);
  sub_10002E1FC((unint64_t *)&qword_100063480, &qword_100063478);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_100005280(a3);
  swift_allocObject();
  return ReferenceCountedLazy.init(options:loadBlock:)();
}

uint64_t sub_100032D8C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063430);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v5) {
    return sub_100008E88(&v4, a2);
  }
  __break(1u);
  return result;
}

uint64_t Settings.DaemonStore.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for NotificationAssembly()
{
  return self;
}

uint64_t sub_100032E38()
{
  return sub_100030934();
}

uint64_t sub_100032E50()
{
  sub_100008AD0(v0 + 16);
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100032E88@<X0>(uint64_t a1@<X8>)
{
  return sub_100032D8C((void *)(v1 + 16), a1);
}

uint64_t sub_100032E90@<X0>(uint64_t *a1@<X8>)
{
  return sub_100032AE8((void *)(v1 + 16), a1);
}

uint64_t sub_100032E98(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

void sub_100032EE8()
{
  uint64_t v1 = *v0;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100033608(0, *(void *)(v1 + 16) + 1, 1, v1, &qword_1000634B0, (void (*)(void, uint64_t, void *, uint64_t))sub_1000336F0, (void (*)(uint64_t, uint64_t, void *))sub_100033DA8);
    *uint64_t v0 = v3;
  }
}

void sub_100032F64(uint64_t a1)
{
  unint64_t v2 = *(void *)(*v1 + 24);
  if (a1 + 1 > (uint64_t)(v2 >> 1))
  {
    sub_100033608(v2 > 1, a1 + 1, 1, *v1, &qword_1000634B0, (void (*)(void, uint64_t, void *, uint64_t))sub_1000336F0, (void (*)(uint64_t, uint64_t, void *))sub_100033DA8);
    uint64_t *v1 = v3;
  }
}

void sub_100032FD4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_100035320();
    if (v7 != v8)
    {
      sub_10003535C();
      if (v7)
      {
        __break(1u);
        return;
      }
      sub_100035310();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    sub_100005280(&qword_100062A98);
    uint64_t v11 = (char *)swift_allocObject();
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v11 + 32;
  if (a1)
  {
    sub_100033E40((char *)(a4 + 32), v9, v13);
    sub_100035330();
  }
  else
  {
    sub_100033808(0, v9, (unint64_t)v13, a4);
  }
}

uint64_t sub_1000330B0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_100033140(a1, a2, a3, a4, &qword_1000634E8, (uint64_t (*)(void))&type metadata accessor for LocationInfo, (uint64_t (*)(void))&type metadata accessor for LocationInfo, (void (*)(void))&type metadata accessor for LocationInfo);
}

uint64_t sub_1000330F8(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_100033140(a1, a2, a3, a4, &qword_100062A80, (uint64_t (*)(void))&type metadata accessor for URLQueryItem, (uint64_t (*)(void))&type metadata accessor for URLQueryItem, (void (*)(void))&type metadata accessor for URLQueryItem);
}

uint64_t sub_100033140(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void), void (*a8)(void))
{
  if (a3)
  {
    sub_100035320();
    if (v14 != v15)
    {
      sub_10003535C();
      if (v14)
      {
        __break(1u);
        goto LABEL_23;
      }
      sub_100035310();
    }
  }
  else
  {
    uint64_t v13 = a2;
  }
  uint64_t v16 = *(void *)(a4 + 16);
  if (v13 <= v16) {
    uint64_t v17 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v17 = v13;
  }
  if (!v17)
  {
    uint64_t v23 = &_swiftEmptyArrayStorage;
    goto LABEL_18;
  }
  sub_100005280(a5);
  uint64_t v18 = a6(0);
  sub_10000F9A0(v18);
  uint64_t v20 = *(void *)(v19 + 72);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  uint64_t v23 = (void *)swift_allocObject();
  size_t v24 = j__malloc_size(v23);
  if (!v20 || (v24 - v22 == 0x8000000000000000 ? (BOOL v25 = v20 == -1) : (BOOL v25 = 0), v25))
  {
LABEL_23:
    sub_100012F34();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v23[2] = v16;
  v23[3] = 2 * ((uint64_t)(v24 - v22) / v20);
LABEL_18:
  uint64_t v26 = *(void *)(a6(0) - 8);
  unint64_t v27 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  unint64_t v28 = (unint64_t)v23 + v27;
  if (a1)
  {
    sub_1000340F4(a4 + v27, v16, v28, a8);
    sub_100035330();
  }
  else
  {
    sub_100033B64(0, v16, v28, a4, a7);
  }
  return (uint64_t)v23;
}

void sub_100033334(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

uint64_t sub_100033368(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_100033140(a1, a2, a3, a4, &qword_1000634F0, (uint64_t (*)(void))&type metadata accessor for NotificationSubscription.Location, (uint64_t (*)(void))&type metadata accessor for NotificationSubscription.Location, (void (*)(void))&type metadata accessor for NotificationSubscription.Location);
}

uint64_t sub_1000333B0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_100035320();
    if (v7 != v8)
    {
      sub_10003535C();
      if (v7)
      {
        __break(1u);
        goto LABEL_23;
      }
      sub_100035310();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (!v10)
  {
    uint64_t v16 = _swiftEmptyArrayStorage;
    goto LABEL_18;
  }
  sub_100005280(&qword_1000634F8);
  uint64_t v11 = sub_100005280(&qword_100062E98);
  sub_10000F9A0(v11);
  uint64_t v13 = *(void *)(v12 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v13 || (v17 - v15 == 0x8000000000000000 ? (BOOL v18 = v13 == -1) : (BOOL v18 = 0), v18))
  {
LABEL_23:
    sub_100012F34();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  long long v16[2] = v9;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v13);
LABEL_18:
  uint64_t v19 = *(void *)(sub_100005280(&qword_100062E98) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v16 + v20;
  if (a1)
  {
    sub_100033F18(a4 + v20, v9, v21);
    sub_100035330();
  }
  else
  {
    sub_100033A00(0, v9, v21, a4);
  }
  return (uint64_t)v16;
}

uint64_t sub_10003358C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_100033140(a1, a2, a3, a4, &qword_100062A78, (uint64_t (*)(void))&type metadata accessor for WeatherAlert, (uint64_t (*)(void))&type metadata accessor for WeatherAlert, (void (*)(void))&type metadata accessor for WeatherAlert);
}

void sub_1000335D4(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_100033608(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  if (a3)
  {
    sub_100035320();
    if (v12 != v13)
    {
      sub_10003535C();
      if (v12)
      {
        __break(1u);
        return;
      }
      sub_100035310();
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v11 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v11;
  }
  if (v15)
  {
    sub_100005280(a5);
    uint64_t v16 = (void *)swift_allocObject();
    size_t v17 = j__malloc_size(v16);
    long long v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 16);
  }
  else
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
  }
  BOOL v18 = v16 + 4;
  if (a1)
  {
    a7(a4 + 32, v14, v18);
    sub_100035330();
  }
  else
  {
    a6(0, v14, v18, a4);
  }
}

uint64_t sub_1000336F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      sub_100005280(&qword_1000634B8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100033808(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100033908(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100033A00(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_100005280(&qword_100062E98) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100033B64(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  sub_100012F34();
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100033CB0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_100033DA8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_100033E40(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_100012F34();
    uint64_t result = (char *)sub_100035290();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)sub_1000352B4(a3, result);
  }
  return result;
}

char *sub_100033EA4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_100012F34();
    uint64_t result = (char *)sub_100035290();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_1000352B4(a3, result);
  }
  return result;
}

uint64_t sub_100033F00(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000340F4(a1, a2, a3, (void (*)(void))&type metadata accessor for URLQueryItem);
}

uint64_t sub_100033F18(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v7 = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return _swift_arrayInitWithTakeBackToFront(v7);
  }
  if (a3 < a1
    || (uint64_t result = sub_100005280(&qword_100062E98), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    sub_100005280(&qword_100062E98);
    return _swift_arrayInitWithTakeFrontToBack(a3);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = a3;
    return _swift_arrayInitWithTakeBackToFront(v7);
  }
  return result;
}

char *sub_100034050(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_100012F34();
    uint64_t result = (char *)sub_100035290();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)sub_1000352B4(a3, result);
  }
  return result;
}

uint64_t sub_1000340AC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000340F4(a1, a2, a3, (void (*)(void))&type metadata accessor for WeatherAlert);
}

uint64_t sub_1000340C4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000340F4(a1, a2, a3, (void (*)(void))&type metadata accessor for SevereNotificationEntity);
}

uint64_t sub_1000340DC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000340F4(a1, a2, a3, (void (*)(void))type metadata accessor for CloudChannelSubscription);
}

uint64_t sub_1000340F4(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    sub_100012F34();
    uint64_t v9 = sub_100035290();
    __break(1u);
    return _swift_arrayInitWithTakeBackToFront(v9);
  }
  if (a3 < a1
    || (uint64_t result = ((uint64_t (*)(void))a4)(0), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    uint64_t v10 = sub_100035348();
    return _swift_arrayInitWithTakeFrontToBack(v10);
  }
  else if (a3 != a1)
  {
    uint64_t v9 = sub_100035348();
    return _swift_arrayInitWithTakeBackToFront(v9);
  }
  return result;
}

void sub_1000341F8(uint64_t a1, uint64_t a2)
{
  UnfairLock.lock()();
  uint64_t v4 = (uint64_t *)(a2 + OBJC_IVAR____TtC8weatherd20APSConnectionManager_observers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  sub_100032EE8();
  uint64_t v5 = *(void *)(*v4 + 16);
  sub_100032F64(v5);
  uint64_t v6 = *v4;
  *(void *)(v6 + 16) = v5 + 1;
  uint64_t v7 = v6 + 16 * v5;
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = &off_10005E7B0;
  swift_endAccess();
  UnfairLock.unlock()();
}

void sub_1000342A8(uint64_t a1, uint64_t a2)
{
  UnfairLock.lock()();
  uint64_t v4 = (uint64_t *)(a2 + OBJC_IVAR____TtC8weatherd20APSConnectionManager_observers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  sub_100032EE8();
  uint64_t v5 = *(void *)(*v4 + 16);
  sub_100032F64(v5);
  uint64_t v6 = *v4;
  *(void *)(v6 + 16) = v5 + 1;
  uint64_t v7 = v6 + 16 * v5;
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = &off_10005F310;
  swift_endAccess();
  UnfairLock.unlock()();
}

uint64_t sub_100034358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v35 = a8;
  uint64_t v36 = a7;
  uint64_t v37 = a6;
  uint64_t v46 = a12;
  uint64_t v45 = a11;
  uint64_t v44 = a10;
  uint64_t v47 = a9;
  uint64_t v40 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v43 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v39 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for DispatchQoS();
  uint64_t v41 = *(void *)(v22 - 8);
  uint64_t v42 = v22;
  __chkstk_darwin(v22);
  uint64_t v38 = (char *)&v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54[3] = type metadata accessor for APSConnectionManager();
  v54[4] = &off_10005F7F0;
  v54[0] = a1;
  v53[3] = type metadata accessor for CloudChannelManager();
  v53[4] = &off_10005F0E0;
  v53[0] = a2;
  v52[3] = type metadata accessor for SevereWeatherEventDataProvider();
  v52[4] = &off_10005F2D8;
  v52[0] = a3;
  v51[3] = type metadata accessor for SevereNotificationContentFactory();
  v51[4] = &off_10005E7A0;
  v51[0] = a4;
  v50[3] = type metadata accessor for SevereNotificationScheduler();
  v50[4] = &off_10005ECD8;
  v50[0] = a5;
  sub_100027A84(0, &qword_100062FC8);
  *(void *)(a13 + 400) = static NSOperationQueue.notifications.getter();
  *(unsigned char *)(a13 + 416) = 0;
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  static OS_dispatch_queue.notifications.getter();
  type metadata accessor for Debouncer();
  swift_allocObject();
  *(void *)(a13 + 424) = Debouncer.init(interval:queue:)();
  sub_100008A6C((uint64_t)v54, a13 + 16);
  sub_100008A6C((uint64_t)v53, a13 + 56);
  sub_100008A6C((uint64_t)v52, a13 + 96);
  sub_100008A6C((uint64_t)v51, a13 + 136);
  sub_100008A6C((uint64_t)v50, a13 + 176);
  sub_100008A6C(a6, a13 + 216);
  sub_100008A6C(a7, a13 + 256);
  sub_100008A6C(a8, a13 + 296);
  sub_100008A6C(v47, a13 + 336);
  uint64_t v24 = v45;
  *(void *)(a13 + 376) = v44;
  *(void *)(a13 + 384) = v24;
  *(void *)(a13 + 392) = v46;
  id v25 = objc_allocWithZone((Class)NSOperationQueue);
  swift_retain();
  swift_retain();
  swift_retain();
  id v26 = [v25 init];
  *(void *)(a13 + 408) = v26;
  [v26 setMaxConcurrentOperationCount:1];
  id v27 = v26;
  unint64_t v28 = (void *)static OS_dispatch_queue.notifications.getter();
  [v27 setUnderlyingQueue:v28];

  long long v29 = (void *)static OS_dispatch_queue.notifications.getter();
  v49[4] = sub_100035224;
  v49[5] = a13;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 1107296256;
  v49[2] = sub_1000308F0;
  v49[3] = &unk_10005F030;
  uint64_t v30 = _Block_copy(v49);
  swift_retain();
  uint64_t v31 = v38;
  static DispatchQoS.unspecified.getter();
  uint64_t v48 = _swiftEmptyArrayStorage;
  sub_100035244(&qword_100062F80, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005280((uint64_t *)&unk_100064000);
  sub_10002E1FC(&qword_100062F88, (uint64_t *)&unk_100064000);
  uint64_t v33 = v39;
  uint64_t v32 = v40;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v30);
  swift_release();
  swift_release();
  swift_release();

  sub_100008AD0(v47);
  sub_100008AD0(v35);
  sub_100008AD0(v36);
  sub_100008AD0(v37);
  sub_100008AD0((uint64_t)v50);
  sub_100008AD0((uint64_t)v51);
  sub_100008AD0((uint64_t)v52);
  sub_100008AD0((uint64_t)v53);
  sub_100008AD0((uint64_t)v54);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v33, v32);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v31, v42);
  swift_release();
  return a13;
}

char *sub_1000348A4(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v19 = a1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = type metadata accessor for MachService();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  void v22[3] = type metadata accessor for SevereNotificationsManager();
  v22[4] = &off_10005E7C8;
  v22[0] = a2;
  uint64_t v11 = OBJC_IVAR____TtC8weatherd20NotificationsManager_listener;
  sub_100027A84(0, (unint64_t *)&qword_100062540);
  unint64_t v12 = a4;
  static MachServices.Notifications.getter();
  MachService.name.getter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *(void *)&a4[v11] = sub_1000051D4();
  uint64_t v13 = v19;
  sub_100008A6C(v19, (uint64_t)&v12[OBJC_IVAR____TtC8weatherd20NotificationsManager_precipitationNotificationsManager]);
  sub_100008A6C((uint64_t)v22, (uint64_t)&v12[OBJC_IVAR____TtC8weatherd20NotificationsManager_severeNotificationsManager]);
  *(void *)&v12[OBJC_IVAR____TtC8weatherd20NotificationsManager_lazyNotificationsEnablementTracker] = a3;
  swift_retain();

  v21.receiver = v12;
  v21.super_class = ObjectType;
  uint64_t v14 = (char *)objc_msgSendSuper2(&v21, "init");
  uint64_t v15 = *(void **)&v14[OBJC_IVAR____TtC8weatherd20NotificationsManager_listener];
  uint64_t v16 = v14;
  [v15 setDelegate:v16];
  [v15 resume];
  swift_release();

  sub_100008AD0((uint64_t)v22);
  sub_100008AD0(v13);
  return v16;
}

char *sub_100034AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = type metadata accessor for SevereNotificationsManager();
  uint64_t v16 = &off_10005E7C8;
  v14[0] = a2;
  uint64_t v6 = (char *)objc_allocWithZone((Class)type metadata accessor for NotificationsManager());
  uint64_t v7 = sub_100032E98((uint64_t)v14, v15);
  __chkstk_darwin(v7);
  uint64_t v9 = (void *)((char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = sub_1000348A4(a1, *v9, a3, v6);
  sub_100008AD0((uint64_t)v14);
  return v11;
}

uint64_t sub_100034BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11)
{
  uint64_t v42 = a8;
  uint64_t v41 = a7;
  long long v40 = a9;
  uint64_t v56 = type metadata accessor for APSConnectionManager();
  uint64_t v57 = &off_10005F7F0;
  v55[0] = a1;
  uint64_t v53 = type metadata accessor for CloudChannelManager();
  uint64_t v54 = &off_10005F0E0;
  v52[0] = a2;
  uint64_t v50 = type metadata accessor for SevereWeatherEventDataProvider();
  uint64_t v51 = &off_10005F2D8;
  v49[0] = a3;
  uint64_t v47 = type metadata accessor for SevereNotificationContentFactory();
  uint64_t v48 = &off_10005E7A0;
  v46[0] = a4;
  uint64_t v45 = &off_10005ECD8;
  uint64_t v44 = type metadata accessor for SevereNotificationScheduler();
  v43[0] = a5;
  type metadata accessor for SevereNotificationsManager();
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = sub_100032E98((uint64_t)v55, v56);
  __chkstk_darwin(v18);
  unint64_t v20 = (uint64_t *)((char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  uint64_t v22 = sub_100032E98((uint64_t)v52, v53);
  __chkstk_darwin(v22);
  uint64_t v24 = (uint64_t *)((char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v25 + 16))(v24);
  uint64_t v26 = sub_100032E98((uint64_t)v49, v50);
  __chkstk_darwin(v26);
  unint64_t v28 = (uint64_t *)((char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v29 + 16))(v28);
  uint64_t v30 = sub_100032E98((uint64_t)v46, v47);
  __chkstk_darwin(v30);
  uint64_t v32 = (uint64_t *)((char *)&v40 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v33 + 16))(v32);
  uint64_t v34 = sub_100032E98((uint64_t)v43, v44);
  __chkstk_darwin(v34);
  uint64_t v36 = (uint64_t *)((char *)&v40 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v37 + 16))(v36);
  uint64_t v38 = sub_100034358(*v20, *v24, *v28, *v32, *v36, a6, v41, v42, v40, *((uint64_t *)&v40 + 1), a10, a11, v17);
  sub_100008AD0((uint64_t)v43);
  sub_100008AD0((uint64_t)v46);
  sub_100008AD0((uint64_t)v49);
  sub_100008AD0((uint64_t)v52);
  sub_100008AD0((uint64_t)v55);
  return v38;
}

void *sub_100035068(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v10 = type metadata accessor for APSConnectionManager();
  uint64_t v11 = &off_10005F7F0;
  *(void *)&long long v9 = a2;
  sub_100027A84(0, &qword_100062FC8);
  a4[9] = static NSOperationQueue.cloudChannels.getter();
  a4[2] = a1;
  sub_100008E88(&v9, (uint64_t)(a4 + 3));
  a4[8] = a3;
  return a4;
}

void *sub_1000350F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = type metadata accessor for APSConnectionManager();
  uint64_t v16 = &off_10005F7F0;
  v14[0] = a2;
  type metadata accessor for CloudChannelManager();
  uint64_t v6 = (void *)swift_allocObject();
  uint64_t v7 = sub_100032E98((uint64_t)v14, v15);
  __chkstk_darwin(v7);
  long long v9 = (void *)((char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = sub_100035068(a1, *v9, a3, v6);
  sub_100008AD0((uint64_t)v14);
  return v11;
}

uint64_t sub_100035224()
{
  return sub_1000171D8();
}

uint64_t sub_10003522C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003523C()
{
  return swift_release();
}

uint64_t sub_100035244(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100035290()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

void *sub_1000352B4@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t sub_1000352D0()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_1000352F0()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_100035330()
{
  *(void *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_100035348()
{
  return v0;
}

uint64_t sub_100035368()
{
  uint64_t v7 = Location.id.getter();
  v1._countAndFlagsBits = 58;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  size_t v2 = (uint64_t *)(v0 + *(int *)(type metadata accessor for CloudChannelSubscription() + 20));
  if (v2[1])
  {
    uint64_t v3 = *v2;
    uint64_t v4 = (void *)v2[1];
  }
  else
  {
    uint64_t v4 = (void *)0xE400000000000000;
    uint64_t v3 = 1701736270;
  }
  swift_bridgeObjectRetain();
  v5._countAndFlagsBits = v3;
  v5._object = v4;
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t type metadata accessor for CloudChannelSubscription()
{
  uint64_t result = qword_100063560;
  if (!qword_100063560) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_10003544C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Location();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    long long v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *long long v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100035524(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Location();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003559C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Location();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  long long v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100035624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Location();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  long long v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000356C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Location();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10003573C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Location();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  long long v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000357C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000357DC);
}

uint64_t sub_1000357DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for Location();
  sub_10002F8EC();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return sub_1000093BC(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100035878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003588C);
}

void sub_10003588C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for Location();
  sub_10002F8EC();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    sub_100008CEC(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
}

uint64_t sub_100035918()
{
  uint64_t result = type metadata accessor for Location();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_1000359AC(uint64_t a1)
{
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v1 + 32);
  sub_100027354(a1, v3);
}

BOOL sub_100035A34(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    return 0;
  }
  BOOL v5 = a1[2] == a2[2] && a1[3] == a2[3];
  if (!v5 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = a1[4];
  uint64_t v7 = a2[4];
  return sub_100023EE8(v6, v7);
}

Swift::Int sub_100035AC4()
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  sub_100035E88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_100035E88();
  swift_bridgeObjectRelease();
  sub_100027354((uint64_t)v2, *(void *)(v0 + 32));
  return Hasher._finalize()();
}

Swift::Int sub_100035B48()
{
  uint64_t v1 = *(void *)(v0 + 32);
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  sub_100035E88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  sub_100027354((uint64_t)v3, v1);
  return Hasher._finalize()();
}

uint64_t initializeBufferWithCopyOfBuffer for SevereMessageEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SevereMessageEvent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SevereMessageEvent(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SevereMessageEvent(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for SevereMessageEvent(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SevereMessageEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SevereMessageEvent(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SevereMessageEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SevereMessageEvent()
{
  return &type metadata for SevereMessageEvent;
}

unint64_t sub_100035E3C()
{
  unint64_t result = qword_100063598;
  if (!qword_100063598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063598);
  }
  return result;
}

uint64_t sub_100035E88()
{
  return String.hash(into:)();
}

void *sub_100035EA4(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for CloudChannelSubscription();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    uint64_t v19 = _swiftEmptyArrayStorage;
    sub_10001216C(0, v10, 0);
    uint64_t v11 = v19;
    unint64_t v18 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v12 = a1 + v18;
    uint64_t v13 = *(void *)(v7 + 72);
    while (1)
    {
      sub_100038308(v12, a2, (uint64_t)v9);
      if (v3) {
        break;
      }
      uint64_t v3 = 0;
      uint64_t v19 = v11;
      unint64_t v15 = v11[2];
      unint64_t v14 = v11[3];
      if (v15 >= v14 >> 1)
      {
        sub_10001216C(v14 > 1, v15 + 1, 1);
        uint64_t v11 = v19;
      }
      v11[2] = v15 + 1;
      sub_100038914((uint64_t)v9, (uint64_t)v11 + v18 + v15 * v13);
      v12 += v13;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        return v11;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  return v11;
}

uint64_t sub_10003605C()
{
  uint64_t v0 = type metadata accessor for Location();
  uint64_t v43 = *(void *)(v0 - 8);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v38 = v2;
  uint64_t v39 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v41 = (char *)&v34 - v3;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v36 = *(void *)(v4 - 8);
  uint64_t v37 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for NotificationSubscription.Location();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v34 - v12;
  NotificationSubscription.location.getter();
  static Logger.notifications.getter();
  unint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  long long v40 = v13;
  uint64_t v44 = v7;
  v14(v11, v13, v7);
  unint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v35 = v0;
    v46[0] = v18;
    *(_DWORD *)uint64_t v17 = 141558275;
    *(void *)&v45[0] = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v17 + 12) = 2081;
    uint64_t v19 = NotificationSubscription.Location.id.getter();
    *(void *)&v45[0] = sub_1000466F4(v19, v20, v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v8 + 8);
    v21(v11, v44);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Enqueuing request for cloud channel for location: %{private,mask.hash}s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    uint64_t v0 = v35;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v21 = *(void (**)(char *, uint64_t))(v8 + 8);
    v21(v11, v44);
  }

  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v37);
  uint64_t v22 = v42;
  ReferenceCountedLazy.increase()();
  uint64_t v24 = v40;
  uint64_t v23 = v41;
  NotificationSubscription.Location.locationOverride.getter();
  sub_100008A6C((uint64_t)v46, (uint64_t)v45);
  uint64_t v25 = v43;
  uint64_t v26 = v39;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v39, v23, v0);
  unint64_t v27 = (*(unsigned __int8 *)(v25 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v22;
  sub_100008E88(v45, v28 + 24);
  (*(void (**)(unint64_t, char *, uint64_t))(v25 + 32))(v28 + v27, v26, v0);
  id v29 = objc_allocWithZone((Class)sub_100005280(&qword_100063678));
  swift_retain();
  uint64_t v30 = (void *)AsyncBlockOperation.init(_:)();
  sub_100005280(&qword_100063658);
  id v31 = v30;
  uint64_t v32 = Promise.__allocating_init(_:scheduleOn:)();

  (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v0);
  sub_100008AD0((uint64_t)v46);
  v21(v24, v44);
  return v32;
}

uint64_t sub_100036560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a3;
  uint64_t v22 = a1;
  uint64_t v5 = type metadata accessor for Location();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  sub_100007450();
  uint64_t v8 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_100008A6C(a2, (uint64_t)v23);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v19((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v5);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v18 = v9 | 7;
  uint64_t v10 = swift_allocObject();
  sub_100008E88(v23, v10 + 16);
  uint64_t v17 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 32);
  v17(v10 + ((v9 + 56) & ~v9), (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  sub_100005280(&qword_100062608);
  uint64_t v21 = type metadata accessor for CloudChannelManager();
  firstly<A, B>(on:disposeOn:closure:)();

  swift_release();
  uint64_t v11 = (void *)static OS_dispatch_queue.notifications.getter();
  v19((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v20, v5);
  uint64_t v12 = swift_allocObject();
  v17(v12 + ((v9 + 16) & ~v9), (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  type metadata accessor for CloudChannelSubscription();
  Promise.then<A>(on:closure:)();
  swift_release();

  swift_release();
  uint64_t v13 = (void *)zalgo.getter();
  uint64_t v14 = Promise.always<A>(on:disposeOn:closure:)();
  swift_release();

  return v14;
}

uint64_t sub_1000367F8(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_100006E98(a3);
}

uint64_t sub_100036840@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = type metadata accessor for Location();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a3, a2, v7);
  uint64_t v8 = (void *)(a3 + *(int *)(type metadata accessor for CloudChannelSubscription() + 20));
  *uint64_t v8 = v6;
  v8[1] = v5;
  return swift_bridgeObjectRetain();
}

void sub_1000368D8()
{
}

uint64_t sub_1000368FC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v26 = v4;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v25 = v6;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v28 = v23;
    *(_DWORD *)uint64_t v12 = 136446210;
    v22[1] = v12 + 4;
    uint64_t v13 = swift_bridgeObjectRetain();
    sub_100036C60(v13);
    uint64_t v24 = v5;
    uint64_t v14 = Set.description.getter();
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_1000466F4(v14, v16, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Expecting to subscribe to channels: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v24);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_100007450();
  uint64_t v17 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_100005280(&qword_100064030);
  firstly<A, B>(on:disposeOn:closure:)();

  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  *(void *)(v18 + 24) = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v19 = (void *)zalgo.getter();
  sub_100005280(&qword_100062618);
  uint64_t v20 = Promise.then<A>(on:closure:)();
  swift_release();
  swift_release();

  return v20;
}

uint64_t sub_100036C60(uint64_t a1)
{
  uint64_t v2 = Set.init(minimumCapacity:)();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1000258E8(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_100036D14(uint64_t a1)
{
  return sub_100048260();
}

uint64_t sub_100036D50(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v35 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)*a1;
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v33 = a3;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v37 = v31;
    uint64_t v34 = a2;
    uint64_t v30 = v14;
    *(_DWORD *)uint64_t v14 = 136446210;
    id v29 = v14 + 4;
    swift_bridgeObjectRetain();
    uint64_t v15 = Array.description.getter();
    uint64_t v32 = v8;
    uint64_t v16 = v15;
    unint64_t v18 = v17;
    a3 = v33;
    swift_bridgeObjectRelease();
    uint64_t v19 = v16;
    uint64_t v4 = v3;
    uint64_t v36 = sub_1000466F4(v19, v18, &v37);
    a2 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Currently subscribed to channels: %{public}s", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v32);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v8);
  }
  uint64_t v20 = swift_bridgeObjectRetain();
  uint64_t v21 = sub_100036C60(v20);
  if (v11) {
    uint64_t v22 = v11;
  }
  else {
    uint64_t v22 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_100038A38((uint64_t)v22, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_100036C60((uint64_t)v22);
  uint64_t v25 = sub_100038A38(a2, v24);
  if (v23[2])
  {
    sub_100005370((void *)(a3 + 24), *(void *)(a3 + 48));
    uint64_t v26 = sub_1000386D0((uint64_t)v23);
    swift_release();
    sub_100047ADC((uint64_t)v26);
    if (v4)
    {
      swift_release();
      return swift_release();
    }
  }
  swift_release();
  if (!v25[2])
  {
    swift_release();
    goto LABEL_14;
  }
  sub_100005370((void *)(a3 + 24), *(void *)(a3 + 48));
  uint64_t v28 = sub_1000386D0((uint64_t)v25);
  swift_release();
  sub_100047F3C((uint64_t)v28);
  uint64_t result = swift_release();
  if (!v4)
  {
LABEL_14:
    uint64_t v37 = a2;
    sub_100005280(&qword_100062690);
    swift_allocObject();
    swift_bridgeObjectRetain();
    return Promise.init(value:)();
  }
  return result;
}

void *sub_10003712C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  type metadata accessor for __ContiguousArrayStorageBase();
  swift_unknownObjectRetain_n();
  uint64_t v10 = (void *)swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  uint64_t v11 = v10[2];
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v11 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    sub_1000387B4(a1, a2, a3, a4);
    uint64_t v9 = v8;
    goto LABEL_9;
  }
  uint64_t v9 = (void *)swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = _swiftEmptyArrayStorage;
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_100037214()
{
  swift_release();
  sub_100008AD0(v0 + 24);
  swift_release();

  return v0;
}

uint64_t sub_10003724C()
{
  sub_100037214();
  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for CloudChannelManager()
{
  return self;
}

uint64_t sub_1000372A4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v65 = type metadata accessor for NotificationSubscription.Location();
  sub_1000053F4();
  uint64_t v62 = v5;
  __chkstk_darwin(v6);
  sub_10000F9B8();
  uint64_t v64 = v8 - v7;
  uint64_t v63 = type metadata accessor for NotificationSubscription();
  sub_1000053F4();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_10000F9B8();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_10000F9B8();
  uint64_t v21 = v20 - v19;
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v22 = Logger.logObject.getter();
  int v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, (os_log_type_t)v23))
  {
    os_log_t v56 = v22;
    uint64_t v57 = v21;
    uint64_t v58 = v17;
    uint64_t v59 = v15;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v54 = v25;
    *(_DWORD *)uint64_t v24 = 141558275;
    uint64_t v66 = 1752392040;
    v67[0] = v25;
    uint64_t v53 = v67;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    os_log_t v55 = (uint8_t *)v24;
    *(_WORD *)(v24 + 12) = 2081;
    int64_t v26 = *(void *)(a1 + 16);
    uint64_t v27 = _swiftEmptyArrayStorage;
    if (v26)
    {
      HIDWORD(v49) = v23;
      uint64_t v51 = v4;
      uint64_t v52 = v2;
      uint64_t v66 = (uint64_t)_swiftEmptyArrayStorage;
      sub_100011F8C(0, v26, 0);
      id v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
      uint64_t v28 = v10 + 16;
      uint64_t v30 = *(unsigned __int8 *)(v28 + 64);
      uint64_t v50 = a1;
      uint64_t v31 = a1 + ((v30 + 32) & ~v30);
      uint64_t v60 = *(void *)(v28 + 56);
      unint64_t v61 = v29;
      uint64_t v32 = (void (**)(uint64_t, uint64_t))(v62 + 8);
      uint64_t v62 = v28;
      uint64_t v33 = (void (**)(uint64_t, uint64_t))(v28 - 8);
      do
      {
        v61(v14, v31, v63);
        NotificationSubscription.location.getter();
        uint64_t v34 = NotificationSubscription.Location.id.getter();
        uint64_t v36 = v35;
        (*v32)(v64, v65);
        (*v33)(v14, v63);
        uint64_t v27 = (void *)v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100011F8C(0, *(void *)(v66 + 16) + 1, 1);
          uint64_t v27 = (void *)v66;
        }
        unint64_t v38 = v27[2];
        unint64_t v37 = v27[3];
        if (v38 >= v37 >> 1)
        {
          sub_100011F8C((char *)(v37 > 1), v38 + 1, 1);
          uint64_t v27 = (void *)v66;
        }
        v27[2] = v38 + 1;
        uint64_t v39 = &v27[2 * v38];
        v39[4] = v34;
        v39[5] = v36;
        v31 += v60;
        --v26;
      }
      while (v26);
      a1 = v50;
      LOBYTE(v23) = BYTE4(v49);
    }
    sub_100036C60((uint64_t)v27);
    uint64_t v41 = Set.description.getter();
    unint64_t v43 = v42;
    swift_bridgeObjectRelease();
    uint64_t v66 = sub_1000466F4(v41, v43, v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v56, (os_log_type_t)v23, "Validating channel subscriptions for locations: %{private,mask.hash}s", v55, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v40 = (*(uint64_t (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v40 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v21, v15);
  }
  __chkstk_darwin(v40);
  *(&v49 - 2) = a1;
  sub_100005280(&qword_100062FA0);
  firstly<A>(closure:)();
  sub_100007450();
  uint64_t v44 = (void *)static OS_dispatch_queue.notifications.getter();
  swift_retain();
  sub_100005280(&qword_100063658);
  sub_100008DE0(&qword_100062FA8, &qword_100062FA0);
  Promise<A>.compactMap<A>(on:closure:)();
  swift_release();

  swift_release();
  uint64_t v45 = (void *)zalgo.getter();
  sub_100005280(&qword_100062FB0);
  Promise.then<A>(on:closure:)();
  swift_release();

  uint64_t v46 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v47 = Promise.then<A, B>(on:disposeOn:closure:)();
  swift_release();

  return v47;
}

uint64_t sub_100037898()
{
  return Promise.init(value:)();
}

uint64_t sub_1000378FC()
{
  sub_100005280(&qword_100063658);
  uint64_t v0 = (void *)zalgo.getter();
  sub_100005280(&qword_100063668);
  sub_100008DE0(&qword_100063670, &qword_100063668);
  uint64_t v1 = static Promise.all<A>(on:_:)();

  return v1;
}

uint64_t sub_1000379A8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  sub_100007450();
  uint64_t v4 = (void *)static OS_dispatch_queue.notifications.getter();
  type metadata accessor for NotificationConfiguration();
  swift_retain();
  firstly<A>(on:closure:)();

  swift_release();
  uint64_t v5 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v3;
  *(void *)(v6 + 24) = a2;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100005280(&qword_100062618);
  Promise.then<A>(on:closure:)();
  swift_release();

  swift_release();
  uint64_t v7 = (void *)static OS_dispatch_queue.notifications.getter();
  *(void *)(swift_allocObject() + 16) = v3;
  swift_bridgeObjectRetain();
  sub_100005280(&qword_100062FB0);
  uint64_t v8 = Promise.then<A>(on:closure:)();
  swift_release();

  swift_release();
  return v8;
}

unint64_t sub_100037B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v73 = a3;
  uint64_t v77 = a1;
  uint64_t v76 = type metadata accessor for Logger();
  uint64_t v72 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v5 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = type metadata accessor for CloudChannelSubscription();
  uint64_t v6 = __chkstk_darwin(v78);
  uint64_t v74 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v68 - v9;
  uint64_t v11 = *(void *)(a2 + 16);
  uint64_t v75 = v11;
  uint64_t v71 = v8;
  if (v11)
  {
    uint64_t v69 = v5;
    uint64_t v70 = a2;
    uint64_t v12 = a2 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v13 = *(void *)(v8 + 72);
    swift_bridgeObjectRetain();
    uint64_t v14 = _swiftEmptyArrayStorage;
    do
    {
      sub_100038978(v12, (uint64_t)v10);
      uint64_t v15 = &v10[*(int *)(v78 + 20)];
      uint64_t v16 = *((void *)v15 + 1);
      if (v16)
      {
        uint64_t v17 = *(void *)v15;
        swift_bridgeObjectRetain();
        sub_1000389DC((uint64_t)v10);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100033334(0, v14[2] + 1, 1, (uint64_t)v14);
          uint64_t v14 = v21;
        }
        unint64_t v19 = v14[2];
        unint64_t v18 = v14[3];
        if (v19 >= v18 >> 1)
        {
          sub_100033334(v18 > 1, v19 + 1, 1, (uint64_t)v14);
          uint64_t v14 = v22;
        }
        void v14[2] = v19 + 1;
        uint64_t v20 = &v14[2 * v19];
        v20[4] = v17;
        void v20[5] = v16;
      }
      else
      {
        sub_1000389DC((uint64_t)v10);
      }
      v12 += v13;
      --v11;
    }
    while (v11);
    a2 = v70;
    swift_bridgeObjectRelease();
    uint64_t v5 = v69;
  }
  else
  {
    uint64_t v14 = _swiftEmptyArrayStorage;
  }
  unint64_t result = NotificationConfiguration.channelSubscriptionLimit.getter();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_69;
  }
  uint64_t v24 = result;
  unint64_t v25 = v14[2];
  if (result >= v25)
  {
    uint64_t v30 = sub_1000368FC((uint64_t)v14);
LABEL_67:
    swift_bridgeObjectRelease();
    return v30;
  }
  static Logger.notifications.getter();
  swift_bridgeObjectRetain();
  int64_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = v5;
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 134349312;
    swift_bridgeObjectRelease();
    uint64_t v79 = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 2050;
    uint64_t v79 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Required number of channel subscriptions exceeds threshold: %{public}ld/%{public}ld", (uint8_t *)v29, 0x16u);
    uint64_t v5 = v28;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v72 + 8))(v5, v76);
  uint64_t v31 = v75;
  if (!v75)
  {
    uint64_t v33 = _swiftEmptyArrayStorage;
LABEL_66:
    sub_100038224(v24, (uint64_t)v33);
    uint64_t v61 = v60;
    uint64_t v63 = v62;
    unint64_t v65 = v64;
    uint64_t v66 = swift_unknownObjectRetain();
    unint64_t v67 = sub_10003712C(v66, v61, v63, v65);
    uint64_t v30 = sub_1000368FC((uint64_t)v67);
    swift_unknownObjectRelease();
    goto LABEL_67;
  }
  uint64_t v72 = v24;
  uint64_t v77 = a2 + ((*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80));
  uint64_t v76 = *(void *)(v71 + 72);
  swift_bridgeObjectRetain();
  uint64_t v32 = 0;
  uint64_t v33 = _swiftEmptyArrayStorage;
  uint64_t v34 = (uint64_t)v74;
  while (1)
  {
    sub_100038978(v77 + v76 * v32, v34);
    uint64_t v35 = (uint64_t *)(v34 + *(int *)(v78 + 20));
    uint64_t v36 = v35[1];
    if (v36) {
      break;
    }
LABEL_47:
    ++v32;
    sub_1000389DC(v34);
    if (v32 == v31)
    {
      swift_bridgeObjectRelease();
      uint64_t v24 = v72;
      goto LABEL_66;
    }
  }
  uint64_t v37 = *v35;
  swift_bridgeObjectRetain();
  Location.kind.getter();
  uint64_t v38 = Location.Identifier.Kind.rawValue.getter();
  uint64_t v40 = v39;
  if (v38 == Location.Identifier.Kind.rawValue.getter() && v40 == v41)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v43 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v43 & 1) == 0)
    {
      uint64_t v44 = v33[2];
      if (!v44) {
        goto LABEL_41;
      }
      goto LABEL_34;
    }
  }
  unint64_t v45 = v33[2];
  swift_bridgeObjectRetain();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v45 >= v33[3] >> 1)
  {
    sub_100033334(isUniquelyReferenced_nonNull_native, v45 + 1, 1, (uint64_t)v33);
    uint64_t v33 = v47;
  }
  swift_arrayDestroy();
  uint64_t v48 = v33[2];
  memmove(v33 + 6, v33 + 4, 16 * v48);
  uint64_t v44 = v48 + 1;
  v33[2] = v48 + 1;
  v33[4] = v37;
  v33[5] = v36;
  uint64_t v34 = (uint64_t)v74;
LABEL_34:
  BOOL v49 = v33[4] == v37 && v36 == v33[5];
  if (v49 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
    goto LABEL_39;
  }
  if (v44 == 1) {
    goto LABEL_41;
  }
  BOOL v53 = v33[6] == v37 && v36 == v33[7];
  if (v53 || (unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
  {
LABEL_39:
    swift_bridgeObjectRelease();
LABEL_46:
    uint64_t v31 = v75;
    goto LABEL_47;
  }
  if (v44 == 2)
  {
LABEL_41:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_100033334(0, v44 + 1, 1, (uint64_t)v33);
      uint64_t v33 = v58;
    }
    unint64_t v51 = v33[2];
    unint64_t v50 = v33[3];
    if (v51 >= v50 >> 1)
    {
      sub_100033334(v50 > 1, v51 + 1, 1, (uint64_t)v33);
      uint64_t v33 = v59;
    }
    v33[2] = v51 + 1;
    uint64_t v52 = &v33[2 * v51];
    v52[4] = v37;
    void v52[5] = v36;
    goto LABEL_46;
  }
  uint64_t v54 = v33 + 9;
  uint64_t v55 = 2;
  while (1)
  {
    uint64_t v56 = v55 + 1;
    if (__OFADD__(v55, 1)) {
      break;
    }
    BOOL v57 = *(v54 - 1) == v37 && v36 == *v54;
    if (v57 || (unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
      swift_bridgeObjectRelease();
      uint64_t v34 = (uint64_t)v74;
      goto LABEL_46;
    }
    v54 += 2;
    ++v55;
    if (v56 == v44)
    {
      uint64_t v34 = (uint64_t)v74;
      goto LABEL_41;
    }
  }
LABEL_69:
  __break(1u);
  return result;
}

uint64_t sub_100038224(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v3 = *(void *)(a2 + 16);
  unint64_t result = sub_100039204(0, result, v3);
  if (v4) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = result;
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_9;
  }
  if (v3 >= v5) {
    return a2;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_100038294(void **a1, uint64_t a2)
{
  unint64_t v3 = *a1;
  swift_bridgeObjectRetain();
  sub_100035EA4(a2, v3);
  sub_100005280(&qword_100063660);
  swift_allocObject();
  return Promise.init(value:)();
}

uint64_t sub_100038308@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for CloudChannelSubscription();
  uint64_t v12 = (uint64_t *)(a1 + *(int *)(v11 + 20));
  uint64_t v13 = v12[1];
  if (!v13) {
    return sub_100038978(a1, a3);
  }
  uint64_t v14 = v11;
  uint64_t v34 = v8;
  uint64_t v35 = v3;
  uint64_t v36 = a3;
  uint64_t v15 = *v12;
  uint64_t v16 = a2[2];
  if (!v16) {
    goto LABEL_11;
  }
  BOOL v17 = a2[4] == v15 && v13 == a2[5];
  if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
    return sub_100038978(a1, v36);
  }
  if (v16 == 1) {
    goto LABEL_11;
  }
  if (a2[6] == v15 && v13 == a2[7]) {
    return sub_100038978(a1, v36);
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return sub_100038978(a1, v36);
  }
  if (v16 == 2)
  {
LABEL_11:
    swift_bridgeObjectRetain();
    static Logger.notifications.getter();
    swift_bridgeObjectRetain();
    unint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v38 = v33;
      uint64_t v32 = v21;
      *(_DWORD *)uint64_t v21 = 136315138;
      v31[1] = v21 + 4;
      uint64_t v22 = String.identifier.getter();
      uint64_t v37 = sub_1000466F4(v22, v23, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to subscribe to channel %s due to channel limit", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v7);
    uint64_t v24 = type metadata accessor for Location();
    uint64_t v25 = v36;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v36, a1, v24);
    int64_t v26 = (void *)(v25 + *(int *)(v14 + 20));
    *int64_t v26 = 0;
    v26[1] = 0;
  }
  else
  {
    uint64_t v28 = a2 + 9;
    uint64_t v29 = 2;
    while (!__OFADD__(v29, 1))
    {
      uint64_t v33 = v29 + 1;
      if (*(v28 - 1) == v15 && v13 == *v28) {
        return sub_100038978(a1, v36);
      }
      uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if (result) {
        return sub_100038978(a1, v36);
      }
      v28 += 2;
      ++v29;
      if (v33 == v16) {
        goto LABEL_11;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100038684()
{
  return sub_100037898();
}

uint64_t sub_1000386A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003605C();
  *a1 = result;
  return result;
}

void *sub_1000386D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100005280(&qword_100062A68);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = j__malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_1000392B0((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1000394B0();
  if (v5 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

void sub_1000387B4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      uint64_t v8 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_100005280(&qword_100062A68);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = j__malloc_size(v8);
      long long v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 16);
    }
    if (v4 != a3)
    {
      sub_100011BA8(a2 + 16 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

uint64_t sub_100038874()
{
  return NotificationConfigurationManager.fetchNotificationConfiguration()();
}

unint64_t sub_1000388A4(uint64_t a1)
{
  return sub_100037B50(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000388C0()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000388F8(void **a1)
{
  return sub_100038294(a1, *(void *)(v1 + 16));
}

uint64_t sub_100038914(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CloudChannelSubscription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100038978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CloudChannelSubscription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000389DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CloudChannelSubscription();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t *sub_100038A38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return (unint64_t *)&_swiftEmptySetSingleton;
  }
  uint64_t v26 = a1;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a2 + 56;
    v25[0] = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25[0] + 16 * v5);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      ++v5;
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int v9 = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v11 = v9 & ~v10;
      if ((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
      {
        uint64_t v12 = *(void *)(v2 + 48);
        uint64_t v13 = (void *)(v12 + 16 * v11);
        BOOL v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
          uint64_t v27 = v5;
LABEL_22:
          char v19 = *(unsigned char *)(v2 + 32);
          unint64_t v20 = (unint64_t)((1 << v19) + 63) >> 6;
          size_t v21 = 8 * v20;
          if ((v19 & 0x3Fu) < 0xE
            || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
          {
            __chkstk_darwin(isStackAllocationSafe);
            memcpy((char *)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v21);
            uint64_t v22 = sub_100038D4C((void *)((char *)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0)), v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            unint64_t v23 = (void *)swift_slowAlloc();
            memcpy(v23, (const void *)(v2 + 56), v21);
            uint64_t v22 = sub_100038D4C((unint64_t *)v23, v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
            swift_slowDealloc();
          }
          return v22;
        }
        uint64_t v15 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v15;
          if (((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
            break;
          }
          uint64_t v16 = (void *)(v12 + 16 * v11);
          BOOL v17 = *v16 == v8 && v16[1] == v7;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            uint64_t v27 = v5;
            uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
            goto LABEL_22;
          }
        }
      }
      swift_bridgeObjectRelease();
      if (v5 == v3)
      {
        swift_bridgeObjectRelease();
        return (unint64_t *)v2;
      }
    }
  }
  return (unint64_t *)v2;
}

unint64_t *sub_100038D4C(unint64_t *result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v30 = result;
  uint64_t v31 = v6 - 1;
  uint64_t v8 = *a5;
  unint64_t v7 = a5[1];
  unint64_t v9 = *(void *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    return (unint64_t *)sub_100038F74(v30, a2, v31, a3);
  }
  uint64_t v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9) {
      goto LABEL_30;
    }
    uint64_t v11 = v8 + 16 * v7;
    uint64_t v13 = *(void *)(v11 + 32);
    uint64_t v12 = *(void *)(v11 + 40);
    a5[1] = v7 + 1;
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v14 = Hasher._finalize()();
    uint64_t v15 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    uint64_t v18 = 1 << v16;
    if (((1 << v16) & *(void *)(v32 + 8 * (v16 >> 6))) == 0) {
      goto LABEL_25;
    }
    uint64_t v19 = *(void *)(a3 + 48);
    unint64_t v20 = (void *)(v19 + 16 * v16);
    BOOL v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v24 = ~v15;
      for (unint64_t i = v16 + 1; ; unint64_t i = v26 + 1)
      {
        unint64_t v26 = i & v24;
        if (((*(void *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v19 + 16 * v26);
        BOOL v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
          unint64_t v17 = v26 >> 6;
          uint64_t v18 = 1 << v26;
          goto LABEL_13;
        }
      }
LABEL_25:
      uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
      goto LABEL_26;
    }
    uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
LABEL_13:
    unint64_t v22 = v30[v17];
    v30[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      uint64_t v23 = v31 - 1;
      if (__OFSUB__(v31, 1)) {
        goto LABEL_31;
      }
      --v31;
      if (!v23) {
        return (unint64_t *)&_swiftEmptySetSingleton;
      }
    }
LABEL_26:
    uint64_t v8 = *a5;
    unint64_t v7 = a5[1];
    unint64_t v9 = *(void *)(*a5 + 16);
    if (v7 == v9) {
      goto LABEL_2;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_100038F74(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_35:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_100005280(&qword_100062F18);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_35;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_35;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_35;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << v8[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    BOOL v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    *BOOL v28 = v18;
    v28[1] = v19;
    ++*((void *)v8 + 2);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_38;
    }
    if (!v5) {
      goto LABEL_35;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_35;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_35;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100039204(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2) {
      return 0;
    }
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  BOOL v5 = __OFADD__(result, a2);
  result += a2;
  if (v5) {
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_100039254()
{
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100039294(void *a1)
{
  return sub_100036D50(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000392B0(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  BOOL v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *BOOL v5 = a4;
    v5[1] = v6;
    void v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000394B0()
{
  return swift_release();
}

uint64_t sub_1000394B8()
{
  type metadata accessor for Location();
  sub_1000053F4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 64) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_release();
  sub_100008AD0(v0 + 24);
  uint64_t v8 = sub_100027D34();
  v9(v8);
  return _swift_deallocObject(v0, v6, v7);
}

uint64_t sub_100039554()
{
  uint64_t v1 = type metadata accessor for Location();
  sub_1000090A4(v1);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return sub_100036560(v3, v0 + 24, v4);
}

id sub_10003959C(uint64_t a1)
{
  return [*(id *)(v1 + 72) addOperation:a1];
}

uint64_t sub_1000395B0()
{
  type metadata accessor for Location();
  sub_1000053F4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 56) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  sub_100008AD0(v0 + 16);
  uint64_t v8 = sub_100027D34();
  v9(v8);
  return _swift_deallocObject(v0, v6, v7);
}

uint64_t sub_100039644(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Location();
  sub_1000090A4(v3);
  return sub_1000367F8(a1, (void *)(v1 + 16), v1 + ((*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));
}

uint64_t sub_100039694()
{
  uint64_t v1 = type metadata accessor for Location();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100039724@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for Location();
  sub_1000090A4(v5);
  return sub_100036840(a1, v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)), a2);
}

uint64_t sub_100039780()
{
  uint64_t v0 = type metadata accessor for Scope();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProxyContainer.public.getter();
  type metadata accessor for Client();
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_100063718);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_100063720);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000634E0);
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  type metadata accessor for UploadBatchEventConfig();
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  type metadata accessor for UploadBatchEventProcessor();
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  type metadata accessor for FlushManager();
  sub_1000352F0();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Scope.singleton(_:), v0);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  ProxyContainer.private.getter();
  RegistrationContainer.lazy(block:)();
  return swift_release();
}

void sub_100039A48()
{
  id v0 = [self mainBundle];
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForInfoDictionaryKey:v1];

  if (!v2)
  {
    __break(1u);
    goto LABEL_6;
  }
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100015DE8(v8, v9);
  swift_dynamicCast();
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v0 objectForInfoDictionaryKey:v3];

  if (!v4)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100015DE8(v8, v9);
  swift_dynamicCast();
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [v0 objectForInfoDictionaryKey:v5];

  if (v6)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_100015DE8(v8, v9);
    swift_dynamicCast();
    id v7 = objc_allocWithZone((Class)type metadata accessor for Client());
    Client.init(identifier:name:version:buildNumber:)();

    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_100039CBC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10003B1A8(a1, &qword_1000634D0, (uint64_t (*)(void))&type metadata accessor for LocationAccessDataProvider, (uint64_t (*)(char *))&LocationAccessDataProvider.init(locationManager:), (uint64_t)&protocol witness table for LocationAccessDataProvider, a2);
}

uint64_t sub_100039CF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for NonAppCellularRadioAccessTechnologyProvider();
  swift_allocObject();
  uint64_t result = NonAppCellularRadioAccessTechnologyProvider.init()();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for NonAppCellularRadioAccessTechnologyProvider;
  *a1 = result;
  return result;
}

uint64_t sub_100039D50(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LazyOptions();
  __chkstk_darwin(v2);
  sub_100008A6C(a1, (uint64_t)v5);
  uint64_t v3 = swift_allocObject();
  sub_100008E88(v5, v3 + 16);
  *(void *)&v5[0] = _swiftEmptyArrayStorage;
  sub_10003B2E4(&qword_100063470, (void (*)(uint64_t))&type metadata accessor for LazyOptions);
  sub_100005280(&qword_100063478);
  sub_10002E1FC((unint64_t *)&qword_100063480, &qword_100063478);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_100005280(&qword_1000634E0);
  swift_allocObject();
  return ReferenceCountedLazy.init(options:loadBlock:)();
}

uint64_t sub_100039EC4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063488);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v5 = result;
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000633E8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v16)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  sub_100005370(a1, a1[3]);
  type metadata accessor for SessionManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v6 = result;
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063718);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v14)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063790);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v12)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063720);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v10)
  {
    uint64_t v7 = type metadata accessor for PrecipitationNotificationAccuracyTracker();
    swift_allocObject();
    uint64_t v8 = sub_100009DB0(v5, &v15, v6, &v13, &v11, &v9);
    a2[3] = v7;
    uint64_t result = sub_10003B2E4(&qword_100063798, (void (*)(uint64_t))type metadata accessor for PrecipitationNotificationAccuracyTracker);
    a2[4] = result;
    *a2 = v8;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_10003A0F4()
{
  uint64_t v0 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UploadBatchEventConfig();
  id v4 = (void *)static UploadBatchEventConfig.default.getter();
  URL.init(fileURLWithPath:)();
  uint64_t v5 = UploadBatchEventConfig.with(directory:)();

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

uint64_t sub_10003A1FC(void *a1)
{
  return sub_10003AF80(a1);
}

uint64_t sub_10003A204(void *a1)
{
  sub_100005370(a1, a1[3]);
  type metadata accessor for AppSessionManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  sub_100005370(a1, a1[3]);
  type metadata accessor for Client();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063728);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_100005370(a1, a1[3]);
  type metadata accessor for UploadBatchEventConfig();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    type metadata accessor for FlushManager();
    type metadata accessor for URLSessionUploadClientFactory();
    swift_allocObject();
    URLSessionUploadClientFactory.init()();
    return FlushManager.__allocating_init(appSessionManager:client:endpoint:contentType:config:clientFactory:)();
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10003A380()
{
  uint64_t v0 = type metadata accessor for Scope();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TimestampJitter();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  type metadata accessor for SessionManager();
  RegistrationContainer.register<A>(_:name:factory:)();
  Definition.thenConfigure(_:)();
  swift_release();
  swift_release();
  type metadata accessor for AppSessionManager();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  type metadata accessor for TrackingConsent();
  RegistrationContainer.register<A>(_:name:factory:)();
  Definition.thenConfigure(_:)();
  swift_release();
  swift_release();
  type metadata accessor for LoggingEventProcessor();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  type metadata accessor for UploadBatchEventProcessor();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  type metadata accessor for UploadBatchEventConfig();
  RegistrationContainer.register<A>(_:name:factory:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Scope.singleton(_:), v0);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005280(&qword_100063728);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063730);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063738);
  RegistrationContainer.register<A>(_:name:factory:)();
  return swift_release();
}

uint64_t sub_10003A6F4@<X0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_100051150;
  uint64_t v2 = enum case for TimestampJitter.enabled(_:);
  uint64_t v3 = type metadata accessor for TimestampJitter();
  id v4 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_10003A774(void *a1)
{
  uint64_t v2 = sub_100005280(&qword_100063748);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SessionManager.Options();
  __chkstk_darwin(v5);
  uint64_t v6 = type metadata accessor for SessionManagerConfiguration();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  long long v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005280(&qword_100063750);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1000506E0;
  static SessionManager.Options.gracefulNoSessionEventSubmission.getter();
  static SessionManager.Options.gracefulEventCreation.getter();
  v14[1] = v10;
  sub_10003B2E4(&qword_100063758, (void (*)(uint64_t))&type metadata accessor for SessionManager.Options);
  sub_100005280(&qword_100063760);
  sub_10002E1FC(&qword_100063768, &qword_100063760);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_100005370(a1, a1[3]);
  uint64_t v11 = type metadata accessor for TimestampJitter();
  dispatch thunk of ResolverType.resolve<A>(_:)();
  uint64_t result = sub_1000093BC((uint64_t)v4, 1, v11);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_10003AAC8();
    type metadata accessor for DisabledPrivacyValidationProvider();
    swift_allocObject();
    DisabledPrivacyValidationProvider.init()();
    SessionManagerConfiguration.init(options:flushProcessor:timestampJitter:privacyValidationProvider:)();
    sub_100005370(a1, a1[3]);
    type metadata accessor for AppSessionManager();
    uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
    if (result)
    {
      uint64_t v13 = AppSessionManager.createSessionManager(with:)();
      swift_release();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return v13;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10003AAC8()
{
  uint64_t v0 = type metadata accessor for FlushEvents();
  __chkstk_darwin(v0);
  sub_100005280(&qword_100063770);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000506F0;
  static FlushEvents.didStartSession.getter();
  static FlushEvents.didEndSession.getter();
  static FlushEvents.didLeaveGroup.getter();
  sub_10003B2E4(&qword_100063778, (void (*)(uint64_t))&type metadata accessor for FlushEvents);
  sub_100005280(&qword_100063780);
  sub_10002E1FC(&qword_100063788, &qword_100063780);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  type metadata accessor for FlushProcessor();
  swift_allocObject();
  return FlushProcessor.init(flushEvents:flushInterval:)();
}

uint64_t sub_10003AC80(uint64_t a1, void *a2)
{
  SessionManager.processorManager.getter();
  sub_100005370(a2, a2[3]);
  type metadata accessor for LoggingEventProcessor();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  ProcessorManager.add(eventProcessor:)();
  swift_release();
  swift_release();
  SessionManager.processorManager.getter();
  sub_100005370(a2, a2[3]);
  type metadata accessor for UploadBatchEventProcessor();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  ProcessorManager.add(eventProcessor:)();
  swift_release();
  return swift_release();
}

uint64_t sub_10003AD88(void *a1)
{
  sub_100005370(a1, a1[3]);
  type metadata accessor for TrackingConsent();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    type metadata accessor for AccessQueue();
    static AccessQueue.background.getter();
    type metadata accessor for CrashDetector();
    static CrashDetector.shared.getter();
    type metadata accessor for AppSessionManager();
    swift_allocObject();
    return AppSessionManager.init(accessQueue:trackingConsent:crashDetector:)();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003AE44()
{
  return static TrackingConsent.shared.getter();
}

void sub_10003AE70()
{
}

uint64_t sub_10003AE94()
{
  uint64_t v0 = type metadata accessor for LoggingEventProcessorFormat();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (uint64_t *)((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for LoggingEventProcessor();
  void *v3 = 11;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v3, enum case for LoggingEventProcessorFormat.json(_:), v0);
  return LoggingEventProcessor.__allocating_init(logFormat:)();
}

uint64_t sub_10003AF78(void *a1)
{
  return sub_10003AF80(a1);
}

uint64_t sub_10003AF80(void *a1)
{
  sub_100005370(a1, a1[3]);
  type metadata accessor for Client();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063728);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_100005370(a1, a1[3]);
  type metadata accessor for UploadBatchEventConfig();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    type metadata accessor for UploadBatchEventProcessor();
    return UploadBatchEventProcessor.__allocating_init(client:endpoint:contentType:config:)();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_10003B088()
{
  return static UploadBatchEventConfig.default.getter();
}

uint64_t sub_10003B0B4(void *a1)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000634D8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v2 = result;
    type metadata accessor for AnalyticsEndpoint();
    uint64_t result = swift_allocObject();
    *(unsigned char *)(result + 16) = 7;
    *(void *)(result + 24) = v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003B130@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10003B1A8(a1, &qword_100063740, (uint64_t (*)(void))&type metadata accessor for PrivacySaltProvider, (uint64_t (*)(char *))&PrivacySaltProvider.init(identityService:), (uint64_t)&protocol witness table for PrivacySaltProvider, a2);
}

uint64_t sub_10003B16C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10003B1A8(a1, &qword_100063730, (uint64_t (*)(void))&type metadata accessor for PrivacySampler, (uint64_t (*)(char *))&PrivacySampler.init(saltProvider:), (uint64_t)&protocol witness table for PrivacySampler, a2);
}

uint64_t sub_10003B1A8@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t (*a4)(char *)@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(a2);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v14)
  {
    uint64_t v12 = a3(0);
    swift_allocObject();
    uint64_t result = a4(v13);
    a6[3] = v12;
    a6[4] = a5;
    *a6 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for AnalyticsAssembly()
{
  return self;
}

uint64_t sub_10003B28C()
{
  return sub_100039780();
}

uint64_t sub_10003B2A4()
{
  sub_100008AD0(v0 + 16);
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10003B2DC@<X0>(void *a1@<X8>)
{
  return sub_100039EC4((void *)(v1 + 16), a1);
}

uint64_t sub_10003B2E4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10003B32C()
{
  ReferenceCountedLazy.increase()();
  sub_100005370(v0, v0[3]);
  dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
  sub_100008AD0((uint64_t)v0);
  ReferenceCountedLazy.decrease()();
}

uint64_t sub_10003B3A8()
{
  return ReferenceCountedLazy.value(_:)();
}

uint64_t sub_10003B3E0(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_100005370(a1, v7);
  return a4(a2, a3, v7, v8);
}

uint64_t sub_10003B444()
{
  ReferenceCountedLazy.increase()();
  sub_100005370(v3, v3[3]);
  dispatch thunk of AppConfigurationManagerType.fetchAppConfig(cachePolicy:)();
  uint64_t v0 = (void *)zalgo.getter();
  uint64_t v1 = Promise.always<A>(on:disposeOn:closure:)();
  swift_release();

  sub_100008AD0((uint64_t)v3);
  return v1;
}

uint64_t sub_10003B524()
{
  swift_release();
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for ReferenceCountedLazyAppConfigurationManager()
{
  return self;
}

void sub_10003B580()
{
}

uint64_t sub_10003B5A4()
{
  return sub_10003B444();
}

uint64_t sub_10003B5C8()
{
  return sub_10003B3A8();
}

uint64_t sub_10003B600()
{
  return sub_10003B3A8();
}

uint64_t sub_10003B638(void *a1)
{
  return sub_10003B3E0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))&dispatch thunk of AppConfigurationManagerType.removeObserver(_:));
}

uint64_t sub_10003B668(void *a1)
{
  return sub_10003B3E0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))&dispatch thunk of AppConfigurationManagerType.addObserver(_:));
}

uint64_t sub_10003B698()
{
  uint64_t v0 = type metadata accessor for Scope();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  sub_10003E29C();
  ProxyContainer.public.getter();
  sub_10003E290();
  type metadata accessor for Daemon();
  sub_1000352F0();
  sub_10003E260();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 104);
  uint64_t v3 = sub_10003E234();
  v2(v3);
  sub_10003E278();
  swift_release();
  swift_release();
  id v4 = *(void (**)(uint64_t))(v1 + 8);
  uint64_t v5 = sub_10003E24C();
  v4(v5);
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000638D8);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000638E0);
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000634C8);
  sub_1000352D0();
  sub_10003E260();
  Definition.thenConfigure(_:)();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000638E8);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000638F0);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000638F8);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_10003E290();
  type metadata accessor for WDSEndpoint();
  sub_1000352D0();
  sub_10003E260();
  uint64_t v6 = sub_10003E234();
  v2(v6);
  sub_10003E278();
  swift_release();
  swift_release();
  uint64_t v7 = sub_10003E24C();
  v4(v7);
  ProxyContainer.public.getter();
  sub_100005280(&qword_100063900);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_100063740);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_10003E290();
  type metadata accessor for DatabaseManager();
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_100063790);
  sub_1000352D0();
  sub_10003E260();
  uint64_t v8 = sub_10003E234();
  v2(v8);
  sub_10003E278();
  swift_release();
  swift_release();
  uint64_t v9 = sub_10003E24C();
  v4(v9);
  ProxyContainer.public.getter();
  sub_10003E290();
  type metadata accessor for NotificationConfigurationManager();
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000634D8);
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_100063498);
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000634A8);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_100063908);
  sub_1000352D0();
  sub_10003E260();
  type metadata accessor for GeocodeService();
  Definition.thenConfigure<A>(as:configuration:)();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_1000634D0);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_100063910);
  sub_1000352D0();
  sub_10003E260();
  uint64_t v10 = sub_10003E234();
  v2(v10);
  sub_10003E278();
  swift_release();
  swift_release();
  uint64_t v11 = sub_10003E24C();
  v4(v11);
  ProxyContainer.public.getter();
  sub_100005280(&qword_100063918);
  sub_1000352D0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_10003E290();
  type metadata accessor for LocationMetadataStore();
  sub_1000352F0();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_100005280(&qword_100063920);
  RegistrationContainer.register<A>(_:name:factory:)();
  sub_10003E260();
  uint64_t v12 = sub_10003E234();
  v2(v12);
  sub_10003E278();
  swift_release();
  swift_release();
  uint64_t v13 = sub_10003E24C();
  v4(v13);
  ProxyContainer.private.getter();
  RegistrationContainer.lazy(block:)();
  return swift_release();
}

uint64_t sub_10003BD80(void *a1)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000633C8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v3 = result;
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000634C8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v14)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_100005370(a1, a1[3]);
  type metadata accessor for NotificationAuthorizationManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v4 = result;
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000638E0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v5 = result;
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000633E0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v12)
  {
    uint64_t v6 = sub_100032E98((uint64_t)v11, v12);
    __chkstk_darwin(v6);
    uint64_t v8 = (uint64_t **)&v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(uint64_t **))(v9 + 16))(v8);
    id v10 = sub_10003E0E0(v3, (uint64_t)v13, v4, v5, *v8);
    sub_100008AD0((uint64_t)v11);
    return (uint64_t)v10;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10003BFB0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v3 = type metadata accessor for WeatherStatisticsCaching();
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  __chkstk_darwin(v3);
  BOOL v26 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for WeatherAvailabilityCaching();
  uint64_t v5 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  unint64_t v23 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for WeatherDataCaching();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005280(&qword_100063958);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005370(a1, a1[3]);
  uint64_t v14 = type metadata accessor for WDSEndpoint();
  dispatch thunk of ResolverType.resolve<A>(_:)();
  v20[0] = v13;
  uint64_t result = sub_1000093BC((uint64_t)v13, 1, v14);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v16 = *(void (**)(char *, void, uint64_t))(v8 + 104);
  v20[1] = v10;
  v16(v10, enum case for WeatherDataCaching.disabled(_:), v7);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v23, enum case for WeatherAvailabilityCaching.disabled(_:), v22);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v26, enum case for WeatherStatisticsCaching.disabled(_:), v25);
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063900);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v29)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000638F8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v28)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000638F0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v27)
  {
    int64_t v17 = (objc_class *)type metadata accessor for WeatherDataServiceProxy();
    id v18 = objc_allocWithZone(v17);
    uint64_t result = WeatherDataServiceProxy.init(endpoint:caching:availableDataSetCaching:statisticsCaching:networkMonitor:authenticator:appConfigurationSettingsProvider:)();
    int64_t v19 = v21;
    v21[3] = (uint64_t)v17;
    v19[4] = (uint64_t)&protocol witness table for WeatherDataServiceProxy;
    *int64_t v19 = result;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10003C394(void *a1)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000633C8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    id v2 = objc_allocWithZone((Class)type metadata accessor for DaemonDecommissioningService());
    return DaemonDecommissioningService.init(notificationManager:)();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003C408@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for XPCActivityManager();
  swift_allocObject();
  uint64_t result = XPCActivityManager.init(onActivityCompletion:)();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for XPCActivityManager;
  *a1 = result;
  return result;
}

id sub_10003C478()
{
  uint64_t v0 = self;
  return [v0 neSessionClearCaches];
}

uint64_t sub_10003C4B0(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for XPCActivity();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005370(a2, a2[3]);
  uint64_t v8 = type metadata accessor for PrecipitationNotificationsManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v10 = (void *)result;
  sub_100005370(a1, a1[3]);
  static XPCActivity.Notifications.getter();
  uint64_t v16 = v8;
  uint64_t v17 = sub_10003DFA8(&qword_100063968, (void (*)(uint64_t))&type metadata accessor for PrecipitationNotificationsManager);
  v15[0] = v10;
  id v11 = v10;
  dispatch thunk of XPCActivityManagerType.registerActivity(_:handler:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_100008AD0((uint64_t)v15);
  sub_100005370(a2, a2[3]);
  uint64_t v12 = type metadata accessor for DatabaseManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v13 = result;
  if (qword_100062430 != -1) {
    swift_once();
  }
  sub_100005248(v4, (uint64_t)static XPCActivity.Databases);
  uint64_t v16 = v12;
  uint64_t v17 = sub_10003DFA8(&qword_100063970, (void (*)(uint64_t))type metadata accessor for DatabaseManager);
  v15[0] = v13;
  dispatch thunk of XPCActivityManagerType.registerActivity(_:handler:)();

  return sub_100008AD0((uint64_t)v15);
}

uint64_t sub_10003C730@<X0>(uint64_t *a1@<X8>)
{
  sub_100005370(qword_100064228, qword_100064240);
  sub_100005280(&qword_1000638F0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v4)
  {
    uint64_t v3 = type metadata accessor for WDSAuthenticatorFactory();
    swift_allocObject();
    uint64_t result = WDSAuthenticatorFactory.init(clientConfigurationProvider:)();
    a1[3] = v3;
    a1[4] = (uint64_t)&protocol witness table for WDSAuthenticatorFactory;
    *a1 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003C7D8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063790);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v6[3])
  {
    uint64_t v4 = type metadata accessor for AppConfigurationSettingsProvider();
    swift_allocObject();
    uint64_t v5 = sub_100041108(v6);
    a2[3] = v4;
    uint64_t result = sub_10003DFA8(&qword_100063960, (void (*)(uint64_t))type metadata accessor for AppConfigurationSettingsProvider);
    a2[4] = result;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003C8AC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v16 = type metadata accessor for WDSVersion();
  uint64_t v3 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005280(&qword_100063958);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WDSEndpoint();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000638E8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v18)
  {
    sub_100008E88(&v17, (uint64_t)v19);
    sub_100005370(a1, a1[3]);
    dispatch thunk of ResolverType.resolve<A>(_:)();
    uint64_t result = sub_1000093BC((uint64_t)v8, 1, v9);
    if (result != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
      sub_100005370(v19, v19[3]);
      uint64_t v14 = v16;
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for WDSVersion.tokenServiceVersion(_:), v16);
      dispatch thunk of WDSAuthenticatorFactoryType.makeAuthenticator(for:version:isJWTEnabled:)();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v14);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return sub_100008AD0((uint64_t)v19);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10003CB78@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v3 = type metadata accessor for URL();
  __chkstk_darwin(v3 - 8);
  uint64_t v13 = type metadata accessor for EndpointConfiguration();
  uint64_t v4 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AppConfiguration();
  uint64_t v7 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SettingReader();
  static SettingReader.shared.getter();
  static Settings.WeatherEnvironment.contentEnvironment.getter();
  SettingReader.read<A>(_:)();
  swift_release();
  swift_release();
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063790);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v16)
  {
    sub_100008E88(&v15, (uint64_t)v17);
    sub_100005370(v17, v17[3]);
    dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
    AppConfiguration.endpointConfig(for:)();
    EndpointConfiguration.weatherDataURL.getter();
    WDSEndpoint.init(url:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v13);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v12);
    return sub_100008AD0((uint64_t)v17);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003CE00@<X0>(uint64_t *a1@<X8>)
{
  return sub_10003CE68((uint64_t (*)(void))&type metadata accessor for NetworkMonitor, (uint64_t (*)(void))&NetworkMonitor.init(), (uint64_t)&protocol witness table for NetworkMonitor, a1);
}

uint64_t sub_10003CE34@<X0>(uint64_t *a1@<X8>)
{
  return sub_10003CE68((uint64_t (*)(void))&type metadata accessor for CachedIdentityService, (uint64_t (*)(void))&CachedIdentityService.init(), (uint64_t)&protocol witness table for CachedIdentityService, a1);
}

uint64_t sub_10003CE68@<X0>(uint64_t (*a1)(void)@<X1>, uint64_t (*a2)(void)@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v7 = a1(0);
  swift_allocObject();
  uint64_t result = a2();
  a4[3] = v7;
  a4[4] = a3;
  *a4 = result;
  return result;
}

uint64_t sub_10003CED0()
{
  type metadata accessor for DatabaseManager();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t sub_10003CEFC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000634D8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = type metadata accessor for ReferenceCountedLazyAppConfigurationManager();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    a2[3] = v5;
    uint64_t result = sub_10003DFA8(&qword_100063950, (void (*)(uint64_t))type metadata accessor for ReferenceCountedLazyAppConfigurationManager);
    a2[4] = result;
    *a2 = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003CFBC(void *a1)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000634D8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    type metadata accessor for NotificationConfigurationManager();
    swift_allocObject();
    return NotificationConfigurationManager.init(appConfigurationManager:)();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003D038(uint64_t a1)
{
  return sub_10003D188(a1, (uint64_t)&unk_10005F240, &qword_1000634D8);
}

uint64_t sub_10003D060@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063940);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v7)
  {
    sub_100005370(a1, a1[3]);
    sub_100005280(&qword_100063948);
    uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
    if (v6)
    {
      uint64_t v5 = type metadata accessor for AppConfigurationManager();
      swift_allocObject();
      uint64_t result = AppConfigurationManager.init(appConfigurationService:appConfigurationStore:)();
      a2[3] = v5;
      a2[4] = (uint64_t)&protocol witness table for AppConfigurationManager;
      *a2 = result;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10003D160(uint64_t a1)
{
  return sub_10003D188(a1, (uint64_t)&unk_10005F218, &qword_100063498);
}

uint64_t sub_10003D188(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = type metadata accessor for LazyOptions();
  __chkstk_darwin(v5);
  sub_10003E29C();
  sub_100008A6C(a1, (uint64_t)v8);
  uint64_t v6 = swift_allocObject();
  sub_100008E88(v8, v6 + 16);
  *(void *)&v8[0] = _swiftEmptyArrayStorage;
  sub_10003DFA8(&qword_100063470, (void (*)(uint64_t))&type metadata accessor for LazyOptions);
  sub_100005280(&qword_100063478);
  sub_10003DF4C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_100005280(a3);
  swift_allocObject();
  return ReferenceCountedLazy.init(options:loadBlock:)();
}

uint64_t sub_10003D2D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000638D8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v5) {
    return sub_100008E88(&v4, a2);
  }
  __break(1u);
  return result;
}

uint64_t sub_10003D350@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063908);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v7)
  {
    sub_100005370(a1, a1[3]);
    sub_100005280(&qword_100063918);
    uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
    if (v6)
    {
      uint64_t v5 = type metadata accessor for LocationMetadataManager();
      swift_allocObject();
      uint64_t result = LocationMetadataManager.init(geocodeService:store:)();
      a2[3] = v5;
      a2[4] = (uint64_t)&protocol witness table for LocationMetadataManager;
      *a2 = result;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10003D45C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063790);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v9)
  {
    __break(1u);
    goto LABEL_6;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063738);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v8)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_100063938);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v6)
  {
    sub_100008E88(&v5, (uint64_t)v7);
    type metadata accessor for GeocodeService();
    swift_allocObject();
    uint64_t result = GeocodeService.init(appConfigurationManager:privacySampler:locationMetadataUpdater:)();
    *a2 = result;
    a2[1] = (uint64_t)&protocol witness table for GeocodeService;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_10003D594(uint64_t a1, void *a2)
{
  sub_100005370(a2, a2[3]);
  sub_100005280(&qword_100063928);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v4)
  {
    GeocodeService.setupWeatherKitGeocoding(using:)();
    return sub_100008AD0((uint64_t)v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003D618@<X0>(uint64_t *a1@<X8>)
{
  sub_100005370(qword_100064228, qword_100064240);
  sub_100005280(&qword_100063910);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v5)
  {
    uint64_t v3 = (objc_class *)type metadata accessor for LocationManager();
    id v4 = objc_allocWithZone(v3);
    uint64_t result = LocationManager.init(geocodeManager:locationCacheManager:)();
    a1[3] = (uint64_t)v3;
    a1[4] = (uint64_t)&protocol witness table for LocationManager;
    *a1 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003D6BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for CurrentLocationCacheManager();
  swift_allocObject();
  uint64_t result = CurrentLocationCacheManager.init(store:)();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for CurrentLocationCacheManager;
  *a1 = result;
  return result;
}

uint64_t sub_10003D72C()
{
  return 0;
}

uint64_t sub_10003D734@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  type metadata accessor for LocationMetadataStore();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    *a2 = result;
    a2[1] = (uint64_t)&protocol witness table for LocationMetadataStore;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003D798()
{
  return LocationMetadataStore.init(database:configuredCountryCode:)();
}

uint64_t sub_10003D800()
{
  uint64_t v0 = type metadata accessor for Database.JournalingMode();
  uint64_t v15 = *(void *)(v0 - 8);
  uint64_t v16 = v0;
  __chkstk_darwin(v0);
  uint64_t v14 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Database.VacuumMode();
  uint64_t v2 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Database.CacheSize();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for Database.RecoveryMode();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for AssertionOptions();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = type metadata accessor for Database.Location();
  __chkstk_darwin(v11 - 8);
  type metadata accessor for Database();
  type metadata accessor for LocationMetadataStore();
  static LocationMetadataStore.location.getter();
  static AssertionOptions.weatherAssertions.getter();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Database.RecoveryMode.truncate(_:), v6);
  static LocationMetadataStore.preferredCacheSize.getter();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for Database.VacuumMode.incremental(_:), v13);
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v14, enum case for Database.JournalingMode.wal(_:), v16);
  char v17 = 0;
  return Database.init(location:assertions:journalingMode:recoveryMode:preferredCacheSize:vacuumMode:busyTimeout:)();
}

uint64_t sub_10003DB5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for CoherenceContainerName.weatherd(_:);
  uint64_t v3 = type metadata accessor for CoherenceContainerName();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104))(a1, v2, v3);
  return sub_100008CEC(a1, 0, 1, v3);
}

uint64_t sub_10003DBF0()
{
  sub_100005280(&qword_100063928);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063730);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  sub_100005280(&qword_100063738);
  RegistrationContainer.register<A>(_:name:factory:)();
  return swift_release();
}

uint64_t sub_10003DCC4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(&qword_1000638D8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v7)
  {
    uint64_t v4 = type metadata accessor for GeocodeWeatherService();
    uint64_t v5 = swift_allocObject();
    sub_100008E88(&v6, v5 + 16);
    a2[3] = v4;
    uint64_t result = sub_10003DFA8(&qword_100063930, (void (*)(uint64_t))type metadata accessor for GeocodeWeatherService);
    a2[4] = result;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003DD98@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10003DE10(a1, &qword_100063740, (uint64_t (*)(void))&type metadata accessor for PrivacySaltProvider, (uint64_t (*)(char *))&PrivacySaltProvider.init(identityService:), (uint64_t)&protocol witness table for PrivacySaltProvider, a2);
}

uint64_t sub_10003DDD4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10003DE10(a1, &qword_100063730, (uint64_t (*)(void))&type metadata accessor for PrivacySampler, (uint64_t (*)(char *))&PrivacySampler.init(saltProvider:), (uint64_t)&protocol witness table for PrivacySampler, a2);
}

uint64_t sub_10003DE10@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t (*a4)(char *)@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  sub_100005370(a1, a1[3]);
  sub_100005280(a2);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v14)
  {
    uint64_t v12 = a3(0);
    swift_allocObject();
    uint64_t result = a4(v13);
    a6[3] = v12;
    a6[4] = a5;
    *a6 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for DaemonAssembly()
{
  return self;
}

uint64_t sub_10003DEF4()
{
  return sub_10003B698();
}

uint64_t sub_10003DF0C()
{
  sub_100008AD0(v0 + 16);
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10003DF44@<X0>(uint64_t a1@<X8>)
{
  return sub_10003D2D8((void *)(v1 + 16), a1);
}

unint64_t sub_10003DF4C()
{
  unint64_t result = qword_100063480;
  if (!qword_100063480)
  {
    sub_1000080E4(&qword_100063478);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063480);
  }
  return result;
}

uint64_t sub_10003DFA0@<X0>(uint64_t *a1@<X8>)
{
  return sub_10003D060((void *)(v1 + 16), a1);
}

uint64_t sub_10003DFA8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_10003DFF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6)
{
  ObjectType = (objc_class *)swift_getObjectType();
  v16[3] = type metadata accessor for SevereNotificationsManager();
  v16[4] = &off_10005E7C8;
  v16[0] = a5;
  *(void *)&a6[OBJC_IVAR____TtC8weatherd6Daemon_notificationsManager] = a1;
  sub_100008A6C(a2, (uint64_t)&a6[OBJC_IVAR____TtC8weatherd6Daemon_activityManager]);
  *(void *)&a6[OBJC_IVAR____TtC8weatherd6Daemon_notificationAuthorizationManager] = a3;
  *(void *)&a6[OBJC_IVAR____TtC8weatherd6Daemon_decommissioningService] = a4;
  sub_100008A6C((uint64_t)v16, (uint64_t)&a6[OBJC_IVAR____TtC8weatherd6Daemon_severeNotificationsManager]);
  v15.receiver = a6;
  v15.super_class = ObjectType;
  id v13 = objc_msgSendSuper2(&v15, "init");
  sub_100008AD0((uint64_t)v16);
  sub_100008AD0(a2);
  return v13;
}

id sub_10003E0E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v18 = *a5;
  int64_t v19 = &off_10005E7C8;
  v17[0] = a5;
  uint64_t v9 = (char *)objc_allocWithZone((Class)type metadata accessor for Daemon());
  uint64_t v10 = sub_100032E98((uint64_t)v17, v18);
  __chkstk_darwin(v10);
  uint64_t v12 = (void *)((char *)&v17[-1] - v11);
  (*(void (**)(char *))(v13 + 16))((char *)&v17[-1] - v11);
  id v14 = sub_10003DFF0(a1, a2, a3, a4, *v12, v9);
  sub_100008AD0((uint64_t)v17);
  return v14;
}

uint64_t sub_10003E234()
{
  return v0;
}

uint64_t sub_10003E24C()
{
  return v0;
}

uint64_t sub_10003E260()
{
  return swift_release();
}

uint64_t sub_10003E278()
{
  return Definition.inScope(_:)();
}

uint64_t sub_10003E290()
{
  return 0;
}

uint64_t type metadata accessor for NotificationAuthorizationStatusProvider()
{
  return self;
}

BOOL sub_10003E2D8()
{
  id v2 = [*(id *)(v0 + 16) notificationSettings];
  id v3 = [v2 authorizationStatus];

  return v3 == (id)2;
}

BOOL sub_10003E348()
{
  return sub_10003E2D8();
}

uint64_t sub_10003E370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

uint64_t sub_10003E38C(uint64_t *a1, uint64_t *a2)
{
  return sub_10003E370(*a1, a1[1], *a2, a2[1]);
}

void *initializeBufferWithCopyOfBuffer for CloudChannel(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CloudChannel()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for CloudChannel(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for CloudChannel(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for CloudChannel(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CloudChannel(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CloudChannel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudChannel()
{
  return &type metadata for CloudChannel;
}

uint64_t type metadata accessor for SevereWeatherEventDataProvider()
{
  return self;
}

uint64_t sub_10003E510(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Location();
  sub_1000053F4();
  uint64_t v8 = v7;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = v11;
  __chkstk_darwin(v10);
  id v14 = (char *)&v39 - v13;
  type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v46 = v16;
  uint64_t v47 = v15;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  int64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v51 = a3;
  uint64_t v48 = v19;
  uint64_t v49 = v8 + 16;
  v19(v14, a3, v6);
  swift_bridgeObjectRetain_n();
  unint64_t v45 = v18;
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  int v22 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v23 = swift_slowAlloc();
    char v43 = v12;
    uint64_t v24 = v23;
    uint64_t v42 = swift_slowAlloc();
    v53[0] = v42;
    *(_DWORD *)uint64_t v24 = 136446723;
    int v41 = v22;
    swift_bridgeObjectRetain();
    *(void *)&v52[0] = sub_1000466F4(a1, a2, v53);
    os_log_t v40 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v24 + 12) = 2160;
    *(void *)&v52[0] = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v24 + 22) = 2081;
    uint64_t v44 = v8;
    uint64_t v25 = Location.id.getter();
    *(void *)&v52[0] = sub_1000466F4(v25, v26, v53);
    uint64_t v8 = v44;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_10003EC24();
    v28(v27);
    os_log_t v29 = v40;
    _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v41, "Requesting severe event details with identifier: %{public}s for location: %{private,mask.hash}s", (uint8_t *)v24, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v12 = v43;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    uint64_t v30 = sub_10003EC24();
    v31(v30);
  }
  (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v47);
  ReferenceCountedLazy.increase()();
  sub_100007450();
  uint64_t v32 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_100008A6C((uint64_t)v53, (uint64_t)v52);
  v48(v12, v51, v6);
  uint64_t v33 = v8;
  unint64_t v34 = (*(unsigned __int8 *)(v8 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v35 = swift_allocObject();
  sub_100008E88(v52, v35 + 16);
  *(void *)(v35 + 56) = a1;
  *(void *)(v35 + 64) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v33 + 32))(v35 + v34, v12, v6);
  type metadata accessor for WeatherAlert();
  swift_bridgeObjectRetain();
  firstly<A>(on:closure:)();

  swift_release();
  uint64_t v36 = (void *)zalgo.getter();
  uint64_t v37 = Promise.always<A>(on:disposeOn:closure:)();
  swift_release();

  sub_100008AD0((uint64_t)v53);
  return v37;
}

uint64_t sub_10003E9AC(void *a1, uint64_t a2, uint64_t a3)
{
  v11[2] = a2;
  v11[3] = a3;
  uint64_t v4 = type metadata accessor for TimeZone();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1[3];
  v11[1] = a1[4];
  sub_100005370(a1, v8);
  static Locale.languageIdentifier.getter();
  Location.timeZone.getter();
  TimeZone.identifier.getter();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v9 = dispatch thunk of WeatherDataServiceType.fetchWeatherAlert(with:for:timezone:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_10003EB0C()
{
  uint64_t v1 = type metadata accessor for Location();
  sub_1000053F4();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 72) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  sub_100008AD0(v0 + 16);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return _swift_deallocObject(v0, v8, v9);
}

uint64_t sub_10003EBB8()
{
  type metadata accessor for Location();
  return sub_10003E9AC(v0 + 2, v0[7], v0[8]);
}

uint64_t sub_10003EC24()
{
  return v0;
}

uint64_t type metadata accessor for APSIncomingMessageStore()
{
  return self;
}

uint64_t sub_10003EC64(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  unint64_t v64 = a2;
  uint64_t v63 = a3;
  void v52[3] = type metadata accessor for Expression();
  sub_1000053F4();
  long long v52[2] = v4;
  __chkstk_darwin(v5);
  sub_100013014();
  v52[1] = v6;
  type metadata accessor for UUID();
  sub_1000053F4();
  uint64_t v57 = v8;
  uint64_t v58 = v7;
  __chkstk_darwin(v7);
  sub_100013014();
  uint64_t v56 = v9;
  type metadata accessor for IncomingMessageEntity();
  sub_1000053F4();
  uint64_t v60 = v10;
  uint64_t v61 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v14 - 8);
  sub_100013014();
  uint64_t v55 = v15;
  uint64_t v66 = type metadata accessor for APSMessage();
  __chkstk_darwin(v66);
  uint64_t v17 = (void *)((char *)v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v20 = v19;
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v24 = (char *)v52 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  unint64_t v26 = (char *)v52 - v25;
  static Logger.notifications.getter();
  sub_10003F4E8(a1, (uint64_t)v17);
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.default.getter();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v67 = v20;
  uint64_t v68 = v18;
  uint64_t v62 = v24;
  uint64_t v59 = v13;
  if (v29)
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    v70[0] = (id)swift_slowAlloc();
    unint64_t v54 = a1;
    *(_DWORD *)uint64_t v30 = 136315138;
    uint64_t v32 = *v17;
    unint64_t v31 = v17[1];
    swift_bridgeObjectRetain();
    uint64_t v69 = sub_1000466F4(v32, v31, (uint64_t *)v70);
    uint64_t v20 = v67;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10003F54C((uint64_t)v17);
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Storing incoming message with identifier: %s", v30, 0xCu);
    swift_arrayDestroy();
    uint64_t v18 = v68;
    sub_100012FA4();
    sub_100012FA4();
  }
  else
  {
    sub_10003F54C((uint64_t)v17);
  }

  uint64_t v33 = *(void (**)(char *, uint64_t))(v20 + 8);
  v33(v26, v18);
  uint64_t v34 = *(void *)(v65 + 16);
  ReferenceCountedLazy.increase()();
  uint64_t v35 = self;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v70[0] = 0;
  id v37 = [v35 dataWithPropertyList:isa format:100 options:0 error:v70];

  id v38 = v70[0];
  if (v37)
  {
    v52[4] = v33;
    uint64_t v65 = v34;
    uint64_t v39 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v41 = v40;

    static String.Encoding.utf8.getter();
    uint64_t v53 = v39;
    unint64_t v54 = v41;
    String.init(data:encoding:)();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    UUID.init()();
    UUID.uuidString.getter();
    uint64_t v42 = sub_10003F5A8();
    v43(v42);
    IncomingMessageEntity.init(id:messageID:channel:userInfo:)();
    NotificationStore.incomingMessages.getter();
    uint64_t v45 = v53;
    unint64_t v46 = v54;
    dispatch thunk of Table.save.getter();
    swift_release();
    dispatch thunk of Save.entity(_:)();
    swift_release();
    NotificationStore.incomingMessages.getter();
    dispatch thunk of Table.delete.getter();
    swift_release();
    v70[3] = (id)type metadata accessor for Date();
    v70[4] = &protocol witness table for Date;
    sub_100008E24((uint64_t *)v70);
    Date.init(timeIntervalSinceNow:)();
    <= infix(_:_:)();
    sub_100008AD0((uint64_t)v70);
    dispatch thunk of Delete.where(_:)();
    swift_release();
    sub_100008D88(v45, v46);
    swift_release();
    uint64_t v48 = sub_10003F5BC();
    v49(v48);
    uint64_t v50 = sub_10003F5A8();
    v51(v50);
    ReferenceCountedLazy.decrease()();
    return v64();
  }
  else
  {
    uint64_t v44 = v38;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_release();
    return swift_errorRelease();
  }
}

uint64_t sub_10003F4E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for APSMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003F54C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for APSMessage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003F5A8()
{
  return v0;
}

uint64_t sub_10003F5BC()
{
  return v0;
}

uint64_t Settings.DaemonStore.set<A>(setting:value:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = sub_100040D30(&qword_100063B58);
  return Updatable.save<A>(setting:value:)(a1, a2, v5, v6);
}

uint64_t type metadata accessor for Settings.DaemonStore()
{
  return self;
}

uint64_t Settings.DaemonStore.deinit()
{
  return v0;
}

uint64_t sub_10003F6A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Updatable.save<A>(setting:value:)(a1, a2, *v6, a6);
}

uint64_t sub_10003F6D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return Updatable.reset<A>(setting:)(a1, *v5, a5);
}

uint64_t sub_10003F700(uint64_t a1)
{
  return Updatable.apply(preset:)(a1, *v1);
}

uint64_t sub_10003F72C()
{
  type metadata accessor for Settings.DaemonStore();
  uint64_t result = swift_initStaticObject();
  static Settings.Daemon.settingsStore = result;
  return result;
}

uint64_t *Settings.Daemon.settingsStore.unsafeMutableAddressor()
{
  if (qword_100062438 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.settingsStore;
}

uint64_t static Settings.Daemon.settingsStore.getter()
{
  type metadata accessor for Settings.DaemonStore();
  return swift_initStaticObject();
}

uint64_t sub_10003F7D4(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD000000000000020, 0x8000000100053D00, &static Settings.Daemon.fetchesWeatherData);
}

uint64_t *Settings.Daemon.fetchesWeatherData.unsafeMutableAddressor()
{
  if (qword_100062440 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.fetchesWeatherData;
}

uint64_t static Settings.Daemon.fetchesWeatherData.getter()
{
  return sub_1000407F0(&qword_100062440);
}

uint64_t sub_10003F868(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD00000000000002CLL, 0x8000000100053CD0, &static Settings.Daemon.clearAQIScalesCacheOnNextLaunch);
}

uint64_t *Settings.Daemon.clearAQIScalesCacheOnNextLaunch.unsafeMutableAddressor()
{
  if (qword_100062448 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.clearAQIScalesCacheOnNextLaunch;
}

uint64_t static Settings.Daemon.clearAQIScalesCacheOnNextLaunch.getter()
{
  return sub_1000407F0(&qword_100062448);
}

uint64_t sub_10003F8FC(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD00000000000002FLL, 0x8000000100053CA0, &static Settings.Daemon.clearWeatherDataCacheOnNextLaunch);
}

uint64_t *Settings.Daemon.clearWeatherDataCacheOnNextLaunch.unsafeMutableAddressor()
{
  if (qword_100062450 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.clearWeatherDataCacheOnNextLaunch;
}

uint64_t static Settings.Daemon.clearWeatherDataCacheOnNextLaunch.getter()
{
  return sub_1000407F0(&qword_100062450);
}

uint64_t sub_10003F990(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD00000000000003CLL, 0x8000000100053C60, &static Settings.Daemon.clearWeatherAvailableDataSetsCacheOnNextLaunch);
}

uint64_t *Settings.Daemon.clearWeatherAvailableDataSetsCacheOnNextLaunch.unsafeMutableAddressor()
{
  if (qword_100062458 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.clearWeatherAvailableDataSetsCacheOnNextLaunch;
}

uint64_t static Settings.Daemon.clearWeatherAvailableDataSetsCacheOnNextLaunch.getter()
{
  return sub_1000407F0(&qword_100062458);
}

uint64_t sub_10003FA24(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD000000000000033, 0x8000000100053C20, &static Settings.Daemon.clearDailyStatisticsCacheOnNextLaunch);
}

uint64_t *Settings.Daemon.clearDailyStatisticsCacheOnNextLaunch.unsafeMutableAddressor()
{
  if (qword_100062460 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.clearDailyStatisticsCacheOnNextLaunch;
}

uint64_t static Settings.Daemon.clearDailyStatisticsCacheOnNextLaunch.getter()
{
  return sub_1000407F0(&qword_100062460);
}

uint64_t sub_10003FAB8(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD000000000000030, 0x8000000100053BE0, &static Settings.Daemon.clearDailySummaryCacheOnNextLaunch);
}

uint64_t *Settings.Daemon.clearDailySummaryCacheOnNextLaunch.unsafeMutableAddressor()
{
  if (qword_100062468 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.clearDailySummaryCacheOnNextLaunch;
}

uint64_t static Settings.Daemon.clearDailySummaryCacheOnNextLaunch.getter()
{
  return sub_1000407F0(&qword_100062468);
}

uint64_t sub_10003FB4C(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD000000000000034, 0x8000000100053BA0, &static Settings.Daemon.clearHourlyStatisticsCacheOnNextLaunch);
}

uint64_t *Settings.Daemon.clearHourlyStatisticsCacheOnNextLaunch.unsafeMutableAddressor()
{
  if (qword_100062470 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.clearHourlyStatisticsCacheOnNextLaunch;
}

uint64_t static Settings.Daemon.clearHourlyStatisticsCacheOnNextLaunch.getter()
{
  return sub_1000407F0(&qword_100062470);
}

uint64_t sub_10003FBE0(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD000000000000035, 0x8000000100053B60, &static Settings.Daemon.clearMonthlyStatisticsCacheOnNextLaunch);
}

uint64_t *Settings.Daemon.clearMonthlyStatisticsCacheOnNextLaunch.unsafeMutableAddressor()
{
  if (qword_100062478 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.clearMonthlyStatisticsCacheOnNextLaunch;
}

uint64_t static Settings.Daemon.clearMonthlyStatisticsCacheOnNextLaunch.getter()
{
  return sub_1000407F0(&qword_100062478);
}

uint64_t sub_10003FC74(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD00000000000001CLL, 0x8000000100053B40, &static Settings.Daemon.disableCaching);
}

uint64_t *Settings.Daemon.disableCaching.unsafeMutableAddressor()
{
  if (qword_100062480 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.disableCaching;
}

uint64_t static Settings.Daemon.disableCaching.getter()
{
  return sub_1000407F0(&qword_100062480);
}

uint64_t sub_10003FD08(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD000000000000026, 0x8000000100053B10, &static Settings.Daemon.disableStatisticsCaching);
}

uint64_t *Settings.Daemon.disableStatisticsCaching.unsafeMutableAddressor()
{
  if (qword_100062488 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.disableStatisticsCaching;
}

uint64_t static Settings.Daemon.disableStatisticsCaching.getter()
{
  return sub_1000407F0(&qword_100062488);
}

uint64_t sub_10003FD9C(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD00000000000002DLL, 0x8000000100053AE0, &static Settings.Daemon.disableAvailableDataSetsCaching);
}

uint64_t *Settings.Daemon.disableAvailableDataSetsCaching.unsafeMutableAddressor()
{
  if (qword_100062490 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.disableAvailableDataSetsCaching;
}

uint64_t static Settings.Daemon.disableAvailableDataSetsCaching.getter()
{
  return sub_1000407F0(&qword_100062490);
}

uint64_t sub_10003FE30(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD000000000000028, 0x8000000100053AB0, &static Settings.Daemon.clearCachedJWTTokenOnNextLaunch);
}

uint64_t *Settings.Daemon.clearCachedJWTTokenOnNextLaunch.unsafeMutableAddressor()
{
  if (qword_100062498 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.clearCachedJWTTokenOnNextLaunch;
}

uint64_t static Settings.Daemon.clearCachedJWTTokenOnNextLaunch.getter()
{
  return sub_1000407F0(&qword_100062498);
}

uint64_t sub_10003FEC4(uint64_t a1)
{
  return sub_10003FEE8(a1, 0xD000000000000029, 0x8000000100053A80, &static Settings.Daemon.mangleCachedJWTTokenOnNextLaunch);
}

uint64_t sub_10003FEE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = type metadata accessor for Domain();
  sub_1000053F4();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_100041078();
  type metadata accessor for Access();
  sub_1000053F4();
  __chkstk_darwin(v10);
  (*(void (**)(unsigned char *, void))(v12 + 104))(&v14[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)], enum case for Access.protected(_:));
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v4, enum case for Domain.standard(_:), v6);
  v14[15] = 0;
  sub_100005280(&qword_100063C68);
  swift_allocObject();
  sub_1000410D4();
  uint64_t result = Setting.init(_:defaultValue:domain:access:)();
  *a4 = result;
  return result;
}

uint64_t *Settings.Daemon.mangleCachedJWTTokenOnNextLaunch.unsafeMutableAddressor()
{
  if (qword_1000624A0 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.mangleCachedJWTTokenOnNextLaunch;
}

uint64_t static Settings.Daemon.mangleCachedJWTTokenOnNextLaunch.getter()
{
  return sub_1000407F0(&qword_1000624A0);
}

uint64_t sub_1000400A4(uint64_t a1)
{
  return sub_10004048C(a1, 1, 0xD000000000000025, 0x8000000100053A50, &static Settings.Daemon.forceQAAndNoAuthOnSimulator);
}

uint64_t *Settings.Daemon.forceQAAndNoAuthOnSimulator.unsafeMutableAddressor()
{
  if (qword_1000624A8 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.forceQAAndNoAuthOnSimulator;
}

uint64_t static Settings.Daemon.forceQAAndNoAuthOnSimulator.getter()
{
  return sub_1000407F0(&qword_1000624A8);
}

uint64_t static Settings.Daemon.requestFlatbuffers.getter()
{
  return sub_10004021C(&qword_1000624B0);
}

uint64_t *Settings.Daemon.enableFlatbuffers.unsafeMutableAddressor()
{
  if (qword_1000624B0 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.enableFlatbuffers;
}

uint64_t sub_1000401AC(uint64_t a1)
{
  return sub_10004048C(a1, 1, 0xD000000000000020, 0x8000000100053A20, &static Settings.Daemon.enableFlatbuffers);
}

uint64_t static Settings.Daemon.enableFlatbuffers.getter()
{
  return sub_1000407F0(&qword_1000624B0);
}

uint64_t static Settings.Daemon.requestStatisticsFlatbuffers.getter()
{
  return sub_10004021C(&qword_1000624B8);
}

uint64_t sub_10004021C(void *a1)
{
  type metadata accessor for SettingReader();
  static SettingReader.shared.getter();
  if (*a1 != -1) {
    swift_once();
  }
  SettingReader.read<A>(_:)();
  swift_release();
  return v3;
}

uint64_t *Settings.Daemon.enableStatisticsFlatbuffers.unsafeMutableAddressor()
{
  if (qword_1000624B8 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.enableStatisticsFlatbuffers;
}

uint64_t sub_1000402E8(uint64_t a1)
{
  return sub_10004048C(a1, 1, 0xD00000000000002ALL, 0x80000001000539F0, &static Settings.Daemon.enableStatisticsFlatbuffers);
}

uint64_t static Settings.Daemon.enableStatisticsFlatbuffers.getter()
{
  return sub_1000407F0(&qword_1000624B8);
}

uint64_t sub_100040334(uint64_t a1)
{
  return sub_10004048C(a1, 1, 0xD000000000000029, 0x80000001000539C0, &static Settings.Daemon.enableSendFlatbufferSchemaVersion);
}

uint64_t *Settings.Daemon.enableSendFlatbufferSchemaVersion.unsafeMutableAddressor()
{
  if (qword_1000624C0 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.enableSendFlatbufferSchemaVersion;
}

uint64_t static Settings.Daemon.enableSendFlatbufferSchemaVersion.getter()
{
  return sub_1000407F0(&qword_1000624C0);
}

uint64_t sub_1000403CC(uint64_t a1)
{
  return sub_10004048C(a1, 0, 0xD000000000000026, 0x8000000100053990, &static Settings.Daemon.enablePushLocationViewLoadData);
}

uint64_t *Settings.Daemon.enablePushLocationViewLoadData.unsafeMutableAddressor()
{
  if (qword_1000624C8 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.enablePushLocationViewLoadData;
}

uint64_t static Settings.Daemon.enablePushLocationViewLoadData.getter()
{
  return sub_1000407F0(&qword_1000624C8);
}

uint64_t sub_100040464(uint64_t a1)
{
  return sub_10004048C(a1, 0, 0xD000000000000020, 0x8000000100053960, &static Settings.Daemon.useDemoWeatherData);
}

uint64_t sub_10004048C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = type metadata accessor for Access();
  sub_1000053F4();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_100041078();
  uint64_t v11 = type metadata accessor for Domain();
  __chkstk_darwin(v11 - 8);
  sub_100041040();
  static Domain.weatherInternal.getter();
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v5, enum case for Access.protected(_:), v7);
  sub_100005280(&qword_100063C68);
  swift_allocObject();
  sub_1000410D4();
  uint64_t result = Setting.init(_:defaultValue:domain:access:)();
  *a5 = result;
  return result;
}

uint64_t *Settings.Daemon.useDemoWeatherData.unsafeMutableAddressor()
{
  if (qword_1000624D0 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.useDemoWeatherData;
}

uint64_t static Settings.Daemon.useDemoWeatherData.getter()
{
  return sub_1000407F0(&qword_1000624D0);
}

uint64_t sub_100040618()
{
  uint64_t v0 = type metadata accessor for Access();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unsigned __int8 v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Domain();
  __chkstk_darwin(v4 - 8);
  static Domain.weatherInternal.getter();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Access.protected(_:), v0);
  v6[0] = 0;
  v6[1] = 0xE000000000000000;
  sub_100005280(&qword_100063C60);
  swift_allocObject();
  uint64_t result = Setting.init(_:defaultValue:domain:access:)();
  static Settings.Daemon.treatmentIdentifierOverrides = result;
  return result;
}

uint64_t *Settings.Daemon.treatmentIdentifierOverrides.unsafeMutableAddressor()
{
  if (qword_1000624D8 != -1) {
    swift_once();
  }
  return &static Settings.Daemon.treatmentIdentifierOverrides;
}

uint64_t static Settings.Daemon.treatmentIdentifierOverrides.getter()
{
  return sub_1000407F0(&qword_1000624D8);
}

uint64_t sub_1000407F0(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t Settings.Daemon.AttributionOverrides.WeatherDataProvider.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x50746C7561666564;
  }
  if (a1 == 1) {
    return 0xD000000000000013;
  }
  return 0;
}

unint64_t Settings.Daemon.AttributionOverrides.WeatherDataProvider.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10005E360, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

uint64_t sub_1000408E0(unsigned __int8 *a1, char *a2)
{
  return sub_100013DB8(*a1, *a2);
}

Swift::Int sub_1000408EC()
{
  return sub_1000408F4();
}

Swift::Int sub_1000408F4()
{
  return sub_10004099C();
}

uint64_t sub_100040900()
{
  return sub_100040908();
}

uint64_t sub_100040908()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100040994()
{
  return sub_10004099C();
}

Swift::Int sub_10004099C()
{
  return Hasher._finalize()();
}

unint64_t sub_100040A3C@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = Settings.Daemon.AttributionOverrides.WeatherDataProvider.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100040A6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Settings.Daemon.AttributionOverrides.WeatherDataProvider.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100040A98(uint64_t a1)
{
  unint64_t v2 = sub_100040FF4();
  return static RawRepresentable<>.dataType.getter(a1, v2, &protocol witness table for String);
}

uint64_t sub_100040AEC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100040FF4();
  return static RawRepresentable<>.convert(from:)(a1, a2, v4, &protocol witness table for String);
}

uint64_t sub_100040B48(uint64_t a1)
{
  unint64_t v2 = sub_100040FF4();
  return RawRepresentable<>.toData()(a1, v2, &protocol witness table for String);
}

uint64_t Settings.Daemon.AttributionOverrides.__allocating_init(key:defaultValue:access:)()
{
  sub_1000410B0();
  sub_1000053F4();
  __chkstk_darwin(v0);
  sub_100041040();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = sub_100041058();
  v3(v2);
  sub_1000410E8();
  uint64_t v4 = sub_100041094();
  v5(v4);
  return v1;
}

uint64_t Settings.Daemon.AttributionOverrides.init(key:defaultValue:access:)()
{
  sub_1000410B0();
  sub_1000053F4();
  __chkstk_darwin(v1);
  sub_100041040();
  uint64_t v2 = sub_100041058();
  v3(v2);
  sub_1000410E8();
  uint64_t v4 = sub_100041094();
  v5(v4);
  return v0;
}

uint64_t Settings.Daemon.AttributionOverrides.__deallocating_deinit()
{
  uint64_t v0 = SettingGroup.deinit();
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100040CFC()
{
  return sub_100040D30(&qword_100063B60);
}

uint64_t sub_100040D30(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Settings.DaemonStore();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100040D74()
{
  unint64_t result = qword_100063B68;
  if (!qword_100063B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063B68);
  }
  return result;
}

ValueMetadata *type metadata accessor for Settings.Daemon()
{
  return &type metadata for Settings.Daemon;
}

uint64_t type metadata accessor for Settings.Daemon.AttributionOverrides()
{
  uint64_t result = qword_100063C08;
  if (!qword_100063C08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100040E18()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100040E58()
{
  return type metadata accessor for Settings.Daemon.AttributionOverrides();
}

uint64_t _s6DaemonV20AttributionOverridesC19WeatherDataProviderOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 2) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s6DaemonV20AttributionOverridesC19WeatherDataProviderOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100040FB4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_100040FDC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Settings.Daemon.AttributionOverrides.WeatherDataProvider()
{
  return &type metadata for Settings.Daemon.AttributionOverrides.WeatherDataProvider;
}

unint64_t sub_100040FF4()
{
  unint64_t result = qword_100063C58;
  if (!qword_100063C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063C58);
  }
  return result;
}

uint64_t sub_100041058()
{
  return v0;
}

uint64_t sub_100041078()
{
  return 0;
}

uint64_t sub_100041094()
{
  return v0;
}

uint64_t sub_1000410B0()
{
  return type metadata accessor for Access();
}

uint64_t sub_1000410D4()
{
  return v0;
}

uint64_t sub_1000410E8()
{
  return SettingGroup.init(key:defaultValue:access:)(v2, v1, v0, v3);
}

uint64_t sub_100041108(void *a1)
{
  uint64_t v3 = type metadata accessor for AppConfiguration();
  sub_1000053F4();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_10000F9B8();
  uint64_t v9 = v8 - v7;
  sub_100005370(a1, a1[3]);
  dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v1 + OBJC_IVAR____TtC8weatherd32AppConfigurationSettingsProvider_appConfiguration, v9, v3);
  sub_100008AD0((uint64_t)a1);
  return v1;
}

uint64_t sub_1000411E4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC8weatherd32AppConfigurationSettingsProvider_appConfiguration;
  uint64_t v2 = type metadata accessor for AppConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100041284()
{
  return type metadata accessor for AppConfigurationSettingsProvider();
}

uint64_t type metadata accessor for AppConfigurationSettingsProvider()
{
  uint64_t result = qword_100063CA0;
  if (!qword_100063CA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000412D4()
{
  uint64_t result = type metadata accessor for AppConfiguration();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100041364@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for NamedNetworkConfiguration();
  sub_1000053F4();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_10000F9B8();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_100005280(&qword_100063D28);
  __chkstk_darwin(v10 - 8);
  sub_10000F9B8();
  uint64_t v47 = v12 - v11;
  uint64_t v13 = type metadata accessor for NetworkConfiguration();
  sub_1000053F4();
  uint64_t v50 = v14;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v49 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  unint64_t v46 = (char *)&v42 - v19;
  __chkstk_darwin(v18);
  uint64_t v48 = (char *)&v42 - v20;
  id v21 = [objc_allocWithZone((Class)NSProcessInfo) init];
  id v22 = [v21 processName];

  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = v24;

  uint64_t v26 = v1 + OBJC_IVAR____TtC8weatherd32AppConfigurationSettingsProvider_appConfiguration;
  uint64_t v27 = AppConfiguration.namedNetworkConfigurations.getter();
  uint64_t v28 = *(void *)(v27 + 16);
  uint64_t v45 = v26;
  uint64_t v51 = v27;
  if (v28)
  {
    uint64_t v43 = v13;
    uint64_t v44 = a1;
    uint64_t v42 = v5;
    BOOL v29 = *(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16);
    unint64_t v30 = v27 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    unint64_t v31 = (void (**)(uint64_t, uint64_t))(v5 + 8);
    uint64_t v52 = *(void *)(v5 + 72);
    uint64_t v53 = v29;
    swift_bridgeObjectRetain();
    while (1)
    {
      v53(v9, v30, v3);
      if (NamedNetworkConfiguration.name.getter() == v23 && v32 == v25) {
        break;
      }
      char v34 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v34) {
        goto LABEL_13;
      }
      (*v31)(v9, v3);
      v30 += v52;
      if (!--v28)
      {
        swift_bridgeObjectRelease();
        uint64_t v35 = 1;
        uint64_t v13 = v43;
        uint64_t v5 = v42;
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
LABEL_13:
    id v37 = v49;
    uint64_t v36 = v50;
    swift_bridgeObjectRelease();
    uint64_t v5 = v42;
    uint64_t v38 = v47;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32))(v47, v9, v3);
    uint64_t v35 = 0;
    uint64_t v13 = v43;
    uint64_t v39 = v48;
  }
  else
  {
    uint64_t v35 = 1;
LABEL_11:
    id v37 = v49;
    uint64_t v36 = v50;
    uint64_t v38 = v47;
    uint64_t v39 = v48;
  }
  sub_100008CEC(v38, v35, 1, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (sub_1000093BC(v38, 1, v3) == 1)
  {
    sub_100041760(v38);
    AppConfiguration.network.getter();
  }
  else
  {
    unint64_t v40 = v46;
    NamedNetworkConfiguration.networkConfiguration.getter();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v38, v3);
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v39, v40, v13);
  }
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v37, v39, v13);
  WDSClientConfiguration.init(networkConfiguration:)();
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v39, v13);
}

uint64_t sub_10004173C@<X0>(uint64_t a1@<X8>)
{
  return sub_100041364(a1);
}

uint64_t sub_100041760(uint64_t a1)
{
  uint64_t v2 = sub_100005280(&qword_100063D28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000417C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v54 = a1;
  uint64_t v6 = sub_100005280(&qword_1000626D8);
  __chkstk_darwin(v6 - 8);
  sub_10000F9B8();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for Date();
  sub_1000053F4();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  sub_100043DFC();
  uint64_t v14 = type metadata accessor for ForecastSummary();
  sub_1000053F4();
  uint64_t v49 = v15;
  __chkstk_darwin(v16);
  sub_10000F9B8();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_100005280(&qword_100062870);
  __chkstk_darwin(v20 - 8);
  sub_100015DF8();
  uint64_t v48 = v21;
  __chkstk_darwin(v22);
  uint64_t v47 = (char *)&v43 - v23;
  uint64_t v24 = type metadata accessor for PrecipitationForecastSummaries();
  uint64_t v25 = 1;
  uint64_t v46 = a3 + *(int *)(v24 + 20);
  sub_100008CEC(v46, 1, 1, v14);
  uint64_t v45 = a3 + *(int *)(v24 + 24);
  uint64_t v52 = v14;
  sub_100008CEC(v45, 1, 1, v14);
  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  uint64_t v53 = v10;
  v26(a3, v54, v10);
  uint64_t v27 = *(void *)(a2 + 16);
  if (v27)
  {
    uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16);
    uint64_t v29 = *(unsigned __int8 *)(v49 + 80);
    uint64_t v43 = v12;
    uint64_t v44 = a2;
    uint64_t v30 = a2 + ((v29 + 32) & ~v29);
    unint64_t v31 = (void (**)(uint64_t, uint64_t))(v49 + 8);
    uint64_t v50 = *(void *)(v49 + 72);
    uint64_t v51 = v28;
    uint64_t v32 = v52;
    while (1)
    {
      v51(v19, v30, v32);
      ForecastSummary.endTime.getter();
      uint64_t v33 = v53;
      if (sub_1000093BC(v9, 1, v53) == 1) {
        break;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v3, v9, v33);
      char v34 = static Date.> infix(_:_:)();
      uint64_t v35 = v33;
      char v36 = v34;
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v3, v35);
      if (v36) {
        goto LABEL_10;
      }
      uint64_t v32 = v52;
      (*v31)(v19, v52);
      v30 += v50;
      if (!--v27)
      {
        uint64_t v37 = v32;
        uint64_t v25 = 1;
        uint64_t v12 = v43;
        a2 = v44;
        goto LABEL_8;
      }
    }
    sub_100042C1C(v9, &qword_1000626D8);
LABEL_10:
    uint64_t v39 = (uint64_t)v47;
    uint64_t v37 = v52;
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 32))(v47, v19, v52);
    uint64_t v25 = 0;
    uint64_t v12 = v43;
    a2 = v44;
    uint64_t v38 = v48;
  }
  else
  {
    uint64_t v37 = v52;
LABEL_8:
    uint64_t v39 = (uint64_t)v47;
    uint64_t v38 = v48;
  }
  uint64_t v41 = v45;
  uint64_t v40 = v46;
  sub_100008CEC(v39, v25, 1, v37);
  sub_100041B5C(v39, a2, v38);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v54, v53);
  sub_100042BB4(v39, v40);
  return sub_100042BB4(v38, v41);
}

uint64_t sub_100041B5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v70 = (char *)a3;
  uint64_t v78 = sub_100005280(&qword_100063D30);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v80 = (uint64_t)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ForecastSummary();
  uint64_t v79 = *(void *)(v5 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v65 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v61 = (char *)&v58 - v8;
  uint64_t v9 = sub_100005280(&qword_100062870);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v71 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v58 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v58 - v15;
  uint64_t v17 = sub_100005280(&qword_1000626D8);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v58 - v21;
  uint64_t v23 = type metadata accessor for Date();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v58 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v29 = (char *)&v58 - v28;
  sub_10000F36C(a1, (uint64_t)v16);
  if (sub_1000093BC((uint64_t)v16, 1, v5) == 1)
  {
    sub_100042C1C((uint64_t)v16, &qword_100062870);
    sub_100008CEC((uint64_t)v22, 1, 1, v23);
LABEL_4:
    sub_100042C1C((uint64_t)v22, &qword_1000626D8);
    return sub_100008CEC((uint64_t)v70, 1, 1, v5);
  }
  uint64_t v68 = v27;
  uint64_t v69 = v20;
  uint64_t v74 = v29;
  uint64_t v59 = v24;
  uint64_t v77 = a1;
  ForecastSummary.endTime.getter();
  uint64_t v30 = v79;
  uint64_t v31 = v79 + 8;
  uint64_t v32 = *(void (**)(char *, uint64_t))(v79 + 8);
  v32(v16, v5);
  if (sub_1000093BC((uint64_t)v22, 1, v23) == 1) {
    goto LABEL_4;
  }
  uint64_t v34 = v30;
  uint64_t v73 = (void (*)(uint64_t, uint64_t))v32;
  uint64_t v35 = v59;
  uint64_t v66 = *(void (**)(char *, char *, uint64_t))(v59 + 32);
  uint64_t v67 = v59 + 32;
  v66(v74, v22, v23);
  uint64_t v36 = *(void *)(v63 + 16);
  if (!v36)
  {
    uint64_t v55 = 1;
    uint64_t v56 = (uint64_t)v70;
    goto LABEL_22;
  }
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
  uint64_t v37 = v34 + 16;
  uint64_t v76 = v38;
  uint64_t v39 = (char *)(v63 + ((*(unsigned __int8 *)(v37 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 64)));
  uint64_t v58 = (void (**)(char *, uint64_t, uint64_t))(v37 + 16);
  unint64_t v64 = (void (**)(char *, uint64_t))(v35 + 8);
  uint64_t v79 = v37;
  uint64_t v72 = *(void *)(v37 + 56);
  swift_bridgeObjectRetain();
  uint64_t v40 = (uint64_t)v71;
  uint64_t v41 = v61;
  uint64_t v42 = v73;
  uint64_t v75 = v31;
  uint64_t v62 = v14;
  while (1)
  {
    uint64_t v43 = v23;
    uint64_t v44 = v76;
    v76(v41, v39, v5);
    v44(v14, v41, v5);
    sub_100008CEC((uint64_t)v14, 0, 1, v5);
    uint64_t v45 = v80;
    uint64_t v46 = v80 + *(int *)(v78 + 48);
    sub_10000F36C((uint64_t)v14, v80);
    sub_10000F36C(v77, v46);
    if (sub_1000093BC(v45, 1, v5) == 1)
    {
      sub_100042C1C((uint64_t)v14, &qword_100062870);
      uint64_t v23 = v43;
      if (sub_1000093BC(v46, 1, v5) == 1)
      {
        sub_100042C1C(v80, &qword_100062870);
        goto LABEL_16;
      }
      goto LABEL_12;
    }
    sub_10000F36C(v45, v40);
    uint64_t v23 = v43;
    if (sub_1000093BC(v46, 1, v5) == 1)
    {
      uint64_t v47 = (uint64_t)v62;
      sub_100042C1C((uint64_t)v62, &qword_100062870);
      uint64_t v14 = (char *)v47;
      v42(v40, v5);
LABEL_12:
      sub_100042C1C(v80, &qword_100063D30);
      goto LABEL_14;
    }
    uint64_t v48 = v65;
    (*v58)(v65, v46, v5);
    sub_100042D28(&qword_100063D38, (void (*)(uint64_t))&type metadata accessor for ForecastSummary);
    int v60 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v49 = v48;
    uint64_t v42 = v73;
    uint64_t v50 = v71;
    v73((uint64_t)v49, v5);
    uint64_t v14 = v62;
    sub_100042C1C((uint64_t)v62, &qword_100062870);
    v42((uint64_t)v50, v5);
    uint64_t v40 = (uint64_t)v50;
    sub_100042C1C(v80, &qword_100062870);
    if (v60) {
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v51 = (uint64_t)v69;
    ForecastSummary.endTime.getter();
    uint64_t v52 = v51;
    if (sub_1000093BC(v51, 1, v23) == 1) {
      break;
    }
    uint64_t v53 = v68;
    v66(v68, (char *)v52, v23);
    char v54 = static Date.> infix(_:_:)();
    (*v64)(v53, v23);
    uint64_t v42 = v73;
    if (v54) {
      goto LABEL_20;
    }
LABEL_16:
    v42((uint64_t)v41, v5);
    v39 += v72;
    if (!--v36)
    {
      swift_bridgeObjectRelease();
      uint64_t v55 = 1;
      uint64_t v56 = (uint64_t)v70;
      goto LABEL_21;
    }
  }
  sub_100042C1C(v51, &qword_1000626D8);
LABEL_20:
  swift_bridgeObjectRelease();
  uint64_t v56 = (uint64_t)v70;
  (*v58)(v70, (uint64_t)v41, v5);
  uint64_t v55 = 0;
LABEL_21:
  uint64_t v35 = v59;
LABEL_22:
  uint64_t v57 = v74;
  sub_100008CEC(v56, v55, 1, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v57, v23);
}

uint64_t sub_1000422E0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005280(&qword_100063D60);
  sub_1000053F4();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_10000F9B8();
  uint64_t v11 = v10 - v9;
  sub_100005370(a1, a1[3]);
  sub_100042C78();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v17[1] = 0;
  type metadata accessor for Date();
  sub_100042D28(&qword_100063D68, (void (*)(uint64_t))&type metadata accessor for Date);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    uint64_t v12 = type metadata accessor for PrecipitationForecastSummaries();
    uint64_t v13 = v3 + *(int *)(v12 + 20);
    v17[0] = 1;
    type metadata accessor for ForecastSummary();
    sub_100042D28(&qword_1000628C8, (void (*)(uint64_t))&type metadata accessor for ForecastSummary);
    sub_100043E30(v13, (uint64_t)v17);
    uint64_t v14 = v3 + *(int *)(v12 + 24);
    char v16 = 2;
    sub_100043E30(v14, (uint64_t)&v16);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v11, v5);
}

BOOL sub_1000424C8(char a1, char a2)
{
  return a1 == a2;
}

void sub_1000424D8(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t sub_100042500(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_100043E14() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x746E6572727563 && a2 == 0xE700000000000000;
    if (v6 || (sub_100043E14() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 1954047342 && a2 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_100043E14();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

Swift::Int sub_10004260C(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t sub_100042654(char a1)
{
  if (!a1) {
    return 1702125924;
  }
  if (a1 == 1) {
    return 0x746E6572727563;
  }
  return 1954047342;
}

BOOL sub_10004269C(char *a1, char *a2)
{
  return sub_1000424C8(*a1, *a2);
}

Swift::Int sub_1000426A8()
{
  return sub_10004260C(*v0);
}

void sub_1000426B0(uint64_t a1)
{
  sub_1000424D8(a1, *v1);
}

uint64_t sub_1000426B8()
{
  return sub_100042654(*v0);
}

uint64_t sub_1000426C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100042500(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000426E8()
{
  return 0;
}

void sub_1000426F4(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_100042700(uint64_t a1)
{
  unint64_t v2 = sub_100042C78();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10004273C(uint64_t a1)
{
  unint64_t v2 = sub_100042C78();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100042778@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v5 = sub_100005280(&qword_100062870);
  __chkstk_darwin(v5 - 8);
  sub_100015DF8();
  uint64_t v30 = v6;
  __chkstk_darwin(v7);
  uint64_t v33 = (char *)&v28 - v8;
  uint64_t v9 = type metadata accessor for Date();
  sub_1000053F4();
  uint64_t v31 = v10;
  __chkstk_darwin(v11);
  sub_10000F9B8();
  uint64_t v34 = v13 - v12;
  uint64_t v35 = sub_100005280(&qword_100063D40);
  sub_1000053F4();
  uint64_t v32 = v14;
  __chkstk_darwin(v15);
  sub_10000F9B8();
  uint64_t v16 = type metadata accessor for PrecipitationForecastSummaries();
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  sub_100043DFC();
  uint64_t v18 = v3 + *(int *)(v17 + 28);
  uint64_t v19 = type metadata accessor for ForecastSummary();
  uint64_t v37 = v18;
  sub_100008CEC(v18, 1, 1, v19);
  uint64_t v36 = v3 + *(int *)(v17 + 32);
  sub_100008CEC(v36, 1, 1, v19);
  sub_100005370(a1, a1[3]);
  sub_100042C78();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    sub_100008AD0((uint64_t)a1);
    uint64_t v22 = v36;
    sub_100042C1C(v37, &qword_100062870);
    return sub_100042C1C(v22, &qword_100062870);
  }
  else
  {
    uint64_t v20 = (uint64_t)v33;
    uint64_t v28 = a1;
    char v40 = 0;
    sub_100042D28(&qword_100063D50, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v21 = v34;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32);
    uint64_t v34 = v9;
    v23(v3, v21, v9);
    char v39 = 1;
    sub_100042D28(&qword_100063D58, (void (*)(uint64_t))&type metadata accessor for ForecastSummary);
    sub_100043DD4();
    sub_100042BB4(v20, v37);
    char v38 = 2;
    uint64_t v24 = v30;
    sub_100043DD4();
    uint64_t v25 = sub_100043DBC();
    v26(v25);
    sub_100042BB4(v24, v36);
    sub_100042CC4(v3, v29);
    sub_100008AD0((uint64_t)v28);
    return sub_10000F3D4(v3);
  }
}

uint64_t sub_100042B3C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100042778(a1, a2);
}

uint64_t sub_100042B54(void *a1)
{
  return sub_1000422E0(a1);
}

uint64_t type metadata accessor for PrecipitationForecastSummaries()
{
  uint64_t result = qword_100063DC8;
  if (!qword_100063DC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100042BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005280(&qword_100062870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100042C1C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005280(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100042C78()
{
  unint64_t result = qword_100063D48;
  if (!qword_100063D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063D48);
  }
  return result;
}

uint64_t sub_100042CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PrecipitationForecastSummaries();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100042D28(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PrecipitationForecastSummaries.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100042E3CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrecipitationForecastSummaries.CodingKeys()
{
  return &type metadata for PrecipitationForecastSummaries.CodingKeys;
}

uint64_t *sub_100042E74(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Date();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for ForecastSummary();
    if (sub_1000093BC((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = sub_100005280(&qword_100062870);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      sub_100008CEC((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    if (sub_1000093BC((uint64_t)v16, 1, v11))
    {
      uint64_t v17 = sub_100005280(&qword_100062870);
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v15, v16, v11);
      sub_100008CEC((uint64_t)v15, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t sub_100043078(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for ForecastSummary();
  if (!sub_1000093BC(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t result = sub_1000093BC(v7, 1, v6);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v9(v7, v6);
  }
  return result;
}

uint64_t sub_10004319C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for ForecastSummary();
  if (sub_1000093BC((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = sub_100005280(&qword_100062870);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    sub_100008CEC((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  if (sub_1000093BC((uint64_t)v14, 1, v10))
  {
    uint64_t v15 = sub_100005280(&qword_100062870);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v13, v14, v10);
    sub_100008CEC((uint64_t)v13, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_100043350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for ForecastSummary();
  int v11 = sub_1000093BC((uint64_t)v8, 1, v10);
  int v12 = sub_1000093BC((uint64_t)v9, 1, v10);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      sub_100008CEC((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = sub_100005280(&qword_100062870);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 24))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  int v18 = sub_1000093BC(a1 + v15, 1, v10);
  int v19 = sub_1000093BC((uint64_t)v17, 1, v10);
  if (!v18)
  {
    uint64_t v20 = *(void *)(v10 - 8);
    if (!v19)
    {
      (*(void (**)(void *, const void *, uint64_t))(v20 + 24))(v16, v17, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v16, v10);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v21 = sub_100005280(&qword_100062870);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v16, v17, v10);
  sub_100008CEC((uint64_t)v16, 0, 1, v10);
  return a1;
}

uint64_t sub_10004360C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for ForecastSummary();
  if (sub_1000093BC((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = sub_100005280(&qword_100062870);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    sub_100008CEC((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  if (sub_1000093BC((uint64_t)v14, 1, v10))
  {
    uint64_t v15 = sub_100005280(&qword_100062870);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v13, v14, v10);
    sub_100008CEC((uint64_t)v13, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_1000437C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for ForecastSummary();
  int v11 = sub_1000093BC((uint64_t)v8, 1, v10);
  int v12 = sub_1000093BC((uint64_t)v9, 1, v10);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      sub_100008CEC((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = sub_100005280(&qword_100062870);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  int v18 = sub_1000093BC(a1 + v15, 1, v10);
  int v19 = sub_1000093BC((uint64_t)v17, 1, v10);
  if (!v18)
  {
    uint64_t v20 = *(void *)(v10 - 8);
    if (!v19)
    {
      (*(void (**)(void *, const void *, uint64_t))(v20 + 40))(v16, v17, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v16, v10);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v21 = sub_100005280(&qword_100062870);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v16, v17, v10);
  sub_100008CEC((uint64_t)v16, 0, 1, v10);
  return a1;
}

uint64_t sub_100043A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100043A90);
}

uint64_t sub_100043A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for Date();
  sub_10002F8EC();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_100005280(&qword_100062870);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return sub_1000093BC(v9, a2, v8);
}

uint64_t sub_100043B10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100043B24);
}

uint64_t sub_100043B24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for Date();
  sub_10002F8EC();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_100005280(&qword_100062870);
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return sub_100008CEC(v11, a2, a2, v10);
}

void sub_100043BAC()
{
  type metadata accessor for Date();
  if (v0 <= 0x3F)
  {
    sub_100043C74();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100043C74()
{
  if (!qword_100063DD8)
  {
    type metadata accessor for ForecastSummary();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100063DD8);
    }
  }
}

unint64_t sub_100043CD0()
{
  unint64_t result = qword_100063E10;
  if (!qword_100063E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063E10);
  }
  return result;
}

unint64_t sub_100043D20()
{
  unint64_t result = qword_100063E18;
  if (!qword_100063E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063E18);
  }
  return result;
}

unint64_t sub_100043D70()
{
  unint64_t result = qword_100063E20;
  if (!qword_100063E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063E20);
  }
  return result;
}

uint64_t sub_100043DBC()
{
  return v0;
}

uint64_t sub_100043DD4()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100043E14()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100043E30(uint64_t a1, uint64_t a2)
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(a1, a2, v2, v3, v4);
}

id sub_100043E54()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithDescription:v1];

  return v2;
}

id NotificationsManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

void NotificationsManager.init()()
{
}

Swift::Bool __swiftcall NotificationsManager.listener(_:shouldAcceptNewConnection:)(NSXPCListener _, NSXPCConnection shouldAcceptNewConnection)
{
  sub_100027CCC();
  uint64_t v34 = v2;
  uint64_t v4 = v3;
  uint64_t v5 = type metadata accessor for XPCInterface();
  sub_1000053F4();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_10000F9B8();
  uint64_t v35 = v10 - v9;
  type metadata accessor for MachService();
  sub_1000053F4();
  uint64_t v36 = v12;
  uint64_t v37 = v11;
  __chkstk_darwin(v11);
  sub_10000F9B8();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v18 = v17;
  __chkstk_darwin(v19);
  sub_10000F9B8();
  uint64_t v22 = v21 - v20;
  static Logger.xpc.getter();
  uint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v33 = v5;
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136446210;
    static MachServices.Notifications.getter();
    uint64_t v26 = MachService.name.getter();
    uint64_t v32 = v7;
    unint64_t v28 = v27;
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v15, v37);
    sub_1000466F4(v26, v28, &v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v7 = v32;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Incoming message on %{public}s", v25, 0xCu);
    swift_arrayDestroy();
    sub_100012FA4();
    uint64_t v5 = v33;
    sub_100012FA4();

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v22, v16);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v22, v16);
  }
  WDDeviceUnlockedSinceBoot();
  sub_100005280(&qword_100063E30);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_100051770;
  *(void *)(v29 + 56) = sub_100005280(&qword_100063E38);
  *(void *)(v29 + 64) = sub_1000466A0();
  *(void *)(v29 + 32) = _swiftEmptyArrayStorage;
  simulateCrash(unless:_:_:)();
  swift_bridgeObjectRelease();
  [v4 setExportedObject:v34];
  static MachServices.Notifications.getter();
  MachService.serviceInterface.getter();
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v15, v37);
  Class isa = XPCInterface.asNSXPCInterface()().super.isa;
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v35, v5);
  [v4 setExportedInterface:isa];

  [v4 resume];
  sub_100027CA4();
  return result;
}

void sub_10004438C(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  _Block_copy(a2);
  static Logger.notifications.getter();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Received proxy request for updating notification fetch schedule", v13, 2u);
    swift_slowDealloc();
  }

  uint64_t v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  v14(v9, v3);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_100047160;
  *(void *)(v15 + 24) = v10;
  swift_retain();
  if (WDWeatherAppIsInstalled())
  {
    ReferenceCountedLazy.increase()();
    NotificationEnablementTracker.trackEnablement()();
    ReferenceCountedLazy.decrease()();
    sub_100027A84(0, (unint64_t *)&unk_100063E50);
    id v16 = sub_100043E54();
    sub_100027A84(0, (unint64_t *)&qword_100063FE0);
    uint64_t v17 = (void *)static OS_dispatch_queue.notifications.getter();
    sub_100005280(&qword_100063E60);
    type metadata accessor for NotificationsManager();
    firstly<A, B>(on:disposeOn:closure:)();

    uint64_t v18 = (void *)static OS_dispatch_queue.notifications.getter();
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = sub_100047194;
    v19[3] = v15;
    void v19[4] = v16;
    swift_retain();
    id v20 = v16;
    Promise.then<A>(on:closure:)();
    swift_release();

    swift_release();
    uint64_t v21 = (void *)swift_allocObject();
    void v21[2] = sub_100047194;
    v21[3] = v15;
    v21[4] = v20;
    swift_retain();
    id v22 = v20;
    uint64_t v23 = (void *)zalgo.getter();
    Promise.error(on:closure:)();
    swift_release();
    swift_release();
    swift_release();

    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    static Logger.notifications.getter();
    os_log_type_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Weather app was uninstalled; rejecting scheduling request",
        v26,
        2u);
      swift_slowDealloc();
    }

    v14(v7, v3);
    a2[2](a2, 0);
    [self neSessionClearCaches];
    swift_release();
    swift_release();
  }
  _Block_release(a2);
}

void NotificationsManager.schedule(with:)()
{
  sub_100027CCC();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  swift_getObjectType();
  uint64_t v6 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_100047198();
  __chkstk_darwin(v10);
  sub_1000471CC();
  static Logger.notifications.getter();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)sub_100027E10();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Received proxy request for updating notification fetch schedule", v13, 2u);
    sub_100012FA4();
  }

  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v14(v0, v6);
  uint64_t v15 = sub_100047270();
  *(void *)(v15 + 16) = v5;
  *(void *)(v15 + 24) = v3;
  swift_retain();
  if (WDWeatherAppIsInstalled())
  {
    ReferenceCountedLazy.increase()();
    NotificationEnablementTracker.trackEnablement()();
    ReferenceCountedLazy.decrease()();
    sub_100027A84(0, (unint64_t *)&unk_100063E50);
    sub_100047244();
    id v16 = sub_100043E54();
    sub_100027A84(0, (unint64_t *)&qword_100063FE0);
    uint64_t v17 = (void *)static OS_dispatch_queue.notifications.getter();
    sub_100005280(&qword_100063E60);
    firstly<A, B>(on:disposeOn:closure:)();

    uint64_t v18 = (void *)static OS_dispatch_queue.notifications.getter();
    uint64_t v19 = (void *)sub_1000471B4();
    v19[2] = sub_100047194;
    v19[3] = v15;
    void v19[4] = v16;
    swift_retain();
    id v20 = v16;
    Promise.then<A>(on:closure:)();
    swift_release();

    swift_release();
    uint64_t v21 = (void *)sub_1000471B4();
    void v21[2] = sub_100047194;
    v21[3] = v15;
    v21[4] = v20;
    swift_retain();
    id v22 = v20;
    uint64_t v23 = (void *)zalgo.getter();
    Promise.error(on:closure:)();
    swift_release();
    swift_release();

    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    static Logger.notifications.getter();
    os_log_type_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)sub_100027E10();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Weather app was uninstalled; rejecting scheduling request",
        v26,
        2u);
      sub_100012FA4();
    }

    v14(v1, v6);
    v5(0);
    [self neSessionClearCaches];
    swift_release();
  }
  sub_100027CA4();
}

uint64_t sub_100044C24(uint64_t a1)
{
  return sub_1000455EC(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of PrecipitationNotificationsManagerType.schedule());
}

void sub_100044C50(uint64_t a1, void (*a2)(Class))
{
  uint64_t v4 = sub_100005280(&qword_100063E60);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(int *)(v5 + 56);
  uint64_t v9 = &v7[v8];
  uint64_t v10 = a1 + v8;
  sub_100047074(a1, (uint64_t)v7);
  char v11 = *(unsigned char *)(v10 + 8);
  *(void *)uint64_t v9 = *(void *)v10;
  v9[8] = v11;
  uint64_t v12 = type metadata accessor for Date();
  Class isa = 0;
  if (sub_1000093BC((uint64_t)v7, 1, v12) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v7, v12);
  }
  a2(isa);
}

void sub_100044D98(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_100047010;
  *(void *)(v11 + 24) = v10;
  _Block_copy(a2);
  swift_retain();
  static Logger.notifications.getter();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = v4;
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Received proxy request for evaluating notification subscriptions", v14, 2u);
    uint64_t v4 = v28;
    swift_slowDealloc();
  }

  uint64_t v15 = *(void (**)(char *, uint64_t))(v4 + 8);
  v15(v9, v3);
  if (WDWeatherAppIsInstalled())
  {
    sub_100027A84(0, (unint64_t *)&unk_100063E50);
    id v16 = sub_100043E54();
    sub_100027A84(0, (unint64_t *)&qword_100063FE0);
    uint64_t v17 = (void *)static OS_dispatch_queue.notifications.getter();
    sub_100005280(&qword_100063E60);
    type metadata accessor for NotificationsManager();
    firstly<A, B>(on:disposeOn:closure:)();

    uint64_t v18 = (void *)swift_allocObject();
    void v18[2] = sub_100047194;
    void v18[3] = v11;
    v18[4] = v16;
    swift_retain();
    id v19 = v16;
    id v20 = (void *)zalgo.getter();
    Promise.then<A>(on:closure:)();
    swift_release();
    swift_release();

    uint64_t v21 = (void *)swift_allocObject();
    void v21[2] = sub_100047194;
    v21[3] = v11;
    v21[4] = v19;
    swift_retain();
    id v22 = v19;
    uint64_t v23 = (void *)zalgo.getter();
    Promise.error(on:closure:)();
    swift_release();
    swift_release();

    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    static Logger.notifications.getter();
    os_log_type_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Weather app was uninstalled; rejecting evaluation request",
        v26,
        2u);
      swift_slowDealloc();
    }

    v15(v7, v3);
    a2[2](a2, 0);
    [self neSessionClearCaches];
    swift_release();
    swift_release();
  }
  _Block_release(a2);
}

void NotificationsManager.evaluate(with:)()
{
  sub_100027CCC();
  sub_100047204();
  type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  sub_100047198();
  __chkstk_darwin(v4);
  sub_1000471CC();
  uint64_t v5 = sub_100047270();
  sub_100047224(v5);
  static Logger.notifications.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (_WORD *)sub_100027E10();
    sub_1000471DC(v8);
    sub_100047250((void *)&_mh_execute_header, v9, v10, "Received proxy request for evaluating notification subscriptions");
    sub_100012FA4();
  }

  uint64_t v11 = *(void (**)(void))(v2 + 8);
  sub_100015E24();
  v11();
  if (WDWeatherAppIsInstalled())
  {
    sub_100027A84(0, (unint64_t *)&unk_100063E50);
    sub_100047244();
    id v12 = sub_100043E54();
    sub_100027A84(0, (unint64_t *)&qword_100063FE0);
    os_log_type_t v13 = (void *)static OS_dispatch_queue.notifications.getter();
    sub_100005280(&qword_100063E60);
    firstly<A, B>(on:disposeOn:closure:)();

    uint64_t v14 = (void *)sub_1000471B4();
    void v14[2] = sub_100046F0C;
    void v14[3] = v0;
    v14[4] = v12;
    swift_retain();
    id v15 = v12;
    id v16 = (void *)zalgo.getter();
    Promise.then<A>(on:closure:)();
    swift_release();
    swift_release();

    uint64_t v17 = (void *)sub_1000471B4();
    unsigned char v17[2] = sub_100046F0C;
    void v17[3] = v0;
    void v17[4] = v15;
    swift_retain();
    id v18 = v15;
    id v19 = (void *)zalgo.getter();
    Promise.error(on:closure:)();
    swift_release();

    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    static Logger.notifications.getter();
    id v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      id v22 = (_WORD *)sub_100027E10();
      sub_1000471DC(v22);
      sub_1000471E8((void *)&_mh_execute_header, v20, v23, "Weather app was uninstalled; rejecting evaluation request");
      sub_100012FA4();
    }

    sub_100015E24();
    v11();
    v24(0);
    [self neSessionClearCaches];
    swift_release();
  }
  sub_100027CA4();
}

id sub_100045574(uint64_t a1, void (*a2)(void))
{
  a2();
  uint64_t v2 = self;
  return [v2 neSessionClearCaches];
}

uint64_t sub_1000455C0(uint64_t a1)
{
  return sub_1000455EC(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of PrecipitationNotificationsManagerType.evaluate());
}

uint64_t sub_1000455EC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v3 = (void *)(a1 + OBJC_IVAR____TtC8weatherd20NotificationsManager_precipitationNotificationsManager);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_100005370(v3, v4);
  return a2(v4, v5);
}

void sub_100045650(uint64_t a1, void (*a2)(Class), uint64_t a3)
{
  char v54 = a2;
  uint64_t v53 = a3;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v50 = *(void *)(v4 - 8);
  uint64_t v51 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v46 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v42 - v7;
  uint64_t v9 = sub_100005280(&qword_100063E60);
  uint64_t v10 = __chkstk_darwin(v9);
  id v12 = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v42 - v13;
  uint64_t v15 = type metadata accessor for Date();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  id v19 = (char *)v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v48 = (char *)v42 - v20;
  uint64_t v49 = v9;
  uint64_t v21 = *(int *)(v9 + 48);
  id v22 = &v14[v21];
  uint64_t v23 = a1 + v21;
  uint64_t v52 = a1;
  sub_100047074(a1, (uint64_t)v14);
  char v24 = *(unsigned char *)(v23 + 8);
  *(void *)id v22 = *(void *)v23;
  v22[8] = v24;
  int v25 = sub_1000093BC((uint64_t)v14, 1, v15);
  uint64_t v47 = v16;
  if (v25 == 1)
  {
    sub_10002E154((uint64_t)v14);
    static Logger.notifications.getter();
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Did not receive new fetch schedule date after evaluation", v28, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v50 + 8))(v8, v51);
  }
  else
  {
    uint64_t v29 = v48;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v48, v14, v15);
    uint64_t v30 = v46;
    static Logger.notifications.getter();
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v29, v15);
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.default.getter();
    int v33 = v32;
    if (os_log_type_enabled(v31, v32))
    {
      int v45 = v33;
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      uint64_t v56 = v44;
      uint64_t v43 = v34;
      *(_DWORD *)uint64_t v34 = 136446210;
      v42[1] = v34 + 4;
      sub_1000470DC();
      uint64_t v35 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v55 = sub_1000466F4(v35, v36, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v37 = *(void (**)(char *, uint64_t))(v16 + 8);
      v37(v19, v15);
      _os_log_impl((void *)&_mh_execute_header, v31, (os_log_type_t)v45, "Updated notification fetch schedule with date after evaluation: %{public}s", v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v50 + 8))(v30, v51);
      v37(v48, v15);
    }
    else
    {

      uint64_t v38 = *(void (**)(char *, uint64_t))(v16 + 8);
      v38(v19, v15);
      (*(void (**)(char *, uint64_t))(v50 + 8))(v30, v51);
      v38(v48, v15);
    }
  }
  char v39 = &v12[*(int *)(v49 + 48)];
  sub_100047074(v52, (uint64_t)v12);
  char v40 = *(unsigned char *)(v23 + 8);
  *(void *)char v39 = *(void *)v23;
  v39[8] = v40;
  if (sub_1000093BC((uint64_t)v12, 1, v15) == 1)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v15);
  }
  v54(isa);
}

void NotificationsManager.unregister(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_10000F9B8();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_100047270();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  swift_retain();
  static Logger.notifications.getter();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (_WORD *)sub_100027E10();
    sub_1000471DC(v16);
    sub_1000471E8((void *)&_mh_execute_header, v14, v17, "Received request for unregistering all notification subscriptions");
    sub_100012FA4();
  }

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  sub_100027A84(0, (unint64_t *)&unk_100063E50);
  sub_100047244();
  id v18 = sub_100043E54();
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  id v19 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_100005370((void *)(v3 + OBJC_IVAR____TtC8weatherd20NotificationsManager_precipitationNotificationsManager), *(void *)(v3 + OBJC_IVAR____TtC8weatherd20NotificationsManager_precipitationNotificationsManager + 24));
  dispatch thunk of PrecipitationNotificationsManagerType.unregister()();
  sub_100005370((void *)(v3 + OBJC_IVAR____TtC8weatherd20NotificationsManager_severeNotificationsManager), *(void *)(v3 + OBJC_IVAR____TtC8weatherd20NotificationsManager_severeNotificationsManager + 24));
  sub_1000203FC();
  when2<A, B>(on:_:_:)();

  swift_release();
  swift_release();
  uint64_t v20 = (void *)sub_1000471B4();
  void v20[2] = sub_100046F7C;
  v20[3] = v13;
  v20[4] = v18;
  swift_retain();
  id v21 = v18;
  id v22 = (void *)zalgo.getter();
  Promise.always(on:closure:)();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
}

void sub_100045EB8(uint64_t a1, void (**a2)(void))
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_100046FFC;
  *(void *)(v11 + 24) = v10;
  _Block_copy(a2);
  swift_retain();
  static Logger.notifications.getter();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = v4;
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Received request for validating channel subscriptions", v14, 2u);
    uint64_t v4 = v25;
    swift_slowDealloc();
  }

  os_log_type_t v15 = *(void (**)(char *, uint64_t))(v4 + 8);
  v15(v9, v3);
  if (WDWeatherAppIsInstalled())
  {
    sub_100027A84(0, (unint64_t *)&unk_100063E50);
    id v16 = sub_100043E54();
    sub_100027A84(0, (unint64_t *)&qword_100063FE0);
    uint64_t v17 = (void *)static OS_dispatch_queue.notifications.getter();
    type metadata accessor for NotificationsManager();
    firstly<A, B>(on:disposeOn:closure:)();

    id v18 = (void *)swift_allocObject();
    void v18[2] = sub_10004712C;
    void v18[3] = v11;
    v18[4] = v16;
    swift_retain();
    id v19 = v16;
    uint64_t v20 = (void *)zalgo.getter();
    Promise.always(on:closure:)();
    swift_release();
    swift_release();

    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    static Logger.notifications.getter();
    id v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Weather app was uninstalled; rejecting validation request",
        v23,
        2u);
      swift_slowDealloc();
    }

    v15(v7, v3);
    a2[2](a2);
    [self neSessionClearCaches];
    swift_release();
    swift_release();
  }
  _Block_release(a2);
}

void NotificationsManager.validate(with:)()
{
  sub_100027CCC();
  sub_100047204();
  type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  sub_100047198();
  __chkstk_darwin(v4);
  sub_1000471CC();
  uint64_t v5 = sub_100047270();
  sub_100047224(v5);
  static Logger.notifications.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (_WORD *)sub_100027E10();
    sub_1000471DC(v8);
    sub_100047250((void *)&_mh_execute_header, v9, v10, "Received request for validating channel subscriptions");
    sub_100012FA4();
  }

  uint64_t v11 = *(void (**)(void))(v2 + 8);
  sub_100015E24();
  v11();
  if (WDWeatherAppIsInstalled())
  {
    sub_100027A84(0, (unint64_t *)&unk_100063E50);
    sub_100047244();
    id v12 = sub_100043E54();
    sub_100027A84(0, (unint64_t *)&qword_100063FE0);
    os_log_type_t v13 = (void *)static OS_dispatch_queue.notifications.getter();
    firstly<A, B>(on:disposeOn:closure:)();

    uint64_t v14 = (void *)sub_1000471B4();
    void v14[2] = sub_10004712C;
    void v14[3] = v0;
    v14[4] = v12;
    swift_retain();
    id v15 = v12;
    id v16 = (void *)zalgo.getter();
    Promise.always(on:closure:)();
    swift_release();

    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    static Logger.notifications.getter();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (_WORD *)sub_100027E10();
      sub_1000471DC(v19);
      sub_1000471E8((void *)&_mh_execute_header, v17, v20, "Weather app was uninstalled; rejecting validation request");
      sub_100012FA4();
    }

    sub_100015E24();
    uint64_t v21 = ((uint64_t (*)(void))v11)();
    v22(v21);
    [self neSessionClearCaches];
    swift_release();
  }
  sub_100027CA4();
}

id sub_100046588(void (*a1)(void))
{
  a1();
  uint64_t v1 = self;
  return [v1 neSessionClearCaches];
}

uint64_t sub_1000465D4(uint64_t a1)
{
  return sub_100020218();
}

void sub_10004662C(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  uint64_t v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a1;
  a4();
  _Block_release(v6);
}

unint64_t sub_1000466A0()
{
  unint64_t result = qword_100063E40;
  if (!qword_100063E40)
  {
    sub_1000080E4(&qword_100063E38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063E40);
  }
  return result;
}

uint64_t sub_1000466F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000467C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000128A4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000128A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008AD0((uint64_t)v12);
  return v7;
}

uint64_t sub_1000467C8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100046920((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_1000469F8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_100046920(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_1000469F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100046A90(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100046C6C(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100046C6C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100046A90(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_100046C04(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_100046C04(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100005280(&qword_100063F18);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100046C6C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005280(&qword_100063F18);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  id v12 = v10 + 32;
  os_log_type_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100046E1C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100046D44(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100046D44(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_100046E1C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_100046EAC()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100046EE8(uint64_t a1)
{
  sub_100044C50(a1, *(void (**)(Class))(v1 + 16));
}

id sub_100046F0C(uint64_t a1)
{
  return sub_100045574(a1, *(void (**)(void))(v1 + 16));
}

void sub_100046F2C(uint64_t a1)
{
  sub_100045650(a1, *(void (**)(Class))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100046F50()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

id sub_100046F7C()
{
  return sub_100046588(*(void (**)(void))(v0 + 16));
}

uint64_t type metadata accessor for NotificationsManager()
{
  return self;
}

uint64_t sub_100046FC4()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100046FFC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100047010()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100047034()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100047074(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005280(&qword_1000626D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000470DC()
{
  unint64_t result = qword_100063F10;
  if (!qword_100063F10)
  {
    type metadata accessor for Date();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063F10);
  }
  return result;
}

void sub_100047164(uint64_t a1)
{
}

void sub_10004717C(uint64_t a1)
{
}

uint64_t sub_1000471B4()
{
  return swift_allocObject();
}

_WORD *sub_1000471DC(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

void sub_1000471E8(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

uint64_t sub_100047204()
{
  return swift_getObjectType();
}

uint64_t sub_100047224(uint64_t a1)
{
  *(void *)(v3 - 88) = v2;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v1;
  return swift_retain();
}

void sub_100047250(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 2u);
}

uint64_t sub_100047270()
{
  return swift_allocObject();
}

void *sub_10004728C()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for APSEnvironment();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC8weatherd20APSConnectionManager_lock);
  UnfairLock.lock()();
  size_t v11 = *(void **)(v1 + OBJC_IVAR____TtC8weatherd20APSConnectionManager__connection);
  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    v26[1] = v10;
    uint64_t v27 = v2;
    uint64_t v28 = v3;
    v26[0] = OBJC_IVAR____TtC8weatherd20APSConnectionManager__connection;
    static Settings.WeatherEnvironment.apsEnvironment.getter();
    sub_100049DA8(&qword_100063FD8, v13, (void (*)(uint64_t))type metadata accessor for APSConnectionManager);
    Configurable.setting<A>(_:)();
    swift_release();
    uint64_t v14 = APSEnvironment.rawValue.getter();
    unint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    static Logger.notifications.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)id v19 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_1000466F4(v14, v16, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Setting up APSConnction with environment %s", v19, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v27);
    sub_100027A84(0, (unint64_t *)&qword_100063FE0);
    uint64_t v20 = (void *)static OS_dispatch_queue.notifications.getter();
    id v21 = objc_allocWithZone((Class)APSConnection);
    id v22 = sub_10004988C(v14, v16, 0xD000000000000015, 0x8000000100054190, v20);
    size_t v11 = v22;
    if (v22)
    {
      [v22 setDelegate:v1];
      sub_1000499E0((uint64_t)&off_10005E330, v11);
      uint64_t v23 = *(void **)(v1 + v26[0]);
      *(void *)(v1 + v26[0]) = v11;
      id v24 = v11;
    }
  }
  UnfairLock.unlock()();
  return v11;
}

id sub_100047678()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = type metadata accessor for PromiseDeduperFlags();
  __chkstk_darwin(v2);
  sub_10000F9B8();
  uint64_t v3 = type metadata accessor for UnfairLock.Options();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = OBJC_IVAR____TtC8weatherd20APSConnectionManager_lock;
  char v5 = v0;
  static UnfairLock.Options.dataSynchronization.getter();
  type metadata accessor for UnfairLock();
  swift_allocObject();
  *(void *)&v0[v4] = UnfairLock.init(options:)();
  *(void *)&v5[OBJC_IVAR____TtC8weatherd20APSConnectionManager_observers] = _swiftEmptyArrayStorage;
  uint64_t v6 = OBJC_IVAR____TtC8weatherd20APSConnectionManager_deduper;
  int64_t v9 = _swiftEmptyArrayStorage;
  sub_100049DA8((unint64_t *)&qword_100064010, 255, (void (*)(uint64_t))&type metadata accessor for PromiseDeduperFlags);
  sub_100005280(&qword_100063310);
  sub_10002E1FC((unint64_t *)&qword_100064020, &qword_100063310);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_100005280(&qword_100064028);
  swift_allocObject();
  *(void *)&v5[v6] = PromiseDeduper.init(options:)();
  *(void *)&v5[OBJC_IVAR____TtC8weatherd20APSConnectionManager__connection] = 0;

  v8.receiver = v5;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, "init");
}

uint64_t type metadata accessor for APSConnectionManager()
{
  return self;
}

uint64_t sub_10004792C()
{
  swift_getObjectType();
  return Configurable.setting<A>(_:)();
}

uint64_t sub_100047984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t ObjectType = swift_getObjectType();
  return Configurable.setting<A>(_:defaultValue:)(a1, a2, ObjectType, a6);
}

uint64_t sub_1000479EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t ObjectType = swift_getObjectType();
  return Configurable.setting<A>(_:_:)(a1, a2, a3, ObjectType, a7);
}

uint64_t sub_100047A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t ObjectType = swift_getObjectType();
  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, ObjectType, a8);
}

void sub_100047ADC(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_100015DF8();
  uint64_t v33 = v7;
  __chkstk_darwin(v8);
  sub_100049FB8();
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  int64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  uint64_t v34 = v5;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v32 = v3;
    size_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = (void *)swift_slowAlloc();
    *(_DWORD *)size_t v11 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v12 = Array.description.getter();
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    sub_1000466F4(v12, v14, (uint64_t *)&v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Attempting to subscribe to channels %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    sub_100012FA4();
    sub_100012FA4();

    unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    uint64_t v16 = v32;
    v15(v1, v32);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v15(v1, v3);
    uint64_t v16 = v3;
  }
  uint64_t v17 = sub_10004728C();
  if (!v17)
  {
    sub_100049A4C();
    swift_allocError();
    *id v22 = 0;
    swift_willThrow();
    return;
  }
  os_log_type_t v18 = v17;
  id v19 = (void *)sub_100049A98(v17);
  sub_100005280(&qword_100062A68);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100051770;
  *(void *)(inited + 32) = 0xD000000000000011;
  *(void *)(inited + 40) = 0x8000000100052A90;
  if (v19)
  {
    char v21 = sub_100023F5C(v19, (void *)inited);
    swift_setDeallocating();
    sub_10004999C();
    swift_bridgeObjectRelease();
    if (v21) {
      goto LABEL_13;
    }
  }
  else
  {
    swift_setDeallocating();
    sub_10004999C();
  }
  uint64_t v23 = v33;
  static Logger.notifications.getter();
  id v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "APSConnection configuration error: com.apple.weather is not an enabled topic", v26, 2u);
    uint64_t v23 = v33;
    sub_100012FA4();
  }

  v15(v23, v16);
LABEL_13:
  uint64_t v27 = *(void *)(a1 + 16);
  uint64_t v28 = _swiftEmptyArrayStorage;
  if (v27)
  {
    uint64_t v35 = _swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v29 = (uint64_t *)(a1 + 40);
    while (1)
    {
      uint64_t v30 = *(v29 - 1);
      uint64_t v31 = *v29;
      objc_allocWithZone((Class)PKPublicChannel);
      swift_bridgeObjectRetain_n();
      if (!sub_100049938(v30, v31)) {
        break;
      }
      v29 += 2;
      swift_bridgeObjectRelease();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      if (!--v27)
      {
        uint64_t v28 = v35;
        goto LABEL_18;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_18:
    sub_100049AF0((uint64_t)v28, 0xD000000000000011, 0x8000000100052A90, v18, (SEL *)&selRef_subscribeToChannels_forTopic_);
  }
}

void sub_100047F3C(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  os_log_type_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.notifications.getter();
  swift_bridgeObjectRetain_n();
  size_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  BOOL v13 = os_log_type_enabled(v11, v12);
  uint64_t v32 = v2;
  if (v13)
  {
    uint64_t v31 = v3;
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = (void *)swift_slowAlloc();
    uint64_t v34 = v29;
    *(_DWORD *)unint64_t v14 = 136446210;
    uint64_t v28 = v14 + 4;
    swift_bridgeObjectRetain();
    uint64_t v15 = Array.description.getter();
    uint64_t v30 = v5;
    uint64_t v16 = v15;
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    uint64_t v33 = sub_1000466F4(v16, v18, (uint64_t *)&v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Attempting to unsubscribe from channels %{public}s", v14, 0xCu);
    swift_arrayDestroy();
    sub_100012FA4();
    sub_100012FA4();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v30);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  }
  id v19 = sub_10004728C();
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)(a1 + 16);
    id v22 = _swiftEmptyArrayStorage;
    if (v21)
    {
      uint64_t v34 = _swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)();
      uint64_t v23 = (uint64_t *)(a1 + 40);
      while (1)
      {
        uint64_t v24 = *(v23 - 1);
        uint64_t v25 = *v23;
        id v26 = objc_allocWithZone((Class)PKPublicChannel);
        swift_bridgeObjectRetain_n();
        if (!sub_100049938(v24, v25)) {
          break;
        }
        v23 += 2;
        swift_bridgeObjectRelease();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        if (!--v21)
        {
          id v22 = v34;
          goto LABEL_10;
        }
      }
      __break(1u);
    }
    else
    {
LABEL_10:
      sub_100049AF0((uint64_t)v22, 0xD000000000000011, 0x8000000100052A90, v20, (SEL *)&selRef_unsubscribeFromChannels_forTopic_);
    }
  }
  else
  {
    sub_100049A4C();
    swift_allocError();
    void *v27 = 0;
    swift_willThrow();
  }
}

uint64_t sub_100048260()
{
  uint64_t v1 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100027C54();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Fetching subscribed channels", v7, 2u);
    sub_100012FA4();
  }

  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  __chkstk_darwin(v8);
  uint64_t v9 = PromiseDeduper.promise(key:createBlock:)();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1000483D8()
{
  return Promise.init(resolver:)();
}

void sub_100048438(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  uint64_t v9 = sub_10004728C();
  if (v9)
  {
    os_log_type_t v10 = v9;
    size_t v11 = (void *)swift_allocObject();
    v11[2] = a3;
    v11[3] = a4;
    void v11[4] = sub_100049BF4;
    v11[5] = v8;
    v14[4] = sub_100049C6C;
    v14[5] = v11;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 1107296256;
    void v14[2] = sub_100048824;
    void v14[3] = &unk_10005F880;
    os_log_type_t v12 = _Block_copy(v14);
    swift_retain();
    swift_release();
    sub_100049C90(0xD000000000000011, 0x8000000100052A90, (uint64_t)v12, v10);
    _Block_release(v12);
  }
  else
  {
    swift_release();
    sub_100049A4C();
    swift_allocError();
    *BOOL v13 = 0;
    a3();
    swift_errorRelease();
  }
}

uint64_t sub_1000485E8(unint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t (*a5)(void *))
{
  if (a2)
  {
    sub_100049A4C();
    uint64_t v7 = swift_allocError();
    *uint64_t v8 = a2;
    swift_errorRetain();
    a3(v7);
    return swift_errorRelease();
  }
  if (!a1) {
    return a5(0);
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v11 = result;
    if (result) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v11)
    {
LABEL_8:
      if (v11 < 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v12 = 0;
      BOOL v13 = _swiftEmptyArrayStorage;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v14 = *(id *)(a1 + 8 * v12 + 32);
        }
        uint64_t v15 = v14;
        uint64_t v16 = sub_100049D04(v14);
        uint64_t v18 = v17;

        if (v18)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_100033334(0, v13[2] + 1, 1, (uint64_t)v13);
            BOOL v13 = v22;
          }
          unint64_t v20 = v13[2];
          unint64_t v19 = v13[3];
          if (v20 >= v19 >> 1)
          {
            sub_100033334(v19 > 1, v20 + 1, 1, (uint64_t)v13);
            BOOL v13 = v23;
          }
          v13[2] = v20 + 1;
          uint64_t v21 = &v13[2 * v20];
          v21[4] = v16;
          v21[5] = v18;
        }
        ++v12;
      }
      while (v11 != v12);
      goto LABEL_24;
    }
  }
  BOOL v13 = _swiftEmptyArrayStorage;
LABEL_24:
  swift_bridgeObjectRelease();
  a5(v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100048824(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_100027A84(0, &qword_100063FD0);
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000488C8()
{
  swift_getObjectType();
  uint64_t v1 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100027C54();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unsubscribing from all subscribed channels", v7, 2u);
    sub_100012FA4();
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  uint64_t v8 = (void *)static OS_dispatch_queue.notifications.getter();
  sub_100005280(&qword_100064030);
  firstly<A, B>(on:disposeOn:closure:)();

  uint64_t v9 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v10 = Promise.then<A, B>(on:disposeOn:closure:)();
  swift_release();

  return v10;
}

uint64_t sub_100048A80()
{
  return sub_100048260();
}

void sub_100048AAC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (!v2 || (sub_100047F3C(v2), !v1))
  {
    sub_100005280(&qword_100062850);
    swift_allocObject();
    Promise.init(value:)();
  }
}

void sub_100048B0C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_10000F9B8();
  uint64_t v8 = v7 - v6;
  UnfairLock.lock()();
  uint64_t v9 = OBJC_IVAR____TtC8weatherd20APSConnectionManager__connection;
  uint64_t v10 = *(void **)(v0 + OBJC_IVAR____TtC8weatherd20APSConnectionManager__connection);
  if (v10)
  {
    id v11 = v10;
    static Logger.notifications.getter();
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Invalidating APSConnection", v14, 2u);
      sub_100012FA4();
    }

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
    sub_1000499E0((uint64_t)_swiftEmptyArrayStorage, v11);
    [v11 setDelegate:0];
    [v11 shutdown];

    uint64_t v15 = *(void **)(v1 + v9);
    *(void *)(v1 + v9) = 0;
  }
  UnfairLock.unlock()();
}

void sub_100048D34(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  sub_1000053F4();
  uint64_t v53 = v5;
  __chkstk_darwin(v6);
  sub_100013014();
  uint64_t v51 = v7;
  uint64_t v52 = type metadata accessor for DispatchQoS();
  sub_1000053F4();
  uint64_t v50 = v8;
  __chkstk_darwin(v9);
  sub_100013014();
  uint64_t v49 = v10;
  uint64_t v11 = type metadata accessor for APSMessage();
  __chkstk_darwin(v11 - 8);
  sub_10000F9B8();
  id v14 = (uint64_t *)(v13 - v12);
  uint64_t v15 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v56 = v16;
  __chkstk_darwin(v17);
  sub_100015DF8();
  uint64_t v47 = v18;
  __chkstk_darwin(v19);
  sub_100049FB8();
  static Logger.notifications.getter();
  unint64_t v20 = a2;
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  uint64_t v58 = (uint64_t)v14;
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 134349056;
    if (!a2)
    {
LABEL_16:
      __break(1u);
      return;
    }
    uint64_t v24 = v23;
    sub_100049FA4((uint64_t)[v20 identifier]);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Received incoming message: %{public}lu", v24, 0xCu);
    sub_100012FA4();
    id v14 = (uint64_t *)v58;
  }
  else
  {

    uint64_t v21 = v20;
  }
  uint64_t v48 = v4;

  uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
  v25(v2, v15);
  UnfairLock.lock()();
  id v26 = (uint64_t *)(v54 + OBJC_IVAR____TtC8weatherd20APSConnectionManager_observers);
  swift_beginAccess();
  uint64_t v27 = *v26;
  swift_bridgeObjectRetain();
  UnfairLock.unlock()();
  if (!a2)
  {
    __break(1u);
    goto LABEL_16;
  }
  sub_100049D04(v20);
  uint64_t v29 = v28;
  swift_bridgeObjectRelease();
  uint64_t v55 = v27;
  if (!v29)
  {
    static Logger.notifications.getter();
    uint64_t v30 = v20;
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = v14;
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 134349056;
      sub_100049FA4((uint64_t)[v30 identifier]);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Received incoming message without channel identifier: %{public}lu", v34, 0xCu);
      id v14 = v33;
      uint64_t v27 = v55;
      sub_100012FA4();
    }
    else
    {

      uint64_t v31 = v30;
    }

    v25(v47, v15);
  }
  sub_100009164(v20, v14);
  uint64_t v35 = dispatch_group_create();
  sub_100027A84(0, (unint64_t *)&unk_100063E50);
  id v57 = sub_100043E54();
  uint64_t v36 = *(void *)(v27 + 16);
  if (v36)
  {
    uint64_t v37 = (uint64_t *)(v55 + 40);
    do
    {
      uint64_t v38 = *v37;
      swift_unknownObjectRetain();
      dispatch_group_enter(v35);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v40 = swift_allocObject();
      *(void *)(v40 + 16) = v35;
      uint64_t v41 = *(void (**)(uint64_t, void (*)(), uint64_t, uint64_t, uint64_t))(v38 + 8);
      uint64_t v42 = v35;
      v41(v58, sub_100049DA0, v40, ObjectType, v38);
      swift_unknownObjectRelease();
      swift_release();
      v37 += 2;
      --v36;
    }
    while (v36);
  }
  swift_bridgeObjectRelease();
  [self neSessionClearCaches];
  sub_100027A84(0, (unint64_t *)&qword_100063FE0);
  uint64_t v43 = (void *)static OS_dispatch_queue.notifications.getter();
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = v57;
  aBlock[4] = nullsub_1;
  aBlock[5] = v44;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000308F0;
  aBlock[3] = &unk_10005F8F8;
  int v45 = _Block_copy(aBlock);
  id v46 = v57;
  static DispatchQoS.unspecified.getter();
  sub_100049DA8(&qword_100062F80, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005280((uint64_t *)&unk_100064000);
  sub_10002E1FC(&qword_100062F88, (uint64_t *)&unk_100064000);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_group.notify(qos:flags:queue:execute:)();
  _Block_release(v45);

  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v51, v48);
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v52);
  sub_10003F54C(v58);
  swift_release();
}

void sub_100049438(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for Logger();
  sub_1000053F4();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_100027C54();
  swift_bridgeObjectRetain_n();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v9, v10))
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
LABEL_5:
    UnfairLock.lock()();
    uint64_t v15 = (uint64_t *)(v3 + OBJC_IVAR____TtC8weatherd20APSConnectionManager_observers);
    swift_beginAccess();
    uint64_t v16 = *v15;
    swift_bridgeObjectRetain();
    UnfairLock.unlock()();
    if (!a2)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    uint64_t v33 = a2 & 0xFFFFFFFFFFFFFF8;
    if (a2 >> 62)
    {
LABEL_24:
      swift_bridgeObjectRetain();
      uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
      if (v17)
      {
LABEL_8:
        unint64_t v18 = 0;
        uint64_t v19 = *(void *)(v16 + 16);
        unint64_t v32 = a2 + 32;
        uint64_t v37 = (uint64_t *)(v16 + 40);
        unint64_t v38 = a2 & 0xC000000000000001;
        unint64_t v34 = a2;
        uint64_t v35 = v17;
        while (1)
        {
          if (v38)
          {
            id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if (v18 >= *(void *)(v33 + 16)) {
              goto LABEL_23;
            }
            id v20 = *(id *)(v32 + 8 * v18);
          }
          uint64_t v21 = v20;
          if (__OFADD__(v18++, 1))
          {
            __break(1u);
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
          if (v19) {
            break;
          }

LABEL_20:
          if (v18 == v17) {
            goto LABEL_21;
          }
        }
        uint64_t v23 = v16;
        swift_bridgeObjectRetain();
        uint64_t v24 = v37;
        uint64_t v25 = v19;
        while (1)
        {
          uint64_t v26 = *v24;
          swift_unknownObjectRetain();
          uint64_t v27 = sub_100049D04(v21);
          if (!v28) {
            break;
          }
          uint64_t v29 = v27;
          uint64_t v30 = v28;
          uint64_t ObjectType = swift_getObjectType();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 16))(v29, v30, ObjectType, v26);
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          v24 += 2;
          if (!--v19)
          {

            uint64_t v16 = v23;
            swift_bridgeObjectRelease();
            a2 = v34;
            uint64_t v17 = v35;
            uint64_t v19 = v25;
            goto LABEL_20;
          }
        }
        __break(1u);
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v17 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v17) {
        goto LABEL_8;
      }
    }
LABEL_21:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v36 = v5;
  uint64_t v11 = (uint8_t *)swift_slowAlloc();
  v39[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v11 = 136446210;
  if (a2)
  {
    sub_100027A84(0, &qword_100063FF8);
    swift_bridgeObjectRetain();
    uint64_t v12 = Array.description.getter();
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    sub_1000466F4(v12, v14, v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Failed to subscribe to channels with failures: %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    sub_100012FA4();
    sub_100012FA4();

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v36);
    uint64_t v3 = v2;
    goto LABEL_5;
  }
LABEL_28:
  __break(1u);
}

id sub_10004988C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a2)
  {
    NSString v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    NSString v9 = 0;
    goto LABEL_6;
  }
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
LABEL_6:
  id v10 = [v5 initWithEnvironmentName:v8 namedDelegatePort:v9 queue:a5];

  return v10;
}

id sub_100049938(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  id v4 = [v2 initWithChannelID:v3];

  return v4;
}

uint64_t sub_10004999C()
{
  swift_arrayDestroy();
  return _swift_deallocClassInstance(v0, 32, 7);
}

void sub_1000499E0(uint64_t a1, void *a2)
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [a2 _setEnabledTopics:isa];
}

unint64_t sub_100049A4C()
{
  unint64_t result = qword_100063FC8;
  if (!qword_100063FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063FC8);
  }
  return result;
}

uint64_t sub_100049A98(void *a1)
{
  id v1 = [a1 enabledTopics];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

void sub_100049AF0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, SEL *a5)
{
  sub_100027A84(0, &qword_100063FD0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  objc_msgSend(a4, *a5, isa, v8);
}

uint64_t sub_100049BAC()
{
  return sub_1000483D8();
}

void sub_100049BB4(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
}

uint64_t sub_100049BBC()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100049BF4(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_100049C2C()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100049C6C(unint64_t a1, uint64_t a2)
{
  return sub_1000485E8(a1, a2, *(void (**)(uint64_t))(v2 + 16), *(void *)(v2 + 24), *(uint64_t (**)(void *))(v2 + 32));
}

uint64_t sub_100049C78(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100049C88()
{
  return swift_release();
}

void sub_100049C90(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [a4 getRegisteredChannelsForTopic:v6 withCompletion:a3];
}

uint64_t sub_100049D04(void *a1)
{
  id v1 = [a1 channelID];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_100049D68()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100049DA0()
{
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

uint64_t sub_100049DA8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for APSConnectionManager.Errors(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  swift_errorRetain();
  *a1 = v3;
  return a1;
}

uint64_t destroy for APSConnectionManager.Errors()
{
  return swift_errorRelease();
}

void *assignWithCopy for APSConnectionManager.Errors(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  swift_errorRetain();
  *a1 = v3;
  swift_errorRelease();
  return a1;
}

void *initializeWithTake for APSConnectionManager.Errors(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *assignWithTake for APSConnectionManager.Errors(void *a1, void *a2)
{
  *a1 = *a2;
  swift_errorRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for APSConnectionManager.Errors(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for APSConnectionManager.Errors(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_100049F4C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100049F64(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for APSConnectionManager.Errors()
{
  return &type metadata for APSConnectionManager.Errors;
}

uint64_t sub_100049FA4(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return v1 - 160;
}

id sub_100049FCC(uint64_t a1)
{
  uint64_t v2 = sub_100005280(&qword_1000626D8);
  __chkstk_darwin(v2 - 8);
  sub_10000F9B8();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = type metadata accessor for Date();
  sub_1000053F4();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_10000F9B8();
  uint64_t v12 = v11 - v10;
  id v13 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  NSString v14 = String._bridgeToObjectiveC()();
  sub_10004C410((uint64_t)v14, "setTitle:");

  NSString v15 = String._bridgeToObjectiveC()();
  sub_10004C410((uint64_t)v15, "setSubtitle:");

  NSString v16 = String._bridgeToObjectiveC()();
  sub_10004C410((uint64_t)v16, "setBody:");

  NSString v17 = String._bridgeToObjectiveC()();
  sub_10004C410((uint64_t)v17, "setThreadIdentifier:");

  if (*(void *)(a1 + 64)) {
    uint64_t v18 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v18 = Dictionary.init(dictionaryLiteral:)();
  }
  swift_bridgeObjectRetain();
  sub_10004B0E0(v18);
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t v20 = swift_bridgeObjectRelease();
  sub_10004C410(v20, "setUserInfo:");

  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v21 = 3;
  }
  else {
    uint64_t v21 = 2;
  }
  [v13 setInterruptionLevel:v21];
  id v22 = [self defaultSound];
  sub_10004C410((uint64_t)v22, "setSound:");

  NSString v23 = String._bridgeToObjectiveC()();
  sub_10004C410((uint64_t)v23, "setCategoryIdentifier:");

  uint64_t v24 = type metadata accessor for SevereNotificationContent();
  sub_100047074(a1 + *(int *)(v24 + 40), v5);
  if (sub_1000093BC(v5, 1, v6) == 1)
  {

    sub_10004B4EC(a1);
    sub_100042C1C(v5, &qword_1000626D8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v12, v5, v6);
    Class v25 = Date._bridgeToObjectiveC()().super.isa;
    [v13 setExpirationDate:v25];

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
    sub_10004B4EC(a1);
  }
  return v13;
}

uint64_t sub_10004A2FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005280(&qword_1000626D8);
  __chkstk_darwin(v4 - 8);
  sub_10000F9B8();
  uint64_t v7 = v6 - v5;
  sub_100005280(&qword_100064040);
  sub_1000053F4();
  __chkstk_darwin(v8);
  sub_10000F9B8();
  uint64_t v21 = type metadata accessor for SevereNotificationContent();
  __chkstk_darwin(v21);
  sub_10000F9B8();
  uint64_t v11 = v10 - v9;
  uint64_t v22 = (uint64_t)a1;
  sub_100005370(a1, a1[3]);
  sub_10004B548();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100008AD0((uint64_t)a1);
  }
  char v26 = 0;
  *(void *)uint64_t v11 = sub_10004C3F4((uint64_t)&v26);
  *(void *)(v11 + 8) = v12;
  char v25 = 1;
  *(void *)(v11 + 16) = sub_10004C3F4((uint64_t)&v25);
  *(void *)(v11 + 24) = v13;
  char v24 = 2;
  *(void *)(v11 + 32) = sub_10004C3F4((uint64_t)&v24);
  *(void *)(v11 + 40) = v14;
  char v23 = 3;
  *(void *)(v11 + 48) = sub_10004C3F4((uint64_t)&v23);
  *(void *)(v11 + 56) = v15;
  *(unsigned char *)(v11 + 72) = KeyedDecodingContainer.decode(_:forKey:)() & 1;
  type metadata accessor for Date();
  sub_10004B688(&qword_100063D50);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  sub_100015B40(v7, v11 + *(int *)(v21 + 40));
  uint64_t v16 = sub_10004A6C4();
  uint64_t v17 = sub_10004C3BC();
  v18(v17);
  *(void *)(v11 + 64) = v16;
  sub_10004B594(v11, a2);
  sub_100008AD0(v22);
  return sub_10004B4EC(v11);
}

uint64_t sub_10004A6C4()
{
  uint64_t v8 = Dictionary.init(dictionaryLiteral:)();
  sub_100005280(&qword_100064040);
  uint64_t v1 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  if (v0) {
    return swift_bridgeObjectRelease();
  }
  if (v2)
  {
    *((void *)&v7 + 1) = &type metadata for String;
    *(void *)&long long v6 = v1;
    *((void *)&v6 + 1) = v2;
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
  }
  sub_100014D34((uint64_t)&v6, 0x6E6F697461636F4CLL, 0xE800000000000000);
  uint64_t v3 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  if (v4)
  {
    *((void *)&v7 + 1) = &type metadata for String;
    *(void *)&long long v6 = v3;
    *((void *)&v6 + 1) = v4;
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
  }
  sub_100014D34((uint64_t)&v6, 0x55736C6961746544, 0xEA00000000004C52);
  return v8;
}

uint64_t sub_10004A81C(void *a1)
{
  uint64_t v3 = v1;
  sub_100005280(&qword_100064050);
  sub_1000053F4();
  __chkstk_darwin(v5);
  sub_10000F9B8();
  sub_100005370(a1, a1[3]);
  sub_10004B548();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v6 = *v3;
  uint64_t v7 = v3[1];
  LOBYTE(v20[0]) = 0;
  sub_10004C3D4(v6, v7);
  if (v2) {
    goto LABEL_12;
  }
  uint64_t v8 = v3[2];
  uint64_t v9 = v3[3];
  LOBYTE(v20[0]) = 1;
  sub_10004C3D4(v8, v9);
  uint64_t v10 = v3[4];
  uint64_t v11 = v3[5];
  LOBYTE(v20[0]) = 2;
  sub_10004C3D4(v10, v11);
  sub_10004C3D4(v3[6], v3[7]);
  KeyedEncodingContainer.encode(_:forKey:)();
  type metadata accessor for SevereNotificationContent();
  LOBYTE(v20[0]) = 7;
  sub_100005280(&qword_1000626D8);
  sub_10004B5F8();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  uint64_t v12 = v3[8];
  if (!v12)
  {
LABEL_12:
    uint64_t v13 = sub_10004C428();
    return v14(v13);
  }
  sub_100010AB8(0x6E6F697461636F4CLL, 0xE800000000000000, v12, &v18);
  if (v19)
  {
    sub_100015DE8(&v18, v20);
    sub_1000128A4((uint64_t)v20, (uint64_t)&v18);
    if (swift_dynamicCast())
    {
      LOBYTE(v18) = 5;
      KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
      sub_100008AD0((uint64_t)v20);
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_100008AD0((uint64_t)v20);
    }
  }
  else
  {
    sub_100042C1C((uint64_t)&v18, (uint64_t *)&unk_1000628F0);
  }
  sub_100010AB8(0x55736C6961746544, 0xEA00000000004C52, v12, &v18);
  if (v19)
  {
    sub_100015DE8(&v18, v20);
    sub_1000128A4((uint64_t)v20, (uint64_t)&v18);
    if (swift_dynamicCast())
    {
      LOBYTE(v18) = 6;
      KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
      swift_bridgeObjectRelease();
    }
    sub_100008AD0((uint64_t)v20);
    goto LABEL_12;
  }
  uint64_t v16 = sub_10004C428();
  v17(v16);
  return sub_100042C1C((uint64_t)&v18, (uint64_t *)&unk_1000628F0);
}

uint64_t sub_10004AB60(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x656C746974627573 && a2 == 0xE800000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 2036625250 && a2 == 0xE400000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x80000001000541F0 {
             || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      }
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x6C61636974697263 && a2 == 0xE800000000000000;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 0x6E6F697461636F6CLL && a2 == 0xE800000000000000;
          if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x55736C6961746564 && a2 == 0xEA00000000004C52;
            if (v10 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0x6974617269707865 && a2 == 0xEE00656D69546E6FLL)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              if (v12) {
                return 7;
              }
              else {
                return 8;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_10004AEAC()
{
  return 8;
}

unint64_t sub_10004AEB4(char a1)
{
  unint64_t result = 0x656C746974;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C746974627573;
      break;
    case 2:
      unint64_t result = 2036625250;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0x6C61636974697263;
      break;
    case 5:
      unint64_t result = 0x6E6F697461636F6CLL;
      break;
    case 6:
      unint64_t result = 0x55736C6961746564;
      break;
    case 7:
      unint64_t result = 0x6974617269707865;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10004AFC0()
{
  return sub_10004AEB4(*v0);
}

uint64_t sub_10004AFC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10004AB60(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10004AFF0()
{
  return sub_1000426E8();
}

uint64_t sub_10004B010@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004AEAC();
  *a1 = result;
  return result;
}

uint64_t sub_10004B038(uint64_t a1)
{
  unint64_t v2 = sub_10004B548();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10004B074(uint64_t a1)
{
  unint64_t v2 = sub_10004B548();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10004B0B0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10004A2FC(a1, a2);
}

uint64_t sub_10004B0C8(void *a1)
{
  return sub_10004A81C(a1);
}

uint64_t sub_10004B0E0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100005280(&qword_100064038);
    unint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  BOOL v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_1000128A4(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v17;
    *((void *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_100015DE8(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_100015DE8(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_100015DE8(v36, v37);
    sub_100015DE8(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v18 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)]) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v20];
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)])) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v6[(v21 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v21;
    uint64_t v26 = v2[6] + 40 * v21;
    *(_OWORD *)uint64_t v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(void *)(v26 + 32) = v31;
    uint64_t result = (uint64_t)sub_100015DE8(&v33, (_OWORD *)(v2[7] + 32 * v21));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v28 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_1000394B0();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SevereNotificationContent()
{
  uint64_t result = qword_1000640B8;
  if (!qword_1000640B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10004B4EC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SevereNotificationContent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10004B548()
{
  unint64_t result = qword_100064048;
  if (!qword_100064048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064048);
  }
  return result;
}

uint64_t sub_10004B594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SevereNotificationContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10004B5F8()
{
  unint64_t result = qword_100064058;
  if (!qword_100064058)
  {
    sub_1000080E4(&qword_1000626D8);
    sub_10004B688(&qword_100063D68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064058);
  }
  return result;
}

uint64_t sub_10004B688(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Date();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SevereNotificationContent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SevereNotificationContent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10004B820);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SevereNotificationContent.CodingKeys()
{
  return &type metadata for SevereNotificationContent.CodingKeys;
}

void *sub_10004B858(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    void *v3 = *a2;
    int v3 = (void *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    uint64_t v7 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v7;
    uint64_t v8 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v8;
    *(void *)(a1 + 64) = a2[8];
    uint64_t v9 = *(int *)(a3 + 40);
    unint64_t v10 = (char *)a2 + v9;
    int64_t v11 = (void *)(a1 + v9);
    *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
    uint64_t v12 = type metadata accessor for Date();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (sub_1000093BC((uint64_t)v10, 1, v12))
    {
      uint64_t v13 = sub_100005280(&qword_1000626D8);
      memcpy(v11, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v11, v10, v12);
      sub_100008CEC((uint64_t)v11, 0, 1, v12);
    }
  }
  return v3;
}

uint64_t sub_10004B9E8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t result = sub_1000093BC(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_10004BAA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v8 = *(int *)(a3 + 40);
  uint64_t v9 = (const void *)(a2 + v8);
  unint64_t v10 = (void *)(a1 + v8);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v11 = type metadata accessor for Date();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (sub_1000093BC((uint64_t)v9, 1, v11))
  {
    uint64_t v12 = sub_100005280(&qword_1000626D8);
    memcpy(v10, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 16))(v10, v9, v11);
    sub_100008CEC((uint64_t)v10, 0, 1, v11);
  }
  return a1;
}

uint64_t sub_10004BBE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for Date();
  int v10 = sub_1000093BC((uint64_t)v7, 1, v9);
  int v11 = sub_1000093BC((uint64_t)v8, 1, v9);
  if (!v10)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = sub_100005280(&qword_1000626D8);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  sub_100008CEC((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t sub_10004BDE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = (const void *)(a2 + v6);
  uint64_t v8 = (void *)(a1 + v6);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v9 = type metadata accessor for Date();
  if (sub_1000093BC((uint64_t)v7, 1, v9))
  {
    uint64_t v10 = sub_100005280(&qword_1000626D8);
    memcpy(v8, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v8, v7, v9);
    sub_100008CEC((uint64_t)v8, 0, 1, v9);
  }
  return a1;
}

uint64_t sub_10004BED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v10 = *(int *)(a3 + 40);
  int v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = type metadata accessor for Date();
  int v14 = sub_1000093BC((uint64_t)v11, 1, v13);
  int v15 = sub_1000093BC((uint64_t)v12, 1, v13);
  if (!v14)
  {
    uint64_t v16 = *(void *)(v13 - 8);
    if (!v15)
    {
      (*(void (**)(void *, const void *, uint64_t))(v16 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v17 = sub_100005280(&qword_1000626D8);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  sub_100008CEC((uint64_t)v11, 0, 1, v13);
  return a1;
}

uint64_t sub_10004C08C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10004C0A0);
}

uint64_t sub_10004C0A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100005280(&qword_1000626D8);
    uint64_t v9 = a1 + *(int *)(a3 + 40);
    return sub_1000093BC(v9, a2, v8);
  }
}

uint64_t sub_10004C12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10004C140);
}

uint64_t sub_10004C140(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100005280(&qword_1000626D8);
    uint64_t v8 = v5 + *(int *)(a4 + 40);
    return sub_100008CEC(v8, a2, a2, v7);
  }
  return result;
}

void sub_10004C1C4()
{
  sub_10004C274();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10004C274()
{
  if (!qword_1000640C8)
  {
    type metadata accessor for Date();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000640C8);
    }
  }
}

unint64_t sub_10004C2D0()
{
  unint64_t result = qword_100064110;
  if (!qword_100064110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064110);
  }
  return result;
}

unint64_t sub_10004C320()
{
  unint64_t result = qword_100064118;
  if (!qword_100064118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064118);
  }
  return result;
}

unint64_t sub_10004C370()
{
  unint64_t result = qword_100064120;
  if (!qword_100064120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064120);
  }
  return result;
}

uint64_t sub_10004C3BC()
{
  return v0;
}

uint64_t sub_10004C3D4(uint64_t a1, uint64_t a2)
{
  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, v3 - 96, v2);
}

uint64_t sub_10004C3F4(uint64_t a1)
{
  return KeyedDecodingContainer.decode(_:forKey:)(a1, v1);
}

id sub_10004C410(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_10004C428()
{
  return v0;
}

const char *String.location.unsafeMutableAddressor()
{
  return "Location";
}

const char *String.detailsURL.unsafeMutableAddressor()
{
  return "DetailsURL";
}

uint64_t static String.location.getter()
{
  return 0x6E6F697461636F4CLL;
}

uint64_t static String.detailsURL.getter()
{
  return 0x55736C6961746544;
}

uint64_t Logger.daemon.unsafeMutableAddressor()
{
  return sub_10004C4D0(&qword_1000624E8, (uint64_t)static Logger.daemon);
}

uint64_t Logger.analytics.unsafeMutableAddressor()
{
  return sub_10004C4D0(&qword_1000624E0, (uint64_t)static Logger.analytics);
}

uint64_t sub_10004C4D0(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  return sub_100005248(v3, a2);
}

uint64_t sub_10004C524(uint64_t a1)
{
  return sub_10004C588(a1, static Logger.analytics);
}

uint64_t static Logger.analytics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10004C624(&qword_1000624E0, (uint64_t)static Logger.analytics, a1);
}

uint64_t sub_10004C56C(uint64_t a1)
{
  return sub_10004C588(a1, static Logger.daemon);
}

uint64_t sub_10004C588(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_10002E24C(v3, a2);
  sub_100005248(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t static Logger.daemon.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10004C624(&qword_1000624E8, (uint64_t)static Logger.daemon, a1);
}

uint64_t sub_10004C624@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = sub_100005248(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_10004C6BC()
{
  uint64_t v85 = type metadata accessor for Urgency();
  sub_1000053F4();
  uint64_t v74 = v1;
  __chkstk_darwin(v2);
  sub_100013014();
  uint64_t v73 = v3;
  uint64_t v4 = sub_100005280(&qword_100062CE8);
  uint64_t v5 = sub_100015EA4(v4);
  __chkstk_darwin(v5);
  sub_100015DF8();
  sub_10004D540();
  __chkstk_darwin(v6);
  uint64_t v88 = (uint64_t)&v71 - v7;
  uint64_t v82 = type metadata accessor for Severity();
  sub_1000053F4();
  uint64_t v81 = v8;
  __chkstk_darwin(v9);
  sub_100013014();
  uint64_t v80 = v10;
  uint64_t v79 = type metadata accessor for Importance();
  sub_1000053F4();
  uint64_t v72 = v11;
  __chkstk_darwin(v12);
  sub_100013014();
  uint64_t v71 = v13;
  uint64_t v14 = sub_100005280(&qword_100064128);
  uint64_t v15 = sub_100015EA4(v14);
  __chkstk_darwin(v15);
  sub_100015DF8();
  sub_10004D540();
  __chkstk_darwin(v16);
  os_log_type_t v84 = (char *)&v71 - v17;
  uint64_t v18 = sub_100005280(&qword_1000626D8);
  uint64_t v19 = sub_100015EA4(v18);
  __chkstk_darwin(v19);
  sub_100015DF8();
  sub_10004D540();
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v87 = (uint64_t)&v71 - v22;
  __chkstk_darwin(v21);
  sub_10004D540();
  __chkstk_darwin(v23);
  uint64_t v86 = (uint64_t)&v71 - v24;
  uint64_t v25 = type metadata accessor for Date();
  sub_1000053F4();
  uint64_t v83 = v26;
  __chkstk_darwin(v27);
  sub_10000F9B8();
  uint64_t v30 = v29 - v28;
  uint64_t v31 = type metadata accessor for Certainty();
  sub_1000053F4();
  uint64_t v33 = v32;
  __chkstk_darwin(v34);
  sub_10004D580();
  uint64_t v35 = sub_100005280(&qword_100064130);
  uint64_t v36 = sub_100015EA4(v35);
  __chkstk_darwin(v36);
  sub_10004D598();
  uint64_t v39 = v37 - v38;
  __chkstk_darwin(v40);
  uint64_t v42 = (char *)&v71 - v41;
  Hasher.init()();
  WeatherAlert.certainty.getter();
  sub_10004D020((uint64_t)v42, v39, &qword_100064130);
  if (sub_1000093BC(v39, 1, v31) == 1)
  {
    sub_10004D568();
  }
  else
  {
    sub_10000FA14();
    v43();
    sub_10004D550();
    sub_10004D084(&qword_100064138, (void (*)(uint64_t))&type metadata accessor for Certainty);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v0, v31);
  }
  uint64_t v44 = v75;
  uint64_t v45 = v83;
  sub_100042C1C((uint64_t)v42, &qword_100064130);
  WeatherAlert.countryCode.getter();
  if (v46)
  {
    sub_10004D550();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_10004D568();
  }
  WeatherAlert.description.getter();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  WeatherAlert.effectiveTime.getter();
  sub_10004D084(&qword_100064140, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_10004D50C();
  uint64_t v47 = *(void (**)(uint64_t))(v45 + 8);
  uint64_t v48 = sub_10004D52C();
  v47(v48);
  WeatherAlert.expireTime.getter();
  sub_10004D50C();
  uint64_t v49 = sub_10004D52C();
  v47(v49);
  uint64_t v50 = v86;
  WeatherAlert.eventEndTime.getter();
  uint64_t v51 = v77;
  sub_10004D020(v50, v77, &qword_1000626D8);
  if (sub_1000093BC(v51, 1, v25) == 1)
  {
    sub_10004D568();
  }
  else
  {
    sub_10000FA14();
    v52();
    sub_10004D550();
    sub_10004D50C();
    ((void (*)(uint64_t, uint64_t))v47)(v30, v25);
  }
  sub_100042C1C(v86, &qword_1000626D8);
  uint64_t v53 = v87;
  WeatherAlert.eventOnsetTime.getter();
  uint64_t v54 = v78;
  sub_10004D020(v53, v78, &qword_1000626D8);
  if (sub_1000093BC(v54, 1, v25) == 1)
  {
    sub_10004D568();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 32))(v30, v54, v25);
    sub_10004D550();
    sub_10004D50C();
    ((void (*)(uint64_t, uint64_t))v47)(v30, v25);
  }
  uint64_t v55 = v85;
  uint64_t v56 = (uint64_t)v84;
  sub_100042C1C(v87, &qword_1000626D8);
  WeatherAlert.importance.getter();
  sub_10004D020(v56, v44, &qword_100064128);
  uint64_t v57 = v79;
  if (sub_1000093BC(v44, 1, v79) == 1)
  {
    sub_10004D568();
  }
  else
  {
    uint64_t v58 = v72;
    uint64_t v59 = v71;
    sub_10000FA14();
    v60();
    sub_10004D550();
    sub_10004D084(&qword_100064148, (void (*)(uint64_t))&type metadata accessor for Importance);
    dispatch thunk of Hashable.hash(into:)();
    uint64_t v61 = v59;
    uint64_t v56 = (uint64_t)v84;
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v61, v57);
    uint64_t v55 = v85;
  }
  uint64_t v62 = v76;
  sub_100042C1C(v56, &qword_100064128);
  WeatherAlert.issuedTime.getter();
  sub_10004D50C();
  uint64_t v63 = sub_10004D52C();
  v47(v63);
  uint64_t v64 = v80;
  WeatherAlert.severity.getter();
  sub_10004D084(&qword_100064150, (void (*)(uint64_t))&type metadata accessor for Severity);
  uint64_t v65 = v82;
  dispatch thunk of Hashable.hash(into:)();
  (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v64, v65);
  WeatherAlert.source.getter();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  uint64_t v66 = v88;
  WeatherAlert.urgency.getter();
  sub_10004D020(v66, v62, &qword_100062CE8);
  if (sub_1000093BC(v62, 1, v55) == 1)
  {
    sub_10004D568();
  }
  else
  {
    uint64_t v67 = v74;
    uint64_t v68 = v73;
    sub_10000FA14();
    v69();
    sub_10004D550();
    sub_10004D084(&qword_100064158, (void (*)(uint64_t))&type metadata accessor for Urgency);
    dispatch thunk of Hashable.hash(into:)();
    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v68, v55);
  }
  sub_100042C1C(v88, &qword_100062CE8);
  memcpy(__dst, __src, sizeof(__dst));
  Swift::Int v89 = Hasher.finalize()();
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10004D020(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005280(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10004D084(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10004D0CC@<X0>(uint64_t a1@<X8>)
{
  v50[22] = a1;
  uint64_t v1 = sub_100005280(&qword_100064128);
  uint64_t v2 = sub_100015EA4(v1);
  __chkstk_darwin(v2);
  sub_100013014();
  v50[21] = v3;
  uint64_t v4 = sub_100005280(&qword_100062CE8);
  uint64_t v5 = sub_100015EA4(v4);
  __chkstk_darwin(v5);
  sub_100013014();
  v50[20] = v6;
  uint64_t v7 = sub_100005280(&qword_100064160);
  uint64_t v8 = sub_100015EA4(v7);
  __chkstk_darwin(v8);
  sub_10000F9B8();
  uint64_t v9 = type metadata accessor for Severity();
  uint64_t v10 = sub_100015EA4(v9);
  __chkstk_darwin(v10);
  sub_10004D580();
  uint64_t v11 = sub_100005280(&qword_100064130);
  uint64_t v12 = sub_100015EA4(v11);
  __chkstk_darwin(v12);
  sub_10000F9B8();
  void v50[2] = v14 - v13;
  uint64_t v15 = sub_100005280(&qword_1000626D8);
  uint64_t v16 = sub_100015EA4(v15);
  __chkstk_darwin(v16);
  sub_10004D598();
  void v50[5] = v17 - v18;
  __chkstk_darwin(v19);
  v50[6] = (char *)v50 - v20;
  uint64_t v21 = type metadata accessor for Date();
  uint64_t v22 = sub_100015EA4(v21);
  __chkstk_darwin(v22);
  sub_10004D598();
  v50[7] = v23 - v24;
  uint64_t v26 = __chkstk_darwin(v25);
  v50[8] = (char *)v50 - v27;
  __chkstk_darwin(v26);
  v50[9] = (char *)v50 - v28;
  uint64_t v29 = sub_100005280(&qword_100062698);
  uint64_t v30 = sub_100015EA4(v29);
  __chkstk_darwin(v30);
  sub_10000F9B8();
  uint64_t v33 = v32 - v31;
  v50[18] = v32 - v31;
  uint64_t v34 = type metadata accessor for UUID();
  uint64_t v35 = sub_100015EA4(v34);
  __chkstk_darwin(v35);
  sub_100013014();
  v50[19] = v36;
  WeatherAlert.id.getter();
  uint64_t v37 = sub_100005280(&qword_1000626A0);
  sub_100008CEC(v33, 1, 1, v37);
  uint64_t v38 = WeatherAlert.areaId.getter();
  v50[16] = v39;
  v50[17] = v38;
  uint64_t v40 = WeatherAlert.areaName.getter();
  v50[14] = v41;
  v50[15] = v40;
  uint64_t v42 = WeatherAlert.countryCode.getter();
  v50[12] = v43;
  v50[13] = v42;
  uint64_t v44 = WeatherAlert.description.getter();
  v50[10] = v45;
  v50[11] = v44;
  WeatherAlert.expireTime.getter();
  WeatherAlert.issuedTime.getter();
  WeatherAlert.effectiveTime.getter();
  WeatherAlert.eventOnsetTime.getter();
  WeatherAlert.eventEndTime.getter();
  uint64_t v46 = WeatherAlert.detailsUrl.getter();
  v50[3] = v47;
  v50[4] = v46;
  WeatherAlert.certainty.getter();
  v50[1] = WeatherAlert.phenomenon.getter();
  v50[0] = v48;
  WeatherAlert.responses.getter();
  WeatherAlert.severity.getter();
  WeatherAlert.significance.getter();
  WeatherAlert.source.getter();
  WeatherAlert.eventSource.getter();
  WeatherAlert.urgency.getter();
  WeatherAlert.importance.getter();
  return WeatherAlert.init(id:area:areaId:areaName:countryCode:description:expireTime:issuedTime:effectiveTime:eventOnsetTime:eventEndTime:detailsUrl:certainty:phenomenon:responses:severity:significance:source:eventSource:urgency:messages:importance:)();
}

uint64_t sub_10004D50C()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_10004D52C()
{
  return v0;
}

void sub_10004D540()
{
  *(void *)(v1 - 256) = v0;
}

void sub_10004D550()
{
  Hasher._combine(_:)(1u);
}

void sub_10004D568()
{
  Hasher._combine(_:)(0);
}

uint64_t sub_10004D5A8()
{
  uint64_t result = *(unsigned __int8 *)(v0 + 16);
  if (result == 7)
  {
    static Settings.WeatherEnvironment.contentEnvironment.getter();
    sub_10004DAF4();
    Configurable.setting<A>(_:)();
    swift_release();
    uint64_t result = v2;
    *(unsigned char *)(v0 + 16) = v2;
  }
  return result;
}

uint64_t sub_10004D638()
{
  uint64_t v0 = type metadata accessor for AppConfiguration();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  ReferenceCountedLazy.increase()();
  sub_100005370(v6, v6[3]);
  dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
  sub_10004D5A8();
  AppConfiguration.endpointConfig(for:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  ReferenceCountedLazy.decrease()();
  return sub_100008AD0((uint64_t)v6);
}

uint64_t sub_10004D860()
{
  uint64_t v0 = type metadata accessor for EndpointConfiguration();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004D638();
  EndpointConfiguration.analyticsURL.getter();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10004D9A4()
{
  uint64_t v0 = sub_10004D5A8();
  return ContentEnvironment.description.getter(v0);
}

uint64_t sub_10004DA44()
{
  type metadata accessor for AppGroup();
  static AppGroup.weather.getter();
  uint64_t v0 = AppGroup.identifier.getter();
  swift_release();
  return v0;
}

uint64_t sub_10004DA98()
{
  swift_release();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for AnalyticsEndpoint()
{
  return self;
}

unint64_t sub_10004DAF4()
{
  unint64_t result = qword_100064210;
  if (!qword_100064210)
  {
    type metadata accessor for AnalyticsEndpoint();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100064210);
  }
  return result;
}

uint64_t type metadata accessor for JSONDecoder.DateDecodingStrategy()
{
  return type metadata accessor for JSONDecoder.DateDecodingStrategy();
}

uint64_t dispatch thunk of JSONDecoder.dateDecodingStrategy.setter()
{
  return dispatch thunk of JSONDecoder.dateDecodingStrategy.setter();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t type metadata accessor for JSONEncoder.DateEncodingStrategy()
{
  return type metadata accessor for JSONEncoder.DateEncodingStrategy();
}

uint64_t dispatch thunk of JSONEncoder.dateEncodingStrategy.setter()
{
  return dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.queryItems.setter()
{
  return URLComponents.queryItems.setter();
}

uint64_t URLComponents.init(string:)()
{
  return URLComponents.init(string:)();
}

uint64_t URLComponents.string.getter()
{
  return URLComponents.string.getter();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Locale.LanguageCode.identifier.getter()
{
  return Locale.LanguageCode.identifier.getter();
}

uint64_t type metadata accessor for Locale.LanguageCode()
{
  return type metadata accessor for Locale.LanguageCode();
}

uint64_t static Locale.languageIdentifier.getter()
{
  return static Locale.languageIdentifier.getter();
}

uint64_t Locale.Region.identifier.getter()
{
  return Locale.Region.identifier.getter();
}

uint64_t type metadata accessor for Locale.Region()
{
  return type metadata accessor for Locale.Region();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t Locale.Language.languageCode.getter()
{
  return Locale.Language.languageCode.getter();
}

uint64_t Locale.Language.region.getter()
{
  return Locale.Language.region.getter();
}

uint64_t type metadata accessor for Locale.Language()
{
  return type metadata accessor for Locale.Language();
}

uint64_t Locale.language.getter()
{
  return Locale.language.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t TimeZone.identifier.getter()
{
  return TimeZone.identifier.getter();
}

uint64_t TimeZone.secondsFromGMT(for:)()
{
  return TimeZone.secondsFromGMT(for:)();
}

uint64_t static TimeZone.current.getter()
{
  return static TimeZone.current.getter();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t static Settings.WeatherEnvironment.apsEnvironment.getter()
{
  return static Settings.WeatherEnvironment.apsEnvironment.getter();
}

uint64_t static Settings.WeatherEnvironment.contentEnvironment.getter()
{
  return static Settings.WeatherEnvironment.contentEnvironment.getter();
}

uint64_t static Settings.Notifications.Severe.debugNotifications.getter()
{
  return static Settings.Notifications.Severe.debugNotifications.getter();
}

uint64_t static Settings.Notifications.Severe.filterIncomingEvents.getter()
{
  return static Settings.Notifications.Severe.filterIncomingEvents.getter();
}

uint64_t static Settings.Notifications.Severe.simulateAlertUpdates.getter()
{
  return static Settings.Notifications.Severe.simulateAlertUpdates.getter();
}

uint64_t static Settings.memoryTesting.getter()
{
  return static Settings.memoryTesting.getter();
}

uint64_t type metadata accessor for Settings()
{
  return type metadata accessor for Settings();
}

uint64_t Configurable.setting<A>(_:)()
{
  return Configurable.setting<A>(_:)();
}

uint64_t dispatch thunk of SettingGroup.isEnabled.getter()
{
  return dispatch thunk of SettingGroup.isEnabled.getter();
}

uint64_t SettingGroup.deinit()
{
  return SettingGroup.deinit();
}

uint64_t SettingReader.read<A>(_:)()
{
  return SettingReader.read<A>(_:)();
}

uint64_t static SettingReader.shared.getter()
{
  return static SettingReader.shared.getter();
}

uint64_t type metadata accessor for SettingReader()
{
  return type metadata accessor for SettingReader();
}

uint64_t type metadata accessor for Access()
{
  return type metadata accessor for Access();
}

uint64_t static Domain.weatherInternal.getter()
{
  return static Domain.weatherInternal.getter();
}

uint64_t type metadata accessor for Domain()
{
  return type metadata accessor for Domain();
}

uint64_t Setting.init(_:defaultValue:domain:access:)()
{
  return Setting.init(_:defaultValue:domain:access:)();
}

uint64_t AppGroup.identifier.getter()
{
  return AppGroup.identifier.getter();
}

uint64_t static AppGroup.weather.getter()
{
  return static AppGroup.weather.getter();
}

uint64_t type metadata accessor for AppGroup()
{
  return type metadata accessor for AppGroup();
}

uint64_t WeatherAlertEntity.init(alertIdentifier:messageIdentifier:channelIdentifier:boundingBox:relevant:)()
{
  return WeatherAlertEntity.init(alertIdentifier:messageIdentifier:channelIdentifier:boundingBox:relevant:)();
}

uint64_t type metadata accessor for WeatherAlertEntity()
{
  return type metadata accessor for WeatherAlertEntity();
}

uint64_t static MachServices.Notifications.getter()
{
  return static MachServices.Notifications.getter();
}

uint64_t APSEnvironment.rawValue.getter()
{
  return APSEnvironment.rawValue.getter();
}

uint64_t type metadata accessor for APSEnvironment()
{
  return type metadata accessor for APSEnvironment();
}

uint64_t GeocodeService.setupWeatherKitGeocoding(using:)()
{
  return GeocodeService.setupWeatherKitGeocoding(using:)();
}

uint64_t GeocodeService.init(appConfigurationManager:privacySampler:locationMetadataUpdater:)()
{
  return GeocodeService.init(appConfigurationManager:privacySampler:locationMetadataUpdater:)();
}

uint64_t type metadata accessor for GeocodeService()
{
  return type metadata accessor for GeocodeService();
}

uint64_t LocationManager.init(geocodeManager:locationCacheManager:)()
{
  return LocationManager.init(geocodeManager:locationCacheManager:)();
}

uint64_t type metadata accessor for LocationManager()
{
  return type metadata accessor for LocationManager();
}

uint64_t AppConfiguration.treatmentIDs.getter()
{
  return AppConfiguration.treatmentIDs.getter();
}

uint64_t AppConfiguration.segmentSetIDs.getter()
{
  return AppConfiguration.segmentSetIDs.getter();
}

uint64_t AppConfiguration.endpointConfig(for:)()
{
  return AppConfiguration.endpointConfig(for:)();
}

uint64_t AppConfiguration.locationDecimalPrecision.getter()
{
  return AppConfiguration.locationDecimalPrecision.getter();
}

uint64_t AppConfiguration.namedNetworkConfigurations.getter()
{
  return AppConfiguration.namedNetworkConfigurations.getter();
}

uint64_t AppConfiguration.network.getter()
{
  return AppConfiguration.network.getter();
}

uint64_t type metadata accessor for AppConfiguration()
{
  return type metadata accessor for AppConfiguration();
}

uint64_t FetchResultEntity.init(identifier:subscriptionIdentifier:scheduleIdentifier:notificationIdentifier:forecast:)()
{
  return FetchResultEntity.init(identifier:subscriptionIdentifier:scheduleIdentifier:notificationIdentifier:forecast:)();
}

uint64_t FetchResultEntity.notification.getter()
{
  return FetchResultEntity.notification.getter();
}

uint64_t FetchResultEntity.created.getter()
{
  return FetchResultEntity.created.getter();
}

uint64_t FetchResultEntity.forecast.getter()
{
  return FetchResultEntity.forecast.getter();
}

uint64_t type metadata accessor for FetchResultEntity()
{
  return type metadata accessor for FetchResultEntity();
}

uint64_t NotificationStore.fetchResults.getter()
{
  return NotificationStore.fetchResults.getter();
}

uint64_t NotificationStore.weatherAlerts.getter()
{
  return NotificationStore.weatherAlerts.getter();
}

uint64_t NotificationStore.incomingMessages.getter()
{
  return NotificationStore.incomingMessages.getter();
}

uint64_t NotificationStore.severeNotifications.getter()
{
  return NotificationStore.severeNotifications.getter();
}

uint64_t dispatch thunk of LocationManagerType.addObserver(_:)()
{
  return dispatch thunk of LocationManagerType.addObserver(_:)();
}

uint64_t dispatch thunk of LocationManagerType.removeObserver(_:)()
{
  return dispatch thunk of LocationManagerType.removeObserver(_:)();
}

uint64_t dispatch thunk of LocationManagerType.authorizationState.getter()
{
  return dispatch thunk of LocationManagerType.authorizationState.getter();
}

uint64_t type metadata accessor for NetworkConfiguration()
{
  return type metadata accessor for NetworkConfiguration();
}

uint64_t EndpointConfiguration.analyticsURL.getter()
{
  return EndpointConfiguration.analyticsURL.getter();
}

uint64_t EndpointConfiguration.weatherDataURL.getter()
{
  return EndpointConfiguration.weatherDataURL.getter();
}

uint64_t type metadata accessor for EndpointConfiguration()
{
  return type metadata accessor for EndpointConfiguration();
}

uint64_t IncomingMessageEntity.init(id:messageID:channel:userInfo:)()
{
  return IncomingMessageEntity.init(id:messageID:channel:userInfo:)();
}

uint64_t IncomingMessageEntity.channel.getter()
{
  return IncomingMessageEntity.channel.getter();
}

uint64_t IncomingMessageEntity.messageID.getter()
{
  return IncomingMessageEntity.messageID.getter();
}

uint64_t type metadata accessor for IncomingMessageEntity()
{
  return type metadata accessor for IncomingMessageEntity();
}

uint64_t static LocationMetadataStore.preferredCacheSize.getter()
{
  return static LocationMetadataStore.preferredCacheSize.getter();
}

uint64_t LocationMetadataStore.init(database:configuredCountryCode:)()
{
  return LocationMetadataStore.init(database:configuredCountryCode:)();
}

uint64_t static LocationMetadataStore.location.getter()
{
  return static LocationMetadataStore.location.getter();
}

uint64_t type metadata accessor for LocationMetadataStore()
{
  return type metadata accessor for LocationMetadataStore();
}

uint64_t type metadata accessor for CoherenceContainerName()
{
  return type metadata accessor for CoherenceContainerName();
}

uint64_t AppConfigurationManager.init(appConfigurationService:appConfigurationStore:)()
{
  return AppConfigurationManager.init(appConfigurationService:appConfigurationStore:)();
}

uint64_t type metadata accessor for AppConfigurationManager()
{
  return type metadata accessor for AppConfigurationManager();
}

uint64_t LocationMetadataManager.init(geocodeService:store:)()
{
  return LocationMetadataManager.init(geocodeService:store:)();
}

uint64_t type metadata accessor for LocationMetadataManager()
{
  return type metadata accessor for LocationMetadataManager();
}

uint64_t dispatch thunk of CloudChannelMapAssetType.identifier.getter()
{
  return dispatch thunk of CloudChannelMapAssetType.identifier.getter();
}

uint64_t dispatch thunk of CloudChannelMapAssetType.boundingBox.getter()
{
  return dispatch thunk of CloudChannelMapAssetType.boundingBox.getter();
}

uint64_t NotificationSubscription.identifier.getter()
{
  return NotificationSubscription.identifier.getter();
}

uint64_t NotificationSubscription.severeEnabled.getter()
{
  return NotificationSubscription.severeEnabled.getter();
}

uint64_t static NotificationSubscription.Kind.severe.getter()
{
  return static NotificationSubscription.Kind.severe.getter();
}

uint64_t type metadata accessor for NotificationSubscription.Kind()
{
  return type metadata accessor for NotificationSubscription.Kind();
}

uint64_t NotificationSubscription.Location.locationOverride.getter()
{
  return NotificationSubscription.Location.locationOverride.getter();
}

uint64_t NotificationSubscription.Location.id.getter()
{
  return NotificationSubscription.Location.id.getter();
}

uint64_t NotificationSubscription.Location.init(location:locationOverride:)()
{
  return NotificationSubscription.Location.init(location:locationOverride:)();
}

uint64_t NotificationSubscription.Location.location.getter()
{
  return NotificationSubscription.Location.location.getter();
}

uint64_t type metadata accessor for NotificationSubscription.Location()
{
  return type metadata accessor for NotificationSubscription.Location();
}

uint64_t NotificationSubscription.location.getter()
{
  return NotificationSubscription.location.getter();
}

uint64_t type metadata accessor for NotificationSubscription()
{
  return type metadata accessor for NotificationSubscription();
}

uint64_t SevereNotificationEntity.init(identifier:notificationIdentifier:subscription:notification:alert:alertIdentifier:messageIdentifier:alertDescription:issuedTime:expireTime:replacementAlert:)()
{
  return SevereNotificationEntity.init(identifier:notificationIdentifier:subscription:notification:alert:alertIdentifier:messageIdentifier:alertDescription:issuedTime:expireTime:replacementAlert:)();
}

uint64_t SevereNotificationEntity.markAsReplaced(by:)()
{
  return SevereNotificationEntity.markAsReplaced(by:)();
}

uint64_t SevereNotificationEntity.alertIdentifier.getter()
{
  return SevereNotificationEntity.alertIdentifier.getter();
}

uint64_t SevereNotificationEntity.replacementAlert.getter()
{
  return SevereNotificationEntity.replacementAlert.getter();
}

uint64_t SevereNotificationEntity.messageIdentifier.getter()
{
  return SevereNotificationEntity.messageIdentifier.getter();
}

uint64_t SevereNotificationEntity.notificationIdentifier.getter()
{
  return SevereNotificationEntity.notificationIdentifier.getter();
}

uint64_t SevereNotificationEntity.alert.getter()
{
  return SevereNotificationEntity.alert.getter();
}

uint64_t type metadata accessor for SevereNotificationEntity()
{
  return type metadata accessor for SevereNotificationEntity();
}

uint64_t type metadata accessor for LocationManagerUpdateType()
{
  return type metadata accessor for LocationManagerUpdateType();
}

uint64_t NamedNetworkConfiguration.networkConfiguration.getter()
{
  return NamedNetworkConfiguration.networkConfiguration.getter();
}

uint64_t NamedNetworkConfiguration.name.getter()
{
  return NamedNetworkConfiguration.name.getter();
}

uint64_t type metadata accessor for NamedNetworkConfiguration()
{
  return type metadata accessor for NamedNetworkConfiguration();
}

uint64_t NotificationConfiguration.cloudChannelsConfiguration.getter()
{
  return NotificationConfiguration.cloudChannelsConfiguration.getter();
}

uint64_t NotificationConfiguration.channelSubscriptionLimit.getter()
{
  return NotificationConfiguration.channelSubscriptionLimit.getter();
}

uint64_t type metadata accessor for NotificationConfiguration()
{
  return type metadata accessor for NotificationConfiguration();
}

uint64_t PrecipitationNotification.identifier.getter()
{
  return PrecipitationNotification.identifier.getter();
}

uint64_t type metadata accessor for PrecipitationNotification()
{
  return type metadata accessor for PrecipitationNotification();
}

uint64_t dispatch thunk of AppConfigurationManagerType.appConfiguration.getter()
{
  return dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
}

uint64_t dispatch thunk of AppConfigurationManagerType.fetchAppConfig(cachePolicy:)()
{
  return dispatch thunk of AppConfigurationManagerType.fetchAppConfig(cachePolicy:)();
}

uint64_t CurrentLocationCacheManager.init(store:)()
{
  return CurrentLocationCacheManager.init(store:)();
}

uint64_t type metadata accessor for CurrentLocationCacheManager()
{
  return type metadata accessor for CurrentLocationCacheManager();
}

uint64_t dispatch thunk of LocationMetadataManagerType.resolveCountryCode(for:)()
{
  return dispatch thunk of LocationMetadataManagerType.resolveCountryCode(for:)();
}

uint64_t DaemonDecommissioningService.init(notificationManager:)()
{
  return DaemonDecommissioningService.init(notificationManager:)();
}

uint64_t type metadata accessor for DaemonDecommissioningService()
{
  return type metadata accessor for DaemonDecommissioningService();
}

Swift::Void __swiftcall NotificationEnablementTracker.trackEnablement()()
{
}

uint64_t NotificationEnablementTracker.init(subscriptionManager:)()
{
  return NotificationEnablementTracker.init(subscriptionManager:)();
}

uint64_t type metadata accessor for NotificationEnablementTracker()
{
  return type metadata accessor for NotificationEnablementTracker();
}

uint64_t NotificationLocationComparator.init(lazyAppConfigurationManager:)()
{
  return NotificationLocationComparator.init(lazyAppConfigurationManager:)();
}

uint64_t type metadata accessor for NotificationLocationComparator()
{
  return type metadata accessor for NotificationLocationComparator();
}

uint64_t SevereNotificationsPowerLogger.init(notificationStore:)()
{
  return SevereNotificationsPowerLogger.init(notificationStore:)();
}

Swift::Void __swiftcall SevereNotificationsPowerLogger.report()()
{
}

uint64_t type metadata accessor for SevereNotificationsPowerLogger()
{
  return type metadata accessor for SevereNotificationsPowerLogger();
}

uint64_t type metadata accessor for PrecipitationNotificationPolicy()
{
  return type metadata accessor for PrecipitationNotificationPolicy();
}

uint64_t NotificationConfigurationManager.init(appConfigurationManager:)()
{
  return NotificationConfigurationManager.init(appConfigurationManager:)();
}

uint64_t NotificationConfigurationManager.fetchNotificationConfiguration()()
{
  return NotificationConfigurationManager.fetchNotificationConfiguration()();
}

uint64_t type metadata accessor for NotificationConfigurationManager()
{
  return type metadata accessor for NotificationConfigurationManager();
}

uint64_t PrecipitationNotificationsManager.init(weatherDataService:policyHandler:notificationContentFactory:notificationDeliveryScheduler:notificationFetchScheduler:notificationSubscriptionManager:notificationConfigurationProvider:notificationAuthorizationStatusProvider:locationManager:locationComparator:notificationsEnablementTracker:notificationAccuracyTracker:)()
{
  return PrecipitationNotificationsManager.init(weatherDataService:policyHandler:notificationContentFactory:notificationDeliveryScheduler:notificationFetchScheduler:notificationSubscriptionManager:notificationConfigurationProvider:notificationAuthorizationStatusProvider:locationManager:locationComparator:notificationsEnablementTracker:notificationAccuracyTracker:)();
}

uint64_t type metadata accessor for PrecipitationNotificationsManager()
{
  return type metadata accessor for PrecipitationNotificationsManager();
}

uint64_t dispatch thunk of NotificationLocationComparatorType.areLocationsEquivalent(_:_:)()
{
  return dispatch thunk of NotificationLocationComparatorType.areLocationsEquivalent(_:_:)();
}

Swift::String __swiftcall GeocodeManagerGetCurrentCountryCode()()
{
  uint64_t CurrentCountry = GeocodeManagerGetCurrentCountryCode()();
  result._object = v1;
  result._countAndFlagsBits = CurrentCountry;
  return result;
}

uint64_t dispatch thunk of NotificationSubscriptionManagerType.updateSubscription(for:)()
{
  return dispatch thunk of NotificationSubscriptionManagerType.updateSubscription(for:)();
}

uint64_t dispatch thunk of NotificationSubscriptionManagerType.subscription(with:)()
{
  return dispatch thunk of NotificationSubscriptionManagerType.subscription(with:)();
}

uint64_t dispatch thunk of NotificationSubscriptionManagerType.subscriptions(of:)()
{
  return dispatch thunk of NotificationSubscriptionManagerType.subscriptions(of:)();
}

uint64_t dispatch thunk of SevereNotificationStringBuilderType.body(for:at:timestamp:)()
{
  return dispatch thunk of SevereNotificationStringBuilderType.body(for:at:timestamp:)();
}

uint64_t dispatch thunk of SevereNotificationStringBuilderType.title(for:)()
{
  return dispatch thunk of SevereNotificationStringBuilderType.title(for:)();
}

uint64_t dispatch thunk of SevereNotificationStringBuilderType.subtitle(for:)()
{
  return dispatch thunk of SevereNotificationStringBuilderType.subtitle(for:)();
}

uint64_t dispatch thunk of PrecipitationNotificationsManagerType.unregister()()
{
  return dispatch thunk of PrecipitationNotificationsManagerType.unregister()();
}

uint64_t PrecipitationNotificationConfiguration.now.getter()
{
  return PrecipitationNotificationConfiguration.now.getter();
}

uint64_t type metadata accessor for PrecipitationNotificationConfiguration()
{
  return type metadata accessor for PrecipitationNotificationConfiguration();
}

uint64_t PrecipitationNotificationFetchSchedule.identifier.getter()
{
  return PrecipitationNotificationFetchSchedule.identifier.getter();
}

uint64_t PrecipitationNotificationFetchSchedule.subscription.getter()
{
  return PrecipitationNotificationFetchSchedule.subscription.getter();
}

uint64_t type metadata accessor for PrecipitationNotificationFetchSchedule()
{
  return type metadata accessor for PrecipitationNotificationFetchSchedule();
}

uint64_t PrecipitationNotificationFetchScheduler.init(notificationStore:activityManager:)()
{
  return PrecipitationNotificationFetchScheduler.init(notificationStore:activityManager:)();
}

uint64_t type metadata accessor for PrecipitationNotificationFetchScheduler()
{
  return type metadata accessor for PrecipitationNotificationFetchScheduler();
}

uint64_t PrecipitationNotificationDeliverySchedule.subscription.getter()
{
  return PrecipitationNotificationDeliverySchedule.subscription.getter();
}

uint64_t type metadata accessor for PrecipitationNotificationDeliverySchedule()
{
  return type metadata accessor for PrecipitationNotificationDeliverySchedule();
}

uint64_t PrecipitationNotificationDeliveryScheduler.init(notificationStore:userNotificationCenter:)()
{
  return PrecipitationNotificationDeliveryScheduler.init(notificationStore:userNotificationCenter:)();
}

uint64_t type metadata accessor for PrecipitationNotificationDeliveryScheduler()
{
  return type metadata accessor for PrecipitationNotificationDeliveryScheduler();
}

uint64_t dispatch thunk of NotificationAuthorizationStatusProviderType.hasNotificationAuthorization()()
{
  return dispatch thunk of NotificationAuthorizationStatusProviderType.hasNotificationAuthorization()();
}

uint64_t PreciptationNotificationConfigurationProvider.init(notificationConfigurationManager:notificationDeliveryScheduler:)()
{
  return PreciptationNotificationConfigurationProvider.init(notificationConfigurationManager:notificationDeliveryScheduler:)();
}

uint64_t type metadata accessor for PreciptationNotificationConfigurationProvider()
{
  return type metadata accessor for PreciptationNotificationConfigurationProvider();
}

uint64_t dispatch thunk of PreciptationNotificationConfigurationProviderType.configuration(for:)()
{
  return dispatch thunk of PreciptationNotificationConfigurationProviderType.configuration(for:)();
}

uint64_t Assembly.init()()
{
  return Assembly.init()();
}

{
  return Assembly.init()();
}

uint64_t type metadata accessor for Assembly()
{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

uint64_t Location.isNotificationSubscriptionCurrentLocationPlaceholder.getter()
{
  return Location.isNotificationSubscriptionCurrentLocationPlaceholder.getter();
}

uint64_t static Location.currentLocationID.getter()
{
  return static Location.currentLocationID.getter();
}

uint64_t Location.Identifier.Kind.rawValue.getter()
{
  return Location.Identifier.Kind.rawValue.getter();
}

uint64_t Location.coordinate.getter()
{
  return Location.coordinate.getter();
}

uint64_t Location.init(id:name:timeZone:coordinate:lastRefreshDate:searchTitle:searchSubtitle:preciseName:secondaryName:)()
{
  return Location.init(id:name:timeZone:coordinate:lastRefreshDate:searchTitle:searchSubtitle:preciseName:secondaryName:)();
}

uint64_t Location.id.getter()
{
  return Location.id.getter();
}

uint64_t Location.kind.getter()
{
  return Location.kind.getter();
}

uint64_t Location.timeZone.getter()
{
  return Location.timeZone.getter();
}

uint64_t type metadata accessor for Location()
{
  return type metadata accessor for Location();
}

Swift::Void __swiftcall Debouncer.cancel()()
{
}

uint64_t Debouncer.execute(_:)()
{
  return Debouncer.execute(_:)();
}

uint64_t Debouncer.init(interval:queue:)()
{
  return Debouncer.init(interval:queue:)();
}

uint64_t type metadata accessor for Debouncer()
{
  return type metadata accessor for Debouncer();
}

uint64_t AppSessionManager.createSessionManager(with:)()
{
  return AppSessionManager.createSessionManager(with:)();
}

uint64_t AppSessionManager.init(accessQueue:trackingConsent:crashDetector:)()
{
  return AppSessionManager.init(accessQueue:trackingConsent:crashDetector:)();
}

uint64_t type metadata accessor for AppSessionManager()
{
  return type metadata accessor for AppSessionManager();
}

uint64_t static AccessQueue.background.getter()
{
  return static AccessQueue.background.getter();
}

uint64_t type metadata accessor for AccessQueue()
{
  return type metadata accessor for AccessQueue();
}

uint64_t static FlushEvents.didEndSession.getter()
{
  return static FlushEvents.didEndSession.getter();
}

uint64_t static FlushEvents.didLeaveGroup.getter()
{
  return static FlushEvents.didLeaveGroup.getter();
}

uint64_t static FlushEvents.didStartSession.getter()
{
  return static FlushEvents.didStartSession.getter();
}

uint64_t type metadata accessor for FlushEvents()
{
  return type metadata accessor for FlushEvents();
}

uint64_t FlushManager.__allocating_init(appSessionManager:client:endpoint:contentType:config:clientFactory:)()
{
  return FlushManager.__allocating_init(appSessionManager:client:endpoint:contentType:config:clientFactory:)();
}

uint64_t type metadata accessor for FlushManager()
{
  return type metadata accessor for FlushManager();
}

uint64_t AccessTracker.push<A>(data:traits:file:line:)()
{
  return AccessTracker.push<A>(data:traits:file:line:)();
}

uint64_t AccessTracker.submit<A>(_:onlyIfTimed:userInfo:completion:)()
{
  return AccessTracker.submit<A>(_:onlyIfTimed:userInfo:completion:)();
}

uint64_t static CrashDetector.shared.getter()
{
  return static CrashDetector.shared.getter();
}

uint64_t type metadata accessor for CrashDetector()
{
  return type metadata accessor for CrashDetector();
}

uint64_t FlushProcessor.init(flushEvents:flushInterval:)()
{
  return FlushProcessor.init(flushEvents:flushInterval:)();
}

uint64_t type metadata accessor for FlushProcessor()
{
  return type metadata accessor for FlushProcessor();
}

uint64_t SessionManager.processorManager.getter()
{
  return SessionManager.processorManager.getter();
}

uint64_t SessionManager.end(endDate:completion:)()
{
  return SessionManager.end(endDate:completion:)();
}

uint64_t SessionManager.start(for:identifier:startDate:timestampJitter:)()
{
  return SessionManager.start(for:identifier:startDate:timestampJitter:)();
}

uint64_t static SessionManager.Options.gracefulNoSessionEventSubmission.getter()
{
  return static SessionManager.Options.gracefulNoSessionEventSubmission.getter();
}

uint64_t static SessionManager.Options.gracefulEventCreation.getter()
{
  return static SessionManager.Options.gracefulEventCreation.getter();
}

uint64_t type metadata accessor for SessionManager.Options()
{
  return type metadata accessor for SessionManager.Options();
}

uint64_t SessionManager.tracker.getter()
{
  return SessionManager.tracker.getter();
}

uint64_t type metadata accessor for SessionManager()
{
  return type metadata accessor for SessionManager();
}

uint64_t type metadata accessor for TimestampJitter()
{
  return type metadata accessor for TimestampJitter();
}

Swift::Void __swiftcall TrackingConsent.allow()()
{
}

uint64_t static TrackingConsent.shared.getter()
{
  return static TrackingConsent.shared.getter();
}

uint64_t type metadata accessor for TrackingConsent()
{
  return type metadata accessor for TrackingConsent();
}

uint64_t ProcessorManager.add(eventProcessor:)()
{
  return ProcessorManager.add(eventProcessor:)();
}

uint64_t LoggingEventProcessor.__allocating_init(logFormat:)()
{
  return LoggingEventProcessor.__allocating_init(logFormat:)();
}

uint64_t type metadata accessor for LoggingEventProcessor()
{
  return type metadata accessor for LoggingEventProcessor();
}

uint64_t UploadBatchEventConfig.with(directory:)()
{
  return UploadBatchEventConfig.with(directory:)();
}

uint64_t static UploadBatchEventConfig.default.getter()
{
  return static UploadBatchEventConfig.default.getter();
}

uint64_t type metadata accessor for UploadBatchEventConfig()
{
  return type metadata accessor for UploadBatchEventConfig();
}

uint64_t UploadBatchEventProcessor.__allocating_init(client:endpoint:contentType:config:)()
{
  return UploadBatchEventProcessor.__allocating_init(client:endpoint:contentType:config:)();
}

uint64_t type metadata accessor for UploadBatchEventProcessor()
{
  return type metadata accessor for UploadBatchEventProcessor();
}

uint64_t type metadata accessor for LoggingEventProcessorFormat()
{
  return type metadata accessor for LoggingEventProcessorFormat();
}

uint64_t SessionManagerConfiguration.init(options:flushProcessor:timestampJitter:privacyValidationProvider:)()
{
  return SessionManagerConfiguration.init(options:flushProcessor:timestampJitter:privacyValidationProvider:)();
}

uint64_t type metadata accessor for SessionManagerConfiguration()
{
  return type metadata accessor for SessionManagerConfiguration();
}

uint64_t URLSessionUploadClientFactory.init()()
{
  return URLSessionUploadClientFactory.init()();
}

uint64_t type metadata accessor for URLSessionUploadClientFactory()
{
  return type metadata accessor for URLSessionUploadClientFactory();
}

uint64_t DisabledPrivacyValidationProvider.init()()
{
  return DisabledPrivacyValidationProvider.init()();
}

uint64_t type metadata accessor for DisabledPrivacyValidationProvider()
{
  return type metadata accessor for DisabledPrivacyValidationProvider();
}

uint64_t Client.init(identifier:name:version:buildNumber:)()
{
  return Client.init(identifier:name:version:buildNumber:)();
}

uint64_t type metadata accessor for Client()
{
  return type metadata accessor for Client();
}

uint64_t type metadata accessor for Session.Kind()
{
  return type metadata accessor for Session.Kind();
}

uint64_t Tracker.transaction(block:)()
{
  return Tracker.transaction(block:)();
}

uint64_t Definition.thenConfigure<A>(as:configuration:)()
{
  return Definition.thenConfigure<A>(as:configuration:)();
}

uint64_t Definition.thenConfigure(_:)()
{
  return Definition.thenConfigure(_:)();
}

uint64_t Definition.inScope(_:)()
{
  return Definition.inScope(_:)();
}

Swift::Void __swiftcall UnfairLock.lock()()
{
}

Swift::Void __swiftcall UnfairLock.unlock()()
{
}

uint64_t static UnfairLock.Options.dataSynchronization.getter()
{
  return static UnfairLock.Options.dataSynchronization.getter();
}

uint64_t type metadata accessor for UnfairLock.Options()
{
  return type metadata accessor for UnfairLock.Options();
}

uint64_t UnfairLock.init(options:)()
{
  return UnfairLock.init(options:)();
}

uint64_t type metadata accessor for UnfairLock()
{
  return type metadata accessor for UnfairLock();
}

uint64_t type metadata accessor for LazyOptions()
{
  return type metadata accessor for LazyOptions();
}

uint64_t MachService.serviceInterface.getter()
{
  return MachService.serviceInterface.getter();
}

uint64_t MachService.name.getter()
{
  return MachService.name.getter();
}

uint64_t type metadata accessor for MachService()
{
  return type metadata accessor for MachService();
}

uint64_t dispatch thunk of ResolverType.resolve<A>(_:)()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

NSXPCInterface __swiftcall XPCInterface.asNSXPCInterface()()
{
  return (NSXPCInterface)XPCInterface.asNSXPCInterface()();
}

uint64_t type metadata accessor for XPCInterface()
{
  return type metadata accessor for XPCInterface();
}

uint64_t type metadata accessor for ContainerLock()
{
  return type metadata accessor for ContainerLock();
}

uint64_t SingletonPool.init()()
{
  return SingletonPool.init()();
}

uint64_t type metadata accessor for SingletonPool()
{
  return type metadata accessor for SingletonPool();
}

uint64_t simulateCrash(unless:_:_:)()
{
  return simulateCrash(unless:_:_:)();
}

uint64_t PromiseDeduper.init(options:)()
{
  return PromiseDeduper.init(options:)();
}

uint64_t PromiseDeduper.promise(key:createBlock:)()
{
  return PromiseDeduper.promise(key:createBlock:)();
}

uint64_t ProxyContainer.public.getter()
{
  return ProxyContainer.public.getter();
}

uint64_t ProxyContainer.private.getter()
{
  return ProxyContainer.private.getter();
}

uint64_t AsyncBlockOperation.init(_:)()
{
  return AsyncBlockOperation.init(_:)();
}

uint64_t type metadata accessor for PromiseDeduperFlags()
{
  return type metadata accessor for PromiseDeduperFlags();
}

uint64_t ReferenceCountedLazy.value(_:)()
{
  return ReferenceCountedLazy.value(_:)();
}

uint64_t ReferenceCountedLazy.init(options:loadBlock:)()
{
  return ReferenceCountedLazy.init(options:loadBlock:)();
}

Swift::Void __swiftcall ReferenceCountedLazy.decrease()()
{
}

uint64_t ReferenceCountedLazy.increase()()
{
  return ReferenceCountedLazy.increase()();
}

uint64_t RegistrationContainer.lazy(block:)()
{
  return RegistrationContainer.lazy(block:)();
}

uint64_t RegistrationContainer.register<A>(_:name:factory:)()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t static FixedSizeTypeBinaryCodable.read(from:)()
{
  return static FixedSizeTypeBinaryCodable.read(from:)();
}

uint64_t type metadata accessor for Scope()
{
  return type metadata accessor for Scope();
}

uint64_t when2<A, B>(on:_:_:)()
{
  return when2<A, B>(on:_:_:)();
}

uint64_t zalgo.getter()
{
  return zalgo.getter();
}

uint64_t static Promise.all<A>(on:_:)()
{
  return static Promise.all<A>(on:_:)();
}

uint64_t Promise.then<A>(on:closure:)()
{
  return Promise.then<A>(on:closure:)();
}

{
  return Promise.then<A>(on:closure:)();
}

uint64_t Promise.then<A, B>(on:disposeOn:closure:)()
{
  return Promise.then<A, B>(on:disposeOn:closure:)();
}

{
  return Promise.then<A, B>(on:disposeOn:closure:)();
}

uint64_t Promise.error(on:closure:)()
{
  return Promise.error(on:closure:)();
}

uint64_t Promise.init(error:)()
{
  return Promise.init(error:)();
}

uint64_t Promise.init(value:)()
{
  return Promise.init(value:)();
}

uint64_t Promise.always(on:closure:)()
{
  return Promise.always(on:closure:)();
}

uint64_t Promise.always<A>(on:disposeOn:closure:)()
{
  return Promise.always<A>(on:disposeOn:closure:)();
}

uint64_t Promise.init(resolver:)()
{
  return Promise.init(resolver:)();
}

uint64_t Promise<A>.compactMap<A>(on:closure:)()
{
  return Promise<A>.compactMap<A>(on:closure:)();
}

uint64_t Promise<A>.filter(on:closure:)()
{
  return Promise<A>.filter(on:closure:)();
}

uint64_t Promise<A>.flatMap<A>(on:closure:)()
{
  return Promise<A>.flatMap<A>(on:closure:)();
}

uint64_t Promise.__allocating_init(_:scheduleOn:)()
{
  return Promise.__allocating_init(_:scheduleOn:)();
}

uint64_t firstly<A>(on:closure:)()
{
  return firstly<A>(on:closure:)();
}

uint64_t firstly<A, B>(on:disposeOn:closure:)()
{
  return firstly<A, B>(on:disposeOn:closure:)();
}

uint64_t firstly<A>(closure:)()
{
  return firstly<A>(closure:)();
}

uint64_t type metadata accessor for Container.Environment()
{
  return type metadata accessor for Container.Environment();
}

uint64_t Container.init(bundleAssemblies:assemblies:singletonPool:environment:containerLock:)()
{
  return Container.init(bundleAssemblies:assemblies:singletonPool:environment:containerLock:)();
}

uint64_t Container.resolver.getter()
{
  return Container.resolver.getter();
}

uint64_t type metadata accessor for Container()
{
  return type metadata accessor for Container();
}

uint64_t type metadata accessor for WeatherDataCaching()
{
  return type metadata accessor for WeatherDataCaching();
}

uint64_t type metadata accessor for WeatherDataResponse()
{
  return type metadata accessor for WeatherDataResponse();
}

uint64_t dispatch thunk of WeatherDataServiceType.fetchWeatherAlert(with:for:timezone:)()
{
  return dispatch thunk of WeatherDataServiceType.fetchWeatherAlert(with:for:timezone:)();
}

uint64_t dispatch thunk of WeatherDataServiceType.perform(requests:for:with:)()
{
  return dispatch thunk of WeatherDataServiceType.perform(requests:for:with:)();
}

uint64_t WeatherDataServiceProxy.init(endpoint:caching:availableDataSetCaching:statisticsCaching:networkMonitor:authenticator:appConfigurationSettingsProvider:)()
{
  return WeatherDataServiceProxy.init(endpoint:caching:availableDataSetCaching:statisticsCaching:networkMonitor:authenticator:appConfigurationSettingsProvider:)();
}

uint64_t type metadata accessor for WeatherDataServiceProxy()
{
  return type metadata accessor for WeatherDataServiceProxy();
}

uint64_t type metadata accessor for WeatherStatisticsCaching()
{
  return type metadata accessor for WeatherStatisticsCaching();
}

uint64_t type metadata accessor for WeatherAvailabilityCaching()
{
  return type metadata accessor for WeatherAvailabilityCaching();
}

uint64_t WeatherAlert.detailsUrl.getter()
{
  return WeatherAlert.detailsUrl.getter();
}

uint64_t WeatherAlert.expireTime.getter()
{
  return WeatherAlert.expireTime.getter();
}

uint64_t WeatherAlert.expireTime.setter()
{
  return WeatherAlert.expireTime.setter();
}

uint64_t WeatherAlert.importance.getter()
{
  return WeatherAlert.importance.getter();
}

uint64_t WeatherAlert.issuedTime.getter()
{
  return WeatherAlert.issuedTime.getter();
}

uint64_t WeatherAlert.issuedTime.setter()
{
  return WeatherAlert.issuedTime.setter();
}

uint64_t WeatherAlert.phenomenon.getter()
{
  return WeatherAlert.phenomenon.getter();
}

uint64_t WeatherAlert.countryCode.getter()
{
  return WeatherAlert.countryCode.getter();
}

uint64_t WeatherAlert.description.getter()
{
  return WeatherAlert.description.getter();
}

uint64_t WeatherAlert.eventSource.getter()
{
  return WeatherAlert.eventSource.getter();
}

uint64_t WeatherAlert.eventEndTime.getter()
{
  return WeatherAlert.eventEndTime.getter();
}

uint64_t WeatherAlert.significance.getter()
{
  return WeatherAlert.significance.getter();
}

uint64_t WeatherAlert.effectiveTime.getter()
{
  return WeatherAlert.effectiveTime.getter();
}

uint64_t WeatherAlert.eventOnsetTime.getter()
{
  return WeatherAlert.eventOnsetTime.getter();
}

uint64_t WeatherAlert.id.getter()
{
  return WeatherAlert.id.getter();
}

uint64_t WeatherAlert.id.setter()
{
  return WeatherAlert.id.setter();
}

uint64_t WeatherAlert.init(id:area:areaId:areaName:countryCode:description:expireTime:issuedTime:effectiveTime:eventOnsetTime:eventEndTime:detailsUrl:certainty:phenomenon:responses:severity:significance:source:eventSource:urgency:messages:importance:)()
{
  return WeatherAlert.init(id:area:areaId:areaName:countryCode:description:expireTime:issuedTime:effectiveTime:eventOnsetTime:eventEndTime:detailsUrl:certainty:phenomenon:responses:severity:significance:source:eventSource:urgency:messages:importance:)();
}

uint64_t WeatherAlert.area.getter()
{
  return WeatherAlert.area.getter();
}

uint64_t WeatherAlert.areaId.getter()
{
  return WeatherAlert.areaId.getter();
}

uint64_t WeatherAlert.source.getter()
{
  return WeatherAlert.source.getter();
}

uint64_t WeatherAlert.urgency.getter()
{
  return WeatherAlert.urgency.getter();
}

uint64_t WeatherAlert.areaName.getter()
{
  return WeatherAlert.areaName.getter();
}

uint64_t WeatherAlert.severity.getter()
{
  return WeatherAlert.severity.getter();
}

uint64_t WeatherAlert.certainty.getter()
{
  return WeatherAlert.certainty.getter();
}

uint64_t WeatherAlert.responses.getter()
{
  return WeatherAlert.responses.getter();
}

uint64_t type metadata accessor for WeatherAlert()
{
  return type metadata accessor for WeatherAlert();
}

uint64_t type metadata accessor for Importance()
{
  return type metadata accessor for Importance();
}

uint64_t type metadata accessor for WDSVersion()
{
  return type metadata accessor for WDSVersion();
}

uint64_t WDSEndpoint.init(url:)()
{
  return WDSEndpoint.init(url:)();
}

uint64_t type metadata accessor for WDSEndpoint()
{
  return type metadata accessor for WDSEndpoint();
}

uint64_t XPCActivity.init(identifier:gracePeriod:priority:requiresNetworkConnectivity:)()
{
  return XPCActivity.init(identifier:gracePeriod:priority:requiresNetworkConnectivity:)();
}

uint64_t type metadata accessor for XPCActivity.XPCPriority()
{
  return type metadata accessor for XPCActivity.XPCPriority();
}

uint64_t static XPCActivity.Notifications.getter()
{
  return static XPCActivity.Notifications.getter();
}

uint64_t type metadata accessor for XPCActivity()
{
  return type metadata accessor for XPCActivity();
}

uint64_t type metadata accessor for LocationInfo()
{
  return type metadata accessor for LocationInfo();
}

uint64_t ForecastSummary.meetsNotificationThresholds(with:)()
{
  return ForecastSummary.meetsNotificationThresholds(with:)();
}

uint64_t ForecastSummary.endTime.getter()
{
  return ForecastSummary.endTime.getter();
}

uint64_t ForecastSummary.condition.getter()
{
  return ForecastSummary.condition.getter();
}

uint64_t type metadata accessor for ForecastSummary()
{
  return type metadata accessor for ForecastSummary();
}

uint64_t NextHourForecast.summary.getter()
{
  return NextHourForecast.summary.getter();
}

uint64_t NextHourForecast.metadata.getter()
{
  return NextHourForecast.metadata.getter();
}

uint64_t type metadata accessor for NextHourForecast()
{
  return type metadata accessor for NextHourForecast();
}

uint64_t PrecipitationType.isClear.getter()
{
  return PrecipitationType.isClear.getter();
}

uint64_t type metadata accessor for PrecipitationType()
{
  return type metadata accessor for PrecipitationType();
}

uint64_t static XPCActivityManager.unregister(_:)()
{
  return static XPCActivityManager.unregister(_:)();
}

uint64_t XPCActivityManager.init(onActivityCompletion:)()
{
  return XPCActivityManager.init(onActivityCompletion:)();
}

uint64_t static XPCActivityManager.defer(_:completion:)()
{
  return static XPCActivityManager.defer(_:completion:)();
}

uint64_t type metadata accessor for XPCActivityManager()
{
  return type metadata accessor for XPCActivityManager();
}

uint64_t dispatch thunk of CloudChannelMapType.regions.getter()
{
  return dispatch thunk of CloudChannelMapType.regions.getter();
}

uint64_t dispatch thunk of ChannelMapServiceType.channelMap(with:)()
{
  return dispatch thunk of ChannelMapServiceType.channelMap(with:)();
}

uint64_t dispatch thunk of CloudChannelRegionType.channel.getter()
{
  return dispatch thunk of CloudChannelRegionType.channel.getter();
}

uint64_t dispatch thunk of CloudChannelRegionType.country.getter()
{
  return dispatch thunk of CloudChannelRegionType.country.getter();
}

uint64_t dispatch thunk of CloudChannelRegionType.contains(_:)()
{
  return dispatch thunk of CloudChannelRegionType.contains(_:)();
}

uint64_t WDSClientConfiguration.init(networkConfiguration:)()
{
  return WDSClientConfiguration.init(networkConfiguration:)();
}

uint64_t dispatch thunk of XPCActivityManagerType.registerActivity(_:handler:)()
{
  return dispatch thunk of XPCActivityManagerType.registerActivity(_:handler:)();
}

uint64_t dispatch thunk of XPCActivityManagerType.checkIn()()
{
  return dispatch thunk of XPCActivityManagerType.checkIn()();
}

uint64_t WDSAuthenticatorFactory.init(clientConfigurationProvider:)()
{
  return WDSAuthenticatorFactory.init(clientConfigurationProvider:)();
}

uint64_t type metadata accessor for WDSAuthenticatorFactory()
{
  return type metadata accessor for WDSAuthenticatorFactory();
}

uint64_t dispatch thunk of WDSAuthenticatorFactoryType.makeAuthenticator(for:version:isJWTEnabled:)()
{
  return dispatch thunk of WDSAuthenticatorFactoryType.makeAuthenticator(for:version:isJWTEnabled:)();
}

uint64_t GeoJSON<>.assets.getter()
{
  return GeoJSON<>.assets.getter();
}

Swift::Bool __swiftcall GeoJSON.contains(_:)(CLLocationCoordinate2D a1)
{
  return GeoJSON.contains(_:)((__n128)__PAIR128__(v1, *(unint64_t *)&a1.latitude), (__n128)__PAIR128__(v2, *(unint64_t *)&a1.longitude));
}

uint64_t type metadata accessor for Urgency()
{
  return type metadata accessor for Urgency();
}

uint64_t Metadata.readTime.getter()
{
  return Metadata.readTime.getter();
}

uint64_t type metadata accessor for Metadata()
{
  return type metadata accessor for Metadata();
}

uint64_t type metadata accessor for Severity()
{
  return type metadata accessor for Severity();
}

uint64_t type metadata accessor for Certainty()
{
  return type metadata accessor for Certainty();
}

uint64_t SessionData.init(utcOffset:languageCode:countryCode:startMethod:productType:locationAccess:cellularRadioAccessTechnology:userSegmentationTreatmentIDs:userSegmentationSegmentSetIDs:)()
{
  return SessionData.init(utcOffset:languageCode:countryCode:startMethod:productType:locationAccess:cellularRadioAccessTechnology:userSegmentationTreatmentIDs:userSegmentationSegmentSetIDs:)();
}

uint64_t type metadata accessor for SessionData()
{
  return type metadata accessor for SessionData();
}

uint64_t type metadata accessor for StartMethod()
{
  return type metadata accessor for StartMethod();
}

uint64_t LocationData.init(latitudeDouble:longitudeDouble:)()
{
  return LocationData.init(latitudeDouble:longitudeDouble:)();
}

uint64_t type metadata accessor for LocationData()
{
  return type metadata accessor for LocationData();
}

uint64_t type metadata accessor for LocationAccessData()
{
  return type metadata accessor for LocationAccessData();
}

uint64_t PrecipitationForecastData.init(date:summaries:)()
{
  return PrecipitationForecastData.init(date:summaries:)();
}

uint64_t type metadata accessor for PrecipitationForecastData()
{
  return type metadata accessor for PrecipitationForecastData();
}

uint64_t type metadata accessor for CellularRadioAccessTechnology()
{
  return type metadata accessor for CellularRadioAccessTechnology();
}

uint64_t type metadata accessor for PrecipitationNotificationType()
{
  return type metadata accessor for PrecipitationNotificationType();
}

uint64_t dispatch thunk of LocationAccessDataProviderType.locationAccessData.getter()
{
  return dispatch thunk of LocationAccessDataProviderType.locationAccessData.getter();
}

uint64_t MissedPrecipitationNotificationData.init(notificationType:currentPrecipitationForecastData:previousPrecipitationForecastData:)()
{
  return MissedPrecipitationNotificationData.init(notificationType:currentPrecipitationForecastData:previousPrecipitationForecastData:)();
}

uint64_t type metadata accessor for MissedPrecipitationNotificationData()
{
  return type metadata accessor for MissedPrecipitationNotificationData();
}

uint64_t type metadata accessor for PrecipitationNotificationMissedEvent()
{
  return type metadata accessor for PrecipitationNotificationMissedEvent();
}

uint64_t dispatch thunk of CellularRadioAccessTechnologyProviderType.cellularRadioAccessTechnology.getter()
{
  return dispatch thunk of CellularRadioAccessTechnologyProviderType.cellularRadioAccessTechnology.getter();
}

uint64_t NonAppCellularRadioAccessTechnologyProvider.init()()
{
  return NonAppCellularRadioAccessTechnologyProvider.init()();
}

uint64_t type metadata accessor for NonAppCellularRadioAccessTechnologyProvider()
{
  return type metadata accessor for NonAppCellularRadioAccessTechnologyProvider();
}

uint64_t static Logger.notifications.getter()
{
  return static Logger.notifications.getter();
}

uint64_t static Logger.xpc.getter()
{
  return static Logger.xpc.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for Expression()
{
  return type metadata accessor for Expression();
}

uint64_t static AssertionOptions.weatherAssertions.getter()
{
  return static AssertionOptions.weatherAssertions.getter();
}

uint64_t type metadata accessor for AssertionOptions()
{
  return type metadata accessor for AssertionOptions();
}

uint64_t && infix(_:_:)()
{
  return && infix(_:_:)();
}

uint64_t == infix(_:_:)()
{
  return == infix(_:_:)();
}

uint64_t >= infix(_:_:)()
{
  return >= infix(_:_:)();
}

uint64_t <= infix(_:_:)()
{
  return <= infix(_:_:)();
}

uint64_t dispatch thunk of Save.entity(_:)()
{
  return dispatch thunk of Save.entity(_:)();
}

uint64_t dispatch thunk of Query.first(_:orderBy:)()
{
  return dispatch thunk of Query.first(_:orderBy:)();
}

uint64_t dispatch thunk of Query.where(_:orderBy:limit:)()
{
  return dispatch thunk of Query.where(_:orderBy:limit:)();
}

uint64_t dispatch thunk of Table.save.getter()
{
  return dispatch thunk of Table.save.getter();
}

uint64_t dispatch thunk of Table.query.getter()
{
  return dispatch thunk of Table.query.getter();
}

uint64_t dispatch thunk of Table.delete.getter()
{
  return dispatch thunk of Table.delete.getter();
}

uint64_t dispatch thunk of Column.value.getter()
{
  return dispatch thunk of Column.value.getter();
}

uint64_t dispatch thunk of Delete.where(_:)()
{
  return dispatch thunk of Delete.where(_:)();
}

uint64_t type metadata accessor for OrderBy()
{
  return type metadata accessor for OrderBy();
}

uint64_t type metadata accessor for Database.VacuumMode()
{
  return type metadata accessor for Database.VacuumMode();
}

uint64_t type metadata accessor for Database.RecoveryMode()
{
  return type metadata accessor for Database.RecoveryMode();
}

uint64_t Database.init(location:assertions:journalingMode:recoveryMode:preferredCacheSize:vacuumMode:busyTimeout:)()
{
  return Database.init(location:assertions:journalingMode:recoveryMode:preferredCacheSize:vacuumMode:busyTimeout:)();
}

uint64_t type metadata accessor for Database.JournalingMode()
{
  return type metadata accessor for Database.JournalingMode();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.incrementalVacuum()()
{
}

uint64_t Database.Location.path.getter()
{
  return Database.Location.path.getter();
}

uint64_t type metadata accessor for Database.Location()
{
  return type metadata accessor for Database.Location();
}

uint64_t Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)()
{
  return Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)();
}

uint64_t type metadata accessor for Database.CacheSize()
{
  return type metadata accessor for Database.CacheSize();
}

uint64_t type metadata accessor for Database()
{
  return type metadata accessor for Database();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.background.getter()
{
  return static DispatchQoS.background.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.identifier.getter()
{
  return String.identifier.getter();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t Sequence.groupedBy<A>(_:)()
{
  return Sequence.groupedBy<A>(_:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t Array<A>.contains(_:)()
{
  return Array<A>.contains(_:)();
}

uint64_t Double.description.getter()
{
  return Double.description.getter();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static NSOperationQueue.cloudChannels.getter()
{
  return static NSOperationQueue.cloudChannels.getter();
}

uint64_t static NSOperationQueue.notifications.getter()
{
  return static NSOperationQueue.notifications.getter();
}

uint64_t OS_dispatch_group.notify(qos:flags:queue:execute:)()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t static OS_dispatch_queue.notifications.getter()
{
  return static OS_dispatch_queue.notifications.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

CLLocationCoordinate2D __swiftcall CLLocationCoordinate2D.rounded(with:)(Swift::Int with)
{
  CLLocationCoordinate2D.rounded(with:)(with);
  result.longitude = v2;
  result.latitude = v1;
  return result;
}

uint64_t UNUserNotificationCenter.addNotificationRequest(_:)()
{
  return UNUserNotificationCenter.addNotificationRequest(_:)();
}

uint64_t UNUserNotificationCenter.deliveredNotifications()()
{
  return UNUserNotificationCenter.deliveredNotifications()();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return _HashTable.occupiedBucket(after:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t _NativeDictionary._delete(at:)()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return Hasher.finalize()();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t Hasher.init()()
{
  return Hasher.init()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t WDDeviceUnlockedSinceBoot()
{
  return _WDDeviceUnlockedSinceBoot();
}

uint64_t WDWeatherAppIsInstalled()
{
  return _WDWeatherAppIsInstalled();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_main(void)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void exit(int a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_getValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValue:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithBytes:objCType:");
}