id sub_100002C00()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CollectionsPosterEditorLookViewProviding()
{
  return self;
}

void sub_100002D38(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100002D44@<X0>(uint64_t *a1@<X8>)
{
  sub_100012868();
  swift_allocObject();
  sub_100012878();
  sub_100012838();
  swift_allocObject();
  swift_retain();
  sub_100012848();
  sub_100003220(&qword_1000203B0);
  sub_100012388();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100013440;
  sub_100003264(&qword_1000203B8, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_100012378();
  sub_100003264(&qword_1000203C0, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_100012378();
  swift_release_n();
  uint64_t result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_100002F6C()
{
  return sub_100002F9C((uint64_t (*)(void))type metadata accessor for CollectionsPosterRenderDelegate);
}

id sub_100002F84()
{
  return sub_100002F9C((uint64_t (*)(void))type metadata accessor for CollectionsPosterEditDelegate);
}

id sub_100002F9C(uint64_t (*a1)(void))
{
  id v1 = objc_allocWithZone((Class)a1(0));
  return [v1 init];
}

uint64_t sub_100002FE0()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000313C()
{
  unint64_t result = qword_100020390;
  if (!qword_100020390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020390);
  }
  return result;
}

uint64_t sub_100003190(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CollectionsPosterExtension()
{
  return &type metadata for CollectionsPosterExtension;
}

uint64_t sub_1000031E8()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_100003220(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003264(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000032AC()
{
  return sub_1000032E0(&qword_1000203C8);
}

uint64_t sub_1000032E0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003190(&qword_1000203A0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for CollectionsPosterEditingEnvironment()
{
  return self;
}

id sub_10000338C()
{
  id v1 = [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEditingEnvironment_posterKitEditingEnvironment) targetConfiguration];
  Class isa = sub_100012888().super.isa;
  id v6 = 0;
  unsigned int v3 = [v1 storeUserInfo:isa error:&v6];

  if (v3) {
    return v6;
  }
  id v5 = v6;
  sub_1000122F8();

  return (id)swift_willThrow();
}

id sub_100003494()
{
  id v1 = [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEditingEnvironment_posterKitEditingEnvironment) context];
  if (v1)
  {
    uint64_t v2 = (objc_class *)type metadata accessor for CollectionsPosterEnvironmentContext();
    unsigned int v3 = (char *)objc_allocWithZone(v2);
    *(void *)&v3[OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEnvironmentContext_posterKitEnvironmentContext] = v1;
    v6.receiver = v3;
    v6.super_class = v2;
    id v4 = v1;
    id v1 = objc_msgSendSuper2(&v6, "init");

    sub_10000389C(&qword_100020468, 255, (void (*)(uint64_t))type metadata accessor for CollectionsPosterEnvironmentContext);
  }
  return v1;
}

uint64_t sub_100003574()
{
  id v2 = [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEditingEnvironment_posterKitEditingEnvironment) sourceContents];
  id v8 = 0;
  id v3 = [v2 loadUserInfoWithError:&v8];
  swift_unknownObjectRelease();
  id v4 = v8;
  if (v3)
  {
    uint64_t v1 = sub_100012898();
    id v5 = v4;
  }
  else
  {
    id v6 = v8;
    sub_1000122F8();

    swift_willThrow();
  }
  return v1;
}

void sub_100003680()
{
  id v1 = [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEditingEnvironment_posterKitEditingEnvironment) targetConfiguration];
  id v2 = [v1 assetDirectory];

  sub_100012338();
}

id sub_100003708()
{
  return sub_10000338C();
}

id sub_100003720()
{
  return [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEditingEnvironment_posterKitEditingEnvironment) deviceOrientation];
}

id sub_100003738()
{
  id result = [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEditingEnvironment_posterKitEditingEnvironment) traitCollection];
  if (result)
  {
    id v2 = result;
    id v3 = [result userInterfaceStyle];

    return v3;
  }
  return result;
}

id sub_100003794()
{
  return [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEditingEnvironment_posterKitEditingEnvironment) floatingObscurableBounds];
}

void sub_1000037B0()
{
  id v1 = objc_msgSend(objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEditingEnvironment_posterKitEditingEnvironment), "sourceContents"), "assetDirectory");
  swift_unknownObjectRelease();
  sub_100012338();
}

uint64_t sub_10000383C()
{
  return sub_100003574();
}

uint64_t sub_100003854(uint64_t a1, uint64_t a2)
{
  return sub_10000389C(&qword_100020460, a2, (void (*)(uint64_t))type metadata accessor for CollectionsPosterEditingEnvironment);
}

uint64_t sub_10000389C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t type metadata accessor for CollectionsPosterInvalidatable()
{
  return self;
}

uint64_t type metadata accessor for CollectionsPosterRenderingEnvironment()
{
  return self;
}

id sub_100003A1C()
{
  id v1 = [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster37CollectionsPosterRenderingEnvironment_posterKitRenderingEnvironment) context];
  if (v1)
  {
    id v2 = (objc_class *)type metadata accessor for CollectionsPosterEnvironmentContext();
    id v3 = (char *)objc_allocWithZone(v2);
    *(void *)&v3[OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEnvironmentContext_posterKitEnvironmentContext] = v1;
    v6.receiver = v3;
    v6.super_class = v2;
    id v4 = v1;
    id v1 = objc_msgSendSuper2(&v6, "init");

    sub_100003E00(&qword_100020468, 255, (void (*)(uint64_t))type metadata accessor for CollectionsPosterEnvironmentContext);
  }
  return v1;
}

uint64_t sub_100003AFC()
{
  id v2 = [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster37CollectionsPosterRenderingEnvironment_posterKitRenderingEnvironment) contents];
  id v8 = 0;
  id v3 = [v2 loadUserInfoWithError:&v8];
  swift_unknownObjectRelease();
  id v4 = v8;
  if (v3)
  {
    uint64_t v1 = sub_100012898();
    id v5 = v4;
  }
  else
  {
    id v6 = v8;
    sub_1000122F8();

    swift_willThrow();
  }
  return v1;
}

uint64_t sub_100003C08(uint64_t a1, uint64_t a2)
{
  return sub_100003C38(a1, a2, (uint64_t (*)(uint64_t))sub_100011A2C);
}

uint64_t sub_100003C20(uint64_t a1, uint64_t a2)
{
  return sub_100003C38(a1, a2, (uint64_t (*)(uint64_t))sub_100011B68);
}

uint64_t sub_100003C38(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t ObjectType = swift_getObjectType();
  return a3(ObjectType);
}

id sub_100003C84()
{
  return [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster37CollectionsPosterRenderingEnvironment_posterKitRenderingEnvironment) deviceOrientation];
}

id sub_100003C9C()
{
  id result = [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster37CollectionsPosterRenderingEnvironment_posterKitRenderingEnvironment) traitCollection];
  if (result)
  {
    id v2 = result;
    id v3 = [result userInterfaceStyle];

    return v3;
  }
  return result;
}

id sub_100003CF8()
{
  return [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster37CollectionsPosterRenderingEnvironment_posterKitRenderingEnvironment) floatingObscurableBounds];
}

void sub_100003D14()
{
  id v1 = objc_msgSend(objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster37CollectionsPosterRenderingEnvironment_posterKitRenderingEnvironment), "contents"), "assetDirectory");
  swift_unknownObjectRelease();
  sub_100012338();
}

uint64_t sub_100003DA0()
{
  return sub_100003AFC();
}

uint64_t sub_100003DB8(uint64_t a1, uint64_t a2)
{
  return sub_100003E00(&qword_100020590, a2, (void (*)(uint64_t))type metadata accessor for CollectionsPosterRenderingEnvironment);
}

uint64_t sub_100003E00(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t type metadata accessor for CollectionsPosterEnvironmentContext()
{
  return self;
}

id sub_100003EAC()
{
  return [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEnvironmentContext_posterKitEnvironmentContext) isPreview];
}

id sub_100003ED8()
{
  return [*(id *)(v0+ OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEnvironmentContext_posterKitEnvironmentContext) isSnapshot];
}

id sub_100003F04()
{
  id v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_100012808();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  id v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderer] = 0;
  v7 = &v1[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_environmentSnapshot];
  uint64_t v8 = sub_100012528();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(void *)&v1[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderingEnvironment] = 0;
  *(void *)&v1[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_wallpaperPosterRenderController] = 0;
  uint64_t v9 = qword_1000201B8;
  v10 = v1;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000061E8(v3, (uint64_t)qword_100020EB0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v11, v3);
  v12 = v10;
  v13 = sub_1000127E8();
  os_log_type_t v14 = sub_1000129C8();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    v22 = ObjectType;
    uint64_t v16 = v15;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v24 = v21;
    *(_DWORD *)uint64_t v16 = 136446466;
    swift_getObjectType();
    uint64_t v17 = sub_100012BB8();
    uint64_t v23 = sub_1000113C0(v17, v18, &v24);
    sub_100012A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    uint64_t v23 = sub_1000113C0(0x292874696E69, 0xE600000000000000, &v24);
    sub_100012A28();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Start (%{public}s.%{public}s)…", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t ObjectType = v22;
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v25.receiver = v12;
  v25.super_class = ObjectType;
  id v19 = objc_msgSendSuper2(&v25, "init");
  sub_100004248(v19);

  return v19;
}

uint64_t sub_100004248(void *a1)
{
  uint64_t v2 = sub_100012808();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201B8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1000061E8(v2, (uint64_t)qword_100020EB0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = a1;
  uint64_t v8 = sub_1000127E8();
  os_log_type_t v9 = sub_1000129C8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v10 = 136446466;
    swift_getObjectType();
    uint64_t v11 = sub_100012BB8();
    uint64_t v16 = sub_1000113C0(v11, v12, &v17);
    sub_100012A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2082;
    uint64_t v16 = sub_1000113C0(0x292874696E69, 0xE600000000000000, &v17);
    sub_100012A28();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "…Complete (%{public}s.%{public}s)", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10000456C()
{
  return type metadata accessor for CollectionsPosterRenderDelegate();
}

uint64_t type metadata accessor for CollectionsPosterRenderDelegate()
{
  uint64_t result = qword_100020600;
  if (!qword_100020600) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000045C0()
{
  sub_100004660();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100004660()
{
  if (!qword_100020610)
  {
    sub_100012528();
    unint64_t v0 = sub_100012A18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100020610);
    }
  }
}

uint64_t sub_1000046B8(void *a1, void *a2)
{
  unint64_t v18 = a2;
  id v19 = a1;
  uint64_t v2 = sub_100012758();
  uint64_t v20 = *(void *)(v2 - 8);
  uint64_t v21 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100012788();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201C8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1000061E8(v5, (uint64_t)qword_100020EE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  sub_100012748();
  uint64_t v10 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v10 = 0;
  uint64_t v11 = sub_100012778();
  os_signpost_type_t v12 = sub_1000129F8();
  os_signpost_id_t v13 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, v12, v13, "CollectionsPosterRenderDelegate.Initialize", "", v10, 2u);
  sub_100004948(v17, v18, v19);
  os_signpost_type_t v14 = sub_1000129E8();
  os_signpost_id_t v15 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, v14, v15, "CollectionsPosterRenderDelegate.Initialize", "", v10, 2u);

  swift_slowDealloc();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_100004948(void *a1, void *a2, void *a3)
{
  sub_100003220(&qword_100020678);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v49 = &v44[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  uint64_t v9 = &v44[-v8];
  if (qword_1000201B8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100012808();
  sub_1000061E8(v10, (uint64_t)qword_100020EB0);
  swift_unknownObjectRetain_n();
  uint64_t v11 = a1;
  os_signpost_type_t v12 = sub_1000127E8();
  os_log_type_t v13 = sub_1000129C8();
  int v14 = v13;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    v50[0] = v46;
    *(_DWORD *)uint64_t v15 = 136447234;
    int v45 = v14;
    swift_getObjectType();
    uint64_t v16 = sub_100012BB8();
    uint64_t v52 = sub_1000113C0(v16, v17, v50);
    v48 = v9;
    sub_100012A28();

    swift_bridgeObjectRelease();
    v47 = a3;
    *(_WORD *)(v15 + 12) = 2082;
    uint64_t v52 = sub_1000113C0(0xD00000000000001ELL, 0x8000000100013E00, v50);
    sub_100012A28();
    *(_WORD *)(v15 + 22) = 1026;
    unsigned int v18 = [a2 isPreview];
    swift_unknownObjectRelease();
    LODWORD(v52) = v18;
    sub_100012A28();
    swift_unknownObjectRelease();
    *(_WORD *)(v15 + 28) = 1026;
    unsigned int v19 = [a2 isSnapshot];
    swift_unknownObjectRelease();
    LODWORD(v52) = v19;
    sub_100012A28();
    swift_unknownObjectRelease();
    *(_WORD *)(v15 + 34) = 2082;
    [a2 deviceOrientation];
    id v20 = (id)WKStringForInterfaceOrientation();
    uint64_t v21 = sub_1000128B8();
    unint64_t v23 = v22;

    uint64_t v24 = v21;
    a3 = v47;
    uint64_t v52 = sub_1000113C0(v24, v23, v50);
    sub_100012A28();
    swift_unknownObjectRelease_n();
    uint64_t v9 = v48;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, (os_log_type_t)v45, "Start (%{public}s.%{public}s); isPreview: '%{BOOL,public}d', isSnapshot: '%{BOOL,public}d', orientation: '%{public}s'…",
      (uint8_t *)v15,
      0x2Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  objc_super v25 = *(void **)&v11[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderer];
  *(void *)&v11[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderer] = a3;

  v26 = (objc_class *)type metadata accessor for CollectionsPosterRenderingEnvironment();
  v27 = (char *)objc_allocWithZone(v26);
  *(void *)&v27[OBJC_IVAR____TtC17CollectionsPoster37CollectionsPosterRenderingEnvironment_posterKitRenderingEnvironment] = a2;
  v51.receiver = v27;
  v51.super_class = v26;
  swift_unknownObjectRetain();
  id v28 = a3;
  id v29 = objc_msgSendSuper2(&v51, "init");
  uint64_t v30 = OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderingEnvironment;
  v31 = *(void **)&v11[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderingEnvironment];
  *(void *)&v11[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderingEnvironment] = v29;

  v32 = *(void **)&v11[v30];
  if (!v32)
  {
    __break(1u);
    goto LABEL_12;
  }
  sub_100006220();
  id v33 = v32;
  sub_1000063A8(0, v9);
  uint64_t v34 = sub_100012528();
  uint64_t v35 = *(void *)(v34 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v35 + 56))(v9, 0, 1, v34);
  uint64_t v36 = (uint64_t)&v11[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_environmentSnapshot];
  swift_beginAccess();
  sub_100006278((uint64_t)v9, v36);
  swift_endAccess();
  sub_100012668();
  swift_allocObject();
  id v37 = v28;
  uint64_t v38 = sub_100012638();
  uint64_t v39 = OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_wallpaperPosterRenderController;
  *(void *)&v11[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_wallpaperPosterRenderController] = v38;
  swift_release();
  if (!*(void *)&v11[v39])
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v40 = *(void **)&v11[v30];
  if (!v40)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v41 = v36;
  v42 = v49;
  sub_1000062E0(v41, (uint64_t)v49);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v35 + 48))(v42, 1, v34) != 1)
  {
    swift_retain();
    id v43 = v40;
    sub_100012648();
    swift_release();

    (*(void (**)(unsigned char *, uint64_t))(v35 + 8))(v42, v34);
    sub_100004EE8(v11);
    return;
  }
LABEL_14:
  __break(1u);
}

void sub_100004EE8(void *a1)
{
  if (qword_1000201B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100012808();
  sub_1000061E8(v2, (uint64_t)qword_100020EB0);
  id v8 = a1;
  uint64_t v3 = sub_1000127E8();
  os_log_type_t v4 = sub_1000129C8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446466;
    swift_getObjectType();
    uint64_t v6 = sub_100012BB8();
    sub_1000113C0(v6, v7, &v9);
    sub_100012A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2082;
    sub_1000113C0(0xD00000000000001ELL, 0x8000000100013E00, &v9);
    sub_100012A28();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "…Complete (%{public}s.%{public}s)", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_100005184(uint64_t a1, void *a2, void *a3)
{
  unsigned int v19 = a2;
  uint64_t v21 = a1;
  unint64_t v22 = a3;
  uint64_t v3 = sub_100012758();
  uint64_t v23 = *(void *)(v3 - 8);
  uint64_t v24 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100012788();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201C8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1000061E8(v6, (uint64_t)qword_100020EE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  sub_100012748();
  uint64_t v11 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v11 = 0;
  os_signpost_type_t v12 = sub_100012778();
  os_signpost_type_t v13 = sub_1000129F8();
  os_signpost_id_t v14 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, v13, v14, "CollectionsPosterRenderDelegate.Update", "", v11, 2u);
  sub_100005414(v20, v19, v22, v21);
  os_signpost_type_t v15 = sub_1000129E8();
  os_signpost_id_t v16 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, v15, v16, "CollectionsPosterRenderDelegate.Update", "", v11, 2u);

  swift_slowDealloc();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_100005414(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v49 = a4;
  uint64_t v7 = sub_100003220(&qword_100020678);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = &v45[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  objc_super v51 = &v45[-v11];
  if (qword_1000201B0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100012808();
  sub_1000061E8(v12, (uint64_t)qword_100020E98);
  swift_unknownObjectRetain_n();
  os_signpost_type_t v13 = a1;
  os_signpost_id_t v14 = sub_1000127E8();
  os_log_type_t v15 = sub_1000129C8();
  int v16 = v15;
  BOOL v17 = os_log_type_enabled(v14, v15);
  v50 = v10;
  if (v17)
  {
    uint64_t v18 = swift_slowAlloc();
    v48 = a3;
    uint64_t v19 = v18;
    uint64_t v47 = swift_slowAlloc();
    v52[0] = v47;
    *(_DWORD *)uint64_t v19 = 136447234;
    int v46 = v16;
    swift_getObjectType();
    uint64_t v20 = sub_100012BB8();
    uint64_t v54 = sub_1000113C0(v20, v21, v52);
    sub_100012A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    uint64_t v54 = sub_1000113C0(0xD00000000000001BLL, 0x8000000100013DB0, v52);
    sub_100012A28();
    *(_WORD *)(v19 + 22) = 1026;
    unsigned int v22 = [a2 isPreview];
    swift_unknownObjectRelease();
    LODWORD(v54) = v22;
    sub_100012A28();
    swift_unknownObjectRelease();
    *(_WORD *)(v19 + 28) = 1026;
    unsigned int v23 = [a2 isSnapshot];
    swift_unknownObjectRelease();
    LODWORD(v54) = v23;
    sub_100012A28();
    swift_unknownObjectRelease();
    *(_WORD *)(v19 + 34) = 2082;
    [a2 deviceOrientation];
    id v24 = (id)WKStringForInterfaceOrientation();
    uint64_t v25 = sub_1000128B8();
    unint64_t v27 = v26;

    uint64_t v54 = sub_1000113C0(v25, v27, v52);
    sub_100012A28();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, (os_log_type_t)v46, "Start (%{public}s.%{public}s); isPreview: '%{BOOL,public}d', isSnapshot: '%{BOOL,public}d', orientation: '%{public}s'…",
      (uint8_t *)v19,
      0x2Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a3 = v48;
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  id v28 = (objc_class *)type metadata accessor for CollectionsPosterRenderingEnvironment();
  id v29 = (char *)objc_allocWithZone(v28);
  *(void *)&v29[OBJC_IVAR____TtC17CollectionsPoster37CollectionsPosterRenderingEnvironment_posterKitRenderingEnvironment] = a2;
  v53.receiver = v29;
  v53.super_class = v28;
  swift_unknownObjectRetain();
  id v30 = objc_msgSendSuper2(&v53, "init");
  uint64_t v31 = OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderingEnvironment;
  v32 = *(void **)&v13[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderingEnvironment];
  *(void *)&v13[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderingEnvironment] = v30;

  id v33 = *(void **)&v13[v31];
  if (!v33)
  {
    __break(1u);
    goto LABEL_12;
  }
  sub_100006220();
  id v34 = v33;
  id v35 = [a3 animationSettings];
  uint64_t v36 = v51;
  sub_1000063A8(v35, v51);
  uint64_t v37 = sub_100012528();
  uint64_t v38 = *(void *)(v37 - 8);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v38 + 56))(v36, 0, 1, v37);
  uint64_t v39 = (uint64_t)&v13[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_environmentSnapshot];
  swift_beginAccess();
  sub_100006278((uint64_t)v36, v39);
  swift_endAccess();
  if (!*(void *)&v13[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_wallpaperPosterRenderController])
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v40 = *(void **)&v13[v31];
  if (!v40)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v41 = a3;
  uint64_t v42 = (uint64_t)v50;
  sub_1000062E0(v39, (uint64_t)v50);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v42, 1, v37) != 1)
  {
    swift_retain();
    id v43 = v40;
    id v44 = [v41 animationSettings];
    sub_100012658();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v42, v37);
    sub_1000059C8(v13, 0xD00000000000001BLL, 0x8000000100013DB0);
    return;
  }
LABEL_14:
  __break(1u);
}

void sub_1000059C8(void *a1, uint64_t a2, unint64_t a3)
{
  if (qword_1000201B0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100012808();
  sub_1000061E8(v6, (uint64_t)qword_100020E98);
  id v12 = a1;
  uint64_t v7 = sub_1000127E8();
  os_log_type_t v8 = sub_1000129C8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446466;
    swift_getObjectType();
    uint64_t v10 = sub_100012BB8();
    sub_1000113C0(v10, v11, &v13);
    sub_100012A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2082;
    sub_1000113C0(a2, a3, &v13);
    sub_100012A28();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "…Complete (%{public}s.%{public}s)", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_100005C84()
{
  uint64_t v0 = sub_100012758();
  uint64_t v16 = *(void *)(v0 - 8);
  uint64_t v17 = v0;
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100012788();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201C8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1000061E8(v3, (uint64_t)qword_100020EE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  sub_100012748();
  os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)os_log_type_t v8 = 0;
  uint64_t v9 = sub_100012778();
  os_signpost_type_t v10 = sub_1000129F8();
  os_signpost_id_t v11 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, v10, v11, "CollectionsPosterRenderDelegate.Invalidate", "", v8, 2u);
  sub_100005F14(v15);
  os_signpost_type_t v12 = sub_1000129E8();
  os_signpost_id_t v13 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, v12, v13, "CollectionsPosterRenderDelegate.Invalidate", "", v8, 2u);

  swift_slowDealloc();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v2, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_100005F14(void *a1)
{
  if (qword_1000201B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100012808();
  sub_1000061E8(v2, (uint64_t)qword_100020E98);
  uint64_t v3 = a1;
  uint64_t v4 = sub_1000127E8();
  os_log_type_t v5 = sub_1000129C8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446466;
    swift_getObjectType();
    uint64_t v7 = sub_100012BB8();
    sub_1000113C0(v7, v8, &v10);
    sub_100012A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2082;
    sub_1000113C0(0xD000000000000019, 0x8000000100013D60, &v10);
    sub_100012A28();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Start (%{public}s.%{public}s)…", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (*(void *)&v3[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_wallpaperPosterRenderController])
  {
    swift_retain();
    sub_100012628();
    swift_release();
    uint64_t v9 = *(void **)&v3[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderer];
    *(void *)&v3[OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderer] = 0;

    sub_1000059C8(v3, 0xD000000000000019, 0x8000000100013D60);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000061E8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100006220()
{
  unint64_t result = qword_100020680;
  if (!qword_100020680)
  {
    type metadata accessor for CollectionsPosterRenderingEnvironment();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020680);
  }
  return result;
}

uint64_t sub_100006278(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003220(&qword_100020678);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000062E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003220(&qword_100020678);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006348(uint64_t a1)
{
  uint64_t v2 = sub_100003220(&qword_100020678);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000063A8(void *a1@<X2>, void *a2@<X8>)
{
  v9[1] = a2;
  sub_100012468();
  __chkstk_darwin();
  sub_1000123C8();
  __chkstk_darwin();
  uint64_t v3 = sub_100012508();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = a1;
  id v7 = sub_10000D288(a1);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for WKPosterEnvironmentSnapshot.PosterEnvironmentMode.rendering(_:), v3);
  swift_getObjectType();
  sub_100012548();
  sub_100012538();
  sub_100006610((uint64_t)a1);
  swift_retain();
  id v8 = v7;
  sub_100012408();
  sub_100012418();
  sub_100012518();
  swift_release();

  swift_unknownObjectRelease();
}

uint64_t sub_100006610(uint64_t a1)
{
  char v1 = a1 == 0;
  if (sub_100012428())
  {
    swift_getObjectType();
    if (sub_1000124F8()) {
      char v1 = 1;
    }
    else {
      char v1 = sub_1000124E8();
    }
    swift_unknownObjectRelease();
  }
  return v1 & 1;
}

void sub_10000668C(void *a1@<X2>, void *a2@<X8>)
{
  v11[1] = a2;
  uint64_t v3 = sub_100012468();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_1000123C8();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100012508();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = a1;
  id v9 = sub_10000D288(a1);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for WKPosterEnvironmentSnapshot.PosterEnvironmentMode.editing(_:), v5);
  sub_1000123B8();
  sub_100012458();
  swift_getObjectType();
  sub_100006610((uint64_t)a1);
  swift_retain();
  id v10 = v9;
  sub_100012408();
  sub_100012418();
  sub_100012518();
  swift_release();

  swift_unknownObjectRelease();
}

id sub_1000068E8()
{
  uint64_t v1 = sub_100012808();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterUpdateDelegate_wallpaperRepresentingCollectionsManager;
  sub_1000126F8();
  swift_allocObject();
  uint64_t v6 = v0;
  *(void *)&v0[v5] = sub_1000126E8();
  if (qword_1000201B0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1000061E8(v1, (uint64_t)qword_100020E98);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
  id v8 = v6;
  id v9 = sub_1000127E8();
  os_log_type_t v10 = sub_1000129C8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v20 = v18;
    *(_DWORD *)uint64_t v11 = 136446466;
    swift_getObjectType();
    uint64_t v12 = sub_100012BB8();
    uint64_t v19 = sub_1000113C0(v12, v13, &v20);
    sub_100012A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    uint64_t v19 = sub_1000113C0(0x292874696E69, 0xE600000000000000, &v20);
    sub_100012A28();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Start (%{public}s.%{public}s)…", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  updated = (objc_class *)type metadata accessor for CollectionsPosterUpdateDelegate();
  v21.receiver = v8;
  v21.super_class = updated;
  id v15 = objc_msgSendSuper2(&v21, "init");
  sub_100006BDC(v15);

  return v15;
}

uint64_t sub_100006BDC(void *a1)
{
  uint64_t v2 = sub_100012808();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201B0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1000061E8(v2, (uint64_t)qword_100020E98);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = a1;
  id v8 = sub_1000127E8();
  os_log_type_t v9 = sub_1000129C8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v10 = 136446466;
    swift_getObjectType();
    uint64_t v11 = sub_100012BB8();
    uint64_t v16 = sub_1000113C0(v11, v12, &v17);
    sub_100012A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2082;
    uint64_t v16 = sub_1000113C0(0x292874696E69, 0xE600000000000000, &v17);
    sub_100012A28();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "…Complete (%{public}s.%{public}s)", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_100006E94(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003220(&qword_100020780);
  uint64_t v2 = sub_100012B48();
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
    sub_10000CF5C(v6, (uint64_t)v15, &qword_1000207D8);
    unint64_t result = sub_100008634((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_10000CA5C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void sub_100006FD8(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v3 = sub_100012348();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  id v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = sub_100003220(&qword_100020758);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  long long v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  BOOL v13 = (char *)&v50 - v12;
  v54[0] = 0;
  id v14 = [a1 loadUserInfoWithError:v54];
  id v15 = v54[0];
  if (!v14)
  {
    id v26 = v54[0];
    sub_1000122F8();

    swift_willThrow();
    if (qword_1000201B0 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_100012808();
    sub_1000061E8(v27, (uint64_t)qword_100020E98);
    id v28 = a1;
    swift_errorRetain();
    id v29 = v28;
    swift_errorRetain();
    id v30 = sub_1000127E8();
    os_log_type_t v31 = sub_1000129B8();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      v54[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136446466;
      id v33 = [v29 identifier];
      uint64_t v34 = sub_1000128B8();
      unint64_t v36 = v35;

      *(void *)&long long v55 = sub_1000113C0(v34, v36, (uint64_t *)v54);
      sub_100012A28();

      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v37 = sub_100012B88();
      *(void *)&long long v55 = sub_1000113C0(v37, v38, (uint64_t *)v54);
      sub_100012A28();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Failed to load userInfo from poster descriptor '%{public}s' with error '%s'.", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
LABEL_22:
      uint64_t v47 = (_OWORD *)v51;
      *(void *)(v51 + 32) = 0;
      _OWORD *v47 = 0u;
      v47[1] = 0u;
      return;
    }
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v16 = v14;
  uint64_t v17 = sub_100012898();
  id v18 = v15;

  uint64_t v52 = sub_100012558();
  uint64_t v53 = v19;
  sub_100012A78();
  if (*(void *)(v17 + 16) && (unint64_t v20 = sub_100008634((uint64_t)v54), (v21 & 1) != 0))
  {
    sub_10000CC2C(*(void *)(v17 + 56) + 32 * v20, (uint64_t)&v55);
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10000CA6C((uint64_t)v54);
  if (!*((void *)&v56 + 1))
  {
    sub_10000CAC0((uint64_t)&v55, &qword_100020760);
    goto LABEL_15;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_15:
    if (qword_1000201B0 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_100012808();
    sub_1000061E8(v39, (uint64_t)qword_100020E98);
    id v30 = a1;
    v40 = sub_1000127E8();
    os_log_type_t v41 = sub_1000129B8();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      v54[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v42 = 136446210;
      id v43 = [v30 identifier];
      uint64_t v44 = sub_1000128B8();
      unint64_t v46 = v45;

      *(void *)&long long v55 = sub_1000113C0(v44, v46, (uint64_t *)v54);
      sub_100012A28();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Failed to load wallpaperRepresentingFileName from poster descriptor '%{public}s'.", v42, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_22;
    }

    goto LABEL_21;
  }
  id v22 = [a1 assetDirectory];
  sub_100012338();

  sub_100012318();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  sub_1000123E8();
  sub_10000CF5C((uint64_t)v13, (uint64_t)v11, &qword_100020758);
  uint64_t v23 = sub_1000123F8();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v11, 1, v23) == 1)
  {
    sub_10000CAC0((uint64_t)v13, &qword_100020758);
    sub_10000CAC0((uint64_t)v11, &qword_100020758);
    uint64_t v25 = v51;
    *(_OWORD *)uint64_t v51 = 0u;
    *(_OWORD *)(v25 + 16) = 0u;
    *(void *)(v25 + 32) = 0;
  }
  else
  {
    v48 = (uint64_t *)v51;
    *(void *)(v51 + 24) = v23;
    v48[4] = sub_10000CC88(&qword_100020778, (void (*)(uint64_t))&type metadata accessor for WKWallpaperBundle);
    uint64_t v49 = sub_10000CB1C(v48);
    (*(void (**)(uint64_t *, char *, uint64_t))(v24 + 32))(v49, v11, v23);
    sub_10000CAC0((uint64_t)v13, &qword_100020758);
  }
}

id sub_1000077A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CollectionsPosterUpdateDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CollectionsPosterUpdateDelegate()
{
  return self;
}

uint64_t sub_100007994(int a1, void *a2, void *aBlock, void *a4)
{
  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v4[5] = sub_10000CF20(0, &qword_1000207B8);
  uint64_t v7 = sub_100012898();
  v4[6] = v7;
  long long v11 = (uint64_t (*)(uint64_t))((char *)&dword_1000207C0 + dword_1000207C0);
  id v8 = a2;
  a4;
  uint64_t v9 = (void *)swift_task_alloc();
  v4[7] = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_100007AB0;
  return v11(v7);
}

uint64_t sub_100007AB0()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 24);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v7 = sub_1000122E8();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v9 = (void *)v7;
  }
  else
  {
    Class isa = sub_100012908().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v7 = 0;
    uint64_t v9 = isa;
  }
  uint64_t v10 = *(void (***)(void, void, void))(v3 + 32);
  ((void (**)(void, Class, uint64_t))v10)[2](v10, isa, v7);

  _Block_release(v10);
  long long v11 = *(uint64_t (**)(void))(v6 + 8);
  return v11();
}

uint64_t sub_100007C74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, char *a4@<X8>)
{
  id v22 = a4;
  v27._countAndFlagsBits = a2;
  v27._object = a3;
  uint64_t v30 = sub_1000126C8();
  uint64_t v23 = *(void *)(v30 - 8);
  uint64_t v5 = __chkstk_darwin(v30);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v26 = (char *)&v22 - v8;
  v28[0] = a1;
  sub_1000126F8();
  sub_10000CC88(&qword_100020788, (void (*)(uint64_t))&type metadata accessor for WKWallpaperRepresentingCollectionsManager);
  swift_retain();
  sub_1000128E8();
  sub_10000CC88(&qword_100020790, (void (*)(uint64_t))&type metadata accessor for WKWallpaperRepresentingCollectionsManager);
  uint64_t v9 = v29;
  sub_100012988();
  if (v9 == v28[0])
  {
LABEL_5:
    swift_release();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v22, 1, 1, v30);
  }
  else
  {
    uint64_t v10 = (void (**)(char *))(v23 + 16);
    uint64_t v24 = &v29;
    uint64_t v25 = (void (**)(char *, char *, uint64_t))(v23 + 32);
    long long v11 = (void (**)(char *, uint64_t))(v23 + 8);
    uint64_t v12 = v26;
    while (1)
    {
      uint64_t v13 = (void (*)(void *, void))sub_1000129A8();
      id v14 = v7;
      uint64_t v15 = v30;
      (*v10)(v12);
      v13(v28, 0);
      v28[0] = v28[4];
      sub_100012998();
      uint64_t v16 = *v25;
      uint64_t v17 = v15;
      uint64_t v7 = v14;
      (*v25)(v14, v12, v17);
      if (sub_1000126B8(v27)) {
        break;
      }
      (*v11)(v14, v30);
      uint64_t v18 = v29;
      sub_100012988();
      if (v18 == v28[0]) {
        goto LABEL_5;
      }
    }
    swift_release();
    uint64_t v19 = v22;
    uint64_t v20 = v30;
    v16(v22, v14, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v19, 0, 1, v20);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000811C(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  uint64_t v12 = (uint64_t (*)(id))((char *)&dword_100020748 + dword_100020748);
  id v8 = a1;
  id v9 = a2;
  a4;
  uint64_t v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  void *v10 = v4;
  v10[1] = sub_100008204;
  return v12(v8);
}

uint64_t sub_100008204(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 32);
  uint64_t v7 = *(void **)(*v2 + 24);
  id v8 = *(void **)(*v2 + 16);
  uint64_t v9 = *v2;
  swift_task_dealloc();

  uint64_t v10 = *(void (***)(void, void, void))(v5 + 40);
  if (v3)
  {
    long long v11 = (void *)sub_1000122E8();
    swift_errorRelease();
    ((void (**)(void, void, void *))v10)[2](v10, 0, v11);

    _Block_release(v10);
  }
  else
  {
    ((void (**)(void, void *, void))v10)[2](v10, a1, 0);
    _Block_release(v10);
  }
  uint64_t v12 = *(uint64_t (**)(void))(v9 + 8);
  return v12();
}

uint64_t sub_1000083E0()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10000CFC0;
  uint64_t v7 = (uint64_t (*)(void *, void *, void *, void *))((char *)&dword_100020728 + dword_100020728);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_1000084A4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000CFC0;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000208A8 + dword_1000208A8);
  return v6(v2, v3, v4);
}

uint64_t sub_100008568(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10000CFC0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000208B8 + dword_1000208B8);
  return v8(a1, v4, v5, v6);
}

unint64_t sub_100008634(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100012A58(*(void *)(v2 + 40));
  return sub_100008BD0(a1, v4);
}

unint64_t sub_100008678(uint64_t a1, uint64_t a2)
{
  sub_100012B98();
  sub_1000128C8();
  Swift::Int v4 = sub_100012BA8();
  return sub_100008C98(a1, a2, v4);
}

uint64_t sub_1000086F0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003220(&qword_100020780);
  uint64_t v6 = sub_100012B38();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
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
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    id v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_10000CA5C((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_10000CB80(v25, (uint64_t)&v38);
      sub_10000CC2C(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_100012A58(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_10000CA5C(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  id v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_100008A08(_OWORD *a1, uint64_t a2, char a3)
{
  Swift::Int v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_100008634(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100008D7C();
      goto LABEL_7;
    }
    sub_1000086F0(v13, a3 & 1);
    unint64_t v19 = sub_100008634(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_10000CB80(a2, (uint64_t)v21);
      return sub_100008B54(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_100012B78();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_10000CBDC((uint64_t)v17);
  return sub_10000CA5C(a1, v17);
}

_OWORD *sub_100008B54(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_10000CA5C(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

unint64_t sub_100008BD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000CB80(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100012A68();
      sub_10000CA6C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100008C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100012B68() & 1) == 0)
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
      while (!v14 && (sub_100012B68() & 1) == 0);
    }
  }
  return v6;
}

void *sub_100008D7C()
{
  uint64_t v1 = v0;
  sub_100003220(&qword_100020780);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100012B28();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_10000CB80(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_10000CC2C(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_10000CA5C(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_100008F64(void *a1, char a2)
{
  uint64_t v4 = sub_100012348();
  uint64_t v66 = *(void *)(v4 - 8);
  uint64_t v67 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  v64 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v65 = (char *)&v64 - v7;
  uint64_t v8 = a1[4];
  v68 = sub_10000C9B4(a1, a1[3]);
  uint64_t v69 = v8;
  sub_1000124B8();
  NSString v9 = sub_1000128A8();
  swift_bridgeObjectRelease();
  id v10 = [self mutableDescriptorWithIdentifier:v9];

  sub_10000C9B4(a1, a1[3]);
  if (sub_1000124C8())
  {
    sub_10000CF20(0, &qword_1000207D0);
    Class isa = sub_100012908().super.isa;
    swift_bridgeObjectRelease();
    [v10 setPreferredTitleColors:isa];
  }
  sub_10000C9B4(a1, a1[3]);
  id v12 = [objc_allocWithZone((Class)PRMutablePosterDescriptorHomeScreenConfiguration) initWithPreferredStyle:0 allowsModifyingLegibilityBlur:(sub_1000124D8() & 1) == 0 preferredSolidColors:0 preferredGradientColors:0];
  [v10 setPreferredHomeScreenConfiguration:v12];

  id v13 = [objc_allocWithZone((Class)ATXPosterDescriptorGalleryOptions) init];
  [v13 setAllowsSystemSuggestedComplications:0];
  if (a2) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  [v13 setFeaturedConfidenceLevel:v14];
  id v15 = [self mainBundle];
  NSString v16 = sub_1000128A8();
  NSString v17 = [v15 localizedStringForKey:v16 value:0 table:0];

  id v18 = v10;
  if (!v17)
  {
    sub_1000128B8();
    NSString v17 = sub_1000128A8();
    swift_bridgeObjectRelease();
  }
  [v13 setDisplayNameLocalizationKey:v17];

  v77[0] = 0;
  unsigned int v19 = [v10 storeGalleryOptions:v13 error:v77];
  id v20 = v77[0];
  int64_t v21 = v13;
  if (!v19)
  {
    id v38 = v77[0];
    uint64_t v39 = sub_1000122F8();

    uint64_t v72 = v39;
    swift_willThrow();
    if (qword_1000201B0 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_100012808();
    sub_1000061E8(v40, (uint64_t)qword_100020E98);
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v41 = sub_1000127E8();
    os_log_type_t v42 = sub_1000129B8();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      id v70 = v13;
      uint64_t v44 = (uint8_t *)v43;
      v77[0] = (id)swift_slowAlloc();
      id v71 = v18;
      *(_DWORD *)uint64_t v44 = 136446210;
      swift_getErrorValue();
      uint64_t v45 = sub_100012B88();
      *(void *)&long long v75 = sub_1000113C0(v45, v46, (uint64_t *)v77);
      id v18 = v71;
      sub_100012A28();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      uint64_t v47 = "Failed store gallery options %{public}s";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v41, v42, v47, v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      int64_t v21 = v70;
      swift_slowDealloc();
LABEL_28:

LABEL_29:
      swift_willThrow();

      goto LABEL_30;
    }
LABEL_27:
    swift_errorRelease();
    swift_errorRelease();
    goto LABEL_28;
  }
  id v70 = v13;
  id v71 = v10;
  sub_100003220(&qword_1000207C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000137F0;
  id v23 = v20;
  v77[0] = (id)sub_100012568();
  v77[1] = v24;
  sub_100012A78();
  uint64_t v25 = sub_1000124B8();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = v25;
  *(void *)(inited + 80) = v26;
  unint64_t v27 = sub_100006E94(inited);
  sub_10000C9B4(a1, a1[3]);
  if (sub_1000124A8())
  {
    sub_10000C9B4(a1, a1[3]);
    id v28 = [v71 assetDirectory];
    unint64_t v29 = v64;
    sub_100012338();

    unint64_t v30 = v65;
    uint64_t v31 = v72;
    sub_100012478();
    uint64_t v72 = v31;
    if (v31)
    {
      (*(void (**)(char *, uint64_t))(v66 + 8))(v29, v67);
      swift_bridgeObjectRelease();
      if (qword_1000201B0 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_100012808();
      sub_1000061E8(v32, (uint64_t)qword_100020E98);
      swift_errorRetain();
      swift_errorRetain();
      BOOL v33 = sub_1000127E8();
      os_log_type_t v34 = sub_1000129B8();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        v77[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v35 = 136446210;
        swift_getErrorValue();
        uint64_t v36 = sub_100012B88();
        *(void *)&long long v75 = sub_1000113C0(v36, v37, (uint64_t *)v77);
        sub_100012A28();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Failed copy WKWallpaperRepresenting %{public}s", v35, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }

      int64_t v21 = v70;
      id v18 = v71;
      goto LABEL_29;
    }
    v48 = *(void (**)(char *, uint64_t))(v66 + 8);
    uint64_t v49 = v29;
    uint64_t v50 = v67;
    v48(v49, v67);
    *(void *)&long long v75 = sub_100012558();
    *((void *)&v75 + 1) = v51;
    sub_100012A78();
    uint64_t v52 = sub_100012308();
    v76 = &type metadata for String;
    *(void *)&long long v75 = v52;
    *((void *)&v75 + 1) = v53;
    sub_10000CA5C(&v75, v74);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v73 = v27;
    sub_100008A08(v74, (uint64_t)v77, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_10000CA6C((uint64_t)v77);
    v48(v30, v50);
  }
  id v18 = v71;
  Class v55 = sub_100012888().super.isa;
  swift_bridgeObjectRelease();
  v77[0] = 0;
  unsigned __int8 v56 = [v18 storeUserInfo:v55 error:v77];

  int64_t v21 = v70;
  if ((v56 & 1) == 0)
  {
    id v58 = v77[0];
    uint64_t v59 = sub_1000122F8();

    uint64_t v72 = v59;
    swift_willThrow();
    if (qword_1000201B0 != -1) {
      swift_once();
    }
    uint64_t v60 = sub_100012808();
    sub_1000061E8(v60, (uint64_t)qword_100020E98);
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v41 = sub_1000127E8();
    os_log_type_t v42 = sub_1000129B8();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      v77[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136446210;
      swift_getErrorValue();
      uint64_t v61 = sub_100012B88();
      *(void *)&long long v75 = sub_1000113C0(v61, v62, (uint64_t *)v77);
      id v18 = v71;
      sub_100012A28();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      uint64_t v47 = "Failed store userInfo %{public}s";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  id v57 = v77[0];
LABEL_30:

  return v18;
}

uint64_t sub_1000099D4(uint64_t a1)
{
  v2[74] = v1;
  v2[73] = a1;
  uint64_t v3 = sub_100012368();
  v2[75] = v3;
  v2[76] = *(void *)(v3 - 8);
  v2[77] = swift_task_alloc();
  uint64_t v4 = sub_1000126C8();
  v2[78] = v4;
  v2[79] = *(void *)(v4 - 8);
  v2[80] = swift_task_alloc();
  v2[81] = swift_task_alloc();
  v2[82] = swift_task_alloc();
  v2[83] = swift_task_alloc();
  return _swift_task_switch(sub_100009B1C, 0, 0);
}

uint64_t sub_100009B1C()
{
  uint64_t v126 = v0;
  v119 = (void *)(v0 + 16);
  if (qword_1000201B0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 592);
  uint64_t v2 = sub_100012808();
  sub_1000061E8(v2, (uint64_t)qword_100020E98);
  id v3 = v1;
  uint64_t v4 = sub_1000127E8();
  os_log_type_t v5 = sub_1000129C8();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void **)(v0 + 592);
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    v125[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136446466;
    swift_getObjectType();
    uint64_t v9 = sub_100012BB8();
    *(void *)(v0 + 568) = sub_1000113C0(v9, v10, v125);
    sub_100012A28();
    swift_bridgeObjectRelease();

    *(_WORD *)(v8 + 12) = 2082;
    *(void *)(v0 + 576) = sub_1000113C0(0xD00000000000001ALL, 0x8000000100013F70, v125);
    sub_100012A28();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Start (%{public}s.%{public}s)…", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v11 = *(void *)(v0 + 592);
  id v12 = [self defaultWallpaperManager];
  id v13 = [v12 defaultWallpaperBundle];

  sub_1000129D8();
  uint64_t v14 = *(void *)(v11
                  + OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterUpdateDelegate_wallpaperRepresentingCollectionsManager);
  *(void *)(v0 + 488) = v14;
  sub_1000126F8();
  sub_10000CC88(&qword_100020790, (void (*)(uint64_t))&type metadata accessor for WKWallpaperRepresentingCollectionsManager);
  swift_retain();
  sub_100012978();
  uint64_t v15 = *(void *)(v0 + 480);
  *(void *)(v0 + 552) = v14;
  *(void *)(v0 + 528) = v15;
  sub_100012988();
  if (v15 == *(void *)(v0 + 472))
  {
    swift_release();
    goto LABEL_45;
  }
  char v117 = 0;
  v108 = (void *)(v0 + 136);
  v111 = (long long *)(v0 + 176);
  v109 = (void *)(v0 + 96);
  v110 = (void *)(v0 + 216);
  v115 = (void *)(v0 + 256);
  v113 = (void *)(v0 + 376);
  uint64_t v16 = *(void *)(v0 + 632);
  uint64_t v114 = *(void *)(v0 + 584);
  v120 = (void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
  v121 = (void (**)(uint64_t, uint64_t))(v16 + 8);
  v122 = (void (**)(uint64_t))(v16 + 16);
  v112 = (void (**)(uint64_t, os_log_type_t *))(*(void *)(v0 + 608) + 8);
  uint64_t v116 = v0 + 336;
  do
  {
    while (1)
    {
      uint64_t v17 = *(void *)(v0 + 664);
      uint64_t v123 = *(void *)(v0 + 656);
      uint64_t v18 = *(void *)(v0 + 624);
      unsigned int v19 = (void (*)(uint64_t, void))sub_1000129A8();
      id v20 = *v122;
      (*v122)(v17);
      v19(v0 + 416, 0);
      *(void *)(v0 + 448) = *(void *)(v0 + 552);
      sub_100012998();
      (*v120)(v123, v17, v18);
      if ((sub_1000126A8() & 1) == 0) {
        break;
      }
      (*v121)(*(void *)(v0 + 656), *(void *)(v0 + 624));
      uint64_t v21 = *(void *)(v0 + 528);
      sub_100012988();
      if (v21 == *(void *)(v0 + 472)) {
        goto LABEL_44;
      }
    }
    if ((v117 & 1) != 0
      || (sub_10000C9B4(v119, *(void *)(v0 + 40)),
          v128._countAndFlagsBits = sub_1000124B8(),
          BOOL v22 = sub_1000126B8(v128),
          swift_bridgeObjectRelease(),
          !v22))
    {
      uint64_t v39 = *(void *)(v0 + 656);
      uint64_t v40 = *(void *)(v0 + 640);
      uint64_t v41 = *(void *)(v0 + 624);
      uint64_t v26 = (void *)(v0 + 336);
      sub_100012678();
      sub_10000C9F8(v116, (uint64_t)v113);
      ((void (*)(uint64_t, uint64_t, uint64_t))v20)(v40, v39, v41);
      os_log_type_t v42 = sub_1000127E8();
      os_log_type_t v43 = sub_1000129C8();
      BOOL v44 = os_log_type_enabled(v42, v43);
      uint64_t v45 = *(void *)(v0 + 640);
      uint64_t v46 = *(void *)(v0 + 624);
      if (v44)
      {
        uint64_t v47 = *(void *)(v0 + 616);
        *(void *)v102 = *(void *)(v0 + 600);
        uint64_t v99 = *(void *)(v0 + 640);
        uint64_t v48 = swift_slowAlloc();
        v125[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v48 = 136446466;
        sub_10000C9B4(v113, *(void *)(v0 + 400));
        loga = v42;
        uint64_t v49 = sub_1000124B8();
        *(void *)(v0 + 512) = sub_1000113C0(v49, v50, v125);
        sub_100012A28();
        swift_bridgeObjectRelease();
        sub_10000CBDC((uint64_t)v113);
        *(_WORD *)(v48 + 12) = 2082;
        uint64_t v51 = v47;
        sub_100012688();
        uint64_t v52 = sub_100012358();
        unint64_t v54 = v53;
        (*v112)(v51, *(os_log_type_t **)v102);
        *(void *)(v0 + 520) = sub_1000113C0(v52, v54, v125);
        sub_100012A28();
        uint64_t v26 = (void *)(v0 + 336);
        swift_bridgeObjectRelease();
        id v38 = *v121;
        (*v121)(v99, v46);
        os_log_type_t v42 = loga;
        _os_log_impl((void *)&_mh_execute_header, loga, v43, "Using wallpaper (id: '%{public}s') as previewWallpaperRepresenting for collection %{public}s.", (uint8_t *)v48, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_10000CBDC((uint64_t)v113);
        id v38 = *v121;
        (*v121)(v45, v46);
      }

      char v55 = 0;
    }
    else
    {
      uint64_t v23 = *(void *)(v0 + 656);
      uint64_t v24 = *(void *)(v0 + 648);
      uint64_t v25 = *(void *)(v0 + 624);
      uint64_t v26 = (void *)(v0 + 336);
      sub_10000C9F8((uint64_t)v119, v116);
      sub_10000C9F8(v116, (uint64_t)v109);
      ((void (*)(uint64_t, uint64_t, uint64_t))v20)(v24, v23, v25);
      unint64_t v27 = sub_1000127E8();
      os_log_type_t v28 = sub_1000129C8();
      BOOL v29 = os_log_type_enabled(v27, v28);
      uint64_t v30 = *(void *)(v0 + 648);
      uint64_t v31 = *(void *)(v0 + 624);
      if (v29)
      {
        uint64_t v100 = *(void *)(v0 + 616);
        *(void *)v101 = *(void *)(v0 + 600);
        uint64_t v98 = *(void *)(v0 + 648);
        uint64_t v32 = swift_slowAlloc();
        v125[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v32 = 136446466;
        os_log_type_t v118 = v28;
        sub_10000C9B4(v109, *(void *)(v0 + 120));
        log = v27;
        uint64_t v33 = sub_1000124B8();
        *(void *)(v0 + 536) = sub_1000113C0(v33, v34, v125);
        sub_100012A28();
        swift_bridgeObjectRelease();
        sub_10000CBDC((uint64_t)v109);
        *(_WORD *)(v32 + 12) = 2082;
        sub_100012688();
        uint64_t v35 = sub_100012358();
        unint64_t v37 = v36;
        (*v112)(v100, *(os_log_type_t **)v101);
        *(void *)(v0 + 544) = sub_1000113C0(v35, v37, v125);
        sub_100012A28();
        swift_bridgeObjectRelease();
        id v38 = *v121;
        (*v121)(v98, v31);
        unint64_t v27 = log;
        _os_log_impl((void *)&_mh_execute_header, log, v118, "Using default wallpaper (id: '%{public}s') as previewWallpaperRepresenting for collection %{public}s.", (uint8_t *)v32, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_10000CBDC((uint64_t)v109);
        id v38 = *v121;
        (*v121)(v30, v31);
      }

      char v117 = 1;
      char v55 = 1;
    }
    sub_10000C9B4(v26, *(void *)(v0 + 360));
    uint64_t v56 = sub_1000124B8();
    v124 = v38;
    if (!*(void *)(v114 + 16) || (unint64_t v58 = sub_100008678(v56, v57), (v59 & 1) == 0))
    {
      swift_bridgeObjectRelease();
LABEL_28:
      uint64_t v64 = v0 + 256;
      v65 = (void *)(v0 + 296);
      goto LABEL_29;
    }
    id v60 = *(id *)(*(void *)(v114 + 56) + 8 * v58);
    swift_bridgeObjectRelease();
    sub_100006FD8(v60, (uint64_t)v111);
    if (!*(void *)(v0 + 200))
    {

      sub_10000CAC0((uint64_t)v111, &qword_100020768);
      goto LABEL_28;
    }
    sub_10000C99C(v111, (uint64_t)v110);
    sub_10000C9B4(v110, *(void *)(v0 + 240));
    sub_100012498();
    float v62 = v61;
    sub_10000C9B4(v26, *(void *)(v0 + 360));
    sub_100012498();
    if (v63 > v62)
    {

      sub_10000CBDC((uint64_t)v110);
      uint64_t v64 = v0 + 256;
      uint64_t v26 = (void *)(v0 + 336);
      v65 = (void *)(v0 + 296);
LABEL_29:
      sub_10000C9F8((uint64_t)v26, (uint64_t)v65);
      sub_10000C9F8((uint64_t)v26, v64);
      uint64_t v66 = sub_1000127E8();
      os_log_type_t v67 = sub_1000129C8();
      if (os_log_type_enabled(v66, v67))
      {
        os_log_type_t type = v67;
        uint64_t v68 = swift_slowAlloc();
        v125[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v68 = 136446466;
        sub_10000C9B4(v65, *(void *)(v0 + 320));
        uint64_t v69 = sub_1000124B8();
        *(void *)(v0 + 456) = sub_1000113C0(v69, v70, v125);
        sub_100012A28();
        swift_bridgeObjectRelease();
        sub_10000CBDC((uint64_t)v65);
        *(_WORD *)(v68 + 12) = 2050;
        sub_10000C9B4(v115, *(void *)(v0 + 280));
        uint64_t v26 = (void *)(v0 + 336);
        sub_100012498();
        *(double *)(v0 + 464) = v71;
        sub_100012A28();
        sub_10000CBDC((uint64_t)v115);
        _os_log_impl((void *)&_mh_execute_header, v66, type, "Creating new descriptor with identifier '%{public}s' for version '%{public}f'.", (uint8_t *)v68, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_10000CBDC((uint64_t)v65);
        sub_10000CBDC(v64);
      }

      sub_100012698();
      id v72 = sub_100008F64(v26, v55);
      swift_bridgeObjectRelease();
      id v73 = v72;
      sub_1000128F8();
      if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100012928();
      }
      uint64_t v74 = *(void *)(v0 + 656);
      uint64_t v75 = *(void *)(v0 + 624);
      sub_100012938();
      sub_100012918();

      v124(v74, v75);
      goto LABEL_35;
    }
    sub_10000C9F8((uint64_t)v110, (uint64_t)v108);
    id v77 = v60;
    v78 = sub_1000127E8();
    os_log_type_t v79 = sub_1000129C8();
    if (os_log_type_enabled(v78, v79))
    {
      logb = v78;
      uint64_t v80 = swift_slowAlloc();
      v125[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v80 = 136446466;
      id v81 = [v77 identifier];
      uint64_t v82 = sub_1000128B8();
      os_log_type_t v103 = v79;
      unint64_t v84 = v83;

      *(void *)(v0 + 496) = sub_1000113C0(v82, v84, v125);
      sub_100012A28();
      swift_bridgeObjectRelease();

      *(_WORD *)(v80 + 12) = 2050;
      sub_10000C9B4(v108, *(void *)(v0 + 160));
      sub_100012498();
      *(double *)(v0 + 504) = v85;
      sub_100012A28();
      sub_10000CBDC((uint64_t)v108);
      _os_log_impl((void *)&_mh_execute_header, logb, v103, "Using existing descriptor with identifier '%{public}s' since the content version matched '%{public}f'.", (uint8_t *)v80, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_10000CBDC((uint64_t)v108);
    }
    uint64_t v26 = (void *)(v0 + 336);
    id v86 = v77;
    sub_1000128F8();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100012928();
    }
    uint64_t v87 = *(void *)(v0 + 656);
    uint64_t v88 = *(void *)(v0 + 624);
    sub_100012938();
    sub_100012918();

    v38(v87, v88);
    sub_10000CBDC((uint64_t)v110);
LABEL_35:
    sub_10000CBDC((uint64_t)v26);
    uint64_t v76 = *(void *)(v0 + 528);
    sub_100012988();
  }
  while (v76 != *(void *)(v0 + 472));
LABEL_44:
  swift_release();
  if ((v117 & 1) == 0)
  {
LABEL_45:
    sub_10000C9F8((uint64_t)v119, v0 + 56);
    v89 = sub_1000127E8();
    os_log_type_t v90 = sub_1000129C8();
    if (os_log_type_enabled(v89, v90))
    {
      v91 = (uint8_t *)swift_slowAlloc();
      v125[0] = swift_slowAlloc();
      *(_DWORD *)v91 = 136446210;
      sub_10000C9B4((void *)(v0 + 56), *(void *)(v0 + 80));
      uint64_t v92 = sub_1000124B8();
      *(void *)(v0 + 560) = sub_1000113C0(v92, v93, v125);
      sub_100012A28();
      swift_bridgeObjectRelease();
      sub_10000CBDC(v0 + 56);
      _os_log_impl((void *)&_mh_execute_header, v89, v90, "Creating new descriptor for default wallpaper with identifier %{public}s.", v91, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10000CBDC(v0 + 56);
    }

    id v94 = sub_100008F64(v119, 1);
    sub_1000128F8();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100012928();
    }
    sub_100012938();
    sub_100012918();
  }
  v95 = *(void **)(v0 + 592);
  sub_10000CBDC((uint64_t)v119);
  sub_1000059C8(v95, 0xD00000000000001ALL, 0x8000000100013F70);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v96 = *(uint64_t (**)(void *))(v0 + 8);
  return v96(&_swiftEmptyArrayStorage);
}

uint64_t sub_10000AE30(uint64_t a1)
{
  v2[106] = v1;
  v2[105] = a1;
  sub_100003220(&qword_100020750);
  v2[107] = swift_task_alloc();
  uint64_t v3 = sub_100012348();
  v2[108] = v3;
  v2[109] = *(void *)(v3 - 8);
  v2[110] = swift_task_alloc();
  v2[111] = swift_task_alloc();
  v2[112] = swift_task_alloc();
  v2[113] = swift_task_alloc();
  sub_100003220(&qword_100020758);
  v2[114] = swift_task_alloc();
  uint64_t v4 = sub_1000123F8();
  v2[115] = v4;
  v2[116] = *(void *)(v4 - 8);
  v2[117] = swift_task_alloc();
  v2[118] = swift_task_alloc();
  return _swift_task_switch(sub_10000B014, 0, 0);
}

uint64_t sub_10000B014()
{
  uint64_t v144 = v0;
  if (qword_1000201B0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 848);
  uint64_t v2 = sub_100012808();
  sub_1000061E8(v2, (uint64_t)qword_100020E98);
  id v3 = v1;
  uint64_t v4 = sub_1000127E8();
  os_log_type_t v5 = sub_1000129C8();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void **)(v0 + 848);
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    v143[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136446466;
    swift_getObjectType();
    uint64_t v9 = sub_100012BB8();
    *(void *)(v0 + 824) = sub_1000113C0(v9, v10, v143);
    sub_100012A28();
    swift_bridgeObjectRelease();

    *(_WORD *)(v8 + 12) = 2082;
    *(void *)(v0 + 832) = sub_1000113C0(0xD00000000000001CLL, 0x8000000100013F50, v143);
    sub_100012A28();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Start (%{public}s.%{public}s)…", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v11 = v0 + 808;
  id v12 = *(void **)(v0 + 840);
  sub_100012558();
  NSString v13 = sub_1000128A8();
  swift_bridgeObjectRelease();
  p_types = &stru_10001EFF8.types;
  id v15 = [v12 objectForUserInfoKey:v13];

  if (v15)
  {
    sub_100012A48();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 504) = 0u;
    *(_OWORD *)(v0 + 520) = 0u;
  }
  uint64_t v16 = v0 + 16;
  sub_10000C934(v0 + 504, v0 + 600);
  if (!*(void *)(v0 + 624))
  {
    sub_10000CAC0(v0 + 600, &qword_100020760);
LABEL_14:
    uint64_t v23 = *(void **)(v0 + 840);
    *(_OWORD *)uint64_t v16 = 0u;
    *(_OWORD *)(v16 + 16) = 0u;
    *(void *)(v16 + 32) = 0;
    sub_100012568();
    NSString v24 = sub_1000128A8();
    swift_bridgeObjectRelease();
    id v25 = objc_msgSend(v23, p_types[336], v24);

    if (v25)
    {
      sub_100012A48();
      swift_unknownObjectRelease();
    }
    else
    {
      *(_OWORD *)(v0 + 440) = 0u;
      *(_OWORD *)(v0 + 456) = 0u;
    }
    sub_10000C934(v0 + 440, v0 + 472);
    if (*(void *)(v0 + 496))
    {
      if (swift_dynamicCast())
      {
        uint64_t v139 = v11;
        uint64_t v26 = *(void *)(v0 + 648);
        unint64_t v27 = *(void **)(v0 + 656);
        swift_bridgeObjectRetain_n();
        os_log_type_t v28 = sub_1000127E8();
        os_log_type_t v29 = sub_1000129C8();
        v141 = (uint64_t *)v16;
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = (uint8_t *)swift_slowAlloc();
          v143[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v30 = 136446210;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 800) = sub_1000113C0(v26, (unint64_t)v27, v143);
          sub_100012A28();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "Resolved wallpaperRepresentingIdentifier from userInfo '%{public}s'.", v30, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        goto LABEL_31;
      }
    }
    else
    {
      sub_10000CAC0(v0 + 472, &qword_100020760);
    }
    uint64_t v31 = sub_1000127E8();
    os_log_type_t v32 = sub_1000129B8();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Unable to resolve wallpaperRepresentingIdentifier.", v33, 2u);
      swift_slowDealloc();
    }
    unint64_t v34 = *(void **)(v0 + 848);
    uint64_t v35 = *(void **)(v0 + 840);

    id v36 = v35;
    sub_10000CAC0(v16, &qword_100020768);
    unint64_t v37 = v34;
    goto LABEL_43;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_14;
  }
  v141 = (uint64_t *)(v0 + 16);
  uint64_t v17 = *(void *)(v0 + 928);
  *(void *)v136 = *(void *)(v0 + 920);
  uint64_t v139 = v0 + 808;
  uint64_t v18 = *(void *)(v0 + 912);
  uint64_t v19 = *(void *)(v0 + 896);
  uint64_t v20 = *(void *)(v0 + 872);
  uint64_t v21 = *(void *)(v0 + 864);
  id v22 = [*(id *)(v0 + 840) assetDirectory];
  sub_100012338();

  sub_100012328();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  sub_1000123E8();
  if ((*(unsigned int (**)(uint64_t, uint64_t, os_log_type_t *))(v17 + 48))(v18, 1, *(os_log_type_t **)v136) == 1)
  {
    sub_10000CAC0(*(void *)(v0 + 912), &qword_100020758);
    uint64_t v16 = v0 + 16;
    uint64_t v11 = v0 + 808;
    p_types = (char **)(&stru_10001EFF8 + 8);
    goto LABEL_14;
  }
  uint64_t v38 = *(void *)(v0 + 944);
  uint64_t v39 = *(void *)(v0 + 936);
  uint64_t v40 = *(void *)(v0 + 928);
  uint64_t v41 = *(void *)(v0 + 920);
  (*(void (**)(uint64_t, void, uint64_t))(v40 + 32))(v38, *(void *)(v0 + 912), v41);
  os_log_type_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16);
  v42(v39, v38, v41);
  os_log_type_t v43 = sub_1000127E8();
  os_log_type_t v44 = sub_1000129C8();
  BOOL v45 = os_log_type_enabled(v43, v44);
  uint64_t v46 = *(void *)(v0 + 936);
  uint64_t v47 = *(void *)(v0 + 928);
  if (v45)
  {
    uint64_t v134 = *(void *)(v0 + 920);
    *(void *)v137 = v42;
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    v143[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v48 = 136446210;
    uint64_t v49 = sub_1000123D8();
    *(void *)(v0 + 816) = sub_1000113C0(v49, v50, v143);
    sub_100012A28();
    swift_bridgeObjectRelease();
    uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
    v51(v46, v134);
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Resolved wallpaperRepresentingIdentifier from wallpaper bundle '%{public}s'.", v48, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    os_log_type_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))v137;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
    v51(*(void *)(v0 + 936), *(void *)(v0 + 920));
  }

  uint64_t v52 = *(void *)(v0 + 944);
  uint64_t v53 = *(void *)(v0 + 920);
  *(void *)(v0 + 40) = v53;
  *(void *)(v0 + 48) = sub_10000CC88(&qword_100020778, (void (*)(uint64_t))&type metadata accessor for WKWallpaperBundle);
  unint64_t v54 = sub_10000CB1C(v141);
  v42((uint64_t)v54, v52, v53);
  uint64_t v26 = sub_1000123D8();
  unint64_t v27 = v55;
  v51(v52, v53);
LABEL_31:
  uint64_t v56 = *(char **)(v0 + 856);
  swift_bridgeObjectRetain();
  uint64_t v57 = swift_retain();
  sub_100007C74(v57, v26, v27, v56);
  swift_release();
  uint64_t v58 = sub_1000126C8();
  uint64_t v59 = *(void *)(v58 - 8);
  int v60 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v59 + 48))(v56, 1, v58);
  uint64_t v61 = *(void *)(v0 + 856);
  uint64_t v142 = v26;
  if (v60 == 1)
  {
    sub_10000CAC0(v61, &qword_100020750);
    *(_OWORD *)(v0 + 296) = 0u;
    *(_OWORD *)(v0 + 312) = 0u;
    *(void *)(v0 + 328) = 0;
LABEL_36:
    sub_10000CAC0(v0 + 296, &qword_100020768);
    goto LABEL_37;
  }
  sub_1000126D8();
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v61, v58);
  if (!*(void *)(v0 + 320)) {
    goto LABEL_36;
  }
  uint64_t v62 = v0 + 256;
  sub_10000C99C((long long *)(v0 + 296), v0 + 256);
  sub_10000C9B4((void *)(v0 + 256), *(void *)(v0 + 280));
  if ((sub_100012488() & 1) == 0)
  {
    uint64_t v73 = *(void *)(v0 + 40);
    if (v73)
    {
      uint64_t v74 = sub_10000C9B4(v141, v73);
      os_log_t log = (os_log_t)(v0 + 256);
      uint64_t v75 = *(void *)(v73 - 8);
      uint64_t v76 = swift_task_alloc();
      (*(void (**)(uint64_t, void *, uint64_t))(v75 + 16))(v76, v74, v73);
      sub_100012498();
      float v78 = v77;
      (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v76, v73);
      uint64_t v62 = v0 + 256;
      swift_task_dealloc();
      sub_10000C9B4((void *)(v0 + 256), *(void *)(v0 + 280));
      sub_100012498();
      if (v78 < v79)
      {
        sub_10000C9F8(v62, v0 + 136);
        swift_bridgeObjectRetain_n();
        uint64_t v80 = sub_1000127E8();
        os_log_type_t v81 = sub_1000129C8();
        if (os_log_type_enabled(v80, v81))
        {
          uint64_t v82 = swift_slowAlloc();
          v143[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v82 = 136446722;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 776) = sub_1000113C0(v142, (unint64_t)v27, v143);
          sub_100012A28();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v82 + 12) = 2050;
          *(double *)(v0 + 784) = v78;
          sub_100012A28();
          *(_WORD *)(v82 + 22) = 2050;
          sub_10000C9B4((void *)(v0 + 136), *(void *)(v0 + 160));
          sub_100012498();
          *(double *)(v0 + 792) = v83;
          sub_100012A28();
          sub_10000CBDC(v0 + 136);
          _os_log_impl((void *)&_mh_execute_header, v80, v81, "Updated configuration needed for '%{public}s', existingContentVersion '%{public}f', currentContentVersion '%{public}f'.", (uint8_t *)v82, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
          sub_10000CBDC(v0 + 136);
        }

        id v70 = [self mutableConfiguration];
        sub_10000C9B4(log, *(void *)(v0 + 280));
        id v90 = [v70 assetDirectory];
        sub_100012338();

        sub_100012478();
        v97 = *(void **)(v0 + 840);
        uint64_t v98 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 872) + 8);
        v98(*(void *)(v0 + 880), *(void *)(v0 + 864));
        uint64_t v99 = sub_100012308();
        uint64_t v101 = v100;
        *(void *)(v0 + 808) = 0;
        id v102 = [v97 loadUserInfoWithError:v139];
        os_log_type_t v103 = *(void **)(v0 + 808);
        if (v102)
        {
          v104 = v102;
          uint64_t v105 = sub_100012898();
          id v106 = v103;

          *(void *)(v0 + 632) = sub_100012558();
          *(void *)(v0 + 640) = v107;
          sub_100012A78();
          *(void *)(v0 + 592) = &type metadata for String;
          *(void *)(v0 + 568) = v99;
          *(void *)(v0 + 576) = v101;
          sub_10000CA5C((_OWORD *)(v0 + 568), (_OWORD *)(v0 + 536));
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v143[0] = v105;
          sub_100008A08((_OWORD *)(v0 + 536), v0 + 56, isUniquelyReferenced_nonNull_native);
          uint64_t v109 = v143[0];
          swift_bridgeObjectRelease();
          sub_10000CA6C(v0 + 56);
          *(void *)(v0 + 680) = sub_100012568();
          *(void *)(v0 + 688) = v110;
          sub_100012A78();
          sub_10000C9B4(log, *(void *)(v0 + 280));
          uint64_t v111 = sub_1000124B8();
          *(void *)(v0 + 432) = &type metadata for String;
          *(void *)(v0 + 408) = v111;
          *(void *)(v0 + 416) = v112;
          sub_10000CA5C((_OWORD *)(v0 + 408), (_OWORD *)(v0 + 376));
          char v113 = swift_isUniquelyReferenced_nonNull_native();
          v143[0] = v109;
          sub_100008A08((_OWORD *)(v0 + 376), v0 + 176, v113);
          swift_bridgeObjectRelease();
          sub_10000CA6C(v0 + 176);
          Class isa = sub_100012888().super.isa;
          swift_bridgeObjectRelease();
          *(void *)(v0 + 736) = 0;
          unsigned int v115 = [v70 storeUserInfo:isa error:v0 + 736];

          uint64_t v116 = *(void **)(v0 + 736);
          if (v115)
          {
            id v117 = v116;
            swift_bridgeObjectRelease();
            sub_10000C9F8((uint64_t)log, v0 + 336);
            sub_10000C9F8((uint64_t)log, v0 + 216);
            os_log_type_t v118 = sub_1000127E8();
            os_log_type_t v119 = sub_1000129C8();
            BOOL v120 = os_log_type_enabled(v118, v119);
            uint64_t v121 = *(void *)(v0 + 888);
            uint64_t v122 = *(void *)(v0 + 864);
            if (v120)
            {
              os_log_type_t v138 = v119;
              uint64_t v123 = swift_slowAlloc();
              v143[0] = swift_slowAlloc();
              *(_DWORD *)uint64_t v123 = 136446466;
              sub_10000C9B4((void *)(v0 + 336), *(void *)(v0 + 360));
              uint64_t v124 = sub_1000124B8();
              *(void *)(v0 + 760) = sub_1000113C0(v124, v125, v143);
              sub_100012A28();
              swift_bridgeObjectRelease();
              sub_10000CBDC(v0 + 336);
              *(_WORD *)(v123 + 12) = 2050;
              sub_10000C9B4((void *)(v0 + 216), *(void *)(v0 + 240));
              sub_100012498();
              *(double *)(v0 + 768) = v126;
              sub_100012A28();
              sub_10000CBDC(v0 + 216);
              _os_log_impl((void *)&_mh_execute_header, v118, v138, "Updated configuration for wallpaper identifier '%{public}s' to contentVersion '%{public}f'.", (uint8_t *)v123, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              sub_10000CBDC(v0 + 216);
              sub_10000CBDC(v0 + 336);
            }
            v98(v121, v122);
            v133 = *(void **)(v0 + 848);
            sub_10000CBDC((uint64_t)log);
            sub_10000CAC0((uint64_t)v141, &qword_100020768);
            sub_1000059C8(v133, 0xD00000000000001CLL, 0x8000000100013F50);
            goto LABEL_44;
          }
          uint64_t v130 = *(void *)(v0 + 888);
          uint64_t v131 = *(void *)(v0 + 864);
          id v132 = v116;
          sub_1000122F8();

          swift_willThrow();
          v98(v130, v131);
        }
        else
        {
          uint64_t v127 = *(void *)(v0 + 888);
          uint64_t v128 = *(void *)(v0 + 864);
          id v129 = v103;
          swift_bridgeObjectRelease();
          sub_1000122F8();

          swift_willThrow();
          v98(v127, v128);
        }
        uint64_t v66 = v141;
        sub_10000C9F8((uint64_t)log, v0 + 96);
        swift_errorRetain();
        swift_bridgeObjectRetain();
        swift_errorRetain();
        v91 = sub_1000127E8();
        os_log_type_t v92 = sub_1000129B8();
        if (os_log_type_enabled(v91, v92))
        {
          uint64_t v93 = swift_slowAlloc();
          v140 = (void *)swift_slowAlloc();
          v143[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v93 = 136446722;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 696) = sub_1000113C0(v142, (unint64_t)v27, v143);
          sub_100012A28();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v93 + 12) = 2050;
          sub_10000C9B4((void *)(v0 + 96), *(void *)(v0 + 120));
          sub_100012498();
          *(double *)(v0 + 712) = v94;
          sub_100012A28();
          sub_10000CBDC(v0 + 96);
          *(_WORD *)(v93 + 22) = 2114;
          swift_errorRetain();
          uint64_t v95 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v0 + 752) = v95;
          sub_100012A28();
          void *v140 = v95;
          uint64_t v66 = v141;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v91, v92, "Failed to update configuration for identifier '%{public}s' to contentVersion '%{public}f'  with error, using existing configuration '%{public}@'.", (uint8_t *)v93, 0x20u);
          sub_100003220(&qword_100020770);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          swift_errorRelease();
        }
        else
        {
          swift_errorRelease();
          swift_bridgeObjectRelease_n();
          sub_10000CBDC(v0 + 96);
          swift_errorRelease();
          swift_errorRelease();
        }
        os_log_type_t v67 = *(void **)(v0 + 848);
        id v96 = *(id *)(v0 + 840);
        sub_10000CBDC((uint64_t)log);
        goto LABEL_41;
      }
      swift_bridgeObjectRetain();
      unint64_t v84 = sub_1000127E8();
      os_log_type_t v87 = sub_1000129C8();
      if (os_log_type_enabled(v84, v87))
      {
        uint64_t v88 = swift_slowAlloc();
        v143[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v88 = 136446466;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 720) = sub_1000113C0(v142, (unint64_t)v27, v143);
        sub_100012A28();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v88 + 12) = 2050;
        *(double *)(v0 + 704) = v78;
        sub_100012A28();
        _os_log_impl((void *)&_mh_execute_header, v84, v87, "No update needed for '%{public}s', contentVersion matches '%{public}f'.", (uint8_t *)v88, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        goto LABEL_56;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      unint64_t v84 = sub_1000127E8();
      os_log_type_t v85 = sub_1000129C8();
      if (os_log_type_enabled(v84, v85))
      {
        id v86 = (uint8_t *)swift_slowAlloc();
        v143[0] = swift_slowAlloc();
        *(_DWORD *)id v86 = 136446210;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 728) = sub_1000113C0(v142, (unint64_t)v27, v143);
        uint64_t v62 = v0 + 256;
        sub_100012A28();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v84, v85, "No update needed for %{public}s, no contentVersion could be found.", v86, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
LABEL_56:

        os_log_type_t v67 = *(void **)(v0 + 848);
        id v89 = *(id *)(v0 + 840);
        sub_10000CBDC(v62);
        uint64_t v69 = (uint64_t)v141;
        goto LABEL_42;
      }
    }
    swift_bridgeObjectRelease_n();
    goto LABEL_56;
  }
  sub_10000CBDC(v0 + 256);
LABEL_37:
  swift_bridgeObjectRetain();
  float v63 = sub_1000127E8();
  os_log_type_t v64 = sub_1000129C8();
  if (os_log_type_enabled(v63, v64))
  {
    v65 = (uint8_t *)swift_slowAlloc();
    v143[0] = swift_slowAlloc();
    *(_DWORD *)v65 = 136446210;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 744) = sub_1000113C0(v142, (unint64_t)v27, v143);
    sub_100012A28();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v63, v64, "No updated wallpaper asset found for identifier %{public}s, returning current poster configuration.", v65, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v66 = v141;
  os_log_type_t v67 = *(void **)(v0 + 848);
  id v68 = *(id *)(v0 + 840);
LABEL_41:
  uint64_t v69 = (uint64_t)v66;
LABEL_42:
  sub_10000CAC0(v69, &qword_100020768);
  unint64_t v37 = v67;
LABEL_43:
  sub_1000059C8(v37, 0xD00000000000001CLL, 0x8000000100013F50);
  id v70 = *(id *)(v0 + 840);
LABEL_44:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  float v71 = *(uint64_t (**)(id))(v0 + 8);
  return v71(v70);
}

uint64_t sub_10000C934(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003220(&qword_100020760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C99C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_10000C9B4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000C9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_10000CA5C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000CA6C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000CAC0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003220(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_10000CB1C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10000CB80(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000CBDC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000CC2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000CC88(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000CCD4()
{
  _Block_release(*(const void **)(v0 + 32));
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000CD24()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  os_log_type_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  BOOL v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *BOOL v6 = v1;
  v6[1] = sub_10000CDE4;
  uint64_t v7 = (uint64_t (*)(int, void *, void *, void *))((char *)&dword_100020798 + dword_100020798);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000CDE4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000CEE0()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000CF20(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000CF5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003220(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000CFC4(uint64_t a1)
{
  return sub_10000D020(a1, qword_100020E98);
}

uint64_t sub_10000CFE4(uint64_t a1)
{
  return sub_10000D020(a1, qword_100020EB0);
}

uint64_t sub_10000D004(uint64_t a1)
{
  return sub_10000D020(a1, qword_100020EC8);
}

uint64_t sub_10000D020(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100012808();
  sub_10000D224(v3, a2);
  sub_1000061E8(v3, (uint64_t)a2);
  return sub_1000127F8();
}

uint64_t sub_10000D098(uint64_t a1)
{
  return sub_10000D0F0(a1, qword_100020EE0, &qword_1000201B8, (uint64_t)qword_100020EB0);
}

uint64_t sub_10000D0C4(uint64_t a1)
{
  return sub_10000D0F0(a1, qword_100020EF8, &qword_1000201C0, (uint64_t)qword_100020EC8);
}

uint64_t sub_10000D0F0(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = sub_100012808();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100012788();
  sub_10000D224(v11, a2);
  sub_1000061E8(v11, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1000061E8(v7, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v7);
  return sub_100012768();
}

uint64_t *sub_10000D224(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id sub_10000D288(id a1)
{
  if (a1)
  {
    [a1 duration];
    [a1 delay];
  }
  id v2 = [a1 timingFunction];
  if (!v2) {
    id v2 = [self functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  }
  sub_10000D374();
  sub_100012828();
  swift_release();
  return v2;
}

uint64_t sub_10000D374()
{
  sub_100003220((uint64_t *)&unk_1000207E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100013440;
  *(void *)(inited + 32) = 0;
  uint64_t v2 = inited + 32;
  uint64_t v3 = swift_initStackObject();
  *(_OWORD *)(v3 + 16) = xmmword_100013440;
  *(void *)(v3 + 32) = 0;
  uint64_t v4 = v3 + 32;
  [v0 getControlPointAtIndex:1 values:v2];
  [v0 getControlPointAtIndex:2 values:v4];
  uint64_t v5 = sub_100012818();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

id sub_10000D478()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_100012808();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  BOOL v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editor] = 0;
  uint64_t v7 = &v1[OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_environmentSnapshot];
  uint64_t v8 = sub_100012528();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(void *)&v1[OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editingEnvironment] = 0;
  *(void *)&v1[OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_wallpaperPosterEditorController] = 0;
  uint64_t v9 = qword_1000201B0;
  unint64_t v10 = v1;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000061E8(v3, (uint64_t)qword_100020E98);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v11, v3);
  uint64_t v12 = v10;
  NSString v13 = sub_1000127E8();
  os_log_type_t v14 = sub_1000129C8();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    id v22 = ObjectType;
    uint64_t v16 = v15;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v24 = v21;
    *(_DWORD *)uint64_t v16 = 136446466;
    swift_getObjectType();
    uint64_t v17 = sub_100012BB8();
    uint64_t v23 = sub_1000113C0(v17, v18, &v24);
    sub_100012A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    uint64_t v23 = sub_1000113C0(0x292874696E69, 0xE600000000000000, &v24);
    sub_100012A28();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Start (%{public}s.%{public}s)…", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t ObjectType = v22;
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_100012588();
  sub_100012578();
  swift_release();
  v25.receiver = v12;
  v25.super_class = ObjectType;
  id v19 = objc_msgSendSuper2(&v25, "init");
  sub_10000D7D0(v19);

  return v19;
}

uint64_t sub_10000D7D0(void *a1)
{
  uint64_t v2 = sub_100012808();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201B0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1000061E8(v2, (uint64_t)qword_100020E98);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = a1;
  uint64_t v8 = sub_1000127E8();
  os_log_type_t v9 = sub_1000129C8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v10 = 136446466;
    swift_getObjectType();
    uint64_t v11 = sub_100012BB8();
    uint64_t v16 = sub_1000113C0(v11, v12, &v17);
    sub_100012A28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2082;
    uint64_t v16 = sub_1000113C0(0x292874696E69, 0xE600000000000000, &v17);
    sub_100012A28();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "…Complete (%{public}s.%{public}s)", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10000DAFC()
{
  return type metadata accessor for CollectionsPosterEditDelegate();
}

uint64_t type metadata accessor for CollectionsPosterEditDelegate()
{
  uint64_t result = qword_100020820;
  if (!qword_100020820) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000DB50()
{
  sub_100004660();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_10000DBF0(void *a1, uint64_t a2)
{
  uint64_t v18 = a2;
  v17[0] = a1;
  uint64_t v2 = sub_100012758();
  uint64_t v19 = *(void *)(v2 - 8);
  uint64_t v20 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100012788();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201D0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1000061E8(v5, (uint64_t)qword_100020EF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  sub_100012748();
  uint64_t v10 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v10 = 0;
  uint64_t v11 = sub_100012778();
  os_signpost_type_t v12 = sub_1000129F8();
  os_signpost_id_t v13 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, v12, v13, "CollectionsPosterEditDelegate.Initialize", "", v10, 2u);
  sub_10000DE80((uint64_t)v17[1], v17[0], v18);
  os_signpost_type_t v14 = sub_1000129E8();
  os_signpost_id_t v15 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, v14, v15, "CollectionsPosterEditDelegate.Initialize", "", v10, 2u);

  swift_slowDealloc();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_10000DE80(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100003220(&qword_100020678);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v29 - v10;
  os_signpost_type_t v12 = *(void **)(a1 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editor);
  *(void *)(a1 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editor) = a2;

  os_signpost_id_t v13 = (objc_class *)type metadata accessor for CollectionsPosterEditingEnvironment();
  os_signpost_type_t v14 = (char *)objc_allocWithZone(v13);
  *(void *)&v14[OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEditingEnvironment_posterKitEditingEnvironment] = a3;
  v30.receiver = v14;
  v30.super_class = v13;
  id v15 = a2;
  swift_unknownObjectRetain();
  id v16 = objc_msgSendSuper2(&v30, "init");
  uint64_t v17 = OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editingEnvironment;
  uint64_t v18 = *(void **)(a1 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editingEnvironment);
  *(void *)(a1 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editingEnvironment) = v16;

  uint64_t v19 = *(void **)(a1 + v17);
  if (!v19)
  {
    __break(1u);
    goto LABEL_7;
  }
  sub_10001128C();
  id v20 = v19;
  sub_10000668C(0, v11);
  uint64_t v21 = sub_100012528();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v11, 0, 1, v21);
  uint64_t v23 = a1 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_environmentSnapshot;
  swift_beginAccess();
  sub_100006278((uint64_t)v11, v23);
  swift_endAccess();
  sub_100012618();
  swift_allocObject();
  id v24 = v15;
  uint64_t v25 = sub_1000125D8();
  uint64_t v26 = OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_wallpaperPosterEditorController;
  *(void *)(a1 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_wallpaperPosterEditorController) = v25;
  swift_release();
  if (!*(void *)(a1 + v26))
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  unint64_t v27 = *(void **)(a1 + v17);
  if (!v27)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_1000062E0(v23, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v9, 1, v21) != 1)
  {
    swift_retain();
    id v28 = v27;
    sub_1000125E8();
    swift_release();

    (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v21);
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_10000E1B8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = a2;
  uint64_t v21 = a1;
  uint64_t v22 = a3;
  uint64_t v3 = sub_100012758();
  uint64_t v23 = *(void *)(v3 - 8);
  uint64_t v24 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100012788();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201D0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1000061E8(v6, (uint64_t)qword_100020EF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  sub_100012748();
  uint64_t v11 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v11 = 0;
  os_signpost_type_t v12 = sub_100012778();
  os_signpost_type_t v13 = sub_1000129F8();
  os_signpost_id_t v14 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, v13, v14, "CollectionsPosterEditDelegate.Update", "", v11, 2u);
  sub_10000E448(v20, v19, v22, v21);
  os_signpost_type_t v15 = sub_1000129E8();
  os_signpost_id_t v16 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, v15, v16, "CollectionsPosterEditDelegate.Update", "", v11, 2u);

  swift_slowDealloc();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_10000E448(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v26 = a4;
  uint64_t v7 = sub_100003220(&qword_100020678);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  os_signpost_type_t v12 = (char *)&v26 - v11;
  os_signpost_type_t v13 = (objc_class *)type metadata accessor for CollectionsPosterEditingEnvironment();
  os_signpost_id_t v14 = (char *)objc_allocWithZone(v13);
  *(void *)&v14[OBJC_IVAR____TtC17CollectionsPoster35CollectionsPosterEditingEnvironment_posterKitEditingEnvironment] = a2;
  v27.receiver = v14;
  v27.super_class = v13;
  swift_unknownObjectRetain();
  id v15 = objc_msgSendSuper2(&v27, "init", v26);
  uint64_t v16 = OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editingEnvironment;
  uint64_t v17 = *(void **)(a1 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editingEnvironment);
  *(void *)(a1 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editingEnvironment) = v15;

  uint64_t v18 = *(void **)(a1 + v16);
  if (!v18)
  {
    __break(1u);
    goto LABEL_7;
  }
  sub_10001128C();
  id v19 = v18;
  sub_10000668C([a3 animationSettings], v12);
  uint64_t v20 = sub_100012528();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v12, 0, 1, v20);
  uint64_t v22 = a1 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_environmentSnapshot;
  swift_beginAccess();
  sub_100006278((uint64_t)v12, v22);
  swift_endAccess();
  if (!*(void *)(a1
                  + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_wallpaperPosterEditorController))
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v23 = *(void **)(a1 + v16);
  if (!v23)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_1000062E0(v22, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v10, 1, v20) != 1)
  {
    swift_retain();
    id v24 = v23;
    id v25 = [a3 animationSettings];
    sub_100012608();

    swift_release();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v20);
    return;
  }
LABEL_9:
  __break(1u);
}

void sub_10000E798(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v36 = a1;
  uint64_t v3 = sub_100012758();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100012788();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201D0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000061E8(v7, (uint64_t)qword_100020EF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  sub_100012748();
  os_signpost_type_t v12 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)os_signpost_type_t v12 = 0;
  uint64_t v35 = v10;
  os_signpost_type_t v13 = sub_100012778();
  os_signpost_type_t v14 = sub_1000129F8();
  os_signpost_id_t v15 = sub_100012738();
  os_log_t v33 = v13;
  unint64_t v34 = v12;
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, v14, v15, "CollectionsPosterEditDelegate.Looks", "", v12, 2u);
  if (!*(void *)(v2
                  + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_wallpaperPosterEditorController))
    goto LABEL_17;
  swift_retain();
  unint64_t v16 = sub_1000125C8();
  swift_release();
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_100012B18();
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_6;
    }
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    os_signpost_type_t v25 = sub_1000129E8();
    os_signpost_id_t v26 = sub_100012738();
    os_log_t v27 = v33;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, v25, v26, "CollectionsPosterEditDelegate.Looks", "", v34, 2u);

    swift_slowDealloc();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v35, v7);
    return;
  }
  uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v17) {
    goto LABEL_14;
  }
LABEL_6:
  unint64_t v37 = &_swiftEmptyArrayStorage;
  sub_100012AD8();
  if ((v17 & 0x8000000000000000) == 0)
  {
    uint64_t v29 = v8;
    uint64_t v30 = v7;
    uint64_t v31 = v6;
    uint64_t v32 = v4;
    uint64_t v36 = v3;
    uint64_t v18 = 0;
    do
    {
      if ((v16 & 0xC000000000000001) != 0)
      {
        id v19 = (void *)sub_100012A98();
      }
      else
      {
        id v19 = *(void **)(v16 + 8 * v18 + 32);
        swift_unknownObjectRetain();
      }
      ++v18;
      id v20 = [v19 identifier];
      sub_1000128B8();

      id v21 = [v19 displayName];
      sub_1000128B8();

      id v22 = objc_allocWithZone((Class)PREditingLook);
      NSString v23 = sub_1000128A8();
      swift_bridgeObjectRelease();
      NSString v24 = sub_1000128A8();
      swift_bridgeObjectRelease();
      [v22 initWithIdentifier:v23 displayName:v24];
      swift_unknownObjectRelease();

      sub_100012AB8();
      sub_100012AE8();
      sub_100012AF8();
      sub_100012AC8();
    }
    while (v17 != v18);
    swift_bridgeObjectRelease();
    uint64_t v3 = v36;
    uint64_t v6 = v31;
    uint64_t v4 = v32;
    uint64_t v8 = v29;
    uint64_t v7 = v30;
    goto LABEL_15;
  }
  __break(1u);
LABEL_17:
  __break(1u);
}

void sub_10000ECB0()
{
  uint64_t v1 = sub_100012758();
  uint64_t v15 = *(void *)(v1 - 8);
  uint64_t v16 = v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100012788();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201D0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1000061E8(v4, (uint64_t)qword_100020EF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  sub_100012748();
  uint64_t v9 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v9 = 0;
  uint64_t v10 = sub_100012778();
  os_signpost_type_t v11 = sub_1000129F8();
  os_signpost_id_t v12 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, v11, v12, "CollectionsPosterEditDelegate.InitialLook", "", v9, 2u);
  if (*(void *)(v0
                 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_wallpaperPosterEditorController))
  {
    swift_retain();
    sub_1000125B8();
    swift_release();
    os_signpost_type_t v13 = sub_1000129E8();
    os_signpost_id_t v14 = sub_100012738();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, v13, v14, "CollectionsPosterEditDelegate.InitialLook", "", v9, 2u);

    swift_slowDealloc();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v3, v16);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    __break(1u);
  }
}

void sub_10000EFEC(uint64_t a1)
{
}

void sub_10000F02C(uint64_t a1)
{
}

Class sub_10000F06C(void *a1, uint64_t a2, void *a3, const char *a4, void (*a5)(uint64_t))
{
  id v8 = a3;
  id v9 = a1;
  sub_10000F138((uint64_t)v8, a4, a5);
  uint64_t v11 = v10;

  if (v11)
  {
    sub_10000CF20(0, &qword_1000208E8);
    v12.super.Class isa = sub_100012908().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v12.super.Class isa = 0;
  }
  return v12.super.isa;
}

void sub_10000F118(uint64_t a1)
{
}

void sub_10000F138(uint64_t a1, const char *a2, void (*a3)(uint64_t))
{
  uint64_t v18 = a1;
  id v19 = a3;
  id v21 = a2;
  uint64_t v20 = sub_100012758();
  uint64_t v4 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100012788();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201D0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000061E8(v7, (uint64_t)qword_100020EF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  sub_100012748();
  NSArray v12 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)NSArray v12 = 0;
  os_signpost_type_t v13 = sub_100012778();
  os_signpost_type_t v14 = sub_1000129F8();
  os_signpost_id_t v15 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, v14, v15, v21, "", v12, 2u);
  if (*(void *)(v3
                 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_wallpaperPosterEditorController))
  {
    swift_retain();
    v19(v18);
    swift_release();
    os_signpost_type_t v16 = sub_1000129E8();
    os_signpost_id_t v17 = sub_100012738();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, v16, v17, v21, "", v12, 2u);

    swift_slowDealloc();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v20);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    __break(1u);
  }
}

void sub_10000F460(uint64_t a1, uint64_t a2)
{
}

void sub_10000F50C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a1;
  uint64_t v21 = a3;
  uint64_t v22 = sub_100012758();
  uint64_t v4 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100012788();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201D0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000061E8(v7, (uint64_t)qword_100020EF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  sub_100012748();
  NSArray v12 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)NSArray v12 = 0;
  os_signpost_type_t v13 = sub_100012778();
  os_signpost_type_t v14 = sub_1000129F8();
  os_signpost_id_t v15 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, v14, v15, "CollectionsPosterEditDelegate.PopulateViews", "", v12, 2u);
  if (*(void *)(v23
                 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_wallpaperPosterEditorController))
  {
    os_signpost_type_t v16 = (objc_class *)type metadata accessor for CollectionsPosterEditorLookViewProviding();
    os_signpost_id_t v17 = (char *)objc_allocWithZone(v16);
    *(void *)&v17[OBJC_IVAR____TtC17CollectionsPoster40CollectionsPosterEditorLookViewProviding_posterKitViewProviding] = a2;
    v24.receiver = v17;
    v24.super_class = v16;
    swift_retain();
    swift_unknownObjectRetain();
    id v18 = objc_msgSendSuper2(&v24, "init", v20, v21);
    sub_1000125F8();
    swift_release();

    LOBYTE(v18) = sub_1000129E8();
    os_signpost_id_t v19 = sub_100012738();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, (os_signpost_type_t)v18, v19, "CollectionsPosterEditDelegate.PopulateViews", "", v12, 2u);

    swift_slowDealloc();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v22);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    __break(1u);
  }
}

void sub_10000F8A4(uint64_t a1, uint64_t a2)
{
}

void sub_10000F8C4(uint64_t a1, uint64_t a2, const char *a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v21 = a2;
  uint64_t v22 = a4;
  uint64_t v20 = a1;
  uint64_t v23 = sub_100012758();
  uint64_t v5 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100012788();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201D0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1000061E8(v8, (uint64_t)qword_100020EF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  sub_100012748();
  os_signpost_type_t v13 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)os_signpost_type_t v13 = 0;
  os_signpost_type_t v14 = sub_100012778();
  os_signpost_type_t v15 = sub_1000129F8();
  os_signpost_id_t v16 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, v15, v16, a3, "", v13, 2u);
  if (*(void *)(v24
                 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_wallpaperPosterEditorController))
  {
    swift_retain();
    v22(v20, v21);
    swift_release();
    os_signpost_type_t v17 = sub_1000129E8();
    os_signpost_id_t v18 = sub_100012738();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, v17, v18, a3, "", v13, 2u);

    swift_slowDealloc();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v23);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000FC1C(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_100012798();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  uint64_t v4 = sub_100012758();
  v2[7] = v4;
  v2[8] = *(void *)(v4 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  return _swift_task_switch(sub_10000FD54, 0, 0);
}

uint64_t sub_10000FD54()
{
  if (qword_1000201D0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100012788();
  v0[12] = sub_1000061E8(v1, (uint64_t)qword_100020EF8);
  sub_100012748();
  uint64_t v2 = sub_100012778();
  os_signpost_type_t v3 = sub_1000129F8();
  if (sub_100012A08())
  {
    uint64_t v4 = v0[10];
    uint64_t v5 = v0[7];
    uint64_t v6 = v0[8];
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    unint64_t v8 = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v7(v4, v0[11], v5);
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    os_signpost_id_t v10 = sub_100012738();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, v3, v10, "CollectionsPosterEditDelegate.Finalize", "", v9, 2u);
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    uint64_t v11 = v0[8];

    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    unint64_t v8 = (v11 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v13 = v0[10];
  uint64_t v12 = v0[11];
  uint64_t v14 = v0[7];
  uint64_t v15 = v0[8];
  uint64_t v16 = v0[3];
  v0[13] = v7;
  v0[14] = v8;
  v7(v13, v12, v14);
  sub_1000127C8();
  swift_allocObject();
  v0[15] = sub_1000127B8();
  os_signpost_type_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
  v0[16] = v17;
  v0[17] = (v15 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v18 = v17(v12, v14);
  uint64_t v21 = *(void *)(v16
                  + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_wallpaperPosterEditorController);
  v0[18] = v21;
  if (!v21)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v22 = *(void **)(v0[3] + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editingEnvironment);
  v0[19] = v22;
  if (!v22)
  {
LABEL_12:
    __break(1u);
    return WKWallpaperPosterEditorController.editorFinalize(_:with:)(v18, v19, v20);
  }
  unint64_t v23 = sub_10001128C();
  swift_retain();
  id v24 = v22;
  os_signpost_type_t v25 = (void *)swift_task_alloc();
  v0[20] = v25;
  *os_signpost_type_t v25 = v0;
  v25[1] = sub_10000FFF8;
  uint64_t v18 = v0[2];
  id v19 = v24;
  unint64_t v20 = v23;
  return WKWallpaperPosterEditorController.editorFinalize(_:with:)(v18, v19, v20);
}

uint64_t sub_10000FFF8()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 152);
  swift_task_dealloc();

  swift_release();
  return _swift_task_switch(sub_100010128, 0, 0);
}

uint64_t sub_100010128()
{
  uint64_t v1 = sub_100012778();
  sub_1000127A8();
  os_signpost_type_t v2 = sub_1000129E8();
  if (sub_100012A08())
  {
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v3 = *(void *)(v0 + 48);
    uint64_t v5 = *(void *)(v0 + 32);
    swift_retain();
    sub_1000127D8();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v4 + 88))(v3, v5) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v6 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 40) + 8))(*(void *)(v0 + 48), *(void *)(v0 + 32));
      uint64_t v6 = "";
    }
    os_signpost_id_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    uint64_t v12 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 80);
    uint64_t v13 = *(void *)(v0 + 56);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 104))(v11, v12, v13);
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    os_signpost_id_t v15 = sub_100012738();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v1, v2, v15, "CollectionsPosterEditDelegate.Finalize", v6, v14, 2u);
    swift_slowDealloc();

    v10(v12, v13);
    swift_release();
    v10(v11, v13);
  }
  else
  {
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    uint64_t v8 = *(void *)(v0 + 72);
    uint64_t v9 = *(void *)(v0 + 56);

    v7(v8, v9);
    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_1000104C0(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  void *v7 = v3;
  v7[1] = sub_100010584;
  return sub_10000FC1C((uint64_t)v6);
}

uint64_t sub_100010584()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 32);
  os_signpost_type_t v2 = *(void **)(*v0 + 24);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_1000106DC()
{
  uint64_t v0 = sub_100012758();
  uint64_t v16 = *(void *)(v0 - 8);
  uint64_t v17 = v0;
  __chkstk_darwin(v0);
  os_signpost_type_t v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100012788();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000201D0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1000061E8(v3, (uint64_t)qword_100020EF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  sub_100012748();
  uint64_t v8 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v8 = 0;
  uint64_t v9 = sub_100012778();
  os_signpost_type_t v10 = sub_1000129F8();
  os_signpost_id_t v11 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, v10, v11, "CollectionsPosterEditDelegate.Invalidate", "", v8, 2u);
  sub_10001096C(v15);
  os_signpost_type_t v12 = sub_1000129E8();
  os_signpost_id_t v13 = sub_100012738();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, v12, v13, "CollectionsPosterEditDelegate.Invalidate", "", v8, 2u);

  swift_slowDealloc();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v2, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10001096C(uint64_t a1)
{
  uint64_t v2 = sub_100003220(&qword_100020678);
  uint64_t result = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_wallpaperPosterEditorController;
  if (*(void *)(a1
                 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_wallpaperPosterEditorController))
  {
    swift_retain();
    sub_1000125A8();
    swift_release();
    *(void *)(a1 + v6) = 0;
    swift_release();
    uint64_t v7 = *(void **)(a1 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editingEnvironment);
    *(void *)(a1 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editingEnvironment) = 0;

    uint64_t v8 = sub_100012528();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
    uint64_t v9 = a1 + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_environmentSnapshot;
    swift_beginAccess();
    sub_100006278((uint64_t)v5, v9);
    return swift_endAccess();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100010B24(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100010B34(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100010B70@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result) {
    *a2 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_100010B80()
{
  _Block_release(*(const void **)(v0 + 24));
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100010BC8()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000CDE4;
  uint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_100020898 + dword_100020898);
  return v6(v2, v3, v4);
}

uint64_t sub_100010C7C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000CFC0;
  return v6();
}

uint64_t sub_100010D4C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000CFC0;
  return v7();
}

uint64_t sub_100010E1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100012968();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100012958();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000CAC0(a1, &qword_100020720);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100012948();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100010FC8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000110A4;
  return v6(a1);
}

uint64_t sub_1000110A4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001119C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000111D4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000CDE4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000208C8 + dword_1000208C8);
  return v6(a1, v4);
}

unint64_t sub_10001128C()
{
  unint64_t result = qword_1000208E0;
  if (!qword_1000208E0)
  {
    type metadata accessor for CollectionsPosterEditingEnvironment();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000208E0);
  }
  return result;
}

uint64_t sub_1000112E4(void (*a1)(void))
{
  a1();
  return sub_100012BB8();
}

uint64_t sub_100011320(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100011348(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1000113C0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100012A28();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1000113C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100011494(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000CC2C((uint64_t)v12, *a3);
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
      sub_10000CC2C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000CBDC((uint64_t)v12);
  return v7;
}

uint64_t sub_100011494(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100012A38();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100011650(a5, a6);
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
  uint64_t v8 = sub_100012AA8();
  if (!v8)
  {
    sub_100012B08();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100012B58();
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

uint64_t sub_100011650(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000116E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000118C8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000118C8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000116E8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100011860(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100012A88();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100012B08();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000128D8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100012B58();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100012B08();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100011860(uint64_t a1, uint64_t a2)
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
  sub_100003220(&qword_1000208F8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000118C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003220(&qword_1000208F8);
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
  os_signpost_id_t v13 = a4 + 32;
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
  uint64_t result = sub_100012B58();
  __break(1u);
  return result;
}

unsigned char **sub_100011A18(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_100011A2C()
{
  uint64_t v1 = sub_100012398();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  unint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  [v0 backlightProgress];
  if ((v5 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    [v0 backlightProgress];
    if (v6 == 1.0) {
      int64_t v7 = (unsigned int *)&enum case for WKPosterWakeState.ScreenState.on(_:);
    }
    else {
      int64_t v7 = (unsigned int *)&enum case for WKPosterWakeState.ScreenState.transitioning(_:);
    }
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *v7, v1);
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for WKPosterWakeState.ScreenState.off(_:), v1);
  }
  [v0 backlightProgress];
  return sub_1000123A8();
}

uint64_t sub_100011B68()
{
  uint64_t v1 = sub_100012438();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  unint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  [v0 unlockProgress];
  if ((v5 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    [v0 unlockProgress];
    if (v6 == 1.0) {
      int64_t v7 = (unsigned int *)&enum case for WKPosterUnlockState.ScreenState.unlocked(_:);
    }
    else {
      int64_t v7 = (unsigned int *)&enum case for WKPosterUnlockState.ScreenState.transitioning(_:);
    }
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *v7, v1);
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for WKPosterUnlockState.ScreenState.locked(_:), v1);
  }
  [v0 unlockProgress];
  return sub_100012448();
}

id PRRenderer.wk_extendRenderSession(forReason:)()
{
  NSString v1 = sub_1000128A8();
  id v2 = [v0 extendRenderingSessionForReason:v1];

  uint64_t v3 = (objc_class *)type metadata accessor for CollectionsPosterInvalidatable();
  unint64_t v4 = (char *)objc_allocWithZone(v3);
  *(void *)&v4[OBJC_IVAR____TtC17CollectionsPoster30CollectionsPosterInvalidatable_posterKitInvalidatable] = v2;
  v6.receiver = v4;
  v6.super_class = v3;
  return objc_msgSendSuper2(&v6, "init");
}

Swift::Void __swiftcall PRRenderer.wk_noteContentSignificantlyChanged()()
{
  [v0 noteContentSignificantlyChanged];
}

Swift::Void __swiftcall PRRenderer.wk_setPreferredProminentColor(_:)(UIColor_optional a1)
{
  Class isa = a1.value.super.isa;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = isa;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_100011FA0;
  *(void *)(v4 + 24) = v3;
  v8[4] = sub_100011FC0;
  v8[5] = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100011FE8;
  v8[3] = &unk_100018D28;
  uint64_t v5 = _Block_copy(v8);
  objc_super v6 = isa;
  swift_retain();
  swift_release();
  [v1 updatePreferences:v5];
  _Block_release(v5);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
}

uint64_t sub_100011F68()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100011FA0(void *a1)
{
  return [a1 setPreferredProminentColor:*(void *)(v1 + 16)];
}

uint64_t sub_100011FB0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100011FC0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100011FE8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, id))(a1 + 32);
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, v6);

  return swift_unknownObjectRelease();
}

uint64_t sub_100012050(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100012060()
{
  return swift_release();
}

id PREditor.wk_currentLook.getter()
{
  id v1 = [v0 currentLook];
  return v1;
}

id PREditor.wk_requestDismissal(with:)(uint64_t a1)
{
  return [v1 requestDismissalWithAction:a1 == 1];
}

uint64_t sub_100012290()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000122B4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000122E8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000122F8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100012308()
{
  return URL.lastPathComponent.getter();
}

uint64_t sub_100012318()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_100012328()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t sub_100012338()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100012348()
{
  return type metadata accessor for URL();
}

uint64_t sub_100012358()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100012368()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100012378()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_100012388()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100012398()
{
  return type metadata accessor for WKPosterWakeState.ScreenState();
}

uint64_t sub_1000123A8()
{
  return WKPosterWakeState.init(screenState:progress:)();
}

uint64_t sub_1000123B8()
{
  return static WKPosterWakeState.screenOn.getter();
}

uint64_t sub_1000123C8()
{
  return type metadata accessor for WKPosterWakeState();
}

uint64_t sub_1000123D8()
{
  return WKWallpaperBundle.identifierString.getter();
}

uint64_t sub_1000123E8()
{
  return WKWallpaperBundle.init(url:)();
}

uint64_t sub_1000123F8()
{
  return type metadata accessor for WKWallpaperBundle();
}

uint64_t sub_100012408()
{
  return dispatch thunk of WKPosterEnvironment.deviceOrientation.getter();
}

uint64_t sub_100012418()
{
  return dispatch thunk of WKPosterEnvironment.floatingObscurableBounds.getter();
}

uint64_t sub_100012428()
{
  return dispatch thunk of WKPosterEnvironment.context.getter();
}

uint64_t sub_100012438()
{
  return type metadata accessor for WKPosterUnlockState.ScreenState();
}

uint64_t sub_100012448()
{
  return WKPosterUnlockState.init(screenState:progress:)();
}

uint64_t sub_100012458()
{
  return static WKPosterUnlockState.deviceLocked.getter();
}

uint64_t sub_100012468()
{
  return type metadata accessor for WKPosterUnlockState();
}

uint64_t sub_100012478()
{
  return dispatch thunk of WKWallpaperRepresenting.copyWallpaperRepresenting(to:)();
}

uint64_t sub_100012488()
{
  return dispatch thunk of WKWallpaperRepresenting.isOffloaded.getter();
}

uint64_t sub_100012498()
{
  return dispatch thunk of WKWallpaperRepresenting.contentVersion.getter();
}

uint64_t sub_1000124A8()
{
  return dispatch thunk of WKWallpaperRepresenting.supportsCopying.getter();
}

uint64_t sub_1000124B8()
{
  return dispatch thunk of WKWallpaperRepresenting.identifierString.getter();
}

uint64_t sub_1000124C8()
{
  return dispatch thunk of WKWallpaperRepresenting.preferredTitleColors.getter();
}

uint64_t sub_1000124D8()
{
  return dispatch thunk of WKWallpaperRepresenting.disableModifyingLegibilityBlur.getter();
}

uint64_t sub_1000124E8()
{
  return dispatch thunk of WKPosterEnvironmentContext.isSnapshot.getter();
}

uint64_t sub_1000124F8()
{
  return dispatch thunk of WKPosterEnvironmentContext.isPreview.getter();
}

uint64_t sub_100012508()
{
  return type metadata accessor for WKPosterEnvironmentSnapshot.PosterEnvironmentMode();
}

uint64_t sub_100012518()
{
  return WKPosterEnvironmentSnapshot.init(environmentMode:wakeState:unlockState:environmentRequiresImmediateRendering:animationDuration:timingFunction:animation:interfaceOrientation:floatingObscurableBounds:)();
}

uint64_t sub_100012528()
{
  return type metadata accessor for WKPosterEnvironmentSnapshot();
}

uint64_t sub_100012538()
{
  return dispatch thunk of WKPosterRenderingEnvironment.unlockState.getter();
}

uint64_t sub_100012548()
{
  return dispatch thunk of WKPosterRenderingEnvironment.wakeState.getter();
}

uint64_t sub_100012558()
{
  return static WKWallpaperPosterUserInfoKeys.wallpaperRepresentingFileName.getter();
}

uint64_t sub_100012568()
{
  return static WKWallpaperPosterUserInfoKeys.wallpaperRepresentingIdentifier.getter();
}

uint64_t sub_100012578()
{
  return dispatch thunk of static WKWallpaperBundleDownloadManager.default.getter();
}

uint64_t sub_100012588()
{
  return type metadata accessor for WKWallpaperBundleDownloadManager();
}

uint64_t sub_1000125A8()
{
  return WKWallpaperPosterEditorController.editorDidInvalidate(_:)();
}

uint64_t sub_1000125B8()
{
  return WKWallpaperPosterEditorController.initialLookIdentifier(for:)();
}

uint64_t sub_1000125C8()
{
  return WKWallpaperPosterEditorController.looks(for:)();
}

uint64_t sub_1000125D8()
{
  return WKWallpaperPosterEditorController.init(editor:)();
}

uint64_t sub_1000125E8()
{
  return WKWallpaperPosterEditorController.editor(_:didInitialize:with:)();
}

uint64_t sub_1000125F8()
{
  return WKWallpaperPosterEditorController.editor(_:populateViews:for:)();
}

uint64_t sub_100012608()
{
  return WKWallpaperPosterEditorController.editor(_:didUpdate:with:using:)();
}

uint64_t sub_100012618()
{
  return type metadata accessor for WKWallpaperPosterEditorController();
}

uint64_t sub_100012628()
{
  return WKWallpaperPosterRenderController.rendererDidInvalidate(_:)();
}

uint64_t sub_100012638()
{
  return WKWallpaperPosterRenderController.init(renderer:)();
}

uint64_t sub_100012648()
{
  return WKWallpaperPosterRenderController.renderer(_:didInitialize:with:)();
}

uint64_t sub_100012658()
{
  return WKWallpaperPosterRenderController.renderer(_:didUpdate:with:using:)();
}

uint64_t sub_100012668()
{
  return type metadata accessor for WKWallpaperPosterRenderController();
}

uint64_t sub_100012678()
{
  return WKWallpaperRepresentingCollection.previewWallpaperRepresenting.getter();
}

uint64_t sub_100012688()
{
  return WKWallpaperRepresentingCollection.identifier.getter();
}

uint64_t sub_100012698()
{
  return WKWallpaperRepresentingCollection.displayName.getter();
}

uint64_t sub_1000126A8()
{
  return WKWallpaperRepresentingCollection.hiddenFromPicker.getter();
}

BOOL sub_1000126B8(Swift::String a1)
{
  return WKWallpaperRepresentingCollection.contains(_:)(a1);
}

uint64_t sub_1000126C8()
{
  return type metadata accessor for WKWallpaperRepresentingCollection();
}

uint64_t sub_1000126D8()
{
  return WKWallpaperRepresentingCollection.subscript.getter();
}

uint64_t sub_1000126E8()
{
  return WKWallpaperRepresentingCollectionsManager.init(downloadManager:)();
}

uint64_t sub_1000126F8()
{
  return type metadata accessor for WKWallpaperRepresentingCollectionsManager();
}

uint64_t sub_100012708()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100012718()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_100012728()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100012738()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_100012748()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_100012758()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_100012768()
{
  return OSSignposter.init(logger:)();
}

uint64_t sub_100012778()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_100012788()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_100012798()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_1000127A8()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_1000127B8()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_1000127C8()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_1000127D8()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_1000127E8()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000127F8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100012808()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100012818()
{
  return static Animation.timingCurve(_:_:_:_:duration:)();
}

uint64_t sub_100012828()
{
  return Animation.delay(_:)();
}

uint64_t sub_100012838()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_100012848()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100012858()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_100012868()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100012878()
{
  return PRRenderingConfiguration.init(_:)();
}

NSDictionary sub_100012888()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100012898()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_1000128A8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000128B8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000128C8()
{
  return String.hash(into:)();
}

Swift::Int sub_1000128D8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000128E8()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_1000128F8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100012908()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100012918()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100012928()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100012938()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100012948()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100012958()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100012968()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100012978()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_100012988()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_100012998()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_1000129A8()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_1000129B8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000129C8()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000129D8()
{
  return WKWallpaperBundle._valueType.getter();
}

uint64_t sub_1000129E8()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_1000129F8()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_100012A08()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_100012A18()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100012A28()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100012A38()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100012A48()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_100012A58(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100012A68()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100012A78()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100012A88()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100012A98()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100012AA8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100012AB8()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100012AC8()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100012AD8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100012AE8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100012AF8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100012B08()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100012B18()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100012B28()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100012B38()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100012B48()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100012B58()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100012B68()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100012B78()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100012B88()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100012B98()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100012BA8()
{
  return Hasher._finalize()();
}

uint64_t sub_100012BB8()
{
  return _typeName(_:qualified:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t WKStringForInterfaceOrientation()
{
  return _WKStringForInterfaceOrientation();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void bzero(void *a1, size_t a2)
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
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