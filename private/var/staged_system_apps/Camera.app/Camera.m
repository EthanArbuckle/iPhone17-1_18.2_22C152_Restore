uint64_t start()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void v8[5];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  id location;

  v1 = +[NSNotificationCenter defaultCenter];
  objc_initWeak(&location, v1);

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_100001FDC;
  v14 = sub_100001FEC;
  v15 = 0;
  v2 = objc_loadWeakRetained(&location);
  v3 = +[NSOperationQueue mainQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100001FF4;
  v8[3] = &unk_1000042F0;
  objc_copyWeak(&v9, &location);
  v8[4] = &v10;
  v4 = [v2 addObserverForName:@"CAMRegisterAppShortcuts" object:0 queue:v3 usingBlock:v8];
  v5 = (void *)v11[5];
  v11[5] = v4;

  v6 = CAMApplicationMain();
  objc_destroyWeak(&v9);
  _Block_object_dispose(&v10, 8);

  objc_destroyWeak(&location);
  return v6;
}

void sub_100001FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_100001FDC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100001FEC(uint64_t a1)
{
}

void sub_100001FF4(uint64_t a1)
{
  v3 = objc_alloc_init(_TtC6Camera28CameraAppShortcutsController);
  [(CameraAppShortcutsController *)v3 registerAppShortcutsIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

id sub_1000020D8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraAppShortcutsController();
  [super dealloc];
}

uint64_t type metadata accessor for CameraAppShortcutsController()
{
  return self;
}

unint64_t sub_100002130()
{
  unint64_t result = qword_1000081F0;
  if (!qword_1000081F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000081F0);
  }
  return result;
}

uint64_t sub_100002184()
{
  sub_1000021EC(&qword_1000081F8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100003820;
  unint64_t v1 = sub_100002230();
  *(void *)(v0 + 32) = &type metadata for CameraUIAppIntents;
  *(void *)(v0 + 40) = v1;
  return v0;
}

ValueMetadata *type metadata accessor for CameraAppIntents()
{
  return &type metadata for CameraAppIntents;
}

uint64_t sub_1000021EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002230()
{
  unint64_t result = qword_100008200;
  if (!qword_100008200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008200);
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraAppShortcuts()
{
  return &type metadata for CameraAppShortcuts;
}

uint64_t sub_10000229C()
{
  uint64_t v60 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v65 = *(void *)(v60 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v63 = (char *)v45 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale();
  ((void (*)(void))__chkstk_darwin)();
  v62 = (char *)v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for String.LocalizationValue();
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LocalizedStringResource();
  ((void (*)(void))__chkstk_darwin)();
  v61 = (char *)v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppShortcut();
  uint64_t v59 = v5;
  uint64_t v64 = *(void *)(v5 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t started = OpenCaptureModeIntent.init()();
  sub_1000021EC(&qword_100008208);
  sub_1000021EC(&qword_100008210);
  uint64_t v8 = swift_allocObject();
  long long v55 = xmmword_100003820;
  *(_OWORD *)(v8 + 16) = xmmword_100003820;
  sub_1000021EC(&qword_100008218);
  ((void (*)(void))__chkstk_darwin)();
  sub_1000031D8();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v9);
  swift_getKeyPath();
  sub_1000021EC(&qword_100008228);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v10);
  AppShortcutPhrase.init(stringInterpolation:)();
  unint64_t v51 = 0xD000000000000025;
  v56 = v3;
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  unsigned int v54 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v58 = *(void (**)(char *))(v65 + 104);
  v65 += 104;
  v58(v63);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  uint64_t v48 = 0xD000000000000012;
  v57 = v7;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)();
  uint64_t v11 = static AppShortcutsBuilder.buildExpression(_:)();
  v12 = *(void (**)(char *, uint64_t))(v64 + 8);
  uint64_t v52 = v11;
  v53 = v12;
  v64 += 8;
  v12(v7, v5);
  uint64_t started = StartCaptureIntent.init()();
  uint64_t v67 = v13;
  uint64_t v68 = v14;
  sub_1000021EC(&qword_100008230);
  uint64_t v47 = 2 * *(void *)(*(void *)(sub_1000021EC(&qword_100008238) - 8) + 72);
  uint64_t v15 = swift_allocObject();
  long long v50 = xmmword_100003880;
  uint64_t v49 = v15;
  *(_OWORD *)(v15 + 16) = xmmword_100003880;
  sub_1000021EC(&qword_100008240);
  ((void (*)(void))__chkstk_darwin)();
  sub_10000324C();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v16._countAndFlagsBits = 0x206120656B6154;
  v16._object = (void *)0xE700000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v16);
  swift_getKeyPath();
  sub_1000021EC(&qword_100008250);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v17);
  uint64_t v18 = AppShortcutPhrase.init(stringInterpolation:)();
  __chkstk_darwin(v18);
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v19._countAndFlagsBits = 0x612064726F636552;
  v19._object = (void *)0xE900000000000020;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v19);
  swift_getKeyPath();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v20);
  uint64_t v21 = AppShortcutPhrase.init(stringInterpolation:)();
  __chkstk_darwin(v21);
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v22._object = (void *)0x8000000100003A70;
  v22._countAndFlagsBits = v48;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v22);
  swift_getKeyPath();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v23);
  AppShortcutPhrase.init(stringInterpolation:)();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  uint64_t v24 = v54;
  uint64_t v25 = v60;
  ((void (*)(char *, void, uint64_t))v58)(v63, v54, v60);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  uint64_t v48 = 0xD00000000000001ALL;
  uint64_t v47 = 0x8000000100003AC0;
  v26 = v57;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)();
  uint64_t v49 = static AppShortcutsBuilder.buildExpression(_:)();
  v27 = v53;
  v53(v26, v59);
  uint64_t started = ChangeCameraDeviceIntent.init()();
  sub_1000021EC(&qword_100008258);
  sub_1000021EC(&qword_100008260);
  *(_OWORD *)(swift_allocObject() + 16) = v55;
  uint64_t v28 = sub_1000021EC(&qword_100008268);
  __chkstk_darwin(v28);
  sub_1000032C8();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v29);
  swift_getKeyPath();
  sub_1000021EC(&qword_100008278);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  v30._countAndFlagsBits = 0x6172656D616320;
  v30._object = (void *)0xE700000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v30);
  AppShortcutPhrase.init(stringInterpolation:)();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  ((void (*)(char *, uint64_t, uint64_t))v58)(v63, v24, v25);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  v45[1] = 0x8000000100003B10;
  v31 = v57;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)();
  uint64_t v46 = static AppShortcutsBuilder.buildExpression(_:)();
  v32 = v31;
  uint64_t v33 = v59;
  v27(v32, v59);
  sub_1000021EC(&qword_100008280);
  sub_1000021EC(&qword_100008288);
  *(_OWORD *)(swift_allocObject() + 16) = v55;
  sub_10000333C();
  AppShortcutPhrase.init(stringLiteral:)();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  uint64_t v34 = v25;
  v35 = v58;
  ((void (*)(char *, uint64_t, uint64_t))v58)(v63, v24, v34);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  v36 = v57;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)();
  *(void *)&long long v55 = static AppShortcutsBuilder.buildExpression(_:)();
  uint64_t v37 = v33;
  v38 = v53;
  v53(v36, v37);
  sub_1000021EC(&qword_100008298);
  sub_1000021EC(&qword_1000082A0);
  *(_OWORD *)(swift_allocObject() + 16) = v50;
  sub_100003384();
  AppShortcutPhrase.init(stringLiteral:)();
  AppShortcutPhrase.init(stringLiteral:)();
  AppShortcutPhrase.init(stringLiteral:)();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  ((void (*)(char *, void, uint64_t))v35)(v63, v54, v60);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)();
  uint64_t v39 = static AppShortcutsBuilder.buildExpression(_:)();
  v38(v36, v59);
  sub_1000021EC(&qword_1000082B0);
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_100003890;
  uint64_t v41 = v49;
  *(void *)(v40 + 32) = v52;
  *(void *)(v40 + 40) = v41;
  uint64_t v42 = v55;
  *(void *)(v40 + 48) = v46;
  *(void *)(v40 + 56) = v42;
  *(void *)(v40 + 64) = v39;
  uint64_t v43 = static AppShortcutsBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease();
  return v43;
}

unint64_t sub_1000031D8()
{
  unint64_t result = qword_100008220;
  if (!qword_100008220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008220);
  }
  return result;
}

uint64_t sub_100003220@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = OpenCaptureModeIntent.$target.getter();
  *a1 = result;
  return result;
}

unint64_t sub_10000324C()
{
  unint64_t result = qword_100008248;
  if (!qword_100008248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008248);
  }
  return result;
}

uint64_t sub_100003294@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = StartCaptureIntent.$captureMode.getter();
  *a1 = result;
  return result;
}

unint64_t sub_1000032C8()
{
  unint64_t result = qword_100008270;
  if (!qword_100008270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008270);
  }
  return result;
}

uint64_t sub_100003310@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ChangeCameraDeviceIntent.$device.getter();
  *a1 = result;
  return result;
}

unint64_t sub_10000333C()
{
  unint64_t result = qword_100008290;
  if (!qword_100008290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008290);
  }
  return result;
}

unint64_t sub_100003384()
{
  unint64_t result = qword_1000082A8;
  if (!qword_1000082A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000082A8);
  }
  return result;
}

uint64_t sub_1000033CC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t AppShortcutPhrase.init(stringLiteral:)()
{
  return AppShortcutPhrase.init(stringLiteral:)();
}

uint64_t AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)()
{
  return AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
}

Swift::Void __swiftcall AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t AppShortcutPhrase.init(stringInterpolation:)()
{
  return AppShortcutPhrase.init(stringInterpolation:)();
}

uint64_t static AppShortcutsBuilder.buildBlock(_:)()
{
  return static AppShortcutsBuilder.buildBlock(_:)();
}

uint64_t static AppShortcutsBuilder.buildExpression(_:)()
{
  return static AppShortcutsBuilder.buildExpression(_:)();
}

uint64_t static AppShortcutsProvider.updateAppShortcutParameters()()
{
  return static AppShortcutsProvider.updateAppShortcutParameters()();
}

uint64_t static AppShortcutsProvider.shortcutTileColor.getter()
{
  return static AppShortcutsProvider.shortcutTileColor.getter();
}

uint64_t AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)()
{
  return AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)();
}

uint64_t type metadata accessor for AppShortcut()
{
  return type metadata accessor for AppShortcut();
}

uint64_t type metadata accessor for LocalizedStringResource.BundleDescription()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t LocalizedStringResource.init(_:table:locale:bundle:comment:)()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t ChangeCameraDeviceIntent.$device.getter()
{
  return ChangeCameraDeviceIntent.$device.getter();
}

uint64_t ChangeCameraDeviceIntent.init()()
{
  return ChangeCameraDeviceIntent.init()();
}

uint64_t StartCaptureIntent.$captureMode.getter()
{
  return StartCaptureIntent.$captureMode.getter();
}

uint64_t StartCaptureIntent.init()()
{
  return StartCaptureIntent.init()();
}

uint64_t OpenCaptureModeIntent.$target.getter()
{
  return OpenCaptureModeIntent.$target.getter();
}

uint64_t OpenCaptureModeIntent.init()()
{
  return OpenCaptureModeIntent.init()();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t CAMApplicationMain()
{
  return _CAMApplicationMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_registerAppShortcutsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 registerAppShortcutsIfNeeded];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}