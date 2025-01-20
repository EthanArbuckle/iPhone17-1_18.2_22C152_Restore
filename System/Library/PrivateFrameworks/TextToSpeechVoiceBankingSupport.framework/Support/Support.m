uint64_t sub_1000044FC(void *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0;
  swift_unknownObjectUnownedInit();

  return v2;
}

uint64_t sub_100004548()
{
  uint64_t v1 = v0;
  uint64_t v31 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000493C(&qword_10002D3E0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TTSVBDataStore.XPCServiceConfig();
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  __chkstk_darwin(v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  TTSVBVoiceBankingManager.xpcServiceConfig.getter();

  TTSVBDataStore.XPCServiceConfig.storeURL.getter();
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v7, 0, 1, v12);
  v14 = (void *)TTSVBDataStore.XPCServiceConfig.model.getter();
  TTSVBDataStore.XPCServiceConfig.options.getter();
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) != 1)
  {
    URL._bridgeToObjectiveC()(v15);
    v16 = v17;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v12);
  }
  id v18 = objc_allocWithZone((Class)NSXPCStoreServer);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v20 = [v18 initForStoreWithURL:v16 usingModel:v14 options:isa policy:0];

  v21 = (void **)(v1 + 16);
  swift_beginAccess();
  v22 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v20;

  static TTSVBLog.daemon.getter();
  v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Will start listening on XPCStoreServer", v25, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v31);
  swift_beginAccess();
  v26 = *v21;
  if (*v21)
  {
    swift_endAccess();
    [v26 startListening];
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v10, v30);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v30);
    return swift_endAccess();
  }
}

uint64_t sub_10000493C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004980()
{
  swift_unknownObjectUnownedDestroy();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for VoiceBankingXPCStore()
{
  return self;
}

id sub_1000049E4()
{
  uint64_t v1 = OBJC_IVAR____TtC13voicebankingd35VoiceBankingUserNotificationManager____lazy_storage___userNotificationCenter;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC13voicebankingd35VoiceBankingUserNotificationManager____lazy_storage___userNotificationCenter);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC13voicebankingd35VoiceBankingUserNotificationManager____lazy_storage___userNotificationCenter);
  }
  else
  {
    id v4 = objc_allocWithZone((Class)UNUserNotificationCenter);
    NSString v5 = String._bridgeToObjectiveC()();
    id v6 = [v4 initWithBundleIdentifier:v5];

    v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id VoiceBankingXPCServer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void sub_100004B1C()
{
  id v1 = sub_1000049E4();
  [v1 setDelegate:v0];
  [v1 setWantsNotificationResponsesDelivered];
}

void sub_100004B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = sub_1000049E4();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v5;
  v12[3] = a1;
  v12[4] = a2;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = a5;
  v12[8] = v11;
  v16[4] = sub_1000050C4;
  v16[5] = v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_100005A70;
  v16[3] = &unk_100028E08;
  uint64_t v13 = _Block_copy(v16);
  id v14 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = v11;
  swift_release();
  [v15 getNotificationSettingsWithCompletionHandler:v13];
  _Block_release(v13);
}

void sub_100004C9C(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v40 = a8;
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v41 = v15;
  uint64_t v42 = v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v17);
  v22 = (char *)&v39 - v21;
  __chkstk_darwin(v20);
  os_log_type_t v24 = (char *)&v39 - v23;
  v25 = (char *)[a1 authorizationStatus];
  if ((unint64_t)(v25 - 2) >= 3)
  {
    v39 = a2;
    if (v25)
    {
      if (v25 == (char *)1)
      {
        static TTSVBLog.daemon.getter();
        v26 = Logger.logObject.getter();
        os_log_type_t v27 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v26, v27))
        {
          uint64_t v28 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v28 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "Will not schedule notification. User has denied user notifications", v28, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v42 + 8))(v24, v41);
      }
      else
      {
        static TTSVBLog.daemon.getter();
        v36 = Logger.logObject.getter();
        os_log_type_t v37 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v36, v37))
        {
          v38 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v38 = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, v37, "Unknown user notification authorizationStatus", v38, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v42 + 8))(v19, v41);
      }
    }
    else
    {
      static TTSVBLog.daemon.getter();
      uint64_t v29 = Logger.logObject.getter();
      os_log_type_t v30 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Will request user notification permission", v31, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v42 + 8))(v22, v41);
      v32 = (void *)swift_allocObject();
      v33 = v39;
      v32[2] = v39;
      v32[3] = a3;
      v32[4] = a4;
      v32[5] = a5;
      v32[6] = a6;
      v32[7] = a7;
      aBlock[4] = sub_1000086AC;
      aBlock[5] = v32;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000059F8;
      aBlock[3] = &unk_100028F90;
      v34 = _Block_copy(aBlock);
      id v35 = v33;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_release();
      [v40 requestAuthorizationWithOptions:7 completionHandler:v34];
      _Block_release(v34);
    }
  }
  else
  {
    sub_1000054A4(a3, a4, a5, a6, a7);
  }
}

uint64_t sub_100005074()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 72, 7);
}

void sub_1000050C4(void *a1)
{
  sub_100004C9C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void **)(v1 + 64));
}

void sub_1000050D8(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v47 = a8;
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v41 - v20;
  uint64_t v22 = __chkstk_darwin(v19);
  v25 = (char *)&v41 - v24;
  if (a2)
  {
    uint64_t v26 = v23;
    uint64_t v47 = v22;
    swift_errorRetain();
    static TTSVBLog.daemon.getter();
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v30 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 138412290;
      swift_errorRetain();
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v48 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v30 = v31;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Error occurred requesting notification permission: %@", v29, 0xCu);
      sub_10000493C(&qword_10002D3F0);
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
    (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v47);
  }
  else
  {
    uint64_t v42 = a4;
    uint64_t v43 = a5;
    uint64_t v44 = a6;
    uint64_t v45 = a3;
    uint64_t v46 = a7;
    uint64_t v32 = v23;
    if (a1)
    {
      uint64_t v33 = v22;
      static TTSVBLog.daemon.getter();
      v34 = Logger.logObject.getter();
      os_log_type_t v35 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "User notification permission was granted. Proceeding with scheduling notification", v36, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v32 + 8))(v21, v33);
      sub_1000054A4(v42, v43, v44, v46, v47);
    }
    else
    {
      uint64_t v37 = v22;
      static TTSVBLog.daemon.getter();
      v38 = Logger.logObject.getter();
      os_log_type_t v39 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v38, v39))
      {
        id v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "Will not schedule notification. User has denied user notifications", v40, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v32 + 8))(v18, v37);
    }
  }
}

void sub_1000054A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v38 = v6;
  __chkstk_darwin(v6);
  v36 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000493C(&qword_10002D3E0);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [objc_allocWithZone((Class)UNMutableNotificationContent) init];
  NSString v12 = String._bridgeToObjectiveC()();
  [v11 setTitle:v12];

  NSString v13 = String._bridgeToObjectiveC()();
  [v11 setBody:v13];

  NSString v14 = String._bridgeToObjectiveC()();
  [v11 setThreadIdentifier:v14];

  [v11 setInterruptionLevel:a5];
  URL.init(string:)();
  uint64_t v15 = type metadata accessor for URL();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v18 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v10, 1, v15) != 1)
  {
    URL._bridgeToObjectiveC()(v17);
    uint64_t v18 = v19;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v10, v15);
  }
  [v11 setDefaultActionURL:v18];

  id v20 = [self triggerWithTimeInterval:0 repeats:2.0];
  id v21 = v11;
  id v22 = v20;
  NSString v23 = String._bridgeToObjectiveC()();
  id v24 = [self requestWithIdentifier:v23 content:v21 trigger:v22];

  id v25 = sub_1000049E4();
  sub_10000493C(&qword_10002D3E8);
  uint64_t v26 = swift_allocObject();
  long long v35 = xmmword_100024500;
  *(_OWORD *)(v26 + 16) = xmmword_100024500;
  strcpy((char *)(v26 + 32), "PersonalVoice");
  *(_WORD *)(v26 + 46) = -4864;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v25 removeDeliveredNotificationsWithIdentifiers:isa];

  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = v35;
  strcpy((char *)(v28 + 32), "PersonalVoice");
  *(_WORD *)(v28 + 46) = -4864;
  Class v29 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v25 removePendingNotificationRequestsWithIdentifiers:v29];

  os_log_type_t v30 = v36;
  static TTSVBLog.daemon.getter();
  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Will schedule user notification", v33, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v37 + 8))(v30, v38);
  aBlock[4] = sub_100005AF0;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005DBC;
  aBlock[3] = &unk_100028FB8;
  v34 = _Block_copy(aBlock);
  [v25 addNotificationRequest:v24 withCompletionHandler:v34];
  _Block_release(v34);
}

void sub_1000059F8(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_100005A70(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100005AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005AE8()
{
  return swift_release();
}

uint64_t sub_100005AF0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v19 - v7;
  if (a1)
  {
    swift_errorRetain();
    static TTSVBLog.daemon.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      v19[0] = v2;
      NSString v13 = (void *)v12;
      *(_DWORD *)id v11 = 138412290;
      swift_errorRetain();
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      v19[1] = v14;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *NSString v13 = v14;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Error occurred scheduling user notification: %@", v11, 0xCu);
      sub_10000493C(&qword_10002D3F0);
      swift_arrayDestroy();
      uint64_t v2 = v19[0];
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
    uint64_t v8 = v6;
  }
  else
  {
    static TTSVBLog.daemon.getter();
    uint64_t v15 = Logger.logObject.getter();
    uint64_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, (os_log_type_t)v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, (os_log_type_t)v16, "Did schedule user notification", v17, 2u);
      swift_slowDealloc();
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

void sub_100005DBC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_100005E28()
{
  uint64_t v1 = OBJC_IVAR____TtC13voicebankingd35VoiceBankingUserNotificationManager____lazy_storage___voicebankingUserNotificationBundle;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC13voicebankingd35VoiceBankingUserNotificationManager____lazy_storage___voicebankingUserNotificationBundle);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v4 = objc_allocWithZone((Class)NSBundle);
    NSString v5 = String._bridgeToObjectiveC()();
    id v3 = [v4 initWithPath:v5];

    id v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v7 = v3;
    sub_100008058(v6);
  }
  sub_100008654(v2);
  return v3;
}

uint64_t sub_100005ED8()
{
  return 0;
}

uint64_t sub_100005EE0(uint64_t a1, uint64_t a2, char a3)
{
  swift_bridgeObjectRetain();
  if ((a3 & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t Type = AXDeviceGetType();
  if (Type == 3)
  {
    uint64_t v5 = 0x444150495FLL;
    unint64_t v6 = 0xE500000000000000;
  }
  else
  {
    if (Type != 1) {
      goto LABEL_7;
    }
    uint64_t v5 = 0x454E4F4850495FLL;
    unint64_t v6 = 0xE700000000000000;
  }
  String.append(_:)(*(Swift::String *)&v5);
LABEL_7:
  id v7 = sub_100005E28();
  if (!v7) {
    return a1;
  }
  uint64_t v8 = v7;
  swift_bridgeObjectRetain();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v8 localizedStringForKey:v9 value:0 table:v10];

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();

  return v12;
}

uint64_t sub_100006028()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000062A0(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  NSString v13 = (uint64_t (*)(id))((char *)&dword_10002D2C8 + dword_10002D2C8);
  id v8 = a1;
  id v9 = a2;
  id v10 = a4;
  id v11 = (void *)swift_task_alloc();
  v4[6] = v11;
  *id v11 = v4;
  v11[1] = sub_100006384;
  return v13(v9);
}

uint64_t sub_100006384()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 40);
  uint64_t v2 = *(void **)(*v0 + 32);
  uint64_t v3 = *(void **)(*v0 + 24);
  uint64_t v4 = *(void **)(*v0 + 16);
  uint64_t v7 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_100006678(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  NSString v13 = (uint64_t (*)(id))((char *)&dword_10002D2D8 + dword_10002D2D8);
  id v8 = a1;
  id v9 = a2;
  id v10 = a4;
  id v11 = (void *)swift_task_alloc();
  v4[6] = v11;
  *id v11 = v4;
  v11[1] = sub_10000675C;
  return v13(v9);
}

uint64_t sub_10000675C(uint64_t a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 40);
  uint64_t v4 = *(void **)(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 24);
  unint64_t v6 = *(void **)(*v1 + 16);
  uint64_t v9 = *v1;
  swift_task_dealloc();

  v3[2](v3, a1);
  _Block_release(v3);
  uint64_t v7 = *(uint64_t (**)(void))(v9 + 8);
  return v7();
}

id VoiceBankingXPCServer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_1000069D0(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1000069D8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1000069EC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100006A00@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100006A14(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100006A44@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100006A70@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100006A94(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100006AA8(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100006ABC(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100006AD0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100006AE4(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100006AF8(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100006B0C(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100006B20()
{
  return *v0 == 0;
}

uint64_t sub_100006B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100006B48(void *result)
{
  *v1 &= ~*result;
  return result;
}

BOOL sub_100006B5C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100006B70@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100007740(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *sub_100006BB0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_100006BBC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100006BCC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100006BD8(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_100008840;
  return v6();
}

uint64_t sub_100006CA4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100008840;
  return v7();
}

uint64_t sub_100006D70(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_1000082F8(a1);
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

uint64_t sub_100006F14(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100006FF0;
  return v6(a1);
}

uint64_t sub_100006FF0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000070E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000071BC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    Objectuint64_t Type = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000085F4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    Objectuint64_t Type = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000085F4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000085A4((uint64_t)v12);
  return v7;
}

uint64_t sub_1000071BC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100007378(a5, a6);
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

uint64_t sub_100007378(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007410(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000075F0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000075F0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007410(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007588(v2, 0);
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

void *sub_100007588(uint64_t a1, uint64_t a2)
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
  sub_10000493C(&qword_10002D540);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000075F0(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000493C(&qword_10002D540);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  NSString v13 = a4 + 32;
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

uint64_t sub_100007740(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  unint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_100007778(uint64_t a1)
{
  v1[4] = a1;
  uint64_t v2 = type metadata accessor for Logger();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return _swift_task_switch(sub_100007838, 0, 0);
}

uint64_t sub_100007838()
{
  id v22 = v0;
  uint64_t v1 = (void *)v0[4];
  static TTSVBLog.daemon.getter();
  id v2 = v1;
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v18 = v0[6];
    uint64_t v5 = (void *)v0[4];
    uint64_t v19 = v0[5];
    uint64_t v20 = v0[7];
    uint64_t v17 = v5;
    uint64_t v6 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    v0[2] = sub_1000070E8(0xD000000000000025, 0x8000000100024E60, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v6 + 12) = 2080;
    id v7 = [v5 description];
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    v0[3] = sub_1000070E8(v8, v10, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s. response=%s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    uint64_t v12 = v0[6];
    uint64_t v11 = v0[7];
    uint64_t v14 = (void *)v0[4];
    uint64_t v13 = v0[5];

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_100007AA0(uint64_t a1)
{
  v1[4] = a1;
  uint64_t v2 = type metadata accessor for Logger();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return _swift_task_switch(sub_100007B60, 0, 0);
}

uint64_t sub_100007B60()
{
  id v22 = v0;
  uint64_t v1 = (void *)v0[4];
  static TTSVBLog.daemon.getter();
  id v2 = v1;
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v18 = v0[6];
    uint64_t v5 = (void *)v0[4];
    uint64_t v19 = v0[5];
    uint64_t v20 = v0[7];
    uint64_t v17 = v5;
    uint64_t v6 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    v0[2] = sub_1000070E8(0xD000000000000026, 0x8000000100024E30, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v6 + 12) = 2080;
    id v7 = [v5 description];
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    v0[3] = sub_1000070E8(v8, v10, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s. notification=%s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    uint64_t v12 = v0[6];
    uint64_t v11 = v0[7];
    uint64_t v14 = (void *)v0[4];
    uint64_t v13 = v0[5];

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(uint64_t))v0[1];
  return v15(26);
}

uint64_t sub_100007DCC(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TTSVBLog.daemon.getter();
  id v6 = a1;
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v16 = v2;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v18 = v15;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v17 = sub_1000070E8(0xD00000000000002ALL, 0x8000000100024BC0, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v9 + 12) = 2080;
    if (a1)
    {
      id v10 = [v6 description];
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v13 = v12;
    }
    else
    {
      unint64_t v13 = 0xE600000000000000;
      uint64_t v11 = 0x3E656E6F6E3CLL;
    }
    uint64_t v17 = sub_1000070E8(v11, v13, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s. notification=%s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v16);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

void sub_100008058(id a1)
{
  if (a1 != (id)1) {
}
  }

uint64_t type metadata accessor for VoiceBankingUserNotificationManager()
{
  return self;
}

void type metadata accessor for UNNotificationInterruptionLevel(uint64_t a1)
{
}

uint64_t sub_1000080A4()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  id v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *id v6 = v1;
  v6[1] = sub_100008840;
  id v7 = (uint64_t (*)(void *, void *, void *, void *))((char *)&dword_10002D378 + dword_10002D378);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_100008168()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100008840;
  id v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10002D388 + dword_10002D388);
  return v6(v2, v3, v4);
}

uint64_t sub_10000822C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  id v6 = (int *)v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100008840;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10002D398 + dword_10002D398);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1000082F8(uint64_t a1)
{
  uint64_t v2 = sub_10000493C(&qword_10002D370);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008358()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008390(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100006028;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10002D3A8 + dword_10002D3A8);
  return v6(a1, v4);
}

uint64_t sub_10000844C()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000849C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  id v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *id v6 = v1;
  v6[1] = sub_100008840;
  id v7 = (uint64_t (*)(void *, void *, void *, void *))((char *)&dword_10002D3B8 + dword_10002D3B8);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_100008564()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000085A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000085F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_100008654(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_100008664()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_1000086AC(char a1, uint64_t a2)
{
  sub_1000050D8(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

void type metadata accessor for UNNotificationPresentationOptions(uint64_t a1)
{
}

void sub_1000086D0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100008718()
{
  return sub_100008780(&qword_10002D400);
}

uint64_t sub_10000874C()
{
  return sub_100008780(&qword_10002D408);
}

uint64_t sub_100008780(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UNNotificationPresentationOptions(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000087C4()
{
  return sub_100008780(&qword_10002D410);
}

uint64_t sub_1000087F8()
{
  return sub_100008780(&qword_10002D418);
}

uint64_t sub_100008844@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1000088A0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t VoiceBankingXPCServer.delegate.getter()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t VoiceBankingXPCServer.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*VoiceBankingXPCServer.delegate.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_100008A48;
}

void sub_100008A48(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

id VoiceBankingXPCServer.init()()
{
  Objectuint64_t Type = (objc_class *)swift_getObjectType();
  *(void *)&v0[OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for TTSVBService();
  uint64_t v2 = v0;
  static TTSVBService.serviceName.getter();
  id v3 = objc_allocWithZone((Class)NSXPCListener);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v5 = [v3 initWithMachServiceName:v4];

  *(void *)&v2[OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_listener] = v5;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, "init");
}

Swift::Void __swiftcall VoiceBankingXPCServer.start()()
{
  uint64_t v1 = OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_listener;
  [*(id *)(v0 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_listener) setDelegate:v0];
  uint64_t v2 = *(void **)(v0 + v1);

  [v2 resume];
}

Swift::Bool __swiftcall VoiceBankingXPCServer.listener(_:shouldAcceptNewConnection:)(NSXPCListener _, NSXPCConnection shouldAcceptNewConnection)
{
  return sub_10000EA5C(shouldAcceptNewConnection.super.isa);
}

uint64_t VoiceBankingXPCServer.createVoice(named:localeID:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = v6 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v15 = *(void *)(v13 + 8);
    Objectuint64_t Type = swift_getObjectType();
    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = a1;
    v17[3] = a2;
    v17[4] = a3;
    v17[5] = a4;
    v17[6] = a5;
    v17[7] = a6;
    uint64_t v18 = *(void (**)(uint64_t (*)(), void *, uint64_t, uint64_t))(v15 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v18(sub_10000F128, v17, ObjectType, v15);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100008E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a6;
  *(void *)(v9 + 24) = a7;
  swift_retain();
  TTSVBVoiceBankingManager.createVoice(named:localeID:completion:)();

  return swift_release();
}

uint64_t sub_100008F24(uint64_t a1, void (*a2)(uint64_t, void *), uint64_t a3)
{
  uint64_t v61 = a3;
  v63 = a2;
  uint64_t v55 = a1;
  v62 = (void *)type metadata accessor for TTSVBError();
  uint64_t v3 = *(v62 - 1);
  uint64_t v4 = __chkstk_darwin(v62);
  os_log_t v57 = (os_log_t)((char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v52 - v6;
  uint64_t v8 = sub_10000493C((uint64_t *)&unk_10002D520);
  __chkstk_darwin(v8 - 8);
  v60 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v58 = *(void *)(v10 - 8);
  uint64_t v59 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v56 = (char *)&v52 - v14;
  uint64_t v15 = type metadata accessor for UUID();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = ((char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v52 - v20;
  uint64_t v22 = sub_10000493C(&qword_10002D5A0);
  __chkstk_darwin(v22);
  id v24 = (char *)&v52 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010498(v55, (uint64_t)v24, &qword_10002D5A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v55 = v16;
    v56 = (char *)v15;
    id v25 = v62;
    (*(void (**)(char *, char *, void *))(v3 + 32))(v7, v24, v62);
    static TTSVBLog.daemon.getter();
    uint64_t v26 = *(void (**)(os_log_t, char *, void *))(v3 + 16);
    v26(v57, v7, v25);
    os_log_type_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.error.getter();
    Class v29 = v7;
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v30 = swift_slowAlloc();
      v54 = v13;
      uint64_t v31 = (uint8_t *)v30;
      uint64_t v32 = swift_slowAlloc();
      v53 = v7;
      uint64_t v33 = (void *)v32;
      *(_DWORD *)uint64_t v31 = 138412290;
      v52 = v31 + 4;
      sub_10000FF90((unint64_t *)&qword_10002D530, (void (*)(uint64_t))&type metadata accessor for TTSVBError);
      swift_allocError();
      os_log_t v34 = v57;
      v26(v35, (char *)v57, v62);
      uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v65 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v33 = v36;
      id v25 = v62;
      uint64_t v37 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
      v37((char *)v34, (uint64_t)v62);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Error creating voice: %@", v31, 0xCu);
      sub_10000493C(&qword_10002D3F0);
      swift_arrayDestroy();
      Class v29 = v53;
      swift_slowDealloc();
      uint64_t v13 = v54;
      swift_slowDealloc();
    }
    else
    {
      uint64_t v37 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
      v37((char *)v57, (uint64_t)v25);
    }

    (*(void (**)(char *, uint64_t))(v58 + 8))(v13, v59);
    uint64_t v46 = (uint64_t)v60;
    (*(void (**)(char *, uint64_t, uint64_t, char *))(v55 + 56))(v60, 1, 1, v56);
    uint64_t v47 = (void *)TTSVBError.boxed.getter();
    v63(v46, v47);

    sub_100010564(v46, (uint64_t *)&unk_10002D520);
    uint64_t v48 = v29;
    uint64_t v49 = (uint64_t)v25;
  }
  else
  {
    uint64_t v38 = v63;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v24, v15);
    static TTSVBLog.daemon.getter();
    v62 = *(void **)(v16 + 16);
    ((void (*)(NSObject *, char *, uint64_t))v62)(v19, v21, v15);
    os_log_type_t v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v39, v40))
    {
      os_log_t v57 = v39;
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v65 = v55;
      *(_DWORD *)uint64_t v41 = 136315138;
      uint64_t v42 = UUID.uuidString.getter();
      uint64_t v64 = sub_1000070E8(v42, v43, &v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v37 = *(uint64_t (**)(char *, uint64_t))(v16 + 8);
      v37((char *)v19, v15);
      os_log_t v44 = v57;
      _os_log_impl((void *)&_mh_execute_header, v57, v40, "Succesfully created voice: %s", v41, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v45 = v63;
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v58 + 8))(v56, v59);
    }
    else
    {
      uint64_t v37 = *(uint64_t (**)(char *, uint64_t))(v16 + 8);
      v37((char *)v19, v15);

      (*(void (**)(char *, uint64_t))(v58 + 8))(v56, v59);
      uint64_t v45 = v38;
    }
    uint64_t v50 = (uint64_t)v60;
    ((void (*)(char *, char *, uint64_t))v62)(v60, v21, v15);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(v50, 0, 1, v15);
    v45(v50, 0);
    sub_100010564(v50, (uint64_t *)&unk_10002D520);
    uint64_t v48 = v21;
    uint64_t v49 = v15;
  }
  return v37(v48, v49);
}

uint64_t VoiceBankingXPCServer.importTrainingData(fromDirectory:creatingVoiceName:localeID:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v31 = a6;
  uint64_t v32 = a4;
  uint64_t v33 = a3;
  uint64_t v30 = a2;
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v7 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v28 = *(void *)(v15 + 8);
    Objectuint64_t Type = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
    unint64_t v17 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    unint64_t v18 = (v13 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v19 = a5;
    uint64_t v27 = a7;
    uint64_t v20 = swift_allocObject();
    uint64_t v21 = v33;
    *(void *)(v20 + 16) = v30;
    *(void *)(v20 + 24) = v21;
    (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v20 + v17, v14, v11);
    uint64_t v22 = (void *)(v20 + v18);
    void *v22 = v32;
    v22[1] = v19;
    uint64_t v23 = (void *)(v20 + ((v18 + 23) & 0xFFFFFFFFFFFFFFF8));
    uint64_t v24 = v27;
    uint64_t v25 = v28;
    void *v23 = v31;
    v23[1] = v24;
    uint64_t v26 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v25 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v26(sub_10000F22C, v20, ObjectType, v25);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100009A84(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v38 = a7;
  uint64_t v39 = a8;
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v36 = *(void *)(v16 - 8);
  uint64_t v37 = v16;
  __chkstk_darwin(v16);
  unint64_t v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TTSVBLog.daemon.getter();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v35 = v12;
  v19(v15, a4, v12);
  swift_bridgeObjectRetain_n();
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.info.getter();
  int v34 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v33 = a6;
    uint64_t v23 = v22;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v41 = v30;
    *(_DWORD *)uint64_t v23 = 136315394;
    os_log_t v29 = v20;
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_1000070E8(a2, a3, &v41);
    uint64_t v31 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v23 + 12) = 2080;
    uint64_t v32 = a4;
    uint64_t v24 = URL.path.getter();
    uint64_t v40 = sub_1000070E8(v24, v25, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v35);
    uint64_t v20 = v29;
    _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v34, "Will import training data creating voice: '%s'. Data=%s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v35);
  }

  (*(void (**)(char *, uint64_t))(v36 + 8))(v18, v37);
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v38;
  *(void *)(v26 + 24) = v39;
  swift_retain();
  TTSVBVoiceBankingManager.importTrainingData(fromDirectory:creatingVoiceName:localeID:completion:)();
  return swift_release();
}

uint64_t VoiceBankingXPCServer.importModel(fromDirectory:overrideLocaleID:addingToVoice:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v32 = a3;
  uint64_t v33 = a6;
  uint64_t v30 = a2;
  uint64_t v31 = a5;
  uint64_t v28 = a4;
  uint64_t v29 = a1;
  uint64_t v34 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v34 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v34);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v6 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v26 = *(void *)(v13 + 8);
    Objectuint64_t Type = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v28, v9);
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    unint64_t v25 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15(v25, v29, v34);
    unint64_t v16 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    unint64_t v17 = (v11 + *(unsigned __int8 *)(v7 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v18 = swift_allocObject();
    uint64_t v19 = v32;
    *(void *)(v18 + 16) = v30;
    *(void *)(v18 + 24) = v19;
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v18 + v16, v12, v9);
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18 + v17, v25, v34);
    uint64_t v20 = (void *)(v18 + ((v8 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
    uint64_t v21 = v33;
    *uint64_t v20 = v31;
    v20[1] = v21;
    uint64_t v22 = v26;
    uint64_t v23 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v26 + 8);
    swift_bridgeObjectRetain();
    swift_retain();
    v23(sub_10000F450, v18, ObjectType, v22);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10000A284(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v46 = a6;
  uint64_t v47 = a7;
  uint64_t v48 = a1;
  uint64_t v49 = a2;
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for UUID();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  unint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for Logger();
  uint64_t v44 = *(void *)(v18 - 8);
  uint64_t v45 = v18;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TTSVBLog.daemon.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a4, v14);
  uint64_t v41 = v13;
  uint64_t v42 = v11;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v43 = v10;
  v21(v13, a5, v10);
  swift_bridgeObjectRetain_n();
  uint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.default.getter();
  int v24 = v23;
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v40 = a4;
    uint64_t v26 = v25;
    uint64_t v38 = swift_slowAlloc();
    uint64_t v51 = v38;
    *(_DWORD *)uint64_t v26 = 136315650;
    os_log_t v36 = v22;
    if (a3) {
      uint64_t v27 = v49;
    }
    else {
      uint64_t v27 = 0x3E6C696E3CLL;
    }
    int v37 = v24;
    if (a3) {
      unint64_t v28 = a3;
    }
    else {
      unint64_t v28 = 0xE500000000000000;
    }
    uint64_t v39 = a5;
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_1000070E8(v27, v28, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    uint64_t v29 = UUID.uuidString.getter();
    uint64_t v50 = sub_1000070E8(v29, v30, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    *(_WORD *)(v26 + 22) = 2080;
    uint64_t v31 = v41;
    uint64_t v32 = URL.path.getter();
    uint64_t v50 = sub_1000070E8(v32, v33, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v31, v43);
    uint64_t v22 = v36;
    _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v37, "Will import model. overrideLocaleID=%s Adding to voice='%s' Data=%s", (uint8_t *)v26, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v41, v43);
  }

  (*(void (**)(char *, uint64_t))(v44 + 8))(v20, v45);
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v46;
  *(void *)(v34 + 24) = v47;
  swift_retain();
  TTSVBVoiceBankingManager.importModel(fromDirectory:overrideLocaleID:addingToVoice:completion:)();
  return swift_release();
}

uint64_t VoiceBankingXPCServer.exportTrainingData(voiceID:reply:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000C004(a1, a2, a3, (uint64_t)&unk_1000290E0, (uint64_t)sub_10000F55C);
}

uint64_t sub_10000A988(uint64_t a1, void (*a2)(uint64_t, void *), uint64_t a3)
{
  uint64_t v61 = a3;
  v63 = a2;
  uint64_t v55 = a1;
  v62 = (void *)type metadata accessor for TTSVBError();
  uint64_t v3 = *(v62 - 1);
  uint64_t v4 = __chkstk_darwin(v62);
  os_log_t v57 = (os_log_t)((char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v52 - v6;
  uint64_t v8 = sub_10000493C(&qword_10002D3E0);
  __chkstk_darwin(v8 - 8);
  v60 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v58 = *(void *)(v10 - 8);
  uint64_t v59 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v56 = (char *)&v52 - v14;
  uint64_t v15 = type metadata accessor for URL();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = ((char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v52 - v20;
  uint64_t v22 = sub_10000493C(&qword_10002D598);
  __chkstk_darwin(v22);
  int v24 = (char *)&v52 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010498(v55, (uint64_t)v24, &qword_10002D598);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v55 = v16;
    v56 = (char *)v15;
    uint64_t v25 = v62;
    (*(void (**)(char *, char *, void *))(v3 + 32))(v7, v24, v62);
    static TTSVBLog.daemon.getter();
    uint64_t v26 = *(void (**)(os_log_t, char *, void *))(v3 + 16);
    v26(v57, v7, v25);
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.error.getter();
    uint64_t v29 = v7;
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v30 = swift_slowAlloc();
      v54 = v13;
      uint64_t v31 = (uint8_t *)v30;
      uint64_t v32 = swift_slowAlloc();
      v53 = v7;
      unint64_t v33 = (void *)v32;
      *(_DWORD *)uint64_t v31 = 138412290;
      v52 = v31 + 4;
      sub_10000FF90((unint64_t *)&qword_10002D530, (void (*)(uint64_t))&type metadata accessor for TTSVBError);
      swift_allocError();
      os_log_t v34 = v57;
      v26(v35, (char *)v57, v62);
      uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v65 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v33 = v36;
      uint64_t v25 = v62;
      int v37 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
      v37((char *)v34, (uint64_t)v62);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Error exporting training data: %@", v31, 0xCu);
      sub_10000493C(&qword_10002D3F0);
      swift_arrayDestroy();
      uint64_t v29 = v53;
      swift_slowDealloc();
      uint64_t v13 = v54;
      swift_slowDealloc();
    }
    else
    {
      int v37 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
      v37((char *)v57, (uint64_t)v25);
    }

    (*(void (**)(char *, uint64_t))(v58 + 8))(v13, v59);
    uint64_t v46 = (uint64_t)v60;
    (*(void (**)(char *, uint64_t, uint64_t, char *))(v55 + 56))(v60, 1, 1, v56);
    uint64_t v47 = (void *)TTSVBError.boxed.getter();
    v63(v46, v47);

    sub_100010564(v46, &qword_10002D3E0);
    uint64_t v48 = v29;
    uint64_t v49 = (uint64_t)v25;
  }
  else
  {
    uint64_t v38 = v63;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v24, v15);
    static TTSVBLog.daemon.getter();
    v62 = *(void **)(v16 + 16);
    ((void (*)(NSObject *, char *, uint64_t))v62)(v19, v21, v15);
    uint64_t v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v39, v40))
    {
      os_log_t v57 = v39;
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v65 = v55;
      *(_DWORD *)uint64_t v41 = 136315138;
      uint64_t v42 = URL.path.getter();
      uint64_t v64 = sub_1000070E8(v42, v43, &v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      int v37 = *(uint64_t (**)(char *, uint64_t))(v16 + 8);
      v37((char *)v19, v15);
      os_log_t v44 = v57;
      _os_log_impl((void *)&_mh_execute_header, v57, v40, "Succesfully exported training data to: %s", v41, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v45 = v63;
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v58 + 8))(v56, v59);
    }
    else
    {
      int v37 = *(uint64_t (**)(char *, uint64_t))(v16 + 8);
      v37((char *)v19, v15);

      (*(void (**)(char *, uint64_t))(v58 + 8))(v56, v59);
      uint64_t v45 = v38;
    }
    uint64_t v50 = (uint64_t)v60;
    ((void (*)(char *, char *, uint64_t))v62)(v60, v21, v15);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(v50, 0, 1, v15);
    v45(v50, 0);
    sub_100010564(v50, &qword_10002D3E0);
    uint64_t v48 = v21;
    uint64_t v49 = v15;
  }
  return v37(v48, v49);
}

void sub_10000B168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  sub_10000493C(a4);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010498(a1, (uint64_t)v13, a4);
  uint64_t v14 = a5(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
  {
    uint64_t v16 = (void *)a6();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v14);
  }
  (*(void (**)(uint64_t, void *, uint64_t))(a3 + 16))(a3, v16, a2);
}

uint64_t VoiceBankingXPCServer.deleteVoice(voiceID:reply:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000C004(a1, a2, a3, (uint64_t)&unk_100029108, (uint64_t)sub_10000F594);
}

uint64_t sub_10000B308(void *a1, uint64_t a2, uint64_t a3, const void *a4, uint64_t a5, uint64_t a6, void (*a7)(char *, uint64_t, uint64_t))
{
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  id v17 = a1;
  a7(v14, a6, v16);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t VoiceBankingXPCServer.synchronizeModelFutures(modelID:reply:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000C004(a1, a2, a3, (uint64_t)&unk_100029130, (uint64_t)sub_10000F5CC);
}

uint64_t VoiceBankingXPCServer.deleteModel(modelID:reply:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000C004(a1, a2, a3, (uint64_t)&unk_100029158, (uint64_t)sub_10000F604);
}

uint64_t VoiceBankingXPCServer.fetchVoices(completion:)(uint64_t a1, uint64_t a2)
{
  return sub_10000E270(a1, a2, (uint64_t)&unk_100029180, (uint64_t)sub_10000F638);
}

uint64_t VoiceBankingXPCServer.fetchVoiceModels(completion:)(uint64_t a1, uint64_t a2)
{
  return sub_10000E270(a1, a2, (uint64_t)&unk_1000291A8, (uint64_t)sub_10000F684);
}

uint64_t VoiceBankingXPCServer.fetchInstalledVoiceModels(completion:)(uint64_t a1, uint64_t a2)
{
  return sub_10000E270(a1, a2, (uint64_t)&unk_1000291D0, (uint64_t)sub_10000F6BC);
}

uint64_t sub_10000B7E4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TTSVBLog.daemon.getter();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    id v17 = a1;
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Will refresh models before fetching/returning", v12, 2u);
    a1 = v17;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a1;
  v13[3] = a2;
  v13[4] = a3;
  id v14 = a1;
  swift_retain();
  TTSVBVoiceBankingManager.refreshModels(completion:)();
  return swift_release();
}

uint64_t sub_10000B9A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t))
{
  uint64_t v48 = a6;
  uint64_t v49 = a7;
  uint64_t v44 = a5;
  uint64_t v45 = a3;
  uint64_t v46 = a4;
  uint64_t v47 = a2;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  os_log_type_t v11 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v38 - v12;
  uint64_t v14 = type metadata accessor for TTSVBError();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)v38 - v19;
  uint64_t v21 = sub_10000493C(&qword_10002D560);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)v38 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010498(a1, (uint64_t)v23, &qword_10002D560);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v23, v14);
    static TTSVBLog.daemon.getter();
    int v24 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    v24(v18, v20, v14);
    uint64_t v41 = v13;
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    uint64_t v27 = v20;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v28 = swift_slowAlloc();
      os_log_type_t v40 = v20;
      uint64_t v29 = (uint8_t *)v28;
      uint64_t v39 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 138412290;
      v38[1] = v29 + 4;
      sub_10000FF90((unint64_t *)&qword_10002D530, (void (*)(uint64_t))&type metadata accessor for TTSVBError);
      swift_allocError();
      v24(v30, v18, v14);
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v50 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v39 = v31;
      uint64_t v32 = *(void (**)(char *, uint64_t))(v15 + 8);
      v32(v18, v14);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Failed to refresh models when asking for voice models: %@", v29, 0xCu);
      sub_10000493C(&qword_10002D3F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v27 = v40;
      swift_slowDealloc();
    }
    else
    {

      uint64_t v32 = *(void (**)(char *, uint64_t))(v15 + 8);
      v32(v18, v14);
    }
    (*(void (**)(char *, uint64_t))(v42 + 8))(v41, v43);
    v32(v27, v14);
  }
  else
  {
    swift_bridgeObjectRelease();
    static TTSVBLog.daemon.getter();
    unint64_t v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Succesfully refreshed models. will fetch and return models now", v35, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v43);
  }
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = v45;
  *(void *)(v36 + 24) = v46;
  swift_retain();
  v49(v48, v36);
  return swift_release();
}

uint64_t VoiceBankingXPCServer.fetchTrainingMetadata(voiceID:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000C004(a1, a2, a3, (uint64_t)&unk_1000291F8, (uint64_t)sub_10000F6F8);
}

uint64_t sub_10000C004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = a2;
  uint64_t v20 = a5;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = v5 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v13 = *(void *)(v11 + 8);
    Objectuint64_t Type = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&ObjectType - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
    unint64_t v14 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v15 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v15 + v14, (char *)&ObjectType - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    uint64_t v16 = (void *)(v15 + ((v10 + v14 + 7) & 0xFFFFFFFFFFFFFFF8));
    void *v16 = v19;
    v16[1] = a3;
    uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 8);
    swift_retain();
    v17(v20, v15, ObjectType, v13);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10000C1C0(uint64_t a1, void (*a2)(uint64_t, unint64_t, void *))
{
  uint64_t v4 = type metadata accessor for TTSVBError();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000493C(&qword_10002D548);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010498(a1, (uint64_t)v10, &qword_10002D548);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    uint64_t v11 = (void *)TTSVBError.boxed.getter();
    a2(0, 0xF000000000000000, v11);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    type metadata accessor for TTSVBVoiceSample();
    sub_10000FF90(&qword_10002D550, (void (*)(uint64_t))&type metadata accessor for TTSVBVoiceSample);
    sub_10000FF90(&qword_10002D558, (void (*)(uint64_t))&type metadata accessor for TTSVBVoiceSample);
    uint64_t v13 = Array<A>.toData()();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    a2(v13, v15, 0);
    return sub_10000FFD8(v13, v15);
  }
}

void sub_10000C44C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15) {
    Class isa = 0;
  }
  else {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
  }
  Class v6 = isa;
  (*(void (**)(uint64_t))(a4 + 16))(a4);
}

uint64_t VoiceBankingXPCServer.trainModel(voiceID:mode:startImmediately:skipValidation:overrideMinimumPhraseCount:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v32 = a7;
  uint64_t v28 = a2;
  uint64_t v29 = a6;
  int v30 = a4;
  int v31 = a5;
  uint64_t v12 = type metadata accessor for UUID();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  __chkstk_darwin(v12);
  unint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v8 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v26 = *(void *)(v16 + 8);
    Objectuint64_t Type = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v12);
    unint64_t v18 = (*(unsigned __int8 *)(v13 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v19 = v18 + v14;
    uint64_t v20 = (char *)swift_allocObject();
    *((void *)v20 + 2) = v28;
    *((void *)v20 + 3) = a3;
    *((void *)v20 + 4) = v29;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v20[v18], v15, v12);
    uint64_t v21 = &v20[v19];
    *uint64_t v21 = v30 & 1;
    v21[1] = v31 & 1;
    uint64_t v22 = &v20[(v19 + 9) & 0xFFFFFFFFFFFFFFF8];
    *(void *)uint64_t v22 = v32;
    *((void *)v22 + 1) = a8;
    uint64_t v23 = v26;
    int v24 = *(void (**)(uint64_t (*)(uint64_t), char *, uint64_t, uint64_t))(v26 + 8);
    swift_bridgeObjectRetain();
    swift_retain();
    v24(sub_10000F914, v20, ObjectType, v23);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10000C6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v19 = a8;
  int v20 = a7;
  int v21 = a6;
  uint64_t v22 = a1;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  NSString v13 = String._bridgeToObjectiveC()();
  uint64_t v18 = TTSVBSiriTTSTrainerTaskModeForString();

  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a5, v10);
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v15 + v14, (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  uint64_t v16 = (void *)(v15 + ((v12 + v14 + 7) & 0xFFFFFFFFFFFFFFF8));
  void *v16 = v19;
  v16[1] = a9;
  swift_retain();
  TTSVBVoiceBankingManager.train(voiceID:mode:startImmediately:validateTrainingSamples:overrideMinimumPhraseCount:completion:)();
  return swift_release();
}

uint64_t sub_10000C898(uint64_t a1, char *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v57 = a4;
  uint64_t v58 = a3;
  v52 = a2;
  uint64_t v59 = type metadata accessor for TTSVBError();
  uint64_t v5 = *(void *)(v59 - 8);
  uint64_t v6 = __chkstk_darwin(v59);
  v53 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v47 - v8;
  uint64_t v60 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v60 - 8);
  uint64_t v11 = __chkstk_darwin(v60);
  NSString v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v47 - v14;
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v55 = *(void *)(v16 - 8);
  uint64_t v56 = v16;
  uint64_t v17 = __chkstk_darwin(v16);
  v54 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  int v20 = (char *)&v47 - v19;
  uint64_t v21 = sub_10000493C((uint64_t *)&unk_10002D860);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v47 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010498(a1, (uint64_t)v23, (uint64_t *)&unk_10002D860);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = v59;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v9, v23, v59);
    static TTSVBLog.daemon.getter();
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v52, v60);
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v52 = v9;
    v25(v53, v9, v24);
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    int v28 = v27;
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v29 = swift_slowAlloc();
      int v50 = v28;
      uint64_t v30 = v29;
      uint64_t v49 = (void *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v62 = v51;
      *(_DWORD *)uint64_t v30 = 136315394;
      os_log_t v48 = v26;
      uint64_t v31 = UUID.uuidString.getter();
      uint64_t v61 = sub_1000070E8(v31, v32, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v60);
      *(_WORD *)(v30 + 12) = 2112;
      sub_10000FF90((unint64_t *)&qword_10002D530, (void (*)(uint64_t))&type metadata accessor for TTSVBError);
      uint64_t v33 = v59;
      swift_allocError();
      os_log_type_t v34 = v53;
      v25(v35, v53, v33);
      uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v61 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v49 = v36;
      int v37 = *(void (**)(char *, uint64_t))(v5 + 8);
      v37(v34, v33);
      os_log_t v38 = v48;
      _os_log_impl((void *)&_mh_execute_header, v48, (os_log_type_t)v50, "Error training new model for voice ID: %s. Error: %@", (uint8_t *)v30, 0x16u);
      sub_10000493C(&qword_10002D3F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v60);
      int v37 = *(void (**)(char *, uint64_t))(v5 + 8);
      v37(v53, v59);
    }
    (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
    uint64_t v44 = v52;
    uint64_t v45 = (void *)TTSVBError.boxed.getter();
    v58();

    return ((uint64_t (*)(char *, uint64_t))v37)(v44, v59);
  }
  else
  {
    static TTSVBLog.daemon.getter();
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v15, v52, v60);
    uint64_t v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v62 = swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 136315138;
      uint64_t v59 = (uint64_t)(v41 + 4);
      uint64_t v42 = UUID.uuidString.getter();
      uint64_t v61 = sub_1000070E8(v42, v43, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v60);
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Succesfully kicked off training model for voice ID: %s", v41, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v60);
    }

    (*(void (**)(char *, uint64_t))(v55 + 8))(v20, v56);
    ((void (*)(void))v58)(0);
    return sub_100010564((uint64_t)v23, (uint64_t *)&unk_10002D860);
  }
}

uint64_t VoiceBankingXPCServer.discardTrainingTasks(reply:)(uint64_t a1, uint64_t a2)
{
  return sub_10000E270(a1, a2, (uint64_t)&unk_100029248, (uint64_t)sub_10000F9C8);
}

uint64_t VoiceBankingXPCServer.cancelTrainingTask(taskID:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = v4 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v11 = *(void *)(v9 + 8);
    Objectuint64_t Type = swift_getObjectType();
    NSString v13 = (void *)swift_allocObject();
    v13[2] = a1;
    v13[3] = a2;
    v13[4] = a3;
    v13[5] = a4;
    uint64_t v14 = *(void (**)(uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(v11 + 8);
    swift_bridgeObjectRetain();
    swift_retain();
    v14(sub_10000FA18, v13, ObjectType, v11);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10000D3C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a4;
  v9[5] = a5;
  swift_bridgeObjectRetain();
  swift_retain();
  TTSVBVoiceBankingManager.cancelTrainingTask(taskID:completion:)();

  return swift_release();
}

uint64_t sub_10000D46C(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v49 = a5;
  uint64_t v45 = a2;
  uint64_t v50 = type metadata accessor for TTSVBError();
  uint64_t v8 = *(void *)(v50 - 8);
  uint64_t v9 = __chkstk_darwin(v50);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  NSString v13 = (char *)&v39 - v12;
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v47 = *(void *)(v14 - 8);
  uint64_t v48 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v46 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v39 - v17;
  uint64_t v19 = sub_10000493C((uint64_t *)&unk_10002D860);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010498(a1, (uint64_t)v21, (uint64_t *)&unk_10002D860);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v44 = a4;
    uint64_t v22 = v50;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v21, v50);
    static TTSVBLog.daemon.getter();
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v23(v11, v13, v22);
    swift_bridgeObjectRetain_n();
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    uint64_t v26 = v13;
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v27 = swift_slowAlloc();
      os_log_t v41 = v24;
      uint64_t v28 = v27;
      os_log_type_t v40 = (void *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v52 = v42;
      *(_DWORD *)uint64_t v28 = 136315394;
      unint64_t v43 = v13;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_1000070E8(v45, a3, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v28 + 12) = 2112;
      sub_10000FF90((unint64_t *)&qword_10002D530, (void (*)(uint64_t))&type metadata accessor for TTSVBError);
      uint64_t v29 = v50;
      swift_allocError();
      v23(v30, v11, v29);
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v51 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v40 = v31;
      uint64_t v26 = v43;
      unint64_t v32 = *(void (**)(char *, uint64_t))(v8 + 8);
      v32(v11, v29);
      os_log_t v33 = v41;
      _os_log_impl((void *)&_mh_execute_header, v41, v25, "Could not request cancelling of training task=%s. Error: %@", (uint8_t *)v28, 0x16u);
      sub_10000493C(&qword_10002D3F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      unint64_t v32 = *(void (**)(char *, uint64_t))(v8 + 8);
      v32(v11, v50);
    }
    (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v48);
    int v37 = (void *)TTSVBError.boxed.getter();
    v44();

    return ((uint64_t (*)(char *, uint64_t))v32)(v26, v50);
  }
  else
  {
    static TTSVBLog.daemon.getter();
    swift_bridgeObjectRetain_n();
    os_log_type_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_1000070E8(v45, a3, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Succesfully requested cancelling of training task: %s", v36, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v47 + 8))(v18, v48);
    ((void (*)(void))a4)(0);
    return sub_100010564((uint64_t)v21, (uint64_t *)&unk_10002D860);
  }
}

Swift::Void __swiftcall VoiceBankingXPCServer.requestVoiceCacheRebuildIfNeeded()()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v2 = *(void *)(v1 + 8);
    Objectuint64_t Type = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v2 + 24))(ObjectType, v2);
    swift_unknownObjectRelease();
  }
}

uint64_t VoiceBankingXPCServer.repairDatastoreFromFilesystem(reply:)(uint64_t a1, uint64_t a2)
{
  return sub_10000E270(a1, a2, (uint64_t)&unk_100029298, (uint64_t)sub_10000FA24);
}

uint64_t VoiceBankingXPCServer.updateTCCCloudKitAccess(allowed:reply:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = v3 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v9 = *(void *)(v7 + 8);
    Objectuint64_t Type = swift_getObjectType();
    uint64_t v11 = swift_allocObject();
    *(unsigned char *)(v11 + 16) = a1 & 1;
    *(void *)(v11 + 24) = a2;
    *(void *)(v11 + 32) = a3;
    uint64_t v12 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v9 + 16);
    swift_retain();
    v12(sub_10000FAA8, v11, ObjectType, v9);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10000DFB0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4 = type metadata accessor for TTSVBError();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (dispatch thunk of TTSVBAccessManager.updateTCCCloudKitAccess(_:userInitiated:)()) {
    return ((uint64_t (*)(void))a3)(0);
  }
  TTSVBError.init(_:_:_:)();
  uint64_t v9 = (void *)TTSVBError.boxed.getter();
  a3();

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t VoiceBankingXPCServer.initializeCloudKitSchema(reply:)(uint64_t a1, uint64_t a2)
{
  return sub_10000E270(a1, a2, (uint64_t)&unk_1000292E8, (uint64_t)sub_10000FAB4);
}

uint64_t sub_10000E270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = v4 + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v10 = *(void *)(v8 + 8);
    Objectuint64_t Type = swift_getObjectType();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a1;
    *(void *)(v12 + 24) = a2;
    NSString v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8);
    swift_retain();
    v13(a4, v12, ObjectType, v10);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10000E358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_retain();
  a6(a5, v10);

  return swift_release();
}

uint64_t sub_10000E3E0(uint64_t a1, const char *a2, uint64_t a3, const char *a4, const char *a5)
{
  uint64_t v44 = (void (*)(void))a4;
  uint64_t v45 = a5;
  uint64_t v47 = type metadata accessor for TTSVBError();
  uint64_t v8 = *(void *)(v47 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v46 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v39 - v11;
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v48 = *(void *)(v13 - 8);
  uint64_t v49 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v39 - v17;
  uint64_t v19 = sub_10000493C((uint64_t *)&unk_10002D860);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010498(a1, (uint64_t)v21, (uint64_t *)&unk_10002D860);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v43 = a3;
    uint64_t v44 = (void (*)(void))a2;
    uint64_t v22 = v47;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v12, v21, v47);
    static TTSVBLog.daemon.getter();
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    uint64_t v24 = v46;
    v23(v46, v12, v22);
    uint64_t v42 = v16;
    os_log_type_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    uint64_t v27 = v12;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v28 = swift_slowAlloc();
      os_log_t v41 = v12;
      uint64_t v29 = (uint8_t *)v28;
      os_log_type_t v40 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 138412290;
      uint64_t v39 = v29 + 4;
      sub_10000FF90((unint64_t *)&qword_10002D530, (void (*)(uint64_t))&type metadata accessor for TTSVBError);
      swift_allocError();
      v23(v30, v24, v22);
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v50 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v40 = v31;
      unint64_t v32 = *(void (**)(char *, uint64_t))(v8 + 8);
      v32(v24, v22);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, v45, v29, 0xCu);
      sub_10000493C(&qword_10002D3F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v27 = v41;
      swift_slowDealloc();
    }
    else
    {
      unint64_t v32 = *(void (**)(char *, uint64_t))(v8 + 8);
      v32(v24, v22);
    }

    (*(void (**)(char *, uint64_t))(v48 + 8))(v42, v49);
    os_log_t v38 = (void *)TTSVBError.boxed.getter();
    v44();

    return ((uint64_t (*)(char *, uint64_t))v32)(v27, v22);
  }
  else
  {
    os_log_t v33 = a2;
    static TTSVBLog.daemon.getter();
    os_log_type_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, (const char *)v44, v36, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v48 + 8))(v18, v49);
    ((void (*)(void))v33)(0);
    return sub_100010564((uint64_t)v21, (uint64_t *)&unk_10002D860);
  }
}

uint64_t sub_10000EA5C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TTSVBLog.daemon.getter();
  uint64_t v8 = a1;
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v35 = v4;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v36 = v2;
    uint64_t v13 = (void *)v12;
    uint64_t v34 = v5;
    *(_DWORD *)uint64_t v11 = 138543362;
    v41[0] = v8;
    uint64_t v14 = v8;
    uint64_t v5 = v34;
    uint64_t v4 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v13 = v8;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Incoming XPC Connection: %{public}@", v11, 0xCu);
    sub_10000493C(&qword_10002D3F0);
    swift_arrayDestroy();
    uint64_t v2 = v36;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  type metadata accessor for TTSVBService();
  static TTSVBService.serviceName.getter();
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v16 = [v8 valueForEntitlement:v15];

  if (v16)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
  }
  sub_1000104FC((uint64_t)&v39, (uint64_t)v41);
  if (v42)
  {
    sub_10001067C(0, &qword_10002D5C0);
    if (swift_dynamicCast())
    {
      id v17 = v37;
      unsigned __int8 v18 = [v37 BOOLValue];

      if (v18) {
        goto LABEL_50;
      }
    }
  }
  else
  {
    sub_100010564((uint64_t)v41, &qword_10002D5A8);
  }
  NSString v19 = String._bridgeToObjectiveC()();
  id v20 = [v8 valueForEntitlement:v19];

  if (v20)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
  }
  sub_1000104FC((uint64_t)&v39, (uint64_t)v41);
  if (v42)
  {
    int v21 = swift_dynamicCast();
    if (v21) {
      id v22 = v37;
    }
    else {
      id v22 = 0;
    }
    if (v21) {
      unint64_t v23 = v38;
    }
    else {
      unint64_t v23 = 0;
    }
  }
  else
  {
    sub_100010564((uint64_t)v41, &qword_10002D5A8);
    id v22 = 0;
    unint64_t v23 = 0;
  }
  if ("com.apple.Preferences" == (char *)0x8000000000000020)
  {
    if (v23) {
      goto LABEL_25;
    }
LABEL_39:
    sub_10000493C(&qword_10002D5B0);
    swift_arrayDestroy();
    goto LABEL_50;
  }
  if (!v23)
  {
    if ("com.apple.NanoSettings" != (char *)0x8000000000000020) {
      goto LABEL_37;
    }
    goto LABEL_39;
  }
  if (v22 == (id)0xD000000000000015 && v23 == 0x8000000100024FA0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    goto LABEL_44;
  }
LABEL_25:
  if ("com.apple.NanoSettings" != (char *)0x8000000000000020
    && (v22 == (id)0xD000000000000016 && v23 == 0x8000000100024FC0
     || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    goto LABEL_44;
  }
LABEL_37:
  if ("AccessibilitySettingsExtension" == (char *)0x8000000000000020)
  {
    if (!v23) {
      goto LABEL_39;
    }
  }
  else if (v23 {
         && (v22 == (id)0xD00000000000001ELL && v23 == 0x8000000100024FE0
  }
          || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
LABEL_44:
    swift_bridgeObjectRelease();
    goto LABEL_50;
  }
  sub_10000493C(&qword_10002D5B0);
  swift_arrayDestroy();
  static os_log_type_t.fault.getter();
  sub_10000493C(&qword_10002D5B8);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_100024730;
  unsigned int v25 = [v8 processIdentifier];
  *(void *)(v24 + 56) = &type metadata for Int32;
  *(void *)(v24 + 64) = &protocol witness table for Int32;
  *(_DWORD *)(v24 + 32) = v25;
  Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  *(void *)(v24 + 96) = sub_10001067C(0, &qword_10002D5C0);
  *(void *)(v24 + 104) = sub_1000105C0();
  *(void *)(v24 + 72) = isa;
  *(void *)(v24 + 136) = &type metadata for String;
  *(void *)(v24 + 144) = sub_100010628();
  uint64_t v27 = 0x6E776F6E6B6E55;
  if (v23) {
    uint64_t v27 = (uint64_t)v22;
  }
  unint64_t v28 = 0xE700000000000000;
  if (v23) {
    unint64_t v28 = v23;
  }
  *(void *)(v24 + 112) = v27;
  *(void *)(v24 + 120) = v28;
  sub_10001067C(0, (unint64_t *)&unk_10002D5D8);
  uint64_t v29 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();

LABEL_50:
  uint64_t v30 = (void *)static TTSVBService.configuredServiceInterface()();
  [v8 setExportedInterface:v30];

  uint64_t v31 = (void *)static TTSVBService.configuredClientInterface()();
  [v8 setRemoteObjectInterface:v31];

  [v8 setExportedObject:v2];
  [v8 resume];
  return 1;
}

uint64_t sub_10000F12C()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_10000F22C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(v1 + 16);
  unint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v4;
  uint64_t v9 = *(void *)(v1 + v5);
  uint64_t v10 = *(void *)(v1 + v5 + 8);
  uint64_t v11 = (uint64_t *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];

  return sub_100009A84(a1, v6, v7, v8, v9, v10, v12, v13);
}

uint64_t sub_10000F2E0()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  swift_release();

  return _swift_deallocObject(v0, v11, v10);
}

uint64_t sub_10000F450(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v1 + 16);
  unint64_t v9 = *(void *)(v1 + 24);
  uint64_t v10 = v1 + v7;
  unint64_t v11 = (uint64_t *)(v1 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];

  return sub_10000A284(a1, v8, v9, v1 + v4, v10, v12, v13);
}

uint64_t sub_10000F55C(uint64_t a1)
{
  return sub_10000F72C(a1, (uint64_t)&unk_100029960, (uint64_t)sub_100010430, (void (*)(uint64_t, uint64_t, uint64_t))&TTSVBVoiceBankingManager.exportTrainingData(forVoice:completion:));
}

uint64_t sub_10000F594(uint64_t a1)
{
  return sub_10000F72C(a1, (uint64_t)&unk_100029938, (uint64_t)sub_100010404, (void (*)(uint64_t, uint64_t, uint64_t))&TTSVBVoiceBankingManager.deleteVoice(withID:completion:));
}

uint64_t sub_10000F5CC(uint64_t a1)
{
  return sub_10000F72C(a1, (uint64_t)&unk_100029910, (uint64_t)sub_1000103D8, (void (*)(uint64_t, uint64_t, uint64_t))&TTSVBVoiceBankingManager.synchronizeFileBackedFuturesForModelID(_:completion:));
}

uint64_t sub_10000F604(uint64_t a1)
{
  return sub_10000F72C(a1, (uint64_t)&unk_1000298E8, (uint64_t)sub_1000103AC, (void (*)(uint64_t, uint64_t, uint64_t))&TTSVBVoiceBankingManager.deleteModel(withID:completion:));
}

uint64_t sub_10000F638(uint64_t a1)
{
  return sub_10000E358(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_1000298C0, (uint64_t)sub_1000102D0, (void (*)(uint64_t, uint64_t))&TTSVBVoiceBankingManager.fetchVoices(completion:));
}

uint64_t sub_10000F684(void *a1)
{
  return sub_10000B7E4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000F6BC(void *a1)
{
  return sub_10000B7E4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000F6F8(uint64_t a1)
{
  return sub_10000F72C(a1, (uint64_t)&unk_1000297F8, (uint64_t)sub_10000FF88, (void (*)(uint64_t, uint64_t, uint64_t))&TTSVBVoiceBankingManager.fetchTrainingMetadata(voiceID:completion:));
}

uint64_t sub_10000F72C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = v4 + v8;
  uint64_t v12 = *(void *)(v4 + v9);
  uint64_t v11 = *(void *)(v4 + v9 + 8);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = v11;
  swift_retain();
  a4(v10, a3, v13);

  return swift_release();
}

uint64_t sub_10000F828()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 9) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10000F914(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = v4 + *(void *)(v3 + 64);
  return sub_10000C6D4(a1, v1[2], v1[3], v1[4], (uint64_t)v1 + v4, *((unsigned __int8 *)v1 + v5), *((unsigned __int8 *)v1 + v5 + 1), *(uint64_t *)((char *)v1 + ((v5 + 9) & 0xFFFFFFFFFFFFFFF8)), *(uint64_t *)((char *)v1 + ((v5 + 9) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_10000F9C8(uint64_t a1)
{
  return sub_10000E358(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_1000297A8, (uint64_t)sub_10000FE10, (void (*)(uint64_t, uint64_t))&TTSVBVoiceBankingManager.discardTrainingTasks(_:));
}

uint64_t sub_10000FA18(uint64_t a1)
{
  return sub_10000D3C0(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_10000FA24(uint64_t a1)
{
  return sub_10000E358(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_100029758, (uint64_t)sub_10000FD94, (void (*)(uint64_t, uint64_t))&TTSVBVoiceBankingManager.repairDatastoreVoicesFromFilesystem(completion:));
}

uint64_t sub_10000FA70()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000FAA8(uint64_t a1)
{
  return sub_10000DFB0(a1, *(unsigned __int8 *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

uint64_t sub_10000FAB4(uint64_t a1)
{
  return sub_10000E358(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_100029730, (uint64_t)sub_10000FD68, (void (*)(uint64_t, uint64_t))&TTSVBVoiceBankingManager.initializeCloudKitSchema(_:));
}

uint64_t sub_10000FB00(uint64_t a1)
{
  return a1;
}

uint64_t dispatch thunk of VoiceBankingXPCServerDelegate.performOnQueueWithVoiceBankingManager(handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of VoiceBankingXPCServerDelegate.performOnQueueWithAccessManager(handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of VoiceBankingXPCServerDelegate.requestVoiceCacheRebuildIfNeeded()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t type metadata accessor for VoiceBankingXPCServer()
{
  return self;
}

uint64_t sub_10000FB88()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_10000FBA0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_10000C44C(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_10000FBAC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000FBE4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000FC1C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *))(v1 + 16))(v1, isa);
}

void sub_10000FC74(uint64_t a1, uint64_t a2)
{
  sub_10000B168(a1, a2, *(void *)(v2 + 16), &qword_10002D3E0, (uint64_t (*)(void))&type metadata accessor for URL, (uint64_t (*)(void))&URL._bridgeToObjectiveC());
}

void sub_10000FCC0(uint64_t a1, uint64_t a2)
{
  sub_10000B168(a1, a2, *(void *)(v2 + 16), (uint64_t *)&unk_10002D520, (uint64_t (*)(void))&type metadata accessor for UUID, (uint64_t (*)(void))&UUID._bridgeToObjectiveC());
}

uint64_t sub_10000FD10()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10000FD58(uint64_t a1)
{
  return sub_100008E6C(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_10000FD68(uint64_t a1)
{
  return sub_10000E3E0(a1, *(const char **)(v1 + 16), *(void *)(v1 + 24), "Did request initialize cloudkit schema.", "Could not request initialize cloudkit schema. Error: %@");
}

uint64_t sub_10000FD94(uint64_t a1)
{
  return sub_10000E3E0(a1, *(const char **)(v1 + 16), *(void *)(v1 + 24), "Succesfully completed datastore repair.", "Could not repair datastore. Error: %@");
}

uint64_t sub_10000FDC4()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000FE04(uint64_t a1)
{
  return sub_10000D46C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_10000FE10(uint64_t a1)
{
  return sub_10000E3E0(a1, *(const char **)(v1 + 16), *(void *)(v1 + 24), "Succesfully requested discarding of existing training tasks", "Could not request discarding of existing training tasks. Error: %@");
}

uint64_t sub_10000FE40()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10000FEE8(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (char *)(v1 + v4);
  uint64_t v6 = v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = *(void (**)(void))v6;
  uint64_t v8 = *(void *)(v6 + 8);

  return sub_10000C898(a1, v5, v7, v8);
}

uint64_t sub_10000FF88(uint64_t a1)
{
  return sub_10000C1C0(a1, *(void (**)(uint64_t, unint64_t, void *))(v1 + 16));
}

uint64_t sub_10000FF90(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000FFD8(uint64_t a1, unint64_t a2)
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

uint64_t sub_100010034(uint64_t a1)
{
  return sub_10000B9A8(a1, v1[2], v1[3], v1[4], (uint64_t)&unk_100029848, (uint64_t)sub_100010084, (void (*)(uint64_t, uint64_t))&TTSVBVoiceBankingManager.fetchInstalledVoiceModels(completion:));
}

uint64_t sub_100010084()
{
  uint64_t v1 = *(void (**)(void))(v0 + 16);
  type metadata accessor for TTSVBInstalledVoiceModel();
  sub_10000FF90(&qword_10002D568, (void (*)(uint64_t))&type metadata accessor for TTSVBInstalledVoiceModel);
  sub_10000FF90(&qword_10002D570, (void (*)(uint64_t))&type metadata accessor for TTSVBInstalledVoiceModel);
  uint64_t v2 = Array<A>.toData()();
  unint64_t v4 = v3;
  v1();

  return sub_10000FFD8(v2, v4);
}

uint64_t sub_100010164()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000101A4(uint64_t a1)
{
  return sub_10000B9A8(a1, v1[2], v1[3], v1[4], (uint64_t)&unk_100029898, (uint64_t)sub_1000101F4, (void (*)(uint64_t, uint64_t))&TTSVBVoiceBankingManager.fetchVoiceModels(completion:));
}

uint64_t sub_1000101F4()
{
  uint64_t v1 = *(void (**)(void))(v0 + 16);
  type metadata accessor for TTSVBVoiceModel();
  sub_10000FF90(&qword_10002D578, (void (*)(uint64_t))&type metadata accessor for TTSVBVoiceModel);
  sub_10000FF90(&qword_10002D580, (void (*)(uint64_t))&type metadata accessor for TTSVBVoiceModel);
  uint64_t v2 = Array<A>.toData()();
  unint64_t v4 = v3;
  v1();

  return sub_10000FFD8(v2, v4);
}

uint64_t sub_1000102D0()
{
  uint64_t v1 = *(void (**)(void))(v0 + 16);
  type metadata accessor for TTSVBVoice();
  sub_10000FF90(&qword_10002D588, (void (*)(uint64_t))&type metadata accessor for TTSVBVoice);
  sub_10000FF90(&qword_10002D590, (void (*)(uint64_t))&type metadata accessor for TTSVBVoice);
  uint64_t v2 = Array<A>.toData()();
  unint64_t v4 = v3;
  v1();

  return sub_10000FFD8(v2, v4);
}

uint64_t sub_1000103AC(uint64_t a1)
{
  return sub_10000E3E0(a1, *(const char **)(v1 + 16), *(void *)(v1 + 24), "Succesfully deleted model", "Error deleting model: %@");
}

uint64_t sub_1000103D8(uint64_t a1)
{
  return sub_10000E3E0(a1, *(const char **)(v1 + 16), *(void *)(v1 + 24), "Succesfully synchronized futures", "Error synchronizing futures: %@");
}

uint64_t sub_100010404(uint64_t a1)
{
  return sub_10000E3E0(a1, *(const char **)(v1 + 16), *(void *)(v1 + 24), "Succesfully deleted voice", "Error deleting voice: %@");
}

uint64_t sub_100010430(uint64_t a1)
{
  return sub_10000A988(a1, *(void (**)(uint64_t, void *))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100010438(uint64_t a1)
{
  return sub_10000E3E0(a1, *(const char **)(v1 + 16), *(void *)(v1 + 24), "Succesfully imported model", "Error importing model: %@");
}

uint64_t sub_100010464(uint64_t a1)
{
  return sub_10000E3E0(a1, *(const char **)(v1 + 16), *(void *)(v1 + 24), "Succesfully imported training data", "Error importing training data: %@");
}

uint64_t sub_100010490(uint64_t a1)
{
  return sub_100008F24(a1, *(void (**)(uint64_t, void *))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100010498(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000493C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000104FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000493C(&qword_10002D5A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010564(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000493C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000105C0()
{
  unint64_t result = qword_10002D5C8;
  if (!qword_10002D5C8)
  {
    sub_10001067C(255, &qword_10002D5C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D5C8);
  }
  return result;
}

unint64_t sub_100010628()
{
  unint64_t result = qword_10002D5D0;
  if (!qword_10002D5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D5D0);
  }
  return result;
}

uint64_t sub_10001067C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100010784()
{
  uint64_t v0 = type metadata accessor for URLRequest();
  uint64_t v86 = *(void *)(v0 - 8);
  uint64_t v87 = v0;
  __chkstk_darwin(v0);
  v85 = (char *)&v75 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = (void *)type metadata accessor for URL.DirectoryHint();
  uint64_t v2 = *(v81 - 1);
  __chkstk_darwin(v81);
  uint64_t v4 = (char *)&v75 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = type metadata accessor for Logger();
  uint64_t v93 = *(void *)(v91 - 8);
  uint64_t v5 = __chkstk_darwin(v91);
  v84 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v75 - v8;
  __chkstk_darwin(v7);
  v78 = (char *)&v75 - v10;
  uint64_t v11 = sub_10000493C(&qword_10002D3E0);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v16 = (char *)&v75 - v15;
  uint64_t v17 = type metadata accessor for URL();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  v83 = (char *)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  v82 = (char *)&v75 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  v94 = (char *)&v75 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v80 = (char *)&v75 - v26;
  __chkstk_darwin(v25);
  unint64_t v28 = (char *)&v75 - v27;
  URL.init(string:)();
  uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  uint64_t result = v29(v16, 1, v17);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v89 = v18;
    v79 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v79(v28, v16, v17);
    int v31 = TTSVBIsInternalUIBuild();
    uint64_t v88 = v17;
    v90 = v28;
    if (v31)
    {
      id v32 = [self processInfo];
      id v33 = [v32 environment];

      uint64_t v34 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
      if (*(void *)(v34 + 16))
      {
        unint64_t v35 = sub_1000123A8(0xD000000000000027, 0x8000000100025730);
        uint64_t v17 = v88;
        if (v36)
        {
          v77 = v9;
          id v37 = (uint64_t *)(*(void *)(v34 + 56) + 16 * v35);
          uint64_t v39 = *v37;
          unint64_t v38 = v37[1];
          swift_bridgeObjectRetain();
          unint64_t v40 = v38;
          uint64_t v41 = v39;
          swift_bridgeObjectRelease();
          URL.init(string:)();
          if (v29(v14, 1, v17) == 1)
          {
            swift_bridgeObjectRelease();
            sub_100010564((uint64_t)v14, &qword_10002D3E0);
            unint64_t v9 = v77;
          }
          else
          {
            v79(v80, v14, v17);
            uint64_t v42 = v78;
            static TTSVBLog.daemon.getter();
            unint64_t v43 = v40;
            swift_bridgeObjectRetain();
            uint64_t v44 = Logger.logObject.getter();
            os_log_type_t v45 = static os_log_type_t.default.getter();
            v76 = v44;
            BOOL v46 = os_log_type_enabled(v44, v45);
            unint64_t v9 = v77;
            if (v46)
            {
              uint64_t v47 = (uint8_t *)swift_slowAlloc();
              uint64_t aBlock = swift_slowAlloc();
              *(_DWORD *)uint64_t v47 = 136315138;
              v75 = v47 + 4;
              swift_bridgeObjectRetain();
              uint64_t v95 = sub_1000070E8(v41, v43, &aBlock);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease_n();
              uint64_t v48 = v76;
              _os_log_impl((void *)&_mh_execute_header, v76, v45, "Override server config URL was found. Using: %s", v47, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              uint64_t v17 = v88;
              swift_slowDealloc();

              (*(void (**)(char *, uint64_t))(v93 + 8))(v78, v91);
            }
            else
            {
              swift_bridgeObjectRelease_n();

              (*(void (**)(char *, uint64_t))(v93 + 8))(v42, v91);
            }
            uint64_t v49 = v90;
            (*(void (**)(char *, uint64_t))(v89 + 8))(v90, v17);
            v79(v49, v80, v17);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v17 = v88;
      }
    }
    uint64_t aBlock = 0xD000000000000016;
    unint64_t v97 = 0x80000001000256C0;
    uint64_t v50 = v81;
    (*(void (**)(char *, void, void *))(v2 + 104))(v4, enum case for URL.DirectoryHint.inferFromPath(_:), v81);
    sub_100011330();
    URL.appending<A>(path:directoryHint:)();
    (*(void (**)(char *, void *))(v2 + 8))(v4, v50);
    swift_bridgeObjectRelease();
    static TTSVBLog.daemon.getter();
    uint64_t v51 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Taking ServerConfigChecker network transaction", v53, 2u);
      swift_slowDealloc();
    }

    uint64_t v54 = v93 + 8;
    uint64_t v55 = v91;
    v81 = *(void **)(v93 + 8);
    ((void (*)(char *, uint64_t))v81)(v9, v91);
    *(void *)(v92 + 16) = os_transaction_create();
    swift_unknownObjectRelease();
    uint64_t v56 = v84;
    static TTSVBLog.daemon.getter();
    uint64_t v57 = v89;
    uint64_t v58 = v82;
    v80 = *(char **)(v89 + 16);
    ((void (*)(char *, char *, uint64_t))v80)(v82, v94, v17);
    uint64_t v59 = Logger.logObject.getter();
    os_log_type_t v60 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = (uint8_t *)swift_slowAlloc();
      uint64_t v62 = swift_slowAlloc();
      uint64_t v93 = v54;
      v79 = (void (*)(char *, char *, uint64_t))v62;
      uint64_t aBlock = v62;
      *(_DWORD *)uint64_t v61 = 136315138;
      uint64_t v63 = URL.absoluteString.getter();
      uint64_t v95 = sub_1000070E8(v63, v64, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v65 = v88;
      swift_bridgeObjectRelease();
      uint64_t v89 = *(void *)(v57 + 8);
      ((void (*)(char *, uint64_t))v89)(v58, v65);
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "Fetching server configuration from %s", v61, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v81)(v56, v91);
    }
    else
    {
      uint64_t v65 = v17;
      uint64_t v89 = *(void *)(v57 + 8);
      ((void (*)(char *, uint64_t))v89)(v58, v17);

      ((void (*)(char *, uint64_t))v81)(v56, v55);
    }
    uint64_t v66 = v86;
    v67 = v94;
    ((void (*)(char *, char *, uint64_t))v80)(v83, v94, v65);
    v68 = v85;
    URLRequest.init(url:cachePolicy:timeoutInterval:)();
    id v69 = [self sharedSession];
    uint64_t v70 = v65;
    Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
    v100 = sub_100012260;
    uint64_t v101 = v92;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    unint64_t v97 = 1107296256;
    v98 = sub_100012268;
    v99 = &unk_1000299F0;
    v72 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v73 = [v69 dataTaskWithRequest:isa completionHandler:v72];
    _Block_release(v72);

    [v73 resume];
    (*(void (**)(char *, uint64_t))(v66 + 8))(v68, v87);
    v74 = (uint64_t (*)(char *, uint64_t))v89;
    ((void (*)(char *, uint64_t))v89)(v67, v70);
    return v74(v90, v70);
  }
  return result;
}

unint64_t sub_100011330()
{
  unint64_t result = qword_10002D5E8;
  if (!qword_10002D5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D5E8);
  }
  return result;
}

uint64_t sub_100011384(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v93 = a1;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)v85 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v92 = (char *)v85 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v91 = (char *)v85 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)v85 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)v85 - v22;
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)v85 - v24;
  if (a3 && (self, (uint64_t v26 = (void *)swift_dynamicCastObjCClass()) != 0))
  {
    uint64_t v27 = (uint64_t)[v26 statusCode];
    if (v27 == 404)
    {
      static TTSVBLog.daemon.getter();
      unint64_t v28 = Logger.logObject.getter();
      os_log_type_t v29 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "No ServerConfig XML file found on the server. Assuming no override config to be enforced", v30, 2u);
        swift_slowDealloc();
      }

      int v31 = *(void (**)(char *, uint64_t))(v10 + 8);
      v31(v25, v9);
      static TTSVBLog.daemon.getter();
      id v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "Giving up ServerConfigChecker network transaction", v34, 2u);
        swift_slowDealloc();
      }

      v31(v23, v9);
      goto LABEL_58;
    }
  }
  else
  {
    uint64_t v27 = -1;
  }
  if (a2 >> 60 == 15)
  {
    uint64_t v90 = v9;
    static TTSVBLog.daemon.getter();
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v93 = v10;
      uint64_t v89 = a5;
      uint64_t v37 = 7104878;
      uint64_t v38 = swift_slowAlloc();
      v99[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 134218242;
      v97[0] = (id)v27;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v38 + 12) = 2080;
      uint64_t v87 = v13;
      if (a4
        && (v97[0] = a4,
            swift_errorRetain(),
            sub_10000493C(&qword_10002D720),
            sub_10001067C(0, &qword_10002D728),
            (swift_dynamicCast() & 1) != 0))
      {
        uint64_t v39 = (void *)v95;
        id v40 = [(id)v95 debugDescription];

        uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v42 = v41;
      }
      else
      {
        unint64_t v42 = 0xE300000000000000;
      }
      v97[0] = (id)sub_1000070E8(v37, v42, (uint64_t *)v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Could not fetch configuration from network. StatusCode=%ld Error=%s", (uint8_t *)v38, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v54 = *(void (**)(char *, uint64_t))(v93 + 8);
      uint64_t v9 = v90;
      v54(v20, v90);
      a5 = v89;
      uint64_t v13 = v87;
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      uint64_t v54 = *(void (**)(char *, uint64_t))(v10 + 8);
      uint64_t v9 = v90;
      v54(v20, v90);
    }
    goto LABEL_55;
  }
  sub_10001253C(v93, a2);
  unint64_t v43 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v99[0] = 0;
  id v45 = [v43 propertyListWithData:isa options:0 format:0 error:v99];

  unint64_t v88 = a2;
  uint64_t v89 = a5;
  if (v45)
  {
    id v46 = v99[0];
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10001067C(0, (unint64_t *)&unk_10002D740);
    if (swift_dynamicCast())
    {
      uint64_t v87 = v13;
      id v86 = v97[0];
      id v47 = [v97[0] allKeys];
      uint64_t v48 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v49 = *(void *)(v48 + 16);
      if (v49)
      {
        uint64_t v90 = v9;
        v85[1] = v48;
        uint64_t v50 = v48 + 32;
        while (1)
        {
          sub_1000085F4(v50, (uint64_t)v99);
          sub_1000085F4((uint64_t)v99, (uint64_t)v97);
          sub_10001067C(0, (unint64_t *)&unk_10002D750);
          if (!swift_dynamicCast()) {
            goto LABEL_46;
          }

          sub_100012600(v99, (uint64_t)v99[3]);
          id v51 = objc_msgSend(v86, "__swift_objectForKeyedSubscript:", _bridgeAnythingToObjectiveC<A>(_:)());
          swift_unknownObjectRelease();
          if (v51)
          {
            _bridgeAnyObjectToAny(_:)();
            swift_unknownObjectRelease();
          }
          else
          {
            long long v95 = 0u;
            long long v96 = 0u;
          }
          sub_1000104FC((uint64_t)&v95, (uint64_t)v97);
          if (!v98)
          {
            sub_100010564((uint64_t)v97, &qword_10002D5A8);
LABEL_46:
            swift_bridgeObjectRelease();
            type metadata accessor for TTSVBError();
            sub_1000125A8();
            uint64_t v71 = swift_allocError();
            TTSVBError.init(_:_:_:)();
            swift_willThrow();
            goto LABEL_49;
          }
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_46;
          }
          id v52 = v94;
          *(void *)&long long v95 = 0x65776F6C6C417349;
          *((void *)&v95 + 1) = 0xE900000000000064;
          id v53 = objc_msgSend(v94, "__swift_objectForKeyedSubscript:", _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)());
          swift_unknownObjectRelease();
          if (v53)
          {
            _bridgeAnyObjectToAny(_:)();
            swift_unknownObjectRelease();
          }
          else
          {
            long long v95 = 0u;
            long long v96 = 0u;
          }
          sub_1000104FC((uint64_t)&v95, (uint64_t)v97);
          if (!v98) {
            break;
          }
          sub_10001067C(0, &qword_10002D5C0);
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_48;
          }

          sub_1000085A4((uint64_t)v99);
          v50 += 32;
          if (!--v49)
          {
            swift_bridgeObjectRelease();
            a5 = v89;
            uint64_t v9 = v90;
            goto LABEL_43;
          }
        }
        sub_100010564((uint64_t)v97, &qword_10002D5A8);
LABEL_48:
        swift_bridgeObjectRelease();
        type metadata accessor for TTSVBError();
        sub_1000125A8();
        uint64_t v71 = swift_allocError();
        TTSVBError.init(_:_:_:)();
        swift_willThrow();

LABEL_49:
        sub_1000085A4((uint64_t)v99);
        a5 = v89;
        uint64_t v9 = v90;
      }
      else
      {
        swift_bridgeObjectRelease();
LABEL_43:
        uint64_t v71 = 0;
      }
      uint64_t v13 = v87;
      uint64_t v57 = v92;
      if (!v71) {
        goto LABEL_51;
      }
LABEL_38:
      static TTSVBLog.daemon.getter();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v58 = Logger.logObject.getter();
      os_log_type_t v59 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v58, v59))
      {
        os_log_type_t v60 = (uint8_t *)swift_slowAlloc();
        uint64_t v91 = (char *)swift_slowAlloc();
        v99[0] = v91;
        *(_DWORD *)os_log_type_t v60 = 136315138;
        id v86 = v60 + 4;
        uint64_t v61 = (void *)_convertErrorToNSError(_:)();
        uint64_t v90 = v9;
        uint64_t v62 = v61;
        uint64_t v63 = v13;
        uint64_t v64 = v10;
        id v65 = [v61 debugDescription];

        uint64_t v66 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v68 = v67;

        uint64_t v69 = v64;
        uint64_t v13 = v63;
        uint64_t v70 = v66;
        uint64_t v9 = v90;
        v97[0] = (id)sub_1000070E8(v70, v68, (uint64_t *)v99);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v58, v59, "Could not fetch configuration from network. Parse error: %s", v60, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        sub_100012528(v93, v88);

        swift_errorRelease();
        uint64_t v54 = *(void (**)(char *, uint64_t))(v69 + 8);
        v54(v92, v9);
      }
      else
      {
        sub_100012528(v93, v88);
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();

        uint64_t v54 = *(void (**)(char *, uint64_t))(v10 + 8);
        v54(v57, v9);
      }
      a5 = v89;
      goto LABEL_55;
    }
    type metadata accessor for TTSVBError();
    sub_1000125A8();
    uint64_t v56 = swift_allocError();
    TTSVBError.init(_:_:_:)();
  }
  else
  {
    id v55 = v99[0];
    uint64_t v56 = _convertNSErrorToError(_:)();
  }
  swift_willThrow();
  uint64_t v57 = v92;
  if (v56) {
    goto LABEL_38;
  }
LABEL_51:
  v72 = v91;
  static TTSVBLog.daemon.getter();
  id v73 = v86;
  v74 = Logger.logObject.getter();
  os_log_type_t v75 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v74, v75))
  {
    uint64_t v87 = v13;
    v76 = (uint8_t *)swift_slowAlloc();
    uint64_t v92 = (char *)swift_slowAlloc();
    *(_DWORD *)v76 = 138412290;
    v99[0] = v73;
    v77 = v73;
    uint64_t v13 = v87;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(void *)uint64_t v92 = v73;

    a5 = v89;
    _os_log_impl((void *)&_mh_execute_header, v74, v75, "Did fetch new server config (saving as new ServerConfiguration): %@", v76, 0xCu);
    sub_10000493C(&qword_10002D3F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    v72 = v91;
    swift_slowDealloc();
  }
  else
  {

    v74 = v73;
  }

  uint64_t v54 = *(void (**)(char *, uint64_t))(v10 + 8);
  v54(v72, v9);
  sub_10001067C(0, (unint64_t *)&unk_10002D730);
  v78 = (void *)static NSUserDefaults.voicebankingShared.getter();
  v79 = v73;
  NSString v80 = String._bridgeToObjectiveC()();
  [v78 setObject:v79 forKey:v80];
  sub_100012528(v93, v88);

LABEL_55:
  static TTSVBLog.daemon.getter();
  v81 = Logger.logObject.getter();
  os_log_type_t v82 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v81, v82))
  {
    v83 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v83 = 0;
    _os_log_impl((void *)&_mh_execute_header, v81, v82, "Giving up ServerConfigChecker network transaction", v83, 2u);
    swift_slowDealloc();
  }

  v54(v13, v9);
LABEL_58:
  *(void *)(a5 + 16) = 0;
  return swift_unknownObjectRelease();
}

uint64_t sub_100012260(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  return sub_100011384(a1, a2, a3, a4, v4);
}

uint64_t sub_100012268(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = a2;
  uint64_t v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v8 = v6;
    uint64_t v6 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  id v11 = a3;
  id v12 = a4;
  v7(v6, v10, a3, a4);

  sub_100012528((uint64_t)v6, v10);

  return swift_release();
}

uint64_t sub_100012330(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100012340()
{
  return swift_release();
}

uint64_t sub_100012348()
{
  swift_unknownObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_100012380()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  return result;
}

unint64_t sub_1000123A8(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100012444(a1, a2, v4);
}

uint64_t type metadata accessor for VoiceBankingServerConfigChecker()
{
  return self;
}

unint64_t sub_100012444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
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

uint64_t sub_100012528(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000FFD8(a1, a2);
  }
  return a1;
}

uint64_t sub_10001253C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100012550(a1, a2);
  }
  return a1;
}

uint64_t sub_100012550(uint64_t a1, unint64_t a2)
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

unint64_t sub_1000125A8()
{
  unint64_t result = qword_10002D530;
  if (!qword_10002D530)
  {
    type metadata accessor for TTSVBError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D530);
  }
  return result;
}

void *sub_100012600(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

id VoiceBankingDaemon.init()()
{
  Objectuint64_t Type = (objc_class *)swift_getObjectType();
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  *(void *)&v0[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___xpcServer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___xpcStore] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___liveSpeechSyncController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___userNotificationManager] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___serverConfigChecker] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_startupTransaction] = 0;
  uint64_t v9 = OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue;
  v8[1] = sub_10001067C(0, (unint64_t *)&qword_10002D798);
  unint64_t v6 = v0;
  static DispatchQoS.userInteractive.getter();
  uint64_t v13 = &_swiftEmptyArrayStorage;
  sub_10001BB7C(&qword_10002D7A0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000493C(&qword_10002D7A8);
  sub_10001C1AC(&qword_10002D7B0, &qword_10002D7A8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v10);
  *(void *)&v0[v9] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)&v6[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___voiceBankingManager] = 0;
  *(void *)&v6[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_datastoreEventSubscription] = 0;
  *(void *)&v6[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___accessManager] = 0;
  *(void *)&v6[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_notificationObserverTokens] = &_swiftEmptyArrayStorage;
  *(void *)&v6[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___assetsService] = 0;

  v12.receiver = v6;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, "init");
}

char *sub_100012998()
{
  uint64_t v1 = OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___xpcServer;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___xpcServer);
  if (v2)
  {
    uint64_t v3 = *(char **)(v0 + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___xpcServer);
  }
  else
  {
    uint64_t v4 = v0;
    type metadata accessor for VoiceBankingXPCServer();
    uint64_t v5 = (char *)VoiceBankingXPCServer.__allocating_init()();
    unint64_t v6 = &v5[OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate];
    swift_beginAccess();
    *((void *)v6 + 1) = &protocol witness table for VoiceBankingDaemon;
    swift_unknownObjectWeakAssign();
    uint64_t v7 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v5;
    uint64_t v3 = v5;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

uint64_t sub_100012A50()
{
  uint64_t v1 = OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___xpcStore;
  if (*(void *)(v0 + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___xpcStore))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___xpcStore);
  }
  else
  {
    uint64_t v3 = v0;
    type metadata accessor for VoiceBankingXPCStore();
    id v4 = sub_100012C18(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___voiceBankingManager, (uint64_t (*)(void))&type metadata accessor for TTSVBVoiceBankingManager);
    uint64_t v2 = sub_1000044FC(v4);
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

id sub_100012AE8(uint64_t *a1, void (*a2)(void), uint64_t (*a3)(void))
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void **)(v3 + *a1);
  if (v5)
  {
    id v6 = *(id *)(v3 + *a1);
  }
  else
  {
    uint64_t v8 = v3;
    a2(0);
    uint64_t v9 = (void *)a3();
    uint64_t v10 = *(void **)(v3 + v4);
    *(void *)(v8 + v4) = v9;
    id v6 = v9;

    uint64_t v5 = 0;
  }
  id v11 = v5;
  return v6;
}

uint64_t sub_100012B60()
{
  uint64_t v1 = OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___serverConfigChecker;
  if (*(void *)(v0 + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___serverConfigChecker))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___serverConfigChecker);
  }
  else
  {
    type metadata accessor for VoiceBankingServerConfigChecker();
    uint64_t v2 = sub_100012380();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_100012BD0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id sub_100012C18(uint64_t *a1, uint64_t (*a2)(void))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = [objc_allocWithZone((Class)a2(0)) init];
    uint64_t v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    uint64_t v4 = 0;
  }
  id v8 = v4;
  return v5;
}

Swift::Void __swiftcall VoiceBankingDaemon.run()()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v73 = *(void *)(v0 - 8);
  uint64_t v74 = v0;
  __chkstk_darwin(v0);
  v72 = (char *)v61 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = type metadata accessor for DispatchQoS();
  uint64_t v71 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v70 = (char *)v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v65 = (uint64_t (**)(uint64_t))type metadata accessor for DispatchTimeInterval();
  uint64_t v64 = (char *)*(v65 - 1);
  __chkstk_darwin(v65);
  uint64_t v4 = (void *)((char *)v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v75 = type metadata accessor for DispatchTime();
  uint64_t v67 = *(void *)(v75 - 8);
  uint64_t v5 = __chkstk_darwin(v75);
  uint64_t v7 = (char *)v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v66 = (char *)v61 - v8;
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  objc_super v12 = (char *)v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v77 = *(void *)(v13 - 8);
  uint64_t v78 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v69 = (char *)v61 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)v61 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)v61 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)v61 - v23;
  uid_t v25 = getuid();
  uid_t v26 = v25;
  if (v25 == 248 || !v25)
  {
    static TTSVBLog.daemon.getter();
    uint64_t v58 = Logger.logObject.getter();
    os_log_type_t v59 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v58, v59))
    {
      os_log_type_t v60 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v60 = 67109120;
      LODWORD(aBlock) = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "voicebankingd is not allowed to run as user: %u. Will exit(0) now.", v60, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v77 + 8))(v24, v78);
    exit(0);
  }
  static TTSVBPath.requireGroupContainerURL()();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  static TTSVBLog.daemon.getter();
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v27, v28))
  {
    os_log_type_t v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v29 = 67109120;
    LODWORD(aBlock) = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Starting up with uid=%u", v29, 8u);
    swift_slowDealloc();
  }

  uint64_t v30 = v77 + 8;
  int v31 = *(void (**)(char *, uint64_t))(v77 + 8);
  v31(v22, v78);
  static TTSVBLog.daemon.getter();
  id v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Taking boostrap transaction", v34, 2u);
    swift_slowDealloc();
  }

  uint64_t v77 = v30;
  uint64_t v63 = v31;
  v31(v19, v78);
  uint64_t v35 = os_transaction_create();
  os_log_type_t v36 = v68;
  *(void *)&v68[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_startupTransaction] = v35;
  swift_unknownObjectRelease();
  uint64_t v62 = OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue;
  id v37 = *(id *)&v36[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue];
  static DispatchTime.now()();
  void *v4 = 5;
  uint64_t v38 = v64;
  uint64_t v39 = v65;
  (*((void (**)(void *, void, uint64_t (**)(uint64_t)))v64 + 13))(v4, enum case for DispatchTimeInterval.seconds(_:), v65);
  id v40 = v7;
  unint64_t v41 = v66;
  + infix(_:_:)();
  (*((void (**)(void *, uint64_t (**)(uint64_t)))v38 + 1))(v4, v39);
  uint64_t v67 = *(void *)(v67 + 8);
  ((void (*)(char *, uint64_t))v67)(v40, v75);
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = v36;
  v84 = sub_10001BB5C;
  uint64_t v85 = v42;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v81 = 1107296256;
  id v65 = &v82;
  os_log_type_t v82 = sub_10001395C;
  v83 = &unk_100029B08;
  unint64_t v43 = _Block_copy(&aBlock);
  uint64_t v64 = v36;
  uint64_t v44 = v70;
  static DispatchQoS.unspecified.getter();
  v79 = _swiftEmptyArrayStorage;
  v61[2] = sub_10001BB7C(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  v61[1] = sub_10000493C(&qword_10002D7E8);
  v61[3] = sub_10001C1AC(&qword_10002D7F0, &qword_10002D7E8);
  id v45 = v72;
  uint64_t v46 = v74;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v43);

  uint64_t v73 = *(void *)(v73 + 8);
  ((void (*)(char *, uint64_t))v73)(v45, v46);
  uint64_t v71 = *(void *)(v71 + 8);
  ((void (*)(char *, uint64_t))v71)(v44, v76);
  ((void (*)(char *, uint64_t))v67)(v41, v75);
  swift_release();
  id v47 = *(void **)&v36[v62];
  uint64_t v48 = swift_allocObject();
  uint64_t v49 = v64;
  *(void *)(v48 + 16) = v64;
  v84 = sub_10001BBC4;
  uint64_t v85 = v48;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v81 = 1107296256;
  os_log_type_t v82 = sub_10001395C;
  v83 = &unk_100029B58;
  uint64_t v50 = _Block_copy(&aBlock);
  id v51 = v49;
  id v52 = v47;
  static DispatchQoS.unspecified.getter();
  v79 = _swiftEmptyArrayStorage;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v50);

  ((void (*)(char *, uint64_t))v73)(v45, v46);
  ((void (*)(char *, uint64_t))v71)(v44, v76);
  swift_release();
  id v53 = v69;
  static TTSVBLog.daemon.getter();
  uint64_t v54 = Logger.logObject.getter();
  os_log_type_t v55 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v56 = 0;
    _os_log_impl((void *)&_mh_execute_header, v54, v55, "Will enter run loop", v56, 2u);
    swift_slowDealloc();
  }

  v63(v53, v78);
  id v57 = [self currentRunLoop];
  [v57 run];
}

uint64_t sub_100013808(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TTSVBLog.daemon.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Giving up boostrap transaction", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(a1 + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_startupTransaction) = 0;
  return swift_unknownObjectRelease();
}

uint64_t sub_100013960()
{
  uint64_t v2 = sub_10000493C(&qword_10002D828);
  __chkstk_darwin(v2 - 8);
  v136 = (char *)v126 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000493C(&qword_10002D830);
  uint64_t v138 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v137 = (char *)v126 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v142 - 8);
  uint64_t v7 = __chkstk_darwin(v142);
  v134 = (char *)v126 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  v139 = (char *)v126 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v132 = (char *)v126 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  v129 = (char *)v126 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v130 = (char *)v126 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)v126 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)v126 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)v126 - v23;
  uid_t v25 = (void *)type metadata accessor for DispatchPredicate();
  uint64_t v26 = *(v25 - 1);
  __chkstk_darwin(v25);
  os_log_type_t v28 = (void *)((char *)v126 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  v135 = v0;
  uint64_t v133 = OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue;
  os_log_type_t v29 = *(void **)&v0[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue];
  *os_log_type_t v28 = v29;
  (*(void (**)(void *, void, void *))(v26 + 104))(v28, enum case for DispatchPredicate.onQueue(_:), v25);
  id v30 = v29;
  LOBYTE(v29) = _dispatchPreconditionTest(_:)();
  id v32 = *(void (**)(void *, void *))(v26 + 8);
  int v31 = (__objc2_class_ro *)(v26 + 8);
  v32(v28, v25);
  if ((v29 & 1) == 0)
  {
    __break(1u);
LABEL_42:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    goto LABEL_36;
  }
  uint64_t v131 = v4;
  static TTSVBLog.daemon.getter();
  os_log_type_t v33 = Logger.logObject.getter();
  os_log_type_t v34 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Beginning daemon boostrap process", v35, 2u);
    swift_slowDealloc();
  }

  os_log_type_t v36 = *(void (**)(char *, uint64_t))(v6 + 8);
  id v37 = v24;
  uint64_t v38 = v142;
  v36(v37, v142);
  static TTSVBLog.daemon.getter();
  uint64_t v39 = Logger.logObject.getter();
  os_log_type_t v40 = static os_log_type_t.info.getter();
  BOOL v41 = os_log_type_enabled(v39, v40);
  v140 = v36;
  uint64_t v141 = v6 + 8;
  if (v41)
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t aBlock = (char *)swift_slowAlloc();
    *(_DWORD *)uint64_t v42 = 136315138;
    id v43 = [self mainBundle];
    id v44 = [v43 bundleIdentifier];

    if (v44)
    {
      uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v47 = v46;
    }
    else
    {
      unint64_t v47 = 0xE700000000000000;
      uint64_t v45 = 0x3E7465736E753CLL;
    }
    id v149 = (id)sub_1000070E8(v45, v47, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "Main Bundle ID: %s", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v48 = v22;
    uint64_t v38 = v142;
    uint64_t v49 = v142;
    os_log_type_t v36 = v140;
  }
  else
  {

    uint64_t v48 = v22;
    uint64_t v49 = v38;
  }
  v36(v48, v49);
  if (TTSVBIsInternalUIBuild())
  {
    SecTaskRef v50 = SecTaskCreateFromSelf(0);
    if (v50
      && (id v51 = v50,
          id v52 = (__CFString *)String._bridgeToObjectiveC()(),
          CFTypeRef v53 = SecTaskCopyValueForEntitlement(v51, v52, 0),
          v51,
          v52,
          v53)
      && (id v149 = (id)v53, swift_dynamicCast())
      && (unint64_t v54 = v144) != 0)
    {
      uint64_t v55 = (uint64_t)aBlock;
    }
    else
    {
      unint64_t v54 = 0xE700000000000000;
      uint64_t v55 = 0x6E776F6E6B6E55;
    }
    static TTSVBLog.daemon.getter();
    swift_bridgeObjectRetain();
    uint64_t v56 = Logger.logObject.getter();
    os_log_type_t v57 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      uint64_t aBlock = (char *)swift_slowAlloc();
      *(_DWORD *)uint64_t v58 = 136315138;
      swift_bridgeObjectRetain();
      id v149 = (id)sub_1000070E8(v55, v54, (uint64_t *)&aBlock);
      uint64_t v38 = v142;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v56, v57, "CloudKit environment: %s", v58, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      os_log_type_t v36 = v140;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v36(v19, v38);
    os_log_type_t v59 = (void *)sub_10001067C(0, (unint64_t *)&unk_10002D730);
    os_log_type_t v60 = (void *)static NSUserDefaults.voicebankingShared.getter();
    uint64_t v61 = v130;
    static TTSVBLog.daemon.getter();
    id v62 = v60;
    uint64_t v63 = Logger.logObject.getter();
    os_log_type_t v64 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v63, v64))
    {
      id v65 = (uint8_t *)swift_slowAlloc();
      uint64_t v127 = swift_slowAlloc();
      uint64_t aBlock = (char *)v127;
      id v128 = v59;
      *(_DWORD *)id v65 = 136315138;
      v126[1] = v65 + 4;
      uint64_t v66 = v62;
      id v67 = [v62 dictionaryRepresentation];
      static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      id v62 = v66;
      uint64_t v68 = Dictionary.description.getter();
      unint64_t v70 = v69;
      swift_bridgeObjectRelease();
      id v149 = (id)sub_1000070E8(v68, v70, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "Check shared defaults can be read: %s", v65, 0xCu);
      os_log_type_t v36 = v140;
      swift_arrayDestroy();
      uint64_t v38 = v142;
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v71 = v130;
    }
    else
    {

      uint64_t v71 = v61;
    }
    v36(v71, v38);
    v72 = v129;
    uint64_t v73 = static NSUserDefaults.voicebankingSandboxedShared.getter();
    if (v73)
    {
      uint64_t v74 = (void *)v73;
      static TTSVBLog.daemon.getter();
      id v75 = v74;
      uint64_t v76 = Logger.logObject.getter();
      os_log_type_t v77 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v76, v77))
      {
        uint64_t v78 = (uint8_t *)swift_slowAlloc();
        v130 = (char *)swift_slowAlloc();
        uint64_t aBlock = v130;
        *(_DWORD *)uint64_t v78 = 136315138;
        uint64_t v127 = (uint64_t)(v78 + 4);
        id v79 = [v75 dictionaryRepresentation];
        id v128 = v62;
        static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v80 = Dictionary.description.getter();
        unint64_t v82 = v81;
        swift_bridgeObjectRelease();
        id v149 = (id)sub_1000070E8(v80, v82, (uint64_t *)&aBlock);
        uint64_t v38 = v142;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v76, v77, "Check shared sandboxed defaults can be read: %s", v78, 0xCu);
        os_log_type_t v36 = v140;
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v36(v129, v38);
      }
      else
      {

        v36(v72, v38);
      }
    }
    else
    {
    }
  }
  v83 = v132;
  static TTSVBLog.daemon.getter();
  v84 = Logger.logObject.getter();
  os_log_type_t v85 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v84, v85))
  {
    id v86 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v86 = 67109120;
    os_log_type_t v36 = v140;
    LODWORD(aBlock) = TTSVBHasDeviceBeenUnlockedSinceBoot();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v84, v85, "Has been unlocked since first boot: %{BOOL}d", v86, 8u);
    swift_slowDealloc();
  }

  v36(v83, v38);
  v147 = sub_100014EC4;
  uint64_t v148 = 0;
  uint64_t aBlock = (char *)_NSConcreteStackBlock;
  uint64_t v1 = 1107296256;
  uint64_t v144 = 1107296256;
  v145 = sub_10001395C;
  v146 = &unk_100029DE8;
  uint64_t v87 = _Block_copy(&aBlock);
  TTSVBRegisterForFirstUnlockSinceBoot();
  _Block_release(v87);
  unint64_t v88 = v135;
  id v89 = sub_100012C18(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___accessManager, (uint64_t (*)(void))&type metadata accessor for TTSVBAccessManager);
  dispatch thunk of TTSVBAccessManager.applyCloudKitAccessForCurrentConditions()();

  id v90 = sub_100012C18(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___accessManager, (uint64_t (*)(void))&type metadata accessor for TTSVBAccessManager);
  dispatch thunk of TTSVBAccessManager.startMonitoringForAccountChanges(_:)();

  uint64_t v91 = v139;
  static TTSVBLog.daemon.getter();
  uint64_t v92 = v88;
  uint64_t v93 = Logger.logObject.getter();
  os_log_type_t v94 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v93, v94))
  {
    long long v95 = (uint8_t *)swift_slowAlloc();
    uint64_t aBlock = (char *)swift_slowAlloc();
    *(_DWORD *)long long v95 = 136315138;
    id v96 = sub_100012C18(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___accessManager, (uint64_t (*)(void))&type metadata accessor for TTSVBAccessManager);
    dispatch thunk of TTSVBAccessManager.tccCloudKitAccess.getter();

    uint64_t v38 = v142;
    uint64_t v97 = TTSVBTCCCloudKitAccess.rawValue.getter();
    id v149 = (id)sub_1000070E8(v97, v98, (uint64_t *)&aBlock);
    os_log_type_t v36 = v140;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v93, v94, "iCloud TCC access: %s", v95, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v36(v139, v38);
  }
  else
  {

    v36(v91, v38);
  }
  uint64_t v99 = v131;
  v100 = v134;
  static TTSVBLog.daemon.getter();
  uint64_t v101 = Logger.logObject.getter();
  os_log_type_t v102 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v101, v102))
  {
    v103 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v103 = 0;
    _os_log_impl((void *)&_mh_execute_header, v101, v102, "Will load data stores", v103, 2u);
    swift_slowDealloc();
  }

  v36(v100, v38);
  id v104 = sub_100012C18(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___voiceBankingManager, (uint64_t (*)(void))&type metadata accessor for TTSVBVoiceBankingManager);
  uint64_t v105 = TTSVBVoiceBankingManager.dataStoreEventPublisher.getter();

  uint64_t aBlock = (char *)v105;
  id v149 = *(id *)&v88[v133];
  id v106 = v149;
  uint64_t v107 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
  uint64_t v108 = (uint64_t)v136;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v107 - 8) + 56))(v136, 1, 1, v107);
  id v109 = v106;
  sub_10000493C(&qword_10002D838);
  sub_10001067C(0, (unint64_t *)&qword_10002D798);
  sub_10001C1AC(&qword_10002D840, &qword_10002D838);
  sub_10001C104();
  v110 = v137;
  Publisher.receive<A>(on:options:)();
  sub_100010564(v108, &qword_10002D828);

  swift_release();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_10001C1AC((unint64_t *)&unk_10002D850, &qword_10002D830);
  uint64_t v111 = Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v138 + 8))(v110, v99);
  *(void *)&v92[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_datastoreEventSubscription] = v111;
  swift_release();
  uid_t v25 = [self defaultCenter];
  v112 = (void *)static NSNotificationName.ttsvbDidImportVoiceModel.getter();
  uint64_t v113 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v147 = sub_10001C1F0;
  uint64_t v148 = v113;
  uint64_t aBlock = (char *)_NSConcreteStackBlock;
  uint64_t v144 = 1107296256;
  v145 = sub_100015C14;
  v146 = &unk_100029E38;
  v114 = _Block_copy(&aBlock);
  swift_release();
  int v31 = &VoiceBankingXPCStore;
  id v115 = [v25 addObserverForName:v112 object:0 queue:0 usingBlock:v114];
  _Block_release(v114);

  uint64_t v0 = &v92[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_notificationObserverTokens];
  swift_beginAccess();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*(void *)v0 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v0 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    goto LABEL_42;
LABEL_36:
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  v116 = (void *)static NSNotificationName.ttsvbDidDeleteVoice.getter();
  uint64_t v117 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v147 = sub_10001C230;
  uint64_t v148 = v117;
  uint64_t aBlock = (char *)_NSConcreteStackBlock;
  uint64_t v144 = v1;
  v145 = sub_100015C14;
  v146 = &unk_100029E60;
  v118 = _Block_copy(&aBlock);
  swift_release();
  id v119 = objc_msgSend(v25, *(SEL *)&v31[44].flags, v116, 0, 0, v118);
  _Block_release(v118);

  swift_beginAccess();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*(void *)v0 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v0 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  v120 = (void *)static NSNotificationName.ttsvbDidPotentiallyDownloadVoiceModel.getter();
  uint64_t v121 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v147 = sub_10001C270;
  uint64_t v148 = v121;
  uint64_t aBlock = (char *)_NSConcreteStackBlock;
  uint64_t v144 = v1;
  v145 = sub_100015C14;
  v146 = &unk_100029E88;
  v122 = _Block_copy(&aBlock);
  swift_release();
  id v123 = objc_msgSend(v25, *(SEL *)&v31[44].flags, v120, 0, 0, v122);
  _Block_release(v122);

  swift_beginAccess();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*(void *)v0 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v0 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  id v124 = sub_100012C18(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___voiceBankingManager, (uint64_t (*)(void))&type metadata accessor for TTSVBVoiceBankingManager);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  TTSVBVoiceBankingManager.loadStores(_:)();

  return swift_release_n();
}

uint64_t sub_100014EC4()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TTSVBLog.daemon.getter();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Received notification that iphone was unlocked since first boot", v6, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100014FF8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100015040(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TTSVBDataStoreEvent();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  os_log_type_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v5, v2) != enum case for TTSVBDataStoreEvent.cloudKitSync(_:)) {
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v11 = (void *)Strong;
    sub_100015264((uint64_t)v9);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_100015264(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v54 = *(void *)(v3 - 8);
  uint64_t v55 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  id v51 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v52 = (char *)&v50 - v6;
  uint64_t v7 = type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  os_log_type_t v57 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v56 = (char *)&v50 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v50 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v50 - v16;
  uint64_t v18 = type metadata accessor for DispatchPredicate();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (uint64_t *)((char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = *(void **)&v1[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue];
  *uint64_t v21 = v22;
  (*(void (**)(void *, void, uint64_t))(v19 + 104))(v21, enum case for DispatchPredicate.onQueue(_:), v18);
  id v23 = v22;
  LOBYTE(v22) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v19 + 8))(v21, v18);
  if ((v22 & 1) == 0)
  {
    __break(1u);
    return;
  }
  CFTypeRef v53 = v1;
  uint64_t v24 = (void *)TTSVBDataStoreEvent.CloudKitSyncEvent.event.getter();
  id v25 = [v24 type];

  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v26(v17, a1, v7);
  if (v25 == (id)1) {
    char v27 = TTSVBDataStoreEvent.CloudKitSyncEvent.isFinished.getter();
  }
  else {
    char v27 = 0;
  }
  os_log_type_t v28 = *(void (**)(char *, uint64_t))(v8 + 8);
  v28(v17, v7);
  v26(v15, a1, v7);
  if (v27)
  {
    os_log_type_t v29 = (void *)TTSVBDataStoreEvent.CloudKitSyncEvent.event.getter();
    unsigned __int8 v30 = [v29 succeeded];

    v28(v15, v7);
    if (v30)
    {
      int v31 = v52;
      static TTSVBLog.daemon.getter();
      id v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v32, v33))
      {
        os_log_type_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "CloudKit import did finish. Will schedule sync of file-backed futures", v34, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v54 + 8))(v31, v55);
      uint64_t v35 = v53;
      id v36 = sub_100012C18(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___voiceBankingManager, (uint64_t (*)(void))&type metadata accessor for TTSVBVoiceBankingManager);
      *(void *)(swift_allocObject() + 16) = v35;
      id v37 = v35;
      TTSVBVoiceBankingManager.synchronizeFileBackedFuturesForAllModels(completion:)();

      swift_release();
      return;
    }
  }
  else
  {
    v28(v15, v7);
  }
  uint64_t v38 = (void *)TTSVBDataStoreEvent.CloudKitSyncEvent.event.getter();
  id v39 = [v38 type];

  os_log_type_t v40 = v56;
  v26(v56, a1, v7);
  if (v39)
  {
    v28(v40, v7);
    BOOL v41 = v57;
    v26(v57, a1, v7);
LABEL_18:
    v28(v41, v7);
    return;
  }
  char v42 = TTSVBDataStoreEvent.CloudKitSyncEvent.isFinished.getter();
  v28(v40, v7);
  BOOL v41 = v57;
  v26(v57, a1, v7);
  if ((v42 & 1) == 0) {
    goto LABEL_18;
  }
  id v43 = (void *)TTSVBDataStoreEvent.CloudKitSyncEvent.event.getter();
  unsigned __int8 v44 = [v43 succeeded];

  v28(v41, v7);
  if ((v44 & 1) == 0)
  {
    uint64_t v45 = v51;
    static TTSVBLog.daemon.getter();
    unint64_t v46 = Logger.logObject.getter();
    os_log_type_t v47 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Handling failed sync wetup event. Will restore Personal Voices still found locally on device", v48, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v54 + 8))(v45, v55);
    id v49 = sub_100012C18(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___voiceBankingManager, (uint64_t (*)(void))&type metadata accessor for TTSVBVoiceBankingManager);
    TTSVBVoiceBankingManager.repairDatastoreVoicesFromFilesystem(completion:)();
  }
}

void sub_1000158D4(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchPredicate();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (uint64_t *)((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = *(void **)(v2 + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);
  *uint64_t v12 = v13;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, enum case for DispatchPredicate.onQueue(_:), v9);
  id v14 = v13;
  LOBYTE(v13) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
  if (v13)
  {
    static TTSVBLog.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v21 = v5;
      *(_DWORD *)uint64_t v17 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_1000070E8(a1, a2, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Will rebuild the voice cache now: %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v21);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    uint64_t v18 = self;
    NSString v19 = String._bridgeToObjectiveC()();
    [v18 updateSpeechVoicesForClient:v19];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100015C14(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100015D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v15 = (void *)result;
    uint64_t v21 = v10;
    os_log_type_t v16 = *(void **)(result + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v15;
    aBlock[4] = a3;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001395C;
    aBlock[3] = a4;
    uint64_t v18 = _Block_copy(aBlock);
    id v19 = v16;
    id v20 = v15;
    static DispatchQoS.unspecified.getter();
    uint64_t v22 = _swiftEmptyArrayStorage;
    sub_10001BB7C(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10000493C(&qword_10002D7E8);
    sub_10001C1AC(&qword_10002D7F0, &qword_10002D7E8);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v21);
    return swift_release();
  }
  return result;
}

uint64_t sub_100016000(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v31 - v6;
  uint64_t v8 = type metadata accessor for TTSVBError();
  uint64_t v33 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v31 - v12;
  uint64_t v14 = sub_10000493C((uint64_t *)&unk_10002D860);
  __chkstk_darwin(v14);
  os_log_type_t v16 = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v18 = (void *)result;
    sub_100010498(a1, (uint64_t)v16, (uint64_t *)&unk_10002D860);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = v33;
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v13, v16, v8);
      static TTSVBLog.daemon.getter();
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v11, v13, v8);
      uint64_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        uint64_t v36 = v32;
        *(_DWORD *)uint64_t v24 = 136315138;
        v31[1] = v24 + 4;
        uint64_t v25 = TTSVBError.description.getter();
        uint64_t v35 = sub_1000070E8(v25, v26, &v36);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v8);
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Error loading data stores: %s", v24, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v8);
      }

      char v27 = *(void (**)(char *, uint64_t))(v34 + 8);
      v27(v7, v2);
      static TTSVBLog.daemon.getter();
      os_log_type_t v28 = Logger.logObject.getter();
      os_log_type_t v29 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v28, v29))
      {
        unsigned __int8 v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unsigned __int8 v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "voicebankingd will now exit with error 1", v30, 2u);
        swift_slowDealloc();
      }

      v27(v5, v2);
      exit(1);
    }
    id v19 = sub_100012C18(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___voiceBankingManager, (uint64_t (*)(void))&type metadata accessor for TTSVBVoiceBankingManager);
    *(void *)(swift_allocObject() + 16) = v18;
    id v20 = v18;
    TTSVBVoiceBankingManager.performVoiceDatastoreMigrationV1IfNeeded(completion:)();

    swift_release();
    return sub_100010564((uint64_t)v16, (uint64_t *)&unk_10002D860);
  }
  return result;
}

uint64_t sub_1000164E4(char *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v15[0] - 8);
  __chkstk_darwin(v15[0]);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void **)&a1[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue];
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  aBlock[4] = sub_10001C2C0;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001395C;
  aBlock[3] = &unk_100029F00;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v9;
  uint64_t v13 = a1;
  static DispatchQoS.unspecified.getter();
  v15[1] = _swiftEmptyArrayStorage;
  sub_10001BB7C(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000493C(&qword_10002D7E8);
  sub_10001C1AC(&qword_10002D7F0, &qword_10002D7E8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, void))(v6 + 8))(v8, v15[0]);
  return swift_release();
}

void sub_1000167B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for TTSVBPath();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v78 = v6;
  uint64_t v79 = v7;
  uint64_t v8 = __chkstk_darwin(v6);
  v72 = (char *)v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  os_log_type_t v77 = (char *)v70 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v76 = (char *)v70 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v74 = (char *)v70 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)v70 - v17;
  __chkstk_darwin(v16);
  id v20 = (char *)v70 - v19;
  uint64_t v21 = type metadata accessor for DispatchPredicate();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (void *)((char *)v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v75 = OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue;
  uint64_t v25 = *(void **)(v1 + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);
  *uint64_t v24 = v25;
  (*(void (**)(void *, void, uint64_t))(v22 + 104))(v24, enum case for DispatchPredicate.onQueue(_:), v21);
  id v26 = v25;
  LOBYTE(v25) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v22 + 8))(v24, v21);
  if (v25)
  {
    static TTSVBLog.daemon.getter();
    char v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v27, v28))
    {
      os_log_type_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Did load data stores.", v29, 2u);
      swift_slowDealloc();
    }

    uint64_t v30 = v78;
    uint64_t v31 = v79 + 8;
    uint64_t v73 = *(void (**)(char *, uint64_t))(v79 + 8);
    v73(v20, v78);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for TTSVBPath.root(_:), v2);
    TTSVBPath.markAsExcludedFromBackup()();
    if (v32)
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t v33 = v72;
      static TTSVBLog.daemon.getter();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v34 = Logger.logObject.getter();
      os_log_type_t v35 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        uint64_t v71 = (void **)swift_slowAlloc();
        uint64_t aBlock = v71;
        *(_DWORD *)uint64_t v36 = 136315138;
        v70[1] = v36 + 4;
        id v37 = (void *)_convertErrorToNSError(_:)();
        uint64_t v79 = v31;
        uint64_t v38 = v37;
        uint64_t v39 = v1;
        id v40 = [v37 debugDescription];

        uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v43 = v42;

        uint64_t v1 = v39;
        uint64_t v30 = v78;
        uint64_t v80 = sub_1000070E8(v41, v43, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Could not mark root path as excluded from backups: %s", v36, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
        unsigned __int8 v44 = v72;
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();

        unsigned __int8 v44 = v33;
      }
      uint64_t v45 = v73;
      v73(v44, v30);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t v45 = v73;
    }
    unint64_t v46 = v74;
    static TTSVBLog.daemon.getter();
    os_log_type_t v47 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v47, v48))
    {
      id v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Will start monitoring for Live Speech preference changes", v49, 2u);
      swift_slowDealloc();
    }

    v45(v18, v30);
    id v50 = sub_100012AE8(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___liveSpeechSyncController, (void (*)(void))type metadata accessor for LiveSpeechSyncController, (uint64_t (*)(void))VoiceBankingXPCServer.__allocating_init());
    sub_10001CDB0();

    static TTSVBLog.daemon.getter();
    id v51 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v51, v52))
    {
      CFTypeRef v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)CFTypeRef v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Will check in for notifyd and xpc activity launch events", v53, 2u);
      swift_slowDealloc();
    }

    v45(v46, v30);
    uint64_t v54 = swift_allocObject();
    swift_unknownObjectWeakInit();
    os_log_type_t v85 = sub_10001C2E4;
    uint64_t v86 = v54;
    uint64_t aBlock = _NSConcreteStackBlock;
    uint64_t v82 = 1107296256;
    v83 = sub_1000181CC;
    v84 = &unk_100029F28;
    uint64_t v55 = _Block_copy(&aBlock);
    swift_release();
    xpc_activity_register("com.apple.voicebanking.ServerConfigCheck.LaunchActivity", XPC_ACTIVITY_CHECK_IN, v55);
    _Block_release(v55);
    uint64_t v56 = *(void **)(v1 + v75);
    uint64_t v57 = swift_allocObject();
    swift_unknownObjectWeakInit();
    os_log_type_t v85 = sub_10001C2EC;
    uint64_t v86 = v57;
    uint64_t aBlock = _NSConcreteStackBlock;
    uint64_t v82 = 1107296256;
    v83 = sub_1000181CC;
    v84 = &unk_100029F50;
    uint64_t v58 = _Block_copy(&aBlock);
    os_log_type_t v59 = v56;
    swift_release();
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v59, v58);
    _Block_release(v58);

    os_log_type_t v60 = v76;
    static TTSVBLog.daemon.getter();
    uint64_t v61 = Logger.logObject.getter();
    os_log_type_t v62 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v63 = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "Will register for user notifications", v63, 2u);
      swift_slowDealloc();
    }

    v45(v60, v30);
    id v64 = sub_100012AE8(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___userNotificationManager, (void (*)(void))type metadata accessor for VoiceBankingUserNotificationManager, (uint64_t (*)(void))VoiceBankingXPCServer.__allocating_init());
    sub_100004B1C();

    id v65 = v77;
    static TTSVBLog.daemon.getter();
    uint64_t v66 = Logger.logObject.getter();
    os_log_type_t v67 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v68 = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "Will start XPC services", v68, 2u);
      swift_slowDealloc();
    }

    v45(v65, v30);
    sub_100012A50();
    sub_100004548();
    swift_release();
    unint64_t v69 = sub_100012998();
    VoiceBankingXPCServer.start()();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100017198(char a1, char a2)
{
  if (*(void *)&aUndefinesubmit[8 * a1] == *(void *)&aUndefinesubmit[8 * a2]
    && *(void *)&aD[8 * a1] == *(void *)&aD[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_100017220(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = a2;
  uint64_t v3 = type metadata accessor for TTSVBError();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v30 - v8;
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v32 = *(void *)(v10 - 8);
  uint64_t v33 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v30 - v14;
  uint64_t v16 = sub_10000493C((uint64_t *)&unk_10002D860);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010498(a1, (uint64_t)v18, (uint64_t *)&unk_10002D860);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v18, v3);
    static TTSVBLog.daemon.getter();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v36 = v31;
      *(_DWORD *)uint64_t v21 = 136315138;
      v30[1] = v21 + 4;
      uint64_t v22 = TTSVBError.description.getter();
      uint64_t v35 = sub_1000070E8(v22, v23, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v24 = *(void (**)(char *, uint64_t))(v4 + 8);
      v24(v7, v3);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Error synchronizing file-backed futures: %s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v33);
      v24(v9, v3);
    }
    else
    {

      os_log_type_t v28 = *(void (**)(char *, uint64_t))(v4 + 8);
      v28(v7, v3);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v33);
      v28(v9, v3);
    }
  }
  else
  {
    static TTSVBLog.daemon.getter();
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v25, v26))
    {
      char v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Successfully finished synchronizing file-backed futures", v27, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v32 + 8))(v15, v33);
    sub_100010564((uint64_t)v18, (uint64_t *)&unk_10002D860);
  }
  id v29 = sub_100012C18(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___voiceBankingManager, (uint64_t (*)(void))&type metadata accessor for TTSVBVoiceBankingManager);
  TTSVBVoiceBankingManager.importCloudVoicesIntoLocalDatastore(completion:)();
}

uint64_t sub_1000176D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TTSVBError();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v28 - v7;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v30 = *(void *)(v9 - 8);
  uint64_t v31 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v28 - v13;
  uint64_t v15 = sub_10000493C((uint64_t *)&unk_10002D860);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010498(a1, (uint64_t)v17, (uint64_t *)&unk_10002D860);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v17, v2);
    static TTSVBLog.daemon.getter();
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v33 = v29;
      *(_DWORD *)os_log_type_t v20 = 136315138;
      os_log_type_t v28 = v20 + 4;
      uint64_t v21 = TTSVBError.description.getter();
      uint64_t v32 = sub_1000070E8(v21, v22, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      unint64_t v23 = *(void (**)(char *, uint64_t))(v3 + 8);
      v23(v6, v2);
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Error importing iCloud data into local stores: %s", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      unint64_t v23 = *(void (**)(char *, uint64_t))(v3 + 8);
      v23(v6, v2);
    }
    (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v31);
    return ((uint64_t (*)(char *, uint64_t))v23)(v8, v2);
  }
  else
  {
    static TTSVBLog.daemon.getter();
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v24, v25))
    {
      os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Successfully finished importing iCloud data into local store", v26, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v31);
    return sub_100010564((uint64_t)v17, (uint64_t *)&unk_10002D860);
  }
}

uint64_t sub_100017B08(uint64_t a1)
{
  uint64_t v39 = type metadata accessor for TTSVBError();
  uint64_t v2 = *(void *)(v39 - 8);
  uint64_t v3 = __chkstk_darwin(v39);
  uint64_t v38 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v32 - v5;
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v32 - v12;
  uint64_t v14 = sub_10000493C((uint64_t *)&unk_10002D860);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010498(a1, (uint64_t)v16, (uint64_t *)&unk_10002D860);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v36 = v8;
    uint64_t v37 = v7;
    uint64_t v17 = v39;
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v6, v16, v39);
    static TTSVBLog.daemon.getter();
    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
    v18(v38, v6, v17);
    os_log_type_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    uint64_t v21 = v6;
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = (void *)swift_slowAlloc();
      uint64_t v34 = v22;
      uint64_t v35 = v21;
      *(_DWORD *)unint64_t v22 = 138412290;
      v32[1] = v22 + 4;
      sub_10001BB7C((unint64_t *)&qword_10002D530, (void (*)(uint64_t))&type metadata accessor for TTSVBError);
      uint64_t v23 = v39;
      swift_allocError();
      uint64_t v24 = v38;
      v18(v25, v38, v23);
      uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v40 = v26;
      uint64_t v21 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v33 = v26;
      char v27 = *(void (**)(char *, uint64_t))(v2 + 8);
      v27(v24, v23);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Could not repair datastore. Error: %@", v34, 0xCu);
      sub_10000493C(&qword_10002D3F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      char v27 = *(void (**)(char *, uint64_t))(v2 + 8);
      v27(v38, v39);
    }
    (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v37);
    return ((uint64_t (*)(char *, uint64_t))v27)(v21, v39);
  }
  else
  {
    static TTSVBLog.daemon.getter();
    os_log_type_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Succesfully completed datastore repair.", v30, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    return sub_100010564((uint64_t)v16, (uint64_t *)&unk_10002D860);
  }
}

uint64_t sub_100017FD0(_xpc_activity_s *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  xpc_activity_state_t state = xpc_activity_get_state(a1);
  static TTSVBLog.daemon.getter();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134217984;
    v14[1] = state;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Wake event received: [xpc activity] ServerConfigCheck state=%ld", v9, 0xCu);
    swift_slowDealloc();
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (state == 2)
  {
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v12 = (void *)Strong;
      uint64_t v13 = sub_100012B60();

      (*(void (**)(void))(*(void *)v13 + 112))();
      swift_release();
    }
    return xpc_activity_set_state(a1, 5);
  }
  return result;
}

uint64_t sub_1000181CC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_10001822C(void *a1, uint64_t a2)
{
  uint64_t v83 = type metadata accessor for DispatchTime();
  uint64_t v81 = *(void *)(v83 - 8);
  uint64_t v4 = __chkstk_darwin(v83);
  uint64_t v80 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v82 = (char *)&v75 - v6;
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v88 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = type metadata accessor for DispatchQoS();
  uint64_t v89 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  uint64_t v11 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v75 - v17;
  uint64_t result = (uint64_t)xpc_dictionary_get_string(a1, _xpc_event_key_name);
  if (!result) {
    return result;
  }
  uint64_t v78 = v16;
  uint64_t v86 = v13;
  uint64_t v84 = v8;
  os_log_type_t v20 = (void *)(a2 + 16);
  uint64_t v21 = a2;
  uint64_t v22 = String.init(cString:)();
  unint64_t v24 = v23;
  static TTSVBLog.daemon.getter();
  swift_bridgeObjectRetain_n();
  os_log_type_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.default.getter();
  BOOL v27 = os_log_type_enabled(v25, v26);
  id v85 = v20;
  if (v27)
  {
    uint64_t v76 = v7;
    uint64_t v28 = swift_slowAlloc();
    os_log_type_t v77 = v11;
    os_log_type_t v29 = (uint8_t *)v28;
    uint64_t aBlock = swift_slowAlloc();
    uint64_t v79 = v12;
    *(_DWORD *)os_log_type_t v29 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v97 = sub_1000070E8(v22, v24, &aBlock);
    uint64_t v30 = v76;
    uint64_t v12 = v79;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Wake event received: [notifyd] %s", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v11 = v77;
    swift_slowDealloc();

    uint64_t v31 = *(void (**)(char *, uint64_t))(v86 + 8);
    v31(v18, v12);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v31 = *(void (**)(char *, uint64_t))(v86 + 8);
    v31(v18, v12);
    uint64_t v30 = v7;
  }
  if (v22 == 0xD000000000000013 && v24 == 0x8000000100025C30)
  {
    swift_bridgeObjectRelease();
    uint64_t v32 = v21;
LABEL_10:
    swift_beginAccess();
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    uint64_t v33 = v84;
    if (!result) {
      return result;
    }
    uint64_t v34 = (void *)result;
    id v35 = *(id *)(result + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);

    long long v95 = sub_10001C41C;
    uint64_t v96 = v32;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v92 = 1107296256;
    uint64_t v36 = &unk_10002A0B8;
    goto LABEL_12;
  }
  uint64_t v32 = v21;
  if (_stringCompareWithSmolCheck(_:_:expecting:)())
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if (v22 == 0xD000000000000037 && v24 == 0x8000000100025BD0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      uint64_t v41 = (void *)result;
      uint64_t v42 = sub_100012B60();

      (*(void (**)(void))(*(void *)v42 + 112))();
      return swift_release();
    }
  }
  else
  {
    if (v22 == 0xD00000000000001ELL && v24 == 0x8000000100025C50
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      return swift_bridgeObjectRelease();
    }
    if ((v22 != 0xD00000000000001ELL || v24 != 0x8000000100025C70)
      && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      if (v22 == 0xD00000000000001ELL && v24 == 0x8000000100025C90
        || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_beginAccess();
        uint64_t result = swift_unknownObjectWeakLoadStrong();
        uint64_t v33 = v84;
        if (!result) {
          return result;
        }
        os_log_type_t v52 = (void *)result;
        id v35 = *(id *)(result + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);

        long long v95 = sub_10001C324;
        uint64_t v96 = v32;
        uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
        uint64_t v92 = 1107296256;
        uint64_t v36 = &unk_10002A068;
      }
      else if (v22 == 0xD00000000000001ELL && v24 == 0x8000000100025CB0 {
             || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      }
      {
        swift_bridgeObjectRelease();
        swift_beginAccess();
        uint64_t result = swift_unknownObjectWeakLoadStrong();
        uint64_t v33 = v84;
        if (!result) {
          return result;
        }
        CFTypeRef v53 = (void *)result;
        id v35 = *(id *)(result + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);

        long long v95 = sub_10001C31C;
        uint64_t v96 = v32;
        uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
        uint64_t v92 = 1107296256;
        uint64_t v36 = &unk_10002A040;
      }
      else
      {
        uint64_t v79 = v12;
        if (v22 == 0xD00000000000001CLL && v24 == 0x8000000100025CD0)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v83 = v21;
          uint64_t v54 = v30;
          uint64_t v55 = v89;
          uint64_t v56 = v22;
          if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          {
            if (v22 == 0xD00000000000001ELL && v24 == 0x8000000100025CF0
              || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              swift_beginAccess();
              uint64_t result = swift_unknownObjectWeakLoadStrong();
              uint64_t v58 = v54;
              uint64_t v59 = v83;
              uint64_t v60 = v84;
              if (!result) {
                return result;
              }
              uint64_t v61 = (void *)result;
              id v62 = *(id *)(result + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);

              long long v95 = sub_10001C30C;
              uint64_t v96 = v59;
              uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
              uint64_t v92 = 1107296256;
              uint64_t v63 = &unk_100029FF0;
            }
            else if (v22 == 0xD00000000000001BLL && v24 == 0x8000000100025D10 {
                   || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            }
            {
              swift_bridgeObjectRelease();
              swift_beginAccess();
              uint64_t result = swift_unknownObjectWeakLoadStrong();
              uint64_t v58 = v54;
              uint64_t v64 = v83;
              uint64_t v60 = v84;
              if (!result) {
                return result;
              }
              id v65 = (void *)result;
              id v62 = *(id *)(result + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);

              long long v95 = sub_10001C304;
              uint64_t v96 = v64;
              uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
              uint64_t v92 = 1107296256;
              uint64_t v63 = &unk_100029FC8;
            }
            else if (v22 == 0xD000000000000019 && v24 == 0x8000000100025D30 {
                   || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            }
            {
              swift_bridgeObjectRelease();
              swift_beginAccess();
              uint64_t result = swift_unknownObjectWeakLoadStrong();
              uint64_t v58 = v54;
              uint64_t v66 = v83;
              uint64_t v60 = v84;
              if (!result) {
                return result;
              }
              os_log_type_t v67 = (void *)result;
              id v62 = *(id *)(result + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);

              long long v95 = sub_10001C2FC;
              uint64_t v96 = v66;
              uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
              uint64_t v92 = 1107296256;
              uint64_t v63 = &unk_100029FA0;
            }
            else
            {
              if ((v22 != 0xD00000000000001BLL || v24 != 0x8000000100025D50)
                && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
              {
                static TTSVBLog.daemon.getter();
                swift_bridgeObjectRetain();
                v72 = Logger.logObject.getter();
                os_log_type_t v73 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v72, v73))
                {
                  uint64_t v74 = (uint8_t *)swift_slowAlloc();
                  uint64_t aBlock = swift_slowAlloc();
                  *(_DWORD *)uint64_t v74 = 136315138;
                  swift_bridgeObjectRetain();
                  uint64_t v97 = sub_1000070E8(v56, v24, &aBlock);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  swift_bridgeObjectRelease_n();
                  _os_log_impl((void *)&_mh_execute_header, v72, v73, "Received unknown notifyd event: %s", v74, 0xCu);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {

                  swift_bridgeObjectRelease_n();
                }
                return ((uint64_t (*)(char *, uint64_t))v31)(v78, v79);
              }
              swift_bridgeObjectRelease();
              swift_beginAccess();
              uint64_t result = swift_unknownObjectWeakLoadStrong();
              uint64_t v58 = v54;
              uint64_t v68 = v83;
              uint64_t v60 = v84;
              if (!result) {
                return result;
              }
              unint64_t v69 = (void *)result;
              id v62 = *(id *)(result + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);

              long long v95 = sub_10001C2F4;
              uint64_t v96 = v68;
              uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
              uint64_t v92 = 1107296256;
              uint64_t v63 = &unk_100029F78;
            }
            uint64_t v93 = sub_10001395C;
            os_log_type_t v94 = v63;
            unint64_t v70 = _Block_copy(&aBlock);
            swift_retain();
            static DispatchQoS.unspecified.getter();
            id v90 = _swiftEmptyArrayStorage;
            sub_10001BB7C(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
            sub_10000493C(&qword_10002D7E8);
            sub_10001C1AC(&qword_10002D7F0, &qword_10002D7E8);
            uint64_t v71 = v88;
            dispatch thunk of SetAlgebra.init<A>(_:)();
            OS_dispatch_queue.async(group:qos:flags:execute:)();
            _Block_release(v70);

            (*(void (**)(char *, uint64_t))(v60 + 8))(v71, v58);
            (*(void (**)(char *, uint64_t))(v55 + 8))(v11, v87);
            return swift_release();
          }
          swift_bridgeObjectRelease();
          uint64_t v30 = v54;
          uint64_t v32 = v83;
        }
        swift_beginAccess();
        uint64_t result = swift_unknownObjectWeakLoadStrong();
        uint64_t v33 = v84;
        if (!result) {
          return result;
        }
        uint64_t v57 = (void *)result;
        id v35 = *(id *)(result + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);

        long long v95 = sub_10001C314;
        uint64_t v96 = v32;
        uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
        uint64_t v92 = 1107296256;
        uint64_t v36 = &unk_10002A018;
      }
LABEL_12:
      uint64_t v93 = sub_10001395C;
      os_log_type_t v94 = v36;
      uint64_t v37 = _Block_copy(&aBlock);
      swift_retain();
      static DispatchQoS.unspecified.getter();
      id v90 = _swiftEmptyArrayStorage;
      sub_10001BB7C(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_10000493C(&qword_10002D7E8);
      uint64_t v38 = v30;
      sub_10001C1AC(&qword_10002D7F0, &qword_10002D7E8);
      uint64_t v40 = v88;
      uint64_t v39 = v89;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v37);

      (*(void (**)(char *, uint64_t))(v33 + 8))(v40, v38);
      (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v87);
      return swift_release();
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    uint64_t v43 = v84;
    if (result)
    {
      unsigned __int8 v44 = (void *)result;
      id v85 = *(id *)(result + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);

      uint64_t v45 = v80;
      static DispatchTime.now()();
      + infix(_:_:)();
      uint64_t v86 = *(void *)(v81 + 8);
      ((void (*)(char *, uint64_t))v86)(v45, v83);
      long long v95 = sub_10001C388;
      uint64_t v96 = v21;
      uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
      uint64_t v92 = 1107296256;
      uint64_t v93 = sub_10001395C;
      os_log_type_t v94 = &unk_10002A090;
      uint64_t v46 = v30;
      os_log_type_t v47 = _Block_copy(&aBlock);
      swift_retain();
      static DispatchQoS.unspecified.getter();
      id v90 = _swiftEmptyArrayStorage;
      sub_10001BB7C(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_10000493C(&qword_10002D7E8);
      sub_10001C1AC(&qword_10002D7F0, &qword_10002D7E8);
      id v49 = v88;
      uint64_t v48 = v89;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      id v50 = v82;
      id v51 = v85;
      OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
      _Block_release(v47);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v49, v46);
      (*(void (**)(char *, uint64_t))(v48 + 8))(v11, v87);
      ((void (*)(char *, uint64_t))v86)(v50, v83);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_1000194E4()
{
  uint64_t v0 = type metadata accessor for DispatchPredicate();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (uint64_t *)((char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = *(void **)(result + OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue);
    *uint64_t v3 = v6;
    (*(void (**)(void *, void, uint64_t))(v1 + 104))(v3, enum case for DispatchPredicate.onQueue(_:), v0);
    id v7 = v6;
    LOBYTE(v6) = _dispatchPreconditionTest(_:)();
    uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v1 + 8))(v3, v0);
    if (v6)
    {
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = v5;
      id v9 = v5;
      sub_10001A4E4(0x6E55207473726946, 0xEC0000006B636F6CLL, (uint64_t)sub_10001C424, v8);

      return swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_10001968C(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchPredicate();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (unint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void **)&v2[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue];
  void *v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  id v9 = v8;
  LOBYTE(v8) = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if (v8)
  {
    uint64_t v11 = 8 * a1;
    uint64_t v12 = *(void *)&aUndefinesubmit[v11];
    uint64_t v13 = *(void **)&aD[v11];
    static TTSVBAnalytics.trainingEventOccurred(eventName:)();
    swift_bridgeObjectRelease();
    unint64_t v19 = 0;
    unint64_t v20 = 0xE000000000000000;
    _StringGuts.grow(_:)(32);
    swift_bridgeObjectRelease();
    unint64_t v19 = 0xD00000000000001ELL;
    unint64_t v20 = 0x8000000100025D70;
    v14._countAndFlagsBits = v12;
    v14._object = v13;
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    uint64_t v15 = v19;
    unint64_t v16 = v20;
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v2;
    *(unsigned char *)(v17 + 24) = a1;
    uint64_t v18 = v2;
    sub_10001A4E4(v15, v16, (uint64_t)sub_10001C524, v17);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100019888(char a1)
{
  return *(void *)&aUndefinesubmit[8 * a1];
}

uint64_t sub_1000198A8(char *a1, char *a2)
{
  return sub_100017198(*a1, *a2);
}

Swift::Int sub_1000198B4()
{
  return sub_100019924();
}

uint64_t sub_1000198C0()
{
  return sub_1000198C8();
}

uint64_t sub_1000198C8()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10001991C()
{
  return sub_100019924();
}

Swift::Int sub_100019924()
{
  return Hasher._finalize()();
}

unint64_t sub_10001998C@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10001BBE8(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000199BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100019888(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000199E8(char a1, char *a2, char a3)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v19[0] - 8);
  __chkstk_darwin(v19[0]);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void **)&a2[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue];
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = a2;
  *(unsigned char *)(v14 + 32) = a3;
  aBlock[4] = sub_10001C568;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001395C;
  aBlock[3] = &unk_10002A1A8;
  uint64_t v15 = _Block_copy(aBlock);
  id v16 = v13;
  uint64_t v17 = a2;
  static DispatchQoS.unspecified.getter();
  v19[1] = _swiftEmptyArrayStorage;
  sub_10001BB7C(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000493C(&qword_10002D7E8);
  sub_10001C1AC(&qword_10002D7F0, &qword_10002D7E8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, void))(v10 + 8))(v12, v19[0]);
  return swift_release();
}

uint64_t sub_100019CC4(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v62 = *(void *)(v4 - 8);
  uint64_t v63 = v4;
  __chkstk_darwin(v4);
  uint64_t v60 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = type metadata accessor for DispatchQoS();
  uint64_t v59 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchTime();
  uint64_t v57 = *(void *)(v8 - 8);
  uint64_t v58 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v55 - v12;
  uint64_t v14 = type metadata accessor for DispatchPredicate();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (uint64_t *)((char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue;
  unint64_t v19 = *(void **)&v2[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue];
  void *v17 = v19;
  (*(void (**)(void *, void, uint64_t))(v15 + 104))(v17, enum case for DispatchPredicate.onQueue(_:), v14);
  id v20 = v19;
  LOBYTE(v19) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v15 + 8))(v17, v14);
  if ((v19 & 1) == 0)
  {
    __break(1u);
    JUMPOUT(0x10001A4C8);
  }
  id v21 = sub_100012AE8(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___userNotificationManager, (void (*)(void))type metadata accessor for VoiceBankingUserNotificationManager, (uint64_t (*)(void))VoiceBankingXPCServer.__allocating_init());
  char v22 = sub_100005ED8();
  uint64_t v23 = sub_100005EE0(0xD000000000000010, 0x8000000100025DB0, v22 & 1);
  uint64_t v55 = v24;
  uint64_t v56 = v23;

  uint64_t v25 = 0xD000000000000031;
  unint64_t v26 = 0x8000000100025E90;
  BOOL v27 = 1;
  switch(a1)
  {
    case 1:
      id v28 = sub_100012AE8(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___userNotificationManager, (void (*)(void))type metadata accessor for VoiceBankingUserNotificationManager, (uint64_t (*)(void))VoiceBankingXPCServer.__allocating_init());
      uint64_t v29 = 0xD00000000000001FLL;
      uint64_t v30 = 0x8000000100025E70;
      BOOL v27 = 1;
      goto LABEL_10;
    case 2:
      id v31 = sub_100012AE8(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___userNotificationManager, (void (*)(void))type metadata accessor for VoiceBankingUserNotificationManager, (uint64_t (*)(void))VoiceBankingXPCServer.__allocating_init());
      uint64_t v25 = sub_100005EE0(0xD00000000000001DLL, 0x8000000100025E50, 1);
      unint64_t v26 = v32;

      BOOL v27 = _AXSVoiceOverTouchEnabled() == 0;
      break;
    case 3:
      id v33 = sub_100012AE8(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___userNotificationManager, (void (*)(void))type metadata accessor for VoiceBankingUserNotificationManager, (uint64_t (*)(void))VoiceBankingXPCServer.__allocating_init());
      char v34 = sub_100005ED8();
      uint64_t v35 = 0x8000000100025E30;
      char v36 = v34 & 1;
      uint64_t v37 = 0xD00000000000001FLL;
      goto LABEL_7;
    case 4:
      id v33 = sub_100012AE8(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___userNotificationManager, (void (*)(void))type metadata accessor for VoiceBankingUserNotificationManager, (uint64_t (*)(void))VoiceBankingXPCServer.__allocating_init());
      char v38 = sub_100005ED8();
      uint64_t v35 = 0x8000000100025E10;
      char v36 = v38 & 1;
      uint64_t v37 = 0xD00000000000001CLL;
LABEL_7:
      uint64_t v25 = sub_100005EE0(v37, v35, v36);
      unint64_t v26 = v39;

      BOOL v27 = 1;
      break;
    case 5:
      id v40 = sub_100012AE8(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___userNotificationManager, (void (*)(void))type metadata accessor for VoiceBankingUserNotificationManager, (uint64_t (*)(void))VoiceBankingXPCServer.__allocating_init());
      char v41 = sub_100005ED8();
      uint64_t v25 = sub_100005EE0(0xD00000000000001ELL, 0x8000000100025DF0, v41 & 1);
      unint64_t v26 = v42;

      BOOL v27 = 1;
      break;
    case 6:
      id v28 = sub_100012AE8(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___userNotificationManager, (void (*)(void))type metadata accessor for VoiceBankingUserNotificationManager, (uint64_t (*)(void))VoiceBankingXPCServer.__allocating_init());
      uint64_t v30 = 0x8000000100025DD0;
      BOOL v27 = 1;
      uint64_t v29 = 0xD00000000000001CLL;
LABEL_10:
      uint64_t v25 = sub_100005EE0(v29, v30, 1);
      unint64_t v26 = v43;

      break;
    default:
      break;
  }
  id v44 = *(id *)&v2[v18];
  static DispatchTime.now()();
  + infix(_:_:)();
  uint64_t v45 = v58;
  uint64_t v57 = *(void *)(v57 + 8);
  uint64_t v46 = v11;
  os_log_type_t v47 = v13;
  ((void (*)(char *, uint64_t))v57)(v46, v58);
  uint64_t v48 = (void *)swift_allocObject();
  uint64_t v49 = v56;
  v48[2] = v2;
  v48[3] = v49;
  v48[4] = v55;
  v48[5] = v25;
  v48[6] = v26;
  v48[7] = v27;
  aBlock[4] = sub_10001C608;
  aBlock[5] = v48;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001395C;
  aBlock[3] = &unk_10002A1F8;
  id v50 = _Block_copy(aBlock);
  id v51 = v2;
  static DispatchQoS.unspecified.getter();
  uint64_t v64 = _swiftEmptyArrayStorage;
  sub_10001BB7C(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000493C(&qword_10002D7E8);
  sub_10001C1AC(&qword_10002D7F0, &qword_10002D7E8);
  os_log_type_t v52 = v60;
  uint64_t v53 = v63;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v50);

  (*(void (**)(char *, uint64_t))(v62 + 8))(v52, v53);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v7, v61);
  ((void (*)(char *, uint64_t))v57)(v47, v45);
  return swift_release();
}

uint64_t sub_10001A4E4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v33 = a1;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v31 = *(void *)(v9 - 8);
  uint64_t v32 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DispatchPredicate();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (uint64_t *)((char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = *(void **)&v5[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue];
  void *v15 = v16;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v15, enum case for DispatchPredicate.onQueue(_:), v12);
  id v17 = v16;
  char v18 = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v13 + 8))(v15, v12);
  if (v18)
  {
    uint64_t v30 = a3;
    static TTSVBLog.daemon.getter();
    swift_bridgeObjectRetain_n();
    id v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      char v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v29 = a4;
      uint64_t v35 = v23;
      *(_DWORD *)char v22 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v24 = v33;
      uint64_t v34 = sub_1000070E8(v33, a2, &v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Refreshing voice models for reason: %s", v22, 0xCu);
      swift_arrayDestroy();
      a4 = v29;
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v32);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v32);
      uint64_t v24 = v33;
    }
    id v25 = sub_100012C18(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___voiceBankingManager, (uint64_t (*)(void))&type metadata accessor for TTSVBVoiceBankingManager);
    unint64_t v26 = (void *)swift_allocObject();
    v26[2] = v30;
    v26[3] = a4;
    v26[4] = v24;
    v26[5] = a2;
    v26[6] = v5;
    swift_bridgeObjectRetain();
    swift_retain();
    BOOL v27 = v5;
    TTSVBVoiceBankingManager.refreshModels(completion:)();

    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001A884(void (*a1)(char *, uint64_t), void (*a2)(void), uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v62 = a6;
  uint64_t v63 = a3;
  uint64_t v69 = a4;
  uint64_t v64 = a2;
  os_log_type_t v73 = a1;
  uint64_t v7 = type metadata accessor for TTSVBVoiceModelStateTransition();
  uint64_t v70 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v75 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  os_log_type_t v67 = (char *)&v60 - v10;
  uint64_t v74 = type metadata accessor for Logger();
  uint64_t v71 = *(void *)(v74 - 8);
  uint64_t v11 = __chkstk_darwin(v74);
  uint64_t v68 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v60 - v14;
  __chkstk_darwin(v13);
  v72 = (char *)&v60 - v16;
  uint64_t v17 = type metadata accessor for TTSVBError();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  os_log_type_t v21 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v60 - v22;
  uint64_t v24 = sub_10000493C(&qword_10002D560);
  __chkstk_darwin(v24);
  unint64_t v26 = (uint64_t *)((char *)&v60 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100010498((uint64_t)v73, (uint64_t)v26, &qword_10002D560);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v18 + 32))(v23, v26, v17);
    static TTSVBLog.daemon.getter();
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v17);
    BOOL v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.error.getter();
    uint64_t v29 = v23;
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v75 = v23;
      uint64_t v31 = (uint8_t *)v30;
      v77[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315138;
      sub_10001BB7C((unint64_t *)&qword_10002D530, (void (*)(uint64_t))&type metadata accessor for TTSVBError);
      uint64_t v32 = Error.localizedDescription.getter();
      uint64_t v76 = sub_1000070E8(v32, v33, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v18 + 8);
      v34(v21, v17);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Could not refresh voice models: %s", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v29 = v75;
      swift_slowDealloc();
    }
    else
    {
      uint64_t v34 = *(void (**)(char *, uint64_t))(v18 + 8);
      v34(v21, v17);
    }

    (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v74);
    v64(0);
    return ((uint64_t (*)(char *, uint64_t))v34)(v29, v17);
  }
  else
  {
    uint64_t v61 = *v26;
    static TTSVBLog.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      v77[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_1000070E8(v69, a5, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Voice model status after refresh for reason: %s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v39 = v71;
    os_log_type_t v73 = *(void (**)(char *, uint64_t))(v71 + 8);
    v73(v15, v74);
    char v41 = v68;
    uint64_t v43 = v63;
    unint64_t v42 = v64;
    uint64_t v44 = *(void *)(v61 + 16);
    if (v44)
    {
      uint64_t v45 = *(char **)(v70 + 16);
      uint64_t v46 = v61 + ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80));
      uint64_t v71 = *(void *)(v70 + 72);
      v72 = v45;
      uint64_t v69 = v39 + 8;
      v70 += 8;
      *(void *)&long long v40 = 136315138;
      long long v66 = v40;
      id v65 = (char *)&type metadata for Any + 8;
      os_log_type_t v47 = v75;
      uint64_t v48 = v67;
      do
      {
        id v50 = v72;
        ((void (*)(char *, uint64_t, uint64_t))v72)(v48, v46, v7);
        static TTSVBLog.daemon.getter();
        ((void (*)(char *, char *, uint64_t))v50)(v47, v48, v7);
        id v51 = Logger.logObject.getter();
        os_log_type_t v52 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v51, v52))
        {
          uint64_t v53 = swift_slowAlloc();
          v77[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v53 = v66;
          uint64_t v54 = TTSVBVoiceModelStateTransition.description.getter();
          *(void *)(v53 + 4) = sub_1000070E8(v54, v55, v77);
          swift_bridgeObjectRelease();
          uint64_t v56 = *(void (**)(char *, uint64_t))v70;
          (*(void (**)(char *, uint64_t))v70)(v75, v7);
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "%s", (uint8_t *)v53, 0xCu);
          swift_arrayDestroy();
          uint64_t v48 = v67;
          swift_slowDealloc();
          os_log_type_t v47 = v75;
          swift_slowDealloc();

          uint64_t v57 = v68;
          v73(v68, v74);
          v56(v48, v7);
          char v41 = v57;
        }
        else
        {

          uint64_t v49 = *(void (**)(char *, uint64_t))v70;
          (*(void (**)(char *, uint64_t))v70)(v47, v7);
          v73(v41, v74);
          v49(v48, v7);
        }
        v46 += v71;
        --v44;
      }
      while (v44);
      swift_bridgeObjectRelease();
      uint64_t v43 = v63;
      unint64_t v42 = v64;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    id v58 = sub_100012C18(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___voiceBankingManager, (uint64_t (*)(void))&type metadata accessor for TTSVBVoiceBankingManager);
    uint64_t v59 = swift_allocObject();
    *(void *)(v59 + 16) = v42;
    *(void *)(v59 + 24) = v43;
    swift_retain();
    TTSVBVoiceBankingManager.fetchInstalledVoiceModels(completion:)();

    return swift_release();
  }
}

uint64_t VoiceBankingDaemon.performOnQueueWithVoiceBankingManager(handler:)(uint64_t a1, uint64_t a2)
{
  return sub_10001B2B4(a1, a2, (uint64_t)&unk_100029B90, (uint64_t)sub_10001BC38, (uint64_t)&unk_100029BA8);
}

uint64_t VoiceBankingDaemon.performOnQueueWithAccessManager(handler:)(uint64_t a1, uint64_t a2)
{
  return sub_10001B2B4(a1, a2, (uint64_t)&unk_100029BE0, (uint64_t)sub_10001BC9C, (uint64_t)&unk_100029BF8);
}

uint64_t sub_10001B2B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v21 = a5;
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v23 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for DispatchQoS();
  uint64_t v12 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void **)&v5[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue];
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = v5;
  aBlock[4] = a4;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001395C;
  aBlock[3] = v21;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = v15;
  swift_retain();
  uint64_t v19 = v5;
  static DispatchQoS.unspecified.getter();
  uint64_t v24 = &_swiftEmptyArrayStorage;
  sub_10001BB7C(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000493C(&qword_10002D7E8);
  sub_10001C1AC(&qword_10002D7F0, &qword_10002D7E8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v22);
  return swift_release();
}

Swift::Void __swiftcall VoiceBankingDaemon.requestVoiceCacheRebuildIfNeeded()()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v13[0] - 8);
  __chkstk_darwin(v13[0]);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  aBlock[4] = sub_10001BD18;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001395C;
  aBlock[3] = &unk_100029C48;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = v8;
  uint64_t v12 = v0;
  static DispatchQoS.unspecified.getter();
  v13[1] = &_swiftEmptyArrayStorage;
  sub_10001BB7C(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000493C(&qword_10002D7E8);
  sub_10001C1AC(&qword_10002D7F0, &qword_10002D7E8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, void))(v5 + 8))(v7, v13[0]);
  swift_release();
}

uint64_t sub_10001B850(char a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v22 = a5;
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for DispatchQoS();
  uint64_t v12 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void **)&a2[OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon_queue];
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  aBlock[4] = a4;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001395C;
  aBlock[3] = v22;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = v15;
  uint64_t v19 = a2;
  static DispatchQoS.unspecified.getter();
  uint64_t v24 = &_swiftEmptyArrayStorage;
  sub_10001BB7C(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000493C(&qword_10002D7E8);
  sub_10001C1AC(&qword_10002D7F0, &qword_10002D7E8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v23);
  return swift_release();
}

uint64_t sub_10001BB24()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001BB5C()
{
  return sub_100013808(*(void *)(v0 + 16));
}

uint64_t sub_10001BB64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001BB74()
{
  return swift_release();
}

uint64_t sub_10001BB7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001BBC4()
{
  return sub_100013960();
}

unint64_t sub_10001BBE8(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100029A18, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 7) {
    return 7;
  }
  else {
    return v3;
  }
}

void sub_10001BC38()
{
}

uint64_t sub_10001BC5C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10001BC9C()
{
}

void sub_10001BCBC(uint64_t *a1, uint64_t (*a2)(void))
{
  unint64_t v3 = *(void (**)(void))(v2 + 16);
  id v4 = sub_100012C18(a1, a2);
  v3();
}

uint64_t sub_10001BD18()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  id v3 = v1;
  sub_10001A4E4(0x5220746E65696C43, 0xEE00747365757165, (uint64_t)sub_10001BFDC, v2);

  return swift_release();
}

unint64_t sub_10001BDB0()
{
  unint64_t result = qword_10002D7F8;
  if (!qword_10002D7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D7F8);
  }
  return result;
}

uint64_t type metadata accessor for VoiceBankingDaemon()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for VoiceBankingDaemon.TTSVBSiriTrainingEvent(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for VoiceBankingDaemon.TTSVBSiriTrainingEvent(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for VoiceBankingDaemon.TTSVBSiriTrainingEvent(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x10001BF94);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_10001BFBC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001BFC4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for VoiceBankingDaemon.TTSVBSiriTrainingEvent()
{
  return &type metadata for VoiceBankingDaemon.TTSVBSiriTrainingEvent;
}

uint64_t sub_10001BFDC(char a1)
{
  return sub_10001B850(a1, *(char **)(v1 + 16), (uint64_t)&unk_100029DA8, (uint64_t)sub_10001C0E0, (uint64_t)&unk_100029DC0);
}

uint64_t sub_10001C01C()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10001C064(void (*a1)(char *, uint64_t))
{
  return sub_10001A884(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_10001C074()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001C0AC(uint64_t a1)
{
  return (*(uint64_t (**)(BOOL))(v1 + 16))(*(void *)(a1 + 16) != 0);
}

void sub_10001C0E0()
{
}

unint64_t sub_10001C104()
{
  unint64_t result = qword_10002D848;
  if (!qword_10002D848)
  {
    sub_10001067C(255, (unint64_t *)&qword_10002D798);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D848);
  }
  return result;
}

uint64_t sub_10001C16C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001C1A4(uint64_t a1)
{
  return sub_100015040(a1);
}

uint64_t sub_10001C1AC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100012BD0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001C1F0()
{
  return sub_100015D08(v0, (uint64_t)&unk_10002A2D0, (uint64_t)sub_10001C730, (uint64_t)&unk_10002A2E8);
}

uint64_t sub_10001C230()
{
  return sub_100015D08(v0, (uint64_t)&unk_10002A280, (uint64_t)sub_10001C6F4, (uint64_t)&unk_10002A298);
}

uint64_t sub_10001C270()
{
  return sub_100015D08(v0, (uint64_t)&unk_10002A230, (uint64_t)sub_10001C6B8, (uint64_t)&unk_10002A248);
}

uint64_t sub_10001C2B0(uint64_t a1)
{
  return sub_100016000(a1);
}

uint64_t sub_10001C2B8()
{
  return sub_1000164E4(*(char **)(v0 + 16));
}

void sub_10001C2C0()
{
}

uint64_t sub_10001C2E4(_xpc_activity_s *a1)
{
  return sub_100017FD0(a1);
}

uint64_t sub_10001C2EC(void *a1)
{
  return sub_10001822C(a1, v1);
}

void sub_10001C2F4()
{
}

void sub_10001C2FC()
{
}

void sub_10001C304()
{
}

void sub_10001C30C()
{
}

void sub_10001C314()
{
}

void sub_10001C31C()
{
}

void sub_10001C324()
{
}

void sub_10001C32C(char a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    int v3 = (void *)Strong;
    sub_10001968C(a1);
  }
}

void sub_10001C388()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = sub_100012AE8(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___liveSpeechSyncController, (void (*)(void))type metadata accessor for LiveSpeechSyncController, (uint64_t (*)(void))VoiceBankingXPCServer.__allocating_init());

    sub_10001D200();
  }
}

uint64_t sub_10001C41C()
{
  return sub_1000194E4();
}

uint64_t sub_10001C424(char a1)
{
  return sub_10001B850(a1, *(char **)(v1 + 16), (uint64_t)&unk_10002A118, (uint64_t)sub_10001C49C, (uint64_t)&unk_10002A130);
}

uint64_t sub_10001C464()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001C49C()
{
}

void sub_10001C4BC(uint64_t a1, unint64_t a2)
{
  if (*(unsigned char *)(v2 + 16) == 1) {
    sub_1000158D4(a1, a2);
  }
}

uint64_t sub_10001C4EC()
{
  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_10001C524(char a1)
{
  return sub_1000199E8(a1, *(char **)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_10001C530()
{
  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_10001C568()
{
  char v1 = *(unsigned char *)(v0 + 32);
  if (*(unsigned char *)(v0 + 16) == 1) {
    sub_1000158D4(0xD000000000000019, 0x8000000100025D90);
  }
  return sub_100019CC4(v1);
}

uint64_t sub_10001C5C0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_10001C608()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  id v6 = sub_100012AE8(&OBJC_IVAR____TtC13voicebankingd18VoiceBankingDaemon____lazy_storage___userNotificationManager, (void (*)(void))type metadata accessor for VoiceBankingUserNotificationManager, (uint64_t (*)(void))VoiceBankingXPCServer.__allocating_init());
  sub_100004B74(v1, v2, v3, v4, v5);
}

void sub_10001C6B8()
{
}

void sub_10001C6F4()
{
}

void sub_10001C730()
{
}

void sub_10001C76C(uint64_t a1)
{
  sub_100017220(a1, *(void *)(v1 + 16));
}

unint64_t sub_10001C878()
{
  unint64_t result = qword_10002D798;
  if (!qword_10002D798)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002D798);
  }
  return result;
}

void sub_10001C8B8()
{
  Objectuint64_t Type = (objc_class *)swift_getObjectType();
  uint64_t v18 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  uint64_t v17 = OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_queue;
  unint64_t v16 = sub_10001C878();
  id v6 = v0;
  static DispatchQoS.userInteractive.getter();
  uint64_t v20 = &_swiftEmptyArrayStorage;
  sub_10001D4E4(&qword_10002D7A0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000493C(&qword_10002D7A8);
  sub_10001D52C(&qword_10002D7B0, &qword_10002D7A8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v18);
  *(void *)&v0[v17] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  static TTSVBLiveSpeechSupport.localPrefsDomain.getter();
  id v7 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithSuiteName:v8];

  if (v9)
  {
    *(void *)&v6[OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_localDefaults] = v9;
    uint64_t v10 = OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_cloudDefaults;
    static TTSVBLiveSpeechSupport.cloudPrefsDomain.getter();
    id v11 = objc_allocWithZone((Class)NSUbiquitousKeyValueStore);
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v13 = [v11 initWithStoreIdentifier:v12 type:0];

    *(void *)&v6[v10] = v13;
    *(void *)&v6[OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_favoritePhrasesPrefObservation] = 0;

    v19.receiver = v6;
    v19.super_class = ObjectType;
    objc_msgSendSuper2(&v19, "init");
  }
  else
  {
    __break(1u);
  }
}

id sub_10001CC2C()
{
  Objectuint64_t Type = (objc_class *)swift_getObjectType();
  id v2 = [self defaultCenter];
  [v2 removeObserver:v0];

  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_10001CDB0()
{
  return sub_10001D228((uint64_t)&unk_10002A348, (uint64_t)sub_10001D120, (uint64_t)&unk_10002A360);
}

uint64_t sub_10001CDD8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  NSString v8 = (char *)&v23 - v7;
  id v9 = [self defaultCenter];
  uint64_t v10 = OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_cloudDefaults;
  [v9 addObserver:a1 selector:"handleCloudPrefsChanged:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:*(void *)(a1 + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_cloudDefaults)];

  id v24 = *(id *)(a1 + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_localDefaults);
  id v11 = v24;
  swift_getKeyPath();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v12 = v11;
  uint64_t v13 = _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
  swift_release();
  swift_release();

  uint64_t v14 = *(void **)(a1 + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_favoritePhrasesPrefObservation);
  *(void *)(a1 + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_favoritePhrasesPrefObservation) = v13;

  static TTSVBLog.daemon.getter();
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Will synchronize Live Speech cloud prefs", v17, 2u);
    swift_slowDealloc();
  }

  uint64_t v18 = *(void (**)(char *, uint64_t))(v3 + 8);
  v18(v8, v2);
  uint64_t result = (uint64_t)[*(id *)(a1 + v10) synchronize];
  if ((result & 1) == 0)
  {
    static TTSVBLog.daemon.getter();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Error occurred synchronizing Live Speech cloud prefs", v22, 2u);
      swift_slowDealloc();
    }

    return ((uint64_t (*)(char *, uint64_t))v18)(v6, v2);
  }
  return result;
}

uint64_t sub_10001D0E8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001D120()
{
  return sub_10001CDD8(*(void *)(v0 + 16));
}

void sub_10001D128(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [*a1 liveSpeechPhrases];
  sub_10000493C(&qword_10002D8C8);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  *a2 = v4;
}

void sub_10001D190(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  sub_10000493C(&qword_10002D8C8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v2 setLiveSpeechPhrases:isa];
}

uint64_t sub_10001D200()
{
  return sub_10001D228((uint64_t)&unk_10002A398, (uint64_t)sub_10001ECD0, (uint64_t)&unk_10002A3B0);
}

uint64_t sub_10001D228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v19[0] - 8);
  __chkstk_darwin(v19[0]);
  id v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void **)&v3[OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_queue];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v3;
  aBlock[4] = a2;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001395C;
  aBlock[3] = a3;
  uint64_t v15 = _Block_copy(aBlock);
  id v16 = v13;
  uint64_t v17 = v3;
  static DispatchQoS.unspecified.getter();
  v19[1] = _swiftEmptyArrayStorage;
  sub_10001D4E4(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000493C(&qword_10002D7E8);
  sub_10001D52C(&qword_10002D7F0, &qword_10002D7E8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, void))(v10 + 8))(v12, v19[0]);
  return swift_release();
}

uint64_t sub_10001D4CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001D4DC()
{
  return swift_release();
}

uint64_t sub_10001D4E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001D52C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100012BD0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001D57C(uint64_t a1)
{
  uint64_t v20 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v23 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v21 = *(void *)(v5 - 8);
  uint64_t v22 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Notification();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = *(void **)&v1[OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_queue];
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  *(void *)(v13 + ((v10 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = v1;
  aBlock[4] = sub_10001ED7C;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001395C;
  aBlock[3] = &unk_10002A400;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = v11;
  id v16 = v1;
  static DispatchQoS.unspecified.getter();
  id v24 = _swiftEmptyArrayStorage;
  sub_10001D4E4(&qword_10002D7E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000493C(&qword_10002D7E8);
  sub_10001D52C(&qword_10002D7F0, &qword_10002D7E8);
  uint64_t v17 = v20;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v17);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v22);
  return swift_release();
}

void sub_10001D908(uint64_t a1, uint64_t a2)
{
  uint64_t v97 = a2;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v96 = (char *)v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  long long v95 = (char *)v88 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  os_log_type_t v94 = (char *)v88 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v12 = (char *)v88 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  id v15 = (char *)v88 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)v88 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)v88 - v19;
  static TTSVBLog.daemon.getter();
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Did receive cloud change for Live Speech prefs.", v23, 2u);
    swift_slowDealloc();
  }

  id v24 = *(void (**)(char *, uint64_t))(v3 + 8);
  v24(v20, v2);
  uint64_t v25 = Notification.userInfo.getter();
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v98 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v99 = v27;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v26 + 16) && (unint64_t v28 = sub_10001F85C((uint64_t)v100), (v29 & 1) != 0))
    {
      sub_1000085F4(*(void *)(v26 + 56) + 32 * v28, (uint64_t)&v102);
    }
    else
    {
      long long v102 = 0u;
      long long v103 = 0u;
    }
    sub_100020BE4((uint64_t)v100);
    if (*((void *)&v103 + 1))
    {
      if ((swift_dynamicCast() & 1) == 0)
      {
        swift_bridgeObjectRelease();
        return;
      }
      uint64_t v30 = v98;
      uint64_t v98 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v99 = v31;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v26 + 16) && (unint64_t v32 = sub_10001F85C((uint64_t)v100), (v33 & 1) != 0))
      {
        sub_1000085F4(*(void *)(v26 + 56) + 32 * v32, (uint64_t)&v102);
      }
      else
      {
        long long v102 = 0u;
        long long v103 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_100020BE4((uint64_t)v100);
      if (*((void *)&v103 + 1))
      {
        sub_10000493C(&qword_10002D8E0);
        if ((swift_dynamicCast() & 1) == 0) {
          return;
        }
        uint64_t v34 = (void *)v98;
        static TTSVBLog.daemon.getter();
        swift_bridgeObjectRetain_n();
        uint64_t v35 = Logger.logObject.getter();
        os_log_type_t v36 = static os_log_type_t.info.getter();
        int v91 = v36;
        BOOL v37 = os_log_type_enabled(v35, v36);
        uint64_t v92 = v30;
        uint64_t v93 = v34;
        if (v37)
        {
          uint64_t v38 = swift_slowAlloc();
          uint64_t v90 = swift_slowAlloc();
          v100[0] = v90;
          *(_DWORD *)uint64_t v38 = 134218242;
          *(void *)&long long v102 = v30;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v38 + 12) = 2080;
          v88[1] = v38 + 14;
          swift_bridgeObjectRetain();
          uint64_t v39 = Array.description.getter();
          os_log_t v89 = v35;
          uint64_t v40 = v39;
          unint64_t v42 = v41;
          swift_bridgeObjectRelease();
          *(void *)&long long v102 = sub_1000070E8(v40, v42, v100);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          os_log_t v43 = v89;
          _os_log_impl((void *)&_mh_execute_header, v89, (os_log_type_t)v91, "Cloud change reason=%ld changeKeys=%s", (uint8_t *)v38, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v34 = v93;
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v24(v18, v2);
        uint64_t v44 = static TTSVBLiveSpeechSupport.favoritePhrasesKey.getter();
        char v46 = sub_10001E4B0(v44, v45, v34);
        swift_bridgeObjectRelease();
        if (v46)
        {
          uint64_t v47 = v92;
          id v48 = *(id *)(v97 + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_cloudDefaults);
          static TTSVBLiveSpeechSupport.favoritePhrasesKey.getter();
          NSString v49 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          id v50 = [v48 objectForKey:v49];

          if (v50)
          {
            _bridgeAnyObjectToAny(_:)();
            swift_unknownObjectRelease();
          }
          else
          {
            long long v102 = 0u;
            long long v103 = 0u;
          }
          os_log_type_t v52 = v93;
          sub_1000104FC((uint64_t)&v102, (uint64_t)v100);
          uint64_t v53 = v47;
          if (v101)
          {
            sub_10000493C(&qword_10002D898);
            if (swift_dynamicCast()) {
              uint64_t v51 = v98;
            }
            else {
              uint64_t v51 = 0;
            }
          }
          else
          {
            sub_10001F7FC((uint64_t)v100);
            uint64_t v51 = 0;
          }
        }
        else
        {
          uint64_t v51 = 0;
          uint64_t v53 = v92;
          os_log_type_t v52 = v93;
        }
        uint64_t v54 = static TTSVBLiveSpeechSupport.favoritePhraseCategoriesKey.getter();
        char v56 = sub_10001E4B0(v54, v55, v52);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v56)
        {
          uint64_t v93 = (void *)v51;
          uint64_t v57 = v53;
          id v58 = *(id *)(v97 + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_cloudDefaults);
          static TTSVBLiveSpeechSupport.favoritePhraseCategoriesKey.getter();
          NSString v59 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          id v60 = [v58 objectForKey:v59];

          if (v60)
          {
            _bridgeAnyObjectToAny(_:)();
            swift_unknownObjectRelease();
          }
          else
          {
            long long v102 = 0u;
            long long v103 = 0u;
          }
          sub_1000104FC((uint64_t)&v102, (uint64_t)v100);
          uint64_t v53 = v57;
          if (v101)
          {
            sub_10000493C((uint64_t *)&unk_10002D8F0);
            if (swift_dynamicCast()) {
              uint64_t v61 = v98;
            }
            else {
              uint64_t v61 = 0;
            }
          }
          else
          {
            sub_10001F7FC((uint64_t)v100);
            uint64_t v61 = 0;
          }
          uint64_t v51 = (uint64_t)v93;
          if (!v53) {
            goto LABEL_53;
          }
        }
        else
        {
          uint64_t v61 = 0;
          if (!v53)
          {
LABEL_53:
            static TTSVBLog.daemon.getter();
            uint64_t v74 = Logger.logObject.getter();
            os_log_type_t v75 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v74, v75))
            {
              uint64_t v76 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v76 = 0;
              _os_log_impl((void *)&_mh_execute_header, v74, v75, "Cloud content changed. Replacing local favorites with external favorites", v76, 2u);
              swift_slowDealloc();
            }

            v24(v15, v2);
            if (v51)
            {
              id v77 = *(id *)(v97 + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_localDefaults);
              sub_10000493C(&qword_10002D8C8);
              Class isa = Array._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease();
              [v77 setLiveSpeechPhrases:isa];
            }
            if (v61)
            {
              id v79 = *(id *)(v97 + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_localDefaults);
              sub_10000493C(&qword_10002D8E8);
              Class v80 = Dictionary._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease();
              [v79 setLiveSpeechCategories:v80];
            }
            return;
          }
        }
        swift_bridgeObjectRelease();
        if (v53 == 1)
        {
          static TTSVBLog.daemon.getter();
          uint64_t v62 = Logger.logObject.getter();
          os_log_type_t v63 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v62, v63))
          {
            uint64_t v64 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v64 = 0;
            _os_log_impl((void *)&_mh_execute_header, v62, v63, "Initial sync with cloud store. Merge cloud favorites into local favorites", v64, 2u);
            swift_slowDealloc();
          }

          v24(v12, v2);
          if (v51)
          {
            id v65 = *(id *)(v97 + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_localDefaults);
            id v66 = [v65 liveSpeechPhrases];
            sub_10000493C(&qword_10002D8C8);
            os_log_type_t v67 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

            sub_10001E578(v51, v67);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            Class v68 = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease();
            [v65 setLiveSpeechPhrases:v68];
          }
          return;
        }
        swift_bridgeObjectRelease();
        if (v53 == 3)
        {
          uint64_t v69 = v95;
          static TTSVBLog.daemon.getter();
          uint64_t v70 = Logger.logObject.getter();
          os_log_type_t v71 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v70, v71))
          {
            v72 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v72 = 0;
            os_log_type_t v73 = "Cloud store account changed";
            goto LABEL_61;
          }
        }
        else
        {
          if (v53 != 2)
          {
            uint64_t v82 = v96;
            static TTSVBLog.daemon.getter();
            uint64_t v83 = Logger.logObject.getter();
            os_log_type_t v84 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v83, v84))
            {
              id v85 = (uint8_t *)swift_slowAlloc();
              uint64_t v86 = v53;
              uint64_t v87 = v85;
              *(_DWORD *)id v85 = 134217984;
              v100[0] = v86;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              _os_log_impl((void *)&_mh_execute_header, v83, v84, "Unknown Cloud change reason=%ld", v87, 0xCu);
              swift_slowDealloc();
            }

            uint64_t v81 = v82;
            goto LABEL_66;
          }
          uint64_t v69 = v94;
          static TTSVBLog.daemon.getter();
          uint64_t v70 = Logger.logObject.getter();
          os_log_type_t v71 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v70, v71))
          {
            v72 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v72 = 0;
            os_log_type_t v73 = "Cloud store quota violation";
LABEL_61:
            _os_log_impl((void *)&_mh_execute_header, v70, v71, v73, v72, 2u);
            swift_slowDealloc();
          }
        }

        uint64_t v81 = v69;
LABEL_66:
        v24(v81, v2);
        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_10001F7FC((uint64_t)&v102);
  }
}

uint64_t sub_10001E4B0(uint64_t a1, uint64_t a2, void *a3)
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

uint64_t sub_10001E578(uint64_t a1, char *a2)
{
  uint64_t v43 = a1;
  uint64_t v4 = type metadata accessor for DispatchPredicate();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char **)((char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void **)(v2 + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_queue);
  void *v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  id v9 = v8;
  LOBYTE(v8) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
    __break(1u);
    goto LABEL_61;
  }
  uint64_t v10 = *((void *)a2 + 2);
  if (v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = 0;
    BOOL v12 = (char *)_swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v14 = *(void *)&a2[8 * v11 + 32];
      swift_bridgeObjectRetain();
      uint64_t v15 = static TTSVBLiveSpeechSupport.phraseTextKey.getter();
      if (*(void *)(v14 + 16) && (unint64_t v17 = sub_1000123A8(v15, v16), (v18 & 1) != 0))
      {
        sub_1000085F4(*(void *)(v14 + 56) + 32 * v17, (uint64_t)&v47);
      }
      else
      {
        long long v47 = 0u;
        long long v48 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v48 + 1))
      {
        if (swift_dynamicCast()) {
          goto LABEL_15;
        }
      }
      else
      {
        sub_10001F7FC((uint64_t)&v47);
      }
      uint64_t v49 = 0;
      uint64_t v50 = 0;
LABEL_15:
      swift_bridgeObjectRelease();
      uint64_t v19 = v50;
      if (v50)
      {
        uint64_t v20 = v49;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          BOOL v12 = sub_10001F6EC(0, *((void *)v12 + 2) + 1, 1, v12);
        }
        unint64_t v22 = *((void *)v12 + 2);
        unint64_t v21 = *((void *)v12 + 3);
        if (v22 >= v21 >> 1) {
          BOOL v12 = sub_10001F6EC((char *)(v21 > 1), v22 + 1, 1, v12);
        }
        *((void *)v12 + 2) = v22 + 1;
        uint64_t v13 = &v12[16 * v22];
        *((void *)v13 + 4) = v20;
        *((void *)v13 + 5) = v19;
      }
      if (v10 == ++v11)
      {
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
  }
  BOOL v12 = (char *)_swiftEmptyArrayStorage;
LABEL_22:
  uint64_t v23 = v43;
  uint64_t v24 = *(void *)(v43 + 16);
  if (!v24)
  {
    swift_bridgeObjectRetain();
LABEL_59:
    swift_bridgeObjectRelease();
    *(void *)&long long v47 = a2;
    swift_bridgeObjectRetain_n();
    sub_10001F968((void **)&v47);
    swift_bridgeObjectRelease_n();
    return v47;
  }
  uint64_t v25 = v43 + 32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v26 = 0;
  unint64_t v42 = v12 + 72;
  uint64_t v45 = (char *)&type metadata for Any + 8;
  uint64_t v46 = v24;
  uint64_t v44 = v23 + 32;
  while (1)
  {
    uint64_t v27 = *(void *)(v25 + 8 * v26);
    swift_bridgeObjectRetain();
    uint64_t v28 = static TTSVBLiveSpeechSupport.phraseTextKey.getter();
    if (*(void *)(v27 + 16) && (unint64_t v30 = sub_1000123A8(v28, v29), (v31 & 1) != 0))
    {
      sub_1000085F4(*(void *)(v27 + 56) + 32 * v30, (uint64_t)&v47);
    }
    else
    {
      long long v47 = 0u;
      long long v48 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v48 + 1)) {
      break;
    }
    swift_bridgeObjectRelease();
    sub_10001F7FC((uint64_t)&v47);
LABEL_25:
    if (++v26 == v24)
    {
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  uint64_t v32 = v50;
  uint64_t v33 = *((void *)v12 + 2);
  if (!v33) {
    goto LABEL_39;
  }
  uint64_t v34 = v49;
  if (*((void *)v12 + 4) == v49 && *((void *)v12 + 5) == v50
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    goto LABEL_36;
  }
  if (v33 == 1) {
    goto LABEL_39;
  }
  if (*((void *)v12 + 6) == v34 && *((void *)v12 + 7) == v32
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
LABEL_36:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v25 = v44;
    uint64_t v24 = v46;
    goto LABEL_25;
  }
  if (v33 == 2)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      a2 = sub_10001F5DC(0, *((void *)a2 + 2) + 1, 1, a2);
    }
    uint64_t v25 = v44;
    uint64_t v24 = v46;
    unint64_t v36 = *((void *)a2 + 2);
    unint64_t v35 = *((void *)a2 + 3);
    if (v36 >= v35 >> 1) {
      a2 = sub_10001F5DC((char *)(v35 > 1), v36 + 1, 1, a2);
    }
    *((void *)a2 + 2) = v36 + 1;
    *(void *)&a2[8 * v36 + 32] = v27;
    goto LABEL_25;
  }
  BOOL v37 = v42;
  uint64_t v38 = 2;
  while (1)
  {
    uint64_t v39 = v38 + 1;
    if (__OFADD__(v38, 1)) {
      break;
    }
    BOOL v40 = *((void *)v37 - 1) == v34 && *(void *)v37 == v32;
    if (v40 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      goto LABEL_36;
    }
    v37 += 16;
    ++v38;
    if (v39 == v33) {
      goto LABEL_39;
    }
  }
LABEL_61:
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void sub_10001EB88()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TTSVBLog.daemon.getter();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Did receive local change for LiveSpeech prefs. ", v6, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_10001EE08();
}

void sub_10001ECD0()
{
}

uint64_t sub_10001ECD8()
{
  uint64_t v1 = type metadata accessor for Notification();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

void sub_10001ED7C()
{
  uint64_t v1 = *(void *)(type metadata accessor for Notification() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_10001D908(v0 + v2, v3);
}

void sub_10001EE08()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v43 - v6;
  uint64_t v8 = type metadata accessor for DispatchPredicate();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (void (**)(uint64_t, uint64_t))((char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  BOOL v12 = *(void **)(v0 + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_queue);
  *uint64_t v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, enum case for DispatchPredicate.onQueue(_:), v8);
  id v13 = v12;
  char v14 = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if (v14)
  {
    uint64_t v46 = v2;
    uint64_t v47 = v1;
    uint64_t v15 = OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_localDefaults;
    uint64_t v48 = v0;
    uint64_t v16 = (void (*)(uint64_t, uint64_t))[*(id *)(v0+ OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_localDefaults) liveSpeechPhrases];
    sub_10000493C(&qword_10002D8C8);
    uint64_t v43 = v16;
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    static TTSVBLog.daemon.getter();
    swift_bridgeObjectRetain();
    uint64_t v45 = (uint64_t)v7;
    unint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.info.getter();
    BOOL v19 = os_log_type_enabled(v17, v18);
    uint64_t v44 = v5;
    if (v19)
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v21 = Array.description.getter();
      uint64_t v22 = v15;
      unint64_t v24 = v23;
      swift_bridgeObjectRelease();
      uint64_t v49 = sub_1000070E8(v21, v24, &v50);
      uint64_t v5 = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      uint64_t v15 = v22;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Pushing local prefs up to cloud. favoritePhrases=%s", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
    uint64_t v26 = v47;
    v25(v45, v47);
    uint64_t v27 = v48;
    uint64_t v45 = OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_cloudDefaults;
    id v28 = *(id *)(v48 + OBJC_IVAR____TtC13voicebankingd24LiveSpeechSyncController_cloudDefaults);
    static TTSVBLiveSpeechSupport.favoritePhrasesKey.getter();
    NSString v29 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    unint64_t v30 = v43;
    [v28 setObject:v43 forKey:v29];

    id v31 = [*(id *)(v27 + v15) liveSpeechCategories];
    sub_10000493C(&qword_10002D8E8);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    static TTSVBLog.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v32 = Logger.logObject.getter();
    uint64_t v33 = v5;
    os_log_type_t v34 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v32, v34))
    {
      unint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v43 = v25;
      uint64_t v50 = v36;
      *(_DWORD *)unint64_t v35 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v37 = Dictionary.description.getter();
      unint64_t v39 = v38;
      swift_bridgeObjectRelease();
      uint64_t v49 = sub_1000070E8(v37, v39, &v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v32, v34, "Pushing local prefs up to cloud. categories=%s", v35, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v27 = v48;
      swift_slowDealloc();

      v43((uint64_t)v44, v47);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v25((uint64_t)v33, v26);
    }
    id v40 = *(id *)(v27 + v45);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    static TTSVBLiveSpeechSupport.favoritePhraseCategoriesKey.getter();
    NSString v42 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v40 setObject:isa forKey:v42];
  }
  else
  {
    __break(1u);
  }
}

BOOL sub_10001F440(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = static TTSVBLiveSpeechSupport.phraseTextKey.getter();
  if (!*(void *)(v2 + 16) || (unint64_t v6 = sub_1000123A8(v4, v5), (v7 & 1) == 0))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1000085F4(*(void *)(v2 + 56) + 32 * v6, (uint64_t)&v18);
  swift_bridgeObjectRelease();
  if (!*((void *)&v19 + 1))
  {
LABEL_7:
    sub_10001F7FC((uint64_t)&v18);
    goto LABEL_8;
  }
  if (!swift_dynamicCast())
  {
LABEL_8:
    uint64_t v9 = 0;
    unint64_t v8 = 0xE000000000000000;
    goto LABEL_9;
  }
  uint64_t v9 = v16;
  unint64_t v8 = v17;
LABEL_9:
  uint64_t v10 = static TTSVBLiveSpeechSupport.phraseTextKey.getter();
  if (*(void *)(v3 + 16) && (unint64_t v12 = sub_1000123A8(v10, v11), (v13 & 1) != 0))
  {
    sub_1000085F4(*(void *)(v3 + 56) + 32 * v12, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v19 + 1)) {
    swift_dynamicCast();
  }
  else {
    sub_10001F7FC((uint64_t)&v18);
  }
  *(void *)&long long v18 = v9;
  *((void *)&v18 + 1) = v8;
  sub_100011330();
  uint64_t v14 = StringProtocol.localizedCaseInsensitiveCompare<A>(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14 == -1;
}

char *sub_10001F5DC(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000493C(&qword_10002D8D0);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      char v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      char v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100020AD8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10001F6EC(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000493C(&qword_10002D3E8);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      char v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      char v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_1000209E4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001F7FC(uint64_t a1)
{
  uint64_t v2 = sub_10000493C(&qword_10002D5A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001F85C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10001F8A0(a1, v4);
}

unint64_t sub_10001F8A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100020C38(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100020BE4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

Swift::Int sub_10001F968(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (void *)sub_1000209D0(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  Swift::Int result = sub_10001F9F8(v5);
  *a1 = v2;
  return result;
}

uint64_t type metadata accessor for LiveSpeechSyncController()
{
  return self;
}

Swift::Int sub_10001F9F8(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_100020258(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  Swift::Int v104 = result;
  Swift::Int v105 = v3;
  v100 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = (char *)&_swiftEmptyArrayStorage;
    id v109 = (uint64_t *)((char *)&_swiftEmptyArrayStorage + 32);
    long long v103 = &_swiftEmptyArrayStorage;
    if (v3 != 1)
    {
      unint64_t v44 = *((void *)&_swiftEmptyArrayStorage + 2);
      goto LABEL_117;
    }
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    sub_10000493C(&qword_10002D8C8);
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v7 + 16) = v6;
    long long v103 = (void *)v7;
    id v109 = (uint64_t *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v101 = *a1 + 16;
  uint64_t v102 = *a1 - 8;
  uint64_t v8 = (char *)&_swiftEmptyArrayStorage;
  Swift::Int v11 = v105;
  uint64_t v114 = v10;
  do
  {
    Swift::Int v12 = v9++;
    Swift::Int v107 = v12;
    if (v9 < v11)
    {
      *(void *)&long long v112 = *(void *)(v10 + 8 * v9);
      uint64_t v110 = *(void *)(v10 + 8 * v12);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      BOOL v13 = sub_10001F440((uint64_t *)&v112, &v110);
      if (v1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_128;
      }
      BOOL v14 = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      Swift::Int v9 = v12 + 2;
      if (v12 + 2 < v11)
      {
        uint64_t v15 = (void *)(v101 + 8 * v12);
        while (1)
        {
          *(void *)&long long v112 = *v15;
          uint64_t v110 = *(v15 - 1);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          BOOL v16 = sub_10001F440((uint64_t *)&v112, &v110);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v14 ^ v16)) {
            break;
          }
          ++v9;
          ++v15;
          if (v11 == v9)
          {
            Swift::Int v9 = v11;
            break;
          }
        }
        Swift::Int v12 = v107;
      }
      uint64_t v10 = v114;
      if (v14)
      {
        if (v9 < v12) {
          goto LABEL_155;
        }
        if (v12 < v9)
        {
          unint64_t v17 = (uint64_t *)(v102 + 8 * v9);
          Swift::Int v18 = v9;
          Swift::Int v19 = v12;
          uint64_t v20 = (uint64_t *)(v114 + 8 * v12);
          do
          {
            if (v19 != --v18)
            {
              if (!v10) {
                goto LABEL_158;
              }
              uint64_t v21 = *v20;
              *uint64_t v20 = *v17;
              uint64_t *v17 = v21;
            }
            ++v19;
            --v17;
            ++v20;
          }
          while (v19 < v18);
        }
      }
    }
    if (v9 >= v11) {
      goto LABEL_66;
    }
    if (__OFSUB__(v9, v12)) {
      goto LABEL_151;
    }
    if (v9 - v12 >= v104) {
      goto LABEL_66;
    }
    if (__OFADD__(v12, v104)) {
      goto LABEL_153;
    }
    if (v12 + v104 >= v11) {
      Swift::Int v22 = v11;
    }
    else {
      Swift::Int v22 = v12 + v104;
    }
    if (v22 < v12)
    {
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    if (v9 == v22) {
      goto LABEL_66;
    }
    uint64_t v99 = v8;
    unint64_t v23 = (void *)(v102 + 8 * v9);
    Swift::Int v106 = v22;
    while (2)
    {
      uint64_t v24 = *(void *)(v10 + 8 * v9);
      Swift::Int v25 = v12;
      uint64_t v108 = v23;
      uint64_t v26 = v23;
      while (1)
      {
        uint64_t v27 = *v26;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v28 = static TTSVBLiveSpeechSupport.phraseTextKey.getter();
        if (*(void *)(v24 + 16) && (unint64_t v30 = sub_1000123A8(v28, v29), (v31 & 1) != 0))
        {
          sub_1000085F4(*(void *)(v24 + 56) + 32 * v30, (uint64_t)&v112);
        }
        else
        {
          long long v112 = 0u;
          long long v113 = 0u;
        }
        swift_bridgeObjectRelease();
        if (!*((void *)&v113 + 1))
        {
          sub_10001F7FC((uint64_t)&v112);
LABEL_51:
          uint64_t v33 = 0;
          unint64_t v32 = 0xE000000000000000;
          goto LABEL_52;
        }
        if ((swift_dynamicCast() & 1) == 0) {
          goto LABEL_51;
        }
        uint64_t v33 = v110;
        unint64_t v32 = v111;
LABEL_52:
        uint64_t v34 = static TTSVBLiveSpeechSupport.phraseTextKey.getter();
        if (*(void *)(v27 + 16) && (unint64_t v36 = sub_1000123A8(v34, v35), (v37 & 1) != 0))
        {
          sub_1000085F4(*(void *)(v27 + 56) + 32 * v36, (uint64_t)&v112);
        }
        else
        {
          long long v112 = 0u;
          long long v113 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v113 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v38 = v110;
            unint64_t v39 = v111;
            goto LABEL_61;
          }
        }
        else
        {
          sub_10001F7FC((uint64_t)&v112);
        }
        uint64_t v38 = 0;
        unint64_t v39 = 0xE000000000000000;
LABEL_61:
        *(void *)&long long v112 = v33;
        *((void *)&v112 + 1) = v32;
        uint64_t v110 = v38;
        unint64_t v111 = v39;
        sub_100011330();
        uint64_t v40 = StringProtocol.localizedCaseInsensitiveCompare<A>(_:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v40 != -1) {
          break;
        }
        uint64_t v10 = v114;
        if (!v114) {
          goto LABEL_156;
        }
        uint64_t v41 = *v26;
        uint64_t v24 = v26[1];
        uint64_t *v26 = v24;
        v26[1] = v41;
        --v26;
        if (v9 == ++v25) {
          goto LABEL_41;
        }
      }
      uint64_t v10 = v114;
LABEL_41:
      ++v9;
      Swift::Int v12 = v107;
      unint64_t v23 = v108 + 1;
      if (v9 != v106) {
        continue;
      }
      break;
    }
    Swift::Int v9 = v106;
    uint64_t v8 = v99;
LABEL_66:
    if (v9 < v12) {
      goto LABEL_147;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v8 = sub_100020678(0, *((void *)v8 + 2) + 1, 1, v8);
    }
    unint64_t v43 = *((void *)v8 + 2);
    unint64_t v42 = *((void *)v8 + 3);
    unint64_t v44 = v43 + 1;
    uint64_t v10 = v114;
    if (v43 >= v42 >> 1)
    {
      uint64_t v92 = sub_100020678((char *)(v42 > 1), v43 + 1, 1, v8);
      uint64_t v10 = v114;
      uint64_t v8 = v92;
    }
    *((void *)v8 + 2) = v44;
    uint64_t v45 = v8 + 32;
    uint64_t v46 = &v8[16 * v43 + 32];
    *(void *)uint64_t v46 = v107;
    *((void *)v46 + 1) = v9;
    if (v43)
    {
      while (2)
      {
        unint64_t v47 = v44 - 1;
        if (v44 >= 4)
        {
          os_log_type_t v52 = &v45[16 * v44];
          uint64_t v53 = *((void *)v52 - 8);
          uint64_t v54 = *((void *)v52 - 7);
          BOOL v58 = __OFSUB__(v54, v53);
          uint64_t v55 = v54 - v53;
          if (v58) {
            goto LABEL_135;
          }
          uint64_t v57 = *((void *)v52 - 6);
          uint64_t v56 = *((void *)v52 - 5);
          BOOL v58 = __OFSUB__(v56, v57);
          uint64_t v50 = v56 - v57;
          char v51 = v58;
          if (v58) {
            goto LABEL_136;
          }
          unint64_t v59 = v44 - 2;
          id v60 = &v45[16 * v44 - 32];
          uint64_t v62 = *(void *)v60;
          uint64_t v61 = *((void *)v60 + 1);
          BOOL v58 = __OFSUB__(v61, v62);
          uint64_t v63 = v61 - v62;
          if (v58) {
            goto LABEL_138;
          }
          BOOL v58 = __OFADD__(v50, v63);
          uint64_t v64 = v50 + v63;
          if (v58) {
            goto LABEL_141;
          }
          if (v64 >= v55)
          {
            uint64_t v82 = &v45[16 * v47];
            uint64_t v84 = *(void *)v82;
            uint64_t v83 = *((void *)v82 + 1);
            BOOL v58 = __OFSUB__(v83, v84);
            uint64_t v85 = v83 - v84;
            if (v58) {
              goto LABEL_145;
            }
            BOOL v75 = v50 < v85;
          }
          else
          {
LABEL_85:
            if (v51) {
              goto LABEL_137;
            }
            unint64_t v59 = v44 - 2;
            id v65 = &v45[16 * v44 - 32];
            uint64_t v67 = *(void *)v65;
            uint64_t v66 = *((void *)v65 + 1);
            BOOL v68 = __OFSUB__(v66, v67);
            uint64_t v69 = v66 - v67;
            char v70 = v68;
            if (v68) {
              goto LABEL_140;
            }
            os_log_type_t v71 = &v45[16 * v47];
            uint64_t v73 = *(void *)v71;
            uint64_t v72 = *((void *)v71 + 1);
            BOOL v58 = __OFSUB__(v72, v73);
            uint64_t v74 = v72 - v73;
            if (v58) {
              goto LABEL_143;
            }
            if (__OFADD__(v69, v74)) {
              goto LABEL_144;
            }
            if (v69 + v74 < v50) {
              goto LABEL_97;
            }
            BOOL v75 = v50 < v74;
          }
          if (v75) {
            unint64_t v47 = v59;
          }
        }
        else
        {
          if (v44 == 3)
          {
            uint64_t v49 = *((void *)v8 + 4);
            uint64_t v48 = *((void *)v8 + 5);
            BOOL v58 = __OFSUB__(v48, v49);
            uint64_t v50 = v48 - v49;
            char v51 = v58;
            goto LABEL_85;
          }
          uint64_t v76 = *((void *)v8 + 4);
          uint64_t v77 = *((void *)v8 + 5);
          BOOL v58 = __OFSUB__(v77, v76);
          uint64_t v69 = v77 - v76;
          char v70 = v58;
LABEL_97:
          if (v70) {
            goto LABEL_139;
          }
          uint64_t v78 = &v45[16 * v47];
          uint64_t v80 = *(void *)v78;
          uint64_t v79 = *((void *)v78 + 1);
          BOOL v58 = __OFSUB__(v79, v80);
          uint64_t v81 = v79 - v80;
          if (v58) {
            goto LABEL_142;
          }
          if (v81 < v69) {
            goto LABEL_114;
          }
        }
        unint64_t v86 = v47 - 1;
        if (v47 - 1 >= v44)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v87 = &v45[16 * v86];
        uint64_t v88 = *(void *)v87;
        os_log_t v89 = &v45[16 * v47];
        uint64_t v90 = *((void *)v89 + 1);
        sub_100020348((uint64_t *)(v10 + 8 * *(void *)v87), (uint64_t *)(v10 + 8 * *(void *)v89), v10 + 8 * v90, v109);
        if (v1) {
          goto LABEL_128;
        }
        if (v90 < v88) {
          goto LABEL_132;
        }
        if (v47 > *((void *)v8 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v87 = v88;
        *(void *)&v45[16 * v86 + 8] = v90;
        unint64_t v91 = *((void *)v8 + 2);
        if (v47 >= v91) {
          goto LABEL_134;
        }
        unint64_t v44 = v91 - 1;
        memmove(&v45[16 * v47], v89 + 16, 16 * (v91 - 1 - v47));
        *((void *)v8 + 2) = v91 - 1;
        uint64_t v10 = v114;
        if (v91 <= 2) {
          goto LABEL_114;
        }
        continue;
      }
    }
    unint64_t v44 = 1;
LABEL_114:
    Swift::Int v11 = v105;
  }
  while (v9 < v105);
LABEL_117:
  if (v44 >= 2)
  {
    uint64_t v93 = *v100;
    do
    {
      unint64_t v94 = v44 - 2;
      if (v44 < 2) {
        goto LABEL_146;
      }
      if (!v93) {
        goto LABEL_159;
      }
      uint64_t v95 = *(void *)&v8[16 * v94 + 32];
      uint64_t v96 = *(void *)&v8[16 * v44 + 24];
      sub_100020348((uint64_t *)(v93 + 8 * v95), (uint64_t *)(v93 + 8 * *(void *)&v8[16 * v44 + 16]), v93 + 8 * v96, v109);
      if (v1) {
        break;
      }
      if (v96 < v95) {
        goto LABEL_148;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_100020830((uint64_t)v8);
      }
      if (v94 >= *((void *)v8 + 2)) {
        goto LABEL_149;
      }
      uint64_t v97 = &v8[16 * v94 + 32];
      *(void *)uint64_t v97 = v95;
      *((void *)v97 + 1) = v96;
      unint64_t v98 = *((void *)v8 + 2);
      if (v44 > v98) {
        goto LABEL_150;
      }
      memmove(&v8[16 * v44 + 16], &v8[16 * v44 + 32], 16 * (v98 - v44));
      *((void *)v8 + 2) = v98 - 1;
      unint64_t v44 = v98 - 1;
    }
    while (v98 > 2);
  }
LABEL_128:
  swift_bridgeObjectRelease();
  v103[2] = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_100020258(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v5 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 8 * a3 - 8;
    uint64_t v13 = result;
LABEL_4:
    uint64_t v9 = *(void *)(v7 + 8 * v5);
    uint64_t v10 = (uint64_t *)v8;
    while (1)
    {
      uint64_t v16 = v9;
      uint64_t v15 = *v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      BOOL v11 = sub_10001F440(&v16, &v15);
      swift_bridgeObjectRelease();
      Swift::Int result = swift_bridgeObjectRelease();
      if (v4) {
        break;
      }
      if (v11)
      {
        if (!v7)
        {
          __break(1u);
          return result;
        }
        uint64_t v12 = *v10;
        uint64_t v9 = v10[1];
        uint64_t *v10 = v9;
        v10[1] = v12;
        --v10;
        if (v5 != ++v6) {
          continue;
        }
      }
      ++v5;
      v8 += 8;
      uint64_t v6 = v13;
      if (v5 != a2) {
        goto LABEL_4;
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_100020348(uint64_t *__src, uint64_t *a2, unint64_t a3, uint64_t *__dst)
{
  unint64_t v30 = __dst;
  uint64_t v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = (char *)a2 - (char *)__src;
  int64_t v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v8 = (char *)a2 - (char *)__src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 3;
  unint64_t v36 = __src;
  uint64_t v35 = __dst;
  if (v9 >= v11 >> 3)
  {
    if (v10 >= -7)
    {
      if (__dst != a2 || &a2[v12] <= __dst)
      {
        memmove(__dst, a2, 8 * v12);
        __dst = v30;
      }
      Swift::Int v18 = &__dst[v12];
      uint64_t v34 = v18;
      unint64_t v36 = v5;
      if (v6 >= v5 || v10 < 8) {
        goto LABEL_47;
      }
      Swift::Int v19 = (uint64_t *)(a3 - 8);
      uint64_t v20 = v5;
      uint64_t v29 = v6;
      while (1)
      {
        uint64_t v21 = v18;
        uint64_t v22 = *--v18;
        uint64_t v33 = v22;
        uint64_t v23 = *--v20;
        uint64_t v32 = v23;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        BOOL v24 = sub_10001F440(&v33, &v32);
        if (v31) {
          goto LABEL_46;
        }
        BOOL v25 = v24;
        uint64_t v26 = v19 + 1;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v25)
        {
          uint64_t v27 = v30;
          if (v26 != v5 || v19 >= v5) {
            uint64_t *v19 = *v20;
          }
          unint64_t v36 = v20;
          Swift::Int v18 = v21;
        }
        else
        {
          uint64_t v34 = v18;
          uint64_t v27 = v30;
          if (v26 < v21 || v19 >= v21 || v26 != v21) {
            uint64_t *v19 = *v18;
          }
          uint64_t v20 = v5;
        }
        if (v20 > v29)
        {
          --v19;
          uint64_t v5 = v20;
          if (v18 > v27) {
            continue;
          }
        }
        goto LABEL_47;
      }
    }
  }
  else if (v7 >= -7)
  {
    if (__dst != __src || &__src[v9] <= __dst)
    {
      memmove(__dst, __src, 8 * v9);
      __dst = v30;
    }
    uint64_t v13 = &__dst[v9];
    uint64_t v34 = v13;
    if ((unint64_t)v5 >= a3 || v7 < 8) {
      goto LABEL_47;
    }
    while (1)
    {
      uint64_t v33 = *v5;
      BOOL v14 = __dst;
      uint64_t v32 = *__dst;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      BOOL v15 = sub_10001F440(&v33, &v32);
      if (v31) {
        break;
      }
      BOOL v16 = v15;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v16)
      {
        unint64_t v17 = v5 + 1;
        if (v6 < v5 || v6 >= v17 || v6 != v5) {
          *uint64_t v6 = *v5;
        }
        __dst = v14;
      }
      else
      {
        if (v6 != v14) {
          *uint64_t v6 = *v14;
        }
        __dst = v14 + 1;
        uint64_t v35 = v14 + 1;
        unint64_t v17 = v5;
      }
      unint64_t v36 = ++v6;
      if (__dst < v13)
      {
        uint64_t v5 = v17;
        if ((unint64_t)v17 < a3) {
          continue;
        }
      }
      goto LABEL_47;
    }
LABEL_46:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_47:
    sub_100020774((void **)&v36, (const void **)&v35, &v34);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_100020678(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000493C(&qword_10002D8D8);
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
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100020774(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_100020830(uint64_t a1)
{
  return sub_100020678(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100020844(char a1, int64_t a2, char a3, void *a4)
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
    sub_10000493C(&qword_10002D8D0);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
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
    sub_10000493C(&qword_10002D8C8);
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

uint64_t sub_1000209D0(void *a1)
{
  return sub_100020844(0, a1[2], 0, a1);
}

uint64_t sub_1000209E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_100020AD8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_10000493C(&qword_10002D8C8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100020BE4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100020C38(uint64_t a1, uint64_t a2)
{
  return a2;
}

const char *sub_100020C94()
{
  return "liveSpeechPhrases";
}

uint64_t sub_100020CA0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100020CD8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_10001D228((uint64_t)&unk_10002A398, (uint64_t)sub_10001ECD0, (uint64_t)&unk_10002A3B0);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  int64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v18 - v8;
  static TTSVBLog.daemon.getter();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "**** voicebankingd starting up", v12, 2u);
    swift_slowDealloc();
  }

  unint64_t v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v9, v3);
  type metadata accessor for VoiceBankingDaemon();
  qword_10002DD08 = (uint64_t)VoiceBankingXPCServer.__allocating_init()();
  VoiceBankingDaemon.run()();
  static TTSVBLog.daemon.getter();
  unint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    BOOL v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "**** voicebankingd shutting down", v16, 2u);
    swift_slowDealloc();
  }

  v13(v7, v3);
  return 0;
}

NSURLRequest __swiftcall URLRequest._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)URLRequest._bridgeToObjectiveC()();
  result._internal = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t URLRequest.init(url:cachePolicy:timeoutInterval:)()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t TTSVBVoiceBankingManager.fetchInstalledVoiceModels(completion:)()
{
  return TTSVBVoiceBankingManager.fetchInstalledVoiceModels(completion:)();
}

uint64_t TTSVBVoiceBankingManager.createVoice(named:localeID:completion:)()
{
  return TTSVBVoiceBankingManager.createVoice(named:localeID:completion:)();
}

uint64_t TTSVBVoiceBankingManager.performVoiceDatastoreMigrationV1IfNeeded(completion:)()
{
  return TTSVBVoiceBankingManager.performVoiceDatastoreMigrationV1IfNeeded(completion:)();
}

uint64_t TTSVBVoiceBankingManager.loadStores(_:)()
{
  return TTSVBVoiceBankingManager.loadStores(_:)();
}

uint64_t TTSVBVoiceBankingManager.importModel(fromDirectory:overrideLocaleID:addingToVoice:completion:)()
{
  return TTSVBVoiceBankingManager.importModel(fromDirectory:overrideLocaleID:addingToVoice:completion:)();
}

uint64_t TTSVBVoiceBankingManager.refreshModels(completion:)()
{
  return TTSVBVoiceBankingManager.refreshModels(completion:)();
}

uint64_t TTSVBVoiceBankingManager.xpcServiceConfig.getter()
{
  return TTSVBVoiceBankingManager.xpcServiceConfig.getter();
}

uint64_t TTSVBVoiceBankingManager.cancelTrainingTask(taskID:completion:)()
{
  return TTSVBVoiceBankingManager.cancelTrainingTask(taskID:completion:)();
}

uint64_t TTSVBVoiceBankingManager.importTrainingData(fromDirectory:creatingVoiceName:localeID:completion:)()
{
  return TTSVBVoiceBankingManager.importTrainingData(fromDirectory:creatingVoiceName:localeID:completion:)();
}

uint64_t TTSVBVoiceBankingManager.dataStoreEventPublisher.getter()
{
  return TTSVBVoiceBankingManager.dataStoreEventPublisher.getter();
}

uint64_t TTSVBVoiceBankingManager.importCloudVoicesIntoLocalDatastore(completion:)()
{
  return TTSVBVoiceBankingManager.importCloudVoicesIntoLocalDatastore(completion:)();
}

uint64_t TTSVBVoiceBankingManager.repairDatastoreVoicesFromFilesystem(completion:)()
{
  return TTSVBVoiceBankingManager.repairDatastoreVoicesFromFilesystem(completion:)();
}

uint64_t TTSVBVoiceBankingManager.synchronizeFileBackedFuturesForAllModels(completion:)()
{
  return TTSVBVoiceBankingManager.synchronizeFileBackedFuturesForAllModels(completion:)();
}

uint64_t TTSVBVoiceBankingManager.train(voiceID:mode:startImmediately:validateTrainingSamples:overrideMinimumPhraseCount:completion:)()
{
  return TTSVBVoiceBankingManager.train(voiceID:mode:startImmediately:validateTrainingSamples:overrideMinimumPhraseCount:completion:)();
}

uint64_t type metadata accessor for TTSVBInstalledVoiceModel()
{
  return type metadata accessor for TTSVBInstalledVoiceModel();
}

uint64_t static TTSVBLiveSpeechSupport.phraseTextKey.getter()
{
  return static TTSVBLiveSpeechSupport.phraseTextKey.getter();
}

uint64_t static TTSVBLiveSpeechSupport.cloudPrefsDomain.getter()
{
  return static TTSVBLiveSpeechSupport.cloudPrefsDomain.getter();
}

uint64_t static TTSVBLiveSpeechSupport.localPrefsDomain.getter()
{
  return static TTSVBLiveSpeechSupport.localPrefsDomain.getter();
}

uint64_t static TTSVBLiveSpeechSupport.favoritePhrasesKey.getter()
{
  return static TTSVBLiveSpeechSupport.favoritePhrasesKey.getter();
}

uint64_t static TTSVBLiveSpeechSupport.favoritePhraseCategoriesKey.getter()
{
  return static TTSVBLiveSpeechSupport.favoritePhraseCategoriesKey.getter();
}

uint64_t TTSVBError.description.getter()
{
  return TTSVBError.description.getter();
}

uint64_t TTSVBError.boxed.getter()
{
  return TTSVBError.boxed.getter();
}

uint64_t type metadata accessor for TTSVBError()
{
  return type metadata accessor for TTSVBError();
}

uint64_t TTSVBError.init(_:_:_:)()
{
  return TTSVBError.init(_:_:_:)();
}

uint64_t type metadata accessor for TTSVBVoice()
{
  return type metadata accessor for TTSVBVoice();
}

uint64_t static TTSVBService.serviceName.getter()
{
  return static TTSVBService.serviceName.getter();
}

uint64_t static TTSVBService.configuredClientInterface()()
{
  return static TTSVBService.configuredClientInterface()();
}

uint64_t static TTSVBService.configuredServiceInterface()()
{
  return static TTSVBService.configuredServiceInterface()();
}

uint64_t type metadata accessor for TTSVBService()
{
  return type metadata accessor for TTSVBService();
}

uint64_t static TTSVBAnalytics.trainingEventOccurred(eventName:)()
{
  return static TTSVBAnalytics.trainingEventOccurred(eventName:)();
}

uint64_t TTSVBDataStore.XPCServiceConfig.model.getter()
{
  return TTSVBDataStore.XPCServiceConfig.model.getter();
}

uint64_t TTSVBDataStore.XPCServiceConfig.options.getter()
{
  return TTSVBDataStore.XPCServiceConfig.options.getter();
}

uint64_t TTSVBDataStore.XPCServiceConfig.storeURL.getter()
{
  return TTSVBDataStore.XPCServiceConfig.storeURL.getter();
}

uint64_t type metadata accessor for TTSVBDataStore.XPCServiceConfig()
{
  return type metadata accessor for TTSVBDataStore.XPCServiceConfig();
}

uint64_t type metadata accessor for TTSVBVoiceModel()
{
  return type metadata accessor for TTSVBVoiceModel();
}

uint64_t type metadata accessor for TTSVBVoiceSample()
{
  return type metadata accessor for TTSVBVoiceSample();
}

uint64_t dispatch thunk of TTSVBAccessManager.tccCloudKitAccess.getter()
{
  return dispatch thunk of TTSVBAccessManager.tccCloudKitAccess.getter();
}

uint64_t dispatch thunk of TTSVBAccessManager.updateTCCCloudKitAccess(_:userInitiated:)()
{
  return dispatch thunk of TTSVBAccessManager.updateTCCCloudKitAccess(_:userInitiated:)();
}

uint64_t dispatch thunk of TTSVBAccessManager.startMonitoringForAccountChanges(_:)()
{
  return dispatch thunk of TTSVBAccessManager.startMonitoringForAccountChanges(_:)();
}

uint64_t dispatch thunk of TTSVBAccessManager.applyCloudKitAccessForCurrentConditions()()
{
  return dispatch thunk of TTSVBAccessManager.applyCloudKitAccessForCurrentConditions()();
}

uint64_t TTSVBDataStoreEvent.CloudKitSyncEvent.isFinished.getter()
{
  return TTSVBDataStoreEvent.CloudKitSyncEvent.isFinished.getter();
}

uint64_t TTSVBDataStoreEvent.CloudKitSyncEvent.event.getter()
{
  return TTSVBDataStoreEvent.CloudKitSyncEvent.event.getter();
}

uint64_t type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent()
{
  return type metadata accessor for TTSVBDataStoreEvent.CloudKitSyncEvent();
}

uint64_t type metadata accessor for TTSVBDataStoreEvent()
{
  return type metadata accessor for TTSVBDataStoreEvent();
}

uint64_t TTSVBTCCCloudKitAccess.rawValue.getter()
{
  return TTSVBTCCCloudKitAccess.rawValue.getter();
}

uint64_t TTSVBVoiceModelStateTransition.description.getter()
{
  return TTSVBVoiceModelStateTransition.description.getter();
}

uint64_t type metadata accessor for TTSVBVoiceModelStateTransition()
{
  return type metadata accessor for TTSVBVoiceModelStateTransition();
}

uint64_t static TTSVBLog.daemon.getter()
{
  return static TTSVBLog.daemon.getter();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> TTSVBPath.markAsExcludedFromBackup()()
{
}

uint64_t static TTSVBPath.requireGroupContainerURL()()
{
  return static TTSVBPath.requireGroupContainerURL()();
}

uint64_t type metadata accessor for TTSVBPath()
{
  return type metadata accessor for TTSVBPath();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.userInteractive.getter()
{
  return static DispatchQoS.userInteractive.getter();
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

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

{
  return + infix(_:_:)();
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

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
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

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t Array<A>.toData()()
{
  return Array<A>.toData()();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
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

uint64_t static NSUserDefaults.voicebankingShared.getter()
{
  return static NSUserDefaults.voicebankingShared.getter();
}

uint64_t static NSUserDefaults.voicebankingSandboxedShared.getter()
{
  return static NSUserDefaults.voicebankingSandboxedShared.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
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

uint64_t static NSNotificationName.ttsvbDidDeleteVoice.getter()
{
  return static NSNotificationName.ttsvbDidDeleteVoice.getter();
}

uint64_t static NSNotificationName.ttsvbDidImportVoiceModel.getter()
{
  return static NSNotificationName.ttsvbDidImportVoiceModel.getter();
}

uint64_t static NSNotificationName.ttsvbDidPotentiallyDownloadVoiceModel.getter()
{
  return static NSNotificationName.ttsvbDidPotentiallyDownloadVoiceModel.getter();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.localizedCaseInsensitiveCompare<A>(_:)()
{
  return StringProtocol.localizedCaseInsensitiveCompare<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
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

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AXDeviceGetType()
{
  return _AXDeviceGetType();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return _SecTaskCreateFromSelf(allocator);
}

uint64_t TTSVBHasDeviceBeenUnlockedSinceBoot()
{
  return _TTSVBHasDeviceBeenUnlockedSinceBoot();
}

uint64_t TTSVBIsInternalUIBuild()
{
  return _TTSVBIsInternalUIBuild();
}

uint64_t TTSVBRegisterForFirstUnlockSinceBoot()
{
  return _TTSVBRegisterForFirstUnlockSinceBoot();
}

uint64_t TTSVBSiriTTSTrainerTaskModeForString()
{
  return _TTSVBSiriTTSTrainerTaskModeForString();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uid_t getuid(void)
{
  return _getuid();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}