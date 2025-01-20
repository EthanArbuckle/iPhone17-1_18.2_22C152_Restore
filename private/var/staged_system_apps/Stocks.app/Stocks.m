uint64_t sub_100006428@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for SceneProvider();
  swift_allocObject();
  result = SceneProvider.init()();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for SceneProvider;
  *a1 = result;
  return result;
}

unint64_t sub_100006480()
{
  unint64_t result = qword_100055570;
  if (!qword_100055570)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100055570);
  }
  return result;
}

void *sub_1000064C0()
{
  unint64_t result = *(void **)(v0 + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler);
  if (result)
  {
    [result tickleWithQualityOfService:9 data:1 completion:0];
    type metadata accessor for MainActor();
    __chkstk_darwin();
    v2[2] = v0;
    return (void *)sub_1000088F0((uint64_t)sub_1000167F4, (uint64_t)v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for StocksUserActivityIntentSerializer()
{
  return self;
}

uint64_t sub_1000065A0()
{
  uint64_t result = type metadata accessor for StartupTaskExecutionPhase();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_100006648()
{
  if (!qword_100055530)
  {
    type metadata accessor for TaskPriority();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, &qword_100055530);
    }
  }
}

uint64_t type metadata accessor for StocksUserActivityIntentDeserializer()
{
  return self;
}

uint64_t type metadata accessor for DebugAssembly()
{
  return self;
}

uint64_t type metadata accessor for SettingsAssembly()
{
  return self;
}

uint64_t sub_10000670C()
{
  ProxyContainer.public.getter();
  sub_100015F60(0, &qword_100055208, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();

  return swift_release();
}

uint64_t sub_100006798()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return _swift_task_switch(sub_10000B910, v3, v2);
}

void sub_1000068F8()
{
  if (!qword_100054950)
  {
    sub_100014F1C(255, &qword_100054928, (uint64_t (*)(uint64_t))sub_100016C04, sub_100016C4C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for Publishers.RemoveDuplicates);
    type metadata accessor for PriceChangeDisplay();
    sub_100016C80();
    unint64_t v0 = type metadata accessor for Publishers.MapKeyPath();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100054950);
    }
  }
}

uint64_t sub_1000069B8()
{
  swift_retain();
  asyncMain(block:)();

  return swift_release();
}

uint64_t sub_100006A04(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType();

  return SceneStateMonitor.sceneWillConnectToSession(withOptions:)(a1, ObjectType);
}

void *sub_100006A54(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000157F4(0, &qword_100054708, (void (*)(uint64_t))sub_1000154A8);
      v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      v10 = _swiftEmptyArrayStorage;
      v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1000158A8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void sub_100006B7C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10000CC8C(v4);
}

uint64_t sub_100006BE4()
{
  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100016810, v1, v0);
}

uint64_t type metadata accessor for Application()
{
  return self;
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

uint64_t sub_100006D68(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  v2[14] = type metadata accessor for MainActor();
  v2[15] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[16] = v4;
  v2[17] = v3;
  return _swift_task_switch(sub_10000E6A0, v4, v3);
}

id sub_100006E04()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v0[OBJC_IVAR____TtC9StocksApp11AppDelegate_mainScene] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___containerManager] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___container] = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___resolver];
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  uint64_t v3 = &v0[OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___menuManager];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___tracker] = 0;
  v5.receiver = v0;
  v5.super_class = ObjectType;
  return [super init];
}

uint64_t sub_100006E94(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t type metadata accessor for StubGizmoSyncManager()
{
  return self;
}

void sub_100006F60()
{
  if (!qword_100054938)
  {
    type metadata accessor for Watchlist();
    unint64_t v0 = type metadata accessor for CurrentValueSubject();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100054938);
    }
  }
}

uint64_t sub_100006FC8()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100007078(void *a1)
{
  sub_1000136F8(a1, a1[3]);
  sub_10001378C(0, &qword_1000549C8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v4)
  {
    type metadata accessor for PrivateDataPollingManager();
    uint64_t v2 = swift_allocObject();
    sub_10001393C(&v3, v2 + 16);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100007118()
{
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t type metadata accessor for ActivityAssembly()
{
  return self;
}

uint64_t sub_100007184(uint64_t a1, void *a2)
{
  sub_1000136F8(a2, a2[3]);
  uint64_t v2 = type metadata accessor for AppIntentsDependencyStartupTask();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v4 = result;
    v5[3] = v2;
    v5[4] = sub_100007F20(&qword_100054618, (void (*)(uint64_t))type metadata accessor for AppIntentsDependencyStartupTask);
    v5[0] = v4;
    StartupTaskManager.onStartup(run:)();
    return sub_10001373C((uint64_t)v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for ManagerAssembly()
{
  return self;
}

void sub_100007270()
{
  if (!qword_100053F98)
  {
    type metadata accessor for AppEvent();
    sub_100010CC4(&qword_100053FA0, 255, (void (*)(uint64_t))&type metadata accessor for AppEvent);
    unint64_t v0 = type metadata accessor for _SetStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100053F98);
    }
  }
}

void sub_100007308(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10000DE94();
}

uint64_t sub_100007368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t ObjectType = swift_getObjectType();

  return Configurable.setting<A>(_:defaultValue:)(a1, a2, ObjectType, a6);
}

uint64_t sub_1000073D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[2] = a6;
  v7[3] = a7;
  v7[4] = type metadata accessor for MainActor();
  v7[5] = static MainActor.shared.getter();
  uint64_t v9 = (void *)swift_task_alloc();
  v7[6] = v9;
  *uint64_t v9 = v7;
  v9[1] = sub_100006BE4;
  return sub_100006D68(a5);
}

void sub_100007490()
{
  if (!qword_100054D10[0])
  {
    type metadata accessor for URL();
    sub_100016028(255, (unint64_t *)&qword_100054110, (uint64_t)&type metadata for String, (uint64_t (*)(void, uint64_t))&type metadata accessor for Optional);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, qword_100054D10);
    }
  }
}

uint64_t sub_100007528()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_1000076B4()
{
  swift_getObjectType();
  type metadata accessor for Capabilities();
  if (static Capabilities.isInternalBuild()())
  {
    if (qword_100053838 != -1) {
      swift_once();
    }
    sub_100010CC4(&qword_100053DE8, v0, (void (*)(uint64_t))type metadata accessor for AppDelegate);
    Configurable.setting<A>(_:)();
    if (LOBYTE(v4[0]) == 1)
    {
      LOBYTE(v4[0]) = 0;
      sub_100010CC4((unint64_t *)&unk_100053FB0, v1, (void (*)(uint64_t))type metadata accessor for AppDelegate);
      Updatable.save<A>(setting:value:)();
      sub_100011310((uint64_t)v4);
      sub_1000136F8(v4, v4[3]);
      type metadata accessor for DebugCacheRegistry();
      if (dispatch thunk of ResolverType.resolve<A>(_:)())
      {
        DebugCacheRegistry.clearCache()();
        swift_release();
        sub_10001373C((uint64_t)v4);
        id v2 = [self defaultCenter];
        long long v3 = (void *)static NSNotificationName.stocksDidClearSharedCache.getter();
        [v2 postNotificationName:v3 object:0];
      }
      else
      {
        __break(1u);
      }
    }
  }
}

uint64_t sub_100007888(void *a1, void *a2)
{
  sub_1000136F8(a1, a1[3]);
  sub_1000136F8(a2, a2[3]);
  type metadata accessor for WidgetContentInvalidationManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_1000137DC(&qword_100054A08, (void (*)(uint64_t))type metadata accessor for WidgetContentInvalidationManager);
    dispatch thunk of StockPriceDataManagerType.addWidgetObserver(_:)();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100007960(uint64_t a1)
{
  type metadata accessor for AppDependencyManager();
  uint64_t v2 = static AppDependencyManager.shared.getter();
  sub_100016F78(a1, (uint64_t)v8);
  type metadata accessor for AppIntentsDependencyStartupTask();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = v3 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_executionPhase;
  uint64_t v5 = enum case for StartupTaskExecutionPhase.didFinishLaunching(_:);
  uint64_t v6 = type metadata accessor for StartupTaskExecutionPhase();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  *(void *)(v3 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_appDependencyManager) = v2;
  sub_10001393C(v8, v3 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver);
  return v3;
}

uint64_t sub_100007A44(void *a1)
{
  sub_1000136F8(a1, a1[3]);
  sub_10001201C(0, &qword_1000549D0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    type metadata accessor for SceneStateManagerBridge();
    swift_allocObject();
    return SceneStateManagerBridge.init(activityReceiver:)();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for PrivateDataPollingManager()
{
  return self;
}

uint64_t sub_100007AF0()
{
  uint64_t v0 = type metadata accessor for Access();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = &v7[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Domain();
  __chkstk_darwin();
  (*(void (**)(unsigned char *, void))(v5 + 104))(&v7[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], enum case for Domain.standard(_:));
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, enum case for Access.public(_:), v0);
  v7[15] = 0;
  sub_100016FDC();
  swift_allocObject();
  uint64_t result = Setting.init(_:defaultValue:domain:access:)();
  static Settings.Debug.clearCacheOnNextLaunch = result;
  return result;
}

uint64_t sub_100007C9C(void *a1, unint64_t *a2)
{
  uint64_t v3 = (uint64_t *)(v2 + *a1);
  if (*v3)
  {
    uint64_t v4 = *v3;
LABEL_5:
    swift_unknownObjectRetain();
    return v4;
  }
  sub_100013824((uint64_t)v9);
  sub_1000136F8(v9, v9[3]);
  sub_10001378C(0, a2);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  uint64_t v4 = v7;
  if (v7)
  {
    sub_10001373C((uint64_t)v9);
    *uint64_t v3 = v7;
    v3[1] = v8;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_100007D78()
{
  uint64_t v1 = OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___containerManager;
  if (*(void *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___containerManager))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___containerManager);
  }
  else
  {
    uint64_t v2 = sub_100010490();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_100007EA8@<X0>(uint64_t (*a1)(void)@<X1>, unint64_t *a2@<X2>, void (*a3)(uint64_t)@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v7 = a1(0);
  uint64_t v8 = swift_allocObject();
  a4[3] = v7;
  uint64_t result = sub_100007F20(a2, a3);
  a4[4] = result;
  *a4 = v8;
  return result;
}

uint64_t sub_100007F20(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100007F68(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  sub_1000114A0(0, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(a2, a1, v7);
  return a2;
}

uint64_t sub_100007FEC(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  sub_1000139D8(0, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(a2, a1, v7);
  return a2;
}

uint64_t sub_100008070(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  sub_1000114A0(0, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_1000080E0(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  sub_1000139D8(0, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_100008150()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ContainerScope();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___container;
  if (*(void *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___container))
  {
    uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___container);
  }
  else
  {
    sub_100007D78();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for ContainerScope.application(_:), v2);
    uint64_t v7 = ContainerManager.container(for:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *(void *)(v1 + v6) = v7;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v7;
}

id sub_1000082A4()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v0[qword_100054BC0] = 0;
  uint64_t v3 = &v0[qword_100054BC8];
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  *(void *)&v0[qword_100054BD0] = 0;
  *(void *)&v0[qword_100054BD8] = 0;
  *(void *)&v0[qword_100054BE0] = 0;
  *(void *)&v0[qword_100054BE8] = 0;
  uint64_t v4 = &v0[qword_100054BF0];
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(void *)&v0[qword_100054BF8] = 0;
  uint64_t v5 = &v0[qword_100054C00];
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *(void *)&v0[qword_100054C08] = 0;
  *(void *)&v0[qword_100054C10] = 0;
  *(void *)&v0[qword_100054C18] = 0;
  uint64_t v6 = &v0[qword_100054C20];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v0[qword_100054C28];
  sub_100007490();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = qword_100054C30;
  char v18 = 0;
  sub_100016F14();
  swift_allocObject();
  v10 = v1;
  *(void *)&v1[v9] = StateMachine.init(state:)();
  v10[qword_100054C38] = 0;
  uint64_t v11 = &v10[qword_100054C40];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  uint64_t v12 = &v10[qword_100054C48];
  *(_OWORD *)uint64_t v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((void *)v12 + 4) = 0;
  v13 = &v10[qword_100054C50];
  *(void *)v13 = 0;
  *((void *)v13 + 1) = 0;
  v14 = &v10[qword_100054C58];
  *(void *)v14 = 0;
  *((void *)v14 + 1) = 0;
  *(void *)&v10[qword_100054C60] = 0;
  uint64_t v15 = qword_100054C68;
  *(void *)&v10[v15] = sub_100016074((uint64_t)_swiftEmptyArrayStorage);

  v17.receiver = v10;
  v17.super_class = ObjectType;
  return [super init];
}

uint64_t sub_100008558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  static MainActor.shared.getter();
  swift_release();
  swift_task_getMainExecutor();
  if (swift_task_isCurrentExecutor())
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = a2;
    sub_100015524(v14);
    if (v4)
    {
      swift_release();
      return a4;
    }
    a4 = v14[0];
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return a4;
    }
    __break(1u);
  }
  v14[0] = 0;
  v14[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(66);
  v11._object = (void *)0x8000000100041840;
  v11._countAndFlagsBits = 0xD00000000000003FLL;
  String.append(_:)(v11);
  v12._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 46;
  v13._object = (void *)0xE100000000000000;
  String.append(_:)(v13);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000086E8()
{
  uint64_t v0 = type metadata accessor for CallbackScope();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProxyContainer.callback.getter();
  sub_1000136F8(v6, v6[3]);
  type metadata accessor for DebugDataSource();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for CallbackScope.any(_:), v0);
  swift_retain();
  dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_10001373C((uint64_t)v6);
}

void sub_100008858(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a1;
  sub_10000ECF4(v8, v9, v10);
}

uint64_t sub_1000088F0(uint64_t a1, uint64_t a2)
{
  static MainActor.shared.getter();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_1000154FC();
  if (v2) {
    return swift_release();
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_6:
    _StringGuts.grow(_:)(66);
    v8._object = (void *)0x8000000100041840;
    v8._countAndFlagsBits = 0xD00000000000003FLL;
    String.append(_:)(v8);
    v9._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    v10._countAndFlagsBits = 46;
    v10._object = (void *)0xE100000000000000;
    String.append(_:)(v10);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t sub_100008A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100015DD0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100008C20()
{
  uint64_t v0 = type metadata accessor for StartupTaskExecutionPhase();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011310((uint64_t)v6);
  sub_1000136F8(v6, v6[3]);
  type metadata accessor for StartupTaskManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_10001373C((uint64_t)v6);
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for StartupTaskExecutionPhase.afterLaunching(_:), v0);
    StartupTaskManager.startAllTasks(launchOptions:phase:)();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    [self popHighPriorityTaskInFlight];
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100008D84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_executionPhase;
  uint64_t v4 = type metadata accessor for StartupTaskExecutionPhase();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

void sub_100008DFC(uint64_t a1, const char *a2, char a3)
{
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, a2, v7, 2u);
    swift_slowDealloc();
  }

  sub_10000C9A8(a3 & 1);
}

uint64_t sub_100008EB4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_100008F14(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_beginAccess();
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = v5 + 40;
    do
    {
      uint64_t v8 = *(void (**)(uint64_t *))(v7 - 8);
      uint64_t v9 = a1;
      swift_retain();
      v8(&v9);
      swift_release();
      v7 += 16;
      --v6;
    }
    while (v6);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100008FB4(void *a1, void *a2)
{
  sub_1000136F8(a1, a1[3]);
  sub_1000136F8(a2, a2[3]);
  sub_10001378C(0, &qword_1000548B8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v4)
  {
    dispatch thunk of WatchlistManagerType.addObserver(_:)();
    swift_unknownObjectRelease();
    sub_1000136F8(a2, a2[3]);
    type metadata accessor for WidgetContentInvalidationManager();
    uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
    if (result)
    {
      sub_1000137DC((unint64_t *)&unk_100054A10, (void (*)(uint64_t))type metadata accessor for WidgetContentInvalidationManager);
      dispatch thunk of WatchlistManagerType.addObserver(_:)();
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100009104(void *a1)
{
  uint64_t v2 = v1;
  sub_1000152E4(0, &qword_100054EB8, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4 - 8);
  uint64_t v8 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  Swift::String v10 = (char *)&v36 - v9;
  id v11 = *(void **)&v1[qword_100054C18];
  id v12 = v11;
  id v13 = sub_10000A76C(v11);

  if (v13)
  {
    sub_1000257D8(&qword_100054BD8, (void (*)(void))&type metadata accessor for StocksV2UserActivityDeserializer);
    StocksV2UserActivityDeserializer.deserialize(userActivity:)();
    swift_release();
    CFTimeInterval v14 = CACurrentMediaTime();
    char v40 = 1;
    sub_10002A774();
    uint64_t v36 = v5;
    swift_allocObject();
    StateMachineTransition.init(state:)();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v13;
    *(void *)(v15 + 24) = a1;
    id v37 = v13;
    id v16 = a1;
    StateMachineTransition.didEnter(block:)();
    swift_release();
    swift_release();
    StateMachine.add(transition:)();
    swift_release();
    char v39 = 1;
    uint64_t v17 = (uint64_t)v10;
    swift_allocObject();
    StateMachineTransition.init(state:)();
    uint64_t v18 = swift_allocObject();
    *(CFTimeInterval *)(v18 + 16) = v14;
    *(void *)(v18 + 24) = v16;
    id v19 = v16;
    StateMachineTransition.willExit(block:)();
    swift_release();
    swift_release();
    StateMachine.add(transition:)();
    swift_release();
    sub_1000257D8(&qword_100054BE0, sub_100020C34);
    sub_10002A8A4((uint64_t)v10, (uint64_t)v8, (uint64_t)&qword_100054EB8, (uint64_t)&type metadata accessor for StocksActivity, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1000152E4);
    unint64_t v20 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    uint64_t v21 = swift_allocObject();
    sub_10002AA80((uint64_t)v8, v21 + v20);
    *(void *)(v21 + ((v6 + v20 + 7) & 0xFFFFFFFFFFFFFFF8)) = v2;
    id v22 = v2;
    dispatch thunk of StackNavigator.onNavigationStart(closure:)();
    swift_release();
    swift_release();
    char v38 = 0;
    uint64_t v23 = StateMachine.fire(event:)();
    __chkstk_darwin(v23);
    *(&v36 - 2) = (uint64_t)v22;
    sub_100016028(0, &qword_100054EC0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for Promise);
    swift_allocObject();
    Promise.init(resolver:)();
    uint64_t v24 = swift_allocObject();
    v25 = v37;
    *(void *)(v24 + 16) = v22;
    *(void *)(v24 + 24) = v25;
    id v26 = v25;
    id v27 = v22;
    v28 = (void *)zalgo.getter();
    Promise.then<A>(on:closure:)();
    swift_release();
    swift_release();

    firstly<A>(closure:)();
    *(void *)(swift_allocObject() + 16) = v27;
    id v29 = v27;
    v30 = (void *)zalgo.getter();
    Promise.then<A>(on:closure:)();
    swift_release();
    swift_release();

    sub_100013EC4(0, (unint64_t *)&unk_100055100);
    v31 = (void *)static OS_dispatch_queue.main.getter();
    *(void *)(swift_allocObject() + 16) = v29;
    id v32 = v29;
    uint64_t v33 = Promise.error(on:closure:)();

    swift_release();
    swift_release();
    swift_release();
    sub_100015224(v17, (uint64_t)&qword_100054EB8, (uint64_t)&type metadata accessor for StocksActivity, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
    return v33;
  }
  else
  {
    sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
    v35 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    sub_100016028(0, &qword_100054EC0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for Promise);
    swift_allocObject();
    return Promise.init(value:)();
  }
}

void *sub_1000097F0(uint64_t a1, uint64_t a2)
{
  sub_100006648();
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = *(void **)&v2[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler];
  if (result)
  {
    id v9 = [result mergedData];
    uint64_t v10 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
    type metadata accessor for MainActor();
    id v11 = v2;
    swift_retain();
    uint64_t v12 = static MainActor.shared.getter();
    id v13 = (void *)swift_allocObject();
    v13[2] = v12;
    v13[3] = &protocol witness table for MainActor;
    v13[4] = v11;
    v13[5] = v9;
    v13[6] = a1;
    v13[7] = a2;
    sub_100008A7C((uint64_t)v7, (uint64_t)&unk_100055540, (uint64_t)v13);
    return (void *)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000994C(uint64_t a1, id a2, unsigned char *a3, void *a4)
{
  id v62 = a4;
  uint64_t v7 = type metadata accessor for SidebarConfiguration();
  uint64_t v66 = *(void *)(v7 - 8);
  uint64_t v67 = v7;
  __chkstk_darwin(v7);
  v65 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000152E4(0, &qword_100054D08, (uint64_t (*)(uint64_t))sub_100007490, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v56 - v10;
  uint64_t v69 = type metadata accessor for URL();
  uint64_t v68 = *(void *)(v69 - 8);
  uint64_t v12 = __chkstk_darwin(v69);
  uint64_t v63 = v13;
  v64 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v56 - v14;
  id v16 = [a2 URLContexts];
  sub_100013EC4(0, (unint64_t *)&unk_100054A20);
  sub_100013A90(&qword_100054DF0, (unint64_t *)&unk_100054A20);
  uint64_t v17 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v18 = (void *)sub_100023EC8(v17);
  swift_bridgeObjectRelease();
  if (v18)
  {
    uint64_t v60 = v4;
    id v61 = a2;
    v59 = a3;
    id v19 = [v18 URL];
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    id v20 = [v62 session];
    id v21 = [v20 persistentIdentifier];

    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v56 = v23;
    uint64_t v57 = v22;

    sub_100007490();
    uint64_t v25 = v24;
    id v26 = (uint64_t *)&v11[*(int *)(v24 + 48)];
    id v27 = *(void (**)(char *, id, uint64_t))(v68 + 16);
    v58 = v11;
    v28 = v11;
    id v29 = v27;
    id v62 = v15;
    v27(v28, v15, v69);
    id v30 = [v18 options];
    id v31 = [v30 sourceApplication];

    if (v31 || (id v31 = [v61 sourceApplication]) != 0)
    {
      uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v34 = v33;
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v34 = 0;
    }
    *id v26 = v32;
    v26[1] = v34;
    uint64_t v35 = (uint64_t)v58;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v58, 0, 1, v25);
    uint64_t v36 = v59;
    swift_beginAccess();
    sub_100025590(v35, v57, v56);
    swift_endAccess();
    id v37 = v64;
    id v38 = v62;
    uint64_t v39 = v69;
    v29(v64, v62, v69);
    char v40 = v65;
    SidebarConfiguration.init(_:)();
    LOBYTE(v35) = SidebarConfiguration.shouldCollapseSidebar.getter();
    (*(void (**)(char *, uint64_t))(v66 + 8))(v40, v67);
    v36[qword_100054C38] = v35 & 1;
    v29(v37, v38, v39);
    a3 = v36;
    uint64_t v41 = v68;
    unint64_t v42 = (*(unsigned __int8 *)(v68 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
    unint64_t v43 = (v63 + v42 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = a3;
    (*(void (**)(unint64_t, char *, uint64_t))(v41 + 32))(v44 + v42, v37, v39);
    *(void *)(v44 + v43) = v18;
    v45 = a3;
    id v46 = v18;
    v47 = (void *)sub_100013AE0();
    v48 = (void *)zalgoIfMain.getter();
    Bootstrapper.afterBootstrap(on:run:)();

    swift_release();
    (*(void (**)(id, uint64_t))(v41 + 8))(v38, v39);
    a2 = v61;
  }
  id v49 = [a2 shortcutItem];
  if (v49)
  {
    v50 = v49;
    uint64_t v51 = swift_allocObject();
    *(void *)(v51 + 16) = a3;
    *(void *)(v51 + 24) = v50;
    v52 = a3;
    id v53 = v50;
    v54 = (void *)sub_100013AE0();
    v55 = (void *)zalgoIfMain.getter();
    Bootstrapper.afterBootstrap(on:run:)();

    swift_release();
  }
}

int main(int argc, const char **argv, const char **envp)
{
  int v3 = static CommandLine.argc.getter();
  uint64_t v4 = (char **)static CommandLine.unsafeArgv.getter();
  type metadata accessor for Application();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v6 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for AppDelegate();
  uint64_t v7 = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v8 = NSStringFromClass(v7);
  if (!v8)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  UIApplicationMain(v3, v4, v6, v8);

  return 0;
}

void sub_10000A000(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler);
  if (v1)
  {
    uint64_t v2 = self;
    id v3 = v1;
    id v4 = [v2 sharedApplication];
    id v5 = [v4 applicationState];

    [v3 setSuspended:v5 == 0];
  }
  else
  {
    __break(1u);
  }
}

void sub_10000A0A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100016B00(0, &qword_100055578, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t, void *, void *))&type metadata accessor for CheckedContinuation);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - v9;
  id v11 = *(void **)(a2 + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_dropbox);
  uint64_t v22 = sub_100016998;
  uint64_t v23 = a3;
  id v17 = v11;
  aBlock = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  id v20 = sub_100008EB4;
  id v21 = &unk_10004F3D0;
  uint64_t v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v14 + v13, v10, v7);
  uint64_t v22 = sub_1000169A0;
  uint64_t v23 = v14;
  aBlock = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  id v20 = sub_100015E2C;
  id v21 = &unk_10004F420;
  uint64_t v15 = _Block_copy(&aBlock);
  swift_release();
  [v17 depositWithAccessor:v12 completion:v15];
  _Block_release(v15);
  _Block_release(v12);
}

uint64_t sub_10000A300@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for AppIntentExecutionTypeProvider();
  uint64_t v3 = swift_allocObject();
  a1[3] = v2;
  uint64_t result = sub_1000137DC(&qword_1000549E0, (void (*)(uint64_t))type metadata accessor for AppIntentExecutionTypeProvider);
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t type metadata accessor for AppIntentExecutionTypeProvider()
{
  return self;
}

void sub_10000A3A8()
{
  swift_getObjectType();

  SceneStateMonitor.sceneDidBecomeActive()();
}

uint64_t sub_10000A42C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = swift_getObjectType();

  return SceneStateMonitor.sceneDidBecomeActive(with:sourceApplication:sceneID:)(a1, a2, a3, a4, a5, ObjectType);
}

void sub_10000A4AC(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = *a1;
  id v8 = [*a1 purchasedTagIDs];
  if (!v8)
  {
    if (!a2) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  uint64_t v9 = v8;
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  if (!a2)
  {
    if (!v10) {
      goto LABEL_11;
    }
    swift_bridgeObjectRelease();
    v12.super.isa = 0;
    goto LABEL_10;
  }
  if (!v10
    || (swift_bridgeObjectRetain_n(),
        char v11 = sub_100015B2C(a2, v10),
        swift_bridgeObjectRelease_n(),
        swift_bridgeObjectRelease(),
        (v11 & 1) == 0))
  {
LABEL_7:
    v12.super.isa = Set._bridgeToObjectiveC()().super.isa;
LABEL_10:
    [v7 setPurchasedTagIDs:v12.super.isa];

    os_unfair_lock_lock((os_unfair_lock_t)(a3 + 20));
    sub_10003D7D4((unsigned char *)(a3 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 20));
  }
LABEL_11:
  id v13 = [v7 bundleSubscription];
  sub_100006480();
  char v14 = static NSObject.== infix(_:_:)();

  if ((v14 & 1) == 0)
  {
    [v7 setBundleSubscription:a4];
    uint64_t v15 = (unsigned char *)(a3 + 16);
    uint64_t v16 = (os_unfair_lock_s *)(a3 + 20);
    os_unfair_lock_lock(v16);
    sub_10003D3E4(v15);
    os_unfair_lock_unlock(v16);
  }
}

id sub_10000A76C(void *a1)
{
  uint64_t v2 = v1;
  sub_10000A8F4((uint64_t)&v13);
  sub_1000136F8(&v13, v14);
  char v4 = dispatch thunk of WelcomeFlowProviderType.shouldShowWelcome()();
  sub_10001373C((uint64_t)&v13);
  if (v4) {
    return 0;
  }
  unsigned int v5 = [(id)sub_100025898() isStateRestorationFeatureEnabled];
  swift_unknownObjectRelease();
  if (!v5) {
    return 0;
  }
  unsigned int v6 = [(id)sub_100025898() isStateRestorationAllowed];
  swift_unknownObjectRelease();
  id v7 = 0;
  if (v6 && a1)
  {
    id v8 = a1;
    id v7 = [v8 stateRestorationActivity];
    id v9 = v7;
    sub_100025954((uint64_t)&v13);
    sub_10002ACF0((uint64_t)&v13, v14);
    dispatch thunk of StateRestorationActivityProvider.stateRestorationActivity.setter();
    sub_10001393C(&v13, (uint64_t)v12);
    uint64_t v10 = v2 + qword_100054BF0;
    swift_beginAccess();
    sub_100007FEC((uint64_t)v12, v10, &qword_100054DA8, (unint64_t *)&unk_100054DB0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider);
    swift_endAccess();
  }
  return v7;
}

uint64_t sub_10000A8F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_100054C00;
  swift_beginAccess();
  sub_100013954(v3, (uint64_t)&v7, &qword_100054E88, &qword_100054E90, (uint64_t)&protocol descriptor for WelcomeFlowProviderType);
  if (v8) {
    return sub_10001393C(&v7, a1);
  }
  sub_1000080E0((uint64_t)&v7, &qword_100054E88, &qword_100054E90, (uint64_t)&protocol descriptor for WelcomeFlowProviderType);
  sub_100013824((uint64_t)&v7);
  sub_1000136F8(&v7, v8);
  sub_10001378C(0, &qword_100054E90);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v6)
  {
    sub_10001393C(&v5, a1);
    sub_10001373C((uint64_t)&v7);
    sub_100016F78(a1, (uint64_t)&v7);
    swift_beginAccess();
    sub_100007FEC((uint64_t)&v7, v3, &qword_100054E88, &qword_100054E90, (uint64_t)&protocol descriptor for WelcomeFlowProviderType);
    return swift_endAccess();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000AA68(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000AB98(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000AB3C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000AB3C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001373C((uint64_t)v12);
  return v7;
}

uint64_t sub_10000AB3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000AB98(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000AD54(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10000AD54(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000ADEC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000250D4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000250D4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000ADEC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10000AF64(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000AF64(uint64_t a1, uint64_t a2)
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
  sub_10000AFCC();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

void sub_10000AFCC()
{
  if (!qword_100054B18)
  {
    unint64_t v0 = type metadata accessor for _ContiguousArrayStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100054B18);
    }
  }
}

void sub_10000B024()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ContainerScope();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  size_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = qword_100054BC0;
  if (*(void *)(v0 + qword_100054BC0)) {
    goto LABEL_4;
  }
  id v7 = [self sharedApplication];
  id v8 = [v7 delegate];

  if (v8)
  {
    type metadata accessor for AppDelegate();
    swift_dynamicCastClassUnconditional();
    sub_100007D78();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for ContainerScope.scene(_:), v2);
    uint64_t v9 = ContainerManager.container(for:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_unknownObjectRelease();
    *(void *)(v1 + v6) = v9;
    swift_retain();
    swift_release();
LABEL_4:
    swift_retain();
    return;
  }
  __break(1u);
}

uint64_t sub_10000B1E8(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, Strong + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_logger, v4);
    swift_release();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, a3, v11, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_10000C9A8(0);
    return swift_release();
  }
  return result;
}

void sub_10000B3B0()
{
  uint64_t v1 = v0;
  swift_retain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446210;
    int v6 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_queuedInvalidation);
    uint64_t v12 = v5;
    uint64_t v7 = 1702195828;
    if ((v6 & 1) == 0) {
      uint64_t v7 = 0x65736C6166;
    }
    unint64_t v8 = 0xE400000000000000;
    if ((v6 & 1) == 0) {
      unint64_t v8 = 0xE500000000000000;
    }
    if (v6 == 2) {
      uint64_t v9 = 7104878;
    }
    else {
      uint64_t v9 = v7;
    }
    if (v6 == 2) {
      unint64_t v10 = 0xE300000000000000;
    }
    else {
      unint64_t v10 = v8;
    }
    sub_10000AA68(v9, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Processing queued invalidation, queued=%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  int v11 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_queuedInvalidation);
  if (v11 != 2)
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_queuedInvalidation) = 2;
    sub_10000C9A8(v11 & 1);
  }
}

void sub_10000B588()
{
  id v0 = [self sharedApplication];
  id v1 = [v0 connectedScenes];
  sub_100013EC4(0, &qword_1000549B8);
  sub_1000159B0();
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100013BE0(v2);
  swift_bridgeObjectRelease();
  os_log_type_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "sceneDidBecomeActive isLikelyEligible: %{BOOL}d", v5, 8u);
    swift_slowDealloc();
  }

  sub_10000B3B0();
}

uint64_t sub_10000B6FC(void *a1, void *a2)
{
  sub_1000136F8(a1, a1[3]);
  sub_1000136F8(a2, a2[3]);
  type metadata accessor for PrivateDataPollingManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  sub_1000137DC(&qword_1000549F0, (void (*)(uint64_t))type metadata accessor for PrivateDataPollingManager);
  dispatch thunk of SceneStateManagerType.add(monitor:)();
  swift_release();
  sub_10001373C((uint64_t)v5);
  sub_1000136F8(a2, a2[3]);
  type metadata accessor for WidgetContentInvalidationManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_1000137DC(&qword_1000549F8, (void (*)(uint64_t))type metadata accessor for WidgetContentInvalidationManager);
  dispatch thunk of SceneStateManagerType.add(monitor:)();
  swift_release();
  sub_10001373C((uint64_t)v5);
  sub_1000136F8(a2, a2[3]);
  type metadata accessor for StocksTodayAgent();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    os_log_type_t v4 = (void *)result;
    sub_1000137DC(&qword_100054A00, (void (*)(uint64_t))type metadata accessor for StocksTodayAgent);
    dispatch thunk of SceneStateManagerType.add(monitor:)();

    return sub_10001373C((uint64_t)v5);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_10000B910()
{
  uint64_t v14 = v0;
  id v1 = *(os_unfair_lock_s **)(v0 + 152);
  swift_release();
  uint64_t v2 = v1 + 4;
  v1 += 5;
  int v3 = *(unsigned __int8 *)(v0 + 192);
  os_unfair_lock_lock(v1);
  sub_100016A44(v2, v13);
  os_unfair_lock_unlock(v1);
  int v4 = LOBYTE(v13[0]);
  if (LOBYTE(v13[0])) {
    unint64_t v5 = 0xE700000000000000;
  }
  else {
    unint64_t v5 = 0xEA00000000007365;
  }
  swift_bridgeObjectRetain();
  int v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = 0x6572756C696166;
    if (v3) {
      uint64_t v8 = 0x73736563637573;
    }
    if (!v4) {
      uint64_t v8 = 0x676E616863206F6ELL;
    }
    uint64_t v12 = v8;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v13[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446210;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 48) = sub_10000AA68(v12, v5, v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Finished updating today data with result: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if ((v3 & v4) == 1)
  {
    sub_100016B00(0, (unint64_t *)&qword_100054900, (uint64_t)&type metadata for () + 8, (uint64_t (*)(void, uint64_t, void *, void *))&type metadata accessor for PassthroughSubject);
    sub_10003D640();
    Subject<>.send()();
  }
  swift_release();
  swift_release();
  unint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

void sub_10000BBDC(uint64_t a1, uint64_t a2)
{
  sub_1000139D8(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100043A60;
  *(void *)(v4 + 56) = &type metadata for String;
  unint64_t v5 = sub_100016260();
  *(void *)(v4 + 64) = v5;
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 40) = a2;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  sub_1000152E4(0, &qword_100054E80, (uint64_t (*)(uint64_t))&type metadata accessor for DebugWindow, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  swift_bridgeObjectRetain();
  uint64_t v6 = String.init<A>(describing:)();
  *(void *)(v4 + 96) = &type metadata for String;
  *(void *)(v4 + 104) = v5;
  *(void *)(v4 + 72) = v6;
  *(void *)(v4 + 80) = v7;
  swift_beginAccess();
  uint64_t v8 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v8)
  {
    uint64_t v9 = v8;
    unsigned __int8 v10 = [v8 isKeyWindow:Strong];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }
  *(void *)(v4 + 136) = &type metadata for Bool;
  *(void *)(v4 + 144) = &protocol witness table for Bool;
  *(unsigned char *)(v4 + 112) = v10;
  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  int v11 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  type metadata accessor for TrackingConsent();
  uint64_t v12 = (void *)static TrackingConsent.shared.getter();
  TrackingConsent.allow()();
}

uint64_t sub_10000BDD0()
{
  uint64_t v0 = type metadata accessor for CallbackScope();
  uint64_t v14 = *(void *)(v0 - 8);
  uint64_t v15 = v0;
  __chkstk_darwin(v0);
  long long v13 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for Scope();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProxyContainer.public.getter();
  sub_10000C150(0, &qword_100054608);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  uint64_t v6 = enum case for Scope.singleton(_:);
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v7(v5, enum case for Scope.singleton(_:), v2);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  ProxyContainer.public.getter();
  sub_10000C150(0, &qword_100054610);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  v7(v5, v6, v2);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  v8(v5, v2);
  ProxyContainer.private.getter();
  type metadata accessor for AppIntentsDependencyStartupTask();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  swift_release();
  ProxyContainer.callback.getter();
  sub_1000136F8(v16, v16[3]);
  type metadata accessor for StartupTaskManager();
  unsigned __int8 v10 = v13;
  uint64_t v9 = v14;
  uint64_t v11 = v15;
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v13, enum case for CallbackScope.any(_:), v15);
  dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v10, v11);
  return sub_10001373C((uint64_t)v16);
}

uint64_t sub_10000C150(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000C1A0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v33 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v32 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v30 = *(void *)(v4 - 8);
  uint64_t v31 = v4;
  __chkstk_darwin(v4);
  id v29 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for DispatchTime();
  uint64_t v6 = *(void *)(v28 - 8);
  uint64_t v7 = __chkstk_darwin(v28);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v27 - v10;
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, Strong + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_logger, v12);
    swift_release();
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      id v27 = (void (*)(char *, uint64_t))v2;
      *(_WORD *)id v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Attempting widget update for stock list loading", v20, 2u);
      uint64_t v2 = (uint64_t)v27;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  sub_100013EC4(0, (unint64_t *)&unk_100055100);
  id v21 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)();
  id v27 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v22 = v28;
  v27(v9, v28);
  aBlock[4] = sub_1000250CC;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006E94;
  aBlock[3] = &unk_10004EE10;
  uint64_t v23 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  uint64_t v24 = v29;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10000C6DC(&qword_100053F40, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100015E80();
  sub_10000C6DC(&qword_100053F50, (void (*)(uint64_t))sub_100015E80);
  uint64_t v25 = v32;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v2);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v24, v31);
  return ((uint64_t (*)(char *, uint64_t))v27)(v11, v22);
}

uint64_t sub_10000C6DC(unint64_t *a1, void (*a2)(uint64_t))
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

char *sub_10000C724(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = v4;
  Logger.init(subsystem:category:)();
  uint64_t v11 = OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_didWriteTodayDataSubject;
  sub_100016B00(0, (unint64_t *)&qword_100054900, (uint64_t)&type metadata for () + 8, (uint64_t (*)(void, uint64_t, void *, void *))&type metadata accessor for PassthroughSubject);
  swift_allocObject();
  *(void *)&v10[v11] = PassthroughSubject.init()();
  *(void *)&v10[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler] = 0;
  *(void *)&v10[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_purchaseController] = a1;
  *(void *)&v10[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_bundleSubscriptionManager] = a2;
  *(void *)&v10[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_dropbox] = a4;
  id v12 = a1;
  swift_unknownObjectRetain();
  id v13 = a4;

  v27.receiver = v10;
  v27.super_class = ObjectType;
  id v14 = [super init];
  id v15 = objc_allocWithZone((Class)FCBoostableOperationThrottler);
  uint64_t v16 = (char *)v14;
  id v17 = [v15 initWithDelegate:v16];
  uint64_t v18 = OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler;
  os_log_type_t v19 = *(void **)&v16[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler];
  *(void *)&v16[OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_operationThrottler] = v17;

  id v20 = [self defaultCenter];
  [v20 addObserver:v16 selector:"markPurchaseDirty" name:FCPurchaseListChangedNotificationName object:0];

  uint64_t result = (char *)[a2 addObserver:v16];
  uint64_t v22 = *(void **)&v16[v18];
  if (v22)
  {
    uint64_t v23 = self;
    id v24 = v22;
    id v25 = [v23 sharedApplication];
    id v26 = [v25 applicationState];

    [v24 setSuspended:v26 == 0];
    swift_unknownObjectRelease();

    return v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000C9A8(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 67109120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Invalidating widget content onlyIfActive=%{BOOL}d", v6, 8u);
    swift_slowDealloc();
  }

  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_hasCompletedColdLaunch) != 1)
  {
    id v12 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v19))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      id v17 = "Enqueueing invalidation because stock list hasn't loaded yet";
      uint64_t v18 = v12;
      os_log_type_t v16 = v19;
      goto LABEL_10;
    }
LABEL_11:

    int v20 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_queuedInvalidation);
    BOOL v21 = v20 == 2;
    char v22 = v20 & a1;
    if (v21) {
      char v22 = a1;
    }
    *(unsigned char *)(v2 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_queuedInvalidation) = v22 & 1;
    return;
  }
  id v7 = [self sharedApplication];
  id v8 = [v7 connectedScenes];
  sub_100013EC4(0, &qword_1000549B8);
  sub_1000159B0();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100013BE0(v9);
  char v11 = v10;

  swift_bridgeObjectRelease();
  id v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  BOOL v14 = os_log_type_enabled(v12, v13);
  if (v11 & 1) == 0 && (a1)
  {
    if (v14)
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      os_log_type_t v16 = v13;
      id v17 = "Enqueueing invalidation due to not being the active app";
      uint64_t v18 = v12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v18, v16, v17, v15, 2u);
      swift_slowDealloc();
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v14)
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Reloading widget timelines", v23, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for WidgetCenter();
  static WidgetCenter.shared.getter();
  dispatch thunk of WidgetCenter.reloadAllTimelines()();
  swift_release();
}

uint64_t sub_10000CC8C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for StocksActivity();
  uint64_t v57 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000152E4(0, &qword_100054D08, (uint64_t (*)(uint64_t))sub_100007490, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v60 = (uint64_t)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v64 = (char *)&v57 - v10;
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v66 = *(void *)(v11 - 8);
  uint64_t v67 = v11;
  __chkstk_darwin(v11);
  os_log_type_t v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = type metadata accessor for UUID();
  uint64_t v14 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  os_log_type_t v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for Session.Kind();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  int v20 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(v2 + qword_100054C08);
  uint64_t v61 = v2;
  uint64_t v58 = v4;
  v59 = v6;
  id v68 = a1;
  if (v21 || (self, (char v22 = (objc_class *)swift_dynamicCastObjCClass()) == 0))
  {
    LODWORD(v63) = 0;
  }
  else
  {
    uint64_t v63 = v22;
    sub_1000139D8(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v23 = swift_allocObject();
    uint64_t v24 = v23;
    *(_OWORD *)(v23 + 16) = xmmword_100043A40;
    if (*(void *)(v2 + qword_100054C20 + 8))
    {
      uint64_t v25 = *(void *)(v2 + qword_100054C20);
      unint64_t v26 = *(void *)(v2 + qword_100054C20 + 8);
    }
    else
    {
      unint64_t v26 = 0xE300000000000000;
      uint64_t v25 = 7104878;
    }
    *(void *)(v23 + 56) = &type metadata for String;
    *(void *)(v23 + 64) = sub_100016260();
    *(void *)(v24 + 32) = v25;
    *(void *)(v24 + 40) = v26;
    sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
    id v62 = v68;
    swift_bridgeObjectRetain();
    objc_super v27 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    uint64_t v2 = v61;
    uint64_t v28 = *(void **)(v61 + qword_100054C10);
    id v29 = v28;
    sub_100012070(v63, v28);

    LODWORD(v63) = 1;
  }
  sub_100013824((uint64_t)v69);
  sub_1000136F8(v69, v70);
  type metadata accessor for IdentificationResetManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v31 = (void *)result;
  sub_10001373C((uint64_t)v69);
  id v62 = v31;
  IdentificationResetManager.resetIdentifierIfNeeded()();
  sub_100013824((uint64_t)v69);
  sub_1000136F8(v69, v70);
  type metadata accessor for SessionManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_27:
    __break(1u);
    return result;
  }
  sub_10001373C((uint64_t)v69);
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, enum case for Session.Kind.userEvents(_:), v17);
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v65);
  Date.init()();
  SessionManager.start(for:identifier:startDate:timestampJitter:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v13, v67);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  sub_10000E52C((uint64_t)v69);
  sub_1000136F8(v69, v70);
  dispatch thunk of SceneStateManagerType.willEnterForeground()();
  sub_10001373C((uint64_t)v69);
  id v32 = v68;
  id v33 = [v68 session];
  id v34 = [v33 persistentIdentifier];

  uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v37 = v36;

  id v38 = (uint64_t *)(v2 + qword_100054C68);
  swift_beginAccess();
  uint64_t v39 = *v38;
  if (*(void *)(v39 + 16))
  {
    unint64_t v40 = sub_10002F080(v35, v37);
    uint64_t v41 = (uint64_t)v64;
    if (v42)
    {
      unint64_t v43 = v40;
      uint64_t v44 = *(void *)(v39 + 56);
      sub_100007490();
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)(v45 - 8);
      sub_10002A1C8(v44 + *(void *)(v47 + 72) * v43, v41);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v47 + 56))(v41, 0, 1, v46);
    }
    else
    {
      sub_100007490();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v41, 1, 1, v49);
    }
  }
  else
  {
    sub_100007490();
    uint64_t v41 = (uint64_t)v64;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v64, 1, 1, v48);
  }
  char v50 = (char)v63;
  swift_bridgeObjectRelease();
  swift_endAccess();
  if ((v50 & 1) != 0 || [v32 activationState] != (id)2)
  {
    sub_100015224(v41, (uint64_t)&qword_100054D08, (uint64_t)sub_100007490, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
    swift_release();
    return swift_release();
  }
  unsigned int v51 = [(id)sub_100025898() isStateRestorationFeatureEnabled];
  swift_unknownObjectRelease();
  if (!v51)
  {
    uint64_t v53 = v60;
    sub_10002A8A4(v41, v60, (uint64_t)&qword_100054D08, (uint64_t)sub_100007490, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1000152E4);
LABEL_23:
    swift_release();
    swift_release();
    sub_100015224(v53, (uint64_t)&qword_100054D08, (uint64_t)sub_100007490, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
    uint64_t v56 = v41;
    return sub_100015224(v56, (uint64_t)&qword_100054D08, (uint64_t)sub_100007490, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
  }
  unsigned __int8 v52 = [(id)sub_100025898() isStateRestorationAllowed];
  swift_unknownObjectRelease();
  uint64_t v53 = v60;
  sub_10002A8A4(v41, v60, (uint64_t)&qword_100054D08, (uint64_t)sub_100007490, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1000152E4);
  if (v52) {
    goto LABEL_23;
  }
  sub_100007490();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 48))(v53, 1, v54) != 1) {
    goto LABEL_23;
  }
  sub_100015224(v53, (uint64_t)&qword_100054D08, (uint64_t)sub_100007490, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
  v69[0] = sub_1000257D8(&qword_100054BE0, sub_100020C34);
  v55 = v59;
  static StocksActivity.main.getter();
  sub_100020C34(0);
  sub_100013B98((unint64_t *)&unk_100054400, sub_100020C34);
  Navigator.navigateWithoutAnimation(to:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v55, v58);
  swift_release();
  uint64_t v56 = v41;
  return sub_100015224(v56, (uint64_t)&qword_100054D08, (uint64_t)sub_100007490, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
}

uint64_t sub_10000D7A4()
{
  swift_retain();
  AppDependencyManager.addStocksDependencies(using:)();
  swift_release();
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  sub_10001378C(0, &qword_100053EB0);
  swift_retain();
  AppDependencyManager.add<A>(key:dependency:)();
  swift_release();
  sub_10000DDC8((uint64_t)&v4);
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  sub_10001378C(0, &qword_100054300);
  swift_retain();
  AppDependencyManager.add<A>(key:dependency:)();
  swift_release();
  sub_10000DDC8((uint64_t)&v4);
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  sub_10001378C(0, &qword_100054318);
  swift_retain();
  AppDependencyManager.add<A>(key:dependency:)();
  swift_release();
  sub_10000DDC8((uint64_t)&v4);
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  sub_10001378C(0, &qword_100054330);
  swift_retain();
  AppDependencyManager.add<A>(key:dependency:)();
  swift_release();
  sub_10000DDC8((uint64_t)&v4);
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  sub_10001378C(0, &qword_100054348);
  swift_retain();
  AppDependencyManager.add<A>(key:dependency:)();
  swift_release();
  sub_10000DDC8((uint64_t)&v4);
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  sub_100016E78(0, (unint64_t *)&unk_100054360, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for AnyNavigator);
  swift_retain();
  AppDependencyManager.add<A>(key:dependency:)();
  swift_release();
  sub_10000DDC8((uint64_t)&v4);
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  sub_10001378C(0, &qword_100054380);
  swift_retain();
  AppDependencyManager.add<A>(key:dependency:)();
  swift_release();
  sub_10000DDC8((uint64_t)&v4);
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  type metadata accessor for Tracker();
  swift_retain();
  AppDependencyManager.add<A>(key:dependency:)();
  swift_release();
  sub_10000DDC8((uint64_t)&v4);
  AnyHashable.init<A>(_:)();
  sub_10001378C(0, &qword_1000543A8);
  swift_retain();
  AppDependencyManager.add<A>(key:dependency:)();
  swift_release();
  sub_10000DDC8((uint64_t)&v4);
  AnyHashable.init<A>(_:)();
  swift_retain();
  AppDependencyManager.add<A>(key:dependency:)();
  swift_release();
  sub_10000DDC8((uint64_t)&v4);
  AnyHashable.init<A>(_:)();
  swift_retain();
  AppDependencyManager.add<A>(key:dependency:)();
  swift_release();
  sub_10000DDC8((uint64_t)&v4);
  sub_1000136F8((void *)(v0 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver), *(void *)(v0 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver + 24));
  sub_100015A18();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v2 = result;
    type metadata accessor for AppDependencyManager();
    static AppDependencyManager.shared.getter();
    uint64_t v6 = 0;
    long long v4 = 0u;
    long long v5 = 0u;
    *(void *)(swift_allocObject() + 16) = v2;
    swift_unknownObjectRetain();
    AppDependencyManager.add<A>(key:dependency:)();
    swift_release();
    swift_release();
    sub_10000DDC8((uint64_t)&v4);
    sub_10000DE48(0, &qword_100054EC0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for Promise);
    swift_allocObject();
    uint64_t v3 = Promise.init(value:)();
    swift_unknownObjectRelease();
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000DDC8(uint64_t a1)
{
  sub_10000DE48(0, &qword_1000542E8, (uint64_t)&type metadata for AnyHashable, (uint64_t (*)(void, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10000DE48(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_10000DE94()
{
  uint64_t v1 = v0;
  sub_1000152E4(0, &qword_100054DC0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2 - 8);
  uint64_t v31 = (char *)v27 - v3;
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v29 = *(void *)(v4 - 8);
  uint64_t v30 = (void *)v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Session.Kind();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  os_log_type_t v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013824((uint64_t)v33);
  sub_1000136F8(v33, v34);
  type metadata accessor for IdentificationResetManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v15 = result;
  sub_10001373C((uint64_t)v33);
  v27[1] = v15;
  IdentificationResetManager.resetIdentifierIfNeeded()();
  sub_100013824((uint64_t)v33);
  sub_1000136F8(v33, v34);
  type metadata accessor for SessionManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v16 = result;
  sub_10001373C((uint64_t)v33);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for Session.Kind.userEvents(_:), v10);
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v28);
  Date.init()();
  SessionManager.start(for:identifier:startDate:timestampJitter:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void *))(v29 + 8))(v6, v30);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v27[0] = v16;
  SessionManager.tracker.getter();
  type metadata accessor for AppSessionResumeEvent();
  sub_100013B98((unint64_t *)&unk_100054E20, (void (*)(uint64_t))&type metadata accessor for AppSessionResumeEvent);
  Tracker.submit<A>(_:onlyIfTimed:completion:)();
  swift_release();
  sub_10000E52C((uint64_t)v33);
  sub_1000136F8(v33, v34);
  dispatch thunk of SceneStateManagerType.didBecomeActive()();
  sub_10001373C((uint64_t)v33);
  sub_10000E52C((uint64_t)v33);
  uint64_t v28 = v35;
  uint64_t v17 = sub_1000136F8(v33, v34);
  uint64_t v29 = v1;
  uint64_t v30 = v17;
  uint64_t v18 = v1 + qword_100054C28;
  swift_beginAccess();
  sub_100007490();
  uint64_t v20 = v19;
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48);
  uint64_t v22 = 1;
  int v23 = v21(v18, 1, v19);
  uint64_t v24 = type metadata accessor for URL();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = (uint64_t)v31;
  if (!v23)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v31, v18, v24);
    uint64_t v22 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v26, v22, 1, v24);
  if (!v21(v18, 1, v20)) {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  dispatch thunk of SceneStateManagerType.didBecomeActive(with:sourceApplication:sceneID:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100015224(v26, (uint64_t)&qword_100054DC0, (uint64_t)&type metadata accessor for URL, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
  sub_10001373C((uint64_t)v33);
  sub_100013824((uint64_t)v33);
  sub_1000136F8(v33, v34);
  sub_10001378C(0, &qword_100053EB0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v32)
  {
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
    return sub_10001373C((uint64_t)v33);
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000E52C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_100054C48;
  swift_beginAccess();
  sub_100013954(v3, (uint64_t)&v7, &qword_100054E08, &qword_100054E10, (uint64_t)&protocol descriptor for SceneStateManagerType);
  if (v8) {
    return sub_10001393C(&v7, a1);
  }
  sub_1000080E0((uint64_t)&v7, &qword_100054E08, &qword_100054E10, (uint64_t)&protocol descriptor for SceneStateManagerType);
  sub_100013824((uint64_t)&v7);
  sub_1000136F8(&v7, v8);
  sub_10001378C(0, &qword_100054E10);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v6)
  {
    sub_10001393C(&v5, a1);
    sub_10001373C((uint64_t)&v7);
    sub_100016F78(a1, (uint64_t)&v7);
    swift_beginAccess();
    sub_100007FEC((uint64_t)&v7, v3, &qword_100054E08, &qword_100054E10, (uint64_t)&protocol descriptor for SceneStateManagerType);
    return swift_endAccess();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000E6A0()
{
  char v42 = v0;
  uint64_t v2 = v0 + 12;
  uint64_t v1 = v0[12];
  v0[18] = OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_logger;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    long long v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)long long v5 = 136446210;
    uint64_t v41 = v6;
    if (v1) {
      uint64_t v7 = 1702195828;
    }
    else {
      uint64_t v7 = 0x65736C6166;
    }
    if (v1) {
      unint64_t v8 = 0xE400000000000000;
    }
    else {
      unint64_t v8 = 0xE500000000000000;
    }
    v0[9] = sub_10000AA68(v7, v8, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Running operation. isDirty: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    uint64_t v2 = v0 + 12;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (v1)
  {
    uint64_t v9 = v0[12];
    sub_100015848();
    uint64_t v10 = swift_allocObject();
    v0[19] = v10;
    *(_DWORD *)(v10 + 20) = 0;
    *(unsigned char *)(v10 + 16) = 0;
    uint64_t v11 = swift_allocObject();
    v0[20] = v11;
    *(void *)(v11 + 16) = _swiftEmptyArrayStorage;
    if (v9)
    {
      id v12 = [*(id *)(v0[13] + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_purchaseController) allPurchasedTagIDs];
      if (v12)
      {
        os_log_type_t v13 = v12;
        uint64_t v14 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
      }
      else
      {
        uint64_t v14 = 0;
      }
      id v17 = [*(id *)(v0[13] + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_bundleSubscriptionManager) cachedSubscription];
      [v17 copy];

      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      sub_100006480();
      swift_dynamicCast();
      uint64_t v18 = (void *)v0[8];
      swift_bridgeObjectRetain_n();
      uint64_t v19 = v18;
      uint64_t v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v20, v21))
      {
        os_log_type_t v40 = v21;
        uint64_t v39 = v2 - 1;
        uint64_t v22 = swift_slowAlloc();
        *(_DWORD *)uint64_t v22 = 134218496;
        if (v14)
        {
          uint64_t v23 = *(void *)(v14 + 16);
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v23 = 0;
        }
        *(v2 - 5) = v23;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v22 + 12) = 2048;
        id v24 = [v19 bundleChannelIDs];
        uint64_t v25 = v14;
        id v26 = [v24 count];

        v0[10] = v26;
        uint64_t v14 = v25;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        *(_WORD *)(v22 + 22) = 2048;
        id v27 = [v19 subscriptionState];

        *uint64_t v39 = v27;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        _os_log_impl((void *)&_mh_execute_header, v20, v40, "Preparing to update purchases. purchased: %ld, bundle channels: %ld, subscriptionState: %lu", (uint8_t *)v22, 0x20u);
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        uint64_t v20 = v19;
      }

      uint64_t v28 = (void *)swift_allocObject();
      v28[2] = v14;
      v28[3] = v10;
      v28[4] = v19;
      uint64_t v29 = *(void **)(v11 + 16);
      uint64_t v30 = v19;
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v11 + 16) = v29;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v29 = sub_100006A54(0, v29[2] + 1, 1, v29);
        *(void *)(v11 + 16) = v29;
      }
      unint64_t v33 = v29[2];
      unint64_t v32 = v29[3];
      if (v33 >= v32 >> 1) {
        uint64_t v29 = sub_100006A54((void *)(v32 > 1), v33 + 1, 1, v29);
      }
      v29[2] = v33 + 1;
      uint64_t v34 = &v29[2 * v33];
      v34[4] = sub_10001698C;
      v34[5] = v28;
      *(void *)(v11 + 16) = v29;
    }
    uint64_t v35 = v0[13];
    uint64_t v36 = static MainActor.shared.getter();
    v0[21] = v36;
    uint64_t v37 = swift_task_alloc();
    v0[22] = v37;
    *(void *)(v37 + 16) = v35;
    *(void *)(v37 + 24) = v11;
    id v38 = (void *)swift_task_alloc();
    v0[23] = v38;
    *id v38 = v0;
    v38[1] = sub_100006798;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 24, v36, &protocol witness table for MainActor, 0xD000000000000017, 0x8000000100043750, sub_100016A3C, v37, &type metadata for Bool);
  }
  else
  {
    swift_release();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
}

void sub_10000ECF4(void *a1, void *a2, void *a3)
{
  os_log_type_t v4 = v3;
  uint64_t v8 = type metadata accessor for SceneConnectionOptions();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  self;
  id v12 = (objc_class *)swift_dynamicCastObjCClass();
  sub_1000139D8(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  v78 = v12;
  if (v12)
  {
    uint64_t v77 = v8;
    uint64_t v74 = v13;
    uint64_t v14 = swift_allocObject();
    long long v73 = xmmword_100043A40;
    *(_OWORD *)(v14 + 16) = xmmword_100043A40;
    id v76 = a1;
    id v15 = [a2 persistentIdentifier];
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v18 = v17;

    *(void *)(v14 + 56) = &type metadata for String;
    unint64_t v75 = sub_100016260();
    *(void *)(v14 + 64) = v75;
    *(void *)(v14 + 32) = v16;
    *(void *)(v14 + 40) = v18;
    uint64_t v19 = (void *)sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
    uint64_t v20 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    id v21 = [a2 persistentIdentifier];
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v23;

    uint64_t v25 = (uint64_t *)&v4[qword_100054C20];
    uint64_t *v25 = v22;
    v25[1] = v24;
    swift_bridgeObjectRelease();
    id v26 = [self sharedApplication];
    LODWORD(v22) = [v26 isRunningPerformanceTest];

    if (v22)
    {
      sub_100013824((uint64_t)v80);
      sub_1000136F8(v80, v81);
      sub_100013EC4(0, &qword_100053EC0);
      id v27 = (void *)dispatch thunk of ResolverType.resolve<A>(_:)();
      if (!v27) {
        goto LABEL_20;
      }
      uint64_t v28 = v27;
      [v27 runExtendedLaunchTest];

      sub_10001373C((uint64_t)v80);
    }
    v72[1] = v19;
    id v29 = [(objc_class *)v78 sizeRestrictions];
    if (v29)
    {
      uint64_t v30 = v29;
      static MainMetrics.minimumWindowSize.getter();
      [v30 setMinimumSize:];
    }
    uint64_t v31 = *(void **)&v4[qword_100054C10];
    *(void *)&v4[qword_100054C10] = a3;

    unint64_t v32 = *(void **)&v4[qword_100054C18];
    *(void *)&v4[qword_100054C18] = a2;
    v72[0] = a3;
    id v33 = a3;

    id v34 = a2;
    sub_10000E52C((uint64_t)v80);
    sub_1000136F8(v80, v81);
    UISceneConnectionOptions.connectionOptions.getter();
    dispatch thunk of SceneStateManagerType.sceneWillConnectToSession(withOptions:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v77);
    sub_10001373C((uint64_t)v80);
    id v35 = sub_10000A76C(a2);
    if (!v35) {
      goto LABEL_10;
    }
    uint64_t v36 = v35;
    sub_100013824((uint64_t)v80);
    sub_1000136F8(v80, v81);
    sub_10001378C(0, (unint64_t *)&unk_100054EA8);
    dispatch thunk of ResolverType.resolve<A>(_:)();
    if (v79)
    {
      sub_10001373C((uint64_t)v80);
      swift_getObjectType();
      id v37 = v36;
      dispatch thunk of ScrollRestorationManagerType.userActivity.setter();

      swift_unknownObjectRelease();
LABEL_10:
      id v38 = v76;
      id v39 = [v76 activationState];
      if ((unint64_t)v39 < 2)
      {
        uint64_t v40 = swift_allocObject();
        *(_OWORD *)(v40 + 16) = v73;
        id v41 = [v34 persistentIdentifier];
        uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v44 = v43;

        unint64_t v45 = v75;
        *(void *)(v40 + 56) = &type metadata for String;
        *(void *)(v40 + 64) = v45;
        *(void *)(v40 + 32) = v42;
        *(void *)(v40 + 40) = v44;
        uint64_t v46 = (void *)static OS_os_log.default.getter();
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)();
        swift_bridgeObjectRelease();

        sub_100012070(v78, v72[0]);
LABEL_18:
        __chkstk_darwin(v47);
        firstly<A>(closure:)();
        uint64_t v67 = (void *)swift_allocObject();
        v67[2] = v33;
        v67[3] = v4;
        v67[4] = v38;
        id v68 = v38;
        id v69 = v33;
        uint64_t v70 = v4;
        v71 = (void *)zalgo.getter();
        Promise.then<A>(on:closure:)();

        swift_release();
        swift_release();
        swift_release();

        return;
      }
      if (v39 == (id)-1 || v39 == (id)2)
      {
        uint64_t v60 = swift_allocObject();
        *(_OWORD *)(v60 + 16) = v73;
        id v61 = [v34 persistentIdentifier];
        uint64_t v62 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v64 = v63;

        unint64_t v65 = v75;
        *(void *)(v60 + 56) = &type metadata for String;
        *(void *)(v60 + 64) = v65;
        *(void *)(v60 + 32) = v62;
        *(void *)(v60 + 40) = v64;
        uint64_t v66 = (void *)static OS_os_log.default.getter();
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)();
        swift_bridgeObjectRelease();

        goto LABEL_18;
      }
      goto LABEL_21;
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_100043A50;
  id v49 = [a2 persistentIdentifier];
  uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v52 = v51;

  *(void *)(v48 + 56) = &type metadata for String;
  unint64_t v53 = sub_100016260();
  *(void *)(v48 + 64) = v53;
  *(void *)(v48 + 32) = v50;
  *(void *)(v48 + 40) = v52;
  id v54 = a1;
  id v55 = [v54 description];
  uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v58 = v57;

  *(void *)(v48 + 96) = &type metadata for String;
  *(void *)(v48 + 104) = v53;
  *(void *)(v48 + 72) = v56;
  *(void *)(v48 + 80) = v58;
  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  v78 = (objc_class *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();
  v59 = v78;
}

void *sub_10000F534(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppEvent();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_100007270();
    uint64_t v9 = static _SetStorage.allocate(capacity:)();
    uint64_t v10 = 0;
    id v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    id v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    id v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_100010CC4(&qword_100053FA0, 255, (void (*)(uint64_t))&type metadata accessor for AppEvent);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_100010CC4(&qword_100053FA8, 255, (void (*)(uint64_t))&type metadata accessor for AppEvent);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_10000F850(uint64_t a1)
{
  uint64_t v40 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v43 = type metadata accessor for StartupTaskExecutionPhase();
  uint64_t v42 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  id v41 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = type metadata accessor for EventTriggerBehavior();
  uint64_t v49 = *(void *)(v53 - 8);
  uint64_t v50 = v53 - 8;
  uint64_t v51 = v49;
  __chkstk_darwin(v53 - 8);
  uint64_t v52 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v48 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v46 = *(void *)(v7 - 8);
  uint64_t v47 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Container.Environment();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000114A0(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100043A40;
  uint64_t v44 = v1;
  sub_100007D78();
  ContainerManager.containerEnvironment.getter();
  swift_release();
  sub_100010CC4((unint64_t *)&unk_100053F30, 255, (void (*)(uint64_t))&type metadata accessor for Container.Environment);
  uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  *(void *)(v14 + 56) = &type metadata for String;
  *(void *)(v14 + 64) = sub_100016260();
  *(void *)(v14 + 32) = v15;
  *(void *)(v14 + 40) = v17;
  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  unint64_t v18 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  type metadata accessor for Logging();
  static Settings.NewsFeedModule.Layout.enableLogDebugging.getter();
  sub_100010CC4(&qword_100053DE8, v19, (void (*)(uint64_t))type metadata accessor for AppDelegate);
  Configurable.setting<A>(_:)();
  swift_release();
  static Logging.debuggingEnabled.setter();
  sub_100013EC4(0, (unint64_t *)&unk_100055100);
  uint64_t v20 = (void *)static OS_dispatch_queue.global(qualityOfService:)();
  uint64_t v57 = sub_100016748;
  uint64_t v58 = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006E94;
  uint64_t v56 = &unk_10004EB78;
  uint64_t v21 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter();
  v54[0] = &_swiftEmptyArrayStorage;
  sub_100010CC4(&qword_100053F40, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000103C8(0, (unint64_t *)&qword_100053F48, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_10001042C(&qword_100053F50, (unint64_t *)&qword_100053F48, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v48 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v9, v47);
  uint64_t v22 = v44;
  sub_1000076B4();
  [self pushHighPriorityTaskInFlight];
  type metadata accessor for Tracker();
  static Tracker.appEventManager.getter();
  sub_1000103C8(0, &qword_100053F58, (uint64_t (*)(uint64_t))&type metadata accessor for AppEvent, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v23 = type metadata accessor for AppEvent();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(void *)(v24 + 72);
  unint64_t v26 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_100043A50;
  unint64_t v28 = v27 + v26;
  uint64_t v29 = *(void (**)(unint64_t, void, uint64_t))(v24 + 104);
  v29(v28, enum case for AppEvent.stockListDidLoad(_:), v23);
  v29(v28 + v25, enum case for AppEvent.forYouFeedDidLoad(_:), v23);
  sub_10000F534(v27);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_1000103C8(0, &qword_100053F60, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v30 = v51;
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_100043A60;
  static EventTriggerBehavior.onlyOnce.getter();
  static EventTriggerBehavior.eager.getter();
  static EventTriggerBehavior.all.getter();
  aBlock[0] = v31;
  sub_100010CC4(&qword_100053F68, 255, (void (*)(uint64_t))&type metadata accessor for EventTriggerBehavior);
  sub_1000103C8(0, &qword_100053F70, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_10001042C((unint64_t *)&qword_100053F78, &qword_100053F70, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior);
  uint64_t v33 = v52;
  uint64_t v32 = v53;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  *(void *)(swift_allocObject() + 16) = v22;
  v22;
  dispatch thunk of EventManager.trigger(on:behavior:block:)();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v32);
  sub_100011310((uint64_t)aBlock);
  sub_1000136F8(aBlock, (uint64_t)v56);
  type metadata accessor for AppSessionManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  sub_10001373C((uint64_t)aBlock);
  AppSessionManager.startAppSession()();
  sub_100011310((uint64_t)aBlock);
  sub_1000136F8(aBlock, (uint64_t)v56);
  type metadata accessor for StartupTaskManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_10001373C((uint64_t)aBlock);
  if (v40) {
    Dictionary<>.applicationStateLaunchOptions.getter();
  }
  uint64_t v35 = v42;
  uint64_t v36 = v41;
  uint64_t v37 = v43;
  (*(void (**)(char *, void, uint64_t))(v42 + 104))(v41, enum case for StartupTaskExecutionPhase.willFinishLaunching(_:), v43);
  StartupTaskManager.startAllTasks(launchOptions:phase:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v37);
  sub_100011310((uint64_t)aBlock);
  sub_1000136F8(aBlock, (uint64_t)v56);
  sub_10001378C(0, &qword_100053F80);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v54[3])
  {
    sub_100008070((uint64_t)v54, &qword_100053F88, &qword_100053F80, (uint64_t)&protocol descriptor for StocksTabiWorkServiceUnloaderServiceType);
    sub_10001373C((uint64_t)aBlock);
    sub_100013EC4(0, &qword_100053F90);
    id v38 = [(id)swift_getObjCClassFromMetadata() appearance];
    id v39 = [objc_allocWithZone((Class)UIImage) init];
    [v38 setShadowImage:v39];

    swift_release();
    swift_release();
    return 1;
  }
LABEL_9:
  __break(1u);
  return result;
}

void sub_1000103C8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_10001042C(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000103C8(255, a2, a3, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100010490()
{
  sub_1000114A0(0, &qword_100053DF0, &qword_100053DF8, (uint64_t)&protocol descriptor for BundleAssemblyType, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100043A20;
  [objc_allocWithZone((Class)SXSwiftFrameWorkAssembly) init];
  uint64_t v1 = type metadata accessor for BridgedBundleAssembly();
  swift_allocObject();
  uint64_t v2 = BridgedBundleAssembly.init(_:)();
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = &protocol witness table for BridgedBundleAssembly;
  *(void *)(v0 + 32) = v2;
  [objc_allocWithZone((Class)NUSwiftApplicationFrameworkAssembly) init];
  swift_allocObject();
  uint64_t v3 = BridgedBundleAssembly.init(_:)();
  *(void *)(v0 + 96) = v1;
  *(void *)(v0 + 104) = &protocol witness table for BridgedBundleAssembly;
  *(void *)(v0 + 72) = v3;
  [objc_allocWithZone((Class)SNAssembly) init];
  swift_allocObject();
  uint64_t v4 = BridgedBundleAssembly.init(_:)();
  *(void *)(v0 + 136) = v1;
  *(void *)(v0 + 144) = &protocol witness table for BridgedBundleAssembly;
  *(void *)(v0 + 112) = v4;
  uint64_t v5 = (objc_class *)type metadata accessor for Assembly();
  id v6 = [objc_allocWithZone(v5) init];
  *(void *)(v0 + 176) = v5;
  *(void *)(v0 + 184) = sub_100010CC4(&qword_100053E00, 255, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v0 + 152) = v6;
  uint64_t v7 = (objc_class *)type metadata accessor for Assembly();
  id v8 = [objc_allocWithZone(v7) init];
  *(void *)(v0 + 216) = v7;
  *(void *)(v0 + 224) = sub_100010CC4(&qword_100053E08, 255, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v0 + 192) = v8;
  uint64_t v9 = (objc_class *)type metadata accessor for Assembly();
  id v10 = [objc_allocWithZone(v9) init];
  *(void *)(v0 + 256) = v9;
  *(void *)(v0 + 264) = sub_100010CC4(&qword_100053E10, 255, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v0 + 232) = v10;
  uint64_t v11 = (objc_class *)type metadata accessor for Assembly();
  id v12 = [objc_allocWithZone(v11) init];
  *(void *)(v0 + 296) = v11;
  *(void *)(v0 + 304) = sub_100010CC4(&qword_100053E18, 255, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v0 + 272) = v12;
  uint64_t v13 = (objc_class *)type metadata accessor for Assembly();
  id v14 = [objc_allocWithZone(v13) init];
  *(void *)(v0 + 336) = v13;
  *(void *)(v0 + 344) = sub_100010CC4(&qword_100053E20, 255, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v0 + 312) = v14;
  uint64_t v15 = (objc_class *)type metadata accessor for Assembly();
  id v16 = [objc_allocWithZone(v15) init];
  *(void *)(v0 + 376) = v15;
  *(void *)(v0 + 384) = sub_100010CC4(&qword_100053E28, 255, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v0 + 352) = v16;
  uint64_t v17 = type metadata accessor for Assembly();
  swift_allocObject();
  uint64_t v18 = Assembly.init()();
  *(void *)(v0 + 416) = v17;
  *(void *)(v0 + 424) = sub_100010CC4(&qword_100053E30, 255, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v0 + 392) = v18;
  uint64_t v19 = type metadata accessor for Assembly();
  swift_allocObject();
  uint64_t v20 = Assembly.init()();
  *(void *)(v0 + 456) = v19;
  *(void *)(v0 + 464) = sub_100010CC4(&qword_100053E38, 255, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v0 + 432) = v20;
  uint64_t v21 = type metadata accessor for Assembly();
  swift_allocObject();
  uint64_t v22 = Assembly.init()();
  *(void *)(v0 + 496) = v21;
  *(void *)(v0 + 504) = sub_100010CC4(&qword_100053E40, 255, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v0 + 472) = v22;
  uint64_t v23 = type metadata accessor for Assembly();
  swift_allocObject();
  uint64_t v24 = Assembly.init()();
  *(void *)(v0 + 536) = v23;
  *(void *)(v0 + 544) = sub_100010CC4(&qword_100053E48, 255, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v0 + 512) = v24;
  uint64_t v25 = type metadata accessor for FrameworkAssembly();
  swift_allocObject();
  uint64_t v26 = FrameworkAssembly.init()();
  *(void *)(v0 + 576) = v25;
  *(void *)(v0 + 584) = sub_100010CC4(&qword_100053E50, 255, (void (*)(uint64_t))&type metadata accessor for FrameworkAssembly);
  *(void *)(v0 + 552) = v26;
  uint64_t v27 = (objc_class *)type metadata accessor for FrameworkAssembly();
  id v28 = [objc_allocWithZone(v27) init];
  *(void *)(v0 + 616) = v27;
  *(void *)(v0 + 624) = &protocol witness table for FrameworkAssembly;
  *(void *)(v0 + 592) = v28;
  uint64_t v29 = (objc_class *)type metadata accessor for FrameworkAssembly();
  id v30 = [objc_allocWithZone(v29) init];
  *(void *)(v0 + 656) = v29;
  *(void *)(v0 + 664) = sub_100010CC4(&qword_100053E58, 255, (void (*)(uint64_t))&type metadata accessor for FrameworkAssembly);
  *(void *)(v0 + 632) = v30;
  sub_1000114A0(0, &qword_100053E60, &qword_100053E68, (uint64_t)&protocol descriptor for AssemblyType, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_100043A30;
  uint64_t v32 = type metadata accessor for ActivityAssembly();
  uint64_t v33 = swift_allocObject();
  *(void *)(v31 + 56) = v32;
  *(void *)(v31 + 64) = sub_100010CC4(&qword_100053E70, 255, (void (*)(uint64_t))type metadata accessor for ActivityAssembly);
  *(void *)(v31 + 32) = v33;
  uint64_t v34 = type metadata accessor for DebugAssembly();
  uint64_t v35 = swift_allocObject();
  *(void *)(v31 + 96) = v34;
  *(void *)(v31 + 104) = sub_100010CC4(&qword_100053E78, 255, (void (*)(uint64_t))type metadata accessor for DebugAssembly);
  *(void *)(v31 + 72) = v35;
  uint64_t v36 = type metadata accessor for ManagerAssembly();
  uint64_t v37 = swift_allocObject();
  *(void *)(v31 + 136) = v36;
  *(void *)(v31 + 144) = sub_100010CC4(&qword_100053E80, 255, (void (*)(uint64_t))type metadata accessor for ManagerAssembly);
  *(void *)(v31 + 112) = v37;
  uint64_t v38 = type metadata accessor for SettingsAssembly();
  uint64_t v39 = swift_allocObject();
  *(void *)(v31 + 176) = v38;
  *(void *)(v31 + 184) = sub_100010CC4(&qword_100053E88, 255, (void (*)(uint64_t))type metadata accessor for SettingsAssembly);
  *(void *)(v31 + 152) = v39;
  type metadata accessor for SingletonPool();
  swift_allocObject();
  SingletonPool.init()();
  type metadata accessor for ContainerManager();
  swift_allocObject();
  return ContainerManager.init(singletonPool:bundleAssemblies:assemblies:)();
}

uint64_t sub_100010CC4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_100010D0C(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for StartupTaskExecutionPhase();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000114A0(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100043A40;
  id v11 = [a1 applicationState];
  if (!v11)
  {
    unint64_t v12 = 0xE600000000000000;
    uint64_t v13 = 0x657669746361;
    goto LABEL_7;
  }
  if (v11 == (id)1)
  {
    unint64_t v12 = 0xE800000000000000;
    uint64_t v13 = 0x6576697463616E69;
    goto LABEL_7;
  }
  if (v11 == (id)2)
  {
    unint64_t v12 = 0xEA0000000000646ELL;
    uint64_t v13 = 0x756F72676B636162;
LABEL_7:
    *(void *)(v10 + 56) = &type metadata for String;
    *(void *)(v10 + 64) = sub_100016260();
    *(void *)(v10 + 32) = v13;
    *(void *)(v10 + 40) = v12;
    sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
    id v14 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    sub_100011310((uint64_t)v28);
    sub_1000136F8(v28, v29);
    type metadata accessor for StartupTaskManager();
    if (dispatch thunk of ResolverType.resolve<A>(_:)())
    {
      sub_10001373C((uint64_t)v28);
      if (a2) {
        Dictionary<>.applicationStateLaunchOptions.getter();
      }
      (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for StartupTaskExecutionPhase.didFinishLaunching(_:), v6);
      StartupTaskManager.startAllTasks(launchOptions:phase:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      sub_100011310((uint64_t)v28);
      sub_1000136F8(v28, v29);
      type metadata accessor for RemoteNotificationManager();
      if (dispatch thunk of ResolverType.resolve<A>(_:)())
      {
        sub_10001373C((uint64_t)v28);
        *(void *)(swift_allocObject() + 16) = a1;
        id v15 = a1;
        RemoteNotificationManager.whenActive(block:)();
        swift_release();
        sub_100011310((uint64_t)v26);
        sub_1000136F8(v26, v27);
        sub_10001378C(0, &qword_100053F10);
        dispatch thunk of ResolverType.resolve<A>(_:)();
        if (v25)
        {
          sub_10001393C(&v24, (uint64_t)v28);
          sub_10001373C((uint64_t)v26);
          sub_1000136F8(v28, v29);
          if (a2) {
            Dictionary<>.applicationStateLaunchOptions.getter();
          }
          dispatch thunk of ApplicationStateManagerType.applicationDidFinishLaunching(withOptions:)();
          swift_bridgeObjectRelease();
          sub_100011310((uint64_t)v26);
          sub_1000136F8(v26, v27);
          sub_100016DCC();
          uint64_t v16 = dispatch thunk of ResolverType.resolve<A>(_:)();
          if (v16)
          {
            uint64_t v17 = (void *)v16;
            sub_10001373C((uint64_t)v26);
            [v17 prepareForUseWithApplicationDelegate:v3];
            id v18 = [self sharedApplication];
            type metadata accessor for Application();
            uint64_t v19 = swift_dynamicCastClass();
            if (!v19)
            {
              swift_unknownObjectRelease();
              swift_release();
              swift_release();

              goto LABEL_19;
            }
            sub_100011310((uint64_t)&v24);
            sub_1000136F8(&v24, v25);
            sub_10001378C(0, (unint64_t *)&qword_100053F20);
            dispatch thunk of ResolverType.resolve<A>(_:)();
            if (v23)
            {
              sub_10001393C(&v22, (uint64_t)v26);
              sub_10001373C((uint64_t)&v24);
              sub_100016F78((uint64_t)v26, (uint64_t)&v24);
              uint64_t v20 = v19 + OBJC_IVAR____TtC9StocksApp11Application_keyboardInputMonitor;
              swift_beginAccess();
              sub_100007F68((uint64_t)&v24, v20, (unint64_t *)&qword_100053F28, (unint64_t *)&qword_100053F20, (uint64_t)&protocol descriptor for KeyboardInputMonitorType);
              swift_endAccess();
              swift_unknownObjectRelease();
              swift_release();
              swift_release();

              sub_10001373C((uint64_t)v26);
LABEL_19:
              sub_10001373C((uint64_t)v28);
              return v19 != 0;
            }
            goto LABEL_24;
          }
LABEL_23:
          __break(1u);
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_22;
  }
LABEL_25:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100011310@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___resolver;
  swift_beginAccess();
  sub_100011410(v3, (uint64_t)&v5);
  if (v6) {
    return sub_10001393C(&v5, a1);
  }
  sub_100008070((uint64_t)&v5, (unint64_t *)&qword_100053EA0, &qword_1000548B0, (uint64_t)&protocol descriptor for ResolverType);
  sub_100008150();
  Container.resolver.getter();
  swift_release();
  sub_100016F78(a1, (uint64_t)&v5);
  swift_beginAccess();
  sub_100007F68((uint64_t)&v5, v3, (unint64_t *)&qword_100053EA0, &qword_1000548B0, (uint64_t)&protocol descriptor for ResolverType);
  return swift_endAccess();
}

uint64_t sub_100011410(uint64_t a1, uint64_t a2)
{
  sub_1000114A0(0, (unint64_t *)&qword_100053EA0, &qword_1000548B0, (uint64_t)&protocol descriptor for ResolverType, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1000114A0(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_10001378C(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_10001150C(uint64_t a1)
{
  uint64_t v39 = a1;
  uint64_t v1 = type metadata accessor for Container.TestSuite();
  uint64_t v37 = *(void *)(v1 - 8);
  uint64_t v38 = v1;
  __chkstk_darwin(v1);
  uint64_t v36 = (char *)v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for Scope();
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  __chkstk_darwin(v3);
  uint64_t v31 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CallbackScope();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProxyContainer.callback.getter();
  sub_1000136F8(v41, v42);
  sub_10001378C(0, &qword_100054878);
  uint64_t v9 = enum case for CallbackScope.any(_:);
  uint64_t v33 = *(void (**)(char *, void, uint64_t))(v6 + 104);
  LODWORD(v32) = enum case for CallbackScope.any(_:);
  v33(v8, enum case for CallbackScope.any(_:), v5);
  dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v40 = (void (*)(char *, uint64_t))(v6 + 8);
  v10(v8, v5);
  sub_10001373C((uint64_t)v41);
  ProxyContainer.callback.getter();
  sub_1000136F8(v41, v42);
  sub_10001378C(0, (unint64_t *)&unk_100054880);
  uint64_t v11 = v9;
  unint64_t v12 = v33;
  v33(v8, v11, v5);
  v30[2] = v6 + 104;
  dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
  v10(v8, v5);
  sub_10001373C((uint64_t)v41);
  ProxyContainer.callback.getter();
  v30[1] = v43;
  sub_1000136F8(v41, v42);
  sub_10001378C(0, &qword_100054E10);
  uint64_t v13 = v32;
  v12(v8, v32, v5);
  dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
  v10(v8, v5);
  sub_10001373C((uint64_t)v41);
  ProxyContainer.callback.getter();
  sub_1000136F8(v41, v42);
  sub_10001201C(0, &qword_100054890);
  v12(v8, v13, v5);
  dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
  v10(v8, v5);
  sub_10001373C((uint64_t)v41);
  ProxyContainer.public.getter();
  sub_10001378C(0, &qword_100054898);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_10001378C(0, &qword_1000548A0);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  uint64_t v14 = enum case for Scope.containerSingleton(_:);
  uint64_t v16 = v34;
  uint64_t v15 = v35;
  uint64_t v17 = (void (*)(char *, void, uint64_t))(v34 + 104);
  id v18 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 104);
  uint64_t v19 = v31;
  v18(v31, enum case for Scope.containerSingleton(_:), v35);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  uint64_t v40 = *(void (**)(char *, uint64_t))(v16 + 8);
  v40(v19, v15);
  ProxyContainer.public.getter();
  type metadata accessor for Database.CacheSize();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  swift_release();
  ProxyContainer.public.getter();
  sub_10001201C(0, (unint64_t *)&qword_1000548A8);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  uint64_t v32 = v18;
  uint64_t v33 = v17;
  v18(v19, v14, v15);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  uint64_t v20 = v40;
  v40(v19, v15);
  ProxyContainer.public.getter();
  type metadata accessor for SceneStateManagerBridge();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  uint64_t v21 = enum case for Scope.singleton(_:);
  v18(v19, enum case for Scope.singleton(_:), v15);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  v20(v19, v15);
  ProxyContainer.public.getter();
  type metadata accessor for PrivateDataPollingManager();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  v18(v19, v21, v15);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  v20(v19, v15);
  ProxyContainer.public.getter();
  sub_10001378C(0, &qword_1000548B0);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  swift_release();
  ProxyContainer.private.getter();
  type metadata accessor for AppActivationURLHandler();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  swift_release();
  ProxyContainer.private.getter();
  sub_10001378C(0, &qword_1000548B8);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  uint64_t v23 = v36;
  uint64_t v22 = v37;
  uint64_t v24 = v38;
  (*(void (**)(char *, void, uint64_t))(v37 + 104))(v36, enum case for Container.TestSuite.performance(_:), v38);
  Definition.whenTesting(_:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  uint64_t v25 = v15;
  uint64_t v26 = v15;
  uint64_t v27 = v32;
  v32(v19, v21, v26);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  id v28 = v40;
  v40(v19, v25);
  ProxyContainer.private.getter();
  type metadata accessor for WidgetContentInvalidationManager();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  v27(v19, v21, v25);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  v28(v19, v25);
  ProxyContainer.private.getter();
  type metadata accessor for StocksTodayAgent();
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  v27(v19, v21, v25);
  Definition.inScope(_:)();
  swift_release();
  swift_release();
  v28(v19, v25);
  ProxyContainer.private.getter();
  sub_100013EC4(0, (unint64_t *)&unk_1000548C0);
  RegistrationContainer.register<A>(_:name:factory:)();
  swift_release();
  return swift_release();
}

uint64_t sub_10001201C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_100012070(objc_class *a1, void *a2)
{
  v140 = a2;
  v142.super.super.super.Class isa = a1;
  uint64_t v137 = type metadata accessor for URL();
  uint64_t v136 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  v135 = (char *)&v120 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000152E4(0, &qword_100054D08, (uint64_t (*)(uint64_t))sub_100007490, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v4 - 8);
  v138 = (char *)&v120 - v5;
  uint64_t v6 = type metadata accessor for Container.TestSuite();
  uint64_t v141 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v120 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v120 - v10;
  uint64_t v12 = type metadata accessor for Container.Environment();
  uint64_t v139 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v120 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for SidebarConfiguration();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  id v18 = (char *)&v120 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for ThemingStyle();
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v23 = v2;
  if (*(void *)(v2 + qword_100054C08))
  {
    static os_log_type_t.error.getter();
    sub_1000139D8(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v24 = swift_allocObject();
    uint64_t v25 = v24;
    *(_OWORD *)(v24 + 16) = xmmword_100043A40;
    if (*(void *)(v2 + qword_100054C20 + 8))
    {
      uint64_t v26 = *(void *)(v2 + qword_100054C20);
      unint64_t v27 = *(void *)(v23 + qword_100054C20 + 8);
    }
    else
    {
      unint64_t v27 = 0xE300000000000000;
      uint64_t v26 = 7104878;
    }
    *(void *)(v24 + 56) = &type metadata for String;
    *(void *)(v24 + 64) = sub_100016260();
    *(void *)(v25 + 32) = v26;
    *(void *)(v25 + 40) = v27;
    sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
    swift_bridgeObjectRetain();
    v142.super.super.super.Class isa = (Class)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
    Class isa = v142.super.super.super.isa;

    return;
  }
  uint64_t v133 = qword_100054C08;
  v126 = (char *)&v120 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = v22;
  uint64_t v128 = v20;
  v129 = v18;
  uint64_t v121 = v16;
  uint64_t v122 = v15;
  uint64_t v130 = v12;
  v131 = v9;
  v134 = v14;
  v132 = v11;
  sub_100013824((uint64_t)&v153);
  sub_1000136F8(&v153, v154);
  sub_10001378C(0, &qword_100054E40);
  dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v150)
  {
    __break(1u);
    goto LABEL_60;
  }
  uint64_t v28 = v2;
  swift_unknownObjectRelease();
  sub_10001373C((uint64_t)&v153);
  sub_100013824((uint64_t)&v153);
  sub_1000136F8(&v153, v154);
  type metadata accessor for DebugWindow();
  uint64_t v29 = (UIWindow *)swift_allocObject();
  Class v30 = v142.super.super.super.isa;
  v29[2].super.super.super.Class isa = v142.super.super.super.isa;
  uint64_t v31 = v30;
  uint64_t v32 = (void *)dispatch thunk of ResolverType.resolve<A>(_:with:)();
  swift_release();
  if (!v32)
  {
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  sub_10001373C((uint64_t)&v153);
  sub_100013B98((unint64_t *)&unk_100054E48, (void (*)(uint64_t))type metadata accessor for SceneDelegate);
  swift_unknownObjectRetain();
  DebugWindow.debugDelegate.setter();
  uint64_t v33 = *(void **)(v2 + v133);
  *(void *)(v23 + v133) = v32;
  v125 = v32;
  v142.super.super.super.Class isa = (Class)v32;

  sub_1000139D8(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v35 = v34;
  uint64_t v36 = swift_allocObject();
  uint64_t v37 = (void *)v36;
  long long v120 = xmmword_100043A40;
  *(_OWORD *)(v36 + 16) = xmmword_100043A40;
  uint64_t v38 = (uint64_t *)(v28 + qword_100054C20);
  if (*(void *)(v28 + qword_100054C20 + 8))
  {
    uint64_t v39 = *v38;
    unint64_t v40 = *(void *)(v28 + qword_100054C20 + 8);
  }
  else
  {
    unint64_t v40 = 0xE300000000000000;
    uint64_t v39 = 7104878;
  }
  *(void *)(v36 + 56) = &type metadata for String;
  unint64_t v42 = sub_100016260();
  v37[8] = v42;
  v37[4] = v39;
  v37[5] = v40;
  uint64_t v43 = sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  swift_bridgeObjectRetain();
  uint64_t v44 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  sub_100013824((uint64_t)&v150);
  sub_1000136F8(&v150, v151);
  sub_10001378C(0, &qword_1000548A0);
  dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v149) {
    goto LABEL_61;
  }
  sub_10001393C(&v148, (uint64_t)&v153);
  sub_10001373C((uint64_t)&v150);
  sub_1000136F8(&v153, v154);
  dispatch thunk of SceneProviderType.register(_:)();
  id v45 = [self currentDevice];
  id v46 = [v45 userInterfaceIdiom];

  if (!v46)
  {
    uint64_t v47 = *(void **)(v28 + v133);
    if (v47) {
      [v47 setOverrideUserInterfaceStyle:2];
    }
  }
  sub_100007C9C(&qword_100054C50, &qword_100054E98);
  swift_getObjectType();
  dispatch thunk of ToolbarManagerType.registerScene(_:)();
  swift_unknownObjectRelease();
  sub_100013824((uint64_t)&v148);
  sub_1000136F8(&v148, v149);
  sub_10001378C(0, &qword_100054E58);
  dispatch thunk of ResolverType.resolve<A>(_:)();
  uint64_t v48 = v146;
  if (!v146) {
    goto LABEL_62;
  }
  uint64_t v123 = v35;
  unint64_t v124 = v42;
  uint64_t v133 = v43;
  uint64_t v49 = v147;
  sub_1000136F8(&v145, v146);
  id v50 = [(objc_class *)v142.super.super.super.isa traitCollection];
  uint64_t v151 = v48;
  uint64_t v152 = v49;
  sub_100015400(&v150);
  dispatch thunk of DynamicStylerType.dynamic(for:)();

  sub_10001373C((uint64_t)&v145);
  sub_10001373C((uint64_t)&v148);
  dispatch thunk of BaseStylerType.style(window:)();
  dispatch thunk of BaseStylerType.theme.getter();
  sub_1000136F8(&v148, v149);
  uint64_t v51 = v126;
  dispatch thunk of Theming.style.getter();
  int v52 = (*(uint64_t (**)(char *, uint64_t))(v127 + 88))(v51, v128);
  if (v52 == enum case for ThemingStyle.light(_:))
  {
    uint64_t v53 = 1;
    id v54 = v140;
    uint64_t v55 = v6;
    uint64_t v56 = v141;
  }
  else
  {
    id v54 = v140;
    uint64_t v56 = v141;
    if (v52 != enum case for ThemingStyle.dark(_:))
    {
LABEL_65:
      _diagnoseUnexpectedEnumCase<A>(type:)();
      __break(1u);
      return;
    }
    uint64_t v55 = v6;
    uint64_t v53 = 2;
  }
  uint64_t v57 = v129;
  -[objc_class setTs_accessibilityInterfaceStyleIntent:](v142.super.super.super.isa, "setTs_accessibilityInterfaceStyleIntent:", v53, v120);
  sub_10001373C((uint64_t)&v148);
  if (v54
    && (id v58 = [v54 userActivities],
        sub_100013EC4(0, &qword_100054E70),
        sub_100013A90(&qword_100054E78, &qword_100054E70),
        uint64_t v59 = static Set._unconditionallyBridgeFromObjectiveC(_:)(),
        v58,
        uint64_t v60 = (void *)sub_100023EB4(v59),
        swift_bridgeObjectRelease(),
        v60))
  {
    uint64_t v61 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v62 = swift_allocObject();
    *(void *)(v62 + 16) = v61;
    *(void *)(v62 + 24) = v60;
    swift_retain();
    id v63 = v60;
    uint64_t v64 = (void *)sub_100013AE0();
    unint64_t v65 = (void *)zalgoIfMain.getter();
    Bootstrapper.afterBootstrap(on:run:)();
    swift_release();
    swift_release();

    uint64_t v56 = v141;
    sub_1000257D8(&qword_100054BD8, (void (*)(void))&type metadata accessor for StocksV2UserActivityDeserializer);
    id v66 = v63;
    SidebarConfiguration.init(_:userActivity:)();
    uint64_t v67 = v57;
    char v68 = SidebarConfiguration.shouldCollapseSidebar.getter();

    (*(void (**)(char *, uint64_t))(v121 + 8))(v67, v122);
  }
  else
  {
    char v68 = 0;
  }
  type metadata accessor for ContainerEnviromentProvider();
  swift_allocObject();
  ContainerEnviromentProvider.init()();
  id v69 = [self sharedApplication];
  id v70 = [self processInfo];
  v71 = v134;
  ContainerEnviromentProvider.enviroment(for:processInfo:)();
  swift_release();

  uint64_t v72 = v139;
  uint64_t v73 = v130;
  int v74 = (*(uint64_t (**)(char *, uint64_t))(v139 + 88))(v71, v130);
  if (v74 != enum case for Container.Environment.testing(_:))
  {
    if (v74 == enum case for Container.Environment.normal(_:)) {
      goto LABEL_36;
    }
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_31;
  }
  (*(void (**)(char *, uint64_t))(v72 + 96))(v71, v73);
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v132, v71, v55);
  (*(void (**)(char *, void, uint64_t))(v56 + 104))(v131, enum case for Container.TestSuite.performance(_:), v55);
  sub_100013B98(&qword_100054E68, (void (*)(uint64_t))&type metadata accessor for Container.TestSuite);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  if (v148 != v145)
  {
LABEL_31:
    char v75 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_32;
  }
  char v75 = 1;
LABEL_32:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v76 = *(void (**)(char *, uint64_t))(v56 + 8);
  v76(v131, v55);
  if (v75)
  {
    uint64_t v77 = swift_allocObject();
    *(_OWORD *)(v77 + 16) = v120;
    if (v38[1])
    {
      uint64_t v78 = *v38;
      unint64_t v79 = v38[1];
    }
    else
    {
      unint64_t v79 = 0xE300000000000000;
      uint64_t v78 = 7104878;
    }
    v87 = v132;
    unint64_t v88 = v124;
    *(void *)(v77 + 56) = &type metadata for String;
    *(void *)(v77 + 64) = v88;
    *(void *)(v77 + 32) = v78;
    *(void *)(v77 + 40) = v79;
    swift_bridgeObjectRetain();
    v89 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    v90 = (void *)sub_100013AE0();
    Bootstrapper.startBootstrapping(window:shouldOnboard:shouldCollapseSidebar:)(v142, 0, v68 & 1);

    v76(v87, v55);
    v76(v134, v55);
    goto LABEL_42;
  }
  v76(v132, v55);
  v76(v134, v55);
LABEL_36:
  sub_10000A8F4((uint64_t)&v148);
  sub_1000136F8(&v148, v149);
  char v80 = dispatch thunk of WelcomeFlowProviderType.shouldShowWelcome()();
  sub_10001373C((uint64_t)&v148);
  uint64_t v81 = swift_allocObject();
  *(_OWORD *)(v81 + 16) = xmmword_100043A50;
  *(void *)(v81 + 56) = &type metadata for Bool;
  *(void *)(v81 + 64) = &protocol witness table for Bool;
  *(unsigned char *)(v81 + 32) = v80 & 1;
  if (v38[1])
  {
    uint64_t v82 = *v38;
    unint64_t v83 = v38[1];
  }
  else
  {
    unint64_t v83 = 0xE300000000000000;
    uint64_t v82 = 7104878;
  }
  unint64_t v84 = v124;
  *(void *)(v81 + 96) = &type metadata for String;
  *(void *)(v81 + 104) = v84;
  *(void *)(v81 + 72) = v82;
  *(void *)(v81 + 80) = v83;
  swift_bridgeObjectRetain();
  v85 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  v86 = (void *)sub_100013AE0();
  static MainMetrics.defaultWindowWindowSize.getter();
  v156.is_nil = LOBYTE(v156.value.width);
  Bootstrapper.startBootstrapping(window:shouldOnboard:shouldCollapseSidebar:defaultWindowSize:)(v142, v80 & 1, v68 & 1, v156);

LABEL_42:
  v91 = (void *)sub_100013AE0();
  if (v38[1])
  {
    uint64_t v92 = *v38;
    unint64_t v93 = v38[1];
  }
  else
  {
    unint64_t v93 = 0xE300000000000000;
    uint64_t v92 = 7104878;
  }
  uint64_t v94 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v95 = (void *)swift_allocObject();
  v95[2] = v92;
  v95[3] = v93;
  v95[4] = v94;
  swift_bridgeObjectRetain();
  swift_retain();
  v96 = (void *)zalgoIfMain.getter();
  Bootstrapper.afterBootstrap(on:run:)();

  swift_release();
  swift_release();

  sub_100013824((uint64_t)&v145);
  sub_1000136F8(&v145, v146);
  sub_10001378C(0, &qword_100054E60);
  dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v144) {
    goto LABEL_63;
  }
  sub_10001393C(&v143, (uint64_t)&v148);
  sub_10001373C((uint64_t)&v145);
  sub_1000136F8(&v148, v149);
  if (dispatch thunk of AgreedToTermsAndConditionsProvider.agreedToTermsAndConditions()())
  {
    type metadata accessor for TrackingConsent();
    v97 = (void *)static TrackingConsent.shared.getter();
    TrackingConsent.allow()();
  }
  sub_100013824((uint64_t)&v145);
  sub_1000136F8(&v145, v146);
  type metadata accessor for SessionObserver();
  uint64_t v98 = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v98) {
    goto LABEL_64;
  }
  v99 = (void *)v98;
  sub_10001373C((uint64_t)&v145);
  v100 = v142.super.super.super.isa;
  SessionObserver.window.setter();
  if (v54
    && (id v101 = [v54 URLContexts],
        sub_100013EC4(0, (unint64_t *)&unk_100054A20),
        sub_100013A90(&qword_100054DF0, (unint64_t *)&unk_100054A20),
        uint64_t v102 = static Set._unconditionallyBridgeFromObjectiveC(_:)(),
        v101,
        v103 = (void *)sub_100023EC8(v102),
        swift_bridgeObjectRelease(),
        v103))
  {
    sub_100007490();
    uint64_t v105 = v104;
    v106 = v138;
    v107 = (uint64_t *)&v138[*(int *)(v104 + 48)];
    id v108 = [v103 URL];
    v109 = v135;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, char *, uint64_t))(v136 + 32))(v106, v109, v137);
    id v110 = [v103 options];
    id v111 = [v110 sourceApplication];

    if (v111)
    {
      uint64_t v112 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v114 = v113;
    }
    else
    {
      id v115 = [v54 sourceApplication];
      if (v115)
      {
        v116 = v115;
        uint64_t v112 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v114 = v117;
      }
      else
      {

        uint64_t v112 = 0;
        uint64_t v114 = 0;
      }
    }
    uint64_t *v107 = v112;
    v107[1] = v114;
    uint64_t v118 = (uint64_t)v138;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56))(v138, 0, 1, v105);
    uint64_t v119 = v28 + qword_100054C28;
    swift_beginAccess();
    sub_10002A4D4(v118, v119);
    swift_endAccess();
  }
  else
  {
  }
  sub_10001373C((uint64_t)&v148);
  sub_10001373C((uint64_t)&v150);
  sub_10001373C((uint64_t)&v153);
}

uint64_t sub_1000135AC(uint64_t a1, void *a2)
{
  type metadata accessor for AppMonitor();
  uint64_t result = swift_dynamicCastClass();
  if (result)
  {
    sub_1000136F8(a2, a2[3]);
    sub_10001378C(0, &qword_100054E10);
    swift_unknownObjectRetain();
    uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
    if (v5)
    {
      sub_10001393C(&v4, (uint64_t)v6);
      sub_1000136F8(v6, v6[3]);
      sub_1000137DC(&qword_1000549E8, (void (*)(uint64_t))&type metadata accessor for AppMonitor);
      swift_unknownObjectRetain();
      dispatch thunk of SceneStateManagerType.add(monitor:)();
      swift_unknownObjectRelease_n();
      sub_10001373C((uint64_t)&v4);
      return sub_10001373C((uint64_t)v6);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void *sub_1000136F8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10001373C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001378C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1000137DC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100013824@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_100054BC8;
  swift_beginAccess();
  sub_100013954(v3, (uint64_t)&v5, (unint64_t *)&qword_100053EA0, &qword_1000548B0, (uint64_t)&protocol descriptor for ResolverType);
  if (v6) {
    return sub_10001393C(&v5, a1);
  }
  sub_1000080E0((uint64_t)&v5, (unint64_t *)&qword_100053EA0, &qword_1000548B0, (uint64_t)&protocol descriptor for ResolverType);
  sub_10000B024();
  Container.resolver.getter();
  swift_release();
  sub_100016F78(a1, (uint64_t)&v5);
  swift_beginAccess();
  sub_100007FEC((uint64_t)&v5, v3, (unint64_t *)&qword_100053EA0, &qword_1000548B0, (uint64_t)&protocol descriptor for ResolverType);
  return swift_endAccess();
}

uint64_t sub_10001393C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100013954(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  sub_1000139D8(0, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a2, a1, v7);
  return a2;
}

void sub_1000139D8(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_10001378C(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t type metadata accessor for WidgetContentInvalidationManager()
{
  uint64_t result = qword_100054A78;
  if (!qword_100054A78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100013A90(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100013EC4(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100013AE0()
{
  uint64_t v1 = qword_100054BD0;
  long long v2 = *(void **)(v0 + qword_100054BD0);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_100054BD0);
LABEL_5:
    id v8 = v2;
    return (uint64_t)v3;
  }
  uint64_t v4 = v0;
  sub_100013824((uint64_t)v9);
  sub_1000136F8(v9, v9[3]);
  type metadata accessor for Bootstrapper();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v6 = (void *)result;
    sub_10001373C((uint64_t)v9);
    uint64_t v7 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v6;
    id v3 = v6;

    long long v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_100013B98(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100013BE0(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_100013EC4(0, &qword_1000549B8);
    sub_1000159B0();
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v18;
    uint64_t v17 = v19;
    uint64_t v2 = v20;
    uint64_t v3 = v21;
    unint64_t v4 = v22;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v17 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  int64_t v16 = (unint64_t)(v2 + 64) >> 6;
  while (1)
  {
    uint64_t v12 = v3;
    if ((v1 & 0x8000000000000000) == 0) {
      break;
    }
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_31;
    }
    sub_100013EC4(0, &qword_1000549B8);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v10 = v23;
    swift_unknownObjectRelease();
    if (!v23) {
      goto LABEL_31;
    }
LABEL_10:
    id v11 = [v10 activationState];

    if (!v11) {
      goto LABEL_31;
    }
  }
  if (v4)
  {
    unint64_t v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    unint64_t v9 = v8 | (v3 << 6);
LABEL_9:
    id v10 = *(id *)(*(void *)(v1 + 48) + 8 * v9);
    if (!v10) {
      goto LABEL_31;
    }
    goto LABEL_10;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v16) {
      goto LABEL_31;
    }
    unint64_t v14 = *(void *)(v17 + 8 * v13);
    ++v3;
    if (!v14)
    {
      uint64_t v3 = v12 + 2;
      if (v12 + 2 >= v16) {
        goto LABEL_31;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v3);
      if (!v14)
      {
        uint64_t v3 = v12 + 3;
        if (v12 + 3 >= v16) {
          goto LABEL_31;
        }
        unint64_t v14 = *(void *)(v17 + 8 * v3);
        if (!v14)
        {
          uint64_t v3 = v12 + 4;
          if (v12 + 4 >= v16) {
            goto LABEL_31;
          }
          unint64_t v14 = *(void *)(v17 + 8 * v3);
          if (!v14)
          {
            uint64_t v3 = v12 + 5;
            if (v12 + 5 >= v16) {
              goto LABEL_31;
            }
            unint64_t v14 = *(void *)(v17 + 8 * v3);
            if (!v14)
            {
              uint64_t v15 = v12 + 6;
              while (v16 != v15)
              {
                unint64_t v14 = *(void *)(v17 + 8 * v15++);
                if (v14)
                {
                  uint64_t v3 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              sub_100015B24();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    unint64_t v4 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v3 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_100013EC4(uint64_t a1, unint64_t *a2)
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

void *sub_100013F00(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v85 = a1;
  v86 = a2;
  uint64_t v71 = *v3;
  uint64_t v84 = type metadata accessor for EventTriggerBehavior();
  uint64_t v80 = *(void *)(v84 - 8);
  uint64_t v81 = v84 - 8;
  uint64_t v82 = v80;
  __chkstk_darwin(v84 - 8);
  unint64_t v83 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AppEvent();
  uint64_t v78 = *(void *)(v6 - 8);
  uint64_t v79 = v6;
  __chkstk_darwin(v6);
  uint64_t v77 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for NewsEnvironment();
  uint64_t v75 = *(void *)(v8 - 8);
  uint64_t v76 = v8;
  __chkstk_darwin(v8);
  int v74 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for NewsProvider();
  uint64_t v72 = *(void *)(v10 - 8);
  uint64_t v73 = v10;
  __chkstk_darwin(v10);
  id v70 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for FeatureState();
  uint64_t v68 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v67 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_100016B64;
  id v63 = sub_100016BD0;
  sub_100014E40(0, &qword_1000548F8, (void (*)(uint64_t))sub_100016B64, (void (*)(void))sub_100016BD0);
  uint64_t v65 = v13;
  uint64_t v66 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v62 = (char *)&v52 - v14;
  sub_100015028(0, &qword_100054920, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.SchedulerOptions, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v15 - 8);
  uint64_t v61 = (char *)&v52 - v16;
  sub_100014F1C(0, &qword_100054928, (uint64_t (*)(uint64_t))sub_100016C04, sub_100016C4C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for Publishers.RemoveDuplicates);
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v52 - v20;
  sub_1000068F8();
  uint64_t v23 = v22;
  uint64_t v24 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016D1C(0);
  uint64_t v54 = v27;
  uint64_t v56 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v29 = (char *)&v52 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v58 = sub_100016D1C;
  uint64_t v57 = sub_100016D64;
  sub_100014E40(0, &qword_100054970, sub_100016D1C, (void (*)(void))sub_100016D64);
  uint64_t v59 = v30;
  uint64_t v60 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)&v52 - v31;
  uint64_t v88 = a3;
  static Logger.widgetRefresh.getter();
  uint64_t v53 = v3;
  *((unsigned char *)v3 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_hasCompletedColdLaunch) = 0;
  *((unsigned char *)v3 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_queuedInvalidation) = 2;
  uint64_t v55 = (char *)v3 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_cancellables;
  *(void *)((char *)v3 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_cancellables) = &_swiftEmptySetSingleton;
  sub_1000136F8(v86, v86[3]);
  WatchlistManagerType.activeWatchlistChanges.getter();
  swift_getKeyPath();
  sub_100016C80();
  Publisher.map<A>(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  sub_100016D98();
  sub_1000137DC(&qword_100054980, (void (*)(uint64_t))&type metadata accessor for PriceChangeDisplay);
  Publisher<>.removeDuplicates()();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  sub_100013EC4(0, (unint64_t *)&unk_100055100);
  id v87 = (id)static OS_dispatch_queue.main.getter();
  uint64_t v33 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
  int v52 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56);
  uint64_t v34 = (uint64_t)v61;
  v52(v61, 1, 1, v33);
  sub_100016D64();
  sub_100024A98(&qword_100054918, (unint64_t *)&unk_100055100);
  uint64_t v35 = v54;
  Publisher.receive<A>(on:options:)();
  sub_100014F9C(v34);

  (*(void (**)(char *, uint64_t))(v56 + 8))(v29, v35);
  swift_allocObject();
  uint64_t v36 = v53;
  swift_weakInit();
  sub_10001508C(&qword_100054988, &qword_100054970, v58, (void (*)(void))v57);
  uint64_t v37 = v59;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v32, v37);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  id v87 = (id)static OS_dispatch_queue.main.getter();
  v52((char *)v34, 1, 1, v33);
  sub_100016B64();
  sub_100016BD0();
  uint64_t v38 = v62;
  Publisher.receive<A>(on:options:)();
  sub_100014F9C(v34);

  swift_allocObject();
  swift_weakInit();
  sub_10001508C(&qword_100054990, &qword_1000548F8, (void (*)(uint64_t))v64, (void (*)(void))v63);
  uint64_t v39 = v65;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v38, v39);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  static Settings.UserPreferences.showCurrency.getter();
  swift_allocObject();
  swift_weakInit();
  sub_1000137DC(&qword_100054998, (void (*)(uint64_t))type metadata accessor for WidgetContentInvalidationManager);
  Configurable.setting<A>(_:_:)();
  swift_release();
  swift_release();
  static Settings.Features.showYahooNewsAttribution.getter();
  swift_allocObject();
  swift_weakInit();
  unint64_t v40 = v67;
  Configurable.setting<A>(_:_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v40, v69);
  static Settings.News.newsProvider.getter();
  swift_allocObject();
  swift_weakInit();
  id v41 = v70;
  Configurable.setting<A>(_:_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v41, v73);
  static Settings.News.appleNewsEnvironment.getter();
  swift_allocObject();
  swift_weakInit();
  unint64_t v42 = v74;
  uint64_t v43 = v36;
  Configurable.setting<A>(_:_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v42, v76);
  id v45 = v77;
  uint64_t v44 = v78;
  uint64_t v46 = v79;
  (*(void (**)(char *, void, uint64_t))(v78 + 104))(v77, enum case for AppEvent.stockListDidLoad(_:), v79);
  sub_100015028(0, &qword_100053F60, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v47 = v82;
  uint64_t v48 = (_OWORD *)swift_allocObject();
  v48[1] = xmmword_100043A50;
  static EventTriggerBehavior.eager.getter();
  static EventTriggerBehavior.onlyOnce.getter();
  id v87 = v48;
  sub_1000137DC(&qword_100053F68, (void (*)(uint64_t))&type metadata accessor for EventTriggerBehavior);
  sub_100015028(0, &qword_100053F70, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_100015ED8();
  id v50 = v83;
  uint64_t v49 = v84;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  dispatch thunk of EventManager.trigger(on:behavior:block:)();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v50, v49);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
  swift_release();
  sub_10001373C((uint64_t)v86);
  return v43;
}

void sub_100014E40(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  if (!*a2)
  {
    a3(255);
    sub_100013EC4(255, (unint64_t *)&unk_100055100);
    a4();
    sub_100024A98(&qword_100054918, (unint64_t *)&unk_100055100);
    unint64_t v6 = type metadata accessor for Publishers.ReceiveOn();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

void sub_100014F1C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4();
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

uint64_t sub_100014F9C(uint64_t a1)
{
  sub_100015028(0, &qword_100054920, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.SchedulerOptions, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100015028(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_10001508C(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100014E40(255, a2, a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000150DC()
{
  return Configurable.setting<A>(_:)();
}

uint64_t sub_10001510C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Configurable.setting<A>(_:defaultValue:)(a1, a2, *v6, a6);
}

uint64_t sub_10001513C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001514C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001515C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001516C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001517C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, *v8, a8);
}

uint64_t type metadata accessor for AppIntentsDependencyStartupTask()
{
  uint64_t result = qword_100054228;
  if (!qword_100054228) {
    return swift_getSingletonMetadata();
  }
  return result;
}

Swift::Void __swiftcall AppMonitor.sceneWillEnterForeground()()
{
}

uint64_t sub_100015204()
{
  return swift_release();
}

uint64_t sub_10001520C()
{
  return swift_release();
}

uint64_t sub_100015214()
{
  return swift_release();
}

uint64_t sub_10001521C()
{
  return swift_release();
}

uint64_t sub_100015224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_100015284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

void sub_1000152E4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_100015348(uint64_t a1)
{
  return WatchlistManagerObserver.watchlistManagerWatchlistsDidChange(_:)(a1, *v1);
}

uint64_t sub_100015374(uint64_t a1)
{
  return SceneStateMonitor.sceneWillConnectToSession(withOptions:)(a1, *v1);
}

void sub_1000153A0()
{
}

uint64_t sub_1000153CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SceneStateMonitor.sceneDidBecomeActive(with:sourceApplication:sceneID:)(a1, a2, a3, a4, a5, *v5);
}

uint64_t *sub_100015400(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_100015464()
{
  unint64_t result = qword_100054720;
  if (!qword_100054720)
  {
    unint64_t result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_100054720);
  }
  return result;
}

unint64_t sub_1000154A8()
{
  unint64_t result = qword_100054710;
  if (!qword_100054710)
  {
    sub_100015AB8();
    unint64_t result = swift_getFunctionTypeMetadata1();
    atomic_store(result, (unint64_t *)&qword_100054710);
  }
  return result;
}

uint64_t sub_1000154FC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void *sub_100015524@<X0>(void *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_100015568()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100015660(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000202AC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100055548 + dword_100055548);
  return v6(a1, v4);
}

uint64_t sub_100015718(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100015568;
  return v6(a1);
}

void sub_1000157F4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for _ContiguousArrayStorage();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_100015848()
{
  if (!qword_100055560)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = type metadata accessor for ManagedBuffer();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055560);
    }
  }
}

uint64_t sub_1000158A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100015464();
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_1000159B0()
{
  unint64_t result = qword_1000549C0;
  if (!qword_1000549C0)
  {
    sub_100013EC4(255, &qword_1000549B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000549C0);
  }
  return result;
}

unint64_t sub_100015A18()
{
  unint64_t result = qword_1000543D0;
  if (!qword_1000543D0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1000543D0);
  }
  return result;
}

void sub_100015A70(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_100015AB8()
{
  unint64_t result = qword_100054718;
  if (!qword_100054718)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100054718);
  }
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_100015B24()
{
  return swift_release();
}

uint64_t sub_100015B2C(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v3 + 4;
          if (v3 + 4 >= v30) {
            return 1;
          }
          unint64_t v11 = *(void *)(v29 + 8 * v12);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_25:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    uint64_t v14 = result;
    uint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v18 = Hasher._finalize()();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    uint64_t v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    unint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 5;
  if (v3 + 5 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_25;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_100015DD0(uint64_t a1)
{
  sub_100006648();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100015E2C(uint64_t a1, uint64_t a2)
{
  int64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_100015E80()
{
  if (!qword_100053F48)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t v0 = type metadata accessor for Array();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100053F48);
    }
  }
}

unint64_t sub_100015ED8()
{
  unint64_t result = qword_100053F78;
  if (!qword_100053F78)
  {
    sub_100015028(255, &qword_100053F70, (uint64_t (*)(uint64_t))&type metadata accessor for EventTriggerBehavior, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100053F78);
  }
  return result;
}

void sub_100015F60(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for Group();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void sub_100015FC0()
{
  if (!qword_100055168)
  {
    sub_100007490();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100055168);
    }
  }
}

void sub_100016028(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_100016074(uint64_t a1)
{
  sub_100015FC0();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v6 = (void *)((char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10002A160();
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = (uint64_t)v6 + *(int *)(v3 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v26[1] = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v4 + 72);
  swift_retain();
  while (1)
  {
    sub_1000319E0(v13, (uint64_t)v6, (uint64_t (*)(void))sub_100015FC0);
    uint64_t v15 = *v6;
    uint64_t v16 = v6[1];
    unint64_t result = sub_10002F080(*v6, v16);
    if (v18) {
      break;
    }
    unint64_t v19 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v20 = (uint64_t *)(v8[6] + 16 * result);
    *unint64_t v20 = v15;
    v20[1] = v16;
    uint64_t v21 = v8[7];
    sub_100007490();
    unint64_t result = sub_100029A28(v10, v21 + *(void *)(*(void *)(v22 - 8) + 72) * v19);
    uint64_t v23 = v8[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_11;
    }
    long long v8[2] = v25;
    v13 += v14;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100016260()
{
  unint64_t result = qword_100053EE0;
  if (!qword_100053EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100053EE0);
  }
  return result;
}

uint64_t sub_1000162B4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000162C8()
{
  return sub_10000C1A0(v0);
}

uint64_t sub_1000162D0(uint64_t a1)
{
  return sub_1000162D8(a1, v1);
}

uint64_t sub_1000162D8(uint64_t a1, uint64_t a2)
{
  return sub_10000B1E8(a1, a2, "Attempting widget update for active watchlist displayState changes");
}

void sub_1000162E4()
{
  sub_100008DFC(v0, "Attempting widget update for price data changes", 1);
}

uint64_t sub_10001630C()
{
  sub_1000136F8((void *)(v0 + 16), *(void *)(v0 + 40));
  dispatch thunk of PrivateDataPollingServiceType.pollForChangesIfNeeded()();

  return swift_release();
}

uint64_t sub_100016360(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_1000163A8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100016360(&qword_1000550B0, a2, (void (*)(uint64_t))type metadata accessor for StubGizmoSyncManager);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100016400@<X0>(uint64_t *a1@<X8>)
{
  return sub_100007EA8((uint64_t (*)(void))type metadata accessor for StocksUserActivityIntentDeserializer, &qword_100054620, (void (*)(uint64_t))type metadata accessor for StocksUserActivityIntentDeserializer, a1);
}

uint64_t sub_100016448@<X0>(uint64_t *a1@<X8>)
{
  return sub_100007EA8((uint64_t (*)(void))type metadata accessor for StocksUserActivityIntentSerializer, &qword_100054628, (void (*)(uint64_t))type metadata accessor for StocksUserActivityIntentSerializer, a1);
}

void sub_100016498()
{
  sub_1000152E4(319, &qword_100054D08, (uint64_t (*)(uint64_t))sub_100007490, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v0 <= 0x3F) {
    swift_initClassMetadata2();
  }
}

uint64_t type metadata accessor for SceneDelegate()
{
  uint64_t result = qword_100054C70;
  if (!qword_100054C70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_10001661C()
{
  return sub_1000082A4();
}

id sub_100016640(uint64_t a1)
{
  return *(id *)(a1 + qword_100054C08);
}

void sub_100016650(uint64_t a1)
{
  sub_10000994C(a1, *(id *)(v1 + 16), *(unsigned char **)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_100016670()
{
  return sub_100009104(*(void **)(v0 + 24));
}

void sub_1000166A0()
{
  sub_10000BBDC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000166AC(void *a1)
{
  return sub_1000166B4(a1);
}

uint64_t sub_1000166B4(void *a1)
{
  return dispatch thunk of ContextType.useWeak<A>(_:for:)();
}

uint64_t sub_100016740()
{
  return sub_100008C20();
}

uint64_t sub_100016748()
{
  static Account.storefrontID.getter();

  return swift_bridgeObjectRelease();
}

id sub_100016774()
{
  return [*(id *)(v0 + 16) registerForRemoteNotifications];
}

uint64_t sub_100016784()
{
  return sub_10000D7A4();
}

uint64_t type metadata accessor for StocksTodayAgent()
{
  uint64_t result = qword_100055458;
  if (!qword_100055458) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000167F4()
{
  sub_10000A000(*(void *)(v0 + 16));
}

uint64_t sub_100016810()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 16);
  uint64_t v2 = swift_release();
  v1(v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10001687C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_1000202AC;
  return sub_1000073D0(a1, v4, v5, v6, v7, v9, v8);
}

void sub_100016950()
{
  swift_getObjectType();

  SceneStateMonitor.sceneWillEnterForeground()();
}

void sub_10001698C(id *a1)
{
  sub_10000A4AC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100016998(uint64_t a1)
{
  return sub_100008F14(a1, v1);
}

uint64_t sub_1000169A0()
{
  return CheckedContinuation.resume(returning:)();
}

void sub_100016A3C(uint64_t a1)
{
  sub_10000A0A4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

unsigned char *sub_100016A44@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100016A50()
{
  return sub_1000137DC(&qword_100053FA0, (void (*)(uint64_t))&type metadata accessor for AppEvent);
}

uint64_t sub_100016A84(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100016ACC()
{
  return sub_1000137DC(&qword_100054940, (void (*)(uint64_t))sub_100006F60);
}

void sub_100016B00(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t, void *, void *))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3, &type metadata for Never, &protocol witness table for Never);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_100016B64()
{
  if (!qword_100054900)
  {
    unint64_t v0 = type metadata accessor for PassthroughSubject();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100054900);
    }
  }
}

uint64_t sub_100016BD0()
{
  return sub_1000137DC(&qword_100054910, (void (*)(uint64_t))sub_100016B64);
}

void sub_100016C04(uint64_t a1)
{
}

uint64_t sub_100016C4C()
{
  return sub_1000137DC(&qword_100054948, sub_100016C04);
}

unint64_t sub_100016C80()
{
  unint64_t result = qword_100054958;
  if (!qword_100054958)
  {
    sub_100014F1C(255, &qword_100054928, (uint64_t (*)(uint64_t))sub_100016C04, sub_100016C4C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for Publishers.RemoveDuplicates);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100054958);
  }
  return result;
}

void sub_100016D1C(uint64_t a1)
{
}

uint64_t sub_100016D64()
{
  return sub_1000137DC(&qword_100054978, sub_100016D1C);
}

uint64_t sub_100016D98()
{
  return sub_1000137DC(&qword_100054968, (void (*)(uint64_t))sub_1000068F8);
}

unint64_t sub_100016DCC()
{
  unint64_t result = qword_100053F18;
  if (!qword_100053F18)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100053F18);
  }
  return result;
}

unint64_t sub_100016E24()
{
  unint64_t result = qword_100054E00;
  if (!qword_100054E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100054E00);
  }
  return result;
}

void sub_100016E78(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for StocksActivity();
    uint64_t v7 = sub_100016A84((unint64_t *)&unk_100054E30, (void (*)(uint64_t))&type metadata accessor for StocksActivity);
    unint64_t v8 = a3(a1, v6, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_100016F14()
{
  if (!qword_100054DF8)
  {
    sub_100016E24();
    unint64_t v0 = type metadata accessor for StateMachine();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100054DF8);
    }
  }
}

uint64_t sub_100016F78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100016FDC()
{
  if (!qword_100054448[0])
  {
    unint64_t v0 = type metadata accessor for Setting();
    if (!v1) {
      atomic_store(v0, qword_100054448);
    }
  }
}

uint64_t sub_10001703C(uint64_t a1, unint64_t a2)
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

uint64_t sub_100017094(uint64_t a1, uint64_t a2)
{
  return sub_10001718C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000170AC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100017100()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100017174(uint64_t a1, uint64_t a2)
{
  return sub_10001718C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10001718C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000171D0(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100017248(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000172C8@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100017310()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_10001739C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000173C8@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100017410(uint64_t a1)
{
  uint64_t v2 = sub_100017538(&qword_1000539C0);
  uint64_t v3 = sub_100017538(&qword_1000539C8);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

void type metadata accessor for UIBackgroundFetchResult(uint64_t a1)
{
}

uint64_t sub_1000174D0()
{
  return sub_100017538(&qword_1000539A8);
}

uint64_t sub_100017504()
{
  return sub_100017538(&qword_1000539B0);
}

uint64_t sub_100017538(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for LaunchOptionsKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001757C()
{
  return sub_100017538(&qword_1000539B8);
}

uint64_t sub_1000175B4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___menuManager;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___menuManager);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___menuManager);
LABEL_5:
    id v6 = v2;
    return (uint64_t)v3;
  }
  sub_100011310((uint64_t)v9);
  sub_1000136F8(v9, v9[3]);
  sub_10001378C(0, &qword_100054DA0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:name:)();
  if (v7)
  {
    sub_10001373C((uint64_t)v9);
    char v5 = *(void **)v1;
    *(void *)uint64_t v1 = v7;
    *(void *)(v1 + 8) = v8;
    id v3 = v7;

    uint64_t v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_100017694()
{
  uint64_t v1 = OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___tracker;
  if (*(void *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___tracker))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___tracker);
LABEL_5:
    swift_retain();
    return v2;
  }
  uint64_t v3 = v0;
  sub_100011310((uint64_t)v5);
  sub_1000136F8(v5, v5[3]);
  type metadata accessor for Tracker();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v2 = result;
    sub_10001373C((uint64_t)v5);
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id DiagnosticFileProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t sub_10001782C()
{
  swift_getObjectType();

  return Configurable.setting<A>(_:)();
}

uint64_t sub_100017884()
{
  swift_getObjectType();

  return Configurable.setting<A>(_:_:)();
}

uint64_t sub_1000178F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t ObjectType = swift_getObjectType();

  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, ObjectType, a8);
}

uint64_t sub_100017AF4(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = type metadata accessor for RemoteNotificationFetchResult();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for RemoteNotificationFetchResult.noData(_:))
  {
    uint64_t v9 = 1;
    return a2(v9);
  }
  if (v8 == enum case for RemoteNotificationFetchResult.newData(_:))
  {
    uint64_t v9 = 0;
    return a2(v9);
  }
  if (v8 == enum case for RemoteNotificationFetchResult.failed(_:))
  {
    uint64_t v9 = 2;
    return a2(v9);
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100017DE8(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = type metadata accessor for BackgroundFetchResult();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for BackgroundFetchResult.noData(_:))
  {
    uint64_t v9 = 1;
    return a2(v9);
  }
  if (v8 == enum case for BackgroundFetchResult.newData(_:))
  {
    uint64_t v9 = 0;
    return a2(v9);
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000180D8()
{
  swift_getObjectType();

  return Updatable.save<A>(setting:value:)();
}

uint64_t sub_100018130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = swift_getObjectType();

  return Updatable.reset<A>(setting:)(a1, ObjectType, a5);
}

uint64_t sub_100018180()
{
  swift_getObjectType();

  return Updatable.apply(preset:)();
}

void *sub_100018244@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t result = (void *)sub_1000175B4();
  if (a1)
  {
    uint64_t v7 = result;
    unsigned int v8 = [result canPerformAction:a1 withSender:v2];

    if (v8)
    {
      uint64_t v9 = sub_1000175B4();
      uint64_t result = (void *)swift_getObjectType();
      a2[3] = (uint64_t)result;
      *a2 = v9;
    }
    else
    {
      v11.receiver = v2;
      v11.super_class = ObjectType;
      if (objc_msgSendSuper2(&v11, "forwardingTargetForSelector:", a1))
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v10, 0, sizeof(v10));
      }
      return (void *)sub_100018A98((uint64_t)v10, (uint64_t)a2);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100018468()
{
  sub_100011310((uint64_t)v4);
  sub_1000136F8(v4, v5);
  sub_10001378C(0, &qword_100053EB0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v3)
  {
    sub_10001373C((uint64_t)v4);
    uint64_t v1 = (void *)sub_1000175B4();
    swift_getObjectType();
    uint64_t v2 = sub_100017694();
    uint64_t v5 = type metadata accessor for Tracker();
    uint64_t v6 = sub_100010CC4(&qword_100053EB8, 255, (void (*)(uint64_t))&type metadata accessor for Tracker);
    v4[0] = v2;
    dispatch thunk of MenuManagerType.validate(_:with:tracker:)();
    swift_unknownObjectRelease();

    return sub_10001373C((uint64_t)v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100018618(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = (void *)sub_1000175B4();
  sub_100018A34(a2, (uint64_t)v23);
  uint64_t v7 = v24;
  if (v24)
  {
    unsigned int v8 = sub_1000136F8(v23, v24);
    uint64_t v9 = *(void *)(v7 - 8);
    __chkstk_darwin(v8);
    objc_super v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = _bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_10001373C((uint64_t)v23);
  }
  else
  {
    uint64_t v12 = 0;
  }
  unsigned __int8 v13 = [v6 canPerformAction:a1 withSender:v12];

  swift_unknownObjectRelease();
  if (v13) {
    return 1;
  }
  sub_100018A34(a2, (uint64_t)v23);
  uint64_t v15 = v24;
  if (v24)
  {
    uint64_t v16 = sub_1000136F8(v23, v24);
    uint64_t v17 = *(void *)(v15 - 8);
    __chkstk_darwin(v16);
    unint64_t v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v17 + 16))(v19);
    uint64_t v20 = _bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v15);
    sub_10001373C((uint64_t)v23);
  }
  else
  {
    uint64_t v20 = 0;
  }
  v22.receiver = v2;
  v22.super_class = ObjectType;
  [super canPerformAction:a1 withSender:v20];
  swift_unknownObjectRelease();
  return (uint64_t)v14;
}

uint64_t sub_100018934(uint64_t a1, uint64_t a2)
{
  return sub_100010CC4(&qword_100053DE8, a2, (void (*)(uint64_t))type metadata accessor for AppDelegate);
}

uint64_t sub_10001897C(uint64_t a1)
{
  sub_1000189D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000189D8()
{
  if (!qword_100053E90)
  {
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100053E90);
    }
  }
}

uint64_t sub_100018A34(uint64_t a1, uint64_t a2)
{
  sub_1000189D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018A98(uint64_t a1, uint64_t a2)
{
  sub_1000189D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018AFC()
{
  uint64_t v0 = type metadata accessor for EndReason();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for ViewEndData();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011310((uint64_t)v10);
  sub_1000136F8(v10, v11);
  type metadata accessor for SessionManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_10001373C((uint64_t)v10);
    SessionManager.tracker.getter();
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EndReason.forceQuit(_:), v0);
    ViewEndData.init(endReason:)();
    sub_100010CC4((unint64_t *)&unk_100053F00, 255, (void (*)(uint64_t))&type metadata accessor for ViewEndData);
    Tracker.push<A>(data:traits:file:line:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_100011310((uint64_t)v10);
    sub_1000136F8(v10, v11);
    type metadata accessor for AppSessionManager();
    uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
    if (result)
    {
      sub_10001373C((uint64_t)v10);
      AppSessionManager.appSessionDidTerminate()();
      swift_release();
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_100018DA4(void *a1)
{
  id v2 = [a1 role];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_8:
    id v11 = [a1 role];
    id v10 = [objc_allocWithZone((Class)UISceneConfiguration) initWithName:0 sessionRole:v11];

    type metadata accessor for SceneDelegate();
    [v10 setDelegateClass:swift_getObjCClassFromMetadata()];
    type metadata accessor for WindowScene();
    [v10 setSceneClass:swift_getObjCClassFromMetadata()];
    sub_1000114A0(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_100043A40;
    id v13 = [a1 persistentIdentifier];
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v16 = v15;

    *(void *)(v12 + 56) = &type metadata for String;
    *(void *)(v12 + 64) = sub_100016260();
    *(void *)(v12 + 32) = v14;
    *(void *)(v12 + 40) = v16;
    sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
    id v9 = (id)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  id v9 = [a1 role];
  id v10 = [objc_allocWithZone((Class)UISceneConfiguration) initWithName:0 sessionRole:v9];
LABEL_9:

  return v10;
}

void sub_100019014(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_100013EC4(0, &qword_100053EF0);
    sub_100019AD0();
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v24;
    uint64_t v22 = v25;
    uint64_t v2 = v26;
    uint64_t v3 = v27;
    unint64_t v4 = v28;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v22 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  int64_t v21 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v4)
    {
      uint64_t v8 = (v4 - 1) & v4;
      unint64_t v9 = __clz(__rbit64(v4)) | (v3 << 6);
      uint64_t v10 = v3;
      goto LABEL_27;
    }
    int64_t v12 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v12 >= v21) {
      goto LABEL_30;
    }
    unint64_t v13 = *(void *)(v22 + 8 * v12);
    uint64_t v10 = v3 + 1;
    if (!v13)
    {
      uint64_t v10 = v3 + 2;
      if (v3 + 2 >= v21) {
        goto LABEL_30;
      }
      unint64_t v13 = *(void *)(v22 + 8 * v10);
      if (!v13)
      {
        uint64_t v10 = v3 + 3;
        if (v3 + 3 >= v21) {
          goto LABEL_30;
        }
        unint64_t v13 = *(void *)(v22 + 8 * v10);
        if (!v13)
        {
          uint64_t v10 = v3 + 4;
          if (v3 + 4 >= v21) {
            goto LABEL_30;
          }
          unint64_t v13 = *(void *)(v22 + 8 * v10);
          if (!v13)
          {
            uint64_t v14 = v3 + 5;
            while (v21 != v14)
            {
              unint64_t v13 = *(void *)(v22 + 8 * v14++);
              if (v13)
              {
                uint64_t v10 = v14 - 1;
                goto LABEL_26;
              }
            }
LABEL_30:
            sub_100015B24();
            return;
          }
        }
      }
    }
LABEL_26:
    uint64_t v8 = (v13 - 1) & v13;
    unint64_t v9 = __clz(__rbit64(v13)) + (v10 << 6);
LABEL_27:
    id v11 = *(id *)(*(void *)(v1 + 48) + 8 * v9);
    if (!v11) {
      goto LABEL_30;
    }
    while (1)
    {
      sub_1000114A0(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_100043A40;
      id v16 = [v11 persistentIdentifier];
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v19 = v18;

      *(void *)(v15 + 56) = &type metadata for String;
      *(void *)(v15 + 64) = sub_100016260();
      *(void *)(v15 + 32) = v17;
      *(void *)(v15 + 40) = v19;
      sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
      uint64_t v20 = (void *)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();

      swift_bridgeObjectRelease();
      uint64_t v3 = v10;
      unint64_t v4 = v8;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (__CocoaSet.Iterator.next()())
      {
        sub_100013EC4(0, &qword_100053EF0);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v11 = v23;
        swift_unknownObjectRelease();
        uint64_t v10 = v3;
        uint64_t v8 = v4;
        if (v23) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  __break(1u);
}

void sub_1000193B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000114A0(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100043A40;
  uint64_t v6 = Dictionary.description.getter();
  uint64_t v8 = v7;
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = sub_100016260();
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v8;
  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  unint64_t v9 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  sub_100011310((uint64_t)v14);
  sub_1000136F8(v14, v14[3]);
  type metadata accessor for RemoteNotificationManager();
  if (dispatch thunk of ResolverType.resolve<A>(_:)())
  {
    sub_10001373C((uint64_t)v14);
    RemoteNotificationManager.handleRemoteNotification(userInfo:)();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a2;
    *(void *)(v10 + 24) = a3;
    swift_retain();
    id v11 = (void *)zalgo.getter();
    Promise.then<A>(on:closure:)();
    swift_release();
    swift_release();

    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a2;
    *(void *)(v12 + 24) = a3;
    swift_retain();
    unint64_t v13 = (void *)zalgo.getter();
    Promise.error(on:closure:)();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

void sub_100019628()
{
  static os_log_type_t.error.getter();
  sub_1000114A0(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100043A40;
  sub_10001378C(0, &qword_100053ED8);
  _print_unlocked<A, B>(_:_:)();
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 64) = sub_100016260();
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0xE000000000000000;
  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  uint64_t v1 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();
}

void sub_10001976C(uint64_t a1, uint64_t a2)
{
  sub_100011310((uint64_t)v10);
  sub_1000136F8(v10, v10[3]);
  type metadata accessor for BackgroundFetchManager();
  uint64_t v4 = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    sub_10001373C((uint64_t)v10);
    BackgroundFetchManager.performBackgroundFetch()();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a1;
    *(void *)(v6 + 24) = a2;
    swift_retain();
    uint64_t v7 = (void *)zalgo.getter();
    Promise.then<A>(on:closure:)();
    swift_release();
    swift_release();

    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = a2;
    swift_retain();
    unint64_t v9 = (void *)zalgo.getter();
    Promise.error(on:closure:)();

    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000198E0(uint64_t a1, uint64_t a2, Class isa)
{
  sub_100011310((uint64_t)v9);
  sub_1000136F8(v9, v9[3]);
  sub_100013EC4(0, &qword_100053EC0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v6 = (void *)result;
  uint64_t result = sub_10001373C((uint64_t)v9);
  if (!a2)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  NSString v7 = String._bridgeToObjectiveC()();
  if (isa) {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  id v8 = [v6 runTest:v7 options:isa];

  return (uint64_t)v8;
}

uint64_t sub_1000199E8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100019A20()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100019A34(uint64_t a1)
{
  return sub_100017DE8(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_100019A50()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100019A88(uint64_t a1)
{
  return sub_100017AF4(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_100019AA4()
{
  return (*(uint64_t (**)(uint64_t))(v0 + 16))(2);
}

unint64_t sub_100019AD0()
{
  unint64_t result = qword_100053EF8;
  if (!qword_100053EF8)
  {
    sub_100013EC4(255, &qword_100053EF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100053EF8);
  }
  return result;
}

uint64_t sub_100019B38()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100019B8C()
{
  uint64_t v0 = type metadata accessor for SettingAction.PostInstruction();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SettingAction();
  swift_allocObject();
  SettingAction.init(_:_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for SettingAction.PostInstruction.killProcess(_:), v0);
  uint64_t v4 = dispatch thunk of SettingAction.then(_:)();
  swift_release();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_100056910 = v4;
  return result;
}

uint64_t sub_100019CE4()
{
  if (qword_100053838 != -1) {
    swift_once();
  }
  return dispatch thunk of Updatable.save<A>(setting:value:)();
}

uint64_t initializeBufferWithCopyOfBuffer for DeserializationError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DeserializationError(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 2) {
    unsigned int v1 = *(_DWORD *)a1 + 2;
  }
  if (v1 == 1) {
    return swift_bridgeObjectRelease();
  }
  else {
    return sub_10001373C(a1);
  }
}

uint64_t initializeWithCopy for DeserializationError(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 2) {
    unsigned int v3 = *(_DWORD *)a2 + 2;
  }
  if (v3 == 1)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    swift_bridgeObjectRetain();
    char v5 = 1;
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v6;
    (**(void (***)(uint64_t))(v6 - 8))(a1);
    char v5 = 0;
  }
  *(unsigned char *)(a1 + 40) = v5;
  return a1;
}

uint64_t assignWithCopy for DeserializationError(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1) {
      swift_bridgeObjectRelease();
    }
    else {
      sub_10001373C(a1);
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(unsigned char *)(a1 + 40) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      *(unsigned char *)(a1 + 40) = 0;
    }
  }
  return a1;
}

__n128 initializeWithTake for DeserializationError(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DeserializationError(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1) {
      swift_bridgeObjectRelease();
    }
    else {
      sub_10001373C(a1);
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      LOBYTE(v5) = 0;
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
    }
    *(unsigned char *)(a1 + 40) = v5;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DeserializationError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 2) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DeserializationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10001A0A0(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_10001A0C0(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DeserializationError()
{
  return &type metadata for DeserializationError;
}

uint64_t sub_10001A0F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Stock();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = type metadata accessor for SymbolEntity();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for StocksActivity.StockFeed();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for StocksActivity();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v13, v10);
  if (v14 == enum case for StocksActivity.stockList(_:))
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    sub_10001B004(0, &qword_100054108, (void (*)(uint64_t))&type metadata accessor for ScrollPosition, (void (*)(uint64_t))sub_10001B08C);
    swift_bridgeObjectRelease();
    uint64_t v15 = type metadata accessor for ScrollPosition();
LABEL_5:
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v14 == enum case for StocksActivity.forYouFeed(_:))
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    sub_10001B004(0, &qword_100054100, (void (*)(uint64_t))&type metadata accessor for ForYouSectionDescriptor, (void (*)(uint64_t))&type metadata accessor for CardViewPresentationState);
    uint64_t v17 = &v13[*(int *)(v16 + 48)];
    uint64_t v18 = type metadata accessor for CardViewPresentationState();
    (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
    uint64_t v15 = type metadata accessor for ForYouSectionDescriptor();
    goto LABEL_5;
  }
  if (v14 == enum case for StocksActivity.symbolFeed(_:))
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    *(void *)(a2 + 24) = type metadata accessor for OpenSymbolIntent();
    *(void *)(a2 + 32) = sub_10001B0E4();
    sub_100015400((uint64_t *)a2);
    OpenSymbolIntent.init()();
    StocksActivity.StockFeed.stock.getter();
    SymbolEntity.init(from:)();
    OpenSymbolIntent.target.setter();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  if (v14 == enum case for StocksActivity.symbolSearch(_:))
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    uint64_t result = swift_bridgeObjectRelease();
  }
  else if (v14 == enum case for StocksActivity.article(_:) {
         || v14 == enum case for StocksActivity.url(_:)
  }
         || v14 == enum case for StocksActivity.alert(_:)
         || v14 == enum case for StocksActivity.campaignLandingPage(_:)
         || v14 == enum case for StocksActivity.tip(_:)
         || v14 == enum case for StocksActivity.onboarding(_:)
         || v14 == enum case for StocksActivity.watchlistCreation(_:))
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    if (v14 != enum case for StocksActivity.manageWatchlists(_:))
    {
      simulateCrash(_:_:)();
      *(void *)(a2 + 32) = 0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    sub_10001AE8C();
    swift_release();
    uint64_t result = sub_10001AF8C((uint64_t)v13);
  }
LABEL_6:
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

uint64_t sub_10001A690()
{
  return swift_deallocClassInstance();
}

uint64_t sub_10001A6A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001A0F8(a1, a2);
}

uint64_t sub_10001A6B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for WatchlistEntity();
  uint64_t v51 = *(void *)(v4 - 8);
  uint64_t v52 = v4;
  __chkstk_darwin(v4);
  uint64_t v49 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = type metadata accessor for OpenWatchlistIntent();
  uint64_t v48 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SymbolEntity();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = type metadata accessor for OpenSymbolIntent();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for StocksIntentType();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v16, v13);
  if (v17 == enum case for StocksIntentType.addSymbolToWatchlist(_:)
    || v17 == enum case for StocksIntentType.deleteSymbolFromWatchlist(_:))
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t v19 = type metadata accessor for StocksActivity();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a2, 1, 1, v19);
  }
  if (v17 == enum case for StocksIntentType.openSymbol(_:))
  {
    (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v16, v9);
    sub_10001B004(0, &qword_100054120, (void (*)(uint64_t))&type metadata accessor for Stock, (void (*)(uint64_t))&type metadata accessor for StocksActivity.Options);
    OpenSymbolIntent.target.getter();
    Stock.init(from:)();
    static StocksActivity.Options.default.getter();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    uint64_t v21 = enum case for StocksActivity.StockFeed.individual(_:);
    uint64_t v22 = type metadata accessor for StocksActivity.StockFeed();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(a2, v21, v22);
    uint64_t v23 = (unsigned int *)&enum case for StocksActivity.symbolFeed(_:);
  }
  else
  {
    if (v17 == enum case for StocksIntentType.openWatchlist(_:))
    {
      (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
      uint64_t v24 = v48;
      uint64_t v25 = v50;
      (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v7, v16, v50);
      sub_10001B004(0, &qword_100054108, (void (*)(uint64_t))&type metadata accessor for ScrollPosition, (void (*)(uint64_t))sub_10001B08C);
      uint64_t v27 = a2;
      unint64_t v28 = (uint64_t *)(a2 + *(int *)(v26 + 48));
      uint64_t v29 = enum case for ScrollPosition.top(_:);
      uint64_t v30 = type metadata accessor for ScrollPosition();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 104))(a2, v29, v30);
      int64_t v31 = v49;
      OpenWatchlistIntent.target.getter();
      uint64_t v32 = WatchlistEntity.id.getter();
      uint64_t v34 = v33;
      (*(void (**)(char *, uint64_t))(v51 + 8))(v31, v52);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v25);
      uint64_t *v28 = v32;
      v28[1] = v34;
      uint64_t v35 = enum case for StocksActivity.stockList(_:);
      uint64_t v36 = type metadata accessor for StocksActivity();
      uint64_t v37 = *(void *)(v36 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 104))(v27, v35, v36);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v37 + 56))(v27, 0, 1, v36);
    }
    if (v17 != enum case for StocksIntentType.openBusinessNews(_:))
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    sub_10001B004(0, &qword_100054100, (void (*)(uint64_t))&type metadata accessor for ForYouSectionDescriptor, (void (*)(uint64_t))&type metadata accessor for CardViewPresentationState);
    uint64_t v39 = a2 + *(int *)(v38 + 48);
    uint64_t v40 = enum case for ForYouSectionDescriptor.topStories(_:);
    uint64_t v41 = type metadata accessor for ForYouSectionDescriptor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 104))(a2, v40, v41);
    uint64_t v42 = enum case for CardViewPresentationState.expanded(_:);
    uint64_t v43 = type metadata accessor for CardViewPresentationState();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104))(v39, v42, v43);
    uint64_t v23 = (unsigned int *)&enum case for StocksActivity.forYouFeed(_:);
  }
  uint64_t v44 = *v23;
  uint64_t v45 = type metadata accessor for StocksActivity();
  uint64_t v46 = *(void *)(v45 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 104))(a2, v44, v45);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v46 + 56))(a2, 0, 1, v45);
}

uint64_t sub_10001AE74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001A6B8(a1, a2);
}

void sub_10001AE8C()
{
  if (!qword_1000540F0)
  {
    sub_10001AF38(255, &qword_100055150, (void (*)(uint64_t))&type metadata accessor for Stock);
    sub_10001AF38(255, &qword_1000540F8, (void (*)(uint64_t))&type metadata accessor for CommandExecutionSource);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1000540F0);
    }
  }
}

void sub_10001AF38(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10001AF8C(uint64_t a1)
{
  sub_10001AF38(0, &qword_100055150, (void (*)(uint64_t))&type metadata accessor for Stock);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10001B004(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    a4(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v7) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

void sub_10001B08C()
{
  if (!qword_100054110)
  {
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100054110);
    }
  }
}

unint64_t sub_10001B0E4()
{
  unint64_t result = qword_100054118;
  if (!qword_100054118)
  {
    type metadata accessor for OpenSymbolIntent();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100054118);
  }
  return result;
}

uint64_t ArticleScorer.init(subscribedTags:config:currentDate:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = a1;
  sub_10001393C(a2, (uint64_t)(a4 + 1));
  uint64_t v6 = (char *)a4 + *(int *)(type metadata accessor for ArticleScorer() + 24);
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32);

  return v8(v6, a3, v7);
}

uint64_t type metadata accessor for ArticleScorer()
{
  uint64_t result = qword_100054180;
  if (!qword_100054180) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void ArticleScorer.score<A>(article:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v54 = type metadata accessor for Date();
  uint64_t v53 = *(void *)(v54 - 8);
  uint64_t v10 = __chkstk_darwin(v54);
  uint64_t v52 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void (**)(void))(v14 + 16);
  uint64_t v55 = v13;
  v15();
  double v16 = (*(double (**)(uint64_t, uint64_t))(a3 + 56))(a2, a3);
  double v17 = (*(double (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
  double v18 = (*(double (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  sub_10001CA98(a1, v4, a2, a3);
  uint64_t v20 = v19;
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  uint64_t v22 = *(void *)(v21 + 16);
  if (!v22)
  {
    swift_bridgeObjectRelease();
    uint64_t v24 = 0;
    goto LABEL_30;
  }
  v47[2] = a1;
  uint64_t v49 = a4;
  uint64_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  v47[1] = v21;
  uint64_t v25 = v21 + 32;
  uint64_t v48 = v4;
  uint64_t v26 = *v4;
  uint64_t v27 = *(void *)(*v5 + 16);
  uint64_t v57 = *v5 + 56;
  uint64_t v56 = v21 + 32;
  while (1)
  {
    if (v27)
    {
      unint64_t v28 = (uint64_t *)(v25 + 16 * v23);
      uint64_t v30 = *v28;
      uint64_t v29 = v28[1];
      if (*(void *)(v26 + 32) == *v28 && *(void *)(v26 + 40) == v29)
      {
        uint64_t v33 = 1;
      }
      else
      {
        char v32 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v33 = v32 & 1;
        if ((v32 & 1) == 0 && v27 != 1)
        {
          uint64_t v34 = (void *)v57;
          uint64_t v35 = 1;
          while (1)
          {
            uint64_t v36 = v35 + 1;
            if (__OFADD__(v35, 1))
            {
              __break(1u);
              return;
            }
            BOOL v37 = *(v34 - 1) == v30 && *v34 == v29;
            if (v37 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              break;
            }
            v34 += 2;
            ++v35;
            if (v36 == v27)
            {
              uint64_t v38 = 0;
              goto LABEL_25;
            }
          }
          uint64_t v38 = 1;
LABEL_25:
          uint64_t v25 = v56;
          BOOL v39 = __OFADD__(v24, v38);
          v24 += v38;
          if (v39) {
            break;
          }
          goto LABEL_22;
        }
      }
      BOOL v39 = __OFADD__(v24, v33);
      v24 += v33;
      if (v39) {
        break;
      }
    }
LABEL_22:
    if (++v23 == v22) {
      goto LABEL_28;
    }
  }
  __break(1u);
LABEL_28:
  swift_bridgeObjectRelease();
  a3 = v51;
  a2 = v50;
  a4 = v49;
  uint64_t v5 = v48;
LABEL_30:
  double v40 = (*(double (**)(uint64_t, uint64_t))(a3 + 64))(a2, a3);
  double v41 = (*(double (**)(uint64_t, uint64_t))(a3 + 72))(a2, a3);
  char v42 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 96))(a2, a3);
  uint64_t v43 = v52;
  (*(void (**)(uint64_t, uint64_t))(a3 + 80))(a2, a3);
  type metadata accessor for ArticleScorer();
  Date.timeIntervalSince(_:)();
  double v45 = v44 * 1000.0;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v43, v54);
  double v46 = (*(double (**)(uint64_t, uint64_t))(a3 + 88))(a2, a3);
  *(double *)uint64_t v59 = v16;
  *(double *)&v59[1] = v17;
  *(double *)&v59[2] = v18;
  v59[3] = v20;
  v59[4] = v24;
  *(double *)&v59[5] = v40;
  *(double *)&v59[6] = v41;
  char v60 = v42 & 1;
  double v61 = v45;
  double v62 = v46;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v65 = 0;
  sub_10001CFE0((uint64_t)v59, v5 + 1, (uint64_t)v58);
  sub_100021AFC((uint64_t)v55, (uint64_t)v58, a2, a4);
}

uint64_t ArticleScorer.score<A>(articles:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a1;
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  uint64_t v3 = type metadata accessor for Array();
  uint64_t v4 = type metadata accessor for ScoredArticle();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v15 = sub_10001B94C((void (*)(char *, char *))sub_10001D594, (uint64_t)v9, v3, v4, (uint64_t)&type metadata for Never, WitnessTable, (uint64_t)&protocol witness table for Never, v6);
  type metadata accessor for Array();
  uint64_t v13 = Dictionary.init()();
  type metadata accessor for Dictionary();
  swift_getWitnessTable();
  Sequence.reduce<A>(into:_:)();
  swift_bridgeObjectRelease();
  uint64_t v7 = Dictionary.mapValues<A>(_:)();
  swift_bridgeObjectRelease();
  uint64_t v13 = v7;
  uint64_t v12 = Array.init()();
  swift_getWitnessTable();
  Sequence.reduce<A>(into:_:)();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_10001B94C(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a5;
  uint64_t v29 = a8;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v27 = *(void *)(a5 - 8);
  __chkstk_darwin(a1);
  double v40 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v12 = (char *)&v26 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  __chkstk_darwin(v15);
  double v17 = (char *)&v26 - v16;
  uint64_t v18 = dispatch thunk of Collection.count.getter();
  if (!v18) {
    return static Array._allocateUninitialized(_:)();
  }
  Swift::Int v19 = v18;
  uint64_t v43 = ContiguousArray.init()();
  uint64_t v32 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v19);
  uint64_t v36 = v8;
  uint64_t result = dispatch thunk of Collection.startIndex.getter();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v34 = (void (**)(char *))(v33 + 2);
    uint64_t v35 = v14;
    ++v33;
    while (1)
    {
      uint64_t v21 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
      uint64_t v22 = v12;
      uint64_t v23 = v12;
      uint64_t v24 = AssociatedTypeWitness;
      (*v34)(v22);
      v21(v42, 0);
      uint64_t v25 = v41;
      v38(v23, v40);
      if (v25) {
        break;
      }
      uint64_t v41 = 0;
      (*v33)(v23, v24);
      ContiguousArray.append(_:)();
      dispatch thunk of Collection.formIndex(after:)();
      --v19;
      uint64_t v12 = v23;
      if (!v19)
      {
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
        return v43;
      }
    }
    (*v33)(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v40, v28);
  }
  return result;
}

uint64_t sub_10001BD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  uint64_t v5 = type metadata accessor for ScoredArticle();
  type metadata accessor for Array();
  swift_bridgeObjectRetain();
  Dictionary.subscript.getter();
  swift_bridgeObjectRelease();
  if (!v9) {
    static Array._allocateUninitialized(_:)();
  }
  type metadata accessor for _ContiguousArrayStorage();
  uint64_t v6 = *(void *)(v5 - 8);
  swift_allocObject();
  static Array._adoptStorage(_:count:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, a2, v5);
  static Array.+ infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for Dictionary();
  return Dictionary.subscript.setter();
}

uint64_t sub_10001BF34@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v27 = *a1;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v8 = (char *)type metadata accessor for ScoredArticle();
  type metadata accessor for Array();
  swift_getWitnessTable();
  Sequence.sorted(by:)();
  Sequence.enumerated()();
  swift_bridgeObjectRelease();
  uint64_t v26 = v27;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a2;
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  uint64_t v18 = sub_10001DF88;
  Swift::Int v19 = &v20;
  uint64_t v9 = type metadata accessor for EnumeratedSequence();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v12 = sub_10001C398((void (*)(char *, char *))sub_10001DF94, (uint64_t)v15, v9, v8, (uint64_t)&type metadata for Never, WitnessTable, (uint64_t)&protocol witness table for Never, v11);
  uint64_t result = swift_bridgeObjectRelease();
  *a5 = v12;
  return result;
}

void sub_10001C0E4(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v33 = a5;
  uint64_t v34 = a6;
  uint64_t v10 = *(void *)(a4 - 8);
  __chkstk_darwin(a1);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a2 + *(int *)(type metadata accessor for ScoredArticle() + 36);
  double v14 = *(double *)v13;
  long long v31 = *(_OWORD *)(v13 + 8);
  uint64_t v30 = *(void *)(v13 + 24);
  uint64_t v29 = *(void *)(v13 + 32);
  uint64_t v15 = *(void *)(v13 + 40);
  uint64_t v16 = *(void *)(v13 + 48);
  int v28 = *(unsigned __int8 *)(v13 + 56);
  uint64_t v17 = *(void *)(v13 + 64);
  uint64_t v27 = *(void *)(v13 + 72);
  double v18 = *(double *)(v13 + 104);
  uint64_t v32 = *(void *)(v13 + 96);
  Swift::Int v19 = a3 + 1;
  uint64_t v21 = a3[4];
  uint64_t v20 = a3[5];
  sub_1000136F8(a3 + 1, v21);
  double v22 = (*(double (**)(uint64_t, uint64_t))(v20 + 160))(v21, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, a4);
  uint64_t v23 = a3[4];
  uint64_t v24 = a3[5];
  sub_1000136F8(v19, v23);
  double v25 = (*(double (**)(uint64_t, uint64_t))(v24 + 128))(v23, v24);
  long double v26 = pow(1.0 - v25, (double)a1);
  double v35 = v14;
  long long v36 = v31;
  uint64_t v37 = v30;
  uint64_t v38 = v29;
  uint64_t v39 = v15;
  uint64_t v40 = v16;
  char v41 = v28;
  uint64_t v42 = v17;
  uint64_t v43 = v27;
  uint64_t v44 = a1;
  uint64_t v45 = 0;
  uint64_t v46 = v32;
  double v47 = v18;
  double v48 = v14 * v22 + (1.0 - v22) * (v18 * v26);
  sub_100021AFC((uint64_t)v12, (uint64_t)&v35, a4, v34);
}

long double static ArticleScorer.applyRankPenalty(score:penalty:rank:)(uint64_t a1, double a2, double a3)
{
  return pow(1.0 - a3, (double)a1) * a2;
}

uint64_t sub_10001C398(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a8;
  uint64_t v44 = a5;
  uint64_t v9 = v8;
  uint64_t v58 = a2;
  uint64_t v59 = a4;
  uint64_t v57 = a1;
  uint64_t v42 = *(void *)(a5 - 8);
  uint64_t v11 = __chkstk_darwin(a1);
  uint64_t v55 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v53 = (char *)&v40 - v13;
  uint64_t v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  char v41 = (char *)&v40 - v17;
  uint64_t v18 = type metadata accessor for Optional();
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v51 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v40 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v40 = (char *)&v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v50 = *((void *)v15 - 1);
  __chkstk_darwin(v26);
  int v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a6;
  uint64_t v52 = v15;
  uint64_t v60 = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v30 = (char *)&v40 - v29;
  Swift::Int v31 = dispatch thunk of Sequence.underestimatedCount.getter();
  uint64_t v61 = ContiguousArray.init()();
  uint64_t v56 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v31);
  (*(void (**)(char *, uint64_t, void))(v50 + 16))(v28, v48, v52);
  uint64_t v59 = v30;
  uint64_t result = dispatch thunk of Sequence.makeIterator()();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    uint64_t v33 = (uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
    uint64_t v34 = (uint64_t (**)(char *, uint64_t))(v54 + 8);
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      dispatch thunk of IteratorProtocol.next()();
      uint64_t result = (*v33)(v23, 1, AssociatedTypeWitness);
      if (result == 1) {
        goto LABEL_18;
      }
      v57(v23, v55);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v55, v44);
        return (*v34)(v23, AssociatedTypeWitness);
      }
      uint64_t v9 = 0;
      (*v34)(v23, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      if (!--v31)
      {
        uint64_t v35 = v54;
        long long v36 = v51;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v35 = v54;
  long long v36 = v51;
LABEL_9:
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v55 = *(char **)(v35 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v36, 1, AssociatedTypeWitness) == 1)
  {
    uint64_t v37 = v51;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v37, v46);
    return v61;
  }
  else
  {
    uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    uint64_t v54 = v35 + 32;
    uint64_t v38 = (void (**)(char *, uint64_t))(v35 + 8);
    uint64_t v39 = v41;
    uint64_t v37 = v51;
    while (1)
    {
      v52(v39, v37, AssociatedTypeWitness);
      v57(v39, v53);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      (*v38)(v39, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      dispatch thunk of IteratorProtocol.next()();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v37, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_14;
      }
    }
    (*v38)(v39, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v53, v44);
  }
}

uint64_t sub_10001CA98(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  uint64_t v53 = a2;
  uint64_t v6 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  uint64_t v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v8);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(v5, a4);
  uint64_t v52 = *(void *)(v9 + 16);
  if (!v52)
  {
    swift_bridgeObjectRelease();
LABEL_26:
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(a4 + 8))(v54, v5, a4);
    uint64_t v39 = v55;
    uint64_t v40 = v56;
    sub_1000136F8(v54, v55);
    if ((*(double (**)(uint64_t, uint64_t))(v40 + 24))(v39, v40) > 0.0)
    {
      uint64_t v41 = v55;
      uint64_t v42 = v56;
      sub_1000136F8(v54, v55);
      (*(void (**)(uint64_t, uint64_t))(v42 + 16))(v41, v42);
      uint64_t v43 = v55;
      uint64_t v44 = v56;
      sub_1000136F8(v54, v55);
      (*(double (**)(uint64_t, uint64_t))(v44 + 24))(v43, v44);
    }
    sub_10001373C((uint64_t)v54);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v46 = a4;
  uint64_t v47 = v8;
  uint64_t v48 = v6;
  uint64_t v49 = v5;
  uint64_t v10 = 0;
  uint64_t v45 = v9;
  uint64_t v51 = v9 + 32;
  double v11 = 0.0;
  double v12 = 0.0;
  do
  {
    uint64_t v13 = (void *)(v51 + 40 * v10);
    double v14 = (void *)*v53;
    uint64_t v15 = v13[3];
    uint64_t v17 = v13[4];
    uint64_t v16 = v13 + 4;
    sub_1000136F8(v13, v15);
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 8);
    swift_bridgeObjectRetain();
    uint64_t v19 = v18(v15, v17);
    uint64_t v21 = v20;
    uint64_t v22 = v14[2];
    if (!v22) {
      goto LABEL_3;
    }
    uint64_t v23 = v19;
    uint64_t v50 = v13 + 3;
    if (v14[4] != v19 || v14[5] != v20)
    {
      uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((result & 1) == 0)
      {
        if (v22 != 1)
        {
          uint64_t v35 = v14 + 7;
          uint64_t v36 = 1;
          while (1)
          {
            uint64_t v37 = v36 + 1;
            if (__OFADD__(v36, 1)) {
              break;
            }
            if (*(v35 - 1) == v23 && *v35 == v21) {
              goto LABEL_11;
            }
            uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if (result) {
              goto LABEL_11;
            }
            v35 += 2;
            ++v36;
            if (v37 == v22) {
              goto LABEL_3;
            }
          }
          __break(1u);
          return result;
        }
LABEL_3:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100016F78((uint64_t)v13, (uint64_t)v54);
        sub_10001373C((uint64_t)v54);
        goto LABEL_4;
      }
    }
LABEL_11:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100016F78((uint64_t)v13, (uint64_t)v54);
    uint64_t v26 = v55;
    uint64_t v27 = v56;
    sub_1000136F8(v54, v55);
    double v28 = (*(double (**)(uint64_t, uint64_t))(v27 + 24))(v26, v27);
    sub_10001373C((uint64_t)v54);
    if (v28 > 0.0)
    {
      uint64_t v29 = v50;
      uint64_t v30 = *v50;
      uint64_t v31 = *v16;
      sub_1000136F8(v13, *v50);
      double v32 = (*(double (**)(uint64_t, uint64_t))(v31 + 16))(v30, v31);
      uint64_t v33 = *v29;
      uint64_t v34 = *v16;
      sub_1000136F8(v13, *v29);
      double v11 = v11 + v32 / (*(double (**)(uint64_t, uint64_t))(v34 + 24))(v33, v34);
      double v12 = v12 + 1.0;
    }
LABEL_4:
    ++v10;
  }
  while (v10 != v52);
  swift_bridgeObjectRelease();
  uint64_t v6 = v48;
  uint64_t v5 = v49;
  a4 = v46;
  uint64_t v8 = v47;
  if (v12 == 0.0) {
    goto LABEL_26;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10001CEE8(uint64_t a1, void *a2)
{
  if (a1 == 2)
  {
    uint64_t v6 = a2[3];
    uint64_t v7 = a2[4];
    sub_1000136F8(a2, v6);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 80))(v6, v7);
  }
  else if (a1 == 1)
  {
    uint64_t v3 = a2[3];
    uint64_t v4 = a2[4];
    sub_1000136F8(a2, v3);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 72))(v3, v4);
  }
  else
  {
    uint64_t v8 = a2[3];
    uint64_t v9 = a2[4];
    sub_1000136F8(a2, v8);
    if (a1 >= 3) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 88))(v8, v9);
    }
    else {
      return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 64))(v8, v9);
    }
  }
}

long double sub_10001CFE0@<D0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  uint64_t v8 = a2[3];
  uint64_t v9 = a2[4];
  sub_1000136F8(a2, v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 136))(v8, v9);
  BOOL v11 = v7 > 0.0 && v6 > 0.0;
  long double v12 = 1.0;
  double v96 = v7;
  double v97 = v6;
  double v13 = v6 / v7;
  double v102 = 1.0;
  if (v11) {
    double v102 = exp2(-(v10 * v13));
  }
  uint64_t v14 = a2[3];
  uint64_t v15 = a2[4];
  sub_1000136F8(a2, v14);
  (*(void (**)(uint64_t, uint64_t))(v15 + 48))(v14, v15);
  if (v11) {
    long double v12 = exp2(-(v16 * v13));
  }
  double v94 = v12;
  uint64_t v17 = a2[3];
  uint64_t v18 = a2[4];
  sub_1000136F8(a2, v17);
  double v92 = (*(double (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
  double v98 = *(double *)(a1 + 16);
  uint64_t v19 = a2[3];
  uint64_t v20 = a2[4];
  sub_1000136F8(a2, v19);
  double v91 = (*(double (**)(uint64_t, uint64_t))(v20 + 24))(v19, v20);
  uint64_t v21 = a2[3];
  uint64_t v22 = a2[4];
  sub_1000136F8(a2, v21);
  double v89 = (*(double (**)(uint64_t, uint64_t))(v22 + 32))(v21, v22);
  double v23 = *(double *)(a1 + 24);
  uint64_t v24 = *(void *)(a1 + 32);
  sub_10001CEE8(v24, a2);
  double v90 = v25;
  double v99 = *(double *)(a1 + 40);
  uint64_t v26 = a2[3];
  uint64_t v27 = a2[4];
  sub_1000136F8(a2, v26);
  double v88 = (*(double (**)(uint64_t, uint64_t))(v27 + 104))(v26, v27);
  uint64_t v28 = a2[3];
  uint64_t v29 = a2[4];
  sub_1000136F8(a2, v28);
  double v30 = (*(double (**)(uint64_t, uint64_t))(v29 + 112))(v28, v29);
  double v100 = *(double *)(a1 + 8);
  double v101 = *(double *)(a1 + 48);
  uint64_t v31 = a2[3];
  uint64_t v32 = a2[4];
  sub_1000136F8(a2, v31);
  double v33 = (*(double (**)(uint64_t, uint64_t))(v32 + 16))(v31, v32);
  uint64_t v34 = a2[3];
  uint64_t v35 = a2[4];
  sub_1000136F8(a2, v34);
  double v36 = (*(double (**)(uint64_t, uint64_t))(v35 + 8))(v34, v35);
  uint64_t v37 = a2[3];
  uint64_t v38 = a2[4];
  sub_1000136F8(a2, v37);
  double v39 = (*(double (**)(uint64_t, uint64_t))(v38 + 56))(v37, v38);
  uint64_t v40 = a2[3];
  uint64_t v41 = a2[4];
  sub_1000136F8(a2, v40);
  double v42 = (*(double (**)(uint64_t, uint64_t))(v41 + 96))(v40, v41);
  uint64_t v43 = a2[3];
  uint64_t v44 = a2[4];
  sub_1000136F8(a2, v43);
  double v45 = (*(double (**)(uint64_t, uint64_t))(v44 + 120))(v43, v44);
  uint64_t v46 = *(void *)(a1 + 88);
  uint64_t v47 = a2[3];
  uint64_t v48 = a2[4];
  sub_1000136F8(a2, v47);
  double v49 = (*(double (**)(uint64_t, uint64_t))(v48 + 152))(v47, v48);
  int v50 = *(unsigned __int8 *)(a1 + 56);
  double v51 = 1.0;
  if (v50 == 1)
  {
    uint64_t v52 = a2[3];
    uint64_t v53 = a2[4];
    double v54 = v49;
    sub_1000136F8(a2, v52);
    double v55 = (*(double (**)(uint64_t, uint64_t))(v53 + 144))(v52, v53);
    double v49 = v54;
    double v51 = 1.0 - v55;
  }
  double v56 = v33 + v36 + v39 + v42 + v45;
  if (v56 <= 0.0) {
    double v56 = 1.0;
  }
  double v57 = v99 * v88 + v30;
  if (v57 <= 1.0) {
    double v58 = v99 * v88 + v30;
  }
  else {
    double v58 = 1.0;
  }
  BOOL v59 = v57 > 0.0;
  double v60 = 0.0;
  if (!v59) {
    double v58 = 0.0;
  }
  double v61 = v92;
  double v62 = v98 * v91 + v89;
  if (v62 <= 1.0) {
    double v63 = v98 * v91 + v89;
  }
  else {
    double v63 = 1.0;
  }
  if (v62 > 0.0) {
    double v60 = v63;
  }
  double v64 = (1.0 - v92) * v60;
  double v93 = v94 * (v92 * v23) + v102 * v64;
  double v95 = v23;
  double v65 = v51 / v56;
  double v66 = v100 * v36;
  double v67 = v90 * v39;
  double v68 = v58 * v42;
  double v69 = v101 * v45;
  double v70 = ((v61 * v23 + v64) * v33 + v66 + v67 + v68 + v69) * (v51 / v56);
  long double v71 = pow(1.0 - v49, (double)v46);
  long double v72 = v71 * v70;
  long double v73 = v71 * ((v93 * v33 + v102 * (v66 + v67 + v68 + v69)) * v65);
  double v74 = *(double *)a1;
  uint64_t v75 = a2[3];
  uint64_t v76 = a2[4];
  sub_1000136F8(a2, v75);
  double v77 = (*(double (**)(uint64_t, uint64_t))(v76 + 160))(v75, v76);
  uint64_t v78 = *(void *)(a1 + 80);
  double v79 = v74 * v77;
  double v80 = 1.0 - v77;
  long double v81 = v74 * v77 + v72 * (1.0 - v77);
  long double v82 = v74 * v77 + v73 * (1.0 - v77);
  uint64_t v83 = a2[3];
  uint64_t v84 = a2[4];
  sub_1000136F8(a2, v83);
  double v85 = (*(double (**)(uint64_t, uint64_t))(v84 + 128))(v83, v84);
  long double v86 = pow(1.0 - v85, (double)v78);
  *(double *)a3 = v74;
  *(double *)(a3 + 8) = v100;
  long double result = v79 + v80 * (v73 * v86);
  *(double *)(a3 + 16) = v98;
  *(double *)(a3 + 24) = v95;
  *(void *)(a3 + 32) = v24;
  *(double *)(a3 + 40) = v99;
  *(double *)(a3 + 48) = v101;
  *(unsigned char *)(a3 + 56) = v50;
  *(double *)(a3 + 64) = v97;
  *(double *)(a3 + 72) = v96;
  *(void *)(a3 + 80) = v78;
  *(void *)(a3 + 88) = v46;
  *(long double *)(a3 + 96) = v81;
  *(long double *)(a3 + 104) = v82;
  *(long double *)(a3 + 112) = result;
  return result;
}

void sub_10001D594(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  ArticleScorer.score<A>(article:)(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_10001D5C4(uint64_t a1, uint64_t a2)
{
  return sub_10001BD4C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_10001D5E0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10001BF34(a1, v2[4], v2[2], v2[3], a2);
}

uint64_t sub_10001D600()
{
  return static Array.+= infix(_:_:)();
}

uint64_t initializeBufferWithCopyOfBuffer for ArticleScorer(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2 + 1;
    long long v9 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v9;
    uint64_t v10 = v9;
    BOOL v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_bridgeObjectRetain();
    v11(a1 + 8, v8, v10);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = a1 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    uint64_t v15 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for ArticleScorer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 8;
  swift_bridgeObjectRelease();
  sub_10001373C(v4);
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = type metadata accessor for Date();
  double v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t initializeWithCopy for ArticleScorer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = a2 + 8;
  long long v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  uint64_t v8 = v7;
  long long v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_bridgeObjectRetain();
  v9(a1 + 8, v6, v8);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

void *assignWithCopy for ArticleScorer(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2 + 1;
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_10001D998(a1 + 1, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  long long v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t *sub_10001D998(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        long double result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *long double result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t initializeWithTake for ArticleScorer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for ArticleScorer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  sub_10001373C(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArticleScorer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001DD1C);
}

uint64_t sub_10001DD1C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ArticleScorer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001DDE0);
}

void *sub_10001DDE0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *long double result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Date();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10001DE88()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

BOOL sub_10001DF2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScoredArticle();
  return *(double *)(a2 + *(int *)(v4 + 36) + 104) < *(double *)(a1 + *(int *)(v4 + 36) + 104);
}

void sub_10001DF88(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_10001C0E4(a1, a2, *(void **)(v3 + 32), *(void *)(v3 + 16), *(void *)(v3 + 24), a3);
}

uint64_t sub_10001DF94(char *a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 32);
  uint64_t v4 = *(void *)a1;
  type metadata accessor for ScoredArticle();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return v3(v4, &a1[*(int *)(TupleTypeMetadata2 + 48)]);
}

unint64_t *sub_10001E01C(void (*a1)(void *__return_ptr, void *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v5)
  {
    uint64_t v19 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_10002F1DC(0, v5, 0);
    uint64_t v6 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t v8 = (uint64_t *)(a3 + 40);
    while (1)
    {
      uint64_t v9 = *v8;
      v17[0] = *(v8 - 1);
      v17[1] = v9;
      swift_bridgeObjectRetain();
      a1(v18, v17);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      swift_bridgeObjectRelease();
      unint64_t v11 = v18[0];
      unint64_t v10 = v18[1];
      uint64_t v19 = v6;
      unint64_t v13 = v6[2];
      unint64_t v12 = v6[3];
      if (v13 >= v12 >> 1)
      {
        sub_10002F1DC(v12 > 1, v13 + 1, 1);
        uint64_t v6 = v19;
      }
      v8 += 2;
      v6[2] = v13 + 1;
      uint64_t v14 = &v6[2 * v13];
      void v14[4] = v11;
      v14[5] = v10;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v6;
}

id DiagnosticFileProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id DiagnosticFileProvider.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super init];
}

uint64_t sub_10001E244@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  int64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.appendingPathComponent(_:)();
  uint64_t v6 = URL.path.getter();
  uint64_t v8 = v7;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v6;
  a1[1] = v8;
  return result;
}

unint64_t *sub_10001E340()
{
  uint64_t v0 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  uint64_t v6 = &v18[-v5];
  type metadata accessor for AppGroup();
  static AppGroup.stocks.getter();
  AppGroup.containerURL.getter();
  swift_release();
  URL.appendingPathComponent(_:)();
  uint64_t v7 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  id v8 = [self defaultManager];
  URL.path.getter();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v19 = 0;
  id v10 = [v8 contentsOfDirectoryAtPath:v9 error:&v19];

  id v11 = v19;
  if (v10)
  {
    uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v13 = v11;

    __chkstk_darwin(v14);
    *(void *)&v18[-16] = v6;
    uint64_t v15 = sub_10001E01C((void (*)(void *__return_ptr, void *))sub_10001E7C4, (uint64_t)&v18[-32], v12);
    v7(v6, v0);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v16 = v19;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    v7(v6, v0);
    return (unint64_t *)&_swiftEmptyArrayStorage;
  }
  return v15;
}

char *_s9StocksApp22DiagnosticFileProviderC5filesSaySSGyF_0()
{
  uint64_t v3 = sub_10001E340();
  uint64_t v4 = static Caches.Default.location.getter();
  uint64_t v6 = v5;
  uint64_t v7 = static Caches.Shared.location.getter();
  uint64_t v9 = v8;
  uint64_t v10 = static Caches.Charts.location.getter();
  int64_t v12 = v3[2];
  int64_t v13 = v12 + 3;
  if (__OFADD__(v12, 3))
  {
    __break(1u);
LABEL_15:
    uint64_t v2 = sub_100022AC8((char *)(v1 > 1), v12, 1, v2);
    goto LABEL_9;
  }
  uint64_t v0 = v11;
  uint64_t v23 = v10;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (uint64_t v2 = (char *)v3, v13 > (uint64_t)(v3[3] >> 1)))
  {
    if (v12 <= v13) {
      int64_t v15 = v12 + 3;
    }
    else {
      int64_t v15 = v12;
    }
    uint64_t v2 = sub_100022AC8(isUniquelyReferenced_nonNull_native, v15, 1, (char *)v3);
  }
  int64_t v13 = *((void *)v2 + 2);
  unint64_t v1 = *((void *)v2 + 3);
  int64_t v12 = v13 + 1;
  swift_bridgeObjectRetain();
  if (v13 >= v1 >> 1) {
    goto LABEL_15;
  }
LABEL_9:
  *((void *)v2 + 2) = v12;
  id v16 = &v2[16 * v13];
  *((void *)v16 + 4) = v4;
  *((void *)v16 + 5) = v6;
  unint64_t v17 = *((void *)v2 + 3);
  swift_bridgeObjectRetain();
  if (v12 >= v17 >> 1) {
    uint64_t v2 = sub_100022AC8((char *)(v17 > 1), v13 + 2, 1, v2);
  }
  *((void *)v2 + 2) = v13 + 2;
  uint64_t v18 = &v2[16 * v12];
  *((void *)v18 + 4) = v7;
  *((void *)v18 + 5) = v9;
  unint64_t v20 = *((void *)v2 + 2);
  unint64_t v19 = *((void *)v2 + 3);
  swift_bridgeObjectRetain();
  if (v20 >= v19 >> 1) {
    uint64_t v2 = sub_100022AC8((char *)(v19 > 1), v20 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v20 + 1;
  uint64_t v21 = &v2[16 * v20];
  *((void *)v21 + 4) = v23;
  *((void *)v21 + 5) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t type metadata accessor for DiagnosticFileProvider()
{
  return self;
}

uint64_t sub_10001E7C4@<X0>(uint64_t *a1@<X8>)
{
  return sub_10001E244(a1);
}

uint64_t sub_10001E7E4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return _swift_task_switch(sub_10001E804, 0, 0);
}

uint64_t sub_10001E804()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 72) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001E898, v2, v1);
}

uint64_t sub_10001E898()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_release();
  uint64_t v2 = v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver;
  sub_1000136F8((void *)(v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver), *(void *)(v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver + 24));
  sub_10001378C(0, &qword_1000548B0);
  dispatch thunk of ResolverType.resolve<A>(_:name:)();
  uint64_t v3 = *(void *)(v0 + 56);
  if (*(void *)(v0 + 40))
  {
    sub_10001393C((long long *)(v0 + 16), v3);
  }
  else
  {
    sub_100016F78(v2, v3);
    sub_100020B18(v0 + 16);
  }
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10001E9A4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return _swift_task_switch(sub_10001E9C4, 0, 0);
}

uint64_t sub_10001E9C4()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 48) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001EA58, v2, v1);
}

uint64_t sub_10001EA58()
{
  swift_release();
  uint64_t v1 = sub_10001EAF8();
  v0[2] = v1;
  v0[3] = v2;
  v0[7] = v1;
  return _swift_task_switch(sub_10001EACC, 0, 0);
}

uint64_t sub_10001EACC()
{
  uint64_t v1 = *(void *)(v0 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 24);
    uint64_t v3 = *(void **)(v0 + 32);
    *uint64_t v3 = v1;
    v3[1] = v2;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001EAF8()
{
  sub_10001378C(0, &qword_100053EB0);
  uint64_t v1 = v0 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver;
  sub_1000136F8((void *)(v0 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver), *(void *)(v0 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver + 24));
  sub_10001378C(0, &qword_1000548B0);
  dispatch thunk of ResolverType.resolve<A>(_:name:)();
  if (v4)
  {
    sub_10001393C(&v3, (uint64_t)v5);
  }
  else
  {
    sub_100016F78(v1, (uint64_t)v5);
    sub_100020B18((uint64_t)&v3);
  }
  sub_1000136F8(v5, v5[3]);
  dispatch thunk of ResolverType.resolve<A>(_:)();
  sub_10001373C((uint64_t)v5);
  return v3;
}

uint64_t sub_10001EC20(unint64_t *a1)
{
  sub_10001378C(0, a1);
  uint64_t v2 = v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver;
  sub_1000136F8((void *)(v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver), *(void *)(v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver + 24));
  sub_10001378C(0, &qword_1000548B0);
  dispatch thunk of ResolverType.resolve<A>(_:name:)();
  if (v5)
  {
    sub_10001393C(&v4, (uint64_t)v6);
  }
  else
  {
    sub_100016F78(v2, (uint64_t)v6);
    sub_100020B18((uint64_t)&v4);
  }
  sub_1000136F8(v6, v6[3]);
  dispatch thunk of ResolverType.resolve<A>(_:)();
  return sub_10001373C((uint64_t)v6);
}

uint64_t sub_10001ED40(void (*a1)(void))
{
  a1(0);
  uint64_t v2 = v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver;
  sub_1000136F8((void *)(v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver), *(void *)(v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver + 24));
  sub_10001378C(0, &qword_1000548B0);
  dispatch thunk of ResolverType.resolve<A>(_:name:)();
  if (v5)
  {
    sub_10001393C(&v4, (uint64_t)v6);
  }
  else
  {
    sub_100016F78(v2, (uint64_t)v6);
    sub_100020B18((uint64_t)&v4);
  }
  sub_1000136F8(v6, v6[3]);
  dispatch thunk of ResolverType.resolve<A>(_:)();
  sub_10001373C((uint64_t)v6);
  return v4;
}

uint64_t sub_10001EE5C(void (*a1)(void))
{
  a1(0);
  uint64_t v2 = v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver;
  sub_1000136F8((void *)(v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver), *(void *)(v1 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver + 24));
  sub_10001378C(0, &qword_1000548B0);
  dispatch thunk of ResolverType.resolve<A>(_:name:)();
  if (v5)
  {
    sub_10001393C(&v4, (uint64_t)v6);
  }
  else
  {
    sub_100016F78(v2, (uint64_t)v6);
    sub_100020B18((uint64_t)&v4);
  }
  sub_1000136F8(v6, v6[3]);
  dispatch thunk of ResolverType.resolve<A>(_:)();
  return sub_10001373C((uint64_t)v6);
}

uint64_t sub_10001EF78(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return _swift_task_switch(sub_10001EF98, 0, 0);
}

uint64_t sub_10001EF98()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 72) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001F02C, v2, v1);
}

uint64_t sub_10001F02C()
{
  swift_release();
  sub_10001EC20(&qword_100054300);
  return _swift_task_switch(sub_100020C5C, 0, 0);
}

uint64_t sub_10001F0B0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return _swift_task_switch(sub_10001F0D0, 0, 0);
}

uint64_t sub_10001F0D0()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 72) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001F164, v2, v1);
}

uint64_t sub_10001F164()
{
  swift_release();
  sub_10001EC20(&qword_100054318);
  return _swift_task_switch(sub_100020C5C, 0, 0);
}

uint64_t sub_10001F1E8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return _swift_task_switch(sub_10001F208, 0, 0);
}

uint64_t sub_10001F208()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 72) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001F29C, v2, v1);
}

uint64_t sub_10001F29C()
{
  swift_release();
  sub_10001EC20(&qword_100054330);
  return _swift_task_switch(sub_10001F320, 0, 0);
}

uint64_t sub_10001F320()
{
  if (*(void *)(v0 + 40))
  {
    sub_10001393C((long long *)(v0 + 16), *(void *)(v0 + 56));
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001F394(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return _swift_task_switch(sub_10001F3B4, 0, 0);
}

uint64_t sub_10001F3B4()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 72) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001F448, v2, v1);
}

uint64_t sub_10001F448()
{
  swift_release();
  sub_10001EC20(&qword_100054348);
  return _swift_task_switch(sub_100020C5C, 0, 0);
}

uint64_t sub_10001F4CC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return _swift_task_switch(sub_10001F4EC, 0, 0);
}

uint64_t sub_10001F4EC()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 40) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001F580, v2, v1);
}

uint64_t sub_10001F580()
{
  swift_release();
  *(void *)(v0 + 48) = sub_10001ED40(sub_100020C34);
  return _swift_task_switch(sub_10001F604, 0, 0);
}

uint64_t sub_10001F604()
{
  uint64_t v1 = v0[6];
  if (v1)
  {
    v0[2] = v1;
    type metadata accessor for StocksActivity();
    sub_100020C34(0);
    sub_100016A84((unint64_t *)&unk_100054400, sub_100020C34);
    AnyNavigator.init<A>(base:)();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001F6E4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return _swift_task_switch(sub_10001F704, 0, 0);
}

uint64_t sub_10001F704()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 72) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001F798, v2, v1);
}

uint64_t sub_10001F798()
{
  swift_release();
  sub_10001EC20(&qword_100054380);
  return _swift_task_switch(sub_100020C5C, 0, 0);
}

uint64_t sub_10001F81C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_10001F83C, 0, 0);
}

uint64_t sub_10001F83C()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 32) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001F8D0, v2, v1);
}

uint64_t sub_10001F8D0()
{
  swift_release();
  *(void *)(v0 + 40) = sub_10001ED40((void (*)(void))&type metadata accessor for Tracker);
  return _swift_task_switch(sub_10001F954, 0, 0);
}

uint64_t sub_10001F954()
{
  uint64_t v1 = *(void *)(v0 + 40);
  if (v1)
  {
    **(void **)(v0 + 16) = v1;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001F980(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_100020BE0(0, &qword_1000543E8, (void (*)(uint64_t))&type metadata accessor for ArticleTopStoriesOptionsProvider);
  v2[4] = swift_task_alloc();
  return _swift_task_switch(sub_10001FA2C, 0, 0);
}

uint64_t sub_10001FA2C()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 40) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001FAC0, v2, v1);
}

uint64_t sub_10001FAC0()
{
  swift_release();
  sub_10001EE5C((void (*)(void))&type metadata accessor for ArticleTopStoriesOptionsProvider);
  return _swift_task_switch(sub_10001FB48, 0, 0);
}

uint64_t sub_10001FB48()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = type metadata accessor for ArticleTopStoriesOptionsProvider();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = (uint64_t *)v0[2];
    v5[3] = v2;
    void v5[4] = sub_100016A84(&qword_1000543F0, (void (*)(uint64_t))&type metadata accessor for ArticleTopStoriesOptionsProvider);
    uint64_t v6 = sub_100015400(v5);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(v6, v1, v2);
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
  return result;
}

uint64_t sub_10001FC90(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_100020BE0(0, &qword_1000543E8, (void (*)(uint64_t))&type metadata accessor for ArticleTopStoriesOptionsProvider);
  v2[4] = swift_task_alloc();
  return _swift_task_switch(sub_10001FD3C, 0, 0);
}

uint64_t sub_10001FD3C()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 40) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001FDD0, v2, v1);
}

uint64_t sub_10001FDD0()
{
  swift_release();
  sub_10001EE5C((void (*)(void))&type metadata accessor for ArticleTopStoriesOptionsProvider);
  return _swift_task_switch(sub_100020C58, 0, 0);
}

uint64_t sub_10001FE58(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_100020BE0(0, &qword_1000543E0, (void (*)(uint64_t))&type metadata accessor for SavedArticleOptionsProvider);
  v2[4] = swift_task_alloc();
  return _swift_task_switch(sub_10001FF04, 0, 0);
}

uint64_t sub_10001FF04()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 40) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001FF98, v2, v1);
}

uint64_t sub_10001FF98()
{
  swift_release();
  sub_10001EE5C((void (*)(void))&type metadata accessor for SavedArticleOptionsProvider);
  return _swift_task_switch(sub_100020020, 0, 0);
}

uint64_t sub_100020020()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = type metadata accessor for SavedArticleOptionsProvider();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = (uint64_t *)v0[2];
    v5[3] = v2;
    void v5[4] = (uint64_t)&protocol witness table for SavedArticleOptionsProvider;
    uint64_t v6 = sub_100015400(v5);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(v6, v1, v2);
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
  return result;
}

uint64_t sub_100020134()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_executionPhase;
  uint64_t v2 = type metadata accessor for StartupTaskExecutionPhase();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  sub_10001373C(v0 + OBJC_IVAR____TtC9StocksApp31AppIntentsDependencyStartupTask_initialResolver);

  return swift_deallocClassInstance();
}

uint64_t sub_1000201F4()
{
  return type metadata accessor for AppIntentsDependencyStartupTask();
}

uint64_t sub_100020200(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000202AC;
  v4[7] = a1;
  v4[8] = v1;
  return _swift_task_switch(sub_10001E804, 0, 0);
}

uint64_t sub_1000202AC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000203A0(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100020C54;
  void v4[4] = a1;
  v4[5] = v1;
  return _swift_task_switch(sub_10001E9C4, 0, 0);
}

uint64_t sub_10002044C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100020C54;
  v4[7] = a1;
  v4[8] = v1;
  return _swift_task_switch(sub_10001EF98, 0, 0);
}

uint64_t sub_1000204F8(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100020C54;
  v4[7] = a1;
  v4[8] = v1;
  return _swift_task_switch(sub_10001F0D0, 0, 0);
}

uint64_t sub_1000205A4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100020C54;
  v4[7] = a1;
  v4[8] = v1;
  return _swift_task_switch(sub_10001F208, 0, 0);
}

uint64_t sub_100020650(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100020C54;
  v4[7] = a1;
  v4[8] = v1;
  return _swift_task_switch(sub_10001F3B4, 0, 0);
}

uint64_t sub_1000206FC(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100020C54;
  void v4[3] = a1;
  void v4[4] = v1;
  return _swift_task_switch(sub_10001F4EC, 0, 0);
}

uint64_t sub_1000207A8(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100020C54;
  v4[7] = a1;
  v4[8] = v1;
  return _swift_task_switch(sub_10001F704, 0, 0);
}

uint64_t sub_100020854(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  void v4[3] = v1;
  v4[1] = sub_1000202AC;
  return _swift_task_switch(sub_10001F83C, 0, 0);
}

uint64_t sub_100020900(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100020C54;
  return sub_10001F980(a1, v1);
}

uint64_t sub_10002099C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100020C54;
  return sub_10001FC90(a1, v1);
}

uint64_t sub_100020A38(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100020C54;
  return sub_10001FE58(a1, v1);
}

uint64_t sub_100020AD4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100020B0C@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_unknownObjectRetain();
}

uint64_t sub_100020B18(uint64_t a1)
{
  sub_100020B74();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100020B74()
{
  if (!qword_100053EA0)
  {
    sub_10001378C(255, &qword_1000548B0);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100053EA0);
    }
  }
}

void sub_100020BE0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_100020C34(uint64_t a1)
{
}

uint64_t *Settings.Debug.clearCacheOnNextLaunch.unsafeMutableAddressor()
{
  if (qword_100053838 != -1) {
    swift_once();
  }
  return &static Settings.Debug.clearCacheOnNextLaunch;
}

unint64_t Storefront.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x313434333431;
      break;
    case 2:
      unint64_t result = 0x343434333431;
      break;
    case 3:
      unint64_t result = 0x353534333431;
      break;
    case 4:
      unint64_t result = 0x303634333431;
      break;
    case 5:
      unint64_t result = 0x353634333431;
      break;
    case 6:
      unint64_t result = 0x323634333431;
      break;
    case 7:
      unint64_t result = 0x313734333431;
      break;
    case 8:
      unint64_t result = 0x323534333431;
      break;
    case 9:
      unint64_t result = 0x333434333431;
      break;
    case 10:
      unint64_t result = 0x323434333431;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100020DE4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = Storefront.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == Storefront.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_100020E70()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  Storefront.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_100020ED4()
{
  Storefront.rawValue.getter(*v0);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100020F28()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  Storefront.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t sub_100020F88@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s9StocksApp10StorefrontO8rawValueACSgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_100020FB8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = Storefront.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100020FE4(uint64_t a1)
{
  unint64_t v2 = sub_1000218F4();

  return static RawRepresentable<>.dataType.getter(a1, v2, &protocol witness table for String);
}

uint64_t sub_100021038(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000218F4();

  return static RawRepresentable<>.convert(from:)(a1, a2, v4, &protocol witness table for String);
}

uint64_t sub_100021094(uint64_t a1)
{
  unint64_t v2 = sub_1000218F4();

  return RawRepresentable<>.toData()(a1, v2, &protocol witness table for String);
}

uint64_t static Settings.Debug.clearCacheOnNextLaunch.getter()
{
  return sub_100021640(&qword_100053838);
}

uint64_t sub_10002110C()
{
  uint64_t v0 = type metadata accessor for Access();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  unint64_t v3 = &v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = type metadata accessor for Domain();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100021948();
  v9[15] = 0;
  *uint64_t v7 = 0xD000000000000012;
  v7[1] = 0x80000001000415A0;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for Domain.domain(_:), v4);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, enum case for Access.protected(_:), v0);
  sub_1000219F8();
  sub_100021A50();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100043D20;
  v9[14] = 0;
  Option.init(label:value:description:)();
  v9[13] = 1;
  Option.init(label:value:description:)();
  v9[12] = 2;
  Option.init(label:value:description:)();
  v9[11] = 3;
  Option.init(label:value:description:)();
  v9[10] = 4;
  Option.init(label:value:description:)();
  v9[9] = 5;
  Option.init(label:value:description:)();
  v9[8] = 6;
  Option.init(label:value:description:)();
  v9[7] = 7;
  Option.init(label:value:description:)();
  v9[6] = 8;
  Option.init(label:value:description:)();
  v9[5] = 9;
  Option.init(label:value:description:)();
  void v9[4] = 10;
  Option.init(label:value:description:)();
  sub_100021AA8();
  uint64_t result = Setting<>.init(_:defaultValue:domain:access:options:)();
  static Settings.Debug.storefront = result;
  return result;
}

uint64_t *Settings.Debug.storefront.unsafeMutableAddressor()
{
  if (qword_100053840 != -1) {
    swift_once();
  }
  return &static Settings.Debug.storefront;
}

uint64_t static Settings.Debug.storefront.getter()
{
  return sub_100021640(&qword_100053840);
}

uint64_t sub_100021640(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t _s9StocksApp10StorefrontO8rawValueACSgSS_tcfC_0(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10004E868, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 0xB) {
    return 11;
  }
  else {
    return v3;
  }
}

unint64_t sub_1000216DC()
{
  unint64_t result = qword_100054410;
  if (!qword_100054410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100054410);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for Storefront(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Storefront(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Storefront(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x10002189CLL);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

uint64_t sub_1000218C4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000218CC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Storefront()
{
  return &type metadata for Storefront;
}

ValueMetadata *type metadata accessor for Settings.Debug()
{
  return &type metadata for Settings.Debug;
}

unint64_t sub_1000218F4()
{
  unint64_t result = qword_100054418;
  if (!qword_100054418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100054418);
  }
  return result;
}

void sub_100021948()
{
  if (!qword_100054420)
  {
    sub_1000219A4();
    unint64_t v0 = type metadata accessor for Setting();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100054420);
    }
  }
}

unint64_t sub_1000219A4()
{
  unint64_t result = qword_100054428;
  if (!qword_100054428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100054428);
  }
  return result;
}

void sub_1000219F8()
{
  if (!qword_100054430)
  {
    sub_100021A50();
    unint64_t v0 = type metadata accessor for _ContiguousArrayStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100054430);
    }
  }
}

void sub_100021A50()
{
  if (!qword_100054438)
  {
    unint64_t v0 = type metadata accessor for Option();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100054438);
    }
  }
}

unint64_t sub_100021AA8()
{
  unint64_t result = qword_100054440;
  if (!qword_100054440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100054440);
  }
  return result;
}

__n128 sub_100021AFC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1);
  uint64_t v6 = a4 + *(int *)(type metadata accessor for ScoredArticle() + 36);
  long long v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v6 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v6 + 80) = v7;
  *(_OWORD *)(v6 + 96) = *(_OWORD *)(a2 + 96);
  *(void *)(v6 + 112) = *(void *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a2;
  *(_OWORD *)(v6 + 16) = v8;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v10 = *(_OWORD *)(a2 + 48);
  *(__n128 *)(v6 + 32) = result;
  *(_OWORD *)(v6 + 48) = v10;
  return result;
}

uint64_t ScoredArticle.article.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

double ScoredArticle.score.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2 + *(int *)(a1 + 36);
  uint64_t v4 = *(void *)(v3 + 32);
  char v5 = *(unsigned char *)(v3 + 56);
  double result = *(double *)(v3 + 112);
  long long v7 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v3;
  *(_OWORD *)(a2 + 16) = v7;
  *(void *)(a2 + 32) = v4;
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(v3 + 40);
  *(unsigned char *)(a2 + 56) = v5;
  long long v8 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(a2 + 80) = v8;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(v3 + 96);
  *(double *)(a2 + 112) = result;
  return result;
}

uint64_t sub_100021C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_100021C20()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_100021CB8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 120 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    long long v12 = *(_OWORD *)(v11 + 48);
    long long v14 = *(_OWORD *)v11;
    long long v13 = *(_OWORD *)(v11 + 16);
    *(_OWORD *)(v10 + 32) = *(_OWORD *)(v11 + 32);
    *(_OWORD *)(v10 + 48) = v12;
    *(_OWORD *)unint64_t v10 = v14;
    *(_OWORD *)(v10 + 16) = v13;
    long long v16 = *(_OWORD *)(v11 + 80);
    long long v15 = *(_OWORD *)(v11 + 96);
    long long v17 = *(_OWORD *)(v11 + 64);
    *(void *)(v10 + 112) = *(void *)(v11 + 112);
    *(_OWORD *)(v10 + 80) = v16;
    *(_OWORD *)(v10 + 96) = v15;
    *(_OWORD *)(v10 + 64) = v17;
  }
  return v4;
}

uint64_t sub_100021DD0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_100021DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  long long v9 = *(_OWORD *)(v8 + 48);
  long long v11 = *(_OWORD *)v8;
  long long v10 = *(_OWORD *)(v8 + 16);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)(v8 + 32);
  *(_OWORD *)(v7 + 48) = v9;
  *(_OWORD *)unint64_t v7 = v11;
  *(_OWORD *)(v7 + 16) = v10;
  long long v13 = *(_OWORD *)(v8 + 80);
  long long v12 = *(_OWORD *)(v8 + 96);
  long long v14 = *(_OWORD *)(v8 + 64);
  *(void *)(v7 + 112) = *(void *)(v8 + 112);
  *(_OWORD *)(v7 + 80) = v13;
  *(_OWORD *)(v7 + 96) = v12;
  *(_OWORD *)(v7 + 64) = v14;
  return a1;
}

uint64_t sub_100021E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v7 = *(void *)v8;
  *(void *)(v7 + 8) = *(void *)(v8 + 8);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  *(void *)(v7 + 32) = *(void *)(v8 + 32);
  *(void *)(v7 + 40) = *(void *)(v8 + 40);
  *(void *)(v7 + 48) = *(void *)(v8 + 48);
  *(unsigned char *)(v7 + 56) = *(unsigned char *)(v8 + 56);
  *(void *)(v7 + 64) = *(void *)(v8 + 64);
  *(void *)(v7 + 72) = *(void *)(v8 + 72);
  *(void *)(v7 + 80) = *(void *)(v8 + 80);
  *(void *)(v7 + 88) = *(void *)(v8 + 88);
  *(void *)(v7 + 96) = *(void *)(v8 + 96);
  *(void *)(v7 + 104) = *(void *)(v8 + 104);
  *(void *)(v7 + 112) = *(void *)(v8 + 112);
  return a1;
}

uint64_t sub_100021F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  long long v9 = *(_OWORD *)(v8 + 48);
  long long v11 = *(_OWORD *)v8;
  long long v10 = *(_OWORD *)(v8 + 16);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)(v8 + 32);
  *(_OWORD *)(v7 + 48) = v9;
  *(_OWORD *)unint64_t v7 = v11;
  *(_OWORD *)(v7 + 16) = v10;
  long long v13 = *(_OWORD *)(v8 + 80);
  long long v12 = *(_OWORD *)(v8 + 96);
  long long v14 = *(_OWORD *)(v8 + 64);
  *(void *)(v7 + 112) = *(void *)(v8 + 112);
  *(_OWORD *)(v7 + 80) = v13;
  *(_OWORD *)(v7 + 96) = v12;
  *(_OWORD *)(v7 + 64) = v14;
  return a1;
}

uint64_t sub_100022020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v7 = *(void *)v8;
  *(void *)(v7 + 8) = *(void *)(v8 + 8);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  *(void *)(v7 + 32) = *(void *)(v8 + 32);
  *(void *)(v7 + 40) = *(void *)(v8 + 40);
  *(void *)(v7 + 48) = *(void *)(v8 + 48);
  *(unsigned char *)(v7 + 56) = *(unsigned char *)(v8 + 56);
  *(void *)(v7 + 64) = *(void *)(v8 + 64);
  *(void *)(v7 + 72) = *(void *)(v8 + 72);
  *(void *)(v7 + 80) = *(void *)(v8 + 80);
  *(void *)(v7 + 88) = *(void *)(v8 + 88);
  *(void *)(v7 + 96) = *(void *)(v8 + 96);
  *(void *)(v7 + 104) = *(void *)(v8 + 104);
  *(void *)(v7 + 112) = *(void *)(v8 + 112);
  return a1;
}

uint64_t sub_10002210C(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0xFE) {
    unsigned int v7 = 254;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 120;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_21;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_21;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x10002225CLL);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_21:
        int v15 = v14 - 1;
        if (v10)
        {
          int v15 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v15) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0xFE) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unsigned int v17 = *(unsigned __int8 *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 56);
  if (v17 >= 2) {
    return ((v17 + 2147483646) & 0x7FFFFFFF) + 1;
  }
  else {
    return 0;
  }
}

double sub_100022270(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0xFE) {
    unsigned int v8 = 254;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 120;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFF88) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFF88) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFF88)
    {
      unsigned int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 120);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return result;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return result;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return result;
      default:
        return result;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return result;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return result;
      }
      goto LABEL_33;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x100022470);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0xFE)
        {
          unint64_t v19 = (unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8;
          if (a2 > 0xFE)
          {
            double result = 0.0;
            *(_OWORD *)(v19 + 104) = 0u;
            *(_OWORD *)(v19 + 88) = 0u;
            *(_OWORD *)(v19 + 72) = 0u;
            *(_OWORD *)(v19 + 56) = 0u;
            *(_OWORD *)(v19 + 40) = 0u;
            *(_OWORD *)(v19 + 24) = 0u;
            *(_OWORD *)(v19 + 8) = 0u;
            *(void *)unint64_t v19 = a2 - 255;
          }
          else
          {
            *(unsigned char *)(v19 + 56) = a2 + 1;
          }
        }
        else
        {
          uint64_t v18 = *(void (**)(void))(v6 + 56);
          v18();
        }
      }
      return result;
  }
}

uint64_t type metadata accessor for ScoredArticle()
{
  return sub_1000224B0();
}

uint64_t sub_1000224B0()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1000224E0()
{
  sub_10001373C(v0 + 16);

  return swift_deallocClassInstance();
}

void sub_100022518()
{
}

void sub_100022544(Swift::String with)
{
}

void sub_100022570()
{
}

void sub_10002259C(Swift::String with)
{
}

void sub_1000225C8()
{
}

uint64_t sub_1000225F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = type metadata accessor for DebugModel();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unsigned int v7 = (uint64_t *)((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  *unsigned int v7 = sub_100022AC0;
  v7[1] = a3;
  unsigned int v8 = *(void (**)(void *, void, uint64_t))(v5 + 104);
  v8(v7, enum case for DebugModel.action(_:), v4);
  swift_retain();
  dispatch thunk of DebugDataSource.add(_:_:)();
  uint64_t v9 = *(void (**)(void *, uint64_t))(v5 + 8);
  v9(v7, v4);
  *unsigned int v7 = sub_100022838;
  v7[1] = 0;
  v8(v7, enum case for DebugModel.modal(_:), v4);
  dispatch thunk of DebugDataSource.add(_:_:)();
  return ((uint64_t (*)(void *, uint64_t))v9)(v7, v4);
}

void sub_100022794()
{
  if (qword_100053838 != -1) {
    swift_once();
  }
  type metadata accessor for DebugAssembly();
  sub_1000231E8(&qword_1000546F0);
  Updatable.save<A>(setting:value:)();
  exit(0);
}

id sub_100022838()
{
  id v0 = [objc_allocWithZone((Class)type metadata accessor for DiagnosticFileProvider()) init];
  unint64_t v1 = _s9StocksApp22DiagnosticFileProviderC5filesSaySSGyF_0();

  uint64_t v2 = *((void *)v1 + 2);
  if (v2)
  {
    uint64_t v3 = type metadata accessor for URL();
    swift_bridgeObjectRetain();
    uint64_t v4 = v1 + 40;
    uint64_t v5 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      uint64_t v14 = v3;
      sub_100015400((uint64_t *)&v13);
      swift_bridgeObjectRetain();
      URL.init(fileURLWithPath:)();
      swift_bridgeObjectRelease();
      if (v14)
      {
        sub_1000230E0(&v13, v15);
        sub_1000230E0(v15, &v13);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_100022BF8(0, *((void *)v5 + 2) + 1, 1, v5);
        }
        unint64_t v7 = *((void *)v5 + 2);
        unint64_t v6 = *((void *)v5 + 3);
        if (v7 >= v6 >> 1) {
          uint64_t v5 = sub_100022BF8((char *)(v6 > 1), v7 + 1, 1, v5);
        }
        *((void *)v5 + 2) = v7 + 1;
        sub_1000230E0(&v13, &v5[32 * v7 + 32]);
      }
      else
      {
        sub_10001897C((uint64_t)&v13);
      }
      v4 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v8 = objc_allocWithZone((Class)UIActivityViewController);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  sub_1000230A0();
  Class v10 = Array._bridgeToObjectiveC()().super.isa;
  id v11 = [v8 initWithActivityItems:isa applicationActivities:v10];

  return v11;
}

uint64_t sub_100022A38()
{
  return Updatable.save<A>(setting:value:)();
}

uint64_t sub_100022A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return Updatable.reset<A>(setting:)(a1, a4, a5);
}

uint64_t sub_100022A54()
{
  return Configurable.setting<A>(_:)();
}

uint64_t sub_100022A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Configurable.setting<A>(_:defaultValue:)(a1, a2, a5, a6);
}

uint64_t sub_100022A6C()
{
  return Configurable.setting<A>(_:_:)();
}

uint64_t sub_100022A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, a7, a8);
}

uint64_t sub_100022A84()
{
  return sub_1000231E8((unint64_t *)&unk_1000546D0);
}

uint64_t sub_100022AB8(uint64_t a1, uint64_t a2)
{
  return sub_1000225F4(a1, a2, v2);
}

void sub_100022AC0()
{
}

char *sub_100022AC8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100023228(0, &qword_1000546F8, (uint64_t)&type metadata for String, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      Class v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      long long v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      Class v10 = (char *)&_swiftEmptyArrayStorage;
      long long v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100022FAC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_100022BF8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100023228(0, &qword_1000546E8, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      Class v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      long long v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      Class v10 = (char *)&_swiftEmptyArrayStorage;
      long long v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_1000230F0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100022D2C(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  if (!v9)
  {
    long long v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000157F4(0, &qword_100054700, (void (*)(uint64_t))&type metadata accessor for Stock);
  uint64_t v10 = *(void *)(type metadata accessor for Stock() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  long long v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  uint64_t v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for Stock() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100023274(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_100022FAC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_1000230A0()
{
  unint64_t result = qword_1000546E0;
  if (!qword_1000546E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000546E0);
  }
  return result;
}

_OWORD *sub_1000230E0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000230F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000231E8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DebugAssembly();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100023228(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_100023274(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for Stock() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000233CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for AppIntentType.unknown(_:);
  uint64_t v3 = type metadata accessor for AppIntentType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104))(a1, v2, v3);
  type metadata accessor for OpenArticleIntent();
  sub_1000236F0(&qword_1000547C8, (void (*)(uint64_t))&type metadata accessor for OpenArticleIntent);
  _AppIntentExecution.callAsFunction<A>(for:handler:)();
  type metadata accessor for OpenBusinessNewsIntent();
  sub_1000236F0(&qword_1000547D0, (void (*)(uint64_t))&type metadata accessor for OpenBusinessNewsIntent);
  _AppIntentExecution.callAsFunction<A>(for:handler:)();
  type metadata accessor for OpenSymbolIntent();
  sub_1000236F0((unint64_t *)&qword_100054118, (void (*)(uint64_t))&type metadata accessor for OpenSymbolIntent);
  _AppIntentExecution.callAsFunction<A>(for:handler:)();
  type metadata accessor for OpenWatchlistIntent();
  sub_1000236F0(&qword_1000547D8, (void (*)(uint64_t))&type metadata accessor for OpenWatchlistIntent);
  return _AppIntentExecution.callAsFunction<A>(for:handler:)();
}

uint64_t sub_1000235F8(uint64_t a1)
{
  return sub_100023628(a1, &enum case for AppIntentType.openArticle(_:));
}

uint64_t sub_100023604(uint64_t a1)
{
  return sub_100023628(a1, &enum case for AppIntentType.openBusinessNews(_:));
}

uint64_t sub_100023610(uint64_t a1)
{
  return sub_100023628(a1, &enum case for AppIntentType.openSymbol(_:));
}

uint64_t sub_10002361C(uint64_t a1)
{
  return sub_100023628(a1, &enum case for AppIntentType.openWatchlist(_:));
}

uint64_t sub_100023628(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = type metadata accessor for AppIntentType();
  uint64_t v9 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v5);
  uint64_t v6 = *a2;
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 104);

  return v7(v4, v6, v5);
}

uint64_t sub_1000236F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002373C(void *a1)
{
  uint64_t v2 = type metadata accessor for AppConfiguration();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000136F8(a1, a1[3]);
  sub_10001378C(0, &qword_1000549D8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v9)
  {
    sub_10001393C(&v8, (uint64_t)v10);
    type metadata accessor for StateRestoreController();
    sub_1000136F8(v10, v10[3]);
    dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
    AppConfiguration.stateRestorationAllowedTimeWindow.getter();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v7 = StateRestoreController.__allocating_init(timeWindow:isStateRestorationEnabled:shouldAlwaysAllowStateRestoration:)();
    sub_10001373C((uint64_t)v10);
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000238D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [self sharedApplication];
  id v9 = [v8 connectedScenes];

  sub_100013EC4(0, &qword_1000549B8);
  sub_100024A98((unint64_t *)&qword_1000549C0, &qword_1000549B8);
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100023BC8(v10);
  if (v11)
  {
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v12 = (void *)sub_100023EDC(v10, &qword_1000549B8);
    swift_bridgeObjectRelease();
    if (!v12) {
      goto LABEL_12;
    }
  }
  self;
  long long v13 = (void *)swift_dynamicCastObjCClass();
  if (v13 && [v13 delegate])
  {
    type metadata accessor for SceneDelegate();
    if (swift_dynamicCastClass())
    {
      sub_10000B024();
      Container.resolver.getter();

      swift_unknownObjectRelease();
      return swift_release();
    }
    swift_unknownObjectRelease();
  }

LABEL_12:
  static Logger.appIntents.getter();
  BOOL v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    unint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Couldn't find valid active scene to retrieve container from, defaulting to the initial one", v17, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_100016F78(a1, a2);
}

void sub_100023BC8(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_100013EC4(0, &qword_1000549B8);
    sub_100024A98((unint64_t *)&qword_1000549C0, &qword_1000549B8);
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v18;
    uint64_t v17 = v19;
    uint64_t v2 = v20;
    uint64_t v3 = v21;
    unint64_t v4 = v22;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v17 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  uint64_t v16 = v2;
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t v11 = v3;
    goto LABEL_29;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 < v8)
    {
      unint64_t v14 = *(void *)(v17 + 8 * v13);
      uint64_t v11 = v3 + 1;
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v8) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v11);
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 3;
      if (v3 + 3 >= v8) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v11);
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 4;
      if (v3 + 4 >= v8) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v11);
      if (v14)
      {
LABEL_28:
        uint64_t v9 = (v14 - 1) & v14;
        unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_29:
        id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
        if (v12)
        {
          do
          {
            if (!objc_msgSend(v12, "activationState", v16)) {
              break;
            }

            uint64_t v3 = v11;
            unint64_t v4 = v9;
            if ((v1 & 0x8000000000000000) == 0) {
              goto LABEL_8;
            }
LABEL_10:
            if (!__CocoaSet.Iterator.next()()) {
              break;
            }
            sub_100013EC4(0, &qword_1000549B8);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v12 = v23;
            swift_unknownObjectRelease();
            uint64_t v11 = v3;
            uint64_t v9 = v4;
          }
          while (v23);
        }
        goto LABEL_33;
      }
      uint64_t v11 = v3 + 5;
      if (v3 + 5 < v8)
      {
        unint64_t v14 = *(void *)(v17 + 8 * v11);
        if (!v14)
        {
          uint64_t v15 = v3 + 6;
          while (v8 != v15)
          {
            unint64_t v14 = *(void *)(v17 + 8 * v15++);
            if (v14)
            {
              uint64_t v11 = v15 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_33;
        }
        goto LABEL_28;
      }
    }
LABEL_33:
    sub_100015B24();
    return;
  }
  __break(1u);
}

uint64_t sub_100023EB4(uint64_t a1)
{
  return sub_100023EDC(a1, &qword_100054E70);
}

uint64_t sub_100023EC8(uint64_t a1)
{
  return sub_100023EDC(a1, (unint64_t *)&unk_100054A20);
}

uint64_t sub_100023EDC(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v5 = __CocoaSet.startIndex.getter();
    uint64_t v7 = v6;
    __CocoaSet.endIndex.getter();
    char v8 = static __CocoaSet.Index.== infix(_:_:)();
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      sub_100024B60(v5, v7, v4 != 0);
      return 0;
    }
LABEL_7:
    sub_100024774(v5, v7, v4 != 0, a1, a2);
    uint64_t v9 = v13;
    sub_100024B60(v5, v7, v4 != 0);
    return v9;
  }
  uint64_t result = sub_1000249E4(a1);
  if ((v12 & 1) == 0)
  {
    uint64_t v7 = v11;
    if (*(_DWORD *)(a1 + 36) == v11)
    {
      uint64_t v5 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100024004()
{
  return AppActivationURLHandler.init()();
}

uint64_t sub_10002403C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_1000136F8(a1, a1[3]);
  sub_10001378C(0, &qword_100054878);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v9)
  {
    sub_1000136F8(a1, a1[3]);
    sub_10001378C(0, &qword_1000549A8);
    uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
    if (v7[3])
    {
      id v5 = objc_allocWithZone((Class)type metadata accessor for GizmoSyncManager());
      id v6 = sub_10002AEC8((uint64_t)v8, (uint64_t)v7);
      uint64_t result = sub_1000137DC(&qword_1000549B0, (void (*)(uint64_t))type metadata accessor for GizmoSyncManager);
      *a2 = v6;
      a2[1] = result;
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

uint64_t sub_10002416C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for StubGizmoSyncManager();
  uint64_t v2 = swift_allocObject();
  uint64_t result = sub_1000137DC(&qword_1000549A0, (void (*)(uint64_t))type metadata accessor for StubGizmoSyncManager);
  *a1 = v2;
  a1[1] = result;
  return result;
}

void *sub_1000241DC(void *a1)
{
  sub_1000136F8(a1, a1[3]);
  sub_100014F1C(0, (unint64_t *)&unk_1000548E8, (uint64_t (*)(uint64_t))&type metadata accessor for AppEvent, sub_100016A50, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for EventManager);
  uint64_t result = (void *)dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v3 = (uint64_t)result;
  sub_1000136F8(a1, a1[3]);
  sub_10001378C(0, &qword_100054878);
  uint64_t result = (void *)dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v6[3])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_1000136F8(a1, a1[3]);
  type metadata accessor for StocksTodayAgent();
  uint64_t result = (void *)dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    unint64_t v4 = result;
    uint64_t v5 = *(void *)((char *)result + OBJC_IVAR____TtC9StocksApp16StocksTodayAgent_didWriteTodayDataSubject);
    swift_retain();

    type metadata accessor for WidgetContentInvalidationManager();
    swift_allocObject();
    return sub_100013F00(v3, v6, v5);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_100024354(uint64_t a1)
{
  type metadata accessor for MainActor();
  v3[2] = a1;
  return sub_100008558((uint64_t)sub_100024A6C, (uint64_t)v3, (uint64_t)"StocksApp/ManagerAssembly.swift", 31);
}

uint64_t sub_1000243C8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1000136F8(a1, a1[3]);
  sub_100013EC4(0, (unint64_t *)&unk_1000548D0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v5 = (void *)result;
  sub_1000136F8(a1, a1[3]);
  sub_10001201C(0, (unint64_t *)&qword_1000543D0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  id v6 = (void *)result;
  sub_1000136F8(a1, a1[3]);
  sub_100013EC4(0, &qword_1000548E0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v7 = (void *)result;
  sub_1000136F8(a1, a1[3]);
  sub_100013EC4(0, (unint64_t *)&unk_1000548C0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    char v8 = (void *)result;
    id v9 = objc_allocWithZone((Class)type metadata accessor for StocksTodayAgent());
    uint64_t result = (uint64_t)sub_10000C724(v5, v6, v7, v8);
    *a2 = result;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10002455C()
{
  uint64_t v0 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015028(0, &qword_100054DC0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v15 - v5;
  id v7 = (id)FCURLForTodayDropbox();
  if (v7)
  {
    char v8 = v7;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v6, v3, v0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v6, 0, 1, v0);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0);
    if (result != 1)
    {
      id v10 = objc_allocWithZone((Class)FCFileCoordinatedTodayDropbox);
      URL._bridgeToObjectiveC()(v11);
      uint64_t v13 = v12;
      id v14 = [v10 initWithFileURL:v12];

      (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
      return (uint64_t)v14;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, 1, 1, v0);
  }
  __break(1u);
  return result;
}

void sub_100024774(uint64_t a1, int a2, char a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v7 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_100013EC4(0, a5);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  __CocoaSet.Index.element.getter();
  sub_100013EC4(0, a5);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  a5 = v17;
  swift_unknownObjectRelease();
  Swift::Int v8 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v7 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
  char v11 = static NSObject.== infix(_:_:)();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v7 = (v7 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_23;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
      char v14 = static NSObject.== infix(_:_:)();
    }
    while ((v14 & 1) == 0);
  }

LABEL_17:
  uint64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v7);

  id v16 = v15;
}

uint64_t sub_1000249E4(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_100024A6C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1000243C8(*(void **)(v1 + 16), a1);
}

uint64_t sub_100024A88()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100024A98(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100013EC4(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100024ADC()
{
  return Watchlist.displayState.getter();
}

uint64_t sub_100024B00()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100024B38()
{
  return sub_100024B7C();
}

uint64_t sub_100024B40()
{
  return sub_100024D44();
}

uint64_t sub_100024B48(uint64_t a1)
{
  return sub_100024F0C(a1, v1);
}

uint64_t sub_100024B50(uint64_t a1)
{
  return sub_100024F18(a1, v1);
}

uint64_t sub_100024B58(uint64_t a1)
{
  return sub_100024F24(a1, v1);
}

uint64_t sub_100024B60(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100024B6C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100024B7C()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v1 + 16))(v3, Strong + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_logger, v0);
    swift_release();
    char v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Attempting widget update for today dropbox changes", v7, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v3, v0);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_10000C9A8(1);
    return swift_release();
  }
  return result;
}

uint64_t sub_100024D44()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v1 + 16))(v3, Strong + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_logger, v0);
    swift_release();
    char v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Attempting widget update for currency display changes", v7, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v3, v0);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_10000C9A8(0);
    return swift_release();
  }
  return result;
}

uint64_t sub_100024F0C(uint64_t a1, uint64_t a2)
{
  return sub_10000B1E8(a1, a2, "Attempting widget update for news attribution changes");
}

uint64_t sub_100024F18(uint64_t a1, uint64_t a2)
{
  return sub_10000B1E8(a1, a2, "Attempting widget update for news provider changes");
}

uint64_t sub_100024F24(uint64_t a1, uint64_t a2)
{
  return sub_10000B1E8(a1, a2, "Attempting widget update for news environment changes");
}

uint64_t sub_100024F30()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    *(unsigned char *)(result + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_hasCompletedColdLaunch) = 1;
    sub_10000B3B0();
    return swift_release();
  }
  return result;
}

uint64_t sub_100024F98()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9StocksApp32WidgetContentInvalidationManager_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_100025048()
{
  return type metadata accessor for WidgetContentInvalidationManager();
}

uint64_t sub_100025050()
{
  return Configurable.setting<A>(_:_:)();
}

uint64_t sub_100025080()
{
  swift_retain();
  asyncMain(block:)();

  return swift_release();
}

uint64_t sub_1000250CC()
{
  return sub_100024F30();
}

uint64_t sub_1000250D4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000AFCC();
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100025220()
{
  sub_100008DFC(v0, "Attempting widget update for watchlist changes", 0);
}

Swift::Void __swiftcall AppMonitor.sceneDidEnterBackground()()
{
}

void sub_100025250()
{
  swift_getObjectType();

  SceneStateMonitor.sceneWillResignActive()();
}

void sub_10002528C(uint64_t a1, uint64_t a2)
{
  swift_getObjectType();
  uint64_t v4 = a1;
  uint64_t v5 = a2;

  SceneStateMonitor.sceneWillResignActive(with:)(*(Swift::String *)&v4);
}

void sub_1000252E4(uint64_t a1, uint64_t a2)
{
  swift_getObjectType();
  uint64_t v4 = a1;
  uint64_t v5 = a2;

  SceneStateMonitor.sceneDidEnterBackground(with:)(*(Swift::String *)&v4);
}

void sub_10002533C()
{
  swift_getObjectType();

  SceneStateMonitor.sceneDidDisconnect()();
}

uint64_t sub_100025484(uint64_t a1)
{
  sub_1000254E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000254E0()
{
  if (!qword_100053F28)
  {
    sub_100025538();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100053F28);
    }
  }
}

unint64_t sub_100025538()
{
  unint64_t result = qword_100053F20;
  if (!qword_100053F20)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100053F20);
  }
  return result;
}

uint64_t sub_100025590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  sub_1000152E4(0, &qword_100054D08, (uint64_t (*)(uint64_t))sub_100007490, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)&v17 - v9;
  sub_100007490();
  __chkstk_darwin(v11);
  id v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_100015224(a1, (uint64_t)&qword_100054D08, (uint64_t)sub_100007490, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
    sub_100029898(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_100015224((uint64_t)v10, (uint64_t)&qword_100054D08, (uint64_t)sub_100007490, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
  }
  else
  {
    sub_100029A28(a1, (uint64_t)v13);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_100029C9C((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000257D8(uint64_t *a1, void (*a2)(void))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(v2 + *a1);
  if (v4)
  {
    uint64_t v5 = v4;
LABEL_5:
    swift_retain();
    return v5;
  }
  uint64_t v7 = v2;
  sub_100013824((uint64_t)v9);
  sub_1000136F8(v9, v9[3]);
  a2(0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v5 = result;
    sub_10001373C((uint64_t)v9);
    *(void *)(v7 + v3) = v5;
    swift_retain();
    swift_release();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_100025898()
{
  uint64_t v1 = qword_100054BE8;
  if (*(void *)(v0 + qword_100054BE8))
  {
    uint64_t v2 = *(void *)(v0 + qword_100054BE8);
LABEL_5:
    swift_unknownObjectRetain();
    return v2;
  }
  uint64_t v3 = v0;
  sub_100013824((uint64_t)v5);
  sub_1000136F8(v5, v5[3]);
  sub_100029490();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v2 = result;
    sub_10001373C((uint64_t)v5);
    *(void *)(v3 + v1) = v2;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_100025954@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_100054BF0;
  swift_beginAccess();
  sub_100013954(v3, (uint64_t)&v7, &qword_100054DA8, (unint64_t *)&unk_100054DB0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider);
  if (v8) {
    return sub_10001393C(&v7, a1);
  }
  sub_1000080E0((uint64_t)&v7, &qword_100054DA8, (unint64_t *)&unk_100054DB0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider);
  sub_100013824((uint64_t)&v7);
  sub_1000136F8(&v7, v8);
  sub_10001378C(0, (unint64_t *)&unk_100054DB0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (v6)
  {
    sub_10001393C(&v5, a1);
    sub_10001373C((uint64_t)&v7);
    sub_100016F78(a1, (uint64_t)&v7);
    swift_beginAccess();
    sub_100007FEC((uint64_t)&v7, v3, &qword_100054DA8, (unint64_t *)&unk_100054DB0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider);
    return swift_endAccess();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100025AC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(id *)(a1 + qword_100054C08);
  *(void *)(a1 + qword_100054C08) = a3;
  id v3 = a3;
}

uint64_t sub_100025B10()
{
  uint64_t v1 = v0 + qword_100054C40;
  uint64_t v2 = *(void **)(v0 + qword_100054C40);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_100054C40);
LABEL_5:
    id v6 = v2;
    return (uint64_t)v3;
  }
  sub_100013824((uint64_t)v9);
  sub_1000136F8(v9, v9[3]);
  sub_10001378C(0, &qword_100054DA0);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:name:)();
  if (v7)
  {
    sub_10001373C((uint64_t)v9);
    long long v5 = *(void **)v1;
    *(void *)uint64_t v1 = v7;
    *(void *)(v1 + 8) = v8;
    id v3 = v7;

    uint64_t v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_100025BF0()
{
  uint64_t v1 = qword_100054C60;
  if (*(void *)(v0 + qword_100054C60))
  {
    uint64_t v2 = *(void *)(v0 + qword_100054C60);
LABEL_5:
    swift_retain();
    return v2;
  }
  uint64_t v3 = v0;
  sub_100013824((uint64_t)v5);
  sub_1000136F8(v5, v5[3]);
  type metadata accessor for Tracker();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v2 = result;
    sub_10001373C((uint64_t)v5);
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_100025CAC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = type metadata accessor for URLHandlerRoute();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long long v7 = (char *)&v11[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013824((uint64_t)v11);
  sub_1000136F8(v11, v11[3]);
  sub_1000152E4(0, &qword_100054DC8, (uint64_t (*)(uint64_t))&type metadata accessor for AppURLContext, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for URLHandlerManager);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_10001373C((uint64_t)v11);
    id v9 = [a3 options];
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for URLHandlerRoute.sceneConnect(_:), v4);
    URLHandlerManager<A>.handle(url:options:route:)();
    swift_release();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100025E5C(uint64_t a1, UIApplicationShortcutItem a2)
{
  sub_100013824((uint64_t)v4);
  sub_1000136F8(v4, v4[3]);
  type metadata accessor for ShortcutItemHandlerManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_10001373C((uint64_t)v4);
    ShortcutItemHandlerManager.handle(shortcutItem:)(a2);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100025EE8(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10000E52C((uint64_t)v6);
  sub_1000136F8(v6, v6[3]);
  dispatch thunk of SceneStateManagerType.sceneDidDisconnect()();
  sub_10001373C((uint64_t)v6);
}

uint64_t sub_100025F6C(void *a1)
{
  sub_100013824((uint64_t)v4);
  sub_1000136F8(v4, v5);
  type metadata accessor for SessionManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_10001373C((uint64_t)v4);
    SessionManager.tracker.getter();
    Tracker.ifSession(block:)();
    swift_release();
    if ([a1 activationState] == (id)-1)
    {
      id v3 = [a1 session];
      [v3 setStateRestorationActivity:0];
    }
    sub_10000E52C((uint64_t)v4);
    sub_1000136F8(v4, v5);
    dispatch thunk of SceneStateManagerType.willResignActive()();
    swift_release();
    return sub_10001373C((uint64_t)v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1000260A4()
{
  uint64_t v0 = type metadata accessor for UUID();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()();
  uint64_t v4 = UUID.uuidString.getter();
  uint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7._countAndFlagsBits = v4;
  v7._object = v6;
  AccessTracker.enterGroup(groupName:)(v7);
  swift_bridgeObjectRelease();
  type metadata accessor for AppSessionResignEvent();
  sub_100013B98(&qword_100054E18, (void (*)(uint64_t))&type metadata accessor for AppSessionResignEvent);
  memset(v8, 0, sizeof(v8));
  AccessTracker.submit<A>(_:onlyIfTimed:userInfo:completion:)();
  sub_100015224((uint64_t)v8, (uint64_t)&qword_100053E90, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_100016028);
  AccessTracker.leaveGroup()();
}

void sub_10002624C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_100025F6C(v4);
}

uint64_t sub_1000262B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  Swift::String v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  Date.init()();
  SessionManager.end(endDate:completion:)();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_1000263DC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10002A2D8();
}

uint64_t sub_10002643C()
{
  swift_release();
  sub_1000080E0(v0 + qword_100054BC8, (unint64_t *)&qword_100053EA0, &qword_1000548B0, (uint64_t)&protocol descriptor for ResolverType);

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  sub_1000080E0(v0 + qword_100054BF0, &qword_100054DA8, (unint64_t *)&unk_100054DB0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider);
  swift_release();
  sub_1000080E0(v0 + qword_100054C00, &qword_100054E88, &qword_100054E90, (uint64_t)&protocol descriptor for WelcomeFlowProviderType);

  swift_bridgeObjectRelease();
  sub_100015224(v0 + qword_100054C28, (uint64_t)&qword_100054D08, (uint64_t)sub_100007490, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
  swift_release();

  sub_1000080E0(v0 + qword_100054C48, &qword_100054E08, &qword_100054E10, (uint64_t)&protocol descriptor for SceneStateManagerType);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100026654(uint64_t a1)
{
  swift_release();
  sub_1000080E0(a1 + qword_100054BC8, (unint64_t *)&qword_100053EA0, &qword_1000548B0, (uint64_t)&protocol descriptor for ResolverType);

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  sub_1000080E0(a1 + qword_100054BF0, &qword_100054DA8, (unint64_t *)&unk_100054DB0, (uint64_t)&protocol descriptor for StateRestorationActivityProvider);
  swift_release();
  sub_1000080E0(a1 + qword_100054C00, &qword_100054E88, &qword_100054E90, (uint64_t)&protocol descriptor for WelcomeFlowProviderType);

  swift_bridgeObjectRelease();
  sub_100015224(a1 + qword_100054C28, (uint64_t)&qword_100054D08, (uint64_t)sub_100007490, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
  swift_release();

  sub_1000080E0(a1 + qword_100054C48, &qword_100054E08, &qword_100054E10, (uint64_t)&protocol descriptor for SceneStateManagerType);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100026878()
{
  return type metadata accessor for SceneDelegate();
}

uint64_t sub_100026880(uint64_t a1, NSUserActivity a2)
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    id v4 = (void *)result;
    sub_100013824((uint64_t)v5);

    sub_1000136F8(v5, v5[3]);
    type metadata accessor for UserActivityHandlerManager();
    if (dispatch thunk of ResolverType.resolve<A>(_:)())
    {
      UserActivityHandlerManager.handle(userActivity:)(a2);
      swift_release();
    }
    return sub_10001373C((uint64_t)v5);
  }
  return result;
}

uint64_t sub_100026930(uint64_t a1, void *a2, void *a3)
{
  sub_1000139D8(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100043A40;
  id v6 = [a2 description];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = sub_100016260();
  *(void *)(v5 + 32) = v7;
  *(void *)(v5 + 40) = v9;
  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  uint64_t v10 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  sub_100013EC4(0, (unint64_t *)&unk_100054EF0);
  uint64_t result = static UIDevice.isSlow.getter();
  if ((result & 1) == 0)
  {
    return (uint64_t)[a3 _extendStateRestoration];
  }
  return result;
}

uint64_t sub_100026AA8(uint64_t a1, void *a2)
{
  sub_1000139D8(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100043A40;
  Swift::Double v4 = Double.millisecondsUntilCurrentMediaTime()();
  *(void *)(v3 + 56) = &type metadata for Double;
  *(void *)(v3 + 64) = &protocol witness table for Double;
  *(Swift::Double *)(v3 + 32) = v4;
  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  sub_100013EC4(0, (unint64_t *)&unk_100054EF0);
  uint64_t result = static UIDevice.isSlow.getter();
  if ((result & 1) == 0) {
    return (uint64_t)[a2 _completeStateRestoration];
  }
  return result;
}

uint64_t sub_100026BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = a3;
  uint64_t v5 = type metadata accessor for StocksActivity();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000152E4(0, &qword_100054EB8, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v24 - v10;
  uint64_t v25 = StocksActivity.identifier.getter();
  uint64_t v13 = v12;
  sub_10002A8A4(a2, (uint64_t)v11, (uint64_t)&qword_100054EB8, (uint64_t)&type metadata accessor for StocksActivity, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_1000152E4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1)
  {
    sub_100015224((uint64_t)v11, (uint64_t)&qword_100054EB8, (uint64_t)&type metadata accessor for StocksActivity, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
    goto LABEL_3;
  }
  uint64_t v17 = a1;
  uint64_t v18 = StocksActivity.identifier.getter();
  uint64_t v20 = v19;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v11, v5);
  if (v25 == v18 && v13 == v20)
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v17, v5);
    return ((uint64_t (*)(char *, uint64_t))v21)(v8, v5);
  }
  char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v17, v5);
  if (v23) {
    return ((uint64_t (*)(char *, uint64_t))v21)(v8, v5);
  }
LABEL_3:
  char v14 = StocksActivity.affectsNavigationStack.getter();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v14)
  {
    sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
    id v16 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    char v26 = 2;
    return StateMachine.fire(event:)();
  }
  return result;
}

void sub_100026F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  swift_retain();
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  uint64_t v6 = (void *)sub_100013AE0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_10002ACC8;
  *(void *)(v7 + 24) = v4;
  id v8 = (id)zalgoIfMain.getter();
  Bootstrapper.afterBootstrap(on:run:)();

  swift_release();
}

uint64_t sub_1000270B0(uint64_t a1, void *a2, void *a3)
{
  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  uint64_t v15 = 0;
  uint64_t v6 = self;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = &v15;
  v7[3] = a2;
  v7[4] = a3;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_10002AC84;
  *(void *)(v8 + 24) = v7;
  aBlock[4] = sub_10002ACA0;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027320;
  void aBlock[3] = &unk_10004F180;
  uint64_t v9 = _Block_copy(aBlock);
  id v10 = a2;
  id v11 = a3;
  swift_retain();
  swift_release();
  [v6 performWithoutAnimation:v9];
  _Block_release(v9);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a3)
  {
    __break(1u);
  }
  else
  {
    uint64_t v13 = v15;
    if (v15)
    {
      swift_release();
      return v13;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000272A0(uint64_t *a1)
{
  sub_1000257D8(&qword_100054BF8, (void (*)(void))&type metadata accessor for UserActivityHandlerManager);
  uint64_t v2 = UserActivityHandlerManager.handleAsync(userActivity:)();
  swift_release();
  *a1 = v2;

  return swift_release();
}

uint64_t sub_100027320(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100027348()
{
  uint64_t v0 = type metadata accessor for DispatchTime();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)v11 - v5;
  static DispatchTime.now()();
  + infix(_:_:)();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  uint64_t v8 = (void *)zalgo.getter();
  uint64_t v9 = Promise.timeout(after:on:message:)();

  v7(v6, v0);
  return v9;
}

uint64_t sub_100027490()
{
  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  uint64_t v1 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  StateMachine.fire(event:)();
  if (v0) {
    swift_errorRelease();
  }
  sub_100016028(0, &qword_100054EC0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for Promise);
  swift_allocObject();
  return Promise.init(value:)();
}

uint64_t sub_100027590(uint64_t a1)
{
  sub_1000152E4(0, (unint64_t *)&unk_100054EE0, (uint64_t (*)(uint64_t))&type metadata accessor for PromiseError, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - v3;
  uint64_t v16 = a1;
  swift_errorRetain();
  sub_10001378C(0, &qword_100053ED8);
  uint64_t v5 = type metadata accessor for PromiseError();
  int v6 = swift_dynamicCast();
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  if (!v6)
  {
    v7(v4, 1, 1, v5);
    sub_100015224((uint64_t)v4, (uint64_t)&unk_100054EE0, (uint64_t)&type metadata accessor for PromiseError, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
LABEL_6:
    static os_log_type_t.error.getter();
    sub_1000139D8(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_100043A40;
    uint64_t v16 = a1;
    swift_errorRetain();
    uint64_t v11 = String.init<A>(describing:)();
    uint64_t v13 = v12;
    *(void *)(v10 + 56) = &type metadata for String;
    *(void *)(v10 + 64) = sub_100016260();
    *(void *)(v10 + 32) = v11;
    *(void *)(v10 + 40) = v13;
    sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
    uint64_t v9 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v8 = *(void *)(v5 - 8);
  v7(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t))(v8 + 88))(v4, v5) != enum case for PromiseError.timedOut(_:))
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v5);
    goto LABEL_6;
  }
  (*(void (**)(char *, uint64_t))(v8 + 96))(v4, v5);
  swift_bridgeObjectRelease();
  static os_log_type_t.error.getter();
  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  uint64_t v9 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
LABEL_7:

  LOBYTE(v16) = 2;
  return StateMachine.fire(event:)();
}

id sub_100027924(uint64_t a1)
{
  return *(id *)(a1 + qword_100054C08);
}

uint64_t sub_100027934(void *a1, uint64_t a2)
{
  id v62 = a1;
  sub_100007490();
  uint64_t v60 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v59 = (uint64_t)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  double v64 = (char *)v52 - v6;
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_100013EC4(0, (unint64_t *)&unk_100054A20);
    sub_100013A90(&qword_100054DF0, (unint64_t *)&unk_100054A20);
    uint64_t result = Set.Iterator.init(_cocoa:)();
    a2 = v67;
    uint64_t v54 = v68;
    uint64_t v12 = v69;
    uint64_t v13 = v70;
    unint64_t v14 = v71;
  }
  else
  {
    uint64_t v15 = -1 << *(unsigned char *)(a2 + 32);
    uint64_t v16 = *(void *)(a2 + 56);
    uint64_t v54 = a2 + 56;
    uint64_t v12 = ~v15;
    uint64_t v17 = -v15;
    if (v17 < 64) {
      uint64_t v18 = ~(-1 << v17);
    }
    else {
      uint64_t v18 = -1;
    }
    unint64_t v14 = v18 & v16;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v13 = 0;
  }
  v52[1] = v12;
  v52[3] = a2 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v53 = (unint64_t)(v12 + 64) >> 6;
  double v56 = (uint64_t (**)(char *, uint64_t))(v8 + 8);
  double v57 = (void (**)(char *, char *, uint64_t))(v8 + 16);
  long long v55 = xmmword_100043A40;
  v52[2] = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v61 = a2;
  uint64_t v58 = v7;
  while (a2 < 0)
  {
    uint64_t v37 = __CocoaSet.Iterator.next()();
    if (!v37) {
      return sub_100015B24();
    }
    uint64_t v65 = v37;
    sub_100013EC4(0, (unint64_t *)&unk_100054A20);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v38 = v66;
    swift_unknownObjectRelease();
    uint64_t v36 = v13;
    uint64_t v34 = v14;
    if (!v38) {
      return sub_100015B24();
    }
LABEL_31:
    id v42 = [v38 URL];
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    id v43 = [v62 session];
    id v44 = [v43 persistentIdentifier];

    uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v47 = v46;

    sub_1000139D8(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = v55;
    *(void *)(v48 + 56) = &type metadata for String;
    *(void *)(v48 + 64) = sub_100016260();
    *(void *)(v48 + 32) = v45;
    *(void *)(v48 + 40) = v47;
    sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
    swift_bridgeObjectRetain();
    double v49 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    (*v57)(v64, v10, v7);
    id v50 = [v38 options];
    id v51 = [v50 sourceApplication];

    if (v51)
    {
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v21 = v20;
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v21 = 0;
    }
    unint64_t v22 = v64;
    char v23 = (uint64_t *)&v64[*(int *)(v60 + 48)];
    *char v23 = v19;
    v23[1] = v21;
    uint64_t v24 = v63;
    uint64_t v25 = (uint64_t *)&v63[qword_100054C68];
    swift_beginAccess();
    uint64_t v26 = (uint64_t)v22;
    uint64_t v27 = v59;
    sub_100029A28(v26, v59);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v65 = *v25;
    uint64_t *v25 = 0x8000000000000000;
    sub_100029C9C(v27, v45, v47, isUniquelyReferenced_nonNull_native);
    uint64_t *v25 = v65;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v24;
    *(void *)(v29 + 24) = v38;
    id v30 = v24;
    id v31 = v38;
    uint64_t v32 = (void *)sub_100013AE0();
    double v33 = (void *)zalgoIfMain.getter();
    Bootstrapper.afterBootstrap(on:run:)();

    swift_release();
    uint64_t v7 = v58;
    uint64_t result = (*v56)(v10, v58);
    uint64_t v13 = v36;
    unint64_t v14 = v34;
    a2 = v61;
  }
  if (v14)
  {
    uint64_t v34 = (v14 - 1) & v14;
    unint64_t v35 = __clz(__rbit64(v14)) | (v13 << 6);
    uint64_t v36 = v13;
LABEL_30:
    id v38 = *(id *)(*(void *)(a2 + 48) + 8 * v35);
    if (!v38) {
      return sub_100015B24();
    }
    goto LABEL_31;
  }
  int64_t v39 = v13 + 1;
  if (!__OFADD__(v13, 1))
  {
    if (v39 >= v53) {
      return sub_100015B24();
    }
    unint64_t v40 = *(void *)(v54 + 8 * v39);
    uint64_t v36 = v13 + 1;
    if (!v40)
    {
      uint64_t v36 = v13 + 2;
      if (v13 + 2 >= v53) {
        return sub_100015B24();
      }
      unint64_t v40 = *(void *)(v54 + 8 * v36);
      if (!v40)
      {
        uint64_t v36 = v13 + 3;
        if (v13 + 3 >= v53) {
          return sub_100015B24();
        }
        unint64_t v40 = *(void *)(v54 + 8 * v36);
        if (!v40)
        {
          uint64_t v36 = v13 + 4;
          if (v13 + 4 >= v53) {
            return sub_100015B24();
          }
          unint64_t v40 = *(void *)(v54 + 8 * v36);
          if (!v40)
          {
            uint64_t v41 = v13 + 5;
            while (v53 != v41)
            {
              unint64_t v40 = *(void *)(v54 + 8 * v41++);
              if (v40)
              {
                uint64_t v36 = v41 - 1;
                goto LABEL_29;
              }
            }
            return sub_100015B24();
          }
        }
      }
    }
LABEL_29:
    uint64_t v34 = (v40 - 1) & v40;
    unint64_t v35 = __clz(__rbit64(v40)) + (v36 << 6);
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002802C(uint64_t a1, void *a2)
{
  uint64_t v3 = type metadata accessor for URLHandlerRoute();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v15[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013824((uint64_t)v15);
  sub_1000136F8(v15, v15[3]);
  sub_1000152E4(0, &qword_100054DC8, (uint64_t (*)(uint64_t))&type metadata accessor for AppURLContext, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for URLHandlerManager);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_10001373C((uint64_t)v15);
    id v12 = [a2 URL];
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    id v13 = [a2 options];
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for URLHandlerRoute.openURL(_:), v3);
    URLHandlerManager<A>.handle(url:options:route:)();
    swift_release();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100028298(void *a1, uint64_t a2, void *a3)
{
  sub_100013EC4(0, (unint64_t *)&unk_100054A20);
  sub_100013A90(&qword_100054DF0, (unint64_t *)&unk_100054A20);
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  id v7 = a1;
  sub_100027934(v6, v5);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100028354(uint64_t a1, void (*a2)(Swift::Bool), uint64_t a3, UIApplicationShortcutItem a4)
{
  sub_100013824((uint64_t)v8);
  sub_1000136F8(v8, v8[3]);
  type metadata accessor for ShortcutItemHandlerManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_10001373C((uint64_t)v8);
    Swift::Bool v7 = ShortcutItemHandlerManager.handle(shortcutItem:)(a4);
    a2(v7);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100028404(void *a1, int a2, void *a3, void *a4, void *aBlock)
{
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = (void *)swift_allocObject();
  objc_super v10[2] = a1;
  void v10[3] = sub_10002A264;
  void v10[4] = v9;
  v10[5] = a4;
  id v11 = a4;
  id v12 = a1;
  id v13 = v11;
  id v14 = a3;
  swift_retain();
  uint64_t v15 = (void *)sub_100013AE0();
  id v16 = (id)zalgoIfMain.getter();
  Bootstrapper.afterBootstrap(on:run:)();

  swift_release();
  swift_release();
}

void sub_10002852C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  sub_1000139D8(0, &qword_100053EC8, &qword_100053ED0, (uint64_t)&protocol descriptor for CVarArg, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100043A40;
  *(void *)(v8 + 56) = &type metadata for String;
  *(void *)(v8 + 64) = sub_100016260();
  *(void *)(v8 + 32) = v5;
  *(void *)(v8 + 40) = v7;
  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  id v9 = a3;
  id v10 = a1;
  swift_bridgeObjectRetain();
  id v11 = (id)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_100028678(void *a1, uint64_t a2, void *a3)
{
  id v43 = a3;
  uint64_t v44 = a2;
  uint64_t v4 = type metadata accessor for URLHandlerRoute();
  uint64_t v41 = *(void *)(v4 - 8);
  uint64_t v42 = v4;
  __chkstk_darwin(v4);
  unint64_t v40 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000152E4(0, &qword_100054D08, (uint64_t (*)(uint64_t))sub_100007490, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v40 - v7;
  sub_1000152E4(0, &qword_100054DC0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v40 - v10;
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  id v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v40 - v17;
  id v19 = [a1 activityType];
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;

  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v20 && v23 == v22)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_5;
  }
  char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v24)
  {
LABEL_5:
    id v25 = [a1 webpageURL];
    if (v25)
    {
      uint64_t v26 = v25;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
      v27(v11, v16, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
      {
        v27(v18, v11, v12);
        id v28 = [v43 session];
        id v29 = [v28 persistentIdentifier];

        uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v32 = v31;

        sub_100007490();
        uint64_t v34 = v33;
        unint64_t v35 = &v8[*(int *)(v33 + 48)];
        (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v8, v18, v12);
        *(void *)unint64_t v35 = 0;
        *((void *)v35 + 1) = 0;
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v8, 0, 1, v34);
        swift_beginAccess();
        sub_100025590((uint64_t)v8, v30, v32);
        swift_endAccess();
        sub_100013824((uint64_t)v45);
        sub_1000136F8(v45, v45[3]);
        sub_1000152E4(0, &qword_100054DC8, (uint64_t (*)(uint64_t))&type metadata accessor for AppURLContext, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for URLHandlerManager);
        uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
        if (result)
        {
          sub_10001373C((uint64_t)v45);
          id v38 = v40;
          uint64_t v37 = v41;
          uint64_t v39 = v42;
          (*(void (**)(char *, void, uint64_t))(v41 + 104))(v40, enum case for URLHandlerRoute.userActivity(_:), v42);
          URLHandlerManager<A>.handle(url:options:route:)();
          swift_release();
          (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v39);
          return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
        }
        else
        {
          __break(1u);
        }
        return result;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    }
    return sub_100015224((uint64_t)v11, (uint64_t)&qword_100054DC0, (uint64_t)&type metadata accessor for URL, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_1000152E4);
  }
  sub_1000257D8(&qword_100054BF8, (void (*)(void))&type metadata accessor for UserActivityHandlerManager);
  UserActivityHandlerManager.handle(userActivity:)((NSUserActivity)a1);

  return swift_release();
}

void sub_100028CA8(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a4;
  v7[3] = a1;
  v7[4] = a3;
  id v8 = a3;
  id v9 = a4;
  id v10 = a1;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  uint64_t v14 = (void *)sub_100013AE0();
  id v15 = (id)zalgoIfMain.getter();
  Bootstrapper.afterBootstrap(on:run:)();

  swift_release();
}

id sub_100028D94(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  unsigned int v6 = [(id)sub_100025898() isStateRestorationAllowed];
  swift_unknownObjectRelease();
  if (v6)
  {
    sub_100025954((uint64_t)v9);
    sub_1000136F8(v9, v9[3]);
    uint64_t v7 = (void *)dispatch thunk of StateRestorationActivityProvider.stateRestorationActivity.getter();
    sub_10001373C((uint64_t)v9);
  }
  else
  {

    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t sub_100028E68(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100028E98(a1, a2, a3, (void (*)(unsigned char *, uint64_t, uint64_t))&dispatch thunk of MenuManagerType.handleMenuCommand(sender:));
}

uint64_t sub_100028E80(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100028E98(a1, a2, a3, (void (*)(unsigned char *, uint64_t, uint64_t))&dispatch thunk of MenuManagerType.handleAlternateMenuCommand(sender:));
}

uint64_t sub_100028E98(void *a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *, uint64_t, uint64_t))
{
  swift_unknownObjectRetain();
  id v6 = a1;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  uint64_t v7 = (void *)sub_100025B10();
  uint64_t v9 = v8;
  uint64_t ObjectType = swift_getObjectType();
  a4(v12, ObjectType, v9);

  return sub_10001373C((uint64_t)v12);
}

void sub_100028F2C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  id v6 = (void *)sub_100025B10();
  swift_getObjectType();
  sub_100007C9C(&qword_100054C58, &qword_100053EB0);
  uint64_t v7 = sub_100025BF0();
  v8[3] = type metadata accessor for Tracker();
  void v8[4] = sub_100013B98(&qword_100053EB8, (void (*)(uint64_t))&type metadata accessor for Tracker);
  v8[0] = v7;
  dispatch thunk of MenuManagerType.validate(_:with:tracker:)();

  swift_unknownObjectRelease();
  sub_10001373C((uint64_t)v8);
}

uint64_t sub_100029048(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  id v6 = (void *)sub_100025B10();
  sub_10002A8A4(a2, (uint64_t)v25, (uint64_t)&qword_100053E90, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_100016028);
  uint64_t v7 = v26;
  uint64_t v23 = (objc_class *)ObjectType;
  if (v26)
  {
    uint64_t v8 = sub_1000136F8(v25, v26);
    uint64_t v9 = *(void *)(v7 - 8);
    __chkstk_darwin(v8);
    id v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = _bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_10001373C((uint64_t)v25);
  }
  else
  {
    uint64_t v12 = 0;
  }
  unsigned __int8 v13 = [v6 canPerformAction:a1 withSender:v12];

  swift_unknownObjectRelease();
  if (v13) {
    return 1;
  }
  sub_10002A8A4(a2, (uint64_t)v25, (uint64_t)&qword_100053E90, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_100016028);
  uint64_t v15 = v26;
  if (v26)
  {
    id v16 = sub_1000136F8(v25, v26);
    uint64_t v17 = *(void *)(v15 - 8);
    __chkstk_darwin(v16);
    id v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v17 + 16))(v19);
    uint64_t v20 = _bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v15);
    sub_10001373C((uint64_t)v25);
  }
  else
  {
    uint64_t v20 = 0;
  }
  v24.receiver = v2;
  v24.super_class = v23;
  [super canPerformAction:a1 withSender:v20];
  swift_unknownObjectRelease();
  return (uint64_t)v14;
}

uint64_t sub_100029354(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = a1;
  }
  char v8 = sub_100029048(a3, (uint64_t)v10);

  sub_100015224((uint64_t)v10, (uint64_t)&qword_100053E90, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_100016028);
  return v8 & 1;
}

uint64_t sub_100029418()
{
  sub_100013824((uint64_t)v2);
  sub_1000136F8(v2, v2[3]);
  type metadata accessor for DebugNavigationController();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    uint64_t v1 = result;
    sub_10001373C((uint64_t)v2);
    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100029490()
{
  unint64_t result = qword_1000548A8;
  if (!qword_1000548A8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1000548A8);
  }
  return result;
}

uint64_t sub_1000294EC()
{
  return sub_100028678(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1000294F8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  sub_100007490();
  uint64_t v42 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_10002A160();
  int v43 = a2;
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    uint64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_100029A28(v30, (uint64_t)v7);
    }
    else
    {
      sub_10002A1C8(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    id v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *id v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_100029A28((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_100029898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_10002F080(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v22 = *v4;
    *id v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100029E98();
      uint64_t v11 = v22;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    sub_100007490();
    uint64_t v14 = v13;
    uint64_t v21 = *(void *)(v13 - 8);
    sub_100029A28(v12 + *(void *)(v21 + 72) * v8, a3);
    sub_100029A8C(v8, v11);
    *id v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
    uint64_t v16 = a3;
    uint64_t v17 = 0;
    uint64_t v18 = v14;
  }
  else
  {
    sub_100007490();
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
    uint64_t v18 = v19;
    uint64_t v16 = a3;
    uint64_t v17 = 1;
  }

  return v15(v16, v17, 1, v18);
}

uint64_t sub_100029A28(uint64_t a1, uint64_t a2)
{
  sub_100007490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100029A8C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        sub_100007490();
        uint64_t v16 = *(void *)(*(void *)(v15 - 8) + 72);
        int64_t v17 = v16 * v3;
        uint64_t result = v14 + v16 * v3;
        int64_t v18 = v16 * v6;
        unint64_t v19 = v14 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v17 == v18) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << result) - 1;
  }
  *uint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_100029C9C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_10002F080(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100029E98();
      goto LABEL_7;
    }
    sub_1000294F8(v15, a4 & 1);
    unint64_t v23 = sub_10002F080(a2, a3);
    if ((v16 & 1) == (v24 & 1))
    {
      unint64_t v12 = v23;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    sub_100007490();
    uint64_t v21 = v19 + *(void *)(*(void *)(v20 - 8) + 72) * v12;
    return sub_10002A0FC(a1, v21);
  }
LABEL_13:
  sub_100029E00(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100029E00(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  sub_100007490();
  uint64_t result = sub_100029A28(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_100029E98()
{
  uint64_t v1 = v0;
  sub_100007490();
  uint64_t v30 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A160();
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v28 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v29 = v5 + 64;
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    int64_t v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      int64_t v11 = v24 + 1;
      if (v24 + 1 >= v15) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v29 + 8 * v11);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v14 = (v25 - 1) & v25;
    unint64_t v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    unint64_t v22 = *(void *)(v30 + 72) * v17;
    sub_10002A1C8(*(void *)(v5 + 56) + v22, (uint64_t)v4);
    unint64_t v23 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v23 = v20;
    v23[1] = v21;
    sub_100029A28((uint64_t)v4, *(void *)(v7 + 56) + v22);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v28;
    goto LABEL_28;
  }
  unint64_t v25 = *(void *)(v29 + 8 * v26);
  if (v25)
  {
    int64_t v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v11 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v29 + 8 * v11);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10002A0FC(uint64_t a1, uint64_t a2)
{
  sub_100007490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_10002A160()
{
  if (!qword_100054DD0)
  {
    sub_100007490();
    unint64_t v0 = type metadata accessor for _DictionaryStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100054DD0);
    }
  }
}

uint64_t sub_10002A1C8(uint64_t a1, uint64_t a2)
{
  sub_100007490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002A22C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002A264(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_10002A27C()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002A2C4()
{
  v1.super.Class isa = *(Class *)(v0 + 40);
  return sub_100028354(*(void *)(v0 + 16), *(void (**)(Swift::Bool))(v0 + 24), *(void *)(v0 + 32), v1);
}

uint64_t sub_10002A2D0()
{
  return sub_10002802C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10002A2D8()
{
  sub_10000E52C((uint64_t)v1);
  sub_1000136F8(v1, v2);
  dispatch thunk of SceneStateManagerType.didEnterBackground()();
  sub_10001373C((uint64_t)v1);
  sub_100013824((uint64_t)v1);
  sub_1000136F8(v1, v2);
  type metadata accessor for SessionManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (result)
  {
    sub_10001373C((uint64_t)v1);
    backgroundTask(withName:timeout:work:)();
    [(id)sub_100025898() sceneDidEnterBackground];
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10002A3E4(uint64_t a1, uint64_t a2)
{
  return sub_1000262B4(a1, a2);
}

uint64_t sub_10002A3EC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A424()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002A45C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002A494()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002A4D4(uint64_t a1, uint64_t a2)
{
  sub_1000152E4(0, &qword_100054D08, (uint64_t (*)(uint64_t))sub_100007490, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002A568()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A5A8()
{
  v1.super.Class isa = *(Class *)(v0 + 24);
  return sub_100026880(*(void *)(v0 + 16), v1);
}

uint64_t sub_10002A5B4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A5F4()
{
  v1.super.Class isa = *(Class *)(v0 + 24);
  return sub_100025E5C(*(void *)(v0 + 16), v1);
}

uint64_t sub_10002A5FC()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10002A6E4()
{
  uint64_t v1 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_100025CAC(v3, v0 + v2, v4);
}

void sub_10002A774()
{
  if (!qword_100054EC8)
  {
    sub_10002A7F0();
    sub_100016E24();
    unint64_t v0 = type metadata accessor for StateMachineTransition();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100054EC8);
    }
  }
}

unint64_t sub_10002A7F0()
{
  unint64_t result = qword_100054ED0;
  if (!qword_100054ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100054ED0);
  }
  return result;
}

uint64_t sub_10002A844(uint64_t a1)
{
  return sub_100026930(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10002A84C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A884(uint64_t a1)
{
  return sub_100026AA8(a1, *(void **)(v1 + 24));
}

uint64_t sub_10002A8A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = a6(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a2, a1, v8);
  return a2;
}

uint64_t sub_10002A918()
{
  sub_1000152E4(0, &qword_100054EB8, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = type metadata accessor for StocksActivity();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = v7 + 8;

  return _swift_deallocObject(v0, v8, v2 | 7);
}

uint64_t sub_10002AA80(uint64_t a1, uint64_t a2)
{
  sub_1000152E4(0, &qword_100054EB8, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002AB14(uint64_t a1)
{
  sub_1000152E4(0, &qword_100054EB8, (uint64_t (*)(uint64_t))&type metadata accessor for StocksActivity, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_100026BE4(a1, v1 + v5, v6);
}

void sub_10002ABE0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10002ABE8(uint64_t a1)
{
  return sub_1000270B0(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10002AC04()
{
  return sub_100027348();
}

uint64_t sub_10002AC20()
{
  return sub_100027490();
}

uint64_t sub_10002AC3C(uint64_t a1)
{
  return sub_100027590(a1);
}

uint64_t sub_10002AC44()
{
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002AC84()
{
  return sub_1000272A0(*(uint64_t **)(v0 + 16));
}

uint64_t sub_10002AC90()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002ACA0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10002ACC8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10002ACF0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_10002AD64(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000317FC(0, &qword_100055120, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, void *, uint64_t, void *))&type metadata accessor for _DictionaryStorage);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1000319E0(v6, (uint64_t)&v15, (uint64_t (*)(void))sub_100031730);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10002F080(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    int64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *int64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000230E0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_10002AEC8(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = type metadata accessor for PromiseDeduperFlags();
  __chkstk_darwin(v6);
  uint64_t v7 = OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_sharedUserDefaults;
  sub_100013EC4(0, &qword_1000550C0);
  uint64_t v8 = v2;
  *(void *)&v2[v7] = static NSUserDefaults.stocksShared.getter();
  uint64_t v9 = OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_syncDeduper;
  unint64_t v22 = _swiftEmptyArrayStorage;
  sub_100016360(&qword_1000550C8, 255, (void (*)(uint64_t))&type metadata accessor for PromiseDeduperFlags);
  sub_100031674(0, &qword_1000550D0, (uint64_t (*)(uint64_t))&type metadata accessor for PromiseDeduperFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_10002EE94();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_1000317FC(0, (unint64_t *)&unk_1000550E0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(void, void *, uint64_t, void *))&type metadata accessor for PromiseDeduper);
  swift_allocObject();
  *(void *)&v8[v9] = PromiseDeduper.init(options:)();
  v8[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_pendingWatchNotification] = 0;
  sub_100016F78(a1, (uint64_t)&v8[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager]);
  sub_100016F78(a2, (uint64_t)&v8[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_stockMetadataManager]);

  v21.receiver = v8;
  v21.super_class = ObjectType;
  id v10 = [super init];
  int64_t v11 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100053850 != -1) {
    swift_once();
  }
  CFNotificationCenterAddObserver(v11, v10, (CFNotificationCallback)sub_10002EC84, (CFStringRef)qword_100056948, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  uint64_t v12 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100053858 != -1) {
    swift_once();
  }
  CFNotificationCenterAddObserver(v12, v10, (CFNotificationCallback)sub_10002ECE0, (CFStringRef)qword_100056950, 0, CFNotificationSuspensionBehaviorCoalesce);

  BOOL v13 = self;
  if ([v13 isSupported])
  {
    if (qword_100053868 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_10002EF1C(v14, (uint64_t)qword_100056958);
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      long long v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "activating watch connectivity session", v17, 2u);
      swift_slowDealloc();
    }

    id v18 = [v13 defaultSession];
    [v18 setDelegate:v10];

    id v19 = [v13 defaultSession];
    [v19 activateSession];
  }
  sub_10001373C(a2);
  sub_10001373C(a1);
  return v10;
}

id sub_10002B318()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100053850 != -1) {
    swift_once();
  }
  CFNotificationCenterRemoveObserver(v2, v0, (CFNotificationName)qword_100056948, 0);

  uint64_t v3 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100053858 != -1) {
    swift_once();
  }
  CFNotificationCenterRemoveObserver(v3, v0, (CFNotificationName)qword_100056950, 0);

  v5.receiver = v0;
  v5.super_class = ObjectType;
  return [super dealloc];
}

uint64_t sub_10002B594(char a1, void *a2)
{
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10002EF1C(v4, (uint64_t)qword_100056958);
  objc_super v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "will sync forced=%{BOOL}d", v7, 8u);
    swift_slowDealloc();
  }

  __chkstk_darwin(v8);
  firstly<A>(closure:)();
  *(void *)(swift_allocObject() + 16) = a2;
  id v9 = a2;
  id v10 = (void *)zalgo.getter();
  Promise.then<A>(on:closure:)();
  swift_release();
  swift_release();

  *(void *)(swift_allocObject() + 16) = v9;
  id v11 = v9;
  uint64_t v12 = (void *)zalgo.getter();
  sub_100031674(0, &qword_1000550F8, (uint64_t (*)(uint64_t))&type metadata accessor for Stock, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  Promise.then<A>(on:closure:)();
  swift_release();
  swift_release();

  sub_100013EC4(0, (unint64_t *)&unk_100055100);
  BOOL v13 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v11;
  *(unsigned char *)(v14 + 24) = a1 & 1;
  id v15 = v11;
  Promise.then<A>(on:closure:)();
  swift_release();

  swift_release();
  os_log_type_t v16 = (void *)zalgo.getter();
  uint64_t v17 = Promise.error(on:closure:)();
  swift_release();

  return v17;
}

uint64_t sub_10002B8DC(uint64_t a1)
{
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10002EF1C(v2, (uint64_t)qword_100056958);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    objc_super v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "prewarming watchlist manager", v5, 2u);
    swift_slowDealloc();
  }

  sub_1000136F8((void *)(a1 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager), *(void *)(a1 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager + 24));
  return dispatch thunk of WatchlistManagerType.prewarm()();
}

uint64_t sub_10002B9F0()
{
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10002EF1C(v0, (uint64_t)qword_100056958);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "adopting changes from watch", v3, 2u);
    swift_slowDealloc();
  }

  return sub_10002BAE4();
}

uint64_t sub_10002BAE4()
{
  uint64_t v0 = type metadata accessor for CachePolicy();
  uint64_t v118 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  os_log_type_t v2 = (char *)&v104 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for Watchlist();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  os_log_type_t v6 = (char *)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013EC4(0, &qword_1000550C0);
  uint64_t v7 = (void *)static NSUserDefaults.stocksShared.getter();
  NSString v8 = String._bridgeToObjectiveC()();
  [v7 doubleForKey:v8];
  double v10 = v9;

  id v11 = self;
  id v12 = [v11 standardUserDefaults];
  NSString v13 = String._bridgeToObjectiveC()();
  [v12 doubleForKey:v13];
  double v15 = v14;

  if (v15 == 0.0)
  {
    if (qword_100053868 != -1) {
LABEL_85:
    }
      swift_once();
    uint64_t v16 = type metadata accessor for Logger();
    sub_10002EF1C(v16, (uint64_t)qword_100056958);
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 134218240;
      *(double *)uint64_t v127 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v19 + 12) = 2048;
      *(double *)uint64_t v127 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "not checking for changes from watch since this device has never written to it (localLastModified=%f), sharedLastModified=%f)", (uint8_t *)v19, 0x16u);
      swift_slowDealloc();
    }
    goto LABEL_11;
  }
  uint64_t v117 = v3;
  id v108 = v2;
  uint64_t v109 = v0;
  v116 = v6;
  uint64_t v107 = v4;
  unint64_t v20 = (unint64_t)&type metadata for ();
  if (v10 == 0.0)
  {
    if (qword_100053868 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_10002EF1C(v21, (uint64_t)qword_100056958);
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 134218240;
      *(double *)uint64_t v127 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v23 + 12) = 2048;
      *(double *)uint64_t v127 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v17, v22, "not checking for changes from watch since shared defaults have never been modified (localLastModified=%f), sharedLastModified=%f)", (uint8_t *)v23, 0x16u);
      swift_slowDealloc();
    }
LABEL_11:

    sub_100031A48(0, &qword_100054EC0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for Promise);
    swift_allocObject();
    return Promise.init(value:)();
  }
  if (qword_100053868 != -1) {
    goto LABEL_87;
  }
  while (2)
  {
    uint64_t v26 = type metadata accessor for Logger();
    uint64_t v119 = sub_10002EF1C(v26, (uint64_t)qword_100056958);
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v30 = v122;
    if (v29)
    {
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 134218240;
      *(double *)uint64_t v127 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v31 + 12) = 2048;
      *(double *)uint64_t v127 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "checking for changes from watch (localLastModified=%f), sharedLastModified=%f)", (uint8_t *)v31, 0x16u);
      swift_slowDealloc();
    }

    unint64_t v129 = (unint64_t)&_swiftEmptyArrayStorage;
    unint64_t v32 = *(void **)&v30[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_sharedUserDefaults];
    NSString v33 = String._bridgeToObjectiveC()();
    id v34 = [v32 objectForKey:v33];

    if (v34)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v125 = 0u;
      long long v126 = 0u;
    }
    sub_100018A98((uint64_t)&v125, (uint64_t)v127);
    if (v128)
    {
      sub_100031858(0, &qword_100055140, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
      if (swift_dynamicCast())
      {
        uint64_t v110 = v124;
        goto LABEL_24;
      }
    }
    else
    {
      sub_100015284((uint64_t)v127, (uint64_t)&qword_100053E90, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_100031A48);
    }
    sub_100031858(0, &qword_100055148, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_100043A40;
    unint64_t v36 = sub_10002AD64((uint64_t)&_swiftEmptyArrayStorage);
    uint64_t v110 = v35;
    *(void *)(v35 + 32) = v36;
LABEL_24:
    id v37 = [v11 standardUserDefaults:v104, v105];
    NSString v38 = String._bridgeToObjectiveC()();
    id v39 = [v37 objectForKey:v38];

    if (v39)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v125 = 0u;
      long long v126 = 0u;
    }
    sub_100018A98((uint64_t)&v125, (uint64_t)v127);
    if (v128)
    {
      sub_100031858(0, &qword_100055140, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
      if (swift_dynamicCast())
      {
        uint64_t v40 = v124;
        goto LABEL_32;
      }
    }
    else
    {
      sub_100015284((uint64_t)v127, (uint64_t)&qword_100053E90, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_100031A48);
    }
    sub_100031858(0, &qword_100055148, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_100043A40;
    *(void *)(v40 + 32) = sub_10002AD64((uint64_t)&_swiftEmptyArrayStorage);
LABEL_32:
    id v11 = sub_100030A5C(v110);
    uint64_t v41 = sub_100030A5C(v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.default.getter();
    BOOL v44 = os_log_type_enabled(v42, v43);
    id v115 = v11;
    long long v120 = v41;
    if (v44)
    {
      uint64_t v45 = swift_slowAlloc();
      v127[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v46 = Array.description.getter();
      unint64_t v48 = v47;
      swift_bridgeObjectRelease();
      *(void *)&long long v125 = sub_10000AA68(v46, v48, v127);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 12) = 2080;
      swift_bridgeObjectRetain();
      unint64_t v20 = (unint64_t)&type metadata for ();
      uint64_t v49 = Array.description.getter();
      unint64_t v51 = v50;
      swift_bridgeObjectRelease();
      uint64_t v52 = v49;
      uint64_t v41 = v120;
      *(void *)&long long v125 = sub_10000AA68(v52, v51, v127);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      id v11 = v115;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "shared watchlist has symbols=%s, and this device last saved symbols=%s", (uint8_t *)v45, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      if (v15 >= v10) {
        break;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      if (v15 >= v10) {
        break;
      }
    }
    int64_t v53 = Logger.logObject.getter();
    os_log_type_t v54 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v53, v54))
    {
      long long v55 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v55 = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "shared watchlist has been modified since this device last wrote to it", v55, 2u);
      swift_slowDealloc();
    }

    double v56 = (void *)*((void *)v41 + 2);
    if (v56)
    {
      uint64_t v123 = v11[2];
      uint64_t v113 = &v30[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager];
      uint64_t v121 = v41 + 32;
      uint64_t v112 = (void (**)(char *, uint64_t))(v107 + 8);
      swift_bridgeObjectRetain();
      unint64_t v57 = v20;
      unint64_t v20 = 0;
      uint64_t v104 = v11 + 9;
      *(void *)&long long v58 = 136315138;
      long long v106 = v58;
      uint64_t v105 = (char *)&type metadata for Any + 8;
      unint64_t v111 = v57 + 8;
      uint64_t v114 = v56;
      while (1)
      {
        if (v20 >= *((void *)v41 + 2))
        {
          __break(1u);
          goto LABEL_85;
        }
        id v62 = (uint64_t *)&v121[16 * v20];
        uint64_t v63 = *v62;
        unint64_t v64 = v62[1];
        if (!v123) {
          goto LABEL_53;
        }
        BOOL v65 = v11[4] == v63 && v11[5] == v64;
        if (!v65 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          if (v123 == 1) {
            goto LABEL_53;
          }
          if ((v11[6] != v63 || v11[7] != v64) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
            break;
          }
        }
LABEL_44:
        if ((void *)++v20 == v56)
        {
          swift_bridgeObjectRelease();
          goto LABEL_69;
        }
      }
      if (v123 != 2)
      {
        uint64_t v69 = v104;
        uint64_t v70 = 2;
        while (1)
        {
          uint64_t v71 = v70 + 1;
          if (__OFADD__(v70, 1)) {
            break;
          }
          BOOL v72 = *(v69 - 1) == v63 && *v69 == v64;
          if (v72 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            goto LABEL_44;
          }
          v69 += 2;
          ++v70;
          if (v71 == v123) {
            goto LABEL_53;
          }
        }
        __break(1u);
LABEL_87:
        swift_once();
        continue;
      }
LABEL_53:
      swift_bridgeObjectRetain_n();
      double v66 = Logger.logObject.getter();
      os_log_type_t v67 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v66, v67))
      {
        uint64_t v68 = swift_slowAlloc();
        v127[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v68 = v106;
        swift_bridgeObjectRetain();
        *(void *)(v68 + 4) = sub_10000AA68(v63, v64, v127);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v66, v67, "found deleted symbol: %s", (uint8_t *)v68, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v59 = v113;
      sub_1000136F8(v113, *((void *)v113 + 3));
      sub_1000136F8(v59, *((void *)v59 + 3));
      uint64_t v60 = v116;
      dispatch thunk of WatchlistManagerType.defaultAllSymbolsWatchlist.getter();
      dispatch thunk of WatchlistManagerType.removeSymbol(_:from:)();
      swift_bridgeObjectRelease();
      (*v112)(v60, v117);
      uint64_t v61 = (void *)zalgo.getter();
      Promise.then<A>(on:closure:)();
      swift_release();

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      uint64_t v30 = v122;
      id v11 = v115;
      uint64_t v41 = v120;
      double v56 = v114;
      goto LABEL_44;
    }
    break;
  }
LABEL_69:
  swift_bridgeObjectRetain();
  long double v73 = v30;
  uint64_t v74 = sub_100030418(v110, v41);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  uint64_t v75 = Logger.logObject.getter();
  os_log_type_t v76 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v75, v76))
  {
    double v77 = (uint8_t *)swift_slowAlloc();
    v127[0] = swift_slowAlloc();
    *(_DWORD *)double v77 = 136315138;
    uint64_t v123 = (uint64_t)(v77 + 4);
    swift_bridgeObjectRetain();
    uint64_t v78 = Array.description.getter();
    unint64_t v80 = v79;
    swift_bridgeObjectRelease();
    *(void *)&long long v125 = sub_10000AA68(v78, v80, v127);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v75, v76, "adding symbols %s", v77, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v81 = v118;
  long double v82 = v108;
  sub_1000136F8(&v73[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_stockMetadataManager], *(void *)&v73[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_stockMetadataManager + 24]);
  uint64_t v83 = v109;
  (*(void (**)(char *, void, uint64_t))(v81 + 104))(v82, enum case for CachePolicy.preferCache(_:), v109);
  StockMetadataManagerType.fetchStocks(for:cachePolicy:)();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v82, v83);
  uint64_t v84 = swift_allocObject();
  *(void *)(v84 + 16) = v73;
  *(void *)(v84 + 24) = v74;
  double v85 = v73;
  long double v86 = (void *)zalgo.getter();
  Promise.then<A>(on:closure:)();
  swift_release();
  swift_release();

  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  if (*((void *)v120 + 2) == v115[2] && (sub_10002EFB8(v120, v115) & 1) == 0)
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    id v87 = Logger.logObject.getter();
    os_log_type_t v88 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v87, v88))
    {
      uint64_t v89 = swift_slowAlloc();
      uint64_t v123 = swift_slowAlloc();
      v127[0] = v123;
      *(_DWORD *)uint64_t v89 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v90 = Array.description.getter();
      unint64_t v92 = v91;
      swift_bridgeObjectRelease();
      *(void *)&long long v125 = sub_10000AA68(v90, v92, v127);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v89 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v93 = Array.description.getter();
      unint64_t v95 = v94;
      swift_bridgeObjectRelease();
      *(void *)&long long v125 = sub_10000AA68(v93, v95, v127);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v87, v88, "reordering symbols - watch:%s phone:%s", (uint8_t *)v89, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    uint64_t v96 = v117;
    double v97 = &v85[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager];
    sub_1000136F8(&v85[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager], *(void *)&v85[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager + 24]);
    sub_1000136F8(v97, *((void *)v97 + 3));
    double v98 = v116;
    dispatch thunk of WatchlistManagerType.defaultAllSymbolsWatchlist.getter();
    dispatch thunk of WatchlistManagerType.reorder(symbols:in:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v107 + 8))(v98, v96);
    double v99 = (void *)zalgo.getter();
    Promise.then<A>(on:closure:)();
    swift_release();

    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  double v100 = (void *)zalgo.getter();
  when<A>(on:_:)();
  swift_bridgeObjectRelease();

  double v101 = (void *)zalgo.getter();
  Promise.then<A>(on:closure:)();
  swift_release();

  uint64_t v102 = swift_allocObject();
  *(double *)(v102 + 16) = v10;
  *(void *)(v102 + 24) = v110;
  v103 = (void *)zalgo.getter();
  uint64_t v24 = Promise.always(on:closure:)();
  swift_release();
  swift_release();

  return v24;
}

uint64_t sub_10002D040(uint64_t a1, uint64_t a2)
{
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10002EF1C(v3, (uint64_t)qword_100056958);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "will fetch stocks from \"My Symbols\" watchlist", v6, 2u);
    swift_slowDealloc();
  }

  sub_1000136F8((void *)(a2 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager), *(void *)(a2 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager + 24));
  return dispatch thunk of WatchlistManagerType.fetchStocksFromDefaultWatchlist()();
}

uint64_t sub_10002D154(uint64_t *a1, uint64_t a2, char a3)
{
  uint64_t v4 = *a1;
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_10002EF1C(v5, (uint64_t)qword_100056958);
  swift_bridgeObjectRetain();
  os_log_type_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    NSString v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)NSString v8 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "did fetch stocks from \"My Symbols\" watchlist with %ld stocks", v8, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  if (sub_10002D4DC(v4, a3 & 1))
  {
    id v9 = [objc_allocWithZone((Class)NPSManager) init];
    type metadata accessor for AppGroup();
    static AppGroup.stocks.getter();
    AppGroup.identifier.getter();
    swift_release();
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    if (qword_100053848 != -1) {
      swift_once();
    }
    uint64_t v11 = swift_bridgeObjectRetain();
    sub_100030BD4(v11);
    swift_bridgeObjectRelease();
    Class isa = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v13 = String._bridgeToObjectiveC()();
    static AppGroup.stocks.getter();
    AppGroup.identifier.getter();
    swift_release();
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v9 synchronizeUserDefaultsDomain:v10 keys:isa container:v13 appGroupContainer:v14];

    sub_10002DBC8();
  }
  else
  {
    double v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "watchlist contains no changes for watch", v17, 2u);
      swift_slowDealloc();
    }
  }
  sub_100031A48(0, &qword_100054EC0, (uint64_t)&type metadata for () + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for Promise);
  swift_allocObject();
  return Promise.init(value:)();
}

uint64_t sub_10002D4DC(uint64_t a1, int a2)
{
  HIDWORD(v41) = a2;
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v8 = v2;
  id v9 = sub_1000301E0(a1);

  NSString v10 = *(void **)&v8[OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_sharedUserDefaults];
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [v10 objectForKey:v11];

  if (v12)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  sub_100018A98((uint64_t)&v43, (uint64_t)v45);
  if (v46)
  {
    sub_100031858(0, &qword_100055140, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    if (swift_dynamicCast())
    {
      NSString v13 = v42;
      goto LABEL_9;
    }
  }
  else
  {
    sub_100015284((uint64_t)v45, (uint64_t)&qword_100053E90, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_100031A48);
  }
  NSString v13 = _swiftEmptyArrayStorage;
LABEL_9:
  NSString v14 = sub_100030A5C((uint64_t)v13);
  swift_bridgeObjectRelease();
  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = [v10 objectForKey:v15];

  if (v16)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  sub_100018A98((uint64_t)&v43, (uint64_t)v45);
  if (v46)
  {
    sub_100031858(0, &qword_100055140, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    if (swift_dynamicCast())
    {
      uint64_t v17 = v42;
      goto LABEL_17;
    }
  }
  else
  {
    sub_100015284((uint64_t)v45, (uint64_t)&qword_100053E90, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_100031A48);
  }
  uint64_t v17 = _swiftEmptyArrayStorage;
LABEL_17:
  os_log_type_t v18 = sub_100030A5C((uint64_t)v17);
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_100030A5C((uint64_t)v9);
  char v20 = sub_10002EFB8(v19, v14);
  swift_bridgeObjectRelease();
  if (v20)
  {
    char v21 = sub_10002EFB8(v19, v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 1) != 0 && (v41 & 0x100000000) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v23 = type metadata accessor for Logger();
  sub_10002EF1C(v23, (uint64_t)qword_100056958);
  swift_bridgeObjectRetain();
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 134217984;
    v45[0] = *(void *)(a1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "saving %ld stocks to group user defaults", v26, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  Date.init()();
  Date.timeIntervalSince1970.getter();
  double v28 = v27;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  NSString v29 = String._bridgeToObjectiveC()();
  [v10 setDouble:v29 forKey:v28];

  sub_1000317FC(0, &qword_100055138, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, void *, uint64_t, void *))&type metadata accessor for Dictionary);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  NSString v31 = String._bridgeToObjectiveC()();
  [v10 setObject:isa forKey:v31];

  NSString v32 = String._bridgeToObjectiveC()();
  [v10 setDouble:v32 forKey:v28];

  Class v33 = Array._bridgeToObjectiveC()().super.isa;
  NSString v34 = String._bridgeToObjectiveC()();
  [v10 setObject:v33 forKey:v34];

  uint64_t v35 = self;
  id v36 = [v35 standardUserDefaults];
  NSString v37 = String._bridgeToObjectiveC()();
  [v36 setDouble:v37 forKey:v28];

  id v38 = [v35 standardUserDefaults];
  Class v39 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v40 = String._bridgeToObjectiveC()();
  [v38 setObject:v39 forKey:v40];

  return 1;
}

void sub_10002DBC8()
{
  uint64_t v1 = v0;
  id v16 = [self defaultSession];
  if ([v16 isPaired] && objc_msgSend(v16, "isWatchAppInstalled"))
  {
    if ([v16 activationState] == (id)2)
    {
      if (qword_100053868 != -1) {
        swift_once();
      }
      uint64_t v2 = type metadata accessor for Logger();
      sub_10002EF1C(v2, (uint64_t)qword_100056958);
      uint64_t v3 = Logger.logObject.getter();
      os_log_type_t v4 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v3, v4))
      {
        uint64_t v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "issuing watch notification", v5, 2u);
        swift_slowDealloc();
      }

      sub_100031674(0, &qword_100055110, (uint64_t (*)(uint64_t))sub_100031730, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100043A40;
      *(void *)(inited + 32) = 0x6D617473656D6974;
      *(void *)(inited + 40) = 0xE900000000000070;
      *(void *)(inited + 72) = type metadata accessor for Date();
      sub_100015400((uint64_t *)(inited + 48));
      Date.init()();
      sub_10002AD64(inited);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();

      *(unsigned char *)(v1 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_pendingWatchNotification) = 0;
    }
    else
    {
      if (qword_100053868 != -1) {
        swift_once();
      }
      uint64_t v12 = type metadata accessor for Logger();
      sub_10002EF1C(v12, (uint64_t)qword_100056958);
      NSString v13 = Logger.logObject.getter();
      os_log_type_t v14 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v14))
      {
        NSString v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)NSString v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "deferring watch notification because session is not active", v15, 2u);
        swift_slowDealloc();
      }

      *(unsigned char *)(v1 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_pendingWatchNotification) = 1;
    }
  }
  else
  {
    if (qword_100053868 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_10002EF1C(v8, (uint64_t)qword_100056958);
    id v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      NSString v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)NSString v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "skipping watch notification because no watch is paired or the watch app isn't installed", v11, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10002DFAC()
{
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10002EF1C(v0, (uint64_t)qword_100056958);
  swift_errorRetain();
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136315138;
    swift_getErrorValue();
    uint64_t v3 = Error.localizedDescription.getter();
    sub_10000AA68(v3, v4, &v6);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "failed to fetch latest watchlist with error: %s", v2, 0xCu);
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

uint64_t sub_10002E1A0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = type metadata accessor for Watchlist();
  uint64_t v7 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  NSString v11 = (void *)(a2 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager);
  uint64_t v12 = v11[3];
  uint64_t v16 = v11[4];
  sub_1000136F8(v11, v12);
  swift_bridgeObjectRetain();
  sub_100030698(a3, v10);
  uint64_t v17 = v3;
  swift_bridgeObjectRelease();
  sub_1000136F8(v11, v11[3]);
  dispatch thunk of WatchlistManagerType.defaultAllSymbolsWatchlist.getter();
  WatchlistManagerType.addStocks(_:watchlist:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v18);
  NSString v13 = (void *)zalgo.getter();
  uint64_t v14 = Promise.then<A>(on:closure:)();
  swift_release();

  return v14;
}

uint64_t sub_10002E364()
{
  return Promise.init(value:)();
}

uint64_t sub_10002E3CC()
{
  return sub_10002E364();
}

void sub_10002E3E4(double a1)
{
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10002EF1C(v2, (uint64_t)qword_100056958);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "finished watch sync", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = self;
  id v7 = [v6 standardUserDefaults];
  NSString v8 = String._bridgeToObjectiveC()();
  [v7 setDouble:v8 forKey:a1];

  id v9 = [v6 standardUserDefaults];
  sub_1000317FC(0, &qword_100055138, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, void *, uint64_t, void *))&type metadata accessor for Dictionary);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  NSString v11 = String._bridgeToObjectiveC()();
  [v9 setObject:isa forKey:v11];
}

void sub_10002E5F4()
{
  qword_100056940 = (uint64_t)&off_10004E990;
}

uint64_t type metadata accessor for GizmoSyncManager()
{
  return self;
}

uint64_t sub_10002E660()
{
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10002EF1C(v0, (uint64_t)qword_100056958);
  os_log_type_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "triggering sync in response to watchlist observer callback", v3, 2u);
    swift_slowDealloc();
  }

  __chkstk_darwin(v4);
  PromiseDeduper.promise(key:createBlock:)();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002E7B8(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType();

  return WatchlistManagerObserver.watchlistManagerWatchlistsDidChange(_:)(a1, ObjectType);
}

void sub_10002E924(uint64_t a1)
{
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_pendingWatchNotification) == 1)
  {
    if (qword_100053868 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_10002EF1C(v1, (uint64_t)qword_100056958);
    os_log_type_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "notifying watch in response to session activation because we have a pending notification", v4, 2u);
      swift_slowDealloc();
    }

    sub_10002DBC8();
  }
}

uint64_t sub_10002EC30()
{
  sub_100013EC4(0, &qword_1000550F0);
  uint64_t result = NSString.init(stringLiteral:)();
  qword_100056948 = result;
  return result;
}

void sub_10002EC84(uint64_t a1, void *a2)
{
}

uint64_t sub_10002EC8C()
{
  sub_100013EC4(0, &qword_1000550F0);
  uint64_t result = NSString.init(stringLiteral:)();
  qword_100056950 = result;
  return result;
}

void sub_10002ECE0(uint64_t a1, void *a2)
{
}

void sub_10002ECE8()
{
  id v0 = [self mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    qword_100054F60 = OS_os_log.init(subsystem:category:)();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10002EDB0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10002EF54(v0, qword_100056958);
  sub_10002EF1C(v0, (uint64_t)qword_100056958);
  if (qword_100053860 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100054F60;
  return Logger.init(_:)();
}

uint64_t sub_10002EE3C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100016360(&qword_1000550B8, a2, (void (*)(uint64_t))type metadata accessor for GizmoSyncManager);
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10002EE94()
{
  unint64_t result = qword_1000550D8;
  if (!qword_1000550D8)
  {
    sub_100031674(255, &qword_1000550D0, (uint64_t (*)(uint64_t))&type metadata accessor for PromiseDeduperFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000550D8);
  }
  return result;
}

uint64_t sub_10002EF1C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10002EF54(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10002EFB8(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    id v9 = a1 + 7;
    for (unint64_t i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

unint64_t sub_10002F080(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10002F0F8(a1, a2, v4);
}

unint64_t sub_10002F0F8(uint64_t a1, uint64_t a2, uint64_t a3)
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
        NSString v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10002F1DC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002F23C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002F1FC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002F3C8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10002F21C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002F590(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10002F23C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100031A48(0, &qword_1000546F8, (uint64_t)&type metadata for String, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  NSString v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002F3C8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100031858(0, &qword_100055148, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    _OWORD v10[2] = v8;
    void v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_1000317FC(0, &qword_100055138, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, void *, uint64_t, void *))&type metadata accessor for Dictionary);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002F590(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100031674(0, (unint64_t *)&qword_100055158, (uint64_t (*)(uint64_t))sub_100031980, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    _OWORD v10[2] = v8;
    void v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    sub_100031980();
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002F75C(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10002FBE8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10002F90C()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_10003179C();
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                id v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *id v1 = v4;
  return result;
}

Swift::Int sub_10002FBE8(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_10002F90C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10002FD84();
      goto LABEL_22;
    }
    sub_10002FF34();
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
    unint64_t v15 = (void *)(v14 + 16 * a3);
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
        int64_t v18 = (void *)(v14 + 16 * a3);
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_10002FD84()
{
  id v1 = v0;
  sub_10003179C();
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
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
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10002FF34()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_10003179C();
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *id v1 = v4;
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
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    id v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_1000301E0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10002F1FC(0, v1, 0);
    uint64_t v3 = *(void *)(type metadata accessor for Stock() - 8);
    uint64_t v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = *(void *)(v3 + 72);
    sub_100031674(0, &qword_100055110, (uint64_t (*)(uint64_t))sub_100031730, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    do
    {
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100043A60;
      *(void *)(inited + 32) = 0x6C6F626D7973;
      *(void *)(inited + 40) = 0xE600000000000000;
      *(void *)(inited + 48) = Stock.symbol.getter();
      *(void *)(inited + 56) = v7;
      *(void *)(inited + 72) = &type metadata for String;
      *(void *)(inited + 80) = 0x4E796E61706D6F63;
      *(void *)(inited + 88) = 0xEB00000000656D61;
      *(void *)(inited + 96) = Stock.name.getter();
      *(void *)(inited + 104) = v8;
      *(void *)(inited + 120) = &type metadata for String;
      *(void *)(inited + 128) = 0x65676E6168637865;
      *(void *)(inited + 136) = 0xE800000000000000;
      uint64_t v9 = Stock.exchange.getter();
      *(void *)(inited + 168) = &type metadata for String;
      *(void *)(inited + 144) = v9;
      *(void *)(inited + 152) = v10;
      unint64_t v11 = sub_10002AD64(inited);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_10002F1FC(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1) {
        sub_10002F1FC(v12 > 1, v13 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v13 + 1;
      _swiftEmptyArrayStorage[v13 + 4] = v11;
      v4 += v5;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100030418(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return (uint64_t)&_swiftEmptyArrayStorage;
  }
  uint64_t v6 = a1;
  uint64_t v7 = a1 + 32;
  swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  NSString v32 = (char *)&_swiftEmptyArrayStorage;
  unint64_t v26 = a2 + 7;
  BOOL v27 = a2;
  uint64_t v28 = v7;
  while (1)
  {
    uint64_t v9 = *(void *)(v7 + 8 * v8);
    if (!*(void *)(v9 + 16)) {
      goto LABEL_4;
    }
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_10002F080(0x6C6F626D7973, 0xE600000000000000);
    if (v11)
    {
      sub_10000AB3C(*(void *)(v9 + 56) + 32 * v10, (uint64_t)v31);
      if (swift_dynamicCast()) {
        break;
      }
    }
    swift_bridgeObjectRelease();
LABEL_4:
    if (++v8 == v4)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v32;
    }
  }
  uint64_t v12 = a2[2];
  if (!v12) {
    goto LABEL_15;
  }
  if (a2[4] == v29 && a2[5] == v30 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_13:
    uint64_t v7 = v28;
    goto LABEL_4;
  }
  if (v12 == 1)
  {
LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:
    uint64_t v7 = v28;
    unint64_t v14 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v14 = sub_100022AC8(0, *((void *)v14 + 2) + 1, 1, v14);
    }
    unint64_t v15 = v14;
    unint64_t v16 = *((void *)v14 + 2);
    NSString v32 = v15;
    unint64_t v17 = *((void *)v15 + 3);
    if (v16 >= v17 >> 1) {
      NSString v32 = sub_100022AC8((char *)(v17 > 1), v16 + 1, 1, v32);
    }
    int64_t v18 = v32;
    *((void *)v32 + 2) = v16 + 1;
    BOOL v19 = &v18[16 * v16];
    *((void *)v19 + 4) = v29;
    *((void *)v19 + 5) = v30;
    a2 = v27;
    goto LABEL_4;
  }
  uint64_t v24 = v6;
  uint64_t v25 = v3;
  uint64_t v20 = v26;
  uint64_t v21 = 1;
  while (1)
  {
    uint64_t v22 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    BOOL v23 = *(v20 - 1) == v29 && *v20 == v30;
    if (v23 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v6 = v24;
      uint64_t v3 = v25;
      a2 = v27;
      goto LABEL_13;
    }
    v20 += 2;
    ++v21;
    if (v22 == v12)
    {
      swift_bridgeObjectRelease();
      uint64_t v6 = v24;
      uint64_t v3 = v25;
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

void *sub_100030698(uint64_t a1, uint64_t a2)
{
  sub_100031674(0, &qword_100055150, (uint64_t (*)(uint64_t))&type metadata accessor for Stock, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v29 - v6;
  uint64_t v8 = type metadata accessor for Stock();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  NSString v34 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  NSString v31 = (char *)v29 - v12;
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13)
  {
    unint64_t v14 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v29[1] = v2;
    v29[2] = v9 + 16;
    NSString v32 = (void (**)(char *, char *, uint64_t))(v9 + 32);
    Class v33 = (unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
    swift_bridgeObjectRetain();
    v29[0] = a1;
    unint64_t v15 = (uint64_t *)(a1 + 40);
    uint64_t v35 = &_swiftEmptyArrayStorage;
    uint64_t v30 = v9;
    while (1)
    {
      if (*(void *)(a2 + 16))
      {
        uint64_t v16 = *(v15 - 1);
        uint64_t v17 = *v15;
        swift_bridgeObjectRetain();
        unint64_t v18 = sub_10002F080(v16, v17);
        if (v19)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v7, *(void *)(a2 + 56) + *(void *)(v9 + 72) * v18, v8);
          uint64_t v20 = 0;
        }
        else
        {
          uint64_t v20 = 1;
        }
        (*v14)(v7, v20, 1, v8);
        swift_bridgeObjectRelease();
        if ((*v33)(v7, 1, v8) != 1)
        {
          uint64_t v21 = v31;
          uint64_t v22 = *v32;
          (*v32)(v31, v7, v8);
          v22(v34, v21, v8);
          if (swift_isUniquelyReferenced_nonNull_native()) {
            unint64_t v23 = (unint64_t)v35;
          }
          else {
            unint64_t v23 = sub_100022D2C(0, v35[2] + 1, 1, (unint64_t)v35);
          }
          unint64_t v25 = *(void *)(v23 + 16);
          unint64_t v24 = *(void *)(v23 + 24);
          if (v25 >= v24 >> 1) {
            unint64_t v23 = sub_100022D2C(v24 > 1, v25 + 1, 1, v23);
          }
          *(void *)(v23 + 16) = v25 + 1;
          unint64_t v26 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
          uint64_t v35 = (void *)v23;
          unint64_t v27 = v23 + v26 + *(void *)(v30 + 72) * v25;
          uint64_t v9 = v30;
          v22((char *)v27, v34, v8);
          goto LABEL_5;
        }
      }
      else
      {
        (*v14)(v7, 1, 1, v8);
      }
      sub_100015284((uint64_t)v7, (uint64_t)&qword_100055150, (uint64_t)&type metadata accessor for Stock, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_100031674);
LABEL_5:
      v15 += 2;
      if (!--v13)
      {
        swift_bridgeObjectRelease();
        return v35;
      }
    }
  }
  return &_swiftEmptyArrayStorage;
}

char *sub_100030A5C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = 0;
  uint64_t v4 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    uint64_t v6 = *(void *)(a1 + 8 * v3 + 32);
    uint64_t v7 = *(void *)(v6 + 16);
    swift_bridgeObjectRetain();
    if (!v7
      || (unint64_t v8 = sub_10002F080(0x6C6F626D7973, 0xE600000000000000), (v9 & 1) == 0)
      || (sub_10000AB3C(*(void *)(v6 + 56) + 32 * v8, (uint64_t)&v15), (swift_dynamicCast() & 1) == 0))
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
    }
    swift_bridgeObjectRelease();
    uint64_t v10 = v17;
    if (v17)
    {
      uint64_t v11 = v16;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v4 = sub_100022AC8(0, *((void *)v4 + 2) + 1, 1, v4);
      }
      unint64_t v13 = *((void *)v4 + 2);
      unint64_t v12 = *((void *)v4 + 3);
      if (v13 >= v12 >> 1) {
        uint64_t v4 = sub_100022AC8((char *)(v12 > 1), v13 + 1, 1, v4);
      }
      *((void *)v4 + 2) = v13 + 1;
      uint64_t v5 = &v4[16 * v13];
      *((void *)v5 + 4) = v11;
      *((void *)v5 + 5) = v10;
    }
    ++v3;
  }
  while (v1 != v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100030BD4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10002F75C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_100030C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (a2)
  {
    swift_errorRetain();
    if (qword_100053868 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_10002EF1C(v5, (uint64_t)qword_100056958);
    swift_errorRetain();
    swift_errorRetain();
    Swift::Int v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      swift_getErrorValue();
      uint64_t v9 = Error.localizedDescription.getter();
      sub_10000AA68(v9, v10, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "session activation did fail with error: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      if (a1 != 2) {
        return;
      }
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();

      if (a1 != 2) {
        return;
      }
    }
    goto LABEL_12;
  }
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_10002EF1C(v11, (uint64_t)qword_100056958);
  unint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v14 = 134217984;
    uint64_t v16 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "session activation did complete with state: %ld", v14, 0xCu);
    swift_slowDealloc();
  }

  if (a1 == 2)
  {
LABEL_12:
    *(void *)(swift_allocObject() + 16) = v3;
    id v15 = v3;
    asyncMain(block:)();
    swift_release();
  }
}

uint64_t sub_100030F9C(uint64_t a1)
{
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10002EF1C(v2, (uint64_t)qword_100056958);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(void *)&v16[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v6 = Dictionary.description.getter();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    sub_10000AA68(v6, v8, (uint64_t *)v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "session did receive message: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    if (!*(void *)(a1 + 16)) {
      goto LABEL_11;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!*(void *)(a1 + 16))
    {
LABEL_11:
      memset(v16, 0, sizeof(v16));
      return sub_100015284((uint64_t)v16, (uint64_t)&qword_100053E90, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_100031A48);
    }
  }
  unint64_t v9 = sub_10002F080(0xD000000000000021, 0x80000001000426B0);
  if ((v10 & 1) == 0) {
    goto LABEL_11;
  }
  sub_10000AB3C(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v16);
  sub_100015284((uint64_t)v16, (uint64_t)&qword_100053E90, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata accessor for Optional, (uint64_t (*)(void))sub_100031A48);
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "forcing sync in response to message", v13, 2u);
    swift_slowDealloc();
  }

  *(void *)&v16[0] = 1668184435;
  *((void *)&v16[0] + 1) = 0xE400000000000000;
  __chkstk_darwin(v14);
  PromiseDeduper.promise(key:createBlock:)();
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_100031350(void *a1)
{
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10002EF1C(v2, (uint64_t)qword_100056958);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "did receive watch-wake notification", v5, 2u);
    swift_slowDealloc();
  }

  if (a1)
  {
    id v6 = a1;
    sub_10002DBC8();
  }
}

void sub_100031470(void *a1)
{
  if (qword_100053868 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10002EF1C(v2, (uint64_t)qword_100056958);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "did receive preferences-changed notification", v5, 2u);
    swift_slowDealloc();
  }

  if (a1)
  {
    id v6 = a1;
    __chkstk_darwin(v6);
    PromiseDeduper.promise(key:createBlock:)();
    swift_release();

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000315DC()
{
  return sub_10002B594(*(unsigned char *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1000315E8()
{
  return sub_10002B8DC(*(void *)(v0 + 16));
}

uint64_t sub_100031604()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003163C()
{
  return sub_10002B9F0();
}

uint64_t sub_100031658(uint64_t a1)
{
  return sub_10002D040(a1, *(void *)(v1 + 16));
}

void sub_100031674(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1000316D8()
{
  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_100031710(uint64_t *a1)
{
  return sub_10002D154(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

void sub_100031730()
{
  if (!qword_100055118)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100055118);
    }
  }
}

void sub_10003179C()
{
  if (!qword_100055128)
  {
    unint64_t v0 = type metadata accessor for _SetStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055128);
    }
  }
}

void sub_1000317FC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, void *, uint64_t, void *))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, &type metadata for String, a3, &protocol witness table for String);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_100031858(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_1000317FC(255, &qword_100055138, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, void *, uint64_t, void *))&type metadata accessor for Dictionary);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1000318E0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100031920(uint64_t *a1)
{
  return sub_10002E1A0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10003193C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100031974()
{
  sub_10002E3E4(*(double *)(v0 + 16));
}

unint64_t sub_100031980()
{
  unint64_t result = qword_100055160;
  if (!qword_100055160)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100055160);
  }
  return result;
}

void sub_1000319D8()
{
  sub_10002E924(*(void *)(v0 + 16));
}

uint64_t sub_1000319E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_100031A48(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_100031AA0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  v1026 = a2;
  sub_10003C4A4();
  uint64_t v1025 = v3;
  uint64_t v1024 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v5 = (char *)&v993 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003C538();
  uint64_t v1019 = v6;
  uint64_t v1018 = *(void *)(v6 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v1020 = (char *)&v993 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003CA70(0, &qword_100055230, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int, (uint64_t (*)(void, uint64_t, uint64_t))&type metadata accessor for Item.RangeControlType);
  uint64_t v1023 = v8;
  uint64_t v1022 = *(void *)(v8 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v1039 = (_DWORD *)((char *)&v993 - v9);
  sub_10003C5CC();
  uint64_t v1016 = v10;
  uint64_t v1015 = *(void *)(v10 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v1017 = (char *)&v993 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1040 = type metadata accessor for SettingsBundle();
  uint64_t v1014 = *(void *)(v1040 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v1013 = (char *)&v993 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003CA70(0, &qword_100055248, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double, (uint64_t (*)(void, uint64_t, uint64_t))&type metadata accessor for Item.RangeControlType);
  v1089 = v13;
  v1090 = (uint64_t *)*((void *)v13 - 1);
  ((void (*)(void))__chkstk_darwin)();
  v1012 = (_DWORD *)((char *)&v993 - v14);
  sub_10003C660();
  unint64_t v1038 = v15;
  uint64_t v1049 = *(void *)(v15 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v1037 = (uint64_t *)((char *)&v993 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10003CE94(0, &qword_100055260, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for Item.ResetBehavior);
  uint64_t v1027 = v17;
  uint64_t v1010 = *(void *)(v17 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v1011 = (char *)&v993 - v18;
  sub_10003C6F4();
  unint64_t v1009 = v19;
  v1008 = *(uint64_t **)(v19 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v1028 = (char *)&v993 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003C788();
  uint64_t v1006 = v21;
  unint64_t v1005 = *(void *)(v21 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v1007 = (char *)&v993 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003C81C();
  uint64_t v1003 = v23;
  v1002 = *(char **)(v23 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v1004 = (char *)&v993 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1085 = type metadata accessor for DenylistDescriptor();
  uint64_t v1088 = *(void *)(v1085 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v1084 = (char *)&v993 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1083 = type metadata accessor for PrivacyValidation();
  uint64_t v1044 = *(void *)(v1083 - 8);
  uint64_t v26 = ((uint64_t (*)(void))__chkstk_darwin)();
  v1043 = (char *)&v993 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  v1042 = (uint64_t *)((char *)&v993 - v28);
  uint64_t v1045 = type metadata accessor for DebugModel();
  unint64_t v1050 = *(void *)(v1045 - 8);
  __chkstk_darwin(v1045);
  v1047 = (char *)&v993 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003C8B0();
  uint64_t v1058 = v30;
  uint64_t v1062 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  v1046 = (char *)&v993 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003CA70(0, &qword_1000552A8, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double, (uint64_t (*)(void, uint64_t, uint64_t))&type metadata accessor for Item.ResetBehavior);
  uint64_t v1091 = v32;
  uint64_t v1099 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  v1078 = (char *)&v993 - v33;
  sub_10003CA70(0, &qword_1000552B0, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String, (uint64_t (*)(void, uint64_t, uint64_t))&type metadata accessor for Item.ResetBehavior);
  uint64_t v1070 = v34;
  uint64_t v1075 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  v1067 = (char *)&v993 - v35;
  sub_10003CA70(0, &qword_1000552B8, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int, (uint64_t (*)(void, uint64_t, uint64_t))&type metadata accessor for Item.ResetBehavior);
  uint64_t v1072 = v36;
  uint64_t v1071 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  v1068 = (char *)&v993 - v37;
  sub_10003CA70(0, &qword_1000552C0, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool, (uint64_t (*)(void, uint64_t, uint64_t))&type metadata accessor for Item.ResetBehavior);
  uint64_t v39 = v38;
  uint64_t v40 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v42 = (char *)&v993 - v41;
  uint64_t v43 = type metadata accessor for ChangeBehavior();
  uint64_t v1106 = *(void *)(v43 - 8);
  uint64_t v1107 = v43;
  __chkstk_darwin(v43);
  uint64_t v45 = (char *)&v993 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = type metadata accessor for AppConfiguration();
  uint64_t v1021 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  v1052 = (char *)&v993 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000136F8(a1, a1[3]);
  sub_10001378C(0, &qword_1000552C8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  uint64_t v1041 = v1118[0];
  if (!v1118[0])
  {
    __break(1u);
    goto LABEL_41;
  }
  v1093 = v45;
  v1030 = (char *)v1118[1];
  sub_1000136F8(a1, a1[3]);
  sub_10001378C(0, &qword_1000549D8);
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  if (!v1116)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v1105 = v42;
  uint64_t v1100 = v40;
  uint64_t v1000 = v46;
  uint64_t v1102 = v39;
  v1001 = v5;
  sub_10001393C(&v1115, (uint64_t)v1118);
  sub_1000136F8(v1118, v1118[3]);
  dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
  sub_1000136F8(a1, a1[3]);
  type metadata accessor for AppSessionManager();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:)();
  uint64_t v1036 = result;
  if (!result)
  {
LABEL_42:
    __break(1u);
    return result;
  }
  sub_100015F60(0, &qword_1000552D0, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v1087 = v49;
  uint64_t v50 = *(void *)(type metadata accessor for Group() - 8);
  uint64_t v1081 = *(void *)(v50 + 72);
  uint64_t v51 = *(unsigned __int8 *)(v50 + 80);
  uint64_t v1074 = 2 * v1081;
  uint64_t v1059 = 3 * v1081;
  uint64_t v1033 = 6 * v1081;
  uint64_t v52 = (v51 + 32) & ~v51;
  uint64_t v1082 = v52;
  uint64_t v1086 = v51 | 7;
  uint64_t v53 = swift_allocObject();
  long long v1034 = xmmword_100044510;
  *(_OWORD *)(v53 + 16) = xmmword_100044510;
  uint64_t v999 = v53;
  uint64_t v1095 = v53 + v52;
  sub_10003C944();
  uint64_t v1104 = v54;
  uint64_t v55 = swift_allocObject();
  long long v1101 = xmmword_100043A40;
  *(_OWORD *)(v55 + 16) = xmmword_100043A40;
  v1112 = &type metadata accessor for Item;
  sub_10003CA70(0, &qword_1000552D8, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool, (uint64_t (*)(void, uint64_t, uint64_t))&type metadata accessor for Item);
  uint64_t v57 = v56;
  static Settings.AccessChecks.simulateAccessToEverything.getter();
  sub_10003C9B0();
  v1096 = v58;
  uint64_t v59 = swift_allocObject();
  long long v1110 = xmmword_100044520;
  *(_OWORD *)(v59 + 16) = xmmword_100044520;
  v1094 = (uint64_t *)type metadata accessor for SettingAction();
  *(void *)(v59 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v59;
  specialized Array._endMutation()();
  unsigned int v1108 = enum case for ChangeBehavior.default(_:);
  uint64_t v60 = v1106 + 104;
  v1103 = *(void (**)(void))(v1106 + 104);
  uint64_t v61 = v1093;
  uint64_t v62 = v1107;
  v1103(v1093);
  uint64_t v1106 = v60;
  unsigned int v1111 = enum case for Item.ResetBehavior.reset<A>(_:);
  uint64_t v63 = *(void (**)(void))(v1100 + 104);
  v1100 += 104;
  v1097 = (void (*)(void, void, void))v63;
  v63(v1105);
  uint64_t v1109 = v57;
  uint64_t v64 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v55 + 56) = v57;
  uint64_t v1098 = sub_10003CA0C(&qword_1000552E8, &qword_1000552D8, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool);
  *(void *)(v55 + 64) = v1098;
  *(void *)(v55 + 32) = v64;
  uint64_t v65 = v1095;
  Group.init(title:footer:_:)();
  v1092 = (char *)(v65 + v1081);
  uint64_t v66 = swift_allocObject();
  *(_OWORD *)(v66 + 16) = v1101;
  static Settings.PurchaseFlow.simulatePurchaseFlow.getter();
  uint64_t v67 = swift_allocObject();
  *(_OWORD *)(v67 + 16) = v1110;
  *(void *)(v67 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v67;
  specialized Array._endMutation()();
  uint64_t v68 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v61, v1108, v62);
  uint64_t v69 = v1102;
  uint64_t v70 = v1097;
  v1097(v1105, v1111, v1102);
  v1113 = (uint64_t *)0xD000000000000016;
  uint64_t v71 = v1109;
  uint64_t v72 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v73 = v1098;
  *(void *)(v66 + 56) = v71;
  *(void *)(v66 + 64) = v73;
  *(void *)(v66 + 32) = v72;
  Group.init(title:footer:_:)();
  v1092 = (char *)(v1095 + v1074);
  uint64_t v74 = swift_allocObject();
  long long v997 = xmmword_100044530;
  *(_OWORD *)(v74 + 16) = xmmword_100044530;
  *(void *)&long long v1080 = static Settings.Entitlements.simulateEntitlementCacheExpired.getter();
  uint64_t v75 = v1108;
  v68(v61, v1108, v1107);
  uint64_t v76 = v1111;
  v70(v1105, v1111, v69);
  uint64_t v77 = v1109;
  uint64_t v78 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v74 + 56) = v77;
  *(void *)(v74 + 64) = v73;
  *(void *)(v74 + 32) = v78;
  sub_10003CA70(0, &qword_1000552F0, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int, (uint64_t (*)(void, uint64_t, uint64_t))v1112);
  uint64_t v80 = v79;
  static Settings.Entitlements.cacheRecoveryAttemptDuration.getter();
  uint64_t v81 = v75;
  uint64_t v82 = v1107;
  v68(v61, v81, v1107);
  v1061 = *(void (**)(void, void, void))(v1071 + 104);
  v1071 += 104;
  uint64_t v83 = v1068;
  v1061(v1068, v76, v1072);
  uint64_t v84 = v80;
  uint64_t v1077 = v80;
  uint64_t v85 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v74 + 96) = v84;
  uint64_t v86 = sub_10003CA0C(&qword_1000552F8, &qword_1000552F0, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
  *(void *)(v74 + 104) = v86;
  *(void *)(v74 + 72) = v85;
  static Settings.BundleSubscriptions.entitlementsGracePeriod.getter();
  uint64_t v87 = v82;
  os_log_type_t v88 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v61, v1108, v87);
  uint64_t v89 = v76;
  uint64_t v90 = v1072;
  unint64_t v91 = v1061;
  v1061(v83, v89, v1072);
  uint64_t v92 = v1077;
  uint64_t v93 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v74 + 136) = v92;
  *(void *)(v74 + 144) = v86;
  uint64_t v1060 = v86;
  *(void *)(v74 + 112) = v93;
  *(void *)&long long v1080 = static Settings.Entitlements.entitlementsResultOverride.getter();
  uint64_t v94 = swift_allocObject();
  *(_OWORD *)(v94 + 16) = v1110;
  *(void *)(v94 + 32) = static SettingActions.resetOverrideEntitlement.getter();
  *(void *)&long long v1115 = v94;
  specialized Array._endMutation()();
  v88(v61, v1108, v1107);
  uint64_t v95 = v1111;
  v91(v83, v1111, v90);
  unint64_t v1029 = 0xD00000000000001ALL;
  uint64_t v96 = v1077;
  uint64_t v97 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v74 + 176) = v96;
  *(void *)(v74 + 184) = v86;
  *(void *)(v74 + 152) = v97;
  sub_10003CA70(0, &qword_100055300, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String, (uint64_t (*)(void, uint64_t, uint64_t))v1112);
  uint64_t v99 = v98;
  uint64_t v1073 = v98;
  static Settings.Entitlements.entitlementsOverride.getter();
  v1066 = *(void (**)(void, void, void))(v1075 + 104);
  v1075 += 104;
  v1066(v1067, v95, v1070);
  uint64_t v100 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v74 + 216) = v99;
  uint64_t v1065 = sub_10003CA0C(&qword_100055308, &qword_100055300, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  *(void *)(v74 + 224) = v1065;
  *(void *)(v74 + 192) = v100;
  uint64_t v1079 = static Settings.Entitlements.trialPeriodOverride.getter();
  double v101 = v1093;
  uint64_t v102 = v1108;
  uint64_t v103 = v1107;
  uint64_t v104 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  uint64_t v105 = v1102;
  long long v106 = v1097;
  v1097(v1105, v95, v1102);
  *(void *)&long long v1080 = 0xD000000000000015;
  uint64_t v107 = v101;
  uint64_t v108 = v1109;
  uint64_t v109 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v110 = v1098;
  *(void *)(v74 + 256) = v108;
  *(void *)(v74 + 264) = v110;
  *(void *)(v74 + 232) = v109;
  uint64_t v1079 = static Settings.Entitlements.simulateFamilyMember.getter();
  unint64_t v111 = v107;
  v104(v107, v102, v103);
  uint64_t v112 = v1105;
  v106(v1105, v1111, v105);
  uint64_t v113 = v106;
  uint64_t v114 = v111;
  uint64_t v115 = v1109;
  uint64_t v116 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v117 = v1098;
  *(void *)(v74 + 296) = v115;
  *(void *)(v74 + 304) = v117;
  *(void *)(v74 + 272) = v116;
  uint64_t v1079 = static Settings.Entitlements.simulateAmplifyUser.getter();
  uint64_t v118 = v103;
  uint64_t v119 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, uint64_t, uint64_t))v1103)(v114, v102, v118);
  uint64_t v120 = v1111;
  uint64_t v121 = v1102;
  v113(v112, v1111, v1102);
  uint64_t v122 = v1109;
  uint64_t v123 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v74 + 336) = v122;
  *(void *)(v74 + 344) = v117;
  *(void *)(v74 + 312) = v123;
  static Settings.Entitlements.simulateServicesBundle.getter();
  v119(v1093, v1108, v1107);
  v113(v1105, v120, v121);
  uint64_t v124 = v1109;
  uint64_t v125 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v74 + 376) = v124;
  *(void *)(v74 + 384) = v117;
  *(void *)(v74 + 352) = v125;
  Group.init(title:footer:_:)();
  v1092 = (char *)(v1095 + v1059);
  uint64_t v126 = swift_allocObject();
  long long v1064 = xmmword_100044540;
  *(_OWORD *)(v126 + 16) = xmmword_100044540;
  static Presets.BundleSubscriptions.none.getter();
  uint64_t v127 = swift_allocObject();
  *(_OWORD *)(v127 + 16) = v1110;
  *(void *)(v127 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v127;
  specialized Array._endMutation()();
  uint64_t v128 = type metadata accessor for PresetItem();
  swift_allocObject();
  uint64_t v129 = PresetItem.init(_:label:actions:)();
  *(void *)(v126 + 56) = v128;
  *(void *)(v126 + 64) = &protocol witness table for PresetItem;
  *(void *)(v126 + 32) = v129;
  static Presets.BundleSubscriptions.iTMS5.getter();
  uint64_t v130 = swift_allocObject();
  *(_OWORD *)(v130 + 16) = v1110;
  *(void *)(v130 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v130;
  specialized Array._endMutation()();
  swift_allocObject();
  uint64_t v131 = PresetItem.init(_:label:actions:)();
  *(void *)(v126 + 96) = v128;
  *(void *)(v126 + 104) = &protocol witness table for PresetItem;
  *(void *)(v126 + 72) = v131;
  static Presets.BundleSubscriptions.iTMS6.getter();
  uint64_t v132 = swift_allocObject();
  *(_OWORD *)(v132 + 16) = v1110;
  *(void *)(v132 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v132;
  specialized Array._endMutation()();
  swift_allocObject();
  uint64_t v133 = PresetItem.init(_:label:actions:)();
  *(void *)(v126 + 136) = v128;
  *(void *)(v126 + 144) = &protocol witness table for PresetItem;
  *(void *)(v126 + 112) = v133;
  static Presets.BundleSubscriptions.iTMS7.getter();
  uint64_t v134 = swift_allocObject();
  *(_OWORD *)(v134 + 16) = v1110;
  *(void *)(v134 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v134;
  specialized Array._endMutation()();
  swift_allocObject();
  uint64_t v135 = PresetItem.init(_:label:actions:)();
  *(void *)(v126 + 176) = v128;
  *(void *)(v126 + 184) = &protocol witness table for PresetItem;
  *(void *)(v126 + 152) = v135;
  static Presets.BundleSubscriptions.iTMS11.getter();
  uint64_t v136 = swift_allocObject();
  *(_OWORD *)(v136 + 16) = v1110;
  *(void *)(v136 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v136;
  specialized Array._endMutation()();
  swift_allocObject();
  uint64_t v137 = PresetItem.init(_:label:actions:)();
  *(void *)(v126 + 216) = v128;
  *(void *)(v126 + 224) = &protocol witness table for PresetItem;
  *(void *)(v126 + 192) = v137;
  Group.init(title:footer:_:)();
  uint64_t v138 = v1081;
  uint64_t v139 = 4 * v1081;
  uint64_t v1053 = 4 * v1081;
  uint64_t v140 = swift_allocObject();
  *(_OWORD *)(v140 + 16) = v1101;
  static Settings.WebAccess.localServerIP.getter();
  uint64_t v141 = v1067;
  uint64_t v142 = v1111;
  v1066(v1067, v1111, v1070);
  uint64_t v143 = v1073;
  uint64_t v144 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v145 = v1065;
  *(void *)(v140 + 56) = v143;
  *(void *)(v140 + 64) = v145;
  *(void *)(v140 + 32) = v144;
  Group.init(title:footer:_:)();
  uint64_t v146 = swift_allocObject();
  *(_OWORD *)(v146 + 16) = v1101;
  *(void *)(v146 + 56) = v1040;
  *(void *)(v146 + 64) = &protocol witness table for SettingsBundle;
  sub_100015400((uint64_t *)(v146 + 32));
  static SettingsBundle.appLaunchUpsell.getter();
  Group.init(title:footer:_:)();
  uint64_t v1031 = v139 + v138;
  uint64_t v147 = v1082;
  uint64_t v996 = v1082 + 5 * v138;
  uint64_t v1035 = swift_allocObject();
  *(_OWORD *)(v1035 + 16) = v1064;
  uint64_t v148 = swift_allocObject();
  long long v1056 = xmmword_100043A30;
  v1048 = (uint64_t *)v148;
  *(_OWORD *)(v148 + 16) = xmmword_100043A30;
  uint64_t v1032 = 8 * v138;
  uint64_t v998 = 7 * v138;
  uint64_t v149 = swift_allocObject();
  *(_OWORD *)(v149 + 16) = xmmword_100044550;
  uint64_t v995 = v149;
  uint64_t v1051 = v149 + v147;
  uint64_t v150 = swift_allocObject();
  *(_OWORD *)(v150 + 16) = v1064;
  static Settings.Analytics2.Debugging.sessionName.getter();
  v1066(v141, v142, v1070);
  uint64_t v151 = v1073;
  uint64_t v152 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v153 = v1065;
  *(void *)(v150 + 56) = v151;
  *(void *)(v150 + 64) = v153;
  *(void *)(v150 + 32) = v152;
  static Settings.Analytics2.Debugging.batchDebugging.getter();
  uint64_t v154 = v1093;
  uint64_t v155 = v1108;
  uint64_t v156 = v1107;
  v157 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  v1097(v1105, v142, v1102);
  v158 = v154;
  uint64_t v159 = v1109;
  uint64_t v160 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v161 = v1098;
  *(void *)(v150 + 96) = v159;
  *(void *)(v150 + 104) = v161;
  *(void *)(v150 + 72) = v160;
  static Settings.Analytics2.Debugging.batchSize.getter();
  v157(v158, v155, v156);
  v162 = v1068;
  v163 = v1061;
  v1061(v1068, v142, v1072);
  v164 = v158;
  v165 = v162;
  uint64_t v166 = v1077;
  uint64_t v167 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v168 = v1060;
  *(void *)(v150 + 136) = v166;
  *(void *)(v150 + 144) = v168;
  *(void *)(v150 + 112) = v167;
  uint64_t v1095 = static Settings.Analytics2.Debugging.maxUploadRetryCount.getter();
  uint64_t v169 = swift_allocObject();
  *(_OWORD *)(v169 + 16) = v1110;
  *(void *)(v169 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v169;
  specialized Array._endMutation()();
  uint64_t v170 = v1108;
  uint64_t v171 = v1107;
  v172 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v164, v1108, v1107);
  uint64_t v173 = v1111;
  v163(v165, v1111, v1072);
  uint64_t v174 = v1077;
  uint64_t v175 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v176 = v1060;
  *(void *)(v150 + 176) = v174;
  *(void *)(v150 + 184) = v176;
  *(void *)(v150 + 152) = v175;
  static Settings.Analytics2.Debugging.disableAnalytics.getter();
  v172(v164, v170, v171);
  v177 = v172;
  v1097(v1105, v173, v1102);
  uint64_t v178 = v1109;
  uint64_t v179 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v180 = v1098;
  *(void *)(v150 + 216) = v178;
  *(void *)(v150 + 224) = v180;
  *(void *)(v150 + 192) = v179;
  Group.init(title:footer:_:)();
  uint64_t v181 = swift_allocObject();
  *(_OWORD *)(v181 + 16) = v1101;
  sub_10003CA70(0, &qword_100055310, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double, (uint64_t (*)(void, uint64_t, uint64_t))v1112);
  uint64_t v183 = v182;
  static Settings.Identification.adIdentifierRotation.getter();
  v184 = v164;
  v177(v164, v1108, v1107);
  v185 = *(char **)(v1099 + 104);
  v1099 += 104;
  v1092 = v185;
  uint64_t v186 = v1111;
  ((void (*)(char *, void, uint64_t))v185)(v1078, v1111, v1091);
  uint64_t v187 = v183;
  uint64_t v1079 = v183;
  uint64_t v188 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v181 + 56) = v187;
  uint64_t v1095 = sub_10003CA0C(&qword_100055318, &qword_100055310, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
  *(void *)(v181 + 64) = v1095;
  *(void *)(v181 + 32) = v188;
  Group.init(title:footer:_:)();
  uint64_t v189 = v1051;
  uint64_t v190 = swift_allocObject();
  *(_OWORD *)(v190 + 16) = v1101;
  sub_10003CAC0();
  uint64_t v192 = v191;
  static Settings.Analytics2.Instrumentation.ads.getter();
  v193 = *(void (**)(void, void, void))(v1062 + 104);
  v1062 += 104;
  v1055 = v193;
  v193(v1046, v186, v1058);
  uint64_t v1057 = sub_10003D1BC(&qword_100055328, (void (*)(uint64_t))&type metadata accessor for FeatureState);
  uint64_t v194 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v1076 = v192;
  *(void *)(v190 + 56) = v192;
  uint64_t v1054 = sub_10003D1BC(&qword_100055330, (void (*)(uint64_t))sub_10003CAC0);
  *(void *)(v190 + 64) = v1054;
  *(void *)(v190 + 32) = v194;
  Group.init(title:footer:_:)();
  v1112 = (uint64_t (**)(void))(v189 + v1059);
  uint64_t v195 = swift_allocObject();
  *(_OWORD *)(v195 + 16) = v1101;
  static Settings.Blueprint.Impressions.scrollDelta.getter();
  uint64_t v196 = swift_allocObject();
  *(_OWORD *)(v196 + 16) = v1110;
  *(void *)(v196 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v196;
  specialized Array._endMutation()();
  v197 = v184;
  v198 = v184;
  uint64_t v199 = v1108;
  ((void (*)(char *, void, uint64_t))v1103)(v198, v1108, v1107);
  ((void (*)(char *, void, uint64_t))v1092)(v1078, v1111, v1091);
  uint64_t v200 = v1079;
  uint64_t v201 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v202 = v1095;
  *(void *)(v195 + 56) = v200;
  *(void *)(v195 + 64) = v202;
  *(void *)(v195 + 32) = v201;
  Group.init(title:footer:_:)();
  *(void *)&long long v1080 = v1051 + v1053;
  v1112 = (uint64_t (**)(void))static Settings.Analytics2.Debugging.jitterOverrides.getter();
  uint64_t v203 = swift_allocObject();
  long long v1063 = xmmword_100043A60;
  *(_OWORD *)(v203 + 16) = xmmword_100043A60;
  v1113 = (uint64_t *)type metadata accessor for Settings.Analytics2.Debugging.Jitter();
  uint64_t v1069 = static Settings.Analytics2.Debugging.Jitter.enablement.getter();
  uint64_t v204 = swift_allocObject();
  *(_OWORD *)(v204 + 16) = v1110;
  *(void *)(v204 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v204;
  specialized Array._endMutation()();
  v205 = v197;
  uint64_t v206 = v199;
  uint64_t v207 = v1107;
  v208 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, uint64_t, uint64_t))v1103)(v197, v206, v1107);
  uint64_t v209 = v1111;
  v1097(v1105, v1111, v1102);
  uint64_t v210 = v1109;
  uint64_t v211 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v212 = v1098;
  *(void *)(v203 + 56) = v210;
  *(void *)(v203 + 64) = v212;
  *(void *)(v203 + 32) = v211;
  uint64_t v1069 = static Settings.Analytics2.Debugging.Jitter.lowerBound.getter();
  uint64_t v213 = swift_allocObject();
  *(_OWORD *)(v213 + 16) = v1110;
  *(void *)(v213 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v213;
  specialized Array._endMutation()();
  uint64_t v214 = v1108;
  v208(v197, v1108, v207);
  v215 = v1078;
  uint64_t v216 = v1091;
  v217 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v1078, v209, v1091);
  uint64_t v218 = v1079;
  uint64_t v219 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v220 = v1095;
  *(void *)(v203 + 96) = v218;
  *(void *)(v203 + 104) = v220;
  *(void *)(v203 + 72) = v219;
  v1113 = (uint64_t *)static Settings.Analytics2.Debugging.Jitter.upperBound.getter();
  uint64_t v221 = swift_allocObject();
  *(_OWORD *)(v221 + 16) = v1110;
  *(void *)(v221 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v221;
  specialized Array._endMutation()();
  ((void (*)(char *, uint64_t, uint64_t))v1103)(v205, v214, v207);
  v217(v215, v1111, v216);
  uint64_t v222 = v1079;
  uint64_t v223 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v224 = v1095;
  *(void *)(v203 + 136) = v222;
  *(void *)(v203 + 144) = v224;
  *(void *)(v203 + 112) = v223;
  uint64_t v1069 = 0xD000000000000010;
  Group.init(title:footer:group:_:)();
  uint64_t v225 = swift_allocObject();
  long long v1080 = xmmword_100043A50;
  *(_OWORD *)(v225 + 16) = xmmword_100043A50;
  swift_getObjectType();
  v226 = v1042;
  dispatch thunk of PrivacyValidationProviderType.privacyValidation.getter();
  LOBYTE(v222) = PrivacyValidation.isEnabled.getter();
  uint64_t v227 = *(void *)(v1044 + 8);
  v228 = v226;
  uint64_t v229 = v1083;
  ((void (*)(uint64_t *, uint64_t))v227)(v228, v1083);
  char v230 = v222 & 1;
  v231 = v1047;
  char *v1047 = v230;
  v232 = *(void (**)(void))(v1050 + 104);
  unsigned int v994 = enum case for DebugModel.BOOL(_:);
  v1050 += 104;
  v993 = (void (*)(void, void, void))v232;
  v232(v231);
  v1113 = (uint64_t *)type metadata accessor for DebugItem();
  *(void *)(v225 + 56) = v1113;
  v233 = (uint64_t *)sub_10003D1BC(&qword_100055338, (void (*)(uint64_t))&type metadata accessor for DebugItem);
  v1042 = (uint64_t *)v225;
  v1112 = (uint64_t (**)(void))v233;
  *(void *)(v225 + 64) = v233;
  sub_100015400((uint64_t *)(v225 + 32));
  DebugItem.init(title:model:)();
  uint64_t v1044 = swift_allocObject();
  *(_OWORD *)(v1044 + 16) = v1056;
  v234 = v1043;
  dispatch thunk of PrivacyValidationProviderType.privacyValidation.getter();
  uint64_t v235 = PrivacyValidation.denylistDescriptors.getter();
  ((void (*)(char *, uint64_t))v227)(v234, v229);
  int64_t v236 = *(void *)(v235 + 16);
  if (v236)
  {
    v1114 = (void **)&_swiftEmptyArrayStorage;
    v237 = (void **)&v1114;
    sub_10002F21C(0, v236, 0);
    int64_t v238 = sub_10003CB54(v235);
    int v240 = v239;
    char v242 = v241 & 1;
    uint64_t v1083 = v235 + 56;
    while ((v238 & 0x8000000000000000) == 0 && v238 < 1 << *(unsigned char *)(v235 + 32))
    {
      if (((*(void *)(v1083 + (((unint64_t)v238 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v238) & 1) == 0) {
        goto LABEL_37;
      }
      if (*(_DWORD *)(v235 + 36) != v240) {
        goto LABEL_38;
      }
      uint64_t v243 = v1088;
      v244 = v1084;
      uint64_t v245 = v1085;
      (*(void (**)(char *, int64_t, uint64_t))(v1088 + 16))(v1084, *(void *)(v235 + 48) + *(void *)(v1088 + 72) * v238, v1085);
      v1116 = v1113;
      v1117 = v1112;
      sub_100015400((uint64_t *)&v1115);
      DenylistDescriptor.debugItem.getter();
      (*(void (**)(char *, uint64_t))(v243 + 8))(v244, v245);
      v237 = v1114;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10002F21C(0, (int64_t)v237[2] + 1, 1);
        v237 = v1114;
      }
      unint64_t v247 = (unint64_t)v237[2];
      unint64_t v246 = (unint64_t)v237[3];
      uint64_t v227 = v247 + 1;
      if (v247 >= v246 >> 1)
      {
        sub_10002F21C(v246 > 1, v247 + 1, 1);
        v237 = v1114;
      }
      v237[2] = (void *)v227;
      sub_10001393C(&v1115, (uint64_t)&v237[5 * v247 + 4]);
      int64_t v248 = sub_10003CBF4(v238, v240, v242 & 1, v235);
      int64_t v238 = v248;
      int v240 = v249;
      char v242 = v250 & 1;
      if (!--v236)
      {
        sub_100024B60(v248, v249, v250 & 1);
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_17:
    Group.init(title:footer:_:)();
    uint64_t v251 = AppConfiguration.analyticsDenylistDescriptorsPublic.getter();
    int64_t v252 = *(void *)(v251 + 16);
    if (v252)
    {
      v1114 = (void **)&_swiftEmptyArrayStorage;
      sub_10002F21C(0, v252, 0);
      v253 = v1114;
      uint64_t v254 = v251 + 40;
      do
      {
        v1116 = v1113;
        v1117 = v1112;
        sub_100015400((uint64_t *)&v1115);
        swift_bridgeObjectRetain();
        String.denylistDescriptorValueDebugItem.getter();
        swift_bridgeObjectRelease();
        v1114 = v253;
        unint64_t v256 = (unint64_t)v253[2];
        unint64_t v255 = (unint64_t)v253[3];
        if (v256 >= v255 >> 1)
        {
          sub_10002F21C(v255 > 1, v256 + 1, 1);
          v253 = v1114;
        }
        v254 += 16;
        v253[2] = (void *)(v256 + 1);
        sub_10001393C(&v1115, (uint64_t)&v253[5 * v256 + 4]);
        --v252;
      }
      while (v252);
    }
    swift_bridgeObjectRelease();
    uint64_t v1085 = (uint64_t)(v1048 + 4);
    Group.init(title:footer:_:)();
    uint64_t v257 = AppConfiguration.analyticsDenylistDescriptorsSeed.getter();
    int64_t v258 = *(void *)(v257 + 16);
    if (v258)
    {
      v1114 = (void **)&_swiftEmptyArrayStorage;
      sub_10002F21C(0, v258, 0);
      v259 = v1114;
      uint64_t v260 = v257 + 40;
      do
      {
        v1116 = v1113;
        v1117 = v1112;
        sub_100015400((uint64_t *)&v1115);
        swift_bridgeObjectRetain();
        String.denylistDescriptorValueDebugItem.getter();
        swift_bridgeObjectRelease();
        v1114 = v259;
        unint64_t v262 = (unint64_t)v259[2];
        unint64_t v261 = (unint64_t)v259[3];
        if (v262 >= v261 >> 1)
        {
          sub_10002F21C(v261 > 1, v262 + 1, 1);
          v259 = v1114;
        }
        v260 += 16;
        v259[2] = (void *)(v262 + 1);
        sub_10001393C(&v1115, (uint64_t)&v259[5 * v262 + 4]);
        --v258;
      }
      while (v258);
    }
    swift_bridgeObjectRelease();
    Group.init(title:footer:_:)();
    uint64_t v263 = AppConfiguration.analyticsDenylistDescriptorsInternal.getter();
    int64_t v264 = *(void *)(v263 + 16);
    if (v264)
    {
      v1114 = (void **)&_swiftEmptyArrayStorage;
      sub_10002F21C(0, v264, 0);
      v265 = v1114;
      uint64_t v266 = v263 + 40;
      do
      {
        v1116 = v1113;
        v1117 = v1112;
        sub_100015400((uint64_t *)&v1115);
        swift_bridgeObjectRetain();
        String.denylistDescriptorValueDebugItem.getter();
        swift_bridgeObjectRelease();
        v1114 = v265;
        unint64_t v268 = (unint64_t)v265[2];
        unint64_t v267 = (unint64_t)v265[3];
        if (v268 >= v267 >> 1)
        {
          sub_10002F21C(v267 > 1, v268 + 1, 1);
          v265 = v1114;
        }
        v266 += 16;
        v265[2] = (void *)(v268 + 1);
        sub_10001393C(&v1115, (uint64_t)&v265[5 * v268 + 4]);
        --v264;
      }
      while (v264);
    }
    swift_bridgeObjectRelease();
    v269 = v1042;
    Group.init(title:footer:_:)();
    uint64_t v270 = type metadata accessor for Page();
    v269[12] = v270;
    v269[13] = (uint64_t)&protocol witness table for Page;
    uint64_t v271 = v270;
    uint64_t v1088 = v270;
    sub_100015400(v269 + 9);
    Page.init(title:_:)();
    Group.init(title:footer:_:)();
    uint64_t v272 = swift_allocObject();
    *(_OWORD *)(v272 + 16) = v1101;
    char v273 = AppSessionManager.wasPriorSessionCrashDetected.getter();
    v274 = v1047;
    char *v1047 = v273 & 1;
    v993(v274, v994, v1045);
    v275 = v1112;
    *(void *)(v272 + 56) = v1113;
    *(void *)(v272 + 64) = v275;
    sub_100015400((uint64_t *)(v272 + 32));
    DebugItem.init(title:model:)();
    Group.init(title:footer:_:)();
    v276 = v1048;
    v1048[7] = v271;
    v276[8] = (uint64_t)&protocol witness table for Page;
    sub_100015400((uint64_t *)v1085);
    Page.init(title:_:)();
    v1113 = v276 + 9;
    uint64_t v277 = v1082;
    v1084 = (char *)(v1082 + v1081);
    uint64_t v278 = swift_allocObject();
    *(_OWORD *)(v278 + 16) = v1101;
    v1112 = (uint64_t (**)(void))(v278 + v277);
    uint64_t v279 = swift_allocObject();
    *(_OWORD *)(v279 + 16) = v1101;
    sub_10003CCD8();
    uint64_t v281 = v280;
    static Settings.Container.testSuite.getter();
    uint64_t v282 = swift_allocObject();
    *(_OWORD *)(v282 + 16) = v1110;
    *(void *)(v282 + 32) = static SettingActions.restart.getter();
    *(void *)&long long v1115 = v282;
    specialized Array._endMutation()();
    uint64_t v283 = v1111;
    (*((void (**)(char *, void, uint64_t))v1002 + 13))(v1004, v1111, v1003);
    sub_10003D1BC(&qword_100055348, (void (*)(uint64_t))&type metadata accessor for Settings.Container.TestSuite);
    uint64_t v284 = Item<>.init(_:label:resetBehavior:actions:)();
    *(void *)(v279 + 56) = v281;
    uint64_t v1085 = (uint64_t)&protocol conformance descriptor for Item<A>;
    *(void *)(v279 + 64) = sub_10003D1BC(&qword_100055350, (void (*)(uint64_t))sub_10003CCD8);
    *(void *)(v279 + 32) = v284;
    Group.init(title:footer:_:)();
    v276[12] = v1088;
    v276[13] = (uint64_t)&protocol witness table for Page;
    sub_100015400(v1113);
    Page.init(title:_:)();
    v1112 = (uint64_t (**)(void))(v276 + 14);
    uint64_t v1045 = v277 + v1074;
    uint64_t v285 = swift_allocObject();
    *(_OWORD *)(v285 + 16) = v1080;
    v1113 = (uint64_t *)v285;
    uint64_t v286 = v285 + v277;
    uint64_t v287 = swift_allocObject();
    *(_OWORD *)(v287 + 16) = v1101;
    sub_10003CD6C();
    uint64_t v289 = v288;
    static Settings.News.newsProvider.getter();
    uint64_t v290 = swift_allocObject();
    *(_OWORD *)(v290 + 16) = v1110;
    *(void *)(v290 + 32) = static SettingActions.restart.getter();
    *(void *)&long long v1115 = v290;
    specialized Array._endMutation()();
    (*(void (**)(char *, uint64_t, uint64_t))(v1005 + 104))(v1007, v283, v1006);
    sub_10003D1BC(&qword_100055360, (void (*)(uint64_t))&type metadata accessor for NewsProvider);
    uint64_t v291 = Item<>.init(_:label:resetBehavior:actions:)();
    *(void *)(v287 + 56) = v289;
    *(void *)(v287 + 64) = sub_10003D1BC(&qword_100055368, (void (*)(uint64_t))sub_10003CD6C);
    *(void *)(v287 + 32) = v291;
    Group.init(title:footer:_:)();
    uint64_t v1085 = v286 + v1081;
    uint64_t v227 = swift_allocObject();
    *(_OWORD *)(v227 + 16) = v1063;
    sub_10003CE00();
    int64_t v236 = v292;
    static Settings.News.appleNewsEnvironment.getter();
    v237 = (void **)swift_allocObject();
    *((_OWORD *)v237 + 1) = v1110;
    if (qword_100053830 == -1) {
      goto LABEL_33;
    }
  }
  swift_once();
LABEL_33:
  v237[4] = (void *)qword_100056910;
  *(void *)&long long v1115 = v237;
  specialized Array._endMutation()();
  uint64_t v293 = v1111;
  ((void (*)(char *, void, unint64_t))v1008[13])(v1028, v1111, v1009);
  sub_10003D1BC(&qword_100055378, (void (*)(uint64_t))&type metadata accessor for NewsEnvironment);
  swift_retain();
  uint64_t v294 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v227 + 56) = v236;
  *(void *)(v227 + 64) = sub_10003D1BC(&qword_100055380, (void (*)(uint64_t))sub_10003CE00);
  *(void *)(v227 + 32) = v294;
  static Settings.News.disableEdgeCachedFeeds.getter();
  uint64_t v295 = swift_allocObject();
  *(_OWORD *)(v295 + 16) = v1110;
  *(void *)(v295 + 32) = qword_100056910;
  *(void *)&long long v1115 = v295;
  specialized Array._endMutation()();
  v296 = v1093;
  uint64_t v297 = v1108;
  v298 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  v299 = v1105;
  uint64_t v300 = v293;
  v301 = v1097;
  v1097(v1105, v300, v1102);
  swift_retain();
  v1028 = (char *)0xD000000000000019;
  uint64_t v302 = v1109;
  uint64_t v303 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v304 = v1098;
  *(void *)(v227 + 96) = v302;
  *(void *)(v227 + 104) = v304;
  *(void *)(v227 + 72) = v303;
  uint64_t v1083 = static Settings.News.disableEdgeCachedTopStories.getter();
  uint64_t v305 = swift_allocObject();
  *(_OWORD *)(v305 + 16) = v1110;
  *(void *)(v305 + 32) = qword_100056910;
  *(void *)&long long v1115 = v305;
  specialized Array._endMutation()();
  v298(v296, v297, v1107);
  v301(v299, v1111, v1102);
  swift_retain();
  unint64_t v1009 = 0xD00000000000001FLL;
  uint64_t v306 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v227 + 136) = v302;
  *(void *)(v227 + 144) = v304;
  *(void *)(v227 + 112) = v306;
  Group.init(title:footer:_:)();
  v307 = v1048;
  v1048[17] = v1088;
  v307[18] = (uint64_t)&protocol witness table for Page;
  sub_100015400((uint64_t *)v1112);
  Page.init(title:_:)();
  sub_10003CE94(0, &qword_100055388, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for Item);
  uint64_t v309 = v308;
  if (qword_100053840 != -1) {
    swift_once();
  }
  uint64_t v310 = v1035 + v1082;
  uint64_t v311 = swift_allocObject();
  *(_OWORD *)(v311 + 16) = v1110;
  swift_retain();
  *(void *)(v311 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v311;
  specialized Array._endMutation()();
  uint64_t v312 = v1111;
  (*(void (**)(char *, void, uint64_t))(v1010 + 104))(v1011, v1111, v1027);
  sub_1000218F4();
  uint64_t v313 = Item<>.init(_:label:resetBehavior:actions:)();
  v307[22] = v309;
  v307[23] = sub_10003CEF8();
  v307[19] = v313;
  uint64_t v1044 = v310;
  Group.init(title:footer:_:)();
  v1112 = (uint64_t (**)(void))(v310 + v1081);
  uint64_t v314 = swift_allocObject();
  *(_OWORD *)(v314 + 16) = xmmword_100044560;
  static Settings.Features.enableAIAttribution.getter();
  uint64_t v315 = swift_allocObject();
  *(_OWORD *)(v315 + 16) = v1110;
  *(void *)(v315 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v315;
  specialized Array._endMutation()();
  v316 = v1046;
  v317 = v1055;
  v1055(v1046, v312, v1058);
  uint64_t v318 = v1076;
  uint64_t v319 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v320 = v1054;
  *(void *)(v314 + 56) = v318;
  *(void *)(v314 + 64) = v320;
  *(void *)(v314 + 32) = v319;
  v1113 = (uint64_t *)static Settings.Features.appReviewPrompt.getter();
  uint64_t v321 = swift_allocObject();
  *(_OWORD *)(v321 + 16) = v1110;
  *(void *)(v321 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v321;
  specialized Array._endMutation()();
  uint64_t v322 = v1111;
  uint64_t v323 = v1058;
  v317(v316, v1111, v1058);
  uint64_t v324 = v1076;
  uint64_t v325 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v326 = v1054;
  *(void *)(v314 + 96) = v324;
  *(void *)(v314 + 104) = v326;
  *(void *)(v314 + 72) = v325;
  v1113 = (uint64_t *)static Settings.Features.narrativeAudio.getter();
  uint64_t v327 = swift_allocObject();
  *(_OWORD *)(v327 + 16) = v1110;
  *(void *)(v327 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v327;
  specialized Array._endMutation()();
  uint64_t v328 = v322;
  v329 = v1055;
  v1055(v316, v328, v323);
  uint64_t v330 = v1076;
  uint64_t v331 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v314 + 136) = v330;
  *(void *)(v314 + 144) = v326;
  *(void *)(v314 + 112) = v331;
  static Settings.Features.cipActivation.getter();
  uint64_t v332 = swift_allocObject();
  *(_OWORD *)(v332 + 16) = v1110;
  *(void *)(v332 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v332;
  specialized Array._endMutation()();
  uint64_t v333 = v1111;
  uint64_t v334 = v1058;
  v329(v316, v1111, v1058);
  uint64_t v335 = v1076;
  uint64_t v336 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v337 = v1054;
  *(void *)(v314 + 176) = v335;
  *(void *)(v314 + 184) = v337;
  *(void *)(v314 + 152) = v336;
  v1113 = (uint64_t *)static Settings.NewsFeedModule.Features.useFeedDifferentiationMode.getter();
  uint64_t v338 = swift_allocObject();
  *(_OWORD *)(v338 + 16) = v1110;
  *(void *)(v338 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v338;
  specialized Array._endMutation()();
  v339 = v1055;
  v1055(v316, v333, v334);
  uint64_t v340 = v1076;
  uint64_t v341 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v314 + 216) = v340;
  *(void *)(v314 + 224) = v337;
  *(void *)(v314 + 192) = v341;
  v1113 = (uint64_t *)static Settings.Features.symbolsInArticles.getter();
  uint64_t v342 = swift_allocObject();
  *(_OWORD *)(v342 + 16) = v1110;
  *(void *)(v342 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v342;
  specialized Array._endMutation()();
  uint64_t v343 = v1111;
  uint64_t v344 = v1058;
  v339(v316, v1111, v1058);
  uint64_t v1027 = 0xD00000000000001ALL;
  uint64_t v345 = v1076;
  uint64_t v346 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v347 = v1054;
  *(void *)(v314 + 256) = v345;
  *(void *)(v314 + 264) = v347;
  *(void *)(v314 + 232) = v346;
  v1113 = (uint64_t *)static Settings.Features.forYouFeedConfigRequests.getter();
  uint64_t v348 = swift_allocObject();
  *(_OWORD *)(v348 + 16) = v1110;
  *(void *)(v348 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v348;
  specialized Array._endMutation()();
  uint64_t v349 = v343;
  uint64_t v350 = v344;
  v351 = v1055;
  v1055(v316, v343, v350);
  uint64_t v352 = v1076;
  uint64_t v353 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v354 = v1054;
  *(void *)(v314 + 296) = v352;
  *(void *)(v314 + 304) = v354;
  *(void *)(v314 + 272) = v353;
  v1113 = (uint64_t *)static Settings.Features.newsFreeExperience.getter();
  uint64_t v355 = swift_allocObject();
  *(_OWORD *)(v355 + 16) = v1110;
  *(void *)(v355 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v355;
  specialized Array._endMutation()();
  uint64_t v356 = v349;
  uint64_t v357 = v349;
  uint64_t v358 = v1058;
  v351(v316, v357, v1058);
  uint64_t v1083 = 0xD000000000000014;
  uint64_t v359 = v1076;
  uint64_t v360 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v314 + 336) = v359;
  *(void *)(v314 + 344) = v354;
  uint64_t v361 = v354;
  *(void *)(v314 + 312) = v360;
  v1113 = (uint64_t *)static Settings.Features.nffFeeds.getter();
  uint64_t v362 = swift_allocObject();
  *(_OWORD *)(v362 + 16) = v1110;
  *(void *)(v362 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v362;
  specialized Array._endMutation()();
  v363 = v1055;
  v1055(v316, v356, v358);
  uint64_t v364 = v1076;
  uint64_t v365 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v314 + 376) = v364;
  *(void *)(v314 + 384) = v361;
  *(void *)(v314 + 352) = v365;
  uint64_t v1085 = static Settings.Features.paidBundleViaOffer.getter();
  uint64_t v366 = swift_allocObject();
  *(_OWORD *)(v366 + 16) = v1110;
  *(void *)(v366 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v366;
  specialized Array._endMutation()();
  uint64_t v367 = v1111;
  v363(v316, v1111, v358);
  v1113 = (uint64_t *)0xD000000000000015;
  uint64_t v368 = v1076;
  uint64_t v369 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v314 + 416) = v368;
  *(void *)(v314 + 424) = v361;
  *(void *)(v314 + 392) = v369;
  static Settings.Features.showYahooNewsAttribution.getter();
  v363(v316, v367, v358);
  unint64_t v1029 = 0xD00000000000001DLL;
  uint64_t v370 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v314 + 456) = v368;
  *(void *)(v314 + 464) = v361;
  *(void *)(v314 + 432) = v370;
  static Settings.Features.widgetNewsCuration.getter();
  v363(v316, v367, v358);
  uint64_t v371 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v314 + 496) = v368;
  *(void *)(v314 + 504) = v361;
  *(void *)(v314 + 472) = v371;
  static Settings.Features.displayPreMarketQuote.getter();
  v363(v316, v1111, v358);
  unint64_t v1050 = 0xD000000000000018;
  uint64_t v372 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v314 + 536) = v368;
  *(void *)(v314 + 544) = v361;
  *(void *)(v314 + 512) = v372;
  Group.init(title:footer:_:)();
  uint64_t v1010 = v1044 + v1074;
  uint64_t v373 = swift_allocObject();
  v1047 = (char *)v373;
  *(_OWORD *)(v373 + 16) = v1056;
  uint64_t v1085 = v373 + 32;
  uint64_t v374 = v1082;
  v1030 = (char *)(v1082 + v1059);
  uint64_t v375 = swift_allocObject();
  v1048 = (uint64_t *)v375;
  *(_OWORD *)(v375 + 16) = v1063;
  v376 = (char *)(v375 + v374);
  static Settings.ForYou.configOverrides.getter();
  uint64_t v377 = swift_allocObject();
  *(_OWORD *)(v377 + 16) = v1101;
  type metadata accessor for Settings.ForYou.ConfigOverrides();
  static Settings.ForYou.ConfigOverrides.url.getter();
  uint64_t v378 = swift_allocObject();
  *(_OWORD *)(v378 + 16) = v1110;
  *(void *)(v378 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v378;
  specialized Array._endMutation()();
  uint64_t v379 = v1111;
  v1066(v1067, v1111, v1070);
  uint64_t v380 = v1073;
  uint64_t v381 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v382 = v1065;
  *(void *)(v377 + 56) = v380;
  *(void *)(v377 + 64) = v382;
  *(void *)(v377 + 32) = v381;
  v1112 = (uint64_t (**)(void))0x8000000100042C40;
  v1043 = v376;
  Group.init(title:footer:group:_:)();
  v1008 = (uint64_t *)&v376[v1081];
  uint64_t v383 = swift_allocObject();
  *(_OWORD *)(v383 + 16) = v1056;
  uint64_t v1051 = static Settings.News.disableTopStories.getter();
  uint64_t v384 = swift_allocObject();
  *(_OWORD *)(v384 + 16) = v1110;
  *(void *)(v384 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v384;
  specialized Array._endMutation()();
  v385 = v1093;
  uint64_t v386 = v1108;
  uint64_t v387 = v1107;
  v388 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  v389 = v1105;
  uint64_t v390 = v1102;
  v1097(v1105, v379, v1102);
  uint64_t v391 = v1109;
  uint64_t v392 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v393 = v1098;
  *(void *)(v383 + 56) = v391;
  *(void *)(v383 + 64) = v393;
  *(void *)(v383 + 32) = v392;
  uint64_t v1051 = static Settings.News.enableForYouGroupSizeOverride.getter();
  uint64_t v394 = swift_allocObject();
  *(_OWORD *)(v394 + 16) = v1110;
  *(void *)(v394 + 32) = qword_100056910;
  *(void *)&long long v1115 = v394;
  specialized Array._endMutation()();
  v388(v385, v386, v387);
  uint64_t v395 = v1111;
  v1097(v389, v1111, v390);
  swift_retain();
  v1011 = (char *)0xD00000000000001BLL;
  uint64_t v396 = v1109;
  uint64_t v397 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v398 = v1098;
  *(void *)(v383 + 96) = v396;
  *(void *)(v383 + 104) = v398;
  *(void *)(v383 + 72) = v397;
  uint64_t v1051 = static Settings.News.forYouGroupSizeOverride.getter();
  uint64_t v399 = swift_allocObject();
  *(_OWORD *)(v399 + 16) = v1110;
  *(void *)(v399 + 32) = qword_100056910;
  *(void *)&long long v1115 = v399;
  specialized Array._endMutation()();
  uint64_t v400 = v1107;
  v401 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, uint64_t, uint64_t))v1103)(v385, v386, v1107);
  v1061(v1068, v395, v1072);
  swift_retain();
  v1042 = (uint64_t *)0xD000000000000012;
  uint64_t v402 = v1077;
  uint64_t v403 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v404 = v1060;
  *(void *)(v383 + 136) = v402;
  *(void *)(v383 + 144) = v404;
  *(void *)(v383 + 112) = v403;
  static Settings.ForYou.Ticker.tapToDismiss.getter();
  uint64_t v405 = v386;
  uint64_t v406 = v400;
  v401(v385, v405, v400);
  uint64_t v407 = v395;
  v1097(v1105, v395, v1102);
  uint64_t v1051 = 0xD000000000000013;
  uint64_t v408 = v1109;
  uint64_t v409 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v410 = v1098;
  *(void *)(v383 + 176) = v408;
  *(void *)(v383 + 184) = v410;
  *(void *)(v383 + 152) = v409;
  Group.init(title:footer:_:)();
  uint64_t v411 = swift_allocObject();
  *(_OWORD *)(v411 + 16) = v1101;
  sub_10003CF6C();
  v413 = v412;
  static Settings.ForYou.Feed.autoRefreshStrategy.getter();
  v414 = *(char **)(v1049 + 104);
  v1049 += 104;
  v1007 = v414;
  ((void (*)(uint64_t *, uint64_t, unint64_t))v414)(v1037, v407, v1038);
  uint64_t v1006 = sub_10003D1BC(&qword_1000553A0, (void (*)(uint64_t))&type metadata accessor for FeedAutoRefreshStrategy);
  unint64_t v1005 = 0x8000000100042CE0;
  v1004 = v413;
  uint64_t v415 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v411 + 56) = v413;
  v1043 = (char *)&protocol conformance descriptor for Item<A>;
  uint64_t v1003 = sub_10003D1BC(&qword_1000553A8, (void (*)(uint64_t))sub_10003CF6C);
  *(void *)(v411 + 64) = v1003;
  *(void *)(v411 + 32) = v415;
  Group.init(title:footer:_:)();
  v416 = v1047;
  *((void *)v1047 + 7) = v1088;
  *((void *)v416 + 8) = &protocol witness table for Page;
  v417 = v416;
  sub_100015400((uint64_t *)v1085);
  Page.init(title:_:)();
  v1008 = (uint64_t *)(v417 + 72);
  uint64_t v418 = swift_allocObject();
  v1048 = (uint64_t *)v418;
  *(_OWORD *)(v418 + 16) = v1064;
  v419 = (uint64_t *)(v418 + v1082);
  static Settings.StockFeed.configOverrides.getter();
  uint64_t v420 = swift_allocObject();
  *(_OWORD *)(v420 + 16) = v1101;
  type metadata accessor for Settings.StockFeed.ConfigOverrides();
  static Settings.StockFeed.ConfigOverrides.url.getter();
  uint64_t v421 = swift_allocObject();
  *(_OWORD *)(v421 + 16) = v1110;
  *(void *)(v421 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v421;
  specialized Array._endMutation()();
  uint64_t v422 = v1111;
  v1066(v1067, v1111, v1070);
  uint64_t v423 = v1073;
  uint64_t v424 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v425 = v1065;
  *(void *)(v420 + 56) = v423;
  *(void *)(v420 + 64) = v425;
  *(void *)(v420 + 32) = v424;
  uint64_t v1085 = (uint64_t)v419;
  Group.init(title:footer:group:_:)();
  v1002 = (char *)v419 + v1081;
  uint64_t v426 = swift_allocObject();
  *(_OWORD *)(v426 + 16) = v1101;
  static Settings.ChartOptions.showYTD.getter();
  v427 = v1093;
  uint64_t v428 = v1108;
  uint64_t v429 = v406;
  v430 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v406);
  uint64_t v431 = v422;
  v432 = v1097;
  v1097(v1105, v431, v1102);
  v433 = v427;
  uint64_t v434 = v1109;
  uint64_t v435 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v436 = v1098;
  *(void *)(v426 + 56) = v434;
  *(void *)(v426 + 64) = v436;
  *(void *)(v426 + 32) = v435;
  Group.init(title:footer:_:)();
  v1002 = (char *)(v1085 + v1074);
  uint64_t v437 = swift_allocObject();
  *(_OWORD *)(v437 + 16) = v1063;
  static Settings.StockFeed.Layout.Chunking.overrideEnabled.getter();
  uint64_t v438 = v428;
  uint64_t v439 = v429;
  v430(v433, v438, v429);
  uint64_t v440 = v1111;
  v432(v1105, v1111, v1102);
  uint64_t v441 = v1109;
  uint64_t v442 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v437 + 56) = v441;
  *(void *)(v437 + 64) = v436;
  *(void *)(v437 + 32) = v442;
  static Settings.StockFeed.Layout.Chunking.overrideChunkSize.getter();
  uint64_t v443 = v1108;
  v430(v433, v1108, v439);
  v1061(v1068, v440, v1072);
  uint64_t v444 = v1077;
  uint64_t v445 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v446 = v1060;
  *(void *)(v437 + 96) = v444;
  *(void *)(v437 + 104) = v446;
  *(void *)(v437 + 72) = v445;
  static Settings.StockFeed.Layout.overrideVerticalQuoteDetailLayout.getter();
  v430(v433, v443, v439);
  v447 = v1097;
  v1097(v1105, v440, v1102);
  uint64_t v448 = v1109;
  uint64_t v449 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v437 + 136) = v448;
  *(void *)(v437 + 144) = v436;
  *(void *)(v437 + 112) = v449;
  Group.init(title:footer:_:)();
  uint64_t v450 = swift_allocObject();
  *(_OWORD *)(v450 + 16) = v1101;
  static Settings.StockFeed.Feed.autoRefreshStrategy.getter();
  ((void (*)(uint64_t *, uint64_t, unint64_t))v1007)(v1037, v440, v1038);
  v451 = v1004;
  uint64_t v452 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v453 = v1003;
  *(void *)(v450 + 56) = v451;
  *(void *)(v450 + 64) = v453;
  *(void *)(v450 + 32) = v452;
  Group.init(title:footer:_:)();
  uint64_t v454 = swift_allocObject();
  *(_OWORD *)(v454 + 16) = v1101;
  static Settings.StockFeed.Toolbar.overrideAlwaysShowUpdatedLabelEnabled.getter();
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  uint64_t v455 = v440;
  v447(v1105, v440, v1102);
  uint64_t v456 = v1109;
  uint64_t v457 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v458 = v1098;
  *(void *)(v454 + 56) = v456;
  *(void *)(v454 + 64) = v458;
  *(void *)(v454 + 32) = v457;
  Group.init(title:footer:_:)();
  uint64_t v459 = v1088;
  v460 = v1047;
  *((void *)v1047 + 12) = v1088;
  *((void *)v460 + 13) = &protocol witness table for Page;
  v461 = v460;
  sub_100015400(v1008);
  Page.init(title:_:)();
  v1113 = (uint64_t *)(v461 + 112);
  uint64_t v462 = swift_allocObject();
  *(_OWORD *)(v462 + 16) = v1101;
  uint64_t v463 = v1082;
  uint64_t v1049 = v462 + v1082;
  uint64_t v1085 = static Settings.NewsArticlesModules.EndOfArticleFeed.configOverrides.getter();
  uint64_t v464 = swift_allocObject();
  *(_OWORD *)(v464 + 16) = v1101;
  type metadata accessor for Settings.NewsArticlesModules.EndOfArticleFeed.ConfigOverrides();
  static Settings.NewsArticlesModules.EndOfArticleFeed.ConfigOverrides.url.getter();
  uint64_t v465 = swift_allocObject();
  *(_OWORD *)(v465 + 16) = v1110;
  *(void *)(v465 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v465;
  specialized Array._endMutation()();
  v1066(v1067, v455, v1070);
  uint64_t v466 = v1073;
  uint64_t v467 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v468 = v1065;
  *(void *)(v464 + 56) = v466;
  *(void *)(v464 + 64) = v468;
  *(void *)(v464 + 32) = v467;
  Group.init(title:footer:group:_:)();
  v469 = v1047;
  *((void *)v1047 + 17) = v459;
  *((void *)v469 + 18) = &protocol witness table for Page;
  v470 = v469;
  sub_100015400(v1113);
  Page.init(title:_:)();
  v1037 = (uint64_t *)(v470 + 152);
  uint64_t v471 = swift_allocObject();
  unint64_t v1009 = v471;
  *(_OWORD *)(v471 + 16) = v997;
  uint64_t v1085 = v471 + v463;
  uint64_t v472 = swift_allocObject();
  *(_OWORD *)(v472 + 16) = v1080;
  v1113 = (uint64_t *)static Settings.Welcome.Version.latestCompleted.getter();
  uint64_t v473 = swift_allocObject();
  *(_OWORD *)(v473 + 16) = v1110;
  *(void *)(v473 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v473;
  specialized Array._endMutation()();
  uint64_t v474 = v1107;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  uint64_t v475 = v455;
  uint64_t v476 = v1072;
  v477 = v1061;
  v1061(v1068, v475, v1072);
  uint64_t v478 = v1077;
  uint64_t v479 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v480 = v1060;
  *(void *)(v472 + 56) = v478;
  *(void *)(v472 + 64) = v480;
  *(void *)(v472 + 32) = v479;
  v1113 = (uint64_t *)static Settings.Welcome.Version.debugLatestCompleted.getter();
  uint64_t v481 = swift_allocObject();
  *(_OWORD *)(v481 + 16) = v1110;
  *(void *)(v481 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v481;
  specialized Array._endMutation()();
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v474);
  uint64_t v482 = v1111;
  v477(v1068, v1111, v476);
  unint64_t v1038 = 0xD000000000000016;
  uint64_t v483 = v1077;
  uint64_t v484 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v472 + 96) = v483;
  *(void *)(v472 + 104) = v480;
  *(void *)(v472 + 72) = v484;
  uint64_t v485 = v1085;
  Group.init(title:footer:_:)();
  uint64_t v1049 = v485 + v1081;
  uint64_t v486 = swift_allocObject();
  *(_OWORD *)(v486 + 16) = v1056;
  static Settings.Welcome.Animations.WelcomeToStocksScaleUp.initialScale.getter();
  v487 = v1012;
  _DWORD *v1012 = 1008981770;
  LODWORD(v1113) = enum case for Item.RangeControlType.stepper<A>(_:);
  v488 = (uint64_t *)v1090[13];
  v1090 += 13;
  v1112 = (uint64_t (**)(void))v488;
  ((void (*)(_DWORD *))v488)(v487);
  v489 = v1078;
  uint64_t v490 = v1091;
  v491 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v1078, v482, v1091);
  uint64_t v492 = v1079;
  uint64_t v493 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v494 = v1095;
  *(void *)(v486 + 56) = v492;
  *(void *)(v486 + 64) = v494;
  uint64_t v495 = v494;
  *(void *)(v486 + 32) = v493;
  static Settings.Welcome.Animations.WelcomeToStocksScaleUp.mass.getter();
  _DWORD *v487 = 1036831949;
  ((void (*)(_DWORD *, void, char *))v1112)(v487, v1113, v1089);
  v491(v489, v482, v490);
  v496 = v489;
  uint64_t v497 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v486 + 96) = v492;
  *(void *)(v486 + 104) = v495;
  *(void *)(v486 + 72) = v497;
  v1048 = (uint64_t *)static Settings.Welcome.Animations.WelcomeToStocksScaleUp.damping.getter();
  v498 = v1093;
  uint64_t v499 = v1108;
  uint64_t v500 = v1107;
  v501 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  uint64_t v502 = v1091;
  ((void (*)(char *, void, uint64_t))v1092)(v496, v1111, v1091);
  uint64_t v503 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v504 = v1095;
  *(void *)(v486 + 136) = v492;
  *(void *)(v486 + 144) = v504;
  *(void *)(v486 + 112) = v503;
  static Settings.Welcome.Animations.WelcomeToStocksScaleUp.stiffness.getter();
  v501(v498, v499, v500);
  uint64_t v505 = v1111;
  uint64_t v506 = v502;
  ((void (*)(char *, void, uint64_t))v1092)(v496, v1111, v502);
  v507 = v496;
  uint64_t v508 = v1079;
  uint64_t v509 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v510 = v1095;
  *(void *)(v486 + 176) = v508;
  *(void *)(v486 + 184) = v510;
  *(void *)(v486 + 152) = v509;
  Group.init(title:footer:_:)();
  v1008 = (uint64_t *)(v1085 + v1074);
  uint64_t v511 = swift_allocObject();
  *(_OWORD *)(v511 + 16) = v1064;
  uint64_t v1049 = static Settings.Welcome.Animations.WelcomeToStocksFadeIn.duration.getter();
  _DWORD *v487 = 1036831949;
  uint64_t v512 = v1113;
  v513 = v1089;
  v514 = (uint64_t *)v1112;
  ((void (*)(_DWORD *, void, char *))v1112)(v487, v1113, v1089);
  uint64_t v515 = v506;
  v516 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v507, v505, v515);
  uint64_t v517 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v518 = v1095;
  *(void *)(v511 + 56) = v508;
  *(void *)(v511 + 64) = v518;
  *(void *)(v511 + 32) = v517;
  static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlOneX.getter();
  _DWORD *v487 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v514)(v487, v512, v513);
  v519 = v514;
  v520 = v507;
  v521 = v507;
  uint64_t v522 = v1111;
  uint64_t v523 = v1091;
  v516(v521, v1111, v1091);
  v524 = v520;
  uint64_t v525 = v1079;
  uint64_t v526 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v527 = v1095;
  *(void *)(v511 + 96) = v525;
  *(void *)(v511 + 104) = v527;
  *(void *)(v511 + 72) = v526;
  static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlOneY.getter();
  _DWORD *v487 = 1008981770;
  v528 = v1089;
  ((void (*)(_DWORD *, uint64_t, char *))v519)(v487, v512, v1089);
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v524, v522, v523);
  uint64_t v1049 = 0xEB00000000592031;
  uint64_t v529 = v1079;
  uint64_t v530 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v511 + 136) = v529;
  *(void *)(v511 + 144) = v527;
  *(void *)(v511 + 112) = v530;
  v1007 = (char *)static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlTwoX.getter();
  _DWORD *v487 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v519)(v487, v512, v528);
  v531 = v519;
  v532 = v524;
  uint64_t v533 = v1111;
  v534 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, void, uint64_t))v1092)(v532, v1111, v523);
  v1048 = (uint64_t *)0xEB00000000582032;
  uint64_t v535 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v536 = v1095;
  *(void *)(v511 + 176) = v529;
  *(void *)(v511 + 184) = v536;
  *(void *)(v511 + 152) = v535;
  v1007 = (char *)static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlTwoY.getter();
  _DWORD *v487 = 1008981770;
  ((void (*)(_DWORD *, void, char *))v531)(v487, v1113, v1089);
  v537 = v1078;
  v534(v1078, v533, v523);
  uint64_t v538 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v511 + 216) = v529;
  *(void *)(v511 + 224) = v536;
  *(void *)(v511 + 192) = v538;
  Group.init(title:footer:_:)();
  v1028 = (char *)(v1085 + v1059);
  uint64_t v539 = swift_allocObject();
  *(_OWORD *)(v539 + 16) = v1034;
  static Settings.Welcome.Animations.ActivityIndicatorFadeIn.delay.getter();
  _DWORD *v487 = 1008981770;
  uint64_t v540 = v1113;
  v541 = v1089;
  v542 = (uint64_t *)v1112;
  ((void (*)(_DWORD *, void, char *))v1112)(v487, v1113, v1089);
  v543 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, void, uint64_t))v1092)(v537, v1111, v1091);
  uint64_t v544 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v545 = v1095;
  *(void *)(v539 + 56) = v529;
  *(void *)(v539 + 64) = v545;
  *(void *)(v539 + 32) = v544;
  v1008 = (uint64_t *)static Settings.Welcome.Animations.ActivityIndicatorFadeIn.duration.getter();
  _DWORD *v487 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v542)(v487, v540, v541);
  v546 = v542;
  v547 = v537;
  uint64_t v548 = v1111;
  uint64_t v549 = v1091;
  v543(v547, v1111, v1091);
  uint64_t v550 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v539 + 96) = v529;
  *(void *)(v539 + 104) = v545;
  *(void *)(v539 + 72) = v550;
  v1008 = (uint64_t *)static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlOneX.getter();
  _DWORD *v487 = 1008981770;
  uint64_t v551 = v1113;
  v552 = v1089;
  ((void (*)(_DWORD *, void, char *))v546)(v487, v1113, v1089);
  uint64_t v553 = v548;
  uint64_t v554 = v549;
  uint64_t v555 = v549;
  v556 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v1078, v553, v555);
  uint64_t v557 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v558 = v1095;
  *(void *)(v539 + 136) = v529;
  *(void *)(v539 + 144) = v558;
  *(void *)(v539 + 112) = v557;
  v1008 = (uint64_t *)static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlOneY.getter();
  _DWORD *v487 = 1008981770;
  v559 = (uint64_t *)v1112;
  ((void (*)(_DWORD *, uint64_t, char *))v1112)(v487, v551, v552);
  v560 = v1078;
  uint64_t v561 = v1111;
  v556(v1078, v1111, v554);
  v562 = v560;
  uint64_t v563 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v564 = v1095;
  *(void *)(v539 + 176) = v529;
  *(void *)(v539 + 184) = v564;
  *(void *)(v539 + 152) = v563;
  v1008 = (uint64_t *)static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlTwoX.getter();
  _DWORD *v487 = 1008981770;
  uint64_t v565 = v1113;
  ((void (*)(_DWORD *, void, char *))v559)(v487, v1113, v552);
  v566 = v559;
  v567 = v562;
  v568 = v562;
  uint64_t v569 = v561;
  uint64_t v570 = v1091;
  v571 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v568, v569, v1091);
  uint64_t v572 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v573 = v1095;
  *(void *)(v539 + 216) = v529;
  *(void *)(v539 + 224) = v573;
  *(void *)(v539 + 192) = v572;
  v1008 = (uint64_t *)static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlTwoY.getter();
  _DWORD *v487 = 1008981770;
  uint64_t v574 = v565;
  v575 = v1089;
  ((void (*)(_DWORD *, uint64_t, char *))v566)(v487, v574, v1089);
  v571(v567, v1111, v570);
  uint64_t v576 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v539 + 256) = v529;
  *(void *)(v539 + 264) = v573;
  *(void *)(v539 + 232) = v576;
  Group.init(title:footer:_:)();
  v1028 = (char *)(v1085 + v1053);
  uint64_t v577 = swift_allocObject();
  *(_OWORD *)(v577 + 16) = v1064;
  uint64_t v1027 = static Settings.Welcome.Animations.SpinnerFadeOut.duration.getter();
  _DWORD *v487 = 1036831949;
  uint64_t v578 = v1113;
  v579 = (uint64_t *)v1112;
  ((void (*)(_DWORD *, void, char *))v1112)(v487, v1113, v575);
  uint64_t v580 = v1111;
  uint64_t v581 = v1091;
  v582 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, void, uint64_t))v1092)(v567, v1111, v1091);
  uint64_t v583 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v584 = v1095;
  *(void *)(v577 + 56) = v529;
  *(void *)(v577 + 64) = v584;
  *(void *)(v577 + 32) = v583;
  uint64_t v1027 = static Settings.Welcome.Animations.SpinnerFadeOut.controlOneX.getter();
  _DWORD *v487 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v579)(v487, v578, v1089);
  v585 = v1078;
  v582(v1078, v580, v581);
  v586 = v585;
  uint64_t v587 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v577 + 96) = v529;
  *(void *)(v577 + 104) = v584;
  uint64_t v588 = v584;
  *(void *)(v577 + 72) = v587;
  uint64_t v1027 = static Settings.Welcome.Animations.SpinnerFadeOut.controlOneY.getter();
  _DWORD *v487 = 1008981770;
  v589 = v1089;
  v590 = (uint64_t *)v1112;
  ((void (*)(_DWORD *, void, char *))v1112)(v487, v1113, v1089);
  v582(v586, v1111, v1091);
  uint64_t v591 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v577 + 136) = v529;
  *(void *)(v577 + 144) = v588;
  *(void *)(v577 + 112) = v591;
  static Settings.Welcome.Animations.SpinnerFadeOut.controlTwoX.getter();
  _DWORD *v487 = 1008981770;
  uint64_t v592 = v1113;
  ((void (*)(_DWORD *, void, char *))v590)(v487, v1113, v589);
  uint64_t v593 = v1111;
  uint64_t v594 = v1091;
  v595 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, void, uint64_t))v1092)(v586, v1111, v1091);
  uint64_t v596 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v597 = v1095;
  *(void *)(v577 + 176) = v529;
  *(void *)(v577 + 184) = v597;
  *(void *)(v577 + 152) = v596;
  uint64_t v1027 = static Settings.Welcome.Animations.SpinnerFadeOut.controlTwoY.getter();
  _DWORD *v487 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v1112)(v487, v592, v1089);
  v595(v586, v593, v594);
  uint64_t v598 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v577 + 216) = v529;
  *(void *)(v577 + 224) = v597;
  *(void *)(v577 + 192) = v598;
  Group.init(title:footer:_:)();
  v1031 += v1085;
  uint64_t v599 = swift_allocObject();
  *(_OWORD *)(v599 + 16) = v1064;
  v1028 = (char *)static Settings.Welcome.Animations.AppIconFadeOut.duration.getter();
  _DWORD *v487 = 1036831949;
  v600 = v1089;
  v601 = (uint64_t *)v1112;
  ((void (*)(_DWORD *, uint64_t, char *))v1112)(v487, v592, v1089);
  uint64_t v602 = v1111;
  ((void (*)(char *, void, uint64_t))v1092)(v586, v1111, v594);
  uint64_t v603 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v604 = v1095;
  *(void *)(v599 + 56) = v529;
  *(void *)(v599 + 64) = v604;
  *(void *)(v599 + 32) = v603;
  v1028 = (char *)static Settings.Welcome.Animations.AppIconFadeOut.controlOneX.getter();
  _DWORD *v487 = 1008981770;
  ((void (*)(_DWORD *, void, char *))v601)(v487, v1113, v600);
  v605 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v586, v602, v594);
  v606 = v586;
  uint64_t v607 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v608 = v1095;
  *(void *)(v599 + 96) = v529;
  *(void *)(v599 + 104) = v608;
  *(void *)(v599 + 72) = v607;
  v1028 = (char *)static Settings.Welcome.Animations.AppIconFadeOut.controlOneY.getter();
  _DWORD *v487 = 1008981770;
  uint64_t v609 = v1113;
  v610 = v1089;
  ((void (*)(_DWORD *, void, char *))v601)(v487, v1113, v1089);
  uint64_t v611 = v1111;
  v605(v606, v1111, v594);
  uint64_t v612 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v599 + 136) = v529;
  *(void *)(v599 + 144) = v608;
  *(void *)(v599 + 112) = v612;
  v1028 = (char *)static Settings.Welcome.Animations.AppIconFadeOut.controlTwoX.getter();
  _DWORD *v487 = 1008981770;
  uint64_t v613 = v609;
  uint64_t v614 = v609;
  v615 = (uint64_t *)v1112;
  ((void (*)(_DWORD *, uint64_t, char *))v1112)(v487, v613, v610);
  uint64_t v616 = v1091;
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v606, v611, v1091);
  uint64_t v617 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v618 = v1095;
  *(void *)(v599 + 176) = v529;
  *(void *)(v599 + 184) = v618;
  *(void *)(v599 + 152) = v617;
  v1028 = (char *)static Settings.Welcome.Animations.AppIconFadeOut.controlTwoY.getter();
  _DWORD *v487 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v615)(v487, v614, v1089);
  v619 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, void, uint64_t))v1092)(v606, v1111, v616);
  v620 = v606;
  uint64_t v621 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v599 + 216) = v529;
  *(void *)(v599 + 224) = v618;
  *(void *)(v599 + 192) = v621;
  Group.init(title:footer:_:)();
  v1033 += v1085;
  uint64_t v622 = swift_allocObject();
  *(_OWORD *)(v622 + 16) = v1056;
  uint64_t v1031 = static Settings.Welcome.Animations.Page2Moves.delay.getter();
  _DWORD *v487 = 1008981770;
  uint64_t v623 = v1113;
  v624 = v1089;
  ((void (*)(_DWORD *, void, char *))v615)(v487, v1113, v1089);
  v619(v620, v1111, v1091);
  uint64_t v625 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v626 = v1095;
  *(void *)(v622 + 56) = v529;
  *(void *)(v622 + 64) = v626;
  *(void *)(v622 + 32) = v625;
  uint64_t v1031 = static Settings.Welcome.Animations.Page2Moves.mass.getter();
  _DWORD *v487 = 1036831949;
  ((void (*)(_DWORD *, uint64_t, char *))v615)(v487, v623, v624);
  v627 = v1078;
  uint64_t v628 = v1111;
  uint64_t v629 = v1091;
  v619(v1078, v1111, v1091);
  uint64_t v630 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v622 + 96) = v529;
  *(void *)(v622 + 104) = v626;
  *(void *)(v622 + 72) = v630;
  uint64_t v1031 = static Settings.Welcome.Animations.Page2Moves.damping.getter();
  v631 = v1093;
  uint64_t v632 = v1108;
  v633 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v627, v628, v629);
  uint64_t v634 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v635 = v1095;
  *(void *)(v622 + 136) = v529;
  *(void *)(v622 + 144) = v635;
  *(void *)(v622 + 112) = v634;
  static Settings.Welcome.Animations.Page2Moves.stiffness.getter();
  v633(v631, v632, v1107);
  uint64_t v636 = v1111;
  uint64_t v637 = v1091;
  ((void (*)(char *, void, uint64_t))v1092)(v627, v1111, v1091);
  uint64_t v638 = v1079;
  uint64_t v639 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v622 + 176) = v638;
  *(void *)(v622 + 184) = v635;
  *(void *)(v622 + 152) = v639;
  Group.init(title:footer:_:)();
  uint64_t v1033 = v1085 + v998;
  uint64_t v640 = swift_allocObject();
  *(_OWORD *)(v640 + 16) = v1064;
  static Settings.Welcome.Animations.Page2FadeIns.duration.getter();
  _DWORD *v487 = 1036831949;
  uint64_t v641 = v1113;
  v642 = (uint64_t *)v1112;
  ((void (*)(_DWORD *, void, char *))v1112)(v487, v1113, v1089);
  uint64_t v643 = v636;
  uint64_t v644 = v637;
  uint64_t v645 = v637;
  v646 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v627, v643, v645);
  uint64_t v647 = v1079;
  uint64_t v648 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v649 = v1095;
  *(void *)(v640 + 56) = v647;
  *(void *)(v640 + 64) = v649;
  *(void *)(v640 + 32) = v648;
  static Settings.Welcome.Animations.Page2FadeIns.controlOneX.getter();
  _DWORD *v487 = 1008981770;
  ((void (*)(_DWORD *, uint64_t, char *))v642)(v487, v641, v1089);
  uint64_t v650 = v1111;
  v646(v627, v1111, v644);
  v651 = v627;
  uint64_t v652 = v1079;
  uint64_t v653 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v654 = v1095;
  *(void *)(v640 + 96) = v652;
  *(void *)(v640 + 104) = v654;
  *(void *)(v640 + 72) = v653;
  uint64_t v1031 = static Settings.Welcome.Animations.Page2FadeIns.controlOneY.getter();
  _DWORD *v487 = 1008981770;
  uint64_t v655 = v1113;
  v656 = v1089;
  v657 = (uint64_t *)v1112;
  ((void (*)(_DWORD *, void, char *))v1112)(v487, v1113, v1089);
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v627, v650, v1091);
  uint64_t v658 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v640 + 136) = v652;
  *(void *)(v640 + 144) = v654;
  *(void *)(v640 + 112) = v658;
  uint64_t v1031 = static Settings.Welcome.Animations.Page2FadeIns.controlTwoX.getter();
  _DWORD *v487 = 1008981770;
  v659 = v656;
  ((void (*)(_DWORD *, uint64_t, char *))v657)(v487, v655, v656);
  uint64_t v660 = v1111;
  uint64_t v661 = v1091;
  v662 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, void, uint64_t))v1092)(v651, v1111, v1091);
  uint64_t v663 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v640 + 176) = v652;
  *(void *)(v640 + 184) = v654;
  *(void *)(v640 + 152) = v663;
  uint64_t v1031 = static Settings.Welcome.Animations.Page2FadeIns.controlTwoY.getter();
  _DWORD *v487 = 1008981770;
  ((void (*)(_DWORD *, void, char *))v1112)(v487, v1113, v659);
  v662(v651, v660, v661);
  v664 = v651;
  uint64_t v665 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v640 + 216) = v652;
  *(void *)(v640 + 224) = v654;
  *(void *)(v640 + 192) = v665;
  Group.init(title:footer:_:)();
  v1085 += v1032;
  uint64_t v666 = swift_allocObject();
  *(_OWORD *)(v666 + 16) = v1064;
  *(void *)&long long v1064 = static Settings.Welcome.Animations.DismissFade.duration.getter();
  _DWORD *v487 = 1036831949;
  uint64_t v667 = v1113;
  v668 = v1089;
  ((void (*)(_DWORD *, void, char *))v1112)(v487, v1113, v1089);
  v669 = v651;
  uint64_t v670 = v1111;
  uint64_t v671 = v1091;
  v672 = (void (*)(void, void, void))v1092;
  ((void (*)(char *, void, uint64_t))v1092)(v669, v1111, v1091);
  uint64_t v673 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v674 = v1095;
  *(void *)(v666 + 56) = v652;
  *(void *)(v666 + 64) = v674;
  *(void *)(v666 + 32) = v673;
  *(void *)&long long v1064 = static Settings.Welcome.Animations.DismissFade.controlOneX.getter();
  _DWORD *v487 = 1008981770;
  v675 = v668;
  v676 = (uint64_t *)v1112;
  ((void (*)(_DWORD *, uint64_t, char *))v1112)(v487, v667, v675);
  v672(v664, v670, v671);
  uint64_t v677 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v678 = v1095;
  *(void *)(v666 + 96) = v652;
  *(void *)(v666 + 104) = v678;
  *(void *)(v666 + 72) = v677;
  static Settings.Welcome.Animations.DismissFade.controlOneY.getter();
  _DWORD *v487 = 1008981770;
  v679 = v1089;
  ((void (*)(_DWORD *, uint64_t, char *))v676)(v487, v667, v1089);
  uint64_t v680 = v1111;
  v672(v664, v1111, v1091);
  uint64_t v681 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v666 + 136) = v652;
  *(void *)(v666 + 144) = v678;
  *(void *)(v666 + 112) = v681;
  *(void *)&long long v1064 = static Settings.Welcome.Animations.DismissFade.controlTwoX.getter();
  _DWORD *v487 = 1008981770;
  v682 = v679;
  v683 = (uint64_t *)v1112;
  ((void (*)(_DWORD *, void, char *))v1112)(v487, v1113, v682);
  uint64_t v684 = v680;
  uint64_t v685 = v1091;
  v672(v664, v684, v1091);
  uint64_t v686 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v666 + 176) = v652;
  *(void *)(v666 + 184) = v678;
  *(void *)(v666 + 152) = v686;
  static Settings.Welcome.Animations.DismissFade.controlTwoY.getter();
  _DWORD *v487 = 1008981770;
  ((void (*)(_DWORD *, void, char *))v683)(v487, v1113, v1089);
  v672(v664, v1111, v685);
  uint64_t v687 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v666 + 216) = v652;
  *(void *)(v666 + 224) = v678;
  *(void *)(v666 + 192) = v687;
  Group.init(title:footer:_:)();
  v688 = v1047;
  *((void *)v1047 + 22) = v1088;
  *((void *)v688 + 23) = &protocol witness table for Page;
  sub_100015400(v1037);
  Page.init(title:_:)();
  Group.init(title:footer:_:)();
  v1089 = (char *)(v1044 + v1059);
  uint64_t v689 = swift_allocObject();
  *(_OWORD *)(v689 + 16) = xmmword_100044570;
  v690 = v1013;
  static SettingsBundle.ads.getter();
  uint64_t v691 = v1040;
  *(void *)(v689 + 56) = v1040;
  *(void *)(v689 + 64) = &protocol witness table for SettingsBundle;
  v1112 = (uint64_t (**)(void))v689;
  sub_100015400((uint64_t *)(v689 + 32));
  SettingsBundle.callAsFunction(title:additionalGroups:)();
  (*(void (**)(char *, uint64_t))(v1014 + 8))(v690, v691);
  uint64_t v1085 = v689 + 72;
  uint64_t v692 = swift_allocObject();
  v1090 = (uint64_t *)v692;
  *(_OWORD *)(v692 + 16) = v1080;
  *(void *)&long long v1064 = v692 + v1082;
  uint64_t v693 = swift_allocObject();
  *(_OWORD *)(v693 + 16) = v1063;
  sub_10003D000();
  uint64_t v695 = v694;
  static Settings.AppConfiguration.source.getter();
  uint64_t v696 = swift_allocObject();
  *(_OWORD *)(v696 + 16) = v1110;
  *(void *)(v696 + 32) = qword_100056910;
  *(void *)&long long v1115 = v696;
  specialized Array._endMutation()();
  uint64_t v697 = v1111;
  (*(void (**)(char *, void, uint64_t))(v1015 + 104))(v1017, v1111, v1016);
  sub_10003D1BC(&qword_1000553B8, (void (*)(uint64_t))&type metadata accessor for AppConfigurationSource);
  swift_retain();
  uint64_t v698 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v693 + 56) = v695;
  *(void *)(v693 + 64) = sub_10003D1BC(&qword_1000553C0, (void (*)(uint64_t))sub_10003D000);
  *(void *)(v693 + 32) = v698;
  static Settings.AppConfiguration.ignoreCache.getter();
  v699 = v1093;
  v700 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  uint64_t v701 = v1102;
  v702 = v1097;
  v1097(v1105, v697, v1102);
  uint64_t v703 = v1109;
  uint64_t v704 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v705 = v1098;
  *(void *)(v693 + 96) = v703;
  *(void *)(v693 + 104) = v705;
  *(void *)(v693 + 72) = v704;
  uint64_t v1059 = static Settings.AppConfiguration.disableABTesting.getter();
  uint64_t v706 = swift_allocObject();
  *(_OWORD *)(v706 + 16) = v1110;
  *(void *)(v706 + 32) = qword_100056910;
  *(void *)&long long v1115 = v706;
  specialized Array._endMutation()();
  v700(v699, v1108, v1107);
  uint64_t v707 = v1111;
  v702(v1105, v1111, v701);
  swift_retain();
  uint64_t v708 = v1109;
  uint64_t v709 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v693 + 136) = v708;
  *(void *)(v693 + 144) = v705;
  *(void *)(v693 + 112) = v709;
  uint64_t v710 = v1064;
  Group.init(title:footer:_:)();
  uint64_t v1059 = v710 + v1081;
  *(void *)&long long v1064 = static Settings.AppConfiguration.enableSegmentationOverrides.getter();
  uint64_t v711 = swift_allocObject();
  *(_OWORD *)(v711 + 16) = v1063;
  static Settings.AppConfiguration.overrideUserID.getter();
  uint64_t v712 = swift_allocObject();
  *(_OWORD *)(v712 + 16) = v1110;
  *(void *)(v712 + 32) = qword_100056910;
  *(void *)&long long v1115 = v712;
  specialized Array._endMutation()();
  v713 = v1067;
  uint64_t v714 = v1070;
  v715 = v1066;
  v1066(v1067, v707, v1070);
  swift_retain();
  v716 = v713;
  uint64_t v717 = v1073;
  uint64_t v718 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v719 = v1065;
  *(void *)(v711 + 56) = v717;
  *(void *)(v711 + 64) = v719;
  *(void *)(v711 + 32) = v718;
  uint64_t v1049 = static Settings.AppConfiguration.overrideSegmentSetIDs.getter();
  uint64_t v720 = swift_allocObject();
  *(_OWORD *)(v720 + 16) = v1110;
  *(void *)(v720 + 32) = qword_100056910;
  *(void *)&long long v1115 = v720;
  specialized Array._endMutation()();
  v715(v716, v1111, v714);
  v721 = v715;
  swift_retain();
  uint64_t v722 = v1073;
  uint64_t v723 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v711 + 96) = v722;
  *(void *)(v711 + 104) = v719;
  uint64_t v724 = v719;
  *(void *)(v711 + 72) = v723;
  uint64_t v1049 = static Settings.AppConfiguration.additionalSegmentSetIDs.getter();
  uint64_t v725 = swift_allocObject();
  *(_OWORD *)(v725 + 16) = v1110;
  *(void *)(v725 + 32) = qword_100056910;
  *(void *)&long long v1115 = v725;
  specialized Array._endMutation()();
  uint64_t v726 = v1111;
  v721(v716, v1111, v714);
  swift_retain();
  uint64_t v727 = v1073;
  uint64_t v728 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v711 + 136) = v727;
  *(void *)(v711 + 144) = v724;
  *(void *)(v711 + 112) = v728;
  Group.init(title:footer:group:_:)();
  v729 = v1112;
  v1112[12] = (uint64_t (*)(void))v1088;
  v729[13] = (uint64_t (*)(void))&protocol witness table for Page;
  v730 = v729;
  sub_100015400((uint64_t *)v1085);
  Page.init(title:_:)();
  uint64_t v1085 = (uint64_t)(v730 + 14);
  uint64_t v731 = swift_allocObject();
  v1090 = (uint64_t *)v731;
  *(_OWORD *)(v731 + 16) = v1101;
  *(void *)&long long v1064 = v731 + v1082;
  uint64_t v732 = swift_allocObject();
  *(_OWORD *)(v732 + 16) = v1080;
  static Settings.ForYou.Card.systemDetents.getter();
  uint64_t v733 = v1108;
  uint64_t v734 = v1107;
  v735 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  uint64_t v736 = v726;
  uint64_t v737 = v1102;
  v1097(v1105, v736, v1102);
  uint64_t v738 = v1109;
  uint64_t v739 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v740 = v1098;
  *(void *)(v732 + 56) = v738;
  *(void *)(v732 + 64) = v740;
  *(void *)(v732 + 32) = v739;
  uint64_t v1059 = static Settings.StockFeed.Card.swipeToDismiss.getter();
  uint64_t v741 = swift_allocObject();
  *(_OWORD *)(v741 + 16) = v1110;
  *(void *)(v741 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v741;
  specialized Array._endMutation()();
  v735(v1093, v733, v734);
  v742 = v1097;
  v1097(v1105, v1111, v737);
  uint64_t v743 = v1109;
  uint64_t v744 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v732 + 96) = v743;
  *(void *)(v732 + 104) = v740;
  *(void *)(v732 + 72) = v744;
  Group.init(title:footer:_:)();
  uint64_t v745 = v1088;
  v746 = v1112;
  v1112[17] = (uint64_t (*)(void))v1088;
  v746[18] = (uint64_t (*)(void))&protocol witness table for Page;
  v747 = v746;
  sub_100015400((uint64_t *)v1085);
  Page.init(title:_:)();
  v1090 = (uint64_t *)(v747 + 19);
  uint64_t v748 = swift_allocObject();
  *(_OWORD *)(v748 + 16) = v1101;
  uint64_t v749 = v1082;
  uint64_t v1085 = v748 + v1082;
  uint64_t v750 = swift_allocObject();
  *(_OWORD *)(v750 + 16) = v1101;
  static Settings.CompositionalList.useDiffableDataSource.getter();
  uint64_t v751 = swift_allocObject();
  *(_OWORD *)(v751 + 16) = v1110;
  *(void *)(v751 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v751;
  specialized Array._endMutation()();
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  v742(v1105, v1111, v1102);
  uint64_t v752 = v1109;
  uint64_t v753 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v754 = v1098;
  *(void *)(v750 + 56) = v752;
  *(void *)(v750 + 64) = v754;
  *(void *)(v750 + 32) = v753;
  Group.init(title:footer:_:)();
  v755 = v1112;
  v1112[22] = (uint64_t (*)(void))v745;
  v755[23] = (uint64_t (*)(void))&protocol witness table for Page;
  v756 = v755;
  sub_100015400(v1090);
  Page.init(title:_:)();
  v1090 = (uint64_t *)(v756 + 24);
  uint64_t v757 = swift_allocObject();
  uint64_t v1085 = v757;
  *(_OWORD *)(v757 + 16) = v1101;
  uint64_t v1059 = v757 + v749;
  *(void *)&long long v1064 = static Settings.Earnings.configOverrides.getter();
  uint64_t v758 = swift_allocObject();
  *(_OWORD *)(v758 + 16) = v1080;
  type metadata accessor for Settings.Earnings.ConfigOverrides();
  static Settings.Earnings.ConfigOverrides.earningsStartDate.getter();
  static Item.RangeControlType.slider.getter();
  v759 = v1068;
  uint64_t v760 = v1111;
  uint64_t v761 = v1072;
  v762 = v1061;
  v1061(v1068, v1111, v1072);
  uint64_t v763 = v1077;
  uint64_t v764 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v765 = v1060;
  *(void *)(v758 + 56) = v763;
  *(void *)(v758 + 64) = v765;
  *(void *)(v758 + 32) = v764;
  static Settings.Earnings.ConfigOverrides.earningsEndDate.getter();
  static Item.RangeControlType.slider.getter();
  v762(v759, v760, v761);
  uint64_t v766 = v1077;
  uint64_t v767 = Item<>.init(_:label:resetBehavior:type:)();
  *(void *)(v758 + 96) = v766;
  *(void *)(v758 + 104) = v765;
  *(void *)(v758 + 72) = v767;
  Group.init(title:footer:group:_:)();
  v768 = v1112;
  v1112[27] = (uint64_t (*)(void))v1088;
  v768[28] = (uint64_t (*)(void))&protocol witness table for Page;
  v769 = v768;
  sub_100015400(v1090);
  Page.init(title:_:)();
  v1090 = (uint64_t *)(v769 + 29);
  uint64_t v770 = swift_allocObject();
  *(void *)&long long v1064 = v770;
  *(_OWORD *)(v770 + 16) = v1080;
  uint64_t v1085 = v770 + v1082;
  uint64_t v771 = swift_allocObject();
  *(_OWORD *)(v771 + 16) = v1080;
  static Settings.NewsFeedModule.Layout.enableVisualDebugging.getter();
  v772 = v1093;
  uint64_t v773 = v1108;
  v774 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  uint64_t v775 = v760;
  uint64_t v776 = v1102;
  v777 = v1097;
  v1097(v1105, v775, v1102);
  uint64_t v778 = v1109;
  uint64_t v779 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v780 = v1098;
  *(void *)(v771 + 56) = v778;
  *(void *)(v771 + 64) = v780;
  *(void *)(v771 + 32) = v779;
  uint64_t v1059 = static Settings.NewsFeedModule.Layout.enableLogDebugging.getter();
  uint64_t v781 = swift_allocObject();
  *(_OWORD *)(v781 + 16) = v1110;
  *(void *)(v781 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v781;
  specialized Array._endMutation()();
  v774(v772, v773, v1107);
  v782 = v1105;
  v777(v1105, v1111, v776);
  v783 = v782;
  uint64_t v784 = v1109;
  uint64_t v785 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v771 + 96) = v784;
  *(void *)(v771 + 104) = v780;
  uint64_t v786 = v784;
  *(void *)(v771 + 72) = v785;
  uint64_t v787 = v1085;
  Group.init(title:footer:_:)();
  uint64_t v1059 = v787 + v1081;
  uint64_t v788 = swift_allocObject();
  *(_OWORD *)(v788 + 16) = v1034;
  static Settings.NewsFeedModule.Format.ignorePackageCache.getter();
  uint64_t v789 = swift_allocObject();
  *(_OWORD *)(v789 + 16) = v1110;
  *(void *)(v789 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v789;
  specialized Array._endMutation()();
  v774(v772, v1108, v1107);
  uint64_t v790 = v1111;
  v777(v783, v1111, v1102);
  uint64_t v791 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v788 + 56) = v786;
  *(void *)(v788 + 64) = v780;
  *(void *)(v788 + 32) = v791;
  static Settings.NewsFeedModule.Debug.Format.host.getter();
  v792 = v1067;
  uint64_t v793 = v790;
  uint64_t v794 = v1070;
  v795 = v1066;
  v1066(v1067, v790, v1070);
  v796 = v792;
  uint64_t v797 = v1073;
  uint64_t v798 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v799 = v1065;
  *(void *)(v788 + 96) = v797;
  *(void *)(v788 + 104) = v799;
  *(void *)(v788 + 72) = v798;
  static Settings.NewsFeedModule.Debug.Format.port.getter();
  v795(v796, v793, v794);
  uint64_t v800 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v788 + 136) = v797;
  *(void *)(v788 + 144) = v799;
  *(void *)(v788 + 112) = v800;
  uint64_t v1085 = static Settings.NewsFeedModule.Format.loadPackagesFromDebugServerDropbox.getter();
  uint64_t v801 = swift_allocObject();
  *(_OWORD *)(v801 + 16) = v1110;
  *(void *)(v801 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v801;
  specialized Array._endMutation()();
  v802 = v1093;
  uint64_t v803 = v1108;
  uint64_t v804 = v1107;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  v1097(v1105, v793, v1102);
  v805 = v802;
  uint64_t v806 = v1109;
  uint64_t v807 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v808 = v1098;
  *(void *)(v788 + 176) = v806;
  *(void *)(v788 + 184) = v808;
  *(void *)(v788 + 152) = v807;
  uint64_t v1049 = static Settings.NewsFeedModule.Format.prefetchWebArchives.getter();
  uint64_t v809 = swift_allocObject();
  *(_OWORD *)(v809 + 16) = v1110;
  *(void *)(v809 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v809;
  specialized Array._endMutation()();
  v1048 = (uint64_t *)v1115;
  v810 = v805;
  v811 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, uint64_t, uint64_t))v1103)(v805, v803, v804);
  uint64_t v812 = v1111;
  uint64_t v813 = v1102;
  v814 = v1097;
  v1097(v1105, v1111, v1102);
  uint64_t v1085 = 0xD000000000000024;
  v815 = v810;
  uint64_t v816 = v1109;
  uint64_t v817 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v788 + 216) = v816;
  *(void *)(v788 + 224) = v808;
  *(void *)(v788 + 192) = v817;
  uint64_t v1049 = static Settings.NewsFeedModule.Format.prefetchDataResources.getter();
  uint64_t v818 = swift_allocObject();
  *(_OWORD *)(v818 + 16) = v1110;
  *(void *)(v818 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v818;
  specialized Array._endMutation()();
  v819 = v815;
  v820 = v815;
  uint64_t v821 = v1108;
  v811(v820, v1108, v1107);
  v822 = v1105;
  v814(v1105, v812, v813);
  v823 = v819;
  uint64_t v824 = v1109;
  uint64_t v825 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v826 = v1098;
  *(void *)(v788 + 256) = v824;
  *(void *)(v788 + 264) = v826;
  *(void *)(v788 + 232) = v825;
  Group.init(title:footer:_:)();
  v827 = v1112;
  v1112[32] = (uint64_t (*)(void))v1088;
  v827[33] = (uint64_t (*)(void))&protocol witness table for Page;
  v828 = v827;
  sub_100015400(v1090);
  Page.init(title:_:)();
  uint64_t v1059 = (uint64_t)(v828 + 34);
  uint64_t v829 = swift_allocObject();
  *(void *)&long long v1064 = v829;
  *(_OWORD *)(v829 + 16) = v1063;
  v1090 = (uint64_t *)(v829 + v1082);
  uint64_t v830 = swift_allocObject();
  *(_OWORD *)(v830 + 16) = v1056;
  static Settings.MarketData.freezeQuotes.getter();
  uint64_t v831 = v1107;
  v832 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, uint64_t, uint64_t))v1103)(v823, v821, v1107);
  uint64_t v833 = v1111;
  v834 = v1097;
  v1097(v822, v1111, v1102);
  uint64_t v835 = v1109;
  uint64_t v836 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v837 = v1098;
  *(void *)(v830 + 56) = v835;
  *(void *)(v830 + 64) = v837;
  *(void *)(v830 + 32) = v836;
  static Settings.MarketData.freezeQuoteDetails.getter();
  v832(v823, v1108, v831);
  uint64_t v838 = v833;
  uint64_t v839 = v1102;
  v834(v822, v833, v1102);
  v840 = v822;
  uint64_t v841 = v1109;
  uint64_t v842 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v843 = v1098;
  *(void *)(v830 + 96) = v841;
  *(void *)(v830 + 104) = v843;
  *(void *)(v830 + 72) = v842;
  static Settings.MarketData.freezeSparklines.getter();
  uint64_t v844 = v1108;
  v845 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v823, v1108, v1107);
  v846 = v1097;
  v1097(v840, v838, v839);
  uint64_t v847 = v1109;
  uint64_t v848 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v830 + 136) = v847;
  *(void *)(v830 + 144) = v843;
  *(void *)(v830 + 112) = v848;
  static Settings.MarketData.freezeCharts.getter();
  uint64_t v849 = v844;
  uint64_t v850 = v1107;
  v845(v823, v849, v1107);
  v846(v1105, v1111, v839);
  v851 = v823;
  uint64_t v852 = v1109;
  uint64_t v853 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v830 + 176) = v852;
  *(void *)(v830 + 184) = v843;
  *(void *)(v830 + 152) = v853;
  v854 = v1090;
  Group.init(title:footer:_:)();
  *(void *)&long long v1056 = (char *)v854 + v1081;
  uint64_t v855 = swift_allocObject();
  *(_OWORD *)(v855 + 16) = v1080;
  static Settings.Refreshing.MarketData.overrideEnabled.getter();
  v856 = v823;
  uint64_t v857 = v1108;
  uint64_t v858 = v850;
  v845(v856, v1108, v850);
  uint64_t v859 = v1111;
  v1097(v1105, v1111, v1102);
  uint64_t v860 = v1109;
  uint64_t v861 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v862 = v1098;
  *(void *)(v855 + 56) = v860;
  *(void *)(v855 + 64) = v862;
  *(void *)(v855 + 32) = v861;
  static Settings.Refreshing.MarketData.overrideInterval.getter();
  v845(v851, v857, v858);
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v1078, v859, v1091);
  uint64_t v863 = v1079;
  uint64_t v864 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v865 = v1095;
  *(void *)(v855 + 96) = v863;
  *(void *)(v855 + 104) = v865;
  *(void *)(v855 + 72) = v864;
  Group.init(title:footer:_:)();
  uint64_t v866 = swift_allocObject();
  *(_OWORD *)(v866 + 16) = v1101;
  static Settings.MarketData.simulatePremarketData.getter();
  v845(v851, v1108, v858);
  v867 = v1105;
  v1097(v1105, v859, v1102);
  uint64_t v868 = v1109;
  uint64_t v869 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v870 = v1098;
  *(void *)(v866 + 56) = v868;
  *(void *)(v866 + 64) = v870;
  *(void *)(v866 + 32) = v869;
  Group.init(title:footer:_:)();
  v871 = v1112;
  v1112[37] = (uint64_t (*)(void))v1088;
  v871[38] = (uint64_t (*)(void))&protocol witness table for Page;
  sub_100015400((uint64_t *)v1059);
  Page.init(title:_:)();
  v871[42] = (uint64_t (*)(void))type metadata accessor for If();
  v871[43] = (uint64_t (*)(void))&protocol witness table for If;
  sub_100015400((uint64_t *)v871 + 39);
  If.init(_:_:)();
  v1090 = (uint64_t *)(v871 + 44);
  uint64_t v872 = swift_allocObject();
  *(void *)&long long v1064 = v872;
  *(_OWORD *)(v872 + 16) = v1101;
  uint64_t v1059 = v872 + v1082;
  uint64_t v873 = swift_allocObject();
  *(_OWORD *)(v873 + 16) = v1080;
  static Settings.AppLaunch.disableAppLaunchOnboarding.getter();
  uint64_t v874 = v1108;
  uint64_t v875 = v858;
  uint64_t v876 = v858;
  v877 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v851, v1108, v876);
  uint64_t v878 = v1111;
  v879 = v1097;
  v1097(v867, v1111, v1102);
  uint64_t v880 = v1109;
  uint64_t v881 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v882 = v1098;
  *(void *)(v873 + 56) = v880;
  *(void *)(v873 + 64) = v882;
  *(void *)(v873 + 32) = v881;
  static Settings.AppLaunch.showPersonalizedAdsOnNextLaunch.getter();
  v877(v1093, v874, v875);
  v879(v1105, v878, v1102);
  uint64_t v883 = v1109;
  uint64_t v884 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v873 + 96) = v883;
  *(void *)(v873 + 104) = v882;
  *(void *)(v873 + 72) = v884;
  Group.init(title:footer:_:)();
  v885 = v1112;
  uint64_t v886 = v1088;
  v1112[47] = (uint64_t (*)(void))v1088;
  v885[48] = (uint64_t (*)(void))&protocol witness table for Page;
  sub_100015400(v1090);
  Page.init(title:_:)();
  v1090 = (uint64_t *)(v885 + 49);
  uint64_t v887 = swift_allocObject();
  *(_OWORD *)(v887 + 16) = v1101;
  uint64_t v888 = v1082;
  uint64_t v1085 = v887 + v1082;
  uint64_t v889 = swift_allocObject();
  *(_OWORD *)(v889 + 16) = v1101;
  static Settings.ForYouFeedMasthead.premiumSealEnabled.getter();
  uint64_t v890 = swift_allocObject();
  *(_OWORD *)(v890 + 16) = v1110;
  *(void *)(v890 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v890;
  specialized Array._endMutation()();
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  v1097(v1105, v1111, v1102);
  uint64_t v891 = v1109;
  uint64_t v892 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v893 = v1098;
  *(void *)(v889 + 56) = v891;
  *(void *)(v889 + 64) = v893;
  *(void *)(v889 + 32) = v892;
  Group.init(title:footer:_:)();
  v894 = v1112;
  v1112[52] = (uint64_t (*)(void))v886;
  v894[53] = (uint64_t (*)(void))&protocol witness table for Page;
  sub_100015400(v1090);
  Page.init(title:_:)();
  v1090 = (uint64_t *)(v894 + 54);
  uint64_t v895 = swift_allocObject();
  *(_OWORD *)(v895 + 16) = v1101;
  uint64_t v1085 = v895 + v888;
  uint64_t v896 = swift_allocObject();
  *(_OWORD *)(v896 + 16) = v1101;
  static Settings.Engagement.Presentation.disableAllPresentations.getter();
  uint64_t v897 = swift_allocObject();
  *(_OWORD *)(v897 + 16) = v1110;
  *(void *)(v897 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v897;
  specialized Array._endMutation()();
  v898 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  v1097(v1105, v1111, v1102);
  uint64_t v899 = v1109;
  uint64_t v900 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v901 = v1098;
  *(void *)(v896 + 56) = v899;
  *(void *)(v896 + 64) = v901;
  *(void *)(v896 + 32) = v900;
  Group.init(title:footer:_:)();
  v902 = v1112;
  v903 = (uint64_t (*)(void))v1088;
  v1112[57] = (uint64_t (*)(void))v1088;
  v902[58] = (uint64_t (*)(void))&protocol witness table for Page;
  sub_100015400(v1090);
  Page.init(title:_:)();
  v1090 = (uint64_t *)(v902 + 59);
  uint64_t v904 = swift_allocObject();
  *(_OWORD *)(v904 + 16) = v1101;
  uint64_t v1085 = v904 + v1082;
  uint64_t v905 = swift_allocObject();
  *(_OWORD *)(v905 + 16) = v1101;
  static Settings.PrivateData.simulateNewsSyncingEnabled.getter();
  uint64_t v906 = swift_allocObject();
  *(_OWORD *)(v906 + 16) = v1110;
  *(void *)(v906 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v906;
  specialized Array._endMutation()();
  v898(v1093, v1108, v1107);
  v907 = v1105;
  uint64_t v908 = v1111;
  v1097(v1105, v1111, v1102);
  v909 = v907;
  uint64_t v910 = v1109;
  uint64_t v911 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v912 = v1098;
  *(void *)(v905 + 56) = v910;
  *(void *)(v905 + 64) = v912;
  *(void *)(v905 + 32) = v911;
  Group.init(title:footer:_:)();
  v902[62] = v903;
  v902[63] = (uint64_t (*)(void))&protocol witness table for Page;
  sub_100015400(v1090);
  Page.init(title:_:)();
  sub_10003D094();
  v914 = v913;
  static Settings.DataSource.stocksDataServiceEnabled.getter();
  uint64_t v915 = swift_allocObject();
  *(_OWORD *)(v915 + 16) = v1110;
  *(void *)(v915 + 32) = static SettingActions.restart.getter();
  *(void *)&long long v1115 = v915;
  specialized Array._endMutation()();
  (*(void (**)(char *, uint64_t, uint64_t))(v1018 + 104))(v1020, v908, v1019);
  sub_10003D1BC(&qword_1000553D0, (void (*)(uint64_t))&type metadata accessor for StocksDataServiceEnablement);
  uint64_t v916 = Item<>.init(_:label:resetBehavior:actions:)();
  v902[67] = v914;
  v902[68] = (uint64_t (*)(void))sub_10003D1BC(&qword_1000553D8, (void (*)(uint64_t))sub_10003D094);
  v902[64] = (uint64_t (*)(void))v916;
  v1096 = (uint64_t *)(v902 + 69);
  uint64_t v917 = swift_allocObject();
  *(void *)&long long v1110 = v917;
  *(_OWORD *)(v917 + 16) = v1080;
  v1094 = (uint64_t *)(v917 + v1082);
  uint64_t v918 = swift_allocObject();
  *(_OWORD *)(v918 + 16) = v1063;
  static Settings.Widget.demoMode.getter();
  uint64_t v919 = v1108;
  uint64_t v920 = v1107;
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  uint64_t v921 = v908;
  uint64_t v922 = v1102;
  v1097(v909, v908, v1102);
  uint64_t v923 = v1109;
  uint64_t v924 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v925 = v1098;
  *(void *)(v918 + 56) = v923;
  *(void *)(v918 + 64) = v925;
  *(void *)(v918 + 32) = v924;
  v1090 = (uint64_t *)static Settings.Widget.dumpEntries.getter();
  v926 = v1093;
  uint64_t v927 = v919;
  v928 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, uint64_t, uint64_t))v1103)(v1093, v927, v920);
  v1097(v1105, v921, v922);
  uint64_t v929 = v1109;
  uint64_t v930 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v918 + 96) = v929;
  *(void *)(v918 + 104) = v925;
  *(void *)(v918 + 72) = v930;
  static Settings.Widget.entryInterval.getter();
  v928(v926, v1108, v920);
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v1078, v921, v1091);
  uint64_t v931 = v1079;
  uint64_t v932 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v933 = v1095;
  *(void *)(v918 + 136) = v931;
  *(void *)(v918 + 144) = v933;
  *(void *)(v918 + 112) = v932;
  Group.init(title:footer:_:)();
  uint64_t v934 = swift_allocObject();
  *(_OWORD *)(v934 + 16) = v1080;
  static Settings.Features.widgetSpecificConfig.getter();
  v1055(v1046, v921, v1058);
  uint64_t v935 = v1076;
  uint64_t v936 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v937 = v1054;
  *(void *)(v934 + 56) = v935;
  *(void *)(v934 + 64) = v937;
  *(void *)(v934 + 32) = v936;
  static Settings.News.overrideWidgetSectionConfigID.getter();
  v1066(v1067, v921, v1070);
  uint64_t v938 = v1073;
  uint64_t v939 = Item<>.init(_:label:resetBehavior:actions:)();
  uint64_t v940 = v1065;
  *(void *)(v934 + 96) = v938;
  *(void *)(v934 + 104) = v940;
  *(void *)(v934 + 72) = v939;
  Group.init(title:footer:_:)();
  v941 = (uint64_t (*)(void))v1088;
  v942 = v1112;
  v1112[72] = (uint64_t (*)(void))v1088;
  v942[73] = (uint64_t (*)(void))&protocol witness table for Page;
  sub_100015400(v1096);
  Page.init(title:_:)();
  v942[77] = v941;
  v942[78] = (uint64_t (*)(void))&protocol witness table for Page;
  sub_100015400((uint64_t *)v942 + 74);
  Page.init(title:_:)();
  v1094 = (uint64_t *)(v942 + 79);
  uint64_t v943 = swift_allocObject();
  v1096 = (uint64_t *)v943;
  *(_OWORD *)(v943 + 16) = v1063;
  *(void *)&long long v1110 = v943 + v1082;
  uint64_t v944 = swift_allocObject();
  *(_OWORD *)(v944 + 16) = v1080;
  static Settings.Tips.savedViaFeed.getter();
  v945 = v926;
  uint64_t v946 = v1108;
  uint64_t v947 = v1107;
  v948 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v926, v1108, v1107);
  uint64_t v949 = v921;
  uint64_t v950 = v1102;
  v951 = v1097;
  v1097(v1105, v949, v1102);
  uint64_t v952 = v1109;
  uint64_t v953 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v954 = v1098;
  *(void *)(v944 + 56) = v952;
  *(void *)(v944 + 64) = v954;
  *(void *)(v944 + 32) = v953;
  static Settings.Tips.savedViaArticleViewer.getter();
  v948(v926, v946, v947);
  v955 = v1105;
  v951(v1105, v1111, v950);
  v956 = v955;
  uint64_t v957 = v1109;
  uint64_t v958 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v944 + 96) = v957;
  *(void *)(v944 + 104) = v954;
  *(void *)(v944 + 72) = v958;
  uint64_t v959 = v1110;
  Group.init(title:footer:_:)();
  v1090 = (uint64_t *)(v959 + v1081);
  uint64_t v960 = swift_allocObject();
  *(_OWORD *)(v960 + 16) = v1080;
  uint64_t v1085 = static Settings.Tips.audioQueuedViaFeed.getter();
  uint64_t v961 = v1108;
  v962 = (void (*)(void, void, void))v1103;
  ((void (*)(char *, void, uint64_t))v1103)(v945, v1108, v947);
  v963 = v956;
  uint64_t v964 = v1111;
  uint64_t v965 = v1102;
  v966 = v1097;
  v1097(v963, v1111, v1102);
  uint64_t v967 = v1109;
  uint64_t v968 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v969 = v1098;
  *(void *)(v960 + 56) = v967;
  *(void *)(v960 + 64) = v969;
  *(void *)(v960 + 32) = v968;
  uint64_t v1085 = static Settings.Tips.audioQueuedViaArticleViewer.getter();
  v970 = v1093;
  v962(v1093, v961, v1107);
  v966(v1105, v964, v965);
  v971 = v970;
  uint64_t v972 = v1109;
  uint64_t v973 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v960 + 96) = v972;
  *(void *)(v960 + 104) = v969;
  *(void *)(v960 + 72) = v973;
  Group.init(title:footer:_:)();
  *(void *)&long long v1110 = static Settings.Tips.Earnings.configOverrides.getter();
  uint64_t v974 = swift_allocObject();
  *(_OWORD *)(v974 + 16) = v1080;
  type metadata accessor for Settings.Tips.Earnings.ConfigOverrides();
  static Settings.Tips.Earnings.ConfigOverrides.tipMaxPresentedCount.getter();
  v975 = v1039;
  _DWORD *v1039 = 1065353216;
  (*(void (**)(_DWORD *, void, uint64_t))(v1022 + 104))(v975, v1113, v1023);
  v1061(v1068, v964, v1072);
  uint64_t v976 = v1077;
  uint64_t v977 = Item<>.init(_:label:resetBehavior:type:)();
  uint64_t v978 = v1060;
  *(void *)(v974 + 56) = v976;
  *(void *)(v974 + 64) = v978;
  *(void *)(v974 + 32) = v977;
  static Settings.Tips.Earnings.ConfigOverrides.tipFrequencyInterval.getter();
  ((void (*)(char *, void, uint64_t))v1103)(v971, v1108, v1107);
  uint64_t v979 = v964;
  ((void (*)(char *, uint64_t, uint64_t))v1092)(v1078, v964, v1091);
  uint64_t v980 = v1079;
  uint64_t v981 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v982 = v1095;
  *(void *)(v974 + 96) = v980;
  *(void *)(v974 + 104) = v982;
  *(void *)(v974 + 72) = v981;
  Group.init(title:footer:group:_:)();
  v983 = (uint64_t (*)(void))v1088;
  v984 = v1112;
  v1112[82] = (uint64_t (*)(void))v1088;
  v984[83] = (uint64_t (*)(void))&protocol witness table for Page;
  sub_100015400(v1094);
  Page.init(title:_:)();
  v1113 = (uint64_t *)(v984 + 84);
  *(_OWORD *)(swift_allocObject() + 16) = v1101;
  uint64_t v985 = swift_allocObject();
  *(_OWORD *)(v985 + 16) = v1101;
  sub_10003D128();
  uint64_t v987 = v986;
  static Settings.Watchlist.kvsCleanupPermission.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v1024 + 104))(v1001, v964, v1025);
  sub_10003D1BC(&qword_1000553E8, (void (*)(uint64_t))&type metadata accessor for KVSCleanupPermission);
  uint64_t v988 = Item<>.init(_:label:resetBehavior:actions:)();
  *(void *)(v985 + 56) = v987;
  *(void *)(v985 + 64) = sub_10003D1BC((unint64_t *)&unk_1000553F0, (void (*)(uint64_t))sub_10003D128);
  *(void *)(v985 + 32) = v988;
  Group.init(title:footer:_:)();
  v984[87] = v983;
  v984[88] = (uint64_t (*)(void))&protocol witness table for Page;
  sub_100015400(v1113);
  Page.init(title:_:)();
  Group.init(title:footer:_:)();
  uint64_t v989 = swift_allocObject();
  *(_OWORD *)(v989 + 16) = v1101;
  static Settings.Radars.radar50783266.getter();
  ((void (*)(char *, void, uint64_t))v1103)(v1093, v1108, v1107);
  v1097(v1105, v979, v1102);
  uint64_t v990 = v1109;
  uint64_t v991 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  uint64_t v992 = v1098;
  *(void *)(v989 + 56) = v990;
  *(void *)(v989 + 64) = v992;
  *(void *)(v989 + 32) = v991;
  Group.init(title:footer:_:)();
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1021 + 8))(v1052, v1000);
  uint64_t *v1026 = v1035;
  return sub_10001373C((uint64_t)v1118);
}

BOOL sub_10003C024()
{
  uint64_t v0 = self;
  id v1 = [v0 currentDevice];
  id v2 = [v1 userInterfaceIdiom];

  if (v2 == (id)1) {
    return 1;
  }
  id v4 = [v0 currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  return v5 == (id)5;
}

uint64_t sub_10003C0CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v23 = a1;
  sub_10003CA70(0, &qword_1000552C0, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool, (uint64_t (*)(void, uint64_t, uint64_t))&type metadata accessor for Item.ResetBehavior);
  uint64_t v22 = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  id v4 = (char *)&v19 - v3;
  uint64_t v21 = type metadata accessor for ChangeBehavior();
  uint64_t v5 = *(void *)(v21 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015F60(0, &qword_1000552D0, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v8 = *(void *)(type metadata accessor for Group() - 8);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = swift_allocObject();
  long long v19 = xmmword_100043A40;
  *(_OWORD *)(v10 + 16) = xmmword_100043A40;
  unint64_t v20 = v10 + v9;
  sub_10003C944();
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = v19;
  sub_10003CA70(0, &qword_1000552D8, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool, (uint64_t (*)(void, uint64_t, uint64_t))&type metadata accessor for Item);
  uint64_t v13 = v12;
  static Settings.ForYouFeedMasthead.mastheadEnabled.getter();
  sub_10003C9B0();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100044520;
  type metadata accessor for SettingAction();
  *(void *)(v14 + 32) = static SettingActions.restart.getter();
  uint64_t v24 = v14;
  specialized Array._endMutation()();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ChangeBehavior.default(_:), v21);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for Item.ResetBehavior.reset<A>(_:), v22);
  uint64_t v15 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
  *(void *)(v11 + 56) = v13;
  *(void *)(v11 + 64) = sub_10003CA0C(&qword_1000552E8, &qword_1000552D8, (uint64_t)&type metadata for Bool, (uint64_t)&protocol witness table for Bool);
  *(void *)(v11 + 32) = v15;
  Group.init(title:footer:_:)();
  uint64_t v16 = type metadata accessor for Page();
  uint64_t v17 = v23;
  void v23[3] = v16;
  v17[4] = (uint64_t)&protocol witness table for Page;
  sub_100015400(v17);
  return Page.init(title:_:)();
}

void sub_10003C4A4()
{
  if (!qword_100055210)
  {
    type metadata accessor for KVSCleanupPermission();
    sub_10003D1BC(&qword_100055218, (void (*)(uint64_t))&type metadata accessor for KVSCleanupPermission);
    unint64_t v0 = type metadata accessor for Item.ResetBehavior();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055210);
    }
  }
}

void sub_10003C538()
{
  if (!qword_100055220)
  {
    type metadata accessor for StocksDataServiceEnablement();
    sub_10003D1BC(&qword_100055228, (void (*)(uint64_t))&type metadata accessor for StocksDataServiceEnablement);
    unint64_t v0 = type metadata accessor for Item.ResetBehavior();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055220);
    }
  }
}

void sub_10003C5CC()
{
  if (!qword_100055238)
  {
    type metadata accessor for AppConfigurationSource();
    sub_10003D1BC(&qword_100055240, (void (*)(uint64_t))&type metadata accessor for AppConfigurationSource);
    unint64_t v0 = type metadata accessor for Item.ResetBehavior();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055238);
    }
  }
}

void sub_10003C660()
{
  if (!qword_100055250)
  {
    type metadata accessor for FeedAutoRefreshStrategy();
    sub_10003D1BC(&qword_100055258, (void (*)(uint64_t))&type metadata accessor for FeedAutoRefreshStrategy);
    unint64_t v0 = type metadata accessor for Item.ResetBehavior();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055250);
    }
  }
}

void sub_10003C6F4()
{
  if (!qword_100055268)
  {
    type metadata accessor for NewsEnvironment();
    sub_10003D1BC(&qword_100055270, (void (*)(uint64_t))&type metadata accessor for NewsEnvironment);
    unint64_t v0 = type metadata accessor for Item.ResetBehavior();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055268);
    }
  }
}

void sub_10003C788()
{
  if (!qword_100055278)
  {
    type metadata accessor for NewsProvider();
    sub_10003D1BC(&qword_100055280, (void (*)(uint64_t))&type metadata accessor for NewsProvider);
    unint64_t v0 = type metadata accessor for Item.ResetBehavior();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055278);
    }
  }
}

void sub_10003C81C()
{
  if (!qword_100055288)
  {
    type metadata accessor for Settings.Container.TestSuite();
    sub_10003D1BC(&qword_100055290, (void (*)(uint64_t))&type metadata accessor for Settings.Container.TestSuite);
    unint64_t v0 = type metadata accessor for Item.ResetBehavior();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055288);
    }
  }
}

void sub_10003C8B0()
{
  if (!qword_100055298)
  {
    type metadata accessor for FeatureState();
    sub_10003D1BC(&qword_1000552A0, (void (*)(uint64_t))&type metadata accessor for FeatureState);
    unint64_t v0 = type metadata accessor for Item.ResetBehavior();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055298);
    }
  }
}

void sub_10003C944()
{
  if (!qword_100055158)
  {
    sub_10001378C(255, (unint64_t *)&qword_100055160);
    unint64_t v0 = type metadata accessor for _ContiguousArrayStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055158);
    }
  }
}

void sub_10003C9B0()
{
  if (!qword_1000552E0)
  {
    unint64_t v0 = type metadata accessor for _ContiguousArrayStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000552E0);
    }
  }
}

uint64_t sub_10003CA0C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10003CA70(255, a2, a3, a4, (uint64_t (*)(void, uint64_t, uint64_t))&type metadata accessor for Item);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10003CA70(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, a4);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

void sub_10003CAC0()
{
  if (!qword_100055320)
  {
    type metadata accessor for FeatureState();
    sub_10003D1BC(&qword_1000552A0, (void (*)(uint64_t))&type metadata accessor for FeatureState);
    unint64_t v0 = type metadata accessor for Item();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055320);
    }
  }
}

uint64_t sub_10003CB54(uint64_t a1)
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
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  unint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

int64_t sub_10003CBF4(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_10003CCD8()
{
  if (!qword_100055340)
  {
    type metadata accessor for Settings.Container.TestSuite();
    sub_10003D1BC(&qword_100055290, (void (*)(uint64_t))&type metadata accessor for Settings.Container.TestSuite);
    unint64_t v0 = type metadata accessor for Item();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055340);
    }
  }
}

void sub_10003CD6C()
{
  if (!qword_100055358)
  {
    type metadata accessor for NewsProvider();
    sub_10003D1BC(&qword_100055280, (void (*)(uint64_t))&type metadata accessor for NewsProvider);
    unint64_t v0 = type metadata accessor for Item();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055358);
    }
  }
}

void sub_10003CE00()
{
  if (!qword_100055370)
  {
    type metadata accessor for NewsEnvironment();
    sub_10003D1BC(&qword_100055270, (void (*)(uint64_t))&type metadata accessor for NewsEnvironment);
    unint64_t v0 = type metadata accessor for Item();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055370);
    }
  }
}

void sub_10003CE94(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1000219A4();
    unint64_t v7 = a3(a1, &type metadata for Storefront, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_10003CEF8()
{
  unint64_t result = qword_100055390;
  if (!qword_100055390)
  {
    sub_10003CE94(255, &qword_100055388, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for Item);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100055390);
  }
  return result;
}

void sub_10003CF6C()
{
  if (!qword_100055398)
  {
    type metadata accessor for FeedAutoRefreshStrategy();
    sub_10003D1BC(&qword_100055258, (void (*)(uint64_t))&type metadata accessor for FeedAutoRefreshStrategy);
    unint64_t v0 = type metadata accessor for Item();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100055398);
    }
  }
}

void sub_10003D000()
{
  if (!qword_1000553B0)
  {
    type metadata accessor for AppConfigurationSource();
    sub_10003D1BC(&qword_100055240, (void (*)(uint64_t))&type metadata accessor for AppConfigurationSource);
    unint64_t v0 = type metadata accessor for Item();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000553B0);
    }
  }
}

void sub_10003D094()
{
  if (!qword_1000553C8)
  {
    type metadata accessor for StocksDataServiceEnablement();
    sub_10003D1BC(&qword_100055228, (void (*)(uint64_t))&type metadata accessor for StocksDataServiceEnablement);
    unint64_t v0 = type metadata accessor for Item();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000553C8);
    }
  }
}

void sub_10003D128()
{
  if (!qword_1000553E0)
  {
    type metadata accessor for KVSCleanupPermission();
    sub_10003D1BC(&qword_100055218, (void (*)(uint64_t))&type metadata accessor for KVSCleanupPermission);
    unint64_t v0 = type metadata accessor for Item();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000553E0);
    }
  }
}

uint64_t sub_10003D1BC(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_10003D204()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v2 = [self defaultCenter];
  [v2 removeObserver:v0];

  v4.receiver = v0;
  v4.super_class = ObjectType;
  return [super dealloc];
}

uint64_t sub_10003D3DC()
{
  return type metadata accessor for StocksTodayAgent();
}

unsigned char *sub_10003D3E4(unsigned char *result)
{
  *uint64_t result = 1;
  return result;
}

uint64_t sub_10003D480(uint64_t a1, uint64_t a2)
{
  return sub_10003D4B8(a1, a2, (uint64_t)sub_10003D7BC);
}

uint64_t sub_10003D49C(uint64_t a1, uint64_t a2)
{
  return sub_10003D4B8(a1, a2, (uint64_t)sub_10003D7BC);
}

uint64_t sub_10003D4B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for MainActor();
  uint64_t v7 = v3;
  return sub_1000088F0(a3, (uint64_t)&v6);
}

uint64_t sub_10003D550()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003D588()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10003D5D0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003D608()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

unint64_t sub_10003D640()
{
  unint64_t result = qword_100055568;
  if (!qword_100055568)
  {
    sub_100016B00(255, (unint64_t *)&qword_100054900, (uint64_t)&type metadata for () + 8, (uint64_t (*)(void, uint64_t, void *, void *))&type metadata accessor for PassthroughSubject);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100055568);
  }
  return result;
}

uint64_t sub_10003D6C0()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003D708()
{
  sub_100016B00(0, &qword_100055578, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t, void *, void *))&type metadata accessor for CheckedContinuation);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_10003D7BC()
{
}

unsigned char *sub_10003D7D4(unsigned char *a1)
{
  return sub_10003D3E4(a1);
}

__n128 initializeWithCopy for ArticleScore(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ArticleScore(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 120)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 56);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ArticleScore(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 120) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 120) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 56) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArticleScore()
{
  return &type metadata for ArticleScore;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t AppDependencyManager.addStocksDependencies(using:)()
{
  return AppDependencyManager.addStocksDependencies(using:)();
}

uint64_t AppDependencyManager.add<A>(key:dependency:)()
{
  return AppDependencyManager.add<A>(key:dependency:)();
}

{
  return AppDependencyManager.add<A>(key:dependency:)();
}

uint64_t static AppDependencyManager.shared.getter()
{
  return static AppDependencyManager.shared.getter();
}

uint64_t type metadata accessor for AppDependencyManager()
{
  return type metadata accessor for AppDependencyManager();
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

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
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

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t type metadata accessor for StocksIntentType()
{
  return type metadata accessor for StocksIntentType();
}

uint64_t type metadata accessor for StocksDataServiceEnablement()
{
  return type metadata accessor for StocksDataServiceEnablement();
}

uint64_t type metadata accessor for NewsProvider()
{
  return type metadata accessor for NewsProvider();
}

uint64_t SymbolEntity.init(from:)()
{
  return SymbolEntity.init(from:)();
}

uint64_t type metadata accessor for SymbolEntity()
{
  return type metadata accessor for SymbolEntity();
}

uint64_t type metadata accessor for NewsEnvironment()
{
  return type metadata accessor for NewsEnvironment();
}

uint64_t WatchlistEntity.id.getter()
{
  return WatchlistEntity.id.getter();
}

uint64_t type metadata accessor for WatchlistEntity()
{
  return type metadata accessor for WatchlistEntity();
}

uint64_t AppConfiguration.analyticsDenylistDescriptorsSeed.getter()
{
  return AppConfiguration.analyticsDenylistDescriptorsSeed.getter();
}

uint64_t AppConfiguration.stateRestorationAllowedTimeWindow.getter()
{
  return AppConfiguration.stateRestorationAllowedTimeWindow.getter();
}

uint64_t AppConfiguration.analyticsDenylistDescriptorsPublic.getter()
{
  return AppConfiguration.analyticsDenylistDescriptorsPublic.getter();
}

uint64_t AppConfiguration.analyticsDenylistDescriptorsInternal.getter()
{
  return AppConfiguration.analyticsDenylistDescriptorsInternal.getter();
}

uint64_t type metadata accessor for AppConfiguration()
{
  return type metadata accessor for AppConfiguration();
}

uint64_t OpenSymbolIntent.target.getter()
{
  return OpenSymbolIntent.target.getter();
}

uint64_t OpenSymbolIntent.target.setter()
{
  return OpenSymbolIntent.target.setter();
}

uint64_t OpenSymbolIntent.init()()
{
  return OpenSymbolIntent.init()();
}

uint64_t type metadata accessor for OpenSymbolIntent()
{
  return type metadata accessor for OpenSymbolIntent();
}

uint64_t type metadata accessor for PriceChangeDisplay()
{
  return type metadata accessor for PriceChangeDisplay();
}

uint64_t OpenWatchlistIntent.target.getter()
{
  return OpenWatchlistIntent.target.getter();
}

uint64_t type metadata accessor for OpenWatchlistIntent()
{
  return type metadata accessor for OpenWatchlistIntent();
}

uint64_t type metadata accessor for KVSCleanupPermission()
{
  return type metadata accessor for KVSCleanupPermission();
}

uint64_t dispatch thunk of WatchlistManagerType.defaultAllSymbolsWatchlist.getter()
{
  return dispatch thunk of WatchlistManagerType.defaultAllSymbolsWatchlist.getter();
}

uint64_t dispatch thunk of WatchlistManagerType.fetchStocksFromDefaultWatchlist()()
{
  return dispatch thunk of WatchlistManagerType.fetchStocksFromDefaultWatchlist()();
}

uint64_t dispatch thunk of WatchlistManagerType.addObserver(_:)()
{
  return dispatch thunk of WatchlistManagerType.addObserver(_:)();
}

uint64_t dispatch thunk of WatchlistManagerType.removeSymbol(_:from:)()
{
  return dispatch thunk of WatchlistManagerType.removeSymbol(_:from:)();
}

uint64_t dispatch thunk of WatchlistManagerType.prewarm()()
{
  return dispatch thunk of WatchlistManagerType.prewarm()();
}

uint64_t dispatch thunk of WatchlistManagerType.reorder(symbols:in:)()
{
  return dispatch thunk of WatchlistManagerType.reorder(symbols:in:)();
}

uint64_t WatchlistManagerType.addStocks(_:watchlist:)()
{
  return WatchlistManagerType.addStocks(_:watchlist:)();
}

uint64_t WatchlistManagerType.activeWatchlistChanges.getter()
{
  return WatchlistManagerType.activeWatchlistChanges.getter();
}

uint64_t type metadata accessor for AppConfigurationSource()
{
  return type metadata accessor for AppConfigurationSource();
}

uint64_t type metadata accessor for OpenBusinessNewsIntent()
{
  return type metadata accessor for OpenBusinessNewsIntent();
}

uint64_t StockMetadataManagerType.fetchStocks(for:cachePolicy:)()
{
  return StockMetadataManagerType.fetchStocks(for:cachePolicy:)();
}

uint64_t dispatch thunk of StockPriceDataManagerType.addWidgetObserver(_:)()
{
  return dispatch thunk of StockPriceDataManagerType.addWidgetObserver(_:)();
}

uint64_t dispatch thunk of AppConfigurationManagerType.appConfiguration.getter()
{
  return dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
}

uint64_t dispatch thunk of PrivateDataPollingServiceType.pollForChangesIfNeeded()()
{
  return dispatch thunk of PrivateDataPollingServiceType.pollForChangesIfNeeded()();
}

uint64_t Stock.init(from:)()
{
  return Stock.init(from:)();
}

uint64_t Stock.name.getter()
{
  return Stock.name.getter();
}

uint64_t Stock.symbol.getter()
{
  return Stock.symbol.getter();
}

uint64_t Stock.exchange.getter()
{
  return Stock.exchange.getter();
}

uint64_t type metadata accessor for Stock()
{
  return type metadata accessor for Stock();
}

uint64_t static Caches.Charts.location.getter()
{
  return static Caches.Charts.location.getter();
}

uint64_t static Caches.Shared.location.getter()
{
  return static Caches.Shared.location.getter();
}

uint64_t static Caches.Default.location.getter()
{
  return static Caches.Default.location.getter();
}

uint64_t static Account.storefrontID.getter()
{
  return static Account.storefrontID.getter();
}

uint64_t AppGroup.identifier.getter()
{
  return AppGroup.identifier.getter();
}

uint64_t AppGroup.containerURL.getter()
{
  return AppGroup.containerURL.getter();
}

uint64_t static AppGroup.stocks.getter()
{
  return static AppGroup.stocks.getter();
}

uint64_t type metadata accessor for AppGroup()
{
  return type metadata accessor for AppGroup();
}

uint64_t Assembly.init()()
{
  return Assembly.init()();
}

{
  return Assembly.init()();
}

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

{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

uint64_t Watchlist.displayState.getter()
{
  return Watchlist.displayState.getter();
}

uint64_t type metadata accessor for Watchlist()
{
  return type metadata accessor for Watchlist();
}

uint64_t static Settings.Blueprint.Impressions.scrollDelta.getter()
{
  return static Settings.Blueprint.Impressions.scrollDelta.getter();
}

uint64_t type metadata accessor for Settings.Container.TestSuite()
{
  return type metadata accessor for Settings.Container.TestSuite();
}

uint64_t static Settings.Container.testSuite.getter()
{
  return static Settings.Container.testSuite.getter();
}

uint64_t static Settings.DataSource.stocksDataServiceEnabled.getter()
{
  return static Settings.DataSource.stocksDataServiceEnabled.getter();
}

uint64_t static Settings.MarketData.simulatePremarketData.getter()
{
  return static Settings.MarketData.simulatePremarketData.getter();
}

uint64_t static Settings.MarketData.freezeCharts.getter()
{
  return static Settings.MarketData.freezeCharts.getter();
}

uint64_t static Settings.MarketData.freezeQuotes.getter()
{
  return static Settings.MarketData.freezeQuotes.getter();
}

uint64_t static Settings.MarketData.freezeSparklines.getter()
{
  return static Settings.MarketData.freezeSparklines.getter();
}

uint64_t static Settings.MarketData.freezeQuoteDetails.getter()
{
  return static Settings.MarketData.freezeQuoteDetails.getter();
}

uint64_t static Settings.PrivateData.simulateNewsSyncingEnabled.getter()
{
  return static Settings.PrivateData.simulateNewsSyncingEnabled.getter();
}

uint64_t static Settings.Identification.adIdentifierRotation.getter()
{
  return static Settings.Identification.adIdentifierRotation.getter();
}

uint64_t static Settings.AppConfiguration.ignoreCache.getter()
{
  return static Settings.AppConfiguration.ignoreCache.getter();
}

uint64_t static Settings.AppConfiguration.overrideUserID.getter()
{
  return static Settings.AppConfiguration.overrideUserID.getter();
}

uint64_t static Settings.AppConfiguration.disableABTesting.getter()
{
  return static Settings.AppConfiguration.disableABTesting.getter();
}

uint64_t static Settings.AppConfiguration.overrideSegmentSetIDs.getter()
{
  return static Settings.AppConfiguration.overrideSegmentSetIDs.getter();
}

uint64_t static Settings.AppConfiguration.additionalSegmentSetIDs.getter()
{
  return static Settings.AppConfiguration.additionalSegmentSetIDs.getter();
}

uint64_t static Settings.AppConfiguration.enableSegmentationOverrides.getter()
{
  return static Settings.AppConfiguration.enableSegmentationOverrides.getter();
}

uint64_t static Settings.AppConfiguration.source.getter()
{
  return static Settings.AppConfiguration.source.getter();
}

uint64_t static Settings.News.appleNewsEnvironment.getter()
{
  return static Settings.News.appleNewsEnvironment.getter();
}

uint64_t static Settings.News.newsProvider.getter()
{
  return static Settings.News.newsProvider.getter();
}

uint64_t static Settings.News.disableTopStories.getter()
{
  return static Settings.News.disableTopStories.getter();
}

uint64_t static Settings.News.disableEdgeCachedFeeds.getter()
{
  return static Settings.News.disableEdgeCachedFeeds.getter();
}

uint64_t static Settings.News.forYouGroupSizeOverride.getter()
{
  return static Settings.News.forYouGroupSizeOverride.getter();
}

uint64_t static Settings.News.disableEdgeCachedTopStories.getter()
{
  return static Settings.News.disableEdgeCachedTopStories.getter();
}

uint64_t static Settings.News.enableForYouGroupSizeOverride.getter()
{
  return static Settings.News.enableForYouGroupSizeOverride.getter();
}

uint64_t static Settings.News.overrideWidgetSectionConfigID.getter()
{
  return static Settings.News.overrideWidgetSectionConfigID.getter();
}

uint64_t static Settings.Widget.dumpEntries.getter()
{
  return static Settings.Widget.dumpEntries.getter();
}

uint64_t static Settings.Widget.entryInterval.getter()
{
  return static Settings.Widget.entryInterval.getter();
}

uint64_t static Settings.Widget.demoMode.getter()
{
  return static Settings.Widget.demoMode.getter();
}

uint64_t static Settings.Features.cipActivation.getter()
{
  return static Settings.Features.cipActivation.getter();
}

uint64_t static Settings.Features.appReviewPrompt.getter()
{
  return static Settings.Features.appReviewPrompt.getter();
}

uint64_t static Settings.Features.symbolsInArticles.getter()
{
  return static Settings.Features.symbolsInArticles.getter();
}

uint64_t static Settings.Features.newsFreeExperience.getter()
{
  return static Settings.Features.newsFreeExperience.getter();
}

uint64_t static Settings.Features.paidBundleViaOffer.getter()
{
  return static Settings.Features.paidBundleViaOffer.getter();
}

uint64_t static Settings.Features.widgetNewsCuration.getter()
{
  return static Settings.Features.widgetNewsCuration.getter();
}

uint64_t static Settings.Features.enableAIAttribution.getter()
{
  return static Settings.Features.enableAIAttribution.getter();
}

uint64_t static Settings.Features.widgetSpecificConfig.getter()
{
  return static Settings.Features.widgetSpecificConfig.getter();
}

uint64_t static Settings.Features.displayPreMarketQuote.getter()
{
  return static Settings.Features.displayPreMarketQuote.getter();
}

uint64_t static Settings.Features.forYouFeedConfigRequests.getter()
{
  return static Settings.Features.forYouFeedConfigRequests.getter();
}

uint64_t static Settings.Features.showYahooNewsAttribution.getter()
{
  return static Settings.Features.showYahooNewsAttribution.getter();
}

uint64_t static Settings.Watchlist.kvsCleanupPermission.getter()
{
  return static Settings.Watchlist.kvsCleanupPermission.getter();
}

uint64_t static Settings.NewsArticlesModules.EndOfArticleFeed.ConfigOverrides.url.getter()
{
  return static Settings.NewsArticlesModules.EndOfArticleFeed.ConfigOverrides.url.getter();
}

uint64_t type metadata accessor for Settings.NewsArticlesModules.EndOfArticleFeed.ConfigOverrides()
{
  return type metadata accessor for Settings.NewsArticlesModules.EndOfArticleFeed.ConfigOverrides();
}

uint64_t static Settings.NewsArticlesModules.EndOfArticleFeed.configOverrides.getter()
{
  return static Settings.NewsArticlesModules.EndOfArticleFeed.configOverrides.getter();
}

uint64_t static Settings.Engagement.Presentation.disableAllPresentations.getter()
{
  return static Settings.Engagement.Presentation.disableAllPresentations.getter();
}

uint64_t static Settings.Analytics2.Instrumentation.ads.getter()
{
  return static Settings.Analytics2.Instrumentation.ads.getter();
}

uint64_t static Settings.Analytics2.Debugging.batchDebugging.getter()
{
  return static Settings.Analytics2.Debugging.batchDebugging.getter();
}

uint64_t static Settings.Analytics2.Debugging.disableAnalytics.getter()
{
  return static Settings.Analytics2.Debugging.disableAnalytics.getter();
}

uint64_t static Settings.Analytics2.Debugging.sessionName.getter()
{
  return static Settings.Analytics2.Debugging.sessionName.getter();
}

uint64_t static Settings.Analytics2.Debugging.jitterOverrides.getter()
{
  return static Settings.Analytics2.Debugging.jitterOverrides.getter();
}

uint64_t static Settings.Analytics2.Debugging.maxUploadRetryCount.getter()
{
  return static Settings.Analytics2.Debugging.maxUploadRetryCount.getter();
}

uint64_t static Settings.Analytics2.Debugging.Jitter.enablement.getter()
{
  return static Settings.Analytics2.Debugging.Jitter.enablement.getter();
}

uint64_t static Settings.Analytics2.Debugging.Jitter.lowerBound.getter()
{
  return static Settings.Analytics2.Debugging.Jitter.lowerBound.getter();
}

uint64_t static Settings.Analytics2.Debugging.Jitter.upperBound.getter()
{
  return static Settings.Analytics2.Debugging.Jitter.upperBound.getter();
}

uint64_t type metadata accessor for Settings.Analytics2.Debugging.Jitter()
{
  return type metadata accessor for Settings.Analytics2.Debugging.Jitter();
}

uint64_t static Settings.Analytics2.Debugging.batchSize.getter()
{
  return static Settings.Analytics2.Debugging.batchSize.getter();
}

uint64_t static Settings.AccessChecks.simulateAccessToEverything.getter()
{
  return static Settings.AccessChecks.simulateAccessToEverything.getter();
}

uint64_t static Settings.Entitlements.simulateAmplifyUser.getter()
{
  return static Settings.Entitlements.simulateAmplifyUser.getter();
}

uint64_t static Settings.Entitlements.trialPeriodOverride.getter()
{
  return static Settings.Entitlements.trialPeriodOverride.getter();
}

uint64_t static Settings.Entitlements.entitlementsOverride.getter()
{
  return static Settings.Entitlements.entitlementsOverride.getter();
}

uint64_t static Settings.Entitlements.simulateFamilyMember.getter()
{
  return static Settings.Entitlements.simulateFamilyMember.getter();
}

uint64_t static Settings.Entitlements.simulateServicesBundle.getter()
{
  return static Settings.Entitlements.simulateServicesBundle.getter();
}

uint64_t static Settings.Entitlements.entitlementsResultOverride.getter()
{
  return static Settings.Entitlements.entitlementsResultOverride.getter();
}

uint64_t static Settings.Entitlements.cacheRecoveryAttemptDuration.getter()
{
  return static Settings.Entitlements.cacheRecoveryAttemptDuration.getter();
}

uint64_t static Settings.Entitlements.simulateEntitlementCacheExpired.getter()
{
  return static Settings.Entitlements.simulateEntitlementCacheExpired.getter();
}

uint64_t static Settings.PurchaseFlow.simulatePurchaseFlow.getter()
{
  return static Settings.PurchaseFlow.simulatePurchaseFlow.getter();
}

uint64_t static Settings.BundleSubscriptions.entitlementsGracePeriod.getter()
{
  return static Settings.BundleSubscriptions.entitlementsGracePeriod.getter();
}

uint64_t static Settings.AppLaunch.showPersonalizedAdsOnNextLaunch.getter()
{
  return static Settings.AppLaunch.showPersonalizedAdsOnNextLaunch.getter();
}

uint64_t static Settings.AppLaunch.disableAppLaunchOnboarding.getter()
{
  return static Settings.AppLaunch.disableAppLaunchOnboarding.getter();
}

uint64_t static Settings.WebAccess.localServerIP.getter()
{
  return static Settings.WebAccess.localServerIP.getter();
}

uint64_t static Settings.CompositionalList.useDiffableDataSource.getter()
{
  return static Settings.CompositionalList.useDiffableDataSource.getter();
}

uint64_t static Settings.NewsFeedModule.Debug.Format.host.getter()
{
  return static Settings.NewsFeedModule.Debug.Format.host.getter();
}

uint64_t static Settings.NewsFeedModule.Debug.Format.port.getter()
{
  return static Settings.NewsFeedModule.Debug.Format.port.getter();
}

uint64_t static Settings.NewsFeedModule.Format.ignorePackageCache.getter()
{
  return static Settings.NewsFeedModule.Format.ignorePackageCache.getter();
}

uint64_t static Settings.NewsFeedModule.Format.prefetchWebArchives.getter()
{
  return static Settings.NewsFeedModule.Format.prefetchWebArchives.getter();
}

uint64_t static Settings.NewsFeedModule.Format.prefetchDataResources.getter()
{
  return static Settings.NewsFeedModule.Format.prefetchDataResources.getter();
}

uint64_t static Settings.NewsFeedModule.Format.loadPackagesFromDebugServerDropbox.getter()
{
  return static Settings.NewsFeedModule.Format.loadPackagesFromDebugServerDropbox.getter();
}

uint64_t static Settings.NewsFeedModule.Layout.enableLogDebugging.getter()
{
  return static Settings.NewsFeedModule.Layout.enableLogDebugging.getter();
}

uint64_t static Settings.NewsFeedModule.Layout.enableVisualDebugging.getter()
{
  return static Settings.NewsFeedModule.Layout.enableVisualDebugging.getter();
}

uint64_t static Settings.NewsFeedModule.Features.useFeedDifferentiationMode.getter()
{
  return static Settings.NewsFeedModule.Features.useFeedDifferentiationMode.getter();
}

uint64_t static Settings.Refreshing.MarketData.overrideEnabled.getter()
{
  return static Settings.Refreshing.MarketData.overrideEnabled.getter();
}

uint64_t static Settings.Refreshing.MarketData.overrideInterval.getter()
{
  return static Settings.Refreshing.MarketData.overrideInterval.getter();
}

uint64_t static Settings.ChartOptions.showYTD.getter()
{
  return static Settings.ChartOptions.showYTD.getter();
}

uint64_t static Settings.UserPreferences.showCurrency.getter()
{
  return static Settings.UserPreferences.showCurrency.getter();
}

uint64_t static Settings.ForYouFeedMasthead.mastheadEnabled.getter()
{
  return static Settings.ForYouFeedMasthead.mastheadEnabled.getter();
}

uint64_t static Settings.ForYouFeedMasthead.premiumSealEnabled.getter()
{
  return static Settings.ForYouFeedMasthead.premiumSealEnabled.getter();
}

uint64_t static Settings.Tips.savedViaFeed.getter()
{
  return static Settings.Tips.savedViaFeed.getter();
}

uint64_t static Settings.Tips.audioQueuedViaFeed.getter()
{
  return static Settings.Tips.audioQueuedViaFeed.getter();
}

uint64_t static Settings.Tips.savedViaArticleViewer.getter()
{
  return static Settings.Tips.savedViaArticleViewer.getter();
}

uint64_t static Settings.Tips.audioQueuedViaArticleViewer.getter()
{
  return static Settings.Tips.audioQueuedViaArticleViewer.getter();
}

uint64_t static Settings.Tips.Earnings.ConfigOverrides.tipFrequencyInterval.getter()
{
  return static Settings.Tips.Earnings.ConfigOverrides.tipFrequencyInterval.getter();
}

uint64_t static Settings.Tips.Earnings.ConfigOverrides.tipMaxPresentedCount.getter()
{
  return static Settings.Tips.Earnings.ConfigOverrides.tipMaxPresentedCount.getter();
}

uint64_t type metadata accessor for Settings.Tips.Earnings.ConfigOverrides()
{
  return type metadata accessor for Settings.Tips.Earnings.ConfigOverrides();
}

uint64_t static Settings.Tips.Earnings.configOverrides.getter()
{
  return static Settings.Tips.Earnings.configOverrides.getter();
}

uint64_t static Settings.ForYou.ConfigOverrides.url.getter()
{
  return static Settings.ForYou.ConfigOverrides.url.getter();
}

uint64_t type metadata accessor for Settings.ForYou.ConfigOverrides()
{
  return type metadata accessor for Settings.ForYou.ConfigOverrides();
}

uint64_t static Settings.ForYou.configOverrides.getter()
{
  return static Settings.ForYou.configOverrides.getter();
}

uint64_t static Settings.ForYou.Card.systemDetents.getter()
{
  return static Settings.ForYou.Card.systemDetents.getter();
}

uint64_t static Settings.ForYou.Feed.autoRefreshStrategy.getter()
{
  return static Settings.ForYou.Feed.autoRefreshStrategy.getter();
}

uint64_t static Settings.ForYou.Ticker.tapToDismiss.getter()
{
  return static Settings.ForYou.Ticker.tapToDismiss.getter();
}

uint64_t static Settings.Radars.radar50783266.getter()
{
  return static Settings.Radars.radar50783266.getter();
}

uint64_t static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlOneX.getter()
{
  return static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlOneX.getter();
}

uint64_t static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlOneY.getter()
{
  return static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlOneY.getter();
}

uint64_t static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlTwoX.getter()
{
  return static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlTwoX.getter();
}

uint64_t static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlTwoY.getter()
{
  return static Settings.Welcome.Animations.WelcomeToStocksFadeIn.controlTwoY.getter();
}

uint64_t static Settings.Welcome.Animations.WelcomeToStocksFadeIn.duration.getter()
{
  return static Settings.Welcome.Animations.WelcomeToStocksFadeIn.duration.getter();
}

uint64_t static Settings.Welcome.Animations.WelcomeToStocksScaleUp.initialScale.getter()
{
  return static Settings.Welcome.Animations.WelcomeToStocksScaleUp.initialScale.getter();
}

uint64_t static Settings.Welcome.Animations.WelcomeToStocksScaleUp.mass.getter()
{
  return static Settings.Welcome.Animations.WelcomeToStocksScaleUp.mass.getter();
}

uint64_t static Settings.Welcome.Animations.WelcomeToStocksScaleUp.damping.getter()
{
  return static Settings.Welcome.Animations.WelcomeToStocksScaleUp.damping.getter();
}

uint64_t static Settings.Welcome.Animations.WelcomeToStocksScaleUp.stiffness.getter()
{
  return static Settings.Welcome.Animations.WelcomeToStocksScaleUp.stiffness.getter();
}

uint64_t static Settings.Welcome.Animations.Page2Moves.mass.getter()
{
  return static Settings.Welcome.Animations.Page2Moves.mass.getter();
}

uint64_t static Settings.Welcome.Animations.Page2Moves.delay.getter()
{
  return static Settings.Welcome.Animations.Page2Moves.delay.getter();
}

uint64_t static Settings.Welcome.Animations.Page2Moves.damping.getter()
{
  return static Settings.Welcome.Animations.Page2Moves.damping.getter();
}

uint64_t static Settings.Welcome.Animations.Page2Moves.stiffness.getter()
{
  return static Settings.Welcome.Animations.Page2Moves.stiffness.getter();
}

uint64_t static Settings.Welcome.Animations.DismissFade.controlOneX.getter()
{
  return static Settings.Welcome.Animations.DismissFade.controlOneX.getter();
}

uint64_t static Settings.Welcome.Animations.DismissFade.controlOneY.getter()
{
  return static Settings.Welcome.Animations.DismissFade.controlOneY.getter();
}

uint64_t static Settings.Welcome.Animations.DismissFade.controlTwoX.getter()
{
  return static Settings.Welcome.Animations.DismissFade.controlTwoX.getter();
}

uint64_t static Settings.Welcome.Animations.DismissFade.controlTwoY.getter()
{
  return static Settings.Welcome.Animations.DismissFade.controlTwoY.getter();
}

uint64_t static Settings.Welcome.Animations.DismissFade.duration.getter()
{
  return static Settings.Welcome.Animations.DismissFade.duration.getter();
}

uint64_t static Settings.Welcome.Animations.Page2FadeIns.controlOneX.getter()
{
  return static Settings.Welcome.Animations.Page2FadeIns.controlOneX.getter();
}

uint64_t static Settings.Welcome.Animations.Page2FadeIns.controlOneY.getter()
{
  return static Settings.Welcome.Animations.Page2FadeIns.controlOneY.getter();
}

uint64_t static Settings.Welcome.Animations.Page2FadeIns.controlTwoX.getter()
{
  return static Settings.Welcome.Animations.Page2FadeIns.controlTwoX.getter();
}

uint64_t static Settings.Welcome.Animations.Page2FadeIns.controlTwoY.getter()
{
  return static Settings.Welcome.Animations.Page2FadeIns.controlTwoY.getter();
}

uint64_t static Settings.Welcome.Animations.Page2FadeIns.duration.getter()
{
  return static Settings.Welcome.Animations.Page2FadeIns.duration.getter();
}

uint64_t static Settings.Welcome.Animations.AppIconFadeOut.controlOneX.getter()
{
  return static Settings.Welcome.Animations.AppIconFadeOut.controlOneX.getter();
}

uint64_t static Settings.Welcome.Animations.AppIconFadeOut.controlOneY.getter()
{
  return static Settings.Welcome.Animations.AppIconFadeOut.controlOneY.getter();
}

uint64_t static Settings.Welcome.Animations.AppIconFadeOut.controlTwoX.getter()
{
  return static Settings.Welcome.Animations.AppIconFadeOut.controlTwoX.getter();
}

uint64_t static Settings.Welcome.Animations.AppIconFadeOut.controlTwoY.getter()
{
  return static Settings.Welcome.Animations.AppIconFadeOut.controlTwoY.getter();
}

uint64_t static Settings.Welcome.Animations.AppIconFadeOut.duration.getter()
{
  return static Settings.Welcome.Animations.AppIconFadeOut.duration.getter();
}

uint64_t static Settings.Welcome.Animations.SpinnerFadeOut.controlOneX.getter()
{
  return static Settings.Welcome.Animations.SpinnerFadeOut.controlOneX.getter();
}

uint64_t static Settings.Welcome.Animations.SpinnerFadeOut.controlOneY.getter()
{
  return static Settings.Welcome.Animations.SpinnerFadeOut.controlOneY.getter();
}

uint64_t static Settings.Welcome.Animations.SpinnerFadeOut.controlTwoX.getter()
{
  return static Settings.Welcome.Animations.SpinnerFadeOut.controlTwoX.getter();
}

uint64_t static Settings.Welcome.Animations.SpinnerFadeOut.controlTwoY.getter()
{
  return static Settings.Welcome.Animations.SpinnerFadeOut.controlTwoY.getter();
}

uint64_t static Settings.Welcome.Animations.SpinnerFadeOut.duration.getter()
{
  return static Settings.Welcome.Animations.SpinnerFadeOut.duration.getter();
}

uint64_t static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlOneX.getter()
{
  return static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlOneX.getter();
}

uint64_t static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlOneY.getter()
{
  return static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlOneY.getter();
}

uint64_t static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlTwoX.getter()
{
  return static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlTwoX.getter();
}

uint64_t static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlTwoY.getter()
{
  return static Settings.Welcome.Animations.ActivityIndicatorFadeIn.controlTwoY.getter();
}

uint64_t static Settings.Welcome.Animations.ActivityIndicatorFadeIn.delay.getter()
{
  return static Settings.Welcome.Animations.ActivityIndicatorFadeIn.delay.getter();
}

uint64_t static Settings.Welcome.Animations.ActivityIndicatorFadeIn.duration.getter()
{
  return static Settings.Welcome.Animations.ActivityIndicatorFadeIn.duration.getter();
}

uint64_t static Settings.Welcome.Version.latestCompleted.getter()
{
  return static Settings.Welcome.Version.latestCompleted.getter();
}

uint64_t static Settings.Welcome.Version.debugLatestCompleted.getter()
{
  return static Settings.Welcome.Version.debugLatestCompleted.getter();
}

uint64_t static Settings.Earnings.ConfigOverrides.earningsEndDate.getter()
{
  return static Settings.Earnings.ConfigOverrides.earningsEndDate.getter();
}

uint64_t static Settings.Earnings.ConfigOverrides.earningsStartDate.getter()
{
  return static Settings.Earnings.ConfigOverrides.earningsStartDate.getter();
}

uint64_t type metadata accessor for Settings.Earnings.ConfigOverrides()
{
  return type metadata accessor for Settings.Earnings.ConfigOverrides();
}

uint64_t static Settings.Earnings.configOverrides.getter()
{
  return static Settings.Earnings.configOverrides.getter();
}

uint64_t static Settings.Features.narrativeAudio.getter()
{
  return static Settings.Features.narrativeAudio.getter();
}

uint64_t static Settings.Features.nffFeeds.getter()
{
  return static Settings.Features.nffFeeds.getter();
}

uint64_t static Settings.StockFeed.Feed.autoRefreshStrategy.getter()
{
  return static Settings.StockFeed.Feed.autoRefreshStrategy.getter();
}

uint64_t static Settings.StockFeed.ConfigOverrides.url.getter()
{
  return static Settings.StockFeed.ConfigOverrides.url.getter();
}

uint64_t type metadata accessor for Settings.StockFeed.ConfigOverrides()
{
  return type metadata accessor for Settings.StockFeed.ConfigOverrides();
}

uint64_t static Settings.StockFeed.configOverrides.getter()
{
  return static Settings.StockFeed.configOverrides.getter();
}

uint64_t static Settings.StockFeed.Card.swipeToDismiss.getter()
{
  return static Settings.StockFeed.Card.swipeToDismiss.getter();
}

uint64_t static Settings.StockFeed.Layout.overrideVerticalQuoteDetailLayout.getter()
{
  return static Settings.StockFeed.Layout.overrideVerticalQuoteDetailLayout.getter();
}

uint64_t static Settings.StockFeed.Layout.Chunking.overrideEnabled.getter()
{
  return static Settings.StockFeed.Layout.Chunking.overrideEnabled.getter();
}

uint64_t static Settings.StockFeed.Layout.Chunking.overrideChunkSize.getter()
{
  return static Settings.StockFeed.Layout.Chunking.overrideChunkSize.getter();
}

uint64_t static Settings.StockFeed.Toolbar.overrideAlwaysShowUpdatedLabelEnabled.getter()
{
  return static Settings.StockFeed.Toolbar.overrideAlwaysShowUpdatedLabelEnabled.getter();
}

uint64_t SettingsBundle.callAsFunction(title:additionalGroups:)()
{
  return SettingsBundle.callAsFunction(title:additionalGroups:)();
}

uint64_t static SettingsBundle.appLaunchUpsell.getter()
{
  return static SettingsBundle.appLaunchUpsell.getter();
}

uint64_t static SettingsBundle.ads.getter()
{
  return static SettingsBundle.ads.getter();
}

uint64_t type metadata accessor for SettingsBundle()
{
  return type metadata accessor for SettingsBundle();
}

uint64_t type metadata accessor for PresetItem()
{
  return type metadata accessor for PresetItem();
}

uint64_t PresetItem.init(_:label:actions:)()
{
  return PresetItem.init(_:label:actions:)();
}

uint64_t Configurable.setting<A>(_:)()
{
  return Configurable.setting<A>(_:)();
}

uint64_t Configurable.setting<A>(_:_:)()
{
  return Configurable.setting<A>(_:_:)();
}

uint64_t type metadata accessor for FeatureState()
{
  return type metadata accessor for FeatureState();
}

uint64_t type metadata accessor for SettingAction.PostInstruction()
{
  return type metadata accessor for SettingAction.PostInstruction();
}

uint64_t dispatch thunk of SettingAction.then(_:)()
{
  return dispatch thunk of SettingAction.then(_:)();
}

uint64_t type metadata accessor for SettingAction()
{
  return type metadata accessor for SettingAction();
}

uint64_t SettingAction.init(_:_:)()
{
  return SettingAction.init(_:_:)();
}

uint64_t type metadata accessor for ChangeBehavior()
{
  return type metadata accessor for ChangeBehavior();
}

uint64_t static SettingActions.resetOverrideEntitlement.getter()
{
  return static SettingActions.resetOverrideEntitlement.getter();
}

uint64_t static SettingActions.restart.getter()
{
  return static SettingActions.restart.getter();
}

uint64_t type metadata accessor for If()
{
  return type metadata accessor for If();
}

uint64_t If.init(_:_:)()
{
  return If.init(_:_:)();
}

uint64_t type metadata accessor for Item.ResetBehavior()
{
  return type metadata accessor for Item.ResetBehavior();
}

uint64_t static Item.RangeControlType.slider.getter()
{
  return static Item.RangeControlType.slider.getter();
}

uint64_t Item<>.init(_:label:resetBehavior:type:)()
{
  return Item<>.init(_:label:resetBehavior:type:)();
}

uint64_t Item<>.init(_:label:resetBehavior:actions:)()
{
  return Item<>.init(_:label:resetBehavior:actions:)();
}

{
  return Item<>.init(_:label:resetBehavior:actions:)();
}

uint64_t type metadata accessor for Item()
{
  return type metadata accessor for Item();
}

uint64_t Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)()
{
  return Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
}

uint64_t Page.init(title:_:)()
{
  return Page.init(title:_:)();
}

uint64_t type metadata accessor for Page()
{
  return type metadata accessor for Page();
}

uint64_t Group.init(title:footer:group:_:)()
{
  return Group.init(title:footer:group:_:)();
}

uint64_t Group.init(title:footer:_:)()
{
  return Group.init(title:footer:_:)();
}

uint64_t type metadata accessor for Group()
{
  return type metadata accessor for Group();
}

uint64_t type metadata accessor for Access()
{
  return type metadata accessor for Access();
}

uint64_t type metadata accessor for Domain()
{
  return type metadata accessor for Domain();
}

uint64_t Option.init(label:value:description:)()
{
  return Option.init(label:value:description:)();
}

uint64_t type metadata accessor for Option()
{
  return type metadata accessor for Option();
}

uint64_t static Presets.BundleSubscriptions.none.getter()
{
  return static Presets.BundleSubscriptions.none.getter();
}

uint64_t static Presets.BundleSubscriptions.iTMS5.getter()
{
  return static Presets.BundleSubscriptions.iTMS5.getter();
}

uint64_t static Presets.BundleSubscriptions.iTMS6.getter()
{
  return static Presets.BundleSubscriptions.iTMS6.getter();
}

uint64_t static Presets.BundleSubscriptions.iTMS7.getter()
{
  return static Presets.BundleSubscriptions.iTMS7.getter();
}

uint64_t static Presets.BundleSubscriptions.iTMS11.getter()
{
  return static Presets.BundleSubscriptions.iTMS11.getter();
}

uint64_t Setting<>.init(_:defaultValue:domain:access:options:)()
{
  return Setting<>.init(_:defaultValue:domain:access:options:)();
}

uint64_t type metadata accessor for Setting()
{
  return type metadata accessor for Setting();
}

uint64_t Setting.init(_:defaultValue:domain:access:)()
{
  return Setting.init(_:defaultValue:domain:access:)();
}

uint64_t dispatch thunk of Updatable.save<A>(setting:value:)()
{
  return dispatch thunk of Updatable.save<A>(setting:value:)();
}

uint64_t Updatable.save<A>(setting:value:)()
{
  return Updatable.save<A>(setting:value:)();
}

uint64_t Updatable.apply(preset:)()
{
  return Updatable.apply(preset:)();
}

uint64_t static Logging.debuggingEnabled.setter()
{
  return static Logging.debuggingEnabled.setter();
}

uint64_t type metadata accessor for Logging()
{
  return type metadata accessor for Logging();
}

Swift::Void __swiftcall AppSessionManager.appSessionDidTerminate()()
{
}

Swift::Void __swiftcall AppSessionManager.startAppSession()()
{
}

uint64_t AppSessionManager.wasPriorSessionCrashDetected.getter()
{
  return AppSessionManager.wasPriorSessionCrashDetected.getter();
}

uint64_t type metadata accessor for AppSessionManager()
{
  return type metadata accessor for AppSessionManager();
}

Swift::Void __swiftcall AccessTracker.enterGroup(groupName:)(Swift::String groupName)
{
}

Swift::Void __swiftcall AccessTracker.leaveGroup()()
{
}

uint64_t AccessTracker.submit<A>(_:onlyIfTimed:userInfo:completion:)()
{
  return AccessTracker.submit<A>(_:onlyIfTimed:userInfo:completion:)();
}

uint64_t SessionManager.end(endDate:completion:)()
{
  return SessionManager.end(endDate:completion:)();
}

uint64_t SessionManager.start(for:identifier:startDate:timestampJitter:)()
{
  return SessionManager.start(for:identifier:startDate:timestampJitter:)();
}

uint64_t SessionManager.tracker.getter()
{
  return SessionManager.tracker.getter();
}

uint64_t type metadata accessor for SessionManager()
{
  return type metadata accessor for SessionManager();
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

uint64_t PrivacyValidation.denylistDescriptors.getter()
{
  return PrivacyValidation.denylistDescriptors.getter();
}

uint64_t PrivacyValidation.isEnabled.getter()
{
  return PrivacyValidation.isEnabled.getter();
}

uint64_t type metadata accessor for PrivacyValidation()
{
  return type metadata accessor for PrivacyValidation();
}

uint64_t DenylistDescriptor.debugItem.getter()
{
  return DenylistDescriptor.debugItem.getter();
}

uint64_t type metadata accessor for DenylistDescriptor()
{
  return type metadata accessor for DenylistDescriptor();
}

uint64_t dispatch thunk of PrivacyValidationProviderType.privacyValidation.getter()
{
  return dispatch thunk of PrivacyValidationProviderType.privacyValidation.getter();
}

uint64_t type metadata accessor for Session.Kind()
{
  return type metadata accessor for Session.Kind();
}

uint64_t Tracker.push<A>(data:traits:file:line:)()
{
  return Tracker.push<A>(data:traits:file:line:)();
}

uint64_t Tracker.submit<A>(_:onlyIfTimed:completion:)()
{
  return Tracker.submit<A>(_:onlyIfTimed:completion:)();
}

uint64_t static Tracker.appEventManager.getter()
{
  return static Tracker.appEventManager.getter();
}

uint64_t Tracker.ifSession(block:)()
{
  return Tracker.ifSession(block:)();
}

uint64_t type metadata accessor for Tracker()
{
  return type metadata accessor for Tracker();
}

uint64_t type metadata accessor for OpenArticleIntent()
{
  return type metadata accessor for OpenArticleIntent();
}

uint64_t type metadata accessor for SavedArticleOptionsProvider()
{
  return type metadata accessor for SavedArticleOptionsProvider();
}

uint64_t Definition.whenTesting(_:_:)()
{
  return Definition.whenTesting(_:_:)();
}

uint64_t Definition.inScope(_:)()
{
  return Definition.inScope(_:)();
}

uint64_t type metadata accessor for CachePolicy()
{
  return type metadata accessor for CachePolicy();
}

uint64_t dispatch thunk of ContextType.useWeak<A>(_:for:)()
{
  return dispatch thunk of ContextType.useWeak<A>(_:for:)();
}

uint64_t zalgoIfMain.getter()
{
  return zalgoIfMain.getter();
}

uint64_t static Capabilities.isInternalBuild()()
{
  return static Capabilities.isInternalBuild()();
}

uint64_t type metadata accessor for Capabilities()
{
  return type metadata accessor for Capabilities();
}

uint64_t dispatch thunk of EventManager.trigger(on:behavior:block:)()
{
  return dispatch thunk of EventManager.trigger(on:behavior:block:)();
}

{
  return dispatch thunk of EventManager.trigger(on:behavior:block:)();
}

uint64_t type metadata accessor for PromiseError()
{
  return type metadata accessor for PromiseError();
}

uint64_t dispatch thunk of ResolverType.resolve<A>(_:name:)()
{
  return dispatch thunk of ResolverType.resolve<A>(_:name:)();
}

uint64_t dispatch thunk of ResolverType.resolve<A>(_:with:)()
{
  return dispatch thunk of ResolverType.resolve<A>(_:with:)();
}

uint64_t dispatch thunk of ResolverType.resolve<A>(_:)()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t StateMachine.add(transition:)()
{
  return StateMachine.add(transition:)();
}

uint64_t StateMachine.fire(event:)()
{
  return StateMachine.fire(event:)();
}

uint64_t StateMachine.init(state:)()
{
  return StateMachine.init(state:)();
}

uint64_t type metadata accessor for StateMachine()
{
  return type metadata accessor for StateMachine();
}

uint64_t type metadata accessor for CallbackScope()
{
  return type metadata accessor for CallbackScope();
}

uint64_t SingletonPool.init()()
{
  return SingletonPool.init()();
}

uint64_t type metadata accessor for SingletonPool()
{
  return type metadata accessor for SingletonPool();
}

uint64_t simulateCrash(_:_:)()
{
  return simulateCrash(_:_:)();
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

uint64_t ProxyContainer.callback.getter()
{
  return ProxyContainer.callback.getter();
}

uint64_t StartupTaskType.run()()
{
  return StartupTaskType.run()();
}

uint64_t StartupTaskType.group.getter()
{
  return StartupTaskType.group.getter();
}

uint64_t type metadata accessor for FrameworkAssembly()
{
  return type metadata accessor for FrameworkAssembly();
}

{
  return type metadata accessor for FrameworkAssembly();
}

{
  return type metadata accessor for FrameworkAssembly();
}

Swift::Void __swiftcall SceneStateMonitor.sceneDidDisconnect()()
{
}

Swift::Void __swiftcall SceneStateMonitor.sceneDidBecomeActive()()
{
}

Swift::Void __swiftcall SceneStateMonitor.sceneWillResignActive(with:)(Swift::String with)
{
}

Swift::Void __swiftcall SceneStateMonitor.sceneWillResignActive()()
{
}

Swift::Void __swiftcall SceneStateMonitor.sceneDidEnterBackground(with:)(Swift::String with)
{
}

Swift::Void __swiftcall SceneStateMonitor.sceneDidEnterBackground()()
{
}

Swift::Void __swiftcall SceneStateMonitor.sceneWillEnterForeground()()
{
}

uint64_t URLHandlerManager<A>.handle(url:options:route:)()
{
  return URLHandlerManager<A>.handle(url:options:route:)();
}

Swift::Void __swiftcall DebugCacheRegistry.clearCache()()
{
}

uint64_t type metadata accessor for DebugCacheRegistry()
{
  return type metadata accessor for DebugCacheRegistry();
}

uint64_t StartupTaskManager.onStartup(run:)()
{
  return StartupTaskManager.onStartup(run:)();
}

uint64_t StartupTaskManager.startAllTasks(launchOptions:phase:)()
{
  return StartupTaskManager.startAllTasks(launchOptions:phase:)();
}

uint64_t type metadata accessor for StartupTaskManager()
{
  return type metadata accessor for StartupTaskManager();
}

uint64_t type metadata accessor for PromiseDeduperFlags()
{
  return type metadata accessor for PromiseDeduperFlags();
}

uint64_t static EventTriggerBehavior.all.getter()
{
  return static EventTriggerBehavior.all.getter();
}

uint64_t static EventTriggerBehavior.eager.getter()
{
  return static EventTriggerBehavior.eager.getter();
}

uint64_t static EventTriggerBehavior.onlyOnce.getter()
{
  return static EventTriggerBehavior.onlyOnce.getter();
}

uint64_t type metadata accessor for EventTriggerBehavior()
{
  return type metadata accessor for EventTriggerBehavior();
}

uint64_t type metadata accessor for BackgroundFetchResult()
{
  return type metadata accessor for BackgroundFetchResult();
}

uint64_t type metadata accessor for BridgedBundleAssembly()
{
  return type metadata accessor for BridgedBundleAssembly();
}

uint64_t BridgedBundleAssembly.init(_:)()
{
  return BridgedBundleAssembly.init(_:)();
}

uint64_t RegistrationContainer.register<A>(_:name:factory:)()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t dispatch thunk of SceneStateManagerType.didBecomeActive(with:sourceApplication:sceneID:)()
{
  return dispatch thunk of SceneStateManagerType.didBecomeActive(with:sourceApplication:sceneID:)();
}

uint64_t dispatch thunk of SceneStateManagerType.didBecomeActive()()
{
  return dispatch thunk of SceneStateManagerType.didBecomeActive()();
}

uint64_t dispatch thunk of SceneStateManagerType.willResignActive()()
{
  return dispatch thunk of SceneStateManagerType.willResignActive()();
}

uint64_t dispatch thunk of SceneStateManagerType.didEnterBackground()()
{
  return dispatch thunk of SceneStateManagerType.didEnterBackground()();
}

uint64_t dispatch thunk of SceneStateManagerType.sceneDidDisconnect()()
{
  return dispatch thunk of SceneStateManagerType.sceneDidDisconnect()();
}

uint64_t dispatch thunk of SceneStateManagerType.willEnterForeground()()
{
  return dispatch thunk of SceneStateManagerType.willEnterForeground()();
}

uint64_t dispatch thunk of SceneStateManagerType.sceneWillConnectToSession(withOptions:)()
{
  return dispatch thunk of SceneStateManagerType.sceneWillConnectToSession(withOptions:)();
}

uint64_t dispatch thunk of SceneStateManagerType.add(monitor:)()
{
  return dispatch thunk of SceneStateManagerType.add(monitor:)();
}

uint64_t BackgroundFetchManager.performBackgroundFetch()()
{
  return BackgroundFetchManager.performBackgroundFetch()();
}

uint64_t type metadata accessor for BackgroundFetchManager()
{
  return type metadata accessor for BackgroundFetchManager();
}

uint64_t type metadata accessor for SceneConnectionOptions()
{
  return type metadata accessor for SceneConnectionOptions();
}

uint64_t StateMachineTransition.init(state:)()
{
  return StateMachineTransition.init(state:)();
}

uint64_t StateMachineTransition.didEnter(block:)()
{
  return StateMachineTransition.didEnter(block:)();
}

uint64_t StateMachineTransition.willExit(block:)()
{
  return StateMachineTransition.willExit(block:)();
}

uint64_t type metadata accessor for StateMachineTransition()
{
  return type metadata accessor for StateMachineTransition();
}

uint64_t dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)()
{
  return dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
}

{
  return dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
}

uint64_t RemoteNotificationManager.handleRemoteNotification(userInfo:)()
{
  return RemoteNotificationManager.handleRemoteNotification(userInfo:)();
}

uint64_t RemoteNotificationManager.whenActive(block:)()
{
  return RemoteNotificationManager.whenActive(block:)();
}

uint64_t type metadata accessor for RemoteNotificationManager()
{
  return type metadata accessor for RemoteNotificationManager();
}

uint64_t type metadata accessor for StartupTaskExecutionPhase()
{
  return type metadata accessor for StartupTaskExecutionPhase();
}

uint64_t dispatch thunk of ApplicationStateManagerType.applicationDidFinishLaunching(withOptions:)()
{
  return dispatch thunk of ApplicationStateManagerType.applicationDidFinishLaunching(withOptions:)();
}

uint64_t type metadata accessor for RemoteNotificationFetchResult()
{
  return type metadata accessor for RemoteNotificationFetchResult();
}

uint64_t when<A>(on:_:)()
{
  return when<A>(on:_:)();
}

uint64_t type metadata accessor for Scope()
{
  return type metadata accessor for Scope();
}

uint64_t zalgo.getter()
{
  return zalgo.getter();
}

uint64_t Promise.then<A>(on:closure:)()
{
  return Promise.then<A>(on:closure:)();
}

{
  return Promise.then<A>(on:closure:)();
}

uint64_t Promise.error(on:closure:)()
{
  return Promise.error(on:closure:)();
}

uint64_t Promise.init(value:)()
{
  return Promise.init(value:)();
}

uint64_t Promise.always(on:closure:)()
{
  return Promise.always(on:closure:)();
}

uint64_t Promise.timeout(after:on:message:)()
{
  return Promise.timeout(after:on:message:)();
}

uint64_t Promise.init(resolver:)()
{
  return Promise.init(resolver:)();
}

uint64_t firstly<A>(closure:)()
{
  return firstly<A>(closure:)();
}

uint64_t type metadata accessor for Container.Environment()
{
  return type metadata accessor for Container.Environment();
}

uint64_t Container.resolver.getter()
{
  return Container.resolver.getter();
}

uint64_t type metadata accessor for Container.TestSuite()
{
  return type metadata accessor for Container.TestSuite();
}

uint64_t asyncMain(block:)()
{
  return asyncMain(block:)();
}

uint64_t ViewEndData.init(endReason:)()
{
  return ViewEndData.init(endReason:)();
}

uint64_t type metadata accessor for ViewEndData()
{
  return type metadata accessor for ViewEndData();
}

uint64_t type metadata accessor for AppIntentType()
{
  return type metadata accessor for AppIntentType();
}

uint64_t backgroundTask(withName:timeout:work:)()
{
  return backgroundTask(withName:timeout:work:)();
}

uint64_t SessionObserver.window.setter()
{
  return SessionObserver.window.setter();
}

uint64_t type metadata accessor for SessionObserver()
{
  return type metadata accessor for SessionObserver();
}

uint64_t type metadata accessor for AppSessionResignEvent()
{
  return type metadata accessor for AppSessionResignEvent();
}

uint64_t type metadata accessor for AppSessionResumeEvent()
{
  return type metadata accessor for AppSessionResumeEvent();
}

uint64_t dispatch thunk of AgreedToTermsAndConditionsProvider.agreedToTermsAndConditions()()
{
  return dispatch thunk of AgreedToTermsAndConditionsProvider.agreedToTermsAndConditions()();
}

uint64_t type metadata accessor for EndReason()
{
  return type metadata accessor for EndReason();
}

uint64_t AppActivationURLHandler.init()()
{
  return AppActivationURLHandler.init()();
}

uint64_t type metadata accessor for AppActivationURLHandler()
{
  return type metadata accessor for AppActivationURLHandler();
}

uint64_t _AppIntentExecution.callAsFunction<A>(for:handler:)()
{
  return _AppIntentExecution.callAsFunction<A>(for:handler:)();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t static Logger.appIntents.getter()
{
  return static Logger.appIntents.getter();
}

uint64_t static Logger.widgetRefresh.getter()
{
  return static Logger.widgetRefresh.getter();
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

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t static Database.CacheSize.stocksFull.getter()
{
  return static Database.CacheSize.stocksFull.getter();
}

uint64_t type metadata accessor for Database.CacheSize()
{
  return type metadata accessor for Database.CacheSize();
}

uint64_t type metadata accessor for AppMonitor()
{
  return type metadata accessor for AppMonitor();
}

uint64_t type metadata accessor for DebugModel()
{
  return type metadata accessor for DebugModel();
}

uint64_t DebugWindow.debugDelegate.setter()
{
  return DebugWindow.debugDelegate.setter();
}

uint64_t type metadata accessor for DebugWindow()
{
  return type metadata accessor for DebugWindow();
}

uint64_t type metadata accessor for WindowScene()
{
  return type metadata accessor for WindowScene();
}

uint64_t AnyNavigator.init<A>(base:)()
{
  return AnyNavigator.init<A>(base:)();
}

uint64_t Bootstrapper.afterBootstrap(on:run:)()
{
  return Bootstrapper.afterBootstrap(on:run:)();
}

Swift::Void __swiftcall Bootstrapper.startBootstrapping(window:shouldOnboard:shouldCollapseSidebar:defaultWindowSize:)(UIWindow window, Swift::Bool shouldOnboard, Swift::Bool shouldCollapseSidebar, CGSize_optional defaultWindowSize)
{
}

Swift::Void __swiftcall Bootstrapper.startBootstrapping(window:shouldOnboard:shouldCollapseSidebar:)(UIWindow window, Swift::Bool shouldOnboard, Swift::Bool shouldCollapseSidebar)
{
}

uint64_t type metadata accessor for Bootstrapper()
{
  return type metadata accessor for Bootstrapper();
}

uint64_t SceneProvider.init()()
{
  return SceneProvider.init()();
}

uint64_t type metadata accessor for SceneProvider()
{
  return type metadata accessor for SceneProvider();
}

uint64_t type metadata accessor for ContainerScope()
{
  return type metadata accessor for ContainerScope();
}

uint64_t dispatch thunk of StackNavigator.onNavigationStart(closure:)()
{
  return dispatch thunk of StackNavigator.onNavigationStart(closure:)();
}

uint64_t dispatch thunk of DebugDataSource.add(_:_:)()
{
  return dispatch thunk of DebugDataSource.add(_:_:)();
}

uint64_t type metadata accessor for DebugDataSource()
{
  return type metadata accessor for DebugDataSource();
}

uint64_t dispatch thunk of MenuManagerType.validate(_:with:tracker:)()
{
  return dispatch thunk of MenuManagerType.validate(_:with:tracker:)();
}

uint64_t type metadata accessor for URLHandlerRoute()
{
  return type metadata accessor for URLHandlerRoute();
}

uint64_t ContainerManager.init(singletonPool:bundleAssemblies:assemblies:)()
{
  return ContainerManager.init(singletonPool:bundleAssemblies:assemblies:)();
}

uint64_t ContainerManager.containerEnvironment.getter()
{
  return ContainerManager.containerEnvironment.getter();
}

uint64_t ContainerManager.container(for:)()
{
  return ContainerManager.container(for:)();
}

uint64_t type metadata accessor for ContainerManager()
{
  return type metadata accessor for ContainerManager();
}

uint64_t dispatch thunk of SceneProviderType.register(_:)()
{
  return dispatch thunk of SceneProviderType.register(_:)();
}

uint64_t dispatch thunk of ToolbarManagerType.registerScene(_:)()
{
  return dispatch thunk of ToolbarManagerType.registerScene(_:)();
}

uint64_t StateRestoreController.__allocating_init(timeWindow:isStateRestorationEnabled:shouldAlwaysAllowStateRestoration:)()
{
  return StateRestoreController.__allocating_init(timeWindow:isStateRestorationEnabled:shouldAlwaysAllowStateRestoration:)();
}

uint64_t type metadata accessor for StateRestoreController()
{
  return type metadata accessor for StateRestoreController();
}

uint64_t dispatch thunk of KeyboardInputMonitorType.handle(_:)()
{
  return dispatch thunk of KeyboardInputMonitorType.handle(_:)();
}

uint64_t type metadata accessor for CardViewPresentationState()
{
  return type metadata accessor for CardViewPresentationState();
}

uint64_t type metadata accessor for DebugNavigationController()
{
  return type metadata accessor for DebugNavigationController();
}

Swift::Bool __swiftcall ShortcutItemHandlerManager.handle(shortcutItem:)(UIApplicationShortcutItem shortcutItem)
{
  return ShortcutItemHandlerManager.handle(shortcutItem:)(shortcutItem.super.isa);
}

uint64_t type metadata accessor for ShortcutItemHandlerManager()
{
  return type metadata accessor for ShortcutItemHandlerManager();
}

uint64_t UserActivityHandlerManager.handleAsync(userActivity:)()
{
  return UserActivityHandlerManager.handleAsync(userActivity:)();
}

Swift::Bool __swiftcall UserActivityHandlerManager.handle(userActivity:)(NSUserActivity userActivity)
{
  return UserActivityHandlerManager.handle(userActivity:)(userActivity.super.isa);
}

uint64_t type metadata accessor for UserActivityHandlerManager()
{
  return type metadata accessor for UserActivityHandlerManager();
}

uint64_t ContainerEnviromentProvider.enviroment(for:processInfo:)()
{
  return ContainerEnviromentProvider.enviroment(for:processInfo:)();
}

uint64_t ContainerEnviromentProvider.init()()
{
  return ContainerEnviromentProvider.init()();
}

uint64_t type metadata accessor for ContainerEnviromentProvider()
{
  return type metadata accessor for ContainerEnviromentProvider();
}

uint64_t dispatch thunk of StateRestorationActivityProvider.stateRestorationActivity.getter()
{
  return dispatch thunk of StateRestorationActivityProvider.stateRestorationActivity.getter();
}

uint64_t dispatch thunk of StateRestorationActivityProvider.stateRestorationActivity.setter()
{
  return dispatch thunk of StateRestorationActivityProvider.stateRestorationActivity.setter();
}

uint64_t DebugItem.init(title:model:)()
{
  return DebugItem.init(title:model:)();
}

uint64_t type metadata accessor for DebugItem()
{
  return type metadata accessor for DebugItem();
}

uint64_t Navigator.navigateWithoutAnimation(to:)()
{
  return Navigator.navigateWithoutAnimation(to:)();
}

uint64_t type metadata accessor for Publishers.MapKeyPath()
{
  return type metadata accessor for Publishers.MapKeyPath();
}

uint64_t type metadata accessor for Publishers.ReceiveOn()
{
  return type metadata accessor for Publishers.ReceiveOn();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t PassthroughSubject.init()()
{
  return PassthroughSubject.init()();
}

uint64_t type metadata accessor for PassthroughSubject()
{
  return type metadata accessor for PassthroughSubject();
}

uint64_t type metadata accessor for CurrentValueSubject()
{
  return type metadata accessor for CurrentValueSubject();
}

uint64_t Subject<>.send()()
{
  return Subject<>.send()();
}

uint64_t Publisher.map<A>(_:)()
{
  return Publisher.map<A>(_:)();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher<>.removeDuplicates()()
{
  return Publisher<>.removeDuplicates()();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t type metadata accessor for FeedAutoRefreshStrategy()
{
  return type metadata accessor for FeedAutoRefreshStrategy();
}

uint64_t StocksV2UserActivityDeserializer.deserialize(userActivity:)()
{
  return StocksV2UserActivityDeserializer.deserialize(userActivity:)();
}

uint64_t StocksActivity.identifier.getter()
{
  return StocksActivity.identifier.getter();
}

uint64_t StocksActivity.affectsNavigationStack.getter()
{
  return StocksActivity.affectsNavigationStack.getter();
}

uint64_t static StocksActivity.main.getter()
{
  return static StocksActivity.main.getter();
}

uint64_t static StocksActivity.Options.default.getter()
{
  return static StocksActivity.Options.default.getter();
}

uint64_t StocksActivity.StockFeed.stock.getter()
{
  return StocksActivity.StockFeed.stock.getter();
}

uint64_t type metadata accessor for StocksActivity.StockFeed()
{
  return type metadata accessor for StocksActivity.StockFeed();
}

uint64_t type metadata accessor for StocksActivity()
{
  return type metadata accessor for StocksActivity();
}

uint64_t static MainMetrics.defaultWindowWindowSize.getter()
{
  return static MainMetrics.defaultWindowWindowSize.getter();
}

uint64_t static MainMetrics.minimumWindowSize.getter()
{
  return static MainMetrics.minimumWindowSize.getter();
}

uint64_t type metadata accessor for ThemingStyle()
{
  return type metadata accessor for ThemingStyle();
}

uint64_t dispatch thunk of BaseStylerType.style(window:)()
{
  return dispatch thunk of BaseStylerType.style(window:)();
}

uint64_t dispatch thunk of BaseStylerType.theme.getter()
{
  return dispatch thunk of BaseStylerType.theme.getter();
}

uint64_t type metadata accessor for ScrollPosition()
{
  return type metadata accessor for ScrollPosition();
}

uint64_t dispatch thunk of DynamicStylerType.dynamic(for:)()
{
  return dispatch thunk of DynamicStylerType.dynamic(for:)();
}

uint64_t SidebarConfiguration.shouldCollapseSidebar.getter()
{
  return SidebarConfiguration.shouldCollapseSidebar.getter();
}

uint64_t type metadata accessor for SidebarConfiguration()
{
  return type metadata accessor for SidebarConfiguration();
}

uint64_t SidebarConfiguration.init(_:userActivity:)()
{
  return SidebarConfiguration.init(_:userActivity:)();
}

uint64_t SidebarConfiguration.init(_:)()
{
  return SidebarConfiguration.init(_:)();
}

uint64_t type metadata accessor for ForYouSectionDescriptor()
{
  return type metadata accessor for ForYouSectionDescriptor();
}

uint64_t SceneStateManagerBridge.init(activityReceiver:)()
{
  return SceneStateManagerBridge.init(activityReceiver:)();
}

uint64_t type metadata accessor for SceneStateManagerBridge()
{
  return type metadata accessor for SceneStateManagerBridge();
}

uint64_t dispatch thunk of WelcomeFlowProviderType.shouldShowWelcome()()
{
  return dispatch thunk of WelcomeFlowProviderType.shouldShowWelcome()();
}

Swift::Void __swiftcall IdentificationResetManager.resetIdentifierIfNeeded()()
{
}

uint64_t type metadata accessor for IdentificationResetManager()
{
  return type metadata accessor for IdentificationResetManager();
}

uint64_t dispatch thunk of ScrollRestorationManagerType.userActivity.setter()
{
  return dispatch thunk of ScrollRestorationManagerType.userActivity.setter();
}

uint64_t type metadata accessor for ArticleTopStoriesOptionsProvider()
{
  return type metadata accessor for ArticleTopStoriesOptionsProvider();
}

uint64_t dispatch thunk of Theming.style.getter()
{
  return dispatch thunk of Theming.style.getter();
}

uint64_t type metadata accessor for AppEvent()
{
  return type metadata accessor for AppEvent();
}

uint64_t FrameworkAssembly.init()()
{
  return FrameworkAssembly.init()();
}

uint64_t dispatch thunk of WidgetCenter.reloadAllTimelines()()
{
  return dispatch thunk of WidgetCenter.reloadAllTimelines()();
}

uint64_t static WidgetCenter.shared.getter()
{
  return static WidgetCenter.shared.getter();
}

uint64_t type metadata accessor for WidgetCenter()
{
  return type metadata accessor for WidgetCenter();
}

uint64_t Dictionary.init()()
{
  return Dictionary.init()();
}

uint64_t Array.init()()
{
  return Array.init()();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary<>.applicationStateLaunchOptions.getter()
{
  return Dictionary<>.applicationStateLaunchOptions.getter();
}

uint64_t Dictionary.mapValues<A>(_:)()
{
  return Dictionary.mapValues<A>(_:)();
}

uint64_t type metadata accessor for Dictionary()
{
  return type metadata accessor for Dictionary();
}

uint64_t Dictionary.subscript.getter()
{
  return Dictionary.subscript.getter();
}

uint64_t Dictionary.subscript.setter()
{
  return Dictionary.subscript.setter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.denylistDescriptorValueDebugItem.getter()
{
  return String.denylistDescriptorValueDebugItem.getter();
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

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return dispatch thunk of Sequence.underestimatedCount.getter();
}

uint64_t Sequence.enumerated()()
{
  return Sequence.enumerated()();
}

uint64_t Sequence.reduce<A>(into:_:)()
{
  return Sequence.reduce<A>(into:_:)();
}

uint64_t Sequence.sorted(by:)()
{
  return Sequence.sorted(by:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
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

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static Array._adoptStorage(_:count:)()
{
  return static Array._adoptStorage(_:count:)();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array.+ infix(_:_:)()
{
  return static Array.+ infix(_:_:)();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t static Array.+= infix(_:_:)()
{
  return static Array.+= infix(_:_:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Double __swiftcall Double.millisecondsUntilCurrentMediaTime()()
{
  Double.millisecondsUntilCurrentMediaTime()();
  return result;
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static NSUserDefaults.stocksShared.getter()
{
  return static NSUserDefaults.stocksShared.getter();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t static OS_dispatch_queue.global(qualityOfService:)()
{
  return static OS_dispatch_queue.global(qualityOfService:)();
}

uint64_t static NSNotificationName.stocksDidClearSharedCache.getter()
{
  return static NSNotificationName.stocksDidClearSharedCache.getter();
}

uint64_t UISceneConnectionOptions.connectionOptions.getter()
{
  return UISceneConnectionOptions.connectionOptions.getter();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t static UIDevice.isSlow.getter()
{
  return static UIDevice.isSlow.getter();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
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

uint64_t type metadata accessor for _SetStorage()
{
  return type metadata accessor for _SetStorage();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t type metadata accessor for ManagedBuffer()
{
  return type metadata accessor for ManagedBuffer();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t ContiguousArray.append(_:)()
{
  return ContiguousArray.append(_:)();
}

uint64_t ContiguousArray.init()()
{
  return ContiguousArray.init()();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return type metadata accessor for ContiguousArray();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t type metadata accessor for EnumeratedSequence()
{
  return type metadata accessor for EnumeratedSequence();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t type metadata accessor for _DictionaryStorage()
{
  return type metadata accessor for _DictionaryStorage();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t type metadata accessor for _ContiguousArrayStorage()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _diagnoseUnexpectedEnumCase<A>(type:)()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
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

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t FCURLForTodayDropbox()
{
  return _FCURLForTodayDropbox();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

long double exp2(long double __x)
{
  return _exp2(__x);
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return _swift_getFunctionTypeMetadata0();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return _swift_getFunctionTypeMetadata1();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_task_getMainExecutor()
{
  return _swift_task_getMainExecutor();
}

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}