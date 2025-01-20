uint64_t sub_55D8()
{
  id v0;
  NSString v1;
  NSString v2;
  id v3;
  uint64_t v4;

  v0 = (id)*sub_D9D8();
  v1 = sub_DC10();
  v2 = sub_DC10();
  v3 = [v0 localizedStringForKey:v1 value:0 table:v2];

  v4 = sub_DC20();
  return v4;
}

void sub_5698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    swift_retain();
    NSString v7 = sub_DC10();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a3;
    *(void *)(v8 + 24) = a4;
    aBlock[4] = sub_5CA4;
    aBlock[5] = v8;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_5CAC;
    aBlock[3] = &unk_10768;
    v9 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    v10.receiver = v4;
    v10.super_class = (Class)type metadata accessor for DemoDataSource();
    objc_msgSendSuper2(&v10, "getElementsInSection:withHandler:", v7, v9);
    _Block_release(v9);

    sub_5D70(a3);
  }
}

uint64_t sub_57C0(unint64_t a1, uint64_t (*a2)(void *))
{
  sub_5FF0(&qword_14BF0);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_DB00();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  objc_super v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v32 - v11;
  if (!a1) {
    return a2(&_swiftEmptyArrayStorage);
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_DDF0();
    if (result) {
      goto LABEL_4;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return a2(&_swiftEmptyArrayStorage);
  }
  uint64_t v13 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  uint64_t result = swift_bridgeObjectRetain();
  if (!v13) {
    goto LABEL_15;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v15 = (id)sub_DDC0();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return result;
    }
    id v15 = *(id *)(a1 + 32);
  }
  v16 = v15;
  swift_bridgeObjectRelease();
  NSString v17 = sub_DC10();
  id v18 = (id)REDemoDateForIdentifier();

  if (v18)
  {
    sub_DAE0();

    v19 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v19(v5, v10, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      v19(v12, v5, v6);
      Class isa = sub_DAD0().super.isa;
      id v21 = (id)REAbsoluteRelevanceProviderForDate();

      if (v21)
      {
        id v37 = [v16 content];
        id v33 = [v16 action];
        uint64_t v36 = sub_5FF0((uint64_t *)&unk_14D00);
        uint64_t v22 = swift_allocObject();
        long long v34 = xmmword_E9F0;
        *(_OWORD *)(v22 + 16) = xmmword_E9F0;
        *(void *)(v22 + 32) = v21;
        uint64_t v38 = v22;
        sub_DCB0();
        id v23 = objc_allocWithZone((Class)REElement);
        id v35 = v21;
        NSString v24 = sub_DC10();
        sub_6094(0, &qword_14D20);
        Class v25 = sub_DC90().super.isa;
        swift_bridgeObjectRelease();
        v26 = v37;
        id v32 = v16;
        v27 = v33;
        id v28 = [v23 initWithIdentifier:v24 content:v37 action:v33 relevanceProviders:v25];

        uint64_t v29 = swift_allocObject();
        *(_OWORD *)(v29 + 16) = v34;
        *(void *)(v29 + 32) = v28;
        uint64_t v38 = v29;
        sub_DCB0();
        uint64_t v30 = v38;
        id v31 = v28;
        a2((void *)v30);

        swift_bridgeObjectRelease();
        return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      }
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);

      return a2(&_swiftEmptyArrayStorage);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }

  sub_6034((uint64_t)v5);
  return a2(&_swiftEmptyArrayStorage);
}

uint64_t sub_5C6C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_5CA4(unint64_t a1)
{
  return sub_57C0(a1, *(uint64_t (**)(void *))(v1 + 16));
}

uint64_t sub_5CAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    sub_6094(0, &qword_14BE8);
    uint64_t v2 = sub_DCA0();
  }
  swift_retain();
  v3(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_5D34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_5D44()
{
  return swift_release();
}

uint64_t type metadata accessor for DemoDataSource()
{
  return self;
}

uint64_t sub_5D70(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_5E4C(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    sub_6094(0, &qword_14BE8);
    v3.super.Class isa = sub_DC90().super.isa;
  }
  else
  {
    v3.super.Class isa = 0;
  }
  Class isa = v3.super.isa;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

id sub_5ED4()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_5F08()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DemoDataSource();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_5F7C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DemoDataSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_5FB0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_5FE8(uint64_t a1)
{
  sub_5E4C(a1, *(void *)(v1 + 16));
}

uint64_t sub_5FF0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6034(uint64_t a1)
{
  uint64_t v2 = sub_5FF0(&qword_14BF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_6094(uint64_t a1, unint64_t *a2)
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

id sub_60D0()
{
  uint64_t v0 = self;
  NSString v1 = sub_DC10();
  id v2 = [v0 _symbolImageProviderWithSystemName:v1];

  sub_62B8();
  Class isa = sub_DD50(35.0).super.super.isa;
  [v2 setOverridePointSize:isa];

  uint64_t v4 = self;
  id v5 = v2;
  id v6 = objc_msgSend(v4, "fiui_meditationTeal");
  [v5 setTintColor:v6];

  sub_55D8();
  NSString v7 = sub_DC10();
  swift_bridgeObjectRelease();
  id v8 = [self textProviderWithText:v7];

  id v9 = [objc_allocWithZone((Class)REContent) init];
  [v9 setObject:REElementInteractionTap forKey:REContentInteractionKey];
  [v9 setBodyImageProvider:v5];
  [v9 setStyle:3];
  [v9 setDescription1TextProvider:v8];

  return v9;
}

unint64_t sub_62B8()
{
  unint64_t result = qword_14BF8;
  if (!qword_14BF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_14BF8);
  }
  return result;
}

id sub_62F8()
{
  return *(id *)(v0 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_healthStore);
}

id sub_6308()
{
  return *(id *)(v0 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_queue);
}

uint64_t sub_6318()
{
  return 0xFFFFFFFFLL;
}

uint64_t sub_6320()
{
  NSString v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_notifyToken);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_6368(int a1)
{
  NSArray v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_notifyToken);
  uint64_t result = swift_beginAccess();
  *NSArray v3 = a1;
  return result;
}

uint64_t (*sub_63B4())()
{
  return j__swift_endAccess;
}

uint64_t sub_6414()
{
  return 0;
}

void *sub_641C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_query);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_646C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_query);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_64C0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_651C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_queryRetries;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_6564(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_queryRetries);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_65B0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_660C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_DB00();
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t sub_6678@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_mostRecentSessionEndDate;
  swift_beginAccess();
  return sub_66CC(v3, a1);
}

uint64_t sub_66CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5FF0(&qword_14BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_6734(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_mostRecentSessionEndDate;
  swift_beginAccess();
  sub_6790(a1, v3);
  return swift_endAccess();
}

uint64_t sub_6790(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5FF0(&qword_14BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_67F8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_68B4()
{
  uint64_t v0 = *(void *)sub_D27C();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_6970()
{
  sub_5FF0(&qword_14C30);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_EA30;
  *(void *)(v0 + 32) = sub_DC20();
  *(void *)(v0 + 40) = v1;
  return v0;
}

uint64_t sub_69CC()
{
  return 1;
}

char *sub_69DC()
{
  uint64_t v1 = sub_DB70();
  uint64_t v43 = *(void *)(v1 - 8);
  uint64_t v44 = v1;
  uint64_t v2 = __chkstk_darwin(v1);
  v41 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v40 = (char *)&v40 - v4;
  uint64_t v42 = sub_DD10();
  uint64_t v5 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  NSString v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_DCF0();
  __chkstk_darwin(v8);
  uint64_t v9 = sub_DBB0();
  __chkstk_darwin(v9 - 8);
  *(_DWORD *)&v0[OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_notifyToken] = -1;
  *(void *)&v0[OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_query] = 0;
  *(void *)&v0[OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_queryRetries] = 0;
  objc_super v10 = &v0[OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_mostRecentSessionEndDate];
  uint64_t v11 = sub_DB00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = self;
  uint64_t v13 = v0;
  uint64_t result = (char *)objc_msgSend(v12, "fiui_sharedHealthStoreForCarousel");
  if (result)
  {
    *(void *)&v13[OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_healthStore] = result;
    sub_6094(0, &qword_14C38);
    sub_DBA0();
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_C5B0(&qword_14C40, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
    sub_5FF0(&qword_14C48);
    sub_BF50(&qword_14C50, &qword_14C48);
    sub_DDA0();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v42);
    *(void *)&v13[OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_queue] = sub_DD40();

    id v15 = (objc_class *)type metadata accessor for DataSource();
    v47.receiver = v13;
    v47.super_class = v15;
    id v16 = objc_msgSendSuper2(&v47, "init");
    NSString v17 = (const char *)kNLMindPreferencesChangedNotification;
    id v18 = (char *)v16;
    v19 = sub_DD20();
    uint64_t v20 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = (uint64_t)sub_7478;
    aBlock[5] = v20;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_74C4;
    aBlock[3] = (uint64_t)&unk_107E0;
    id v21 = _Block_copy(aBlock);
    swift_release();
    uint64_t v22 = (int *)&v18[OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_notifyToken];
    swift_beginAccess();
    uint32_t v23 = notify_register_dispatch(v17, v22, v19, v21);
    swift_endAccess();
    _Block_release(v21);

    if (v23 || *v22 == -1)
    {
      uint64_t v24 = Log.datasource.unsafeMutableAddressor();
      uint64_t v26 = v43;
      uint64_t v25 = v44;
      v27 = v41;
      (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v41, v24, v44);
      id v28 = sub_DB50();
      os_log_type_t v29 = sub_DCD0();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v30 = 67109120;
        LODWORD(aBlock[0]) = v23;
        sub_DD70();
        _os_log_impl(&dword_0, v28, v29, "Error registering for data protection notifications, result: %u", v30, 8u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v25);
      return v18;
    }
    uint64_t v31 = Log.datasource.unsafeMutableAddressor();
    uint64_t v33 = v43;
    uint64_t v32 = v44;
    long long v34 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v40, v31, v44);
    id v35 = sub_DB50();
    os_log_type_t v36 = sub_DCE0();
    if (!os_log_type_enabled(v35, v36))
    {
LABEL_10:

      (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v32);
      return v18;
    }
    id v37 = (uint8_t *)swift_slowAlloc();
    uint64_t result = (char *)swift_slowAlloc();
    aBlock[0] = (uint64_t)result;
    *(_DWORD *)id v37 = 136315138;
    if (v17)
    {
      uint64_t v38 = sub_DC50();
      uint64_t v45 = sub_B89C(v38, v39, aBlock);
      sub_DD70();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v35, v36, "Registered for data protection notifications for name: %s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      goto LABEL_10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_70D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for DataSource()
{
  uint64_t result = qword_14E58;
  if (!qword_14E58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_716C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_71A4(uint64_t a1)
{
  uint64_t v2 = sub_DB90();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_DBB0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v11 = (void *)result;
    id v12 = *(id *)(result + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_queue);

    aBlock[4] = sub_C77C;
    aBlock[5] = a1;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_7480;
    aBlock[3] = &unk_10A88;
    uint64_t v13 = _Block_copy(aBlock);
    swift_retain();
    sub_DBA0();
    id v16 = &_swiftEmptyArrayStorage;
    sub_C5B0(&qword_14C58, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    uint64_t v15 = v6;
    sub_5FF0(&qword_14C60);
    sub_BF50(&qword_14C68, &qword_14C60);
    sub_DDA0();
    sub_DD30();
    _Block_release(v13);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v15);
    return swift_release();
  }
  return result;
}

uint64_t sub_7478()
{
  return sub_71A4(v0);
}

uint64_t sub_7480(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_74C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_7518(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_7528()
{
  return swift_release();
}

uint64_t sub_7554()
{
  return sub_762C("Mindfulness pause requested.", (uint64_t)&unk_10818, (uint64_t)sub_BF2C, (uint64_t)&unk_10830);
}

uint64_t sub_75FC()
{
  return sub_762C("Mindfulness resume requested.", (uint64_t)&unk_10868, (uint64_t)sub_BFA0, (uint64_t)&unk_10880);
}

uint64_t sub_762C(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a2;
  uint64_t v28 = a3;
  uint64_t v26 = a1;
  uint64_t v6 = v4;
  uint64_t v7 = sub_DB90();
  uint64_t v31 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_DBB0();
  uint64_t v29 = *(void *)(v10 - 8);
  uint64_t v30 = v10;
  __chkstk_darwin(v10);
  id v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_DB70();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = Log.datasource.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  id v18 = sub_DB50();
  os_log_type_t v19 = sub_DCC0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = v12;
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_0, v18, v19, v26, v20, 2u);
    id v12 = v25;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v6;
  aBlock[4] = v28;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_7480;
  aBlock[3] = a4;
  uint64_t v22 = _Block_copy(aBlock);
  id v23 = v6;
  sub_DBA0();
  uint64_t v32 = &_swiftEmptyArrayStorage;
  sub_C5B0(&qword_14C58, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_5FF0(&qword_14C60);
  sub_BF50(&qword_14C68, &qword_14C60);
  sub_DDA0();
  sub_DD30();
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v30);
  return swift_release();
}

uint64_t sub_7A88(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_DB90();
  uint64_t v39 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v38 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_DBB0();
  uint64_t v36 = *(void *)(v10 - 8);
  uint64_t v37 = v10;
  __chkstk_darwin(v10);
  id v35 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_DB70();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = Log.datasource.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_DB50();
  os_log_type_t v18 = sub_DCC0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v31 = a3;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v32 = a4;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v33 = v8;
    aBlock[0] = v21;
    uint64_t v30 = v12;
    *(_DWORD *)uint64_t v20 = 136315138;
    swift_bridgeObjectRetain();
    v40 = (void *)sub_B89C(a1, a2, aBlock);
    a3 = v31;
    sub_DD70();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v17, v18, "Elements requested (section = %s).", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v8 = v33;
    swift_slowDealloc();
    a4 = v32;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v30);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  uint64_t v22 = v34;
  id v23 = (void *)swift_allocObject();
  v23[2] = v22;
  v23[3] = a3;
  v23[4] = a4;
  aBlock[4] = (uint64_t)sub_C00C;
  aBlock[5] = (uint64_t)v23;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_7480;
  aBlock[3] = (uint64_t)&unk_108D0;
  uint64_t v24 = _Block_copy(aBlock);
  id v25 = v22;
  sub_C018(a3);
  uint64_t v26 = v35;
  sub_DBA0();
  v40 = &_swiftEmptyArrayStorage;
  sub_C5B0(&qword_14C58, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_5FF0(&qword_14C60);
  sub_BF50(&qword_14C68, &qword_14C60);
  uint64_t v27 = v38;
  sub_DDA0();
  sub_DD30();
  _Block_release(v24);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v27, v8);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v26, v37);
  return swift_release();
}

uint64_t sub_7F64(uint64_t a1, uint64_t (*a2)(void *), uint64_t a3)
{
  uint64_t v38 = a3;
  uint64_t v39 = a2;
  uint64_t v3 = sub_DB70();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v35 - v8;
  uint64_t v10 = sub_DB00();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_DAF0();
  char v14 = sub_B05C((uint64_t)v13);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) == 0)
  {
    if (v39) {
      return v39(&_swiftEmptyArrayStorage);
    }
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v16 = Log.datasource.unsafeMutableAddressor();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v17(v9, v16, v3);
  os_log_type_t v18 = sub_DB50();
  os_log_type_t v19 = sub_DCC0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_0, v18, v19, "A mindfulness session is appropriate for this interval.", v20, 2u);
    swift_slowDealloc();
  }

  id v23 = *(void (**)(void, void))(v4 + 8);
  uint64_t v22 = v4 + 8;
  uint64_t v21 = (uint64_t (*)(void, void))v23;
  v23(v9, v3);
  id v24 = sub_C23C();
  v17(v7, v16, v3);
  id v25 = v24;
  uint64_t v26 = sub_DB50();
  os_log_type_t v27 = sub_DCC0();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    id v35 = (void *)swift_slowAlloc();
    uint64_t v36 = v7;
    *(_DWORD *)uint64_t v28 = 138412290;
    v40 = v25;
    uint64_t v29 = v25;
    uint64_t v37 = v22;
    uint64_t v30 = v21;
    uint64_t v31 = v29;
    uint64_t v7 = v36;
    sub_DD70();
    *id v35 = v25;

    uint64_t v21 = v30;
    _os_log_impl(&dword_0, v26, v27, "Returning element %@", v28, 0xCu);
    sub_5FF0(&qword_14D48);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v26 = v25;
  }

  uint64_t result = v21(v7, v3);
  if (!v39)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  sub_5FF0((uint64_t *)&unk_14D00);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_E9F0;
  *(void *)(v32 + 32) = v25;
  v40 = v32;
  sub_DCB0();
  uint64_t v33 = v40;
  long long v34 = v25;
  v39(v33);

  return swift_bridgeObjectRelease();
}

id sub_8468()
{
  uint64_t v0 = sub_DB40();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_DB00();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v23 - v9;
  sub_6094(0, &qword_14D30);
  id result = [(id)swift_getObjCClassFromMetadata() categoryTypeForIdentifier:HKCategoryTypeIdentifierMindfulSession];
  if (result)
  {
    uint64_t v12 = result;
    sub_DB30();
    sub_DAF0();
    sub_DB10();
    uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
    v23[1] = v5 + 8;
    id v25 = v13;
    v13(v8, v4);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    char v14 = self;
    Class isa = sub_DAD0().super.isa;
    id v16 = [v14 predicateForSamplesWithStartDate:isa endDate:0 options:0];

    uint64_t v17 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v18 = objc_allocWithZone((Class)HKAnchoredObjectQuery);
    uint64_t v30 = sub_C620;
    uint64_t v31 = v17;
    uint64_t v24 = v4;
    aBlock = _NSConcreteStackBlock;
    uint64_t v27 = 1107296256;
    uint64_t v28 = sub_887C;
    uint64_t v29 = &unk_10A10;
    os_log_type_t v19 = _Block_copy(&aBlock);
    swift_retain();
    id v20 = [v18 initWithType:v12 predicate:v16 anchor:0 limit:0 resultsHandler:v19];
    _Block_release(v19);
    swift_release();
    swift_release();
    uint64_t v21 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v30 = sub_C620;
    uint64_t v31 = v21;
    aBlock = _NSConcreteStackBlock;
    uint64_t v27 = 1107296256;
    uint64_t v28 = sub_887C;
    uint64_t v29 = &unk_10A38;
    uint64_t v22 = _Block_copy(&aBlock);
    swift_retain();
    sub_C018((uint64_t)sub_C620);
    swift_release();
    [v20 setUpdateHandler:v22];
    _Block_release(v22);

    v25(v10, v24);
    swift_release_n();
    return v20;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_887C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v9 = a3;
  uint64_t v11 = *(void (**)(id, uint64_t, uint64_t, void *, void *))(a1 + 32);
  if (a3)
  {
    sub_6094(0, &qword_14D40);
    uint64_t v9 = sub_DCA0();
  }
  if (a4)
  {
    sub_6094(0, &qword_14D38);
    a4 = sub_DCA0();
  }
  swift_retain();
  id v12 = a2;
  id v13 = a5;
  id v14 = a6;
  v11(v12, v9, a4, a5, a6);
  swift_release();

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_8994()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_DB70();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_DBE0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (uint64_t *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *(void **)((char *)v1 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_queue);
  void *v9 = v10;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, enum case for DispatchPredicate.onQueue(_:), v6);
  id v11 = v10;
  LOBYTE(v10) = sub_DC00();
  (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  if (v10)
  {
    uint64_t v12 = Log.datasource.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v12, v2);
    id v13 = sub_DB50();
    os_log_type_t v14 = sub_DCC0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_0, v13, v14, "Starting mindful session query", v15, 2u);
      swift_slowDealloc();
    }

    uint64_t v16 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v17 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.offset + (swift_isaMask & *v1)))(v16);
    if (v17)
    {
      id v18 = (void *)v17;
      [*(id *)((char *)v1 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_healthStore) stopQuery:v17];
    }
    id v19 = sub_8468();
    [*(id *)((char *)v1 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_healthStore) executeQuery:v19];
    id v20 = *(void (**)(id))((char *)&stru_68.reloff + (swift_isaMask & *v1));
    id v21 = v19;
    v20(v19);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_8C94()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_DB70();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_DBE0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (uint64_t *)((char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *(void **)((char *)v1 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_queue);
  void *v9 = v10;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, enum case for DispatchPredicate.onQueue(_:), v6);
  id v11 = v10;
  LOBYTE(v10) = sub_DC00();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  if (v10)
  {
    uint64_t v13 = Log.datasource.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v13, v2);
    os_log_type_t v14 = sub_DB50();
    os_log_type_t v15 = sub_DCC0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_0, v14, v15, "Stopping mindful session query", v16, 2u);
      swift_slowDealloc();
    }

    uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v18 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.offset + (swift_isaMask & *v1)))(v17);
    if (v18)
    {
      id v19 = (void *)v18;
      [*(id *)((char *)v1 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_healthStore) stopQuery:v18];
    }
    return (*(uint64_t (**)(void))&stru_B8.sectname[swift_isaMask & *v1])(0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t *sub_8F64()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_DB90();
  uint64_t v65 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v63 = (char *)v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_DBB0();
  uint64_t v62 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  v61 = (char *)v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_DB80();
  uint64_t v56 = *(void *)(v5 - 8);
  uint64_t v57 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (void *)((char *)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_DBD0();
  uint64_t v59 = *(void *)(v8 - 8);
  uint64_t v60 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  id v11 = (char *)v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v58 = (char *)v55 - v12;
  uint64_t v13 = sub_DB70();
  uint64_t v66 = *(void *)(v13 - 8);
  uint64_t v67 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)v55 - v17;
  uint64_t v19 = sub_DBE0();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (void *)((char *)v55 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v23 = *(void **)((char *)v1 + OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_queue);
  *uint64_t v22 = v23;
  (*(void (**)(void *, void, uint64_t))(v20 + 104))(v22, enum case for DispatchPredicate.onQueue(_:), v19);
  v55[1] = v23;
  LOBYTE(v23) = sub_DC00();
  uint64_t result = (uint64_t *)(*(uint64_t (**)(void *, uint64_t))(v20 + 8))(v22, v19);
  if ((v23 & 1) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  v55[0] = v2;
  id v25 = *(uint64_t (**)(void))((char *)&stru_68.reserved2 + (swift_isaMask & *v1));
  uint64_t v26 = ((uint64_t (*)(uint64_t *))v25)(result);
  uint64_t v27 = (uint64_t *)sub_D2D4();
  if (v26 < *v27)
  {
    uint64_t result = (uint64_t *)(*(uint64_t (**)(void *))&stru_B8.segname[(swift_isaMask & *v1) - 8])(aBlock);
    if (!__OFADD__(*v28, 1))
    {
      ++*v28;
      uint64_t v29 = ((uint64_t (*)(void *, void))result)(aBlock, 0);
      uint64_t v30 = ((uint64_t (*)(uint64_t))v25)(v29);
      uint64_t result = (uint64_t *)sub_D2E8();
      uint64_t v31 = v30 * *result;
      if ((unsigned __int128)(v30 * (__int128)*result) >> 64 == v31 >> 63)
      {
        uint64_t v32 = (uint64_t *)sub_D2F4();
        if (*v32 <= v31) {
          uint64_t v33 = v31;
        }
        else {
          uint64_t v33 = *v32;
        }
        uint64_t v34 = Log.datasource.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v18, v34, v67);
        id v35 = sub_DB50();
        os_log_type_t v36 = sub_DCE0();
        if (os_log_type_enabled(v35, v36))
        {
          uint64_t v37 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v37 = 134217984;
          aBlock[0] = v33;
          sub_DD70();
          _os_log_impl(&dword_0, v35, v36, "Will try to restart query after %ld seconds", v37, 0xCu);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v66 + 8))(v18, v67);
        sub_DBC0();
        *uint64_t v7 = v33;
        uint64_t v39 = v56;
        uint64_t v38 = v57;
        (*(void (**)(uint64_t *, void, uint64_t))(v56 + 104))(v7, enum case for DispatchTimeInterval.seconds(_:), v57);
        v40 = v58;
        sub_DBF0();
        (*(void (**)(uint64_t *, uint64_t))(v39 + 8))(v7, v38);
        uint64_t v41 = v60;
        uint64_t v42 = *(void (**)(char *, uint64_t))(v59 + 8);
        v42(v11, v60);
        uint64_t v43 = swift_allocObject();
        *(void *)(v43 + 16) = v1;
        aBlock[4] = sub_C5F8;
        aBlock[5] = v43;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_7480;
        aBlock[3] = &unk_109E8;
        uint64_t v44 = _Block_copy(aBlock);
        uint64_t v45 = v1;
        v46 = v61;
        sub_DBA0();
        v68 = &_swiftEmptyArrayStorage;
        sub_C5B0(&qword_14C58, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_5FF0(&qword_14C60);
        sub_BF50(&qword_14C68, &qword_14C60);
        objc_super v47 = v63;
        uint64_t v48 = v55[0];
        sub_DDA0();
        sub_DD00();
        _Block_release(v44);
        (*(void (**)(char *, uint64_t))(v65 + 8))(v47, v48);
        (*(void (**)(char *, uint64_t))(v62 + 8))(v46, v64);
        v42(v40, v41);
        return (uint64_t *)swift_release();
      }
LABEL_18:
      __break(1u);
      return result;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v49 = v27;
  uint64_t v50 = Log.datasource.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v16, v50, v67);
  v51 = v1;
  v52 = sub_DB50();
  os_log_type_t v53 = sub_DCD0();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = swift_slowAlloc();
    *(_DWORD *)uint64_t v54 = 134218240;
    aBlock[0] = v25();
    sub_DD70();

    *(_WORD *)(v54 + 12) = 2048;
    aBlock[0] = *v49;
    sub_DD70();
    _os_log_impl(&dword_0, v52, v53, "Not restarting mindful session query, maximum retries allowed exhausted; Retry attempt: %ld (max: %ld)",
      (uint8_t *)v54,
      0x16u);
    swift_slowDealloc();
  }
  else
  {

    v52 = v51;
  }

  return (uint64_t *)(*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v16, v67);
}

uint64_t sub_9824(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_DB90();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_DBB0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = *(void *)&v2[OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_queue];
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a2;
  v13[3] = v2;
  v13[4] = a1;
  aBlock[4] = sub_C5A4;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_7480;
  aBlock[3] = &unk_10998;
  uint64_t v14 = _Block_copy(aBlock);
  swift_errorRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = v2;
  sub_DBA0();
  v17[1] = &_swiftEmptyArrayStorage;
  sub_C5B0(&qword_14C58, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_5FF0(&qword_14C60);
  sub_BF50(&qword_14C68, &qword_14C60);
  sub_DDA0();
  sub_DD30();
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

uint64_t sub_9AEC(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v6 = sub_DB70();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_DB40();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    sub_DB30();
    if (!a3) {
      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    if (a3 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t result = sub_DDF0();
      uint64_t v20 = result;
      if (result) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v20 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
      uint64_t result = swift_bridgeObjectRetain_n();
      if (v20)
      {
LABEL_7:
        if (v20 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v22 = 0;
        do
        {
          if ((a3 & 0xC000000000000001) != 0) {
            id v23 = (id)sub_DDC0();
          }
          else {
            id v23 = *(id *)(a3 + 8 * v22 + 32);
          }
          uint64_t v24 = v23;
          ++v22;
          id v30 = v23;
          sub_9EA4(&v30, (uint64_t)v13, a2);
        }
        while (v20 != v22);
      }
    }
    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  swift_errorRetain();
  uint64_t v14 = Log.datasource.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v14, v6);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v15 = sub_DB50();
  os_log_type_t v16 = sub_DCD0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = (void *)swift_slowAlloc();
    id v30 = v26;
    *(_DWORD *)uint64_t v17 = 136315138;
    id v25 = v17 + 4;
    swift_getErrorValue();
    uint64_t v18 = Error.logOutput.getter(v28, v29);
    uint64_t v27 = sub_B89C(v18, v19, (uint64_t *)&v30);
    sub_DD70();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v15, v16, "Error returned from mindful session query: %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_8F64();
  return swift_errorRelease();
}

void sub_9EA4(id *a1, uint64_t a2, void *a3)
{
  v69 = a3;
  uint64_t v4 = sub_5FF0(&qword_14BF0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v64 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v72 = (void (*)(char *, uint64_t))((char *)&v59 - v7);
  uint64_t v8 = sub_DB70();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v75 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v59 - v12;
  uint64_t v14 = sub_DB00();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = *a1;
  id v19 = [*a1 endDate];
  sub_DAE0();

  LODWORD(v71) = sub_DB20();
  uint64_t v70 = v15;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v15 + 8);
  v20(v17, v14);
  uint64_t v21 = Log.datasource.unsafeMutableAddressor();
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v62 = v21;
  uint64_t v63 = v9 + 16;
  uint64_t v74 = v8;
  v61 = v22;
  ((void (*)(char *))v22)(v13);
  id v23 = v18;
  uint64_t v24 = sub_DB50();
  os_log_type_t v25 = sub_DCC0();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v66 = v20;
  uint64_t v67 = v15 + 8;
  id v68 = v23;
  if (v26)
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v73 = v14;
    uint64_t v28 = v27;
    uint64_t v60 = swift_slowAlloc();
    v77[0] = v60;
    *(_DWORD *)uint64_t v28 = 136315394;
    id v29 = objc_msgSend(v23, "endDate", v28 + 4, v60);
    sub_DAE0();

    sub_C5B0(&qword_14D28, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v30 = sub_DE10();
    uint64_t v65 = v9;
    uint64_t v31 = v23;
    unint64_t v33 = v32;
    v20(v17, v73);
    uint64_t v76 = sub_B89C(v30, v33, v77);
    sub_DD70();

    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 1024;
    LOBYTE(v33) = (_BYTE)v71;
    LODWORD(v76) = v71 & 1;
    sub_DD70();
    _os_log_impl(&dword_0, v24, v25, "Received mindful session sample with end date %s (isInToday=%{BOOL}d", (uint8_t *)v28, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v14 = v73;
    swift_slowDealloc();

    uint64_t v34 = v65;
    id v35 = *(uint64_t (**)(char *, uint64_t))(v65 + 8);
    uint64_t v36 = v74;
    uint64_t v37 = v35(v13, v74);
    char v38 = v33;
  }
  else
  {

    uint64_t v34 = v9;
    id v35 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
    uint64_t v36 = v74;
    uint64_t v37 = v35(v13, v74);
    char v38 = (char)v71;
  }
  uint64_t v39 = v75;
  uint64_t v40 = (uint64_t)v72;
  if (v38)
  {
    (*(void (**)(uint64_t))&stru_B8.segname[swift_isaMask & *v69])(v37);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v40, 1, v14))
    {
      sub_6034(v40);
      double v41 = 0.0;
      uint64_t v42 = &DemoDataSource;
      uint64_t v43 = v66;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v17, v40, v14);
      sub_6034(v40);
      sub_DAB0();
      double v41 = v44;
      uint64_t v43 = v66;
      v66(v17, v14);
      uint64_t v42 = &DemoDataSource;
    }
    id v45 = [v68 *(SEL *)&v42[28].flags];
    sub_DAE0();

    sub_DAB0();
    double v47 = v46;
    v43(v17, v14);
    if (v41 < v47)
    {
      uint64_t v65 = v34;
      v61(v39, v62, v36);
      id v48 = v68;
      v49 = sub_DB50();
      os_log_type_t v50 = sub_DCC0();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        uint64_t v73 = swift_slowAlloc();
        v77[0] = v73;
        *(_DWORD *)v51 = 136315138;
        v71 = v51 + 4;
        id v52 = [v48 endDate];
        sub_DAE0();

        sub_C5B0(&qword_14D28, (void (*)(uint64_t))&type metadata accessor for Date);
        uint64_t v53 = sub_DE10();
        v72 = (void (*)(char *, uint64_t))v35;
        uint64_t v54 = v14;
        unint64_t v56 = v55;
        v66(v17, v54);
        uint64_t v76 = sub_B89C(v53, v56, v77);
        sub_DD70();

        uint64_t v14 = v54;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v49, v50, "This sample is the new latest session (end date = %s)", v51, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v72(v75, v74);
      }
      else
      {

        v35(v39, v36);
      }
      id v57 = [v48 endDate];
      v58 = v64;
      sub_DAE0();

      (*(void (**)(char *, void, uint64_t, uint64_t))(v70 + 56))(v58, 0, 1, v14);
      (*(void (**)(char *))&stru_B8.segname[(swift_isaMask & *v69) + 8])(v58);
      sub_A6F8();
    }
  }
}

void sub_A6F8()
{
  p_Class isa = (void *)sub_DB70();
  uint64_t v1 = *(p_isa - 1);
  uint64_t v2 = __chkstk_darwin(p_isa);
  uint64_t v4 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v63 = (char *)&v60 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v62 = (char *)&v60 - v8;
  __chkstk_darwin(v7);
  v61 = (char *)&v60 - v9;
  uint64_t v10 = sub_DB00();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_DBE0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (uint64_t *)((char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v18 = *(void **)&v0[OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_queue];
  *uint64_t v17 = v18;
  (*(void (**)(void *, void, uint64_t))(v15 + 104))(v17, enum case for DispatchPredicate.onQueue(_:), v14);
  id v19 = v18;
  LOBYTE(v18) = sub_DC00();
  (*(void (**)(void *, uint64_t))(v15 + 8))(v17, v14);
  if ((v18 & 1) == 0)
  {
    __break(1u);
    goto LABEL_31;
  }
  id v20 = [v0 delegate];
  if (!v20)
  {
LABEL_11:
    uint64_t v39 = Log.datasource.unsafeMutableAddressor();
    uint64_t v40 = p_isa;
    (*(void (**)(char *, uint64_t, void *))(v1 + 16))(v4, v39, p_isa);
    double v41 = sub_DB50();
    os_log_type_t v42 = sub_DCD0();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_0, v41, v42, "Delegate or its elementOperationQueue is NULL!", v43, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, void *))(v1 + 8))(v4, v40);
    return;
  }
  uint64_t v21 = v20;
  uint64_t v22 = [v20 elementOperationQueue];
  if (!v22)
  {
    swift_unknownObjectRelease();
    goto LABEL_11;
  }
  id v23 = v22;
  char v68 = 0;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = &v68;
  *(void *)(v24 + 24) = v21;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = sub_C188;
  *(void *)(v25 + 24) = v24;
  uint64_t v60 = v24;
  aBlock[4] = sub_C214;
  aBlock[5] = v25;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_B034;
  aBlock[3] = &unk_10948;
  BOOL v26 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v23, v26);
  _Block_release(v26);
  LOBYTE(v26) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v26)
  {
LABEL_31:
    __break(1u);
    return;
  }
  sub_DAF0();
  char v27 = sub_B05C((uint64_t)v13);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (v27)
  {
    uint64_t v28 = p_isa;
    if ((v68 & 1) == 0)
    {
      uint64_t v29 = Log.datasource.unsafeMutableAddressor();
      uint64_t v30 = v62;
      (*(void (**)(char *, uint64_t, void *))(v1 + 16))(v62, v29, v28);
      uint64_t v31 = sub_DB50();
      os_log_type_t v32 = sub_DCC0();
      if (os_log_type_enabled(v31, v32))
      {
        unint64_t v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v33 = 0;
        _os_log_impl(&dword_0, v31, v32, "Mindfulness element is not present and appropriate, trying to add.", v33, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, void *))(v1 + 8))(v30, v28);
      id v34 = sub_C23C();
      sub_5FF0((uint64_t *)&unk_14D00);
      uint64_t v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = xmmword_E9F0;
      *(void *)(v35 + 32) = v34;
      aBlock[0] = v35;
      sub_DCB0();
      sub_6094(0, &qword_14BE8);
      id v36 = v34;
      Class isa = sub_DC90().super.isa;
      swift_bridgeObjectRelease();
      sub_D2AC();
      swift_bridgeObjectRetain();
      char v38 = sub_DC10();
      swift_bridgeObjectRelease();
      [v21 addElements:isa toSectionWithIdentifier:v38];
      swift_release();

      swift_unknownObjectRelease();
LABEL_18:

      return;
    }
  }
  else
  {
    uint64_t v28 = p_isa;
    if (v68)
    {
      uint64_t v44 = Log.datasource.unsafeMutableAddressor();
      id v45 = v61;
      (*(void (**)(char *, uint64_t, void *))(v1 + 16))(v61, v44, v28);
      double v46 = sub_DB50();
      os_log_type_t v47 = sub_DCC0();
      if (os_log_type_enabled(v46, v47))
      {
        id v48 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v48 = 0;
        _os_log_impl(&dword_0, v46, v47, "Mindfulness element is present and not appropriate, removing it.", v48, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, void *))(v1 + 8))(v45, v28);
      sub_5FF0(&qword_14C30);
      uint64_t v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = xmmword_EA30;
      os_log_type_t v50 = (uint64_t *)sub_D2AC();
      uint64_t v52 = *v50;
      uint64_t v51 = v50[1];
      *(void *)(v49 + 32) = v52;
      *(void *)(v49 + 40) = v51;
      swift_bridgeObjectRetain();
      char v38 = sub_DC90().super.isa;
      swift_bridgeObjectRelease();
      [v21 removeElementsWithIds:v38];
      swift_release();
      swift_unknownObjectRelease();
      goto LABEL_18;
    }
  }
  p_Class isa = &v23->isa;
  uint64_t v53 = Log.datasource.unsafeMutableAddressor();
  uint64_t v54 = v63;
  (*(void (**)(char *, uint64_t, void *))(v1 + 16))(v63, v53, v28);
  unint64_t v55 = sub_DB50();
  os_log_type_t v56 = sub_DCC0();
  if (os_log_type_enabled(v55, v56))
  {
    id v57 = (uint8_t *)swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    *(_DWORD *)id v57 = 136315138;
    swift_beginAccess();
    if (v68) {
      uint64_t v58 = 29545;
    }
    else {
      uint64_t v58 = 0x746F6E207369;
    }
    if (v68) {
      unint64_t v59 = 0xE200000000000000;
    }
    else {
      unint64_t v59 = 0xE600000000000000;
    }
    uint64_t v65 = sub_B89C(v58, v59, &v66);
    sub_DD70();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v55, v56, "Mindfulness element %s present, not modifying.", v57, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_unknownObjectRelease();

    (*(void (**)(char *, void *))(v1 + 8))(v63, v28);
  }
  else
  {

    swift_unknownObjectRelease();
    (*(void (**)(char *, void *))(v1 + 8))(v54, v28);
  }
  swift_release();
}

uint64_t sub_B034(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_B05C(uint64_t a1)
{
  uint64_t v65 = a1;
  uint64_t v66 = sub_DB40();
  uint64_t v64 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  uint64_t v62 = (char *)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_DB00();
  uint64_t v73 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v63 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v67 = (char *)&v57 - v6;
  uint64_t v7 = sub_5FF0(&qword_14BF0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v70 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v57 - v10;
  uint64_t v12 = sub_DB70();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  v71 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v57 - v16;
  uint64_t v18 = sub_DBE0();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (uint64_t *)((char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = *(void **)&v1[OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_queue];
  *uint64_t v21 = v22;
  (*(void (**)(void *, void, uint64_t))(v19 + 104))(v21, enum case for DispatchPredicate.onQueue(_:), v18);
  id v23 = v22;
  LOBYTE(v22) = sub_DC00();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v19 + 8))(v21, v18);
  if (v22)
  {
    uint64_t v72 = v3;
    uint64_t v25 = Log.datasource.unsafeMutableAddressor();
    char v68 = *(void (**)(char *))(v13 + 16);
    uint64_t v69 = v25;
    v68(v17);
    BOOL v26 = v1;
    uint64_t v27 = v13;
    uint64_t v28 = sub_DB50();
    int v29 = sub_DCC0();
    if (os_log_type_enabled(v28, (os_log_type_t)v29))
    {
      int v60 = v29;
      uint64_t v61 = v27;
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      uint64_t v75 = v59;
      *(_DWORD *)uint64_t v30 = 136315138;
      (*(void (**)(void))&stru_B8.segname[swift_isaMask & *(void *)v26])();
      uint64_t v32 = v72;
      uint64_t v31 = v73;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v73 + 48))(v11, 1, v72))
      {
        sub_6034((uint64_t)v11);
        unint64_t v33 = 0xE300000000000000;
        uint64_t v34 = 7104878;
      }
      else
      {
        id v36 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
        uint64_t v58 = v12;
        uint64_t v37 = v67;
        v36(v67, v11, v32);
        sub_6034((uint64_t)v11);
        uint64_t v34 = sub_DAC0();
        unint64_t v33 = v38;
        uint64_t v39 = v37;
        uint64_t v12 = v58;
        (*(void (**)(char *, uint64_t))(v31 + 8))(v39, v32);
      }
      uint64_t v74 = sub_B89C(v34, v33, &v75);
      sub_DD70();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v28, (os_log_type_t)v60, "Determining whether a session is appropriate: lastSessionDate = %s.", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v35 = *(void (**)(char *, uint64_t))(v61 + 8);
      v35(v17, v12);
    }
    else
    {

      uint64_t v35 = *(void (**)(char *, uint64_t))(v27 + 8);
      v35(v17, v12);
    }
    BOOL v40 = sub_D300();
    BOOL v41 = sub_D360();
    if (v40 || v41)
    {
      uint64_t v46 = (uint64_t)v70;
      (*(void (**)(BOOL))&stru_B8.segname[swift_isaMask & *(void *)v26])(v41);
      uint64_t v47 = v72;
      uint64_t v48 = v73;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v46, 1, v72) == 1)
      {
        sub_6034(v46);
        return 1;
      }
      else
      {
        uint64_t v49 = v63;
        (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v63, v46, v47);
        os_log_type_t v50 = v62;
        sub_DB30();
        uint64_t v51 = v67;
        sub_DB10();
        (*(void (**)(char *, uint64_t))(v64 + 8))(v50, v66);
        sub_DAB0();
        double v53 = v52;
        sub_DAB0();
        double v55 = v54;
        os_log_type_t v56 = *(void (**)(char *, uint64_t))(v48 + 8);
        v56(v51, v47);
        v56(v49, v47);
        return v55 < v53;
      }
    }
    else
    {
      os_log_type_t v42 = v71;
      ((void (*)(char *, uint64_t, uint64_t))v68)(v71, v69, v12);
      uint64_t v43 = sub_DB50();
      os_log_type_t v44 = sub_DCC0();
      if (os_log_type_enabled(v43, v44))
      {
        id v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v45 = 0;
        _os_log_impl(&dword_0, v43, v44, "Mindfullness reminders not enabled.", v45, 2u);
        swift_slowDealloc();
      }

      v35(v42, v12);
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_B7F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_B89C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_B970(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_C71C((uint64_t)v12, *a3);
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
      sub_C71C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_C6CC((uint64_t)v12);
  return v7;
}

uint64_t sub_B970(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_DD80();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_BB2C(a5, a6);
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
  uint64_t v8 = sub_DDD0();
  if (!v8)
  {
    sub_DDE0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_DE00();
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

uint64_t sub_BB2C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_BBC4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_BDA4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_BDA4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_BBC4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_BD3C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_DDB0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_DDE0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_DC60();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_DE00();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_DDE0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_BD3C(uint64_t a1, uint64_t a2)
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
  sub_5FF0((uint64_t *)&unk_14D50);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_BDA4(char a1, int64_t a2, char a3, char *a4)
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
    sub_5FF0((uint64_t *)&unk_14D50);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_DE00();
  __break(1u);
  return result;
}

uint64_t sub_BEF4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_BF2C()
{
  return sub_8C94();
}

uint64_t sub_BF50(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_70D8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_BFA0()
{
}

uint64_t sub_BFC4()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_C00C()
{
  return sub_7F64(*(void *)(v0 + 16), *(uint64_t (**)(void *))(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_C018(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_C028()
{
  return type metadata accessor for DataSource();
}

void sub_C030()
{
  sub_C0F8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_C0F8()
{
  if (!qword_14C98)
  {
    sub_DB00();
    unint64_t v0 = sub_DD60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_14C98);
    }
  }
}

uint64_t sub_C150()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_C188()
{
  uint64_t v2 = *(unsigned char **)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  sub_D2AC();
  swift_bridgeObjectRetain();
  NSString v3 = sub_DC10();
  swift_bridgeObjectRelease();
  LOBYTE(v1) = [v1 hasElementWithId:v3 inSectionWithIdentifier:REDefaultSectionIdentifier];

  *uint64_t v2 = (_BYTE)v1;
}

uint64_t sub_C204()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_C214()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_C23C()
{
  uint64_t v0 = sub_5FF0(&qword_14D10);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_DA90();
  sub_D27C();
  uint64_t v3 = sub_DAA0();
  uint64_t v4 = *(void *)(v3 - 8);
  int v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  if (v5 != 1)
  {
    sub_DA80(v6);
    int64_t v7 = v8;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  id v9 = objc_allocWithZone((Class)REElementOpenAction);
  NSString v10 = sub_DC10();
  swift_bridgeObjectRelease();
  id v11 = [v9 initWithURL:v7 applicationID:v10];

  id v12 = [objc_allocWithZone((Class)REDailyRoutineRelevanceProvider) initWithDailyRoutineType:2];
  id v13 = objc_allocWithZone((Class)REBulletinDistributorRelevanceProvider);
  swift_bridgeObjectRetain();
  NSString v14 = sub_DC10();
  swift_bridgeObjectRelease();
  id v15 = [v13 initWithBulletinSectionIdentifier:v14];

  sub_6094(0, &qword_14D18);
  id v16 = sub_60D0();
  sub_D2AC();
  sub_5FF0((uint64_t *)&unk_14D00);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_EA40;
  *(void *)(v17 + 32) = v12;
  *(void *)(v17 + 40) = v15;
  v26[1] = v17;
  sub_DCB0();
  id v18 = objc_allocWithZone((Class)REElement);
  swift_bridgeObjectRetain();
  id v19 = v11;
  id v20 = v12;
  id v21 = v15;
  NSString v22 = sub_DC10();
  swift_bridgeObjectRelease();
  sub_6094(0, &qword_14D20);
  Class isa = sub_DC90().super.isa;
  swift_bridgeObjectRelease();
  id v24 = [v18 initWithIdentifier:v22 content:v16 action:v19 relevanceProviders:isa];

  return v24;
}

uint64_t sub_C55C()
{
  swift_errorRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_C5A4()
{
  return sub_9AEC(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_C5B0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_C5F8()
{
}

void sub_C624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    int64_t v8 = (void *)Strong;
    sub_9824(a2, a5);
  }
}

uint64_t sub_C694()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_C6CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_C71C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_C77C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_A6F8();
  }
}

void sub_C7D0()
{
}

uint64_t sub_C838(uint64_t a1, uint64_t a2)
{
  if (sub_DC20() == a1 && v3 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = sub_DE30();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0) {
      return 0;
    }
  }
  return type metadata accessor for SampleDataSource();
}

id sub_C9A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BundleConfiguration();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for BundleConfiguration()
{
  return self;
}

id sub_CA40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BundleConfiguration();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_CA74(uint64_t a1)
{
  return sub_CB38(a1, static Log.default);
}

uint64_t Log.default.unsafeMutableAddressor()
{
  return sub_CBD4(&qword_14E68, (uint64_t)static Log.default);
}

uint64_t sub_CAB8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Log.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_CC4C(&qword_14E68, (uint64_t)static Log.default, a1);
}

uint64_t sub_CB14(uint64_t a1)
{
  return sub_CB38(a1, static Log.datasource);
}

uint64_t sub_CB38(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_DB70();
  sub_D218(v3, a2);
  sub_CAB8(v3, (uint64_t)a2);
  return sub_DB60();
}

uint64_t Log.datasource.unsafeMutableAddressor()
{
  return sub_CBD4(&qword_14E70, (uint64_t)static Log.datasource);
}

uint64_t sub_CBD4(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_DB70();

  return sub_CAB8(v3, a2);
}

uint64_t static Log.datasource.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_CC4C(&qword_14E70, (uint64_t)static Log.datasource, a1);
}

uint64_t sub_CC4C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_DB70();
  uint64_t v6 = sub_CAB8(v5, a2);
  int64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

Swift::Void __swiftcall Logger.trace(file:function:)(Swift::String file, Swift::String function)
{
  object = function._object;
  uint64_t countAndFlagsBits = function._countAndFlagsBits;
  uint64_t v4 = file._object;
  uint64_t v5 = file._countAndFlagsBits;
  Swift::String v19 = file;
  sub_D07C();
  uint64_t v6 = sub_DD90();
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v8 = v6 + 16 * v7;
    uint64_t v5 = *(void *)(v8 + 16);
    uint64_t v4 = *(void **)(v8 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  sub_D0D0(46, 0xE100000000000000, v5, (unint64_t)v4);
  sub_DC80();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_DC30();
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  sub_D0D0(40, 0xE100000000000000, countAndFlagsBits, (unint64_t)object);
  swift_bridgeObjectRetain();
  sub_DC80();
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_DC30();
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = sub_DB50();
  os_log_type_t v16 = sub_DCE0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v19._uint64_t countAndFlagsBits = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 67109634;
    id v18 = pthread_self();
    pthread_mach_thread_np(v18);
    sub_DD70();
    *(_WORD *)(v17 + 8) = 2080;
    swift_bridgeObjectRetain();
    sub_B89C(v9, v11, &v19._countAndFlagsBits);
    sub_DD70();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 18) = 2080;
    swift_bridgeObjectRetain();
    sub_B89C(v12, v14, &v19._countAndFlagsBits);
    sub_DD70();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v15, v16, "[%u] %s::%s", (uint8_t *)v17, 0x1Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

unint64_t sub_D07C()
{
  unint64_t result = qword_14DE8;
  if (!qword_14DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14DE8);
  }
  return result;
}

unint64_t sub_D0D0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (sub_DC70() != a1 || v9 != a2)
  {
    char v10 = sub_DE30();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = sub_DC40();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_D1C4()
{
  return 0;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

uint64_t *sub_D218(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

const char *sub_D27C()
{
  return "com.apple.Mind";
}

uint64_t sub_D288()
{
  return 0x6C7070612E6D6F63;
}

void *sub_D2AC()
{
  return &unk_10AD0;
}

unint64_t sub_D2B8()
{
  return 0xD000000000000016;
}

void *sub_D2D4()
{
  return &unk_EB70;
}

uint64_t sub_D2E0()
{
  return 5;
}

void *sub_D2E8()
{
  return &unk_EB78;
}

void *sub_D2F4()
{
  return &unk_EB80;
}

BOOL sub_D300()
{
  return sub_D3C0(&kNLMindfulnessStartOfDayEnabledKey);
}

BOOL sub_D360()
{
  return sub_D3C0(&kNLMindfulnessEndOfDayEnabledKey);
}

BOOL sub_D3C0(id *a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t v1 = (__CFString *)*a1;
  objc_super v2 = (__CFString *)sub_DC10();
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(v1, v2, &keyExistsAndHasValidFormat);

  return !keyExistsAndHasValidFormat || AppIntegerValue == 1;
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

void sub_D570(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
}

id sub_D628()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SampleDataSource();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_D69C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SampleDataSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_D6D0(void (*a1)(uint64_t))
{
  id v2 = (id)REUISampleRelevanceProviderForSamplePositionWithPercentage();
  if (v2)
  {
    uint64_t v3 = v2;
    sub_6094(0, &qword_14D18);
    id v4 = sub_60D0();
    sub_D2AC();
    sub_5FF0((uint64_t *)&unk_14D00);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_E9F0;
    *(void *)(v5 + 32) = v3;
    sub_DCB0();
    id v6 = objc_allocWithZone((Class)REElement);
    swift_bridgeObjectRetain();
    id v7 = v4;
    id v8 = v3;
    NSString v9 = sub_DC10();
    swift_bridgeObjectRelease();
    sub_6094(0, &qword_14D20);
    Class isa = sub_DC90().super.isa;
    swift_bridgeObjectRelease();
    id v11 = [v6 initWithIdentifier:v9 content:v7 action:0 relevanceProviders:isa];

    if (a1)
    {
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_E9F0;
      *(void *)(v12 + 32) = v11;
      uint64_t v14 = v12;
      sub_DCB0();
      id v13 = v11;
      a1(v14);

      swift_bridgeObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  else if (a1)
  {
    swift_retain();
    a1(0);
    sub_5D70((uint64_t)a1);
  }
}

uint64_t type metadata accessor for SampleDataSource()
{
  return self;
}

uint64_t sub_D948()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

id sub_D980()
{
  type metadata accessor for DataSource();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_14E50 = (uint64_t)result;
  return result;
}

uint64_t *sub_D9D8()
{
  if (qword_14E78 != -1) {
    swift_once();
  }
  return &qword_14E50;
}

id sub_DA24()
{
  if (qword_14E78 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_14E50;

  return v0;
}

void sub_DA80(NSURL *retstr@<X8>)
{
}

uint64_t sub_DA90()
{
  return URL.init(string:)();
}

uint64_t sub_DAA0()
{
  return type metadata accessor for URL();
}

uint64_t sub_DAB0()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_DAC0()
{
  return Date.description.getter();
}

NSDate sub_DAD0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_DAE0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_DAF0()
{
  return Date.init()();
}

uint64_t sub_DB00()
{
  return type metadata accessor for Date();
}

uint64_t sub_DB10()
{
  return Calendar.startOfDay(for:)();
}

uint64_t sub_DB20()
{
  return Calendar.isDateInToday(_:)();
}

uint64_t sub_DB30()
{
  return static Calendar.current.getter();
}

uint64_t sub_DB40()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_DB50()
{
  return Logger.logObject.getter();
}

uint64_t sub_DB60()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_DB70()
{
  return type metadata accessor for Logger();
}

uint64_t sub_DB80()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_DB90()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_DBA0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_DBB0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_DBC0()
{
  return static DispatchTime.now()();
}

uint64_t sub_DBD0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_DBE0()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_DBF0()
{
  return + infix(_:_:)();
}

uint64_t sub_DC00()
{
  return _dispatchPreconditionTest(_:)();
}

NSString sub_DC10()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_DC20()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_DC30()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_DC40()
{
  return String.index(after:)();
}

uint64_t sub_DC50()
{
  return String.init(cString:)();
}

Swift::Int sub_DC60()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_DC70()
{
  return String.subscript.getter();
}

uint64_t sub_DC80()
{
  return String.subscript.getter();
}

NSArray sub_DC90()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_DCA0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_DCB0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_DCC0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_DCD0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_DCE0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_DCF0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_DD00()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_DD10()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_DD20()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_DD30()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_DD40()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

NSNumber sub_DD50(Swift::Double floatLiteral)
{
  return NSNumber.init(floatLiteral:)(floatLiteral);
}

uint64_t sub_DD60()
{
  return type metadata accessor for Optional();
}

uint64_t sub_DD70()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_DD80()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_DD90()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_DDA0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_DDB0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_DDC0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_DDD0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_DDE0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_DDF0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_DE00()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_DE10()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_DE20()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_DE30()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t REAbsoluteRelevanceProviderForDate()
{
  return _REAbsoluteRelevanceProviderForDate();
}

uint64_t REDemoDateForIdentifier()
{
  return _REDemoDateForIdentifier();
}

uint64_t REUISampleRelevanceProviderForSamplePositionWithPercentage()
{
  return _REUISampleRelevanceProviderForSamplePositionWithPercentage();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return _pthread_mach_thread_np(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
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