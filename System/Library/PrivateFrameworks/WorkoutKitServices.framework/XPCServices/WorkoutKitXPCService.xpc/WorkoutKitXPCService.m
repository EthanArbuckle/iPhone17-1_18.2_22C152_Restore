int main(int argc, const char **argv, const char **envp)
{
  id v3;

  qword_100020F80 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for ServiceDelegate()) init];
  v3 = [self serviceListener];
  qword_100020F88 = (uint64_t)v3;
  [v3 setDelegate:qword_100020F80];
  [v3 resume];
  return 0;
}

uint64_t type metadata accessor for ServiceDelegate()
{
  return self;
}

id sub_100004338()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

BOOL sub_10000436C(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_100004380@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100004390(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000439C(void *a1)
{
  if ([a1 valueForEntitlement:WorkoutKitPrivateEntitlementName])
  {
    sub_1000185D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_100004568((uint64_t)v11, (uint64_t)v12);
  if (!v13)
  {
    sub_100004614((uint64_t)v12);
    goto LABEL_8;
  }
  if (!swift_dynamicCast())
  {
LABEL_8:
    char v2 = 0;
    goto LABEL_9;
  }
  char v2 = v9;
LABEL_9:
  id v3 = [self interfaceWithProtocol:&OBJC_PROTOCOL___WorkoutKitXPCServiceProtocol];
  [a1 setExportedInterface:v3];

  LODWORD(v3) = [a1 processIdentifier];
  v4 = (objc_class *)type metadata accessor for WorkoutKitXPCService();
  v5 = objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService____lazy_storage___healthStore] = 0;
  *(void *)&v5[OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService____lazy_storage___queryClient] = 0;
  *(void *)&v5[OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService____lazy_storage___nanoSyncControl] = 0;
  v6 = &v5[OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_presentConfigurationCompletionHandler];
  void *v6 = 0;
  v6[1] = 0;
  *(_DWORD *)&v5[OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_requestingProcessIdentifier] = v3;
  v5[OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_hasPrivateEntitlements] = v2;
  v10.receiver = v5;
  v10.super_class = v4;
  id v7 = objc_msgSendSuper2(&v10, "init");
  [a1 setExportedObject:v7];
  [a1 resume];

  return 1;
}

uint64_t sub_100004568(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000045D0(&qword_100020C80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000045D0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004614(uint64_t a1)
{
  uint64_t v2 = sub_1000045D0(&qword_100020C80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for WorkoutKitXPC_ActivityType(uint64_t a1)
{
}

void type metadata accessor for WOPersistencePermissionState(uint64_t a1)
{
}

void sub_10000469C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_1000046E4()
{
  uint64_t v1 = OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService____lazy_storage___healthStore;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService____lazy_storage___healthStore);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService____lazy_storage___healthStore);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)HKHealthStore) init];
    v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_100004758()
{
  uint64_t v1 = OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService____lazy_storage___queryClient;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService____lazy_storage___queryClient);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService____lazy_storage___queryClient);
  }
  else
  {
    uint64_t v4 = v0;
    sub_1000046E4();
    id v5 = objc_allocWithZone((Class)sub_100018210());
    id v6 = (void *)sub_100018220();
    id v7 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id sub_1000047DC()
{
  uint64_t v1 = OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService____lazy_storage___nanoSyncControl;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService____lazy_storage___nanoSyncControl);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService____lazy_storage___nanoSyncControl);
  }
  else
  {
    id v4 = sub_1000046E4();
    id v5 = [objc_allocWithZone((Class)HKNanoSyncControl) initWithHealthStore:v4];

    id v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

id sub_10000489C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorkoutKitXPCService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for WorkoutKitXPCService()
{
  return self;
}

uint64_t sub_100004964(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_10000498C(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_100017E20();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

void sub_100004CAC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_100004F28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v3 = sub_100017EB0();
  __chkstk_darwin(v3 - 8);
  uint64_t v18 = sub_100017F90();
  uint64_t v4 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  id v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100017F80();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  objc_super v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100017EF0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for WorkoutGoal.open(_:), v7);
      sub_100017EE0();
      uint64_t v15 = v18;
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v6, v14, v11);
      (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for WorkoutPlan.Workout.goal(_:), v15);
      sub_100017EA0();
      sub_100018010();
      return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    default:
      type metadata accessor for WorkoutKitXPC_ActivityType(0);
      uint64_t v20 = a1;
      sub_100018720();
      __break(1u);
      JUMPOUT(0x1000052B8);
  }
}

uint64_t sub_1000052C8(char a1, uint64_t a2, void (*a3)(char *, uint64_t))
{
  uint64_t v6 = sub_1000045D0(&qword_100020E28);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    sub_100017FE0();
    uint64_t v9 = sub_100017EB0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
    a2 = 0;
  }
  else
  {
    uint64_t v10 = sub_100017EB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  a3(v8, a2);
  return sub_100013C5C((uint64_t)v8, &qword_100020E28);
}

void sub_100005498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000045D0(&qword_100020E28);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013A3C(a1, (uint64_t)v8);
  uint64_t v9 = sub_100017EB0();
  uint64_t v10 = *(void *)(v9 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
  {
    Class isa = sub_100017E80().super.isa;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  }
  if (a2) {
    uint64_t v12 = (void *)sub_100017E20();
  }
  else {
    uint64_t v12 = 0;
  }
  (*(void (**)(uint64_t, Class, void *))(a3 + 16))(a3, isa, v12);
}

void sub_1000056F8(char a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void, void), uint64_t a6)
{
  uint64_t v12 = sub_100017EB0();
  uint64_t v54 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100018340();
  uint64_t v55 = *(void *)(v15 - 8);
  uint64_t v56 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v48 - v19;
  if (a1)
  {
    uint64_t v52 = a2;
    uint64_t v21 = a4 + 16;
    sub_100018320();
    id v22 = a3;
    v23 = sub_100018330();
    os_log_type_t v24 = sub_1000184D0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      v51 = a5;
      v26 = (uint8_t *)v25;
      uint64_t v49 = swift_slowAlloc();
      aBlock[0] = v49;
      uint64_t v53 = a6;
      *(_DWORD *)v26 = 136315138;
      v48 = v26 + 4;
      sub_100018110();
      sub_100013C14(&qword_100020E20, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v27 = sub_100018700();
      uint64_t v50 = v21;
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v14, v12);
      uint64_t v58 = sub_1000172BC(v27, v29, aBlock);
      a6 = v53;
      sub_1000185B0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "WorkoutKitXPCService: saved configuration: %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a5 = v51;
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v55 + 8))(v20, v56);
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    uint64_t v43 = v52;
    if (Strong)
    {
      v44 = (void *)Strong;
      id v45 = sub_1000047DC();

      uint64_t v46 = swift_allocObject();
      *(void *)(v46 + 16) = a5;
      *(void *)(v46 + 24) = a6;
      *(unsigned char *)(v46 + 32) = 1;
      *(void *)(v46 + 40) = v43;
      aBlock[4] = (uint64_t)sub_100013A08;
      aBlock[5] = v46;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1000049FC;
      aBlock[3] = (uint64_t)&unk_10001D5E0;
      v47 = _Block_copy(aBlock);
      swift_retain();
      swift_errorRetain();
      swift_release();
      [v45 forceNanoSyncWithOptions:0 completion:v47];

      _Block_release(v47);
    }
  }
  else
  {
    sub_100018320();
    id v30 = a3;
    swift_errorRetain();
    id v31 = v30;
    swift_errorRetain();
    v32 = sub_100018330();
    os_log_type_t v33 = sub_1000184E0();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v53 = a6;
      uint64_t v35 = v34;
      uint64_t v52 = swift_slowAlloc();
      aBlock[0] = v52;
      *(_DWORD *)uint64_t v35 = 136315394;
      uint64_t v50 = v35 + 4;
      sub_100018110();
      sub_100013C14(&qword_100020E20, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v36 = sub_100018700();
      v51 = a5;
      uint64_t v37 = a2;
      unint64_t v39 = v38;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v14, v12);
      uint64_t v58 = sub_1000172BC(v36, v39, aBlock);
      sub_1000185B0();

      a2 = v37;
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 12) = 2080;
      uint64_t v58 = v37;
      swift_errorRetain();
      sub_1000045D0(&qword_100020F70);
      uint64_t v40 = sub_100018430();
      uint64_t v58 = sub_1000172BC(v40, v41, aBlock);
      a5 = v51;
      sub_1000185B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "WorkoutKitXPCService: failed to save configuration: %s, error=%s", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v55 + 8))(v18, v56);
    a5(0, a2);
  }
}

uint64_t sub_100005E08(void *a1, int a2, int a3, int a4, void *aBlock, const char *a6, void (*a7)(unint64_t *, char *, unint64_t, uint64_t, const void *), uint64_t a8)
{
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = sub_100018480();
  uint64_t v14 = sub_1000183F0();
  unint64_t v16 = v15;
  _Block_copy(v12);
  id v17 = a1;
  sub_10000F448(v13, v14, v16, (uint64_t)v17, v12, a6, a7, a8);
  _Block_release(v12);
  _Block_release(v12);

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100005EE8(uint64_t a1, uint64_t a2, void (*a3)(void, uint64_t), uint64_t a4, uint64_t a5, NSObject *a6, uint64_t a7, uint64_t a8)
{
  v62 = a6;
  uint64_t v15 = sub_100018360();
  uint64_t v60 = *(void *)(v15 - 8);
  uint64_t v61 = v15;
  __chkstk_darwin(v15);
  uint64_t v58 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_100018390();
  uint64_t v57 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v56 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100018370();
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1 || a2) {
    return ((uint64_t (*)(void, uint64_t))a3)(0, a2);
  }
  uint64_t v23 = a1;
  if (*(void *)(a5 + 16))
  {
    uint64_t v24 = a5;
    uint64_t v51 = v19;
    sub_1000045D0(&qword_100020E40);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10001A020;
    uint64_t v55 = a4;
    *(void *)(inited + 32) = a7;
    *(void *)(inited + 40) = a8;
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_100010150(inited);
    swift_setDeallocating();
    uint64_t v27 = v55;
    swift_arrayDestroy();
    unint64_t v28 = (void *)swift_allocObject();
    v28[2] = a3;
    v28[3] = v27;
    v28[4] = a5;
    unint64_t v29 = v62;
    v28[5] = v62;
    v28[6] = v23;
    uint64_t v54 = v28;
    uint64_t v30 = v24;
    uint64_t v31 = v26;
    uint64_t v32 = *(void *)(v26 + 16);
    uint64_t v53 = v23;
    swift_retain_n();
    swift_retain_n();
    uint64_t v52 = v30;
    swift_bridgeObjectRetain_n();
    os_log_type_t v33 = v29;
    if (v32)
    {
      uint64_t v34 = dispatch_group_create();
      v62 = v34;
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = 0;
      uint64_t v36 = v33;
      uint64_t v37 = v35;
      sub_100010688(v31, v34, (uint64_t)v36, v35);

      sub_100012FB0(0, &qword_100020DC0);
      uint64_t v38 = v51;
      (*(void (**)(char *, void, uint64_t))(v51 + 104))(v21, enum case for DispatchQoS.QoSClass.default(_:), v18);
      unint64_t v39 = (void *)sub_100018560();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v21, v18);
      uint64_t v40 = swift_allocObject();
      swift_unknownObjectWeakInit();
      unint64_t v41 = (void *)swift_allocObject();
      v41[2] = v40;
      v41[3] = sub_1000131C0;
      v41[4] = v54;
      v41[5] = v37;
      uint64_t v50 = v37;
      aBlock[4] = sub_100013CC0;
      aBlock[5] = v41;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100009D68;
      aBlock[3] = &unk_10001D2E8;
      v42 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v43 = v56;
      sub_100018380();
      v63 = &_swiftEmptyArrayStorage;
      sub_100013C14(&qword_100020DC8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_1000045D0(&qword_100020DD0);
      sub_100012B44();
      v44 = v58;
      uint64_t v45 = v61;
      sub_1000185E0();
      uint64_t v46 = v62;
      sub_100018510();

      _Block_release(v42);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v44, v45);
      (*(void (**)(char *, uint64_t))(v57 + 8))(v43, v59);
      swift_bridgeObjectRelease();
      swift_release_n();

      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      sub_1000101E8(0, a3, v27, v52, (uint64_t)v33, v53);
      swift_bridgeObjectRelease();
      swift_release_n();

      swift_bridgeObjectRelease();
    }
    swift_release();
    return swift_release();
  }
  else
  {
    uint64_t v47 = sub_100017F70();
    sub_100013C14(&qword_100020E68, (void (*)(uint64_t))&type metadata accessor for WorkoutPlanValidationError);
    uint64_t v48 = swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v47 - 8) + 104))(v49, enum case for WorkoutPlanValidationError.emptyPlan(_:), v47);
    swift_retain();
    a3(0, v48);
    swift_errorRelease();
    return swift_release();
  }
}

void sub_100006630(uint64_t a1, uint64_t a2, void (*a3)(void, uint64_t), uint64_t a4)
{
  if (sub_1000182E0() == 2)
  {
    id v24 = v4;
    sub_1000182C0();
    uint64_t v10 = sub_100018280();
    uint64_t v12 = v11;
    swift_release();
    sub_100012FB0(0, &qword_100020E00);
    swift_bridgeObjectRetain();
    id v13 = sub_100008EF8(v10, v12, 1);
    if (v5)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v17 = v13;
      NSString v22 = sub_1000183E0();
      uint64_t v18 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v19 = (void *)swift_allocObject();
      v19[2] = v10;
      v19[3] = v12;
      v19[4] = a3;
      v19[5] = a4;
      v19[6] = a2;
      v19[7] = v17;
      v19[8] = a1;
      v19[9] = v18;
      aBlock[4] = sub_10001324C;
      aBlock[5] = v19;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100007490;
      aBlock[3] = &unk_10001D338;
      uint64_t v20 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      id v21 = v17;
      swift_bridgeObjectRetain();
      swift_release();
      [v24 iconForBundleId:v22 completion:v20];
      _Block_release(v20);
    }
  }
  else
  {
    uint64_t v14 = sub_100018060();
    sub_100013C14(&qword_100020E60, (void (*)(uint64_t))&type metadata accessor for AuthorizationError);
    uint64_t v15 = swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, enum case for AuthorizationError.notAuthorized(_:), v14);
    a3(0, v15);
    swift_errorRelease();
  }
}

uint64_t sub_1000069A0(unint64_t a1, uint64_t a2, void (*a3)(void *, uint64_t), uint64_t a4)
{
  v63[1] = a4;
  v82 = a3;
  uint64_t v6 = sub_100018340();
  v85 = *(char **)(v6 - 8);
  uint64_t v86 = v6;
  __chkstk_darwin(v6);
  v87 = (char *)v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100017FD0();
  v74 = *(char **)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100018000();
  __chkstk_darwin(v11 - 8);
  id v13 = (char *)v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100017F50();
  v73 = *(void (***)(char *, uint64_t))(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000045D0(&qword_100020E50);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  NSString v22 = (char *)v63 - v21;
  uint64_t v23 = sub_100017E70();
  id v24 = *(char **)(v23 - 8);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v26 = __chkstk_darwin(v25);
  if (a2)
  {
    unint64_t v29 = v82;
    swift_errorRetain();
    sub_100018320();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v30 = sub_100018330();
    os_log_type_t v31 = sub_1000184E0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v88 = a2;
      v89[0] = v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      swift_errorRetain();
      sub_1000045D0(&qword_100020DE0);
      uint64_t v34 = sub_100018430();
      uint64_t v88 = sub_1000172BC(v34, v35, v89);
      sub_1000185B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "WorkoutKitXPCService: retrieve suggested plans error: %s", v32, 0xCu);
      swift_arrayDestroy();
      unint64_t v29 = v82;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*((void (**)(char *, uint64_t))v85 + 1))(v87, v86);
    swift_errorRetain();
    v29(&_swiftEmptyArrayStorage, a2);
    swift_errorRelease();
    return swift_errorRelease();
  }
  uint64_t v36 = v82;
  uint64_t v77 = v28;
  v78 = v20;
  v84 = (char *)v63 - v27;
  v79 = v16;
  uint64_t v80 = v8;
  uint64_t v86 = v26;
  v81 = v13;
  uint64_t v76 = v14;
  unint64_t v37 = a1;
  if (a1 >> 62) {
    goto LABEL_25;
  }
  uint64_t v38 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v40 = v73;
  unint64_t v39 = v74;
  if (v38)
  {
LABEL_6:
    uint64_t v36 = 0;
    unint64_t v41 = v37 & 0xC000000000000001;
    v83 = (uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
    v71 = (void (**)(uint64_t, char *, uint64_t))(v24 + 16);
    v72 = (void (**)(char *, char *, uint64_t))(v24 + 32);
    unsigned int v70 = enum case for WorkoutPlan.SerializationFormat.binary(_:);
    v69 = (void (**)(char *, void, uint64_t))(v39 + 104);
    v67 = (void (**)(char *, uint64_t))(v39 + 8);
    v68 = v40 + 1;
    v73 = (void (**)(char *, uint64_t))(v24 + 8);
    v85 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v42 = 4;
    v74 = v10;
    v75 = (char *)v37;
    id v24 = v81;
    uint64_t v66 = v38;
    unint64_t v65 = v37 & 0xC000000000000001;
    v64 = v22;
    while (1)
    {
      uint64_t v43 = v42 - 4;
      if (v41)
      {
        v44 = (char *)sub_100018650();
        uint64_t v45 = v42 - 3;
        if (__OFADD__(v43, 1)) {
          goto LABEL_24;
        }
      }
      else
      {
        v44 = (char *)*(id *)(v37 + 8 * v42);
        uint64_t v45 = v42 - 3;
        if (__OFADD__(v43, 1))
        {
LABEL_24:
          __break(1u);
LABEL_25:
          swift_bridgeObjectRetain();
          uint64_t v38 = sub_1000186C0();
          uint64_t v40 = v73;
          unint64_t v39 = v74;
          if (!v38) {
            break;
          }
          goto LABEL_6;
        }
      }
      uint64_t v10 = (char *)v37;
      uint64_t v46 = v44;
      sub_1000180A0();
      uint64_t v47 = v86;
      int v48 = (*v83)(v22, 1, v86);
      v87 = v46;
      if (v48 == 1)
      {
        sub_100013C5C((uint64_t)v22, &qword_100020E50);
        unint64_t v37 = (unint64_t)v10;
      }
      else
      {
        uint64_t v49 = v22;
        uint64_t v50 = v74;
        uint64_t v51 = v84;
        (*v72)(v84, v49, v47);
        sub_100018100();
        (*v71)(v77, v51, v47);
        sub_1000180E0();
        uint64_t v52 = v79;
        sub_100017F60();
        uint64_t v53 = v80;
        (*v69)(v50, v70, v80);
        uint64_t v54 = sub_100017F30();
        uint64_t v10 = v55;
        (*v67)(v50, v53);
        (*v68)(v52, v76);
        if (swift_isUniquelyReferenced_nonNull_native())
        {
          uint64_t v56 = v85;
          uint64_t v57 = v86;
        }
        else
        {
          uint64_t v56 = sub_10000C5D8(0, *((void *)v85 + 2) + 1, 1, v85);
          uint64_t v57 = v86;
        }
        NSString v22 = v64;
        unint64_t v59 = *((void *)v56 + 2);
        unint64_t v58 = *((void *)v56 + 3);
        if (v59 >= v58 >> 1) {
          uint64_t v56 = sub_10000C5D8((char *)(v58 > 1), v59 + 1, 1, v56);
        }
        *((void *)v56 + 2) = v59 + 1;
        v85 = v56;
        uint64_t v60 = &v56[16 * v59];
        *((void *)v60 + 4) = v54;
        *((void *)v60 + 5) = v10;
        (*v73)(v84, v57);
        unint64_t v37 = (unint64_t)v75;
        id v24 = v81;
        uint64_t v38 = v66;
        unint64_t v41 = v65;
      }

      ++v42;
      if (v45 == v38)
      {
        swift_bridgeObjectRelease();
        uint64_t v36 = v82;
        goto LABEL_27;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_27:
  uint64_t v62 = swift_bridgeObjectRetain();
  v36((void *)v62, 0);
  return swift_bridgeObjectRelease_n();
}

void sub_10000729C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5.super.Class isa = sub_100018470().super.isa;
  if (a2) {
    uint64_t v6 = sub_100017E20();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v5.super.isa);
}

void sub_1000073F8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_100017E20();
      goto LABEL_6;
    }
  }
  else
  {
    Class isa = sub_100017E40().super.isa;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);
}

uint64_t sub_100007490(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  NSArray v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)sub_100017E50();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_100012E24((uint64_t)v4, v8);
  return swift_release();
}

void sub_100007554(void *a1, int a2, void *a3, void *aBlock, void (*a5)(uint64_t, unint64_t, id, void *))
{
  unint64_t v8 = _Block_copy(aBlock);
  id v9 = a3;
  id v13 = a1;
  uint64_t v10 = sub_100017E50();
  unint64_t v12 = v11;

  _Block_copy(v8);
  a5(v10, v12, v13, v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_100012E38(v10, v12);
}

void sub_100007614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100017EB0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  id v9 = self;
  Class isa = sub_100017E80().super.isa;
  id v11 = [v9 predicateForObjectWithUUID:isa];

  sub_100012FB0(0, &qword_100020E08);
  id v12 = [(id)swift_getObjCClassFromMetadata() workoutType];
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  id v15 = objc_allocWithZone((Class)HKSampleQuery);
  aBlock[4] = sub_100012F24;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000C2AC;
  aBlock[3] = &unk_10001D040;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  id v17 = [v15 initWithSampleType:v12 predicate:v11 limit:1 sortDescriptors:0 resultsHandler:v16];

  _Block_release(v16);
  swift_release();
  id v18 = sub_1000046E4();
  [v18 executeQuery:v17];
}

uint64_t sub_100007894(uint64_t a1, uint8_t *a2, uint64_t a3, void (*a4)(uint64_t, unint64_t, uint64_t), uint64_t a5, uint64_t a6)
{
  uint64_t v71 = a6;
  unint64_t v72 = (unint64_t)a2;
  uint64_t v75 = a5;
  uint64_t v76 = a4;
  uint64_t v7 = sub_100017FD0();
  uint64_t v70 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100018000();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100017EB0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  id v17 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100018340();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v73 = v18;
  uint64_t v74 = v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v21 = __chkstk_darwin(v20);
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v66 - v24;
  if (a3)
  {
    swift_errorRetain();
    sub_100018320();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v26 = sub_100018330();
    os_log_type_t v27 = sub_1000184E0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v77 = a3;
      uint64_t v78 = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      swift_errorRetain();
      sub_1000045D0(&qword_100020DE0);
      uint64_t v30 = sub_100018430();
      uint64_t v77 = sub_1000172BC(v30, v31, &v78);
      sub_1000185B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "WorkoutKitXPCService: failed to retrieve workout due to: %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v74 + 8))(v25, v73);
    swift_errorRetain();
    v76(0, 0xF000000000000000, a3);
    swift_errorRelease();
    return swift_errorRelease();
  }
  v68 = v13;
  v69 = v17;
  uint64_t v67 = v10;
  uint64_t v32 = (uint8_t *)v72;
  if (!v72)
  {
LABEL_21:
    uint64_t v53 = v22;
    sub_100018320();
    uint64_t v54 = v15;
    uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v56 = v69;
    uint64_t v57 = v14;
    v55(v69, v71, v14);
    unint64_t v58 = sub_100018330();
    os_log_type_t v59 = sub_1000184E0();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = (uint8_t *)swift_slowAlloc();
      uint64_t v78 = swift_slowAlloc();
      *(_DWORD *)uint64_t v60 = 136315138;
      unint64_t v72 = (unint64_t)(v60 + 4);
      sub_100013C14(&qword_100020E20, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v61 = sub_100018700();
      uint64_t v77 = sub_1000172BC(v61, v62, &v78);
      sub_1000185B0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v57);
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "WorkoutKitXPCService: failed to retrieve workout with uuid: %s", v60, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v57);
    }

    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v53, v73);
    uint64_t v63 = sub_100018020();
    sub_100013C14(&qword_100020E18, (void (*)(uint64_t))&type metadata accessor for QueryError);
    uint64_t v64 = swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v63 - 8) + 104))(v65, enum case for QueryError.failedToRetrieveWorkout(_:), v63);
    v76(0, 0xF000000000000000, v64);
    return swift_errorRelease();
  }
  uint64_t v33 = v22;
  uint64_t v66 = v23;
  if (!(v72 >> 62))
  {
    uint64_t v34 = *(void *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v36 = v11;
    if (v34) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000186C0();
  uint64_t v36 = v11;
  if (!result)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    uint64_t v22 = v33;
    goto LABEL_21;
  }
LABEL_7:
  if (((unint64_t)v32 & 0xC000000000000001) != 0)
  {
    id v37 = (id)sub_100018650();
  }
  else
  {
    if (!*(void *)(((unint64_t)v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v37 = *((id *)v32 + 4);
  }
  uint64_t v38 = v37;
  swift_bridgeObjectRelease();
  sub_100018310();
  swift_allocObject();
  sub_100018300();
  id v39 = objc_msgSend(v38, "metadata", v66);
  if (v39)
  {
    uint64_t v40 = v39;
    sub_1000183B0();
  }
  uint64_t v41 = v7;
  sub_100018140();
  uint64_t v42 = (void *)sub_100018090();
  swift_bridgeObjectRelease();
  uint64_t v43 = v70;
  if (v42)
  {
    v44 = v68;
    sub_100018100();
    (*(void (**)(char *, void, uint64_t))(v43 + 104))(v9, enum case for WorkoutPlan.SerializationFormat.binary(_:), v41);
    uint64_t v45 = v44;
    uint64_t v46 = sub_100017FC0();
    uint64_t v47 = v9;
    unint64_t v52 = v51;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v47, v41);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v45, v67);
    sub_100012E90(v46, v52);
    v76(v46, v52, 0);
    swift_release();

    sub_100012E38(v46, v52);
    return sub_100012E38(v46, v52);
  }
  else
  {
    uint64_t v48 = sub_100018040();
    sub_100013C14(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
    uint64_t v49 = swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v48 - 8) + 104))(v50, enum case for ImportError.unrecognizedDataFormat(_:), v48);
    v76(0, 0xF000000000000000, v49);
    swift_errorRelease();

    return swift_release();
  }
}

void sub_100008518(uint64_t a1, uint64_t a2, void (*a3)(id, uint64_t))
{
  if (a2)
  {
    id v5 = objc_allocWithZone((Class)NSNumber);
    swift_errorRetain();
    id v6 = [v5 initWithUnsignedInteger:0];
    swift_errorRetain();
    a3(v6, a2);
    swift_errorRelease();

    swift_errorRelease();
  }
  else
  {
    if (a1)
    {
      swift_retain();
      id v7 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInteger:sub_1000182E0()];
      a3(v7, 0);
      swift_release();
    }
    else
    {
      id v7 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInteger:0];
      a3(v7, 0);
    }
  }
}

void sub_100008694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_100017E20();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_100008704(uint64_t a1, uint64_t a2, void (*a3)(id, uint64_t), uint64_t a4, void *a5, uint64_t a6, unint64_t a7)
{
  uint64_t v14 = sub_100018340();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  id v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    a3(0, a2);
    swift_errorRelease();
  }
  else if (a1)
  {
    swift_retain();
    if (sub_1000182E0())
    {
      id v32 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInteger:sub_1000182E0()];
      a3(v32, 0);
      swift_release();
      uint64_t v18 = v32;
    }
    else
    {
      sub_100008BD0(a1, (uint64_t)a3, a4);
      swift_release();
    }
  }
  else
  {
    id v32 = a5;
    sub_100018320();
    swift_bridgeObjectRetain_n();
    uint64_t v19 = sub_100018330();
    os_log_type_t v20 = sub_1000184E0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      aBlock[0] = v31;
      uint64_t v30 = v21;
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t v29 = v21 + 4;
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_1000172BC(a6, a7, aBlock);
      sub_1000185B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "WorkoutKitXPCService: creating new provider entry for %s", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    uint64_t v22 = v32;
    sub_100012FB0(0, &qword_100020E00);
    swift_bridgeObjectRetain();
    id v23 = sub_100008EF8(a6, a7, 1);
    NSString v24 = sub_1000183E0();
    uint64_t v25 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v26 = (void *)swift_allocObject();
    v26[2] = a6;
    v26[3] = a7;
    v26[4] = a3;
    v26[5] = a4;
    v26[6] = v23;
    v26[7] = v25;
    aBlock[4] = (uint64_t)sub_100012DB0;
    aBlock[5] = (uint64_t)v26;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100007490;
    aBlock[3] = (uint64_t)&unk_10001CF28;
    os_log_type_t v27 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    id v28 = v23;
    swift_release();
    [v22 iconForBundleId:v24 completion:v27];
    _Block_release(v27);
  }
}

uint64_t sub_100008BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100018340();
  uint64_t v37 = *(void *)(v8 - 8);
  uint64_t v38 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000182C0();
  uint64_t v11 = sub_100018240();
  uint64_t v13 = v12;
  swift_release();
  uint64_t v14 = sub_100016E58(v11, v13);
  swift_bridgeObjectRelease();
  sub_100018320();
  uint64_t v15 = sub_100018330();
  os_log_type_t v16 = sub_1000184F0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v36 = a1;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v35 = v4;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v40 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315138;
    v32[1] = v18 + 4;
    id v19 = (id)NSStringForWOPersistencePermissionState();
    uint64_t v20 = sub_1000183F0();
    uint64_t v33 = v14;
    uint64_t v34 = a3;
    uint64_t v21 = a2;
    uint64_t v22 = v20;
    unint64_t v24 = v23;

    uint64_t v25 = v22;
    a2 = v21;
    uint64_t v39 = sub_1000172BC(v25, v24, &v40);
    sub_1000185B0();
    a3 = v34;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "WorkoutKitXPCService: selected permission: %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v26 = v10;
    uint64_t v27 = v33;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v26, v38);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v38);
    uint64_t v27 = v14;
  }
  id v28 = (void *)swift_allocObject();
  v28[2] = a2;
  v28[3] = a3;
  v28[4] = v27;
  swift_retain();
  id v29 = sub_100004758();
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = sub_100012E18;
  *(void *)(v30 + 24) = v28;
  swift_retain();
  sub_1000181F0();
  swift_release();

  return swift_release();
}

id sub_100008EF8(uint64_t a1, uint64_t a2, char a3)
{
  NSString v4 = sub_1000183E0();
  swift_bridgeObjectRelease();
  id v9 = 0;
  id v5 = [(id)swift_getObjCClassFromMetadata() bundleRecordWithBundleIdentifier:v4 allowPlaceholder:a3 & 1 error:&v9];

  if (v5)
  {
    id v6 = v9;
  }
  else
  {
    id v7 = v9;
    sub_100017E30();

    swift_willThrow();
  }
  return v5;
}

uint64_t sub_100008FE0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(void, uint64_t), uint64_t a7, void *a8)
{
  uint64_t v32 = a3;
  uint64_t v33 = a6;
  uint64_t v14 = sub_100017EB0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_100017E70();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_100018340();
  __chkstk_darwin(v16);
  id v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 60 == 15)
  {
    uint64_t v29 = a4;
    uint64_t v30 = v17;
    sub_100018320();
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_100018330();
    os_log_type_t v21 = sub_1000184E0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v31 = a7;
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      v34[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      v34[3] = sub_1000172BC(v29, a5, v34);
      sub_1000185B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "WorkoutKitXPCService: unable to retrieve icon image for: %s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v30 + 8))(v19, v16);
    return v33(0, v32);
  }
  else
  {
    uint64_t v31 = a7;
    sub_100012E90(a1, a2);
    id v24 = [a8 localizedName];
    sub_1000183F0();

    swift_bridgeObjectRetain();
    sub_100012EE8(a1, a2);
    sub_100017E60();
    sub_100017EA0();
    sub_100018290();
    swift_allocObject();
    sub_100018230();
    sub_1000182F0();
    swift_allocObject();
    uint64_t v25 = sub_1000182D0();
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v27 = (void *)Strong;
      sub_100008BD0(v25, (uint64_t)v33, v31);
      sub_100012E24(a1, a2);
    }
    else
    {
      sub_100012E24(a1, a2);
    }
    return swift_release();
  }
}

uint64_t sub_100009418(void *a1, int a2, int a3, void *aBlock, void (*a5)(uint64_t, uint64_t, id, void *))
{
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = sub_1000183F0();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a1;
  a5(v8, v10, v11, v7);
  _Block_release(v7);
  _Block_release(v7);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000094BC(uint64_t a1, uint64_t a2, void (*a3)(void, uint64_t), uint64_t a4)
{
  if (a2)
  {
    swift_errorRetain();
    a3(0, a2);
LABEL_3:
    return swift_errorRelease();
  }
  if (!a1)
  {
    uint64_t v11 = sub_100018040();
    sub_100013C14(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
    uint64_t v12 = swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, enum case for ImportError.unknownType(_:), v11);
    a3(0, v12);
    goto LABEL_3;
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = a4;
  swift_retain();
  swift_retain();
  id v9 = sub_100004758();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_100012C8C;
  *(void *)(v10 + 24) = v8;
  swift_retain();
  sub_1000181F0();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_100009760(uint64_t *a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a3;
  uint64_t v26 = sub_100018340();
  uint64_t v8 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = a1[1];
  uint64_t v28 = *a1;
  dispatch_group_enter(a2);
  sub_100018320();
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_100018330();
  os_log_type_t v13 = sub_1000184F0();
  if (os_log_type_enabled(v12, v13))
  {
    id v24 = a2;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v23 = a4;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v25 = v4;
    uint64_t v30 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_1000172BC(v28, v11, &v30);
    a2 = v24;
    sub_1000185B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "WorkoutKitXPCService: removing provider for bundleId: %s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a4 = v23;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v26);
  id v17 = sub_100004758();
  uint64_t v18 = (void *)swift_allocObject();
  uint64_t v19 = v28;
  v18[2] = a4;
  v18[3] = v19;
  v18[4] = v11;
  v18[5] = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v20 = a2;
  sub_1000181A0();

  return swift_release();
}

void sub_100009A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, NSObject *a6)
{
  uint64_t v11 = sub_100018340();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_beginAccess();
    *(void *)(a3 + 16) = a2;
    swift_errorRetain();
    swift_errorRelease();
  }
  else
  {
    sub_100018320();
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_100018330();
    os_log_type_t v16 = sub_1000184F0();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v20 = a6;
      v21[0] = v18;
      *(_DWORD *)id v17 = 136315138;
      uint64_t v19 = v17 + 4;
      swift_bridgeObjectRetain();
      v21[3] = sub_1000172BC(a4, a5, v21);
      sub_1000185B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "WorkoutKitXPCService: successfully removed provider for bundleId: %s", v17, 0xCu);
      swift_arrayDestroy();
      a6 = v20;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  dispatch_group_leave(a6);
}

void sub_100009C5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = sub_1000047DC();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = a4;
  v10[4] = sub_100013DB4;
  v10[5] = v8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_1000049FC;
  v10[3] = &unk_10001CD98;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_retain();
  swift_release();
  [v7 forceNanoSyncWithOptions:0 completion:v9];

  _Block_release(v9);
}

uint64_t sub_100009D68(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_100009E40(int a1, uint64_t a2, uint64_t a3, dispatch_group_t group)
{
  if (a2)
  {
    swift_beginAccess();
    *(void *)(a3 + 16) = a2;
    swift_errorRetain();
    swift_errorRelease();
  }
  dispatch_group_leave(group);
}

void sub_100009EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    id v9 = sub_1000047DC();

    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = a2;
    v10[3] = a3;
    v10[4] = a4;
    aBlock[4] = sub_100013054;
    aBlock[5] = v10;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000049FC;
    aBlock[3] = &unk_10001D180;
    uint64_t v11 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    [v9 forceNanoSyncWithOptions:0 completion:v11];

    _Block_release(v11);
  }
}

uint64_t sub_100009FE8(uint64_t a1, uint64_t a2, void (*a3)(void, void), uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_100018340();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    sub_100018320();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v13 = sub_100018330();
    os_log_type_t v14 = sub_1000184E0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v25 = a3;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v23 = v9;
      os_log_type_t v16 = (uint8_t *)v15;
      uint64_t v17 = swift_slowAlloc();
      uint64_t v26 = a2;
      v27[0] = v17;
      uint64_t v24 = a4;
      *(_DWORD *)os_log_type_t v16 = 136315138;
      uint64_t v22 = v16 + 4;
      swift_errorRetain();
      sub_1000045D0(&qword_100020DE0);
      uint64_t v18 = sub_100018430();
      uint64_t v26 = sub_1000172BC(v18, v19, v27);
      sub_1000185B0();
      a3 = v25;
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "WorkoutKitXPCService: nano sync error: %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v23);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    }
  }
  swift_beginAccess();
  uint64_t v20 = *(void *)(a5 + 16);
  swift_errorRetain();
  a3(v20 == 0, v20);
  return swift_errorRelease();
}

void sub_10000A29C(uint64_t a1, void (*a2)(id, uint64_t), uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    swift_errorRetain();
    a2(0, a1);
    swift_errorRelease();
  }
  else
  {
    id v6 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInteger:a4];
    a2(v6, 0);
  }
}

uint64_t sub_10000A358(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v7 = sub_100018340();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    sub_100018320();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v11 = sub_100018330();
    os_log_type_t v12 = sub_1000184E0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v20 = a3;
      uint64_t v13 = swift_slowAlloc();
      v19[2] = a4;
      os_log_type_t v14 = (uint8_t *)v13;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v21 = a2;
      uint64_t v22 = v15;
      *(_DWORD *)os_log_type_t v14 = 136315138;
      v19[1] = v14 + 4;
      swift_errorRetain();
      sub_1000045D0(&qword_100020DE0);
      uint64_t v16 = sub_100018430();
      uint64_t v21 = sub_1000172BC(v16, v17, &v22);
      sub_1000185B0();
      a3 = v20;
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "WorkoutKitXPCService: update external provider error: %s", v14, 0xCu);
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
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return a3(a2);
}

uint64_t sub_10000A5C4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  if (a2)
  {
    swift_errorRetain();
    a3(0, a2);
  }
  else
  {
    if (a1)
    {
      swift_retain();
      if (sub_1000182E0() == 2)
      {
        uint64_t v5 = swift_retain();
        a3(v5, 0);
        return swift_release_n();
      }
      swift_release();
    }
    uint64_t v7 = sub_100018060();
    sub_100013C14(&qword_100020E60, (void (*)(uint64_t))&type metadata accessor for AuthorizationError);
    uint64_t v8 = swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, enum case for AuthorizationError.notAuthorized(_:), v7);
    a3(0, v8);
  }
  return swift_errorRelease();
}

uint64_t sub_10000A740(uint64_t a1, uint64_t a2, void (*a3)(void, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_100018340();
  __chkstk_darwin(v11);
  if (!a1 || a2) {
    return ((uint64_t (*)(void, uint64_t))a3)(0, a2);
  }
  swift_retain();
  sub_100006630(a6, a1, a3, a4);
  return swift_release();
}

uint64_t sub_10000AA38(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(void, uint64_t), uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v63 = a6;
  uint64_t v18 = sub_100018340();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v55 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v20);
  uint64_t v25 = (char *)&v55 - v24;
  uint64_t v62 = v23;
  if (a2 >> 60 == 15)
  {
    sub_100018320();
    swift_bridgeObjectRetain_n();
    uint64_t v26 = sub_100018330();
    os_log_type_t v27 = sub_1000184E0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v61 = a3;
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v60 = a7;
      v64[0] = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      swift_bridgeObjectRetain();
      v64[4] = sub_1000172BC(a4, a5, v64);
      a3 = v61;
      sub_1000185B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "WorkoutKitXPCService: unable to retrieve icon image for: %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v25, v62);
    return v63(0, a3);
  }
  uint64_t v60 = a7;
  uint64_t v61 = a3;
  uint64_t v59 = a10;
  uint64_t v57 = v19;
  uint64_t v58 = a11;
  sub_100012E90(a1, a2);
  sub_1000182C0();
  uint64_t v30 = sub_100018240();
  uint64_t v32 = v31;
  swift_release();
  id v56 = a9;
  id v33 = [a9 localizedName];
  uint64_t v34 = sub_1000183F0();
  uint64_t v36 = v35;

  if (v30 == v34 && v32 == v36)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v39 = v61;
  }
  else
  {
    char v38 = sub_100018710();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v39 = v61;
    if ((v38 & 1) == 0) {
      goto LABEL_15;
    }
  }
  sub_1000182C0();
  uint64_t v41 = sub_100018260();
  unint64_t v43 = v42;
  swift_release();
  char v44 = sub_10000EA70(v41, v43, a1, a2);
  sub_100012E38(v41, v43);
  if ((v44 & 1) == 0)
  {
LABEL_15:
    sub_100018320();
    uint64_t v46 = sub_100018330();
    os_log_type_t v47 = sub_1000184F0();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "WorkoutKitXPCService: updating external provider", v48, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v57 + 8))(v22, v62);
    sub_1000182C0();
    id v49 = [v56 localizedName];
    sub_1000183F0();

    sub_100018250();
    swift_release();
    sub_1000182C0();
    sub_100012E90(a1, a2);
    sub_100018270();
    swift_release();
    char v45 = 1;
    goto LABEL_18;
  }
  char v45 = 0;
LABEL_18:
  swift_retain();
  sub_100013288(v59, a8);
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v51 = (void *)Strong;
    id v52 = sub_100004758();

    uint64_t v53 = swift_allocObject();
    *(void *)(v53 + 16) = v58;
    *(unsigned char *)(v53 + 24) = v45;
    uint64_t v54 = v63;
    *(void *)(v53 + 32) = a8;
    *(void *)(v53 + 40) = v54;
    *(void *)(v53 + 48) = v60;
    *(void *)(v53 + 56) = v39;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_errorRetain();
    sub_1000181B0();
    sub_100012E24(a1, a2);

    swift_release();
  }
  else
  {
    sub_100012E24(a1, a2);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000AFD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v67 = a3;
  uint64_t v5 = sub_100017EB0();
  uint64_t v61 = *(void *)(v5 - 8);
  uint64_t v62 = v5;
  __chkstk_darwin(v5);
  uint64_t v60 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000182B0();
  uint64_t v56 = *(void *)(v7 - 8);
  uint64_t v57 = v7;
  __chkstk_darwin(v7);
  uint64_t v55 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000045D0(&qword_100020E50);
  __chkstk_darwin(v9 - 8);
  uint64_t v58 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100017F50();
  uint64_t v68 = *(void *)(v11 - 8);
  uint64_t v69 = v11;
  __chkstk_darwin(v11);
  uint64_t v65 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100018340();
  uint64_t v63 = *(void *)(v13 - 8);
  uint64_t v64 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v70 = (char *)&v55 - v17;
  uint64_t v71 = sub_100018000();
  uint64_t v18 = *(void *)(v71 - 8);
  uint64_t v19 = __chkstk_darwin(v71);
  uint64_t v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v55 - v22;
  sub_100017F40();
  sub_100018180();
  uint64_t v24 = (void *)sub_100018170();
  sub_100018160();
  sub_100018150();
  uint64_t v25 = sub_100017FA0();
  if (v3)
  {
    uint64_t v66 = 0;

    swift_release();
    swift_errorRelease();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v18 + 8);
    v26(v23, v71);
    sub_100018320();
    os_log_type_t v27 = v65;
    (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v65, a1, v69);
    uint64_t v28 = sub_100018330();
    os_log_type_t v29 = sub_1000184E0();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      uint64_t v73 = (char *)v59;
      *(_DWORD *)uint64_t v30 = 136315138;
      uint64_t v58 = (char *)(v30 + 4);
      sub_100017F40();
      uint64_t v31 = v60;
      sub_100017FE0();
      v26(v21, v71);
      sub_100013C14(&qword_100020E20, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v32 = v62;
      uint64_t v33 = sub_100018700();
      unint64_t v35 = v34;
      (*(void (**)(char *, uint64_t))(v61 + 8))(v31, v32);
      uint64_t v72 = sub_1000172BC(v33, v35, (uint64_t *)&v73);
      sub_1000185B0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v68 + 8))(v65, v69);
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "WorkoutKitXPCService: failed to deserialize %s - skipping scheduling", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v68 + 8))(v27, v69);
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v70, v64);
    goto LABEL_8;
  }
  uint64_t v36 = (void *)v25;
  uint64_t v66 = 0;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v23, v71);

  swift_release();
  if ((sub_100018080() & 1) == 0)
  {
    sub_100018320();
    id v40 = v36;
    uint64_t v41 = sub_100018330();
    os_log_type_t v42 = sub_1000184E0();
    int v43 = v42;
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v71 = (uint64_t)v16;
      LODWORD(v69) = v43;
      uint64_t v45 = v44;
      uint64_t v70 = (char *)swift_slowAlloc();
      uint64_t v73 = v70;
      *(_DWORD *)uint64_t v45 = 136315394;
      uint64_t v46 = v55;
      sub_100018120();
      uint64_t v47 = sub_1000182A0();
      unint64_t v49 = v48;
      (*(void (**)(char *, uint64_t))(v56 + 8))(v46, v57);
      uint64_t v72 = sub_1000172BC(v47, v49, (uint64_t *)&v73);
      sub_1000185B0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 12) = 2080;
      uint64_t v50 = v60;
      sub_100018130();
      sub_100013C14(&qword_100020E20, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v51 = v62;
      uint64_t v52 = sub_100018700();
      unint64_t v54 = v53;
      (*(void (**)(char *, uint64_t))(v61 + 8))(v50, v51);
      uint64_t v72 = sub_1000172BC(v52, v54, (uint64_t *)&v73);
      sub_1000185B0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v41, (os_log_type_t)v69, "WorkoutKitXPCService: invalid %s configuration for %s - skipping scheduling", (uint8_t *)v45, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v63 + 8))(v71, v64);
    }
    else
    {

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v16, v64);
    }
LABEL_8:
    uint64_t v36 = 0;
    goto LABEL_9;
  }
  sub_1000182C0();
  sub_1000180D0();
  uint64_t v37 = v58;
  sub_100017F00();
  uint64_t v38 = sub_100017E70();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v37, 0, 1, v38);
  sub_1000180B0();
  sub_100017F20();
  uint64_t result = sub_1000180F0();
LABEL_9:
  *uint64_t v67 = v36;
  return result;
}

void sub_10000B8C8(char a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, void (*a6)(void), uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v15 = (void *)Strong;
      id v16 = sub_1000047DC();

      uint64_t v17 = swift_allocObject();
      *(unsigned char *)(v17 + 16) = a4 & 1;
      *(void *)(v17 + 24) = a3;
      *(void *)(v17 + 32) = a5;
      *(void *)(v17 + 40) = a6;
      *(void *)(v17 + 48) = a7;
      *(unsigned char *)(v17 + 56) = 1;
      *(void *)(v17 + 64) = a8;
      aBlock[4] = sub_1000134A8;
      aBlock[5] = v17;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000049FC;
      aBlock[3] = &unk_10001D3B0;
      uint64_t v18 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_errorRetain();
      swift_release();
      [v16 forceNanoSyncWithOptions:0 completion:v18];

      _Block_release(v18);
    }
  }
  else
  {
    a6(0);
  }
}

uint64_t sub_10000BA50(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void, void), uint64_t a7, int a8, uint64_t a9)
{
  int v36 = a3;
  uint64_t v15 = sub_100018340();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v34 = a4;
    int v35 = a8;
    swift_errorRetain();
    sub_100018320();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v19 = sub_100018330();
    os_log_type_t v20 = sub_1000184E0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v32 = a7;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v33 = a5;
      uint64_t v22 = (uint8_t *)v21;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v31 = a6;
      uint64_t v37 = a2;
      v38[0] = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v30 = v22 + 4;
      swift_errorRetain();
      sub_1000045D0(&qword_100020DE0);
      uint64_t v24 = sub_100018430();
      uint64_t v37 = sub_1000172BC(v24, v25, v38);
      sub_1000185B0();
      a7 = v32;
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "WorkoutKitXPCService: nano sync error: %s", v22, 0xCu);
      swift_arrayDestroy();
      a6 = v31;
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
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    LOBYTE(a8) = v35;
  }
  if ((v36 & 1) == 0) {
    return a6(a8 & 1, a9);
  }
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    os_log_type_t v27 = (void *)result;
    id v28 = sub_100004758();

    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = a6;
    *(void *)(v29 + 24) = a7;
    *(unsigned char *)(v29 + 32) = a8 & 1;
    *(void *)(v29 + 40) = a9;
    swift_retain();
    swift_errorRetain();
    sub_1000181F0();

    return swift_release();
  }
  return result;
}

uint64_t sub_10000BDA0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a1 || a2) {
    return a3(0);
  }
  swift_retain();
  sub_100013564(a5, a1);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v13 = (void *)Strong;
    id v14 = sub_100004758();

    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = a6;
    v15[3] = a3;
    v15[4] = a4;
    v15[5] = 0;
    swift_retain();
    swift_retain();
    sub_1000181E0();

    swift_release();
  }
  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_10000BEC8(char a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6)
{
  if (a1)
  {
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v10 = (void *)Strong;
      id v11 = sub_1000047DC();

      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = a4;
      *(void *)(v12 + 24) = a5;
      *(unsigned char *)(v12 + 32) = 1;
      *(void *)(v12 + 40) = a6;
      aBlock[4] = sub_100013D68;
      aBlock[5] = v12;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000049FC;
      aBlock[3] = &unk_10001D4C8;
      uint64_t v13 = _Block_copy(aBlock);
      swift_retain();
      swift_errorRetain();
      swift_release();
      [v11 forceNanoSyncWithOptions:0 completion:v13];

      _Block_release(v13);
    }
  }
  else
  {
    a4(0);
  }
}

uint64_t sub_10000C020(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void), uint64_t a4, int a5, uint64_t a6, const char *a7)
{
  uint64_t v13 = sub_100018340();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v30 = a7;
    swift_errorRetain();
    sub_100018320();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v17 = sub_100018330();
    os_log_type_t v18 = sub_1000184E0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v27 = a4;
      uint64_t v19 = swift_slowAlloc();
      id v28 = a3;
      os_log_type_t v20 = (uint8_t *)v19;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v29 = a6;
      uint64_t v31 = a2;
      uint64_t v32 = v21;
      int v26 = a5;
      *(_DWORD *)os_log_type_t v20 = 136315138;
      unint64_t v25 = v20 + 4;
      swift_errorRetain();
      sub_1000045D0(&qword_100020DE0);
      uint64_t v22 = sub_100018430();
      uint64_t v31 = sub_1000172BC(v22, v23, &v32);
      LOBYTE(a5) = v26;
      sub_1000185B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v30, v20, 0xCu);
      swift_arrayDestroy();
      a6 = v29;
      swift_slowDealloc();
      a3 = v28;
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  return a3(a5 & 1, a6);
}

uint64_t sub_10000C2AC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v7 = *(void (**)(id, uint64_t, void *))(a1 + 32);
  if (a3)
  {
    sub_100012FB0(0, &qword_100020E10);
    uint64_t v5 = sub_100018480();
  }
  swift_retain();
  id v8 = a2;
  id v9 = a4;
  v7(v8, v5, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000C364@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_100012E90(a2, a3);
      uint64_t v10 = (char *)sub_100017DF0();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_100017E10();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_100017E00();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x10000C5C8);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_100012E38(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_100017DF0();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_100017E10();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_100017E00();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

char *sub_10000C5D8(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000045D0(&qword_100020E58);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      size_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      size_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_1000110D8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C6E8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000C708(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10000C708(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    size_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000045D0(&qword_100020E70);
  uint64_t v10 = *(void *)(sub_100017F50() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  size_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_100017F50() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  BOOL v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_1000186F0();
  __break(1u);
  return result;
}

uint64_t sub_10000C948(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100018740();
  swift_bridgeObjectRetain();
  sub_100018440();
  Swift::Int v8 = sub_100018750();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100018710() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      size_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_100018710() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10000CDD8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10000CAF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000045D0(&qword_100020E48);
  uint64_t v3 = sub_100018630();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
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
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v30 = -1 << v29;
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
      sub_100018740();
      sub_100018440();
      uint64_t result = sub_100018750();
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
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_10000CDD8(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_10000CAF8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10000CF74();
      goto LABEL_22;
    }
    sub_10000D128();
  }
  uint64_t v11 = *v4;
  sub_100018740();
  sub_100018440();
  uint64_t result = sub_100018750();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100018710(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100018730();
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
          uint64_t result = sub_100018710();
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

void *sub_10000CF74()
{
  uint64_t v1 = v0;
  sub_1000045D0(&qword_100020E48);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100018620();
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

uint64_t sub_10000D128()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000045D0(&qword_100020E48);
  uint64_t v3 = sub_100018630();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
    sub_100018740();
    swift_bridgeObjectRetain();
    sub_100018440();
    uint64_t result = sub_100018750();
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
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
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

uint64_t sub_10000D3D8(uint64_t a1)
{
  uint64_t v2 = sub_1000045D0(&qword_100020E80);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[1] = a1;
  swift_errorRetain();
  sub_1000045D0(&qword_100020DE0);
  uint64_t v5 = sub_100018040();
  int v6 = swift_dynamicCast();
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  if (v6)
  {
    uint64_t v8 = *(void *)(v5 - 8);
    v7(v4, 0, 1, v5);
    (*(void (**)(char *, uint64_t))(v8 + 88))(v4, v5);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v5);
  }
  else
  {
    v7(v4, 1, 1, v5);
    sub_100013C5C((uint64_t)v4, &qword_100020E80);
  }
  uint64_t v9 = sub_100018420();
  uint64_t v11 = v10;
  uint64_t v12 = sub_100018420();
  uint64_t v14 = v13;
  uint64_t v15 = sub_100018420();
  sub_100014828(v12, v14, v9, v11, v15, v16, 0, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_10000D620(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(void, void, void))
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  _Block_copy(a4);
  if (sub_1000150C8())
  {
    sub_100018140();
    sub_100018180();
    uint64_t v9 = (void *)sub_100018170();
    sub_100018160();
    sub_100018150();
    uint64_t v10 = (void *)sub_1000180C0();

    swift_release();
    sub_1000183F0();
    sub_1000183F0();
    id v14 = objc_allocWithZone((Class)SBSRemoteAlertDefinition);
    NSString v15 = sub_1000183E0();
    swift_bridgeObjectRelease();
    NSString v16 = sub_1000183E0();
    swift_bridgeObjectRelease();
    id v17 = [v14 initWithServiceName:v15 viewControllerClassName:v16];

    id v18 = [objc_allocWithZone((Class)SBSRemoteAlertConfigurationContext) init];
    sub_1000045D0(&qword_100020E88);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10001A020;
    uint64_t v26 = sub_1000183F0();
    uint64_t v27 = v20;
    sub_100018610();
    *(void *)(inited + 96) = &type metadata for Data;
    *(void *)(inited + 72) = a1;
    *(void *)(inited + 80) = a2;
    sub_100012E90(a1, a2);
    sub_100013ED0(inited);
    Class isa = sub_1000183A0().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v18, "setUserInfo:", isa, v26, v27);

    uint64_t v22 = (void *)(a3
                   + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_presentConfigurationCompletionHandler);
    uint64_t v23 = *(void *)(a3
                    + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_presentConfigurationCompletionHandler);
    *uint64_t v22 = sub_100013CB8;
    v22[1] = v8;
    swift_retain();
    sub_100004964(v23);
    id v24 = [self newHandleWithDefinition:v17 configurationContext:v18];
    id v25 = [objc_allocWithZone((Class)SBSRemoteAlertActivationContext) init];
    [v24 registerObserver:a3];
    [v24 activateWithContext:v25];
    swift_release();
  }
  else
  {
    uint64_t v11 = sub_100018070();
    sub_100013C14(&qword_100020E78, (void (*)(uint64_t))&type metadata accessor for AppError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v12, enum case for AppError.applicationNotInForeground(_:), v11);
    uint64_t v13 = (void *)sub_100017E20();
    ((void (**)(void, void, void *))a4)[2](a4, 0, v13);

    swift_errorRelease();
    swift_release();
  }
}

void sub_10000DA88(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void, void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a4;
  _Block_copy(a4);
  if ((sub_10001540C() & 1) == 0)
  {
    uint64_t v9 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v11 = v10;
    uint64_t v12 = (unsigned int *)&enum case for StateError.watchNotPaired(_:);
LABEL_6:
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *v12, v9);
    swift_willThrow();
    swift_errorRetain();
    id v14 = (void *)sub_100017E20();
    ((void (**)(void, void, void *))a4)[2](a4, 0, v14);

    swift_errorRelease();
    goto LABEL_7;
  }
  if ((sub_100015698() & 1) == 0)
  {
    uint64_t v9 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v11 = v13;
    uint64_t v12 = (unsigned int *)&enum case for StateError.workoutApplicationNotInstalled(_:);
    goto LABEL_6;
  }
  sub_100018140();
  sub_100018180();
  uint64_t v7 = (void *)sub_100018170();
  sub_100018160();
  sub_100018150();
  uint64_t v8 = (void *)sub_1000180C0();

  swift_release();
  if (sub_1000150C8())
  {
    id v15 = sub_1000046E4();
    Class isa = sub_100017E40().super.isa;
    uint64_t v17 = *(unsigned int *)(a3 + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_requestingProcessIdentifier);
    aBlock[4] = sub_100013CB8;
    aBlock[5] = v6;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000049FC;
    aBlock[3] = &unk_10001D6F8;
    id v18 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v15 _startWatchAppWithWorkoutPlanData:isa processIdentifier:v17 completion:v18];
    _Block_release(v18);
    swift_release();

    return;
  }
  uint64_t v19 = sub_100018070();
  sub_100013C14(&qword_100020E78, (void (*)(uint64_t))&type metadata accessor for AppError);
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v19 - 8) + 104))(v20, enum case for AppError.applicationNotInForeground(_:), v19);
  uint64_t v21 = (void *)sub_100017E20();
  ((void (**)(void, void, void *))a4)[2](a4, 0, v21);

LABEL_7:
  swift_errorRelease();
  swift_release();
}

uint64_t sub_10000DEAC(uint64_t a1, int a2, void *a3, const void *a4)
{
  id v26 = a3;
  int v25 = a2;
  uint64_t v6 = sub_1000045D0(&qword_100020E28);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  __chkstk_darwin(v7);
  uint64_t v8 = sub_100018000();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v12 = &v24[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11);
  id v14 = &v24[-v13];
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a4;
  _Block_copy(a4);
  sub_100004F28(a1, (uint64_t)v14);
  uint64_t v16 = sub_100017FB0();
  unint64_t v18 = v17;
  Class isa = sub_100017E40().super.isa;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 16))(v12, v14, v8);
  unint64_t v20 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_100013A34;
  *(void *)(v21 + 24) = v15;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v9 + 32))(v21 + v20, v12, v8);
  aBlock[4] = sub_100013B90;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000049FC;
  aBlock[3] = &unk_10001D658;
  uint64_t v22 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v26 openWorkoutAppWithWorkoutPlanData:isa autostartWorkoutPlan:v25 & 1 completion:v22];
  sub_100012E38(v16, v18);
  _Block_release(v22);

  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v14, v8);
  return swift_release();
}

uint64_t sub_10000E2C0(uint64_t a1, uint64_t a2)
{
  if (sub_10001540C())
  {
    if (sub_100015698())
    {
      uint64_t v3 = sub_100018040();
      sub_100013C14(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v3 - 8) + 104))(v4, enum case for ImportError.unsupportedPlatform(_:), v3);
      uint64_t v5 = (void *)sub_100017E20();
      (*(void (**)(uint64_t, void, void *))(a2 + 16))(a2, 0, v5);

      goto LABEL_7;
    }
    uint64_t v6 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v8 = v10;
    uint64_t v9 = (unsigned int *)&enum case for StateError.workoutApplicationNotInstalled(_:);
  }
  else
  {
    uint64_t v6 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v8 = v7;
    uint64_t v9 = (unsigned int *)&enum case for StateError.watchNotPaired(_:);
  }
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *v9, v6);
  swift_willThrow();
  swift_errorRetain();
  uint64_t v11 = (void *)sub_100017E20();
  (*(void (**)(uint64_t, void, void *))(a2 + 16))(a2, 0, v11);

  swift_errorRelease();
LABEL_7:
  return swift_errorRelease();
}

uint64_t sub_10000E510(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(void, void, void))
{
  uint64_t v7 = sub_100018000();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  _Block_copy(a4);
  if ((sub_10001540C() & 1) == 0)
  {
    uint64_t v13 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v15 = v14;
    uint64_t v16 = (unsigned int *)&enum case for StateError.watchNotPaired(_:);
LABEL_6:
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *v16, v13);
    swift_willThrow();
    swift_errorRetain();
    unint64_t v18 = (void *)sub_100017E20();
    ((void (**)(void, void, void *))a4)[2](a4, 0, v18);

    swift_errorRelease();
    swift_errorRelease();
    return swift_release();
  }
  if ((sub_100015698() & 1) == 0)
  {
    uint64_t v13 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v15 = v17;
    uint64_t v16 = (unsigned int *)&enum case for StateError.workoutApplicationNotInstalled(_:);
    goto LABEL_6;
  }
  sub_100012E90(a1, a2);
  sub_100017FF0();
  sub_100018180();
  uint64_t v12 = (void *)sub_100018170();
  sub_100018160();
  sub_100018150();
  id v25 = v12;
  unint64_t v20 = (void *)sub_100017FA0();

  swift_release();
  id v21 = sub_100004758();
  uint64_t v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = v20;
  v23[3] = v22;
  v23[4] = sub_100013CB8;
  v23[5] = v11;
  id v24 = v20;
  swift_retain();
  swift_retain();
  sub_100018200();

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  return swift_release();
}

uint64_t sub_10000E8E0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_10000C364((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_10000E9B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_100017DF0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_100017E10();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_100017E00();
  sub_10000C364(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_10000EA70(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x10000ECD8);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_100012E90(a3, a4);
                  sub_100012E90(a1, a2);
                  char v17 = sub_10000E9B8((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_100012E38(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_100012E90(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_10000E9B8(v21, v22, v20, a3, a4);
                  sub_100012E38(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_100012E90(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_100012E90(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_10000E8E0(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_100012E38(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

void sub_10000ED08(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (**a5)(void, void, void))
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a5;
  BOOL v11 = (void *)swift_allocObject();
  _OWORD v11[2] = sub_100013CB8;
  v11[3] = v10;
  v11[4] = a4;
  v11[5] = a1;
  swift_retain_n();
  id v12 = a4;
  swift_bridgeObjectRetain_n();
  id v13 = v12;
  _Block_copy(a5);
  if ((sub_10001540C() & 1) == 0)
  {
    uint64_t v17 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v19 = v18;
    uint64_t v20 = (unsigned int *)&enum case for StateError.watchNotPaired(_:);
LABEL_7:
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *v20, v17);
    swift_willThrow();
    swift_bridgeObjectRelease();

    swift_release_n();
    swift_release();
    return;
  }
  if ((sub_100015698() & 1) == 0)
  {
    uint64_t v17 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v19 = v21;
    uint64_t v20 = (unsigned int *)&enum case for StateError.workoutApplicationNotInstalled(_:);
    goto LABEL_7;
  }
  if (sub_100016198(a2, a3))
  {
    uint64_t v14 = sub_100018040();
    sub_100013C14(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v15, enum case for ImportError.unsupportedPlatform(_:), v14);
    uint64_t v16 = (void *)sub_100017E20();
    ((void (**)(void, void, void *))a5)[2](a5, 0, v16);

    swift_errorRelease();
    swift_release();
  }
  else
  {
    id v22 = sub_100004758();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = sub_100013964;
    *(void *)(v23 + 24) = v11;
    swift_retain();
    sub_100018190();
    swift_release();
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_10000F090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (**a5)(void, void, void))
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a5;
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  BOOL v11 = (void *)swift_allocObject();
  _OWORD v11[2] = sub_100013CB8;
  v11[3] = v9;
  v11[4] = a1;
  v11[5] = v10;
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  _Block_copy(a5);
  if ((sub_10001540C() & 1) == 0)
  {
    uint64_t v15 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v17 = v16;
    uint64_t v18 = (unsigned int *)&enum case for StateError.watchNotPaired(_:);
LABEL_7:
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v15 - 8) + 104))(v17, *v18, v15);
    swift_willThrow();
    swift_release_n();
    swift_bridgeObjectRelease();
    swift_release_n();
    return swift_release();
  }
  if ((sub_100015698() & 1) == 0)
  {
    uint64_t v15 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v17 = v19;
    uint64_t v18 = (unsigned int *)&enum case for StateError.workoutApplicationNotInstalled(_:);
    goto LABEL_7;
  }
  if (sub_100016198(a2, a3))
  {
    uint64_t v12 = sub_100018040();
    sub_100013C14(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v12 - 8) + 104))(v13, enum case for ImportError.unsupportedPlatform(_:), v12);
    uint64_t v14 = (void *)sub_100017E20();
    ((void (**)(void, void, void *))a5)[2](a5, 0, v14);

    swift_errorRelease();
    swift_release();
  }
  else
  {
    id v21 = sub_100004758();
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_100013558;
    *(void *)(v22 + 24) = v11;
    swift_retain();
    sub_100018190();
    swift_release();
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release_n();
  return swift_bridgeObjectRelease();
}

void sub_10000F448(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, const void *a5, const char *a6, void (*a7)(unint64_t *, char *, unint64_t, uint64_t, const void *), uint64_t a8)
{
  unint64_t v49 = a7;
  uint64_t v50 = a8;
  unint64_t v48 = (char *)a6;
  uint64_t v53 = a1;
  uint64_t v12 = sub_100017F50();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100018340();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  unint64_t v54 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  id v21 = (char *)&v42 - v20;
  _Block_copy(a5);
  uint64_t v22 = sub_100015C9C(a2, a3);
  unint64_t v24 = v23;
  uint64_t v47 = v22;
  uint64_t v44 = a4;
  uint64_t v51 = a5;
  sub_100018320();
  uint64_t v25 = v53;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v26 = sub_100018330();
  os_log_type_t v27 = sub_1000184D0();
  int v43 = v27;
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v52 = v16;
  uint64_t v46 = v17;
  if (v28)
  {
    uint64_t v29 = swift_slowAlloc();
    os_log_type_t v42 = (unint64_t *)swift_slowAlloc();
    uint64_t v56 = v42;
    *(_DWORD *)uint64_t v29 = 134218242;
    unint64_t v30 = v24;
    uint64_t v31 = *(void *)(v53 + 16);
    swift_bridgeObjectRelease();
    uint64_t v55 = v31;
    sub_1000185B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v55 = sub_1000172BC((uint64_t)v47, v30, (uint64_t *)&v56);
    unint64_t v24 = v30;
    uint64_t v25 = v53;
    uint64_t v17 = v46;
    sub_1000185B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v26, (os_log_type_t)v43, v48, (uint8_t *)v29, 0x16u);
    unint64_t v48 = (char *)v26;
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v16 = v52;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v16);
  int64_t v32 = *(void *)(v25 + 16);
  uint64_t v33 = (unint64_t *)&_swiftEmptyArrayStorage;
  unint64_t v45 = v24;
  if (v32)
  {
    uint64_t v56 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_10000C6E8(0, v32, 0);
    uint64_t v33 = v56;
    uint64_t v34 = (unint64_t *)(v25 + 40);
    do
    {
      uint64_t v35 = *(v34 - 1);
      unint64_t v36 = *v34;
      sub_100012E90(v35, *v34);
      sub_100017F10();
      sub_100012E38(v35, v36);
      uint64_t v56 = v33;
      unint64_t v38 = v33[2];
      unint64_t v37 = v33[3];
      if (v38 >= v37 >> 1)
      {
        sub_10000C6E8(v37 > 1, v38 + 1, 1);
        uint64_t v33 = v56;
      }
      v34 += 2;
      v33[2] = v38 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))((unint64_t)v33+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(void *)(v13 + 72) * v38, v15, v12);
      --v32;
    }
    while (v32);
    uint64_t v39 = v51;
  }
  else
  {
    uint64_t v39 = v51;
  }
  id v40 = v49;
  uint64_t v41 = v44;
  _Block_copy(v39);
  v40(v33, v47, v45, v41, v39);
  _Block_release(v39);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _Block_release(v39);
}

uint64_t sub_10000FAFC(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, char *a5)
{
  uint64_t v10 = sub_100018340();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = a5;
  _Block_copy(a5);
  uint64_t v14 = sub_100015C9C(a2, a3);
  uint64_t v16 = v15;
  int v43 = v13;
  uint64_t v17 = v11;
  uint64_t v18 = (void *)swift_allocObject();
  void v18[2] = sub_100013CB8;
  v18[3] = v44;
  v18[4] = a1;
  v18[5] = a4;
  v18[6] = v14;
  v18[7] = v16;
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  id v19 = a4;
  swift_bridgeObjectRetain_n();
  id v20 = v19;
  if (sub_10001540C())
  {
    if (sub_100015698())
    {
      if (sub_100016198((uint64_t)v14, v16))
      {
        uint64_t v21 = sub_100018040();
        sub_100013C14(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
        swift_allocError();
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v21 - 8) + 104))(v22, enum case for ImportError.unsupportedPlatform(_:), v21);
        unint64_t v23 = (void *)sub_100017E20();
        (*((void (**)(char *, void, void *))a5 + 2))(a5, 0, v23);

        swift_errorRelease();
        swift_release();
      }
      else
      {
        id v40 = sub_100004758();
        uint64_t v41 = swift_allocObject();
        *(void *)(v41 + 16) = sub_100013158;
        *(void *)(v41 + 24) = v18;
        swift_retain();
        sub_100018190();
        swift_release();
        swift_release();
      }
      swift_release();
      swift_release();
      swift_bridgeObjectRelease_n();

      return swift_bridgeObjectRelease();
    }
    uint64_t v24 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    uint64_t v25 = swift_allocError();
    uint64_t v27 = v29;
    BOOL v28 = (unsigned int *)&enum case for StateError.workoutApplicationNotInstalled(_:);
  }
  else
  {
    uint64_t v24 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    uint64_t v25 = swift_allocError();
    uint64_t v27 = v26;
    BOOL v28 = (unsigned int *)&enum case for StateError.watchNotPaired(_:);
  }
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v24 - 8) + 104))(v27, *v28, v24);
  swift_willThrow();
  swift_bridgeObjectRelease_n();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v30 = v17;
  uint64_t v31 = v43;
  sub_100018320();
  swift_errorRetain();
  swift_errorRetain();
  int64_t v32 = sub_100018330();
  os_log_type_t v33 = sub_1000184E0();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v42 = v10;
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v45 = v25;
    uint64_t v46 = v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    int v43 = a5;
    swift_errorRetain();
    sub_1000045D0(&qword_100020DE0);
    uint64_t v36 = sub_100018430();
    uint64_t v45 = sub_1000172BC(v36, v37, &v46);
    a5 = v43;
    sub_1000185B0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "WorkoutKitXPCService: failed to store workout plans due to %s", v34, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v42);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v10);
  }
  swift_errorRetain();
  unint64_t v38 = (void *)sub_100017E20();
  (*((void (**)(char *, void, void *))a5 + 2))(a5, 0, v38);

  swift_errorRelease();
  swift_errorRelease();
  return swift_release();
}

uint64_t sub_100010150(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_1000184C0();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10000C948(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1000101E8(uint64_t a1, void (*a2)(void, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v30 = a6;
  uint64_t v31 = a4;
  uint64_t v10 = sub_100018340();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100017F50();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    a2(0, a1);
    return swift_errorRelease();
  }
  else
  {
    v27[1] = a5;
    v27[2] = v11;
    uint64_t v29 = v13;
    uint64_t v27[3] = v10;
    uint64_t v19 = v31;
    int64_t v20 = *(void *)(v31 + 16);
    uint64_t v21 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t v28 = a3;
    if (v20)
    {
      v27[0] = a2;
      os_log_type_t v33 = (unint64_t *)&_swiftEmptyArrayStorage;
      sub_10000C6E8(0, v20, 0);
      uint64_t v21 = v33;
      uint64_t v32 = v15 + 32;
      uint64_t v22 = (unint64_t *)(v19 + 40);
      do
      {
        uint64_t v23 = *(v22 - 1);
        unint64_t v24 = *v22;
        sub_100012E90(v23, *v22);
        sub_100017F10();
        sub_100012E38(v23, v24);
        os_log_type_t v33 = v21;
        unint64_t v26 = v21[2];
        unint64_t v25 = v21[3];
        if (v26 >= v25 >> 1)
        {
          sub_10000C6E8(v25 > 1, v26 + 1, 1);
          uint64_t v21 = v33;
        }
        v22 += 2;
        v21[2] = v26 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))((unint64_t)v21+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v26, v17, v14);
        --v20;
      }
      while (v20);
      a2 = (void (*)(void, uint64_t))v27[0];
      a3 = v28;
    }
    sub_100006630((uint64_t)v21, v30, a2, a3);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100010688(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  uint64_t v8 = v7 & *(void *)(a1 + 56);
  int64_t v18 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v8)
    {
      v8 &= v8 - 1;
      goto LABEL_5;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v18) {
      return swift_release();
    }
    uint64_t v15 = *(void *)(v17 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v18) {
        return swift_release();
      }
      uint64_t v15 = *(void *)(v17 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v18) {
          return swift_release();
        }
        uint64_t v15 = *(void *)(v17 + 8 * v10);
        if (!v15)
        {
          int64_t v10 = v14 + 3;
          if (v14 + 3 >= v18) {
            return swift_release();
          }
          uint64_t v15 = *(void *)(v17 + 8 * v10);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    uint64_t v8 = (v15 - 1) & v15;
LABEL_5:
    swift_bridgeObjectRetain();
    dispatch_group_enter(a2);
    id v11 = sub_100004758();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a4;
    *(void *)(v12 + 24) = a2;
    swift_retain();
    uint64_t v13 = a2;
    sub_1000181D0();
    swift_bridgeObjectRelease();

    uint64_t result = swift_release();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v18) {
    return swift_release();
  }
  uint64_t v15 = *(void *)(v17 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v18) {
      return swift_release();
    }
    uint64_t v15 = *(void *)(v17 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1000108A8(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  uint64_t v6 = sub_100018360();
  uint64_t v33 = *(void *)(v6 - 8);
  uint64_t v34 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100018390();
  uint64_t v31 = *(void *)(v9 - 8);
  uint64_t v32 = v9;
  __chkstk_darwin(v9);
  id v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100018370();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  uint64_t v17 = *(void *)(a1 + 16);
  _Block_copy(a3);
  if (v17)
  {
    int64_t v18 = a2;
    uint64_t v19 = dispatch_group_create();
    uint64_t v30 = v19;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = 0;
    id v21 = v18;
    sub_100010688(a1, v19, (uint64_t)v21, v20);

    sub_100012FB0(0, &qword_100020DC0);
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for DispatchQoS.QoSClass.default(_:), v12);
    uint64_t v29 = sub_100018560();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v22 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v23 = (void *)swift_allocObject();
    v23[2] = v22;
    v23[3] = sub_100013CB8;
    v23[4] = v16;
    v23[5] = v20;
    aBlock[4] = sub_100013004;
    aBlock[5] = v23;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100009D68;
    aBlock[3] = &unk_10001D130;
    unint64_t v24 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_100018380();
    uint64_t v35 = &_swiftEmptyArrayStorage;
    sub_100013C14(&qword_100020DC8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000045D0(&qword_100020DD0);
    sub_100012B44();
    uint64_t v25 = v34;
    sub_1000185E0();
    uint64_t v27 = (void *)v29;
    unint64_t v26 = v30;
    sub_100018510();

    _Block_release(v24);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v25);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v32);
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  else
  {
    a3[2](a3, 1, 0);
    return swift_release();
  }
}

uint64_t sub_100010D58(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(void, void, void))
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a4;
  _Block_copy(a4);
  if ((sub_10001540C() & 1) == 0)
  {
    uint64_t v14 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v16 = v15;
    uint64_t v17 = (unsigned int *)&enum case for StateError.watchNotPaired(_:);
LABEL_7:
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *v17, v14);
    swift_willThrow();
    swift_errorRetain();
    Class isa = sub_100018470().super.isa;
    uint64_t v20 = (void *)sub_100017E20();
    ((void (**)(void, Class, void *))a4)[2](a4, isa, v20);

    swift_errorRelease();
    goto LABEL_8;
  }
  if ((sub_100015698() & 1) == 0)
  {
    uint64_t v14 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v16 = v18;
    uint64_t v17 = (unsigned int *)&enum case for StateError.workoutApplicationNotInstalled(_:);
    goto LABEL_7;
  }
  uint64_t v8 = sub_100015C9C(a1, a2);
  if (sub_100016198((uint64_t)v8, v9))
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_100018040();
    sub_100013C14(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v10 - 8) + 104))(v11, enum case for ImportError.unsupportedPlatform(_:), v10);
    Class v12 = sub_100018470().super.isa;
    uint64_t v13 = (void *)sub_100017E20();
    ((void (**)(void, Class, void *))a4)[2](a4, v12, v13);

LABEL_8:
    swift_errorRelease();
    goto LABEL_9;
  }
  id v22 = sub_100004758();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = sub_1000130BC;
  *(void *)(v23 + 24) = v7;
  swift_retain();
  sub_1000181C0();
  swift_release();
  swift_bridgeObjectRelease();

LABEL_9:
  return swift_release();
}

uint64_t sub_1000110D8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1000186F0();
  __break(1u);
  return result;
}

void sub_1000111CC(uint64_t a1, unint64_t a2, void *a3, void *aBlock)
{
  _Block_copy(aBlock);
  if ((sub_10001540C() & 1) == 0)
  {
    uint64_t v14 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v16 = v15;
    uint64_t v17 = (unsigned int *)&enum case for StateError.watchNotPaired(_:);
LABEL_7:
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *v17, v14);
    swift_willThrow();
    swift_errorRetain();
    uint64_t v19 = (void *)sub_100017E20();
    (*((void (**)(void *, void, void *))aBlock + 2))(aBlock, 0, v19);

    swift_errorRelease();
    goto LABEL_8;
  }
  if ((sub_100015698() & 1) == 0)
  {
    uint64_t v14 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v16 = v18;
    uint64_t v17 = (unsigned int *)&enum case for StateError.workoutApplicationNotInstalled(_:);
    goto LABEL_7;
  }
  uint64_t v8 = sub_100015C9C(a1, a2);
  uint64_t v10 = v9;
  if ((sub_100016198((uint64_t)v8, v9) & 1) == 0)
  {
    sub_1000045D0(&qword_100020E40);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10001A020;
    *(void *)(inited + 32) = v8;
    *(void *)(inited + 40) = v10;
    uint64_t v21 = sub_100010150(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    _Block_copy(aBlock);
    sub_1000108A8(v21, a3, (void (**)(void, void, void))aBlock);
    _Block_release(aBlock);
    swift_bridgeObjectRelease();
    _Block_release(aBlock);
    return;
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_100018040();
  sub_100013C14(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v12, enum case for ImportError.unsupportedPlatform(_:), v11);
  uint64_t v13 = (void *)sub_100017E20();
  (*((void (**)(void *, void, void *))aBlock + 2))(aBlock, 0, v13);

LABEL_8:
  swift_errorRelease();
  _Block_release(aBlock);
}

uint64_t sub_100011510(uint64_t a1, uint64_t a2, void *a3, void (**a4)(const void *, void, void *))
{
  id v36 = a3;
  uint64_t v42 = a2;
  uint64_t v5 = sub_100018340();
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v40 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  unint64_t v37 = (char *)&v35 - v9;
  uint64_t v10 = sub_1000045D0(&qword_100020E28);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100017EB0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v35 - v18;
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = a4;
  sub_100012FB0(0, &qword_100020E30);
  sub_100012FB0(0, &qword_100020E38);
  unint64_t v38 = a4;
  _Block_copy(a4);
  uint64_t v20 = (void *)sub_100018500();
  uint64_t v21 = v20;
  if (v20)
  {
    id v22 = [v20 UUID];

    sub_100017E90();
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    v23(v12, v17, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
    int v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
    uint64_t v25 = v41;
    if (v24 != 1)
    {
      v23(v19, v12, v13);
      Class isa = sub_100017E80().super.isa;
      aBlock[4] = sub_100013DB8;
      aBlock[5] = v25;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100007490;
      aBlock[3] = &unk_10001D090;
      uint64_t v27 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      [v36 retrieveWorkoutCompositionFromWorkoutUUID:isa completion:v27];
      _Block_release(v27);

      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      return swift_release();
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  }
  sub_100013C5C((uint64_t)v12, &qword_100020E28);
  sub_100018320();
  uint64_t v28 = sub_100018330();
  os_log_type_t v29 = sub_1000184E0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "WorkoutKitXPCService: failed to unarchive HKWorkout", v30, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v40);
  uint64_t v31 = sub_100018040();
  sub_100013C14(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v31 - 8) + 104))(v32, enum case for ImportError.unrecognizedDataFormat(_:), v31);
  uint64_t v33 = (void *)sub_100017E20();
  v38[2](v38, 0, v33);

  swift_errorRelease();
  return swift_release();
}

uint64_t sub_100011C24(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(void, void, void))
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a4;
  _Block_copy(a4);
  uint64_t v8 = sub_100015C9C(a1, a2);
  if (sub_100016198((uint64_t)v8, v9))
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_100018040();
    sub_100013C14(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v10 - 8) + 104))(v11, enum case for ImportError.unsupportedPlatform(_:), v10);
    uint64_t v12 = (void *)sub_100017E20();
    ((void (**)(void, void, void *))a4)[2](a4, 0, v12);

    swift_errorRelease();
  }
  else
  {
    id v13 = sub_100004758();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_100013CBC;
    *(void *)(v14 + 24) = v7;
    swift_retain();
    sub_100018190();
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_release();
}

void sub_100011E70(uint64_t a1, uint64_t a2, void *a3, void (**a4)(void, void, void))
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  _Block_copy(a4);
  if ((sub_10001540C() & 1) == 0)
  {
    uint64_t v13 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v15 = v14;
    uint64_t v16 = (unsigned int *)&enum case for StateError.watchNotPaired(_:);
LABEL_11:
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *v16, v13);
    swift_willThrow();
    sub_100012FB0(0, &qword_100020DF8);
    Class isa = sub_100018570(0).super.super.isa;
    swift_errorRetain();
    uint64_t v19 = (void *)sub_100017E20();
    ((void (**)(void, Class, void *))a4)[2](a4, isa, v19);

    swift_errorRelease();
    swift_errorRelease();
    goto LABEL_12;
  }
  if ((sub_100015698() & 1) == 0)
  {
    uint64_t v13 = sub_100018030();
    sub_100013C14(&qword_100020DF0, (void (*)(uint64_t))&type metadata accessor for StateError);
    swift_allocError();
    uint64_t v15 = v17;
    uint64_t v16 = (unsigned int *)&enum case for StateError.workoutApplicationNotInstalled(_:);
    goto LABEL_11;
  }
  if (sub_100016198(a1, a2))
  {
LABEL_6:
    sub_100012FB0(0, &qword_100020DF8);
    Class v23 = sub_100018570(0).super.super.isa;
    uint64_t v10 = sub_100018040();
    sub_100013C14(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v10 - 8) + 104))(v11, enum case for ImportError.unsupportedPlatform(_:), v10);
    uint64_t v12 = (void *)sub_100017E20();
    ((void (**)(void, Class, void *))a4)[2](a4, v23, v12);

    swift_errorRelease();
    swift_release();

    return;
  }
  id v9 = sub_100015990();
  if (v9)
  {

    goto LABEL_6;
  }
  id v20 = sub_100004758();
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = sub_100012CC8;
  v21[3] = v8;
  uint64_t v21[4] = a3;
  v21[5] = a1;
  v21[6] = a2;
  swift_retain();
  id v22 = a3;
  swift_bridgeObjectRetain();
  sub_100018190();
  swift_release();

LABEL_12:
  swift_release();
}

uint64_t sub_10001223C(void *a1, uint64_t a2, uint64_t a3, void *a4, void (**a5)(void, void, void))
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a5;
  _Block_copy(a5);
  if (sub_100016198(a2, a3))
  {
    uint64_t v11 = sub_100018040();
    sub_100013C14(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
    swift_allocError();
    uint64_t v13 = v12;
    uint64_t v14 = (unsigned int *)&enum case for ImportError.unsupportedPlatform(_:);
  }
  else
  {
    if (*((unsigned char *)a4 + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_hasPrivateEntitlements) == 1)
    {
      id v15 = [a1 unsignedIntegerValue];
      id v16 = sub_100004758();
      uint64_t v17 = (void *)swift_allocObject();
      v17[2] = sub_100013CB8;
      v17[3] = v10;
      v17[4] = a4;
      v17[5] = v15;
      swift_retain();
      id v18 = a4;
      sub_100018190();
      swift_release();

      goto LABEL_7;
    }
    uint64_t v11 = sub_100018050();
    sub_100013C14((unint64_t *)&qword_100020DB8, (void (*)(uint64_t))&type metadata accessor for XPCServiceError);
    swift_allocError();
    uint64_t v13 = v19;
    uint64_t v14 = (unsigned int *)&enum case for XPCServiceError.notEntitled(_:);
  }
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *v14, v11);
  id v20 = (void *)sub_100017E20();
  ((void (**)(void, void, void *))a5)[2](a5, 0, v20);

  swift_errorRelease();
LABEL_7:
  return swift_release();
}

uint64_t sub_1000124A4(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  uint64_t v6 = sub_100018360();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100018390();
  uint64_t v41 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v40 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100018370();
  uint64_t v39 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  if (*((unsigned char *)a2 + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_hasPrivateEntitlements) == 1)
  {
    unint64_t v38 = v9;
    uint64_t v16 = *(void *)(a1 + 16);
    _Block_copy(a3);
    if (v16)
    {
      uint64_t v34 = v10;
      uint64_t v35 = v7;
      uint64_t v36 = v6;
      uint64_t v37 = v15;
      uint64_t v17 = dispatch_group_create();
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = 0;
      swift_bridgeObjectRetain();
      v33[1] = a1;
      uint64_t v19 = (uint64_t *)(a1 + 40);
      do
      {
        uint64_t v20 = *v19;
        aBlock = (void **)*(v19 - 1);
        uint64_t v44 = v20;
        swift_bridgeObjectRetain();
        sub_100009760((uint64_t *)&aBlock, v17, (uint64_t)a2, v18);
        swift_bridgeObjectRelease();
        v19 += 2;
        --v16;
      }
      while (v16);
      swift_bridgeObjectRelease();
      sub_100012FB0(0, &qword_100020DC0);
      uint64_t v21 = v39;
      (*(void (**)(char *, void, uint64_t))(v39 + 104))(v14, enum case for DispatchQoS.QoSClass.default(_:), v12);
      id v22 = (void *)sub_100018560();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v14, v12);
      Class v23 = (void *)swift_allocObject();
      v23[2] = a2;
      v23[3] = sub_100012A98;
      v23[4] = v37;
      v23[5] = v18;
      uint64_t v47 = sub_100012B20;
      unint64_t v48 = v23;
      aBlock = _NSConcreteStackBlock;
      uint64_t v44 = 1107296256;
      uint64_t v45 = sub_100009D68;
      uint64_t v46 = &unk_10001CD48;
      int v24 = _Block_copy(&aBlock);
      id v25 = a2;
      swift_retain();
      swift_retain();
      unint64_t v26 = v40;
      sub_100018380();
      uint64_t v42 = &_swiftEmptyArrayStorage;
      sub_100013C14(&qword_100020DC8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_1000045D0(&qword_100020DD0);
      sub_100012B44();
      uint64_t v27 = v38;
      uint64_t v28 = v36;
      sub_1000185E0();
      sub_100018510();

      _Block_release(v24);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v27, v28);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v26, v34);
      swift_release();
      swift_release();
      return swift_release();
    }
    a3[2](a3, 1, 0);
  }
  else
  {
    uint64_t v30 = sub_100018050();
    sub_100013C14((unint64_t *)&qword_100020DB8, (void (*)(uint64_t))&type metadata accessor for XPCServiceError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v30 - 8) + 104))(v31, enum case for XPCServiceError.notEntitled(_:), v30);
    _Block_copy(a3);
    uint64_t v32 = (void *)sub_100017E20();
    ((void (**)(void, void, void *))a3)[2](a3, 0, v32);

    swift_errorRelease();
  }
  return swift_release();
}

uint64_t sub_100012A60()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100012A98(char a1, uint64_t a2)
{
  sub_10000498C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100012AA0()
{
  swift_errorRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100012AD8()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

void sub_100012B20()
{
  sub_100009C5C(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_100012B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100012B3C()
{
  return swift_release();
}

unint64_t sub_100012B44()
{
  unint64_t result = qword_100020DD8;
  if (!qword_100020DD8)
  {
    sub_100012BA0(&qword_100020DD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020DD8);
  }
  return result;
}

uint64_t sub_100012BA0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100012BEC()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100012C34(uint64_t a1, uint64_t a2)
{
  sub_100009A0C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(NSObject **)(v2 + 40));
}

uint64_t sub_100012C40()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100012C80(uint64_t a1, uint64_t a2)
{
  return sub_1000094BC(a1, a2, *(void (**)(void, uint64_t))(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_100012C8C(uint64_t a1)
{
  return (*(uint64_t (**)(BOOL, uint64_t))(v1 + 16))(a1 == 0, a1);
}

uint64_t sub_100012CC0(uint64_t a1, uint64_t a2)
{
  return sub_10000A358(a1, a2, *(uint64_t (**)(void))(v2 + 16), *(void *)(v2 + 24));
}

void sub_100012CC8(uint64_t a1, uint64_t a2)
{
  sub_100008694(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100012CD0()
{
  swift_release();

  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 56, 7);
}

void sub_100012D18(uint64_t a1, uint64_t a2)
{
  sub_100008704(a1, a2, *(void (**)(id, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_100012D28()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100012D60()
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100012DB0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_100008FE0(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(uint64_t (**)(void, uint64_t))(v3 + 32), *(void *)(v3 + 40), *(void **)(v3 + 48));
}

uint64_t sub_100012DE0()
{
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

void sub_100012E18(uint64_t a1)
{
  sub_10000A29C(a1, *(void (**)(id, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_100012E24(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100012E38(a1, a2);
  }
  return a1;
}

uint64_t sub_100012E38(uint64_t a1, unint64_t a2)
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

uint64_t sub_100012E90(uint64_t a1, unint64_t a2)
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

uint64_t sub_100012EE8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100012E90(a1, a2);
  }
  return a1;
}

void sub_100012EFC(uint64_t a1, uint64_t a2)
{
  sub_100008518(a1, a2, *(void (**)(id, uint64_t))(v2 + 16));
}

void sub_100012F04(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_1000073F8(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_100012F0C()
{
  return sub_100013ABC((uint64_t (*)(void))&type metadata accessor for UUID);
}

uint64_t sub_100012F24(uint64_t a1, uint8_t *a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(sub_100017EB0() - 8);
  uint64_t v8 = *(void (**)(uint64_t, unint64_t, uint64_t))(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  uint64_t v10 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return sub_100007894(a1, a2, a3, v8, v9, v10);
}

uint64_t sub_100012FB0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100012FEC()
{
  return sub_1000138B4((void (*)(void))&_swift_release);
}

void sub_100013004()
{
  sub_100009EB0(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_100013014()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100013054(uint64_t a1, uint64_t a2)
{
  return sub_100009FE8(a1, a2, *(void (**)(void, void))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_100013074()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000130B4(int a1, uint64_t a2)
{
  sub_100009E40(a1, a2, *(void *)(v2 + 16), *(dispatch_group_t *)(v2 + 24));
}

void sub_1000130BC(uint64_t a1, uint64_t a2)
{
  sub_10000729C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1000130C4()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000130FC(unint64_t a1, uint64_t a2)
{
  return sub_1000069A0(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_100013108()
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100013158(uint64_t a1, uint64_t a2)
{
  return sub_100005EE8(a1, a2, *(void (**)(void, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(NSObject **)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_100013168(uint64_t a1, uint64_t a2)
{
  return sub_10000A5C4(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_100013170()
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000131C0(uint64_t a1, uint64_t a2)
{
  return sub_1000101E8(a2, *(void (**)(void, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_1000131D4()
{
  return sub_1000138B4((void (*)(void))&_swift_release);
}

uint64_t sub_1000131EC()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_10001324C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_10000AA38(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(uint64_t (**)(void, uint64_t))(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void **)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 72));
}

void *sub_100013288(uint64_t a1, uint64_t a2)
{
  uint64_t result = &_swiftEmptyArrayStorage;
  unint64_t v11 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v7 = *(void *)(sub_100017F50() - 8);
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v9 = *(void *)(v7 + 72);
    swift_bridgeObjectRetain();
    do
    {
      sub_10000AFD8(v8, a2, &v10);
      if (v2)
      {
        swift_bridgeObjectRelease();
        return (void *)swift_bridgeObjectRelease();
      }
      if (v10)
      {
        sub_100018460();
        if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1000184A0();
        }
        sub_1000184B0();
        sub_100018490();
      }
      v8 += v9;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    return (void *)v11;
  }
  return result;
}

uint64_t sub_1000133F4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_errorRelease();
  return _swift_deallocObject(v0, 64, 7);
}

void sub_100013444(char a1, uint64_t a2)
{
  sub_10000B8C8(a1, a2, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24), *(void *)(v2 + 32), *(void (**)(void))(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_100013458()
{
  swift_release();
  swift_release();
  swift_release();
  swift_errorRelease();
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1000134A8(uint64_t a1, uint64_t a2)
{
  return sub_10000BA50(a1, a2, *(unsigned __int8 *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(uint64_t (**)(void, void))(v2 + 40), *(void *)(v2 + 48), *(unsigned __int8 *)(v2 + 56), *(void *)(v2 + 64));
}

uint64_t sub_1000134E4(uint64_t a1, uint64_t a2)
{
  return sub_10000C020(a1, a2, *(uint64_t (**)(void, void))(v2 + 16), *(void *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(void *)(v2 + 40), "WorkoutKitXPCService: update external provider error: %s");
}

uint64_t sub_100013510()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100013558(uint64_t a1, uint64_t a2)
{
  return sub_10000BDA0(a1, a2, *(uint64_t (**)(void))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

void *sub_100013564(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v21 = a2;
  uint64_t v5 = sub_1000045D0(&qword_100020E50);
  __chkstk_darwin(v5 - 8);
  uint64_t v20 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100018000();
  uint64_t v7 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = &_swiftEmptyArrayStorage;
  unint64_t v26 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    uint64_t v12 = *(void *)(sub_100017F50() - 8);
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v24 = sub_100018180();
    uint64_t v23 = sub_100018160();
    uint64_t v22 = *(void *)(v12 + 72);
    uint64_t v14 = a1;
    uint64_t v15 = (void (**)(char *, uint64_t))(v7 + 8);
    v19[1] = v14;
    swift_bridgeObjectRetain();
    do
    {
      sub_100017F40();
      uint64_t v16 = (void *)sub_100018170();
      sub_100018150();
      sub_100017FA0();
      if (v3)
      {

        swift_release();
        swift_errorRelease();
        (*v15)(v9, v25);
        uint64_t v3 = 0;
      }
      else
      {
        (*v15)(v9, v25);

        swift_release();
        sub_1000182C0();
        sub_1000180D0();
        uint64_t v17 = v20;
        sub_100017F00();
        uint64_t v18 = sub_100017E70();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 0, 1, v18);
        sub_1000180B0();
        sub_100017F20();
        sub_1000180F0();
        sub_100018460();
        if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1000184A0();
        }
        sub_1000184B0();
        sub_100018490();
      }
      v13 += v22;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    return (void *)v26;
  }
  return result;
}

uint64_t sub_10001389C()
{
  return sub_1000138B4((void (*)(void))&_swift_errorRelease);
}

uint64_t sub_1000138B4(void (*a1)(void))
{
  swift_release();
  swift_release();
  a1(*(void *)(v1 + 40));
  return _swift_deallocObject(v1, 48, 7);
}

void sub_10001390C(char a1, uint64_t a2)
{
  sub_10000BEC8(a1, a2, *(void *)(v2 + 16), *(void (**)(void))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_10001391C()
{
  swift_release();

  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100013964(uint64_t a1, uint64_t a2)
{
  return sub_10000A740(a1, a2, *(void (**)(void, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_100013970()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000139B8(char a1, uint64_t a2)
{
  sub_1000056F8(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void (**)(void, void))(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_1000139C8()
{
  swift_release();
  swift_errorRelease();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100013A08(uint64_t a1, uint64_t a2)
{
  return sub_10000C020(a1, a2, *(uint64_t (**)(void, void))(v2 + 16), *(void *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(void *)(v2 + 40), "WorkoutKitXPCService: nano sync error: %s");
}

void sub_100013A34(uint64_t a1, uint64_t a2)
{
  sub_100005498(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100013A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000045D0(&qword_100020E28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013AA4()
{
  return sub_100013ABC((uint64_t (*)(void))&type metadata accessor for WorkoutPlan);
}

uint64_t sub_100013ABC(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_100013B90(char a1, uint64_t a2)
{
  sub_100018000();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v2 + 16);
  return sub_1000052C8(a1, a2, v5);
}

uint64_t sub_100013C14(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100013C5C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000045D0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100013DBC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000045D0(&qword_100020EB0);
  uint64_t v2 = (void *)sub_1000186E0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (void *)*(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v5;
    unint64_t result = sub_1000142E4((uint64_t)v8);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v8;
    uint64_t v11 = (void *)(v2[7] + 16 * result);
    *uint64_t v11 = v6;
    v11[1] = v7;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v14;
    if (!--v3)
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

unint64_t sub_100013ED0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000045D0(&qword_100020EB8);
  uint64_t v2 = sub_1000186E0();
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
    sub_100014FA0(v6, (uint64_t)v15);
    unint64_t result = sub_100014328((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_100015008(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

uint64_t sub_100014000(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(63 - v3) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_8;
  }
LABEL_5:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    long long v11 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v10);
    uint64_t v12 = v11[1];
    if (v12)
    {
      long long v17 = *(void **)(*(void *)(a1 + 48) + 8 * v10);
      uint64_t v18 = *v11;
      unint64_t v19 = *((void *)&_swiftEmptyDictionarySingleton + 2);
      uint64_t v33 = v18;
      if (*((void *)&_swiftEmptyDictionarySingleton + 3) <= v19)
      {
        uint64_t v21 = v19 + 1;
        swift_bridgeObjectRetain_n();
        id v22 = v17;
        sub_100014540(v21, 1);
      }
      else
      {
        swift_bridgeObjectRetain_n();
        id v20 = v17;
      }
      uint64_t result = sub_100018580(*((void *)&_swiftEmptyDictionarySingleton + 5));
      uint64_t v23 = (char *)&_swiftEmptyDictionarySingleton + 64;
      uint64_t v24 = -1 << *((unsigned char *)&_swiftEmptyDictionarySingleton + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*((void *)&_swiftEmptyDictionarySingleton + (v25 >> 6) + 8)) == 0)
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          BOOL v30 = v26 == v29;
          if (v26 == v29) {
            unint64_t v26 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)&v23[8 * v26];
          if (v31 != -1)
          {
            unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
            goto LABEL_37;
          }
        }
        goto LABEL_41;
      }
      unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*((void *)&_swiftEmptyDictionarySingleton + (v25 >> 6) + 8))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_37:
      *(void *)&v23[(v27 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v27;
      *(void *)(*((void *)&_swiftEmptyDictionarySingleton + 6) + 8 * v27) = v17;
      uint64_t v32 = (void *)(*((void *)&_swiftEmptyDictionarySingleton + 7) + 16 * v27);
      void *v32 = v33;
      v32[1] = v12;
      ++*((void *)&_swiftEmptyDictionarySingleton + 2);
      uint64_t result = swift_bridgeObjectRelease();
      if (v5) {
        goto LABEL_5;
      }
    }
    else if (v5)
    {
      goto LABEL_5;
    }
LABEL_8:
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v13 >= v6) {
      goto LABEL_39;
    }
    unint64_t v14 = *(void *)(v2 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v6) {
        goto LABEL_39;
      }
      unint64_t v14 = *(void *)(v2 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v6) {
          goto LABEL_39;
        }
        unint64_t v14 = *(void *)(v2 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v6) {
            goto LABEL_39;
          }
          unint64_t v14 = *(void *)(v2 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v6)
  {
LABEL_39:
    sub_100014F98();
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  }
  unint64_t v14 = *(void *)(v2 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v6) {
      goto LABEL_39;
    }
    unint64_t v14 = *(void *)(v2 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_23;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

unint64_t sub_1000142E4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100018580(*(void *)(v2 + 40));
  return sub_10001436C(a1, v4);
}

unint64_t sub_100014328(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_1000185F0(*(void *)(v2 + 40));
  return sub_100014478(a1, v4);
}

unint64_t sub_10001436C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_100014F00();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_100018590();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_100018590();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_100014478(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100015018(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100018600();
      sub_100015074((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100014540(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000045D0(&qword_100020EA8);
  char v38 = a2;
  uint64_t v6 = sub_1000186D0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    BOOL v30 = *(void **)(*(void *)(v5 + 48) + 8 * v21);
    uint64_t v31 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v21);
    uint64_t v32 = *v31;
    uint64_t v33 = v31[1];
    if ((v38 & 1) == 0)
    {
      id v34 = v30;
      swift_bridgeObjectRetain();
    }
    uint64_t result = sub_100018580(*(void *)(v7 + 40));
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(void *)(*(void *)(v7 + 48) + 8 * v18) = v30;
    unint64_t v19 = (void *)(*(void *)(v7 + 56) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100014828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v55 = a7;
  uint64_t v53 = sub_100018340();
  uint64_t v54 = *(void *)(v53 - 8);
  uint64_t v15 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v52 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v50 = (char *)&v49 - v18;
  __chkstk_darwin(v17);
  uint64_t v51 = (char *)&v49 - v19;
  sub_1000045D0(&qword_100020E90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001A030;
  if (!kCFUserNotificationAlertHeaderKey)
  {
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v21 = (void *)inited;
  sub_100014F00();
  uint64_t v21[4] = sub_1000185A0();
  v21[5] = a1;
  v21[6] = a2;
  if (!kCFUserNotificationAlertMessageKey)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  v21[7] = sub_1000185A0();
  v21[8] = a3;
  v21[9] = a4;
  if (!kCFUserNotificationDefaultButtonTitleKey)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  swift_bridgeObjectRetain();
  v21[10] = sub_1000185A0();
  v21[11] = a5;
  v21[12] = a6;
  if (!kCFUserNotificationAlternateButtonTitleKey) {
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_1000185A0();
  uint64_t v23 = v55;
  v21[13] = v22;
  v21[14] = v23;
  v21[15] = a8;
  swift_bridgeObjectRetain();
  unint64_t v24 = sub_100013DBC((uint64_t)v21);
  sub_100014000(v24);
  swift_bridgeObjectRelease();
  error[0] = -1;
  sub_100014F40();
  CFDictionaryRef isa = sub_1000183A0().super.isa;
  swift_bridgeObjectRelease();
  CFUserNotificationRef v26 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, error, isa);

  if (!v26)
  {
    uint64_t v29 = v52;
    sub_100018320();
    BOOL v30 = sub_100018330();
    os_log_type_t v31 = sub_1000184E0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315138;
      swift_beginAccess();
      LODWORD(v56) = error[0];
      uint64_t v33 = sub_100018700();
      uint64_t v56 = sub_1000172BC(v33, v34, &v59);
      sub_1000185B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "SystemAlertPresenter: Failed to create alert notification due to %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v54 + 8))(v29, v53);
    return 2;
  }
  SInt32 v27 = error[0];
  if (v27 != sub_100018350())
  {
    uint64_t v35 = v51;
    sub_100018320();
    uint64_t v36 = sub_100018330();
    os_log_type_t v37 = sub_1000184E0();
    if (os_log_type_enabled(v36, v37))
    {
      char v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      *(_DWORD *)char v38 = 136315138;
      swift_beginAccess();
      LODWORD(v56) = error[0];
      uint64_t v39 = sub_100018700();
      uint64_t v56 = sub_1000172BC(v39, v40, &v59);
      sub_1000185B0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "SystemAlertPresenter: Failed to create alert notification due to %s", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v54 + 8))(v35, v53);
    return 2;
  }
  responseFlags[0] = 0;
  SInt32 v28 = CFUserNotificationReceiveResponse(v26, 0.0, responseFlags);
  if (v28 == sub_100018350())
  {
  }
  else
  {
    uint64_t v41 = v50;
    sub_100018320();
    uint64_t v42 = sub_100018330();
    os_log_type_t v43 = sub_1000184D0();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 67109120;
      LODWORD(v59) = v28;
      sub_1000185B0();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "SystemAlertPresenter: Failed to interpret overload notification user alert response: %d", v44, 8u);
      swift_slowDealloc();
      uint64_t v45 = v26;
    }
    else
    {
      uint64_t v45 = v42;
      uint64_t v42 = v26;
    }
    uint64_t v47 = v54;
    uint64_t v48 = v53;

    (*(void (**)(char *, uint64_t))(v47 + 8))(v41, v48);
  }
  return (responseFlags[0] & 3) != 0;
}

unint64_t sub_100014F00()
{
  unint64_t result = qword_100020E98;
  if (!qword_100020E98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100020E98);
  }
  return result;
}

unint64_t sub_100014F40()
{
  unint64_t result = qword_100020EA0;
  if (!qword_100020EA0)
  {
    sub_100014F00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020EA0);
  }
  return result;
}

uint64_t sub_100014F98()
{
  return swift_release();
}

uint64_t sub_100014FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000045D0(&qword_100020EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100015008(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100015018(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100015074(uint64_t a1)
{
  return a1;
}

BOOL sub_1000150C8()
{
  uint64_t v1 = sub_100018340();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [objc_allocWithZone((Class)BKSApplicationStateMonitor) init];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = [v5 mostElevatedApplicationStateForPID:*(unsigned int *)(v0+ OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_requestingProcessIdentifier)];
    [v6 invalidate];

    return v7 == 8;
  }
  else
  {
    sub_100018320();
    uint64_t v9 = sub_100018330();
    os_log_type_t v10 = sub_1000184E0();
    if (os_log_type_enabled(v9, v10))
    {
      int64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "WorkoutKitXPCService: failed to instantiate BKSApplicationStateMonitor", v11, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return 0;
  }
}

id sub_100015264(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_1000183E0();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_100017E30();

    swift_willThrow();
  }
  return v6;
}

id sub_100015340()
{
  NSString v1 = sub_1000183E0();
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [v0 initWithBundleIdentifier:v1 error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    sub_100017E30();

    swift_willThrow();
  }
  return v2;
}

id sub_10001540C()
{
  id result = [self sharedInstance];
  if (result)
  {
    NSString v1 = result;
    id v2 = [result getPairedDevices];
    if (v2)
    {
      id v3 = v2;
      sub_1000164A0();
      unint64_t v4 = sub_100018480();

      uint64_t v18 = &_swiftEmptyArrayStorage;
      if (v4 >> 62) {
        goto LABEL_25;
      }
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v5)
      {
        while (1)
        {
          int64_t v13 = v1;
          unint64_t v6 = 0;
          NSString v1 = (void *)(v4 & 0xC000000000000001);
          uint64_t v7 = NRDevicePropertyIsAltAccount;
          while (v1)
          {
            id v8 = (id)sub_100018650();
LABEL_12:
            uint64_t v9 = v8;
            unint64_t v10 = v6 + 1;
            if (__OFADD__(v6, 1)) {
              goto LABEL_24;
            }
            if ([v8 valueForProperty:v7])
            {
              sub_1000185D0();
              swift_unknownObjectRelease();
            }
            else
            {
              memset(v15, 0, sizeof(v15));
            }
            sub_100004568((uint64_t)v15, (uint64_t)v16);
            if (v17)
            {
              if (swift_dynamicCast() & 1) != 0 && (v14)
              {

                goto LABEL_8;
              }
            }
            else
            {
              sub_100004614((uint64_t)v16);
            }
            sub_100018670();
            sub_100018690();
            sub_1000186A0();
            sub_100018680();
LABEL_8:
            ++v6;
            if (v10 == v5)
            {
              unint64_t v11 = (unint64_t)v18;
              NSString v1 = v13;
              goto LABEL_27;
            }
          }
          if (v6 < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            break;
          }
          __break(1u);
LABEL_24:
          __break(1u);
LABEL_25:
          swift_bridgeObjectRetain();
          uint64_t v5 = sub_1000186C0();
          swift_bridgeObjectRelease();
          if (!v5) {
            goto LABEL_26;
          }
        }
        id v8 = *(id *)(v4 + 8 * v6 + 32);
        goto LABEL_12;
      }
LABEL_26:
      unint64_t v11 = (unint64_t)&_swiftEmptyArrayStorage;
LABEL_27:
      swift_bridgeObjectRelease();
      if ((v11 & 0x8000000000000000) != 0 || (v11 & 0x4000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = sub_1000186C0();

        swift_release_n();
      }
      else
      {
        uint64_t v12 = *(void *)(v11 + 16);
        swift_release();
      }
      return (id)(v12 != 0);
    }
    else
    {

      return 0;
    }
  }
  return result;
}

uint64_t sub_100015698()
{
  uint64_t v0 = sub_100018340();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v18) = 0;
  id v4 = [self sharedDeviceConnection];
  if (!v4) {
    __break(1u);
  }
  uint64_t v5 = v4;
  id v19 = 0;
  unsigned int v6 = [v4 getApplicationIsInstalled:&v18 onAnyPairedDeviceWithBundleID:FIWorkoutBundleIdentifier error:&v19];

  if (v6)
  {
    uint64_t v7 = v18;
    id v8 = v19;
  }
  else
  {
    id v9 = v19;
    uint64_t v10 = sub_100017E30();

    swift_willThrow();
    sub_100018320();
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v11 = sub_100018330();
    os_log_type_t v12 = sub_1000184E0();
    if (os_log_type_enabled(v11, v12))
    {
      int64_t v13 = (uint8_t *)swift_slowAlloc();
      id v19 = (id)swift_slowAlloc();
      *(_DWORD *)int64_t v13 = 136315138;
      v17[1] = v13 + 4;
      uint64_t v18 = v10;
      swift_errorRetain();
      sub_1000045D0(&qword_100020DE0);
      uint64_t v14 = sub_100018430();
      uint64_t v18 = sub_1000172BC(v14, v15, (uint64_t *)&v19);
      sub_1000185B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "WorkoutKitXPCService: failed to check if workout app is installed, %s", v13, 0xCu);
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
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  return v7;
}

id sub_100015990()
{
  uint64_t v0 = sub_100018340();
  __chkstk_darwin(v0);
  id v1 = objc_allocWithZone((Class)LSApplicationExtensionRecord);
  swift_bridgeObjectRetain();
  return sub_100015340();
}

char *sub_100015C9C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_100018340();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v29 - v9;
  id v11 = sub_100015990();
  if (v11)
  {
    id v33 = v11;
    id v12 = [v11 containingBundleRecord];
    if (v12
      && (int64_t v13 = v12,
          id v14 = [v12 bundleIdentifier],
          v13,
          v14))
    {
      id v8 = (char *)sub_1000183F0();
      unint64_t v16 = v15;

      sub_100018320();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v17 = sub_100018330();
      os_log_type_t v18 = sub_1000184F0();
      LODWORD(v32) = v18;
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = swift_slowAlloc();
        os_log_t v30 = v17;
        uint64_t v20 = v19;
        uint64_t v31 = swift_slowAlloc();
        uint64_t v35 = v31;
        *(_DWORD *)uint64_t v20 = 136315394;
        uint64_t v29 = v20 + 4;
        swift_bridgeObjectRetain();
        uint64_t v34 = sub_1000172BC(a1, a2, &v35);
        sub_1000185B0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v20 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v34 = sub_1000172BC((uint64_t)v8, v16, &v35);
        sub_1000185B0();
        swift_bridgeObjectRelease_n();
        os_log_t v21 = v30;
        _os_log_impl((void *)&_mh_execute_header, v30, (os_log_type_t)v32, "WorkoutKitXPCService: remapped extension bundleId: %s to container bundleId: %s", (uint8_t *)v20, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
    else
    {
      sub_100018320();
      swift_bridgeObjectRetain_n();
      uint64_t v22 = sub_100018330();
      os_log_type_t v23 = sub_1000184E0();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v32 = v5;
        uint64_t v24 = swift_slowAlloc();
        uint64_t v31 = v4;
        int64_t v25 = (uint8_t *)v24;
        uint64_t v35 = swift_slowAlloc();
        *(_DWORD *)int64_t v25 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v34 = sub_1000172BC(a1, a2, &v35);
        sub_1000185B0();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "WorkoutKitXPCService: failed to retrieve container bundleId from extension bundleId: %s", v25, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v31);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      }
      uint64_t v26 = sub_100018050();
      sub_1000164E0();
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v27, enum case for XPCServiceError.unableToRetrieveContainerBundleIdentifier(_:), v26);
      swift_willThrow();
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    return (char *)a1;
  }
  return v8;
}

uint64_t sub_100016198(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100018340();
  __chkstk_darwin(v4);
  id v5 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v6 = sub_100015264(a1, a2, 0);
  id v7 = [v6 appClipMetadata];

  if (!v7) {
    return 0;
  }

  return 1;
}

unint64_t sub_1000164A0()
{
  unint64_t result = qword_100020EC8;
  if (!qword_100020EC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100020EC8);
  }
  return result;
}

unint64_t sub_1000164E0()
{
  unint64_t result = qword_100020DB8;
  if (!qword_100020DB8)
  {
    sub_100018050();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020DB8);
  }
  return result;
}

uint64_t sub_100016538()
{
  uint64_t v0 = sub_100018530();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100018520();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_100018390();
  __chkstk_darwin(v5 - 8);
  sub_100012FB0(0, &qword_100020DC0);
  sub_100018380();
  v7[1] = &_swiftEmptyArrayStorage;
  sub_100016DC0(&qword_100020EE0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_1000045D0(&qword_100020EE8);
  sub_100016E08(&qword_100020EF0, &qword_100020EE8);
  sub_1000185E0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t result = sub_100018550();
  qword_100020F90 = result;
  return result;
}

void sub_100016788(void *a1, void *a2, void (*a3)(uint64_t, unint64_t, uint64_t))
{
  sub_1000045D0(&qword_100020ED0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001A050;
  *(void *)(v6 + 32) = a2;
  sub_100018490();
  sub_100012FB0(0, &qword_100020ED8);
  id v7 = a2;
  Class isa = sub_100018470().super.isa;
  swift_bridgeObjectRelease();
  [a1 prepareImagesForImageDescriptors:isa];

  id v9 = [a1 CGImageForDescriptor:v7];
  image = (UIImage *)[objc_allocWithZone((Class)UIImage) initWithCGImage:v9];

  uint64_t v10 = UIImagePNGRepresentation(image);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = sub_100017E50();
    unint64_t v14 = v13;

    sub_100012E90(v12, v14);
    a3(v12, v14, 0);
    sub_100012E38(v12, v14);
    sub_100012E38(v12, v14);
  }
  else
  {
    uint64_t v15 = sub_100018040();
    sub_100016DC0(&qword_100020DE8, (void (*)(uint64_t))&type metadata accessor for ImportError);
    uint64_t v16 = swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v15 - 8) + 104))(v17, enum case for ImportError.unknownType(_:), v15);
    a3(0, 0xF000000000000000, v16);
    swift_errorRelease();
  }
}

uint64_t sub_1000169C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_100018360();
  uint64_t v23 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100018390();
  uint64_t v21 = *(void *)(v9 - 8);
  uint64_t v22 = v9;
  __chkstk_darwin(v9);
  id v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_allocWithZone((Class)ISIcon);
  swift_bridgeObjectRetain();
  NSString v13 = sub_1000183E0();
  swift_bridgeObjectRelease();
  id v14 = [v12 initWithBundleIdentifier:v13];

  id v15 = objc_msgSend(objc_allocWithZone((Class)ISImageDescriptor), "initWithSize:scale:", 40.0, 40.0, 2.0);
  [v15 setShape:0];
  if (qword_100020BF0 != -1) {
    swift_once();
  }
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v14;
  v16[3] = v15;
  v16[4] = a3;
  v16[5] = a4;
  aBlock[4] = sub_100016D9C;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100009D68;
  aBlock[3] = &unk_10001D810;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = v14;
  id v19 = v15;
  swift_retain();
  sub_100018380();
  uint64_t v24 = &_swiftEmptyArrayStorage;
  sub_100016DC0(&qword_100020DC8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000045D0(&qword_100020DD0);
  sub_100016E08((unint64_t *)&qword_100020DD8, &qword_100020DD0);
  sub_1000185E0();
  sub_100018540();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v22);
  return swift_release();
}

uint64_t sub_100016D54()
{
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

void sub_100016D9C()
{
  sub_100016788(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void (**)(uint64_t, unint64_t, uint64_t))(v0 + 32));
}

uint64_t sub_100016DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100016DB8()
{
  return swift_release();
}

uint64_t sub_100016DC0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100016E08(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100012BA0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100016E58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100017ED0();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000183D0();
  __chkstk_darwin(v5 - 8);
  sub_1000183C0();
  sub_100017EC0();
  sub_100018410();
  sub_1000045D0(&qword_100020EF8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001A020;
  *(void *)(v6 + 56) = &type metadata for String;
  unint64_t v7 = sub_100017198();
  *(void *)(v6 + 64) = v7;
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_100018400();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_1000183C0();
  sub_100017EC0();
  sub_100018410();
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10001A020;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 64) = v7;
  *(void *)(v11 + 32) = a1;
  *(void *)(v11 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_100018400();
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  sub_1000183C0();
  sub_100017EC0();
  uint64_t v15 = sub_100018410();
  uint64_t v17 = v16;
  sub_1000183C0();
  sub_100017EC0();
  uint64_t v18 = sub_100018410();
  unsigned __int8 v20 = sub_100014828(v8, v10, v12, v14, v15, v17, v18, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2 - v20;
}

unint64_t sub_100017198()
{
  unint64_t result = qword_100020F00;
  if (!qword_100020F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F00);
  }
  return result;
}

uint64_t sub_1000172BC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100017390(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100017D94((uint64_t)v12, *a3);
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
      sub_100017D94((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100017D44((uint64_t)v12);
  return v7;
}

uint64_t sub_100017390(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000185C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001754C(a5, a6);
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
  uint64_t v8 = sub_100018660();
  if (!v8)
  {
    sub_1000186B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000186F0();
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

uint64_t sub_10001754C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000175E4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000177C4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000177C4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000175E4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001775C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100018640();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000186B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100018450();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000186F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000186B0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001775C(uint64_t a1, uint64_t a2)
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
  sub_1000045D0(&qword_100020F78);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000177C4(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000045D0(&qword_100020F78);
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
  uint64_t result = sub_1000186F0();
  __break(1u);
  return result;
}

uint64_t sub_100017914(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100018340();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100018320();
  swift_errorRetain();
  swift_errorRetain();
  int64_t v8 = sub_100018330();
  os_log_type_t v9 = sub_1000184E0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v20 = v2;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v19 = v4;
    size_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = a1;
    uint64_t v22 = v12;
    *(_DWORD *)size_t v11 = 136315138;
    swift_errorRetain();
    sub_1000045D0(&qword_100020F70);
    uint64_t v13 = sub_100018430();
    uint64_t v21 = sub_1000172BC(v13, v14, &v22);
    sub_1000185B0();
    uint64_t v2 = v20;
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "WorkoutKitXPCService: remote alert invalidated with error: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v19);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v15 = (uint64_t *)(v2
                  + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_presentConfigurationCompletionHandler);
  uint64_t v16 = *(void (**)(void, uint64_t))(v2
                                               + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_presentConfigurationCompletionHandler);
  if (v16)
  {
    swift_retain();
    v16(0, a1);
    sub_100004964((uint64_t)v16);
    uint64_t v17 = *v15;
  }
  else
  {
    uint64_t v17 = 0;
  }
  *uint64_t v15 = 0;
  v15[1] = 0;
  return sub_100004964(v17);
}

uint64_t sub_100017BAC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100018340();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100018320();
  uint64_t v6 = sub_100018330();
  os_log_type_t v7 = sub_1000184D0();
  if (os_log_type_enabled(v6, v7))
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "WorkoutKitXPCService: remote alert did activate", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  os_log_type_t v9 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_presentConfigurationCompletionHandler);
  uint64_t v10 = *(void (**)(uint64_t, void))(v1
                                               + OBJC_IVAR____TtC20WorkoutKitXPCService20WorkoutKitXPCService_presentConfigurationCompletionHandler);
  if (v10)
  {
    swift_retain();
    v10(1, 0);
    sub_100004964((uint64_t)v10);
    uint64_t v11 = *v9;
  }
  else
  {
    uint64_t v11 = 0;
  }
  *os_log_type_t v9 = 0;
  v9[1] = 0;
  return sub_100004964(v11);
}

uint64_t sub_100017D44(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100017D94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100017DF0()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_100017E00()
{
  return __DataStorage._length.getter();
}

uint64_t sub_100017E10()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_100017E20()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100017E30()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_100017E40()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100017E50()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100017E60()
{
  return Date.init()();
}

uint64_t sub_100017E70()
{
  return type metadata accessor for Date();
}

NSUUID sub_100017E80()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_100017E90()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100017EA0()
{
  return UUID.init()();
}

uint64_t sub_100017EB0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100017EC0()
{
  return static Locale.current.getter();
}

uint64_t sub_100017ED0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100017EE0()
{
  return SingleGoalWorkout.init(activity:location:swimmingLocation:goal:)();
}

uint64_t sub_100017EF0()
{
  return type metadata accessor for SingleGoalWorkout();
}

uint64_t sub_100017F00()
{
  return ScheduledWorkoutPlan.scheduledDate.getter();
}

uint64_t sub_100017F10()
{
  return static ScheduledWorkoutPlan.importFromData(_:)();
}

uint64_t sub_100017F20()
{
  return ScheduledWorkoutPlan.lastCompletedDate.getter();
}

uint64_t sub_100017F30()
{
  return ScheduledWorkoutPlan.dataRepresentation(as:)();
}

uint64_t sub_100017F40()
{
  return ScheduledWorkoutPlan.plan.getter();
}

uint64_t sub_100017F50()
{
  return type metadata accessor for ScheduledWorkoutPlan();
}

uint64_t sub_100017F60()
{
  return ScheduledWorkoutPlan.init(_:scheduledDate:lastCompletedDate:)();
}

uint64_t sub_100017F70()
{
  return type metadata accessor for WorkoutPlanValidationError();
}

uint64_t sub_100017F80()
{
  return type metadata accessor for WorkoutGoal();
}

uint64_t sub_100017F90()
{
  return type metadata accessor for WorkoutPlan.Workout();
}

uint64_t sub_100017FA0()
{
  return WorkoutPlan.workoutCoreRepresentation(occurrence:validator:)();
}

uint64_t sub_100017FB0()
{
  return WorkoutPlan.dataRepresentation.getter();
}

uint64_t sub_100017FC0()
{
  return WorkoutPlan.dataRepresentation(as:)();
}

uint64_t sub_100017FD0()
{
  return type metadata accessor for WorkoutPlan.SerializationFormat();
}

uint64_t sub_100017FE0()
{
  return WorkoutPlan.id.getter();
}

uint64_t sub_100017FF0()
{
  return WorkoutPlan.init(from:)();
}

uint64_t sub_100018000()
{
  return type metadata accessor for WorkoutPlan();
}

uint64_t sub_100018010()
{
  return WorkoutPlan.init(_:id:)();
}

uint64_t sub_100018020()
{
  return type metadata accessor for QueryError();
}

uint64_t sub_100018030()
{
  return type metadata accessor for StateError();
}

uint64_t sub_100018040()
{
  return type metadata accessor for ImportError();
}

uint64_t sub_100018050()
{
  return type metadata accessor for XPCServiceError();
}

uint64_t sub_100018060()
{
  return type metadata accessor for AuthorizationError();
}

uint64_t sub_100018070()
{
  return type metadata accessor for AppError();
}

uint64_t sub_100018080()
{
  return dispatch thunk of WorkoutConfiguration.isValidConfiguration.getter();
}

uint64_t sub_100018090()
{
  return static WorkoutConfiguration.deserialize(from:validator:)();
}

uint64_t sub_1000180A0()
{
  return dispatch thunk of WorkoutConfiguration.scheduledDate.getter();
}

uint64_t sub_1000180B0()
{
  return dispatch thunk of WorkoutConfiguration.scheduledDate.setter();
}

uint64_t sub_1000180C0()
{
  return static WorkoutConfiguration.importFromData(_:with:validator:)();
}

uint64_t sub_1000180D0()
{
  return dispatch thunk of WorkoutConfiguration.externalProvider.setter();
}

uint64_t sub_1000180E0()
{
  return dispatch thunk of WorkoutConfiguration.lastCompletedDate.getter();
}

uint64_t sub_1000180F0()
{
  return dispatch thunk of WorkoutConfiguration.lastCompletedDate.setter();
}

uint64_t sub_100018100()
{
  return WorkoutConfiguration.workoutPlanRepresentation()();
}

uint64_t sub_100018110()
{
  return WorkoutConfiguration.id.getter();
}

uint64_t sub_100018120()
{
  return dispatch thunk of WorkoutConfiguration.type.getter();
}

uint64_t sub_100018130()
{
  return dispatch thunk of WorkoutConfiguration.uuid.getter();
}

uint64_t sub_100018140()
{
  return type metadata accessor for WorkoutConfiguration();
}

uint64_t sub_100018150()
{
  return static WorkoutConfigurationValidator.shared.getter();
}

uint64_t sub_100018160()
{
  return type metadata accessor for WorkoutConfigurationValidator();
}

uint64_t sub_100018170()
{
  return Occurrence.__allocating_init(count:)();
}

uint64_t sub_100018180()
{
  return type metadata accessor for Occurrence();
}

uint64_t sub_100018190()
{
  return dispatch thunk of QueryClient.fetchExternalProvider(sourceIdentifier:completion:)();
}

uint64_t sub_1000181A0()
{
  return dispatch thunk of QueryClient.deleteExternalProvider(sourceIdentifier:completion:)();
}

uint64_t sub_1000181B0()
{
  return dispatch thunk of QueryClient.addManagedConfigurations(managedConfigurations:completion:)();
}

uint64_t sub_1000181C0()
{
  return dispatch thunk of QueryClient.fetchManagedConfigurations(sourceIdentifier:completion:)();
}

uint64_t sub_1000181D0()
{
  return dispatch thunk of QueryClient.deleteManagedConfigurations(sourceIdentifier:completion:)();
}

uint64_t sub_1000181E0()
{
  return dispatch thunk of QueryClient.removeManagedConfigurations(managedConfigurations:completion:)();
}

uint64_t sub_1000181F0()
{
  return dispatch thunk of QueryClient.updateQueriedExternalProvider(_:permissionState:completion:)();
}

uint64_t sub_100018200()
{
  return dispatch thunk of QueryClient.save(_:completion:)();
}

uint64_t sub_100018210()
{
  return type metadata accessor for QueryClient();
}

uint64_t sub_100018220()
{
  return QueryClient.init(_:)();
}

uint64_t sub_100018230()
{
  return ExternalProvider.init(sourceName:sourceBundleIdentifier:sourceImageData:syncStartDate:uuid:)();
}

uint64_t sub_100018240()
{
  return dispatch thunk of ExternalProvider.sourceName.getter();
}

uint64_t sub_100018250()
{
  return dispatch thunk of ExternalProvider.sourceName.setter();
}

uint64_t sub_100018260()
{
  return dispatch thunk of ExternalProvider.sourceImageData.getter();
}

uint64_t sub_100018270()
{
  return dispatch thunk of ExternalProvider.sourceImageData.setter();
}

uint64_t sub_100018280()
{
  return dispatch thunk of ExternalProvider.sourceBundleIdentifier.getter();
}

uint64_t sub_100018290()
{
  return type metadata accessor for ExternalProvider();
}

uint64_t sub_1000182A0()
{
  return ConfigurationType.description.getter();
}

uint64_t sub_1000182B0()
{
  return type metadata accessor for ConfigurationType();
}

uint64_t sub_1000182C0()
{
  return dispatch thunk of QueriedExternalProvider.externalProvider.getter();
}

uint64_t sub_1000182D0()
{
  return QueriedExternalProvider.init(externalProvider:)();
}

uint64_t sub_1000182E0()
{
  return dispatch thunk of QueriedExternalProvider.permissionState.getter();
}

uint64_t sub_1000182F0()
{
  return type metadata accessor for QueriedExternalProvider();
}

uint64_t sub_100018300()
{
  return BlastDoorConfigurationValidator.init()();
}

uint64_t sub_100018310()
{
  return type metadata accessor for BlastDoorConfigurationValidator();
}

uint64_t sub_100018320()
{
  return static WOLog.xpcService.getter();
}

uint64_t sub_100018330()
{
  return Logger.logObject.getter();
}

uint64_t sub_100018340()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100018350()
{
  return noErr.getter();
}

uint64_t sub_100018360()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100018370()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_100018380()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100018390()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_1000183A0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000183B0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000183C0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_1000183D0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_1000183E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000183F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018400()
{
  return String.init(format:_:)();
}

uint64_t sub_100018410()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100018420()
{
  return String.workoutKitLocalized()()._countAndFlagsBits;
}

uint64_t sub_100018430()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100018440()
{
  return String.hash(into:)();
}

Swift::Int sub_100018450()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100018460()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100018470()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100018480()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018490()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000184A0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000184B0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000184C0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_1000184D0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000184E0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000184F0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100018500()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t sub_100018510()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t sub_100018520()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100018530()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100018540()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100018550()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100018560()
{
  return static OS_dispatch_queue.global(qos:)();
}

NSNumber sub_100018570(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int sub_100018580(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100018590()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000185A0()
{
  return NSString.init(string:)();
}

uint64_t sub_1000185B0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000185C0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000185D0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000185E0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_1000185F0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100018600()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100018610()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100018620()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100018630()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100018640()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100018650()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100018660()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100018670()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100018680()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100018690()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000186A0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000186B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000186C0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000186D0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000186E0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000186F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100018700()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100018710()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100018720()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_100018730()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100018740()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100018750()
{
  return Hasher._finalize()();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t NSStringForWOPersistencePermissionState()
{
  return _NSStringForWOPersistencePermissionState();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
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

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
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

id objc_retainAutorelease(id a1)
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}