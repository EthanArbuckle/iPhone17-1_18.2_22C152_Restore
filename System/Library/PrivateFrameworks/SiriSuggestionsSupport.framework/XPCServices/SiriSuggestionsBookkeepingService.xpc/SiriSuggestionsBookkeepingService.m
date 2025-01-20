int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void *v21;
  long long v23;
  long long v24;
  void *v25;

  v3 = sub_10000D888();
  sub_100005030(v3, qword_100014DF0);
  sub_100005094(v3, (uint64_t)qword_100014DF0);
  v4 = (void *)sub_10000D788();
  sub_10000D768();

  v5 = (void *)sub_10000D788();
  sub_10000531C();
  sub_10000D798();

  if (qword_100014A30 != -1) {
    swift_once();
  }
  v6 = sub_10000D8B8();
  sub_100005094(v6, (uint64_t)static Logger.bookkeepingXPCServiceCategory);
  v7 = sub_10000D898();
  v8 = sub_10000D928();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Bookkeeping XPC Service starting up", v9, 2u);
    swift_slowDealloc();
  }

  v10 = sub_10000D718();
  qword_100014E08 = sub_10000D708();
  sub_10000D878();
  v11 = *(void *)sub_10000D808();
  *((void *)&v24 + 1) = sub_10000D7F8();
  v25 = &protocol witness table for SiriSuggestionsIntelligence.NoopAccountService;
  *(void *)&v23 = v11;
  swift_retain();
  sub_10000D868();
  sub_1000050E0((uint64_t)&v23);
  v12 = qword_100014E08;
  sub_10000D688();
  v23 = 0u;
  v24 = 0u;
  v25 = 0;
  swift_allocObject();
  swift_retain();
  v13 = sub_10000D678();
  type metadata accessor for DefaultSuggestionsLoggerFactory();
  v14 = (void *)swift_allocObject();
  v14[5] = v10;
  v14[6] = &protocol witness table for OSFeatureFlagProvider;
  v14[2] = v12;
  v14[7] = v13;
  sub_1000052B8((uint64_t)&unk_100014E10, (uint64_t)&v23);
  type metadata accessor for DefaultFeatureServiceFactory();
  v15 = swift_allocObject();
  sub_100005148(&v23, v15 + 16);
  v16 = objc_allocWithZone((Class)type metadata accessor for BookkeepingServiceDelegate());
  swift_retain();
  qword_100014E38 = (uint64_t)sub_100005160((uint64_t)v14, v15, v12, v16);
  v17 = [self serviceListener];
  qword_100014E40 = (uint64_t)v17;
  [v17 setDelegate:qword_100014E38];
  [v17 resume];
  v18 = sub_10000D898();
  v19 = sub_10000D928();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Bookkeeping XPC Service started up", v20, 2u);
    swift_slowDealloc();
  }

  v21 = (void *)sub_10000D788();
  sub_10000531C();
  sub_10000D778();

  return 0;
}

uint64_t *sub_100005030(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005094(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000050CC(uint64_t result, unsigned char **a2)
{
  v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000050E0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005130()
{
  return sub_10000D5F8();
}

uint64_t sub_100005148(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

id sub_100005160(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  v14[3] = type metadata accessor for DefaultSuggestionsLoggerFactory();
  v14[4] = sub_100005268();
  v14[0] = a1;
  v13[3] = type metadata accessor for DefaultFeatureServiceFactory();
  v13[4] = &protocol witness table for DefaultFeatureServiceFactory;
  v13[0] = a2;
  v12[3] = sub_10000D718();
  v12[4] = &protocol witness table for OSFeatureFlagProvider;
  v12[0] = a3;
  sub_1000052B8((uint64_t)v14, (uint64_t)a4+ OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_suggestionsLoggerFactory);
  sub_1000052B8((uint64_t)v13, (uint64_t)a4 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_featureServiceFactory);
  sub_1000052B8((uint64_t)v12, (uint64_t)a4 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_featureFlagProvider);
  v11.receiver = a4;
  v11.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v11, "init");
  sub_1000050E0((uint64_t)v12);
  sub_1000050E0((uint64_t)v13);
  sub_1000050E0((uint64_t)v14);
  return v9;
}

unint64_t sub_100005268()
{
  unint64_t result = qword_100014A38;
  if (!qword_100014A38)
  {
    type metadata accessor for DefaultSuggestionsLoggerFactory();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014A38);
  }
  return result;
}

uint64_t sub_1000052B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000531C()
{
  return v0;
}

char **SiriSuggestionsSignpost.bookkeepingXPCServiceStartup.unsafeMutableAddressor()
{
  return &static SiriSuggestionsSignpost.bookkeepingXPCServiceStartup;
}

uint64_t Logger.bookkeepingXPCServiceCategory.unsafeMutableAddressor()
{
  if (qword_100014A30 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10000D8B8();
  return sub_100005094(v0, (uint64_t)static Logger.bookkeepingXPCServiceCategory);
}

uint64_t sub_1000053A4()
{
  uint64_t v0 = sub_10000D8B8();
  sub_100005030(v0, static Logger.bookkeepingXPCServiceCategory);
  sub_100005094(v0, (uint64_t)static Logger.bookkeepingXPCServiceCategory);
  sub_10000D7A8();
  return sub_10000D8A8();
}

uint64_t static Logger.bookkeepingXPCServiceCategory.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100014A30 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000D8B8();
  uint64_t v3 = sub_100005094(v2, (uint64_t)static Logger.bookkeepingXPCServiceCategory);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

const char *static SiriSuggestionsSignpost.bookkeepingXPCServiceStartup.getter()
{
  return "BookkeepingXPCServicesStartup";
}

ValueMetadata *type metadata accessor for SiriSuggestionsSignpost()
{
  return &type metadata for SiriSuggestionsSignpost;
}

uint64_t DefaultSuggestionsLoggerFactory.__allocating_init(featureFlagProvider:siriRemembersLogger:)(uint64_t a1, uint64_t a2)
{
  return sub_100005514(a1, a2, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_10000590C);
}

uint64_t DefaultSuggestionsLoggerFactory.init(featureFlagProvider:siriRemembersLogger:)(uint64_t a1, uint64_t a2)
{
  return sub_100005514(a1, a2, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_100005A7C);
}

uint64_t sub_100005514(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  sub_100005A2C(a1, v7);
  sub_100005C10();
  __chkstk_darwin();
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v11 + 16))(v10);
  uint64_t v12 = a3(v10, a2, v3, v7, v8);
  sub_1000050E0(a1);
  return v12;
}

uint64_t DefaultSuggestionsLoggerFactory.create(featureService:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10000D8B8();
  sub_100005C10();
  uint64_t v8 = v7;
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v11 = &v25[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v9);
  v13 = &v25[-v12 - 8];
  sub_100005AF4((void *)(v2 + 16), *(void *)(v2 + 40));
  if (sub_10000D6F8())
  {
    sub_10000D758();
    uint64_t v14 = sub_10000D898();
    os_log_type_t v15 = sub_10000D928();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Enabled feature extraction logger", v16, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v6);
    sub_1000052B8(a1, (uint64_t)v25);
    uint64_t v17 = sub_10000D7C8();
    swift_allocObject();
    uint64_t v18 = sub_10000D7B8();
    a2[3] = v17;
    v19 = (void *)sub_100005B38();
  }
  else
  {
    sub_10000D758();
    v20 = sub_10000D898();
    os_log_type_t v21 = sub_10000D928();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Feature Extraction disabled. Only using raw remembers logger", v22, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
    uint64_t v18 = *(void *)(v3 + 56);
    a2[3] = sub_10000D688();
    v19 = &protocol witness table for SiriRemembersLogger;
  }
  a2[4] = (uint64_t)v19;
  *a2 = v18;
  return swift_retain();
}

uint64_t DefaultSuggestionsLoggerFactory.deinit()
{
  sub_1000050E0(v0 + 16);
  swift_release();
  return v0;
}

uint64_t DefaultSuggestionsLoggerFactory.__deallocating_deinit()
{
  sub_1000050E0(v0 + 16);
  swift_release();
  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t sub_1000058E8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return DefaultSuggestionsLoggerFactory.create(featureService:)(a1, a2);
}

uint64_t *sub_10000590C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a4 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, a4);
  v13 = sub_100005A7C((uint64_t)v11, a2, v12, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, a4);
  return v13;
}

uint64_t sub_100005A2C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *sub_100005A7C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  a3[5] = a4;
  a3[6] = a5;
  uint64_t v9 = sub_100005BAC(a3 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(v9, a1, a4);
  a3[7] = a2;
  return a3;
}

void *sub_100005AF4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100005B38()
{
  unint64_t result = qword_100014A40;
  if (!qword_100014A40)
  {
    sub_10000D7C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014A40);
  }
  return result;
}

uint64_t type metadata accessor for DefaultSuggestionsLoggerFactory()
{
  return self;
}

uint64_t *sub_100005BAC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t DefaultFeatureServiceFactory.__allocating_init(accountDetailsProvider:)(long long *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_100005148(a1, v2 + 16);
  return v2;
}

uint64_t DefaultFeatureServiceFactory.init(accountDetailsProvider:)(long long *a1)
{
  sub_100005148(a1, v1 + 16);
  return v1;
}

uint64_t DefaultFeatureServiceFactory.create(featureFlagProvider:configProvider:accountDetailsProviderOverride:possibleOwners:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[21] = a5;
  v6[22] = v5;
  v6[19] = a3;
  v6[20] = a4;
  v6[17] = a1;
  v6[18] = a2;
  uint64_t v7 = sub_10000D8B8();
  v6[23] = v7;
  v6[24] = *(void *)(v7 - 8);
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  return _swift_task_switch(sub_100005D64, 0, 0);
}

uint64_t sub_100005D64()
{
  sub_100005AF4(*(void **)(v0 + 144), *(void *)(*(void *)(v0 + 144) + 24));
  if (sub_10000D6F8())
  {
    sub_10000D758();
    uint64_t v1 = sub_10000D898();
    os_log_type_t v2 = sub_10000D928();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Enabled feature service", v3, 2u);
      swift_slowDealloc();
    }
    uint64_t v4 = *(void *)(v0 + 208);
    uint64_t v5 = *(void *)(v0 + 184);
    uint64_t v6 = *(void *)(v0 + 192);
    uint64_t v7 = *(void *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    sub_100006388(v7, v0 + 56);
    if (*(void *)(v0 + 80))
    {
      sub_100005148((long long *)(v0 + 56), v0 + 16);
    }
    else
    {
      sub_1000052B8(*(void *)(v0 + 176) + 16, v0 + 16);
      sub_100006434(v0 + 56);
    }
    sub_10000D738();
    v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v16;
    void *v16 = v0;
    v16[1] = sub_100006024;
    uint64_t v17 = *(void *)(v0 + 168);
    uint64_t v18 = *(void *)(v0 + 152);
    uint64_t v19 = *(void *)(v0 + 136);
    return static SiriSuggestionsIntelligence.createFeatureService(clock:configProvider:accountDetailsProvider:possibleOwners:)(v19, v0 + 96, v18, v0 + 16, v17);
  }
  else
  {
    sub_10000D758();
    uint64_t v8 = sub_10000D898();
    os_log_type_t v9 = sub_10000D928();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Feature Service disabled.", v10, 2u);
      swift_slowDealloc();
    }
    uint64_t v12 = *(void *)(v0 + 192);
    uint64_t v11 = *(void *)(v0 + 200);
    uint64_t v13 = *(void *)(v0 + 184);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    sub_10000D848();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
    return v14();
  }
}

uint64_t sub_100006024()
{
  uint64_t v1 = *v0 + 16;
  uint64_t v2 = *v0 + 96;
  uint64_t v5 = *v0;
  swift_task_dealloc();
  sub_1000050E0(v2);
  sub_1000050E0(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t DefaultFeatureServiceFactory.deinit()
{
  sub_1000050E0(v0 + 16);
  return v0;
}

uint64_t DefaultFeatureServiceFactory.__deallocating_deinit()
{
  sub_1000050E0(v0 + 16);
  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t sub_1000061C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_100006294;
  return DefaultFeatureServiceFactory.create(featureFlagProvider:configProvider:accountDetailsProviderOverride:possibleOwners:)(a1, a2, a3, a4, a5);
}

uint64_t sub_100006294()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006388(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000063F0(&qword_100014AF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000063F0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006434(uint64_t a1)
{
  uint64_t v2 = sub_1000063F0(&qword_100014AF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for DefaultFeatureServiceFactory()
{
  return self;
}

uint64_t sub_1000064B8(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1000063F0(&qword_100014BF8);
  uint64_t v8 = sub_10000D0EC(v7);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000D8B8();
  sub_10000CE44();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  sub_10000CF20();
  uint64_t v15 = sub_10000D898();
  os_log_type_t v16 = sub_10000D928();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Building the AutoComplete index via SiriSuggestionsBookkeepingService", v17, 2u);
    sub_10000CEC0();
  }

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v11);
  uint64_t v18 = sub_10000D918();
  sub_10000D120((uint64_t)v10, v19, v20, v18);
  uint64_t v21 = sub_10000D108();
  *(void *)(v21 + 16) = 0;
  *(void *)(v21 + 24) = 0;
  *(unsigned char *)(v21 + 32) = a1 & 1;
  *(void *)(v21 + 40) = a2;
  *(void *)(v21 + 48) = a3;
  swift_retain();
  sub_100006870((uint64_t)v10, (uint64_t)&unk_100014C88, v21);
  return swift_release();
}

uint64_t sub_100006664(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 16) = a5;
  *(void *)(v6 + 24) = a6;
  *(unsigned char *)(v6 + 56) = a4;
  return _swift_task_switch(sub_100006688, 0, 0);
}

uint64_t sub_100006688()
{
  sub_10000CE78();
  sub_10000D668();
  *(void *)(v0 + 32) = sub_10000D658();
  uint64_t v1 = (void *)sub_10000CEF4();
  *(void *)(v0 + 40) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006734;
  uint64_t v2 = *(unsigned __int8 *)(v0 + 56);
  return v4(v2);
}

uint64_t sub_100006734()
{
  sub_10000CE78();
  sub_10000CE2C();
  sub_10000CE94();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 48) = v3;
  swift_task_dealloc();
  sub_10000CEE8();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_100006804()
{
  sub_10000CE78();
  (*(void (**)(void))(v0 + 16))(*(void *)(v0 + 48));
  swift_release();
  sub_10000CF14();
  return v1();
}

uint64_t sub_100006870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000D918();
  if (sub_10000B15C(a1, 1, v6) == 1)
  {
    sub_10000C1E8(a1, &qword_100014BF8);
  }
  else
  {
    sub_10000D908();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000D8F8();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100006A74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007280(a1, a2, a3, "Apps Installed %s - Re-Building some parts of the AutoComplete index via SiriSuggestionsBookkeepingService", (uint64_t)&unk_100010850, (uint64_t)&unk_100014C60, (void (*)(uint64_t, uint64_t, void *))sub_1000070C0);
}

uint64_t sub_100006AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  uint64_t v7 = sub_10000D8B8();
  v6[6] = v7;
  v6[7] = *(void *)(v7 - 8);
  v6[8] = swift_task_alloc();
  uint64_t v8 = sub_10000D9B8();
  v6[9] = v8;
  v6[10] = *(void *)(v8 - 8);
  v6[11] = swift_task_alloc();
  return _swift_task_switch(sub_100006BD0, 0, 0);
}

uint64_t sub_100006BD0()
{
  sub_10000CE78();
  sub_10000D9A8();
  uint64_t v1 = (void *)sub_10000CEF4();
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006C80;
  sub_10000CEE8();
  return v3();
}

uint64_t sub_100006C80()
{
  sub_10000CFAC();
  sub_10000CE2C();
  sub_10000CE94();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_10000CE84();
  *uint64_t v5 = v4;
  *(void *)(v6 + 104) = v0;
  swift_task_dealloc();
  uint64_t v7 = sub_10000D14C();
  v8(v7);
  sub_10000CEE8();
  return _swift_task_switch(v9, v10, v11);
}

uint64_t sub_100006DAC()
{
  sub_10000CE78();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000CF14();
  return v0();
}

uint64_t sub_100006E14()
{
  sub_10000CE78();
  sub_10000D668();
  v0[14] = sub_10000D658();
  uint64_t v1 = (void *)sub_10000CEF4();
  v0[15] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006EB8;
  uint64_t v2 = sub_10000D02C(v0[3]);
  return v3(v2);
}

uint64_t sub_100006EB8()
{
  sub_10000CE78();
  sub_10000CE2C();
  sub_10000CE94();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 128) = v3;
  swift_task_dealloc();
  sub_10000CEE8();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_100006F88()
{
  sub_10000D058();
  sub_10000CF88();
  sub_10000D748();
  uint64_t v1 = sub_10000D898();
  os_log_type_t v2 = sub_10000D938();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[16];
    uint64_t v4 = (uint8_t *)sub_10000CF94();
    *(_DWORD *)uint64_t v4 = 134217984;
    v0[2] = v3;
    sub_10000D958();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "SiriAutoCompleteIndexBuilder updateIndexForAppInstall done. Added %ld phrases", v4, 0xCu);
    sub_10000CEC0();
  }

  uint64_t v5 = v0[16];
  uint64_t v6 = (void (*)(uint64_t))v0[4];
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  v6(v5);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000D0F8();
  sub_10000CFB8();
  return v8(v7, v8, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_1000070C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10000D918();
  if (sub_10000B15C(a1, 1, v5) == 1)
  {
    sub_10000C1E8(a1, &qword_100014BF8);
  }
  else
  {
    sub_10000D908();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000D8F8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_100007244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007280(a1, a2, a3, "%s UnInstalled - clearing phrases in SiriSuggestionsBookkeepingService", (uint64_t)&unk_100010828, (uint64_t)&unk_100014C50, (void (*)(uint64_t, uint64_t, void *))sub_100006870);
}

uint64_t sub_100007280(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, void *))
{
  uint64_t v14 = sub_1000063F0(&qword_100014BF8);
  uint64_t v15 = sub_10000D0EC(v14);
  __chkstk_darwin(v15);
  sub_10000D004();
  sub_10000CE44();
  uint64_t v35 = v17;
  uint64_t v36 = v16;
  __chkstk_darwin(v16);
  sub_10000CF20();
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_10000D898();
  os_log_type_t v19 = sub_10000D928();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v33 = a3;
    uint64_t v32 = v8;
    uint64_t v20 = (uint8_t *)sub_10000CF94();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v21 = a2;
    uint64_t v22 = sub_10000D8E8();
    unint64_t v24 = v23;
    swift_bridgeObjectRelease();
    uint64_t v25 = v22;
    a2 = v21;
    uint64_t v26 = sub_10000B860(v25, v24, &v37);
    sub_10000D160(v26);
    sub_10000D958();
    swift_bridgeObjectRelease_n();
    a3 = v33;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, a4, v20, 0xCu);
    swift_arrayDestroy();
    sub_10000CEC0();
    uint64_t v8 = v32;
    sub_10000CEC0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v7, v36);
  uint64_t v27 = sub_10000D918();
  sub_10000D120(v8, v28, v29, v27);
  v30 = (void *)sub_10000D108();
  v30[2] = 0;
  v30[3] = 0;
  v30[4] = a1;
  v30[5] = a2;
  v30[6] = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  a7(v8, a6, v30);
  return swift_release();
}

uint64_t sub_100007504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  uint64_t v7 = sub_10000D8B8();
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  return _swift_task_switch(sub_1000075C8, 0, 0);
}

uint64_t sub_1000075C8()
{
  sub_10000CE78();
  sub_10000D668();
  v0[10] = sub_10000D658();
  uint64_t v1 = (void *)sub_10000CEF4();
  v0[11] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000766C;
  uint64_t v2 = sub_10000D02C(v0[4]);
  return v3(v2);
}

uint64_t sub_10000766C()
{
  sub_10000CE78();
  sub_10000CE2C();
  sub_10000CE94();
  void *v2 = v1;
  void *v2 = *v0;
  *(unsigned char *)(v1 + 96) = v3;
  swift_task_dealloc();
  sub_10000CEE8();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_10000773C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_10000D088();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  sub_10000D748();
  swift_bridgeObjectRetain_n();
  uint64_t v27 = sub_10000D898();
  os_log_type_t v28 = sub_10000D938();
  if (os_log_type_enabled(v27, v28))
  {
    HIDWORD(a9) = *(unsigned __int8 *)(v24 + 96);
    a10 = *(void *)(v24 + 64);
    a11 = *(void *)(v24 + 56);
    a12 = *(void *)(v24 + 72);
    uint64_t v29 = swift_slowAlloc();
    a13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_10000D8E8();
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    *(void *)(v24 + 16) = sub_10000B860(v30, v32, &a13);
    sub_10000D958();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v29 + 12) = 2080;
    if (HIDWORD(a9)) {
      uint64_t v33 = 0x7566736563637573;
    }
    else {
      uint64_t v33 = 0x6C69616620747562;
    }
    if (HIDWORD(a9)) {
      unint64_t v34 = 0xEB00000000796C6CLL;
    }
    else {
      unint64_t v34 = 0xEA00000000006465;
    }
    *(void *)(v24 + 24) = sub_10000B860(v33, v34, &a13);
    sub_10000D958();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "SiriAutoCompleteIndexBuilder deletePhrasesFromApp with %s function %s", (uint8_t *)v29, 0x16u);
    swift_arrayDestroy();
    sub_10000CEC0();
    sub_10000CEC0();

    (*(void (**)(uint64_t, uint64_t))(a10 + 8))(a12, a11);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v35 = sub_10000D14C();
    v36(v35);
  }
  (*(void (**)(void))(v24 + 40))(*(unsigned __int8 *)(v24 + 96));
  swift_release();
  swift_task_dealloc();
  sub_10000CF14();
  sub_10000D03C();
  return v38(v37, v38, v39, v40, v41, v42, v43, v44, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_100007A00(void *a1, int a2, int a3, void *aBlock, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = sub_10000D8D8();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  id v14 = a1;
  a8(v12, a7, v13);

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_100007ABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = sub_1000063F0(&qword_100014BF8);
  uint64_t v9 = sub_10000D0EC(v8);
  __chkstk_darwin(v9);
  uint64_t v10 = sub_10000D004();
  sub_10000CE44();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  sub_10000CF20();
  swift_bridgeObjectRetain_n();
  id v14 = sub_10000D898();
  os_log_type_t v15 = sub_10000D928();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v26 = a2;
    uint64_t v27 = a3;
    uint64_t v16 = (uint8_t *)sub_10000CF94();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_10000D8E8();
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    uint64_t v20 = sub_10000B860(v17, v19, &v28);
    sub_10000D160(v20);
    sub_10000D958();
    swift_bridgeObjectRelease_n();
    a2 = v26;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Rebuilding partial index for sources: %s via SiriSuggestionsBookkeepingService", v16, 0xCu);
    swift_arrayDestroy();
    sub_10000CEC0();
    a3 = v27;
    sub_10000CEC0();

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v3, v10);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v3, v10);
  }
  uint64_t v21 = sub_10000D918();
  sub_10000D120(v4, v22, v23, v21);
  uint64_t v24 = (void *)sub_10000D108();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = a1;
  v24[5] = a2;
  v24[6] = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100006870(v4, (uint64_t)&unk_100014C40, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_100007D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return _swift_task_switch(sub_100007D5C, 0, 0);
}

uint64_t sub_100007D5C()
{
  sub_10000CE78();
  sub_10000D668();
  v0[5] = sub_10000D658();
  uint64_t v1 = (void *)sub_10000CEF4();
  v0[6] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100007E00;
  uint64_t v2 = sub_10000D02C(v0[2]);
  return v3(v2);
}

uint64_t sub_100007E00()
{
  sub_10000CE78();
  sub_10000CE2C();
  sub_10000CE94();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 56) = v3;
  swift_task_dealloc();
  sub_10000CEE8();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_100007ED0()
{
  sub_10000CE78();
  (*(void (**)(void))(v0 + 24))(*(void *)(v0 + 56));
  swift_release();
  sub_10000CF14();
  return v1();
}

void sub_100007F78(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, const void *a9)
{
  v52 = a8;
  uint64_t v57 = a6;
  uint64_t v58 = a7;
  uint64_t v50 = a5;
  uint64_t v61 = a3;
  uint64_t v62 = a4;
  v69 = a1;
  uint64_t v70 = a2;
  uint64_t v9 = sub_10000D8B8();
  uint64_t v64 = *(void *)(v9 - 8);
  uint64_t v65 = v9;
  __chkstk_darwin(v9);
  v67 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_10000D5E8();
  uint64_t v51 = *(void *)(v56 - 8);
  uint64_t v11 = *(void *)(v51 + 64);
  __chkstk_darwin(v56);
  v54 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000063F0(&qword_100014BF8);
  __chkstk_darwin(v12 - 8);
  uint64_t v53 = (uint64_t)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_10000D648();
  uint64_t v55 = *(void *)(v60 - 8);
  uint64_t v14 = *(void *)(v55 + 64);
  uint64_t v15 = __chkstk_darwin(v60);
  v63 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v45 - v16;
  uint64_t v18 = sub_10000D6E8();
  uint64_t v59 = *(void *)(v18 - 8);
  uint64_t v19 = *(void *)(v59 + 64);
  uint64_t v20 = __chkstk_darwin(v18);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v45 - v21;
  uint64_t v68 = swift_allocObject();
  *(void *)(v68 + 16) = a9;
  sub_10000D558();
  swift_allocObject();
  _Block_copy(a9);
  uint64_t v23 = sub_10000D548();
  uint64_t v72 = 200;
  sub_1000063F0(&qword_100014CB8);
  sub_10000C9A0();
  uint64_t v70 = v23;
  sub_10000D538();
  v66 = a9;
  uint64_t v49 = v19;
  uint64_t v48 = v14;
  v69 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = v63;
  uint64_t v25 = v60;
  uint64_t v26 = v71;
  sub_10000CA8C(&qword_100014CD0, (void (*)(uint64_t))&type metadata accessor for DeliveryVehicle);
  sub_10000D538();
  uint64_t v62 = v26;
  sub_10000CA8C(&qword_100014CA0, (void (*)(uint64_t))&type metadata accessor for FeatureRequirementsTransport);
  sub_10000D538();
  uint64_t v27 = sub_10000D918();
  sub_10000B064(v53, 1, 1, v27);
  uint64_t v28 = v55;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  v47 = v17;
  v29(v24, v17, v25);
  uint64_t v30 = v59;
  unint64_t v31 = *(void (**)(char *, char *, uint64_t))(v59 + 16);
  v46 = v22;
  uint64_t v45 = v18;
  v31(v69, v22, v18);
  uint64_t v32 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v54, v50, v56);
  unint64_t v33 = (*(unsigned __int8 *)(v28 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  unint64_t v34 = (v48 + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (*(unsigned __int8 *)(v30 + 80) + v34 + 8) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  unint64_t v36 = (v49 + *(unsigned __int8 *)(v32 + 80) + v35) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  v67 = (char *)((v11 + v36 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = 0;
  *(void *)(v37 + 24) = 0;
  v38 = v52;
  *(void *)(v37 + 32) = v52;
  uint64_t v39 = (char *)(v37 + v33);
  uint64_t v40 = v55;
  (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v39, v63, v25);
  *(void *)(v37 + v34) = v62;
  uint64_t v41 = v45;
  (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v37 + v35, v69, v45);
  (*(void (**)(unint64_t, char *, uint64_t))(v32 + 32))(v37 + v36, v54, v56);
  uint64_t v42 = v68;
  uint64_t v43 = &v67[v37];
  *(void *)uint64_t v43 = sub_10000CE00;
  *((void *)v43 + 1) = v42;
  id v44 = v38;
  swift_retain();
  sub_100006870(v53, (uint64_t)&unk_100014CE0, v37);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v47, v25);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v46, v41);
  swift_release();
  _Block_release(a9);
}

uint64_t sub_1000087F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[11] = v13;
  v8[12] = v14;
  v8[9] = a7;
  v8[10] = a8;
  v8[8] = a6;
  uint64_t v9 = sub_10000D8B8();
  v8[13] = v9;
  v8[14] = *(void *)(v9 - 8);
  v8[15] = swift_task_alloc();
  uint64_t v10 = (void *)swift_task_alloc();
  v8[16] = v10;
  void *v10 = v8;
  v10[1] = sub_100008914;
  return sub_100008D90();
}

uint64_t sub_100008914()
{
  sub_10000CE78();
  sub_10000CE2C();
  uint64_t v1 = *v0;
  sub_10000CE84();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10000CEE8();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_1000089DC()
{
  sub_10000CFAC();
  sub_100005AF4(v0 + 2, v0[5]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[17] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100008A84;
  uint64_t v2 = sub_10000CFCC();
  return dispatch thunk of SuggestionsLogger.log(from:deliveryVehicle:generationId:)(v2);
}

uint64_t sub_100008A84()
{
  sub_10000CE78();
  sub_10000CE2C();
  sub_10000CE94();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_10000CE84();
  *uint64_t v5 = v4;
  *(void *)(v6 + 144) = v0;
  swift_task_dealloc();
  sub_10000CEE8();
  return _swift_task_switch(v7, v8, v9);
}

void sub_100008D2C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_10000D5A8();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_100008D90()
{
  sub_10000CE78();
  v1[28] = v2;
  v1[29] = v0;
  v1[27] = v3;
  uint64_t v4 = sub_10000D7E8();
  sub_10000D0EC(v4);
  v1[30] = swift_task_alloc();
  sub_10000CEE8();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_100008E18()
{
  sub_10000CFAC();
  sub_10000D878();
  sub_10000D618();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100008EDC;
  uint64_t v2 = *(void *)(v0 + 240);
  return static SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider.createProvider(from:)(v0 + 16, v2);
}

uint64_t sub_100008EDC()
{
  sub_10000CE78();
  sub_10000CE2C();
  uint64_t v2 = *(void *)(v1 + 240);
  uint64_t v3 = *v0;
  sub_10000CE84();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  sub_10000C07C(v2);
  sub_10000CEE8();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_100008FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_10000D088();
  uint64_t v17 = v16;
  uint64_t v18 = (uint64_t)(v16 + 2);
  uint64_t v43 = v16 + 7;
  uint64_t v19 = v16[29];
  uint64_t v20 = (void *)(v19
                 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_suggestionsLoggerFactory);
  uint64_t v21 = *(void *)(v19
                  + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_suggestionsLoggerFactory
                  + 24);
  v16[32] = v21;
  v16[33] = v20[4];
  v16[34] = (uint64_t)sub_100005AF4(v20, v21);
  uint64_t v22 = *(void *)(v19
                  + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_featureServiceFactory
                  + 32);
  uint64_t v23 = sub_100005AF4((void *)(v19+ OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_featureServiceFactory), *(void *)(v19+ OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_featureServiceFactory+ 24));
  uint64_t v41 = v19 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_featureFlagProvider;
  uint64_t v42 = v23;
  sub_10000D638();
  uint64_t v24 = v16[15];
  uint64_t v25 = v16[16];
  uint64_t v26 = sub_100005AF4(v16 + 12, v24);
  v17[20] = v24;
  v17[21] = *(void *)(v25 + 8);
  uint64_t v27 = sub_100005BAC(v17 + 17);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(v27, v26, v24);
  sub_1000052B8(v18, (uint64_t)(v17 + 22));
  sub_10000D6D8();
  sub_10000D628();
  v17[35] = sub_10000D6C8();
  uint64_t v40 = *(void *)(v22 + 8) + **(int **)(v22 + 8);
  uint64_t v28 = (void *)swift_task_alloc();
  v17[36] = (uint64_t)v28;
  *uint64_t v28 = v17;
  v28[1] = sub_1000091B8;
  sub_10000D03C();
  return v37(v29, v30, v31, v32, v33, v34, v35, v36, v40, v22 + 8, v41, v42, v43, a14, a15, a16);
}

uint64_t sub_1000091B8()
{
  sub_10000CFAC();
  sub_10000CE2C();
  sub_10000CE94();
  void *v2 = v1;
  uint64_t v3 = v1 + 96;
  uint64_t v4 = v1 + 136;
  uint64_t v5 = v1 + 176;
  uint64_t v6 = *v0;
  sub_10000CE84();
  *uint64_t v7 = v6;
  swift_task_dealloc();
  swift_release();
  sub_10000C1E8(v5, &qword_100014AF8);
  sub_1000050E0(v4);
  sub_1000050E0(v3);
  sub_10000CEE8();
  return _swift_task_switch(v8, v9, v10);
}

uint64_t sub_1000092CC()
{
  sub_10000CFAC();
  sub_10000D608();
  sub_1000050E0(v0 + 56);
  sub_1000050E0(v0 + 16);
  swift_task_dealloc();
  sub_10000CF14();
  return v1();
}

void sub_10000935C(char *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, const void *a9)
{
  uint64_t v57 = a8;
  uint64_t v63 = a6;
  uint64_t v64 = a7;
  uint64_t v67 = a4;
  uint64_t v68 = a5;
  uint64_t v55 = a3;
  v78 = a1;
  v79 = a2;
  uint64_t v9 = sub_10000D8B8();
  v73 = *(char **)(v9 - 8);
  v74 = (char *)v9;
  __chkstk_darwin(v9);
  v75 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_10000D5E8();
  uint64_t v56 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v66 = v11;
  uint64_t v60 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000063F0(&qword_100014BF8);
  __chkstk_darwin(v12 - 8);
  uint64_t v59 = (uint64_t)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_10000D648();
  uint64_t v62 = *(void *)(v71 - 8);
  uint64_t v14 = *(void *)(v62 + 64);
  uint64_t v15 = __chkstk_darwin(v71);
  uint64_t v58 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v70 = (char *)&v52 - v16;
  uint64_t v72 = sub_10000D6B8();
  uint64_t v65 = *(void *)(v72 - 8);
  uint64_t v17 = *(void *)(v65 + 64);
  uint64_t v18 = __chkstk_darwin(v72);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v52 - v19;
  uint64_t v21 = sub_10000D728();
  uint64_t v69 = *(void *)(v21 - 8);
  uint64_t v22 = *(void *)(v69 + 64);
  uint64_t v23 = __chkstk_darwin(v21);
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v52 - v24;
  uint64_t v76 = swift_allocObject();
  *(void *)(v76 + 16) = a9;
  sub_10000D558();
  swift_allocObject();
  v77 = a9;
  _Block_copy(a9);
  uint64_t v26 = sub_10000D548();
  uint64_t v80 = 200;
  sub_10000CA8C(&qword_100014C90, (void (*)(uint64_t))&type metadata accessor for Action);
  sub_10000D538();
  v78 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = v17;
  v79 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v66;
  uint64_t v54 = v21;
  uint64_t v29 = v70;
  uint64_t v28 = v71;
  sub_10000CA8C(&qword_100014C98, (void (*)(uint64_t))&type metadata accessor for InvocationType);
  sub_10000D538();
  sub_10000CA8C(&qword_100014CA0, (void (*)(uint64_t))&type metadata accessor for FeatureRequirementsTransport);
  sub_10000D538();
  uint64_t v30 = v69;
  v75 = (char *)v26;
  uint64_t v31 = sub_10000D918();
  sub_10000B064(v59, 1, 1, v31);
  uint64_t v32 = v62;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v58, v29, v28);
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v78, v25, v54);
  uint64_t v33 = v56;
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v60, v55, v61);
  v74 = v25;
  uint64_t v34 = v65;
  (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v79, v20, v72);
  unint64_t v35 = (*(unsigned __int8 *)(v32 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  unint64_t v36 = (v14 + *(unsigned __int8 *)(v30 + 80) + v35) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  unint64_t v37 = (v22 + *(unsigned __int8 *)(v33 + 80) + v36) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v38 = *(unsigned __int8 *)(v34 + 80);
  v73 = v20;
  unint64_t v39 = (v27 + v38 + v37) & ~v38;
  unint64_t v40 = (v53 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v41 = (void *)swift_allocObject();
  uint64_t v42 = v28;
  uint64_t v43 = (uint64_t)v41;
  v41[2] = 0;
  v41[3] = 0;
  id v44 = v57;
  v41[4] = v57;
  uint64_t v45 = (char *)v41 + v35;
  uint64_t v46 = v62;
  (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v45, v58, v42);
  (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v43 + v36, v78, v54);
  (*(void (**)(unint64_t, char *, uint64_t))(v33 + 32))(v43 + v37, v60, v61);
  uint64_t v47 = v72;
  (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v43 + v39, v79, v72);
  uint64_t v48 = (void (**)(uint64_t))(v43 + v40);
  uint64_t v49 = v76;
  *uint64_t v48 = sub_10000C62C;
  v48[1] = (void (*)(uint64_t))v49;
  id v50 = v44;
  swift_retain();
  sub_100006870(v59, (uint64_t)&unk_100014CB0, v43);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v70, v71);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v73, v47);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v74, v54);
  uint64_t v51 = v77;
  swift_release();
  _Block_release(v51);
}

uint64_t sub_100009D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[11] = v13;
  v8[12] = v14;
  v8[9] = a7;
  v8[10] = a8;
  v8[8] = a6;
  uint64_t v9 = sub_10000D8B8();
  v8[13] = v9;
  v8[14] = *(void *)(v9 - 8);
  v8[15] = swift_task_alloc();
  uint64_t v10 = (void *)swift_task_alloc();
  v8[16] = v10;
  void *v10 = v8;
  v10[1] = sub_100009E2C;
  return sub_100008D90();
}

uint64_t sub_100009E2C()
{
  sub_10000CE78();
  sub_10000CE2C();
  uint64_t v1 = *v0;
  sub_10000CE84();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10000CEE8();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_100009EF4()
{
  sub_10000CFAC();
  sub_100005AF4(v0 + 2, v0[5]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[17] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100009F9C;
  uint64_t v2 = sub_10000CFCC();
  return dispatch thunk of SuggestionsLogger.logEngagement(for:with:invocationType:)(v2);
}

uint64_t sub_100009F9C()
{
  sub_10000CE78();
  sub_10000CE2C();
  sub_10000CE94();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_10000CE84();
  *uint64_t v5 = v4;
  *(void *)(v6 + 144) = v0;
  swift_task_dealloc();
  sub_10000CEE8();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_10000A078()
{
  sub_10000CE78();
  uint64_t v1 = *(void (**)(void))(v0 + 88);
  sub_1000050E0(v0 + 16);
  v1(0);
  swift_task_dealloc();
  sub_10000CF14();
  return v2();
}

uint64_t sub_10000A0E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_10000D06C();
  sub_10000D0E0();
  sub_1000050E0((uint64_t)(v12 + 2));
  sub_10000D748();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v13 = sub_10000D898();
  os_log_type_t v14 = sub_10000D938();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)sub_10000CF94();
    uint64_t v16 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 138412290;
    swift_errorRetain();
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    v12[7] = v17;
    sub_10000D958();
    void *v16 = v17;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "SiriSuggestionsBookkeepingService log failed. error: %@", v15, 0xCu);
    sub_1000063F0(&qword_100014C20);
    swift_arrayDestroy();
    sub_10000CEC0();
    sub_10000CEC0();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v18 = v12[18];
  uint64_t v19 = (void (*)(uint64_t))v12[11];

  sub_10000D0A4();
  v20();
  swift_errorRetain();
  v19(v18);
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  sub_10000CF14();
  sub_10000D0B4();
  return v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

uint64_t sub_10000A484(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1000063F0(&qword_100014BF8);
  uint64_t v6 = sub_10000D0EC(v5);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000D918();
  sub_10000D120((uint64_t)v8, v10, v11, v9);
  uint64_t v12 = (void *)sub_10000D108();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v2;
  void v12[5] = a1;
  v12[6] = a2;
  id v13 = v2;
  swift_retain();
  sub_100006870((uint64_t)v8, (uint64_t)&unk_100014C08, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_10000A560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  uint64_t v7 = sub_10000D8B8();
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  v6[10] = swift_task_alloc();
  v6[11] = sub_10000D7E8();
  v6[12] = swift_task_alloc();
  v6[13] = swift_task_alloc();
  return _swift_task_switch(sub_10000A674, 0, 0);
}

uint64_t sub_10000A674()
{
  sub_10000CF88();
  uint64_t v1 = (void *)(v0[4]
                + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_accountService);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100005AF4(v1, v2);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[14] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10000A784;
  uint64_t v5 = v0[13];
  return v7(v5, v2, v3);
}

uint64_t sub_10000A784()
{
  sub_10000CE78();
  sub_10000CE2C();
  sub_10000CE94();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_10000CE84();
  *uint64_t v5 = v4;
  *(void *)(v6 + 120) = v0;
  swift_task_dealloc();
  sub_10000CEE8();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_10000A860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24)
{
  sub_10000D088();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  uint64_t v27 = v24[12];
  uint64_t v28 = v24[13];
  sub_10000D748();
  sub_10000C018(v28, v27);
  uint64_t v29 = sub_10000D898();
  os_log_type_t v30 = sub_10000D928();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = v24[12];
    uint64_t v32 = v24[8];
    a10 = v24[7];
    a11 = v24[10];
    uint64_t v33 = (uint8_t *)sub_10000CF94();
    a12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315138;
    uint64_t v34 = sub_10000D7D8();
    v24[3] = sub_10000B860(v34, v35, &a12);
    sub_10000D958();
    swift_bridgeObjectRelease();
    sub_10000C07C(v31);
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Got account details as: %s", v33, 0xCu);
    swift_arrayDestroy();
    sub_10000CEC0();
    sub_10000CEC0();

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(a11, a10);
  }
  else
  {
    uint64_t v36 = v24[10];
    uint64_t v37 = v24[7];
    uint64_t v38 = v24[8];
    sub_10000C07C(v24[12]);

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
  }
  uint64_t v39 = v24[15];
  sub_10000D598();
  swift_allocObject();
  sub_10000D588();
  sub_10000D568();
  sub_10000CA8C(&qword_100014C28, (void (*)(uint64_t))&type metadata accessor for SiriSuggestionsIntelligence.AccountDetails);
  uint64_t v40 = sub_10000D578();
  uint64_t v42 = v24[13];
  if (v39)
  {
    sub_10000C07C(v24[13]);
    swift_release();
    sub_10000D748();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v43 = sub_10000D898();
    os_log_type_t v44 = sub_10000D948();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)sub_10000CF94();
      uint64_t v46 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 138412290;
      swift_errorRetain();
      uint64_t v47 = _swift_stdlib_bridgeErrorToNSError();
      v24[2] = v47;
      sub_10000D958();
      void *v46 = v47;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Unable to get account details. Error: %@", v45, 0xCu);
      sub_1000063F0(&qword_100014C20);
      swift_arrayDestroy();
      sub_10000CEC0();
      sub_10000CEC0();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v51 = (void (*)(void, unint64_t, uint64_t))v24[5];

    sub_10000D0A4();
    v52();
    swift_errorRetain();
    v51(0, 0xF000000000000000, v39);
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    uint64_t v48 = v40;
    unint64_t v49 = v41;
    id v50 = (void (*)(uint64_t, unint64_t, void))v24[5];
    sub_10000C0D8(v40, v41);
    v50(v48, v49, 0);
    sub_10000C130(v48, v49);
    swift_release();
    sub_10000C130(v48, v49);
    sub_10000C07C(v42);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000CF14();
  sub_10000D03C();
  return v54(v53, v54, v55, v56, v57, v58, v59, v60, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_10000AC6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_10000D06C();
  sub_10000D0E0();
  uint64_t v13 = v12[15];
  sub_10000D748();
  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v14 = sub_10000D898();
  os_log_type_t v15 = sub_10000D948();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)sub_10000CF94();
    uint64_t v17 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 138412290;
    swift_errorRetain();
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    v12[2] = v18;
    sub_10000D958();
    *uint64_t v17 = v18;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Unable to get account details. Error: %@", v16, 0xCu);
    sub_1000063F0(&qword_100014C20);
    swift_arrayDestroy();
    sub_10000CEC0();
    sub_10000CEC0();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v19 = (void (*)(void, unint64_t, uint64_t))v12[5];

  sub_10000D0A4();
  v20();
  swift_errorRetain();
  v19(0, 0xF000000000000000, v13);
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000CF14();
  sub_10000D0B4();
  return v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

void sub_10000AED4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_10000D5A8();
      goto LABEL_6;
    }
  }
  else
  {
    Class isa = sub_10000D5B8().super.isa;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);
}

void sub_10000AF6C()
{
}

id sub_10000AFAC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriSuggestionsBookkeepingService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriSuggestionsBookkeepingService()
{
  return self;
}

uint64_t sub_10000B064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10000B08C()
{
  swift_unknownObjectRelease();

  swift_release();
  uint64_t v1 = sub_10000D0D0();
  return _swift_deallocObject(v1);
}

uint64_t sub_10000B0CC()
{
  sub_10000D058();
  sub_10000CF88();
  sub_10000CF48();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10000CED8(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10000CE08;
  sub_10000CEA0();
  sub_10000CFB8();
  return sub_10000A560(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10000B15C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10000B184(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000B260;
  return v6(a1);
}

uint64_t sub_10000B260()
{
  sub_10000CE78();
  sub_10000CE2C();
  uint64_t v1 = *v0;
  sub_10000CE84();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10000D0F8();
  return v3();
}

uint64_t sub_10000B320()
{
  swift_release();
  return _swift_deallocObject(v0);
}

uint64_t sub_10000B358()
{
  sub_10000CFAC();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_10000CED8(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_10000CE08;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100014C10 + dword_100014C10);
  return v7(v2, v3);
}

uint64_t sub_10000B404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_10000D998();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return _swift_task_switch(sub_10000B508, 0, 0);
}

uint64_t sub_10000B508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_10000D06C();
  sub_10000D0E0();
  uint64_t v13 = v12[10];
  uint64_t v14 = v12[8];
  uint64_t v15 = v12[9];
  sub_10000D9B8();
  sub_10000CA8C(&qword_100014C70, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  sub_10000D9F8();
  sub_10000CA8C(&qword_100014C78, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  sub_10000D9C8();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v12[12] = v16;
  v12[13] = (v15 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v16(v13, v14);
  uint64_t v17 = (void *)swift_task_alloc();
  v12[14] = v17;
  *uint64_t v17 = v12;
  v17[1] = sub_10000B68C;
  sub_10000D0B4();
  return dispatch thunk of Clock.sleep(until:tolerance:)(v18, v19, v20, v21, v22, v23, v24, v25, a9, a10, a11, a12);
}

uint64_t sub_10000B68C()
{
  sub_10000D058();
  sub_10000CF88();
  sub_10000CE2C();
  uint64_t v3 = v2;
  sub_10000CE94();
  *uint64_t v4 = v3;
  uint64_t v6 = (void (*)(uint64_t, uint64_t))v5[12];
  uint64_t v7 = v5[11];
  uint64_t v8 = v5[8];
  uint64_t v9 = *v1;
  sub_10000CE84();
  void *v10 = v9;
  *(void *)(v3 + 120) = v0;
  swift_task_dealloc();
  v6(v7, v8);
  if (v0)
  {
    sub_10000CEE8();
    sub_10000CFB8();
    return _swift_task_switch(v11, v12, v13);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    sub_10000D0F8();
    sub_10000CFB8();
    return v16(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

uint64_t sub_10000B7FC()
{
  sub_10000CE78();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000CF14();
  return v0();
}

uint64_t sub_10000B860(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000B934(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000C188((uint64_t)v12, *a3);
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
      sub_10000C188((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000050E0((uint64_t)v12);
  return v7;
}

uint64_t sub_10000B934(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10000BA8C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_10000D968();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_10000BB64(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_10000D988();
    if (!v8)
    {
      uint64_t result = sub_10000D9D8();
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

void *sub_10000BA8C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_10000D9E8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_10000BB64(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10000BBFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000BDD8(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000BDD8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10000BBFC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_10000D8C8();
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
  unint64_t v3 = sub_10000BD70(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_10000D978();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_10000D9E8();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_10000D9D8();
  __break(1u);
  return result;
}

void *sub_10000BD70(uint64_t a1, uint64_t a2)
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
  sub_1000063F0(&qword_100014C30);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10000BDD8(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000063F0(&qword_100014C30);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10000BF88(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000BEB0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_10000BEB0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_10000D9E8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_10000BF88(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_10000D9E8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_10000C018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000D7E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C07C(uint64_t a1)
{
  uint64_t v2 = sub_10000D7E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C0D8(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000C130(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000C188(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000C1E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000063F0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000C248()
{
  sub_10000D058();
  sub_10000CF88();
  sub_10000CF48();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10000CED8(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10000CE08;
  sub_10000CEA0();
  sub_10000CFB8();
  return sub_100007D38(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10000C2DC()
{
  sub_10000D058();
  sub_10000CF88();
  sub_10000CF48();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10000CED8(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10000CE08;
  sub_10000CEA0();
  sub_10000CFB8();
  return sub_100007504(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10000C370()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v0 = sub_10000D0D0();
  return _swift_deallocObject(v0);
}

uint64_t sub_10000C3B0()
{
  sub_10000D058();
  sub_10000CF88();
  sub_10000CF48();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10000CED8(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10000C440;
  sub_10000CEA0();
  sub_10000CFB8();
  return sub_100006AB0(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10000C440()
{
  sub_10000CE78();
  sub_10000CE2C();
  uint64_t v1 = *v0;
  sub_10000CE84();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10000CF14();
  return v3();
}

uint64_t sub_10000C500()
{
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v0 = sub_10000D0D0();
  return _swift_deallocObject(v0);
}

uint64_t sub_10000C538()
{
  sub_10000D058();
  sub_10000CF88();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10000CED8(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10000CE08;
  sub_10000CFB8();
  return sub_100006664(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10000C5EC()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0);
}

void sub_10000C624(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_10000AED4(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_10000C62C(uint64_t a1)
{
  sub_100008D2C(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000C634()
{
  uint64_t v23 = sub_10000D648();
  sub_10000CE44();
  uint64_t v2 = v1;
  unint64_t v19 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v22 = sub_10000D728();
  sub_10000CE44();
  uint64_t v6 = v5;
  unint64_t v18 = (v19 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v21 = sub_10000D5E8();
  sub_10000CE44();
  uint64_t v10 = v9;
  unint64_t v11 = (v18 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v20 = sub_10000D6B8();
  sub_10000CE44();
  uint64_t v15 = v14;
  unint64_t v16 = (v11 + v13 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  swift_unknownObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v19, v23);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v18, v22);
  (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v0 + v11, v21);
  (*(void (**)(unint64_t, uint64_t))(v15 + 8))(v0 + v16, v20);
  swift_release();
  return _swift_deallocObject(v0);
}

uint64_t sub_10000C81C()
{
  sub_10000D0E0();
  uint64_t v24 = v0;
  uint64_t v1 = sub_10000D648();
  sub_10000CE60(v1);
  uint64_t v2 = sub_10000D728();
  sub_10000CE60(v2);
  uint64_t v3 = sub_10000D5E8();
  sub_10000CE60(v3);
  uint64_t v4 = sub_10000D6B8();
  sub_10000CE60(v4);
  sub_10000CFE8();
  sub_10000D138();
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = (void *)sub_10000CED8(v5);
  *uint64_t v6 = v7;
  v6[1] = sub_10000C440;
  uint64_t v15 = sub_10000CF5C((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14, v24);
  return sub_100009D0C(v15, v16, v17, v18, v19, v20, v21, v22);
}

unint64_t sub_10000C9A0()
{
  unint64_t result = qword_100014CC0;
  if (!qword_100014CC0)
  {
    sub_10000CA44(&qword_100014CB8);
    sub_10000CA8C(&qword_100014CC8, (void (*)(uint64_t))&type metadata accessor for SiriSuggestions.Suggestion);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014CC0);
  }
  return result;
}

uint64_t sub_10000CA44(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000CA8C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000CAD4()
{
  uint64_t v17 = sub_10000D648();
  sub_10000CE44();
  uint64_t v2 = v1;
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v5 = (*(void *)(v4 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = sub_10000D6E8();
  sub_10000CE44();
  uint64_t v7 = v6;
  unint64_t v8 = (v5 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = sub_10000D5E8();
  sub_10000CE44();
  uint64_t v13 = v12;
  unint64_t v14 = (v8 + v10 + *(unsigned __int8 *)(v12 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  swift_unknownObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v17);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v7 + 8))(v0 + v8, v16);
  (*(void (**)(unint64_t, uint64_t))(v13 + 8))(v0 + v14, v11);
  swift_release();
  return _swift_deallocObject(v0);
}

uint64_t sub_10000CC78()
{
  sub_10000D0E0();
  uint64_t v23 = v0;
  uint64_t v1 = sub_10000D648();
  sub_10000CE60(v1);
  uint64_t v2 = sub_10000D6E8();
  sub_10000CE60(v2);
  uint64_t v3 = sub_10000D5E8();
  sub_10000CE60(v3);
  sub_10000CFE8();
  sub_10000D138();
  uint64_t v4 = swift_task_alloc();
  unint64_t v5 = (void *)sub_10000CED8(v4);
  *unint64_t v5 = v6;
  v5[1] = sub_10000CE08;
  uint64_t v14 = sub_10000CF5C((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13, v23);
  return sub_1000087F4(v14, v15, v16, v17, v18, v19, v20, v21);
}

uint64_t sub_10000CDD4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10000CDE8(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_10000CE60(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10000CEA0()
{
  return v0;
}

uint64_t sub_10000CEC0()
{
  return swift_slowDealloc();
}

uint64_t sub_10000CED8(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_10000CEF4()
{
  return swift_task_alloc();
}

uint64_t sub_10000CF14()
{
  return v0 + 8;
}

uint64_t sub_10000CF20()
{
  return sub_10000D748();
}

uint64_t sub_10000CF5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v9;
  return a9;
}

uint64_t sub_10000CF94()
{
  return swift_slowAlloc();
}

uint64_t sub_10000CFCC()
{
  return *(void *)(v0 + 64);
}

uint64_t sub_10000D004()
{
  return sub_10000D8B8();
}

uint64_t sub_10000D02C@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_10000D0D0()
{
  return v0;
}

uint64_t sub_10000D0EC(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10000D0F8()
{
  return v0 + 8;
}

uint64_t sub_10000D108()
{
  return swift_allocObject();
}

uint64_t sub_10000D120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000B064(a1, 1, 1, a4);
}

uint64_t sub_10000D14C()
{
  return v0;
}

uint64_t sub_10000D160(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_10000D174(uint64_t a1, void *a2)
{
  id v4 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP15SiriSuggestions41SiriSuggestionsBookkeepingServiceProtocol_];
  [a2 setExportedInterface:v4];

  sub_1000052B8(v2 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_suggestionsLoggerFactory, (uint64_t)v11);
  sub_1000052B8(v2 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_featureServiceFactory, (uint64_t)v10);
  sub_1000052B8(v2 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_featureFlagProvider, (uint64_t)v9);
  sub_10000D828();
  swift_allocObject();
  uint64_t v5 = sub_10000D818();
  id v6 = objc_allocWithZone((Class)type metadata accessor for SiriSuggestionsBookkeepingService());
  id v7 = sub_10000D444((uint64_t)v11, (uint64_t)v10, (uint64_t)v9, v5, v6);
  [a2 setExportedObject:v7];
  [a2 resume];

  return 1;
}

id sub_10000D2B4()
{
  id result = [self defaultStore];
  if (!result) {
    __break(1u);
  }
  return result;
}

void sub_10000D34C()
{
}

id sub_10000D38C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BookkeepingServiceDelegate()
{
  return self;
}

id sub_10000D444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v13[3] = sub_10000D828();
  v13[4] = &protocol witness table for SiriSuggestionsIntelligence.AppleAccountService;
  v13[0] = a4;
  sub_1000052B8(a1, (uint64_t)a5+ OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_suggestionsLoggerFactory);
  sub_1000052B8(a2, (uint64_t)a5+ OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_featureServiceFactory);
  sub_1000052B8(a3, (uint64_t)a5+ OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_featureFlagProvider);
  sub_1000052B8((uint64_t)v13, (uint64_t)a5 + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService33SiriSuggestionsBookkeepingService_accountService);
  v12.receiver = a5;
  v12.super_class = (Class)type metadata accessor for SiriSuggestionsBookkeepingService();
  id v10 = objc_msgSendSuper2(&v12, "init");
  sub_1000050E0((uint64_t)v13);
  sub_1000050E0(a3);
  sub_1000050E0(a2);
  sub_1000050E0(a1);
  return v10;
}

uint64_t sub_10000D538()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:format:)();
}

uint64_t sub_10000D548()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_10000D558()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_10000D568()
{
  return dispatch thunk of PropertyListEncoder.outputFormat.setter();
}

uint64_t sub_10000D578()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_10000D588()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_10000D598()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_10000D5A8()
{
  return _convertErrorToNSError(_:)();
}

NSData sub_10000D5B8()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10000D5C8()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D5D8()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D5E8()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10000D5F8()
{
  return static InteractionStore.inProcess()();
}

uint64_t sub_10000D608()
{
  return dispatch thunk of SuggestionsLoggerFactory.create(featureService:)();
}

uint64_t sub_10000D618()
{
  return FeatureRequirementsTransport.accountDetails.getter();
}

uint64_t sub_10000D628()
{
  return FeatureRequirementsTransport.possibleOwners.getter();
}

uint64_t sub_10000D638()
{
  return FeatureRequirementsTransport.featureConfigWrapper.getter();
}

uint64_t sub_10000D648()
{
  return type metadata accessor for FeatureRequirementsTransport();
}

uint64_t sub_10000D658()
{
  return SiriAutoCompleteIndexBuilder.__allocating_init()();
}

uint64_t sub_10000D668()
{
  return type metadata accessor for SiriAutoCompleteIndexBuilder();
}

uint64_t sub_10000D678()
{
  return SiriRemembersLogger.init(donator:storeProvider:)();
}

uint64_t sub_10000D688()
{
  return type metadata accessor for SiriRemembersLogger();
}

uint64_t sub_10000D6B8()
{
  return type metadata accessor for InvocationType();
}

uint64_t sub_10000D6C8()
{
  return OwnerProviders.__allocating_init(owners:)();
}

uint64_t sub_10000D6D8()
{
  return type metadata accessor for OwnerProviders();
}

uint64_t sub_10000D6E8()
{
  return type metadata accessor for DeliveryVehicle();
}

uint64_t sub_10000D6F8()
{
  return dispatch thunk of FeatureFlagProvider.isFeatureExtractionEnabled()();
}

uint64_t sub_10000D708()
{
  return OSFeatureFlagProvider.__allocating_init()();
}

uint64_t sub_10000D718()
{
  return type metadata accessor for OSFeatureFlagProvider();
}

uint64_t sub_10000D728()
{
  return type metadata accessor for Action();
}

uint64_t sub_10000D738()
{
  return static Clocks.getSystemClock()();
}

uint64_t sub_10000D748()
{
  return static Logger.coreCategory.getter();
}

uint64_t sub_10000D758()
{
  return static Logger.initCategory.getter();
}

uint64_t sub_10000D768()
{
  return static Logger.makeSignpostID(log:)();
}

uint64_t sub_10000D778()
{
  return static Logger.end(_:_:log:telemetry:)();
}

uint64_t sub_10000D788()
{
  return static Logger.log.getter();
}

uint64_t sub_10000D798()
{
  return static Logger.begin(_:_:log:telemetry:)();
}

uint64_t sub_10000D7A8()
{
  return static Logger.subsystem.getter();
}

uint64_t sub_10000D7B8()
{
  return SiriSuggestionsIntelligence.FeatureLogger.init(featureService:siriRemembersLogger:loggingPolicy:)();
}

uint64_t sub_10000D7C8()
{
  return type metadata accessor for SiriSuggestionsIntelligence.FeatureLogger();
}

uint64_t sub_10000D7D8()
{
  return SiriSuggestionsIntelligence.AccountDetails.description.getter();
}

uint64_t sub_10000D7E8()
{
  return type metadata accessor for SiriSuggestionsIntelligence.AccountDetails();
}

uint64_t sub_10000D7F8()
{
  return type metadata accessor for SiriSuggestionsIntelligence.NoopAccountService();
}

uint64_t sub_10000D808()
{
  return SiriSuggestionsIntelligence.noopAccountService.unsafeMutableAddressor();
}

uint64_t sub_10000D818()
{
  return SiriSuggestionsIntelligence.AppleAccountService.init(accountStore:)();
}

uint64_t sub_10000D828()
{
  return type metadata accessor for SiriSuggestionsIntelligence.AppleAccountService();
}

uint64_t sub_10000D848()
{
  return static SiriSuggestionsIntelligence.getNoOpFeatureService()();
}

uint64_t sub_10000D868()
{
  return static SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider.createProvider(using:completion:)();
}

uint64_t sub_10000D878()
{
  return type metadata accessor for SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider();
}

uint64_t sub_10000D888()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_10000D898()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000D8A8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000D8B8()
{
  return type metadata accessor for Logger();
}

Swift::Int sub_10000D8C8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000D8D8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D8E8()
{
  return Array.description.getter();
}

uint64_t sub_10000D8F8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000D908()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10000D918()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10000D928()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000D938()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000D948()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000D958()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000D968()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000D978()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000D988()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000D998()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t sub_10000D9A8()
{
  return ContinuousClock.init()();
}

uint64_t sub_10000D9B8()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t sub_10000D9C8()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t sub_10000D9D8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000D9E8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000D9F8()
{
  return dispatch thunk of Clock.now.getter();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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