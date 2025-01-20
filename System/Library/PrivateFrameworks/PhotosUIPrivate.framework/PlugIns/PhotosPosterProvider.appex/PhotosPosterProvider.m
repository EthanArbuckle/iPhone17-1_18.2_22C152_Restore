uint64_t sub_100002368()
{
  uint64_t result;
  uint64_t v1;

  result = sub_100028CE0();
  qword_10003DB48 = result;
  unk_10003DB50 = v1;
  return result;
}

uint64_t sub_100002398()
{
  return swift_release();
}

uint64_t sub_10000246C@<X0>(uint64_t *a1@<X8>)
{
  sub_100028C50();
  swift_allocObject();
  sub_100028C60();
  sub_100028C20();
  swift_allocObject();
  sub_100028C30();
  uint64_t v2 = sub_100002598();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v2;
  return result;
}

id sub_100002528()
{
  return sub_100002558(type metadata accessor for PosterRenderer);
}

id sub_100002540()
{
  return sub_100002558(type metadata accessor for PosterEditor);
}

id sub_100002558(uint64_t (*a1)(void))
{
  id v1 = objc_allocWithZone((Class)a1(0));
  return [v1 init];
}

uint64_t sub_100002598()
{
  sub_100009C74(&qword_10003D3F0);
  sub_100028BA0();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10002A550;
  sub_100028C50();
  sub_10000B8A0(&qword_10003D3F8, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  sub_100028B90();
  sub_100028C20();
  sub_10000B8A0(&qword_10003D400, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_100028B90();
  return v0;
}

uint64_t sub_100002740(uint64_t a1)
{
  return sub_10000C1CC(a1, OBJC_IVAR____TtC20PhotosPosterProvider14PosterRenderer_controller);
}

uint64_t sub_10000274C(uint64_t a1)
{
  return sub_10000C1CC(a1, OBJC_IVAR____TtC20PhotosPosterProvider14PosterRenderer_renderingEnvironment);
}

uint64_t sub_100002758(uint64_t a1)
{
  return sub_100004428(a1, 0x6552726574736F50, 0xEE0072657265646ELL, &qword_10003DB58);
}

void sub_100002784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, uint64_t a6, void *a7, void *a8)
{
  sub_100028EC0();
  if (qword_10003CA28 != -1) {
    swift_once();
  }
  sub_100028BF0();
  v11 = (objc_class *)type metadata accessor for RenderingEnvironment();
  v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment] = a6;
  v18.receiver = v12;
  v18.super_class = v11;
  swift_unknownObjectRetain();
  id v13 = objc_msgSendSuper2(&v18, "init");
  sub_10000274C((uint64_t)v13);
  v14 = *(void **)&a5[OBJC_IVAR____TtC20PhotosPosterProvider14PosterRenderer_controller];
  if (v14)
  {
    uint64_t v15 = *(void *)&a5[OBJC_IVAR____TtC20PhotosPosterProvider14PosterRenderer_renderingEnvironment];
    if (v15)
    {
      [v14 renderer:a7 didUpdateEnvironment:v15 withTransition:a8];
      sub_100028EB0();
      sub_100028BF0();

      swift_unknownObjectRelease();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100002920(void *a1, uint64_t a2)
{
  id v6 = a1;
  id v4 = v2;
  swift_unknownObjectRetain();
  sub_100028EC0();
  if (qword_10003CA28 != -1) {
    swift_once();
  }
  sub_10000C48C();
  sub_100002A44(v6, (uint64_t)v4, a2);
  sub_100028EB0();
  sub_10000C48C();
  swift_unknownObjectRelease();
}

void sub_100002A44(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100028B50();
  __chkstk_darwin();
  id v6 = [a1 backgroundView];
  id v7 = [self blackColor];
  [v6 setBackgroundColor:v7];

  v8 = (objc_class *)type metadata accessor for RenderingEnvironment();
  v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment] = a3;
  v14.receiver = v9;
  v14.super_class = v8;
  swift_unknownObjectRetain();
  id v10 = objc_msgSendSuper2(&v14, "init");
  sub_10000274C((uint64_t)v10);
  sub_10000BAE8(0, (unint64_t *)&unk_10003D440);
  id v11 = objc_msgSend(self, "systemPhotoLibraryURL", v14.receiver, v14.super_class);
  sub_100028B20();

  id v12 = sub_10000C4E4();
  sub_100002740((uint64_t)[objc_allocWithZone((Class)PUWallpaperPosterController) initWithRenderer:a1 photoLibrary:v12]);
  id v13 = *(void **)(a2 + OBJC_IVAR____TtC20PhotosPosterProvider14PosterRenderer_controller);
  if (v13)
  {
    if (*(void *)(a2 + OBJC_IVAR____TtC20PhotosPosterProvider14PosterRenderer_renderingEnvironment))
    {
      objc_msgSend(v13, "renderer:didInitializeWithEnvironment:", a1);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100002C4C(void *a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v7 = v3;
  swift_unknownObjectRetain();
  id v8 = a1;
  sub_10000C42C();
  sub_100002784(v9, v10, v11, v12, v13, v14, v15, a3);
}

void sub_100002CD4(void *a1)
{
  id v6 = v1;
  id v3 = a1;
  sub_100028EC0();
  if (qword_10003CA28 != -1) {
    swift_once();
  }
  sub_10000C3E0();
  v5 = *(void **)&v6[OBJC_IVAR____TtC20PhotosPosterProvider14PosterRenderer_controller];
  if (v5)
  {
    [v5 rendererDidInvalidate:v3];
    sub_100002740(0);
    sub_100028EB0();
    sub_10000C3E0();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100002E60(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_100002E80, 0, 0);
}

void *sub_100002E80()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = *(id *)(v0 + 24);
  id v3 = v1;
  sub_100028EC0();
  if (qword_10003CA28 != -1) {
    swift_once();
  }
  uint64_t v4 = *(void *)(v0 + 24);
  sub_10000C454();
  uint64_t result = *(void **)(v4 + OBJC_IVAR____TtC20PhotosPosterProvider14PosterRenderer_controller);
  if (result)
  {
    id v7 = *(void **)(v0 + 16);
    id v8 = *(void **)(v0 + 24);
    [result rendererShouldDropExcessResources:v7];
    sub_100028EB0();
    sub_10000C454();

    sub_10000C3B4();
    return (void *)v9();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100002FD0(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  id v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *id v7 = v3;
  v7[1] = sub_100003094;
  return sub_100002E60((uint64_t)v6);
}

uint64_t sub_100003094()
{
  sub_10000C288();
  sub_10000C1AC();
  id v2 = (void (**)(void))v1[4];
  id v3 = (void *)v1[3];
  uint64_t v4 = (void *)v1[2];
  uint64_t v5 = *v0;
  sub_10000C278();
  *id v6 = v5;
  swift_task_dealloc();

  v2[2](v2);
  _Block_release(v2);
  sub_10000C3B4();
  return v7();
}

id sub_10000320C(uint64_t a1)
{
  return sub_10000C248(a1, (uint64_t (*)(void))type metadata accessor for PosterRenderer);
}

id sub_100003274()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment) isSnapshot];
}

id sub_1000032D4()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment) isPreview];
}

uint64_t sub_100003308()
{
  return 0;
}

uint64_t sub_100003344()
{
  return PPPosterEnvironmentIsCallServices(*(void **)(v0
                                                    + OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment));
}

uint64_t sub_10000339C()
{
  return sub_10000C390(OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment);
}

uint64_t sub_1000034A8@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment), "contents"), "assetDirectory");
  swift_unknownObjectRelease();
  sub_100028B20();

  uint64_t v4 = sub_100028B50();
  return sub_10000B9B0(a1, 0, 1, v4);
}

uint64_t sub_100003580()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment);
  id v2 = [v1 traitCollection];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = (uint64_t)[v2 _backlightLuminance];
  }
  else
  {
    uint64_t v4 = -1;
  }
  unsigned int v5 = PPPosterRenderingEnvironmentIsLowLuminance(v1);
  uint64_t v6 = 2;
  if (v4 != 1) {
    uint64_t v6 = v4;
  }
  if (v5) {
    return 1;
  }
  else {
    return v6;
  }
}

id sub_10000363C()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment) significantEventsCounter];
}

uint64_t sub_100003688()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment) contents];
  self;
  if (sub_10000C474())
  {
    swift_unknownObjectRelease();
    return 1;
  }
  else
  {
    self;
    BOOL v3 = sub_10000C474() != 0;
    swift_unknownObjectRelease();
    return 2 * v3;
  }
}

id sub_100003728()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment) floatingObscurableBounds];
}

id sub_100003774()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment) deviceOrientation];
}

id sub_10000378C(uint64_t a1)
{
  return sub_10000C388(a1, OBJC_IVAR____TtC20PhotosPosterProvider20RenderingEnvironment_posterKitEnvironment);
}

void sub_1000037B4()
{
}

id sub_1000037EC(uint64_t a1)
{
  return sub_100003804(a1, type metadata accessor for RenderingEnvironment);
}

id sub_100003804(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

id sub_100003848()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider20InvalidatableWrapper_invalidatable) invalidate];
}

void sub_1000038A8()
{
}

id sub_1000038E0(uint64_t a1)
{
  return sub_100003804(a1, type metadata accessor for InvalidatableWrapper);
}

uint64_t PRRenderer.px_updatePreferences(_:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = v2;
  uint64_t v6 = sub_10000C400();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = sub_10000C400();
  *(void *)(v7 + 16) = sub_100003AD8;
  *(void *)(v7 + 24) = v6;
  v10[4] = sub_10000C194;
  v10[5] = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100003AE4;
  v10[3] = &unk_100034E80;
  id v8 = _Block_copy(v10);
  swift_retain();
  swift_release();
  [v3 updatePreferences:v8];
  _Block_release(v8);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v3) {
    __break(1u);
  }
  return result;
}

void sub_100003A4C(uint64_t a1, uint64_t a2, void (*a3)(id, uint64_t))
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for MutablePosterRenderingPreferences());
  uint64_t v6 = swift_unknownObjectRetain();
  id v7 = sub_100003D74(v6);
  a3(v7, a2);
}

void sub_100003AD8(uint64_t a1, uint64_t a2)
{
  sub_100003A4C(a1, a2, *(void (**)(id, uint64_t))(v2 + 16));
}

uint64_t sub_100003AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003AF8()
{
  return swift_release();
}

Swift::Void __swiftcall PRRenderer.px_noteContentSignificantlyChanged()()
{
  [v0 noteContentSignificantlyChanged];
}

id PRRenderer.px_extendRenderSession(forReason:)()
{
  NSString v1 = sub_100028CB0();
  id v2 = [v0 extendRenderingSessionForReason:v1];

  id v3 = [v2 assertion];
  objc_super v4 = (objc_class *)type metadata accessor for InvalidatableWrapper();
  id v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC20PhotosPosterProvider20InvalidatableWrapper_invalidatable] = v3;
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

uint64_t sub_100003D2C()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_userTapEventsRequested);
}

uint64_t sub_100003D64(uint64_t result)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_userTapEventsRequested) = result;
  return result;
}

id sub_100003D74(uint64_t a1)
{
  v1[OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_userTapEventsRequested] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_posterKitPreferences] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for MutablePosterRenderingPreferences();
  return objc_msgSendSuper2(&v3, "init");
}

id sub_100003E04()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_posterKitPreferences) timeFont];
  return v1;
}

void sub_100003EA0()
{
  sub_10000C3CC();
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_posterKitPreferences), "setTimeFont:");
}

id sub_100003F30()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_posterKitPreferences) timeColor];
  return v1;
}

void sub_100003FCC()
{
  sub_10000C3CC();
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_posterKitPreferences), "setTimeColor:");
}

id sub_10000405C()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_posterKitPreferences) statusBarTintColor];
  return v1;
}

void sub_1000040F8()
{
  sub_10000C3CC();
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_posterKitPreferences), "setStatusBarTintColor:");
}

id sub_100004178()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_posterKitPreferences) significantEventTime];
}

id sub_1000041E4(uint64_t a1)
{
  return [*(id *)(v1 + OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_posterKitPreferences) setSignificantEventTime:a1];
}

unint64_t sub_100004234()
{
  unint64_t result = (unint64_t)[*(id *)(v0+ OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_posterKitPreferences) significantEventOptions];
  if (result > 4 || ((1 << result) & 0x16) == 0)
  {
    unint64_t result = sub_10000C1EC();
    __break(1u);
  }
  return result;
}

id sub_1000042FC(unint64_t a1)
{
  if (a1 <= 4 && ((1 << a1) & 0x16) != 0)
  {
    objc_super v3 = *(void **)(v1 + OBJC_IVAR____TtC20PhotosPosterProvider33MutablePosterRenderingPreferences_posterKitPreferences);
    return [v3 setSignificantEventOptions:a1];
  }
  else
  {
    id result = (id)sub_10000C1EC();
    __break(1u);
  }
  return result;
}

void sub_10000438C()
{
}

id sub_1000043C4(uint64_t a1)
{
  return sub_100003804(a1, type metadata accessor for MutablePosterRenderingPreferences);
}

uint64_t sub_1000043E8(uint64_t a1)
{
  return sub_10000C1CC(a1, OBJC_IVAR____TtC20PhotosPosterProvider12PosterEditor_controller);
}

uint64_t sub_1000043F4(uint64_t a1)
{
  return sub_10000C1CC(a1, OBJC_IVAR____TtC20PhotosPosterProvider12PosterEditor_editingEnvironment);
}

uint64_t sub_100004400(uint64_t a1)
{
  return sub_100004428(a1, 0x6445726574736F50, 0xEC000000726F7469, &qword_10003DB60);
}

uint64_t sub_100004428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (qword_10003CA20 != -1) {
    swift_once();
  }
  sub_10000BAE8(0, &qword_10003D870);
  swift_bridgeObjectRetain();
  uint64_t result = sub_100028F00();
  *a4 = result;
  return result;
}

void sub_1000044DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_100028BF0();
  sub_100005880((uint64_t)a5, (uint64_t)a6, a7);
  if (!v7)
  {
    sub_100028EB0();
    sub_100028BF0();
  }
  swift_unknownObjectRelease();
}

void sub_100004624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_100028BF0();
  uint64_t v14 = OBJC_IVAR____TtC20PhotosPosterProvider12PosterEditor_editingEnvironment;
  uint64_t v15 = *(void **)&a5[OBJC_IVAR____TtC20PhotosPosterProvider12PosterEditor_editingEnvironment];
  if (v15)
  {
    v16 = v13;
    swift_unknownObjectRetain();
    id v17 = v15;
    sub_100009E68(a6);

    id v18 = sub_10000570C();
    uint64_t v19 = *(void *)&a5[v14];
    if (v19)
    {
      v20 = v18;
      [v18 editor:a10 didUpdateEnvironment:v19 withTransition:a11];

      sub_100028EB0();
      sub_100028BF0();

      swift_unknownObjectRelease();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_1000047BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9)
{
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_100028BF0();
  sub_100006B38(a5, a6, a7, (uint64_t)a8, (uint64_t)a9);
  if (!v14)
  {
    sub_100028EB0();
    sub_100028BF0();
  }
}

id sub_1000048F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_100028BF0();
  uint64_t v11 = a5;
  id v12 = sub_10000570C();
  id v13 = [v12 editorShouldBeginFinalization:a9];

  sub_100028EB0();
  sub_100028BF0();

  return v13;
}

void *sub_100004A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_100028BF0();
  sub_100006CEC(a9, &v13);
  if (v12)
  {
  }
  else
  {
    sub_100028EB0();
    sub_100028BF0();

    a5 = v13;
  }
  return a5;
}

uint64_t sub_100004BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_100028BF0();
  id v10 = sub_10000570C();
  id v11 = [v10 initialLookIdentifierForEditor:a9];
  uint64_t v12 = sub_100028CE0();

  sub_100028EB0();
  sub_100028BF0();

  return v12;
}

double sub_100004D00(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_100028BF0();
  id v19 = sub_10000570C();
  objc_msgSend(v19, "editor:luminanceForLook:inRect:", a13, a14, a1, a2, a3, a4);
  double v21 = v20;

  sub_100028EB0();
  sub_100028BF0();

  return v21;
}

uint64_t sub_100004E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, SEL *a10)
{
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_100028BF0();
  uint64_t v12 = a5;
  id v13 = sub_10000570C();
  id v14 = objc_msgSend(v13, *a10, a9);
  if (v14)
  {
    uint64_t v15 = v14;
    sub_10000BAE8(0, &qword_10003D420);
    uint64_t v16 = sub_100028D60();
  }
  else
  {

    uint64_t v16 = 0;
  }
  sub_100028EB0();
  sub_100028BF0();

  return v16;
}

id sub_10000502C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, SEL *a10)
{
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_100028BF0();
  id v11 = sub_10000570C();
  id v12 = objc_msgSend(v11, *a10, a9);

  sub_100028EB0();
  sub_100028BF0();

  return v12;
}

uint64_t sub_100005188()
{
  sub_10000C4AC();
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = v0;
  *(void *)(v1 + 24) = v3;
  *(void *)(v1 + 32) = v4;
  *(unsigned char *)(v1 + 120) = v5;
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 56) = sub_100028DF0();
  *(void *)(v1 + 64) = sub_100028DE0();
  uint64_t v8 = sub_100028DC0();
  *(void *)(v1 + 72) = v8;
  *(void *)(v1 + 80) = v7;
  return _swift_task_switch(sub_10000522C, v8, v7);
}

uint64_t sub_10000522C()
{
  sub_10000C288();
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  *(void *)(v0 + 88) = OBJC_IVAR____TtC20PhotosPosterProvider12PosterEditor_signpostID;
  long long v4 = *(_OWORD *)(v0 + 32);
  sub_100028BF0();
  *(void *)(v0 + 96) = sub_100028DE0();
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  *(_OWORD *)(v1 + 16) = v4;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000053A0;
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_1000053A0()
{
  sub_10000C288();
  sub_10000C230();
  uint64_t v2 = *v1;
  sub_10000C278();
  void *v3 = v2;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 72);
  return _swift_task_switch(sub_1000054D0, v5, v4);
}

uint64_t sub_1000054D0()
{
  swift_release();
  sub_100028EB0();
  sub_100028BF0();
  sub_10000C3B4();
  return v0();
}

void sub_100005578(uint64_t a1, void (*a2)(uint64_t (*)(), uint64_t))
{
  uint64_t v4 = sub_100009C74(&qword_10003D470);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  a2(sub_10000BC0C, v9);
  swift_release();
}

uint64_t sub_1000056D8()
{
  return sub_100028DD0();
}

id sub_10000570C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider12PosterEditor_controller);
  if (v1)
  {
    return v1;
  }
  else
  {
    sub_100028FB0(64);
    v4._object = (void *)0x800000010002C470;
    v4._countAndFlagsBits = 0xD00000000000003ELL;
    sub_100028D10(v4);
    v5._countAndFlagsBits = sub_100028FD0();
    sub_100028D10(v5);
    swift_bridgeObjectRelease();
    id result = (id)sub_100029090();
    __break(1u);
  }
  return result;
}

void sub_1000057FC(void *a1, void *a2)
{
  swift_getObjectType();
  id v5 = a1;
  id v6 = v2;
  swift_unknownObjectRetain();
  sub_1000044DC((uint64_t)"PosterEditor.Initialize", 23, 2, (uint64_t)v6, v5, v6, a2);
}

void sub_100005880(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_100028B50();
  __chkstk_darwin(v6 - 8);
  sub_10000BAE8(0, (unint64_t *)&unk_10003D440);
  id v7 = [self systemPhotoLibraryURL];
  sub_100028B20();

  id v8 = sub_10000C4E4();
  id v9 = [objc_allocWithZone((Class)PUWallpaperPosterEditorController) initWithWallpaperEditor:a1 photoLibrary:v8];
  id v10 = v9;
  sub_1000043E8((uint64_t)v9);
  uint64_t v11 = sub_1000059EC(a3);
  sub_1000043F4(v11);
  if (*(void *)(a2 + OBJC_IVAR____TtC20PhotosPosterProvider12PosterEditor_editingEnvironment))
  {
    objc_msgSend(v10, "editor:didInitializeWithEnvironment:", a1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000059EC(void *a1)
{
  uint64_t v2 = sub_100028B80();
  sub_10000C214();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  id v7 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_100028B50();
  sub_10000C214();
  uint64_t v83 = v8;
  uint64_t v10 = __chkstk_darwin(v9);
  id v12 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  v84 = (char *)&v77 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v82 = (char *)&v77 - v16;
  __chkstk_darwin(v15);
  id v18 = (char *)&v77 - v17;
  id v19 = [a1 targetConfiguration];
  id v20 = [v19 assetDirectory];

  v81 = v18;
  sub_100028B20();

  p_ivar_base_size = (objc_class *)&PosterUpdater.Serializer.ivar_base_size;
  v22 = [a1 sourceContents];
  self;
  uint64_t v23 = swift_dynamicCastObjCClass();
  if (!v23)
  {
    id v78 = (id)v2;
    v80 = v12;
    self;
    uint64_t v35 = swift_dynamicCastObjCClass();
    if (!v35) {
      goto LABEL_20;
    }
    v36 = (void *)v35;
    swift_unknownObjectRetain();
    id v37 = [v36 assetDirectory];
    uint64_t v38 = (uint64_t)v80;
    sub_100028B20();

    id v39 = sub_100008544(v36, 0, 1);
    v79 = v22;
    if (v39)
    {
      v40 = v39;
      uint64_t v41 = (uint64_t)v82;
      uint64_t v42 = v83;
      v43 = *(void (**)(void))(v83 + 16);
      uint64_t v44 = v85;
      sub_10000C2B8();
      v43();
      uint64_t v45 = (uint64_t)v84;
      v46 = v81;
      sub_10000C2B8();
      v43();
      id v47 = objc_allocWithZone((Class)type metadata accessor for EditingEnvironment(0));
      swift_unknownObjectRetain();
      id v48 = v40;
      id v34 = sub_100009E80((uint64_t)a1, (uint64_t)v48, v41, v45, &OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_sourcePosterConfiguration, &OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterDescriptor);

LABEL_7:
      swift_unknownObjectRelease_n();
      v49 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
      v49(v38, v44);
      v49((uint64_t)v46, v44);
      return (uint64_t)v34;
    }
    id v50 = [a1 sourceContents];
    self;
    uint64_t v51 = swift_dynamicCastObjCClass();
    if (v51)
    {
      id v37 = (id)v51;
      p_ivar_base_size = (objc_class *)type metadata accessor for EditingEnvironment(0);
      if (sub_10000A4B0(v37))
      {
        id v52 = [objc_allocWithZone((Class)PFPosterConfiguration) initWithConfigurationType:0];
        uint64_t v77 = (uint64_t)v52;
        [v52 setOptions:2];
        sub_100009C74(&qword_10003D450);
        uint64_t v53 = swift_allocObject();
        *(_OWORD *)(v53 + 16) = xmmword_10002A560;
        sub_100028B70();
        uint64_t v54 = sub_100028B60();
        uint64_t v56 = v55;
        (*(void (**)(char *, id))(v4 + 8))(v7, v78);
        id v57 = objc_allocWithZone((Class)PFPosterMedia);
        *(void *)(v53 + 32) = sub_10001D8DC(v54, v56);
        uint64_t v86 = v53;
        sub_100028D80();
        sub_100025478(v86, v52);
        uint64_t v42 = v83;
        v58 = *(void (**)(void))(v83 + 16);
        id v78 = v50;
        uint64_t v59 = (uint64_t)v82;
        uint64_t v38 = (uint64_t)v80;
        v60 = p_ivar_base_size;
        uint64_t v44 = v85;
        sub_10000C2B8();
        v58();
        uint64_t v61 = (uint64_t)v84;
        v46 = v81;
        sub_10000C2B8();
        v58();
        id v62 = objc_allocWithZone(v60);
        uint64_t v63 = swift_unknownObjectRetain();
        id v34 = sub_100009E80(v63, v77, v59, v61, &OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_sourcePosterConfiguration, &OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterDescriptor);
        swift_unknownObjectRelease();
        goto LABEL_7;
      }
    }
    swift_unknownObjectRelease();
    id v64 = sub_100008544(v36, 0, 1);
    v65 = v80;
    if (v64)
    {
      id v66 = v64;
      v67 = PPPosterOverrideConfigurationFromConfiguration(v36);
      swift_unknownObjectRelease();
      if (v67)
      {
        objc_msgSend(v66, "setOptions:", (unint64_t)objc_msgSend(v66, "options") | 8);
        uint64_t v68 = sub_10000C250();
        ((void (*)(uint64_t))p_ivar_base_size)(v68);
        uint64_t v69 = sub_10000C2D8();
        ((void (*)(uint64_t))p_ivar_base_size)(v69);
        objc_allocWithZone((Class)type metadata accessor for EditingEnvironment(0));
        uint64_t v70 = swift_unknownObjectRetain();
        v71 = &OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_sourcePosterConfiguration;
        v72 = &OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterDescriptor;
        goto LABEL_16;
      }
    }
    sub_10000BAE8(0, &qword_10003D8E0);
    id v66 = sub_10000C724(101);
    uint64_t v73 = sub_10000C250();
    ((void (*)(uint64_t))p_ivar_base_size)(v73);
    uint64_t v74 = sub_10000C2D8();
    ((void (*)(uint64_t))p_ivar_base_size)(v74);
    objc_allocWithZone((Class)type metadata accessor for EditingEnvironment(0));
    uint64_t v70 = swift_unknownObjectRetain();
    v71 = &OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterDescriptor;
    v72 = &OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_sourcePosterConfiguration;
LABEL_16:
    id v34 = sub_100009E80(v70, (uint64_t)v66, (uint64_t)v50, v38, v71, v72);
    swift_unknownObjectRelease_n();
    v75 = (void (*)(char *, id))v22[1];
    v75(v65, v37);
    v75((char *)v4, v37);
    return (uint64_t)v34;
  }
  v24 = (void *)v23;
  swift_unknownObjectRetain();
  id v25 = sub_100008070(v24);
  if (v25)
  {
    uint64_t v26 = (uint64_t)v25;
    swift_unknownObjectRetain();
    id v27 = [v24 assetDirectory];
    uint64_t v28 = (uint64_t)v82;
    sub_100028B20();

    uint64_t v30 = v83;
    uint64_t v29 = (uint64_t)v84;
    v31 = v81;
    uint64_t v32 = v85;
    (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v84, v81, v85);
    id v33 = objc_allocWithZone((Class)type metadata accessor for EditingEnvironment(0));
    id v34 = sub_100009E80((uint64_t)a1, v26, v28, v29, &OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterDescriptor, &OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_sourcePosterConfiguration);
    swift_unknownObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
    return (uint64_t)v34;
  }
  __break(1u);
LABEL_20:
  uint64_t result = sub_100029090();
  __break(1u);
  return result;
}

void sub_10000613C(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(id, uint64_t))
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a1;
  sub_10000C3CC();
  a5(v8, a4);

  swift_unknownObjectRelease();
}

void sub_1000061C0(void *a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v7 = v3;
  swift_unknownObjectRetain();
  id v15 = a1;
  LOBYTE(v14) = 2;
  sub_10000C42C();
  sub_100004624(v8, v9, v10, v11, v12, v13, v8, 19, v14, v15, a3);
}

void sub_100006254(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void (*a6)(id, uint64_t, void *))
{
  id v10 = a3;
  swift_unknownObjectRetain();
  id v11 = a5;
  id v12 = a1;
  a6(v10, a4, a5);

  swift_unknownObjectRelease();
}

uint64_t sub_1000062F8()
{
  sub_10000C4AC();
  v1[2] = v2;
  v1[3] = v0;
  sub_100028DF0();
  v1[4] = sub_100028DE0();
  uint64_t v4 = sub_100028DC0();
  v1[5] = v4;
  v1[6] = v3;
  return _swift_task_switch(sub_10000638C, v4, v3);
}

uint64_t sub_10000638C()
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
  v6[1] = sub_10000649C;
  return sub_100005188();
}

uint64_t sub_10000649C()
{
  sub_10000C288();
  sub_10000C230();
  uint64_t v2 = *v1;
  sub_10000C278();
  void *v3 = v2;
  swift_task_dealloc();
  swift_release();
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 40);
  return _swift_task_switch(sub_1000065B0, v5, v4);
}

uint64_t sub_1000065B0()
{
  sub_10000C4AC();
  swift_release();
  sub_10000C3B4();
  return v0();
}

void sub_100006608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v10 = sub_10000570C();
  v12[4] = a1;
  v12[5] = a2;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000C6E0;
  v12[3] = &unk_100034F68;
  id v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v10 editor:a7 finalizeWithCompletion:v11];
  _Block_release(v11);
}

uint64_t sub_10000670C(void *a1, int a2, void *a3, void *aBlock)
{
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  id v8 = a3;
  id v9 = a1;
  return sub_10000C570();
}

uint64_t sub_100006790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100028DF0();
  v3[5] = sub_100028DE0();
  uint64_t v5 = sub_100028DC0();
  return _swift_task_switch(sub_10000682C, v5, v4);
}

uint64_t sub_10000682C()
{
  sub_10000C288();
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
  v6[1] = sub_1000068EC;
  return sub_1000062F8();
}

uint64_t sub_1000068EC()
{
  sub_10000C288();
  sub_10000C1AC();
  uint64_t v2 = (void (**)(void))v1[6];
  uint64_t v3 = (void *)v1[4];
  id v4 = (void *)v1[2];
  uint64_t v5 = *v0;
  sub_10000C278();
  *uint64_t v6 = v5;
  swift_task_dealloc();

  v2[2](v2);
  _Block_release(v2);
  sub_10000C3B4();
  return v7();
}

unint64_t sub_100006A10(void *a1)
{
  id v3 = v1;
  id v13 = a1;
  sub_10000C1D8();
  sub_10000C4D8();
  return (unint64_t)sub_1000048F8(v4, v5, v6, v7, v8, v9, v10, v11, v13) & 1;
}

void sub_100006AC0(void *a1)
{
  swift_getObjectType();
  id v3 = v1;
  sub_1000047BC((uint64_t)"PosterEditor.Invalidate", 23, 2, (uint64_t)v3, (uint64_t)"PosterEditor.Invalidate", 23, 2, v3, a1);
}

void sub_100006B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100028E60();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_100028BE0();
  id v6 = sub_10000570C();
  [v6 editorDidInvalidate:a5];
  sub_1000043E8(0);
}

void *sub_100006C84(void *a1)
{
  swift_getObjectType();
  id v3 = v1;
  id v13 = a1;
  sub_10000C1D8();
  sub_10000C4D8();
  return sub_100004A4C(v4, v5, v6, v7, v8, v9, v10, v11, v13);
}

void sub_100006CEC(void *a1@<X4>, void *a2@<X8>)
{
  id v3 = sub_10000570C();
  id v4 = [v3 looksForEditor:a1];
  sub_100009C74(&qword_10003D428);
  unint64_t v5 = sub_100028D60();

  uint64_t v6 = sub_100006FA4(v5, a1);
  swift_bridgeObjectRelease();
  os_log_type_t v7 = sub_100028E70();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_10003DB60;
  os_log_type_t v9 = v7;
  if (os_log_type_enabled((os_log_t)qword_10003DB60, v7))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v11 = sub_100028FD0();
    sub_10001EC50(v11, v12, &v17);
    sub_100028F10();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    sub_10000BAE8(0, &qword_10003D430);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_100028D70();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    sub_10001EC50(v13, v15, &v17);
    sub_100028F10();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  *a2 = v6;
}

void *sub_100006FA4(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  unint64_t v4 = a1;
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      uint64_t v30 = &_swiftEmptyArrayStorage;
      uint64_t result = (void *)sub_100029030();
      if (v5 < 0) {
        break;
      }
      uint64_t v7 = 0;
      uint64_t v24 = v3;
      unint64_t v25 = v4 & 0xC000000000000001;
      unint64_t v26 = v4;
      while (v5 != v7)
      {
        if (v25)
        {
          uint64_t v8 = (void *)sub_100028FE0();
        }
        else
        {
          uint64_t v8 = *(void **)(v4 + 8 * v7 + 32);
          swift_unknownObjectRetain();
        }
        id v9 = objc_msgSend(v8, "pu_timeFontIdentifier", v24);
        id v10 = objc_msgSend(objc_msgSend(a2, "environment"), "role");
        swift_unknownObjectRelease();
        id v11 = PPCreateTimeFontConfiguration(v9, v10);

        id v12 = [v8 identifier];
        uint64_t v13 = sub_100028CE0();
        uint64_t v15 = v14;

        id v16 = [v8 displayName];
        uint64_t v17 = sub_100028CE0();
        uint64_t v19 = v18;

        id v20 = objc_msgSend(v8, "pu_timeFontColor");
        if (v20)
        {
          id v21 = v20;
          *((void *)&v29 + 1) = sub_10000BAE8(0, &qword_10003D438);
          *(void *)&long long v28 = v21;
        }
        else
        {
          long long v28 = 0u;
          long long v29 = 0u;
        }
        ++v7;
        id v22 = objc_allocWithZone((Class)PREditingLook);
        sub_10000AE40(v13, v15, v17, v19, v11, &v28);
        swift_unknownObjectRelease();
        sub_100029010();
        uint64_t v3 = v30[2];
        sub_100029040();
        sub_100029050();
        sub_100029020();
        unint64_t v4 = v26;
        if (v5 == v7)
        {
          uint64_t v23 = v30;

          return v23;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_1000290A0();
      swift_bridgeObjectRelease();
      if (!v5) {
        goto LABEL_16;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_16:

    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void sub_1000072F4(void *a1, void *a2, double a3)
{
  id v11 = v3;
  id v7 = a1;
  id v8 = a2;
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_10000C320();
  id v10 = sub_10000570C();
  [v10 editor:v7 didTransitionToLook:v8 progress:a3];

  sub_100028EB0();
  sub_10000C320();
}

uint64_t sub_1000074B8(void *a1)
{
  id v3 = v1;
  id v13 = a1;
  sub_10000C1D8();
  sub_10000C4D8();
  return sub_100004BA0(v4, v5, v6, v7, v8, v9, v10, v11, v13);
}

void sub_100007590(void *a1, void *a2)
{
  id v5 = v2;
  id v6 = a1;
  id v19 = a2;
  sub_10000C1D8();
  sub_10000C4D8();
  sub_100004D00(v15, v16, v17, v18, v7, v8, v9, v10, v11, v12, v13, v14, v6, v19);
}

uint64_t sub_1000076BC(void *a1)
{
  id v3 = v1;
  id v11 = a1;
  sub_10000C1D8();
  return sub_100004E94(v4, v5, v6, v7, v8, v9, 32, 2, v11, (SEL *)&selRef_leadingMenuElementsForEditor_);
}

uint64_t sub_10000773C(void *a1)
{
  id v3 = v1;
  id v13 = a1;
  sub_10000C294();
  return sub_100004E94(v4, v5, v6, v7, v8, v9, v10, v11, v13, (SEL *)&selRef_trailingMenuElementsForEditor_);
}

Class sub_1000077AC(void *a1, uint64_t a2, void *a3, uint64_t (*a4)(id))
{
  id v6 = a3;
  id v7 = a1;
  uint64_t v8 = a4(v6);

  if (v8)
  {
    sub_10000BAE8(0, &qword_10003D420);
    v9.super.isa = sub_100028D40().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

uint64_t sub_100007850(void *a1, void *a2, void *a3)
{
  swift_unknownObjectRetain();
  id v7 = v3;
  id v8 = a1;
  id v9 = a3;
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_100028BF0();
  sub_1000079C8(a2, (uint64_t)v7, (uint64_t)"PosterEditor.PopulateViews", 26, 2, (uint64_t)v8, (uint64_t)v9);
  sub_100028EB0();
  sub_100028BF0();

  return swift_unknownObjectRelease();
}

void sub_1000079C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v8 = [a1 backgroundView];
  id v9 = self;
  id v10 = [v9 blackColor];
  [v8 setBackgroundColor:v10];

  id v11 = [v8 window];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = [v9 blackColor];
    [v12 setBackgroundColor:v13];
  }
  id v14 = sub_10000570C();
  double v15 = (objc_class *)type metadata accessor for EditorViews();
  double v16 = (char *)objc_allocWithZone(v15);
  *(void *)&v16[OBJC_IVAR____TtC20PhotosPosterProvider11EditorViews_posterKitViewProviding] = a1;
  v20.receiver = v16;
  v20.super_class = v15;
  swift_unknownObjectRetain();
  id v17 = objc_msgSendSuper2(&v20, "init");
  [v14 editor:a6 populateViews:v17 forLook:a7];
}

id sub_100007BD8(void *a1)
{
  id v3 = v1;
  id v13 = a1;
  sub_10000C294();
  return sub_10000502C(v4, v5, v6, v7, v8, v9, v10, v11, v13, (SEL *)&selRef_solidColorHomeScreenColorPickerConfigurationForEditor_);
}

id sub_100007C90(void *a1)
{
  id v3 = v1;
  id v11 = a1;
  sub_10000C1D8();
  return sub_10000502C(v4, v5, v6, v7, v8, v9, 37, 2, v11, (SEL *)&selRef_gradientHomeScreenColorPickerConfigurationForEditor_);
}

uint64_t PREditor.pu_canApplyParallaxToViews.getter()
{
  return 1;
}

void sub_100007D68(void *a1, char a2)
{
  id v8 = v2;
  id v5 = a1;
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_10000C2F8();
  id v7 = sub_10000570C();
  [v7 editor:v5 depthEffectDisallowedDidChange:a2 & 1];

  sub_100028EB0();
  sub_10000C2F8();
}

void sub_100007EF4(void *a1)
{
  id v6 = v1;
  id v3 = a1;
  sub_100028EC0();
  if (qword_10003CA30 != -1) {
    swift_once();
  }
  sub_10000C360();
  id v5 = sub_10000570C();
  [v5 editorDidDelayFinalizationForBackgroundTask:v3];

  sub_100028EB0();
  sub_10000C360();
}

id sub_100008070(void *a1)
{
  uint64_t v2 = sub_100028B50();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)&v29 - v7;
  id v9 = (id)sub_100008A10(a1);
  if (!v9)
  {
    id v10 = [a1 assetDirectory];
    sub_100028B20();

    id v11 = self;
    sub_100028AF0(v12);
    id v14 = v13;
    id v37 = 0;
    id v9 = [v11 loadFromURL:v13 error:&v37];

    if (v9)
    {
      double v15 = *(void (**)(char *, uint64_t))(v3 + 8);
      id v16 = v37;
      v15(v8, v2);
    }
    else
    {
      id v17 = v37;
      double v18 = (void *)sub_100028AC0();

      swift_willThrow();
      id v37 = v18;
      sub_100009C74(&qword_10003D458);
      sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
      swift_dynamicCast();
      id v19 = v36;
      sub_10000BAE8(0, &qword_10003D8E0);
      id v9 = sub_10000C724(101);
      os_log_type_t v20 = sub_100028E80();
      if (qword_10003CA30 != -1) {
        swift_once();
      }
      id v21 = qword_10003DB60;
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
      if (os_log_type_enabled(v21, v20))
      {
        id v22 = v19;
        uint64_t v23 = swift_slowAlloc();
        uint64_t v32 = (void *)swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        uint64_t v38 = v34;
        *(_DWORD *)uint64_t v23 = 136315394;
        sub_10000B8A0(&qword_10003D460, (void (*)(uint64_t))&type metadata accessor for URL);
        int v31 = v20;
        uint64_t v24 = sub_100029100();
        uint64_t v35 = sub_10001EC50(v24, v25, &v38);
        os_log_t v30 = v21;
        sub_100028F10();
        swift_bridgeObjectRelease();
        id v33 = *(void (**)(char *, uint64_t))(v3 + 8);
        v33(v6, v2);
        *(_WORD *)(v23 + 12) = 2112;
        uint64_t v35 = (uint64_t)v22;
        id v26 = v22;
        sub_100028F10();
        *uint64_t v32 = v22;

        _os_log_impl((void *)&_mh_execute_header, v30, (os_log_type_t)v31, "Failed to init PosterDescriptor from url:%s error:%@", (uint8_t *)v23, 0x16u);
        sub_100009C74(&qword_10003D468);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v33(v8, v2);
      }
      else
      {
        id v27 = *(void (**)(char *, uint64_t))(v3 + 8);
        v27(v6, v2);

        v27(v8, v2);
      }
      swift_errorRelease();
    }
  }
  return v9;
}

id sub_100008544(void *a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_100028B50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  id v10 = &v34[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  uint64_t v12 = &v34[-v11];
  id v13 = [a1 assetDirectory];
  sub_100028B20();

  id v14 = self;
  sub_100028AF0(v15);
  id v17 = v16;
  id v42 = 0;
  id v18 = [v14 loadFromURL:v16 error:&v42];

  if (v18)
  {
    id v19 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
    id v20 = v42;
    v19(v12, v6);
  }
  else
  {
    id v21 = v42;
    id v22 = (void *)sub_100028AC0();

    swift_willThrow();
    id v42 = v22;
    sub_100009C74(&qword_10003D458);
    sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
    swift_dynamicCast();
    uint64_t v23 = v41;
    if (a3) {
      id v18 = 0;
    }
    else {
      id v18 = [objc_allocWithZone((Class)PFPosterConfiguration) initWithConfigurationType:a2 == 2];
    }
    os_log_type_t v24 = sub_100028E80();
    if (qword_10003CA30 != -1) {
      swift_once();
    }
    unint64_t v25 = qword_10003DB60;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
    if (os_log_type_enabled(v25, v24))
    {
      id v26 = v23;
      uint64_t v27 = swift_slowAlloc();
      os_log_t v38 = v25;
      uint64_t v28 = v27;
      v36 = (void *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t v43 = v39;
      *(_DWORD *)uint64_t v28 = 136315394;
      sub_10000B8A0(&qword_10003D460, (void (*)(uint64_t))&type metadata accessor for URL);
      int v35 = v24;
      uint64_t v29 = sub_100029100();
      uint64_t v40 = sub_10001EC50(v29, v30, &v43);
      sub_100028F10();
      swift_bridgeObjectRelease();
      id v37 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
      v37(v10, v6);
      *(_WORD *)(v28 + 12) = 2112;
      uint64_t v40 = (uint64_t)v26;
      id v31 = v26;
      sub_100028F10();
      void *v36 = v26;

      _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v35, "Failed to init PosterDescriptor from url:%s error:%@", (uint8_t *)v28, 0x16u);
      sub_100009C74(&qword_10003D468);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v37(v12, v6);
    }
    else
    {
      uint64_t v32 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
      v32(v10, v6);

      v32(v12, v6);
    }
    swift_errorRelease();
  }
  return v18;
}

uint64_t sub_100008A10(void *a1)
{
  v22[0] = 0;
  id v2 = [a1 loadUserInfoWithError:v22];
  id v3 = v22[0];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = sub_100028C80();
    id v6 = v3;

    sub_100028F70();
    sub_10000C7B0((uint64_t)v22, v5, &v23);
    sub_10000BB24((uint64_t)v22);
    if (v24) {
      swift_dynamicCast();
    }
    else {
      sub_10000B950((uint64_t)&v23);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = v22[0];
    uint64_t v8 = (void *)sub_100028AC0();

    swift_willThrow();
    v22[0] = v8;
    sub_100009C74(&qword_10003D458);
    sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
    swift_dynamicCast();
    uint64_t v9 = (void *)v23;
    os_log_type_t v10 = sub_100028E80();
    if (qword_10003CA30 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_10003DB60;
    if (os_log_type_enabled((os_log_t)qword_10003DB60, v10))
    {
      id v12 = a1;
      id v21 = v9;
      id v13 = v9;
      id v14 = v12;
      id v15 = v13;
      uint64_t v16 = swift_slowAlloc();
      id v17 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412546;
      id v18 = v14;
      sub_100028F10();
      *id v17 = v14;

      *(_WORD *)(v16 + 12) = 2112;
      id v19 = v15;
      sub_100028F10();
      v17[1] = v15;

      _os_log_impl((void *)&_mh_execute_header, v11, v10, "Failed to load user info from descriptor:%@ error:%@", (uint8_t *)v16, 0x16u);
      sub_100009C74(&qword_10003D468);
      swift_arrayDestroy();
      uint64_t v9 = v21;
      swift_slowDealloc();
      swift_slowDealloc();
    }

    swift_errorRelease();
  }
  return 0;
}

id sub_100008FE4(void *a1, void *a2, uint64_t a3, uint64_t (*a4)(void))
{
  *(void *)&v4[*a1] = 0;
  *(void *)&v4[*a2] = 0;
  uint64_t v6 = qword_10003CA28;
  id v7 = v4;
  if (v6 != -1) {
    swift_once();
  }
  id v8 = (id)qword_10003DB58;
  sub_100028C00();

  v10.receiver = v7;
  v10.super_class = (Class)a4(0);
  return objc_msgSendSuper2(&v10, "init");
}

id sub_1000090F0(uint64_t a1)
{
  return sub_10000C248(a1, (uint64_t (*)(void))type metadata accessor for PosterEditor);
}

uint64_t sub_100009124(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v8 = a1 + *a5;
  sub_100028C10();
  sub_10000C2C8();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  return v11(v8, v9);
}

void PRPosterTransition.px_duration.getter()
{
  id v1 = [v0 animationSettings];
  if (v1)
  {
    id v2 = v1;
    [v1 duration];
  }
}

void PRPosterTransition.px_duration.setter(double a1)
{
  id v2 = [self settingsWithDuration:a1];
  sub_10000C3CC();
  objc_msgSend(v1, "setAnimationSettings:");
}

id sub_10000931C()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider22BSInvalidatableWrapper_invalidatable) invalidate];
}

void sub_10000937C()
{
}

id sub_1000093B4(uint64_t a1)
{
  return sub_100003804(a1, type metadata accessor for BSInvalidatableWrapper);
}

id PREditor.pu_requestDismissal(with:)(unint64_t a1)
{
  if (a1 >= 2)
  {
    id result = (id)sub_10000C1EC();
    __break(1u);
  }
  else
  {
    return [v1 requestDismissalWithAction:a1];
  }
  return result;
}

Swift::Void __swiftcall PREditor.pu_updateLooks()()
{
  [v0 updateLooks];
}

Swift::Void __swiftcall PREditor.pu_updateLookProperties()()
{
  [v0 updateLookProperties];
}

Swift::Void __swiftcall PREditor.pu_updateLuminanceValuesForLooks()()
{
  [v0 updateLuminanceValuesForLooks];
}

id PREditor.pu_isDepthEffectDisallowed.getter()
{
  return [v0 isDepthEffectDisallowed];
}

id PREditor.pu_placeholderAction.getter()
{
  id v1 = [v0 placeholderAction];
  return v1;
}

id PREditor.pu_currentLook.getter()
{
  id v1 = [v0 currentLook];
  return v1;
}

double PREditor.pu_editingChromeDodgingInsets.getter()
{
  return PPPosterEditingChromeDodgingInsetsForEditor(v0);
}

uint64_t PREditor.px_updatePreferences(_:)(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = sub_10000C400();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = sub_10000C400();
  *(void *)(v7 + 16) = sub_100009954;
  *(void *)(v7 + 24) = v6;
  v10[4] = sub_100009960;
  v10[5] = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100003AE4;
  v10[3] = &unk_100034EF8;
  uint64_t v8 = _Block_copy(v10);
  swift_retain();
  swift_release();
  [v3 updatePreferences:v8];
  _Block_release(v8);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v3) {
    __break(1u);
  }
  return result;
}

void sub_1000098A0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v4 = swift_dynamicCastObjCProtocolUnconditional();
  id v5 = [objc_allocWithZone((Class)NSObject) init];
  uint64_t v6 = swift_dynamicCastObjCProtocolUnconditional();
  a3(v4, v6);
}

void sub_100009954(uint64_t a1, uint64_t a2)
{
  sub_1000098A0(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_100009960()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100009988(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, id))(a1 + 32);
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, v6);

  return swift_unknownObjectRelease();
}

void sub_100009A1C(void *a1, int a2, void *aBlock, uint64_t a4, void (*a5)(uint64_t, void *))
{
  uint64_t v8 = _Block_copy(aBlock);
  v10[2] = v8;
  id v9 = a1;
  a5(a4, v10);
  _Block_release(v8);
}

id PREditor.pu_disableIdleTimer()()
{
  id v0 = [self sharedInstance];
  NSString v1 = sub_100028CB0();
  id v13 = 0;
  id v2 = [v0 newAssertionToDisableIdleTimerForReason:v1 error:&v13];

  id v3 = v13;
  if (v2)
  {
    uint64_t v4 = (objc_class *)type metadata accessor for BSInvalidatableWrapper();
    id v5 = (char *)objc_allocWithZone(v4);
    *(void *)&v5[OBJC_IVAR____TtC20PhotosPosterProvider22BSInvalidatableWrapper_invalidatable] = v2;
    v12.receiver = v5;
    v12.super_class = v4;
    id v6 = v3;
    return objc_msgSendSuper2(&v12, "init");
  }
  else
  {
    id v8 = v13;
    sub_100028AC0();

    swift_willThrow();
    sub_100028E80();
    id result = (id)PLWallpaperGetLog();
    if (result)
    {
      id v9 = result;
      sub_100009C74((uint64_t *)&unk_10003CC30);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_10002A570;
      uint64_t v11 = sub_100028AB0();
      *(void *)(v10 + 56) = sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
      *(void *)(v10 + 64) = sub_100009CB8();
      *(void *)(v10 + 32) = v11;
      sub_100028BE0();

      swift_bridgeObjectRelease();
      swift_errorRelease();
      return 0;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_100009C74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100009CB8()
{
  unint64_t result = qword_10003CC40;
  if (!qword_10003CC40)
  {
    sub_10000BAE8(255, (unint64_t *)&unk_10003D8B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC40);
  }
  return result;
}

uint64_t type metadata accessor for BSInvalidatableWrapper()
{
  return self;
}

UIView_optional __swiftcall PREditor.pu_view(forMenuElementIdentifier:)(Swift::String forMenuElementIdentifier)
{
  NSString v2 = sub_100028CB0();
  id v3 = (objc_class *)[v1 viewForMenuElementIdentifier:v2];

  id v5 = v3;
  result.value.super.super.isa = v5;
  result.is_nil = v4;
  return result;
}

uint64_t PREditingLook.pu_timeAppearance.getter()
{
  return 2;
}

uint64_t PREditingLook.pu_timeFontIdentifier.getter()
{
  return 0;
}

uint64_t sub_100009E68(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment) = a1;
  return swift_unknownObjectRelease();
}

id sub_100009E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  *(void *)&v6[*a5] = a2;
  *(void *)&v6[OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment] = a1;
  *(void *)&v6[*a6] = 0;
  id v9 = &v6[OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_sourceAssetDirectory];
  uint64_t v10 = sub_100028B50();
  uint64_t v11 = *(void *)(v10 - 8);
  objc_super v12 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v12(v9, a3, v10);
  v12(&v6[OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_targetAssetDirectory], a4, v10);
  v16.receiver = v6;
  v16.super_class = (Class)type metadata accessor for EditingEnvironment(0);
  id v13 = objc_msgSendSuper2(&v16, "init");
  id v14 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v14(a4, v10);
  v14(a3, v10);
  return v13;
}

id sub_100009FE8()
{
  id result = *(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterDescriptor);
  if (result) {
    return [result posterType];
  }
  id result = *(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_sourcePosterConfiguration);
  if (result) {
    return [result posterType];
  }
  return result;
}

uint64_t sub_10000A030@<X0>(uint64_t a1@<X8>)
{
  return sub_10000A15C(&OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_sourceAssetDirectory, a1);
}

id sub_10000A054(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_100009C74((uint64_t *)&unk_10003D410);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  a3(v5);
  uint64_t v8 = sub_100028B50();
  uint64_t v10 = 0;
  if (sub_10000B9D8((uint64_t)v7, 1, v8) != 1)
  {
    sub_100028AF0(v9);
    uint64_t v10 = v11;
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  return v10;
}

uint64_t sub_10000A150@<X0>(uint64_t a1@<X8>)
{
  return sub_10000A15C(&OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_targetAssetDirectory, a1);
}

uint64_t sub_10000A15C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  uint64_t v5 = sub_100028B50();
  sub_10000C2C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a2, v4, v5);
  return sub_10000B9B0(a2, 0, 1, v5);
}

void *sub_10000A218()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_sourcePosterConfiguration);
  id v2 = v1;
  return v1;
}

void *sub_10000A27C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterDescriptor);
  id v2 = v1;
  return v1;
}

id sub_10000A2F0()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment) caseColor];
  return v1;
}

id sub_10000A364()
{
  id result = [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment) traitCollection];
  if (result)
  {
    id v2 = result;
    id v3 = [result userInterfaceStyle];

    return v3;
  }
  return result;
}

id sub_10000A3F4()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment) deviceOrientation];
}

uint64_t sub_10000A440()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment) sourceContents];
  self;
  id v2 = (void *)sub_10000C474();
  if (v2) {
    uint64_t v3 = sub_10000A4B0(v2);
  }
  else {
    uint64_t v3 = 0;
  }
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_10000A4B0(void *a1)
{
  NSString v2 = sub_100028CB0();
  id v3 = [a1 objectForUserInfoKey:v2];

  if (v3)
  {
    sub_100028F30();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
  }
  sub_10000B8E8((uint64_t)v10, (uint64_t)v11);
  if (v12)
  {
    if (swift_dynamicCast())
    {
      BOOL v4 = v8 == 1801678700 && v9 == 0xE400000000000000;
      if (v4 || (sub_10000C4B8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v8 == 1701670760 && v9 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      char v7 = sub_10000C4B8();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
    }
  }
  else
  {
    sub_10000B950((uint64_t)v11);
  }
  return 0;
}

PPPosterOverrideConfiguration *sub_10000A658()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment) sourceContents];
  self;
  NSString v2 = (void *)sub_10000C474();
  if (v2)
  {
    id v3 = PPPosterOverrideConfigurationFromConfiguration(v2);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return v3;
}

id sub_10000A71C()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment) targetConfiguration];
  return v1;
}

id sub_10000A790()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment) significantEventsCounter];
}

uint64_t sub_10000A7DC()
{
  return PPPosterEnvironmentIsCallServices(*(void **)(v0
                                                    + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment));
}

uint64_t sub_10000A834()
{
  return sub_10000C390(OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment);
}

void sub_10000A858(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  sub_10000C440();

  sub_10000C418();
}

id sub_10000A8A4()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment) floatingObscurableBounds];
}

id sub_10000A8BC(uint64_t a1)
{
  return sub_10000C388(a1, OBJC_IVAR____TtC20PhotosPosterProvider18EditingEnvironment_posterKitEnvironment);
}

void sub_10000A8E4(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  id v6 = a1;
  a4(a3);
  sub_10000C440();

  sub_10000C418();
}

void sub_10000A944()
{
}

id sub_10000A97C(uint64_t a1)
{
  return sub_10000C248(a1, (uint64_t (*)(void))type metadata accessor for EditingEnvironment);
}

uint64_t PRMutablePosterConfiguration.pu_displayNameLocalizationKey.getter()
{
  return sub_10000B500(v0);
}

void PRMutablePosterConfiguration.pu_displayNameLocalizationKey.setter(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = sub_100028CB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  [v2 setDisplayNameLocalizationKey:v3];
}

id sub_10000AC18()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider11EditorViews_posterKitViewProviding) backgroundView];
  return v1;
}

id sub_10000AC9C()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider11EditorViews_posterKitViewProviding) foregroundView];
  return v1;
}

id sub_10000AD20()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider11EditorViews_posterKitViewProviding) floatingView];
  return v1;
}

void sub_10000AD60()
{
}

id sub_10000AD98(uint64_t a1)
{
  return sub_100003804(a1, type metadata accessor for EditorViews);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

id sub_10000AE40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  NSString v9 = sub_100028CB0();
  swift_bridgeObjectRelease();
  NSString v10 = sub_100028CB0();
  swift_bridgeObjectRelease();
  uint64_t v11 = a6[3];
  if (v11)
  {
    uint64_t v12 = sub_10000BA00(a6, a6[3]);
    uint64_t v13 = *(void *)(v11 - 8);
    __chkstk_darwin(v12);
    id v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = sub_100029120();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    sub_10000BA44((uint64_t)a6);
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = [v6 initWithIdentifier:v9 displayName:v10 initialTimeFontConfiguration:a5 initialTitleColor:v16];

  swift_unknownObjectRelease();
  return v17;
}

uint64_t sub_10000AFD8(uint64_t a1, id *a2)
{
  uint64_t result = sub_100028CC0();
  *a2 = 0;
  return result;
}

uint64_t sub_10000B050(uint64_t a1, id *a2)
{
  char v3 = sub_100028CD0();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_10000B0D0()
{
  sub_100028CE0();
  NSString v0 = sub_100028CB0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000B108(uint64_t a1, id *a2)
{
  return sub_10000AFD8(a1, a2);
}

uint64_t sub_10000B120(uint64_t a1, id *a2)
{
  return sub_10000B050(a1, a2) & 1;
}

uint64_t sub_10000B13C()
{
  return sub_10000B1C4(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

NSString sub_10000B16C@<X0>(void *a1@<X8>)
{
  NSString result = sub_10000B0D0();
  *a1 = result;
  return result;
}

uint64_t sub_10000B194()
{
  return sub_10000B1C4(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000B1C4(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_100028CE0();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10000B204()
{
  return sub_10000B220();
}

uint64_t sub_10000B220()
{
  sub_100028CE0();
  sub_100028CF0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000B274()
{
  return sub_10000B290();
}

Swift::Int sub_10000B290()
{
  sub_100028CE0();
  sub_1000291B0();
  sub_100028CF0();
  Swift::Int v0 = sub_1000291D0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000B304(void *a1, void *a2)
{
  return sub_10000C654(*a1, *a2);
}

uint64_t sub_10000B314()
{
  sub_10000C3C0();
  uint64_t result = sub_10000B440();
  *Swift::Int v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_10000B33C(uint64_t a1)
{
  uint64_t v2 = sub_10000B8A0(&qword_10003D4E0, type metadata accessor for PFParallaxStyleCategory);
  uint64_t v3 = sub_10000B8A0(&qword_10003D4E8, type metadata accessor for PFParallaxStyleCategory);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000B3F8@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100028CB0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000B444(uint64_t a1)
{
  uint64_t v2 = sub_10000B8A0(&qword_10003D4F0, type metadata accessor for PISegmentationOption);
  uint64_t v3 = sub_10000B8A0(&qword_10003D4F8, type metadata accessor for PISegmentationOption);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000B500(void *a1)
{
  id v1 = [a1 displayNameLocalizationKey];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100028CE0();

  return v3;
}

unint64_t sub_10000B564()
{
  unint64_t result = qword_10003CC50;
  if (!qword_10003CC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CC50);
  }
  return result;
}

uint64_t sub_10000B5B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000B5F8()
{
  return type metadata accessor for PosterRenderer(0);
}

uint64_t type metadata accessor for PosterRenderer(uint64_t a1)
{
  return sub_10000B758(a1, (uint64_t *)&unk_10003CD00);
}

uint64_t type metadata accessor for RenderingEnvironment()
{
  return self;
}

uint64_t type metadata accessor for MutablePosterRenderingPreferences()
{
  return self;
}

uint64_t sub_10000B66C()
{
  return type metadata accessor for PosterEditor(0);
}

uint64_t type metadata accessor for PosterEditor(uint64_t a1)
{
  return sub_10000B758(a1, (uint64_t *)&unk_10003D020);
}

uint64_t sub_10000B694()
{
  uint64_t result = sub_100028C10();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000B730()
{
  return type metadata accessor for EditingEnvironment(0);
}

uint64_t type metadata accessor for EditingEnvironment(uint64_t a1)
{
  return sub_10000B758(a1, (uint64_t *)&unk_10003D228);
}

uint64_t sub_10000B758(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000B78C()
{
  uint64_t result = sub_100028B50();
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

ValueMetadata *type metadata accessor for PhotosPosterProviderExtension()
{
  return &type metadata for PhotosPosterProviderExtension;
}

uint64_t sub_10000B868()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_10000B8A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000B8E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009C74(&qword_10003D408);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B950(uint64_t a1)
{
  uint64_t v2 = sub_100009C74(&qword_10003D408);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B9B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10000B9D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void *sub_10000BA00(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000BA44(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000BA94()
{
  return _swift_deallocObject(v0, 56, 7);
}

void sub_10000BAD4(uint64_t a1, uint64_t a2)
{
  sub_100006608(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(unsigned __int8 *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_10000BAE8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000BB24(uint64_t a1)
{
  return a1;
}

void sub_10000BB78(uint64_t a1)
{
  sub_100005578(a1, *(void (**)(uint64_t (*)(), uint64_t))(v1 + 16));
}

uint64_t sub_10000BB80()
{
  sub_100009C74(&qword_10003D470);
  sub_10000C2C8();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_10000BC0C()
{
  sub_100009C74(&qword_10003D470);
  return sub_1000056D8();
}

uint64_t sub_10000BC74()
{
  sub_10000C288();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000BD10;
  uint64_t v2 = sub_10000C398();
  return v3(v2);
}

uint64_t sub_10000BD10()
{
  sub_10000C4AC();
  sub_10000C1AC();
  uint64_t v1 = *v0;
  sub_10000C278();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000C3B4();
  return v3();
}

uint64_t sub_10000BDD0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10000BDEC()
{
  _Block_release(*(const void **)(v0 + 24));
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000BE34()
{
  sub_10000C288();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000C198;
  uint64_t v2 = sub_10000C398();
  return v3(v2);
}

void type metadata accessor for PFParallaxStyleCategory(uint64_t a1)
{
}

void type metadata accessor for PISegmentationOption(uint64_t a1)
{
}

void sub_10000BEF8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000BF40()
{
  return sub_10000BF74(&qword_10003D4A8);
}

uint64_t sub_10000BF74(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B5B0(&qword_10003CC60);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000BFBC()
{
  return sub_10000B8A0(&qword_10003D4B0, type metadata accessor for PISegmentationOption);
}

uint64_t sub_10000C004()
{
  return sub_10000B8A0(&qword_10003D4B8, type metadata accessor for PISegmentationOption);
}

uint64_t sub_10000C04C()
{
  return sub_10000B8A0(&qword_10003D4C0, type metadata accessor for PFParallaxStyleCategory);
}

uint64_t sub_10000C094()
{
  return sub_10000B8A0(&qword_10003D4C8, type metadata accessor for PFParallaxStyleCategory);
}

uint64_t sub_10000C0DC()
{
  return sub_10000B8A0(&qword_10003D4D0, type metadata accessor for PFParallaxStyleCategory);
}

uint64_t sub_10000C124()
{
  return sub_10000B8A0(&qword_10003D4D8, type metadata accessor for PISegmentationOption);
}

uint64_t sub_10000C19C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C1C4()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_10000C1CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return _objc_release_x1();
}

uint64_t sub_10000C1EC()
{
  return sub_100029090();
}

id sub_10000C248(uint64_t a1, uint64_t (*a2)(void))
{
  return sub_100003804(0, a2);
}

uint64_t sub_10000C250()
{
  return *(void *)(v0 - 120);
}

uint64_t sub_10000C2D8()
{
  return *(void *)(v0 - 104);
}

uint64_t sub_10000C2F8()
{
  return sub_100028BF0();
}

uint64_t sub_10000C320()
{
  return sub_100028BF0();
}

uint64_t sub_10000C348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_stdlib_reportUnimplementedInitializer(a1, a2, a3, 6, 0);
}

uint64_t sub_10000C360()
{
  return sub_100028BF0();
}

id sub_10000C388@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return PPPosterTitleBoundsForLayout(*(void **)(v2 + a2), a1);
}

uint64_t sub_10000C390@<X0>(uint64_t a1@<X8>)
{
  return PPPosterBoundingShapeFromEnvironment(*(void **)(v1 + a1));
}

uint64_t sub_10000C398()
{
  return v0;
}

uint64_t sub_10000C3B4()
{
  return v0 + 8;
}

uint64_t sub_10000C3C0()
{
  return *(void *)v0;
}

double _sSo10PRRendererC20PhotosPosterProviderE44px_shuffleSleepTransformOutAnimationDuration12CoreGraphics7CGFloatVvg_0()
{
  return 0.5;
}

uint64_t sub_10000C3E0()
{
  return sub_100028BF0();
}

uint64_t sub_10000C400()
{
  return swift_allocObject();
}

double sub_10000C418()
{
  return v0;
}

uint64_t sub_10000C454()
{
  return sub_100028BF0();
}

uint64_t sub_10000C474()
{
  return swift_dynamicCastObjCClass();
}

uint64_t sub_10000C48C()
{
  return sub_100028BF0();
}

uint64_t sub_10000C4B8()
{
  return sub_100029130();
}

id sub_10000C4E4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_100028AF0(v1);
  uint64_t v3 = v2;
  uint64_t v4 = (void *)sub_100027CA0();
  id v6 = [v4 v5];

  sub_100028B50();
  sub_10000C2C8();
  sub_10002706C();
  v7();
  return v6;
}

uint64_t sub_10000C570()
{
  sub_100027C58();
  uint64_t v2 = sub_100009C74(&qword_10003D9F8);
  uint64_t v3 = sub_100027450(v2);
  __chkstk_darwin(v3);
  sub_100027268();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_100028E10();
  sub_10000B9B0(v6, 1, 1, v7);
  uint64_t v8 = (void *)sub_1000277B0();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v1;
  v8[5] = v0;
  NSString v9 = (void *)sub_1000277B0();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_10003DA08;
  v9[5] = v8;
  sub_10001DEA4(v6, (uint64_t)&unk_10003DA18, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_10000C658()
{
  uint64_t v0 = sub_100028CE0();
  uint64_t v2 = v1;
  if (v0 == sub_100028CE0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100029130();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_10000C6E0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_10000C724(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_10000BAE8(0, &qword_10003D8C0);
  sub_100027804();
  Class isa = sub_100028D40().super.isa;
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithDescriptorType:a1 media:isa];

  return v4;
}

double sub_10000C7B0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_10001F890(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_100025CD0(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void *sub_10000C814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_10001F8D4(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  char v6 = *(void **)(*(void *)(a3 + 56) + 8 * v4);
  id v7 = v6;
  return v6;
}

BOOL sub_10000C85C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_10000C86C(uint64_t a1, char a2)
{
}

Swift::Int sub_10000C894(char a1)
{
  return sub_1000291D0();
}

BOOL sub_10000C8DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10000C85C(*a1, *a2);
}

Swift::Int sub_10000C8E8()
{
  return sub_10000C894(*v0);
}

void sub_10000C8F0(uint64_t a1)
{
  sub_10000C86C(a1, *v1);
}

Swift::Int sub_10000C8F8()
{
  Swift::UInt v1 = *v0;
  sub_1000291B0();
  sub_1000291C0(v1);
  return sub_1000291D0();
}

uint64_t sub_10000C94C()
{
  if (qword_10003CA20 != -1) {
    swift_once();
  }
  sub_10000BAE8(0, &qword_10003D870);
  swift_bridgeObjectRetain();
  uint64_t result = sub_100028F00();
  qword_10003DB88 = result;
  return result;
}

uint64_t sub_10000CA08(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 40) = a5;
  *(unsigned char *)(v6 + 72) = a3;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = sub_100028C10();
  *(void *)(v6 + 48) = v7;
  *(void *)(v6 + 56) = *(void *)(v7 - 8);
  *(void *)(v6 + 64) = swift_task_alloc();
  return _swift_task_switch(sub_10000CAD0, v5, 0);
}

void sub_10000CAD0()
{
  if (qword_10003CA38 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[8];
  id v2 = (void (*)(void))v0[4];
  uint64_t v3 = (void *)v0[3];
  id v4 = (id)qword_10003DB88;
  sub_100028C00();
  sub_100028EC0();
  sub_10002770C();
  sub_100027AB8();
  v2();
  if (v1)
  {
    uint64_t v6 = sub_100027024();
    v7(v6);
    swift_task_dealloc();
    sub_1000276D0();
    __asm { BRAA            X1, X16 }
  }
  sub_100028EB0();
  sub_100027730();
  uint64_t v10 = sub_100027024();
  v11(v10);
  swift_task_dealloc();
  sub_100027A40();
  sub_1000276D0();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_10000CC30()
{
  swift_defaultActor_destroy();
  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_10000CC60()
{
  return v0;
}

uint64_t sub_10000CC6C()
{
  return sub_10000CC60();
}

uint64_t sub_10000CC88()
{
  type metadata accessor for PosterUpdater.Serializer();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  qword_10003DB98 = v0;
  return result;
}

id sub_10000CCC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100028B50();
  uint64_t v3 = sub_100027450(v2);
  __chkstk_darwin(v3);
  sub_100027268();
  uint64_t v4 = OBJC_IVAR____TtC20PhotosPosterProvider13PosterUpdater____lazy_storage___photoLibrary;
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider13PosterUpdater____lazy_storage___photoLibrary);
  if (v5)
  {
    id v6 = *(id *)(v0 + OBJC_IVAR____TtC20PhotosPosterProvider13PosterUpdater____lazy_storage___photoLibrary);
  }
  else
  {
    sub_10000BAE8(0, (unint64_t *)&unk_10003D440);
    id v7 = [self systemPhotoLibraryURL];
    sub_100028B20();

    id v8 = sub_10000C4E4();
    uint64_t v9 = *(void **)(v0 + v4);
    *(void *)(v1 + v4) = v8;
    id v6 = v8;

    uint64_t v5 = 0;
  }
  id v10 = v5;
  return v6;
}

uint64_t sub_10000CDC0()
{
  sub_10000C4AC();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  v1[5] = swift_getObjectType();
  sub_1000274B0();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_10000CE2C()
{
  sub_1000274A4();
  if (qword_10003CA40 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 24);
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  id v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_10003D9D8 + dword_10003D9D8);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10000CF58;
  uint64_t v5 = sub_100027C24((uint64_t)"updateDescriptors");
  return v7(v5, 17, 2);
}

uint64_t sub_10000CF58()
{
  sub_10000C4AC();
  sub_10000C1AC();
  uint64_t v1 = *v0;
  sub_10000C278();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = sub_1000273D4();
  return v4(v3);
}

uint64_t sub_10000D038@<X0>(void *a1@<X0>, uint64_t a2@<X2>, unint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  os_log_type_t v8 = sub_100028E90();
  if (qword_10003CA38 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_10003DB88;
  os_log_type_t v10 = v8;
  if (os_log_type_enabled((os_log_t)qword_10003DB88, v8))
  {
    id v11 = a1;
    id v21 = a3;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    unint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v13 = sub_10002565C(v11, (SEL *)&selRef_identifier);
    if (v14)
    {
      unint64_t v15 = v14;
    }
    else
    {
      uint64_t v13 = 7104878;
      unint64_t v15 = 0xE300000000000000;
    }
    sub_10001EC50(v13, v15, (uint64_t *)&v22);
    uint64_t v4 = v3;
    sub_100028F10();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Update Descriptors called with refresh session identifier '%s'", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a3 = v21;
    swift_slowDealloc();
  }
  uint64_t v16 = sub_10000D5C4(a2, a1);
  if (![self wallpaperDemoModeEnabled])
  {
    sub_10001CB90();
    unint64_t v18 = v19;
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  if (v16 < 0 || (v16 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = (uint64_t)sub_10001FE2C();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = v16 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  unint64_t v22 = v17;
  sub_10001FB74((uint64_t *)&v22);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    unint64_t v18 = v22;
    sub_100028E90();
    sub_100028BE0();
LABEL_15:
    uint64_t result = sub_10000FFC4(a2, v18);
    *a3 = v18;
    return result;
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_10000D32C(int a1, void *a2, void *aBlock, void *a4)
{
  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v4[5] = sub_10000BAE8(0, &qword_10003D858);
  v4[6] = sub_100028C80();
  id v7 = a2;
  a4;
  os_log_type_t v8 = (void *)swift_task_alloc();
  v4[7] = v8;
  void *v8 = v4;
  v8[1] = sub_10000D438;
  return sub_10000CDC0();
}

uint64_t sub_10000D438()
{
  sub_1000274A4();
  uint64_t v2 = v0;
  sub_10000C1AC();
  uint64_t v4 = v3;
  sub_100027054();
  void *v5 = v4;
  id v7 = *(void **)(v6 + 24);
  os_log_type_t v8 = *(void **)(v6 + 16);
  uint64_t v9 = *v1;
  sub_10000C278();
  void *v10 = v9;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v11 = sub_100028AB0();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v13 = (void *)v11;
  }
  else
  {
    Class isa = sub_100028D40().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v11 = 0;
    uint64_t v13 = isa;
  }
  unint64_t v14 = *(void (***)(void, void, void))(v4 + 32);
  ((void (**)(void, Class, uint64_t))v14)[2](v14, isa, v11);

  _Block_release(v14);
  sub_10000C3B4();
  return v15();
}

#error "10000D7E0: call analysis failed (funcsize=320)"

void sub_10000DB18()
{
  sub_100027184();
  uint64_t v3 = v2;
  uint64_t v4 = sub_100028B50();
  sub_10000C214();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_100027518();
  __chkstk_darwin(v8);
  sub_10002743C();
  __chkstk_darwin(v9);
  v40[3] = (char *)v40 - v10;
  sub_100026F34();
  __chkstk_darwin(v11);
  sub_100027060();
  uint64_t v43 = v12;
  sub_100026F34();
  __chkstk_darwin(v13);
  os_log_type_t v14 = sub_100028E60();
  if (qword_10003CA38 != -1) {
    swift_once();
  }
  unint64_t v15 = qword_10003DB88;
  uint64_t v41 = *(void (**)(void))(v6 + 16);
  id v42 = v3;
  sub_100027AA0();
  v16();
  BOOL v17 = os_log_type_enabled(v15, v14);
  v40[5] = v6;
  v40[2] = v0;
  if (v17)
  {
    v40[1] = v1;
    uint64_t v18 = sub_100026E9C();
    v40[4] = v4;
    unint64_t v19 = (_DWORD *)v18;
    uint64_t v44 = sub_100026E84();
    *unint64_t v19 = 136315138;
    uint64_t v0 = v19 + 1;
    uint64_t v20 = sub_100028B40();
    uint64_t v22 = sub_10001EC50(v20, v21, &v44);
    sub_100027628(v22);
    sub_100028F10();
    swift_bridgeObjectRelease();
    long long v23 = *(void (**)(void))(v6 + 8);
    sub_1000270C0();
    v23();
    sub_10002703C((void *)&_mh_execute_header, v15, v14, "Loading poster descriptor identifiers with refresh session directory: %s");
    sub_100026FC8();
    sub_100026E6C();
    sub_100026E6C();
  }
  else
  {
    long long v23 = *(void (**)(void))(v6 + 8);
    uint64_t v24 = sub_100027828();
    ((void (*)(uint64_t))v23)(v24);
  }
  sub_10002748C();
  sub_100028B10();
  id v25 = [self defaultManager];
  sub_100028B40();
  sub_100028CB0();
  sub_10002745C();
  unsigned int v26 = [v25 fileExistsAtPath:v0];

  if (v26)
  {
    sub_1000275A8();
    uint64_t v27 = v41;
    sub_100027AA0();
    v27();
    id v28 = objc_allocWithZone((Class)NSArray);
    uint64_t v29 = sub_100027CC4();
    id v39 = sub_10001D93C(v29);
    sub_1000270C0();
    v23();
    uint64_t v44 = 0;
    sub_100028D50();
  }
  else
  {
    os_log_type_t v30 = sub_100028E90();
    id v31 = qword_10003DB88;
    sub_100027AA0();
    v32();
    if (os_log_type_enabled(v31, v30))
    {
      uint64_t v33 = sub_100026E9C();
      id v42 = v23;
      uint64_t v34 = (_DWORD *)v33;
      uint64_t v44 = sub_100026E84();
      *uint64_t v34 = 136315138;
      uint64_t v35 = sub_100028B40();
      uint64_t v37 = sub_10001EC50(v35, v36, &v44);
      sub_100027628(v37);
      sub_100028F10();
      swift_bridgeObjectRelease();
      os_log_t v38 = v42;
      sub_100026EB4();
      v38();
      sub_100027534((void *)&_mh_execute_header, v31, v30, "Missing poster descriptor identifiers plist file in refresh session directory: %s");
      sub_100026FC8();
      sub_100026E6C();
      sub_100026E6C();
      sub_100026EB4();
      v38();
    }
    else
    {
      sub_100026EB4();
      v23();
      sub_100026EB4();
      v23();
    }
  }
  sub_100026F74();
}

void sub_10000E17C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_100027184();
  a19 = v23;
  a20 = v24;
  v214 = v20;
  uint64_t v219 = v25;
  uint64_t v27 = v26;
  uint64_t v216 = v28;
  v226 = 0;
  uint64_t v223 = sub_100028B50();
  sub_10000C214();
  uint64_t v30 = v29;
  __chkstk_darwin(v31);
  sub_100027C44();
  uint64_t v211 = v32;
  sub_100026F34();
  __chkstk_darwin(v33);
  uint64_t v35 = (char *)v206 - v34;
  unint64_t v232 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v36 = *(void *)(v27 + 16);
  p_cb = (void (*)(void))&OBJC_PROTOCOL___PREditingDelegate.cb;
  os_log_t v38 = &off_10002A000;
  if (v36)
  {
    id v222 = self;
    v213 = &v231;
    v208 = &v235;
    v221 = (void (**)(void))(v30 + 8);
    v209 = &v230;
    swift_bridgeObjectRetain();
    v206[0] = v27;
    uint64_t v22 = (unint64_t *)(v27 + 40);
    *(void *)&long long v39 = 136315138;
    long long v220 = v39;
    v212 = (char *)&type metadata for Any + 8;
    *(void *)&long long v39 = 136315394;
    long long v217 = v39;
    *(void *)&long long v39 = 138412290;
    long long v207 = v39;
    v218 = v35;
    uint64_t v40 = &OBJC_PROTOCOL___PREditingDelegate.cb;
    while (1)
    {
      unint64_t v41 = *v22;
      v228 = (_DWORD *)*(v22 - 1);
      swift_bridgeObjectRetain();
      os_log_type_t v42 = sub_100028E90();
      if (qword_10003CA38 != -1) {
        swift_once();
      }
      if (os_log_type_enabled(*((os_log_t *)v40 + 369), v42))
      {
        sub_1000272A0();
        unint64_t v21 = (char *)sub_100026E9C();
        sub_100026E84();
        sub_10002778C();
        id v234 = v43;
        *(_DWORD *)unint64_t v21 = v220;
        swift_bridgeObjectRetain();
        *(void *)(v21 + 4) = sub_10001EC50((uint64_t)v228, (unint64_t)p_cb, (uint64_t *)&v234);
        swift_bridgeObjectRelease_n();
        sub_100027BF4();
        sub_100027304(v44, v45, v46, "Processing descriptor '%s'");
        swift_arrayDestroy();
        unint64_t v41 = (unint64_t)p_cb;
        sub_100026E6C();
        sub_100026E6C();
      }
      sub_100028B00();
      sub_100028AF0(v47);
      v49 = v48;
      id v234 = 0;
      id v50 = objc_msgSend(v222, "loadFromURL:error:", v48, &v234, v206[0]);

      if (v50)
      {
        uint64_t v224 = v36;
        id v51 = v234;
        v227 = (void (*)(void))v50;
        os_log_type_t v52 = sub_100028E60();
        BOOL v53 = sub_100027B64(v52);
        v225 = v22;
        if (v53)
        {
          sub_1000272A0();
          uint64_t v54 = v227;
          sub_10002778C();
          sub_100026EDC();
          uint64_t v55 = (void *)sub_100026FB0();
          uint64_t v56 = sub_100026E84();
          sub_100027288(v56, (uint64_t)&a17);
          swift_bridgeObjectRetain();
          uint64_t v57 = sub_10001EC50((uint64_t)v228, (unint64_t)p_cb, (uint64_t *)&v234);
          sub_100027598(v57);
          sub_100028F10();
          swift_bridgeObjectRelease_n();
          id v58 = sub_100027204();
          sub_100028F10();
          *uint64_t v55 = v50;

          unint64_t v41 = (unint64_t)p_cb;
          sub_100027B2C((void *)&_mh_execute_header, v21, (os_log_type_t)v36, "Successfully loaded updated descriptor model '%s': %@'");
          sub_100009C74(&qword_10003D468);
          sub_100027140();
          sub_100026E6C();
          uint64_t v35 = v218;
          sub_10002711C();
          uint64_t v40 = (_DWORD *)(&OBJC_PROTOCOL___PREditingDelegate + 64);
          uint64_t v22 = v225;
          sub_100026E6C();
          sub_100026E6C();
        }
        uint64_t v59 = v216;
        v60 = v227;
        if (!*(void *)(v216 + 16)) {
          goto LABEL_23;
        }
        swift_bridgeObjectRetain();
        unint64_t v61 = sub_10001F8D4((uint64_t)v228, v41);
        if ((v62 & 1) == 0)
        {
          swift_bridgeObjectRelease();
LABEL_23:
          os_log_type_t v109 = sub_100028E90();
          if (sub_1000273FC(v109))
          {
            sub_1000272A0();
            v110 = v40;
            uint64_t v111 = sub_100026E9C();
            uint64_t v112 = sub_100026E84();
            uint64_t v113 = sub_1000276E8(v112);
            *(void *)(v111 + 4) = sub_100027BBC(v113, v114, (uint64_t *)&v234);
            sub_100027474();
            sub_100027BF4();
            sub_10002703C(v115, v116, v117, "No current descriptor '%s'");
            sub_100026FC8();
            sub_100026E6C();
            uint64_t v40 = v110;
            sub_100026E6C();
          }
LABEL_33:
          os_log_type_t v138 = sub_100028E90();
          if (sub_1000273FC(v138))
          {
            sub_1000272A0();
            v139 = v40;
            uint64_t v140 = sub_100026E9C();
            uint64_t v141 = sub_100026E84();
            uint64_t v142 = sub_1000276E8(v141);
            *(void *)(v140 + 4) = sub_100027BBC(v142, v143, (uint64_t *)&v234);
            sub_100027474();
            sub_100027BF4();
            sub_10002703C(v144, v145, v146, "Descriptor '%s' has changed, updating");
            sub_100026FC8();
            sub_100026E6C();
            uint64_t v40 = v139;
            sub_100026E6C();
          }
          sub_10002789C();
          v147 = v214;
          v148 = v226;
          sub_100011248();
          if (v148)
          {
            v150 = v148;
            p_cb = 0;

            id v234 = v150;
            sub_100009C74(&qword_10003D458);
            uint64_t v151 = sub_100027D18();
            sub_10000BAE8(v151, (unint64_t *)&unk_10003D8B0);
            sub_100026F10();
            v152 = (void *)v230;
            os_log_type_t v153 = sub_100028E80();
            BOOL v154 = sub_100027A00(v153);
            v226 = 0;
            if (v154)
            {
              id v155 = v152;
              swift_bridgeObjectRetain();
              id v156 = v155;
              uint64_t v157 = sub_100026EDC();
              uint64_t v158 = sub_1000270CC();
              uint64_t v159 = sub_100027574(v158);
              uint64_t v161 = sub_100027BBC(v159, v160, &v233);
              sub_1000279AC(v161);
              sub_100028F10();
              sub_100027474();
              *(_WORD *)(v157 + 12) = 2080;
              p_cb = (void (*)(void))(v157 + 14);
              id v162 = [v156 localizedDescription];
              uint64_t v163 = sub_100028CE0();
              unint64_t v165 = v164;

              uint64_t v229 = sub_10001EC50(v163, v165, &v233);
              uint64_t v35 = v218;
              sub_100028F10();

              swift_bridgeObjectRelease();
              sub_100027338((void *)&_mh_execute_header, v147, (os_log_type_t)v21, "Failed to create descriptor '%s': %s");
              swift_arrayDestroy();
              uint64_t v40 = (_DWORD *)(&OBJC_PROTOCOL___PREditingDelegate + 64);
              uint64_t v22 = v225;
              sub_100026E6C();
              sub_100026E6C();
            }
            else
            {

              swift_bridgeObjectRelease();
            }
            sub_10002706C();
            v176();
            swift_errorRelease();
            uint64_t v36 = v224;
          }
          else
          {
            v166 = v149;

            os_log_type_t v167 = sub_100028E90();
            BOOL v168 = sub_100027B64(v167);
            v226 = 0;
            if (v168)
            {
              id v169 = v166;
              sub_100027CAC();
              swift_bridgeObjectRetain();
              unint64_t v170 = v41;
              v171 = v147;
              sub_100026EDC();
              v210 = (void *)sub_100026FB0();
              uint64_t v172 = sub_100026E84();
              sub_100027288(v172, (uint64_t)&a17);
              swift_bridgeObjectRetain();
              uint64_t v173 = sub_10001EC50((uint64_t)v228, v170, (uint64_t *)&v234);
              sub_100027598(v173);
              sub_100028F10();
              swift_bridgeObjectRelease_n();
              v174 = v22;
              id v175 = sub_100027204();
              sub_100028F10();
              void *v210 = v171;

              p_cb = (void (*)(void))(&OBJC_PROTOCOL___PREditingDelegate + 64);
              uint64_t v22 = v174;
              sub_100027B2C((void *)&_mh_execute_header, v21, (os_log_type_t)v60, "Successfully created updated descriptor '%s': %@");
              sub_100009C74(&qword_10003D468);
              swift_arrayDestroy();
              sub_100026E6C();
              uint64_t v35 = v218;
              swift_arrayDestroy();
              sub_100026E6C();
              sub_100026E6C();
            }
            else
            {
              p_cb = (void (*)(void))v40;
              swift_bridgeObjectRelease();
            }
            uint64_t v36 = v224;
            sub_100028D30();
            sub_100027984();
            if (v177) {
              sub_100026EF4();
            }
            sub_100028DB0();
            sub_100028D80();

            sub_10002706C();
            v178();
            uint64_t v40 = (uint32_t *)p_cb;
          }
          goto LABEL_50;
        }
        unint64_t v21 = (char *)*(id *)(*(void *)(v59 + 56) + 8 * v61);
        swift_bridgeObjectRelease();
        os_log_type_t v63 = sub_100028E90();
        BOOL v64 = sub_1000273FC(v63);
        v215 = v21;
        if (v64)
        {
          v65 = v21;
          id v66 = (_DWORD *)sub_100026E9C();
          sub_100026FB0();
          sub_10002778C();
          *id v66 = v207;
          id v234 = v65;
          v67 = v65;
          v60 = v227;
          sub_100028F10();
          *(void *)unint64_t v41 = v65;

          uint64_t v35 = v218;
          sub_100027BF4();
          sub_100027304(v68, v69, v70, "Found current descriptor '%@'");
          sub_100009C74(&qword_10003D468);
          swift_arrayDestroy();
          unint64_t v41 = (unint64_t)p_cb;
          sub_100026E6C();
          unint64_t v21 = v215;
          sub_100026E6C();
        }
        id v71 = [v21 assetDirectory];
        sub_100028B20();

        sub_100028AF0(v72);
        uint64_t v74 = v73;
        p_cb = *v221;
        sub_1000270C0();
        p_cb();
        id v234 = 0;
        v75 = [v222 loadFromURL:v74 error:&v234];

        id v76 = v234;
        if (!v75)
        {
          v119 = v76;
          v120 = (void *)sub_100028AC0();

          swift_willThrow();
          id v234 = v120;
          sub_100009C74(&qword_10003D458);
          uint64_t v121 = sub_100027D18();
          sub_10000BAE8(v121, (unint64_t *)&unk_10003D8B0);
          sub_100026F10();
          v122 = (void *)v230;
          os_log_type_t v123 = sub_100028E80();
          v124 = qword_10003DB88;
          os_log_type_t v125 = v123;
          BOOL v126 = os_log_type_enabled((os_log_t)qword_10003DB88, v123);
          v226 = 0;
          if (v126)
          {
            sub_1000272A0();
            id v127 = v122;
            uint64_t v128 = sub_100026EDC();
            v210 = (void *)sub_1000270CC();
            uint64_t v129 = sub_100027574((uint64_t)v210);
            uint64_t v131 = sub_100027BBC(v129, v130, &v233);
            sub_1000279AC(v131);
            unint64_t v21 = *(char **)(v132 - 256);
            sub_100028F10();
            sub_100027474();
            *(_WORD *)(v128 + 12) = 2080;
            v206[1] = v128 + 14;
            id v133 = [v127 localizedDescription];
            sub_100028CE0();
            sub_10002778C();
            unint64_t v135 = v134;

            uint64_t v136 = v41;
            unint64_t v41 = 0;
            uint64_t v137 = sub_10001EC50(v136, v135, &v233);
            sub_1000276A4(v137);
            sub_100028F10();

            swift_bridgeObjectRelease();
            sub_100027338((void *)&_mh_execute_header, v124, v125, "Failed to load current descriptor model '%s': %s");
            swift_arrayDestroy();
            sub_100026E6C();
            v60 = v227;
            sub_100026E6C();
          }
          else
          {
          }
          swift_errorRelease();
          goto LABEL_32;
        }
        os_log_type_t v77 = sub_100028E60();
        id v78 = qword_10003DB88;
        os_log_type_t v79 = v77;
        BOOL v80 = os_log_type_enabled((os_log_t)qword_10003DB88, v77);
        v210 = v75;
        if (v80)
        {
          sub_1000272A0();
          v81 = v75;
          unint64_t v82 = v41;
          sub_100026EDC();
          uint64_t v83 = (void *)sub_100026FB0();
          uint64_t v84 = sub_100026E84();
          sub_100027288(v84, (uint64_t)&v234);
          swift_bridgeObjectRetain();
          uint64_t v230 = sub_10001EC50((uint64_t)v228, v41, (uint64_t *)&v234);
          sub_100028F10();
          swift_bridgeObjectRelease_n();
          id v85 = sub_100027204();
          v75 = v210;
          sub_100028F10();
          *uint64_t v83 = v75;

          unint64_t v41 = v82;
          sub_100027B2C((void *)&_mh_execute_header, v78, v79, "Successfully loaded current descriptor model '%s': %@");
          sub_100009C74(&qword_10003D468);
          sub_100027140();
          sub_100026E6C();
          uint64_t v35 = v218;
          sub_10002711C();
          unint64_t v21 = v215;
          sub_100026E6C();
          sub_100026E6C();
        }
        sub_10000BAE8(0, &qword_10003D9D0);
        v60 = v227;
        uint64_t v86 = v227;
        char v87 = sub_100028EF0();

        if ((v87 & 1) == 0)
        {

LABEL_32:
          uint64_t v40 = &OBJC_PROTOCOL___PREditingDelegate.cb;
          uint64_t v22 = v225;
          goto LABEL_33;
        }

        sub_100028E90();
        if (sub_100027CD0())
        {
          swift_bridgeObjectRetain();
          uint64_t v88 = sub_100026E9C();
          v227 = p_cb;
          v89 = v21;
          v90 = (_DWORD *)v88;
          id v234 = (id)sub_100026E84();
          _DWORD *v90 = v220;
          swift_bridgeObjectRetain();
          uint64_t v91 = sub_10001EC50((uint64_t)v228, v41, (uint64_t *)&v234);
          sub_100027598(v91);
          sub_100028F10();
          swift_bridgeObjectRelease_n();
          sub_100027A20();
          sub_100027304(v92, v93, v94, "Descriptor '%s' hasn't changed, keeping");
          swift_arrayDestroy();
          sub_100026E6C();
          unint64_t v21 = v89;
          p_cb = v227;
          sub_100026E6C();
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        uint64_t v36 = v224;
        v179 = v21;
        sub_100028D30();
        unint64_t v21 = *(char **)((v232 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if ((unint64_t)v21 >= *(void *)((v232 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100026EF4();
        }
        sub_100027AAC();
        sub_100028DB0();
        sub_100028D80();

        sub_1000270C0();
        p_cb();
        uint64_t v40 = (_DWORD *)(&OBJC_PROTOCOL___PREditingDelegate + 64);
        uint64_t v22 = v225;
      }
      else
      {
        id v95 = v234;
        v96 = sub_100027D00();

        p_cb = (void (*)(void))v96;
        swift_willThrow();
        id v234 = v96;
        sub_100009C74(&qword_10003D458);
        uint64_t v97 = sub_100027D18();
        sub_10000BAE8(v97, (unint64_t *)&unk_10003D8B0);
        sub_100026F10();
        v98 = (void *)v230;
        os_log_type_t v99 = sub_100028E80();
        BOOL v100 = sub_100027A00(v99);
        v226 = 0;
        if (v100)
        {
          id v101 = v98;
          swift_bridgeObjectRetain();
          id v102 = v101;
          sub_100026EDC();
          sub_10002778C();
          uint64_t v103 = sub_1000270CC();
          uint64_t v224 = v36;
          v225 = v22;
          uint64_t v233 = v103;
          *(_DWORD *)unint64_t v41 = v217;
          swift_bridgeObjectRetain();
          *(void *)(v41 + 4) = sub_10001EC50((uint64_t)v228, (unint64_t)v96, &v233);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v41 + 12) = 2080;
          p_cb = (void (*)(void))[v102 localizedDescription];
          v104 = v40;
          uint64_t v105 = sub_100028CE0();
          unint64_t v107 = v106;

          uint64_t v35 = v218;
          uint64_t v108 = v105;
          uint64_t v40 = v104;
          *(void *)(v41 + 14) = sub_10001EC50(v108, v107, &v233);

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v96, (os_log_type_t)v21, "Failed to load updated descriptor model '%s': %s", (uint8_t *)v41, 0x16u);
          swift_arrayDestroy();
          uint64_t v36 = v224;
          uint64_t v22 = v225;
          sub_100026E6C();
          sub_100026E6C();
        }
        else
        {

          swift_bridgeObjectRelease();
        }
        sub_10002706C();
        v118();
        swift_errorRelease();
      }
LABEL_50:
      v22 += 2;
      if (!--v36)
      {
        swift_bridgeObjectRelease();
        os_log_t v38 = &off_10002A000;
        sub_100027498();
        goto LABEL_53;
      }
    }
  }
  sub_100027498();
  uint64_t v40 = &OBJC_PROTOCOL___PREditingDelegate.cb;
LABEL_53:
  if (sub_10001573C())
  {
    v180 = v40;
    v181 = v226;
    sub_100017668();
    if (v181)
    {
      v183 = v38;
      id v234 = v181;
      sub_100009C74(&qword_10003D458);
      sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
      sub_100026F10();
      v184 = (void *)v230;
      os_log_type_t v185 = sub_100028E80();
      if (qword_10003CA38 != -1) {
        swift_once();
      }
      v186 = *((void *)v180 + 369);
      os_log_type_t v187 = v185;
      if (sub_100027350())
      {
        id v188 = v184;
        v189 = (_DWORD *)sub_100026E9C();
        uint64_t v233 = sub_100026E84();
        _DWORD *v189 = *((void *)v183 + 179);
        v228 = v189 + 1;
        id v190 = [v188 localizedDescription];
        sub_100028CE0();
        sub_1000278D8();
        uint64_t v191 = (uint64_t)v35;
        uint64_t v35 = (char *)&type metadata for Any;
        uint64_t v192 = sub_10001EC50(v191, (unint64_t)v22, &v233);
        sub_100027998(v192);
        sub_100028F10();

        uint64_t v22 = (void *)(&OBJC_PROTOCOL___PREditingDelegate + 64);
        swift_bridgeObjectRelease();
        v193 = v186;
        os_log_t v38 = v183;
        sub_10002703C((void *)&_mh_execute_header, v193, v187, "Failed to create CreateAFacePeople descriptor: %s");
        swift_arrayDestroy();
        sub_100026E6C();
        uint64_t v40 = (_DWORD *)(&OBJC_PROTOCOL___PREditingDelegate + 64);
        sub_100026E6C();

        swift_errorRelease();
        v226 = 0;
        sub_100027498();
        goto LABEL_64;
      }

      swift_errorRelease();
      v226 = 0;
      os_log_t v38 = v183;
      sub_100027498();
    }
    else
    {
      id v194 = v182;
      sub_100028D30();
      sub_100027984();
      if (v177) {
        sub_100026EF4();
      }
      sub_100028DB0();
      sub_100028D80();

      sub_100027498();
      v226 = 0;
    }
    uint64_t v40 = v180;
  }
LABEL_64:
  if (sub_100015C80())
  {
    v195 = v226;
    sub_100017668();
    if (v195)
    {
      v197 = v40;
      v198 = v38;
      id v234 = v195;
      sub_100009C74(&qword_10003D458);
      sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
      sub_100026F10();
      v199 = (void *)v230;
      os_log_type_t v200 = sub_100028E80();
      if (qword_10003CA38 != -1) {
        swift_once();
      }
      v201 = *((void *)v197 + 369);
      os_log_type_t v202 = v200;
      if (sub_100027350())
      {
        id v203 = v199;
        sub_100026E9C();
        uint64_t v233 = sub_100026E84();
        sub_100027564(COERCE_FLOAT(*((void *)v198 + 179)));
        [v203 localizedDescription];
        sub_100028CE0();
        sub_1000278D8();
        uint64_t v204 = sub_10001EC50((uint64_t)v35, (unint64_t)v22, &v233);
        sub_100027998(v204);
        sub_100028F10();

        swift_bridgeObjectRelease();
        sub_10002703C((void *)&_mh_execute_header, v201, v202, "Failed to create CreateAFaceLivePhoto descriptor: %s");
        sub_100026FC8();
        sub_100026E6C();
        sub_100026E6C();
      }
      else
      {
      }
      swift_errorRelease();
    }
    else
    {
      id v205 = v196;
      sub_100028D30();
      if (*(void *)((v232 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v232 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100026EF4();
      }
      sub_100028DB0();
      sub_100028D80();
    }
  }
  sub_100026F74();
}

void *sub_10000F5E4(uint64_t a1)
{
  id v40 = 0;
  id v2 = [self openPhotoLibraryWithWellKnownIdentifier:1 error:&v40];
  id v3 = v40;
  p_cb = &OBJC_PROTOCOL___PREditingDelegate.cb;
  uint64_t v5 = &off_10002A000;
  if (v2)
  {
    os_log_t v38 = v2;
    uint64_t v6 = self;
    id v7 = v3;
    id v8 = [v6 standardUserDefaults];
    sub_10002748C();
    NSString v9 = sub_100028CB0();
    unsigned int v10 = [v8 BOOLForKey:v9];

    char v11 = v10 ^ 1;
    os_log_type_t v12 = sub_100028E90();
    if (qword_10003CA38 != -1) {
      swift_once();
    }
    uint64_t v13 = qword_10003DB88;
    os_log_type_t v14 = v12;
    if (os_log_type_enabled((os_log_t)qword_10003DB88, v12))
    {
      unint64_t v15 = (_DWORD *)sub_100026E9C();
      uint64_t v16 = (void *)sub_100026E84();
      *unint64_t v15 = 136315138;
      id v40 = v16;
      if (v10) {
        uint64_t v17 = 0x6574746120746F6ELL;
      }
      else {
        uint64_t v17 = 0x6974706D65747461;
      }
      if (v10) {
        unint64_t v18 = 0xEE00676E6974706DLL;
      }
      else {
        unint64_t v18 = 0xEA0000000000676ELL;
      }
      uint64_t v39 = sub_10001EC50(v17, v18, (uint64_t *)&v40);
      sub_100028F10();
      swift_bridgeObjectRelease();
      sub_100027304((void *)&_mh_execute_header, v13, v14, "Cold Start Mode, generating fallback descriptors %s to use existing Suggestions");
      sub_100027140();
      uint64_t v5 = &off_10002A000;
      sub_100026E6C();
      sub_100026E6C();
    }
    unint64_t v19 = sub_100014C38(a1, v38, v11);
    os_log_type_t v20 = sub_100028E90();
    unint64_t v21 = qword_10003DB88;
    if (os_log_type_enabled((os_log_t)qword_10003DB88, v20))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v22 = (uint8_t *)sub_100026E9C();
      *(_DWORD *)uint64_t v22 = *((void *)v5 + 328);
      if (v19 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v23 = (void *)sub_1000290A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v23 = *(void **)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      id v40 = v23;
      sub_100028F10();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v21, v20, "Cold Start Mode, generated %ld fallback descriptors", v22, 0xCu);
      sub_100026E6C();
    }
    sub_10000FDFC(v19);
    if (sub_100015C80())
    {
      sub_100017668();
      id v26 = v25;
      sub_100028D30();
      unint64_t v27 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= v27 >> 1)
      {
        sub_100027978(v27);
        sub_100028D90();
      }
      sub_100028DB0();
      sub_100028D80();
    }
    else
    {
    }
    return _swiftEmptyArrayStorage;
  }
  else
  {
    id v24 = v40;
    swift_bridgeObjectRelease();
    sub_100028AC0();

    swift_willThrow();
    sub_100009C74(&qword_10003D458);
    sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
    sub_100026F98();
    id v28 = v40;
    uint64_t v29 = sub_100028E80();
    if (qword_10003CA38 != -1) {
      swift_once();
    }
    uint64_t v30 = qword_10003DB88;
    os_log_type_t v31 = v29;
    if (os_log_type_enabled((os_log_t)qword_10003DB88, (os_log_type_t)v29))
    {
      uint64_t v29 = (uint64_t)v28;
      uint64_t v32 = (_DWORD *)sub_100026E9C();
      uint64_t v39 = sub_100026E84();
      *uint64_t v32 = 136315138;
      id v33 = [(id)v29 localizedDescription];
      sub_100028CE0();
      sub_1000278D8();
      sub_10001EC50(a1, (unint64_t)&type metadata for Any, &v39);
      sub_100028F10();

      swift_bridgeObjectRelease();
      sub_100027304((void *)&_mh_execute_header, v30, v31, "No photo library available, unable to generate fallback descriptors: %s");
      sub_10002760C();
      p_cb = (_DWORD *)(&OBJC_PROTOCOL___PREditingDelegate + 64);
      sub_100026E6C();
      sub_100026E6C();
    }
    else
    {
    }
    swift_errorRelease();
    uint64_t v34 = swift_bridgeObjectRetain();
    sub_10001FD58(v34);
    sub_100027CB8();
    swift_bridgeObjectRelease();
    os_log_type_t v35 = sub_100028E90();
    uint64_t v36 = *((void *)p_cb + 369);
    if (os_log_type_enabled(v36, v35))
    {
      swift_retain_n();
      *(_DWORD *)sub_100026E9C() = 134217984;
      if (v29 < 0 || (v29 & 0x4000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        sub_1000290A0();
        swift_release();
      }
      swift_release();
      sub_100027668();
      sub_100028F10();
      swift_release();
      sub_10002703C((void *)&_mh_execute_header, v36, v35, "ColdStart, Returning %ld existing descriptors");
      sub_100026E6C();
    }
  }
  return (void *)v29;
}

uint64_t sub_10000FDFC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000290A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000290A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (__OFADD__(v4, v3))
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v5 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v5;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
    {
      uint64_t v7 = v5 & 0xFFFFFFFFFFFFFF8;
      if (v4 + v3 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_12;
      }
    }
  }
  if (v5 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100028FF0();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v8;
    uint64_t v7 = v8 & 0xFFFFFFFFFFFFFF8;
LABEL_12:
    uint64_t result = sub_1000258E8(v7 + 8 * *(void *)(v7 + 16) + 32, (*(void *)(v7 + 24) >> 1) - *(void *)(v7 + 16), a1);
    if (v10 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_1000290A0();
    swift_bridgeObjectRelease();
  }
  if (v10 >= 1)
  {
    uint64_t v11 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v12 = __OFADD__(v11, v10);
    uint64_t v13 = v11 + v10;
    if (v12)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v13;
  }
  swift_bridgeObjectRelease();
  return sub_100028D80();
}

uint64_t sub_10000FFC4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_1000106A0(v3);
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1000290A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = _swiftEmptyArrayStorage;
  uint64_t v47 = v4;
  if (v5)
  {
    id v48 = _swiftEmptyArrayStorage;
    sub_10001F474(0, v5 & ~(v5 >> 63), 0);
    if (v5 < 0)
    {
      __break(1u);
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
    uint64_t v7 = 0;
    uint64_t v6 = v48;
    do
    {
      if ((a2 & 0xC000000000000001) != 0) {
        id v8 = (id)sub_100028FE0();
      }
      else {
        id v8 = *(id *)(a2 + 8 * v7 + 32);
      }
      NSString v9 = v8;
      id v10 = objc_msgSend(v8, "identifier", v47);
      uint64_t v11 = sub_100028CE0();
      uint64_t v13 = v12;

      id v48 = v6;
      unint64_t v15 = v6[2];
      unint64_t v14 = v6[3];
      if (v15 >= v14 >> 1)
      {
        BOOL v17 = sub_100027978(v14);
        sub_10001F474((char *)v17, v15 + 1, 1);
        uint64_t v6 = v48;
      }
      ++v7;
      v6[2] = v15 + 1;
      uint64_t v16 = &v6[2 * v15];
      v16[4] = v11;
      v16[5] = v13;
    }
    while (v5 != v7);
    uint64_t v4 = v47;
  }
  uint64_t v18 = sub_100010820((uint64_t)v6);
  os_log_type_t v19 = sub_100028E90();
  if (qword_10003CA38 != -1) {
    swift_once();
  }
  p_cb = &OBJC_PROTOCOL___PREditingDelegate.cb;
  if (sub_100027CD0())
  {
    swift_bridgeObjectRetain();
    *(_DWORD *)sub_100026E9C() = 134217984;
    id v48 = (void *)v5;
    sub_100028F10();
    swift_bridgeObjectRelease();
    sub_100027A20();
    sub_100027534(v21, v22, v23, v24);
    sub_100026E6C();
  }
  swift_bridgeObjectRetain();
  sub_1000108D4(v4, v18);
  uint64_t v25 = swift_bridgeObjectRetain();
  sub_10001FF04(v25);
  sub_10002745C();
  id v48 = (void *)a2;
  sub_10001FBF0((uint64_t *)&v48, (uint64_t (*)(uint64_t))sub_10002674C, sub_100021660);
  swift_bridgeObjectRelease();
  os_log_type_t v26 = sub_100028E90();
  unint64_t v27 = qword_10003DB88;
  if (sub_1000276B4(v26))
  {
    swift_retain();
    uint64_t v28 = sub_100026EDC();
    id v48 = (void *)sub_100026E84();
    sub_1000272D4(3.8521e-34);
    *(_WORD *)(v28 + 12) = 2080;
    sub_100009C74(&qword_10003D9B8);
    sub_100026708(&qword_10003D9C0, &qword_10003D9B8);
    sub_10002776C();
    uint64_t v29 = sub_100028CA0();
    sub_10001EC50(v29, v30, (uint64_t *)&v48);
    sub_10002754C();
    uint64_t v4 = v47;
    sub_100028F10();
    swift_release_n();
    swift_bridgeObjectRelease();
    sub_100027338((void *)&_mh_execute_header, v27, v19, "Added %ld: \n%s");
    sub_100027140();
    p_cb = (_DWORD *)(&OBJC_PROTOCOL___PREditingDelegate + 64);
    sub_100026E6C();
    sub_100026E6C();
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRetain();
  os_log_type_t v31 = (void *)sub_100023B48(v18, v4);
  uint64_t v32 = swift_bridgeObjectRetain();
  id v33 = sub_10001FF04(v32);
  swift_release();
  id v48 = v33;
  sub_10001FBF0((uint64_t *)&v48, (uint64_t (*)(uint64_t))sub_10002674C, sub_100021660);
  swift_release();
  os_log_type_t v34 = sub_100028E90();
  os_log_type_t v35 = *((void *)p_cb + 369);
  if (sub_1000276B4(v34))
  {
    swift_retain();
    uint64_t v36 = sub_100026EDC();
    id v48 = (void *)sub_100026E84();
    sub_1000272D4(3.8521e-34);
    *(_WORD *)(v36 + 12) = 2080;
    sub_100009C74(&qword_10003D9B8);
    sub_100026708(&qword_10003D9C0, &qword_10003D9B8);
    sub_10002776C();
    uint64_t v4 = v47;
    uint64_t v37 = sub_100028CA0();
    os_log_type_t v31 = (void *)v38;
    sub_10001EC50(v37, v38, (uint64_t *)&v48);
    sub_100027844();
    sub_100028F10();
    swift_release_n();
    swift_bridgeObjectRelease();
    sub_100027338((void *)&_mh_execute_header, v35, v19, "Maintained %ld: \n%s");
    sub_100027140();
    p_cb = (_DWORD *)(&OBJC_PROTOCOL___PREditingDelegate + 64);
    sub_100026E6C();
    sub_100026E6C();
  }
  else
  {
    swift_release();
  }
  sub_1000108D4(v18, v4);
  swift_bridgeObjectRelease();
  uint64_t v39 = swift_bridgeObjectRetain();
  sub_10001FF04(v39);
  sub_100027810();
  id v48 = v31;
  sub_10001FBF0((uint64_t *)&v48, (uint64_t (*)(uint64_t))sub_10002674C, sub_100021660);
  swift_bridgeObjectRelease();
  os_log_type_t v40 = sub_100028E90();
  unint64_t v41 = *((void *)p_cb + 369);
  os_log_type_t v42 = v40;
  if (!os_log_type_enabled(v41, v40)) {
    return swift_release();
  }
  swift_retain();
  uint64_t v43 = sub_100026EDC();
  id v48 = (void *)sub_100026E84();
  *(_DWORD *)uint64_t v43 = 134218242;
  sub_100028F10();
  *(_WORD *)(v43 + 12) = 2080;
  sub_100009C74(&qword_10003D9B8);
  sub_100026708(&qword_10003D9C0, &qword_10003D9B8);
  sub_10002776C();
  uint64_t v44 = sub_100028CA0();
  sub_10001EC50(v44, v45, (uint64_t *)&v48);
  sub_100028F10();
  swift_release_n();
  swift_bridgeObjectRelease();
  _os_log_impl((void *)&_mh_execute_header, v41, v42, "Removed %ld: \n%s", (uint8_t *)v43, 0x16u);
  sub_10002760C();
  sub_100026E6C();
  return sub_100026E6C();
}

uint64_t sub_1000106A0(uint64_t a1)
{
  uint64_t v18 = sub_100028E40();
  uint64_t result = sub_100025E28(a1, v19);
  uint64_t v3 = v19[0];
  uint64_t v4 = v19[1];
  int64_t v5 = v19[3];
  unint64_t v6 = v20;
  int64_t v7 = (unint64_t)(v19[2] + 64) >> 6;
  if (!v20) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v9 = v8 | (v5 << 6);
  while (1)
  {
    unint64_t v14 = (Swift::Int *)(*(void *)(v3 + 48) + 16 * v9);
    Swift::Int v15 = *v14;
    Swift::Int v16 = v14[1];
    swift_bridgeObjectRetain();
    sub_100023098(&v17, v15, v16);
    uint64_t result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v10 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v10 >= v7) {
      goto LABEL_21;
    }
    unint64_t v11 = *(void *)(v4 + 8 * v10);
    int64_t v12 = v5 + 1;
    if (!v11)
    {
      int64_t v12 = v5 + 2;
      if (v5 + 2 >= v7) {
        goto LABEL_21;
      }
      unint64_t v11 = *(void *)(v4 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v5 + 3;
        if (v5 + 3 >= v7) {
          goto LABEL_21;
        }
        unint64_t v11 = *(void *)(v4 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v5 + 4;
          if (v5 + 4 >= v7) {
            goto LABEL_21;
          }
          unint64_t v11 = *(void *)(v4 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v5 + 5;
            if (v5 + 5 >= v7) {
              goto LABEL_21;
            }
            unint64_t v11 = *(void *)(v4 + 8 * v12);
            if (!v11)
            {
              int64_t v13 = v5 + 6;
              while (v13 < v7)
              {
                unint64_t v11 = *(void *)(v4 + 8 * v13++);
                if (v11)
                {
                  int64_t v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
LABEL_21:
              swift_release();
              return v18;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v5 = v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_100010820(uint64_t a1)
{
  uint64_t v2 = sub_100028E40();
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
      sub_100023098(&v9, v5, v6);
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

unint64_t *sub_1000108D4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) <= *(void *)(a2 + 16) >> 3)
  {
    sub_100023248(a1);
    return (unint64_t *)a2;
  }
  else
  {
    return sub_1000233F4(a1, a2);
  }
}

void sub_100010938()
{
  sub_100027184();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_100028B50();
  sub_10000C214();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_100027278();
  __chkstk_darwin(v8);
  sub_10002743C();
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v69 - v10;
  id v12 = [v4 media];
  sub_10000BAE8(0, &qword_10003D8C0);
  uint64_t v13 = sub_100028D60();

  if ((unint64_t)v13 >> 62)
  {
    if (v13 < 0) {
      id v14 = (id)v13;
    }
    else {
      id v14 = (id)(v13 & 0xFFFFFFFFFFFFFF8);
    }
    swift_bridgeObjectRetain();
    sub_1000290A0();
    sub_100027810();
    if (v14)
    {
LABEL_3:
      uint64_t v79 = v6;
      if ((v13 & 0xC000000000000001) != 0)
      {
        sub_100028FE0();
      }
      else
      {
        if (!*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_30;
        }
        id v15 = *(id *)(v13 + 32);
      }
      sub_100027810();
      id v16 = [v2 assetDirectory];
      sub_100028B20();

      id v76 = v14;
      id v17 = [v14 subpath];
      sub_100028CE0();

      sub_100027CF4();
      sub_100028B10();
      swift_bridgeObjectRelease();
      uint64_t v18 = self;
      uint64_t v80 = v0;
      sub_100028AF0(v19);
      unint64_t v21 = v20;
      v82[0] = 0;
      id v22 = [v18 loadStyleFromWallpaperURL:v20 error:v82];

      id v23 = v82[0];
      os_log_type_t v77 = v11;
      id v78 = v2;
      if (v22)
      {
        uint64_t v24 = self;
        id v25 = v23;
        id v26 = [(id)v24 styleWithBakedStyle:v22];
        id v27 = [v26 clockFont];
        *(void *)&long long v75 = sub_100028CE0();

        sub_10000BAE8(0, &qword_10003D9B0);
        id v28 = [v26 clockColor];
        id v29 = [self whiteColor];
        LOBYTE(v24) = sub_100028EF0();

        if (v24)
        {
          id v30 = [v26 kind];
          int v31 = PIParallaxStylePrefersVibrantClockForKind();

          uint64_t v32 = self;
          if (v31) {
            id v33 = [v32 vibrantMaterialColor];
          }
          else {
            id v33 = [v32 vibrantMonochromeColor];
          }
          unint64_t v11 = (char *)v33;
        }
        else
        {
          id v53 = [v26 clockColor];
          id v54 = [v53 CGColor];

          id v55 = [objc_allocWithZone((Class)UIColor) initWithCGColor:v54];
          [v26 clockVibrancy];
          id v56 = objc_msgSend(v55, "colorWithAlphaComponent:");

          unint64_t v11 = (char *)[objc_allocWithZone((Class)PRPosterColor) initWithColor:v56 preferredStyle:2];
        }
        uint64_t v48 = v79;
        goto LABEL_20;
      }
      id v34 = v82[0];
      sub_100027CC4();
      uint64_t v35 = sub_100028AC0();

      uint64_t v74 = v35;
      swift_willThrow();
      id v36 = [v4 styleCategory];
      if (!v36) {
        id v36 = PFParallaxStyleCategoryTrueColors;
      }
      id v73 = v36;
      uint64_t v13 = (uint64_t)(id)PFDefaultParallaxStyleKindForCategory();
      id v14 = (id)PIParallaxStyleClockFontForKind();
      *(void *)&long long v75 = sub_100028CE0();
      uint64_t v4 = v37;

      unint64_t v11 = (char *)[self vibrantMaterialColor];
      LOBYTE(v14) = sub_100028E60();
      uint64_t v0 = v79;
      if (qword_10003CA38 == -1)
      {
LABEL_13:
        unint64_t v38 = qword_10003DB88;
        sub_100027134();
        v39();
        os_log_type_t v40 = v14;
        BOOL v41 = os_log_type_enabled(v38, (os_log_type_t)v14);
        id v42 = (id)v13;
        uint64_t v43 = v42;
        if (v41)
        {
          id v70 = v42;
          uint64_t v44 = sub_100026EDC();
          id v71 = (void *)sub_1000270CC();
          v82[0] = v71;
          *(_DWORD *)uint64_t v44 = 136315394;
          v72 = v4;
          uint64_t v45 = sub_100028B30(1);
          uint64_t v47 = sub_10001EC50(v45, v46, (uint64_t *)v82);
          sub_100027858(v47);
          uint64_t v48 = v0;
          sub_100028F10();
          swift_bridgeObjectRelease();
          sub_1000270C0();
          v49();
          *(_WORD *)(v44 + 12) = 2080;
          id v50 = v70;
          uint64_t v51 = sub_100028CE0();
          uint64_t v81 = sub_10001EC50(v51, v52, (uint64_t *)v82);
          sub_100028F10();

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v38, v40, "Failed to load poster style from '%s', falling back to '%s'", (uint8_t *)v44, 0x16u);
          swift_arrayDestroy();
          sub_100026E6C();
          sub_100026E6C();

          swift_errorRelease();
        }
        else
        {

          swift_errorRelease();
          sub_1000270C0();
          v57();

          uint64_t v48 = v0;
        }
LABEL_20:
        NSString v58 = sub_100028CB0();
        swift_bridgeObjectRelease();
        id v59 = PPCreateTimeFontConfiguration(v58, PRPosterRoleLockScreen);
        sub_100009C74(&qword_10003D450);
        uint64_t v60 = sub_100027BA4();
        long long v75 = xmmword_10002A560;
        *(_OWORD *)(v60 + 16) = xmmword_10002A560;
        *(void *)(v60 + 32) = v59;
        v82[0] = (id)v60;
        sub_100028D80();
        sub_10000BAE8(0, (unint64_t *)&unk_10003D9A0);
        id v61 = v59;
        sub_100027828();
        Class isa = sub_100028D40().super.isa;
        swift_bridgeObjectRelease();
        id v63 = v78;
        [v78 setPreferredTimeFontConfigurations:isa];

        uint64_t v64 = sub_100027BA4();
        *(_OWORD *)(v64 + 16) = v75;
        *(void *)(v64 + 32) = v11;
        v82[0] = (id)v64;
        sub_100028D80();
        v65 = (void *)sub_10000BAE8(0, &qword_10003D438);
        id v66 = v11;
        sub_100027CF4();
        sub_100028D40();
        sub_10002745C();
        [v63 setPreferredTitleColors:v65];

        v67 = *(void (**)(void))(v48 + 8);
        sub_100026F8C();
        v67();
        sub_100026F8C();
        v67();
        sub_100026F74();
        return;
      }
LABEL_30:
      swift_once();
      goto LABEL_13;
    }
  }
  else
  {
    id v14 = *(id *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14) {
      goto LABEL_3;
    }
  }
  sub_100026F74();
  swift_bridgeObjectRelease();
}

uint64_t sub_1000111E0(uint64_t a1)
{
  uint64_t result = sub_100025DA8(a1);
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
    return sub_100025D2C(result, v3, 0, a1);
  }
}

void sub_100011248()
{
  sub_1000270A8();
  uint64_t v2 = v1;
  uint64_t v3 = sub_100009C74((uint64_t *)&unk_10003D410);
  uint64_t v4 = sub_100027450(v3);
  __chkstk_darwin(v4);
  sub_1000277C8();
  uint64_t v5 = sub_100028B50();
  sub_10000C2C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v0, v2, v5);
  sub_10000B9B0(v0, 0, 1, v5);
  sub_10001182C();
  sub_1000269D0(v0, (uint64_t *)&unk_10003D410);
  sub_100027078();
}

void sub_100011348()
{
  sub_1000270A8();
  unint64_t v2 = v1;
  uint64_t v3 = sub_100009C74((uint64_t *)&unk_10003D410);
  uint64_t v4 = sub_100027450(v3);
  __chkstk_darwin(v4);
  sub_1000277C8();
  sub_10000BAE8(0, &qword_10003D930);
  Swift::Int v5 = sub_100028C90();
  if (v2 >> 62) {
    goto LABEL_24;
  }
  uint64_t v6 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_1000290A0())
  {
    uint64_t v37 = v0;
    unint64_t v39 = v2;
    unint64_t v40 = v2 & 0xC000000000000001;
    uint64_t v7 = 4;
    uint64_t v38 = v6;
    while (1)
    {
      if (v40)
      {
        sub_100027828();
        id v8 = (id)sub_100028FE0();
      }
      else
      {
        id v8 = *(id *)(v2 + 8 * v7);
      }
      uint64_t v9 = v8;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      uint64_t v41 = v7 - 3;
      uint64_t v10 = sub_10002565C(v8, (SEL *)&selRef_uuid);
      if (!v11) {
        goto LABEL_33;
      }
      uint64_t v12 = v10;
      uint64_t v13 = v11;
      id v14 = v9;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_10001F8D4(v12, v13);
      sub_100027864();
      if (v18) {
        goto LABEL_22;
      }
      unint64_t v2 = v16;
      uint64_t v0 = v17;
      sub_100009C74(&qword_10003D998);
      if (sub_100029060(isUniquelyReferenced_nonNull_native, v5))
      {
        unint64_t v19 = sub_10001F8D4(v12, v13);
        if ((v0 & 1) != (v20 & 1)) {
          goto LABEL_34;
        }
        unint64_t v2 = v19;
      }
      if (v0)
      {
        uint64_t v21 = *(void *)(v5 + 56);

        *(void *)(v21 + 8 * v2) = v14;
      }
      else
      {
        sub_100027A54(v5 + 8 * (v2 >> 6));
        id v23 = (uint64_t *)(v22 + 16 * v2);
        *id v23 = v12;
        v23[1] = v13;
        *(void *)(*(void *)(v5 + 56) + 8 * v2) = v14;
        uint64_t v24 = *(void *)(v5 + 16);
        BOOL v18 = __OFADD__(v24, 1);
        uint64_t v25 = v24 + 1;
        if (v18) {
          goto LABEL_23;
        }
        *(void *)(v5 + 16) = v25;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10002565C(v14, (SEL *)&selRef_uuid);
      id v26 = objc_allocWithZone((Class)PFPosterMedia);
      uint64_t v27 = sub_100027C88();
      id v29 = sub_10001D8DC(v27, v28);
      sub_100028D30();
      if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100028D90();
      }
      sub_100028DB0();
      sub_100028D80();

      ++v7;
      unint64_t v2 = v39;
      if (v41 == v38)
      {
        swift_bridgeObjectRelease();
        uint64_t v0 = v37;
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    sub_100027ACC();
  }
  swift_bridgeObjectRelease();
LABEL_26:
  sub_10000BAE8(0, &qword_10003D8E0);
  id v30 = sub_10000C724(1);
  id v31 = (id)PFParallaxStyleFrequencyTable();
  type metadata accessor for PFParallaxStyleCategory(0);
  uint64_t v32 = sub_100028D60();

  uint64_t v33 = *(void *)(v32 + 16);
  if (!v33)
  {
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v34 = qword_10003DB90 % v33;
  if (v34 < 0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  id v35 = *(id *)(v32 + 8 * v34 + 32);
  swift_bridgeObjectRelease();
  [v30 setStyleCategory:v35];

  if (!__OFADD__(qword_10003DB90, 1))
  {
    ++qword_10003DB90;
    uint64_t v36 = sub_100028B50();
    sub_10000B9B0(v0, 1, 1, v36);
    sub_10001182C();
    sub_1000269D0(v0, (uint64_t *)&unk_10003D410);

    swift_bridgeObjectRelease();
    sub_100027078();
    return;
  }
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  sub_100029150();
  __break(1u);
}

uint64_t sub_100011798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_100026534((_OWORD *)a1, v6);
    sub_10002523C(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000269D0(a1, &qword_10003D408);
    sub_100025104(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_1000269D0((uint64_t)v6, &qword_10003D408);
  }
}

void sub_10001182C()
{
  sub_1000270A8();
  os_log_t v171 = v1;
  uint64_t v172 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  os_log_t v167 = v7;
  unint64_t v173 = v8;
  uint64_t v9 = sub_100009C74((uint64_t *)&unk_10003D410);
  uint64_t v10 = sub_100027450(v9);
  __chkstk_darwin(v10);
  sub_100027268();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_100028B50();
  sub_10000C214();
  uint64_t v16 = v15;
  __chkstk_darwin(v17);
  sub_100027278();
  uint64_t v20 = v18 - v19;
  uint64_t v22 = __chkstk_darwin(v21);
  __chkstk_darwin(v22);
  sub_100027060();
  unint64_t v170 = v23;
  sub_100026F34();
  __chkstk_darwin(v24);
  id v26 = (char *)v161 - v25;
  if (sub_10000B9D8(v6, 1, v14) != 1 || v4)
  {
    unint64_t v165 = v0;
    uint64_t v168 = v16;
    sub_10000BAE8(0, (unint64_t *)&unk_10003D8E8);
    uint64_t v28 = (void *)PRPosterRoleLockScreen;
    sub_1000275A8();
    swift_bridgeObjectRetain();
    id v29 = v28;
    id v166 = sub_100012CA4(v172, v16, v29);
    id v30 = [v166 assetDirectory];
    sub_100028B20();

    sub_1000266A0(v6, v13);
    int v31 = sub_10000B9D8(v13, 1, v14);
    id v169 = v26;
    if (v31 == 1)
    {
      sub_1000269D0(v13, (uint64_t *)&unk_10003D410);
      if (v4)
      {
        os_log_t v32 = v167;
        os_log_t v33 = v171;
        sub_100013F90();
        uint64_t v34 = v33;
        id v35 = v166;
        if (v33)
        {
          sub_100027960();
          sub_100009C74(&qword_10003D458);
          sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
          if (sub_100027244())
          {
            swift_errorRelease();
            uint64_t v34 = v175;
            LOBYTE(v36) = sub_100028E80();
            if (qword_10003CA38 == -1) {
              goto LABEL_9;
            }
            goto LABEL_94;
          }
          goto LABEL_84;
        }
      }
      else
      {
        uint64_t v34 = v171;
        id v35 = v166;
        os_log_t v32 = v167;
      }
    }
    else
    {
      uint64_t v47 = v168;
      (*(void (**)(void *, uint64_t, uint64_t))(v168 + 32))(v170, v13, v14);
      os_log_type_t v48 = sub_100028E90();
      uint64_t v49 = v14;
      if (qword_10003CA38 != -1) {
        swift_once();
      }
      uint64_t v50 = qword_10003DB88;
      uint64_t v51 = *(void (**)(uint64_t))(v47 + 16);
      uint64_t v52 = sub_10002765C();
      v51(v52);
      ((void (*)(uint64_t, char *, uint64_t))v51)(v20, v169, v49);
      if (os_log_type_enabled((os_log_t)v50, v48))
      {
        LODWORD(v164) = v48;
        sub_1000275A8();
        swift_bridgeObjectRetain_n();
        sub_100026E84();
        os_log_t v163 = (os_log_t)v50;
        id v162 = (id)sub_100027640();
        v176[0] = v162;
        *(_DWORD *)uint64_t v50 = 136315650;
        swift_bridgeObjectRetain();
        id v175 = sub_10001EC50(v172, v48, (uint64_t *)v176);
        sub_100028F10();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v50 + 12) = 2080;
        uint64_t v53 = sub_100028B40();
        uint64_t v55 = sub_10001EC50(v53, v54, (uint64_t *)v176);
        sub_100027940(v55);
        swift_bridgeObjectRelease();
        id v56 = *(void (**)(void))(v47 + 8);
        sub_100027698();
        v56();
        *(_WORD *)(v50 + 22) = 2080;
        uint64_t v57 = sub_100028B40();
        uint64_t v59 = sub_10001EC50(v57, v58, (uint64_t *)v176);
        sub_100027940(v59);
        uint64_t v60 = v56;
        swift_bridgeObjectRelease();
        sub_100027C94();
        sub_100027698();
        v56();
        _os_log_impl((void *)&_mh_execute_header, v163, (os_log_type_t)v164, "Copying resources for descriptor '%s' from '%s' to '%s'", (uint8_t *)v50, 0x20u);
        swift_arrayDestroy();
        sub_100026E6C();
        sub_100026E6C();
      }
      else
      {
        uint64_t v60 = *(void (**)(void))(v47 + 8);
        sub_100026EB4();
        v60();
        sub_100027C94();
        sub_100026EB4();
        v60();
      }
      uint64_t v14 = v49;
      id v35 = v166;
      os_log_t v61 = v171;
      sub_1000134FC();
      uint64_t v34 = v61;
      if (v61)
      {
        sub_100027960();
        sub_100009C74(&qword_10003D458);
        sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
        if (sub_100027244())
        {
          swift_errorRelease();
          id v63 = v175;
          os_log_type_t v64 = sub_100028E80();
          v65 = qword_10003DB88;
          os_log_type_t v66 = v64;
          if (os_log_type_enabled((os_log_t)qword_10003DB88, v64))
          {
            sub_1000273A4();
            v67 = v63;
            uint64_t v68 = sub_100026EDC();
            os_log_t v167 = v65;
            uint64_t v69 = (uint8_t *)v68;
            unint64_t v165 = (void *)sub_1000270CC();
            v178[0] = (uint64_t)v165;
            sub_10002741C(4.8151e-34);
            uint64_t v70 = sub_10001EC50(v172, (unint64_t)v60, v178);
            sub_1000274FC(v70);
            sub_100028F10();
            swift_bridgeObjectRelease_n();
            sub_100027834();
            id v71 = [v67 localizedDescription];
            uint64_t v72 = sub_100028CE0();
            unint64_t v74 = v73;

            uint64_t v75 = sub_10001EC50(v72, v74, v178);
            sub_100027798(v75);
            sub_100028F10();

            uint64_t v60 = (void (*)(void))v171;
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v167, v66, "Failed to copy resources for descriptor '%s': %s", v69, 0x16u);
            swift_arrayDestroy();
            sub_100026E6C();
            sub_100026E6C();
          }
          swift_willThrow();
        }
        else
        {
        }
        sub_100026EB4();
        v60();
        sub_100026EB4();
        v60();
        goto LABEL_87;
      }
      uint64_t v76 = v62;
      os_log_t v171 = (os_log_t)v60;
      os_log_type_t v77 = sub_100028E60();
      id v78 = qword_10003DB88;
      os_log_type_t v79 = v77;
      if (os_log_type_enabled((os_log_t)qword_10003DB88, v77))
      {
        unint64_t v80 = v173;
        swift_bridgeObjectRetain_n();
        uint64_t v81 = sub_100026EDC();
        unint64_t v82 = (void *)sub_100026E84();
        id v175 = v76;
        v176[0] = v82;
        *(_DWORD *)uint64_t v81 = 134218242;
        sub_100027668();
        sub_100028F10();
        *(_WORD *)(v81 + 12) = 2080;
        swift_bridgeObjectRetain();
        id v175 = sub_10001EC50(v172, v80, (uint64_t *)v176);
        sub_10002789C();
        sub_100028F10();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v78, v79, "Successfully copied %ld resources for descriptor '%s'", (uint8_t *)v81, 0x16u);
        swift_arrayDestroy();
        id v35 = v166;
        sub_100026E6C();
        sub_100026E6C();
      }
      sub_1000270C0();
      v83();
      os_log_t v32 = v167;
    }
    sub_100010938();
    id v84 = [v32 media];
    sub_10000BAE8(0, &qword_10003D8C0);
    unint64_t v85 = sub_100028D60();

    if (v85 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v86 = (void *)sub_1000290A0();
      swift_bridgeObjectRelease();
      if (v86)
      {
LABEL_29:
        if ((v85 & 0xC000000000000001) != 0)
        {
          char v87 = sub_100028FE0();
        }
        else
        {
          if (!*(void *)((v85 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_92;
          }
          char v87 = *(id *)(v85 + 32);
        }
        os_log_t v88 = v87;
        swift_bridgeObjectRelease();
        id v89 = PPGalleryOptionsForDescriptorType((uint64_t)[v32 descriptorType], v88);
        uint64_t v90 = sub_10002565C(v32, (SEL *)&selRef_displayNameLocalizationKey);
        if (!v91) {
          goto LABEL_36;
        }
        sub_100025514(v90, v91, v89);
        id v92 = [v32 shuffleConfiguration];
        if (!v92) {
          goto LABEL_36;
        }
        v93 = v92;
        if ([v92 shuffleType] || (uint64_t v115 = sub_100025578(v93)) == 0)
        {
        }
        else
        {
          id v162 = v93;
          if (*(void *)(v115 + 16) == 1)
          {
            os_log_t v171 = v34;
            uint64_t v116 = sub_1000111E0(v115);
            unint64_t v118 = v117;
            swift_bridgeObjectRelease();
            if (v118)
            {
              unint64_t v170 = v89;
              os_log_t v163 = v88;
              uint64_t v164 = v14;
              v119 = self;
              sub_100009C74(&qword_10003D8D0);
              uint64_t v120 = swift_allocObject();
              *(_OWORD *)(v120 + 16) = xmmword_10002A570;
              *(void *)(v120 + 32) = v116;
              *(void *)(v120 + 40) = v118;
              swift_bridgeObjectRetain();
              Class isa = sub_100028D40().super.isa;
              swift_bridgeObjectRelease();
              id v122 = sub_10000CCC4();
              id v123 = [v122 librarySpecificFetchOptions];

              id v124 = [v119 fetchPersonsWithLocalIdentifiers:isa options:v123];
              id v125 = [v124 firstObject];
              if (v125)
              {
                BOOL v126 = v125;
                swift_bridgeObjectRelease();
                id v127 = objc_msgSend(v126, "px_localizedName");
                sub_100028CE0();

                sub_100027AAC();
                uint64_t v128 = sub_100028D00();
                uint64_t v34 = v171;
                if (v128 >= 1)
                {
                  uint64_t v129 = sub_100027AAC();
                  uint64_t v130 = v170;
                  sub_100025514(v129, v131, v170);

                  id v89 = v130;
                  os_log_t v88 = v163;
                  uint64_t v14 = v164;
LABEL_54:
                  os_log_t v32 = v167;
                  goto LABEL_36;
                }
                swift_bridgeObjectRelease();

                uint64_t v14 = v164;
              }
              else
              {
                os_log_type_t v132 = sub_100028E80();
                if (qword_10003CA38 != -1) {
                  swift_once();
                }
                id v133 = qword_10003DB88;
                if (os_log_type_enabled((os_log_t)qword_10003DB88, v132))
                {
                  swift_bridgeObjectRetain();
                  unint64_t v134 = (uint8_t *)sub_100026E9C();
                  unint64_t v165 = (void *)sub_100026E84();
                  v176[0] = v165;
                  *(_DWORD *)unint64_t v134 = 136315138;
                  v161[1] = v134 + 4;
                  swift_bridgeObjectRetain();
                  id v175 = sub_10001EC50(v116, v118, (uint64_t *)v176);
                  id v35 = v166;
                  sub_100028F10();
                  swift_bridgeObjectRelease_n();
                  _os_log_impl((void *)&_mh_execute_header, v133, v132, "Failed to fetch Person '%s'", v134, 0xCu);
                  swift_arrayDestroy();
                  sub_100026E6C();
                  sub_100026E6C();
                }
                else
                {
                  swift_bridgeObjectRelease();
                }

                uint64_t v14 = v164;
                uint64_t v34 = v171;
              }
              os_log_t v32 = v167;
              os_log_t v88 = v163;
              id v89 = v170;
              goto LABEL_36;
            }

            uint64_t v34 = v171;
            goto LABEL_54;
          }

          swift_bridgeObjectRelease();
        }
LABEL_36:
        v176[0] = 0;
        if (![v35 storeGalleryOptions:v89 error:v176])
        {
          unint64_t v170 = v89;
          id v95 = v176[0];
          sub_100028AC0();

          swift_willThrow();
          sub_100027960();
          sub_100009C74(&qword_10003D458);
          sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
          if (sub_100027244())
          {
            uint64_t v164 = v14;
            swift_errorRelease();
            v96 = v175;
            os_log_type_t v97 = sub_100028E80();
            uint64_t v98 = (uint64_t)v169;
            if (qword_10003CA38 != -1) {
              swift_once();
            }
            os_log_type_t v99 = qword_10003DB88;
            os_log_type_t v100 = v97;
            if (os_log_type_enabled((os_log_t)qword_10003DB88, v97))
            {
              os_log_t v163 = v88;
              unint64_t v101 = v173;
              swift_bridgeObjectRetain_n();
              id v102 = v96;
              os_log_t v171 = v99;
              uint64_t v103 = v102;
              uint64_t v104 = sub_100026EDC();
              os_log_t v167 = (os_log_t)sub_1000270CC();
              v178[0] = (uint64_t)v167;
              *(_DWORD *)uint64_t v104 = 136315394;
              swift_bridgeObjectRetain();
              uint64_t v105 = sub_10001EC50(v172, v101, v178);
              sub_1000274FC(v105);
              sub_100028F10();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v104 + 12) = 2080;
              id v106 = [v103 localizedDescription];
              sub_100028CE0();

              uint64_t v107 = sub_10002765C();
              uint64_t v110 = sub_10001EC50(v107, v108, v109);
              sub_100027798(v110);
              uint64_t v98 = (uint64_t)v169;
              sub_100028F10();

              os_log_t v88 = v163;
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v171, v100, "Failed to store galleryOptions for descriptor '%s': %s", (uint8_t *)v104, 0x16u);
              swift_arrayDestroy();
              sub_100026E6C();
              sub_100026E6C();
            }
            uint64_t v111 = v96;
            swift_willThrow();

            uint64_t v112 = *(void (**)(uint64_t, uint64_t))(v168 + 8);
            uint64_t v113 = v98;
            goto LABEL_83;
          }
          sub_10002706C();
          v114();

LABEL_87:
          swift_errorRelease();
          goto LABEL_88;
        }
        id v94 = v176[0];

LABEL_65:
        id v135 = PPCreatePosterDescriptorGalleryOptions(v32);
        [v35 setPreferredGalleryOptions:v135];

        unint64_t v136 = sub_1000134A4(v32);
        sub_100025514(v136, v137, v35);
        uint64_t v86 = &type metadata for String;
        id v175 = sub_100028C90();
        id v138 = [v32 media];
        unint64_t v139 = sub_100028D60();

        if (v139 >> 62)
        {
          sub_100027ACC();
          uint64_t v36 = sub_1000290A0();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v36 = *(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (!v36)
        {
          swift_bridgeObjectRelease();
          goto LABEL_75;
        }
        if ((v139 & 0xC000000000000001) == 0)
        {
          if (!*(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_94:
            swift_once();
LABEL_9:
            unint64_t v37 = qword_10003DB88;
            os_log_type_t v38 = v36;
            if (os_log_type_enabled((os_log_t)qword_10003DB88, (os_log_type_t)v36))
            {
              sub_1000273A4();
              unint64_t v39 = v34;
              unint64_t v40 = (uint8_t *)sub_100026EDC();
              unint64_t v170 = (void *)sub_1000270CC();
              v178[0] = (uint64_t)v170;
              sub_10002741C(4.8151e-34);
              uint64_t v41 = sub_10001EC50(v172, v37, v178);
              sub_100027858(v41);
              sub_100027914();
              swift_bridgeObjectRelease_n();
              sub_100027834();
              id v42 = [v39 localizedDescription];
              uint64_t v43 = sub_100028CE0();
              unint64_t v45 = v44;

              uint64_t v177 = sub_10001EC50(v43, v45, v178);
              sub_100027914();

              swift_bridgeObjectRelease();
              unint64_t v46 = "Failed to save resources for descriptor '%s': %s";
LABEL_82:
              _os_log_impl((void *)&_mh_execute_header, v171, v38, v46, v40, 0x16u);
              swift_arrayDestroy();
              sub_100026E6C();
              sub_100026E6C();
              swift_willThrow();

              uint64_t v113 = (uint64_t)v169;
              uint64_t v112 = *(void (**)(uint64_t, uint64_t))(v168 + 8);
LABEL_83:
              uint64_t v159 = v164;
LABEL_86:
              v112(v113, v159);
              goto LABEL_87;
            }
            goto LABEL_85;
          }
          id v140 = *(id *)(v139 + 32);
          goto LABEL_71;
        }
LABEL_92:
        id v140 = (id)sub_100028FE0();
LABEL_71:
        uint64_t v141 = v140;
        swift_bridgeObjectRelease();
        self;
        sub_100027804();
        uint64_t v142 = (void *)swift_dynamicCastObjCClass();
        if (v142)
        {
          [v142 suggestionSubtype];
          id v143 = (id)PHSuggestionStringWithSubtype();
          v144 = (void *)sub_100028CE0();
          os_log_type_t v146 = v145;

          v176[3] = v86;
          v176[0] = v144;
          v176[1] = v146;
          sub_100011798((uint64_t)v176, 0xD00000000000001CLL, 0x800000010002CE30);
        }

LABEL_75:
        uint64_t v147 = sub_1000130E0((uint64_t)v175);
        swift_bridgeObjectRelease();
        v176[0] = 0;
        if (sub_100025494(v147, (uint64_t)v176, v35))
        {
          v148 = *(void (**)(void))(v168 + 8);
          id v149 = v176[0];
          sub_1000278C0();
          sub_100027698();
          v148();
          goto LABEL_88;
        }
        id v150 = v176[0];
        sub_100028AC0();

        swift_willThrow();
        sub_100027960();
        sub_100009C74(&qword_10003D458);
        sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
        if (sub_100026F98())
        {
          swift_errorRelease();
          uint64_t v151 = (void *)v178[0];
          os_log_type_t v152 = sub_100028E80();
          if (qword_10003CA38 != -1) {
            swift_once();
          }
          unint64_t v153 = qword_10003DB88;
          os_log_type_t v38 = v152;
          if (os_log_type_enabled((os_log_t)qword_10003DB88, v152))
          {
            sub_1000273A4();
            id v154 = v151;
            unint64_t v40 = (uint8_t *)sub_100026EDC();
            unint64_t v170 = (void *)sub_1000270CC();
            uint64_t v177 = (uint64_t)v170;
            sub_10002741C(4.8151e-34);
            uint64_t v174 = sub_10001EC50(v172, v153, &v177);
            sub_100027914();
            swift_bridgeObjectRelease_n();
            sub_100027834();
            id v155 = [v154 localizedDescription];
            uint64_t v156 = sub_100028CE0();
            unint64_t v158 = v157;

            uint64_t v174 = sub_10001EC50(v156, v158, &v177);
            sub_100027914();

            swift_bridgeObjectRelease();
            unint64_t v46 = "Failed to store UserInfo for descriptor '%s': %s";
            goto LABEL_82;
          }
LABEL_85:
          swift_willThrow();

          uint64_t v113 = sub_1000278C0();
          goto LABEL_86;
        }
LABEL_84:
        sub_1000278C0();
        sub_10002706C();
        v160();

        goto LABEL_87;
      }
    }
    else
    {
      uint64_t v86 = *(void **)((v85 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v86) {
        goto LABEL_29;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_65;
  }
  sub_100026654();
  swift_allocError();
  *uint64_t v27 = 1;
  swift_willThrow();
LABEL_88:
  sub_100027078();
}

id sub_100012CA4(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100028CB0();
  swift_bridgeObjectRelease();
  id v5 = [(id)swift_getObjCClassFromMetadata() mutableDescriptorWithIdentifier:v4 role:a3];

  return v5;
}

uint64_t sub_100012D14(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100009C74(&qword_10003D880);
    uint64_t v2 = (void *)sub_1000290B0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  uint64_t v6 = (char *)(v2 + 8);
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
    uint64_t v16 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    *(void *)&v37[0] = *(void *)(*(void *)(a1 + 48) + 8 * v10);
    uint64_t v15 = *(void **)&v37[0];
    type metadata accessor for PISegmentationOption(0);
    id v17 = v15;
    v16;
    swift_dynamicCast();
    sub_10000BAE8(0, &qword_10003D888);
    swift_dynamicCast();
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_100026534(&v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_100026534(v36, v37);
    sub_100026534(v37, &v33);
    uint64_t result = sub_100028F50(v2[5]);
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
    uint64_t result = (uint64_t)sub_100026534(&v33, (_OWORD *)(v2[7] + 32 * v21));
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
    sub_100026544();
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

uint64_t sub_1000130E0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100009C74(&qword_10003D880);
    uint64_t v2 = (void *)sub_1000290B0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  uint64_t v6 = (char *)(v2 + 8);
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
    sub_100025CD0(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    _OWORD v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v17;
    *((void *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_100026534(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_100026534(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_100026534(v36, v37);
    sub_100026534(v37, &v33);
    uint64_t result = sub_100028F50(v2[5]);
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
    uint64_t result = (uint64_t)sub_100026534(&v33, (_OWORD *)(v2[7] + 32 * v21));
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
    sub_100026544();
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

unint64_t sub_1000134A4(void *a1)
{
  if ([a1 posterType] == (id)2) {
    return 0xD000000000000027;
  }
  else {
    return 0xD000000000000026;
  }
}

void sub_1000134FC()
{
  sub_1000270A8();
  uint64_t v86 = v0;
  uint64_t v97 = v1;
  uint64_t v3 = v2;
  uint64_t v108 = sub_100028B50();
  sub_10000C214();
  uint64_t v99 = v4;
  __chkstk_darwin(v5);
  sub_100027278();
  uint64_t v8 = v6 - v7;
  uint64_t v10 = __chkstk_darwin(v9);
  unint64_t v12 = (char *)v85 - v11;
  __chkstk_darwin(v10);
  sub_100027060();
  uint64_t v102 = v13;
  sub_100026F34();
  __chkstk_darwin(v14);
  sub_100027060();
  uint64_t v16 = v15;
  sub_100026F34();
  __chkstk_darwin(v17);
  sub_100027060();
  uint64_t v107 = v18;
  sub_100026F34();
  uint64_t v20 = __chkstk_darwin(v19);
  char v22 = (char *)v85 - v21;
  __chkstk_darwin(v20);
  id v106 = (char *)v85 - v23;
  uint64_t v24 = sub_100009C74((uint64_t *)&unk_10003D410);
  uint64_t v25 = sub_100027450(v24);
  __chkstk_darwin(v25);
  sub_100027C30();
  uint64_t v98 = v26;
  id v27 = [self defaultManager];
  uint64_t v96 = v3;
  sub_100028AF0(v28);
  long long v30 = v29;
  v112[0] = 0;
  id v31 = [v27 contentsOfDirectoryAtURL:v29 includingPropertiesForKeys:0 options:16 error:v112];

  id v32 = v112[0];
  if (v31)
  {
    v85[1] = v12;
    v85[2] = v8;
    uint64_t v33 = sub_100028D60();
    id v34 = v32;

    uint64_t v87 = v33;
    uint64_t v36 = v98;
    uint64_t v95 = *(void *)(v33 + 16);
    if (v95)
    {
      uint64_t v37 = 0;
      uint64_t v105 = *(void (**)(void))(v99 + 16);
      os_log_type_t v38 = (v87
                       + ((*(unsigned __int8 *)(v99 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v99 + 80)));
      uint64_t v91 = *(void *)(v99 + 72);
      id v94 = (void (**)(char *, uint64_t, uint64_t))(v99 + 32);
      id v92 = (void (**)(void))(v99 + 8);
      *(void *)&long long v35 = 136315394;
      long long v89 = v35;
      os_log_t v88 = (char *)&type metadata for Any + 8;
      uint64_t v90 = v22;
      id v93 = v27;
      v99 += 16;
      unint64_t v101 = v16;
      while (1)
      {
        uint64_t v39 = v108;
        sub_100027890();
        v40();
        sub_10000B9B0(v36, 0, 1, v39);
        if (sub_10000B9D8(v36, 1, v39) == 1) {
          break;
        }
        (*v94)(v106, v36, v108);
        sub_100028AD0();
        sub_100028B10();
        swift_bridgeObjectRelease();
        sub_100028AD0();
        sub_100028B10();
        swift_bridgeObjectRelease();
        sub_100028AF0(v41);
        uint64_t v43 = v42;
        sub_100028AF0(v44);
        unint64_t v46 = v45;
        v112[0] = 0;
        unsigned int v47 = [v27 copyItemAtURL:v43 toURL:v45 error:v112];

        if (!v47)
        {
          id v59 = v112[0];
          swift_bridgeObjectRelease();
          uint64_t v60 = (void *)sub_100028AC0();

          swift_willThrow();
          v112[0] = v60;
          swift_errorRetain();
          sub_100009C74(&qword_10003D458);
          sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
          if (swift_dynamicCast())
          {
            swift_errorRelease();
            os_log_t v61 = v110;
            os_log_type_t v62 = sub_100028E80();
            if (qword_10003CA38 != -1) {
              swift_once();
            }
            uint64_t v63 = qword_10003DB88;
            sub_100027A68();
            os_log_type_t v64 = v105;
            sub_100027890();
            v64();
            sub_100027134();
            v64();
            if (os_log_type_enabled((os_log_t)v63, v62))
            {
              unint64_t v101 = v61;
              sub_100026E84();
              os_log_t v103 = (os_log_t)v63;
              uint64_t v104 = sub_100027640();
              uint64_t v111 = v104;
              *(_DWORD *)uint64_t v63 = 136315650;
              uint64_t v105 = v61;
              uint64_t v99 = sub_10002654C(&qword_10003D460, (void (*)(uint64_t))&type metadata accessor for URL);
              LODWORD(v102) = v62;
              uint64_t v65 = sub_100029100();
              uint64_t v67 = sub_10001EC50(v65, v66, &v111);
              sub_100027760(v67);
              uint64_t v69 = v68 + 1;
              sub_100027BE8();
              os_log_t v100 = v69;
              sub_100028F10();
              swift_bridgeObjectRelease();
              uint64_t v70 = *v92;
              sub_100026F8C();
              v71();
              *(_WORD *)(v63 + 12) = 2080;
              uint64_t v72 = sub_100029100();
              uint64_t v109 = sub_10001EC50(v72, v73, &v111);
              sub_100027BE8();
              sub_100028F10();
              swift_bridgeObjectRelease();
              sub_100026F8C();
              v70();
              *(_WORD *)(v63 + 22) = 2080;
              unint64_t v74 = v101;
              id v75 = [v101 localizedDescription];
              sub_100028CE0();

              os_log_t v61 = v105;
              uint64_t v76 = sub_100027C94();
              uint64_t v109 = sub_10001EC50(v76, v77, v78);
              sub_100028F10();

              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v103, (os_log_type_t)v102, "Failed to copy '%s' to '%s': %s", (uint8_t *)v63, 0x20u);
              sub_1000275A8();
              swift_arrayDestroy();
              sub_100026E6C();
              sub_100026E6C();
            }
            else
            {
              unint64_t v80 = *v92;
              uint64_t v81 = v61;
              uint64_t v70 = v80;
              sub_100026F8C();
              v80();
              sub_100026F8C();
              v80();
            }
            id v82 = v93;
            uint64_t v83 = v61;
            swift_willThrow();

            uint64_t v84 = v108;
            ((void (*)(uint64_t, uint64_t))v70)(v107, v108);
            ((void (*)(char *, uint64_t))v70)(v90, v84);
            ((void (*)(char *, uint64_t))v70)(v106, v84);
          }
          else
          {

            os_log_type_t v79 = *v92;
            sub_100026F40();
            v79();
            sub_100026F40();
            v79();
            sub_100026F40();
            v79();
          }
          swift_errorRelease();
          goto LABEL_25;
        }
        os_log_t v103 = v38;
        uint64_t v104 = v37;
        id v48 = v112[0];
        os_log_type_t v49 = sub_100028E60();
        if (qword_10003CA38 != -1) {
          swift_once();
        }
        uint64_t v50 = qword_10003DB88;
        sub_100027A68();
        uint64_t v51 = v105;
        sub_100027890();
        v51();
        sub_100027890();
        v51();
        os_log_t v100 = v50;
        if (os_log_type_enabled(v50, v49))
        {
          uint64_t v52 = sub_100026EDC();
          v112[0] = (id)sub_1000270CC();
          *(_DWORD *)uint64_t v52 = v89;
          sub_10002654C(&qword_10003D460, (void (*)(uint64_t))&type metadata accessor for URL);
          uint64_t v53 = sub_100029100();
          *(void *)(v52 + 4) = sub_1000274E4(v53, v54);
          swift_bridgeObjectRelease();
          uint64_t v55 = *v92;
          sub_100027158();
          v55();
          *(_WORD *)(v52 + 12) = 2080;
          uint64_t v56 = sub_100029100();
          *(void *)(v52 + 14) = sub_1000274E4(v56, v57);
          swift_bridgeObjectRelease();
          sub_100027158();
          v55();
          _os_log_impl((void *)&_mh_execute_header, v100, v49, "Successfully copied '%s' to '%s'", (uint8_t *)v52, 0x16u);
          swift_arrayDestroy();
          sub_100026E6C();
          sub_100026E6C();
          sub_100027158();
          v55();
          sub_100027158();
          v55();
          sub_100027158();
        }
        else
        {
          uint64_t v55 = *v92;
          sub_100026F40();
          v55();
          sub_100026F40();
          v55();
          sub_1000278C0();
          sub_100026F40();
          v55();
          sub_100026F40();
          v55();
          sub_100026F40();
        }
        v55();
        id v27 = v93;
        uint64_t v37 = v104 + 1;
        os_log_type_t v38 = (os_log_t)((char *)v103 + v91);
        uint64_t v36 = v98;
        if (v95 == v104 + 1) {
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      sub_10000B9B0(v36, 1, 1, v108);
    }

    swift_bridgeObjectRelease();
  }
  else
  {
    id v58 = v112[0];
    sub_100028AC0();

    swift_willThrow();
  }
LABEL_25:
  sub_100027078();
}

void sub_100013F90()
{
  sub_1000270A8();
  id v105 = v1;
  os_log_t v109 = v4;
  uint64_t v110 = v3;
  uint64_t v6 = v5;
  ObjectType = (uint64_t *)swift_getObjectType();
  uint64_t v111 = sub_100028B50();
  sub_10000C214();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_100027278();
  uint64_t v12 = v10 - v11;
  __chkstk_darwin(v13);
  sub_100027060();
  uint64_t v91 = v14;
  sub_100026F34();
  __chkstk_darwin(v15);
  sub_100027060();
  uint64_t v93 = v16;
  sub_100026F34();
  __chkstk_darwin(v17);
  sub_10002743C();
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v89 - v19;
  id v92 = v6;
  id v21 = [v6 media];
  sub_10000BAE8(0, &qword_10003D8C0);
  sub_100027804();
  unint64_t v22 = sub_100028D60();

  if (v22 >> 62)
  {
LABEL_46:
    swift_bridgeObjectRetain();
    sub_1000290A0();
    sub_100027CAC();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v0 = *(NSObject **)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v0)
  {
    uint64_t v89 = v12;
    uint64_t v108 = (void *)(v22 & 0xC000000000000001);
    uint64_t v102 = (void (**)(uint64_t, char *, uint64_t))(v8 + 16);
    uint64_t v90 = v8;
    uint64_t v107 = (void (**)(void))(v8 + 8);
    uint64_t v12 = 4;
    *(void *)&long long v23 = 138412546;
    long long v95 = v23;
    id v94 = (char *)&type metadata for Any + 8;
    uint64_t v104 = v20;
    os_log_t v106 = v0;
    uint64_t v101 = v2;
    while (1)
    {
      if (v108) {
        id v24 = (id)sub_100028FE0();
      }
      else {
        id v24 = *(id *)(v22 + 8 * v12);
      }
      uint64_t v25 = v24;
      uint64_t v26 = (v12 - 3);
      if (__OFADD__(v12 - 4, 1))
      {
        __break(1u);
        goto LABEL_46;
      }
      id v27 = [v24 subpath];
      sub_100028CE0();
      uint64_t v8 = v28;

      sub_100027828();
      sub_100028B10();
      swift_bridgeObjectRelease();
      uint64_t v29 = sub_10002565C(v25, (SEL *)&selRef_assetUUID);
      if (!v30) {
        goto LABEL_18;
      }
      if (!v109[2].isa) {
        break;
      }
      unint64_t v31 = sub_10001F8D4(v29, v30);
      if ((v32 & 1) == 0) {
        break;
      }
      id v33 = *((id *)v109[7].isa + v31);
      swift_bridgeObjectRelease();
      uint64_t v34 = sub_100027A68();
      id v35 = v105;
      sub_10001C19C(v34, v36, 1);
      id v105 = v35;
      if (v35)
      {
        swift_bridgeObjectRelease();
        os_log_type_t v77 = sub_100028E80();
        if (qword_10003CA38 != -1) {
          swift_once();
        }
        id v78 = qword_10003DB88;
        uint64_t v79 = v91;
        (*v102)(v91, v104, v111);
        if (os_log_type_enabled(v78, v77))
        {
          id v80 = v33;
          LODWORD(v109) = v77;
          id v81 = v80;
          swift_errorRetain();
          uint64_t v26 = v81;
          swift_errorRetain();
          uint64_t v82 = sub_100026E84();
          uint64_t v110 = (void *)swift_slowAlloc();
          uint64_t v108 = (void *)sub_1000270CC();
          id v115 = v108;
          *(_DWORD *)uint64_t v82 = 138412802;
          os_log_t v106 = v78;
          uint64_t v113 = (uint64_t)v26;
          uint64_t v83 = v26;
          ObjectType = (uint64_t *)&v114;
          sub_100028F10();
          void *v110 = v26;

          *(_WORD *)(v82 + 12) = 2080;
          sub_10002654C(&qword_10003D460, (void (*)(uint64_t))&type metadata accessor for URL);
          uint64_t v84 = sub_100029100();
          uint64_t v86 = sub_1000274E4(v84, v85);
          sub_100027A8C(v86);
          sub_100028F10();
          swift_bridgeObjectRelease();
          sub_100027A2C();
          sub_1000270C0();
          ((void (*)(void))v26)();
          *(_WORD *)(v82 + 22) = 2080;
          swift_getErrorValue();
          uint64_t v87 = sub_100029160();
          uint64_t v113 = sub_1000274E4(v87, v88);
          sub_100028F10();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v106, (os_log_type_t)v109, "Failed to save %@ to '%s': %s", (uint8_t *)v82, 0x20u);
          sub_100009C74(&qword_10003D468);
          swift_arrayDestroy();
          sub_100026E6C();
          sub_100027C64();
          sub_100026E6C();
          sub_100026E6C();
        }
        else
        {
          sub_100027A2C();
          ((void (*)(uint64_t, uint64_t))v26)(v79, v111);
        }
        swift_willThrow();

        ((void (*)(char *, uint64_t))v26)(v104, v111);
        goto LABEL_38;
      }
      os_log_type_t v37 = sub_100028E60();
      if (qword_10003CA38 != -1) {
        swift_once();
      }
      os_log_type_t v38 = qword_10003DB88;
      (*v102)(v2, v104, v111);
      if (os_log_type_enabled(v38, v37))
      {
        id v39 = v33;
        os_log_t v98 = v38;
        id v40 = v39;
        uint64_t v8 = sub_100026EDC();
        uint64_t v41 = (void *)swift_slowAlloc();
        uint64_t v97 = v41;
        uint64_t v99 = (void *)sub_100026E84();
        id v115 = v99;
        *(_DWORD *)uint64_t v8 = v95;
        id v100 = v40;
        *(void *)(v8 + 4) = v40;
        *uint64_t v41 = v40;
        *(_WORD *)(v8 + 12) = 2080;
        sub_10002654C(&qword_10003D460, (void (*)(uint64_t))&type metadata accessor for URL);
        int v96 = v37;
        uint64_t v42 = sub_100029100();
        *(void *)(v8 + 14) = sub_1000274E4(v42, v43);
        swift_bridgeObjectRelease();
        unint64_t v44 = *v107;
        sub_100026F40();
        v44();
        _os_log_impl((void *)&_mh_execute_header, v98, (os_log_type_t)v96, "Successfully saved %@ to '%s'", (uint8_t *)v8, 0x16u);
        sub_100009C74(&qword_10003D468);
        swift_arrayDestroy();
        sub_100026E6C();
        sub_100027498();
        swift_arrayDestroy();
        sub_100026E6C();
        sub_100026E6C();

        unint64_t v45 = v104;
        sub_100026F40();
        v44();
        uint64_t v20 = v45;
        uint64_t v2 = v101;
      }
      else
      {

        unsigned int v47 = *v107;
        sub_100026F40();
        v47();
        uint64_t v8 = (uint64_t)v104;
        sub_100027A68();
        sub_100026F40();
        v47();
        uint64_t v20 = (char *)v8;
      }
LABEL_19:
      ++v12;
      uint64_t v0 = v106;
      if (v26 == v106)
      {
        swift_bridgeObjectRelease();
        uint64_t v8 = v90;
        id v48 = (NSURL *)&v116;
        uint64_t v12 = v89;
        goto LABEL_23;
      }
    }
    swift_bridgeObjectRelease();
LABEL_18:
    sub_10002706C();
    v46();

    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
LABEL_23:
  sub_100028AF0(v48);
  uint64_t v50 = v49;
  id v115 = 0;
  unsigned int v51 = [v92 saveToURL:v49 error:&v115];

  if (v51)
  {
    id v52 = v115;
    os_log_type_t v53 = sub_100028E60();
    if (qword_10003CA38 != -1) {
      swift_once();
    }
    unint64_t v54 = qword_10003DB88;
    sub_100027134();
    v55();
    if (os_log_type_enabled(v54, v53))
    {
      uint64_t v56 = (uint8_t *)sub_100026E9C();
      id v115 = (id)sub_100026E84();
      *(_DWORD *)uint64_t v56 = 136315138;
      uint64_t v110 = v56 + 4;
      sub_10002654C(&qword_10003D460, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v57 = sub_100029100();
      uint64_t v113 = sub_1000274E4(v57, v58);
      sub_100028F10();
      swift_bridgeObjectRelease();
      sub_100027698();
      v59();
      _os_log_impl((void *)&_mh_execute_header, v54, v53, "Successfully saved model data to '%s'", v56, 0xCu);
      swift_arrayDestroy();
      sub_100026E6C();
      sub_100026E6C();
    }
    else
    {
      sub_100027698();
      v76();
    }
  }
  else
  {
    id v60 = v115;
    os_log_t v61 = (void *)sub_100028AC0();

    swift_willThrow();
    id v115 = v61;
    swift_errorRetain();
    sub_100009C74(&qword_10003D458);
    sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
    if (sub_100026F98())
    {
      swift_errorRelease();
      id v62 = (id)v113;
      os_log_type_t v63 = sub_100028E80();
      if (qword_10003CA38 != -1) {
        swift_once();
      }
      os_log_type_t v64 = qword_10003DB88;
      sub_100027134();
      v65();
      if (os_log_type_enabled(v64, v63))
      {
        id v62 = v62;
        uint64_t v66 = sub_100026EDC();
        uint64_t v67 = v111;
        os_log_t v109 = v64;
        uint64_t v68 = v66;
        uint64_t v110 = (void *)sub_1000270CC();
        uint64_t v114 = v110;
        *(_DWORD *)uint64_t v68 = 136315394;
        sub_10002654C(&qword_10003D460, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v69 = sub_100029100();
        uint64_t v71 = sub_10001EC50(v69, v70, (uint64_t *)&v114);
        sub_100027760(v71);
        sub_100028F10();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v67);
        *(_WORD *)(v68 + 12) = 2080;
        id v72 = [v62 localizedDescription];
        uint64_t v73 = sub_100028CE0();
        unint64_t v75 = v74;

        uint64_t v112 = sub_10001EC50(v73, v75, (uint64_t *)&v114);
        sub_100028F10();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v109, v63, "Failed to save model data to '%s': %s", (uint8_t *)v68, 0x16u);
        sub_100027C64();
        sub_100026E6C();
        sub_100026E6C();
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v111);
      }
      id v105 = v62;
      swift_willThrow();
    }
    else
    {
      id v105 = v61;
    }
    swift_errorRelease();
  }
LABEL_38:
  sub_100027078();
}

uint64_t sub_100014C38(uint64_t a1, void *a2, char a3)
{
  uint64_t v5 = v3;
  unint64_t v7 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v65 = _swiftEmptyArrayStorage;
  if (a3) {
    unint64_t v7 = sub_100016188(a2);
  }
  unint64_t v64 = v7;
  if (v7 >> 62)
  {
LABEL_43:
    sub_1000279C0();
    sub_1000290A0();
    sub_10002745C();
  }
  else
  {
    uint64_t v4 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  p_cb = &OBJC_PROTOCOL___PREditingDelegate.cb;
  if (!v4)
  {
    swift_bridgeObjectRelease();
    self;
    aBlock[4] = sub_10001567C;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000156E4;
    aBlock[3] = &unk_100035150;
    uint64_t v9 = _Block_copy(aBlock);
    uint64_t v10 = (void *)sub_100027CE8();
    id v12 = [v10 v11];
    _Block_release(v9);
    sub_10000BAE8(0, &qword_10003D930);
    unint64_t v13 = sub_100028D60();

    unint64_t v64 = v13;
    swift_bridgeObjectRetain();
    os_log_type_t v14 = sub_100028E90();
    if (qword_10003CA38 != -1) {
      swift_once();
    }
    uint64_t v15 = qword_10003DB88;
    if (os_log_type_enabled((os_log_t)qword_10003DB88, v14))
    {
      swift_bridgeObjectRetain();
      *(_DWORD *)sub_100026E9C() = 134217984;
      if (v13 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v16 = sub_1000290A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v16 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      aBlock[0] = v16;
      sub_100028F10();
      swift_bridgeObjectRelease();
      sub_100027304((void *)&_mh_execute_header, v15, v14, "Chose %ld fallback Portrait FeaturedPhotos");
      sub_100026E6C();
      p_cb = (_DWORD *)(&OBJC_PROTOCOL___PREditingDelegate + 64);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  swift_beginAccess();
  unint64_t v17 = v64;
  if (v64 >> 62)
  {
    sub_100027B84();
    uint64_t v18 = sub_1000290A0();
    if (v18) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v18 = *(void *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v18)
    {
LABEL_15:
      id v58 = self;
      uint64_t v4 = 0;
      unint64_t v59 = v17 & 0xC000000000000001;
      uint64_t v19 = 4;
      unint64_t v54 = v5;
      uint64_t v55 = a1;
      unint64_t v56 = v17;
      uint64_t v57 = v18;
      while (1)
      {
        if (v59) {
          id v20 = (id)sub_100028FE0();
        }
        else {
          id v20 = *(id *)(v17 + 8 * v19);
        }
        id v21 = v20;
        if (__OFADD__(v19 - 4, 1))
        {
          __break(1u);
          goto LABEL_43;
        }
        uint64_t v60 = v19 - 3;
        uint64_t v61 = v19;
        sub_100009C74(&qword_10003D8D0);
        uint64_t v22 = sub_1000277B0();
        *(_OWORD *)(v22 + 16) = xmmword_10002A570;
        uint64_t result = sub_10002565C(v21, (SEL *)&selRef_uuid);
        if (!v24)
        {
          __break(1u);
          return result;
        }
        *(void *)(v22 + 32) = result;
        *(void *)(v22 + 40) = v24;
        sub_100028D40();
        sub_100027810();
        id v25 = [v58 descriptorIdentifierForDescriptorType:1 uuids:v19];

        uint64_t v26 = sub_100028CE0();
        uint64_t v28 = v27;

        if (!*(void *)(a1 + 16)) {
          goto LABEL_28;
        }
        swift_bridgeObjectRetain();
        unint64_t v29 = sub_10001F8D4(v26, v28);
        if ((v30 & 1) == 0) {
          break;
        }
        id v31 = *(id *)(*(void *)(a1 + 56) + 8 * v29);
        swift_bridgeObjectRelease();
        sub_100028E90();
        if (qword_10003CA38 != -1) {
          swift_once();
        }
        if (sub_100027CD0())
        {
          swift_bridgeObjectRetain();
          uint64_t v32 = sub_100026E9C();
          v63[0] = sub_100026E84();
          *(_DWORD *)uint64_t v32 = 136315138;
          uint64_t v33 = swift_bridgeObjectRetain();
          *(void *)(v32 + 4) = sub_1000278A8(v33, v34, v63);
          swift_bridgeObjectRelease_n();
          sub_100027A20();
          sub_100027534(v35, v36, v37, "Fallback FeaturedPhoto descriptor '%s' didn't change, keeping");
          sub_100026FC8();
          p_cb = (_DWORD *)(&OBJC_PROTOCOL___PREditingDelegate + 64);
          sub_100026E6C();
          a1 = v55;
          sub_100026E6C();
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        uint64_t v46 = v57;
        id v47 = v31;
        sub_100028D30();
        sub_1000271AC();
        if (v48) {
          sub_100026EF4();
        }
        sub_1000278FC();
        sub_100028D80();

LABEL_40:
        unint64_t v17 = v56;
        uint64_t v19 = v61 + 1;
        if (v60 == v46) {
          goto LABEL_45;
        }
      }
      swift_bridgeObjectRelease();
LABEL_28:
      sub_100009C74(&qword_10003D450);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10002A560;
      *(void *)(inited + 32) = v21;
      v63[0] = inited;
      sub_100028D80();
      id v39 = v21;
      id v40 = v5;
      sub_100011348();
      sub_100027810();
      os_log_type_t v41 = sub_100028E90();
      if (qword_10003CA38 != -1) {
        swift_once();
      }
      uint64_t v42 = *((void *)p_cb + 369);
      if (os_log_type_enabled(v42, v41))
      {
        swift_bridgeObjectRetain();
        unint64_t v43 = (_DWORD *)sub_100026E9C();
        v63[0] = sub_100026E84();
        *unint64_t v43 = 136315138;
        uint64_t v44 = swift_bridgeObjectRetain();
        v63[3] = sub_1000278A8(v44, v45, v63);
        p_cb = (_DWORD *)(&OBJC_PROTOCOL___PREditingDelegate + 64);
        sub_100028F10();
        swift_bridgeObjectRelease_n();
        sub_10002703C((void *)&_mh_execute_header, v42, v41, "Successfully created fallback FeaturedPhoto descriptor '%s'");
        swift_arrayDestroy();
        a1 = v55;
        sub_100026E6C();
        uint64_t v5 = v54;
        sub_100026E6C();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v46 = v57;
      id v49 = v40;
      sub_100028D30();
      sub_1000271AC();
      if (v48) {
        sub_100026EF4();
      }
      sub_1000278FC();
      sub_100028D80();

      goto LABEL_40;
    }
  }
LABEL_45:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v50 = sub_100028E90();
  if (qword_10003CA38 != -1) {
    swift_once();
  }
  unsigned int v51 = *((void *)p_cb + 369);
  unint64_t v52 = (unint64_t)v65;
  if (os_log_type_enabled(v51, v50))
  {
    swift_bridgeObjectRetain_n();
    *(_DWORD *)sub_100026E9C() = 134217984;
    if (v52 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_1000290A0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v53 = *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    sub_100027668();
    v63[0] = v53;
    sub_100028F10();
    swift_bridgeObjectRelease();
    sub_10002703C((void *)&_mh_execute_header, v51, v50, "Created %ld fallback FeaturedPhoto descriptors.");
    sub_100026E6C();
  }
  swift_beginAccess();
  return (uint64_t)v65;
}

id sub_10001567C(uint64_t a1)
{
  id v1 = [objc_allocWithZone((Class)PHWallpaperAsset) initWithPhotoAsset:a1];
  id v2 = [self tryLoadSegmentationForColdAsset:v1];

  return v2;
}

uint64_t sub_1000156E4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_10001573C()
{
  id v24 = 0;
  id v3 = [self openPhotoLibraryWithWellKnownIdentifier:1 error:&v24];
  if (!v3)
  {
    id v16 = v24;
    unint64_t v17 = (void *)sub_100027D00();

    swift_willThrow();
    id v24 = v17;
    sub_100009C74(&qword_10003D458);
    sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
    sub_100026F98();
    os_log_type_t v18 = sub_100028E80();
    if (qword_10003CA38 != -1) {
      swift_once();
    }
    uint64_t v19 = qword_10003DB88;
    os_log_type_t v20 = v18;
    if (sub_100027350())
    {
      id v21 = v23;
      sub_100026E9C();
      uint64_t v25 = sub_100026E84();
      sub_100027564(4.8149e-34);
      id v22 = [v21 localizedDescription];
      sub_100028CE0();
      sub_1000278D8();
      sub_10001EC50(v1, v2, &v25);
      sub_100028F10();

      swift_bridgeObjectRelease();
      sub_10002703C((void *)&_mh_execute_header, v19, v20, "No photo library available, unable to check people suggestions: %s");
      sub_100026FC8();
      sub_100026E6C();
      sub_100026E6C();
    }
    else
    {
    }
    swift_errorRelease();
    return 0;
  }
  id v4 = v3;
  id v5 = v24;
  id v6 = [v4 librarySpecificFetchOptions];
  [v6 setFetchLimit:1];
  sub_100009C74(&qword_10003D450);
  uint64_t v7 = sub_1000277B0();
  *(_OWORD *)(v7 + 16) = xmmword_10002AA80;
  sub_10000BAE8(0, &qword_10003D8F8);
  sub_100009C74((uint64_t *)&unk_10003CC30);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10002A550;
  *(void *)(v8 + 56) = &type metadata for UInt16;
  *(void *)(v8 + 64) = &protocol witness table for UInt16;
  *(_WORD *)(v8 + 32) = 602;
  *(void *)(v8 + 96) = &type metadata for UInt16;
  *(void *)(v8 + 104) = &protocol witness table for UInt16;
  *(_WORD *)(v8 + 72) = 652;
  sub_10002748C();
  *(void *)(v7 + 32) = sub_100028E50();
  sub_10000BAE8(0, &qword_10003D978);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10002A570;
  *(void *)(v9 + 56) = &type metadata for UInt16;
  *(void *)(v9 + 64) = &protocol witness table for UInt16;
  *(_WORD *)(v9 + 32) = 4;
  *(void *)(v7 + 40) = sub_100028E50();
  id v24 = (id)v7;
  sub_100028D80();
  id v10 = sub_100015BFC();
  SEL v11 = (void *)sub_100027CA0();
  [v11 v12];

  id v13 = [self fetchSuggestionsWithOptions:v6];
  id v14 = [v13 count];
  sub_100028E90();
  if (!v14)
  {
    if (qword_10003CA38 != -1) {
      swift_once();
    }
    sub_100028BE0();

    return 0;
  }
  if (qword_10003CA38 != -1) {
    swift_once();
  }
  sub_100028BE0();

  return 1;
}

id sub_100015BFC()
{
  sub_10000BAE8(0, &qword_10003D8F8);
  Class isa = sub_100028D40().super.isa;
  swift_bridgeObjectRelease();
  id v1 = [(id)swift_getObjCClassFromMetadata() andPredicateWithSubpredicates:isa];

  return v1;
}

id sub_100015C80()
{
  id v0 = [self currentDeviceSupportsSettlingEffect];
  sub_100028E90();
  if (v0)
  {
    if (qword_10003CA38 != -1) {
      swift_once();
    }
  }
  else if (qword_10003CA38 != -1)
  {
    swift_once();
  }
  sub_100028BE0();
  return v0;
}

uint64_t sub_100015D78()
{
  sub_100027C58();
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_10001FC74(v2);
  sub_10002745C();
  unint64_t v26 = v1;
  sub_10001FBF0((uint64_t *)&v26, (uint64_t (*)(uint64_t))sub_100026478, sub_10002000C);
  unint64_t v3 = v26;
  int64_t v4 = *(void *)(v26 + 16);
  id v5 = _swiftEmptyArrayStorage;
  if (v4)
  {
    unint64_t v26 = (unint64_t)_swiftEmptyArrayStorage;
    sub_10001F404(0, v4, 0);
    uint64_t v6 = 48;
    uint64_t v7 = (void *)v26;
    do
    {
      uint64_t v8 = *(void *)(v3 + v6);
      unint64_t v26 = (unint64_t)v7;
      unint64_t v10 = v7[2];
      unint64_t v9 = v7[3];
      swift_bridgeObjectRetain();
      if (v10 >= v9 >> 1)
      {
        sub_10001F404((void *)(v9 > 1), v10 + 1, 1);
        uint64_t v7 = (void *)v26;
      }
      v7[2] = v10 + 1;
      v7[v10 + 4] = v8;
      v6 += 24;
      --v4;
    }
    while (v4);
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v7 = _swiftEmptyArrayStorage;
  }
  uint64_t v11 = v7[2];
  if (v11)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    do
    {
      unint64_t v14 = v7[v12 + 4];
      if (v14 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v15 = sub_1000290A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (v15 > v13) {
        uint64_t v13 = v15;
      }
      ++v12;
    }
    while (v11 != v12);
    swift_bridgeObjectRelease();
    unint64_t v26 = (unint64_t)_swiftEmptyArrayStorage;
    if (v13 >= 1)
    {
      uint64_t v16 = 0;
      id v5 = _swiftEmptyArrayStorage;
LABEL_19:
      swift_bridgeObjectRetain();
      uint64_t v17 = 0;
      while (1)
      {
        unint64_t v18 = v7[v17 + 4];
        if (v18 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v19 = sub_1000290A0();
        }
        else
        {
          uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
        }
        if (v16 >= v19)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          if ((v18 & 0xC000000000000001) != 0)
          {
            sub_100028FE0();
          }
          else
          {
            if (v16 < 0)
            {
              __break(1u);
LABEL_45:
              __break(1u);
              goto LABEL_46;
            }
            if ((unint64_t)v16 >= *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_45;
            }
            id v20 = *(id *)(v18 + 8 * v16 + 32);
          }
          swift_bridgeObjectRelease();
          sub_100028D30();
          sub_1000271AC();
          if (v22)
          {
            sub_100027978(v21);
            sub_100028D90();
          }
          sub_10002765C();
          sub_100028DB0();
          sub_100028D80();
          id v5 = (void *)v26;
          if (v26 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v23 = sub_1000290A0();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v23 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          if (v23 >= v0)
          {
            uint64_t v16 = v13;
LABEL_39:
            swift_bridgeObjectRelease();
            if (!__OFADD__(v16++, 1))
            {
              if (v16 < v13) {
                goto LABEL_19;
              }
              break;
            }
LABEL_46:
            __break(1u);
            uint64_t result = swift_release();
            __break(1u);
            return result;
          }
        }
        if (v11 == ++v17) {
          goto LABEL_39;
        }
      }
    }
  }
  else
  {
    id v5 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v5;
}

BOOL sub_1000160D4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a2 + 16);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000290A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1000290A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v4 >= v5;
}

uint64_t sub_100016188(void *a1)
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v2 = (uint64_t)[a1 librarySpecificFetchOptions];
  sub_10000BAE8(0, &qword_10003D8F8);
  sub_100009C74((uint64_t *)&unk_10003CC30);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10002AA90;
  *(_WORD *)(sub_100027368(v3, (uint64_t)&type metadata for UInt16) + 112) = 4;
  sub_10002748C();
  uint64_t v4 = (void *)sub_100028E50();
  [(id)v2 setPredicate:v4];

  sub_100009C74(&qword_10003D450);
  uint64_t v5 = sub_100027BA4();
  *(_OWORD *)(v5 + 16) = xmmword_10002A560;
  id v6 = objc_allocWithZone((Class)NSSortDescriptor);
  *(void *)(v5 + 32) = sub_10001DA88(1684632949, 0xE400000000000000, 1);
  unint64_t v74 = (uint64_t *)v5;
  uint64_t v7 = (uint64_t *)&v74;
  sub_100028D80();
  sub_1000255D8((uint64_t)v74, (void *)v2, &qword_10003D950, (uint64_t)NSSortDescriptor_ptr, (SEL *)&selRef_setSortDescriptors_);
  p_ivar_base_size = (SEL *)[self fetchSuggestionsWithOptions:v2];
  id v9 = [(SEL *)p_ivar_base_size fetchedObjects];
  if (!v9)
  {
LABEL_51:
    sub_100028E90();
    if (qword_10003CA38 != -1) {
      swift_once();
    }
    unsigned int v51 = _swiftEmptyArrayStorage;
    sub_100028BE0();

    return (uint64_t)v51;
  }
  unint64_t v10 = v9;
  sub_10000BAE8(0, &qword_10003D920);
  sub_100027804();
  unint64_t v11 = sub_100028D60();

  if (v11 >> 62) {
    goto LABEL_33;
  }
  uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v12)
  {
LABEL_50:
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
  uint64_t v68 = (void *)v2;
  uint64_t v69 = (void *)v1;
  uint64_t v67 = p_ivar_base_size;
  swift_bridgeObjectRetain();
  do
  {
    unint64_t v73 = v11 & 0xC000000000000001;
    uint64_t v13 = (uint64_t *)&_swiftEmptyDictionarySingleton;
    uint64_t v1 = 4;
    p_ivar_base_size = (SEL *)&PosterUpdater.Serializer.ivar_base_size;
    unint64_t v70 = v11;
    uint64_t v72 = v12;
    while (1)
    {
      uint64_t v7 = (uint64_t *)(v1 - 4);
      id v14 = v73 ? (id)sub_100028FE0() : *(id *)(v11 + 8 * v1);
      uint64_t v15 = v14;
      uint64_t v16 = v1 - 3;
      if (__OFADD__(v7, 1)) {
        break;
      }
      if (objc_msgSend(v14, p_ivar_base_size[416]) == 602)
      {
        uint64_t v17 = sub_10002565C(v15, (SEL *)&selRef_context);
        if (!v18)
        {

          goto LABEL_27;
        }
        uint64_t v2 = v17;
        uint64_t v19 = v18;
      }
      else
      {
        objc_msgSend(v15, p_ivar_base_size[416]);
        id v20 = (id)PHSuggestionStringWithSubtype();
        uint64_t v2 = sub_100028CE0();
        uint64_t v19 = v21;
      }
      p_ivar_base_size = v15;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v74 = v13;
      uint64_t v7 = v13;
      sub_10001F8D4(v2, v19);
      sub_100027864();
      if (v25) {
        goto LABEL_31;
      }
      unint64_t v26 = v23;
      unint64_t v11 = v24;
      sub_100009C74(&qword_10003D928);
      BOOL v27 = sub_100029060(isUniquelyReferenced_nonNull_native, (Swift::Int)v13);
      uint64_t v13 = v74;
      uint64_t v12 = v72;
      if (v27)
      {
        unint64_t v28 = sub_10001F8D4(v2, v19);
        if ((v11 & 1) != (v29 & 1)) {
          goto LABEL_65;
        }
        unint64_t v26 = v28;
      }
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_100027A54((uint64_t)&v13[v26 >> 6]);
        id v31 = (uint64_t *)(v30 + 16 * v26);
        uint64_t *v31 = v2;
        v31[1] = v19;
        *(void *)(v13[7] + 8 * v26) = _swiftEmptyArrayStorage;
        uint64_t v32 = v13[2];
        uint64_t v7 = (uint64_t *)(v32 + 1);
        uint64_t v2 = __OFADD__(v32, 1);
        swift_bridgeObjectRetain();
        if (v2) {
          goto LABEL_32;
        }
        v13[2] = (uint64_t)v7;
      }
      swift_bridgeObjectRetain();
      uint64_t v33 = v13[7];
      swift_bridgeObjectRelease();
      sub_100028D30();
      if (*(void *)((*(void *)(v33 + 8 * v26) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v33 + 8 * v26) & 0xFFFFFFFFFFFFFF8)
                                                                                               + 0x18) >> 1)
        sub_100026EF4();
      sub_100027C7C();
      sub_100028DB0();
      sub_100028D80();

      swift_bridgeObjectRelease();
      unint64_t v11 = v70;
      p_ivar_base_size = (SEL *)(&PosterUpdater.Serializer + 8);
LABEL_27:
      ++v1;
      if (v16 == v12) {
        goto LABEL_35;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    sub_100027B84();
    sub_1000290A0();
    sub_100027CAC();
    swift_bridgeObjectRelease();
    if ((uint64_t)v7 <= 0) {
      goto LABEL_50;
    }
    sub_1000272A0();
    uint64_t v12 = sub_1000290A0();
    swift_bridgeObjectRelease();
    uint64_t v67 = p_ivar_base_size;
    uint64_t v68 = (void *)v2;
    uint64_t v69 = (void *)v1;
  }
  while (v12);
LABEL_35:
  swift_bridgeObjectRelease();
  unint64_t v34 = sub_100015D78();
  swift_bridgeObjectRelease();
  os_log_type_t v35 = sub_100028E90();
  if (qword_10003CA38 != -1) {
    swift_once();
  }
  uint64_t v36 = qword_10003DB88;
  swift_bridgeObjectRetain_n();
  os_log_type_t v37 = (_DWORD *)(&PosterUpdater.Serializer + 8);
  if (!os_log_type_enabled(v36, v35))
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    goto LABEL_56;
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_100026E84();
  unint64_t v74 = (uint64_t *)sub_100026E84();
  *(_DWORD *)uint64_t v38 = 134218498;
  swift_bridgeObjectRelease();
  sub_100028F10();
  swift_bridgeObjectRelease();
  *(_WORD *)(v38 + 12) = 2048;
  if (v34 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_1000290A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v39 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  sub_100028F10();
  swift_bridgeObjectRelease();
  *(_WORD *)(v38 + 22) = 2080;
  if (!v39) {
    goto LABEL_55;
  }
  os_log_type_t v71 = v35;
  sub_10001F474(0, v39 & ~(v39 >> 63), 0);
  if (v39 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v40 = 0;
    do
    {
      if ((v34 & 0xC000000000000001) != 0) {
        id v41 = (id)sub_100028FE0();
      }
      else {
        id v41 = *(id *)(v34 + 8 * v40 + 32);
      }
      uint64_t v42 = v41;
      id v43 = [v41 uuid];
      uint64_t v44 = sub_100028CE0();
      uint64_t v46 = v45;

      unint64_t v48 = _swiftEmptyArrayStorage[2];
      unint64_t v47 = _swiftEmptyArrayStorage[3];
      if (v48 >= v47 >> 1)
      {
        BOOL v50 = sub_100027978(v47);
        sub_10001F474((char *)v50, v48 + 1, 1);
      }
      ++v40;
      _swiftEmptyArrayStorage[2] = v48 + 1;
      id v49 = &_swiftEmptyArrayStorage[2 * v48];
      v49[4] = v44;
      v49[5] = v46;
    }
    while (v39 != v40);
    os_log_type_t v37 = &PosterUpdater.Serializer.ivar_base_size;
    os_log_type_t v35 = v71;
LABEL_55:
    uint64_t v52 = sub_100028D70();
    unint64_t v54 = v53;
    swift_bridgeObjectRelease();
    sub_10001EC50(v52, v54, (uint64_t *)&v74);
    sub_100028F10();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v36, v35, "Found %ld existing Top Suggestions, chosen %ld of them: %s", (uint8_t *)v38, 0x20u);
    sub_10002711C();
    sub_100026E6C();
    sub_100026E6C();
LABEL_56:
    sub_100016B04(v34);
    swift_bridgeObjectRelease();
    id v55 = objc_allocWithZone((Class)PHManualFetchResult);
    id v56 = v69;
    uint64_t v57 = sub_100027C7C();
    id v59 = sub_10001DAF4(v57, v58, 0, 0, 0, 0, 0, 0);
    sub_100016CA8(v59);
    id v60 = [v56 *((SEL *)v37 + 407)];
    id v61 = [self fetchKeyAssetBySuggestionUUIDForSuggestions:v59 options:v60];
    if (v61)
    {
      id v62 = v61;
      sub_10000BAE8(0, &qword_10003D930);
      uint64_t v63 = sub_100028C80();

      unint64_t v64 = (unint64_t)sub_10001FD58(v63);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      if ((v64 & 0x8000000000000000) != 0 || (uint64_t v65 = (uint64_t *)v64, (v64 & 0x4000000000000000) != 0))
      {
        uint64_t v65 = sub_10001FE2C();
        swift_release();
      }
      unint64_t v74 = v65;
      sub_10001FAF8((uint64_t *)&v74);

      unsigned int v51 = v74;
      swift_release();
      return (uint64_t)v51;
    }
  }
  __break(1u);
LABEL_65:
  sub_100029150();
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

char *sub_100016B04(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000290A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (!v2) {
    return (char *)v3;
  }
  unint64_t v10 = _swiftEmptyArrayStorage;
  uint64_t result = sub_10001F454(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        sub_100028FE0();
      }
      else {
        id v6 = *(id *)(a1 + 8 * i + 32);
      }
      sub_10000BAE8(0, &qword_10003D920);
      swift_dynamicCast();
      uint64_t v3 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10001F454(0, v3[2] + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_10001F454((char *)(v7 > 1), v8 + 1, 1);
        uint64_t v3 = v10;
      }
      v3[2] = v8 + 1;
      sub_100026534(&v9, &v3[4 * v8 + 4]);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

void sub_100016CA8(void *a1)
{
  id v2 = [a1 photoLibrary];
  id v3 = [v2 librarySpecificFetchOptions];
  sub_100009C74((uint64_t *)&unk_10003CC30);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10002AAA0;
  *(_WORD *)(sub_100027368(v4, (uint64_t)&type metadata for UInt16) + 112) = 1;
  id v5 = [a1 fetchedObjectIDsSet];
  if (!v5)
  {
    __break(1u);
    goto LABEL_51;
  }
  id v6 = v5;
  sub_10000BAE8(0, &qword_10003D8F8);
  uint64_t v7 = sub_10000BAE8(0, &qword_10003D900);
  sub_1000265CC(&qword_10003D908, &qword_10003D900);
  sub_100028E30();

  Class isa = sub_100028E20().super.isa;
  swift_bridgeObjectRelease();
  long long v9 = &qword_10003D910;
  *(void *)(v4 + 176) = sub_10000BAE8(0, &qword_10003D910);
  *(void *)(v4 + 184) = sub_1000265CC(&qword_10003D918, &qword_10003D910);
  *(void *)(v4 + 152) = isa;
  sub_10002748C();
  unint64_t v10 = (void *)sub_100028E50();
  [v3 setPredicate:v10];

  uint64_t v11 = (uint64_t)[self fetchSuggestionsWithOptions:v3];
  p_ivar_base_size = &PosterUpdater.Serializer.ivar_base_size;
  id v13 = [(id)v11 fetchedObjects];

  if (!v13)
  {
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
  }
  sub_10000BAE8(0, &qword_10003D920);
  sub_100027CAC();
  unint64_t v14 = sub_100028D60();

  id v15 = [a1 fetchedObjects];
  if (!v15) {
    goto LABEL_52;
  }
  uint64_t v16 = v15;
  uint64_t v17 = sub_100028D60();

  aBlock[0] = _swiftEmptyArrayStorage;
  if ((unint64_t)v17 >> 62)
  {
    if (v17 < 0) {
      uint64_t v11 = v17;
    }
    else {
      uint64_t v11 = v17 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_1000290A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v36 = v3;
  if (v18)
  {
    if (v18 < 1)
    {
      __break(1u);
LABEL_48:
      swift_bridgeObjectRetain();
      sub_1000290A0();
      swift_release();
      goto LABEL_23;
    }
    id v3 = v2;
    for (uint64_t i = 0; i != v18; ++i)
    {
      if ((v17 & 0xC000000000000001) != 0) {
        id v20 = (id)sub_100028FE0();
      }
      else {
        id v20 = *(id *)(v17 + 8 * i + 32);
      }
      uint64_t v21 = v20;
      if (objc_msgSend(v20, "featuredState", v36) == 1)
      {
      }
      else
      {
        sub_100029010();
        sub_100029040();
        sub_100029050();
        sub_100029020();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v11 = (uint64_t)aBlock[0];
  }
  else
  {
    id v3 = v2;
    swift_bridgeObjectRelease();
    uint64_t v11 = (uint64_t)_swiftEmptyArrayStorage;
  }
  LOBYTE(v17) = sub_100028E60();
  if (qword_10003CA38 != -1) {
    swift_once();
  }
  p_cb = &OBJC_PROTOCOL___PREditingDelegate.cb;
  uint64_t v18 = qword_10003DB88;
  id v2 = (id)(v14 >> 62);
  if (!os_log_type_enabled((os_log_t)qword_10003DB88, (os_log_type_t)v17))
  {
    uint64_t v7 = v11 & 0x4000000000000000;
    goto LABEL_27;
  }
  p_ivar_base_size = &OBJC_PROTOCOL___PREditingDelegate.cb;
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  long long v9 = (unint64_t *)sub_100026EDC();
  *(_DWORD *)long long v9 = 134218240;
  uint64_t v7 = v11 & 0x4000000000000000;
  if (v11 < 0 || v7) {
    goto LABEL_48;
  }
LABEL_23:
  swift_release();
  sub_100027B44();
  swift_release();
  *((_WORD *)v9 + 6) = 2048;
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_1000290A0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_100027B44();
  swift_bridgeObjectRelease();
  sub_100027338((void *)&_mh_execute_header, v18, (os_log_type_t)v17, "%ld Suggestions to feature and %ld to unfeature");
  sub_100026E6C();
  p_cb = p_ivar_base_size;
LABEL_27:
  if (v11 < 0 || v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_1000290A0();
    swift_release();
  }
  else
  {
    uint64_t v23 = *(void *)(v11 + 16);
  }
  if (v23 <= 0)
  {
    if (v2)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_1000290A0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v24 < 1)
    {
      swift_release();
      swift_bridgeObjectRelease();

      goto LABEL_41;
    }
  }
  sub_100027754();
  char v25 = (void *)swift_allocObject();
  v25[2] = v11;
  v25[3] = v14;
  aBlock[4] = sub_10002664C;
  aBlock[5] = v25;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_10000C6E0;
  aBlock[3] = &unk_100035128;
  unint64_t v26 = _Block_copy(aBlock);
  swift_release();
  aBlock[0] = 0;
  unsigned int v27 = [v3 performChangesAndWait:v26 error:aBlock];
  _Block_release(v26);
  id v28 = aBlock[0];
  if (v27)
  {

LABEL_41:
    return;
  }
  char v29 = v28;
  sub_100028AC0();

  swift_willThrow();
  os_log_type_t v30 = sub_100028E80();
  id v31 = *((void *)p_cb + 369);
  os_log_type_t v32 = v30;
  LODWORD(v29) = os_log_type_enabled(v31, v30);
  swift_errorRetain();
  swift_errorRetain();
  if (v29)
  {
    uint64_t v33 = (_DWORD *)sub_100026E9C();
    aBlock[0] = (id)sub_100026E84();
    *uint64_t v33 = 136315138;
    swift_getErrorValue();
    uint64_t v34 = sub_100029160();
    sub_10001EC50(v34, v35, (uint64_t *)aBlock);
    sub_10002754C();
    sub_100028F10();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    sub_100027534((void *)&_mh_execute_header, v31, v32, "Error setting featured state of Suggestions: %s");
    swift_arrayDestroy();
    sub_100026E6C();
    sub_100026E6C();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  swift_errorRelease();
}

uint64_t sub_10001746C(unint64_t a1, unint64_t a2)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000290A0();
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (v4)
  {
    uint64_t result = self;
    if (v4 < 1)
    {
      __break(1u);
      goto LABEL_29;
    }
    id v6 = (void *)result;
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v8 = (id)sub_100028FE0();
      }
      else {
        id v8 = *(id *)(a1 + 8 * i + 32);
      }
      long long v9 = v8;
      id v10 = [v6 changeRequestForSuggestion:v8];
      if (v10)
      {
        uint64_t v11 = v10;
        [v10 setFeaturedState:1];
      }
    }
  }
  swift_bridgeObjectRelease();
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1000290A0();
    if (v12)
    {
LABEL_14:
      uint64_t result = self;
      if (v12 >= 1)
      {
        id v13 = (void *)result;
        for (uint64_t j = 0; j != v12; ++j)
        {
          if ((a2 & 0xC000000000000001) != 0) {
            id v15 = (id)sub_100028FE0();
          }
          else {
            id v15 = *(id *)(a2 + 8 * j + 32);
          }
          uint64_t v16 = v15;
          id v17 = [v13 changeRequestForSuggestion:v15];
          if (v17)
          {
            uint64_t v18 = v17;
            [v17 setFeaturedState:0];
          }
        }
        goto LABEL_22;
      }
LABEL_29:
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12) {
      goto LABEL_14;
    }
  }
LABEL_22:
  return swift_bridgeObjectRelease();
}

void sub_100017668()
{
  sub_1000270A8();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  sub_100028B50();
  sub_10000C214();
  __chkstk_darwin(v8);
  sub_100027C30();
  long long v9 = self;
  sub_100009C74(&qword_10003D8D0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10002A570;
  *(void *)(v10 + 32) = v5;
  *(void *)(v10 + 40) = v3;
  swift_bridgeObjectRetain();
  Class isa = sub_100028D40().super.isa;
  swift_bridgeObjectRelease();
  id v12 = [v9 descriptorIdentifierForDescriptorType:v7 uuids:isa];

  uint64_t v13 = sub_100028CE0();
  unint64_t v15 = v14;

  id v16 = [v9 descriptorTypeStringWithType:v7];
  uint64_t v88 = sub_100028CE0();
  unint64_t v18 = v17;

  swift_bridgeObjectRetain();
  uint64_t v19 = sub_100027C94();
  uint64_t v21 = sub_10000C814(v19, v20, v1);
  swift_bridgeObjectRelease();
  if (v21)
  {
    swift_bridgeObjectRelease();
    os_log_type_t v22 = sub_100028E90();
    if (qword_10003CA38 != -1) {
      swift_once();
    }
    uint64_t v23 = qword_10003DB88;
    if (os_log_type_enabled((os_log_t)qword_10003DB88, v22))
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = (uint8_t *)sub_100026E9C();
      v97[0] = (id)sub_100026E84();
      sub_100027564(4.8149e-34);
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_10001EC50(v88, v18, (uint64_t *)v97);
      sub_100027858(v25);
      sub_100028F10();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v23, v22, "Maintain %s descriptor", v24, 0xCu);
      swift_arrayDestroy();
      sub_100026E6C();
      sub_100026E6C();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    goto LABEL_32;
  }
  sub_10000BAE8(0, &qword_10003D8D8);
  swift_bridgeObjectRetain();
  sub_10002765C();
  id v26 = sub_1000181B4();
  sub_10000BAE8(0, &qword_10003D8E0);
  sub_100009C74(&qword_10003D450);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_10002A560;
  *(void *)(v27 + 32) = v26;
  sub_100028D80();
  id v28 = v26;
  uint64_t v29 = sub_100027C88();
  id v30 = sub_10000C724(v29);
  sub_10000BAE8(0, (unint64_t *)&unk_10003D8E8);
  id v31 = (void *)PRPosterRoleLockScreen;
  swift_bridgeObjectRetain();
  id v32 = v31;
  uint64_t v87 = v13;
  uint64_t v33 = v13;
  uint64_t v34 = v30;
  id v35 = sub_100012CA4(v33, v15, v32);
  id v36 = [v35 assetDirectory];
  sub_100028B20();

  sub_100028AF0(v37);
  uint64_t v39 = v38;
  sub_10002706C();
  v40();
  v97[0] = 0;
  id v41 = [v34 saveToURL:v39 error:v97];

  id v42 = v97[0];
  if (!v41)
  {
    id v58 = v42;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v59 = (void *)sub_100028AC0();

    swift_willThrow();
    v97[0] = v59;
    swift_errorRetain();
    sub_100009C74(&qword_10003D458);
    sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
    if (sub_100026F98())
    {
      id v60 = v34;
      swift_errorRelease();
      id v61 = v95;
      os_log_type_t v62 = sub_100028E80();
      uint64_t v63 = v28;
      if (qword_10003CA38 != -1) {
        swift_once();
      }
      unint64_t v64 = qword_10003DB88;
      if (os_log_type_enabled((os_log_t)qword_10003DB88, v62))
      {
        id v65 = v95;
        uint64_t v93 = v60;
        uint64_t v66 = (uint8_t *)sub_100026E9C();
        uint64_t v90 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v66 = 138412290;
        uint64_t v96 = (uint64_t)v65;
        id v67 = v65;
        uint64_t v63 = v28;
        sub_100028F10();
        void *v90 = v65;

        id v61 = v95;
        _os_log_impl((void *)&_mh_execute_header, v64, v62, "Failed to save archivedData error:%@", v66, 0xCu);
        sub_100009C74(&qword_10003D468);
        swift_arrayDestroy();
        sub_100026E6C();
        id v60 = v93;
        sub_100026E6C();
      }
      id v68 = v61;
      swift_willThrow();
    }
    else
    {
    }
    goto LABEL_31;
  }
  id v43 = PPGalleryOptionsForDescriptorType((uint64_t)[v34 descriptorType], v28);
  v97[0] = 0;
  unsigned int v44 = [v35 storeGalleryOptions:v43 error:v97];
  id v45 = v97[0];
  if (!v44)
  {
    uint64_t v91 = v43;
    id v69 = v97[0];
    sub_100027CB8();
    swift_bridgeObjectRelease();
    unint64_t v70 = (void *)sub_100028AC0();

    swift_willThrow();
    v97[0] = v70;
    swift_errorRetain();
    sub_100009C74(&qword_10003D458);
    sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
    if (sub_100026F98())
    {
      id v94 = v34;
      swift_errorRelease();
      os_log_type_t v71 = v95;
      os_log_type_t v72 = sub_100028E80();
      if (qword_10003CA38 != -1) {
        swift_once();
      }
      unint64_t v73 = qword_10003DB88;
      if (os_log_type_enabled((os_log_t)qword_10003DB88, v72))
      {
        id v74 = v95;
        swift_bridgeObjectRetain();
        id v75 = v74;
        uint64_t v76 = sub_100026EDC();
        uint64_t v96 = sub_1000270CC();
        *(_DWORD *)uint64_t v76 = 136315394;
        os_log_type_t v86 = v72;
        swift_bridgeObjectRetain();
        sub_10001EC50(v87, v15, &v96);
        sub_100028F10();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v76 + 12) = 2080;
        id v77 = [v75 localizedDescription];
        uint64_t v78 = sub_100028CE0();
        unint64_t v80 = v79;

        uint64_t v81 = v78;
        os_log_type_t v71 = v95;
        uint64_t v82 = sub_10001EC50(v81, v80, &v96);
        sub_100027A8C(v82);
        sub_100028F10();

        uint64_t v83 = v28;
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v73, v86, "Failed to store galleryOptions for descriptor '%s': %s", (uint8_t *)v76, 0x16u);
        sub_100027C64();
        sub_100026E6C();
        sub_100026E6C();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v83 = v28;
      }
      id v84 = v71;
      swift_willThrow();
    }
    else
    {

      swift_bridgeObjectRelease();
    }

LABEL_31:
    swift_errorRelease();
    goto LABEL_32;
  }
  uint64_t v89 = v28;
  self;
  id v46 = v45;
  NSString v47 = sub_100028CB0();
  unint64_t v48 = (void *)sub_100027CE8();
  id v50 = [v48 v49];

  unint64_t v85 = v50;
  id v51 = [self galleryOptionsWithAssetLookupInfo:v50];
  [v35 setPreferredGalleryOptions:v51];
  id v92 = v34;
  unint64_t v52 = sub_1000134A4(v34);
  sub_100025514(v52, v53, v35);
  os_log_type_t v54 = sub_100028E90();
  if (qword_10003CA38 != -1) {
    swift_once();
  }
  id v55 = qword_10003DB88;
  if (os_log_type_enabled((os_log_t)qword_10003DB88, v54))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_100026EDC();
    v97[0] = (id)sub_1000270CC();
    *(_DWORD *)uint64_t v56 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_10001EC50(v88, v18, (uint64_t *)v97);
    sub_100027858(v57);
    sub_100028F10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v56 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_10001EC50(v87, v15, (uint64_t *)v97);
    sub_100028F10();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v55, v54, "Added %s descriptor %s", (uint8_t *)v56, 0x16u);
    swift_arrayDestroy();
    sub_100026E6C();
    sub_100026E6C();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_32:
  sub_100027078();
}

id sub_1000181B4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_100028CB0();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithImageName:v1];

  return v2;
}

uint64_t sub_100018228(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  sub_1000274B0();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_100018250()
{
  uint64_t v1 = sub_10002565C(*(void **)(v0 + 32), (SEL *)&selRef_identifier);
  *(void *)(v0 + 48) = v2;
  if (v2)
  {
    uint64_t v3 = v1;
    uint64_t v4 = v2;
    if (qword_10003CA40 != -1) {
      swift_once();
    }
    uint64_t v5 = *(void *)(v0 + 40);
    uint64_t v6 = *(void *)(v0 + 24);
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v7;
    v7[2] = v5;
    v7[3] = v6;
    v7[4] = v3;
    v7[5] = v4;
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v8;
    void *v8 = v0;
    v8[1] = sub_1000185EC;
    sub_100027C24((uint64_t)"updateConfiguration");
    sub_1000272B8();
    __asm { BR              X5 }
  }
  uint64_t v11 = PPPosterOverrideConfigurationFromSessionInfo(*(void **)(v0 + 32));
  *(void *)(v0 + 72) = v11;
  if (v11)
  {
    id v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v12;
    void *v12 = v0;
    v12[1] = sub_1000186F4;
    sub_100027C24(*(void *)(v0 + 24));
    sub_1000272B8();
    return sub_10001A0A0();
  }
  else
  {
    if (PPPosterLegacyConfigurationTypeFromSessionInfo(*(void **)(v0 + 32)) != 2)
    {
      sub_100028E80();
      if (qword_10003CA38 != -1) {
        swift_once();
      }
      if (sub_100027168())
      {
        id v17 = *(id *)(v0 + 24);
        unint64_t v18 = (_DWORD *)sub_100026E9C();
        uint64_t v19 = (void *)sub_100026FB0();
        *unint64_t v18 = 138412290;
        *(void *)(v0 + 16) = v17;
        id v20 = v17;
        sub_100028F10();
        *uint64_t v19 = v17;

        sub_100027004((void *)&_mh_execute_header, v21, v22, "Update Configuration called outside of refresh session for %@, bailing");
        sub_100009C74(&qword_10003D468);
        swift_arrayDestroy();
        sub_100026E6C();
        sub_100026E6C();
      }
      sub_10000C3B4();
      id v24 = v23;
      sub_1000272B8();
      __asm { BRAA            X1, X16 }
    }
    unint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v15;
    *unint64_t v15 = v0;
    v15[1] = sub_100018828;
    sub_100027C24(*(void *)(v0 + 24));
    sub_1000272B8();
    return sub_10001B3C8();
  }
}

uint64_t sub_1000185EC()
{
  sub_10000C1AC();
  uint64_t v1 = *v0;
  sub_10000C278();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v3 = sub_1000273D4();
  return v4(v3);
}

uint64_t sub_1000186F4()
{
  sub_10000C4AC();
  sub_10000C1AC();
  sub_100027054();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 88) = v3;
  swift_task_dealloc();
  sub_1000274B0();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_1000187C4()
{
  sub_10000C4AC();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100018828()
{
  sub_10000C4AC();
  sub_10000C1AC();
  uint64_t v1 = *v0;
  sub_10000C278();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = sub_1000273D4();
  return v4(v3);
}

uint64_t sub_10001890C(void *a1, int a2, void *a3, void *a4, void *aBlock)
{
  uint64_t v8 = _Block_copy(aBlock);
  long long v9 = (void *)sub_1000277B0();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  sub_100027C88();
  return sub_10000C570();
}

uint64_t sub_10001898C(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = a2;
  a4;
  id v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  void *v10 = v4;
  v10[1] = sub_100018A64;
  return sub_100018228((uint64_t)v8, (uint64_t)v9);
}

uint64_t sub_100018A64(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 32);
  uint64_t v7 = *(void **)(*v2 + 24);
  id v8 = *(void **)(*v2 + 16);
  uint64_t v9 = *v2;
  sub_10000C278();
  void *v10 = v9;
  swift_task_dealloc();

  id v11 = *(void (***)(void, void, void))(v5 + 40);
  if (v3)
  {
    sub_100028AB0();
    sub_100027CC4();
    swift_errorRelease();
    ((void (**)(void, void, void *))v11)[2](v11, 0, a1);

    _Block_release(v11);
  }
  else
  {
    ((void (**)(void, void *, void))v11)[2](v11, a1, 0);
    _Block_release(v11);
  }
  uint64_t v12 = *(uint64_t (**)(void))(v9 + 8);
  return v12();
}

void sub_100018C30()
{
  sub_100027184();
  unint64_t v165 = v1;
  id v166 = v2;
  id v170 = v3;
  uint64_t v171 = sub_100028B50();
  sub_10000C214();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_100027518();
  uint64_t v8 = __chkstk_darwin(v7);
  id v10 = (char *)v155 - v9;
  __chkstk_darwin(v8);
  sub_100027060();
  unint64_t v160 = v11;
  sub_100026F34();
  __chkstk_darwin(v12);
  sub_100027060();
  uint64_t v161 = v13;
  sub_100026F34();
  __chkstk_darwin(v14);
  sub_100027060();
  uint64_t v164 = v15;
  sub_100026F34();
  __chkstk_darwin(v16);
  uint64_t v168 = (char *)v155 - v17;
  sub_100026F34();
  __chkstk_darwin(v18);
  sub_100027060();
  uint64_t v167 = v19;
  sub_100026F34();
  __chkstk_darwin(v20);
  sub_100027060();
  os_log_t v163 = v21;
  sub_100026F34();
  __chkstk_darwin(v22);
  id v24 = (char *)v155 - v23;
  os_log_type_t v25 = sub_100028E90();
  if (qword_10003CA38 != -1) {
    swift_once();
  }
  p_cb = &OBJC_PROTOCOL___PREditingDelegate.cb;
  uint64_t v27 = qword_10003DB88;
  BOOL v28 = os_log_type_enabled((os_log_t)qword_10003DB88, v25);
  uint64_t v169 = v5;
  if (v28)
  {
    id v29 = v170;
    LODWORD(v157) = v25;
    id v30 = v29;
    unint64_t v31 = (unint64_t)v166;
    sub_1000272A0();
    id v32 = v30;
    uint64_t v33 = sub_100026EDC();
    uint64_t v34 = (void *)sub_100026FB0();
    unint64_t v158 = (void *)sub_100026E84();
    v175[0] = v158;
    *(_DWORD *)uint64_t v33 = 138412546;
    uint64_t v156 = v27;
    uint64_t v173 = (uint64_t)v32;
    uint64_t v159 = v10;
    uint64_t v35 = v0;
    id v36 = v32;
    sub_100027BE8();
    sub_100028F10();
    *uint64_t v34 = v32;
    p_cb = &OBJC_PROTOCOL___PREditingDelegate.cb;

    uint64_t v0 = v35;
    *(_WORD *)(v33 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v173 = sub_10001EC50((uint64_t)v165, v31, (uint64_t *)v175);
    sub_100027BE8();
    sub_100028F10();
    sub_100027474();
    sub_100027B2C((void *)&_mh_execute_header, v156, (os_log_type_t)v157, "Update Configuration called for %@ with refresh session at path '%s'");
    sub_100009C74(&qword_10003D468);
    sub_100027140();
    uint64_t v5 = v169;
    sub_100026E6C();
    sub_10002711C();
    sub_100026E6C();
    sub_100026E6C();
  }
  id v37 = [v170 assetDirectory];
  sub_100028B20();

  uint64_t v38 = self;
  sub_100028AF0(v39);
  id v41 = v40;
  v175[0] = 0;
  id v42 = [v38 loadFromURL:v40 error:v175];

  if (!v42)
  {
    id v55 = v175[0];
    uint64_t v56 = (void *)sub_100028AC0();

    swift_willThrow();
    v175[0] = v56;
    sub_100009C74(&qword_10003D458);
    sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
    sub_100026F98();
    uint64_t v57 = (void *)v173;
    os_log_type_t v58 = sub_100028E80();
    id v59 = qword_10003DB88;
    sub_100027134();
    v60();
    if (os_log_type_enabled(v59, v58))
    {
      uint64_t v61 = v5;
      id v62 = v57;
      uint64_t v63 = sub_100026EDC();
      id v162 = v24;
      uint64_t v64 = v63;
      uint64_t v168 = (char *)sub_1000270CC();
      uint64_t v174 = v168;
      *(_DWORD *)uint64_t v64 = 136315394;
      sub_10002654C(&qword_10003D460, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v65 = sub_100029100();
      uint64_t v172 = sub_10001EC50(v65, v66, (uint64_t *)&v174);
      sub_100027090();
      swift_bridgeObjectRelease();
      uint64_t v169 = *(void *)(v61 + 8);
      sub_100027110();
      v67();
      *(_WORD *)(v64 + 12) = 2080;
      id v68 = [v62 localizedDescription];
      uint64_t v69 = sub_100028CE0();
      unint64_t v71 = v70;

      uint64_t v172 = sub_10001EC50(v69, v71, (uint64_t *)&v174);
      sub_100027090();

      swift_bridgeObjectRelease();
      sub_100027338((void *)&_mh_execute_header, v59, v58, "Failed to load current configuration model from url '%s': %s");
      sub_1000275A8();
      swift_arrayDestroy();
      sub_100026E6C();
      sub_100026E6C();

      sub_100027110();
      v72();
    }
    else
    {
      id v138 = *(void (**)(void))(v5 + 8);
      sub_100026F8C();
      v138();

      sub_100026F8C();
      v138();
    }
    v170;
    swift_errorRelease();
LABEL_29:
    sub_100026F74();
    return;
  }
  uint64_t v159 = v38;
  id v43 = v175[0];
  unsigned int v44 = v42;
  os_log_type_t v45 = sub_100028E60();
  id v46 = qword_10003DB88;
  NSString v47 = *(void (**)(void))(v5 + 16);
  unint64_t v48 = v163;
  unint64_t v158 = (void *)(v5 + 16);
  sub_100027134();
  v47();
  BOOL v49 = os_log_type_enabled(v46, v45);
  id v162 = v24;
  v155[1] = v0;
  unint64_t v157 = v47;
  if (v49)
  {
    id v50 = (_DWORD *)sub_100026E9C();
    LOBYTE(v47) = (_BYTE)v48;
    v175[0] = (id)sub_100026E84();
    *id v50 = 136315138;
    sub_10002654C(&qword_10003D460, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v51 = sub_100029100();
    uint64_t v53 = sub_1000274E4(v51, v52);
    sub_1000273E8(v53);
    sub_100028F10();
    p_cb = (_DWORD *)(&OBJC_PROTOCOL___PREditingDelegate + 64);
    swift_bridgeObjectRelease();
    os_log_t v163 = *(void (**)(void, void))(v169 + 8);
    sub_1000270C0();
    v54();
    sub_100027304((void *)&_mh_execute_header, v46, v45, "Successfully loaded current configuration model from url '%s'");
    swift_arrayDestroy();
    sub_100026E6C();
    sub_100026E6C();
  }
  else
  {
    os_log_t v163 = *(void (**)(void, void))(v5 + 8);
    v163(v48, v171);
  }
  unint64_t v73 = v168;
  id v74 = [v44 identifier];
  uint64_t v156 = v44;

  uint64_t v75 = sub_100028CE0();
  unint64_t v77 = v76;

  os_log_type_t v78 = sub_100028E90();
  unint64_t v79 = *((void *)p_cb + 369);
  os_log_type_t v80 = v78;
  if (sub_100027350())
  {
    sub_100027A74();
    NSString v47 = (void (*)(void))v77;
    uint64_t v81 = (_DWORD *)sub_100026E9C();
    v175[0] = (id)sub_100026E84();
    _DWORD *v81 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v82 = sub_10001EC50(v75, (unint64_t)v47, (uint64_t *)v175);
    sub_1000273E8(v82);
    sub_100028F10();
    sub_100027474();
    sub_10002703C((void *)&_mh_execute_header, v79, v80, "Starting to update configuration '%s'");
    sub_10002711C();
    sub_100026E6C();
    unint64_t v77 = (unint64_t)v47;
    sub_100026E6C();
  }
  sub_100028AE0();
  sub_100028B10();
  sub_100028AF0(v83);
  unint64_t v85 = v84;
  v175[0] = 0;
  id v86 = [v159 loadFromURL:v84 error:v175];

  if (v86)
  {
    id v87 = v175[0];
    id v88 = v86;
    os_log_type_t v89 = sub_100028E60();
    uint64_t v90 = *((void *)p_cb + 369);
    BOOL v91 = sub_1000276B4(v89);
    v155[2] = v75;
    id v166 = v88;
    if (v91)
    {
      sub_100027A74();
      id v92 = v88;
      uint64_t v93 = sub_100026EDC();
      uint64_t v159 = (void *)sub_100026FB0();
      unint64_t v165 = (void *)sub_100026E84();
      v175[0] = v165;
      *(_DWORD *)uint64_t v93 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v94 = sub_10001EC50(v75, v77, (uint64_t *)v175);
      sub_100027760(v94);
      sub_100028F10();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v93 + 12) = 2112;
      uint64_t v173 = (uint64_t)v92;
      id v95 = v92;
      unint64_t v73 = v168;
      sub_100028F10();
      *uint64_t v159 = v86;

      _os_log_impl((void *)&_mh_execute_header, v90, (os_log_type_t)v47, "Successfully loaded updated configuration model '%s': %@", (uint8_t *)v93, 0x16u);
      sub_100009C74(&qword_10003D468);
      sub_10002711C();
      sub_100026E6C();
      sub_10002711C();
      sub_100026E6C();
      sub_100026E6C();
    }
    else
    {
    }
    unint64_t v109 = v160;
    os_log_type_t v110 = sub_100028E90();
    uint64_t v111 = qword_10003DB88;
    os_log_type_t v112 = v110;
    if (sub_100027350())
    {
      sub_100027A74();
      unint64_t v113 = v77;
      uint64_t v114 = (_DWORD *)sub_100026E9C();
      v175[0] = (id)sub_100026E84();
      *uint64_t v114 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v115 = sub_10002777C();
      uint64_t v117 = sub_10001EC50(v115, v113, v116);
      sub_1000273E8(v117);
      sub_100028F10();
      swift_bridgeObjectRelease_n();
      sub_10002703C((void *)&_mh_execute_header, v111, v112, "Configuration '%s' has changed, updating...");
      sub_10002711C();
      sub_100026E6C();
      unint64_t v77 = v113;
      sub_100026E6C();
    }
    unint64_t v165 = [self mutableConfiguration];
    id v118 = [v165 assetDirectory];
    uint64_t v119 = v164;
    sub_100028B20();

    os_log_type_t v120 = sub_100028E90();
    uint64_t v121 = qword_10003DB88;
    uint64_t v122 = v161;
    uint64_t v123 = v171;
    id v124 = v157;
    ((void (*)(uint64_t, char *, uint64_t))v157)(v161, v73, v171);
    ((void (*)(unint64_t, uint64_t, uint64_t))v124)(v109, v119, v123);
    if (os_log_type_enabled(v121, v120))
    {
      sub_100027A74();
      unint64_t v125 = v109;
      uint64_t v126 = sub_100026E84();
      uint64_t v159 = (void *)swift_slowAlloc();
      v175[0] = v159;
      *(_DWORD *)uint64_t v126 = 136315650;
      LODWORD(v158) = v120;
      swift_bridgeObjectRetain();
      uint64_t v127 = sub_10002777C();
      uint64_t v129 = sub_10001EC50(v127, v77, v128);
      sub_100027760(v129);
      unint64_t v160 = v77;
      sub_100027090();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v126 + 12) = 2080;
      uint64_t v130 = sub_100028B40();
      uint64_t v173 = sub_1000274E4(v130, v131);
      sub_100027090();
      swift_bridgeObjectRelease();
      uint64_t v132 = v171;
      id v133 = v163;
      v163(v122, v171);
      *(_WORD *)(v126 + 22) = 2080;
      uint64_t v134 = sub_100028B40();
      uint64_t v173 = sub_1000274E4(v134, v135);
      unint64_t v77 = v160;
      sub_100028F10();
      swift_bridgeObjectRelease();
      v133(v125, v132);
      _os_log_impl((void *)&_mh_execute_header, v121, (os_log_type_t)v158, "Copying resources for configuration '%s' from '%s' to '%s'", (uint8_t *)v126, 0x20u);
      swift_arrayDestroy();
      sub_100026E6C();
      sub_100026E6C();
    }
    else
    {
      uint64_t v136 = v171;
      uint64_t v137 = (void (*)(void))v163;
      sub_100026EB4();
      v137();
      ((void (*)(unint64_t, uint64_t))v137)(v109, v136);
    }
    sub_1000134FC();
    uint64_t v140 = v139;
    os_log_type_t v141 = sub_100028E60();
    uint64_t v142 = qword_10003DB88;
    os_log_type_t v143 = v141;
    if (sub_100027350())
    {
      swift_bridgeObjectRetain();
      unint64_t v145 = v77;
      uint64_t v146 = sub_100026EDC();
      v175[0] = (id)sub_100026E84();
      *(_DWORD *)uint64_t v146 = 134218242;
      sub_100027668();
      uint64_t v173 = v140;
      sub_100028F10();
      *(_WORD *)(v146 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v147 = sub_10002777C();
      uint64_t v173 = sub_10001EC50(v147, v145, v148);
      sub_100028F10();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v142, v143, "Successfully copied %ld resources for configuration '%s'", (uint8_t *)v146, 0x16u);
      sub_10002760C();
      sub_100026E6C();
      sub_100026E6C();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_100027674();

    id v154 = (void (*)(void))v163;
    sub_100026EB4();
    v154();
    sub_100026EB4();
    v154();
    sub_100026EB4();
    v154();
    sub_100026EB4();
    v154();
    goto LABEL_29;
  }
  id v96 = v175[0];
  sub_100028AC0();

  swift_willThrow();
  os_log_type_t v97 = sub_100028E80();
  os_log_t v98 = *((void *)p_cb + 369);
  sub_100027134();
  v99();
  if (os_log_type_enabled(v98, v97))
  {
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    uint64_t v100 = sub_100026E84();
    unint64_t v165 = (void *)sub_100026FB0();
    id v166 = (id)sub_1000270CC();
    v175[0] = v166;
    *(_DWORD *)uint64_t v100 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v101 = sub_100027828();
    uint64_t v104 = sub_10001EC50(v101, v102, v103);
    sub_100027760(v104);
    sub_100027090();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v100 + 12) = 2080;
    sub_10002654C(&qword_10003D460, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v105 = sub_100029100();
    uint64_t v173 = sub_1000274E4(v105, v106);
    sub_100027090();
    swift_bridgeObjectRelease();
    uint64_t v107 = (void (*)(void))v163;
    sub_100026F8C();
    v107();
    *(_WORD *)(v100 + 22) = 2112;
    swift_errorRetain();
    uint64_t v108 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v173 = v108;
    sub_100027090();
    *unint64_t v165 = v108;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v98, v97, "Failed to load updated configuration model '%s' from url '%s': %@", (uint8_t *)v100, 0x20u);
    sub_100009C74(&qword_10003D468);
    sub_10002711C();
    sub_100026E6C();
    swift_arrayDestroy();
    sub_100026E6C();
    sub_100026E6C();
    sub_100027674();
    swift_errorRelease();
    sub_100026F8C();
    v107();
    sub_100026F8C();
    v107();
    sub_100026F8C();
    v107();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_100027674();
    uint64_t v149 = v171;
    id v150 = (void (*)(void))v163;
    sub_100026EB4();
    v150();
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    sub_100026EB4();
    v150();
    sub_100026EB4();
    v150();
    ((void (*)(char *, uint64_t))v150)(v162, v149);
  }
  sub_100026F74();
  id v153 = v151;
}

uint64_t sub_10001A0A0()
{
  sub_10000C4AC();
  v0[30] = v1;
  v0[31] = v2;
  uint64_t v3 = sub_100009C74((uint64_t *)&unk_10003D410);
  sub_100027450(v3);
  v0[32] = swift_task_alloc();
  uint64_t v4 = sub_100028B50();
  v0[33] = v4;
  sub_1000270E4(v4);
  v0[34] = v5;
  v0[35] = swift_task_alloc();
  v0[36] = swift_task_alloc();
  v0[37] = swift_task_alloc();
  sub_1000274B0();
  return _swift_task_switch(v6, v7, v8);
}

void sub_10001A1A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_10002731C();
  sub_1000278CC();
  id v17 = [self mutableConfiguration];
  *(void *)(v16 + 304) = v17;
  uint64_t v18 = self;
  *(void *)(v16 + 184) = 0;
  id v19 = [v18 openPhotoLibraryWithWellKnownIdentifier:1 error:v16 + 184];
  *(void *)(v16 + 312) = v19;
  uint64_t v20 = *(void **)(v16 + 184);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void **)(v16 + 240);
    id v23 = v20;
    id v24 = [v22 assetDirectory];
    sub_100028B20();

    self;
    sub_100028AF0(v25);
    uint64_t v27 = v26;
    *(void *)(v16 + 160) = 0;
    BOOL v28 = (void *)sub_100027CA0();
    id v30 = [v28 v29];

    unint64_t v31 = *(void **)(v16 + 160);
    if (v30)
    {
      id v32 = v31;
    }
    else
    {
      id v52 = v31;
      sub_100028AC0();

      swift_willThrow();
      swift_errorRelease();
      id v53 = [objc_allocWithZone((Class)PFPosterConfiguration) initWithConfigurationType:0];
      id v30 = v53;
      if (!v53)
      {
        __break(1u);
_swift_continuation_await:
        _swift_continuation_await(v53, v54, v55, v56, v57, v58, v59, v60, a9, a10, a11, a12, a13, a14, a15, a16);
        return;
      }
    }
    a11 = (void *)(v16 + 120);
    *(void *)(v16 + 320) = v30;
    uint64_t v61 = *(void *)(v16 + 256);
    uint64_t v62 = *(void *)(v16 + 264);
    uint64_t v63 = *(void *)(v16 + 248);
    id v64 = v30;
    objc_msgSend(v64, "setOptions:", (unint64_t)objc_msgSend(v64, "options") | 8);

    id v65 = v64;
    id v66 = [v17 assetDirectory];
    sub_100028B20();

    sub_10000B9B0(v61, 0, 1, v62);
    objc_allocWithZone((Class)PUWallpaperConfigurationUpdater);
    swift_unknownObjectRetain();
    id v67 = sub_10001DC28(v21, v65, v61, v63);
    *(void *)(v16 + 328) = v67;
    *(void *)(v16 + 16) = v16;
    *(void *)(v16 + 56) = v16 + 120;
    *(void *)(v16 + 24) = sub_10001A6E4;
    uint64_t v68 = swift_continuation_init();
    *(void *)(v16 + 80) = _NSConcreteStackBlock;
    *(void *)(v16 + 88) = 0x40000000;
    *(void *)(v16 + 96) = sub_10001B264;
    *(void *)(v16 + 104) = &unk_1000350E8;
    *(void *)(v16 + 112) = v68;
    [v67 attemptUpdateWithCompletionBlock:v16 + 80];
    sub_100026EC0();
    goto _swift_continuation_await;
  }
  id v33 = v20;
  uint64_t v34 = sub_100028AC0();

  swift_willThrow();
  *(void *)(v16 + 176) = v34;
  sub_100009C74(&qword_10003D458);
  sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
  if (swift_dynamicCast())
  {
    uint64_t v35 = *(void **)(v16 + 168);
    os_log_type_t v36 = sub_100028E80();
    if (qword_10003CA38 != -1) {
      swift_once();
    }
    id v37 = qword_10003DB88;
    if (os_log_type_enabled((os_log_t)qword_10003DB88, v36))
    {
      a10 = v16 + 152;
      id v38 = v35;
      a11 = v35;
      uint64_t v39 = (uint8_t *)sub_100026E9C();
      uint64_t v40 = (void *)sub_100026FB0();
      *(_DWORD *)uint64_t v39 = 138412290;
      *(void *)(v16 + 152) = v38;
      id v41 = v38;
      sub_1000271E0();
      void *v40 = v38;

      _os_log_impl((void *)&_mh_execute_header, v37, v36, "Failed to update current configuration with override configuration: %@", v39, 0xCu);
      sub_100009C74(&qword_10003D468);
      sub_100027228();
      sub_100026E6C();
      sub_100026E6C();
    }
    id v42 = *(void **)(v16 + 240);

    id v43 = v42;
    swift_errorRelease();
    sub_1000275CC();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_100026EC0();
    v46(v44, v45, v46, v47, v48, v49, v50, v51, a9, a10, a11, a12, a13, a14, a15, a16);
  }
  else
  {
    sub_100026EC0();
  }
}

uint64_t sub_10001A6E4()
{
  sub_10000C4AC();
  sub_10000C1AC();
  sub_100027054();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 336) = *(void *)(v3 + 48);
  sub_1000274B0();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_10001A7F0()
{
  uint64_t v2 = *(void **)(v1 + 120);
  uint64_t v3 = *(void **)(v1 + 128);
  uint64_t v4 = *(void **)(v1 + 136);
  uint64_t v5 = *(void *)(v1 + 144);
  id v6 = [*(id *)(v1 + 304) assetDirectory];
  sub_100028B20();

  sub_100028AF0(v7);
  uint64_t v9 = v8;
  *(void *)(v1 + 192) = 0;
  id v10 = [v2 saveToURL:v8 error:v1 + 192];

  unint64_t v11 = *(void **)(v1 + 192);
  if (!v10)
  {
    os_log_type_t v89 = v4;
    id v38 = v11;
    uint64_t v39 = sub_100027D00();

    goto LABEL_12;
  }
  uint64_t v12 = (uint64_t *)(v1 + 304);
  id v13 = v11;
  unint64_t v14 = sub_1000256B8(v2);
  if (!v14)
  {
    id v65 = *(void **)(v1 + 320);
    id v66 = *(void **)(v1 + 328);
    id v67 = *(void **)(v1 + 312);
LABEL_31:

    swift_unknownObjectRelease();
    uint64_t v75 = *(void *)(v1 + 296);
    uint64_t v76 = *(void *)(v1 + 264);
    unint64_t v77 = *(void (**)(uint64_t, uint64_t))(*(void *)(v1 + 272) + 8);
    v77(*(void *)(v1 + 288), v76);
    v77(v75, v76);
    goto LABEL_32;
  }
  unint64_t v15 = v14;
  uint64_t v16 = v14 & 0xFFFFFFFFFFFFFF8;
  if (!(v14 >> 62))
  {
    if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
  if (!sub_1000290A0())
  {
LABEL_30:
    id v65 = *(void **)(v1 + 320);
    id v66 = *(void **)(v1 + 328);
    id v67 = *(void **)(v1 + 312);
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
LABEL_5:
  id v85 = v2;
  id v87 = v3;
  os_log_type_t v89 = v4;
  if ((v15 & 0xC000000000000001) != 0)
  {
    id v17 = (id)sub_100028FE0();
  }
  else
  {
    if (!*(void *)(v16 + 16))
    {
      __break(1u);
      goto LABEL_37;
    }
    id v17 = *(id *)(v15 + 32);
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)(v1 + 280);
  uint64_t v20 = *(void *)(v1 + 272);
  uint64_t v88 = *(void *)(v1 + 264);
  swift_bridgeObjectRelease();
  id v21 = [v18 subpath];

  sub_100028CE0();
  id v82 = self;
  swift_unknownObjectRetain();
  id v22 = v3;
  id v23 = v89;
  sub_100028B10();
  swift_bridgeObjectRelease();
  sub_100028AF0(v24);
  uint64_t v26 = v25;
  uint64_t v27 = *(void (**)(void))(v20 + 8);
  ((void (*)(uint64_t, uint64_t))v27)(v19, v88);
  *(void *)(v1 + 224) = 0;
  LODWORD(v19) = [v82 saveSegmentationItem:v5 compoundLayerStack:v22 style:v23 toWallpaperURL:v26 error:v1 + 224];

  os_log_type_t v80 = v23;
  swift_unknownObjectRelease();
  id v28 = *(id *)(v1 + 224);
  if (!v19)
  {
    unint64_t v73 = v28;
    uint64_t v39 = sub_100028AC0();

    uint64_t v2 = v85;
    uint64_t v3 = v87;
    goto LABEL_12;
  }
  sub_100028AF0(v29);
  unint64_t v31 = v30;
  *(void *)(v1 + 232) = 0;
  uint64_t v2 = v85;
  id v32 = [v85 saveToURL:v30 error:v1 + 232];

  id v33 = *(void **)(v1 + 232);
  if (!v32)
  {
    id v74 = v33;
    uint64_t v39 = sub_100027D00();

    uint64_t v3 = v87;
LABEL_12:
    swift_willThrow();
    *(void *)(v1 + 200) = v39;
    swift_errorRetain();
    sub_100009C74(&qword_10003D458);
    sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      uint64_t v40 = *(void **)(v1 + 208);
      os_log_type_t v41 = sub_100028E80();
      if (qword_10003CA38 != -1) {
        swift_once();
      }
      id v42 = qword_10003DB88;
      BOOL v43 = sub_100027350();
      uint64_t v44 = *(void **)(v1 + 312);
      uint64_t v45 = *(void **)(v1 + 304);
      if (v43)
      {
        id v83 = *(id *)(v1 + 312);
        id v84 = *(void **)(v1 + 320);
        id v46 = v40;
        uint64_t v47 = (uint8_t *)sub_100026E9C();
        id v86 = v2;
        uint64_t v48 = (void *)sub_100026FB0();
        *(_DWORD *)uint64_t v47 = 138412290;
        *(void *)(v1 + 216) = v46;
        uint64_t v81 = v45;
        id v49 = v46;
        sub_100028F10();
        *uint64_t v48 = v46;
        uint64_t v50 = v84;

        _os_log_impl((void *)&_mh_execute_header, v42, v41, "Failed to run segmentation with override configuration: %@", v47, 0xCu);
        sub_100009C74(&qword_10003D468);
        sub_100027140();
        uint64_t v2 = v86;
        sub_100026E6C();
        sub_100026E6C();

        swift_unknownObjectRelease();
        uint64_t v44 = v81;
        uint64_t v40 = v83;
      }
      else
      {

        swift_unknownObjectRelease();
        uint64_t v50 = v45;
      }

      uint64_t v12 = (uint64_t *)(v1 + 240);
      uint64_t v68 = *(void **)(v1 + 240);
      uint64_t v69 = *(void **)(v1 + 328);
      uint64_t v70 = *(void *)(v1 + 272);

      unint64_t v71 = *(void (**)(void))(v70 + 8);
      sub_100027C7C();
      sub_100027110();
      v71();
      sub_100027CF4();
      sub_100027110();
      v71();
      id v72 = v68;
LABEL_25:
      swift_errorRelease();
      goto LABEL_32;
    }
    uint64_t v51 = v3;
    id v52 = *(void **)(v1 + 320);
    id v53 = *(void **)(v1 + 328);
    uint64_t v54 = *(void **)(v1 + 312);
    uint64_t v55 = *(void *)(v1 + 272);

    swift_unknownObjectRelease();
    uint64_t v56 = *(void (**)(void))(v55 + 8);
    sub_100026EB4();
    v56();
    sub_100026EB4();
    v56();
    swift_errorRelease();
    *(void *)(v1 + 176) = v39;
    sub_100009C74(&qword_10003D458);
    uint64_t result = swift_dynamicCast();
    if ((result & 1) == 0) {
      return result;
    }
    id v10 = *(id *)(v1 + 168);
    sub_100028E80();
    if (qword_10003CA38 == -1)
    {
LABEL_19:
      if (sub_100027168())
      {
        id v58 = v10;
        sub_100026E9C();
        uint64_t v59 = (void *)sub_100026FB0();
        id v60 = sub_1000271BC(5.7779e-34);
        sub_100028F10();
        *uint64_t v59 = v58;

        sub_100027004((void *)&_mh_execute_header, v61, v62, "Failed to update current configuration with override configuration: %@");
        sub_100009C74(&qword_10003D468);
        sub_100027228();
        sub_100026E6C();
        sub_100026E6C();
      }
      uint64_t v12 = (uint64_t *)(v1 + 240);
      uint64_t v63 = *(void **)(v1 + 240);

      id v64 = v63;
      goto LABEL_25;
    }
LABEL_37:
    swift_once();
    goto LABEL_19;
  }
  uint64_t v35 = *(void **)(v1 + 320);
  uint64_t v34 = *(void **)(v1 + 328);
  os_log_type_t v36 = *(void **)(v1 + 312);
  id v37 = v33;

  swift_unknownObjectRelease();
  sub_100026F40();
  v27();
  sub_100026F40();
  v27();
LABEL_32:
  uint64_t v78 = *v12;
  sub_1000275CC();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v79 = *(uint64_t (**)(uint64_t))(v1 + 8);
  return v79(v78);
}

void sub_10001B020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_10002731C();
  sub_1000278CC();
  id v17 = *(void **)(v16 + 328);
  uint64_t v19 = *(void **)(v16 + 312);
  uint64_t v18 = *(void **)(v16 + 320);
  swift_willThrow();

  sub_100027110();
  v20();
  *(void *)(v16 + 176) = *(void *)(v16 + 336);
  sub_100009C74(&qword_10003D458);
  sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
  if (sub_100026F98())
  {
    id v21 = *(void **)(v16 + 168);
    sub_100028E80();
    if (qword_10003CA38 != -1) {
      swift_once();
    }
    if (sub_100027168())
    {
      a10 = v16 + 152;
      id v22 = v21;
      a11 = v21;
      sub_100026E9C();
      id v23 = (void *)sub_100026FB0();
      sub_1000271BC(5.7779e-34);
      sub_1000271E0();
      *id v23 = v22;

      sub_100027004((void *)&_mh_execute_header, v24, v25, "Failed to update current configuration with override configuration: %@");
      sub_100009C74(&qword_10003D468);
      sub_100027228();
      sub_100026E6C();
      sub_100026E6C();
    }
    uint64_t v26 = *(void **)(v16 + 240);

    id v27 = v26;
    swift_errorRelease();
    sub_1000275CC();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_100026EC0();
    v30(v28, v29, v30, v31, v32, v33, v34, v35, a9, a10, a11, a12, a13, a14, a15, a16);
  }
  else
  {
    sub_100026EC0();
  }
}

uint64_t sub_10001B264(uint64_t result, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v6 = *(void *)(result + 32);
  if (a6)
  {
    id v7 = a6;
    return sub_10001B324();
  }
  if (!a3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (!a4)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!a5)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  swift_unknownObjectRetain();
  return sub_10001B384(v6, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, a5);
}

uint64_t sub_10001B324()
{
  sub_100027C58();
  sub_100009C74(&qword_10003D458);
  uint64_t v2 = swift_allocError();
  void *v3 = v0;
  return _swift_continuation_throwingResumeWithError(v1, v2);
}

uint64_t sub_10001B384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 64) + 40);
  void *v5 = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  return _swift_continuation_throwingResume();
}

uint64_t sub_10001B3A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 64) + 40);
  void *v3 = a2;
  v3[1] = a3;
  return _swift_continuation_throwingResume();
}

uint64_t sub_10001B3C8()
{
  sub_10000C4AC();
  v0[22] = v1;
  v0[23] = v2;
  uint64_t v3 = sub_100028B50();
  v0[24] = v3;
  sub_1000270E4(v3);
  v0[25] = v4;
  v0[26] = swift_task_alloc();
  v0[27] = swift_task_alloc();
  v0[28] = swift_task_alloc();
  sub_1000274B0();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_10001B4A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_10002731C();
  sub_1000278CC();
  uint64_t v17 = v16[27];
  uint64_t v19 = v16[25];
  uint64_t v18 = v16[26];
  uint64_t v36 = v16[24];
  uint64_t v20 = (void *)v16[22];
  uint64_t v37 = v16[23];
  id v21 = [self mutableConfiguration];
  v16[29] = v21;
  id v22 = [v21 assetDirectory];
  sub_100028B20();

  id v23 = [v20 assetDirectory];
  sub_100028B20();

  v16[30] = [objc_allocWithZone((Class)PFPosterConfiguration) initWithConfigurationType:0];
  sub_10000BAE8(0, (unint64_t *)&unk_10003D8A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v17, v36);
  v16[31] = sub_10001C06C(v18, v37);
  v16[2] = v16;
  v16[7] = v16 + 15;
  v16[3] = sub_10001B6BC;
  uint64_t v24 = swift_continuation_init();
  v16[10] = _NSConcreteStackBlock;
  v16[11] = 0x40000000;
  v16[12] = sub_10001C110;
  v16[13] = &unk_1000350D0;
  v16[14] = v24;
  uint64_t v25 = (void *)sub_100027CE8();
  [v25 v26];
  sub_100026EC0();
  return _swift_continuation_await(v27, v28, v29, v30, v31, v32, v33, v34, a9, v36, v37, v16 + 15, a13, a14, a15, a16);
}

uint64_t sub_10001B6BC()
{
  sub_10000C4AC();
  sub_10000C1AC();
  sub_100027054();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 256) = *(void *)(v3 + 48);
  sub_1000274B0();
  return _swift_task_switch(v4, v5, v6);
}

void sub_10001B7C8()
{
  uint64_t v1 = *(void **)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 128);
  id v3 = [objc_allocWithZone((Class)PFPosterEditConfiguration) init];
  id v4 = [v1 portraitLayerStack];
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(objc_msgSend(v5, "layout"), "normalizedVisibleFrame");
    sub_100027AEC();
    sub_1000274BC(v6, v7, v8, v9, v10, v11, v12, v13);
    sub_100027B0C();
  }
  sub_1000277E0((uint64_t)v4, "setNormalizedVisibleFrame:");
  id v14 = [v1 landscapeLayerStack];
  if (v14)
  {
    id v15 = v14;
    objc_msgSend(objc_msgSend(v15, "layout"), "normalizedVisibleFrame");
    sub_100027AEC();
    sub_1000274BC(v16, v17, v18, v19, v20, v21, v22, v23);
    sub_100027B0C();
  }
  uint64_t v24 = *(void **)(v0 + 240);
  sub_1000277E0((uint64_t)v14, "setNormalizedLandscapeVisibleFrame:");
  unint64_t v71 = v3;
  [v24 setEditConfiguration:v3];
  sub_100009C74(&qword_10003D450);
  uint64_t v25 = sub_100027BA4();
  *(_OWORD *)(v25 + 16) = xmmword_10002A560;
  id v26 = objc_allocWithZone((Class)PFPosterMedia);
  *(void *)(v25 + 32) = sub_10001D8DC(0, 0);
  sub_100028D80();
  sub_1000255D8(v25, v24, &qword_10003D8C0, (uint64_t)PFPosterMedia_ptr, (SEL *)&selRef_setMedia_);
  unint64_t v27 = sub_1000256B8(v24);
  if (!v27)
  {
    id v52 = *(void **)(v0 + 240);
    id v53 = *(void **)(v0 + 248);
LABEL_24:

    uint64_t v65 = *(void *)(v0 + 224);
    uint64_t v67 = *(void *)(v0 + 192);
    uint64_t v66 = *(void *)(v0 + 200);

    swift_unknownObjectRelease();
    uint64_t v68 = *(void (**)(void))(v66 + 8);
    sub_100026EB4();
    v68();
    ((void (*)(uint64_t, uint64_t))v68)(v65, v67);
    goto LABEL_25;
  }
  unint64_t v28 = v27;
  uint64_t v29 = v27 & 0xFFFFFFFFFFFFFF8;
  if (!(v27 >> 62))
  {
    if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
  if (!sub_1000290A0())
  {
LABEL_23:
    id v52 = *(void **)(v0 + 240);
    id v53 = *(void **)(v0 + 248);
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
LABEL_8:
  if ((v28 & 0xC000000000000001) != 0)
  {
    id v30 = (id)sub_100028FE0();
  }
  else
  {
    if (!*(void *)(v29 + 16))
    {
      __break(1u);
      goto LABEL_30;
    }
    id v30 = *(id *)(v28 + 32);
  }
  uint64_t v31 = v30;
  uint64_t v32 = *(void *)(v0 + 200);
  swift_bridgeObjectRelease();
  id v33 = [v31 subpath];

  sub_100028CE0();
  uint64_t v34 = self;
  swift_unknownObjectRetain();
  id v35 = v1;
  sub_100028B10();
  swift_bridgeObjectRelease();
  sub_100028AF0(v36);
  id v38 = v37;
  uint64_t v39 = *(void (**)(void))(v32 + 8);
  sub_100026F8C();
  v39();
  *(void *)(v0 + 160) = 0;
  unsigned int v40 = [v34 saveSegmentationItem:v2 compoundLayerStack:v35 style:0 toWallpaperURL:v38 error:v0 + 160];

  swift_unknownObjectRelease();
  id v41 = *(id *)(v0 + 160);
  if (v40)
  {
    sub_100028AF0(v42);
    uint64_t v44 = v43;
    *(void *)(v0 + 168) = 0;
    uint64_t v45 = (void *)sub_100027CA0();
    unsigned int v47 = [v45 v46];

    uint64_t v48 = *(void **)(v0 + 168);
    if (v47)
    {
      uint64_t v50 = *(void **)(v0 + 240);
      id v49 = *(void **)(v0 + 248);
      id v51 = v48;

      swift_unknownObjectRelease();
      sub_100027C7C();
      sub_100026F8C();
      v39();
      sub_100027CF4();
      sub_100026F8C();
      v39();
      goto LABEL_25;
    }
    id v41 = v48;
  }
  uint64_t v54 = v41;
  uint64_t v55 = sub_100028AC0();

  swift_willThrow();
  swift_unknownObjectRelease();

  *(void *)(v0 + 136) = v55;
  sub_100009C74(&qword_10003D458);
  sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
  if (swift_dynamicCast())
  {
    uint64_t v25 = *(void *)(v0 + 144);
    sub_100028E80();
    if (qword_10003CA38 == -1)
    {
LABEL_18:
      if (sub_100027168())
      {
        id v56 = (id)v25;
        uint64_t v57 = (_DWORD *)sub_100026E9C();
        uint64_t v72 = v25;
        id v58 = (void *)sub_100026FB0();
        *uint64_t v57 = 138412290;
        *(void *)(v0 + 152) = v56;
        id v59 = v56;
        sub_100028F10();
        *id v58 = v56;

        sub_100027004((void *)&_mh_execute_header, v60, v61, "Failed to migrate legacy wallpaper: %@");
        sub_100009C74(&qword_10003D468);
        sub_100027228();
        uint64_t v25 = v72;
        sub_100026E6C();
        sub_100026E6C();
      }
      uint64_t v62 = *(void **)(v0 + 240);
      uint64_t v63 = *(void *)(v0 + 200);

      id v64 = *(void (**)(void))(v63 + 8);
      sub_1000273C4();
      v64();
      sub_1000273C4();
      v64();
      swift_errorRelease();
LABEL_25:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_100027C00();
      __asm { BRAA            X2, X16 }
    }
LABEL_30:
    swift_once();
    goto LABEL_18;
  }
  sub_100027C00();
}

void sub_10001BE3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_10002731C();
  sub_1000278CC();
  swift_willThrow();
  *(void *)(v16 + 136) = *(void *)(v16 + 256);
  sub_100009C74(&qword_10003D458);
  sub_10000BAE8(0, (unint64_t *)&unk_10003D8B0);
  if (sub_100026F98())
  {
    __n128 v17 = *(void **)(v16 + 144);
    sub_100028E80();
    if (qword_10003CA38 != -1) {
      swift_once();
    }
    if (sub_100027168())
    {
      a10 = v16 + 152;
      id v18 = v17;
      sub_100026E9C();
      a11 = v17;
      __n128 v19 = (void *)sub_100026FB0();
      sub_1000271BC(5.7779e-34);
      sub_1000271E0();
      *__n128 v19 = v18;

      sub_100027004((void *)&_mh_execute_header, v20, v21, "Failed to migrate legacy wallpaper: %@");
      sub_100009C74(&qword_10003D468);
      sub_100027228();
      __n128 v17 = a11;
      sub_100026E6C();
      sub_100026E6C();
    }
    __n128 v22 = *(void **)(v16 + 240);
    uint64_t v23 = *(void *)(v16 + 200);

    uint64_t v24 = *(void (**)(void))(v23 + 8);
    sub_1000273C4();
    v24();
    sub_1000273C4();
    v24();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_100026EC0();
    v27(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12, a13, a14, a15, a16);
  }
  else
  {
    sub_100026EC0();
  }
}

id sub_10001C06C(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_100028AF0(v5);
  __n128 v7 = v6;
  id v8 = [v4 initWithAssetDirectory:v6 configurationType:a2];

  uint64_t v9 = sub_100028B50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  return v8;
}

uint64_t sub_10001C110(uint64_t result, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(result + 32);
  if (a4)
  {
    id v5 = a4;
    return sub_10001B324();
  }
  if (!a2)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (!a3)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  id v7 = a2;
  swift_unknownObjectRetain();
  return sub_10001B3A8(v4, (uint64_t)v7, a3);
}

uint64_t sub_10001C19C(uint64_t a1, uint64_t a2, Swift::Int a3)
{
  unsigned int v4 = [self deviceSupportsLandscapeConfiguration];
  sub_100009C74((uint64_t *)&unk_10003D890);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002AA90;
  __n128 v6 = (void *)PISegmentationOptionClassification;
  *(void *)(inited + 32) = PISegmentationOptionClassification;
  uint64_t result = sub_10000BAE8(0, &qword_10003D888);
  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    if (v4) {
      Swift::Int v8 = 136;
    }
    else {
      Swift::Int v8 = 8;
    }
    id v9 = v6;
    v10.super.super.Class isa = sub_100028EE0(a3).super.super.isa;
    __n128 v11 = (void *)PISegmentationOptionLayerStackOptions;
    *(NSNumber *)(inited + 40) = v10;
    *(void *)(inited + 48) = v11;
    id v12 = v11;
    v13.super.super.Class isa = sub_100028EE0(v8).super.super.isa;
    id v14 = (void *)PISegmentationOptionDisableRendering;
    *(NSNumber *)(inited + 56) = v13;
    *(void *)(inited + 64) = v14;
    id v15 = v14;
    *(NSNumber *)(inited + 72) = sub_100028ED0(1);
    type metadata accessor for PISegmentationOption(0);
    sub_10002654C(&qword_10003D4F0, type metadata accessor for PISegmentationOption);
    uint64_t v16 = sub_100028C90();
    uint64_t v17 = sub_100027AAC();
    sub_10001C32C(v17, v18, v16, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_10001C32C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_1000270A8();
  a19 = v21;
  a20 = v22;
  uint64_t v88 = v20;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  sub_100028B50();
  sub_10000C214();
  uint64_t v97 = v27;
  uint64_t v98 = v28;
  __chkstk_darwin(v27);
  sub_100027C44();
  uint64_t v89 = v29;
  sub_100026F34();
  __chkstk_darwin(v30);
  BOOL v91 = (char *)&v88 - v31;
  sub_100028C10();
  sub_10000C214();
  uint64_t v94 = v33;
  uint64_t v95 = v32;
  __chkstk_darwin(v32);
  sub_100027268();
  uint64_t v36 = v35 - v34;
  uint64_t v37 = dispatch_group_create();
  dispatch_group_enter(v37);
  if (qword_10003CA38 != -1) {
    swift_once();
  }
  id v38 = (id)qword_10003DB88;
  sub_100028C00();
  sub_100028EC0();
  sub_100028BF0();
  uint64_t v39 = swift_allocObject();
  uint64_t v99 = v36;
  uint64_t v40 = v39;
  *(void *)(v39 + 16) = 0;
  id v41 = (void *)(v39 + 16);
  id v42 = objc_allocWithZone((Class)PHWallpaperAsset);
  uint64_t v90 = v26;
  id v43 = [v42 initWithPhotoAsset:v26];
  uint64_t v44 = self;
  id v45 = v43;
  SEL v46 = v24;
  sub_100028AF0(v47);
  uint64_t v48 = sub_100027CB8();
  sub_100012D14(v48);
  id v96 = v24;
  v49.super.Class isa = sub_100028C70().super.isa;
  swift_bridgeObjectRelease();
  sub_100027754();
  uint64_t v50 = swift_allocObject();
  *(void *)(v50 + 16) = v40;
  *(void *)(v50 + 24) = v37;
  v101[4] = sub_100026514;
  uint64_t v102 = v50;
  v101[0] = _NSConcreteStackBlock;
  v101[1] = 1107296256;
  v101[2] = sub_10001CB24;
  v101[3] = &unk_1000350A8;
  id v51 = _Block_copy(v101);
  os_log_type_t v52 = v102;
  uint64_t v93 = v40;
  swift_retain();
  id v53 = v37;
  swift_release();
  [v44 exportWallpaperForAsset:v45 toURL:v46 options:v49.super.isa completion:v51];
  _Block_release(v51);
  id v92 = v45;

  sub_100028EA0();
  sub_100028EB0();
  uint64_t v54 = qword_10003DB88;
  sub_100028BF0();
  swift_beginAccess();
  if (*v41)
  {
    swift_errorRetain();
    sub_100028E80();
    sub_10002792C();
    uint64_t v55 = v91;
    sub_100027134();
    v56();
    if (os_log_type_enabled(v54, v52))
    {
      swift_errorRetain();
      uint64_t v57 = v90;
      LODWORD(v89) = v52;
      id v58 = v57;
      swift_errorRetain();
      id v59 = v58;
      id v96 = v53;
      uint64_t v60 = v59;
      sub_100026E84();
      uint64_t v88 = sub_100027640();
      a10 = (char *)v88;
      *(_DWORD *)v49.super.Class isa = 136315650;
      id v61 = [v60 localIdentifier];
      uint64_t v62 = sub_100028CE0();
      uint64_t v90 = v54;
      uint64_t v63 = v62;
      unint64_t v65 = v64;

      uint64_t v100 = sub_10001EC50(v63, v65, (uint64_t *)&a10);
      sub_100028F10();

      swift_bridgeObjectRelease();
      *((_WORD *)v49.super.isa + 6) = 2080;
      uint64_t v66 = sub_100028B40();
      uint64_t v68 = sub_10001EC50(v66, v67, (uint64_t *)&a10);
      sub_1000276A4(v68);
      sub_100028F10();
      swift_bridgeObjectRelease();
      sub_10002706C();
      v69();
      id v53 = v96;
      *((_WORD *)v49.super.isa + 11) = 2080;
      swift_getErrorValue();
      uint64_t v70 = sub_100029160();
      uint64_t v72 = sub_10001EC50(v70, v71, (uint64_t *)&a10);
      sub_1000276A4(v72);
      sub_100028F10();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v90, (os_log_type_t)v89, "Failed to export asset %s to directory at %s, error:%s)", (uint8_t *)v49.super.isa, 0x20u);
      swift_arrayDestroy();
      sub_100026E6C();
      sub_100026E6C();
    }
    else
    {
      ((void (*)(char *, void *))v53[1].isa)(v55, v41);
    }
    id v84 = v92;
    swift_willThrow();

    sub_100026F40();
    v85();
    swift_release();
  }
  else
  {
    sub_100028E60();
    sub_10002792C();
    sub_100027134();
    v73();
    if (os_log_type_enabled(v54, v52))
    {
      id v74 = v90;
      id v96 = v53;
      uint64_t v75 = v74;
      uint64_t v76 = sub_100026EDC();
      BOOL v91 = (char *)sub_1000270CC();
      a10 = v91;
      *(_DWORD *)uint64_t v76 = 136315394;
      uint64_t v90 = v54;
      id v77 = [v75 localIdentifier];
      uint64_t v78 = sub_100028CE0();
      unint64_t v80 = v79;

      uint64_t v100 = sub_10001EC50(v78, v80, (uint64_t *)&a10);
      sub_100028F10();

      swift_bridgeObjectRelease();
      *(_WORD *)(v76 + 12) = 2080;
      uint64_t v81 = sub_100028B40();
      uint64_t v100 = sub_10001EC50(v81, v82, (uint64_t *)&a10);
      sub_100028F10();
      swift_bridgeObjectRelease();
      sub_100027110();
      v83();
      _os_log_impl((void *)&_mh_execute_header, v90, v52, "Exported asset %s to directory %s", (uint8_t *)v76, 0x16u);
      sub_100027C64();
      sub_100026E6C();
      sub_100026E6C();
    }
    else
    {

      sub_100026F40();
      v86();
    }
    sub_10002706C();
    v87();
    swift_release();
  }
  sub_100027078();
}

void sub_10001CAB8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(void *)(a2 + 16) = a1;
  swift_errorRetain();
  swift_errorRelease();
  dispatch_group_leave(a3);
}

void sub_10001CB24(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10001CB90()
{
  sub_100027184();
  uint64_t v3 = v2;
  sub_100028B50();
  sub_10000C214();
  __chkstk_darwin(v4);
  sub_100027268();
  if (v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    sub_10001FE2C();
    sub_10002745C();
  }
  else
  {
    uint64_t v0 = (void *)(v3 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  uint64_t v69 = v0;
  sub_10001FB74((uint64_t *)&v69);
  unint64_t v5 = (unint64_t)v69;
  uint64_t v69 = _swiftEmptyArrayStorage;
  if ((v5 & 0x8000000000000000) != 0 || (v5 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1000290A0();
    swift_release();
    if (v6) {
      goto LABEL_7;
    }
LABEL_68:
    swift_release();
    uint64_t v60 = _swiftEmptyArrayStorage;
    goto LABEL_69;
  }
  uint64_t v6 = *(void *)(v5 + 16);
  if (!v6) {
    goto LABEL_68;
  }
LABEL_7:
  uint64_t v68 = self;
  if (v6 < 1) {
    __break(1u);
  }
  uint64_t v7 = 0;
  unint64_t v67 = v5 & 0xC000000000000001;
  unint64_t v65 = (void *)v5;
  uint64_t v66 = v6;
  do
  {
    if (v67) {
      id v8 = (id)sub_100028FE0();
    }
    else {
      id v8 = *(id *)(v5 + 8 * v7 + 32);
    }
    id v9 = v8;
    id v10 = objc_msgSend(v8, "assetDirectory", v63);
    sub_100028B20();

    sub_100028AF0(v11);
    NSNumber v13 = v12;
    sub_10002706C();
    v14();
    v70[0] = 0;
    id v15 = [v68 loadFromURL:v13 error:v70];

    id v16 = v70[0];
    if (!v15)
    {
      uint64_t v18 = v16;
      sub_100028AC0();

      swift_willThrow();
      os_log_type_t v19 = sub_100028E80();
      if (qword_10003CA38 != -1) {
        swift_once();
      }
      uint64_t v20 = qword_10003DB88;
      os_log_type_t v21 = v19;
      if (os_log_type_enabled((os_log_t)qword_10003DB88, v19))
      {
        id v22 = v9;
        swift_errorRetain();
        id v23 = v22;
        swift_errorRetain();
        uint64_t v24 = sub_100026EDC();
        v70[0] = (id)sub_1000270CC();
        *(_DWORD *)uint64_t v24 = 136315394;
        id v25 = [v23 identifier];
        sub_100028CE0();
        unint64_t v27 = v26;

        uint64_t v28 = sub_100027BD4();
        *(void *)(v24 + 4) = sub_10001EC50(v28, v27, v29);

        swift_bridgeObjectRelease();
        *(_WORD *)(v24 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v30 = sub_100029160();
        *(void *)(v24 + 14) = sub_1000274E4(v30, v31);
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Failed to load descriptor model '%s': %s", (uint8_t *)v24, 0x16u);
        swift_arrayDestroy();
        sub_100026E6C();
        sub_100026E6C();
      }
      else
      {
      }
      swift_errorRelease();
      unint64_t v5 = (unint64_t)v65;
      goto LABEL_61;
    }
    if ([v15 descriptorType] == (id)1)
    {
      id v32 = [v15 styleCategory];
      if (!v32)
      {
        unsigned __int8 v48 = sub_100028E80();
        if (qword_10003CA38 != -1) {
          swift_once();
        }
        unint64_t v1 = v48;
        if (sub_100027CD0())
        {
          id v49 = v9;
          uint64_t v50 = sub_100026E9C();
          v70[0] = (id)sub_100026E84();
          *(_DWORD *)uint64_t v50 = 136315138;
          id v51 = [v49 identifier];
          sub_100028CE0();
          unint64_t v53 = v52;

          uint64_t v54 = sub_100027BD4();
          *(void *)(v50 + 4) = sub_10001EC50(v54, v53, v55);

          swift_bridgeObjectRelease();
          sub_100027A20();
          sub_100027534(v56, v57, v58, "Featured photo descriptor '%s' is missing a style category");
          sub_100027140();
          sub_100026E6C();
          unint64_t v5 = (unint64_t)v65;
          sub_100026E6C();
        }
        else
        {
        }
        goto LABEL_61;
      }
      uint64_t v33 = v32;
      sub_100028CE0();
      if (v1 == sub_100027388() && v13 == v34)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_58;
      }
      sub_100026F4C();
      sub_100027878();
      swift_bridgeObjectRelease();
      if ((v1 & 1) == 0)
      {
        sub_100028CE0();
        if (v1 == sub_100027388() && v13 == v36)
        {
LABEL_57:
          swift_bridgeObjectRelease_n();
          goto LABEL_58;
        }
        sub_100026F4C();
        sub_100027878();
        swift_bridgeObjectRelease();
        if ((v1 & 1) == 0)
        {
          sub_100028CE0();
          if (v1 != sub_100027388() || v13 != v38)
          {
            sub_100026F4C();
            sub_100027878();
            swift_bridgeObjectRelease();
            if ((v1 & 1) == 0)
            {
              sub_100028CE0();
              if (v1 == sub_100027388() && v13 == v40)
              {
                swift_bridgeObjectRelease_n();
              }
              else
              {
                sub_100026F4C();
                sub_100027878();
                swift_bridgeObjectRelease();
                if ((v1 & 1) == 0)
                {
                  os_log_type_t v42 = sub_100028E80();
                  if (qword_10003CA38 != -1) {
                    swift_once();
                  }
                  id v43 = qword_10003DB88;
                  if (os_log_type_enabled((os_log_t)qword_10003DB88, v42))
                  {
                    id v64 = v33;
                    uint64_t v44 = (_DWORD *)sub_100026E9C();
                    v70[0] = (id)sub_100026E84();
                    *uint64_t v44 = 136315138;
                    uint64_t v63 = v44 + 1;
                    uint64_t v45 = sub_100028CE0();
                    sub_10001EC50(v45, v46, (uint64_t *)v70);
                    sub_100028F10();
                    unint64_t v1 = (unint64_t)v64;

                    swift_bridgeObjectRelease();
                    sub_100027534((void *)&_mh_execute_header, v43, v42, "Unknown style category: %s");
                    sub_10002711C();
                    sub_100026E6C();
                    unint64_t v5 = (unint64_t)v65;
                    sub_100026E6C();
                  }
                }
              }
            }
            goto LABEL_58;
          }
          goto LABEL_57;
        }
      }
LABEL_58:
      id v59 = v9;
      sub_100028D30();
      sub_1000271AC();
      if (v47) {
        sub_100026EF4();
      }
      sub_1000278FC();
      sub_100028D80();

LABEL_61:
      uint64_t v6 = v66;
      goto LABEL_62;
    }
    id v17 = v9;
    sub_100028D30();
    sub_1000271AC();
    if (v47) {
      sub_100026EF4();
    }
    sub_1000278FC();
    sub_100028D80();

LABEL_62:
    ++v7;
  }
  while (v6 != v7);
  swift_release();
  uint64_t v60 = v69;
LABEL_69:
  sub_100009C74((uint64_t *)&unk_10003D838);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002AAA0;
  *(void *)(inited + 32) = v60;
  *(void *)(inited + 40) = _swiftEmptyArrayStorage;
  *(void *)(inited + 48) = _swiftEmptyArrayStorage;
  *(void *)(inited + 56) = _swiftEmptyArrayStorage;
  uint64_t v62 = sub_10001D520(inited);
  swift_setDeallocating();
  sub_10001E388();
  v70[0] = v62;
  sub_10000FDFC((unint64_t)_swiftEmptyArrayStorage);
  sub_100026F74();
}

void *sub_10001D520(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_10001F494(0, v2, 0);
    uint64_t v3 = (void *)(a1 + 32);
    int64_t v4 = v2;
    do
    {
      if (*v3 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v5 = sub_1000290A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v5 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      unint64_t v7 = _swiftEmptyArrayStorage[2];
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      if (v7 >= v6 >> 1) {
        sub_10001F494((void *)(v6 > 1), v7 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v7 + 1;
      _swiftEmptyArrayStorage[v7 + 4] = v5;
      ++v3;
      --v4;
    }
    while (v4);
  }
  uint64_t v8 = sub_10001D7A8(_swiftEmptyArrayStorage);
  char v10 = v9;
  uint64_t result = (void *)swift_bridgeObjectRelease();
  if (v10)
  {
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  if (v8 < 0) {
    goto LABEL_35;
  }
  if (!v8) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v12 = 0;
  while (!v2)
  {
LABEL_30:
    if (v12 + 1 == v8) {
      return _swiftEmptyArrayStorage;
    }
    ++v12;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = 0;
  while (1)
  {
    unint64_t v14 = *(void *)(a1 + 8 * v13 + 32);
    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = (void *)sub_1000290A0();
      id v15 = result;
    }
    else
    {
      id v15 = *(void **)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = (void *)swift_bridgeObjectRetain();
    }
    if (v12 < (uint64_t)v15) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_26:
    if (v2 == ++v13)
    {
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
  }
  if ((v14 & 0xC000000000000001) != 0)
  {
    sub_100028FE0();
    goto LABEL_22;
  }
  if ((unint64_t)v12 < *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v16 = *(id *)(v14 + 8 * v12 + 32);
LABEL_22:
    swift_bridgeObjectRelease();
    sub_100028D30();
    if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100028D90();
    }
    sub_100028DB0();
    sub_100028D80();
    goto LABEL_26;
  }
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_10001D7A8(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return 0;
  }
  uint64_t result = a1[4];
  uint64_t v4 = v1 - 1;
  if (v1 != 1)
  {
    uint64_t v5 = a1 + 5;
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if (result <= v7) {
        uint64_t result = v6;
      }
      --v4;
    }
    while (v4);
  }
  return result;
}

id sub_10001D7EC()
{
  *(void *)&v0[OBJC_IVAR____TtC20PhotosPosterProvider13PosterUpdater____lazy_storage___photoLibrary] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PosterUpdater();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10001D850()
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

id sub_10001D8DC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v2 = sub_100028CB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }
  uint64_t v3 = (void *)sub_100027CE8();
  id v5 = [v3 v4];

  return v5;
}

id sub_10001D93C(uint64_t a1)
{
  NSString v2 = v1;
  sub_100028AF0(__stack_chk_guard);
  id v5 = v4;
  id v14 = 0;
  id v6 = [v2 initWithContentsOfURL:v4 error:&v14];

  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = sub_100028B50();
    char v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    id v10 = v7;
    v9(a1, v8);
  }
  else
  {
    id v11 = v14;
    sub_100028AC0();

    swift_willThrow();
    uint64_t v12 = sub_100028B50();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

id sub_10001DA88(uint64_t a1, uint64_t a2, char a3)
{
  if (a2)
  {
    NSString v5 = sub_100028CB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  id v6 = [v3 initWithKey:v5 ascending:a3 & 1];

  return v6;
}

id sub_10001DAF4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  v14.super.Class isa = sub_100028D40().super.isa;
  swift_bridgeObjectRelease();
  if (a4)
  {
    NSString v15 = sub_100028CB0();
    swift_bridgeObjectRelease();
    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    v16.super.Class isa = 0;
    if (a7) {
      goto LABEL_4;
    }
LABEL_7:
    NSString v17 = 0;
    goto LABEL_8;
  }
  NSString v15 = 0;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  v16.super.Class isa = sub_100028E20().super.isa;
  swift_bridgeObjectRelease();
  if (!a7) {
    goto LABEL_7;
  }
LABEL_4:
  NSString v17 = sub_100028CB0();
  swift_bridgeObjectRelease();
LABEL_8:
  id v18 = [v8 initWithObjects:v14.super.isa photoLibrary:a2 fetchType:v15 fetchPropertySets:v16.super.isa identifier:v17 registerIfNeeded:a8 & 1];

  return v18;
}

id sub_10001DC28(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  NSString v5 = v4;
  uint64_t v10 = sub_100028B50();
  uint64_t v12 = 0;
  if (sub_10000B9D8(a3, 1, v10) != 1)
  {
    sub_100028AF0(v11);
    uint64_t v12 = v13;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a3, v10);
  }
  id v14 = [v5 initWithPhotoLibrary:a1 sourceConfiguration:a2 targetAssetDirectory:v12 overrideConfiguration:a4];

  swift_unknownObjectRelease();
  return v14;
}

uint64_t sub_10001DD0C(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  SEL v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *SEL v4 = v3;
  v4[1] = sub_10000C198;
  return v6();
}

uint64_t sub_10001DDD8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  NSString v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_10000C198;
  return v7();
}

uint64_t sub_10001DEA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100028E10();
  if (sub_10000B9D8(a1, 1, v6) == 1)
  {
    sub_1000269D0(a1, &qword_10003D9F8);
  }
  else
  {
    sub_100028E00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100028DC0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10001E014(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001E0F0;
  return v6(a1);
}

uint64_t sub_10001E0F0()
{
  sub_10000C4AC();
  sub_10000C1AC();
  uint64_t v1 = *v0;
  sub_10000C278();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000C3B4();
  return v3();
}

void *sub_10001E1B4(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = (void *)sub_100029080();
    __break(1u);
  }
  else if (a1)
  {
    uint64_t result = (void *)sub_100028DA0();
    result[2] = a1;
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001E250(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = (void *)sub_100029080();
    __break(1u);
  }
  else if (a1)
  {
    sub_100009C74(&qword_10003D970);
    uint64_t result = (void *)sub_100028DA0();
    result[2] = a1;
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_10001E2F4(uint64_t a1, unint64_t *a2)
{
  if (a1 < 0)
  {
    sub_1000270FC();
    sub_1000278F0();
    uint64_t result = sub_100029080();
    __break(1u);
  }
  else if (a1)
  {
    sub_10000BAE8(0, a2);
    sub_100027804();
    uint64_t result = sub_100028DA0();
    *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = a1;
  }
  else
  {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_10001E388()
{
  sub_100009C74(&qword_10003D848);
  swift_arrayDestroy();
  return _swift_deallocClassInstance(v0, 32, 7);
}

char *sub_10001E3EC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1000290C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_10001E480(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1000290C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

char *sub_10001E51C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1000290C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_10001E5B0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1000290C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_10001E644(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_1000270FC();
    sub_1000278F0();
    __src = (char *)sub_1000290C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_10001E6C8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v6 = a1 + 8 * a2 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_1000290C0();
    __break(1u);
  }
  else
  {
    uint64_t v7 = sub_100009C74(&qword_10003D960);
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
  }
  return _swift_arrayInitWithCopy(v8, v9, v10, v7);
}

uint64_t sub_10001E7C8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (BOOL v6 = a1 + 24 * a2 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_1000290C0();
    __break(1u);
  }
  else
  {
    uint64_t v7 = sub_100009C74(&qword_10003D970);
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
  }
  return _swift_arrayInitWithCopy(v8, v9, v10, v7);
}

uint64_t sub_10001E8CC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a2;
  if (a2 < 0 || ((v5 = a1, a3 + 32 * v4 > a1) ? (BOOL v6 = a1 + 32 * v4 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_1000290C0();
    __break(1u);
  }
  else
  {
    uint64_t v7 = (char *)&type metadata for Any + 8;
    uint64_t v8 = a3;
  }
  return _swift_arrayInitWithCopy(v8, v5, v4, v7);
}

uint64_t sub_10001E9B0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a2;
  if (a2 < 0 || ((v5 = a1, a3 + 16 * v4 > a1) ? (BOOL v6 = a1 + 16 * v4 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_1000290C0();
    __break(1u);
  }
  else
  {
    uint64_t v7 = &type metadata for String;
    uint64_t v8 = a3;
  }
  return _swift_arrayInitWithCopy(v8, v5, v4, v7);
}

uint64_t sub_10001EA90(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v7 = a1 + 8 * a2 > a3) : (BOOL v7 = 0), v7))
  {
    sub_1000270FC();
    sub_1000278F0();
    uint64_t v9 = sub_1000290C0();
    __break(1u);
  }
  else
  {
    uint64_t v8 = sub_10000BAE8(0, a4);
    uint64_t v9 = a3;
    unint64_t v10 = a1;
    uint64_t v11 = a2;
  }
  return _swift_arrayInitWithCopy(v9, v10, v11, v8);
}

void *sub_10001EB74(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[8 * a2] > __src ? (BOOL v3 = &__src[8 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000290C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 8 * a2);
  }
  return result;
}

uint64_t sub_10001EC50(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  sub_1000274B0();
  uint64_t v9 = sub_10001ED20(v6, v7, v8, 1, a1, a2);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    ObjectType = (void *)swift_getObjectType();
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_100025CD0((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v15[0] = a1;
    v15[1] = a2;
    uint64_t v13 = *a3;
    if (*a3)
    {
      sub_100025CD0((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000BA44((uint64_t)v15);
  return v10;
}

uint64_t sub_10001ED20(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10001EE78((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100028F20();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_10001EF50(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_100029000();
    if (!v8)
    {
      uint64_t result = sub_100029080();
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

void *sub_10001EE78(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000290C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_10001EF50(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10001EFE8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001F1C4(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001F1C4((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10001EFE8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_100028D20();
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
  unint64_t v3 = sub_10001F15C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100028FC0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_1000290C0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_100029080();
  __break(1u);
  return result;
}

void *sub_10001F15C(uint64_t a1, uint64_t a2)
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
  sub_100009C74(&qword_10003D860);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10001F1C4(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100009C74(&qword_10003D860);
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
    sub_10001F374(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001F29C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_10001F29C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000290C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_10001F374(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1000290C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void *sub_10001F404(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001F798(a1, a2, a3, *v3, &qword_10003D958, (void (*)(uint64_t, uint64_t, void *))sub_10001E3EC, (void (*)(uint64_t, uint64_t, void *))sub_10001E6C8);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_10001F454(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001F5D0(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_10001F474(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001F6B4(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

void *sub_10001F494(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001F798(a1, a2, a3, *v3, &qword_10003D868, (void (*)(uint64_t, uint64_t, void *))sub_10001E3EC, (void (*)(uint64_t, uint64_t, void *))sub_10001EB74);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_10001F4E4(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100009C74(&qword_10003D968);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10001E480(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001E7C8((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_10001F5D0(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100009C74(&qword_10003D948);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10001E51C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001E8CC((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_10001F6B4(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100009C74(&qword_10003D8D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10001E5B0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001E9B0((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void *sub_10001F798(void *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, void *), void (*a7)(uint64_t, uint64_t, void *))
{
  char v10 = (char)result;
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    int64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v12 = a2;
      }
    }
  }
  else
  {
    int64_t v12 = a2;
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
    sub_100009C74(a5);
    NSString v15 = (void *)swift_allocObject();
    size_t v16 = j__malloc_size(v15);
    v15[2] = v13;
    void v15[3] = 2 * ((uint64_t)(v16 - 32) / 8);
  }
  else
  {
    NSString v15 = &_swiftEmptyArrayStorage;
  }
  NSString v17 = v15 + 4;
  uint64_t v18 = a4 + 32;
  if (v10)
  {
    a6(v18, v13, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    a7(v18, v13, v17);
  }
  swift_release();
  return v15;
}

unint64_t sub_10001F890(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100028F50(*(void *)(v2 + 40));
  return sub_10001F94C(a1, v4);
}

unint64_t sub_10001F8D4(uint64_t a1, uint64_t a2)
{
  sub_1000291B0();
  sub_100028CF0();
  Swift::Int v4 = sub_1000291D0();
  return sub_10001FA14(a1, a2, v4);
}

unint64_t sub_10001F94C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100026BFC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100028F60();
      sub_10000BB24((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10001FA14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100029130() & 1) == 0)
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
      while (!v14 && (sub_100029130() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10001FAF8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10002648C(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1000205D8(v6);
  return sub_100029020();
}

uint64_t sub_10001FB74(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10002648C(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_100020E10(v6);
  return sub_100029020();
}

uint64_t sub_10001FBF0(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void *))
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = a3(v9);
  *a1 = v6;
  return result;
}

void *sub_10001FC74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100009C74(&qword_10003D968);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = j__malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  uint64_t v5 = sub_100025E60((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100026544();
  if (v5 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_10001FD58(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100009C74(&qword_10003D450);
  uint64_t v3 = (void *)swift_allocObject();
  j__malloc_size(v3);
  sub_1000275B4();
  v3[2] = v1;
  v3[3] = v4;
  uint64_t v5 = sub_10002607C(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_10002789C();
  sub_100026544();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_10001FE2C()
{
  sub_100027C58();
  if (v3 >> 62) {
    goto LABEL_8;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v4 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_100009C74(&qword_10003D450);
      uint64_t v4 = (void *)swift_allocObject();
      j__malloc_size(v4);
      sub_1000275B4();
      v4[2] = v2;
      v4[3] = v5;
    }
    swift_bridgeObjectRetain();
    v0(v4 + 4, v2, v1);
    uint64_t v0 = v6;
    swift_bridgeObjectRelease();
    if (v0 == (void (*)(void *, uint64_t, uint64_t))v2) {
      break;
    }
    __break(1u);
LABEL_8:
    sub_1000279C0();
    sub_1000290A0();
    sub_10002745C();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v4;
}

void *sub_10001FF04(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100009C74(&qword_10003D8D0);
  unint64_t v3 = (void *)swift_allocObject();
  size_t v4 = j__malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = sub_100026278((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100026544();
  if (v5 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

unint64_t sub_10001FFE8(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10002000C(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  uint64_t result = sub_1000290F0(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_114;
    }
    if (v3) {
      return sub_100021CC8(0, v3, 1, a1);
    }
  }
  else
  {
    uint64_t v5 = result;
    uint64_t result = (uint64_t)sub_10001E250(v3 / 2);
    unint64_t v80 = a1;
    uint64_t v81 = result;
    __dst = v6;
    uint64_t v83 = v3;
    if (v3 <= 0)
    {
      uint64_t v9 = &_swiftEmptyArrayStorage;
      unint64_t v24 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_79:
      if (v24 >= 2)
      {
        uint64_t v73 = *v80;
        do
        {
          unint64_t v74 = v24 - 2;
          if (v24 < 2) {
            goto LABEL_109;
          }
          if (!v73) {
            goto LABEL_123;
          }
          uint64_t v75 = (uint64_t)v9;
          uint64_t v76 = v9[2 * v74 + 4];
          uint64_t v77 = v9[2 * v24 + 3];
          uint64_t result = sub_1000223F8((char *)(v73 + 24 * v76), (char *)(v73 + 24 * v9[2 * v24 + 2]), v73 + 24 * v77, __dst);
          if (v1)
          {
            uint64_t result = swift_bridgeObjectRelease();
            Swift::Int v3 = v83;
            goto LABEL_75;
          }
          if (v77 < v76) {
            goto LABEL_110;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_100023084(v75);
            uint64_t v75 = result;
          }
          if (v74 >= *(void *)(v75 + 16)) {
            goto LABEL_111;
          }
          uint64_t v78 = (void *)(v75 + 32 + 16 * v74);
          *uint64_t v78 = v76;
          v78[1] = v77;
          unint64_t v79 = *(void *)(v75 + 16);
          if (v24 > v79) {
            goto LABEL_112;
          }
          uint64_t result = (uint64_t)memmove((void *)(v75 + 32 + 16 * (v24 - 1)), (const void *)(v75 + 32 + 16 * v24), 16 * (v79 - v24));
          uint64_t v9 = (void *)v75;
          *(void *)(v75 + 16) = v79 - 1;
          unint64_t v24 = v79 - 1;
        }
        while (v79 > 2);
      }
      uint64_t result = swift_bridgeObjectRelease();
      if (v83 < -1)
      {
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
LABEL_123:
        __break(1u);
      }
      else
      {
        *(void *)(v81 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = *a1;
      uint64_t v9 = &_swiftEmptyArrayStorage;
      uint64_t v82 = v5;
      uint64_t v85 = *a1;
      while (1)
      {
        char v10 = v9;
        uint64_t result = sub_10002221C(&v87, v8, v3, v7);
        if (v1) {
          break;
        }
        uint64_t v11 = v87;
        if (result)
        {
          if (v87 < v7) {
            goto LABEL_115;
          }
          if (v7 < v87)
          {
            uint64_t v12 = 24 * v87;
            uint64_t v13 = 24 * v7;
            uint64_t v14 = v87;
            uint64_t v15 = v7;
            do
            {
              if (v15 != --v14)
              {
                if (!v85) {
                  goto LABEL_122;
                }
                uint64_t v16 = v85 + v13;
                uint64_t v17 = v85 + v12;
                uint64_t v18 = *(void *)(v85 + v13);
                long long v19 = *(_OWORD *)(v85 + v13 + 8);
                long long v20 = *(_OWORD *)(v85 + v12 - 24);
                *(void *)(v16 + 16) = *(void *)(v85 + v12 - 8);
                *(_OWORD *)uint64_t v16 = v20;
                *(void *)(v17 - 24) = v18;
                *(_OWORD *)(v17 - 16) = v19;
              }
              ++v15;
              v12 -= 24;
              v13 += 24;
            }
            while (v15 < v14);
          }
        }
        if (v11 < v3)
        {
          if (__OFSUB__(v11, v7)) {
            goto LABEL_116;
          }
          if (v11 - v7 < v5)
          {
            if (__OFADD__(v7, v5)) {
              goto LABEL_118;
            }
            if (v7 + v5 >= v3) {
              uint64_t v21 = v3;
            }
            else {
              uint64_t v21 = v7 + v5;
            }
            if (v21 < v7)
            {
LABEL_119:
              __break(1u);
              goto LABEL_120;
            }
            uint64_t result = sub_100021CC8(v7, v21, v11, v80);
            uint64_t v11 = v21;
          }
        }
        if (v11 < v7) {
          goto LABEL_113;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if (result)
        {
          uint64_t v9 = v10;
        }
        else
        {
          uint64_t result = (uint64_t)sub_100022F8C(0, v10[2] + 1, 1, (char *)v10);
          uint64_t v9 = (void *)result;
        }
        unint64_t v23 = v9[2];
        unint64_t v22 = v9[3];
        unint64_t v24 = v23 + 1;
        uint64_t v8 = v85;
        uint64_t v84 = v11;
        if (v23 >= v22 >> 1)
        {
          uint64_t result = (uint64_t)sub_100022F8C((char *)(v22 > 1), v23 + 1, 1, (char *)v9);
          uint64_t v8 = v85;
          uint64_t v9 = (void *)result;
        }
        void v9[2] = v24;
        id v25 = (char *)(v9 + 4);
        unint64_t v26 = &v9[2 * v23 + 4];
        *unint64_t v26 = v7;
        v26[1] = v11;
        if (v23)
        {
          while (1)
          {
            unint64_t v27 = v24 - 1;
            if (v24 >= 4)
            {
              id v32 = &v25[16 * v24];
              uint64_t v33 = *((void *)v32 - 8);
              uint64_t v34 = *((void *)v32 - 7);
              BOOL v38 = __OFSUB__(v34, v33);
              uint64_t v35 = v34 - v33;
              if (v38) {
                goto LABEL_98;
              }
              uint64_t v37 = *((void *)v32 - 6);
              uint64_t v36 = *((void *)v32 - 5);
              BOOL v38 = __OFSUB__(v36, v37);
              uint64_t v30 = v36 - v37;
              char v31 = v38;
              if (v38) {
                goto LABEL_99;
              }
              unint64_t v39 = v24 - 2;
              uint64_t v40 = &v25[16 * v24 - 32];
              uint64_t v42 = *(void *)v40;
              uint64_t v41 = *((void *)v40 + 1);
              BOOL v38 = __OFSUB__(v41, v42);
              uint64_t v43 = v41 - v42;
              if (v38) {
                goto LABEL_100;
              }
              BOOL v38 = __OFADD__(v30, v43);
              uint64_t v44 = v30 + v43;
              if (v38) {
                goto LABEL_102;
              }
              if (v44 >= v35)
              {
                uint64_t v62 = &v25[16 * v27];
                uint64_t v64 = *(void *)v62;
                uint64_t v63 = *((void *)v62 + 1);
                BOOL v38 = __OFSUB__(v63, v64);
                uint64_t v65 = v63 - v64;
                if (v38) {
                  goto LABEL_108;
                }
                BOOL v55 = v30 < v65;
                goto LABEL_59;
              }
            }
            else
            {
              if (v24 != 3)
              {
                uint64_t v56 = v9[4];
                uint64_t v57 = v9[5];
                BOOL v38 = __OFSUB__(v57, v56);
                uint64_t v49 = v57 - v56;
                char v50 = v38;
                goto LABEL_53;
              }
              uint64_t v29 = v9[4];
              uint64_t v28 = v9[5];
              BOOL v38 = __OFSUB__(v28, v29);
              uint64_t v30 = v28 - v29;
              char v31 = v38;
            }
            if (v31) {
              goto LABEL_101;
            }
            unint64_t v39 = v24 - 2;
            uint64_t v45 = &v25[16 * v24 - 32];
            uint64_t v47 = *(void *)v45;
            uint64_t v46 = *((void *)v45 + 1);
            BOOL v48 = __OFSUB__(v46, v47);
            uint64_t v49 = v46 - v47;
            char v50 = v48;
            if (v48) {
              goto LABEL_103;
            }
            id v51 = &v25[16 * v27];
            uint64_t v53 = *(void *)v51;
            uint64_t v52 = *((void *)v51 + 1);
            BOOL v38 = __OFSUB__(v52, v53);
            uint64_t v54 = v52 - v53;
            if (v38) {
              goto LABEL_105;
            }
            if (__OFADD__(v49, v54)) {
              goto LABEL_107;
            }
            if (v49 + v54 >= v30)
            {
              BOOL v55 = v30 < v54;
LABEL_59:
              if (v55) {
                unint64_t v27 = v39;
              }
              goto LABEL_61;
            }
LABEL_53:
            if (v50) {
              goto LABEL_104;
            }
            os_log_type_t v58 = &v25[16 * v27];
            uint64_t v60 = *(void *)v58;
            uint64_t v59 = *((void *)v58 + 1);
            BOOL v38 = __OFSUB__(v59, v60);
            uint64_t v61 = v59 - v60;
            if (v38) {
              goto LABEL_106;
            }
            if (v61 < v49) {
              goto LABEL_69;
            }
LABEL_61:
            unint64_t v66 = v27 - 1;
            if (v27 - 1 >= v24)
            {
              __break(1u);
LABEL_95:
              __break(1u);
LABEL_96:
              __break(1u);
LABEL_97:
              __break(1u);
LABEL_98:
              __break(1u);
LABEL_99:
              __break(1u);
LABEL_100:
              __break(1u);
LABEL_101:
              __break(1u);
LABEL_102:
              __break(1u);
LABEL_103:
              __break(1u);
LABEL_104:
              __break(1u);
LABEL_105:
              __break(1u);
LABEL_106:
              __break(1u);
LABEL_107:
              __break(1u);
LABEL_108:
              __break(1u);
LABEL_109:
              __break(1u);
LABEL_110:
              __break(1u);
LABEL_111:
              __break(1u);
LABEL_112:
              __break(1u);
LABEL_113:
              __break(1u);
LABEL_114:
              __break(1u);
LABEL_115:
              __break(1u);
LABEL_116:
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
              goto LABEL_119;
            }
            if (!v8) {
              goto LABEL_121;
            }
            unint64_t v67 = v9;
            uint64_t v68 = &v25[16 * v66];
            uint64_t v69 = *(void *)v68;
            uint64_t v70 = &v25[16 * v27];
            uint64_t v71 = *((void *)v70 + 1);
            uint64_t result = sub_1000223F8((char *)(v8 + 24 * *(void *)v68), (char *)(v8 + 24 * *(void *)v70), v8 + 24 * v71, __dst);
            if (v71 < v69) {
              goto LABEL_95;
            }
            if (v27 > v67[2]) {
              goto LABEL_96;
            }
            *(void *)uint64_t v68 = v69;
            *(void *)&v25[16 * v66 + 8] = v71;
            unint64_t v72 = v67[2];
            if (v27 >= v72) {
              goto LABEL_97;
            }
            unint64_t v24 = v72 - 1;
            uint64_t result = (uint64_t)memmove(&v25[16 * v27], v70 + 16, 16 * (v72 - 1 - v27));
            uint64_t v9 = v67;
            v67[2] = v72 - 1;
            uint64_t v8 = v85;
            if (v72 <= 2) {
              goto LABEL_69;
            }
          }
        }
        unint64_t v24 = 1;
LABEL_69:
        Swift::Int v3 = v83;
        uint64_t v7 = v84;
        uint64_t v5 = v82;
        if (v84 >= v83) {
          goto LABEL_79;
        }
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_75:
      if (v3 < -1) {
        goto LABEL_117;
      }
      *(void *)(v81 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1000205D8(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  uint64_t result = sub_1000290F0(v3);
  if (result < v3)
  {
    uint64_t v5 = result;
    uint64_t result = sub_10001E2F4(v3 / 2, &qword_10003D930);
    uint64_t v113 = v3;
    __dst = v6;
    uint64_t v116 = result;
    unint64_t v109 = a1;
    if (v3 <= 0) {
      goto LABEL_115;
    }
    uint64_t v110 = v5;
    Swift::Int v7 = 0;
    uint64_t v8 = *a1;
    uint64_t v108 = *a1 - 8;
    uint64_t v9 = (char *)_swiftEmptyArrayStorage;
    uint64_t v115 = *a1;
    while (1)
    {
      Swift::Int v10 = v7++;
      Swift::Int v112 = v10;
      if (v7 < v3)
      {
        uint64_t v11 = *(void **)(v8 + 8 * v10);
        id v12 = *(id *)(v8 + 8 * v7);
        id v13 = v11;
        uint64_t result = sub_10002565C(v12, (SEL *)&selRef_uuid);
        if (!v14) {
          goto LABEL_164;
        }
        uint64_t v15 = result;
        uint64_t v16 = v14;
        uint64_t result = sub_10002565C(v13, (SEL *)&selRef_uuid);
        if (!v17)
        {
LABEL_165:
          __break(1u);
          return result;
        }
        if (v15 == result && v16 == v17) {
          int v19 = 0;
        }
        else {
          int v19 = sub_100029130();
        }

        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        Swift::Int v7 = v10 + 2;
        Swift::Int v3 = v113;
        uint64_t v8 = v115;
        if (v10 + 2 < v113)
        {
          while (1)
          {
            uint64_t v20 = v8 + 8 * v10;
            uint64_t v21 = *(void **)(v20 + 8);
            id v22 = *(id *)(v20 + 16);
            id v23 = v21;
            uint64_t result = sub_10002565C(v22, (SEL *)&selRef_uuid);
            if (!v24) {
              goto LABEL_160;
            }
            uint64_t v25 = result;
            uint64_t v26 = v24;
            uint64_t result = sub_10002565C(v23, (SEL *)&selRef_uuid);
            if (!v27) {
              break;
            }
            if (v25 == result && v26 == v27)
            {

              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
              if (v19)
              {
                Swift::Int v7 = v10 + 2;
                Swift::Int v10 = v112;
                Swift::Int v3 = v113;
                uint64_t v8 = v115;
                goto LABEL_28;
              }
            }
            else
            {
              int v29 = sub_100029130();

              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
              if ((v19 ^ v29))
              {
                Swift::Int v7 = v10 + 2;
                Swift::Int v3 = v113;
                uint64_t v8 = v115;
                goto LABEL_25;
              }
            }
            uint64_t v30 = v10 + 3;
            ++v10;
            Swift::Int v3 = v113;
            uint64_t v8 = v115;
            if (v30 >= v113)
            {
              Swift::Int v7 = v113;
              goto LABEL_25;
            }
          }
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
          goto LABEL_165;
        }
LABEL_25:
        Swift::Int v10 = v112;
        if (v19)
        {
LABEL_28:
          if (v7 < v10) {
            goto LABEL_152;
          }
          if (v10 < v7)
          {
            char v31 = (uint64_t *)(v108 + 8 * v7);
            Swift::Int v32 = v7;
            Swift::Int v33 = v10;
            uint64_t v34 = (uint64_t *)(v8 + 8 * v10);
            do
            {
              if (v33 != --v32)
              {
                if (!v8) {
                  goto LABEL_162;
                }
                uint64_t v35 = *v34;
                *uint64_t v34 = *v31;
                uint64_t *v31 = v35;
              }
              ++v33;
              --v31;
              ++v34;
            }
            while (v33 < v32);
          }
        }
      }
      if (v7 < v3)
      {
        if (__OFSUB__(v7, v10)) {
          goto LABEL_150;
        }
        if (v7 - v10 < v110)
        {
          if (__OFADD__(v10, v110)) {
            goto LABEL_153;
          }
          if (v10 + v110 >= v3) {
            Swift::Int v36 = v3;
          }
          else {
            Swift::Int v36 = v10 + v110;
          }
          if (v36 < v10)
          {
LABEL_154:
            __break(1u);
            goto LABEL_155;
          }
          if (v7 != v36)
          {
            uint64_t v107 = v9;
            uint64_t v37 = v108 + 8 * v7;
            Swift::Int v111 = v36;
            while (1)
            {
              BOOL v38 = *(void **)(v8 + 8 * v7);
              Swift::Int v39 = v10;
              uint64_t v40 = v37;
              while (1)
              {
                uint64_t v41 = *(void **)v40;
                id v42 = v38;
                id v43 = v41;
                uint64_t result = sub_10002565C(v42, (SEL *)&selRef_uuid);
                if (!v44) {
                  goto LABEL_156;
                }
                uint64_t v45 = result;
                uint64_t v46 = v44;
                uint64_t result = sub_10002565C(v43, (SEL *)&selRef_uuid);
                if (!v47)
                {
LABEL_157:
                  __break(1u);
LABEL_158:
                  __break(1u);
LABEL_159:
                  __break(1u);
LABEL_160:
                  __break(1u);
                  goto LABEL_161;
                }
                if (v45 == result && v46 == v47) {
                  break;
                }
                char v49 = sub_100029130();

                swift_bridgeObjectRelease();
                uint64_t result = swift_bridgeObjectRelease();
                if ((v49 & 1) == 0) {
                  goto LABEL_57;
                }
                uint64_t v8 = v115;
                if (!v115) {
                  goto LABEL_158;
                }
                char v50 = *(void **)v40;
                BOOL v38 = *(void **)(v40 + 8);
                *(void *)uint64_t v40 = v38;
                *(void *)(v40 + 8) = v50;
                v40 -= 8;
                if (v7 == ++v39) {
                  goto LABEL_58;
                }
              }

              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
LABEL_57:
              uint64_t v8 = v115;
LABEL_58:
              ++v7;
              v37 += 8;
              Swift::Int v10 = v112;
              if (v7 == v111)
              {
                Swift::Int v7 = v111;
                uint64_t v9 = v107;
                break;
              }
            }
          }
        }
      }
      if (v7 < v10) {
        goto LABEL_149;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_100022F8C(0, *((void *)v9 + 2) + 1, 1, v9);
        uint64_t v9 = (char *)result;
      }
      unint64_t v52 = *((void *)v9 + 2);
      unint64_t v51 = *((void *)v9 + 3);
      unint64_t v53 = v52 + 1;
      uint64_t v8 = v115;
      if (v52 >= v51 >> 1)
      {
        uint64_t result = (uint64_t)sub_100022F8C((char *)(v51 > 1), v52 + 1, 1, v9);
        uint64_t v8 = v115;
        uint64_t v9 = (char *)result;
      }
      *((void *)v9 + 2) = v53;
      Swift::Int v3 = (Swift::Int)(v9 + 32);
      uint64_t v54 = &v9[16 * v52 + 32];
      *(void *)uint64_t v54 = v10;
      *((void *)v54 + 1) = v7;
      if (v52) {
        break;
      }
      unint64_t v53 = 1;
LABEL_108:
      Swift::Int v3 = v113;
      if (v7 >= v113) {
        goto LABEL_116;
      }
    }
    while (1)
    {
      unint64_t v55 = v53 - 1;
      if (v53 >= 4)
      {
        unint64_t v60 = v3 + 16 * v53;
        uint64_t v61 = *(void *)(v60 - 64);
        uint64_t v62 = *(void *)(v60 - 56);
        BOOL v66 = __OFSUB__(v62, v61);
        uint64_t v63 = v62 - v61;
        if (v66) {
          goto LABEL_134;
        }
        uint64_t v65 = *(void *)(v60 - 48);
        uint64_t v64 = *(void *)(v60 - 40);
        BOOL v66 = __OFSUB__(v64, v65);
        uint64_t v58 = v64 - v65;
        char v59 = v66;
        if (v66) {
          goto LABEL_135;
        }
        unint64_t v67 = v53 - 2;
        uint64_t v68 = (uint64_t *)(v3 + 16 * (v53 - 2));
        uint64_t v70 = *v68;
        uint64_t v69 = v68[1];
        BOOL v66 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v66) {
          goto LABEL_136;
        }
        BOOL v66 = __OFADD__(v58, v71);
        uint64_t v72 = v58 + v71;
        if (v66) {
          goto LABEL_138;
        }
        if (v72 >= v63)
        {
          uint64_t v90 = (uint64_t *)(v3 + 16 * v55);
          uint64_t v92 = *v90;
          uint64_t v91 = v90[1];
          BOOL v66 = __OFSUB__(v91, v92);
          uint64_t v93 = v91 - v92;
          if (v66) {
            goto LABEL_144;
          }
          BOOL v83 = v58 < v93;
          goto LABEL_97;
        }
      }
      else
      {
        if (v53 != 3)
        {
          uint64_t v84 = *((void *)v9 + 4);
          uint64_t v85 = *((void *)v9 + 5);
          BOOL v66 = __OFSUB__(v85, v84);
          uint64_t v77 = v85 - v84;
          char v78 = v66;
          goto LABEL_91;
        }
        uint64_t v57 = *((void *)v9 + 4);
        uint64_t v56 = *((void *)v9 + 5);
        BOOL v66 = __OFSUB__(v56, v57);
        uint64_t v58 = v56 - v57;
        char v59 = v66;
      }
      if (v59) {
        goto LABEL_137;
      }
      unint64_t v67 = v53 - 2;
      uint64_t v73 = (uint64_t *)(v3 + 16 * (v53 - 2));
      uint64_t v75 = *v73;
      uint64_t v74 = v73[1];
      BOOL v76 = __OFSUB__(v74, v75);
      uint64_t v77 = v74 - v75;
      char v78 = v76;
      if (v76) {
        goto LABEL_139;
      }
      unint64_t v79 = (uint64_t *)(v3 + 16 * v55);
      uint64_t v81 = *v79;
      uint64_t v80 = v79[1];
      BOOL v66 = __OFSUB__(v80, v81);
      uint64_t v82 = v80 - v81;
      if (v66) {
        goto LABEL_141;
      }
      if (__OFADD__(v77, v82)) {
        goto LABEL_143;
      }
      if (v77 + v82 >= v58)
      {
        BOOL v83 = v58 < v82;
LABEL_97:
        if (v83) {
          unint64_t v55 = v67;
        }
        goto LABEL_99;
      }
LABEL_91:
      if (v78) {
        goto LABEL_140;
      }
      id v86 = (uint64_t *)(v3 + 16 * v55);
      uint64_t v88 = *v86;
      uint64_t v87 = v86[1];
      BOOL v66 = __OFSUB__(v87, v88);
      uint64_t v89 = v87 - v88;
      if (v66) {
        goto LABEL_142;
      }
      if (v89 < v77) {
        goto LABEL_108;
      }
LABEL_99:
      unint64_t v94 = v55 - 1;
      if (v55 - 1 >= v53)
      {
        __break(1u);
LABEL_131:
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
        goto LABEL_145;
      }
      if (!v8) {
        goto LABEL_159;
      }
      uint64_t v95 = v9;
      id v96 = (uint64_t *)(v3 + 16 * v94);
      uint64_t v97 = *v96;
      uint64_t v98 = (void *)(v3 + 16 * v55);
      uint64_t v99 = v98[1];
      uint64_t result = sub_100022778((char *)(v8 + 8 * *v96), (id *)(v8 + 8 * *v98), v8 + 8 * v99, __dst);
      if (v1)
      {
LABEL_113:
        uint64_t result = swift_bridgeObjectRelease();
        if (v113 >= -1) {
          goto LABEL_128;
        }
        __break(1u);
LABEL_115:
        uint64_t v9 = (char *)_swiftEmptyArrayStorage;
        unint64_t v53 = _swiftEmptyArrayStorage[2];
LABEL_116:
        if (v53 >= 2)
        {
          uint64_t v101 = *v109;
          while (1)
          {
            unint64_t v102 = v53 - 2;
            if (v53 < 2) {
              break;
            }
            if (!v101) {
              goto LABEL_163;
            }
            Swift::Int v3 = v53 - 1;
            uint64_t v103 = *(void *)&v9[16 * v102 + 32];
            uint64_t v104 = *(void *)&v9[16 * v53 + 24];
            uint64_t result = sub_100022778((char *)(v101 + 8 * v103), (id *)(v101 + 8 * *(void *)&v9[16 * v53 + 16]), v101 + 8 * v104, __dst);
            if (v1) {
              goto LABEL_113;
            }
            if (v104 < v103) {
              goto LABEL_146;
            }
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              uint64_t result = (uint64_t)sub_100023084((uint64_t)v9);
              uint64_t v9 = (char *)result;
            }
            if (v102 >= *((void *)v9 + 2)) {
              goto LABEL_147;
            }
            uint64_t v105 = &v9[16 * v102 + 32];
            *(void *)uint64_t v105 = v103;
            *((void *)v105 + 1) = v104;
            unint64_t v106 = *((void *)v9 + 2);
            if (v53 > v106) {
              goto LABEL_148;
            }
            uint64_t result = (uint64_t)memmove(&v9[16 * v3 + 32], &v9[16 * v53 + 32], 16 * (v106 - v53));
            *((void *)v9 + 2) = v106 - 1;
            unint64_t v53 = v106 - 1;
            Swift::Int v3 = v113;
            if (v106 <= 2) {
              goto LABEL_127;
            }
          }
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
LABEL_127:
        uint64_t result = swift_bridgeObjectRelease();
        if (v3 >= -1)
        {
LABEL_128:
          *(void *)((v116 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
          sub_100028D80();
          return swift_bridgeObjectRelease();
        }
LABEL_155:
        __break(1u);
LABEL_156:
        __break(1u);
        goto LABEL_157;
      }
      if (v99 < v97) {
        goto LABEL_131;
      }
      if (v55 > *((void *)v95 + 2)) {
        goto LABEL_132;
      }
      uint64_t *v96 = v97;
      *(void *)(v3 + 16 * v94 + 8) = v99;
      unint64_t v100 = *((void *)v95 + 2);
      if (v55 >= v100) {
        goto LABEL_133;
      }
      uint64_t v9 = v95;
      unint64_t v53 = v100 - 1;
      uint64_t result = (uint64_t)memmove((void *)(v3 + 16 * v55), v98 + 2, 16 * (v100 - 1 - v55));
      *((void *)v9 + 2) = v100 - 1;
      uint64_t v8 = v115;
      if (v100 <= 2) {
        goto LABEL_108;
      }
    }
  }
  if (v3 < 0) {
    goto LABEL_151;
  }
  if (v3) {
    return sub_100021E78(0, v3, 1, a1);
  }
  return result;
}

void sub_100020E10(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int v4 = sub_1000290F0(v3);
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        sub_100021FE8(0, v3, 1, a1);
      }
      return;
    }
    goto LABEL_147;
  }
  Swift::Int v5 = v4;
  sub_10001E2F4(v3 / 2, &qword_10003D858);
  uint64_t v129 = v6;
  uint64_t v127 = v3;
  uint64_t v123 = a1;
  if (v3 <= 0)
  {
    uint64_t v9 = (char *)_swiftEmptyArrayStorage;
    unint64_t v66 = _swiftEmptyArrayStorage[2];
LABEL_109:
    if (v66 < 2)
    {
LABEL_123:
      swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        sub_1000279E0();
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_152;
    }
    uint64_t v115 = *v123;
    while (1)
    {
      unint64_t v116 = v66 - 2;
      if (v66 < 2) {
        break;
      }
      if (!v115) {
        goto LABEL_156;
      }
      uint64_t v117 = *(void *)&v9[16 * v116 + 32];
      uint64_t v118 = *(void *)&v9[16 * v66 + 24];
      sub_100022AB4((char *)(v115 + 8 * v117), (id *)(v115 + 8 * *(void *)&v9[16 * v66 + 16]), v115 + 8 * v118, v129);
      if (v1) {
        goto LABEL_121;
      }
      if (v118 < v117) {
        goto LABEL_142;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = sub_100023084((uint64_t)v9);
      }
      if (v116 >= *((void *)v9 + 2)) {
        goto LABEL_143;
      }
      uint64_t v119 = &v9[16 * v116 + 32];
      *(void *)uint64_t v119 = v117;
      *((void *)v119 + 1) = v118;
      unint64_t v120 = *((void *)v9 + 2);
      if (v66 > v120) {
        goto LABEL_144;
      }
      memmove(&v9[16 * v66 + 16], &v9[16 * v66 + 32], 16 * (v120 - v66));
      *((void *)v9 + 2) = v120 - 1;
      unint64_t v66 = v120 - 1;
      Swift::Int v3 = v127;
      if (v120 <= 2) {
        goto LABEL_123;
      }
    }
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
LABEL_154:
    __break(1u);
LABEL_155:
    __break(1u);
LABEL_156:
    __break(1u);
    return;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v122 = *a1 - 8;
  uint64_t v9 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v124 = v5;
  uint64_t v133 = *a1;
  while (1)
  {
    Swift::Int v10 = v7;
    Swift::Int v11 = v7 + 1;
    Swift::Int v126 = v7;
    if (v7 + 1 < v3)
    {
      id v12 = v9;
      id v13 = *(void **)(v8 + 8 * v7);
      id v14 = *(id *)(v8 + 8 * v11);
      id v15 = v13;
      id v16 = [v14 identifier];
      uint64_t v17 = sub_100028CE0();
      uint64_t v19 = v18;

      id v20 = [v15 identifier];
      uint64_t v21 = sub_100028CE0();
      uint64_t v23 = v22;

      if (v17 == v21 && v19 == v23) {
        int v130 = 0;
      }
      else {
        int v130 = sub_100029130();
      }
      Swift::Int v3 = v127;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      Swift::Int v25 = v126;
      Swift::Int v11 = v126 + 2;
      uint64_t v8 = v133;
      if (v126 + 2 < v127)
      {
        while (1)
        {
          uint64_t v26 = v8 + 8 * v25;
          uint64_t v27 = *(void **)(v26 + 8);
          id v28 = *(id *)(v26 + 16);
          id v29 = v27;
          id v30 = [v28 identifier];
          uint64_t v31 = sub_100028CE0();
          uint64_t v33 = v32;

          id v34 = [v29 identifier];
          uint64_t v35 = sub_100028CE0();
          uint64_t v37 = v36;

          BOOL v38 = v31 == v35 && v33 == v37;
          int v39 = v38 ? 0 : sub_100029130();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          Swift::Int v3 = v127;
          if ((v130 ^ v39)) {
            break;
          }
          uint64_t v40 = v25 + 3;
          ++v25;
          uint64_t v8 = v133;
          if (v40 >= v127)
          {
            Swift::Int v11 = v127;
            goto LABEL_22;
          }
        }
        Swift::Int v11 = v25 + 2;
        uint64_t v8 = v133;
      }
LABEL_22:
      uint64_t v9 = v12;
      Swift::Int v5 = v124;
      if (v130)
      {
        Swift::Int v10 = v126;
        if (v11 < v126) {
          goto LABEL_149;
        }
        if (v126 < v11)
        {
          uint64_t v41 = (uint64_t *)(v122 + 8 * v11);
          Swift::Int v42 = v11;
          Swift::Int v43 = v126;
          uint64_t v44 = (uint64_t *)(v8 + 8 * v126);
          do
          {
            if (v43 != --v42)
            {
              if (!v8) {
                goto LABEL_155;
              }
              uint64_t v45 = *v44;
              *uint64_t v44 = *v41;
              *uint64_t v41 = v45;
            }
            ++v43;
            --v41;
            ++v44;
          }
          while (v43 < v42);
        }
      }
      else
      {
        Swift::Int v10 = v126;
      }
    }
    if (v11 < v3)
    {
      if (__OFSUB__(v11, v10)) {
        goto LABEL_146;
      }
      if (v11 - v10 < v5)
      {
        if (__OFADD__(v10, v5)) {
          goto LABEL_150;
        }
        if (v10 + v5 >= v3) {
          Swift::Int v46 = v3;
        }
        else {
          Swift::Int v46 = v10 + v5;
        }
        if (v46 < v10) {
          goto LABEL_151;
        }
        if (v11 != v46)
        {
          uint64_t v121 = v9;
          uint64_t v47 = v122 + 8 * v11;
          Swift::Int v125 = v46;
          do
          {
            BOOL v48 = *(void **)(v8 + 8 * v11);
            uint64_t v128 = v47;
            Swift::Int v131 = v11;
            while (1)
            {
              char v49 = *(void **)v47;
              id v50 = v48;
              id v51 = v49;
              id v52 = [v50 identifier];
              uint64_t v53 = sub_100028CE0();
              uint64_t v55 = v54;

              id v56 = [v51 identifier];
              uint64_t v57 = sub_100028CE0();
              uint64_t v59 = v58;

              if (v53 == v57 && v55 == v59) {
                break;
              }
              char v61 = sub_100029130();

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v61 & 1) == 0) {
                goto LABEL_52;
              }
              Swift::Int v62 = v131;
              uint64_t v8 = v133;
              if (!v133) {
                goto LABEL_153;
              }
              uint64_t v63 = *(void **)v47;
              BOOL v48 = *(void **)(v47 + 8);
              *(void *)uint64_t v47 = v48;
              *(void *)(v47 + 8) = v63;
              v47 -= 8;
              if (v131 == ++v10) {
                goto LABEL_53;
              }
            }

            swift_bridgeObjectRelease_n();
LABEL_52:
            Swift::Int v62 = v131;
            uint64_t v8 = v133;
LABEL_53:
            Swift::Int v11 = v62 + 1;
            uint64_t v47 = v128 + 8;
            Swift::Int v10 = v126;
          }
          while (v11 != v125);
          Swift::Int v11 = v125;
          uint64_t v9 = v121;
          Swift::Int v5 = v124;
        }
      }
    }
    if (v11 < v10) {
      goto LABEL_145;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v9 = sub_100022F8C(0, *((void *)v9 + 2) + 1, 1, v9);
    }
    unint64_t v65 = *((void *)v9 + 2);
    unint64_t v64 = *((void *)v9 + 3);
    unint64_t v66 = v65 + 1;
    uint64_t v8 = v133;
    if (v65 >= v64 >> 1)
    {
      uint64_t v114 = sub_100022F8C((char *)(v64 > 1), v65 + 1, 1, v9);
      uint64_t v8 = v133;
      uint64_t v9 = v114;
    }
    *((void *)v9 + 2) = v66;
    unint64_t v67 = v9 + 32;
    uint64_t v68 = &v9[16 * v65 + 32];
    *(void *)uint64_t v68 = v10;
    *((void *)v68 + 1) = v11;
    uint64_t v132 = v11;
    if (v65) {
      break;
    }
    unint64_t v66 = 1;
LABEL_103:
    Swift::Int v3 = v127;
    uint64_t v7 = v132;
    if (v132 >= v127) {
      goto LABEL_109;
    }
  }
  while (1)
  {
    unint64_t v69 = v66 - 1;
    if (v66 >= 4)
    {
      uint64_t v74 = &v67[16 * v66];
      uint64_t v75 = *((void *)v74 - 8);
      uint64_t v76 = *((void *)v74 - 7);
      BOOL v80 = __OFSUB__(v76, v75);
      uint64_t v77 = v76 - v75;
      if (v80) {
        goto LABEL_130;
      }
      uint64_t v79 = *((void *)v74 - 6);
      uint64_t v78 = *((void *)v74 - 5);
      BOOL v80 = __OFSUB__(v78, v79);
      uint64_t v72 = v78 - v79;
      char v73 = v80;
      if (v80) {
        goto LABEL_131;
      }
      unint64_t v81 = v66 - 2;
      uint64_t v82 = &v67[16 * v66 - 32];
      uint64_t v84 = *(void *)v82;
      uint64_t v83 = *((void *)v82 + 1);
      BOOL v80 = __OFSUB__(v83, v84);
      uint64_t v85 = v83 - v84;
      if (v80) {
        goto LABEL_132;
      }
      BOOL v80 = __OFADD__(v72, v85);
      uint64_t v86 = v72 + v85;
      if (v80) {
        goto LABEL_134;
      }
      if (v86 >= v77)
      {
        uint64_t v104 = &v67[16 * v69];
        uint64_t v106 = *(void *)v104;
        uint64_t v105 = *((void *)v104 + 1);
        BOOL v80 = __OFSUB__(v105, v106);
        uint64_t v107 = v105 - v106;
        if (v80) {
          goto LABEL_140;
        }
        BOOL v97 = v72 < v107;
        goto LABEL_92;
      }
    }
    else
    {
      if (v66 != 3)
      {
        uint64_t v98 = *((void *)v9 + 4);
        uint64_t v99 = *((void *)v9 + 5);
        BOOL v80 = __OFSUB__(v99, v98);
        uint64_t v91 = v99 - v98;
        char v92 = v80;
        goto LABEL_86;
      }
      uint64_t v71 = *((void *)v9 + 4);
      uint64_t v70 = *((void *)v9 + 5);
      BOOL v80 = __OFSUB__(v70, v71);
      uint64_t v72 = v70 - v71;
      char v73 = v80;
    }
    if (v73) {
      goto LABEL_133;
    }
    unint64_t v81 = v66 - 2;
    uint64_t v87 = &v67[16 * v66 - 32];
    uint64_t v89 = *(void *)v87;
    uint64_t v88 = *((void *)v87 + 1);
    BOOL v90 = __OFSUB__(v88, v89);
    uint64_t v91 = v88 - v89;
    char v92 = v90;
    if (v90) {
      goto LABEL_135;
    }
    uint64_t v93 = &v67[16 * v69];
    uint64_t v95 = *(void *)v93;
    uint64_t v94 = *((void *)v93 + 1);
    BOOL v80 = __OFSUB__(v94, v95);
    uint64_t v96 = v94 - v95;
    if (v80) {
      goto LABEL_137;
    }
    if (__OFADD__(v91, v96)) {
      goto LABEL_139;
    }
    if (v91 + v96 >= v72)
    {
      BOOL v97 = v72 < v96;
LABEL_92:
      if (v97) {
        unint64_t v69 = v81;
      }
      goto LABEL_94;
    }
LABEL_86:
    if (v92) {
      goto LABEL_136;
    }
    unint64_t v100 = &v67[16 * v69];
    uint64_t v102 = *(void *)v100;
    uint64_t v101 = *((void *)v100 + 1);
    BOOL v80 = __OFSUB__(v101, v102);
    uint64_t v103 = v101 - v102;
    if (v80) {
      goto LABEL_138;
    }
    if (v103 < v91) {
      goto LABEL_103;
    }
LABEL_94:
    unint64_t v108 = v69 - 1;
    if (v69 - 1 >= v66)
    {
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
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
      goto LABEL_141;
    }
    if (!v8) {
      goto LABEL_154;
    }
    unint64_t v109 = &v67[16 * v108];
    uint64_t v110 = *(void *)v109;
    Swift::Int v111 = &v67[16 * v69];
    uint64_t v112 = *((void *)v111 + 1);
    sub_100022AB4((char *)(v8 + 8 * *(void *)v109), (id *)(v8 + 8 * *(void *)v111), v8 + 8 * v112, v129);
    if (v1) {
      break;
    }
    if (v112 < v110) {
      goto LABEL_127;
    }
    if (v69 > *((void *)v9 + 2)) {
      goto LABEL_128;
    }
    *(void *)unint64_t v109 = v110;
    *(void *)&v67[16 * v108 + 8] = v112;
    unint64_t v113 = *((void *)v9 + 2);
    if (v69 >= v113) {
      goto LABEL_129;
    }
    unint64_t v66 = v113 - 1;
    memmove(&v67[16 * v69], v111 + 16, 16 * (v113 - 1 - v69));
    *((void *)v9 + 2) = v113 - 1;
    uint64_t v8 = v133;
    if (v113 <= 2) {
      goto LABEL_103;
    }
  }
LABEL_121:
  swift_bridgeObjectRelease();
  if (v127 < -1) {
    goto LABEL_148;
  }
  sub_1000279E0();
  swift_bridgeObjectRelease();
}

uint64_t sub_100021660(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  uint64_t result = sub_1000290F0(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_100022154(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_144;
  }
  uint64_t v5 = result;
  uint64_t result = (uint64_t)sub_10001E1B4(v3 / 2);
  uint64_t v95 = result;
  uint64_t v96 = v3;
  __dst = v6;
  uint64_t v93 = a1;
  if (v3 <= 0)
  {
    uint64_t v98 = (char *)_swiftEmptyArrayStorage;
    unint64_t v31 = _swiftEmptyArrayStorage[2];
LABEL_110:
    if (v31 < 2)
    {
LABEL_121:
      uint64_t result = swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        *(void *)(v95 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_149;
    }
    uint64_t v85 = *v93;
    while (1)
    {
      unint64_t v86 = v31 - 2;
      if (v31 < 2) {
        break;
      }
      if (!v85) {
        goto LABEL_153;
      }
      uint64_t v87 = v98;
      uint64_t v88 = *(void *)&v98[16 * v86 + 32];
      uint64_t v89 = *(void *)&v98[16 * v31 + 24];
      uint64_t result = sub_100022DE4((char *)(v85 + 16 * v88), (char *)(v85 + 16 * *(void *)&v98[16 * v31 + 16]), v85 + 16 * v89, __dst);
      if (v1) {
        goto LABEL_106;
      }
      if (v89 < v88) {
        goto LABEL_139;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_100023084((uint64_t)v98);
        uint64_t v87 = (char *)result;
      }
      if (v86 >= *((void *)v87 + 2)) {
        goto LABEL_140;
      }
      BOOL v90 = &v87[16 * v86 + 32];
      *(void *)BOOL v90 = v88;
      *((void *)v90 + 1) = v89;
      unint64_t v91 = *((void *)v87 + 2);
      if (v31 > v91) {
        goto LABEL_141;
      }
      uint64_t result = (uint64_t)memmove(&v87[16 * v31 + 16], &v87[16 * v31 + 32], 16 * (v91 - v31));
      uint64_t v98 = v87;
      *((void *)v87 + 2) = v91 - 1;
      unint64_t v31 = v91 - 1;
      Swift::Int v3 = v96;
      if (v91 <= 2) {
        goto LABEL_121;
      }
    }
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
    return result;
  }
  uint64_t v94 = v5;
  Swift::Int v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v92 = *a1 + 8;
  uint64_t v98 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    Swift::Int v9 = v7++;
    if (v7 >= v3) {
      goto LABEL_32;
    }
    Swift::Int v10 = (uint64_t *)(v8 + 16 * v7);
    uint64_t result = *v10;
    uint64_t v11 = v10[1];
    id v12 = (void *)(v8 + 16 * v9);
    if (result == *v12 && v11 == v12[1])
    {
      Swift::Int v15 = v9 + 2;
      if (v9 + 2 >= v3) {
        goto LABEL_31;
      }
      int v14 = 0;
LABEL_13:
      id v16 = (void *)(v92 + 16 * v15);
      do
      {
        uint64_t result = *(v16 - 1);
        uint64_t v17 = (void *)(v8 + 16 * v7);
        if (result == *v17 && *v16 == v17[1])
        {
          if (v14) {
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t result = sub_100029130();
          if ((v14 ^ result)) {
            goto LABEL_23;
          }
        }
        v16 += 2;
        Swift::Int v19 = v15 + 1;
        Swift::Int v7 = v15;
        Swift::Int v15 = v19;
      }
      while (v19 < v3);
      Swift::Int v15 = v19;
      goto LABEL_23;
    }
    uint64_t result = sub_100029130();
    int v14 = result;
    Swift::Int v15 = v9 + 2;
    if (v9 + 2 < v3) {
      goto LABEL_13;
    }
LABEL_23:
    Swift::Int v7 = v15;
    if ((v14 & 1) == 0) {
      goto LABEL_32;
    }
LABEL_24:
    if (v15 < v9) {
      goto LABEL_148;
    }
    if (v9 < v15)
    {
      uint64_t v20 = 16 * v15;
      uint64_t v21 = 16 * v9;
      Swift::Int v22 = v15;
      Swift::Int v23 = v9;
      do
      {
        if (v23 != --v22)
        {
          if (!v8) {
            goto LABEL_152;
          }
          uint64_t v24 = v8 + v20;
          uint64_t v25 = *(void *)(v8 + v21);
          uint64_t v26 = *(void *)(v8 + v21 + 8);
          *(_OWORD *)(v8 + v21) = *(_OWORD *)(v8 + v20 - 16);
          *(void *)(v24 - 16) = v25;
          *(void *)(v24 - 8) = v26;
        }
        ++v23;
        v20 -= 16;
        v21 += 16;
      }
      while (v23 < v22);
    }
LABEL_31:
    Swift::Int v7 = v15;
LABEL_32:
    if (v7 >= v3) {
      goto LABEL_41;
    }
    if (__OFSUB__(v7, v9)) {
      goto LABEL_143;
    }
    if (v7 - v9 >= v94) {
      goto LABEL_41;
    }
    if (__OFADD__(v9, v94)) {
      goto LABEL_146;
    }
    if (v9 + v94 >= v3) {
      Swift::Int v27 = v3;
    }
    else {
      Swift::Int v27 = v9 + v94;
    }
    if (v27 < v9) {
      goto LABEL_147;
    }
    if (v7 == v27)
    {
LABEL_41:
      id v28 = v98;
    }
    else
    {
      uint64_t v79 = (uint64_t *)(v8 + 16 * v7);
      id v28 = v98;
      do
      {
        BOOL v80 = (uint64_t *)(v8 + 16 * v7);
        uint64_t result = *v80;
        uint64_t v81 = v80[1];
        Swift::Int v82 = v9;
        uint64_t v83 = v79;
        do
        {
          if (result == *(v83 - 2) && v81 == *(v83 - 1)) {
            break;
          }
          uint64_t result = sub_100029130();
          if ((result & 1) == 0) {
            break;
          }
          if (!v8) {
            goto LABEL_150;
          }
          uint64_t result = *v83;
          uint64_t v81 = v83[1];
          *(_OWORD *)uint64_t v83 = *((_OWORD *)v83 - 1);
          *(v83 - 1) = v81;
          *(v83 - 2) = result;
          v83 -= 2;
          ++v82;
        }
        while (v7 != v82);
        ++v7;
        v79 += 2;
      }
      while (v7 != v27);
      Swift::Int v7 = v27;
    }
    if (v7 < v9) {
      goto LABEL_142;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_100022F8C(0, *((void *)v28 + 2) + 1, 1, v28);
      id v28 = (char *)result;
    }
    unint64_t v30 = *((void *)v28 + 2);
    unint64_t v29 = *((void *)v28 + 3);
    unint64_t v31 = v30 + 1;
    if (v30 >= v29 >> 1)
    {
      uint64_t result = (uint64_t)sub_100022F8C((char *)(v29 > 1), v30 + 1, 1, v28);
      id v28 = (char *)result;
    }
    *((void *)v28 + 2) = v31;
    uint64_t v32 = v28 + 32;
    uint64_t v33 = (Swift::Int *)&v28[16 * v30 + 32];
    *uint64_t v33 = v9;
    v33[1] = v7;
    uint64_t v98 = v28;
    if (v30) {
      break;
    }
    unint64_t v31 = 1;
LABEL_90:
    Swift::Int v3 = v96;
    if (v7 >= v96) {
      goto LABEL_110;
    }
  }
  while (1)
  {
    unint64_t v34 = v31 - 1;
    if (v31 >= 4)
    {
      int v39 = &v32[2 * v31];
      uint64_t v40 = *(v39 - 8);
      uint64_t v41 = *(v39 - 7);
      BOOL v45 = __OFSUB__(v41, v40);
      uint64_t v42 = v41 - v40;
      if (v45) {
        goto LABEL_127;
      }
      uint64_t v44 = *(v39 - 6);
      uint64_t v43 = *(v39 - 5);
      BOOL v45 = __OFSUB__(v43, v44);
      uint64_t v37 = v43 - v44;
      char v38 = v45;
      if (v45) {
        goto LABEL_128;
      }
      unint64_t v46 = v31 - 2;
      uint64_t v47 = &v32[2 * v31 - 4];
      uint64_t v49 = *v47;
      uint64_t v48 = v47[1];
      BOOL v45 = __OFSUB__(v48, v49);
      uint64_t v50 = v48 - v49;
      if (v45) {
        goto LABEL_129;
      }
      BOOL v45 = __OFADD__(v37, v50);
      uint64_t v51 = v37 + v50;
      if (v45) {
        goto LABEL_131;
      }
      if (v51 >= v42)
      {
        unint64_t v69 = &v32[2 * v34];
        uint64_t v71 = *v69;
        uint64_t v70 = v69[1];
        BOOL v45 = __OFSUB__(v70, v71);
        uint64_t v72 = v70 - v71;
        if (v45) {
          goto LABEL_137;
        }
        BOOL v62 = v37 < v72;
        goto LABEL_79;
      }
    }
    else
    {
      if (v31 != 3)
      {
        uint64_t v63 = *((void *)v28 + 4);
        uint64_t v64 = *((void *)v28 + 5);
        BOOL v45 = __OFSUB__(v64, v63);
        uint64_t v56 = v64 - v63;
        char v57 = v45;
        goto LABEL_73;
      }
      uint64_t v36 = *((void *)v28 + 4);
      uint64_t v35 = *((void *)v28 + 5);
      BOOL v45 = __OFSUB__(v35, v36);
      uint64_t v37 = v35 - v36;
      char v38 = v45;
    }
    if (v38) {
      goto LABEL_130;
    }
    unint64_t v46 = v31 - 2;
    id v52 = &v32[2 * v31 - 4];
    uint64_t v54 = *v52;
    uint64_t v53 = v52[1];
    BOOL v55 = __OFSUB__(v53, v54);
    uint64_t v56 = v53 - v54;
    char v57 = v55;
    if (v55) {
      goto LABEL_132;
    }
    uint64_t v58 = &v32[2 * v34];
    uint64_t v60 = *v58;
    uint64_t v59 = v58[1];
    BOOL v45 = __OFSUB__(v59, v60);
    uint64_t v61 = v59 - v60;
    if (v45) {
      goto LABEL_134;
    }
    if (__OFADD__(v56, v61)) {
      goto LABEL_136;
    }
    if (v56 + v61 >= v37)
    {
      BOOL v62 = v37 < v61;
LABEL_79:
      if (v62) {
        unint64_t v34 = v46;
      }
      goto LABEL_81;
    }
LABEL_73:
    if (v57) {
      goto LABEL_133;
    }
    unint64_t v65 = &v32[2 * v34];
    uint64_t v67 = *v65;
    uint64_t v66 = v65[1];
    BOOL v45 = __OFSUB__(v66, v67);
    uint64_t v68 = v66 - v67;
    if (v45) {
      goto LABEL_135;
    }
    if (v68 < v56) {
      goto LABEL_90;
    }
LABEL_81:
    unint64_t v73 = v34 - 1;
    if (v34 - 1 >= v31)
    {
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
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
      goto LABEL_138;
    }
    if (!v8) {
      goto LABEL_151;
    }
    uint64_t v74 = &v32[2 * v73];
    uint64_t v75 = *v74;
    uint64_t v76 = &v32[2 * v34];
    uint64_t v77 = v76[1];
    uint64_t result = sub_100022DE4((char *)(v8 + 16 * *v74), (char *)(v8 + 16 * *v76), v8 + 16 * v77, __dst);
    if (v1) {
      break;
    }
    if (v77 < v75) {
      goto LABEL_124;
    }
    if (v34 > *((void *)v98 + 2)) {
      goto LABEL_125;
    }
    *uint64_t v74 = v75;
    v32[2 * v73 + 1] = v77;
    unint64_t v78 = *((void *)v98 + 2);
    if (v34 >= v78) {
      goto LABEL_126;
    }
    id v28 = v98;
    unint64_t v31 = v78 - 1;
    uint64_t result = (uint64_t)memmove(&v32[2 * v34], v76 + 2, 16 * (v78 - 1 - v34));
    *((void *)v98 + 2) = v78 - 1;
    if (v78 <= 2) {
      goto LABEL_90;
    }
  }
LABEL_106:
  uint64_t result = swift_bridgeObjectRelease();
  if (v96 < -1) {
    goto LABEL_145;
  }
  *(void *)(v95 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_100021CC8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v14 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v16 = *a4;
    uint64_t v5 = (void *)(*a4 + 24 * a3);
    while (2)
    {
      unint64_t v6 = *(void *)(v16 + 24 * v4 + 16);
      uint64_t v7 = v14;
      Swift::Int v15 = v5;
      do
      {
        unint64_t v8 = *(v5 - 1);
        if (v6 >> 62)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v9 = sub_1000290A0();
        }
        else
        {
          uint64_t v9 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        if (v8 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v10 = sub_1000290A0();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v9 < v10) {
          break;
        }
        if (!v16)
        {
          __break(1u);
          return result;
        }
        uint64_t v11 = *v5;
        uint64_t v12 = v5[1];
        unint64_t v6 = v5[2];
        *(_OWORD *)uint64_t v5 = *(_OWORD *)(v5 - 3);
        v5[2] = *(v5 - 1);
        *(v5 - 2) = v12;
        *(v5 - 1) = v6;
        *(v5 - 3) = v11;
        v5 -= 3;
        ++v7;
      }
      while (v4 != v7);
      ++v4;
      uint64_t v5 = v15 + 3;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_100021E78(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v19 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v21 = *a4;
    uint64_t v5 = *a4 + 8 * a3 - 8;
    while (2)
    {
      unint64_t v6 = *(void **)(v21 + 8 * v4);
      uint64_t v7 = v19;
      uint64_t v20 = v5;
      while (1)
      {
        unint64_t v8 = *(void **)v5;
        id v9 = v6;
        id v10 = v8;
        uint64_t result = sub_10002565C(v9, (SEL *)&selRef_uuid);
        if (!v11)
        {
          __break(1u);
LABEL_18:
          __break(1u);
LABEL_19:
          __break(1u);
          return result;
        }
        uint64_t v12 = result;
        uint64_t v13 = v11;
        uint64_t result = sub_10002565C(v10, (SEL *)&selRef_uuid);
        if (!v14) {
          goto LABEL_18;
        }
        if (v12 == result && v13 == v14) {
          break;
        }
        char v16 = sub_100029130();

        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v16 & 1) == 0) {
          goto LABEL_15;
        }
        if (!v21) {
          goto LABEL_19;
        }
        uint64_t v17 = *(void **)v5;
        unint64_t v6 = *(void **)(v5 + 8);
        *(void *)uint64_t v5 = v6;
        *(void *)(v5 + 8) = v17;
        v5 -= 8;
        if (v4 == ++v7) {
          goto LABEL_15;
        }
      }

      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
LABEL_15:
      ++v4;
      uint64_t v5 = v20 + 8;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_100021FE8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v23 = result;
  if (a3 != a2)
  {
    uint64_t v25 = *a4;
    uint64_t v4 = *a4 + 8 * a3 - 8;
    while (2)
    {
      uint64_t v5 = *(void **)(v25 + 8 * a3);
      uint64_t v6 = v23;
      uint64_t v24 = v4;
      uint64_t v26 = a3;
      while (1)
      {
        uint64_t v7 = *(void **)v4;
        id v8 = v5;
        id v9 = v7;
        id v10 = [v8 identifier];
        uint64_t v11 = sub_100028CE0();
        uint64_t v13 = v12;

        id v14 = [v9 identifier];
        uint64_t v15 = sub_100028CE0();
        uint64_t v17 = v16;

        if (v11 == v15 && v13 == v17) {
          break;
        }
        char v19 = sub_1000275E8();

        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v20 = v26;
        if (v19)
        {
          if (!v25)
          {
            __break(1u);
            return result;
          }
          uint64_t v21 = *(void **)v4;
          uint64_t v5 = *(void **)(v4 + 8);
          *(void *)uint64_t v4 = v5;
          *(void *)(v4 + 8) = v21;
          v4 -= 8;
          if (v26 != ++v6) {
            continue;
          }
        }
        goto LABEL_13;
      }

      uint64_t result = swift_bridgeObjectRelease_n();
      uint64_t v20 = v26;
LABEL_13:
      a3 = v20 + 1;
      uint64_t v4 = v24 + 8;
      if (a3 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_100022154(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
    while (2)
    {
      id v9 = (uint64_t *)(v7 + 16 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1)) {
          break;
        }
        uint64_t result = sub_100029130();
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }
        uint64_t result = *v12;
        uint64_t v10 = v12[1];
        *(_OWORD *)uint64_t v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 16;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

BOOL sub_10002221C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 + 1 >= a3)
  {
    LOBYTE(v11) = 0;
    uint64_t v7 = a4 + 1;
  }
  else
  {
    uint64_t v7 = a3;
    id v9 = (uint64_t *)(a2 + 24 * (a4 + 1));
    uint64_t v21 = *v9;
    long long v22 = *(_OWORD *)(v9 + 1);
    uint64_t v10 = (uint64_t *)(a2 + 24 * a4);
    uint64_t v19 = *v10;
    long long v20 = *(_OWORD *)(v10 + 1);
    BOOL v11 = sub_1000160D4((uint64_t)&v21, (uint64_t)&v19);
    if (v4) {
      return v11;
    }
    uint64_t v13 = a4 + 2;
    if (a4 + 2 >= v7)
    {
      uint64_t v7 = a4 + 2;
    }
    else
    {
      uint64_t v18 = a1;
      id v14 = (void *)(a2 + 24 * a4 + 64);
      BOOL v23 = v11;
      while (1)
      {
        unint64_t v15 = *(v14 - 3);
        if (*v14 >> 62)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v16 = sub_1000290A0();
        }
        else
        {
          uint64_t v16 = *(void *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        if (v15 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v17 = sub_1000290A0();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v17 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        LOBYTE(v11) = v23;
        if ((v23 ^ (v16 >= v17))) {
          break;
        }
        ++v13;
        v14 += 3;
        if (v13 >= v7) {
          goto LABEL_20;
        }
      }
      uint64_t v7 = v13;
LABEL_20:
      a1 = v18;
    }
  }
  *a1 = v7;
  return v11;
}

uint64_t sub_1000223F8(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 24;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 24;
  if (v9 >= v11)
  {
    sub_10001E480(a2, (uint64_t)(a3 - (void)a2) / 24, __dst);
    uint64_t v12 = &__dst[24 * v11];
    BOOL v14 = v7 >= v6 || v10 < 24;
    uint64_t v25 = __dst;
    if (v14) {
      goto LABEL_58;
    }
    unint64_t v15 = a3 - 24;
    while (1)
    {
      unint64_t v16 = *((void *)v12 - 1);
      char v38 = v12;
      unint64_t v17 = *((void *)v6 - 1);
      if (v16 >> 62)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v36 = sub_1000290A0();
      }
      else
      {
        uint64_t v36 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      if (v17 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v18 = sub_1000290A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v19 = (char *)(v15 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v36 >= v18)
      {
        long long v20 = v6 - 24;
        BOOL v22 = v19 != v6 || v15 >= (unint64_t)v6;
        v6 -= 24;
        uint64_t v12 = v38;
        if (!v22) {
          goto LABEL_29;
        }
      }
      else
      {
        long long v20 = v38 - 24;
        BOOL v21 = v19 != v38 || v15 >= (unint64_t)v38;
        uint64_t v12 = v38 - 24;
        if (!v21) {
          goto LABEL_29;
        }
      }
      long long v23 = *(_OWORD *)v20;
      *(void *)(v15 + 16) = *((void *)v20 + 2);
      *(_OWORD *)unint64_t v15 = v23;
LABEL_29:
      v15 -= 24;
      if (v6 <= v7 || v12 <= __dst)
      {
        uint64_t v25 = __dst;
        goto LABEL_58;
      }
    }
  }
  sub_10001E480(__src, (a2 - __src) / 24, __dst);
  uint64_t v12 = &__dst[24 * v9];
  if ((unint64_t)v6 >= a3 || v8 < 24)
  {
    uint64_t v6 = v7;
    uint64_t v25 = __dst;
  }
  else
  {
    uint64_t v25 = __dst;
    int v39 = &__dst[24 * v9];
    unint64_t v37 = a3;
    do
    {
      unint64_t v26 = *((void *)v6 + 2);
      unint64_t v27 = *((void *)v25 + 2);
      if (v26 >> 62)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v28 = sub_1000290A0();
      }
      else
      {
        uint64_t v28 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      if (v27 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v29 = sub_1000290A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v29 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v28 >= v29)
      {
        BOOL v30 = v7 == v6;
        unint64_t v31 = v6;
        v6 += 24;
        BOOL v32 = !v30 || v7 >= v6;
      }
      else
      {
        BOOL v30 = v7 == v25;
        unint64_t v31 = v25;
        v25 += 24;
        BOOL v32 = !v30 || v7 >= v25;
      }
      uint64_t v12 = v39;
      if (v32)
      {
        long long v33 = *(_OWORD *)v31;
        *((void *)v7 + 2) = *((void *)v31 + 2);
        *(_OWORD *)uint64_t v7 = v33;
      }
      v7 += 24;
    }
    while (v25 < v39 && (unint64_t)v6 < v37);
    uint64_t v6 = v7;
  }
LABEL_58:
  sub_10001E480(v25, (v12 - v25) / 24, v6);
  return 1;
}

uint64_t sub_100022778(char *__src, id *a2, unint64_t a3, char *__dst)
{
  unint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - __src;
  int64_t v9 = ((char *)a2 - __src) / 8;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 8;
  if (v9 < v11)
  {
    sub_10001E644(__src, ((char *)a2 - __src) / 8, __dst);
    uint64_t v12 = &__dst[8 * v9];
    BOOL v13 = (unint64_t)v6 >= v5 || v8 < 8;
    BOOL v14 = __dst;
    if (!v13)
    {
      uint64_t v47 = &__dst[8 * v9];
      while (1)
      {
        unint64_t v17 = v5;
        uint64_t v18 = v6;
        uint64_t v19 = *(void **)v14;
        id v20 = *v6;
        id v21 = v19;
        uint64_t result = sub_10002565C(v20, (SEL *)&selRef_uuid);
        if (!v23)
        {
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
          goto LABEL_60;
        }
        uint64_t v24 = result;
        uint64_t v25 = v23;
        uint64_t result = sub_10002565C(v21, (SEL *)&selRef_uuid);
        if (!v26) {
          goto LABEL_58;
        }
        BOOL v27 = v24 == result && v25 == v26;
        if (v27)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          char v28 = sub_100029130();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v28)
          {
            uint64_t v29 = (char *)v18;
            uint64_t v6 = v18 + 1;
            unint64_t v5 = v17;
            if (v7 == (char *)v18) {
              goto LABEL_26;
            }
LABEL_25:
            *(void *)uint64_t v7 = *(void *)v29;
            goto LABEL_26;
          }
        }
        uint64_t v29 = v14;
        BOOL v27 = v7 == v14;
        v14 += 8;
        unint64_t v5 = v17;
        uint64_t v6 = v18;
        if (!v27) {
          goto LABEL_25;
        }
LABEL_26:
        v7 += 8;
        uint64_t v12 = v47;
        if (v14 >= v47 || (unint64_t)v6 >= v5)
        {
          unint64_t v15 = v7;
          goto LABEL_56;
        }
      }
    }
    unint64_t v15 = v7;
LABEL_56:
    sub_10001E644(v14, (v12 - v14) / 8, v15);
    return 1;
  }
  sub_10001E644((char *)a2, (uint64_t)(a3 - (void)a2) / 8, __dst);
  uint64_t v44 = __dst;
  uint64_t v12 = &__dst[8 * v11];
  if (v7 >= (char *)v6 || v10 < 8)
  {
    BOOL v14 = __dst;
    unint64_t v15 = (char *)v6;
    goto LABEL_56;
  }
  unint64_t v31 = (char *)(v5 - 8);
  unint64_t v15 = (char *)v6;
  while (1)
  {
    uint64_t v48 = v12;
    BOOL v32 = v12 - 8;
    unint64_t v46 = v15;
    long long v33 = (void *)*((void *)v15 - 1);
    v15 -= 8;
    id v34 = *((id *)v12 - 1);
    id v35 = v33;
    uint64_t result = sub_10002565C(v34, (SEL *)&selRef_uuid);
    if (!v36) {
      goto LABEL_59;
    }
    uint64_t v37 = result;
    uint64_t v38 = v36;
    uint64_t result = sub_10002565C(v35, (SEL *)&selRef_uuid);
    if (!v39) {
      break;
    }
    BOOL v45 = v31 + 8;
    if (v37 == result && v38 == v39)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_44:
      unint64_t v15 = v46;
      BOOL v42 = v45 != v48 || v31 >= v48;
      uint64_t v12 = v32;
      goto LABEL_48;
    }
    char v41 = sub_100029130();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v41 & 1) == 0) {
      goto LABEL_44;
    }
    BOOL v42 = v45 != v46 || v31 >= v46;
    BOOL v32 = v15;
    uint64_t v12 = v48;
LABEL_48:
    if (v42) {
      *(void *)unint64_t v31 = *(void *)v32;
    }
    v31 -= 8;
    if (v15 <= v7 || v12 <= v44)
    {
      BOOL v14 = v44;
      goto LABEL_56;
    }
  }
LABEL_60:
  __break(1u);
  return result;
}

uint64_t sub_100022AB4(char *__src, id *a2, unint64_t a3, char *__dst)
{
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  uint64_t v8 = (char *)a2 - __src;
  uint64_t v9 = ((char *)a2 - __src) / 8;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 8;
  if (v9 >= v11)
  {
    sub_10002789C();
    sub_10001E644(v33, v34, v35);
    uint64_t v59 = __dst;
    uint64_t v12 = &__dst[8 * v11];
    if (v7 >= (char *)v6 || v10 < 8)
    {
      BOOL v14 = __dst;
      goto LABEL_52;
    }
    uint64_t v37 = (id *)(a3 - 8);
    uint64_t v58 = v7;
    while (1)
    {
      uint64_t v63 = v12;
      uint64_t v38 = (void *)*((void *)v12 - 1);
      v12 -= 8;
      unint64_t v65 = v6;
      uint64_t v40 = v6 - 1;
      uint64_t v39 = *(v6 - 1);
      id v41 = v38;
      id v42 = v39;
      uint64_t v61 = v41;
      id v43 = [v41 identifier];
      uint64_t v44 = sub_100028CE0();
      uint64_t v46 = v45;

      id v47 = [v42 identifier];
      uint64_t v48 = sub_100028CE0();
      uint64_t v50 = v49;

      if (v44 == v48 && v46 == v50) {
        char v52 = 0;
      }
      else {
        char v52 = sub_1000275E8();
      }
      uint64_t v53 = v37 + 1;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      if (v52)
      {
        BOOL v54 = v53 != v65 || v37 >= v65;
        uint64_t v6 = v40;
        uint64_t v12 = v63;
        if (!v54) {
          goto LABEL_47;
        }
      }
      else
      {
        BOOL v55 = v53 != (id *)v63 || v37 >= (id *)v63;
        uint64_t v40 = (id *)v12;
        uint64_t v6 = v65;
        if (!v55) {
          goto LABEL_47;
        }
      }
      *uint64_t v37 = *v40;
LABEL_47:
      --v37;
      if (v6 <= (id *)v58 || v12 <= v59)
      {
        BOOL v14 = v59;
        goto LABEL_52;
      }
    }
  }
  sub_10001E644(__src, ((char *)a2 - __src) / 8, __dst);
  uint64_t v12 = &__dst[8 * v9];
  BOOL v13 = (unint64_t)v6 >= a3 || v8 < 8;
  BOOL v14 = __dst;
  if (!v13)
  {
    unint64_t v60 = a3;
    BOOL v62 = &__dst[8 * v9];
    while (1)
    {
      unint64_t v15 = v7;
      uint64_t v64 = v6;
      unint64_t v16 = *(void **)v14;
      id v17 = *v6;
      id v18 = v16;
      id v19 = [v17 identifier];
      uint64_t v20 = sub_100028CE0();
      uint64_t v22 = v21;

      id v23 = [v18 identifier];
      uint64_t v24 = sub_100028CE0();
      uint64_t v26 = v25;

      if (v20 == v24 && v22 == v26) {
        break;
      }
      char v28 = sub_100029130();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v28 & 1) == 0) {
        goto LABEL_14;
      }
      uint64_t v29 = (char *)v64;
      uint64_t v6 = v64 + 1;
      BOOL v30 = v15;
      BOOL v31 = v15 == (char *)v64;
LABEL_15:
      uint64_t v12 = v62;
      if (!v31) {
        *(void *)BOOL v30 = *(void *)v29;
      }
      uint64_t v7 = v30 + 8;
      if (v14 >= v62 || (unint64_t)v6 >= v60) {
        goto LABEL_22;
      }
    }

    swift_bridgeObjectRelease_n();
LABEL_14:
    uint64_t v29 = v14;
    BOOL v30 = v15;
    BOOL v31 = v15 == v14;
    v14 += 8;
    uint64_t v6 = v64;
    goto LABEL_15;
  }
LABEL_22:
  uint64_t v6 = (id *)v7;
LABEL_52:
  sub_10001E644(v14, (v12 - v14) / 8, (char *)v6);
  return 1;
}

uint64_t sub_100022DE4(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_10001E5B0(a2, (uint64_t)(a3 - (void)a2) / 16, __dst);
    uint64_t v12 = &v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_47;
    }
    id v18 = (char *)(a3 - 16);
    while (1)
    {
      id v19 = v18 + 16;
      uint64_t v20 = v12 - 16;
      BOOL v21 = *((void *)v12 - 2) == *((void *)v6 - 2) && *((void *)v12 - 1) == *((void *)v6 - 1);
      if (v21 || (sub_100029130() & 1) == 0)
      {
        BOOL v23 = v19 != v12 || v18 >= v12;
        v12 -= 16;
        if (!v23) {
          goto LABEL_43;
        }
      }
      else
      {
        BOOL v22 = v19 != v6 || v18 >= v6;
        uint64_t v20 = v6 - 16;
        v6 -= 16;
        if (!v22) {
          goto LABEL_43;
        }
      }
      *(_OWORD *)id v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_47;
      }
    }
  }
  sub_10001E5B0(__src, (a2 - __src) / 16, __dst);
  uint64_t v12 = &v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      BOOL v14 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v14 && (sub_100029130() & 1) != 0) {
        break;
      }
      unint64_t v15 = v4;
      BOOL v14 = v7 == v4;
      v4 += 16;
      if (!v14) {
        goto LABEL_15;
      }
LABEL_16:
      v7 += 16;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_21;
      }
    }
    unint64_t v15 = v6;
    BOOL v14 = v7 == v6;
    v6 += 16;
    if (v14) {
      goto LABEL_16;
    }
LABEL_15:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v6 = v7;
LABEL_47:
  sub_10001E5B0(v4, (v12 - v4) / 16, v6);
  return 1;
}

char *sub_100022F8C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100009C74(&qword_10003D878);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100023084(uint64_t a1)
{
  return sub_100022F8C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100023098(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_1000291B0();
  swift_bridgeObjectRetain();
  sub_100028CF0();
  Swift::Int v8 = sub_1000291D0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100029130() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_100029130() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100024F68(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100023248(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  if (!v6) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v9 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v8 << 6))
  {
    BOOL v14 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    swift_bridgeObjectRetain();
    sub_1000244C8(v15, v16);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v11 >= v7) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v3 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v12 = *(void *)(v3 + 8 * v8);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_21:
    unint64_t v6 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 4;
  if (v13 < v7)
  {
    unint64_t v12 = *(void *)(v3 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_21;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_21;
  }
LABEL_24:
  return swift_release();
}

unint64_t *sub_1000233F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v37 = a1 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v10 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v11 = v10 | (v9 << 6);
    while (1)
    {
      uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_1000291B0();
      swift_bridgeObjectRetain();
      sub_100028CF0();
      Swift::Int v19 = sub_1000291D0();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_37:
      swift_bridgeObjectRelease();
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v12 = v9 + 1;
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_50;
      }
      if (v12 >= v36) {
        goto LABEL_48;
      }
      unint64_t v13 = *(void *)(v37 + 8 * v12);
      int64_t v14 = v9 + 1;
      if (!v13)
      {
        int64_t v14 = v9 + 2;
        if (v9 + 2 >= v36) {
          goto LABEL_48;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v9 + 3;
          if (v9 + 3 >= v36) {
            goto LABEL_48;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 4;
            if (v9 + 4 >= v36) {
              goto LABEL_48;
            }
            unint64_t v13 = *(void *)(v37 + 8 * v14);
            if (!v13)
            {
              int64_t v15 = v9 + 5;
              if (v9 + 5 >= v36)
              {
LABEL_48:
                sub_100026544();
                return (unint64_t *)v2;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v15);
              if (!v13)
              {
                while (1)
                {
                  int64_t v14 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    break;
                  }
                  if (v14 >= v36) {
                    goto LABEL_48;
                  }
                  unint64_t v13 = *(void *)(v37 + 8 * v14);
                  ++v15;
                  if (v13) {
                    goto LABEL_22;
                  }
                }
LABEL_50:
                __break(1u);
              }
              int64_t v14 = v9 + 5;
            }
          }
        }
      }
LABEL_22:
      unint64_t v7 = (v13 - 1) & v13;
      unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
      int64_t v9 = v14;
    }
    uint64_t v22 = *(void *)(v2 + 48);
    BOOL v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_100029130() & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_37;
        }
        uint64_t v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_100029130() & 1) == 0);
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v29 = *(unsigned char *)(v2 + 32);
    unint64_t v30 = (unint64_t)((1 << v29) + 63) >> 6;
    size_t v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      __chkstk_darwin(isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      BOOL v32 = sub_100024658((unint64_t *)((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0)), v30, v2, v21, &v38);
      swift_release();
      sub_100026544();
    }
    else
    {
      long long v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      BOOL v32 = sub_100024658((unint64_t *)v33, v30, v2, v21, &v38);
      swift_release();
      sub_100026544();
      swift_slowDealloc();
    }
    return v32;
  }
  else
  {
    swift_release();
    return (unint64_t *)&_swiftEmptySetSingleton;
  }
}

uint64_t sub_10002386C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100009C74(&qword_10003D9C8);
  uint64_t v3 = sub_100028F90();
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
      sub_1000291B0();
      sub_100028CF0();
      uint64_t result = sub_1000291D0();
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
      char v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *char v28 = v18;
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
                sub_100023CDC(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *unint64_t v30 = -1 << v29;
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
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_100023B48(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  if ((v4 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    uint64_t v6 = (uint64_t *)((char *)&v10 - ((8 * v5 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_100023CDC(0, v5, v6);
    uint64_t v7 = sub_100023CF8((uint64_t)v6, v5, a2, v3);
    swift_release();
  }
  else
  {
    int64_t v8 = (void *)swift_slowAlloc();
    sub_100023CDC(0, v5, v8);
    uint64_t v7 = sub_100023CF8((uint64_t)v8, v5, a2, v3);
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

uint64_t sub_100023CDC(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_100023CF8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  char v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) >= *(void *)(a3 + 16))
  {
    int64_t v34 = 0;
    uint64_t v60 = a3 + 56;
    uint64_t v61 = 0;
    uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
    if (v35 < 64) {
      uint64_t v36 = ~(-1 << v35);
    }
    else {
      uint64_t v36 = -1;
    }
    unint64_t v37 = v36 & *(void *)(a3 + 56);
    int64_t v63 = (unint64_t)(v35 + 63) >> 6;
    uint64_t v38 = a4 + 56;
    while (1)
    {
      while (1)
      {
        if (v37)
        {
          unint64_t v39 = __clz(__rbit64(v37));
          v37 &= v37 - 1;
          unint64_t v40 = v39 | (v34 << 6);
        }
        else
        {
          int64_t v41 = v34 + 1;
          if (__OFADD__(v34, 1))
          {
LABEL_81:
            __break(1u);
LABEL_82:
            __break(1u);
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
          if (v41 >= v63) {
            goto LABEL_79;
          }
          unint64_t v42 = *(void *)(v60 + 8 * v41);
          ++v34;
          if (!v42)
          {
            int64_t v34 = v41 + 1;
            if (v41 + 1 >= v63) {
              goto LABEL_79;
            }
            unint64_t v42 = *(void *)(v60 + 8 * v34);
            if (!v42)
            {
              int64_t v34 = v41 + 2;
              if (v41 + 2 >= v63) {
                goto LABEL_79;
              }
              unint64_t v42 = *(void *)(v60 + 8 * v34);
              if (!v42)
              {
                int64_t v43 = v41 + 3;
                if (v43 >= v63) {
                  goto LABEL_79;
                }
                unint64_t v42 = *(void *)(v60 + 8 * v43);
                if (!v42)
                {
                  while (1)
                  {
                    int64_t v34 = v43 + 1;
                    if (__OFADD__(v43, 1)) {
                      goto LABEL_85;
                    }
                    if (v34 >= v63) {
                      break;
                    }
                    unint64_t v42 = *(void *)(v60 + 8 * v34);
                    ++v43;
                    if (v42) {
                      goto LABEL_61;
                    }
                  }
LABEL_79:
                  swift_retain();
                  return sub_100024238(v57, a2, v61, v5);
                }
                int64_t v34 = v43;
              }
            }
          }
LABEL_61:
          unint64_t v37 = (v42 - 1) & v42;
          unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
        }
        uint64_t v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
        uint64_t v46 = *v44;
        uint64_t v45 = v44[1];
        sub_1000291B0();
        swift_bridgeObjectRetain();
        sub_100028CF0();
        Swift::Int v47 = sub_1000291D0();
        uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
        unint64_t v49 = v47 & ~v48;
        if ((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49)) {
          break;
        }
LABEL_78:
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v50 = *(void *)(a4 + 48);
      uint64_t v51 = (void *)(v50 + 16 * v49);
      BOOL v52 = *v51 == v46 && v51[1] == v45;
      if (!v52 && (sub_100029130() & 1) == 0)
      {
        uint64_t v53 = ~v48;
        do
        {
          unint64_t v49 = (v49 + 1) & v53;
          if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
            goto LABEL_78;
          }
          BOOL v54 = (void *)(v50 + 16 * v49);
          BOOL v55 = *v54 == v46 && v54[1] == v45;
        }
        while (!v55 && (sub_100029130() & 1) == 0);
      }
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_83;
      }
    }
  }
  int64_t v6 = 0;
  uint64_t v58 = a4 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  int64_t v59 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v61 = 0;
  uint64_t v10 = a3 + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      int64_t v62 = v6;
      unint64_t v12 = v11 | (v6 << 6);
      goto LABEL_22;
    }
    int64_t v13 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_81;
    }
    if (v13 >= v59) {
      goto LABEL_79;
    }
    unint64_t v14 = *(void *)(v58 + 8 * v13);
    int64_t v15 = v6 + 1;
    if (!v14)
    {
      int64_t v15 = v6 + 2;
      if (v6 + 2 >= v59) {
        goto LABEL_79;
      }
      unint64_t v14 = *(void *)(v58 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v6 + 3;
        if (v6 + 3 >= v59) {
          goto LABEL_79;
        }
        unint64_t v14 = *(void *)(v58 + 8 * v15);
        if (!v14) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v9 = (v14 - 1) & v14;
    int64_t v62 = v15;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
LABEL_22:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_1000291B0();
    swift_bridgeObjectRetain();
    sub_100028CF0();
    Swift::Int v20 = sub_1000291D0();
    uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    uint64_t v24 = 1 << v22;
    if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) == 0) {
      goto LABEL_36;
    }
    uint64_t v25 = *(void *)(a3 + 48);
    BOOL v26 = (void *)(v25 + 16 * v22);
    BOOL v27 = *v26 == v19 && v26[1] == v18;
    if (v27 || (sub_100029130() & 1) != 0)
    {
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
    else
    {
      uint64_t v28 = ~v21;
      for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
      {
        unint64_t v30 = i & v28;
        if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
          break;
        }
        size_t v31 = (void *)(v25 + 16 * v30);
        BOOL v32 = *v31 == v19 && v31[1] == v18;
        if (v32 || (sub_100029130() & 1) != 0)
        {
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v23 = v30 >> 6;
          uint64_t v24 = 1 << v30;
          goto LABEL_38;
        }
      }
LABEL_36:
      uint64_t result = swift_bridgeObjectRelease();
      int64_t v6 = v62;
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  uint64_t v16 = v6 + 4;
  if (v6 + 4 >= v59) {
    goto LABEL_79;
  }
  unint64_t v14 = *(void *)(v58 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v6 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v59) {
      goto LABEL_79;
    }
    unint64_t v14 = *(void *)(v58 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_21;
    }
  }
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
  return result;
}

uint64_t sub_100024238(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  sub_100009C74(&qword_10003D9C8);
  uint64_t result = sub_100028FA0();
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
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_1000291B0();
    swift_bridgeObjectRetain();
    sub_100028CF0();
    uint64_t result = sub_1000291D0();
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
    uint64_t v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    *uint64_t v28 = v18;
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

uint64_t sub_1000244C8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_1000291B0();
  swift_bridgeObjectRetain();
  sub_100028CF0();
  Swift::Int v6 = sub_1000291D0();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  uint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_100029130() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_100029130() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10002494C();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_100024DAC(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t *sub_100024658(unint64_t *result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  unint64_t v39 = result;
  *(unint64_t *)((char *)result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v40 = a3 + 56;
  while (2)
  {
    uint64_t v38 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_15;
        }
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_48;
        }
        int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
        int64_t v15 = a5[3];
        if (v13 >= v14) {
          goto LABEL_46;
        }
        uint64_t v16 = a5[1];
        unint64_t v17 = *(void *)(v16 + 8 * v13);
        if (!v17)
        {
          int64_t v18 = v9 + 2;
          int64_t v15 = v9 + 1;
          if (v9 + 2 >= v14) {
            goto LABEL_46;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v18);
          if (!v17)
          {
            int64_t v15 = v9 + 2;
            if (v9 + 3 >= v14) {
              goto LABEL_46;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              int64_t v13 = v9 + 3;
              goto LABEL_14;
            }
            int64_t v18 = v9 + 4;
            int64_t v15 = v9 + 3;
            if (v9 + 4 >= v14) {
              goto LABEL_46;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v18);
            if (!v17)
            {
              int64_t v13 = v9 + 5;
              int64_t v15 = v9 + 4;
              if (v9 + 5 >= v14) {
                goto LABEL_46;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v13);
              if (!v17)
              {
                int64_t v36 = v9 + 6;
                while (v36 < v14)
                {
                  unint64_t v17 = *(void *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    int64_t v13 = v36 - 1;
                    goto LABEL_14;
                  }
                }
                int64_t v15 = v14 - 1;
LABEL_46:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return (unint64_t *)sub_100024238(v39, a2, v38, a3);
              }
              goto LABEL_14;
            }
          }
          int64_t v13 = v18;
        }
LABEL_14:
        uint64_t v11 = (v17 - 1) & v17;
        unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
        int64_t v9 = v13;
LABEL_15:
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_1000291B0();
        swift_bridgeObjectRetain();
        sub_100028CF0();
        Swift::Int v22 = sub_1000291D0();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v40 + 8 * (v24 >> 6))) == 0) {
          goto LABEL_32;
        }
        uint64_t v27 = *(void *)(a3 + 48);
        uint64_t v28 = (void *)(v27 + 16 * v24);
        BOOL v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_100029130() & 1) != 0) {
          break;
        }
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          int64_t v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_100029130() & 1) != 0)
          {
            uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_22;
          }
        }
LABEL_32:
        uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
      }
      uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
LABEL_22:
      unint64_t v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_48:
      __break(1u);
      return result;
    }
    if (v38 != 1) {
      continue;
    }
    return (unint64_t *)&_swiftEmptySetSingleton;
  }
}

void *sub_10002494C()
{
  uint64_t v1 = v0;
  sub_100009C74(&qword_10003D9C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100028F80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    Swift::Int v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    void *v22 = *v20;
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

uint64_t sub_100024B00()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100009C74(&qword_10003D9C8);
  uint64_t v3 = sub_100028F90();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
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
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_1000291B0();
    swift_bridgeObjectRetain();
    sub_100028CF0();
    uint64_t result = sub_1000291D0();
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
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *uint64_t v28 = v18;
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

unint64_t sub_100024DAC(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_100028F40();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_1000291B0();
        swift_bridgeObjectRetain();
        sub_100028CF0();
        Swift::Int v10 = sub_1000291D0();
        swift_bridgeObjectRelease();
        Swift::Int v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 >= v9 && v2 >= v11)
          {
LABEL_15:
            uint64_t v14 = *(void *)(v3 + 48);
            unint64_t v15 = (_OWORD *)(v14 + 16 * v2);
            int64_t v16 = (_OWORD *)(v14 + 16 * v6);
            BOOL v17 = v2 != v6 || v15 >= v16 + 1;
            int64_t v2 = v6;
            if (v17)
            {
              *unint64_t v15 = *v16;
              int64_t v2 = v6;
            }
          }
        }
        else if (v11 >= v9 || v2 >= v11)
        {
          goto LABEL_15;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v18 = *(void *)(v3 + 16);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

Swift::Int sub_100024F68(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_10002386C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10002494C();
      goto LABEL_22;
    }
    sub_100024B00();
  }
  uint64_t v11 = *v4;
  sub_1000291B0();
  sub_100028CF0();
  uint64_t result = sub_1000291D0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100029130(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100029140();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_100029130();
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
  unint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
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

double sub_100025104@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_10001F8D4(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v4;
    uint64_t v11 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    Swift::Int v12 = *(void *)(v11 + 24);
    sub_100009C74(&qword_10003D990);
    sub_100029060(isUniquelyReferenced_nonNull_native, v12);
    swift_bridgeObjectRelease();
    sub_100026534((_OWORD *)(*(void *)(v14 + 56) + 32 * v8), a3);
    sub_100029070();
    *uint64_t v4 = v14;
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

uint64_t sub_10002523C(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_1000252CC(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v9;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_1000252CC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_10001F8D4(a2, a3);
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
  sub_100009C74(&qword_10003D990);
  if (!sub_100029060(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_10001F8D4(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    double result = (_OWORD *)sub_100029150();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if (v17)
  {
    unint64_t v21 = (_OWORD *)(v20[7] + 32 * v16);
    sub_10000BA44((uint64_t)v21);
    return sub_100026534(a1, v21);
  }
  else
  {
    sub_10002540C(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

_OWORD *sub_10002540C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  double result = sub_100026534(a4, (_OWORD *)(a5[7] + 32 * a1));
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

void sub_100025478(uint64_t a1, void *a2)
{
}

id sub_100025494(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = sub_100028C70().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [a3 storeUserInfo:isa error:a2];

  return v6;
}

void sub_100025514(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100028CB0();
  swift_bridgeObjectRelease();
  [a3 setDisplayNameLocalizationKey:v4];
}

uint64_t sub_100025578(void *a1)
{
  id v1 = [a1 personLocalIdentifiers];
  if (!v1) {
    return 0;
  }
  int64_t v2 = v1;
  uint64_t v3 = sub_100028E30();

  return v3;
}

void sub_1000255D8(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  sub_10000BAE8(0, a3);
  Class isa = sub_100028D40().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(a2, *a5, isa);
}

uint64_t sub_10002565C(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_100028CE0();
  }
  return sub_100027C88();
}

uint64_t sub_1000256B8(void *a1)
{
  id v1 = [a1 media];
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  sub_10000BAE8(0, &qword_10003D8C0);
  uint64_t v3 = sub_100028D60();

  return v3;
}

uint64_t sub_100025728(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1000290A0();
    double result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1000290A0();
      double result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_100026708(&qword_10003D940, &qword_10003D938);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_100009C74(&qword_10003D938);
            uint64_t v10 = sub_100025AA8(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void *, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_10001EA90((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, &qword_10003D930);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000258E8(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1000290A0();
    double result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1000290A0();
      double result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_100026708(&qword_10003D850, &qword_10003D848);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_100009C74(&qword_10003D848);
            uint64_t v10 = sub_100025B14(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void *, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_10001EA90((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, &qword_10003D858);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t (*sub_100025AA8(void *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_100025BC4(v6, a2, a3);
  return sub_100025B10;
}

uint64_t (*sub_100025B14(void *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_100025C44(v6, a2, a3);
  return sub_100025B10;
}

void sub_100025B7C(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_100025BC4(void *a1, unint64_t a2, uint64_t a3))(id *)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_10001FFE8(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)sub_100028FE0();
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_100026E68;
}

void (*sub_100025C44(void *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_10001FFE8(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)sub_100028FE0();
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_100025CC4;
}

void sub_100025CC4(id *a1)
{
}

uint64_t sub_100025CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100025D2C(uint64_t result, int a2, uint64_t a3, uint64_t a4)
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

uint64_t sub_100025DA8(uint64_t a1)
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

uint64_t sub_100025E28@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t sub_100025E60(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_39:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  unint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v23 = -1 << *(unsigned char *)(a4 + 32);
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
    uint64_t v22 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    void *v11 = *v20;
    v11[1] = v21;
    v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 3;
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
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
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
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
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v23;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void *sub_10002607C(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
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
  unint64_t v11 = a2;
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
    uint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    void *v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
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

uint64_t sub_100026278(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
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
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
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
  unint64_t v11 = a2;
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
    void *v11 = *v20;
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

char *sub_100026478(uint64_t a1)
{
  return sub_10001F4E4(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_10002648C(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_1000264A0()
{
  swift_errorRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000264D8()
{
  swift_release();

  sub_100027754();
  return _swift_deallocObject(v1, v2, v3);
}

void sub_100026514(uint64_t a1)
{
  sub_10001CAB8(a1, *(void *)(v1 + 16), *(NSObject **)(v1 + 24));
}

uint64_t sub_10002651C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002652C()
{
  return swift_release();
}

_OWORD *sub_100026534(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100026544()
{
  return swift_release();
}

uint64_t sub_10002654C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100026594(void *a1@<X8>)
{
  sub_100018C30();
  *a1 = v2;
}

uint64_t sub_1000265CC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000BAE8(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100026610()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100027754();
  return _swift_deallocObject(v0, v1, v2);
}

uint64_t sub_10002664C()
{
  return sub_10001746C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_100026654()
{
  unint64_t result = qword_10003D980;
  if (!qword_10003D980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D980);
  }
  return result;
}

uint64_t sub_1000266A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009C74((uint64_t *)&unk_10003D410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100026708(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B5B0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *sub_10002674C(uint64_t a1)
{
  return sub_10001F6B4(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_100026760@<X0>(unint64_t *a1@<X8>)
{
  return sub_10000D038(*(void **)(v1 + 16), *(void *)(v1 + 32), a1);
}

uint64_t sub_100026784()
{
  sub_1000274A4();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10002768C(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10000C198;
  uint64_t v3 = sub_100026FE4();
  return v4(v3);
}

uint64_t sub_100026828()
{
  sub_1000274A4();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10002768C(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10000C198;
  uint64_t v3 = sub_100026FE4();
  return v4(v3);
}

uint64_t sub_1000268CC()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002690C()
{
  sub_1000274A4();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = (int *)v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_10002768C(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_10000C198;
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10003DA10 + dword_10003DA10);
  return v9(v2, v3, v4, v5);
}

uint64_t sub_1000269D0(uint64_t a1, uint64_t *a2)
{
  sub_100009C74(a2);
  sub_10000C2C8();
  sub_10002706C();
  v3();
  return a1;
}

uint64_t sub_100026A20()
{
  swift_release();
  sub_100027754();
  return _swift_deallocObject(v0, v1, v2);
}

uint64_t sub_100026A54(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_10002768C(v4);
  void *v5 = v6;
  v5[1] = sub_10000BD10;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10003DA20 + dword_10003DA20);
  return v7(a1, v3);
}

uint64_t sub_100026B0C()
{
  _Block_release(*(const void **)(v0 + 32));
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100026B5C()
{
  sub_1000274A4();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10002768C(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10000BD10;
  uint64_t v3 = sub_100026FE4();
  return v4(v3);
}

uint64_t sub_100026BFC(uint64_t a1, uint64_t a2)
{
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for PosterUpdaterError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PosterUpdaterError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PosterUpdaterError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100026DBCLL);
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

uint64_t sub_100026DE4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100026DEC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PosterUpdaterError()
{
  return &type metadata for PosterUpdaterError;
}

unint64_t sub_100026E0C()
{
  unint64_t result = qword_10003DA40;
  if (!qword_10003DA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003DA40);
  }
  return result;
}

uint64_t sub_100026E6C()
{
  return swift_slowDealloc();
}

uint64_t sub_100026E84()
{
  return swift_slowAlloc();
}

uint64_t sub_100026E9C()
{
  return swift_slowAlloc();
}

uint64_t sub_100026EDC()
{
  return swift_slowAlloc();
}

uint64_t sub_100026EF4()
{
  return sub_100028D90();
}

uint64_t sub_100026F10()
{
  return swift_dynamicCast();
}

uint64_t sub_100026F4C()
{
  return sub_100029130();
}

uint64_t sub_100026F98()
{
  return swift_dynamicCast();
}

uint64_t sub_100026FB0()
{
  return swift_slowAlloc();
}

uint64_t sub_100026FC8()
{
  return swift_arrayDestroy();
}

uint64_t sub_100026FE4()
{
  return v0;
}

void sub_100027004(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 0xCu);
}

uint64_t sub_100027024()
{
  return v0;
}

void sub_10002703C(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t sub_100027090()
{
  return sub_100028F10();
}

uint64_t sub_1000270CC()
{
  return swift_slowAlloc();
}

uint64_t sub_1000270E4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10002711C()
{
  return swift_arrayDestroy();
}

uint64_t sub_100027140()
{
  return swift_arrayDestroy();
}

BOOL sub_100027168()
{
  return os_log_type_enabled(v1, v0);
}

id sub_1000271BC(float a1)
{
  *uint64_t v1 = a1;
  *(void *)(v2 + 152) = v3;
  return v3;
}

uint64_t sub_1000271E0()
{
  return sub_100028F10();
}

id sub_100027204()
{
  *(_WORD *)(v0 + 12) = 2112;
  *(void *)(v2 - 136) = v1;
  return v1;
}

uint64_t sub_100027228()
{
  return swift_arrayDestroy();
}

uint64_t sub_100027244()
{
  return swift_dynamicCast();
}

__n128 sub_100027288@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = a1;
  *(void *)(v3 - 104) = a1;
  __n128 result = *(__n128 *)(v3 - 256);
  *uint64_t v2 = result.n128_u32[0];
  return result;
}

uint64_t sub_1000272A0()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_1000272D4(float a1)
{
  *uint64_t v1 = a1;
  return sub_100028F10();
}

void sub_100027304(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void sub_100027338(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0x16u);
}

BOOL sub_100027350()
{
  return os_log_type_enabled(v0, v1);
}

uint64_t sub_100027368@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 56) = a2;
  *(void *)(result + 64) = v2;
  *(_WORD *)(result + 32) = 602;
  *(void *)(result + 96) = a2;
  *(void *)(result + 104) = v2;
  *(_WORD *)(result + 72) = 605;
  *(void *)(result + 136) = a2;
  *(void *)(result + 144) = v2;
  return result;
}

uint64_t sub_100027388()
{
  return sub_100028CE0();
}

uint64_t sub_1000273A4()
{
  *(void *)(v1 - 184) = v0;
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_1000273D4()
{
  return v0;
}

uint64_t sub_1000273E8(uint64_t a1)
{
  *(void *)(v1 - 128) = a1;
  return v1 - 128;
}

BOOL sub_1000273FC(os_log_type_t a1)
{
  uint64_t v4 = *(NSObject **)(v1 + 2952);
  return os_log_type_enabled(v4, a1);
}

uint64_t sub_10002741C(float a1)
{
  *uint64_t v1 = a1;
  *(void *)(v3 - 240) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100027450(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10002745C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100027474()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1000274BC(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8)
{
  a5.n128_u64[0] = *v8;
  a6.n128_u64[0] = v8[1];
  a7.n128_u64[0] = v8[2];
  a8.n128_u64[0] = v8[3];
  a1.n128_u64[0] = v10;
  a2.n128_u64[0] = v11;
  a3.n128_u64[0] = v12;
  a4.n128_u64[0] = v13;
  return _PXRectFlippedVertically(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1000274E4(uint64_t a1, unint64_t a2)
{
  return sub_10001EC50(a1, a2, (uint64_t *)(v2 - 104));
}

uint64_t sub_1000274FC(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

void sub_100027534(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void sub_100027564(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t sub_100027574(uint64_t a1)
{
  *(void *)(v2 - 112) = a1;
  *uint64_t v1 = *(_OWORD *)(v2 - 256);
  return swift_bridgeObjectRetain();
}

uint64_t sub_100027598(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return v1 - 136;
}

uint64_t sub_1000275A8()
{
  return *(void *)(v0 - 168);
}

uint64_t sub_1000275CC()
{
  return swift_task_dealloc();
}

uint64_t sub_1000275E8()
{
  return sub_100029130();
}

uint64_t sub_10002760C()
{
  return swift_arrayDestroy();
}

uint64_t sub_100027628(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_100027640()
{
  return swift_slowAlloc();
}

uint64_t sub_10002765C()
{
  return v0;
}

void sub_100027674()
{
  uint64_t v2 = *(void **)(v0 - 264);
}

uint64_t sub_10002768C(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_1000276A4(uint64_t a1)
{
  *(void *)(v1 - 144) = a1;
  return v1 - 144;
}

BOOL sub_1000276B4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_1000276E8(uint64_t a1)
{
  *(void *)(v2 - 104) = a1;
  *uint64_t v1 = *(_OWORD *)(v2 - 224);
  return swift_bridgeObjectRetain();
}

uint64_t sub_10002770C()
{
  return sub_100028BF0();
}

uint64_t sub_100027730()
{
  return sub_100028BF0();
}

uint64_t sub_100027760(uint64_t result)
{
  *(void *)(v1 - 128) = result;
  return result;
}

uint64_t sub_10002776C()
{
  return 2604;
}

uint64_t sub_10002777C()
{
  return *(void *)(v0 - 272);
}

uint64_t sub_100027798(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t sub_1000277B0()
{
  return swift_allocObject();
}

id sub_1000277E0(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v4, v5, v6, v7);
}

uint64_t sub_100027804()
{
  return v0;
}

uint64_t sub_100027810()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100027828()
{
  return v0;
}

void sub_100027834()
{
  *(_WORD *)(v0 + 12) = 2080;
}

uint64_t sub_100027858(uint64_t result)
{
  *(void *)(v1 - 112) = result;
  return result;
}

uint64_t sub_100027878()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000278A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_10001EC50(v3, v4, a3);
}

uint64_t sub_1000278C0()
{
  return v0;
}

void sub_1000278D8()
{
}

uint64_t sub_1000278FC()
{
  return sub_100028DB0();
}

uint64_t sub_100027914()
{
  return sub_100028F10();
}

uint64_t sub_100027940(uint64_t a1)
{
  *(void *)(v1 - 152) = a1;
  return sub_100028F10();
}

uint64_t sub_100027960()
{
  *(void *)(v1 - 144) = v0;
  return swift_errorRetain();
}

BOOL sub_100027978@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_100027998(uint64_t a1)
{
  *(void *)(v1 - 144) = a1;
  return v1 - 144;
}

uint64_t sub_1000279AC(uint64_t a1)
{
  *(void *)(v1 - 144) = a1;
  return v1 - 144;
}

uint64_t sub_1000279C0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000279E0()
{
  *(void *)((*(void *)(v0 - 72) & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  return sub_100028D80();
}

BOOL sub_100027A00(os_log_type_t a1)
{
  unint64_t v4 = *(NSObject **)(v1 + 2952);
  return os_log_type_enabled(v4, a1);
}

uint64_t sub_100027A40()
{
  return v0;
}

void sub_100027A54(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= v1;
}

uint64_t sub_100027A68()
{
  return v0;
}

uint64_t sub_100027A74()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_100027A8C(uint64_t a1)
{
  *(void *)(v1 - 120) = a1;
  return v1 - 120;
}

uint64_t sub_100027AAC()
{
  return v0;
}

uint64_t sub_100027ACC()
{
  return swift_bridgeObjectRetain();
}

void sub_100027AEC()
{
}

void sub_100027B0C()
{
}

void sub_100027B2C(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0x16u);
}

uint64_t sub_100027B44()
{
  return sub_100028F10();
}

BOOL sub_100027B64(os_log_type_t a1)
{
  unint64_t v4 = *(NSObject **)(v1 + 2952);
  return os_log_type_enabled(v4, a1);
}

uint64_t sub_100027B84()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100027BA4()
{
  return swift_allocObject();
}

uint64_t sub_100027BBC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *(void *)(v4 - 152);
  return sub_10001EC50(v6, v3, a3);
}

uint64_t sub_100027BD4()
{
  return v0;
}

uint64_t sub_100027BE8()
{
  return v0 - 128;
}

uint64_t sub_100027C24@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_100027C64()
{
  return swift_arrayDestroy();
}

uint64_t sub_100027C7C()
{
  return v0;
}

uint64_t sub_100027C88()
{
  return v0;
}

uint64_t sub_100027C94()
{
  return v0;
}

uint64_t sub_100027CA0()
{
  return v0;
}

uint64_t sub_100027CAC()
{
  return v0;
}

uint64_t sub_100027CB8()
{
  return v0;
}

uint64_t sub_100027CC4()
{
  return v0;
}

BOOL sub_100027CD0()
{
  return os_log_type_enabled(v0, v1);
}

uint64_t sub_100027CE8()
{
  return v0;
}

uint64_t sub_100027CF4()
{
  return v0;
}

uint64_t sub_100027D00()
{
  return sub_100028AC0();
}

uint64_t sub_100027D18()
{
  return 0;
}

uint64_t sub_100027D24()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

double PPPosterEditingChromeDodgingInsetsForEditor(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    [v1 editingChromeDodgingInsets];
    double top = v2;
  }
  else
  {
    double top = UIEdgeInsetsZero.top;
  }

  return top;
}

id PPCreatePosterDescriptorGalleryOptions(void *a1)
{
  id v2 = a1;
  id v3 = [v2 posterType];
  if (v3 == (id)1)
  {
    BOOL v6 = [v2 descriptorType] == (id)3;
    double v7 = +[PRPosterDescriptorGalleryAssetLookupInfo defaultLookupInfo];
    id v1 = +[PRPosterDescriptorGalleryOptions galleryOptionsWithAssetLookupInfo:v7 galleryPresentationStyle:0 galleryDisplayStyle:v6];
  }
  else if (v3 == (id)2)
  {
    id v1 = +[PRPosterDescriptorGalleryOptions galleryOptionsWithAssetLookupInfo:0 galleryPresentationStyle:1];
  }
  else if (!v3)
  {
    uint64_t v4 = +[NSAssertionHandler currentHandler];
    uint64_t v5 = +[NSString stringWithUTF8String:"PRPosterDescriptorGalleryOptions * _Nonnull PPCreatePosterDescriptorGalleryOptions(PFPosterDescriptor *__strong _Nonnull)"];
    [v4 handleFailureInFunction:v5 file:@"PhotosPosterRuntimeAdditions.m" lineNumber:60 description:@"Undefined poster type"];

    abort();
  }

  return v1;
}

id PPGalleryOptionsForDescriptorType(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)ATXPosterDescriptorGalleryOptions);
  [v4 setAllowsSystemSuggestedComplications:0];
  [v4 setFeaturedConfidenceLevel:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int16 v5 = (unsigned __int16)[v3 suggestionSubtype] - 602;
    if (v5 <= 3u) {
      [v4 setPhotoSubtype:v5 + 1];
    }
  }
  switch(a1)
  {
    case 0:
      double v7 = +[NSAssertionHandler currentHandler];
      uint64_t v8 = +[NSString stringWithUTF8String:"ATXPosterDescriptorGalleryOptions * _Nonnull PPGalleryOptionsForDescriptorType(PFPosterDescriptorType, PFPosterMedia *__strong _Nonnull)"];
      [v7 handleFailureInFunction:v8 file:@"PhotosPosterRuntimeAdditions.m" lineNumber:92 description:@"Unknown descriptor type"];

      break;
    case 1:
    case 4:
      [v4 setFeaturedConfidenceLevel:1];
      [v4 setAllowsSystemSuggestedComplications:sub_100028420(v3)];
      CFStringRef v6 = @"PHOTOS_WALLPAPER_DESCRIPTOR_TITLE_FEATURED_PHOTO";
LABEL_15:
      [v4 setDisplayNameLocalizationKey:v6];
      break;
    case 2:
      [v4 setFeaturedConfidenceLevel:2];
      [v4 setAllowsSystemSuggestedComplications:sub_100028420(v3)];
      CFStringRef v9 = @"PHOTOS_WALLPAPER_DESCRIPTOR_TITLE_SMART_ALBUM";
LABEL_12:
      [v4 setDisplayNameLocalizationKey:v9];
      [v4 setShouldShowAsShuffleStack:1];
      break;
    case 3:
      [v4 setFeaturedConfidenceLevel:1];
      [v4 setAllowsSystemSuggestedComplications:sub_100028420(v3)];
      break;
    default:
      switch(a1)
      {
        case 'e':
          [v4 setHero:1];
          CFStringRef v6 = @"PHOTOS_WALLPAPER_DESCRIPTOR_CREATE_A_FACE_TITLE_PHOTOS";
          goto LABEL_15;
        case 'f':
          [v4 setHero:1];
          CFStringRef v9 = @"PHOTOS_WALLPAPER_DESCRIPTOR_CREATE_A_FACE_TITLE_SHUFFLE";
          goto LABEL_12;
        case 'g':
          [v4 setHero:1];
          CFStringRef v6 = @"PHOTOS_WALLPAPER_DESCRIPTOR_CREATE_A_FACE_TITLE_PEOPLE";
          goto LABEL_15;
        case 'h':
          [v4 setHero:1];
          CFStringRef v6 = @"PHOTOS_WALLPAPER_DESCRIPTOR_CREATE_A_FACE_TITLE_LIVE_PHOTO";
          goto LABEL_15;
        default:
          goto LABEL_16;
      }
  }
LABEL_16:

  return v4;
}

unint64_t sub_100028420(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v2 = [v1 suggestionSubtype];
    if (v2 - 604 <= 0x33) {
      unint64_t v3 = (0xC000000000003uLL >> (v2 - 92)) & 1;
    }
    else {
      unint64_t v3 = 0;
    }
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

id PPCreateTimeFontConfiguration(void *a1, void *a2)
{
  id v3 = a1;
  LODWORD(a2) = [a2 isEqualToString:PRPosterRoleIncomingCall];
  unsigned __int8 v4 = [v3 isEqualToString:PUPosterFontIdentifierRounded];
  if (!a2)
  {
    if (v4)
    {
      unsigned __int16 v5 = (id *)&PRTimeFontIdentifierRounded;
      goto LABEL_18;
    }
    if ([v3 isEqualToString:PUPosterFontIdentifierSoft])
    {
      unsigned __int16 v5 = (id *)&PRTimeFontIdentifierSoft;
      goto LABEL_18;
    }
    if ([v3 isEqualToString:PUPosterFontIdentifierSlab])
    {
      unsigned __int16 v5 = (id *)&PRTimeFontIdentifierSlab;
      goto LABEL_18;
    }
    if ([v3 isEqualToString:PUPosterFontIdentifierStencil])
    {
      unsigned __int16 v5 = (id *)&PRTimeFontIdentifierStencil;
      goto LABEL_18;
    }
    if ([v3 isEqualToString:PUPosterFontIdentifierRail])
    {
      unsigned __int16 v5 = (id *)&PRTimeFontIdentifierRail;
      goto LABEL_18;
    }
    if ([v3 isEqualToString:PUPosterFontIdentifierNewYork])
    {
      unsigned __int16 v5 = (id *)&PRTimeFontIdentifierNewYork;
      goto LABEL_18;
    }
    if ([v3 isEqualToString:PUPosterFontIdentifierNewYorkHeavy])
    {
      unint64_t v10 = (id *)&PRTimeFontIdentifierNewYork;
      goto LABEL_32;
    }
    unint64_t v11 = PLWallpaperGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unexpected font identifier: %@", (uint8_t *)&v12, 0xCu);
    }
    unsigned __int16 v5 = (id *)&PRTimeFontIdentifierRounded;
LABEL_39:

    goto LABEL_18;
  }
  if (v4)
  {
    unsigned __int16 v5 = (id *)&PRTimeFontIdentifierSFRounded;
LABEL_18:
    id v6 = *v5;
    id v7 = [objc_alloc((Class)PRTimeFontConfiguration) initWithTimeFontIdentifier:v6];
    goto LABEL_19;
  }
  if ([v3 isEqualToString:PUPosterFontIdentifierSoft])
  {
LABEL_9:
    unsigned __int16 v5 = (id *)&PRTimeFontIdentifierSFPro;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:PUPosterFontIdentifierSlab]) {
    goto LABEL_17;
  }
  if ([v3 isEqualToString:PUPosterFontIdentifierStencil]) {
    goto LABEL_9;
  }
  if ([v3 isEqualToString:PUPosterFontIdentifierRail])
  {
LABEL_17:
    unsigned __int16 v5 = (id *)&PRTimeFontIdentifierSFCondensed;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:PUPosterFontIdentifierNewYork])
  {
    unsigned __int16 v5 = (id *)&PRTimeFontIdentifierNewYorkAlpha;
    goto LABEL_18;
  }
  if (([v3 isEqualToString:PUPosterFontIdentifierNewYorkHeavy] & 1) == 0)
  {
    unint64_t v11 = PLWallpaperGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unexpected font identifier: %@", (uint8_t *)&v12, 0xCu);
    }
    unsigned __int16 v5 = (id *)&PRTimeFontIdentifierSFRounded;
    goto LABEL_39;
  }
  unint64_t v10 = (id *)&PRTimeFontIdentifierNewYorkAlpha;
LABEL_32:
  id v6 = *v10;
  id v7 = [objc_alloc((Class)PRTimeFontConfiguration) initWithTimeFontIdentifier:v6 weight:810.0];
LABEL_19:
  uint64_t v8 = v7;

  return v8;
}

id PPPosterRenderingEnvironmentIsLowLuminance(void *a1)
{
  return _[a1 isLowLuminance];
}

uint64_t PPPosterEnvironmentIsCallServices(void *a1)
{
  id v1 = [a1 role];
  unsigned __int8 v2 = [v1 isEqualToString:PRPosterRoleIncomingCall];

  if (v2) {
    return 1;
  }
  unsigned __int8 v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 BOOLForKey:@"PI_PARALLAX_EMULATE_CALLSERVICES"];

  return (uint64_t)v5;
}

id PPPosterTitleBoundsForLayout(void *a1, uint64_t a2)
{
  return _[a1 titleBoundsForLayout:a2];
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

PPPosterOverrideConfiguration *PPPosterOverrideConfigurationFromConfiguration(void *a1)
{
  id v1 = [a1 loadUserInfoWithError:0];
  if (v1)
  {
    id v2 = objc_alloc(NSClassFromString(@"WFWallpaperConfiguration"));
    id v3 = [v2 performSelector:NSSelectorFromString(@"initWithUserInfo:") withObject:v1];

    if (v3) {
      unsigned __int8 v4 = [[PPPosterOverrideConfiguration alloc] initWithWFWallpaperConfiguration:v3];
    }
    else {
      unsigned __int8 v4 = 0;
    }
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

PPPosterOverrideConfiguration *PPPosterOverrideConfigurationFromSessionInfo(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    id v2 = [v1 shortcutsWallpaperConfiguration];
    if (v2) {
      id v3 = [[PPPosterOverrideConfiguration alloc] initWithWFWallpaperConfiguration:v2];
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

uint64_t PPPosterLegacyConfigurationTypeFromSessionInfo(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    id v2 = [v1 userInfo];
    id v3 = [v2 objectForKeyedSubscript:@"SBLegacyWallpaperMigrationType"];
    unsigned int v4 = [v3 isEqualToString:@"home"];

    if (v4) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t sub_100028AB0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100028AC0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100028AD0()
{
  return URL.relativeString.getter();
}

uint64_t sub_100028AE0()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

void sub_100028AF0(NSURL *retstr@<X8>)
{
}

uint64_t sub_100028B00()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_100028B10()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_100028B20()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100028B30(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_100028B40()
{
  return URL.path.getter();
}

uint64_t sub_100028B50()
{
  return type metadata accessor for URL();
}

uint64_t sub_100028B60()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100028B70()
{
  return UUID.init()();
}

uint64_t sub_100028B80()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100028B90()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_100028BA0()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100028BB0()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100028BC0()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_100028BD0()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100028BE0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100028BF0()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_100028C00()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_100028C10()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_100028C20()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_100028C30()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100028C40()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_100028C50()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100028C60()
{
  return PRRenderingConfiguration.init(_:)();
}

NSDictionary sub_100028C70()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100028C80()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100028C90()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100028CA0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_100028CB0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100028CC0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100028CD0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100028CE0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100028CF0()
{
  return String.hash(into:)();
}

uint64_t sub_100028D00()
{
  return String.count.getter();
}

void sub_100028D10(Swift::String a1)
{
}

Swift::Int sub_100028D20()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100028D30()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100028D40()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100028D50()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100028D60()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100028D70()
{
  return Array.description.getter();
}

uint64_t sub_100028D80()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100028D90()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100028DA0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100028DB0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100028DC0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100028DD0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100028DE0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100028DF0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100028E00()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100028E10()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_100028E20()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_100028E30()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100028E40()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100028E50()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_100028E60()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100028E70()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100028E80()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100028E90()
{
  return static os_log_type_t.default.getter();
}

void sub_100028EA0()
{
}

uint64_t sub_100028EB0()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_100028EC0()
{
  return static os_signpost_type_t.begin.getter();
}

NSNumber sub_100028ED0(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber sub_100028EE0(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_100028EF0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100028F00()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100028F10()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100028F20()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100028F30()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100028F40()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_100028F50(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100028F60()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100028F70()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100028F80()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100028F90()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100028FA0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100028FB0(Swift::Int a1)
{
}

uint64_t sub_100028FC0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100028FD0()
{
  return StaticString.description.getter();
}

uint64_t sub_100028FE0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100028FF0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100029000()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100029010()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100029020()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100029030()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100029040()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100029050()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

BOOL sub_100029060(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_100029070()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_100029080()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100029090()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000290A0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000290B0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000290C0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_1000290F0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100029100()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100029120()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100029130()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100029140()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100029150()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100029160()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100029170()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100029180()
{
  return Error._code.getter();
}

uint64_t sub_100029190()
{
  return Error._domain.getter();
}

uint64_t sub_1000291A0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000291B0()
{
  return Hasher.init(_seed:)();
}

void sub_1000291C0(Swift::UInt a1)
{
}

Swift::Int sub_1000291D0()
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

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t PFDefaultParallaxStyleKindForCategory()
{
  return _PFDefaultParallaxStyleKindForCategory();
}

uint64_t PFParallaxStyleFrequencyTable()
{
  return _PFParallaxStyleFrequencyTable();
}

uint64_t PHSuggestionStringWithSubtype()
{
  return _PHSuggestionStringWithSubtype();
}

uint64_t PIParallaxStyleClockFontForKind()
{
  return _PIParallaxStyleClockFontForKind();
}

uint64_t PIParallaxStylePrefersVibrantClockForKind()
{
  return _PIParallaxStylePrefersVibrantClockForKind();
}

uint64_t PLIsFeaturedContentAllowed()
{
  return _PLIsFeaturedContentAllowed();
}

uint64_t PLWallpaperGetLog()
{
  return _PLWallpaperGetLog();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void abort(void)
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

void free(void *a1)
{
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_assetIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 assetIdentifier];
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return _[a1 assetURL];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_boundingShape(void *a1, const char *a2, ...)
{
  return _[a1 boundingShape];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_defaultLookupInfo(void *a1, const char *a2, ...)
{
  return _[a1 defaultLookupInfo];
}

id objc_msgSend_descriptorType(void *a1, const char *a2, ...)
{
  return _[a1 descriptorType];
}

id objc_msgSend_editingChromeDodgingInsets(void *a1, const char *a2, ...)
{
  return _[a1 editingChromeDodgingInsets];
}

id objc_msgSend_galleryOptionsWithAssetLookupInfo_galleryPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "galleryOptionsWithAssetLookupInfo:galleryPresentationStyle:");
}

id objc_msgSend_galleryOptionsWithAssetLookupInfo_galleryPresentationStyle_galleryDisplayStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "galleryOptionsWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_initWithTimeFontIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeFontIdentifier:");
}

id objc_msgSend_initWithTimeFontIdentifier_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeFontIdentifier:weight:");
}

id objc_msgSend_initWithWFWallpaperConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWFWallpaperConfiguration:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_loadUserInfoWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadUserInfoWithError:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_posterType(void *a1, const char *a2, ...)
{
  return _[a1 posterType];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_setAllowsSystemSuggestedComplications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsSystemSuggestedComplications:");
}

id objc_msgSend_setDisplayNameLocalizationKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayNameLocalizationKey:");
}

id objc_msgSend_setFeaturedConfidenceLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeaturedConfidenceLevel:");
}

id objc_msgSend_setHero_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHero:");
}

id objc_msgSend_setPhotoSubtype_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhotoSubtype:");
}

id objc_msgSend_setShouldShowAsShuffleStack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldShowAsShuffleStack:");
}

id objc_msgSend_shortcutsWallpaperConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 shortcutsWallpaperConfiguration];
}

id objc_msgSend_smartCrop(void *a1, const char *a2, ...)
{
  return _[a1 smartCrop];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_suggestionSubtype(void *a1, const char *a2, ...)
{
  return _[a1 suggestionSubtype];
}

id objc_msgSend_usePreview(void *a1, const char *a2, ...)
{
  return _[a1 usePreview];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_wallpaperConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 wallpaperConfiguration];
}