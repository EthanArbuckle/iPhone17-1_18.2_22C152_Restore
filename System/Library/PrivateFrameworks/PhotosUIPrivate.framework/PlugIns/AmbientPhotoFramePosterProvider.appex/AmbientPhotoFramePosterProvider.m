uint64_t sub_1000041DC()
{
  uint64_t result;
  uint64_t v1;

  result = sub_100011760();
  qword_100020220 = result;
  *(void *)algn_100020228 = v1;
  return result;
}

uint64_t sub_10000420C()
{
  return swift_release();
}

uint64_t sub_1000042E0@<X0>(uint64_t *a1@<X8>)
{
  sub_100011720();
  swift_allocObject();
  sub_100011730();
  sub_1000116F0();
  swift_allocObject();
  sub_100011700();
  uint64_t v2 = sub_10000440C();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v2;
  return result;
}

id sub_10000439C()
{
  return sub_1000043CC(type metadata accessor for PosterRenderer);
}

id sub_1000043B4()
{
  return sub_1000043CC(type metadata accessor for PosterEditor);
}

id sub_1000043CC(uint64_t (*a1)(void))
{
  id v1 = objc_allocWithZone((Class)a1(0));
  return [v1 init];
}

uint64_t sub_10000440C()
{
  sub_10000C5F0(&qword_10001FD80);
  sub_100011400();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000124E0;
  sub_100011720();
  sub_10000C634(&qword_10001FD88, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  sub_1000113F0();
  sub_1000116F0();
  sub_10000C634(&qword_10001FD90, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_1000113F0();
  return v0;
}

uint64_t sub_1000045B4(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_controller) = a1;
  return _objc_release_x1();
}

uint64_t sub_1000045C8(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_renderingEnvironment) = a1;
  return _objc_release_x1();
}

uint64_t sub_1000045DC(uint64_t a1)
{
  return sub_100007A00(a1, 0xD00000000000001FLL, 0x8000000100013CA0, &qword_10001F540);
}

void sub_100004600(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char *a6, uint64_t a7, void *a8)
{
  sub_100011890();
  if (qword_10001F538 != -1) {
    swift_once();
  }
  v12 = qword_10001F540;
  sub_1000116C0();
  os_log_type_t v13 = sub_100011860();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = a4;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v16 = sub_100011910();
    uint64_t v23 = a7;
    sub_10000FD54(v16, v17, &v25);
    sub_1000118C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    id v18 = [v14 description];
    uint64_t v19 = sub_100011760();
    unint64_t v21 = v20;

    a7 = v23;
    sub_10000FD54(v19, v21, &v25);
    sub_1000118C0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s - %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  sub_10000528C(a6, a7, a8);
  if (!v24)
  {
    sub_100011880();
    sub_1000116C0();
  }

  swift_unknownObjectRelease();
}

void sub_1000048DC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, void *a8, void *a9)
{
  sub_100011890();
  if (qword_10001F538 != -1) {
    swift_once();
  }
  v11 = qword_10001F540;
  sub_1000116C0();
  os_log_type_t v12 = sub_100011860();
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = a4;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v15 = sub_100011910();
    sub_10000FD54(v15, v16, &v27);
    sub_1000118C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    os_log_type_t type = v12;
    unint64_t v17 = v13;
    id v18 = [v13 description];
    uint64_t v19 = sub_100011760();
    unint64_t v21 = v20;

    sub_10000FD54(v19, v21, &v27);
    sub_1000118C0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, type, "%s - %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  sub_1000057AC((uint64_t)a6, a7, (uint64_t)a8, (uint64_t)a9);
  if (!v24)
  {
    sub_100011880();
    sub_1000116C0();
  }

  swift_unknownObjectRelease();
}

void sub_100004BC4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char *a6, void *a7)
{
  sub_100011890();
  if (qword_10001F538 != -1) {
    swift_once();
  }
  v10 = qword_10001F540;
  sub_1000116C0();
  os_log_type_t v11 = sub_100011860();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t type = v11;
    id v12 = a4;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v14 = sub_100011910();
    uint64_t v25 = a6;
    sub_10000FD54(v14, v15, &v26);
    sub_1000118C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    id v16 = [v12 description];
    uint64_t v17 = sub_100011760();
    unint64_t v19 = v18;

    a6 = v25;
    sub_10000FD54(v17, v19, &v26);
    sub_1000118C0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, type, "%s - %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  unint64_t v21 = *(void **)&a6[OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_controller];
  if (v21)
  {
    v22 = v20;
    sub_10000C964(&qword_10001FE00, &qword_10001FE08);
    id v23 = v21;
    sub_100011420();

    sub_1000045B4(0);
    sub_100011880();
    sub_1000116C0();
  }
  else
  {
    __break(1u);
  }
}

void sub_100004EE0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char *a6, void *a7)
{
  sub_100011890();
  if (qword_10001F538 != -1) {
    swift_once();
  }
  v10 = qword_10001F540;
  sub_1000116C0();
  os_log_type_t v11 = sub_100011860();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = a4;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v14 = sub_100011910();
    sub_10000FD54(v14, v15, &v27);
    sub_1000118C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    id v16 = [v12 description];
    uint64_t v17 = a7;
    uint64_t v18 = sub_100011760();
    os_log_type_t type = v11;
    unint64_t v20 = v19;

    uint64_t v21 = v18;
    a7 = v17;
    sub_10000FD54(v21, v20, &v27);
    sub_1000118C0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, type, "%s - %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  id v23 = *(void **)&a6[OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_controller];
  if (v23)
  {
    uint64_t v24 = v22;
    sub_10000C964(&qword_10001FE00, &qword_10001FE08);
    id v25 = v23;
    sub_100011440();

    sub_100011880();
    sub_1000116C0();
  }
  else
  {
    __break(1u);
  }
}

void sub_100005208(void *a1, uint64_t a2)
{
  swift_getObjectType();
  v5 = v2;
  swift_unknownObjectRetain();
  id v6 = a1;
  sub_100004600((uint64_t)"Renderer.Initialize", 19, 2, v6, (uint64_t)v5, v5, a2, v6);
}

void sub_10000528C(char *a1, uint64_t a2, void *a3)
{
  sub_10000C5F0(&qword_10001FDF8);
  __chkstk_darwin();
  v7 = &v40[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_1000113B0();
  __chkstk_darwin();
  v10 = &v40[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000CED4(0, &qword_10001FDD0);
  id v11 = [self systemPhotoLibraryURL];
  sub_1000113A0();

  id v12 = sub_10000D1FC((uint64_t)v10);
  sub_10000C93C((uint64_t)v7, 1, 1, v8);
  id v13 = objc_allocWithZone((Class)type metadata accessor for RenderingEnvironment(0));
  uint64_t v14 = swift_unknownObjectRetain();
  id v15 = sub_100005E0C(v14, (uint64_t)v7, 0, 1);
  sub_1000045C8((uint64_t)v15);
  sub_10000C964(&qword_10001FE00, &qword_10001FE08);
  id v16 = objc_allocWithZone((Class)sub_100011470());
  id v17 = v12;
  id v18 = a3;
  uint64_t v19 = sub_100011430();
  sub_1000045B4(v19);
  unint64_t v20 = *(void **)&a1[OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_controller];
  if (!v20)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v45 = OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_renderingEnvironment;
  uint64_t v21 = *(void **)&a1[OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_renderingEnvironment];
  if (!v21)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_10000C634(&qword_10001FE10, (void (*)(uint64_t))type metadata accessor for RenderingEnvironment);
  id v22 = v20;
  id v23 = v21;
  sub_100011450();

  int v24 = sub_100011860();
  if (qword_10001F538 != -1) {
    swift_once();
  }
  id v25 = qword_10001F540;
  if (!os_log_type_enabled((os_log_t)qword_10001F540, (os_log_type_t)v24))
  {

    return;
  }
  int v41 = v24;
  id v42 = v17;
  uint64_t v43 = v3;
  id v26 = v18;
  uint64_t v27 = a1;
  id v28 = v26;
  v44 = v27;
  uint64_t v29 = swift_slowAlloc();
  uint64_t v47 = swift_slowAlloc();
  *(_DWORD *)uint64_t v29 = 136315394;
  id v30 = [v28 description];
  uint64_t v31 = sub_100011760();
  unint64_t v33 = v32;

  uint64_t v46 = sub_10000FD54(v31, v33, &v47);
  sub_1000118C0();

  swift_bridgeObjectRelease();
  *(_WORD *)(v29 + 12) = 2080;
  v34 = *(void **)&a1[v45];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = sub_1000064C4();
    unint64_t v38 = v37;

    uint64_t v46 = sub_10000FD54(v36, v38, &v47);
    sub_1000118C0();
    v39 = v44;

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v25, (os_log_type_t)v41, "initialize %s %s", (uint8_t *)v29, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return;
  }
LABEL_11:

  __break(1u);
}

void sub_10000572C(void *a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v8 = v3;
  swift_unknownObjectRetain();
  id v9 = a1;
  sub_1000048DC((uint64_t)"Renderer.Update", 15, 2, v9, (uint64_t)v8, v8, a2, v9, a3);
}

void sub_1000057AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10000C5F0(&qword_10001FDF8);
  __chkstk_darwin();
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000113B0();
  sub_10000C93C((uint64_t)v7, 1, 1, v8);
  objc_allocWithZone((Class)type metadata accessor for RenderingEnvironment(0));
  uint64_t v9 = swift_unknownObjectRetain();
  id v10 = sub_100005E0C(v9, (uint64_t)v7, 0, 1);
  sub_1000045C8((uint64_t)v10);
  id v11 = *(void **)(a1
                 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_controller);
  if (!v11)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v12 = *(void **)(a1
                 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_renderingEnvironment);
  if (!v12)
  {
LABEL_7:
    __break(1u);
    return;
  }
  if (a4) {
    sub_10000C964(&qword_10001FE18, &qword_10001FE20);
  }
  sub_10000C964(&qword_10001FE00, &qword_10001FE08);
  sub_10000C634(&qword_10001FE10, (void (*)(uint64_t))type metadata accessor for RenderingEnvironment);
  id v13 = v11;
  id v14 = v12;
  sub_100011460();
}

void sub_1000059B8(void *a1)
{
  os_log_type_t v3 = sub_100011860();
  if (qword_10001F538 != -1) {
    swift_once();
  }
  v4 = qword_10001F540;
  if (!os_log_type_enabled((os_log_t)qword_10001F540, v3)) {
    goto LABEL_6;
  }
  uint64_t v21 = a1;
  id v5 = a1;
  id v22 = v1;
  id v6 = v1;
  id v7 = v5;
  uint64_t v8 = (char *)v6;
  uint64_t v9 = swift_slowAlloc();
  v23[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v9 = 136315394;
  id v10 = [v7 description];
  uint64_t v11 = sub_100011760();
  unint64_t v13 = v12;

  sub_10000FD54(v11, v13, v23);
  sub_1000118C0();

  swift_bridgeObjectRelease();
  *(_WORD *)(v9 + 12) = 2080;
  id v14 = *(void **)&v8[OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_renderingEnvironment];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = sub_1000064C4();
    unint64_t v18 = v17;

    sub_10000FD54(v16, v18, v23);
    sub_1000118C0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v3, "invalidate %s %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    a1 = v21;
    uint64_t v1 = v22;
LABEL_6:
    id v19 = a1;
    unint64_t v20 = v1;
    sub_100004BC4((uint64_t)"Renderer.Invalidate", 19, 2, v19, (uint64_t)v20, v20, v19);
    return;
  }

  __break(1u);
}

void sub_100005C88(void *a1)
{
  os_log_type_t v3 = v1;
  id v4 = a1;
  sub_100004EE0((uint64_t)"Renderer.didReceiveTapAtPoint", 29, 2, v4, (uint64_t)v3, v3, v4);
}

id sub_100005DD8()
{
  return sub_1000066A0(type metadata accessor for PosterRenderer);
}

id sub_100005E0C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(void *)&v4[OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment] = a1;
  sub_10000CE24(a2, (uint64_t)&v4[OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_debugAssetDirectory], &qword_10001FDF8);
  uint64_t v8 = &v4[OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_debugContentType];
  *(void *)uint64_t v8 = a3;
  v8[8] = a4 & 1;
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for RenderingEnvironment(0);
  id v9 = objc_msgSendSuper2(&v11, "init");
  sub_10000CE80(a2, &qword_10001FDF8);
  return v9;
}

id sub_100005EC0()
{
  id result = [*(id *)(v0 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment) context];
  if (result)
  {
    uint64_t v2 = result;
    id v3 = [result mode];

    return (id)(v3 == (id)1);
  }
  return result;
}

id sub_100005F54()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment) isSnapshot];
}

id sub_100005FB4()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment) isPreview];
}

uint64_t sub_100005FE8()
{
  return 0;
}

uint64_t sub_100006024()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment) role];
  uint64_t v2 = sub_100011760();
  uint64_t v4 = v3;
  if (v2 == sub_100011760() && v4 == v5) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100011980();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_10000610C()
{
  return PPPosterBoundingShapeFromEnvironment(*(void **)(v0
                                                       + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment));
}

uint64_t sub_10000621C@<X0>(uint64_t a1@<X8>)
{
  sub_10000C5F0(&qword_10001FDF8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CE24(v1 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_debugAssetDirectory, (uint64_t)v4, &qword_10001FDF8);
  uint64_t v5 = sub_1000113B0();
  if (sub_10000CA4C((uint64_t)v4, 1, v5) == 1)
  {
    id v6 = objc_msgSend(objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment), "contents"), "assetDirectory");
    swift_unknownObjectRelease();
    sub_1000113A0();

    sub_10000CE80((uint64_t)v4, &qword_10001FDF8);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, v4, v5);
  }
  uint64_t v7 = sub_10000D1B8();
  return sub_10000C93C(v7, v8, v9, v10);
}

uint64_t sub_100006384()
{
  return -1;
}

id sub_1000063C0()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment) significantEventsCounter];
}

uint64_t sub_10000640C()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_debugContentType + 8) != 1) {
    return *(void *)(v0 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_debugContentType);
  }
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment) contents];
  self;
  if (swift_dynamicCastObjCClass())
  {
    swift_unknownObjectRelease();
    return 1;
  }
  else
  {
    self;
    BOOL v3 = swift_dynamicCastObjCClass() != 0;
    swift_unknownObjectRelease();
    return 2 * v3;
  }
}

uint64_t sub_1000064C4()
{
  id v1 = objc_msgSend(objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment), "contents"), "descriptorIdentifier");
  swift_unknownObjectRelease();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = sub_100011760();

  return v2;
}

id sub_1000065B4()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment) floatingObscurableBounds];
}

id sub_1000065CC()
{
  id v1 = PPAmbientPosterEnvironmentFromRenderingEnvironment(*(void **)(v0
                                                                   + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment));
  return v1;
}

uint64_t sub_100006604()
{
  return PPPosterTitleAlignmentFromEnvironment(*(void **)(v0
                                                        + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider20RenderingEnvironment_posterKitEnvironment));
}

double sub_100006620()
{
  return 0.0;
}

void sub_100006648()
{
}

id sub_100006688()
{
  return sub_1000066A0(type metadata accessor for RenderingEnvironment);
}

id sub_1000066A0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, "dealloc");
}

id sub_100006740()
{
  return [*(id *)(v0+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD420InvalidatableWrapper_invalidatable) invalidate];
}

void sub_1000067A0()
{
}

id sub_1000067F4()
{
  return sub_1000066A0((uint64_t (*)(void))type metadata accessor for InvalidatableWrapper);
}

uint64_t PRRenderer.px_updatePreferences(_:)(uint64_t a1, uint64_t a2)
{
  objc_super v3 = v2;
  uint64_t v6 = sub_10000D1D8();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = sub_10000D1D8();
  *(void *)(v7 + 16) = sub_1000069F8;
  *(void *)(v7 + 24) = v6;
  v10[4] = sub_10000D140;
  v10[5] = v7;
  v10[0] = _NSConcreteStackBlock;
  sub_10000D1CC();
  v10[2] = sub_100006A04;
  v10[3] = &unk_100018BB8;
  uint64_t v8 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v3, "updatePreferences:", v8, v10[0]);
  _Block_release(v8);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v3) {
    __break(1u);
  }
  return result;
}

void sub_100006960(uint64_t a1, uint64_t a2, void (*a3)(id, uint64_t))
{
  uint64_t v6 = (objc_class *)type metadata accessor for MutablePosterRenderingPreferences();
  uint64_t v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences] = a1;
  v9.receiver = v7;
  v9.super_class = v6;
  swift_unknownObjectRetain();
  id v8 = objc_msgSendSuper2(&v9, "init");
  a3(v8, a2);
}

void sub_1000069F8(uint64_t a1, uint64_t a2)
{
  sub_100006960(a1, a2, *(void (**)(id, uint64_t))(v2 + 16));
}

uint64_t sub_100006A08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006A18()
{
  return swift_release();
}

Swift::Void __swiftcall PRRenderer.px_noteContentSignificantlyChanged()()
{
  [v0 noteContentSignificantlyChanged];
}

id PRRenderer.px_extendRenderSession(forReason:)()
{
  NSString v1 = sub_100011750();
  id v2 = [v0 extendRenderingSessionForReason:v1];

  id v3 = [v2 assertion];
  uint64_t v4 = (objc_class *)type metadata accessor for InvalidatableWrapper();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD420InvalidatableWrapper_invalidatable] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  id v6 = objc_msgSendSuper2(&v8, "init");

  return v6;
}

uint64_t type metadata accessor for InvalidatableWrapper()
{
  return self;
}

double PRRenderer.px_shuffleSleepFadeInAnimationDuration.getter()
{
  return 1.995;
}

void PRRenderer.pu_applyRedModeFilterToView(_:animated:withCoordinatedAnimationBlock:completion:)(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

uint64_t sub_100006CA8(uint64_t a1)
{
  NSString v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_100006CEC(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void PRRenderer.pu_clearRedModeFilterFromView(_:animated:withCoordinatedAnimationBlock:completion:)(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

void sub_100006D7C(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, SEL *a9)
{
  if (!a3)
  {
    id v15 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = 0;
    goto LABEL_6;
  }
  uint64_t v20 = a3;
  uint64_t v21 = a4;
  v17[0] = _NSConcreteStackBlock;
  sub_10000D1CC();
  unint64_t v18 = sub_100006CA8;
  uint64_t v19 = v14;
  id v15 = _Block_copy(v17);
  swift_retain();
  swift_release();
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v20 = a5;
  uint64_t v21 = a6;
  v17[0] = _NSConcreteStackBlock;
  sub_10000D1CC();
  unint64_t v18 = sub_100006CEC;
  uint64_t v19 = a8;
  uint64_t v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
LABEL_6:
  objc_msgSend(a1, *a9, a2 & 1, v15, v16, v17[0]);
  _Block_release(v16);
  _Block_release(v15);
}

void sub_100006ED0(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

void sub_100006EE8(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

id sub_100006F44()
{
  id v1 = [*(id *)(v0+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences) timeFont];
  return v1;
}

void sub_100006FE0(void *a1)
{
  [*(id *)(v1+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences) setTimeFont:a1];
}

id sub_100007074()
{
  id v1 = [*(id *)(v0+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences) timeColor];
  return v1;
}

void sub_100007110(void *a1)
{
  [*(id *)(v1+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences) setTimeColor:a1];
}

id sub_1000071A4()
{
  id v1 = [*(id *)(v0+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences) statusBarTintColor];
  return v1;
}

void sub_100007240(void *a1)
{
  [*(id *)(v1+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences) setStatusBarTintColor:a1];
}

id sub_1000072C4()
{
  return [*(id *)(v0+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences) significantEventTime];
}

id sub_100007330(uint64_t a1)
{
  return [*(id *)(v1+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences) setSignificantEventTime:a1];
}

unint64_t sub_100007380()
{
  unint64_t result = (unint64_t)[*(id *)(v0+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences) significantEventOptions];
  if (result > 4 || ((1 << result) & 0x16) == 0)
  {
    unint64_t result = sub_100011940();
    __break(1u);
  }
  return result;
}

id sub_100007460(unint64_t a1)
{
  if (a1 <= 4 && ((1 << a1) & 0x16) != 0)
  {
    id v3 = *(void **)(v1
                  + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences);
    return [v3 setSignificantEventOptions:a1];
  }
  else
  {
    id result = (id)sub_100011940();
    __break(1u);
  }
  return result;
}

uint64_t sub_100007530()
{
  return PPPosterPreferencesIsChromeHidden(*(void **)(v0
                                                                  + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences)) ^ 1;
}

void sub_1000075AC(char a1)
{
  PPPosterPreferencesSetHideChrome(*(void **)(v1+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences), (a1 & 1) == 0);
}

id sub_1000075FC()
{
  return [*(id *)(v0+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences) userTapEventsRequested];
}

id sub_10000767C(char a1)
{
  os_log_type_t v3 = sub_100011860();
  if (qword_10001F538 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_10001F540;
  if (os_log_type_enabled((os_log_t)qword_10001F540, v3))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109120;
    sub_1000118C0();
    _os_log_impl((void *)&_mh_execute_header, v4, v3, "userTapEventsRequested set to %{BOOL}d", v5, 8u);
    swift_slowDealloc();
  }
  return [*(id *)(v1+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences_posterKitPreferences) setUserTapEventsRequested:a1 & 1];
}

void sub_100007798()
{
}

id sub_1000077EC()
{
  return sub_1000066A0((uint64_t (*)(void))type metadata accessor for MutablePosterRenderingPreferences);
}

void PRPosterTransition.px_duration.getter()
{
  id v1 = [v0 animationSettings];
  if (v1)
  {
    uint64_t v2 = v1;
    [v1 duration];
  }
}

void PRPosterTransition.px_duration.setter(double a1)
{
  id v2 = [self settingsWithDuration:a1];
  [v1 setAnimationSettings:v2];
}

BOOL PRPosterTransition.isWakeSignificantEvent.getter()
{
  return [v0 significantEvent] == (id)3;
}

uint64_t sub_1000079B4(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor_controller) = a1;
  return _objc_release_x1();
}

uint64_t sub_1000079C8(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor_editingEnvironment) = a1;
  return _objc_release_x1();
}

uint64_t sub_1000079DC(uint64_t a1)
{
  return sub_100007A00(a1, 0xD00000000000001DLL, 0x8000000100013AC0, &qword_10001F550);
}

uint64_t sub_100007A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_10000CED4(0, &qword_100020190);
  if (qword_10001F530 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000118A0();
  *a4 = result;
  return result;
}

void sub_100007AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  sub_100011890();
  if (qword_10001F548 != -1) {
    swift_once();
  }
  sub_1000116C0();
  sub_1000085B4(a5, (uint64_t)a6, a7);
  if (!v7)
  {
    sub_100011880();
    sub_1000116C0();
  }
  swift_unknownObjectRelease();
}

void sub_100007BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9)
{
  sub_100011890();
  if (qword_10001F548 != -1) {
    swift_once();
  }
  sub_1000116C0();
  sub_100009FD8(a5, a6, a7, (uint64_t)a8, a9);
  if (!v14)
  {
    sub_100011880();
    sub_1000116C0();
  }
}

uint64_t sub_100007D38()
{
  sub_100011890();
  if (qword_10001F548 != -1) {
    swift_once();
  }
  sub_1000116C0();
  sub_10000C5F0(&qword_10001FDC0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1000124F0;
  id v2 = objc_allocWithZone((Class)PREditingLook);
  *(void *)(v1 + 32) = sub_10000C028();
  sub_1000117C0();
  sub_100011880();
  sub_1000116C0();
  return v1;
}

uint64_t sub_100007EB8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 48) = v5;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a4;
  *(unsigned char *)(v6 + 120) = a3;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 56) = sub_100011820();
  *(void *)(v6 + 64) = sub_100011810();
  uint64_t v8 = sub_1000117F0();
  *(void *)(v6 + 72) = v8;
  *(void *)(v6 + 80) = v7;
  return _swift_task_switch(sub_100007F60, v8, v7);
}

uint64_t sub_100007F60()
{
  sub_10000D1A4();
  sub_100011890();
  if (qword_10001F548 != -1) {
    swift_once();
  }
  *(void *)(v0 + 88) = OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor_signpostID;
  long long v4 = *(_OWORD *)(v0 + 32);
  sub_1000116C0();
  *(void *)(v0 + 96) = sub_100011810();
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  *(_OWORD *)(v1 + 16) = v4;
  id v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v2;
  *id v2 = v0;
  v2[1] = sub_1000080D4;
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_1000080D4()
{
  sub_10000D1A4();
  sub_10000D16C();
  uint64_t v2 = *v1;
  sub_10000D194();
  *os_log_type_t v3 = v2;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 72);
  return _swift_task_switch(sub_100008204, v5, v4);
}

uint64_t sub_100008204()
{
  swift_release();
  sub_100011880();
  sub_1000116C0();
  sub_10000D1F0();
  return v0();
}

void sub_1000082AC(uint64_t a1, void (*a2)(uint64_t (*)(), uint64_t))
{
  uint64_t v4 = sub_10000C5F0(&qword_10001FDD8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  a2(sub_10000CBEC, v9);
  swift_release();
}

uint64_t sub_10000840C()
{
  return sub_100011800();
}

uint64_t sub_100008440()
{
  if (*(void *)(v0
                 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor_controller))
  {
  }
  else
  {
    sub_1000118F0(64);
    v3._object = (void *)0x8000000100013C30;
    v3._countAndFlagsBits = 0xD00000000000003ELL;
    sub_100011780(v3);
    v4._countAndFlagsBits = sub_100011910();
    sub_100011780(v4);
    swift_bridgeObjectRelease();
    sub_100011940();
    __break(1u);
  }
  return _objc_retain_x3();
}

void sub_100008530(void *a1, void *a2)
{
  swift_getObjectType();
  id v5 = a1;
  id v6 = v2;
  swift_unknownObjectRetain();
  sub_100007AB4((uint64_t)"PosterEditor.Initialize", 23, 2, (uint64_t)v6, v5, v6, a2);
}

uint64_t sub_1000085B4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_1000113B0();
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CED4(0, &qword_10001FDD0);
  id v9 = [self systemPhotoLibraryURL];
  sub_1000113A0();

  id v10 = sub_10000D1FC((uint64_t)v8);
  uint64_t v11 = sub_10000CED4(0, &qword_10001FDB0);
  uint64_t v25 = v11;
  uint64_t v12 = sub_10000C964(&qword_10001FDB8, &qword_10001FDB0);
  uint64_t v26 = v12;
  v24[0] = a1;
  id v13 = objc_allocWithZone((Class)sub_100011570());
  id v14 = a1;
  id v15 = v10;
  uint64_t v16 = (void *)sub_100011520();
  id v17 = v16;
  sub_1000079B4((uint64_t)v16);
  uint64_t v18 = sub_1000087FC(a3);
  uint64_t result = sub_1000079C8(v18);
  uint64_t v25 = v11;
  uint64_t v26 = v12;
  v24[0] = v14;
  uint64_t v20 = *(void **)(a2
                 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor_editingEnvironment);
  if (v20)
  {
    v23[3] = type metadata accessor for EditingEnvironment(0);
    v23[4] = sub_10000C634(&qword_10001FDC8, (void (*)(uint64_t))type metadata accessor for EditingEnvironment);
    v23[0] = v20;
    id v21 = v14;
    id v22 = v20;
    sub_100011540();

    sub_10000C9A8((uint64_t)v23);
    return sub_10000C9A8((uint64_t)v24);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000087FC(void *a1)
{
  uint64_t v2 = sub_100011670();
  __chkstk_darwin(v2 - 8);
  v106 = (char *)&v99 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_100011500();
  uint64_t v110 = *(void *)(v105 - 8);
  uint64_t v4 = __chkstk_darwin(v105);
  v104 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v103 = (char *)&v99 - v6;
  uint64_t v7 = sub_100011650();
  uint64_t v108 = *(void *)(v7 - 8);
  uint64_t v109 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  v102 = (char *)&v99 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v101 = (char *)&v99 - v10;
  uint64_t v11 = sub_10000C5F0((uint64_t *)&unk_10001FDA0);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  v107 = (char *)&v99 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v111 = (uint64_t)&v99 - v14;
  uint64_t v15 = sub_10000C5F0(&qword_10001FD98);
  __chkstk_darwin(v15 - 8);
  id v17 = (char *)&v99 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100011600();
  uint64_t v113 = *(void *)(v18 - 8);
  uint64_t v19 = __chkstk_darwin(v18);
  id v21 = (char *)&v99 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v19);
  v112 = (char *)&v99 - v23;
  __chkstk_darwin(v22);
  v122 = (char *)&v99 - v24;
  uint64_t v121 = sub_1000113B0();
  uint64_t v117 = *(void *)(v121 - 8);
  uint64_t v25 = __chkstk_darwin(v121);
  uint64_t v27 = (char *)&v99 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v25);
  v116 = (char *)&v99 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  v114 = (char *)&v99 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  v34 = (char *)&v99 - v33;
  __chkstk_darwin(v32);
  uint64_t v36 = (char *)&v99 - v35;
  id v37 = [a1 targetConfiguration];
  id v38 = [v37 assetDirectory];

  v120 = v36;
  sub_1000113A0();

  id v39 = objc_msgSend(objc_msgSend(a1, "sourceContents"), "assetDirectory");
  swift_unknownObjectRelease();
  v118 = v34;
  sub_1000113A0();

  uint64_t v115 = (uint64_t)a1;
  id v40 = [a1 sourceContents];
  self;
  id v123 = v40;
  uint64_t v41 = swift_dynamicCastObjCClass();
  if (v41)
  {
    id v42 = (void *)v41;
    swift_unknownObjectRetain();
    sub_10000A650(v42, (uint64_t)v17);
    if (sub_10000CA4C((uint64_t)v17, 1, v18) != 1)
    {
      uint64_t v43 = v113;
      v44 = v122;
      (*(void (**)(char *, char *, uint64_t))(v113 + 32))(v122, v17, v18);
      uint64_t v45 = (uint64_t)v112;
      (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v112, v44, v18);
      uint64_t v46 = v115;
      swift_unknownObjectRetain();
      id v47 = [v42 assetDirectory];
      uint64_t v48 = (uint64_t)v114;
      sub_1000113A0();

      uint64_t v49 = (uint64_t)v116;
      uint64_t v50 = v117;
      v52 = v120;
      uint64_t v51 = v121;
      (*(void (**)(char *, char *, uint64_t))(v117 + 16))(v116, v120, v121);
      id v53 = objc_allocWithZone((Class)type metadata accessor for EditingEnvironment(0));
      id v54 = sub_10000B400(v46, v45, v48, v49, &OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_posterDescriptor, (uint64_t (*)(void))&type metadata accessor for AmbientPhotoFramePosterDescriptor, &OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_sourcePosterConfiguration, (uint64_t (*)(void))&type metadata accessor for AmbientPhotoFramePosterConfiguration);
      swift_unknownObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v122, v18);
      v55 = *(void (**)(char *, uint64_t))(v50 + 8);
      v55(v118, v51);
      v55(v52, v51);
      return (uint64_t)v54;
    }
    __break(1u);
  }
  else
  {
    uint64_t v56 = (uint64_t)v107;
    uint64_t v57 = v111;
    uint64_t v58 = v109;
    v100 = v21;
    uint64_t v59 = v110;
    self;
    uint64_t v60 = swift_dynamicCastObjCClass();
    if (v60)
    {
      v61 = (void *)v60;
      swift_unknownObjectRetain();
      id v62 = [v61 assetDirectory];
      v122 = v27;
      sub_1000113A0();

      sub_10000A910(v61, v57);
      uint64_t v63 = v56;
      sub_10000CE24(v57, v56, (uint64_t *)&unk_10001FDA0);
      int v64 = sub_10000CA4C(v56, 1, v58);
      uint64_t v65 = v108;
      if (v64 == 1)
      {
        id v123 = (id)v18;
        swift_unknownObjectRelease_n();
        sub_10000CE80(v57, (uint64_t *)&unk_10001FDA0);
        uint64_t v66 = v117;
        v67 = *(void (**)(char *, uint64_t))(v117 + 8);
        uint64_t v111 = v117 + 8;
        v119 = v67;
        v67(v122, v121);
        sub_10000CE80(v63, (uint64_t *)&unk_10001FDA0);
        sub_100011870();
        v68 = (void *)sub_100011410();
        sub_1000116B0();

        sub_10000CED4(0, &qword_10001FDD0);
        id v69 = [self systemPhotoLibraryURL];
        uint64_t v70 = (uint64_t)v114;
        sub_1000113A0();

        v122 = (char *)sub_10000D1FC(v70);
        uint64_t v71 = enum case for AmbientPhotoFramePosterKind.featured(_:);
        uint64_t v72 = v59;
        v73 = *(void (**)(char *, uint64_t, uint64_t))(v59 + 104);
        uint64_t v74 = v105;
        v73(v103, enum case for AmbientPhotoFramePosterKind.featured(_:), v105);
        v75 = v104;
        v73(v104, v71, v74);
        sub_100011660();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v75, v74);
        sub_100011590();
        v76 = v112;
        sub_1000115C0();
        uint64_t v77 = v113;
        uint64_t v78 = (uint64_t)v100;
        (*(void (**)(char *, char *, id))(v113 + 16))(v100, v76, v123);
        v79 = *(void (**)(uint64_t, char *, uint64_t))(v66 + 16);
        v80 = v118;
        uint64_t v81 = v121;
        v79(v70, v118, v121);
        uint64_t v82 = (uint64_t)v116;
        v83 = v120;
        uint64_t v84 = v81;
        v79((uint64_t)v116, v120, v81);
        id v85 = objc_allocWithZone((Class)type metadata accessor for EditingEnvironment(0));
        uint64_t v86 = swift_unknownObjectRetain();
        id v54 = sub_10000B400(v86, v78, v70, v82, &OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_posterDescriptor, (uint64_t (*)(void))&type metadata accessor for AmbientPhotoFramePosterDescriptor, &OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_sourcePosterConfiguration, (uint64_t (*)(void))&type metadata accessor for AmbientPhotoFramePosterConfiguration);

        (*(void (**)(char *, id))(v77 + 8))(v76, v123);
        v87 = v119;
        v119(v80, v84);
        v87(v83, v84);
      }
      else
      {
        v88 = v101;
        (*(void (**)(char *, uint64_t, uint64_t))(v108 + 32))(v101, v63, v58);
        uint64_t v89 = (uint64_t)v102;
        (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v102, v88, v58);
        uint64_t v90 = v117;
        v91 = *(void (**)(char *, char *, uint64_t))(v117 + 16);
        uint64_t v92 = (uint64_t)v114;
        uint64_t v93 = v121;
        v91(v114, v122, v121);
        uint64_t v94 = (uint64_t)v116;
        v91(v116, v120, v93);
        id v95 = objc_allocWithZone((Class)type metadata accessor for EditingEnvironment(0));
        uint64_t v96 = swift_unknownObjectRetain();
        id v54 = sub_10000B400(v96, v89, v92, v94, &OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_sourcePosterConfiguration, (uint64_t (*)(void))&type metadata accessor for AmbientPhotoFramePosterConfiguration, &OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_posterDescriptor, (uint64_t (*)(void))&type metadata accessor for AmbientPhotoFramePosterDescriptor);
        swift_unknownObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v65 + 8))(v88, v58);
        sub_10000CE80(v111, (uint64_t *)&unk_10001FDA0);
        v97 = *(void (**)(char *, uint64_t))(v90 + 8);
        v97(v122, v93);
        v97(v118, v93);
        v97(v120, v93);
      }
      return (uint64_t)v54;
    }
  }
  uint64_t result = sub_100011940();
  __break(1u);
  return result;
}

void sub_10000942C(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(id, uint64_t))
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a1;
  a5(v8, a4);

  swift_unknownObjectRelease();
}

void sub_1000094B4(void *a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v9 = v3;
  swift_unknownObjectRetain();
  id v7 = a1;
  sub_100011890();
  if (qword_10001F548 != -1) {
    swift_once();
  }
  sub_1000116C0();
  sub_100009630((uint64_t)v9, a2, (uint64_t)"PosterEditor.Update", 19, 2, v7);
  sub_100011880();
  sub_1000116C0();

  swift_unknownObjectRelease();
}

uint64_t sub_100009630(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v6 = OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor_editingEnvironment;
  id v7 = *(void **)(result
                + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor_editingEnvironment);
  if (v7)
  {
    uint64_t v10 = result;
    swift_unknownObjectRetain();
    id v11 = v7;
    sub_10000B3E8(a2);

    uint64_t v12 = (void *)sub_100008440();
    v17[3] = sub_10000CED4(0, &qword_10001FDB0);
    uint64_t result = sub_10000C964(&qword_10001FDB8, &qword_10001FDB0);
    v17[4] = result;
    v17[0] = a6;
    uint64_t v13 = *(void **)(v10 + v6);
    if (v13)
    {
      v16[3] = type metadata accessor for EditingEnvironment(0);
      v16[4] = sub_10000C634(&qword_10001FDC8, (void (*)(uint64_t))type metadata accessor for EditingEnvironment);
      v16[0] = v13;
      id v14 = a6;
      id v15 = v13;
      sub_100011560();

      sub_10000C9A8((uint64_t)v16);
      return sub_10000C9A8((uint64_t)v17);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1000097D0(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void (*a6)(id, uint64_t, void *))
{
  id v10 = a3;
  swift_unknownObjectRetain();
  id v11 = a5;
  id v12 = a1;
  a6(v10, a4, a5);

  swift_unknownObjectRelease();
}

uint64_t sub_100009874(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_100011820();
  v2[4] = sub_100011810();
  uint64_t v4 = sub_1000117F0();
  v2[5] = v4;
  v2[6] = v3;
  return _swift_task_switch(sub_10000990C, v4, v3);
}

uint64_t sub_10000990C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v1 = (void *)v0[3];
  uint64_t v3 = swift_allocObject();
  v0[7] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = "PosterEditor.Finalize";
  *(void *)(v3 + 32) = 21;
  *(unsigned char *)(v3 + 40) = 2;
  *(void *)(v3 + 48) = v2;
  id v4 = v1;
  id v5 = v2;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[8] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_100009A1C;
  return sub_100007EB8((uint64_t)"PosterEditor.Finalize", 21, 2, (uint64_t)sub_10000CA38, v3);
}

uint64_t sub_100009A1C()
{
  sub_10000D1A4();
  sub_10000D16C();
  uint64_t v2 = *v1;
  sub_10000D194();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  swift_release();
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 40);
  return _swift_task_switch(sub_100009B30, v5, v4);
}

uint64_t sub_100009B30()
{
  swift_release();
  sub_10000D1F0();
  return v0();
}

uint64_t sub_100009B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v8 = (void *)sub_100008440();
  v11[3] = sub_10000CED4(0, &qword_10001FDB0);
  v11[4] = sub_10000C964(&qword_10001FDB8, &qword_10001FDB0);
  v11[0] = a7;
  id v9 = a7;
  sub_100011550();

  return sub_10000C9A8((uint64_t)v11);
}

uint64_t sub_100009CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100011820();
  v3[5] = sub_100011810();
  uint64_t v5 = sub_1000117F0();
  return _swift_task_switch(sub_100009D7C, v5, v4);
}

uint64_t sub_100009D7C()
{
  sub_10000D1A4();
  uint64_t v1 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  id v4 = v3;
  id v5 = v1;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_100009E3C;
  uint64_t v7 = v0[2];
  return sub_100009874(v7);
}

uint64_t sub_100009E3C()
{
  sub_10000D1A4();
  sub_10000D154();
  uint64_t v2 = (void (**)(void))v1[6];
  uint64_t v3 = (void *)v1[4];
  id v4 = (void *)v1[2];
  uint64_t v5 = *v0;
  sub_10000D194();
  *uint64_t v6 = v5;
  swift_task_dealloc();

  v2[2](v2);
  _Block_release(v2);
  sub_10000D1F0();
  return v7();
}

void sub_100009F60(void *a1)
{
  swift_getObjectType();
  id v3 = v1;
  sub_100007BFC((uint64_t)"PosterEditor.Invalidate", 23, 2, (uint64_t)v3, (uint64_t)"PosterEditor.Invalidate", 23, 2, v3, a1);
}

void sub_100009FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  sub_100011850();
  if (qword_10001F548 != -1) {
    swift_once();
  }
  sub_1000116B0();
  uint64_t v6 = (void *)sub_100008440();
  v8[3] = sub_10000CED4(0, &qword_10001FDB0);
  v8[4] = sub_10000C964(&qword_10001FDB8, &qword_10001FDB0);
  v8[0] = a5;
  id v7 = a5;
  sub_100011510();
  sub_10000C9A8((uint64_t)v8);
  sub_1000079B4(0);
}

uint64_t sub_10000A190()
{
  return sub_100007D38();
}

uint64_t sub_10000A260(void *a1, void *a2, void *a3)
{
  swift_unknownObjectRetain();
  id v7 = v3;
  id v8 = a1;
  id v9 = a3;
  sub_100011890();
  if (qword_10001F548 != -1) {
    swift_once();
  }
  sub_1000116C0();
  sub_10000A3D8(a2, (uint64_t)v7, (uint64_t)"PosterEditor.PopulateViews", 26, 2, v8);
  sub_100011880();
  sub_1000116C0();

  return swift_unknownObjectRelease();
}

uint64_t sub_10000A3D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = [a1 backgroundView];
  id v9 = self;
  id v10 = [v9 blackColor];
  [v8 setBackgroundColor:v10];

  id v11 = [v8 window];
  if (v11)
  {
    id v12 = v11;
    id v13 = [v9 blackColor];
    [v12 setBackgroundColor:v13];
  }
  id v14 = (void *)sub_100008440();
  v21[3] = sub_10000CED4(0, &qword_10001FDB0);
  v21[4] = sub_10000C964(&qword_10001FDB8, &qword_10001FDB0);
  v21[0] = a6;
  id v15 = (objc_class *)type metadata accessor for EditorViews();
  uint64_t v16 = (char *)objc_allocWithZone(v15);
  *(void *)&v16[OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD411EditorViews_posterKitViewProviding] = a1;
  v20.receiver = v16;
  v20.super_class = v15;
  id v17 = a6;
  swift_unknownObjectRetain();
  id v18 = objc_msgSendSuper2(&v20, "init");
  sub_100011530();

  return sub_10000C9A8((uint64_t)v21);
}

uint64_t sub_10000A650@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000113B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [a1 assetDirectory];
  sub_1000113A0();

  sub_1000115E0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v9 = sub_100011600();
  return sub_10000C93C(a2, 0, 1, v9);
}

uint64_t sub_10000A910@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000113E0();
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011670();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v26 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011500();
  ((void (*)(void))__chkstk_darwin)();
  sub_10000C5F0((uint64_t *)&unk_10001FDA0);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v12 = (char *)&v24 - v11;
  uint64_t v13 = sub_100011600();
  uint64_t v25 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000113B0();
  uint64_t v30 = *(void *)(v16 - 8);
  uint64_t v31 = v16;
  __chkstk_darwin(v16);
  id v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = [a1 assetDirectory];
  sub_1000113A0();

  uint64_t v20 = sub_100011650();
  uint64_t v29 = a2;
  sub_10000C93C(a2, 1, 1, v20);
  if (sub_1000115B0())
  {
    sub_1000115E0();
    sub_1000115D0();
    sub_1000115A0();
    uint64_t v24 = sub_100011610();
    sub_1000113D0();
    sub_1000113C0();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v28);
    sub_100011630();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v15, v13);
    uint64_t v21 = v29;
    sub_10000CE80(v29, (uint64_t *)&unk_10001FDA0);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v31);
    sub_10000C93C((uint64_t)v12, 0, 1, v20);
    uint64_t v22 = (uint64_t)v12;
  }
  else
  {
    if ((sub_100011620() & 1) == 0) {
      return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v18, v31);
    }
    sub_100011640();
    uint64_t v21 = v29;
    sub_10000CE80(v29, (uint64_t *)&unk_10001FDA0);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v31);
    sub_10000C93C((uint64_t)v10, 0, 1, v20);
    uint64_t v22 = (uint64_t)v10;
  }
  return sub_10000CAF0(v22, v21);
}

id sub_10000B014(void *a1, void *a2, uint64_t a3, uint64_t (*a4)(void))
{
  *(void *)&v4[*a1] = 0;
  *(void *)&v4[*a2] = 0;
  uint64_t v6 = qword_10001F538;
  uint64_t v7 = v4;
  if (v6 != -1) {
    swift_once();
  }
  id v8 = (id)qword_10001F540;
  sub_1000116D0();

  v10.receiver = v7;
  v10.super_class = (Class)a4(0);
  return objc_msgSendSuper2(&v10, "init");
}

id sub_10000B120()
{
  return sub_1000066A0(type metadata accessor for PosterEditor);
}

uint64_t sub_10000B154(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v8 = a1 + *a5;
  sub_1000116E0();
  sub_10000D184();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  return v11(v8, v9);
}

id sub_10000B224()
{
  id v1 = [*(id *)(v0+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD411EditorViews_posterKitViewProviding) backgroundView];
  return v1;
}

id sub_10000B2A8()
{
  id v1 = [*(id *)(v0+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD411EditorViews_posterKitViewProviding) foregroundView];
  return v1;
}

id sub_10000B32C()
{
  id v1 = [*(id *)(v0+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD411EditorViews_posterKitViewProviding) floatingView];
  return v1;
}

void sub_10000B36C()
{
}

id sub_10000B3C0()
{
  return sub_1000066A0((uint64_t (*)(void))type metadata accessor for EditorViews);
}

uint64_t sub_10000B3E8(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_posterKitEnvironment) = a1;
  return swift_unknownObjectRelease();
}

id sub_10000B400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(void), void *a7, uint64_t (*a8)(void))
{
  uint64_t v15 = (uint64_t)&v8[*a5];
  uint64_t v16 = a6(0);
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, a2, v16);
  sub_10000C93C(v15, 0, 1, v16);
  *(void *)&v8[OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_posterKitEnvironment] = a1;
  uint64_t v18 = (uint64_t)&v8[*a7];
  uint64_t v19 = a8(0);
  sub_10000C93C(v18, 1, 1, v19);
  uint64_t v20 = &v8[OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_sourceAssetDirectory];
  uint64_t v21 = sub_1000113B0();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  v23(v20, a3, v21);
  v23(&v8[OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_targetAssetDirectory], a4, v21);
  v28.receiver = v8;
  v28.super_class = (Class)type metadata accessor for EditingEnvironment(0);
  id v24 = objc_msgSendSuper2(&v28, "init");
  uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  v25(a4, v21);
  v25(a3, v21);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a2, v16);
  return v24;
}

uint64_t sub_10000B60C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B624(&OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_sourceAssetDirectory, a1);
}

uint64_t sub_10000B618@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B624(&OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_targetAssetDirectory, a1);
}

uint64_t sub_10000B624@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  uint64_t v5 = sub_1000113B0();
  sub_10000D184();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a2, v4, v5);
  uint64_t v7 = sub_10000D1B8();
  return sub_10000C93C(v7, v8, v9, v10);
}

uint64_t sub_10000B6A0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CE24(v1+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_sourcePosterConfiguration, a1, (uint64_t *)&unk_10001FDA0);
}

uint64_t sub_10000B6D0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CE24(v1+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_posterDescriptor, a1, &qword_10001FD98);
}

void sub_10000B700(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(v2+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_posterKitEnvironment) targetConfiguration];
  if (a2) {
    NSString v5 = sub_100011750();
  }
  else {
    NSString v5 = 0;
  }
  id v6 = v5;
  objc_msgSend(v4, "setDisplayNameLocalizationKey:");
}

void sub_10000B7A0()
{
}

id sub_10000B7F4()
{
  return sub_1000066A0(type metadata accessor for EditingEnvironment);
}

uint64_t sub_10000B8F8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B60C(a1);
}

uint64_t sub_10000B91C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B618(a1);
}

uint64_t sub_10000B940@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B6D0(a1);
}

uint64_t sub_10000B964@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B6A0(a1);
}

void sub_10000B988(uint64_t a1, uint64_t a2)
{
}

void PREditor.pu_presentTitledViewController(_:animated:completion:)(void *a1)
{
  PPPresentTitledViewControllerInEditor(a1, v1);
}

id PREditor.pu_requestDismissal(with:)(unint64_t a1)
{
  if (a1 >= 2)
  {
    id result = (id)sub_100011940();
    __break(1u);
  }
  else
  {
    return [v1 requestDismissalWithAction:a1];
  }
  return result;
}

uint64_t PREditor.px_updatePreferences(_:)(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = sub_10000D1D8();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = sub_10000D1D8();
  *(void *)(v7 + 16) = sub_10000C0B4;
  *(void *)(v7 + 24) = v6;
  v10[4] = sub_10000C0C0;
  v10[5] = v7;
  v10[0] = _NSConcreteStackBlock;
  sub_10000D1CC();
  v10[2] = sub_100006A04;
  v10[3] = &unk_100018CD0;
  uint64_t v8 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v3, "updatePreferences:", v8, v10[0]);
  _Block_release(v8);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v3) {
    __break(1u);
  }
  return result;
}

void sub_10000BB78(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v4 = swift_dynamicCastObjCProtocolUnconditional();
  id v5 = [objc_allocWithZone((Class)NSObject) init];
  uint64_t v6 = swift_dynamicCastObjCProtocolUnconditional();
  a3(v4, v6);
}

uint64_t sub_10000BC28(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, id))(a1 + 32);
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, v6);

  return swift_unknownObjectRelease();
}

double PREditor.pu_safeAreaBounds.getter()
{
  return PPSafeAreaBoundsForEditor(v0);
}

id sub_10000BC98()
{
  return sub_10000BCBC();
}

id sub_10000BCBC()
{
  id v1 = [v0 contentOverlayView];
  return v1;
}

void sub_10000BCF4(void *a1)
{
}

void sub_10000BD1C(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
}

void sub_10000BD40(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    v8[4] = a3;
    void v8[5] = a4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_100006CA8;
    v8[3] = &unk_100018DD8;
    uint64_t v7 = _Block_copy(v8);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v7 = 0;
  }
  [v4 presentViewController:a1 animated:a2 & 1 completion:v7];
  _Block_release(v7);
}

void sub_10000BE18(char a1, uint64_t a2, uint64_t a3)
{
}

void sub_10000BE3C(char a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    v6[4] = a2;
    v6[5] = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_100006CA8;
    v6[3] = &unk_100018DB0;
    id v5 = _Block_copy(v6);
    swift_retain();
    swift_release();
  }
  else
  {
    id v5 = 0;
  }
  [v3 dismissViewControllerAnimated:a1 & 1 completion:v5];
  _Block_release(v5);
}

uint64_t sub_10000BF0C(uint64_t a1, uint64_t a2)
{
  return PREditor.px_updatePreferences(_:)(a1, a2);
}

id sub_10000BF30(unint64_t a1)
{
  return PREditor.pu_requestDismissal(with:)(a1);
}

double sub_10000BF54()
{
  return PREditor.pu_safeAreaBounds.getter();
}

uint64_t PREditingLook.pu_timeAppearance.getter()
{
  return 2;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

BOOL sub_10000C01C(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

id sub_10000C028()
{
  NSString v1 = sub_100011750();
  swift_bridgeObjectRelease();
  NSString v2 = sub_100011750();
  swift_bridgeObjectRelease();
  id v3 = [v0 initWithIdentifier:v1 displayName:v2];

  return v3;
}

void sub_10000C0B4(uint64_t a1, uint64_t a2)
{
  sub_10000BB78(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_10000C0C0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_10000C0E8()
{
  unint64_t result = qword_10001F750;
  if (!qword_10001F750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001F750);
  }
  return result;
}

uint64_t sub_10000C134(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000C17C()
{
  return type metadata accessor for PosterRenderer(0);
}

uint64_t type metadata accessor for PosterRenderer(uint64_t a1)
{
  return sub_10000C3C4(a1, (uint64_t *)&unk_10001F808);
}

uint64_t sub_10000C1A8()
{
  return type metadata accessor for RenderingEnvironment(0);
}

uint64_t type metadata accessor for RenderingEnvironment(uint64_t a1)
{
  return sub_10000C3C4(a1, (uint64_t *)&unk_10001F8A0);
}

void sub_10000C1D0()
{
  sub_10000C540(319, &qword_10001F8B0, (void (*)(uint64_t))&type metadata accessor for URL);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t type metadata accessor for MutablePosterRenderingPreferences()
{
  return self;
}

uint64_t sub_10000C2B4()
{
  return type metadata accessor for PosterEditor(0);
}

uint64_t type metadata accessor for PosterEditor(uint64_t a1)
{
  return sub_10000C3C4(a1, (uint64_t *)&unk_10001FB30);
}

uint64_t sub_10000C2DC()
{
  uint64_t result = sub_1000116E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for EditorViews()
{
  return self;
}

uint64_t sub_10000C39C()
{
  return type metadata accessor for EditingEnvironment(0);
}

uint64_t type metadata accessor for EditingEnvironment(uint64_t a1)
{
  return sub_10000C3C4(a1, (uint64_t *)&unk_10001FC90);
}

uint64_t sub_10000C3C4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000C3F8()
{
  sub_10000C540(319, &qword_10001FCA0, (void (*)(uint64_t))&type metadata accessor for AmbientPhotoFramePosterDescriptor);
  if (v0 <= 0x3F)
  {
    sub_10000C540(319, &qword_10001FCA8, (void (*)(uint64_t))&type metadata accessor for AmbientPhotoFramePosterConfiguration);
    if (v1 <= 0x3F)
    {
      sub_1000113B0();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_10000C540(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1000118B0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void type metadata accessor for PXPosterEnvironmentContentsType(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for AmbientPhotoFramePosterProviderExtension()
{
  return &type metadata for AmbientPhotoFramePosterProviderExtension;
}

uint64_t sub_10000C5B8()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_10000C5F0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000C634(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_10000C67C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_10000C688@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_10000C698(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000C6A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _sSo13PREditingLookC31AmbientPhotoFramePosterProviderE21pu_timeFontIdentifierSo08PUPosterjK0aSgvg_0();
  *a1 = result;
  return result;
}

uint64_t _sSo13PREditingLookC31AmbientPhotoFramePosterProviderE21pu_timeFontIdentifierSo08PUPosterjK0aSgvg_0()
{
  return 0;
}

BOOL sub_10000C6D4(uint64_t *a1)
{
  return sub_10000C01C(*a1, *v1);
}

uint64_t sub_10000C6E0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000C710(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_10000C710(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_10000C718@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000F720(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_10000C748@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000C778(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_10000C778(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_10000C780(void *a1, uint64_t *a2)
{
  return sub_10000C788(a1, *a2);
}

BOOL sub_10000C788(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_10000C7B4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10000C7E8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_10000C7E8(uint64_t a1)
{
  uint64_t result = *v1 & a1;
  if (result) {
    *v1 &= ~a1;
  }
  return result;
}

uint64_t sub_10000C80C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10000C840(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_10000C840(uint64_t a1)
{
  uint64_t v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_10000C858(uint64_t *a1)
{
  return sub_10000C860(*a1);
}

uint64_t sub_10000C860(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_10000C870(uint64_t *a1)
{
  return sub_10000F728(*a1);
}

uint64_t sub_10000C878(uint64_t *a1)
{
  return sub_10000C880(*a1);
}

uint64_t sub_10000C880(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_10000C890@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000C8C0(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_10000C8C0(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_10000C8C8(uint64_t *a1)
{
  return sub_10000F738(*a1, *v1);
}

BOOL sub_10000C8D4(uint64_t *a1)
{
  return sub_10000C8E0(*a1, *v1);
}

BOOL sub_10000C8E0(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_10000C8EC()
{
  return sub_10000C8F4(*v0);
}

BOOL sub_10000C8F4(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_10000C900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_10000C918(uint64_t *a1)
{
  return sub_10000C920(*a1);
}

uint64_t sub_10000C920(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

BOOL sub_10000C930(uint64_t *a1, uint64_t *a2)
{
  return sub_10000D298(*a1, *a2);
}

uint64_t sub_10000C93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10000C964(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000CED4(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000C9A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000C9F8()
{
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000CA38(uint64_t a1, uint64_t a2)
{
  return sub_100009B8C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(unsigned __int8 *)(v2 + 40), *(void **)(v2 + 48));
}

uint64_t sub_10000CA4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10000CA74@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000CA9C(a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000CA9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if ((v5 & ~v2) == 0) {
        uint64_t v4 = 0;
      }
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_10000CAF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000C5F0((uint64_t *)&unk_10001FDA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10000CB58(uint64_t a1)
{
  sub_1000082AC(a1, *(void (**)(uint64_t (*)(), uint64_t))(v1 + 16));
}

uint64_t sub_10000CB60()
{
  sub_10000C5F0(&qword_10001FDD8);
  sub_10000D184();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_10000CBEC()
{
  sub_10000C5F0(&qword_10001FDD8);
  return sub_10000840C();
}

uint64_t sub_10000CC50()
{
  _Block_release(*(const void **)(v0 + 24));
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000CC98()
{
  sub_10000D1A4();
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10000CD48;
  id v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_10001FDE8 + dword_10001FDE8);
  return v6(v2, v3, v4);
}

uint64_t sub_10000CD48()
{
  sub_10000D154();
  uint64_t v1 = *v0;
  sub_10000D194();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000D1F0();
  return v3();
}

uint64_t sub_10000CE0C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10000CE24(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000C5F0(a3);
  sub_10000D184();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_10000CE80(uint64_t a1, uint64_t *a2)
{
  sub_10000C5F0(a2);
  sub_10000D184();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_10000CED4(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for PFPosterShuffleSmartAlbums(uint64_t a1)
{
}

void sub_10000CF24(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000CF6C()
{
  return sub_10000CFA0(&qword_10001FE30);
}

uint64_t sub_10000CFA0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000C134(&qword_10001F760);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000CFE8()
{
  return sub_10000C634(&qword_10001FE38, type metadata accessor for PFPosterShuffleSmartAlbums);
}

uint64_t sub_10000D030()
{
  return sub_10000C634(&qword_10001FE40, type metadata accessor for PFPosterShuffleSmartAlbums);
}

uint64_t sub_10000D078()
{
  return sub_10000C634(&qword_10001FE48, type metadata accessor for PFPosterShuffleSmartAlbums);
}

uint64_t sub_10000D0C0()
{
  return sub_10000C634((unint64_t *)&unk_10001FE50, type metadata accessor for PFPosterShuffleSmartAlbums);
}

uint64_t sub_10000D144()
{
  return _swift_deallocObject(v0, 32, 7);
}

double _sSo10PRRendererC31AmbientPhotoFramePosterProviderE44px_shuffleSleepTransformOutAnimationDuration12CoreGraphics7CGFloatVvg_0()
{
  return 0.5;
}

uint64_t sub_10000D1B8()
{
  return v0;
}

uint64_t sub_10000D1D8()
{
  return swift_allocObject();
}

uint64_t sub_10000D1F0()
{
  return v0 + 8;
}

id sub_10000D1FC(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_100011390(v3);
  uint64_t v5 = v4;
  id v6 = [v2 initWithPhotoLibraryURL:v4];

  uint64_t v7 = sub_1000113B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  return v6;
}

BOOL sub_10000D298(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_10000D2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000C5F0(&qword_1000201D0);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100011840();
  sub_10000C93C((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  void v8[5] = a2;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_1000201E0;
  v9[5] = v8;
  sub_10000F8DC((uint64_t)v6, (uint64_t)&unk_1000201F0, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_10000D3A8()
{
  if (qword_10001F530 != -1) {
    swift_once();
  }
  sub_10000CED4(0, &qword_100020190);
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000118A0();
  qword_100020248 = result;
  return result;
}

id sub_10000D464()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000113B0();
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider13PosterUpdater____lazy_storage___photoLibrary;
  id v6 = *(void **)(v1 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider13PosterUpdater____lazy_storage___photoLibrary);
  if (v6)
  {
    id v7 = *(id *)(v1 + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider13PosterUpdater____lazy_storage___photoLibrary);
  }
  else
  {
    sub_10000CED4(0, &qword_10001FDD0);
    id v8 = [self systemPhotoLibraryURL];
    sub_1000113A0();

    id v9 = sub_10000D1FC((uint64_t)v4);
    uint64_t v10 = *(void **)(v1 + v5);
    *(void *)(v1 + v5) = v9;
    id v7 = v9;

    id v6 = 0;
  }
  id v11 = v6;
  return v7;
}

uint64_t sub_10000D56C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 40) = a5;
  *(unsigned char *)(v6 + 72) = a3;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = sub_1000116E0();
  *(void *)(v6 + 48) = v7;
  *(void *)(v6 + 56) = *(void *)(v7 - 8);
  *(void *)(v6 + 64) = swift_task_alloc();
  return _swift_task_switch(sub_10000D634, v5, 0);
}

void sub_10000D634()
{
  if (qword_10001F558 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[8];
  uint64_t v2 = (void (*)(void))v0[4];
  uint64_t v3 = (void *)v0[3];
  id v4 = (id)qword_100020248;
  sub_1000116D0();
  sub_100011890();
  sub_100010E70();
  sub_100010F44();
  v2();
  if (v1)
  {
    uint64_t v6 = sub_100010E14();
    v7(v6);
    swift_task_dealloc();
    sub_100010EE8();
    __asm { BRAA            X1, X16 }
  }
  sub_100011880();
  sub_100010E94();
  uint64_t v10 = sub_100010E14();
  v11(v10);
  swift_task_dealloc();
  sub_100010F24();
  sub_100010EE8();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_10000D794()
{
  swift_defaultActor_destroy();
  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_10000D7C4()
{
  return v0;
}

uint64_t sub_10000D7D0()
{
  return sub_10000D7C4();
}

uint64_t sub_10000D7EC()
{
  type metadata accessor for PosterUpdater.Serializer();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  qword_100020250 = v0;
  return result;
}

uint64_t sub_10000D828(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return sub_100010E2C((uint64_t)sub_10000D840);
}

uint64_t sub_10000D840()
{
  sub_10000D1A4();
  if (qword_10001F560 != -1) {
    swift_once();
  }
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  v0[2].i64[0] = (uint64_t)v1;
  v1[1] = vextq_s8(v0[1], v0[1], 8uLL);
  id v4 = (uint64_t (*)(const char *, uint64_t, uint64_t, uint64_t (*)@<X0>(unint64_t *@<X8>), int8x16_t *))((char *)&dword_1000201A8 + dword_1000201A8);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[2].i64[1] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_10000D960;
  return v4("updateDescriptors", 17, 2, sub_1000107D4, v1);
}

uint64_t sub_10000D960()
{
  sub_10000D1A4();
  uint64_t v3 = v2;
  sub_10000D154();
  uint64_t v5 = v4;
  uint64_t v6 = *v1;
  sub_10000D194();
  void *v7 = v6;
  *(void *)(v5 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_10000DA88, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    id v8 = *(uint64_t (**)(uint64_t))(v6 + 8);
    return v8(v3);
  }
}

uint64_t sub_10000DA88()
{
  sub_100010EDC();
  swift_task_dealloc();
  sub_10000D1F0();
  return v0();
}

uint64_t sub_10000DAE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v91 = a1;
  uint64_t v74 = a3;
  uint64_t v4 = sub_100011500();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  v75 = (char *)v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  v83 = (char *)v73 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  id v12 = (char *)v73 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v73 - v13;
  sub_100011850();
  if (qword_10001F558 != -1) {
    swift_once();
  }
  sub_1000116B0();
  unint64_t v96 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v15 = sub_1000114F0();
  uint64_t v17 = *(void *)(v15 + 16);
  if (!v17)
  {
    swift_bridgeObjectRelease();
    p_class_meths = &OBJC_PROTOCOL___PRPosterEnvironment.class_meths;
    goto LABEL_35;
  }
  int v18 = 0;
  v73[0] = v5;
  uint64_t v19 = v5 + 16;
  uint64_t v20 = *(void (**)(void, void, void))(v5 + 16);
  unint64_t v21 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v73[1] = v15;
  unint64_t v22 = v15 + v21;
  uint64_t v78 = v95;
  uint64_t v85 = *(void *)(v19 + 56);
  uint64_t v86 = (void (**)(char *, uint64_t))(v19 - 8);
  *(void *)&long long v16 = 136315138;
  long long v82 = v16;
  uint64_t v77 = (char *)&type metadata for Any + 8;
  uint64_t v79 = v4;
  uint64_t v84 = a2;
  uint64_t v92 = v19;
  v88 = v12;
  uint64_t v90 = v20;
  do
  {
    v20(v14, v22, v4);
    uint64_t v93 = sub_100011580();
    unint64_t v24 = v23;
    int v25 = sub_10000E7C0();
    uint64_t v26 = *(void *)(a2 + 16);
    int v89 = v25;
    if (v25)
    {
      if (v26
        && (swift_bridgeObjectRetain(), sub_10001050C(v93, v24), char v28 = v27, swift_bridgeObjectRelease(), (v28 & 1) != 0))
      {
        os_log_type_t v29 = sub_100011850();
        uint64_t v30 = qword_100020248;
        os_log_type_t v31 = v29;
        if (os_log_type_enabled((os_log_t)qword_100020248, v29))
        {
          swift_bridgeObjectRetain_n();
          uint64_t v32 = swift_slowAlloc();
          os_log_t v80 = v30;
          uint64_t v33 = (uint8_t *)v32;
          uint64_t v81 = swift_slowAlloc();
          v95[0] = v81;
          *(_DWORD *)uint64_t v33 = v82;
          v76 = v33 + 4;
          swift_bridgeObjectRetain();
          uint64_t v94 = sub_10000FD54(v93, v24, v95);
          sub_1000118C0();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v80, v31, "Maintained %s", v33, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
LABEL_16:
          swift_slowDealloc();
        }
      }
      else
      {
        os_log_type_t v40 = sub_100011850();
        uint64_t v41 = qword_100020248;
        os_log_type_t v42 = v40;
        if (os_log_type_enabled((os_log_t)qword_100020248, v40))
        {
          swift_bridgeObjectRetain_n();
          uint64_t v43 = swift_slowAlloc();
          uint64_t v44 = swift_slowAlloc();
          LODWORD(v81) = v18;
          v95[0] = v44;
          *(_DWORD *)uint64_t v43 = v82;
          os_log_t v80 = (os_log_t)(v43 + 4);
          swift_bridgeObjectRetain();
          uint64_t v94 = sub_10000FD54(v93, v24, v95);
          sub_1000118C0();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v41, v42, "Added %s", (uint8_t *)v43, 0xCu);
          swift_arrayDestroy();
          LOBYTE(v18) = v81;
          swift_slowDealloc();
          uint64_t v4 = v79;
          goto LABEL_16;
        }
      }
      uint64_t v45 = v87;
      uint64_t v46 = sub_10000EA14(v93, v24, (uint64_t)v14);
      uint64_t v87 = v45;
      if (v45)
      {
        swift_bridgeObjectRelease();
        (*v86)(v14, v4);
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      id v47 = (void *)v46;
      swift_bridgeObjectRelease();
      id v48 = v47;
      sub_1000117A0();
      if (*(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1000117D0();
      }
      sub_1000117E0();
      sub_1000117C0();

      a2 = v84;
      goto LABEL_22;
    }
    if (v26)
    {
      swift_bridgeObjectRetain();
      sub_10001050C(v93, v24);
      char v35 = v34;
      swift_bridgeObjectRelease();
      if ((v35 & 1) != 0
        && (os_log_type_t v36 = sub_100011850(),
            id v37 = qword_100020248,
            os_log_type_t v38 = v36,
            os_log_type_enabled((os_log_t)qword_100020248, v36)))
      {
        swift_bridgeObjectRetain();
        uint64_t v39 = swift_slowAlloc();
        v95[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v39 = v82;
        swift_bridgeObjectRetain();
        *(void *)(v39 + 4) = sub_10000FD54(v93, v24, v95);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "Removed '%s'", (uint8_t *)v39, 0xCu);
        swift_arrayDestroy();
        uint64_t v4 = v79;
        swift_slowDealloc();
        a2 = v84;
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
LABEL_22:
      uint64_t v49 = v88;
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    uint64_t v49 = v88;
LABEL_23:
    uint64_t v20 = v90;
    v90(v49, v14, v4);
    if (v18)
    {
      uint64_t v50 = *v86;
      (*v86)(v49, v4);
      v50(v14, v4);
      int v18 = 1;
    }
    else
    {
      uint64_t v51 = (void (*)(char *, char *, uint64_t))v20;
      v52 = v83;
      v51(v83, v49, v4);
      if (v89)
      {
        id v53 = v52;
        int v54 = sub_1000114D0();
        v55 = *v86;
        uint64_t v56 = v53;
        uint64_t v57 = v88;
        (*v86)(v56, v4);
        v55(v57, v4);
        v55(v14, v4);
        int v18 = v54 ^ 1;
      }
      else
      {
        uint64_t v58 = *v86;
        (*v86)(v52, v4);
        v58(v49, v4);
        v58(v14, v4);
        int v18 = 0;
      }
      uint64_t v20 = v90;
    }
    v22 += v85;
    --v17;
  }
  while (v17);
  swift_bridgeObjectRelease();
  uint64_t v5 = v73[0];
  p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___PRPosterEnvironment + 32);
  if (v18) {
    goto LABEL_40;
  }
LABEL_35:
  sub_100011850();
  sub_1000116B0();
  uint64_t v60 = (uint64_t)v75;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v75, enum case for AmbientPhotoFramePosterKind.featured(_:), v4);
  uint64_t v61 = sub_100011580();
  uint64_t v62 = v87;
  uint64_t v64 = sub_10000EA14(v61, v63, v60);
  uint64_t v87 = v62;
  if (v62)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v60, v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v65 = (void *)v64;
    swift_bridgeObjectRelease();
    id v66 = v65;
    sub_1000117A0();
    if (*(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1000117D0();
    }
    sub_1000117E0();
    sub_1000117C0();

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v60, v4);
LABEL_40:
    os_log_type_t v67 = sub_100011850();
    v68 = p_class_meths[73];
    unint64_t v69 = v96;
    if (os_log_type_enabled(v68, v67))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v70 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v70 = 134217984;
      if (v69 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v71 = sub_100011950();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v71 = *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v95[0] = v71;
      sub_1000118C0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v68, v67, "Returned %ld descriptors", v70, 0xCu);
      swift_slowDealloc();
    }
    uint64_t result = swift_beginAccess();
    *uint64_t v74 = v96;
  }
  return result;
}

uint64_t sub_10000E52C(int a1, void *a2, void *aBlock, void *a4)
{
  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v4[5] = sub_10000CED4(0, &qword_100020218);
  uint64_t v7 = sub_100011740();
  v4[6] = v7;
  id v8 = a2;
  a4;
  uint64_t v9 = (void *)swift_task_alloc();
  v4[7] = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_10000E630;
  return sub_10000D828(v7);
}

uint64_t sub_10000E630()
{
  sub_100010ED0();
  uint64_t v2 = v0;
  sub_10000D154();
  uint64_t v4 = v3;
  uint64_t v6 = *(void **)(v5 + 24);
  uint64_t v7 = *(void **)(v5 + 16);
  uint64_t v8 = *v1;
  sub_10000D194();
  *uint64_t v9 = v8;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v10 = sub_100011380();
    swift_errorRelease();
    Class isa = 0;
    id v12 = (void *)v10;
  }
  else
  {
    Class isa = sub_1000117B0().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v10 = 0;
    id v12 = isa;
  }
  uint64_t v13 = *(void (***)(void, void, void))(v4 + 32);
  ((void (**)(void, Class, uint64_t))v13)[2](v13, isa, v10);

  _Block_release(v13);
  sub_10000D1F0();
  return v14();
}

uint64_t sub_10000E7C0()
{
  uint64_t v0 = sub_1000114C0();
  if ((v1 & 1) == 0)
  {
    uint64_t v2 = v0;
    unint64_t v3 = (unint64_t)[(id)sub_100011490() supportedTypes];
    if (v3)
    {
      sub_100010668(0, 1, 1);
      sub_100010E48();
      if (v5)
      {
        sub_100010DA8(v4);
        sub_100010F38();
      }
      sub_100010E38(v4);
    }
    if ((~v3 & 2) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100010DD0();
      }
      sub_100010E48();
      if (v5)
      {
        sub_100010DA8(v6);
        sub_100010F38();
      }
      sub_100010E38(v6);
    }
    if ((~v3 & 8) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100010DD0();
      }
      sub_100010E48();
      if (v5)
      {
        sub_100010DA8(v7);
        sub_100010F38();
      }
      sub_100010E38(v7);
    }
    if ((~v3 & 4) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100010DD0();
      }
      sub_100010E48();
      if (v5)
      {
        sub_100010DA8(v8);
        sub_100010F38();
      }
      sub_100010E38(v8);
    }
    if ((~v3 & 0x10) != 0)
    {
      unint64_t v11 = *((void *)&_swiftEmptyArrayStorage + 2);
      if (!v11)
      {
LABEL_36:
        uint64_t v12 = 0;
LABEL_38:
        swift_release();
        return v12;
      }
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100010DD0();
      }
      unint64_t v10 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v9 = *((void *)&_swiftEmptyArrayStorage + 3);
      unint64_t v11 = v10 + 1;
      if (v10 >= v9 >> 1) {
        sub_100010668((char *)(v9 > 1), v10 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v11;
      *((void *)&_swiftEmptyArrayStorage + v10 + 4) = 16;
    }
    uint64_t v13 = 0;
    while (1)
    {
      if ((*((void *)&_swiftEmptyArrayStorage + v13 + 4) & ~v2) == 0)
      {
        id v14 = sub_10000D464();
        char v15 = sub_100011480();

        if (v15) {
          break;
        }
      }
      if (v11 == ++v13) {
        goto LABEL_36;
      }
    }
    uint64_t v12 = 1;
    goto LABEL_38;
  }
  return 1;
}

uint64_t sub_10000EA14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v59 = 0xE90000000000006CLL;
  sub_100011600();
  sub_100010D8C();
  uint64_t v57 = v7;
  uint64_t v58 = v6;
  __chkstk_darwin(v6);
  sub_100010F10();
  uint64_t v53 = v8;
  uint64_t v56 = sub_100011670();
  sub_100010D8C();
  uint64_t v54 = v9;
  uint64_t v11 = __chkstk_darwin(v10);
  id v47 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v48 = (char *)&v42 - v13;
  uint64_t v51 = sub_1000113B0();
  sub_100010D8C();
  uint64_t v49 = v14;
  __chkstk_darwin(v15);
  sub_100010F10();
  uint64_t v17 = v16;
  uint64_t v18 = sub_100011500();
  sub_100010D8C();
  uint64_t v20 = v19;
  uint64_t v22 = __chkstk_darwin(v21);
  unint64_t v24 = (char *)&v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v42 - v25;
  int v45 = sub_1000114A0();
  int v44 = sub_1000114B0();
  int v43 = sub_1000114D0();
  sub_10000CED4(0, &qword_100020198);
  swift_bridgeObjectRetain();
  uint64_t v50 = a1;
  uint64_t v52 = a2;
  id v27 = sub_10000F038();
  int v28 = enum case for AmbientPhotoFramePosterKind.people(_:);
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v26, enum case for AmbientPhotoFramePosterKind.people(_:), v18);
  int v42 = sub_1000114E0();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v26, v18);
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v46(v24, a3, v18);
  int v29 = (*(uint64_t (**)(char *, uint64_t))(v20 + 88))(v24, v18);
  if (v29 == enum case for AmbientPhotoFramePosterKind.featured(_:))
  {
    sub_100010E58();
    uint64_t v32 = v48;
LABEL_8:
    sub_10001076C(v30, v31, v27);
    goto LABEL_9;
  }
  uint64_t v32 = v48;
  if (v29 == enum case for AmbientPhotoFramePosterKind.nature(_:))
  {
    sub_100010E58();
LABEL_5:
    uint64_t v30 = 0xD00000000000002ALL;
    goto LABEL_8;
  }
  if (v29 == enum case for AmbientPhotoFramePosterKind.pets(_:))
  {
    sub_100010EB8();
    sub_100010E58();
    goto LABEL_8;
  }
  if (v29 == enum case for AmbientPhotoFramePosterKind.cities(_:))
  {
    sub_100010EB8();
    sub_100010E58();
    goto LABEL_5;
  }
  if (v29 == v28)
  {
    sub_100010E58();
    unint64_t v59 = 0xEB000000006C6C69;
    goto LABEL_5;
  }
  if (v29 != enum case for AmbientPhotoFramePosterKind.album(_:))
  {
    uint64_t result = sub_100011940();
    __break(1u);
    return result;
  }
  unint64_t v59 = 0x8000000100013FE0;
LABEL_9:
  NSString v33 = sub_100011750();
  swift_bridgeObjectRelease();
  if (v42)
  {
    sub_100010E58();
    NSString v34 = sub_100011750();
  }
  else
  {
    NSString v34 = 0;
  }
  PPConfigureAmbientPosterDescriptor(v27, v43 & 1, v45 & 1, v44 & 1, v33, v34);

  id v35 = [v27 assetDirectory];
  sub_1000113A0();

  id v36 = sub_10000D464();
  sub_100011660();

  v46(v26, a3, v18);
  uint64_t v37 = v54;
  uint64_t v38 = v56;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v47, v32, v56);
  swift_bridgeObjectRetain();
  sub_100011590();
  uint64_t v39 = v53;
  sub_1000115C0();
  uint64_t v40 = v55;
  sub_1000115F0();
  if (v40) {

  }
  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v39, v58);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v32, v38);
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v17, v51);
  return (uint64_t)v27;
}

id sub_10000F038()
{
  NSString v0 = sub_100011750();
  swift_bridgeObjectRelease();
  id v1 = [(id)swift_getObjCClassFromMetadata() mutableDescriptorWithIdentifier:v0];

  return v1;
}

uint64_t sub_10000F09C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_100010E2C((uint64_t)sub_10000F0B4);
}

uint64_t sub_10000F0B4()
{
  sub_10000D1A4();
  if (qword_10001F560 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[3] = v2;
  *(void *)(v2 + 16) = v1;
  char v5 = (uint64_t (*)(uint64_t, uint64_t, char, uint64_t, uint64_t))((char *)&dword_100020188 + dword_100020188);
  unint64_t v3 = (void *)swift_task_alloc();
  v0[4] = v3;
  *unint64_t v3 = v0;
  v3[1] = sub_10000F1D4;
  return v5((uint64_t)"updateConfiguration", 19, 2, (uint64_t)sub_10000F6F0, v2);
}

uint64_t sub_10000F1D4()
{
  sub_100010EDC();
  uint64_t v2 = v1;
  sub_10000D154();
  uint64_t v3 = *v0;
  sub_10000D194();
  void *v4 = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  char v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_10000F2E0(void *a1, int a2, void *a3, void *a4, void *aBlock, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = _Block_copy(aBlock);
  sub_100010F00();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = a1;
  id v13 = a3;
  id v14 = a4;
  id v15 = a1;
  return sub_10000D2A4(a7, (uint64_t)v12);
}

id sub_10000F364()
{
  *(void *)&v0[OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider13PosterUpdater____lazy_storage___photoLibrary] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PosterUpdater();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t sub_10000F3A4(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = a2;
  id v10 = a4;
  uint64_t v11 = (void *)swift_task_alloc();
  v4[6] = v11;
  void *v11 = v4;
  v11[1] = sub_10000F470;
  return sub_10000F09C((uint64_t)v8);
}

uint64_t sub_10000F470(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 32);
  uint64_t v7 = *(void **)(*v2 + 24);
  id v8 = *(void **)(*v2 + 16);
  uint64_t v9 = *v2;
  sub_10000D194();
  void *v10 = v9;
  swift_task_dealloc();

  uint64_t v11 = *(void (***)(void, void, void))(v5 + 40);
  if (v3)
  {
    uint64_t v12 = (void *)sub_100011380();
    swift_errorRelease();
    ((void (**)(void, void, void *))v11)[2](v11, 0, v12);

    _Block_release(v11);
  }
  else
  {
    ((void (**)(void, void *, void))v11)[2](v11, a1, 0);
    _Block_release(v11);
  }
  uint64_t v13 = *(uint64_t (**)(void))(v9 + 8);
  return v13();
}

id sub_10000F664()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PosterUpdater();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PosterUpdater()
{
  return self;
}

uint64_t type metadata accessor for PosterUpdater.Serializer()
{
  return self;
}

id sub_10000F6F0@<X0>(void *a1@<X8>)
{
  objc_super v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

uint64_t sub_10000F720(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_10000F728(uint64_t result)
{
  *v1 &= result;
  return result;
}

BOOL sub_10000F738(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

uint64_t sub_10000F744(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  int64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_100010D88;
  return v6();
}

uint64_t sub_10000F810(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_100010D88;
  return v7();
}

uint64_t sub_10000F8DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100011840();
  if (sub_10000CA4C(a1, 1, v6) == 1)
  {
    sub_100010A94(a1);
  }
  else
  {
    sub_100011830();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000117F0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000FA44(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10000FB20;
  return v6(a1);
}

uint64_t sub_10000FB20()
{
  sub_100010EDC();
  sub_10000D154();
  uint64_t v1 = *v0;
  sub_10000D194();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000D1F0();
  return v3();
}

char *sub_10000FBE4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_100011960();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

void *sub_10000FC78(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[8 * a2] > __src ? (BOOL v3 = &__src[8 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100011960();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 8 * a2);
  }
  return result;
}

uint64_t sub_10000FD54(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000FE28(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000107F0((uint64_t)v12, *a3);
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
      sub_1000107F0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000C9A8((uint64_t)v12);
  return v7;
}

uint64_t sub_10000FE28(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10000FF80((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1000118D0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100010058(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_100011920();
    if (!v8)
    {
      uint64_t result = sub_100011930();
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

void *sub_10000FF80(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100011960();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100010058(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1000100F0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000102CC(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000102CC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_1000100F0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_100011790();
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
  unint64_t v3 = sub_100010264(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100011900();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_100011960();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_100011930();
  __break(1u);
  return result;
}

void *sub_100010264(uint64_t a1, uint64_t a2)
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
  sub_10000C5F0((uint64_t *)&unk_1000201B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1000102CC(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_10000C5F0((uint64_t *)&unk_1000201B0);
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
    sub_10001047C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000103A4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1000103A4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100011960();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_10001047C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_100011960();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_10001050C(uint64_t a1, uint64_t a2)
{
  sub_1000119A0();
  sub_100011770();
  Swift::Int v4 = sub_1000119B0();
  return sub_100010584(a1, a2, v4);
}

unint64_t sub_100010584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100011980() & 1) == 0)
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
      while (!v14 && (sub_100011980() & 1) == 0);
    }
  }
  return v6;
}

char *sub_100010668(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100010688(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_100010688(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_10000C5F0(&qword_1000201A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10000FBE4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000FC78(v13, v8, v12);
  }
  swift_release();
  return v10;
}

void sub_10001076C(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100011750();
  swift_bridgeObjectRelease();
  [a3 setDisplayNameLocalizationKey:v4];
}

uint64_t sub_1000107D4@<X0>(unint64_t *a1@<X8>)
{
  return sub_10000DAE4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_1000107F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100010850()
{
  sub_100010ED0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_100010E64(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_100010D88;
  uint64_t v3 = sub_100010DF4();
  return v4(v3);
}

uint64_t sub_1000108F4()
{
  sub_100010ED0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_100010E64(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_100010D88;
  uint64_t v3 = sub_100010DF4();
  return v4(v3);
}

uint64_t sub_100010998()
{
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v0 = sub_100010F00();
  return _swift_deallocObject(v0, v1, v2);
}

uint64_t sub_1000109D0()
{
  sub_100010ED0();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  char v5 = (int *)v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_100010E64(v6);
  void *v7 = v8;
  v7[1] = sub_100010D88;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000201E8 + dword_1000201E8);
  return v9(v2, v3, v4, v5);
}

uint64_t sub_100010A94(uint64_t a1)
{
  uint64_t v2 = sub_10000C5F0(&qword_1000201D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100010AF4()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100010B2C()
{
  sub_10000D1A4();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  char v5 = (void *)sub_100010E64(v4);
  void *v5 = v6;
  v5[1] = sub_100010BDC;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000201F8 + dword_1000201F8);
  return v7(v2, v3);
}

uint64_t sub_100010BDC()
{
  sub_100010EDC();
  sub_10000D154();
  uint64_t v1 = *v0;
  sub_10000D194();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000D1F0();
  return v3();
}

uint64_t sub_100010CA0()
{
  _Block_release(*(const void **)(v0 + 32));
  uint64_t v1 = sub_100010F00();
  return _swift_deallocObject(v1, v2, v3);
}

uint64_t sub_100010CE8()
{
  sub_100010ED0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_100010E64(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_100010BDC;
  uint64_t v3 = sub_100010DF4();
  return v4(v3);
}

char *sub_100010DA8@<X0>(int64_t a1@<X8>)
{
  return sub_100010668((char *)(v1 > 1), a1, 1);
}

char *sub_100010DD0()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_100010668(0, v2, 1);
}

uint64_t sub_100010DF4()
{
  return v0;
}

uint64_t sub_100010E14()
{
  return v0;
}

uint64_t sub_100010E2C(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

void sub_100010E38(uint64_t a1@<X8>)
{
  *(void *)(v1 + 16) = a1;
  *(void *)(v1 + 8 * v3 + 32) = v2;
}

uint64_t sub_100010E64(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_100010E70()
{
  return sub_1000116C0();
}

uint64_t sub_100010E94()
{
  return sub_1000116C0();
}

void sub_100010EB8()
{
  *(void *)(v0 - 72) = 0xED00006C6C69662ELL;
}

uint64_t sub_100010F00()
{
  return v0;
}

uint64_t sub_100010F24()
{
  return v0;
}

void PPConfigureAmbientPosterDescriptor(void *a1, unsigned int a2, int a3, int a4, void *a5, void *a6)
{
  id v14 = a1;
  id v11 = a5;
  id v12 = a6;
  if (objc_opt_respondsToSelector()) {
    [v14 setAmbientSupportedDataLayout:1];
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [objc_alloc(NSClassFromString(@"PRMutablePosterAmbientConfiguration")) initWithSupportedDataLayout:1 creationBehavior:a2 editingBehavior:a3 ^ 1u deletionBehavior:a4 ^ 1u];
    if (objc_opt_respondsToSelector()) {
      [v13 setDisplayNameSystemSymbolName:v11];
    }
    if (objc_opt_respondsToSelector()) {
      [v13 setNeedsAuthentication:1];
    }
    if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v13 setEditingSystemSymbolName:v12];
    }
    [v14 setAmbientConfiguration:v13];
  }
}

void PPPosterPreferencesSetHideChrome(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (objc_opt_respondsToSelector()) {
    [v3 setHideChrome:a2];
  }
}

id PPPosterPreferencesIsChromeHidden(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    id v2 = [v1 hideChrome];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id PPAmbientPosterEnvironmentFromRenderingEnvironment(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    id v2 = [v1 ambientEnvironment];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

uint64_t PPPosterTitleAlignmentFromEnvironment(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = (uint64_t)[v1 titleAlignment];
  }
  else {
    uint64_t v2 = 2;
  }

  return v2;
}

uint64_t PPPosterBoundingShapeFromEnvironment(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = (uint64_t)[v1 boundingShape];
  }
  else {
    uint64_t v2 = -1;
  }

  return v2;
}

void PPPresentTitledViewControllerInEditor(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  if (objc_opt_respondsToSelector()) {
    [v3 presentTitledViewController:v4 animated:1 completion:0];
  }
  else {
    [v3 presentViewController:v4 animated:1 completion:0];
  }
}

double PPSafeAreaBoundsForEditor(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    [v1 safeAreaBounds];
    double x = v2;
  }
  else
  {
    double x = CGRectNull.origin.x;
  }

  return x;
}

uint64_t sub_100011380()
{
  return _convertErrorToNSError(_:)();
}

void sub_100011390(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000113A0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000113B0()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000113C0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_1000113D0()
{
  return UUID.init()();
}

uint64_t sub_1000113E0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000113F0()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_100011400()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100011410()
{
  return AmbientPhotoFrameLog.getter();
}

uint64_t sub_100011420()
{
  return AmbientPhotoFrameController.rendererDidInvalidate(_:)();
}

uint64_t sub_100011430()
{
  return AmbientPhotoFrameController.init(renderer:photoLibrary:)();
}

uint64_t sub_100011440()
{
  return AmbientPhotoFrameController.renderer(_:didReceiveTapAt:)();
}

uint64_t sub_100011450()
{
  return AmbientPhotoFrameController.renderer(_:didInitializeWith:)();
}

uint64_t sub_100011460()
{
  return AmbientPhotoFrameController.renderer(_:didUpdate:with:)();
}

uint64_t sub_100011470()
{
  return type metadata accessor for AmbientPhotoFrameController();
}

uint64_t sub_100011480()
{
  return static AmbientPhotoFrameDataSource.areAssetsAvailableForSingleSmartAlbumType(library:smartAlbumType:)();
}

uint64_t sub_100011490()
{
  return type metadata accessor for AmbientPhotoFrameDataSource();
}

uint64_t sub_1000114A0()
{
  return AmbientPhotoFramePosterKind.isEditable.getter();
}

uint64_t sub_1000114B0()
{
  return AmbientPhotoFramePosterKind.isDeletable.getter();
}

uint64_t sub_1000114C0()
{
  return AmbientPhotoFramePosterKind.associatedShuffleSmartAlbums.getter();
}

uint64_t sub_1000114D0()
{
  return AmbientPhotoFramePosterKind.isConfigurationCreatedByUser.getter();
}

uint64_t sub_1000114E0()
{
  return static AmbientPhotoFramePosterKind.== infix(_:_:)();
}

uint64_t sub_1000114F0()
{
  return static AmbientPhotoFramePosterKind.allCases.getter();
}

uint64_t sub_100011500()
{
  return type metadata accessor for AmbientPhotoFramePosterKind();
}

uint64_t sub_100011510()
{
  return AmbientPhotoFrameEditorController.editorDidInvalidate(_:)();
}

uint64_t sub_100011520()
{
  return AmbientPhotoFrameEditorController.init(editor:photoLibrary:)();
}

uint64_t sub_100011530()
{
  return AmbientPhotoFrameEditorController.editor(_:populateViews:for:)();
}

uint64_t sub_100011540()
{
  return AmbientPhotoFrameEditorController.editor(_:didInitializeWith:)();
}

uint64_t sub_100011550()
{
  return AmbientPhotoFrameEditorController.editor(_:finalizeWithCompletion:)();
}

uint64_t sub_100011560()
{
  return AmbientPhotoFrameEditorController.editor(_:didUpdate:with:)();
}

uint64_t sub_100011570()
{
  return type metadata accessor for AmbientPhotoFrameEditorController();
}

uint64_t sub_100011580()
{
  return static AmbientPhotoFramePosterDescriptor.descriptorIdentifierForPosterKind(_:)();
}

uint64_t sub_100011590()
{
  return static AmbientPhotoFramePosterDescriptor.currentVersion.getter();
}

uint64_t sub_1000115A0()
{
  return AmbientPhotoFramePosterDescriptor.contentConfiguration.getter();
}

uint64_t sub_1000115B0()
{
  return static AmbientPhotoFramePosterDescriptor.descriptorFileExists(inDirectory:)();
}

uint64_t sub_1000115C0()
{
  return AmbientPhotoFramePosterDescriptor.init(kind:contentConfiguration:identifier:version:)();
}

uint64_t sub_1000115D0()
{
  return AmbientPhotoFramePosterDescriptor.kind.getter();
}

uint64_t sub_1000115E0()
{
  return static AmbientPhotoFramePosterDescriptor.load(fromDirectory:)();
}

uint64_t sub_1000115F0()
{
  return AmbientPhotoFramePosterDescriptor.save(toDirectory:)();
}

uint64_t sub_100011600()
{
  return type metadata accessor for AmbientPhotoFramePosterDescriptor();
}

uint64_t sub_100011610()
{
  return static AmbientPhotoFramePosterConfiguration.currentVersion.getter();
}

uint64_t sub_100011620()
{
  return static AmbientPhotoFramePosterConfiguration.configurationFileExists(inDirectory:)();
}

uint64_t sub_100011630()
{
  return AmbientPhotoFramePosterConfiguration.init(kind:contentConfiguration:version:identifier:)();
}

uint64_t sub_100011640()
{
  return static AmbientPhotoFramePosterConfiguration.load(fromDirectory:)();
}

uint64_t sub_100011650()
{
  return type metadata accessor for AmbientPhotoFramePosterConfiguration();
}

uint64_t sub_100011660()
{
  return static AmbientPhotoFrameContentConfiguration.defaultContentConfigurationForPosterKind(kind:photoLibrary:)();
}

uint64_t sub_100011670()
{
  return type metadata accessor for AmbientPhotoFrameContentConfiguration();
}

uint64_t sub_100011680()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100011690()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_1000116A0()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_1000116B0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_1000116C0()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_1000116D0()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_1000116E0()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_1000116F0()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_100011700()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100011710()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_100011720()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100011730()
{
  return PRRenderingConfiguration.init(_:)();
}

uint64_t sub_100011740()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_100011750()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100011760()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100011770()
{
  return String.hash(into:)();
}

void sub_100011780(Swift::String a1)
{
}

Swift::Int sub_100011790()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000117A0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000117B0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000117C0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000117D0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000117E0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000117F0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100011800()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100011810()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100011820()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100011830()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100011840()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100011850()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100011860()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100011870()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100011880()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_100011890()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_1000118A0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_1000118B0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000118C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000118D0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_1000118F0(Swift::Int a1)
{
}

uint64_t sub_100011900()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100011910()
{
  return StaticString.description.getter();
}

uint64_t sub_100011920()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100011930()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100011940()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100011950()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100011960()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100011980()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100011990()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1000119A0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000119B0()
{
  return Hasher._finalize()();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return _swift_dynamicCastObjCProtocolUnconditional();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend_ambientEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 ambientEnvironment];
}

id objc_msgSend_boundingShape(void *a1, const char *a2, ...)
{
  return _[a1 boundingShape];
}

id objc_msgSend_hideChrome(void *a1, const char *a2, ...)
{
  return _[a1 hideChrome];
}

id objc_msgSend_initWithSupportedDataLayout_creationBehavior_editingBehavior_deletionBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:");
}

id objc_msgSend_presentTitledViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentTitledViewController:animated:completion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_safeAreaBounds(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaBounds];
}

id objc_msgSend_setAmbientConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAmbientConfiguration:");
}

id objc_msgSend_setAmbientSupportedDataLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAmbientSupportedDataLayout:");
}

id objc_msgSend_setDisplayNameSystemSymbolName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayNameSystemSymbolName:");
}

id objc_msgSend_setEditingSystemSymbolName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditingSystemSymbolName:");
}

id objc_msgSend_setHideChrome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHideChrome:");
}

id objc_msgSend_setNeedsAuthentication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsAuthentication:");
}

id objc_msgSend_titleAlignment(void *a1, const char *a2, ...)
{
  return _[a1 titleAlignment];
}